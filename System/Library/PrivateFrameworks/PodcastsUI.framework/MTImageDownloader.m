@interface MTImageDownloader
- (BOOL)_completeUsingExistingDownloadedImageForUuid:(id)a3 imageUrl:(id)a4;
- (BOOL)_shouldDiscardTransparency;
- (BOOL)hasPurgedTemporaryResourcesDirectory;
- (MTImageDownloader)init;
- (MTImageStore)imageStore;
- (NSMutableDictionary)clientRequestsByUrl;
- (OS_dispatch_queue)imageWorkQueue;
- (OS_dispatch_queue)syncQueue;
- (double)_urlSessionResourceTimeout;
- (id)_clientRequestsForUrl:(id)a3;
- (id)_keyForImageDownloaderTempFilename:(id)a3;
- (id)_temporaryImagePathByCopyingDownloadedContent:(id)a3 uuid:(id)a4 error:(id *)a5;
- (id)_temporaryImagePathForDownloadedImageWithUuid:(id)a3;
- (id)_temporaryResourcesDirectory;
- (int64_t)_enqueueClientInfoWithUrl:(id)a3 key:(id)a4 podcastUuid:(id)a5 completion:(id)a6;
- (void)_dequeueClientRequests:(id)a3;
- (void)_downloadImageUrl:(id)a3 cacheKey:(id)a4 podcastUuid:(id)a5 userInitiated:(BOOL)a6 backgroundFetch:(BOOL)a7 callback:(id)a8;
- (void)_finishProcessingClientRequests:(id)a3 originalUrl:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)_onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary;
- (void)_processFinishedDownloadWithContentURL:(id)a3 originalUrl:(id)a4 actualRequestUrl:(id)a5 finishedWithContentHandler:(id)a6 processedKeys:(id)a7;
- (void)_saveArtworkImageUrl:(id)a3 forPodcastUuids:(id)a4 logHeader:(id)a5;
- (void)cleanupTemporaryResourcesDirectoryIfNecessary;
- (void)configureSession:(id)a3;
- (void)downloadImageForPodcastUuid:(id)a3 urlOptions:(id)a4 userInitiated:(BOOL)a5 useBackgroundFetch:(BOOL)a6;
- (void)downloadImageForPodcastUuid:(id)a3 urlOptions:(id)a4 userInitiated:(BOOL)a5 useBackgroundFetch:(BOOL)a6 callback:(id)a7;
- (void)downloadImageForPodcastUuid:(id)a3 userInitiated:(BOOL)a4 backgroundFetch:(BOOL)a5 callback:(id)a6;
- (void)downloadImageUrl:(id)a3 cacheKey:(id)a4 userInitiated:(BOOL)a5 backgroundFetch:(BOOL)a6;
- (void)downloadImageUrl:(id)a3 cacheKey:(id)a4 userInitiated:(BOOL)a5 backgroundFetch:(BOOL)a6 callback:(id)a7;
- (void)downloadImageUrl:(id)a3 cacheKey:(id)a4 userInitiated:(BOOL)a5 callback:(id)a6;
- (void)setClientRequestsByUrl:(id)a3;
- (void)setHasPurgedTemporaryResourcesDirectory:(BOOL)a3;
- (void)setImageStore:(id)a3;
- (void)setImageWorkQueue:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)task:(id)a3 didCompleteWithDownloadedContentUrl:(id)a4;
- (void)task:(id)a3 didFailWithError:(id)a4 orStatusCode:(int64_t)a5;
@end

@implementation MTImageDownloader

- (void)cleanupTemporaryResourcesDirectoryIfNecessary
{
  v3 = [(MTImageDownloader *)self imageWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MTImageDownloader_cleanupTemporaryResourcesDirectoryIfNecessary__block_invoke;
  block[3] = &unk_1E6E1FAA8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)imageWorkQueue
{
  return self->_imageWorkQueue;
}

- (MTImageDownloader)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTImageDownloader;
  v2 = [(MTURLSessionManager *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(MTImageDownloader *)v2 setClientRequestsByUrl:v3];

    dispatch_queue_t v4 = dispatch_queue_create(0, 0);
    [(MTImageDownloader *)v2 setSyncQueue:v4];

    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    [(MTImageDownloader *)v2 setImageWorkQueue:v7];

    v8 = +[MTImageStore defaultStore];
    [(MTImageDownloader *)v2 setImageStore:v8];

    [(MTImageDownloader *)v2 setHasPurgedTemporaryResourcesDirectory:0];
  }
  return v2;
}

- (void)setSyncQueue:(id)a3
{
}

- (void)setImageWorkQueue:(id)a3
{
}

- (void)setImageStore:(id)a3
{
}

- (void)setClientRequestsByUrl:(id)a3
{
}

uint64_t __66__MTImageDownloader_cleanupTemporaryResourcesDirectoryIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary];
}

