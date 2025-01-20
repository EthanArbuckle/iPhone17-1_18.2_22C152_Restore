@interface PLTimeManager
+ (id)sharedInstance;
- (NSDictionary)notificationsToTimeReferences;
- (NSDictionary)timeReferences;
- (PLSQLiteConnection)connection;
- (PLStorageOperator)storageOperator;
- (PLTimeManager)init;
- (double)hourBucketBaseSnapOffsetWithMonotonicTime:(int64_t)a3;
- (double)hourBucketBaseSnapOffsetWithMonotonicTimeNow:(int64_t)a3;
- (double)timeOffsetForTimeReference:(int64_t)a3;
- (double)timeZoneHourBucketShift:(double)a3;
- (id)bucketNSDate:(id)a3 withBucketInterval:(int)a4;
- (id)convertTime:(id)a3 fromTimeReference:(int64_t)a4 toTimeReference:(int64_t)a5;
- (id)currentTimeFromTimeReference:(int64_t)a3 toTimeReference:(int64_t)a4;
- (id)initialMonotonicTime;
- (id)storageQueue;
- (int)bucketTimeStampForDate:(id)a3 withTimeReference:(int64_t)a4 withBucketInterval:(int)a5;
- (void)getBootSessionUUID;
- (void)initializeTimeOffsets;
- (void)logTimeEntry;
- (void)registerForTimeChangedCallbackWithIdentifier:(id)a3 forTimeReference:(int64_t)a4 usingBlock:(id)a5;
- (void)setConnection:(id)a3;
- (void)setNotificationsToTimeReferences:(id)a3;
- (void)setStorageOperator:(id)a3;
- (void)setTimeReferences:(id)a3;
- (void)unregisterForTimeChangedCallbackWithIdentifier:(id)a3 forTimeReference:(int64_t)a4;
@end

@implementation PLTimeManager

- (int)bucketTimeStampForDate:(id)a3 withTimeReference:(int64_t)a4 withBucketInterval:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  [(PLTimeManager *)self hourBucketBaseSnapOffsetWithMonotonicTime:a4];
  double v10 = v9;
  v11 = [(PLTimeManager *)self bucketNSDate:v8 withBucketInterval:v5];
  [v11 timeIntervalSince1970];
  int v13 = (int)v12;

  double v14 = (double)v13;
  int v15 = (int)((double)v13 - v10);
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v16;
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce != -1) {
      dispatch_once(&bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce, block);
    }
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled)
    {
      v17 = NSString;
      v18 = [NSNumber numberWithInteger:a4];
      v19 = [v17 stringWithFormat:@"MonotonicDate %@, timeReference: %@, bucketInterval %d", v8, v18, v5];

      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m"];
      v21 = [v20 lastPathComponent];
      v22 = [NSString stringWithUTF8String:"-[PLTimeManager bucketTimeStampForDate:withTimeReference:withBucketInterval:]"];
      +[PLCoreStorage logMessage:v19 fromFile:v21 fromFunction:v22 fromLineNumber:279];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  int v24 = v15 + v5;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v25 = objc_opt_class();
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_56;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v25;
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_54 != -1) {
      dispatch_once(&bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_54, v55);
    }
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_55)
    {
      v26 = NSString;
      v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v14];
      v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v15];
      v29 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v24];
      v30 = [v26 stringWithFormat:@"BucketTickInSameClock %@ LowerTick %@, UpperTick %@", v27, v28, v29];

      v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m"];
      v32 = [v31 lastPathComponent];
      v33 = [NSString stringWithUTF8String:"-[PLTimeManager bucketTimeStampForDate:withTimeReference:withBucketInterval:]"];
      +[PLCoreStorage logMessage:v30 fromFile:v32 fromFunction:v33 fromLineNumber:281];

      v34 = PLLogCommon();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  [v8 timeIntervalSince1970];
  double v36 = v35;
  BOOL v37 = +[PLDefaults debugEnabled];
  if (v36 < (double)v24)
  {
    if (!v37) {
      goto LABEL_30;
    }
    uint64_t v38 = objc_opt_class();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_62;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v38;
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_60 != -1) {
      dispatch_once(&bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_60, v54);
    }
    if (!bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_61) {
      goto LABEL_30;
    }
    v39 = NSString;
    v40 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v15];
    v41 = [v39 stringWithFormat:@"Returning lowerTick %@", v40];

    v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m"];
    v43 = [v42 lastPathComponent];
    v44 = [NSString stringWithUTF8String:"-[PLTimeManager bucketTimeStampForDate:withTimeReference:withBucketInterval:]"];
    +[PLCoreStorage logMessage:v41 fromFile:v43 fromFunction:v44 fromLineNumber:284];

    v45 = PLLogCommon();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
