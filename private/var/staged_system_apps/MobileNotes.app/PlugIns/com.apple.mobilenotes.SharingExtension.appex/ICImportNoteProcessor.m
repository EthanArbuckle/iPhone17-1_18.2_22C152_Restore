@interface ICImportNoteProcessor
- (BOOL)shouldCancelImportProcess;
- (ICImportNoteProcessor)init;
- (ICImportNoteProcessorDelegate)delegate;
- (ICNAEventReporter)eventReporter;
- (NSArray)allowedContentTypes;
- (NSArray)errorFileURLs;
- (NSArray)importNoteFileParsers;
- (NSManagedObjectContext)managedObjectContext;
- (NSMutableArray)currentErrorFileURLs;
- (NSURL)currentURL;
- (id)getTypeIdentifierForFileURL:(id)a3;
- (id)newFolderWithTitle:(id)a3 parentFolder:(id)a4 forAccount:(id)a5;
- (id)parserForFileURL:(id)a3;
- (unint64_t)state;
- (unint64_t)totalNoteFound;
- (unint64_t)totalNoteImported;
- (void)addURLs:(id)a3 toImportFolder:(id)a4 shouldPreserveFolders:(BOOL)a5;
- (void)cancelProcess;
- (void)processURLs:(id)a3 shouldPreserveFolders:(BOOL)a4 account:(id)a5;
- (void)setCurrentErrorFileURLs:(id)a3;
- (void)setCurrentURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImportNoteFileParsers:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setShouldCancelImportProcess:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setTotalNoteFound:(unint64_t)a3;
- (void)setTotalNoteImported:(unint64_t)a3;
- (void)setupFileParsers;
- (void)traverseImportFolder:(id)a3 forAccount:(id)a4 shouldImportNotes:(BOOL)a5 completionBlock:(id)a6;
- (void)updateImportProgress;
@end

@implementation ICImportNoteProcessor

- (ICImportNoteProcessor)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICImportNoteProcessor;
  v2 = [(ICImportNoteProcessor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ICImportNoteProcessor *)v2 setupFileParsers];
  }
  return v3;
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics])
  {
    id v3 = objc_alloc((Class)ICNAEventReporter);
    v4 = (ICNAEventReporter *)[v3 initWithSubTrackerName:kICNASubtrackerNameImportNoteProcessor];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v4;
  }
  v6 = self->_eventReporter;

  return v6;
}

- (NSArray)errorFileURLs
{
  v2 = [(ICImportNoteProcessor *)self currentErrorFileURLs];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (NSArray)allowedContentTypes
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(ICImportNoteProcessor *)self importNoteFileParsers];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F8CC;
  v8[3] = &unk_1000EE308;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = [v5 copy];

  return (NSArray *)v6;
}

- (void)processURLs:(id)a3 shouldPreserveFolders:(BOOL)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(ICImportNoteProcessor *)self state])
  {
    v10 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cannot start import process because it is currently in progress.", buf, 2u);
    }
