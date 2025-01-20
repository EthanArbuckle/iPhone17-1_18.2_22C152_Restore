@interface PXPhotoKitVirtualCollections
+ (id)_makeTransientAssetCollectionWithRecentsKey:(id)a3 title:(id)a4 identifier:(id)a5 photoLibrary:(id)a6 configurationHandler:(id)a7;
+ (id)_virtualCollectionForType:(int64_t)a3 photoLibrary:(id)a4;
- (PHAssetCollection)allAlbumsCollection;
- (PHAssetCollection)bookmarksCollection;
- (PHAssetCollection)completeMyMomentCollection;
- (PHAssetCollection)contentSyndicationCollection;
- (PHAssetCollection)eventsCollection;
- (PHAssetCollection)featuredCollection;
- (PHAssetCollection)featuredPhotosCollection;
- (PHAssetCollection)importHistoryCollection;
- (PHAssetCollection)mapCollection;
- (PHAssetCollection)memoriesCollection;
- (PHAssetCollection)momentsCollection;
- (PHAssetCollection)myAlbumsCollection;
- (PHAssetCollection)peopleCollection;
- (PHAssetCollection)photosCollection;
- (PHAssetCollection)prototypeCollection;
- (PHAssetCollection)recentlyEditedCollection;
- (PHAssetCollection)recentlySharedCollection;
- (PHAssetCollection)recentlyViewedCollection;
- (PHAssetCollection)searchCollection;
- (PHAssetCollection)sharedActivityCollection;
- (PHAssetCollection)sharedAlbumsCollection;
- (PHAssetCollection)tripsCollection;
- (PHAssetCollection)wallpaperSuggestionsCollection;
- (PHCollectionList)macSyncedAlbumsCollectionList;
- (PHCollectionList)mediaTypesCollectionList;
- (PHCollectionList)rootAlbumCollectionList;
- (PHCollectionList)rootProjectCollectionList;
- (PHCollectionList)sharedAlbumsAndActivityCollectionList;
- (PHCollectionList)sharedAlbumsCollectionList;
- (PHCollectionList)utilitiesCollectionList;
- (PHPhotoLibrary)photoLibrary;
- (PXPhotoKitVirtualCollections)initWithPhotoLibrary:(id)a3;
- (id)featuredEventsCollectionsWithAssetFetchResult:(id)a3;
- (id)featuredMemoriesCollectionsWithAssetFetchResult:(id)a3;
- (id)featuredPeopleCollectionsWithAssetFetchResult:(id)a3;
- (id)featuredTripsCollectionsWithAssetFetchResult:(id)a3;
@end

@implementation PXPhotoKitVirtualCollections

- (PHAssetCollection)recentlyViewedCollection
{
  return (PHAssetCollection *)[(PLLazyObject *)self->_recentlyViewedCollection objectValue];
}

- (PHAssetCollection)recentlySharedCollection
{
  return (PHAssetCollection *)[(PLLazyObject *)self->_recentlySharedCollection objectValue];
}

- (PHAssetCollection)recentlyEditedCollection
{
  return (PHAssetCollection *)[(PLLazyObject *)self->_recentlyEditedCollection objectValue];
}

