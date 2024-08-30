<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        ul, li {      
            list-style-type: none; 
            padding: 0; 
            margin: 0; 
        }

        #container {
            display: flex;
            flex-wrap: wrap;      
            justify-content: center; 
            padding: 20px;
            width: 1000px; 
            margin: 0 auto;   
        }

        #contents {
            flex: 1 1 200px; 
            margin: 10px; 
            padding: 15px; 
            background-color: #f9f9f9; 
            width: calc(100% - 40px); 
            position: relative; 
        }

        .category_wrap {
            margin-bottom: 20px; 
        }

        .separator, .separator1 {
            width: 100%; 
            height: 2px;
            margin: 0;
        }

        .separator {
            position: relative; 
            bottom: 0; 
            background-color: #000; 
        }

        .separator1 {
            position: relative; 
            margin-top: 20px; 
            background-color: grey;
        }

        .separator2 {
            height: 1px; 
            width:950px; 
            background-color: grey; 
            margin-top: 3px; 
            margin-bottom: 20px;
            position: relative; 
        }

        .contegory_contents_wrap {
            display: flex; 
            flex-direction: row; 
            justify-content: space-between; 
            align-items: center; 
            flex-wrap: wrap; 
            margin-bottom: 20px; 
        }

        .category_content, .cart_content {
            display: flex; 
            flex-direction: row; 
            gap: 20px; 
            padding: 0; 
            margin: 0; 
            flex-wrap: wrap; 
            justify-content: space-around; 
        }

        #cart-count, #giftcon {
            display: inline-block; 
            margin-left: 5px; 
            padding: 0 4px; 
            background-color: #ff0000; 
            color: white; 
            border-radius: 50%; 
            font-size: 12px; 
            line-height: 20px; 
            height: 20px; 
            width: 20px; 
            text-align: center; 
            vertical-align: middle; 
        }

        .category_title {
            display: inline-block;
			margin-right: 10px;
            align-items: center;
             margin-right: 10px
          
        }

        .category_inner {
            display: flex; 
            flex-direction: row; 
            width: 80%; 
            padding: 0; 
            margin: 0; 
            list-style-type: none; 
        }

        .product img {
            max-width: 100%; 
            height: auto; 
        }

        .product-info {
            margin-top: 10px; 
        }

        .product-name {
            font-size: 14px; 
            color: #333; 
        }

        .original-price {
            text-decoration: line-through; 
            color: #999; 
            font-size: 14px; 
        }

        .discounted-price {
            color: #ff0000; 
            font-size: 16px; 
            font-weight: bold; 
        }

        .giftcardtext, .tiket-price {
            font-size: 14px; 
            font-weight: bold;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        .category_product_wrap {
            display: flex;
            flex-wrap: wrap; 
            gap: 20px; 
            justify-content: space-between; 
            align-items: center; 
        }

        .left {
            flex: 0 0 40%; 
            padding: 10px; 
            margin-right: 100px;
            margin-top: -10px;  
        }
		#original {
		font-size: 20px; /* 취소선 가격 크기 조정 */
		text-decoration: line-through; /* 가격에 취소선 추가 */
		color: #999; /* 취소선 색상 설정 */
		font-size: 25px; /* 취소선 가격 크기 조정 */
		  
		}
		
		#discount {
		font-size: 30px;
		margin-right: 20px;
		}
		  .separator3 {
            width:500px; /* 밑줄의 너비 설정 */
            height: 2px; /* 밑줄의 두께 설정 */
            background-color: #000; /* 밑줄의 색상 설정 (검정색) */
            margin: 10px 0; /* 상하 여백 추가 (선택 사항) */
        }
        #composition{
        	margin-right:10px;
        
        }
         .item-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
          
        }

        .item-list li {
            margin-bottom: 10px;
        }

        .item-text {
            display: flex;
            align-items: center;
            margin-top:10px;
        }
        

        .expiry {
            font-weight: bold;
            width: 80px; /* 유효기간 텍스트와 여백의 동일한 너비 설정 */
            display: inline-block;
        }

        .item-period {
            display: inline-block;
        }

        .spacer {
            width: 80px; /* 유효기간 텍스트와 동일한 너비 */
            display: inline-block;
        }
       #origin {
            margin-right: 20px; /* `origin`과 `description` 간의 여백 설정 */
        }
               #price {
            text-align: right; /* 텍스트를 오른쪽으로 정렬 */
            border: none; /* 기본 테두리 없음 */
            width: 100px; /* 너비 조정 (필요에 따라) */
            padding: 5px; /* 패딩 추가 (선택적) */
            background-color: transparent; /* 배경 투명 (선택적) */
        }
        
        #price:focus {
            outline: none; /* 포커스 시 외부 테두리 없음 */
        }
        
        /* 포커스 시 기본 테두리 스타일을 제거 */
        #price:focus::-webkit-input-placeholder {
            color: transparent; /* 크롬/사파리에서 플레이스홀더 텍스트 색상 투명화 */
        }
        .inline-container p,
        .inline-container input {
            display: inline-block;
            vertical-align: middle; /* 수직 정렬 */
        }
        .inline-container p {
            margin-right: 10px; /* 간격 조절 */
        }
       .no-underline {
        text-decoration: none; /* 링크의 밑줄을 제거합니다 */
         color: black;    
    	}

	.no-underline:hover {
		   text-decoration: none; /* 마우스 오버 시에도 밑줄이 보이지 않도록 합니다 */
		}
		
		
	   p {
	      margin: 0;
	      margin-right: 15px; /* Space between text and input */
	  }

	.total-container {
	    display: flex;
	    align-items: center; /* 수직 가운데 정렬 */
	    gap: 5px; /* 요소 간 간격 조정 */
	}
	  #totalprice {
		border: none; /* 테두리 제거 */
		text-align: right; /* 텍스트 오른쪽 정렬 */
		width: 160px; /* 너비 조정 */
		background-color: transparent; /* 배경색 투명 (선택 사항) */
		padding: 5px; /* 패딩 추가 (선택 사항) */
		text-indent: -5px; /* 텍스트를 왼쪽으로 이동 (필요에 따라 조정) */
		font-size:24px;
		color:red;
	          
	}
	.bottom {
	   	display: flex; /* 버튼을 수평으로 배치합니다 */
	   	gap: 50px; /* 버튼 사이에 일정한 간격을 줍니다 */
	   	margin-top:20px;
		}
	.no-style-link {
	   text-decoration: none; /* 밑줄 제거 */
	   color: inherit; /* 링크 색상 유지 */
	}
	
	.no-style-link:visited {
	   color: inherit; /* 방문 후 색상 유지 */
	}
	
    </style>