- (void)_onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (![(MTImageDownloader *)self hasPurgedTemporaryResourcesDirectory])
  {
    [(MTImageDownloader *)self setHasPurgedTemporaryResourcesDirectory:1];
    id v3 = [(MTImageDownloader *)self _temporaryResourcesDirectory];
    dispatch_queue_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [v4 subpathsAtPath:v3];

    if ([v5 count])
    {
      id v6 = _MTLogCategoryArtworkDownload();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E3BC5000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning temporary resources directory", buf, 2u);
      }

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke;
      v38[3] = &unk_1E6E20298;
      v38[4] = self;
      dispatch_queue_t v7 = objc_msgSend(v5, "mt_compactMap:", v38);
      v8 = [MEMORY[0x1E4F1CA60] dictionary];
      v9 = [MEMORY[0x1E4F91F60] sharedInstance];
      objc_super v10 = [v9 privateQueueContext];

      *(void *)buf = 0;
      v35 = buf;
      uint64_t v36 = 0x2020000000;
      char v37 = 0;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_2;
      v29[3] = &unk_1E6E202C0;
      id v11 = v7;
      id v30 = v11;
      id v12 = v10;
      id v31 = v12;
      v33 = buf;
      id v13 = v8;
      id v32 = v13;
      [v12 performBlockAndWait:v29];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_3;
      v27[3] = &unk_1E6E202E8;
      v27[4] = self;
      id v14 = v13;
      id v28 = v14;
      [v14 enumerateKeysAndObjectsUsingBlock:v27];
      v15 = [v14 allKeys];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_4;
      v24[3] = &unk_1E6E20310;
      v24[4] = self;
      id v16 = v15;
      id v25 = v16;
      id v26 = v3;
      [v5 enumerateObjectsUsingBlock:v24];
      if ([v16 count])
      {
        v17 = _MTLogCategoryArtworkDownload();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = [v16 count];
          *(_DWORD *)v39 = 67109378;
          int v40 = v18;
          __int16 v41 = 2112;
          id v42 = v16;
          _os_log_impl(&dword_1E3BC5000, v17, OS_LOG_TYPE_DEFAULT, "Found %d reusable orphaned items for podcasts without cached artwork:  %@", v39, 0x12u);
        }
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_80;
      v20[3] = &unk_1E6E20338;
      id v19 = v14;
      v22 = self;
      v23 = buf;
      id v21 = v19;
      [v16 enumerateObjectsUsingBlock:v20];

      _Block_object_dispose(buf, 8);
    }
  }
}

- (void)setHasPurgedTemporaryResourcesDirectory:(BOOL)a3
{
  self->_hasPurgedTemporaryResourcesDirectory = a3;
}

- (BOOL)hasPurgedTemporaryResourcesDirectory
{
  return self->_hasPurgedTemporaryResourcesDirectory;
}

- (id)_temporaryResourcesDirectory
{
  v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"MTImageDownloader"];

  return v3;
}

- (void)downloadImageForPodcastUuid:(id)a3 userInitiated:(BOOL)a4 backgroundFetch:(BOOL)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if ([MEMORY[0x1E4F91FC8] supportsImageStore] && objc_msgSend(v10, "length"))
  {
    id v12 = [MEMORY[0x1E4F91F60] sharedInstance];
    id v13 = [v12 privateQueueContext];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__MTImageDownloader_downloadImageForPodcastUuid_userInitiated_backgroundFetch_callback___block_invoke;
    v15[3] = &unk_1E6E20030;
    id v16 = v13;
    id v17 = v10;
    int v18 = self;
    BOOL v20 = a4;
    BOOL v21 = a5;
    id v19 = v11;
    id v14 = v13;
    [v14 performBlock:v15];
  }
}

void __88__MTImageDownloader_downloadImageForPodcastUuid_userInitiated_backgroundFetch_callback___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 requestsAreNonAppInitiated];
  id v3 = [v5 imageURL];
  if ([v3 length])
  {
    dispatch_queue_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F91FE0]) init:v3 nonAppInitiated:v2];
    [*(id *)(a1 + 48) downloadImageForPodcastUuid:*(void *)(a1 + 40) urlOptions:v4 userInitiated:*(unsigned __int8 *)(a1 + 64) useBackgroundFetch:*(unsigned __int8 *)(a1 + 65) callback:*(void *)(a1 + 56)];
  }
}

- (void)downloadImageForPodcastUuid:(id)a3 urlOptions:(id)a4 userInitiated:(BOOL)a5 useBackgroundFetch:(BOOL)a6 callback:(id)a7
{
}

- (void)downloadImageForPodcastUuid:(id)a3 urlOptions:(id)a4 userInitiated:(BOOL)a5 useBackgroundFetch:(BOOL)a6
{
}

- (void)downloadImageUrl:(id)a3 cacheKey:(id)a4 userInitiated:(BOOL)a5 backgroundFetch:(BOOL)a6 callback:(id)a7
{
}

- (void)downloadImageUrl:(id)a3 cacheKey:(id)a4 userInitiated:(BOOL)a5 callback:(id)a6
{
}

- (void)downloadImageUrl:(id)a3 cacheKey:(id)a4 userInitiated:(BOOL)a5 backgroundFetch:(BOOL)a6
{
}

