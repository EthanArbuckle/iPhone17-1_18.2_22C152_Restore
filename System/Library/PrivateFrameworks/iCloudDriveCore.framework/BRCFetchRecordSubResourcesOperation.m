@interface BRCFetchRecordSubResourcesOperation
- (BOOL)_hasRecordsPendingSubResources;
- (BOOL)_markSubResourceRecordAsFetchedIfNecessary:(id)a3;
- (BOOL)_willFetchRecordForDeserialize:(id)a3;
- (BOOL)saveRecordsWithQueryCursor:(id)a3;
- (BOOL)saveRecordsWithServerChangeToken:(id)a3 clientChangeToken:(int64_t)a4 syncStatus:(int64_t)a5;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCPendingChangesStream)pendingChangesStream;
- (NSError)error;
- (id)createActivity;
- (id)initAndScheduleWithServerZone:(id)a3 parentOperation:(id)a4 pendingChangesStream:(id)a5 contentRecordsFetchedInline:(BOOL)a6 sessionContext:(id)a7;
- (id)movedZoneNames;
- (id)queryFinishedClientTruthCallback;
- (id)queryFinishedServerTruthCallback;
- (id)records;
- (int64_t)_compareRecordsForSaveWithFirstRecord:(id)a3 secondRecord:(id)a4;
- (unint64_t)recordsFetched;
- (unint64_t)recordsFetchedTotalMetadataSize;
- (unint64_t)xattrsFetchedTotalSize;
- (void)_cleanUpAfterSavingRecords;
- (void)_createSubResourceGroupsFromPendingChangesStreamIfNecessary;
- (void)_dump;
- (void)_fetchRecordsBlockingSaveIfNecessary;
- (void)_notifyWhenRecordsAreFetched:(id)a3;
- (void)_prepareToSaveRecords;
- (void)_saveRecordsToPendingChangesWithServerChangeToken:(id)a3 clientChangeToken:(int64_t)a4;
- (void)_scheduleDeserialize;
- (void)_scheduleXattrFetch;
- (void)_startWithParentOperation:(id)a3;
- (void)addRecord:(id)a3;
- (void)addRecordIDToDeserialize:(id)a3;
- (void)addRecordIDToDeserialize:(id)a3 recordType:(int64_t)a4;
- (void)cancel;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)notifyWhenCaughtUp:(BOOL)a3 whenRecordsAreFetchedAndFinish:(id)a4;
- (void)notifyWhenRecordsAreFetchedAndFinish:(id)a3;
- (void)recordIDWasDeleted:(id)a3;
- (void)records;
- (void)setQueryFinishedClientTruthCallback:(id)a3;
- (void)setQueryFinishedServerTruthCallback:(id)a3;
- (void)shareIDWasDeleted:(id)a3;
- (void)stop;
- (void)stopWithError:(id)a3;
@end

@implementation BRCFetchRecordSubResourcesOperation

- (unint64_t)recordsFetched
{
  return self->_recordsRequested;
}

- (unint64_t)recordsFetchedTotalMetadataSize
{
  return self->_recordsRequestedTotalMetadataSize;
}

- (unint64_t)xattrsFetchedTotalSize
{
  return self->_xattrsFetchedTotalSize;
}

- (id)records
{
  if ([(NSMutableDictionary *)self->_subResourceRecordsByID count] || self->_pendingChangesStream)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCFetchRecordSubResourcesOperation records]();
    }
  }
  v3 = [(NSMutableDictionary *)self->_recordsByID allValues];
  return v3;
}

- (id)movedZoneNames
{
  return self->_movedZoneNames;
}

- (id)initAndScheduleWithServerZone:(id)a3 parentOperation:(id)a4 pendingChangesStream:(id)a5 contentRecordsFetchedInline:(BOOL)a6 sessionContext:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v72 = a5;
  id v73 = a7;
  if (!v13 || !v14)
  {
    v69 = brc_bread_crumbs();
    v70 = brc_default_log();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
      -[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]();
    }
  }
  v15 = [v14 operationID];
  v16 = [v15 UUIDString];
  v17 = [@"record-fetcher" stringByAppendingPathComponent:v16];
  v18 = [v13 metadataSyncContext];
  v79.receiver = self;
  v79.super_class = (Class)BRCFetchRecordSubResourcesOperation;
  v19 = [(_BRCOperation *)&v79 initWithName:v17 syncContext:v18 sessionContext:v73];

  if (v19)
  {
    [v19 setNonDiscretionary:1];
    v19[629] = a6;
    v20 = (id *)(v19 + 504);
    objc_storeStrong((id *)v19 + 63, a3);
    objc_opt_class();
    id v71 = v14;
    v19[626] = objc_opt_isKindOfClass() & 1;
    v21 = [v13 mangledID];
    v22 = +[BRCUserDefaults defaultsForMangledID:v21];

    if (v19[626])
    {
      if ([v22 canSaveRecordsDirectlyForDeltaSync])
      {
        v23 = [*v20 failedListItemIDs];
        v24 = v19 + 627;
        v19[627] = [v23 count] == 0;

        goto LABEL_10;
      }
      char v25 = 0;
    }
    else
    {
      char v25 = [v22 canSaveRecordsDirectlyForList];
    }
    v24 = v19 + 627;
    v19[627] = v25;
LABEL_10:
    char v26 = [v22 canSaveRecordsDirectlyWithDeletes];
    v19[628] = v26;
    if (*v24 && (v26 & 1) == 0 && v19[626]) {
      unsigned char *v24 = [v72 hasRecordDeletes] ^ 1;
    }
    id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v28 = (void *)*((void *)v19 + 65);
    *((void *)v19 + 65) = v27;

    id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v30 = (void *)*((void *)v19 + 66);
    *((void *)v19 + 66) = v29;

    uint64_t v31 = objc_opt_new();
    v32 = (void *)*((void *)v19 + 67);
    *((void *)v19 + 67) = v31;

    uint64_t v33 = objc_opt_new();
    v34 = (void *)*((void *)v19 + 68);
    *((void *)v19 + 68) = v33;

    id v35 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v36 = (void *)*((void *)v19 + 69);
    *((void *)v19 + 69) = v35;

    objc_storeStrong((id *)v19 + 64, a5);
    v37 = [*v20 mangledID];
    v38 = +[BRCUserDefaults defaultsForMangledID:v37];
    *((_DWORD *)v19 + 150) = [v38 subResourceFetchLoopCacheSize];

    id v39 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    v40 = (void *)*((void *)v19 + 76);
    *((void *)v19 + 76) = v39;

    if (!v72) {
      v19[624] = 2;
    }
    dispatch_group_t v41 = dispatch_group_create();
    v42 = (void *)*((void *)v19 + 70);
    *((void *)v19 + 70) = v41;

    v43 = [v19 callbackQueue];
    v44 = (const dispatch_source_type_s *)MEMORY[0x263EF83B8];
    dispatch_source_t v45 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v43);
    v46 = (void *)*((void *)v19 + 72);
    *((void *)v19 + 72) = v45;

    v47 = [v19 callbackQueue];
    dispatch_source_t v48 = dispatch_source_create(v44, 0, 0, v47);
    v49 = (void *)*((void *)v19 + 74);
    *((void *)v19 + 74) = v48;

    objc_initWeak(&location, v19);
    v50 = (void *)*((void *)v19 + 72);
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __149__BRCFetchRecordSubResourcesOperation_initAndScheduleWithServerZone_parentOperation_pendingChangesStream_contentRecordsFetchedInline_sessionContext___block_invoke;
    v76[3] = &unk_26507ED20;
    objc_copyWeak(&v77, &location);
    id v51 = v50;
    v52 = v76;
    v53 = v51;
    v54 = v52;
    v55 = v54;
    v56 = (void (**)(void *))MEMORY[0x263F32768];
    v57 = v54;
    if (*MEMORY[0x263F32768])
    {
      v57 = ((void (*)(void *))*MEMORY[0x263F32768])(v54);
    }
    dispatch_block_t v58 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v57);
    dispatch_source_set_event_handler(v53, v58);

    v59 = (void *)*((void *)v19 + 74);
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __149__BRCFetchRecordSubResourcesOperation_initAndScheduleWithServerZone_parentOperation_pendingChangesStream_contentRecordsFetchedInline_sessionContext___block_invoke_7;
    v74[3] = &unk_26507ED20;
    objc_copyWeak(&v75, &location);
    id v60 = v59;
    v61 = v74;
    v62 = v60;
    v63 = v61;
    v64 = v63;
    v65 = *v56;
    v66 = v63;
    id v14 = v71;
    if (v65)
    {
      v66 = v65(v63);
    }
    dispatch_block_t v67 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v66);
    dispatch_source_set_event_handler(v62, v67);

    dispatch_resume(*((dispatch_object_t *)v19 + 72));
    dispatch_resume(*((dispatch_object_t *)v19 + 74));
    [v19 _startWithParentOperation:v71];
    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&location);
  }
  return v19;
}

void __149__BRCFetchRecordSubResourcesOperation_initAndScheduleWithServerZone_parentOperation_pendingChangesStream_contentRecordsFetchedInline_sessionContext___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memset(v6, 0, sizeof(v6));
  __brc_create_section(0, (uint64_t)"-[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]_block_invoke", 149, v6);
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v6[0];
    v5 = [WeakRetained name];
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v2;
    _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ scheduling xattr fetch%@", buf, 0x20u);
  }
  [WeakRetained _scheduleXattrFetch];
  __brc_leave_section(v6);
}

void __149__BRCFetchRecordSubResourcesOperation_initAndScheduleWithServerZone_parentOperation_pendingChangesStream_contentRecordsFetchedInline_sessionContext___block_invoke_7(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memset(v6, 0, sizeof(v6));
  __brc_create_section(0, (uint64_t)"-[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]_block_invoke", 155, v6);
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v6[0];
    v5 = [WeakRetained name];
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v2;
    _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ scheduling deserialize%@", buf, 0x20u);
  }
  [WeakRetained _scheduleDeserialize];
  __brc_leave_section(v6);
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "fetch-record-subresources", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 11))
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCFetchRecordSubResourcesOperation;
    BOOL v5 = [(_BRCOperation *)&v7 shouldRetryForError:v4];
  }

  return v5;
}

