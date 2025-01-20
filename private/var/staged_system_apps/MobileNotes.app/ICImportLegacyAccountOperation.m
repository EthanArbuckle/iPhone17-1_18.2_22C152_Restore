@interface ICImportLegacyAccountOperation
+ (unint64_t)noteMigrationBatchSize;
+ (void)ensurePermanentObjectIDForObject:(id)a3;
- (BOOL)isCopyingPrimaryAccount;
- (BOOL)isLegacyNoteADuplicate:(id)a3;
- (BOOL)randomizeImportOrder;
- (BOOL)renameFolders;
- (ICImportLegacyAccountOperation)initWithLegacyAccount:(id)a3 destinationAccount:(id)a4 renameFolders:(BOOL)a5;
- (NSManagedObjectID)destinationAccountObjectID;
- (NSManagedObjectID)legacyAccountObjectID;
- (id)existingImportedNoteForLegacyNote:(id)a3 withContentHash:(id)a4 identifier:(id)a5 context:(id)a6;
- (id)hashFromAttributedString:(id)a3;
- (id)importLegacyFolder:(id)a3 toAccount:(id)a4;
- (id)importLegacyNote:(id)a3 deviceMigrationIdentifier:(id)a4 toFolder:(id)a5;
- (id)legacyAccountInContext:(id)a3;
- (id)legacyNoteObjectIDsToImport;
- (int64_t)importChoiceForLegacyNote:(id)a3 withContentHash:(id)a4 identifier:(id)a5 existingImportedNote:(id)a6 destinationAccount:(id)a7;
- (void)cancelIfAccountWasDeleted;
- (void)importFolders;
- (void)importNotes;
- (void)main;
- (void)setCopyingPrimaryAccount:(BOOL)a3;
- (void)setDestinationAccountObjectID:(id)a3;
- (void)setLegacyAccountObjectID:(id)a3;
- (void)setRandomizeImportOrder:(BOOL)a3;
- (void)setRenameFolders:(BOOL)a3;
@end

@implementation ICImportLegacyAccountOperation

- (ICImportLegacyAccountOperation)initWithLegacyAccount:(id)a3 destinationAccount:(id)a4 renameFolders:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICImportLegacyAccountOperation;
  v10 = [(ICImportLegacyAccountOperation *)&v15 init];
  if (v10)
  {
    if ([v8 isManaged])
    {
      v11 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1004D6578(v11);
      }

      v10 = 0;
    }
    else
    {
      [(id)objc_opt_class() ensurePermanentObjectIDForObject:v8];
      v12 = [v8 objectID];
      [(ICImportLegacyAccountOperation *)v10 setLegacyAccountObjectID:v12];

      [(id)objc_opt_class() ensurePermanentObjectIDForObject:v9];
      v13 = [v9 objectID];
      [(ICImportLegacyAccountOperation *)v10 setDestinationAccountObjectID:v13];

      [(ICImportLegacyAccountOperation *)v10 setRenameFolders:v5];
      [(ICImportLegacyAccountOperation *)v10 setCopyingPrimaryAccount:1];
    }
  }

  return v10;
}

- (void)cancelIfAccountWasDeleted
{
  v3 = +[ICNoteContext sharedContext];
  v4 = [v3 snapshotManagedObjectContext];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008129C;
  v10[3] = &unk_100625860;
  v10[4] = self;
  id v11 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v10];
  if (([(ICImportLegacyAccountOperation *)self isCancelled] & 1) == 0)
  {
    v6 = ICNewLegacyContext();
    v7 = [(ICImportLegacyAccountOperation *)self legacyAccountInContext:v6];
    if (!v7)
    {
      id v8 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cancelling legacy import operation because the legacy account does not exist", v9, 2u);
      }

      [(ICImportLegacyAccountOperation *)self cancel];
    }
  }
}

