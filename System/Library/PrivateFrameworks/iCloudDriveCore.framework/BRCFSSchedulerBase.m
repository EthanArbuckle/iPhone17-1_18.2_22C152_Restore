@interface BRCFSSchedulerBase
- (BOOL)canScheduleMoreJobs;
- (BOOL)closed;
- (BOOL)hasActiveWork;
- (BOOL)hasWork;
- (BOOL)haveActiveJobsMatching:(id)a3;
- (BOOL)isCancelled;
- (BOOL)setState:(int)a3 forJobID:(id)a4;
- (BOOL)setState:(int)a3 forJobsMatching:(id)a4;
- (BRCFSSchedulerBase)initWithSession:(id)a3 name:(id)a4 tableName:(id)a5;
- (NSString)name;
- (OS_dispatch_group)hasActiveWorkGroup;
- (OS_dispatch_group)hasWorkGroup;
- (PQLNameInjection)tableName;
- (brc_job_update)insertOrUpdateJobID:(id)a3 throttle:(id)a4 withState:(int)a5 insertedSQLColumn:(id)a6 insertedSQLValues:(id)a7 updatedSQLValues:(id)a8 error:(id *)a9;
- (id)aggregateDescriptionForJobsMatching:(id)a3 context:(id)a4;
- (id)descriptionForJobsMatching:(id)a3 context:(id)a4;
- (id)descriptionForJobsMatching:(id)a3 ordering:(id)a4 additionalColumns:(id)a5 additionalValuesHandler:(id)a6 context:(id)a7;
- (int)jobStateFor:(id)a3;
- (int64_t)updateStamps:(throttle_stamps *)a3 throttle:(id)a4 now:(int64_t)a5;
- (unint64_t)postponeJobID:(id)a3 withThrottle:(id)a4;
- (unint64_t)recoverAndReportMissingJobs;
- (void)_close;
- (void)cancel;
- (void)checkIfHasWork;
- (void)close;
- (void)computeStamps:(throttle_stamps *)a3 forJobID:(id)a4 throttle:(id)a5 shouldBackoff:(BOOL)a6;
- (void)deleteExpiredJobs;
- (void)deleteJobsMatching:(id)a3;
- (void)describeInBuffer:(id)a3 aggregateOfJobsMatching:(id)a4 context:(id)a5;
- (void)recoverAndReportMissingJobs;
- (void)rescheduleSuspendedJobsMatching:(id)a3 inState:(int)a4;
- (void)resetBackoffForJobWithID:(id)a3;
- (void)resume;
- (void)schedule;
- (void)scheduleWithBatchSize:(int)a3 whereSQLClause:(id)a4 columns:(id)a5 actionHandler:(id)a6;
- (void)setHasActiveWork:(BOOL)a3;
- (void)setHasActiveWorkGroup:(id)a3;
- (void)setHasWork:(BOOL)a3;
- (void)setHasWorkGroup:(id)a3;
- (void)signal;
- (void)signalWithDeadline:(int64_t)a3;
- (void)suspend;
@end

@implementation BRCFSSchedulerBase

- (BOOL)closed
{
  v2 = [(BRCFSSchedulerBase *)self hasWorkGroup];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setHasWork:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(BRCFSSchedulerBase *)self closed] && self->_hasWork != v3)
  {
    hasWorkGroup = self->_hasWorkGroup;
    if (v3) {
      dispatch_group_enter(hasWorkGroup);
    }
    else {
      dispatch_group_leave(hasWorkGroup);
    }
    self->_hasWork = v3;
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"BRCFSSchedulerBaseDidUpdateHasWorkNotification" object:0];
  }
}

- (void)setHasActiveWork:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(BRCFSSchedulerBase *)self closed] && self->_hasActiveWork != v3)
  {
    hasWorkGroup = self->_hasWorkGroup;
    if (v3)
    {
      dispatch_group_enter(hasWorkGroup);
      dispatch_group_enter((dispatch_group_t)self->_hasActiveWorkGroup);
    }
    else
    {
      dispatch_group_leave(hasWorkGroup);
      dispatch_group_leave((dispatch_group_t)self->_hasActiveWorkGroup);
    }
    self->_hasActiveWork = v3;
  }
}

