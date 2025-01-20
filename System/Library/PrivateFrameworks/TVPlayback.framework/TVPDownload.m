@interface TVPDownload
+ (void)initialize;
- (AVAssetDownloadTask)downloadTask;
- (BOOL)_anyDelegateRespondsToProcessFinishedDownload;
- (BOOL)addedMediaItemLoaderStateObserver;
- (BOOL)addedProgressObserver;
- (BOOL)allowCellularUsage;
- (BOOL)allowMultichannelAudio;
- (BOOL)includeDefaultAudioOption;
- (BOOL)includeDeviceLanguageAudio;
- (BOOL)includeOriginalAudio;
- (BOOL)includesAllSubtitles;
- (BOOL)limitMultichannelAudioToSingleLanguage;
- (BOOL)performKeyFetchOnly;
- (BOOL)prefer3DOrImmersiveDownload;
- (BOOL)preferMostCompatibleRendition;
- (NSArray)preferredAudioLanguageCodes;
- (NSArray)preferredSubtitleLanguageCodes;
- (NSData)storageSettingsImageData;
- (NSDictionary)userInfo;
- (NSError)error;
- (NSError)startError;
- (NSNumber)maximumAverageBitrateForAVC;
- (NSNumber)maximumAverageBitrateForHDR;
- (NSNumber)maximumAverageBitrateForHDR3D;
- (NSNumber)maximumAverageBitrateForHDR3D48FPS;
- (NSNumber)maximumAverageBitrateForImmersive;
- (NSNumber)maximumAverageBitrateForSDR3D;
- (NSNumber)maximumAverageBitrateForSDR3D48FPS;
- (NSNumber)maximumAverageBitrateForSDRHEVC;
- (NSNumber)maximumPresentationWidth;
- (NSNumber)maximumPresentationWidthFor3D;
- (NSNumber)maximumPresentationWidthForImmersive;
- (NSPointerArray)delegates;
- (TVPDownload)initWithMediaItem:(id)a3 downloadSession:(id)a4 existingDownloadTask:(id)a5;
- (TVPDownloadSession)downloadSession;
- (TVPMediaItem)mediaItem;
- (TVPMediaItemLoader)mediaItemLoader;
- (TVPReportingSession)reportingSession;
- (TVPStateMachine)stateMachine;
- (double)lastDownloadProgressFractionCompleted;
- (double)progress;
- (id)_variantQualifiersForCurrentSettingsAndAudioOption:(id)a3 useMultichannelAudio:(BOOL)a4;
- (id)descriptionForState:(int64_t)a3;
- (int64_t)state;
- (unint64_t)downloadInitiationBackgroundTask;
- (unint64_t)downloadTerminationBackgroundTask;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadVariants:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_addMediaSelectionOptionsIfNotAlreadyAdded:(id)a3 toMediaSelections:(id)a4 forMediaSelectionGroup:(id)a5 baseMediaSelection:(id)a6;
- (void)_downloadProgressDidChange;
- (void)_mediaItemLoaderStateDidChangeTo:(id)a3;
- (void)_processFinishedDownloadWithCompletion:(id)a3;
- (void)_registerStateMachineHandlers;
- (void)addDelegate:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)failWithError:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeDelegate:(id)a3;
- (void)setAddedMediaItemLoaderStateObserver:(BOOL)a3;
- (void)setAddedProgressObserver:(BOOL)a3;
- (void)setAllowCellularUsage:(BOOL)a3;
- (void)setAllowMultichannelAudio:(BOOL)a3;
- (void)setDelegates:(id)a3;
- (void)setDownloadInitiationBackgroundTask:(unint64_t)a3;
- (void)setDownloadSession:(id)a3;
- (void)setDownloadTask:(id)a3;
- (void)setDownloadTerminationBackgroundTask:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setIncludeDefaultAudioOption:(BOOL)a3;
- (void)setIncludeDeviceLanguageAudio:(BOOL)a3;
- (void)setIncludeOriginalAudio:(BOOL)a3;
- (void)setIncludesAllSubtitles:(BOOL)a3;
- (void)setLastDownloadProgressFractionCompleted:(double)a3;
- (void)setLimitMultichannelAudioToSingleLanguage:(BOOL)a3;
- (void)setMaximumAverageBitrateForAVC:(id)a3;
- (void)setMaximumAverageBitrateForHDR3D48FPS:(id)a3;
- (void)setMaximumAverageBitrateForHDR3D:(id)a3;
- (void)setMaximumAverageBitrateForHDR:(id)a3;
- (void)setMaximumAverageBitrateForImmersive:(id)a3;
- (void)setMaximumAverageBitrateForSDR3D48FPS:(id)a3;
- (void)setMaximumAverageBitrateForSDR3D:(id)a3;
- (void)setMaximumAverageBitrateForSDRHEVC:(id)a3;
- (void)setMaximumPresentationWidth:(id)a3;
- (void)setMaximumPresentationWidthFor3D:(id)a3;
- (void)setMaximumPresentationWidthForImmersive:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setMediaItemLoader:(id)a3;
- (void)setPerformKeyFetchOnly:(BOOL)a3;
- (void)setPrefer3DOrImmersiveDownload:(BOOL)a3;
- (void)setPreferMostCompatibleRendition:(BOOL)a3;
- (void)setPreferredAudioLanguageCodes:(id)a3;
- (void)setPreferredSubtitleLanguageCodes:(id)a3;
- (void)setReportingSession:(id)a3;
- (void)setStartError:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateMachine:(id)a3;
- (void)setStorageSettingsImageData:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)start;
@end

@implementation TVPDownload

+ (void)initialize
{
  if (initialize_onceToken_3 != -1) {
    dispatch_once(&initialize_onceToken_3, &__block_literal_global_8);
  }
}

uint64_t __25__TVPDownload_initialize__block_invoke()
{
  sLogObject_2 = (uint64_t)os_log_create("com.apple.AppleTV.playback", "TVPDownload");
  return MEMORY[0x270F9A758]();
}

- (TVPDownload)initWithMediaItem:(id)a3 downloadSession:(id)a4 existingDownloadTask:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)TVPDownload;
  v12 = [(TVPDownload *)&v29 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaItem, a3);
    objc_storeWeak((id *)&v13->_downloadSession, v10);
    v13->_int64_t state = 0;
    objc_storeStrong((id *)&v13->_downloadTask, a5);
    uint64_t v14 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    delegates = v13->_delegates;
    v13->_delegates = (NSPointerArray *)v14;

    unint64_t v16 = *MEMORY[0x263F1D108];
    v13->_downloadInitiationBackgroundTask = *MEMORY[0x263F1D108];
    v13->_downloadTerminationBackgroundTask = v16;
    v13->_allowMultichannelAudio = 1;
    *(_DWORD *)&v13->_includeDefaultAudioOption = 16843009;
    downloadTask = v13->_downloadTask;
    if (downloadTask)
    {
      [v10 registerDownloadTask:downloadTask forDownload:v13];
      [(AVAssetDownloadTask *)v13->_downloadTask addObserver:v13 forKeyPath:@"progress.fractionCompleted" options:0 context:__DownloadTaskProgressKVOContext];
      v13->_addedProgressObserver = 1;
    }
    v18 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      int64_t state = v13->_state;
      v20 = v18;
      v21 = [(TVPDownload *)v13 descriptionForState:state];
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, "Setting state to %@", buf, 0xCu);
    }
    id v22 = objc_alloc(MEMORY[0x263F089D8]);
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = initWithMediaItem_downloadSession_existingDownloadTask__instanceNumber++;
    v25 = (void *)[v22 initWithFormat:@"%@ %ld", v23, v24];
    v26 = [[TVPStateMachine alloc] initWithName:v25 initialState:@"Not started" mode:0];
    stateMachine = v13->_stateMachine;
    v13->_stateMachine = v26;

    [(TVPStateMachine *)v13->_stateMachine setLogObject:sLogObject_2];
    [(TVPDownload *)v13 _registerStateMachineHandlers];
    [(TVPStateMachine *)v13->_stateMachine setShouldAcceptEvents:1];
  }
  return v13;
}

- (void)dealloc
{
  if (self->_addedProgressObserver)
  {
    downloadTask = self->_downloadTask;
    if (downloadTask) {
      [(AVAssetDownloadTask *)downloadTask removeObserver:self forKeyPath:@"progress.fractionCompleted" context:__DownloadTaskProgressKVOContext];
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)TVPDownload;
  [(TVPDownload *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if ((void *)__TVPMediaItemLoaderStateKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    [(TVPDownload *)self _mediaItemLoaderStateDidChangeTo:v14];
  }
  else if ((void *)__DownloadTaskProgressKVOContext == a6)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__TVPDownload_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v16[3] = &unk_264CC5470;
    v16[4] = self;
    TVPPerformBlockOnMainThreadIfNeeded(v16);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TVPDownload;
    [(TVPDownload *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __62__TVPDownload_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadProgressDidChange];
}

- (void)addDelegate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(TVPDownload *)self delegates];
    [v5 addPointer:v4];
  }
}

- (void)removeDelegate:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    id v4 = [(TVPDownload *)self delegates];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      unint64_t v6 = 0;
      while (1)
      {
        v7 = [(TVPDownload *)self delegates];
        uint64_t v8 = [v7 pointerAtIndex:v6];

        if ((id)v8 == v12) {
          break;
        }
        ++v6;
        id v9 = [(TVPDownload *)self delegates];
        unint64_t v10 = [v9 count];

        if (v6 >= v10) {
          goto LABEL_8;
        }
      }
      id v11 = [(TVPDownload *)self delegates];
      [v11 removePointerAtIndex:v6];
    }
  }
LABEL_8:
}

- (double)progress
{
  v3 = [(TVPDownload *)self stateMachine];
  id v4 = [v3 currentState];
  int v5 = [v4 isEqualToString:@"Downloading"];

  if (v5)
  {
    unint64_t v6 = [(TVPDownload *)self downloadTask];
    v7 = [v6 progress];
    [v7 fractionCompleted];
    double v9 = v8;

    return v9;
  }
  id v11 = [(TVPDownload *)self stateMachine];
  id v12 = [v11 currentState];
  int v13 = [v12 isEqualToString:@"Terminating"];

  if (v13)
  {
    [(TVPDownload *)self lastDownloadProgressFractionCompleted];
  }
  else
  {
    uint64_t v14 = [(TVPDownload *)self stateMachine];
    objc_super v15 = [v14 currentState];
    if ([v15 isEqualToString:@"Download complete"])
    {
    }
    else
    {
      unint64_t v16 = [(TVPDownload *)self stateMachine];
      v17 = [v16 currentState];
      int v18 = [v17 isEqualToString:@"Processing finished download"];

      double result = 0.0;
      if (!v18) {
        return result;
      }
    }
    return 1.0;
  }
  return result;
}

