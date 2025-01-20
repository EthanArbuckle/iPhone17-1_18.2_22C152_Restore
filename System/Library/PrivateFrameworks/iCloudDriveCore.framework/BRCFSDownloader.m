@interface BRCFSDownloader
- (BOOL)_createDownloadingJobForItem:(id)a3 state:(int)a4 kind:(int)a5 etag:(id)a6 stageFileName:(id)a7 error:(id *)a8;
- (BOOL)makeContentLive:(id)a3;
- (BOOL)scheduleContentDownloadForItem:(id)a3 serverItem:(id)a4 options:(unint64_t)a5 etagIfLoser:(id)a6 stageFileName:(id)a7 error:(id *)a8;
- (BRCDeadlineScheduler)downloadsDeadlineScheduler;
- (BRCFSDownloader)initWithAccountSession:(id)a3;
- (id)_getCancelErrorFromCancelReason:(int)a3;
- (id)_sanitizeRecord:(id)a3;
- (id)descriptionForItem:(id)a3 context:(id)a4;
- (id)generateContentStageFileNameForItem:(id)a3 etag:(id)a4;
- (id)getDownloadEtagForItem:(id)a3 etagIfLoser:(id)a4;
- (unint64_t)_bumpThrottleForDownload:(id)a3 throttle:(id)a4;
- (unint64_t)inFlightSize;
- (unint64_t)recoverAndReportMissingJobs;
- (unint64_t)sizeOfActiveDownloads;
- (void)_cancelJobs:(id)a3 state:(int)a4;
- (void)_clearDownloadErrorForDocument:(id)a3;
- (void)_close;
- (void)_finishDownloadCleanup:(id)a3;
- (void)_finishedDownload:(id)a3 syncContext:(id)a4 operationID:(id)a5 error:(id)a6;
- (void)_postponeLoserForWinner:(int64_t)a3 etag:(id)a4;
- (void)_reportDownloadErrorForDocument:(id)a3 error:(id)a4;
- (void)_sendContentsBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5 isLoserDownload:(BOOL)a6;
- (void)_transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6;
- (void)_willDownload:(id)a3 operationID:(id)a4;
- (void)addAliasItem:(id)a3 toDownloadingItem:(id)a4;
- (void)addPendingOperationProgress:(id)a3 withStageFileName:(id)a4;
- (void)cancel;
- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4;
- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5;
- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6;
- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6 cancelReason:(int)a7;
- (void)cancelAndCleanupItemDownloads:(id)a3;
- (void)close;
- (void)deleteJobsMatching:(id)a3;
- (void)deviceAndEditorNamesOfItem:(id)a3 etag:(id)a4 downloadKind:(int)a5 lastEditorDeviceName:(id *)a6 lastModifiedNameComponents:(id *)a7;
- (void)performFirstSchedulingAfterStartupInDB:(id)a3;
- (void)removePendingOperationProgressWithStageFileName:(id)a3;
- (void)rescheduleJobsPendingRecentsAndFavoritesFetchInZone:(id)a3;
- (void)rescheduleJobsPendingWinnerForItem:(id)a3;
- (void)resume;
- (void)schedule;
- (void)suspend;
- (void)transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6 completionBlock:(id)a7;
- (void)updateContentDownloadForMetaOnlyChange:(id)a3 fromEtag:(id)a4 toEtag:(id)a5;
@end

@implementation BRCFSDownloader

- (void)addPendingOperationProgress:(id)a3 withStageFileName:(id)a4
{
}

- (void)removePendingOperationProgressWithStageFileName:(id)a3
{
}

- (id)getDownloadEtagForItem:(id)a3 etagIfLoser:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [a3 currentVersion];
    v9 = [v8 ckInfo];
    id v7 = [v9 etag];
  }
  return v7;
}

- (BRCFSDownloader)initWithAccountSession:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCFSDownloader;
  id v5 = [(BRCFSSchedulerBase *)&v23 initWithSession:v4 name:@"Downloader" tableName:@"client_downloads"];
  if (v5)
  {
    v6 = [v4 personaIdentifier];
    id v7 = BRPersonaSpecificName();

    id v8 = v7;
    dispatch_workloop_t v9 = dispatch_workloop_create((const char *)[v8 UTF8String]);
    v10 = [[BRCFairScheduler alloc] initWithWorkloop:v9 name:v8];
    fairScheduler = v5->_fairScheduler;
    v5->_fairScheduler = v10;

    v12 = [[BRCDeadlineScheduler alloc] initWithName:@"com.apple.bird.downloader" fairScheduler:v5->_fairScheduler];
    downloadsDeadlineScheduler = v5->_downloadsDeadlineScheduler;
    v5->_downloadsDeadlineScheduler = v12;

    [(BRCDeadlineScheduler *)v5->_downloadsDeadlineScheduler setCoalescingLeeway:10000000];
    uint64_t v14 = brc_task_tracker_create("com.apple.bird.download-tracker");
    tracker = v5->_tracker;
    v5->_tracker = (brc_task_tracker *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingOperationProgress = v5->_pendingOperationProgress;
    v5->_pendingOperationProgress = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    willRetryOperationProgress = v5->_willRetryOperationProgress;
    v5->_willRetryOperationProgress = v18;

    v20 = +[BRCUserDefaults defaultsForMangledID:0];
    [v20 downloadSizeRefreshInterval];
    v5->_activeDownloadSizeRefreshInterval = v21;
  }
  return v5;
}

- (void)resume
{
  v3 = [(BRCAccountSessionFPFS *)self->super.super._session clientTruthWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__BRCFSDownloader_resume__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

  [(BRCDeadlineScheduler *)self->_downloadsDeadlineScheduler resume];
  [(BRCFairScheduler *)self->_fairScheduler resume];
  v4.receiver = self;
  v4.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v4 resume];
}

void __25__BRCFSDownloader_resume__block_invoke(uint64_t a1)
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __25__BRCFSDownloader_resume__block_invoke_cold_1();
  }

  objc_super v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  [v4 execute:@"DELETE FROM client_downloads"];
}

- (void)suspend
{
  [(BRCFairScheduler *)self->_fairScheduler suspend];
  [(BRCDeadlineScheduler *)self->_downloadsDeadlineScheduler suspend];
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v3 suspend];
}

- (void)close
{
  [(BRCDeadlineScheduler *)self->_downloadsDeadlineScheduler close];
  [(BRCFairScheduler *)self->_fairScheduler close];
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v3 close];
}

- (void)_close
{
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v3 _close];
  brc_task_tracker_wait((uint64_t)self->_tracker);
}

- (void)cancel
{
  [(BRCDeadlineScheduler *)self->_downloadsDeadlineScheduler cancel];
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v3 cancel];
  brc_task_tracker_cancel(self->_tracker);
}

- (void)_willDownload:(id)a3 operationID:(id)a4
{
  session = self->super.super._session;
  id v6 = a4;
  id v7 = a3;
  id v12 = [(BRCAccountSessionFPFS *)session clientDB];
  id v8 = [v7 stageID];
  dispatch_workloop_t v9 = [v7 transferID];
  uint64_t v10 = [v7 kind];
  v11 = [v7 etag];

  [v12 execute:@"UPDATE client_downloads SET  transfer_stage = %@, transfer_operation = %@ WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", v8, v6, v9, v10, v11];
}

- (unint64_t)_bumpThrottleForDownload:(id)a3 throttle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [BRCDownloadJobIdentifier alloc];
  dispatch_workloop_t v9 = [v7 transferID];
  uint64_t v10 = [v9 unsignedLongLongValue];
  v11 = [v7 etag];
  uint64_t v12 = [v7 kind];

  v13 = [(BRCDownloadJobIdentifier *)v8 initWithDBRowID:v10 etag:v11 kind:v12];
  v16.receiver = self;
  v16.super_class = (Class)BRCFSDownloader;
  id v14 = [(BRCFSSchedulerBase *)&v16 postponeJobID:v13 withThrottle:v6];

  return (unint64_t)v14;
}

- (id)descriptionForItem:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x263F8C720], "rawInjection:length:", "ORDER BY download_kind, download_etag", 37);
  dispatch_workloop_t v9 = objc_msgSend(MEMORY[0x263F8C720], "rawInjection:length:", "download_kind, download_etag, transfer_operation, transfer_queue, download_error, app_library_rowid", 99);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__BRCFSDownloader_descriptionForItem_context___block_invoke;
  v14[3] = &unk_2650814E0;
  id v15 = v7;
  objc_super v16 = self;
  id v17 = v6;
  id v10 = v6;
  id v11 = v7;
  uint64_t v12 = [(BRCFSSchedulerBase *)self descriptionForJobsMatching:v10 ordering:v8 additionalColumns:v9 additionalValuesHandler:v14 context:v11];

  return v12;
}

