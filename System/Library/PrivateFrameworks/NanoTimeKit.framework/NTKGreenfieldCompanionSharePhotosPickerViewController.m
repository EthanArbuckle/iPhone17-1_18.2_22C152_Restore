@interface NTKGreenfieldCompanionSharePhotosPickerViewController
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NTKGreenfieldCompanionSharePhotosPickerViewController)initWithPhotosFace:(id)a3;
- (NTKGreenfieldCompanionSharePhotosPickerViewControllerDelegate)delegate;
- (id)_queue_fetchAssets;
- (id)_queue_fetchOptions;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_createPhotosEditorWithCompletionBlock:(id)a3;
- (void)_didTapDeselectAll;
- (void)_didTapOnCancelButton;
- (void)_didTapOnDoneButton;
- (void)_handleDidFinishWithNewResourcesDirectory:(id)a3;
- (void)_handleEditorDidCreated;
- (void)_handleSelectionChanged;
- (void)_queue_fetchAssets;
- (void)_setupCollectionView;
- (void)_setupNavigationItems;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation NTKGreenfieldCompanionSharePhotosPickerViewController

- (NTKGreenfieldCompanionSharePhotosPickerViewController)initWithPhotosFace:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(NTKCFaceDetailCustomPhotosFlowLayout);
  v15.receiver = self;
  v15.super_class = (Class)NTKGreenfieldCompanionSharePhotosPickerViewController;
  v7 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)&v15 initWithCollectionViewLayout:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_originalFace, a3);
    uint64_t v9 = [MEMORY[0x1E4F28E60] indexSet];
    selectedIndexes = v8->_selectedIndexes;
    v8->_selectedIndexes = (NSMutableIndexSet *)v9;

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.NanoTimeKit.NTKGreenfieldCompanionSharePhotosPickerViewController", v11);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;
  }
  return v8;
}

- (void)viewDidLoad
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)NTKGreenfieldCompanionSharePhotosPickerViewController;
  [(NTKGreenfieldCompanionSharePhotosPickerViewController *)&v17 viewDidLoad];
  v3 = NTKClockFaceLocalizedString(@"GREENFIELD_SHARING_PHOTOS_NAV_PROMPT_LOADING", @"Share up to %d photos from this album");
  v4 = objc_msgSend(NSString, "localizedStringWithFormat:", v3, -[NSMutableIndexSet count](self->_selectedIndexes, "count"));
  id v5 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self navigationItem];
  [v5 setPrompt:v4];

  v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v7 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self view];
  [v7 setBackgroundColor:v6];

  v8 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self navigationController];
  [v8 setToolbarHidden:0];

  v10 = NTKCCustomizationLocalizedString(@"PHOTOS_DESELECT_ALL", @"Deselect All", v9);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v10 style:0 target:self action:sel__didTapDeselectAll];
  dispatch_queue_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v18[0] = v12;
  v18[1] = v11;
  v18[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self setToolbarItems:v13];

  [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self _setupNavigationItems];
  [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self _setupCollectionView];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__NTKGreenfieldCompanionSharePhotosPickerViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E62C0068;
  objc_copyWeak(&v15, &location);
  [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self _createPhotosEditorWithCompletionBlock:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __68__NTKGreenfieldCompanionSharePhotosPickerViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleEditorDidCreated];
}

- (void)_setupNavigationItems
{
  id v15 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__didTapOnCancelButton];
  v3 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:v15];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__didTapOnDoneButton];
  id v5 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  if (NTKPhotosIsCustomPhotosFace(self->_originalFace))
  {
    v6 = @"EDIT_OPTION_LABEL_PHOTOS_CUSTOM_COMPANION";
    v7 = @"Photos";
LABEL_5:
    NTKCompanionClockFaceLocalizedString(v6, v7);
    v8 = (NTKCompanionSyncedAlbumEditor *)objc_claimAutoreleasedReturnValue();
    [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self setTitle:v8];
LABEL_6:

    goto LABEL_7;
  }
  if (NTKPhotosIsMemoryPhotosFace(self->_originalFace))
  {
    v6 = @"EDIT_OPTION_LABEL_PHOTOS_MEMORY_COMPANION";
    v7 = @"Dynamic";
    goto LABEL_5;
  }
  if (NTKPhotosIsSyncedAlbumPhotosFace(self->_originalFace))
  {
    uint64_t v9 = [NTKCompanionSyncedAlbumEditor alloc];
    v10 = [(NTKFace *)self->_originalFace resourceDirectory];
    v11 = [(NTKFace *)self->_originalFace device];
    v8 = [(NTKCompanionSinglePHAssetEditor *)v9 initWithResourceDirectory:v10 forDevice:v11 shouldFinalize:0];

    dispatch_queue_t v12 = [(NTKCompanionSinglePHAssetEditor *)v8 albumIdentifier];
    v13 = [(NTKFace *)self->_originalFace device];
    v14 = NTKAlbumNameForLocalIdentifier(v12, v13);
    [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self setTitle:v14];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)_didTapOnCancelButton
{
}

