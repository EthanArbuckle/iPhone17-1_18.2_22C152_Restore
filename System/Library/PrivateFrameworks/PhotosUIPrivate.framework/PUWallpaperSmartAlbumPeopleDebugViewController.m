@interface PUWallpaperSmartAlbumPeopleDebugViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)dataSourceEntries;
- (PUPassiveContentDebugViewSpec)spec;
- (PUWallpaperSmartAlbumPeopleDebugViewController)initWithSpec:(id)a3 dataSource:(id)a4;
- (PXPassiveContentPeoplePickerDataSourceBase)dataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_updateDisplayDataSource;
- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDataSourceEntries:(id)a3;
- (void)setSpec:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUWallpaperSmartAlbumPeopleDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceEntries, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (void)setDataSourceEntries:(id)a3
{
}

- (NSArray)dataSourceEntries
{
  return self->_dataSourceEntries;
}

- (void)setDataSource:(id)a3
{
}

- (PXPassiveContentPeoplePickerDataSourceBase)dataSource
{
  return self->_dataSource;
}

- (void)setSpec:(id)a3
{
}

- (PUPassiveContentDebugViewSpec)spec
{
  return self->_spec;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperSmartAlbumPeopleDebugViewController;
  -[PUWallpaperSmartAlbumPeopleDebugViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  v5 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self collectionView];
  v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4FB2770];
  id v10 = a4;
  v11 = [a3 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"peopleHeader" forIndexPath:v8];
  LODWORD(a3) = [v10 isEqualToString:v9];

  if (a3)
  {
    v12 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self dataSourceEntries];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
    v14 = [v13 title];
    [v11 setSectionHeaderTitle:v14];

    v15 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self spec];
    [v15 headerInsets];
    objc_msgSend(v11, "setSectionHeaderInsets:");
  }
  return v11;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  v5 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self spec];
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
  v5 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self spec];
  [v5 headerReferenceSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  v5 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self spec];
  [v5 itemSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"peopleCell" forIndexPath:v6];
  uint64_t v8 = [v7 tag] + 1;
  [v7 setTag:v8];
  double v9 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self dataSourceEntries];
  double v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  double v11 = [v10 persons];
  uint64_t v12 = [v6 row];

  double v13 = [v11 objectAtIndex:v12];

  id v14 = objc_alloc(MEMORY[0x1E4F90408]);
  double v15 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self spec];
  [v15 itemSize];
  double v17 = v16;
  double v19 = v18;
  v20 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self collectionView];
  v21 = [v20 traitCollection];
  [v21 displayScale];
  v23 = objc_msgSend(v14, "initWithPerson:targetSize:displayScale:", v13, v17, v19, v22);

  v24 = [MEMORY[0x1E4F90410] sharedManager];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __88__PUWallpaperSmartAlbumPeopleDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v30[3] = &unk_1E5F23AF0;
  id v25 = v7;
  v32 = v13;
  uint64_t v33 = v8;
  id v31 = v25;
  id v26 = v13;
  [v24 requestFaceCropForOptions:v23 resultHandler:v30];

  v27 = v32;
  id v28 = v25;

  return v28;
}

void __88__PUWallpaperSmartAlbumPeopleDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = *(id *)(a1 + 32);
  double v10 = v6;
  id v11 = *(id *)(a1 + 40);
  id v7 = v5;
  id v8 = v6;
  px_dispatch_on_main_queue();
}

void __88__PUWallpaperSmartAlbumPeopleDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) tag] == *(void *)(a1 + 64))
  {
    id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F90FA0]];
    [v3 CGRectValue];
    objc_msgSend(*(id *)(a1 + 32), "setImage:normalizedFaceRect:", *(void *)(a1 + 48));
    v2 = [*(id *)(a1 + 56) name];
    [*(id *)(a1 + 32) setName:v2];

    objc_msgSend(*(id *)(a1 + 32), "setFavorite:", objc_msgSend(*(id *)(a1 + 56), "type") == 1);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self dataSourceEntries];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 persons];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self dataSourceEntries];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__PUWallpaperSmartAlbumPeopleDebugViewController_passiveContentPeoplePickerDataSourceChanged___block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __94__PUWallpaperSmartAlbumPeopleDebugViewController_passiveContentPeoplePickerDataSourceChanged___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDataSource:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateDisplayDataSource];
}

- (void)_updateDisplayDataSource
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(_PXWallpaperPeoplePickerDataSourceEntry);
  id v4 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self dataSource];
  id v5 = [v4 vipPersons];
  [(_PXWallpaperPeoplePickerDataSourceEntry *)v3 setPersons:v5];

  [(_PXWallpaperPeoplePickerDataSourceEntry *)v3 setTitle:@"VIP"];
  id v6 = objc_alloc_init(_PXWallpaperPeoplePickerDataSourceEntry);
  id v7 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self dataSource];
  int64_t v8 = [v7 nonVIPPersons];
  [(_PXWallpaperPeoplePickerDataSourceEntry *)v6 setPersons:v8];

  [(_PXWallpaperPeoplePickerDataSourceEntry *)v6 setTitle:@"Non-VIP with shuffle suggestions"];
  v12[0] = v3;
  v12[1] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  dataSourceEntries = self->_dataSourceEntries;
  self->_dataSourceEntries = v9;

  id v11 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self collectionView];
  [v11 reloadData];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperSmartAlbumPeopleDebugViewController;
  [(PUWallpaperSmartAlbumPeopleDebugViewController *)&v7 viewDidLoad];
  id v3 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"peopleCell"];

  id v4 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self collectionView];
  [v4 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"peopleHeader"];

  id v5 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self dataSource];
  [v5 addChangeObserver:self];

  id v6 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self dataSource];
  [v6 startBackgroundFetch];
}

- (PUWallpaperSmartAlbumPeopleDebugViewController)initWithSpec:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  double v10 = [(PUWallpaperSmartAlbumPeopleDebugViewController *)self initWithCollectionViewLayout:v9];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_spec, a3);
    objc_storeStrong((id *)&v11->_dataSource, a4);
  }

  return v11;
}

@end