@interface PXSectionedSelectionManager(CMMAdditions)
- (void)selectNonCopiedAssetsWithImportStatusManager:()CMMAdditions;
@end

@implementation PXSectionedSelectionManager(CMMAdditions)

- (void)selectNonCopiedAssetsWithImportStatusManager:()CMMAdditions
{
  id v5 = a3;
  v6 = [a1 selectionSnapshot];
  id v7 = [v6 dataSource];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, a1, @"PXSectionedSelectionManager+CMM.m", 20, @"%@ should be an instance inheriting from %@, but it is %@", @"dataSourceSnapshot", v18, v20 object file lineNumber description];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, a1, @"PXSectionedSelectionManager+CMM.m", 20, @"%@ should be an instance inheriting from %@, but it is nil", @"dataSourceSnapshot", v18 object file lineNumber description];
  }

LABEL_3:
  v8 = [off_1E5DA7430 indexPathSet];
  if (v7) {
    [v7 firstItemIndexPath];
  }
  else {
    memset(v27, 0, sizeof(v27));
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __90__PXSectionedSelectionManager_CMMAdditions__selectNonCopiedAssetsWithImportStatusManager___block_invoke;
  v23[3] = &unk_1E5DC8CF0;
  id v9 = v7;
  id v24 = v9;
  id v10 = v5;
  id v25 = v10;
  id v11 = v8;
  id v26 = v11;
  [v9 enumerateItemIndexPathsStartingAtIndexPath:v27 reverseDirection:0 usingBlock:v23];
  id v12 = [v6 selectedIndexPaths];
  if (v12 == v11)
  {

    v15 = v11;
    goto LABEL_10;
  }
  v13 = v12;
  char v14 = [v12 isEqual:v11];

  if ((v14 & 1) == 0)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90__PXSectionedSelectionManager_CMMAdditions__selectNonCopiedAssetsWithImportStatusManager___block_invoke_2;
    v21[3] = &unk_1E5DC9F28;
    id v22 = v11;
    [a1 performChanges:v21];
    v15 = v22;
LABEL_10:
  }
}

@end