@interface CRLMovieItemImporter
+ (BOOL)p_canAnimate:(CGImageSource *)a3;
+ (BOOL)p_canImportImageSource:(CGImageSource *)a3;
+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4;
+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4;
+ (id)protected_supportedAnimatedImageFileTypes;
+ (id)protected_supportedFileTypes;
+ (id)protected_supportedFileUTTypes;
+ (void)p_setMovieProperties:(id)a3 fromLoadedAsset:(id)a4 containsVideoTrack:(BOOL)a5;
- (BOOL)p_isURLRemote;
- (BOOL)p_validateSizeOfImportWithBoardItem:(id)a3 error:(id *)a4;
- (CRLMovieItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4;
- (CRLMovieItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4;
- (id)boardItem;
- (id)error;
- (id)p_importErrorForLackOfAVTracks;
- (id)p_makeMovieItemWithContainsVisibleTrack:(BOOL)a3 andIsURLRemote:(BOOL)a4;
- (id)progress;
- (unint64_t)embeddedDataLength;
- (unint64_t)p_onlyMovieFileDataLength;
- (unint64_t)uploadDataLength;
- (void)cancel;
- (void)importBoardItemWithCompletionHandler:(id)a3;
- (void)p_asynchronouslyGeneratePosterImagesAndFinishImportingMovieItem:(id)a3;
- (void)p_createAssetDataAndThenContinueImport;
- (void)p_enableLoopingIfNeeded:(id)a3;
- (void)p_finishImportingWithBoardItem:(id)a3 error:(id)a4;
- (void)p_importBoardItemFromAnimatedGIF;
- (void)p_importBoardItemFromAsset;
- (void)p_importBoardItemFromAssetConvertingIfNeededToRequiredCompatibilityLevel:(int64_t)a3 allowHEVCContent:(BOOL)a4 fromCompatibilityLevel:(int64_t)a5;
- (void)p_performMovieCompatibilityAnalysis;
- (void)p_removeShadowIfNeeded:(id)a3;
- (void)p_setPropertiesFromLoadedAssetToMovie:(id)a3 containsVideoTrack:(BOOL)a4;
- (void)p_tellMovieCompatibilityProviderToIgnoreCompatibilityLevelIfNeeded;
@end

@implementation CRLMovieItemImporter

+ (id)protected_supportedFileTypes
{
  return +[CRLIngestionTypes supportedMovieTypes];
}

+ (id)protected_supportedFileUTTypes
{
  return +[CRLIngestionTypes supportedMovieUTTypes];
}

+ (id)protected_supportedAnimatedImageFileTypes
{
  return +[CRLIngestionTypes supportedMovieAnimatedImageTypes];
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  id v6 = a4;
  CFURLRef v7 = (const __CFURL *)a3;
  if ([a1 isSupportedAnimatedImageFileType:v6])
  {
    CGImageSourceRef v8 = CGImageSourceCreateWithURL(v7, 0);

    if (v8)
    {
      if (+[PFImageMetadata imageSourceIsSpatial:v8])unsigned __int8 v9 = 0; {
      else
      }
        unsigned __int8 v9 = [a1 p_canImportImageSource:v8];
      CFRelease(v8);
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___CRLMovieItemImporter;
    unsigned __int8 v9 = [super protected_canImportFileAtURL:v7 type:v6];
  }
  return v9;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([a1 isSupportedAnimatedImageFileType:v6])
  {
    id v8 = [v7 newCGImageSource];

    if (v8)
    {
      if (+[PFImageMetadata imageSourceIsSpatial:v8])unsigned __int8 v9 = 0; {
      else
      }
        unsigned __int8 v9 = [a1 p_canImportImageSource:v8];
      CFRelease(v8);
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___CRLMovieItemImporter;
    unsigned __int8 v9 = [v11 protected_canImportFileWithPreinsertionAsset:v7 type:v6];
  }
  return v9;
}

+ (BOOL)p_canImportImageSource:(CGImageSource *)a3
{
  return CGImageSourceGetCount(a3) > 1;
}

+ (BOOL)p_canAnimate:(CGImageSource *)a3
{
  if (!a3) {
    return 1;
  }
  CFDictionaryRef v3 = CGImageSourceCopyProperties(a3, 0);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"CanAnimate"];
  v5 = v4;
  if (v4) {
    BOOL v6 = [v4 intValue] != 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (CRLMovieItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLMovieItemImporter;
  v4 = [(CRLBoardItemImporter *)&v7 initWithURL:a3 boardItemFactory:a4];
  v5 = v4;
  if (v4) {
    sub_1002E4500(v4);
  }
  return v5;
}

- (CRLMovieItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLMovieItemImporter;
  v4 = [(CRLBoardItemImporter *)&v7 initWithData:a3 boardItemFactory:a4];
  v5 = v4;
  if (v4) {
    sub_1002E4500(v4);
  }
  return v5;
}

- (BOOL)p_isURLRemote
{
  v2 = [(CRLBoardItemImporter *)self URL];
  CFDictionaryRef v3 = v2;
  if (v2) {
    unsigned int v4 = [v2 isFileURL] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v4;

  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E46E0;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(importQueue, block);
}

- (void)p_createAssetDataAndThenContinueImport
{
  CFDictionaryRef v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v3);
  }

  if (!self->_isCancelled)
  {
    id v4 = [(CRLBoardItemImporter *)self URL];
    v5 = v4;
    if (v4)
    {
      BOOL v6 = [v4 lastPathComponent];
      objc_super v7 = [v6 pathExtension];
      id v8 = [v7 length];

      if (!v8)
      {
        id v24 = 0;
        unsigned int v9 = [v5 getResourceValue:&v24 forKey:NSURLTypeIdentifierKey error:0];
        id v10 = v24;
        objc_super v11 = v10;
        if (v9 && v10)
        {
          v12 = +[UTType typeWithIdentifier:v10];
          if (!v12)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014EB600);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_10109AC68();
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014EB620);
            }
            v13 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_10106590C(v13);
            }
            v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_createAssetDataAndThenContinueImport]");
            v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 185, 0, "invalid nil value for '%{public}s'", "extensionUTType");
          }
          v16 = [v12 preferredFilenameExtension];
          if ([v16 length])
          {
            uint64_t v17 = [v6 stringByAppendingPathExtension:v16];

            BOOL v6 = (void *)v17;
          }
        }
      }
      v18 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
      v19 = [(CRLBoardItemImporter *)self boardItemFactory];
      v20 = [v19 assetOwner];
      v21 = [(CRLPreinsertionAssetWrapper *)v18 initWithUrl:v5 filename:v6 owner:v20];

      if (!v21) {
        goto LABEL_31;
      }
    }
    else
    {
      v22 = [(CRLBoardItemImporter *)self preinsertionAsset];

      if (!v22
        || ([(CRLBoardItemImporter *)self preinsertionAsset],
            (v21 = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_31:
        [(CRLMovieItemImporter *)self p_performMovieCompatibilityAnalysis];
        goto LABEL_32;
      }
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1002E4B20;
    v23[3] = &unk_1014EB668;
    v23[4] = self;
    [(CRLPreinsertionAssetWrapper *)v21 createAssetWithCompletionHandler:v23];

LABEL_32:
    return;
  }

  [(CRLMovieItemImporter *)self p_finishImportingWithBoardItem:0 error:0];
}

- (void)p_performMovieCompatibilityAnalysis
{
  CFDictionaryRef v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v3);
  }

  if (!self->_isCancelled && ![(CRLMovieItemImporter *)self p_isURLRemote] && self->_movieData)
  {
    id v4 = objc_opt_class();
    v5 = [(CRLAsset *)self->_movieData type];
    BOOL v6 = [v5 identifier];
    LODWORD(v4) = [v4 isSupportedAnimatedImageFileType:v6];

    if (v4)
    {
      [(CRLMovieItemImporter *)self p_importBoardItemFromAnimatedGIF];
    }
    else
    {
      objc_super v7 = [[CRLMovieCompatibilityChecker alloc] initWithData:self->_movieData asset:self->_asset];
      compatibilityChecker = self->_compatibilityChecker;
      self->_compatibilityChecker = v7;

      uint64_t v9 = [(CRLBoardItemImporter *)self delegate];
      id v10 = (void *)v9;
      if (v9) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = 3;
      }
      if (v9) {
        uint64_t v12 = 5;
      }
      else {
        uint64_t v12 = 3;
      }
      v13 = self->_compatibilityChecker;
      if (!v13)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EB688);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109ADB4();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EB6A8);
        }
        v14 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v14);
        }
        v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_performMovieCompatibilityAnalysis]");
        v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 246, 0, "invalid nil value for '%{public}s'", "self->_compatibilityChecker");

        v13 = self->_compatibilityChecker;
      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1002E506C;
      v18[3] = &unk_1014CD770;
      v18[4] = self;
      id v19 = v10;
      uint64_t v20 = v11;
      id v17 = v10;
      [(CRLMovieCompatibilityChecker *)v13 checkCompatibilityUpToLevel:v12 completionHandler:v18];
    }
  }
  if (!self->_asset && !self->_boardItem || self->_isCancelled) {
    [(CRLMovieItemImporter *)self p_finishImportingWithBoardItem:0 error:0];
  }
}

