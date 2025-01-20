@interface PUPassiveContentDetailViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSDictionary)keyAssetBySuggestionUUID;
- (PHSuggestion)currentSuggestion;
- (PUParallaxLayerStackDebugViewController)parallaxViewController;
- (PUPassiveContentDataSource)dataSource;
- (PUPassiveContentDebugViewSpec)spec;
- (PUPassiveContentDetailViewController)initWithSpec:(id)a3;
- (PUProgressIndicatorView)progressIndicator;
- (PXAssetsDataSourceManager)oneUpDataSourceManager;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contextMenuConfigurationForItemAtIndexPath:(id)a3;
- (id)oneUpPresentationDataSourceManager:(id)a3;
- (id)oneUpPresentationInitialAssetReference:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dataSourceChanged:(id)a3;
- (void)displayAsset:(id)a3;
- (void)hideProgressIndicator;
- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)setCurrentSuggestion:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setKeyAssetBySuggestionUUID:(id)a3;
- (void)setOneUpDataSourceManager:(id)a3;
- (void)setParallaxViewController:(id)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setSpec:(id)a3;
- (void)showProgressIndicator:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUPassiveContentDetailViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_parallaxViewController, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setProgressIndicator:(id)a3
{
}

- (PUProgressIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setParallaxViewController:(id)a3
{
}

- (PUParallaxLayerStackDebugViewController)parallaxViewController
{
  return self->_parallaxViewController;
}

- (void)setOneUpDataSourceManager:(id)a3
{
}

- (PXAssetsDataSourceManager)oneUpDataSourceManager
{
  return self->_oneUpDataSourceManager;
}

- (void)setCurrentSuggestion:(id)a3
{
}

- (PHSuggestion)currentSuggestion
{
  return self->_currentSuggestion;
}

- (void)setKeyAssetBySuggestionUUID:(id)a3
{
}

- (NSDictionary)keyAssetBySuggestionUUID
{
  return self->_keyAssetBySuggestionUUID;
}

- (void)setSpec:(id)a3
{
}

- (PUPassiveContentDebugViewSpec)spec
{
  return self->_spec;
}

- (PUPassiveContentDataSource)dataSource
{
  return self->_dataSource;
}

- (void)dataSourceChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PUPassiveContentDetailViewController_dataSourceChanged___block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__PUPassiveContentDetailViewController_dataSourceChanged___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 reloadData];
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  objc_msgSend(a4, "asset", a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(PUPassiveContentDetailViewController *)self keyAssetBySuggestionUUID];
  v6 = [v5 allKeysForObject:v11];
  v7 = [v6 firstObject];

  v8 = [(PUPassiveContentDetailViewController *)self dataSource];
  v9 = [v8 indexPathForSuggestionUUID:v7];

  v10 = [(PUPassiveContentDetailViewController *)self collectionView];
  [v10 scrollToItemAtIndexPath:v9 atScrollPosition:2 animated:1];
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  v4 = [(PUPassiveContentDetailViewController *)self oneUpPresentationDataSourceManager:a3];
  v5 = [v4 dataSource];

  v6 = [(PUPassiveContentDetailViewController *)self dataSource];
  v7 = [v6 fetchResult];
  v8 = [(PUPassiveContentDetailViewController *)self currentSuggestion];
  uint64_t v9 = [v7 indexOfObject:v8];

  v12[0] = [v5 identifier];
  v12[1] = 0;
  v12[2] = v9;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  v10 = [v5 assetReferenceAtItemIndexPath:v12];

  return v10;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F904E0]);
  return v3;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v4 = [(PUPassiveContentDetailViewController *)self oneUpDataSourceManager];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v6 = [(PUPassiveContentDetailViewController *)self dataSource];
    v7 = [v6 fetchResult];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
          v13 = [(PUPassiveContentDetailViewController *)self keyAssetBySuggestionUUID];
          v14 = [v12 uuid];
          v15 = [v13 objectForKeyedSubscript:v14];

          if (v15) {
            [v5 addObject:v15];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }

    v16 = [(PUPassiveContentDetailViewController *)self dataSource];
    v17 = [v16 fetchResult];
    v18 = [v17 photoLibrary];

    id v19 = objc_alloc(MEMORY[0x1E4F39150]);
    v20 = (void *)[v19 initWithObjects:v5 photoLibrary:v18 fetchType:*MEMORY[0x1E4F39648] fetchPropertySets:0 identifier:0 registerIfNeeded:0];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F90508]) initWithAssetFetchResult:v20 options:4];
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F90500]) initWithPhotosDataSourceConfiguration:v21];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F90468]) initWithPhotosDataSource:v22];
    [(PUPassiveContentDetailViewController *)self setOneUpDataSourceManager:v23];
  }
  v24 = [(PUPassiveContentDetailViewController *)self oneUpDataSourceManager];
  return v24;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUPassiveContentDetailViewController;
  -[PUPassiveContentDetailViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  id v5 = [(PUPassiveContentDetailViewController *)self collectionView];
  v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4FB2770];
  id v10 = a4;
  uint64_t v11 = [a3 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"wallpaperClassHeader" forIndexPath:v8];
  LODWORD(a3) = [v10 isEqualToString:v9];

  if (a3)
  {
    v12 = [(PUPassiveContentDetailViewController *)self dataSource];
    v13 = objc_msgSend(v12, "titleForSection:", objc_msgSend(v8, "section"));

    uint64_t v14 = [v13 length];
    [v11 setHidden:v14 == 0];
    if (v14)
    {
      [v11 setSectionHeaderTitle:v13];
      v15 = [(PUPassiveContentDetailViewController *)self spec];
      [v15 headerInsets];
      objc_msgSend(v11, "setSectionHeaderInsets:");
    }
  }

  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  objc_super v7 = [(PUPassiveContentDetailViewController *)self dataSource];
  uint64_t v8 = [v7 countInSection:a5];

  if (v8)
  {
    uint64_t v9 = [(PUPassiveContentDetailViewController *)self dataSource];
    id v10 = [v9 titleForSection:a5];

    if ([v10 length])
    {
      uint64_t v11 = [(PUPassiveContentDetailViewController *)self spec];
      [v11 headerReferenceSize];
      double v13 = v12;
      double v15 = v14;
    }
    else
    {
      double v13 = *MEMORY[0x1E4F1DB30];
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v5 = [(PUPassiveContentDetailViewController *)self spec];
  [v5 collectionViewContentInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v5 = [(PUPassiveContentDetailViewController *)self spec];
  [v5 itemSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)contextMenuConfigurationForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPassiveContentDetailViewController *)self dataSource];
  double v6 = [v5 objectAtIndexPath:v4];

  double v7 = [(PUPassiveContentDetailViewController *)self keyAssetBySuggestionUUID];
  double v8 = [v6 uuid];
  double v9 = [v7 objectForKeyedSubscript:v8];

  double v10 = (void *)MEMORY[0x1E4FB1678];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke;
  v15[3] = &unk_1E5F2BF00;
  id v16 = v6;
  id v17 = v9;
  v18 = self;
  id v11 = v9;
  id v12 = v6;
  double v13 = [v10 configurationWithIdentifier:0 previewProvider:0 actionProvider:v15];

  return v13;
}

