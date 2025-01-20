@interface PUPortraitWallpaperCandidateDebugViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PUParallaxLayerStackDebugViewController)parallaxViewController;
- (PUPassiveContentDebugViewSpec)spec;
- (PUPortraitWallpaperCandidateDebugViewController)initWithSpec:(id)a3 mode:(int64_t)a4;
- (PUProgressIndicatorView)progressIndicator;
- (PXAssetsDataSourceManager)oneUpDataSourceManager;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)oneUpPresentationDataSourceManager:(id)a3;
- (id)oneUpPresentationInitialAssetReference:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)mode;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)displayAsset:(id)a3;
- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)setMode:(int64_t)a3;
- (void)setOneUpDataSourceManager:(id)a3;
- (void)setParallaxViewController:(id)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setSpec:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUPortraitWallpaperCandidateDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_parallaxViewController, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
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

- (void)setSpec:(id)a3
{
}

- (PUPassiveContentDebugViewSpec)spec
{
  return self->_spec;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v5 = a4;
  v6 = [(PUPortraitWallpaperCandidateDebugViewController *)self collectionView];
  if (v5) {
    [v5 indexPath];
  }
  v7 = PXIndexPathFromSimpleIndexPath();
  [v6 scrollToItemAtIndexPath:v7 atScrollPosition:2 animated:1];
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  v4 = [(PUPortraitWallpaperCandidateDebugViewController *)self oneUpPresentationDataSourceManager:a3];
  id v5 = [v4 dataSource];

  NSUInteger v6 = [(PHFetchResult *)self->_assets indexOfObject:self->_currentAsset];
  v9[0] = [v5 identifier];
  v9[1] = 0;
  v9[2] = v6;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  v7 = [v5 assetReferenceAtItemIndexPath:v9];

  return v7;
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
  v4 = [(PUPortraitWallpaperCandidateDebugViewController *)self oneUpDataSourceManager];

  if (!v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F90508]) initWithAssetFetchResult:self->_assets options:4];
    NSUInteger v6 = (void *)[objc_alloc(MEMORY[0x1E4F90500]) initWithPhotosDataSourceConfiguration:v5];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F90468]) initWithPhotosDataSource:v6];
    [(PUPortraitWallpaperCandidateDebugViewController *)self setOneUpDataSourceManager:v7];
  }
  return [(PUPortraitWallpaperCandidateDebugViewController *)self oneUpDataSourceManager];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUPortraitWallpaperCandidateDebugViewController;
  -[PUPortraitWallpaperCandidateDebugViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  id v5 = [(PUPortraitWallpaperCandidateDebugViewController *)self collectionView];
  NSUInteger v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];
}

