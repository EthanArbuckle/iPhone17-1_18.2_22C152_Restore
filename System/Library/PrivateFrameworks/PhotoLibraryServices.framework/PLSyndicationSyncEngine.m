@interface PLSyndicationSyncEngine
+ (double)maxSpotlightQueryTimeInterval;
+ (double)minSpotlightQueryTimeInterval;
+ (void)_recursiveFindStartDateForMessagesSpotlightItemsWithStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
+ (void)findStartDateForMessagesSpotlightItemsWithCompletionHandler:(id)a3;
- (BOOL)_canHandleSearchableItem:(id)a3 forQueryType:(int64_t)a4;
- (BOOL)_deleteConversationWithSyndicationIdentifiers:(id)a3 library:(id)a4;
- (BOOL)_deleteGuestAssetWithSyndicationIdentifiers:(id)a3 library:(id)a4;
- (BOOL)_isQueryTypeSupported:(int64_t)a3;
- (BOOL)syncSyndicationItemWithUniqueIdentifier:(id)a3 bundleID:(id)a4 queryType:(int64_t)a5 library:(id)a6 error:(id *)a7;
- (PLSyndicationSyncEngine)initWithQueryTypes:(id)a3 savedAssetTypeMask:(unsigned int)a4 delegate:(id)a5;
- (PLSyndicationSyncEngineDelegate)delegate;
- (void)_changeSyncRangeDenominatorWithInterrupted:(BOOL)a3 success:(BOOL)a4 library:(id)a5;
- (void)_createOrUpdateObjectFromSearchableItem:(id)a3 library:(id)a4 fullIndexSyncStartDate:(id)a5;
- (void)_processSearchableItem:(id)a3 forQueryType:(int64_t)a4 library:(id)a5 fullIndexSyncStartDate:(id)a6;
- (void)_processZombieItem:(id)a3 library:(id)a4;
- (void)_processZombieItems:(id)a3 library:(id)a4;
- (void)_updateSyncTokenWithDate:(id)a3 queryType:(int64_t)a4 library:(id)a5 syncTokenIsCurrent:(BOOL)a6;
- (void)syncSyndicationItemsWithStartDate:(id)a3 endDate:(id)a4 queryType:(int64_t)a5 library:(id)a6 completion:(id)a7;
@end

@implementation PLSyndicationSyncEngine

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suppportedQueryTypes, 0);
}

- (PLSyndicationSyncEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLSyndicationSyncEngineDelegate *)WeakRetained;
}

- (BOOL)syncSyndicationItemWithUniqueIdentifier:(id)a3 bundleID:(id)a4 queryType:(int64_t)a5 library:(id)a6 error:(id *)a7
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v29[0] = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v15 = PLSyndicationSearchAttributes();
  v16 = PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers(v14, a5, v12, v15);

  v17 = [v16 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v19 = [v13 globalValues];
    v20 = [v19 lastFullIndexSyndicationSyncStartDate];
    [(PLSyndicationSyncEngine *)self _processSearchableItem:v17 forQueryType:a5 library:v13 fullIndexSyncStartDate:v20];
  }
  else
  {
    v19 = [NSString stringWithFormat:@"No CSSI found for %@ with bundleID %@", v11, v12];
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C500];
    uint64_t v27 = *MEMORY[0x1E4F28228];
    v28 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v23 = [v21 errorWithDomain:v22 code:47017 userInfo:v20];
    v24 = v23;
    if (a7) {
      *a7 = v23;
    }
  }
  return isKindOfClass & 1;
}

