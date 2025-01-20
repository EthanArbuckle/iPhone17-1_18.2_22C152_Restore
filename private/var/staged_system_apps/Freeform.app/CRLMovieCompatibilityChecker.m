@interface CRLMovieCompatibilityChecker
+ (BOOL)assetContainsH264VideoTracks:(id)a3;
+ (BOOL)assetContainsHEVCVideoTracks:(id)a3;
+ (BOOL)assetContainsProResVideoTracks:(id)a3;
+ (BOOL)assetContainsVideoTracksWithAlpha:(id)a3;
+ (BOOL)isPreset:(int64_t)a3 moreCompatibleThanAsset:(id)a4;
+ (BOOL)p_doesAsset:(id)a3 containTrackWithMediaType:(id)a4 matchingCodecTypes:(id)a5;
+ (BOOL)p_doesTrack:(id)a3 matchCodecTypes:(id)a4;
+ (BOOL)platformSupportsProRes;
+ (CGSize)maxPlayableVideoDimensionsForMediaCompatibilityConverterPreset:(int64_t)a3;
+ (id)p_defaultPlayableAudioCodecTypes;
+ (id)p_defaultPlayableVideoCodecTypes;
+ (id)videoCodecsForMediaCompatibilityConverterPreset:(int64_t)a3;
+ (int)maxPlayableAudioBitrateForMediaCompatibilityConverterPreset:(int64_t)a3;
+ (int)maxPlayableVideoPixelsPerFrameForMediaCompatibilityConverterPreset:(int64_t)a3;
- (BOOL)isCancelled;
- (BOOL)p_assetHasSupportedFileTypeOnAllDevices;
- (BOOL)p_doesLoadedAssetHaveHEVCTracks;
- (BOOL)p_doesLoadedAssetHaveProResTracks;
- (BOOL)p_isAudioTrackPlayableOnAllDevices:(id)a3;
- (BOOL)p_isH263VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3;
- (BOOL)p_isH264VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3;
- (BOOL)p_isLoadedAssetPlayableOnSupportedDevices;
- (BOOL)p_isMPEG4VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3;
- (BOOL)p_isSorenson3VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3;
- (BOOL)p_isVideoTrackPlayableOnSupportedDevices:(id)a3;
- (BOOL)wasAssetHEVC;
- (BOOL)wasAssetProRes;
- (BOOL)wasConverterPresetMoreCompatibleThanAsset;
- (CRLMovieCompatibilityChecker)init;
- (CRLMovieCompatibilityChecker)initWithData:(id)a3;
- (CRLMovieCompatibilityChecker)initWithData:(id)a3 asset:(id)a4;
- (NSError)error;
- (float)p_estimatedAudioAssetDataRate;
- (float)p_estimatedAudioAssetDataRateUsingFileSize;
- (float)p_estimatedDataRateForAudioTrack:(id)a3;
- (float)p_estimatedDataRateUsingFormatDescriptionForAudioTrack:(id)a3;
- (float)p_estimatedDataRateUsingTrackPropertiesForAudioTrack:(id)a3;
- (id)p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:(opaqueCMFormatDescription *)a3 forAtomType:(id)a4;
- (int64_t)compatibilityLevel;
- (void)cancel;
- (void)checkCompatibilityUpToLevel:(int64_t)a3 completionHandler:(id)a4;
- (void)checkCustomCompatibilityWithConverterPreset:(int64_t)a3 completionHandler:(id)a4;
- (void)checkCustomCompatibilityWithVideoCodecTypes:(id)a3 maxPlayableVideoDimensions:(CGSize)a4 maxPlayableVideoPixelsPerFrame:(int)a5 completionHandler:(id)a6;
- (void)p_checkCompatibilityOfAVAssetUpToLevel:(int64_t)a3 completionHandler:(id)a4;
- (void)p_checkCustomCompatibilityWithVideoCodecTypes:(id)a3 maxPlayableVideoDimensions:(CGSize)a4 maxPlayableVideoPixelsPerFrame:(int)a5 maxAudioBitRate:(int)a6 completionHandler:(id)a7;
- (void)p_didFinishCheckingCompatibilityUpToLevel:(int64_t)a3 actualLevel:(int64_t)a4 error:(id)a5 completionHandler:(id)a6;
@end