- (void)_downloadImageUrl:(id)a3 cacheKey:(id)a4 podcastUuid:(id)a5 userInitiated:(BOOL)a6 backgroundFetch:(BOOL)a7 callback:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if ([MEMORY[0x1E4F91FC8] supportsImageStore])
  {
    BOOL v26 = v9;
    [(MTImageDownloader *)self cleanupTemporaryResourcesDirectoryIfNecessary];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__MTImageDownloader__downloadImageUrl_cacheKey_podcastUuid_userInitiated_backgroundFetch_callback___block_invoke;
    aBlock[3] = &unk_1E6E20000;
    id v18 = v17;
    id v30 = v18;
    id v19 = _Block_copy(aBlock);
    BOOL v20 = [v14 url];
    BOOL v21 = [v20 absoluteString];

    if ([v21 length])
    {
      int64_t v22 = [(MTImageDownloader *)self _enqueueClientInfoWithUrl:v21 key:v15 podcastUuid:v16 completion:v18];
      if (v22 == 2)
      {
        v24 = _MTLogCategoryArtworkDownload();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v16;
          __int16 v33 = 2112;
          v34 = v21;
          _os_log_impl(&dword_1E3BC5000, v24, OS_LOG_TYPE_DEFAULT, "download request - appended callback to already running download task (uuid=%@, imageUrl=%@)", buf, 0x16u);
        }

        goto LABEL_17;
      }
      if (v22 == 1)
      {
        id v25 = _MTLogCategoryArtworkDownload();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v16;
          __int16 v33 = 2112;
          v34 = v21;
          _os_log_impl(&dword_1E3BC5000, v25, OS_LOG_TYPE_DEFAULT, "download request - started download task (uuid=%@, imageUrl=%@)", buf, 0x16u);
        }

        if (![(MTImageDownloader *)self _completeUsingExistingDownloadedImageForUuid:v16 imageUrl:v21])
        {
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __99__MTImageDownloader__downloadImageUrl_cacheKey_podcastUuid_userInitiated_backgroundFetch_callback___block_invoke_19;
          v27[3] = &unk_1E6E20058;
          id v28 = v19;
          [(MTURLSessionManager *)self startDownloadTaskForURL:v14 userInitiated:v10 useBackgroundFetch:v26 usePrivatePath:0 downloadStartedBlock:v27];
        }
        goto LABEL_17;
      }
      if (v22)
      {
LABEL_17:

        goto LABEL_18;
      }
      v23 = _MTLogCategoryArtworkDownload();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v32 = v16;
        __int16 v33 = 2112;
        v34 = v21;
        _os_log_impl(&dword_1E3BC5000, v23, OS_LOG_TYPE_ERROR, "download request error - unable to enqueue request (uuid=%@, imageUrl=%@)", buf, 0x16u);
      }
    }
    (*((void (**)(void *, void))v19 + 2))(v19, 0);
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __99__MTImageDownloader__downloadImageUrl_cacheKey_podcastUuid_userInitiated_backgroundFetch_callback___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __99__MTImageDownloader__downloadImageUrl_cacheKey_podcastUuid_userInitiated_backgroundFetch_callback___block_invoke_19(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (BOOL)_completeUsingExistingDownloadedImageForUuid:(id)a3 imageUrl:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F91FC8] supportsImageStore])
  {
    v8 = [(MTImageDownloader *)self _temporaryImagePathForDownloadedImageWithUuid:v6];
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
      if (v9)
      {
        BOOL v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v11 = [v9 path];
        int v12 = [v10 fileExistsAtPath:v11];

        if (v12)
        {
          id v13 = _MTLogCategoryArtworkDownload();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [v9 path];
            *(_DWORD *)buf = 138412802;
            id v23 = v6;
            __int16 v24 = 2112;
            id v25 = v7;
            __int16 v26 = 2112;
            v27 = v14;
            _os_log_impl(&dword_1E3BC5000, v13, OS_LOG_TYPE_DEFAULT, "didComplete download - Using orphaned downloaded image results (uuid = %@, imageUrl = %@, contentPath = %@)", buf, 0x20u);
          }
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __75__MTImageDownloader__completeUsingExistingDownloadedImageForUuid_imageUrl___block_invoke;
          v18[3] = &unk_1E6E1FCA8;
          id v19 = v6;
          id v20 = v7;
          id v9 = v9;
          id v21 = v9;
          id v15 = [MEMORY[0x1E4F1CA80] set];
          [(MTImageDownloader *)self _processFinishedDownloadWithContentURL:v9 originalUrl:v20 actualRequestUrl:v20 finishedWithContentHandler:v18 processedKeys:v15];

          BOOL v16 = 1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      id v9 = 0;
    }
    BOOL v16 = 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

void __75__MTImageDownloader__completeUsingExistingDownloadedImageForUuid_imageUrl___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "didComplete download - Did finish processing image, cleaning up temporary file (uuid = %@, imageUrl = %@)", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v5 removeItemAtURL:a1[6] error:0];
}

- (void)configureSession:(id)a3
{
  id v4 = a3;
  [v4 setTimeoutIntervalForRequest:120.0];
  [(MTImageDownloader *)self _urlSessionResourceTimeout];
  objc_msgSend(v4, "setTimeoutIntervalForResource:");
  [v4 setRequestCachePolicy:0];
}

