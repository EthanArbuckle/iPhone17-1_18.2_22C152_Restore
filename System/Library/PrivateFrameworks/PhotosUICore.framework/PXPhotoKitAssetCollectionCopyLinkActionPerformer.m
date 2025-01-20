@interface PXPhotoKitAssetCollectionCopyLinkActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitAssetCollectionCopyLinkActionPerformer

- (void)performBackgroundTask
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2147, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2147, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v12 object file lineNumber description];
  }

LABEL_3:
  v5 = [v4 shareURL];
  v6 = PLSharingGetLog();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v5, "pl_redactedShareURL");
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Copy Link Action: Copying moment share URL: %{public}@", buf, 0xCu);
    }
    PXCopyURL(v5);
    v9 = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Copy Link Action: No URL to copy for moment share %@", buf, 0xCu);
    }

    v9 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1004, @"Missing URL for moment share: %@", v4);
  }
  [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:v5 != 0 error:v9];
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeCopyExistingLink" systemImageName:@"link.icloud"];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"link.icloud";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"PXCompleteMyMomentCopyLinkActionMenuTitle", @"PhotosUICore");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v6 = [a3 assetCollection];
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2126, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v11 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2126, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v11, v13 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  BOOL v7 = [v6 assetCollectionType] == 7;

  return v7;
}

@end