- (void)syncSyndicationItemsWithStartDate:(id)a3 endDate:(id)a4 queryType:(int64_t)a5 library:(id)a6 completion:(id)a7
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void, void *))a7;
  if ((unint64_t)(a5 - 1) > 3) {
    v16 = 0;
  }
  else {
    v16 = off_1E5867FF0[a5 - 1];
  }
  v17 = v16;
  if ([(PLSyndicationSyncEngine *)self _isQueryTypeSupported:a5])
  {
    [v13 timeIntervalSinceReferenceDate];
    if (v18 <= 0.0)
    {
      v43 = PLSyndicationGetLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v99 = 138543618;
        *(void *)&v99[4] = v17;
        *(_WORD *)&v99[12] = 2114;
        *(void *)&v99[14] = v13;
        _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "[sync] invalid %{public}@ sync date: %{public}@, resetting to reference date", v99, 0x16u);
      }

      v44 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
      [(PLSyndicationSyncEngine *)self _updateSyncTokenWithDate:v44 queryType:a5 library:v14 syncTokenIsCurrent:0];

      v45 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v103 = *MEMORY[0x1E4F28228];
      v104 = @"sync date invalid";
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
      v47 = [v45 errorWithDomain:*MEMORY[0x1E4F8C500] code:50003 userInfo:v46];
      v15[2](v15, 0, v47);
    }
    else
    {
      *(void *)v99 = 0;
      *(void *)&v99[8] = v99;
      *(void *)&v99[16] = 0x3032000000;
      v100 = __Block_byref_object_copy__88497;
      v101 = __Block_byref_object_dispose__88498;
      id v102 = 0;
      v19 = [(PLSyndicationSyncEngine *)self delegate];
      char v20 = [v19 syncManager:self shouldContinueWithLibrary:v14];

      if (v20)
      {
        if (a5 == 4)
        {
          v21 = [v14 globalValues];
          uint64_t v22 = [v21 inProgressFullIndexSyndicationSyncDate];
          BOOL v23 = v22 == 0;

          if (v23)
          {
            v24 = [v14 globalValues];
            [v24 setInProgressFullIndexSyndicationSyncDate:v12];

            v25 = [MEMORY[0x1E4F1C9C8] now];
            v26 = [v14 globalValues];
            [v26 setLastFullIndexSyndicationSyncStartDate:v25];
          }
        }
        objc_initWeak(&location, self);
        uint64_t v27 = v13;
        id v28 = v12;
        v29 = v27;
        id v30 = v27;
        v31 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v32 = [v31 compare:v30];
        v60 = v31;
        v61 = v30;
        id v62 = v30;
        id v12 = v28;
        if (v32 == -1)
        {
          id v62 = v31;
        }
        v33 = PLSyndicationGetLog();
        id v13 = v29;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          int64_t v92 = (int64_t)v17;
          __int16 v93 = 2114;
          id v94 = v12;
          __int16 v95 = 2114;
          v96 = v61;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "[sync] starting %{public}@ spotlight query to sync syndication items with start date: %{public}@, end date: %{public}@", buf, 0x20u);
        }

        if (a5 == 3)
        {
          BOOL v34 = v32 == -1;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_70;
          v72[3] = &unk_1E5870A80;
          objc_copyWeak(&v75, &location);
          id v36 = v14;
          id v73 = v36;
          v74 = v99;
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_72;
          v63[3] = &unk_1E5870A58;
          v69 = v99;
          v64 = v17;
          objc_copyWeak(v70, &location);
          id v65 = v62;
          v70[1] = (id)3;
          id v37 = v36;
          BOOL v71 = v34;
          id v66 = v37;
          v67 = self;
          v68 = v15;
          [WeakRetained executeQueryForSyncManager:self type:3 startDate:v12 endDate:v61 batchHandler:v72 completionHandler:v63];

          objc_destroyWeak(v70);
          objc_destroyWeak(&v75);
        }
        else
        {
          v53 = [v14 globalValues];
          v58 = [v53 lastFullIndexSyndicationSyncStartDate];
          BOOL v54 = v32 == -1;

          id v57 = objc_loadWeakRetained((id *)&self->_delegate);
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke;
          v85[3] = &unk_1E5870A30;
          objc_copyWeak(v89, &location);
          id v55 = v14;
          id v86 = v55;
          v89[1] = (id)a5;
          v59 = v58;
          v87 = v59;
          v88 = v99;
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_2;
          v76[3] = &unk_1E5870A58;
          v82 = v99;
          v77 = v17;
          objc_copyWeak(v83, &location);
          id v78 = v62;
          v83[1] = (id)a5;
          id v56 = v55;
          BOOL v84 = v54;
          id v79 = v56;
          v80 = self;
          v81 = v15;
          [v57 executeQueryForSyncManager:self type:a5 startDate:v12 endDate:v61 itemHandler:v85 completionHandler:v76];

          objc_destroyWeak(v83);
          objc_destroyWeak(v89);
        }
        objc_destroyWeak(&location);
      }
      else
      {
        v48 = PLSyndicationGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          int64_t v92 = a5;
          _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_DEFAULT, "[sync] sync for type: %td interrupted by mutex", buf, 0xCu);
        }

        v49 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v97 = *MEMORY[0x1E4F28228];
        v98 = @"shouldStopUsingSyndicationIngestLibrary";
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
        uint64_t v51 = [v49 errorWithDomain:*MEMORY[0x1E4F8C500] code:50003 userInfo:v50];
        v52 = *(void **)(*(void *)&v99[8] + 40);
        *(void *)(*(void *)&v99[8] + 40) = v51;

        v15[2](v15, 0, *(void **)(*(void *)&v99[8] + 40));
      }
      _Block_object_dispose(v99, 8);
    }
  }
  else
  {
    v38 = PLSyndicationGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v99 = 134217984;
      *(void *)&v99[4] = a5;
      _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "[sync] unsupported query type: %td", v99, 0xCu);
    }

    v39 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v105 = *MEMORY[0x1E4F28228];
    v40 = [@"unsupported query type: " stringByAppendingString:v17];
    v106[0] = v40;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:&v105 count:1];
    v42 = [v39 errorWithDomain:*MEMORY[0x1E4F8C500] code:50003 userInfo:v41];
    v15[2](v15, 0, v42);
  }
}

