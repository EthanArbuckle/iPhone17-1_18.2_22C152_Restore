@interface NTKCFaceDetailKaleidoscopeContentSectionController
+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4;
+ (BOOL)supressesSectionForExternalAssets:(id)a3;
- (BOOL)_canDisplayActionRowForCustomEditMode:(int64_t)a3 andOption:(id)a4;
- (BOOL)_handleDidSelectActionRowForOption:(id)a3;
- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4;
- (Class)actionRowCellClass;
- (Class)editCellClass;
- (NTKCFaceDetailKaleidoscopeContentSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7;
- (UIViewController)parentViewController;
- (id)delegate;
- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4;
- (void)_finalizeEditor;
- (void)_presentPhotoPicker;
- (void)_setPhotoFromAsset:(id)a3;
- (void)_setPhotoFromDictionary:(id)a3;
- (void)_setRawPhoto:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalAsset:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setSelectedOptions:(id)a3;
@end

@implementation NTKCFaceDetailKaleidoscopeContentSectionController

+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 faceStyle] == 23 || objc_msgSend(v5, "faceStyle") == 223;
  BOOL v7 = a4 == 12 && v6;

  return v7;
}

+ (BOOL)supressesSectionForExternalAssets:(id)a3
{
  return a3 != 0;
}

- (NTKCFaceDetailKaleidoscopeContentSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  id v29 = a6;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  uint64_t updated = _UpdateCollectionIfNecessary(&v29);
  id v17 = v29;

  v28.receiver = self;
  v28.super_class = (Class)NTKCFaceDetailKaleidoscopeContentSectionController;
  v18 = [(NTKCFaceDetailEditOptionHorizontalSectionController *)&v28 initWithTableViewController:v15 face:v12 inGallery:v9 editOptionCollection:v17 faceView:v13];

  if (v18)
  {
    v19 = [(NTKCFaceDetailSectionController *)v18 cell];
    [v19 setUserOptionIndex:updated];
    v20 = [NTKCompanionKaleidoscopeEditor alloc];
    v21 = [(NTKCFaceDetailSectionController *)v18 face];
    v22 = [v21 resourceDirectory];
    v23 = [v12 device];
    uint64_t v24 = [(NTKCompanionKaleidoscopeEditor *)v20 initWithResourceDirectory:v22 forDevice:v23];
    editor = v18->_editor;
    v18->_editor = (NTKCompanionKaleidoscopeEditor *)v24;

    v26 = [v12 selectedOptionForCustomEditMode:12 slot:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18->_currentAsset = [v26 asset];
    }
  }
  return v18;
}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = a3;
  uint64_t updated = _UpdateCollectionIfNecessary(&v13);
  id v9 = v13;

  v12.receiver = self;
  v12.super_class = (Class)NTKCFaceDetailKaleidoscopeContentSectionController;
  LOBYTE(v7) = [(NTKCFaceDetailEditOptionHorizontalSectionController *)&v12 collectionChanged:v9 withSelectedOptions:v6];

  v10 = [(NTKCFaceDetailSectionController *)self cell];

  [v10 setUserOptionIndex:updated];
  return (char)v7;
}

- (Class)editCellClass
{
  return (Class)objc_opt_class();
}

- (Class)actionRowCellClass
{
  return (Class)objc_opt_class();
}

- (void)setSelectedOptions:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NTKCFaceDetailKaleidoscopeContentSectionController;
  id v4 = a3;
  [(NTKCFaceDetailEditOptionHorizontalSectionController *)&v11 setSelectedOptions:v4];
  id v5 = NSNumber;
  id v6 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  id v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "mode"));
  v8 = [v4 objectForKeyedSubscript:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 asset] != self->_currentAsset)
    {
      unint64_t v10 = [v9 asset];
      self->_currentAsset = v10;
      if (!self->_externalAssetSet
        && v10 == 1000
        && ![(NTKCompanionKaleidoscopeEditor *)self->_editor photosCount])
      {
        [(NTKCFaceDetailKaleidoscopeContentSectionController *)self _handleDidSelectActionRowForOption:v9];
      }
    }
  }
}

