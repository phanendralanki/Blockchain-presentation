<%-- 
    Document   : Register
    Created on : 04-Nov-2022, 10:44:49 pm
    Author     : phane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
        
        
        <!-- Compiled and minified JavaScript -->
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>     
        
        
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
            <h2>Register Here</h2>
        </div>
             <form action="registerservlet" class="form" id="form" method="post">
            <div class="field">
                <label for="username">UserName</label>
                <input type="text" name="user_name" id="uname" placeholder="Enter your name"> <br>
                <span class="material-icons success">*</span>
                <span class="material-icons error">!</span>
                <small>Error message</small>
            </div>
            <div class="field">
                <label for="email">Email</label>
                <input type="email" name="user_email" id="email" placeholder="Email@gmail.com"><br>
                <span class="material-icons success">*</span>
                <span class="material-icons error">!</span>
                <small>Error message</small>
            </div>
            <div class="field">
                <label for="mobile number">Mobile Number</label>
                <input type="number" name="mobile" id="phone" placeholder="Enter your Phone Number"><br>
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
                <label for="confirm password">Confirm password</label>
                <input type="password" name="cpassword" id="cpassword" placeholder="Enter password again"><br>
                <span class="material-icons success">*</span>
                <span class="material-icons error">!</span>
                <small>Error message</small>
            </div>
            <div class="field">
                <input type="checkbox" name="agree" id="tc" class="terms">
                <label for="terms">I agree to terms and conditions</label><br><br>
                <small>Error message</small>
                
            </div>
            <div class="field">
                <input type="submit" value="submit" class="button">
            </div>
            <div class="loginform">
                <a href="Login.jsp">If you're already registered</a>
            </div>

           
        </form>
             
              

    </div>
        
         <!--jquery CDN-->
        <!--jquery library-->
        <script
            src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous"></script>
        
        <!--To check whether the jquery is working or not--> 
        
        <script>
            
            $(document).ready(function (){
                
                console.log("page is ready.....");
                
                //To catch the form using AJAX JQuery
                //catch the form with id given in form
                
                /* Grabbing section */
                //grab the form with #myform (id of the form)
                //submit the form or call the event by on('submit')
                //when we submit the form we will get the object of the event 
                
                $("#myform").on('submit',function(event){
                    //to stop this form going to the next servlet(next page)
                    event.preventDefault();         
                    
                    //To get all the details of our form 
                    //this means our form i.e %myform the Grabbing section
                    //serialize our object
                    
                    var f = $(this).serialize();
                    
                    
                    //.serialize() means our form will converts completely into string in the elements 
                    //will be in the form of key value pairs
                    
                    /***** 22. uploading file     *****/
                     /* if we have only the text data we can use serialize*/
                     /* but if we have images to be taken then we create an object*/
                     
                     let f = new FormDate(this);
                    
                    console.log(f);
                    
                    /*To show the loader that we added */
                    /*loader will be added after entering the data by clicking the submit button */
                    
                    /*
                     * 
                     *  
                     *  Loader Code   
                     *  
                     *     
                     *      
                     */
                    
                    $(".loader").show();
                    
                    //To show the loader in the form logic is written in Register Servlet
                    
                     /*
                     * 
                     *  
                     *  Loader Code   
                     *  
                     *     
                     *   
                     */
                         
                   /* To Hide the Form */
                         /* 
                          * 
                          * Code for Hiding the Registration Form
                          * 
                          * */
                         
                     $(".form").hide();
                         
                          /* 
                          * 
                          * Code for Hiding the Registration Form
                          * 
                          * */
                    
                    //Ajax request
                    //pass the object of JavaScript
                    $.ajax({
                        url: "Register",
                        data: f,
                        type: 'POST',
                        
                        /* if the form is succesfully submitted*/
                        
                        success: function(data,textStatus,jqXHR){
                            console.log(data);
                            console.log("success...........");
                            
                            /* for showing form again after submitting  */
                            
//                            $(".loader").hide();
//                            $(".form").show();
                            
                            //To check the data is stored or not 
                            if(data.trim()==='done')
                            {
                                $('#msg').html("successfully Registered.....");
                                
                                /* To make text green after successfully registered */
                                
                                $("#msg").addClass('green-text');
                                
                            }else
                            {
                                $('#msg').html("Something went wrong on server.....");
                                
                               /* To make text error after getting any error */
                               
                                 $("#msg").addClass('red-text');
                                 
                            }
                            
                        },
                        /* If the form has any problem to submit or to store the data */
                        error: function(jqXHR, textStatus, errorThrown){
                            console.log(data);
                            console.log("error.............");
                            
                             /* for showing form again after submitting  */
                            
//                            $(".loader").hide();
//                            $(".form").show();
//                            
                            $('#msg').html("Something went wrong on server.....");
                            
                             /* To make text error after getting any error */
                               
                                 $("#msg").addClass('red-text');
                        }
                    });
                    
                    
                });
                
            });
            
        </script>
    </body>
</html>
