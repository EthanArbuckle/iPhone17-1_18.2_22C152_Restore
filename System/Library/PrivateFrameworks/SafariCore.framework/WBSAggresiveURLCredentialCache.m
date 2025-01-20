@interface WBSAggresiveURLCredentialCache
- (WBSAggresiveURLCredentialCache)initWithCredentialFetchBlock:(id)a3;
- (id)credentials;
- (void)getCredentialsWithCompletionHandler:(id)a3;
- (void)invalidate;
@end

@implementation WBSAggresiveURLCredentialCache

- (WBSAggresiveURLCredentialCache)initWithCredentialFetchBlock:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WBSAggresiveURLCredentialCache;
  v3 = [(WBSURLCredentialCache *)&v7 initWithCredentialFetchBlock:a3];
  v4 = v3;
  if (v3)
  {
    [(WBSAggresiveURLCredentialCache *)v3 invalidate];
    v5 = v4;
  }

  return v4;
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    objc_super v7 = self;
    _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_INFO, "Invalidating aggressive credential cache <%p>", buf, 0xCu);
  }
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WBSAggresiveURLCredentialCache_invalidate__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __44__WBSAggresiveURLCredentialCache_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

- (id)credentials
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  internalQueue = self->super._internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__WBSAggresiveURLCredentialCache_credentials__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__WBSAggresiveURLCredentialCache_credentials__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    v5 = v2;
    int v9 = 134218240;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 count];
    _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_INFO, "Returning credentials from aggressive cache <%p>, which contain %lu items", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)getCredentialsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->super._internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__WBSAggresiveURLCredentialCache_getCredentialsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __70__WBSAggresiveURLCredentialCache_getCredentialsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    v5 = v2;
    int v8 = 134218240;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_INFO, "Getting credentials from aggressive cache <%p>, which contain %lu items", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

@end