- (BRCFSSchedulerBase)initWithSession:(id)a3 name:(id)a4 tableName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)BRCFSSchedulerBase;
  v12 = [(BRCFSSchedulerBase *)&v35 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    uint64_t v14 = [MEMORY[0x263F8C718] nameWithString:v11];
    tableName = v13->_tableName;
    v13->_tableName = (PQLNameInjection *)v14;

    dispatch_group_t v16 = dispatch_group_create();
    hasWorkGroup = v13->_hasWorkGroup;
    v13->_hasWorkGroup = (OS_dispatch_group *)v16;

    dispatch_group_t v18 = dispatch_group_create();
    hasActiveWorkGroup = v13->_hasActiveWorkGroup;
    v13->_hasActiveWorkGroup = (OS_dispatch_group *)v18;

    uint64_t v20 = [v9 clientTruthWorkloop];
    schedulerWorkloop = v13->_schedulerWorkloop;
    v13->_schedulerWorkloop = (OS_dispatch_workloop *)v20;

    v22 = [BRCDeadlineSource alloc];
    v23 = [(BRCAccountSessionFPFS *)v13->_session defaultScheduler];
    uint64_t v24 = [(BRCDeadlineSource *)v22 initWithScheduler:v23 name:v13->_name];
    schedulerSource = v13->_schedulerSource;
    v13->_schedulerSource = (BRCDeadlineSource *)v24;

    v26 = [v9 clientTruthWorkloop];
    [(BRCDeadlineSource *)v13->_schedulerSource setWorkloop:v26];

    objc_initWeak(&location, v13);
    v27 = v13->_schedulerSource;
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __53__BRCFSSchedulerBase_initWithSession_name_tableName___block_invoke;
    v32 = &unk_26507ED20;
    objc_copyWeak(&v33, &location);
    [(BRCDeadlineSource *)v27 setEventHandler:&v29];
    [(BRCFSSchedulerBase *)v13 signal];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __53__BRCFSSchedulerBase_initWithSession_name_tableName___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2455D97F0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCFSSchedulerBase initWithSession:name:tableName:]_block_invoke", 192, v9);
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (WeakRetained) {
      uint64_t v8 = WeakRetained[4];
    }
    else {
      uint64_t v8 = 0;
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v11 = v9[0];
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    v15 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: scheduling%@", buf, 0x20u);
  }

  if ([WeakRetained isCancelled])
  {
    id v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __53__BRCFSSchedulerBase_initWithSession_name_tableName___block_invoke_cold_1();
    }
  }
  else
  {
    [WeakRetained schedule];
  }
  __brc_leave_section(v9);
}

- (BOOL)haveActiveJobsMatching:(id)a3
{
  session = self->_session;
  id v5 = a3;
  id v6 = [(BRCAccountSessionFPFS *)session clientDB];
  tableName = self->_tableName;
  uint64_t v8 = [v5 matchingJobsWhereSQLClause];

  id v9 = (void *)[v6 numberWithSQL:@"SELECT 1 FROM %@ WHERE %@ AND throttle_state = 1 LIMIT 1", tableName, v8];
  LOBYTE(v8) = [v9 BOOLValue];

  return (char)v8;
}

- (int)jobStateFor:(id)a3
{
  session = self->_session;
  id v5 = a3;
  id v6 = [(BRCAccountSessionFPFS *)session clientDB];
  tableName = self->_tableName;
  uint64_t v8 = [v5 matchingJobsWhereSQLClause];

  id v9 = (void *)[v6 numberWithSQL:@"SELECT throttle_state FROM %@ WHERE %@ AND throttle_state != 0", tableName, v8];
  if (v9) {
    int v10 = [v9 intValue];
  }
  else {
    int v10 = 0;
  }

  return v10;
}

