<%@ page import = "de.dhbw.StudentForum.DAO, de.dhbw.StudentForum.Posting, de.dhbw.StudentForum.Subject, de.dhbw.StudentForum.User" %>

<%	//	@author Marco Dauber, Eric Dussel, Jacob Krauth
	//	Service to create a new subject and the first post in it 

	String title = request.getParameter("np_posting_titel");
	String text = request.getParameter("np_posting_text");
	//String[] tags = ;	// Checkboxen aus Form 
	User loggedUser = (User) session.getAttribute("user");
	
	
	DAO daoObject = new DAO();
	
		if (title == null || text == null )
		{
			out.println("{status:\"ERROR\", message:\"Möglicherweise sind nicht alle Felder korrekt ausgefüllt. Bitte überprüfen Sie Ihre Eingaben.\"}");
		}
		else 
		{
			Subject subjectObject = new Subject();
			subjectObject.setName(title);
			int id = subjectObject.getId(title);
			
			Posting postingObject = new Posting();			
			postingObject.setText(text);
			/7postingObject.setTags(tags);
			postingObject.setAuthorid(loggedUser);
			postingObject.setsubjectid(id);
			
			try{
				daoObject.addNewPosting(postingObject);
				daoObject.addNewSubject(subjectObject);
				out.println("{status:\"OK\", message:\"Ihr Subject wurde erfolgreich erstellt.\"}");
			}catch(IOException e){
				out.println("{status:\"ERROR\", message:\" Probleme bei der Erstellung Ihres Posts. Bitte versuchen Sie es erneut. \"}");
			}
		}
%>
