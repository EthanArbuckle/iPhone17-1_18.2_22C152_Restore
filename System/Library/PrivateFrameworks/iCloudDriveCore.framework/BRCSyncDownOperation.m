@interface BRCSyncDownOperation
- (BOOL)handleZoneNotFoundIfSyncingDownForTheFirstTime:(id)a3;
- (BOOL)shouldRetryForError:(id)a3;
- (id)createActivity;
- (id)initDeltaSyncWithServerZone:(id)a3 sessionContext:(id)a4;
- (void)_fetchInitialZoneIfNecessaryWithCreatedZone:(id)a3;
- (void)_performAfterFetchingRecordChanges:(id)a3;
- (void)_saveInitialServerZoneData:(id)a3 clientChangeTokenData:(id)a4;
- (void)_startCreateZoneAndSubscriptionAndSyncDown;
- (void)_startSyncDown;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
@end

@implementation BRCSyncDownOperation

- (id)initDeltaSyncWithServerZone:(id)a3 sessionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 zoneName];
  v10 = [@"sync-down/" stringByAppendingString:v9];

  v11 = [v7 ownerName];
  char v12 = [v11 isEqualToString:*MEMORY[0x263EFD488]];

  if ((v12 & 1) == 0)
  {
    v13 = [v7 ownerName];
    uint64_t v14 = [v10 stringByAppendingFormat:@":%@", v13];

    v10 = (void *)v14;
  }
  v15 = [v7 metadataSyncContext];
  v29.receiver = self;
  v29.super_class = (Class)BRCSyncDownOperation;
  v16 = [(_BRCOperation *)&v29 initWithName:v10 syncContext:v15 sessionContext:v8];

  if (v16)
  {
    [(BRCSyncDownOperation *)v16 setQueuePriority:4];
    p_serverZone = (id *)&v16->_serverZone;
    objc_storeStrong((id *)&v16->_serverZone, a3);
    v18 = [(BRCServerZone *)v16->_serverZone clientZone];
    if ([v18 hasHighPriorityWatchers]) {
      [(_BRCOperation *)v16 setNonDiscretionary:1];
    }
    v19 = [v18 lastAttemptedSyncDownDate];
    if (v19 || ([v18 hasCompletedInitialSyncDownOnce] & 1) != 0)
    {
    }
    else if ([*p_serverZone isCloudDocsZone])
    {
      v22 = +[BRCUserDefaults defaultsForMangledID:0];
      [v22 forceForegroundGracePeriod];
      double v24 = v23;

      v25 = [*p_serverZone metadataSyncContext];
      [v25 forceContainerForegroundForDuration:v24];

      v26 = [*p_serverZone session];
      v27 = [v26 syncContextProvider];
      v28 = [v27 sharedMetadataSyncContext];
      [v28 forceContainerForegroundForDuration:v24];

      [(_BRCOperation *)v16 setNonDiscretionary:1];
    }
    v20 = [MEMORY[0x263EFF910] date];
    [v18 setLastAttemptedSyncDownDate:v20];
  }
  return v16;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sync-down", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_performAfterFetchingRecordChanges:(id)a3
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  v50 = (void (**)(id, void, void *))a3;
  v4 = self->_serverZone;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__50;
  v105 = __Block_byref_object_dispose__50;
  id v106 = 0;
  v5 = [[BRCPendingChangesStream alloc] initWithServerZone:v4];
  v6 = [(BRCPendingChangesStream *)v5 lastError];

  if (v6)
  {
    id v7 = [(BRCPendingChangesStream *)v5 lastError];
    v50[2](v50, 0, v7);
  }
  else
  {
    uint64_t v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__50;
    v99 = __Block_byref_object_dispose__50;
    id v100 = 0;
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke;
    v94[3] = &unk_265086820;
    v94[4] = &v101;
    v94[5] = &v95;
    [(BRCPendingChangesStream *)v5 fetchTokenState:v94];
    if (!v102[5])
    {
      id v8 = [(BRCServerZone *)v4 changeState];
      uint64_t v9 = [v8 changeToken];
      v10 = (void *)v102[5];
      v102[5] = v9;
    }
    v11 = [(BRCServerZone *)v4 mangledID];
    v49 = +[BRCUserDefaults defaultsForMangledID:v11];

    long long location = 0uLL;
    uint64_t v91 = 0;
    __brc_create_section(1, (uint64_t)"-[BRCSyncDownOperation _performAfterFetchingRecordChanges:]", 98, &location);
    char v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = location;
      if (v96[5]) {
        v15 = @"starting";
      }
      else {
        v15 = @"continuing";
      }
      v16 = [(BRCServerZone *)v4 mangledID];
      v17 = [v16 aliasTargetContainerString];
      v18 = [(id)v102[5] descriptionWithContext:0];
      *(_DWORD *)buf = 134219010;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v111 = v17;
      *(_WORD *)v112 = 2112;
      *(void *)&v112[2] = v18;
      *(_WORD *)&v112[10] = 2112;
      *(void *)&v112[12] = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] ┣%llx %@ fetch record changes operation for %@ from token %@%@", buf, 0x34u);
    }
    long long v92 = location;
    uint64_t v93 = v91;
    v19 = objc_opt_new();
    [v19 setPreviousServerChangeToken:v102[5]];
    objc_msgSend(v19, "setResultsLimit:", objc_msgSend(v49, "maxRecordCountInFetchRecordsOperation"));
    v20 = [MEMORY[0x263EFD7C8] desiredKeysWithMask:185];
    [v19 setDesiredKeys:v20];
    v48 = v19;

    id v21 = objc_alloc(MEMORY[0x263EFD6B8]);
    v22 = [(BRCServerZone *)v4 zoneID];
    v109 = v22;
    double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v109 count:1];
    double v24 = [(BRCServerZone *)v4 zoneID];
    v107 = v24;
    v108 = v48;
    v25 = [NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
    v26 = (void *)[v21 initWithRecordZoneIDs:v23 configurationsByRecordZoneID:v25];

    [v26 setShouldFetchAssetContents:0];
    if ([(BRCServerZone *)v4 isSharedZone]) {
      uint64_t v27 = 0;
    }
    else {
      uint64_t v27 = [v49 shouldFetchAllChanges];
    }
    [v26 setFetchAllChanges:v27];
    objc_msgSend(v26, "setShouldReportAllPerItemFailures:", objc_msgSend(v49, "shouldReportAllPerItemFailures"));
    v28 = [(BRCServerZone *)v4 mangledID];
    objc_super v29 = +[BRCUserDefaults defaultsForMangledID:v28];
    int v30 = [v29 supportsEnhancedDrivePrivacy];

    if (v30)
    {
      v88[0] = MEMORY[0x263EF8330];
      v88[1] = 3221225472;
      v88[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_18;
      v88[3] = &unk_265086848;
      v89 = v4;
      [v26 setZoneAttributesChangedBlock:v88];
    }
    id v31 = [[BRCFetchRecordSubResourcesOperation alloc] initAndScheduleWithServerZone:self->_serverZone parentOperation:self pendingChangesStream:v5 contentRecordsFetchedInline:1 sessionContext:self->super._sessionContext];
    dispatch_group_t v32 = dispatch_group_create();
    v33 = [v31 callbackQueue];
    [v26 setCallbackQueue:v33];

    objc_initWeak((id *)&location, v26);
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_23;
    v82[3] = &unk_265086870;
    v45 = &v85;
    objc_copyWeak(&v85, (id *)&location);
    long long v86 = v92;
    uint64_t v87 = v93;
    v34 = v4;
    v83 = v34;
    id v35 = v31;
    id v84 = v35;
    [v26 setPerRecordChangeCompletionBlock:v82];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_25;
    v77[3] = &unk_26507FD48;
    v46 = &v79;
    objc_copyWeak(&v79, (id *)&location);
    long long v80 = v92;
    uint64_t v81 = v93;
    id v36 = v35;
    id v78 = v36;
    [v26 setRecordWithIDWasDeletedBlock:v77];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v111 = __Block_byref_object_copy__50;
    *(void *)v112 = __Block_byref_object_dispose__50;
    *(void *)&v112[8] = 0;
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_27;
    v70[3] = &unk_265086898;
    v47 = &v74;
    objc_copyWeak(&v74, (id *)&location);
    long long v75 = v92;
    uint64_t v76 = v93;
    id v37 = v36;
    v72 = self;
    v73 = buf;
    id v71 = v37;
    v38 = (void *)MEMORY[0x2455D9A50](v70);
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_33;
    v63[3] = &unk_2650868E8;
    objc_copyWeak(&v67, (id *)&location);
    long long v68 = v92;
    uint64_t v69 = v93;
    id v39 = v38;
    id v66 = v39;
    v40 = v32;
    v64 = v40;
    id v41 = v37;
    id v65 = v41;
    [v26 setRecordZoneFetchCompletionBlock:v63];
    if ([v26 fetchAllChanges])
    {
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2_36;
      v61[3] = &unk_265086910;
      id v62 = v39;
      objc_msgSend(v26, "setRecordZoneChangeTokensUpdatedBlock:", v61, &v85, &v79, &v74);
    }
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_3;
    v51[3] = &unk_265086960;
    objc_copyWeak(&v58, (id *)&location);
    v42 = v40;
    v52 = v42;
    v43 = v34;
    long long v59 = v92;
    uint64_t v60 = v93;
    v53 = v43;
    v57 = buf;
    id v44 = v41;
    id v54 = v44;
    v55 = self;
    v56 = v50;
    [v26 setFetchRecordZoneChangesCompletionBlock:v51];
    [(_BRCOperation *)self addSubOperation:v26];

    objc_destroyWeak(&v58);
    objc_destroyWeak(&v67);

    objc_destroyWeak(v47);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(v46);
    objc_destroyWeak(v45);
    objc_destroyWeak((id *)&location);

    _Block_object_dispose(&v95, 8);
  }

  _Block_object_dispose(&v101, 8);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v12 = v6;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 requiredFeatures];
  v5 = [v4 recordFeatures];

  if ([v5 hasValue:*MEMORY[0x263F323C8] forName:*MEMORY[0x263F323C0]])
  {
    id v6 = [*(id *)(a1 + 32) session];
    id v7 = [v6 clientTruthWorkloop];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2;
    v9[3] = &unk_26507ED98;
    id v10 = v3;
    id v11 = v6;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F325E0]);
  id v3 = [*(id *)(a1 + 32) zoneID];
  v4 = (void *)[v2 initWithRecordZoneID:v3];

  v5 = [*(id *)(a1 + 40) clientZoneByMangledID:v4];
  if (([v5 enhancedDrivePrivacyEnabled] & 1) == 0)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_notifications_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2_cold_1();
    }

    [v5 setStateBits:0x400000];
  }
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_23(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unint64_t v7 = a2;
  uint64_t v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v26 = *(_OWORD *)(a1 + 56);
  uint64_t v27 = *(void *)(a1 + 72);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [WeakRetained operationID];
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = v26;
    __int16 v31 = 2112;
    id v32 = v13;
    __int16 v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┳%llx got a record in operation %@%@", buf, 0x20u);
  }
  uint64_t v14 = brc_bread_crumbs();
  v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = [(id)v7 debugDescription];
    __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_23_cold_3(v16, (uint64_t)v14, v28, v15);
  }

  if (!(v7 | v8))
  {
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_23_cold_2();
    }
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  if (!v8)
  {
    uint64_t v8 = [(id)v7 recordID];
    if (!v7) {
      goto LABEL_18;
    }
LABEL_14:
    v19 = objc_msgSend((id)v7, "etag", v26, v27);
    BOOL v20 = v19 == 0;

    if (v20)
    {
      id v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_23_cold_1();
      }
    }
    goto LABEL_18;
  }
  if (v7) {
    goto LABEL_14;
  }
