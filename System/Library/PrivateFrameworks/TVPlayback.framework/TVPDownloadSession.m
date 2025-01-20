@interface TVPDownloadSession
+ (TVPDownloadSession)sharedInstance;
- (AVAssetDownloadURLSession)downloadSession;
- (NSMutableDictionary)taskIDsToDownloads;
- (TVPDownloadSession)init;
- (TVPDownloadSessionDelegate)delegate;
- (id)assetDownloadTaskWithConfiguration:(id)a3;
- (id)downloadForMediaItem:(id)a3;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadVariants:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
- (void)initializeWithDownloadingMediaItems:(id)a3;
- (void)registerDownloadTask:(id)a3 forDownload:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDownloadSession:(id)a3;
- (void)setTaskIDsToDownloads:(id)a3;
- (void)unregisterDownloadTaskForDownload:(id)a3;
@end

@implementation TVPDownloadSession

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setDownloadSession:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_4;
  v5[3] = &unk_264CC6560;
  v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 getAllTasksWithCompletionHandler:v5];
}

- (void)setDownloadSession:(id)a3
{
}

uint64_t __36__TVPDownloadSession_sharedInstance__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "TVPDownloadSession");
  v1 = (void *)sLogObject_3;
  sLogObject_3 = (uint64_t)v0;

  sharedInstance_instance = objc_alloc_init(TVPDownloadSession);
  return MEMORY[0x270F9A758]();
}

- (TVPDownloadSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVPDownloadSession;
  v2 = [(TVPDownloadSession *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    taskIDsToDownloads = v2->_taskIDsToDownloads;
    v2->_taskIDsToDownloads = v3;
  }
  return v2;
}

+ (TVPDownloadSession)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_instance;
  return (TVPDownloadSession *)v2;
}

- (void)initializeWithDownloadingMediaItems:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke;
  v7[3] = &unk_264CC5B18;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  uint64_t v5 = initializeWithDownloadingMediaItems__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&initializeWithDownloadingMediaItems__onceToken, v7);
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = dispatch_queue_create("com.apple.TVPBackgroundDownloadSession", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_2;
  block[3] = &unk_264CC6538;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  block[5] = WeakRetained;
  id v6 = v4;
  dispatch_async(v3, block);
}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_2(void *a1)
{
  v2 = [MEMORY[0x263F08C00] backgroundSessionConfigurationWithIdentifier:@"com.apple.TVPlayback Video download background session"];
  id v3 = (void *)MEMORY[0x263EFA4A0];
  uint64_t v4 = a1[4];
  uint64_t v5 = [MEMORY[0x263F08A48] mainQueue];
  id v6 = [v3 sessionWithConfiguration:v2 assetDownloadDelegate:v4 delegateQueue:v5];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_3;
  block[3] = &unk_264CC6538;
  uint64_t v7 = (void *)a1[6];
  block[4] = a1[5];
  id v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_5;
  v5[3] = &unk_264CC6538;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 40);
  id v4 = v3;
  TVPPerformBlockOnMainThreadIfNeeded(v5);
}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_5(id *a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v1 = (void *)sLogObject_3;
  if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = a1[4];
    id v3 = v1;
    *(_DWORD *)buf = 134217984;
    uint64_t v66 = [v2 count];
    _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to rebuild %lu downloading media item(s)", buf, 0xCu);
  }
  id v4 = (void *)sLogObject_3;
  if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a1[5];
    id v6 = v4;
    uint64_t v7 = [v5 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v66 = v7;
    _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "Found %lu existing download task(s)", buf, 0xCu);
  }
  id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
  v46 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:a1[5]];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v9 = a1[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "taskIdentifier"));
        [v8 setObject:v14 forKey:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v11);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = a1[4];
  uint64_t v16 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v57;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v57 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v56 + 1) + 8 * v19);
        v21 = [v20 mediaItemMetadataForProperty:@"TVPMediaItemMetadataDownloadTaskIdentifier"];
        if (!v21)
        {
          uint64_t v27 = sLogObject_3;
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v66 = (uint64_t)v20;
            v28 = v27;
            v29 = "No saved download task identifier exists for media item %@";
            goto LABEL_39;
          }
LABEL_28:
          v24 = 0;
          goto LABEL_32;
        }
        uint64_t v22 = [v8 objectForKey:v21];
        v23 = sLogObject_3;
        if (!v22)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v66 = (uint64_t)v20;
            v28 = v23;
            v29 = "No download task exists for media item %@";
LABEL_39:
            _os_log_error_impl(&dword_236FC5000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
          }
          goto LABEL_28;
        }
        v24 = (void *)v22;
        if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v66 = (uint64_t)v20;
          __int16 v67 = 2112;
          v68 = v24;
          _os_log_impl(&dword_236FC5000, v23, OS_LOG_TYPE_DEFAULT, "For previously downloading media item %@, found existing download task %@", buf, 0x16u);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v25 = [v24 URLAsset];
          v26 = sLogObject_3;
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v66 = (uint64_t)v25;
            _os_log_impl(&dword_236FC5000, v26, OS_LOG_TYPE_DEFAULT, "Download task's AVAsset is %@", buf, 0xCu);
          }
        }
        else
        {
          v30 = sLogObject_3;
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_236FC5000, v30, OS_LOG_TYPE_DEFAULT, "Weird, download task isn't of type AVAssetDownloadTask.  This shouldn't happen.  Allowing download to continue anyway.", buf, 2u);
          }
        }
        [v46 removeObject:v24];
