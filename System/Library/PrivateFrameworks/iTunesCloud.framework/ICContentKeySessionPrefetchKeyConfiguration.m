@interface ICContentKeySessionPrefetchKeyConfiguration
- (ICContentKeySessionPrefetchKeyConfiguration)initWithRequestContext:(id)a3;
- (NSSet)keyIdentifiers;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (void)_fetchWithRequestContext:(id)a3;
@end

@implementation ICContentKeySessionPrefetchKeyConfiguration

void __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke(uint64_t a1)
{
  v2 = +[ICURLBagProvider sharedBagProvider];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke_2;
  v4[3] = &unk_1E5ACD950;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v2 getBagForRequestContext:v3 withCompletionHandler:v4];
}

void __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke_13(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) prefetchSKDs];
  if (_NSIsNSArray())
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
    if (([*(id *)(*(void *)(a1 + 40) + 16) isEqualToSet:v3] & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), v3);
      v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(v5 + 16);
        int v14 = 138543618;
        uint64_t v15 = v5;
        __int16 v16 = 2114;
        uint64_t v17 = v6;
        _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Updated prefetch identifiers %{public}@", (uint8_t *)&v14, 0x16u);
      }

      v7 = +[ICDefaults standardDefaults];
      [v7 setPrefetchKeyIdentifiers:v2];
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = *(void **)(v8 + 16);
    if (!v9) {
      goto LABEL_9;
    }
    *(void *)(v8 + 16) = 0;

    uint64_t v3 = +[ICDefaults standardDefaults];
    [v3 setPrefetchKeyIdentifiers:0];
  }

LABEL_9:
  v10 = [*(id *)(a1 + 32) keyServerURL];
  v11 = v10;
  if (!v10)
  {
    v11 = [*(id *)(a1 + 48) urlForBagKey:@"fps-request"];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), v11);
  if (!v10) {

  }
  v12 = [*(id *)(a1 + 32) certificateURL];
  v13 = v12;
  if (!v12)
  {
    v13 = [*(id *)(a1 + 48) urlForBagKey:@"fps-cert"];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), v13);
  if (!v12) {
}
  }

- (ICContentKeySessionPrefetchKeyConfiguration)initWithRequestContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICContentKeySessionPrefetchKeyConfiguration;
  uint64_t v5 = [(ICContentKeySessionPrefetchKeyConfiguration *)&v15 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.iTunesCloud.ICContentKeySession.prefetchKeyConfig", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    dispatch_group_t v8 = dispatch_group_create();
    group = v5->_group;
    v5->_group = (OS_dispatch_group *)v8;

    v5->_timeout = dispatch_time(0, 10000000000);
    v10 = +[ICDefaults standardDefaults];
    v11 = [v10 prefetchKeyIdentifiers];

    if (_NSIsNSArray() && [v11 count])
    {
      v5->_initWithDefaultKeyIdentifiers = 1;
      uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
      keyIdentifiers = v5->_keyIdentifiers;
      v5->_keyIdentifiers = (NSSet *)v12;
    }
    [(ICContentKeySessionPrefetchKeyConfiguration *)v5 _fetchWithRequestContext:v4];
  }
  return v5;
}

- (void)_fetchWithRequestContext:(id)a3
{
  id v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_group);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);

  objc_storeStrong((id *)&self->_keyIdentifiers, 0);
}

void __72__ICContentKeySessionPrefetchKeyConfiguration__fetchWithRequestContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 enhancedAudioConfiguration];
  id v8 = v7;
  if (v7)
  {
    v11 = v7;
    id v12 = v5;
    msv_dispatch_sync_on_queue();

    v9 = v11;
  }
  else
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Failed to load enhanced audio configuration from the bag. err=%{public}@", buf, 0x16u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

- (NSURL)keyCertificateURL
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dispatch_group_wait((dispatch_group_t)self->_group, self->_timeout))
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Timed out waiting for the enhanced audio configuration (prefetchKeyCertificateURL) to load.", (uint8_t *)&v6, 0xCu);
    }

    id v4 = 0;
  }
  else
  {
    id v4 = self->_keyCertificateURL;
  }

  return v4;
}

- (NSURL)keyServerURL
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dispatch_group_wait((dispatch_group_t)self->_group, self->_timeout))
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Timed out waiting for the enhanced audio configuration (prefetchKeyServerURL) to load.", (uint8_t *)&v6, 0xCu);
    }

    id v4 = 0;
  }
  else
  {
    id v4 = self->_keyServerURL;
  }

  return v4;
}

- (NSSet)keyIdentifiers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_initWithDefaultKeyIdentifiers)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = __Block_byref_object_copy__30924;
    v11 = __Block_byref_object_dispose__30925;
    id v12 = 0;
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__ICContentKeySessionPrefetchKeyConfiguration_keyIdentifiers__block_invoke;
    v7[3] = &unk_1E5ACD880;
    void v7[4] = self;
    v7[5] = &buf;
    dispatch_sync(queue, v7);
    id v4 = (NSSet *)*(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }
  else if (dispatch_group_wait((dispatch_group_t)self->_group, self->_timeout))
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ [SKD] - Timed out waiting for the enhanced audio configuration (prefetchKeyIdentifiers) to load.", (uint8_t *)&buf, 0xCu);
    }

    id v4 = 0;
  }
  else
  {
    id v4 = self->_keyIdentifiers;
  }

  return v4;
}

void __61__ICContentKeySessionPrefetchKeyConfiguration_keyIdentifiers__block_invoke(uint64_t a1)
{
}

@end