- (void)start
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Posting error on start since startError is present", v2, v3, v4, v5, v6);
}

- (void)cancel
{
  id v2 = [(TVPDownload *)self stateMachine];
  [v2 postEvent:@"Cancel"];
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(TVPDownload *)self stateMachine];
  [v5 postEvent:@"Error did occur" withContext:v4];
}

- (id)descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return off_264CC5710[a3];
  }
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    int v13 = [(TVPDownload *)self mediaItem];
    int v22 = 138412802;
    id v23 = v9;
    __int16 v24 = 2112;
    v25 = v13;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Task [%@] for media item [%@] will download to [%@]", (uint8_t *)&v22, 0x20u);
  }
  uint64_t v14 = [(TVPDownload *)self delegates];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = 0;
    do
    {
      v17 = [(TVPDownload *)self delegates];
      int v18 = (void *)[v17 pointerAtIndex:v16];

      if (v18)
      {
        id v19 = v18;
        if (objc_opt_respondsToSelector()) {
          [v19 download:self willDownloadToURL:v10];
        }
      }
      ++v16;
      v20 = [(TVPDownload *)self delegates];
      unint64_t v21 = [v20 count];
    }
    while (v16 < v21);
  }
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadVariants:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    int v13 = [(TVPDownload *)self mediaItem];
    int v22 = 138412802;
    id v23 = v9;
    __int16 v24 = 2112;
    v25 = v13;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Download task [%@] for media item [%@] will download variants %@", (uint8_t *)&v22, 0x20u);
  }
  uint64_t v14 = [(TVPDownload *)self delegates];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = 0;
    do
    {
      v17 = [(TVPDownload *)self delegates];
      int v18 = (void *)[v17 pointerAtIndex:v16];

      if (v18)
      {
        id v19 = v18;
        if (objc_opt_respondsToSelector()) {
          [v19 download:self willDownloadVariants:v10];
        }
      }
      ++v16;
      v20 = [(TVPDownload *)self delegates];
      unint64_t v21 = [v20 count];
    }
    while (v16 < v21);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = [(TVPDownload *)self downloadTerminationBackgroundTask];
  if (v9 == *MEMORY[0x263F1D108])
  {
    unint64_t v10 = v9;
    id v11 = NSString;
    id v12 = [(TVPDownload *)self stateMachine];
    int v13 = [v12 name];
    uint64_t v14 = [v11 stringWithFormat:@"Download termination [%@]", v13];

    uint64_t v15 = [MEMORY[0x263F1C408] sharedApplication];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __52__TVPDownload_URLSession_task_didCompleteWithError___block_invoke;
    v22[3] = &unk_264CC5470;
    v22[4] = self;
    uint64_t v16 = [v15 beginBackgroundTaskWithName:v14 expirationHandler:v22];

    v17 = sLogObject_2;
    if (v16 == v10)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
        -[TVPDownload URLSession:task:didCompleteWithError:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      __int16 v26 = v14;
      _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Beginning download termination background task with identifier %lu, name: %@", buf, 0x16u);
    }
    [(TVPDownload *)self setDownloadTerminationBackgroundTask:v16];
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
  {
    -[TVPDownload URLSession:task:didCompleteWithError:]();
  }
  int v18 = (void *)sLogObject_2;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
    {
      id v19 = v18;
      v20 = [(TVPDownload *)self mediaItem];
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = (uint64_t)v7;
      __int16 v25 = 2112;
      __int16 v26 = v20;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_error_impl(&dword_236FC5000, v19, OS_LOG_TYPE_ERROR, "Task [%@] for media item [%@] did complete with error: %@", buf, 0x20u);
LABEL_15:
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v18;
    v20 = [(TVPDownload *)self mediaItem];
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = (uint64_t)v7;
    __int16 v25 = 2112;
    __int16 v26 = v20;
    _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Task [%@] for media item [%@] did complete download task successfully", buf, 0x16u);
    goto LABEL_15;
  }
  unint64_t v21 = [(TVPDownload *)self stateMachine];
  [v21 postEvent:@"Download task did complete" withContext:v8];
}

uint64_t __52__TVPDownload_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  uint64_t result = [*(id *)(a1 + 32) downloadTerminationBackgroundTask];
  uint64_t v3 = *MEMORY[0x263F1D108];
  if (result != *MEMORY[0x263F1D108])
  {
    id v4 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
      __52__TVPDownload_URLSession_task_didCompleteWithError___block_invoke_cold_1(v1, v4);
    }
    id v5 = [MEMORY[0x263F1C408] sharedApplication];
    objc_msgSend(v5, "endBackgroundTask:", objc_msgSend(*v1, "downloadTerminationBackgroundTask"));

    return [*v1 setDownloadTerminationBackgroundTask:v3];
  }
  return result;
}

- (void)_downloadProgressDidChange
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id v4 = [a2 downloadTask];
  id v5 = [v4 progress];
  [v5 fractionCompleted];
  int v7 = 134217984;
  double v8 = v6 * 100.0;
  _os_log_debug_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEBUG, "Download progress did change to %.2f%%", (uint8_t *)&v7, 0xCu);
}

- (void)_mediaItemLoaderStateDidChangeTo:(id)a3
{
  id v7 = a3;
  if ([v7 isEqualToString:0x26EA1A3B8])
  {
    id v4 = [(TVPDownload *)self stateMachine];
    [v4 postEvent:@"AVAsset keys did load"];
  }
  else
  {
    if (![v7 isEqualToString:0x26EA15E78]) {
      goto LABEL_6;
    }
    id v4 = [(TVPDownload *)self stateMachine];
    id v5 = [(TVPDownload *)self mediaItemLoader];
    double v6 = [v5 error];
    [v4 postEvent:@"Error did occur" withContext:v6];
  }
LABEL_6:
}

- (void)_addMediaSelectionOptionsIfNotAlreadyAdded:(id)a3 toMediaSelections:(id)a4 forMediaSelectionGroup:(id)a5 baseMediaSelection:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v26 = a4;
  id v10 = a5;
  id v23 = a6;
  id obj = v9;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v25 = *(void *)v32;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v15 = v26;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v28;
LABEL_8:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = [*(id *)(*((void *)&v27 + 1) + 8 * v19) selectedMediaOptionInMediaSelectionGroup:v10];
            char v21 = [v14 isEqual:v20];

            if (v21) {
              break;
            }
            if (v17 == ++v19)
            {
              uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v17) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          int v22 = (void *)[v23 mutableCopy];
          [v22 selectMediaOption:v14 inMediaSelectionGroup:v10];
          [v15 addObject:v22];
          id v15 = v22;
        }

        ++v13;
      }
      while (v13 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }
}

- (id)_variantQualifiersForCurrentSettingsAndAudioOption:(id)a3 useMultichannelAudio:(BOOL)a4
{
  BOOL v4 = a4;
  v79[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v6)
  {
    if (v4) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    uint64_t v8 = [MEMORY[0x263EFA510] predicateForChannelCount:2 mediaSelectionOption:v6 operatorType:v7];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"averageBitRate > 0"];
  }
  id v9 = (void *)v8;
  id v10 = [(TVPDownload *)self maximumPresentationWidth];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263EFA510];
    uint64_t v12 = [(TVPDownload *)self maximumPresentationWidth];
    [v12 doubleValue];
    uint64_t v13 = objc_msgSend(v11, "predicateForPresentationWidth:operatorType:", 0);

    uint64_t v14 = (void *)MEMORY[0x263F08730];
    v79[0] = v9;
    v79[1] = v13;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
    uint64_t v16 = [v14 andPredicateWithSubpredicates:v15];

    id v9 = (void *)v16;
  }
  if (![(TVPDownload *)self preferMostCompatibleRendition])
  {
    id v68 = v6;
    uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"videoAttributes.videoRange == %@", *MEMORY[0x263EFA430]];
    uint64_t v18 = (void *)MEMORY[0x263F08730];
    v78[0] = v17;
    uint64_t v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN videoAttributes.codecTypes", &unk_26EA25C30];
    v78[1] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:2];
    uint64_t v21 = [v18 andPredicateWithSubpredicates:v20];

    int v22 = (void *)MEMORY[0x263F08730];
    v77[0] = v9;
    v77[1] = v21;
    v66 = (void *)v21;
    id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
    uint64_t v24 = [v22 andPredicateWithSubpredicates:v23];

    uint64_t v25 = (void *)MEMORY[0x263F08730];
    v76[0] = v9;
    v76[1] = v17;
    v67 = (void *)v17;
    id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];
    long long v27 = [v25 andPredicateWithSubpredicates:v26];

    long long v28 = [(TVPDownload *)self maximumAverageBitrateForHDR];

    if (v28)
    {
      long long v29 = (void *)MEMORY[0x263F08A98];
      long long v30 = [(TVPDownload *)self maximumAverageBitrateForHDR];
      long long v31 = [v29 predicateWithFormat:@"averageBitRate < %@", v30];

      long long v32 = (void *)MEMORY[0x263F08730];
      v75[0] = v24;
      v75[1] = v31;
      long long v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:2];
      uint64_t v34 = [v32 andPredicateWithSubpredicates:v33];

      v35 = (void *)MEMORY[0x263F08730];
      v74[0] = v27;
      v74[1] = v31;
      v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
      uint64_t v37 = [v35 andPredicateWithSubpredicates:v36];

      uint64_t v24 = (void *)v34;
      long long v27 = (void *)v37;
    }
    v38 = [MEMORY[0x263EFA510] assetVariantQualifierWithPredicate:v24];
    [v69 addObject:v38];

    v65 = v27;
    v39 = [MEMORY[0x263EFA510] assetVariantQualifierWithPredicate:v27];
    [v69 addObject:v39];

    v40 = [MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN videoAttributes.codecTypes", &unk_26EA25C48];
    v41 = (void *)MEMORY[0x263F08730];
    v73[0] = v9;
    v73[1] = v40;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
    v43 = [v41 andPredicateWithSubpredicates:v42];

    v44 = [(TVPDownload *)self maximumAverageBitrateForSDRHEVC];

    if (v44)
    {
      v45 = (void *)MEMORY[0x263F08A98];
      v46 = [(TVPDownload *)self maximumAverageBitrateForSDRHEVC];
      v47 = [v45 predicateWithFormat:@"averageBitRate < %@", v46];

      v48 = (void *)MEMORY[0x263F08730];
      v72[0] = v43;
      v72[1] = v47;
      v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
      uint64_t v50 = [v48 andPredicateWithSubpredicates:v49];

      v43 = (void *)v50;
    }
    v51 = [MEMORY[0x263EFA510] assetVariantQualifierWithPredicate:v43];
    [v69 addObject:v51];

    id v6 = v68;
  }
  v52 = [MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN videoAttributes.codecTypes", &unk_26EA25C60];
  v53 = (void *)MEMORY[0x263F08730];
  v71[0] = v9;
  v71[1] = v52;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
  v55 = [v53 andPredicateWithSubpredicates:v54];

  v56 = [(TVPDownload *)self maximumAverageBitrateForAVC];

  if (v56)
  {
    v57 = (void *)MEMORY[0x263F08A98];
    v58 = [(TVPDownload *)self maximumAverageBitrateForAVC];
    v59 = [v57 predicateWithFormat:@"averageBitRate < %@", v58];

    v60 = (void *)MEMORY[0x263F08730];
    v70[0] = v55;
    v70[1] = v59;
    v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
    uint64_t v62 = [v60 andPredicateWithSubpredicates:v61];

    v55 = (void *)v62;
  }
  v63 = [MEMORY[0x263EFA510] assetVariantQualifierWithPredicate:v55];
  [v69 addObject:v63];

  return v69;
}

