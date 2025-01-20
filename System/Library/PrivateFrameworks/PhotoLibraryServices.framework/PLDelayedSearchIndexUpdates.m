@interface PLDelayedSearchIndexUpdates
+ (void)_recordAssetIfNeededForRelationshipChange:(id)a3 flags:(int64_t)a4;
+ (void)recordAdditionalAssetAttributesIfNeeded:(id)a3;
+ (void)recordAlbumIfNeeded:(id)a3;
+ (void)recordAssetDescriptionIfNeeded:(id)a3;
+ (void)recordAssetIfNeeded:(id)a3;
+ (void)recordDetectedFaceIfNeeded:(id)a3;
+ (void)recordHighlightIfNeeded:(id)a3;
+ (void)recordMediaAnalysisAssetAttributesIfNeeded:(id)a3;
+ (void)recordMemoryIfNeeded:(id)a3;
+ (void)recordPersonIfNeeded:(id)a3;
@end

@implementation PLDelayedSearchIndexUpdates

+ (void)_recordAssetIfNeededForRelationshipChange:(id)a3 flags:(int64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v18 = v5;
    char v7 = [v5 isDeleted];
    v6 = v18;
    if ((v7 & 1) == 0)
    {
      v8 = [v18 uuid];

      v6 = v18;
      if (v8)
      {
        v9 = [v18 photoLibrary];
        v10 = [v9 libraryServicesManager];
        v11 = +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", [v10 wellKnownPhotoLibraryIdentifier]);
        int v12 = [v11 evaluateWithObject:v18];

        v6 = v18;
        if (v12)
        {
          v13 = [v18 uuid];
          v14 = [v18 photoLibrary];
          v15 = [v14 managedObjectContext];
          id v16 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v13 flags:a4 managedObjectContext:v15];

          v17 = [v18 photoLibrary];
          [v17 signalBackgroundProcessingNeeded];

          v6 = v18;
        }
      }
    }
  }
}

+ (void)recordMediaAnalysisAssetAttributesIfNeeded:(id)a3
{
  id v19 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled]&& PLPlatformSearchSupported())
  {
    v4 = [v19 changedValues];
    id v5 = [v4 objectForKeyedSubscript:@"characterRecognitionAttributes"];

    if (v5 || [v19 isDeleted]) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 0;
    }
    char v7 = [v4 objectForKeyedSubscript:@"visualSearchAttributes"];

    int v8 = [v19 isDeleted];
    if (v7) {
      int v9 = 1;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = v6 | 4;
    if (v9) {
      uint64_t v11 = v6 | 4;
    }
    else {
      uint64_t v11 = v6;
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"mediaAnalysisVersion"];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"mediaAnalysisImageVersion"];

    uint64_t v14 = [v4 objectForKeyedSubscript:@"imageEmbeddingVersion"];

    uint64_t v15 = [v4 objectForKeyedSubscript:@"videoEmbeddingVersion"];
    uint64_t v16 = v14 | v15;

    if (v16 | v12 | v13) {
      uint64_t v17 = v10;
    }
    else {
      uint64_t v17 = v11;
    }
    if (v17)
    {
      v18 = [v19 asset];
      [a1 _recordAssetIfNeededForRelationshipChange:v18 flags:v17];
    }
  }
}

+ (void)recordAdditionalAssetAttributesIfNeeded:(id)a3
{
  id v18 = a3;
  BOOL v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled];
  id v5 = v18;
  if (v4)
  {
    uint64_t v6 = [v18 changedValues];
    char v7 = [v6 objectForKeyedSubscript:@"reverseLocationDataIsValid"];
    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      int v9 = [v6 objectForKeyedSubscript:@"reverseLocationData"];
      BOOL v8 = v9 != 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"keywords"];

    uint64_t v11 = [v6 objectForKeyedSubscript:@"title"];

    uint64_t v12 = [v6 objectForKeyedSubscript:@"sceneClassifications"];

    uint64_t v13 = [v6 objectForKeyedSubscript:@"temporalSceneClassifications"];

    uint64_t v14 = [v6 objectForKeyedSubscript:@"cameraCaptureDevice"];

    uint64_t v15 = [v6 objectForKeyedSubscript:@"assetDescription"];

    uint64_t v16 = [v6 objectForKeyedSubscript:@"accessibilityDescription"];

    if (v8 || v10 || v11 || v12 || v13 || v14 || v15 || v16)
    {
      uint64_t v17 = [v18 asset];
      [a1 _recordAssetIfNeededForRelationshipChange:v17 flags:4];
    }
    id v5 = v18;
  }
}

