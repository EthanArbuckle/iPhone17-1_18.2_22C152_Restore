@interface FCPuzzleController
- (FCAssetManager)assetManager;
- (FCCoreConfigurationManager)configurationManager;
- (FCPuzzleController)init;
- (FCPuzzleController)initWithContentDatabase:(id)a3 assetManager:(id)a4 puzzleTypeController:(id)a5 puzzleRecordSource:(id)a6 configurationManager:(id)a7;
- (FCPuzzleRecordSource)puzzleRecordSource;
- (FCPuzzleTypeController)puzzleTypeController;
- (NSCache)fastCache;
- (id)_cachedPuzzleForPuzzleID:(id)a3 fastCacheOnly:(BOOL)a4;
- (id)_cachedPuzzlesForPuzzleIDs:(id)a3 fastCacheOnly:(BOOL)a4;
- (id)_fetchOperationForPuzzleWithIDs:(id)a3;
- (id)createPuzzleForPuzzleType:(id)a3 identifier:(id)a4 title:(id)a5 subtitle:(id)a6 puzzleDescription:(id)a7 dataResourceID:(id)a8 authors:(id)a9 behaviorFlags:(int64_t)a10 publishDate:(id)a11 isPaid:(BOOL)a12 difficulty:(int64_t)a13 difficultyDescription:(id)a14 relatedPuzzleIDs:(id)a15 thumbnailLargeURL:(id)a16 loadDate:(id)a17 teaserClue:(id)a18 teaserAnswer:(id)a19 teaserInfo:(id)a20 teaserDirection:(id)a21 teaserNumber:(id)a22 language:(id)a23 blockedStorefrontIDs:(id)a24 allowedStorefrontIDs:(id)a25 minimumNewsVersion:(id)a26 isDeprecated:(BOOL)a27 isDraft:(BOOL)a28 lastModifiedDate:(id)a29;
- (id)fastCachedPuzzleForID:(id)a3;
- (id)jsonEncodableObject;
- (id)slowCachedPuzzleForID:(id)a3;
- (void)_fetchPuzzleForPuzzleID:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)_fetchPuzzlesForPuzzleIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)_refreshPuzzlesBasedOnAgeForPuzzles:(id)a3;
- (void)_savePuzzlesToCache:(id)a3;
- (void)puzzleFetchOperation:(id)a3 didFetchPuzzles:(id)a4;
- (void)savePuzzleToCache:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setFastCache:(id)a3;
- (void)setPuzzleRecordSource:(id)a3;
- (void)setPuzzleTypeController:(id)a3;
@end

@implementation FCPuzzleController

- (FCPuzzleController)initWithContentDatabase:(id)a3 assetManager:(id)a4 puzzleTypeController:(id)a5 puzzleRecordSource:(id)a6 configurationManager:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "assetManager != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPuzzleController initWithContentDatabase:assetManager:puzzleTypeController:puzzleRecordSource:configurationManager:]";
    __int16 v27 = 2080;
    v28 = "FCPuzzleController.m";
    __int16 v29 = 1024;
    int v30 = 55;
    __int16 v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleRecordSource != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPuzzleController initWithContentDatabase:assetManager:puzzleTypeController:puzzleRecordSource:configurationManager:]";
    __int16 v27 = 2080;
    v28 = "FCPuzzleController.m";
    __int16 v29 = 1024;
    int v30 = 56;
    __int16 v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)FCPuzzleController;
  v17 = [(FCPuzzleController *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetManager, a4);
    objc_storeStrong((id *)&v18->_puzzleRecordSource, a6);
    objc_storeStrong((id *)&v18->_puzzleTypeController, a5);
    v19 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    fastCache = v18->_fastCache;
    v18->_fastCache = v19;

    objc_storeStrong((id *)&v18->_configurationManager, a7);
    [(NSCache *)v18->_fastCache setEvictsObjectsWhenApplicationEntersBackground:0];
  }

  return v18;
}