- (BOOL)_anyDelegateRespondsToProcessFinishedDownload
{
  uint64_t v3 = [(TVPDownload *)self delegates];
  uint64_t v4 = [v3 count];

  int v5 = 0;
  if (v4)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(TVPDownload *)self delegates];
      uint64_t v8 = [v7 pointerAtIndex:v6];

      if (v8) {
        v5 |= objc_opt_respondsToSelector();
      }
      ++v6;
      id v9 = [(TVPDownload *)self delegates];
      unint64_t v10 = [v9 count];
    }
    while (v6 < v10);
  }
  return v5 & 1;
}

- (void)_processFinishedDownloadWithCompletion:(id)a3
{
  id v12 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  id v20 = 0;
  uint64_t v4 = dispatch_group_create();
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v6 = [(TVPDownload *)self delegates];
    unint64_t v7 = [v6 count];

    if (i >= v7) {
      break;
    }
    uint64_t v8 = [(TVPDownload *)self delegates];
    id v9 = (void *)[v8 pointerAtIndex:i];

    if (v9)
    {
      id v10 = v9;
      if (objc_opt_respondsToSelector())
      {
        dispatch_group_enter(v4);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __54__TVPDownload__processFinishedDownloadWithCompletion___block_invoke;
        v16[3] = &unk_264CC5498;
        uint64_t v18 = v19;
        uint64_t v17 = v4;
        [v10 download:self processFinishedDownloadWithCompletion:v16];
      }
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__TVPDownload__processFinishedDownloadWithCompletion___block_invoke_2;
  block[3] = &unk_264CC54C0;
  id v14 = v12;
  id v15 = v19;
  id v11 = v12;
  dispatch_group_notify(v4, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v19, 8);
}

void __54__TVPDownload__processFinishedDownloadWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __54__TVPDownload__processFinishedDownloadWithCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40);
    uint64_t v3 = sLogObject_2;
    BOOL v4 = os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 40);
        int v9 = 138412290;
        uint64_t v10 = v5;
        unint64_t v6 = "Processed finished download with error %@";
        unint64_t v7 = v3;
        uint32_t v8 = 12;
LABEL_7:
        _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
      }
    }
    else if (v4)
    {
      LOWORD(v9) = 0;
      unint64_t v6 = "Processed finished download successfully";
      unint64_t v7 = v3;
      uint32_t v8 = 2;
      goto LABEL_7;
    }
    return (*(uint64_t (**)(void, void))(*(void *)(v1 + 32) + 16))(*(void *)(v1 + 32), *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 40));
  }
  return result;
}

- (void)_registerStateMachineHandlers
{
  v41[2] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  uint64_t v3 = [(TVPDownload *)self stateMachine];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke;
  v35[3] = &unk_264CC5510;
  objc_copyWeak(&v36, &location);
  BOOL v4 = (void *)MEMORY[0x237E144A0](v35);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2;
  v32[3] = &unk_264CC5560;
  objc_copyWeak(&v34, &location);
  id v5 = v4;
  id v33 = v5;
  unint64_t v6 = (void *)MEMORY[0x237E144A0](v32);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_123;
  v29[3] = &unk_264CC55D8;
  objc_copyWeak(&v31, &location);
  id v14 = v5;
  id v30 = v14;
  [v3 registerHandlerForEvent:@"Start" onState:@"Not started" withBlock:v29];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_139;
  v27[3] = &unk_264CC5650;
  objc_copyWeak(&v28, &location);
  [v3 registerHandlerForEvent:@"AVAsset keys did load" onState:@"Waiting for AVAsset keys to load" withBlock:v27];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_195;
  v25[3] = &unk_264CC56A0;
  objc_copyWeak(&v26, &location);
  v25[4] = self;
  [v3 registerHandlerForEvent:@"Key fetch attempt complete" onState:@"Fetching playback keys" withBlock:v25];
  v41[0] = @"Waiting for AVAsset keys to load";
  v41[1] = @"Fetching playback keys";
  unint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  [v3 registerHandlerForEvent:@"Download task did complete" onStates:v7 withBlock:&__block_literal_global_222];

  v40[0] = @"Not started";
  v40[1] = @"Downloading";
  uint32_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_224;
  v22[3] = &unk_264CC55D8;
  objc_copyWeak(&v24, &location);
  id v9 = v6;
  id v23 = v9;
  [v3 registerHandlerForEvent:@"Download task did complete" onStates:v8 withBlock:v22];

  [v3 registerHandlerForEvent:@"Download task did complete" onState:@"Terminating" withBlock:&__block_literal_global_228];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_230;
  v20[3] = &unk_264CC56F0;
  id v10 = v9;
  id v21 = v10;
  [v3 registerHandlerForEvent:@"Did process finished download" onState:@"Processing finished download" withBlock:v20];
  v39[0] = @"Cancel";
  v39[1] = @"Error did occur";
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
  v38[0] = @"Not started";
  v38[1] = @"Waiting for AVAsset keys to load";
  v38[2] = @"Fetching playback keys";
  v38[3] = @"Downloading";
  v38[4] = @"Processing finished download";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:5];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_4_232;
  v18[3] = &unk_264CC5650;
  objc_copyWeak(&v19, &location);
  [v3 registerHandlerForEvents:v11 onStates:v12 withBlock:v18];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_235;
  v15[3] = &unk_264CC55D8;
  objc_copyWeak(&v17, &location);
  id v13 = v10;
  id v16 = v13;
  [v3 registerHandlerForEvent:@"Termination delay did finish" onState:@"Terminating" withBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    unint64_t v6 = [WeakRetained descriptionForState:a2];
    *(_DWORD *)buf = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Setting state to %@", buf, 0xCu);
  }
  [WeakRetained setState:a2];
  unint64_t v7 = [WeakRetained stateMachine];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_115;
  v8[3] = &unk_264CC54E8;
  v8[4] = WeakRetained;
  v8[5] = a2;
  [v7 executeBlockAfterCurrentStateTransition:v8];
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_115(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegates];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [*(id *)(a1 + 32) delegates];
      unint64_t v6 = (void *)[v5 pointerAtIndex:v4];

      if (v6)
      {
        id v7 = v6;
        if (objc_opt_respondsToSelector()) {
          [v7 download:*(void *)(a1 + 32) didChangeStateTo:*(void *)(a1 + 40)];
        }
      }
      ++v4;
      uint32_t v8 = [*(id *)(a1 + 32) delegates];
      unint64_t v9 = [v8 count];
    }
    while (v4 < v9);
  }
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (a2 != 5)
  {
    uint64_t v6 = a2 == 4;
    id v7 = 0;
    goto LABEL_8;
  }
  uint32_t v8 = [WeakRetained error];
  unint64_t v9 = [v8 domain];
  if ([v9 isEqualToString:*MEMORY[0x263F08570]])
  {
    id v10 = [v5 error];
    uint64_t v11 = [v10 code];

    if (v11 == -999)
    {
      id v7 = 0;
      uint64_t v6 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v7 = [v5 error];
  uint64_t v6 = 2;
LABEL_8:
  id v12 = [v5 reportingSession];

  if (!v12)
  {
    id v13 = [TVPReportingSession alloc];
    id v14 = [v5 mediaItem];
    id v15 = [(TVPReportingSession *)v13 initWithMediaItem:v14];
    [v5 setReportingSession:v15];
  }
  id v16 = [v5 reportingSession];
  [v16 reportDownloadFinishedWithResult:v6 error:v7];

  if ([v5 addedProgressObserver])
  {
    id v17 = [v5 downloadTask];
    [v17 removeObserver:v5 forKeyPath:@"progress.fractionCompleted" context:__DownloadTaskProgressKVOContext];

    [v5 setAddedProgressObserver:0];
  }
  [v5 setDownloadTask:0];
  [v5 setLastDownloadProgressFractionCompleted:0.0];
  if ([v5 addedMediaItemLoaderStateObserver])
  {
    uint64_t v18 = [v5 mediaItemLoader];
    [v18 removeObserver:v5 forKeyPath:@"state" context:__TVPMediaItemLoaderStateKVOContext];

    [v5 setAddedMediaItemLoaderStateObserver:0];
  }
  id v19 = [v5 mediaItemLoader];
  [v19 cleanupIfNecessary];

  [v5 setMediaItemLoader:0];
  id v20 = [v5 downloadSession];
  [v20 unregisterDownloadTaskForDownload:v5];

  [v5 setStorageSettingsImageData:0];
  id v21 = [v5 stateMachine];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_3;
  v22[3] = &unk_264CC5538;
  id v23 = *(id *)(a1 + 32);
  uint64_t v24 = a2;
  void v22[4] = v5;
  [v21 executeBlockAfterCurrentStateTransition:v22];
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_4;
  block[3] = &unk_264CC5470;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) downloadInitiationBackgroundTask];
  uint64_t v3 = *MEMORY[0x263F1D108];
  if (v2 != *MEMORY[0x263F1D108])
  {
    unint64_t v4 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = v4;
      int v14 = 134217984;
      uint64_t v15 = [v5 downloadInitiationBackgroundTask];
      _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "Ending download initiation background task with identifier %lu", (uint8_t *)&v14, 0xCu);
    }
    id v7 = [MEMORY[0x263F1C408] sharedApplication];
    objc_msgSend(v7, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "downloadInitiationBackgroundTask"));

    [*(id *)(a1 + 32) setDownloadInitiationBackgroundTask:v3];
  }
  uint64_t result = [*(id *)(a1 + 32) downloadTerminationBackgroundTask];
  if (result != v3)
  {
    unint64_t v9 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = v9;
      uint64_t v12 = [v10 downloadTerminationBackgroundTask];
      int v14 = 134217984;
      uint64_t v15 = v12;
      _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Ending download termination background task with identifier %lu", (uint8_t *)&v14, 0xCu);
    }
    id v13 = [MEMORY[0x263F1C408] sharedApplication];
    objc_msgSend(v13, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "downloadTerminationBackgroundTask"));

    return [*(id *)(a1 + 32) setDownloadTerminationBackgroundTask:v3];
  }
  return result;
}

__CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_123(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained downloadTask];

  if (v5)
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_136;
    v36[3] = &unk_264CC55B0;
    id v37 = *(id *)(a1 + 32);
    [v3 executeBlockAfterCurrentStateTransition:v36];
    uint64_t v6 = [WeakRetained downloadTask];
    uint64_t v7 = [v6 state];

    if (v7 == 1)
    {
      uint32_t v8 = sLogObject_2;
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Download task already exists but is suspended.  Resuming", buf, 2u);
      }
      unint64_t v9 = [WeakRetained downloadTask];
      [v9 resume];
    }
    else
    {
      id v19 = [WeakRetained downloadTask];
      uint64_t v20 = [v19 state];

      if (v20 == 3)
      {
        id v21 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "Calling URLSession:task:didCompleteWithError: since download task is already completed", buf, 2u);
        }
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_137;
        v35[3] = &unk_264CC5470;
        void v35[4] = WeakRetained;
        [v3 executeBlockAfterCurrentStateTransition:v35];
      }
    }
    int v22 = @"Downloading";
    id v23 = v37;
  }
  else
  {
    uint64_t v10 = [WeakRetained downloadInitiationBackgroundTask];
    if (v10 == *MEMORY[0x263F1D108])
    {
      uint64_t v11 = v10;
      uint64_t v12 = NSString;
      id v13 = [WeakRetained stateMachine];
      int v14 = [v13 name];
      uint64_t v15 = [v12 stringWithFormat:@"Download initiation [%@]", v14];

      uint64_t v16 = [MEMORY[0x263F1C408] sharedApplication];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_127;
      v46[3] = &unk_264CC5470;
      v46[4] = WeakRetained;
      uint64_t v17 = [v16 beginBackgroundTaskWithName:v15 expirationHandler:v46];

      uint64_t v18 = sLogObject_2;
      if (v17 == v11)
      {
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
          __44__TVPDownload__registerStateMachineHandlers__block_invoke_123_cold_2();
        }
      }
      else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v48 = v17;
        __int16 v49 = 2112;
        uint64_t v50 = v15;
        _os_log_impl(&dword_236FC5000, v18, OS_LOG_TYPE_DEFAULT, "Beginning download initiation background task with identifier %lu, name: %@", buf, 0x16u);
      }
      [WeakRetained setDownloadInitiationBackgroundTask:v17];
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
    {
      __44__TVPDownload__registerStateMachineHandlers__block_invoke_123_cold_3();
    }
    uint64_t v24 = [TVPReportingSession alloc];
    uint64_t v25 = [WeakRetained mediaItem];
    id v26 = [(TVPReportingSession *)v24 initWithMediaItem:v25];
    [WeakRetained setReportingSession:v26];

    long long v27 = [WeakRetained mediaItem];
    id v23 = +[TVPMediaItemLoader loaderForMediaItem:v27];

    if (v23)
    {
      id v28 = [WeakRetained downloadTask];
      long long v29 = [v28 URLAsset];
      [v23 setExistingAVAsset:v29];

      objc_msgSend(v23, "setAllowsCellularUsage:", objc_msgSend(WeakRetained, "allowCellularUsage"));
      [WeakRetained setMediaItemLoader:v23];
      [v23 addObserver:WeakRetained forKeyPath:@"state" options:1 context:__TVPMediaItemLoaderStateKVOContext];
      [WeakRetained setAddedMediaItemLoaderStateObserver:1];
      if ([WeakRetained performKeyFetchOnly]) {
        uint64_t v30 = 6;
      }
      else {
        uint64_t v30 = 1;
      }
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_129;
      v43[3] = &unk_264CC5588;
      id v44 = *(id *)(a1 + 32);
      uint64_t v45 = v30;
      [v3 executeBlockAfterCurrentStateTransition:v43];
      [v23 loadIfNecessary];
      id v31 = [v23 state];
      if (([v31 isEqualToString:0x26EA1A3B8] & 1) != 0
        || ([v31 isEqualToString:0x26EA1A3D8] & 1) != 0
        || [v31 isEqualToString:0x26EA1A3F8])
      {
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_130;
        v41[3] = &unk_264CC5470;
        id v42 = v3;
        [v42 executeBlockAfterCurrentStateTransition:v41];
      }
      id v32 = v44;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
        __44__TVPDownload__registerStateMachineHandlers__block_invoke_123_cold_1();
      }
      id v33 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"TVPlaybackErrorDomain" code:802 userInfo:0];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_135;
      v38[3] = &unk_264CC52C8;
      id v39 = v3;
      id v40 = v33;
      id v32 = v33;
      [v39 executeBlockAfterCurrentStateTransition:v38];
    }
    int v22 = @"Waiting for AVAsset keys to load";
  }

  return v22;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_127(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  uint64_t result = [*(id *)(a1 + 32) downloadInitiationBackgroundTask];
  uint64_t v3 = *MEMORY[0x263F1D108];
  if (result != *MEMORY[0x263F1D108])
  {
    unint64_t v4 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
      __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_127_cold_1(v1, v4);
    }
    id v5 = [MEMORY[0x263F1C408] sharedApplication];
    objc_msgSend(v5, "endBackgroundTask:", objc_msgSend(*v1, "downloadInitiationBackgroundTask"));

    return [*v1 setDownloadInitiationBackgroundTask:v3];
  }
  return result;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_130(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"AVAsset keys did load"];
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Error did occur" withContext:*(void *)(a1 + 40)];
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_136(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_137(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = [v2 downloadSession];
  uint64_t v3 = [v7 downloadSession];
  unint64_t v4 = [*(id *)(a1 + 32) downloadTask];
  id v5 = [*(id *)(a1 + 32) downloadTask];
  uint64_t v6 = [v5 error];
  [v2 URLSession:v3 task:v4 didCompleteWithError:v6];
}

__CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_139(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  uint64_t v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v12 = [WeakRetained mediaItemLoader];
  id v13 = [v12 AVAsset];

  uint64_t v14 = objc_msgSend(v13, "tvp_maximumVideoRange");
  uint64_t v15 = objc_msgSend(v13, "tvp_maximumVideoResolution");
  uint64_t v16 = [WeakRetained delegates];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    unint64_t v18 = 0;
    do
    {
      id v19 = [WeakRetained delegates];
      uint64_t v20 = (void *)[v19 pointerAtIndex:v18];

      if (v20)
      {
        id v21 = v20;
        if (objc_opt_respondsToSelector()) {
          [v21 download:WeakRetained didDetermineMaximumResolution:v15 maximumVideoRange:v14];
        }
      }
      ++v18;
      int v22 = [WeakRetained delegates];
      unint64_t v23 = [v22 count];
    }
    while (v18 < v23);
  }
  uint64_t v24 = [WeakRetained mediaItem];
  uint64_t v25 = [v24 mediaItemMetadataForProperty:@"TVPMediaItemMetadataContentKeyRequestParams"];

  id v26 = [WeakRetained mediaItemLoader];
  long long v27 = [v26 contentKeySession];

  if ([v25 count]
    && ([WeakRetained mediaItem],
        id v28 = objc_claimAutoreleasedReturnValue(),
        int v29 = [v28 conformsToProtocol:&unk_26EA48068],
        v28,
        v29))
  {
    uint64_t v30 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v30, OS_LOG_TYPE_DEFAULT, "Key params are available, will attempt to prefetch playback keys prior to starting download task", buf, 2u);
    }
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    void v39[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_192;
    v39[3] = &unk_264CC5628;
    id v40 = v27;
    id v41 = v25;
    objc_copyWeak(&v42, v10);
    [v9 executeBlockAfterCurrentStateTransition:v39];
    id v31 = &v40;
    objc_destroyWeak(&v42);
  }
  else
  {
    id v32 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v32, OS_LOG_TYPE_DEFAULT, "No key params are available, will not prefetch playback keys prior to starting download task", buf, 2u);
    }
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_194;
    v37[3] = &unk_264CC5470;
    id v31 = &v38;
    id v38 = v9;
    [v38 executeBlockAfterCurrentStateTransition:v37];
  }

  return @"Fetching playback keys";
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_192(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_193;
  v3[3] = &unk_264CC5600;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  [v1 fetchOfflineKeysForParams:v2 completion:v3];
  objc_destroyWeak(&v4);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_193(uint64_t a1)
{
  uint64_t v2 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Finished key prefetch attempt", v5, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained stateMachine];
  [v4 postEvent:@"Key fetch attempt complete"];
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_194(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Key fetch attempt complete"];
}

__CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_195(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v308[2] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v231 = WeakRetained;
  if ([WeakRetained performKeyFetchOnly])
  {
    uint64_t v14 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "Skipping actual download since performKeyFetchOnly is YES", buf, 2u);
    }
    v286[0] = MEMORY[0x263EF8330];
    v286[1] = 3221225472;
    v286[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_196;
    v286[3] = &unk_264CC5470;
    id v287 = v9;
    [v287 executeBlockAfterCurrentStateTransition:v286];
    id v15 = v287;
    uint64_t v16 = v231;
    goto LABEL_205;
  }
  id v219 = v9;
  id v220 = v11;
  id v17 = v10;
  unint64_t v18 = [WeakRetained mediaItemLoader];
  [v18 AVAsset];
  uint64_t v19 = a1;
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = objc_msgSend(v15, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);
  id v21 = objc_msgSend(v15, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9CD0]);
  v235 = v20;
  uint64_t v22 = [v20 options];
  unint64_t v23 = (void *)MEMORY[0x263EFA728];
  uint64_t v24 = *MEMORY[0x263EF9CC8];
  uint64_t v236 = *MEMORY[0x263EF9CC0];
  v308[0] = *MEMORY[0x263EF9CC0];
  v308[1] = v24;
  uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v308 count:2];
  v222 = (void *)v22;
  v221 = [v23 mediaSelectionOptionsFromArray:v22 withMediaCharacteristics:v25];

  id v26 = [v15 preferredMediaSelection];
  id v234 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v211 = v19;
  long long v27 = [*(id *)(v19 + 32) mediaItemLoader];
  LODWORD(v25) = [v27 containsStreamingAVAsset];

  v226 = v21;
  v230 = v26;
  if (!v25)
  {
    id v42 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v42, OS_LOG_TYPE_DEFAULT, "Will download all media selections since download is CRABS", buf, 2u);
    }
    id v43 = (id)MEMORY[0x263EFFA68];
    goto LABEL_188;
  }
  id v215 = v15;
  id v217 = v12;
  if (!v26)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
      __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_195_cold_2();
    }
    id v44 = (id)MEMORY[0x263EFFA68];
    goto LABEL_178;
  }
  id v28 = v231;
  unint64_t v29 = 0x263EFF000uLL;
  if ([v231 includeDefaultAudioOption])
  {
    uint64_t v30 = (id)sLogObject_2;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v30, OS_LOG_TYPE_DEFAULT, "Including default audio option due to user preference", buf, 2u);
    }

    [v234 addObject:v26];
    id v28 = v231;
  }
  if ([v28 includeOriginalAudio])
  {
    id v31 = (id)sLogObject_2;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v31, OS_LOG_TYPE_DEFAULT, "Including original audio due to user preference", buf, 2u);
    }

    id v32 = (void *)MEMORY[0x263EFA728];
    uint64_t v307 = *MEMORY[0x263EF9CA8];
    id v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v307 count:1];
    id v34 = [v32 mediaSelectionOptionsFromArray:v221 withoutMediaCharacteristics:v33];

    id v28 = v231;
    [v231 _addMediaSelectionOptionsIfNotAlreadyAdded:v34 toMediaSelections:v234 forMediaSelectionGroup:v235 baseMediaSelection:v26];
  }
  id v35 = [v28 preferredAudioLanguageCodes];
  v214 = (void *)[v35 mutableCopy];

  if ([v28 includeDeviceLanguageAudio])
  {
    id v36 = [MEMORY[0x263EFF960] preferredLanguages];
    id v37 = [v36 firstObject];

    if (v37)
    {
      id v38 = v214;
      if (!v214) {
        id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      v214 = v38;
      char v39 = [v38 containsObject:v37];
      id v40 = (id)sLogObject_2;
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if (v39)
      {
        if (v41)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_236FC5000, v40, OS_LOG_TYPE_DEFAULT, "Device language already exists in preferred audio language codes", buf, 2u);
        }
      }
      else
      {
        if (v41)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v306 = (uint64_t)v37;
          _os_log_impl(&dword_236FC5000, v40, OS_LOG_TYPE_DEFAULT, "Adding device language to preferred audio language codes: %@", buf, 0xCu);
        }

        [v214 insertObject:v37 atIndex:0];
      }
    }
  }
  uint64_t v45 = (id)sLogObject_2;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v306 = (uint64_t)v214;
    _os_log_impl(&dword_236FC5000, v45, OS_LOG_TYPE_DEFAULT, "Preferred audio language codes: %@", buf, 0xCu);
  }

  id v212 = v17;
  if ([v214 count])
  {
    v46 = (void *)MEMORY[0x263EFA728];
    uint64_t v304 = v236;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v304 count:1];
    uint64_t v48 = [v46 mediaSelectionOptionsFromArray:v222 withMediaCharacteristics:v47];

    long long v284 = 0u;
    long long v285 = 0u;
    long long v282 = 0u;
    long long v283 = 0u;
    id v49 = v214;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v282 objects:v303 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v283;
      uint64_t v53 = *MEMORY[0x263EF9CA8];
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v283 != v52) {
            objc_enumerationMutation(v49);
          }
          v55 = (void *)MEMORY[0x263EFA728];
          uint64_t v302 = *(void *)(*((void *)&v282 + 1) + 8 * i);
          v56 = [*(id *)(v29 + 2240) arrayWithObjects:&v302 count:1];
          v57 = [v55 mediaSelectionOptionsFromArray:v48 filteredAndSortedAccordingToPreferredLanguages:v56];

          v58 = (void *)MEMORY[0x263EFA728];
          uint64_t v301 = v53;
          v59 = [*(id *)(v29 + 2240) arrayWithObjects:&v301 count:1];
          v60 = [v58 mediaSelectionOptionsFromArray:v57 withoutMediaCharacteristics:v59];

          uint64_t v61 = [v60 firstObject];
          uint64_t v62 = (void *)v61;
          if (v61)
          {
            uint64_t v300 = v61;
            v63 = [*(id *)(v29 + 2240) arrayWithObjects:&v300 count:1];
            [v231 _addMediaSelectionOptionsIfNotAlreadyAdded:v63 toMediaSelections:v234 forMediaSelectionGroup:v235 baseMediaSelection:v230];

            unint64_t v29 = 0x263EFF000;
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v282 objects:v303 count:16];
      }
      while (v51);
    }

    id v17 = v212;
    id v21 = v226;
    id v26 = v230;
  }
  if (![v234 count])
  {
    v64 = (id)sLogObject_2;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v64, OS_LOG_TYPE_DEFAULT, "Including default audio option since none of user's preferred audio languages could be found", buf, 2u);
    }

    [v234 addObject:v26];
  }
  CFArrayRef v210 = MAAudibleMediaCopyPreferredCharacteristics();
  if ([(__CFArray *)v210 containsObject:*MEMORY[0x263F110A0]])
  {
    v65 = (id)sLogObject_2;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v65, OS_LOG_TYPE_DEFAULT, "Audio descriptions accessibility pref is enabled", buf, 2u);
    }

    id v66 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v278 = 0u;
    long long v279 = 0u;
    long long v280 = 0u;
    long long v281 = 0u;
    id v67 = v234;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v278 objects:v299 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v279;
      do
      {
        for (uint64_t j = 0; j != v69; ++j)
        {
          if (*(void *)v279 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = [*(id *)(*((void *)&v278 + 1) + 8 * j) selectedMediaOptionInMediaSelectionGroup:v235];
          v73 = [v72 extendedLanguageTag];

          if (v73) {
            [v66 addObject:v73];
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v278 objects:v299 count:16];
      }
      while (v69);
    }

    v74 = (void *)MEMORY[0x263EFA728];
    uint64_t v298 = v236;
    v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v298 count:1];
    uint64_t v76 = [v74 mediaSelectionOptionsFromArray:v222 withMediaCharacteristics:v75];

    v77 = (void *)MEMORY[0x263EFA728];
    v78 = [v66 allObjects];
    v237 = (void *)v76;
    v79 = [v77 mediaSelectionOptionsFromArray:v76 filteredAndSortedAccordingToPreferredLanguages:v78];

    v80 = (void *)MEMORY[0x263EFA728];
    uint64_t v297 = *MEMORY[0x263EF9CA8];
    v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v297 count:1];
    v82 = [v80 mediaSelectionOptionsFromArray:v79 withMediaCharacteristics:v81];

    long long v276 = 0u;
    long long v277 = 0u;
    long long v274 = 0u;
    long long v275 = 0u;
    id v83 = v82;
    uint64_t v84 = [v83 countByEnumeratingWithState:&v274 objects:v296 count:16];
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v275;
      do
      {
        for (uint64_t k = 0; k != v85; ++k)
        {
          if (*(void *)v275 != v86) {
            objc_enumerationMutation(v83);
          }
          uint64_t v88 = *(void *)(*((void *)&v274 + 1) + 8 * k);
          v89 = [v67 firstObject];
          v90 = (void *)[v89 mutableCopy];

          [v90 selectMediaOption:v88 inMediaSelectionGroup:v235];
          [v67 addObject:v90];
        }
        uint64_t v85 = [v83 countByEnumeratingWithState:&v274 objects:v296 count:16];
      }
      while (v85);
    }

    id v17 = v212;
    id v21 = v226;
    unint64_t v29 = 0x263EFF000uLL;
  }
  v91 = [v21 options];
  v209 = v91;
  if ([v231 includesAllSubtitles])
  {
    v92 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v92, OS_LOG_TYPE_DEFAULT, "Including all subtitles", buf, 2u);
    }
    id v93 = v91;
    goto LABEL_170;
  }
  id v229 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v233 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v94 = (void *)MEMORY[0x263EFA728];
  uint64_t v295 = *MEMORY[0x263EF9C98];
  v95 = [*(id *)(v29 + 2240) arrayWithObjects:&v295 count:1];
  v208 = [v94 mediaSelectionOptionsFromArray:v91 withoutMediaCharacteristics:v95];

  long long v272 = 0u;
  long long v273 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  id v96 = v91;
  uint64_t v97 = [v96 countByEnumeratingWithState:&v270 objects:v294 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v271;
    uint64_t v100 = *MEMORY[0x263EF9CF0];
    do
    {
      for (uint64_t m = 0; m != v98; ++m)
      {
        if (*(void *)v271 != v99) {
          objc_enumerationMutation(v96);
        }
        v102 = *(void **)(*((void *)&v270 + 1) + 8 * m);
        v103 = [v102 mediaType];
        int v104 = [v103 isEqualToString:v100];

        if (v104) {
          [v233 addObject:v102];
        }
      }
      uint64_t v98 = [v96 countByEnumeratingWithState:&v270 objects:v294 count:16];
    }
    while (v98);
  }

  long long v268 = 0u;
  long long v269 = 0u;
  long long v266 = 0u;
  long long v267 = 0u;
  id v105 = v234;
  uint64_t v106 = [v105 countByEnumeratingWithState:&v266 objects:v293 count:16];
  id v21 = v226;
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v267;
    do
    {
      for (uint64_t n = 0; n != v107; ++n)
      {
        if (*(void *)v267 != v108) {
          objc_enumerationMutation(v105);
        }
        v110 = [*(id *)(*((void *)&v266 + 1) + 8 * n) selectedMediaOptionInMediaSelectionGroup:v235];
        v111 = [v110 associatedMediaSelectionOptionInMediaSelectionGroup:v226];
        if (v111) {
          [v233 addObject:v111];
        }
        v112 = [v110 extendedLanguageTag];
        if (v112) {
          [v229 addObject:v112];
        }
      }
      uint64_t v107 = [v105 countByEnumeratingWithState:&v266 objects:v293 count:16];
    }
    while (v107);
  }

  if ([v214 count]) {
    [v229 addObjectsFromArray:v214];
  }
  v113 = (id)sLogObject_2;
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v306 = (uint64_t)v229;
    _os_log_impl(&dword_236FC5000, v113, OS_LOG_TYPE_DEFAULT, "Will look for subtitles that match preferred audio languages and audio languages being downloaded: %@", buf, 0xCu);
  }

  id v114 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v262 = 0u;
  long long v263 = 0u;
  long long v264 = 0u;
  long long v265 = 0u;
  id v115 = v221;
  uint64_t v116 = [v115 countByEnumeratingWithState:&v262 objects:v292 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v263;
    do
    {
      for (iuint64_t i = 0; ii != v117; ++ii)
      {
        if (*(void *)v263 != v118) {
          objc_enumerationMutation(v115);
        }
        v120 = [*(id *)(*((void *)&v262 + 1) + 8 * ii) extendedLanguageTag];
        if (v120) {
          [v114 addObject:v120];
        }
      }
      uint64_t v117 = [v115 countByEnumeratingWithState:&v262 objects:v292 count:16];
    }
    while (v117);
  }

  v121 = (id)sLogObject_2;
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v306 = (uint64_t)v114;
    _os_log_impl(&dword_236FC5000, v121, OS_LOG_TYPE_DEFAULT, "Will look for subtitles that match original audio language: %@", buf, 0xCu);
  }

  v122 = [v114 allObjects];
  [v229 addObjectsFromArray:v122];

  uint64_t v123 = [MEMORY[0x263EFF960] preferredLanguages];
  if (v123)
  {
    v124 = (id)sLogObject_2;
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v306 = v123;
      _os_log_impl(&dword_236FC5000, v124, OS_LOG_TYPE_DEFAULT, "Will look for subtitles that match device languages: %@", buf, 0xCu);
    }

    [v229 addObjectsFromArray:v123];
  }
  v125 = [v231 preferredSubtitleLanguageCodes];

  v207 = (void *)v123;
  if (v125)
  {
    v126 = (id)sLogObject_2;
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
    {
      id v127 = [v231 preferredSubtitleLanguageCodes];
      *(_DWORD *)buf = 138412290;
      uint64_t v306 = (uint64_t)v127;
      _os_log_impl(&dword_236FC5000, v126, OS_LOG_TYPE_DEFAULT, "Will look for subtitles that match user's preferred subtitle languages: %@", buf, 0xCu);
    }
    v128 = [v231 preferredSubtitleLanguageCodes];
    [v229 addObjectsFromArray:v128];
  }
  if ([v229 containsObject:@"yue"]) {
    [v229 addObject:@"yue-Hant"];
  }
  v129 = (id)sLogObject_2;
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v306 = (uint64_t)v229;
    _os_log_impl(&dword_236FC5000, v129, OS_LOG_TYPE_DEFAULT, "Final list of preferred subtitle languages: %@", buf, 0xCu);
  }

  int v223 = 1;
  CFArrayRef v130 = MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(kMACaptionAppearanceDomainUser);
  if (([(__CFArray *)v130 containsObject:*MEMORY[0x263F11098]] & 1) == 0) {
    int v223 = [(__CFArray *)v130 containsObject:*MEMORY[0x263F110A8]];
  }
  CFArrayRef v206 = v130;
  v131 = (void *)MEMORY[0x263EFA728];
  v132 = [v229 allObjects];
  v133 = [v131 mediaSelectionOptionsFromArray:v208 filteredAndSortedAccordingToPreferredLanguages:v132];

  id v134 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v135 = (id)sLogObject_2;
  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
  {
    v136 = @"NO";
    if (v223) {
      v136 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v306 = (uint64_t)v136;
    _os_log_impl(&dword_236FC5000, v135, OS_LOG_TYPE_DEFAULT, "Will prefer SDH subtitles: %@", buf, 0xCu);
  }

  long long v260 = 0u;
  long long v261 = 0u;
  long long v258 = 0u;
  long long v259 = 0u;
  id v137 = v133;
  uint64_t v232 = [v137 countByEnumeratingWithState:&v258 objects:v291 count:16];
  if (v232)
  {
    uint64_t v138 = *(void *)v259;
    uint64_t v139 = *MEMORY[0x263EF9D30];
    id v224 = v134;
    id v225 = v114;
    id v227 = v137;
    uint64_t v228 = *(void *)v259;
    do
    {
      for (juint64_t j = 0; jj != v232; ++jj)
      {
        if (*(void *)v259 != v138) {
          objc_enumerationMutation(v137);
        }
        v141 = *(void **)(*((void *)&v258 + 1) + 8 * jj);
        v142 = [v141 extendedLanguageTag];
        if (!v142) {
          goto LABEL_167;
        }
        v238 = v142;
        char v143 = [v134 containsObject:v142];
        v142 = v238;
        if (v143) {
          goto LABEL_167;
        }
        v144 = [v141 mediaType];
        int v145 = [v144 isEqualToString:v139];

        v142 = v238;
        uint64_t v138 = v228;
        if (!v145) {
          goto LABEL_167;
        }
        long long v256 = 0u;
        long long v257 = 0u;
        long long v254 = 0u;
        long long v255 = 0u;
        id v146 = v137;
        uint64_t v147 = [v146 countByEnumeratingWithState:&v254 objects:v290 count:16];
        if (!v147)
        {
LABEL_147:

LABEL_163:
          [v233 addObject:v141];
          id v21 = v226;
          id v137 = v227;
          id v134 = v224;
          goto LABEL_166;
        }
        uint64_t v148 = v147;
        uint64_t v149 = *(void *)v255;
LABEL_137:
        uint64_t v150 = 0;
        while (1)
        {
          if (*(void *)v255 != v149) {
            objc_enumerationMutation(v146);
          }
          v151 = *(void **)(*((void *)&v254 + 1) + 8 * v150);
          if (v151 == v141) {
            goto LABEL_145;
          }
          v152 = [*(id *)(*((void *)&v254 + 1) + 8 * v150) mediaType];
          int v153 = [v152 isEqualToString:v139];

          if (!v153) {
            goto LABEL_145;
          }
          v154 = [v151 extendedLanguageTag];
          v155 = v154;
          if (v154)
          {
            if ([v154 isEqualToString:v238]) {
              break;
            }
          }

LABEL_145:
          if (v148 == ++v150)
          {
            uint64_t v148 = [v146 countByEnumeratingWithState:&v254 objects:v290 count:16];
            if (v148) {
              goto LABEL_137;
            }
            goto LABEL_147;
          }
        }
        id v156 = v151;

        if (!v156) {
          goto LABEL_163;
        }
        id v21 = v226;
        id v137 = v227;
        id v134 = v224;
        if (objc_msgSend(v141, "tvp_isSDHSubtitle") && (objc_msgSend(v156, "tvp_isSDHSubtitle") & 1) != 0
          || (objc_msgSend(v141, "tvp_isSDHSubtitle") & 1) == 0 && (objc_msgSend(v156, "tvp_isSDHSubtitle") & 1) == 0)
        {
          [v233 addObject:v141];
          id v137 = v227;
          [v233 addObject:v156];
        }
        else
        {
          if (objc_msgSend(v141, "tvp_isSDHSubtitle")) {
            v157 = v141;
          }
          else {
            v157 = v156;
          }
          id v158 = v157;
          if (objc_msgSend(v141, "tvp_isSDHSubtitle")) {
            v159 = v156;
          }
          else {
            v159 = v141;
          }
          id v160 = v159;
          v161 = v160;
          if (v223) {
            id v162 = v158;
          }
          else {
            id v162 = v160;
          }
          [v233 addObject:v162];
        }
LABEL_166:
        [v134 addObject:v238];
        v142 = v238;
        id v114 = v225;
        uint64_t v138 = v228;
LABEL_167:
      }
      uint64_t v232 = [v137 countByEnumeratingWithState:&v258 objects:v291 count:16];
    }
    while (v232);
  }

  id v93 = [v233 allObjects];

  id v17 = v212;
LABEL_170:
  long long v252 = 0u;
  long long v253 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  id v163 = v93;
  uint64_t v164 = [v163 countByEnumeratingWithState:&v250 objects:v289 count:16];
  if (v164)
  {
    uint64_t v165 = v164;
    uint64_t v166 = *(void *)v251;
    do
    {
      for (kuint64_t k = 0; kk != v165; ++kk)
      {
        if (*(void *)v251 != v166) {
          objc_enumerationMutation(v163);
        }
        uint64_t v168 = *(void *)(*((void *)&v250 + 1) + 8 * kk);
        v169 = [v234 firstObject];
        v170 = (void *)[v169 mutableCopy];

        [v170 selectMediaOption:v168 inMediaSelectionGroup:v21];
        [v234 addObject:v170];
      }
      uint64_t v165 = [v163 countByEnumeratingWithState:&v250 objects:v289 count:16];
    }
    while (v165);
  }

  id v44 = v234;
LABEL_178:
  long long v248 = 0u;
  long long v249 = 0u;
  long long v246 = 0u;
  long long v247 = 0u;
  id v43 = v44;
  uint64_t v171 = [v43 countByEnumeratingWithState:&v246 objects:v288 count:16];
  if (v171)
  {
    uint64_t v172 = v171;
    uint64_t v173 = *(void *)v247;
    do
    {
      for (muint64_t m = 0; mm != v172; ++mm)
      {
        if (*(void *)v247 != v173) {
          objc_enumerationMutation(v43);
        }
        v175 = *(void **)(*((void *)&v246 + 1) + 8 * mm);
        v176 = (id)sLogObject_2;
        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v175, "tvp_description");
          id v177 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          uint64_t v306 = (uint64_t)v177;
          _os_log_impl(&dword_236FC5000, v176, OS_LOG_TYPE_DEFAULT, "Will download media selection: %@", buf, 0xCu);
        }
      }
      uint64_t v172 = [v43 countByEnumeratingWithState:&v246 objects:v288 count:16];
    }
    while (v172);
  }

  id v15 = v215;
  id v12 = v217;
  id v21 = v226;
  id v26 = v230;
