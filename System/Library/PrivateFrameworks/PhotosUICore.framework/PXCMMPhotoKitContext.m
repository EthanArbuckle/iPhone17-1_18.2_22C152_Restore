@interface PXCMMPhotoKitContext
- (PHMomentShare)momentShare;
- (PHMomentShare)originatingMomentShare;
- (PHSuggestion)suggestion;
- (PXCMMPhotoKitContext)initWithAssetCollection:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5;
- (PXCMMPhotoKitContext)initWithAssetCollection:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5 optionalPeopleFetchResult:(id)a6;
- (PXCMMPhotoKitContext)initWithAssets:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5;
- (PXCMMPhotoKitContext)initWithAssetsDataSourceManager:(id)a3 mediaProvider:(id)a4 activityType:(unint64_t)a5;
- (PXCMMPhotoKitContext)initWithFetchResult:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5;
- (PXCMMPhotoKitContext)initWithFetchResult:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5 optionalPeopleFetchResult:(id)a6;
- (PXCMMPhotoKitContext)initWithMomentShare:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5;
- (PXCMMPhotoKitContext)initWithSuggestion:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5 optionalPeopleFetchResult:(id)a6;
- (id)actionManager;
- (id)createSession;
- (void)setOriginatingMomentShare:(id)a3;
@end

@implementation PXCMMPhotoKitContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingMomentShare, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_photoKitActionManager, 0);
}

- (void)setOriginatingMomentShare:(id)a3
{
}

- (PHMomentShare)originatingMomentShare
{
  return self->_originatingMomentShare;
}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (id)createSession
{
  v2 = [[PXCMMPhotoKitSession alloc] initWithPhotoKitContext:self];
  return v2;
}

- (id)actionManager
{
  return self->_photoKitActionManager;
}

- (PXCMMPhotoKitContext)initWithSuggestion:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5 optionalPeopleFetchResult:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  if (!v12)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXCMMPhotoKitContext.m", 354, @"Invalid parameter not satisfying: %@", @"suggestion" object file lineNumber description];
  }
  if (a4 != 1)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXCMMPhotoKitContext.m", 355, @"Invalid parameter not satisfying: %@", @"activityType == PXCMMActivityTypePublish" object file lineNumber description];
  }
  id v14 = objc_alloc(MEMORY[0x1E4F39150]);
  v23[0] = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v16 = [v12 photoLibrary];
  v17 = (void *)[v14 initWithObjects:v15 photoLibrary:v16 fetchType:*MEMORY[0x1E4F39650] fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  v18 = [(PXCMMPhotoKitContext *)self initWithFetchResult:v17 activityType:a4 sourceType:a5 optionalPeopleFetchResult:v13];
  v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_suggestion, a3);
  }

  return v19;
}

