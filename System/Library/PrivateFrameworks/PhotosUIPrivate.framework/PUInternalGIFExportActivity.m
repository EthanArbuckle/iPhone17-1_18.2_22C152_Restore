@interface PUInternalGIFExportActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_asset;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUInternalGIFExportActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (void)performActivity
{
  v3 = [(PXActivity *)self itemSourceController];
  v4 = [v3 activityViewController];

  v5 = [(PXActivity *)self itemSourceController];
  v6 = [v5 assetItemSources];
  v7 = [v6 firstObject];

  v8 = [(PUInternalGIFExportActivity *)self activityType];
  v9 = [v7 activityViewController:v4 itemForActivityType:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  v12 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  v13 = (void *)MEMORY[0x1E4F442D8];
  v14 = [v11 pathExtension];
  v15 = [v13 typeWithFilenameExtension:v14];

  if (!v15 || (int v16 = [v15 conformsToType:*MEMORY[0x1E4F443D0]], v15, v16))
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__38596;
    v29[4] = __Block_byref_object_dispose__38597;
    id v30 = 0;
    v17 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __46__PUInternalGIFExportActivity_performActivity__block_invoke;
    v26[3] = &unk_1E5F2E200;
    id v27 = v12;
    v28 = v29;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __46__PUInternalGIFExportActivity_performActivity__block_invoke_2;
    v23[3] = &unk_1E5F265C8;
    v25 = v29;
    v23[4] = self;
    id v24 = v4;
    [v17 performChanges:v26 completionHandler:v23];

    _Block_object_dispose(v29, 8);
  }
  else
  {
LABEL_8:
    v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"GIF Export Failed" message:@"Failed to get a valid GIF URL" preferredStyle:1];
    v19 = (void *)MEMORY[0x1E4FB1410];
    v20 = PULocalizedString(@"OK");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46__PUInternalGIFExportActivity_performActivity__block_invoke_6;
    v22[3] = &unk_1E5F2BF98;
    v22[4] = self;
    v21 = [v19 actionWithTitle:v20 style:0 handler:v22];
    [v18 addAction:v21];

    [v4 presentViewController:v18 animated:1 completion:0];
  }
}

void __46__PUInternalGIFExportActivity_performActivity__block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F38F28] creationRequestForAssetFromImageAtFileURL:*(void *)(a1 + 32)];
  v2 = [v6 placeholderForCreatedAsset];
  uint64_t v3 = [v2 localIdentifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __46__PUInternalGIFExportActivity_performActivity__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  id v6 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __46__PUInternalGIFExportActivity_performActivity__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:0];
}

void __46__PUInternalGIFExportActivity_performActivity__block_invoke_3(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = (void *)MEMORY[0x1E4F38EB8];
    v15[0] = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v5 = [v4 librarySpecificFetchOptions];
    id v6 = [v2 fetchAssetsWithLocalIdentifiers:v3 options:v5];
    long long v7 = [v6 firstObject];

    [*(id *)(a1 + 32) activityDidFinish:1];
    v14[5] = MEMORY[0x1E4F143A8];
    v14[6] = 3221225472;
    v14[7] = __46__PUInternalGIFExportActivity_performActivity__block_invoke_4;
    v14[8] = &unk_1E5F2ED10;
    v14[9] = v7;
    id v8 = v7;
    px_dispatch_on_main_queue_when_idle_after_delay();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4FB1418];
    v10 = [*(id *)(a1 + 40) localizedDescription];
    id v8 = [v9 alertControllerWithTitle:@"Failed to save GIF" message:v10 preferredStyle:1];

    id v11 = (void *)MEMORY[0x1E4FB1410];
    v12 = PULocalizedString(@"OK");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__PUInternalGIFExportActivity_performActivity__block_invoke_5;
    v14[3] = &unk_1E5F2BF98;
    v14[4] = *(void *)(a1 + 32);
    v13 = [v11 actionWithTitle:v12 style:0 handler:v14];
    [v8 addAction:v13];

    [*(id *)(a1 + 48) presentViewController:v8 animated:1 completion:0];
  }
}

void __46__PUInternalGIFExportActivity_performActivity__block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v2, "px_navigateToOneUpShowingAsset:completionHandler:", *(void *)(a1 + 32), 0);
}

uint64_t __46__PUInternalGIFExportActivity_performActivity__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  if (!MEMORY[0x1B3E7A510](self, a2, a3)) {
    return 0;
  }
  id v4 = [MEMORY[0x1E4F906A0] sharedInstance];
  if ([v4 showInternalGIFExport])
  {
    id v5 = [(PXActivity *)self itemSourceController];
    if ([v5 isPreparingIndividualItems])
    {
      id v6 = [(PUInternalGIFExportActivity *)self _asset];
      char v7 = [v6 canPlayLoopingVideo];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_asset
{
  id v2 = [(PXActivity *)self itemSourceController];
  uint64_t v3 = [v2 assets];

  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_systemImageName
{
  return @"person.2.square.stack";
}

- (id)activityTitle
{
  return @"Export GIF";
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90A30];
}

@end