@interface CRLMovieCompatibilityConverter
+ (id)p_uniquePathForConvertingData:(id)a3 toType:(id)a4;
+ (id)progressStringForUpgradingMoviesWithPreset:(int64_t)a3 dataCount:(unint64_t)a4 filename:(id)a5;
+ (void)initialize;
- (CRLMovieCompatibilityConverter)init;
- (CRLMovieCompatibilityConverter)initWithMovieData:(id)a3 auxiliaryMovieData:(id)a4 auxiliaryMovieDataFilename:(id)a5 desiredCompatibilityLevel:(int64_t)a6 initialCompatibilityLevel:(int64_t)a7 assetOwner:(id)a8;
- (CRLMovieCompatibilityConverter)initWithMovieData:(id)a3 desiredCompatibilityLevel:(int64_t)a4 initialCompatibilityLevel:(int64_t)a5 assetOwner:(id)a6;
- (CRLProgress)progress;
- (NSError)error;
- (_TtC8Freeform8CRLAsset)convertedMediaData;
- (id)p_exportSessionForAsset:(id)a3 presetName:(id)a4 data:(id)a5 outputURL:(id)a6 preserveFrameDuration:(BOOL)a7;
- (int64_t)mediaType;
- (int64_t)playableOnAllDevicesPreset;
- (void)cancel;
- (void)convertMediaWithCompletionHandler:(id)a3;
- (void)p_checkInitialCompatibilityLevelWithCompletionHandler:(id)a3;
- (void)p_convertMovieData:(id)a3 fromPlayableByAVFoundationToAllDevicesWithCompletionHandler:(id)a4;
- (void)p_convertMovieData:(id)a3 withPresetName:(id)a4 completionHandler:(id)a5;
- (void)p_finishConvertingWithConvertedMovieData:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)setPlayableOnAllDevicesPreset:(int64_t)a3;
@end

@implementation CRLMovieCompatibilityConverter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.freeform.CRLMovieCompatibilityConverter", 0);
    v3 = (void *)qword_1016A9810;
    qword_1016A9810 = (uint64_t)v2;
  }
}

- (CRLMovieCompatibilityConverter)initWithMovieData:(id)a3 auxiliaryMovieData:(id)a4 auxiliaryMovieDataFilename:(id)a5 desiredCompatibilityLevel:(int64_t)a6 initialCompatibilityLevel:(int64_t)a7 assetOwner:(id)a8
{
  id v14 = a3;
  id v40 = a4;
  id v45 = a4;
  id v15 = a5;
  id v42 = a8;
  id v44 = a8;
  v47.receiver = self;
  v47.super_class = (Class)CRLMovieCompatibilityConverter;
  v16 = [(CRLMovieCompatibilityConverter *)&v47 init];
  int64_t v46 = a7;
  if (a6 <= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F19A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A4640();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F19C0);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter initWithMovieData:auxiliaryMovieData:auxiliaryMovieDataFilename:desiredCompatibilityLevel:initialCompatibilityLevel:assetOwner:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 68, 0, "Invalid parameter not satisfying: %{public}s", "desiredCompatibilityLevel >= CRLMediaCompatibilityLevelPlayableOnThisDevice");

    a7 = v46;
  }
  if (a7 >= a6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F19E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A45AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1A00);
    }
    v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter initWithMovieData:auxiliaryMovieData:auxiliaryMovieDataFilename:desiredCompatibilityLevel:initialCompatibilityLevel:assetOwner:]");
    v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 69, 0, "Invalid parameter not satisfying: %{public}s", "initialCompatibilityLevel < desiredCompatibilityLevel");

    a7 = v46;
  }
  if (v16)
  {
    if (qword_101719CF8 != -1) {
      dispatch_once(&qword_101719CF8, &stru_1014F1A20);
    }
    v24 = v40;
    v23 = v42;
    v25 = off_10166DC90;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
    {
      if (v14)
      {
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = @"Nil";
      }
      v37 = [v14 filename];
      v41 = [v14 assetUUID];
      v38 = [v41 UUIDString];
      *(_DWORD *)buf = 134219266;
      v49 = v16;
      __int16 v50 = 2114;
      v51 = v43;
      __int16 v52 = 2112;
      v53 = v37;
      __int16 v54 = 2114;
      v55 = v38;
      __int16 v56 = 2048;
      int64_t v57 = v46;
      __int16 v58 = 2048;
      int64_t v59 = a6;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_DEBUG, "creating converter %p for data <%{public}@: filename=%@, assetUUID=%{public}@>  initialCompatLevel %li desiredCompatLevel %li", buf, 0x3Eu);

      if (v14) {
      a7 = v46;
      }
    }

    objc_storeStrong((id *)&v16->mMovieData, a3);
    objc_storeStrong((id *)&v16->mAuxiliaryMovieData, v24);
    v26 = (NSString *)[v15 copy];
    mAuxiliaryMovieDataFilename = v16->mAuxiliaryMovieDataFilename;
    v16->mAuxiliaryMovieDataFilename = v26;

    v16->mInitialCompatibilityLevel = a7;
    v16->mDesiredCompatibilityLevel = a6;
    objc_storeStrong((id *)&v16->mAssetOwner, v23);
    id v28 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
    if (v16->mInitialCompatibilityLevel <= 2)
    {
      v29 = [[CRLBasicProgress alloc] initWithMaxValue:3.0];
      mMakePlayableProgress = v16->mMakePlayableProgress;
      v16->mMakePlayableProgress = v29;

      [v28 addObject:v16->mMakePlayableProgress];
    }
    if (v16->mDesiredCompatibilityLevel >= 3)
    {
      v31 = [[CRLBasicProgress alloc] initWithMaxValue:3.0];
      mAllDevicesProgress = v16->mAllDevicesProgress;
      v16->mAllDevicesProgress = v31;

      [v28 addObject:v16->mAllDevicesProgress];
    }
    v33 = [[CRLProgressGroup alloc] initWithChildren:v28];
    mProgress = v16->mProgress;
    v16->mProgress = v33;
  }
  return v16;
}