+ (id)_virtualCollectionForType:(int64_t)a3 photoLibrary:(id)a4
{
  id v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0:
      v8 = PXContentSyndicationLocalizedSocialLayerTitle();
      uint64_t v9 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:v8 identifier:@"PXContentSyndicationVirtualCollection" photoLibrary:v7];
      goto LABEL_18;
    case 1:
      v8 = objc_msgSend(v6, "px_standardLibrarySpecificFetchOptions");
      v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"importSession != nil"];
      [v8 setInternalPredicate:v10];

      [v8 setWantsIncrementalChangeDetails:1];
      [v8 setSortDescriptors:MEMORY[0x1E4F1CBF0]];
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F39328]) initWithFetchOptions:v8];
      v12 = PXLocalizedStringFromTable(@"PXImportHistoryTitle", @"PhotosUICore");
      [v11 setTitle:v12];

      [v11 setIdentifier:@"PXImportHistoryVirtualCollection"];
      [v11 setType:9];
      uint64_t v13 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithOptions:v11];
      goto LABEL_15;
    case 2:
      v8 = PXLocalizedStringFromTable(@"PXSyncedFromMacOutlineTitle", @"PhotosUICore");
      v14 = (void *)MEMORY[0x1E4F39008];
      uint64_t v15 = MEMORY[0x1E4F1CBF0];
      v16 = @"PXMacSyncedAlbumsVirtualCollection";
      goto LABEL_17;
    case 3:
      v17 = (void *)MEMORY[0x1E4F38EE8];
      v18 = objc_msgSend(MEMORY[0x1E4F38EE8], "px_mediaTypeSmartAlbumSubtypes");
      v8 = objc_msgSend(v17, "px_fetchAssetCollectionsWithAlbumSubtypes:photoLibrary:", v18, v7);

      v11 = PXLocalizedStringFromTable(@"PXMediaTypesAlbumsListTitle", @"PhotosUICore");
      uint64_t v13 = [MEMORY[0x1E4F39008] transientCollectionListWithCollections:v8 title:v11 identifier:@"PXMediaTypesVirtualCollection" photoLibrary:v7];
      goto LABEL_15;
    case 4:
      v19 = (void *)MEMORY[0x1E4F39008];
      v8 = objc_msgSend(v6, "px_standardLibrarySpecificFetchOptions");
      v20 = [v19 fetchRootProjectCollectionListWithOptions:v8];
      goto LABEL_13;
    case 5:
      v8 = PXLocalizedStringFromTable(@"PXCollectionRecentlyEditedTitle", @"LemonadeLocalizable");
      v21 = @"adjustmentTimestamp";
      v22 = @"PXRecentlyEditedVirtualCollection";
      v23 = &__block_literal_global_191009;
      v24 = v8;
      v25 = v7;
      goto LABEL_11;
    case 6:
      v8 = PXLocalizedStringFromTable(@"PXCollectionRecentlySharedTitle", @"LemonadeLocalizable");
      v21 = @"lastSharedDate";
      v22 = @"PXRecentlySharedVirtualCollection";
      goto LABEL_10;
    case 7:
      v8 = PXLocalizedStringFromTable(@"PXCollectionRecentlyViewedTitle", @"LemonadeLocalizable");
      v21 = @"additionalAttributes.lastViewedDate";
      v22 = @"PXRecentlyViewedVirtualCollection";
LABEL_10:
      v24 = v8;
      v25 = v7;
      v23 = 0;
LABEL_11:
      uint64_t v9 = +[PXPhotoKitVirtualCollections _makeTransientAssetCollectionWithRecentsKey:v21 title:v24 identifier:v22 photoLibrary:v25 configurationHandler:v23];
      goto LABEL_18;
    case 8:
      v26 = (void *)MEMORY[0x1E4F39008];
      v8 = objc_msgSend(v6, "px_standardLibrarySpecificFetchOptions");
      v20 = [v26 fetchRootAlbumCollectionListWithOptions:v8];
LABEL_13:
      v11 = v20;
      uint64_t v13 = [v20 firstObject];
      goto LABEL_15;
    case 9:
      v27 = (void *)MEMORY[0x1E4F38EE8];
      v28 = objc_msgSend(v6, "px_standardLibrarySpecificFetchOptions");
      v8 = [v27 fetchAssetCollectionsWithType:1 subtype:101 options:v28];

      v11 = PXLocalizedStringFromTable(@"PXCollectionSharedAlbumsTitle", @"PhotosUICore");
      uint64_t v13 = [MEMORY[0x1E4F39008] transientCollectionListWithCollectionsFetchResult:v8 title:v11 identifier:@"PXSharedAlbumsVirtualCollection"];
LABEL_15:
      v4 = (void *)v13;

      goto LABEL_19;
    case 10:
      v8 = PXLocalizedStringFromTable(@"PXOtherAlbumsOutlineTitle", @"PhotosUICore");
      v14 = (void *)MEMORY[0x1E4F39008];
      uint64_t v15 = MEMORY[0x1E4F1CBF0];
      v16 = @"PXTransientCollectionIdentifierUtilities";
