@interface _NTKCFaceDetailAlbumChooserViewController
+ (void)initialize;
- (BOOL)_shouldShowAggregateItem;
- (BOOL)inGallery;
- (BOOL)shouldShowAllPhotosItem;
- (BOOL)showAddNewAlbumPlaceholder;
- (NTKCAlbumHandlingEditor)editor;
- (NTKFace)face;
- (_NTKCFaceDetailAlbumChooserViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5;
- (_NTKCFaceDetailAlbumChooserViewControllerDelegate)delegate;
- (id)_title;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_appendCollectionsWithType:(int64_t)a3 subtype:(int64_t)a4;
- (void)_reloadData;
- (void)_set_allAlbums;
- (void)_set_selectedAlbum;
- (void)sessionInfoStatusDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditor:(id)a3;
- (void)setFace:(id)a3;
- (void)setInGallery:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation _NTKCFaceDetailAlbumChooserViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = [MEMORY[0x1E4F91370] sharedInstance];
    [v2 setInterfaceThemeClass:objc_opt_class()];
  }
}

- (_NTKCFaceDetailAlbumChooserViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = objc_opt_new();
  v16.receiver = self;
  v16.super_class = (Class)_NTKCFaceDetailAlbumChooserViewController;
  v11 = [(PUAlbumListViewController *)&v16 initWithSpec:v10 isRootSharedAlbumList:0];
  v12 = v11;
  if (v11)
  {
    [(_NTKCFaceDetailAlbumChooserViewController *)v11 setEditor:v8];
    [(_NTKCFaceDetailAlbumChooserViewController *)v12 setInGallery:v5];
    [(_NTKCFaceDetailAlbumChooserViewController *)v12 setFace:v9];
    v13 = objc_opt_new();
    [(PUAlbumListViewController *)v12 setSessionInfo:v13];

    v14 = [(_NTKCFaceDetailAlbumChooserViewController *)v12 _title];
    [(_NTKCFaceDetailAlbumChooserViewController *)v12 setTitle:v14];
  }
  return v12;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)_NTKCFaceDetailAlbumChooserViewController;
  [(PUAlbumListViewController *)&v6 viewDidLoad];
  v3 = BPSBridgeTintColor();
  v4 = [(_NTKCFaceDetailAlbumChooserViewController *)self view];
  [v4 setTintColor:v3];

  BOOL v5 = [(PUAlbumListViewController *)self _mainTableView];
  [v5 setSeparatorStyle:1];

  [(_NTKCFaceDetailAlbumChooserViewController *)self _reloadData];
}

- (BOOL)shouldShowAllPhotosItem
{
  return 0;
}

- (BOOL)showAddNewAlbumPlaceholder
{
  return 0;
}

- (BOOL)_shouldShowAggregateItem
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v6 section];
  unint64_t v9 = [(PUAlbumListViewController *)self albumsSections];
  if (v8 < v9 || v8 - v9 >= v10)
  {
    v24.receiver = self;
    v24.super_class = (Class)_NTKCFaceDetailAlbumChooserViewController;
    v11 = [(PUAlbumListViewController *)&v24 tableView:v7 cellForRowAtIndexPath:v6];
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)_NTKCFaceDetailAlbumChooserViewController;
    v11 = [(PUAlbumListViewController *)&v25 tableView:v7 cellForRowAtIndexPath:v6];

    uint64_t v12 = [(PUAlbumListViewController *)self collectionAtIndexPath:v6];
    id v7 = (id)v12;
    if (self->_selectedAlbum
      && (NTK_npto_uuid(v12),
          v13 = objc_claimAutoreleasedReturnValue(),
          NTK_npto_uuid(self->_selectedAlbum),
          v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v13 isEqual:v14],
          v14,
          v13,
          (v15 & 1) != 0))
    {
      uint64_t v16 = 3;
    }
    else
    {
      uint64_t v16 = 0;
    }
    [v11 setAccessoryType:v16];
    v17 = BPSForegroundColor();
    [v11 setBackgroundColor:v17];

    [v11 setSelectionStyle:3];
    id v18 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v20 = BPSCellHightlightColor();
    [v19 setBackgroundColor:v20];

    [v11 setSelectedBackgroundView:v19];
    v21 = [(PUAlbumListViewController *)self spec];
    [v21 stackSize];
    objc_msgSend(v11, "setSeparatorInset:", 0.0, v22 + 16.0 + 8.0, 0.0, 0.0);
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  unint64_t v8 = [v6 cellForRowAtIndexPath:v7];
  [v8 setAccessoryType:3];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v9 = objc_msgSend(v6, "visibleCells", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v14 != v8) {
          [v14 setAccessoryType:0];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  unint64_t v15 = [v7 section];
  unint64_t v16 = [(PUAlbumListViewController *)self albumsSections];
  if (v15 >= v16 && v15 - v16 < v17)
  {
    id v18 = [(PUAlbumListViewController *)self collectionAtIndexPath:v7];
    selectedAlbum = self->_selectedAlbum;
    self->_selectedAlbum = v18;
  }
}

