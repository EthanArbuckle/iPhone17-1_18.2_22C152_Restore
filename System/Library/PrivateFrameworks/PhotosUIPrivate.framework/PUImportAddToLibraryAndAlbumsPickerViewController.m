@interface PUImportAddToLibraryAndAlbumsPickerViewController
+ (id)dataSourceShiftedIndexPath:(id)a3;
+ (int64_t)dataSourceOffset;
+ (unint64_t)cellTypeForPosition:(id)a3;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (PHPhotoLibrary)photoLibrary;
- (PUImportAddToLibraryAndAlbumsPickerViewController)init;
- (PUImportAddToLibraryAndAlbumsPickerViewController)initWithPhotoLibrary:(id)a3;
- (PXImportAlbumPickerDelegate)delegate;
- (PXPhotoKitCollectionsDataSource)dataSource;
- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager;
- (PXPhotoKitCollectionsDataSourceManagerConfiguration)dataSourceManagerConfiguration;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (id)_userCreatredAlbumsPhotoKitConfiguration;
- (id)posterImageForCollection:(id)a3 indexPath:(id)a4 forCellType:(unint64_t)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dismissPicker;
- (void)_updateDatasource;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDataSource:(id)a3;
- (void)setDataSourceManager:(id)a3;
- (void)setDataSourceManagerConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUImportAddToLibraryAndAlbumsPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSourceManagerConfiguration, 0);
  objc_storeStrong((id *)&self->_createdAlbum, 0);
  objc_storeStrong((id *)&self->_selectedCollection, 0);
}

- (void)setDataSourceManager:(id)a3
{
}

- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSource:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setDelegate:(id)a3
{
}

- (PXImportAlbumPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXImportAlbumPickerDelegate *)WeakRetained;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)dataSourceManagerConfiguration
{
  return self->_dataSourceManagerConfiguration;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  return 1;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v7 = _importToAlbumLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315138;
    v20 = "-[PUImportAddToLibraryAndAlbumsPickerViewController observable:didChange:context:]";
    _os_log_debug_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "%s: data manager changed", (uint8_t *)&v19, 0xCu);
  }

  if ((void *)PXPhotoKitCollectionsDataSourceManagerObservationContext_10013 == a5)
  {
    self->_needsDatasourceUpdate = 1;
    dataSource = self->_dataSource;
    self->_dataSource = 0;

    [(PUImportAddToLibraryAndAlbumsPickerViewController *)self _updateDatasource];
    createdAlbum = self->_createdAlbum;
    if (!createdAlbum) {
      createdAlbum = self->_selectedCollection;
    }
    p_selectedCollection = &self->_selectedCollection;
    objc_storeStrong((id *)&self->_selectedCollection, createdAlbum);
    v11 = self->_createdAlbum;
    self->_createdAlbum = 0;

    v12 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self dataSource];
    v13 = [v12 indexPathForCollection:self->_selectedCollection];

    if (!v13)
    {
      v14 = _importToAlbumLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315138;
        v20 = "-[PUImportAddToLibraryAndAlbumsPickerViewController observable:didChange:context:]";
        _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "%s: data manager changed. Selected collection is missing from data source. Unselecting.", (uint8_t *)&v19, 0xCu);
      }

      v15 = *p_selectedCollection;
      *p_selectedCollection = 0;
    }
    v16 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self delegate];

    if (v16)
    {
      v17 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self delegate];
      [v17 collectionSelected:*p_selectedCollection];
    }
    v18 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self tableView];
    [v18 reloadData];
  }
}

- (PXPhotoKitCollectionsDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self dataSourceManager];
    v5 = [v4 dataSource];
    v6 = self->_dataSource;
    self->_dataSource = v5;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (void)setDataSourceManagerConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = (PXPhotoKitCollectionsDataSourceManagerConfiguration *)a3;
  v6 = _importToAlbumLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    v11 = "-[PUImportAddToLibraryAndAlbumsPickerViewController setDataSourceManagerConfiguration:]";
    _os_log_debug_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  if (self->_dataSourceManagerConfiguration != v5)
  {
    [(PUImportAddToLibraryAndAlbumsPickerViewController *)self configureDataSourceManagerConfiguration:v5];
    objc_storeStrong((id *)&self->_dataSourceManagerConfiguration, a3);
    [(PXPhotoKitCollectionsDataSourceManager *)self->_dataSourceManager unregisterChangeObserver:self context:PXPhotoKitCollectionsDataSourceManagerObservationContext_10013];
    dataSource = self->_dataSource;
    self->_dataSource = 0;

    v8 = (PXPhotoKitCollectionsDataSourceManager *)[objc_alloc(MEMORY[0x1E4F90478]) initWithConfiguration:v5];
    dataSourceManager = self->_dataSourceManager;
    self->_dataSourceManager = v8;

    [(PXPhotoKitCollectionsDataSourceManager *)self->_dataSourceManager registerChangeObserver:self context:PXPhotoKitCollectionsDataSourceManagerObservationContext_10013];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = _importToAlbumLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[PUImportAddToLibraryAndAlbumsPickerViewController tableView:didSelectRowAtIndexPath:]";
    _os_log_debug_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  uint64_t v7 = [(id)objc_opt_class() cellTypeForPosition:v5];
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F90470]);
      uint64_t v20 = *MEMORY[0x1E4F90E38];
      uint64_t v21 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self photoLibrary];
      v22 = objc_msgSend(v21, "px_virtualCollections");
      v23 = [v22 rootAlbumCollectionList];
      v24 = (void *)[v19 initWithActionType:v20 collectionList:v23];

      [v24 setDelegate:self];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __87__PUImportAddToLibraryAndAlbumsPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v29[3] = &unk_1E5F2D4B8;
      id v30 = v24;
      v31 = self;
      id v25 = v24;
      [v25 performActionWithCompletionHandler:v29];
    }
    else if (!v7)
    {
      uint64_t v8 = objc_msgSend(v5, "px_item");
      PXTargetLibrarySetTypePreference();
      v9 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self delegate];

      if (v9)
      {
        int v10 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self delegate];
        [v10 targetLibrarySelected:v8];
      }
      v11 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self tableView];
      [v11 reloadData];

      [(PUImportAddToLibraryAndAlbumsPickerViewController *)self _dismissPicker];
    }
    goto LABEL_18;
  }
  uint64_t v12 = [(id)objc_opt_class() dataSourceShiftedIndexPath:v5];
  v13 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self dataSource];
  v14 = [v13 collectionAtIndexPath:v12];

  v15 = self->_selectedCollection;
  if (v14 == v15)
  {
  }
  else
  {
    v16 = v15;
    v17 = v14;
    int v18 = [(PHCollection *)v17 isEqual:v16];

    if (!v18) {
      goto LABEL_15;
    }
  }
  v17 = 0;
LABEL_15:
  objc_storeStrong((id *)&self->_selectedCollection, v17);
  v26 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self delegate];

  if (v26)
  {
    v27 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self delegate];
    [v27 collectionSelected:self->_selectedCollection];
  }
  v28 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self tableView];
  [v28 reloadData];

  [(PUImportAddToLibraryAndAlbumsPickerViewController *)self _dismissPicker];
LABEL_18:
}

void __87__PUImportAddToLibraryAndAlbumsPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) createdCollection];
  id v5 = v4;
  if (a2 && v4)
  {
    v6 = (void *)MEMORY[0x1E4F38EE8];
    uint64_t v7 = [v4 localIdentifier];
    v20[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v9 = [*(id *)(a1 + 40) photoLibrary];
    int v10 = [v9 librarySpecificFetchOptions];
    v11 = [v6 fetchAssetCollectionsWithLocalIdentifiers:v8 options:v10];

    uint64_t v12 = [v11 lastObject];
    uint64_t v13 = *(void *)(a1 + 40);
    v14 = *(void **)(v13 + 1032);
    *(void *)(v13 + 1032) = v12;

    *(unsigned char *)(*(void *)(a1 + 40) + 1040) = 1;
  }
  v15 = _importToAlbumLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315394;
    v17 = "-[PUImportAddToLibraryAndAlbumsPickerViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEBUG, "%s: notified of new album: %@", (uint8_t *)&v16, 0x16u);
  }

  [*(id *)(a1 + 40) _dismissPicker];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(id)objc_opt_class() cellTypeForPosition:v8];
  if (v9 == 2)
  {
    int v10 = [(id)objc_opt_class() dataSourceShiftedIndexPath:v8];
    v11 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self dataSource];
    uint64_t v12 = [v11 collectionAtIndexPath:v10];
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self posterImageForCollection:v12 indexPath:v8 forCellType:v9];
  if (v12) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 4;
  }
  if (!v12)
  {
    if (v9 == 1)
    {
      v15 = PLLocalizedFrameworkString();
    }
    else
    {
      if (!v9)
      {
        if (objc_msgSend(v8, "px_item"))
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F90690];
          uint64_t v21 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self photoLibrary];
          v22 = [v20 sharedLibraryStatusProviderWithPhotoLibrary:v21];

          [v22 hasPreview];
          v15 = PXLocalizedSharedLibraryString();
        }
        else
        {
          v15 = PXLocalizedSharedLibraryString();
        }
        goto LABEL_19;
      }
      v15 = 0;
    }