LABEL_32:
        v31 = [[TVPDownload alloc] initWithMediaItem:v20 downloadSession:a1[6] existingDownloadTask:v24];
        [v48 addObject:v31];
        if (!v24)
        {
          v32 = sLogObject_3;
          if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR)) {
            __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_5_cold_1(&v54, v55, v32);
          }
          v33 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"TVPlaybackErrorDomain" code:829 userInfo:0];
          [(TVPDownload *)v31 setStartError:v33];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v34 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
      uint64_t v17 = v34;
    }
    while (v34);
  }

  v35 = (void *)sLogObject_3;
  if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v35;
    uint64_t v37 = [v46 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v66 = v37;
    _os_log_impl(&dword_236FC5000, v36, OS_LOG_TYPE_DEFAULT, "Found %lu task(s) that don't belong to any media items", buf, 0xCu);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v38 = v46;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        v44 = sLogObject_3;
        if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v66 = (uint64_t)v43;
          _os_log_impl(&dword_236FC5000, v44, OS_LOG_TYPE_DEFAULT, "Cancelling leftover task %@", buf, 0xCu);
        }
        [v43 cancel];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v40);
  }

  v45 = [a1[6] delegate];
  [v45 downloadSession:a1[6] didAddRestoredDownloads:v48];
}

- (TVPDownloadSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVPDownloadSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)downloadForMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = [[TVPDownload alloc] initWithMediaItem:v4 downloadSession:self existingDownloadTask:0];

  return v5;
}

- (id)assetDownloadTaskWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(TVPDownloadSession *)self downloadSession];
  id v6 = [v5 assetDownloadTaskWithConfiguration:v4];

  return v6;
}

