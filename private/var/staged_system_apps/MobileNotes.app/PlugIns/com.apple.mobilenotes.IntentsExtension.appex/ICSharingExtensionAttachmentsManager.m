@interface ICSharingExtensionAttachmentsManager
+ (id)sharedManager;
- (BOOL)addString:(id)a3 toNote:(id)a4 error:(id *)a5;
- (BOOL)appendMediaItemWithItemProvider:(id)a3 attachments:(id)a4;
- (BOOL)appendString:(id)a3 toNote:(id)a4 error:(id *)a5;
- (BOOL)containsOnlyRawImageDataInProvider:(id)a3;
- (BOOL)containsOnlyRawImagesInExtensionContext:(id)a3;
- (BOOL)contextContainsOnlyRawImages;
- (ICAnalyticsObserver)analyticsObserver;
- (ICRWLock)appendLock;
- (ICSharingExtensionAttachmentsManager)init;
- (NSString)accountId;
- (id)attachmentsFromExtensionContext:(id)a3 note:(id)a4;
- (id)extractAttachmentsFromInputItems:(id)a3 note:(id)a4;
- (id)getURLWithoutQueryAndFragmentFromURL:(id)a3;
- (id)lastNoteSavedTo;
- (id)mediaUTIs;
- (id)newNoteWithString:(id)a3 error:(id *)a4;
- (id)newNoteWithString:(id)a3 inFolder:(id)a4 error:(id *)a5;
- (id)saveAttachmentsToNewNote:(id)a3 inFolder:(id)a4 isSystemPaper:(BOOL)a5 textBefore:(id)a6 textAfter:(id)a7;
- (id)titleFromExtensionItem:(id)a3;
- (int)dbWriteLockfd;
- (void)completeExtensionRequest:(BOOL)a3;
- (void)completeExtensionRequest:(BOOL)a3 waitUntilDone:(BOOL)a4;
- (void)completeExtensionRequestInBackground;
- (void)consolidateDuplicateAttachments:(id)a3;
- (void)dbWriteLock;
- (void)dbWriteUnlock;
- (void)dealloc;
- (void)fillOutTitleAndSummaryForAttachments:(id)a3;
- (void)refreshManagedObjects;
- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6;
- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6 fetchFirst:(BOOL)a7;
- (void)setAccountId:(id)a3;
- (void)setAnalyticsObserver:(id)a3;
- (void)setAppendLock:(id)a3;
- (void)setContextContainsOnlyRawImages:(BOOL)a3;
- (void)setDbWriteLockfd:(int)a3;
- (void)syncChangesToCloudWithCompletionHandler:(id)a3;
@end

@implementation ICSharingExtensionAttachmentsManager

+ (id)sharedManager
{
  if (qword_100028B00 != -1) {
    dispatch_once(&qword_100028B00, &stru_100020980);
  }
  v2 = (void *)qword_100028B08;

  return v2;
}

- (ICSharingExtensionAttachmentsManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ICSharingExtensionAttachmentsManager;
  v2 = [(ICSharingExtensionAttachmentsManager *)&v10 init];
  if (v2)
  {
    v3 = +[ICPaths applicationDocumentsURL];
    v4 = [v3 URLByAppendingPathComponent:@"SharingExtensionWriteLock" isDirectory:0];
    v5 = [v4 path];

    id v6 = v5;
    -[ICSharingExtensionAttachmentsManager setDbWriteLockfd:](v2, "setDbWriteLockfd:", open((const char *)[v6 fileSystemRepresentation], 512, 448));
    if ([(ICSharingExtensionAttachmentsManager *)v2 dbWriteLockfd] == -1)
    {
      v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      NSLog(@"can't open lock file because %@", v7);
    }
    v8 = +[ICAnalyticsObserver sharedObserver];
    [(ICSharingExtensionAttachmentsManager *)v2 setAnalyticsObserver:v8];
  }
  return v2;
}

- (void)dealloc
{
  if ([(ICSharingExtensionAttachmentsManager *)self dbWriteLockfd] != -1) {
    close([(ICSharingExtensionAttachmentsManager *)self dbWriteLockfd]);
  }
  v3.receiver = self;
  v3.super_class = (Class)ICSharingExtensionAttachmentsManager;
  [(ICSharingExtensionAttachmentsManager *)&v3 dealloc];
}

- (id)titleFromExtensionItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 attributedTitle];
  if (v4) {
    [v3 attributedTitle];
  }
  else {
  v5 = [v3 attributedContentText];
  }

  id v6 = [v5 string];

  return v6;
}

