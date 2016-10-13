window.addEventListener("load",function(){
	document.getElementById("submitMail").addEventListener("click", function(){

		document.querySelector("form").addEventListener("submit", function(event){
			console.log(event);
			// put our validation here...
			// if (ok) {
			// 	send on their way
			// }else{
			// 	display error & prevent default
			// }
			e.preventDefault;
		})

		var checkEmail = document.getElementById("mail").value;
		var perChar = checkEmail.split("");
		var hasAt, hasDot;
		var charOrder;
		var atLoc, dotLoc;
	for (var i = 0; i <= checkEmail.length - 1; i++) {
		if (perChar[i] == "@") {
			hasAt = true;
			atLoc = i;
		}
		if (perChar[i] == ".") {
			hasDot = true;
			dotLoc = i;
		}
	}
	// alert(atLoc);
	// alert(dotLoc);
	if (hasAt == true && hasDot == true) {
		if (atLoc < dotLoc) {
			// email is valid
			alert("Your email is valid.");
			return;
		}else{
			// email is invalid
			e.preventDefault;
			alert("Your email is invalid.");
		}
	}else{
		// email is invalid
		e.preventDefault;
		alert("Your email is invalid.");
	}
	});
		// <button id="submitMail">Submit</button>
			// function myFunction1(e){ // Validate Password
			// e.preventDefault();
});
