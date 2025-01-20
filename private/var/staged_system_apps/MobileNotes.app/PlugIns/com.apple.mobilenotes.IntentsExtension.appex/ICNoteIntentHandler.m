@interface ICNoteIntentHandler
- (ICLegacyContext)legacyContext;
- (ICNoteContext)modernContext;
- (ICRecentNotesCoreDataIndexer)recentNotesIndexer;
- (id)defaultNoteForNote:(id)a3;
- (void)handleNote:(id)a3 completion:(id)a4;
- (void)provideNoteOptionsCollectionForNote:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
- (void)recentNotesWithCompletion:(id)a3;
- (void)resolveNoteForNote:(id)a3 withCompletion:(id)a4;
@end

@implementation ICNoteIntentHandler

- (ICLegacyContext)legacyContext
{
  legacyContext = self->_legacyContext;
  if (!legacyContext)
  {
    v4 = +[NoteContext sharedContext];
    [v4 enableChangeLogging:1];

    v5 = +[NoteContext sharedContext];
    v6 = self->_legacyContext;
    self->_legacyContext = v5;

    legacyContext = self->_legacyContext;
  }

  return legacyContext;
}

- (ICNoteContext)modernContext
{
  modernContext = self->_modernContext;
  if (!modernContext)
  {
    +[ICPluginUtilities setupNoteContextWithOptions:66066];
    v4 = +[ICNoteContext sharedContext];
    v5 = self->_modernContext;
    self->_modernContext = v4;

    modernContext = self->_modernContext;
  }

  return modernContext;
}

- (ICRecentNotesCoreDataIndexer)recentNotesIndexer
{
  if (!self->_recentNotesIndexer)
  {
    v5 = [(ICNoteIntentHandler *)self legacyContext];
    uint64_t v6 = [v5 managedObjectContext];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [(ICNoteIntentHandler *)self modernContext];
      v9 = [v8 workerManagedObjectContext];

      if (v9)
      {
        id v10 = objc_alloc((Class)ICRecentNotesCoreDataIndexer);
        v11 = [(ICNoteIntentHandler *)self legacyContext];
        v12 = [v11 managedObjectContext];
        v13 = [(ICNoteIntentHandler *)self modernContext];
        v14 = [v13 workerManagedObjectContext];
        v15 = (ICRecentNotesCoreDataIndexer *)[v10 initWithLegacyManagedObjectContext:v12 modernManagedObjectContext:v14];
        recentNotesIndexer = self->_recentNotesIndexer;
        self->_recentNotesIndexer = v15;

        [(ICRecentNotesCoreDataIndexer *)self->_recentNotesIndexer setMaximumNumberOfNotesPerAccount:20];
      }
    }
    else
    {
    }
  }
  v3 = self->_recentNotesIndexer;

  return v3;
}

- (void)recentNotesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICNoteIntentHandler *)self legacyContext];
  uint64_t v6 = [v5 managedObjectContext];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(ICNoteIntentHandler *)self modernContext];
    v9 = [v8 managedObjectContext];

    if (v9)
    {
      id v10 = [(ICNoteIntentHandler *)self recentNotesIndexer];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100005B84;
      v20[3] = &unk_100020828;
      v20[4] = self;
      id v21 = v4;
      [v10 reloadData:v20];

      goto LABEL_8;
    }
  }
  else
  {
  }
  v11 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100013E5C(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  id v19 = [objc_alloc((Class)INObjectCollection) initWithItems:&__NSArray0__struct];
  (*((void (**)(id, id, void))v4 + 2))(v4, v19, 0);

LABEL_8:
}

