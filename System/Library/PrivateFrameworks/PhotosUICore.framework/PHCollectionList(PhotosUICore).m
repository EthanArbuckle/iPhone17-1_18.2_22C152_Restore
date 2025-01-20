@interface PHCollectionList(PhotosUICore)
+ (id)_isValidGazeRectPredicate;
+ (id)_otherAlbumAssetCollectionsIncludingRecentlyDeleted:()PhotosUICore includeHidden:includeDuplicates:includingSharedLibrary:includingDebugAlbums:;
+ (id)_otherAlbumsCollectionListWithDeletedCollection:()PhotosUICore withHiddenCollection:withDuplicatesCollection:;
+ (id)px_otherAlbumsCollectionListIncludeDeleted:()PhotosUICore includeHidden:includeDuplicates:;
+ (id)px_transientIdentifierForWellKnownFolderName:()PhotosUICore;
- (BOOL)px_fetchIsEmptyWithOptions:()PhotosUICore;
- (BOOL)px_isProjectsFolder;
- (__CFString)px_navigationURLHost;
- (__CFString)px_navigationWellKnownName;
- (id)px_localizedTitle;
- (uint64_t)px_isAllMacSyncedAlbumsFolder;
- (uint64_t)px_isBookmarksVirtualCollection;
- (uint64_t)px_isContainedInCollectionList:()PhotosUICore;
- (uint64_t)px_isContentSyndicationFolder;
- (uint64_t)px_isFeaturedPhotosCollection;
- (uint64_t)px_isMediaTypesFolder;
- (uint64_t)px_isSharedAlbumsAndActivityFolder;
- (uint64_t)px_isSharedAlbumsFolder;
- (uint64_t)px_isTransientCollectionWithIdentifier:()PhotosUICore;
- (uint64_t)px_isTripsVirtualCollection;
- (uint64_t)px_isUtilitiesFolder;
- (uint64_t)px_isWallpaperSuggestionsVirtualCollection;
@end

@implementation PHCollectionList(PhotosUICore)

- (uint64_t)px_isTransientCollectionWithIdentifier:()PhotosUICore
{
  id v4 = a3;
  if ([a1 isTransient])
  {
    v5 = [a1 transientIdentifier];
    uint64_t v6 = [v5 isEqual:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)px_isContainedInCollectionList:()PhotosUICore
{
  id v4 = a3;
  v5 = [a1 photoLibrary];
  uint64_t v6 = [v5 librarySpecificFetchOptions];

  [v6 setIncludeRootFolder:1];
  id v7 = a1;
  do
  {
    uint64_t v8 = [v7 isEqual:v4];
    if (v8) {
      break;
    }
    v9 = [MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:v7 options:v6];
    uint64_t v10 = [v9 firstObject];

    id v7 = (id)v10;
  }
  while (v10);

  return v8;
}

- (uint64_t)px_isBookmarksVirtualCollection
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXTransientCollectionIdentifierBookmarks"];

  return v2;
}

- (uint64_t)px_isWallpaperSuggestionsVirtualCollection
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXTransientCollectionIdentifierWallpaperSuggestions"];

  return v2;
}

- (uint64_t)px_isFeaturedPhotosCollection
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXFeaturedPhotosVirtualCollection"];

  return v2;
}

- (uint64_t)px_isTripsVirtualCollection
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXTransientCollectionIdentifierTrips"];

  return v2;
}

- (uint64_t)px_isAllMacSyncedAlbumsFolder
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXMacSyncedAlbumsVirtualCollection"];

  return v2;
}

- (uint64_t)px_isContentSyndicationFolder
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXContentSyndicationVirtualCollection"];

  return v2;
}

- (BOOL)px_isProjectsFolder
{
  return [a1 collectionListType] == 2 && objc_msgSend(a1, "collectionListSubtype") == 1000000300;
}

- (uint64_t)px_isUtilitiesFolder
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXTransientCollectionIdentifierUtilities"];

  return v2;
}

- (uint64_t)px_isMediaTypesFolder
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXMediaTypesVirtualCollection"];

  return v2;
}

- (uint64_t)px_isSharedAlbumsAndActivityFolder
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXSharedAlbumsAndActivityVirtualCollection"];

  return v2;
}

- (uint64_t)px_isSharedAlbumsFolder
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXSharedAlbumsVirtualCollection"];

  return v2;
}