- (FCPuzzleController)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPuzzleController init]";
    __int16 v9 = 2080;
    v10 = "FCPuzzleController.m";
    __int16 v11 = 1024;
    int v12 = 46;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCPuzzleController init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)createPuzzleForPuzzleType:(id)a3 identifier:(id)a4 title:(id)a5 subtitle:(id)a6 puzzleDescription:(id)a7 dataResourceID:(id)a8 authors:(id)a9 behaviorFlags:(int64_t)a10 publishDate:(id)a11 isPaid:(BOOL)a12 difficulty:(int64_t)a13 difficultyDescription:(id)a14 relatedPuzzleIDs:(id)a15 thumbnailLargeURL:(id)a16 loadDate:(id)a17 teaserClue:(id)a18 teaserAnswer:(id)a19 teaserInfo:(id)a20 teaserDirection:(id)a21 teaserNumber:(id)a22 language:(id)a23 blockedStorefrontIDs:(id)a24 allowedStorefrontIDs:(id)a25 minimumNewsVersion:(id)a26 isDeprecated:(BOOL)a27 isDraft:(BOOL)a28 lastModifiedDate:(id)a29
{
  id v56 = a3;
  id v35 = a4;
  id v55 = a5;
  id v73 = a6;
  id v72 = a7;
  id v71 = a8;
  id v70 = a9;
  v36 = self;
  id v69 = a11;
  id v68 = a14;
  id v67 = a15;
  id v66 = a16;
  id v65 = a17;
  id v64 = a18;
  id v63 = a19;
  id v62 = a20;
  id v61 = a21;
  id v60 = a22;
  id v59 = a23;
  id v58 = a24;
  id v57 = a25;
  id v37 = a26;
  id v38 = a29;
  v74 = v35;
  v39 = [(FCPuzzleController *)v36 fastCachedPuzzleForID:v35];
  v40 = v39;
  if (v39
    && ([v39 lastModifiedDate], v41 = objc_claimAutoreleasedReturnValue(), v41, v38)
    && v41
    && ([v40 lastModifiedDate],
        v42 = objc_claimAutoreleasedReturnValue(),
        char v43 = objc_msgSend(v38, "fc_isLaterThan:withPrecision:", v42, 2),
        v42,
        (v43 & 1) == 0))
  {
    v51 = v40;

    v50 = v55;
    v44 = v56;
  }
  else
  {
    v44 = v56;
    v45 = [v56 thumbnailDirectory];
    v46 = resolvedPuzzleTypeDifficultyWithPuzzleType(v56, a13);
    v47 = [v45 smallThumbnailForDate:v69 difficulty:v46];

    v48 = [(FCPuzzleController *)v36 assetManager];
    v49 = [v48 assetHandleForCKAssetURLString:v66 lifetimeHint:0];

    BYTE3(v54) = a28;
    BYTE2(v54) = a27;
    BYTE1(v54) = (a10 & 2) != 0;
    LOBYTE(v54) = a10 & 1;
    LOBYTE(v53) = a12;
    v50 = v55;
    v51 = -[FCPuzzle initWithIdentifier:title:subtitle:puzzleDescription:puzzleType:dataResourceID:authors:publishDate:isPaid:difficulty:difficultyDescription:relatedPuzzleIDs:thumbnailSmallImageAssetHandle:thumbnailLargeImageAssetHandle:loadDate:teaserClue:teaserAnswer:teaserInfo:teaserDirection:teaserNumber:language:blockedStorefrontIDs:allowedStorefrontIDs:minimumNewsVersion:showInfoModalOnFirstPlay:ignoreFromStatsAndStreaks:isDeprecated:isDraft:lastModifiedDate:]([FCPuzzle alloc], "initWithIdentifier:title:subtitle:puzzleDescription:puzzleType:dataResourceID:authors:publishDate:isPaid:difficulty:difficultyDescription:relatedPuzzleIDs:thumbnailSmallImageAssetHandle:thumbnailLargeImageAssetHandle:loadDate:teaserClue:teaserAnswer:teaserInfo:teaserDirection:teaserNumber:language:blockedStorefrontIDs:allowedStorefrontIDs:minimumNewsVersion:showInfoModalOnFirstPlay:ignoreFromStatsAndStreaks:isDeprecated:isDraft:lastModifiedDate:", v74, v55, v73, v72, v56, v71, v70, v69, v53, a13, v68, v67, v47,
            v49,
            v65,
            v64,
            v63,
            v62,
            v61,
            v60,
            v59,
            v58,
            v57,
            +[FCRestrictions integerRepresentationOfShortVersionString:v37], v54, v38);
    if (v51) {
      [(FCPuzzleController *)v36 savePuzzleToCache:v51];
    }
  }
  return v51;
}

