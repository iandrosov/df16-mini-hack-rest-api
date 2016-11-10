@RestResource(urlMapping='/scontact')
global class Contact_REST {

    @HttpPost
	global static String doUpdate(String id, String des) {
	//global static String doUpdate(System.RestRequest req, System.RestResponse resp) {
        
		// Update contact Description data
        String rc = '';
 
                if (id != null){
                    List<Contact> cntList = [SELECT Id, Name, Description FROM Contact WHERE Id =:id];
                    if (cntList != null && cntList.size() > 0){
                        Contact cnt = cntList[0];
                        cnt.Description = des;
                        update cntList;
                    }
                }

       /* 
        if (req != null){
			if (req.params != null){
	    		String sfid = req.params.get('id');
	    		String des = req.params.get('des');
				System.debug('## TEst:'+des+' '+sfid);
                
                if (sfid != null){
                    List<Contact> cntList = [SELECT Id, Name, Description FROM Contact WHERE Id =:sfid];
                    if (cntList != null && cntList.size() > 0){
                        Contact cnt = cntList[0];
                        cnt.Description = des;
                        update cntList;
                    }
                }
            }
        }
		*/
        return rc;
    }
}