- (void)sessionInfoStatusDidChange:(id)a3
{
  if ([a3 status] == 1)
  {
    selectedAlbum = self->_selectedAlbum;
    if (selectedAlbum) {
      BOOL v5 = selectedAlbum == self->_syncedAlbum;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      id v11 = 0;
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F38EE8];
      id v7 = NTK_npto_uuid(selectedAlbum);
      unint64_t v8 = [v7 UUIDString];
      id v11 = [v6 localIdentifierWithUUID:v8];
    }
    unint64_t v9 = [(_NTKCFaceDetailAlbumChooserViewController *)self editor];
    [v9 setAlbumIdentifier:v11];

    uint64_t v10 = [(_NTKCFaceDetailAlbumChooserViewController *)self delegate];
    [v10 _albumChooserDidFinish:self];
  }
}

- (id)_title
{
  return NTKCompanionClockFaceLocalizedString(@"EDIT_OPTION_LABEL_PHOTOS_SYNCED_ALBUM_ACTION_COMPANION", @"Choose Album…");
}

- (void)_reloadData
{
  [(_NTKCFaceDetailAlbumChooserViewController *)self _set_allAlbums];
  [(_NTKCFaceDetailAlbumChooserViewController *)self _set_selectedAlbum];
  id v5 = [MEMORY[0x1E4F39008] transientCollectionListWithCollections:self->_allAlbums title:0];
  v3 = [(PUAlbumListViewController *)self dataSourceManagerConfiguration];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F90480]) initWithCollectionList:v5];
    [v4 setSeparateSectionsForSmartAndUserCollections:0];
    [(PUAlbumListViewController *)self setDataSourceManagerConfiguration:v4];
  }
}

- (void)_set_allAlbums
{
  v3 = (NSMutableArray *)objc_opt_new();
  allAlbums = self->_allAlbums;
  self->_allAlbums = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F79CD0]);
  id v6 = [(_NTKCFaceDetailAlbumChooserViewController *)self face];
  id v7 = [v6 device];
  unint64_t v8 = [v7 nrDevice];
  id v12 = (id)[v5 initWithDevice:v8];

  unint64_t v9 = objc_msgSend(v12, "npto_fetchSyncedAlbum");
  uint64_t v10 = [v9 firstObject];
  syncedAlbum = self->_syncedAlbum;
  self->_syncedAlbum = v10;

  if (self->_syncedAlbum) {
    -[NSMutableArray addObject:](self->_allAlbums, "addObject:");
  }
  [(_NTKCFaceDetailAlbumChooserViewController *)self _appendCollectionsWithType:2 subtype:203];
  [(_NTKCFaceDetailAlbumChooserViewController *)self _appendCollectionsWithType:2 subtype:209];
  [(_NTKCFaceDetailAlbumChooserViewController *)self _appendCollectionsWithType:1 subtype:0x7FFFFFFFFFFFFFFFLL];
}

- (void)_set_selectedAlbum
{
  id v2 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(_NTKCFaceDetailAlbumChooserViewController *)self editor];
  v4 = [v3 albumIdentifier];

  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v2;
    id v5 = v2->_allAlbums;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v11 = (void *)MEMORY[0x1E4F38EE8];
          id v12 = NTK_npto_uuid(v10);
          v13 = [v12 UUIDString];
          v14 = [v11 localIdentifierWithUUID:v13];
          int v15 = [v4 isEqualToString:v14];

          if (v15)
          {
            id v2 = v18;
            objc_storeStrong((id *)&v18->_selectedAlbum, v10);

            goto LABEL_13;
          }
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v2 = v18;
  }
  else
  {
    objc_storeStrong((id *)&v2->_selectedAlbum, v2->_syncedAlbum);
  }
LABEL_13:
  unint64_t v16 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v17 = [(PHAssetCollection *)v2->_selectedAlbum localizedTitle];
    *(_DWORD *)buf = 138412290;
    objc_super v24 = v17;
    _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "-[_NTKCFaceDetailAlbumChooserViewController _set_selectedAlbum]: selected album == %@", buf, 0xCu);
  }
}

- (void)_appendCollectionsWithType:(int64_t)a3 subtype:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:a3 subtype:a4 options:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        syncedAlbum = self->_syncedAlbum;
        if (!syncedAlbum
          || (NTK_npto_uuid(syncedAlbum),
              id v12 = objc_claimAutoreleasedReturnValue(),
              NTK_npto_uuid(v10),
              v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v12 isEqual:v13],
              v13,
              v12,
              (v14 & 1) == 0))
        {
          [(NSMutableArray *)self->_allAlbums addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (NTKCAlbumHandlingEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (BOOL)inGallery
{
  return self->_inGallery;
}

- (void)setInGallery:(BOOL)a3
{
  self->_inGallery = a3;
}

- (_NTKCFaceDetailAlbumChooserViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_NTKCFaceDetailAlbumChooserViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_selectedAlbum, 0);
  objc_storeStrong((id *)&self->_syncedAlbum, 0);

  objc_storeStrong((id *)&self->_allAlbums, 0);
}

@end