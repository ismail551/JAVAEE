package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import dao.phoneDAO;
import entities.phone;

/**
 * Servlet implementation class actionPhone
 */
@MultipartConfig
public class actionPhone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public actionPhone() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		HttpSession s = request.getSession(false);
		
		String source = (String) s.getAttribute("source");
		
		phoneDAO pdao = new phoneDAO();

		
		if(request.getParameter("d") != null) {
			
			// Delete phone
			
			int id = Integer.parseInt(request.getParameter("d"));
			
			int res = pdao.deletePhoneById(id);
			
			
			request.getRequestDispatcher(source+"?res="+res).forward(request, response);
			
		
		}else{
			response.sendRedirect(source);
		}
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession s = request.getSession(false);
		
		String source = (String) s.getAttribute("source");
		
		phoneDAO pdao = new phoneDAO();
		
		int res = 0;
		
	if(request.getParameter("a") != null && request.getParameter("a").equals("Add")) {
		
		phone p = new phone();
		
		
		// Add phone
		
		String name = request.getParameter("name");
		p.setName(name);
		p.setDetails(request.getParameter("description"));
		p.setCategorie(Integer.parseInt(request.getParameter("categorie")));
		p.setPrice(Double.parseDouble(request.getParameter("price")));
		p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
	
		
		
		Part part = request.getPart("image");
		String pPicName = part.getSubmittedFileName();		
		String UploadPath = "C:/Users/HP/eclipse-workspace10/Cart/src/main/webapp/phones/"+pPicName;
		
		try {
			
			FileOutputStream fos = new FileOutputStream(UploadPath);
			InputStream is = part.getInputStream();
	        p.setImage(pPicName);

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
            res = pdao.addPhone(p);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

		
		request.getRequestDispatcher(source+"?res="+res).forward(request, response);

		
		
		}else if(request.getParameter("u") != null) {
		
		// Update phone
			
			phone p = new phone();
			

			p.setId(Integer.parseInt(request.getParameter("id")));
			String name = request.getParameter("name");
			p.setName(name);
			p.setDetails(request.getParameter("description"));
			p.setCategorie(Integer.parseInt(request.getParameter("categorie")));
			p.setPrice(Double.parseDouble(request.getParameter("price")));
			p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			

			
			if(request.getPart("image") != null) {
				
				
				
				Part part = request.getPart("image");
				String pPicName = part.getSubmittedFileName();		
				String UploadPath = "C:/Users/HP/eclipse-workspace10/Cart/src/main/webapp/phones/"+pPicName;
				
				try {
					
					FileOutputStream fos = new FileOutputStream(UploadPath);
					InputStream is = part.getInputStream();
					
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
			}else {
				p.setImage(null);
			}
			
			
			res = pdao.updatePhone(p);
		
		request.getRequestDispatcher("phones.jsp?res="+res).forward(request, response);
		}
	}

}