- (void)task:(id)a3 didFailWithError:(id)a4 orStatusCode:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(id)objc_opt_class() originalURLForTask:v8];

  uint64_t v10 = [v9 absoluteString];

  id v11 = [(MTImageDownloader *)self _clientRequestsForUrl:v10];
  int v12 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412802;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_1E3BC5000, v12, OS_LOG_TYPE_ERROR, "didFailWithError with error = %@.  originalUrl = %@, clientRequests = %@", (uint8_t *)&v14, 0x20u);
  }

  id v13 = MTImageDownloadErrorWithUnderlyingError(5, @"URL Session", v7);

  [(MTImageDownloader *)self _finishProcessingClientRequests:v11 originalUrl:v10 success:0 error:v13];
}

- (void)task:(id)a3 didCompleteWithDownloadedContentUrl:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() originalURLForTask:v6];
  uint64_t v9 = [v8 absoluteString];

  uint64_t v10 = [v6 response];
  id v11 = [v10 URL];
  int v12 = [v11 absoluteString];

  id v13 = [(MTImageDownloader *)self _clientRequestsForUrl:v9];
  if ([v13 count])
  {
    uint64_t v14 = [(id)objc_opt_class() statusCodeForTask:v6];
    if (v14 == 200)
    {
      id v21 = [v13 firstObject];
      uint64_t v22 = [v21 uuid];

      id v44 = 0;
      v39 = (void *)v22;
      id v23 = [(MTImageDownloader *)self _temporaryImagePathByCopyingDownloadedContent:v7 uuid:v22 error:&v44];
      id v30 = v44;
      if (v23)
      {
        id v38 = v7;
        id v31 = _MTLogCategoryArtworkDownload();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v23 path];
          *(_DWORD *)buf = 138412802;
          v46 = v9;
          __int16 v47 = 2112;
          v48 = v32;
          __int16 v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1E3BC5000, v31, OS_LOG_TYPE_DEFAULT, "didComplete download - Will begin processing (originalUrl = %@, contentPath = %@, clientRequests = %@)", buf, 0x20u);
        }
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __62__MTImageDownloader_task_didCompleteWithDownloadedContentUrl___block_invoke;
        v40[3] = &unk_1E6E1FCA8;
        __int16 v41 = v9;
        id v42 = v13;
        id v43 = v23;
        __int16 v33 = [MEMORY[0x1E4F1CA80] set];
        [(MTImageDownloader *)self _processFinishedDownloadWithContentURL:v43 originalUrl:v41 actualRequestUrl:v12 finishedWithContentHandler:v40 processedKeys:v33];

        v34 = v41;
        id v7 = v38;
      }
      else
      {
        v34 = MTImageDownloadErrorWithCode(4, @"unable to copy downloaded content", v24, v25, v26, v27, v28, v29, v37);
        uint64_t v36 = _MTLogCategoryArtworkDownload();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v46 = v34;
          __int16 v47 = 2112;
          v48 = v9;
          __int16 v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1E3BC5000, v36, OS_LOG_TYPE_ERROR, "didComplete download encountered error creating temp file (error = %@, originalUrl = %@, clientRequests = %@)", buf, 0x20u);
        }

        [(MTImageDownloader *)self _finishProcessingClientRequests:v13 originalUrl:v9 success:0 error:v34];
      }
    }
    else
    {
      id v30 = MTImageDownloadErrorWithCode(3, @"bad server response (status = %ld)", v15, v16, v17, v18, v19, v20, v14);
      uint64_t v35 = _MTLogCategoryArtworkDownload();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v46 = v30;
        __int16 v47 = 2112;
        v48 = v9;
        __int16 v49 = 2112;
        v50 = v13;
        _os_log_impl(&dword_1E3BC5000, v35, OS_LOG_TYPE_ERROR, "didComplete download encountered HTTP error = %@ (originalUrl = %@, clientRequests = %@)", buf, 0x20u);
      }

      [(MTImageDownloader *)self _finishProcessingClientRequests:v13 originalUrl:v9 success:0 error:v30];
    }
  }
  else
  {
    id v30 = _MTLogCategoryArtworkDownload();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v9;
      __int16 v47 = 2112;
      v48 = v13;
      _os_log_impl(&dword_1E3BC5000, v30, OS_LOG_TYPE_ERROR, "didComplete download, but no clients remain (originalUrl = %@, clientRequests = %@)", buf, 0x16u);
    }
  }
}

void __62__MTImageDownloader_task_didCompleteWithDownloadedContentUrl___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "didComplete download - Did finish processing, cleaning up temporary file (originalUrl = %@, clientRequests = %@)", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v5 removeItemAtURL:a1[6] error:0];
}

