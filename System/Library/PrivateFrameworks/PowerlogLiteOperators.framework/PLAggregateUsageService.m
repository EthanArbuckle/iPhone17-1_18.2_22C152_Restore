@interface PLAggregateUsageService
+ (id)defaults;
+ (void)load;
- (PLAggregateUsageService)init;
- (PLEntryNotificationOperatorComposition)audioEntryNotification;
- (PLEntryNotificationOperatorComposition)batteryExternalConnectedEntryNotification;
- (PLEntryNotificationOperatorComposition)batteryIsChargingEntryNotification;
- (PLEntryNotificationOperatorComposition)chargingEntryNotification;
- (PLEntryNotificationOperatorComposition)displayOffNotification;
- (PLEntryNotificationOperatorComposition)displayOnNotification;
- (PLEntryNotificationOperatorComposition)lockStateEntryNotification;
- (PLEntryNotificationOperatorComposition)sleepEntryNotification;
- (PLEntryNotificationOperatorComposition)wakeEntryNotification;
- (PLIntervalData)intervalData;
- (int)numIntervalsToFill;
- (void)handleAudioStateChange:(id)a3;
- (void)handleChargingChange:(id)a3;
- (void)handleConnectedChange:(id)a3;
- (void)handleExternalConnectedChange:(id)a3;
- (void)handleLargeTimeGap;
- (void)handleLockStateChange:(id)a3;
- (void)handleScreenStateChange:(id)a3 withState:(BOOL)a4;
- (void)handleWakeStateChange:(id)a3 withState:(BOOL)a4;
- (void)initOperatorDependancies;
- (void)initializeMetrics;
- (void)instantiateMetrics;
- (void)registerForEntryNotifications;
- (void)scheduleSubmissionAfter:(unint64_t)a3;
- (void)setAudioEntryNotification:(id)a3;
- (void)setBatteryExternalConnectedEntryNotification:(id)a3;
- (void)setBatteryIsChargingEntryNotification:(id)a3;
- (void)setChargingEntryNotification:(id)a3;
- (void)setDisplayOffNotification:(id)a3;
- (void)setDisplayOnNotification:(id)a3;
- (void)setIntervalData:(id)a3;
- (void)setLockStateEntryNotification:(id)a3;
- (void)setSleepEntryNotification:(id)a3;
- (void)setWakeEntryNotification:(id)a3;
- (void)submitMetricsToAggd;
- (void)updateSampledMetrics;
@end

@implementation PLAggregateUsageService

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_230(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleAudioStateChange:a2];
}

- (void)handleAudioStateChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLAggregateUsageService *)self submitMetricsToAggd];
  v5 = [v4 objectForKey:@"entry"];

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:@"Active"];
    uint64_t v7 = [v6 BOOLValue];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __50__PLAggregateUsageService_handleAudioStateChange___block_invoke;
      v22 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v23 = v8;
      if (qword_1EBD58C30 != -1) {
        dispatch_once(&qword_1EBD58C30, &block);
      }
      if (byte_1EBD58BCF)
      {
        v9 = @"OFF";
        if (v7) {
          v9 = @"ON";
        }
        v10 = [NSString stringWithFormat:@"Handle audio %@", v9, block, v20, v21, v22, v23];
        v11 = (void *)MEMORY[0x1E4F929B8];
        v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
        v13 = [v12 lastPathComponent];
        v14 = [NSString stringWithUTF8String:"-[PLAggregateUsageService handleAudioStateChange:]"];
        [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:609];

        v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v10;
          _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v16 = [(PLAggregateUsageService *)self intervalData];
    v17 = [v5 entryDate];
    v18 = [v17 convertFromMonotonicToSystem];
    [v16 updateMetric:@"AudioOnDuration" withTimestamp:v18 forEvent:v7 withValue:0xFFFFFFFFLL];
  }
}

- (void)submitMetricsToAggd
{
  int v3 = [(PLAggregateUsageService *)self numIntervalsToFill];
  if (v3 >= 1)
  {
    int v4 = v3;
    do
    {
      if (v4 == 1) {
        [(PLAggregateUsageService *)self updateSampledMetrics];
      }
      v5 = [(PLAggregateUsageService *)self intervalData];
      [v5 submitIntervalData];

      --v4;
    }
    while (v4);
  }
}