- (CRLMovieCompatibilityConverter)initWithMovieData:(id)a3 desiredCompatibilityLevel:(int64_t)a4 initialCompatibilityLevel:(int64_t)a5 assetOwner:(id)a6
{
  return [(CRLMovieCompatibilityConverter *)self initWithMovieData:a3 auxiliaryMovieData:0 auxiliaryMovieDataFilename:0 desiredCompatibilityLevel:a4 initialCompatibilityLevel:a5 assetOwner:a6];
}

- (CRLMovieCompatibilityConverter)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F1A40);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    id v14 = "-[CRLMovieCompatibilityConverter init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m";
    __int16 v17 = 1024;
    int v18 = 109;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F1A60);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:109 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLMovieCompatibilityConverter init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (int64_t)mediaType
{
  return 1;
}

- (int64_t)playableOnAllDevicesPreset
{
  if (self->mPlayableOnAllDevicesPreset) {
    return self->mPlayableOnAllDevicesPreset;
  }
  else {
    return 4;
  }
}

+ (id)progressStringForUpgradingMoviesWithPreset:(int64_t)a3 dataCount:(unint64_t)a4 filename:(id)a5
{
  id v7 = a5;
  switch(a3)
  {
    case 0:
      v8 = +[NSBundle mainBundle];
      if (a4 == 1)
      {
        CFStringRef v9 = @"Converting “%@”…";
        goto LABEL_19;
      }
      CFStringRef v13 = @"Converting %u movies";
      goto LABEL_26;
    case 1:
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014F1A80);
      }
      id v10 = off_10166B498;
      if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
        sub_1010A46D4(v10);
      }
      goto LABEL_8;
    case 2:
      v8 = +[NSBundle mainBundle];
      if (a4 == 1)
      {
        CFStringRef v9 = @"Converting “%@” to H.264 (1080p)…";
        goto LABEL_19;
      }
      CFStringRef v13 = @"Converting %u movies to H.264 (1080p)";
      goto LABEL_26;
    case 3:
      v8 = +[NSBundle mainBundle];
      if (a4 == 1)
      {
        CFStringRef v9 = @"Converting “%@” to H.264 (4K)…";
        goto LABEL_19;
      }
      CFStringRef v13 = @"Converting %u movies to H.264 (4K)";
      goto LABEL_26;
    case 4:
      v8 = +[NSBundle mainBundle];
      if (a4 == 1)
      {
        CFStringRef v9 = @"Converting “%@” to HEVC (1080p)…";
        goto LABEL_19;
      }
      CFStringRef v13 = @"Converting %u movies to HEVC (1080p)";
      goto LABEL_26;
    case 5:
      v8 = +[NSBundle mainBundle];
      if (a4 == 1)
      {
        CFStringRef v9 = @"Converting “%@” to HEVC (4K)…";
        goto LABEL_19;
      }
      CFStringRef v13 = @"Converting %u movies to HEVC (4K)";
      goto LABEL_26;
    case 6:
      v8 = +[NSBundle mainBundle];
      if (a4 == 1)
      {
        CFStringRef v9 = @"Converting “%@” to H.264 (Draft Quality / Smaller File)…";
LABEL_19:
        unsigned int v12 = [v8 localizedStringForKey:v9 value:0 table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v7);
      }
      else
      {
        CFStringRef v13 = @"Converting %u movies to H.264 (Draft Quality / Smaller File)";
LABEL_26:
        unsigned int v12 = [v8 localizedStringForKey:v13 value:0 table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, a4);
      }
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_28:
      return v11;
    default:
