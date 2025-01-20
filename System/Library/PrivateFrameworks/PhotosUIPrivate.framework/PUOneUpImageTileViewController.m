@interface PUOneUpImageTileViewController
- (id)dismissalProgressBlock;
- (id)presentationProgressBlock;
- (void)_updateAssetViewModelBestImage;
- (void)_updateAssetViewModelContentsRect;
- (void)_updateInteractionHostViewRegistration;
- (void)applyLayoutInfo:(id)a3;
- (void)assetViewModelDidChange:(id)a3;
- (void)didChangeIsOnPrimaryDisplay;
- (void)displayedImageRequestResultDidChange;
- (void)viewDidLoad;
@end

@implementation PUOneUpImageTileViewController

- (id)dismissalProgressBlock
{
  v3 = [(PUImageTileViewController *)self imageView];
  v4 = [v3 layer];
  int v5 = [v4 wantsExtendedDynamicRangeContent];

  if (v5)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__PUOneUpImageTileViewController_dismissalProgressBlock__block_invoke;
    v9[3] = &unk_1E5F28C60;
    objc_copyWeak(&v10, &location);
    v6 = _Block_copy(v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = 0;
  }
  v7 = _Block_copy(v6);

  return v7;
}

void __56__PUOneUpImageTileViewController_dismissalProgressBlock__block_invoke(uint64_t a1, double a2)
{
  double v2 = 1.0 - a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained imageView];
  v4 = [v3 layer];
  [v4 setContentsEDRStrength:v2];
}

- (id)presentationProgressBlock
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PUOneUpImageTileViewController_presentationProgressBlock__block_invoke;
  v5[3] = &unk_1E5F28C60;
  objc_copyWeak(&v6, &location);
  double v2 = _Block_copy(v5);
  v3 = _Block_copy(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __59__PUOneUpImageTileViewController_presentationProgressBlock__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained imageView];
  v4 = [v3 layer];
  [v4 setContentsEDRStrength:a2];
}

- (void)_updateAssetViewModelBestImage
{
  v3 = [(PUImageTileViewController *)self displayedImageRequestResult];
  v4 = [(PUImageTileViewController *)self assetViewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PUOneUpImageTileViewController__updateAssetViewModelBestImage__block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  id v8 = v3;
  id v9 = v4;
  id v5 = v4;
  id v6 = v3;
  [v5 performChanges:v7];
}

void __64__PUOneUpImageTileViewController__updateAssetViewModelBestImage__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) imageIsFullQuality])
  {
    id v2 = [*(id *)(a1 + 32) image];
    [*(id *)(a1 + 40) setBestImage:v2];
  }
}

- (void)_updateInteractionHostViewRegistration
{
  if ([(PUTileViewController *)self isOnPrimaryDisplay])
  {
    id v4 = [(PUImageTileViewController *)self assetViewModel];
    v3 = [(PUImageTileViewController *)self imageView];
    [v4 registerView:v3 forImageAnalysisInteractionHostMode:2];
  }
}

- (void)_updateAssetViewModelContentsRect
{
  v3 = [(PUImageTileViewController *)self assetViewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__PUOneUpImageTileViewController__updateAssetViewModelContentsRect__block_invoke;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __67__PUOneUpImageTileViewController__updateAssetViewModelContentsRect__block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) imageView];
  id v2 = [v12 layer];
  [v2 contentsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [*(id *)(a1 + 32) assetViewModel];
  objc_msgSend(v11, "setMainImageContentsRect:", v4, v6, v8, v10);
}

- (void)didChangeIsOnPrimaryDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpImageTileViewController;
  [(PUTileViewController *)&v3 didChangeIsOnPrimaryDisplay];
  [(PUOneUpImageTileViewController *)self _updateInteractionHostViewRegistration];
}

- (void)displayedImageRequestResultDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpImageTileViewController;
  [(PUImageTileViewController *)&v3 displayedImageRequestResultDidChange];
  [(PUOneUpImageTileViewController *)self _updateAssetViewModelBestImage];
}

- (void)assetViewModelDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUOneUpImageTileViewController;
  id v4 = a3;
  [(PUImageTileViewController *)&v6 assetViewModelDidChange:v4];
  double v5 = [(PUImageTileViewController *)self imageView];
  [v4 unregisterView:v5 forImageAnalysisInteractionHostMode:2];

  [(PUOneUpImageTileViewController *)self _updateInteractionHostViewRegistration];
}

- (void)applyLayoutInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpImageTileViewController;
  [(PUImageTileViewController *)&v4 applyLayoutInfo:a3];
  [(PUOneUpImageTileViewController *)self _updateAssetViewModelContentsRect];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpImageTileViewController;
  [(PUTileViewController *)&v4 viewDidLoad];
  [(PUOneUpImageTileViewController *)self _updateInteractionHostViewRegistration];
  objc_super v3 = [(PUImageTileViewController *)self imageView];
  [v3 setUserInteractionEnabled:1];
}

@end