LABEL_18:
  if (objc_msgSend(v9, "brc_isCloudKitPCSDecryptionFailure", (void)v26)
    && [*(id *)(a1 + 32) isPrivateZone])
  {
    double v23 = [*(id *)(a1 + 32) clientZone];
    double v24 = [v23 asPrivateClientZone];
    v25 = [(id)v8 recordName];
    [v24 reportProblemWithType:12 recordName:v25];
  }
  if (v7)
  {
    [*(id *)(a1 + 40) addRecord:v7];
    goto LABEL_23;
  }
  v17 = brc_bread_crumbs();
  v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    v34 = v17;
    _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Record fetch failed for %@ with error %@%@", buf, 0x20u);
  }
LABEL_12:

LABEL_23:
  __brc_leave_section((uint64_t *)&v26);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v15 = *(_OWORD *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [WeakRetained operationID];
    *(_DWORD *)buf = 134218498;
    id v18 = (id)v15;
    __int16 v19 = 2112;
    BOOL v20 = v14;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx got a deletion in operation %@%@", buf, 0x20u);
  }
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    BOOL v20 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] record was deleted: %@%@", buf, 0x16u);
  }

  int v12 = [v6 isEqualToString:*MEMORY[0x263EFD510]];
  v13 = *(void **)(a1 + 32);
  if (v12) {
    [v13 shareIDWasDeleted:v5];
  }
  else {
    [v13 recordIDWasDeleted:v5];
  }
  __brc_leave_section((uint64_t *)&v15);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_27(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v11 = [WeakRetained recordZoneChangesStatusByZoneID];
  int v12 = [v11 objectForKeyedSubscript:v7];
  uint64_t v13 = [v12 unsignedLongValue];

  long long v34 = *(_OWORD *)(a1 + 64);
  uint64_t v35 = *(void *)(a1 + 80);
  uint64_t v14 = brc_bread_crumbs();
  long long v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [v8 descriptionWithContext:0];
    uint64_t v23 = [WeakRetained operationID];
    *(_DWORD *)buf = 134219266;
    id v37 = (void *)v34;
    __int16 v38 = 2112;
    id v39 = v22;
    __int16 v40 = 2112;
    id v41 = v9;
    __int16 v42 = 2112;
    v43 = v23;
    __int16 v44 = 2048;
    uint64_t v45 = v13;
    __int16 v46 = 2112;
    v47 = v14;
    _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received updated server change token %@ client change token %@ in operation %@ status %ld%@", buf, 0x3Eu);
  }
  uint64_t v16 = [*(id *)(a1 + 32) error];
  if (v16)
  {

LABEL_6:
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v17 = [*(id *)(a1 + 32) error];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      __int16 v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    [WeakRetained cancel];
    goto LABEL_9;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    goto LABEL_6;
  }
  BOOL v20 = (uint64_t *)[v9 bytes];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0;
  }
  if (([*(id *)(a1 + 32) saveRecordsWithServerChangeToken:v8 clientChangeToken:v21 syncStatus:v13] & 1) == 0)
  {
    double v24 = brc_bread_crumbs();
    v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      id v32 = [WeakRetained operationID];
      __int16 v33 = [v8 descriptionWithContext:0];
      *(_DWORD *)buf = 138412802;
      id v37 = v32;
      __int16 v38 = 2112;
      id v39 = v33;
      __int16 v40 = 2112;
      id v41 = v24;
      _os_log_fault_impl(&dword_23FA42000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: broken structure in op %@ change token %@%@", buf, 0x20u);
    }
    long long v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = [WeakRetained operationID];
    v28 = [v8 descriptionWithContext:0];
    uint64_t v29 = objc_msgSend(v26, "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: broken structure in op %@ change token %@", v27, v28);

    uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    [*(id *)(a1 + 40) cancel];
  }