LABEL_17:
      uint64_t v9 = [v14 transientCollectionListWithCollections:v15 title:v8 identifier:v16 photoLibrary:v7];
LABEL_18:
      v4 = (void *)v9;
LABEL_19:

      break;
    default:
      break;
  }

  return v4;
}

+ (id)_makeTransientAssetCollectionWithRecentsKey:(id)a3 title:(id)a4 identifier:(id)a5 photoLibrary:(id)a6 configurationHandler:(id)a7
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v11 = (void (**)(id, void *))a7;
  v12 = (void *)MEMORY[0x1E4F1C9A8];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 currentCalendar];
  v18 = objc_opt_new();
  [v18 setDay:-14];
  v19 = [MEMORY[0x1E4F1C9C8] now];
  v20 = [v17 startOfDayForDate:v19];

  v21 = [v17 dateByAddingComponents:v18 toDate:v20 options:0];
  v22 = objc_msgSend(v13, "px_standardLibrarySpecificFetchOptions");

  v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", v16, v21];
  [v22 setInternalPredicate:v23];

  v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v16 ascending:0];

  v29[0] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  [v22 setInternalSortDescriptors:v25];

  [v22 setWantsIncrementalChangeDetails:1];
  if (v11) {
    v11[2](v11, v22);
  }
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F39328]) initWithFetchOptions:v22];
  [v26 setType:2];
  [v26 setTitle:v15];

  [v26 setIdentifier:v14];
  [v26 setKeyAssetsPosition:1];
  v27 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithOptions:v26];

  return v27;
}

