@interface PXPhotoKitAssetCollectionDebugCurationActionPerformer
+ (BOOL)_isCollectionSupported:(id)a3;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionDebugCurationActionPerformer

- (void)performUserInteractionTask
{
  id v20 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v20;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        v5 = [[PXMemoryDiagnosticsViewController alloc] initWithMemory:v4];
        goto LABEL_9;
      }
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v15);
      v16 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v9 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2517, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v11, v16 object file lineNumber description];
    }
    else
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2517, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v11 object file lineNumber description];
    }

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PXPhotoKitAssetCollectionActionManager.m" lineNumber:2523 description:@"Unexpected collection type"];

    abort();
  }
  id v6 = v20;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2520, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v14 object file lineNumber description];
LABEL_20:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v17);
    v18 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2520, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v14, v18 object file lineNumber description];

    goto LABEL_20;
  }
LABEL_8:
  v5 = [[PXHighlightDiagnosticsViewController alloc] initWithHighlight:v6];
LABEL_9:
  v7 = v5;

  if ([(PXActionPerformer *)self presentViewController:v7])
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"PXPhotoKitAssetCollectionDebugCurationActionPerformer: Failed to present view controller");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v8];
  }
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"book";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return @"Curation Debug";
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6 = [a3 assetCollection];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2501, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2501, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v12 object file lineNumber description];
  }

LABEL_3:
  v7 = +[PXRootSettings sharedInstance];
  if ([v7 canShowInternalUI]) {
    char v8 = [a1 _isCollectionSupported:v6];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)_isCollectionSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end