@interface PLArchiveJob
+ (SEL)recoverSelectorForStage:(int64_t)a3;
+ (SEL)runSelectorForStage:(int64_t)a3;
+ (id)storageQueue;
- (PLArchiveEntry)archiveEntry;
- (PLArchiveJob)initWithManager:(id)a3 andArchiveEntry:(id)a4;
- (PLArchiveJobManager)manager;
- (PLTimer)watchdog;
- (int64_t)stage;
- (unint64_t)numAttempts;
- (void)recover;
- (void)recoverCompress;
- (void)recoverCopy;
- (void)recoverTrim;
- (void)run;
- (void)setArchiveEntry:(id)a3;
- (void)setManager:(id)a3;
- (void)setNumAttempts:(unint64_t)a3;
- (void)setStage:(int64_t)a3;
- (void)setWatchdog:(id)a3;
- (void)stageCompress;
- (void)stageCopy;
- (void)stageRemove;
- (void)stageTrim;
- (void)startWatchdog;
- (void)stopWatchdog;
@end

@implementation PLArchiveJob

- (PLArchiveJob)initWithManager:(id)a3 andArchiveEntry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLArchiveJob;
  v9 = [(PLArchiveJob *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_manager, a3);
    objc_storeStrong((id *)&v10->_archiveEntry, a4);
    [(PLArchiveJob *)v10 recover];
  }

  return v10;
}

+ (id)storageQueue
{
  v2 = +[PLCoreStorage storageQueueNameForClass:objc_opt_class()];
  v3 = +[PLUtilities workQueueForKey:v2];

  return v3;
}

- (void)setStage:(int64_t)a3
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __25__PLArchiveJob_setStage___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (setStage__defaultOnce != -1) {
      dispatch_once(&setStage__defaultOnce, &block);
    }
    if (setStage__classDebugEnabled)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"PLArchiveJob::setStage: stage=%i", a3, block, v13, v14, v15, v16);
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveJob.m"];
      id v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLArchiveJob setStage:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:45];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v11 = [(PLArchiveJob *)self archiveEntry];
  [v11 setStage:a3];
}

BOOL __25__PLArchiveJob_setStage___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  setStage__classDebugEnabled = result;
  return result;
}

- (int64_t)stage
{
  v2 = [(PLArchiveJob *)self archiveEntry];
  int64_t v3 = [v2 stage];

  return v3;
}

- (void)setNumAttempts:(unint64_t)a3
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __31__PLArchiveJob_setNumAttempts___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v5;
    if (setNumAttempts__defaultOnce != -1) {
      dispatch_once(&setNumAttempts__defaultOnce, &block);
    }
    if (setNumAttempts__classDebugEnabled)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"PLArchiveJob::setNumAttempts: numAttempts=%i", a3, block, v15, v16, v17, v18);
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveJob.m"];
      id v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLArchiveJob setNumAttempts:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:53];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v11 = [(PLArchiveJob *)self archiveEntry];
  [v11 setNumAttempts:a3];

  if (a3 >= 0xA)
  {
    objc_super v12 = [(PLArchiveJob *)self manager];
    uint64_t v13 = [(PLArchiveJob *)self archiveEntry];
    [v12 handleFailure:1 forArchiveEntry:v13];
  }
}

BOOL __31__PLArchiveJob_setNumAttempts___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  setNumAttempts__classDebugEnabled = result;
  return result;
}

- (unint64_t)numAttempts
{
  v2 = [(PLArchiveJob *)self archiveEntry];
  unint64_t v3 = [v2 numAttempts];

  return v3;
}

