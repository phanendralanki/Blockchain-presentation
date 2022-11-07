/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.catalina.User;




/**
 *
 * @author phane
 */


public class loginservlet extends HttpServlet {

    
    protected User processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (
            PrintWriter out = response.getWriter())
        {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet loginservlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
            
            String user_email = request.getParameter("user_email");
            
            String user_password = request.getParameter("user_password");
            
            HttpSession session = request.getSession();
            
//            Request Dispatcher 
        RequestDispatcher dispatcher = null;
            
            //JDBC CODE
            //Step-1 Load the Driver
            
             //To store the result in the form of object
               
                
            Connection con = null;
            try{
                
               
                
                 Class.forName("com.mysql.jdbc.Driver");
            
            //connection
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginpage","root","user");     //create con outside the try block
            
             
            
            //Create a PreparedStatement object using PreparedStatement class
             
             PreparedStatement pstmt = con.prepareStatement("select *from user where user_email=? and user_password=?");
             
             //access the properties with PreparedStatement class Object = pstmt
             
             pstmt.setString(1,user_email);
             
             pstmt.setString(2,user_password);
             
             ResultSet rs = pstmt.executeQuery();
             
             if(rs.next()){
                 
                 session.setAttribute("user_email", rs.getString(user_email));
                 
                 //if the login is successful
                 dispatcher = request.getRequestDispatcher("Register.jsp");
             }
             else{
                 request.setAttribute("status","failed");
                 dispatcher = request.getRequestDispatcher("Register.jsp");
             }
            }catch(Exception e){
                e.printStackTrace();
            }
            
            dispatcher.forward(request, response);
            
            
//            out.println("<h1>Servlet loginservlet at " + request.getContextPath() + "</h1>");
            
            
            
            
//            out.println("</body>");
//            out.println("</html>");
        }
        return null;
      
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
        } catch (SQLException ex) {
            Logger.getLogger(loginservlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(loginservlet.class.getName()).log(Level.SEVERE, null, ex);
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
