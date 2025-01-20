@interface CRLInfoImporterBoardItemProvider
+ (BOOL)canInitWithType:(id)a3;
+ (NSArray)disallowedTypes;
- (CRLInfoImporterBoardItemProvider)init;
- (CRLInfoImporterBoardItemProvider)initWithData:(id)a3 type:(id)a4 boardItemFactory:(id)a5;
- (CRLInfoImporterBoardItemProvider)initWithURL:(id)a3 type:(id)a4 boardItemFactory:(id)a5;
- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate;
- (CRLProgress)progress;
- (NSError)error;
- (_TtC8Freeform12CRLBoardItem)boardItem;
- (unint64_t)embeddedDataLength;
- (unint64_t)uploadDataLength;
- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6;
- (void)boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3;
- (void)cancel;
- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CRLInfoImporterBoardItemProvider

+ (BOOL)canInitWithType:(id)a3
{
  v3 = +[UTType typeWithIdentifier:a3];
  if (v3)
  {
    v4 = +[CRLBoardItemImporter supportedImageFileUTTypes];
    v5 = +[CRLBoardItemImporter supportedMovieFileUTTypes];
    v6 = [v4 arrayByAddingObjectsFromArray:v5];

    v7 = +[CRLBoardItemImporter supportedFileUTTypes];
    v8 = [v6 arrayByAddingObjectsFromArray:v7];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend(v3, "conformsToType:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16))
          {
            v13 = +[CRLInfoImporterBoardItemProvider disallowedTypes];
            unsigned int v14 = [v13 containsObject:v3];

            if (!v14)
            {
              LOBYTE(v10) = 1;
              goto LABEL_14;
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

+ (NSArray)disallowedTypes
{
  if (qword_1016A9878 != -1) {
    dispatch_once(&qword_1016A9878, &stru_1014F48E8);
  }
  v2 = (void *)qword_1016A9870;

  return (NSArray *)v2;
}

- (CRLInfoImporterBoardItemProvider)initWithData:(id)a3 type:(id)a4 boardItemFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRLInfoImporterBoardItemProvider;
  v12 = [(CRLInfoImporterBoardItemProvider *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    unsigned int v14 = (NSString *)[v10 copy];
    type = v13->_type;
    v13->_type = v14;

    objc_storeStrong((id *)&v13->_boardItemFactory, a5);
    long long v16 = objc_alloc_init(CRLScaledProgress);
    progress = v13->_progress;
    v13->_progress = v16;
  }
  return v13;
}

- (CRLInfoImporterBoardItemProvider)initWithURL:(id)a3 type:(id)a4 boardItemFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CRLInfoImporterBoardItemProvider;
  id v11 = [(CRLInfoImporterBoardItemProvider *)&v29 init];
  if (v11)
  {
    id v28 = 0;
    v12 = [[CRLTemporaryDirectory alloc] initWithSignature:@"ImporterBoardItemProvider" error:&v28];
    id v13 = v28;
    temporaryDirectory = v11->_temporaryDirectory;
    v11->_temporaryDirectory = v12;

    if (!v13)
    {
      v15 = [(CRLTemporaryDirectory *)v11->_temporaryDirectory URL];
      long long v16 = [v8 lastPathComponent];
      uint64_t v17 = [v15 URLByAppendingPathComponent:v16];
      dataURL = v11->_dataURL;
      v11->_dataURL = (NSURL *)v17;

      objc_super v19 = +[NSFileManager defaultManager];
      v20 = v11->_dataURL;
      id v27 = 0;
      [v19 copyItemAtURL:v8 toURL:v20 error:&v27];
      id v13 = v27;

      if (!v13)
      {
        v21 = (NSString *)[v9 copy];
        type = v11->_type;
        v11->_type = v21;

        v23 = objc_alloc_init(CRLScaledProgress);
        progress = v11->_progress;
        v11->_progress = v23;
      }
    }
    objc_storeStrong((id *)&v11->_boardItemFactory, a5);
    if (v13)
    {
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014F4908);
      }
      v25 = off_10166B498;
      if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
        sub_1010AA12C((uint64_t)v8, v25, v13);
      }

      id v11 = 0;
    }
  }
  return v11;
}

- (CRLInfoImporterBoardItemProvider)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F4928);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    unsigned int v14 = "-[CRLInfoImporterBoardItemProvider init]";
    __int16 v15 = 2082;
    long long v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m";
    __int16 v17 = 1024;
    int v18 = 124;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F4948);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    unsigned int v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider init]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:124 isFatal:0 description:"Do not call method"];

  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLInfoImporterBoardItemProvider init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(void))a4;
  v6 = +[UTType typeWithIdentifier:self->_type];
  if (!v6)
  {
    uint64_t v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4968);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AA408(&self->_type, v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4988);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider provideBoardItemWithFactory:completionHandler:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 132, 0, "Failed to create a UTType for %{public}@", self->_type);
  }
  unsigned int v12 = [v6 preferredFilenameExtension];
  __int16 v13 = +[CRLIngestionTypes supportedMovieUTTypes];
  unsigned int v14 = [v6 crl_conformsToAnyUTType:v13];

  if (v14)
  {
    id v15 = +[CRLBoardItemImporter defaultPastedMovieName];
    id v16 = objc_alloc((Class)NSString);
    CFStringRef v17 = @"mov";
    if (v12) {
      CFStringRef v17 = v12;
    }
    id v18 = [v16 initWithFormat:@"%@.%@", v15, v17];
    goto LABEL_21;
  }
  objc_super v19 = +[CRLIngestionTypes supportedImageUTTypes];
  unsigned int v20 = [v6 crl_conformsToAnyUTType:v19];

  if (v20)
  {
    id v15 = +[CRLBoardItemImporter defaultPastedImageName];
    id v21 = objc_alloc((Class)NSString);
    CFStringRef v22 = @"png";
    if (v12) {
      CFStringRef v22 = v12;
    }
    id v23 = [v21 initWithFormat:@"%@.%@", v15, v22];
    int v24 = 1;
  }
  else
  {
    v25 = [v6 localizedDescription];
    id v15 = v25;
    if (v12)
    {
      id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v25, v12];
LABEL_21:
      id v23 = v18;
      int v24 = 0;
      goto LABEL_22;
    }
    id v15 = v25;
    int v24 = 0;
    id v23 = v15;
  }