- (void)_processFinishedDownloadWithContentURL:(id)a3 originalUrl:(id)a4 actualRequestUrl:(id)a5 finishedWithContentHandler:(id)a6 processedKeys:(id)a7
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v12 = a4;
  id v63 = a5;
  id v13 = a6;
  id v14 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke;
  aBlock[3] = &unk_1E6E1FB48;
  id v61 = v13;
  id v97 = v61;
  uint64_t v15 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v16 = [v14 count];
  uint64_t v17 = @"processFinishedDownload (secondary-phase): ";
  if (!v16) {
    uint64_t v17 = @"processFinishedDownload (initial-phase): ";
  }
  v65 = v17;
  v64 = [(MTImageDownloader *)self imageStore];
  uint64_t v18 = [(MTImageDownloader *)self _clientRequestsForUrl:v12];
  if ([v18 count])
  {
    if (v12)
    {
      uint64_t v25 = objc_msgSend(v18, "mt_compactMap:", &__block_literal_global_9);
      v60 = (void *)[v25 mutableCopy];

      if ([v60 count])
      {
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v99 = 0;
        id v32 = dispatch_group_create();
        dispatch_group_enter(v32);
        BOOL v33 = [(MTImageDownloader *)self _shouldDiscardTransparency];
        v34 = objc_msgSend(v60, "mt_compactMap:", &__block_literal_global_50);
        uint64_t v35 = objc_msgSend(v34, "mt_uniqued");

        uint64_t v36 = objc_msgSend(v60, "mt_compactMap:", &__block_literal_global_52_0);
        uint64_t v37 = objc_msgSend(v36, "mt_uniqued");

        id v38 = [(MTImageDownloader *)self imageWorkQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_3;
        block[3] = &unk_1E6E200E8;
        v59 = v65;
        v85 = v59;
        id v54 = v35;
        id v86 = v54;
        id v57 = v37;
        id v87 = v57;
        id v56 = v14;
        id v88 = v56;
        id v39 = v64;
        id v89 = v39;
        BOOL v95 = v33;
        v94 = buf;
        id v55 = v62;
        id v90 = v55;
        v91 = self;
        id v58 = v63;
        id v92 = v58;
        int v40 = v32;
        v93 = v40;
        dispatch_async(v38, block);

        __int16 v41 = v40;
        if ([MEMORY[0x1E4F91FC8] isRunningOnTV])
        {
          group = v40;
          id v42 = dispatch_group_create();
          dispatch_group_enter(v42);
          id v43 = [(MTImageDownloader *)self imageWorkQueue];
          v75[0] = MEMORY[0x1E4F143A8];
          v75[1] = 3221225472;
          v75[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_54;
          v75[3] = &unk_1E6E20110;
          v83 = buf;
          id v76 = v60;
          id v77 = v39;
          v78 = v59;
          v79 = self;
          id v80 = v58;
          id v81 = v57;
          id v44 = v42;
          v82 = v44;
          dispatch_block_t v45 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, -15, v75);
          __int16 v41 = group;
          dispatch_group_notify(group, v43, v45);

          int v40 = v44;
        }
        v46 = [(MTImageDownloader *)self imageWorkQueue];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_60;
        v66[3] = &unk_1E6E20188;
        id v67 = v18;
        v68 = v59;
        v69 = self;
        id v70 = v12;
        id v71 = v56;
        id v72 = v55;
        id v73 = v58;
        v74 = v15;
        dispatch_group_notify(v40, v46, v66);

        _Block_object_dispose(buf, 8);
      }
      else
      {
        v50 = MTImageDownloadErrorWithCode(2, @"download finished, but no keysToProcess", v26, v27, v28, v29, v30, v31, v52);
        uint64_t v51 = _MTLogCategoryArtworkDownload();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v65;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v12;
          _os_log_impl(&dword_1E3BC5000, v51, OS_LOG_TYPE_ERROR, "%@ unexpected error - no client with a valid key (originalUrl = %@)", buf, 0x16u);
        }

        [(MTImageDownloader *)self _finishProcessingClientRequests:v18 originalUrl:v12 success:0 error:v50];
        v15[2](v15);
      }
    }
    else
    {
      v48 = MTImageDownloadErrorWithCode(2, @"downloaded location not available", v19, v20, v21, v22, v23, v24, v52);
      __int16 v49 = _MTLogCategoryArtworkDownload();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v65;
        _os_log_impl(&dword_1E3BC5000, v49, OS_LOG_TYPE_ERROR, "%@ unexpected error - unable to determine originalUrl", buf, 0xCu);
      }

      [(MTImageDownloader *)self _finishProcessingClientRequests:v18 originalUrl:0 success:0 error:v48];
      v15[2](v15);
    }
  }
  else
  {
    __int16 v47 = _MTLogCategoryArtworkDownload();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v65;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1E3BC5000, v47, OS_LOG_TYPE_DEFAULT, "%@ exiting - no clients remain (originalUrl = %@)", buf, 0x16u);
    }

    v15[2](v15);
  }
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_42(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 key];
  if ([v3 length]) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_47(uint64_t a1, void *a2)
{
  return [a2 key];
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_3(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v24 = v3;
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "%@ will add-to-image-store (keys = %@, uuids = %@)", buf, 0x20u);
  }

  int v6 = *(void **)(a1 + 56);
  uint64_t v7 = [*(id *)(a1 + 40) allObjects];
  [v6 addObjectsFromArray:v7];

  __int16 v8 = *(void **)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 112);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_53;
  v15[3] = &unk_1E6E200C0;
  uint64_t v22 = *(void *)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 40);
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 80);
  id v14 = *(void **)(a1 + 88);
  id v18 = v12;
  uint64_t v19 = v13;
  id v20 = v14;
  id v21 = *(id *)(a1 + 96);
  [v8 addImagesWithSourceUrl:v9 forKeys:v11 removeOldItems:1 discardTransparency:v10 completion:v15];
}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_53(uint64_t a1, char a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a2;
  uint64_t v3 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "%@ finished add-to-image-store (keys = %@, uuids = %@)", (uint8_t *)&v7, 0x20u);
  }

  if (([MEMORY[0x1E4F91FC8] isRunningOnTV] & 1) == 0) {
    [*(id *)(a1 + 56) _saveArtworkImageUrl:*(void *)(a1 + 64) forPodcastUuids:*(void *)(a1 + 48) logHeader:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_54(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) && [*(id *)(a1 + 32) count])
  {
    id v2 = [MEMORY[0x1E4F1CA80] set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v27 = [v3 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v27)
    {
      uint64_t v4 = *(void *)v29;
      uint64_t v26 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v29 != v4) {
            objc_enumerationMutation(v3);
          }
          uint64_t v6 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          int v7 = [v6 uuid];
          uint64_t v8 = [v7 length];

          if (v8)
          {
            __int16 v9 = NSString;
            uint64_t v10 = [v6 key];
            __int16 v11 = [v6 uuid];
            uint64_t v12 = [v9 stringWithFormat:@"key=%@, uuid=%@", v10, v11];

            if (([v2 containsObject:v12] & 1) == 0)
            {
              uint64_t v13 = (void *)MEMORY[0x1E4E78AF0]();
              [v2 addObject:v12];
              id v14 = *(void **)(a1 + 40);
              uint64_t v15 = [v6 key];
              id v16 = [v14 imageForKey:v15];

              if (v16)
              {
                id v17 = _MTLogCategoryArtworkDownload();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v25 = v13;
                  id v18 = v3;
                  uint64_t v19 = v2;
                  uint64_t v20 = *(void *)(a1 + 48);
                  id v21 = [v6 uuid];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v33 = v20;
                  id v2 = v19;
                  id v3 = v18;
                  uint64_t v13 = v25;
                  __int16 v34 = 2112;
                  uint64_t v35 = v21;
                  _os_log_impl(&dword_1E3BC5000, v17, OS_LOG_TYPE_DEFAULT, "%@ analyzing image for uuid = %@", buf, 0x16u);
                }
                uint64_t v22 = +[MTSingleton sharedInstance];
                uint64_t v23 = [v6 uuid];
                id v24 = (id)[v22 addImage:v16 forKey:v23];

                uint64_t v4 = v26;
              }
            }
          }
        }
        uint64_t v27 = [v3 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v27);
    }
  }
  [*(id *)(a1 + 56) _saveArtworkImageUrl:*(void *)(a1 + 64) forPodcastUuids:*(void *)(a1 + 72) logHeader:*(void *)(a1 + 48)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_60(id *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = objc_msgSend(a1[4], "mt_compactMap:", &__block_literal_global_64);
  uint64_t v4 = [v2 setWithArray:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  int v7 = v6;

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  __int16 v9 = objc_msgSend(a1[4], "mt_compactMap:", &__block_literal_global_67);
  uint64_t v10 = [v8 setWithArray:v9];
  __int16 v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v13 = v12;

  if ([v7 count] || objc_msgSend(v13, "count"))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_4;
    block[3] = &unk_1E6E1FCA8;
    id v29 = a1[5];
    id v30 = v13;
    id v31 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  id v14 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = a1[5];
    *(_DWORD *)buf = 138412290;
    id v33 = v15;
    _os_log_impl(&dword_1E3BC5000, v14, OS_LOG_TYPE_DEFAULT, "%@ finished succesfully (...will attempt to process again to ensure no new requests came in...)", buf, 0xCu);
  }

  id v16 = [a1[6] _clientRequestsForUrl:a1[7]];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_70;
  v25[3] = &unk_1E6E20138;
  id v26 = a1[4];
  id v27 = a1[8];
  id v17 = objc_msgSend(v16, "mt_filter:", v25);

  [a1[6] _finishProcessingClientRequests:v17 originalUrl:a1[7] success:1 error:0];
  id v18 = dispatch_get_global_queue(0, 0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_2_72;
  v19[3] = &unk_1E6E20160;
  v19[4] = a1[6];
  id v20 = a1[9];
  id v21 = a1[7];
  id v22 = a1[10];
  id v24 = a1[11];
  id v23 = a1[8];
  dispatch_async(v18, v19);
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_2_62(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_3_65(uint64_t a1, void *a2)
{
  return [a2 key];
}

void __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_4(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "%@ posting notification (keys = %@, uuids = %@)", buf, 0x20u);
  }

  v9[0] = @"uuids";
  v9[1] = @"keys";
  uint64_t v6 = a1[5];
  v10[0] = a1[6];
  v10[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"kMTImageDownloaderArtworkDidLoadNotification" object:0 userInfo:v7];
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v3 key];
    uint64_t v4 = [v5 containsObject:v6];
  }
  return v4;
}

