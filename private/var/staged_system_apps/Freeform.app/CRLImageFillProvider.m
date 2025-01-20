@interface CRLImageFillProvider
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (void)makeCompatibleImageDataFromURL:(id)a3 forAssetOwner:(id)a4 modalOperationPresenter:(id)a5 compatibilityAlertPresenter:(id)a6 completionHandler:(id)a7;
+ (void)makeCompatibleImageFillDataFromURL:(id)a3 forAssetOwner:(id)a4 modalOperationPresenter:(id)a5 compatibilityAlertPresenter:(id)a6 completionHandler:(id)a7;
+ (void)p_makeCompatibleImageFillDataForFill:(BOOL)a3 withFillProvider:(id)a4 forAssetOwner:(id)a5 modalOperationPresenter:(id)a6 compatibilityAlertPresenter:(id)a7 completionHandler:(id)a8;
- (CRLImageFillProvider)init;
- (CRLImageFillProvider)initWithData:(id)a3 type:(id)a4;
- (CRLImageFillProvider)initWithURL:(id)a3;
- (void)cancel;
- (void)p_continueWorkOnMainThreadWithModalOperationPresenter:(id)a3 usingBlock:(id)a4;
- (void)p_convertImageData:(id)a3 toCompatibilityLevel:(int64_t)a4 assetOwner:(id)a5 completionHandler:(id)a6;
- (void)p_provideImageDataForAssetOwner:(id)a3 data:(id)a4 modalOperationPresenter:(id)a5 compatibilityAlertPresenter:(id)a6 completionHandler:(id)a7;
- (void)provideImageDataForAssetOwner:(id)a3 compatibilityAlertPresenter:(id)a4 completionHandler:(id)a5;
- (void)provideImageDataForAssetOwner:(id)a3 modalOperationPresenter:(id)a4 compatibilityAlertPresenter:(id)a5 completionHandler:(id)a6;
@end

@implementation CRLImageFillProvider

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return +[CRLBoardItemImporter supportedImageFileTypes];
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[CRLBoardItemImporter supportedImageFileTypes];
  unsigned int v11 = [v9 crl_conformsToAnyUTI:v10];

  if (v11)
  {
    a5 = (id *)[objc_alloc((Class)a1) initWithData:v8 type:v9];
  }
  else if (a5)
  {
    v17[0] = NSLocalizedDescriptionKey;
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"The image type is not supported on this device." value:0 table:0];
    v17[1] = @"CRLBoardItemImporterErrorMediaTypeKey";
    v18[0] = v13;
    v18[1] = &off_10155DE20;
    v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    id v15 = +[NSError errorWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:103 userInfo:v14];
    *a5 = v15;

    a5 = 0;
  }

  return a5;
}

- (CRLImageFillProvider)initWithData:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLImageFillProvider;
  id v9 = [(CRLImageFillProvider *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    unsigned int v11 = (NSString *)[v8 copy];
    type = v10->_type;
    v10->_type = v11;

    v13 = objc_alloc_init(CRLScaledProgress);
    progress = v10->_progress;
    v10->_progress = v13;
  }
  return v10;
}

- (CRLImageFillProvider)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLImageFillProvider;
  v5 = [(CRLImageFillProvider *)&v11 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    url = v5->_url;
    v5->_url = v6;

    id v8 = objc_alloc_init(CRLScaledProgress);
    progress = v5->_progress;
    v5->_progress = v8;
  }
  return v5;
}

- (CRLImageFillProvider)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F1E20);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLImageFillProvider init]";
    __int16 v15 = 2082;
    objc_super v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m";
    __int16 v17 = 1024;
    int v18 = 79;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F1E40);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider init]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:79 isFatal:0 description:"Do not call method"];

  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLImageFillProvider init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)p_continueWorkOnMainThreadWithModalOperationPresenter:(id)a3 usingBlock:(id)a4
{
  if (a3) {
    [a3 continueAsynchronousWorkOnMainThreadUsingBlock:a4];
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, a4);
  }
}

- (void)provideImageDataForAssetOwner:(id)a3 compatibilityAlertPresenter:(id)a4 completionHandler:(id)a5
{
}

