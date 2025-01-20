@interface PUPeopleTileViewController
+ (CGSize)tileSizeForTraitCollection:(id)a3;
+ (double)_interItemSpacingForTraitCollection:(id)a3;
+ (id)_fetchUnsortedPeopleForAsset:(id)a3;
+ (id)_sortedPersonsForFetchResult:(id)a3;
- (BOOL)_compare:(id)a3 to:(id)a4 ignoringIndices:(id)a5;
- (CAGradientLayer)fadeLayer;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)sortedPeople;
- (PHAsset)asset;
- (PHFetchResult)unsortedFetchResult;
- (PUPeopleTileDelegate)peopleDelegate;
- (PUPeopleTileViewController)initWithReuseIdentifier:(id)a3;
- (UICollectionView)collectionView;
- (UICollectionViewCellRegistration)cellRegistration;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)allPeople;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_peopleDidChange:(id)a3;
- (void)_reloadEverythingForAsset:(id)a3;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)photoLibraryDidChange:(id)a3;
- (void)presentPeopleViewController:(id)a3;
- (void)pushPeopleViewController:(id)a3;
- (void)setAsset:(id)a3;
- (void)setCellRegistration:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDisplayAsset:(id)a3;
- (void)setFadeLayer:(id)a3;
- (void)setPeopleDelegate:(id)a3;
- (void)setSortedPeople:(id)a3;
- (void)setUnsortedFetchResult:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUPeopleTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsortedFetchResult, 0);
  objc_storeStrong((id *)&self->_sortedPeople, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_fadeLayer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_peopleDelegate);
}

- (void)setUnsortedFetchResult:(id)a3
{
}

- (PHFetchResult)unsortedFetchResult
{
  return self->_unsortedFetchResult;
}

- (NSArray)sortedPeople
{
  return self->_sortedPeople;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setCellRegistration:(id)a3
{
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setFadeLayer:(id)a3
{
}

- (CAGradientLayer)fadeLayer
{
  return self->_fadeLayer;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setPeopleDelegate:(id)a3
{
}

- (PUPeopleTileDelegate)peopleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peopleDelegate);
  return (PUPeopleTileDelegate *)WeakRetained;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(PUPeopleTileViewController *)self unsortedFetchResult];
  v6 = [v4 changeDetailsForFetchResult:v5];

  if (v6)
  {
    if ([v6 hasIncrementalChanges])
    {
      v7 = [v6 changedIndexes];
      if ([v7 count] == 1)
      {
        v8 = [v6 removedIndexes];
        if (![v8 count])
        {
          v10 = [v6 insertedIndexes];
          uint64_t v11 = [v10 count];

          if (!v11)
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __52__PUPeopleTileViewController_photoLibraryDidChange___block_invoke;
            v12[3] = &unk_1E5F2ECC8;
            id v13 = v6;
            v14 = self;
            dispatch_async(MEMORY[0x1E4F14428], v12);

            goto LABEL_8;
          }
          goto LABEL_7;
        }
      }
    }
LABEL_7:
    v9 = [(PUPeopleTileViewController *)self asset];
    [(PUPeopleTileViewController *)self _reloadEverythingForAsset:v9];
  }
LABEL_8:
}

void __52__PUPeopleTileViewController_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) fetchResultAfterChanges];
  v3 = +[PUPeopleTileViewController _sortedPersonsForFetchResult:v2];
  id v4 = [*(id *)(a1 + 40) sortedPeople];
  v5 = [*(id *)(a1 + 32) changedObjects];
  v6 = [v5 firstObject];

  v7 = v4;
  uint64_t v8 = [v3 indexOfObject:v6];
  uint64_t v9 = [v4 indexOfObject:v6];
  [*(id *)(a1 + 40) setUnsortedFetchResult:v2];
  [*(id *)(a1 + 40) setSortedPeople:v3];
  uint64_t v30 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:0];
  v10 = *(void **)(a1 + 40);
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  if (v8 != v9)
  {
    v29 = v2;
    [NSNumber numberWithInteger:v9];
    v21 = v20 = v4;
    v32[0] = v21;
    v22 = [NSNumber numberWithInteger:v8];
    v32[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v24 = [v11 setWithArray:v23];
    v28 = v20;
    LODWORD(v20) = [v10 _compare:v20 to:v3 ignoringIndices:v24];

    v25 = *(void **)(a1 + 40);
    if (v20)
    {
      v17 = [*(id *)(a1 + 40) collectionView];
      v26 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:0];
      v18 = (void *)v30;
      [v17 moveItemAtIndexPath:v26 toIndexPath:v30];
      v31[0] = v26;
      v31[1] = v30;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      [v17 reloadItemsAtIndexPaths:v27];

      v7 = v28;
      v2 = v29;
      goto LABEL_9;
    }
    v17 = [*(id *)(a1 + 40) asset];
    [v25 _reloadEverythingForAsset:v17];
    v7 = v28;
    v2 = v29;
LABEL_8:
    v18 = (void *)v30;
    goto LABEL_9;
  }
  v12 = [NSNumber numberWithInteger:v8];
  v34[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  v14 = [v11 setWithArray:v13];
  int v15 = [v10 _compare:v4 to:v3 ignoringIndices:v14];

  v16 = *(void **)(a1 + 40);
  if (!v15)
  {
    v17 = [*(id *)(a1 + 40) asset];
    [v16 _reloadEverythingForAsset:v17];
    goto LABEL_8;
  }
  v17 = [*(id *)(a1 + 40) collectionView];
  v18 = (void *)v30;
  uint64_t v33 = v30;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  [v17 reloadItemsAtIndexPaths:v19];

LABEL_9:
}

