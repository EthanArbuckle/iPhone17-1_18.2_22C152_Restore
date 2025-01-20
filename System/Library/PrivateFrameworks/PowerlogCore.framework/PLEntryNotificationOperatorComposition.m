@interface PLEntryNotificationOperatorComposition
+ (id)canSleepEntryNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)canSleepEntryNotificationWithWorkQueue:(id)a3 withBlock:(id)a4;
+ (id)displayAODNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)displayOffNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)displayOffOrAODNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)displayOnNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)displayOnOrAODNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)displayStateChangeNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)getSBCMaxTimeInterval;
+ (id)getSBCMinTimeInterval;
+ (id)luxEntryNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)requestEntryForEntryKey:(id)a3 forOperator:(id)a4 withTimeout:(double)a5 error:(id *)a6;
+ (id)significantBatteryChangeNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)significantBatteryChangeNotificationWithOperator:(id)a3 withMaxIntervalInSecs:(double)a4 withBlock:(id)a5;
+ (id)sleepEntryNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)smcPowerAccumulatedNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)smcThermalInstantNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)wakeEntryNotificationWithOperator:(id)a3 withBlock:(id)a4;
+ (id)wakeEntryNotificationWithWorkQueue:(id)a3 withBlock:(id)a4;
- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withBlock:(id)a6;
- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withFilter:(id)a6 withBlock:(id)a7;
- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 withBlock:(id)a5;
- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 withFilter:(id)a5 withBlock:(id)a6;
- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withBlock:(id)a6;
- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withFilter:(id)a6 withBlock:(id)a7;
- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 withBlock:(id)a5;
- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 withFilter:(id)a5 withBlock:(id)a6;
- (id)initNotificationTimerWithWorkQueue:(id)a3 withBlock:(id)a4;
- (id)initNotificationTimerWithWorkQueue:(id)a3 withMaxInterval:(double)a4 withBlock:(id)a5;
- (void)requestEntry;
@end

@implementation PLEntryNotificationOperatorComposition

+ (id)requestEntryForEntryKey:(id)a3 forOperator:(id)a4 withTimeout:(double)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__12;
  v33 = __Block_byref_object_dispose__12;
  id v34 = 0;
  context = (void *)MEMORY[0x1C1869120]();
  v11 = dispatch_semaphore_create(1);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = [PLEntryNotificationOperatorComposition alloc];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __96__PLEntryNotificationOperatorComposition_requestEntryForEntryKey_forOperator_withTimeout_error___block_invoke;
  v26[3] = &unk_1E6254DD0;
  v28 = &v29;
  v13 = v11;
  v27 = v13;
  v14 = [(PLEntryNotificationOperatorComposition *)v12 initWithOperator:v10 forEntryKey:v9 withBlock:v26];
  [(PLEntryNotificationOperatorComposition *)v14 requestEntry];
  dispatch_time_t v15 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v16 = (void *)dispatch_semaphore_wait(v13, v15);
  if (v16)
  {
    if (+[PLDefaults debugEnabled])
    {
      v24 = a6;
      v17 = [NSString stringWithFormat:@"ERROR: Timeout requesting %@", v9];
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLEntryNotificationOperatorComposition.m"];
      v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"+[PLEntryNotificationOperatorComposition requestEntryForEntryKey:forOperator:withTimeout:error:]"];
      +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:58];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        [(PLSubmissionFileSP *)(uint64_t)v17 copyAndPrepareLog];
      }

      a6 = v24;
    }
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.powerlogd" code:v16 userInfo:&unk_1F1587188];
  }
  dispatch_semaphore_signal(v13);
  [(PLNSNotificationOperatorComposition *)v14 listenForNotifications:0];

  if (a6 && v16) {
    *a6 = v16;
  }
  id v22 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v22;
}

intptr_t __96__PLEntryNotificationOperatorComposition_requestEntryForEntryKey_forOperator_withTimeout_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"entry"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

+ (id)smcThermalInstantNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PLEntryNotificationOperatorComposition alloc] initWithOperator:v6 forEntryKey:@"PLSMCAgent_EventPoint_ThermalInstantKeys" withBlock:v5];

  return v7;
}

+ (id)smcPowerAccumulatedNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PLEntryNotificationOperatorComposition alloc] initWithOperator:v6 forEntryKey:@"PLSMCAgent_EventBackward_PowerAccumulatedKeys" withBlock:v5];

  return v7;
}

+ (id)luxEntryNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PLEntryNotificationOperatorComposition alloc] initWithOperator:v6 forEntryKey:@"PLDisplayAgent_EventForward_Display" withBlock:v5];

  return v7;
}

+ (id)wakeEntryNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  v7 = [a3 workQueue];
  v8 = [a1 wakeEntryNotificationWithWorkQueue:v7 withBlock:v6];

  return v8;
}