- (void)addRecord:(id)a3
{
  uint64_t v156 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(BRCServerZone *)self->_serverZone session];
  objc_super v7 = [v6 clientDB];
  uint64_t v8 = [v7 serialQueue];

  if (v8)
  {
    __int16 v9 = [v7 serialQueue];
    dispatch_assert_queue_not_V2(v9);
  }
  v10 = [(BRCServerZone *)self->_serverZone session];
  __int16 v11 = [v10 serverDB];
  v12 = [v11 serialQueue];

  if (v12)
  {
    uint64_t v13 = [v11 serialQueue];
    dispatch_assert_queue_not_V2(v13);
  }
  if (!self->_error && ([(BRCFetchRecordSubResourcesOperation *)self isCancelled] & 1) == 0)
  {
    if (self->_isDoneFetchingRecords)
    {
      v119 = brc_bread_crumbs();
      v120 = brc_default_log();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchRecordSubResourcesOperation addRecord:].cold.8();
      }
    }
    if ((objc_msgSend(v4, "brc_isInterestingRecordForSyncDown") & 1) == 0)
    {
      brc_bread_crumbs();
      v15 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      id v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [(BRCFetchRecordSubResourcesOperation *)self name];
        uint64_t v31 = [v4 recordID];
        v32 = [v31 recordName];
        *(_DWORD *)buf = 138412802;
        id v151 = v30;
        __int16 v152 = 2112;
        v153 = v32;
        __int16 v154 = 2112;
        v155 = v15;
        _os_log_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ got a record we're not interested in: '%@'%@", buf, 0x20u);
      }
      goto LABEL_100;
    }
    [v4 processAppLibraryDataWithMovedZoneNames:self->_movedZoneNames serverZone:self->_serverZone isDeltaSync:self->_isDeltaSync];
    if ((objc_msgSend(v4, "brc_isInterestingRecordForSave") & 1) == 0)
    {
      brc_bread_crumbs();
      uint64_t v33 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v102 = [(BRCFetchRecordSubResourcesOperation *)self name];
        v103 = [v4 recordID];
        v104 = [v103 recordName];
        *(_DWORD *)buf = 138412802;
        id v151 = v102;
        __int16 v152 = 2112;
        v153 = v104;
        __int16 v154 = 2112;
        v155 = v33;
        _os_log_debug_impl(&dword_23FA42000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ ignoring record we're not interested in saving named: %@%@", buf, 0x20u);
      }
      pendingChangesStream = self->_pendingChangesStream;
      v15 = [v4 recordID];
      [(BRCPendingChangesStream *)pendingChangesStream unblockRecordSavesWaitingOnRecordID:v15];
      goto LABEL_100;
    }
    ++self->_recordsRequested;
    self->_recordsRequestedTotalMetadataSize += [v4 size];
    id v14 = [v4 recordID];
    v15 = v14;
    if (!self->_contentRecordsFetchedInline)
    {
      v16 = [(BRCFetchSubResourceRecord *)v14 recordName];
      if ([v16 hasPrefix:@"documentStructure/"])
      {
        v17 = [v16 substringFromIndex:objc_msgSend(@"documentStructure/", "length")];
        uint64_t v18 = [@"documentContent/" stringByAppendingString:v17];

        id v19 = objc_alloc(MEMORY[0x263EFD7E8]);
        v20 = [v4 recordID];
        v21 = [v20 zoneID];
        v22 = (void *)[v19 initWithRecordName:v18 zoneID:v21];

        [(BRCFetchRecordSubResourcesOperation *)self addRecordIDToDeserialize:v22];
        v16 = (void *)v18;
      }
    }
    uint64_t v23 = [v4 share];
    if (!v23
      || (v24 = (void *)v23, char v25 = [(BRCServerZone *)self->_serverZone state], v24, (v25 & 4) != 0))
    {
      v36 = 0;
      goto LABEL_28;
    }
    char v26 = [v4 share];
    id v27 = [v26 recordID];

    v28 = [(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:v27];
    if (v28)
    {
    }
    else if (![(BRCPendingChangesStream *)self->_pendingChangesStream hasFetchRecordByID:v27])
    {
      brc_bread_crumbs();
      v105 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      v106 = brc_default_log();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        v118 = [(BRCFetchRecordSubResourcesOperation *)self name];
        *(_DWORD *)buf = 138412802;
        id v151 = v118;
        __int16 v152 = 2112;
        v153 = v27;
        __int16 v154 = 2112;
        v155 = v105;
        _os_log_debug_impl(&dword_23FA42000, v106, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ needs to fetch shareID %@%@", buf, 0x20u);
      }
      v36 = v27;
      goto LABEL_27;
    }
    v36 = 0;
LABEL_27:

LABEL_28:
    v37 = [v4 objectForKeyedSubscript:@"xattr"];
    v38 = [v4 encryptedValues];
    id v39 = [v38 objectForKeyedSubscript:@"xattrSignature"];

    objc_opt_class();
    v147 = v37;
    if (objc_opt_isKindOfClass())
    {
      if (v39)
      {
        v40 = v39;
      }
      else
      {
        v40 = [v37 signature];
      }
      dispatch_group_t v41 = v40;
      v42 = [(BRCServerZone *)self->_serverZone session];
      v43 = [v42 stageRegistry];
      [v43 urlForXattrSignature:v41];
      dispatch_source_t v45 = v44 = v41;

      if ([v45 checkResourceIsReachableAndReturnError:0])
      {
        v46 = v44;
        v149 = 0;
      }
      else
      {
        v149 = v44;
        brc_bread_crumbs();
        v46 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
        v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          [(BRCFetchRecordSubResourcesOperation *)self name];
          v114 = v113 = v39;
          *(_DWORD *)buf = 138412802;
          id v151 = v114;
          __int16 v152 = 2112;
          v153 = v149;
          __int16 v154 = 2112;
          v155 = v46;
          _os_log_debug_impl(&dword_23FA42000, v47, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ needs to fetch xattr signature %@%@", buf, 0x20u);

          id v39 = v113;
        }
      }
    }
    else
    {
      v149 = 0;
    }
    dispatch_source_t v48 = [v4 recordType];
    int v49 = [v48 isEqualToString:@"content"];

    v148 = v36;
    v146 = v39;
    if (v49)
    {
      v50 = [(BRCFetchSubResourceRecord *)v15 recordName];
      if (([v50 hasPrefix:@"documentContent/"] & 1) == 0)
      {
        v125 = v50;
        v126 = brc_bread_crumbs();
        v127 = brc_default_log();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation addRecord:].cold.7();
        }

        v50 = v125;
      }
      v143 = v50;
      id v51 = [v50 substringFromIndex:objc_msgSend(@"documentContent/", "length")];
      uint64_t v52 = [@"documentStructure/" stringByAppendingString:v51];

      id v53 = objc_alloc(MEMORY[0x263EFD7E8]);
      v54 = [(BRCFetchSubResourceRecord *)v15 zoneID];
      v145 = (void *)v52;
      v55 = (void *)[v53 initWithRecordName:v52 zoneID:v54];

      v56 = [(NSMutableDictionary *)self->_subResourceRecordsByID objectForKeyedSubscript:v55];
      if (v56)
      {
        brc_bread_crumbs();
        v57 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
        dispatch_block_t v58 = brc_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          v109 = [v55 recordName];
          v142 = [v4 recordID];
          v110 = [v142 recordName];
          *(_DWORD *)buf = 138412802;
          id v151 = v109;
          __int16 v152 = 2112;
          v153 = v110;
          __int16 v154 = 2112;
          v155 = v57;
          _os_log_debug_impl(&dword_23FA42000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] Release block %@ on %@%@", buf, 0x20u);
        }
        v59 = [v56 recordIDBlockingSave];
        id v60 = [v4 recordID];
        char v61 = [v59 isEqual:v60];

        if (v61)
        {
          [v56 setRecordIDBlockingSave:0];
          [(BRCFetchRecordSubResourcesOperation *)self _markSubResourceRecordAsFetchedIfNecessary:v56];
        }
        else
        {
          brc_bread_crumbs();
          v80 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
          v81 = brc_default_log();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            v140 = [v4 recordID];
            v82 = [v140 recordName];
            [v56 recordIDBlockingSave];
            v83 = v141 = v80;
            v84 = [v83 recordName];
            *(_DWORD *)buf = 138412802;
            id v151 = v82;
            __int16 v152 = 2112;
            v153 = v84;
            __int16 v154 = 2112;
            v155 = v141;
            _os_log_impl(&dword_23FA42000, v81, OS_LOG_TYPE_DEFAULT, "[WARNING] Expected recordIDBlockingSave %@ got %@%@", buf, 0x20u);

            v80 = v141;
          }
        }
      }
      v85 = self->_pendingChangesStream;
      v86 = [v4 recordID];
      [(BRCPendingChangesStream *)v85 unblockRecord:v55 waitingOnRecord:v86];

      if ([(BRCServerZone *)self->_serverZone isSharedZone]
        && ([v4 share], (v87 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        v88 = [(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:v55];
        id v71 = v145;
        if (v88)
        {

          id v78 = 0;
          v36 = v148;
LABEL_83:

          objc_super v79 = v149;
          v68 = v143;
          goto LABEL_84;
        }
        BOOL v91 = [(BRCPendingChangesStream *)self->_pendingChangesStream hasFetchRecordByID:v55];

        if (!v91)
        {
          brc_bread_crumbs();
          v93 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
          v94 = brc_default_log();
          v36 = v148;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            v115 = [v4 recordID];
            v116 = [v115 recordName];
            v117 = [v55 recordName];
            *(_DWORD *)buf = 138412802;
            id v151 = v116;
            __int16 v152 = 2112;
            v153 = v117;
            __int16 v154 = 2112;
            v155 = v93;
            _os_log_debug_impl(&dword_23FA42000, v94, OS_LOG_TYPE_DEBUG, "[DEBUG] Block %@ on %@%@", buf, 0x20u);

            v36 = v148;
          }

          id v78 = v55;
          goto LABEL_82;
        }
      }
      id v78 = 0;
      v36 = v148;
LABEL_82:
      id v71 = v145;
      goto LABEL_83;
    }
    v62 = [v4 recordType];
    if ([v62 isEqualToString:@"structure"])
    {
      v63 = [(BRCFetchSubResourceRecord *)v15 recordName];
      int v64 = [v63 hasPrefix:@"documentStructure/"];

      if (v64)
      {
        v65 = [(BRCFetchSubResourceRecord *)v15 recordName];
        v66 = [v65 substringFromIndex:objc_msgSend(@"documentStructure/", "length")];
        uint64_t v67 = [@"documentContent/" stringByAppendingString:v66];

        v68 = (void *)v67;
        id v69 = objc_alloc(MEMORY[0x263EFD7E8]);
        v70 = [(BRCFetchSubResourceRecord *)v15 zoneID];
        id v71 = (id)[v69 initWithRecordName:v68 zoneID:v70];

        if ([(BRCServerZone *)self->_serverZone isSharedZone])
        {
          id v72 = [v4 share];
          if (v72)
          {

            goto LABEL_107;
          }
        }
        v92 = [(NSMutableDictionary *)self->_subResourceRecordsByID objectForKeyedSubscript:v71];
        objc_super v79 = v149;
        if (!v92)
        {
          BOOL v107 = [(BRCPendingChangesStream *)self->_pendingChangesStream hasRecordIDBlockedOnSubResources:v71];

          if (!v107)
          {
            brc_bread_crumbs();
            v111 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
            v112 = brc_default_log();
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
            {
              [v4 recordID];
              v121 = v144 = v68;
              [v121 recordName];
              v123 = v122 = v71;
              v124 = [v122 recordName];
              *(_DWORD *)buf = 138412802;
              id v151 = v123;
              __int16 v152 = 2112;
              v153 = v124;
              __int16 v154 = 2112;
              v155 = v111;
              _os_log_debug_impl(&dword_23FA42000, v112, OS_LOG_TYPE_DEBUG, "[DEBUG] Block %@ on %@%@", buf, 0x20u);

              id v71 = v122;
              v68 = v144;
            }

            id v71 = v71;
            id v78 = v71;
            goto LABEL_111;
          }
LABEL_107:
          id v78 = 0;
LABEL_111:
          objc_super v79 = v149;
          goto LABEL_84;
        }

        id v78 = 0;
LABEL_84:

LABEL_85:
        if (v36 || v79 || v78)
        {
          v96 = [[BRCFetchSubResourceRecord alloc] initWithChangedRecord:v4 recordIDNeedingFetch:v36 xattrSignatureNeedingFetch:v79 recordIDBlockingSave:v78];
          if ([(NSMutableArray *)self->_deletedShareIDs containsObject:v15])
          {
            v134 = brc_bread_crumbs();
            v135 = brc_default_log();
            if (os_log_type_enabled(v135, OS_LOG_TYPE_FAULT)) {
              -[BRCFetchRecordSubResourcesOperation addRecord:]();
            }
          }
          if ([(NSMutableArray *)self->_deletedRecordIDs containsObject:v15])
          {
            v136 = brc_bread_crumbs();
            v137 = brc_default_log();
            if (os_log_type_enabled(v137, OS_LOG_TYPE_FAULT)) {
              -[BRCFetchRecordSubResourcesOperation addRecord:]();
            }
          }
          v100 = [(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:v15];

          if (v100)
          {
            v138 = brc_bread_crumbs();
            v139 = brc_default_log();
            if (os_log_type_enabled(v139, OS_LOG_TYPE_FAULT)) {
              -[BRCFetchRecordSubResourcesOperation addRecord:]();
            }
          }
          [(NSMutableDictionary *)self->_subResourceRecordsByID setObject:v96 forKeyedSubscript:v15];
          [(NSMutableArray *)self->_deletedShareIDs removeObject:v15];
          [(NSMutableArray *)self->_deletedRecordIDs removeObject:v15];
          [(NSMutableDictionary *)self->_recordsByID removeObjectForKey:v15];
          v97 = brc_bread_crumbs();
          v101 = brc_default_log();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            v108 = [(BRCFetchRecordSubResourcesOperation *)self name];
            *(_DWORD *)buf = 138412802;
            id v151 = v108;
            __int16 v152 = 2112;
            v153 = v96;
            __int16 v154 = 2112;
            v155 = (BRCFetchSubResourceRecord *)v97;
            _os_log_debug_impl(&dword_23FA42000, v101, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ record changed %@ which needs subResources fetched%@", buf, 0x20u);
          }
          v36 = v148;
        }
        else
        {
          if ([(NSMutableArray *)self->_deletedShareIDs containsObject:v15])
          {
            v128 = brc_bread_crumbs();
            v129 = brc_default_log();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT)) {
              -[BRCFetchRecordSubResourcesOperation addRecord:]();
            }

            v36 = v148;
          }
          if ([(NSMutableArray *)self->_deletedRecordIDs containsObject:v15])
          {
            v130 = brc_bread_crumbs();
            v131 = brc_default_log();
            if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT)) {
              -[BRCFetchRecordSubResourcesOperation addRecord:]();
            }

            v36 = v148;
          }
          v95 = [(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:v15];

          if (v95)
          {
            v132 = brc_bread_crumbs();
            v133 = brc_default_log();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_FAULT)) {
              -[BRCFetchRecordSubResourcesOperation addRecord:]();
            }

            v36 = v148;
          }
          [(NSMutableDictionary *)self->_recordsByID setObject:v4 forKeyedSubscript:v15];
          [(NSMutableArray *)self->_deletedShareIDs removeObject:v15];
          [(NSMutableArray *)self->_deletedRecordIDs removeObject:v15];
          [(NSMutableDictionary *)self->_subResourceRecordsByID removeObjectForKey:v15];
          brc_bread_crumbs();
          v96 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
          v97 = brc_default_log();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          {
            v98 = [(BRCFetchRecordSubResourcesOperation *)self name];
            v99 = [v4 debugDescription];
            *(_DWORD *)buf = 138412802;
            id v151 = v98;
            __int16 v152 = 2112;
            v153 = v99;
            __int16 v154 = 2112;
            v155 = v96;
            _os_log_debug_impl(&dword_23FA42000, v97, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ record changed %@%@", buf, 0x20u);
          }
        }