LABEL_8:
      v11 = &stru_101538650;
      goto LABEL_28;
  }
}

- (void)convertMediaWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = qword_1016A9810;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100370E38;
  v7[3] = &unk_1014D0AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)p_uniquePathForConvertingData:(id)a3 toType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v25 = 0;
  id v7 = [[CRLTemporaryDirectory alloc] initWithError:&v25];
  id v8 = v25;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1AE0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A47F4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1B00);
    }
    CFStringRef v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMovieCompatibilityConverter p_uniquePathForConvertingData:toType:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 210, 0, "invalid nil value for '%{public}s'", "temporaryDirectory");
  }
  unsigned int v12 = [(CRLTemporaryDirectory *)v7 path];
  CFStringRef v13 = +[NSURL crl_fileURLWithPath:v12];

  id v14 = [v13 URLByAppendingPathComponent:@"MovieCompatibilityConverter.XXXXXX"];
  char v27 = 0;
  id v15 = [v14 path];
  strncpy(__dst, (const char *)[v15 fileSystemRepresentation], 0x3FFuLL);

  char v27 = 0;
  v16 = +[NSString stringWithUTF8String:mkdtemp(__dst)];
  __int16 v17 = +[NSURL fileURLWithPath:v16 isDirectory:1];

  int v18 = +[UTType typeWithMIMEType:v5];

  v19 = [v18 preferredFilenameExtension];
  v20 = [v6 filename];

  v21 = [v20 stringByDeletingPathExtension];
  v22 = [v21 stringByAppendingPathExtension:v19];

  v23 = [v17 URLByAppendingPathComponent:v22];

  return v23;
}

- (void)p_convertMovieData:(id)a3 fromPlayableByAVFoundationToAllDevicesWithCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  sub_10026ACE0((id)[(CRLMovieCompatibilityConverter *)self playableOnAllDevicesPreset], 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(CRLMovieCompatibilityConverter *)self p_convertMovieData:v7 withPresetName:v8 completionHandler:v6];
}