- (void)_didTapOnDoneButton
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v3 startAnimating];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v3];
  id v5 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  v6 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount"));
  [v6 removeIndexes:self->_selectedIndexes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke;
  v14[3] = &unk_1E62C3648;
  void v14[4] = self;
  [v6 enumerateIndexesWithOptions:2 usingBlock:v14];
  objc_initWeak(&location, self);
  if ([(NTKCompanionResourceDirectoryEditor *)self->_editor state] == 1)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_2;
    v11[3] = &unk_1E62C0068;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self dismissViewControllerAnimated:1 completion:v11];
  }
  else
  {
    editor = self->_editor;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_3;
    v9[3] = &unk_1E62C3670;
    v7 = &v10;
    objc_copyWeak(&v10, &location);
    [(NTKCompanionCustomPhotosEditor *)editor finalizeWithCompletion:v9];
  }
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

uint64_t __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1024) deletePhotoAtIndex:a2];
}

void __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 companionSharePhotosPickerViewController:v3 didFinishWithFace:v3[127]];

    id WeakRetained = v3;
  }
}

void __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_4;
    v6[3] = &unk_1E62C09C0;
    v6[4] = WeakRetained;
    id v7 = v3;
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
}

uint64_t __76__NTKGreenfieldCompanionSharePhotosPickerViewController__didTapOnDoneButton__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidFinishWithNewResourcesDirectory:*(void *)(a1 + 40)];
}

- (void)_createPhotosEditorWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__NTKGreenfieldCompanionSharePhotosPickerViewController__createPhotosEditorWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E62C2290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __96__NTKGreenfieldCompanionSharePhotosPickerViewController__createPhotosEditorWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v11 = *(id *)(*(void *)(a1 + 32) + 1016);
  v2 = [*(id *)(*(void *)(a1 + 32) + 1016) device];
  BOOL IsCustomPhotosFace = NTKPhotosIsCustomPhotosFace(*(void **)(*(void *)(a1 + 32) + 1016));
  id v4 = [NTKCompanionCustomPhotosEditor alloc];
  id v5 = v4;
  if (IsCustomPhotosFace)
  {
    id v6 = [v11 resourceDirectory];
    id v7 = [(NTKCompanionCustomPhotosEditor *)v5 initWithResourceDirectory:v6 forDevice:v2];
  }
  else
  {
    id v7 = [(NTKCompanionCustomPhotosEditor *)v4 initWithResourceDirectory:0 forDevice:v2];
    id v6 = objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssets");
    [(NTKCompanionCustomPhotosEditor *)v7 addAssetsFromAssetList:v6 maxPhotosCount:-1];
  }

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 1024);
  *(void *)(v8 + 1024) = v7;
  id v10 = v7;

  dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
}