- (void)provideNoteOptionsCollectionForNote:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 length])
  {
    v9 = [(ICNoteIntentHandler *)self legacyContext];
    uint64_t v10 = [v9 managedObjectContext];
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = [(ICNoteIntentHandler *)self modernContext];
      uint64_t v13 = [v12 managedObjectContext];

      if (v13)
      {
        id v14 = [objc_alloc((Class)ICSearchQueryOperation) initWithSearchSuggestionsResponder:0 searchString:v7 performNLSearch:0 performTopHitSearch:0 tokens:0];
        uint64_t v15 = +[NSOperationQueue mainQueue];
        [v15 addOperation:v14];

        id v25 = v8;
        id v16 = v14;
        dispatchMainAfterDelay();

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v17 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100013E5C(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    id v16 = [objc_alloc((Class)INObjectCollection) initWithItems:&__NSArray0__struct];
    (*((void (**)(id, id, void))v8 + 2))(v8, v16, 0);
    goto LABEL_10;
  }
  [(ICNoteIntentHandler *)self recentNotesWithCompletion:v8];
LABEL_11:
}

- (void)resolveNoteForNote:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [v6 note];
  v9 = [v8 identifier];

  uint64_t v10 = [v6 note];
  if (v9)
  {
    v11 = +[ICIntentNoteResolutionResult successWithResolvedIntentNote:v10];
    v7[2](v7, v11);
  }
  else
  {
    uint64_t v12 = [v10 displayString];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006F0C;
    v13[3] = &unk_1000208A0;
    id v14 = v7;
    [(ICNoteIntentHandler *)self provideNoteOptionsCollectionForNote:v6 searchTerm:v12 withCompletion:v13];
  }
}

- (void)handleNote:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, ICNoteIntentResponse *))a4;
  id v6 = a3;
  id v8 = [[ICNoteIntentResponse alloc] initWithCode:2 userActivity:0];
  id v7 = [v6 note];

  [(ICNoteIntentResponse *)v8 setNote:v7];
  v5[2](v5, v8);
}

- (id)defaultNoteForNote:(id)a3
{
  id v4 = a3;
  v5 = [(ICNoteIntentHandler *)self legacyContext];
  uint64_t v6 = [v5 managedObjectContext];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(ICNoteIntentHandler *)self modernContext];
    v9 = [v8 managedObjectContext];

    if (v9)
    {
      uint64_t v10 = [(ICNoteIntentHandler *)self recentNotesIndexer];
      [v10 reloadDataAndWait];

      objc_opt_class();
      v11 = [(ICNoteIntentHandler *)self recentNotesIndexer];
      uint64_t v12 = [v11 firstRelevantItemIdentifier];
      uint64_t v13 = ICDynamicCast();

      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x3032000000;
      v45[3] = sub_10000607C;
      v45[4] = sub_10000608C;
      id v46 = 0;
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x3032000000;
      v42 = sub_10000607C;
      v43 = sub_10000608C;
      id v44 = 0;
      if ([v13 ic_isModernNoteType])
      {
        id v14 = [(ICNoteIntentHandler *)self modernContext];
        uint64_t v15 = [v14 managedObjectContext];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100007418;
        v35[3] = &unk_1000207B0;
        v37 = v45;
        v35[4] = self;
        v36 = v13;
        v38 = &v39;
        [v15 performBlockAndWait:v35];

        id v16 = v36;
      }
      else
      {
        if (![v13 ic_isLegacyNoteType])
        {
          v27 = os_log_create("com.apple.notes", "Intents");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_100014060();
          }

          goto LABEL_15;
        }
        id v25 = [(ICNoteIntentHandler *)self legacyContext];
        v26 = [v25 managedObjectContext];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1000074E0;
        v31[3] = &unk_1000207B0;
        v33 = v45;
        v31[4] = self;
        v32 = v13;
        v34 = &v39;
        [v26 performBlockAndWait:v31];

        id v16 = v32;
      }

LABEL_15:
      uint64_t v24 = (void *)v40[5];
      if (v24)
      {
        id v28 = v24;
      }
      else
      {
        v29 = os_log_create("com.apple.notes", "Intents");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100013FF8();
        }
      }
      _Block_object_dispose(&v39, 8);

      _Block_object_dispose(v45, 8);
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v13 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100013FC0(v13, v17, v18, v19, v20, v21, v22, v23);
  }
  uint64_t v24 = 0;
LABEL_21:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentNotesIndexer, 0);
  objc_storeStrong((id *)&self->_modernContext, 0);

  objc_storeStrong((id *)&self->_legacyContext, 0);
}

@end