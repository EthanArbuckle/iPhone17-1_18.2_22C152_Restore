@interface PUVideoEditPluginSession
- (BOOL)allowLoopingVideoExtensions;
- (id)videoDataSource;
- (unint64_t)pluginManagerMediaType;
- (void)loadItemProviderWithSupportedAdjustmentData:(id)a3 loadHandler:(id)a4;
- (void)setAllowLoopingVideoExtensions:(BOOL)a3;
@end

@implementation PUVideoEditPluginSession

- (BOOL)allowLoopingVideoExtensions
{
  return self->_allowLoopingVideoExtensions;
}

- (void)loadItemProviderWithSupportedAdjustmentData:(id)a3 loadHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUVideoEditPluginSession *)self videoDataSource];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__98707;
  v28[4] = __Block_byref_object_dispose__98708;
  id v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__98707;
  v26[4] = __Block_byref_object_dispose__98708;
  id v27 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke;
  v23[3] = &unk_1E5F2DBE8;
  v25 = v28;
  v10 = v9;
  v24 = v10;
  [v8 editPluginSession:self loadPlaceholderImageWithHandler:v23];
  dispatch_group_enter(v10);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_2;
  v20[3] = &unk_1E5F2DC10;
  v22 = v26;
  v11 = v10;
  v21 = v11;
  [v8 editPluginSession:self loadVideoURLWithHandler:v20];
  v12 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_3;
  block[3] = &unk_1E5F2DC60;
  v19 = v28;
  block[4] = self;
  id v16 = v6;
  id v17 = v7;
  v18 = v26;
  id v13 = v7;
  id v14 = v6;
  dispatch_group_notify(v11, v12, block);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

void __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) asset];
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isFileURL])
  {
    v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) path];
    id v4 = PLGetSandboxExtensionToken();
  }
  else
  {
    id v4 = 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  uint64_t v6 = *MEMORY[0x1E4F39A08];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_4;
  v9[3] = &unk_1E5F2DC38;
  id v10 = v2;
  int8x16_t v13 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
  id v11 = *(id *)(a1 + 40);
  id v12 = v4;
  id v7 = v4;
  id v8 = v2;
  [v5 registerItemForTypeIdentifier:v6 loadHandler:v9];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __84__PUVideoEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(UIImage **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v4 = a2;
  UIImageJPEGRepresentation(v3, 0.899999976);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc_init(MEMORY[0x1E4F39960]);
  objc_msgSend(v5, "setMediaType:", objc_msgSend(*(id *)(a1 + 32), "mediaType"));
  objc_msgSend(v5, "setMediaSubtypes:", objc_msgSend(*(id *)(a1 + 32), "mediaSubtypes"));
  if ([*(id *)(a1 + 32) isAdjusted])
  {
    uint64_t v6 = [MEMORY[0x1E4F16330] assetWithURL:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v7 = [*(id *)(a1 + 32) mediaSubtypes];
    int v8 = [MEMORY[0x1E4F8A950] isHFRVideoAVAsset:v6];
    uint64_t v9 = 0x20000;
    if (!v8) {
      uint64_t v9 = 0;
    }
    [v5 setMediaSubtypes:v7 & 0xFFFFFFFFFFFDFFFFLL | v9];
  }
  objc_msgSend(v5, "setPlaybackStyle:", objc_msgSend(*(id *)(a1 + 32), "playbackStyle"));
  id v10 = [*(id *)(a1 + 32) creationDate];
  [v5 setCreationDate:v10];

  id v11 = [*(id *)(a1 + 32) location];
  [v5 setLocation:v11];

  [v5 setAdjustmentData:*(void *)(a1 + 40)];
  [v5 setPlaceholderImageData:v12];
  [v5 setVideoURL:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [v5 setVideoPathSandboxExtensionToken:*(void *)(a1 + 48)];
  v4[2](v4, v5, 0);
}

- (id)videoDataSource
{
  id v4 = [(PUEditPluginSession *)self dataSource];
  if (([v4 conformsToProtocol:&unk_1F0879EE8] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUVideoEditPluginSession.m" lineNumber:51 description:@"data source must conform to PUVideoEditPluginSessionDataSource"];
  }
  return v4;
}

- (unint64_t)pluginManagerMediaType
{
  if ([(PUVideoEditPluginSession *)self allowLoopingVideoExtensions]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (void)setAllowLoopingVideoExtensions:(BOOL)a3
{
  if (self->_allowLoopingVideoExtensions != a3)
  {
    self->_allowLoopingVideoExtensions = a3;
    [(PUEditPluginSession *)self updatePluginManager];
  }
}

@end