@interface PXPhotoKitCollectionListCreateCollectionActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4;
+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4;
- (NSArray)preselectedAssets;
- (PHCollection)createdCollection;
- (id)finishedPickingBlock;
- (void)performUserInteractionTask;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCreatedCollection:(id)a3;
- (void)setFinishedPickingBlock:(id)a3;
- (void)setPreselectedAssets:(id)a3;
@end

@implementation PXPhotoKitCollectionListCreateCollectionActionPerformer

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  id v4 = a4;
  if (([v4 isEqualToString:@"PXCollectionListActionTypeCreateAlbum"] & 1) != 0
    || ([v4 isEqualToString:@"PXCollectionListActionTypeCreateAlbumWithPhotosPicker"] & 1) != 0)
  {
    v5 = @"rectangle.stack.badge.plus";
  }
  else if ([v4 isEqualToString:@"PXCollectionListActionTypeCreateFolder"])
  {
    v5 = @"folder.badge.plus";
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  uint64_t v4 = localizedTitleForActionType_collectionList__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&localizedTitleForActionType_collectionList__onceToken, &__block_literal_global_71943);
  }
  v6 = [(id)localizedTitleForActionType_collectionList__titles objectForKeyedSubscript:v5];

  return v6;
}

void __102__PXPhotoKitCollectionListCreateCollectionActionPerformer_localizedTitleForActionType_collectionList___block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"PXCollectionListActionTypeCreateAlbum";
  v0 = PXLocalizedStringFromTable(@"CREATE_NEW_ALBUM", @"PhotosUICore");
  v8[0] = v0;
  v7[1] = @"PXCollectionListActionTypeCreateAlbumWithPhotosPicker";
  v1 = PXLocalizedStringFromTable(@"CREATE_NEW_ALBUM", @"PhotosUICore");
  v8[1] = v1;
  v7[2] = @"PXCollectionListActionTypeCreateSharedAlbum";
  v2 = PXLocalizedStringFromTable(@"CREATE_NEW_SHARED_ALBUM", @"PhotosUICore");
  v8[2] = v2;
  v7[3] = @"PXCollectionListActionTypeCreateSmartAlbum";
  v3 = PXLocalizedStringFromTable(@"CREATE_NEW_SMART_ALBUM", @"PhotosUICore");
  v8[3] = v3;
  v7[4] = @"PXCollectionListActionTypeCreateFolder";
  uint64_t v4 = PXLocalizedStringFromTable(@"CREATE_NEW_FOLDER", @"PhotosUICore");
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v6 = (void *)localizedTitleForActionType_collectionList__titles;
  localizedTitleForActionType_collectionList__titles = v5;
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return [a3 canPerformEditOperation:4];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishedPickingBlock, 0);
  objc_storeStrong((id *)&self->_preselectedAssets, 0);
  objc_storeStrong((id *)&self->_createdCollection, 0);
}

- (void)setFinishedPickingBlock:(id)a3
{
}

- (id)finishedPickingBlock
{
  return self->_finishedPickingBlock;
}

- (void)setPreselectedAssets:(id)a3
{
}

- (NSArray)preselectedAssets
{
  return self->_preselectedAssets;
}

- (void)setCreatedCollection:(id)a3
{
}

- (PHCollection)createdCollection
{
  return self->_createdCollection;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXPhotoKitCollectionListActionPerformer *)self collectionList];
  uint64_t v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "Picker in collection list action manually dismissed with no picked assets for collection list: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(PXPhotoKitCollectionListCreateCollectionActionPerformer *)self finishedPickingBlock];
  v6[2](v6, MEMORY[0x1E4F1CBF0]);

  [(PXPhotoKitCollectionListCreateCollectionActionPerformer *)self setFinishedPickingBlock:0];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [a3 dismissViewControllerAnimated:1 completion:0];
  PXMap();
}

uint64_t __83__PXPhotoKitCollectionListCreateCollectionActionPerformer_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

- (void)performUserInteractionTask
{
  uint64_t v4 = [(PXActionPerformer *)self actionType];
  if ([v4 isEqualToString:@"PXCollectionListActionTypeCreateAlbumWithPhotosPicker"])
  {

LABEL_4:
    int v7 = [(PXPhotoKitCollectionListActionPerformer *)self collectionList];
    v8 = [(PXPhotoKitCollectionListCreateCollectionActionPerformer *)self preselectedAssets];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__PXPhotoKitCollectionListCreateCollectionActionPerformer_performUserInteractionTask__block_invoke;
    v14[3] = &unk_1E5DB62F0;
    v14[4] = self;
    v14[5] = a2;
    uint64_t v9 = +[PXLemonadeCollectionCustomizationAlbumsFactory albumsCustomizationViewControllerWithRootCollectionList:v7 preselectedAssets:v8 completion:v14];

    [v9 setModalPresentationStyle:2];
    [(PXActionPerformer *)self presentViewController:v9];

    return;
  }
  id v5 = [(PXActionPerformer *)self actionType];
  int v6 = [v5 isEqualToString:@"PXCollectionListActionTypeCreateAlbum"];

  if (v6) {
    goto LABEL_4;
  }
  v10 = [(PXActionPerformer *)self actionType];
  int v11 = [v10 isEqualToString:@"PXCollectionListActionTypeCreateFolder"];

  if (v11)
  {
    v12 = [(PXPhotoKitCollectionListActionPerformer *)self collectionList];
    id v13 = +[PXLemonadeCollectionCustomizationFoldersFactory foldersCustomizationViewControllerWithRootCollectionList:v12];

    [v13 setModalPresentationStyle:2];
    [(PXActionPerformer *)self presentViewController:v13];
  }
}

void __85__PXPhotoKitCollectionListCreateCollectionActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      v10 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v5 handleFailureInMethod:v6, v7, @"PXPhotoKitCollectionListCreateCollectionActionPerformer.m", 84, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"createdCollection", v9, v10 object file lineNumber description];
    }
  }
  [*(id *)(a1 + 32) setCreatedCollection:v11];

  [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:0];
}

@end