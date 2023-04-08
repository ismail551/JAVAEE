<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="entities.categorie"%>
  <%@page import="dao.categorieDAO"%>
  <%@page import="entities.client"%>
  <%@page import="entities.cart"%>
<%

	
	
	categorieDAO cdao = new categorieDAO();
	
	ArrayList<categorie> categos = cdao.getcategories();
	
	client cli = (client)session.getAttribute("client");
	
	cart cart = null;
	
	if(session.getAttribute("cart")!=null){
		
		cart = (cart)session.getAttribute("cart");
		session.setAttribute("cart", cart);
	}else{
		
		cart = new cart();
		ArrayList<Integer[]> products = new ArrayList<Integer[]>();
		cart.setProducts(products);
		cart.setTotal(0);
		session.setAttribute("cart", cart);
	}
	
	int nbpro = 0;
	
	for(Integer[] pr : cart.getProducts()){
		
		nbpro += pr[1];
	}
	
%>
 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CellPhoni | Store</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
    <style>
.dropbtn {
  background-color: #F6F6F9;
  color: white;
  padding: 16px;
  font-size: 16px;
  border-radius: 16px;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #F6F6F9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px #F6F6F9;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #F6F6F9;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #F6F6F9;}
</style>
</head>
<body>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img width="190px" height="190px" src="img/phone.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="cart.jsp"><i class="fa fa-shopping-bag"></i> <span><%=nbpro %></span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$<%=cart.getTotal() %></span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__auth">
            	<% if(cli != null){ %>
            		<a href="#"><i class="fa fa-user"></i> <%=cli.getFirstName()+" "+cli.getLastName() %></a>
            	<%}else{ %>
                	<a href="login.jsp"><i class="fa fa-user"></i> Login</a>
                	<a href="register.jsp"><i class="fa fa-user"></i> Register</a>
                <%} %>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="shop.jsp">Shop</a></li>
                        <li><a href="cart.jsp">Shoping Cart</a></li>
                        <li><a href="checkout.jsp">Check Out</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="https://www.facebook.com/ayman.darnouni/"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> ismaildarnouni15@gmail.com</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

<!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i><a style="color:black" href="SendMail">maildarnouni15@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="https://www.facebook.com/ayman.darnouni/"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__auth">
                                <% if(cli != null){ %>
                                <div class="dropdown">
  <button class="dropbtn"><a href="cart.jsp"><i class="fa fa-user"></i> <%=cli.getFirstName()+" "+cli.getLastName() %></a></button>
  <div style="border-radius:8px;width:16px" class="dropdown-content">
    <a href="Logout">Logout</a>
    
  </div>
</div>
				            	<%}else{ %>
				                	<a href="login.jsp"><i class="fa fa-user"></i> Login</a>
				                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                       <center><a href="./index.jsp"><img width="50px" height="50px"  src="img/phone.png" alt=""></a></center> 
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="index.jsp">Home</a></li>
                            <li><a href="shop.jsp">Shop</a></li>
                            <li><a href="checkout.jsp">Checkout</a></li>
                            <li><a href="cart.jsp">Cart</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="cart.jsp"><i class="fa fa-shopping-bag"></i> <span><%=nbpro %></span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$<%=cart.getTotal() %></span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    
        <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All Categories</span>
                        </div>
                        <ul>
                       <% 
                       if(categos != null){	
	
							for(int i = 0 ; i < categos.size() ; i++){
								categorie c = new categorie();
								c = categos.get(i);
						%>
                            <li><a style="color:white" href="categorie.jsp?c=<%=c.getId()%>"><%=c.getName()%></a></li>
                            
                        <%}}else{ %>
							<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
						<%} %>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="search.jsp">
                                <input type="text" placeholder="What do yo u need?" name="str">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        
                    </div>
      
    <!-- Hero Section End -->