+ (void)recordAssetDescriptionIfNeeded:(id)a3
{
  id v8 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled]&& PLPlatformSearchSupported())
  {
    BOOL v4 = [v8 changedValues];
    id v5 = [v4 objectForKeyedSubscript:@"longDescription"];

    if (([v8 isDeleted] & 1) != 0 || v5)
    {
      uint64_t v6 = [v8 assetAttributes];
      char v7 = [v6 asset];
      [a1 _recordAssetIfNeededForRelationshipChange:v7 flags:4];
    }
  }
}

+ (void)recordPersonIfNeeded:(id)a3
{
  id v11 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled]&& PLPlatformSearchSupported())
  {
    v3 = [v11 changedValues];
    if (([v11 isDeleted] & 1) != 0 || objc_msgSend(v11, "verifiedType") != 1) {
      goto LABEL_9;
    }
    BOOL v4 = [v3 objectForKeyedSubscript:@"fullName"];
    if (v4)
    {
    }
    else
    {
      id v5 = [v3 objectForKeyedSubscript:@"detectionType"];

      if (!v5)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    uint64_t v6 = [v11 personUUID];
    char v7 = [v11 photoLibrary];
    id v8 = [v7 managedObjectContext];
    id v9 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v6 flags:256 managedObjectContext:v8];

    uint64_t v10 = [v11 photoLibrary];
    [v10 signalBackgroundProcessingNeeded];

    goto LABEL_9;
  }
LABEL_10:
}

+ (void)recordDetectedFaceIfNeeded:(id)a3
{
  id v16 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled]&& PLPlatformSearchSupported())
  {
    BOOL v4 = [v16 associatedAssetForFaceOrTorso:1 orTemporal:1];
    id v5 = v4;
    if (!v4) {
      goto LABEL_14;
    }
    if ([v4 isDeleted]) {
      goto LABEL_14;
    }
    uint64_t v6 = [v16 associatedPersonForFaceOrTorso:1 orTemporal:1];
    int v7 = [v6 shouldIndexForSearch];

    if (!v7) {
      goto LABEL_14;
    }
    if ([v16 isDeleted])
    {
      [a1 _recordAssetIfNeededForRelationshipChange:v5 flags:4];
LABEL_14:

      goto LABEL_15;
    }
    id v8 = [v16 changedValues];
    if (([v16 isInserted] & 1) == 0)
    {
      id v9 = [v8 objectForKeyedSubscript:@"personForFace"];
      if (v9
        || ([v8 objectForKeyedSubscript:@"personForTemporalDetectedFaces"],
            (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        uint64_t v15 = [v8 objectForKeyedSubscript:@"ageType"];

        if (!v15) {
          goto LABEL_13;
        }
      }
    }
    uint64_t v10 = [v16 uuid];
    id v11 = [v16 photoLibrary];
    uint64_t v12 = [v11 managedObjectContext];
    id v13 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v10 flags:16 managedObjectContext:v12];

    uint64_t v14 = [v16 photoLibrary];
    [v14 signalBackgroundProcessingNeeded];

LABEL_13:
    goto LABEL_14;
  }
LABEL_15:
}