- (id)descriptionForJobsMatching:(id)a3 ordering:(id)a4 additionalColumns:(id)a5 additionalValuesHandler:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v41 = a4;
  id v13 = a5;
  id v43 = a6;
  id v14 = a7;
  v15 = [v14 db];
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  }
  v39 = v17;

  v40 = v13;
  if (v13)
  {
    dispatch_group_t v18 = [MEMORY[0x263F8C720] rawInjection:"," length:1];
    v19 = v13;
  }
  else
  {
    dispatch_group_t v18 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
    v19 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
  }
  tableName = self->_tableName;
  uint64_t v21 = [v12 matchingJobsWhereSQLClause];
  v22 = (void *)v21;
  if (v41)
  {
    v23 = (void *)[v39 fetch:@"SELECT zone_rowid, throttle_id, throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp%@%@ FROM %@ WHERE %@%@", v18, v19, tableName, v21, v41];
  }
  else
  {
    uint64_t v24 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
    v23 = (void *)[v39 fetch:@"SELECT zone_rowid, throttle_id, throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp%@%@ FROM %@ WHERE %@%@", v18, v19, tableName, v22, v24];
  }
  if (!v40) {

  }
  v38 = v12;
  if ([v23 next])
  {
    id v25 = 0;
    v26 = (void (**)(void, void, void, void, void))v43;
    uint64_t v42 = 0;
    do
    {
      uint64_t v27 = [v23 unsignedIntAtIndex:2];
      uint64_t v28 = [v23 unsignedIntAtIndex:3];
      uint64_t v29 = [v23 longLongAtIndex:4];
      uint64_t v30 = [v23 longLongAtIndex:5];
      uint64_t v31 = [v23 longLongAtIndex:6];
      if (![v14 onlyActiveStuff] || v27)
      {
        if (v27
          || (+[BRCDumpContext nowFromContext:v14],
              !brc_is_before_deadline()))
        {
          if (v25) {
            [v25 appendString:@" "];
          }
          else {
            id v25 = objc_alloc_init(MEMORY[0x263F089D8]);
          }
          [v25 appendString:@"["];
          if (v26) {
            ((void (**)(void, id, void *, uint64_t, uint64_t))v26)[2](v26, v25, v23, 7, v27);
          }
          v32 = +[BRCDumpContext stringFromThrottleState:v27 context:v14];
          [v25 appendFormat:@" %@ attempts:%d", v32, v28];

          id v33 = +[BRCDumpContext stringFromDueStamp:v29 allowsPast:1 context:v14];
          [v25 appendFormat:@" last:%@", v33];

          if (v27)
          {
            v34 = +[BRCDumpContext stringFromDueStamp:v30 allowsPast:0 context:v14];
            [v25 appendFormat:@" next:%@", v34];
          }
          objc_super v35 = +[BRCDumpContext stringFromDueStamp:v31 allowsPast:0 context:v14];
          [v25 appendFormat:@" cleanup:%@", v35];

          [v25 appendString:@"]"];
          v26 = (void (**)(void, void, void, void, void))v43;
        }
        else
        {
          ++v42;
        }
      }
    }
    while (([v23 next] & 1) != 0);
    [v23 close];
    if (v42)
    {
      if (v25)
      {
        [v25 appendString:@" "];
        if (v14)
        {
LABEL_31:
          v36 = [v14 highlightedString:@"old" type:6];
          [v25 appendFormat:@"[%ld %@]", v42, v36];

          goto LABEL_35;
        }
      }
      else
      {
        id v25 = objc_alloc_init(MEMORY[0x263F089D8]);
        if (v14) {
          goto LABEL_31;
        }
      }
      [v25 appendFormat:@"[%ld %@]", v42, @"old"];
    }
  }
  else
  {
    [v23 close];
    id v25 = 0;
    v26 = (void (**)(void, void, void, void, void))v43;
  }
LABEL_35:

  return v25;
}

- (id)descriptionForJobsMatching:(id)a3 context:(id)a4
{
  return [(BRCFSSchedulerBase *)self descriptionForJobsMatching:a3 ordering:0 additionalColumns:0 additionalValuesHandler:0 context:a4];
}

- (void)describeInBuffer:(id)a3 aggregateOfJobsMatching:(id)a4 context:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v9 db];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  }
  id v13 = v12;

  tableName = self->_tableName;
  v15 = [v8 matchingJobsWhereSQLClause];
  uint64_t v16 = (void *)[v13 fetch:@"SELECT throttle_state, COUNT(*) FROM %@ WHERE %@ GROUP BY throttle_state", tableName, v15];

  if ([v16 next])
  {
    do
    {
      uint64_t v17 = [v16 unsignedIntAtIndex:0];
      uint64_t v18 = [v16 unsignedLongAtIndex:1];
      v19 = +[BRCDumpContext stringFromThrottleState:v17 context:v9];
      [v20 appendFormat:@" %@:%lld", v19, v18];
    }
    while (([v16 next] & 1) != 0);
  }
}

- (id)aggregateDescriptionForJobsMatching:(id)a3 context:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F089D8];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [(BRCFSSchedulerBase *)self describeInBuffer:v9 aggregateOfJobsMatching:v8 context:v7];

  if ([v9 length]) {
    int v10 = (__CFString *)v9;
  }
  else {
    int v10 = @" idle";
  }

  return v10;
}

