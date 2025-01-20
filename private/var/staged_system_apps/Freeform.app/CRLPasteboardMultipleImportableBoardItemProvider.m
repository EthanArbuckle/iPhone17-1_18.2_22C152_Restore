@interface CRLPasteboardMultipleImportableBoardItemProvider
- (BOOL)isCancelled;
- (BOOL)p_validateSizeOfImportWithTotalSize:(unint64_t)a3 totalEmbeddedDataSize:(unint64_t)a4 insertedImage:(BOOL)a5 insertedMovie:(BOOL)a6 insertedAudio:(BOOL)a7 preexistingTooLargeErrors:(id)a8 error:(id *)a9;
- (CRLMediaCompatibilityAlertPresenter)alertPresenter;
- (CRLPasteboardMultipleImportableBoardItemProvider)initWithImportableBoardItemProviders:(id)a3;
- (CRLProgress)progress;
- (NSArray)boardItemProviders;
- (NSArray)boardItems;
- (NSArray)errors;
- (NSArray)pasteboardBoardItems;
- (NSString)localizedErrorDescription;
- (void)cancel;
- (void)importableBoardItemProvider:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6;
- (void)importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3;
- (void)p_boardItemProviderDidRequestMediaCompatibilityRequirement:(id)a3;
- (void)provideBoardItemsWithFactory:(id)a3 completionHandler:(id)a4;
- (void)setAlertPresenter:(id)a3;
@end

@implementation CRLPasteboardMultipleImportableBoardItemProvider

- (CRLPasteboardMultipleImportableBoardItemProvider)initWithImportableBoardItemProviders:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  id v6 = v5;
  if (!v4 || !v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA820);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3834();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA840);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardMultipleImportableBoardItemProvider initWithImportableBoardItemProviders:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardMultipleImportableBoardItemProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 37, 0, "Invalid parameter not satisfying: %{public}s", "(boardItemProviders != nil) && (boardItemProvidersCount > 0)");
  }
  v30.receiver = self;
  v30.super_class = (Class)CRLPasteboardMultipleImportableBoardItemProvider;
  v10 = [(CRLPasteboardMultipleImportableBoardItemProvider *)&v30 init];
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("CRLPasteboardMultipleImportableBoardItemProvider", 0);
    mProviderQueue = v10->mProviderQueue;
    v10->mProviderQueue = (OS_dispatch_queue *)v11;

    v13 = [[CRLMultipleImporterHelper alloc] initWithImporters:v4];
    mImporterHelper = v10->mImporterHelper;
    v10->mImporterHelper = v13;

    id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v6];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v4;
    id v17 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v22 = [v21 progress];
          if (v22) {
            [v15 addObject:v22];
          }
          [v21 setDelegate:v10];
        }
        id v18 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v18);
    }

    v23 = [[CRLProgressGroup alloc] initWithChildren:v15];
    mProgress = v10->mProgress;
    v10->mProgress = &v23->super;
  }
  return v10;
}

- (NSArray)boardItemProviders
{
  return [(CRLMultipleImporterHelper *)self->mImporterHelper importers];
}

- (BOOL)p_validateSizeOfImportWithTotalSize:(unint64_t)a3 totalEmbeddedDataSize:(unint64_t)a4 insertedImage:(BOOL)a5 insertedMovie:(BOOL)a6 insertedAudio:(BOOL)a7 preexistingTooLargeErrors:(id)a8 error:(id *)a9
{
  if (a9) {
    *a9 = 0;
  }
  return 1;
}

- (void)provideBoardItemsWithFactory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  if (!v20)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA860);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B38E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA880);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardMultipleImportableBoardItemProvider provideBoardItemsWithFactory:completionHandler:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardMultipleImportableBoardItemProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 85, 0, "Invalid parameter not satisfying: %{public}s", "completionHandler != nil");
  }
  v10 = dispatch_group_create();
  v21 = self;
  dispatch_queue_t v11 = [(CRLMultipleImporterHelper *)self->mImporterHelper importers];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        dispatch_group_enter(v10);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100451264;
        v26[3] = &unk_1014CBBB0;
        long long v27 = v10;
        [v16 provideBoardItemWithFactory:v6 completionHandler:v26];
      }
      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }
  mProviderQueue = v21->mProviderQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045126C;
  block[3] = &unk_1014D3990;
  id v23 = v11;
  v24 = v21;
  id v25 = v20;
  id v18 = v20;
  id v19 = v11;
  dispatch_group_notify(v10, mProviderQueue, block);
}