- (void)p_convertMovieData:(id)a3 withPresetName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(void, void, void))v10;
  if (atomic_load((unsigned int *)&self->mIsCancelled))
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    if (qword_101719CF8 != -1) {
      dispatch_once(&qword_101719CF8, &stru_1014F1B20);
    }
    if (os_log_type_enabled((os_log_t)off_10166DC90, OS_LOG_TYPE_DEBUG)) {
      sub_1010A491C();
    }
    CFStringRef v13 = [v8 AVAssetAndReturnError:0];
    if (self->mExportSession)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F1B40);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A4888();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F1B60);
      }
      id v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter p_convertMovieData:withPresetName:completionHandler:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 265, 0, "expected nil value for '%{public}s'", "mExportSession");
    }
    __int16 v17 = objc_opt_class();
    int v18 = [UTTypeQuickTimeMovie identifier];
    v19 = [v17 p_uniquePathForConvertingData:v8 toType:v18];

    v20 = [(CRLMovieCompatibilityConverter *)self p_exportSessionForAsset:v13 presetName:v9 data:v8 outputURL:v19 preserveFrameDuration:self->mDesiredCompatibilityLevel < 4];
    mExportSession = self->mExportSession;
    self->mExportSession = v20;

    if (self->mExportSession)
    {
      [(CRLBasicProgress *)self->mAllDevicesProgress setValue:0.0];
      v22 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1016A9810);
      mAllDevicesProgressTimer = self->mAllDevicesProgressTimer;
      self->mAllDevicesProgressTimer = v22;

      v24 = self->mAllDevicesProgressTimer;
      dispatch_time_t v25 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v24, v25, 0x3B9ACA00uLL, 0x64uLL);
      v26 = self->mAllDevicesProgressTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100371BB0;
      handler[3] = &unk_1014CBBB0;
      handler[4] = self;
      dispatch_source_set_event_handler(v26, handler);
      dispatch_resume((dispatch_object_t)self->mAllDevicesProgressTimer);
      char v27 = self->mExportSession;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100371C10;
      v28[3] = &unk_1014F1CE0;
      v28[4] = self;
      v28[5] = v19;
      id v29 = v8;
      id v30 = v9;
      id v31 = v13;
      v32 = v11;
      [(AVAssetExportSession *)v27 exportAsynchronouslyWithCompletionHandler:v28];
    }
    else
    {
      ((void (**)(void, id, void))v11)[2](v11, v8, 0);
    }
  }
}

- (id)p_exportSessionForAsset:(id)a3 presetName:(id)a4 data:(id)a5 outputURL:(id)a6 preserveFrameDuration:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a6;
  v11 = +[AVAssetExportSession crl_exportSessionWithAsset:a3 presetName:a4 preserveFrameDuration:v7];
  unsigned int v12 = [UTTypeQuickTimeMovie identifier];
  [v11 setOutputFileType:v12];

  [v11 setOutputURL:v10];

  return v11;
}

- (void)p_finishConvertingWithConvertedMovieData:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (!atomic_load((unsigned int *)&self->mIsCancelled))
  {
    if (v8)
    {
      if (qword_101719CF8 != -1) {
        dispatch_once(&qword_101719CF8, &stru_1014F1D00);
      }
      if (os_log_type_enabled((os_log_t)off_10166DC90, OS_LOG_TYPE_DEBUG)) {
        sub_1010A4CDC();
      }
      unsigned int v12 = (_TtC8Freeform8CRLAsset *)v8;
      mConvertedMovieData = self->mConvertedMovieData;
      self->mConvertedMovieData = v12;
LABEL_8:

      goto LABEL_10;
    }
    if (!self->mError)
    {
      if (v9)
      {
        if (qword_101719CF8 != -1) {
          dispatch_once(&qword_101719CF8, &stru_1014F1D20);
        }
        if (os_log_type_enabled((os_log_t)off_10166DC90, OS_LOG_TYPE_DEBUG)) {
          sub_1010A4C74();
        }
        id v14 = (NSError *)[v9 copy];
        mConvertedMovieData = self->mError;
        self->mError = v14;
      }
      else
      {
        if (qword_101719CF8 != -1) {
          dispatch_once(&qword_101719CF8, &stru_1014F1D40);
        }
        if (os_log_type_enabled((os_log_t)off_10166DC90, OS_LOG_TYPE_DEBUG)) {
          sub_1010A4C0C();
        }
        id v21 = objc_alloc((Class)NSError);
        mConvertedMovieData = +[NSBundle mainBundle];
        id v15 = [mConvertedMovieData localizedStringForKey:@"This movie can’t be added." value:0 table:0];
        v16 = +[NSBundle mainBundle];
        __int16 v17 = [v16 localizedStringForKey:@"The file couldn’t be converted into a compatible format." value:0 table:0];
        int v18 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v15, NSLocalizedDescriptionKey, v17, NSLocalizedFailureReasonErrorKey, 0);
        v19 = (NSError *)[v21 initWithDomain:@"com.apple.freeform.CRLErrorDomainMediaCompatibility" code:100 userInfo:v18];
        mError = self->mError;
        self->mError = v19;
      }
      goto LABEL_8;
    }
  }