@implementation CRLMovieCompatibilityChecker

- (CRLMovieCompatibilityChecker)initWithData:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E68B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101092C34();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E68D0);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker initWithData:asset:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 46, 0, "invalid nil value for '%{public}s'", "data");
  }
  v17.receiver = self;
  v17.super_class = (Class)CRLMovieCompatibilityChecker;
  v12 = [(CRLMovieCompatibilityChecker *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v14 = [v7 type];
    v15 = [v14 identifier];
    v13->_movieIsAnimatedImage = +[CRLAnimatedGIFController canInitWithDataType:v15];

    if (!v13->_movieIsAnimatedImage)
    {
      if (!v8)
      {
        id v8 = [v7 AVAssetAndReturnError:0];
      }
      objc_storeStrong((id *)&v13->_asset, v8);
    }
  }

  return v13;
}

- (CRLMovieCompatibilityChecker)initWithData:(id)a3
{
  return [(CRLMovieCompatibilityChecker *)self initWithData:a3 asset:0];
}

- (CRLMovieCompatibilityChecker)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E68F0);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLMovieCompatibilityChecker init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m";
    __int16 v17 = 1024;
    int v18 = 71;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E6910);
  }
  v4 = off_10166B4A0;
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
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker init]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:71 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLMovieCompatibilityChecker init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)checkCompatibilityUpToLevel:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (a3 <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6930);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101092CD0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6950);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 75, 0, "Invalid parameter not satisfying: %{public}s", "maxDesiredCompatibilityLevel > CRLMediaCompatibilityLevelNone");
  }
  if (self->_movieIsAnimatedImage)
  {
    id v10 = self;
    int64_t v11 = a3;
    uint64_t v12 = 5;
LABEL_17:
    [(CRLMovieCompatibilityChecker *)v10 p_didFinishCheckingCompatibilityUpToLevel:v11 actualLevel:v12 error:0 completionHandler:v6];
    goto LABEL_18;
  }
  if ([(CRLAsset *)self->_data needsDownload] || !self->_asset)
  {
    id v10 = self;
    int64_t v11 = a3;
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  [(CRLMovieCompatibilityChecker *)self p_checkCompatibilityOfAVAssetUpToLevel:a3 completionHandler:v6];
LABEL_18:
}

- (void)p_checkCompatibilityOfAVAssetUpToLevel:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[AVAsset crl_playableKeysWithKeys:&off_10155CCE0];
  asset = self->_asset;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100274DA4;
  v10[3] = &unk_1014CFF70;
  id v11 = v6;
  int64_t v12 = a3;
  v10[4] = self;
  id v9 = v6;
  [(AVAsset *)asset loadValuesAsynchronouslyForKeys:v7 completionHandler:v10];
}

- (void)checkCustomCompatibilityWithVideoCodecTypes:(id)a3 maxPlayableVideoDimensions:(CGSize)a4 maxPlayableVideoPixelsPerFrame:(int)a5 completionHandler:(id)a6
{
}

- (void)p_checkCustomCompatibilityWithVideoCodecTypes:(id)a3 maxPlayableVideoDimensions:(CGSize)a4 maxPlayableVideoPixelsPerFrame:(int)a5 maxAudioBitRate:(int)a6 completionHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v15 = a7;
  __int16 v13 = (NSSet *)[a3 copy];
  customPlayableVideoCodecTypes = self->_customPlayableVideoCodecTypes;
  self->_customPlayableVideoCodecTypes = v13;

  self->_customMaxPlayableVideoDimensions.double width = (int)width;
  self->_customMaxPlayableVideoDimensions.double height = (int)height;
  self->_customMaxPlayableVideoPixelsPerFrame = a5;
  self->_customMaxAudioBitRate = a6;
  [(CRLMovieCompatibilityChecker *)self checkCompatibilityUpToLevel:6 completionHandler:v15];
}