- (void)run
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __19__PLArchiveJob_run__block_invoke;
    v25 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v26 = v3;
    if (run_defaultOnce != -1) {
      dispatch_once(&run_defaultOnce, &block);
    }
    if (run_classDebugEnabled)
    {
      v4 = NSString;
      uint64_t v5 = [(PLArchiveJob *)self archiveEntry];
      v6 = [v5 name];
      id v7 = [v4 stringWithFormat:@"PLArchiveJob::run: archive=%@", v6, block, v23, v24, v25, v26];

      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveJob.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLArchiveJob run]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:67];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if ([(PLArchiveJob *)self stage] == -1) {
    [(PLArchiveJob *)self setStage:0];
  }
  objc_super v12 = +[PLUtilities containerPath];
  uint64_t v13 = [v12 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
  int64_t v14 = +[PLFileStats fileSizeAtPath:v13];
  uint64_t v15 = [(PLArchiveJob *)self archiveEntry];
  [v15 setMainDBSizeAtStart:v14];

  [(PLArchiveJob *)self setNumAttempts:[(PLArchiveJob *)self numAttempts] + 1];
  [(PLArchiveJob *)self startWatchdog];
  if ([(PLArchiveJob *)self stage] <= 4)
  {
    do
    {
      uint64_t v16 = [(PLArchiveJob *)self manager];
      char v17 = [v16 isInterrupted];

      if (v17) {
        break;
      }
      uint64_t v18 = (void *)MEMORY[0x1C1869120]();
      v19 = +[PLArchiveJob runSelectorForStage:[(PLArchiveJob *)self stage]];
      if (v19) {
        ((void (*)(PLArchiveJob *, const char *))[(PLArchiveJob *)self methodForSelector:v19])(self, v19);
      }
      [(PLArchiveJob *)self setStage:[(PLArchiveJob *)self stage] + 1];
    }
    while ([(PLArchiveJob *)self stage] < 5);
  }
  [(PLArchiveJob *)self stopWatchdog];
  v20 = [(PLArchiveJob *)self manager];
  int v21 = [v20 isInterrupted];

  if (v21) {
    [(PLArchiveJob *)self setNumAttempts:[(PLArchiveJob *)self numAttempts] - 1];
  }
}

BOOL __19__PLArchiveJob_run__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  run_classDebugEnabled = result;
  return result;
}

+ (SEL)runSelectorForStage:(int64_t)a3
{
  if (runSelectorForStage__once != -1) {
    dispatch_once(&runSelectorForStage__once, &__block_literal_global_32);
  }
  v4 = (void *)runSelectorForStage___stageToFunction;
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = NSSelectorFromString(v6);
  }
  else {
    id v7 = 0;
  }

  return v7;
}

void __36__PLArchiveJob_runSelectorForStage___block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = &unk_1F1580BE8;
  v0 = NSStringFromSelector(sel_stageStart);
  v8[0] = v0;
  v7[1] = &unk_1F1580C00;
  v1 = NSStringFromSelector(sel_stageCopy);
  v8[1] = v1;
  v7[2] = &unk_1F1580C18;
  v2 = NSStringFromSelector(sel_stageTrim);
  v8[2] = v2;
  v7[3] = &unk_1F1580C30;
  uint64_t v3 = NSStringFromSelector(sel_stageCompress);
  v8[3] = v3;
  v7[4] = &unk_1F1580C48;
  v4 = NSStringFromSelector(sel_stageRemove);
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v6 = (void *)runSelectorForStage___stageToFunction;
  runSelectorForStage___stageToFunction = v5;
}

- (void)stageCopy
{
  uint64_t v3 = +[PowerlogCore sharedCore];
  v4 = [v3 storage];
  uint64_t v5 = [v4 connection];
  v6 = [(PLArchiveJob *)self archiveEntry];
  id v7 = [v6 path];
  [v5 copyDatabaseToPath:v7];

  id v8 = [PLSQLiteConnection alloc];
  id v11 = [(PLArchiveJob *)self archiveEntry];
  v9 = [v11 path];
  v10 = [(PLSQLiteConnection *)v8 initWithFilePath:v9];
  [(PLSQLiteConnection *)v10 closeConnection];
}