void __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = [WeakRetained delegate];
  int v8 = [v7 syncManager:WeakRetained shouldContinueWithLibrary:*(void *)(a1 + 32)];

  if (v8)
  {
    [WeakRetained _processSearchableItem:v5 forQueryType:*(void *)(a1 + 64) library:*(void *)(a1 + 32) fullIndexSyncStartDate:*(void *)(a1 + 40)];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"shouldStopUsingSyndicationIngestLibrary";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v12 = [v9 errorWithDomain:v10 code:50003 userInfo:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if (a3) {
      *a3 = 1;
    }
  }
}

void __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3) {
    goto LABEL_2;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id v14 = PLSyndicationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)char v20 = 138543618;
      *(void *)&v20[4] = v15;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v16;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "[sync] %{public}@ (MUTEX) query completion handler error not set, reporting %@", v20, 0x16u);
    }

    id v3 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v3)
    {
LABEL_2:
      v4 = [v3 domain];
      if ([v4 isEqualToString:*MEMORY[0x1E4F229E0]])
      {
        uint64_t v5 = [v3 code];

        if (v5 == -2003)
        {
          v6 = PLSyndicationGetLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = *(void *)(a1 + 32);
            *(_DWORD *)char v20 = 138543362;
            *(void *)&v20[4] = v7;
            int v8 = "[sync] %{public}@ spotlight search query was cancelled";
            v9 = v6;
            os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
            uint32_t v11 = 12;
LABEL_9:
            _os_log_impl(&dword_19B3C7000, v9, v10, v8, v20, v11);
            goto LABEL_10;
          }
          goto LABEL_10;
        }
      }
      else
      {
      }
      v6 = PLSyndicationGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)char v20 = 138543618;
        *(void *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = v3;
        int v8 = "[sync] %{public}@ spotlight search query failed with error: %@";
        v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        uint32_t v11 = 22;
        goto LABEL_9;
      }
