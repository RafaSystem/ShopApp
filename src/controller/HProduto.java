package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SProduto;

/**
 * Servlet implementation class HProduto
 */
@WebServlet("/HProduto")
public class HProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private SProduto servProduto;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HProduto() {
        super();
        servProduto = new SProduto();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("ListaProduto", servProduto.getArProduto());
		
		request.getRequestDispatcher("produto.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		servProduto.addProduto(request.getParameter("pnome"),
								Integer.parseInt(request.getParameter("pquantidade")),
								Double.parseDouble(request.getParameter("ppreco")));
		
		
		
		this.doGet(request, response);
	}

}
