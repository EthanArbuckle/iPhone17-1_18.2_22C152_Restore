@interface PXPhotoKitAssetCollectionShareActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionShareActionPerformer

- (void)performUserInteractionTask
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v34);
    v35 = objc_msgSend(v3, "px_descriptionForAssertionMessage");
    [v27 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1948, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v29, v35 object file lineNumber description];
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    [v27 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1948, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v29 object file lineNumber description];
  }

LABEL_3:
  int v4 = objc_msgSend(v3, "px_wantsCurationByDefault");
  if (v4) {
    uint64_t v5 = 80;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = [[PXPhotosDataSourceConfiguration alloc] initWithAssetCollection:v3 options:v5];
  v7 = v6;
  if (v4)
  {
    [(PXPhotosDataSourceConfiguration *)v6 setCurationKind:1];
    [(PXPhotosDataSourceConfiguration *)v7 setWantsCurationByDefault:1];
    v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v3 localizedTitle];
      v10 = [v3 localIdentifier];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412802;
      v47 = v9;
      __int16 v48 = 2114;
      v49 = v10;
      __int16 v50 = 2112;
      v51 = v12;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXPhotoKitAssetCollectionShareActionPerformer: Asset collection \"%@\" (UUID: %{public}@) is curated by default (type: %@), so bringing up share sheet with only curated assets", buf, 0x20u);
    }
  }
  v13 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v7];
  v14 = [(PXActionPerformer *)self hostViewController];
  v15 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  v16 = [v15 keyAssetReference];
  v17 = [v16 asset];

  v43 = v13;
  v18 = [[PXActivitySharingContext alloc] initWithAssetCollection:v3 photosDataSource:v13];
  [(PXActivitySharingContext *)v18 setKeyAsset:v17];
  [(PXActivitySharingContext *)v18 setSourceOrigin:3];
  v45[0] = @"com.apple.Photos.activity.SlideShow";
  v45[1] = @"PUActivityTypeEditDateTime";
  v45[2] = @"PUActivityTypeEditLocation";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  [(PXActivitySharingContext *)v18 setExcludedActivityTypes:v19];

  v20 = [(PXActivitySharingContext *)v18 excludedActivityTypes];
  v44[0] = @"PUActivityTypeHide";
  v44[1] = @"PUActivityTypeDuplicate";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  v22 = [v20 arrayByAddingObjectsFromArray:v21];
  [(PXActivitySharingContext *)v18 setExcludedActivityTypes:v22];

  v23 = objc_msgSend(v14, "px_sharePresentation");
  if (!v23)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1979, @"Invalid parameter not satisfying: %@", @"sharePresentation" object file lineNumber description];
  }
  v24 = [v23 createActivitySharingControllerWithContext:v18];
  [v24 selectInitialAssets];
  if (!v24)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1982, @"Invalid parameter not satisfying: %@", @"activitySharingController" object file lineNumber description];
  }
  v25 = [v24 activityViewController];
  if (v25)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_16;
    }
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = (objc_class *)objc_opt_class();
    uint64_t v37 = NSStringFromClass(v36);
    v39 = objc_msgSend(v25, "px_descriptionForAssertionMessage");
    uint64_t v38 = v37;
    v41 = (void *)v37;
    v32 = v40;
    [v40 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1983, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController.activityViewController", v38, v39 object file lineNumber description];
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    v33 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v33);
    [v32 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1983, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController.activityViewController", v41 object file lineNumber description];
  }

LABEL_16:
  if ([(PXActionPerformer *)self presentViewController:v25])
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    v26 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"PXPhotoKitAssetCollectionShareActionPerformer: Failed to present Share Sheet");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v26];
  }
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"square.and.arrow.up";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  uint64_t v5 = NSString;
  if (a3 > 2) {
    v6 = 0;
  }
  else {
    v6 = off_1E5DB8B58[a3];
  }
  v7 = v6;
  v8 = [v5 stringWithFormat:@"PXPhotoKitAssetCollectionActionManager%@Title_Share", v7];

  v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");

  return v9;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v6 = [a3 assetCollection];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 1919, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v14, v16 object file lineNumber description];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 1919, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v14 object file lineNumber description];
  }

LABEL_3:
  if (objc_msgSend(v6, "px_wantsShareAllAction"))
  {
    v7 = [v6 photoLibrary];
    v8 = [v7 librarySpecificFetchOptions];

    [v8 setFetchLimit:1];
    [v8 setWantsIncrementalChangeDetails:0];
    v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v8];
    BOOL v10 = [v9 count] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end