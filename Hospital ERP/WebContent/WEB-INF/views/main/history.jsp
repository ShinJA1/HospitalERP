<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 -->
  <link href="${pageContext.request.contextPath }/resources/style.css" rel="stylesheet"> <!-- 사용자css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- Jquery -->
  <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script> <!-- fontawesome  -->
<title>진료기록</title>


</head>
<body>
	<div class="container-fluid">
	
		<div class="d-flex" id="title">
			<div class="p-2 flex-grow-1">
				<i class="fa-solid fa-circle-user fa-lg"></i>&nbsp;ㅇㅇ병원님 반갑습니다.
			</div>
		    <div class="p-2"><a href="#" class="title-a">진료</a></div>
			<div class="p-2"><a href="#" class="title-a">재고</a></div>
			<div class="p-2"><a href="#" class="title-a">진료기록</a></div>
			  
		</div>
		<div class="container-fluid">
      		<div class="row" style="height: 100%;">

         		<div class="col-md-2" style=" height: 100%; background-color: lightgrey;">
            		<p>
            		<h3 style="text-align: center">진료내역</h3>
            		
            		<form role="form">
	            		<div class="form-group">
	            			<input type="text" id = "search" placeholder="이름/전화번호" class="form-control"  onKeypress="javascript:if(event.keyCode==13) {test()}">
	            		</div>
	            		<div class="form-group">
	            			<button type="button" id="patient_search"class="btn btn-primary" style="width: 100%">검색</button>
	            		</div>
	            		
            		</form>
            		</p>
            		<div class="result" style="background-color: #00AAFF" id="open">
	            		
            		</div>
         		</div>


         		<div class="col-md-4"  style="border-right: 1px solid black;">
            		환자이름 <br>
            		생년월일/주소/나이/성별/전화번호<br>
            		<div style="border-bottom: 1px solid black; height: 25%;">
	            		<div class="row" style=" background-color: lightgrey; margin-left: 50px; margin-right: 20px; height: 100%; border: 10px">
	            		접수메모 (특이사항)
	            		<textarea id="text" readonly= "readonly" cols="30" rows="7" onclick="this.select()" onfocus="this.select()" class="form-control"> 내용이 들어갑니다. </textarea>
            			</div>
            		</div>
            		안녕하세요
         		</div>


         		<div class="col-md-4" style="border-right: 1px solid black;">
            		<p>
		                Lorem ipsum dolor sit amet, <strong>consectetur adipiscing
		                elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac
		                habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum
		                velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor.
		                Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales
		                nisi id sodales. Proin consectetur, nisi id commodo imperdiet,
		                metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin
		                massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam
		                mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod
		                ultrices massa, et feugiat ipsum consequat eu.</small>
            		</p>
         		</div>

         		<div class="col-md-2">
         
        		</div>
         
         
         
      		</div>
  		</div>
	</div>

<script type="text/javascript">
$(function() {
	$('#patient_search').click(function(){
			$.ajax({	
				url: "./patientsearch.do",
				type: "post",
				data : { name: $('#search').val()},
				success: successFunc,
				error: errFunc
			});
		
	});
});

function successFunc(data){
	var str = "";
	var obj = JSON.parse(data);
	console.log(obj.list.length)
	for(var i =0; i< obj.list.length; i++){
		str += "<div class='result_set'>"
		str += "<span class = name>" + obj.list[i].doctor + "</span><br>";
		str += obj.list[i].disease + "<br>";
		str += "</div>"
	}
	
	$('#open').html(str);
}
function errFunc(e){
	alert("검색결과가 없습니다.");
}
$(function(){
	$(document).on("click", ".result_set", function (e){
		$.ajax({	
			url: "./patientinfo.do",
			type: "post",
			data : { name: $(this).find(".name").text()},
			success: function(data){
				console.log(data)
			},
			error: function(){
				console.log('통신실패!!!')
			}
		});
		
		
		$(this).css("background-color", "pink");
	});
});
</script>

</body>
</html>