void __46__BRCFSDownloader_descriptionForItem_context___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v26 = a2;
  id v9 = a3;
  [v9 intAtIndex:a4];
  id v10 = [v9 stringAtIndex:(a4 + 1)];
  id v11 = [v9 uuidAtIndex:(a4 + 2)];
  uint64_t v12 = [v9 stringAtIndex:(a4 + 3)];
  v13 = [v9 stringAtIndex:(a4 + 4)];
  id v14 = [v9 numberAtIndex:(a4 + 5)];

  uint64_t v15 = BRCPrettyPrintEnum();
  objc_super v16 = +[BRCDumpContext highlightedString:v10 type:2 context:*(void *)(a1 + 32)];
  [v26 appendFormat:@"%s:%@", v15, v16];

  if (!a5) {
    goto LABEL_13;
  }
  if (([v12 isEqualToString:@"_retry"] & 1) == 0)
  {
    if (!v11) {
      goto LABEL_11;
    }
    id v17 = [*(id *)(*(void *)(a1 + 40) + 8) appLibraryByRowID:v14];
    v18 = [*(id *)(a1 + 48) serverZone];
    v19 = +[BRCSyncContext transferContextForServerZone:v18 appLibrary:v17];

    v20 = [v19 downloadStream];
    double v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 48), "dbRowID"));
    [v20 progressForTransferID:v21 operationID:v11];
    double v23 = v22;

    if (v23 >= 0.0) {
      objc_msgSend(v26, "appendFormat:", @" downloading:%.1f%%", v23 * 100.0);
    }
    else {
      [v26 appendString:@" download:done/cancelled"];
    }

    goto LABEL_10;
  }
  [v26 appendString:@" pending-retry"];
  if (v11)
  {
LABEL_10:
    v24 = [v11 UUIDString];
    [v26 appendFormat:@" op:%@", v24];
  }
LABEL_11:
  if (v13)
  {
    v25 = +[BRCDumpContext highlightedString:v13 type:3 context:*(void *)(a1 + 32)];
    [v26 appendFormat:@" last-error:%@", v25];
  }
LABEL_13:
}

- (BOOL)_createDownloadingJobForItem:(id)a3 state:(int)a4 kind:(int)a5 etag:(id)a6 stageFileName:(id)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v59 = a7;
  id v14 = [v12 serverZone];
  uint64_t v15 = [v12 appLibrary];
  v68 = [v12 syncContextUsedForTransfers];
  id v67 = v13;
  v69 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", [v12 dbRowID], v13, v10);
  uint64_t v16 = brc_current_date_nsec();
  if (v10) {
    uint64_t v17 = 17;
  }
  else {
    uint64_t v17 = 25;
  }
  uint64_t v64 = v10;
  if (v10 == 3 && ![v14 hasFetchedRecentsAndFavorites]) {
    a4 = 40;
  }
  int v66 = a4;
  v63 = v12;
  v18 = [v12 currentVersion];
  uint64_t v19 = [v18 size];

  v55 = [v68 downloadThrottle];
  v52 = objc_msgSend(MEMORY[0x263F8C720], "rawInjection:length:", "app_library_rowid, transfer_queue, transfer_size, transfer_record, transfer_stage, transfer_operation, download_kind, download_etag, download_priority, download_request_stamp, download_error, zone_rowid", 202);
  v20 = (void *)MEMORY[0x263F8C710];
  v54 = [v15 dbRowID];
  v53 = [v68 contextIdentifier];
  v57 = [v14 dbRowID];
  double v21 = [v20 formatInjection:@"%@, %@, %lld, %@, %@, %@, %u, %@, %ld, %lld, %@, %@", v54, v53, v19, 0, v59, 0, v10, v67, v17, v16, 0, v57];
  double v22 = (void *)MEMORY[0x263F8C710];
  v62 = v15;
  double v23 = [v15 dbRowID];
  v24 = [v68 contextIdentifier];
  v25 = [v14 dbRowID];
  id v26 = [v22 formatInjection:@"app_library_rowid = %@, transfer_queue = %@, download_priority = %ld, download_request_stamp = %lld, transfer_stage = %@, zone_rowid = %@", v23, v24, v17, v16, v59, v25];

  id v70 = 0;
  int v27 = [(BRCFSSchedulerBase *)self insertOrUpdateJobID:v69 throttle:v55 withState:a4 insertedSQLColumn:v52 insertedSQLValues:v21 updatedSQLValues:v26 error:&v70];
  uint64_t v60 = v28;
  id v29 = v70;

  v30 = v29;
  if (a8) {
    BOOL v31 = v29 == 0;
  }
  else {
    BOOL v31 = 1;
  }
  BOOL v32 = v31;
  if (!v31)
  {
    BOOL v40 = v32;
    id v41 = v29;
    v42 = brc_bread_crumbs();
    v43 = brc_default_log();
    if (os_log_type_enabled(v43, (os_log_type_t)0x90u)) {
      -[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:stageFileName:error:]((uint64_t)v41, (uint64_t)v42, v43);
    }

    id v45 = v41;
    *a8 = v45;
    v46 = v14;
    v33 = v63;
    v34 = v67;
    v35 = v62;
    BOOL v32 = v40;
    v36 = v69;
    goto LABEL_29;
  }
  v33 = v63;
  v34 = v67;
  v35 = v62;
  v36 = v69;
  if (v66 != v27)
  {
    BOOL v58 = v32;
    unint64_t activeDownloadsSize = self->_activeDownloadsSize;
    v37 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
    v38 = (void *)[v37 numberWithSQL:@"SELECT transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@", objc_msgSend(v63, "dbRowID"), v64, v67];

    if (v66 == 1)
    {
      unint64_t v39 = self->_activeDownloadsSize + [v38 longLongValue];
    }
    else
    {
      if (v27 != 1)
      {
LABEL_24:
        v47 = brc_bread_crumbs();
        v48 = brc_default_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          v50 = [v63 itemID];
          unint64_t v51 = self->_activeDownloadsSize;
          *(_DWORD *)buf = 138413314;
          v72 = v69;
          __int16 v73 = 2112;
          v74 = v50;
          __int16 v75 = 2048;
          unint64_t v76 = activeDownloadsSize;
          __int16 v77 = 2048;
          unint64_t v78 = v51;
          __int16 v79 = 2112;
          v80 = v47;
          _os_log_debug_impl(&dword_23FA42000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: %@ (%llu -> %llu)%@", buf, 0x34u);
        }
        v36 = v69;
        BOOL v32 = v58;
        goto LABEL_27;
      }
      unint64_t v39 = self->_activeDownloadsSize - [v38 longLongValue];
    }
    self->_unint64_t activeDownloadsSize = v39;
    goto LABEL_24;
  }
LABEL_27:
  v46 = v14;
  if (v66 == 1)
  {
    id v45 = [v68 downloadStream];
    [v45 signalWithDeadline:v60];
LABEL_29:
  }
  return v32;
}

- (id)_sanitizeRecord:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_super v4 = (void *)[v3 copy];
  [v4 setTrackChanges:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v3 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
          [v4 setObject:0 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v4 setTrackChanges:1];
  return v4;
}

- (void)_finishedDownload:(id)a3 syncContext:(id)a4 operationID:(id)a5 error:(id)a6
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v68 = a4;
  id v67 = a5;
  id v11 = a6;
  id v12 = +[BRCAccountsManager sharedManager];
  LODWORD(a5) = [v12 isInSyncBubble];

  if (a5)
  {
    v65 = brc_bread_crumbs();
    int v66 = brc_default_log();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT)) {
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:]();
    }
  }
  v71 = [v10 clientZone];
  id v70 = [v10 stageID];
  uint64_t v69 = [v10 kind];
  memset(v92, 0, sizeof(v92));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader _finishedDownload:syncContext:operationID:error:]", 613, v92);
  long long v13 = brc_bread_crumbs();
  long long v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v54 = v92[0];
    v55 = [v10 transferID];
    [v10 kind];
    uint64_t v56 = BRCPrettyPrintEnum();
    uint64_t v57 = [v10 etag];
    BOOL v58 = (void *)v57;
    id v59 = @"failed";
    *(_DWORD *)buf = 134219266;
    uint64_t v94 = v54;
    __int16 v95 = 2112;
    if (!v11) {
      id v59 = @"done";
    }
    id v96 = v55;
    __int16 v97 = 2080;
    uint64_t v98 = v56;
    __int16 v99 = 2112;
    uint64_t v100 = v57;
    __int16 v101 = 2112;
    v102 = v59;
    __int16 v103 = 2112;
    v104 = v13;
    _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Downloader[%@-%s-%@]: download %@%@", buf, 0x3Eu);
  }
  if (v70)
  {
    unsigned int v15 = v69;
    if (!v11 && v71) {
      goto LABEL_8;
    }
    long long v16 = [(BRCAccountSessionFPFS *)self->super.super._session stageRegistry];
    uint64_t v17 = [v10 itemID];
    [v16 cleanupStagedDownloadWithID:v70 forItemID:v17];
  }
  unsigned int v15 = v69;
  if (!v71)
  {
    id v21 = 0;
    goto LABEL_32;
  }