LABEL_188:
  v178 = [v231 downloadTask];

  if (v178)
  {
    v179 = (id)sLogObject_2;
    if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR)) {
      __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_195_cold_1();
    }
    id v10 = v17;
    id v9 = v219;
  }
  else
  {
    id v218 = v12;
    v213 = v17;
    v180 = [v231 mediaItem];
    v179 = [v180 mediaItemMetadataForProperty:@"TVPMediaItemMetadataTitle"];

    id v216 = v15;
    v181 = [MEMORY[0x263EFA488] downloadConfigurationWithAsset:v15 title:v179];
    id v182 = objc_alloc_init(MEMORY[0x263EFF980]);
    v183 = [v231 storageSettingsImageData];
    [v181 setArtworkData:v183];

    v184 = [*(id *)(v211 + 32) mediaItemLoader];
    int v185 = [v184 containsStreamingAVAsset];

    if (v185)
    {
      v241[0] = MEMORY[0x263EF8330];
      v241[1] = 3221225472;
      v241[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_213;
      v241[3] = &unk_264CC5678;
      id v242 = v235;
      v243 = v231;
      id v186 = v181;
      id v244 = v186;
      id v187 = v182;
      id v245 = v187;
      [v43 enumerateObjectsUsingBlock:v241];
      [v186 setAuxiliaryContentConfigurations:v187];
    }
    v239 = v182;
    v188 = [v231 downloadSession];
    v189 = [v188 assetDownloadTaskWithConfiguration:v181];

    [v231 setStorageSettingsImageData:0];
    v190 = (id)sLogObject_2;
    if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v306 = (uint64_t)v189;
      _os_log_impl(&dword_236FC5000, v190, OS_LOG_TYPE_DEFAULT, "Created download task %@", buf, 0xCu);
    }

    v191 = v231;
    v192 = [v231 downloadSession];
    [v192 registerDownloadTask:v189 forDownload:v231];

    [v231 setDownloadTask:v189];
    [v189 addObserver:v231 forKeyPath:@"progress.fractionCompleted" options:0 context:__DownloadTaskProgressKVOContext];
    [v231 setAddedProgressObserver:1];
    v193 = [v231 delegates];
    uint64_t v194 = [v193 count];

    if (v194)
    {
      unint64_t v195 = 0;
      do
      {
        v196 = [v191 delegates];
        v197 = (void *)[v196 pointerAtIndex:v195];

        if (v197)
        {
          id v198 = v197;
          if (objc_opt_respondsToSelector())
          {
            v199 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v189, "taskIdentifier"));
            [v198 download:v231 didReceiveTaskIdentifier:v199];
          }
        }
        ++v195;
        v191 = v231;
        v200 = [v231 delegates];
        unint64_t v201 = [v200 count];
      }
      while (v195 < v201);
    }

    id v12 = v218;
    id v9 = v219;
    id v10 = v213;
    id v15 = v216;
    id v21 = v226;
    id v26 = v230;
  }

  uint64_t v16 = v231;
  v202 = [v231 downloadTask];
  [v202 resume];

  v203 = MEMORY[0x263EF83A0];
  id v204 = MEMORY[0x263EF83A0];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_219;
  block[3] = &unk_264CC5470;
  void block[4] = v231;
  dispatch_async(v203, block);

  id v11 = v220;