LABEL_100:
        goto LABEL_101;
      }
    }
    else
    {
    }
    id v73 = [v4 recordType];
    int v74 = [v73 isEqualToString:*MEMORY[0x263EFD510]];

    if (!v74)
    {
      id v78 = 0;
      objc_super v79 = v149;
      goto LABEL_85;
    }
    v68 = [(BRCFetchSubResourceRecord *)v15 brc_shareItemID];
    id v71 = [v4 objectForKeyedSubscript:*MEMORY[0x263EFD538]];
    if (!v71)
    {
      brc_bread_crumbs();
      id v75 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      v76 = brc_default_log();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v151 = v4;
        __int16 v152 = 2112;
        v153 = v75;
        _os_log_impl(&dword_23FA42000, v76, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't determine record type for root share record %@%@", buf, 0x16u);
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v71 isEqualToString:*MEMORY[0x263F32480]])
    {
      id v77 = [v68 structureRecordIDForItemType:0 zone:self->_serverZone aliasTargetZoneIsShared:1];
    }
    else
    {
      v89 = [(BRCServerZone *)self->_serverZone zoneID];
      id v77 = [v68 contentsRecordIDInZoneID:v89];
    }
    v90 = [(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:v77];
    objc_super v79 = v149;
    if (v90)
    {
    }
    else if (![(BRCPendingChangesStream *)self->_pendingChangesStream hasFetchRecordByID:v77])
    {
      id v78 = v77;
      goto LABEL_78;
    }
    id v78 = 0;
LABEL_78:

    goto LABEL_84;
  }
LABEL_101:
}

- (void)addRecordIDToDeserialize:(id)a3
{
}

- (void)addRecordIDToDeserialize:(id)a3 recordType:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v7);

  if (!self->_error && ([(BRCFetchRecordSubResourcesOperation *)self isCancelled] & 1) == 0)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_subResourceRecordsByID objectForKeyedSubscript:v6];
    if (v8
      || ([(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:v6],
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else if (![(BRCPendingChangesStream *)self->_pendingChangesStream hasFetchRecordByID:v6])
    {
      if (self->_isDoneFetchingRecords)
      {
        v16 = brc_bread_crumbs();
        v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation addRecord:].cold.8();
        }
      }
      if ([(NSMutableArray *)self->_deletedShareIDs containsObject:v6])
      {
        uint64_t v18 = brc_bread_crumbs();
        id v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation addRecord:]();
        }
      }
      if ([(NSMutableArray *)self->_deletedRecordIDs containsObject:v6])
      {
        v20 = brc_bread_crumbs();
        v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation addRecord:]();
        }
      }
      v12 = [(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:v6];

      if (v12)
      {
        v22 = brc_bread_crumbs();
        uint64_t v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation addRecord:]();
        }
      }
      uint64_t v13 = [(NSMutableDictionary *)self->_subResourceRecordsByID objectForKeyedSubscript:v6];

      if (v13)
      {
        v24 = brc_bread_crumbs();
        char v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation addRecordIDToDeserialize:recordType:]();
        }
      }
      __int16 v9 = [[BRCFetchSubResourceRecord alloc] initWithRecordIDNeedingFetch:v6 recordType:a4];
      [(NSMutableDictionary *)self->_subResourceRecordsByID setObject:v9 forKeyedSubscript:v6];
      [(NSMutableArray *)self->_deletedShareIDs removeObject:v6];
      [(NSMutableArray *)self->_deletedRecordIDs removeObject:v6];
      [(NSMutableDictionary *)self->_recordsByID removeObjectForKey:v6];
      v10 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = [(BRCFetchRecordSubResourcesOperation *)self name];
        *(_DWORD *)buf = 138412802;
        id v27 = v15;
        __int16 v28 = 2112;
        id v29 = v6;
        __int16 v30 = 2112;
        uint64_t v31 = (BRCFetchSubResourceRecord *)v10;
        _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ scheduling recordID deserialize for %@%@", buf, 0x20u);
      }
      goto LABEL_8;
    }
    brc_bread_crumbs();
    __int16 v9 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [(BRCFetchRecordSubResourcesOperation *)self name];
      *(_DWORD *)buf = 138412802;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      uint64_t v31 = v9;
      _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ has no need to deserialize %@ because we've already fetch it%@", buf, 0x20u);
    }
LABEL_8:
  }
}

- (void)recordIDWasDeleted:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  if (!self->_error && ([(BRCFetchRecordSubResourcesOperation *)self isCancelled] & 1) == 0)
  {
    if (!self->_canSaveDirectlyWithDeletes) {
      self->_canSaveDirectly = 0;
    }
    if (objc_msgSend(v4, "brc_isZoneRootRecordID"))
    {
      id v6 = brc_bread_crumbs();
      objc_super v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(BRCFetchRecordSubResourcesOperation *)self name];
        *(_DWORD *)buf = 138412802;
        uint64_t v31 = v8;
        __int16 v32 = 2112;
        id v33 = v4;
        __int16 v34 = 2112;
        id v35 = v6;
        _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ Zone root record ID was deleted %@%@", buf, 0x20u);
      }
      id v9 = [(BRCServerZone *)self->_serverZone clientZone];
      [v9 handleRootRecordDeletion];
    }
    else if (objc_msgSend(v4, "brc_isAppLibraryRootRecordID"))
    {
      v10 = brc_bread_crumbs();
      __int16 v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(BRCFetchRecordSubResourcesOperation *)self name];
        *(_DWORD *)buf = 138412802;
        uint64_t v31 = v12;
        __int16 v32 = 2112;
        id v33 = v4;
        __int16 v34 = 2112;
        id v35 = v10;
        _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ App library root record ID was deleted %@%@", buf, 0x20u);
      }
      uint64_t v13 = [(BRCServerZone *)self->_serverZone session];
      id v14 = [(BRCServerZone *)self->_serverZone session];
      v15 = [v14 clientTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__BRCFetchRecordSubResourcesOperation_recordIDWasDeleted___block_invoke;
      block[3] = &unk_26507ED98;
      id v28 = v13;
      id v29 = v4;
      id v9 = v13;
      dispatch_async_and_wait(v15, block);
    }
    else
    {
      if ([(NSMutableArray *)self->_deletedRecordIDs containsObject:v4])
      {
        v20 = brc_bread_crumbs();
        v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation addRecord:]();
        }
      }
      v16 = [(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:v4];

      if (v16)
      {
        v22 = brc_bread_crumbs();
        uint64_t v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation addRecord:]();
        }
      }
      v17 = [(NSMutableDictionary *)self->_subResourceRecordsByID objectForKeyedSubscript:v4];

      if (v17)
      {
        uint64_t v26 = 528;
        v24 = brc_bread_crumbs();
        char v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation addRecordIDToDeserialize:recordType:]();
        }
      }
      -[NSMutableArray addObject:](self->_deletedRecordIDs, "addObject:", v4, v26);
      [(NSMutableDictionary *)self->_recordsByID removeObjectForKey:v4];
      [(NSMutableDictionary *)self->_subResourceRecordsByID removeObjectForKey:v4];
      brc_bread_crumbs();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = [(BRCFetchRecordSubResourcesOperation *)self name];
        *(_DWORD *)buf = 138412802;
        uint64_t v31 = v19;
        __int16 v32 = 2112;
        id v33 = v4;
        __int16 v34 = 2112;
        id v35 = v9;
        _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ record ID was deleted %@%@", buf, 0x20u);
      }
    }
  }
}

