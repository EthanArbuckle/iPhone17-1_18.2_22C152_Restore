@interface PUImageEditPluginSession
- (BOOL)allowLivePhotoExtensions;
- (BOOL)allowSpatialPhotoExtensions;
- (id)imageDataSource;
- (unint64_t)pluginManagerMediaType;
- (void)loadItemProviderWithSupportedAdjustmentData:(id)a3 loadHandler:(id)a4;
- (void)setAllowLivePhotoExtensions:(BOOL)a3;
- (void)setAllowSpatialPhotoExtensions:(BOOL)a3;
- (void)shouldLaunchPlugin:(id)a3 completion:(id)a4;
@end

@implementation PUImageEditPluginSession

- (BOOL)allowSpatialPhotoExtensions
{
  return self->_allowSpatialPhotoExtensions;
}

- (BOOL)allowLivePhotoExtensions
{
  return self->_allowLivePhotoExtensions;
}

- (void)loadItemProviderWithSupportedAdjustmentData:(id)a3 loadHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUImageEditPluginSession *)self imageDataSource];
  v9 = [(PUEditPluginSession *)self asset];
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__29978;
  v48[4] = __Block_byref_object_dispose__29979;
  id v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__29978;
  v46[4] = __Block_byref_object_dispose__29979;
  id v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__29978;
  v44[4] = __Block_byref_object_dispose__29979;
  id v45 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3810000000;
  v41[3] = "";
  long long v42 = *MEMORY[0x1E4F1F9F8];
  uint64_t v43 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke;
  v38[3] = &unk_1E5F2DBE8;
  v40 = v48;
  v11 = v10;
  v39 = v11;
  [v8 editPluginSession:self loadPlaceholderImageWithHandler:v38];
  v12 = [(PUEditPluginSession *)self currentPlugin];
  v13 = [v12 extension];
  int v14 = objc_msgSend(v13, "pu_supportsMediaType:", 1);

  if (v14 && [(PUImageEditPluginSession *)self allowLivePhotoExtensions])
  {
    dispatch_group_enter(v11);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_2;
    v34[3] = &unk_1E5F258E8;
    v36 = v44;
    v37 = v41;
    v35 = v11;
    [v8 editPluginSession:self loadVideoComplementURLWithHandler:v34];
  }
  dispatch_group_enter(v11);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_3;
  v31[3] = &unk_1E5F2DBE8;
  v33 = v46;
  v15 = v11;
  v32 = v15;
  [v8 editPluginSession:self loadDisplaySizeImageWithHandler:v31];
  v16 = dispatch_get_global_queue(0, 0);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_4;
  v21[3] = &unk_1E5F25960;
  v28 = v41;
  v29 = v48;
  v30 = v46;
  id v22 = v9;
  id v23 = v6;
  id v24 = v8;
  v25 = self;
  id v26 = v7;
  v27 = v44;
  id v17 = v7;
  id v18 = v8;
  id v19 = v6;
  id v20 = v9;
  dispatch_group_notify(v15, v16, v21);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_2(uint64_t a1, void *a2, long long *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v8 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v7 = *a3;
  *(void *)(v6 + 48) = *((void *)a3 + 2);
  *(_OWORD *)(v6 + 32) = v7;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isFileURL]
    && (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 44) & 1) != 0)
  {
    v5 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) path];
    id v4 = PLGetSandboxExtensionToken();

    char v3 = 1;
  }
  else
  {
    char v3 = 0;
    id v4 = 0;
  }
  uint64_t v6 = *MEMORY[0x1E4F39A08];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_5;
  v12[3] = &unk_1E5F25938;
  long long v18 = *(_OWORD *)(a1 + 88);
  id v13 = *(id *)(a1 + 32);
  char v20 = v3;
  id v14 = *(id *)(a1 + 40);
  id v15 = v4;
  long long v19 = *(_OWORD *)(a1 + 72);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v16 = v7;
  uint64_t v17 = v8;
  id v9 = v4;
  [v2 registerItemForTypeIdentifier:v6 loadHandler:v12];
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v2, v10, v11);
}

void __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = UIImageJPEGRepresentation(*(UIImage **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), 0.899999976);
  v5 = UIImageJPEGRepresentation(*(UIImage **)(*(void *)(*(void *)(a1 + 80) + 8) + 40), 0.899999976);
  uint64_t v6 = [*(id *)(a1 + 32) mediaSubtypes] | (8 * *(unsigned __int8 *)(a1 + 104));
  id v7 = objc_alloc_init(MEMORY[0x1E4F39960]);
  [v7 setMediaType:1];
  [v7 setMediaSubtypes:v6];
  objc_msgSend(v7, "setPlaybackStyle:", objc_msgSend(*(id *)(a1 + 32), "playbackStyle"));
  uint64_t v8 = [*(id *)(a1 + 32) creationDate];
  [v7 setCreationDate:v8];

  id v9 = [*(id *)(a1 + 32) location];
  [v7 setLocation:v9];

  [v7 setAdjustmentData:*(void *)(a1 + 40)];
  [v7 setPlaceholderImageData:v4];
  [v7 setDisplaySizeImageData:v5];
  [v7 setVideoURL:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  [v7 setVideoPathSandboxExtensionToken:*(void *)(a1 + 48)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8);
  long long v19 = *(_OWORD *)(v10 + 32);
  uint64_t v20 = *(void *)(v10 + 48);
  [v7 setLivePhotoStillDisplayTime:&v19];
  uint64_t v11 = [*(id *)(a1 + 32) accessibilityDescription];
  [v7 setAccessibilityDescription:v11];

  id v13 = *(void **)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_6;
  v16[3] = &unk_1E5F25910;
  id v17 = v7;
  id v18 = v3;
  id v14 = v3;
  id v15 = v7;
  [v13 editPluginSession:v12 loadFullSizeImageWithHandler:v16];
}

