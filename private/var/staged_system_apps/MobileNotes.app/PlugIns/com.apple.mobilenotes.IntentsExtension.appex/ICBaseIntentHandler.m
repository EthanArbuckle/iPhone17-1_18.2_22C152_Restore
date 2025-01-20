@interface ICBaseIntentHandler
- (ICBaseIntentHandler)init;
- (ICUnifiedNoteContext)noteContext;
- (id)intentNoteForSearchIndexableNote:(id)a3;
- (id)intentNoteForSearchIndexableNote:(id)a3 includeContent:(BOOL)a4;
- (id)notesWithText:(id)a3 fromDate:(id)a4 toDate:(id)a5;
- (id)notesWithText:(id)a3 title:(id)a4 fromDate:(id)a5 toDate:(id)a6 dateSearchType:(int64_t)a7 modernFolderID:(id)a8 legacyFolderID:(id)a9;
- (id)notesWithTitle:(id)a3;
- (id)searchIndexableNoteForIntentNote:(id)a3;
- (id)searchableItemsWithText:(id)a3 title:(id)a4 fromDate:(id)a5 toDate:(id)a6 dateSearchType:(int64_t)a7;
- (void)refreshNotesForCollectionWithId:(id)a3 andContext:(id)a4;
@end

@implementation ICBaseIntentHandler

- (ICBaseIntentHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)ICBaseIntentHandler;
  v2 = [(ICBaseIntentHandler *)&v9 init];
  if (v2)
  {
    v3 = +[NoteContext sharedContext];
    +[ICPluginUtilities setupNoteContextWithOptions:66066];
    id v4 = objc_alloc((Class)ICUnifiedNoteContext);
    v5 = +[ICNoteContext sharedContext];
    v6 = (ICUnifiedNoteContext *)[v4 initWithModernNoteContext:v5 htmlNoteContext:v3];
    noteContext = v2->_noteContext;
    v2->_noteContext = v6;
  }
  return v2;
}

- (id)searchableItemsWithText:(id)a3 title:(id)a4 fromDate:(id)a5 toDate:(id)a6 dateSearchType:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = +[NSMutableArray array];
  v16 = +[NSMutableArray array];
  v59 = +[NSMutableArray array];
  v60 = v14;
  v58 = v16;
  if ([v11 length])
  {
    v17 = v15;
    id v56 = v13;
    id v18 = v12;
    v19 = +[ICSearchQueryOperation prefixMatchingQueryStringForSearchString:v11];
    id v20 = v11;
    v21 = +[ICSpotlightUtilities stringByEscapingSearchString:v11];
    id v22 = [v21 length];
    v23 = @"cwdt";
    if (!v22) {
      v23 = &stru_100021400;
    }
    uint64_t v24 = MDItemTextContent;
    v25 = v23;
    v26 = +[NSString stringWithFormat:@"%@=\"%@*\"%@", v24, v21, v25];
    v62[0] = v26;
    v27 = +[NSString stringWithFormat:@"%@=\"%@*\"%@", MDItemAuthors, v21, v25];
    v62[1] = v27;
    v28 = +[NSString stringWithFormat:@"%@=\"%@*\"%@", @"_ICItemDisplayName", v21, v25];

    v62[2] = v28;
    v29 = +[NSArray arrayWithObjects:v62 count:3];

    if (v19) {
      [v17 addObject:v19];
    }
    if (v29) {
      [v59 addObjectsFromArray:v29];
    }

    id v12 = v18;
    id v11 = v20;
    id v14 = v60;
    v15 = v17;
    id v13 = v56;
    v16 = v58;
  }
  if ([v12 length])
  {
    v57 = v15;
    v30 = +[ICSearchQueryOperation exactMatchingQueryStringForTitleSearchString:v12];
    if (v30) {
      [v57 addObject:v30];
    }
    if ([v11 length])
    {
      v31 = +[ICSpotlightUtilities stringByEscapingSearchString:v12];
      id v32 = [v31 length];
      CFStringRef v33 = @"cwdt";
      if (!v32) {
        CFStringRef v33 = &stru_100021400;
      }
      v34 = +[NSString stringWithFormat:@"%@=\"%@\"%@", @"_ICItemDisplayName", v31, v33];
      v61 = v34;
      v35 = +[NSArray arrayWithObjects:&v61 count:1];

      if (v35)
      {
        [v59 addObjectsFromArray:v35];
      }
    }

    v15 = v57;
    v16 = v58;
    id v14 = v60;
  }
  if (a7)
  {
    if (a7 == 3) {
      goto LABEL_30;
    }
    if (a7 != 2) {
      goto LABEL_38;
    }
  }
  if (v13 && v14)
  {
    [v13 timeIntervalSinceReferenceDate];
    uint64_t v37 = v36;
    [v14 timeIntervalSinceReferenceDate];
    +[NSString stringWithFormat:@"((contentModificationDate >= %f) && (contentModificationDate <= %f))", v37, v38];
  }
  else if (v13)
  {
    [v13 timeIntervalSinceReferenceDate];
    +[NSString stringWithFormat:@"(contentModificationDate >= %f)", v39, v55];
  }
  else
  {
    if (!v14) {
      goto LABEL_29;
    }
    [v14 timeIntervalSinceReferenceDate];
    +[NSString stringWithFormat:@"(contentModificationDate <= %f)", v40, v55];
  v41 = };
  [v16 addObject:v41];

  id v14 = v60;
