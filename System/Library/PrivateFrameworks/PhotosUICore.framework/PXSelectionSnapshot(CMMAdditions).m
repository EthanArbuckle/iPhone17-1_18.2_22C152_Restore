@interface PXSelectionSnapshot(CMMAdditions)
- (uint64_t)areAllUnsavedAssetsSelectedWithImportStatusManager:()CMMAdditions;
@end

@implementation PXSelectionSnapshot(CMMAdditions)

- (uint64_t)areAllUnsavedAssetsSelectedWithImportStatusManager:()CMMAdditions
{
  id v5 = a3;
  v6 = [a1 selectedIndexPaths];
  v7 = [a1 dataSource];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      char v27 = 1;
      goto LABEL_4;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v17 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, a1, @"PXSectionedSelectionManager+CMM.m", 44, @"%@ should be an instance inheriting from %@, but it is %@", @"self.dataSource", v15, v17 object file lineNumber description];
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, a1, @"PXSectionedSelectionManager+CMM.m", 44, @"%@ should be an instance inheriting from %@, but it is nil", @"self.dataSource", v15 object file lineNumber description];
  }

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  if (!v7)
  {
    memset(v23, 0, sizeof(v23));
    goto LABEL_5;
  }
LABEL_4:
  [v7 firstItemIndexPath];
LABEL_5:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__PXSelectionSnapshot_CMMAdditions__areAllUnsavedAssetsSelectedWithImportStatusManager___block_invoke;
  v18[3] = &unk_1E5DC8D18;
  id v8 = v7;
  id v19 = v8;
  id v9 = v5;
  id v20 = v9;
  id v10 = v6;
  id v21 = v10;
  v22 = &v24;
  [v8 enumerateItemIndexPathsStartingAtIndexPath:v23 reverseDirection:0 usingBlock:v18];
  uint64_t v11 = *((unsigned __int8 *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v11;
}

@end