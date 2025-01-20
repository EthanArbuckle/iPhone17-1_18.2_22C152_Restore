@interface BRCSyncUpScheduler
- (BOOL)isItemInSyncUpAndInFlight:(id)a3;
- (BOOL)isItemInSyncUpAndInFlight:(id)a3 inZone:(id)a4;
- (BOOL)isItemPendingSyncUp:(id)a3;
- (BRCSyncUpScheduler)initWithAccountSession:(id)a3;
- (id)descriptionForItem:(id)a3 context:(id)a4;
- (unint64_t)finishSyncUpForItem:(id)a3 inZone:(id)a4 success:(BOOL)a5;
- (unint64_t)inFlightDiffsForItem:(id)a3;
- (unint64_t)inFlightDiffsForItem:(id)a3 zoneRowID:(id)a4;
- (unint64_t)postponeSyncUpCallback:(id)a3 inZone:(id)a4;
- (unint64_t)recoverAndReportMissingJobs;
- (void)_clearSyncUpErrorForItem:(id)a3;
- (void)_scheduleSyncUpJob:(id)a3;
- (void)_scheduleSyncUpJobForZoneWithRowID:(id)a3;
- (void)blockSyncUpCallback:(id)a3 inZone:(id)a4;
- (void)createSyncUpJobForItem:(id)a3 inZone:(id)a4;
- (void)createSyncUpJobForRowID:(unint64_t)a3 inZone:(id)a4;
- (void)prepareItemForSyncUp:(id)a3 inFlightDiffs:(unint64_t)a4 inZone:(id)a5;
- (void)recoverAndReportMissingJobs;
- (void)schedule;
- (void)setState:(int)a3 forItem:(id)a4 zone:(id)a5;
@end

@implementation BRCSyncUpScheduler

- (BRCSyncUpScheduler)initWithAccountSession:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRCSyncUpScheduler;
  return [(BRCFSSchedulerBase *)&v4 initWithSession:a3 name:@"Sync-Up" tableName:@"client_sync_up"];
}

- (id)descriptionForItem:(id)a3 context:(id)a4
{
  v6 = (void *)MEMORY[0x263F8C720];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v6, "rawInjection:length:", "in_flight_diffs, zone_rowid", 27);
  v12.receiver = self;
  v12.super_class = (Class)BRCSyncUpScheduler;
  v10 = [(BRCFSSchedulerBase *)&v12 descriptionForJobsMatching:v8 ordering:0 additionalColumns:v9 additionalValuesHandler:&__block_literal_global_45 context:v7];

  return v10;
}

void __49__BRCSyncUpScheduler_descriptionForItem_context___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 unsignedLongLongAtIndex:a4];
  id v8 = [v6 numberAtIndex:(a4 + 1)];

  [v10 appendFormat:@"zone:%@", v8];
  if (v7)
  {
    v9 = BRCItemFieldsPrettyPrint();
    [v10 appendFormat:@" in-flight{%@}", v9];
  }
}

- (void)createSyncUpJobForItem:(id)a3 inZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_msgSend(v7, "br_isEqualToNumber:", &unk_26F3DD490) & 1) == 0)
  {
    id v8 = [(BRCAccountSessionFPFS *)self->super._session serverZoneByRowID:v7];
    v9 = [v8 clientZone];

    if ([v9 isSyncBlockedBecauseAppNotInstalled])
    {
      id v10 = [v6 itemID];
      char v11 = [v10 isDocumentsFolder];

      if ((v11 & 1) == 0)
      {
        objc_super v12 = brc_bread_crumbs();
        v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[BRCSyncUpScheduler createSyncUpJobForItem:inZone:]();
        }

        [v9 clearStateBits:4096];
      }
    }
  }
  -[BRCSyncUpScheduler createSyncUpJobForRowID:inZone:](self, "createSyncUpJobForRowID:inZone:", [v6 dbRowID], v7);
}

- (void)createSyncUpJobForRowID:(unint64_t)a3 inZone:(id)a4
{
  id v6 = a4;
  v13 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:a3 zoneRowID:v6];

  id v7 = [(BRCAccountSessionFPFS *)self->super._session syncContextProvider];
  id v8 = [v7 defaultSyncContext];
  v9 = [v8 uploadThrottle];
  id v10 = [MEMORY[0x263F8C710] formatInjection:@"in_flight_diffs = NULL"];
  [(BRCFSSchedulerBase *)self insertOrUpdateJobID:v13 throttle:v9 withState:1 insertedSQLColumn:0 insertedSQLValues:0 updatedSQLValues:v10 error:0];
  uint64_t v12 = v11;

  if (v12 <= brc_current_date_nsec()) {
    [(BRCSyncUpScheduler *)self _scheduleSyncUpJob:v13];
  }
}