LABEL_29:

LABEL_30:
    int v24 = v15;
    goto LABEL_31;
  }
  if (v37)
  {
    uint64_t v46 = objc_opt_class();
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_68;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v46;
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_66 != -1) {
      dispatch_once(&bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_66, v53);
    }
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_67)
    {
      v47 = NSString;
      v48 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v24];
      v41 = [v47 stringWithFormat:@"Returning upperTick %@", v48];

      v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m"];
      v50 = [v49 lastPathComponent];
      v51 = [NSString stringWithUTF8String:"-[PLTimeManager bucketTimeStampForDate:withTimeReference:withBucketInterval:]"];
      +[PLCoreStorage logMessage:v41 fromFile:v50 fromFunction:v51 fromLineNumber:287];

      v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
      int v15 = v24;
      goto LABEL_29;
    }
  }
LABEL_31:

  return v24;
}

- (id)bucketNSDate:(id)a3 withBucketInterval:(int)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
  [a3 timeIntervalSince1970];
  double v7 = (double)((int)v6 / a4 * a4);
  return (id)[v5 dateWithTimeIntervalSince1970:v7];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLTimeManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

- (double)hourBucketBaseSnapOffsetWithMonotonicTime:(int64_t)a3
{
  v4 = [(PLTimeManager *)self timeReferences];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];
  [v6 getHourBucketOffset];
  double v8 = v7;

  return v8;
}

- (id)currentTimeFromTimeReference:(int64_t)a3 toTimeReference:(int64_t)a4
{
  double v7 = [(PLTimeManager *)self timeReferences];
  double v8 = [NSNumber numberWithInteger:a3];
  double v9 = [v7 objectForKeyedSubscript:v8];
  double v10 = [v9 currentTime];
  v11 = [(PLTimeManager *)self convertTime:v10 fromTimeReference:a3 toTimeReference:a4];

  return v11;
}

- (id)convertTime:(id)a3 fromTimeReference:(int64_t)a4 toTimeReference:(int64_t)a5
{
  id v8 = a3;
  double v9 = [(PLTimeManager *)self timeReferences];
  double v10 = [NSNumber numberWithInteger:a5];
  v11 = [v9 objectForKeyedSubscript:v10];
  double v12 = [(PLTimeManager *)self timeReferences];
  int v13 = [NSNumber numberWithInteger:a4];
  double v14 = [v12 objectForKeyedSubscript:v13];
  int v15 = [v14 removeTimeOffsetFromReferenceTime:v8];

  uint64_t v16 = [v11 addTimeOffsetToMonotonicTime:v15];

  return v16;
}

- (NSDictionary)timeReferences
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

uint64_t __31__PLTimeManager_sharedInstance__block_invoke()
{
  sharedInstance_instance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (id)storageQueue
{
  v2 = +[PLCoreStorage storageQueueNameForClass:objc_opt_class()];
  v3 = +[PLUtilities workQueueForKey:v2];

  return v3;
}

- (PLTimeManager)init
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PLTimeManager;
  v2 = [(PLTimeManager *)&v19 init];
  if (v2)
  {
    v3 = +[PLSQLiteConnection sharedSQLiteConnection];
    objc_storeWeak((id *)&v2->_connection, v3);

    v4 = [[PLTimeReference alloc] initWithTimeManager:v2 entryDefinitionKey:@"monotonic" timeReferenceType:0];
    uint64_t v5 = [[PLTimeReferenceKernel alloc] initWithTimeManager:v2 entryDefinitionKey:@"kernel" timeReferenceType:2];
    double v6 = [(PLTimeReferenceDynamic *)[PLTimeReferenceSystem alloc] initWithTimeManager:v2 entryDefinitionKey:@"system" timeReferenceType:1];
    double v7 = [[PLTimeReferenceBaseband alloc] initWithTimeManager:v2 entryDefinitionKey:@"baseband" timeReferenceType:3];
    v20[0] = &unk_1F1580618;
    v20[1] = &unk_1F1580630;
    v21[0] = v4;
    v21[1] = v5;
    v20[2] = &unk_1F1580648;
    v20[3] = &unk_1F1580660;
    v21[2] = v6;
    v21[3] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    timeReferences = v2->_timeReferences;
    v2->_timeReferences = (NSDictionary *)v8;

    double v10 = [(id)objc_opt_class() description];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __21__PLTimeManager_init__block_invoke;
    v17[3] = &unk_1E6253F58;
    v11 = v2;
    v18 = v11;
    [(PLTimeReferenceDynamic *)v6 registerForTimeChangedCallbackWithIdentifier:v10 usingBlock:v17];

    double v12 = [(id)objc_opt_class() description];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __21__PLTimeManager_init__block_invoke_25;
    v15[3] = &unk_1E6253F58;
    int v13 = v11;
    uint64_t v16 = v13;
    [(PLTimeReferenceDynamic *)v7 registerForTimeChangedCallbackWithIdentifier:v12 usingBlock:v15];

    [(PLTimeManager *)v13 getBootSessionUUID];
  }
  return v2;
}

