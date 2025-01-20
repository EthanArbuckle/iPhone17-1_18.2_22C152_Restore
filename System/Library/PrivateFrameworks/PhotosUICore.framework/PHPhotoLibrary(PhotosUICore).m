@interface PHPhotoLibrary(PhotosUICore)
+ (id)px_appPhotoLibrary;
+ (id)px_appPhotoLibraryForTesting;
+ (id)px_momentShareWithLocalIdentifier:()PhotosUICore;
+ (id)px_systemPhotoLibrary;
+ (id)px_transientIdentifierForWellKnownAssetCollectionName:()PhotosUICore;
+ (void)px_setAppPhotoLibraryForTesting:()PhotosUICore;
- (BOOL)px_fetchHasNoVisibleAssets;
- (BOOL)px_fetchHasSignificantRegularAlbumCount;
- (BOOL)px_fetchHasSignificantSharedAlbumActivities;
- (PXPhotoLibraryChangeDistributor)px_changeDistributor;
- (id)px_assetCollectionForSmartAlbumWithSubtype:()PhotosUICore;
- (id)px_assetCollectionWithLocalIdentifier:()PhotosUICore;
- (id)px_assetCollectionWithTransientIdentifier:()PhotosUICore;
- (id)px_beginPausingChangesWithTimeout:()PhotosUICore identifier:;
- (id)px_collectionListWithLocalIdentifier:()PhotosUICore;
- (id)px_collectionListWithTransientIdentifier:()PhotosUICore;
- (id)px_fetchAssetForSuggestionWithLocalIdentifier:()PhotosUICore;
- (id)px_fetchObjectWithLocalIdentifier:()PhotosUICore;
- (id)px_fetchObjectsWithLocalIdentifiers:()PhotosUICore wantsDefaultPredicates:;
- (id)px_localDefaults;
- (id)px_memoryWithLocalIdentifier:()PhotosUICore;
- (id)px_rootAlbumCollectionList;
- (id)px_utilityCollectionWithType:()PhotosUICore;
- (id)px_virtualCollections;
- (uint64_t)px_areChangesPaused;
- (uint64_t)px_peoplePetsHomeVisibility;
- (void)px_endPausingChanges:()PhotosUICore;
- (void)px_registerChangeObserver:()PhotosUICore;
- (void)px_unregisterChangeObserver:()PhotosUICore;
@end

@implementation PHPhotoLibrary(PhotosUICore)

- (void)px_registerChangeObserver:()PhotosUICore
{
  id v4 = a3;
  objc_msgSend(a1, "px_changeDistributor");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 registerChangeObserver:v4];
}