- (void)p_importBoardItemFromAssetConvertingIfNeededToRequiredCompatibilityLevel:(int64_t)a3 allowHEVCContent:(BOOL)a4 fromCompatibilityLevel:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v9 = self->_importQueue;
  if (v9 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v9);
  }

  if (self->_isCancelled)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB718);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109AE48();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB738);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_importBoardItemFromAssetConvertingIfNeededToRequiredCompatibilityLevel:allowHEVCContent:fromCompatibilityLevel:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:342 isFatal:0 description:"This method must not be called if the importer has been canceled."];
  }
  if (a5 >= a3)
  {
    v23 = [[CRLBasicProgress alloc] initWithMaxValue:1.0];
    [(CRLScaledProgress *)self->_progress setMaxValue:1.0];
    [(CRLScaledProgress *)self->_progress setProgress:v23];
    [(CRLMovieItemImporter *)self p_importBoardItemFromAsset];
  }
  else
  {
    v13 = [CRLMovieCompatibilityConverter alloc];
    movieData = self->_movieData;
    v15 = [(CRLBoardItemImporter *)self boardItemFactory];
    v16 = [v15 assetOwner];
    id v17 = [(CRLMovieCompatibilityConverter *)v13 initWithMovieData:movieData desiredCompatibilityLevel:a3 initialCompatibilityLevel:a5 assetOwner:v16];
    compatibilityConverter = self->_compatibilityConverter;
    self->_compatibilityConverter = v17;

    if (a3 == 4 && v6)
    {
      id v19 = +[CRLCapabilities currentCapabilities];
      unsigned int v20 = [v19 hasHEVCHardwareEncoding];

      if (v20) {
        [(CRLMovieCompatibilityConverter *)self->_compatibilityConverter setPlayableOnAllDevicesPreset:5];
      }
    }
    [(CRLScaledProgress *)self->_progress setMaxValue:100.0];
    v21 = [(CRLMovieCompatibilityConverter *)self->_compatibilityConverter progress];
    [(CRLScaledProgress *)self->_progress setProgress:v21];

    v22 = self->_compatibilityConverter;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1002E57EC;
    v24[3] = &unk_1014CBBB0;
    v24[4] = self;
    [(CRLMovieCompatibilityConverter *)v22 convertMediaWithCompletionHandler:v24];
  }
}