LABEL_205:

  return @"Downloading";
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_196(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Download task did complete"];
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_213(uint64_t a1, void *a2, uint64_t a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [v5 selectedMediaOptionInMediaSelectionGroup:*(void *)(a1 + 32)];
  id v7 = [*(id *)(a1 + 40) _variantQualifiersForCurrentSettingsAndAudioOption:v6 useMultichannelAudio:0];
  uint32_t v8 = [*(id *)(a1 + 40) _variantQualifiersForCurrentSettingsAndAudioOption:v6 useMultichannelAudio:1];
  if (a3)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFA490]);
    [v9 setVariantQualifiers:v7];
    id v18 = v5;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [v9 setMediaSelections:v10];

    [*(id *)(a1 + 56) addObject:v9];
    if ([*(id *)(a1 + 40) allowMultichannelAudio]
      && ([*(id *)(a1 + 40) limitMultichannelAudioToSingleLanguage] & 1) == 0)
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFA490]);
      [v11 setVariantQualifiers:v8];
      id v17 = v5;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
      [v11 setMediaSelections:v12];

      [*(id *)(a1 + 56) addObject:v11];
    }
    goto LABEL_7;
  }
  id v13 = [*(id *)(a1 + 48) primaryContentConfiguration];
  [v13 setVariantQualifiers:v7];

  uint64_t v14 = [*(id *)(a1 + 48) primaryContentConfiguration];
  v20[0] = v5;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  [v14 setMediaSelections:v15];

  if ([*(id *)(a1 + 40) allowMultichannelAudio])
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFA490]);
    [v9 setVariantQualifiers:v8];
    id v19 = v5;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    [v9 setMediaSelections:v16];

    [*(id *)(a1 + 56) addObject:v9];