- (void)displayAsset:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[PUSuggestionsSettings sharedInstance];
    switch([v5 viewMode])
    {
      case 0:
        NSUInteger v6 = [(PUPortraitWallpaperCandidateDebugViewController *)self px_oneUpPresentation];
        [(PUWallpaperPosterEditDebugViewController *)v6 setDelegate:self];
        [(PUWallpaperPosterEditDebugViewController *)v6 startWithConfigurationHandler:0];
        goto LABEL_9;
      case 1:
        objc_super v7 = [(PUPortraitWallpaperCandidateDebugViewController *)self parallaxViewController];

        if (!v7)
        {
          v8 = objc_alloc_init(PUParallaxLayerStackDebugViewController);
          [(PUPortraitWallpaperCandidateDebugViewController *)self setParallaxViewController:v8];
        }
        v9 = [(PUPortraitWallpaperCandidateDebugViewController *)self parallaxViewController];
        [v9 loadPHAsset:v4];

        NSUInteger v6 = [(PUPortraitWallpaperCandidateDebugViewController *)self navigationController];
        v10 = [(PUPortraitWallpaperCandidateDebugViewController *)self parallaxViewController];
        [(PUWallpaperPosterEditDebugViewController *)v6 pushViewController:v10 animated:0];

        goto LABEL_9;
      case 2:
        v11 = [PUWallpaperPlaygroundViewController alloc];
        v13[0] = v4;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
        NSUInteger v6 = [(PUWallpaperPlaygroundViewController *)v11 initWithAssets:v12];

        [(PUWallpaperPosterEditDebugViewController *)v6 presentPlaygroundWithPresentingViewController:self];
        goto LABEL_9;
      case 3:
        NSUInteger v6 = [[PUWallpaperPosterEditDebugViewController alloc] initWithAsset:v4];
        [(PUWallpaperPosterEditDebugViewController *)v6 setModalPresentationStyle:5];
        [(PUPortraitWallpaperCandidateDebugViewController *)self presentViewController:v6 animated:1 completion:0];
LABEL_9:

        break;
      default:
        break;
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[PHFetchResult objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v5 = (PHAsset *)objc_claimAutoreleasedReturnValue();
  currentAsset = self->_currentAsset;
  self->_currentAsset = v5;

  objc_super v7 = self->_currentAsset;
  [(PUPortraitWallpaperCandidateDebugViewController *)self displayAsset:v7];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v5 = [(PUPortraitWallpaperCandidateDebugViewController *)self spec];
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
  id v5 = [(PUPortraitWallpaperCandidateDebugViewController *)self spec];
  [v5 itemSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"wallpaperCell" forIndexPath:v6];
  assets = self->_assets;
  uint64_t v9 = [v6 row];

  double v10 = [(PHFetchResult *)assets objectAtIndexedSubscript:v9];
  [v7 setAsset:v10];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(PHFetchResult *)self->_assets count];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)viewDidLoad
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PUPortraitWallpaperCandidateDebugViewController;
  [(PUPortraitWallpaperCandidateDebugViewController *)&v21 viewDidLoad];
  [(PUPortraitWallpaperCandidateDebugViewController *)self px_enableOneUpPresentation];
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  id v4 = v3;
  int64_t mode = self->_mode;
  switch(mode)
  {
    case 0:
      double v7 = [v3 librarySpecificFetchOptions];
      double v8 = [MEMORY[0x1E4F8E858] knownPersonLocalIdentifiersInPhotoLibrary:v4];
      uint64_t v9 = [MEMORY[0x1E4F8E858] predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:v8];
      [v7 setInternalPredicate:v9];

      double v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
      v22[0] = v10;
      double v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:0];
      v22[1] = v11;
      double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      [v7 setInternalSortDescriptors:v12];

      double v13 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v7];
      assets = self->_assets;
      self->_assets = v13;

LABEL_8:
      break;
    case 1:
      uint64_t v6 = [MEMORY[0x1E4F8E858] coldStartPortraitWallpaperInPhotoLibrary:v3 passingFilterBlock:&__block_literal_global_53009 maximumNumberOfTries:*MEMORY[0x1E4F8EAB8]];
      goto LABEL_7;
    case 2:
      uint64_t v6 = [MEMORY[0x1E4F8E858] coldStartDeviceOwnerWallpaperInPhotoLibrary:v3];
LABEL_7:
      double v7 = (void *)v6;
      id v15 = objc_alloc(MEMORY[0x1E4F39150]);
      double v16 = (PHFetchResult *)[v15 initWithObjects:v7 photoLibrary:v4 fetchType:*MEMORY[0x1E4F39648] fetchPropertySets:0 identifier:0 registerIfNeeded:0];
      double v17 = self->_assets;
      self->_assets = v16;

      goto LABEL_8;
  }
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d items", -[PHFetchResult count](self->_assets, "count"));
  v19 = [(PUPortraitWallpaperCandidateDebugViewController *)self navigationItem];
  [v19 setTitle:v18];

  v20 = [(PUPortraitWallpaperCandidateDebugViewController *)self collectionView];
  [v20 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"wallpaperCell"];
}

uint64_t __62__PUPortraitWallpaperCandidateDebugViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F39358];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithPhotoAsset:v3];

  uint64_t v5 = [MEMORY[0x1E4F8A378] tryLoadSegmentationForColdAsset:v4];
  return v5;
}

- (PUPortraitWallpaperCandidateDebugViewController)initWithSpec:(id)a3 mode:(int64_t)a4
{
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  uint64_t v9 = [(PUPortraitWallpaperCandidateDebugViewController *)self initWithCollectionViewLayout:v8];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spec, a3);
    v10->_int64_t mode = a4;
  }

  return v10;
}

@end