LABEL_29:
  if (a7) {
    goto LABEL_38;
  }
LABEL_30:
  if (v13 && v14)
  {
    [v13 timeIntervalSinceReferenceDate];
    uint64_t v43 = v42;
    [v14 timeIntervalSinceReferenceDate];
    +[NSString stringWithFormat:@"((contentCreationDate >= %f) && (contentCreationDate <= %f))", v43, v44];
  }
  else if (v13)
  {
    [v13 timeIntervalSinceReferenceDate];
    +[NSString stringWithFormat:@"(contentCreationDate >= %f)", v45, v55];
  }
  else
  {
    if (!v14) {
      goto LABEL_38;
    }
    [v14 timeIntervalSinceReferenceDate];
    +[NSString stringWithFormat:@"(contentCreationDate <= %f)", v46, v55];
  v47 = };
  [v16 addObject:v47];

LABEL_38:
  if ((unint64_t)[v16 count] < 2)
  {
    if ([v16 count] != (id)1) {
      goto LABEL_45;
    }
    v49 = [v16 firstObject];
    [v15 addObject:v49];
  }
  else
  {
    v48 = [v16 componentsJoinedByString:@" || "];
    v49 = +[NSString stringWithFormat:@"(%@)", v48];

    if (v49) {
      [v15 addObject:v49];
    }
  }

LABEL_45:
  if ([v15 count]) {
    [v15 componentsJoinedByString:@" && "];
  }
  else {
  v50 = +[NSString stringWithFormat:@"(contentType == %@)", @"com.apple.notes.spotlightrecord"];
  }
  id v51 = +[ICSearchQueryOperation newOperationQueueWithName:@"com.apple.notes.find"];
  id v52 = [objc_alloc((Class)ICSearchQueryOperation) initWithQueryString:v50 rankingQueries:v59];
  [v51 addOperation:v52];
  [v51 waitUntilAllOperationsAreFinished];
  v53 = [v52 results];

  return v53;
}