LABEL_7:
  }
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_219(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) downloadInitiationBackgroundTask];
  uint64_t v3 = *MEMORY[0x263F1D108];
  if (result != *MEMORY[0x263F1D108])
  {
    id v4 = (void *)sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = v4;
      int v8 = 134217984;
      uint64_t v9 = [v5 downloadInitiationBackgroundTask];
      _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "Ending download initiation background task with identifier %lu", (uint8_t *)&v8, 0xCu);
    }
    id v7 = [MEMORY[0x263F1C408] sharedApplication];
    objc_msgSend(v7, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "downloadInitiationBackgroundTask"));

    return [*(id *)(a1 + 32) setDownloadInitiationBackgroundTask:v3];
  }
  return result;
}

id __44__TVPDownload__registerStateMachineHandlers__block_invoke_220(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
    __44__TVPDownload__registerStateMachineHandlers__block_invoke_220_cold_1();
  }
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __44__TVPDownload__registerStateMachineHandlers__block_invoke_223;
  uint64_t v14 = &unk_264CC52C8;
  id v15 = v5;
  id v16 = v6;
  id v7 = v6;
  id v8 = v5;
  [v8 executeBlockAfterCurrentStateTransition:&v11];
  uint64_t v9 = objc_msgSend(v8, "currentState", v11, v12, v13, v14);

  return v9;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_223(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Error did occur" withContext:*(void *)(a1 + 40)];
}

__CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_224(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  uint64_t v14 = [v9 currentState];
  if (v13)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_4_226;
    v17[3] = &unk_264CC52C8;
    id v18 = v9;
    id v19 = v13;
    [v18 executeBlockAfterCurrentStateTransition:v17];

    id WeakRetained = v18;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if ([WeakRetained _anyDelegateRespondsToProcessFinishedDownload])
    {

      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      void v20[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_3_225;
      v20[3] = &unk_264CC56C8;
      objc_copyWeak(&v21, (id *)(a1 + 40));
      [WeakRetained _processFinishedDownloadWithCompletion:v20];
      objc_destroyWeak(&v21);
      uint64_t v14 = @"Processing finished download";
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      uint64_t v14 = @"Download complete";
    }
  }

  return v14;
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_3_225(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained stateMachine];
  [v4 postEvent:@"Did process finished download" withContext:v3];
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_4_226(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Error did occur" withContext:*(void *)(a1 + 40)];
}

id __44__TVPDownload__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "Task is now completed.  Delaying failure to give task a chance to clean up", buf, 2u);
  }
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_229;
  block[3] = &unk_264CC5470;
  id v9 = v2;
  id v5 = v2;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
  id v6 = [v5 currentState];

  return v6;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_229(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Termination delay did finish"];
}

__CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_230(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [v6 currentState];
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_3_231;
    v10[3] = &unk_264CC52C8;
    id v11 = v6;
    id v12 = v7;
    [v11 executeBlockAfterCurrentStateTransition:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v8 = @"Download complete";
  }

  return v8;
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_3_231(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Error did occur" withContext:*(void *)(a1 + 40)];
}

__CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_4_232(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setError:v7];

  id v9 = [WeakRetained downloadTask];

  if (v9)
  {
    id v10 = [WeakRetained downloadTask];
    uint64_t v11 = [v10 state];

    id v12 = sLogObject_2;
    BOOL v13 = os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT);
    if (v11 == 3)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Task exists and is completed.  Delaying download termination to give task a chance to clean up", buf, 2u);
      }
      dispatch_time_t v14 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_233;
      block[3] = &unk_264CC5470;
      id v20 = v6;
      dispatch_after(v14, MEMORY[0x263EF83A0], block);
      id v15 = v20;
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Task exists but is not completed.  Cancelling task and waiting for didCompleteWithError", buf, 2u);
      }
      id v15 = [WeakRetained downloadTask];
      [v15 cancel];
    }
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__TVPDownload__registerStateMachineHandlers__block_invoke_234;
    v17[3] = &unk_264CC5470;
    id v18 = v6;
    [v18 executeBlockAfterCurrentStateTransition:v17];
    id v15 = v18;
  }

  return @"Terminating";
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_233(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Termination delay did finish"];
}