- (id)legacyAccountInContext:(id)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100081584;
  v20 = sub_100081594;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008159C;
  v12[3] = &unk_100625700;
  objc_super v15 = &v16;
  id v5 = a3;
  id v13 = v5;
  v14 = self;
  [v5 performBlockAndWait:v12];
  v6 = (void *)v17[5];
  if (!v6)
  {
    v7 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (id)objc_opt_class();
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v23 = v8;
      __int16 v24 = 2048;
      v25 = self;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@(%p) %@] no legacy account found", buf, 0x20u);
    }
    v6 = (void *)v17[5];
  }
  id v10 = v6;

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (void)main
{
  v3 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004D6650(self, v3);
  }

  [(ICImportLegacyAccountOperation *)self cancelIfAccountWasDeleted];
  if (([(ICImportLegacyAccountOperation *)self isCancelled] & 1) == 0)
  {
    [(ICImportLegacyAccountOperation *)self cancelIfAccountWasDeleted];
    if (([(ICImportLegacyAccountOperation *)self isCancelled] & 1) == 0)
    {
      [(ICImportLegacyAccountOperation *)self importFolders];
      [(ICImportLegacyAccountOperation *)self cancelIfAccountWasDeleted];
      if (([(ICImportLegacyAccountOperation *)self isCancelled] & 1) == 0) {
        [(ICImportLegacyAccountOperation *)self importNotes];
      }
    }
  }
}

- (id)legacyNoteObjectIDsToImport
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100081584;
  v22 = sub_100081594;
  id v23 = 0;
  v3 = ICNewLegacyContext();
  v4 = [(ICImportLegacyAccountOperation *)self legacyAccountInContext:v3];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100081900;
  v14[3] = &unk_100625700;
  v17 = &v18;
  id v5 = v3;
  id v15 = v5;
  id v6 = v4;
  id v16 = v6;
  [v5 performBlockAndWait:v14];
  if ([(ICImportLegacyAccountOperation *)self randomizeImportOrder])
  {
    id v7 = [(id)v19[5] mutableCopy];
    id v8 = (char *)[v7 count];
    if (v8)
    {
      uint64_t v9 = 0;
      do
      {
        [v7 exchangeObjectAtIndex:v9 withObjectAtIndex:v9 + arc4random_uniform((uint32_t)v8)];
        ++v9;
        --v8;
      }
      while (v8);
    }
    id v10 = [v7 copy];
    id v11 = (void *)v19[5];
    v19[5] = (uint64_t)v10;
  }
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v12;
}

- (void)importNotes
{
  v3 = ICNewLegacyContext();
  v4 = +[ICAccountUtilities sharedInstance];
  id v5 = [v4 primaryICloudACAccount];
  id v6 = [v5 identifier];

  id v7 = [(id)objc_opt_class() noteMigrationBatchSize];
  id v8 = [(ICImportLegacyAccountOperation *)self legacyNoteObjectIDsToImport];
  uint64_t v9 = [v8 ic_arrayByGroupingIntoArraysWithMaxCount:v7];
  id v10 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    id v23 = [v8 count];
    __int16 v24 = 2048;
    id v25 = [v9 count];
    __int16 v26 = 2048;
    id v27 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "About to import %lu notes in %lu batches of %lu notes each", buf, 0x20u);
  }

  if ([v9 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      id v12 = [v9 objectAtIndexedSubscript:v11];
      id v13 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v16 = [v12 count];
        id v17 = [v9 count];
        *(_DWORD *)buf = 134218496;
        id v23 = v16;
        __int16 v24 = 2048;
        id v25 = (id)(v11 + 1);
        __int16 v26 = 2048;
        id v27 = v17;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Importing %lu notes (batch %lu of %lu)", buf, 0x20u);
      }

      [(ICImportLegacyAccountOperation *)self cancelIfAccountWasDeleted];
      if ([(ICImportLegacyAccountOperation *)self isCancelled]) {
        break;
      }
      v14 = +[ICCloudContext sharedContext];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100081CA0;
      v18[3] = &unk_100625A78;
      v18[4] = self;
      id v19 = v12;
      id v20 = v3;
      id v21 = v6;
      id v15 = v12;
      [v14 pauseCloudSyncWhileSynchronouslyPerformingBlock:v18];

      if (++v11 >= (unint64_t)[v9 count]) {
        goto LABEL_11;
      }
    }
  }
LABEL_11:
}