LABEL_8:
  if (v15 <= 3)
  {
    session = self->super.super._session;
    uint64_t v19 = [v10 transferID];
    v20 = -[BRCAccountSessionFPFS itemByRowID:](session, "itemByRowID:", [v19 longLongValue]);
    id v21 = [v20 asDocument];

    double v22 = [(BRCAccountSessionFPFS *)self->super.super._session downloadTrackers];
    double v23 = [v10 etagIfLoser];
    [v22 document:v21 didCompleteDownloadEtagIfLoser:v23 kind:v69 withError:v11];

    if (v11) {
      goto LABEL_10;
    }
LABEL_15:
    [(BRCFSDownloader *)self _clearDownloadErrorForDocument:v21];
    v30 = [(BRCAccountSessionFPFS *)self->super.super._session applyScheduler];
    BOOL v31 = [v10 itemID];
    uint64_t v32 = [v71 serverRankByItemID:v31];

    if (v69 >= 4) {
      int v33 = 1;
    }
    else {
      int v33 = dword_23FD342C0[(int)v69];
    }
    v52 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_216;
    v72[3] = &unk_265081530;
    v72[4] = self;
    id v73 = v10;
    char v82 = 0;
    id v74 = v68;
    id v75 = v70;
    int v80 = v69;
    id v21 = v21;
    id v76 = v21;
    uint64_t v79 = v32;
    int v81 = v33;
    id v53 = v30;
    id v77 = v53;
    id v78 = v71;
    [v52 groupInBatch:v72];

    goto LABEL_32;
  }
  id v21 = 0;
  if (!v11) {
    goto LABEL_15;
  }
LABEL_10:
  if ([v71 handleZoneLevelErrorIfNeeded:v11 forItemCreation:0]) {
    goto LABEL_32;
  }
  if (objc_msgSend(v11, "brc_isCloudKitCancellationError")) {
    goto LABEL_18;
  }
  v24 = [v68 downloadThrottle];
  unint64_t v25 = [(BRCFSDownloader *)self _bumpThrottleForDownload:v10 throttle:v24];

  id v26 = [v21 appLibrary];
  int v27 = [v26 mangledID];
  uint64_t v28 = +[BRCUserDefaults defaultsForMangledID:v27];
  LODWORD(v25) = v25 > [v28 downloadRetryCountForFailure];

  if (!v25)
  {
LABEL_18:
    char v29 = 0;
  }
  else
  {
    [(BRCFSDownloader *)self _reportDownloadErrorForDocument:v21 error:v11];
    char v29 = 1;
  }
  if ((objc_msgSend(v11, "brc_isCloudKitCancellationError") & 1) != 0
    || (objc_msgSend(v11, "brc_isRetriable") & 1) != 0
    || objc_msgSend(v11, "brc_isCloudKitAssetFileModified"))
  {
    v34 = [v10 progress];
    if ([v34 completedUnitCount])
    {
      v35 = [v10 progress];
      char v36 = [v35 isFinished];

      if (v36)
      {
LABEL_27:
        v43 = brc_bread_crumbs();
        v44 = brc_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v94 = (uint64_t)v10;
          __int16 v95 = 2112;
          id v96 = v67;
          __int16 v97 = 2112;
          uint64_t v98 = (uint64_t)v11;
          __int16 v99 = 2112;
          uint64_t v100 = (uint64_t)v43;
          _os_log_debug_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Rescheduling %@ (%@) for retriable error: %@%@", buf, 0x2Au);
        }

        id v45 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
        v90[0] = MEMORY[0x263EF8330];
        v90[1] = 3221225472;
        v90[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke;
        v90[3] = &unk_26507F148;
        id v91 = v68;
        v46 = (void *)MEMORY[0x2455D9A50](v90);
        v47 = [v11 description];
        v48 = [v10 progress];
        uint64_t v49 = [v48 completedUnitCount];
        v50 = [v10 transferID];
        unint64_t v51 = [v10 etag];
        [v45 execute:@"UPDATE client_downloads SET  transfer_operation = call_block(%@, next_retry_stamp), download_error = %@, unit_count_completed = %lld WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", v46, v47, v49, v50, v69, v51];

        goto LABEL_32;
      }
      v37 = [v71 mangledID];
      v34 = +[BRCUserDefaults defaultsForMangledID:v37];

      unint64_t v38 = [(NSMutableDictionary *)self->_willRetryOperationProgress count];
      if (v38 < [v34 downloadWillRetryProgressMaxCount])
      {
        unint64_t v39 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
        [v39 assertOnQueue];

        BOOL v40 = [v10 progress];
        willRetryOperationProgress = self->_willRetryOperationProgress;
        v42 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "dbRowID"));
        [(NSMutableDictionary *)willRetryOperationProgress setObject:v40 forKeyedSubscript:v42];

        [v10 setProgressPublished:0];
      }
    }

    goto LABEL_27;
  }
  uint64_t v60 = brc_bread_crumbs();
  v61 = brc_default_log();
  if (os_log_type_enabled(v61, (os_log_type_t)0x90u))
  {
    v63 = [v21 st];
    uint64_t v64 = [v63 displayName];
    *(_DWORD *)buf = 138412802;
    uint64_t v94 = (uint64_t)v64;
    __int16 v95 = 2112;
    id v96 = v11;
    __int16 v97 = 2112;
    uint64_t v98 = (uint64_t)v60;
    _os_log_error_impl(&dword_23FA42000, v61, (os_log_type_t)0x90u, "[ERROR] Got non recoverable error when downloading %@: %@%@", buf, 0x20u);
  }
  if ((v29 & 1) == 0) {
    [(BRCFSDownloader *)self _reportDownloadErrorForDocument:v21 error:v11];
  }
  v62 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_211;
  v83[3] = &unk_265081408;
  int v88 = 41;
  v83[4] = self;
  id v84 = v10;
  id v85 = v11;
  int v89 = v69;
  id v21 = v21;
  id v86 = v21;
  id v87 = v71;
  [v62 groupInBatch:v83];