id __397__FCPuzzleController_createPuzzleForPuzzleType_identifier_title_subtitle_puzzleDescription_dataResourceID_authors_behaviorFlags_publishDate_isPaid_difficulty_difficultyDescription_relatedPuzzleIDs_thumbnailLargeURL_loadDate_teaserClue_teaserAnswer_teaserInfo_teaserDirection_teaserNumber_language_blockedStorefrontIDs_allowedStorefrontIDs_minimumNewsVersion_isDeprecated_isDraft_lastModifiedDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)fastCachedPuzzleForID:(id)a3
{
  return [(FCPuzzleController *)self _cachedPuzzleForPuzzleID:a3 fastCacheOnly:1];
}

- (id)slowCachedPuzzleForID:(id)a3
{
  return [(FCPuzzleController *)self _cachedPuzzleForPuzzleID:a3 fastCacheOnly:0];
}

- (void)savePuzzleToCache:(id)a3
{
  id v4 = a3;
  id v6 = [(FCPuzzleController *)self fastCache];
  v5 = [v4 identifier];
  [v6 setObject:v4 forKey:v5];
}

- (void)_fetchPuzzleForPuzzleID:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    id v23 = v12;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __107__FCPuzzleController__fetchPuzzleForPuzzleID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke;
    v21[3] = &unk_1E5B4CA60;
    v17 = &v22;
    id v22 = v15;
    [(FCPuzzleController *)self _fetchPuzzlesForPuzzleIDs:v16 cachePolicy:v13 qualityOfService:a5 callbackQueue:v14 completionHandler:v21];

LABEL_6:
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPuzzleController _fetchPuzzleForPuzzleID:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
    __int16 v26 = 2080;
    __int16 v27 = "FCPuzzleController.m";
    __int16 v28 = 1024;
    int v29 = 206;
    __int16 v30 = 2114;
    __int16 v31 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v15) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v15)
  {
LABEL_5:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__FCPuzzleController__fetchPuzzleForPuzzleID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1E5B4CA88;
    v17 = &v20;
    id v20 = v15;
    dispatch_async(v14, block);
    goto LABEL_6;
  }
LABEL_7:
}

void __107__FCPuzzleController__fetchPuzzleForPuzzleID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v7 = [a2 allValues];
    id v6 = [v7 firstObject];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v6, v5);
  }
}