+ (unint64_t)noteMigrationBatchSize
{
  if (qword_1006AA0F8 != -1) {
    dispatch_once(&qword_1006AA0F8, &stru_100627380);
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  int64_t v3 = (int64_t)[v2 integerForKey:@"MigrationBatchSize"];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (id)importLegacyNote:(id)a3 deviceMigrationIdentifier:(id)a4 toFolder:(id)a5
{
  id v8 = a3;
  id v68 = a4;
  id v74 = a5;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x3032000000;
  v118 = sub_100081584;
  v119 = sub_100081594;
  id v120 = 0;
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = sub_100081584;
  v113 = sub_100081594;
  id v114 = 0;
  uint64_t v9 = [v8 managedObjectContext];
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_1000830D0;
  v105[3] = &unk_1006273A8;
  v107 = &v115;
  id v73 = v8;
  id v106 = v73;
  v108 = &v109;
  [v9 performBlockAndWait:v105];

  uint64_t v10 = +[ICNote attributedStringFromHTMLString:v116[5]];
  v71 = (void *)v10;
  if (v10)
  {
    v72 = [(ICImportLegacyAccountOperation *)self hashFromAttributedString:v10];
    uint64_t v11 = +[NSUUID UUID];
    id v12 = objc_alloc_init((Class)ICTextController);
    v69 = +[ICLegacyNoteUtilities temporaryTextStorageWithAttributedString:v71 replicaID:v11 styler:v12];

    if ([(ICImportLegacyAccountOperation *)self isLegacyNoteADuplicate:v73])
    {
      uint64_t v13 = +[NSString stringWithFormat:@"%@_%@", v110[5], v72];
      v14 = (void *)v110[5];
      v110[5] = v13;

      id v15 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v110[5];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Legacy note is a duplicate (%@)", buf, 0xCu);
      }
    }
    uint64_t v17 = v110[5];
    uint64_t v18 = [v74 managedObjectContext];
    v70 = [(ICImportLegacyAccountOperation *)self existingImportedNoteForLegacyNote:v73 withContentHash:v72 identifier:v17 context:v18];

    uint64_t v19 = v110[5];
    id v20 = [v74 account];
    int64_t v21 = [(ICImportLegacyAccountOperation *)self importChoiceForLegacyNote:v73 withContentHash:v72 identifier:v19 existingImportedNote:v70 destinationAccount:v20];

    switch(v21)
    {
      case 0:
        v30 = [v70 folder];
        v31 = v30;
        if (v74 && v30)
        {
          id v32 = [v70 folder];
          BOOL v33 = v32 == v74;

          if (!v33)
          {
            v34 = os_log_create("com.apple.notes", "Migration");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              v63 = [v70 identifier];
              v64 = [v70 folder];
              v65 = [v64 identifier];
              v66 = [v74 identifier];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v63;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v65;
              *(_WORD *)&buf[22] = 2112;
              v128 = v66;
              _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Existing imported note (%@) changed folders from (%@) to (%@)", buf, 0x20u);
            }
            [v70 setFolder:v74];
            [v70 updateChangeCountWithReason:@"Updated folder for existing HTML note"];
          }
        }
        else
        {
        }
        goto LABEL_29;
      case 1:
        if (v70)
        {
          id v25 = v70;
        }
        else
        {
          id v25 = +[ICNote newNoteWithoutIdentifierInFolder:v74];
          if (!v25)
          {
LABEL_29:
            v44 = +[NSMutableArray array];
            v45 = [v73 managedObjectContext];
            v86[0] = _NSConcreteStackBlock;
            v86[1] = 3221225472;
            v86[2] = sub_1000831D0;
            v86[3] = &unk_100625860;
            id v46 = v73;
            id v87 = v46;
            id v47 = v44;
            id v88 = v47;
            [v45 performBlockAndWait:v86];

            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            id obj = v47;
            id v48 = [obj countByEnumeratingWithState:&v82 objects:v121 count:16];
            if (v48)
            {
              uint64_t v76 = *(void *)v83;
              do
              {
                for (i = 0; i != v48; i = (char *)i + 1)
                {
                  if (*(void *)v83 != v76) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v50 = *(void *)(*((void *)&v82 + 1) + 8 * i);
                  *(void *)buf = 0;
                  *(void *)&buf[8] = buf;
                  *(void *)&buf[16] = 0x3032000000;
                  v128 = sub_100081584;
                  v129 = sub_100081594;
                  id v130 = 0;
                  uint64_t v99 = 0;
                  v100 = &v99;
                  uint64_t v101 = 0x3032000000;
                  v102 = sub_100081584;
                  v103 = sub_100081594;
                  id v104 = 0;
                  v51 = [v46 managedObjectContext];
                  v77[0] = _NSConcreteStackBlock;
                  v77[1] = 3221225472;
                  v77[2] = sub_1000832E8;
                  v77[3] = &unk_1006273F8;
                  id v78 = v46;
                  uint64_t v79 = v50;
                  v80 = buf;
                  v81 = &v99;
                  [v51 performBlockAndWait:v77];

                  uint64_t v52 = *(void *)(*(void *)&buf[8] + 40);
                  if (v52 && v100[5])
                  {
                    v53 = [v74 managedObjectContext];
                    v54 = +[ICAttachment attachmentWithIdentifier:v52 context:v53];

                    if (v54)
                    {
                      v55 = [v54 media];
                      BOOL v56 = v55 == 0;

                      if (v56)
                      {
                        v57 = os_log_create("com.apple.notes", "Migration");
                        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                        {
                          uint64_t v60 = v100[5];
                          uint64_t v61 = *(void *)(*(void *)&buf[8] + 40);
                          *(_DWORD *)v123 = 138412546;
                          *(void *)&v123[4] = v60;
                          *(_WORD *)&v123[12] = 2112;
                          *(void *)&v123[14] = v61;
                          _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "Importing file (%@) for attachment %@", v123, 0x16u);
                        }

                        uint64_t v58 = v100[5];
                        v59 = +[ICAttachmentPreviewGenerator sharedGenerator];
                        +[ICLegacyAttachmentUtilities importFileAtURL:v58 toAttachment:v54 attachmentPreviewGenerator:v59];
                      }
                    }
                  }
                  else
                  {
                    v54 = os_log_create("com.apple.notes", "Migration");
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
                      sub_1004D67AC(v95, &v95[1], v54);
                    }
                  }

                  _Block_object_dispose(&v99, 8);
                  _Block_object_dispose(buf, 8);
                }
                id v48 = [obj countByEnumeratingWithState:&v82 objects:v121 count:16];
              }
              while (v48);
            }

            id v25 = 0;
LABEL_46:

            id v29 = v25;
            __int16 v26 = v69;
            goto LABEL_47;
          }
        }
        break;
      case 2:
        v22 = +[NSUUID UUID];
        uint64_t v23 = [v22 UUIDString];
        __int16 v24 = (void *)v110[5];
        v110[5] = v23;

        id v25 = +[ICNote newNoteWithoutIdentifierInFolder:v74];
        [v70 setLegacyManagedObjectID:0];
        if (!v25) {
          goto LABEL_29;
        }
        break;
      default:
        goto LABEL_29;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v128 = sub_100081584;
    v129 = sub_100081594;
    id v130 = 0;
    uint64_t v99 = 0;
    v100 = &v99;
    uint64_t v101 = 0x3032000000;
    v102 = sub_100081584;
    v103 = sub_100081594;
    id v104 = 0;
    *(void *)v123 = 0;
    *(void *)&v123[8] = v123;
    *(void *)&v123[16] = 0x3032000000;
    v124 = sub_100081584;
    v125 = sub_100081594;
    id v126 = 0;
    *(void *)v95 = 0;
    v96 = v95;
    uint64_t v97 = 0x2020000000;
    char v98 = 0;
    v35 = [v73 managedObjectContext];
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10008313C;
    v89[3] = &unk_1006273D0;
    v91 = buf;
    id v36 = v73;
    id v90 = v36;
    v92 = &v99;
    v93 = v123;
    v94 = v95;
    [v35 performBlockAndWait:v89];

    [v25 setIdentifier:v110[5]];
    [v25 setCreationDate:*(void *)(*(void *)&buf[8] + 40)];
    [v25 setModificationDate:v100[5]];
    [v25 setTitle:*(void *)(*(void *)&v123[8] + 40)];
    v37 = [v36 objectID];
    [v25 setLegacyManagedObjectID:v37];

    if (v21 != 2)
    {
      [v25 setLegacyModificationDateAtImport:v100[5]];
      [v25 setLegacyContentHashAtImport:v72];
      [v25 setLegacyImportDeviceIdentifier:v68];
      v38 = +[NSNumber numberWithBool:v96[24]];
      [v25 setLegacyNoteWasPlainText:v38];
    }
    id v39 = [v69 wantsUndoCommands];
    [v69 setWantsUndoCommands:0];
    v40 = +[ICAttachmentPreviewGenerator sharedGenerator];
    +[ICLegacyNoteUtilities importLegacyNote:v36 temporaryTextStorage:v69 toNote:v25 attachmentPreviewGenerator:v40];

    [v69 setWantsUndoCommands:v39];
    [v25 setFolder:v74];
    v41 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v42 = v110[5];
      v43 = [v74 identifier];
      sub_1004D67EC(v42, v43, v122, v41);
    }

    [v25 updateChangeCountWithReason:@"Imported HTML note"];
    _Block_object_dispose(v95, 8);
    _Block_object_dispose(v123, 8);

    _Block_object_dispose(&v99, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_46;
  }
  __int16 v26 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = v110[5];
    unsigned int v28 = [(id)v116[5] length];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to convert legacy note HTML to attributed string. legacyNote.identifier=%@ content.length=%d", buf, 0x12u);
  }
  id v29 = 0;
  v72 = v26;
