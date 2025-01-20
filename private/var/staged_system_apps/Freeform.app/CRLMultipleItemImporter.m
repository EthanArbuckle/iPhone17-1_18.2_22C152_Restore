@interface CRLMultipleItemImporter
- (BOOL)isCancelled;
- (BOOL)usesProgressDialog;
- (CRLMediaCompatibilityAlertPresenter)alertPresenter;
- (CRLMultipleItemImporter)init;
- (CRLMultipleItemImporter)initWithDataWrappers:(id)a3 boardItemFactory:(id)a4 importAnimatedGIFsAsImages:(BOOL)a5;
- (CRLMultipleItemImporter)initWithURLs:(id)a3 boardItemFactory:(id)a4;
- (CRLMultipleItemImporter)initWithURLs:(id)a3 boardItemFactory:(id)a4 importAnimatedGIFsAsImages:(BOOL)a5;
- (CRLProgress)progress;
- (NSArray)URLs;
- (NSArray)boardItems;
- (NSArray)errors;
- (NSString)localizedErrorDescription;
- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory;
- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6;
- (void)boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3;
- (void)cancel;
- (void)importBoardItemsWithCompletionHandler:(id)a3;
- (void)p_importerDidRequestMediaCompatibilityRequirement:(id)a3;
- (void)setAlertPresenter:(id)a3;
- (void)setBoardItems:(id)a3;
- (void)setErrors:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation CRLMultipleItemImporter

- (CRLMultipleItemImporter)initWithURLs:(id)a3 boardItemFactory:(id)a4
{
  return [(CRLMultipleItemImporter *)self initWithURLs:a3 boardItemFactory:a4 importAnimatedGIFsAsImages:0];
}

- (CRLMultipleItemImporter)initWithURLs:(id)a3 boardItemFactory:(id)a4 importAnimatedGIFsAsImages:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CRLMultipleItemImporter;
  v10 = [(CRLMultipleItemImporter *)&v35 init];
  v11 = v10;
  if (v10)
  {
    sub_100482C08((id *)&v10->super.isa, v9);
    id v28 = v8;
    v12 = (NSArray *)[v8 copy];
    URLs = v11->_URLs;
    v11->_URLs = v12;

    id v30 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](v11->_URLs, "count")];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obj = v11->_URLs;
    id v14 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v17);
          if (!v5) {
            goto LABEL_9;
          }
          v19 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v17) crl_fileTypeIdentifierHandlingFileCoordinationPromises];
          v20 = [v19 identifier];
          unsigned __int8 v21 = +[CRLBoardItemImporter isSupportedAnimatedImageFileType:v20];

          v22 = off_1014C0E68;
          if ((v21 & 1) == 0) {
LABEL_9:
          }
            v22 = off_1014C0D50;
          id v23 = [objc_alloc(*v22) initWithURL:v18 boardItemFactory:v9];
          v24 = v23;
          if (v23)
          {
            [v23 setDelegate:v11];
            [v30 addObject:v24];
          }

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v15);
    }

    sub_100482CC0(v11, v30);
    v25 = [[CRLMultipleImporterHelper alloc] initWithImporters:v30];
    importerHelper = v11->_importerHelper;
    v11->_importerHelper = v25;

    id v8 = v28;
  }

  return v11;
}

- (CRLMultipleItemImporter)initWithDataWrappers:(id)a3 boardItemFactory:(id)a4 importAnimatedGIFsAsImages:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)CRLMultipleItemImporter;
  v10 = [(CRLMultipleItemImporter *)&v34 init];
  v11 = v10;
  if (v10)
  {
    id v28 = v9;
    sub_100482C08((id *)&v10->super.isa, v9);
    URLs = v11->_URLs;
    v11->_URLs = (NSArray *)&__NSArray0__struct;

    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v29 = v8;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v18);
          if (!v5) {
            goto LABEL_9;
          }
          uint64_t v20 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)v18) type];
          unsigned __int8 v21 = [(id)v20 identifier];

          LOBYTE(v20) = +[CRLBoardItemImporter isSupportedAnimatedImageFileType:v21];
          v22 = off_1014C0E68;
          if ((v20 & 1) == 0) {
LABEL_9:
          }
            v22 = off_1014C0D50;
          id v23 = [objc_alloc(*v22) initWithData:v19 boardItemFactory:v11->_boardItemFactory];
          v24 = v23;
          if (v23)
          {
            [v23 setDelegate:v11];
            [v13 addObject:v24];
          }

          uint64_t v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v16);
    }

    sub_100482CC0(v11, v13);
    v25 = [[CRLMultipleImporterHelper alloc] initWithImporters:v13];
    importerHelper = v11->_importerHelper;
    v11->_importerHelper = v25;

    id v9 = v28;
    id v8 = v29;
  }

  return v11;
}

