@interface PXPhotoKitAssetCollectionSortActionPerformer
+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (void)_handleSortOrderSelected:(int64_t)a3 forAssetCollection:(id)a4;
@end

@implementation PXPhotoKitAssetCollectionSortActionPerformer

+ (void)_handleSortOrderSelected:(int64_t)a3 forAssetCollection:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _PXSortActionTypeForAssetCollection(v5);
  v7 = PLUIGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == a3)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      int64_t v24 = (int64_t)v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Sort Action: User selected a custom sort key that is already set for %@", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 134218242;
      int64_t v24 = a3;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Sort Action: setting sort key %ld for asset collection %@", buf, 0x16u);
    }

    BOOL v9 = [v5 assetCollectionType] == 2 && objc_msgSend(v5, "assetCollectionSubtype") == 1000000204;
    uint64_t v10 = 0x100000000;
    uint64_t v11 = 1;
    switch(a3)
    {
      case 0:
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        v15 = [NSString stringWithUTF8String:"PXSortActionResult _PXSortActionResultForType(PXSortActionType)"];
        v16 = v14;
        v17 = v15;
        uint64_t v18 = 84;
        goto LABEL_16;
      case 1:
      case 2:
        uint64_t v11 = 0;
        goto LABEL_12;
      case 3:
        goto LABEL_12;
      case 4:
        uint64_t v10 = 0;
        uint64_t v11 = 1;
LABEL_12:
        uint64_t v12 = v10 | v11;
        v13 = [v5 photoLibrary];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __92__PXPhotoKitAssetCollectionSortActionPerformer__handleSortOrderSelected_forAssetCollection___block_invoke;
        v19[3] = &unk_1E5DBE3F8;
        BOOL v22 = v9;
        v20 = v5;
        uint64_t v21 = v12;
        [v13 performChanges:v19 completionHandler:&__block_literal_global_137383];

        v7 = v20;
        break;
      default:
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        v15 = [NSString stringWithUTF8String:"PXSortActionResult _PXSortActionResultForType(PXSortActionType)"];
        v16 = v14;
        v17 = v15;
        uint64_t v18 = 88;
LABEL_16:
        [v16 handleFailureInFunction:v17 file:@"PXPhotoKitAssetCollectionSortActionPerformer.m" lineNumber:v18 description:@"Code which should be unreachable has been reached"];

        abort();
    }
  }
}

void __92__PXPhotoKitAssetCollectionSortActionPerformer__handleSortOrderSelected_forAssetCollection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    [MEMORY[0x1E4F392F8] changeRequestForSmartAlbum:v2];
  }
  else {
  id v3 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:v2];
  }
  [v3 setCustomSortKey:*(unsigned int *)(a1 + 40)];
  [v3 setCustomSortAscending:*(unsigned __int8 *)(a1 + 44)];
}

void __92__PXPhotoKitAssetCollectionSortActionPerformer__handleSortOrderSelected_forAssetCollection___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUIGetLog();
  uint64_t v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      v7 = "Sort Action: change request succeeded";
      BOOL v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v4;
    v7 = "Sort Action: change request failed with error: %@";
    BOOL v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v31 = PXLocalizedStringFromTable(@"PXContentSortingMenuTitle", @"PhotosUICore");
  os_log_type_t v9 = (void *)MEMORY[0x1E4FB1818];
  uint32_t v10 = [a1 systemImageNameForAssetCollectionReference:v8 withInputs:v7];

  int v11 = [v9 systemImageNamed:v10];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  uint64_t v13 = [v8 assetCollection];

  uint64_t v14 = _PXSortActionTypeForAssetCollection(v13);
  v15 = (void *)MEMORY[0x1E4FB13F0];
  v16 = PXLocalizedStringFromTable(@"PXContentSortingMenuOldestFirst", @"PhotosUICore");
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke;
  v38[3] = &unk_1E5DC9A58;
  id v17 = v13;
  id v39 = v17;
  uint64_t v18 = [v15 actionWithTitle:v16 image:0 identifier:0 handler:v38];

  [v18 setState:v14 == 3];
  [v12 addObject:v18];
  v19 = (void *)MEMORY[0x1E4FB13F0];
  v20 = PXLocalizedStringFromTable(@"PXContentSortingMenuNewestFirst", @"PhotosUICore");
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_2;
  v36[3] = &unk_1E5DC9A58;
  id v21 = v17;
  id v37 = v21;
  BOOL v22 = [v19 actionWithTitle:v20 image:0 identifier:0 handler:v36];

  [v22 setState:v14 == 4];
  [v12 addObject:v22];
  BOOL IsCloudShared = _PXAssetCollectionIsCloudShared(v21);
  int64_t v24 = (void *)MEMORY[0x1E4FB13F0];
  if (IsCloudShared)
  {
    __int16 v25 = PXLocalizedStringFromTable(@"PXContentSortingMenuDateAdded", @"PhotosUICore");
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_3;
    v34[3] = &unk_1E5DC9A58;
    id v26 = &v35;
    id v35 = v21;
    uint64_t v27 = [v24 actionWithTitle:v25 image:0 identifier:0 handler:v34];
    uint64_t v28 = 2;
  }
  else
  {
    __int16 v25 = PXLocalizedStringFromTable(@"PXContentSortingMenuCustomOrder", @"PhotosUICore");
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_4;
    v32[3] = &unk_1E5DC9A58;
    id v26 = &v33;
    id v33 = v21;
    uint64_t v27 = [v24 actionWithTitle:v25 image:0 identifier:0 handler:v32];
    uint64_t v28 = 1;
  }

  [v27 setState:v14 == v28];
  [v12 addObject:v27];

  v29 = [MEMORY[0x1E4FB1970] menuWithTitle:v31 image:v11 identifier:0 options:0 children:v12];

  return v29;
}

uint64_t __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke(uint64_t a1)
{
  return +[PXPhotoKitAssetCollectionSortActionPerformer _handleSortOrderSelected:3 forAssetCollection:*(void *)(a1 + 32)];
}

uint64_t __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_2(uint64_t a1)
{
  return +[PXPhotoKitAssetCollectionSortActionPerformer _handleSortOrderSelected:4 forAssetCollection:*(void *)(a1 + 32)];
}

uint64_t __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_3(uint64_t a1)
{
  return +[PXPhotoKitAssetCollectionSortActionPerformer _handleSortOrderSelected:2 forAssetCollection:*(void *)(a1 + 32)];
}

uint64_t __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_4(uint64_t a1)
{
  return +[PXPhotoKitAssetCollectionSortActionPerformer _handleSortOrderSelected:1 forAssetCollection:*(void *)(a1 + 32)];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"PXPhotosGridsSort", @"PhotosUICore");
}

+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v7 = objc_msgSend(a4, "assetCollection", a3);
  if (!v7)
  {
    uint32_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    int v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionSortActionPerformer.m", 99, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v12 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint32_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v13);
    uint64_t v14 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionSortActionPerformer.m", 99, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v12, v14 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  BOOL v8 = +[PXCollectionSortOrderUtilities userCanChangeSortOrderInCollection:v7];

  return v8;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeSort" systemImageName:a5];
}

@end