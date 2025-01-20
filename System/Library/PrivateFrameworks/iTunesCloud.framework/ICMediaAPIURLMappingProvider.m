@interface ICMediaAPIURLMappingProvider
+ (ICMediaAPIURLMappingProvider)sharedProvider;
- (id)_cacheFileURL;
- (id)_loadCacheDictionary;
- (id)getCurrentURLMappingSet;
- (void)_saveCachedResponsePayload:(id)a3 eTag:(id)a4;
- (void)clearCachedURLMappings;
- (void)setCurrentURLMappingSet:(id)a3;
- (void)updateURLMappingsWithCompletion:(id)a3;
@end

@implementation ICMediaAPIURLMappingProvider

- (void)_saveCachedResponsePayload:(id)a3 eTag:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithCapacity:2];
  [v9 setObject:v8 forKeyedSubscript:@"mappings"];

  [v9 setObject:v7 forKeyedSubscript:@"etag"];
  v10 = [(ICMediaAPIURLMappingProvider *)self _cacheFileURL];
  id v13 = 0;
  LOBYTE(v8) = [v9 writeToURL:v10 error:&v13];
  id v11 = v13;

  if ((v8 & 1) == 0)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      __int16 v16 = 2114;
      id v17 = v11;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to save cache dicationry. err=%{public}@", buf, 0x16u);
    }
  }
}

- (id)_loadCacheDictionary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(ICMediaAPIURLMappingProvider *)self _cacheFileURL];
  id v8 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load cache from file. err=%{public}@", buf, 0x16u);
    }
  }

  return v4;
}

- (id)_cacheFileURL
{
  v2 = MSVMobileHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"Library/Caches/com.apple.iTunesCloud/"];

  v4 = [v3 stringByAppendingPathComponent:@"media_api_url_map.plist"];
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];

  return v5;
}

- (void)setCurrentURLMappingSet:(id)a3
{
  id v4 = [a3 responsePayload];
  [(ICMediaAPIURLMappingProvider *)self _saveCachedResponsePayload:v4 eTag:0];
}

- (void)clearCachedURLMappings
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v11 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing cache file", buf, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [(ICMediaAPIURLMappingProvider *)self _cacheFileURL];
  id v9 = 0;
  char v6 = [v4 removeItemAtURL:v5 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v11 = self;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to remove cache file. err=%{public}@", buf, 0x16u);
    }
  }
}

- (void)updateURLMappingsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [ICStoreRequestContext alloc];
  char v6 = +[ICUserIdentity activeAccount];
  id v7 = [(ICStoreRequestContext *)v5 initWithIdentity:v6];

  id v8 = +[ICURLBagProvider sharedBagProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__ICMediaAPIURLMappingProvider_updateURLMappingsWithCompletion___block_invoke;
  v11[3] = &unk_1E5ACD1D8;
  __int16 v12 = v7;
  id v13 = v4;
  v11[4] = self;
  id v9 = v7;
  id v10 = v4;
  [v8 getBagForRequestContext:v9 withCompletionHandler:v11];
}

void __64__ICMediaAPIURLMappingProvider_updateURLMappingsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    char v6 = [a2 urlForBagKey:@"url-regex-map"];
    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v6];
      id v8 = [*(id *)(a1 + 32) _loadCacheDictionary];
      id v9 = objc_msgSend(v8, "ic_stringValueForKey:", @"etag");
      if (v9) {
        [v7 setValue:v9 forHTTPHeaderField:@"ETag"];
      }
      id v10 = [[ICURLRequest alloc] initWithURLRequest:v7 requestContext:*(void *)(a1 + 40)];
      __int16 v11 = +[ICURLSessionManager defaultSession];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __64__ICMediaAPIURLMappingProvider_updateURLMappingsWithCompletion___block_invoke_16;
      v17[3] = &unk_1E5ACD400;
      v17[4] = *(void *)(a1 + 32);
      id v18 = *(id *)(a1 + 48);
      [v11 enqueueDataRequest:v10 withCompletionHandler:v17];
    }
    else
    {
      uint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v15;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Regex map file url is missing from the bag - skipping", buf, 0xCu);
      }

      uint64_t v16 = *(void *)(a1 + 48);
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v7);
    }
  }
  else
  {
    __int16 v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v5;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load bag. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __64__ICMediaAPIURLMappingProvider_updateURLMappingsWithCompletion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v18 = 138543618;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch url mapping file from server. err=%{public}@", (uint8_t *)&v18, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v9 = [v5 parsedBodyArray];
    if (v9)
    {
      id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v18 = 138543618;
        uint64_t v19 = v11;
        __int16 v20 = 2114;
        id v21 = v9;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetched updated url mappings %{public}@", (uint8_t *)&v18, 0x16u);
      }

      __int16 v12 = [v5 urlResponse];
      uint64_t v13 = objc_msgSend(v12, "ic_valueForHTTPHeaderField:", @"ETag");
      [*(id *)(a1 + 32) _saveCachedResponsePayload:v9 eTag:v13];
      uint64_t v14 = [[ICMediaAPIURLMappingSet alloc] initWithResponsePayload:v9];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v18 = 138543362;
        uint64_t v19 = v16;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to parse url mappings from response body", (uint8_t *)&v18, 0xCu);
      }

      uint64_t v17 = *(void *)(a1 + 40);
      __int16 v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v12);
    }
  }
}

- (id)getCurrentURLMappingSet
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(ICMediaAPIURLMappingProvider *)self _loadCacheDictionary];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "ic_arrayValueForKey:", @"mappings");
    if (v5)
    {
      id v6 = v5;
      id v7 = [[ICMediaAPIURLMappingSet alloc] initWithResponsePayload:v5];
      goto LABEL_10;
    }
    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load url mappings from cache file", (uint8_t *)&v10, 0xCu);
    }

    id v6 = 0;
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load mapping cache", (uint8_t *)&v10, 0xCu);
    }
  }
  id v7 = 0;
LABEL_10:

  return v7;
}

+ (ICMediaAPIURLMappingProvider)sharedProvider
{
  if (sharedProvider___onceToken != -1) {
    dispatch_once(&sharedProvider___onceToken, &__block_literal_global_38784);
  }
  v2 = (void *)sharedProvider___mappingProvider;

  return (ICMediaAPIURLMappingProvider *)v2;
}

uint64_t __46__ICMediaAPIURLMappingProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(ICMediaAPIURLMappingProvider);
  uint64_t v1 = sharedProvider___mappingProvider;
  sharedProvider___mappingProvider = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end