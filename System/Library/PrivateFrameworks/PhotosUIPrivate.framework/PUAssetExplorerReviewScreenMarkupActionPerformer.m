@interface PUAssetExplorerReviewScreenMarkupActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
- (PUPhotoMarkupViewControllerObserver)markupObserver;
- (PUReviewAssetProvider)reviewAssetProvider;
- (void)_presentMarkupViewControllerForReviewAsset:(id)a3;
- (void)performUserInteractionTask;
- (void)setMarkupObserver:(id)a3;
- (void)setReviewAssetProvider:(id)a3;
@end

@implementation PUAssetExplorerReviewScreenMarkupActionPerformer

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4 = a3;
  char v5 = [v4 isTemporaryPlaceholder];
  char v6 = [v4 isAnimatedImage];
  uint64_t v7 = [v4 playbackStyle];
  uint64_t v8 = [v4 mediaType];
  __int16 v9 = [v4 mediaSubtypes];

  BOOL v11 = (v9 & 0x400) == 0 && v8 != 2;
  if (v7 == 5) {
    BOOL v11 = 0;
  }
  if (v6) {
    BOOL v11 = 0;
  }
  return (v5 & 1) == 0 && v11;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return (unint64_t)([a3 mediaType] - 1) < 2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_markupObserver);
  objc_storeStrong((id *)&self->_reviewAssetProvider, 0);
}

- (void)setMarkupObserver:(id)a3
{
}

- (PUPhotoMarkupViewControllerObserver)markupObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_markupObserver);
  return (PUPhotoMarkupViewControllerObserver *)WeakRetained;
}

- (void)setReviewAssetProvider:(id)a3
{
}

- (PUReviewAssetProvider)reviewAssetProvider
{
  return self->_reviewAssetProvider;
}

- (void)_presentMarkupViewControllerForReviewAsset:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_alloc_init(PUReviewAssetsMediaProvider);
  char v5 = [[PUPhotoMarkupViewController alloc] initWithReviewAsset:v4 mediaProvider:v7];

  [(PUPhotoMarkupViewController *)v5 setModalPresentationStyle:0];
  char v6 = [(PUAssetExplorerReviewScreenMarkupActionPerformer *)self markupObserver];
  if (v6) {
    [(PUPhotoMarkupViewController *)v5 registerObserver:v6];
  }
  [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:[(PUAssetActionPerformer *)self presentViewController:v5] error:0];
}

- (void)performUserInteractionTask
{
  [(PUAssetExplorerReviewScreenActionPerformer *)self executePerformUserInteractionTaskBlock];
  id v4 = [(PUAssetActionPerformer *)self assets];
  if ([v4 count] != 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenMarkupActionPerformer.m" lineNumber:51 description:@"There can be only one asset in a markup action"];
  }
  char v5 = [v4 firstObject];
  char v6 = [(PUAssetExplorerReviewScreenMarkupActionPerformer *)self reviewAssetProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E5F238B0;
  v8[4] = self;
  [(PUAssetExplorerReviewScreenActionPerformer *)self requestReviewAssetForDisplayAsset:v5 reviewAssetProvider:v6 completionHandler:v8];
}

void __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = v8;
  if (v8)
  {
    if ([v8 isSpatialMedia])
    {
      v10 = (void *)MEMORY[0x1E4FB1418];
      BOOL v11 = PULocalizedString(@"MARKUP_DISABLES_SPATIAL_PHOTO_TITLE");
      v12 = PULocalizedString(@"PLUGIN_DISABLES_SPATIAL_PHOTO_MESSAGE");
      v13 = [v10 alertControllerWithTitle:v11 message:v12 preferredStyle:1];

      v14 = (void *)MEMORY[0x1E4FB1410];
      v15 = PULocalizedString(@"OK");
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_2;
      v36[3] = &unk_1E5F2BF70;
      v36[4] = *(void *)(a1 + 32);
      id v37 = v9;
      v16 = [v14 actionWithTitle:v15 style:0 handler:v36];
      [v13 addAction:v16];

      v17 = (void *)MEMORY[0x1E4FB1410];
      v18 = PULocalizedString(@"CANCEL");
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_3;
      v35[3] = &unk_1E5F2BF98;
      v35[4] = *(void *)(a1 + 32);
      v19 = [v17 actionWithTitle:v18 style:1 handler:v35];
      [v13 addAction:v19];

      v20 = [*(id *)(a1 + 32) delegate];
      [v20 assetActionPerformer:*(void *)(a1 + 32) presentViewController:v13];

      v21 = v37;
LABEL_8:

      goto LABEL_9;
    }
    if (([v9 mediaSubtypes] & 8) != 0)
    {
      v22 = (void *)MEMORY[0x1E4FB1418];
      v23 = PULocalizedString(@"MARKUP_DISABLES_LIVE_PHOTO_TITLE");
      v24 = PULocalizedString(@"PLUGIN_DISABLES_LIVE_PHOTO_MESSAGE");
      v13 = [v22 alertControllerWithTitle:v23 message:v24 preferredStyle:1];

      v25 = (void *)MEMORY[0x1E4FB1410];
      v26 = PULocalizedString(@"OK");
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_4;
      v33[3] = &unk_1E5F2BF70;
      v33[4] = *(void *)(a1 + 32);
      id v34 = v9;
      v27 = [v25 actionWithTitle:v26 style:0 handler:v33];
      [v13 addAction:v27];

      v28 = (void *)MEMORY[0x1E4FB1410];
      v29 = PULocalizedString(@"CANCEL");
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_5;
      v32[3] = &unk_1E5F2BF98;
      v32[4] = *(void *)(a1 + 32);
      v30 = [v28 actionWithTitle:v29 style:1 handler:v32];
      [v13 addAction:v30];

      v31 = [*(id *)(a1 + 32) delegate];
      [v31 assetActionPerformer:*(void *)(a1 + 32) presentViewController:v13];

      v21 = v34;
      goto LABEL_8;
    }
    [*(id *)(a1 + 32) _presentMarkupViewControllerForReviewAsset:v9];
  }
  else
  {
    [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:v7];
  }
LABEL_9:
}

uint64_t __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentMarkupViewControllerForReviewAsset:*(void *)(a1 + 40)];
}

uint64_t __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

uint64_t __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentMarkupViewControllerForReviewAsset:*(void *)(a1 + 40)];
}

uint64_t __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

@end