- (PXPhotoLibraryChangeDistributor)px_changeDistributor
{
  id v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, &ChangeDistributorKey);
  v2 = (PXPhotoLibraryChangeDistributor *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = [[PXPhotoLibraryChangeDistributor alloc] initWithPhotoLibrary:v1];
    objc_setAssociatedObject(v1, &ChangeDistributorKey, v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  return v2;
}

- (id)px_localDefaults
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = objc_getAssociatedObject(v1, &DefaultsManagerKey);
  if (!v2)
  {
    id v3 = objc_initWeak(&location, v1);

    id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__PHPhotoLibrary_PhotosUICore__px_localDefaults__block_invoke;
    v7[3] = &unk_1E5DC9F50;
    objc_copyWeak(&v8, &location);
    v2 = (void *)[v4 initWithRetriableBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    objc_setAssociatedObject(v1, &DefaultsManagerKey, v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  id v5 = [v2 objectValue];

  return v5;
}

- (id)px_virtualCollections
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = objc_getAssociatedObject(v1, &UICollectionsKey);
  if (!v2)
  {
    id v3 = objc_initWeak(&location, v1);

    id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__PHPhotoLibrary_PhotosUICore__px_virtualCollections__block_invoke;
    v7[3] = &unk_1E5DC9F50;
    objc_copyWeak(&v8, &location);
    v2 = (void *)[v4 initWithRetriableBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    objc_setAssociatedObject(v1, &UICollectionsKey, v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  id v5 = [v2 objectValue];

  return v5;
}

- (void)px_unregisterChangeObserver:()PhotosUICore
{
  id v4 = a3;
  objc_msgSend(a1, "px_changeDistributor");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 unregisterChangeObserver:v4];
}

+ (id)px_appPhotoLibrary
{
  if (PFProcessIsLaunchedToExecuteTests() && PLIsSystemLibraryAccessProhibited())
  {
    id v4 = objc_msgSend(a1, "px_appPhotoLibraryForTesting");
    if (!v4)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:a1 file:@"PHPhotoLibrary+PhotosUICore.m" lineNumber:302 description:@"Tests that depend on photo library singletons must provide an 'px_appPhotoLibraryForTesting'"];

      abort();
    }
  }
  else
  {
    if (px_appPhotoLibrary_onceToken != -1) {
      dispatch_once(&px_appPhotoLibrary_onceToken, &__block_literal_global_179808);
    }
    if (px_appPhotoLibrary_appProvidesPhotoLibrary
      && ([MEMORY[0x1E4FB1438] sharedApplication],
          (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = v6;
      id v4 = objc_msgSend(v6, "px_photoLibrary");
    }
    else if ([MEMORY[0x1E4F39228] isMultiLibraryModeEnabled])
    {
      id v8 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_FAULT, "multi-library mode enabled, cannot provide the +sharedPhotoLibrary (may cause photos functionality to silently fail)", v10, 2u);
      }

      id v4 = 0;
    }
    else
    {
      id v4 = [MEMORY[0x1E4F39228] sharedPhotoLibrary];
    }
  }
  return v4;
}

- (uint64_t)px_peoplePetsHomeVisibility
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = objc_getAssociatedObject(v1, &PeoplePetsHomeVisibilitySourceKey);
  if (!v2)
  {
    id v3 = objc_initWeak(&location, v1);

    id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__PHPhotoLibrary_PhotosUICore__px_peoplePetsHomeVisibility__block_invoke;
    v8[3] = &unk_1E5DC9F50;
    objc_copyWeak(&v9, &location);
    v2 = (void *)[v4 initWithRetriableBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    objc_setAssociatedObject(v1, &PeoplePetsHomeVisibilitySourceKey, v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  id v5 = [v2 objectValue];
  uint64_t v6 = [v5 visibility];

  return v6;
}

- (id)px_beginPausingChangesWithTimeout:()PhotosUICore identifier:
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "px_changeDistributor");
  id v8 = [v7 beginPausingChangesWithTimeout:v6 identifier:a2];

  return v8;
}

- (id)px_rootAlbumCollectionList
{
  id v3 = a1;
  objc_sync_enter(v3);
  id v4 = objc_getAssociatedObject(v3, sel_px_rootAlbumCollectionList);
  if (!v4)
  {
    id v5 = [v3 librarySpecificFetchOptions];
    id v6 = objc_initWeak(&location, v3);

    id v7 = objc_alloc(MEMORY[0x1E4F8B948]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__PHPhotoLibrary_PhotosUICore__px_rootAlbumCollectionList__block_invoke;
    v12[3] = &unk_1E5DC25A0;
    objc_copyWeak(&v14, &location);
    id v8 = v5;
    id v13 = v8;
    id v4 = (void *)[v7 initWithRetriableBlock:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    objc_setAssociatedObject(v3, sel_px_rootAlbumCollectionList, v4, (void *)0x301);
    if (!v4)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:v3 file:@"PHPhotoLibrary+PhotosUICore.m" lineNumber:647 description:@"Root Collection List not available"];
    }
  }
  objc_sync_exit(v3);

  v10 = [v4 objectValue];

  return v10;
}

- (id)px_collectionListWithLocalIdentifier:()PhotosUICore
{
  id v4 = a3;
  id v5 = [a1 librarySpecificFetchOptions];
  id v6 = (void *)MEMORY[0x1E4F39008];
  id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, 0);

  id v8 = [v6 fetchCollectionListsWithLocalIdentifiers:v7 options:v5];

  id v9 = [v8 firstObject];

  return v9;
}

- (id)px_collectionListWithTransientIdentifier:()PhotosUICore
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "px_virtualCollections");
  v14[0] = @"PXMyAlbumsVirtualCollection";
  id v6 = [v5 rootAlbumCollectionList];
  v15[0] = v6;
  v14[1] = @"PXSharedAlbumsVirtualCollection";
  id v7 = [v5 sharedAlbumsCollectionList];
  v15[1] = v7;
  v14[2] = @"PXSharedAlbumsAndActivityVirtualCollection";
  id v8 = [v5 sharedAlbumsCollectionList];
  v15[2] = v8;
  v14[3] = @"PXMediaTypesVirtualCollection";
  id v9 = [v5 mediaTypesCollectionList];
  v15[3] = v9;
  v14[4] = @"PXTransientCollectionIdentifierUtilities";
  v10 = [v5 utilitiesCollectionList];
  v15[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

  v12 = [v11 objectForKeyedSubscript:v4];

  return v12;
}