+ (id)wakeEntryNotificationWithWorkQueue:(id)a3 withBlock:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v12 = &unk_1F1580A80;
  v13 = &unk_1F1580A98;
  v14 = @"State";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v10 = [(PLEntryNotificationOperatorComposition *)v7 initWithWorkQueue:v6 forEntryKey:@"PLSleepWakeAgent_EventForward_PowerState" forUpdateOrInsert:1 withFilter:v9 withBlock:v5];

  return v10;
}

+ (id)displayOnNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  dispatch_time_t v15 = &unk_1F1580A80;
  v16 = @"Backlight";
  v17[0] = @"Block";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v17[1] = @"Active";
  v18[0] = v8;
  v13 = &unk_1F1580A80;
  v14 = &unk_1F1580AB0;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v18[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v11 = [(PLEntryNotificationOperatorComposition *)v7 initWithOperator:v6 forEntryKey:@"PLDisplayAgent_EventPoint_Display" withFilter:v10 withBlock:v5];

  return v11;
}

+ (id)displayOffNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  dispatch_time_t v15 = &unk_1F1580A80;
  v16 = @"Backlight";
  v17[0] = @"Block";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v17[1] = @"Active";
  v18[0] = v8;
  v13 = &unk_1F1580A80;
  v14 = &unk_1F1580AC8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v18[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v11 = [(PLEntryNotificationOperatorComposition *)v7 initWithOperator:v6 forEntryKey:@"PLDisplayAgent_EventPoint_Display" withFilter:v10 withBlock:v5];

  return v11;
}

+ (id)displayAODNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  dispatch_time_t v15 = &unk_1F1580A80;
  v16 = @"Backlight";
  v17[0] = @"Block";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v17[1] = @"Active";
  v18[0] = v8;
  v13 = &unk_1F1580A80;
  v14 = &unk_1F1580AE0;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v18[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v11 = [(PLEntryNotificationOperatorComposition *)v7 initWithOperator:v6 forEntryKey:@"PLDisplayAgent_EventPoint_Display" withFilter:v10 withBlock:v5];

  return v11;
}

+ (id)displayOnOrAODNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  dispatch_time_t v15 = &unk_1F1580A80;
  v16 = @"Backlight";
  v17[0] = @"Block";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v17[1] = @"Active";
  v18[0] = v8;
  v13 = &unk_1F1580AF8;
  v14 = &unk_1F1580AC8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v18[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v11 = [(PLEntryNotificationOperatorComposition *)v7 initWithOperator:v6 forEntryKey:@"PLDisplayAgent_EventPoint_Display" withFilter:v10 withBlock:v5];

  return v11;
}

+ (id)displayOffOrAODNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  dispatch_time_t v15 = &unk_1F1580A80;
  v16 = @"Backlight";
  v17[0] = @"Block";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v17[1] = @"Active";
  v18[0] = v8;
  v13 = &unk_1F1580AF8;
  v14 = &unk_1F1580AB0;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v18[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v11 = [(PLEntryNotificationOperatorComposition *)v7 initWithOperator:v6 forEntryKey:@"PLDisplayAgent_EventPoint_Display" withFilter:v10 withBlock:v5];

  return v11;
}

+ (id)displayStateChangeNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v12 = &unk_1F1580A80;
  v13 = @"Backlight";
  v14 = @"Block";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v10 = [(PLEntryNotificationOperatorComposition *)v7 initWithOperator:v6 forEntryKey:@"PLDisplayAgent_EventPoint_Display" withFilter:v9 withBlock:v5];

  return v10;
}

+ (id)significantBatteryChangeNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = +[PLUtilities hasBattery];
  id v9 = [PLEntryNotificationOperatorComposition alloc];
  if (v8)
  {
    v18 = @"Level";
    v17[0] = &unk_1F1584B00;
    v16[0] = &unk_1F1580A98;
    v16[1] = &unk_1F1580B10;
    id v10 = [a1 getSBCMaxTimeInterval];
    v17[1] = v10;
    v16[2] = &unk_1F1580B28;
    v11 = [a1 getSBCMinTimeInterval];
    void v17[2] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    v19[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v14 = [(PLEntryNotificationOperatorComposition *)v9 initWithOperator:v7 forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withFilter:v13 withBlock:v6];
  }
  else
  {
    id v10 = [v7 workQueue];

    v14 = [(PLEntryNotificationOperatorComposition *)v9 initNotificationTimerWithWorkQueue:v10 withBlock:v6];
  }

  return v14;
}