- (void)prepareItemForSyncUp:(id)a3 inFlightDiffs:(unint64_t)a4 inZone:(id)a5
{
  id v8 = a5;
  session = self->super._session;
  id v10 = a3;
  uint64_t v11 = [(BRCAccountSessionFPFS *)session clientDB];
  uint64_t v12 = [(BRCFSSchedulerBase *)self tableName];
  uint64_t v13 = [v10 dbRowID];

  id v16 = v8;
  v14 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v13 zoneRowID:v16];

  v15 = [(BRCIntAndZoneJobIdentifier *)v14 matchingJobsWhereSQLClause];
  [v11 execute:@"UPDATE %@SET in_flight_diffs = %lldWHERE %@", v12, a4, v15];
}

- (void)_clearSyncUpErrorForItem:(id)a3
{
  session = self->super._session;
  id v4 = a3;
  id v6 = [(BRCAccountSessionFPFS *)session clientDB];
  uint64_t v5 = [v4 dbRowID];

  objc_msgSend(v6, "execute:", @"DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d", v5, 3);
}

- (unint64_t)finishSyncUpForItem:(id)a3 inZone:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v5) {
    [(BRCSyncUpScheduler *)self _clearSyncUpErrorForItem:v8];
  }
  id v10 = [(BRCAccountSessionFPFS *)self->super._session clientDB];
  char v11 = [v10 isBatchSuspended];

  if ((v11 & 1) == 0)
  {
    v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpScheduler finishSyncUpForItem:inZone:success:]();
    }
  }
  if (!v9)
  {
    v30 = brc_bread_crumbs();
    v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpScheduler finishSyncUpForItem:inZone:success:]();
    }
  }
  memset(v32, 0, sizeof(v32));
  __brc_create_section(0, (uint64_t)"-[BRCSyncUpScheduler finishSyncUpForItem:inZone:success:]", 129, v32);
  uint64_t v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = v32[0];
    v26 = [(BRCFSSchedulerBase *)self name];
    v27 = [v8 jobsDescription];
    *(_DWORD *)buf = 134218754;
    uint64_t v34 = v25;
    __int16 v35 = 2112;
    v36 = v26;
    __int16 v37 = 2112;
    v38 = v27;
    __int16 v39 = 2112;
    v40 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@[%@]: finishing sync up%@", buf, 0x2Au);
  }
  unint64_t v14 = [(BRCSyncUpScheduler *)self inFlightDiffsForItem:v8 zoneRowID:v9];
  uint64_t v15 = [v8 dbRowID];
  id v16 = v9;
  v17 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v15 zoneRowID:v16];

  if ([(BRCFSSchedulerBase *)self setState:0 forJobID:v17]
    && [v8 isDocument])
  {
    v18 = [v8 clientZone];
    v19 = [v18 dbRowID];
    int v20 = objc_msgSend(v19, "br_isEqualToNumber:", v16);

    if (v20)
    {
      v21 = [v8 asDocument];
      if (v5 || ([v8 needsSyncUp] & 1) == 0)
      {
        v22 = [(BRCAccountSessionFPFS *)self->super._session fsUploader];
        [v22 cancelAndCleanupItemUpload:v21];
      }
      if ([v8 needsUpload])
      {
        v23 = [(BRCAccountSessionFPFS *)self->super._session fsUploader];
        [v23 uploadItem:v21];
      }
      goto LABEL_17;
    }
    if ([v8 needsUpload])
    {
      v21 = [(BRCAccountSessionFPFS *)self->super._session fsUploader];
      [v21 rescheduleSuspendedJobsMatching:v8 inState:31];
LABEL_17:
    }
  }

  __brc_leave_section(v32);
  return v14;
}

- (BOOL)isItemInSyncUpAndInFlight:(id)a3
{
  return [(BRCSyncUpScheduler *)self inFlightDiffsForItem:a3] != 0;
}

