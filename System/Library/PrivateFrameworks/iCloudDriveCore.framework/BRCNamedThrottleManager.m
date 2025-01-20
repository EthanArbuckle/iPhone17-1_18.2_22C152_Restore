@interface BRCNamedThrottleManager
- (BRCNamedThrottleManager)initWithDB:(id)a3;
- (void)cleanNamedThrottleTable:(id)a3;
- (void)dumpToContext:(id)a3;
- (void)throttle:(id)a3 subCategory:(id)a4 withRules:(id)a5 onQueue:(id)a6 block:(id)a7;
@end

@implementation BRCNamedThrottleManager

- (BRCNamedThrottleManager)initWithDB:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCNamedThrottleManager;
  v6 = [(BRCNamedThrottleManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    uint64_t v8 = OSVersion();
    currentOSVersion = v7->_currentOSVersion;
    v7->_currentOSVersion = (NSString *)v8;
  }
  return v7;
}

- (void)cleanNamedThrottleTable:(id)a3
{
  id v3 = a3;
  v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCNamedThrottleManager cleanNamedThrottleTable:]((uint64_t)v4, v5);
  }

  time_t v6 = time(0);
  v7 = OSVersion();
  [v3 execute:@"DELETE FROM named_throttles_history WHERE expiration < %ld AND (allow_same_build = 1 OR os_version != %@)", v6, v7];

  uint64_t v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(BRCNamedThrottleManager *)v3 cleanNamedThrottleTable:v9];
  }
}

- (void)throttle:(id)a3 subCategory:(id)a4 withRules:(id)a5 onQueue:(id)a6 block:(id)a7
{
  id v34 = a3;
  id v33 = a4;
  id v12 = a6;
  id v13 = a7;
  v14 = self->_db;
  v15 = self->_currentOSVersion;
  id v16 = a5;
  time_t v17 = time(0);
  v18 = [v16 objectForKeyedSubscript:@"waitBetweenThrottleRuns"];
  uint64_t v19 = [v18 longValue];
  uint64_t v20 = 86400;
  if (v19) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = 86400;
  }

  v22 = [v16 objectForKeyedSubscript:@"waitBetweenSubCatagoryRuns"];
  uint64_t v23 = [v22 longValue];
  if (v23) {
    uint64_t v20 = v23;
  }

  v24 = [v16 objectForKeyedSubscript:@"allowOnSameBuild"];

  char v25 = [v24 BOOLValue];
  v26 = [(BRCPQLConnection *)self->_db serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke;
  block[3] = &unk_265085260;
  v36 = v14;
  id v37 = v34;
  time_t v42 = v17;
  uint64_t v43 = v21;
  char v45 = v25;
  id v38 = v33;
  v39 = v15;
  uint64_t v44 = v20;
  id v40 = v12;
  id v41 = v13;
  id v27 = v13;
  id v28 = v12;
  v29 = v15;
  id v30 = v33;
  id v31 = v34;
  v32 = v14;
  dispatch_async(v26, block);
}

