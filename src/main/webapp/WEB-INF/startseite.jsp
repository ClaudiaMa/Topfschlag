<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>ComiX-Datenbank</title>
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <div class="container" id = "container1">
            <!-- Eingabefelder, nur vor dem Abschicken anzeigen -->

            <h1>ComiX-Datenbank</h1>

            <form method="POST">
                <input name="aktion" type ="hidden" value="anlegen" />

                <input name="serie" type="text" value="${serie}" placeholder="Serie" />

                <!-- besonderes Eingabefeld mit Nummer -->
                <input name="nummer" type="number" value="${nummer}" placeholder="Nummer" />
                <input name="jahr" type="number" value="${jahr}" placeholder="Jahr" />


                <input name="titel" type="text" value="${titel}" placeholder="Titel" />
                <input name="zeichner" type="text" value="${zeichner}" placeholder="Zeichner" />
                <input name="texter" type="text" value="${texter}" placeholder="Texter" />


                <input type="submit" value="Comic anlegen" />
            </form>

            <ul>
                <c:forEach items="${fehlermeldungen}" var="meldung">
                    <li>${meldung}</li>
                    </c:forEach>
            </ul>

        </div>


        <div class="container" id="container2">

            <c:choose>
                <c:when test="${empty serien}">
                    <h1>Es sind noch keine Einträge vorhanden!</h1>
                </c:when>

                <c:otherwise>
                    <form method="POST">

                        <input type="hidden" name="aktion" value="loeschen">

                        <c:forEach items="${serien}" var="serie">

                            <h1>${serie.serie}</h1>

                            <c:forEach items="${serie.comics}" var="comic">
                                <input type="checkbox" name="id" value="${comic.id}"/>
                                <h2>${comic.serie}: ${comic.titel}</h2>
                                <p> Nummer ${comic.nummer},${comic.jahr} </p>
                                <p> Zeichnungen: ${comic.zeichner}, Text: ${comic.texter} </p>
                            </c:forEach>

                        </c:forEach>

                        <input type="submit" value="Ausgewählte Einträge löschen" />
                    </form>

                </c:otherwise>

            </c:choose>

        </div>
    </body>
</html>