- (unint64_t)postponeJobID:(id)a3 withThrottle:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  memset(v24, 0, sizeof(v24));
  [(BRCFSSchedulerBase *)self computeStamps:v24 forJobID:v6 throttle:a4 shouldBackoff:1];
  if (DWORD1(v24[0]) == -1)
  {
    v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase postponeJobID:withThrottle:]();
    }
  }
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412802;
    v26 = name;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: post-poning job%@", buf, 0x20u);
  }

  id v9 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  tableName = self->_tableName;
  long long v23 = *(_OWORD *)((char *)v24 + 8);
  uint64_t v11 = *((void *)&v24[1] + 1);
  uint64_t v12 = LODWORD(v24[0]);
  id v13 = [v6 matchingJobsWhereSQLClause];
  [v9 execute:@"UPDATE %@ SET   throttle_state = 1, retry_count = %u, last_try_stamp = %llu, next_retry_stamp = %llu, expire_stamp = %llu WHERE %@", tableName, v12, v23, v11, v13];

  [(BRCFSSchedulerBase *)self signalWithDeadline:*(void *)&v24[1]];
  id v14 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v15 = [v14 changes];

  if (v15 >= 2)
  {
    uint64_t v21 = brc_bread_crumbs();
    v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase postponeJobID:withThrottle:]();
    }
  }
  unint64_t v16 = LODWORD(v24[0]);

  return v16;
}

- (brc_job_update)insertOrUpdateJobID:(id)a3 throttle:(id)a4 withState:(int)a5 insertedSQLColumn:(id)a6 insertedSQLValues:(id)a7 updatedSQLValues:(id)a8 error:(id *)a9
{
  uint64_t v76 = *(void *)&a5;
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v75 = a8;
  long long v77 = 0u;
  long long v78 = 0u;
  [(BRCFSSchedulerBase *)self computeStamps:&v77 forJobID:v14 throttle:a4 shouldBackoff:0];
  if (!v14)
  {
    id v58 = v16;
    v59 = brc_bread_crumbs();
    v60 = brc_default_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:]();
    }

    id v16 = v58;
  }
  v73 = v16;
  id v74 = v15;
  v72 = self;
  if (DWORD1(v77) == -1)
  {
    v71 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    tableName = self->_tableName;
    uint64_t v69 = [v14 columns];
    if (v15)
    {
      uint64_t v67 = [MEMORY[0x263F8C720] rawInjection:"," length:1];
    }
    else
    {
      uint64_t v67 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
      id v15 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
    }
    uint64_t v30 = v77;
    uint64_t v31 = brc_current_date_nsec();
    long long v32 = v78;
    id v33 = [v14 columnsValues];
    if (v16)
    {
      v34 = [MEMORY[0x263F8C720] rawInjection:"," length:1];
      id v65 = v16;
      uint64_t v63 = v31;
      objc_super v35 = (void *)v67;
      v37 = (void *)v69;
      v36 = v71;
      char v25 = [v71 execute:@"INSERT INTO %@( throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp, %@ %@ %@) VALUES( %u, %u, %lld, %lld, %lld, %@ %@ %@)", tableName, v69, v67, v15, v76, v30, v63, v32, v33, v34, v65];
    }
    else
    {
      id v66 = v14;
      v34 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
      v38 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
      uint64_t v64 = v31;
      objc_super v35 = (void *)v67;
      v37 = (void *)v69;
      v36 = v71;
      char v25 = [v71 execute:@"INSERT INTO %@( throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp, %@ %@ %@) VALUES( %u, %u, %lld, %lld, %lld, %@ %@ %@)", tableName, v69, v67, v15, v76, v30, v64, v32, v33, v34, v38];

      id v14 = v66;
    }

    id v28 = v74;
    if (!v74) {

    }
    v26 = brc_bread_crumbs();
    __int16 v27 = brc_default_log();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      p_isa = (id *)&v72->super.isa;
      goto LABEL_23;
    }
    p_isa = (id *)&v72->super.isa;
    name = v72->_name;
    uint64_t v56 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 138413058;
    v80 = (const char *)name;
    __int16 v81 = 2112;
    v82 = (const char *)v14;
    __int16 v83 = 2080;
    uint64_t v84 = v56;
    __int16 v85 = 2112;
    uint64_t v86 = (uint64_t)v26;
    v52 = "[DEBUG] %@[%@]: created job with state %s%@";
    v53 = v27;
    uint32_t v54 = 42;
  }
  else
  {
    if (!DWORD1(v77) || (uint64_t v17 = *((void *)&v77 + 1)) == 0) {
      uint64_t v17 = brc_current_date_nsec();
    }
    uint64_t v18 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    v70 = self->_tableName;
    uint64_t v19 = v77;
    long long v20 = v78;
    if (v75)
    {
      uint64_t v21 = [MEMORY[0x263F8C720] rawInjection:"," length:1];
      v22 = v75;
    }
    else
    {
      uint64_t v21 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
      v22 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
    }
    id v23 = v14;
    uint64_t v24 = [v14 matchingJobsWhereSQLClause];
    char v25 = [v18 execute:@"UPDATE %@ SET  throttle_state = %d, retry_count = %u, last_try_stamp = %lld, next_retry_stamp = %lld, expire_stamp = %lld%@ %@  WHERE %@", v70, v76, v19, v17, v20, v21, v22, v24];

    if (!v75) {
    v26 = brc_bread_crumbs();
    }
    __int16 v27 = brc_default_log();
    id v28 = v15;
    p_isa = (id *)&v72->super.isa;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      id v14 = v23;
      goto LABEL_23;
    }
    v49 = v72->_name;
    uint64_t v50 = BRCPrettyPrintEnum();
    uint64_t v51 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 138413314;
    v80 = (const char *)v49;
    __int16 v81 = 2112;
    id v14 = v23;
    v82 = (const char *)v23;
    __int16 v83 = 2080;
    uint64_t v84 = v50;
    __int16 v85 = 2080;
    uint64_t v86 = v51;
    __int16 v87 = 2112;
    v88 = v26;
    v52 = "[DEBUG] %@[%@]: updated job %s->%s%@";
    v53 = v27;
    uint32_t v54 = 52;
  }
  _os_log_debug_impl(&dword_23FA42000, v53, OS_LOG_TYPE_DEBUG, v52, buf, v54);