void __58__BRCFetchRecordSubResourcesOperation_recordIDWasDeleted___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  os_activity_t v2 = objc_msgSend(*(id *)(a1 + 40), "brc_appLibraryRootZoneName");
  id v3 = [v1 appLibraryByID:v2];

  [v3 clearStateBits:134217730];
}

- (void)shareIDWasDeleted:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  if (!self->_error && ([(BRCFetchRecordSubResourcesOperation *)self isCancelled] & 1) == 0)
  {
    id v6 = [(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:v4];

    if (v6)
    {
      v10 = brc_bread_crumbs();
      __int16 v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchRecordSubResourcesOperation shareIDWasDeleted:]();
      }
    }
    if ([(NSMutableArray *)self->_deletedShareIDs containsObject:v4])
    {
      v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchRecordSubResourcesOperation shareIDWasDeleted:]();
      }
    }
    [(NSMutableDictionary *)self->_recordsByID removeObjectForKey:v4];
    [(NSMutableArray *)self->_deletedShareIDs addObject:v4];
    objc_super v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [(BRCFetchRecordSubResourcesOperation *)self name];
      *(_DWORD *)buf = 138412802;
      v15 = v9;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ share ID was deleted %@%@", buf, 0x20u);
    }
  }
}

- (void)_notifyWhenRecordsAreFetched:(id)a3
{
  id v4 = a3;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __68__BRCFetchRecordSubResourcesOperation__notifyWhenRecordsAreFetched___block_invoke;
  v15 = &unk_26507F850;
  __int16 v16 = self;
  id v5 = v4;
  id v17 = v5;
  uint64_t v6 = MEMORY[0x2455D9A50](&v12);
  objc_super v7 = (void *)v6;
  if (self->_deserializeGroup)
  {
    uint64_t v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCFetchRecordSubResourcesOperation _notifyWhenRecordsAreFetched:]();
    }

    deserializeGroup = self->_deserializeGroup;
    __int16 v11 = [(_BRCOperation *)self callbackQueue];
    dispatch_group_notify(deserializeGroup, v11, v7);
  }
  else
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

void __68__BRCFetchRecordSubResourcesOperation__notifyWhenRecordsAreFetched___block_invoke(uint64_t a1)
{
  os_activity_t v2 = *(void **)(a1 + 32);
  if (v2[71])
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __68__BRCFetchRecordSubResourcesOperation__notifyWhenRecordsAreFetched___block_invoke_cold_1();
    }

    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[71];
    objc_super v7 = [v5 callbackQueue];
    dispatch_group_notify(v6, v7, *(dispatch_block_t *)(a1 + 40));
  }
  else
  {
    uint64_t v8 = [v2 callbackQueue];
    dispatch_async(v8, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)notifyWhenCaughtUp:(BOOL)a3 whenRecordsAreFetchedAndFinish:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_super v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BRCFetchRecordSubResourcesOperation notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:]();
  }

  if (self->_pendingChangesStream)
  {
    if ([(NSMutableDictionary *)self->_recordsByID count]
      || [(NSMutableArray *)self->_deletedShareIDs count]
      || [(NSMutableArray *)self->_deletedRecordIDs count]
      || [(NSMutableDictionary *)self->_subResourceRecordsByID count])
    {
      uint64_t v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchRecordSubResourcesOperation notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:]();
      }
    }
    [(BRCFetchRecordSubResourcesOperation *)self _createSubResourceGroupsFromPendingChangesStreamIfNecessary];
  }
  else
  {
    [(BRCFetchRecordSubResourcesOperation *)self _prepareToSaveRecords];
  }
  self->_deserializeState = 2;
  if (v4)
  {
    [(BRCFetchRecordSubResourcesOperation *)self _fetchRecordsBlockingSaveIfNecessary];
  }
  else
  {
    id v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCFetchRecordSubResourcesOperation notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:]();
    }
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__BRCFetchRecordSubResourcesOperation_notifyWhenCaughtUp_whenRecordsAreFetchedAndFinish___block_invoke;
  v14[3] = &unk_26507F450;
  v14[4] = self;
  id v15 = v6;
  id v11 = v6;
  [(BRCFetchRecordSubResourcesOperation *)self _notifyWhenRecordsAreFetched:v14];
}

uint64_t __89__BRCFetchRecordSubResourcesOperation_notifyWhenCaughtUp_whenRecordsAreFetchedAndFinish___block_invoke(uint64_t a1)
{
  os_activity_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __89__BRCFetchRecordSubResourcesOperation_notifyWhenCaughtUp_whenRecordsAreFetchedAndFinish___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) stop];
}

- (void)notifyWhenRecordsAreFetchedAndFinish:(id)a3
{
}

- (void)_startWithParentOperation:(id)a3
{
  id v4 = a3;
  if (self->_isDoneFetchingRecords)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCFetchRecordSubResourcesOperation addRecord:].cold.8();
    }
  }
  dispatch_group_enter((dispatch_group_t)self->_operationGroup);
  [v4 addSubOperation:self];
}

- (void)stopWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v6);

  if (v5 && !self->_error) {
    objc_storeStrong((id *)&self->_error, a3);
  }
  if (!self->_isDoneFetchingRecords)
  {
    objc_super v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(BRCFetchRecordSubResourcesOperation *)self name];
      int v12 = 138412802;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ stopping fetching records with error %@%@", (uint8_t *)&v12, 0x20u);
    }
    dispatch_group_leave((dispatch_group_t)self->_operationGroup);
    self->_isDoneFetchingRecords = 1;
  }
  if (self->_deserializeState == 1)
  {
    id v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCFetchRecordSubResourcesOperation stopWithError:]();
    }

    self->_deserializeState = 0;
    dispatch_resume((dispatch_object_t)self->_deserializeSource);
  }
}

- (void)cancel
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, (uint64_t)v0, "[DEBUG] cancelling %@%@", v1);
}

void __45__BRCFetchRecordSubResourcesOperation_cancel__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 stopWithError:v2];
}

- (void)stop
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _xattrFetchingGroup == nil%@", v2, v3, v4, v5, v6);
}

- (void)main
{
  operationGroup = self->_operationGroup;
  uint64_t v4 = [(_BRCOperation *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__BRCFetchRecordSubResourcesOperation_main__block_invoke;
  block[3] = &unk_26507ED70;
  void block[4] = self;
  dispatch_group_notify(operationGroup, v4, block);
}

uint64_t __43__BRCFetchRecordSubResourcesOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__BRCFetchRecordSubResourcesOperation_main__block_invoke_2;
  v3[3] = &unk_26507ED70;
  v3[4] = v1;
  return [v1 _notifyWhenRecordsAreFetched:v3];
}

uint64_t __43__BRCFetchRecordSubResourcesOperation_main__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(*(void *)(a1 + 32) + 616)];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCFetchRecordSubResourcesOperation finishWithResult:error:].cold.5();
  }

  if (([(BRCFetchRecordSubResourcesOperation *)self isCancelled] & 1) == 0 && self->_xattrFetchingGroup)
  {
    uint64_t v13 = brc_bread_crumbs();
    __int16 v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCFetchRecordSubResourcesOperation finishWithResult:error:].cold.4();
    }
  }
  if (([(BRCFetchRecordSubResourcesOperation *)self isCancelled] & 1) == 0 && self->_deserializeGroup)
  {
    id v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCFetchRecordSubResourcesOperation finishWithResult:error:]();
    }
  }
  if (!v6)
  {
    if (self->_queryFinishedServerTruthCallback)
    {
      id v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchRecordSubResourcesOperation finishWithResult:error:]();
      }
    }
    if (self->_queryFinishedClientTruthCallback)
    {
      id v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchRecordSubResourcesOperation finishWithResult:error:]();
      }
    }
  }
  id queryFinishedServerTruthCallback = self->_queryFinishedServerTruthCallback;
  self->_id queryFinishedServerTruthCallback = 0;

  id queryFinishedClientTruthCallback = self->_queryFinishedClientTruthCallback;
  self->_id queryFinishedClientTruthCallback = 0;

  dispatch_source_cancel((dispatch_source_t)self->_xattrFetchingSource);
  dispatch_source_cancel((dispatch_source_t)self->_deserializeSource);
  v21.receiver = self;
  v21.super_class = (Class)BRCFetchRecordSubResourcesOperation;
  [(_BRCOperation *)&v21 finishWithResult:v7 error:v6];
}

- (BOOL)_willFetchRecordForDeserialize:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableOrderedSet *)self->_loopDetectionCache containsObject:v4];
  if (v5)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCFetchRecordSubResourcesOperation _willFetchRecordForDeserialize:]();
    }

    uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Fetch loop trying to fetch %@", v4);
    [(BRCFetchRecordSubResourcesOperation *)self stopWithError:v8];
  }
  else
  {
    [(NSMutableOrderedSet *)self->_loopDetectionCache addObject:v4];
    if (self->_loopDetectionCacheSize < [(NSMutableOrderedSet *)self->_loopDetectionCache count]) {
      [(NSMutableOrderedSet *)self->_loopDetectionCache removeObjectAtIndex:0];
    }
  }

  return v5 ^ 1;
}

- (void)_scheduleDeserialize
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _deserializeState != BRCDeserializeStateWaitingForNextBatchSave%@", v2, v3, v4, v5, v6);
}

BOOL __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)[*(id *)(a1 + 32) count] < *(void *)(a1 + 40);
}