- (int)numIntervalsToFill
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1C9C8] date];
  int v4 = [(PLAggregateUsageService *)self intervalData];
  v5 = [v4 currentInterval];
  [v3 timeIntervalSinceDate:v5];
  int v7 = (int)v6;

  if (v7 < 0)
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_22;
    }
    uint64_t v17 = objc_opt_class();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __45__PLAggregateUsageService_numIntervalsToFill__block_invoke;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v17;
    if (qword_1EBD58C78 != -1) {
      dispatch_once(&qword_1EBD58C78, v26);
    }
    if (!byte_1EBD58BD6)
    {
LABEL_22:
      LODWORD(v8) = 0;
      return v8;
    }
    v11 = [NSString stringWithFormat:@"Intervals to fill = 0"];
    v18 = (void *)MEMORY[0x1E4F929B8];
    v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
    uint64_t v20 = [v19 lastPathComponent];
    v21 = [NSString stringWithUTF8String:"-[PLAggregateUsageService numIntervalsToFill]"];
    [v18 logMessage:v11 fromFile:v20 fromFunction:v21 fromLineNumber:724];

    v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    LODWORD(v8) = 0;
    goto LABEL_21;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_307;
  block[3] = &unk_1E692A250;
  block[4] = self;
  if (qword_1EBD58C80 != -1) {
    dispatch_once(&qword_1EBD58C80, block);
  }
  uint64_t v8 = (v7 / (int)*(double *)&qword_1EBD58C88 + 1);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_2;
  v24[3] = &unk_1E692A250;
  v24[4] = self;
  if (qword_1EBD58C90 != -1) {
    dispatch_once(&qword_1EBD58C90, v24);
  }
  double v9 = 86400.0 / *(double *)&qword_1EBD58C98;
  if (86400.0 / *(double *)&qword_1EBD58C98 < (double)(int)v8)
  {
    [(PLAggregateUsageService *)self handleLargeTimeGap];
    uint64_t v8 = 0;
  }
  if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", v9))
  {
    uint64_t v10 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_3;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = v10;
    if (qword_1EBD58CA0 != -1) {
      dispatch_once(&qword_1EBD58CA0, v23);
    }
    if (byte_1EBD58BD7)
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Intervals to fill = %d", v8);
      v12 = (void *)MEMORY[0x1E4F929B8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLAggregateUsageService numIntervalsToFill]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:732];

      v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
LABEL_21:
    }
  }
  return v8;
}

- (PLIntervalData)intervalData
{
  return (PLIntervalData *)objc_getProperty(self, a2, 120, 1);
}

+ (id)defaults
{
  return &unk_1F29EA5A8;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAggregateUsageService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLAggregateUsageService)init
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || ([MEMORY[0x1E4F92A38] nonUIBuild] & 1) != 0)
  {
    int v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLAggregateUsageService;
    self = [(PLOperator *)&v5 init];
    int v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  [(PLAggregateUsageService *)self instantiateMetrics];
  int v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  unint64_t v5 = (unint64_t)v4;

  [(PLOperator *)self defaultDoubleForKey:@"IntervalDuration"];
  unint64_t v7 = (unint64_t)v6 + v5 / (unint64_t)v6 * (unint64_t)v6 - v5;
  unint64_t v8 = (unint64_t)v6 + v5 / (unint64_t)v6 * (unint64_t)v6;
  double v9 = [(PLAggregateUsageService *)self intervalData];
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v8];
  [v9 setCurrentInterval:v10];

  [(PLAggregateUsageService *)self initializeMetrics];
  [(PLAggregateUsageService *)self registerForEntryNotifications];
  [(PLAggregateUsageService *)self scheduleSubmissionAfter:v7];
}