LABEL_23:

  v39 = [p_isa[1] clientDB];
  uint64_t v40 = [v39 changes];

  if (v40 < 2)
  {
    if (v25) {
      goto LABEL_31;
    }
    goto LABEL_25;
  }
  v61 = brc_bread_crumbs();
  v62 = brc_default_log();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
    -[BRCFSSchedulerBase postponeJobID:withThrottle:]();
  }

  if ((v25 & 1) == 0)
  {
LABEL_25:
    id v41 = [p_isa[1] clientDB];
    uint64_t v42 = [v41 lastError];

    if (v42)
    {
      id v43 = brc_bread_crumbs();
      v44 = brc_default_log();
      if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
      {
        v57 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v80 = "-[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:]";
        __int16 v81 = 2080;
        if (!a9) {
          v57 = "(ignored by caller)";
        }
        v82 = v57;
        __int16 v83 = 2112;
        uint64_t v84 = (uint64_t)v42;
        __int16 v85 = 2112;
        uint64_t v86 = (uint64_t)v43;
        _os_log_error_impl(&dword_23FA42000, v44, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a9) {
      *a9 = v42;
    }
  }
LABEL_31:
  if (v76 == 1) {
    [p_isa signalWithDeadline:(void)v78];
  }
  uint64_t v45 = DWORD1(v77);
  int64_t v46 = v78;

  uint64_t v47 = v45;
  int64_t v48 = v46;
  result.var1 = v48;
  result.var0 = v47;
  return result;
}

- (void)rescheduleSuspendedJobsMatching:(id)a3 inState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  if ((int)v4 <= 1)
  {
    uint64_t v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase rescheduleSuspendedJobsMatching:inState:]();
    }
  }
  tableName = self->_tableName;
  if (v6)
  {
    id v9 = [MEMORY[0x263F8C720] rawInjection:"AND " length:4];
    [v6 matchingJobsWhereSQLClause];
  }
  else
  {
    id v9 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
    [MEMORY[0x263F8C720] rawInjection:"" length:0];
  int v10 = };
  [v7 execute:@"UPDATE %@ SET throttle_state = 1 WHERE throttle_state = %u %@%@", tableName, v4, v9, v10];

  uint64_t v11 = [v7 changes];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      id v16 = [v6 jobsDescription];
      *(_DWORD *)buf = 138413314;
      long long v20 = name;
      __int16 v21 = 2048;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2080;
      uint64_t v26 = BRCPrettyPrintEnum();
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: retrying %lld suspended jobs matching %@ in %s%@", buf, 0x34u);
    }
    [(BRCFSSchedulerBase *)self signal];
  }
}

