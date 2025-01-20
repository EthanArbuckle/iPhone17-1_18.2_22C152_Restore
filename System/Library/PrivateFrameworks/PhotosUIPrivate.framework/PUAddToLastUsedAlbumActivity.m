@interface PUAddToLastUsedAlbumActivity
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUAddToLastUsedAlbumActivity

- (void).cxx_destruct
{
}

- (void)performActivity
{
  v3 = [(PXActivity *)self itemSourceController];
  v4 = [v3 assets];
  v5 = [v4 array];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_undoManager);
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F8FF68]) initWithAssets:v5];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 underlyingAction];
    [v9 setShouldSortAssetsByCreationDate:1];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__PUAddToLastUsedAlbumActivity_performActivity__block_invoke;
    v10[3] = &unk_1E5F2E3B8;
    v10[4] = self;
    [v8 executeWithUndoManager:WeakRetained completionHandler:v10];
  }
  else
  {
    [(UIActivity *)self activityDidFinish:0];
  }
}

uint64_t __47__PUAddToLastUsedAlbumActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) activityDidFinish:a2];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v3 = [(PXActivity *)self itemSourceController];
  v4 = (void *)MEMORY[0x1E4F8FF68];
  v5 = [v3 appPhotoLibrary];
  v6 = [v4 targetAssetCollectionInPhotoLibrary:v5 error:0];

  if (v6) {
    LOBYTE(v6) = +[PUAddToAlbumActivity canPerformWithItemSourceController:v3];
  }

  return (char)v6;
}

- (id)_systemImageName
{
  return @"rectangle.badge.plus";
}

- (id)activityTitle
{
  v2 = [(PXActivity *)self itemSourceController];
  v3 = [v2 assets];
  v4 = [v3 firstObject];
  v5 = [v4 photoLibrary];

  v6 = [MEMORY[0x1E4F8FF68] commandTitleWithPhotoLibrary:v5];

  return v6;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90940];
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 undoManager];
  objc_storeWeak((id *)&self->_undoManager, v10);

  v12.receiver = self;
  v12.super_class = (Class)PUAddToLastUsedAlbumActivity;
  LOBYTE(v5) = [(PXActivity *)&v12 _presentActivityOnViewController:v9 animated:v5 completion:v8];

  return v5;
}

@end