@interface PXPhotoDetailsActionMenuController
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)enableSectionedMenus;
- (BOOL)sectionDisplaysInline:(int64_t)a3;
- (BOOL)shouldAllowPerformanceOfActionType:(id)a3;
- (PHFetchResult)people;
- (PXPhotoDetailsActionMenuController)initWithActionManagers:(id)a3;
- (PXPhotoDetailsActionMenuController)initWithSelectionManager:(id)a3 displayTitleInfo:(id)a4 blockActionManager:(id)a5;
- (PXPhotoKitAssetCollectionActionManager)assetActionManager;
- (PXPhotosDetailsActionMenuDelegate)delegate;
- (id)assetCollectionActionManager;
- (id)availableActionTypes;
- (id)availableActionTypesInSection:(int64_t)a3;
- (id)availableHeaderActionTypes;
- (id)availableInternalActionTypes;
- (id)iconForSection:(int64_t)a3;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)titleForSection:(int64_t)a3;
- (id)undoManagerForActionPerformer:(id)a3;
- (int64_t)numberOfSections;
- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4;
- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPeople:(id)a3;
@end

@implementation PXPhotoDetailsActionMenuController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (PXPhotoKitAssetCollectionActionManager)assetActionManager
{
  return self->_assetActionManager;
}

- (PHFetchResult)people
{
  return self->_people;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosDetailsActionMenuDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosDetailsActionMenuDelegate *)WeakRetained;
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(PXPhotoDetailsActionMenuController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(PXPhotoDetailsActionMenuController *)self delegate];
    [v9 actionMenu:self assetCollectionActionPerformer:v10 playMovieForAssetCollection:v6];
  }
}

- (id)undoManagerForActionPerformer:(id)a3
{
  v4 = [(PXPhotoDetailsActionMenuController *)self delegate];
  v5 = [v4 undoManagerForActionMenuController:self];

  return v5;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotoDetailsActionMenuController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(PXPhotoDetailsActionMenuController *)self delegate];
    char v8 = [v7 presentationEnvironmentForActionPerformer:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v9 = a3;
  char v6 = [(PXPhotoDetailsActionMenuController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(PXPhotoDetailsActionMenuController *)self delegate];
    [v8 actionMenu:self actionPerformer:v9 didChangeState:a4];
  }
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(PXPhotoDetailsActionMenuController *)self delegate];
  id v12 = v8;
  LOBYTE(self) = [v11 actionMenu:self actionPerformer:v10 dismissViewController:v12 completionHandler:v9];

  return (char)self;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotoDetailsActionMenuController *)self delegate];
  id v9 = v6;
  LOBYTE(self) = [v8 actionMenu:self actionPerformer:v7 presentViewController:v9];

  return (char)self;
}

- (BOOL)sectionDisplaysInline:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return 1;
  }
  if (a3 != 4)
  {
    if (a3 == 5)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      v5 = v4;
      SEL v6 = a2;
      id v7 = self;
      uint64_t v8 = 235;
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      v5 = v4;
      SEL v6 = a2;
      id v7 = self;
      uint64_t v8 = 238;
    }
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, @"PXPhotoDetailsActionMenuController.m", v8, @"Code which should be unreachable has been reached", a2, self);

    abort();
  }
  return 0;
}

- (id)iconForSection:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    if (a3 != 4)
    {
      if (a3 == 5)
      {
        v5 = [MEMORY[0x1E4F28B00] currentHandler];
        SEL v6 = v5;
        SEL v7 = a2;
        uint64_t v8 = self;
        uint64_t v9 = 218;
      }
      else
      {
        v5 = [MEMORY[0x1E4F28B00] currentHandler];
        SEL v6 = v5;
        SEL v7 = a2;
        uint64_t v8 = self;
        uint64_t v9 = 221;
      }
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, @"PXPhotoDetailsActionMenuController.m", v9, @"Code which should be unreachable has been reached", a2, self);

      abort();
    }
    v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"apple.logo"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)titleForSection:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return &stru_1F00B0030;
  }
  if (a3 != 4)
  {
    if (a3 == 5)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      v5 = v4;
      SEL v6 = a2;
      SEL v7 = self;
      uint64_t v8 = 201;
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      v5 = v4;
      SEL v6 = a2;
      SEL v7 = self;
      uint64_t v8 = 204;
    }
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, @"PXPhotoDetailsActionMenuController.m", v8, @"Code which should be unreachable has been reached", a2, self);

    abort();
  }
  return @"Internal";
}

