@interface PUImportSettingsHistoryDebugViewController
+ (void)_updateFlowLayout:(id)a3 withBounds:(CGRect)a4 traitCollection:(id)a5;
- (PHFetchResult)importSessions;
- (PUImportSettingsHistoryDebugViewController)init;
- (id)_assetForIndexPath:(id)a3;
- (id)_assetsForSection:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_reloadData;
- (void)_scrollToBottom:(id)a3;
- (void)_updateTitle;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)setImportSessions:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PUImportSettingsHistoryDebugViewController

- (void).cxx_destruct
{
}

- (PHFetchResult)importSessions
{
  return self->_importSessions;
}

- (id)_assetsForSection:(int64_t)a3
{
  v4 = [(PUImportSettingsHistoryDebugViewController *)self importSessions];
  v5 = [v4 objectAtIndex:a3];

  v6 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:0];

  return v6;
}

- (id)_assetForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[PUImportSettingsHistoryDebugViewController _assetsForSection:](self, "_assetsForSection:", [v4 section]);
  uint64_t v6 = [v4 item];

  v7 = [v5 objectAtIndex:v6];

  return v7;
}

- (void)_scrollToBottom:(id)a3
{
  id v4 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  [v4 contentSize];
  double v6 = v5;
  v7 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  [v7 bounds];
  double v8 = v6 - CGRectGetHeight(v11);

  id v9 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  objc_msgSend(v9, "setContentOffset:animated:", 1, 0.0, v8);
}

- (void)_reloadData
{
  v3 = (void *)MEMORY[0x1E4F39100];
  objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v6 librarySpecificFetchOptions];
  double v5 = [v3 fetchImportSessionsWithOptions:v4];
  [(PUImportSettingsHistoryDebugViewController *)self setImportSessions:v5];
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(PUImportSettingsHistoryDebugViewController *)self importSessions];
  id v6 = [v4 changeDetailsForFetchResult:v5];

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PUImportSettingsHistoryDebugViewController_photoLibraryDidChange___block_invoke;
    block[3] = &unk_1E5F2ED10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __68__PUImportSettingsHistoryDebugViewController_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadData];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PUImportSettingsHistoryDebugViewController *)self _assetForIndexPath:v6];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:v6];

  [v9 setAsset:v8];
  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(PUImportSettingsHistoryDebugViewController *)self importSessions];
  v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "section"));

  CGRect v11 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v10 options:0];
  v12 = [v8 dequeueReusableSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"header" forIndexPath:v7];

  v13 = [v10 title];
  [v12 setPrimaryText:v13];

  v14 = PULocalizedString(@"IMPORT_ITEMS_COUNT");
  uint64_t v20 = [v11 count];
  v15 = PUStringWithValidatedFormat();
  objc_msgSend(v12, "setSecondaryText:", v15, v20);

  v16 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v17 = [v7 section];

  v18 = [v16 colorWithHue:(double)(v17 % 10) / 10.0 saturation:0.5 brightness:1.0 alpha:1.0];
  [v12 setBackgroundColor:v18];

  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v5 = [(PUImportSettingsHistoryDebugViewController *)self importSessions];
  id v6 = [v5 objectAtIndex:a4];

  id v7 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:0];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  v3 = [(PUImportSettingsHistoryDebugViewController *)self importSessions];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)_updateTitle
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(PUImportSettingsHistoryDebugViewController *)self importSessions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(*((void *)&v14 + 1) + 8 * i) options:0];
        v6 += (int)[v9 count];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  v10 = NSString;
  CGRect v11 = [NSNumber numberWithUnsignedInteger:v6];
  v12 = [v10 stringWithFormat:@"Import History - Total: %@", v11];
  v13 = [(PUImportSettingsHistoryDebugViewController *)self navigationItem];
  [v13 setTitle:v12];
}

- (void)setImportSessions:(id)a3
{
  uint64_t v5 = (PHFetchResult *)a3;
  if (self->_importSessions != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_importSessions, a3);
    uint64_t v6 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
    [v6 reloadData];

    [(PUImportSettingsHistoryDebugViewController *)self _updateTitle];
    uint64_t v5 = v7;
  }
}

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PUImportSettingsHistoryDebugViewController;
  [(PUImportSettingsHistoryDebugViewController *)&v16 viewWillLayoutSubviews];
  v3 = objc_opt_class();
  uint64_t v4 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  uint64_t v5 = [v4 collectionViewLayout];
  uint64_t v6 = [(PUImportSettingsHistoryDebugViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  long long v15 = [(PUImportSettingsHistoryDebugViewController *)self traitCollection];
  objc_msgSend(v3, "_updateFlowLayout:withBounds:traitCollection:", v5, v15, v8, v10, v12, v14);
}

- (void)viewDidLoad
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)PUImportSettingsHistoryDebugViewController;
  [(PUImportSettingsHistoryDebugViewController *)&v27 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Bottom" style:0 target:self action:sel__scrollToBottom_];
  v28[0] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Reload" style:0 target:self action:sel__reloadData];
  v28[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  uint64_t v6 = [(PUImportSettingsHistoryDebugViewController *)self navigationItem];
  [v6 setRightBarButtonItems:v5];

  double v7 = [MEMORY[0x1E4FB1618] whiteColor];
  double v8 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  [v8 setBackgroundColor:v7];

  double v9 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  [v9 setShowsVerticalScrollIndicator:1];

  double v10 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  [v10 setClipsToBounds:1];

  double v11 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  [v11 setAlwaysBounceVertical:1];

  double v12 = objc_opt_class();
  double v13 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  double v14 = [v13 collectionViewLayout];
  long long v15 = [(PUImportSettingsHistoryDebugViewController *)self view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(PUImportSettingsHistoryDebugViewController *)self traitCollection];
  objc_msgSend(v12, "_updateFlowLayout:withBounds:traitCollection:", v14, v24, v17, v19, v21, v23);

  v25 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  [v25 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"cell"];

  v26 = [(PUImportSettingsHistoryDebugViewController *)self collectionView];
  [v26 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"header"];

  [(PUImportSettingsHistoryDebugViewController *)self _reloadData];
}

- (void)dealloc
{
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  [v3 unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUImportSettingsHistoryDebugViewController;
  [(PUImportSettingsHistoryDebugViewController *)&v4 dealloc];
}

- (PUImportSettingsHistoryDebugViewController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  v7.receiver = self;
  v7.super_class = (Class)PUImportSettingsHistoryDebugViewController;
  objc_super v4 = [(PUImportSettingsHistoryDebugViewController *)&v7 initWithCollectionViewLayout:v3];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    [v5 registerChangeObserver:v4];
  }
  return v4;
}

+ (void)_updateFlowLayout:(id)a3 withBounds:(CGRect)a4 traitCollection:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  uint64_t v10 = [a5 horizontalSizeClass];
  if (v10 == 1) {
    double v11 = 4.0;
  }
  else {
    double v11 = 20.0;
  }
  if (v10 == 1) {
    uint64_t v12 = 5;
  }
  else {
    uint64_t v12 = 10;
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v13 = floor((CGRectGetWidth(v16) - (double)(v12 + 1) * v11) / (double)v12);
  objc_msgSend(v14, "setItemSize:", v13, v13);
  [v14 setMinimumLineSpacing:v11];
  [v14 setMinimumInteritemSpacing:v11];
  [v14 setScrollDirection:0];
  objc_msgSend(v14, "setSectionInset:", v11, v11, v11, v11);
  objc_msgSend(v14, "setHeaderReferenceSize:", 0.0, 50.0);
  [v14 setSectionHeadersPinToVisibleBounds:1];
}

@end