- (void)instantiateMetrics
{
  int v3 = objc_alloc_init(PLIntervalData);
  intervalData = self->_intervalData;
  self->_intervalData = v3;

  unint64_t v5 = self->_intervalData;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PLAggregateUsageService_instantiateMetrics__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  if (qword_1EBD58C00 != -1) {
    dispatch_once(&qword_1EBD58C00, block);
  }
  [(PLIntervalData *)v5 setIntervalDuration:(int)*(double *)&qword_1EBD58C08];
  double v6 = self->_intervalData;
  unint64_t v7 = [[PLMetric alloc] initWithKey:@"ScreenOnDuration" withPosition:1 withNumBits:3 withDefault:0 andType:0];
  [(PLIntervalData *)v6 addMetric:v7];

  unint64_t v8 = self->_intervalData;
  double v9 = [[PLMetric alloc] initWithKey:@"WakeDuration" withPosition:4 withNumBits:3 withDefault:0 andType:0];
  [(PLIntervalData *)v8 addMetric:v9];

  uint64_t v10 = self->_intervalData;
  v11 = [[PLMetric alloc] initWithKey:@"AudioOnDuration" withPosition:7 withNumBits:3 withDefault:0 andType:0];
  [(PLIntervalData *)v10 addMetric:v11];

  v12 = self->_intervalData;
  v13 = [[PLMetric alloc] initWithKey:@"ConnectedState" withPosition:17 withNumBits:1 withDefault:0 andType:1];
  [(PLIntervalData *)v12 addMetric:v13];

  v14 = self->_intervalData;
  v15 = [[PLMetric alloc] initWithKey:@"ChargingState" withPosition:18 withNumBits:1 withDefault:0 andType:1];
  [(PLIntervalData *)v14 addMetric:v15];

  v16 = self->_intervalData;
  uint64_t v17 = [[PLMetric alloc] initWithKey:@"AdapterType" withPosition:19 withNumBits:3 withDefault:0 andType:1];
  [(PLIntervalData *)v16 addMetric:v17];

  v18 = self->_intervalData;
  v19 = [[PLMetric alloc] initWithKey:@"ChargerCurrent" withPosition:22 withNumBits:5 withDefault:0 andType:1];
  [(PLIntervalData *)v18 addMetric:v19];

  uint64_t v20 = self->_intervalData;
  v21 = [[PLMetric alloc] initWithKey:@"ChargerVoltage" withPosition:27 withNumBits:5 withDefault:0 andType:1];
  [(PLIntervalData *)v20 addMetric:v21];

  v22 = self->_intervalData;
  uint64_t v23 = [[PLMetric alloc] initWithKey:@"LockState" withPosition:32 withNumBits:1 withDefault:0 andType:1];
  [(PLIntervalData *)v22 addMetric:v23];

  v24 = self->_intervalData;
  v25 = [[PLMetric alloc] initWithKey:@"BatteryLevel" withPosition:10 withNumBits:7 withDefault:127 andType:2];
  [(PLIntervalData *)v24 addMetric:v25];

  uint64_t v26 = self->_intervalData;
  v27 = [[PLMetric alloc] initWithKey:@"PowerlogInit" withPosition:0 withNumBits:1 withDefault:0 andType:2];
  [(PLIntervalData *)v26 addMetric:v27];

  v28 = self->_intervalData;
  uint64_t v29 = [[PLMetric alloc] initWithKey:@"BatteryTemperature" withPosition:33 withNumBits:4 withDefault:1000 andType:2];
  [(PLIntervalData *)v28 addMetric:v29];
}

uint64_t __45__PLAggregateUsageService_instantiateMetrics__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"IntervalDuration"];
  qword_1EBD58C08 = v2;
  return result;
}