+ (id)significantBatteryChangeNotificationWithOperator:(id)a3 withMaxIntervalInSecs:(double)a4 withBlock:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  BOOL v10 = +[PLUtilities hasBattery];
  v11 = [PLEntryNotificationOperatorComposition alloc];
  if (v10)
  {
    v20 = @"Level";
    v19[0] = &unk_1F1584B00;
    v18[0] = &unk_1F1580A98;
    v18[1] = &unk_1F1580B10;
    v12 = [NSNumber numberWithDouble:a4];
    v19[1] = v12;
    v18[2] = &unk_1F1580B28;
    v13 = [a1 getSBCMinTimeInterval];
    void v19[2] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    v21[0] = v14;
    dispatch_time_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v16 = [(PLEntryNotificationOperatorComposition *)v11 initWithOperator:v9 forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withFilter:v15 withBlock:v8];
  }
  else
  {
    v12 = [v9 workQueue];

    v16 = [(PLEntryNotificationOperatorComposition *)v11 initNotificationTimerWithWorkQueue:v12 withMaxInterval:v8 withBlock:a4];
  }

  return v16;
}

+ (id)getSBCMinTimeInterval
{
  v2 = NSNumber;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __63__PLEntryNotificationOperatorComposition_getSBCMinTimeInterval__block_invoke;
  id v9 = &unk_1E6253E70;
  BOOL v10 = @"SBCMinTimeInterval";
  uint64_t v11 = 0x4072C00000000000;
  if (getSBCMinTimeInterval_defaultOnce != -1) {
    dispatch_once(&getSBCMinTimeInterval_defaultOnce, &v6);
  }
  double v3 = *(double *)&getSBCMinTimeInterval_objectForKey;

  uint64_t v4 = objc_msgSend(v2, "numberWithDouble:", v3, v6, v7, v8, v9);
  return v4;
}

uint64_t __63__PLEntryNotificationOperatorComposition_getSBCMinTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t result = +[PLDefaults doubleForKey:*(void *)(a1 + 32) ifNotSet:*(double *)(a1 + 40)];
  getSBCMinTimeInterval_objectForKey = v2;
  return result;
}

+ (id)getSBCMaxTimeInterval
{
  uint64_t v2 = NSNumber;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __63__PLEntryNotificationOperatorComposition_getSBCMaxTimeInterval__block_invoke;
  id v9 = &unk_1E6253E70;
  BOOL v10 = @"SBCMaxTimeInterval";
  uint64_t v11 = 0x409C200000000000;
  if (getSBCMaxTimeInterval_defaultOnce != -1) {
    dispatch_once(&getSBCMaxTimeInterval_defaultOnce, &v6);
  }
  double v3 = *(double *)&getSBCMaxTimeInterval_objectForKey;

  uint64_t v4 = objc_msgSend(v2, "numberWithDouble:", v3, v6, v7, v8, v9);
  return v4;
}

uint64_t __63__PLEntryNotificationOperatorComposition_getSBCMaxTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t result = +[PLDefaults doubleForKey:*(void *)(a1 + 32) ifNotSet:*(double *)(a1 + 40)];
  getSBCMaxTimeInterval_objectForKey = v2;
  return result;
}

+ (id)canSleepEntryNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 workQueue];
  id v8 = [a1 canSleepEntryNotificationWithWorkQueue:v7 withBlock:v6];

  return v8;
}

+ (id)canSleepEntryNotificationWithWorkQueue:(id)a3 withBlock:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [PLEntryNotificationOperatorComposition alloc];
  dispatch_time_t v15 = &unk_1F1580A80;
  v16 = &unk_1F1580B40;
  v17[0] = @"State";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v17[1] = @"Event";
  v18[0] = v8;
  v13 = &unk_1F1580A80;
  v14 = &unk_1F1580A80;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v18[1] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  uint64_t v11 = [(PLEntryNotificationOperatorComposition *)v7 initWithWorkQueue:v6 forEntryKey:@"PLSleepWakeAgent_EventForward_PowerState" forUpdateOrInsert:1 withFilter:v10 withBlock:v5];

  return v11;
}

+ (id)sleepEntryNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [PLEntryNotificationOperatorComposition alloc];
  v12 = &unk_1F1580A80;
  v13 = &unk_1F1580B40;
  v14 = @"State";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  BOOL v10 = [(PLEntryNotificationOperatorComposition *)v7 initWithOperator:v6 forEntryKey:@"PLSleepWakeAgent_EventForward_PowerState" withFilter:v9 withBlock:v5];

  return v10;
}

- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withBlock:(id)a6
{
  int v9 = (unsigned __int16)a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = objc_opt_new();
  v14 = v13;
  if ((v9 - 1) <= 1) {
    [v13 addObject:v11];
  }
  if ((v9 & 0xFFFFFFFD) == 0)
  {
    dispatch_time_t v15 = [NSString stringWithFormat:@"%@_update", v11];
    [v14 addObject:v15];
  }
  v18.receiver = self;
  v18.super_class = (Class)PLEntryNotificationOperatorComposition;
  v16 = [(PLNSNotificationOperatorComposition *)&v18 initWithWorkQueue:v10 forNotifications:v14 withBlock:v12];

  return v16;
}

- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withBlock:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = [a3 workQueue];
  v13 = [(PLEntryNotificationOperatorComposition *)self initWithWorkQueue:v12 forEntryKey:v11 forUpdateOrInsert:v6 withBlock:v10];

  return v13;
}

- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withFilter:(id)a6 withBlock:(id)a7
{
  uint64_t v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  dispatch_time_t v15 = [a3 workQueue];
  v16 = [(PLEntryNotificationOperatorComposition *)self initWithWorkQueue:v15 forEntryKey:v14 forUpdateOrInsert:v8 withFilter:v13 withBlock:v12];

  return v16;
}

- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withFilter:(id)a6 withBlock:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v11 = (unsigned __int16)a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = objc_opt_new();
  v17 = objc_opt_new();
  objc_super v18 = +[PLEntryDefinition notificationNameForEntryKey:v13 withFilterDefintion:v14];
  if ((v11 - 1) <= 1)
  {
    [v16 addObject:v18];
    v19 = [NSString stringWithFormat:@"requestingFilter.%@", v13];
    [v17 addObject:v19];
  }
  if ((v11 & 0xFFFFFFFD) == 0)
  {
    v20 = [NSString stringWithFormat:@"%@_update", v18];
    [v16 addObject:v20];
  }
  v38.receiver = self;
  v38.super_class = (Class)PLEntryNotificationOperatorComposition;
  v21 = [(PLNSNotificationOperatorComposition *)&v38 initWithWorkQueue:v12 forNotifications:v16 withBlock:v15];
  if (v21)
  {
    v30 = v18;
    uint64_t v31 = v17;
    id v32 = v15;
    id v33 = v12;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v22 = v17;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v28 postNotificationName:v27 object:0 userInfo:v14];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v24);
    }

    id v12 = v33;
    v17 = v31;
    id v15 = v32;
    objc_super v18 = v30;
  }

  return v21;
}

- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 withBlock:(id)a5
{
  return [(PLEntryNotificationOperatorComposition *)self initWithWorkQueue:a3 forEntryKey:a4 forUpdateOrInsert:1 withBlock:a5];
}

- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 withBlock:(id)a5
{
  return [(PLEntryNotificationOperatorComposition *)self initWithOperator:a3 forEntryKey:a4 forUpdateOrInsert:1 withBlock:a5];
}

- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 withFilter:(id)a5 withBlock:(id)a6
{
  return [(PLEntryNotificationOperatorComposition *)self initWithWorkQueue:a3 forEntryKey:a4 forUpdateOrInsert:1 withFilter:a5 withBlock:a6];
}

- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 withFilter:(id)a5 withBlock:(id)a6
{
  return [(PLEntryNotificationOperatorComposition *)self initWithOperator:a3 forEntryKey:a4 forUpdateOrInsert:1 withFilter:a5 withBlock:a6];
}

- (void)requestEntry
{
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v3 = NSString;
  uint64_t v4 = [(PLNSNotificationOperatorComposition *)self notificationName];
  id v5 = [v3 stringWithFormat:@"requesting.%@", v4];
  [v6 postNotificationName:v5 object:0];
}

- (id)initNotificationTimerWithWorkQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLEntryNotificationOperatorComposition *)self initNotificationTimerWithWorkQueue:v7 withMaxInterval:v6 withBlock:(double)+[PLDefaults longForKey:@"sbcLoggingInterval" ifNotSet:1800]];

  return v8;
}

- (id)initNotificationTimerWithWorkQueue:(id)a3 withMaxInterval:(double)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!notificationTimer)
  {
    id v10 = [PLTimer alloc];
    int v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a4];
    id v12 = dispatch_get_global_queue(-2, 0);
    uint64_t v13 = [(PLTimer *)v10 initWithFireDate:v11 withInterval:1 withTolerance:0 repeats:v12 withUserInfo:&__block_literal_global_27 withQueue:a4 withBlock:0.0];
    id v14 = (void *)notificationTimer;
    notificationTimer = v13;
  }
  v17.receiver = self;
  v17.super_class = (Class)PLEntryNotificationOperatorComposition;
  id v15 = [(PLNSNotificationOperatorComposition *)&v17 initWithWorkQueue:v8 forNotification:@"PLTimerFiredNotification" withBlock:v9];

  return v15;
}

void __103__PLEntryNotificationOperatorComposition_initNotificationTimerWithWorkQueue_withMaxInterval_withBlock___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"PLTimerFiredNotification" object:0];
}

@end