@interface PUPassiveContentSummaryViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)dataSource;
- (NSMutableDictionary)keyAssetBySuggestionUUID;
- (PUPassiveContentDebugViewSpec)spec;
- (PUPassiveContentSummaryViewController)initWithSpec:(id)a3 dataSource:(id)a4;
- (PUProgressIndicatorView)progressIndicator;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contextMenuConfigurationForItemAtIndexPath:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dataSourceChanged:(id)a3;
- (void)hideProgressIndicator;
- (void)setDataSource:(id)a3;
- (void)setKeyAssetBySuggestionUUID:(id)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setSpec:(id)a3;
- (void)showProgressIndicator:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUPassiveContentSummaryViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicator, 0);
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

- (void)setKeyAssetBySuggestionUUID:(id)a3
{
}

- (NSMutableDictionary)keyAssetBySuggestionUUID
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

- (void)setDataSource:(id)a3
{
}

- (NSArray)dataSource
{
  return self->_dataSource;
}

- (void)dataSourceChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PUPassiveContentSummaryViewController_dataSourceChanged___block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__PUPassiveContentSummaryViewController_dataSourceChanged___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 reloadData];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUPassiveContentSummaryViewController;
  -[PUPassiveContentSummaryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  v5 = [(PUPassiveContentSummaryViewController *)self collectionView];
  v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4FB2770];
  id v10 = a4;
  v11 = [a3 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"wallpaperClassHeader" forIndexPath:v8];
  LODWORD(a3) = [v10 isEqualToString:v9];

  if (a3)
  {
    v12 = [(PUPassiveContentSummaryViewController *)self dataSource];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));

    uint64_t v14 = [v13 count];
    [v11 setHidden:v14 == 0];
    if (v14)
    {
      v15 = [v13 title];
      [v11 setSectionHeaderTitle:v15];

      v16 = [(PUPassiveContentSummaryViewController *)self spec];
      [v16 headerInsets];
      objc_msgSend(v11, "setSectionHeaderInsets:");
    }
  }

  return v11;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  v5 = [(PUPassiveContentSummaryViewController *)self spec];
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

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v7 = [(PUPassiveContentSummaryViewController *)self dataSource];
  double v8 = [v7 objectAtIndexedSubscript:a5];

  if ([v8 count])
  {
    double v9 = [(PUPassiveContentSummaryViewController *)self spec];
    [v9 headerReferenceSize];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  v5 = [(PUPassiveContentSummaryViewController *)self spec];
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
  v5 = [(PUPassiveContentSummaryViewController *)self dataSource];
  double v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  double v7 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v8 = [v4 row];

  double v9 = [v7 indexPathForRow:v8 inSection:0];
  double v10 = [v6 objectAtIndexPath:v9];

  double v11 = [(PUPassiveContentSummaryViewController *)self keyAssetBySuggestionUUID];
  double v12 = [v10 uuid];
  double v13 = [v11 objectForKeyedSubscript:v12];

  double v14 = (void *)MEMORY[0x1E4FB1678];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke;
  v19[3] = &unk_1E5F2BF00;
  id v20 = v10;
  id v21 = v13;
  v22 = self;
  id v15 = v13;
  id v16 = v10;
  double v17 = [v14 configurationWithIdentifier:0 previewProvider:0 actionProvider:v19];

  return v17;
}