- (id)p_importErrorForLackOfAVTracks
{
  v10[0] = NSLocalizedDescriptionKey;
  CFDictionaryRef v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"The movie doesn’t contain audio or video." value:0 table:0];
  v10[1] = @"CRLBoardItemImporterErrorMediaTypeKey";
  v11[0] = v4;
  v11[1] = &off_10155DC88;
  v5 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v6 = [v5 mutableCopy];
  objc_super v7 = [(CRLBoardItemImporter *)self URL];
  if (v7) {
    [v6 setObject:v7 forKeyedSubscript:NSURLErrorKey];
  }
  id v8 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:101 userInfo:v6];

  return v8;
}

- (id)p_makeMovieItemWithContainsVisibleTrack:(BOOL)a3 andIsURLRemote:(BOOL)a4
{
  if (a3)
  {
    [(AVAsset *)self->_asset naturalSizeWithPreferredTransforms];
    +[CRLMovieItem defaultVideoItemSizeWithOriginalSize:](_TtC8Freeform12CRLMovieItem, "defaultVideoItemSizeWithOriginalSize:");
  }
  else
  {
    +[CRLMovieItem defaultAudioItemSize];
  }
  id v8 = -[CRLCanvasInfoGeometry initWithSize:]([CRLCanvasInfoGeometry alloc], "initWithSize:", v6, v7);
  if (a4)
  {
    uint64_t v9 = 0;
  }
  else
  {
    if (!self->_movieData)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB758);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109AEDC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB778);
      }
      id v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v10);
      }
      uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_makeMovieItemWithContainsVisibleTrack:andIsURLRemote:]");
      uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 449, 0, "invalid nil value for '%{public}s'", "self->_movieData");
    }
    v13 = [(CRLBoardItemImporter *)self boardItemFactory];
    uint64_t v9 = [v13 makeMovieItemWithGeometry:v8 movieData:self->_movieData posterImageData:0 posterTime:0.0];

    [(CRLMovieItemImporter *)self p_removeShadowIfNeeded:v9];
  }

  return v9;
}