- (void)stageTrim
{
  uint64_t v3 = [(PLArchiveJob *)self archiveEntry];
  v4 = [v3 startDate];
  id v13 = +[PLCoreStorage allOperatorTablesToTrimConditionsForTrimDate:v4];

  uint64_t v5 = [PLSQLiteConnection alloc];
  v6 = [(PLArchiveJob *)self archiveEntry];
  id v7 = [v6 path];
  id v8 = [(PLSQLiteConnection *)v5 initWithFilePath:v7];

  v9 = [(PLArchiveJob *)self archiveEntry];
  v10 = [v9 startDate];
  id v11 = [(PLArchiveJob *)self archiveEntry];
  objc_super v12 = [v11 endDate];
  [(PLSQLiteConnection *)v8 trimAllTablesFromDate:v10 toDate:v12 withTableFilters:v13];

  [(PLSQLiteConnection *)v8 vacuum];
  [(PLSQLiteConnection *)v8 closeConnection];
}

- (void)stageCompress
{
  uint64_t v3 = [(PLArchiveJob *)self archiveEntry];
  v4 = [v3 path];
  uint64_t v5 = [(PLArchiveJob *)self archiveEntry];
  v6 = [v5 compressedPath];
  BOOL v7 = +[PLUtilities compressWithSource:v4 withDestination:v6 withLevel:4];

  if (v7)
  {
    id v8 = +[PLUtilities runningAsUser];
    uint64_t v9 = [v8 caseInsensitiveCompare:@"root"];

    if (!v9)
    {
      v10 = getpwnam("mobile");
      id v11 = [(PLArchiveJob *)self archiveEntry];
      id v12 = [v11 compressedPath];
      chown((const char *)[v12 fileSystemRepresentation], v10->pw_uid, v10->pw_gid);
    }
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = [(PLArchiveJob *)self archiveEntry];
    int64_t v14 = [v13 path];
    [v15 removeItemAtPath:v14 error:0];
  }
}

- (void)stageRemove
{
  uint64_t v3 = +[PLArchiveJob storageQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__PLArchiveJob_stageRemove__block_invoke;
  v4[3] = &unk_1E62538C8;
  v4[4] = self;
  +[PLUtilities dispatchSyncIfNotCallerQueue:v3 withBlock:v4];
}

void __27__PLArchiveJob_stageRemove__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) archiveEntry];
  uint64_t v3 = [v2 endDate];
  id v9 = +[PLCoreStorage allOperatorTablesToTrimConditionsForTrimDate:v3];

  v4 = +[PowerlogCore sharedCore];
  uint64_t v5 = [v4 storage];
  v6 = [v5 connection];
  BOOL v7 = [*(id *)(a1 + 32) archiveEntry];
  id v8 = [v7 endDate];
  [v6 trimAllTablesFromDate:v8 toDate:0 withTableFilters:v9];
}

- (void)recover
{
  uint64_t v3 = +[PLArchiveJob recoverSelectorForStage:[(PLArchiveJob *)self stage]];
  if (v3)
  {
    v4 = v3;
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __23__PLArchiveJob_recover__block_invoke;
      uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v17 = v5;
      if (recover_defaultOnce != -1) {
        dispatch_once(&recover_defaultOnce, &block);
      }
      if (recover_classDebugEnabled)
      {
        v6 = NSString;
        int64_t v7 = [(PLArchiveJob *)self stage];
        id v8 = objc_msgSend(v6, "stringWithFormat:", @"PLArchiveManager::recover for stage=%i", v7, block, v14, v15, v16, v17);
        id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveJob.m"];
        v10 = [v9 lastPathComponent];
        id v11 = [NSString stringWithUTF8String:"-[PLArchiveJob recover]"];
        +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:177];

        id v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    ((void (*)(PLArchiveJob *, const char *))[(PLArchiveJob *)self methodForSelector:v4])(self, v4);
  }
}

BOOL __23__PLArchiveJob_recover__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  recover_classDebugEnabled = result;
  return result;
}