- (id)px_assetCollectionWithTransientIdentifier:()PhotosUICore
{
  v27[17] = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v4 = objc_msgSend(a1, "px_virtualCollections");
  v26[0] = @"PXMomentsVirtualCollection";
  v24 = [v4 momentsCollection];
  v27[0] = v24;
  v26[1] = @"PXPhotosVirtualCollection";
  v23 = [v4 photosCollection];
  v27[1] = v23;
  v26[2] = @"PXPeopleVirtualCollection";
  v22 = [v4 peopleCollection];
  v27[2] = v22;
  v26[3] = @"PXTransientCollectionIdentifierMap";
  v21 = [v4 mapCollection];
  v27[3] = v21;
  v26[4] = @"PXTransientCollectionIdentifierFeatured";
  v20 = [v4 featuredCollection];
  v27[4] = v20;
  v26[5] = @"PXTransientCollectionIdentifierEvents";
  v19 = [v4 eventsCollection];
  v27[5] = v19;
  v26[6] = @"PXTransientCollectionIdentifierTrips";
  v18 = [v4 tripsCollection];
  v27[6] = v18;
  v26[7] = @"PXTransientCollectionIdentifierUtilities";
  v17 = [v4 utilitiesCollectionList];
  v27[7] = v17;
  v26[8] = @"PXMemoriesVirtualCollection";
  v16 = [v4 memoriesCollection];
  v27[8] = v16;
  v26[9] = @"PXCompleteMyMomentVirtualCollection";
  id v5 = [v4 completeMyMomentCollection];
  v27[9] = v5;
  v26[10] = @"PXImportHistoryVirtualCollection";
  id v6 = [v4 importHistoryCollection];
  v27[10] = v6;
  v26[11] = @"PXSharedActivityVirtualCollection";
  id v7 = [v4 sharedActivityCollection];
  v27[11] = v7;
  v26[12] = @"PXContentSyndicationVirtualCollection";
  id v8 = [v4 contentSyndicationCollection];
  v27[12] = v8;
  v26[13] = @"PXFeaturedPhotosVirtualCollection";
  id v9 = [v4 featuredPhotosCollection];
  v27[13] = v9;
  v26[14] = @"PXRecentlyViewedVirtualCollection";
  v10 = [v4 recentlyViewedCollection];
  v27[14] = v10;
  v26[15] = @"PXRecentlyEditedVirtualCollection";
  v11 = [v4 recentlyEditedCollection];
  v27[15] = v11;
  v26[16] = @"PXRecentlySharedVirtualCollection";
  v12 = [v4 recentlySharedCollection];
  v27[16] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:17];

  id v14 = [v13 objectForKeyedSubscript:v25];

  return v14;
}