id __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = +[PUWallpaperHelper deleteSuggestionAction:*(void *)(a1 + 32)];
  [v2 addObject:v18];
  double v17 = +[PUWallpaperHelper rejectSuggestionAction:*(void *)(a1 + 32)];
  [v2 addObject:v17];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) navigationController];
  v5 = +[PUWallpaperHelper presentPosterEditorWithAsset:v3 fromViewController:v4];

  [v2 addObject:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v7 = +[PUWallpaperVisualDiagnosticsProvider visualDiagnosticsActionForSuggestion:*(void *)(a1 + 32) asset:*(void *)(a1 + 40) fromViewController:*(void *)(a1 + 48)];
  [v6 addObject:v7];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_2;
  v30 = &unk_1E5F2ED10;
  uint64_t v31 = v9;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_3;
  v25 = &unk_1E5F2E3B8;
  uint64_t v26 = v9;
  double v10 = +[PUParallaxLayerStackRadarController visualDiagnosticsActionForAsset:compoundLayerStack:segmentationItem:fromViewController:actionBeingHandler:actionEndHandler:](PUParallaxLayerStackRadarController, "visualDiagnosticsActionForAsset:compoundLayerStack:segmentationItem:fromViewController:actionBeingHandler:actionEndHandler:", v8, 0, 0);
  [v6 addObject:v10];
  double v11 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v6];
  [v2 addObject:v11];

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_4;
  v20[3] = &unk_1E5F2ED10;
  uint64_t v21 = *(void *)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_5;
  v19[3] = &unk_1E5F2E3B8;
  void v19[4] = v21;
  double v14 = +[PUWallpaperHelper fileRadarSubmenuForSuggestion:v12 asset:v13 actionBeingHandler:v20 actionEndHandler:v19];
  [v2 addObject:v14];
  id v15 = [MEMORY[0x1E4FB1970] menuWithChildren:v2];

  return v15;
}

uint64_t __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showProgressIndicator:@"Gathering Attachments..."];
}

uint64_t __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideProgressIndicator];
}

uint64_t __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) showProgressIndicator:@"Gathering Attachments..."];
}

uint64_t __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideProgressIndicator];
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return -[PUPassiveContentSummaryViewController contextMenuConfigurationForItemAtIndexPath:](self, "contextMenuConfigurationForItemAtIndexPath:", a4, a5.x, a5.y);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PUPassiveContentSummaryViewController *)self dataSource];
  uint64_t v7 = [v5 section];

  id v13 = [v6 objectAtIndexedSubscript:v7];

  uint64_t v8 = [PUPassiveContentDebugViewSpec alloc];
  uint64_t v9 = [(PUPassiveContentSummaryViewController *)self spec];
  double v10 = -[PUPassiveContentDebugViewSpec initWithViewMode:](v8, "initWithViewMode:", [v9 viewMode]);

  double v11 = [[PUPassiveContentDetailViewController alloc] initWithSpec:v10];
  [(PUPassiveContentDetailViewController *)v11 setDataSource:v13];
  uint64_t v12 = [(PUPassiveContentSummaryViewController *)self navigationController];
  [v12 pushViewController:v11 animated:1];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"wallpaperCell" forIndexPath:v6];
  uint64_t v8 = [(PUPassiveContentSummaryViewController *)self dataSource];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  double v10 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v11 = [v6 row];

  uint64_t v12 = [v10 indexPathForRow:v11 inSection:0];
  id v13 = [v9 objectAtIndexPath:v12];

  double v14 = [(PUPassiveContentSummaryViewController *)self keyAssetBySuggestionUUID];
  id v15 = [v13 uuid];
  id v16 = [v14 objectForKeyedSubscript:v15];

  if (!v16)
  {
    double v17 = [v13 photoLibrary];
    v18 = [v17 librarySpecificFetchOptions];

    [v18 setFetchLimit:1];
    uint64_t v19 = *MEMORY[0x1E4F39538];
    v39[0] = *MEMORY[0x1E4F394E0];
    v39[1] = v19;
    v39[2] = *MEMORY[0x1E4F39458];
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
    [v18 setFetchPropertySets:v20];

    id v21 = objc_alloc(MEMORY[0x1E4F39150]);
    v38 = v13;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    uint64_t v23 = [v13 photoLibrary];
    v24 = (void *)[v21 initWithObjects:v22 photoLibrary:v23 fetchType:*MEMORY[0x1E4F39688] fetchPropertySets:0 identifier:0 registerIfNeeded:0];

    v25 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v24 options:v18];
    uint64_t v26 = [v13 uuid];
    id v16 = [v25 objectForKeyedSubscript:v26];

    uint64_t v27 = [(PUPassiveContentSummaryViewController *)self keyAssetBySuggestionUUID];
    uint64_t v28 = [v13 uuid];
    [v27 setObject:v16 forKeyedSubscript:v28];
  }
  [v7 setAsset:v16];
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F8E858], "posterClassificationForSuggestionSubtype:", objc_msgSend(v13, "subtype"));
  v30 = [v7 wallpaperView];
  [v30 setClassificationMode:v29];

  uint64_t v31 = [(PUPassiveContentSummaryViewController *)self spec];
  uint64_t v32 = [v31 shouldShowClockOverlay];
  v33 = [v7 wallpaperView];
  [v33 setShowClockOverlay:v32];

  v34 = [(PUPassiveContentSummaryViewController *)self spec];
  uint64_t v35 = [v34 cropMode];
  v36 = [v7 wallpaperView];
  [v36 setCropMode:v35];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(PUPassiveContentSummaryViewController *)self dataSource];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  unint64_t v7 = [v6 countInSection:0];

  if (v7 >= 3) {
    return 3;
  }
  else {
    return v7;
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v3 = [(PUPassiveContentSummaryViewController *)self dataSource];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)hideProgressIndicator
{
  uint64_t v3 = [(PUPassiveContentSummaryViewController *)self progressIndicator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PUPassiveContentSummaryViewController_hideProgressIndicator__block_invoke;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = self;
  [v3 endShowingProgressImmediately:1 animated:1 withCompletionHandler:v4];
}

uint64_t __62__PUPassiveContentSummaryViewController_hideProgressIndicator__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) progressIndicator];
  [v2 removeFromSuperview];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setProgressIndicator:0];
}

