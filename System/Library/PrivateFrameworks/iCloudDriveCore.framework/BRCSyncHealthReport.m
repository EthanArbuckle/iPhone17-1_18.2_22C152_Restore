@interface BRCSyncHealthReport
- (BRCSyncHealthReport)init;
- (NSArray)aggregatedEvents;
- (NSArray)telemetryErrorEvents;
- (NSArray)telemetryOtherEvents;
- (NSDictionary)syncDownErrorsByMangledID;
- (NSDictionary)syncUpErrorsByMangledID;
- (NSSet)downloadFailures;
- (NSSet)syncUpFailures;
- (NSSet)uploadFailures;
- (NSString)dsid;
- (NSString)rampNumber;
- (id)_injectionForAnalyticsServiceCode:(int)a3;
- (id)getRampNumberForSession:(id)a3;
- (unint64_t)blockedZonesCount;
- (unint64_t)clientTruthDirFaultCount;
- (unint64_t)clientTruthTotalItemsCount;
- (unint64_t)serverTruthDirCount;
- (unint64_t)serverTruthDirFaultCount;
- (unint64_t)serverTruthTotalItemsCount;
- (unint64_t)timeSinceLogin;
- (unint64_t)totalZoneCount;
- (unint64_t)zonesNeverFullSync;
- (void)_collectAggregatedTelemetryForSession:(id)a3;
- (void)_fillTransferFailure:(id)a3 withRowID:(unint64_t)a4 atDate:(id)a5 session:(id)a6;
- (void)dumpAggregatedEvents:(id)a3;
- (void)generateReportWithSession:(id)a3;
- (void)syncErrors:(id)a3;
@end

@implementation BRCSyncHealthReport

- (BRCSyncHealthReport)init
{
  v16.receiver = self;
  v16.super_class = (Class)BRCSyncHealthReport;
  v2 = [(BRCSyncHealthReport *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncUpErrorsByMangledID = v2->_syncUpErrorsByMangledID;
    v2->_syncUpErrorsByMangledID = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    syncDownErrorsByMangledID = v2->_syncDownErrorsByMangledID;
    v2->_syncDownErrorsByMangledID = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    syncUpFailures = v2->_syncUpFailures;
    v2->_syncUpFailures = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    uploadFailures = v2->_uploadFailures;
    v2->_uploadFailures = (NSMutableSet *)v9;

    uint64_t v11 = objc_opt_new();
    downloadFailures = v2->_downloadFailures;
    v2->_downloadFailures = (NSMutableSet *)v11;

    uint64_t v13 = objc_opt_new();
    aggregatedEvents = v2->_aggregatedEvents;
    v2->_aggregatedEvents = (NSMutableArray *)v13;
  }
  return v2;
}

- (id)getRampNumberForSession:(id)a3
{
  uint64_t v3 = +[BRCUserDefaults rampNumberWithSession:a3];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", v3);
}

- (void)_fillTransferFailure:(id)a3 withRowID:(unint64_t)a4 atDate:(id)a5 session:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = [v11 clientDB];
  v14 = (void *)[v13 fetch:@"SELECT ci.zone_rowid, IFNULL(si.pcs_state, 0) FROM client_items AS ci LEFT JOIN server_items AS si ON ci.item_id = si.item_id AND ci.zone_rowid = si.zone_rowid WHERE ci.rowid = %lld", a4];

  if ([v14 next])
  {
    v15 = [v14 numberAtIndex:0];
    uint64_t v16 = [v14 intAtIndex:1];
    v17 = [v11 serverZoneByRowID:v15];
    v18 = [v17 clientZone];

    objc_msgSend(v12, "encounteredErrorWithPCSState:enhancedDrivePrivacyEnabled:privateDB:atDate:", v16, objc_msgSend(v18, "enhancedDrivePrivacyEnabled"), objc_msgSend(v18, "isSharedZone") ^ 1, v10);
  }
  else
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v23 = [v14 error];
      v24 = v23;
      if (!v23)
      {
        v6 = [v11 clientDB];
        v24 = [v6 lastError];
      }
      *(_DWORD *)buf = 134218498;
      unint64_t v26 = a4;
      __int16 v27 = 2112;
      v28 = v24;
      __int16 v29 = 2112;
      v30 = v19;
      _os_log_fault_impl(&dword_23FA42000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to compute the pcs chain status and zone rowid for item row %lld - %@%@", buf, 0x20u);
      if (!v23)
      {
      }
    }

    v15 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v21 = [v15 supportsEnhancedDrivePrivacy];
    v22 = [MEMORY[0x263EFF910] distantPast];
    [v12 encounteredErrorWithPCSState:0 enhancedDrivePrivacyEnabled:v21 privateDB:1 atDate:v22];
  }
}

- (id)_injectionForAnalyticsServiceCode:(int)a3
{
  if (a3 == 3)
  {
    v4 = (void *)MEMORY[0x263F8C720];
    uint64_t v5 = "AND item_localsyncupstate = 4";
    goto LABEL_6;
  }
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      v4 = (void *)MEMORY[0x263F8C720];
      uint64_t v5 = "AND item_localsyncupstate = 3";
LABEL_6:
      uint64_t v6 = 29;
      goto LABEL_11;
    }
    uint64_t v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      [(BRCSyncHealthReport *)(uint64_t)v7 _injectionForAnalyticsServiceCode:v8];
    }
  }
  v4 = (void *)MEMORY[0x263F8C720];
  uint64_t v5 = "";
  uint64_t v6 = 0;
LABEL_11:
  uint64_t v9 = [v4 rawInjection:v5 length:v6];
  return v9;
}

- (void)_collectAggregatedTelemetryForSession:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__BRCSyncHealthReport__collectAggregatedTelemetryForSession___block_invoke;
  v5[3] = &unk_26507F940;
  v5[4] = self;
  id v3 = a3;
  +[BRCAnalyticsReporter _enumerateAggregatedTelemetryForSession:v3 withBlock:v5];
  v4 = [v3 clientDB];

  [v4 execute:@"DELETE FROM aggregated_daily_telemetry"];
}

uint64_t __61__BRCSyncHealthReport__collectAggregatedTelemetryForSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:a2];
}

