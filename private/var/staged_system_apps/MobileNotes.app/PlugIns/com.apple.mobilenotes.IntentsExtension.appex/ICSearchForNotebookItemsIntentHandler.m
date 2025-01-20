@interface ICSearchForNotebookItemsIntentHandler
- (void)handleSearchForNotebookItems:(id)a3 completion:(id)a4;
- (void)resolveContentForSearchForNotebookItems:(id)a3 withCompletion:(id)a4;
- (void)resolveTitleForSearchForNotebookItems:(id)a3 withCompletion:(id)a4;
@end

@implementation ICSearchForNotebookItemsIntentHandler

- (void)resolveTitleForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  id v11 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  v6 = [v11 title];
  v7 = [v6 spokenPhrase];
  id v8 = [v7 length];

  if (v8)
  {
    v9 = [v11 title];
    uint64_t v10 = +[INSpeakableStringResolutionResult successWithResolvedString:v9];
    v5[2](v5, v10);

    v5 = (void (**)(id, uint64_t))v10;
  }
  else
  {
    v9 = +[INSpeakableStringResolutionResult notRequired];
    v5[2](v5, (uint64_t)v9);
  }
}

- (void)resolveContentForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  v6 = [v10 content];
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = [v10 content];
    uint64_t v9 = +[INStringResolutionResult successWithResolvedString:v8];
    v5[2](v5, v9);

    v5 = (void (**)(id, uint64_t))v9;
  }
  else
  {
    id v8 = +[INStringResolutionResult notRequired];
    v5[2](v5, (uint64_t)v8);
  }
}

- (void)handleSearchForNotebookItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v65 = (void (**)(id, id))a4;
  id v7 = [v6 title];
  uint64_t v8 = [v7 spokenPhrase];

  uint64_t v9 = [v6 content];
  id v10 = [v6 dateTime];
  uint64_t v11 = [v10 startDateComponents];

  v12 = [v6 dateTime];
  uint64_t v13 = [v12 endDateComponents];

  if (v11)
  {
    v14 = +[NSCalendar currentCalendar];
    uint64_t v15 = [v14 dateFromComponents:v11];

    if (v13)
    {
LABEL_3:
      v16 = +[NSCalendar currentCalendar];
      v68 = [v16 dateFromComponents:v13];

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (v13) {
      goto LABEL_3;
    }
  }
  v68 = 0;
LABEL_6:
  v63 = (void *)v13;
  v64 = (void *)v11;
  id v67 = [v6 dateSearchType];
  v17 = [v6 groupName];
  v18 = [v17 vocabularyIdentifier];

  v66 = (void *)v15;
  if (v18)
  {
    v19 = [v6 groupName];
    v20 = [v19 vocabularyIdentifier];
    v21 = +[NSURL URLWithString:v20];

    v22 = [(ICBaseIntentHandler *)self noteContext];
    v23 = [v22 modernManagedObjectContext];
    v24 = [v23 persistentStoreCoordinator];
    [v24 managedObjectIDForURIRepresentation:v21];
    v26 = uint64_t v25 = v8;

    v27 = [(ICBaseIntentHandler *)self noteContext];
    v28 = [v27 htmlManagedObjectContext];
    v29 = [v28 persistentStoreCoordinator];
    uint64_t v30 = [v29 managedObjectIDForURIRepresentation:v21];

    v31 = (void *)v26;
    uint64_t v8 = v25;
    uint64_t v15 = (uint64_t)v66;
  }
  else
  {
    uint64_t v30 = 0;
    v31 = 0;
  }
  v62 = v31;
  v32 = -[ICBaseIntentHandler notesWithText:title:fromDate:toDate:dateSearchType:modernFolderID:legacyFolderID:](self, "notesWithText:title:fromDate:toDate:dateSearchType:modernFolderID:legacyFolderID:", v9, v8, v15, v68, v67, v30);
  v33 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    sub_10001491C(v33);
  }

  id v60 = [v32 count];
  v69 = (void *)v9;
  v70 = (void *)v8;
  if ((unint64_t)v60 > kICMaximumSiriNoteCount + 1)
  {
    uint64_t v34 = [v32 subarrayWithRange:0];

    v32 = (void *)v34;
  }
  v61 = (void *)v30;
  id v35 = objc_alloc_init((Class)NSMutableArray);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v36 = v32;
  id v37 = [v36 countByEnumeratingWithState:&v71 objects:v75 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = 0;
    uint64_t v40 = *(void *)v72;
    do
    {
      v41 = 0;
      do
      {
        if (*(void *)v72 != v40) {
          objc_enumerationMutation(v36);
        }
        uint64_t v42 = *(void *)(*((void *)&v71 + 1) + 8 * (void)v41);
        unsigned int v43 = [v6 includeAllNoteContents];
        if ((unint64_t)v41 + v39 < 5) {
          uint64_t v44 = 1;
        }
        else {
          uint64_t v44 = v43;
        }
        v45 = [(ICBaseIntentHandler *)self intentNoteForSearchIndexableNote:v42 includeContent:v44];
        if (v45) {
          [v35 addObject:v45];
        }

        v41 = (char *)v41 + 1;
      }
      while (v38 != v41);
      id v38 = [v36 countByEnumeratingWithState:&v71 objects:v75 count:16];
      v39 += (uint64_t)v41;
    }
    while (v38);
  }

  id v46 = objc_alloc((Class)NSUserActivity);
  v47 = (objc_class *)objc_opt_class();
  v48 = NSStringFromClass(v47);
  id v49 = [v46 initWithActivityType:v48];

  id v50 = objc_alloc_init((Class)NSMutableDictionary);
  v51 = NSStringFromSelector("title");
  [v50 setObject:v70 forKeyedSubscript:v51];

  v52 = NSStringFromSelector("content");
  [v50 setObject:v69 forKeyedSubscript:v52];

  v53 = NSStringFromSelector("fromDate");
  [v50 setObject:v66 forKeyedSubscript:v53];

  v54 = NSStringFromSelector("toDate");
  [v50 setObject:v68 forKeyedSubscript:v54];

  v55 = +[NSNumber numberWithInteger:v67];
  v56 = NSStringFromSelector("dateSearchType");
  [v50 setObject:v55 forKeyedSubscript:v56];

  v57 = +[NSNumber numberWithInteger:v60];
  v58 = NSStringFromSelector("count");
  [v50 setObject:v57 forKeyedSubscript:v58];

  [v49 setUserInfo:v50];
  id v59 = [objc_alloc((Class)INSearchForNotebookItemsIntentResponse) initWithCode:3 userActivity:v49];
  [v59 setNotes:v35];
  v65[2](v65, v59);
}

@end