LABEL_11:

    goto LABEL_16;
  }
  if (!v9)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "inAccount", "-[ICImportNoteProcessor processURLs:shouldPreserveFolders:account:]", 1, 0, @"Account must not be nil");
    v10 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000B5B08(v10);
    }
    goto LABEL_11;
  }
  [(ICImportNoteProcessor *)self setTotalNoteImported:0];
  [(ICImportNoteProcessor *)self setTotalNoteFound:0];
  [(ICImportNoteProcessor *)self setCurrentURL:0];
  [(ICImportNoteProcessor *)self setShouldCancelImportProcess:0];
  id v11 = objc_alloc_init((Class)NSMutableArray);
  [(ICImportNoteProcessor *)self setCurrentErrorFileURLs:v11];

  v12 = +[ICNoteContext sharedContext];
  v13 = [v12 workerManagedObjectContext];
  [(ICImportNoteProcessor *)self setManagedObjectContext:v13];

  v14 = [(ICImportNoteProcessor *)self managedObjectContext];
  [v14 setIc_debugName:@"importNoteProcessor"];

  *(void *)buf = 0;
  v34 = buf;
  uint64_t v35 = 0x3032000000;
  v36 = sub_10000FD10;
  v37 = sub_10000FD20;
  id v38 = 0;
  v15 = [(ICImportNoteProcessor *)self managedObjectContext];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000FD28;
  v29[3] = &unk_1000EE330;
  v32 = buf;
  id v30 = v9;
  v31 = self;
  [v15 performBlockAndWait:v29];

  if (*((void *)v34 + 5))
  {
    [(ICImportNoteProcessor *)self setState:1];
    v16 = [(ICImportNoteProcessor *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v18 = [(ICImportNoteProcessor *)self delegate];
      [v18 importStartedForNoteProcessor:self];
    }
    objc_initWeak(&location, self);
    v19 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000FDC0;
    block[3] = &unk_1000EE380;
    objc_copyWeak(&v26, &location);
    id v20 = v8;
    BOOL v27 = a4;
    id v23 = v20;
    v24 = self;
    v25 = buf;
    dispatch_async(v19, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000B5B4C(v21);
    }
  }
  _Block_object_dispose(buf, 8);

LABEL_16:
}

- (void)cancelProcess
{
  if ([(ICImportNoteProcessor *)self state])
  {
    [(ICImportNoteProcessor *)self setShouldCancelImportProcess:1];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(ICImportNoteProcessor *)self importNoteFileParsers];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) cancelParsing];
        }
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  else
  {
    id v3 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000B5C18(v3);
    }
  }
}

- (void)setupFileParsers
{
  id v3 = objc_alloc_init(ICEvernoteFileParser);
  v7 = v3;
  id v4 = objc_alloc_init(_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser);
  long long v8 = v4;
  id v5 = objc_alloc_init(ICImportNoteGeneralFileParser);
  long long v9 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v7 count:3];
  -[ICImportNoteProcessor setImportNoteFileParsers:](self, "setImportNoteFileParsers:", v6, v7, v8);
}