LABEL_32:
  __brc_leave_section(v92);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  sqlite3_int64 v6 = sqlite3_value_int64(*a4);
  uint64_t v7 = [*(id *)(a1 + 32) downloadStream];
  [v7 signalWithDeadline:v6];

  sqlite3_result_null(a2);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_211(uint64_t a1, void *a2)
{
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  id v26 = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_2;
  int v27 = &unk_265081508;
  objc_super v4 = *(void **)(a1 + 40);
  uint64_t v28 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 72);
  id v29 = v4;
  id v6 = a2;
  uint64_t v7 = (void *)MEMORY[0x2455D9A50](&v24);
  uint64_t v8 = [*(id *)(a1 + 48) description];
  id v9 = [*(id *)(a1 + 40) transferID];
  uint64_t v10 = *(unsigned int *)(a1 + 76);
  id v11 = [*(id *)(a1 + 40) etag];
  [v6 execute:@"UPDATE client_downloads SET  throttle_state = %d, transfer_record = NULL, transfer_stage = call_block(%@, transfer_stage), transfer_operation = NULL, download_error = %@ WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", v5, v7, v8, v9, v10, v11, v24, v25, v26, v27, v28];

  if (objc_msgSend(*(id *)(a1 + 48), "brc_isCloudKitUnknownItemError")
    && (![*(id *)(a1 + 40) kind]
     || [*(id *)(a1 + 40) kind] == 3))
  {
    id v12 = brc_bread_crumbs();
    long long v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_211_cold_2();
    }

    [*(id *)(a1 + 56) handleUnknownItemError];
  }
  if (*(_DWORD *)(a1 + 72) == 41 && [*(id *)(a1 + 40) kind] == 2)
  {
    long long v14 = brc_bread_crumbs();
    unsigned int v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_211_cold_1();
    }

    long long v16 = *(void **)(a1 + 64);
    uint64_t v17 = [*(id *)(a1 + 40) itemID];
    uint64_t v18 = [v16 serverRankByItemID:v17];

    uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 8) applyScheduler];
    v20 = [*(id *)(a1 + 64) dbRowID];
    [v19 setState:1 andApplyKind:2 forRank:v18 zoneRowID:v20];
  }
  [*(id *)(a1 + 56) saveToDB];
  id v21 = [*(id *)(*(void *)(a1 + 32) + 8) downloadTrackers];
  uint64_t v22 = *(void *)(a1 + 56);
  double v23 = [*(id *)(a1 + 40) etagIfLoser];
  objc_msgSend(v21, "document:didCompleteDownloadEtagIfLoser:kind:withError:", v22, v23, objc_msgSend(*(id *)(a1 + 40), "kind"), *(void *)(a1 + 48));
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  id v8 = (id)[NSString newFromSqliteValue:*a4];
  if (v8)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 8) stageRegistry];
    uint64_t v7 = [*(id *)(a1 + 40) itemID];
    [v6 cleanupStagedDownloadWithID:v8 forItemID:v7];
  }
  sqlite3_result_null(a2);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_216(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  objc_super v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 record];
  uint64_t v7 = [v3 _sanitizeRecord:v6];

  uint64_t v8 = *(unsigned __int8 *)(a1 + 104);
  if (*(unsigned char *)(a1 + 104))
  {
    id v9 = [*(id *)(a1 + 48) contextIdentifier];
  }
  else
  {
    id v9 = @"_done";
  }
  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = [*(id *)(a1 + 40) transferID];
  uint64_t v12 = *(unsigned int *)(a1 + 96);
  long long v13 = [*(id *)(a1 + 40) etag];
  [v5 execute:@"UPDATE client_downloads SET  throttle_state = %d, transfer_queue = %@, transfer_record = %@, transfer_stage = %@, transfer_operation = NULL, download_error = NULL WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", v8, v9, v7, v10, v11, v12, v13];

  if (v8) {
  [*(id *)(a1 + 64) saveToDB];
  }
  long long v14 = [*(id *)(*(void *)(a1 + 32) + 8) downloadTrackers];
  uint64_t v15 = *(void *)(a1 + 64);
  long long v16 = [*(id *)(a1 + 40) etagIfLoser];
  objc_msgSend(v14, "document:didCompleteDownloadEtagIfLoser:kind:withError:", v15, v16, objc_msgSend(*(id *)(a1 + 40), "kind"), 0);

  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v17 = [*(id *)(a1 + 48) downloadStream];
    [v17 signal];
LABEL_12:

    goto LABEL_13;
  }
  if (*(void *)(a1 + 88))
  {
    uint64_t v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = *(void *)(a1 + 88);
      uint64_t v24 = [*(id *)(a1 + 40) itemID];
      *(_DWORD *)buf = 134218754;
      uint64_t v26 = v23;
      __int16 v27 = 2112;
      uint64_t v28 = v24;
      __int16 v29 = 2080;
      uint64_t v30 = BRCPrettyPrintEnum();
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      _os_log_debug_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: %@ state is %s%@", buf, 0x2Au);
    }
    uint64_t v20 = *(unsigned int *)(a1 + 100);
    uint64_t v21 = *(void *)(a1 + 88);
    uint64_t v22 = *(void **)(a1 + 72);
    uint64_t v17 = [*(id *)(a1 + 80) dbRowID];
    [v22 setState:v20 andApplyKind:2 forRank:v21 zoneRowID:v17];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)rescheduleJobsPendingWinnerForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  objc_msgSend(v5, "execute:", @"UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = %u AND throttle_id = %lld", 42, objc_msgSend(v4, "dbRowID"));
  if ([v5 changes])
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSDownloader rescheduleJobsPendingWinnerForItem:]();
    }

    uint64_t v8 = [v4 syncContextUsedForTransfers];
    id v9 = [v8 downloadStream];
    [v9 signal];
  }
}

- (void)rescheduleJobsPendingRecentsAndFavoritesFetchInZone:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  id v6 = [v4 dbRowID];
  [v5 execute:@"UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = 40   AND throttle_state != 0   AND zone_rowid = %@", v6];

  if ([v5 changes])
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSDownloader rescheduleJobsPendingWinnerForItem:]();
    }

    if ([v4 isSharedZone])
    {
      id v9 = [v4 metadataSyncContext];
      uint64_t v10 = [v9 downloadStream];
      [v10 signal];
    }
    else
    {
      id v11 = [v4 dbRowID];
      id v9 = (void *)[v5 fetch:@"SELECT distinct app_library_rowid FROM client_downloads WHERE throttle_state = 1   AND throttle_state != 0   AND zone_rowid = %@", v11];

      if ([v9 next])
      {
        do
        {
          uint64_t v12 = [v9 numberAtIndex:0];
          long long v13 = [(BRCAccountSessionFPFS *)self->super.super._session appLibraryByRowID:v12];
          long long v14 = [v13 transferSyncContext];
          uint64_t v15 = [v14 downloadStream];
          [v15 signal];
        }
        while (([v9 next] & 1) != 0);
      }
    }
  }
}

- (void)_cancelJobs:(id)a3 state:(int)a4
{
  uint64_t v33 = *(void *)&a4;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 next])
  {
    do
    {
      context = (void *)MEMORY[0x2455D97F0]();
      id v6 = [v5 numberAtIndex:0];
      uint64_t v39 = [v5 intAtIndex:1];
      v37 = [v5 stringAtIndex:2];
      uint64_t v40 = [v5 uuidAtIndex:3];
      id v41 = [v5 stringAtIndex:4];
      uint64_t v7 = [v5 numberAtIndex:5];
      uint64_t v8 = [v5 numberAtIndex:6];
      int v9 = [v5 intAtIndex:7];
      uint64_t v10 = [v5 longLongAtIndex:8];
      v35 = (void *)v7;
      id v11 = [(BRCAccountSessionFPFS *)self->super.super._session appLibraryByRowID:v7];
      v34 = (void *)v8;
      uint64_t v12 = [(BRCAccountSessionFPFS *)self->super.super._session serverZoneByRowID:v8];
      long long v13 = +[BRCSyncContext transferContextForServerZone:v12 appLibrary:v11];
      unint64_t v38 = v6;
      if (v9 == 1)
      {
        long long v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v31 = BRCPrettyPrintEnum();
          *(_DWORD *)buf = 138413058;
          v43 = v38;
          __int16 v44 = 2080;
          uint64_t v45 = v31;
          __int16 v46 = 2112;
          v47 = v37;
          __int16 v48 = 2112;
          uint64_t v49 = v14;
          _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@-%s-%@]: Cancelling download%@", buf, 0x2Au);
        }

        self->_activeDownloadsSize -= v10;
        id v6 = v38;
        if (v39 == 3 || !v39)
        {
          long long v16 = -[BRCAccountSessionFPFS itemByRowID:](self->super.super._session, "itemByRowID:", [v38 unsignedIntegerValue]);
          uint64_t v17 = [v16 asDocument];

          session = self->super.super._session;
          id v19 = 0;
          uint64_t v20 = [(BRCAccountSessionFPFS *)session downloadTrackers];
          objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
          uint64_t v21 = v32 = v12;
          [v20 document:v17 didCompleteDownloadEtagIfLoser:v19 kind:v39 withError:v21];

          id v6 = v38;
          uint64_t v12 = v32;
        }
      }
      uint64_t v22 = (void *)v40;
      if (v40)
      {
        uint64_t v23 = [v13 downloadStream];
        [v23 cancelTransferID:v6 operationID:v40];
      }
      if (v41)
      {
        uint64_t v24 = -[BRCAccountSessionFPFS itemIDByRowID:](self->super.super._session, "itemIDByRowID:", [v6 unsignedIntegerValue]);
        uint64_t v25 = brc_bread_crumbs();
        uint64_t v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v30 = BRCPrettyPrintEnum();
          *(_DWORD *)buf = 138413314;
          v43 = v38;
          __int16 v44 = 2080;
          uint64_t v45 = v30;
          __int16 v46 = 2112;
          v47 = v37;
          __int16 v48 = 2112;
          uint64_t v49 = v41;
          __int16 v50 = 2112;
          unint64_t v51 = v25;
          _os_log_debug_impl(&dword_23FA42000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@-%s-%@]: Cleaning up download stage: %@%@", buf, 0x34u);
        }

        __int16 v27 = [(BRCAccountSessionFPFS *)self->super.super._session stageRegistry];
        [v27 cleanupStagedDownloadWithID:v41 forItemID:v24];

        id v6 = v38;
        uint64_t v22 = (void *)v40;
      }
      if (v13)
      {
        uint64_t v28 = [v5 db];
        __int16 v29 = [v13 contextIdentifier];
        [v28 execute:@"UPDATE client_downloads SET  throttle_state = %d, transfer_queue = %@, transfer_record = NULL, transfer_stage = NULL, transfer_operation = NULL, unit_count_completed = 0 WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", v33, v29, v6, v39, v37];

        uint64_t v22 = (void *)v40;
      }
    }
    while (([v5 next] & 1) != 0);
  }
  [v5 close];
}