- (PXCMMPhotoKitContext)initWithMomentShare:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PXCMMPhotoKitContext.m", 286, @"Invalid parameter not satisfying: %@", @"momentShare" object file lineNumber description];
  }
  unint64_t v9 = a4;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PXCMMPhotoKitContext.m", 287, @"Invalid parameter not satisfying: %@", @"activityType == PXCMMActivityTypeReceiving || activityType == PXCMMActivityTypeReview" object file lineNumber description];
  }
  SEL v41 = a2;
  v10 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  v11 = [v10 librarySpecificFetchOptions];
  id v12 = (void *)MEMORY[0x1E4F38EE8];
  id v13 = [v8 localIdentifier];
  v54[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  uint64_t v15 = [v12 fetchAssetCollectionsWithLocalIdentifiers:v14 options:v11];

  v45 = (void *)v15;
  v16 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v15 options:0];
  [(PXPhotosDataSourceConfiguration *)v16 setPhotoLibrary:v10];
  uint64_t v53 = *MEMORY[0x1E4F39470];
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  [(PXPhotosDataSourceConfiguration *)v16 setFetchPropertySets:v17];

  v18 = +[PXCompleteMyMomentSettings sharedInstance];
  LODWORD(v13) = [v18 emulatesEmptyMomentShare];

  if (v13)
  {
    v19 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
    [(PXPhotosDataSourceConfiguration *)v16 setFilterPredicate:v19];
  }
  else
  {
    v19 = +[PXContentFilterState defaultFilterStateForContainerCollection:v8 photoLibrary:v10];
    v20 = [v19 predicateForUseCase:0];
    [(PXPhotosDataSourceConfiguration *)v16 setFilterPredicate:v20];
  }
  v44 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v16];
  v49 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v44];
  v48 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  id v50 = 0;
  id v51 = 0;
  PXCMMTitleAndSubtitleForAssetCollection(v8, &v51, &v50);
  id v47 = v51;
  id v46 = v50;
  v21 = 0;
  if (objc_msgSend(v8, "px_momentShareType") == 1)
  {
    v22 = [v10 librarySpecificFetchOptions];
    v23 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"role", 1);
    [v22 setPredicate:v23];

    v24 = [MEMORY[0x1E4F392E8] fetchParticipantsInShare:v8 options:v22];
    v25 = [v24 firstObject];
    v26 = v25;
    if (!v25)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:v41, self, @"PXCMMPhotoKitContext.m", 320, @"No owner for moment share: %@", v8 object file lineNumber description];

      v25 = 0;
    }
    v21 = PXRecipientFromShareParticipant(v25);
  }
  [v11 setFetchLimit:1];
  v27 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v8 options:v11];
  [v27 firstObject];
  v29 = v28 = self;

  v30 = [[PXCMMPreviewAsset alloc] initWithMomentShare:v8 underlyingAsset:v29];
  v31 = objc_alloc_init(PXCMMPreviewUIImageProvider);
  uint64_t v32 = [(PXCMMPhotoKitContext *)v28 initWithAssetsDataSourceManager:v49 mediaProvider:v48 activityType:v9];
  v33 = (PXCMMPhotoKitContext *)v32;
  if (v32)
  {
    objc_storeStrong((id *)(v32 + 192), a3);
    [(PXCMMContext *)v33 setTitle:v47];
    [(PXCMMContext *)v33 setSubtitle:v46];
    if (v21)
    {
      v52 = v21;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      [(PXCMMContext *)v33 setRecipients:v34];
    }
    else
    {
      [(PXCMMContext *)v33 setRecipients:MEMORY[0x1E4F1CBF0]];
    }
    [(PXCMMContext *)v33 setOriginatorRecipient:v21];
    v35 = [v8 startDate];
    [(PXCMMContext *)v33 setStartDate:v35];

    v36 = [v8 endDate];
    [(PXCMMContext *)v33 setEndDate:v36];

    -[PXCMMContext setPhotosCount:](v33, "setPhotosCount:", [v8 photosCount]);
    -[PXCMMContext setVideosCount:](v33, "setVideosCount:", [v8 videosCount]);
    -[PXCMMContext setCount:](v33, "setCount:", [v8 assetCount]);
    [(PXCMMContext *)v33 setPosterAsset:v30];
    [(PXCMMContext *)v33 setPosterMediaProvider:v31];
    [(PXCMMContext *)v33 setSourceType:a5];
  }

  return v33;
}

- (PXCMMPhotoKitContext)initWithAssetsDataSourceManager:(id)a3 mediaProvider:(id)a4 activityType:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PXCMMPhotoKitContext;
  v5 = [(PXCMMContext *)&v9 initWithAssetsDataSourceManager:a3 mediaProvider:a4 activityType:a5];
  if (v5)
  {
    v6 = objc_alloc_init(PXCMMPhotoKitActionManager);
    photoKitActionManager = v5->_photoKitActionManager;
    v5->_photoKitActionManager = v6;
  }
  return v5;
}

- (PXCMMPhotoKitContext)initWithFetchResult:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5 optionalPeopleFetchResult:(id)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v57 = a6;
  if (!v8)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"PXCMMPhotoKitContext.m", 79, @"Invalid parameter not satisfying: %@", @"fetchResult" object file lineNumber description];

    id v8 = 0;
  }
  if ([v8 count] != 1)
  {
    id v50 = v8;
    id v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"PXCMMPhotoKitContext.m", 80, @"Invalid parameter not satisfying: %@", @"fetchResult.count == 1" object file lineNumber description];

    id v8 = v50;
  }
  v68 = [v8 photoLibrary];
  id v9 = v8;
  if ((unint64_t)[v8 count] >= 2)
  {
    v10 = [v8 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:a2, self, @"PXCMMPhotoKitContext.m", 84, @"Invalid parameter not satisfying: %@", @"[fetchResult.firstObject isKindOfClass:[PHMoment class]]" object file lineNumber description];
    }
    PXMap();
  }
  v64 = v8;
  id v12 = [v8 firstObject];
  if ([v12 assetCollectionSubtype] == 101)
  {
    if (a4 == 2)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v78 = 0x3032000000;
      v79 = __Block_byref_object_copy__116743;
      v80 = __Block_byref_object_dispose__116744;
      uint64_t v81 = 0;
      v72[9] = MEMORY[0x1E4F143A8];
      v72[10] = 3221225472;
      v72[11] = __94__PXCMMPhotoKitContext_initWithFetchResult_activityType_sourceType_optionalPeopleFetchResult___block_invoke_222;
      v72[12] = &unk_1E5DD0588;
      v72[13] = v12;
      v72[14] = &buf;
      px_dispatch_on_main_queue_sync();
    }
    goto LABEL_15;
  }
  if (a4 == 2)
  {
    uint64_t v76 = *MEMORY[0x1E4F39470];
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    goto LABEL_17;
  }
  if (a4 != 1 || a5)
  {
LABEL_15:
    v63 = 0;
LABEL_17:
    v58 = 0;
    v59 = 0;
    goto LABEL_18;
  }
  if (v57) {
    v59 = [[PXPhotoKitPeopleSuggestionsDataSourceManager alloc] initWithPeopleFetchResult:v57];
  }
  else {
    v59 = 0;
  }
  id v47 = +[PXCompleteMyMomentSettings sharedInstance];
  uint64_t v48 = [v47 peopleSuggestionsDataSourceType];

  if (v48 == 1)
  {
    v58 = +[PXPhotoKitPeopleSuggestionsDataSourceManager photosGraphPeopleSuggestionsDataSourceManagerWithAssetCollection:v12];
    goto LABEL_51;
  }
  if (!v48)
  {
    v58 = +[PXPhotoKitPeopleSuggestionsDataSourceManager mockDataSourceManagerFromPeopleInPhotosInAssetCollection:v12];
LABEL_51:
    v63 = 0;
    goto LABEL_18;
  }
  v63 = 0;
  v58 = 0;