uint64_t __44__TVPDownload__registerStateMachineHandlers__block_invoke_234(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Termination delay did finish"];
}

__CFString *__44__TVPDownload__registerStateMachineHandlers__block_invoke_2_235(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained error];

  if (v3) {
    dispatch_time_t v4 = @"Failed";
  }
  else {
    dispatch_time_t v4 = @"Cancelled";
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v4;
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)performKeyFetchOnly
{
  return self->_performKeyFetchOnly;
}

- (void)setPerformKeyFetchOnly:(BOOL)a3
{
  self->_performKeyFetchOnly = a3;
}

- (BOOL)allowCellularUsage
{
  return self->_allowCellularUsage;
}

- (void)setAllowCellularUsage:(BOOL)a3
{
  self->_allowCellularUsage = a3;
}

- (BOOL)preferMostCompatibleRendition
{
  return self->_preferMostCompatibleRendition;
}

- (void)setPreferMostCompatibleRendition:(BOOL)a3
{
  self->_preferMostCompatibleRenditiouint64_t n = a3;
}

- (NSNumber)maximumPresentationWidth
{
  return self->_maximumPresentationWidth;
}

- (void)setMaximumPresentationWidth:(id)a3
{
}

- (NSNumber)maximumAverageBitrateForHDR
{
  return self->_maximumAverageBitrateForHDR;
}

- (void)setMaximumAverageBitrateForHDR:(id)a3
{
}

- (NSNumber)maximumAverageBitrateForSDRHEVC
{
  return self->_maximumAverageBitrateForSDRHEVC;
}

- (void)setMaximumAverageBitrateForSDRHEVC:(id)a3
{
}

- (NSNumber)maximumAverageBitrateForAVC
{
  return self->_maximumAverageBitrateForAVC;
}

- (void)setMaximumAverageBitrateForAVC:(id)a3
{
}

- (BOOL)prefer3DOrImmersiveDownload
{
  return self->_prefer3DOrImmersiveDownload;
}

- (void)setPrefer3DOrImmersiveDownload:(BOOL)a3
{
  self->_prefer3DOrImmersiveDownload = a3;
}

- (NSNumber)maximumPresentationWidthForImmersive
{
  return self->_maximumPresentationWidthForImmersive;
}

- (void)setMaximumPresentationWidthForImmersive:(id)a3
{
}

- (NSNumber)maximumAverageBitrateForImmersive
{
  return self->_maximumAverageBitrateForImmersive;
}

- (void)setMaximumAverageBitrateForImmersive:(id)a3
{
}

- (NSNumber)maximumPresentationWidthFor3D
{
  return self->_maximumPresentationWidthFor3D;
}

- (void)setMaximumPresentationWidthFor3D:(id)a3
{
}

- (NSNumber)maximumAverageBitrateForHDR3D
{
  return self->_maximumAverageBitrateForHDR3D;
}

- (void)setMaximumAverageBitrateForHDR3D:(id)a3
{
}

- (NSNumber)maximumAverageBitrateForSDR3D
{
  return self->_maximumAverageBitrateForSDR3D;
}

- (void)setMaximumAverageBitrateForSDR3D:(id)a3
{
}

- (NSNumber)maximumAverageBitrateForHDR3D48FPS
{
  return self->_maximumAverageBitrateForHDR3D48FPS;
}

- (void)setMaximumAverageBitrateForHDR3D48FPS:(id)a3
{
}

- (NSNumber)maximumAverageBitrateForSDR3D48FPS
{
  return self->_maximumAverageBitrateForSDR3D48FPS;
}

- (void)setMaximumAverageBitrateForSDR3D48FPS:(id)a3
{
}

- (BOOL)allowMultichannelAudio
{
  return self->_allowMultichannelAudio;
}

- (void)setAllowMultichannelAudio:(BOOL)a3
{
  self->_allowMultichannelAudio = a3;
}

- (BOOL)limitMultichannelAudioToSingleLanguage
{
  return self->_limitMultichannelAudioToSingleLanguage;
}

- (void)setLimitMultichannelAudioToSingleLanguage:(BOOL)a3
{
  self->_limitMultichannelAudioToSingleLanguage = a3;
}

- (BOOL)includeDefaultAudioOption
{
  return self->_includeDefaultAudioOption;
}

- (void)setIncludeDefaultAudioOption:(BOOL)a3
{
  self->_includeDefaultAudioOptiouint64_t n = a3;
}

- (BOOL)includeOriginalAudio
{
  return self->_includeOriginalAudio;
}

- (void)setIncludeOriginalAudio:(BOOL)a3
{
  self->_includeOriginalAudio = a3;
}

- (BOOL)includeDeviceLanguageAudio
{
  return self->_includeDeviceLanguageAudio;
}

- (void)setIncludeDeviceLanguageAudio:(BOOL)a3
{
  self->_includeDeviceLanguageAudio = a3;
}

- (NSArray)preferredAudioLanguageCodes
{
  return self->_preferredAudioLanguageCodes;
}

- (void)setPreferredAudioLanguageCodes:(id)a3
{
}

- (BOOL)includesAllSubtitles
{
  return self->_includesAllSubtitles;
}

- (void)setIncludesAllSubtitles:(BOOL)a3
{
  self->_includesAllSubtitles = a3;
}

- (NSArray)preferredSubtitleLanguageCodes
{
  return self->_preferredSubtitleLanguageCodes;
}

- (void)setPreferredSubtitleLanguageCodes:(id)a3
{
}

- (NSData)storageSettingsImageData
{
  return self->_storageSettingsImageData;
}

- (void)setStorageSettingsImageData:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (TVPMediaItemLoader)mediaItemLoader
{
  return self->_mediaItemLoader;
}

- (void)setMediaItemLoader:(id)a3
{
}

- (TVPDownloadSession)downloadSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadSession);
  return (TVPDownloadSession *)WeakRetained;
}

- (void)setDownloadSession:(id)a3
{
}

- (AVAssetDownloadTask)downloadTask
{
  return self->_downloadTask;
}

- (void)setDownloadTask:(id)a3
{
}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (double)lastDownloadProgressFractionCompleted
{
  return self->_lastDownloadProgressFractionCompleted;
}

- (void)setLastDownloadProgressFractionCompleted:(double)a3
{
  self->_lastDownloadProgressFractionCompleted = a3;
}

- (unint64_t)downloadInitiationBackgroundTask
{
  return self->_downloadInitiationBackgroundTask;
}

- (void)setDownloadInitiationBackgroundTask:(unint64_t)a3
{
  self->_downloadInitiationBackgroundTasuint64_t k = a3;
}

- (unint64_t)downloadTerminationBackgroundTask
{
  return self->_downloadTerminationBackgroundTask;
}

- (void)setDownloadTerminationBackgroundTask:(unint64_t)a3
{
  self->_downloadTerminationBackgroundTasuint64_t k = a3;
}

- (TVPReportingSession)reportingSession
{
  return self->_reportingSession;
}

- (void)setReportingSession:(id)a3
{
}

- (BOOL)addedMediaItemLoaderStateObserver
{
  return self->_addedMediaItemLoaderStateObserver;
}

- (void)setAddedMediaItemLoaderStateObserver:(BOOL)a3
{
  self->_addedMediaItemLoaderStateObserver = a3;
}

- (BOOL)addedProgressObserver
{
  return self->_addedProgressObserver;
}

- (void)setAddedProgressObserver:(BOOL)a3
{
  self->_addedProgressObserver = a3;
}

- (NSError)startError
{
  return self->_startError;
}

- (void)setStartError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startError, 0);
  objc_storeStrong((id *)&self->_reportingSession, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_destroyWeak((id *)&self->_downloadSession);
  objc_storeStrong((id *)&self->_mediaItemLoader, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_storageSettingsImageData, 0);
  objc_storeStrong((id *)&self->_preferredSubtitleLanguageCodes, 0);
  objc_storeStrong((id *)&self->_preferredAudioLanguageCodes, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForSDR3D48FPS, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForHDR3D48FPS, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForSDR3D, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForHDR3D, 0);
  objc_storeStrong((id *)&self->_maximumPresentationWidthFor3D, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForImmersive, 0);
  objc_storeStrong((id *)&self->_maximumPresentationWidthForImmersive, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForAVC, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForSDRHEVC, 0);
  objc_storeStrong((id *)&self->_maximumAverageBitrateForHDR, 0);
  objc_storeStrong((id *)&self->_maximumPresentationWidth, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Unable to begin download termination background task since identifier is UIBackgroundTaskInvalid", v2, v3, v4, v5, v6);
}

- (void)URLSession:task:didCompleteWithError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Not beginning download termination background task since one already exists.  This is not expected to ever happen.", v2, v3, v4, v5, v6);
}

void __52__TVPDownload_URLSession_task_didCompleteWithError___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  [v2 downloadTerminationBackgroundTask];
  OUTLINED_FUNCTION_2(&dword_236FC5000, v4, v5, "Download termination background task with identifier %lu expired.  This is not expected to ever happen.  Ending background task", v6, v7, v8, v9, 0);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_123_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Unable to create media item loader", v2, v3, v4, v5, v6);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_123_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Unable to begin download initiation background task since identifier is UIBackgroundTaskInvalid", v2, v3, v4, v5, v6);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_123_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Not beginning download initiation background task since one already exists.  This is not expected to ever happen.", v2, v3, v4, v5, v6);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_127_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  [v2 downloadInitiationBackgroundTask];
  OUTLINED_FUNCTION_2(&dword_236FC5000, v4, v5, "Download initiation background task with identifier %lu expired.  Ending background task", v6, v7, v8, v9, 0);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_195_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Download task already exists, but there shouldn't be one yet.  This isn't supposed to happen", v2, v3, v4, v5, v6);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_2_195_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "preferredMediaSelection does not exist", v2, v3, v4, v5, v6);
}

void __44__TVPDownload__registerStateMachineHandlers__block_invoke_220_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Received task did complete while in an invalid state.  Posting error event.  This is never expected to happen.", v2, v3, v4, v5, v6);
}

@end