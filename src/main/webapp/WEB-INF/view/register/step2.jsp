<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
    $('#submit').click(function(){
    	//상품명, 가격, 재고
    	var memberId = $('#memberId').val();
    	var memberName = $('#memberName').val();
    	var memberPw = $('#memberPw').val();
    	var confirmPassword = $('#confirmPassword').val();
    	
    	if(memberId.length == 0){
    		$('.memberId').text("아이디를 입력해주세요");
    		$('#memberId').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    	
    	if(memberName.length == 0){
    		$('.memberName').text("이름을 입력해주세요");
    		$('#memberName').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}

    	
    	if(memberPw.length == 0){
    		$('.memberPw').text("비밀번호를 입력해주세요");
    		$('#memberPw').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    	
    	if(confirmPassword.length == 0){
    		$('.confirmPassword').text("다시 비밀번호를 입력해주세요");
    		$('#confirmPassword').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    	
    	var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요.");
			return false;
		}else if(idChkVal == "Y"){
			$("#regForm").submit();
		}

    });
    
    

});

function fn_idChk(){
	$.ajax({
		url : "/www/idChk",
		type : "post",
		dataType : "json",
		data : {"memberId" : $("#memberId").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}




</script>
</head>
<body>
    <h2>회원가입</h2>

  <form:form action="step3" modelAttribute="registerRequest" id="regForm" method="POST">
    <p>
        <label>아이디:<br>
        <form:input path="memberId" id="memberId" />
        <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
        <span class="errStr memberId"></span>
        </label>
    </p>
    <p>
        <label>이름:<br>
        <form:input path="memberName" />
        <span class="errStr memberName"></span>
        </label>
    </p>
    <p>
        <label>비밀번호:<br>
        <form:password path="memberPw" />
        <span class="errStr memberPw"></span>
        </label>
    </p>
    <p>
        <label>비밀번호 확인:<br>
        <form:password path="confirmPassword" />
        <span class="errStr confirmPassword"></span>
        </label>
    </p>
    <button type="submit" id="submit" >가입</button>
    </form:form> 
</body>
</html>