- (BOOL)isItemInSyncUpAndInFlight:(id)a3 inZone:(id)a4
{
  return [(BRCSyncUpScheduler *)self inFlightDiffsForItem:a3 zoneRowID:a4] != 0;
}

- (unint64_t)inFlightDiffsForItem:(id)a3 zoneRowID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 dbRowID];
  id v9 = v6;
  id v10 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v8 zoneRowID:v9];

  char v11 = [v7 db];

  uint64_t v12 = [(BRCFSSchedulerBase *)self tableName];
  uint64_t v13 = [(BRCIntAndZoneJobIdentifier *)v10 matchingJobsWhereSQLClause];
  unint64_t v14 = (void *)[v11 numberWithSQL:@"SELECT in_flight_diffs FROM %@WHERE %@ AND throttle_state != 0", v12, v13];

  unint64_t v15 = [v14 unsignedLongLongValue];
  return v15;
}

- (unint64_t)inFlightDiffsForItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 db];
  id v6 = [(BRCFSSchedulerBase *)self tableName];
  id v7 = [v4 matchingJobsWhereSQLClause];
  uint64_t v8 = (void *)[v5 fetch:@"SELECT in_flight_diffs FROM %@WHERE %@ AND throttle_state != 0", v6, v7];
  id v9 = [v8 enumerateObjectsOfClass:objc_opt_class()];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v10);
        }
        v13 |= [*(id *)(*((void *)&v17 + 1) + 8 * i) unsignedLongLongValue];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)isItemPendingSyncUp:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 db];
  id v6 = [(BRCFSSchedulerBase *)self tableName];
  id v7 = [v4 matchingJobsWhereSQLClause];

  uint64_t v8 = (void *)[v5 numberWithSQL:@"SELECT COUNT(*) FROM %@WHERE %@ AND throttle_state != 0", v6, v7];
  LOBYTE(v6) = [v8 BOOLValue];

  return (char)v6;
}

- (void)setState:(int)a3 forItem:(id)a4 zone:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v12 = a4;
  id v8 = a5;
  if ([v12 dbRowID] || (objc_msgSend(v12, "isZoneRoot") & 1) == 0)
  {
    uint64_t v9 = [v12 dbRowID];
    id v10 = v8;
    uint64_t v11 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v9 zoneRowID:v10];

    [(BRCFSSchedulerBase *)self setState:v6 forJobID:v11];
  }
}

- (void)_scheduleSyncUpJobForZoneWithRowID:(id)a3
{
  id v8 = a3;
  int v4 = objc_msgSend(v8, "br_isEqualToNumber:", &unk_26F3DD490);
  session = self->super._session;
  if (v4)
  {
    uint64_t v6 = [(BRCAccountSessionFPFS *)session containerScheduler];
    [v6 scheduleSyncUpForSideCar];
  }
  else
  {
    uint64_t v6 = [(BRCAccountSessionFPFS *)session serverZoneByRowID:v8];
    id v7 = [v6 clientZone];
    [v7 scheduleSyncUp];
  }
}

- (void)_scheduleSyncUpJob:(id)a3
{
  id v4 = a3;
  BOOL v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncUpScheduler _scheduleSyncUpJob:]();
  }

  [(BRCFSSchedulerBase *)self setState:50 forJobID:v4];
  id v7 = [v4 zoneRowID];
  [(BRCSyncUpScheduler *)self _scheduleSyncUpJobForZoneWithRowID:v7];
}