- (void)checkCustomCompatibilityWithConverterPreset:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  if ((unint64_t)a3 > 1)
  {
    id v10 = objc_opt_class();
    id v11 = [v10 videoCodecsForMediaCompatibilityConverterPreset:a3];
    [v10 maxPlayableVideoDimensionsForMediaCompatibilityConverterPreset:a3];
    double v13 = v12;
    double v15 = v14;
    id v16 = [v10 maxPlayableVideoPixelsPerFrameForMediaCompatibilityConverterPreset:a3];
    id v17 = [v10 maxPlayableAudioBitrateForMediaCompatibilityConverterPreset:a3];
    self->_wasConverterPresetMoreCompatibleThanAsset = +[CRLMovieCompatibilityChecker isPreset:a3 moreCompatibleThanAsset:self->_asset];
    -[CRLMovieCompatibilityChecker p_checkCustomCompatibilityWithVideoCodecTypes:maxPlayableVideoDimensions:maxPlayableVideoPixelsPerFrame:maxAudioBitRate:completionHandler:](self, "p_checkCustomCompatibilityWithVideoCodecTypes:maxPlayableVideoDimensions:maxPlayableVideoPixelsPerFrame:maxAudioBitRate:completionHandler:", v11, v16, v17, v6, v13, v15);
  }
  else
  {
    if (!a3)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6AD8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101093028();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6AF8);
      }
      id v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker checkCustomCompatibilityWithConverterPreset:completionHandler:]");
      id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:273 isFatal:0 description:"Invalid preset"];
    }
    self->_compatibilityLevel = 4;
    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)p_didFinishCheckingCompatibilityUpToLevel:(int64_t)a3 actualLevel:(int64_t)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  if (![(CRLMovieCompatibilityChecker *)self isCancelled])
  {
    if (a4 || !v10)
    {
      if (a4 || v10)
      {
LABEL_11:
        if (a4 >= a3) {
          int64_t v17 = a3;
        }
        else {
          int64_t v17 = a4;
        }
        self->_compatibilityLevel = v17;
        int v18 = (NSError *)[v10 copy];
        error = self->_error;
        self->_error = v18;

        goto LABEL_15;
      }
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      double v14 = +[NSBundle mainBundle];
      double v15 = [v14 localizedStringForKey:@"This movie can’t be added." value:0 table:0];
      v21 = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

      id v10 = +[NSError errorWithDomain:@"com.apple.freeform.CRLErrorDomainMediaCompatibility" code:100 userInfo:v16];
    }
    else if ([v10 code] == (id)-11828)
    {
      double v12 = [v10 domain];
      unsigned int v13 = [v12 isEqualToString:AVFoundationErrorDomain];

      if (v13)
      {

        id v10 = 0;
        a4 = 1;
        goto LABEL_11;
      }
    }
    a4 = 0;
    goto LABEL_11;
  }
LABEL_15:
  if (v11) {
    v11[2](v11);
  }
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

+ (BOOL)p_doesTrack:(id)a3 matchCodecTypes:(id)a4
{
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  [a3 formatDescriptions];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = +[NSNumber numberWithUnsignedInt:CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((void *)&v13 + 1) + 8 * i))];
        unsigned __int8 v11 = [v5 containsObject:v10];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

+ (BOOL)p_doesAsset:(id)a3 containTrackWithMediaType:(id)a4 matchingCodecTypes:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [a3 tracks];
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v15 isEnabled])
        {
          long long v16 = [v15 mediaType];
          if ([v16 isEqualToString:v8])
          {
            unsigned __int8 v17 = [a1 p_doesTrack:v15 matchCodecTypes:v9];

            if (v17)
            {
              BOOL v18 = 1;
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

+ (BOOL)assetContainsHEVCVideoTracks:(id)a3
{
  return [a1 p_doesAsset:a3 containTrackWithMediaType:AVMediaTypeVideo matchingCodecTypes:&off_10155CD28];
}

+ (BOOL)assetContainsVideoTracksWithAlpha:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [a3 tracks];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) hasMediaCharacteristic:AVMediaCharacteristicContainsAlphaChannel])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

+ (BOOL)assetContainsH264VideoTracks:(id)a3
{
  return [a1 p_doesAsset:a3 containTrackWithMediaType:AVMediaTypeVideo matchingCodecTypes:&off_10155CD40];
}

+ (BOOL)assetContainsProResVideoTracks:(id)a3
{
  id v4 = a3;
  id v5 = +[AVAsset crl_codecTypesForProRes];
  LOBYTE(a1) = [a1 p_doesAsset:v4 containTrackWithMediaType:AVMediaTypeVideo matchingCodecTypes:v5];

  return (char)a1;
}

