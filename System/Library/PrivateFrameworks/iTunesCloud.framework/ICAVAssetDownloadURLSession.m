@interface ICAVAssetDownloadURLSession
- (ICAVAssetDownloadURLSession)initWithConfiguration:(id)a3 maxConcurrentRequests:(unint64_t)a4 qualityOfService:(int64_t)a5;
- (id)_createURLSessionTaskForRequest:(id)a3 usingSession:(id)a4;
- (id)_createURLSessionWithConfiguration:(id)a3;
- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8;
- (void)dealloc;
- (void)enqueueAVDownloadRequest:(id)a3 toDestination:(id)a4 withAVURLAsset:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)enqueueAVDownloadRequest:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
- (void)enqueueAVDownloadRequest:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)enqueueAggregateAssetDownloadRequest:(id)a3 toDestination:(id)a4 withAVURLAsset:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)enqueueAggregateAssetDownloadRequest:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
- (void)enqueueAggregateAssetDownloadRequest:(id)a3 toDestination:(id)a4 withOptions:(id)a5 resourceLoaderDelegate:(id)a6 completionHandler:(id)a7;
- (void)mediaServicesWereLost:(id)a3;
- (void)mediaServicesWereReset:(id)a3;
@end

@implementation ICAVAssetDownloadURLSession

- (id)_createURLSessionTaskForRequest:(id)a3 usingSession:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 avDownloadOptions];
  if (v8)
  {
    v9 = [v6 avDownloadOptions];
    v10 = (void *)[v9 mutableCopy];
  }
  else
  {
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  v11 = [v6 responseDataURL];
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F15698]];

  uint64_t v12 = [v6 type];
  if (v12 == 5)
  {
    v17 = [v6 avURLAsset];
    v19 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v26 = self;
      __int16 v27 = 2114;
      v28 = v17;
      __int16 v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating aggregateAssetDownloadTask with urlAsset: %{public}@, options %{public}@", buf, 0x20u);
    }

    v20 = [v17 allMediaSelections];
    v18 = [v7 aggregateAssetDownloadTaskWithURLAsset:v17 mediaSelections:v20 assetTitle:@"Aggregate Media Download" assetArtworkData:0 options:v10];
  }
  else
  {
    if (v12 != 3)
    {
      v24.receiver = self;
      v24.super_class = (Class)ICAVAssetDownloadURLSession;
      v18 = [(ICURLSession *)&v24 _createURLSessionTaskForRequest:v6 usingSession:v7];
      goto LABEL_19;
    }
    v13 = +[ICDeviceInfo currentDeviceInfo];
    int v14 = [v13 isWatch];

    if (v14)
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v6 currentURLRequest];
        *(_DWORD *)buf = 138543618;
        v26 = self;
        __int16 v27 = 2114;
        v28 = v16;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating downloadTask with URLRequest: %{public}@", buf, 0x16u);
      }
      v17 = [v6 currentURLRequest];
      v18 = [v7 downloadTaskWithRequest:v17];
      goto LABEL_18;
    }
    v17 = [v6 avURLAsset];
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v26 = self;
      __int16 v27 = 2114;
      v28 = v17;
      __int16 v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating assetDownloadTask with urlAsset: %{public}@, options %{public}@", buf, 0x20u);
    }

    v20 = [v17 URL];
    v22 = [v6 responseDataURL];
    v18 = [v7 _AVAssetDownloadTaskWithURL:v20 destinationURL:v22 options:v10];
  }
LABEL_18:

LABEL_19:

  return v18;
}

- (id)_createURLSessionWithConfiguration:(id)a3
{
  return (id)[MEMORY[0x1E4F18D18] sessionWithConfiguration:a3 assetDownloadDelegate:self delegateQueue:0];
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __150__ICAVAssetDownloadURLSession_URLSession_aggregateAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelection___block_invoke;
  v19[3] = &unk_1E5AC9A70;
  v19[4] = &v20;
  [v15 enumerateObjectsUsingBlock:v19];
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a7->var1;
  Float64 Seconds = CMTimeGetSeconds((CMTime *)&var1);
  [(ICURLSession *)self _updateProgressForSessionTask:v14 withTotalBytesWritten:v21[3] totalBytesExpectedToWrite:(uint64_t)Seconds];
  _Block_object_dispose(&v20, 8);
}

