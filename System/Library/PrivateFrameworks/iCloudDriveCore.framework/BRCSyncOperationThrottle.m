@interface BRCSyncOperationThrottle
+ (BOOL)supportsSecureCoding;
- (BOOL)isSyncDown;
- (BOOL)scheduleIfPossibleWithCurrentTimestamp:(int64_t)a3 signalSourceIfFailed:(id)a4 description:(id)a5;
- (BOOL)updateForClearingOutOfQuota;
- (BRCSyncOperationThrottle)initWithCoder:(id)a3;
- (BRCSyncOperationThrottle)initWithMangledID:(id)a3 isSyncDown:(BOOL)a4;
- (BRMangledID)mangledID;
- (double)delay;
- (double)nextTry;
- (id)description;
- (int)lastErrorKind;
- (void)clear;
- (void)encodeWithCoder:(id)a3;
- (void)graceNextRequest;
- (void)setMangledID:(id)a3;
- (void)updateAfterSchedulingTask;
- (void)updateAfterSchedulingTaskWithMinimumDelay:(double)a3;
- (void)updateForError:(id)a3;
@end

@implementation BRCSyncOperationThrottle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCSyncOperationThrottle)initWithMangledID:(id)a3 isSyncDown:(BOOL)a4
{
  id v7 = a3;
  v8 = [(BRCSyncOperationThrottle *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mangledID, a3);
    v9->_isSyncDown = a4;
    v10 = v9;
    v11 = [(BRCSyncOperationThrottle *)v10 mangledID];
    v12 = +[BRCUserDefaults defaultsForMangledID:v11];

    if (v9->_isSyncDown) {
      [v12 syncDownThrottle];
    }
    else {
    v13 = [v12 syncUpThrottle];
    }

    [v13 minWait];
    v10->_delay = v14;
  }
  return v9;
}

- (BRCSyncOperationThrottle)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BRCSyncOperationThrottle *)self init];
  if (v5)
  {
    v5->_isSyncDown = [v4 decodeBoolForKey:@"t"];
    [v4 decodeDoubleForKey:@"d"];
    v5->_delay = v6;
    [v4 decodeDoubleForKey:@"e"];
    v5->_nextTry = v7;
    v5->_lastErrorKind = [v4 decodeIntForKey:@"k"];
    v5->_graceNextRequest = [v4 decodeBoolForKey:@"g"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeBool:self->_isSyncDown forKey:@"t"];
  [v5 encodeDouble:@"d" forKey:self->_delay];
  [v5 encodeDouble:@"e" forKey:self->_nextTry];
  uint64_t lastErrorKind = self->_lastErrorKind;
  if (lastErrorKind) {
    [v5 encodeInt:lastErrorKind forKey:@"k"];
  }
  if (self->_graceNextRequest) {
    [v5 encodeBool:1 forKey:@"g"];
  }
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@ delay:%.1fs id:%@", objc_opt_class(), *(void *)&self->_delay, self->_mangledID];
  id v4 = v3;
  if (self->_graceNextRequest) {
    [v3 appendString:@" graced"];
  }
  id v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  double nextTry = self->_nextTry;
  if (nextTry >= v7) {
    objc_msgSend(v4, "appendFormat:", @" next-try in %.1fs>", nextTry - v7);
  }
  else {
    [v4 appendString:@" expired>"];
  }
  return v4;
}