void __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v2 = (void *)[*(id *)(a1 + 32) numberWithSQL:@"SELECT MAX(last_run) FROM named_throttles_history WHERE throttle_id = %@", *(void *)(a1 + 40)];
  id v3 = v2;
  if (!v2)
  {
    time_t v6 = 0;
    goto LABEL_8;
  }
  if ([v2 longValue] <= *(void *)(a1 + 80) - *(void *)(a1 + 88))
  {
    time_t v6 = (void *)[*(id *)(a1 + 32) fetch:@"SELECT last_run, os_version FROM named_throttles_history WHERE throttle_id = %@ AND sub_category = %@", *(void *)(a1 + 40), *(void *)(a1 + 48)];
LABEL_8:
    if ([v6 next])
    {
      uint64_t v7 = *(void *)(a1 + 80);
      uint64_t v8 = (void *)(v7 - [v6 longAtIndex:0]);
      int v9 = 1;
      v10 = [v6 stringAtIndex:1];
      if (!*(unsigned char *)(a1 + 104)) {
        int v9 = [*(id *)(a1 + 56) isEqualToString:v10] ^ 1;
      }
      uint64_t v11 = *(void *)(a1 + 96);
      if ((uint64_t)v8 >= v11) {
        int v12 = v9;
      }
      else {
        int v12 = 0;
      }
      id v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = *(void *)(a1 + 48);
        uint64_t v22 = *(void *)(a1 + 96);
        uint64_t v23 = *(void *)(a1 + 56);
        v24 = @"NO";
        if (v12) {
          char v25 = @"YES";
        }
        else {
          char v25 = @"NO";
        }
        if (v9) {
          v26 = @"YES";
        }
        else {
          v26 = @"NO";
        }
        if ((uint64_t)v8 >= v11) {
          v24 = @"YES";
        }
        *(_DWORD *)buf = 138414594;
        uint64_t v40 = v20;
        __int16 v41 = 2112;
        uint64_t v42 = v21;
        __int16 v43 = 2048;
        uint64_t v44 = v8;
        __int16 v45 = 2048;
        uint64_t v46 = v22;
        __int16 v47 = 2112;
        v48 = v10;
        __int16 v49 = 2112;
        uint64_t v50 = v23;
        __int16 v51 = 2112;
        v52 = v25;
        __int16 v53 = 2112;
        v54 = v26;
        __int16 v55 = 2112;
        v56 = v24;
        __int16 v57 = 2112;
        v58 = v13;
        _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Throttler %@,%@: last run: %ld seconds ago, minimal time: %ld seconds, os build: %@, current os build: %@, should invoke: %@. OS build Rule result: %@, Time Limit Rule Result: %@%@", buf, 0x66u);
      }

      if ((v12 & 1) == 0) {
        goto LABEL_16;
      }
    }
    else
    {
      time_t v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = *(void *)(a1 + 40);
        uint64_t v28 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        uint64_t v40 = v27;
        __int16 v41 = 2112;
        uint64_t v42 = v28;
        __int16 v43 = 2112;
        uint64_t v44 = v17;
        _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Throttler %@,%@: no history found, should invoke: YES%@", buf, 0x20u);
      }
    }
    [*(id *)(a1 + 32) execute:@"INSERT OR REPLACE INTO named_throttles_history (throttle_id, sub_category, last_run, os_version, expiration, allow_same_build) VALUES (%@, %@, %ld, %@, %ld, %d)", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 80), *(void *)(a1 + 56), *(void *)(a1 + 96) + *(void *)(a1 + 80), *(unsigned __int8 *)(a1 + 104)];
    uint64_t v19 = *(void **)(a1 + 32);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_2;
    v34[3] = &unk_26507F850;
    v15 = &v35;
    id v35 = *(id *)(a1 + 64);
    id v36 = *(id *)(a1 + 72);
    [v19 scheduleFlushWithCheckpoint:0 whenFlushed:v34];

    goto LABEL_21;
  }
  v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 48);
    uint64_t v31 = *(void *)(a1 + 80);
    uint64_t v32 = [v3 longValue];
    uint64_t v33 = *(void *)(a1 + 88);
    *(_DWORD *)buf = 138413314;
    uint64_t v40 = v29;
    __int16 v41 = 2112;
    uint64_t v42 = v30;
    __int16 v43 = 2048;
    uint64_t v44 = (void *)(v31 - v32);
    __int16 v45 = 2048;
    uint64_t v46 = v33;
    __int16 v47 = 2112;
    v48 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Throttler %@,%@: throttle id last run: %ld seconds ago, minimal time: %ld seconds, should invoke: NO%@", buf, 0x34u);
  }

LABEL_16:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_22;
  block[3] = &unk_265080B88;
  v15 = &v38;
  id v16 = *(NSObject **)(a1 + 64);
  id v38 = *(id *)(a1 + 72);
  dispatch_async(v16, block);
LABEL_21:
}

void __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_22(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "brc_errorThrottledWithDescription:", @"Throttled by named throttle manager");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_3;
  block[3] = &unk_265080B88;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpToContext:(id)a3
{
  id v18 = a3;
  [v18 writeLineWithFormat:&stru_26F3822F0];
  [v18 writeLineWithFormat:@"Named Throttle History"];
  [v18 writeLineWithFormat:@"-----------------------------------------------------"];
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  id v5 = +[BRCUserDefaults defaultsForMangledID:0];
  time_t v6 = [v5 dumpDateFormat];
  [v4 setDateFormat:v6];

  id v7 = [(BRCPQLConnection *)self->_db fetch:@"SELECT throttle_id, sub_category, last_run, os_version, expiration, allow_same_build FROM named_throttles_history LIMIT 100"];
  if ([v7 next])
  {
    do
    {
      uint64_t v8 = [v7 stringAtIndex:0];
      int v9 = [v7 stringAtIndex:1];
      v10 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v7, "longAtIndex:", 2));
      uint64_t v11 = [v7 stringAtIndex:3];
      int v12 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v7, "longAtIndex:", 4));
      int v13 = [v7 BOOLAtIndex:5];
      v14 = [v4 stringFromDate:v10];
      uint64_t v15 = [v4 stringFromDate:v12];
      id v16 = (void *)v15;
      time_t v17 = @"no";
      if (v13) {
        time_t v17 = @"yes";
      }
      [v18 writeLineWithFormat:@"|<%@,%@>|last run:%@|os version:%@|expiration:%@|allow same build:%@", v8, v9, v14, v11, v15, v17];
    }
    while (([v7 next] & 1) != 0);
  }
  [v18 writeLineWithFormat:&stru_26F3822F0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOSVersion, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)cleanNamedThrottleTable:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 134218242;
  uint64_t v6 = [a1 changes];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleared %lld throttle history records%@", (uint8_t *)&v5, 0x16u);
}

- (void)cleanNamedThrottleTable:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleaning named throggler%@", (uint8_t *)&v2, 0xCu);
}

@end