+ (void)recordMemoryIfNeeded:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled])
  {
    if (PLPlatformSearchSupported())
    {
      BOOL v4 = [v3 uuid];

      if (v4)
      {
        if ([v3 isDeleted]) {
          goto LABEL_7;
        }
        id v5 = [v3 photoLibrary];
        uint64_t v6 = [v5 libraryServicesManager];
        int v7 = +[PLMemory isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLMemory, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", [v6 wellKnownPhotoLibraryIdentifier]);
        char v8 = [v7 evaluateWithObject:v3];

        if ((v8 & 1) == 0)
        {
LABEL_7:
          uint64_t v10 = PLSearchBackendIndexStatusGetLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            id v11 = [v3 uuid];
            int v17 = 138412290;
            id v18 = v11;
            _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "property changes to memory: %@ indicate remove from index", (uint8_t *)&v17, 0xCu);
          }
          uint64_t v9 = 1;
        }
        else
        {
          uint64_t v9 = 128;
        }
        uint64_t v12 = [v3 uuid];
        id v13 = [v3 photoLibrary];
        uint64_t v14 = [v13 managedObjectContext];
        id v15 = +[PLBackgroundJobWorkItem insertSearchIndexWorkItemIfNeededWithIdentifier:v12 flags:v9 managedObjectContext:v14];

        id v16 = [v3 photoLibrary];
        [v16 signalBackgroundProcessingNeeded];
      }
    }
  }
}

+ (void)recordHighlightIfNeeded:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled])
  {
    if (PLPlatformSearchSupported())
    {
      BOOL v4 = [v3 uuid];

      if (v4)
      {
        id v5 = [v3 changedValues];
        if ([v3 isDeleted] & 1) != 0 || (objc_msgSend(v3, "isInserted")) {
          goto LABEL_31;
        }
        uint64_t v6 = [v5 objectForKeyedSubscript:@"verboseSmartDescription"];
        if (!v6)
        {
          uint64_t v6 = [v5 objectForKeyedSubscript:@"subtitle"];
          if (!v6)
          {
            uint64_t v6 = [v5 objectForKeyedSubscript:@"title"];
            if (!v6)
            {
              uint64_t v6 = [v5 objectForKeyedSubscript:@"startDate"];
              if (!v6)
              {
                uint64_t v6 = [v5 objectForKeyedSubscript:@"endDate"];
                if (!v6)
                {
                  uint64_t v6 = [v5 objectForKeyedSubscript:@"startTimeZoneOffset"];
                  if (!v6)
                  {
                    int v7 = [v5 objectForKeyedSubscript:@"endTimeZoneOffset"];
                    if (!v7)
                    {
                      char v8 = [v5 objectForKeyedSubscript:@"type"];
                      if (!v8)
                      {
                        uint64_t v9 = [v5 objectForKeyedSubscript:@"assets"];
                        if (!v9)
                        {
                          uint64_t v10 = [v5 objectForKeyedSubscript:@"dayGroupAssets"];
                          if (!v10)
                          {
                            id v11 = [v5 objectForKeyedSubscript:@"childDayGroupPhotosHighlights"];
                            if (!v11)
                            {
                              uint64_t v12 = [v5 objectForKeyedSubscript:@"moments"];
                              if (!v12)
                              {
                                id v13 = [v5 objectForKeyedSubscript:@"keyAssetPrivate"];
                                if (!v13)
                                {
                                  uint64_t v14 = [v5 objectForKeyedSubscript:@"dayGroupKeyAssetPrivate"];
                                  if (!v14)
                                  {
                                    id v15 = [v5 objectForKeyedSubscript:@"keyAssetShared"];
                                    if (!v15)
                                    {
                                      v24 = [v5 objectForKeyedSubscript:@"dayGroupKeyAssetShared"];

                                      if (!v24)
                                      {
LABEL_38:

                                        goto LABEL_39;
                                      }
LABEL_31:
                                      if (([v3 isDeleted] & 1) != 0
                                        || ([v3 isEligibleForSearchIndexing] & 1) == 0)
                                      {
                                        int v17 = PLSearchBackendIndexStatusGetLog();
                                        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                                        {
                                          id v18 = [v3 uuid];
                                          int v25 = 138412290;
                                          v26 = v18;
                                          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "property changes to highlight: %@ indicate remove from index", (uint8_t *)&v25, 0xCu);
                                        }
                                        uint64_t v16 = 1;
                                      }
                                      else
                                      {
                                        uint64_t v16 = 64;
                                      }
                                      uint64_t v19 = [v3 uuid];
                                      v20 = [v3 photoLibrary];
                                      v21 = [v20 managedObjectContext];
                                      id v22 = +[PLBackgroundJobWorkItem insertSearchIndexWorkItemIfNeededWithIdentifier:v19 flags:v16 managedObjectContext:v21];

                                      v23 = [v3 photoLibrary];
                                      [v23 signalBackgroundProcessingNeeded];

                                      goto LABEL_38;
                                    }

                                    uint64_t v14 = 0;
                                  }

                                  id v13 = 0;
                                }

                                uint64_t v12 = 0;
                              }

                              id v11 = 0;
                            }

                            uint64_t v10 = 0;
                          }

                          uint64_t v9 = 0;
                        }

                        char v8 = 0;
                      }

                      int v7 = 0;
                    }

                    uint64_t v6 = 0;
                  }
                }
              }
            }
          }
        }

        goto LABEL_31;
      }
    }
  }
