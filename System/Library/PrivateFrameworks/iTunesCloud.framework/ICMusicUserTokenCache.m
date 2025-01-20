@interface ICMusicUserTokenCache
+ (ICMusicUserTokenCache)sharedCache;
+ (id)_decodeDeveloperTokenPart:(id)a3;
+ (void)_getCacheKeyForDeveloperToken:(id)a3 requestContext:(id)a4 completion:(id)a5;
- (id)_init;
- (void)_handleMusicUserTokensDidChangeDistributedNotification:(id)a3;
- (void)_loadPersistedCacheWithCompletion:(id)a3;
- (void)_persistCache;
- (void)_postLocalChangeNotification;
- (void)dealloc;
- (void)getCachedUserTokenForDeveloperToken:(id)a3 requestContext:(id)a4 completion:(id)a5;
- (void)setCachedUserToken:(id)a3 forDeveloperToken:(id)a4 requestContext:(id)a5 completion:(id)a6;
@end

@implementation ICMusicUserTokenCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedUserTokens, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_postLocalChangeNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_calloutQueue);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICMusicUserTokenCacheDidChangeNotification" object:self];
}

- (void)_persistCache
{
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  id v3 = +[ICDefaults standardDefaults];
  [v3 setCachedMusicUserTokens:self->_cachedUserTokens];
  [v3 synchronize];
}

- (void)_loadPersistedCacheWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  v5 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_cachedUserTokens copy];
  cachedUserTokens = self->_cachedUserTokens;
  self->_cachedUserTokens = 0;

  v7 = +[ICDefaults standardDefaults];
  [v7 synchronize];
  v8 = [v7 cachedMusicUserTokens];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__ICMusicUserTokenCache__loadPersistedCacheWithCompletion___block_invoke;
  v15[3] = &unk_1E5ACADD0;
  v15[4] = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];
  v9 = self->_cachedUserTokens;
  if (v5 == v9)
  {
    char v10 = 0;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v10 = 1;
  if (v5 && v9) {
    char v10 = -[NSMutableDictionary isEqualToDictionary:](v5, "isEqualToDictionary:") ^ 1;
  }
  if (v4)
  {
LABEL_6:
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__ICMusicUserTokenCache__loadPersistedCacheWithCompletion___block_invoke_2;
    block[3] = &unk_1E5ACC128;
    id v13 = v4;
    char v14 = v10;
    dispatch_async(calloutQueue, block);
  }
LABEL_7:
}

void __59__ICMusicUserTokenCache__loadPersistedCacheWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (_NSIsNSString() && _NSIsNSString())
  {
    v6 = *(void **)(*(void *)(a1 + 32) + 24);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 24);
      *(void *)(v8 + 24) = v7;

      v6 = *(void **)(*(void *)(a1 + 32) + 24);
    }
    [v6 setObject:v5 forKey:v10];
  }
}

uint64_t __59__ICMusicUserTokenCache__loadPersistedCacheWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_handleMusicUserTokensDidChangeDistributedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_INFO, "%{public}@: Reloading Music User Token due to external change notification.", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__ICMusicUserTokenCache__handleMusicUserTokensDidChangeDistributedNotification___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __80__ICMusicUserTokenCache__handleMusicUserTokensDidChangeDistributedNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__ICMusicUserTokenCache__handleMusicUserTokensDidChangeDistributedNotification___block_invoke_2;
  v3[3] = &unk_1E5ACAD80;
  v3[4] = v1;
  return [v1 _loadPersistedCacheWithCompletion:v3];
}

void __80__ICMusicUserTokenCache__handleMusicUserTokensDidChangeDistributedNotification___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_INFO, "%{public}@: _handleMusicUserTokensDidChangeDistributedNotification: didContentsChange = %{BOOL}d", (uint8_t *)&v6, 0x12u);
  }

  if (a2) {
    [*(id *)(a1 + 32) _postLocalChangeNotification];
  }
}

- (void)setCachedUserToken:(id)a3 forDeveloperToken:(id)a4 requestContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  char v14 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke;
  v17[3] = &unk_1E5ACD0B0;
  id v18 = v10;
  id v19 = v11;
  v17[4] = self;
  id v15 = v10;
  id v16 = v11;
  [v14 _getCacheKeyForDeveloperToken:v13 requestContext:v12 completion:v17];
}

