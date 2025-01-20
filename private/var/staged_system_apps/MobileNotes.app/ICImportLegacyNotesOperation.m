@interface ICImportLegacyNotesOperation
- (BOOL)deleteLegacyNotesAfterImport;
- (ICFolder)destinationFolder;
- (ICImportLegacyNotesOperation)init;
- (ICImportLegacyNotesOperation)initWithLegacyNotes:(id)a3 destinationFolder:(id)a4 deleteLegacyNotesAfterImport:(BOOL)a5;
- (NSArray)legacyNotes;
- (id)description;
- (id)ensureLegacyNoteIsValid:(id)a3;
- (id)legacyManagedObjectContext;
- (void)cancelIfNecessary;
- (void)main;
- (void)setDeleteLegacyNotesAfterImport:(BOOL)a3;
- (void)setDestinationFolder:(id)a3;
- (void)setLegacyNotes:(id)a3;
@end

@implementation ICImportLegacyNotesOperation

- (ICImportLegacyNotesOperation)init
{
  return 0;
}

- (ICImportLegacyNotesOperation)initWithLegacyNotes:(id)a3 destinationFolder:(id)a4 deleteLegacyNotesAfterImport:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICImportLegacyNotesOperation;
  v10 = [(ICImportLegacyNotesOperation *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(ICImportLegacyNotesOperation *)v10 setDestinationFolder:v9];
    v12 = +[NSArray arrayWithArray:v8];
    [(ICImportLegacyNotesOperation *)v11 setLegacyNotes:v12];

    [(ICImportLegacyNotesOperation *)v11 setDeleteLegacyNotesAfterImport:v5];
  }

  return v11;
}

- (void)main
{
  v3 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004DCA94((uint64_t)self, v3);
  }

  [(ICImportLegacyNotesOperation *)self cancelIfNecessary];
  if (([(ICImportLegacyNotesOperation *)self isCancelled] & 1) == 0)
  {
    v13 = +[ICNoteContext sharedContext];
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = sub_10011E2B8;
    v38[4] = sub_10011E2C8;
    id v39 = 0;
    v4 = [(ICImportLegacyNotesOperation *)self destinationFolder];
    BOOL v5 = [v4 managedObjectContext];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10011E2D0;
    v37[3] = &unk_100626040;
    v37[4] = self;
    v37[5] = v38;
    [v5 performBlockAndWait:v37];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v6 = [(ICImportLegacyNotesOperation *)self legacyNotes];
    id v7 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v34;
      while (2)
      {
        id v9 = 0;
        do
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v9);
          [(ICImportLegacyNotesOperation *)self cancelIfNecessary];
          if ([(ICImportLegacyNotesOperation *)self isCancelled])
          {

            goto LABEL_18;
          }
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x3032000000;
          v30 = sub_10011E2B8;
          v31 = sub_10011E2C8;
          id v32 = v10;
          v21 = _NSConcreteStackBlock;
          uint64_t v22 = 3221225472;
          v23 = sub_10011E338;
          v24 = &unk_100626040;
          v25 = self;
          v26 = &v27;
          performBlockOnMainThreadAndWait();
          _Block_object_dispose(&v27, 8);

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = sub_10011E2B8;
    v31 = sub_10011E2C8;
    id v32 = 0;
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_10011E618;
    v19 = &unk_1006265A8;
    v20 = &v27;
    performBlockOnMainThreadAndWait();
    if (v28[5])
    {
      v11 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1004DCA14((uint64_t)&v28, v11);
      }
    }
    v12 = [v13 managedObjectContext];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10011E694;
    v14[3] = &unk_100625AF0;
    id v15 = v13;
    [v12 performBlockAndWait:v14];

    _Block_object_dispose(&v27, 8);
LABEL_18:
    _Block_object_dispose(v38, 8);
  }
}

- (void)cancelIfNecessary
{
  v3 = [(ICImportLegacyNotesOperation *)self destinationFolder];

  if (v3)
  {
    v4 = [(ICImportLegacyNotesOperation *)self destinationFolder];
    BOOL v5 = [v4 managedObjectContext];

    if (v5)
    {
      v6 = [(ICImportLegacyNotesOperation *)self destinationFolder];
      id v7 = [v6 managedObjectContext];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10011E858;
      v10[3] = &unk_100625AF0;
      v10[4] = self;
      [v7 performBlockAndWait:v10];

      return;
    }
    uint64_t v8 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      id v9 = "Cancelling import operation because folder lost its managed object context: %@";
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      id v9 = "Cancelling import operation because folder doesn't exist: %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }

  [(ICImportLegacyNotesOperation *)self cancel];
}

- (id)ensureLegacyNoteIsValid:(id)a3
{
  id v3 = a3;
  v4 = [v3 managedObjectContext];

  if (v4)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = sub_10011E2B8;
    v12 = sub_10011E2C8;
    id v13 = 0;
    id v7 = v3;
    performBlockOnMainThreadAndWait();
    id v5 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
  }

  return v5;
}

- (id)legacyManagedObjectContext
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = sub_10011E2B8;
  uint64_t v8 = sub_10011E2C8;
  id v9 = 0;
  performBlockOnMainThreadAndWait();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)description
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10011E2B8;
  v16 = sub_10011E2C8;
  id v17 = 0;
  id v3 = [(ICImportLegacyNotesOperation *)self destinationFolder];
  uint64_t v4 = [v3 managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011EE74;
  v11[3] = &unk_100626040;
  v11[4] = self;
  v11[5] = &v12;
  [v4 performBlockAndWait:v11];

  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = [(ICImportLegacyNotesOperation *)self legacyNotes];
  id v8 = [v7 count];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; legacyNoteCount=%d destionationFolder=%@>",
    v6,
    self,
    v8,
  id v9 = v13[5]);

  _Block_object_dispose(&v12, 8);

  return v9;
}

- (ICFolder)destinationFolder
{
  return self->_destinationFolder;
}

- (void)setDestinationFolder:(id)a3
{
}

- (NSArray)legacyNotes
{
  return self->_legacyNotes;
}

- (void)setLegacyNotes:(id)a3
{
}

- (BOOL)deleteLegacyNotesAfterImport
{
  return self->_deleteLegacyNotesAfterImport;
}

- (void)setDeleteLegacyNotesAfterImport:(BOOL)a3
{
  self->_deleteLegacyNotesAfterImport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNotes, 0);

  objc_storeStrong((id *)&self->_destinationFolder, 0);
}

@end