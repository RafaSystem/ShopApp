<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,model.Produto" %>
<!DOCTYPE html>
<html lang="pt">
<head>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="HProduto" method="post">
Nome <input type="text" name="pnome"><br>
Preco <input type="text" name="ppreco"><br>
Quantidade <input type="number" name="pquantidade"><br>
<input type="submit" value="Adicionar" style="width: 100px; margin-left: 75px;"/>
</form>
<h1>Lista de Produtos</h1>
<table>
	<tr>
		<th>Nome</th>
		<th>Preco</th>
		<th>Quantidade</th>
	</tr>
<%

	ArrayList arp = (ArrayList) request.getAttribute("ListaProduto");
	
	double total=0;	
	int totalqt=0;	
	for(int i=0; i<arp.size();i++){
			Produto p = (Produto) arp.get(i);
			out.append("<tr><td>"+"Nome: "+p.getNome()+"</td>");
			out.append("<td>"+"Preco: "+p.getPreco()+"</td>");
			out.append("<td>"+"Quantidade: "+p.getQuantidade()+"</td></tr>");
			total=total+(p.getPreco()*p.getQuantidade());
			totalqt=totalqt+p.getQuantidade();
			out.append("<tr><td>"+"Total"+"</td><td>"+total+"</td><td>"+totalqt+"</td></tr>");
	}
	
 %>
 </table>
</body>
</html>