uint64_t __130__MTImageDownloader__processFinishedDownloadWithContentURL_originalUrl_actualRequestUrl_finishedWithContentHandler_processedKeys___block_invoke_2_72(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processFinishedDownloadWithContentURL:*(void *)(a1 + 40) originalUrl:*(void *)(a1 + 48) actualRequestUrl:*(void *)(a1 + 56) finishedWithContentHandler:*(void *)(a1 + 72) processedKeys:*(void *)(a1 + 64)];
}

- (void)_saveArtworkImageUrl:(id)a3 forPodcastUuids:(id)a4 logHeader:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F91F60] sharedInstance];
  __int16 v11 = [v10 mainOrPrivateContext];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__MTImageDownloader__saveArtworkImageUrl_forPodcastUuids_logHeader___block_invoke;
  v16[3] = &unk_1E6E201B0;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v20 = v7;
  id v12 = v7;
  id v13 = v11;
  id v14 = v9;
  id v15 = v8;
  [v13 performBlockAndWait:v16];
}

uint64_t __68__MTImageDownloader__saveArtworkImageUrl_forPodcastUuids_logHeader___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v8 = _MTLogCategoryArtworkDownload();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v9;
          __int16 v19 = 2112;
          uint64_t v20 = v7;
          _os_log_impl(&dword_1E3BC5000, v8, OS_LOG_TYPE_DEFAULT, "%@ updating DB (actualUrl, artNeedsUpdate=NO) for %@", buf, 0x16u);
        }

        uint64_t v10 = [*(id *)(a1 + 48) podcastForUuid:v7];
        __int16 v11 = v10;
        if (v10)
        {
          [v10 setImageURL:*(void *)(a1 + 56)];
          [v11 setNeedsArtworkUpdate:0];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 48) saveInCurrentBlock];
}

