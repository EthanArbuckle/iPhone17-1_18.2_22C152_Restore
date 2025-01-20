@interface FCAVAssetResourceLoader
- (BOOL)_isHLSURL:(id)a3;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (FCAVAssetResourceLoader)init;
- (FCAVAssetResourceLoader)initWithCacheDirectory:(id)a3 networkReachability:(id)a4;
- (FCAssetManager)assetManager;
- (FCThreadSafeMutableSet)whitelistedMasterPlaylistURLs;
- (void)prefetchMasterPlaylistForAssetURL:(id)a3 completionHandler:(id)a4;
- (void)registerAVURLAssetForAutomaticResourceManagement:(id)a3;
@end

@implementation FCAVAssetResourceLoader

- (FCAVAssetResourceLoader)initWithCacheDirectory:(id)a3 networkReachability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCAVAssetResourceLoader;
  v8 = [(FCAVAssetResourceLoader *)&v14 init];
  if (v8)
  {
    v9 = [[FCAssetManager alloc] initWithName:@"playlists" directory:v6 keyManager:0 avAssetFactory:0 resourceURLGenerator:0 networkBehaviorMonitor:0 networkReachability:v7];
    assetManager = v8->_assetManager;
    v8->_assetManager = v9;

    v11 = objc_alloc_init(FCThreadSafeMutableSet);
    whitelistedMasterPlaylistURLs = v8->_whitelistedMasterPlaylistURLs;
    v8->_whitelistedMasterPlaylistURLs = v11;
  }
  return v8;
}

- (FCAVAssetResourceLoader)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAVAssetResourceLoader init]";
    __int16 v9 = 2080;
    v10 = "FCAVAssetResourceLoader.m";
    __int16 v11 = 1024;
    int v12 = 34;
    __int16 v13 = 2114;
    objc_super v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAVAssetResourceLoader init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)registerAVURLAssetForAutomaticResourceManagement:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 URL];
  BOOL v5 = [(FCAVAssetResourceLoader *)self _isHLSURL:v4];

  if (v5)
  {
    id v6 = [(FCAVAssetResourceLoader *)self whitelistedMasterPlaylistURLs];
    id v7 = [v10 URL];
    [v6 addObject:v7];

    v8 = [v10 resourceLoader];
    __int16 v9 = FCAVWorkQueue();
    [v8 setDelegate:self queue:v9];
  }
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 request];
  id v7 = [v6 URL];
  v8 = [v7 pathExtension];

  __int16 v9 = [(FCAVAssetResourceLoader *)self whitelistedMasterPlaylistURLs];
  id v10 = [v6 URL];
  int v11 = [v9 containsObject:v10];

  if (v11)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __82__FCAVAssetResourceLoader_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
    v31 = &unk_1E5B59A98;
    id v32 = v5;
    id v33 = v8;
    int v12 = (void (**)(void *, void *, void))_Block_copy(&v28);
    __int16 v13 = [(FCAVAssetResourceLoader *)self assetManager];
    objc_super v14 = [v6 URL];
    uint64_t v15 = [v13 assetHandleForURL:v14 lifetimeHint:0];

    v16 = [v15 dataProvider];

    v17 = (void *)FCAVAssetLog;
    BOOL v18 = os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = v17;
        v20 = [v6 URL];
        v21 = [v20 lastPathComponent];
        *(_DWORD *)buf = 138543362;
        v35 = v21;
        _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "returning master playlist %{public}@ from cache", buf, 0xCu);
      }
      v22 = [v15 dataProvider];
      v12[2](v12, v22, 0);
    }
    else
    {
      if (v18)
      {
        v23 = v17;
        v24 = [v6 URL];
        v25 = [v24 lastPathComponent];
        *(_DWORD *)buf = 138543362;
        v35 = v25;
        _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEFAULT, "fetching master playlist %{public}@ from network", buf, 0xCu);
      }
      id v26 = (id)[v15 fetchDataProviderWithCompletion:v12];
    }
  }
  return v11;
}

void __82__FCAVAssetResourceLoader_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    id v15 = *(id *)(a1 + 32);
    id v16 = v6;
    objc_msgSend(v15, "finishLoadingWithError:", v16, v14, 3221225472, __82__FCAVAssetResourceLoader_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2, &unk_1E5B4BE70);
  }
  else
  {
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], *(CFStringRef *)(a1 + 40), 0);
    v8 = [*(id *)(a1 + 32) contentInformationRequest];
    [v8 setContentType:PreferredIdentifierForTag];

    __int16 v9 = [v5 data];
    uint64_t v10 = [v9 length];
    int v11 = [*(id *)(a1 + 32) contentInformationRequest];
    [v11 setContentLength:v10];

    int v12 = [*(id *)(a1 + 32) dataRequest];
    __int16 v13 = [v5 data];
    [v12 respondWithData:v13];

    [*(id *)(a1 + 32) finishLoading];
  }
}

uint64_t __82__FCAVAssetResourceLoader_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishLoadingWithError:*(void *)(a1 + 40)];
}

- (void)prefetchMasterPlaylistForAssetURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FCAVAssetResourceLoader *)self _isHLSURL:v6])
  {
    v8 = FCAVWorkQueue();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke_2;
    v13[3] = &unk_1E5B4E088;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    __int16 v9 = v7;
    dispatch_async(v8, v13);

    uint64_t v10 = v14;
  }
  else
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    BOOL v18 = __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke;
    v19 = &unk_1E5B4CA88;
    v20 = v7;
    int v11 = (void (*)(void *, void, void, void))v7[2];
    int v12 = v7;
    v11(v12, 0, MEMORY[0x1E4F1CBF0], 0);
    uint64_t v10 = v7;
  }
}

uint64_t __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assetManager];
  v3 = [v2 assetHandleForURL:*(void *)(a1 + 40) lifetimeHint:0];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke_3;
  v5[3] = &unk_1E5B59AC0;
  id v6 = *(id *)(a1 + 48);
  id v4 = (id)[v3 fetchDataProviderWithCompletion:v5];
}

void __79__FCAVAssetResourceLoader_prefetchMasterPlaylistForAssetURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = a2;
    id v8 = [v6 data];
    id v7 = +[FCHLSPlaylist playlistParsingData:error:]((uint64_t)FCHLSPlaylist, v8, 0);
    (*(void (**)(uint64_t, void *, id, id))(v3 + 16))(v3, v7, v6, v5);
  }
}

- (BOOL)_isHLSURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathExtension];
  if ([v4 isEqualToString:@"m3u8"])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 pathExtension];
    char v5 = [v6 isEqualToString:@"m3u"];
  }
  return v5;
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (FCThreadSafeMutableSet)whitelistedMasterPlaylistURLs
{
  return self->_whitelistedMasterPlaylistURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedMasterPlaylistURLs, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end