+ (BOOL)isPreset:(int64_t)a3 moreCompatibleThanAsset:(id)a4
{
  id v6 = a4;
  if (!objc_msgSend(v6, "crl_containsVideoTracks")) {
    goto LABEL_8;
  }
  if (!sub_10026AE4C(a3))
  {
    if (sub_10026AE64(a3))
    {
      if (([a1 assetContainsH264VideoTracks:v6] & 1) == 0)
      {
        unsigned __int8 v7 = [a1 assetContainsHEVCVideoTracks:v6];
        goto LABEL_7;
      }
LABEL_9:
      LOBYTE(v8) = 0;
      goto LABEL_11;
    }
LABEL_8:
    if ((unint64_t)a3 >= 2)
    {
      id v9 = [a1 p_defaultPlayableAudioCodecTypes];
      unsigned int v8 = [a1 p_doesAsset:v6 containTrackWithMediaType:AVMediaTypeAudio matchingCodecTypes:v9] ^ 1;

      goto LABEL_11;
    }
    goto LABEL_9;
  }
  unsigned __int8 v7 = [a1 assetContainsH264VideoTracks:v6];
LABEL_7:
  LOBYTE(v8) = v7 ^ 1;
LABEL_11:

  return v8;
}

+ (BOOL)platformSupportsProRes
{
  return 1;
}

+ (id)videoCodecsForMediaCompatibilityConverterPreset:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
  {
    if (sub_10026AE64(a3)) {
      id v4 = &off_10155D9A0;
    }
    else {
      id v4 = &off_10155D9B8;
    }
    v3 = +[NSSet setWithObject:v4];
  }
  else
  {
    v3 = +[NSSet set];
  }

  return v3;
}

+ (CGSize)maxPlayableVideoDimensionsForMediaCompatibilityConverterPreset:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    double width = 568.0;
    double height = 568.0;
  }
  else if (((1 << a3) & 3) != 0)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    double height = 1920.0;
    if (((1 << a3) & 0x14) != 0) {
      double width = 1920.0;
    }
    else {
      double width = 3840.0;
    }
    if (((1 << a3) & 0x14) == 0) {
      double height = 3840.0;
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

+ (int)maxPlayableVideoPixelsPerFrameForMediaCompatibilityConverterPreset:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4) {
    return 0;
  }
  else {
    return dword_1011771E0[a3 - 2];
  }
}

+ (int)maxPlayableAudioBitrateForMediaCompatibilityConverterPreset:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4) {
    return 0;
  }
  else {
    return dword_1011771F4[a3 - 2];
  }
}

- (BOOL)p_doesLoadedAssetHaveHEVCTracks
{
  if ([(AVAsset *)self->_asset statusOfValueForKey:@"tracks" error:0] != (id)2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6B18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010930B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6B38);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker p_doesLoadedAssetHaveHEVCTracks]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:518 isFatal:0 description:"Asset tracks must be loaded"];
  }
  return [(id)objc_opt_class() assetContainsHEVCVideoTracks:self->_asset];
}

- (BOOL)p_doesLoadedAssetHaveProResTracks
{
  if ([(AVAsset *)self->_asset statusOfValueForKey:@"tracks" error:0] != (id)2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6B58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093138();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6B78);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker p_doesLoadedAssetHaveProResTracks]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:524 isFatal:0 description:"Asset tracks must be loaded"];
  }
  return [(id)objc_opt_class() assetContainsProResVideoTracks:self->_asset];
}