- (id)attachmentsFromExtensionContext:(id)a3 note:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ICSharingExtensionAttachmentsManager *)self appendLock];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)ICRWLock);
    [(ICSharingExtensionAttachmentsManager *)self setAppendLock:v9];
  }
  objc_super v10 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
  [v10 readLock];

  [(ICSharingExtensionAttachmentsManager *)self setContextContainsOnlyRawImages:[(ICSharingExtensionAttachmentsManager *)self containsOnlyRawImagesInExtensionContext:v6]];
  v11 = [v6 inputItems];
  v12 = [(ICSharingExtensionAttachmentsManager *)self extractAttachmentsFromInputItems:v11 note:v7];

  v13 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
  [v13 unlock];

  v14 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
  [v14 writeLock];

  [(ICSharingExtensionAttachmentsManager *)self consolidateDuplicateAttachments:v12];
  [(ICSharingExtensionAttachmentsManager *)self fillOutTitleAndSummaryForAttachments:v12];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100008B24;
  v26[3] = &unk_1000209A8;
  v26[4] = &v27;
  v15 = [v12 indexesOfObjectsPassingTest:v26];
  v16 = v15;
  if (*((unsigned char *)v28 + 24) && [v15 count]) {
    [v12 removeObjectsAtIndexes:v16];
  }
  if ((unint64_t)[v12 count] >= 2)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100008BBC;
    v21[3] = &unk_1000209A8;
    v21[4] = &v22;
    v17 = [v12 indexesOfObjectsPassingTest:v21];
    v18 = v17;
    if (*((unsigned char *)v23 + 24) && [v17 count]) {
      [v12 removeObjectsAtIndexes:v18];
    }

    _Block_object_dispose(&v22, 8);
  }
  v19 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
  [v19 unlock];

  _Block_object_dispose(&v27, 8);

  return v12;
}

