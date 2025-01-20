@interface ICNotesFolderIntentHandler
- (ICFolderCoreDataIndexer)folderIndexer;
- (ICLegacyContext)legacyContext;
- (ICNoteContext)modernContext;
- (id)defaultFolderForNotesFolder:(id)a3;
- (void)handleNotesFolder:(id)a3 completion:(id)a4;
- (void)provideFolderOptionsCollectionForNotesFolder:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
- (void)resolveFolderForNotesFolder:(id)a3 withCompletion:(id)a4;
@end

@implementation ICNotesFolderIntentHandler

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

- (ICFolderCoreDataIndexer)folderIndexer
{
  if (!self->_folderIndexer)
  {
    v3 = [(ICNotesFolderIntentHandler *)self legacyContext];
    uint64_t v4 = [v3 managedObjectContext];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(ICNotesFolderIntentHandler *)self modernContext];
      v7 = [v6 workerManagedObjectContext];

      if (!v7) {
        goto LABEL_6;
      }
      id v8 = objc_alloc((Class)ICFolderCoreDataIndexer);
      v3 = [(ICNotesFolderIntentHandler *)self legacyContext];
      v9 = [v3 managedObjectContext];
      v10 = [(ICNotesFolderIntentHandler *)self modernContext];
      v11 = [v10 workerManagedObjectContext];
      v12 = (ICFolderCoreDataIndexer *)[v8 initWithLegacyManagedObjectContext:v9 modernManagedObjectContext:v11];
      folderIndexer = self->_folderIndexer;
      self->_folderIndexer = v12;
    }
  }
LABEL_6:
  v14 = self->_folderIndexer;

  return v14;
}

- (void)provideFolderOptionsCollectionForNotesFolder:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(ICNotesFolderIntentHandler *)self legacyContext];
  uint64_t v10 = [v9 managedObjectContext];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [(ICNotesFolderIntentHandler *)self modernContext];
    v13 = [v12 managedObjectContext];

    if (v13)
    {
      v14 = [(ICNotesFolderIntentHandler *)self folderIndexer];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100007A68;
      v17[3] = &unk_100020878;
      v17[4] = self;
      id v18 = v7;
      id v19 = v8;
      [v14 reloadData:v17];

      goto LABEL_8;
    }
  }
  else
  {
  }
  v15 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000140C8(v15);
  }

  id v16 = [objc_alloc((Class)INObjectCollection) initWithItems:&__NSArray0__struct];
  (*((void (**)(id, id, void))v8 + 2))(v8, v16, 0);

LABEL_8:
}

- (void)resolveFolderForNotesFolder:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [v6 folder];
  v9 = [v8 identifier];

  uint64_t v10 = [v6 folder];
  if (v9)
  {
    v11 = +[ICIntentNotesFolderResolutionResult successWithResolvedIntentNotesFolder:v10];
    v7[2](v7, v11);
  }
  else
  {
    v12 = [v10 displayString];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100008408;
    v13[3] = &unk_1000208A0;
    v14 = v7;
    [(ICNotesFolderIntentHandler *)self provideFolderOptionsCollectionForNotesFolder:v6 searchTerm:v12 withCompletion:v13];
  }
}

- (void)handleNotesFolder:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, ICNotesFolderIntentResponse *))a4;
  id v6 = a3;
  id v8 = [[ICNotesFolderIntentResponse alloc] initWithCode:2 userActivity:0];
  id v7 = [v6 folder];

  [(ICNotesFolderIntentResponse *)v8 setFolder:v7];
  v5[2](v5, v8);
}

- (id)defaultFolderForNotesFolder:(id)a3
{
  return +[ICIntentNotesFolder currentDefaultNotesFolder];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIndexer, 0);
  objc_storeStrong((id *)&self->_modernContext, 0);

  objc_storeStrong((id *)&self->_legacyContext, 0);
}

@end