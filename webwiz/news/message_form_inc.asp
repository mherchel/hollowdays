<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Guide - Web Wiz Site News
'**                                                              
'**  Copyright 2001-2002 Bruce Corkhill All Rights Reserved.                                
'**
'**  This program is free software; you can modify (at your own risk) any part of it 
'**  under the terms of the License that accompanies this software and use it both 
'**  privately and commercially.
'**
'**  All copyright notices must remain in tacked in the scripts and the 
'**  outputted HTML.
'**
'**  You may use parts of this program in your own private work, but you may NOT
'**  redistribute, repackage, or sell the whole or any part of this program even 
'**  if it is modified or reverse engineered in whole or in part without express 
'**  permission from the author.
'**
'**  You may not pass the whole or any part of this application off as your own work.
'**   
'**  All links to Web Wiz Guide and powered by logo's must remain unchanged and in place
'**  and must remain visible when the pages are viewed unless permission is first granted
'**  by the copyright holder.
'**
'**  This program is distributed in the hope that it will be useful,
'**  but WITHOUT ANY WARRANTY; without even the implied warranty of
'**  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR ANY OTHER 
'**  WARRANTIES WHETHER EXPRESSED OR IMPLIED.
'**
'**  You should have received a copy of the License along with this program; 
'**  if not, write to:- Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom.
'**    
'**
'**  No official support is available for this program but you may post support questions at: -
'**  http://www.webwizguide.info/forum
'**
'**  Support questions are NOT answered by e-mail ever!
'**
'**  For correspondence or non support questions contact: -
'**  info@webwizguide.com
'**
'**  or at: -
'**
'**  Web Wiz Guide, PO Box 4982, Bournemouth, BH8 8XP, United Kingdom
'**
'****************************************************************************************
%>


<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to check form is filled in correctly before submitting
function CheckForm () {
	
	var errorMsg = "";
	
	//Check for an News Title
	if (document.frmNews.title.value==""){
		errorMsg += "\n\tTitle \t\t- Enter a title for the News Item";
	}
	
	//Check for an News Title
	if (document.frmNews.shortNews.value==""){
		errorMsg += "\n\tShort News \t- Enter a Short News Item to display";
	}
	
	//Check for news Item
	if (document.frmNews.newsItem.value==""){
		errorMsg += "\n\tNews Item \t- Enter a News Item to post";
	}
	
	//If there is a problem with the form then display an error
	if (errorMsg != ""){
		msg = "____________________________________________________________________\n\n";
		msg += "Your News Item has not been submitted because there are problem(s) with the form.\n";
		msg += "Please correct the problem(s) and re-submit the form.\n";
		msg += "____________________________________________________________________\n\n";
		msg += "The following field(s) need to be corrected: -\n";
		
		errorMsg += alert(msg + errorMsg + "\n\n");
		return false;
	}
	
	return true;
}

//Have the propmt box turned on by default
var promptOn = true;


//Function to turn on or off the prompt box
function PromptMode(selectMode){
	
	if (selectMode.options[selectMode.selectedIndex].value == 0){
		promptOn = false;
	}
	else{
		promptOn = true;
	}
}


// Function to add the code for bold italic centre and underline, to the newsItem
function AddMessageCode(code, promptText, InsertText, eleNum) {

	if (code != "") {
		if (promptOn == true){
			insertCode = prompt(promptText + "\n<" + code + ">xxx</" + code + ">", InsertText);
				if ((insertCode != null) && (insertCode != "")){
					document.frmNews.elements[eleNum].value += "<" + code + ">" + insertCode + "</" + code + ">";
				}
		}
		else{
			document.frmNews.elements[eleNum].value += "<" + code + "></" + code + ">";
		}
	}
				
	document.frmNews.elements[eleNum].focus();
}

// Function to add the font colours to the newsItem, to the Short item
function AddColourCodeShort(code) {

	if (code != "") {
		if (promptOn == true){
			insertCode = prompt('Enter the text that you would like in ' + code + '\n<font color="' + code + '">xxx</font>', '');
				if ((insertCode != null) && (insertCode != "")){
					document.frmNews.shortNews.value += '<font color="' + code + '">' + insertCode + '</font>';
				}
		}
		else{
			document.frmNews.shortNews.value += '<font color="' + code + '"></font>';
		}
	}
	document.frmNews.selectColourShort.options[0].selected = true			
	document.frmNews.shortNews.focus();
}