- (void)generateReportWithSession:(id)a3
{
  uint64_t v181 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v174 = v4;
  if (self->_totalZoneCount)
  {
    v156 = brc_bread_crumbs();
    v157 = brc_default_log();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncHealthReport generateReportWithSession:]();
    }
  }
  uint64_t v5 = [v4 clientDB];
  [v5 assertOnQueue];

  v178[0] = MEMORY[0x263EF8330];
  v178[1] = 3221225472;
  v178[2] = __49__BRCSyncHealthReport_generateReportWithSession___block_invoke;
  v178[3] = &unk_26507FAC8;
  v178[4] = self;
  [v4 enumerateClientZones:v178];
  self->_totalZoneCount += 4;
  uint64_t v6 = [v4 containerScheduler];
  uint64_t v7 = [v6 internalZoneSyncDownAnalyticsErrors];
  v177[0] = MEMORY[0x263EF8330];
  v177[1] = 3221225472;
  v177[2] = __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_2;
  v177[3] = &unk_26507FAF0;
  v177[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v177];

  v8 = [v4 containerScheduler];
  uint64_t v9 = [v8 internalZoneSyncUpAnalyticsErrors];
  v176[0] = MEMORY[0x263EF8330];
  v176[1] = 3221225472;
  v176[2] = __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_3;
  v176[3] = &unk_26507FAF0;
  v176[4] = self;
  [v9 enumerateKeysAndObjectsUsingBlock:v176];

  id v10 = objc_alloc_init(MEMORY[0x263F08790]);
  id v11 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v10 setLocale:v11];

  [v10 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v12 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  v161 = v10;
  [v10 setTimeZone:v12];

  uint64_t v13 = [v4 clientDB];
  v14 = (void *)[v13 fetch:@"SELECT error_domain, error_code, error_message, error_timestamp, underlying_error_domain, underlying_error_code, service, item_rowid FROM item_errors"];

  if ([v14 next])
  {
    uint64_t v160 = *MEMORY[0x263EFD4A8];
    uint64_t v159 = *MEMORY[0x263F08608];
    while (1)
    {
      uint64_t v166 = MEMORY[0x2455D97F0]();
      context = [v14 stringAtIndex:0];
      uint64_t v15 = [v14 longLongAtIndex:1];
      uint64_t v16 = [v14 stringAtIndex:2];
      v169 = [v14 stringAtIndex:3];
      v167 = [v14 stringAtIndex:4];
      uint64_t v17 = [v14 longLongAtIndex:5];
      uint64_t v18 = [v14 intAtIndex:6];
      uint64_t v19 = [v14 longLongAtIndex:7];
      uint64_t v20 = [(BRCSyncHealthReport *)self _injectionForAnalyticsServiceCode:v18];
      uint64_t v21 = [v174 clientDB];
      v164 = (void *)v20;
      v22 = (void *)[v21 numberWithSQL:@"SELECT 1 FROM client_items WHERE rowid = %llu %@", v19, v20];

      if ([v22 BOOLValue]) {
        break;
      }
      v24 = [v174 clientDB];
      objc_msgSend(v24, "execute:", @"DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d", v19, v18);
      __int16 v29 = (void *)v166;
LABEL_36:

      if (([v14 next] & 1) == 0) {
        goto LABEL_37;
      }
    }
    v23 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    v24 = v23;
    if (v16) {
      [v23 setObject:v16 forKeyedSubscript:v160];
    }
    v162 = v16;
    if ([v167 length])
    {
      v25 = [MEMORY[0x263F087E8] errorWithDomain:v167 code:v17 userInfo:0];
      [v24 setObject:v25 forKeyedSubscript:v159];
    }
    id v26 = objc_alloc(MEMORY[0x263F087E8]);
    if ([v24 count]) {
      __int16 v27 = v24;
    }
    else {
      __int16 v27 = 0;
    }
    v28 = (void *)[v26 initWithDomain:context code:v15 userInfo:v27];
    if ([v169 length]) {
      [v161 dateFromString:v169];
    }
    else {
    v30 = [MEMORY[0x263EFF910] distantPast];
    }
    uint64_t v31 = [[BRCTransferFailureReport alloc] initWithError:v28];
    switch(v18)
    {
      case 3:
        uint64_t v40 = [(NSMutableSet *)self->_syncUpFailures member:v31];
        v41 = (void *)v40;
        if (v40) {
          v42 = (void *)v40;
        }
        else {
          v42 = v31;
        }
        v35 = v42;

        syncUpFailures = self->_syncUpFailures;
        break;
      case 2:
        uint64_t v37 = [(NSMutableSet *)self->_downloadFailures member:v31];
        v38 = (void *)v37;
        if (v37) {
          v39 = (void *)v37;
        }
        else {
          v39 = v31;
        }
        v35 = v39;

        syncUpFailures = self->_downloadFailures;
        break;
      case 1:
        uint64_t v32 = [(NSMutableSet *)self->_uploadFailures member:v31];
        v33 = (void *)v32;
        if (v32) {
          v34 = (void *)v32;
        }
        else {
          v34 = v31;
        }
        v35 = v34;

        syncUpFailures = self->_uploadFailures;
        break;
      default:
        v158 = brc_bread_crumbs();
        v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v180 = v18;
          *(_WORD *)&v180[4] = 2112;
          *(void *)&v180[6] = v158;
          _os_log_fault_impl(&dword_23FA42000, v43, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No service with code %d%@", buf, 0x12u);
        }

        goto LABEL_35;
    }
    [(NSMutableSet *)syncUpFailures addObject:v35];
    uint64_t v31 = v35;
LABEL_35:
    [(BRCSyncHealthReport *)self _fillTransferFailure:v31 withRowID:v19 atDate:v30 session:v174];

    __int16 v29 = (void *)v166;
    uint64_t v16 = v162;
    goto LABEL_36;
  }
LABEL_37:
  v165 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v44 = [v165 delayForStuckThrottle];
  uint64_t v163 = brc_current_date_nsec();
  uint64_t v45 = v163 - v44;
  v46 = [v174 clientDB];
  uint64_t v170 = v45;
  v47 = (void *)[v46 fetch:@"SELECT cd.throttle_id, cd.last_try_stamp FROM client_downloads AS cd INNER JOIN client_items AS li ON cd.throttle_id = li.rowid WHERE cd.last_try_stamp > 0 AND cd.last_try_stamp < %lld AND cd.retry_count = 0 AND cd.throttle_state = 1 AND cd.transfer_queue != '_done' AND li.item_state IN (0) AND li.item_localsyncupstate = 0", v45];

  if ([v47 next])
  {
    uint64_t v48 = *MEMORY[0x263F32360];
    do
    {
      v49 = (void *)MEMORY[0x2455D97F0]();
      uint64_t v50 = [v47 longLongAtIndex:0];
      [v47 doubleAtIndex:1];
      v52 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v51 / 1000000000.0];
      v53 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v48 code:47 userInfo:0];
      v54 = brc_bread_crumbs();
      v55 = brc_default_log();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)v180 = v50;
        *(_WORD *)&v180[8] = 2112;
        *(void *)&v180[10] = v54;
        _os_log_impl(&dword_23FA42000, v55, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item not scheduled for download%@", buf, 0x16u);
      }

      v56 = [[BRCTransferFailureReport alloc] initWithError:v53];
      uint64_t v57 = [(NSMutableSet *)self->_downloadFailures member:v56];
      v58 = (void *)v57;
      if (v57) {
        v59 = (void *)v57;
      }
      else {
        v59 = v56;
      }
      id v60 = v59;

      [(NSMutableSet *)self->_downloadFailures addObject:v60];
      [(BRCSyncHealthReport *)self _fillTransferFailure:v60 withRowID:v50 atDate:v52 session:v174];
    }
    while (([v47 next] & 1) != 0);
  }
  v61 = [v174 clientDB];
  v62 = (void *)[v61 fetch:@"SELECT COUNT(item_id), item_depth FROM server_items WHERE item_depth < 0 GROUP BY item_depth"];

  v168 = v62;
  if ([v62 next])
  {
    uint64_t v63 = *MEMORY[0x263F32360];
    do
    {
      v64 = (void *)MEMORY[0x2455D97F0]();
      uint64_t v65 = [v62 unsignedLongLongAtIndex:0];
      unsigned int v66 = [v62 intAtIndex:1];
      if (v66 <= 0xFFFFFFFA)
      {
        v67 = brc_bread_crumbs();
        v72 = brc_default_log();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v180 = v66;
          *(_WORD *)&v180[4] = 2112;
          *(void *)&v180[6] = v67;
          _os_log_fault_impl(&dword_23FA42000, v72, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Got unexpected item depth: %d%@", buf, 0x12u);
        }
      }
      else
      {
        v67 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v63 code:74 - (v66 + 5) userInfo:0];
        v68 = [[BRCTransferFailureReport alloc] initWithError:v67];
        uint64_t v69 = [(NSMutableSet *)self->_downloadFailures member:v68];
        v70 = (void *)v69;
        if (v69) {
          v71 = (void *)v69;
        }
        else {
          v71 = v68;
        }
        v72 = v71;

        v62 = v168;
        [v72 encounteredErrors:v65 atDate:0];
      }
    }
    while (([v62 next] & 1) != 0);
  }
  v73 = [v174 clientDB];
  v74 = (void *)[v73 fetch:@"SELECT cu.throttle_id, cu.last_try_stamp FROM client_uploads AS cu INNER JOIN client_items AS li ON cu.throttle_id = li.rowid WHERE cu.last_try_stamp > 0 AND cu.last_try_stamp < %lld AND cu.retry_count = 0 AND cu.throttle_state = 1 AND cu.transfer_queue != '_done' AND li.item_state IN (0) AND li.item_localsyncupstate = 3", v170];

  if ([v74 next])
  {
    uint64_t v75 = *MEMORY[0x263F32360];
    do
    {
      v76 = (void *)MEMORY[0x2455D97F0]();
      uint64_t v77 = [v74 longLongAtIndex:0];
      [v74 doubleAtIndex:1];
      v79 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v78 / 1000000000.0];
      v80 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v75 code:49 userInfo:0];
      v81 = brc_bread_crumbs();
      v82 = brc_default_log();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)v180 = v77;
        *(_WORD *)&v180[8] = 2112;
        *(void *)&v180[10] = v81;
        _os_log_impl(&dword_23FA42000, v82, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item not scheduled for upload%@", buf, 0x16u);
      }

      v83 = [[BRCTransferFailureReport alloc] initWithError:v80];
      uint64_t v84 = [(NSMutableSet *)self->_uploadFailures member:v83];
      v85 = (void *)v84;
      if (v84) {
        v86 = (void *)v84;
      }
      else {
        v86 = v83;
      }
      id v87 = v86;

      [(NSMutableSet *)self->_uploadFailures addObject:v87];
      [(BRCSyncHealthReport *)self _fillTransferFailure:v87 withRowID:v77 atDate:v79 session:v174];
    }
    while (([v74 next] & 1) != 0);
  }
  v88 = [v174 clientDB];
  v89 = (void *)[v88 fetch:@"SELECT csu.throttle_id, csu.last_try_stamp, li.zone_rowid FROM client_sync_up AS csu INNER JOIN client_items AS li ON csu.throttle_id = li.rowid WHERE csu.last_try_stamp > 0 AND csu.last_try_stamp < %lld AND csu.retry_count = 0 AND csu.throttle_state IN (1,50) AND NOT item_id_is_documents(li.item_id) AND li.item_localsyncupstate = 4", v170];

  v90 = v174;
  if ([v89 next])
  {
    uint64_t v171 = *MEMORY[0x263F32360];
    do
    {
      contexta = (void *)MEMORY[0x2455D97F0]();
      uint64_t v91 = [v89 longLongAtIndex:0];
      [v89 doubleAtIndex:1];
      v93 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v92 / 1000000000.0];
      v94 = brc_bread_crumbs();
      v95 = brc_default_log();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)v180 = v91;
        *(_WORD *)&v180[8] = 2112;
        *(void *)&v180[10] = v94;
        _os_log_impl(&dword_23FA42000, v95, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item not scheduled for sync up%@", buf, 0x16u);
      }

      v96 = [v89 numberAtIndex:2];
      v97 = [v90 serverZoneByRowID:v96];
      v98 = [v97 clientZone];

      if ([v98 isSyncBlocked]) {
        uint64_t v99 = 36;
      }
      else {
        uint64_t v99 = 51;
      }
      v100 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v171 code:v99 userInfo:0];
      if ([v98 isSyncBlockedBecauseAppNotInstalled])
      {
        v101 = brc_bread_crumbs();
        v102 = brc_default_log();
        if (os_log_type_enabled(v102, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v180 = v98;
          *(_WORD *)&v180[8] = 2112;
          *(void *)&v180[10] = v101;
          _os_log_error_impl(&dword_23FA42000, v102, (os_log_type_t)0x90u, "[ERROR] Zone %@ has items which need sync. Clearing app sync blocked%@", buf, 0x16u);
        }

        [v98 clearStateBits:4096];
        [v98 scheduleSyncUp];
      }
      v103 = [[BRCTransferFailureReport alloc] initWithError:v100];
      uint64_t v104 = [(NSMutableSet *)self->_syncUpFailures member:v103];
      v105 = (void *)v104;
      if (v104) {
        v106 = (void *)v104;
      }
      else {
        v106 = v103;
      }
      id v107 = v106;

      [(NSMutableSet *)self->_syncUpFailures addObject:v107];
      v90 = v174;
      [(BRCSyncHealthReport *)self _fillTransferFailure:v107 withRowID:v91 atDate:v93 session:v174];
    }
    while (([v89 next] & 1) != 0);
  }
  v108 = [v90 clientDB];
  v109 = (void *)[v108 fetch:@"SELECT ci.rowid FROM client_items AS ci WHERE ci.item_localsyncupstate = 4 AND ci.item_min_supported_os_rowid IS NULL AND NOT EXISTS (SELECT 1 FROM client_sync_up AS cs WHERE cs.throttle_id = ci.rowid AND cs.throttle_state != 0)"];

  double v110 = (double)v163;
  if ([v109 next])
  {
    uint64_t v111 = *MEMORY[0x263F32360];
    do
    {
      v112 = (void *)MEMORY[0x2455D97F0]();
      uint64_t v113 = [v109 longLongAtIndex:0];
      v114 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v111 code:52 userInfo:0];
      v115 = brc_bread_crumbs();
      v116 = brc_default_log();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)v180 = v113;
        *(_WORD *)&v180[8] = 2112;
        *(void *)&v180[10] = v115;
        _os_log_impl(&dword_23FA42000, v116, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item with a missing sync up throttle%@", buf, 0x16u);
      }

      v117 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v110 / 1000000000.0];
      v118 = [[BRCTransferFailureReport alloc] initWithError:v114];
      uint64_t v119 = [(NSMutableSet *)self->_syncUpFailures member:v118];
      v120 = (void *)v119;
      if (v119) {
        v121 = (void *)v119;
      }
      else {
        v121 = v118;
      }
      id v122 = v121;

      [(NSMutableSet *)self->_syncUpFailures addObject:v122];
      [(BRCSyncHealthReport *)self _fillTransferFailure:v122 withRowID:v113 atDate:v117 session:v174];
    }
    while (([v109 next] & 1) != 0);
  }
  v123 = [v174 clientDB];
  v124 = (void *)[v123 fetch:@"SELECT ci.rowid FROM client_items AS ci LEFT JOIN client_uploads AS cu ON ci.rowid = cu.throttle_id WHERE ci.item_localsyncupstate = 3 AND ci.item_type IN (1, 6) AND ci.item_state IN (0) AND IFNULL(cu.throttle_state, 0) = 0"];

  if ([v124 next])
  {
    uint64_t v125 = *MEMORY[0x263F32360];
    do
    {
      v126 = (void *)MEMORY[0x2455D97F0]();
      uint64_t v127 = [v124 longLongAtIndex:0];
      v128 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v125 code:50 userInfo:0];
      v129 = brc_bread_crumbs();
      v130 = brc_default_log();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)v180 = v127;
        *(_WORD *)&v180[8] = 2112;
        *(void *)&v180[10] = v129;
        _os_log_impl(&dword_23FA42000, v130, OS_LOG_TYPE_DEFAULT, "[WARNING] Item with row %llu has an item with a missing upload throttle%@", buf, 0x16u);
      }

      v131 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v110 / 1000000000.0];
      v132 = [[BRCTransferFailureReport alloc] initWithError:v128];
      uint64_t v133 = [(NSMutableSet *)self->_uploadFailures member:v132];
      v134 = (void *)v133;
      if (v133) {
        v135 = (void *)v133;
      }
      else {
        v135 = v132;
      }
      id v136 = v135;

      [(NSMutableSet *)self->_uploadFailures addObject:v136];
      [(BRCSyncHealthReport *)self _fillTransferFailure:v136 withRowID:v127 atDate:v131 session:v174];
    }
    while (([v124 next] & 1) != 0);
  }
  v137 = [v174 clientDB];
  v138 = (void *)[v137 numberWithSQL:@"SELECT COUNT(*) FROM client_items WHERE item_type IN (9, 10)"];
  self->_clientTruthDirFaultCount = [v138 unsignedLongLongValue];

  v139 = [v174 clientDB];
  v140 = (void *)[v139 numberWithSQL:@"SELECT COUNT(*) FROM server_items WHERE item_type IN (9, 10)"];
  self->_serverTruthDirFaultCount = [v140 unsignedLongLongValue];

  v141 = [v174 clientDB];
  v142 = (void *)[v141 numberWithSQL:@"SELECT COUNT(*) FROM server_items WHERE item_type IN (0, 9, 10)"];
  self->_serverTruthDirCount = [v142 unsignedLongLongValue];

  time_t v143 = time(0);
  v144 = [v174 clientDB];
  v145 = (void *)[v144 numberWithSQL:@"SELECT MIN(date) FROM boot_history"];
  self->_timeSinceLogin = v143 - [v145 unsignedLongLongValue];

  self->_zonesNeverFullSync = 0;
  v175[0] = MEMORY[0x263EF8330];
  v175[1] = 3221225472;
  v175[2] = __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_503;
  v175[3] = &unk_26507FB18;
  v175[4] = self;
  [v174 enumeratePrivateClientZones:v175];
  v146 = [v174 clientDB];
  v147 = (void *)[v146 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM client_items"];
  self->_clientTruthTotalItemsCount = [v147 unsignedLongLongValue];

  v148 = [v174 clientDB];
  v149 = (void *)[v148 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM server_items"];
  self->_serverTruthTotalItemsCount = [v149 unsignedLongLongValue];

  [(BRCSyncHealthReport *)self _collectAggregatedTelemetryForSession:v174];
  v150 = brc_bread_crumbs();
  v151 = brc_default_log();
  if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncHealthReport generateReportWithSession:]();
  }

  v152 = [v174 accountDSID];
  dsid = self->_dsid;
  self->_dsid = v152;

  v154 = [(BRCSyncHealthReport *)self getRampNumberForSession:v174];
  rampNumber = self->_rampNumber;
  self->_rampNumber = v154;
}