- (BOOL)p_isLoadedAssetPlayableOnSupportedDevices
{
  if ([(CRLMovieCompatibilityChecker *)self p_assetHasSupportedFileTypeOnAllDevices])
  {
    if ([(AVAsset *)self->_asset statusOfValueForKey:@"tracks" error:0] != (id)2)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6B98);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010931C0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6BB8);
      }
      v3 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v3);
      }
      id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieCompatibilityChecker p_isLoadedAssetPlayableOnSupportedDevices]");
      id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMovieCompatibilityChecker.m"];
      +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:540 isFatal:0 description:"Asset tracks must be loaded"];
    }
    id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", AVMediaTypeAudio, AVMediaTypeClosedCaption, AVMediaTypeSubtitle, 0);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v28 = self;
    unsigned __int8 v7 = [(AVAsset *)self->_asset tracks];
    id v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v27 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v31;
      v29 = v7;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v7);
          }
          long long v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v14 isEnabled])
          {
            long long v15 = [v14 mediaType];
            if ([v6 containsObject:v15])
            {
              long long v16 = v6;
              if (![v14 isSelfContained]) {
                goto LABEL_31;
              }
              [v14 formatDescriptions];
              uint64_t v17 = v10;
              v19 = uint64_t v18 = v11;
              id v20 = [v19 count];

              uint64_t v11 = v18;
              uint64_t v10 = v17;
              if (!v20)
              {
LABEL_31:

                int v21 = 0;
                int v23 = v27;
                int v22 = HIDWORD(v27);
                id v6 = v16;
                unsigned __int8 v7 = v29;
                goto LABEL_33;
              }
              if ([v15 isEqualToString:AVMediaTypeVideo])
              {
                uint64_t v10 = [(CRLMovieCompatibilityChecker *)v28 p_isVideoTrackPlayableOnSupportedDevices:v14] | v17;
                LODWORD(v27) = 1;
              }
              else if ([v15 isEqualToString:AVMediaTypeAudio])
              {
                HIDWORD(v27) |= [(CRLMovieCompatibilityChecker *)v28 p_isAudioTrackPlayableOnAllDevices:v14];
                uint64_t v11 = 1;
              }
              id v6 = v16;
              unsigned __int8 v7 = v29;
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      int v21 = 1;
      int v23 = v27;
      int v22 = HIDWORD(v27);
    }
    else
    {
      int v23 = 0;
      LODWORD(v10) = 0;
      LODWORD(v11) = 0;
      int v22 = 0;
      int v21 = 1;
    }
LABEL_33:

    int v24 = v21 & (v10 | v23 ^ 1) & (v22 | v11 ^ 1);
    if (v24 == 1 && (v22 & 1) != 0 && (v23 & 1) == 0 && v28->_customMaxAudioBitRate >= 1)
    {
      [(CRLMovieCompatibilityChecker *)v28 p_estimatedAudioAssetDataRate];
      LOBYTE(v24) = v25 <= (float)v28->_customMaxAudioBitRate;
    }
  }
  else
  {
    LOBYTE(v24) = 0;
  }
  return v24;
}