LABEL_10:
      uint64_t v13 = 0;
      goto LABEL_18;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [WeakRetained _updateSyncTokenWithDate:*(void *)(a1 + 40) queryType:*(void *)(a1 + 88) library:*(void *)(a1 + 48) syncTokenIsCurrent:*(unsigned __int8 *)(a1 + 96)];

  v6 = PLSyndicationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)char v20 = 138543618;
    *(void *)&v20[4] = v18;
    *(_WORD *)&v20[12] = 2114;
    *(void *)&v20[14] = v19;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "[sync] finished %{public}@ spotlight query to sync syndication items, setting sync token date: %{public}@", v20, 0x16u);
  }
  id v3 = 0;
  uint64_t v13 = 1;
LABEL_18:

  objc_msgSend(*(id *)(a1 + 56), "_changeSyncRangeDenominatorWithInterrupted:success:library:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0, v13, *(void *)(a1 + 48), *(_OWORD *)v20, *(void *)&v20[16], v21);
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_70(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = [WeakRetained delegate];
  int v8 = [v7 syncManager:WeakRetained shouldContinueWithLibrary:*(void *)(a1 + 32)];

  if (v8)
  {
    v9 = PLSyndicationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v10 = [*(id *)(a1 + 32) libraryID];
      *(_DWORD *)buf = 138412290;
      char v20 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[sync] processing zombie items in %@", buf, 0xCu);
    }
    [WeakRetained _processZombieItems:v5 library:*(void *)(a1 + 32)];
  }
  else
  {
    uint32_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F8C500];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    uint64_t v18 = @"shouldStopUsingSyndicationIngestLibrary";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v14 = [v11 errorWithDomain:v12 code:50003 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if (a3) {
      *a3 = 1;
    }
  }
}

void __98__PLSyndicationSyncEngine_syncSyndicationItemsWithStartDate_endDate_queryType_library_completion___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3) {
    goto LABEL_2;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v14 = PLSyndicationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)char v20 = 138543618;
      *(void *)&v20[4] = v15;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v16;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "[sync] %{public}@ (MUTEX) query completion handler error not set, reporting %@", v20, 0x16u);
    }

    id v3 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v3)
    {
LABEL_2:
      v4 = [v3 domain];
      if ([v4 isEqualToString:*MEMORY[0x1E4F229E0]])
      {
        uint64_t v5 = [v3 code];

        if (v5 == -2003)
        {
          v6 = PLSyndicationGetLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = *(void *)(a1 + 32);
            *(_DWORD *)char v20 = 138543362;
            *(void *)&v20[4] = v7;
            int v8 = "[sync] %{public}@ spotlight search query was cancelled";
            v9 = v6;
            os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
            uint32_t v11 = 12;
LABEL_9:
            _os_log_impl(&dword_19B3C7000, v9, v10, v8, v20, v11);
            goto LABEL_10;
          }
          goto LABEL_10;
        }
      }
      else
      {
      }
      v6 = PLSyndicationGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)char v20 = 138543618;
        *(void *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = v3;
        int v8 = "[sync] %{public}@ spotlight search query failed with error: %@";
        v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        uint32_t v11 = 22;
        goto LABEL_9;
      }
LABEL_10:
      uint64_t v13 = 0;
      goto LABEL_18;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [WeakRetained _updateSyncTokenWithDate:*(void *)(a1 + 40) queryType:*(void *)(a1 + 88) library:*(void *)(a1 + 48) syncTokenIsCurrent:*(unsigned __int8 *)(a1 + 96)];

  v6 = PLSyndicationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)char v20 = 138543618;
    *(void *)&v20[4] = v18;
    *(_WORD *)&v20[12] = 2114;
    *(void *)&v20[14] = v19;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "[sync] finished %{public}@ spotlight query to sync syndication items, setting sync token date: %{public}@", v20, 0x16u);
  }
  id v3 = 0;
  uint64_t v13 = 1;