- (void)initializeMetrics
{
  uint64_t v3 = *MEMORY[0x1E4F92D30];
  double v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"PowerState"];
  unint64_t v5 = [(PLOperator *)self storage];
  double v6 = [v5 lastEntryForKey:v4];

  v36 = v6;
  if (v6)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLAggregateUsageService_initializeMetrics__block_invoke;
    block[3] = &unk_1E692A250;
    block[4] = self;
    if (qword_1EBD58C10 != -1) {
      dispatch_once(&qword_1EBD58C10, block);
    }
    double v8 = -*(double *)&qword_1EBD58C18;
    double v9 = [(PLAggregateUsageService *)self intervalData];
    uint64_t v10 = [v9 currentInterval];
    v11 = [v7 dateWithTimeInterval:v10 sinceDate:v8];

    v12 = [v6 objectForKeyedSubscript:@"State"];
    BOOL v13 = [v12 intValue] == 0;

    v14 = [(PLAggregateUsageService *)self intervalData];
    [v14 updateMetric:@"WakeDuration" withTimestamp:v11 forEvent:v13 withValue:0xFFFFFFFFLL];
  }
  v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];
  v16 = [(PLOperator *)self storage];
  uint64_t v17 = [v16 lastEntryForKey:v15];

  if (v17)
  {
    v18 = [(PLAggregateUsageService *)self intervalData];
    v19 = [v17 objectForKeyedSubscript:@"Level"];
    objc_msgSend(v18, "updateMetric:withTimestamp:forEvent:withValue:", @"BatteryLevel", 0, 1, objc_msgSend(v19, "intValue"));

    uint64_t v20 = [(PLAggregateUsageService *)self intervalData];
    v21 = [v17 objectForKeyedSubscript:@"Temperature"];
    objc_msgSend(v20, "updateMetric:withTimestamp:forEvent:withValue:", @"BatteryTemperature", 0, 1, objc_msgSend(v21, "intValue"));
  }
  v22 = +[PLOperator entryKeyForType:v3 andName:@"SBLock"];
  uint64_t v23 = [(PLOperator *)self storage];
  v24 = [v23 lastEntryForKey:v22];

  if (v24)
  {
    v25 = [v24 objectForKeyedSubscript:@"Locked"];
    v35 = v17;
    uint64_t v26 = [v25 BOOLValue] ^ 1;
    v27 = [(PLAggregateUsageService *)self intervalData];
    v28 = [v24 entryDate];
    [v28 convertFromMonotonicToSystem];
    uint64_t v29 = v15;
    v31 = v30 = v4;
    int v32 = [v25 BOOLValue];
    uint64_t v33 = v26;
    uint64_t v17 = v35;
    [v27 updateMetric:@"LockState" withTimestamp:v31 forEvent:v33 withValue:v32 ^ 1u];

    double v4 = v30;
    v15 = v29;
  }
  v34 = [(PLAggregateUsageService *)self intervalData];
  [v34 updateMetric:@"PowerlogInit" withTimestamp:0 forEvent:1 withValue:1];
}

uint64_t __44__PLAggregateUsageService_initializeMetrics__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"IntervalDuration"];
  qword_1EBD58C18 = v2;
  return result;
}

- (void)registerForEntryNotifications
{
  v58[1] = *MEMORY[0x1E4F143B8];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke;
  v42[3] = &unk_1E692A0F0;
  v42[4] = self;
  uint64_t v3 = [MEMORY[0x1E4F929E8] displayOnNotificationWithOperator:self withBlock:v42];
  [(PLAggregateUsageService *)self setDisplayOnNotification:v3];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_2;
  v41[3] = &unk_1E692A0F0;
  v41[4] = self;
  double v4 = [MEMORY[0x1E4F929E8] displayOffNotificationWithOperator:self withBlock:v41];
  [(PLAggregateUsageService *)self setDisplayOffNotification:v4];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_3;
  v40[3] = &unk_1E692A0F0;
  v40[4] = self;
  unint64_t v5 = [MEMORY[0x1E4F929E8] wakeEntryNotificationWithOperator:self withBlock:v40];
  [(PLAggregateUsageService *)self setWakeEntryNotification:v5];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_4;
  v39[3] = &unk_1E692A0F0;
  v39[4] = self;
  double v6 = [MEMORY[0x1E4F929E8] canSleepEntryNotificationWithOperator:self withBlock:v39];
  [(PLAggregateUsageService *)self setSleepEntryNotification:v6];

  uint64_t v7 = *MEMORY[0x1E4F92D30];
  uint64_t v33 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Routing"];
  id v8 = objc_alloc(MEMORY[0x1E4F929E8]);
  v57 = @"Active";
  v55 = &unk_1F29E6550;
  double v9 = [MEMORY[0x1E4F1CA98] null];
  v56 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  v58[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_230;
  v38[3] = &unk_1E692A0F0;
  v38[4] = self;
  v12 = (void *)[v8 initWithOperator:self forEntryKey:v33 withFilter:v11 withBlock:v38];
  [(PLAggregateUsageService *)self setAudioEntryNotification:v12];

  int v32 = +[PLOperator entryKeyForType:v7 andName:@"SBLock"];
  id v13 = objc_alloc(MEMORY[0x1E4F929E8]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_2_231;
  v37[3] = &unk_1E692A0F0;
  v37[4] = self;
  v14 = (void *)[v13 initWithOperator:self forEntryKey:v32 withBlock:v37];
  [(PLAggregateUsageService *)self setLockStateEntryNotification:v14];

  v31 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ChargingInfo"];
  id v15 = objc_alloc(MEMORY[0x1E4F929E8]);
  v53 = @"Connected";
  v51 = &unk_1F29E6550;
  v16 = [MEMORY[0x1E4F1CA98] null];
  v52 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  v54 = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_3_235;
  v36[3] = &unk_1E692A0F0;
  v36[4] = self;
  v19 = (void *)[v15 initWithOperator:self forEntryKey:v31 withFilter:v18 withBlock:v36];
  [(PLAggregateUsageService *)self setChargingEntryNotification:v19];

  uint64_t v20 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];
  id v21 = objc_alloc(MEMORY[0x1E4F929E8]);
  v49 = @"IsCharging";
  v47 = &unk_1F29E6550;
  v22 = [MEMORY[0x1E4F1CA98] null];
  v48 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  v50 = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_4_239;
  v35[3] = &unk_1E692A0F0;
  v35[4] = self;
  v25 = (void *)[v21 initWithOperator:self forEntryKey:v20 withFilter:v24 withBlock:v35];
  [(PLAggregateUsageService *)self setBatteryIsChargingEntryNotification:v25];

  id v26 = objc_alloc(MEMORY[0x1E4F929E8]);
  v45 = @"ExternalConnected";
  v43 = &unk_1F29E6550;
  v27 = [MEMORY[0x1E4F1CA98] null];
  v44 = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v46 = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_5;
  v34[3] = &unk_1E692A0F0;
  v34[4] = self;
  v30 = (void *)[v26 initWithOperator:self forEntryKey:v20 withFilter:v29 withBlock:v34];
  [(PLAggregateUsageService *)self setBatteryExternalConnectedEntryNotification:v30];
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleScreenStateChange:a2 withState:1];
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleScreenStateChange:a2 withState:0];
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleWakeStateChange:a2 withState:1];
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleWakeStateChange:a2 withState:0];
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_2_231(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleLockStateChange:a2];
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_3_235(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleConnectedChange:a2];
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_4_239(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleChargingChange:a2];
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleExternalConnectedChange:a2];
}