- (PXPhotoKitVirtualCollections)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v142.receiver = self;
  v142.super_class = (Class)PXPhotoKitVirtualCollections;
  v5 = [(PXPhotoKitVirtualCollections *)&v142 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_photoLibrary, v4);
    v7 = (void *)MEMORY[0x1E4F38EE8];
    v8 = PXLocalizedStringFromTable(@"PXCollectionPhotosTitle", @"PhotosUICore");
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    uint64_t v10 = [v7 transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:v8 identifier:@"PXMomentsVirtualCollection" photoLibrary:v4];
    momentsCollection = v6->_momentsCollection;
    v6->_momentsCollection = (PHAssetCollection *)v10;

    v12 = (void *)MEMORY[0x1E4F38EE8];
    id v13 = PXLocalizedStringFromTable(@"PXCollectionLibraryTitle", @"PhotosUICore");
    uint64_t v14 = [v12 transientAssetCollectionWithAssets:v9 title:v13 identifier:@"PXPhotosVirtualCollection" photoLibrary:v4];
    photosCollection = v6->_photosCollection;
    v6->_photosCollection = (PHAssetCollection *)v14;

    id v16 = (void *)MEMORY[0x1E4F38EE8];
    v17 = PXLocalizedStringFromTable(@"PXCollectionMemoriesTitle", @"PhotosUICore");
    uint64_t v18 = [v16 transientAssetCollectionWithAssets:v9 title:v17 identifier:@"PXMemoriesVirtualCollection" photoLibrary:v4];
    memoriesCollection = v6->_memoriesCollection;
    v6->_memoriesCollection = (PHAssetCollection *)v18;

    v20 = (void *)MEMORY[0x1E4F38EE8];
    v21 = PXLocalizedStringFromTable(@"PXCollectionAllAlbumsTitle", @"PhotosUICore");
    uint64_t v22 = [v20 transientAssetCollectionWithAssets:v9 title:v21 identifier:@"PXAllAlbumsVirtualCollection" photoLibrary:v4];
    allAlbumsCollection = v6->_allAlbumsCollection;
    v6->_allAlbumsCollection = (PHAssetCollection *)v22;

    v24 = (void *)MEMORY[0x1E4F38EE8];
    v25 = PXLocalizedStringFromTable(@"PXCollectionMyAlbumsTitle", @"PhotosUICore");
    uint64_t v26 = [v24 transientAssetCollectionWithAssets:v9 title:v25 identifier:@"PXMyAlbumsVirtualCollection" photoLibrary:v4];
    myAlbumsCollection = v6->_myAlbumsCollection;
    v6->_myAlbumsCollection = (PHAssetCollection *)v26;

    v28 = (void *)MEMORY[0x1E4F38EE8];
    v29 = PXLocalizedStringFromTable(@"PXCollectionAllSharedAlbumsTitle", @"PhotosUICore");
    uint64_t v30 = [v28 transientAssetCollectionWithAssets:v9 title:v29 identifier:@"PXSharedAlbumsVirtualCollection" photoLibrary:v4];
    sharedAlbumsCollection = v6->_sharedAlbumsCollection;
    v6->_sharedAlbumsCollection = (PHAssetCollection *)v30;

    v32 = (void *)MEMORY[0x1E4F38EE8];
    v33 = PXLocalizedStringFromTable(@"PXCollectionSearchTitle", @"PhotosUICore");
    uint64_t v34 = [v32 transientAssetCollectionWithAssets:v9 title:v33 identifier:@"PXPhotosSearchVirtualCollection" photoLibrary:v4];
    searchCollection = v6->_searchCollection;
    v6->_searchCollection = (PHAssetCollection *)v34;

    v36 = (void *)MEMORY[0x1E4F38EE8];
    v37 = PXLocalizedStringFromTable(@"PXCollectionCompleteMyMomentTitle", @"PhotosUICore");
    uint64_t v38 = [v36 transientAssetCollectionWithAssets:v9 title:v37 identifier:@"PXCompleteMyMomentVirtualCollection" photoLibrary:v4];
    completeMyMomentCollection = v6->_completeMyMomentCollection;
    v6->_completeMyMomentCollection = (PHAssetCollection *)v38;

    v40 = (void *)MEMORY[0x1E4F38EE8];
    v41 = PXLocalizedStringFromTable(@"PXCollectionSharedActivityTitle", @"PhotosUICore");
    uint64_t v42 = [v40 transientAssetCollectionWithAssets:v9 title:v41 identifier:@"PXSharedActivityVirtualCollection" photoLibrary:v4];
    sharedActivityCollection = v6->_sharedActivityCollection;
    v6->_sharedActivityCollection = (PHAssetCollection *)v42;

    v44 = (void *)MEMORY[0x1E4F39008];
    v45 = PXLocalizedStringFromTable(@"PXCollectionSharedAlbumsTitle", @"PhotosUICore");
    uint64_t v46 = [v44 transientCollectionListWithCollections:v9 title:v45 identifier:@"PXSharedAlbumsAndActivityVirtualCollection" photoLibrary:v4];
    sharedAlbumsAndActivityCollectionList = v6->_sharedAlbumsAndActivityCollectionList;
    v6->_sharedAlbumsAndActivityCollectionList = (PHCollectionList *)v46;

    v48 = (void *)MEMORY[0x1E4F38EE8];
    v49 = PXLocalizedStringFromTable(@"PXCollectionFeaturedTitle", @"LemonadeLocalizable");
    uint64_t v50 = [v48 transientAssetCollectionWithAssets:v9 title:v49 identifier:@"PXTransientCollectionIdentifierFeatured" photoLibrary:v4];
    featuredCollection = v6->_featuredCollection;
    v6->_featuredCollection = (PHAssetCollection *)v50;

    v52 = (void *)MEMORY[0x1E4F38EE8];
    v53 = PXLocalizedStringFromTable(@"PXCollectionEventsTitle", @"LemonadeLocalizable");
    uint64_t v54 = [v52 transientAssetCollectionWithAssets:v9 title:v53 identifier:@"PXTransientCollectionIdentifierEvents" photoLibrary:v4];
    eventsCollection = v6->_eventsCollection;
    v6->_eventsCollection = (PHAssetCollection *)v54;

    v56 = (void *)MEMORY[0x1E4F38EE8];
    v57 = PXLocalizedStringFromTable(@"PXCollectionTripsTitle", @"LemonadeLocalizable");
    uint64_t v58 = [v56 transientAssetCollectionWithAssets:v9 title:v57 identifier:@"PXTransientCollectionIdentifierTrips" photoLibrary:v4];
    tripsCollection = v6->_tripsCollection;
    v6->_tripsCollection = (PHAssetCollection *)v58;

    v60 = (void *)MEMORY[0x1E4F38EE8];
    v61 = PXLocalizedStringFromTable(@"PXCollectionFeaturedPhotosTitle", @"LemonadeLocalizable");
    uint64_t v62 = [v60 transientAssetCollectionWithAssets:v9 title:v61 identifier:@"PXFeaturedPhotosVirtualCollection" photoLibrary:v4];
    featuredPhotosCollection = v6->_featuredPhotosCollection;
    v6->_featuredPhotosCollection = (PHAssetCollection *)v62;

    v64 = (void *)MEMORY[0x1E4F38EE8];
    v65 = PXLocalizedStringFromTable(@"PXCollectionWallpaperSuggestionsCollectionTitle", @"LemonadeLocalizable");
    uint64_t v66 = [v64 transientAssetCollectionWithAssets:v9 title:v65 identifier:@"PXTransientCollectionIdentifierWallpaperSuggestions" photoLibrary:v4];
    wallpaperSuggestionsCollection = v6->_wallpaperSuggestionsCollection;
    v6->_wallpaperSuggestionsCollection = (PHAssetCollection *)v66;

    v68 = (void *)MEMORY[0x1E4F38EE8];
    v69 = PXLocalizedStringFromTable(@"PXCollectionBookmarksCollectionTitle", @"LemonadeLocalizable");
    uint64_t v70 = [v68 transientAssetCollectionWithAssets:v9 title:v69 identifier:@"PXTransientCollectionIdentifierBookmarks" photoLibrary:v4];
    bookmarksCollection = v6->_bookmarksCollection;
    v6->_bookmarksCollection = (PHAssetCollection *)v70;

    v72 = (void *)MEMORY[0x1E4F38EE8];
    v73 = PXLocalizedStringFromTable(@"PXCollectionMapCollectionTitle", @"LemonadeLocalizable");
    uint64_t v74 = [v72 transientAssetCollectionWithAssets:v9 title:v73 identifier:@"PXTransientCollectionIdentifierMap" photoLibrary:v4];
    mapCollection = v6->_mapCollection;
    v6->_mapCollection = (PHAssetCollection *)v74;

    id v76 = objc_alloc(MEMORY[0x1E4F8B948]);
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = 3221225472;
    v140[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke;
    v140[3] = &unk_1E5DD2988;
    id v77 = v4;
    id v141 = v77;
    uint64_t v78 = [v76 initWithRetriableBlock:v140];
    importHistoryCollection = v6->_importHistoryCollection;
    v6->_importHistoryCollection = (PLLazyObject *)v78;

    id v80 = objc_alloc(MEMORY[0x1E4F8B948]);
    v138[0] = MEMORY[0x1E4F143A8];
    v138[1] = 3221225472;
    v138[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_2;
    v138[3] = &unk_1E5DD2988;
    id v81 = v77;
    id v139 = v81;
    uint64_t v82 = [v80 initWithRetriableBlock:v138];
    recentlyViewedCollection = v6->_recentlyViewedCollection;
    v6->_recentlyViewedCollection = (PLLazyObject *)v82;

    id v84 = objc_alloc(MEMORY[0x1E4F8B948]);
    v136[0] = MEMORY[0x1E4F143A8];
    v136[1] = 3221225472;
    v136[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_3;
    v136[3] = &unk_1E5DD2988;
    id v85 = v81;
    id v137 = v85;
    uint64_t v86 = [v84 initWithRetriableBlock:v136];
    recentlyEditedCollection = v6->_recentlyEditedCollection;
    v6->_recentlyEditedCollection = (PLLazyObject *)v86;

    id v88 = objc_alloc(MEMORY[0x1E4F8B948]);
    v134[0] = MEMORY[0x1E4F143A8];
    v134[1] = 3221225472;
    v134[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_4;
    v134[3] = &unk_1E5DD2988;
    id v89 = v85;
    id v135 = v89;
    uint64_t v90 = [v88 initWithRetriableBlock:v134];
    recentlySharedCollection = v6->_recentlySharedCollection;
    v6->_recentlySharedCollection = (PLLazyObject *)v90;

    id v92 = objc_alloc(MEMORY[0x1E4F8B948]);
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_5;
    v132[3] = &unk_1E5DD2988;
    id v93 = v89;
    id v133 = v93;
    uint64_t v94 = [v92 initWithRetriableBlock:v132];
    contentSyndicationCollection = v6->_contentSyndicationCollection;
    v6->_contentSyndicationCollection = (PLLazyObject *)v94;

    id v96 = objc_alloc(MEMORY[0x1E4F8B948]);
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_6;
    v130[3] = &unk_1E5DD2988;
    id v97 = v93;
    id v131 = v97;
    uint64_t v98 = [v96 initWithRetriableBlock:v130];
    sharedAlbumsCollectionList = v6->_sharedAlbumsCollectionList;
    v6->_sharedAlbumsCollectionList = (PLLazyObject *)v98;

    id v100 = objc_alloc(MEMORY[0x1E4F8B948]);
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v128[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_7;
    v128[3] = &unk_1E5DD2988;
    id v101 = v97;
    id v129 = v101;
    uint64_t v102 = [v100 initWithRetriableBlock:v128];
    mediaTypesCollectionList = v6->_mediaTypesCollectionList;
    v6->_mediaTypesCollectionList = (PLLazyObject *)v102;

    id v104 = objc_alloc(MEMORY[0x1E4F8B948]);
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_8;
    v126[3] = &unk_1E5DD2988;
    id v105 = v101;
    id v127 = v105;
    uint64_t v106 = [v104 initWithRetriableBlock:v126];
    utilitiesCollectionList = v6->_utilitiesCollectionList;
    v6->_utilitiesCollectionList = (PLLazyObject *)v106;

    id v108 = objc_alloc(MEMORY[0x1E4F8B948]);
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_9;
    v124[3] = &unk_1E5DD2988;
    id v109 = v105;
    id v125 = v109;
    uint64_t v110 = [v108 initWithRetriableBlock:v124];
    macSyncedAlbumsCollectionList = v6->_macSyncedAlbumsCollectionList;
    v6->_macSyncedAlbumsCollectionList = (PLLazyObject *)v110;

    id v112 = objc_alloc(MEMORY[0x1E4F8B948]);
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_10;
    v122[3] = &unk_1E5DD2988;
    id v113 = v109;
    id v123 = v113;
    uint64_t v114 = [v112 initWithRetriableBlock:v122];
    rootAlbumCollectionList = v6->_rootAlbumCollectionList;
    v6->_rootAlbumCollectionList = (PLLazyObject *)v114;

    id v116 = objc_alloc(MEMORY[0x1E4F8B948]);
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_11;
    v120[3] = &unk_1E5DD2988;
    id v121 = v113;
    uint64_t v117 = [v116 initWithRetriableBlock:v120];
    rootProjectCollectionList = v6->_rootProjectCollectionList;
    v6->_rootProjectCollectionList = (PLLazyObject *)v117;
  }
  return v6;
}

uint64_t __71__PXPhotoKitVirtualCollections__virtualCollectionForType_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIncludeRecentlyEditedSmartAlbum:1];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_4(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:6 photoLibrary:*(void *)(a1 + 32)];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_2(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:7 photoLibrary:*(void *)(a1 + 32)];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:1 photoLibrary:*(void *)(a1 + 32)];
}