- (int64_t)updateStamps:(throttle_stamps *)a3 throttle:(id)a4 now:(int64_t)a5
{
  id v7 = a4;
  if (!v7)
  {
    id v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase updateStamps:throttle:now:]();
    }
  }
  uint64_t v8 = [v7 nsecsToNextRetry:a3->var2 retryCount:a3 now:a5];
  int64_t v9 = v8;
  if (!v8)
  {
    a3->var2 = a5;
    unsigned int var0 = a3->var0;
    uint64_t v8 = [v7 nsecsToNextRetry:a5 retryCount:&var0 now:a5];
  }
  int64_t v10 = v8 + a5;
  if (a5 < 0) {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  a3->var3 = v10;
  int64_t v11 = [v7 nsecsBeforeForgettingCounter] + a5;
  a3->var4 = v11;
  if (v11 < [v7 nsecsBeforeForgettingCounter]) {
    a3->var4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (void)computeStamps:(throttle_stamps *)a3 forJobID:(id)a4 throttle:(id)a5 shouldBackoff:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = brc_current_date_nsec();
  if (!v10)
  {
    uint64_t v22 = brc_bread_crumbs();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:]();
    }
  }
  id v13 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  tableName = self->_tableName;
  id v15 = [v10 matchingJobsWhereSQLClause];
  id v16 = (void *)[v13 fetch:@"SELECT retry_count, last_try_stamp, next_retry_stamp, expire_stamp, throttle_state FROM %@ WHERE %@", tableName, v15];

  if (![v16 next])
  {
    *(_OWORD *)&a3->unsigned int var0 = 0u;
    *(_OWORD *)&a3->var3 = 0u;
    a3->var1 = -1;
    a3->var4 = [v11 nsecsBeforeForgettingCounter] + v12;
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  a3->unsigned int var0 = [v16 unsignedIntAtIndex:0];
  a3->var2 = [v16 longLongAtIndex:1];
  a3->var3 = [v16 longLongAtIndex:2];
  a3->var4 = [v16 longLongAtIndex:3];
  a3->var1 = [v16 unsignedIntAtIndex:4];
  if ([v16 next])
  {
    uint64_t v24 = brc_bread_crumbs();
    __int16 v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase computeStamps:forJobID:throttle:shouldBackoff:]();
    }
  }
  [v16 close];
  if (v6)
  {
LABEL_7:
    if ([(BRCFSSchedulerBase *)self updateStamps:a3 throttle:v11 now:v12])
    {
      uint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        brc_interval_from_nsec();
        unsigned int var0 = a3->var0;
        *(_DWORD *)buf = 138413314;
        __int16 v27 = name;
        __int16 v28 = 2112;
        id v29 = v10;
        __int16 v30 = 2048;
        uint64_t v31 = v21;
        __int16 v32 = 1024;
        unsigned int v33 = var0;
        __int16 v34 = 2112;
        objc_super v35 = v17;
        _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: backing off %.3fs (count: %d)%@", buf, 0x30u);
      }
    }
  }
LABEL_11:
}

- (BOOL)setState:(int)a3 forJobID:(id)a4
{
  BOOL v5 = [(BRCFSSchedulerBase *)self setState:*(void *)&a3 forJobsMatching:a4];
  BOOL v6 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v7 = [v6 changes];

  if (v7 >= 2)
  {
    int64_t v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase postponeJobID:withThrottle:]();
    }
  }
  return v5;
}

- (BOOL)setState:(int)a3 forJobsMatching:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  tableName = self->_tableName;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __47__BRCFSSchedulerBase_setState_forJobsMatching___block_invoke;
  v19[3] = &unk_265080A30;
  int v20 = a3;
  v19[4] = self;
  int64_t v9 = (void *)MEMORY[0x2455D9A50](v19);
  id v10 = [v6 matchingJobsWhereSQLClause];
  [v7 execute:@"UPDATE %@   SET throttle_state = call_block(%@, next_retry_stamp) WHERE %@", tableName, v9, v10];

  id v11 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v12 = [v11 changes];

  if (v12)
  {
    id v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      uint64_t v17 = [v6 jobsDescription];
      uint64_t v18 = BRCPrettyPrintEnum();
      *(_DWORD *)buf = 138413314;
      uint64_t v22 = name;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      __int16 v27 = 2080;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      __int16 v30 = v13;
      _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: Updated %lld jobs to state %s%@", buf, 0x34u);
    }
  }

  return v12 != 0;
}

void __47__BRCFSSchedulerBase_setState_forJobsMatching___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v5 = *(_DWORD *)(a1 + 40);
  if (v5 == 1)
  {
    [*(id *)(a1 + 32) signalWithDeadline:sqlite3_value_int64(*a4)];
    int v5 = *(_DWORD *)(a1 + 40);
  }
  sqlite3_result_int(a2, v5);
}

- (void)deleteJobsMatching:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  tableName = self->_tableName;
  uint64_t v7 = [v4 matchingJobsWhereSQLClause];
  [v5 execute:@"DELETE FROM %@ WHERE %@", tableName, v7];

  uint64_t v8 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v9 = [v8 changes];

  if (v9)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      id v13 = [v4 jobsDescription];
      *(_DWORD *)buf = 138413058;
      id v15 = name;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: Deleted %lld jobs%@", buf, 0x2Au);
    }
    [(BRCFSSchedulerBase *)self checkIfHasWork];
  }
}