- (void)handleScreenStateChange:(id)a3 withState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v6 = (void *)MEMORY[0x1E4F929C0];
  id v7 = a3;
  if ([v6 debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __61__PLAggregateUsageService_handleScreenStateChange_withState___block_invoke;
    uint64_t v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v24 = v8;
    if (qword_1EBD58C20 != -1) {
      dispatch_once(&qword_1EBD58C20, &block);
    }
    if (byte_1EBD58BCD)
    {
      double v9 = @"OFF";
      if (v4) {
        double v9 = @"ON";
      }
      uint64_t v10 = [NSString stringWithFormat:@"Handle display %@", v9, block, v21, v22, v23, v24];
      v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
      id v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLAggregateUsageService handleScreenStateChange:withState:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:582];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLAggregateUsageService *)self submitMetricsToAggd];
  v16 = [v7 objectForKey:@"entry"];

  if (v16)
  {
    uint64_t v17 = [(PLAggregateUsageService *)self intervalData];
    v18 = [v16 entryDate];
    v19 = [v18 convertFromMonotonicToSystem];
    [v17 updateMetric:@"ScreenOnDuration" withTimestamp:v19 forEvent:v4 withValue:0xFFFFFFFFLL];
  }
}

uint64_t __61__PLAggregateUsageService_handleScreenStateChange_withState___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BCD = result;
  return result;
}

- (void)handleWakeStateChange:(id)a3 withState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v6 = (void *)MEMORY[0x1E4F929C0];
  id v7 = a3;
  if ([v6 debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __59__PLAggregateUsageService_handleWakeStateChange_withState___block_invoke;
    uint64_t v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v24 = v8;
    if (qword_1EBD58C28 != -1) {
      dispatch_once(&qword_1EBD58C28, &block);
    }
    if (byte_1EBD58BCE)
    {
      double v9 = @"Sleep";
      if (v4) {
        double v9 = @"Wake";
      }
      uint64_t v10 = [NSString stringWithFormat:@"Handle device %@", v9, block, v21, v22, v23, v24];
      v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
      id v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLAggregateUsageService handleWakeStateChange:withState:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:593];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLAggregateUsageService *)self submitMetricsToAggd];
  v16 = [v7 objectForKey:@"entry"];

  if (v16)
  {
    uint64_t v17 = [(PLAggregateUsageService *)self intervalData];
    v18 = [v16 entryDate];
    v19 = [v18 convertFromMonotonicToSystem];
    [v17 updateMetric:@"WakeDuration" withTimestamp:v19 forEvent:v4 withValue:0xFFFFFFFFLL];
  }
}