- (PHAssetCollection)mapCollection
{
  return self->_mapCollection;
}

- (PHAssetCollection)importHistoryCollection
{
  return (PHAssetCollection *)[(PLLazyObject *)self->_importHistoryCollection objectValue];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_sharedAlbumsAndActivityCollectionList, 0);
  objc_storeStrong((id *)&self->_bookmarksCollection, 0);
  objc_storeStrong((id *)&self->_wallpaperSuggestionsCollection, 0);
  objc_storeStrong((id *)&self->_mapCollection, 0);
  objc_storeStrong((id *)&self->_featuredPhotosCollection, 0);
  objc_storeStrong((id *)&self->_tripsCollection, 0);
  objc_storeStrong((id *)&self->_eventsCollection, 0);
  objc_storeStrong((id *)&self->_featuredCollection, 0);
  objc_storeStrong((id *)&self->_sharedAlbumsCollection, 0);
  objc_storeStrong((id *)&self->_myAlbumsCollection, 0);
  objc_storeStrong((id *)&self->_sharedActivityCollection, 0);
  objc_storeStrong((id *)&self->_completeMyMomentCollection, 0);
  objc_storeStrong((id *)&self->_allAlbumsCollection, 0);
  objc_storeStrong((id *)&self->_searchCollection, 0);
  objc_storeStrong((id *)&self->_memoriesCollection, 0);
  objc_storeStrong((id *)&self->_photosCollection, 0);
  objc_storeStrong((id *)&self->_momentsCollection, 0);
  objc_storeStrong((id *)&self->_rootProjectCollectionList, 0);
  objc_storeStrong((id *)&self->_rootAlbumCollectionList, 0);
  objc_storeStrong((id *)&self->_macSyncedAlbumsCollectionList, 0);
  objc_storeStrong((id *)&self->_utilitiesCollectionList, 0);
  objc_storeStrong((id *)&self->_mediaTypesCollectionList, 0);
  objc_storeStrong((id *)&self->_sharedAlbumsCollectionList, 0);
  objc_storeStrong((id *)&self->_contentSyndicationCollection, 0);
  objc_storeStrong((id *)&self->_recentlySharedCollection, 0);
  objc_storeStrong((id *)&self->_recentlyEditedCollection, 0);
  objc_storeStrong((id *)&self->_recentlyViewedCollection, 0);
  objc_storeStrong((id *)&self->_importHistoryCollection, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (PHCollectionList)sharedAlbumsAndActivityCollectionList
{
  return self->_sharedAlbumsAndActivityCollectionList;
}

- (PHAssetCollection)bookmarksCollection
{
  return self->_bookmarksCollection;
}

- (PHAssetCollection)wallpaperSuggestionsCollection
{
  return self->_wallpaperSuggestionsCollection;
}

- (PHAssetCollection)featuredPhotosCollection
{
  return self->_featuredPhotosCollection;
}

- (PHAssetCollection)tripsCollection
{
  return self->_tripsCollection;
}

- (PHAssetCollection)eventsCollection
{
  return self->_eventsCollection;
}

- (PHAssetCollection)featuredCollection
{
  return self->_featuredCollection;
}

- (PHAssetCollection)sharedAlbumsCollection
{
  return self->_sharedAlbumsCollection;
}

- (PHAssetCollection)myAlbumsCollection
{
  return self->_myAlbumsCollection;
}

- (PHAssetCollection)sharedActivityCollection
{
  return self->_sharedActivityCollection;
}

- (PHAssetCollection)completeMyMomentCollection
{
  return self->_completeMyMomentCollection;
}

- (PHAssetCollection)allAlbumsCollection
{
  return self->_allAlbumsCollection;
}

- (PHAssetCollection)searchCollection
{
  return self->_searchCollection;
}

- (PHAssetCollection)memoriesCollection
{
  return self->_memoriesCollection;
}

- (PHAssetCollection)photosCollection
{
  return self->_photosCollection;
}

- (PHAssetCollection)momentsCollection
{
  return self->_momentsCollection;
}

- (PHCollectionList)rootProjectCollectionList
{
  return (PHCollectionList *)[(PLLazyObject *)self->_rootProjectCollectionList objectValue];
}

- (PHCollectionList)rootAlbumCollectionList
{
  return (PHCollectionList *)[(PLLazyObject *)self->_rootAlbumCollectionList objectValue];
}

- (PHCollectionList)macSyncedAlbumsCollectionList
{
  return (PHCollectionList *)[(PLLazyObject *)self->_macSyncedAlbumsCollectionList objectValue];
}

- (PHCollectionList)utilitiesCollectionList
{
  return (PHCollectionList *)[(PLLazyObject *)self->_utilitiesCollectionList objectValue];
}

- (PHCollectionList)mediaTypesCollectionList
{
  return (PHCollectionList *)[(PLLazyObject *)self->_mediaTypesCollectionList objectValue];
}

- (PHCollectionList)sharedAlbumsCollectionList
{
  return (PHCollectionList *)[(PLLazyObject *)self->_sharedAlbumsCollectionList objectValue];
}

- (id)featuredPeopleCollectionsWithAssetFetchResult:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F38EE8];
  v5 = [a3 fetchedObjects];
  id v6 = PXLocalizedStringFromTable(@"PXCollectionFeaturedPeopleCollectionTitle", @"LemonadeLocalizable");
  v7 = [(PXPhotoKitVirtualCollections *)self photoLibrary];
  v8 = [v4 transientAssetCollectionWithAssets:v5 title:v6 identifier:@"PXTransientCollectionIdentifierFeaturedPeople" photoLibrary:v7];

  return v8;
}