- (id)notesWithText:(id)a3 title:(id)a4 fromDate:(id)a5 toDate:(id)a6 dateSearchType:(int64_t)a7 modernFolderID:(id)a8 legacyFolderID:(id)a9
{
  id v46 = a3;
  id v45 = a4;
  id v48 = a5;
  id v47 = a6;
  id v44 = a8;
  id v42 = a9;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = sub_100011A90;
  v75 = sub_100011AA0;
  id v76 = +[NSMutableArray array];
  v15 = +[NSMutableArray array];
  id v16 = v48;
  if (a7)
  {
    if (a7 == 3) {
      goto LABEL_13;
    }
    if (a7 != 2) {
      goto LABEL_21;
    }
  }
  if (v48 && v47)
  {
    v17 = +[NSPredicate predicateWithFormat:@"modificationDate >= %@", v48];
    id v18 = +[NSPredicate predicateWithFormat:@"modificationDate <= %@", v47];
    v79[0] = v17;
    v79[1] = v18;
    v19 = +[NSArray arrayWithObjects:v79 count:2];
    id v20 = +[NSCompoundPredicate andPredicateWithSubpredicates:v19];
    [v15 addObject:v20];
  }
  else if (v48)
  {
    v17 = +[NSPredicate predicateWithFormat:@"modificationDate >= %@", v48];
    [v15 addObject:v17];
  }
  else
  {
    if (!v47) {
      goto LABEL_12;
    }
    v17 = +[NSPredicate predicateWithFormat:@"modificationDate <= %@", v47];
    [v15 addObject:v17];
  }

  id v16 = v48;
LABEL_12:
  if (a7) {
    goto LABEL_21;
  }
LABEL_13:
  if (v16 && v47)
  {
    v21 = +[NSPredicate predicateWithFormat:@"creationDate >= %@", v16];
    id v22 = +[NSPredicate predicateWithFormat:@"creationDate <= %@", v47];
    v78[0] = v21;
    v78[1] = v22;
    v23 = +[NSArray arrayWithObjects:v78 count:2];
    uint64_t v24 = +[NSCompoundPredicate andPredicateWithSubpredicates:v23];
    [v15 addObject:v24];
  }
  else if (v16)
  {
    v21 = +[NSPredicate predicateWithFormat:@"creationDate >= %@", v16];
    [v15 addObject:v21];
  }
  else
  {
    if (!v47) {
      goto LABEL_21;
    }
    v21 = +[NSPredicate predicateWithFormat:@"creationDate <= %@", v47];
    [v15 addObject:v21];
  }

LABEL_21:
  if ((unint64_t)[v15 count] < 2)
  {
    if ([v15 count] == (id)1)
    {
      uint64_t v43 = [v15 firstObject];
    }
    else
    {
      uint64_t v43 = 0;
    }
  }
  else
  {
    uint64_t v43 = +[NSCompoundPredicate orPredicateWithSubpredicates:v15];
  }
  v25 = [(ICBaseIntentHandler *)self noteContext];
  v26 = [v25 modernManagedObjectContext];

  v27 = [(ICBaseIntentHandler *)self noteContext];
  v28 = [v27 htmlManagedObjectContext];

  v29 = +[NSCharacterSet whitespaceCharacterSet];
  v30 = [v46 stringByTrimmingCharactersInSet:v29];
  v31 = "@\"<ICLegacyFolder>\"16@0:8" + 25;
  if ([v30 length])
  {

LABEL_29:
    v35 = [(ICBaseIntentHandler *)self searchableItemsWithText:v46 title:v45 fromDate:v48 toDate:v47 dateSearchType:a7];
    uint64_t v36 = +[ICSearchIndexer sharedIndexer];
    v77[0] = v28;
    v77[1] = v26;
    uint64_t v37 = +[NSArray arrayWithObjects:v77 count:2];
    uint64_t v38 = [v36 objectsForSearchableItems:v35 inContexts:v37];

    v65 = _NSConcreteStackBlock;
    uint64_t v66 = *((void *)v31 + 253);
    v67 = sub_100011AA8;
    v68 = &unk_100020DF8;
    id v69 = v38;
    v70 = &v71;
    performBlockOnMainThreadAndWait();

    goto LABEL_30;
  }
  id v32 = +[NSCharacterSet whitespaceCharacterSet];
  CFStringRef v33 = [v45 stringByTrimmingCharactersInSet:v32];
  BOOL v34 = [v33 length] == 0;

  v31 = "";
  if (!v34) {
    goto LABEL_29;
  }
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = sub_100011A90;
  v63[4] = sub_100011AA0;
  id v64 = 0;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100011C30;
  v57[3] = &unk_100020E20;
  id v58 = v44;
  id v59 = v26;
  id v41 = v43;
  id v60 = v41;
  v61 = v63;
  v62 = &v71;
  [v59 performBlockAndWait:v57];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100011E60;
  v52[3] = &unk_100020E48;
  id v53 = v41;
  id v54 = v28;
  uint64_t v55 = v63;
  id v56 = &v71;
  [v54 performBlockAndWait:v52];

  _Block_object_dispose(v63, 8);
LABEL_30:
  id v49 = v43;
  id v50 = v44;
  id v51 = v42;
  performBlockOnMainThreadAndWait();
  id v39 = (id)v72[5];

  _Block_object_dispose(&v71, 8);

  return v39;
}