LABEL_9:
  __brc_leave_section((uint64_t *)&v34);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  long long v26 = *(_OWORD *)(a1 + 64);
  uint64_t v27 = *(void *)(a1 + 80);
  uint64_t v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int16 v19 = [WeakRetained operationID];
    *(_DWORD *)buf = 134218498;
    uint64_t v29 = v26;
    __int16 v30 = 2112;
    __int16 v31 = v19;
    __int16 v32 = 2112;
    __int16 v33 = v16;
    _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx fetch changes completion for zone in operation %@%@", buf, 0x20u);
  }
  if (!v14)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_34;
    v20[3] = &unk_2650868C0;
    uint64_t v18 = *(void **)(a1 + 40);
    id v25 = *(id *)(a1 + 48);
    id v21 = v11;
    id v22 = v12;
    id v23 = v13;
    id v24 = *(id *)(a1 + 32);
    [v18 notifyWhenCaughtUp:a5 ^ 1u whenRecordsAreFetchedAndFinish:v20];
  }
  __brc_leave_section((uint64_t *)&v26);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_34(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v2 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v2);
}

uint64_t __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v5 = *(NSObject **)(a1 + 32);
  id v6 = [WeakRetained callbackQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4;
  v13[3] = &unk_265086938;
  id v14 = *(id *)(a1 + 40);
  id v15 = v3;
  long long v21 = *(_OWORD *)(a1 + 88);
  uint64_t v22 = *(void *)(a1 + 104);
  uint64_t v7 = *(void *)(a1 + 72);
  id v16 = WeakRetained;
  uint64_t v20 = v7;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = *(void **)(a1 + 64);
  id v17 = v8;
  uint64_t v18 = v9;
  id v19 = v10;
  id v11 = WeakRetained;
  id v12 = v3;
  dispatch_group_notify(v5, v6, v13);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) zoneID];
  id v3 = objc_msgSend(*(id *)(a1 + 40), "brc_cloudKitErrorForZone:", v2);
  long long v18 = *(_OWORD *)(a1 + 88);
  uint64_t v19 = *(void *)(a1 + 104);
  v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [*(id *)(a1 + 48) operationID];
    *(_DWORD *)buf = 134218498;
    long long v21 = (void *)v18;
    __int16 v22 = 2112;
    id v23 = v17;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx fetch changes completed for operation %@%@", buf, 0x20u);
  }
  if (v3)
  {
    if ((objc_msgSend(v3, "brc_isCloudKitCancellationError") & 1) == 0) {
      goto LABEL_9;
    }
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (!v6) {
      goto LABEL_9;
    }
LABEL_8:
    id v7 = v6;

    id v3 = v7;
    goto LABEL_9;
  }
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v6) {
    goto LABEL_8;
  }
  id v3 = [*(id *)(a1 + 56) error];
  if (!v3)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4_cold_1();
    }
    id v3 = 0;
    goto LABEL_21;
  }