- (id)parserForFileURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10000FD10;
  v16 = sub_10000FD20;
  id v17 = 0;
  id v5 = [(ICImportNoteProcessor *)self importNoteFileParsers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001061C;
  v9[3] = &unk_1000EE3A8;
  id v6 = v4;
  id v10 = v6;
  long long v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)addURLs:(id)a3 toImportFolder:(id)a4 shouldPreserveFolders:(BOOL)a5
{
  BOOL v35 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  v34 = v7;
  id v10 = [objc_alloc((Class)NSMutableArray) initWithArray:v7];
  v36 = v8;
  if (![(ICImportNoteProcessor *)self shouldCancelImportProcess])
  {
    NSURLResourceKey v12 = NSURLIsDirectoryKey;
    *(void *)&long long v11 = 138412290;
    long long v33 = v11;
    while (1)
    {
      if (!objc_msgSend(v10, "count", v33) && !objc_msgSend(v9, "count")) {
        goto LABEL_2;
      }
      if (![v10 count])
      {
        v13 = [v9 firstObject];

        [v9 removeObjectAtIndex:0];
        uint64_t v14 = +[NSFileManager defaultManager];
        v15 = [v13 url];
        v43[0] = NSURLNameKey;
        v43[1] = v12;
        v43[2] = NSURLTypeIdentifierKey;
        v16 = +[NSArray arrayWithObjects:v43 count:3];
        id v17 = [v14 contentsOfDirectoryAtURL:v15 includingPropertiesForKeys:v16 options:4 error:0];

        if (v17) {
          [v10 addObjectsFromArray:v17];
        }

        id v8 = v13;
      }
      if ([v10 count]
        && ![(ICImportNoteProcessor *)self shouldCancelImportProcess])
      {
        break;
      }
LABEL_30:
      if ([(ICImportNoteProcessor *)self shouldCancelImportProcess]) {
        goto LABEL_2;
      }
    }
    v18 = [v10 firstObject];
    [v10 removeObjectAtIndex:0];
    id v40 = 0;
    [v18 getResourceValue:&v40 forKey:v12 error:0];
    id v19 = v40;
    id v20 = [(ICImportNoteProcessor *)self getTypeIdentifierForFileURL:v18];
    id v39 = 0;
    [v18 getResourceValue:&v39 forKey:NSURLIsPackageKey error:0];
    id v38 = v39;
    if (v20)
    {
      v21 = +[UTType typeWithIdentifier:v20];
      unsigned __int8 v37 = [v21 conformsToType:UTTypeRTFD];

      +[UTType importedTypeWithIdentifier:v20];
      v22 = v19;
      id v23 = v8;
      v25 = id v24 = v9;
      id v26 = +[UTType importedTypeWithIdentifier:@"com.apple.stickies.appexport"];
      unsigned __int8 v27 = [v25 conformsToType:v26];

      id v9 = v24;
      id v8 = v23;
      id v19 = v22;
      if (([v22 BOOLValue] & 1) == 0) {
        goto LABEL_23;
      }
      if (v27)
      {
LABEL_19:
        if ((v37 & 1) == 0)
        {
          v28 = objc_alloc_init(ICImportFolder);
          [(ICImportFolder *)v28 setUrl:v18];
          if (v35)
          {
            v29 = [v8 subFolders];
            [v29 addObject:v28];
          }
          [v9 addObject:v28];
LABEL_29:

          NSURLResourceKey v12 = NSURLIsDirectoryKey;
          goto LABEL_30;
        }
LABEL_23:
        id v30 = [(ICImportNoteProcessor *)self parserForFileURL:v18];

        if (v30)
        {
          v31 = v36;
          if (v35) {
            v31 = v8;
          }
          v28 = v31;
          v32 = [(ICImportFolder *)v28 fileURLs];
          [v32 addObject:v18];
        }
        else
        {
          v28 = (ICImportFolder *)os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(&v28->super, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v33;
            v42 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, &v28->super, OS_LOG_TYPE_DEBUG, "Cannot process file to import to notes: %@", buf, 0xCu);
          }
        }
        goto LABEL_29;
      }
    }
    else
    {
      if (([v19 BOOLValue] & 1) == 0) {
        goto LABEL_23;
      }
      unsigned __int8 v37 = 0;
    }
    if ([v38 BOOLValue]) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_2:
}

- (id)getTypeIdentifierForFileURL:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  id v9 = 0;
  unsigned __int8 v4 = [v3 getResourceValue:&v10 forKey:NSURLTypeIdentifierKey error:&v9];
  id v5 = v10;
  id v6 = v9;
  if ((v4 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B5A58(v6, (uint64_t)v3, v7);
    }
  }

  return v5;
}

- (void)traverseImportFolder:(id)a3 forAccount:(id)a4 shouldImportNotes:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v59 = a5;
  id v9 = a3;
  id v57 = a4;
  id v10 = (void (**)(void))a6;
  v54 = v9;
  if ([(ICImportNoteProcessor *)self shouldCancelImportProcess])
  {
    if (v10) {
      v10[2](v10);
    }
    goto LABEL_61;
  }
  v53 = v10;
  [(ICImportNoteProcessor *)self updateImportProgress];
  id v11 = [objc_alloc((Class)NSMutableArray) initWithObjects:v9, 0];
  v55 = v11;
