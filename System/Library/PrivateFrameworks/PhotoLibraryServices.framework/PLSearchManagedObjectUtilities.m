@interface PLSearchManagedObjectUtilities
+ (id)bundleIdentifierForManagedObject:(id)a3 wellKnownLibraryIdentifier:(int64_t)a4;
+ (id)psiObjectForIdentifierRequiringAdditonalWork:(id)a3 entity:(unint64_t)a4;
+ (id)psiObjectForObject:(id)a3 fetchHelper:(id)a4 partialUpdateMask:(int64_t)a5 indexingContext:(id)a6;
+ (id)searchableItemForObject:(id)a3 fetchHelper:(id)a4 partialUpdateMask:(int64_t)a5 libraryIdentifier:(int64_t)a6 indexingContext:(id)a7 embeddingsFetcher:(id)a8;
@end

@implementation PLSearchManagedObjectUtilities

+ (id)bundleIdentifierForManagedObject:(id)a3 wellKnownLibraryIdentifier:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 entity];
  v7 = [v6 name];
  v8 = +[PLManagedAsset entityName];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    +[PLSpotlightDonationUtilities bundleIdentifierForAsset:v5 wellKnownLibraryIdentifier:a4];
  }
  else {
  v10 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
  }

  return v10;
}

+ (id)searchableItemForObject:(id)a3 fetchHelper:(id)a4 partialUpdateMask:(int64_t)a5 libraryIdentifier:(int64_t)a6 indexingContext:(id)a7 embeddingsFetcher:(id)a8
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  v17 = [v13 entity];
  v18 = [v17 name];
  v19 = +[PLManagedAsset entityName];
  int v20 = [v18 isEqualToString:v19];

  if (!v20)
  {
    v30 = [v13 entity];
    v31 = [v30 name];
    v32 = +[PLManagedAlbum entityName];
    id v66 = v14;
    if (([v31 isEqualToString:v32] & 1) == 0)
    {
      v33 = [v13 entity];
      v34 = [v33 name];
      v35 = +[PLFetchingAlbum entityName];
      if (([v34 isEqualToString:v35] & 1) == 0)
      {
        v44 = [v13 entity];
        [v44 name];
        v45 = id v65 = v15;
        +[PLCloudSharedAlbum entityName];
        v46 = id v64 = v16;
        char v63 = [v45 isEqualToString:v46];

        id v16 = v64;
        id v15 = v65;

        if ((v63 & 1) == 0)
        {
          v47 = [v13 entity];
          v48 = [v47 name];
          v49 = +[PLMemory entityName];
          int v50 = [v48 isEqualToString:v49];

          if (v50)
          {
            id v51 = v13;
            v22 = [v51 uuid];
            uint64_t v52 = +[PLSpotlightMemoryTranslator spotlightSearchableItemFromMemory:v51];
          }
          else
          {
            v53 = [v13 entity];
            v54 = [v53 name];
            v55 = +[PLPhotosHighlight entityName];
            int v56 = [v54 isEqualToString:v55];

            if (!v56)
            {
              v57 = [v13 entity];
              v58 = [v57 name];
              v59 = +[PLGraphNode entityName];
              int v60 = [v58 isEqualToString:v59];

              if (v60)
              {
                v25 = 0;
                v22 = 0;
                id v15 = v65;
                id v14 = v66;
                id v16 = v64;
                goto LABEL_19;
              }
              v37 = PLSearchBackendIndexingEngineGetLog();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                v61 = [v13 entity];
                v62 = [v61 name];
                *(_DWORD *)buf = 138543362;
                v68 = v62;
                _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Invalid entity to process for search indexing: %{public}@", buf, 0xCu);
              }
              v25 = 0;
              v22 = 0;
              id v15 = v65;
              id v14 = v66;
              id v16 = v64;
LABEL_18:

              goto LABEL_19;
            }
            id v51 = v13;
            v22 = [v51 uuid];
            uint64_t v52 = +[PLSpotlightHighlightTranslator spotlightSearchableItemFromHighlight:v51];
          }
          v25 = (void *)v52;

          id v15 = v65;
          id v14 = v66;
          id v16 = v64;
          if (!v25) {
            goto LABEL_19;
          }
LABEL_16:
          v37 = PLSearchBackendIndexWorkerGetLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            [v13 entity];
            id v38 = v16;
            v40 = id v39 = v14;
            [v40 name];
            v42 = id v41 = v15;
            *(_DWORD *)buf = 138543874;
            v68 = @"inserting";
            __int16 v69 = 2114;
            v70 = v42;
            __int16 v71 = 2114;
            v72 = v22;
            _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_INFO, "search: %{public}@ object of entity %{public}@ uuid: %{public}@ ", buf, 0x20u);

            id v15 = v41;
            id v14 = v39;
            id v16 = v38;
          }
          goto LABEL_18;
        }