void __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(NSObject **)(v8 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_3;
    v12[3] = &unk_1E5ACD2A0;
    v12[4] = v8;
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    dispatch_barrier_async(v9, v12);

    id v10 = v13;
LABEL_5:

    goto LABEL_6;
  }
  if (*(void *)(a1 + 48))
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v17 = v6;
    id v18 = *(id *)(a1 + 48);
    dispatch_async(v11, block);

    id v10 = v17;
    goto LABEL_5;
  }
LABEL_6:
}

void __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8103, *(void *)(a1 + 32), @"User Token caching failed");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2 != *(void **)(a1 + 48) && !objc_msgSend(v2, "isEqualToString:"))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 24);
    if (v7)
    {
      if (!v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = *(void **)(v10 + 24);
        *(void *)(v10 + 24) = v9;

        uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 24);
        uint64_t v7 = *(void *)(a1 + 48);
      }
      [v8 setObject:v7 forKey:*(void *)(a1 + 40)];
    }
    else
    {
      [v8 removeObjectForKey:*(void *)(a1 + 40)];
      if (![*(id *)(*(void *)(a1 + 32) + 24) count])
      {
        uint64_t v12 = *(void *)(a1 + 32);
        id v13 = *(void **)(v12 + 24);
        *(void *)(v12 + 24) = 0;
      }
    }
    [*(id *)(a1 + 32) _persistCache];
    id v14 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v14 postNotificationName:@"com.apple.iTunesCloud.ICMusicUserTokensDidChangeDistributedNotification" object:0];

    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(NSObject **)(v15 + 16);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_5;
    v17[3] = &unk_1E5ACD2F0;
    v17[4] = v15;
    id v18 = *(id *)(a1 + 56);
    dispatch_async(v16, v17);
    id v6 = v18;
    goto LABEL_12;
  }
  id v4 = *(void **)(a1 + 56);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_4;
    block[3] = &unk_1E5ACD170;
    id v20 = v4;
    dispatch_async(v5, block);
    id v6 = v20;
LABEL_12:
  }
}

uint64_t __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__ICMusicUserTokenCache_setCachedUserToken_forDeveloperToken_requestContext_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _postLocalChangeNotification];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)getCachedUserTokenForDeveloperToken:(id)a3 requestContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_class();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke;
  v13[3] = &unk_1E5ACD0F8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 _getCacheKeyForDeveloperToken:v10 requestContext:v9 completion:v13];
}

void __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_3;
    v12[3] = &unk_1E5ACD250;
    v12[4] = v7;
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    dispatch_async(v8, v12);

    id v9 = v13;
LABEL_5:

    goto LABEL_6;
  }
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_2;
    block[3] = &unk_1E5ACD170;
    id v16 = v10;
    dispatch_async(v11, block);
    id v9 = v16;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_3(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  id v3 = (void *)a1[6];
  if (v3)
  {
    id v4 = *(NSObject **)(a1[4] + 16);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_4;
    v5[3] = &unk_1E5ACD2F0;
    id v7 = v3;
    id v6 = v2;
    dispatch_async(v4, v5);
  }
}

uint64_t __87__ICMusicUserTokenCache_getCachedUserTokenForDeveloperToken_requestContext_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.iTunesCloud.ICMusicUserTokensDidChangeDistributedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)ICMusicUserTokenCache;
  [(ICMusicUserTokenCache *)&v4 dealloc];
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)ICMusicUserTokenCache;
  id v2 = [(ICMusicUserTokenCache *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicUserTokenCache.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicUserTokenCache.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    id v7 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v7 addObserver:v2 selector:sel__handleMusicUserTokensDidChangeDistributedNotification_ name:@"com.apple.iTunesCloud.ICMusicUserTokensDidChangeDistributedNotification" object:0];

    id v8 = v2->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__ICMusicUserTokenCache__init__block_invoke;
    block[3] = &unk_1E5ACD750;
    id v11 = v2;
    dispatch_barrier_async(v8, block);
  }
  return v2;
}

uint64_t __30__ICMusicUserTokenCache__init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadPersistedCacheWithCompletion:0];
}