LABEL_9:
  if ([*(id *)(a1 + 56) isExecuting]) {
    [*(id *)(a1 + 56) cancel];
  }
  if (![*(id *)(a1 + 64) handleZoneNotFoundIfSyncingDownForTheFirstTime:v3])
  {
    if (objc_msgSend(v3, "brc_isCloudKitCancellationError"))
    {
      id v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4_cold_2();
      }
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) zoneName];
      id v10 = [*(id *)(a1 + 32) ownerName];
      char v11 = [v10 isEqualToString:*MEMORY[0x263EFD488]];

      if ((v11 & 1) == 0)
      {
        id v12 = [*(id *)(a1 + 32) ownerName];
        uint64_t v13 = [v8 stringByAppendingFormat:@":%@", v12];

        id v8 = (void *)v13;
      }
      uint64_t v9 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        long long v21 = v8;
        __int16 v22 = 2112;
        id v23 = v3;
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] sync-down failed for %@: %@%@", buf, 0x20u);
      }
    }
LABEL_21:

    id v15 = [*(id *)(a1 + 48) recordZoneChangesStatusByZoneID];
    id v16 = [v15 objectForKeyedSubscript:v2];
    [v16 unsignedLongValue];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_22;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_22:
  __brc_leave_section((uint64_t *)&v18);
}

