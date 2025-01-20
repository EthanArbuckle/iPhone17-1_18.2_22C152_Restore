@interface PLVideoRemaker
+ (double)maximumDurationForTrimMode:(int)a3;
+ (int)getHDRemakerModeForMode:(int)a3;
+ (int)getSDRemakerModeForMode:(int)a3;
+ (int64_t)approximateByteSizeForMode:(int)a3 duration:(double)a4;
+ (int64_t)fileLengthLimitForRemakerMode:(int)a3;
- (BOOL)shouldExportToPhotoDataDirectory;
- (NSString)customAccessibilityLabel;
- (NSString)exportPreset;
- (NSString)exportPresetOverride;
- (PFVideoAVObjectBuilder)_videoAVObjectBuilder;
- (PLVideoRemaker)initWithAVAsset:(id)a3;
- (PLVideoRemaker)initWithManagedAsset:(id)a3 applyVideoAdjustments:(BOOL)a4;
- (PLVideoRemaker)initWithPublishingMedia:(id)a3;
- (PLVideoRemakerDelegate)delegate;
- (double)duration;
- (double)trimEndTime;
- (double)trimStartTime;
- (id)_fileFormatForURL:(id)a3;
- (id)_metadata;
- (id)messageForRemakingProgress;
- (id)progressHandler;
- (id)progressView;
- (int)mode;
- (void)_didEndRemakingWithTemporaryPath:(id)a3;
- (void)_exportCompletedWithSuccess:(BOOL)a3;
- (void)_removeProgressTimer;
- (void)_resetProgressTimer;
- (void)_updateProgress;
- (void)cancel;
- (void)dealloc;
- (void)remake;
- (void)setCustomAccessibilityLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setExportPresetOverride:(id)a3;
- (void)setMode:(int)a3;
- (void)setProgressHandler:(id)a3;
- (void)setShouldExportToPhotoDataDirectory:(BOOL)a3;
- (void)setTrimEndTime:(double)a3;
- (void)setTrimStartTime:(double)a3;
@end

@implementation PLVideoRemaker

- (void).cxx_destruct
{
}

- (PFVideoAVObjectBuilder)_videoAVObjectBuilder
{
  return self->__videoAVObjectBuilder;
}

- (void)setCustomAccessibilityLabel:(id)a3
{
}

- (NSString)customAccessibilityLabel
{
  return self->_customAccessibilityLabel;
}

- (void)setTrimEndTime:(double)a3
{
  self->_trimEndTime = a3;
}

- (double)trimEndTime
{
  return self->_trimEndTime;
}

- (void)setTrimStartTime:(double)a3
{
  self->_trimStartTime = a3;
}