- (id)_queue_fetchAssets
{
  v2 = self;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_originalFace = (id *)&v2->_originalFace;
  id v4 = [(NTKFace *)v2->_originalFace device];
  if (NTKPhotosIsSyncedAlbumPhotosFace(v2->_originalFace))
  {
    id v5 = [*p_originalFace resourceDirectory];
    id v6 = +[NTKPhotosReader readerForResourceDirectory:v5];

    v38 = [v6 assetCollectionIdentifier];
    if (v38) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    if (!NTKPhotosIsMemoryPhotosFace(*p_originalFace))
    {
      v38 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        [(NTKGreenfieldCompanionSharePhotosPickerViewController *)(uint64_t *)&v2->_originalFace _queue_fetchAssets];
      }
      v22 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_44;
    }
    v38 = 0;
    uint64_t v7 = 3;
  }
  uint64_t v8 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v50 = v7;
    __int16 v51 = 2112;
    v52 = v38;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Fetching assets with collectionTarget:%ld albumIdentifier:%@", buf, 0x16u);
  }

  id v9 = objc_alloc(MEMORY[0x1E4F79CC8]);
  id v10 = [v4 nrDevice];
  id v11 = (void *)[v9 initWithCollectionTarget:v7 device:v10];

  if (!v38 || v7 == 3)
  {
    id v12 = [v11 assetCollections];
    id v13 = [v12 anyObject];
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v12 = [v11 assetCollections];
    id v13 = (id)[v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v13)
    {
      v35 = v2;
      v36 = v11;
      v37 = v4;
      uint64_t v14 = *(void *)v44;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v17 = objc_alloc(MEMORY[0x1E4F29128]);
          v18 = [MEMORY[0x1E4F38FF8] uuidFromLocalIdentifier:v38];
          v19 = (void *)[v17 initWithUUIDString:v18];

          v20 = NTK_npto_uuid(v16);
          int v21 = [v19 isEqual:v20];

          if (v21)
          {
            id v13 = v16;

            goto LABEL_26;
          }
        }
        id v13 = (id)[v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v13) {
          continue;
        }
        break;
      }
LABEL_26:
      id v4 = v37;
      v2 = v35;
    }
  }

  v23 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v50 = (uint64_t)v13;
    _os_log_impl(&dword_1BC5A9000, v23, OS_LOG_TYPE_DEFAULT, "Fetching assets with assetCollection: %@", buf, 0xCu);
  }

  if (v13)
  {
    v24 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)v2 _queue_fetchOptions];
    v25 = [v11 fetchAssetsInAssetCollection:v13 options:v24];

    v26 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v27 = v25;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend(v26, "addObject:", *(void *)(*((void *)&v39 + 1) + 8 * j), v35, v36, v37);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v29);
    }

    v32 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [v26 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v50 = v33;
      _os_log_impl(&dword_1BC5A9000, v32, OS_LOG_TYPE_DEFAULT, "Fetching assets. Found %lu assets.", buf, 0xCu);
    }

    v22 = (void *)[v26 copy];
  }
  else
  {
    v27 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[NTKGreenfieldCompanionSharePhotosPickerViewController _queue_fetchAssets](v27);
    }
    v22 = (void *)MEMORY[0x1E4F1CBF0];
  }

LABEL_44:

  return v22;
}

- (id)_queue_fetchOptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F390A0]);
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v2 setSortDescriptors:v4];

  uint64_t v7 = *MEMORY[0x1E4F39508];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  [v2 addFetchPropertySets:v5];

  return v2;
}

- (void)_setupCollectionView
{
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v4 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  id v5 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self collectionView];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = +[NTKCPhotoListCell reuseIdentifier];
  [v5 registerClass:v6 forCellWithReuseIdentifier:v7];

  id v8 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self collectionView];
  [v8 setAlwaysBounceVertical:1];
}

- (void)_handleSelectionChanged
{
  NTKClockFaceLocalizedString(@"GREENFIELD_SHARING_PHOTOS_NAV_PROMPT", @"Share up to %d photos from this album (%@)");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = NTKClockFaceLocalizedString(@"GREENFIELD_SHARING_PHOTOS_NAV_PROMPT_SELECTED_COUNT", @"%lu Selected");
  id v4 = objc_msgSend(NSString, "localizedStringWithFormat:", v3, -[NSMutableIndexSet count](self->_selectedIndexes, "count"));
  id v5 = objc_msgSend(NSString, "stringWithFormat:", v10, 24, v4);
  uint64_t v6 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self navigationItem];
  [v6 setPrompt:v5];

  BOOL v7 = [(NSMutableIndexSet *)self->_selectedIndexes count] != 0;
  id v8 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self navigationItem];
  id v9 = [v8 rightBarButtonItem];
  [v9 setEnabled:v7];
}

- (void)_handleDidFinishWithNewResourcesDirectory:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(NTKFace *)self->_originalFace deepCopy];
    [v4 setResourceDirectory:v8];
    id v5 = [(NTKFace *)self->_originalFace device];
    uint64_t v6 = +[NTKPhotosContentEditOption optionWithPhotosContent:1 forDevice:v5];
    [v4 selectOption:v6 forCustomEditMode:12 slot:0];
    BOOL v7 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self delegate];
    [v7 companionSharePhotosPickerViewController:self didFinishWithFace:v4];
  }
  else
  {
    id v4 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self delegate];
    [v4 companionSharePhotosPickerViewController:self didFinishWithFace:0];
  }
}