- (void)resetBackoffForJobWithID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412802;
    __int16 v16 = name;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    __int16 v20 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: resetting backoff for job%@", buf, 0x20u);
  }

  uint64_t v7 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  tableName = self->_tableName;
  uint64_t v9 = [v4 matchingJobsWhereSQLClause];
  [v7 execute:@"UPDATE %@   SET retry_count = 0, next_retry_stamp = 0 WHERE %@", tableName, v9];

  id v10 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v11 = [v10 changes];

  if (v11 >= 2)
  {
    id v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase postponeJobID:withThrottle:]();
    }
  }
}

- (void)deleteExpiredJobs
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  [v3 execute:@"DELETE FROM %@ WHERE throttle_state = 0 AND expire_stamp <= %lld", self->_tableName, brc_current_date_nsec()];

  id v4 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v5 = [v4 changes];

  if (v5)
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412802;
      id v10 = name;
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Cleaned up %lld expired jobs%@", buf, 0x20u);
    }
  }
}

- (unint64_t)recoverAndReportMissingJobs
{
  v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCFSSchedulerBase recoverAndReportMissingJobs]();
  }

  return 0;
}

- (void)checkIfHasWork
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![(BRCFSSchedulerBase *)self hasActiveWork] && [(BRCFSSchedulerBase *)self hasWork])
  {
    BOOL v3 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    id v4 = (void *)[v3 numberWithSQL:@"SELECT throttle_id FROM %@ WHERE throttle_state > 0 LIMIT 1", self->_tableName];

    if (v4)
    {
      uint64_t v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412802;
        uint64_t v9 = name;
        __int16 v10 = 2112;
        __int16 v11 = v4;
        __int16 v12 = 2112;
        __int16 v13 = v5;
        _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Throttle id %@ has work%@", buf, 0x20u);
      }
    }
    [(BRCFSSchedulerBase *)self setHasWork:v4 != 0];
  }
}

- (void)signalWithDeadline:(int64_t)a3
{
  [(BRCFSSchedulerBase *)self setHasActiveWork:1];
  [(BRCFSSchedulerBase *)self setHasWork:1];
  schedulerSource = self->_schedulerSource;
  [(BRCDeadlineSource *)schedulerSource signalWithDeadline:a3];
}

- (void)signal
{
}

- (void)schedule
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_fault_impl(&dword_23FA42000, v3, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: should be implemented by subclass%@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)canScheduleMoreJobs
{
  return 1;
}

- (void)scheduleWithBatchSize:(int)a3 whereSQLClause:(id)a4 columns:(id)a5 actionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = (void (**)(id, void *, uint64_t))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerWorkloop);
  uint64_t v13 = brc_current_date_nsec();
  uint64_t v14 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  if ([(BRCAccountSessionFPFS *)self->_session isCancelled])
  {
    uint64_t v15 = 0;
    goto LABEL_21;
  }
  id v28 = v11;
  if (!self->_firstSchedulingAfterStartupDone)
  {
    [(BRCFSSchedulerBase *)self performFirstSchedulingAfterStartupInDB:v14];
    self->_firstSchedulingAfterStartupDone = 1;
  }
  tableName = self->_tableName;
  if (v10)
  {
    __int16 v17 = objc_msgSend(MEMORY[0x263F8C720], "rawInjection:length:", "AND (", 5);
    id v18 = objc_msgSend(MEMORY[0x263F8C720], "rawInjection:length:", ")", 1);
    uint64_t v15 = (void *)[v14 fetch:@"  SELECT next_retry_stamp, %@     FROM %@    WHERE throttle_state = 1          %@%@%@      AND next_retry_stamp >= 0 ORDER BY next_retry_stamp    LIMIT %u", v11, tableName, v17, v10, v18, v8];
  }
  else
  {
    __int16 v17 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
    id v18 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
    __int16 v19 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
    uint64_t v15 = (void *)[v14 fetch:@"  SELECT next_retry_stamp, %@     FROM %@    WHERE throttle_state = 1          %@%@%@      AND next_retry_stamp >= 0 ORDER BY next_retry_stamp    LIMIT %u", v11, tableName, v17, v18, v19, v8];

    id v10 = 0;
  }

  if (![v15 next])
  {
    [(BRCFSSchedulerBase *)self setHasActiveWork:0];
LABEL_18:
    uint64_t v22 = brc_bread_crumbs();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSSchedulerBase scheduleWithBatchSize:whereSQLClause:columns:actionHandler:]();
    }

    [(BRCFSSchedulerBase *)self checkIfHasWork];
    goto LABEL_21;
  }
  uint64_t v20 = [v15 longLongAtIndex:0];
  if ([(BRCFSSchedulerBase *)self canScheduleMoreJobs])
  {
    do
    {
      [v15 longLongAtIndex:0];
      if (!brc_is_before_deadline()) {
        break;
      }
      uint64_t v21 = (void *)MEMORY[0x2455D97F0]();
      if ([(BRCFSSchedulerBase *)self isCancelled]
        || (v12[2](v12, v15, 1), ([v15 next] & 1) == 0))
      {
        break;
      }
    }
    while ([(BRCFSSchedulerBase *)self canScheduleMoreJobs]);
  }
  [v15 close];
  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_18;
  }
  if (self->_hasActiveWork)
  {
    if (v20 <= v13)
    {
      uint64_t v24 = brc_bread_crumbs();
      __int16 v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSSchedulerBase scheduleWithBatchSize:whereSQLClause:columns:actionHandler:]();
      }
    }
    else
    {
      uint64_t v24 = brc_bread_crumbs();
      __int16 v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        brc_interval_from_nsec();
        *(_DWORD *)buf = 138412802;
        __int16 v30 = name;
        id v11 = v28;
        __int16 v31 = 2048;
        uint64_t v32 = v27;
        __int16 v33 = 2112;
        __int16 v34 = v24;
        _os_log_debug_impl(&dword_23FA42000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: going to sleep for %.3fs%@", buf, 0x20u);
      }
    }

    [(BRCDeadlineSource *)self->_schedulerSource signalWithDeadline:v20];
  }