LABEL_47:

  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v115, 8);

  return v29;
}

- (id)existingImportedNoteForLegacyNote:(id)a3 withContentHash:(id)a4 identifier:(id)a5 context:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  uint64_t v10 = [a3 objectID];
  uint64_t v11 = +[ICNote noteWithLegacyManagedObjectID:v10 context:v9];

  if (!v11)
  {
    uint64_t v11 = +[ICNote noteWithIdentifier:v8 context:v9];
  }

  return v11;
}

- (int64_t)importChoiceForLegacyNote:(id)a3 withContentHash:(id)a4 identifier:(id)a5 existingImportedNote:(id)a6 destinationAccount:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = sub_100081584;
  v72 = sub_100081594;
  id v73 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_100081584;
  v66 = sub_100081594;
  id v67 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_100081584;
  uint64_t v60 = sub_100081594;
  id v61 = 0;
  uint64_t v17 = [v12 managedObjectContext];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100083C7C;
  v51[3] = &unk_100627420;
  v53 = &v68;
  id v18 = v12;
  id v52 = v18;
  v54 = &v62;
  v55 = &v56;
  [v17 performBlockAndWait:v51];

  if (![(id)v69[5] length])
  {
    uint64_t v19 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1004D68BC();
    }
    goto LABEL_14;
  }
  if (![(ICImportLegacyAccountOperation *)self isCopyingPrimaryAccount])
  {
    uint64_t v19 = os_log_create("com.apple.notes", "Migration");
    int64_t v25 = 2;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_48;
    }
    sub_1004D6BB4();
    goto LABEL_17;
  }
  if ([v16 supportsLegacyTombstones])
  {
    uint64_t v19 = +[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:v14 type:1];
    id v20 = [v16 managedObjectContext];
    int64_t v21 = +[ICLegacyTombstone legacyTombstoneWithIdentifier:v19 context:v20];

    if (!v21 || ([v21 markedForDeletion] & 1) != 0)
    {

      goto LABEL_7;
    }
    id v29 = [v21 contentHashAtImport];
    if ([v29 isEqualToString:v13])
    {
    }
    else
    {
      id v36 = [v21 modificationDateAtImport];
      unsigned int v37 = [v36 isEqualToDate:v63[5]];

      if (!v37)
      {
        v38 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          sub_1004D6B4C();
        }
        int64_t v25 = 1;
        goto LABEL_47;
      }
    }
    v38 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      sub_1004D6AE4();
    }
    int64_t v25 = 0;