</head>
<body>
    <div id="container">
        <div id="contents">
            <div class="category_wrap">
              
                <div class="separator"></div>
            </div>
            <div class="contegory_contents_wrap">
                <ul class="category_content">
                    <li><a href="/package" class="no-underline">패키지</a></li>
                    <li><a href="/admissionticket" class="no-underline">영화관람권</a></li>
                    <li><a href="/giftcard" class="no-underline">기프트카드</a></li>
                    <li><a href="/combo" class="no-underline">콤보</a></li>
                    <li><a href="/popcorn" class="no-underline">팝콘</a></li>
                    <li><a href="/drink" class="no-underline">음료</a></li>
                    <li><a href="/snack" class="no-underline">스낵</a></li>
                </ul>
                <ul class="cart_content">
                    <li>내 기프트콘<span id="giftcon">0</span></li> 
                <li><a href="/cart" class="no-style-link">장바구니</a><span id="cart-count">0</span></li>
                </ul>   
            </div>
            <div class="separator1"></div>
            <div class="category_product_wrap">
                <div>
                 	<c:forEach items="${arItem}" var="item">
        				<div>
            				<strong class="category_title">${item.item_name}</strong><input type='text' id='hiddenid'><input type='text' id='userid'>
            				<input type=hidden id="idid" value='${item.id}'><br>
            					<div class="separator2"></div>
					            <ul class="category_inner">
					                <li class="left" id="1">
					                    <img src="${imagePath}" id="imagepath" alt="패키지1">
					                </li>
					                <li class="right">
					                   	<span  id="discount">${item.discount_price}</span>
					                   	
					                   	<span  id="original">${item.price}</span>
					                    	<div class="separator3"></div>
					                    		<span id="composition"style="display: flex; align-items: center;" >
					                    		<span style="margin-right: 14px; font-weight: bold;">상품구성</span>
					                    		<span>${item.composition}</span>
					                    		</span>
					                		<ul class="item-list">
						       						<c:forEach items="${arPackage}" var="pkg" varStatus="status">
						           						<li>
						              							<span class="item-text">
						                  							<c:choose>
						                       						<c:when test="${status.index == 0 and not empty pkg.period}">
						                           				<span class="expiry">유효기간</span>
						                       							</c:when>
						                       						<c:otherwise>
						                           				<span class="spacer"></span>
						                       							</c:otherwise>
						                   							</c:choose>
						                   						<span id="item-period">${pkg.name}: ${pkg.period}</span>
						               						</span>
						           						</li>
						       						</c:forEach>
					   						</ul>
					   					   <span id="origin" style="display: flex; align-items: center;">
            									  <c:choose>
     									
											        <c:when test="${not empty item.origin}">
											            <span style="margin-right: 32px; font-weight: bold;">원산지</span>
											            <span>${item.origin}</span>
											        </c:when>
											       
											        <c:otherwise>
											           <span style="margin-right: 32px; font-weight: bold; visibility: hidden;">원산지</span>
            										   <span style="visibility: hidden;"> </span> 
											        </c:otherwise>
											    </c:choose>
        									</span>
        									
        								 <div class="right-align">
        								 	<input type="number" id="cnt" min="1" value="1" style="width:50px; margin-right:100px;">
									        <input type="text" id="price" value="${item.discount_price}원"  readonly ><br><br><br><br>
									        	<div class="total-container">
									            	<p>총 결제금액</p>
									            	<input type="text" id="totalprice" style="border:none; text-align: right;" readonly>원
									        	</div>
									    </div>
									  <div class='bottom'>
									    <input type='button' id='btncart' value='장바구니'>
									    
									    <input type='button' id='btnbuy' value='구매하기'>
									  </div>    
					                </li>
					               
					            </ul>        
				        </div>
				    	</c:forEach>  
	               </div>
	             
	           </div>        
	       </div>
	   </div>    
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function() {
	let discount_price = $('#discount').text().trim(); // #discount 요소의 텍스트를 읽어옴
	let original_price = $('#original').text().trim();
	
	if(discount_price==original_price){
		
		 $('#original').text('');  // 빈 문자열을 설정합니다.
	}
	
    if (discount_price == '금액충전형') {
        $('#price').val('10,000원'); // #price 요소의 값을 '10,000원'으로 설정
        $('#cnt').replaceWith(`
                <select id="giftprice" style="width:100px; margin-right: 58px;" >
                    <option value="1">10,000</option>
                    <option value="2">20,000</option>
                    <option value="3">30,000</option>
                    <option value="4">40,000</option>
                    <option value="5">50,000</option>
                </select>  
                `)
      $('#totalprice').val('10,000');          
    }
    else {
        // discount_price가 '금액충전형'이 아닌 경우 #discount에 '원'을 붙임
        $('#discount').text(discount_price + '원');
        $('#totalprice').val(discount_price);
    }
 let original= $('#original').text().trim();
 console.log("111="+original);
 if (original !== null && original !== '') {
     $('#original').text(original + '원');
 }

// let currentUrl = window.location.href;

 // 비교할 URL을 정의합니다.
 //let targetUrl = 'http://localhost:8081/details?id=7';
	
 //if(currentUrl==targetUrl){
//	 $('#btncart').hide();}
 
 
 var queryString = window.location.search;
 var urlParams = new URLSearchParams(queryString);
 var id = urlParams.get('id');
 
 // ID 값을 콘솔에 출력
 console.log('ID:', id);
 $('#hiddenid').val(id);
 $('#userid').val('안녕하세요');
	let userid= $('#userid').val();
console.log(userid);
 


 
})
.on('change','#cnt', function() { // 'change' 이벤트 사용
    let cnt = $('#cnt').val();
    
    if (!cnt) {
        cnt = 1; // 수량이 비어있거나 유효하지 않은 경우 기본값으로 1 설정
    }

    console.log(cnt);
  
    let discountText = $('#discount').text();
	let discount = parseInt(discountText.split('원')[0].replace(/,/g, '')); 
	    console.log("discount: " + discount);
	    // 초기 가격을 할인 가격으로 설정
	   let price = discount;   
	  
        let totalPrice = price * parseInt(cnt);
        let total=$('#price').val(totalPrice.toLocaleString() + '원'); // 총 가격 표시 업데이트
        $('#totalprice').val(totalPrice.toLocaleString()  );
       
  
})
.on('change','#giftprice',function(){
	let giftprice=$('#giftprice option:selected').text();
	console.log(giftprice);
	let price=$('#price').val();
	$('#totalprice').val(price);
	
	$('#price').val(giftprice+'원');
	$('#totalprice').val('');
	$('#totalprice').val(giftprice ); // Set the value of the #totalprice field
})
.on('click','#btnbuy',function(){
	
	  window.location.href = '/storepay'; // 클릭 시 페이지 이동
	
	 	
})
.on('click','#btncart',function(){
	
		let item_id=$('#hiddenid').val();
		let custom_id=$('#userid').val();
		let total=$('#totalprice').val();
		let qty=$('#cnt').val();
		console.log("id"+item_id);
		console.log("userid"+custom_id);
		console.log(qty);
		console.log(total);
		
		$.ajax({
			url:'/insertcart',type:'post',data:{custom_id:custom_id,item_id:item_id,qty:qty,total:total},dataType:'text',
			success:function(data){
				if(data=='ok'){
					
					window.location.href='/cart';
				}
				
				
			}
		
		
		
		
		})	 	
})
.on('click','#btngift',function(){

	  window.location.href = '/gift'; // 클릭 시 페이지 이동
	  
	  
	  
	  
		 	
})


   
</script>
</html>