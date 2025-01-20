@interface PUAssetExplorerReviewScreenFunEffectsActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
- (PUFunEffectsViewControllerObserver)funEffectsObserver;
- (PUReviewAssetProvider)reviewAssetProvider;
- (PUReviewScreenBarsModel)reviewBarsModel;
- (void)_presentFunEffectsViewControllerForAsset:(id)a3;
- (void)performUserInteractionTask;
- (void)setFunEffectsObserver:(id)a3;
- (void)setReviewAssetProvider:(id)a3;
- (void)setReviewBarsModel:(id)a3;
@end

@implementation PUAssetExplorerReviewScreenFunEffectsActionPerformer

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return +[PUAssetExplorerReviewScreenEditActionPerformer shouldEnableOnAsset:a3 inAssetCollection:a4];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return +[PUAssetExplorerReviewScreenEditActionPerformer canPerformOnAsset:a3 inAssetCollection:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewBarsModel, 0);
  objc_destroyWeak((id *)&self->_funEffectsObserver);
  objc_storeStrong((id *)&self->_reviewAssetProvider, 0);
}

- (void)setReviewBarsModel:(id)a3
{
}

- (PUReviewScreenBarsModel)reviewBarsModel
{
  return self->_reviewBarsModel;
}

- (void)setFunEffectsObserver:(id)a3
{
}

- (PUFunEffectsViewControllerObserver)funEffectsObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_funEffectsObserver);
  return (PUFunEffectsViewControllerObserver *)WeakRetained;
}

- (void)setReviewAssetProvider:(id)a3
{
}

- (PUReviewAssetProvider)reviewAssetProvider
{
  return self->_reviewAssetProvider;
}

- (void)_presentFunEffectsViewControllerForAsset:(id)a3
{
  id v4 = a3;
  v8 = objc_alloc_init(PUReviewAssetsMediaProvider);
  v5 = [[PUFunEffectsViewController alloc] initWithReviewAsset:v4 mediaProvider:v8];

  v6 = [(PUAssetExplorerReviewScreenFunEffectsActionPerformer *)self funEffectsObserver];
  [(PUFunEffectsViewController *)v5 registerObserver:v6];

  v7 = [(PUAssetExplorerReviewScreenFunEffectsActionPerformer *)self reviewBarsModel];
  [(PUFunEffectsViewController *)v5 setReviewBarsModel:v7];

  [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:[(PUAssetActionPerformer *)self presentViewController:v5] error:0];
}

- (void)performUserInteractionTask
{
  [(PUAssetExplorerReviewScreenActionPerformer *)self executePerformUserInteractionTaskBlock];
  id v4 = [(PUAssetActionPerformer *)self assets];
  if ([v4 count] != 1)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenFunEffectsActionPerformer.m" lineNumber:35 description:@"There can be only one asset in a fun effects action"];
  }
  v5 = [v4 firstObject];
  v6 = [(PUAssetExplorerReviewScreenFunEffectsActionPerformer *)self reviewAssetProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__PUAssetExplorerReviewScreenFunEffectsActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E5F238B0;
  v8[4] = self;
  [(PUAssetExplorerReviewScreenActionPerformer *)self requestReviewAssetForDisplayAsset:v5 reviewAssetProvider:v6 completionHandler:v8];
}

uint64_t __82__PUAssetExplorerReviewScreenFunEffectsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = *(void **)(a1 + 32);
  if (a5) {
    return [v5 _presentFunEffectsViewControllerForAsset:a5];
  }
  else {
    return objc_msgSend(v5, "completeUserInteractionTaskWithSuccess:error:", 0);
  }
}

@end