- (void)_finishDownloadCleanup:(id)a3
{
  id v6 = a3;
  id v3 = [v6 clientZone];
  id v4 = [v6 itemID];
  id v5 = [v3 popDownloadedBlockForItemID:v4];

  if (v5) {
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5
{
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6
{
}

- (id)_getCancelErrorFromCancelReason:(int)a3
{
  if (a3 == 1)
  {
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorRescheduleDownloadForMoreRecentServerVersion");
  }
  else
  {
    if (a3)
    {
      id v3 = brc_bread_crumbs();
      id v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        -[BRCFSDownloader _getCancelErrorFromCancelReason:]();
      }
    }
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorDownloadCancelled");
  }
  return v5;
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6 cancelReason:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  long long v14 = v13;
  if (v7 != 1) {
    goto LABEL_8;
  }
  if (!v13)
  {
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  uint64_t v25 = brc_bread_crumbs();
  uint64_t v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
    -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:]();
  }

  if (v10)
  {
LABEL_4:
    if (v10 != 3)
    {
      uint64_t v15 = brc_bread_crumbs();
      long long v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:]();
      }
    }
  }
LABEL_8:
  uint64_t v17 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  uint64_t v18 = (void *)[v17 fetch:@"SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@   AND throttle_state != 0", objc_msgSend(v12, "dbRowID"), v10, v14];

  id v19 = [(BRCFSDownloader *)self _getCancelErrorFromCancelReason:v7];
  [(BRCFSDownloader *)self _cancelJobs:v18 state:0];
  if (v10 == 3)
  {
LABEL_11:
    [(BRCFSDownloader *)self _finishDownloadCleanup:v12];
    if (v8)
    {
      uint64_t v20 = [(BRCAccountSessionFPFS *)self->super.super._session downloadTrackers];
      uint64_t v21 = v20;
      id v22 = v12;
      uint64_t v23 = 0;
      uint64_t v24 = v10;
LABEL_15:
      [v20 document:v22 didCompleteDownloadEtagIfLoser:v23 kind:v24 withError:v19];

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (v10 != 2)
  {
    if (v10) {
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (v8)
  {
    uint64_t v20 = [(BRCAccountSessionFPFS *)self->super.super._session downloadTrackers];
    uint64_t v21 = v20;
    id v22 = v12;
    uint64_t v23 = v14;
    uint64_t v24 = 2;
    goto LABEL_15;
  }
LABEL_16:
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  id v6 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  uint64_t v7 = (void *)[v6 fetch:@"SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u   AND throttle_state != 0", objc_msgSend(v8, "dbRowID"), v4];

  [(BRCFSDownloader *)self _cancelJobs:v7 state:0];
  if (v4 == 3 || !v4) {
    [(BRCFSDownloader *)self _finishDownloadCleanup:v8];
  }
}

- (void)cancelAndCleanupItemDownloads:(id)a3
{
  session = self->super.super._session;
  id v5 = a3;
  id v6 = [(BRCAccountSessionFPFS *)session clientDB];
  id v7 = (id)[v6 fetch:@"SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND throttle_state != 0", objc_msgSend(v5, "dbRowID")];

  [(BRCFSDownloader *)self _cancelJobs:v7 state:0];
  [(BRCFSDownloader *)self _finishDownloadCleanup:v5];
}

- (void)addAliasItem:(id)a3 toDownloadingItem:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  int v9 = objc_msgSend(v8, "fetchObjectOfClass:sql:", objc_opt_class(), @"SELECT transfer_operation    FROM client_downloads  WHERE throttle_id = %lld AND throttle_state == 1", objc_msgSend(v7, "dbRowID"));

  if (v9)
  {
    uint64_t v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] adding alias item %@ to currently transfering %@%@", buf, 0x20u);
    }

    id v12 = [v7 syncContextUsedForTransfers];
    id v13 = [v12 downloadStream];
    long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "dbRowID"));
    [v13 addAliasItem:v6 toTransferWithID:v14 operationID:v9];
  }
}

- (void)deleteJobsMatching:(id)a3
{
  session = self->super.super._session;
  id v5 = a3;
  id v6 = [(BRCAccountSessionFPFS *)session clientDB];
  id v7 = [v5 matchingJobsWhereSQLClause];
  id v8 = (void *)[v6 fetch:@"SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE %@ AND throttle_state > %d", v7, 0];

  [(BRCFSDownloader *)self _cancelJobs:v8 state:0];
  v9.receiver = self;
  v9.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v9 deleteJobsMatching:v5];
}

- (void)updateContentDownloadForMetaOnlyChange:(id)a3 fromEtag:(id)a4 toEtag:(id)a5
{
  session = self->super.super._session;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(BRCAccountSessionFPFS *)session clientDB];
  uint64_t v11 = [v10 dbRowID];

  [v12 execute:@"UPDATE client_downloads SET download_etag = %@ WHERE throttle_id = %lld AND download_etag = %@ AND download_kind = %d", v8, v11, v9, 0];
}

- (unint64_t)sizeOfActiveDownloads
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = v3;
  if (!self->_lastDownloadRefresh
    || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > self->_activeDownloadSizeRefreshInterval))
  {
    id v6 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__13;
    uint64_t v24 = __Block_byref_object_dispose__13;
    id v25 = 0;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __40__BRCFSDownloader_sizeOfActiveDownloads__block_invoke;
    __int16 v17 = &unk_265081558;
    __int16 v19 = &v20;
    id v7 = v6;
    id v18 = v7;
    [v7 disableProfilingForQueriesInBlock:&v14];
    objc_storeStrong((id *)&self->_lastDownloadRefresh, v4);
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unint64_t activeDownloadsSize = self->_activeDownloadsSize;
      uint64_t v13 = objc_msgSend((id)v21[5], "longLongValue", v14, v15, v16, v17);
      *(_DWORD *)buf = 134218498;
      unint64_t v27 = activeDownloadsSize;
      __int16 v28 = 2048;
      uint64_t v29 = v13;
      __int16 v30 = 2112;
      uint64_t v31 = v8;
      _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Refreshed active download size %llu -> %llu%@", buf, 0x20u);
    }

    self->_unint64_t activeDownloadsSize = [(id)v21[5] longLongValue];
    _Block_object_dispose(&v20, 8);
  }
  unint64_t v10 = self->_activeDownloadsSize;

  return v10;
}

void __40__BRCFSDownloader_sizeOfActiveDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) numberWithSQL:@"SELECT SUM(transfer_size) FROM client_downloads WHERE throttle_state = 1"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)makeContentLive:(id)a3
{
  id v4 = a3;
  double v5 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__BRCFSDownloader_makeContentLive___block_invoke;
  v8[3] = &unk_265080760;
  id v9 = v4;
  unint64_t v10 = self;
  id v6 = v4;
  LOBYTE(v4) = [v5 groupInTransaction:v8];

  return (char)v4;
}

uint64_t __35__BRCFSDownloader_makeContentLive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "execute:", @"DELETE FROM client_pkg_upload_items WHERE item_rowid = %llu", objc_msgSend(*(id *)(a1 + 32), "dbRowID"));
  if (v4)
  {
    double v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [v3 changes];
      uint64_t v15 = [*(id *)(a1 + 32) fileObjectID];
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      __int16 v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg:%@%@", buf, 0x20u);
    }
    uint64_t v9 = a1 + 32;
    id v7 = *(void **)(a1 + 32);
    id v8 = *(void **)(v9 + 8);
    unint64_t v10 = [v7 currentVersion];
    uint64_t v11 = [v10 ckInfo];
    id v12 = [v11 etag];
    [v8 cancelAndCleanupItemDownload:v7 kind:0 etag:v12];
  }
  return v4;
}