- (void)_handleEditorDidCreated
{
  unint64_t v3 = [(NTKCompanionCustomPhotosEditor *)self->_editor photosCount];
  if (v3 >= 0x18) {
    uint64_t v4 = 24;
  }
  else {
    uint64_t v4 = v3;
  }
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
      [(NSMutableIndexSet *)self->_selectedIndexes addIndex:i];
  }
  [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self _handleSelectionChanged];
  id v6 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self collectionView];
  [v6 reloadData];
}

- (void)_didTapDeselectAll
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSMutableIndexSet *)self->_selectedIndexes removeAllIndexes];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v3 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self collectionView];
  uint64_t v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 setSelected:0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self _handleSelectionChanged];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NTKCompanionCustomPhotosEditor *)self->_editor photosCount];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self collectionView];
  id v9 = +[NTKCPhotoListCell reuseIdentifier];
  long long v10 = [v8 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

  long long v11 = (void *)[v7 item];
  [v10 setIndex:v11];
  objc_initWeak(&location, self);
  editor = self->_editor;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __95__NTKGreenfieldCompanionSharePhotosPickerViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v19 = &unk_1E62C3698;
  id v13 = v10;
  id v20 = v13;
  v21[1] = v11;
  objc_copyWeak(v21, &location);
  [(NTKCompanionCustomPhotosEditor *)editor imageAndCropForPhotoAtIndex:v11 completion:&v16];
  objc_msgSend(v13, "setPhoto:", 0, v16, v17, v18, v19);
  objc_msgSend(v13, "setCrop:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_msgSend(v13, "setSelected:", -[NSMutableIndexSet containsIndex:](self->_selectedIndexes, "containsIndex:", v11));
  id v14 = v13;
  objc_destroyWeak(v21);

  objc_destroyWeak(&location);

  return v14;
}

void __95__NTKGreenfieldCompanionSharePhotosPickerViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, double x, double y, double width, double height)
{
  id v11 = a2;
  if ([*(id *)(a1 + 32) index] == *(void *)(a1 + 48))
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    if (!CGRectIsEmpty(v17))
    {
      [v11 scale];
      CGFloat v13 = 1.0 / v12;
      [v11 scale];
      CGAffineTransformMakeScale(&v16, v13, 1.0 / v14);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      CGRect v19 = CGRectApplyAffineTransform(v18, &v16);
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
    }
    [*(id *)(a1 + 32) setPhoto:v11];
    objc_msgSend(*(id *)(a1 + 32), "setCrop:", x, y, width, height);
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setSelected:", objc_msgSend(WeakRetained[129], "containsIndex:", *(void *)(a1 + 48)));
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 item];
  id v9 = [v7 cellForItemAtIndexPath:v6];

  if (([v9 isSelected] & 1) != 0
    || (unint64_t)[(NSMutableIndexSet *)self->_selectedIndexes count] < 0x18)
  {
    objc_msgSend(v9, "setSelected:", objc_msgSend(v9, "isSelected") ^ 1);
    int v10 = [v9 isSelected];
    selectedIndexes = self->_selectedIndexes;
    if (v10) {
      [(NSMutableIndexSet *)selectedIndexes addIndex:v8];
    }
    else {
      [(NSMutableIndexSet *)selectedIndexes removeIndex:v8];
    }
    [(NTKGreenfieldCompanionSharePhotosPickerViewController *)self _handleSelectionChanged];
  }

  return 0;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  editor = self->_editor;
  id v7 = a5;
  uint64_t v8 = [a4 item];
  uint64_t v9 = [v7 item];

  [(NTKCompanionCustomPhotosEditor *)editor movePhotoAtIndex:v8 toIndex:v9];
}

- (NTKGreenfieldCompanionSharePhotosPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKGreenfieldCompanionSharePhotosPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_selectedIndexes, 0);
  objc_storeStrong((id *)&self->_editor, 0);

  objc_storeStrong((id *)&self->_originalFace, 0);
}

- (void)_queue_fetchAssets
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Can't handle photos face: %@", (uint8_t *)&v3, 0xCu);
}

@end