uint64_t __59__PLAggregateUsageService_handleWakeStateChange_withState___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BCE = result;
  return result;
}

uint64_t __50__PLAggregateUsageService_handleAudioStateChange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BCF = result;
  return result;
}

- (void)handleLockStateChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLAggregateUsageService *)self submitMetricsToAggd];
  unint64_t v5 = [v4 objectForKey:@"entry"];

  if (v5)
  {
    double v6 = [v5 objectForKeyedSubscript:@"Locked"];
    int v7 = [v6 BOOLValue];
    uint64_t v8 = v7 ^ 1u;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __49__PLAggregateUsageService_handleLockStateChange___block_invoke;
      uint64_t v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v24 = v9;
      if (qword_1EBD58C38 != -1) {
        dispatch_once(&qword_1EBD58C38, &block);
      }
      if (byte_1EBD58BD0)
      {
        uint64_t v10 = @"Unlock";
        if (v7) {
          uint64_t v10 = @"Lock";
        }
        v11 = [NSString stringWithFormat:@"Handle device %@", v10, block, v21, v22, v23, v24];
        v12 = (void *)MEMORY[0x1E4F929B8];
        id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
        v14 = [v13 lastPathComponent];
        id v15 = [NSString stringWithUTF8String:"-[PLAggregateUsageService handleLockStateChange:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:621];

        v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v17 = [(PLAggregateUsageService *)self intervalData];
    v18 = [v5 entryDate];
    v19 = [v18 convertFromMonotonicToSystem];
    [v17 updateMetric:@"LockState" withTimestamp:v19 forEvent:v8 withValue:v8];
  }
}

uint64_t __49__PLAggregateUsageService_handleLockStateChange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BD0 = result;
  return result;
}

- (void)handleConnectedChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLAggregateUsageService *)self submitMetricsToAggd];
  unint64_t v5 = [v4 objectForKey:@"entry"];

  if (v5)
  {
    double v6 = [v5 objectForKeyedSubscript:@"Connected"];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __49__PLAggregateUsageService_handleConnectedChange___block_invoke;
      uint64_t v21 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v22 = v7;
      if (qword_1EBD58C40 != -1) {
        dispatch_once(&qword_1EBD58C40, &block);
      }
      if (byte_1EBD58BD1)
      {
        uint64_t v8 = [NSString stringWithFormat:@"Handle charger change: %@", v6, block, v19, v20, v21, v22];
        uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLAggregateUsageService handleConnectedChange:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:632];

        id v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v8;
          _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (([v6 intValue] & 0x80000000) == 0)
    {
      uint64_t v14 = [v6 BOOLValue];
      id v15 = [(PLAggregateUsageService *)self intervalData];
      v16 = [v5 entryDate];
      uint64_t v17 = [v16 convertFromMonotonicToSystem];
      objc_msgSend(v15, "updateMetric:withTimestamp:forEvent:withValue:", @"AdapterType", v17, v14, objc_msgSend(v6, "intValue"));
    }
  }
}

uint64_t __49__PLAggregateUsageService_handleConnectedChange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BD1 = result;
  return result;
}