- (double)trimStartTime
{
  return self->_trimStartTime;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setExportPresetOverride:(id)a3
{
}

- (NSString)exportPresetOverride
{
  return self->_exportPresetOverride;
}

- (void)setShouldExportToPhotoDataDirectory:(BOOL)a3
{
  self->_shouldExportToPhotoDataDirectory = a3;
}

- (BOOL)shouldExportToPhotoDataDirectory
{
  return self->_shouldExportToPhotoDataDirectory;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setDelegate:(id)a3
{
}

- (PLVideoRemakerDelegate)delegate
{
  return (PLVideoRemakerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)_exportCompletedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLVideoRemaker *)self _removeProgressTimer];
  [(PLProgressView *)self->_progressView removeFromSuperview];

  self->_progressView = 0;
  v5 = self;
  if (v3)
  {
    [(PLVideoRemaker *)self _didEndRemakingWithTemporaryPath:self->_trimmedPath];
  }
  else
  {
    [(PLVideoRemaker *)self _didEndRemakingWithTemporaryPath:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", self->_trimmedPath, 0);
  }

  self->_trimmedPath = 0;
  self->_exportSession = 0;
}

- (void)cancel
{
  if (self->_exportSession) {
    [(AVAssetExportSession *)self->_exportSession cancelExport];
  }
  else {
    [(PLVideoRemaker *)self _exportCompletedWithSuccess:0];
  }
}

- (void)_didEndRemakingWithTemporaryPath:(id)a3
{
  p_delegate = &self->_delegate;
  if (objc_loadWeak((id *)&self->_delegate))
  {
    objc_loadWeak((id *)p_delegate);
    if (objc_opt_respondsToSelector())
    {
      id Weak = objc_loadWeak((id *)p_delegate);
      [Weak videoRemakerDidEndRemaking:self temporaryPath:a3];
    }
  }
}

- (id)_fileFormatForURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "pathExtension"), "lowercaseString");
  if ([v4 length])
  {
    v32 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"mov", 0);
    uint64_t v30 = *MEMORY[0x1E4F15AB0];
    uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"m4a", @"m4p", @"m4b", @"m4r", 0);
    uint64_t v28 = *MEMORY[0x1E4F15A78];
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"m4v", 0);
    uint64_t v26 = *MEMORY[0x1E4F15A80];
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"mp4", @"aax", 0);
    uint64_t v24 = *MEMORY[0x1E4F15AA8];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"3gp", @"3gpp", 0);
    uint64_t v6 = *MEMORY[0x1E4F15A40];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"3g2", @"3gp2", 0);
    uint64_t v8 = *MEMORY[0x1E4F15A48];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"amr", 0);
    uint64_t v10 = *MEMORY[0x1E4F15A68];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"wav", 0);
    uint64_t v12 = *MEMORY[0x1E4F15AB8];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"aif", @"aiff", 0);
    v14 = objc_msgSend(v32, "dictionaryWithObjectsAndKeys:", v31, v30, v29, v28, v27, v26, v25, v24, v5, v6, v7, v8, v9, v10, v11, v12, v13,
                    *MEMORY[0x1E4F15A60],
                    0);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v15 = (void *)[v14 allKeys];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v18 = 0;
      uint64_t v19 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "objectForKey:", v21), "containsObject:", v4)) {
            v18 = v21;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v17);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (self->_mode == 3) {
      v22 = (id *)MEMORY[0x1E4F15A40];
    }
    else {
      v22 = (id *)MEMORY[0x1E4F15AB0];
    }
    return *v22;
  }
  return v18;
}

- (void)remake
{
  if (!self->_exportSession)
  {

    BOOL v3 = [(PLVideoRemaker *)self shouldExportToPhotoDataDirectory];
    self->_trimmedPath = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "tmpFileForVideoTranscodeToPhotoDataDirectory:withExtension:", v3, @"MOV");
    v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if ([v4 fileExistsAtPath:self->_trimmedPath]) {
      [v4 removeItemAtPath:self->_trimmedPath error:0];
    }
    uint64_t v5 = [(PLVideoRemaker *)self exportPreset];
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __24__PLVideoRemaker_remake__block_invoke;
    v20[3] = &unk_1E63D28B8;
    v20[4] = self;
    [(PFVideoAVObjectBuilder *)videoAVObjectBuilder requestExportSessionWithExportPreset:v5 resultHandler:v20];
    uint64_t v7 = +[PLVideoRemaker fileLengthLimitForRemakerMode:self->_mode];
    if (v7 >= 1) {
      [(AVAssetExportSession *)self->_exportSession setFileLengthLimit:v7];
    }
    uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_trimmedPath isDirectory:0];
    [(AVAssetExportSession *)self->_exportSession setOutputFileType:[(PLVideoRemaker *)self _fileFormatForURL:v8]];
    [(AVAssetExportSession *)self->_exportSession setOutputURL:v8];
    [(AVAssetExportSession *)self->_exportSession setMetadata:[(PLVideoRemaker *)self _metadata]];
    double trimStartTime = self->_trimStartTime;
    double trimEndTime = self->_trimEndTime;
    if (trimStartTime > 0.0 || trimEndTime > 0.0)
    {
      if (trimEndTime == 0.0) {
        double trimEndTime = self->_duration;
      }
      memset(&v19, 0, sizeof(v19));
      CMTimeMakeWithSeconds(&v19, trimStartTime, 600);
      memset(&v18, 0, sizeof(v18));
      CMTimeMakeWithSeconds(&v18, trimEndTime, 600);
      memset(&v17, 0, sizeof(v17));
      start.CMTimeRange start = v19;
      CMTime end = v18;
      CMTimeRangeFromTimeToTime(&v17, &start.start, &end);
      exportSession = self->_exportSession;
      CMTimeRange start = v17;
      [(AVAssetExportSession *)exportSession setTimeRange:&start];
    }
    self->_percentComplete = 0.0;
    v17.start.value = 0;
    *(void *)&v17.start.timescale = &v17;
    v17.start.epoch = 0x2020000000;
    LOBYTE(v17.duration.value) = 0;
    uint64_t v12 = self->_exportSession;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __24__PLVideoRemaker_remake__block_invoke_2;
    v13[3] = &unk_1E63D25F0;
    v13[5] = v8;
    v13[6] = &v17;
    BOOL v14 = v3;
    v13[4] = self;
    [(AVAssetExportSession *)v12 exportAsynchronouslyWithCompletionHandler:v13];
    if (!*(unsigned char *)(*(void *)&v17.start.timescale + 24))
    {
      if (objc_loadWeak((id *)&self->_delegate))
      {
        objc_loadWeak((id *)&self->_delegate);
        if (objc_opt_respondsToSelector()) {
          [objc_loadWeak((id *)&self->_delegate) videoRemakerDidBeginRemaking:self];
        }
      }
      [(PLVideoRemaker *)self _resetProgressTimer];
    }
    _Block_object_dispose(&v17, 8);
  }
}

