@interface _NTKCFaceDetailCustomPhotosViewController
- (BOOL)_allPhotosSelected;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)externalImagesSet;
- (BOOL)inGallery;
- (NTKBasePhotosFaceView)faceView;
- (NTKCFaceDetailCustomPhotosViewControllerDelegate)delegate;
- (NTKCompanionCustomPhotosEditor)editor;
- (NTKFace)face;
- (_NTKCFaceDetailCustomPhotosViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6 externalImagesSet:(BOOL)a7;
- (id)_currentSelectAllButton;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_addPressed;
- (void)_deletePressed;
- (void)_donePressed;
- (void)_savePressed;
- (void)_selectAllPhotos;
- (void)_selectAllPressed;
- (void)_selectPressed;
- (void)_updateButtons;
- (void)_updateButtonsForSelectionChanged;
- (void)_updateTitle;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditor:(id)a3;
- (void)setExternalImagesSet:(BOOL)a3;
- (void)setFace:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setInGallery:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _NTKCFaceDetailCustomPhotosViewController

- (_NTKCFaceDetailCustomPhotosViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6 externalImagesSet:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  v60[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = objc_opt_new();
  v58.receiver = self;
  v58.super_class = (Class)_NTKCFaceDetailCustomPhotosViewController;
  v16 = [(_NTKCFaceDetailCustomPhotosViewController *)&v58 initWithCollectionViewLayout:v15];
  v17 = v16;
  if (v16)
  {
    [(_NTKCFaceDetailCustomPhotosViewController *)v16 setEditor:v12];
    [(_NTKCFaceDetailCustomPhotosViewController *)v17 setFace:v13];
    [(_NTKCFaceDetailCustomPhotosViewController *)v17 setInGallery:v9];
    [(_NTKCFaceDetailCustomPhotosViewController *)v17 setFaceView:v14];
    [(_NTKCFaceDetailCustomPhotosViewController *)v17 setExternalImagesSet:v7];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v17 action:sel__savePressed];
    saveButton = v17->_saveButton;
    v17->_saveButton = (UIBarButtonItem *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v22 = NTKCCustomizationLocalizedString(@"PHOTOS_SELECT", @"Select", v21);
    uint64_t v23 = [v20 initWithTitle:v22 style:0 target:v17 action:sel__selectPressed];
    selectButton = v17->_selectButton;
    v17->_selectButton = (UIBarButtonItem *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v17 action:sel__donePressed];
    doneButton = v17->_doneButton;
    v17->_doneButton = (UIBarButtonItem *)v25;

    id v27 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v29 = NTKCCustomizationLocalizedString(@"PHOTOS_SELECT_ALL", @"Select All", v28);
    uint64_t v30 = [v27 initWithTitle:v29 style:0 target:v17 action:sel__selectAllPressed];
    selectAllButton = v17->_selectAllButton;
    v17->_selectAllButton = (UIBarButtonItem *)v30;

    id v32 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v34 = NTKCCustomizationLocalizedString(@"PHOTOS_DESELECT_ALL", @"Deselect All", v33);
    uint64_t v35 = [v32 initWithTitle:v34 style:0 target:v17 action:sel__selectAllPressed];
    deselectAllButton = v17->_deselectAllButton;
    v17->_deselectAllButton = (UIBarButtonItem *)v35;

    uint64_t v37 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:16 target:v17 action:sel__deletePressed];
    deleteButton = v17->_deleteButton;
    v17->_deleteButton = (UIBarButtonItem *)v37;

    [(UIBarButtonItem *)v17->_deleteButton setEnabled:0];
    v39 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    [v39 startAnimating];
    uint64_t v40 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v39];
    spinnerButton = v17->_spinnerButton;
    v17->_spinnerButton = (UIBarButtonItem *)v40;

    if (!v17->_externalImagesSet)
    {
      id v42 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v44 = NTKCCustomizationLocalizedString(@"PHOTOS_ADD", @"Add Photos…", v43);
      uint64_t v45 = [v42 initWithTitle:v44 style:0 target:v17 action:sel__addPressed];
      addButton = v17->_addButton;
      v17->_addButton = (UIBarButtonItem *)v45;

      v47 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      v60[0] = v47;
      v60[1] = v17->_addButton;
      v48 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      v60[2] = v48;
      uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
      defaultToolBarItems = v17->_defaultToolBarItems;
      v17->_defaultToolBarItems = (NSArray *)v49;
    }
    v51 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v59[0] = v51;
    v59[1] = v17->_deleteButton;
    v52 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v59[2] = v52;
    uint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
    editingToolBarItems = v17->_editingToolBarItems;
    v17->_editingToolBarItems = (NSArray *)v53;

    uint64_t v55 = objc_opt_new();
    selectedIndexes = v17->_selectedIndexes;
    v17->_selectedIndexes = (NSMutableIndexSet *)v55;
  }
  return v17;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)_NTKCFaceDetailCustomPhotosViewController;
  [(_NTKCFaceDetailCustomPhotosViewController *)&v12 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(_NTKCFaceDetailCustomPhotosViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v6 = [(_NTKCFaceDetailCustomPhotosViewController *)self collectionView];
  [v6 setBackgroundColor:v5];

  BOOL v7 = [(_NTKCFaceDetailCustomPhotosViewController *)self collectionView];
  uint64_t v8 = objc_opt_class();
  BOOL v9 = +[NTKCPhotoListCell reuseIdentifier];
  [v7 registerClass:v8 forCellWithReuseIdentifier:v9];

  v10 = [(_NTKCFaceDetailCustomPhotosViewController *)self collectionView];
  [v10 setAlwaysBounceVertical:1];

  v11 = [(_NTKCFaceDetailCustomPhotosViewController *)self collectionView];
  [v11 setAllowsSelectionDuringEditing:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NTKCFaceDetailCustomPhotosViewController;
  [(_NTKCFaceDetailCustomPhotosViewController *)&v7 viewWillAppear:a3];
  v4 = [(_NTKCFaceDetailCustomPhotosViewController *)self navigationController];
  [v4 setToolbarHidden:0];

  [(_NTKCFaceDetailCustomPhotosViewController *)self _updateButtons];
  v5 = [(_NTKCFaceDetailCustomPhotosViewController *)self presentedViewController];

  if (v5)
  {
    v6 = [(_NTKCFaceDetailCustomPhotosViewController *)self collectionView];
    [v6 reloadData];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_NTKCFaceDetailCustomPhotosViewController;
  [(_NTKCFaceDetailCustomPhotosViewController *)&v7 setEditing:a3 animated:a4];
  [(_NTKCFaceDetailCustomPhotosViewController *)self _updateButtons];
  [(NSMutableIndexSet *)self->_selectedIndexes removeAllIndexes];
  v5 = [(_NTKCFaceDetailCustomPhotosViewController *)self collectionView];
  v6 = [v5 visibleCells];
  [v6 enumerateObjectsUsingBlock:&__block_literal_global_155];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NTKCompanionCustomPhotosEditor *)self->_editor photosCount];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(_NTKCFaceDetailCustomPhotosViewController *)self collectionView];
  objc_super v7 = +[NTKCPhotoListCell reuseIdentifier];
  uint64_t v8 = [v6 dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v5];

  uint64_t v9 = [v5 item];
  editor = self->_editor;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83___NTKCFaceDetailCustomPhotosViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v15[3] = &unk_1E62C8C70;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  uint64_t v17 = v9;
  [(NTKCompanionCustomPhotosEditor *)editor imageAndCropForPhotoAtIndex:v9 completion:v15];
  [v11 setPhoto:0];
  objc_msgSend(v11, "setCrop:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_msgSend(v11, "setSelected:", -[NSMutableIndexSet containsIndex:](self->_selectedIndexes, "containsIndex:", v9));
  objc_super v12 = v16;
  id v13 = v11;

  return v13;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 item];
  if ([(_NTKCFaceDetailCustomPhotosViewController *)self isEditing])
  {
    uint64_t v9 = [v6 cellForItemAtIndexPath:v7];
    objc_msgSend(v9, "setSelected:", objc_msgSend(v9, "isSelected") ^ 1);
    int v10 = [v9 isSelected];
    selectedIndexes = self->_selectedIndexes;
    if (v10) {
      [(NSMutableIndexSet *)selectedIndexes addIndex:v8];
    }
    else {
      [(NSMutableIndexSet *)selectedIndexes removeIndex:v8];
    }
    [(_NTKCFaceDetailCustomPhotosViewController *)self _updateButtonsForSelectionChanged];
  }
  else
  {
    objc_super v12 = [(NTKFaceView *)self->_faceView timeView];
    id v13 = [v12 style];

    objc_initWeak(&location, self);
    id v14 = [NTKCFaceDetailPhotoCropViewController alloc];
    uint64_t v15 = [v7 item];
    editor = self->_editor;
    uint64_t v17 = [(_NTKCFaceDetailCustomPhotosViewController *)self face];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __88___NTKCFaceDetailCustomPhotosViewController_collectionView_shouldSelectItemAtIndexPath___block_invoke;
    uint64_t v23 = &unk_1E62C0068;
    objc_copyWeak(&v24, &location);
    uint64_t v18 = [(NTKCFaceDetailPhotoCropViewController *)v14 initWithIndex:v15 inPhotosEditor:editor forFace:v17 timeStyle:v13 completionHandler:&v20];

    -[_NTKCFaceDetailCustomPhotosViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0, v20, v21, v22, v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
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

- (void)_updateButtons
{
  if ([(_NTKCFaceDetailCustomPhotosViewController *)self isEditing])
  {
    v3 = [(_NTKCFaceDetailCustomPhotosViewController *)self _currentSelectAllButton];
    v4 = [(_NTKCFaceDetailCustomPhotosViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];

    doneButton = self->_doneButton;
    id v6 = [(_NTKCFaceDetailCustomPhotosViewController *)self navigationItem];
    [v6 setRightBarButtonItem:doneButton];
    id v7 = &OBJC_IVAR____NTKCFaceDetailCustomPhotosViewController__editingToolBarItems;
  }
  else
  {
    saveButton = self->_saveButton;
    uint64_t v9 = [(_NTKCFaceDetailCustomPhotosViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:saveButton];

    selectButton = self->_selectButton;
    id v6 = [(_NTKCFaceDetailCustomPhotosViewController *)self navigationItem];
    [v6 setRightBarButtonItem:selectButton];
    id v7 = &OBJC_IVAR____NTKCFaceDetailCustomPhotosViewController__defaultToolBarItems;
  }

  [(_NTKCFaceDetailCustomPhotosViewController *)self setToolbarItems:*(Class *)((char *)&self->super.super.super.super.isa + *v7)];
  [(UIBarButtonItem *)self->_addButton setEnabled:(unint64_t)[(NTKCompanionCustomPhotosEditor *)self->_editor photosCount] < 0x18];
  [(UIBarButtonItem *)self->_selectButton setEnabled:[(NTKCompanionCustomPhotosEditor *)self->_editor photosCount] > 0];
  [(_NTKCFaceDetailCustomPhotosViewController *)self _updateTitle];

  [(_NTKCFaceDetailCustomPhotosViewController *)self _updateButtonsForSelectionChanged];
}

- (void)_updateButtonsForSelectionChanged
{
  if ([(_NTKCFaceDetailCustomPhotosViewController *)self isEditing])
  {
    v3 = [(_NTKCFaceDetailCustomPhotosViewController *)self _currentSelectAllButton];
    v4 = [(_NTKCFaceDetailCustomPhotosViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];

    uint64_t v5 = [(NSMutableIndexSet *)self->_selectedIndexes count];
    BOOL v6 = v5 != 0;
    if (!self->_inGallery)
    {
      uint64_t v7 = v5;
      uint64_t v8 = [(NSMutableIndexSet *)self->_selectedIndexes count];
      int64_t v9 = [(NTKCompanionCustomPhotosEditor *)self->_editor photosCount];
      if (v7) {
        BOOL v10 = v8 == v9;
      }
      else {
        BOOL v10 = 1;
      }
      BOOL v6 = !v10;
    }
    deleteButton = self->_deleteButton;
    [(UIBarButtonItem *)deleteButton setEnabled:v6];
  }
}

- (id)_currentSelectAllButton
{
  BOOL v3 = [(_NTKCFaceDetailCustomPhotosViewController *)self _allPhotosSelected];
  v4 = &OBJC_IVAR____NTKCFaceDetailCustomPhotosViewController__selectAllButton;
  if (v3) {
    v4 = &OBJC_IVAR____NTKCFaceDetailCustomPhotosViewController__deselectAllButton;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.isa + *v4);

  return v5;
}

- (void)_updateTitle
{
  if (![(_NTKCFaceDetailCustomPhotosViewController *)self isEditing])
  {
    uint64_t v5 = NTKCCustomizationLocalizedFormat(@"PHOTOS_NUMBER", @"# Photos", v3);
    BOOL v6 = NSString;
    uint64_t v7 = [(NTKCompanionCustomPhotosEditor *)self->_editor photosCount];
    goto LABEL_5;
  }
  if ([(NSMutableIndexSet *)self->_selectedIndexes count])
  {
    uint64_t v5 = NTKCCustomizationLocalizedFormat(@"PHOTOS_NUMBER_SELECTED", @"# Photos Selected", v4);
    BOOL v6 = NSString;
    uint64_t v7 = [(NSMutableIndexSet *)self->_selectedIndexes count];
LABEL_5:
    objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  NTKCCustomizationLocalizedString(@"PHOTOS_TITLE_SELECT_ITEMS", @"Select Item", v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  [(_NTKCFaceDetailCustomPhotosViewController *)self setTitle:v8];
}

- (void)_savePressed
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57___NTKCFaceDetailCustomPhotosViewController__savePressed__block_invoke;
  aBlock[3] = &unk_1E62C0068;
  objc_copyWeak(&v17, &location);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  objc_super v12 = __57___NTKCFaceDetailCustomPhotosViewController__savePressed__block_invoke_2;
  id v13 = &unk_1E62C8C98;
  objc_copyWeak(&v15, &location);
  uint64_t v4 = v3;
  id v14 = v4;
  uint64_t v5 = _Block_copy(&v10);
  if (self->_inGallery)
  {
    spinnerButton = self->_spinnerButton;
    uint64_t v7 = [(_NTKCFaceDetailCustomPhotosViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:spinnerButton];

    [(NTKCompanionCustomPhotosEditor *)self->_editor generateGalleryPreviewResourceDirectoryWithCompletion:v5];
  }
  else if ([(NTKCompanionResourceDirectoryEditor *)self->_editor state] == 2)
  {
    id v8 = self->_spinnerButton;
    int64_t v9 = [(_NTKCFaceDetailCustomPhotosViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:v8];

    [(NTKCompanionCustomPhotosEditor *)self->_editor finalizeWithCompletion:v5];
  }
  else
  {
    v4[2](v4);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_selectPressed
{
}

- (void)_donePressed
{
}

- (void)_selectAllPressed
{
  BOOL v3 = [(_NTKCFaceDetailCustomPhotosViewController *)self _allPhotosSelected];
  if (v3) {
    [(NSMutableIndexSet *)self->_selectedIndexes removeAllIndexes];
  }
  else {
    [(_NTKCFaceDetailCustomPhotosViewController *)self _selectAllPhotos];
  }
  BOOL v4 = !v3;
  uint64_t v5 = [(_NTKCFaceDetailCustomPhotosViewController *)self collectionView];
  BOOL v6 = [v5 visibleCells];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62___NTKCFaceDetailCustomPhotosViewController__selectAllPressed__block_invoke;
  v7[3] = &__block_descriptor_33_e34_v32__0__NTKCPhotoListCell_8Q16_B24l;
  BOOL v8 = v4;
  [v6 enumerateObjectsUsingBlock:v7];

  [(_NTKCFaceDetailCustomPhotosViewController *)self _updateButtonsForSelectionChanged];
}

- (void)_addPressed
{
  int64_t v3 = [(NTKCompanionCustomPhotosEditor *)self->_editor photosCount];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56___NTKCFaceDetailCustomPhotosViewController__addPressed__block_invoke;
  v4[3] = &unk_1E62C8128;
  v4[4] = self;
  +[NTKCPhotosAddController presentPhotosAddControllerFromViewController:self selectionLimit:24 - v3 withCompletion:v4];
}

- (void)_deletePressed
{
  if (self->_deleteConfirmed)
  {
    self->_deleteConfirmed = 0;
    int64_t v3 = objc_opt_new();
    selectedIndexes = self->_selectedIndexes;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59___NTKCFaceDetailCustomPhotosViewController__deletePressed__block_invoke_2;
    v21[3] = &unk_1E62C4C58;
    v22 = v3;
    uint64_t v23 = self;
    id v5 = v3;
    [(NSMutableIndexSet *)selectedIndexes enumerateIndexesWithOptions:2 usingBlock:v21];
    [(NSMutableIndexSet *)self->_selectedIndexes removeAllIndexes];
    BOOL v6 = [(_NTKCFaceDetailCustomPhotosViewController *)self collectionView];
    [v6 deleteItemsAtIndexPaths:v5];

    [(_NTKCFaceDetailCustomPhotosViewController *)self setEditing:0 animated:1];
    uint64_t v7 = v22;
  }
  else
  {
    uint64_t v8 = [(NSMutableIndexSet *)self->_selectedIndexes count];
    int64_t v9 = @"_PLURAL";
    if (v8 == 1) {
      int64_t v9 = @"_SINGULAR";
    }
    uint64_t v10 = v9;
    uint64_t v11 = [@"PHOTOS_DELETE_CONFIRMATION" stringByAppendingString:v10];
    NTKCCustomizationLocalizedString(v11, @"Delete Confirmation", v12);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v5 preferredStyle:0];
    id v13 = [@"PHOTOS_DELETE_BUTTON" stringByAppendingString:v10];

    id v15 = NTKCCustomizationLocalizedString(v13, @"Delete Photos", v14);

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59___NTKCFaceDetailCustomPhotosViewController__deletePressed__block_invoke;
    v24[3] = &unk_1E62C0AA8;
    v24[4] = self;
    id v16 = [MEMORY[0x1E4FB1410] actionWithTitle:v15 style:2 handler:v24];
    [v7 addAction:v16];

    id v17 = (void *)MEMORY[0x1E4FB1410];
    v19 = NTKCCustomizationLocalizedString(@"PHOTOS_CANCEL_BUTTON", @"Cancel", v18);
    uint64_t v20 = [v17 actionWithTitle:v19 style:1 handler:0];
    [v7 addAction:v20];

    [(_NTKCFaceDetailCustomPhotosViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

- (BOOL)_allPhotosSelected
{
  int64_t v3 = [(NTKCompanionCustomPhotosEditor *)self->_editor photosCount];
  selectedIndexes = self->_selectedIndexes;

  return -[NSMutableIndexSet containsIndexesInRange:](selectedIndexes, "containsIndexesInRange:", 0, v3);
}

- (void)_selectAllPhotos
{
  int64_t v3 = [(NTKCompanionCustomPhotosEditor *)self->_editor photosCount];
  selectedIndexes = self->_selectedIndexes;

  -[NSMutableIndexSet addIndexesInRange:](selectedIndexes, "addIndexesInRange:", 0, v3);
}

- (NTKCompanionCustomPhotosEditor)editor
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

- (NTKCFaceDetailCustomPhotosViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKCFaceDetailCustomPhotosViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (NTKBasePhotosFaceView)faceView
{
  return self->_faceView;
}

- (void)setFaceView:(id)a3
{
}

- (BOOL)externalImagesSet
{
  return self->_externalImagesSet;
}

- (void)setExternalImagesSet:(BOOL)a3
{
  self->_externalImagesSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_selectedIndexes, 0);
  objc_storeStrong((id *)&self->_editingToolBarItems, 0);
  objc_storeStrong((id *)&self->_defaultToolBarItems, 0);
  objc_storeStrong((id *)&self->_spinnerButton, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_deselectAllButton, 0);
  objc_storeStrong((id *)&self->_selectAllButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);

  objc_storeStrong((id *)&self->_saveButton, 0);
}

@end