@interface PXMessagesStackBalloonViewController
- (BOOL)stackView:(id)a3 shouldAutoplayAsset:(id)a4;
- (PXAssetActionManager)assetActionManager;
- (PXAssetsDataSourceManager)dataSourceManager;
- (PXMessagesStackBalloonViewController)initWithCoder:(id)a3;
- (PXMessagesStackBalloonViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4;
- (PXMessagesStackBalloonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXUIMediaProvider)mediaProvider;
- (void)_executeReuseTest;
- (void)_executeScroll;
- (void)_presentGridWithAssetReference:(id)a3;
- (void)_toggleAdditionalItems;
- (void)_toggleAutoplay;
- (void)_togglePlayableLoading;
- (void)_toggleSnapshot;
- (void)setAssetActionManager:(id)a3;
- (void)stackView:(id)a3 didSelectAssetReference:(id)a4;
- (void)stackViewDidSelectAdditionalItemsCard:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PXMessagesStackBalloonViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (void)setAssetActionManager:(id)a3
{
}

- (PXAssetActionManager)assetActionManager
{
  return self->_assetActionManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)stackViewDidSelectAdditionalItemsCard:(id)a3
{
}

- (BOOL)stackView:(id)a3 shouldAutoplayAsset:(id)a4
{
  return self->_allowAutoplay;
}

- (void)stackView:(id)a3 didSelectAssetReference:(id)a4
{
}

- (void)_presentGridWithAssetReference:(id)a3
{
  v4 = [PXPhotosViewConfiguration alloc];
  v5 = [(PXMessagesStackBalloonViewController *)self dataSourceManager];
  v6 = [(PXMessagesStackBalloonViewController *)self mediaProvider];
  v7 = [(PXMessagesStackBalloonViewController *)self assetActionManager];
  v13 = [(PXPhotosViewConfiguration *)v4 initWithDataSourceManager:v5 mediaProvider:v6 selectionManager:0 assetActionManager:v7 assetCollectionActionManager:0];

  [(PXPhotosViewConfiguration *)v13 setAllowedActions:[(PXPhotosViewConfiguration *)v13 allowedActions] | 0x12000];
  [(PXPhotosViewConfiguration *)v13 setAllowedBehaviors:[(PXPhotosViewConfiguration *)v13 allowedBehaviors] & 0xFFFFFFFFFFFFFFDFLL];
  [(PXPhotosViewConfiguration *)v13 setForbiddenBadges:-1];
  [(PXPhotosViewConfiguration *)v13 setSectionBodyStyle:2];
  [(PXPhotosViewConfiguration *)v13 setWantsModernNavBarButtons:0];
  [(PXPhotosViewConfiguration *)v13 setNavBarStyle:0];
  v8 = +[PXMessagesUISettings sharedInstance];
  if ([v8 enableDebugTapbacksGrid])
  {
    v9 = objc_alloc_init(PXMessagesDebugTapbackStatusManager);
    [(PXPhotosViewConfiguration *)v13 setTapbackStatusManager:v9];
  }
  else
  {
    [(PXPhotosViewConfiguration *)v13 setTapbackStatusManager:0];
  }

  [(PXPhotosViewConfiguration *)v13 setDecorationViewClass:objc_opt_class()];
  v10 = [[PXPhotosUIViewController alloc] initWithConfiguration:v13];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v10];
  [v11 setModalPresentationStyle:0];
  v12 = [(PXMessagesStackView *)self->_stackView gridTransitioningDelegate];
  [v11 setTransitioningDelegate:v12];

  [(PXMessagesStackBalloonViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)_toggleAdditionalItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v12 = *(_OWORD *)off_1E5DAAEF8;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v3 = [(PXMessagesStackView *)self->_stackView additionalItemsCount];
  uint64_t v5 = 0;
  v6 = (void *)&v12 + 1;
  while (v3 != *(v6 - 1) || v4 != *v6)
  {
    v6 += 2;
    if (++v5 == 8)
    {
      LOBYTE(v5) = 0;
      break;
    }
  }
  v8 = &v12 + (((_BYTE)v5 + 1) & 7);
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *((void *)v8 + 1);
  stackView = self->_stackView;
  -[PXMessagesStackView setAdditionalItemsCount:](stackView, "setAdditionalItemsCount:", v9, v10);
}

- (void)_toggleSnapshot
{
  stackView = self->_stackView;
  if (self->_hasTransitionSnapshot)
  {
    [(PXMessagesStackView *)self->_stackView removeTransitionSnapshotView];
  }
  else
  {
    uint64_t v4 = [(PXMessagesStackView *)self->_stackView currentAssetReference];
    id v5 = [(PXMessagesStackView *)stackView installTransitionSnapshotViewForAssetReference:v4 uncroppedImageFrame:0];
  }
  self->_hasTransitionSnapshot ^= 1u;
}

- (void)_toggleAutoplay
{
  self->_allowAutoplay ^= 1u;
}

- (void)_togglePlayableLoading
{
  uint64_t v3 = [(PXMessagesStackView *)self->_stackView allowPlayableContentLoading] ^ 1;
  stackView = self->_stackView;
  [(PXMessagesStackView *)stackView setAllowPlayableContentLoading:v3];
}

- (void)_executeScroll
{
  uint64_t v3 = [(PXBaseMessagesStackView *)self->_stackView dataSourceManager];
  id v8 = [v3 dataSource];

  uint64_t v4 = arc4random_uniform([v8 numberOfItemsInSection:0]);
  if (![(PXBaseMessagesStackView *)self->_stackView scrollToIndex:v4 animated:1])
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to scroll to index %lu", v4);
    v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Scroll Failed" message:v5 preferredStyle:1];
    v7 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
    [v6 addAction:v7];

    [(PXMessagesStackBalloonViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (void)_executeReuseTest
{
  uint64_t v3 = self->_stackView;
  uint64_t v4 = [(PXMessagesStackBalloonViewController *)self dataSourceManager];
  id v5 = [(PXMessagesStackBalloonViewController *)self mediaProvider];
  [(PXBaseMessagesStackView *)v3 setDataSourceManager:0];
  [(PXMessagesStackView *)v3 setMediaProvider:0];
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXMessagesStackBalloonViewController__executeReuseTest__block_invoke;
  block[3] = &unk_1E5DD0F30;
  v11 = v3;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  uint64_t v9 = v3;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __57__PXMessagesStackBalloonViewController__executeReuseTest__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMediaProvider:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setDataSourceManager:v2];
}

- (void)viewWillLayoutSubviews
{
  uint64_t v3 = [(PXMessagesStackBalloonViewController *)self view];
  [v3 bounds];

  [(UIViewController *)self px_safeAreaInsets];
  PXEdgeInsetsInsetRect();
}

- (void)viewDidLoad
{
  v46[6] = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)PXMessagesStackBalloonViewController;
  [(PXMessagesStackBalloonViewController *)&v45 viewDidLoad];
  uint64_t v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  uint64_t v4 = [(PXMessagesStackBalloonViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [PXMessagesStackView alloc];
  dispatch_time_t v6 = -[PXMessagesStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  stackView = self->_stackView;
  self->_stackView = v6;

  id v8 = [(PXMessagesStackBalloonViewController *)self mediaProvider];
  [(PXMessagesStackView *)self->_stackView setMediaProvider:v8];

  [(PXMessagesStackView *)self->_stackView setAllowPlayableContentLoading:1];
  uint64_t v9 = +[PXMessagesUISettings sharedInstance];
  if ([v9 enableDebugTapbacksStack])
  {
    uint64_t v10 = objc_alloc_init(PXMessagesDebugTapbackStatusManager);
    [(PXMessagesStackView *)self->_stackView setTapbackStatusManager:v10];
  }
  else
  {
    [(PXMessagesStackView *)self->_stackView setTapbackStatusManager:0];
  }

  self->_allowAutoplay = 1;
  v11 = [(PXMessagesStackBalloonViewController *)self dataSourceManager];
  [(PXBaseMessagesStackView *)self->_stackView setDataSourceManager:v11];

  id v12 = +[PXMessagesUISettings sharedInstance];
  [v12 verticalContentInsets];
  -[PXBaseMessagesStackView setVerticalContentInsets:](self->_stackView, "setVerticalContentInsets:");

  [(PXMessagesStackView *)self->_stackView setDelegate:self];
  id v13 = [(PXMessagesStackBalloonViewController *)self view];
  [v13 addSubview:self->_stackView];

  objc_initWeak(&location, self);
  uint64_t v14 = (void *)MEMORY[0x1E4FB13F0];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke;
  v42[3] = &unk_1E5DD2930;
  objc_copyWeak(&v43, &location);
  v31 = [v14 actionWithTitle:@"Scroll" image:0 identifier:0 handler:v42];
  v15 = (void *)MEMORY[0x1E4FB13F0];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_2;
  v40[3] = &unk_1E5DD2930;
  objc_copyWeak(&v41, &location);
  v30 = [v15 actionWithTitle:@"Reuse Test" image:0 identifier:0 handler:v40];
  v16 = (void *)MEMORY[0x1E4FB13F0];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_3;
  v38[3] = &unk_1E5DD2930;
  objc_copyWeak(&v39, &location);
  v17 = [v16 actionWithTitle:@"Toggle Playable Loading" image:0 identifier:0 handler:v38];
  v18 = (void *)MEMORY[0x1E4FB13F0];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_4;
  v36[3] = &unk_1E5DD2930;
  objc_copyWeak(&v37, &location);
  v19 = [v18 actionWithTitle:@"Toggle autoplay" image:0 identifier:0 handler:v36];
  v20 = (void *)MEMORY[0x1E4FB13F0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_5;
  v34[3] = &unk_1E5DD2930;
  objc_copyWeak(&v35, &location);
  v21 = [v20 actionWithTitle:@"Toggle Snapshot" image:0 identifier:0 handler:v34];
  v22 = (void *)MEMORY[0x1E4FB13F0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_6;
  v32[3] = &unk_1E5DD2930;
  objc_copyWeak(&v33, &location);
  v23 = [v22 actionWithTitle:@"Toggle +N" image:0 identifier:0 handler:v32];
  id v24 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v25 = (void *)MEMORY[0x1E4FB1970];
  v46[0] = v31;
  v46[1] = v30;
  v46[2] = v17;
  v46[3] = v19;
  v46[4] = v21;
  v46[5] = v23;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:6];
  v27 = [v25 menuWithChildren:v26];
  v28 = (void *)[v24 initWithTitle:@"Actions" menu:v27];
  v29 = [(PXMessagesStackBalloonViewController *)self navigationItem];
  [v29 setRightBarButtonItem:v28];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _executeScroll];
}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _executeReuseTest];
}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _togglePlayableLoading];
}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleAutoplay];
}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSnapshot];
}

void __51__PXMessagesStackBalloonViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleAdditionalItems];
}

- (PXMessagesStackBalloonViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  dispatch_time_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMessagesStackBalloonViewController.m", 49, @"%s is not available as initializer", "-[PXMessagesStackBalloonViewController initWithCoder:]");

  abort();
}

- (PXMessagesStackBalloonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMessagesStackBalloonViewController.m", 45, @"%s is not available as initializer", "-[PXMessagesStackBalloonViewController initWithNibName:bundle:]");

  abort();
}

- (PXMessagesStackBalloonViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXMessagesStackBalloonViewController;
  uint64_t v9 = [(PXMessagesStackBalloonViewController *)&v12 initWithNibName:0 bundle:0];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSourceManager, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
  }

  return v10;
}

@end