- (void)handleChargingChange:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLAggregateUsageService *)self submitMetricsToAggd];
  unint64_t v5 = [v4 objectForKey:@"entry"];

  if (v5)
  {
    double v6 = [v5 objectForKeyedSubscript:@"IsCharging"];
    uint64_t v7 = [v6 BOOLValue];

    uint64_t v8 = [v5 objectForKeyedSubscript:@"Amperage"];
    uint64_t v9 = [v8 intValue];

    uint64_t v10 = [v5 objectForKeyedSubscript:@"AdapterVoltage"];
    uint64_t v11 = [v10 intValue];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      v31 = __48__PLAggregateUsageService_handleChargingChange___block_invoke;
      int v32 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v33 = v12;
      if (qword_1EBD58C48 != -1) {
        dispatch_once(&qword_1EBD58C48, &block);
      }
      if (byte_1EBD58BD2)
      {
        id v13 = @"Stop";
        if (v7) {
          id v13 = @"Start";
        }
        uint64_t v14 = [NSString stringWithFormat:@"Handle charging: %@ Current: %d, Voltage: %d", v13, v9, v11, block, v30, v31, v32, v33];
        id v15 = (void *)MEMORY[0x1E4F929B8];
        v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
        uint64_t v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLAggregateUsageService handleChargingChange:]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:649];

        uint64_t v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v20 = [(PLAggregateUsageService *)self intervalData];
    uint64_t v21 = [v5 entryDate];
    uint64_t v22 = [v21 convertFromMonotonicToSystem];
    [v20 updateMetric:@"ChargingState" withTimestamp:v22 forEvent:v7 withValue:v7];

    uint64_t v23 = [(PLAggregateUsageService *)self intervalData];
    uint64_t v24 = [v5 entryDate];
    uint64_t v25 = [v24 convertFromMonotonicToSystem];
    [v23 updateMetric:@"ChargerCurrent" withTimestamp:v25 forEvent:v7 withValue:v9];

    id v26 = [(PLAggregateUsageService *)self intervalData];
    uint64_t v27 = [v5 entryDate];
    v28 = [v27 convertFromMonotonicToSystem];
    [v26 updateMetric:@"ChargerVoltage" withTimestamp:v28 forEvent:v7 withValue:v11];
  }
}

uint64_t __48__PLAggregateUsageService_handleChargingChange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BD2 = result;
  return result;
}

- (void)handleExternalConnectedChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLAggregateUsageService *)self submitMetricsToAggd];
  unint64_t v5 = [v4 objectForKey:@"entry"];

  if (v5)
  {
    double v6 = [v5 objectForKeyedSubscript:@"ExternalConnected"];
    uint64_t v7 = [v6 BOOLValue];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __57__PLAggregateUsageService_handleExternalConnectedChange___block_invoke;
      uint64_t v21 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v22 = v8;
      if (qword_1EBD58C50 != -1) {
        dispatch_once(&qword_1EBD58C50, &block);
      }
      if (byte_1EBD58BD3)
      {
        uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Handle external connected change: %d", v7, block, v19, v20, v21, v22);
        uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
        uint64_t v12 = [v11 lastPathComponent];
        id v13 = [NSString stringWithUTF8String:"-[PLAggregateUsageService handleExternalConnectedChange:]"];
        [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:663];

        uint64_t v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v9;
          _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v15 = [(PLAggregateUsageService *)self intervalData];
    v16 = [v5 entryDate];
    uint64_t v17 = [v16 convertFromMonotonicToSystem];
    [v15 updateMetric:@"ConnectedState" withTimestamp:v17 forEvent:v7 withValue:v7];
  }
}

uint64_t __57__PLAggregateUsageService_handleExternalConnectedChange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BD3 = result;
  return result;
}

- (void)scheduleSubmissionAfter:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v4 = dispatch_walltime(0, 1000000000 * a3);
  unint64_t v5 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_after(v4, v5, block);

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_2_299;
    v15[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v15[4] = v6;
    if (qword_1EBD58C70 != -1) {
      dispatch_once(&qword_1EBD58C70, v15);
    }
    if (byte_1EBD58BD5)
    {
      uint64_t v7 = NSString;
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v9 = [v7 stringWithFormat:@"Scheduled submission at %@!", v8];

      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
      uint64_t v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLAggregateUsageService scheduleSubmissionAfter:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:683];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_2;
    v16[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v16[4] = v2;
    if (qword_1EBD58C58 != -1) {
      dispatch_once(&qword_1EBD58C58, v16);
    }
    if (byte_1EBD58BD4)
    {
      uint64_t v3 = NSString;
      dispatch_time_t v4 = [MEMORY[0x1E4F1C9C8] date];
      unint64_t v5 = [v3 stringWithFormat:@"Submit metrics triggered at %@!", v4];

      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
      uint64_t v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLAggregateUsageService scheduleSubmissionAfter:]_block_invoke"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:673];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) submitMetricsToAggd];
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSince1970];
  double v13 = v12;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_298;
  block[3] = &unk_1E692A250;
  block[4] = *(void *)(a1 + 32);
  if (qword_1EBD58C60 != -1) {
    dispatch_once(&qword_1EBD58C60, block);
  }
  return [*(id *)(a1 + 32) scheduleSubmissionAfter:(unint64_t)*(double *)&qword_1EBD58C68+ (unint64_t)v13/ (unint64_t)*(double *)&qword_1EBD58C68* (unint64_t)*(double *)&qword_1EBD58C68- (unint64_t)v13];
}

