@interface WBSImageFetchingURLSessionTaskManager
+ (id)sharedManager;
- (WBSImageFetchingURLSessionTaskManager)init;
- (id)_urlSessionWithOptions:(unint64_t)a3;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_downloadFirstValidImageWithURLs:(id)a3 inURLSession:(id)a4 failedURLDownloadsToErrorsDictionary:(id)a5 completionHandler:(id)a6;
- (void)downloadFirstValidImageWithURLs:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)downloadImageWithURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)downloadImageWithURL:(id)a3 options:(unint64_t)a4 completionHandlerIncludingErrors:(id)a5;
@end

@implementation WBSImageFetchingURLSessionTaskManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_20);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __54__WBSImageFetchingURLSessionTaskManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSImageFetchingURLSessionTaskManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;
}

- (WBSImageFetchingURLSessionTaskManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSImageFetchingURLSessionTaskManager;
  v2 = [(WBSImageFetchingURLSessionTaskManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    urlSessionsByType = v2->_urlSessionsByType;
    v2->_urlSessionsByType = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)downloadFirstValidImageWithURLs:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = a5;
  if ([v8 count])
  {
    v10 = [(WBSImageFetchingURLSessionTaskManager *)self _urlSessionWithOptions:a4];
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = dispatch_group_create();
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__10;
    v35[4] = __Block_byref_object_dispose__10;
    id v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__10;
    v33[4] = __Block_byref_object_dispose__10;
    id v34 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__10;
    v31[4] = __Block_byref_object_dispose__10;
    id v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__10;
    v29[4] = __Block_byref_object_dispose__10;
    id v30 = 0;
    dispatch_group_enter(v12);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke_2;
    v23[3] = &unk_1E5E430C0;
    v25 = v35;
    v26 = v33;
    v27 = v31;
    v28 = v29;
    v13 = v12;
    v24 = v13;
    [(WBSImageFetchingURLSessionTaskManager *)self _downloadFirstValidImageWithURLs:v8 inURLSession:v10 failedURLDownloadsToErrorsDictionary:v11 completionHandler:v23];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke_2;
    block[3] = &unk_1E5E430E8;
    v19 = v35;
    v20 = v33;
    v21 = v31;
    v22 = v29;
    id v17 = v11;
    v18 = v9;
    id v14 = v11;
    v15 = v9;
    dispatch_group_notify(v13, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke;
    v37[3] = &unk_1E5E41548;
    v38 = v9;
    v10 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v37);
    v13 = v38;
  }
}

uint64_t __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v24 = v9;

  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v10;
  id v17 = v10;

  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v11;
  id v20 = v11;

  uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v12;
  id v23 = v12;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[8] + 8) + 40), *(void *)(*(void *)(a1[9] + 8) + 40), a1[4]);
}

- (void)downloadImageWithURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v15[0] = a3;
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a3;
  id v11 = [v9 arrayWithObjects:v15 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__WBSImageFetchingURLSessionTaskManager_downloadImageWithURL_options_completionHandler___block_invoke;
  v13[3] = &unk_1E5E43110;
  id v14 = v8;
  id v12 = v8;
  [(WBSImageFetchingURLSessionTaskManager *)self downloadFirstValidImageWithURLs:v11 options:a4 completionHandler:v13];
}

uint64_t __88__WBSImageFetchingURLSessionTaskManager_downloadImageWithURL_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadImageWithURL:(id)a3 options:(unint64_t)a4 completionHandlerIncludingErrors:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v15[0] = a3;
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a3;
  id v11 = [v9 arrayWithObjects:v15 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__WBSImageFetchingURLSessionTaskManager_downloadImageWithURL_options_completionHandlerIncludingErrors___block_invoke;
  v13[3] = &unk_1E5E43110;
  id v14 = v8;
  id v12 = v8;
  [(WBSImageFetchingURLSessionTaskManager *)self downloadFirstValidImageWithURLs:v11 options:a4 completionHandler:v13];
}

uint64_t __103__WBSImageFetchingURLSessionTaskManager_downloadImageWithURL_options_completionHandlerIncludingErrors___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_downloadFirstValidImageWithURLs:(id)a3 inURLSession:(id)a4 failedURLDownloadsToErrorsDictionary:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)[a3 copy];
  uint64_t v14 = [v13 count];
  uint64_t v15 = [v13 firstObject];
  v16 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v15);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __142__WBSImageFetchingURLSessionTaskManager__downloadFirstValidImageWithURLs_inURLSession_failedURLDownloadsToErrorsDictionary_completionHandler___block_invoke;
  v23[3] = &unk_1E5E43160;
  id v24 = v11;
  id v25 = v15;
  id v29 = v12;
  uint64_t v30 = v14;
  v26 = self;
  id v27 = v13;
  id v28 = v10;
  id v17 = v10;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  id v21 = v11;
  v22 = [v17 dataTaskWithRequest:v16 completionHandler:v23];
  [v22 resume];
}

void __142__WBSImageFetchingURLSessionTaskManager__downloadFirstValidImageWithURLs_inURLSession_failedURLDownloadsToErrorsDictionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v7];
  if (v10)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + 80);
    if (v11 > 1)
    {
      id v12 = *(void **)(a1 + 48);
      uint64_t v13 = objc_msgSend(*(id *)(a1 + 56), "subarrayWithRange:", 1, v11 - 1);
      [v12 _downloadFirstValidImageWithURLs:v13 inURLSession:*(void *)(a1 + 64) failedURLDownloadsToErrorsDictionary:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 72)];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __142__WBSImageFetchingURLSessionTaskManager__downloadFirstValidImageWithURLs_inURLSession_failedURLDownloadsToErrorsDictionary_completionHandler___block_invoke_2;
      block[3] = &unk_1E5E43138;
      id v19 = *(id *)(a1 + 72);
      id v15 = 0;
      id v16 = v7;
      id v17 = *(id *)(a1 + 40);
      id v18 = v8;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __142__WBSImageFetchingURLSessionTaskManager__downloadFirstValidImageWithURLs_inURLSession_failedURLDownloadsToErrorsDictionary_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (id)_urlSessionWithOptions:(unint64_t)a3
{
  urlSessionsByType = self->_urlSessionsByType;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)urlSessionsByType objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F18DD0], "safari_ephemeralSessionConfiguration");
    [v9 setAllowsCellularAccess:a3 & 1];
    if ((a3 & 2) != 0) {
      [v9 setHTTPCookieStorage:0];
    }
    if ((a3 & 4) != 0) {
      objc_msgSend(v9, "set_sourceApplicationSecondaryIdentifier:", @"com.apple.Passwords.PRIconFetching");
    }
    id v10 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v9 delegate:self delegateQueue:0];
    unint64_t v11 = self->_urlSessionsByType;
    id v12 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

    id v8 = v10;
  }

  return v8;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8 = (void (**)(id, uint64_t, void))a6;
  if ([a5 previousFailureCount] < 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }
  v8[2](v8, v7, 0);
}

- (void).cxx_destruct
{
}

@end