LABEL_47:

    goto LABEL_48;
  }
LABEL_7:
  if (!v15)
  {
    uint64_t v19 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1004D6924();
    }
    goto LABEL_20;
  }
  v22 = [v15 legacyContentHashAtImport];
  unsigned int v23 = [v22 isEqualToString:v13];

  if (!v23)
  {
    __int16 v26 = [v15 legacyModificationDateAtImport];
    unsigned int v27 = [v26 isEqualToDate:v63[5]];

    if (v27)
    {
      uint64_t v19 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v28 = [v15 identifier];
        sub_1004D69DC(v28, (uint64_t)buf, v19);
      }
      goto LABEL_31;
    }
    uint64_t v50 = [v15 legacyManagedObjectIDURIRepresentation];
    v30 = [v18 objectID];
    v31 = [v30 URIRepresentation];
    id v32 = [v31 absoluteString];
    if ([v50 isEqual:v32])
    {
      BOOL v33 = [v15 identifier];
      unsigned __int8 v49 = [v33 isEqualToString:v57[5]];

      if ((v49 & 1) == 0)
      {
        uint64_t v19 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v34 = (void *)v57[5];
          v35 = [v15 identifier];
          *(_DWORD *)buf = 138412546;
          id v75 = v34;
          __int16 v76 = 2112;
          v77 = v35;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "We have already duplicated note (%@) to (%@)", buf, 0x16u);
        }
        goto LABEL_31;
      }
    }
    else
    {
    }
    id v39 = [v15 legacyModificationDateAtImport];
    unsigned int v40 = [v39 ic_isLaterThanDate:v63[5]];

    if (v40)
    {
      uint64_t v19 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_1004D6A2C();
      }
      goto LABEL_14;
    }
    v41 = [v15 modificationDate];
    uint64_t v42 = [v15 legacyModificationDateAtImport];
    unsigned int v43 = [v41 isEqualToDate:v42];

    v44 = os_log_create("com.apple.notes", "Migration");
    uint64_t v19 = v44;
    if (v43)
    {
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v45 = [v15 identifier];
        sub_1004D6A94(v45, (uint64_t)buf, v19);
      }

