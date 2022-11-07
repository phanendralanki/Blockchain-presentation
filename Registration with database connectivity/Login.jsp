<%-- 
    Document   : Login
    Created on : 04-Nov-2022, 11:14:11 pm
    Author     : phane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            *{
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    outline: none;
}

body{
    display: flex;
    /* center horizantally */
    justify-content: center;        
    /* centers vertically */
     align-items: center;
    background-color: #607680;
    min-height: 100vh;
    margin: 0;
} 

/* white color will be applied for only container because of display:flex property */
 .container{
    background-color: white;
    border-radius: 5px;
    width: 400px;
    max-width: 100%;
    outline: none;
} 

 .header{
    background-color: #f7f7f7;
    padding: 20px 40px;
    border-bottom: 1px solid #f0f0f0;
} 

.header h2{
    margin: 0;
} 

 .form{
    padding: 30px 40px;
}

.field{
    margin-bottom:2px;
    padding-bottom: 5px;
    position: relative;
    
} 

/* label tag is a block tag (defaultly) so I assigned display as :inline-block so that we can add margin and padding*/
 .field label{
    display: inline-block;
    margin-bottom: 5px;
} 
.field input:not(.terms){
    display: block;
    border-radius: 4px;
    border: 2px solid #f0f0f0;
    font-size: 14px;
    width: 100%;
    padding: 10px;
}

.field span{
    position: absolute;
    top: 30px;
    right: 10px;
    visibility: hidden;
}

.field small{
    position: absolute;
    bottom: 0px;
    left: 0;
    visibility: hidden;
}

.form .button{
    background-color: rgb(90,104,235);
    border: 2px solid rgb(90,104,235);
    color: white;
    padding: 10px;
    /* block so that it will go to the new line */
    display: block;
    width: 100%;
    font-size: 16px;
}

.field.success input{
    border-color:#2ecc71;
}

.field.error input{
    border-color: #e74c3c;
}

.field.success span.success{
    color: #2ecc71;
    visibility: visible;
}

.field.error span.error{
    color: #e74c3c;
    visibility: visible;
}

.field.error span.success{
    visibility: none;
}

.field.success span.error{
    visibility: none;
}

.field.error small{
    visibility: visible;
    color: #e74c3c;
}
        </style>
    </head>
    <body>
       
          <div class="container">
        <div class="header">
            <h2>Login Here</h2>
        </div>
              <form action="loginservlet" class="form" id="form" method="post">
                  <div class="field">
                <label for="email">Email</label>
                <input type="email" name="user_email" id="email" placeholder="Email@gmail.com"><br>
                <span class="material-icons success">*</span>
                <span class="material-icons error">!</span>
                <small>Error message</small>
            </div>
                  
                   <div class="field">
                <label for="password">Password</label>
                <input type="password" name="user_password" id="password" placeholder="Enter your password"><br>
                <span class="material-icons success">*</span>
                <span class="material-icons error">!</span>
                <small>Error message</small>
            </div>
                  
                   <div class="field">
                <input type="submit" value="submit" class="button">
            </div>
                  
                  
              <div class="Registrationform">
                <a href="Register.jsp">If you're not registered</a>
            </div>
        </form>
              </div>
    </body>
</html>