- (CRLMultipleItemImporter)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FCF58);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    id v14 = "-[CRLMultipleItemImporter init]";
    __int16 v15 = 2082;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleItemImporter.m";
    __int16 v17 = 1024;
    int v18 = 167;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FCF78);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultipleItemImporter init]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleItemImporter.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:167 isFatal:0 description:"Do not call method"];

  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLMultipleItemImporter init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)importBoardItemsWithCompletionHandler:(id)a3
{
  id v13 = a3;
  v4 = dispatch_group_create();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v5 = [(CRLMultipleImporterHelper *)self->_importerHelper importers];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v9);
        dispatch_group_enter(v4);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100483570;
        v16[3] = &unk_1014CBBB0;
        __int16 v17 = v4;
        [v10 importBoardItemWithCompletionHandler:v16];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100483578;
  block[3] = &unk_1014D0AB0;
  block[4] = self;
  id v15 = v13;
  id v12 = v13;
  dispatch_group_notify(v4, importQueue, block);
}

- (void)cancel
{
  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100483970;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(importQueue, block);
}

- (NSString)localizedErrorDescription
{
  unsigned int v2 = [(CRLMultipleItemImporter *)self errors];
  id v3 = [v2 count];

  if (v3)
  {
    v4 = +[NSNumber numberWithUnsignedInteger:v3];
    BOOL v5 = +[NSNumberFormatter localizedStringFromNumber:v4 numberStyle:1];

    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"%@ files couldn’t be inserted." value:0 table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100483B98;
  block[3] = &unk_1014FA8A8;
  block[4] = self;
  id v16 = v10;
  int64_t v18 = a4;
  int64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(importQueue, block);
}

- (void)boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3
{
  id v4 = a3;
  importQueue = self->_importQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100483C78;
  v7[3] = &unk_1014CBE78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(importQueue, v7);
}

- (void)p_importerDidRequestMediaCompatibilityRequirement:(id)a3
{
  [(CRLMultipleImporterHelper *)self->_importerHelper mediaCompatibilityCheckHasBeenHandledForImporter:a3];
  if ([(CRLMultipleImporterHelper *)self->_importerHelper allImportersHaveGivenCompatibilityResponse]&& [(CRLMultipleImporterHelper *)self->_importerHelper numberOfImportersRequiringCompatibilityConversion])
  {
    id v4 = [(CRLMultipleItemImporter *)self alertPresenter];
    importerHelper = self->_importerHelper;
    if (v4)
    {
      uint64_t v6 = [(CRLMultipleImporterHelper *)importerHelper mediaTypeForConversion];
      if (!v6)
      {
        int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FCF98);
        }
        id v8 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B8068(v7, v8);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FCFB8);
        }
        id v9 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101066770(v9, v7);
        }
        id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultipleItemImporter p_importerDidRequestMediaCompatibilityRequirement:]");
        id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleItemImporter.m"];
        +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:322 isFatal:0 description:"No media types were specified! Falling back to Mixed to have understandable strings."];

        uint64_t v6 = 3;
      }
      int64_t v12 = [(CRLMultipleImporterHelper *)self->_importerHelper reasonsForMediaConversion];
      BOOL v13 = (id)[(CRLMultipleImporterHelper *)self->_importerHelper numberOfImportersRequiringCompatibilityConversion] == (id)1;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100483F38;
      v14[3] = &unk_1014FA938;
      v14[4] = self;
      [v4 presentMediaCompatibilityAlertWithReasons:v12 forMediaType:v6 forSingleMediaObject:v13 completionHandler:v14];
    }
    else
    {
      [(CRLMultipleImporterHelper *)importerHelper completeImportWithCompatibilityOnAllDevices:0 allowHEVCContent:1];
    }
  }
}

- (NSArray)URLs
{
  return self->_URLs;
}

- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory
{
  return self->_boardItemFactory;
}

- (CRLMediaCompatibilityAlertPresenter)alertPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertPresenter);

  return (CRLMediaCompatibilityAlertPresenter *)WeakRetained;
}

- (void)setAlertPresenter:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (CRLProgress)progress
{
  return &self->_progress->super;
}

- (void)setProgress:(id)a3
{
}

- (BOOL)usesProgressDialog
{
  return self->_usesProgressDialog;
}

- (NSArray)boardItems
{
  return self->_boardItems;
}

- (void)setBoardItems:(id)a3
{
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_boardItems, 0);
  objc_destroyWeak((id *)&self->_alertPresenter);
  objc_storeStrong((id *)&self->_boardItemFactory, 0);
  objc_storeStrong((id *)&self->_URLs, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_importerHelper, 0);

  objc_storeStrong((id *)&self->_importQueue, 0);
}

@end