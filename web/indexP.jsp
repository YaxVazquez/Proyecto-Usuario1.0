<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Inicio</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/estilos1.css">

        
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <nav class="navbar navbar-default" >
          <div class="container-fluid" >
            <div class="navbar-header">
              
              <a href="#" class="navbar-brand" >Administrador </a>
            </div>
                </nav>
            <div class="container">

                <h2>Ingresa como adminstrador del centro</h2>
                <br>
                <form class="form-horizontal" action='indexP.jsp' method='post'>
                    <div class="form-group">
                        <label for="Usuario" class="col-sm-2 control-label">Usuario</label>
                        <div class="col-sm-10">
                            <input type="text" id="useri" name="useri" class="form-control"  placeholder="Usuario" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Contraseña" class="col-sm-2 control-label">Contraseña</label>
                        <div class="col-sm-10">
                            <input type="password" id="contrasenia" name="contrasenia"class="form-control"  placeholder="Contraseña" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" id="LoG" value="Ingresar" name="LoG" >
                        </div>
                    </div>
                </form>
          </div>
<%
     if (request.getParameter("LoG") != null ){
                String user;
                String conE;
                
                Connection c = null;
                Statement s = null;
                ResultSet r = null;
                PreparedStatement ps = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    c = DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                    s = c.createStatement();
                }
                catch (SQLException error){
                    out.print(error.toString());
                }

                try {
                   user = request.getParameter("useri");
                   conE = request.getParameter("contrasenia");
                   r = s.executeQuery("select * from Centro where Usuario ='"+user+"';");
                   if (r.next()){
                       String con = r.getString("Contrasena");
                       if(conE.equals(con)){
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("user", request.getParameter("useri"));
                            sesion.setAttribute("nCentro", r.getString("NombreCentro"));
                           
                              s = c.createStatement();
                        String queryString="update Centro set Sesion='"+1+"' where Usuario ='"+user+"';";
                         ps=c.prepareStatement(queryString);
                         ps.executeUpdate();
                            out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto/PerfilCentro.jsp'/>");
                       }
                       else {
                           out.println("<script>alert('Contraseña incorrecta'); </script>");
                       }
                   }
                   else {
                       out.println("<script> alert('El usuario no existe');</script>");
                   }
                }
                catch (SQLException error){
                    out.print(error.toString());
                }
            }   
     %>
        

        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
        
    </body>
    
</html>