- (BOOL)handleZoneNotFoundIfSyncingDownForTheFirstTime:(id)a3
{
  id v4 = a3;
  id v5 = self->_serverZone;
  if ([(BRCServerZone *)v5 hasFetchedServerZoneState]
    || !objc_msgSend(v4, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    BOOL v11 = 0;
  }
  else
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncDownOperation handleZoneNotFoundIfSyncingDownForTheFirstTime:]();
    }

    LOBYTE(v13) = 0;
    uint64_t v8 = [(BRCServerZone *)v5 didSyncDownRequestID:0 serverChangeToken:0 editedRecords:0 deletedRecordIDs:0 deletedShareRecordIDs:0 allocRankZones:0 caughtUp:v13 pendingChanges:0];
    uint64_t v9 = [(BRCServerZone *)v5 clientZone];
    id v10 = [v9 db];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__BRCSyncDownOperation_handleZoneNotFoundIfSyncingDownForTheFirstTime___block_invoke;
    v14[3] = &unk_2650813E0;
    id v15 = v5;
    uint64_t v16 = v8;
    [v10 performWithFlags:41 action:v14];

    BOOL v11 = 1;
  }

  return v11;
}

uint64_t __71__BRCSyncDownOperation_handleZoneNotFoundIfSyncingDownForTheFirstTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 applyScheduler];
  [v3 didSyncDownZone:*(void *)(a1 + 32) requestID:0 upToRank:*(void *)(a1 + 40) caughtUpWithServer:1];

  id v4 = [*(id *)(a1 + 32) clientZone];
  [v4 fetchRecentAndFavoriteDocuments];

  return 1;
}