- (void)cancel
{
  mProviderQueue = self->mProviderQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100451774;
  block[3] = &unk_1014CBBB0;
  void block[4] = self;
  dispatch_async(mProviderQueue, block);
}

- (NSArray)boardItems
{
  return (NSArray *)[(NSArray *)self->mPasteboardBoardItems crl_boardItemsFromIngestibleItemsAndDescriptions:self->mPasteboardBoardItems];
}

- (NSString)localizedErrorDescription
{
  v2 = [(CRLPasteboardMultipleImportableBoardItemProvider *)self errors];
  id v3 = [v2 count];

  if (v3)
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"%ld items couldn’t be inserted." value:0 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v3);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (void)importableBoardItemProvider:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  mProviderQueue = self->mProviderQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100451978;
  block[3] = &unk_1014FA8A8;
  void block[4] = self;
  id v16 = v10;
  int64_t v18 = a4;
  int64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(mProviderQueue, block);
}

- (void)importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3
{
  id v4 = a3;
  mProviderQueue = self->mProviderQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100451A68;
  v7[3] = &unk_1014CBE78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mProviderQueue, v7);
}

- (void)p_boardItemProviderDidRequestMediaCompatibilityRequirement:(id)a3
{
  [(CRLMultipleImporterHelper *)self->mImporterHelper mediaCompatibilityCheckHasBeenHandledForImporter:a3];
  if ([(CRLMultipleImporterHelper *)self->mImporterHelper allImportersHaveGivenCompatibilityResponse]&& [(CRLMultipleImporterHelper *)self->mImporterHelper numberOfImportersRequiringCompatibilityConversion])
  {
    id v4 = [(CRLPasteboardMultipleImportableBoardItemProvider *)self alertPresenter];
    mImporterHelper = self->mImporterHelper;
    if (v4)
    {
      uint64_t v6 = [(CRLMultipleImporterHelper *)mImporterHelper mediaTypeForConversion];
      if (!v6)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FA8C8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B3994();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FA8E8);
        }
        v7 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v7);
        }
        id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardMultipleImportableBoardItemProvider p_boardItemProviderDidRequestMediaCompatibilityRequirement:]");
        v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardMultipleImportableBoardItemProvider.m"];
        +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:248 isFatal:0 description:"No media types were specified! Falling back to Mixed to have understandable strings."];

        uint64_t v6 = 3;
      }
      int64_t v10 = [(CRLMultipleImporterHelper *)self->mImporterHelper reasonsForMediaConversion];
      BOOL v11 = (id)[(CRLMultipleImporterHelper *)self->mImporterHelper numberOfImportersRequiringCompatibilityConversion] == (id)1;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100451D60;
      v12[3] = &unk_1014FA938;
      v12[4] = self;
      [v4 presentMediaCompatibilityAlertWithReasons:v10 forMediaType:v6 forSingleMediaObject:v11 completionHandler:v12];
    }
    else
    {
      [(CRLMultipleImporterHelper *)mImporterHelper completeImportWithCompatibilityOnAllDevices:0 allowHEVCContent:1];
    }
  }
}

- (CRLMediaCompatibilityAlertPresenter)alertPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mAlertPresenter);

  return (CRLMediaCompatibilityAlertPresenter *)WeakRetained;
}

- (void)setAlertPresenter:(id)a3
{
}

- (CRLProgress)progress
{
  return self->mProgress;
}

- (BOOL)isCancelled
{
  return self->mCancelled;
}

- (NSArray)pasteboardBoardItems
{
  return self->mPasteboardBoardItems;
}

- (NSArray)errors
{
  return self->mErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mErrors, 0);
  objc_storeStrong((id *)&self->mPasteboardBoardItems, 0);
  objc_storeStrong((id *)&self->mProgress, 0);
  objc_storeStrong((id *)&self->mImporterHelper, 0);
  objc_destroyWeak((id *)&self->mAlertPresenter);

  objc_storeStrong((id *)&self->mProviderQueue, 0);
}

@end