- (unint64_t)recoverAndReportMissingJobs
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [(BRCAccountSessionFPFS *)self->super._session clientDB];
  id v4 = (void *)[v3 fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation FROM client_items AS ci WHERE ci.item_localsyncupstate = 4 AND ci.item_localsyncupstate != 0 AND NOT EXISTS (SELECT 1 FROM client_sync_up AS su WHERE ci.rowid = su.throttle_id AND su.throttle_state != 0)"];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __49__BRCSyncUpScheduler_recoverAndReportMissingJobs__block_invoke;
  v28[3] = &unk_26507F1E8;
  v28[4] = self;
  BOOL v5 = [v4 enumerateObjects:v28];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v25 = v4;
    uint64_t v26 = 8;
    LODWORD(v8) = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      int v27 = v8;
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x2455D97F0]();
        unint64_t v13 = [v11 clientZone];
        uint64_t v14 = [v13 dbRowID];
        [(BRCSyncUpScheduler *)self createSyncUpJobForItem:v11 inZone:v14];

        if ([v11 isSharedToMeChildItem])
        {
          [(BRCSyncUpScheduler *)self createSyncUpJobForItem:v11 inZone:&unk_26F3DD490];
        }
        else if ([v11 isSharedToMeTopLevelItem])
        {
          unint64_t v15 = [v11 parentClientZone];
          id v16 = [v15 dbRowID];
          [(BRCSyncUpScheduler *)self createSyncUpJobForItem:v11 inZone:v16];
        }
      }
      uint64_t v8 = (v27 + v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);

    long long v17 = brc_bread_crumbs();
    long long v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      [(BRCSyncUpScheduler *)(uint64_t)v17 recoverAndReportMissingJobs];
    }

    [(BRCSyncUpScheduler *)self schedule];
    id v4 = v25;
  }
  else
  {

    uint64_t v8 = 0;
  }
  long long v19 = [(BRCAccountSessionFPFS *)self->super._session clientDB];
  long long v20 = (void *)[v19 fetch:@"SELECT DISTINCT su.zone_rowid FROM client_sync_up AS su  INNER JOIN client_items AS li ON su.throttle_id = li.rowid  WHERE su.throttle_state = 50       AND su.throttle_state != 0       AND li.item_localsyncupstate = 4       AND li.item_min_supported_os_rowid IS NULL       AND NOT item_id_is_documents(li.item_id)"];

  if ([v20 next])
  {
    do
    {
      v21 = [v20 numberAtIndex:0];
      [(BRCSyncUpScheduler *)self _scheduleSyncUpJobForZoneWithRowID:v21];
    }
    while (([v20 next] & 1) != 0);
  }
  id v22 = +[AppTelemetryTimeSeriesEvent newMissingSyncUpJobEventWithNumberMissing:v8];
  v23 = [(BRCAccountSessionFPFS *)self->super._session analyticsReporter];
  [v23 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v22];

  return (int)v8;
}

id __49__BRCSyncUpScheduler_recoverAndReportMissingJobs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (void)schedule
{
  v3 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v4 = [v3 maxRecordCountInModifyRecordsOperation];

  id v5 = objc_msgSend(MEMORY[0x263F8C720], "rawInjection:length:", "throttle_id, zone_rowid", 23);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__BRCSyncUpScheduler_schedule__block_invoke;
  v6[3] = &unk_265081580;
  v6[4] = self;
  [(BRCFSSchedulerBase *)self scheduleWithBatchSize:v4 whereSQLClause:0 columns:v5 actionHandler:v6];
}

void __30__BRCSyncUpScheduler_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 longLongAtIndex:a3];
  id v9 = [v5 numberAtIndex:(a3 + 1)];

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v6 zoneRowID:v9];
  [v7 _scheduleSyncUpJob:v8];
}

- (unint64_t)postponeSyncUpCallback:(id)a3 inZone:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dbRowID];
  id v8 = v6;
  id v9 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v7 zoneRowID:v8];

  uint64_t v10 = [v8 longLongValue];
  session = self->super._session;
  if (v10 <= 0)
  {
    id v12 = [(BRCAccountSessionFPFS *)session syncContextProvider];
    [v12 defaultSyncContext];
  }
  else
  {
    id v12 = [(BRCAccountSessionFPFS *)session serverZoneByRowID:v8];
    [v12 metadataSyncContext];
  unint64_t v13 = };

  uint64_t v14 = [v13 perItemSyncUpThrottle];
  unint64_t v15 = [(BRCFSSchedulerBase *)self postponeJobID:v9 withThrottle:v14];

  return v15;
}

- (void)blockSyncUpCallback:(id)a3 inZone:(id)a4
{
}

- (void)createSyncUpJobForItem:inZone:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Clearing app sync blocked bit because we created an item that needs sync%@", v1, 0xCu);
}

- (void)finishSyncUpForItem:inZone:success:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: zoneRowID%@", v1, 0xCu);
}

- (void)finishSyncUpForItem:inZone:success:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _session.clientDB.isBatchSuspended%@", v1, 0xCu);
}

- (void)_scheduleSyncUpJob:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_23FA42000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync-Up[%@]: Scheduling a sync-up job%@", v2, 0x16u);
}

- (void)recoverAndReportMissingJobs
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync-Up: Recovered from %u missing sync up jobs%@", (uint8_t *)v3, 0x12u);
}

@end