LABEL_10:
  if (v10) {
    v10[2](v10);
  }
}

- (void)cancel
{
  if (qword_101719CF8 != -1) {
    dispatch_once(&qword_101719CF8, &stru_1014F1D60);
  }
  if (os_log_type_enabled((os_log_t)off_10166DC90, OS_LOG_TYPE_DEBUG)) {
    sub_1010A4D44();
  }
  atomic_fetch_add(&self->mIsCancelled, 1u);
  Main = CFRunLoopGetMain();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100372C4C;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
  CFRunLoopWakeUp(Main);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100372D3C;
  v4[3] = &unk_1014CBBB0;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)qword_1016A9810, v4);
}

- (void)p_checkInitialCompatibilityLevelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (qword_101719CF8 != -1) {
    dispatch_once(&qword_101719CF8, &stru_1014F1D80);
  }
  if (os_log_type_enabled((os_log_t)off_10166DC90, OS_LOG_TYPE_DEBUG)) {
    sub_1010A4EF8();
  }
  if (self->mCompatibilityChecker)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1DA0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A4E64();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1DC0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter p_checkInitialCompatibilityLevelWithCompletionHandler:]");
    BOOL v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 402, 0, "expected nil value for '%{public}s'", "mCompatibilityChecker");
  }
  if (self->mInitialCompatibilityLevel)
  {
    int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1DE0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A4DAC((uint64_t)&self->mInitialCompatibilityLevel, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1E00);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityConverter p_checkInitialCompatibilityLevelWithCompletionHandler:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 403, 0, "mInitialCompatibilityLevel is %zd, not CRLMediaCompatibilityLevelUnknown", self->mInitialCompatibilityLevel);
  }
  unsigned int v12 = [[CRLMovieCompatibilityChecker alloc] initWithData:self->mMovieData];
  mCompatibilityChecker = self->mCompatibilityChecker;
  self->mCompatibilityChecker = v12;

  id v14 = self->mCompatibilityChecker;
  int64_t mDesiredCompatibilityLevel = self->mDesiredCompatibilityLevel;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100373248;
  v17[3] = &unk_1014D0AB0;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  [(CRLMovieCompatibilityChecker *)v14 checkCompatibilityUpToLevel:mDesiredCompatibilityLevel completionHandler:v17];
}

- (CRLProgress)progress
{
  return &self->mProgress->super;
}

- (_TtC8Freeform8CRLAsset)convertedMediaData
{
  return self->mConvertedMovieData;
}

- (NSError)error
{
  return self->mError;
}

- (void)setPlayableOnAllDevicesPreset:(int64_t)a3
{
  self->mPlayableOnAllDevicesPreset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mError, 0);
  objc_storeStrong((id *)&self->mConvertedMovieData, 0);
  objc_storeStrong((id *)&self->mBookmarkPreloadProgressObjects, 0);
  objc_storeStrong((id *)&self->mProgress, 0);
  objc_storeStrong((id *)&self->mAllDevicesProgressTimer, 0);
  objc_storeStrong((id *)&self->mAllDevicesProgress, 0);
  objc_storeStrong((id *)&self->mMakePlayableProgress, 0);
  objc_storeStrong((id *)&self->mAuxiliaryMovieDataBookmarkPreloadProgress, 0);
  objc_storeStrong((id *)&self->mMovieDataBookmarkPreloadProgress, 0);
  objc_storeStrong((id *)&self->mCompatibilityChecker, 0);
  objc_storeStrong((id *)&self->mExportSession, 0);
  objc_storeStrong((id *)&self->mAssetOwner, 0);
  objc_storeStrong((id *)&self->mAuxiliaryMovieDataFilename, 0);
  objc_storeStrong((id *)&self->mAuxiliaryMovieData, 0);

  objc_storeStrong((id *)&self->mMovieData, 0);
}

@end