- (void)p_setPropertiesFromLoadedAssetToMovie:(id)a3 containsVideoTrack:(BOOL)a4
{
}

- (void)p_enableLoopingIfNeeded:(id)a3
{
  id v3 = a3;
  if ([v3 isAnimatedImage]) {
    [v3 setIsLooping:1];
  }
}

- (void)p_removeShadowIfNeeded:(id)a3
{
  id v6 = a3;
  id v4 = [(AVAsset *)self->_asset tracksWithMediaCharacteristic:AVMediaCharacteristicContainsAlphaChannel];
  id v5 = [v4 count];
  if (([v6 isAnimatedImage] & 1) != 0 || v5) {
    [v6 setShadow:0];
  }
}

+ (void)p_setMovieProperties:(id)a3 fromLoadedAsset:(id)a4 containsVideoTrack:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 metadata];
  id v10 = +[AVAsset crl_titleWithMetadataArray:v9];
  if (v10) {
    goto LABEL_3;
  }
  uint64_t v11 = [v7 movieAssetPayload];
  uint64_t v12 = [v11 filename];
  id v10 = [v12 stringByDeletingPathExtension];

  if (v10)
  {
LABEL_3:
    [v7 setTitle:v10];
  }
  v13 = +[AVAsset crl_creatorArtistOrAuthorWithMetadataArray:v9];
  [v7 setCreator:v13];

  v14 = [v7 creator];

  if (!v14)
  {
    v15 = [v7 movieAssetPayload];
    v16 = [v15 type];

    id v17 = [v16 localizedDescription];
    [v7 setCreator:v17];
  }
  memset(&v23[1], 0, sizeof(CMTime));
  if (!v8 || ([v8 duration], (v23[1].flags & 1) == 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB798);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109AF70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB7B8);
    }
    v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    id v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMovieItemImporter p_setMovieProperties:fromLoadedAsset:containsVideoTrack:]");
    unsigned int v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 502, 0, "invalid duration received from avAsset on load, preventing us from setting up start and end time properly based on it.");
  }
  v23[0] = v23[1];
  double Seconds = CMTimeGetSeconds(v23);
  [v7 setStartTime:0.0];
  [v7 setEndTime:Seconds];
  if (a5) {
    id v22 = 0;
  }
  else {
    id v22 = [v8 crl_containsTracksWithVisualCharacteristics];
  }
  [v7 setIsAudioOnly:v22];
}