void __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke_31(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x2455D97F0]();
  id v11 = [*(id *)(*(void *)(a1 + 32) + 520) objectForKeyedSubscript:v8];
  if (v11)
  {

LABEL_4:
    int v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v58 = v8;
      __int16 v59 = 2112;
      id v60 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] We deserialized record id %@ which was useless because it came later%@", buf, 0x16u);
    }

    __int16 v14 = [*(id *)(*(void *)(a1 + 32) + 520) objectForKeyedSubscript:v8];

    if (!v14) {
      [*(id *)(*(void *)(a1 + 32) + 512) unblockRecordSavesWaitingOnRecordID:v8];
    }
    goto LABEL_38;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 512) hasFetchRecordByID:v8]) {
    goto LABEL_4;
  }
  if (v7)
  {
    v46 = v10;
    id v47 = v9;
    id v48 = v7;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v15 = [*(id *)(*(void *)(a1 + 32) + 528) allValues];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v54 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v21 = [v20 recordIDNeedingFetch];
          if (v21)
          {
            v22 = (void *)v21;
            uint64_t v23 = [v20 recordIDNeedingFetch];
            int v24 = [v8 isEqual:v23];

            if (v24)
            {
              [v20 setRecordIDNeedingFetch:0];
              [*(id *)(a1 + 32) _markSubResourceRecordAsFetchedIfNecessary:v20];
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v53 objects:v66 count:16];
      }
      while (v17);
    }

    id v7 = v48;
    [*(id *)(a1 + 32) addRecord:v48];
LABEL_37:
    v10 = v46;
    id v9 = v47;
    goto LABEL_38;
  }
  if (objc_msgSend(v9, "brc_isCloudKitUnknownItemError"))
  {
    uint64_t v45 = 512;
    v46 = v10;
    id v47 = v9;
    char v25 = brc_bread_crumbs();
    uint64_t v26 = brc_default_log();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
      __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke_31_cold_1();
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v27 = [*(id *)(*(void *)(a1 + 32) + 528) allValues];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v27);
          }
          __int16 v32 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          uint64_t v33 = objc_msgSend(v32, "recordIDNeedingFetch", v45);
          if (v33)
          {
            __int16 v34 = (void *)v33;
            id v35 = [v32 recordIDNeedingFetch];
            int v36 = [v8 isEqual:v35];

            if (v36)
            {
              [v32 setRecordIDNeedingFetch:0];
              [*(id *)(a1 + 32) _markSubResourceRecordAsFetchedIfNecessary:v32];
            }
          }
          uint64_t v37 = [v32 recordIDBlockingSave];
          if (v37)
          {
            v38 = (void *)v37;
            id v39 = [v32 recordIDBlockingSave];
            int v40 = [v8 isEqual:v39];

            if (v40)
            {
              [v32 setRecordIDBlockingSave:0];
              [*(id *)(a1 + 32) _markSubResourceRecordAsFetchedIfNecessary:v32];
            }
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v65 count:16];
      }
      while (v29);
    }

    [*(id *)(*(void *)(a1 + 32) + v45) unblockRecordSavesWaitingOnRecordID:v8];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v7 = 0;
    goto LABEL_37;
  }
  if (v9)
  {
    dispatch_group_t v41 = v10;
    v42 = brc_bread_crumbs();
    v43 = brc_default_log();
    if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
    {
      v44 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138413058;
      id v58 = v44;
      __int16 v59 = 2112;
      id v60 = v8;
      __int16 v61 = 2112;
      id v62 = v9;
      __int16 v63 = 2112;
      int v64 = v42;
      _os_log_error_impl(&dword_23FA42000, v43, (os_log_type_t)0x90u, "[ERROR] %@ Deserialize record failed for %@ - %@%@", buf, 0x2Au);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    v10 = v41;
  }
LABEL_38:
}

void __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  dispatch_source_merge_data(*(dispatch_source_t *)(*(void *)(a1 + 32) + 592), 1uLL);
  if (objc_msgSend(v4, "brc_isCloudKitCancellationError"))
  {
    uint64_t v5 = brc_bread_crumbs();
    uint8_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [*(id *)(a1 + 32) name];
      int v16 = 138412802;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] failed to deserialize records for %@: %@%@", (uint8_t *)&v16, 0x20u);
LABEL_22:
    }
  }
  else
  {
    uint64_t v5 = brc_bread_crumbs();
    uint8_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      id v7 = [*(id *)(a1 + 32) name];
      int v16 = 138412802;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      _os_log_error_impl(&dword_23FA42000, v6, (os_log_type_t)0x90u, "[ERROR] failed to deserialize records for %@: %@%@", (uint8_t *)&v16, 0x20u);
      goto LABEL_22;
    }
  }

  if (!v4
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v8 + 624) == 2)
    {
      [(id)v8 saveRecordsWithQueryCursor:0];
    }
    else
    {
      if (!*(void *)(v8 + 616))
      {
        *(unsigned char *)(v8 + 624) = 1;
        id v11 = " but waiting to resume";
        goto LABEL_16;
      }
      *(unsigned char *)(v8 + 624) = 0;
    }
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 592));
    id v11 = "";
LABEL_16:
    int v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v14 = [*(id *)(a1 + 32) name];
      int v16 = 138412802;
      uint64_t v17 = v14;
      __int16 v18 = 2080;
      id v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ finished fetching record batch to deserialize%s%@", (uint8_t *)&v16, 0x20u);
    }
    goto LABEL_19;
  }
  id v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [*(id *)(a1 + 32) name];
    int v16 = 138412802;
    uint64_t v17 = v15;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ encountered an operation error so we should stop %@%@", (uint8_t *)&v16, 0x20u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 624) = 0;
  [*(id *)(a1 + 32) stopWithError:v4];
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 592));
LABEL_19:
}

- (BOOL)_markSubResourceRecordAsFetchedIfNecessary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 recordIDNeedingFetch];
  if (v5 || ([v4 xattrSignature], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    BOOL v6 = 0;
    goto LABEL_5;
  }
  uint64_t v8 = [v4 recordIDBlockingSave];

  if (v8) {
    goto LABEL_4;
  }
  id v9 = [v4 recordID];
  v10 = [v4 record];
  id v11 = brc_bread_crumbs();
  int v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [(BRCFetchRecordSubResourcesOperation *)self name];
    __int16 v14 = [v10 debugDescription];
    int v15 = 138413058;
    int v16 = v13;
    __int16 v17 = 2112;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v14;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ has sub resource that no longer has info to fetch %@ -> %@%@", (uint8_t *)&v15, 0x2Au);
  }
  [(NSMutableDictionary *)self->_subResourceRecordsByID removeObjectForKey:v9];
  if (v10) {
    [(NSMutableDictionary *)self->_recordsByID setObject:v10 forKeyedSubscript:v9];
  }

  BOOL v6 = 1;
LABEL_5:

  return v6;
}

- (void)_dump
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = [(NSMutableDictionary *)self->_subResourceRecordsByID allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * v6);
        uint64_t v8 = brc_bread_crumbs();
        id v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v25 = v7;
          __int16 v26 = 2112;
          id v27 = v8;
          _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@%@", buf, 0x16u);
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v4);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = [(NSMutableDictionary *)self->_recordsByID allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    while (1)
    {
      if (*(void *)v16 != v13) {
        objc_enumerationMutation(v10);
      }
      if (!--v12)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }
}

- (void)_scheduleXattrFetch
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, a3, (uint64_t)a3, "[DEBUG] ┣%llx running the xattr fetch operation%@", (uint8_t *)&v4);
}

BOOL __58__BRCFetchRecordSubResourcesOperation__scheduleXattrFetch__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a4;
  [v7 setObject:a3 forKeyedSubscript:a2];
  [*(id *)(a1 + 40) addObject:v8];

  return (unint64_t)[*(id *)(a1 + 32) count] < *(void *)(a1 + 48);
}

void __58__BRCFetchRecordSubResourcesOperation__scheduleXattrFetch__block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v54 = a2;
  id v5 = a3;
  long long v68 = *(_OWORD *)(a1 + 48);
  uint64_t v58 = a1;
  uint64_t v69 = *(void *)(a1 + 64);
  __int16 v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v43 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 134218498;
    uint64_t v73 = v68;
    __int16 v74 = 2112;
    id v75 = v43;
    __int16 v76 = 2112;
    uint64_t v77 = (uint64_t)v6;
    _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ finished fetching xattrs%@", buf, 0x20u);
  }
  if (v5)
  {
    if (objc_msgSend(v5, "brc_isCloudKitCancellationError"))
    {
      id v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = [*(id *)(a1 + 32) name];
        *(_DWORD *)buf = 138412802;
        uint64_t v73 = (uint64_t)v10;
        __int16 v74 = 2112;
        id v75 = v5;
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v8;
        _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] failed to fetch xattr assets for %@: %@%@", buf, 0x20u);
      }
    }
    else
    {
      id v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        v44 = [*(id *)(a1 + 32) name];
        *(_DWORD *)buf = 138412802;
        uint64_t v73 = (uint64_t)v44;
        __int16 v74 = 2112;
        id v75 = v5;
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v8;
        _os_log_error_impl(&dword_23FA42000, v9, (os_log_type_t)0x90u, "[ERROR] failed to fetch xattr assets for %@: %@%@", buf, 0x20u);
      }
    }

    [*(id *)(a1 + 32) stopWithError:v5];
    goto LABEL_46;
  }
  if ([v54 count] == *(void *)(a1 + 72))
  {
    long long v56 = objc_opt_new();
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v11 = [v54 objectEnumerator];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v12)
    {
      uint64_t v57 = *(void *)v65;
      obuint64_t j = v11;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v65 != v57) {
            objc_enumerationMutation(obj);
          }
          __int16 v14 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          long long v15 = [v14 objectForKeyedSubscript:@"xattr"];
          long long v16 = [v14 encryptedValues];
          long long v17 = [v16 objectForKeyedSubscript:@"xattrSignature"];

          if (!v17)
          {
            long long v17 = [v15 signature];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v18 = [v15 fileURL];
            BOOL v19 = v18 == 0;

            if (!v19)
            {
              id v63 = 0;
              long long v20 = [*(id *)(v58 + 40) session];
              long long v21 = [v20 stageRegistry];
              long long v22 = [v15 fileURL];
              char v23 = [v21 saveXattrAtURL:v22 forSignature:v17 error:&v63];

              if (v23)
              {
                int v24 = brc_bread_crumbs();
                uint64_t v25 = brc_default_log();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v28 = [*(id *)(v58 + 32) name];
                  uint64_t v29 = objc_msgSend(v17, "brc_hexadecimalString");
                  uint64_t v30 = [v15 size];
                  *(_DWORD *)buf = 138413058;
                  uint64_t v73 = (uint64_t)v28;
                  __int16 v74 = 2112;
                  id v75 = v29;
                  __int16 v76 = 2048;
                  uint64_t v77 = v30;
                  __int16 v78 = 2112;
                  objc_super v79 = v24;
                  _os_log_debug_impl(&dword_23FA42000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ saved xattr for signature: %@ sz:%lld%@", buf, 0x2Au);
                }
                [v56 addObject:v17];
              }
              else
              {
                __int16 v26 = brc_bread_crumbs();
                id v27 = brc_default_log();
                if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
                {
                  uint64_t v31 = [*(id *)(v58 + 32) name];
                  __int16 v32 = objc_msgSend(v17, "brc_hexadecimalString");
                  *(_DWORD *)buf = 138413058;
                  uint64_t v73 = (uint64_t)v31;
                  __int16 v74 = 2112;
                  id v75 = v32;
                  __int16 v76 = 2112;
                  uint64_t v77 = (uint64_t)v63;
                  __int16 v78 = 2112;
                  objc_super v79 = v26;
                  _os_log_error_impl(&dword_23FA42000, v27, (os_log_type_t)0x90u, "[ERROR] %@ failed to store xattr for signature: %@ - %@%@", buf, 0x2Au);
                }
                [*(id *)(v58 + 32) stopWithError:v63];
              }
              *(void *)(*(void *)(v58 + 32) + 648) += [v15 size];
            }
          }
        }
        uint64_t v11 = obj;
        uint64_t v12 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
      }
      while (v12);
    }

    [*(id *)(*(void *)(v58 + 32) + 512) finishedFetchingXattrSignatures:v56];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v33 = [*(id *)(*(void *)(v58 + 32) + 528) allValues];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v34)
    {
      uint64_t v35 = 0;
      uint64_t v36 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v60 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          id v39 = [v38 xattrSignature];
          if (v39)
          {
            int v40 = [v38 xattrSignature];
            int v41 = [v56 containsObject:v40];

            if (v41)
            {
              [v38 setXattrSignature:0];
              [*(id *)(v58 + 32) _markSubResourceRecordAsFetchedIfNecessary:v38];
              ++v35;
            }
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v34);

      if (!v35) {
        goto LABEL_42;
      }
      uint64_t v33 = brc_bread_crumbs();
      v42 = brc_default_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        __58__BRCFetchRecordSubResourcesOperation__scheduleXattrFetch__block_invoke_40_cold_1((uint64_t)v33, v35, v42);
      }
    }