uint64_t __21__PLTimeManager_init__block_invoke(uint64_t a1)
{
  v2 = PLLogTimeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __21__PLTimeManager_init__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return [*(id *)(a1 + 32) logTimeEntry];
}

uint64_t __21__PLTimeManager_init__block_invoke_25(uint64_t a1)
{
  v2 = PLLogTimeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __21__PLTimeManager_init__block_invoke_25_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return [*(id *)(a1 + 32) logTimeEntry];
}

- (void)getBootSessionUUID
{
  id v3 = [(PLTimeManager *)self timeReferences];
  v2 = [v3 objectForKeyedSubscript:&unk_1F1580630];
  objc_msgSend(v2, "setRebootOccurred:", +[PLUtilities deviceRebooted](PLUtilities, "deviceRebooted"));
}

- (void)initializeTimeOffsets
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "PLTimeManager::initializeTimeOffsets", v1, 2u);
}

- (id)initialMonotonicTime
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PLTimeManager_initialMonotonicTime__block_invoke;
  block[3] = &unk_1E62538C8;
  block[4] = self;
  if (initialMonotonicTime_onceToken != -1) {
    dispatch_once(&initialMonotonicTime_onceToken, block);
  }
  return (id)initialMonotonicTime_initialMonotonicTime;
}

void __37__PLTimeManager_initialMonotonicTime__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9C8] date];
  v1 = (void *)initialMonotonicTime_initialMonotonicTime;
  initialMonotonicTime_initialMonotonicTime = v0;

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    double v10 = __37__PLTimeManager_initialMonotonicTime__block_invoke_2;
    v11 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v12 = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0, &block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0)
    {
      id v3 = [NSString stringWithFormat:@"PLTimeManager::initialMonotonicTime=%@", initialMonotonicTime_initialMonotonicTime, block, v9, v10, v11, v12];
      uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m"];
      uint64_t v5 = [v4 lastPathComponent];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PLTimeManager initialMonotonicTime]_block_invoke"];
      +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:160];

      uint64_t v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __37__PLTimeManager_initialMonotonicTime__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0 = result;
  return result;
}

- (double)timeOffsetForTimeReference:(int64_t)a3
{
  uint64_t v4 = [(PLTimeManager *)self timeReferences];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  [v6 offset];
  double v8 = v7;

  return v8;
}

- (void)registerForTimeChangedCallbackWithIdentifier:(id)a3 forTimeReference:(int64_t)a4 usingBlock:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  uint64_t v9 = [(PLTimeManager *)self timeReferences];
  double v10 = [NSNumber numberWithInteger:a4];
  v11 = [v9 objectForKeyedSubscript:v10];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    int v13 = [(PLTimeManager *)self timeReferences];
    double v14 = [NSNumber numberWithInteger:a4];
    int v15 = [v13 objectForKeyedSubscript:v14];
    [v15 registerForTimeChangedCallbackWithIdentifier:v16 usingBlock:v8];
  }
}

- (void)unregisterForTimeChangedCallbackWithIdentifier:(id)a3 forTimeReference:(int64_t)a4
{
  id v13 = a3;
  uint64_t v6 = [(PLTimeManager *)self timeReferences];
  double v7 = [NSNumber numberWithInteger:a4];
  id v8 = [v6 objectForKeyedSubscript:v7];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(PLTimeManager *)self timeReferences];
    v11 = [NSNumber numberWithInteger:a4];
    char v12 = [v10 objectForKeyedSubscript:v11];
    [v12 unregisterForTimeChangedCallbackWithIdentifier:v13];
  }
}