- (id)px_memoryWithLocalIdentifier:()PhotosUICore
{
  id v4 = a3;
  id v5 = [a1 librarySpecificFetchOptions];
  [v5 setIncludePendingMemories:1];
  [v5 setIncludeLocalMemories:1];
  [v5 setIncludeStoryMemories:1];
  id v6 = (void *)MEMORY[0x1E4F39160];
  id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, 0);

  id v8 = [v6 fetchAssetCollectionsWithLocalIdentifiers:v7 options:v5];

  id v9 = [v8 firstObject];

  return v9;
}

- (id)px_assetCollectionWithLocalIdentifier:()PhotosUICore
{
  id v4 = a3;
  id v5 = [a1 librarySpecificFetchOptions];
  [v5 setIncludePlacesSmartAlbum:1];
  [v5 setIncludeDuplicatesAlbums:1];
  [v5 setIncludeUserSmartAlbums:1];
  [v5 setIncludeAllPhotosSmartAlbum:1];
  [v5 setIncludeRecentlyEditedSmartAlbum:1];
  [v5 setIncludeScreenRecordingsSmartAlbum:1];
  [v5 setIncludeSharedLibrarySharingSuggestionsSmartAlbum:1];
  [v5 setIncludeProResSmartAlbum:1];
  [v5 setIncludePendingMemories:1];
  [v5 setIncludeLocalMemories:1];
  [v5 setIncludeStoryMemories:1];
  id v6 = (void *)MEMORY[0x1E4F38EE8];
  id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, 0);

  id v8 = [v6 fetchAssetCollectionsWithLocalIdentifiers:v7 options:v5];

  id v9 = [v8 firstObject];

  return v9;
}

- (id)px_utilityCollectionWithType:()PhotosUICore
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 librarySpecificFetchOptions];
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v4 setInternalSortDescriptors:v6];

  id v7 = [MEMORY[0x1E4F38EE8] fetchUtilityCollectionsWithType:a3 options:v4];
  id v8 = [v7 firstObject];

  return v8;
}

- (id)px_assetCollectionForSmartAlbumWithSubtype:()PhotosUICore
{
  if (a3 <= 200)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PHPhotoLibrary+PhotosUICore.m", 533, @"Invalid parameter not satisfying: %@", @"subtype > PHAssetCollectionSubtypeSmartAlbumGeneric" object file lineNumber description];
  }
  id v5 = [a1 librarySpecificFetchOptions];
  [v5 setIncludePlacesSmartAlbum:a3 == 1000000203];
  [v5 setIncludeUserSmartAlbums:a3 == 1000000204];
  [v5 setIncludeAllPhotosSmartAlbum:a3 == 1000000205];
  [v5 setIncludeRecentlyEditedSmartAlbum:a3 == 1000000206];
  [v5 setIncludeScreenRecordingsSmartAlbum:a3 == 1000000207];
  [v5 setIncludeSharedLibrarySharingSuggestionsSmartAlbum:a3 == 1000000214];
  [v5 setIncludeProResSmartAlbum:a3 == 1000000211];
  [v5 setIncludeDuplicatesAlbums:a3 == 1000000212];
  id v6 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:a3 options:v5];
  id v7 = [v6 firstObject];

  return v7;
}

- (id)px_fetchAssetForSuggestionWithLocalIdentifier:()PhotosUICore
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 librarySpecificFetchOptions];
  [v5 setIncludeGuestAssets:1];
  id v6 = (void *)MEMORY[0x1E4F38EE8];
  v17[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v8 = [v6 fetchAssetCollectionsWithLocalIdentifiers:v7 options:v5];
  id v9 = [v8 firstObject];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v9 options:v5];
    v11 = [v10 firstObject];
  }
  else
  {
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v13 = 138412546;
      id v14 = v4;
      __int16 v15 = 2080;
      v16 = "-[PHPhotoLibrary(PhotosUICore) px_fetchAssetForSuggestionWithLocalIdentifier:]";
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_FAULT, "Failed to fetch suggestion by localIdentifier: %@, %s", (uint8_t *)&v13, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)px_fetchObjectWithLocalIdentifier:()PhotosUICore
{
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:0];
  id v3 = objc_msgSend(a1, "px_fetchObjectsWithLocalIdentifiers:wantsDefaultPredicates:", v2, 0);
  id v4 = [v3 firstObject];

  return v4;
}

