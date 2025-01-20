@interface PXRenameCollectionAction
+ (id)_actionNameLocalizationKeyForCollectionType:(unint64_t)a3;
+ (id)actionNameForCollection:(id)a3;
+ (unint64_t)_renameTypeForCollection:(id)a3;
- (NSString)currentTitle;
- (NSString)redoTitle;
- (NSString)undoTitle;
- (PHCollection)collection;
- (PXRenameCollectionAction)initWithCollection:(id)a3 title:(id)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (unint64_t)collectionType;
- (void)_changeTitle:(id)a3 completionHandler:(id)a4;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setCurrentTitle:(id)a3;
@end

@implementation PXRenameCollectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoTitle, 0);
  objc_storeStrong((id *)&self->_redoTitle, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_currentTitle, 0);
}

- (NSString)undoTitle
{
  return self->_undoTitle;
}

- (NSString)redoTitle
{
  return self->_redoTitle;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (PHCollection)collection
{
  return self->_collection;
}

- (void)setCurrentTitle:(id)a3
{
}

- (NSString)currentTitle
{
  return self->_currentTitle;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  id v5 = [(PXRenameCollectionAction *)self undoTitle];
  [(PXRenameCollectionAction *)self _changeTitle:v5 completionHandler:v4];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PXRenameCollectionAction *)self redoTitle];
  [(PXRenameCollectionAction *)self _changeTitle:v5 completionHandler:v4];
}

- (id)actionNameLocalizationKey
{
  v3 = objc_opt_class();
  unint64_t v4 = [(PXRenameCollectionAction *)self collectionType];
  return (id)[v3 _actionNameLocalizationKeyForCollectionType:v4];
}

- (id)actionIdentifier
{
  return @"RenameCollection";
}

- (void)_changeTitle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXRenameCollectionAction *)self collection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__PXRenameCollectionAction__changeTitle_completionHandler___block_invoke;
  v15[3] = &unk_1E5DD0F30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PXRenameCollectionAction__changeTitle_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5DD1B00;
  v12[4] = self;
  id v13 = v17;
  id v14 = v7;
  id v9 = v7;
  id v10 = v17;
  id v11 = v8;
  [(PXPhotosAction *)self performChanges:v15 completionHandler:v12];
}

void __59__PXRenameCollectionAction__changeTitle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) collectionType];
  switch(v2)
  {
    case 3:
      uint64_t v3 = *(void *)(a1 + 48);
      unint64_t v4 = [MEMORY[0x1E4F39010] changeRequestForCollectionList:*(void *)(a1 + 40)];
      break;
    case 2:
      uint64_t v3 = *(void *)(a1 + 48);
      unint64_t v4 = [MEMORY[0x1E4F392F8] changeRequestForSmartAlbum:*(void *)(a1 + 40)];
      break;
    case 1:
      uint64_t v3 = *(void *)(a1 + 48);
      unint64_t v4 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:*(void *)(a1 + 40)];
      break;
    default:
      return;
  }
  id v5 = v4;
  [v4 setTitle:v3];
}

void __59__PXRenameCollectionAction__changeTitle_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) setCurrentTitle:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (PXRenameCollectionAction)initWithCollection:(id)a3 title:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 canPerformEditOperation:7])
  {
    id v9 = (void *)[v8 copy];
    uint64_t v10 = [v7 localizedTitle];
    id v11 = (void *)v10;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    else {
      v12 = &stru_1F00B0030;
    }
    id v13 = v12;

    if ([v9 isEqualToString:v13])
    {
      v19 = 0;
    }
    else
    {
      uint64_t v14 = [(id)objc_opt_class() _renameTypeForCollection:v7];
      if (!v14) {
        PXAssertGetLog();
      }
      unint64_t v15 = v14;
      id v16 = [v7 photoLibrary];
      v21.receiver = self;
      v21.super_class = (Class)PXRenameCollectionAction;
      id v17 = [(PXPhotosAction *)&v21 initWithPhotoLibrary:v16];

      if (v17)
      {
        objc_storeStrong((id *)&v17->_collection, a3);
        v17->_collectionType = v15;
        objc_storeStrong((id *)&v17->_redoTitle, v9);
        objc_storeStrong((id *)&v17->_undoTitle, v12);
        currentTitle = v17->_currentTitle;
        v17->_currentTitle = (NSString *)&stru_1F00B0030;
      }
      self = v17;
      v19 = self;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)actionNameForCollection:(id)a3
{
  uint64_t v3 = objc_msgSend(a1, "_actionNameLocalizationKeyForCollectionType:", objc_msgSend(a1, "_renameTypeForCollection:", a3));
  unint64_t v4 = PXLocalizedStringFromTable(v3, @"PhotosUICore");

  return v4;
}

+ (id)_actionNameLocalizationKeyForCollectionType:(unint64_t)a3
{
  uint64_t v3 = @"PXPhotosGridRenameAlbumActionMenuTitle";
  if (a3 == 2) {
    uint64_t v3 = @"PXRenameSmartAlbumActionName";
  }
  if (a3 == 3) {
    return @"PXRenameFolderActionName";
  }
  else {
    return v3;
  }
}

+ (unint64_t)_renameTypeForCollection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 assetCollectionSubtype] == 1000000204) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v4 = 3;
    }
    else {
      unint64_t v4 = 0;
    }
  }

  return v4;
}

@end