LABEL_42:

    id v5 = 0;
    goto LABEL_46;
  }
  uint64_t v45 = brc_bread_crumbs();
  v46 = brc_default_log();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
  {
    uint64_t v51 = [v54 count];
    long long v52 = *(void **)(v58 + 72);
    long long v53 = [*(id *)(v58 + 32) name];
    *(_DWORD *)buf = 134218754;
    uint64_t v73 = v51;
    __int16 v74 = 2048;
    id v75 = v52;
    __int16 v76 = 2112;
    uint64_t v77 = (uint64_t)v53;
    __int16 v78 = 2112;
    objc_super v79 = v45;
    _os_log_fault_impl(&dword_23FA42000, v46, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Received %lu xattr records instead of expected %lu records for %@%@", buf, 0x2Au);
  }
  id v47 = (void *)MEMORY[0x263F087E8];
  uint64_t v48 = [v54 count];
  uint64_t v49 = *(void *)(v58 + 72);
  long long v50 = [*(id *)(v58 + 32) name];
  objc_msgSend(v47, "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Received %lu xattr records instead of expected %lu records for %@", v48, v49, v50);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(v58 + 32) stopWithError:v5];
LABEL_46:
  dispatch_resume(*(dispatch_object_t *)(*(void *)(v58 + 32) + 576));
  dispatch_source_merge_data(*(dispatch_source_t *)(*(void *)(v58 + 32) + 576), 1uLL);
  __brc_leave_section((uint64_t *)&v68);
}

- (void)_createSubResourceGroupsFromPendingChangesStreamIfNecessary
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Creating _deserializeGroup because we have more records to deserialize in _pendingChangesStream%@", v2, v3, v4, v5, v6);
}

- (int64_t)_compareRecordsForSaveWithFirstRecord:(id)a3 secondRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 recordType] != 3 && objc_msgSend(v6, "recordType") == 3) {
    goto LABEL_7;
  }
  if ([v5 recordType] == 3 && objc_msgSend(v6, "recordType") != 3)
  {
LABEL_11:
    int64_t v7 = 1;
    goto LABEL_12;
  }
  if ([v5 recordType] == 2 || objc_msgSend(v6, "recordType") != 2)
  {
    if ([v5 recordType] != 2 || objc_msgSend(v6, "recordType") == 2)
    {
      int64_t v7 = 0;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_7:
  int64_t v7 = -1;
LABEL_12:

  return v7;
}

- (void)_prepareToSaveRecords
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = [a1 name];
  uint64_t v7 = [a1[65] count];
  uint64_t v8 = [a1[66] count];
  uint64_t v9 = [a1[69] count];
  int v10 = 138413314;
  uint64_t v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  __int16 v14 = 2048;
  uint64_t v15 = v8;
  __int16 v16 = 2048;
  uint64_t v17 = v9;
  __int16 v18 = 2112;
  uint64_t v19 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ preparing to save record batch with %lu in memory items %lu subresource items %lu moved zone names%@", (uint8_t *)&v10, 0x34u);
}

uint64_t __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compareRecordsForSaveWithFirstRecord:a2 secondRecord:a3];
}

void __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_45(uint64_t a1)
{
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_2;
  v14[3] = &unk_265086BD8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v15 = v3;
  uint64_t v16 = v4;
  long long v9 = *(_OWORD *)(a1 + 56);
  id v5 = (id)v9;
  long long v17 = v9;
  [v2 enumerateKeysAndObjectsUsingBlock:v14];
  id v6 = *(void **)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_48;
  v10[3] = &unk_265086C00;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = *(void *)(a1 + 64);
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
}

void __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) serverItemByItemID:v5];
  if (([v7 sharingOptions] & 0x48) != 0)
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 528) objectForKeyedSubscript:v6];
    [v8 setRecordIDNeedingFetch:0];
    long long v9 = brc_bread_crumbs();
    int v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      long long v21 = [v8 recordID];
      long long v22 = [*(id *)(a1 + 40) name];
      int v25 = 138412802;
      __int16 v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      __int16 v29 = 2112;
      uint64_t v30 = v9;
      _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ no longer needs to fetch shareID in %@ from server truth check%@", (uint8_t *)&v25, 0x20u);
    }
    char v11 = [*(id *)(a1 + 40) _markSubResourceRecordAsFetchedIfNecessary:v8];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v13 = (v11 & 1) != 0 || *(unsigned char *)(v12 + 24) != 0;
    *(unsigned char *)(v12 + 24) = v13;
  }
  __int16 v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
  if (v14)
  {
    [*(id *)(a1 + 48) removeObjectForKey:v5];
    if (v7)
    {
      id v15 = [*(id *)(*(void *)(a1 + 40) + 528) objectForKeyedSubscript:v14];
      [v15 setRecordIDBlockingSave:0];
      uint64_t v16 = brc_bread_crumbs();
      long long v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        char v23 = [v15 recordID];
        int v24 = [*(id *)(a1 + 40) name];
        int v25 = 138412802;
        __int16 v26 = v23;
        __int16 v27 = 2112;
        uint64_t v28 = v24;
        __int16 v29 = 2112;
        uint64_t v30 = v16;
        _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is no longer blocked for save in %@ from server truth check%@", (uint8_t *)&v25, 0x20u);
      }
      char v18 = [*(id *)(a1 + 40) _markSubResourceRecordAsFetchedIfNecessary:v15];
      uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v20 = (v18 & 1) != 0 || *(unsigned char *)(v19 + 24) != 0;
      *(unsigned char *)(v19 + 24) = v20;
    }
  }
}

void __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) serverItemByItemID:a2];
  if (v6)
  {
    id v7 = [*(id *)(*(void *)(a1 + 40) + 528) objectForKeyedSubscript:v5];
    [v7 setRecordIDBlockingSave:0];
    uint64_t v8 = brc_bread_crumbs();
    long long v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      BOOL v13 = [v7 recordID];
      __int16 v14 = [*(id *)(a1 + 40) name];
      int v15 = 138412802;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      char v18 = v14;
      __int16 v19 = 2112;
      BOOL v20 = v8;
      _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is no longer blocked for save in %@ from server truth check%@", (uint8_t *)&v15, 0x20u);
    }
    char v10 = [*(id *)(a1 + 40) _markSubResourceRecordAsFetchedIfNecessary:v7];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v12 = (v10 & 1) != 0 || *(unsigned char *)(v11 + 24) != 0;
    *(unsigned char *)(v11 + 24) = v12;
  }
}

- (void)_fetchRecordsBlockingSaveIfNecessary
{
  uint64_t v2 = self;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v3);

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)v2->_subResourceRecordsByID objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v44;
    *(void *)&long long v6 = 138412290;
    long long v41 = v6;
    v42 = v4;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v4);
        }
        char v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v10, "recordIDNeedingFetch", v41);
        if (v11)
        {

          goto LABEL_16;
        }
        uint64_t v12 = [v10 recordIDBlockingSave];
        if (v12)
        {
          BOOL v13 = (void *)v12;
          __int16 v14 = v2;
          subResourceRecordsByID = v2->_subResourceRecordsByID;
          uint64_t v16 = [v10 recordIDBlockingSave];
          __int16 v17 = [(NSMutableDictionary *)subResourceRecordsByID objectForKeyedSubscript:v16];
          if (v17)
          {

            uint64_t v2 = v14;
LABEL_11:
            uint64_t v4 = v42;
            goto LABEL_16;
          }
          pendingChangesStream = v14->_pendingChangesStream;
          __int16 v19 = [v10 recordIDBlockingSave];
          LOBYTE(pendingChangesStream) = [(BRCPendingChangesStream *)pendingChangesStream hasRecordIDBlockedOnSubResources:v19];

          uint64_t v2 = v14;
          uint64_t v4 = v42;
          if ((pendingChangesStream & 1) == 0)
          {
            BOOL v20 = brc_bread_crumbs();
            uint64_t v21 = brc_default_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              long long v22 = [v10 recordIDBlockingSave];
              char v23 = [v10 recordID];
              *(_DWORD *)buf = 138412802;
              uint64_t v48 = (uint64_t)v22;
              __int16 v49 = 2112;
              long long v50 = v23;
              __int16 v51 = 2112;
              long long v52 = v20;
              _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to fetch %@ to unblock %@ from saving, but it wasn't found.  Forcing fetch%@", buf, 0x20u);
            }
            int v24 = [v10 recordIDBlockingSave];
            [v10 setRecordIDNeedingFetch:v24];

            if (!v2->_deserializeGroup)
            {
              int v25 = v2;
              __int16 v26 = brc_bread_crumbs();
              __int16 v27 = brc_default_log();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v41;
                uint64_t v48 = (uint64_t)v26;
                _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Creating _deserializeGroup because we have more records to deserialize in memory%@", buf, 0xCu);
              }

              dispatch_group_t v28 = dispatch_group_create();
              uint64_t v2 = v25;
              deserializeGroup = v25->_deserializeGroup;
              v25->_deserializeGroup = (OS_dispatch_group *)v28;

              dispatch_group_enter((dispatch_group_t)v25->_deserializeGroup);
              dispatch_source_merge_data((dispatch_source_t)v25->_deserializeSource, 1uLL);
              goto LABEL_11;
            }
          }
        }
