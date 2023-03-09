<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Exmamen_Cristobal_Arreguin_Peña.WebForm1" %>

<!DOCTYPE html>

<html>
<head>
     <meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0">
    <title>GOOGLE API</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfxPD7VdQYeMQCOL5BhBjKSLZSdbvwRCM&callback=initMap"
        async defer></script>
	<style> 
  	  #map {
        height: 100%;
      }
     
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
	</style> 
	</style> 
</head>
<body>
     
		<div id ="map" style="width:100%;background:red; height:70%";padding-top:"2%"></div> 
      
        
 
       <script>

           const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
           let labelIndex = 0;

           var map;
           function initMap() {
               var latitud = 22.129014363702044;
               var longitud = -101.0018698601968;

               coordenadas = {
                   lng: longitud,
                   lat: latitud,
               };
               generarMapa(coordenadas);
           }

           function generarMapa(coordenadas) {


               map = new google.maps.Map(document.getElementById('map'), {
                   center: new google.maps.LatLng(coordenadas.lat, coordenadas.lng),
                   zoom: 13,
               });
               var marker = new google.maps.Marker({
                   position: new google.maps.LatLng(coordenadas.lat, coordenadas.lng),
                   map: map,
                   title: 'Parque tangamanga'
               });
               var infowindow = new google.maps.InfoWindow({
                   content: "<p>Coordenadas:" + marker.getPosition() + "</p>",
               });

               //EVENTO PARA TOMAR COORDENADAS AL ARRASTRARSE

               marker.addListener('dragend', function (event) {
                   document.getElementById("latitud").value = this.getPosition().lat();
                   document.getElementById("longitud").value = this.getPosition().lng();
               })
                addMarker(bangalore, map);
           }

          
           function addMarker(location, map) {
                new google.maps.Marker({
                   position: location,
                   label: labels[labelIndex++ % labels.length],
                   map: map,
               });
           }

           window.initMap = initMap;


       </script>
	
		
</body>
</html>