- (void)updateAfterSchedulingTaskWithMinimumDelay:(double)a3
{
  id v4 = self;
  id v5 = [(BRCSyncOperationThrottle *)v4 mangledID];
  double v6 = +[BRCUserDefaults defaultsForMangledID:v5];

  LODWORD(v5) = v4->_isSyncDown;
  if (v5) {
    [v6 syncDownThrottle];
  }
  else {
  id v24 = [v6 syncUpThrottle];
  }

  double v7 = [MEMORY[0x263EFF910] date];
  [v7 timeIntervalSince1970];
  double v9 = v8;

  double v10 = v9 - v4->_nextTry;
  [v24 inactivityKickbackDelay];
  double v12 = v10 - v11;
  [v24 inactivityKickbackRatio];
  double v14 = v12 * v13;
  [v24 minWait];
  if (v15 > a3)
  {
    [v24 minWait];
    a3 = v16;
  }
  double delay = v4->_delay;
  if (v14 < delay || delay <= a3)
  {
    v19 = v24;
  }
  else
  {
    do
    {
      double v14 = v14 - delay;
      [v24 ratioOnSuccess];
      v19 = v24;
      double delay = v20 * v4->_delay;
      v4->_double delay = delay;
    }
    while (v14 >= delay && delay > a3);
  }
  if (delay < a3)
  {
    v4->_double delay = a3;
    double delay = a3;
  }
  id v25 = v19;
  [v19 maxWait];
  if (delay <= v22)
  {
    double v23 = v4->_delay;
  }
  else
  {
    [v25 maxWait];
    v4->_double delay = v23;
  }
  v4->_double nextTry = v9 + v23;
  v4->_graceNextRequest = 0;
}

- (void)updateAfterSchedulingTask
{
}

- (BOOL)updateForClearingOutOfQuota
{
  int lastErrorKind = self->_lastErrorKind;
  if (lastErrorKind == 2)
  {
    id v4 = self;
    id v5 = [(BRCSyncOperationThrottle *)v4 mangledID];
    double v6 = +[BRCUserDefaults defaultsForMangledID:v5];

    BOOL isSyncDown = v4->_isSyncDown;
    if (isSyncDown) {
      [v6 syncDownThrottle];
    }
    else {
    double v8 = [v6 syncUpThrottle];
    }

    v4->_double nextTry = v4->_nextTry - v4->_delay;
    [v8 ratioOnQuotaErrorClear];
    double v10 = v9 * v4->_delay;
    v4->_double delay = v10;
    [v8 minWait];
    if (v10 >= v11) {
      double v11 = v10;
    }
    double v12 = v4->_nextTry + v11;
    v4->_double delay = v11;
    v4->_double nextTry = v12;
    self->_int lastErrorKind = 0;
  }
  return lastErrorKind == 2;
}

- (void)updateForError:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  double v6 = [(BRCSyncOperationThrottle *)v5 mangledID];
  double v7 = +[BRCUserDefaults defaultsForMangledID:v6];

  BOOL isSyncDown = v5->_isSyncDown;
  if (isSyncDown) {
    [v7 syncDownThrottle];
  }
  else {
  double v9 = [v7 syncUpThrottle];
  }

  int v10 = objc_msgSend(v4, "brc_syncOperationErrorKind");
  double v11 = [MEMORY[0x263EFF910] date];
  [v11 timeIntervalSince1970];
  double v13 = v12;

  if (!v4 || v10 == -1)
  {
    if (v5->_lastErrorKind == 2)
    {
      [v9 ratioOnQuotaErrorClear];
      v5->_double delay = v20 * v5->_delay;
    }
    [v9 ratioOnSuccess];
    double v17 = v21 * v5->_delay;
    v5->_double delay = v17;
    [v9 minWait];
    if (v17 < v22) {
      double v17 = v22;
    }
    goto LABEL_21;
  }
  if (v10 != 1)
  {
    if (v5->_isSyncDown && objc_msgSend(v4, "br_isCloudDocsErrorCode:", 32))
    {
      [v9 ratioOnSuccess];
      v5->_double delay = v5->_delay / v14;
    }
    [v9 ratioOnFailure];
    v5->_double delay = v15 * v5->_delay;
  }
  objc_msgSend(v4, "br_suggestedRetryTimeInterval");
  if (v16 != 0.0)
  {
    double v17 = v16;
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      double delay = v5->_delay;
      int v27 = 134218498;
      double v28 = v17;
      __int16 v29 = 2048;
      double v30 = delay;
      __int16 v31 = 2112;
      v32 = v18;
      _os_log_debug_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] server provided backoff %.03fs (delay %.03fs)%@", (uint8_t *)&v27, 0x20u);
    }

    if (v5->_delay >= v17) {
      double v17 = v5->_delay;
    }