LABEL_22:

  if (self->_data)
  {
    v58 = v5;
    v26 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    data = self->_data;
    id v28 = [(CRLBoardItemFactory *)self->_boardItemFactory assetOwner];
    id v60 = 0;
    objc_super v29 = [(CRLPreinsertionAssetWrapper *)v26 initWithData:data filename:v23 owner:v28 error:&v60];
    id v30 = v60;

    if (!v29)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F49A8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AA2E0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F49C8);
      }
      v5 = v58;
      v37 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v37);
      }
      v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider provideBoardItemWithFactory:completionHandler:]");
      v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"];
      +[CRLAssertionHandler handleFailureInFunction:v38, v39, 160, 0, "Error %@ creating pre-insertion asset wrapper for data.", v30 file lineNumber isFatal description];
      goto LABEL_41;
    }
    v31 = [[CRLBoardItemImporter alloc] initWithData:v29 boardItemFactory:self->_boardItemFactory];
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v44 = +[CRLIngestionTypes supportedMovieUTTypes];
      unsigned int v45 = [v6 crl_conformsToAnyUTType:v44];

      if (v45)
      {
        v34 = +[CRLBoardItemImporter defaultPastedMovieName];
        CFStringRef v35 = @"mov";
        goto LABEL_53;
      }
    }
    else if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v32 = +[CRLIngestionTypes supportedImageUTTypes];
        unsigned int v33 = [v6 crl_conformsToAnyUTType:v32];

        if (v33)
        {
          v34 = +[CRLBoardItemImporter defaultPastedImageName];
          CFStringRef v35 = @"png";
LABEL_53:
          id v46 = objc_alloc((Class)NSString);
          if (v12) {
            CFStringRef v47 = v12;
          }
          else {
            CFStringRef v47 = v35;
          }
          id v48 = [v46 initWithFormat:@"%@.%@", v34, v47];

          v49 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
          v50 = self->_data;
          v51 = [(CRLBoardItemFactory *)self->_boardItemFactory assetOwner];
          id v59 = v30;
          objc_super v29 = [(CRLPreinsertionAssetWrapper *)v49 initWithData:v50 filename:v48 owner:v51 error:&v59];
          id v52 = v59;

          if (v29)
          {
            id v23 = v48;
            id v30 = v52;
LABEL_59:

            v53 = [[CRLBoardItemImporter alloc] initWithData:v29 boardItemFactory:self->_boardItemFactory];
            infoImporter = self->_infoImporter;
            self->_infoImporter = v53;

            id v30 = v29;
            v5 = v58;
            goto LABEL_60;
          }
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F49E8);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010AA374();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F4A08);
          }
          v57 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v57);
          }
          v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider provideBoardItemWithFactory:completionHandler:]");
          v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"];
          +[CRLAssertionHandler handleFailureInFunction:v38, v39, 185, 0, "Error %@ creating pre-insertion asset wrapper for data.", v52 file lineNumber isFatal description];
          id v23 = v48;
          id v30 = v52;
          v5 = v58;