LABEL_18:
  id v13 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v9 options:0];
  [(PXPhotosDataSourceConfiguration *)v13 setPhotoLibrary:v68];
  [(PXPhotosDataSourceConfiguration *)v13 setFilterPredicate:0];
  [(PXPhotosDataSourceConfiguration *)v13 setFetchPropertySets:v63];
  [(PXPhotosDataSourceConfiguration *)v13 setCurationType:0];
  v66 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v13];
  [(PXPhotosDataSource *)v66 startBackgroundFetchIfNeeded];
  v61 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v66];
  v65 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  id v14 = [v68 librarySpecificFetchOptions];
  [v14 setFetchLimit:1];
  uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"curationScore" ascending:0];
  v75[0] = v15;
  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v75[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
  [v14 setSortDescriptors:v17];

  [v14 setInternalPredicate:0];
  if ([v12 assetCollectionType] == 4)
  {
    [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v12 referenceAsset:0];
    objc_claimAutoreleasedReturnValue();
    PXMap();
  }
  if ([v12 assetCollectionType] == 8)
  {
    v18 = objc_msgSend(MEMORY[0x1E4F39310], "px_keyAssetFilteringPredicate");
    [v14 setInternalPredicate:v18];

    v19 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v12 options:v14];
    uint64_t v20 = [v19 firstObject];
  }
  else
  {
    if ([v12 assetCollectionType] == 3) {
      [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v12 options:v14];
    }
    else {
    v19 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v12 options:v14];
    }
    uint64_t v20 = [v19 firstObject];
  }
  v21 = v20;

  if (v21) {
    goto LABEL_30;
  }
  v22 = PLSharingGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "No key asset found for %@\n Falling back to any asset.", (uint8_t *)&buf, 0xCu);
  }

  v23 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v12 options:v14];
  v21 = [v23 firstObject];

  if (v21)
  {
LABEL_30:
    v24 = [v12 startDate];
    v25 = [v12 endDate];
    uint64_t v55 = [v12 estimatedPhotosCount];
    uint64_t v54 = [v12 estimatedVideosCount];
    uint64_t v53 = [v12 estimatedAssetCount];
    v60 = [v12 localizedTitle];
    if (!v24)
    {
      v26 = [v68 librarySpecificFetchOptions];
      [v26 setFetchLimit:1];
      v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v74 = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
      [v26 setSortDescriptors:v28];

      v29 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v12 options:v26];
      v30 = [v29 firstObject];

      v24 = [v30 creationDate];
    }
    if (!v25)
    {
      v31 = [v68 librarySpecificFetchOptions];
      [v31 setFetchLimit:1];
      uint64_t v32 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
      v73 = v32;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
      [v31 setSortDescriptors:v33];

      v34 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v12 options:v31];
      v35 = [v34 firstObject];

      v25 = [v35 creationDate];
    }
    if ([v12 assetCollectionType] == 8)
    {
      uint64_t v71 = 0;
      v72[0] = 0;
      PXCMMTitleAndSubtitleForAssetCollection(v12, v72, &v71);
      v36 = (id *)&v71;
      v37 = (id *)v72;
    }
    else
    {
      uint64_t v69 = 0;
      uint64_t v70 = 0;
      PLCMMTitleAndSubtitleForTitleAndFallbackDates();
      v36 = (id *)&v69;
      v37 = (id *)&v70;
    }
    id v38 = *v37;
    id v39 = *v36;
    v40 = [(PXCMMPhotoKitContext *)self initWithAssetsDataSourceManager:v61 mediaProvider:v65 activityType:a4];
    SEL v41 = v40;
    if (v40)
    {
      [(PXCMMContext *)v40 setPeopleSuggestionsPreviewDataSourceManager:v59];
      [(PXCMMContext *)v41 setPeopleSuggestionsDataSourceManager:v58];
      v42 = (void *)[v60 copy];
      [(PXCMMContext *)v41 setOriginalTitle:v42];

      v43 = (void *)[v38 copy];
      [(PXCMMContext *)v41 setTitle:v43];

      v44 = (void *)[v39 copy];
      [(PXCMMContext *)v41 setSubtitle:v44];

      [(PXCMMContext *)v41 setPosterAsset:v21];
      [(PXCMMContext *)v41 setPosterMediaProvider:v65];
      [(PXCMMContext *)v41 setStartDate:v24];
      [(PXCMMContext *)v41 setEndDate:v25];
      [(PXCMMContext *)v41 setPhotosCount:v55];
      [(PXCMMContext *)v41 setVideosCount:v54];
      [(PXCMMContext *)v41 setCount:v53];
      [(PXCMMContext *)v41 setSourceType:a5];
    }
    self = v41;

    v45 = self;
  }
  else
  {
    v21 = PLSharingGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_ERROR, "No assets found for %@\n", (uint8_t *)&buf, 0xCu);
    }
    v45 = 0;
  }

  return v45;
}