uint64_t __107__FCPuzzleController__fetchPuzzleForPuzzleID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchPuzzlesForPuzzleIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleIDs != nil");
    *(_DWORD *)buf = 136315906;
    v52 = "-[FCPuzzleController _fetchPuzzlesForPuzzleIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
    __int16 v53 = 2080;
    uint64_t v54 = "FCPuzzleController.m";
    __int16 v55 = 1024;
    int v56 = 230;
    __int16 v57 = 2114;
    id v58 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v14)
    {
LABEL_4:
      if (v15)
      {
        if ([v12 count])
        {
          id v35 = v15;
          v36 = v14;
          id v16 = [MEMORY[0x1E4F1CA60] dictionary];
          v17 = [MEMORY[0x1E4F1CA48] array];
          if (v13)
          {
            [MEMORY[0x1E4F1CA48] arrayWithArray:v12];
            v17 = id v18 = v17;
          }
          else
          {
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v34 = v12;
            id v18 = v12;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v50 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              int64_t v33 = a5;
              uint64_t v21 = *(void *)v44;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v44 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                  objc_super v24 = [(FCPuzzleController *)self fastCache];
                  v25 = [v24 objectForKey:v23];

                  if (v25) {
                    [v16 setObject:v25 forKey:v23];
                  }
                  else {
                    [v17 addObject:v23];
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v50 count:16];
              }
              while (v20);
              id v13 = 0;
              id v12 = v34;
              a5 = v33;
            }
          }

          id v14 = v36;
          if ([v17 count])
          {
            id v26 = [(FCPuzzleController *)self _fetchOperationForPuzzleWithIDs:v17];
            [v26 setQualityOfService:a5];
            id v15 = v35;
            if (a5 == 9) {
              uint64_t v27 = -1;
            }
            else {
              uint64_t v27 = a5 == 33 || a5 == 25;
            }
            [v26 setRelativePriority:v27];
            objc_msgSend(v26, "setCachePolicy:", objc_msgSend(v13, "cachePolicy"));
            [v13 maximumCachedAge];
            objc_msgSend(v26, "setMaximumCachedAge:");
            [v26 setFetchCompletionQueue:v36];
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_4;
            v40[3] = &unk_1E5B4CC58;
            id v41 = v16;
            id v42 = v35;
            id v28 = v16;
            [v26 setFetchCompletionBlock:v40];
            int v29 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
            [v29 addOperation:v26];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_6;
            block[3] = &unk_1E5B4C7C0;
            id v15 = v35;
            id v38 = v16;
            id v39 = v35;
            id v26 = v16;
            dispatch_async(v36, block);

            id v28 = v39;
          }
        }
        else
        {
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
          v47[3] = &unk_1E5B4C7C0;
          id v49 = v15;
          v48 = v14;
          __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2((uint64_t)v47);
        }
        goto LABEL_36;
      }
      goto LABEL_34;
    }
  }
  else if (v14)
  {
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "callbackQueue != nil");
    *(_DWORD *)buf = 136315906;
    v52 = "-[FCPuzzleController _fetchPuzzlesForPuzzleIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
    __int16 v53 = 2080;
    uint64_t v54 = "FCPuzzleController.m";
    __int16 v55 = 1024;
    int v56 = 231;
    __int16 v57 = 2114;
    id v58 = v31;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v15)
  {
LABEL_34:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
      *(_DWORD *)buf = 136315906;
      v52 = "-[FCPuzzleController _fetchPuzzlesForPuzzleIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
      __int16 v53 = 2080;
      uint64_t v54 = "FCPuzzleController.m";
      __int16 v55 = 1024;
      int v56 = 232;
      __int16 v57 = 2114;
      id v58 = v32;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
LABEL_36:
}

void __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E5B4CA88;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (![v8 status])
  {
    uint64_t v3 = [v8 fetchedObject];
    if (v3) {
      [*(id *)(a1 + 32) addEntriesFromDictionary:v3];
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_26_0);
  uint64_t v6 = a1 + 32;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v6 + 8);
  if ([v4 count])
  {
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    id v7 = [v8 error];
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v7);
  }
}

uint64_t __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = [a3 puzzleType];
  uint64_t v4 = +[FCTagController isTagAllowedForNewsVersion:v3] ^ 1;

  return v4;
}

uint64_t __109__FCPuzzleController__fetchPuzzlesForPuzzleIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)_cachedPuzzleForPuzzleID:(id)a3 fastCacheOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v14 = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    __int16 v9 = [(FCPuzzleController *)self _cachedPuzzlesForPuzzleIDs:v8 fastCacheOnly:v4];
    v10 = [v9 allValues];
    __int16 v11 = [v10 firstObject];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleID != nil");
      *(_DWORD *)buf = 136315906;
      id v16 = "-[FCPuzzleController _cachedPuzzleForPuzzleID:fastCacheOnly:]";
      __int16 v17 = 2080;
      id v18 = "FCPuzzleController.m";
      __int16 v19 = 1024;
      int v20 = 303;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    __int16 v11 = 0;
  }

  return v11;
}

- (id)_cachedPuzzlesForPuzzleIDs:(id)a3 fastCacheOnly:(BOOL)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleIDs != nil");
    *(_DWORD *)buf = 136315906;
    v36 = "-[FCPuzzleController _cachedPuzzlesForPuzzleIDs:fastCacheOnly:]";
    __int16 v37 = 2080;
    id v38 = "FCPuzzleController.m";
    __int16 v39 = 1024;
    int v40 = 310;
    __int16 v41 = 2114;
    id v42 = v25;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v14 = [(FCPuzzleController *)self fastCache];
        id v15 = [v14 objectForKey:v13];

        if (v15) {
          [v6 setObject:v15 forKey:v13];
        }
        else {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v10);
  }

  if ([v7 count] && !a4)
  {
    id v16 = [(FCPuzzleController *)self configurationManager];
    __int16 v17 = [v16 configuration];

    id v18 = [v17 puzzlesConfig];
    __int16 v19 = [v18 difficultyDescriptions];
    int v20 = [(FCPuzzleController *)self puzzleRecordSource];
    __int16 v21 = [v20 cachedRecordsWithIDs:v7];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__FCPuzzleController__cachedPuzzlesForPuzzleIDs_fastCacheOnly___block_invoke;
    v27[3] = &unk_1E5B50B18;
    v27[4] = self;
    id v28 = v19;
    id v29 = v6;
    id v22 = v19;
    [v21 enumerateRecordsAndInterestTokensWithBlock:v27];
  }
  objc_msgSend(v6, "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_32_1);
  uint64_t v23 = [v6 allValues];
  [(FCPuzzleController *)self _refreshPuzzlesBasedOnAgeForPuzzles:v23];

  return v6;
}