id __24__PLVideoRemaker_remake__block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(a1 + 32) + 48) = result;
  return result;
}

uint64_t __24__PLVideoRemaker_remake__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) status];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (v2 & 0xFFFFFFFFFFFFFFFELL) == 4;
  if (v2 != 3)
  {
    Log = PLBackendGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) asset];
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 48) error];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_ERROR, "Video export failed for asset %@: %@", buf, 0x16u);
    }
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    int v6 = [MEMORY[0x1E4F8A6D8] markPurgeableForFileAtURL:*(void *)(a1 + 40) withUrgency:0 outInode:0];
    uint64_t v7 = PLBackendGetLog();
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v9;
        uint64_t v10 = "Marked temp file (%@) as purgeable.";
        uint64_t v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl(&dword_1BEE94000, v11, v12, v10, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v13;
      uint64_t v10 = "Unable to mark temp file (%@) purgeable.";
      uint64_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }
  return pl_dispatch_async();
}

uint64_t __24__PLVideoRemaker_remake__block_invoke_44(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exportCompletedWithSuccess:*(unsigned __int8 *)(a1 + 40)];
}

- (id)_metadata
{
  id result = (id)objc_msgSend((id)-[PFVideoAVObjectBuilder videoAsset](self->__videoAVObjectBuilder, "videoAsset"), "metadata");
  if (self->_customAccessibilityLabel)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F8CD88];
    return (id)objc_msgSend(v4, "addAccessibilityDescription:toAVMetadata:");
  }
  return result;
}

- (void)_updateProgress
{
  [(AVAssetExportSession *)self->_exportSession progress];
  self->_percentComplete = v3;
  -[PLProgressView setPercentComplete:](self->_progressView, "setPercentComplete:");
  if (objc_loadWeak((id *)&self->_delegate))
  {
    objc_loadWeak((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id Weak = objc_loadWeak((id *)&self->_delegate);
      *(float *)&double v6 = self->_percentComplete;
      [Weak videoRemaker:self progressDidChange:v6];
    }
  }
  id progressHandler = self->_progressHandler;
  if (progressHandler)
  {
    v4.n128_f64[0] = self->_percentComplete;
    uint64_t v8 = (void (*)(__n128))*((void *)progressHandler + 2);
    v8(v4);
  }
}

- (void)_removeProgressTimer
{
  self->_progressTimer = 0;
}

- (void)_resetProgressTimer
{
  if (!self->_progressTimer) {
    self->_progressTimer = (NSTimer *)(id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__updateProgress selector:0 userInfo:1 repeats:0.1];
  }
}

- (NSString)exportPreset
{
  id result = [(PLVideoRemaker *)self exportPresetOverride];
  if (!result)
  {
    int mode = self->_mode;
    return (NSString *)AVAssetExportPresetForRemakerMode(mode);
  }
  return result;
}

- (id)progressView
{
  progressView = self->_progressView;
  if (!progressView)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "bounds");
    uint64_t v5 = -[PLProgressView initWithFrame:]([PLProgressView alloc], "initWithFrame:", 0.0, 0.0, v4, 45.0);
    self->_progressView = v5;
    [(PLProgressView *)v5 setAutoresizingMask:2];
    progressView = self->_progressView;
  }
  [(PLProgressView *)progressView setLabelText:[(PLVideoRemaker *)self messageForRemakingProgress]];
  *(float *)&double v6 = self->_percentComplete;
  [(PLProgressView *)self->_progressView setPercentComplete:v6];
  return self->_progressView;
}

