<%-- 
    Document   : index.jsp
    Created on : 25/09/2020, 06:20:13 PM
    Author     : yelbetto
--%>

<%@page import="Logica.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora</title>
        <link rel="shortcut icon" type="image/x-icon" href="RESOURCES/IMG/calculadora.ico"/>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:ital,wght@0,300;1,300&family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="RESOURCES/CSS/estilos.css" type="text/css">
    </head>
    <body>

        <%if (request.getParameter("n1") == null && request.getParameter("n2") == null) {%>
        <form method="POST" action="index.jsp">
            <center>
                <h1>Calculadora</h1>
                <label for="numero1">Ingresa n1</label>
                <input type="number" id="numero1" name="n1" min="1" step="1" required>
                <br>
                <label for="numero2">Ingresa n2</label>
                <input type="number" id="numero2" name="n2" min="1" step="1" required>
                <div id="contenedor">
                    <div class="item">
                        <input type="checkbox" class="item" name="suma" id="item1" value="1" onchange="verificar(this)"> Sumarlos
                    </div>
                    <div class="item">
                        <input type="checkbox" class="item" name="multiplicacion" value="2" onchange="verificar(this)"> Multiplicarlos
                    </div>
                    <div class="item">
                        <input type="checkbox" class="item" name="mayor" value="3" onchange="verificar(this)"> Obtener el número mayor de los dos
                    </div>
                    <div class="item">
                        <input type="checkbox" class="item" name="potencia" value="4" onchange="verificar(this)"> Obtener la potencia de n1^⁽n2⁾
                    </div>
                    <div class="item">
                        <input type="checkbox" class="item" name="binario" value="5" onchange="verificar(this)"> Mostrar ambos números en valor binario
                    </div>
                </div>
                <button type="submit" id="ingresar" disabled>Ingresar</button>
            </center>
        </form>
        <%  } else {
            String n1 = request.getParameter("n1");
            String n2 = request.getParameter("n2");
            Operaciones op = new Operaciones();%>
    <center>
        <div id="resultados">
            <h1>Resultados de las operaciones seleccionadas</h1>
            <table>
                <thead>
                    <tr>
                        <%if (request.getParameter("suma") != null) {%>
                        <th>SUMA</th>
                            <%}%>
                            <%if (request.getParameter("multiplicacion") != null) {%>
                        <th>MULTIPLICACIÓN</th>
                            <%}%>
                            <%if (request.getParameter("mayor") != null) {%>
                        <th>MAYOR</th>
                            <%}%>
                            <%if (request.getParameter("potencia") != null) {%>
                        <th>POTENCIA</th>
                            <%}%>
                            <%if (request.getParameter("binario") != null) {%>
                        <th>BINARIOS</th>
                            <%}%>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%  if (request.getParameter("suma") != null) {%>
                        <td><%out.println(n1 + "+" + n2 + "=" + op.suma(Integer.parseInt(n1), Integer.parseInt(n2)));%></td>
                        <%}
                            if (request.getParameter("multiplicacion") != null) {
                                int operacion = op.multiplicacion(Integer.parseInt(n1), Integer.parseInt(n2));%>
                        <td><%out.println(n1 + "*" + n2 + "=" + operacion);%> </td>
                        <%}
                            if (request.getParameter("mayor") != null) {
                                int operacion = op.mayor(Integer.parseInt(n1), Integer.parseInt(n2));%>
                        <td><%out.println(operacion);%></td>
                        <%}
                            if (request.getParameter("potencia") != null) {
                                int operacion = op.potencia(n1, n2);%>
                        <td><%out.println(n1 + "^(" + n2 + ")=" + operacion);%></td>
                        <%}%>
                        <%if (request.getParameter("binario") != null) {
                            String operacion = op.binario(n1, n2);%>
                        <td><%out.println(operacion);%></td>
                        <%}%>
                    </tr>
                </tbody>
            </table>
            <a href="index.jsp">REALIZAR OTRA OPERACION</a>
        </div>
    </center>
    <%}%>
    <script>
        function verificar(check) {
            var suma = document.getElementsByClassName("item");
            var verificado = false;
            var boton = document.getElementById("ingresar");
            for (let i = 0; i < suma.length; i++) {
                if (suma[i].checked) {
                    verificado = true;
                    break;
                }
            }
            boton.disabled = !verificado;
        }
    </script>
</body>
</html>