- (id)availableActionTypesInSection:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      v33 = @"PXAssetCollectionActionTypePersonInfo";
      v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = &v33;
      uint64_t v5 = 1;
      goto LABEL_10;
    case 1:
      v29 = @"PXAssetCollectionActionTypeFavoritePerson";
      v30 = @"PXAssetCollectionActionTypeAddPersonToHome";
      v31 = @"PXAssetCollectionActionTypeCustomizePeopleAlbum";
      v32 = @"PXAssetCollectionActionTypeCustomizeSocialGroupAlbum";
      v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = &v29;
      goto LABEL_5;
    case 2:
      v25 = @"PXAssetCollectionActionTypeShowMap";
      v26 = @"PXPhotosDetailsShowFaceAction";
      v27 = @"PXPhotosDetailsShowAssetAction";
      v28 = @"PXAssetCollectionActionTypeChangePersonSortOrder";
      v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = &v25;
LABEL_5:
      uint64_t v5 = 4;
      goto LABEL_10;
    case 3:
      v22 = @"PXAssetCollectionActionTypeBlockPerson";
      v23 = @"PXAssetCollectionActionTypeRemovePersonFromHome";
      v24 = @"PXAssetCollectionActionTypeRemoveSocialGroupFromHome";
      v3 = (void *)MEMORY[0x1E4F1C978];
      id v4 = &v22;
      goto LABEL_9;
    case 4:
      SEL v6 = +[PXRootSettings sharedInstance];
      int v7 = [v6 canShowInternalUI];

      if (v7)
      {
        v19 = @"PXAssetCollectionActionTypeAddPersonToAutoCounter";
        v20 = @"PXAssetCollectionActionTypeFileRadar";
        v21 = @"PXAssetCollectionActionTypeCopyInternalURL";
        v3 = (void *)MEMORY[0x1E4F1C978];
        id v4 = &v19;
LABEL_9:
        uint64_t v5 = 3;
LABEL_10:
        objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33,
        uint64_t v8 = v34);
      }
      else
      {
        uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
      }
      return v8;
    case 5:
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = v12;
      SEL v14 = a2;
      v15 = self;
      uint64_t v16 = 184;
      goto LABEL_17;
    default:
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = v12;
      SEL v14 = a2;
      v15 = self;
      uint64_t v16 = 187;
LABEL_17:
      [v12 handleFailureInMethod:v14 object:v15 file:@"PXPhotoDetailsActionMenuController.m" lineNumber:v16 description:@"Code which should be unreachable has been reached"];

      abort();
  }
}

- (int64_t)numberOfSections
{
  return 5;
}

- (BOOL)enableSectionedMenus
{
  v2 = [(PXPhotoDetailsActionMenuController *)self people];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)shouldAllowPerformanceOfActionType:(id)a3
{
  return 1;
}

- (id)availableHeaderActionTypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXAssetCollectionActionTypePersonInfo";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)availableInternalActionTypes
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXAssetCollectionActionTypeAddPersonToAutoCounter";
  v4[1] = @"PXAssetCollectionActionTypeFileRadar";
  void v4[2] = @"PXAssetCollectionActionTypeCopyInternalURL";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)availableActionTypes
{
  v4[13] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXAssetCollectionActionTypeFavorite";
  v4[1] = @"PXAssetCollectionActionTypeCreateMemory";
  void v4[2] = @"PXAssetCollectionActionTypePlayMovie";
  v4[3] = @"PXAssetCollectionActionTypeDeleteMemory";
  void v4[4] = @"PXAssetCollectionActionTypeBlockMemory";
  v4[5] = @"PXAssetCollectionActionTypeSuggestPeople";
  v4[6] = @"PXAssetCollectionActionTypeChangePersonSortOrder";
  v4[7] = @"PXAssetCollectionActionTypeFavoritePerson";
  v4[8] = @"PXAssetCollectionActionTypeCustomizePeopleAlbum";
  v4[9] = @"PXAssetCollectionActionTypeCustomizeSocialGroupAlbum";
  v4[10] = @"PXAssetCollectionActionTypeCopyLink";
  v4[11] = @"PXAssetCollectionActionTypeTrashMomentShare";
  v4[12] = @"PXAssetCollectionActionTypeStoryDemo";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:13];
  return v2;
}