- (void)registerDownloadTask:(id)a3 forDownload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "taskIdentifier"));
    uint64_t v10 = [(TVPDownloadSession *)self taskIDsToDownloads];
    uint64_t v11 = [v10 objectForKey:v9];

    if (v11)
    {
      uint64_t v12 = sLogObject_3;
      if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR)) {
        -[TVPDownloadSession registerDownloadTask:forDownload:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    else
    {
      v28 = [(TVPDownloadSession *)self taskIDsToDownloads];
      [v28 setObject:v8 forKey:v9];
    }
  }
  else
  {
    v20 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR)) {
      -[TVPDownloadSession registerDownloadTask:forDownload:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

- (void)unregisterDownloadTaskForDownload:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__2;
    uint64_t v24 = __Block_byref_object_dispose__2;
    id v25 = 0;
    id v5 = [(TVPDownloadSession *)self taskIDsToDownloads];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __56__TVPDownloadSession_unregisterDownloadTaskForDownload___block_invoke;
    v17[3] = &unk_264CC6588;
    id v18 = v4;
    uint64_t v19 = &v20;
    [v5 enumerateKeysAndObjectsUsingBlock:v17];

    if (v21[5])
    {
      id v6 = [(TVPDownloadSession *)self taskIDsToDownloads];
      [v6 removeObjectForKey:v21[5]];
    }
    else
    {
      uint64_t v15 = sLogObject_3;
      if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_236FC5000, v15, OS_LOG_TYPE_DEFAULT, "Unable to unregister task for download because no task is registered for it", v16, 2u);
      }
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v7 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_ERROR)) {
      -[TVPDownloadSession unregisterDownloadTaskForDownload:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

void __56__TVPDownloadSession_unregisterDownloadTaskForDownload___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a3;
  uint64_t v10 = [v8 mediaItem];
  uint64_t v11 = [v9 mediaItem];

  LODWORD(v9) = [v10 isEqualToMediaItem:v11];
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__TVPDownloadSession_URLSession_assetDownloadTask_willDownloadToURL___block_invoke;
  v15[3] = &unk_264CC5A28;
  objc_copyWeak(v19, &location);
  id v12 = v10;
  id v16 = v12;
  v19[1] = (id)a2;
  id v13 = v9;
  id v17 = v13;
  id v14 = v11;
  id v18 = v14;
  TVPPerformBlockOnMainThreadIfNeeded(v15);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __69__TVPDownloadSession_URLSession_assetDownloadTask_willDownloadToURL___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained taskIDsToDownloads];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  id v5 = [v3 objectForKey:v4];

  if (v5)
  {
    if ([v5 conformsToProtocol:&unk_26EA2C0F8]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v5 URLSession:*(void *)(a1 + 40) assetDownloadTask:*(void *)(a1 + 32) willDownloadToURL:*(void *)(a1 + 48)];
    }
  }
  else
  {
    id v6 = (void *)sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(const char **)(a1 + 64);
      uint64_t v8 = v6;
      id v9 = NSStringFromSelector(v7);
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find download for task in %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadVariants:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__TVPDownloadSession_URLSession_assetDownloadTask_willDownloadVariants___block_invoke;
  v15[3] = &unk_264CC5A28;
  objc_copyWeak(v19, &location);
  id v12 = v10;
  id v16 = v12;
  v19[1] = (id)a2;
  id v13 = v9;
  id v17 = v13;
  id v14 = v11;
  id v18 = v14;
  TVPPerformBlockOnMainThreadIfNeeded(v15);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __72__TVPDownloadSession_URLSession_assetDownloadTask_willDownloadVariants___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained taskIDsToDownloads];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  id v5 = [v3 objectForKey:v4];

  if (v5)
  {
    if ([v5 conformsToProtocol:&unk_26EA2C088]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v5 URLSession:*(void *)(a1 + 40) assetDownloadTask:*(void *)(a1 + 32) willDownloadVariants:*(void *)(a1 + 48)];
    }
  }
  else
  {
    id v6 = (void *)sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(const char **)(a1 + 64);
      uint64_t v8 = v6;
      id v9 = NSStringFromSelector(v7);
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find download for task in %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __114__TVPDownloadSession_URLSession_assetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke;
  v21[3] = &unk_264CC65B0;
  objc_copyWeak(v25, &location);
  id v16 = v14;
  id v22 = v16;
  v25[1] = (id)a2;
  id v17 = v13;
  id v23 = v17;
  long long v18 = *(_OWORD *)&a5->var0.var3;
  long long v26 = *(_OWORD *)&a5->var0.var0;
  long long v27 = v18;
  long long v28 = *(_OWORD *)&a5->var1.var1;
  id v19 = v15;
  id v24 = v19;
  long long v20 = *(_OWORD *)&a7->var0.var3;
  long long v29 = *(_OWORD *)&a7->var0.var0;
  long long v30 = v20;
  long long v31 = *(_OWORD *)&a7->var1.var1;
  TVPPerformBlockOnMainThreadIfNeeded(v21);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __114__TVPDownloadSession_URLSession_assetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained taskIDsToDownloads];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  id v5 = [v3 objectForKey:v4];

  if (v5)
  {
    if ([v5 conformsToProtocol:&unk_26EA2C088]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      long long v9 = *(_OWORD *)(a1 + 88);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 72);
      long long v17 = v9;
      long long v18 = *(_OWORD *)(a1 + 104);
      long long v10 = *(_OWORD *)(a1 + 136);
      v15[0] = *(_OWORD *)(a1 + 120);
      v15[1] = v10;
      v15[2] = *(_OWORD *)(a1 + 152);
      [v5 URLSession:v6 assetDownloadTask:v7 didLoadTimeRange:buf totalTimeRangesLoaded:v8 timeRangeExpectedToLoad:v15];
    }
  }
  else
  {
    id v11 = (void *)sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(const char **)(a1 + 64);
      id v13 = v11;
      id v14 = NSStringFromSelector(v12);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Unable to find download for task in %@", buf, 0xCu);
    }
  }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = (void *)sLogObject_3;
  if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    long long v10 = v7;
    _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "Received %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__TVPDownloadSession_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke;
  block[3] = &unk_264CC5470;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__TVPDownloadSession_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"TVPDownloadSessionDidFinishEventsForBackgroundURLSessionNotification" object:*(void *)(a1 + 32)];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__TVPDownloadSession_URLSession_task_didCompleteWithError___block_invoke;
  _OWORD v15[3] = &unk_264CC5A28;
  objc_copyWeak(v19, &location);
  id v12 = v10;
  id v16 = v12;
  v19[1] = (id)a2;
  id v13 = v9;
  id v17 = v13;
  id v14 = v11;
  id v18 = v14;
  TVPPerformBlockOnMainThreadIfNeeded(v15);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __59__TVPDownloadSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained taskIDsToDownloads];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  id v5 = [v3 objectForKey:v4];

  if (v5)
  {
    if ([v5 conformsToProtocol:&unk_26EA2C088]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v5 URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 48)];
    }
  }
  else
  {
    uint64_t v6 = (void *)sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(const char **)(a1 + 64);
      uint64_t v8 = v6;
      id v9 = NSStringFromSelector(v7);
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find download for task in %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (NSMutableDictionary)taskIDsToDownloads
{
  return self->_taskIDsToDownloads;
}

- (void)setTaskIDsToDownloads:(id)a3
{
}

- (AVAssetDownloadURLSession)downloadSession
{
  return self->_downloadSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadSession, 0);
  objc_storeStrong((id *)&self->_taskIDsToDownloads, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__TVPDownloadSession_initializeWithDownloadingMediaItems___block_invoke_5_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_236FC5000, log, OS_LOG_TYPE_ERROR, "Will fail download when started since does no download task exists", buf, 2u);
}

- (void)registerDownloadTask:(uint64_t)a3 forDownload:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerDownloadTask:(uint64_t)a3 forDownload:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unregisterDownloadTaskForDownload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end