- (void)p_asynchronouslyGeneratePosterImagesAndFinishImportingMovieItem:(id)a3
{
  id v4 = a3;
  [v4 posterTime];
  Float64 v6 = v5;
  id v7 = [[CRLMoviePosterImageGenerator alloc] initWithAsset:self->_asset];
  posterImageGenerator = self->_posterImageGenerator;
  self->_posterImageGenerator = v7;

  uint64_t v9 = self->_posterImageGenerator;
  CMTimeMakeWithSeconds(&v13, v6, +[CRLCommonConstants timeScale]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1002E62EC;
  v11[3] = &unk_1014EB898;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(CRLMoviePosterImageGenerator *)v9 generateCGImageAsynchronouslyForTime:&v13 completionHandler:v11];
}

- (void)p_importBoardItemFromAsset
{
  id v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v3);
  }

  asset = self->_asset;
  double v5 = &off_10155CE60;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](asset, "loadValuesAsynchronouslyForKeys:completionHandler:", _NSConcreteStackBlock, 3221225472, sub_1002E68F8, &unk_1014CBE78, self);
}

- (void)p_importBoardItemFromAnimatedGIF
{
  uint64_t v3 = objc_opt_class();
  id v4 = +[CRLImageProviderPool sharedPool];
  double v5 = [v4 temporaryProviderForAsset:self->_movieData shouldValidate:1];
  Float64 v6 = sub_1002469D0(v3, v5);

  if (v6)
  {
    id v7 = [CRLCanvasInfoGeometry alloc];
    [v6 naturalSize];
    id v8 = -[CRLCanvasInfoGeometry initWithSize:](v7, "initWithSize:");
    uint64_t v9 = [(CRLBoardItemImporter *)self boardItemFactory];
    v45 = v8;
    id v10 = [v9 makeMovieItemWithGeometry:v8 movieData:self->_movieData posterImageData:0 posterTime:0.0];

    id v12 = [[CRLAnimatedGIFController alloc] initWithData:self->_movieData delegate:0];
    v46 = v6;
    if (v12)
    {
      CMTime v13 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
      [v10 startTime];
      v14 = sub_10047EC98(-[CRLAnimatedGIFController imageForTime:](v12, "imageForTime:"));
      v15 = [(CRLBoardItemImporter *)self boardItemFactory];
      v16 = [v15 assetOwner];
      id v49 = 0;
      id v17 = [(CRLPreinsertionAssetWrapper *)v13 initWithData:v14 filename:@"posterImage.png" owner:v16 error:&v49];
      id v18 = v49;

      v44 = v17;
      if (!v17)
      {
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014EB8F8);
        }
        id v19 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
          sub_10109B004(v19, v18);
        }
      }
      [(CRLAnimatedGIFController *)v12 absoluteDuration];
      [v10 setEndTime:];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB8B8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109B180();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB8D8);
      }
      v25 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v25);
      }
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieItemImporter p_importBoardItemFromAnimatedGIF]");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieItemImporter.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v26, 646, 0, "invalid nil value for '%{public}s'", "controller");

      v44 = 0;
    }

    v27 = [(CRLAsset *)self->_movieData newCGImageSource];
    size_t Count = CGImageSourceGetCount(v27);
    if (Count)
    {
      size_t v29 = Count;
      for (size_t i = 0; i < v29; ++i)
      {
        CFDictionaryRef v31 = CGImageSourceCopyPropertiesAtIndex(v27, i, 0);
        CFDictionaryRef v32 = v31;
        if (v31)
        {
          v33 = [(__CFDictionary *)v31 objectForKeyedSubscript:kCGImagePropertyGIFDictionary];
          if (v33)
          {
            v34 = v33;
            v35 = [v33 objectForKeyedSubscript:kCGImagePropertyGIFLoopCount];
            if (v35)
            {
              v36 = v35;
              id v37 = [v35 integerValue];

              if (v37 == (id)1) {
                break;
              }
              continue;
            }
          }
        }
      }
    }
    if (v27) {
      CFRelease(v27);
    }
    v38 = [v10 movieAssetPayload];
    v39 = [v38 filename];
    v40 = [v39 stringByDeletingPathExtension];
    [v10 setTitle:v40];

    v41 = [v10 movieAssetPayload];
    v42 = [v41 type];

    v43 = [v42 localizedDescription];
    [v10 setCreator:v43];

    [(CRLMovieItemImporter *)self p_removeShadowIfNeeded:v10];
    [(CRLMovieItemImporter *)self p_enableLoopingIfNeeded:v10];
    Float64 v6 = v46;
    v23 = v44;
    if (v44)
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1002E72E4;
      v47[3] = &unk_1014EB848;
      v47[4] = self;
      id v10 = v10;
      id v48 = v10;
      [(CRLPreinsertionAssetWrapper *)v44 createAssetWithCompletionHandler:v47];
    }
    else
    {
      [(CRLMovieItemImporter *)self p_finishImportingWithBoardItem:v10 error:0];
    }
    id v22 = v45;
  }
  else
  {
    v50[0] = NSLocalizedDescriptionKey;
    unsigned int v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"The movie doesn’t contain audio or video." value:0 table:0];
    v50[1] = @"CRLBoardItemImporterErrorMediaTypeKey";
    v51[0] = v21;
    v51[1] = &off_10155DC88;
    id v22 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];

    id v10 = [v22 mutableCopy];
    v23 = [(CRLBoardItemImporter *)self URL];
    if (v23) {
      [v10 setObject:v23 forKeyedSubscript:NSURLErrorKey];
    }
    id v24 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:101 userInfo:v10];
    [(CRLMovieItemImporter *)self p_finishImportingWithBoardItem:0 error:v24];
  }
}