- (void)setPeople:(id)a3
{
  SEL v6 = (PHFetchResult *)a3;
  if (self->_people != v6)
  {
    objc_storeStrong((id *)&self->_people, a3);
    uint64_t v5 = [(PXPhotoDetailsActionMenuController *)self assetCollectionActionManager];
    [v5 setPeople:v6];

    [(PXActionMenuController *)self invalidateActions];
  }
}

- (id)assetCollectionActionManager
{
}

uint64_t __66__PXPhotoDetailsActionMenuController_assetCollectionActionManager__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (PXPhotoDetailsActionMenuController)initWithSelectionManager:(id)a3 displayTitleInfo:(id)a4 blockActionManager:(id)a5
{
  v50[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXPhotoDetailsActionMenuController.m", 51, @"Invalid parameter not satisfying: %@", @"selectionManager" object file lineNumber description];
  }
  id v12 = v9;
  v13 = [v12 selectionSnapshot];
  char v14 = [v13 isAnyItemSelected];

  v15 = v12;
  if ((v14 & 1) == 0)
  {
    id v16 = objc_alloc((Class)off_1E5DA84B0);
    v17 = [v12 dataSourceManager];
    v15 = (void *)[v16 initWithDataSourceManager:v17];

    [v15 performChanges:&__block_literal_global_301660];
  }
  v18 = [v15 dataSourceManager];
  v19 = [v18 dataSource];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"PXPhotoDetailsActionMenuController.m" lineNumber:62 description:@"Only support PXAssetsDataSource"];
  }
  if ([v19 numberOfSections] != 1) {
    PXAssertGetLog();
  }
  v37 = v12;
  uint64_t v45 = [v19 identifier];
  long long v46 = xmmword_1AB359AA0;
  uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
  v20 = [v19 assetCollectionAtSectionIndexPath:&v45];
  v39 = v10;
  v21 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:v20 displayTitleInfo:v10];
  v22 = [v15 dataSourceManager];
  [(PXAssetCollectionActionManager *)v21 setAssetsDataSourceManager:v22];

  v23 = [[PXPhotoKitAssetActionManager alloc] initWithSelectionManager:v15];
  v24 = v23;
  v38 = v11;
  if (v11)
  {
    v50[0] = v11;
    v50[1] = v21;
    v50[2] = v23;
    v25 = (void *)MEMORY[0x1E4F1C978];
    v26 = v50;
    uint64_t v27 = 3;
  }
  else
  {
    v49[0] = v21;
    v49[1] = v23;
    v25 = (void *)MEMORY[0x1E4F1C978];
    v26 = v49;
    uint64_t v27 = 2;
  }
  [v25 arrayWithObjects:v26 count:v27];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * i) setPerformerDelegate:self];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v30);
  }

  v40.receiver = self;
  v40.super_class = (Class)PXPhotoDetailsActionMenuController;
  v33 = [(PXActionMenuController *)&v40 initWithActionManagers:v28];

  return v33;
}

uint64_t __99__PXPhotoDetailsActionMenuController_initWithSelectionManager_displayTitleInfo_blockActionManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (PXPhotoDetailsActionMenuController)initWithActionManagers:(id)a3
{
  id v5 = a3;
  SEL v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoDetailsActionMenuController.m", 47, @"%s is not available as initializer", "-[PXPhotoDetailsActionMenuController initWithActionManagers:]");

  abort();
}

@end