- (id)extractAttachmentsFromInputItems:(id)a3 note:(id)a4
{
  id v6 = a3;
  id v53 = a4;
  id v7 = +[NSMutableArray array];
  v8 = os_log_create("com.apple.notes", "SharingExtension");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000141FC();
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v6;
  id v49 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v80;
    v46 = UTTypeText;
    uint64_t v51 = UTTypeMapKitMapItem;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v80 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v9;
        objc_super v10 = *(void **)(*((void *)&v79 + 1) + 8 * v9);
        v11 = [v10 attributedContentText:v46];
        id v12 = [v11 length];

        v52 = v10;
        if (v12)
        {
          v13 = [v10 attachments];
          if ([v13 count] == (id)1)
          {
            v14 = [v10 attachments];
            v15 = [v14 firstObject];
            v16 = [(UTType *)v46 identifier];
            unsigned int v17 = [v15 hasItemConformingToTypeIdentifier:v16];

            objc_super v10 = v52;
          }
          else
          {
            unsigned int v17 = 0;
          }

          v18 = [v10 attachments];
          id v19 = [v18 count];

          if (!v19 || v17 != 0)
          {
            id v21 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
            uint64_t v22 = [v10 attributedContentText];
            [v21 setAttributedContentText:v22];

            [v7 addObject:v21];
          }
        }
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v54 = [v10 attachments];
        id v23 = [v54 countByEnumeratingWithState:&v75 objects:v83 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v76;
          do
          {
            v26 = 0;
            do
            {
              if (*(void *)v76 != v25) {
                objc_enumerationMutation(v54);
              }
              uint64_t v27 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v26);
              if (![(ICSharingExtensionAttachmentsManager *)self appendMediaItemWithItemProvider:v27 attachments:v7])
              {
                v28 = [UTTypeURL identifier];
                unsigned int v29 = [v27 hasItemConformingToTypeIdentifier:v28];

                if (v29)
                {
                  char v30 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
                  [v30 readLock];

                  v31 = [UTTypeURL identifier];
                  v71[0] = _NSConcreteStackBlock;
                  v71[1] = 3221225472;
                  v71[2] = sub_100009488;
                  v71[3] = &unk_1000209F8;
                  v71[4] = self;
                  id v72 = v7;
                  id v73 = v53;
                  v74 = v10;
                  [v27 loadItemForTypeIdentifier:v31 options:0 completionHandler:v71];

                  v32 = v72;
LABEL_25:

                  goto LABEL_31;
                }
                v33 = [UTTypeRTF identifier];
                unsigned int v34 = [v27 hasItemConformingToTypeIdentifier:v33];

                if (v34)
                {
                  v35 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
                  [v35 readLock];

                  v36 = [UTTypeRTF identifier];
                  v68[0] = _NSConcreteStackBlock;
                  v68[1] = 3221225472;
                  v68[2] = sub_100009710;
                  v68[3] = &unk_100020A20;
                  id v69 = v7;
                  v70 = self;
                  [v27 loadItemForTypeIdentifier:v36 options:0 completionHandler:v68];

LABEL_28:
                  objc_super v10 = v52;
                  goto LABEL_31;
                }
                v37 = [UTTypePlainText identifier];
                unsigned int v38 = [v27 hasItemConformingToTypeIdentifier:v37];

                if (v38)
                {
                  v39 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
                  [v39 readLock];

                  v40 = [UTTypePlainText identifier];
                  v65[0] = _NSConcreteStackBlock;
                  v65[1] = 3221225472;
                  v65[2] = sub_1000097DC;
                  v65[3] = &unk_100020A70;
                  v65[4] = v27;
                  v65[5] = v52;
                  id v66 = v7;
                  v67 = self;
                  [v27 loadItemForTypeIdentifier:v40 options:0 completionHandler:v65];

                  objc_super v10 = v52;
                }
                else
                {
                  if ([v27 hasItemConformingToTypeIdentifier:@"com.apple.news.notes-metadata"])
                  {
                    v41 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
                    [v41 readLock];

                    v62[0] = _NSConcreteStackBlock;
                    v62[1] = 3221225472;
                    v62[2] = sub_100009ABC;
                    v62[3] = &unk_100020A98;
                    id v63 = v7;
                    v64 = self;
                    [v27 loadItemForTypeIdentifier:@"com.apple.news.notes-metadata" options:0 completionHandler:v62];

                    goto LABEL_28;
                  }
                  objc_super v10 = v52;
                  if ([v27 hasItemConformingToTypeIdentifier:@"com.apple.notes.share-metadata"])
                  {
                    v42 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
                    [v42 readLock];

                    v58[0] = _NSConcreteStackBlock;
                    v58[1] = 3221225472;
                    v58[2] = sub_100009CD0;
                    v58[3] = &unk_100020A48;
                    id v59 = v53;
                    id v60 = v7;
                    v61 = self;
                    [v27 loadItemForTypeIdentifier:@"com.apple.notes.share-metadata" options:0 completionHandler:v58];

                    v32 = v59;
                    goto LABEL_25;
                  }
                  if ([v27 hasItemConformingToTypeIdentifier:v51])
                  {
                    v43 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
                    [v43 readLock];

                    v55[0] = _NSConcreteStackBlock;
                    v55[1] = 3221225472;
                    v55[2] = sub_10000A0F0;
                    v55[3] = &unk_100020A98;
                    id v56 = v7;
                    v57 = self;
                    [v27 loadItemForTypeIdentifier:v51 options:0 completionHandler:v55];
                    v32 = v56;
                    goto LABEL_25;
                  }
                }
              }
LABEL_31:
              v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            id v44 = [v54 countByEnumeratingWithState:&v75 objects:v83 count:16];
            id v24 = v44;
          }
          while (v44);
        }

        uint64_t v9 = v50 + 1;
      }
      while ((id)(v50 + 1) != v49);
      id v49 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
    }
    while (v49);
  }

  return v7;
}

- (void)consolidateDuplicateAttachments:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0;
  uint64_t v16 = 0;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  while (v5 < (unint64_t)[v4 count])
  {
    id v6 = [v4 objectAtIndexedSubscript:v17[3]];
    id v7 = [v6 attachment];

    if (v7)
    {
      v8 = [v6 attachment];
      uint64_t v9 = [v8 managedObjectContext];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10000A3CC;
      v11[3] = &unk_100020B10;
      id v12 = v6;
      id v10 = v4;
      v14 = self;
      v15 = &v16;
      id v13 = v10;
      [v9 performBlockAndWait:v11];
    }
    unint64_t v5 = v17[3] + 1;
    v17[3] = v5;
  }
  _Block_object_dispose(&v16, 8);
}