- (BOOL)_compare:(id)a3 to:(id)a4 ignoringIndices:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 count];
  if (v10 != [v8 count])
  {
LABEL_8:
    BOOL v17 = 0;
    goto LABEL_9;
  }
  if ([v7 count])
  {
    uint64_t v11 = 0;
    do
    {
      v12 = [NSNumber numberWithUnsignedInteger:v11];
      char v13 = [v9 containsObject:v12];

      if ((v13 & 1) == 0)
      {
        v14 = [v7 objectAtIndexedSubscript:v11];
        int v15 = [v8 objectAtIndexedSubscript:v11];
        int v16 = [v14 isEqual:v15];

        if (!v16) {
          goto LABEL_8;
        }
      }
    }
    while (++v11 < (unint64_t)[v7 count]);
  }
  BOOL v17 = 1;
LABEL_9:

  return v17;
}

- (void)_peopleDidChange:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKey:*MEMORY[0x1E4F90FB8]];

  id v7 = [(PUPeopleTileViewController *)self sortedPeople];
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  if ([v6 count] == 1)
  {
    id v8 = [v6 anyObject];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __47__PUPeopleTileViewController__peopleDidChange___block_invoke;
    v29[3] = &unk_1E5F275A8;
    id v9 = v8;
    id v30 = v9;
    v31 = &v32;
    [v7 enumerateObjectsUsingBlock:v29];
  }
  if (v33[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "localIdentifier", (void)v20);
          char v15 = [v6 containsObject:v14];

          if (v15)
          {

            id v10 = [(PUPeopleTileViewController *)self asset];
            [(PUPeopleTileViewController *)self _reloadEverythingForAsset:v10];
            goto LABEL_15;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v36 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    int v16 = [(PUPeopleTileViewController *)self asset];
    BOOL v17 = +[PUPeopleTileViewController _fetchUnsortedPeopleForAsset:v16];

    v18 = +[PUPeopleTileViewController _sortedPersonsForFetchResult:v17];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PUPeopleTileViewController__peopleDidChange___block_invoke_2;
    block[3] = &unk_1E5F275D0;
    block[4] = self;
    id v25 = v7;
    id v26 = v18;
    id v27 = v17;
    v28 = &v32;
    id v19 = v17;
    id v10 = v18;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_15:

  _Block_object_dispose(&v32, 8);
}

void __47__PUPeopleTileViewController__peopleDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = [a2 localIdentifier];
  LODWORD(v7) = [v7 isEqualToString:v8];

  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __47__PUPeopleTileViewController__peopleDidChange___block_invoke_2(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  v14[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v8 = [v5 setWithArray:v7];
  LODWORD(v2) = [v2 _compare:v3 to:v4 ignoringIndices:v8];

  if (v2)
  {
    [*(id *)(a1 + 32) setUnsortedFetchResult:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) setSortedPeople:*(void *)(a1 + 48)];
    id v9 = [*(id *)(a1 + 32) collectionView];
    id v10 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) inSection:0];
    char v13 = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [v9 reloadItemsAtIndexPaths:v11];
  }
  else
  {
    uint64_t v12 = *(void **)(a1 + 32);
    id v9 = [v12 asset];
    [v12 _reloadEverythingForAsset:v9];
  }
}

- (void)_reloadEverythingForAsset:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PUPeopleTileViewController__reloadEverythingForAsset___block_invoke;
  block[3] = &unk_1E5F2E4E8;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__PUPeopleTileViewController__reloadEverythingForAsset___block_invoke(uint64_t a1)
{
  v2 = +[PUPeopleTileViewController _fetchUnsortedPeopleForAsset:*(void *)(a1 + 32)];
  uint64_t v3 = +[PUPeopleTileViewController _sortedPersonsForFetchResult:v2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PUPeopleTileViewController__reloadEverythingForAsset___block_invoke_2;
  block[3] = &unk_1E5F2D758;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v2;
  id v8 = v3;
  id v4 = v3;
  id v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __56__PUPeopleTileViewController__reloadEverythingForAsset___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 setUnsortedFetchResult:*(void *)(a1 + 32)];
    [v5 setSortedPeople:*(void *)(a1 + 40)];
    id v4 = [v5 collectionView];
    [v4 reloadData];
  }
}