- (id)px_fetchObjectsWithLocalIdentifiers:()PhotosUICore wantsDefaultPredicates:
{
  id v6 = a3;
  id v7 = [v6 firstObject];
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F39150] emptyFetchResultWithPhotoLibrary:a1];
    goto LABEL_20;
  }
  id v8 = [MEMORY[0x1E4F391D0] identifierCodeFromLocalIdentifier:v7];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F39228] fetchTypeForLocalIdentifierCode:v8];
  }
  else
  {
    id v9 = 0;
  }
  v11 = [a1 librarySpecificFetchOptions];
  [v11 setIsExclusivePredicate:a4 ^ 1u];
  if ([v9 isEqualToString:*MEMORY[0x1E4F39670]])
  {
    v12 = [MEMORY[0x1E4F39248] queryForType:v9 withIdentifiers:v6 identifierKeyPath:@"personUUID" options:v11];
  }
  else
  {
    if (!v9)
    {
LABEL_18:
      v10 = 0;
      goto LABEL_19;
    }
    if ([v9 isEqualToString:*MEMORY[0x1E4F39648]])
    {
      [v11 setIncludeGuestAssets:1];
    }
    else if ([v9 isEqualToString:*MEMORY[0x1E4F39668]])
    {
      [v11 setIncludePendingMemories:1];
      [v11 setIncludeRejectedMemories:1];
      [v11 setIncludeLocalMemories:1];
      [v11 setIncludeStoryMemories:1];
    }
    else if ([v9 isEqualToString:*MEMORY[0x1E4F39650]])
    {
      [v11 setIncludePlacesSmartAlbum:1];
      [v11 setIncludeDuplicatesAlbums:1];
      [v11 setIncludeUserSmartAlbums:1];
      [v11 setIncludeAllPhotosSmartAlbum:1];
      [v11 setIncludeRecentlyEditedSmartAlbum:1];
      [v11 setIncludeScreenRecordingsSmartAlbum:1];
      [v11 setIncludeSharedLibrarySharingSuggestionsSmartAlbum:1];
      [v11 setIncludeProResSmartAlbum:1];
    }
    v12 = [MEMORY[0x1E4F39248] queryForType:v9 withLocalIdentifiers:v6 options:v11];
  }
  int v13 = v12;
  if (!v12) {
    goto LABEL_18;
  }
  v10 = [v12 executeQuery];

LABEL_19:
LABEL_20:

  return v10;
}

- (BOOL)px_fetchHasSignificantSharedAlbumActivities
{
  v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-7776000.0];
  id v3 = [a1 librarySpecificFetchOptions];
  [v3 setFetchLimit:6];
  unint64_t v4 = +[PXSharedAlbumsActivityEntry fetchCountOfRecentFeedActivitiesWithOptions:v3 newerThanDate:v2];
  BOOL v5 = v4 == [v3 fetchLimit];

  return v5;
}

- (BOOL)px_fetchHasSignificantRegularAlbumCount
{
  v17[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F8B298];
  v17[0] = *MEMORY[0x1E4F8AE30];
  v17[1] = v2;
  void v17[2] = *MEMORY[0x1E4F8B2B0];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  unint64_t v4 = [a1 librarySpecificFetchOptions];
  [v4 setWantsIncrementalChangeDetails:0];
  [v4 setFetchLimit:10];
  BOOL v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"importedByBundleIdentifier in %@", v3];
  [v4 setInternalPredicate:v5];

  id v6 = PLUIGetLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  id v8 = v6;
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HasSignificantRegularAlbumCount", "", buf, 2u);
  }

  v10 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:1 subtype:2 options:v4];
  v11 = v9;
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_END, v7, "HasSignificantRegularAlbumCount", "", buf, 2u);
  }

  uint64_t v13 = [v10 count];
  BOOL v14 = v13 == [v4 fetchLimit];

  return v14;
}