// Function to add the font colours to the newsItem, to the newsItem
function AddColourCode(code) {

	if (code != "") {
		if (promptOn == true){
			insertCode = prompt('Enter the text that you would like in ' + code + '\n<font color="' + code + '">xxx</font>', '');
				if ((insertCode != null) && (insertCode != "")){
					document.frmNews.newsItem.value += '<font color="' + code + '">' + insertCode + '</font>';
				}
		}
		else{
			document.frmNews.newsItem.value += '<font color="' + code + '"></font>';
		}
	}
	document.frmNews.selectColour.options[0].selected = true			
	document.frmNews.newsItem.focus();
}




//Function to add the URL, indent, list, and Email code to the elements[eleNum]
function AddCode(code, eleNum) {

	//For the URL code
	if ((code != "") && (code == "URL")) {
		insertText = prompt("Enter the on screen display text for the Hyperlink", "");
			
			if ((insertText != null) && (insertText != "") && (code == "URL")){
				insertCode = prompt("Enter the URL address to create Hyperlink to", "http://");
					
					if ((insertCode != null) && (insertCode != "") && (insertCode != "http://")){					
						document.frmNews.elements[eleNum].value += '<a href="' + insertCode + '">' + insertText + '</a>';
					}
			}
	}
	
	
	//For the email code
	if ((code != "") && (code == "EMAIL")) {
		insertText = prompt("Enter the on screen display text for the E-mail address", "");
			
			if ((insertText != null) && (insertText != "")){
				insertCode = prompt("Enter the E-mail address to link to", "");
					
					if ((insertCode != null) && (insertCode != "")){					
					document.frmNews.elements[eleNum].value += '<a href="mailto:' + insertCode + '">' + insertText + '</a>';
				}
			}
	}
	
	//For the image code
	if ((code != "") && (code == "IMAGE")) {	
		insertCode = prompt("Enter the web address of the image", "http://");
					
			if ((insertCode != null) && (insertCode != "")){					
			document.frmNews.elements[eleNum].value += '<img src="' + insertCode + '" border="0">';
		}			
	}
	
	//For the list code
	if ((code != "") && (code == "LIST")) {
		if (promptOn == true){
			listType = prompt("Type of list \nEnter \'1\' for numbered or leave blank for bulleted", "");
			
			while ((listType != null) && (listType != "") && (listType != "1")) {
				listType = prompt("ERROR! Please enter \'1\' for numbered or leave blank for bulleted","");               
			}
			
			if (listType != null) {			
				var listItem = "1";
				var insertCode = "";
				
				while ((listItem != "") && (listItem != null)) {
					listItem = prompt("List item Leave blank to end list",""); 
					if (listItem != "") {             
						insertCode += "<li>" + listItem + "</li>"; 
					}                   
				} 
				
				if (listType == "") {
					document.frmNews.elements[eleNum].value += "<ul>" + insertCode + "</ul>";
				} else {
					document.frmNews.elements[eleNum].value += "<ol>" + insertCode + "</ol>";
				} 
				
			}
		}
		else{
			document.frmNews.elements[eleNum].value += "<ul><li> </li><li> </li><li> </li></ul>";
		}			
	}
	
	
	//For the indent
	if ((code != "") && (code == "INDENT")) {
						
			document.frmNews.elements[eleNum].value += "&nbsp;&nbsp;";				
	}
				
	document.frmNews.elements[eleNum].focus();
}

//Function to open preview post window
function OpenPreviewWindow(){

	strTitle = escape(document.frmNews.title.value);
	strShortMessage = escape(document.frmNews.shortNews.value);
	strMessage = escape(document.frmNews.newsItem.value);
	document.cookie = "Title=" + strTitle
	document.cookie = "shortNews=" + strShortMessage
   	document.cookie = "NewsItem=" + strMessage
   	
   	openWin('news_item_preview.asp','preview','toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=1,width=680,height=400')
}

//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}
	
// -->
</script>
<div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
 If you are showing the Short News items on a page outside of the news directory then make sure you use full paths,<br>
 including domain name for links and images.</font> </div>