- (void)provideImageDataForAssetOwner:(id)a3 modalOperationPresenter:(id)a4 compatibilityAlertPresenter:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v30 = a4;
  id v11 = a5;
  id v12 = a6;
  if (+[NSThread isMainThread])
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1E60);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5088();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1E80);
    }
    __int16 v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010690A0(v13);
    }
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider provideImageDataForAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]");
    __int16 v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:107 isFatal:0 description:"This operation must only be performed on the main thread."];

    if (v12)
    {
LABEL_3:
      if (v11) {
        goto LABEL_32;
      }
      goto LABEL_23;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F1EA0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A4FF4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F1EC0);
  }
  objc_super v16 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010690A0(v16);
  }
  __int16 v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider provideImageDataForAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]");
  int v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 108, 0, "invalid nil value for '%{public}s'", "completionHandler");

  if (!v11)
  {
LABEL_23:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1EE0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A4F60();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1F00);
    }
    v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010690A0(v19);
    }
    v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider provideImageDataForAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]");
    v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 109, 0, "invalid nil value for '%{public}s'", "alertPresenter");
  }
LABEL_32:
  v22 = +[UTType typeWithIdentifier:self->_type];
  v23 = v22;
  if (v22)
  {
    v24 = [v22 preferredFilenameExtension];
  }
  else
  {
    v24 = @"png";
  }
  v25 = +[CRLBoardItemImporter defaultPastedImageName];
  id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", v25, v24];
  if (self->_data)
  {
    v27 = [[_TtC8Freeform27CRLPreinsertionAssetWrapper alloc] initWithData:self->_data filename:v26 owner:v10 error:0];
  }
  else
  {
    if (!self->_url)
    {
LABEL_41:
      v29 = v30;
      [(CRLImageFillProvider *)self p_provideImageDataForAssetOwner:v10 data:0 modalOperationPresenter:v30 compatibilityAlertPresenter:v11 completionHandler:v12];
      goto LABEL_42;
    }
    v27 = [[_TtC8Freeform27CRLPreinsertionAssetWrapper alloc] initWithUrl:self->_url owner:v10];
  }
  v28 = v27;
  if (!v27) {
    goto LABEL_41;
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1003740C0;
  v31[3] = &unk_1014F1F28;
  v31[4] = self;
  id v32 = v10;
  v29 = v30;
  id v33 = v30;
  id v34 = v11;
  id v35 = v12;
  [(CRLPreinsertionAssetWrapper *)v28 createAssetWithCompletionHandler:v31];

LABEL_42:
}

- (void)p_provideImageDataForAssetOwner:(id)a3 data:(id)a4 modalOperationPresenter:(id)a5 compatibilityAlertPresenter:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1F48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5110();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1F68);
    }
    __int16 v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010690A0(v17);
    }
    int v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillProvider p_provideImageDataForAssetOwner:data:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:152 isFatal:0 description:"Cannot make image data to provide a fill!"];
  }
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100374464;
  v36[3] = &unk_1014F1FB8;
  v36[4] = self;
  id v20 = v14;
  id v37 = v20;
  id v38 = v16;
  id v21 = v16;
  v22 = objc_retainBlock(v36);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1003745EC;
  v29[3] = &unk_1014F2008;
  v29[4] = self;
  id v30 = v20;
  v31 = [[CRLImageCompatibilityChecker alloc] initWithImageData:v13];
  id v32 = v13;
  id v34 = v15;
  id v35 = v22;
  id v33 = v12;
  id v23 = v15;
  id v24 = v12;
  v25 = v22;
  id v26 = v13;
  v27 = v31;
  id v28 = v20;
  [(CRLImageCompatibilityChecker *)v27 checkCompatibilityUpToLevel:4 completionHandler:v29];
}