- (double)hourBucketBaseSnapOffsetWithMonotonicTimeNow:(int64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v6 = [(PLTimeManager *)self convertTime:v5 fromTimeReference:0 toTimeReference:a3];
  double v7 = [(PLTimeManager *)self bucketNSDate:v6 withBucketInterval:3600];
  id v8 = [(PLTimeManager *)self bucketNSDate:v5 withBucketInterval:3600];
  char v9 = [(PLTimeManager *)self convertTime:v8 fromTimeReference:0 toTimeReference:a3];
  [v9 timeIntervalSinceDate:v7];
  if (v10 >= 0.0) {
    double v11 = v10;
  }
  else {
    double v11 = v10 + 3600.0;
  }
  if (a3 == 1)
  {
    [(PLTimeManager *)self timeZoneHourBucketShift:v11];
    double v11 = v12;
  }

  return v11;
}

- (double)timeZoneHourBucketShift:(double)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  uint64_t v5 = [v4 secondsFromGMT];
  HIDWORD(v6) = -2023406815 * v5 + 9544368;
  LODWORD(v6) = HIDWORD(v6);
  if ((v6 >> 4) >= 0x123457) {
    double v7 = 1800.0;
  }
  else {
    double v7 = 0.0;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLTimeManager_timeZoneHourBucketShift___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (timeZoneHourBucketShift__defaultOnce != -1) {
      dispatch_once(&timeZoneHourBucketShift__defaultOnce, block);
    }
    if (timeZoneHourBucketShift__classDebugEnabled)
    {
      char v9 = objc_msgSend(NSString, "stringWithFormat:", @"OffsetComputation: secondsFromGMT: %ld timeZoneDelta: %f", v5, *(void *)&v7);
      double v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m"];
      double v11 = [v10 lastPathComponent];
      double v12 = [NSString stringWithUTF8String:"-[PLTimeManager timeZoneHourBucketShift:]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:246];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  double v14 = -v7;
  if (v7 >= a3) {
    double v14 = v7;
  }
  double v15 = v14 + a3;

  return v15;
}

BOOL __41__PLTimeManager_timeZoneHourBucketShift___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  timeZoneHourBucketShift__classDebugEnabled = result;
  return result;
}

BOOL __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled = result;
  return result;
}

BOOL __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_56(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_55 = result;
  return result;
}

BOOL __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_62(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_61 = result;
  return result;
}

BOOL __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_68(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_67 = result;
  return result;
}

- (void)logTimeEntry
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities isPowerlogHelperd]
    || +[PLUtilities shouldLogPreUnlockTelemetry])
  {
    id v3 = PLLogTimeManager();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_INFO, "Do not log to time offset table in pre unlock or in helperd case", buf, 2u);
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v4 = [(PLTimeManager *)self timeReferences];
    uint64_t v5 = [v4 allValues];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v10 timeReferenceType])
          {
            double v11 = NSNumber;
            [v10 offset];
            double v12 = objc_msgSend(v11, "numberWithDouble:");
            id v13 = [v10 entryDefinitionKey];
            [v3 setObject:v12 forKeyedSubscript:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);
    }

    double v14 = [(PLTimeManager *)self storageOperator];
    [v14 logEventForwardTimeOffset:v3];
  }
}

- (PLStorageOperator)storageOperator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageOperator);
  return (PLStorageOperator *)WeakRetained;
}

- (void)setStorageOperator:(id)a3
{
}

- (PLSQLiteConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (PLSQLiteConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (void)setTimeReferences:(id)a3
{
}

- (NSDictionary)notificationsToTimeReferences
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNotificationsToTimeReferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsToTimeReferences, 0);
  objc_storeStrong((id *)&self->_timeReferences, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_storageOperator);
}

void __21__PLTimeManager_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, a1, a3, "PLTimeManager::system time changed: delta=%f", a5, a6, a7, a8, 0);
}

void __21__PLTimeManager_init__block_invoke_25_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, a1, a3, "PLTimeManager::baseband time changed: delta=%f", a5, a6, a7, a8, 0);
}

@end