uint64_t __49__BRCSyncHealthReport_generateReportWithSession___block_invoke(uint64_t a1, void *a2)
{
  ++*(void *)(*(void *)(a1 + 32) + 72);
  id v3 = a2;
  if ([v3 isSyncBlocked]) {
    ++*(void *)(*(void *)(a1 + 32) + 80);
  }
  id v4 = [v3 serverZone];
  uint64_t v5 = [v4 mangledID];

  uint64_t v6 = [v3 syncUpAnalyticsError];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKeyedSubscript:v5];

  uint64_t v7 = [v3 syncDownAnalyticsError];

  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v7 forKeyedSubscript:v5];
  return 1;
}

uint64_t __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:a3 forKeyedSubscript:a2];
}

uint64_t __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:a3 forKeyedSubscript:a2];
}

uint64_t __49__BRCSyncHealthReport_generateReportWithSession___block_invoke_503(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isSyncBlocked] & 1) == 0)
  {
    id v4 = [v3 serverZone];
    char v5 = [v4 state];

    if ((v5 & 0x20) == 0) {
      ++*(void *)(*(void *)(a1 + 32) + 104);
    }
  }

  return 1;
}

- (void)dumpAggregatedEvents:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  if ([(NSMutableArray *)self->_aggregatedEvents count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v5 = self->_aggregatedEvents;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = +[BRCAnalyticsReporter _aggregatedTelemetryDescription:](BRCAnalyticsReporter, "_aggregatedTelemetryDescription:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
          v4[2](v4, v10);
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else
  {
    char v5 = [NSString stringWithFormat:@"none"];
    v4[2](v4, v5);
  }
}

- (void)syncErrors:(id)a3
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  if (![(NSMutableSet *)self->_uploadFailures count])
  {
    char v5 = [NSString stringWithFormat:@"uploadError: none"];
    v4[2](v4, v5);
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  uint64_t v6 = self->_uploadFailures;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v119 objects:v129 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v120 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [NSString stringWithFormat:@"uploadError: %@", *(void *)(*((void *)&v119 + 1) + 8 * i)];
        v4[2](v4, v11);
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v119 objects:v129 count:16];
    }
    while (v8);
  }

  if (![(NSMutableSet *)self->_syncUpFailures count])
  {
    long long v12 = [NSString stringWithFormat:@"syncUpError: none"];
    v4[2](v4, v12);
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v13 = self->_syncUpFailures;
  uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v115 objects:v128 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v116;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v116 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [NSString stringWithFormat:@"syncUpError: %@", *(void *)(*((void *)&v115 + 1) + 8 * j)];
        v4[2](v4, v18);
      }
      uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v115 objects:v128 count:16];
    }
    while (v15);
  }

  if (![(NSMutableSet *)self->_downloadFailures count])
  {
    uint64_t v19 = [NSString stringWithFormat:@"downloadError: none"];
    v4[2](v4, v19);
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v20 = self->_downloadFailures;
  uint64_t v21 = [(NSMutableSet *)v20 countByEnumeratingWithState:&v111 objects:v127 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v112;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v112 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = [NSString stringWithFormat:@"downloadError: %@", *(void *)(*((void *)&v111 + 1) + 8 * k)];
        v4[2](v4, v25);
      }
      uint64_t v22 = [(NSMutableSet *)v20 countByEnumeratingWithState:&v111 objects:v127 count:16];
    }
    while (v22);
  }

  uint64_t v84 = self;
  id v26 = +[BRCCoreAnalyticsReporter dictionaryForErrorsByZone:self->_syncUpErrorsByMangledID wantPrivateZone:0];
  if (![v26 count])
  {
    __int16 v27 = [NSString stringWithFormat:@"syncUpSharedZoneError: none"];
    v4[2](v4, v27);
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v94 = v26;
  obuint64_t j = [v26 allKeys];
  uint64_t v28 = [obj countByEnumeratingWithState:&v107 objects:v126 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v90 = *(void *)v108;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v108 != v90) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void **)(*((void *)&v107 + 1) + 8 * m);
        uint64_t v32 = NSString;
        v33 = [v31 error];
        v34 = [v33 domain];
        v35 = [v31 error];
        uint64_t v36 = [v35 code];
        if ([v31 isPCSChained]) {
          uint64_t v37 = "yes";
        }
        else {
          uint64_t v37 = "no";
        }
        v38 = [v94 objectForKeyedSubscript:v31];
        objc_msgSend(v32, "stringWithFormat:", @"syncUpSharedZoneError: %@;%ld pcs:%s count:%@",
          v34,
          v36,
          v37,
        v39 = v38);
        v4[2](v4, v39);
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v107 objects:v126 count:16];
    }
    while (v29);
  }

  uint64_t v40 = +[BRCCoreAnalyticsReporter dictionaryForErrorsByZone:v84->_syncUpErrorsByMangledID wantPrivateZone:1];
  if (![v40 count])
  {
    v41 = [NSString stringWithFormat:@"syncUpPrivateZoneError: none"];
    v4[2](v4, v41);
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v83 = v40;
  id obja = [v40 allKeys];
  uint64_t v42 = [obja countByEnumeratingWithState:&v103 objects:v125 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v91 = *(void *)v104;
    do
    {
      for (uint64_t n = 0; n != v43; ++n)
      {
        if (*(void *)v104 != v91) {
          objc_enumerationMutation(obja);
        }
        uint64_t v45 = *(void **)(*((void *)&v103 + 1) + 8 * n);
        v46 = NSString;
        v47 = [v45 error];
        uint64_t v48 = [v47 domain];
        v49 = [v45 error];
        uint64_t v50 = [v49 code];
        if ([v45 isPCSChained]) {
          double v51 = "yes";
        }
        else {
          double v51 = "no";
        }
        v52 = [v94 objectForKeyedSubscript:v45];
        objc_msgSend(v46, "stringWithFormat:", @"syncUpPrivateZoneError: %@;%ld pcs:%s count:%@",
          v48,
          v50,
          v51,
        v53 = v52);
        v4[2](v4, v53);
      }
      uint64_t v43 = [obja countByEnumeratingWithState:&v103 objects:v125 count:16];
    }
    while (v43);
  }

  v54 = +[BRCCoreAnalyticsReporter dictionaryForErrorsByZone:v84->_syncDownErrorsByMangledID wantPrivateZone:0];
  if (![v54 count])
  {
    v55 = [NSString stringWithFormat:@"syncDownSharedZoneError: none"];
    v4[2](v4, v55);
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v82 = v54;
  id objb = [v54 allKeys];
  uint64_t v56 = [objb countByEnumeratingWithState:&v99 objects:v124 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v92 = *(void *)v100;
    do
    {
      for (iuint64_t i = 0; ii != v57; ++ii)
      {
        if (*(void *)v100 != v92) {
          objc_enumerationMutation(objb);
        }
        v59 = *(void **)(*((void *)&v99 + 1) + 8 * ii);
        id v60 = NSString;
        v61 = [v59 error];
        v62 = [v61 domain];
        uint64_t v63 = [v59 error];
        uint64_t v64 = [v63 code];
        if ([v59 isPCSChained]) {
          uint64_t v65 = "yes";
        }
        else {
          uint64_t v65 = "no";
        }
        unsigned int v66 = [v94 objectForKeyedSubscript:v59];
        objc_msgSend(v60, "stringWithFormat:", @"syncDownSharedZoneError: %@;%ld pcs:%s count:%@",
          v62,
          v64,
          v65,
        v67 = v66);
        v4[2](v4, v67);
      }
      uint64_t v57 = [objb countByEnumeratingWithState:&v99 objects:v124 count:16];
    }
    while (v57);
  }

  v68 = +[BRCCoreAnalyticsReporter dictionaryForErrorsByZone:v84->_syncDownErrorsByMangledID wantPrivateZone:1];
  if (![v68 count])
  {
    uint64_t v69 = [NSString stringWithFormat:@"syncDownPrivateZoneError: none"];
    v4[2](v4, v69);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v85 = v68;
  id objc = [v68 allKeys];
  uint64_t v70 = [objc countByEnumeratingWithState:&v95 objects:v123 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v93 = *(void *)v96;
    do
    {
      for (juint64_t j = 0; jj != v71; ++jj)
      {
        if (*(void *)v96 != v93) {
          objc_enumerationMutation(objc);
        }
        v73 = *(void **)(*((void *)&v95 + 1) + 8 * jj);
        v74 = NSString;
        uint64_t v75 = [v73 error];
        v76 = [v75 domain];
        uint64_t v77 = [v73 error];
        uint64_t v78 = [v77 code];
        if ([v73 isPCSChained]) {
          v79 = "yes";
        }
        else {
          v79 = "no";
        }
        v80 = [v94 objectForKeyedSubscript:v73];
        objc_msgSend(v74, "stringWithFormat:", @"syncDownPrivateZoneError: %@;%ld pcs:%s count:%@",
          v76,
          v78,
          v79,
        v81 = v80);
        v4[2](v4, v81);
      }
      uint64_t v71 = [objc countByEnumeratingWithState:&v95 objects:v123 count:16];
    }
    while (v71);
  }
}

- (NSArray)telemetryErrorEvents
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v43 = [(NSMutableDictionary *)self->_syncUpErrorsByMangledID count];
  uint64_t v42 = [(NSMutableDictionary *)self->_syncDownErrorsByMangledID count];
  syncUpErrorsByMangledID = self->_syncUpErrorsByMangledID;
  v92[0] = MEMORY[0x263EF8330];
  v92[1] = 3221225472;
  v92[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke;
  v92[3] = &unk_26507FAF0;
  id v5 = v3;
  id v93 = v5;
  [(NSMutableDictionary *)syncUpErrorsByMangledID enumerateKeysAndObjectsUsingBlock:v92];
  syncDownErrorsByMangledID = self->_syncDownErrorsByMangledID;
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_2;
  v90[3] = &unk_26507FAF0;
  id v47 = v5;
  id v91 = v47;
  [(NSMutableDictionary *)syncDownErrorsByMangledID enumerateKeysAndObjectsUsingBlock:v90];
  uint64_t v86 = 0;
  id v87 = &v86;
  uint64_t v88 = 0x2020000000;
  int v89 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = self->_uploadFailures;
  uint64_t v7 = [(NSMutableSet *)obj countByEnumeratingWithState:&v82 objects:v96 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v83 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        long long v11 = [v10 privateDBErrorCountByPCSAndEDPState];
        v79[0] = MEMORY[0x263EF8330];
        v79[1] = 3221225472;
        v79[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_3;
        v79[3] = &unk_26507FB40;
        v79[4] = v10;
        id v12 = v47;
        id v80 = v12;
        v81 = &v86;
        [v11 enumerateKeysAndObjectsUsingBlock:v79];

        long long v13 = [v10 shareDBErrorCountByPCSAndEDPState];
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_4;
        v76[3] = &unk_26507FB40;
        v76[4] = v10;
        id v77 = v12;
        uint64_t v78 = &v86;
        [v13 enumerateKeysAndObjectsUsingBlock:v76];
      }
      uint64_t v7 = [(NSMutableSet *)obj countByEnumeratingWithState:&v82 objects:v96 count:16];
    }
    while (v7);
  }

  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  int v75 = 0;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obja = self->_downloadFailures;
  uint64_t v14 = [(NSMutableSet *)obja countByEnumeratingWithState:&v68 objects:v95 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(obja);
        }
        uint64_t v17 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        uint64_t v18 = [v17 privateDBErrorCountByPCSAndEDPState];
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_5;
        v65[3] = &unk_26507FB40;
        v65[4] = v17;
        id v19 = v47;
        id v66 = v19;
        v67 = &v72;
        [v18 enumerateKeysAndObjectsUsingBlock:v65];

        uint64_t v20 = [v17 shareDBErrorCountByPCSAndEDPState];
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_6;
        v62[3] = &unk_26507FB40;
        v62[4] = v17;
        id v63 = v19;
        uint64_t v64 = &v72;
        [v20 enumerateKeysAndObjectsUsingBlock:v62];
      }
      uint64_t v14 = [(NSMutableSet *)obja countByEnumeratingWithState:&v68 objects:v95 count:16];
    }
    while (v14);
  }

  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  int v61 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id objb = self->_syncUpFailures;
  uint64_t v21 = [(NSMutableSet *)objb countByEnumeratingWithState:&v54 objects:v94 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v55 != v22) {
          objc_enumerationMutation(objb);
        }
        v24 = *(void **)(*((void *)&v54 + 1) + 8 * k);
        v25 = [v24 privateDBErrorCountByPCSAndEDPState];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_7;
        v51[3] = &unk_26507FB40;
        v51[4] = v24;
        id v26 = v47;
        id v52 = v26;
        v53 = &v58;
        [v25 enumerateKeysAndObjectsUsingBlock:v51];

        __int16 v27 = [v24 shareDBErrorCountByPCSAndEDPState];
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_8;
        v48[3] = &unk_26507FB40;
        v48[4] = v24;
        id v49 = v26;
        uint64_t v50 = &v58;
        [v27 enumerateKeysAndObjectsUsingBlock:v48];
      }
      uint64_t v21 = [(NSMutableSet *)objb countByEnumeratingWithState:&v54 objects:v94 count:16];
    }
    while (v21);
  }

  uint64_t v28 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v29 = [v28 telemetryEventQueueSize];

  unint64_t v30 = v29 - 6;
  if ([v47 count] > v30) {
    objc_msgSend(v47, "removeObjectsInRange:", v30, objc_msgSend(v47, "count") - v30);
  }
  int v31 = *((_DWORD *)v87 + 6);
  int v32 = *((_DWORD *)v73 + 6);
  int v33 = *((_DWORD *)v59 + 6);
  id v34 = +[AppTelemetryTimeSeriesEvent newCASyncUpZoneErrorCountEventWithCount:v43];
  [v47 addObject:v34];

  id v35 = +[AppTelemetryTimeSeriesEvent newCASyncDownErrorCountEventWithCount:v42];
  [v47 addObject:v35];

  id v36 = +[AppTelemetryTimeSeriesEvent newCASyncUpItemErrorCountEventWithCount:*((unsigned int *)v59 + 6)];
  [v47 addObject:v36];

  id v37 = +[AppTelemetryTimeSeriesEvent newCAUploadErrorCountEventWithCount:*((unsigned int *)v87 + 6)];
  [v47 addObject:v37];

  id v38 = +[AppTelemetryTimeSeriesEvent newCADownloadErrorCountEventWithCount:*((unsigned int *)v73 + 6)];
  [v47 addObject:v38];

  id v39 = +[AppTelemetryTimeSeriesEvent newCATotalErrorCountEventWithCount:(v42 + v43 + v31 + v32 + v33)];
  [v47 addObject:v39];

  id v40 = v47;
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v86, 8);

  return (NSArray *)v40;
}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v10 = [v5 error];
  uint64_t v7 = [v5 isPCSChained];
  uint64_t v8 = [v5 isEnhancedDrivePrivacyEnabled];

  id v9 = +[AppTelemetryTimeSeriesEvent newCASyncUpZoneErrorEventWithError:v10 pcsChained:v7 enhancedDrivePrivacyEnabled:v8 zoneMangledID:v6];
  [v4 addObject:v9];
}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v10 = [v5 error];
  uint64_t v7 = [v5 isPCSChained];
  uint64_t v8 = [v5 isEnhancedDrivePrivacyEnabled];

  id v9 = +[AppTelemetryTimeSeriesEvent newCASyncDownErrorEventWithError:v10 pcsChained:v7 enhancedDrivePrivacyEnabled:v8 zoneMangledID:v6];
  [v4 addObject:v9];
}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 left];
  int v8 = [v7 intValue];

  id v9 = [v6 right];

  uint64_t v10 = [v9 BOOLValue];
  uint64_t v11 = [v5 intValue];

  id v15 = [*(id *)(a1 + 32) error];
  id v12 = *(void **)(a1 + 40);
  id v13 = +[AppTelemetryTimeSeriesEvent newCAUploadErrorEventWithError:v15 pcsChained:(v8 & 0xFFFFFFFE) == 2 enhancedDrivePrivacyEnabled:v10 sharedZone:0 count:v11];
  [v12 addObject:v13];

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry")) {
    int v14 = 0;
  }
  else {
    int v14 = v11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v14;
}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 left];
  int v8 = [v7 intValue];

  id v9 = [v6 right];

  uint64_t v10 = [v9 BOOLValue];
  uint64_t v11 = [v5 intValue];

  id v15 = [*(id *)(a1 + 32) error];
  id v12 = *(void **)(a1 + 40);
  id v13 = +[AppTelemetryTimeSeriesEvent newCAUploadErrorEventWithError:v15 pcsChained:(v8 & 0xFFFFFFFE) == 2 enhancedDrivePrivacyEnabled:v10 sharedZone:1 count:v11];
  [v12 addObject:v13];

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry")) {
    int v14 = 0;
  }
  else {
    int v14 = v11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v14;
}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 left];
  int v8 = [v7 intValue];

  id v9 = [v6 right];

  uint64_t v10 = [v9 BOOLValue];
  uint64_t v11 = [v5 intValue];

  id v15 = [*(id *)(a1 + 32) error];
  id v12 = *(void **)(a1 + 40);
  id v13 = +[AppTelemetryTimeSeriesEvent newCADownloadErrorEventWithError:v15 pcsChained:(v8 & 0xFFFFFFFE) == 2 enhancedDrivePrivacyEnabled:v10 sharedZone:0 count:v11];
  [v12 addObject:v13];

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry")) {
    int v14 = 0;
  }
  else {
    int v14 = v11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v14;
}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 left];
  int v8 = [v7 intValue];

  id v9 = [v6 right];

  uint64_t v10 = [v9 BOOLValue];
  uint64_t v11 = [v5 intValue];

  id v15 = [*(id *)(a1 + 32) error];
  id v12 = *(void **)(a1 + 40);
  id v13 = +[AppTelemetryTimeSeriesEvent newCADownloadErrorEventWithError:v15 pcsChained:(v8 & 0xFFFFFFFE) == 2 enhancedDrivePrivacyEnabled:v10 sharedZone:1 count:v11];
  [v12 addObject:v13];

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry")) {
    int v14 = 0;
  }
  else {
    int v14 = v11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v14;
}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 left];
  int v8 = [v7 intValue];

  id v9 = [v6 right];

  uint64_t v10 = [v9 BOOLValue];
  uint64_t v11 = [v5 intValue];

  id v15 = [*(id *)(a1 + 32) error];
  id v12 = *(void **)(a1 + 40);
  id v13 = +[AppTelemetryTimeSeriesEvent newCASyncUpItemErrorEventWithError:v15 pcsChained:(v8 & 0xFFFFFFFE) == 2 enhancedDrivePrivacyEnabled:v10 sharedZone:0 count:v11];
  [v12 addObject:v13];

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry")) {
    int v14 = 0;
  }
  else {
    int v14 = v11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v14;
}