- (id)messageForRemakingProgress
{
  return (id)PLLocalizedFrameworkString();
}

- (void)dealloc
{
  [(PLProgressView *)self->_progressView removeFromSuperview];
  [(NSTimer *)self->_progressTimer invalidate];

  self->_progressTimer = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLVideoRemaker;
  [(PLVideoRemaker *)&v3 dealloc];
}

- (PLVideoRemaker)initWithManagedAsset:(id)a3 applyVideoAdjustments:(BOOL)a4
{
  BOOL v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLVideoRemaker;
  double v6 = [(PLVideoRemaker *)&v15 init];
  if (v6)
  {
    uint64_t v11 = 0;
    os_log_type_t v12 = (double *)&v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    [a3 duration];
    uint64_t v14 = v7;
    uint64_t v8 = (PFVideoAVObjectBuilder *)(id)[MEMORY[0x1E4F8ABF0] videoAVObjectBuilderForManagedAsset:a3 applyVideoAdjustments:v4];
    v6->__videoAVObjectBuilder = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__PLVideoRemaker_initWithManagedAsset_applyVideoAdjustments___block_invoke;
    v10[3] = &unk_1E63D2890;
    v10[4] = &v11;
    [(PFVideoAVObjectBuilder *)v8 requestAVAssetWithResultHandler:v10];
    [(PLVideoRemaker *)v6 setDuration:v12[3]];
    _Block_object_dispose(&v11, 8);
  }
  return v6;
}

void __61__PLVideoRemaker_initWithManagedAsset_applyVideoAdjustments___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a2) {
      [a2 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    *(Float64 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CMTimeGetSeconds(&time);
  }
}

- (PLVideoRemaker)initWithAVAsset:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLVideoRemaker;
  BOOL v4 = [(PLVideoRemaker *)&v6 init];
  if (v4) {
    v4->__videoAVObjectBuilder = (PFVideoAVObjectBuilder *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:a3 videoAdjustments:0];
  }
  return v4;
}

- (PLVideoRemaker)initWithPublishingMedia:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLVideoRemaker.m", 203, @"Invalid parameter not satisfying: %@", @"media");
  }
  uint64_t v5 = [a3 asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [(PLVideoRemaker *)self initWithAVAsset:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return [(PLVideoRemaker *)self initWithManagedAsset:v5 applyVideoAdjustments:1];
    }
    else
    {
      return self;
    }
  }
}

+ (int)getSDRemakerModeForMode:(int)a3
{
  return 4 * ((a3 & 0xFFFFFFFE) == 4);
}

+ (int)getHDRemakerModeForMode:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 4) {
    return 5;
  }
  else {
    return 0;
  }
}

+ (int64_t)approximateByteSizeForMode:(int)a3 duration:(double)a4
{
  uint64_t v5 = AVAssetExportPresetForRemakerMode(a3);
  objc_super v6 = (void *)MEMORY[0x1E4F16360];
  CMTimeMakeWithSeconds(&v8, a4, 60);
  return [v6 estimatedOutputFileLengthForPreset:v5 duration:&v8 properties:0];
}

+ (double)maximumDurationForTrimMode:(int)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double result = 3.40282347e38;
  switch(a3)
  {
    case 0:
    case 2:
      uint64_t v5 = objc_msgSend(a1, "fileLengthLimitForRemakerMode:", *(void *)&a3, 3.40282347e38);
      CMTime v8 = @"fileLengthLimit";
      v9[0] = [NSNumber numberWithLongLong:v5];
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      memset(&v7[32], 0, 24);
      [MEMORY[0x1E4F16360] maximumDurationForPreset:AVAssetExportPresetForRemakerMode(a3) properties:v6];
      *(CMTime *)uint64_t v7 = *(CMTime *)&v7[32];
      double result = CMTimeGetSeconds((CMTime *)v7);
      break;
    case 1:
    case 3:
      return result;
    case 4:
      double result = 900.0;
      break;
    default:
      double result = 600.0;
      break;
  }
  return result;
}

+ (int64_t)fileLengthLimitForRemakerMode:(int)a3
{
  if (a3 == 2) {
    return 15728640;
  }
  else {
    return 0;
  }
}

@end