- (void)_startSyncDown
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__BRCSyncDownOperation__startSyncDown__block_invoke;
  v2[3] = &unk_265086988;
  v2[4] = self;
  [(BRCSyncDownOperation *)self _performAfterFetchingRecordChanges:v2];
}

void __38__BRCSyncDownOperation__startSyncDown__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithInteger:a2];
  [v4 completedWithResult:v7 error:v6];
}

- (void)_saveInitialServerZoneData:(id)a3 clientChangeTokenData:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = (BRCServerZone *)a3;
  id v7 = (BRCServerZone *)a4;
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    serverZone = self->_serverZone;
    *(_DWORD *)buf = 138413058;
    __int16 v22 = v6;
    __int16 v23 = 2112;
    __int16 v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = serverZone;
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetched initial server zone tokens %@ and %@ for %@%@", buf, 0x2Au);
  }

  id v10 = v7;
  BOOL v11 = (uint64_t *)[(BRCServerZone *)v10 bytes];
  if (v11) {
    uint64_t v12 = *v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = brc_bread_crumbs();
  id v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    long long v18 = self->_serverZone;
    *(_DWORD *)buf = 138413058;
    __int16 v22 = v18;
    __int16 v23 = 2112;
    __int16 v24 = v6;
    __int16 v25 = 2112;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Saving initial zone data of %@ with server token %@ client token %@%@", buf, 0x2Au);
  }

  LOBYTE(v19) = 0;
  [(BRCServerZone *)self->_serverZone didSyncDownRequestID:v12 serverChangeToken:v6 editedRecords:0 deletedRecordIDs:0 deletedShareRecordIDs:0 allocRankZones:0 caughtUp:v19 pendingChanges:0];
  id v15 = [(BRCServerZone *)self->_serverZone clientZone];
  uint64_t v16 = [v15 db];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__BRCSyncDownOperation__saveInitialServerZoneData_clientChangeTokenData___block_invoke;
  v20[3] = &unk_2650813E0;
  void v20[4] = self;
  v20[5] = v12;
  [v16 performWithFlags:41 action:v20];

  [(_BRCOperation *)self completedWithResult:&unk_26F3DDA30 error:0];
}

