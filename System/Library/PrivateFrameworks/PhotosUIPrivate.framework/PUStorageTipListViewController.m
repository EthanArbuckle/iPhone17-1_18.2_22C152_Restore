@interface PUStorageTipListViewController
- (BOOL)canBeShownFromSuspendedState;
- (NSArray)displayedItems;
- (PHPhotoLibrary)photoLibrary;
- (PUStorageTipCollectionViewDataSection)currentDataSection;
- (PUStorageTipCollectionViewDataSectionManager)dataSectionManager;
- (UICollectionView)collectionView;
- (id)_noContentConfiguration;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)parentController;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (id)storageViewForTipType:(unint64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)storageRecovered;
- (void)_updateDisplayedItems;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dismiss;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCollectionView:(id)a3;
- (void)setCurrentDataSection:(id)a3;
- (void)setDataSectionManager:(id)a3;
- (void)setDisplayedItems:(id)a3;
- (void)setParentController:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setStorageRecovered:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation PUStorageTipListViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSection, 0);
  objc_storeStrong((id *)&self->_dataSectionManager, 0);
  objc_storeStrong((id *)&self->_displayedItems, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong(&self->_preferenceValue, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

- (void)setCurrentDataSection:(id)a3
{
}

- (PUStorageTipCollectionViewDataSection)currentDataSection
{
  return self->_currentDataSection;
}

- (void)setDataSectionManager:(id)a3
{
}

- (PUStorageTipCollectionViewDataSectionManager)dataSectionManager
{
  return self->_dataSectionManager;
}

- (void)setDisplayedItems:(id)a3
{
}

- (NSArray)displayedItems
{
  return self->_displayedItems;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setStorageRecovered:(int64_t)a3
{
  self->_storageRecovered = a3;
}

- (int64_t)storageRecovered
{
  return self->_storageRecovered;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (id)readPreferenceValue:(id)a3
{
  return self->_preferenceValue;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  v5 = objc_msgSend(a4, "copy", a3);
  id preferenceValue = self->_preferenceValue;
  self->_id preferenceValue = v5;
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setRootController:(id)a3
{
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
}

- (void)_updateDisplayedItems
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(PUStorageTipListViewController *)self currentDataSection];
  uint64_t v4 = [v3 count];

  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      v6 = [(PUStorageTipListViewController *)self currentDataSection];
      v7 = [v6 objectAtIndex:v5];

      if ([v7 count] >= 1) {
        [v10 addObject:v7];
      }

      ++v5;
      v8 = [(PUStorageTipListViewController *)self currentDataSection];
      uint64_t v9 = [v8 count];
    }
    while (v5 < v9);
  }
  [(PUStorageTipListViewController *)self setDisplayedItems:v10];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)PUStorageTipCollectionViewDataSectionObservationContext != a5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PUStorageTipListViewController.m" lineNumber:183 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v9 = v8;
  id v10 = [(PUStorageTipListViewController *)self dataSectionManager];
  v11 = [v10 dataSection];

  v12 = [(PUStorageTipListViewController *)self currentDataSection];
  uint64_t v13 = [v12 totalStorageSize];

  if (v13 >= 1)
  {
    int64_t v14 = [(PUStorageTipListViewController *)self storageRecovered];
    v15 = [(PUStorageTipListViewController *)self currentDataSection];
    -[PUStorageTipListViewController setStorageRecovered:](self, "setStorageRecovered:", [v15 totalStorageSize] + v14 - objc_msgSend(v11, "totalStorageSize"));
  }
  [(PUStorageTipListViewController *)self setCurrentDataSection:v11];
  [(PUStorageTipListViewController *)self _updateDisplayedItems];
  v16 = [(PUStorageTipListViewController *)self displayedItems];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    [(PUStorageTipListViewController *)self setContentUnavailableConfiguration:0];
  }
  else
  {
    v18 = [(PUStorageTipListViewController *)self _noContentConfiguration];
    [(PUStorageTipListViewController *)self setContentUnavailableConfiguration:v18];

    v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_INFO, "Cloud Storage Recommendation has no content available.", v22, 2u);
    }
  }
  v20 = [(PUStorageTipListViewController *)self collectionView];
  [v20 reloadData];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((id)*MEMORY[0x1E4FB2760] != v10)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUStorageTipListViewController.m", 150, @"Invalid parameter not satisfying: %@", @"kind == UICollectionElementKindSectionFooter" object file lineNumber description];
  }
  v12 = [v9 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:@"PUStorageTipFooter" forIndexPath:v11];
  uint64_t v13 = [v12 defaultContentConfiguration];
  int64_t v14 = [(PUStorageTipListViewController *)self displayedItems];
  if ([v14 count])
  {
    v15 = PULocalizedString(@"STORAGE_MANAGEMENT_REVIEW_ALL_LIST_FOOTER");
    [v13 setText:v15];
  }
  else
  {
    [v13 setText:&stru_1F06BE7B8];
  }

  [v12 setContentConfiguration:v13];
  return v12;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUStorageTipListViewController *)self displayedItems];
  id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  id v10 = [v7 dequeueReusableCellWithReuseIdentifier:@"PUStorageTipCell" forIndexPath:v6];

  id v11 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  v12 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v13 = [v9 systemImageName];
  int64_t v14 = [v12 systemImageNamed:v13];
  [v11 setImage:v14];

  v15 = [v9 title];
  [v11 setText:v15];

  v16 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v9, "totalSizeInBytes"), 0);
  [v11 setSecondaryText:v16];

  uint64_t v17 = PLUIGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = [v9 title];
    v19 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v9, "totalSizeInBytes"), 0);
    *(_DWORD *)buf = 138412546;
    v30 = v18;
    __int16 v31 = 2112;
    v32 = v19;
    _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_INFO, "Cloud Storage Recoverable for %@: %@", buf, 0x16u);
  }
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 10.0, 20.0, 10.0, 20.0);
  [v10 setContentConfiguration:v11];
  id v20 = objc_alloc(MEMORY[0x1E4FB1528]);
  v21 = (void *)MEMORY[0x1E4F28EE0];
  v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "count"));
  v23 = [v21 localizedStringFromNumber:v22 numberStyle:1];
  v24 = (void *)[v20 initWithText:v23];

  id v25 = objc_alloc_init(MEMORY[0x1E4FB1518]);
  v28[0] = v25;
  v28[1] = v24;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v10 setAccessories:v26];

  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(PUStorageTipListViewController *)self displayedItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  id v7 = [(PUStorageTipListViewController *)self displayedItems];
  uint64_t v8 = [v6 item];

  id v11 = [v7 objectAtIndexedSubscript:v8];

  id v9 = [(PUStorageTipListViewController *)self navigationController];
  id v10 = -[PUStorageTipListViewController storageViewForTipType:](self, "storageViewForTipType:", [v11 storageTipType]);
  [v9 pushViewController:v10 animated:1];
}

