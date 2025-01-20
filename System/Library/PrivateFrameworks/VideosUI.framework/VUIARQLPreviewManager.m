@interface VUIARQLPreviewManager
+ (id)sharedInstance;
- (NSURLSession)session;
- (VUIARAssetRequest)activeAssetRequest;
- (VUIARQLPreviewManager)init;
- (double)resourceTimeout;
- (id)_previewControllerWithAssetRequest:(id)a3;
- (id)_quickLookPreviewItemWithFileURL:(id)a3 shareURL:(id)a4;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
- (void)_presentPreviewControllerWithURL:(id)a3 shareURL:(id)a4 fileName:(id)a5;
- (void)cancelExistingDownloadsIfAny;
- (void)configureDownloadSession;
- (void)configureUsingDictionary:(id)a3;
- (void)previewControllerDidDismiss:(id)a3;
- (void)previewWithURL:(id)a3 shareURL:(id)a4;
- (void)setActiveAssetRequest:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation VUIARQLPreviewManager

- (void)cancelExistingDownloadsIfAny
{
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14 != -1) {
    dispatch_once(&sharedInstance_onceToken_14, &__block_literal_global_66);
  }
  v2 = (void *)sharedInstance_instance_1;
  return v2;
}

void __39__VUIARQLPreviewManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIARQLPreviewManager);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;
}

- (VUIARQLPreviewManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)VUIARQLPreviewManager;
  v2 = [(VUIARQLPreviewManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_resourceTimeout = 300.0;
    [(VUIARQLPreviewManager *)v2 configureDownloadSession];
  }
  return v3;
}

- (void)configureDownloadSession
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F290F0] backgroundSessionConfigurationWithIdentifier:@"com.apple.tv.arql"];
  v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double resourceTimeout = self->_resourceTimeout;
    int v9 = 134217984;
    double v10 = resourceTimeout;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - configureDownloadSession with resourceTimeout: %lf", (uint8_t *)&v9, 0xCu);
  }

  [v3 setTimeoutIntervalForResource:self->_resourceTimeout];
  v6 = [MEMORY[0x1E4F28F08] mainQueue];
  v7 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v3 delegate:self delegateQueue:v6];
  session = self->_session;
  self->_session = v7;
}

void __53__VUIARQLPreviewManager_cancelExistingDownloadsIfAny__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)configureUsingDictionary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(v4, "vui_numberForKey:", @"resourceTimeoutInterval");
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 doubleValue];
      if (v7 > 0.0 && self->_resourceTimeout != v7)
      {
        self->_double resourceTimeout = v7;
        long long v8 = VUIDefaultLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          double resourceTimeout = self->_resourceTimeout;
          int v10 = 134217984;
          double v11 = resourceTimeout;
          _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - resourceTimeout set by js config: %lf", (uint8_t *)&v10, 0xCu);
        }

        [(NSURLSession *)self->_session invalidateAndCancel];
      }
    }
  }
}

- (void)setActiveAssetRequest:(id)a3
{
  uint64_t v6 = (VUIARAssetRequest *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_activeAssetRequest != v6) {
    objc_storeStrong((id *)&v5->_activeAssetRequest, a3);
  }
  objc_sync_exit(v5);
}

- (VUIARAssetRequest)activeAssetRequest
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_activeAssetRequest;
  objc_sync_exit(v2);

  return v3;
}

- (void)previewControllerDidDismiss:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [(VUIARQLPreviewManager *)self activeAssetRequest];
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 isDownloading])
    {
      uint64_t v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        double v7 = [v5 fileName];
        int v8 = 138412290;
        long long v9 = v7;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - Cancel the active download: %@", (uint8_t *)&v8, 0xCu);
      }
      [v5 cancelDownload];
    }
    [(VUIARQLPreviewManager *)self setActiveAssetRequest:0];
  }
}

- (void)previewWithURL:(id)a3 shareURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 path];
  id v9 = [v8 lastPathComponent];

  [(VUIARQLPreviewManager *)self _presentPreviewControllerWithURL:v7 shareURL:v6 fileName:v9];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(VUIARQLPreviewManager *)self activeAssetRequest];
  uint64_t v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = [v9 remoteURL];
    *(_DWORD *)buf = 138412546;
    v23 = v11;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - NSURLSessionDownloadDelegate: didFinishDownloadingToURL: remote URL: %@, location: %@", buf, 0x16u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v17 = __75__VUIARQLPreviewManager_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  v18 = &unk_1E6DF45D8;
  id v19 = v7;
  id v20 = v9;
  id v21 = v8;
  uint64_t v12 = (void *)MEMORY[0x1E4F29060];
  id v13 = v8;
  id v14 = v9;
  id v15 = v7;
  if ([v12 isMainThread]) {
    v17((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __75__VUIARQLPreviewManager_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) response];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v2 = v6;
    if ([v2 statusCode] >= 200 && objc_msgSend(v2, "statusCode") <= 399)
    {
      uint64_t v3 = [*(id *)(a1 + 40) cacheDownloadedFileFromLocation:*(void *)(a1 + 48)];
      goto LABEL_8;
    }
  }
  else
  {
    id v2 = 0;
  }
  uint64_t v3 = 0;
