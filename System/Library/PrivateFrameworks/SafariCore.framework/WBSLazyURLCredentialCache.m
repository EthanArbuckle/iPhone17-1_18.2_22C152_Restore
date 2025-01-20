@interface WBSLazyURLCredentialCache
- (id)credentials;
- (void)getCredentialsWithCompletionHandler:(id)a3;
- (void)invalidate;
@end

@implementation WBSLazyURLCredentialCache

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_INFO, "Invalidating lazy credential cache <%p>", buf, 0xCu);
  }
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WBSLazyURLCredentialCache_invalidate__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __39__WBSLazyURLCredentialCache_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (id)credentials
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  internalQueue = self->super._internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__WBSLazyURLCredentialCache_credentials__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__WBSLazyURLCredentialCache_credentials__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 16))
  {
    uint64_t v3 = (*(void (**)(void))(*(void *)(v2 + 24) + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;
  }
  uint64_t v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 16);
    v9 = v6;
    int v13 = 134218240;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = [v8 count];
    _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_INFO, "Returning credentials from lazy cache <%p>, which contain %lu items", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)getCredentialsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->super._internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__WBSLazyURLCredentialCache_getCredentialsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __65__WBSLazyURLCredentialCache_getCredentialsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 16))
  {
    uint64_t v3 = (*(void (**)(void))(*(void *)(v2 + 24) + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;
  }
  id v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 16);
    v9 = v6;
    int v12 = 134218240;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = [v8 count];
    _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_INFO, "Getting credentials from lazy cache <%p>, which contain %lu items", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

@end