- (void)showProgressIndicator:(id)a3
{
  id v14 = a3;
  int64_t v4 = [(PUPassiveContentSummaryViewController *)self progressIndicator];

  if (!v4)
  {
    id v5 = [[PUProgressIndicatorView alloc] initWithStyle:0];
    [(PUPassiveContentSummaryViewController *)self setProgressIndicator:v5];

    id v6 = [(PUPassiveContentSummaryViewController *)self progressIndicator];
    [v6 setLocalizedMessage:v14];

    unint64_t v7 = [(PUPassiveContentSummaryViewController *)self progressIndicator];
    [v7 setDeterminate:0];

    uint64_t v8 = [(PUPassiveContentSummaryViewController *)self progressIndicator];
    [v8 setShowsBackground:1];

    uint64_t v9 = [(PUPassiveContentSummaryViewController *)self progressIndicator];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v10 = [(PUPassiveContentSummaryViewController *)self progressIndicator];
    [v10 beginShowingProgressImmediately:1 animated:1];

    uint64_t v11 = [(PUPassiveContentSummaryViewController *)self view];
    uint64_t v12 = [(PUPassiveContentSummaryViewController *)self progressIndicator];
    [v11 addSubview:v12];

    id v13 = [(PUPassiveContentSummaryViewController *)self progressIndicator];
    [v13 sizeToFit];
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PUPassiveContentSummaryViewController;
  [(PUPassiveContentSummaryViewController *)&v8 viewDidLayoutSubviews];
  uint64_t v3 = [(PUPassiveContentSummaryViewController *)self view];
  [v3 bounds];
  double MidX = CGRectGetMidX(v9);
  id v5 = [(PUPassiveContentSummaryViewController *)self view];
  [v5 bounds];
  double MidY = CGRectGetMidY(v10);
  unint64_t v7 = [(PUPassiveContentSummaryViewController *)self progressIndicator];
  objc_msgSend(v7, "setCenter:", MidX, MidY);
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PUPassiveContentSummaryViewController;
  [(PUPassiveContentSummaryViewController *)&v9 viewDidLoad];
  uint64_t v3 = [(PUPassiveContentSummaryViewController *)self navigationController];
  [v3 setDelegate:self];

  int64_t v4 = [(PUPassiveContentSummaryViewController *)self collectionView];
  id v5 = [(PUPassiveContentSummaryViewController *)self spec];
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v5, "collectionViewCellClass"), @"wallpaperCell");

  id v6 = [(PUPassiveContentSummaryViewController *)self collectionView];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"wallpaperClassHeader"];

  unint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  keyAssetBySuggestionUUID = self->_keyAssetBySuggestionUUID;
  self->_keyAssetBySuggestionUUID = v7;
}

- (PUPassiveContentSummaryViewController)initWithSpec:(id)a3 dataSource:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  CGRect v10 = [(PUPassiveContentSummaryViewController *)self initWithCollectionViewLayout:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_spec, a3);
    objc_storeStrong((id *)&v11->_dataSource, a4);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "delegates", (void)v19);
          [v17 addPointer:v11];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
  return v11;
}

@end