LABEL_16:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v30 = [v4 countByEnumeratingWithState:&v43 objects:v53 count:16];
      uint64_t v7 = v30;
    }
    while (v30);
  }

  uint64_t v31 = v2->_pendingChangesStream;
  __int16 v32 = [(NSMutableDictionary *)v2->_subResourceRecordsByID objectEnumerator];
  uint64_t v33 = [(BRCPendingChangesStream *)v31 copyBlockingSaveRecordsToNeedingFetchIgnoringRecords:v32];

  if (v33)
  {
    uint64_t v34 = brc_bread_crumbs();
    uint64_t v35 = brc_default_log();
    if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
    {
      int v40 = [(BRCFetchRecordSubResourcesOperation *)v2 name];
      *(_DWORD *)buf = 134218498;
      uint64_t v48 = v33;
      __int16 v49 = 2112;
      long long v50 = v40;
      __int16 v51 = 2112;
      long long v52 = v34;
      _os_log_error_impl(&dword_23FA42000, v35, (os_log_type_t)0x90u, "[ERROR] We need to fetch %llu records in the pending changes stream to allow saving for %@.  Forcing fetch%@", buf, 0x20u);
    }
    if (!v2->_deserializeGroup)
    {
      uint64_t v36 = brc_bread_crumbs();
      uint64_t v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[BRCFetchRecordSubResourcesOperation _createSubResourceGroupsFromPendingChangesStreamIfNecessary]();
      }

      dispatch_group_t v38 = dispatch_group_create();
      id v39 = v2->_deserializeGroup;
      v2->_deserializeGroup = (OS_dispatch_group *)v38;

      dispatch_group_enter((dispatch_group_t)v2->_deserializeGroup);
      dispatch_source_merge_data((dispatch_source_t)v2->_deserializeSource, 1uLL);
    }
  }
}

- (void)_cleanUpAfterSavingRecords
{
  id v3 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v3);

  [(NSMutableDictionary *)self->_subResourceRecordsByID removeAllObjects];
  [(NSMutableDictionary *)self->_recordsByID removeAllObjects];
  [(NSMutableArray *)self->_deletedShareIDs removeAllObjects];
  [(NSMutableArray *)self->_deletedRecordIDs removeAllObjects];
  if (self->_deserializeState == 1)
  {
    self->_deserializeState = 0;
    deserializeSource = self->_deserializeSource;
    dispatch_resume(deserializeSource);
  }
}

- (void)_saveRecordsToPendingChangesWithServerChangeToken:(id)a3 clientChangeToken:(int64_t)a4
{
  pendingChangesStream = self->_pendingChangesStream;
  recordsByID = self->_recordsByID;
  id v8 = a3;
  id v12 = [(NSMutableDictionary *)recordsByID objectEnumerator];
  deletedRecordIDs = self->_deletedRecordIDs;
  deletedShareIDs = self->_deletedShareIDs;
  uint64_t v11 = [(NSMutableDictionary *)self->_subResourceRecordsByID objectEnumerator];
  [(BRCPendingChangesStream *)pendingChangesStream saveEditedRecords:v12 deletedRecordIDs:deletedRecordIDs deletedShareIDs:deletedShareIDs subResourceEditedRecords:v11 serverChangeToken:v8 clientChangeToken:a4];
}

- (BOOL)_hasRecordsPendingSubResources
{
  if ([(NSMutableDictionary *)self->_subResourceRecordsByID count]) {
    return 1;
  }
  pendingChangesStream = self->_pendingChangesStream;
  return [(BRCPendingChangesStream *)pendingChangesStream hasSubResourceRecords];
}

- (BOOL)saveRecordsWithServerChangeToken:(id)a3 clientChangeToken:(int64_t)a4 syncStatus:(int64_t)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v9);

  error = self->_error;
  if (!error)
  {
    [(BRCFetchRecordSubResourcesOperation *)self _prepareToSaveRecords];
    BOOL v11 = a5 == 3;
    BOOL v12 = [(BRCFetchRecordSubResourcesOperation *)self _hasRecordsPendingSubResources];
    if (self->_queryFinishedServerTruthCallback)
    {
      uint64_t v36 = brc_bread_crumbs();
      uint64_t v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchRecordSubResourcesOperation saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:]();
      }
    }
    if (self->_queryFinishedClientTruthCallback)
    {
      dispatch_group_t v38 = brc_bread_crumbs();
      id v39 = brc_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchRecordSubResourcesOperation saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:]();
      }
    }
    BOOL v13 = brc_bread_crumbs();
    __int16 v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int16 v29 = [(BRCFetchRecordSubResourcesOperation *)self name];
      uint64_t v30 = [v8 descriptionWithContext:0];
      long long v41 = (void *)v30;
      uint64_t v31 = "NO";
      BOOL canSaveDirectly = self->_canSaveDirectly;
      uint64_t v33 = "YES";
      *(_DWORD *)buf = 138413570;
      __int16 v53 = 2048;
      if (a5 == 3) {
        uint64_t v34 = "YES";
      }
      else {
        uint64_t v34 = "NO";
      }
      long long v50 = v29;
      if (v12) {
        uint64_t v33 = "NO";
      }
      __int16 v51 = 2112;
      uint64_t v52 = v30;
      if (canSaveDirectly || a5 == 3) {
        uint64_t v31 = v33;
      }
      int64_t v54 = a4;
      __int16 v55 = 2080;
      long long v56 = v34;
      __int16 v57 = 2080;
      uint64_t v58 = v31;
      __int16 v59 = 2112;
      long long v60 = v13;
      _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ saving records with server change token:%@ requestID:%llu caught up:%s directly:%s%@", buf, 0x3Eu);
    }
    if (v12)
    {
      [(BRCFetchRecordSubResourcesOperation *)self _saveRecordsToPendingChangesWithServerChangeToken:v8 clientChangeToken:a4];
      if (a5 == 3) {
        [(BRCFetchRecordSubResourcesOperation *)self _fetchRecordsBlockingSaveIfNecessary];
      }
    }
    else if (a5 == 3 || self->_canSaveDirectly)
    {
      BOOL v15 = a5 == 3;
      id v48 = 0;
      uint64_t v16 = self->_serverZone;
      LOBYTE(v40) = v15;
      uint64_t v17 = [(BRCServerZone *)v16 didSyncDownRequestID:a4 serverChangeToken:v8 editedRecords:self->_recordsByID deletedRecordIDs:self->_deletedRecordIDs deletedShareRecordIDs:self->_deletedShareIDs allocRankZones:&v48 caughtUp:v40 pendingChanges:self->_pendingChangesStream];
      if (v17)
      {
        uint64_t v18 = v17;
        __int16 v19 = brc_bread_crumbs();
        BOOL v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[BRCFetchRecordSubResourcesOperation saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:]();
        }

        [(BRCPendingChangesStream *)self->_pendingChangesStream destroyDatabase];
        uint64_t v21 = [[BRCPendingChangesStream alloc] initWithServerZone:self->_serverZone];
        pendingChangesStream = self->_pendingChangesStream;
        self->_pendingChangesStream = v21;

        char v23 = [(BRCServerZone *)v16 clientZone];
        int v24 = [v23 db];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __101__BRCFetchRecordSubResourcesOperation_saveRecordsWithServerChangeToken_clientChangeToken_syncStatus___block_invoke;
        v42[3] = &unk_265086C50;
        long long v43 = v16;
        int64_t v45 = a4;
        uint64_t v46 = v18;
        BOOL v47 = v11;
        id v44 = v48;
        [v24 performWithFlags:41 action:v42];
      }
      else
      {
        int v25 = brc_bread_crumbs();
        __int16 v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v27 = [(BRCFetchRecordSubResourcesOperation *)self name];
          *(_DWORD *)buf = 138412546;
          long long v50 = v27;
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v25;
          _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ Allocating ranks failed when not caught up.  We'll save to pending changes from now on%@", buf, 0x16u);
        }
        self->_BOOL canSaveDirectly = 0;
        [(BRCFetchRecordSubResourcesOperation *)self _saveRecordsToPendingChangesWithServerChangeToken:v8 clientChangeToken:a4];
      }
    }
    else
    {
      [(BRCFetchRecordSubResourcesOperation *)self _saveRecordsToPendingChangesWithServerChangeToken:v8 clientChangeToken:a4];
    }
    [(BRCFetchRecordSubResourcesOperation *)self _cleanUpAfterSavingRecords];
  }

  return error == 0;
}

uint64_t __101__BRCFetchRecordSubResourcesOperation_saveRecordsWithServerChangeToken_clientChangeToken_syncStatus___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 applyScheduler];
  [v3 didSyncDownZone:*(void *)(a1 + 32) requestID:*(void *)(a1 + 48) upToRank:*(void *)(a1 + 56) caughtUpWithServer:*(unsigned __int8 *)(a1 + 64)];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        if (v9 != *(void *)(a1 + 32))
        {
          char v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "session", (void)v13);
          BOOL v11 = [v10 applyScheduler];
          [v11 generatedRanksForZone:v9 upToRank:*(void *)(a1 + 56)];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return 1;
}

