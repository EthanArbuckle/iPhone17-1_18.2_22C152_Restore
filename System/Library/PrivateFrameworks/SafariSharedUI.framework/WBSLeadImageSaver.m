@interface WBSLeadImageSaver
+ (void)saveLeadImageFromWebView:(id)a3 toLeadImageCacheRegisteredWithMetadataManager:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSLeadImageSaver

+ (void)saveLeadImageFromWebView:(id)a3 toLeadImageCacheRegisteredWithMetadataManager:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F30AB0]);
  v11 = v10;
  if (v10)
  {
    [v10 setShouldFetchSubresources:0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke;
    v26[3] = &unk_1E5E43588;
    id v28 = v9;
    id v27 = v8;
    v12 = (void *)MEMORY[0x1AD115160](v26);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__12;
    v24 = __Block_byref_object_dispose__12;
    id v25 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke_4;
    v17[3] = &unk_1E5E435B0;
    id v18 = v12;
    v19 = &v20;
    id v13 = v12;
    uint64_t v14 = [v11 _startFetchingMetadataForWebView:v7 isNonAppInitiated:1 completionHandler:v17];
    v15 = (void *)v21[5];
    v21[5] = v14;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v16);
  }
}

void __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = [v5 images];
    id v9 = [v8 firstObject];
    id v10 = [v9 URL];

    if (v10)
    {
      v11 = +[WBSLeadImageCacheRequest requestWithURL:v10];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke_2;
      v15[3] = &unk_1E5E43560;
      v12 = *(void **)(a1 + 32);
      id v17 = *(id *)(a1 + 40);
      id v16 = v10;
      [v12 preloadRequest:v11 withPriority:0 responseHandler:v15];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(void, void, id))(v13 + 16))(*(void *)(a1 + 40), 0, v6);
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
    }
  }
}

void __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 thumbnail];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void (**)(uint64_t, uint64_t, void))(v4 + 16);
    uint64_t v7 = *(void *)(a1 + 40);
    v6(v7, v5, 0);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v8);
  }
}

uint64_t __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

@end