@interface PXPhotoKitMessagesAssetActionManager
+ (id)assetActionManagerWithCMMSession:(id)a3;
- (id)_selectionSnapshotForPerformerClass:(Class)a3 applySubsetIfNeeded:(BOOL)a4;
- (unint64_t)presentationSource;
- (void)px_registerAdditionalPerformerClasses;
@end

@implementation PXPhotoKitMessagesAssetActionManager

- (id)_selectionSnapshotForPerformerClass:(Class)a3 applySubsetIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  v8 = [(PXAssetActionManager *)self selectionManager];
  v9 = [v8 selectionSnapshot];

  v10 = [v9 dataSource];
  if (!v10)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    v42 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v42);
    [v41 handleFailureInMethod:a2, self, @"PXPhotoKitMessagesAssetActionManager.m", 48, @"%@ should be an instance inheriting from %@, but it is nil", @"selectionSnapshot.dataSource", v43 object file lineNumber description];
LABEL_25:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    v44 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v44);
    v45 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v41 handleFailureInMethod:a2, self, @"PXPhotoKitMessagesAssetActionManager.m", 48, @"%@ should be an instance inheriting from %@, but it is %@", @"selectionSnapshot.dataSource", v43, v45 object file lineNumber description];

    goto LABEL_25;
  }
LABEL_3:
  if (([v9 isAnyItemSelected] & 1) != 0
    || ([(PXAssetActionManager *)self objectReference],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    if (([v9 isAnyItemSelected] & 1) != 0
      || ([v10 containerCollection],
          v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [(objc_class *)a3 canPerformOnImplicitSelectionInContainerCollection:v17], v17, !v18))
    {
      if ([(objc_class *)a3 canPerformOnSubsetOfSelection] && v4)
      {
        id v22 = objc_alloc_init((Class)off_1E5DA7430);
        v23 = [v10 photosDataSource];
        v24 = [v9 selectedIndexPaths];
        v25 = [(PXPhotoKitAssetActionManager *)self person];
        v26 = [(PXPhotoKitAssetActionManager *)self socialGroup];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __96__PXPhotoKitMessagesAssetActionManager__selectionSnapshotForPerformerClass_applySubsetIfNeeded___block_invoke;
        v46[3] = &unk_1E5DC5E78;
        id v50 = v22;
        Class v51 = a3;
        id v47 = v23;
        id v48 = v25;
        id v49 = v26;
        id v27 = v22;
        id v28 = v26;
        id v29 = v25;
        id v30 = v23;
        [v24 enumerateItemIndexPathsUsingBlock:v46];
        uint64_t v31 = [objc_alloc((Class)off_1E5DA84E8) initWithDataSource:v10 selectedIndexPaths:v27];

        v9 = (void *)v31;
      }
    }
    else
    {
      id v19 = objc_alloc((Class)off_1E5DA84E8);
      v20 = [v10 allItemIndexPaths];
      uint64_t v21 = [v19 initWithDataSource:v10 selectedIndexPaths:v20];

      v9 = (void *)v21;
    }
  }
  else
  {
    v12 = [v9 dataSource];
    uint64_t v13 = [v12 identifier];
    v14 = [(PXAssetActionManager *)self objectReference];
    v15 = v14;
    if (v14)
    {
      [v14 indexPath];
      uint64_t v16 = v53;
    }
    else
    {
      uint64_t v16 = 0;
      long long v53 = 0u;
      long long v54 = 0u;
    }

    if (v13 != v16)
    {
      v32 = [v9 dataSource];
      v33 = [(PXAssetActionManager *)self objectReference];
      v34 = [v32 objectReferenceForObjectReference:v33];
      [(PXAssetActionManager *)self setObjectReference:v34];
    }
    id v35 = objc_alloc((Class)off_1E5DA84E8);
    v36 = [v9 dataSource];
    v37 = [(PXAssetActionManager *)self objectReference];
    v38 = v37;
    if (v37) {
      [v37 indexPath];
    }
    else {
      memset(v52, 0, sizeof(v52));
    }
    uint64_t v39 = [v35 initWithDataSource:v36 selectedIndexPath:v52];

    v9 = (void *)v39;
  }

  return v9;
}

void __96__PXPhotoKitMessagesAssetActionManager__selectionSnapshotForPerformerClass_applySubsetIfNeeded___block_invoke(uint64_t a1, long long *a2)
{
  BOOL v4 = [*(id *)(a1 + 32) assetCollectionForSection:*((void *)a2 + 1)];
  v5 = *(void **)(a1 + 32);
  long long v6 = a2[1];
  long long v10 = *a2;
  long long v11 = v6;
  v7 = [v5 assetAtSimpleIndexPath:&v10];
  if ([*(id *)(a1 + 64) canPerformOnAsset:v7 inAssetCollection:v4 person:*(void *)(a1 + 40) socialGroup:*(void *)(a1 + 48)])
  {
    v8 = *(void **)(a1 + 56);
    long long v9 = a2[1];
    long long v10 = *a2;
    long long v11 = v9;
    [v8 addIndexPath:&v10];
  }
}

- (unint64_t)presentationSource
{
  return 2;
}

- (void)px_registerAdditionalPerformerClasses
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitMessagesAssetActionManager;
  [(PXAssetActionManager *)&v3 px_registerAdditionalPerformerClasses];
  [(PXPhotoKitAssetActionManager *)self registerPerformerClass:objc_opt_class() forType:@"PXAssetActionTypeAddToLibrary"];
}

+ (id)assetActionManagerWithCMMSession:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 viewModel];
  long long v6 = [v5 selectionManager];

  v7 = (void *)[objc_alloc((Class)a1) initWithSelectionManager:v6];
  v8 = [v6 dataSourceManager];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"+[PXPhotoKitMessagesAssetActionManager assetActionManagerWithCMMSession:]"];
    id v19 = (objc_class *)objc_opt_class();
    int v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v15 handleFailureInFunction:v16, @"PXPhotoKitMessagesAssetActionManager.m", 24, @"%@ should be an instance inheriting from %@, but it is %@", @"selectionManager.dataSourceManager", v18, v20 file lineNumber description];
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"+[PXPhotoKitMessagesAssetActionManager assetActionManagerWithCMMSession:]"];
    v17 = (objc_class *)objc_opt_class();
    int v18 = NSStringFromClass(v17);
    [v15 handleFailureInFunction:v16, @"PXPhotoKitMessagesAssetActionManager.m", 24, @"%@ should be an instance inheriting from %@, but it is nil", @"selectionManager.dataSourceManager", v18 file lineNumber description];
  }

LABEL_3:
  [v7 setDataSourceManager:v8];

  long long v9 = [v4 importStatusManager];
  [v7 setImportStatusManager:v9];

  long long v10 = [v4 importSessionID];

  [v7 setImportSessionID:v10];
  long long v11 = (void *)MEMORY[0x1E4F1CAD0];
  v21[0] = @"PXAssetActionTypeAddToLibrary";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v13 = [v11 setWithArray:v12];

  [v7 setAllowedActionTypes:v13];
  return v7;
}

@end