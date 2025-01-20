@interface PXFileBackedAssetAddToLibraryActionPerformer
+ (BOOL)canPerformOnImplicitSelection;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXFileBackedAssetAddToLibraryActionPerformer

+ (BOOL)canPerformOnImplicitSelection
{
  return 1;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3
{
  return [a3 isAnyItemSelected];
}

- (void)performUserInteractionTask
{
  v3 = [(PXAssetActionPerformer *)self selectionSnapshot];
  if (([v3 isAnyItemSelected] & 1) == 0)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"No items selected for add to library action");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v4];
    goto LABEL_9;
  }
  v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [v3 dataSource];
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"-[PXFileBackedAssetAddToLibraryActionPerformer performUserInteractionTask]"];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v11 handleFailureInFunction:v12, @"PXFileBackedAssetAddToLibraryActionPerformer.m", 40, @"%@ should be an instance inheriting from %@, but it is nil", @"snapshot.dataSource", v14 file lineNumber description];
LABEL_12:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"-[PXFileBackedAssetAddToLibraryActionPerformer performUserInteractionTask]"];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v11 handleFailureInFunction:v12, @"PXFileBackedAssetAddToLibraryActionPerformer.m", 40, @"%@ should be an instance inheriting from %@, but it is %@", @"snapshot.dataSource", v14, v16 file lineNumber description];

    goto LABEL_12;
  }
LABEL_4:
  v7 = [v3 selectedIndexPaths];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke;
  v22[3] = &unk_1E5DCA3B8;
  id v8 = v6;
  id v23 = v8;
  id v9 = v5;
  id v24 = v9;
  [v7 enumerateItemIndexPathsUsingBlock:v22];

  if (v4)
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_2;
    v19[3] = &unk_1E5DD36F8;
    id v20 = v9;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_3;
    v17[3] = &unk_1E5DD0950;
    objc_copyWeak(&v18, &location);
    [v4 performChanges:v19 completionHandler:v17];
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Unable to acquire photo library to save to");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v10];
  }
LABEL_9:
}

void __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v14[0] = *a2;
  v14[1] = v4;
  v5 = [v3 assetAtItemIndexPath:v14];
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[PXFileBackedAssetAddToLibraryActionPerformer performUserInteractionTask]_block_invoke"];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v8 handleFailureInFunction:v9, @"PXFileBackedAssetAddToLibraryActionPerformer.m", 42, @"%@ should be an instance inheriting from %@, but it is nil", @"[dataSource assetAtItemIndexPath:indexPath]", v11 file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[PXFileBackedAssetAddToLibraryActionPerformer performUserInteractionTask]_block_invoke"];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v8 handleFailureInFunction:v9, @"PXFileBackedAssetAddToLibraryActionPerformer.m", 42, @"%@ should be an instance inheriting from %@, but it is %@", @"[dataSource assetAtItemIndexPath:indexPath]", v11, v13 file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  v6 = *(void **)(a1 + 40);
  v7 = [v5 url];
  [v6 addObject:v7];
}

void __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = (id)objc_msgSend(MEMORY[0x1E4F38F28], "creationRequestForAssetFromImageAtFileURL:", *(void *)(*((void *)&v7 + 1) + 8 * v5++), (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  char v7 = a2;
  v5;
  px_dispatch_on_main_queue();
}

void __74__PXFileBackedAssetAddToLibraryActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _completeSaveWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

@end