LABEL_41:

          goto LABEL_60;
        }
      }
    }

    goto LABEL_59;
  }
  if (self->_dataURL)
  {
    v36 = [[CRLBoardItemImporter alloc] initWithURL:self->_dataURL boardItemFactory:self->_boardItemFactory];
    id v30 = self->_infoImporter;
    self->_infoImporter = v36;
  }
  else
  {
    int v40 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4A28);
    }
    v41 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AA234(v40, v41);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4A48);
    }
    v42 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v42);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider provideBoardItemWithFactory:completionHandler:]");
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v30 file:v43 lineNumber:191 isFatal:0 description:"No data or URL available. Unable to import."];
  }
LABEL_60:

  v55 = self->_infoImporter;
  if (v55)
  {
    v56 = [(CRLBoardItemImporter *)v55 progress];
    [(CRLScaledProgress *)self->_progress setProgress:v56];
    [v56 maxValue];
    -[CRLScaledProgress setMaxValue:](self->_progress, "setMaxValue:");
    [(CRLBoardItemImporter *)self->_infoImporter setDelegate:self];
    [(CRLBoardItemImporter *)self->_infoImporter importBoardItemWithCompletionHandler:v5];
  }
  else
  {
    v56 = [(CRLInfoImporterBoardItemProvider *)self delegate];
    if (v56 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v56 importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:self];
    }
    if (v5) {
      v5[2](v5);
    }
  }
}

- (void)cancel
{
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return [(CRLBoardItemImporter *)self->_infoImporter boardItem];
}

- (NSError)error
{
  return [(CRLBoardItemImporter *)self->_infoImporter error];
}

- (unint64_t)uploadDataLength
{
  return [(CRLBoardItemImporter *)self->_infoImporter uploadDataLength];
}

- (unint64_t)embeddedDataLength
{
  return [(CRLBoardItemImporter *)self->_infoImporter embeddedDataLength];
}

- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v9 = (void (**)(id, void, uint64_t))a6;
  id v10 = [(CRLInfoImporterBoardItemProvider *)self delegate];
  id v11 = v10;
  if (v10) {
    [v10 importableBoardItemProvider:self needsMediaCompatibilityFeedbackWithReasons:a4 forMediaType:a5 usingBlock:v9];
  }
  else {
    v9[2](v9, 0, 1);
  }
}

- (void)boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3
{
  uint64_t v4 = [(CRLInfoImporterBoardItemProvider *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v4 = objc_opt_respondsToSelector();
    if (v4) {
      uint64_t v4 = (uint64_t)[v5 importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:self];
    }
  }

  _objc_release_x2(v4);
}

- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CRLIngestibleItemImportableBoardItemProviderDelegate *)a3;
}

- (CRLProgress)progress
{
  return &self->_progress->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_infoImporter, 0);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_boardItemFactory, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_dataURL, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end