id __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = +[PUWallpaperHelper deleteSuggestionAction:*(void *)(a1 + 32)];
  [v2 addObject:v18];
  id v17 = +[PUWallpaperHelper rejectSuggestionAction:*(void *)(a1 + 32)];
  [v2 addObject:v17];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) navigationController];
  id v5 = +[PUWallpaperHelper presentPosterEditorWithAsset:v3 fromViewController:v4];

  [v2 addObject:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v7 = +[PUWallpaperVisualDiagnosticsProvider visualDiagnosticsActionForSuggestion:*(void *)(a1 + 32) asset:*(void *)(a1 + 40) fromViewController:*(void *)(a1 + 48)];
  [v6 addObject:v7];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  long long v29 = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_2;
  v30 = &unk_1E5F2ED10;
  uint64_t v31 = v9;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_3;
  v25 = &unk_1E5F2E3B8;
  uint64_t v26 = v9;
  double v10 = +[PUParallaxLayerStackRadarController visualDiagnosticsActionForAsset:compoundLayerStack:segmentationItem:fromViewController:actionBeingHandler:actionEndHandler:](PUParallaxLayerStackRadarController, "visualDiagnosticsActionForAsset:compoundLayerStack:segmentationItem:fromViewController:actionBeingHandler:actionEndHandler:", v8, 0, 0);
  [v6 addObject:v10];
  id v11 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v6];
  [v2 addObject:v11];

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_4;
  v20[3] = &unk_1E5F2ED10;
  uint64_t v21 = *(void *)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_5;
  v19[3] = &unk_1E5F2E3B8;
  v19[4] = v21;
  double v14 = +[PUWallpaperHelper fileRadarSubmenuForSuggestion:v12 asset:v13 actionBeingHandler:v20 actionEndHandler:v19];
  [v2 addObject:v14];
  double v15 = [MEMORY[0x1E4FB1970] menuWithChildren:v2];

  return v15;
}