- (void)fillOutTitleAndSummaryForAttachments:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v7) attachment];
        uint64_t v9 = v8;
        if (v8)
        {
          id v10 = [v8 managedObjectContext];
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10000AD2C;
          v11[3] = &unk_100020AE8;
          id v12 = v9;
          [v10 performBlockAndWait:v11];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (id)getURLWithoutQueryAndFragmentFromURL:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSURLComponents) initWithURL:v3 resolvingAgainstBaseURL:1];

  [v4 setQuery:0];
  [v4 setFragment:0];
  id v5 = [v4 URL];

  return v5;
}

- (id)saveAttachmentsToNewNote:(id)a3 inFolder:(id)a4 isSystemPaper:(BOOL)a5 textBefore:(id)a6 textAfter:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v12 count];
  if (v16 <= +[ICNote maxNoteAttachments])
  {
    [(ICSharingExtensionAttachmentsManager *)self refreshManagedObjects];
    v22.receiver = self;
    v22.super_class = (Class)ICSharingExtensionAttachmentsManager;
    unsigned int v17 = [(ICSharingExtensionAttachmentsManager *)&v22 saveAttachmentsToNewNote:v12 inFolder:v13 isSystemPaper:v9 textBefore:v14 textAfter:v15];
    uint64_t v18 = +[NSUserDefaults standardUserDefaults];
    uint64_t v19 = [v17 identifier];
    [v18 setObject:v19 forKey:@"SharingExtensionLastSavedNoteIdentifier"];

    v20 = +[NSDate date];
    [v18 setObject:v20 forKey:@"SharingExtensionLastSavedNoteTimeStamp"];
  }
  else
  {
    unsigned int v17 = 0;
  }

  return v17;
}

- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (objc_msgSend(v11, "canAddAttachments:", objc_msgSend(v10, "count")))
  {
    id v14 = +[NSUserDefaults standardUserDefaults];
    id v15 = [v11 identifier];
    [v14 setObject:v15 forKey:@"SharingExtensionLastSavedNoteIdentifier"];

    id v16 = +[NSDate date];
    [v14 setObject:v16 forKey:@"SharingExtensionLastSavedNoteTimeStamp"];

    v17.receiver = self;
    v17.super_class = (Class)ICSharingExtensionAttachmentsManager;
    [(ICSharingExtensionAttachmentsManager *)&v17 saveAttachments:v10 toNote:v11 textBefore:v12 textAfter:v13];
  }
}

- (id)lastNoteSavedTo
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"SharingExtensionLastSavedNoteIdentifier"];
  uint64_t v4 = [v2 objectForKey:@"SharingExtensionLastSavedNoteTimeStamp"];
  id v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = +[NSDate date];
    [v7 timeIntervalSinceDate:v5];
    double v9 = v8;

    if (v9 < 480.0)
    {
      id v10 = +[ICNoteContext sharedContext];
      id v11 = [v10 managedObjectContext];
      id v12 = +[ICNote noteWithIdentifier:v3 context:v11];

      [v12 setNeedsRefresh:1];
      id v13 = [v12 identifier];
      id v14 = +[ICNoteContext sharedContext];
      id v15 = [v14 managedObjectContext];
      id v16 = +[ICNote refreshAllOfNoteWithIdentifier:v13 context:v15];

      if ([v12 isVisible]) {
        goto LABEL_9;
      }
    }
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6 fetchFirst:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  [(ICSharingExtensionAttachmentsManager *)self dbWriteLock];
  v16.receiver = self;
  v16.super_class = (Class)ICSharingExtensionAttachmentsManager;
  [(ICSharingExtensionAttachmentsManager *)&v16 saveAttachments:v15 toNote:v14 textBefore:v13 textAfter:v12 fetchFirst:v7];

  [v14 setNeedsInitialFetchFromCloud:0];
  [(ICSharingExtensionAttachmentsManager *)self dbWriteUnlock];
}

- (void)completeExtensionRequest:(BOOL)a3
{
}

- (void)completeExtensionRequestInBackground
{
}