LABEL_17:
    uint64_t v19 = 0;
    goto LABEL_20;
  }
  v15 = [v12 localizedTitle];
  if (v9)
  {
    selectedCollection = self->_selectedCollection;
    if (selectedCollection)
    {
      v17 = [(PHCollection *)selectedCollection localIdentifier];
      __int16 v18 = [v12 localIdentifier];
      uint64_t v19 = [v17 isEqualToString:v18];

      goto LABEL_20;
    }
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v23 = objc_msgSend(v8, "px_item");
  uint64_t v19 = v23 == PXTargetLibraryGetTypePreference();
LABEL_20:
  id v30 = v7;
  v24 = [v30 thumbnailView];
  [v24 setImage:v13];

  id v25 = [v30 thumbnailView];
  [v25 setContentMode:v14];

  v26 = [v30 titleLabel];
  [v26 setText:v15];

  if (v9 == 1) {
    [v30 tintColor];
  }
  else {
  v27 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v28 = [v30 titleLabel];
  [v28 setTextColor:v27];

  [v30 setSelected:v19];
  if (v19) {
    uint64_t v29 = 3;
  }
  else {
    uint64_t v29 = 0;
  }
  [v30 setAccessoryType:v29];
  [v30 invalidateIntrinsicContentSize];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return (id)[a3 dequeueReusableCellWithIdentifier:@"PUImportAddToLibraryAndAlbumsPickerViewControllereCellReuseIdentifier" forIndexPath:a4];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    v4 = PLLocalizedFrameworkString();
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F90690];
    v6 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self photoLibrary];
    id v7 = [v5 sharedLibraryStatusProviderWithPhotoLibrary:v6];

    [v7 hasSharedLibraryOrPreview];
    v4 = PXLocalizedSharedLibraryString();
  }
  return v4;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v4 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self dataSource];
    uint64_t v5 = [v4 numberOfItemsInSection:0];
    int64_t v6 = [(id)objc_opt_class() dataSourceOffset] + v5;

    id v7 = _importToAlbumLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[PUImportAddToLibraryAndAlbumsPickerViewController tableView:numberOfRowsInSection:]";
      __int16 v13 = 2048;
      int64_t v14 = v6;
      _os_log_debug_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "%s: %lu", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F90690];
    uint64_t v9 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self photoLibrary];
    id v7 = [v8 sharedLibraryStatusProviderWithPhotoLibrary:v9];

    if ([v7 hasSharedLibraryOrPreview]) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 1;
    }
  }

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = _importToAlbumLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int64_t v6 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self dataSource];
    int v7 = 136315394;
    id v8 = "-[PUImportAddToLibraryAndAlbumsPickerViewController numberOfSectionsInTableView:]";
    __int16 v9 = 2048;
    uint64_t v10 = [v6 numberOfSections];
    _os_log_debug_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEBUG, "%s: %lu", (uint8_t *)&v7, 0x16u);
  }
  return 2;
}

- (id)posterImageForCollection:(id)a3 indexPath:(id)a4 forCellType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = v8;
  if (a5 == 1)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v10 = @"plus";