- (void)_finishProcessingClientRequests:(id)a3 originalUrl:(id)a4 success:(BOOL)a5 error:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_msgSend(v7, "mt_filter:", &__block_literal_global_74);
  [(MTImageDownloader *)self _dequeueClientRequests:v7];
  if ([v8 count])
  {
    id v21 = v8;
    id v22 = v7;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v15 = objc_msgSend(v14, "completion", v21, v22);
          if (v15)
          {
            long long v16 = [(MTImageDownloader *)self imageStore];
            id v17 = [v14 key];
            uint64_t v18 = [v16 imageForKey:v17];

            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __79__MTImageDownloader__finishProcessingClientRequests_originalUrl_success_error___block_invoke_2;
            block[3] = &unk_1E6E201F8;
            id v19 = v15;
            id v24 = v18;
            id v25 = v19;
            id v20 = v18;
            dispatch_async(MEMORY[0x1E4F14428], block);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }

    id v8 = v21;
    id v7 = v22;
  }
}

BOOL __79__MTImageDownloader__finishProcessingClientRequests_originalUrl_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 completion];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __79__MTImageDownloader__finishProcessingClientRequests_originalUrl_success_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int64_t)_enqueueClientInfoWithUrl:(id)a3 key:(id)a4 podcastUuid:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  if (![v10 length])
  {
    long long v14 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E3BC5000, v14, OS_LOG_TYPE_ERROR, "Invalid url specified", buf, 2u);
    }
  }
  if ([v10 length])
  {
    long long v15 = +[MTImageDownloadClientRequest requestForUrl:v10 key:v11 podcastUuid:v12 completion:v13];
    long long v16 = [(MTImageDownloader *)self syncQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__MTImageDownloader__enqueueClientInfoWithUrl_key_podcastUuid_completion___block_invoke;
    v20[3] = &unk_1E6E20220;
    void v20[4] = self;
    id v21 = v10;
    id v22 = v15;
    id v23 = &v25;
    id v17 = v15;
    dispatch_sync(v16, v20);

    int64_t v18 = v26[3];
  }
  else
  {
    int64_t v18 = v26[3];
  }
  _Block_object_dispose(&v25, 8);

  return v18;
}

void __74__MTImageDownloader__enqueueClientInfoWithUrl_key_podcastUuid_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) clientRequestsByUrl];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = (void *)v3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    uint64_t v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = [v6 arrayByAddingObject:*(void *)(a1 + 48)];

  uint64_t v8 = [v7 count];
  uint64_t v9 = 1;
  if (v8 != 1) {
    uint64_t v9 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
  id v10 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    int v13 = 138412290;
    uint64_t v14 = v11;
    _os_log_impl(&dword_1E3BC5000, v10, OS_LOG_TYPE_DEFAULT, "adding request to image download queue: %@", (uint8_t *)&v13, 0xCu);
  }

  id v12 = [*(id *)(a1 + 32) clientRequestsByUrl];
  [v12 setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)_clientRequestsForUrl:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__2;
  id v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  uint64_t v5 = [(MTImageDownloader *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MTImageDownloader__clientRequestsForUrl___block_invoke;
  block[3] = &unk_1E6E20248;
  id v11 = v4;
  id v12 = &v13;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (void *)v14[5];
  if (!v7) {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __43__MTImageDownloader__clientRequestsForUrl___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) clientRequestsByUrl];
  id v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_dequeueClientRequests:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTImageDownloader *)self syncQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MTImageDownloader__dequeueClientRequests___block_invoke;
  v7[3] = &unk_1E6E1FB70;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __44__MTImageDownloader__dequeueClientRequests___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = _MTLogCategoryArtworkDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v3;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "removing requests from image download queue: %@", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        id v10 = [*(id *)(a1 + 40) clientRequestsByUrl];
        id v11 = [v9 url];
        id v12 = [v10 objectForKeyedSubscript:v11];

        if (v12)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __44__MTImageDownloader__dequeueClientRequests___block_invoke_76;
          v16[3] = &unk_1E6E20270;
          void v16[4] = v9;
          uint64_t v13 = objc_msgSend(v12, "mt_filter:", v16);
          uint64_t v14 = [*(id *)(a1 + 40) clientRequestsByUrl];
          uint64_t v15 = [v9 url];
          [v14 setObject:v13 forKeyedSubscript:v15];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