- (void)completeExtensionRequest:(BOOL)a3 waitUntilDone:(BOOL)a4
{
  if (a3)
  {
    uint64_t v4 = +[ICCloudContext sharedContext];
    [v4 cancelEverythingWithCompletionHandler:0];

    if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
    {
      id v11 = +[ICSearchIndexer sharedIndexer];
      [v11 cancelIndexingOperationsWithCompletionHandler:0];
    }
  }
  else
  {
    BOOL v5 = a4;
    dispatch_semaphore_t v7 = 0;
    if (a4) {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000B5A8;
    v15[3] = &unk_100020B38;
    BOOL v17 = v5;
    double v8 = v7;
    objc_super v16 = v8;
    [(ICSharingExtensionAttachmentsManager *)self syncChangesToCloudWithCompletionHandler:v15];
    if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
    {
      double v9 = +[ICSearchIndexer sharedIndexer];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000B5BC;
      v12[3] = &unk_100020B38;
      BOOL v14 = v5;
      id v10 = v8;
      id v13 = v10;
      [v9 finishRemainingOperationsWithCompletionHandler:v12];

      if (v5)
      {
        dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
}

- (id)newNoteWithString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = +[ICNoteContext sharedContext];
  double v8 = [v7 managedObjectContext];
  double v9 = +[ICFolder defaultFolderInContext:v8];
  id v10 = [(ICSharingExtensionAttachmentsManager *)self newNoteWithString:v6 inFolder:v9 error:a4];

  return v10;
}

- (void)refreshManagedObjects
{
  id v3 = +[ICNoteContext sharedContext];
  v2 = [v3 managedObjectContext];
  [v2 refreshAllObjects];
}

- (id)newNoteWithString:(id)a3 inFolder:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  [(ICSharingExtensionAttachmentsManager *)self dbWriteLock];
  id v10 = +[ICNote newNoteWithString:v9 inFolder:v8 error:a5];

  [(ICSharingExtensionAttachmentsManager *)self dbWriteUnlock];
  return v10;
}

- (BOOL)addString:(id)a3 toNote:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ICNoteContext sharedContext];
  id v11 = [v10 managedObjectContext];
  [v11 ic_refreshObject:v8 mergeChanges:0];

  id v12 = +[NSDate date];
  [v8 setModificationDate:v12];

  LOBYTE(a5) = [(ICSharingExtensionAttachmentsManager *)self appendString:v9 toNote:v8 error:a5];
  id v13 = [v8 timestamp];
  [v8 setLastNotifiedTimestamp:v13];

  return (char)a5;
}

- (id)mediaUTIs
{
  if (qword_100028B18 != -1) {
    dispatch_once(&qword_100028B18, &stru_100020B58);
  }
  v2 = (void *)qword_100028B10;

  return v2;
}

- (BOOL)appendMediaItemWithItemProvider:(id)a3 attachments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(ICSharingExtensionItemExtractor);
  id v9 = dispatch_group_create();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = [(ICSharingExtensionAttachmentsManager *)self mediaUTIs];
  id v11 = [v10 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v41;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if ([v6 hasItemConformingToTypeIdentifier:v15])
        {
          BOOL v17 = [(ICSharingExtensionAttachmentsManager *)self appendLock];
          [v17 readLock];

          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_10000BD5C;
          v38[3] = &unk_100020B80;
          id v28 = v7;
          id v18 = v7;
          id v39 = v18;
          uint64_t v19 = objc_retainBlock(v38);
          v20 = +[UTType typeWithIdentifier:v15];
          if ([v20 conformsToType:UTTypePDF])
          {
            dispatch_group_enter(v9);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_10000BD68;
            v35[3] = &unk_100020BA8;
            id v21 = (id *)v36;
            v36[0] = v18;
            v36[1] = self;
            objc_super v22 = (id *)&v37;
            v37 = v9;
            [(ICSharingExtensionItemExtractor *)v8 extractMediaFileURLWithProvider:v6 contentType:v20 completion:v35];
          }
          else
          {
            id v23 = [UTTypeFileURL identifier];
            unsigned int v24 = [v6 hasItemConformingToTypeIdentifier:v23];

            if (v24)
            {
              dispatch_group_enter(v9);
              v32[0] = _NSConcreteStackBlock;
              v32[1] = 3221225472;
              v32[2] = sub_10000BDC4;
              v32[3] = &unk_100020BD0;
              id v21 = (id *)&v34;
              unsigned int v34 = v19;
              v32[4] = self;
              objc_super v22 = (id *)&v33;
              v33 = v9;
              [(ICSharingExtensionItemExtractor *)v8 extractURLWithProvider:v6 withCompletion:v32];
            }
            else
            {
              unsigned int v27 = [(ICSharingExtensionAttachmentsManager *)self contextContainsOnlyRawImages];
              dispatch_group_enter(v9);
              uint64_t v25 = [UTTypeData identifier];
              v29[0] = _NSConcreteStackBlock;
              v29[1] = 3221225472;
              v29[2] = sub_10000BE24;
              v29[3] = &unk_100020BD0;
              id v21 = (id *)&v31;
              v31 = v19;
              v29[4] = self;
              objc_super v22 = (id *)&v30;
              char v30 = v9;
              [(ICSharingExtensionItemExtractor *)v8 extractDataWithProvider:v6 forUTI:v25 useTempFile:v27 withCompletion:v29];
            }
          }

          BOOL v16 = 1;
          id v7 = v28;
          goto LABEL_16;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_16:

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  return v16;
}

- (BOOL)containsOnlyRawImageDataInProvider:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 registeredTypeIdentifiers];
  id v5 = [v4 count];

  if (v5 == (id)1)
  {
    id v6 = [v3 registeredTypeIdentifiers];
    id v7 = [v6 firstObject];

    id v8 = [UTTypeImage identifier];
    unsigned __int8 v9 = [v7 isEqualToString:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)containsOnlyRawImagesInExtensionContext:(id)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [a3 inputItems];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v11 = [v10 attachments];
        id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v18;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              if (![(ICSharingExtensionAttachmentsManager *)self containsOnlyRawImageDataInProvider:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)])
              {
                char v7 = 0;
                goto LABEL_16;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          char v7 = 1;
        }