uint64_t __84__PUImageEditPluginSession_loadItemProviderWithSupportedAdjustmentData_loadHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  uint64_t v8 = PLExifOrientationFromImageOrientation();
  [*(id *)(a1 + 32) setFullSizeImageURL:v7];

  [*(id *)(a1 + 32) setFullSizeImageURLSandboxExtensionToken:v6];
  [*(id *)(a1 + 32) setFullSizeImageExifOrientation:v8];
  id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v9();
}

- (void)shouldLaunchPlugin:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PUImageEditPluginSession *)self allowSpatialPhotoExtensions])
  {
    v39 = PULocalizedString(@"PLUGIN_DISABLES_SPATIAL_PHOTO_TITLE_FORMAT");
    v37 = [v6 title];
    uint64_t v8 = PUStringWithValidatedFormat();

    id v9 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v10 = PULocalizedString(@"PLUGIN_DISABLES_SPATIAL_PHOTO_MESSAGE");
    uint64_t v11 = objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1, v37);

    uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
    id v13 = PULocalizedString(@"OK");
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke;
    v47[3] = &unk_1E5F2E898;
    id v14 = v6;
    id v15 = v7;
    id v16 = v7;
    id v48 = v16;
    id v17 = [v12 actionWithTitle:v13 style:0 handler:v47];
    [v11 addAction:v17];

    id v18 = (void *)MEMORY[0x1E4FB1410];
    long long v19 = PULocalizedString(@"CANCEL");
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_2;
    v45[3] = &unk_1E5F2E898;
    id v20 = v16;
    id v7 = v15;
    id v6 = v14;
    id v46 = v20;
    v21 = [v18 actionWithTitle:v19 style:1 handler:v45];
    [v11 addAction:v21];

    [(PUEditPluginSession *)self presentAlertController:v11];
    id v22 = v48;
LABEL_7:

    goto LABEL_8;
  }
  if ([(PUImageEditPluginSession *)self allowLivePhotoExtensions])
  {
    id v23 = [v6 extension];
    char v24 = objc_msgSend(v23, "pu_supportsMediaType:", 1);

    if ((v24 & 1) == 0)
    {
      v39 = PULocalizedString(@"PLUGIN_DISABLES_LIVE_PHOTO_TITLE_FORMAT");
      v38 = [v6 title];
      uint64_t v8 = PUStringWithValidatedFormat();

      v25 = (void *)MEMORY[0x1E4FB1418];
      id v26 = PULocalizedString(@"PLUGIN_DISABLES_LIVE_PHOTO_MESSAGE");
      uint64_t v11 = objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v8, v26, 1, v38);

      v27 = (void *)MEMORY[0x1E4FB1410];
      v28 = PULocalizedString(@"OK");
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_3;
      v43[3] = &unk_1E5F2E898;
      id v29 = v6;
      id v30 = v7;
      id v31 = v7;
      id v44 = v31;
      v32 = [v27 actionWithTitle:v28 style:0 handler:v43];
      [v11 addAction:v32];

      v33 = (void *)MEMORY[0x1E4FB1410];
      v34 = PULocalizedString(@"CANCEL");
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_4;
      v41[3] = &unk_1E5F2E898;
      id v35 = v31;
      id v7 = v30;
      id v6 = v29;
      id v42 = v35;
      v36 = [v33 actionWithTitle:v34 style:1 handler:v41];
      [v11 addAction:v36];

      [(PUEditPluginSession *)self presentAlertController:v11];
      id v22 = v44;
      goto LABEL_7;
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)PUImageEditPluginSession;
  [(PUEditPluginSession *)&v40 shouldLaunchPlugin:v6 completion:v7];
LABEL_8:
}

uint64_t __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__PUImageEditPluginSession_shouldLaunchPlugin_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)imageDataSource
{
  id v4 = [(PUEditPluginSession *)self dataSource];
  if (([v4 conformsToProtocol:&unk_1F08794C8] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUImageEditPluginSession.m" lineNumber:53 description:@"data source must conform to PUImageEditPluginSessionDataSource"];
  }
  return v4;
}

- (unint64_t)pluginManagerMediaType
{
  return [(PUImageEditPluginSession *)self allowLivePhotoExtensions];
}

- (void)setAllowSpatialPhotoExtensions:(BOOL)a3
{
  if (self->_allowSpatialPhotoExtensions != a3)
  {
    self->_allowSpatialPhotoExtensions = a3;
    [(PUEditPluginSession *)self updatePluginManager];
  }
}

- (void)setAllowLivePhotoExtensions:(BOOL)a3
{
  if (self->_allowLivePhotoExtensions != a3)
  {
    self->_allowLivePhotoExtensions = a3;
    [(PUEditPluginSession *)self updatePluginManager];
  }
}

@end