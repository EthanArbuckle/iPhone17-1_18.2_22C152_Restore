@interface PHAssetCollection
@end

@implementation PHAssetCollection

void __65__PHAssetCollection_PhotosUICore__px_mediaTypeSmartAlbumSubtypes__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)px_mediaTypeSmartAlbumSubtypes_subtypes;
  px_mediaTypeSmartAlbumSubtypes_subtypes = (uint64_t)&unk_1F02D53F8;

  v1 = PLUserSmartAlbumGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543618;
    id v4 = (id)objc_opt_class();
    __int16 v5 = 2112;
    v6 = &unk_1F02D53F8;
    id v2 = v4;
    _os_log_impl(&dword_1A9AE7000, v1, OS_LOG_TYPE_DEFAULT, "<%{public}@> Media Smart Albums Subtypes to Fetch: %@", (uint8_t *)&v3, 0x16u);
  }
}

uint64_t __90__PHAssetCollection_PhotosUICore__px_fetchAssetCollectionsWithAlbumSubtypes_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __57__PHAssetCollection_PhotosUICore__px_otherAlbumsSubtypes__block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v0 = (void *)px_otherAlbumsSubtypes_subtypes;
  px_otherAlbumsSubtypes_subtypes = (uint64_t)&unk_1F02D5410;

  if (_os_feature_enabled_impl())
  {
    uint64_t v1 = [&unk_1F02D5428 arrayByAddingObjectsFromArray:px_otherAlbumsSubtypes_subtypes];
    id v2 = (void *)px_otherAlbumsSubtypes_subtypes;
    px_otherAlbumsSubtypes_subtypes = v1;
  }
  uint64_t v3 = [&unk_1F02D5440 arrayByAddingObjectsFromArray:px_otherAlbumsSubtypes_subtypes];
  id v4 = (void *)px_otherAlbumsSubtypes_subtypes;
  px_otherAlbumsSubtypes_subtypes = v3;

  __int16 v5 = +[PXCuratedLibrarySettings sharedInstance];
  int v6 = [v5 enableRecentlyEditedAlbum];

  if (v6)
  {
    uint64_t v7 = [&unk_1F02D5458 arrayByAddingObjectsFromArray:px_otherAlbumsSubtypes_subtypes];
    v8 = (void *)px_otherAlbumsSubtypes_subtypes;
    px_otherAlbumsSubtypes_subtypes = v7;
  }
  v9 = PLUserSmartAlbumGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2112;
    uint64_t v14 = px_otherAlbumsSubtypes_subtypes;
    id v10 = v12;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@> Other Albums Subtypes to Fetch: %@", (uint8_t *)&v11, 0x16u);
  }
}

void __70__PHAssetCollection_PhotosUICore__px_albumNameForTransientIdentifier___block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PXPhotosVirtualCollection";
  v2[1] = @"PXTransientCollectionIdentifierEvents";
  v3[0] = @"library";
  v3[1] = @"event";
  v2[2] = @"PXMemoriesVirtualCollection";
  v2[3] = @"PXTransientCollectionIdentifierTrips";
  v3[2] = @"memory";
  v3[3] = @"trip";
  v2[4] = @"PXPeopleVirtualCollection";
  v2[5] = @"PXCompleteMyMomentVirtualCollection";
  v3[4] = @"people";
  v3[5] = @"icloud-links";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  uint64_t v1 = (void *)px_albumNameForTransientIdentifier__albumNames;
  px_albumNameForTransientIdentifier__albumNames = v0;
}

@end