- (id)notesWithText:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return [(ICBaseIntentHandler *)self notesWithText:a3 title:0 fromDate:a4 toDate:a5 dateSearchType:0 modernFolderID:0 legacyFolderID:0];
}

- (id)notesWithTitle:(id)a3
{
  return [(ICBaseIntentHandler *)self notesWithText:0 title:a3 fromDate:0 toDate:0 dateSearchType:0 modernFolderID:0 legacyFolderID:0];
}

- (id)intentNoteForSearchIndexableNote:(id)a3
{
  return [(ICBaseIntentHandler *)self intentNoteForSearchIndexableNote:a3 includeContent:0];
}

- (id)intentNoteForSearchIndexableNote:(id)a3 includeContent:(BOOL)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100011A90;
  id v22 = sub_100011AA0;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100011A90;
  v16[4] = sub_100011AA0;
  id v17 = &__NSArray0__struct;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 managedObjectContext];
    v8 = v14;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100012684;
    v14[3] = &unk_100020E70;
    BOOL v15 = a4;
    v14[4] = v6;
    v14[5] = v16;
    v14[6] = &v18;
    v14[7] = 252;
    [v7 performBlockAndWait:v14];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v9 = v5;
    v7 = [v9 managedObjectContext];
    v8 = v12;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100012948;
    v12[3] = &unk_100020E70;
    BOOL v13 = a4;
    v12[4] = v9;
    v12[5] = v16;
    v12[6] = &v18;
    v12[7] = 252;
    [v7 performBlockAndWait:v12];
  }

LABEL_6:
  id v10 = (id)v19[5];
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v18, 8);

  return v10;
}

- (id)searchIndexableNoteForIntentNote:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    id v5 = +[NSURL URLWithString:v4];
    id v6 = [(ICBaseIntentHandler *)self noteContext];
    v7 = [v6 modernManagedObjectContext];
    v8 = [(ICBaseIntentHandler *)self noteContext];
    id v9 = [v8 htmlManagedObjectContext];
    id v10 = +[NotesAssistantUtilities searchIndexableNoteForObject:v5 modernNoteContext:v7 htmlNoteContext:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)refreshNotesForCollectionWithId:(id)a3 andContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((void *)0) != collectionId", "-[ICBaseIntentHandler refreshNotesForCollectionWithId:andContext:]", 1, 0, @"Should not pass nil collection ID into refreshNotesForCollectionWithId:.");
  }
  v7 = [v6 collectionForObjectID:v5];
  v8 = [v7 basicAccountIdentifier];
  if (([v8 isEqualToString:kLocalAccountIdentifier] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = +[DADConnection sharedConnection];
      unsigned int v10 = [v9 updateContentsOfAllFoldersForAccountID:v8 andDataclass:32 isUserRequested:1];

      id v11 = os_log_create("com.apple.notes", "Intents");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        uint64_t v20 = v8;
        __int16 v21 = 1024;
        LODWORD(v22) = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Result of updating all folders for account ID %@: %d", (uint8_t *)&v19, 0x12u);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v7;
        BOOL v13 = +[DADConnection sharedConnection];
        id v14 = [v12 externalIdentifier];
        v25 = v14;
        BOOL v15 = +[NSArray arrayWithObjects:&v25 count:1];
        unsigned int v16 = [v13 updateContentsOfFoldersWithKeys:v15 forAccountID:v8 andDataclass:32 isUserRequested:1];

        id v17 = os_log_create("com.apple.notes", "Intents");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v12 externalIdentifier];
          int v19 = 138412802;
          uint64_t v20 = v18;
          __int16 v21 = 2112;
          id v22 = v8;
          __int16 v23 = 1024;
          unsigned int v24 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Result of updating folder with identifier %@ for account ID %@: %d", (uint8_t *)&v19, 0x1Cu);
        }
      }
    }
  }
}

- (ICUnifiedNoteContext)noteContext
{
  return self->_noteContext;
}

- (void).cxx_destruct
{
}

@end