- (BOOL)px_fetchIsEmptyWithOptions:()PhotosUICore
{
  id v4 = (void *)[a3 copy];
  [v4 setWantsIncrementalChangeDetails:0];
  [v4 setFetchLimit:1];
  v5 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:a1 options:v4];
  BOOL v6 = [v5 count] == 0;

  return v6;
}

- (__CFString)px_navigationWellKnownName
{
  if (objc_msgSend(a1, "px_isMediaTypesFolder"))
  {
    uint64_t v2 = PXProgrammaticNavigationWellKnownNameMediaTypes;
LABEL_7:
    v3 = *v2;
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "px_isSharedAlbumsAndActivityFolder"))
  {
    uint64_t v2 = PXProgrammaticNavigationWellKnownNameSharedAlbums;
    goto LABEL_7;
  }
  if (objc_msgSend(a1, "px_isTopLevelFolder"))
  {
    uint64_t v2 = PXProgrammaticNavigationWellKnownNameMyAlbums;
    goto LABEL_7;
  }
  v3 = 0;
LABEL_8:
  return v3;
}

- (__CFString)px_navigationURLHost
{
  return @"folder";
}

- (id)px_localizedTitle
{
  if (objc_msgSend(a1, "px_isTopLevelFolder"))
  {
    uint64_t v2 = @"PXCollectionAlbumsTitle";
LABEL_5:
    v3 = PXLocalizedStringFromTable(v2, @"LemonadeLocalizable");
    goto LABEL_7;
  }
  if (objc_msgSend(a1, "px_isProjectsFolder"))
  {
    uint64_t v2 = @"PXCollectionProjectsTitle";
    goto LABEL_5;
  }
  v3 = [a1 localizedTitle];
LABEL_7:
  return v3;
}

+ (id)px_otherAlbumsCollectionListIncludeDeleted:()PhotosUICore includeHidden:includeDuplicates:
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__onceToken != -1) {
    dispatch_once(&px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__onceToken, &__block_literal_global_822);
  }
  id v8 = objc_alloc((Class)off_1E5DA9660);
  v9 = [NSNumber numberWithBool:a3];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", a4, v9);
  v16[1] = v10;
  v11 = [NSNumber numberWithBool:a5];
  v16[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v13 = (void *)[v8 initWithObjects:v12];

  v14 = [(id)px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__otherAlbumsCollectionDictionary objectForKeyedSubscript:v13];
  if (!v14)
  {
    v14 = [(id)objc_opt_class() _otherAlbumsCollectionListWithDeletedCollection:a3 withHiddenCollection:a4 withDuplicatesCollection:a5];
    [(id)px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__otherAlbumsCollectionDictionary setObject:v14 forKeyedSubscript:v13];
  }

  return v14;
}