void __43__BRCSyncHealthReport_telemetryErrorEvents__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 left];
  int v8 = [v7 intValue];

  id v9 = [v6 right];

  uint64_t v10 = [v9 BOOLValue];
  uint64_t v11 = [v5 intValue];

  id v15 = [*(id *)(a1 + 32) error];
  id v12 = *(void **)(a1 + 40);
  id v13 = +[AppTelemetryTimeSeriesEvent newCASyncUpItemErrorEventWithError:v15 pcsChained:(v8 & 0xFFFFFFFE) == 2 enhancedDrivePrivacyEnabled:v10 sharedZone:1 count:v11];
  [v12 addObject:v13];

  if (objc_msgSend(v15, "brc_isExpectedErrorForTelemetry")) {
    int v14 = 0;
  }
  else {
    int v14 = v11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v14;
}

- (NSArray)telemetryOtherEvents
{
  id v3 = objc_opt_new();
  id v4 = +[AppTelemetryTimeSeriesEvent newQBSDirFaultsCountEvent:self->_clientTruthDirFaultCount serverTruthDirFaultCount:self->_serverTruthDirFaultCount serverTruthDirCount:self->_serverTruthDirCount timeSinceLogin:self->_timeSinceLogin serverTruthTotalItemsCount:self->_serverTruthTotalItemsCount zonesNeverFullSync:self->_zonesNeverFullSync];
  [v3 addObject:v4];

  return (NSArray *)v3;
}