LABEL_39:
}

+ (void)recordAlbumIfNeeded:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled])
  {
    if (PLPlatformSearchSupported())
    {
      BOOL v4 = [v3 uuid];

      if (v4)
      {
        if ([v3 isCandidateForSearchIndexing])
        {
          id v5 = [v3 changedValues];
          if (([v3 isDeleted] & 1) == 0 && (objc_msgSend(v3, "isInserted") & 1) == 0)
          {
            uint64_t v6 = [v5 objectForKeyedSubscript:@"trashedState"];
            if (v6
              || ([v5 objectForKeyedSubscript:@"startDate"],
                  (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
              || ([v5 objectForKeyedSubscript:@"endDate"],
                  (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
              || ([v5 objectForKeyedSubscript:@"assets"],
                  (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
            {
            }
            else
            {
              v20 = [v5 objectForKeyedSubscript:@"title"];

              if (!v20)
              {
LABEL_21:

                goto LABEL_22;
              }
            }
          }
          if ([v3 isDeleted]) {
            goto LABEL_17;
          }
          int v7 = [v3 photoLibrary];
          char v8 = [v7 libraryServicesManager];
          uint64_t v9 = +[PLGenericAlbum isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLGenericAlbum, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", [v8 wellKnownPhotoLibraryIdentifier]);
          int v10 = [v9 evaluateWithObject:v3];

          if (!v10)
          {
LABEL_17:
            id v13 = PLSearchBackendIndexStatusGetLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v14 = [v3 uuid];
              int v21 = 138412290;
              id v22 = v14;
              _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "property changes to album: %@ indicate remove from index", (uint8_t *)&v21, 0xCu);
            }
            uint64_t v12 = 1;
          }
          else if (([v3 isInserted] & 1) != 0 {
                 || ([v5 objectForKeyedSubscript:@"trashedState"],
          }
                     id v11 = objc_claimAutoreleasedReturnValue(),
                     v11,
                     v11))
          {
            uint64_t v12 = 34;
          }
          else
          {
            uint64_t v12 = 32;
          }
          id v15 = [v3 uuid];
          uint64_t v16 = [v3 photoLibrary];
          int v17 = [v16 managedObjectContext];
          id v18 = +[PLBackgroundJobWorkItem insertSearchIndexWorkItemIfNeededWithIdentifier:v15 flags:v12 managedObjectContext:v17];

          uint64_t v19 = [v3 photoLibrary];
          [v19 signalBackgroundProcessingNeeded];

          goto LABEL_21;
        }
      }
    }
  }
LABEL_22:
}

+ (void)recordAssetIfNeeded:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled])
  {
    if (PLPlatformSearchSupported())
    {
      BOOL v4 = [v3 uuid];

      if (v4)
      {
        int v5 = [v3 isEligibleForSearchIndexing];
        uint64_t v6 = [v3 changedValues];
        if (([v3 isDeleted] & 1) == 0)
        {
          if (v5) {
            goto LABEL_9;
          }
          if ([v3 isInserted]) {
            goto LABEL_30;
          }
          v34 = [v6 objectForKeyedSubscript:@"visibilityState"];
          if (v34
            || ([v6 objectForKeyedSubscript:@"savedAssetType"],
                (v34 = objc_claimAutoreleasedReturnValue()) != 0)
            || ([v6 objectForKeyedSubscript:@"hidden"],
                (v34 = objc_claimAutoreleasedReturnValue()) != 0))
          {
          }
          else
          {
            v35 = [v6 objectForKeyedSubscript:@"trashedState"];

            if (!v35) {
              goto LABEL_30;
            }
          }
        }
        int v7 = [v3 photoLibrary];
        char v8 = [v7 libraryServicesManager];
        uint64_t v9 = [v8 wellKnownPhotoLibraryIdentifier];

        if (v9 != 3)
        {
          uint64_t v27 = PLSearchBackendIndexStatusGetLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v28 = [v3 uuid];
            *(_DWORD *)buf = 138412290;
            v48 = v28;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "property changes to asset: %@ indicate remove from index", buf, 0xCu);
          }
          v29 = [v3 uuid];
          v30 = [v3 photoLibrary];
          v31 = [v30 managedObjectContext];
          id v32 = +[PLBackgroundJobWorkItem insertDeleteFromSearchIndexWorkItemIfNeededWithIdentifier:v29 managedObjectContext:v31];

LABEL_29:
          v33 = [v3 photoLibrary];
          [v33 signalBackgroundProcessingNeeded];

LABEL_30:
          goto LABEL_31;
        }
        if (!v5) {
          goto LABEL_30;
        }
LABEL_9:
        uint64_t v10 = [v6 objectForKeyedSubscript:@"dateCreated"];

        uint64_t v46 = [v6 objectForKeyedSubscript:@"favorite"];

        uint64_t v45 = [v6 objectForKeyedSubscript:@"kind"];

        uint64_t v44 = [v6 objectForKeyedSubscript:@"kindSubtype"];

        uint64_t v43 = [v6 objectForKeyedSubscript:@"depthType"];

        uint64_t v42 = [v6 objectForKeyedSubscript:@"avalanchePickType"];

        uint64_t v41 = [v6 objectForKeyedSubscript:@"playbackVariation"];

        uint64_t v40 = [v6 objectForKeyedSubscript:@"playbackStyle"];

        uint64_t v38 = [v6 objectForKeyedSubscript:@"visibilityState"];
        uint64_t v39 = v10 | v38;

        uint64_t v11 = [v6 objectForKeyedSubscript:@"savedAssetType"];

        uint64_t v12 = [v6 objectForKeyedSubscript:@"hidden"];

        uint64_t v13 = [v6 objectForKeyedSubscript:@"trashedState"];

        uint64_t v37 = [v6 objectForKeyedSubscript:@"dayGroupHighlightBeingAssets"];

        uint64_t v36 = [v6 objectForKeyedSubscript:@"albums"];

        uint64_t v14 = [v6 objectForKeyedSubscript:@"memoriesBeingCuratedAssets"];

        uint64_t v15 = [v6 objectForKeyedSubscript:@"moment"];

        uint64_t v16 = [v6 objectForKeyedSubscript:@"libraryScope"];

        uint64_t v17 = [v6 objectForKeyedSubscript:@"libraryScopeContributors"];

        int v18 = [v3 isInserted];
        if (v12) {
          int v19 = 1;
        }
        else {
          int v19 = v18;
        }
        if (v13) {
          int v19 = 1;
        }
        if (v11) {
          int v19 = 1;
        }
        if (v38) {
          int v19 = 1;
        }
        BOOL v20 = v19 == 0;
        uint64_t v21 = 14;
        if (v20) {
          uint64_t v21 = 0;
        }
        if (v39 | v11 | v12 | v13 | v46 | v45 | v44 | v43 | v42 | v41 | v40 | v37 | v36 | v14 | v15 | v16 | v17) {
          uint64_t v22 = v21 | 4;
        }
        else {
          uint64_t v22 = v21;
        }
        if (!v22) {
          goto LABEL_30;
        }
        uint64_t v23 = [v3 uuid];
        v24 = [v3 photoLibrary];
        int v25 = [v24 managedObjectContext];
        id v26 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v23 flags:v22 managedObjectContext:v25];

        goto LABEL_29;
      }
    }
  }
LABEL_31:
}

@end