void __63__FCPuzzleController__cachedPuzzlesForPuzzleIDs_fastCacheOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 24);
  id v7 = [v14 puzzleTypeID];
  id v8 = [v6 cachedPuzzleTypeForID:v7];

  if (v8)
  {
    uint64_t v9 = [FCPuzzle alloc];
    uint64_t v10 = [*(id *)(a1 + 32) assetManager];
    uint64_t v11 = [(FCPuzzle *)v9 initWithPuzzleRecord:v14 puzzleType:v8 assetManager:v10 interestToken:v5 difficultyDescriptions:*(void *)(a1 + 40)];

    id v12 = *(void **)(a1 + 48);
    uint64_t v13 = [(FCPuzzle *)v11 identifier];
    [v12 setObject:v11 forKey:v13];
  }
}

uint64_t __63__FCPuzzleController__cachedPuzzlesForPuzzleIDs_fastCacheOnly___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = [a3 puzzleType];
  uint64_t v4 = +[FCTagController isTagAllowedForNewsVersion:v3] ^ 1;

  return v4;
}

- (void)_refreshPuzzlesBasedOnAgeForPuzzles:(id)a3
{
  id v16 = self;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "loadDate", v16);
        uint64_t v11 = [v10 dateByAddingTimeInterval:3600.0];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        int v13 = objc_msgSend(v11, "fc_isEarlierThan:", v12);

        if (v13)
        {
          id v14 = [v9 identifier];
          [v4 addObject:v14];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  if ([v4 count])
  {
    id v15 = [(FCPuzzleController *)v16 _fetchOperationForPuzzleWithIDs:v4];
    [v15 setQualityOfService:17];
    [v15 setRelativePriority:-1];
    [v15 setCachePolicy:1];
    [v15 start];
  }
}

- (void)_savePuzzlesToCache:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__FCPuzzleController__savePuzzlesToCache___block_invoke;
  v3[3] = &unk_1E5B50B40;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

uint64_t __42__FCPuzzleController__savePuzzlesToCache___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) savePuzzleToCache:a2];
}

- (id)jsonEncodableObject
{
  v2 = [(FCPuzzleController *)self puzzleRecordSource];
  id v3 = [v2 jsonEncodableObject];

  return v3;
}

- (id)_fetchOperationForPuzzleWithIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [FCPuzzleFetchOperation alloc];
  uint64_t v6 = [(FCPuzzleController *)self puzzleTypeController];
  uint64_t v7 = [(FCPuzzleController *)self puzzleRecordSource];
  id v8 = [(FCPuzzleController *)self assetManager];
  uint64_t v9 = [(FCPuzzleController *)self configurationManager];
  uint64_t v10 = [(FCPuzzleFetchOperation *)v5 initWithPuzzleIDs:v4 puzzleTypeController:v6 puzzleRecordSource:v7 assetManager:v8 configurationManager:v9 delegate:self];

  return v10;
}

- (void)puzzleFetchOperation:(id)a3 didFetchPuzzles:(id)a4
{
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (FCPuzzleRecordSource)puzzleRecordSource
{
  return self->_puzzleRecordSource;
}

- (void)setPuzzleRecordSource:(id)a3
{
}

- (FCPuzzleTypeController)puzzleTypeController
{
  return self->_puzzleTypeController;
}

- (void)setPuzzleTypeController:(id)a3
{
}

- (NSCache)fastCache
{
  return self->_fastCache;
}

- (void)setFastCache:(id)a3
{
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_fastCache, 0);
  objc_storeStrong((id *)&self->_puzzleTypeController, 0);
  objc_storeStrong((id *)&self->_puzzleRecordSource, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end