<form method=post name="frmNews" action="add_news.asp" onSubmit="return CheckForm();" onReset="return confirm('Are you sure you want to clear the News Item you have entered?');">
  <table width="660" border="0" cellspacing="0" cellpadding="1" height="230" align="center" bgcolor="#000000">
    <tr> 
      <td height="66" width="967"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="201">
          <tr> 
            <td height="199"> 
              <table width="100%" border="0" align="center" height="175" cellpadding="2" cellspacing="0">
        <tr align="left" bgcolor="#FFFFFF"> 
         <td colspan="2" height="30">*Indicates required fields</td>
        </tr>
        <tr bgcolor="#FFFFFF" > 
         <td align="right" width="14%" height="12">News Title*:</td>
         <td height="12" width="86%"> <input type="text" name="title" size="30" maxlength="50" value="<% = strNewsTitle %>"> </td>
        </tr>
        <tr bgcolor="#FFFFFF" > 
         <td valign="bottom" align="right" height="22">Text Format:</td>
         <td height="22" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr> 
            <td> Mode: 
             <select name="selectMode" onChange=PromptMode(this)>
              <option value="1" selected>Prompt</option>
              <option value="0">Basic</option>
             </select> <br> <a href="JavaScript:AddMessageCode('B','Enter text you want formatted in Bold', '', 3)"><img src="news_images/post_button_bold.gif" width="25" height="24" align="absmiddle" border="0" alt="Bold"></a> 
             <a href="JavaScript:AddMessageCode('I','Enter text you want formatted in Italic', '', 3)"><img src="news_images/post_button_italic.gif" width="25" height="24" align="absmiddle" border="0" alt="Italic"></a> 
             <a href="JavaScript:AddMessageCode('U','Enter text you want Underlined', '', 3)"><img src="news_images/post_button_underline.gif" width="25" height="24" align="absmiddle" border="0" alt="Underline"></a> <a href="JavaScript:AddCode('URL', 3)"><img src="news_images/post_button_hyperlink.gif" width="25" height="24" align="absmiddle" border="0" alt="Add Hyperlink"></a> 
             <a href="JavaScript:AddCode('EMAIL', 3)"><img src="news_images/post_button_email.gif" width="25" height="24" align="absmiddle" border="0" alt="Add E-mail Link"></a> <a href="JavaScript:AddMessageCode('CENTER','Enter text you want Centred', '', 3)"><img src="news_images/post_button_centre.gif" width="25" height="24" align="absmiddle" border="0" alt="Centre"></a> 
             <a href="JavaScript:AddCode('LIST', 3)"><img src="news_images/post_button_list.gif" width="25" height="24" align="absmiddle" border="0" alt="List"></a> <a href="JavaScript:AddCode('INDENT', 3)"><img src="news_images/post_button_indent.gif" width="25" height="24" align="absmiddle" border="0" alt="Indent"></a> 
             <a href="JavaScript:AddCode('IMAGE', 3)"><img src="news_images/post_button_image.gif" width="25" height="24" align="absmiddle" border="0" alt="Add Image"></a> <select name="selectColourShort" id="selectColourShort" onChange=AddColourCodeShort(selectColourShort.options[selectColourShort.selectedIndex].value) >
              <option value="0" selected>-- Font Colour --</option>
              <option value="BLACK">Black</option>
              <option value="WHITE">White</option>
              <option value="BLUE">Blue</option>
              <option value="RED">Red</option>
              <option value="GREEN">Green</option>
              <option value="YELLOW">Yellow</option>
              <option value="ORANGE">Orange</option>
              <option value="BROWN">Brown</option>
              <option value="MAGENTA">Magenta</option>
              <option value="CYAN">Cyan</option>
              <option value="LIME GREEN">Lime Green</option>
             </select> </td>
           </tr>
          </table></td>
        </tr>
        <tr bgcolor="#FFFFFF" > 
         <td valign="top" align="right" height="22">Short News Item*</td>
         <td height="22" valign="bottom"><textarea name="shortNews" cols="57" rows="5" id="shortNews"><% = strShortNewsItem %></textarea></td>
        </tr>
        <tr bgcolor="#FFFFFF" > 
         <td valign="bottom" align="right" height="22" width="14%">Text Format:</td>
         <td height="22" width="86%" valign="bottom"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr> 
            <td> <a href="JavaScript:AddMessageCode('B','Enter text you want formatted in Bold', '', 5)"><img src="news_images/post_button_bold.gif" width="25" height="24" align="absmiddle" border="0" alt="Bold"></a> 
             <a href="JavaScript:AddMessageCode('I','Enter text you want formatted in Italic', '', 5)"><img src="news_images/post_button_italic.gif" width="25" height="24" align="absmiddle" border="0" alt="Italic"></a> 
             <a href="JavaScript:AddMessageCode('U','Enter text you want Underlined', '', 5)"><img src="news_images/post_button_underline.gif" width="25" height="24" align="absmiddle" border="0" alt="Underline"></a> <a href="JavaScript:AddCode('URL', 5)"><img src="news_images/post_button_hyperlink.gif" width="25" height="24" align="absmiddle" border="0" alt="Add Hyperlink"></a> 
             <a href="JavaScript:AddCode('EMAIL', 5)"><img src="news_images/post_button_email.gif" width="25" height="24" align="absmiddle" border="0" alt="Add E-mail Link"></a> <a href="JavaScript:AddMessageCode('CENTER','Enter text you want Centred', '', 5)"><img src="news_images/post_button_centre.gif" width="25" height="24" align="absmiddle" border="0" alt="Centre"></a> 
             <a href="JavaScript:AddCode('LIST', 5)"><img src="news_images/post_button_list.gif" width="25" height="24" align="absmiddle" border="0" alt="List"></a> <a href="JavaScript:AddCode('INDENT', 5)"><img src="news_images/post_button_indent.gif" width="25" height="24" align="absmiddle" border="0" alt="Indent"></a> 
             <a href="JavaScript:AddCode('IMAGE', 5)"><img src="news_images/post_button_image.gif" width="25" height="24" align="absmiddle" border="0" alt="Add Image"></a> <select name="selectColour" onChange=AddColourCode(selectColour.options[selectColour.selectedIndex].value)>
              <option value="0" selected>-- Font Colour --</option>
              <option value="BLACK">Black</option>
              <option value="WHITE">White</option>
              <option value="BLUE">Blue</option>
              <option value="RED">Red</option>
              <option value="GREEN">Green</option>
              <option value="YELLOW">Yellow</option>
              <option value="ORANGE">Orange</option>
              <option value="BROWN">Brown</option>
              <option value="MAGENTA">Magenta</option>
              <option value="CYAN">Cyan</option>
              <option value="LIME GREEN">Lime Green</option>
             </select> </td>
           </tr>
          </table></td>
        </tr>
        <tr bgcolor="#FFFFFF" > 
         <td valign="top" align="right" height="61" width="14%" >News Item *:</td>
         <td height="61" width="86%" valign="top"> <textarea name="newsItem" cols="57" rows="12"><% = strNewsItem %></textarea> </td>
        </tr>
        <tr bgcolor="#FFFFFF">
         <td valign="top" align="right" height="2" >&nbsp;</td>
         <td height="2" align="left"><input name="lineBreak" type="checkbox" id="lineBreak" value="true" checked>
          Replace line breaks with the HTML &lt;br&gt; tag?</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
         <td valign="top" align="right" height="2" >&nbsp;</td>
         <td height="2" align="left"><input name="comments" type="checkbox" id="comments" value="True"<% If blnComments = True Then Response.Write(" checked") %>>
          Allow users to post comments on this news item</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
         <td valign="top" align="right" height="2" width="14%" > <input type="hidden" name="mode" value="<% = strMode %>"> <input type="hidden" name="NewsID" value="<% = lngNewsID %>"> &nbsp; </td>
         <td height="2" width="86%" align="left"> 
          <%
                            If strMode="edit" Then
                            %>
          <input type="submit" name="Submit" value="Update News Item"> 
          <%
                            Else
                            %>
          <input type="submit" name="Submit" value="Add News Item"> 
          <%
                            End If
                            %>
          <input type="button" name="Preview" value="Preview News Item" onClick="OpenPreviewWindow()"> <input type="reset" name="Reset" value="Reset Form"> </td>
        </tr>
       </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>