- (BOOL)scheduleContentDownloadForItem:(id)a3 serverItem:(id)a4 options:(unint64_t)a5 etagIfLoser:(id)a6 stageFileName:(id)a7 error:(id *)a8
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:]", 1192, v29);
  __int16 v18 = brc_bread_crumbs();
  __int16 v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = v29[0];
    unint64_t v27 = [v14 itemID];
    *(_DWORD *)buf = 134219010;
    uint64_t v31 = v28;
    __int16 v32 = 2112;
    uint64_t v33 = v27;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2112;
    uint64_t v39 = v18;
    _os_log_debug_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling content download for %@\nlocal: %@\nserver: %@%@", buf, 0x34u);
  }
  __int16 v20 = [(BRCFSDownloader *)self getDownloadEtagForItem:v14 etagIfLoser:v16];
  uint64_t v21 = +[BRCFSDownloaderUtil downloadKindWithEtagIfLoser:v16 options:a5];
  uint64_t v22 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", [v14 dbRowID], v20, v21);
  if ([(BRCFSSchedulerBase *)self jobStateFor:v22] == 1)
  {
    uint64_t v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:]();
    }

    BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = [(BRCFSDownloader *)self _createDownloadingJobForItem:v14 state:1 kind:v21 etag:v20 stageFileName:v17 error:a8];
  }

  __brc_leave_section(v29);
  return v25;
}

- (void)performFirstSchedulingAfterStartupInDB:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 execute:@"UPDATE client_downloads SET transfer_operation = NULL WHERE (transfer_operation >= '')"];
  if ([v4 changes])
  {
    double v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(BRCFSDownloader *)v4 performFirstSchedulingAfterStartupInDB:v6];
    }
  }
  id v7 = (void *)[v4 fetch:@"SELECT app_library_rowid, zone_rowid, transfer_queue   FROM client_downloads  WHERE throttle_state = 1 GROUP BY app_library_rowid, zone_rowid, transfer_queue"];
  if ([v7 next])
  {
    do
    {
      id v8 = (void *)MEMORY[0x2455D97F0]();
      session = self->super.super._session;
      unint64_t v10 = [v7 numberAtIndex:0];
      uint64_t v11 = [(BRCAccountSessionFPFS *)session appLibraryByRowID:v10];

      id v12 = self->super.super._session;
      uint64_t v13 = [v7 numberAtIndex:1];
      id v14 = [(BRCAccountSessionFPFS *)v12 serverZoneByRowID:v13];

      id v15 = [v7 stringAtIndex:2];
      if (([v15 isEqualToString:@"_prepare"] & 1) == 0
        && ([v15 isEqualToString:@"_retry"] & 1) == 0)
      {
        id v16 = brc_bread_crumbs();
        id v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          __int16 v20 = [v7 stringAtIndex:2];
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v20;
          __int16 v23 = 2112;
          uint64_t v24 = v16;
          _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Kicking downloads for %@%@", buf, 0x16u);
        }
        __int16 v18 = +[BRCSyncContext transferContextForServerZone:v14 appLibrary:v11];
        __int16 v19 = [v18 downloadStream];
        [v19 signal];
      }
    }
    while (([v7 next] & 1) != 0);
  }
}

- (void)schedule
{
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v4 = [v3 readerScanBatchSize];

  double v5 = [MEMORY[0x263F8C710] formatInjection:@"transfer_queue = '_retry' AND transfer_operation IS NULL"];
  id v6 = objc_msgSend(MEMORY[0x263F8C720], "rawInjection:length:", "rowid, throttle_id, app_library_rowid, zone_rowid", 49);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__BRCFSDownloader_schedule__block_invoke;
  v7[3] = &unk_265081580;
  v7[4] = self;
  [(BRCFSSchedulerBase *)self scheduleWithBatchSize:v4 whereSQLClause:v5 columns:v6 actionHandler:v7];
}

void __27__BRCFSDownloader_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 numberAtIndex:a3];
  __int16 v20 = [v5 numberAtIndex:(a3 + 1)];
  id v7 = [v5 numberAtIndex:(a3 + 2)];
  id v8 = [v5 numberAtIndex:(a3 + 3)];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) appLibraryByRowID:v7];
  unint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) serverZoneByRowID:v8];
  uint64_t v11 = +[BRCSyncContext transferContextForServerZone:v10 appLibrary:v9];
  id v12 = [v11 contextIdentifier];
  if (v9)
  {
    uint64_t v13 = [v5 db];
    id v14 = [v11 contextIdentifier];
    [v13 execute:@"UPDATE client_downloads SET transfer_queue = %@ WHERE rowid = %@", v14, v6];

    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v20;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: job has been put back in queue %@%@", buf, 0x20u);
    }

    id v17 = [v11 downloadStream];
    [v17 signal];
  }
  else
  {
    __int16 v18 = brc_bread_crumbs();
    __int16 v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v22 = v20;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = v6;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_fault_impl(&dword_23FA42000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Downloader[%@]: failed to find app library with id %@, dropping the download %@%@", buf, 0x2Au);
    }

    id v17 = [v5 db];
    [v17 execute:@"DELETE FROM client_downloads WHERE rowid = %@", v6];
  }
}

- (unint64_t)inFlightSize
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [(BRCAccountSessionFPFS *)self->super.super._session syncContextProvider];
  id v3 = [v2 allSyncContexts];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) downloadStream];
        v6 += [v9 inFlightSize];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)generateContentStageFileNameForItem:(id)a3 etag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 st];
  id v8 = [v7 logicalName];
  uint64_t v9 = objc_msgSend(v8, "br_pathExtension");

  uint64_t v10 = [v9 length];
  long long v11 = NSString;
  uint64_t v12 = [v6 dbRowID];

  long long v13 = [MEMORY[0x263F08C38] UUID];
  uint64_t v14 = [v13 UUIDString];
  id v15 = (void *)v14;
  if (v10) {
    [v11 stringWithFormat:@"content-%lld-%@-%@.%@", v12, v5, v14, v9];
  }
  else {
  uint64_t v16 = [v11 stringWithFormat:@"content-%lld-%@-%@", v12, v5, v14, v18];
  }

  return v16;
}