+ (SEL)recoverSelectorForStage:(int64_t)a3
{
  if (recoverSelectorForStage__once != -1) {
    dispatch_once(&recoverSelectorForStage__once, &__block_literal_global_58);
  }
  v4 = (void *)recoverSelectorForStage___stageToFunction;
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    int64_t v7 = NSSelectorFromString(v6);
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

void __40__PLArchiveJob_recoverSelectorForStage___block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1F1580C00;
  v0 = NSStringFromSelector(sel_recoverCopy);
  v6[0] = v0;
  v5[1] = &unk_1F1580C18;
  v1 = NSStringFromSelector(sel_recoverTrim);
  v6[1] = v1;
  v5[2] = &unk_1F1580C30;
  v2 = NSStringFromSelector(sel_recoverCompress);
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)recoverSelectorForStage___stageToFunction;
  recoverSelectorForStage___stageToFunction = v3;
}

- (void)recoverCopy
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(PLArchiveJob *)self archiveEntry];
  uint64_t v5 = [v4 path];
  [v3 removeItemAtPath:v5 error:0];

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int64_t v7 = [(PLArchiveJob *)self archiveEntry];
  id v8 = [v7 path];
  id v9 = [v8 stringByAppendingString:@"-shm"];
  [v6 removeItemAtPath:v9 error:0];

  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = [(PLArchiveJob *)self archiveEntry];
  id v12 = [v11 path];
  id v13 = [v12 stringByAppendingString:@"-wal"];
  [v10 removeItemAtPath:v13 error:0];

  id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v14 = [(PLArchiveJob *)self archiveEntry];
  id v15 = [v14 path];
  uint64_t v16 = [v15 stringByAppendingString:@"-journal"];
  [v17 removeItemAtPath:v16 error:0];
}

- (void)recoverTrim
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(PLArchiveJob *)self archiveEntry];
  uint64_t v5 = [v4 path];
  v6 = [v5 stringByAppendingString:@"-shm"];
  [v3 removeItemAtPath:v6 error:0];

  int64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [(PLArchiveJob *)self archiveEntry];
  id v9 = [v8 path];
  v10 = [v9 stringByAppendingString:@"-wal"];
  [v7 removeItemAtPath:v10 error:0];

  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = [(PLArchiveJob *)self archiveEntry];
  id v12 = [v11 path];
  id v13 = [v12 stringByAppendingString:@"-journal"];
  [v14 removeItemAtPath:v13 error:0];
}

- (void)recoverCompress
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [(PLArchiveJob *)self archiveEntry];
  v4 = [v3 compressedPath];
  [v5 removeItemAtPath:v4 error:0];
}

- (void)startWatchdog
{
  uint64_t v3 = [PLTimer alloc];
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3600.0];
  id v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PLArchiveJob_startWatchdog__block_invoke;
  v7[3] = &unk_1E6254400;
  v7[4] = self;
  v6 = [(PLTimer *)v3 initWithFireDate:v4 withInterval:0 withTolerance:0 repeats:v5 withUserInfo:v7 withQueue:0.0 withBlock:0.0];
  [(PLArchiveJob *)self setWatchdog:v6];
}

void __29__PLArchiveJob_startWatchdog__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) manager];
  v2 = [*(id *)(a1 + 32) archiveEntry];
  [v3 handleFailure:0 forArchiveEntry:v2];
}

- (void)stopWatchdog
{
  id v3 = [(PLArchiveJob *)self watchdog];
  [v3 setTimerActive:0];

  v4 = [(PLArchiveJob *)self watchdog];
  [v4 invalidate];

  [(PLArchiveJob *)self setWatchdog:0];
}

- (PLArchiveJobManager)manager
{
  return (PLArchiveJobManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManager:(id)a3
{
}

- (PLArchiveEntry)archiveEntry
{
  return (PLArchiveEntry *)objc_getProperty(self, a2, 16, 1);
}

- (void)setArchiveEntry:(id)a3
{
}

- (PLTimer)watchdog
{
  return (PLTimer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWatchdog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_archiveEntry, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end