uint64_t __44__MTImageDownloader__dequeueClientRequests___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueId];
  id v4 = [*(id *)(a1 + 32) uniqueId];
  uint64_t v5 = [v3 isEqualToString:v4] ^ 1;

  return v5;
}

uint64_t __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _keyForImageDownloaderTempFilename:a2];
}

void __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "podcastForUuid:", v7, (void)v11);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 requestsAreNonAppInitiated];
        if (v8)
        {
          uint64_t v9 = [v8 imageURL];
          if (v9)
          {
            id v10 = (void *)v9;
            [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v7];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) imageStore];
  if ([v3 hasItemForKey:v4]) {
    [*(id *)(a1 + 40) removeObjectForKey:v4];
  }
}

void __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_4(id *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[4] _keyForImageDownloaderTempFilename:v3];
  if (!v4 || ([a1[5] containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = _MTLogCategoryArtworkDownload();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_DEFAULT, "Deleting orphaned item at path %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = [a1[6] stringByAppendingPathComponent:v3];
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v7 removeItemAtPath:v6 error:0];
  }
}

void __96__MTImageDownloader__onImageWorkQueuePurgeUnneededItemsInTemporaryResourcesDirectoryIfNecessary__block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 objectForKeyedSubscript:v4];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F91FE0]) init:v6 nonAppInitiated:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [*(id *)(a1 + 40) downloadImageForPodcastUuid:v4 urlOptions:v5 userInitiated:0 useBackgroundFetch:0 callback:0];
}

- (id)_keyForImageDownloaderTempFilename:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@"_image"])
  {
    id v4 = [v3 substringToIndex:objc_msgSend(v3, "length") - objc_msgSend(@"_image", "length")];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_temporaryImagePathForDownloadedImageWithUuid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    id v6 = [v7 UUIDString];
  }
  int v8 = [(MTImageDownloader *)self _temporaryResourcesDirectory];
  id v9 = [v8 stringByAppendingPathComponent:v6];
  uint64_t v10 = [v9 stringByAppendingString:@"_image"];

  return v10;
}

- (id)_temporaryImagePathByCopyingDownloadedContent:(id)a3 uuid:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MTImageDownloader *)self _temporaryResourcesDirectory];
  long long v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = [v11 fileExistsAtPath:v10];

  if ((v12 & 1) == 0)
  {
    long long v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v35 = 0;
    int v14 = [v13 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v35];
    id v15 = v35;

    uint64_t v16 = _MTLogCategoryArtworkDownload();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = a5;
      if (v14) {
        long long v17 = @"Did";
      }
      else {
        long long v17 = @"Failed to";
      }
      if (v14)
      {
        long long v18 = &stru_1F3F553C0;
      }
      else
      {
        [NSString stringWithFormat:@", error = %@", v15];
        long long v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v37 = v17;
      __int16 v38 = 2112;
      id v39 = v10;
      __int16 v40 = 2112;
      __int16 v41 = v18;
      _os_log_impl(&dword_1E3BC5000, v16, OS_LOG_TYPE_DEFAULT, "%@ create temporaryResourcesDirectory (%@)%@", buf, 0x20u);
      if ((v14 & 1) == 0) {

      }
      a5 = v33;
    }
  }
  long long v19 = [(MTImageDownloader *)self _temporaryImagePathForDownloadedImageWithUuid:v9];
  long long v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v19];
  id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v34 = 0;
  int v22 = [v21 copyItemAtURL:v8 toURL:v20 error:&v34];
  uint64_t v23 = (__CFString *)v34;

  uint64_t v24 = _MTLogCategoryArtworkDownload();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v25)
    {
      long long v26 = [v8 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v26;
      __int16 v38 = 2112;
      id v39 = v19;
      uint64_t v27 = "copying %@ to %@ succeeded!";
      uint64_t v28 = v24;
      uint32_t v29 = 22;
LABEL_18:
      _os_log_impl(&dword_1E3BC5000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
    }
  }
  else if (v25)
  {
    long long v26 = [v8 path];
    *(_DWORD *)buf = 138412802;
    uint64_t v37 = v26;
    __int16 v38 = 2112;
    id v39 = v19;
    __int16 v40 = 2112;
    __int16 v41 = v23;
    uint64_t v27 = "copying %@ to %@ failed (error = %@)";
    uint64_t v28 = v24;
    uint32_t v29 = 32;
    goto LABEL_18;
  }

  if (a5 && v23) {
    *a5 = v23;
  }
  if (v22) {
    id v30 = v20;
  }
  else {
    id v30 = 0;
  }
  id v31 = v30;

  return v31;
}

- (BOOL)_shouldDiscardTransparency
{
  return 0;
}

- (double)_urlSessionResourceTimeout
{
  return 300.0;
}

- (NSMutableDictionary)clientRequestsByUrl
{
  return self->_clientRequestsByUrl;
}

- (MTImageStore)imageStore
{
  return self->_imageStore;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageWorkQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);

  objc_storeStrong((id *)&self->_clientRequestsByUrl, 0);
}

@end