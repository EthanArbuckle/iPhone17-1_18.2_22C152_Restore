@interface PXPhotoKitAssetCollectionShowDetailsActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (int64_t)_originForAssetCollection:(id)a3;
- (id)_displayTitleInfoForDetailsOfAssetCollection:(id)a3 withTitleCategory:(int64_t)a4 preferredAttributesPromise:(id)a5;
- (id)_localizedTitleForAssetCollection:(id)a3 titleCategory:(int64_t *)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionShowDetailsActionPerformer

- (void)performUserInteractionTask
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 photoLibrary];
    uint64_t v6 = [v5 librarySpecificFetchOptions];

    v28 = (void *)v6;
    if ([v4 isTransient])
    {
      v7 = (void *)MEMORY[0x1E4F39008];
      v36[0] = v4;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      v9 = [v7 transientCollectionListWithCollections:v8 title:0];

      uint64_t v10 = [MEMORY[0x1E4F39008] fetchCollectionsInCollectionList:v9 options:v6];
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F38EE8];
      v9 = [v4 localIdentifier];
      v35 = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      uint64_t v10 = [v12 fetchAssetCollectionsWithLocalIdentifiers:v13 options:v6];
    }
    v27 = (void *)v10;
    v14 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v10 options:0];
    [(PXPhotosDataSourceConfiguration *)v14 setHideHiddenAssets:1];
    uint64_t v34 = *MEMORY[0x1E4F39440];
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [(PXPhotosDataSourceConfiguration *)v14 setFetchPropertySets:v15];

    v16 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v14];
    uint64_t v17 = [v4 titleCategory];
    if (v17) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 6;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PXPhotoKitAssetCollectionShowDetailsActionPerformer_performUserInteractionTask__block_invoke;
    aBlock[3] = &unk_1E5DC6F70;
    id v19 = v4;
    id v31 = v19;
    v20 = _Block_copy(aBlock);
    v21 = [(PXPhotoKitAssetCollectionShowDetailsActionPerformer *)self _displayTitleInfoForDetailsOfAssetCollection:v19 withTitleCategory:v18 preferredAttributesPromise:v20];
    v22 = [[PXPhotosDetailsContext alloc] initWithPhotosDataSource:v16 displayTitleInfo:v21 parentContext:0 keyAssetsFetchResult:0];
    uint64_t v23 = [(id)objc_opt_class() _originForAssetCollection:v19];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __81__PXPhotoKitAssetCollectionShowDetailsActionPerformer_performUserInteractionTask__block_invoke_2;
    v29[3] = &__block_descriptor_40_e41_v16__0___PXMutablePhotosDetailsContext__8l;
    v29[4] = v23;
    [(PXPhotosDetailsContext *)v22 performChanges:v29];
    v24 = [[PXPhotosDetailsUIViewController alloc] initWithContext:v22 options:0];
    v25 = PLMemoriesGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v19;
      _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_DEFAULT, "Presenting details view for asset collection %@", buf, 0xCu);
    }

    if ([(PXActionPerformer *)self pushViewController:v24])
    {
      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
    }
    else
    {
      v26 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present details view controller for asset collection %@", v19);
      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v26];
    }
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Attempted to present details view for a nil asset collection from an asset collection action performer");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v11];
  }
}

uint64_t __81__PXPhotoKitAssetCollectionShowDetailsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F39170] preferredAttributesForMemoryCreationFromAssetCollection:*(void *)(a1 + 32) proposedAttributes:a2];
}

uint64_t __81__PXPhotoKitAssetCollectionShowDetailsActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setViewSourceOrigin:*(void *)(a1 + 32)];
}

- (id)_displayTitleInfoForDetailsOfAssetCollection:(id)a3 withTitleCategory:(int64_t)a4 preferredAttributesPromise:(id)a5
{
  int64_t v15 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(PXPhotoKitAssetCollectionShowDetailsActionPerformer *)self _localizedTitleForAssetCollection:v9 titleCategory:&v15];
  v11 = [off_1E5DA7230 defaultHelper];
  v12 = [v11 titleForDisplayableText:v10 titleCategory:v15 options:1];

  v13 = +[PXDisplayTitleInfo displayTitleInfoForDetailsOfAssetCollection:v9 withTitleCategory:a4 defaultTitle:v12 defaultTitleCategory:v15 titleKey:*MEMORY[0x1E4F39778] titleCategoryKey:*MEMORY[0x1E4F39770] defaultSubtitle:0.0 subtitleKey:0 simulatedLoadingDelay:*MEMORY[0x1E4F39768] preferredAttributesPromise:v8];

  return v13;
}

- (id)_localizedTitleForAssetCollection:(id)a3 titleCategory:(int64_t *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 localizedTitle];
  if (![v6 length])
  {
    v7 = [v5 startDate];
    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F8A798]) initWithPreset:2];
      id v9 = [v5 endDate];
      uint64_t v10 = [v8 stringFromDate:v7 toDate:v9];

      if (a4) {
        *a4 = 5;
      }

      uint64_t v6 = (void *)v10;
    }
  }
  return v6;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeShowDetails" systemImageName:a5];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"memories.badge.plus";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"PXPhotosGridShowAsMemoryActionMenuTitle", @"PhotosUICore");
}

+ (int64_t)_originForAssetCollection:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "px_isRegularAlbum"))
  {
    int64_t v4 = 7;
  }
  else if (objc_msgSend(v3, "px_isMoment"))
  {
    int64_t v4 = 8;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 assetsDataSource];
  v7 = v6;
  if (v6) {
    [v6 indexPathForAssetCollectionReference:v5];
  }

  return 0;
}

@end