- (unint64_t)totalZoneCount
{
  return self->_totalZoneCount;
}

- (unint64_t)blockedZonesCount
{
  return self->_blockedZonesCount;
}

- (unint64_t)clientTruthTotalItemsCount
{
  return self->_clientTruthTotalItemsCount;
}

- (unint64_t)serverTruthTotalItemsCount
{
  return self->_serverTruthTotalItemsCount;
}

- (unint64_t)zonesNeverFullSync
{
  return self->_zonesNeverFullSync;
}

- (NSDictionary)syncUpErrorsByMangledID
{
  return &self->_syncUpErrorsByMangledID->super;
}

- (NSDictionary)syncDownErrorsByMangledID
{
  return &self->_syncDownErrorsByMangledID->super;
}

- (NSSet)syncUpFailures
{
  return &self->_syncUpFailures->super;
}

- (NSSet)uploadFailures
{
  return &self->_uploadFailures->super;
}

- (NSSet)downloadFailures
{
  return &self->_downloadFailures->super;
}

- (NSArray)aggregatedEvents
{
  return &self->_aggregatedEvents->super;
}

- (NSString)dsid
{
  return (NSString *)self->_dsid;
}

- (NSString)rampNumber
{
  return self->_rampNumber;
}

- (unint64_t)clientTruthDirFaultCount
{
  return self->_clientTruthDirFaultCount;
}