LABEL_5:
  v56 = [v11 firstObject];
  [v55 removeObjectAtIndex:0];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = [v56 fileURLs];
  id v61 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
  if (!v61)
  {
LABEL_35:

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v39 = [v56 subFolders];
    id v40 = [v39 countByEnumeratingWithState:&v62 objects:v98 count:16];
    if (!v40) {
      goto LABEL_49;
    }
    uint64_t v41 = *(void *)v63;
LABEL_37:
    uint64_t v42 = 0;
    while (1)
    {
      if (*(void *)v63 != v41) {
        objc_enumerationMutation(v39);
      }
      v43 = *(void **)(*((void *)&v62 + 1) + 8 * v42);
      if ([(ICImportNoteProcessor *)self shouldCancelImportProcess])
      {
        if (v53) {
          ((void (*)(void))v53[2])();
        }

        goto LABEL_59;
      }
      v44 = [v43 fileURLs];
      if ([v44 count]) {
        break;
      }
      v45 = [v43 subFolders];
      BOOL v46 = [v45 count] == 0;

      if (!v46) {
        goto LABEL_44;
      }
LABEL_47:
      if (v40 == (id)++v42)
      {
        id v40 = [v39 countByEnumeratingWithState:&v62 objects:v98 count:16];
        if (v40) {
          goto LABEL_37;
        }
LABEL_49:

        id v51 = [v55 count];
        id v11 = v55;
        if (!v51
          || (v52 = [(ICImportNoteProcessor *)self shouldCancelImportProcess], id v11 = v55, v52))
        {
          if (v53)
          {
            ((void (*)(void))v53[2])();
            goto LABEL_59;
          }
          goto LABEL_60;
        }
        goto LABEL_5;
      }
    }

LABEL_44:
    if (v59)
    {
      v47 = [v43 url];
      v48 = [v47 lastPathComponent];

      v49 = [v56 folder];
      id v50 = [(ICImportNoteProcessor *)self newFolderWithTitle:v48 parentFolder:v49 forAccount:v57];

      [v43 setFolder:v50];
    }
    [v55 addObject:v43];
    goto LABEL_47;
  }
  uint64_t v60 = *(void *)v95;
LABEL_7:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v95 != v60) {
      objc_enumerationMutation(obj);
    }
    v13 = *(void **)(*((void *)&v94 + 1) + 8 * v12);
    if ([(ICImportNoteProcessor *)self shouldCancelImportProcess]) {
      break;
    }
    [(ICImportNoteProcessor *)self setCurrentURL:v13];
    v15 = [(ICImportNoteProcessor *)self parserForFileURL:v13];
    if (v15)
    {
      id v16 = v13;
      id v17 = +[ICPaths importDocumentsURL];
      v18 = [v17 URLByAppendingPathComponent:@"tmp" isDirectory:1];
      id v19 = [v18 URLByAppendingPathComponent:@"FilesToImport" isDirectory:1];

      id v20 = +[NSFileManager defaultManager];
      id v93 = 0;
      unsigned __int8 v21 = [v20 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v93];
      id v22 = v93;

      if ((v21 & 1) == 0)
      {
        id v23 = os_log_create("com.apple.notes", "Import");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error creating temporary directory for files to import: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      id v24 = [v16 lastPathComponent];
      v25 = [v19 URLByAppendingPathComponent:v24 isDirectory:0];

      id v26 = +[NSFileManager defaultManager];
      id v92 = v22;
      [v26 copyItemAtURL:v16 toURL:v25 error:&v92];
      id v27 = v92;

      if (v27)
      {
        v28 = os_log_create("com.apple.notes", "Import");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_1000B5CB8((uint64_t)v103, (uint64_t)v27);
        }
      }
      if (v59)
      {
        objc_initWeak(&location, self);
        dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v101 = 0x2020000000;
        char v102 = 0;
        objc_opt_class();
        char v102 = objc_opt_isKindOfClass() & 1;
        uint64_t v84 = 0;
        v85 = &v84;
        uint64_t v86 = 0x2020000000;
        uint64_t v87 = 0;
        uint64_t v80 = 0;
        v81 = &v80;
        uint64_t v82 = 0x2020000000;
        char v83 = 1;
        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = sub_10001176C;
        v76[3] = &unk_1000EE448;
        id v77 = v56;
        id v30 = v57;
        id v78 = v30;
        objc_copyWeak(&v79, &location);
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472;
        v74[2] = sub_100011A64;
        v74[3] = &unk_1000EE498;
        objc_copyWeak(&v75, &location);
        v74[4] = &buf;
        v74[5] = &v84;
        v74[6] = &v80;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472;
        v69[2] = sub_100011D24;
        v69[3] = &unk_1000EE4C0;
        objc_copyWeak(&v73, &location);
        v31 = v25;
        v70 = v31;
        p_long long buf = &buf;
        v72 = &v80;
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_100011D90;
        v67[3] = &unk_1000EE0C0;
        v32 = v29;
        v68 = v32;
        [v15 parseFileURL:v31 newNoteBlock:v76 updatedNoteBlock:v74 errorBlock:v69 completionBlock:v67];
        dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
        if (*(unsigned char *)(*((void *)&buf + 1) + 24))
        {
          long long v33 = [(ICImportNoteProcessor *)self eventReporter];
          [v33 submitEverNoteImportEventWithCount:v85[3] isSuccessful:*((unsigned __int8 *)v81 + 24) intoAccount:v30];
        }
        objc_destroyWeak(&v73);
        objc_destroyWeak(&v75);
        objc_destroyWeak(&v79);

        _Block_object_dispose(&v80, 8);
        _Block_object_dispose(&v84, 8);
        _Block_object_dispose(&buf, 8);

        objc_destroyWeak(&location);
      }
      else
      {
        dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
        objc_initWeak((id *)&buf, self);
        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472;
        v89[2] = sub_10001170C;
        v89[3] = &unk_1000EE3D0;
        objc_copyWeak(&v91, (id *)&buf);
        BOOL v35 = v34;
        v90 = v35;
        [v15 totalNotesFoundAtFileURL:v25 completionBlock:v89];
        dispatch_semaphore_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
        [(ICImportNoteProcessor *)self updateImportProgress];

        objc_destroyWeak(&v91);
        objc_destroyWeak((id *)&buf);
      }
      if (v25)
      {
        v36 = +[NSFileManager defaultManager];
        id v66 = 0;
        [v36 removeItemAtURL:v25 error:&v66];
        id v37 = v66;

        if (v37)
        {
          id v38 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_1000B5C5C((uint64_t)v99, (uint64_t)v37);
          }
        }
      }
    }
    else
    {
      v25 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "We must have a parser for url: %@", (uint8_t *)&buf, 0xCu);
      }
    }

    if (v61 == (id)++v12)
    {
      id v61 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
      if (v61) {
        goto LABEL_7;
      }
      goto LABEL_35;
    }
  }
  if (v53) {
    ((void (*)(void))v53[2])();
  }