void __150__ICAVAssetDownloadURLSession_URLSession_aggregateAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelection___block_invoke(uint64_t a1, void *a2)
{
  memset(v4, 0, sizeof(v4));
  [a2 getValue:v4];
  CMTime v3 = v4[1];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += (uint64_t)CMTimeGetSeconds(&v3);
}

- (void)enqueueAggregateAssetDownloadRequest:(id)a3 toDestination:(id)a4 withAVURLAsset:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  [v16 setType:5];
  [v16 setCompletionHandler:v12];

  [v16 setResponseDataURL:v15];
  [v16 setAVURLAsset:v14];

  [v16 setAVDownloadOptions:v13];
  [(ICURLSession *)self _enqueueRequest:v16];
}

- (void)enqueueAggregateAssetDownloadRequest:(id)a3 toDestination:(id)a4 withOptions:(id)a5 resourceLoaderDelegate:(id)a6 completionHandler:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v11 = (void *)MEMORY[0x1E4F166C8];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v16 urlRequest];
  v18 = [v17 URL];
  uint64_t v23 = *MEMORY[0x1E4F16170];
  v24[0] = &unk_1EF6409C0;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  uint64_t v20 = [v11 URLAssetWithURL:v18 options:v19];

  v21 = [v20 resourceLoader];
  [v21 setDelegate:v13 queue:MEMORY[0x1E4F14428]];

  [(ICAVAssetDownloadURLSession *)self enqueueAggregateAssetDownloadRequest:v16 toDestination:v15 withAVURLAsset:v20 options:v14 completionHandler:v12];
}

- (void)enqueueAggregateAssetDownloadRequest:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
}

- (void)enqueueAVDownloadRequest:(id)a3 toDestination:(id)a4 withAVURLAsset:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  [v16 setType:3];
  [v16 setAVDownloadOptions:v13];

  [v16 setCompletionHandler:v12];
  [v16 setResponseDataURL:v15];

  [v16 setAVURLAsset:v14];
  [(ICURLSession *)self _enqueueRequest:v16];
}

- (void)enqueueAVDownloadRequest:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v10 = (void *)MEMORY[0x1E4F166C8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v14 urlRequest];
  id v16 = [v15 URL];
  uint64_t v19 = *MEMORY[0x1E4F16170];
  v20[0] = &unk_1EF6409C0;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v18 = [v10 URLAssetWithURL:v16 options:v17];

  [(ICAVAssetDownloadURLSession *)self enqueueAVDownloadRequest:v14 toDestination:v13 withAVURLAsset:v18 options:v12 completionHandler:v11];
}

- (void)enqueueAVDownloadRequest:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = NSTemporaryDirectory();
  id v13 = NSString;
  id v14 = [MEMORY[0x1E4F29128] UUID];
  id v15 = [v14 UUIDString];
  id v16 = [v13 stringWithFormat:@"tmp.%@", v15];
  v17 = [v12 stringByAppendingPathComponent:v16];
  id v18 = [v8 fileURLWithPath:v17];

  [(ICAVAssetDownloadURLSession *)self enqueueAVDownloadRequest:v11 toDestination:v18 withOptions:v10 completionHandler:v9];
}

- (void)dealloc
{
  CMTime v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAVAssetDownloadURLSession;
  [(ICURLSession *)&v4 dealloc];
}

- (void)mediaServicesWereReset:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F28C58];
  id v7 = [a3 userInfo];
  v5 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F157A0]];
  id v6 = objc_msgSend(v4, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8302, v5, @"Media Services were reset");
  [(ICURLSession *)self cancelPendingRequestsWithError:v6];
}

- (void)mediaServicesWereLost:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -8302, @"Media Services were lost");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ICURLSession *)self cancelPendingRequestsWithError:v4];
}

- (ICAVAssetDownloadURLSession)initWithConfiguration:(id)a3 maxConcurrentRequests:(unint64_t)a4 qualityOfService:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ICAVAssetDownloadURLSession;
  v5 = [(ICURLSession *)&v9 initWithConfiguration:a3 maxConcurrentRequests:a4 qualityOfService:a5];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_mediaServicesWereLost_ name:*MEMORY[0x1E4F15030] object:0];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v5 selector:sel_mediaServicesWereReset_ name:*MEMORY[0x1E4F157A8] object:0];
  }
  return v5;
}

@end