- (id)featuredMemoriesCollectionsWithAssetFetchResult:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F38EE8];
  v5 = [a3 fetchedObjects];
  id v6 = PXLocalizedStringFromTable(@"PXCollectionFeaturedMemoriesCollectionTitle", @"LemonadeLocalizable");
  v7 = [(PXPhotoKitVirtualCollections *)self photoLibrary];
  v8 = [v4 transientAssetCollectionWithAssets:v5 title:v6 identifier:@"PXTransientCollectionIdentifierFeaturedMemories" photoLibrary:v7];

  return v8;
}

- (id)featuredEventsCollectionsWithAssetFetchResult:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F38EE8];
  v5 = [a3 fetchedObjects];
  id v6 = PXLocalizedStringFromTable(@"PXCollectionFeaturedEventsCollectionTitle", @"LemonadeLocalizable");
  v7 = [(PXPhotoKitVirtualCollections *)self photoLibrary];
  v8 = [v4 transientAssetCollectionWithAssets:v5 title:v6 identifier:@"PXTransientCollectionIdentifierFeaturedEvents" photoLibrary:v7];

  return v8;
}

- (id)featuredTripsCollectionsWithAssetFetchResult:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F38EE8];
  v5 = [a3 fetchedObjects];
  id v6 = PXLocalizedStringFromTable(@"PXCollectionFeaturedTripsCollectionTitle", @"LemonadeLocalizable");
  v7 = [(PXPhotoKitVirtualCollections *)self photoLibrary];
  v8 = [v4 transientAssetCollectionWithAssets:v5 title:v6 identifier:@"PXTransientCollectionIdentifierFeaturedTrips" photoLibrary:v7];

  return v8;
}