LABEL_15:
        id v36 = v13;
        v22 = [v36 uuid];
        v25 = +[PLSpotlightAlbumTranslator spotlightSearchableItemFromAlbum:v36];

        id v14 = v66;
        if (!v25) {
          goto LABEL_19;
        }
        goto LABEL_16;
      }
    }
    goto LABEL_15;
  }
  id v21 = v13;
  v22 = [v21 uuid];
  if (a5) {
    int64_t v23 = a5;
  }
  else {
    int64_t v23 = 3;
  }
  v24 = [v21 documentObservation];
  v25 = +[PLSpotlightAssetTranslator partialSpotlightSearchableItemFromAsset:v21 fetchHelper:v14 libraryIdentifier:a6 propertySets:v23 graphData:MEMORY[0x1E4F1CC08] indexingContext:v15 documentObservation:v24 embeddingsFetcher:v16];

  v26 = PLSearchBackendIndexWorkerGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = PLSearchIndexingAssetPropertySetDescription(v23);
    int v28 = [v25 isUpdate];
    v29 = @"N";
    *(_DWORD *)buf = 138543874;
    v68 = v22;
    __int16 v69 = 2114;
    if (v28) {
      v29 = @"Y";
    }
    v70 = v27;
    __int16 v71 = 2114;
    v72 = v29;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "search: donation for asset %{public}@ with property sets %{public}@ isUpdate: %{public}@", buf, 0x20u);
  }
  if (v25) {
    goto LABEL_16;
  }
LABEL_19:

  return v25;
}

+ (id)psiObjectForIdentifierRequiringAdditonalWork:(id)a3 entity:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4 < 7 || a4 == 8)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"PLSearchManagedObjectUtilities.m" lineNumber:95 description:@"Invalid entity for additional work"];

LABEL_3:
    int v9 = 0;
    goto LABEL_4;
  }
  if (a4 != 7) {
    goto LABEL_3;
  }
  id v17 = 0;
  uint64_t v18 = 0;
  id v16 = 0;
  v11 = +[PLSearchEntity decodeIdentifierString:v7 intoLabel:&v17 type:&v18 outIdentifier:&v16];
  id v12 = v17;
  id v13 = v16;
  if ([v11 isSuccess])
  {
    int v9 = +[PSISearchEntityTranslator zeroScorePSIGroupFromLabel:v12 type:v18 identifier:v13];
  }
  else
  {
    id v14 = PLSearchBackendIndexWorkerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v11 error];
      *(_DWORD *)buf = 138543618;
      id v20 = v7;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to decode search entity identifier: %{public}@, error: %@", buf, 0x16u);
    }
    int v9 = 0;
  }

LABEL_4:
  return v9;
}

+ (id)psiObjectForObject:(id)a3 fetchHelper:(id)a4 partialUpdateMask:(int64_t)a5 indexingContext:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v9 entity];
  id v13 = [v12 name];
  id v14 = +[PLManagedAsset entityName];
  int v15 = [v13 isEqualToString:v14];

  if (!v15)
  {
    v19 = [v9 entity];
    id v20 = [v19 name];
    __int16 v21 = +[PLManagedAlbum entityName];
    if ([v20 isEqualToString:v21])
    {
LABEL_8:

LABEL_9:
      uint64_t v25 = +[PSIAlbumTranslator psiCollectionFromAlbum:v9 indexingContext:v11];
LABEL_10:
      uint64_t v18 = (void *)v25;
      goto LABEL_11;
    }
    v22 = [v9 entity];
    uint64_t v23 = [v22 name];
    v24 = +[PLFetchingAlbum entityName];
    if ([v23 isEqualToString:v24])
    {

      goto LABEL_8;
    }
    [v9 entity];
    v27 = id v47 = v10;
    [v27 name];
    int v28 = v48 = v11;
    v29 = +[PLCloudSharedAlbum entityName];
    char v46 = [v28 isEqualToString:v29];

    id v11 = v48;
    id v10 = v47;

    if (v46) {
      goto LABEL_9;
    }
    v30 = [v9 entity];
    v31 = [v30 name];
    v32 = +[PLMemory entityName];
    int v33 = [v31 isEqualToString:v32];

    if (v33)
    {
      id v11 = v48;
      uint64_t v25 = +[PSIMemoryTranslator psiCollectionFromMemory:v9 indexingContext:v48];
      goto LABEL_10;
    }
    v34 = [v9 entity];
    v35 = [v34 name];
    id v36 = +[PLPhotosHighlight entityName];
    int v37 = [v35 isEqualToString:v36];

    if ((v37 & 1) == 0)
    {
      id v38 = [v9 entity];
      id v39 = [v38 name];
      v40 = +[PLGraphNode entityName];
      int v41 = [v39 isEqualToString:v40];

      if (v41)
      {
        id v42 = +[PLGraphNodeContainer newNodeContainerWithNode:v9];
        uint64_t v18 = +[PSISearchEntityTranslator psiGroupFromSearchEntity:v42];

LABEL_24:
        id v11 = v48;
        goto LABEL_11;
      }
      v43 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = [v9 entity];
        v45 = [v44 name];
        *(_DWORD *)buf = 138543362;
        int v50 = v45;
        _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Invalid entity to process for search indexing: %{public}@", buf, 0xCu);
      }
    }
    uint64_t v18 = 0;
    goto LABEL_24;
  }
  if (!a5) {
    a5 = 3;
  }
  id v16 = v9;
  id v17 = [v16 documentObservation];
  uint64_t v18 = +[PSIAssetTranslator psiAssetFromAsset:v16 fetchHelper:v10 propertySets:a5 graphData:MEMORY[0x1E4F1CC08] indexingContext:v11 documentObservation:v17];

LABEL_11:
  return v18;
}

@end