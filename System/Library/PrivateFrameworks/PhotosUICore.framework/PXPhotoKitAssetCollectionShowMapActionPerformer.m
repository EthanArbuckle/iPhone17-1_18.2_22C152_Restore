@interface PXPhotoKitAssetCollectionShowMapActionPerformer
+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)_effectiveAssetsFetchResultWithAssetsFetchResult:(id)a3 assetCollectionReference:(id)a4 dataSource:(id)a5;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionShowMapActionPerformer

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeShowMap" systemImageName:a5];
}

+ (id)_effectiveAssetsFetchResultWithAssetsFetchResult:(id)a3 assetCollectionReference:(id)a4 dataSource:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v9;
  v12 = v11;
  if (v11) {
    goto LABEL_2;
  }
  memset(v25, 0, sizeof(v25));
  v14 = [v10 assetCollectionReferenceForAssetCollectionReference:a4];
  v15 = v14;
  if (v14) {
    [v14 indexPath];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }

  if (*(void *)&v25[0] != *(void *)off_1E5DAAED8
    && *((void *)&v25[0] + 1) != 0x7FFFFFFFFFFFFFFFLL
    && *(void *)&v25[1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v24[0] = v25[0];
    v24[1] = v25[1];
    uint64_t v18 = [v10 uncuratedAssetsInSectionIndexPath:v24];
    if (v18)
    {
      v12 = (void *)v18;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_2;
      }
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      v22 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v19 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionShowMapActionPerformer.m", 103, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[assetsDataSource uncuratedAssetsInSectionIndexPath:indexPath]", v21, v22 object file lineNumber description];
      goto LABEL_23;
    }
  }
  if ([v10 numberOfSections] != 1)
  {
    v12 = 0;
    goto LABEL_2;
  }
  *(void *)&v25[0] = [v10 identifier];
  *(_OWORD *)((char *)v25 + 8) = xmmword_1AB359AA0;
  *((void *)&v25[1] + 1) = 0x7FFFFFFFFFFFFFFFLL;
  v12 = [v10 uncuratedAssetsInSectionIndexPath:v25];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v23);
      v22 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v19 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionShowMapActionPerformer.m", 108, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[assetsDataSource uncuratedAssetsInSectionIndexPath:indexPath]", v21, v22 object file lineNumber description];
LABEL_23:
    }
  }
LABEL_2:

  return v12;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"map";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"PXPhotosGridsShowMap", @"PhotosUICore");
}

+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    v12 = [v10 assetCollection];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        uint64_t v13 = [v12 assetCollectionSubtype];

        BOOL v14 = 0;
        if (v13 == 101 || v13 == 205 || v13 == 1000000201) {
          goto LABEL_13;
        }
        goto LABEL_7;
      }
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v31);
      v32 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v28 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionShowMapActionPerformer.m", 50, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v30, v32 object file lineNumber description];
    }
    else
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      [v28 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionShowMapActionPerformer.m", 50, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v30 object file lineNumber description];
    }

    goto LABEL_4;
  }
LABEL_7:
  v15 = [v11 assetsFetchResult];
  v16 = [v11 assetsDataSource];
  v17 = [a1 _effectiveAssetsFetchResultWithAssetsFetchResult:v15 assetCollectionReference:v10 dataSource:v16];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v18 = [v17 count];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __110__PXPhotoKitAssetCollectionShowMapActionPerformer_canPerformActionType_onAssetCollectionReference_withInputs___block_invoke;
  v33[3] = &unk_1E5DBA4B8;
  v33[4] = &v34;
  v33[5] = v18;
  [v17 enumerateObjectsWithOptions:2 usingBlock:v33];
  if (*((unsigned char *)v35 + 24))
  {
    BOOL v14 = 1;
  }
  else
  {
    v19 = [v17 fetchedObjectIDs];
    if ([v19 count])
    {
      v20 = (void *)MEMORY[0x1E4F390A0];
      v21 = [v17 photoLibrary];
      v22 = [v17 firstObject];
      v23 = [v20 fetchOptionsWithPhotoLibrary:v21 orObject:v22];

      [v23 setFetchLimit:1];
      v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in (%@) AND additionalAttributes.locationHash != 0", v19];
      [v23 setInternalPredicate:v24];

      [v23 setInternalSortDescriptors:MEMORY[0x1E4F1CBF0]];
      v25 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v23];
      BOOL v26 = [v25 count] != 0;
      *((unsigned char *)v35 + 24) = v26;
    }
    BOOL v14 = *((unsigned char *)v35 + 24) != 0;
  }
  _Block_object_dispose(&v34, 8);

LABEL_13:
  return v14;
}

void __110__PXPhotoKitAssetCollectionShowMapActionPerformer_canPerformActionType_onAssetCollectionReference_withInputs___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = [a2 location];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7 != 0;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || (unint64_t)(*(void *)(a1 + 40) - a3) >= 0xC9)
  {
    *a4 = 1;
  }
}

- (void)performUserInteractionTask
{
  v4 = objc_opt_class();
  v5 = [(PXAssetCollectionActionPerformer *)self assetsFetchResult];
  v6 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  v7 = [(PXAssetCollectionActionPerformer *)self assetsDataSource];
  id v18 = [v4 _effectiveAssetsFetchResultWithAssetsFetchResult:v5 assetCollectionReference:v6 dataSource:v7];

  v8 = v18;
  if (!v18)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionShowMapActionPerformer.m", 136, @"Invalid parameter not satisfying: %@", @"assetsFetchResult" object file lineNumber description];

    v8 = 0;
  }
  id v9 = [v8 photoLibrary];
  id v10 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v18 subtype:0x7FFFFFFFFFFFFFFFLL];
  id v11 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v9];
  v12 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v11];
  BOOL v13 = PXPhotoKitAssetCollectionSupportsNearbyAssetsAffordance(v10);
  uint64_t v14 = [(PXLibraryFilterState *)v12 viewMode];
  v15 = +[PXLemonadeMapView makeViewWithPhotoLibrary:collection:libraryFilterViewMode:initialCenterCoordinate:wantsNearbyAssetsAffordance:enableGridView:](_TtC12PhotosUICore17PXLemonadeMapView, "makeViewWithPhotoLibrary:collection:libraryFilterViewMode:initialCenterCoordinate:wantsNearbyAssetsAffordance:enableGridView:", v9, v10, v14, v13, 1, *MEMORY[0x1E4F1E750], *(double *)(MEMORY[0x1E4F1E750] + 8));
  if ([(PXActionPerformer *)self presentViewController:v15])
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present mapViewController");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v16];
  }
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  v6 = objc_msgSend(a4, "activityType", a3);
  v7 = [(PXPhotoKitAssetCollectionShowMapActionPerformer *)self activityType];

  if (v6 != v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionShowMapActionPerformer.m", 130, @"Invalid parameter not satisfying: %@", @"activity.activityType == self.activityType" object file lineNumber description];
  }
  return 1;
}

- (id)activityType
{
  v2 = @"PXActivityTypeShowMap";
  return @"PXActivityTypeShowMap";
}

- (id)activitySystemImageName
{
  return @"map";
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v5 = objc_opt_class();
  v6 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  v7 = [v5 localizedTitleForUseCase:a3 assetCollectionReference:v6 withInputs:0];

  return v7;
}

@end