- (unint64_t)serverTruthDirFaultCount
{
  return self->_serverTruthDirFaultCount;
}

- (unint64_t)serverTruthDirCount
{
  return self->_serverTruthDirCount;
}

- (unint64_t)timeSinceLogin
{
  return self->_timeSinceLogin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedEvents, 0);
  objc_storeStrong((id *)&self->_downloadFailures, 0);
  objc_storeStrong((id *)&self->_uploadFailures, 0);
  objc_storeStrong((id *)&self->_syncUpFailures, 0);
  objc_storeStrong((id *)&self->_rampNumber, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_syncDownErrorsByMangledID, 0);
  objc_storeStrong((id *)&self->_syncUpErrorsByMangledID, 0);
}

- (void)_injectionForAnalyticsServiceCode:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_23FA42000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No service with code %d%@", (uint8_t *)v3, 0x12u);
}

- (void)generateReportWithSession:.cold.1()
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_13_1();
  uint64_t v9 = v0;
  __int16 v10 = v1;
  uint64_t v11 = v2;
  __int16 v12 = v1;
  uint64_t v13 = v3;
  __int16 v14 = v1;
  uint64_t v15 = v4;
  __int16 v16 = v1;
  uint64_t v17 = v5;
  __int16 v18 = v1;
  uint64_t v19 = v6;
  _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated sync health report with upload failures:%@\ndownload failures:%@\nsync up failures:%@\nzone sync up errors:%@\nzone sync down errors:%@\naggregated events:%@%@", v8, 0x48u);
}

- (void)generateReportWithSession:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _totalZoneCount == 0%@", v2, v3, v4, v5, v6);
}

@end