- (BOOL)p_assetHasSupportedFileTypeOnAllDevices
{
  uint64_t v3 = objc_opt_class();
  id v4 = sub_1002469D0(v3, self->_asset);
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 URL];
    if ([v6 isFileURL]
      && (v17[0] = 0,
          [v6 getResourceValue:v17 forKey:NSURLTypeIdentifierKey error:0]))
    {
      id v16 = v17[0];
      unsigned __int8 v7 = [UTTypeAppleProtectedMPEG4Audio identifier];
      id v8 = [UTTypeMP3 identifier];
      id v9 = [UTTypeMPEG identifier];
      +[NSSet setWithObjects:](NSSet, "setWithObjects:", AVFileTypeQuickTimeMovie, AVFileTypeMPEG4, AVFileTypeAppleM4V, AVFileTypeAppleM4A, @"public.3gpp", @"public.3gpp2", @"com.apple.itunes.audible", v7, AVFileTypeAIFF, AVFileTypeAIFC, AVFileTypeCoreAudioFormat, AVFileTypeWAVE, @"public.au-audio", v8, AVFileTypeAMR, v9, @"public.mpeg-2-video",
        @"public.mp2",
        @"public.mpeg-2-transport-stream",
        @"public.avi",
      uint64_t v10 = 0);

      unsigned __int8 v11 = [v10 containsObject:v16];
      if (v11)
      {
        unsigned __int8 v12 = 1;
      }
      else
      {
        long long v13 = [v6 pathExtension];
        long long v14 = +[NSSet setWithObjects:@"mqv", @"m4r", @"m1a", @"m2a", @"mpa", @"aac", @"adts", @"mod", @"vob", @"m2ts", @"m2t", @"mts", 0];
        unsigned __int8 v12 = [v14 containsObject:v13];
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

+ (id)p_defaultPlayableVideoCodecTypes
{
  return &off_10155CD58;
}

+ (id)p_defaultPlayableAudioCodecTypes
{
  return &off_10155CD70;
}

- (BOOL)p_isVideoTrackPlayableOnSupportedDevices:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "p_doesTrack:matchCodecTypes:", v4, &off_10155CD88)
    && ([v4 nominalFrameRate], v5 <= 30.0))
  {
    char v23 = 1;
  }
  else
  {
    if ([(NSSet *)self->_customPlayableVideoCodecTypes count])
    {
      v28 = self->_customPlayableVideoCodecTypes;
    }
    else
    {
      id v6 = [objc_opt_class() p_defaultPlayableVideoCodecTypes];
      v28 = +[NSSet setWithArray:v6];
    }
    int32_t width = 1920;
    if (self->_customMaxPlayableVideoDimensions.width < 1)
    {
      int32_t v27 = 1920;
    }
    else
    {
      int height = self->_customMaxPlayableVideoDimensions.height;
      BOOL v9 = height <= 0;
      if (height <= 0) {
        int height = 1920;
      }
      int32_t v27 = height;
      if (v9) {
        int32_t width = 1920;
      }
      else {
        int32_t width = self->_customMaxPlayableVideoDimensions.width;
      }
    }
    if (self->_customMaxPlayableVideoPixelsPerFrame <= 0) {
      int customMaxPlayableVideoPixelsPerFrame = 2073600;
    }
    else {
      int customMaxPlayableVideoPixelsPerFrame = self->_customMaxPlayableVideoPixelsPerFrame;
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = [v4 formatDescriptions];
    id v11 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v36;
      id v25 = v4;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(const opaqueCMFormatDescription **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v15);
          uint64_t v17 = +[NSNumber numberWithUnsignedInt:MediaSubType];
          unsigned int v18 = [(NSSet *)v28 containsObject:v17];

          if (!v18
            || ((CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v15), v27 >= Dimensions.height)
              ? (BOOL v20 = width < Dimensions.width)
              : (BOOL v20 = 1),
                !v20 ? (int v21 = 0) : (int v21 = 1),
                (v21 & 1) != 0
             || ((Dimensions.height * Dimensions.width > customMaxPlayableVideoPixelsPerFrame) & ~v21) != 0))
          {
LABEL_48:

            BOOL v22 = 1;
            id v4 = v25;
            goto LABEL_51;
          }
          if ((int)MediaSubType > 1748121138)
          {
            if (MediaSubType == 1748121139)
            {
              if (![(CRLMovieCompatibilityChecker *)self p_isH263VideoFormatPlayableOnAllDevices:v15])goto LABEL_48; {
            }
              }
            else if (MediaSubType == 1836070006 {
                   && ![(CRLMovieCompatibilityChecker *)self p_isMPEG4VideoFormatPlayableOnAllDevices:v15])
            }
            {
              goto LABEL_48;
            }
          }
          else if (MediaSubType == 1398165811)
          {
            if (![(CRLMovieCompatibilityChecker *)self p_isSorenson3VideoFormatPlayableOnAllDevices:v15])goto LABEL_48; {
          }
            }
          else if (MediaSubType == 1635148593 {
                 && ![(CRLMovieCompatibilityChecker *)self p_isH264VideoFormatPlayableOnAllDevices:v15])
          }
          {
            goto LABEL_48;
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        id v4 = v25;
        if (v12) {
          continue;
        }
        break;
      }
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    if (v4) {
      [v4 preferredTransform];
    }
    long long v29 = v32;
    long long v30 = v33;
    long long v31 = v34;
    if (sub_10007F964((double *)&v29))
    {
      long long v29 = v32;
      long long v30 = v33;
      long long v31 = v34;
      BOOL v22 = sub_10007F7EC((double *)&v29);
    }
    else
    {
      BOOL v22 = 1;
    }
LABEL_51:
    char v23 = !v22;
  }
  return v23;
}

- (BOOL)p_isSorenson3VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  return Dimensions.height * Dimensions.width < 76801;
}

