<?php 
session_start();
ini_set('memory_limit', '-1');
$userlogin=$_SESSION['farmer_login_user'];
$servername="localhost";
$username="root";
$password="";
$dbname="pigs_portal";


//Create Connection 
$conn =mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if(isset($_POST['Pig_submit'])){
    $x=0.0;
    $y=0;
    $trade_Pig=$_POST['pigs'];
    $quantity=$_POST['trade_farmer_Pigquantity'];
    $costperkg=$_POST['trade_farmer_cost'];

    
    $query1="SELECT farmer_id from farmerlogin where email='".$userlogin."';";
    $run = mysqli_query($conn,$query1);
    $row=mysqli_fetch_array($run);
    $farmer_pid= $row[0];
    
    $query2="INSERT INTO `farmer_pigs_trade`(`farmer_fkid`, `Trade_Pig`, `Pig_quantity`,`costperkg`) 
    VALUES ($farmer_pid,'$trade_Pig', $quantity, $costperkg);";
    $result = mysqli_query($conn, $query2);


    $query="SELECT costperkg from farmer_pigs_trade where Trade_Pig='$trade_Pig'";
    $result = mysqli_query($conn, $query);
    while($row = $result->fetch_assoc()) {
        $x=$x+$row["costperkg"];
        $y++;
    }

    $x=CEIL($x/$y);
    $x=$x+CEIL($x*0.5);

    $query3="UPDATE farmer_pigs_trade SET msp='$x' where Trade_Pig='$trade_Pig'";
    $result = mysqli_query($conn, $query3);


    $query4= "UPDATE production_approx SET quantity=quantity+'$quantity' where Pig='$trade_Pig'";
    $result = mysqli_query($conn, $query4);

    header("location:../tradepigs.php?");

}

?>