LABEL_16:
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (void)syncChangesToCloudWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ICCloudContext sharedContext];
  [v4 setQualityOfService:9];

  id v5 = +[ICCloudContext sharedContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C1B0;
  v7[3] = &unk_100020BF8;
  id v8 = v3;
  id v6 = v3;
  [v5 processAllCloudObjectsWithCompletionHandler:v7];
}

- (BOOL)appendString:(id)a3 toNote:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v8 textStorage];
  id v11 = [v10 length];

  id v12 = [v8 textStorage];
  id v13 = [v12 string];
  unsigned int v14 = [v13 hasSuffix:@"\n\n"];

  uint64_t v15 = -2;
  if (!v14) {
    uint64_t v15 = -1;
  }
  unint64_t v16 = (unint64_t)v11 + v15;
  long long v17 = [v8 textStorage];
  if (v16 >= (unint64_t)[v17 length])
  {
    long long v19 = +[ICTTParagraphStyle paragraphStyleNamed:3];
  }
  else
  {
    long long v18 = [v8 textStorage];
    long long v19 = [v18 attribute:ICTTAttributeNameParagraphStyle atIndex:v16 effectiveRange:0];
  }
  if (v19 && ([v19 preferSingleLine] & 1) == 0)
  {
    id v20 = v19;
  }
  else
  {
    id v20 = +[ICTTParagraphStyle paragraphStyleNamed:3];
  }
  long long v21 = v20;
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  [v22 setObject:v21 forKey:ICTTAttributeNameParagraphStyle];
  id v23 = [objc_alloc((Class)NSAttributedString) initWithString:v9 attributes:v22];

  [(ICSharingExtensionAttachmentsManager *)self dbWriteLock];
  unsigned __int8 v24 = [v8 appendAttributedString:v23 error:a5];
  [(ICSharingExtensionAttachmentsManager *)self dbWriteUnlock];

  return v24;
}

- (void)dbWriteLock
{
  if (flock([(ICSharingExtensionAttachmentsManager *)self dbWriteLockfd], 2) == -1)
  {
    id v2 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    NSLog(@"can't lock because %@", v2);
  }
}

- (void)dbWriteUnlock
{
  if (flock([(ICSharingExtensionAttachmentsManager *)self dbWriteLockfd], 8) == -1)
  {
    id v2 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    NSLog(@"can't unlock because %@", v2);
  }
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (ICRWLock)appendLock
{
  return self->_appendLock;
}

- (void)setAppendLock:(id)a3
{
}

- (int)dbWriteLockfd
{
  return self->_dbWriteLockfd;
}

- (void)setDbWriteLockfd:(int)a3
{
  self->_dbWriteLockfd = a3;
}

- (BOOL)contextContainsOnlyRawImages
{
  return self->_contextContainsOnlyRawImages;
}

- (void)setContextContainsOnlyRawImages:(BOOL)a3
{
  self->_contextContainsOnlyRawImages = a3;
}

- (ICAnalyticsObserver)analyticsObserver
{
  return self->_analyticsObserver;
}

- (void)setAnalyticsObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsObserver, 0);
  objc_storeStrong((id *)&self->_appendLock, 0);

  objc_storeStrong((id *)&self->_accountId, 0);
}

@end