LABEL_59:
  id v11 = v55;
LABEL_60:

  id v10 = v53;
LABEL_61:
}

- (id)newFolderWithTitle:(id)a3 parentFolder:(id)a4 forAccount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000FD10;
  id v26 = sub_10000FD20;
  id v27 = 0;
  id v11 = [(ICImportNoteProcessor *)self managedObjectContext];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100011F1C;
  v17[3] = &unk_1000EE4E8;
  id v12 = v9;
  id v18 = v12;
  unsigned __int8 v21 = &v22;
  id v13 = v10;
  id v19 = v13;
  id v14 = v8;
  id v20 = v14;
  [v11 performBlockAndWait:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (void)updateImportProgress
{
  id v3 = [(ICImportNoteProcessor *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ICImportNoteProcessor *)self delegate];
    [v5 progressUpdatedForImportNoteProcessor:self];
  }
}

- (ICImportNoteProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICImportNoteProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)totalNoteFound
{
  return self->_totalNoteFound;
}

- (void)setTotalNoteFound:(unint64_t)a3
{
  self->_totalNoteFound = a3;
}

- (unint64_t)totalNoteImported
{
  return self->_totalNoteImported;
}

- (void)setTotalNoteImported:(unint64_t)a3
{
  self->_totalNoteImported = a3;
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (void)setCurrentURL:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (NSArray)importNoteFileParsers
{
  return self->_importNoteFileParsers;
}

- (void)setImportNoteFileParsers:(id)a3
{
}

- (BOOL)shouldCancelImportProcess
{
  return self->_shouldCancelImportProcess;
}

- (void)setShouldCancelImportProcess:(BOOL)a3
{
  self->_shouldCancelImportProcess = a3;
}

- (NSMutableArray)currentErrorFileURLs
{
  return self->_currentErrorFileURLs;
}

- (void)setCurrentErrorFileURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentErrorFileURLs, 0);
  objc_storeStrong((id *)&self->_importNoteFileParsers, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end