- (void)p_convertImageData:(id)a3 toCompatibilityLevel:(int64_t)a4 assetOwner:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [[CRLImageCompatibilityConverter alloc] initWithImageData:v12 desiredCompatibilityLevel:a4 assetOwner:v11];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100374C98;
  v16[3] = &unk_1014F2070;
  int v18 = self;
  id v19 = v10;
  __int16 v17 = v13;
  id v14 = v10;
  id v15 = v13;
  [(CRLImageCompatibilityConverter *)v15 convertMediaWithCompletionHandler:v16];
}

+ (void)makeCompatibleImageDataFromURL:(id)a3 forAssetOwner:(id)a4 modalOperationPresenter:(id)a5 compatibilityAlertPresenter:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  __int16 v17 = [[CRLImageFillProvider alloc] initWithURL:v16];

  [a1 p_makeCompatibleImageFillDataForFill:0 withFillProvider:v17 forAssetOwner:v15 modalOperationPresenter:v14 compatibilityAlertPresenter:v13 completionHandler:v12];
}

+ (void)makeCompatibleImageFillDataFromURL:(id)a3 forAssetOwner:(id)a4 modalOperationPresenter:(id)a5 compatibilityAlertPresenter:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  __int16 v17 = [[CRLImageFillProvider alloc] initWithURL:v16];

  [a1 p_makeCompatibleImageFillDataForFill:1 withFillProvider:v17 forAssetOwner:v15 modalOperationPresenter:v14 compatibilityAlertPresenter:v13 completionHandler:v12];
}

+ (void)p_makeCompatibleImageFillDataForFill:(BOOL)a3 withFillProvider:(id)a4 forAssetOwner:(id)a5 modalOperationPresenter:(id)a6 compatibilityAlertPresenter:(id)a7 completionHandler:(id)a8
{
  BOOL v39 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (+[NSThread isMainThread])
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2090);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A57E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F20B0);
    }
    __int16 v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5730(v17);
    }
    int v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]");
    id v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:321 isFatal:0 description:"This operation must only be performed on the main thread."];

    if (v12)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F20D0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A569C();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F20F0);
  }
  id v20 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A55EC(v20);
  }
  id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]");
  v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 322, 0, "invalid nil value for '%{public}s'", "fillProvider");

  if (v15)
  {
LABEL_4:
    if (v14) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_25:
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2110);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A5558();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2130);
  }
  id v23 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A54A8(v23);
  }
  id v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]");
  v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 323, 0, "invalid nil value for '%{public}s'", "alertPresenter");

  if (v14)
  {
LABEL_5:
    if (v16) {
      goto LABEL_52;
    }
    goto LABEL_43;
  }
LABEL_34:
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2150);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A5414();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2170);
  }
  id v26 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A5364(v26);
  }
  v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]");
  id v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 324, 0, "invalid nil value for '%{public}s'", "modalOperationPresenter");

  if (!v16)
  {
LABEL_43:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2190);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A52D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F21B0);
    }
    v29 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5220(v29);
    }
    id v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImageFillProvider p_makeCompatibleImageFillDataForFill:withFillProvider:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:]");
    v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFillProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 325, 0, "invalid nil value for '%{public}s'", "completionHandler");
  }
LABEL_52:
  id v32 = [[CRLBasicProgress alloc] initWithMaxValue:1.0];
  [(CRLBasicProgress *)v32 setIndeterminate:1];
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 0;
  id v33 = +[NSBundle mainBundle];
  if (v39) {
    [v33 localizedStringForKey:@"Inserting image fill" value:0 table:0];
  }
  else {
  id v34 = [v33 localizedStringForKey:@"Inserting image" value:0 table:0];
  }

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100375D1C;
  v45[3] = &unk_1014CB090;
  v47 = v48;
  id v35 = v12;
  id v46 = v35;
  v36 = [v14 beginModalOperationWithLocalizedMessage:v34 progress:v32 cancelHandler:v45];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100375D34;
  v40[3] = &unk_1014F2200;
  id v37 = v14;
  id v41 = v37;
  v42 = v36;
  id v38 = v16;
  id v43 = v38;
  v44 = v48;
  [v35 provideImageDataForAssetOwner:v13 modalOperationPresenter:v37 compatibilityAlertPresenter:v15 completionHandler:v40];

  _Block_object_dispose(v48, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end