- (void)_sendContentsBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5 isLoserDownload:(BOOL)a6
{
  BOOL v71 = a6;
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = +[BRCAccountsManager sharedManager];
  int v10 = [v9 isInSyncBubble];

  if (v10)
  {
    v65 = brc_bread_crumbs();
    int v66 = brc_default_log();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT)) {
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:]();
    }
  }
  id v76 = self;
  long long v11 = [v8 syncContext];
  long long v13 = 0;
  uint64_t v14 = 0;
  id v15 = 0;
  uint64_t v16 = 0;
  id v17 = 0;
  if ([0 itemsCount] >= a5) {
    goto LABEL_56;
  }
  uint64_t v69 = v11;
  uint64_t v14 = 0;
  long long v13 = 0;
  id v77 = 0;
  id v75 = 0;
  uint64_t v18 = 0;
  char v19 = 0;
  *(void *)&long long v12 = 138412802;
  long long v67 = v12;
  v72 = v8;
  unint64_t v70 = a5;
  while (1)
  {
    __int16 v20 = v13;
    uint64_t v21 = (void *)MEMORY[0x2455D97F0]();
    long long v13 = [v8 nextDocumentItem];

    if (!v13) {
      break;
    }
    uint64_t v22 = [v8 stageID];

    uint64_t v23 = [v8 etag];

    uint64_t v24 = [v8 completedUnitCount];
    BOOL v74 = [v8 transferQOS] > 24;
    uint64_t v25 = v22;
    id v78 = (void *)v23;
    if (!v22)
    {
      uint64_t v26 = brc_bread_crumbs();
      __int16 v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v86 = (uint64_t)v26;
        _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] No stage ID, createing a new one%@", buf, 0xCu);
      }

      uint64_t v23 = (uint64_t)v78;
      uint64_t v25 = [(BRCFSDownloader *)v76 generateContentStageFileNameForItem:v13 etag:v78];
    }
    id v75 = (void *)v25;
    if (v14)
    {
      id v73 = v14;
    }
    else
    {
      uint64_t v28 = [[BRCDownloadContentsBatchOperation alloc] initWithSyncContext:v69 sessionContext:v76->super.super._session];
      uint64_t v29 = [(_BRCOperation *)v28 operationID];

      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = __79__BRCFSDownloader__sendContentsBatch_sizeHint_maxRecordsCount_isLoserDownload___block_invoke;
      v80[3] = &unk_2650815A8;
      v80[4] = v76;
      id v81 = v69;
      id v77 = v29;
      id v82 = v77;
      id v73 = v28;
      __int16 v30 = v28;
      uint64_t v23 = (uint64_t)v78;
      [(BRCDownloadContentsBatchOperation *)v30 setPerDownloadCompletionBlock:v80];
    }
    uint64_t v31 = [BRCDownloadContent alloc];
    if (!v71) {
      uint64_t v23 = 0;
    }
    __int16 v32 = -[BRCDownloadContent initWithDocument:stageID:etagIfLoser:downloadKind:](v31, "initWithDocument:stageID:etagIfLoser:downloadKind:", v13, v25, v23, objc_msgSend(v8, "kind", v67));
    uint64_t v33 = v32;
    if (!v71)
    {
      __int16 v34 = [(BRCDownload *)v32 etag];
      if ([v34 isEqualToString:v78])
      {
      }
      else
      {
        id v35 = [v13 currentVersion];
        __int16 v36 = [v35 oldVersionIdentifier];
        char v37 = [v36 isEqualToString:v78];

        if ((v37 & 1) == 0)
        {
          if ([v13 isDocumentBeingCopiedToNewZone])
          {
            v55 = brc_bread_crumbs();
            uint64_t v56 = brc_default_log();
            unint64_t v53 = v70;
            BOOL v54 = v74;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v86 = (uint64_t)v13;
              __int16 v87 = 2112;
              int v88 = v55;
              _os_log_debug_impl(&dword_23FA42000, v56, OS_LOG_TYPE_DEBUG, "[DEBUG] Seems that item %@ has started a czm after requesting a download%@", buf, 0x16u);
            }
          }
          else
          {
            v55 = brc_bread_crumbs();
            uint64_t v56 = brc_default_log();
            unint64_t v53 = v70;
            BOOL v54 = v74;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v67;
              uint64_t v86 = (uint64_t)v33;
              __int16 v87 = 2112;
              int v88 = v78;
              __int16 v89 = 2112;
              v90 = v55;
              _os_log_fault_impl(&dword_23FA42000, v56, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item download %@ etag changed from %@%@", buf, 0x20u);
            }
          }
          uint64_t v14 = v73;

          id v17 = v78;
          -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:](v76, "cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:", v13, [v72 kind], v78, 1);
          goto LABEL_34;
        }
      }
    }
    willRetryOperationProgress = v76->_willRetryOperationProgress;
    uint64_t v39 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "dbRowID"));
    uint64_t v40 = [(NSMutableDictionary *)willRetryOperationProgress objectForKeyedSubscript:v39];

    if (v40)
    {
      id v41 = v76->_willRetryOperationProgress;
      v42 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "dbRowID"));
      [(NSMutableDictionary *)v41 removeObjectForKey:v42];

      v43 = brc_bread_crumbs();
      __int16 v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v86 = (uint64_t)v40;
        __int16 v87 = 2112;
        int v88 = v43;
        _os_log_debug_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Re-use progress %@%@", buf, 0x16u);
      }

      uint64_t v14 = v73;
      id v45 = v77;
    }
    else
    {
      __int16 v46 = [v13 currentVersion];
      uint64_t v47 = [v46 size];

      uint64_t v14 = v73;
      if (v24 > v47)
      {
        __int16 v48 = brc_bread_crumbs();
        uint64_t v49 = brc_default_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v86 = (uint64_t)v48;
          _os_log_impl(&dword_23FA42000, v49, OS_LOG_TYPE_DEFAULT, "[WARNING] Completed unit count is greater than version size; ignoring value%@",
            buf,
            0xCu);
        }

        uint64_t v24 = 0;
      }
      v83[0] = @"BRCSizeInfoCompletedUnitCountKey";
      __int16 v50 = [NSNumber numberWithLongLong:v24];
      v83[1] = @"BRCSizeInfoTotalUnitCountKey";
      v84[0] = v50;
      unint64_t v51 = [NSNumber numberWithLongLong:v47];
      v84[1] = v51;
      v43 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];

      uint64_t v40 = [(NSMutableDictionary *)v76->_pendingOperationProgress objectForKeyedSubscript:v75];
      if (!v40 && (![(BRCDownloadContent *)v33 kind] || [(BRCDownloadContent *)v33 kind] == 3))
      {
        id v68 = brc_bread_crumbs();
        uint64_t v52 = brc_default_log();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v86 = (uint64_t)v75;
          __int16 v87 = 2112;
          int v88 = v68;
          _os_log_fault_impl(&dword_23FA42000, v52, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed finding a progress for stageID: %@%@", buf, 0x16u);
        }
      }
      [v40 updateToBeDownloadProgressForDocument:v13 sizeInfo:v43];
      id v45 = v77;
    }

    [(BRCDownloadContent *)v33 setProgress:v40];
    [(BRCDownloadContentsBatchOperation *)v14 addDownload:v33];
    id v77 = v45;
    [(BRCFSDownloader *)v76 _willDownload:v33 operationID:v45];
    [v13 triggerNotificationIfNeeded];
    id v17 = v78;
    unint64_t v53 = v70;
    BOOL v54 = v74;
LABEL_34:
    v19 |= v54;

    uint64_t v18 = v17;
    id v8 = v72;
    if ([(BRCTransferBatchOperation *)v14 itemsCount] >= v53) {
      goto LABEL_43;
    }
  }
  id v17 = v18;
LABEL_43:
  if (v14)
  {
    uint64_t v79 = v17;
    if ([v8 kind] == 3)
    {
      uint64_t v57 = objc_msgSend(MEMORY[0x263EFD780], "br_downloadSpeculative");
      if ((v19 & 1) == 0)
      {
        [(BRCDownloadContentsBatchOperation *)v14 setQueuePriority:-8];
        [(BRCDownloadContentsBatchOperation *)v14 setQualityOfService:9];
        goto LABEL_52;
      }
LABEL_50:
      BOOL v58 = v14;
      uint64_t v59 = 4;
    }
    else
    {
      if (v19)
      {
        uint64_t v57 = objc_msgSend(MEMORY[0x263EFD780], "br_downloadUserInitiated");
        goto LABEL_50;
      }
      uint64_t v57 = objc_msgSend(MEMORY[0x263EFD780], "br_downloadUpdatedDocuments");
      BOOL v58 = v14;
      if (v71) {
        uint64_t v59 = -4;
      }
      else {
        uint64_t v59 = 0;
      }
    }
    -[BRCDownloadContentsBatchOperation setQueuePriority:](v58, "setQueuePriority:", v59, v67);
LABEL_52:
    long long v11 = v69;
    -[_BRCOperation setNonDiscretionary:](v14, "setNonDiscretionary:", 1, v67);
    [(_BRCOperation *)v14 setGroup:v57];
    uint64_t v60 = brc_bread_crumbs();
    v61 = brc_default_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v62 = [(BRCTransferBatchOperation *)v14 itemsCount];
      v63 = [v69 contextIdentifier];
      *(_DWORD *)buf = 134218498;
      uint64_t v86 = v62;
      __int16 v87 = 2112;
      int v88 = v63;
      __int16 v89 = 2112;
      v90 = v60;
      _os_log_impl(&dword_23FA42000, v61, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading %ld documents in %@%@", buf, 0x20u);
    }
    uint64_t v64 = [v69 downloadStream];
    [v64 addBatchOperation:v14];

    uint64_t v16 = v75;
    id v17 = v79;
  }
  else
  {
    long long v11 = v69;
    uint64_t v16 = v75;
  }
  id v15 = v77;
LABEL_56:
}

uint64_t __79__BRCFSDownloader__sendContentsBatch_sizeHint_maxRecordsCount_isLoserDownload___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishedDownload:a2 syncContext:*(void *)(a1 + 40) operationID:*(void *)(a1 + 48) error:a3];
}

- (void)_postponeLoserForWinner:(int64_t)a3 etag:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  [v7 execute:@"UPDATE client_downloads    SET throttle_state = %u  WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@", 42, a3, 2, v6];

  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    int64_t v11 = a3;
    __int16 v12 = 2080;
    uint64_t v13 = BRCPrettyPrintEnum();
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%lld-%s-%@]: postpone because loser is more recent than live item%@", buf, 0x2Au);
  }
}