- (PHAssetCollection)contentSyndicationCollection
{
  return (PHAssetCollection *)[(PLLazyObject *)self->_contentSyndicationCollection objectValue];
}

- (PHAssetCollection)prototypeCollection
{
  v2 = (void *)MEMORY[0x1E4F38EE8];
  v3 = [(PXPhotoKitVirtualCollections *)self photoLibrary];
  id v4 = [v2 transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:@"Prototype" identifier:@"PXPrototypeVirtualCollection" photoLibrary:v3];

  return (PHAssetCollection *)v4;
}

- (PHAssetCollection)peopleCollection
{
  v3 = [(PXPhotoKitVirtualCollections *)self photoLibrary];
  id v4 = PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v3, "px_peoplePetsHomeVisibility"), @"PXCollectionPeopleTitle");

  v5 = (void *)MEMORY[0x1E4F38EE8];
  id v6 = [(PXPhotoKitVirtualCollections *)self photoLibrary];
  v7 = [v5 transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:v4 identifier:@"PXPeopleVirtualCollection" photoLibrary:v6];

  return (PHAssetCollection *)v7;
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_3(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:5 photoLibrary:*(void *)(a1 + 32)];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_5(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:0 photoLibrary:*(void *)(a1 + 32)];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_6(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:9 photoLibrary:*(void *)(a1 + 32)];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_7(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:3 photoLibrary:*(void *)(a1 + 32)];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_8(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:10 photoLibrary:*(void *)(a1 + 32)];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_9(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:2 photoLibrary:*(void *)(a1 + 32)];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_10(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:8 photoLibrary:*(void *)(a1 + 32)];
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_11(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:4 photoLibrary:*(void *)(a1 + 32)];
}

@end