uint64_t __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BD4 = result;
  return result;
}

uint64_t __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_298(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"IntervalDuration"];
  qword_1EBD58C68 = v2;
  return result;
}

uint64_t __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_2_299(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BD5 = result;
  return result;
}

- (void)updateSampledMetrics
{
  id v20 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];
  uint64_t v3 = [(PLOperator *)self storage];
  dispatch_time_t v4 = [v3 lastEntryForKey:v20];

  if (v4)
  {
    unint64_t v5 = [(PLAggregateUsageService *)self intervalData];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"Level"];
    objc_msgSend(v5, "updateMetric:withTimestamp:forEvent:withValue:", @"BatteryLevel", 0, 1, objc_msgSend(v6, "intValue"));

    uint64_t v7 = [(PLAggregateUsageService *)self intervalData];
    uint64_t v8 = [v4 objectForKeyedSubscript:@"Temperature"];
    objc_msgSend(v7, "updateMetric:withTimestamp:forEvent:withValue:", @"BatteryTemperature", 0, 1, objc_msgSend(v8, "intValue"));

    uint64_t v9 = [v4 objectForKeyedSubscript:@"IsCharging"];
    LODWORD(v8) = [v9 BOOLValue];

    if (v8)
    {
      uint64_t v10 = [v4 objectForKeyedSubscript:@"Amperage"];
      uint64_t v11 = [v10 intValue];

      double v12 = [(PLAggregateUsageService *)self intervalData];
      double v13 = [v4 entryDate];
      uint64_t v14 = [v13 convertFromMonotonicToSystem];
      [v12 updateMetric:@"ChargerCurrent" withTimestamp:v14 forEvent:1 withValue:v11];

      id v15 = [v4 objectForKeyedSubscript:@"AdapterVoltage"];
      uint64_t v16 = [v15 intValue];

      uint64_t v17 = [(PLAggregateUsageService *)self intervalData];
      v18 = [v4 entryDate];
      uint64_t v19 = [v18 convertFromMonotonicToSystem];
      [v17 updateMetric:@"ChargerVoltage" withTimestamp:v19 forEvent:1 withValue:v16];
    }
  }
}

uint64_t __45__PLAggregateUsageService_numIntervalsToFill__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BD6 = result;
  return result;
}

uint64_t __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_307(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"IntervalDuration"];
  qword_1EBD58C88 = v2;
  return result;
}

uint64_t __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"IntervalDuration"];
  qword_1EBD58C98 = v2;
  return result;
}

uint64_t __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BD7 = result;
  return result;
}

- (void)handleLargeTimeGap
{
  uint64_t v3 = [(PLAggregateUsageService *)self intervalData];
  [v3 resetMetrics];

  dispatch_time_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSince1970];
  unint64_t v6 = (unint64_t)v5;

  [(PLOperator *)self defaultDoubleForKey:@"IntervalDuration"];
  unint64_t v8 = (unint64_t)v7 + v6 / (unint64_t)v7 * (unint64_t)v7;
  id v10 = [(PLAggregateUsageService *)self intervalData];
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v8];
  [v10 setCurrentInterval:v9];
}

- (PLEntryNotificationOperatorComposition)displayOnNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDisplayOnNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayOffNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDisplayOffNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWakeEntryNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)sleepEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSleepEntryNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)audioEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAudioEntryNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryIsChargingEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryIsChargingEntryNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryExternalConnectedEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBatteryExternalConnectedEntryNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)chargingEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setChargingEntryNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)lockStateEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLockStateEntryNotification:(id)a3
{
}

- (void)setIntervalData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalData, 0);
  objc_storeStrong((id *)&self->_lockStateEntryNotification, 0);
  objc_storeStrong((id *)&self->_chargingEntryNotification, 0);
  objc_storeStrong((id *)&self->_batteryExternalConnectedEntryNotification, 0);
  objc_storeStrong((id *)&self->_batteryIsChargingEntryNotification, 0);
  objc_storeStrong((id *)&self->_audioEntryNotification, 0);
  objc_storeStrong((id *)&self->_sleepEntryNotification, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotification, 0);
  objc_storeStrong((id *)&self->_displayOffNotification, 0);
  objc_storeStrong((id *)&self->_displayOnNotification, 0);
}

@end