- (void)setSortedPeople:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  sortedPeople = self->_sortedPeople;
  self->_sortedPeople = v4;

  BOOL v6 = [(NSArray *)self->_sortedPeople count] != 0;
  id v7 = [(PUTileViewController *)self viewIfLoaded];
  [v7 setUserInteractionEnabled:v6];
}

- (id)allPeople
{
  v2 = [(PUPeopleTileViewController *)self sortedPeople];
  uint64_t v3 = (void *)MEMORY[0x1E4F90428];
  id v4 = [v2 firstObject];
  id v5 = [v4 photoLibrary];
  BOOL v6 = [v3 peopleFetchResultFromFastEnumeration:v2 photoLibrary:v5];

  return v6;
}

- (void)presentPeopleViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPeopleTileViewController *)self peopleDelegate];
  [v5 presentPeopleViewController:v4];
}

- (void)pushPeopleViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPeopleTileViewController *)self peopleDelegate];
  [v5 pushPeopleViewController:v4];
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v5 = [a3 traitCollection];
  +[PUPeopleTileViewController _interItemSpacingForTraitCollection:v5];
  double v7 = v6;

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v5 = [a3 traitCollection];
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(PUPeopleTileViewController *)self asset];

  if (!v5) {
    return 0;
  }
  double v6 = [(PUPeopleTileViewController *)self sortedPeople];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(PUPeopleTileViewController *)self collectionView];
  int64_t v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"PUPeopleTileCellReuseIdentifier" forIndexPath:v5];

  [v7 setPeopleDelegate:self];
  double v8 = [(PUPeopleTileViewController *)self sortedPeople];
  uint64_t v9 = [v5 item];

  double v10 = [v8 objectAtIndexedSubscript:v9];
  double v11 = [(PUPeopleTileViewController *)self asset];
  [v7 setPerson:v10 asset:v11];

  return v7;
}

- (void)setDisplayAsset:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(PUPeopleTileViewController *)self asset];
    char v5 = [v4 isEqual:v10];

    if ((v5 & 1) == 0)
    {
      double v6 = (PHAsset *)v10;
      int64_t v7 = [(PHAsset *)v6 photoLibrary];
      [v7 registerChangeObserver:self];

      asset = self->_asset;
      self->_asset = v6;
      uint64_t v9 = v6;

      [(PUPeopleTileViewController *)self _reloadEverythingForAsset:v9];
    }
  }
}

- (void)becomeReusable
{
  v4.receiver = self;
  v4.super_class = (Class)PUPeopleTileViewController;
  [(PUTileViewController *)&v4 becomeReusable];
  [(PUPeopleTileViewController *)self setAsset:0];
  [(PUPeopleTileViewController *)self setSortedPeople:0];
  [(PUPeopleTileViewController *)self setUnsortedFetchResult:0];
  uint64_t v3 = [(PUPeopleTileViewController *)self collectionView];
  [v3 reloadData];
}

- (void)applyLayoutInfo:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)PUPeopleTileViewController;
  id v4 = a3;
  [(PUTileViewController *)&v30 applyLayoutInfo:v4];
  char v5 = [(PUPeopleTileViewController *)self collectionView];
  double v6 = [v5 layer];
  [v6 setAllowsGroupOpacity:0];

  [v4 alpha];
  double v8 = v7;

  [v5 setAlpha:v8];
  uint64_t v9 = [(PUTileViewController *)self view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(v5, "setFrame:", v11, v13, v15, v17);
  v18 = [(PUTileViewController *)self view];
  id v19 = [v18 traitCollection];

  +[PUPeopleTileViewController _interItemSpacingForTraitCollection:v19];
  double v21 = v20;
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:v19];
  double v23 = v21 + v22;
  double v24 = (v15 - v23) / v15;
  uint64_t v25 = [v19 layoutDirection];
  if (v25 == 1) {
    double v26 = 0.0;
  }
  else {
    double v26 = 1.0;
  }
  if (v25 == 1) {
    double v24 = 1.0 - v24;
  }
  id v27 = [(PUPeopleTileViewController *)self fadeLayer];
  objc_msgSend(v27, "setFrame:", v11, v13, v15, v17);

  v28 = [(PUPeopleTileViewController *)self fadeLayer];
  objc_msgSend(v28, "setStartPoint:", v24, 0.0);

  v29 = [(PUPeopleTileViewController *)self fadeLayer];
  objc_msgSend(v29, "setEndPoint:", v26, 0.0);

  objc_msgSend(v5, "setContentInset:", 0.0, 0.0, 0.0, v23);
}

