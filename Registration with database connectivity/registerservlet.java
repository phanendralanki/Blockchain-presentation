/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;

//For JDBC 
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
import jdk.vm.ci.code.Register;



/**
 *
 * @author phane
 */

public class registerservlet extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {
          response.setContentType("text/html;charset=UTF-8");
        try ( 
                PrintWriter out = response.getWriter())
        {
            /* TODO output your page here. You may use following sample code. */
            
            /*
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            */
            
            //To fetch the submitted data from Registration Form
            //getting all the incoming details from the request...
  
            String user_name = request.getParameter("user_name");
            
            String user_email = request.getParameter("user_email");
            
            String mobile = request.getParameter("mobile");
            
            String user_password = request.getParameter("user_password");
            
            String cpassword = request.getParameter("cpassword");
            

            
            //To get the data or to check the data is getting stored or not
            /*
            
            out.println(user_name);
            out.println(user_email);
            out.println(mobile);
            out.println(user_password);
            */
            
            //for data storing - JDBC Connection 
            //1.Connection
            //step-1
            //Load the class Driver  - class Not found Exception so we use try block
            
            Connection con = null;
            
            try{
                
                /* For loading the Loader for 3 seconds*/  
                Thread.sleep(3000);
                
                
            Class.forName("com.mysql.jdbc.Driver");
            
            //connection
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginpage","root","user");     //create con outside the try block
            
             //2.query......
             
             String q = "insert into user(user_name,user_email,mobile,user_password) values(?,?,?,?)";
             
             //Create a PreparedStatement object using PreparedStatement class
             
             PreparedStatement pstmt = con.prepareStatement(q);
             
             //access the properties with PreparedStatement class Object = pstmt
             
             pstmt.setString(1,user_name);
             
             
             pstmt.setString(2,user_email);
             
             pstmt.setString(3,mobile);
             
             pstmt.setString(4, user_password);
             
              //3.Execution....
              pstmt.executeUpdate();
              
//              out.println("<h1>done.......</h1>");
                out.println("done");
              
              /* Closing the connection */
              con.close();
             
            }catch(ClassNotFoundException | SQLException e)
            {
//                out.println("<h1>error.......</h1>");
                out.println("error");
            }
            

//            out.println("</body>");
//            out.println("</html>");

    }
            
    
    

    }
       // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