LABEL_8:
    uint64_t v12 = [v11 systemImageNamed:v10];
    goto LABEL_12;
  }
  if (!a5)
  {
    if (objc_msgSend(v8, "px_item")) {
      uint64_t v10 = @"person.2";
    }
    else {
      uint64_t v10 = @"person";
    }
    uint64_t v11 = (void *)MEMORY[0x1E4FB1818];
    goto LABEL_8;
  }
  if (v7 && a5 == 2)
  {
    uint64_t v12 = [MEMORY[0x1E4F38EE8] posterImageForAssetCollection:v7];
LABEL_12:
    __int16 v13 = (void *)v12;
    if (v12) {
      goto LABEL_14;
    }
  }
  __int16 v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"rectangle"];
LABEL_14:

  return v13;
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUImportAddToLibraryAndAlbumsPickerViewController;
  [(PUImportAddToLibraryAndAlbumsPickerViewController *)&v10 viewDidAppear:a3];
  v4 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    int64_t v6 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self tableView];
    [v6 sizeToFit];
    [v6 frame];
    double v8 = v7;
    [v6 frame];
    -[PUImportAddToLibraryAndAlbumsPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, fmin(v9, 400.0));
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUImportAddToLibraryAndAlbumsPickerViewController;
  [(PUImportAddToLibraryAndAlbumsPickerViewController *)&v5 viewWillAppear:a3];
  v4 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self tableView];
  [v4 reloadData];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportAddToLibraryAndAlbumsPickerViewController;
  [(PUImportAddToLibraryAndAlbumsPickerViewController *)&v4 viewDidLoad];
  v3 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PUImportAddToLibraryAndAlbumsPickerViewControllereCellReuseIdentifier"];
  [v3 setEstimatedRowHeight:44.0];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setSelfSizingInvalidation:2];
}

- (PUImportAddToLibraryAndAlbumsPickerViewController)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUImportAddToLibraryAndAlbumsPickerViewController.m", 86, @"%s is not available as initializer", "-[PUImportAddToLibraryAndAlbumsPickerViewController init]");

  abort();
}

- (PUImportAddToLibraryAndAlbumsPickerViewController)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUImportAddToLibraryAndAlbumsPickerViewController;
  int64_t v6 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)&v9 initWithStyle:1];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v7->_needsDatasourceUpdate = 1;
    [(PUImportAddToLibraryAndAlbumsPickerViewController *)v7 _updateDatasource];
  }

  return v7;
}

- (void)_dismissPicker
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PUImportAddToLibraryAndAlbumsPickerViewController__dismissPicker__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__PUImportAddToLibraryAndAlbumsPickerViewController__dismissPicker__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_updateDatasource
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_needsDatasourceUpdate)
  {
    v3 = _importToAlbumLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315138;
      int64_t v6 = "-[PUImportAddToLibraryAndAlbumsPickerViewController _updateDatasource]";
      _os_log_debug_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "%s: datasource update", (uint8_t *)&v5, 0xCu);
    }

    objc_super v4 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self _userCreatredAlbumsPhotoKitConfiguration];
    [(PUImportAddToLibraryAndAlbumsPickerViewController *)self setDataSourceManagerConfiguration:v4];
    self->_needsDatasourceUpdate = 0;
  }
}

- (id)_userCreatredAlbumsPhotoKitConfiguration
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)self photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  objc_super v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
  v9[0] = v4;
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 setSortDescriptors:v5];

  int64_t v6 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:1 subtype:2 options:v3];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F90480]) initWithCollectionsFetchResult:v6];

  return v7;
}

+ (unint64_t)cellTypeForPosition:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "px_section");
  unint64_t v5 = v4;
  if (v4)
  {
    if (v4 == 1)
    {
      if (objc_msgSend(v3, "px_item")) {
        unint64_t v5 = 2;
      }
      else {
        unint64_t v5 = 1;
      }
    }
    else
    {
      unint64_t v5 = 2;
    }
  }

  return v5;
}

+ (id)dataSourceShiftedIndexPath:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v5 = [a3 row];
  uint64_t v6 = v5 - [a1 dataSourceOffset];
  return (id)[v4 indexPathForRow:v6 inSection:0];
}

+ (int64_t)dataSourceOffset
{
  return 1;
}

@end