+ (id)_otherAlbumAssetCollectionsIncludingRecentlyDeleted:()PhotosUICore includeHidden:includeDuplicates:includingSharedLibrary:includingDebugAlbums:
{
  v116[1] = *MEMORY[0x1E4F143B8];
  v12 = objc_opt_new();
  v13 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  if (a7 && PFOSVariantHasInternalUI())
  {
    int v104 = a4;
    v14 = +[PXAlbumsDebugUISettings sharedInstance];
    int v15 = [v14 showUtilitiesDebugAlbum];

    if (v15)
    {
      v16 = [v13 librarySpecificFetchOptions];
      v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(curationScore == 0.25)"];
      [v16 setInternalPredicate:v17];

      v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v116[0] = v18;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:1];
      v20 = int v19 = a3;
      [v16 setSortDescriptors:v20];

      v21 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v16];
      v22 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v21 title:@"Internal - Utilities" identifier:@"PXDebugAlbum"];
      [v12 addObject:v22];

      a3 = v19;
    }
    v23 = +[PXAlbumsDebugUISettings sharedInstance];
    int v24 = [v23 showBestKeyFrameDebugAlbum];

    if (v24)
    {
      v25 = [v13 librarySpecificFetchOptions];
      v26 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(playbackStyle == %d AND videoKeyFrameTimeScale != %d AND mediaAnalysisAttributes.mediaAnalysisVersion >= %llu)", 3, *(unsigned int *)(MEMORY[0x1E4F1F9F8] + 8), 28);
      [v25 setInternalPredicate:v26];

      v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v115 = v27;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
      v29 = int v28 = a3;
      [v25 setSortDescriptors:v29];

      v30 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v25];
      v31 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v30 title:@"Internal - Best Key Frame" identifier:@"PXDebugAlbum"];
      [v12 addObject:v31];

      a3 = v28;
    }
    v32 = +[PXAlbumsDebugUISettings sharedInstance];
    int v33 = [v32 showDreamyDebugAlbum];

    if (v33)
    {
      v34 = [v13 librarySpecificFetchOptions];
      [v34 setIncludeAssetSourceTypes:16];
      v35 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v114 = v35;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
      v37 = int v36 = a3;
      [v34 setSortDescriptors:v37];

      v38 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v34];
      v39 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v38 title:@"Internal - Dreamy" identifier:@"PXDebugAlbum"];
      [v12 addObject:v39];

      a3 = v36;
    }
    v40 = +[PXAlbumsDebugUISettings sharedInstance];
    int v41 = [v40 showGazeDebugAlbum];

    int v102 = a3;
    if (v41)
    {
      v42 = [v13 librarySpecificFetchOptions];
      [v42 setWantsIncrementalChangeDetails:0];
      [v42 setIncludeTorsoAndFaceDetectionData:1];
      [v42 setIncludedDetectionTypes:&unk_1F02D5470];
      v43 = [a1 _isValidGazeRectPredicate];
      [v42 setInternalPredicate:v43];

      v44 = [MEMORY[0x1E4F39050] fetchFacesWithOptions:v42];
      v45 = [v13 librarySpecificFetchOptions];
      v46 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v113 = v46;
      v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1];
      [v45 setSortDescriptors:v47];

      uint64_t v48 = *MEMORY[0x1E4F39538];
      v112[0] = *MEMORY[0x1E4F394E0];
      v112[1] = v48;
      v112[2] = *MEMORY[0x1E4F39458];
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:3];
      [v45 setFetchPropertySets:v49];

      v50 = (void *)MEMORY[0x1E4F38EB8];
      v51 = [v44 fetchedObjects];
      v52 = [v50 fetchAssetsForFaces:v51 options:v45];

      v53 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v52 title:@"Internal - Has Gaze" identifier:@"PXDebugAlbum"];
      [v12 addObject:v53];

      a3 = v102;
    }
    v54 = +[PXAlbumsDebugUISettings sharedInstance];
    int v55 = [v54 showCustomDebugAlbum];

    a4 = v104;
    if (v55)
    {
      v56 = [v13 librarySpecificFetchOptions];
      v57 = +[PXAlbumsDebugUISettings sharedInstance];
      v58 = [v57 customDebugInternalPredicate];
      uint64_t v59 = [v58 length];

      if (v59)
      {
        v60 = (void *)MEMORY[0x1E4F28F60];
        v61 = +[PXAlbumsDebugUISettings sharedInstance];
        v62 = [v61 customDebugInternalPredicate];
        v63 = [v60 predicateWithFormat:v62];
        [v56 setInternalPredicate:v63];
      }
      else
      {
        v64 = +[PXAlbumsDebugUISettings sharedInstance];
        v65 = [v64 customDebugPredicate];
        uint64_t v66 = [v65 length];

        if (!v66)
        {
LABEL_17:
          v68 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
          v111 = v68;
          v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
          [v56 setSortDescriptors:v69];

          v70 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v56];
          v71 = NSString;
          v72 = +[PXAlbumsDebugUISettings sharedInstance];
          v73 = [v72 customDebugAlbumTitle];
          v74 = [v71 stringWithFormat:@"Internal - %@", v73];

          v75 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v70 title:v74 identifier:@"PXDebugAlbum"];
          [v12 addObject:v75];

          a3 = v102;
          a4 = v104;
          goto LABEL_18;
        }
        v67 = (void *)MEMORY[0x1E4F28F60];
        v61 = +[PXAlbumsDebugUISettings sharedInstance];
        v62 = [v61 customDebugPredicate];
        v63 = [v67 predicateWithFormat:v62];
        [v56 setPredicate:v63];
      }

      goto LABEL_17;
    }
  }
