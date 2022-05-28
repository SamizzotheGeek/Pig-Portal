<?php
session_start();
$servername="localhost";
$username="root";
$password="";
$dbname="pigs_portal";
$conn = mysqli_connect($servername, $username, $password, $dbname);

//echo("connection");
if(isset($_POST['farmer_email'])) {
  $farmer_email=$_POST['farmer_email'];
  $farmers_password=$_POST['farmer_password'];
  $farmer_password=SHA1($farmers_password);


  $farmerquery = "SELECT * from `farmerlogin` where email='".$farmer_email."' and password='".$farmer_password."' ";
  $result = mysqli_query($conn, $farmerquery);
  $rowcount=mysqli_num_rows($result);
  if ($rowcount==true) {
    $_SESSION['farmer_login_user']=$farmer_email; // Initializing Session
    

    header("location: ../farmer_index.php"); // Redirecting To Other Page
    } 
    else {
    //echo "<script language='javascript'>alert('Username or Password is invalid');</script>"; 
    }
    
    
}


if(isset($_POST['cust_email'])) {

    $customer_email=$_POST['cust_email'];
    $pass=$_POST['cust_password'];
    $customer_password=SHA1($pass);

    $checkquery = "SELECT * from `custlogin` where email='".$customer_email."' and password='".$customer_password."' ";
    $result = mysqli_query($conn, $checkquery);
    $rowcount=mysqli_num_rows($result);
    if ($rowcount==true) {
      $_SESSION['customer_login_user']=$customer_email; // Initializing Session

      $deletequery="DELETE FROM cart";
      $deletecart=mysqli_query($conn,$deletequery);
      header("location: ../customer_index.php"); // Redirecting To Other Page
      } 
      else {
        //echo "<script language='javascript'>alert('Username or Password is invalid');</script>"; 
      }
      
      
  }

 

?>