LABEL_18:

  objc_msgSend(*(id *)(a1 + 56), "_changeSyncRangeDenominatorWithInterrupted:success:library:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0, v13, *(void *)(a1 + 48), *(_OWORD *)v20, *(void *)&v20[16], v21);
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_changeSyncRangeDenominatorWithInterrupted:(BOOL)a3 success:(BOOL)a4 library:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v7 = a5;
  if (v6 || v5)
  {
    id v20 = v7;
    int v8 = [v7 globalValues];
    [v8 syndicationSyncRangeDenominator];
    double v10 = v9;

    double v11 = v10 + v10;
    if (!v6) {
      double v11 = v10;
    }
    double v12 = fmax(v10 * 0.75, 1.0);
    if (v5) {
      double v13 = v12;
    }
    else {
      double v13 = v11;
    }
    [(id)objc_opt_class() maxSpotlightQueryTimeInterval];
    double v15 = v14;
    [(id)objc_opt_class() minSpotlightQueryTimeInterval];
    id v7 = v20;
    double v17 = v15 / v16;
    if (v13 >= v17) {
      double v18 = v17;
    }
    else {
      double v18 = v13;
    }
    if (vabdd_f64(v18, v10) > 2.22044605e-16)
    {
      uint64_t v19 = [v20 globalValues];
      [v19 setSyndicationSyncRangeDenominator:v18];

      id v7 = v20;
    }
  }
}

- (void)_updateSyncTokenWithDate:(id)a3 queryType:(int64_t)a4 library:(id)a5 syncTokenIsCurrent:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a3;
  id v9 = a5;
  double v10 = v9;
  switch(a4)
  {
    case 1:
      double v11 = [v9 globalValues];
      [v11 setLastAttachmentSyndicationSyncDate:v14];
      goto LABEL_9;
    case 2:
      double v11 = [v9 globalValues];
      [v11 setLastChatSyndicationSyncDate:v14];
      goto LABEL_9;
    case 3:
      double v11 = [v9 globalValues];
      [v11 setLastDeleteSyndicationSyncDate:v14];
      goto LABEL_9;
    case 4:
      double v12 = [v9 globalValues];
      double v11 = v12;
      if (v6) {
        id v13 = 0;
      }
      else {
        id v13 = v14;
      }
      [v12 setInProgressFullIndexSyndicationSyncDate:v13];
LABEL_9:

      break;
    default:
      break;
  }
}

- (void)_processSearchableItem:(id)a3 forQueryType:(int64_t)a4 library:(id)a5 fullIndexSyncStartDate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __94__PLSyndicationSyncEngine__processSearchableItem_forQueryType_library_fullIndexSyncStartDate___block_invoke;
  v16[3] = &unk_1E5870A08;
  v16[4] = self;
  id v17 = v10;
  id v19 = v12;
  int64_t v20 = a4;
  id v18 = v11;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [v14 performTransactionAndWait:v16];
}

void __94__PLSyndicationSyncEngine__processSearchableItem_forQueryType_library_fullIndexSyncStartDate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _canHandleSearchableItem:*(void *)(a1 + 40) forQueryType:*(void *)(a1 + 64)])
  {
    v2 = [*(id *)(a1 + 40) attributeSet];
    id v3 = [v2 attributeDictionary];
    v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F230C0]];
    int v5 = [v4 BOOLValue];

    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    if (v5) {
      [v6 _processZombieItem:v7 library:v8];
    }
    else {
      [v6 _createOrUpdateObjectFromSearchableItem:v7 library:v8 fullIndexSyncStartDate:*(void *)(a1 + 56)];
    }
  }
  else
  {
    id v9 = PLSyndicationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "[sync] skipping unexpected searchable item %@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v11 = [*(id *)(a1 + 48) managedObjectContext];
  [v11 refreshAllObjects];
}

- (BOOL)_canHandleSearchableItem:(id)a3 forQueryType:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 attributeSet];
  uint64_t v7 = [v6 attributeDictionary];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F230C0]];
  char v9 = [v8 BOOLValue];

  switch(a4)
  {
    case 1:
    case 4:
      char v10 = PLSearchableItemRepresentsAsset(v5);
      goto LABEL_5;
    case 2:
      char v10 = PLSearchableItemRepresentsConversation(v5);
LABEL_5:
      char v9 = v10;
      break;
    case 3:
      break;
    default:
      char v9 = 0;
      break;
  }

  return v9;
}