LABEL_8:
  id v4 = [*(id *)(a1 + 40) completionHandler];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) completionHandler];
    ((void (**)(void, void *, void))v5)[2](v5, v3, 0);
  }
  [*(id *)(a1 + 40) setIsDownloading:0];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a5;
  id v7 = [(VUIARQLPreviewManager *)self activeAssetRequest];
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[VUIARQLPreviewManager URLSession:task:didCompleteWithError:](v7, (uint64_t)v6, v8);
  }

  uint64_t v12 = MEMORY[0x1E4F143A8];
  id v13 = __62__VUIARQLPreviewManager_URLSession_task_didCompleteWithError___block_invoke;
  id v14 = &unk_1E6DF3F68;
  id v15 = v6;
  id v16 = v7;
  id v9 = (void *)MEMORY[0x1E4F29060];
  id v10 = v7;
  id v11 = v6;
  if (objc_msgSend(v9, "isMainThread", v12, 3221225472)) {
    v13((uint64_t)&v12);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v12);
  }
}

uint64_t __62__VUIARQLPreviewManager_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "recordLog:");
    id v2 = [*(id *)(a1 + 40) completionHandler];

    if (v2)
    {
      uint64_t v3 = [*(id *)(a1 + 40) completionHandler];
      id v4 = [*(id *)(a1 + 40) remoteURL];
      ((void (**)(void, void *, void))v3)[2](v3, v4, *(void *)(a1 + 32));
    }
  }
  uint64_t v5 = *(void **)(a1 + 40);
  return [v5 setIsDownloading:0];
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - Received %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v8 = __74__VUIARQLPreviewManager_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke;
  id v9 = &unk_1E6DF3D58;
  id v10 = self;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v8((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __74__VUIARQLPreviewManager_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VUIARQLDownloadSessionDidFinishEventsForBackgroundURLSessionNotification" object:*(void *)(a1 + 32)];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - didBecomeInvalidWithError %@", (uint8_t *)&v7, 0xCu);
  }

  [(VUIARQLPreviewManager *)self configureDownloadSession];
}

- (id)_quickLookPreviewItemWithFileURL:(id)a3 shareURL:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F14EF8];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithFileAtURL:v7];

  [v8 setCanonicalWebPageURL:v6];
  [v8 setForceIgnoreMuteSwitch:1];
  return v8;
}

- (void)_presentPreviewControllerWithURL:(id)a3 shareURL:(id)a4 fileName:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [[VUIARAssetRequest alloc] initWithRemoteURL:v10 shareURL:v8 fileName:v9];

  uint64_t v12 = [(VUIARAssetRequest *)v11 cachePath];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
    id v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v13;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - Cached AR file found: %@", (uint8_t *)&v19, 0xCu);
    }

    id v15 = [(VUIARQLPreviewManager *)self _quickLookPreviewItemWithFileURL:v13 shareURL:v8];
    id v16 = [[VUIARQLPreviewController alloc] initWithQuickLookPreviewItem:v15];
  }
  else
  {
    id v16 = [(VUIARQLPreviewManager *)self _previewControllerWithAssetRequest:v11];
  }
  v17 = +[VUIInterfaceFactory sharedInstance];
  v18 = [v17 controllerPresenter];

  [v18 presentViewController:v16 animated:1 completion:0];
}

- (id)_previewControllerWithAssetRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  id v6 = [v4 remoteURL];
  id v7 = [v6 pathExtension];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v7, 0);
  id v9 = [v4 shareURL];
  id v10 = [(VUIARQLPreviewManager *)self _quickLookPreviewItemWithFileURL:v6 shareURL:v9];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F4E2D0]) initWithPreviewItemProvider:v5 contentType:PreferredIdentifierForTag previewTitle:&stru_1F3E921E0 fileSize:&unk_1F3F3CBD8 previewItem:v10];
  [v11 setUseLoadingTimeout:0];
  objc_initWeak(&location, self);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  int v19 = __60__VUIARQLPreviewManager__previewControllerWithAssetRequest___block_invoke;
  id v20 = &unk_1E6DF7E60;
  objc_copyWeak(&v23, &location);
  id v12 = v6;
  id v21 = v12;
  id v13 = v4;
  id v22 = v13;
  [v5 registerItemForTypeIdentifier:PreferredIdentifierForTag loadHandler:&v17];
  id v14 = [VUIARQLPreviewController alloc];
  id v15 = -[VUIARQLPreviewController initWithQuickLookWebKitItem:](v14, "initWithQuickLookWebKitItem:", v11, v17, v18, v19, v20);
  [(QLPreviewController *)v15 setDelegate:self];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v15;
}

void __60__VUIARQLPreviewManager__previewControllerWithAssetRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__VUIARQLPreviewManager__previewControllerWithAssetRequest___block_invoke_2;
    aBlock[3] = &unk_1E6DF7E38;
    id v11 = *(id *)(a1 + 32);
    id v12 = WeakRetained;
    id v13 = v3;
    id v5 = _Block_copy(aBlock);
    id v6 = *(void **)(a1 + 40);
    id v7 = [WeakRetained session];
    [v6 startDownloadWithSession:v7 completionHandler:v5];

    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIARQLPreviewManager - Start downloading url: %@", buf, 0xCu);
    }

    [WeakRetained setActiveAssetRequest:*(void *)(a1 + 40)];
  }
}

void __60__VUIARQLPreviewManager__previewControllerWithAssetRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    id v3 = *(id *)(a1 + 32);
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) setActiveAssetRequest:0];
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (double)resourceTimeout
{
  return self->_resourceTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_activeAssetRequest, 0);
}

- (void)URLSession:(void *)a1 task:(uint64_t)a2 didCompleteWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 remoteURL];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1E2BD7000, a3, OS_LOG_TYPE_ERROR, "VUIARQLPreviewManager - NSURLSessionDownloadDelegate: didCompleteWithError: remote URL: %@, error: %@", (uint8_t *)&v6, 0x16u);
}

@end