void __94__PXCMMPhotoKitContext_initWithFetchResult_activityType_sourceType_optionalPeopleFetchResult___block_invoke_222(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "pl_assetContainer");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 cloudAlbumSubscriberRecords];
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "inviteeFirstName", (void)v13);
          if (v12) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

uint64_t __94__PXCMMPhotoKitContext_initWithFetchResult_activityType_sourceType_optionalPeopleFetchResult___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

uint64_t __94__PXCMMPhotoKitContext_initWithFetchResult_activityType_sourceType_optionalPeopleFetchResult___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (PXCMMPhotoKitContext)initWithFetchResult:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5
{
  return [(PXCMMPhotoKitContext *)self initWithFetchResult:a3 activityType:a4 sourceType:a5 optionalPeopleFetchResult:0];
}

- (PXCMMPhotoKitContext)initWithAssetCollection:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5 optionalPeopleFetchResult:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (!v11)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXCMMPhotoKitContext.m", 61, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];
  }
  if ([v11 assetCollectionType] == 7)
  {
    long long v13 = [(PXCMMPhotoKitContext *)self initWithMomentShare:v11 activityType:a4 sourceType:a5];
  }
  else
  {
    if ([v11 assetCollectionType] != 8)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F39150]);
      v21[0] = v11;
      long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      v17 = [v11 photoLibrary];
      uint64_t v18 = (void *)[v15 initWithObjects:v16 photoLibrary:v17 fetchType:*MEMORY[0x1E4F39650] fetchPropertySets:0 identifier:0 registerIfNeeded:0];

      long long v14 = [(PXCMMPhotoKitContext *)self initWithFetchResult:v18 activityType:a4 sourceType:a5 optionalPeopleFetchResult:v12];
      goto LABEL_9;
    }
    long long v13 = [(PXCMMPhotoKitContext *)self initWithSuggestion:v11 activityType:a4 sourceType:a5 optionalPeopleFetchResult:v12];
  }
  long long v14 = v13;
LABEL_9:

  return v14;
}

- (PXCMMPhotoKitContext)initWithAssetCollection:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5
{
  return [(PXCMMPhotoKitContext *)self initWithAssetCollection:a3 activityType:a4 sourceType:a5 optionalPeopleFetchResult:0];
}

- (PXCMMPhotoKitContext)initWithAssets:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5
{
  id v9 = a3;
  if (!v9)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXCMMPhotoKitContext.m", 50, @"Invalid parameter not satisfying: %@", @"assets" object file lineNumber description];
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F38EB8], "px_orderedAssetsFromAssets:sortDescriptors:", v9, 0);
  id v11 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v10 title:0];
  id v12 = [(PXCMMPhotoKitContext *)self initWithAssetCollection:v11 activityType:a4 sourceType:a5 optionalPeopleFetchResult:0];

  return v12;
}

@end