- (BOOL)_canDisplayActionRowForCustomEditMode:(int64_t)a3 andOption:(id)a4
{
  return !self->_externalAssetSet;
}

- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setShowsTopSeparator:1];
  id v9 = [(NTKCFaceDetailEditOptionSectionController *)self _actionNameForOption:v6];

  v8 = [v7 textLabel];

  [v8 setText:v9];
}

- (BOOL)_handleDidSelectActionRowForOption:(id)a3
{
  return 0;
}

- (void)_presentPhotoPicker
{
  v3 = [(NTKCFaceDetailKaleidoscopeContentSectionController *)self parentViewController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__NTKCFaceDetailKaleidoscopeContentSectionController__presentPhotoPicker__block_invoke;
  v4[3] = &unk_1E62C4B20;
  v4[4] = self;
  +[NTKCPhotosAddController presentSinglePhotoAddControllerFromViewController:v3 withCompletion:v4];
}

BOOL __73__NTKCFaceDetailKaleidoscopeContentSectionController__presentPhotoPicker__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  v8 = *(id **)(a1 + 32);
  if (v7)
  {
    objc_storeStrong(v8 + 16, a2);
    [*(id *)(a1 + 32) _setPhotoFromDictionary:v7];
  }
  else
  {
    id v9 = [v8 cell];
    [v9 ensureSelectedOptionVisible:0];
  }
  return v7 != 0;
}

- (void)setExternalAsset:(id)a3
{
  id v4 = a3;
  self->_externalAssetSet = 1;
  [(NTKCFaceDetailSectionController *)self setHasSpacerRow:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NTKCFaceDetailKaleidoscopeContentSectionController *)self _setPhotoFromAsset:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NTKCFaceDetailKaleidoscopeContentSectionController *)self _setRawPhoto:v4];
    }
  }
}

- (void)_setPhotoFromDictionary:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  editor = self->_editor;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__NTKCFaceDetailKaleidoscopeContentSectionController__setPhotoFromDictionary___block_invoke;
  v6[3] = &unk_1E62C0068;
  objc_copyWeak(&v7, &location);
  [(NTKCompanionKaleidoscopeEditor *)editor setPhoto:v4 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __78__NTKCFaceDetailKaleidoscopeContentSectionController__setPhotoFromDictionary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finalizeEditor];
}

- (void)_setPhotoFromAsset:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  editor = self->_editor;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NTKCFaceDetailKaleidoscopeContentSectionController__setPhotoFromAsset___block_invoke;
  v6[3] = &unk_1E62C0068;
  objc_copyWeak(&v7, &location);
  [(NTKCompanionKaleidoscopeEditor *)editor setAsset:v4 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __73__NTKCFaceDetailKaleidoscopeContentSectionController__setPhotoFromAsset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finalizeEditor];
}

- (void)_setRawPhoto:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  editor = self->_editor;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__NTKCFaceDetailKaleidoscopeContentSectionController__setRawPhoto___block_invoke;
  v6[3] = &unk_1E62C0068;
  objc_copyWeak(&v7, &location);
  [(NTKCompanionKaleidoscopeEditor *)editor setRawImage:v4 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__NTKCFaceDetailKaleidoscopeContentSectionController__setRawPhoto___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finalizeEditor];
}

- (void)_finalizeEditor
{
  editor = self->_editor;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__NTKCFaceDetailKaleidoscopeContentSectionController__finalizeEditor__block_invoke;
  v3[3] = &unk_1E62C19C8;
  v3[4] = self;
  [(NTKCompanionKaleidoscopeEditor *)editor finalizeWithCompletion:v3];
}

void *__69__NTKCFaceDetailKaleidoscopeContentSectionController__finalizeEditor__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 face];
  [v5 setResourceDirectory:v4];

  id v6 = [*(id *)(a1 + 32) cell];
  [v6 selectUserOption];

  result = *(void **)(*(void *)(a1 + 32) + 128);
  if (result)
  {
    return (void *)[result dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_presentedPicker, 0);

  objc_storeStrong((id *)&self->_editor, 0);
}

@end