uint64_t __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showProgressIndicator:@"Gathering Attachments..."];
}

uint64_t __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideProgressIndicator];
}

uint64_t __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) showProgressIndicator:@"Gathering Attachments..."];
}

uint64_t __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideProgressIndicator];
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return -[PUPassiveContentDetailViewController contextMenuConfigurationForItemAtIndexPath:](self, "contextMenuConfigurationForItemAtIndexPath:", a4, a5.x, a5.y);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PUPassiveContentDetailViewController *)self dataSource];
  id v10 = [v6 objectAtIndexPath:v5];

  [(PUPassiveContentDetailViewController *)self setCurrentSuggestion:v10];
  double v7 = [(PUPassiveContentDetailViewController *)self keyAssetBySuggestionUUID];
  uint64_t v8 = [v10 uuid];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  [(PUPassiveContentDetailViewController *)self displayAsset:v9];
}

- (void)hideProgressIndicator
{
  uint64_t v3 = [(PUPassiveContentDetailViewController *)self progressIndicator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PUPassiveContentDetailViewController_hideProgressIndicator__block_invoke;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = self;
  [v3 endShowingProgressImmediately:1 animated:1 withCompletionHandler:v4];
}

uint64_t __61__PUPassiveContentDetailViewController_hideProgressIndicator__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) progressIndicator];
  [v2 removeFromSuperview];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setProgressIndicator:0];
}

- (void)showProgressIndicator:(id)a3
{
  id v14 = a3;
  id v4 = [(PUPassiveContentDetailViewController *)self progressIndicator];

  if (!v4)
  {
    id v5 = [[PUProgressIndicatorView alloc] initWithStyle:0];
    [(PUPassiveContentDetailViewController *)self setProgressIndicator:v5];

    id v6 = [(PUPassiveContentDetailViewController *)self progressIndicator];
    [v6 setLocalizedMessage:v14];

    double v7 = [(PUPassiveContentDetailViewController *)self progressIndicator];
    [v7 setDeterminate:0];

    uint64_t v8 = [(PUPassiveContentDetailViewController *)self progressIndicator];
    [v8 setShowsBackground:1];

    uint64_t v9 = [(PUPassiveContentDetailViewController *)self progressIndicator];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v10 = [(PUPassiveContentDetailViewController *)self progressIndicator];
    [v10 beginShowingProgressImmediately:1 animated:1];

    id v11 = [(PUPassiveContentDetailViewController *)self view];
    uint64_t v12 = [(PUPassiveContentDetailViewController *)self progressIndicator];
    [v11 addSubview:v12];

    uint64_t v13 = [(PUPassiveContentDetailViewController *)self progressIndicator];
    [v13 sizeToFit];
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PUPassiveContentDetailViewController;
  [(PUPassiveContentDetailViewController *)&v8 viewDidLayoutSubviews];
  uint64_t v3 = [(PUPassiveContentDetailViewController *)self view];
  [v3 bounds];
  double MidX = CGRectGetMidX(v9);
  id v5 = [(PUPassiveContentDetailViewController *)self view];
  [v5 bounds];
  double MidY = CGRectGetMidY(v10);
  double v7 = [(PUPassiveContentDetailViewController *)self progressIndicator];
  objc_msgSend(v7, "setCenter:", MidX, MidY);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"wallpaperCell" forIndexPath:v6];
  objc_super v8 = [(PUPassiveContentDetailViewController *)self dataSource];
  CGRect v9 = [v8 objectAtIndexPath:v6];

  CGRect v10 = [(PUPassiveContentDetailViewController *)self keyAssetBySuggestionUUID];
  id v11 = [v9 uuid];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  [v7 setAsset:v12];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F8E858], "posterClassificationForSuggestionSubtype:", objc_msgSend(v9, "subtype"));
  id v14 = [v7 wallpaperView];
  [v14 setClassificationMode:v13];

  double v15 = [(PUPassiveContentDetailViewController *)self spec];
  uint64_t v16 = [v15 shouldShowClockOverlay];
  id v17 = [v7 wallpaperView];
  [v17 setShowClockOverlay:v16];

  v18 = [(PUPassiveContentDetailViewController *)self spec];
  uint64_t v19 = [v18 cropMode];
  v20 = [v7 wallpaperView];
  [v20 setCropMode:v19];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(PUPassiveContentDetailViewController *)self dataSource];
  int64_t v6 = [v5 countInSection:a4];

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v3 = [(PUPassiveContentDetailViewController *)self dataSource];
  int64_t v4 = [v3 sectionCount];

  return v4;
}