- (void)p_tellMovieCompatibilityProviderToIgnoreCompatibilityLevelIfNeeded
{
  uint64_t v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v3);
  }

  if (!self->_didMessageDelegateAboutMovieCompatibility)
  {
    self->_didMessageDelegateAboutMovieCompatibility = 1;
    uint64_t v4 = [(CRLBoardItemImporter *)self delegate];
    if (v4)
    {
      double v5 = (void *)v4;
      if (objc_opt_respondsToSelector()) {
        [v5 boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:self];
      }
    }
    _objc_release_x2();
  }
}

- (BOOL)p_validateSizeOfImportWithBoardItem:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (void)p_finishImportingWithBoardItem:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self->_importQueue;
  if (v9 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v9);
  }

  [(CRLMovieItemImporter *)self p_tellMovieCompatibilityProviderToIgnoreCompatibilityLevelIfNeeded];
  if (!self->_isCancelled)
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(CRLScaledProgress *)self->_progress progress];
    id v12 = sub_1002469D0(v10, v11);

    if (v12)
    {
      [v12 maxValue];
      [v12 setValue:];
    }
    if (v7)
    {
      p_boardItem = &self->_boardItem;
      objc_storeStrong((id *)&self->_boardItem, a3);
      v14 = (objc_class *)objc_opt_class();
      v15 = sub_10024715C(v14, v7);
      [v15 setPosterImageData:self->_posterImageData];
      id v42 = 0;
      unsigned __int8 v16 = [(CRLMovieItemImporter *)self p_validateSizeOfImportWithBoardItem:v15 error:&v42];
      id v17 = v42;
      id v18 = v42;
      if (v16)
      {
LABEL_27:

        goto LABEL_28;
      }
      objc_storeStrong((id *)&self->_error, v17);
      id v19 = *p_boardItem;
      *p_boardItem = 0;
    }
    else
    {
      unsigned int v20 = [(CRLBoardItemImporter *)self URL];
      v15 = v20;
      if (v20)
      {
        id v41 = 0;
        [v20 getResourceValue:&v41 forKey:NSURLLocalizedNameKey error:0];
        id v21 = v41;
        if (!v21)
        {
          id v21 = [v15 lastPathComponent];
        }
        id v22 = +[NSBundle mainBundle];
        v23 = [v22 localizedStringForKey:@"The movie “%@” couldn’t be inserted." value:0 table:0];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v21);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v21 = +[NSBundle mainBundle];
        id v18 = [v21 localizedStringForKey:@"The movie couldn’t be inserted." value:0 table:0];
      }

      if (v8)
      {
        id v24 = [v8 userInfo];
        id v19 = [v24 mutableCopy];

        if (v15) {
          [v19 setObject:v15 forKeyedSubscript:NSURLErrorKey];
        }
        id v25 = [v19 objectForKeyedSubscript:NSLocalizedDescriptionKey];
        if (!v25
          || ([v19 setObject:v25 forKeyedSubscript:NSLocalizedFailureReasonErrorKey],
              [v8 domain],
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue(),
              v26,
              v26 != @"com.apple.freeform.CRLErrorDomainInfoImporter"))
        {
          [v19 setObject:v18 forKeyedSubscript:NSLocalizedDescriptionKey];
        }
        id v27 = objc_alloc((Class)NSError);
        v28 = [v8 domain];
        uint64_t v29 = (uint64_t)[v8 code];
        id v30 = v27;
        CFStringRef v31 = v28;
        id v32 = v19;
      }
      else
      {
        v43[0] = NSLocalizedDescriptionKey;
        v43[1] = @"CRLBoardItemImporterErrorMediaTypeKey";
        v44[0] = v18;
        v44[1] = &off_10155DC88;
        id v19 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
        id v25 = [v19 mutableCopy];
        v28 = [(CRLBoardItemImporter *)self URL];
        if (v28) {
          [v25 setObject:v28 forKeyedSubscript:NSURLErrorKey];
        }
        id v30 = objc_alloc((Class)NSError);
        CFStringRef v31 = @"com.apple.freeform.CRLErrorDomainInfoImporter";
        uint64_t v29 = 100;
        id v32 = v25;
      }
      v33 = (NSError *)[v30 initWithDomain:v31 code:v29 userInfo:v32];
      error = self->_error;
      self->_error = v33;
    }
    goto LABEL_27;
  }