- (void)viewDidLoad
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PUPeopleTileViewController;
  [(PUTileViewController *)&v21 viewDidLoad];
  uint64_t v3 = [(PUTileViewController *)self view];
  id v4 = objc_alloc_init(PUPeopleTileCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v4 setScrollDirection:1];
  -[UICollectionViewFlowLayout setSectionInset:](v4, "setSectionInset:", 16.0, 16.0, 16.0, 0.0);
  id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
  double v6 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v7];

  [v6 setShowsHorizontalScrollIndicator:0];
  [v6 setShowsVerticalScrollIndicator:0];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPeopleTileCellReuseIdentifier"];
  [v6 setDataSource:self];
  [v6 setDelegate:self];
  [(PUPeopleTileViewController *)self setCollectionView:v6];
  [v3 addSubview:v6];
  double v8 = [(PUPeopleTileViewController *)self sortedPeople];
  objc_msgSend(v3, "setUserInteractionEnabled:", objc_msgSend(v8, "count") != 0);

  uint64_t v9 = [MEMORY[0x1E4F39BD0] layer];
  [(PUPeopleTileViewController *)self setFadeLayer:v9];
  double v10 = [MEMORY[0x1E4F90420] sharedInstance];
  int v11 = [v10 debugFadeLayer];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
    v23[0] = [v12 CGColor];
    id v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
    v23[1] = [v13 CGColor];
    id v14 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
    v23[2] = [v14 CGColor];
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    [v9 setColors:v15];

    double v16 = [v3 layer];
    [v16 addSublayer:v9];
  }
  else
  {
    id v17 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.9];
    v22[0] = [v17 CGColor];
    id v18 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.3];
    v22[1] = [v18 CGColor];
    id v19 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0];
    v22[2] = [v19 CGColor];
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
    [v9 setColors:v20];

    double v16 = [v3 layer];
    [v16 setMask:v9];
  }
}

- (PUPeopleTileViewController)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPeopleTileViewController;
  uint64_t v3 = [(PUTileController *)&v8 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *MEMORY[0x1E4F90FB0];
    double v6 = [MEMORY[0x1E4F90410] sharedManager];
    [v4 addObserver:v3 selector:sel__peopleDidChange_ name:v5 object:v6];
  }
  return v3;
}

+ (id)_sortedPersonsForFetchResult:(id)a3
{
  uint64_t v3 = [a3 fetchedObjects];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_42471];

  return v4;
}

uint64_t __59__PUPeopleTileViewController__sortedPersonsForFetchResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v6 = [v4 name];
  uint64_t v7 = [v6 length];

  objc_super v8 = [v5 name];
  uint64_t v9 = [v8 length];

  if (v7 && !v9) {
    goto LABEL_6;
  }
  if (!v7 && v9)
  {
LABEL_8:
    uint64_t v12 = 1;
    goto LABEL_9;
  }
  unint64_t v10 = [v4 faceCount];
  unint64_t v11 = [v5 faceCount];
  if (v10 <= v11)
  {
    if (v10 >= v11)
    {
      id v14 = [v4 localIdentifier];
      double v15 = [v5 localIdentifier];
      uint64_t v12 = [v14 compare:v15];

      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v12 = -1;
LABEL_9:

  return v12;
}

+ (id)_fetchUnsortedPeopleForAsset:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F390A0];
  id v4 = a3;
  id v5 = [v3 fetchOptionsWithPhotoLibrary:0 orObject:v4];
  [v5 setPersonContext:4];
  v10[0] = *MEMORY[0x1E4F397E0];
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 setFetchPropertySets:v6];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v5 setIncludedDetectionTypes:v7];

  [v5 setIncludeTorsoAndFaceDetectionData:1];
  objc_super v8 = [MEMORY[0x1E4F391F0] fetchPersonsInAsset:v4 options:v5];

  return v8;
}

+ (double)_interItemSpacingForTraitCollection:(id)a3
{
  uint64_t v3 = PXUserInterfaceSizeClassFromUITraitCollection();
  double result = 10.0;
  if (v3 == 2) {
    return 14.0;
  }
  return result;
}

+ (CGSize)tileSizeForTraitCollection:(id)a3
{
  id v4 = a3;
  if (PXUserInterfaceSizeClassFromUITraitCollection() == 2) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = 4;
  }
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:v4];
  double v7 = v6;
  double v9 = v8;
  [a1 _interItemSpacingForTraitCollection:v4];
  double v11 = v10;

  double v12 = v11 * (double)v5 + (double)(v5 | 1) * v7 + 16.0;
  double v13 = v9 + 32.0;
  result.height = v13;
  result.width = v12;
  return result;
}

@end