- (void)_createOrUpdateObjectFromSearchableItem:(id)a3 library:(id)a4 fullIndexSyncStartDate:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v23 = 0;
  if ((PLSearchableItemRepresentsAsset(v7) & 1) != 0 || PLSearchableItemRepresentsConversation(v7))
  {
    char v10 = (objc_class *)objc_opt_class();
    if (v10)
    {
      id v11 = v10;
      char v22 = 1;
      id v21 = 0;
      int v12 = [(objc_class *)v10 createOrUpdateObjectFromSearchableItem:v7 library:v8 fullIndexSyncStartDate:v9 createIfNeeded:1 didCreate:&v23 isSyndicatable:&v22 error:&v21];
      uint64_t v13 = v21;
      uint64_t v14 = v13;
      if (v12) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = v22 == 0;
      }
      if (v15) {
        goto LABEL_18;
      }
      double v16 = [v13 domain];
      if ([v16 isEqualToString:*MEMORY[0x1E4F8C500]])
      {
        uint64_t v17 = [v14 code];

        if (v17 == 49501)
        {
          id v18 = PLSyndicationGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v14;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "[sync] skipping attachment with invalid content type: %@", buf, 0xCu);
          }
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
      }
      id v18 = PLSyndicationGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = NSStringFromClass(v11);
        int64_t v20 = [v7 uniqueIdentifier];
        *(_DWORD *)buf = 138543874;
        v25 = v19;
        __int16 v26 = 2112;
        uint64_t v27 = v20;
        __int16 v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[sync] failed to insert %{public}@ with syndication ID: %@, error: %@", buf, 0x20u);
      }
      goto LABEL_17;
    }
  }
  uint64_t v14 = PLSyndicationGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v12 = [v7 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    v25 = v12;
    __int16 v26 = 2112;
    uint64_t v27 = 0;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "[sync] failed to resolve object class for item with syndication ID: %@, error: %@", buf, 0x16u);
LABEL_18:
  }
}

- (void)_processZombieItems:(id)a3 library:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v18 = a4;
  int64_t v20 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    uint64_t v10 = *MEMORY[0x1E4F230C0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = [v12 attributeSet];
        uint64_t v14 = [v13 attributeDictionary];
        BOOL v15 = [v14 objectForKeyedSubscript:v10];
        int v16 = [v15 BOOLValue];

        if (v16)
        {
          uint64_t v17 = [v12 uniqueIdentifier];
          [v20 addObject:v17];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  [(PLSyndicationSyncEngine *)self _deleteGuestAssetWithSyndicationIdentifiers:v20 library:v18];
  [(PLSyndicationSyncEngine *)self _deleteConversationWithSyndicationIdentifiers:v20 library:v18];
}

- (BOOL)_deleteConversationWithSyndicationIdentifiers:(id)a3 library:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PLSyndicationSyncEngine__deleteConversationWithSyndicationIdentifiers_library___block_invoke;
  v12[3] = &unk_1E5873A50;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v5;
  [v9 performTransactionAndWait:v12];

  return 1;
}

void __81__PLSyndicationSyncEngine__deleteConversationWithSyndicationIdentifiers_library___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLConversation entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"importSessionID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v17 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v4 error:&v17];
  id v8 = v17;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__PLSyndicationSyncEngine__deleteConversationWithSyndicationIdentifiers_library___block_invoke_2;
    v14[3] = &unk_1E58709E0;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    id v9 = (id)[v6 enumerateWithIncrementalSaveUsingObjects:v7 withBlock:v14];
    id v10 = PLSyndicationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(a1 + 48) count];
      int v12 = [*(id *)(a1 + 48) componentsJoinedByString:@","];
      *(_DWORD *)buf = 134218242;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      long long v21 = v12;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Deleted %tu conversation(s), identifiers: %@", buf, 0x16u);
    }
    id v13 = v15;
  }
  else
  {
    id v13 = PLSyndicationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = (uint64_t)v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Error fetching conversations: %@", buf, 0xCu);
    }
  }
}

