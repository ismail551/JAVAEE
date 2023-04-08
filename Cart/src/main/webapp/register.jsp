

<jsp:include page="header.jsp"></jsp:include>    


  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="entities.categorie"%>
  <%@page import="dao.categorieDAO"%>
  <%@page import="entities.phone"%>
  <%@page import="dao.phoneDAO"%>
  
<%

	session.setAttribute("source", "register.jsp");

	categorieDAO cdao = new categorieDAO();
	
	ArrayList<categorie> categos = cdao.getcategories();
	
	phoneDAO pdao = new phoneDAO();
	
	ArrayList<phone> phones = pdao.getPhones();
	
%>
 

	              </div>
            </div>
    </section>
    <!-- Hero Section End -->

	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Login</h2>
                        <div class="breadcrumb__option">
                            <a href="index.jsp">Home</a>
                            <span>Login</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	
	 <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <form action="accountClient" method="post">
                <div class="row justify-content-center">
                	<div class="row col-lg-12 justify-content-center">
	                    <div class="col-lg-6 col-md-6 center">
	                    	<input type="text" name="firstName" placeholder="Your First Name">
	                    	<input type="text" name="lastName" placeholder="Your Last Name">
	                        <input type="email" name="email" placeholder="Your Email">
	                        <input type="text" name="phone" placeholder="Your Phone">
	                        <input type="password" name="password" placeholder="Your Password">
	                    </div>
           			</div>
           			<% if(request.getParameter("err")!=null){
	                    	if(request.getParameter("err").equals("-1")){%>
	                    	
		                    <div class="col-lg-6 col-md-6 center">
		                    	<p style="color:red">Email or Password is incorrect. Please try again !</p>
		                    </div>
	                    
	                    <%}} %>
           			<div class="row col-lg-12 justify-content-center">
	                    <div class="col-lg-6 text-right justify-content-around">
	                    	<button class="site-btn"><a style="color:white" href="login.jsp" >LOGIN</a></button>
	                        <button type="submit" name="action" value="register"class="site-btn">REGISTER</button>
	                    </div>
                	</div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->
   


<jsp:include page="footer.jsp"></jsp:include>    