LABEL_28:
  movieData = self->_movieData;
  self->_movieData = 0;

  readonlyMovieData = self->_readonlyMovieData;
  self->_readonlyMovieData = 0;

  asset = self->_asset;
  self->_asset = 0;

  posterImageGenerator = self->_posterImageGenerator;
  self->_posterImageGenerator = 0;

  id completionHandler = (void (**)(void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2]();
    id v40 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (void)cancel
{
  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E7B24;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(importQueue, block);
}

- (unint64_t)uploadDataLength
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = sub_1002469D0(v3, self->_boardItem);
  double v5 = [v4 movieAssetPayload];
  id v6 = [v5 length];

  return (unint64_t)v6;
}

- (unint64_t)embeddedDataLength
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = sub_1002469D0(v3, self->_boardItem);
  double v5 = [v4 posterImageAssetPayload];
  id v6 = (char *)[v5 length];

  id v7 = [v4 movieAssetPayload];
  id v8 = &v6[(void)[v7 length]];

  return (unint64_t)v8;
}

- (unint64_t)p_onlyMovieFileDataLength
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = sub_1002469D0(v3, self->_boardItem);
  double v5 = [v4 movieAssetPayload];
  id v6 = [v5 length];

  return (unint64_t)v6;
}

- (id)progress
{
  return self->_progress;
}

- (id)boardItem
{
  return self->_boardItem;
}

- (id)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_boardItem, 0);
  objc_storeStrong((id *)&self->_posterImageGenerator, 0);
  objc_storeStrong((id *)&self->_compatibilityConverter, 0);
  objc_storeStrong((id *)&self->_compatibilityChecker, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_readonlyMovieData, 0);
  objc_storeStrong((id *)&self->_posterImageData, 0);
  objc_storeStrong((id *)&self->_movieData, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_importQueue, 0);
}

@end