void __81__PLSyndicationSyncEngine__deleteConversationWithSyndicationIdentifiers_library___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 importSessionID];
  [v3 addObject:v5];

  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  [v6 deleteObject:v4];
}

- (BOOL)_deleteGuestAssetWithSyndicationIdentifiers:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PLSyndicationSyncEngine__deleteGuestAssetWithSyndicationIdentifiers_library___block_invoke;
  v13[3] = &unk_1E5875BF8;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v17 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [v10 performTransactionAndWait:v13];

  return 1;
}

void __79__PLSyndicationSyncEngine__deleteGuestAssetWithSyndicationIdentifiers_library___block_invoke(uint64_t a1)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLManagedAsset entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = +[PLManagedAsset predicateForSyndicatedAssetIdentifiers:*(void *)(a1 + 32) includeRejected:1];
  v28[0] = v6;
  id v7 = [MEMORY[0x1E4F8BA10] predicateForIncludeMask:*(unsigned int *)(*(void *)(a1 + 40) + 16) useIndex:0];
  v28[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v9 = [v5 andPredicateWithSubpredicates:v8];
  [v4 setPredicate:v9];

  uint64_t v27 = @"additionalAttributes";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  [v4 setRelationshipKeyPathsForPrefetching:v10];

  id v11 = [*(id *)(a1 + 48) managedObjectContext];
  id v22 = 0;
  int v12 = [v11 executeFetchRequest:v4 error:&v22];
  id v13 = v22;
  if (v12)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __79__PLSyndicationSyncEngine__deleteGuestAssetWithSyndicationIdentifiers_library___block_invoke_2;
    v19[3] = &unk_1E5875CB8;
    __int16 v20 = *(id *)(a1 + 56);
    id v21 = v11;
    id v14 = (id)[v21 enumerateWithIncrementalSaveUsingObjects:v12 withBlock:v19];
    id v15 = PLSyndicationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [*(id *)(a1 + 56) count];
      id v17 = [*(id *)(a1 + 56) componentsJoinedByString:@","];
      *(_DWORD *)buf = 134218242;
      uint64_t v24 = v16;
      __int16 v25 = 2114;
      uint64_t v26 = v17;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Deleted %tu guest asset(s), uuid: %{public}@", buf, 0x16u);
    }
    id v18 = v20;
  }
  else
  {
    id v18 = PLSyndicationGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = (uint64_t)v13;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Error fetching guest assets: %@", buf, 0xCu);
    }
  }
}

void __79__PLSyndicationSyncEngine__deleteGuestAssetWithSyndicationIdentifiers_library___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = NSString;
  id v4 = a2;
  id v5 = [v4 additionalAttributes];
  id v6 = [v5 syndicationIdentifier];
  id v7 = [v4 uuid];
  id v8 = [v3 stringWithFormat:@"%@ (%@)", v6, v7];

  [*(id *)(a1 + 32) addObject:v8];
  [*(id *)(a1 + 40) deleteObject:v4];
}

- (void)_processZombieItem:(id)a3 library:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 uniqueIdentifier];
  id v7 = +[PLManagedAsset assetWithSyndicationIdentifier:v6 inLibrary:v5];
  id v8 = v7;
  if (!v7)
  {
    id v10 = +[PLConversation albumWithConversationID:v6 inLibrary:v5];
    id v13 = PLSyndicationGetLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v14)
      {
        id v15 = [v10 uuid];
        int v19 = 138543618;
        __int16 v20 = v15;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "[sync] deleting conversation with uuid: %{public}@, syndication identifier: %@", (uint8_t *)&v19, 0x16u);
      }
      id v13 = [v5 managedObjectContext];
      [v13 deleteObject:v10];
      goto LABEL_15;
    }
    if (!v14)
    {
LABEL_15:

      goto LABEL_16;
    }
    int v19 = 138412290;
    __int16 v20 = v6;
    uint64_t v16 = "[sync] did not find asset/conversation to delete with syndication identifier: %@";
    id v17 = v13;
    uint32_t v18 = 12;