- (id)_noContentConfiguration
{
  v2 = [MEMORY[0x1E4FB1658] emptyConfiguration];
  v3 = PULocalizedString(@"STORAGE_MANAGEMENT_REVIEW_ALL_LIST_EMPTY");
  [v2 setSecondaryText:v3];

  uint64_t v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  int64_t v5 = [v2 secondaryTextProperties];
  [v5 setFont:v4];

  return v2;
}

- (id)storageViewForTipType:(unint64_t)a3
{
  v3 = off_1E5F1EBE8;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_4;
    case 1uLL:
      v3 = off_1E5F1F130;
      goto LABEL_4;
    case 2uLL:
      v3 = off_1E5F1ECD0;
LABEL_4:
      self = (PUStorageTipListViewController *)objc_alloc_init(*v3);
      break;
    case 3uLL:
      int64_t v5 = self;
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:v5 file:@"PUStorageTipListViewController.m" lineNumber:100 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      break;
  }
  return self;
}

- (void)dismiss
{
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)PUStorageTipListViewController;
  [(PUStorageTipListViewController *)&v22 viewDidLoad];
  objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  v3 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = v3;

  int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  [v5 setFooterMode:1];
  id v6 = [MEMORY[0x1E4FB1580] layoutWithListConfiguration:v5];
  id v7 = objc_alloc(MEMORY[0x1E4FB1568]);
  uint64_t v8 = [(PUStorageTipListViewController *)self view];
  [v8 bounds];
  id v9 = (UICollectionView *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v6);
  collectionView = self->_collectionView;
  self->_collectionView = v9;

  [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUStorageTipCell"];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"PUStorageTipFooter"];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  id v11 = [[PUStorageTipCollectionViewDataSectionManager alloc] initWithPhotoLibrary:self->_photoLibrary];
  dataSectionManager = self->_dataSectionManager;
  self->_dataSectionManager = v11;

  [(PUStorageTipCollectionViewDataSectionManager *)self->_dataSectionManager registerChangeObserver:self context:PUStorageTipCollectionViewDataSectionObservationContext];
  uint64_t v13 = [(PXDataSectionManager *)self->_dataSectionManager dataSection];
  currentDataSection = self->_currentDataSection;
  self->_currentDataSection = v13;

  self->_storageRecovered = 0;
  v15 = PULocalizedString(@"STORAGE_MANAGEMENT_REVIEW_ALL_LIST_TITLE");
  [(PUStorageTipListViewController *)self setTitle:v15];

  v16 = [(PUStorageTipListViewController *)self view];
  [v16 addSubview:self->_collectionView];

  id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v18 = PXLocalizedString();
  v19 = (void *)[v17 initWithTitle:v18 style:2 target:self action:sel_dismiss];

  id v20 = [(PUStorageTipListViewController *)self navigationItem];
  [v20 setRightBarButtonItem:v19];

  v21 = [MEMORY[0x1E4FB1658] loadingConfiguration];
  [(PUStorageTipListViewController *)self setContentUnavailableConfiguration:v21];
}

@end