LABEL_20:
      int64_t v25 = 1;
      goto LABEL_48;
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      id v47 = (void *)v63[5];
      id v48 = [v15 loggingDescription];
      *(_DWORD *)buf = 138412802;
      id v75 = v13;
      __int16 v76 = 2112;
      v77 = v47;
      __int16 v78 = 2112;
      uint64_t v79 = v48;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "We have imported this note, the legacy version is newer than the one we imported, and the user has edited the note since import: newContentHash=%@ newModificationDate=%@ %@", buf, 0x20u);
    }
LABEL_17:
    int64_t v25 = 2;
    goto LABEL_48;
  }
  uint64_t v19 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    __int16 v24 = [v15 identifier];
    sub_1004D698C(v24, (uint64_t)buf, v19);
  }
LABEL_31:

LABEL_14:
  int64_t v25 = 0;
LABEL_48:

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v25;
}

- (void)importFolders
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100081584;
  v16[4] = sub_100081594;
  id v17 = 0;
  int64_t v3 = ICNewLegacyContext();
  v4 = [(ICImportLegacyAccountOperation *)self legacyAccountInContext:v3];
  id v5 = [v4 managedObjectContext];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100083EE4;
  v13[3] = &unk_100626040;
  id v15 = v16;
  id v6 = v4;
  id v14 = v6;
  [v5 performBlockAndWait:v13];

  id v7 = +[ICNoteContext sharedContext];
  id v8 = [v7 snapshotManagedObjectContext];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100083FA4;
  v10[3] = &unk_100625CA0;
  v10[4] = self;
  id v9 = v8;
  id v11 = v9;
  id v12 = v16;
  [v9 performBlockAndWait:v10];

  _Block_object_dispose(v16, 8);
}