uint64_t __73__BRCSyncDownOperation__saveInitialServerZoneData_clientChangeTokenData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 504) clientZone];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 504) changeState];
  id v5 = [v4 lastSyncDownDate];
  [v2 didSyncDownRequestID:v3 maxApplyRank:0 caughtUpWithServer:1 syncDownDate:v5];

  if ([v2 isPrivateZone]) {
    [v2 fetchRecentAndFavoriteDocuments];
  }

  return 1;
}

- (void)_fetchInitialZoneIfNecessaryWithCreatedZone:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 currentServerChangeToken];
    id v7 = [v5 clientChangeToken];
    [(BRCSyncDownOperation *)self _saveInitialServerZoneData:v6 clientChangeTokenData:v7];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263EFD6D0]);
    uint64_t v9 = [(BRCServerZone *)self->_serverZone zoneID];
    v12[0] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v6 = (void *)[v8 initWithRecordZoneIDs:v10];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__BRCSyncDownOperation__fetchInitialZoneIfNecessaryWithCreatedZone___block_invoke;
    v11[3] = &unk_2650805D0;
    v11[4] = self;
    [v6 setFetchRecordZonesCompletionBlock:v11];
    [(_BRCOperation *)self addSubOperation:v6];
  }
}

void __68__BRCSyncDownOperation__fetchInitialZoneIfNecessaryWithCreatedZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 504);
  id v7 = a2;
  id v8 = [v6 zoneID];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!(v5 | v9))
  {
    id v10 = brc_bread_crumbs();
    BOOL v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __68__BRCSyncDownOperation__fetchInitialZoneIfNecessaryWithCreatedZone___block_invoke_cold_1();
    }

    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no fetched zone and no error");
  }
  uint64_t v12 = *(void **)(a1 + 32);
  if (v5)
  {
    [v12 completedWithResult:0 error:v5];
  }
  else
  {
    uint64_t v13 = [(id)v9 currentServerChangeToken];
    id v14 = [(id)v9 clientChangeToken];
    [v12 _saveInitialServerZoneData:v13 clientChangeTokenData:v14];
  }
}

- (void)_startCreateZoneAndSubscriptionAndSyncDown
{
  uint64_t v3 = self->_serverZone;
  id v4 = [(BRCServerZone *)self->_serverZone changeState];
  int v5 = [v4 hasNeverSyncedDown];

  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  if (!v5
    || [(BRCServerZone *)self->_serverZone isSharedZone]
    || ([(BRCServerZone *)self->_serverZone state] & 4) != 0)
  {
    char v8 = 1;
  }
  else
  {
    id v6 = [(BRCServerZone *)self->_serverZone mangledID];
    id v7 = +[BRCUserDefaults defaultsForMangledID:v6];
    char v8 = [v7 forceDeltaInitialSync];
  }
  char v26 = v8;
  if (*((unsigned char *)v24 + 24))
  {
    if (!v5)
    {
LABEL_11:
      if (*((unsigned char *)v24 + 24)) {
        [(BRCSyncDownOperation *)self _startSyncDown];
      }
      else {
        [(BRCSyncDownOperation *)self _fetchInitialZoneIfNecessaryWithCreatedZone:0];
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v9 = [(BRCServerZone *)self->_serverZone clientZone];
    id v10 = [v9 db];
    BOOL v11 = [v10 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke;
    block[3] = &unk_265081558;
    __int16 v22 = &v23;
    long long v21 = v3;
    dispatch_sync(v11, block);

    if (!v5) {
      goto LABEL_11;
    }
  }
  if ([(BRCServerZone *)self->_serverZone isSharedZone]) {
    goto LABEL_11;
  }
  objc_initWeak(&location, self);
  uint64_t v12 = [[BRCCreateZoneAndSubscribeOperation alloc] initWithServerZone:v3 sessionContext:self->super._sessionContext];
  uint64_t v13 = [(BRCServerZone *)v3 clientZone];
  int v14 = [v13 isCloudDocsZone];

  if (v14)
  {
    [(BRCCreateZoneAndSubscribeOperation *)v12 setSubscriptionOnly:0];
    [(BRCCreateZoneAndSubscribeOperation *)v12 setOptimisticSubscribe:1];
  }
  else
  {
    [(BRCCreateZoneAndSubscribeOperation *)v12 setSubscriptionOnly:1];
  }
  objc_initWeak(&from, v12);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2;
  v15[3] = &unk_2650869B0;
  objc_copyWeak(&v16, &location);
  v15[4] = &v23;
  objc_copyWeak(&v17, &from);
  [(BRCCreateZoneAndSubscribeOperation *)v12 setCreateZoneAndSubscribeCompletionBlock:v15];
  [(_BRCOperation *)self addSubOperation:v12];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
LABEL_18:
  _Block_object_dispose(&v23, 8);
}

void __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientZone];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 hasItemsWithInFlightDiffs];
}