- (BOOL)saveRecordsWithQueryCursor:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  if (!self->_error)
  {
    if (v4 && !self->_pendingChangesStream)
    {
      dispatch_group_t v38 = brc_bread_crumbs();
      id v39 = brc_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchRecordSubResourcesOperation saveRecordsWithQueryCursor:]();
      }
    }
    v42 = [(BRCServerZone *)self->_serverZone session];
    BOOL canSaveDirectly = self->_canSaveDirectly;
    [(BRCFetchRecordSubResourcesOperation *)self _prepareToSaveRecords];
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = [(BRCFetchRecordSubResourcesOperation *)self name];
      uint64_t v37 = "YES";
      *(_DWORD *)uint64_t v58 = 138413058;
      *(void *)&v58[4] = v36;
      *(_WORD *)&v58[12] = 2112;
      if (!canSaveDirectly) {
        uint64_t v37 = "NO";
      }
      *(void *)&v58[14] = v4;
      *(_WORD *)&v58[22] = 2080;
      __int16 v59 = v37;
      __int16 v60 = 2112;
      uint64_t v61 = v8;
      _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ saving records with query cursor:%@ directly:%s%@", v58, 0x2Au);
    }
    if (v4 != 0 && !canSaveDirectly)
    {
      pendingChangesStream = self->_pendingChangesStream;
      if (!pendingChangesStream)
      {
        uint64_t v40 = brc_bread_crumbs();
        long long v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
          -[BRCFetchRecordSubResourcesOperation saveRecordsWithQueryCursor:]();
        }

        pendingChangesStream = self->_pendingChangesStream;
      }
      BOOL v11 = [(NSMutableDictionary *)self->_recordsByID objectEnumerator];
      BOOL v12 = [(NSMutableDictionary *)self->_subResourceRecordsByID objectEnumerator];
      [(BRCPendingChangesStream *)pendingChangesStream saveEditedRecords:v11 subResourceEditedRecords:v12 queryCursor:v4];

      BOOL v6 = 1;
      goto LABEL_30;
    }
    *(void *)uint64_t v58 = 0;
    *(void *)&v58[8] = v58;
    *(void *)&v58[16] = 0x2020000000;
    __int16 v59 = 0;
    if (v4) {
      int v13 = 0;
    }
    else {
      int v13 = ![(BRCFetchRecordSubResourcesOperation *)self _hasRecordsPendingSubResources];
    }
    long long v14 = self->_serverZone;
    long long v15 = [(BRCServerZone *)self->_serverZone db];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke;
    v50[3] = &unk_265086C78;
    v50[4] = self;
    uint64_t v52 = v58;
    long long v16 = v14;
    __int16 v51 = v16;
    char v53 = v13;
    [v15 performWithFlags:25 action:v50];
    if (*(void *)(*(void *)&v58[8] + 24))
    {
      uint64_t v17 = [v42 clientDB];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke_2;
      v44[3] = &unk_265086CA0;
      id v45 = v42;
      BOOL v47 = self;
      id v48 = v58;
      uint64_t v46 = v16;
      char v49 = v13;
      [v17 performWithFlags:41 action:v44];

      if (v13)
      {
        uint64_t v18 = brc_bread_crumbs();
        __int16 v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          BOOL v20 = [(BRCFetchRecordSubResourcesOperation *)self name];
          -[BRCFetchRecordSubResourcesOperation saveRecordsWithQueryCursor:](v20, (uint64_t)v18, (uint64_t)buf, v19);
        }

        [(BRCPendingChangesStream *)self->_pendingChangesStream destroyDatabase];
        uint64_t v21 = self->_pendingChangesStream;
        self->_pendingChangesStream = 0;
      }
      else
      {
        uint64_t v31 = self->_pendingChangesStream;
        uint64_t v21 = [(NSMutableDictionary *)self->_subResourceRecordsByID objectEnumerator];
        __int16 v32 = [(NSMutableDictionary *)self->_recordsByID objectEnumerator];
        [(BRCPendingChangesStream *)v31 saveSubResourceRecords:v21 afterSavingMainTableItems:v32 queryCursor:v4];
      }
    }
    else
    {
      self->_BOOL canSaveDirectly = 0;
      long long v22 = self->_pendingChangesStream;
      char v23 = [(NSMutableDictionary *)self->_recordsByID objectEnumerator];
      int v24 = [(NSMutableDictionary *)self->_subResourceRecordsByID objectEnumerator];
      [(BRCPendingChangesStream *)v22 saveEditedRecords:v23 subResourceEditedRecords:v24 queryCursor:v4];

      int v25 = [(BRCPendingChangesStream *)self->_pendingChangesStream lastError];

      if (v25)
      {
        __int16 v26 = [(BRCPendingChangesStream *)self->_pendingChangesStream lastError];
        [(BRCFetchRecordSubResourcesOperation *)self stopWithError:v26];
      }
      if (v13)
      {
        __int16 v27 = brc_bread_crumbs();
        dispatch_group_t v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v29 = [(BRCFetchRecordSubResourcesOperation *)self name];
          *(_DWORD *)buf = 138412546;
          __int16 v55 = v29;
          __int16 v56 = 2112;
          __int16 v57 = v27;
          _os_log_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ got a (temporary) broken structure while listing directory contents%@", buf, 0x16u);
        }
        uint64_t v30 = [v42 clientTruthWorkloop];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke_53;
        block[3] = &unk_26507ED70;
        void block[4] = self;
        dispatch_async(v30, block);

        BOOL v6 = 0;
        goto LABEL_29;
      }
      uint64_t v33 = brc_bread_crumbs();
      uint64_t v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v55 = v33;
        _os_log_impl(&dword_23FA42000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] Allocating ranks failed when not caught up and listing.  We'll save to pending changes from now on%@", buf, 0xCu);
      }
    }
    BOOL v6 = 1;
LABEL_29:

    _Block_object_dispose(v58, 8);
LABEL_30:
    [(BRCFetchRecordSubResourcesOperation *)self _cleanUpAfterSavingRecords];

    goto LABEL_31;
  }
  BOOL v6 = 0;
LABEL_31:

  return v6;
}

BOOL __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 520) allValues];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) didListDirectoryChangesWithResults:v2 pendingFetchChanges:*(void *)(*(void *)(a1 + 32) + 512)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 656);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3 && *(void *)(*(void *)(v4 + 8) + 24) && *(unsigned char *)(a1 + 56))
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(v5 + 656);
    *(void *)(v5 + 656) = 0;

    uint64_t v4 = *(void *)(a1 + 48);
  }
  BOOL v7 = *(void *)(*(void *)(v4 + 8) + 24) != 0;

  return v7;
}

uint64_t __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) applyScheduler];
  [v2 generatedRanksForZone:*(void *)(a1 + 40) upToRank:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 664);
  if (v3 && *(unsigned char *)(a1 + 64))
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void **)(v4 + 664);
    *(void *)(v4 + 664) = 0;
  }
  return 1;
}

void __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke_53(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 504) clientZone];
  [v1 scheduleSyncDownFirst];
}

- (NSError)error
{
  return self->_error;
}

- (BRCPendingChangesStream)pendingChangesStream
{
  return self->_pendingChangesStream;
}

- (id)queryFinishedServerTruthCallback
{
  return self->_queryFinishedServerTruthCallback;
}

- (void)setQueryFinishedServerTruthCallback:(id)a3
{
}

- (id)queryFinishedClientTruthCallback
{
  return self->_queryFinishedClientTruthCallback;
}

- (void)setQueryFinishedClientTruthCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_queryFinishedClientTruthCallback, 0);
  objc_storeStrong(&self->_queryFinishedServerTruthCallback, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_loopDetectionCache, 0);
  objc_storeStrong((id *)&self->_deserializeSource, 0);
  objc_storeStrong((id *)&self->_deserializeGroup, 0);
  objc_storeStrong((id *)&self->_xattrFetchingSource, 0);
  objc_storeStrong((id *)&self->_xattrFetchingGroup, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_movedZoneNames, 0);
  objc_storeStrong((id *)&self->_deletedShareIDs, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_subResourceRecordsByID, 0);
  objc_storeStrong((id *)&self->_recordsByID, 0);
  objc_storeStrong((id *)&self->_pendingChangesStream, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

- (void)records
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _subResourceRecordsByID.count == 0 && _pendingChangesStream == nil%@", v2, v3, v4, v5, v6);
}

- (void)initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: serverZone && parentOperation%@", v2, v3, v4, v5, v6);
}

- (void)addRecord:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _recordsByID[recordID] == nil%@", v2, v3, v4, v5, v6);
}

- (void)addRecord:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![_deletedRecordIDs containsObject:recordID]%@", v2, v3, v4, v5, v6);
}

- (void)addRecord:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![_deletedShareIDs containsObject:recordID]%@", v2, v3, v4, v5, v6);
}

- (void)addRecord:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [contentRecordName hasPrefix:kBRRecordIDPrefixContent]%@", v2, v3, v4, v5, v6);
}

- (void)addRecord:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_isDoneFetchingRecords%@", v2, v3, v4, v5, v6);
}

- (void)addRecordIDToDeserialize:recordType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _subResourceRecordsByID[recordID] == nil%@", v2, v3, v4, v5, v6);
}

- (void)shareIDWasDeleted:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![_deletedShareIDs containsObject:shareID]%@", v2, v3, v4, v5, v6);
}

- (void)shareIDWasDeleted:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _recordsByID[shareID] == nil%@", v2, v3, v4, v5, v6);
}

- (void)_notifyWhenRecordsAreFetched:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Wait on _deserializeGroup to remaining records to deserialize%@", v2, v3, v4, v5, v6);
}

void __68__BRCFetchRecordSubResourcesOperation__notifyWhenRecordsAreFetched___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Wait on _xattrFetchingGroup to remaining xattrs records%@", v2, v3, v4, v5, v6);
}

- (void)notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Not fetching records blocking save because we aren't caught up%@", v2, v3, v4, v5, v6);
}

- (void)notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _recordsByID.count == 0 && _deletedShareIDs.count == 0 && _deletedRecordIDs.count == 0 && _subResourceRecordsByID.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:.cold.3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 name];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] %@ waiting to fetch all records%@", v4, v5, v6, v7, v8);
}

void __89__BRCFetchRecordSubResourcesOperation_notifyWhenCaughtUp_whenRecordsAreFetchedAndFinish___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Done waiting on deserialize/xattr groups%@", v2, v3, v4, v5, v6);
}

- (void)stopWithError:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 name];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] %@ resuming deserialize source which was waiting for batch save%@", v4, v5, v6, v7, v8);
}

- (void)finishWithResult:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _queryFinishedClientTruthCallback == nil%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _queryFinishedServerTruthCallback == nil%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.cancelled || _deserializeGroup == nil%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.cancelled || _xattrFetchingGroup == nil%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:error:.cold.5()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 name];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] %@ finished record fetcher%@", v4, v5, v6, v7, v8);
}

- (void)_willFetchRecordForDeserialize:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Fetch loop trying to fetch %@%@", v1, 0x16u);
}

void __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke_31_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] We can't find a record which really should exist - %@.  Unblocking other records from save%@", v1, 0x16u);
}

void __58__BRCFetchRecordSubResourcesOperation__scheduleXattrFetch__block_invoke_40_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, a3, (uint64_t)a3, "[DEBUG] Removed xattr requirement from %lld in-memory subResourceRecords%@", (uint8_t *)&v3);
}

- (void)saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 name];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] %@ recreating pending changes stream with updated change token%@", v4, v5, v6, v7, v8);
}

- (void)saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_queryFinishedClientTruthCallback%@", v2, v3, v4, v5, v6);
}

- (void)saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_queryFinishedServerTruthCallback%@", v2, v3, v4, v5, v6);
}

- (void)saveRecordsWithQueryCursor:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _pendingChangesStream%@", v2, v3, v4, v5, v6);
}

- (void)saveRecordsWithQueryCursor:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, a4, a3, "[DEBUG] %@ Destroying pending changes db because we are done with it%@", (uint8_t *)a3);
}

- (void)saveRecordsWithQueryCursor:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _pendingChangesStream || !cursor%@", v2, v3, v4, v5, v6);
}

@end