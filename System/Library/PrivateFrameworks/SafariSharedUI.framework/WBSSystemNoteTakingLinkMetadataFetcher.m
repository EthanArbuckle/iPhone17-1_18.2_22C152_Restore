@interface WBSSystemNoteTakingLinkMetadataFetcher
+ (id)sharedFetcher;
- (id)linkContextPreviewForMetadata:(id)a3 image:(id)a4 selectedText:(id)a5;
- (void)fetchMetadataForWebView:(id)a3 completion:(id)a4;
@end

@implementation WBSSystemNoteTakingLinkMetadataFetcher

+ (id)sharedFetcher
{
  if (sharedFetcher_onceToken != -1) {
    dispatch_once(&sharedFetcher_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)sharedFetcher_sharedFetcher;
  return v2;
}

void __55__WBSSystemNoteTakingLinkMetadataFetcher_sharedFetcher__block_invoke()
{
  v0 = objc_alloc_init(WBSSystemNoteTakingLinkMetadataFetcher);
  v1 = (void *)sharedFetcher_sharedFetcher;
  sharedFetcher_sharedFetcher = (uint64_t)v0;
}

- (void)fetchMetadataForWebView:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__26;
  v24 = __Block_byref_object_dispose__26;
  id v25 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v7 = (void *)getLPMetadataProviderClass_softClass_0;
  uint64_t v29 = getLPMetadataProviderClass_softClass_0;
  if (!getLPMetadataProviderClass_softClass_0)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = (uint64_t)__getLPMetadataProviderClass_block_invoke_0;
    v17 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5E41610;
    v18 = (void (*)(uint64_t))&v26;
    __getLPMetadataProviderClass_block_invoke_0((uint64_t)&v14);
    v7 = (void *)v27[3];
  }
  v8 = v7;
  _Block_object_dispose(&v26, 8);
  id v9 = objc_alloc_init(v8);
  uint64_t v14 = 0;
  uint64_t v15 = (uint64_t)&v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__2;
  id v19 = (id)MEMORY[0x1AD115160](v6);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke;
  v13[3] = &unk_1E5E45140;
  v13[4] = &v14;
  v13[5] = &v20;
  v10 = (void *)MEMORY[0x1AD115160](v13);
  uint64_t v11 = [v9 _startFetchingMetadataForWebView:v5 isNonAppInitiated:1 completionHandler:v10];
  v12 = (void *)v21[5];
  v21[5] = v11;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
}

void __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke_cold_1(v4, v3);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke_3;
  block[3] = &unk_1E5E45118;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (id)linkContextPreviewForMetadata:(id)a3 image:(id)a4 selectedText:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v10 = (void *)getLPImageClass_softClass_0;
    uint64_t v19 = getLPImageClass_softClass_0;
    if (!getLPImageClass_softClass_0)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getLPImageClass_block_invoke_0;
      v15[3] = &unk_1E5E41610;
      v15[4] = &v16;
      __getLPImageClass_block_invoke_0((uint64_t)v15);
      v10 = (void *)v17[3];
    }
    uint64_t v11 = v10;
    _Block_object_dispose(&v16, 8);
    v12 = (void *)[[v11 alloc] initWithPlatformImage:v8];
    [v7 setImage:v12];
  }
  if (v9) {
    [v7 setSelectedText:v9];
  }
  v13 = [v7 dataRepresentation];

  return v13;
}

void __77__WBSSystemNoteTakingLinkMetadataFetcher_fetchMetadataForWebView_completion___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Fetching Link Presentation metadata failed: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end