void __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = WeakRetained;
  if (v3)
  {
    if (objc_msgSend(v3, "brc_isCloudKitCancellationError"))
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2_cold_1();
      }
    }
    else
    {
      if ([v5 handleZoneNotFoundIfSyncingDownForTheFirstTime:v3])
      {
        char v8 = &unk_26F3DDA48;
        uint64_t v9 = v5;
        id v10 = 0;
LABEL_12:
        [v9 completedWithResult:v8 error:v10];
        goto LABEL_13;
      }
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
        __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2_cold_2();
      }
    }

    uint64_t v9 = v5;
    char v8 = 0;
    id v10 = v3;
    goto LABEL_12;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    [WeakRetained _startSyncDown];
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v12 = [v11 createdZone];
    [v5 _fetchInitialZoneIfNecessaryWithCreatedZone:v12];
  }
LABEL_13:
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = [v6 integerValue];
  }
  uint64_t v9 = [(BRCServerZone *)self->_serverZone clientZone];
  [v9 syncDownOperation:self didFinishWithError:v7 status:v8];

  [(BRCSyncDownOperation *)self hash];
  kdebug_trace();
  v10.receiver = self;
  v10.super_class = (Class)BRCSyncDownOperation;
  [(_BRCOperation *)&v10 finishWithResult:0 error:v7];
}

- (void)main
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = self->_serverZone;
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCSyncDownOperation main]", 491, v9);
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v9[0];
    id v7 = [(BRCServerZone *)v3 mangledID];
    uint64_t v8 = [v7 aliasTargetContainerString];
    *(_DWORD *)buf = 134218498;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Sync: fetching record changes for %@%@", buf, 0x20u);
  }
  [(BRCSyncDownOperation *)self hash];
  kdebug_trace();
  [(BRCSyncDownOperation *)self _startCreateZoneAndSubscriptionAndSyncDown];
  __brc_leave_section(v9);
}

- (void).cxx_destruct
{
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[NOTIF] Enhanced Drive Privacy enablement discovered via delta sync for %@%@");
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !record || record.etag != nil%@", v2, v3, v4, v5, v6);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_23_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: got a nil record and recordID%@", v2, v3, v4, v5, v6);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_23_cold_3(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] record changed: %@%@", buf, 0x16u);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] success%@", v2, v3, v4, v5, v6);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] cancelled%@", v2, v3, v4, v5, v6);
}

- (void)handleZoneNotFoundIfSyncingDownForTheFirstTime:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] ignoring zone not found error, because we're syncing down for the first time%@", v2, v3, v4, v5, v6);
}

void __68__BRCSyncDownOperation__fetchInitialZoneIfNecessaryWithCreatedZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no fetched zone and no error%@", v2, v3, v4, v5, v6);
}

void __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] can't register pushes: %@%@");
}

void __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] can't create zone or register pushes: %@%@", v1, 0x16u);
}

@end