LABEL_21:
    v5->_double delay = v17;
    goto LABEL_22;
  }
  double v17 = v5->_delay;
LABEL_22:
  [v9 maxWait];
  if (v17 < v23) {
    double v23 = v17;
  }
  v5->_double delay = v23;
  id v24 = brc_bread_crumbs();
  id v25 = brc_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    [(BRCSyncOperationThrottle *)(uint64_t)v5 updateForError:v25];
  }

  v5->_int lastErrorKind = v10;
  v5->_double nextTry = v13 + v5->_delay;
}

- (void)clear
{
  self->_graceNextRequest = 0;
  self->_double delay = 0.0;
  self->_double nextTry = 0.0;
}

- (double)nextTry
{
  v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  double delay = 0.0;
  if (!self->_graceNextRequest) {
    double delay = self->_delay;
  }
  double result = v5 + delay;
  if (self->_nextTry < result) {
    double result = self->_nextTry;
  }
  self->_double nextTry = result;
  return result;
}

- (void)graceNextRequest
{
  self->_graceNextRequest = 1;
}

- (double)delay
{
  return self->_delay;
}

- (BOOL)isSyncDown
{
  return self->_isSyncDown;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (void)setMangledID:(id)a3
{
}

- (int)lastErrorKind
{
  return self->_lastErrorKind;
}

- (void).cxx_destruct
{
}

- (BOOL)scheduleIfPossibleWithCurrentTimestamp:(int64_t)a3 signalSourceIfFailed:(id)a4 description:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  double v9 = (__CFString *)a5;
  [(BRCSyncOperationThrottle *)self nextTry];
  uint64_t v10 = brc_interval_to_nsec();
  if (v10 - a3 >= 0x2540BE401)
  {
    double v11 = brc_bread_crumbs();
    double v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if ([(BRCSyncOperationThrottle *)self isSyncDown]) {
        double v20 = @"down";
      }
      else {
        double v20 = @"up";
      }
      brc_interval_from_nsec();
      int v24 = 138413314;
      id v25 = v9;
      __int16 v26 = 2112;
      int v27 = v20;
      __int16 v28 = 2048;
      __int16 v29 = v21;
      __int16 v30 = 2112;
      __int16 v31 = self;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ sync-%@ is throttled for more than 10s: %.1fs (%@)%@", (uint8_t *)&v24, 0x34u);
    }
  }
  if (v10 > a3)
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v15 = brc_bread_crumbs();
      double v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncOperationThrottle(SchedulingAdditions) scheduleIfPossibleWithCurrentTimestamp:signalSourceIfFailed:description:]((uint64_t)v15, v16);
      }
    }
    else
    {
      double v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncOperationThrottle(SchedulingAdditions) scheduleIfPossibleWithCurrentTimestamp:signalSourceIfFailed:description:](v10 - a3, (uint64_t)v17, v18);
      }

      [v8 signalWithDeadline:v10];
    }
  }
  else
  {
    double v13 = brc_bread_crumbs();
    double v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      BOOL v22 = [(BRCSyncOperationThrottle *)self isSyncDown];
      double v23 = @"up";
      int v24 = 138412802;
      if (v22) {
        double v23 = @"down";
      }
      id v25 = v23;
      __int16 v26 = 2112;
      int v27 = v9;
      __int16 v28 = 2112;
      __int16 v29 = v13;
      _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] syncing %@ %@%@", (uint8_t *)&v24, 0x20u);
    }

    [(BRCSyncOperationThrottle *)self updateAfterSchedulingTask];
  }

  return v10 <= a3;
}

- (void)updateForError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: Updated sync throttle %@%@", (uint8_t *)&v3, 0x16u);
}

@end