- (BOOL)p_isH264VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  id v4 = [(CRLMovieCompatibilityChecker *)self p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:a3 forAtomType:@"avcC"];
  id v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if ((unint64_t)[v4 length] < 4) {
    goto LABEL_10;
  }
  id v5 = v5;
  id v6 = (unsigned __int8 *)[v5 bytes];
  if (v6[3] > 0x29u) {
    goto LABEL_10;
  }
  unsigned int v7 = v6[1] - 66;
  BOOL v8 = v7 > 0x22;
  uint64_t v9 = (1 << v7) & 0x400000801;
  BOOL v10 = v8 || v9 == 0;
  if (!v10
    && (v5,
        CMFormatDescriptionGetExtension(a3, kCVImageBufferFieldCountKey),
        id v11 = objc_claimAutoreleasedReturnValue(),
        (id v5 = v11) != 0))
  {
    BOOL v12 = [v11 integerValue] != (id)1;
  }
  else
  {
LABEL_10:
    BOOL v12 = 1;
  }

  return !v12;
}

- (BOOL)p_isMPEG4VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  uint64_t v3 = [(CRLMovieCompatibilityChecker *)self p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:a3 forAtomType:@"esds"];
  id v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  id v5 = v3;
  id v6 = [v5 bytes];
  id v7 = [v5 length];
  if ((unint64_t)v7 < 5) {
    goto LABEL_9;
  }
  uint64_t v8 = 0;
  while (v6[v8] || v6[v8 + 1] || v6[v8 + 2] != 1 || v6[v8 + 3] != 176)
  {
    if (++v8 + 4 >= (unint64_t)v7) {
      goto LABEL_9;
    }
  }
  if (v8 + 4 < (unint64_t)v7)
  {
    unint64_t v11 = 0;
    int v12 = v6[v8 + 4];
    uint64_t v13 = &byte_1011771B0;
    while (1)
    {
      int v14 = *v13;
      v13 += 3;
      if (v14 == v12) {
        break;
      }
      BOOL v9 = 0;
      if (++v11 == 15) {
        goto LABEL_10;
      }
    }
    BOOL v9 = v11 < 0xB;
  }
  else
  {
LABEL_9:
    BOOL v9 = 0;
  }
LABEL_10:

  return v9;
}

- (BOOL)p_isH263VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  uint64_t v3 = [(CRLMovieCompatibilityChecker *)self p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:a3 forAtomType:@"d263"];
  id v4 = v3;
  if (v3 && (unint64_t)[v3 length] >= 7)
  {
    id v5 = [v4 bytes];
    if (v5[6]) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v5[5] >= 0x2Eu;
    }
    BOOL v7 = !v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)p_sampleDescriptionExtensionAto_dataFromVideoFormatDescription:(opaqueCMFormatDescription *)a3 forAtomType:(id)a4
{
  id v5 = a4;
  BOOL v6 = CMFormatDescriptionGetExtension(a3, kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms);
  BOOL v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if ([v9 count])
      {
        id v10 = [v9 objectAtIndexedSubscript:0];
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v8;
      }
      else {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)p_isAudioTrackPlayableOnAllDevices:(id)a3
{
  id v3 = a3;
  id v4 = [objc_opt_class() p_defaultPlayableAudioCodecTypes];
  id v5 = +[NSSet setWithArray:v4];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v20 = v3;
  BOOL v6 = [v3 formatDescriptions];
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    unsigned __int8 v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      unint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(const opaqueCMFormatDescription **)(*((void *)&v21 + 1) + 8 * (void)v11);
        uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v12);
        if ((v9 & 1) == 0
          && (int v14 = MediaSubType,
              +[NSNumber numberWithUnsignedInt:MediaSubType],
              long long v15 = objc_claimAutoreleasedReturnValue(),
              unsigned int v16 = [v5 containsObject:v15],
              v15,
              v16)
          && (StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v12)) != 0
          && StreamBasicDescription->mChannelsPerFrame <= 6
          && StreamBasicDescription->mSampleRate <= 48000.0)
        {
          if (v14 == 1885430579 || v14 == 1633889587) {
            unsigned __int8 v9 = [v20 isEnabled:StreamBasicDescription->mSampleRate];
          }
          else {
            unsigned __int8 v9 = 0;
          }
        }
        else
        {
          unsigned __int8 v9 = 1;
        }
        unint64_t v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v18 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v8 = v18;
    }
    while (v18);
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9 ^ 1;
}