LABEL_14:
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    goto LABEL_15;
  }
  [v7 savedAssetType];
  int v9 = PLValidatedSavedAssetTypeApplies();
  id v10 = PLSyndicationGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v11) {
      goto LABEL_16;
    }
    id v13 = [v8 uuid];
    int v19 = 138543874;
    __int16 v20 = v13;
    __int16 v21 = 2114;
    id v22 = v6;
    __int16 v23 = 1024;
    int v24 = [v8 savedAssetType];
    uint64_t v16 = "[sync] not deleting asset with uuid: %{public}@, syndication identifier: %{public}@ because savedAssetType=%hu";
    id v17 = v10;
    uint32_t v18 = 28;
    goto LABEL_14;
  }
  if (v11)
  {
    int v12 = [v8 uuid];
    int v19 = 138543618;
    __int16 v20 = v12;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "[sync] deleting asset with uuid: %{public}@, syndication identifier: %{public}@", (uint8_t *)&v19, 0x16u);
  }
  id v10 = +[PLAssetTransactionReason transactionReason:@"Syndication sync"];
  [v8 deleteWithReason:v10];
LABEL_16:
}

- (BOOL)_isQueryTypeSupported:(int64_t)a3
{
  suppportedQueryTypes = self->_suppportedQueryTypes;
  id v4 = [NSNumber numberWithInteger:a3];
  LOBYTE(suppportedQueryTypes) = [(NSSet *)suppportedQueryTypes containsObject:v4];

  return (char)suppportedQueryTypes;
}

- (PLSyndicationSyncEngine)initWithQueryTypes:(id)a3 savedAssetTypeMask:(unsigned int)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PLSyndicationSyncEngine;
  BOOL v11 = [(PLSyndicationSyncEngine *)&v14 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_suppportedQueryTypes, a3);
    v12->_savedAssetTypeMask = a4;
  }

  return v12;
}

+ (void)findStartDateForMessagesSpotlightItemsWithCompletionHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v7 = [v4 dateWithTimeIntervalSinceReferenceDate:0.0];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [a1 _recursiveFindStartDateForMessagesSpotlightItemsWithStartDate:v7 endDate:v6 completionHandler:v5];
}

+ (void)_recursiveFindStartDateForMessagesSpotlightItemsWithStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  BOOL v11 = PLSyndicationGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "[sync] recursively searching syndication start date in interval: %@, %@", buf, 0x16u);
  }

  [v9 timeIntervalSinceDate:v8];
  if (v12 <= 86400.0)
  {
    v10[2](v10, v8, 0);
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v8 sinceDate:v12 * 0.5];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v25 = 0;
    objc_super v14 = PLSyndicationCheckQueryWithDates(v8, v13);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __115__PLSyndicationSyncEngine__recursiveFindStartDateForMessagesSpotlightItemsWithStartDate_endDate_completionHandler___block_invoke;
    v23[3] = &unk_1E5870AA8;
    v23[4] = buf;
    [v14 setFoundItemsHandler:v23];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __115__PLSyndicationSyncEngine__recursiveFindStartDateForMessagesSpotlightItemsWithStartDate_endDate_completionHandler___block_invoke_2;
    v16[3] = &unk_1E5871678;
    __int16 v20 = v10;
    __int16 v21 = buf;
    id v22 = a1;
    id v17 = v8;
    id v15 = v13;
    id v18 = v15;
    id v19 = v9;
    [v14 setCompletionHandler:v16];
    [v14 start];

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __115__PLSyndicationSyncEngine__recursiveFindStartDateForMessagesSpotlightItemsWithStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

void __115__PLSyndicationSyncEngine__recursiveFindStartDateForMessagesSpotlightItemsWithStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
    }
    else
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
    }
    [*(id *)(a1 + 72) _recursiveFindStartDateForMessagesSpotlightItemsWithStartDate:v3 endDate:v4 completionHandler:*(void *)(a1 + 56)];
  }
}

+ (double)maxSpotlightQueryTimeInterval
{
  return 604800.0;
}

+ (double)minSpotlightQueryTimeInterval
{
  return 1.0;
}

@end