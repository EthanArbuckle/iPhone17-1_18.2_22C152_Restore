@interface PUAssetExplorerReviewScreenEditActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
- (PUPhotoEditViewControllerSessionDelegate)photoDelegate;
- (PUReviewAssetProvider)reviewAssetProvider;
- (void)_presentEditViewControllerForReviewAsset:(id)a3;
- (void)performUserInteractionTask;
- (void)setPhotoDelegate:(id)a3;
- (void)setReviewAssetProvider:(id)a3;
@end

@implementation PUAssetExplorerReviewScreenEditActionPerformer

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4 = a3;
  char v5 = [v4 isTemporaryPlaceholder];
  char v6 = [v4 isAnimatedImage];

  return (v5 | v6) ^ 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 mediaType];
  unint64_t v6 = [v4 mediaSubtypes];

  if (v5 == 1)
  {
    uint64_t v7 = (v6 >> 10) & 1;
    return v7 ^ 1;
  }
  if (v5 == 2)
  {
    LOBYTE(v7) = 0;
    return v7 ^ 1;
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoDelegate);
  objc_storeStrong((id *)&self->_reviewAssetProvider, 0);
}

- (void)setPhotoDelegate:(id)a3
{
}

- (PUPhotoEditViewControllerSessionDelegate)photoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoDelegate);
  return (PUPhotoEditViewControllerSessionDelegate *)WeakRetained;
}

- (void)setReviewAssetProvider:(id)a3
{
}

- (PUReviewAssetProvider)reviewAssetProvider
{
  return self->_reviewAssetProvider;
}

- (void)_presentEditViewControllerForReviewAsset:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  unint64_t v6 = +[PUReviewAsset createUniqueMediaDirectoryForAssetWithIdentifier:v5];

  uint64_t v7 = objc_alloc_init(PUReviewAssetsMediaProvider);
  v8 = [[PUReviewAssetsMediaDestination alloc] initWithOutputDirectory:v6 mediaProvider:v7];
  unint64_t v9 = [v4 playbackStyle];
  if (v9 <= 5 && ((1 << v9) & 0x3A) != 0)
  {
    v10 = [[PUPhotoEditViewController alloc] initWithPhoto:v4 mediaProvider:v7 mediaDestination:v8];
    v11 = [(PUAssetExplorerReviewScreenEditActionPerformer *)self photoDelegate];
    [(PUPhotoEditViewController *)v10 setSessionDelegate:v11];

    BOOL v12 = [(PUAssetActionPerformer *)self presentViewController:v10];
    v13 = self;
    v14 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid playback style for editing: %lu", v9, *MEMORY[0x1E4F28568]);
    v19[0] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v10 = [v15 errorWithDomain:@"com.apple.PUAssetExplorerReviewScreen" code:-1 userInfo:v17];

    v13 = self;
    BOOL v12 = 0;
    v14 = v10;
  }
  [(PUAssetActionPerformer *)v13 completeUserInteractionTaskWithSuccess:v12 error:v14];
}

- (void)performUserInteractionTask
{
  [(PUAssetExplorerReviewScreenActionPerformer *)self executePerformUserInteractionTaskBlock];
  id v4 = [(PUAssetActionPerformer *)self assets];
  if ([v4 count] != 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenEditActionPerformer.m" lineNumber:50 description:@"There can be only one asset in an edit action"];
  }
  uint64_t v5 = [v4 firstObject];
  unint64_t v6 = [(PUAssetExplorerReviewScreenEditActionPerformer *)self reviewAssetProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PUAssetExplorerReviewScreenEditActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E5F238B0;
  v8[4] = self;
  [(PUAssetExplorerReviewScreenActionPerformer *)self requestReviewAssetForDisplayAsset:v5 reviewAssetProvider:v6 completionHandler:v8];
}

uint64_t __76__PUAssetExplorerReviewScreenEditActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  if (a5) {
    return [v5 _presentEditViewControllerForReviewAsset:a5];
  }
  else {
    return objc_msgSend(v5, "completeUserInteractionTaskWithSuccess:error:", 0);
  }
}

@end