- (id)importLegacyFolder:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  id v8 = [v6 managedObjectContext];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1000847AC;
  v62[3] = &unk_100626040;
  uint64_t v64 = &v65;
  id v9 = v6;
  id v63 = v9;
  [v8 performBlockAndWait:v62];

  if (*((unsigned char *)v66 + 24) && ![(ICImportLegacyAccountOperation *)self renameFolders])
  {
    id v21 = [v7 defaultFolder];
    goto LABEL_31;
  }
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_100081584;
  uint64_t v60 = sub_100081594;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_100081584;
  v54 = sub_100081594;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = sub_100081584;
  id v48 = sub_100081594;
  id v49 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100081584;
  uint64_t v42 = sub_100081594;
  id v43 = 0;
  uint64_t v10 = [v9 managedObjectContext];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10008482C;
  v31[3] = &unk_100627468;
  v34 = &v56;
  v35 = &v50;
  id v36 = &v38;
  id v32 = v9;
  BOOL v33 = self;
  unsigned int v37 = &v44;
  [v10 performBlockAndWait:v31];

  if ([v7 accountType] == 3)
  {
    uint64_t v11 = +[NSString stringWithFormat:@"Local-%@", v45[5]];
    id v12 = (void *)v45[5];
    v45[5] = v11;
  }
  id v13 = +[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:v45[5] type:2];
  if ((unint64_t)[v13 length] >= 0x100)
  {
    uint64_t v14 = [v45[5] ic_md5];
    id v15 = (void *)v45[5];
    v45[5] = v14;

    uint64_t v16 = +[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:v45[5] type:2];

    id v13 = (void *)v16;
  }
  id v17 = [v7 managedObjectContext];
  id v18 = +[ICLegacyTombstone legacyTombstoneWithIdentifier:v13 context:v17];

  if (v18 && ([v18 markedForDeletion] & 1) == 0)
  {
    v22 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1004D6D98();
    }

    id v21 = [v7 defaultFolder];
    if (v21) {
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  uint64_t v19 = v45[5];
  id v20 = [v7 managedObjectContext];
  id v21 = +[ICFolder folderWithIdentifier:v19 context:v20];

  if (!v21)
  {
LABEL_15:
    unsigned int v23 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_1004D6D30();
    }

    id v21 = +[ICFolder newFolderWithIdentifier:v45[5] account:v7];
    [v21 setTitle:v51[5]];
    if ([(ICImportLegacyAccountOperation *)self renameFolders])
    {
      __int16 v24 = [v57[5] ic_md5];
      int64_t v25 = [v7 managedObjectContext];
      id v26 = +[ICFolder folderWithIdentifier:v24 context:v25];

      if (!v26)
      {
        unsigned int v27 = [v57[5] ic_md5];
        id v26 = +[ICFolder newFolderWithIdentifier:v27 account:v7];

        [v26 setTitle:v57[5]];
        [v26 updateChangeCountWithReason:@"Imported HTML parent folder"];
      }
      [v21 setParent:v26];
    }
    if ([(ICImportLegacyAccountOperation *)self isCopyingPrimaryAccount]) {
      [v21 setImportedFromLegacy:1];
    }
    if (v39[5])
    {
      unsigned int v28 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        sub_1004D6CC8();
      }

      id v29 = [(ICImportLegacyAccountOperation *)self importLegacyFolder:v39[5] toAccount:v7];
      [v21 setParent:v29];
    }
    [v21 updateChangeCountWithReason:@"Imported HTML folder"];
  }
LABEL_28:
  if (![(ICImportLegacyAccountOperation *)self isCopyingPrimaryAccount]) {
    [v21 unmarkForDeletion];
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

LABEL_31:
  _Block_object_dispose(&v65, 8);

  return v21;
}

+ (void)ensurePermanentObjectIDForObject:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectID];
  unsigned int v5 = [v4 isTemporaryID];

  if (v5)
  {
    id v6 = [v3 managedObjectContext];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100084AE0;
    v7[3] = &unk_100625AF0;
    id v8 = v3;
    [v6 performBlockAndWait:v7];
  }
}

- (id)hashFromAttributedString:(id)a3
{
  id v3 = [a3 mutableCopy];
  id v4 = [v3 length];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100084D78;
  v11[3] = &unk_100627490;
  id v12 = v3;
  id v5 = v3;
  [v5 enumerateAttribute:NSAttachmentAttributeName inRange:0 options:0 usingBlock:v11];
  id v6 = [v5 string];
  id v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = [v8 ic_md5];

  return v9;
}

- (BOOL)isLegacyNoteADuplicate:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = [v3 managedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100084FE0;
  v7[3] = &unk_100625C78;
  id v5 = v3;
  id v8 = v5;
  id v9 = &v10;
  [v4 performBlockAndWait:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (NSManagedObjectID)legacyAccountObjectID
{
  return self->_legacyAccountObjectID;
}

- (void)setLegacyAccountObjectID:(id)a3
{
}

- (BOOL)randomizeImportOrder
{
  return self->_randomizeImportOrder;
}

- (void)setRandomizeImportOrder:(BOOL)a3
{
  self->_randomizeImportOrder = a3;
}

- (BOOL)isCopyingPrimaryAccount
{
  return self->_copyingPrimaryAccount;
}

- (void)setCopyingPrimaryAccount:(BOOL)a3
{
  self->_copyingPrimaryAccount = a3;
}

- (NSManagedObjectID)destinationAccountObjectID
{
  return self->_destinationAccountObjectID;
}

- (void)setDestinationAccountObjectID:(id)a3
{
}

- (BOOL)renameFolders
{
  return self->_renameFolders;
}

- (void)setRenameFolders:(BOOL)a3
{
  self->_renameFolders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationAccountObjectID, 0);

  objc_storeStrong((id *)&self->_legacyAccountObjectID, 0);
}

@end