LABEL_18:
  if (!a6) {
    goto LABEL_28;
  }
  v76 = +[PXSharedLibrarySettings sharedInstance];
  v77 = +[PXRootSettings sharedInstance];
  if (![v77 canShowInternalUI]) {
    goto LABEL_26;
  }
  int v78 = [v76 showDebugAlbums];

  if (v78)
  {
    int v105 = a4;
    v79 = (void *)MEMORY[0x1E4F39110];
    v80 = [v13 librarySpecificFetchOptions];
    v77 = [v79 fetchActiveLibraryScopeWithOptions:v80];

    v81 = [v77 firstObject];
    v82 = PLUserSmartAlbumGetLog();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      v83 = [v81 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v110 = v83;
      _os_log_impl(&dword_1A9AE7000, v82, OS_LOG_TYPE_DEFAULT, "Suggestions by Photos ablum uses library scope: %@", buf, 0xCu);
    }
    if (v81)
    {
      [v13 librarySpecificFetchOptions];
      v84 = int v103 = a3;
      v85 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v108 = v85;
      v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
      [v84 setSortDescriptors:v86];

      v87 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"libraryScopeShareState", 8388612);
      [v84 setInternalPredicate:v87];

      v88 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v84];
      v89 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v88 title:@"Internal Only - Added by user in Camera" identifier:@"PXSharedLibraryAddedByUserInCameraDebugAlbum"];
      [v12 addObject:v89];

      v90 = [v13 librarySpecificFetchOptions];
      v91 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v107 = v91;
      v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
      [v90 setSortDescriptors:v92];

      v93 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"libraryScopeShareState", 8388616);
      [v90 setInternalPredicate:v93];

      v94 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v90];
      v95 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v94 title:@"Internal Only - Suggestions by Camera" identifier:@"PXSharedLibrarySuggestedByCameraDebugAlbum"];
      [v12 addObject:v95];

      a3 = v103;
    }

    a4 = v105;
LABEL_26:
  }
LABEL_28:
  v96 = objc_msgSend(v13, "px_virtualCollections");
  v97 = [v96 importHistoryCollection];

  [v12 addObject:v97];
  if (a3)
  {
    v98 = objc_msgSend(MEMORY[0x1E4F38EE8], "px_otherAlbumsSubtypes");
  }
  else if (a4)
  {
    v98 = &unk_1F02D5488;
  }
  else
  {
    v98 = 0;
  }
  if ((a5 & 1) == 0)
  {
    v99 = (void *)[v98 mutableCopy];
    [v99 removeObject:&unk_1F02D9970];

    v98 = v99;
  }
  if ([v98 count])
  {
    v100 = objc_msgSend(MEMORY[0x1E4F38EE8], "px_fetchAssetCollectionsWithAlbumSubtypes:photoLibrary:", v98, v13);
    [v12 addObjectsFromArray:v100];
  }
  return v12;
}

+ (id)_isValidGazeRectPredicate
{
  v0 = (void *)MEMORY[0x1E4F28F60];
  v1 = DCIM_NSStringFromCGRect();
  uint64_t v2 = DCIM_NSStringFromCGRect();
  v3 = DCIM_NSStringFromCGRect();
  id v4 = [v0 predicateWithFormat:@"%K != %@ && %K != %@ && %K != %@", @"gazeRectString", v1, @"gazeRectString", v2, @"gazeRectString", v3];

  return v4;
}

+ (id)_otherAlbumsCollectionListWithDeletedCollection:()PhotosUICore withHiddenCollection:withDuplicatesCollection:
{
  v5 = [MEMORY[0x1E4F39008] _otherAlbumAssetCollectionsIncludingRecentlyDeleted:a3 includeHidden:a4 includeDuplicates:a5 includingSharedLibrary:a3 includingDebugAlbums:a3];
  BOOL v6 = PXLocalizedStringFromTable(@"PXUtilitiesAlbumsListTitle", @"PhotosUICore");
  id v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v8 = [MEMORY[0x1E4F39008] transientCollectionListWithCollections:v5 title:v6 identifier:0 photoLibrary:v7];

  return v8;
}

+ (id)px_transientIdentifierForWellKnownFolderName:()PhotosUICore
{
  uint64_t v3 = px_transientIdentifierForWellKnownFolderName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&px_transientIdentifierForWellKnownFolderName__onceToken, &__block_literal_global_751);
  }
  v5 = [(id)px_transientIdentifierForWellKnownFolderName__transientIdentifiers objectForKeyedSubscript:v4];

  return v5;
}

@end