- (void)_transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6
{
  id v10 = a3;
  int64_t v11 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  [v11 assertOnQueue];
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = brc_current_date_nsec();
  if ([(BRCFSSchedulerBase *)self isCancelled]) {
    goto LABEL_22;
  }
  uint64_t v13 = [v10 contextIdentifier];
  __int16 v14 = (void *)[v11 fetch:@"  SELECT throttle_id, next_retry_stamp, download_kind, download_etag     FROM client_downloads    WHERE throttle_state = 1      AND transfer_queue = %@      AND transfer_operation IS NULL      AND download_priority >= %ld ORDER BY download_priority DESC, download_request_stamp DESC", v13, a6];

  if (![v14 next])
  {
    id v15 = 0;
    goto LABEL_19;
  }
  unint64_t v32 = a4;
  unint64_t v33 = a5;
  id v34 = v10;
  id v15 = 0;
  do
  {
    __int16 v16 = (void *)MEMORY[0x2455D97F0]();
    uint64_t v17 = [v14 unsignedIntegerAtIndex:0];
    uint64_t v18 = [v14 longLongAtIndex:1];
    uint64_t v19 = [v14 intAtIndex:2];
    uint64_t v20 = [v14 stringAtIndex:3];
    uint64_t v21 = (void *)v20;
    if (v18 <= v12)
    {
      [v14 close];
      uint64_t v23 = [[BRCFSDownloaderBatchEnumerator alloc] initWithSyncContext:v34 kind:v19 now:v12 retryQueueKick:&v35];

      if (v19 >= 2)
      {
        if (v19 == 2)
        {
          uint64_t v24 = self;
          uint64_t v25 = v23;
          unint64_t v27 = v32;
          unint64_t v26 = v33;
          uint64_t v28 = 1;
          goto LABEL_13;
        }
        if (v19 != 3)
        {
LABEL_14:
          id v15 = v23;
          goto LABEL_15;
        }
      }
      uint64_t v24 = self;
      uint64_t v25 = v23;
      unint64_t v27 = v32;
      unint64_t v26 = v33;
      uint64_t v28 = 0;
LABEL_13:
      [(BRCFSDownloader *)v24 _sendContentsBatch:v25 sizeHint:v26 maxRecordsCount:v27 isLoserDownload:v28];
      goto LABEL_14;
    }
    uint64_t v22 = v35;
    if (v35 >= v18) {
      uint64_t v22 = v18;
    }
    uint64_t v35 = v22;
    [v11 execute:@"UPDATE client_downloads    SET transfer_queue = '_retry'  WHERE throttle_id = %ld AND download_kind = %u AND download_etag = %@", v17, v19, v20];
LABEL_15:
  }
  while (([v14 next] & 1) != 0);
  id v10 = v34;
  if (v35 != 0x7FFFFFFFFFFFFFFFLL) {
    -[BRCFSSchedulerBase signalWithDeadline:](self, "signalWithDeadline:");
  }
LABEL_19:
  uint64_t v29 = [v10 contextIdentifier];
  __int16 v30 = (void *)[v11 numberWithSQL:@"SELECT MIN(next_retry_stamp) FROM client_downloads   WHERE throttle_state = 1     AND transfer_queue = %@      AND transfer_operation IS NULL ", v29];

  if (v30)
  {
    uint64_t v31 = [v10 downloadStream];
    objc_msgSend(v31, "signalWithDeadline:", objc_msgSend(v30, "longLongValue"));
  }
LABEL_22:
}

- (void)transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  __int16 v14 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  id v15 = [v14 serialQueue];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __115__BRCFSDownloader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke;
  v27[3] = &unk_2650815D0;
  v27[4] = self;
  id v16 = v12;
  id v28 = v16;
  unint64_t v30 = a4;
  unint64_t v31 = a5;
  int64_t v32 = a6;
  id v17 = v13;
  id v29 = v17;
  uint64_t v18 = v15;
  uint64_t v19 = v27;
  uint64_t v20 = (void *)MEMORY[0x2455D97F0]();
  long long v33 = 0uLL;
  uint64_t v34 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v33);
  uint64_t v21 = brc_bread_crumbs();
  uint64_t v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = v33;
    label = dispatch_queue_get_label(v18);
    *(_DWORD *)block = 134218498;
    *(void *)&block[4] = v25;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    __int16 v36 = v21;
    _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v39 = v33;
  uint64_t v40 = v34;
  *(void *)block = MEMORY[0x263EF8330];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_7;
  __int16 v36 = &unk_26507EE60;
  uint64_t v23 = v18;
  char v37 = v23;
  uint64_t v24 = v19;
  id v38 = v24;
  dispatch_async(v23, block);
}

uint64_t __115__BRCFSDownloader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _transferStreamOfSyncContext:*(void *)(a1 + 40) didBecomeReadyWithMaxRecordsCount:*(void *)(a1 + 56) sizeHint:*(void *)(a1 + 64) priority:*(void *)(a1 + 72)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)_reportDownloadErrorForDocument:(id)a3 error:(id)a4
{
  id v6 = a3;
  objc_msgSend(a4, "brc_telemetryReportableErrorWithRecordName:", 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [(BRCAccountSessionFPFS *)self->super.super._session clientDB];
  uint64_t v8 = [v6 dbRowID];

  uint64_t v9 = [v13 domain];
  uint64_t v10 = [v13 code];
  int64_t v11 = objc_msgSend(v13, "brc_cloudKitErrorMessage");
  [v7 execute:@"INSERT OR REPLACE INTO item_errors (item_rowid, error_domain, error_code, error_message, service) VALUES (%llu, %@, %ld, %@, %d)", v8, v9, v10, v11, 2];

  id v12 = +[BRCAutoBugCaptureReporter sharedABCReporter];
  [v12 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"Download" forError:v13];
}

- (void)_clearDownloadErrorForDocument:(id)a3
{
  session = self->super.super._session;
  id v4 = a3;
  id v6 = [(BRCAccountSessionFPFS *)session clientDB];
  uint64_t v5 = [v4 dbRowID];

  objc_msgSend(v6, "execute:", @"DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d", v5, 2);
}

- (unint64_t)recoverAndReportMissingJobs
{
  return 0;
}

- (void)deviceAndEditorNamesOfItem:(id)a3 etag:(id)a4 downloadKind:(int)a5 lastEditorDeviceName:(id *)a6 lastModifiedNameComponents:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  session = self->super.super._session;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(BRCAccountSessionFPFS *)session clientDB];
  uint64_t v16 = [v14 dbRowID];

  id v22 = (id)[v15 fetch:@"SELECT transfer_record  FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@", v16, v9, v13];
  if ([v22 next])
  {
    id v17 = [v22 unarchivedObjectOfClass:objc_opt_class() atIndex:0];
    char v18 = objc_msgSend(v17, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", self->super.super._session);
    if (a6)
    {
      if (v18)
      {
        objc_msgSend(v17, "brc_lastEditorDeviceName");
        id v19 = objc_claimAutoreleasedReturnValue();
        *a6 = v19;
        goto LABEL_11;
      }
      *a6 = 0;
    }
    if (a7) {
      char v20 = v18;
    }
    else {
      char v20 = 1;
    }
    if (v20) {
      goto LABEL_12;
    }
    id v19 = [(BRCAccountSessionFPFS *)self->super.super._session cachedCurrentUserRecordName];
    id v21 = (id)objc_msgSend(v17, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v19, a7);
LABEL_11:

LABEL_12:
  }
}

- (BRCDeadlineScheduler)downloadsDeadlineScheduler
{
  return self->_downloadsDeadlineScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsDeadlineScheduler, 0);
  objc_storeStrong((id *)&self->_willRetryOperationProgress, 0);
  objc_storeStrong((id *)&self->_lastDownloadRefresh, 0);
  objc_storeStrong((id *)&self->_fairScheduler, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_pendingOperationProgress, 0);
}

void __25__BRCFSDownloader_resume__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Resuming downloader on FPFS, clearing the client downloads table%@", v2, v3, v4, v5, v6);
}

- (void)_createDownloadingJobForItem:(os_log_t)log state:kind:etag:stageFileName:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = 136315906;
  uint64_t v4 = "-[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:stageFileName:error:]";
  __int16 v5 = 2080;
  uint8_t v6 = "(passed to caller)";
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_23FA42000, log, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v3, 0x2Au);
}

- (void)_finishedDownload:syncContext:operationID:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![[BRCAccountsManager sharedManager] isInSyncBubble]%@", v2, v3, v4, v5, v6);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_211_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] We failed downloading a conflict loser so kicking the apply scheduler in case it was blocked for download%@", v2, v3, v4, v5, v6);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_211_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] The error is for an unknown item, check if the zone hasn't been wiped%@", v2, v3, v4, v5, v6);
}

- (void)rescheduleJobsPendingWinnerForItem:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Downloader: scheduling %lld suspended throttles%@");
}

- (void)_getCancelErrorFromCancelReason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: New cancel reasons should be mapped to errors%@", v2, v3, v4, v5, v6);
}

- (void)cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: kind == BRCDownloadKindContent || kind == BRCDownloadKindSpeculative%@", v2, v3, v4, v5, v6);
}

- (void)cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: etag == nil%@", v2, v3, v4, v5, v6);
}

- (void)scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] no need to schedule anything, we're already actively downloading that same etag%@", v2, v3, v4, v5, v6);
}

- (void)performFirstSchedulingAfterStartupInDB:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 changes];
  OUTLINED_FUNCTION_3();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Rescheduled %lld in-flight transfers because we have restarted%@", v5, 0x16u);
}

@end