LABEL_21:
}

- (void)resume
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@: resuming!%@");
}

- (void)suspend
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@: suspending!%@");
}

- (void)cancel
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@: cancelling!%@");
}

- (void)_close
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isCancelled%@", v2, v3, v4, v5, v6);
}

- (void)close
{
  schedulerWorkloop = self->_schedulerWorkloop;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__BRCFSSchedulerBase_close__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_async_and_wait(schedulerWorkloop, block);
}

uint64_t __27__BRCFSSchedulerBase_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _close];
}

- (OS_dispatch_group)hasWorkGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHasWorkGroup:(id)a3
{
}

- (OS_dispatch_group)hasActiveWorkGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHasActiveWorkGroup:(id)a3
{
}

- (BOOL)hasActiveWork
{
  return self->_hasActiveWork;
}

- (BOOL)hasWork
{
  return self->_hasWork;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (PQLNameInjection)tableName
{
  return (PQLNameInjection *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_hasActiveWorkGroup, 0);
  objc_storeStrong((id *)&self->_hasWorkGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_schedulerWorkloop, 0);
  objc_storeStrong((id *)&self->_schedulerSource, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __53__BRCFSSchedulerBase_initWithSession_name_tableName___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelled%@", v1, 0xCu);
}

- (void)postponeJobID:withThrottle:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.changes <= 1%@", v2, v3, v4, v5, v6);
}

- (void)postponeJobID:withThrottle:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: stamps.state != BRCJobStateInvalid%@", v2, v3, v4, v5, v6);
}

- (void)insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: jobID%@", v2, v3, v4, v5, v6);
}

- (void)rescheduleSuspendedJobsMatching:inState:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: state >= BRCJobStateSuspendedBase%@", v2, v3, v4, v5, v6);
}

- (void)updateStamps:throttle:now:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: throttle%@", v2, v3, v4, v5, v6);
}

- (void)computeStamps:forJobID:throttle:shouldBackoff:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !rs.next%@", v2, v3, v4, v5, v6);
}

- (void)recoverAndReportMissingJobs
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: must be implemented in subclass%@", v2, v3, v4, v5, v6);
}

- (void)scheduleWithBatchSize:whereSQLClause:columns:actionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  int v4 = *(unsigned __int8 *)(v3 + 41);
  int v6 = 138412802;
  if (v4) {
    uint64_t v5 = "with active work";
  }
  else {
    uint64_t v5 = "";
  }
  uint64_t v7 = v2;
  __int16 v8 = 2080;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v0;
  _os_log_debug_impl(&dword_23FA42000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: nothing schedulable, going to sleep %s%@", (uint8_t *)&v6, 0x20u);
}

- (void)scheduleWithBatchSize:whereSQLClause:columns:actionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@: Finishing batch and allowing other jobs to run%@");
}

@end