- (BOOL)px_fetchHasNoVisibleAssets
{
  id v1 = [a1 librarySpecificFetchOptions];
  [v1 setWantsIncrementalChangeDetails:0];
  [v1 setShouldPrefetchCount:1];
  [v1 setFetchLimit:1];
  uint64_t v2 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v1];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (uint64_t)px_areChangesPaused
{
  id v1 = objc_msgSend(a1, "px_changeDistributor");
  uint64_t v2 = [v1 areChangesPaused];

  return v2;
}

- (void)px_endPausingChanges:()PhotosUICore
{
  id v4 = a3;
  objc_msgSend(a1, "px_changeDistributor");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 endPausingChanges:v4];
}

+ (id)px_transientIdentifierForWellKnownAssetCollectionName:()PhotosUICore
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"import-history";
  v8[1] = @"shared-with-you";
  v9[0] = @"PXImportHistoryVirtualCollection";
  v9[1] = @"PXContentSyndicationVirtualCollection";
  BOOL v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v3 dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)px_momentShareWithLocalIdentifier:()PhotosUICore
{
  id v4 = a3;
  id v5 = [a1 sharedMomentSharePhotoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];
  os_signpost_id_t v7 = (void *)MEMORY[0x1E4F391B0];
  id v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, 0);

  id v9 = [v7 fetchAssetCollectionsWithLocalIdentifiers:v8 options:v6];

  v10 = [v9 firstObject];

  return v10;
}

+ (void)px_setAppPhotoLibraryForTesting:()PhotosUICore
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"PHPhotoLibrary+PhotosUICore.m" lineNumber:343 description:@"The 'px_appPhotoLibraryForTesting' property is only available when testing"];
  }
  id WeakRetained = objc_loadWeakRetained(&_appPhotoLibraryForTesting);

  os_signpost_id_t v7 = PLUIGetLog();
  id v8 = v7;
  if (!v5)
  {
    if (WeakRetained)
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      id v9 = objc_loadWeakRetained(&_appPhotoLibraryForTesting);
      int v15 = 138412290;
      id v16 = v9;
      v10 = "Clear app photo library for testing: %@";
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      id v9 = objc_loadWeakRetained(&_appPhotoLibraryForTesting);
      int v15 = 138412290;
      id v16 = v9;
      v10 = "Clear app photo library for testing: %@ (none existing)";
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    }
    uint32_t v13 = 12;
    goto LABEL_15;
  }
  if (WeakRetained)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_loadWeakRetained(&_appPhotoLibraryForTesting);
      int v15 = 138412546;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v9;
      v10 = "Set app photo library for testing: %@ (nuking existing: %@)";
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
LABEL_15:
      _os_log_impl(&dword_1A9AE7000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Set app photo library for testing: %@", (uint8_t *)&v15, 0xCu);
  }
LABEL_16:

  objc_storeWeak(&_appPhotoLibraryForTesting, v5);
}

+ (id)px_appPhotoLibraryForTesting
{
  id WeakRetained = objc_loadWeakRetained(&_appPhotoLibraryForTesting);
  return WeakRetained;
}

+ (id)px_systemPhotoLibrary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend((id)objc_opt_class(), "px_deprecated_appPhotoLibrary");
  if (([v0 isSystemPhotoLibrary] & 1) == 0)
  {
    id v1 = objc_alloc(MEMORY[0x1E4F39228]);
    uint64_t v2 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
    BOOL v3 = (void *)[v1 initWithPhotoLibraryURL:v2];

    id v7 = 0;
    LOBYTE(v2) = [v3 openAndWaitWithUpgrade:0 error:&v7];
    id v4 = v7;
    if ((v2 & 1) == 0)
    {
      id v5 = PLUIGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Unable to open photo library: %@", buf, 0xCu);
      }
    }
    v0 = v3;
  }
  return v0;
}

@end