- (float)p_estimatedAudioAssetDataRate
{
  id v3 = [(AVAsset *)self->_asset tracksWithMediaType:AVMediaTypeAudio];
  if (![v3 count])
  {
    float v8 = 0.0;
    goto LABEL_27;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    float v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * i) estimatedDataRate];
        if (v8 < v10) {
          float v8 = v10;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);

    if (v8 != 0.0) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  [(CRLMovieCompatibilityChecker *)self p_estimatedAudioAssetDataRateUsingFileSize];
  float v8 = v11;
LABEL_16:
  if (v8 == 0.0)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          -[CRLMovieCompatibilityChecker p_estimatedDataRateForAudioTrack:](self, "p_estimatedDataRateForAudioTrack:", *(void *)(*((void *)&v19 + 1) + 8 * (void)j), (void)v19);
          if (v8 < v17) {
            float v8 = v17;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
LABEL_27:

  return v8;
}

- (float)p_estimatedAudioAssetDataRateUsingFileSize
{
  uint64_t v3 = objc_opt_class();
  id v4 = sub_1002469D0(v3, self->_asset);
  id v5 = [v4 URL];

  id v6 = [v5 crl_fileSize];
  memset(&v12[1], 0, sizeof(CMTime));
  float v7 = 0.0;
  asset = self->_asset;
  if (asset)
  {
    [(AVAsset *)asset duration];
    if ((v12[1].flags & 0x1D) == 1)
    {
      uint64_t v9 = 8 * (void)v6;
      v12[0] = v12[1];
      double Seconds = CMTimeGetSeconds(v12);
      if (v9)
      {
        if (Seconds > 0.0) {
          float v7 = (double)(unint64_t)v9 / Seconds;
        }
      }
    }
  }

  return v7;
}

- (float)p_estimatedDataRateForAudioTrack:(id)a3
{
  id v4 = a3;
  [v4 estimatedDataRate];
  if (v5 == 0.0) {
    [(CRLMovieCompatibilityChecker *)self p_estimatedDataRateUsingTrackPropertiesForAudioTrack:v4];
  }
  float v6 = v5;
  if (v5 == 0.0)
  {
    [(CRLMovieCompatibilityChecker *)self p_estimatedDataRateUsingFormatDescriptionForAudioTrack:v4];
    float v6 = v7;
  }

  return v6;
}

- (float)p_estimatedDataRateUsingTrackPropertiesForAudioTrack:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (uint64_t)[v3 totalSampleDataLength];
  memset(&v10, 0, sizeof(v10));
  float v5 = [v3 asset];

  if (v5) {
    [v5 duration];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }

  float v6 = 0.0;
  if (v4 >= 1 && (v10.flags & 0x1D) == 1)
  {
    CMTime v9 = v10;
    double Seconds = CMTimeGetSeconds(&v9);
    if (Seconds > 0.0) {
      return (double)v4 * 8.0 / Seconds;
    }
  }
  return v6;
}

- (float)p_estimatedDataRateUsingFormatDescriptionForAudioTrack:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [a3 formatDescriptions];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    float v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(*((void *)&v15 + 1) + 8 * i));
        if (StreamBasicDescription)
        {
          double v11 = 1.0;
          if ((StreamBasicDescription->mFormatFlags & 0x20) == 0)
          {
            LODWORD(v11) = StreamBasicDescription->mChannelsPerFrame;
            double v11 = (double)*(unint64_t *)&v11;
          }
          float v12 = v11;
          LODWORD(v10) = StreamBasicDescription->mBytesPerFrame;
          float v13 = StreamBasicDescription->mSampleRate * 8.0 * (double)v10 * v12;
          if (v7 < v13) {
            float v7 = v13;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
  }

  return v7;
}

- (int64_t)compatibilityLevel
{
  return self->_compatibilityLevel;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)wasAssetHEVC
{
  return self->_wasAssetHEVC;
}

- (BOOL)wasAssetProRes
{
  return self->_wasAssetProRes;
}

- (BOOL)wasConverterPresetMoreCompatibleThanAsset
{
  return self->_wasConverterPresetMoreCompatibleThanAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customPlayableVideoCodecTypes, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end