- (void)displayAsset:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PUPassiveContentDetailViewController *)self currentSuggestion];
    if ([v5 type] == 8)
    {
      int64_t v6 = [(PUPassiveContentDetailViewController *)self px_oneUpPresentation];
      [v6 setDelegate:self];
      [v6 startWithConfigurationHandler:0];
    }
    else
    {
      int64_t v6 = +[PUSuggestionsSettings sharedInstance];
      switch([v6 viewMode])
      {
        case 0:
          double v7 = [(PUPassiveContentDetailViewController *)self px_oneUpPresentation];
          [(PUWallpaperPosterEditDebugViewController *)v7 setDelegate:self];
          [(PUWallpaperPosterEditDebugViewController *)v7 startWithConfigurationHandler:0];
          goto LABEL_11;
        case 1:
          objc_super v8 = [(PUPassiveContentDetailViewController *)self parallaxViewController];

          if (!v8)
          {
            CGRect v9 = objc_alloc_init(PUParallaxLayerStackDebugViewController);
            [(PUPassiveContentDetailViewController *)self setParallaxViewController:v9];
          }
          CGRect v10 = [(PUPassiveContentDetailViewController *)self parallaxViewController];
          [v10 loadPHAsset:v4];

          double v7 = [(PUPassiveContentDetailViewController *)self navigationController];
          id v11 = [(PUPassiveContentDetailViewController *)self parallaxViewController];
          [(PUWallpaperPosterEditDebugViewController *)v7 pushViewController:v11 animated:0];

          goto LABEL_11;
        case 2:
          uint64_t v12 = [PUWallpaperPlaygroundViewController alloc];
          v14[0] = v4;
          uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
          double v7 = [(PUWallpaperPlaygroundViewController *)v12 initWithAssets:v13];

          [(PUWallpaperPosterEditDebugViewController *)v7 presentPlaygroundWithPresentingViewController:self];
          goto LABEL_11;
        case 3:
          double v7 = [[PUWallpaperPosterEditDebugViewController alloc] initWithAsset:v4];
          [(PUWallpaperPosterEditDebugViewController *)v7 setModalPresentationStyle:5];
          [(PUPassiveContentDetailViewController *)self presentViewController:v7 animated:1 completion:0];
LABEL_11:

          break;
        default:
          break;
      }
    }
  }
}

- (void)setDataSource:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v5 = (PUPassiveContentDataSource *)a3;
  if (self->_dataSource != v5)
  {
    objc_storeStrong((id *)&self->_dataSource, a3);
    int64_t v6 = [(PUPassiveContentDataSource *)self->_dataSource delegates];
    [v6 addPointer:self];

    double v7 = [(PUPassiveContentDataSource *)v5 fetchResult];
    objc_super v8 = [v7 photoLibrary];
    CGRect v9 = [v8 librarySpecificFetchOptions];

    uint64_t v10 = *MEMORY[0x1E4F39538];
    v15[0] = *MEMORY[0x1E4F394E0];
    v15[1] = v10;
    v15[2] = *MEMORY[0x1E4F39458];
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    [v9 setFetchPropertySets:v11];

    uint64_t v12 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v7 options:v9];
    keyAssetBySuggestionUUID = self->_keyAssetBySuggestionUUID;
    self->_keyAssetBySuggestionUUID = v12;

    id v14 = [(PUPassiveContentDetailViewController *)self collectionView];
    [v14 reloadData];
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PUPassiveContentDetailViewController;
  [(PUPassiveContentDetailViewController *)&v8 viewDidLoad];
  [(PUPassiveContentDetailViewController *)self px_enableOneUpPresentation];
  uint64_t v3 = [(PUPassiveContentDetailViewController *)self dataSource];
  id v4 = [v3 title];
  [(PUPassiveContentDetailViewController *)self setTitle:v4];

  id v5 = [(PUPassiveContentDetailViewController *)self collectionView];
  int64_t v6 = [(PUPassiveContentDetailViewController *)self spec];
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v6, "collectionViewCellClass"), @"wallpaperCell");

  double v7 = [(PUPassiveContentDetailViewController *)self collectionView];
  [v7 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"wallpaperClassHeader"];
}

- (PUPassiveContentDetailViewController)initWithSpec:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  double v7 = [(PUPassiveContentDetailViewController *)self initWithCollectionViewLayout:v6];
  objc_super v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_spec, a3);
  }

  return v8;
}

@end