+ (void)_getCacheKeyForDeveloperToken:(id)a3 requestContext:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 componentsSeparatedByString:@"."];
  id v27 = a1;
  if ([v11 count] == 3)
  {
    v25 = v10;
    v26 = v9;
    objc_super v12 = [v11 objectAtIndex:0];
    id v13 = [a1 _decodeDeveloperTokenPart:v12];
    id v14 = [v13 objectForKey:@"kid"];
    id v15 = 0;
    if (_NSIsNSString()) {
      id v15 = v14;
    }
    id v16 = [v11 objectAtIndex:1];
    id v17 = [a1 _decodeDeveloperTokenPart:v16];
    id v18 = [v17 objectForKey:@"iss"];
    if (_NSIsNSString()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    if (v15)
    {
      id v10 = v25;
      id v9 = v26;
      if (v19)
      {
        v21 = [v26 identity];
        v22 = [v26 identityStore];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __81__ICMusicUserTokenCache__getCacheKeyForDeveloperToken_requestContext_completion___block_invoke;
        v28[3] = &unk_1E5ACADA8;
        id v32 = v27;
        id v31 = v25;
        id v15 = v15;
        id v29 = v15;
        id v19 = v19;
        id v30 = v19;
        [v22 getPropertiesForUserIdentity:v21 completionHandler:v28];

        goto LABEL_17;
      }
    }
    else
    {
      id v10 = v25;
      id v9 = v26;
    }
  }
  else
  {
    id v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = a1;
      __int16 v35 = 2112;
      id v36 = v8;
      __int16 v37 = 2048;
      uint64_t v38 = [v11 count];
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to extract key identifier and team identifier from developer token \"%@\" because it has an unexpected number of parts: %lu.", buf, 0x20u);
    }

    id v15 = 0;
    id v19 = 0;
  }
  v21 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -8202, @"Failed to create a key for the Music User Token Cache because the key identifier and/or the team identifier could not be derived from developer token \"%@\".", v8);
  v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = objc_msgSend(v21, "msv_description");
    *(_DWORD *)buf = 138543618;
    id v34 = v27;
    __int16 v35 = 2114;
    id v36 = v24;
    _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
  }
  (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v21);
LABEL_17:
}

void __81__ICMusicUserTokenCache__getCacheKeyForDeveloperToken_requestContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 DSID];
  id v7 = v6;
  if (v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lli;%@;%@",
      [v6 longLongValue],
      a1[4],
    id v8 = a1[5]);
    id v9 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7401, v5, @"Failed to create a key for the Music User Token Cache because there was no DSID in the user identity for the request.");
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[7];
      objc_super v12 = objc_msgSend(v8, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v12;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
    }
    id v9 = *(void (**)(void))(a1[6] + 16);
  }
  v9();
}

+ (id)_decodeDeveloperTokenPart:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v4 = a3;
  uint64_t v5 = [v4 length] & 3;
  if (v5 == 3)
  {
    id v7 = @"=";
LABEL_7:
    id v6 = [v4 stringByAppendingString:v7];

LABEL_8:
    if (!v6) {
      goto LABEL_13;
    }
    id v8 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
    if (!v8)
    {
      id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v18 = a1;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to convert base 64 encoded string with developer token encoded part to data: \"%@\".", buf, 0x16u);
      }
      id v11 = 0;
      goto LABEL_25;
    }
    id v16 = 0;
    id v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v16];
    id v10 = v16;
    if (v9)
    {
      if (_NSIsNSDictionary())
      {
        id v11 = v9;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      objc_super v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        id v18 = a1;
        __int16 v19 = 2114;
        id v20 = v14;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode developer token encoded part because resulting object is of unexpected type: %{public}@.", buf, 0x16u);
      }
    }
    else
    {
      objc_super v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v18 = a1;
        __int16 v19 = 2114;
        id v20 = v10;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to deserialize developer token encoded part data with error: %{public}@.", buf, 0x16u);
      }
    }

    id v11 = 0;
    goto LABEL_24;
  }
  if (v5 == 2)
  {
    id v7 = @"==";
    goto LABEL_7;
  }
  id v6 = v4;
  if (v5 != 1) {
    goto LABEL_8;
  }

LABEL_13:
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = a1;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to correct developer token encoded part: \"%@\".", buf, 0x16u);
  }
  id v6 = 0;
  id v11 = 0;
LABEL_26:

  return v11;
}

+ (ICMusicUserTokenCache)sharedCache
{
  if (sharedCache_sOnceToken_29708 != -1) {
    dispatch_once(&sharedCache_sOnceToken_29708, &__block_literal_global_29709);
  }
  id v2 = (void *)sharedCache_sSharedCache_29710;

  return (ICMusicUserTokenCache *)v2;
}

uint64_t __36__ICMusicUserTokenCache_sharedCache__block_invoke()
{
  id v0 = [[ICMusicUserTokenCache alloc] _init];
  uint64_t v1 = sharedCache_sSharedCache_29710;
  sharedCache_sSharedCache_29710 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end