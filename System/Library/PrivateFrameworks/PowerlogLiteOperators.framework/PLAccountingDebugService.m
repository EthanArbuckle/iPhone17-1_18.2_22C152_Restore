@interface PLAccountingDebugService
+ (void)load;
+ (void)printError:(id)a3;
- (BOOL)verifyAggregateQualificationEnergyWithQualificationID:(int)a3 withRootNodeID:(int)a4 withNodeName:(id)a5 withQualificationEnergy:(double)a6 withDate:(id)a7;
- (BOOL)verifyAggregateRootNodeEnergyWithNodeName:(id)a3 withRootNodeID:(int)a4 withEnergy:(double)a5 withDate:(id)a6;
- (BOOL)verifyLastDistributionEventWithDistributionID:(int)a3 withNodeName:(id)a4 withWeight:(double)a5;
- (BOOL)verifyLastPowerEventWithRootNodeID:(int)a3 withPower:(double)a4;
- (BOOL)verifyLastQualificationEventWithQualificationID:(int)a3 withNodeName:(id)a4;
- (BOOL)verifyTotalCorrectionEnergyWithNodeName:(id)a3 withTotalCorrectionEnergy:(double)a4 withRootNodeID:(int)a5;
- (BOOL)verifyTotalEnergyWithNodeName:(id)a3 withTotalEnergy:(double)a4 withRootNodeID:(int)a5 withEpsilon:(double)a6;
- (NSArray)testNames;
- (PLAccountingDebugService)init;
- (void)blockingClearQueues;
- (void)blockingLogGasGaugeWithTotalPower:(double)a3 withStartDate:(id)a4 withEndDate:(id)a5;
- (void)setTestNames:(id)a3;
- (void)testAddRemoveDistributionEventForward;
- (void)testChunk;
- (void)testCorrection1;
- (void)testCorrection2;
- (void)testCorrection3;
- (void)testCorrection4;
- (void)testCorrectionInMemory;
- (void)testCurrentDistributionEventForward;
- (void)testDistribution1;
- (void)testDistribution2;
- (void)testDistribution3;
- (void)testDistribution4;
- (void)testDistribution5;
- (void)testPerformance;
- (void)testPowerEventIntervalOverlap;
- (void)testQualification1;
- (void)testQualification2;
- (void)testQualification3;
- (void)testReloadAfter1;
- (void)testReloadAfter2;
- (void)testReloadBefore1;
- (void)testReloadBefore2;
- (void)testShortDistributionEventDuration;
- (void)testShortQualificationEventDuration;
@end

@implementation PLAccountingDebugService

- (NSArray)testNames
{
  testNames = self->_testNames;
  if (!testNames)
  {
    self->_testNames = (NSArray *)&unk_1F29EDBC8;
    testNames = self->_testNames;
  }
  return testNames;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDebugService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLAccountingDebugService)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || ![MEMORY[0x1E4F929C0] BOOLForKey:@"PLAccountingDebugService_Debug" ifNotSet:0])
  {
    v12 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLAccountingDebugService;
    v3 = [(PLOperator *)&v18 init];
    v4 = v3;
    if (v3)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v5 = [(PLAccountingDebugService *)v3 testNames];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = [@"com.apple.powerlogd.accounting." stringByAppendingString:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)NotificationCallback_0, v10, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v7);
      }
    }
    self = v4;
    v12 = self;
  }

  return v12;
}

- (void)testDistribution1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution1]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:148];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 138412290;
    v26 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v25, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v10 = [MEMORY[0x1E4F92900] debugInstance];
  v11 = [v9 dateByAddingTimeInterval:0.0];
  [v10 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9A68 withStartDate:v11];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.5];
  v12 = [MEMORY[0x1E4F92900] debugInstance];
  v13 = [v9 dateByAddingTimeInterval:3.0];
  [v12 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9A90 withStartDate:v13];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:1.0];
  long long v14 = [MEMORY[0x1E4F92900] debugInstance];
  long long v15 = [v9 dateByAddingTimeInterval:1.0];
  [v14 createPowerEventForwardWithRootNodeID:10 withPower:v15 withStartDate:3.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:10 withPower:3.0];
  long long v16 = [MEMORY[0x1E4F92900] debugInstance];
  long long v17 = [v9 dateByAddingTimeInterval:2.0];
  [v16 createPowerEventForwardWithRootNodeID:10 withPower:v17 withStartDate:4.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:10 withPower:4.0];
  objc_super v18 = [&unk_1F29EDBE0 objectAtIndexedSubscript:10];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:v18 withTotalEnergy:10 withRootNodeID:0.000833333333 withEpsilon:0.001];

  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App1" withTotalEnergy:10 withRootNodeID:0.000416666667 withEpsilon:0.001];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App2" withTotalEnergy:10 withRootNodeID:0.000416666667 withEpsilon:0.001];
  v19 = [NSString stringWithFormat:@"end"];
  uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
  v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v22 = [v21 lastPathComponent];
  v23 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution1]"];
  [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:197];

  v24 = PLLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 138412290;
    v26 = v19;
    _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v25, 0xCu);
  }
}

- (void)testDistribution2
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution2]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:202];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 138412290;
    int v25 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v10 = [MEMORY[0x1E4F92900] debugInstance];
  v11 = [v9 dateByAddingTimeInterval:1.0];
  v12 = [v9 dateByAddingTimeInterval:3.0];
  [v10 createPowerEventIntervalWithRootNodeID:2 withPower:v11 withStartDate:v12 withEndDate:5.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:2 withPower:5.0];
  v13 = [MEMORY[0x1E4F92900] debugInstance];
  long long v14 = [v9 dateByAddingTimeInterval:0.0];
  [v13 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:&unk_1F29E9AB8 withEndDate:v14];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App1" withWeight:1.0];
  long long v15 = [MEMORY[0x1E4F92900] debugInstance];
  long long v16 = [v9 dateByAddingTimeInterval:4.0];
  [v15 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:&unk_1F29E9AE0 withEndDate:v16];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App1" withWeight:0.75];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App2" withWeight:0.25];
  long long v17 = [&unk_1F29EDBF8 objectAtIndexedSubscript:2];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:v17 withTotalEnergy:2 withRootNodeID:0.00277777778 withEpsilon:0.001];

  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App1" withTotalEnergy:2 withRootNodeID:0.00208333333 withEpsilon:0.001];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App2" withTotalEnergy:2 withRootNodeID:0.000694444444 withEpsilon:0.001];
  objc_super v18 = [NSString stringWithFormat:@"end"];
  v19 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v21 = [v20 lastPathComponent];
  v22 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution2]"];
  [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:247];

  v23 = PLLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 138412290;
    int v25 = v18;
    _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v24, 0xCu);
  }
}

- (void)testDistribution3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution3]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:252];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 138412290;
    int v25 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v10 = [MEMORY[0x1E4F92900] debugInstance];
  v11 = [v9 dateByAddingTimeInterval:0.0];
  v12 = [v9 dateByAddingTimeInterval:5.0];
  [v10 createPowerEventIntervalWithRootNodeID:2 withPower:v11 withStartDate:v12 withEndDate:8.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:2 withPower:8.0];
  v13 = [MEMORY[0x1E4F92900] debugInstance];
  long long v14 = [v9 dateByAddingTimeInterval:1.0];
  [v13 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:&unk_1F29E9B08 withEndDate:v14];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App1" withWeight:1.0];
  long long v15 = [MEMORY[0x1E4F92900] debugInstance];
  long long v16 = [v9 dateByAddingTimeInterval:10.0];
  [v15 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:&unk_1F29E9B30 withEndDate:v16];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"kernel_task" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App1" withWeight:0.5];
  long long v17 = [&unk_1F29EDC10 objectAtIndexedSubscript:2];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:v17 withTotalEnergy:2 withRootNodeID:0.0111111111 withEpsilon:0.001];

  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"kernel_task" withTotalEnergy:2 withRootNodeID:0.00444444444 withEpsilon:0.001];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App1" withTotalEnergy:2 withRootNodeID:0.00666666667 withEpsilon:0.001];
  objc_super v18 = [NSString stringWithFormat:@"end"];
  v19 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v21 = [v20 lastPathComponent];
  v22 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution3]"];
  [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:296];

  v23 = PLLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 138412290;
    int v25 = v18;
    _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v24, 0xCu);
  }
}

- (void)testDistribution4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution4]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:301];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138412290;
    int v24 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = 0.0;
  for (int i = 1; i != 12; ++i)
  {
    v12 = [MEMORY[0x1E4F92900] debugInstance];
    v13 = [v9 dateByAddingTimeInterval:v10];
    [v12 createPowerEventForwardWithRootNodeID:10 withPower:v13 withStartDate:(double)i];

    [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:10 withPower:(double)i];
    long long v14 = [MEMORY[0x1E4F92900] debugInstance];
    long long v15 = [v9 dateByAddingTimeInterval:v10 + 0.5];
    [v14 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9B58 withStartDate:v15];

    [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.75];
    [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.25];
    double v10 = v10 + 1.0;
  }
  long long v16 = [&unk_1F29EDC28 objectAtIndexedSubscript:10];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:v16 withTotalEnergy:10 withRootNodeID:0.0152777778 withEpsilon:0.001];

  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App1" withTotalEnergy:10 withRootNodeID:0.0113541667 withEpsilon:0.001];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App2" withTotalEnergy:10 withRootNodeID:0.00378472222 withEpsilon:0.001];
  long long v17 = [NSString stringWithFormat:@"end"];
  objc_super v18 = (void *)MEMORY[0x1E4F929B8];
  v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v20 = [v19 lastPathComponent];
  v21 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution4]"];
  [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:341];

  v22 = PLLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138412290;
    int v24 = v17;
    _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }
}

- (void)testDistribution5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution5]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:346];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v31 = 138412290;
    v32 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v31, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [MEMORY[0x1E4F92900] debugInstance];
  v11 = [v9 dateByAddingTimeInterval:0.0];
  [v10 createPowerEventBackwardWithRootNodeID:11 withPower:v11 withEndDate:5.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:11 withPower:5.0];
  v12 = [MEMORY[0x1E4F92900] debugInstance];
  v13 = [v9 dateByAddingTimeInterval:5.0];
  [v12 createPowerEventBackwardWithRootNodeID:11 withPower:v13 withEndDate:10.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:11 withPower:10.0];
  long long v14 = [MEMORY[0x1E4F92900] debugInstance];
  long long v15 = [v9 dateByAddingTimeInterval:1.0];
  [v14 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:&unk_1F29E9B80 withStartDate:v15];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:4 withNodeName:@"App1" withWeight:1.0];
  long long v16 = [MEMORY[0x1E4F92900] debugInstance];
  long long v17 = [v9 dateByAddingTimeInterval:2.0];
  [v16 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:&unk_1F29E9BA8 withStartDate:v17];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:4 withNodeName:@"App1" withWeight:1.0];
  objc_super v18 = [MEMORY[0x1E4F92900] debugInstance];
  v19 = [v9 dateByAddingTimeInterval:4.0];
  [v18 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:&unk_1F29E9BD0 withStartDate:v19];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:4 withNodeName:@"App2" withWeight:1.0];
  uint64_t v20 = [MEMORY[0x1E4F92900] debugInstance];
  v21 = [v9 dateByAddingTimeInterval:6.0];
  [v20 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:&unk_1F29E9BF8 withStartDate:v21];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:4 withNodeName:@"App2" withWeight:1.0];
  v22 = [MEMORY[0x1E4F92900] debugInstance];
  int v23 = [v9 dateByAddingTimeInterval:0.0];
  [v22 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:&unk_1F29E9C20 withStartDate:v23];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:3 withNodeName:@"apsd" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:3 withNodeName:@"App1" withWeight:0.5];
  int v24 = [&unk_1F29EDC40 objectAtIndexedSubscript:11];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:v24 withTotalEnergy:11 withRootNodeID:0.0138888889 withEpsilon:0.001];

  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"apsd" withTotalEnergy:11 withRootNodeID:0.00694444444 withEpsilon:0.001];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App1" withTotalEnergy:11 withRootNodeID:0.0115740741 withEpsilon:0.001];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App2" withTotalEnergy:11 withRootNodeID:0.00231481481 withEpsilon:0.001];
  uint64_t v25 = [NSString stringWithFormat:@"end"];
  uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v28 = [v27 lastPathComponent];
  v29 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testDistribution5]"];
  [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:421];

  v30 = PLLogCommon();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    int v31 = 138412290;
    v32 = v25;
    _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v31, 0xCu);
  }
}

- (void)testCorrection1
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrection1]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:426];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [MEMORY[0x1E4F92900] debugInstance];
  v11 = [v9 dateByAddingTimeInterval:0.0];
  v12 = [v9 dateByAddingTimeInterval:1.0];
  [v10 addPowerMeasurementEventIntervalWithPower:v11 withStartDate:v12 withEndDate:5.0];

  v13 = [MEMORY[0x1E4F92900] deviceRootNodeIDs];
  long long v14 = (void *)[v13 mutableCopy];

  [v14 removeObject:&unk_1F29E61F0];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v59 count:16];
  id v49 = v15;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v55;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v54 + 1) + 8 * i) intValue];
        v21 = [&unk_1F29EDC58 objectAtIndexedSubscript:(int)v20];
        int v22 = [v21 intValue];

        switch(v22)
        {
          case 3:
            uint64_t v25 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v26 = [v9 dateByAddingTimeInterval:0.0];
            double v27 = 1.0;
            v28 = [v9 dateByAddingTimeInterval:1.0];
            [v25 createPowerEventIntervalWithRootNodeID:v20 withPower:v26 withStartDate:v28 withEndDate:1.0];

            id v15 = v49;
            break;
          case 2:
            v29 = [MEMORY[0x1E4F92900] debugInstance];
            v30 = [v9 dateByAddingTimeInterval:0.0];
            [v29 createPowerEventBackwardWithRootNodeID:v20 withPower:v30 withEndDate:0.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:0.0];
            uint64_t v25 = [MEMORY[0x1E4F92900] debugInstance];
            double v27 = 1.0;
            uint64_t v26 = [v9 dateByAddingTimeInterval:1.0];
            [v25 createPowerEventBackwardWithRootNodeID:v20 withPower:v26 withEndDate:1.0];
            break;
          case 1:
            int v23 = [MEMORY[0x1E4F92900] debugInstance];
            int v24 = [v9 dateByAddingTimeInterval:0.0];
            [v23 createPowerEventForwardWithRootNodeID:v20 withPower:v24 withStartDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:1.0];
            uint64_t v25 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v26 = [v9 dateByAddingTimeInterval:1.0];
            double v27 = 2.0;
            [v25 createPowerEventForwardWithRootNodeID:v20 withPower:v26 withStartDate:2.0];
            break;
          default:
            v43 = v15;
            goto LABEL_27;
        }

        [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:v27];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  int v31 = [MEMORY[0x1E4F92900] debugInstance];
  v32 = [v9 dateByAddingTimeInterval:0.0];
  [v31 createPowerEventForwardWithRootNodeID:10 withPower:v32 withStartDate:1.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:10 withPower:1.0];
  uint64_t v33 = [MEMORY[0x1E4F92900] debugInstance];
  v34 = [v9 dateByAddingTimeInterval:1.0];
  [v33 createPowerEventForwardWithRootNodeID:10 withPower:v34 withStartDate:2.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:10 withPower:2.0];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v35 = v15;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v51 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = [*(id *)(*((void *)&v50 + 1) + 8 * j) intValue];
        v41 = [&unk_1F29EDC70 objectAtIndexedSubscript:(int)v40];
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v41, v40, (5.0 / (double)(unint64_t)([v35 count] + 1) + -1.0) / 3600.0);
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v37);
  }

  v42 = [&unk_1F29EDC88 objectAtIndexedSubscript:10];
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v42, 10, (5.0 / (double)(unint64_t)([v35 count] + 1) + -1.0) / 3600.0);

  v43 = [NSString stringWithFormat:@"end"];
  v44 = (void *)MEMORY[0x1E4F929B8];
  v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v46 = [v45 lastPathComponent];
  v47 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrection1]"];
  [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:518];

  v48 = PLLogCommon();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v43;
    _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  id v15 = v49;
LABEL_27:
}

- (void)testCorrection2
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrection2]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:522];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [MEMORY[0x1E4F92900] debugInstance];
  v11 = [v9 dateByAddingTimeInterval:0.0];
  v12 = [v9 dateByAddingTimeInterval:1.0];
  [v10 addPowerMeasurementEventIntervalWithPower:v11 withStartDate:v12 withEndDate:5.0];

  v13 = [MEMORY[0x1E4F92900] deviceRootNodeIDs];
  long long v14 = (void *)[v13 mutableCopy];

  [v14 removeObject:&unk_1F29E6250];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v66 count:16];
  id v56 = v15;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v62 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v61 + 1) + 8 * i) intValue];
        v21 = [&unk_1F29EDCA0 objectAtIndexedSubscript:(int)v20];
        int v22 = [v21 intValue];

        switch(v22)
        {
          case 3:
            v30 = [MEMORY[0x1E4F92900] debugInstance];
            int v31 = [v9 dateByAddingTimeInterval:0.0];
            v32 = [v9 dateByAddingTimeInterval:1.0];
            [v30 createPowerEventIntervalWithRootNodeID:v20 withPower:v31 withStartDate:v32 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:1.0];
            double v27 = [MEMORY[0x1E4F92900] debugInstance];
            v28 = [v9 dateByAddingTimeInterval:1.0];
            double v29 = 2.0;
            uint64_t v33 = [v9 dateByAddingTimeInterval:2.0];
            [v27 createPowerEventIntervalWithRootNodeID:v20 withPower:v28 withStartDate:v33 withEndDate:2.0];

            id v15 = v56;
            break;
          case 2:
            v34 = [MEMORY[0x1E4F92900] debugInstance];
            id v35 = [v9 dateByAddingTimeInterval:0.0];
            [v34 createPowerEventBackwardWithRootNodeID:v20 withPower:v35 withEndDate:0.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:0.0];
            uint64_t v36 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v37 = [v9 dateByAddingTimeInterval:1.0];
            [v36 createPowerEventBackwardWithRootNodeID:v20 withPower:v37 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:1.0];
            double v27 = [MEMORY[0x1E4F92900] debugInstance];
            double v29 = 2.0;
            v28 = [v9 dateByAddingTimeInterval:2.0];
            [v27 createPowerEventBackwardWithRootNodeID:v20 withPower:v28 withEndDate:2.0];
            break;
          case 1:
            int v23 = [MEMORY[0x1E4F92900] debugInstance];
            int v24 = [v9 dateByAddingTimeInterval:0.0];
            [v23 createPowerEventForwardWithRootNodeID:v20 withPower:v24 withStartDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:1.0];
            uint64_t v25 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v26 = [v9 dateByAddingTimeInterval:1.0];
            [v25 createPowerEventForwardWithRootNodeID:v20 withPower:v26 withStartDate:2.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:2.0];
            double v27 = [MEMORY[0x1E4F92900] debugInstance];
            v28 = [v9 dateByAddingTimeInterval:2.0];
            double v29 = 3.0;
            [v27 createPowerEventForwardWithRootNodeID:v20 withPower:v28 withStartDate:3.0];
            break;
          default:
            long long v50 = v15;
            goto LABEL_27;
        }

        [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:v29];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  uint64_t v38 = [MEMORY[0x1E4F92900] debugInstance];
  v39 = [v9 dateByAddingTimeInterval:0.0];
  uint64_t v40 = [v9 dateByAddingTimeInterval:3.0];
  [v38 createPowerEventIntervalWithRootNodeID:2 withPower:v39 withStartDate:v40 withEndDate:1.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:2 withPower:1.0];
  uint64_t v41 = [v15 count];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v42 = v15;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v58 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = [*(id *)(*((void *)&v57 + 1) + 8 * j) intValue];
        v48 = [&unk_1F29EDCB8 objectAtIndexedSubscript:(int)v47];
        [(PLAccountingDebugService *)self verifyTotalCorrectionEnergyWithNodeName:v48 withTotalCorrectionEnergy:v47 withRootNodeID:(5.0 / (double)(unint64_t)(v41 + 1) + -1.0) / 3600.0];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v44);
  }

  id v49 = [&unk_1F29EDCD0 objectAtIndexedSubscript:2];
  [(PLAccountingDebugService *)self verifyTotalCorrectionEnergyWithNodeName:v49 withTotalCorrectionEnergy:2 withRootNodeID:0.0];

  long long v50 = [NSString stringWithFormat:@"end"];
  long long v51 = (void *)MEMORY[0x1E4F929B8];
  long long v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  long long v53 = [v52 lastPathComponent];
  long long v54 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrection2]"];
  [v51 logMessage:v50 fromFile:v53 fromFunction:v54 fromLineNumber:629];

  long long v55 = PLLogCommon();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v50;
    _os_log_debug_impl(&dword_1D2690000, v55, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  id v15 = v56;
LABEL_27:
}

- (void)testCorrection3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrection3]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:633];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [MEMORY[0x1E4F92900] debugInstance];
  v11 = [v9 dateByAddingTimeInterval:0.0];
  v12 = [v9 dateByAddingTimeInterval:1.0];
  [v10 addPowerMeasurementEventIntervalWithPower:v11 withStartDate:v12 withEndDate:5.0];

  v13 = [MEMORY[0x1E4F92900] debugInstance];
  long long v14 = [v9 dateByAddingTimeInterval:1.0];
  id v15 = [v9 dateByAddingTimeInterval:3.0];
  [v13 addPowerMeasurementEventIntervalWithPower:v14 withStartDate:v15 withEndDate:5.0];

  uint64_t v16 = [MEMORY[0x1E4F92900] deviceRootNodeIDs];
  uint64_t v17 = (void *)[v16 mutableCopy];

  [v17 removeObject:&unk_1F29E6250];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v68 objects:v73 count:16];
  id v63 = v18;
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v69;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v69 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = [*(id *)(*((void *)&v68 + 1) + 8 * i) intValue];
        int v24 = [&unk_1F29EDCE8 objectAtIndexedSubscript:(int)v23];
        int v25 = [v24 intValue];

        switch(v25)
        {
          case 3:
            uint64_t v33 = [MEMORY[0x1E4F92900] debugInstance];
            v34 = [v9 dateByAddingTimeInterval:0.0];
            id v35 = [v9 dateByAddingTimeInterval:1.0];
            [v33 createPowerEventIntervalWithRootNodeID:v23 withPower:v34 withStartDate:v35 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v23 withPower:1.0];
            v30 = [MEMORY[0x1E4F92900] debugInstance];
            int v31 = [v9 dateByAddingTimeInterval:1.0];
            double v32 = 2.0;
            uint64_t v36 = [v9 dateByAddingTimeInterval:2.0];
            [v30 createPowerEventIntervalWithRootNodeID:v23 withPower:v31 withStartDate:v36 withEndDate:2.0];

            id v18 = v63;
            break;
          case 2:
            uint64_t v37 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v38 = [v9 dateByAddingTimeInterval:0.0];
            [v37 createPowerEventBackwardWithRootNodeID:v23 withPower:v38 withEndDate:0.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v23 withPower:0.0];
            v39 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v40 = [v9 dateByAddingTimeInterval:1.0];
            [v39 createPowerEventBackwardWithRootNodeID:v23 withPower:v40 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v23 withPower:1.0];
            v30 = [MEMORY[0x1E4F92900] debugInstance];
            double v32 = 2.0;
            int v31 = [v9 dateByAddingTimeInterval:2.0];
            [v30 createPowerEventBackwardWithRootNodeID:v23 withPower:v31 withEndDate:2.0];
            break;
          case 1:
            uint64_t v26 = [MEMORY[0x1E4F92900] debugInstance];
            double v27 = [v9 dateByAddingTimeInterval:0.0];
            [v26 createPowerEventForwardWithRootNodeID:v23 withPower:v27 withStartDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v23 withPower:1.0];
            v28 = [MEMORY[0x1E4F92900] debugInstance];
            double v29 = [v9 dateByAddingTimeInterval:1.0];
            [v28 createPowerEventForwardWithRootNodeID:v23 withPower:v29 withStartDate:2.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v23 withPower:2.0];
            v30 = [MEMORY[0x1E4F92900] debugInstance];
            int v31 = [v9 dateByAddingTimeInterval:2.0];
            double v32 = 3.0;
            [v30 createPowerEventForwardWithRootNodeID:v23 withPower:v31 withStartDate:3.0];
            break;
          default:
            long long v57 = v18;
            goto LABEL_27;
        }

        [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v23 withPower:v32];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  uint64_t v41 = [MEMORY[0x1E4F92900] debugInstance];
  id v42 = [v9 dateByAddingTimeInterval:0.0];
  uint64_t v43 = [v9 dateByAddingTimeInterval:1.0];
  [v41 createPowerEventIntervalWithRootNodeID:2 withPower:v42 withStartDate:v43 withEndDate:2.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:2 withPower:2.0];
  uint64_t v44 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v45 = [v9 dateByAddingTimeInterval:0.0];
  [v44 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:&unk_1F29E9C48 withEndDate:v45];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"kernel_task" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App1" withWeight:0.5];
  v46 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v47 = [v9 dateByAddingTimeInterval:4.0];
  [v46 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:&unk_1F29E9C70 withEndDate:v47];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"kernel_task" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App1" withWeight:0.5];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v48 = v18;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v65 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v53 = [*(id *)(*((void *)&v64 + 1) + 8 * j) intValue];
        long long v54 = [&unk_1F29EDD00 objectAtIndexedSubscript:(int)v53];
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v54, v53, (5.0 / (double)(unint64_t)([v48 count] + 2) + -1.0) / 3600.0);
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v64 objects:v72 count:16];
    }
    while (v50);
  }

  long long v55 = [&unk_1F29EDD18 objectAtIndexedSubscript:2];
  uint64_t v56 = [v48 count];
  [(PLAccountingDebugService *)self verifyTotalCorrectionEnergyWithNodeName:v55 withTotalCorrectionEnergy:2 withRootNodeID:(5.0 / (double)(unint64_t)(v56 + 2) + -1.0 + 5.0 / (double)(unint64_t)(v56 + 2) + -1.0) / 3600.0];

  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", @"kernel_task", 2, (5.0 / (double)(unint64_t)([v48 count] + 2) + -1.0) / 3600.0);
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", @"App1", 2, (5.0 / (double)(unint64_t)([v48 count] + 2) + -1.0) * 3.0 * 0.5 / 3600.0);
  long long v57 = [NSString stringWithFormat:@"end"];
  long long v58 = (void *)MEMORY[0x1E4F929B8];
  long long v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  long long v60 = [v59 lastPathComponent];
  long long v61 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrection3]"];
  [v58 logMessage:v57 fromFile:v60 fromFunction:v61 fromLineNumber:780];

  long long v62 = PLLogCommon();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v57;
    _os_log_debug_impl(&dword_1D2690000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  id v18 = v63;
LABEL_27:
}

- (void)testCorrection4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrection4]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:785];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v67 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [MEMORY[0x1E4F92900] debugInstance];
  v11 = [v9 dateByAddingTimeInterval:0.0];
  v12 = [v9 dateByAddingTimeInterval:1.0];
  [v10 addPowerMeasurementEventIntervalWithPower:v11 withStartDate:v12 withEndDate:5.0];

  v13 = [MEMORY[0x1E4F92900] deviceRootNodeIDs];
  long long v14 = (void *)[v13 mutableCopy];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v65 count:16];
  id v55 = v15;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v61;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v61 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v60 + 1) + 8 * i) intValue];
        uint64_t v21 = [&unk_1F29EDD30 objectAtIndexedSubscript:(int)v20];
        int v22 = [v21 intValue];

        switch(v22)
        {
          case 3:
            v30 = [MEMORY[0x1E4F92900] debugInstance];
            int v31 = [v9 dateByAddingTimeInterval:0.0];
            double v29 = 1.0;
            double v32 = [v9 dateByAddingTimeInterval:1.0];
            [v30 createPowerEventIntervalWithRootNodeID:v20 withPower:v31 withStartDate:v32 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:1.0];
            double v27 = [MEMORY[0x1E4F92900] debugInstance];
            v28 = [v9 dateByAddingTimeInterval:1.0];
            uint64_t v33 = [v9 dateByAddingTimeInterval:2.0];
            [v27 createPowerEventIntervalWithRootNodeID:v20 withPower:v28 withStartDate:v33 withEndDate:1.0];

            id v15 = v55;
            break;
          case 2:
            v34 = [MEMORY[0x1E4F92900] debugInstance];
            id v35 = [v9 dateByAddingTimeInterval:0.0];
            [v34 createPowerEventBackwardWithRootNodeID:v20 withPower:v35 withEndDate:0.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:0.0];
            uint64_t v36 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v37 = [v9 dateByAddingTimeInterval:1.0];
            [v36 createPowerEventBackwardWithRootNodeID:v20 withPower:v37 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:1.0];
            double v27 = [MEMORY[0x1E4F92900] debugInstance];
            double v29 = 2.0;
            v28 = [v9 dateByAddingTimeInterval:2.0];
            [v27 createPowerEventBackwardWithRootNodeID:v20 withPower:v28 withEndDate:2.0];
            break;
          case 1:
            uint64_t v23 = [MEMORY[0x1E4F92900] debugInstance];
            int v24 = [v9 dateByAddingTimeInterval:0.0];
            [v23 createPowerEventForwardWithRootNodeID:v20 withPower:v24 withStartDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:1.0];
            int v25 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v26 = [v9 dateByAddingTimeInterval:1.0];
            [v25 createPowerEventForwardWithRootNodeID:v20 withPower:v26 withStartDate:2.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:2.0];
            double v27 = [MEMORY[0x1E4F92900] debugInstance];
            v28 = [v9 dateByAddingTimeInterval:2.0];
            double v29 = 3.0;
            [v27 createPowerEventForwardWithRootNodeID:v20 withPower:v28 withStartDate:3.0];
            break;
          default:
            uint64_t v49 = v15;
            goto LABEL_27;
        }

        [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v20 withPower:v29];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  uint64_t v38 = [MEMORY[0x1E4F92900] debugInstance];
  v39 = [v9 dateByAddingTimeInterval:0.0];
  [v38 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9C98 withStartDate:v39];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.5];
  uint64_t v40 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v41 = [v9 dateByAddingTimeInterval:3.0];
  [v40 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9CC0 withStartDate:v41];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.5];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v42 = v15;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v57 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = [*(id *)(*((void *)&v56 + 1) + 8 * j) intValue];
        id v48 = [&unk_1F29EDD48 objectAtIndexedSubscript:(int)v47];
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v48, v47, (5.0 / (double)(unint64_t)[v42 count] + -1.0) / 3600.0);
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v44);
  }

  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", @"App1", 10, (5.0 / (double)(unint64_t)[v42 count] + -1.0) * 0.5 / 3600.0);
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", @"App2", 10, (5.0 / (double)(unint64_t)[v42 count] + -1.0) * 0.5 / 3600.0);
  uint64_t v49 = [NSString stringWithFormat:@"end"];
  uint64_t v50 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  long long v52 = [v51 lastPathComponent];
  uint64_t v53 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrection4]"];
  [v50 logMessage:v49 fromFile:v52 fromFunction:v53 fromLineNumber:911];

  long long v54 = PLLogCommon();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v67 = v49;
    _os_log_debug_impl(&dword_1D2690000, v54, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  id v15 = v55;
LABEL_27:
}

- (void)testQualification1
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testQualification1]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:916];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  long long v65 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v9 = [MEMORY[0x1E4F92900] allQualificationIDs];
  double v10 = (void *)[v9 mutableCopy];

  [v10 removeObject:&unk_1F29E6250];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v70 objects:v75 count:16];
  id v63 = v11;
  long long v64 = self;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v71;
LABEL_5:
    uint64_t v15 = 0;
    while (2)
    {
      if (*(void *)v71 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = [*(id *)(*((void *)&v70 + 1) + 8 * v15) intValue];
      uint64_t v17 = [&unk_1F29EDD60 objectAtIndexedSubscript:(int)v16];
      int v18 = [v17 intValue];

      switch(v18)
      {
        case 1:
          uint64_t v19 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v20 = [v65 dateByAddingTimeInterval:0.0];
          [v19 createQualificationEventForwardWithQualificationID:v16 withChildNodeNames:&unk_1F29EDD78 withStartDate:v20];

          [(PLAccountingDebugService *)v64 verifyLastQualificationEventWithQualificationID:v16 withNodeName:@"__GLOBAL__"];
          self = v64;
          uint64_t v21 = [MEMORY[0x1E4F92900] debugInstance];
          int v22 = [v65 dateByAddingTimeInterval:5.0];
          [v21 createQualificationEventForwardWithQualificationID:v16 withChildNodeNames:&unk_1F29EDD90 withStartDate:v22];
          goto LABEL_13;
        case 2:
          uint64_t v23 = [MEMORY[0x1E4F92900] debugInstance];
          int v24 = [v65 dateByAddingTimeInterval:0.0];
          [v23 createQualificationEventBackwardWithQualificationID:v16 withChildNodeNames:&unk_1F29EDDA8 withEndDate:v24];

          [(PLAccountingDebugService *)v64 verifyLastQualificationEventWithQualificationID:v16 withNodeName:@"__GLOBAL__"];
          self = v64;
          uint64_t v21 = [MEMORY[0x1E4F92900] debugInstance];
          int v22 = [v65 dateByAddingTimeInterval:5.0];
          [v21 createQualificationEventBackwardWithQualificationID:v16 withChildNodeNames:&unk_1F29EDDC0 withEndDate:v22];
          goto LABEL_13;
        case 3:
          uint64_t v21 = [MEMORY[0x1E4F92900] debugInstance];
          int v22 = [v65 dateByAddingTimeInterval:0.0];
          int v25 = [v65 dateByAddingTimeInterval:5.0];
          [v21 createQualificationEventIntervalWithQualificationID:v16 withChildNodeNames:&unk_1F29EDDD8 withStartDate:v22 withEndDate:v25];

          id v11 = v63;
          goto LABEL_13;
        case 4:
          uint64_t v21 = [MEMORY[0x1E4F92900] debugInstance];
          int v22 = [v65 dateByAddingTimeInterval:1.0];
          [v21 createQualificationEventPointWithQualificationID:v16 withChildNodeNames:&unk_1F29EDDF0 withStartDate:v22];
LABEL_13:

          [(PLAccountingDebugService *)self verifyLastQualificationEventWithQualificationID:v16 withNodeName:@"__GLOBAL__"];
          if (v13 != ++v15) {
            continue;
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v70 objects:v75 count:16];
          if (!v13) {
            goto LABEL_15;
          }
          goto LABEL_5;
        default:
          id v29 = v11;
          goto LABEL_34;
      }
    }
  }
LABEL_15:

  uint64_t v26 = [MEMORY[0x1E4F92900] debugInstance];
  double v27 = [v65 dateByAddingTimeInterval:0.0];
  v28 = [v65 dateByAddingTimeInterval:1.0];
  [v26 addPowerMeasurementEventIntervalWithPower:v27 withStartDate:v28 withEndDate:5.0];

  [MEMORY[0x1E4F92900] deviceRootNodeIDs];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [v29 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v67;
    while (2)
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v67 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = [*(id *)(*((void *)&v66 + 1) + 8 * i) intValue];
        id v35 = [&unk_1F29EDE08 objectAtIndexedSubscript:(int)v34];
        int v36 = [v35 intValue];

        switch(v36)
        {
          case 3:
            uint64_t v41 = [MEMORY[0x1E4F92900] debugInstance];
            id v42 = [v65 dateByAddingTimeInterval:0.0];
            double v43 = 1.0;
            [v65 dateByAddingTimeInterval:1.0];
            v45 = id v44 = v29;
            [v41 createPowerEventIntervalWithRootNodeID:v34 withPower:v42 withStartDate:v45 withEndDate:1.0];

            id v29 = v44;
            break;
          case 2:
            v46 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v47 = [v65 dateByAddingTimeInterval:0.0];
            [v46 createPowerEventBackwardWithRootNodeID:v34 withPower:v47 withEndDate:0.0];

            [(PLAccountingDebugService *)v64 verifyLastPowerEventWithRootNodeID:v34 withPower:0.0];
            id v48 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v49 = [v65 dateByAddingTimeInterval:1.0];
            [v48 createPowerEventBackwardWithRootNodeID:v34 withPower:v49 withEndDate:1.0];

            [(PLAccountingDebugService *)v64 verifyLastPowerEventWithRootNodeID:v34 withPower:1.0];
            uint64_t v41 = [MEMORY[0x1E4F92900] debugInstance];
            double v43 = 2.0;
            id v42 = [v65 dateByAddingTimeInterval:2.0];
            [v41 createPowerEventBackwardWithRootNodeID:v34 withPower:v42 withEndDate:2.0];
            break;
          case 1:
            uint64_t v37 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v38 = [v65 dateByAddingTimeInterval:0.0];
            [v37 createPowerEventForwardWithRootNodeID:v34 withPower:v38 withStartDate:1.0];

            [(PLAccountingDebugService *)v64 verifyLastPowerEventWithRootNodeID:v34 withPower:1.0];
            v39 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v40 = [v65 dateByAddingTimeInterval:1.0];
            [v39 createPowerEventForwardWithRootNodeID:v34 withPower:v40 withStartDate:2.0];

            [(PLAccountingDebugService *)v64 verifyLastPowerEventWithRootNodeID:v34 withPower:2.0];
            uint64_t v41 = [MEMORY[0x1E4F92900] debugInstance];
            id v42 = [v65 dateByAddingTimeInterval:2.0];
            double v43 = 3.0;
            [v41 createPowerEventForwardWithRootNodeID:v34 withPower:v42 withStartDate:3.0];
            break;
          default:
            long long v57 = v29;
            goto LABEL_33;
        }

        [(PLAccountingDebugService *)v64 verifyLastPowerEventWithRootNodeID:v34 withPower:v43];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  uint64_t v50 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v51 = [v65 dateByAddingTimeInterval:0.0];
  [v50 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9CE8 withStartDate:v51];

  [(PLAccountingDebugService *)v64 verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)v64 verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.5];
  long long v52 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v53 = [v65 dateByAddingTimeInterval:3.0];
  [v52 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9D10 withStartDate:v53];

  [(PLAccountingDebugService *)v64 verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)v64 verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.5];
  long long v54 = [MEMORY[0x1E4F92900] debugInstance];
  id v55 = [v65 dateByAddingTimeInterval:0.0];
  [v54 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EDE20 withStartDate:v55];

  long long v56 = [&unk_1F29EDE38 objectAtIndexedSubscript:10];
  [(PLAccountingDebugService *)v64 verifyAggregateRootNodeEnergyWithNodeName:v56 withRootNodeID:10 withEnergy:v65 withDate:0.0];

  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](v64, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", @"App1", 10, v65, 5.0 / (double)(unint64_t)[v29 count] * 0.5 / 3600.0);
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](v64, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 2, 10, @"App1", v65, 5.0 / (double)(unint64_t)[v29 count] * 0.5 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](v64, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", @"App2", 10, v65, 5.0 / (double)(unint64_t)[v29 count] * 0.5 / 3600.0);
  long long v57 = [NSString stringWithFormat:@"end"];
  long long v58 = (void *)MEMORY[0x1E4F929B8];
  long long v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  long long v60 = [v59 lastPathComponent];
  long long v61 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testQualification1]"];
  [v58 logMessage:v57 fromFile:v60 fromFunction:v61 fromLineNumber:1093];

  long long v62 = PLLogCommon();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v57;
    _os_log_debug_impl(&dword_1D2690000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_33:
  id v11 = v63;

LABEL_34:
}

- (void)testQualification2
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testQualification2]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1097];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v86 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [MEMORY[0x1E4F92900] allQualificationIDs];
  id v11 = (void *)[v10 mutableCopy];

  [v11 removeObject:&unk_1F29E6250];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v79 objects:v84 count:16];
  id v73 = v12;
  v74 = self;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v80;
LABEL_5:
    uint64_t v16 = 0;
    while (2)
    {
      if (*(void *)v80 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v79 + 1) + 8 * v16), "intValue", v73);
      int v18 = [&unk_1F29EDE50 objectAtIndexedSubscript:(int)v17];
      int v19 = [v18 intValue];

      switch(v19)
      {
        case 1:
          uint64_t v20 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v21 = [v9 dateByAddingTimeInterval:0.0];
          [v20 createQualificationEventForwardWithQualificationID:v17 withChildNodeNames:&unk_1F29EDE68 withStartDate:v21];

          [(PLAccountingDebugService *)v74 verifyLastQualificationEventWithQualificationID:v17 withNodeName:@"__GLOBAL__"];
          self = v74;
          int v22 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v23 = [v9 dateByAddingTimeInterval:5.0];
          [v22 createQualificationEventForwardWithQualificationID:v17 withChildNodeNames:&unk_1F29EDE80 withStartDate:v23];
          goto LABEL_13;
        case 2:
          int v24 = [MEMORY[0x1E4F92900] debugInstance];
          int v25 = [v9 dateByAddingTimeInterval:0.0];
          [v24 createQualificationEventBackwardWithQualificationID:v17 withChildNodeNames:&unk_1F29EDE98 withEndDate:v25];

          [(PLAccountingDebugService *)v74 verifyLastQualificationEventWithQualificationID:v17 withNodeName:@"__GLOBAL__"];
          self = v74;
          int v22 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v23 = [v9 dateByAddingTimeInterval:5.0];
          [v22 createQualificationEventBackwardWithQualificationID:v17 withChildNodeNames:&unk_1F29EDEB0 withEndDate:v23];
          goto LABEL_13;
        case 3:
          int v22 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v23 = [v9 dateByAddingTimeInterval:0.0];
          uint64_t v26 = [v9 dateByAddingTimeInterval:5.0];
          [v22 createQualificationEventIntervalWithQualificationID:v17 withChildNodeNames:&unk_1F29EDEC8 withStartDate:v23 withEndDate:v26];

          id v12 = v73;
          goto LABEL_13;
        case 4:
          int v22 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v23 = [v9 dateByAddingTimeInterval:0.0];
          [v22 createQualificationEventPointWithQualificationID:v17 withChildNodeNames:&unk_1F29EDEE0 withStartDate:v23];
LABEL_13:

          [(PLAccountingDebugService *)self verifyLastQualificationEventWithQualificationID:v17 withNodeName:@"__GLOBAL__"];
          if (v14 != ++v16) {
            continue;
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v79 objects:v84 count:16];
          if (!v14) {
            goto LABEL_15;
          }
          goto LABEL_5;
        default:
          id v38 = v12;
          goto LABEL_34;
      }
    }
  }
LABEL_15:

  double v27 = [MEMORY[0x1E4F92900] debugInstance];
  v28 = [v9 dateByAddingTimeInterval:0.0];
  [v27 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EDEF8 withStartDate:v28];

  [(PLAccountingDebugService *)self verifyLastQualificationEventWithQualificationID:2 withNodeName:@"locationd"];
  id v29 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v30 = [v9 dateByAddingTimeInterval:1.0];
  [v29 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EDF10 withStartDate:v30];

  [(PLAccountingDebugService *)self verifyLastQualificationEventWithQualificationID:2 withNodeName:@"locationd"];
  [(PLAccountingDebugService *)self verifyLastQualificationEventWithQualificationID:2 withNodeName:@"App1"];
  uint64_t v31 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v32 = [v9 dateByAddingTimeInterval:3.0];
  [v31 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EDF28 withStartDate:v32];

  [(PLAccountingDebugService *)self verifyLastQualificationEventWithQualificationID:2 withNodeName:@"locationd"];
  uint64_t v33 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v34 = [v9 dateByAddingTimeInterval:0.0];
  id v35 = [v9 dateByAddingTimeInterval:3.0];
  [v33 addPowerMeasurementEventIntervalWithPower:v34 withStartDate:v35 withEndDate:5.0];

  int v36 = [MEMORY[0x1E4F92900] deviceRootNodeIDs];
  uint64_t v37 = (void *)[v36 mutableCopy];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v38 = v37;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v76;
    while (2)
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v76 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = objc_msgSend(*(id *)(*((void *)&v75 + 1) + 8 * v42), "intValue", v73);
        id v44 = [&unk_1F29EDF40 objectAtIndexedSubscript:(int)v43];
        int v45 = [v44 intValue];

        switch(v45)
        {
          case 3:
            long long v52 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v53 = [v9 dateByAddingTimeInterval:0.0];
            [v9 dateByAddingTimeInterval:1.0];
            v55 = id v54 = v38;
            [v52 createPowerEventIntervalWithRootNodeID:v43 withPower:v53 withStartDate:v55 withEndDate:1.0];

            [(PLAccountingDebugService *)v74 verifyLastPowerEventWithRootNodeID:v43 withPower:1.0];
            self = v74;
            uint64_t v50 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v51 = [v9 dateByAddingTimeInterval:1.0];
            long long v56 = [v9 dateByAddingTimeInterval:2.0];
            [v50 createPowerEventIntervalWithRootNodeID:v43 withPower:v51 withStartDate:v56 withEndDate:1.0];

            id v38 = v54;
            break;
          case 2:
            long long v57 = [MEMORY[0x1E4F92900] debugInstance];
            long long v58 = [v9 dateByAddingTimeInterval:0.0];
            [v57 createPowerEventBackwardWithRootNodeID:v43 withPower:v58 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v43 withPower:1.0];
            long long v59 = [MEMORY[0x1E4F92900] debugInstance];
            long long v60 = [v9 dateByAddingTimeInterval:1.0];
            [v59 createPowerEventBackwardWithRootNodeID:v43 withPower:v60 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v43 withPower:1.0];
            uint64_t v50 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v51 = [v9 dateByAddingTimeInterval:2.0];
            [v50 createPowerEventBackwardWithRootNodeID:v43 withPower:v51 withEndDate:1.0];
            break;
          case 1:
            v46 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v47 = [v9 dateByAddingTimeInterval:0.0];
            [v46 createPowerEventForwardWithRootNodeID:v43 withPower:v47 withStartDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v43 withPower:1.0];
            id v48 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v49 = [v9 dateByAddingTimeInterval:1.0];
            [v48 createPowerEventForwardWithRootNodeID:v43 withPower:v49 withStartDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v43 withPower:1.0];
            uint64_t v50 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v51 = [v9 dateByAddingTimeInterval:2.0];
            [v50 createPowerEventForwardWithRootNodeID:v43 withPower:v51 withStartDate:1.0];
            break;
          default:
            long long v67 = v38;
            goto LABEL_33;
        }

        [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v43 withPower:1.0];
        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [v38 countByEnumeratingWithState:&v75 objects:v83 count:16];
      if (v40) {
        continue;
      }
      break;
    }
  }

  long long v61 = [MEMORY[0x1E4F92900] debugInstance];
  long long v62 = [v9 dateByAddingTimeInterval:0.0];
  [v61 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9D38 withStartDate:v62];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.5];
  id v63 = [MEMORY[0x1E4F92900] debugInstance];
  long long v64 = [v9 dateByAddingTimeInterval:3.0];
  [v63 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9D60 withStartDate:v64];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.5];
  long long v65 = [&unk_1F29EDF58 objectAtIndexedSubscript:10];
  [(PLAccountingDebugService *)self verifyAggregateRootNodeEnergyWithNodeName:v65 withRootNodeID:10 withEnergy:v9 withDate:0.0];

  long long v66 = [&unk_1F29EDF70 objectAtIndexedSubscript:10];
  [(PLAccountingDebugService *)self verifyAggregateQualificationEnergyWithQualificationID:2 withRootNodeID:10 withNodeName:v66 withQualificationEnergy:v9 withDate:0.0];

  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", @"App1", 10, v9, 5.0 / (double)(unint64_t)[v38 count] / 3600.0);
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](self, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 2, 10, @"App1", v9, 5.0 / (double)(unint64_t)[v38 count] * 0.25 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", @"App2", 10, v9, 5.0 / (double)(unint64_t)[v38 count] / 3600.0);
  [(PLAccountingDebugService *)self verifyAggregateQualificationEnergyWithQualificationID:2 withRootNodeID:10 withNodeName:@"App2" withQualificationEnergy:v9 withDate:0.0];
  long long v67 = [NSString stringWithFormat:@"end"];
  long long v68 = (void *)MEMORY[0x1E4F929B8];
  long long v69 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  long long v70 = [v69 lastPathComponent];
  long long v71 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testQualification2]"];
  [v68 logMessage:v67 fromFile:v70 fromFunction:v71 fromLineNumber:1307];

  long long v72 = PLLogCommon();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v86 = v67;
    _os_log_debug_impl(&dword_1D2690000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_33:
  id v12 = v73;

LABEL_34:
}

- (void)testQualification3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testQualification3]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1311];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v82 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [MEMORY[0x1E4F92900] allQualificationIDs];
  id v11 = (void *)[v10 mutableCopy];

  [v11 removeObject:&unk_1F29E6280];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v75 objects:v80 count:16];
  id v69 = v12;
  long long v70 = self;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v76;
LABEL_5:
    uint64_t v16 = 0;
    while (2)
    {
      if (*(void *)v76 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v75 + 1) + 8 * v16), "intValue", v69);
      int v18 = [&unk_1F29EDF88 objectAtIndexedSubscript:(int)v17];
      int v19 = [v18 intValue];

      switch(v19)
      {
        case 1:
          uint64_t v20 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v21 = [v9 dateByAddingTimeInterval:0.0];
          [v20 createQualificationEventForwardWithQualificationID:v17 withChildNodeNames:&unk_1F29EDFA0 withStartDate:v21];

          [(PLAccountingDebugService *)v70 verifyLastQualificationEventWithQualificationID:v17 withNodeName:@"__GLOBAL__"];
          self = v70;
          int v22 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v23 = [v9 dateByAddingTimeInterval:5.0];
          [v22 createQualificationEventForwardWithQualificationID:v17 withChildNodeNames:&unk_1F29EDFB8 withStartDate:v23];
          goto LABEL_13;
        case 2:
          int v24 = [MEMORY[0x1E4F92900] debugInstance];
          int v25 = [v9 dateByAddingTimeInterval:0.0];
          [v24 createQualificationEventBackwardWithQualificationID:v17 withChildNodeNames:&unk_1F29EDFD0 withEndDate:v25];

          [(PLAccountingDebugService *)v70 verifyLastQualificationEventWithQualificationID:v17 withNodeName:@"__GLOBAL__"];
          self = v70;
          int v22 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v23 = [v9 dateByAddingTimeInterval:5.0];
          [v22 createQualificationEventBackwardWithQualificationID:v17 withChildNodeNames:&unk_1F29EDFE8 withEndDate:v23];
          goto LABEL_13;
        case 3:
          int v22 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v23 = [v9 dateByAddingTimeInterval:0.0];
          uint64_t v26 = [v9 dateByAddingTimeInterval:5.0];
          [v22 createQualificationEventIntervalWithQualificationID:v17 withChildNodeNames:&unk_1F29EE000 withStartDate:v23 withEndDate:v26];

          id v12 = v69;
          goto LABEL_13;
        case 4:
          int v22 = [MEMORY[0x1E4F92900] debugInstance];
          uint64_t v23 = [v9 dateByAddingTimeInterval:0.0];
          [v22 createQualificationEventPointWithQualificationID:v17 withChildNodeNames:&unk_1F29EE018 withStartDate:v23];
LABEL_13:

          [(PLAccountingDebugService *)self verifyLastQualificationEventWithQualificationID:v17 withNodeName:@"__GLOBAL__"];
          if (v14 != ++v16) {
            continue;
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v75 objects:v80 count:16];
          if (!v14) {
            goto LABEL_15;
          }
          goto LABEL_5;
        default:
          id v36 = v12;
          goto LABEL_34;
      }
    }
  }
LABEL_15:

  double v27 = [MEMORY[0x1E4F92900] debugInstance];
  v28 = [v9 dateByAddingTimeInterval:0.0];
  [v27 createQualificationEventPointWithQualificationID:11 withChildNodeNames:&unk_1F29EE030 withStartDate:v28];

  [(PLAccountingDebugService *)self verifyLastQualificationEventWithQualificationID:11 withNodeName:@"App1"];
  id v29 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v30 = [v9 dateByAddingTimeInterval:1.0];
  [v29 createQualificationEventPointWithQualificationID:11 withChildNodeNames:&unk_1F29EE048 withStartDate:v30];

  [(PLAccountingDebugService *)self verifyLastQualificationEventWithQualificationID:11 withNodeName:@"App2"];
  uint64_t v31 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v32 = [v9 dateByAddingTimeInterval:0.0];
  uint64_t v33 = [v9 dateByAddingTimeInterval:3.0];
  [v31 addPowerMeasurementEventIntervalWithPower:v32 withStartDate:v33 withEndDate:5.0];

  uint64_t v34 = [MEMORY[0x1E4F92900] deviceRootNodeIDs];
  id v35 = (void *)[v34 mutableCopy];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v36 = v35;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v72;
    while (2)
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v72 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * v40), "intValue", v69);
        uint64_t v42 = [&unk_1F29EE060 objectAtIndexedSubscript:(int)v41];
        int v43 = [v42 intValue];

        switch(v43)
        {
          case 3:
            uint64_t v50 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v51 = [v9 dateByAddingTimeInterval:0.0];
            [v9 dateByAddingTimeInterval:1.0];
            v53 = id v52 = v36;
            [v50 createPowerEventIntervalWithRootNodeID:v41 withPower:v51 withStartDate:v53 withEndDate:1.0];

            [(PLAccountingDebugService *)v70 verifyLastPowerEventWithRootNodeID:v41 withPower:1.0];
            self = v70;
            id v48 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v49 = [v9 dateByAddingTimeInterval:1.0];
            id v54 = [v9 dateByAddingTimeInterval:2.0];
            [v48 createPowerEventIntervalWithRootNodeID:v41 withPower:v49 withStartDate:v54 withEndDate:1.0];

            id v36 = v52;
            break;
          case 2:
            id v55 = [MEMORY[0x1E4F92900] debugInstance];
            long long v56 = [v9 dateByAddingTimeInterval:0.0];
            [v55 createPowerEventBackwardWithRootNodeID:v41 withPower:v56 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v41 withPower:1.0];
            long long v57 = [MEMORY[0x1E4F92900] debugInstance];
            long long v58 = [v9 dateByAddingTimeInterval:1.0];
            [v57 createPowerEventBackwardWithRootNodeID:v41 withPower:v58 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v41 withPower:1.0];
            id v48 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v49 = [v9 dateByAddingTimeInterval:2.0];
            [v48 createPowerEventBackwardWithRootNodeID:v41 withPower:v49 withEndDate:1.0];
            break;
          case 1:
            id v44 = [MEMORY[0x1E4F92900] debugInstance];
            int v45 = [v9 dateByAddingTimeInterval:0.0];
            [v44 createPowerEventForwardWithRootNodeID:v41 withPower:v45 withStartDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v41 withPower:1.0];
            v46 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v47 = [v9 dateByAddingTimeInterval:1.0];
            [v46 createPowerEventForwardWithRootNodeID:v41 withPower:v47 withStartDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v41 withPower:1.0];
            id v48 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v49 = [v9 dateByAddingTimeInterval:2.0];
            [v48 createPowerEventForwardWithRootNodeID:v41 withPower:v49 withStartDate:1.0];
            break;
          default:
            id v63 = v36;
            goto LABEL_33;
        }

        [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v41 withPower:1.0];
        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [v36 countByEnumeratingWithState:&v71 objects:v79 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }

  long long v59 = [MEMORY[0x1E4F92900] debugInstance];
  long long v60 = [v9 dateByAddingTimeInterval:0.0];
  [v59 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:&unk_1F29E9D88 withEndDate:v60];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App2" withWeight:0.5];
  long long v61 = [&unk_1F29EE078 objectAtIndexedSubscript:2];
  [(PLAccountingDebugService *)self verifyAggregateRootNodeEnergyWithNodeName:v61 withRootNodeID:2 withEnergy:v9 withDate:0.0];

  long long v62 = [&unk_1F29EE090 objectAtIndexedSubscript:2];
  [(PLAccountingDebugService *)self verifyAggregateQualificationEnergyWithQualificationID:11 withRootNodeID:2 withNodeName:v62 withQualificationEnergy:v9 withDate:0.0];

  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", @"App1", 2, v9, 5.0 / (double)(unint64_t)[v36 count] / 3600.0);
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](self, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 11, 2, @"App1", v9, 5.0 / (double)(unint64_t)[v36 count] * 0.25 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", @"App2", 2, v9, 5.0 / (double)(unint64_t)[v36 count] / 3600.0);
  [(PLAccountingDebugService *)self verifyAggregateQualificationEnergyWithQualificationID:11 withRootNodeID:2 withNodeName:@"App2" withQualificationEnergy:v9 withDate:0.0];
  id v63 = [NSString stringWithFormat:@"end"];
  long long v64 = (void *)MEMORY[0x1E4F929B8];
  long long v65 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  long long v66 = [v65 lastPathComponent];
  long long v67 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testQualification3]"];
  [v64 logMessage:v63 fromFile:v66 fromFunction:v67 fromLineNumber:1503];

  long long v68 = PLLogCommon();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v82 = v63;
    _os_log_debug_impl(&dword_1D2690000, v68, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_33:
  id v12 = v69;

LABEL_34:
}

- (void)testReloadBefore1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadBefore1]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1509];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [NSString stringWithFormat:@"now=%@", v9];
  id v11 = (void *)MEMORY[0x1E4F929B8];
  id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v13 = [v12 lastPathComponent];
  uint64_t v14 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadBefore1]"];
  [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1512];

  uint64_t v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v10;
    _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v16 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v17 = [v9 dateByAddingTimeInterval:0.0];
  [v16 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9DB0 withStartDate:v17];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.5];
  int v18 = [MEMORY[0x1E4F92900] debugInstance];
  int v19 = [v9 dateByAddingTimeInterval:4.0];
  [v18 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9DD8 withStartDate:v19];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.75];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.25];
  uint64_t v20 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v21 = [v9 dateByAddingTimeInterval:0.0];
  [v20 createPowerEventForwardWithRootNodeID:10 withPower:v21 withStartDate:5.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:10 withPower:5.0];
  int v22 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v23 = [v9 dateByAddingTimeInterval:5.0];
  [v22 createPowerEventForwardWithRootNodeID:10 withPower:v23 withStartDate:10.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:10 withPower:10.0];
  int v24 = [NSString stringWithFormat:@"end"];
  int v25 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  double v27 = [v26 lastPathComponent];
  v28 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadBefore1]"];
  [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:1548];

  id v29 = PLLogCommon();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v24;
    _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testReloadAfter1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadAfter1]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1552];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F92AD0] sharedCore];
  double v10 = [v9 storage];
  id v11 = [MEMORY[0x1E4F92920] entryKey];
  id v12 = [v10 entriesForKey:v11];

  uint64_t v13 = [v12 firstObject];
  uint64_t v14 = [v13 range];
  uint64_t v15 = [v14 startDate];

  uint64_t v16 = [NSString stringWithFormat:@"now=%@", v15];
  uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
  int v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  int v19 = [v18 lastPathComponent];
  uint64_t v20 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadAfter1]"];
  [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:1558];

  uint64_t v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = v16;
    _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  int v22 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v23 = [v15 dateByAddingTimeInterval:6.0];
  [v22 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9E00 withStartDate:v23];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:1.0];
  int v24 = [&unk_1F29EE0A8 objectAtIndexedSubscript:10];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:v24 withTotalEnergy:10 withRootNodeID:0.00694444444 withEpsilon:0.001];

  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App1" withTotalEnergy:10 withRootNodeID:0.00381944444 withEpsilon:0.001];
  [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App2" withTotalEnergy:10 withRootNodeID:0.003125 withEpsilon:0.001];
  int v25 = [NSString stringWithFormat:@"end"];
  uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
  double v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v28 = [v27 lastPathComponent];
  id v29 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadAfter1]"];
  [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:1582];

  uint64_t v30 = PLLogCommon();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = v25;
    _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testReloadBefore2
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadBefore2]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1586];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [NSString stringWithFormat:@"now=%@", v9];
  id v11 = (void *)MEMORY[0x1E4F929B8];
  id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v13 = [v12 lastPathComponent];
  uint64_t v14 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadBefore2]"];
  [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1589];

  uint64_t v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = v10;
    _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v16 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v17 = [v9 dateByAddingTimeInterval:0.0];
  int v18 = [v9 dateByAddingTimeInterval:1.0];
  [v16 addPowerMeasurementEventIntervalWithPower:v17 withStartDate:v18 withEndDate:5.0];

  int v19 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v20 = [v9 dateByAddingTimeInterval:1.0];
  uint64_t v21 = [v9 dateByAddingTimeInterval:3.0];
  [v19 addPowerMeasurementEventIntervalWithPower:v20 withStartDate:v21 withEndDate:5.0];

  int v22 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v23 = [v9 dateByAddingTimeInterval:0.0];
  [v22 createPowerEventBackwardWithRootNodeID:2 withPower:v23 withEndDate:1.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:2 withPower:1.0];
  int v24 = [MEMORY[0x1E4F92900] debugInstance];
  int v25 = [v9 dateByAddingTimeInterval:1.0];
  [v24 createPowerEventBackwardWithRootNodeID:2 withPower:v25 withEndDate:1.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:2 withPower:1.0];
  uint64_t v26 = [MEMORY[0x1E4F92900] debugInstance];
  double v27 = [v9 dateByAddingTimeInterval:0.0];
  [v26 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:&unk_1F29E9E28 withEndDate:v27];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"kernel_task" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App1" withWeight:0.5];
  v28 = [MEMORY[0x1E4F92900] debugInstance];
  id v29 = [v9 dateByAddingTimeInterval:4.0];
  [v28 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:&unk_1F29E9E50 withEndDate:v29];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"kernel_task" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:33 withNodeName:@"App1" withWeight:0.5];
  uint64_t v30 = [NSString stringWithFormat:@"end"];
  uint64_t v31 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v33 = [v32 lastPathComponent];
  uint64_t v34 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadBefore2]"];
  [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:1634];

  id v35 = PLLogCommon();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = v30;
    _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testReloadAfter2
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadAfter2]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1637];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v79 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F92AD0] sharedCore];
  double v10 = [v9 storage];
  id v11 = [MEMORY[0x1E4F928F8] entryKey];
  id v12 = [v10 entriesForKey:v11];

  long long v65 = v12;
  long long v64 = [v12 firstObject];
  uint64_t v13 = [v64 range];
  uint64_t v14 = [v13 startDate];

  long long v67 = (void *)v14;
  uint64_t v15 = [NSString stringWithFormat:@"now=%@", v14];
  uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  int v18 = [v17 lastPathComponent];
  int v19 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadAfter2]"];
  [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:1643];

  uint64_t v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v79 = v15;
    _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v21 = [MEMORY[0x1E4F92900] deviceRootNodeIDs];
  int v22 = (void *)[v21 mutableCopy];

  [v22 removeObject:&unk_1F29E6250];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v23 = v22;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v77 count:16];
  id v66 = v23;
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v73;
    while (2)
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v73 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = [*(id *)(*((void *)&v72 + 1) + 8 * v27) intValue];
        id v29 = [&unk_1F29EE0C0 objectAtIndexedSubscript:(int)v28];
        int v30 = [v29 intValue];

        switch(v30)
        {
          case 3:
            uint64_t v38 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v39 = [v67 dateByAddingTimeInterval:0.0];
            uint64_t v40 = [v67 dateByAddingTimeInterval:1.0];
            [v38 createPowerEventIntervalWithRootNodeID:v28 withPower:v39 withStartDate:v40 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v28 withPower:1.0];
            id v35 = [MEMORY[0x1E4F92900] debugInstance];
            id v36 = [v67 dateByAddingTimeInterval:1.0];
            double v37 = 2.0;
            id v23 = v66;
            uint64_t v41 = [v67 dateByAddingTimeInterval:2.0];
            [v35 createPowerEventIntervalWithRootNodeID:v28 withPower:v36 withStartDate:v41 withEndDate:2.0];

            break;
          case 2:
            uint64_t v42 = [MEMORY[0x1E4F92900] debugInstance];
            int v43 = [v67 dateByAddingTimeInterval:0.0];
            [v42 createPowerEventBackwardWithRootNodeID:v28 withPower:v43 withEndDate:0.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v28 withPower:0.0];
            id v44 = [MEMORY[0x1E4F92900] debugInstance];
            int v45 = [v67 dateByAddingTimeInterval:1.0];
            [v44 createPowerEventBackwardWithRootNodeID:v28 withPower:v45 withEndDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v28 withPower:1.0];
            id v35 = [MEMORY[0x1E4F92900] debugInstance];
            double v37 = 2.0;
            id v36 = [v67 dateByAddingTimeInterval:2.0];
            [v35 createPowerEventBackwardWithRootNodeID:v28 withPower:v36 withEndDate:2.0];
            break;
          case 1:
            uint64_t v31 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v32 = [v67 dateByAddingTimeInterval:0.0];
            [v31 createPowerEventForwardWithRootNodeID:v28 withPower:v32 withStartDate:1.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v28 withPower:1.0];
            uint64_t v33 = [MEMORY[0x1E4F92900] debugInstance];
            uint64_t v34 = [v67 dateByAddingTimeInterval:1.0];
            [v33 createPowerEventForwardWithRootNodeID:v28 withPower:v34 withStartDate:2.0];

            [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v28 withPower:2.0];
            id v35 = [MEMORY[0x1E4F92900] debugInstance];
            id v36 = [v67 dateByAddingTimeInterval:2.0];
            double v37 = 3.0;
            [v35 createPowerEventForwardWithRootNodeID:v28 withPower:v36 withStartDate:3.0];
            break;
          default:
            long long v56 = v23;
            long long v62 = v64;
            id v63 = v65;
            goto LABEL_29;
        }

        [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:v28 withPower:v37];
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v72 objects:v77 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v46 = v23;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v69;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v69 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = [*(id *)(*((void *)&v68 + 1) + 8 * v50) intValue];
        id v52 = [&unk_1F29EE0D8 objectAtIndexedSubscript:(int)v51];
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v52, v51, (5.0 / (double)(unint64_t)([v46 count] + 1) + -1.0) / 3600.0);

        uint64_t v53 = [&unk_1F29EE0F0 objectAtIndexedSubscript:(int)v51];
        -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", v53, v51, v67, 5.0 / (double)(unint64_t)([v46 count] + 1) / 3600.0);

        ++v50;
      }
      while (v48 != v50);
      uint64_t v48 = [v46 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v48);
  }

  id v54 = [&unk_1F29EE108 objectAtIndexedSubscript:2];
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v54, 2, (5.0 / (double)(unint64_t)([v46 count] + 1) + -1.0) / 3600.0);

  id v55 = [&unk_1F29EE120 objectAtIndexedSubscript:2];
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", v55, 2, v67, 5.0 / (double)(unint64_t)([v46 count] + 1) / 3600.0);

  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", @"kernel_task", 2, (5.0 / (double)(unint64_t)([v46 count] + 1) + -1.0) * 0.5 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", @"kernel_task", 2, v67, ((5.0 / (double)(unint64_t)([v46 count] + 1) + -1.0) * 0.5 + 0.5) / 3600.0);
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", @"App1", 2, (5.0 / (double)(unint64_t)([v46 count] + 1) + -1.0) * 3.0 * 0.25 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", @"App1", 2, v67, ((5.0 / (double)(unint64_t)([v46 count] + 1) + -1.0) * 3.0 * 0.25 + 0.5 + 0.25) / 3600.0);
  long long v56 = [NSString stringWithFormat:@"end"];
  long long v57 = (void *)MEMORY[0x1E4F929B8];
  long long v58 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  long long v59 = [v58 lastPathComponent];
  long long v60 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testReloadAfter2]"];
  [v57 logMessage:v56 fromFile:v59 fromFunction:v60 fromLineNumber:1750];

  long long v61 = PLLogCommon();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v79 = v56;
    _os_log_debug_impl(&dword_1D2690000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  long long v62 = v64;
  id v63 = v65;
  id v23 = v66;
LABEL_29:
}

- (void)testChunk
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testChunk]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1756];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v42 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v10 = [MEMORY[0x1E4F92900] debugInstance];
  double v11 = 0.0;
  id v12 = [v9 dateByAddingTimeInterval:0.0];
  [v10 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9E78 withStartDate:v12];

  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App1" withWeight:0.5];
  [(PLAccountingDebugService *)self verifyLastDistributionEventWithDistributionID:1 withNodeName:@"App2" withWeight:0.5];
  uint64_t v13 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v40 = v9;
  uint64_t v14 = [v9 dateByAddingTimeInterval:1.0];
  [v13 createPowerEventForwardWithRootNodeID:10 withPower:v14 withStartDate:5.0];

  [(PLAccountingDebugService *)self verifyLastPowerEventWithRootNodeID:10 withPower:5.0];
  [MEMORY[0x1E4F92900] maxPowerEventChunkInterval];
  sleep((v15 * 0.5));
  uint64_t v16 = 0;
  do
  {
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"i=%i", v16);
    int v18 = (void *)MEMORY[0x1E4F929B8];
    int v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
    uint64_t v20 = [v19 lastPathComponent];
    uint64_t v21 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testChunk]"];
    [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:1782];

    int v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v17;
      _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    id v23 = [&unk_1F29EE138 objectAtIndexedSubscript:10];
    [MEMORY[0x1E4F92900] maxPowerEventChunkInterval];
    double v25 = v24 * v11 * 5.0 / 3600.0;
    [MEMORY[0x1E4F92900] maxPowerEventChunkInterval];
    [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:v23 withTotalEnergy:10 withRootNodeID:v25 withEpsilon:v26 * 5.0 * 0.5];

    [MEMORY[0x1E4F92900] maxPowerEventChunkInterval];
    double v28 = v27 * v11 * 5.0 * 0.5 / 3600.0;
    [MEMORY[0x1E4F92900] maxPowerEventChunkInterval];
    [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App1" withTotalEnergy:10 withRootNodeID:v28 withEpsilon:v29 * 5.0 * 0.25];
    [MEMORY[0x1E4F92900] maxPowerEventChunkInterval];
    double v31 = v30 * v11 * 5.0 * 0.5 / 3600.0;
    [MEMORY[0x1E4F92900] maxPowerEventChunkInterval];
    [(PLAccountingDebugService *)self verifyTotalEnergyWithNodeName:@"App2" withTotalEnergy:10 withRootNodeID:v31 withEpsilon:v32 * 5.0 * 0.25];
    [MEMORY[0x1E4F92900] maxPowerEventChunkInterval];
    sleep(v33);
    double v11 = v11 + 1.0;
    uint64_t v16 = (v16 + 1);
  }
  while (v16 != 3);
  uint64_t v34 = [NSString stringWithFormat:@"end"];
  id v35 = (void *)MEMORY[0x1E4F929B8];
  id v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  double v37 = [v36 lastPathComponent];
  uint64_t v38 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testChunk]"];
  [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:1798];

  uint64_t v39 = PLLogCommon();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v42 = v34;
    _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)testPerformance
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"begin"];
  v4 = (void *)MEMORY[0x1E4F929B8];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1802];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v59 = 0x3032000000;
  long long v60 = __Block_byref_object_copy__8;
  long long v61 = __Block_byref_object_dispose__8;
  id v62 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v9 = dispatch_group_create();
  double v10 = [MEMORY[0x1E4F92A88] workQueueForKey:@"testPerformance1"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PLAccountingDebugService_testPerformance__block_invoke;
  block[3] = &unk_1E692D8B8;
  block[4] = &buf;
  long long v35 = xmmword_1D2B02DC0;
  long long v54 = xmmword_1D2B02DC0;
  dispatch_async(v10, block);

  double v11 = [MEMORY[0x1E4F92A88] workQueueForKey:@"testPerformance1"];
  dispatch_group_async(v9, v11, &__block_literal_global_27);

  id v12 = [MEMORY[0x1E4F92A88] workQueueForKey:@"testPerformance2"];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __43__PLAccountingDebugService_testPerformance__block_invoke_649;
  v51[3] = &unk_1E692D8B8;
  v51[4] = &buf;
  long long v52 = xmmword_1D2B02DD0;
  dispatch_async(v12, v51);

  uint64_t v13 = [MEMORY[0x1E4F92A88] workQueueForKey:@"testPerformance2"];
  dispatch_group_async(v9, v13, &__block_literal_global_662);

  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__8;
  uint64_t v49 = __Block_byref_object_dispose__8;
  uint64_t v14 = [MEMORY[0x1E4F92900] deviceRootNodeIDs];
  id v50 = (id)[v14 mutableCopy];

  double v15 = [MEMORY[0x1E4F92A88] workQueueForKey:@"testPerformance3"];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __43__PLAccountingDebugService_testPerformance__block_invoke_669;
  v42[3] = &unk_1E692D8E0;
  long long v43 = xmmword_1D2B02DE0;
  uint64_t v44 = 0x4000000000000000;
  v42[4] = &buf;
  v42[5] = &v45;
  dispatch_async(v15, v42);

  uint64_t v16 = [MEMORY[0x1E4F92A88] workQueueForKey:@"testPerformance3"];
  dispatch_group_async(v9, v16, &__block_literal_global_681);

  uint64_t v17 = [MEMORY[0x1E4F92A88] workQueueForKey:@"testPerformance4"];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __43__PLAccountingDebugService_testPerformance__block_invoke_688;
  v40[3] = &unk_1E692D8B8;
  v40[4] = &buf;
  long long v41 = xmmword_1D2B02DC0;
  dispatch_async(v17, v40);

  int v18 = [MEMORY[0x1E4F92A88] workQueueForKey:@"testPerformance4"];
  dispatch_group_async(v9, v18, &__block_literal_global_715);

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v19 = [(id)v46[5] count];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = (id)v46[5];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v57 count:16];
  double v22 = 20.0 / (double)v19 + -4.0;
  if (v21)
  {
    uint64_t v23 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "intValue", v35, (void)v36);
        double v26 = [&unk_1F29EE1F8 objectAtIndexedSubscript:(int)v25];
        [(PLAccountingDebugService *)self verifyTotalCorrectionEnergyWithNodeName:v26 withTotalCorrectionEnergy:v25 withRootNodeID:v22 / 3600.0];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v57 count:16];
    }
    while (v21);
  }

  double v27 = v22 * 0.5 / 3600.0;
  [(PLAccountingDebugService *)self verifyTotalCorrectionEnergyWithNodeName:@"apsd" withTotalCorrectionEnergy:11 withRootNodeID:v27];
  [(PLAccountingDebugService *)self verifyAggregateRootNodeEnergyWithNodeName:@"apsd" withRootNodeID:11 withEnergy:*(void *)(*((void *)&buf + 1) + 40) withDate:0.0];
  [(PLAccountingDebugService *)self verifyTotalCorrectionEnergyWithNodeName:@"App1" withTotalCorrectionEnergy:11 withRootNodeID:v27];
  double v28 = (v22 + 4.0) * 0.5 / 3600.0;
  [(PLAccountingDebugService *)self verifyAggregateRootNodeEnergyWithNodeName:@"App1" withRootNodeID:11 withEnergy:*(void *)(*((void *)&buf + 1) + 40) withDate:v28];
  [(PLAccountingDebugService *)self verifyTotalCorrectionEnergyWithNodeName:@"App2" withTotalCorrectionEnergy:11 withRootNodeID:v27];
  [(PLAccountingDebugService *)self verifyAggregateRootNodeEnergyWithNodeName:@"App2" withRootNodeID:11 withEnergy:*(void *)(*((void *)&buf + 1) + 40) withDate:v28];
  [(PLAccountingDebugService *)self verifyAggregateQualificationEnergyWithQualificationID:2 withRootNodeID:11 withNodeName:@"App2" withQualificationEnergy:*(void *)(*((void *)&buf + 1) + 40) withDate:v28];
  double v29 = [NSString stringWithFormat:@"end"];
  double v30 = (void *)MEMORY[0x1E4F929B8];
  double v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  double v32 = [v31 lastPathComponent];
  double v33 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]"];
  [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:2019];

  uint64_t v34 = PLLogCommon();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v55 = 138412290;
    long long v56 = v29;
    _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "%@", v55, 0xCu);
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&buf, 8);
}

void __43__PLAccountingDebugService_testPerformance__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [NSString stringWithFormat:@"begin testPerformance1"];
  v3 = (void *)MEMORY[0x1E4F929B8];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v5 = [v4 lastPathComponent];
  uint64_t v6 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:1812];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    int v18 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }

  for (double i = *(double *)(a1 + 40); i <= 5.0; double i = i + *(double *)(a1 + 48))
  {
    uint64_t v9 = [MEMORY[0x1E4F92900] debugInstance];
    double v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:i];
    [v9 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:&unk_1F29E9EA0 withStartDate:v10];

    sleep(*(double *)(a1 + 48));
  }
  double v11 = [NSString stringWithFormat:@"end testPerformance1"];
  id v12 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v14 = [v13 lastPathComponent];
  double v15 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1825];

  uint64_t v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    int v18 = v11;
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }
}

void __43__PLAccountingDebugService_testPerformance__block_invoke_642()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = [NSString stringWithFormat:@"join testPerformance1"];
  v1 = (void *)MEMORY[0x1E4F929B8];
  objc_super v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v3 = [v2 lastPathComponent];
  v4 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:1828];

  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    uint64_t v7 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }
}

void __43__PLAccountingDebugService_testPerformance__block_invoke_649(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [NSString stringWithFormat:@"begin testPerformance2"];
  v3 = (void *)MEMORY[0x1E4F929B8];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v5 = [v4 lastPathComponent];
  int v6 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:1835];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    int v18 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }

  for (double i = *(double *)(a1 + 40); i <= 5.0; double i = i + *(double *)(a1 + 48))
  {
    uint64_t v9 = [MEMORY[0x1E4F92900] debugInstance];
    double v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:i];
    [v9 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:&unk_1F29E9EC8 withStartDate:v10];

    sleep(*(double *)(a1 + 48));
  }
  double v11 = [NSString stringWithFormat:@"end testPerformance2"];
  id v12 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v14 = [v13 lastPathComponent];
  double v15 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1848];

  uint64_t v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    int v18 = v11;
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }
}

void __43__PLAccountingDebugService_testPerformance__block_invoke_660()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = [NSString stringWithFormat:@"join testPerformance2"];
  v1 = (void *)MEMORY[0x1E4F929B8];
  objc_super v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v3 = [v2 lastPathComponent];
  v4 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:1851];

  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    uint64_t v7 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }
}

void __43__PLAccountingDebugService_testPerformance__block_invoke_669(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = 0x1E4F29000uLL;
  v3 = [NSString stringWithFormat:@"begin testPerformance3"];
  unint64_t v4 = 0x1E4F92000uLL;
  v5 = (void *)MEMORY[0x1E4F929B8];
  int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  uint64_t v8 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v5 logMessage:v3 fromFile:v7 fromFunction:v8 fromLineNumber:1861];

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v43 = (uint64_t)v3;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  double v10 = *(double *)(a1 + 48);
  if (v10 <= 5.0)
  {
    unint64_t v17 = 0x1E4F92000uLL;
    int v18 = &unk_1F29EE150;
    do
    {
      uint64_t v19 = [*(id *)(v17 + 2304) debugInstance];
      double v20 = *(double *)(a1 + 56);
      uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v10];
      double v22 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v10 + *(double *)(a1 + 64)];
      [v19 addPowerMeasurementEventIntervalWithPower:v21 withStartDate:v22 withEndDate:v20];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v23 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      unint64_t v24 = v17;
      if (v23)
      {
        uint64_t v25 = v23;
        uint64_t v26 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v38 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = [*(id *)(*((void *)&v37 + 1) + 8 * i) intValue];
            double v29 = [v18 objectAtIndexedSubscript:(int)v28];
            int v30 = [v29 intValue];

            switch(v30)
            {
              case 3:
                double v31 = [*(id *)(v24 + 2304) debugInstance];
                double v32 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v10];
                [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v10 + *(double *)(a1 + 64)];
                double v33 = v18;
                long long v35 = v34 = v24;
                [v31 createPowerEventIntervalWithRootNodeID:v28 withPower:v32 withStartDate:v35 withEndDate:1.0];

                unint64_t v24 = v34;
                int v18 = v33;
                break;
              case 2:
                double v31 = [*(id *)(v24 + 2304) debugInstance];
                double v32 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v10];
                [v31 createPowerEventBackwardWithRootNodeID:v28 withPower:v32 withEndDate:1.0];
                break;
              case 1:
                double v31 = [*(id *)(v24 + 2304) debugInstance];
                double v32 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v10];
                [v31 createPowerEventForwardWithRootNodeID:v28 withPower:v32 withStartDate:1.0];
                break;
              default:
                goto LABEL_7;
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v25);
      }

      sleep(*(double *)(a1 + 64));
      double v10 = v10 + *(double *)(a1 + 64);
      unint64_t v2 = 0x1E4F29000;
      unint64_t v17 = v24;
      unint64_t v4 = 0x1E4F92000;
    }
    while (v10 <= 5.0);
  }
  uint64_t v11 = [*(id *)(v2 + 24) stringWithFormat:@"end testPerformance3"];
  id v12 = *(void **)(v4 + 2488);
  uint64_t v13 = [*(id *)(v2 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v14 = [v13 lastPathComponent];
  double v15 = [*(id *)(v2 + 24) stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  obuint64_t j = (id)v11;
  [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1907];

  uint64_t v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v43 = v11;
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_7:
}

void __43__PLAccountingDebugService_testPerformance__block_invoke_679()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = [NSString stringWithFormat:@"join testPerformance3"];
  v1 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v3 = [v2 lastPathComponent];
  unint64_t v4 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:1910];

  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    uint64_t v7 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }
}

void __43__PLAccountingDebugService_testPerformance__block_invoke_688(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = 0x1E4F29000uLL;
  v3 = [NSString stringWithFormat:@"begin testPerformance4"];
  unint64_t v4 = 0x1E4F92000uLL;
  v5 = (void *)MEMORY[0x1E4F929B8];
  int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v7 = [v6 lastPathComponent];
  uint64_t v8 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v5 logMessage:v3 fromFile:v7 fromFunction:v8 fromLineNumber:1917];

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v40 = v3;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  double v10 = [MEMORY[0x1E4F92900] allQualificationIDs];
  uint64_t v11 = (void *)[v10 mutableCopy];

  [v11 removeObject:&unk_1F29E6250];
  double v12 = *(double *)(a1 + 40);
  if (v12 <= 5.0)
  {
    long long v19 = 0uLL;
    double v33 = v11;
    do
    {
      long long v36 = v19;
      long long v37 = v19;
      long long v34 = v19;
      long long v35 = v19;
      id v13 = v11;
      uint64_t v20 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      unint64_t v21 = 0x1E4F92000uLL;
      if (v20)
      {
        uint64_t v22 = v20;
        uint64_t v23 = *(void *)v35;
LABEL_10:
        uint64_t v24 = 0;
        while (2)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v13);
          }
          uint64_t v25 = [*(id *)(*((void *)&v34 + 1) + 8 * v24) intValue];
          uint64_t v26 = [&unk_1F29EE168 objectAtIndexedSubscript:(int)v25];
          int v27 = [v26 intValue];

          switch(v27)
          {
            case 1:
              uint64_t v28 = [*(id *)(v21 + 2304) debugInstance];
              double v29 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v12];
              [v28 createQualificationEventForwardWithQualificationID:v25 withChildNodeNames:&unk_1F29EE180 withStartDate:v29];
              goto LABEL_18;
            case 2:
              uint64_t v28 = [*(id *)(v21 + 2304) debugInstance];
              double v29 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v12];
              [v28 createQualificationEventBackwardWithQualificationID:v25 withChildNodeNames:&unk_1F29EE198 withEndDate:v29];
              goto LABEL_18;
            case 3:
              uint64_t v28 = [*(id *)(v21 + 2304) debugInstance];
              double v29 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v12];
              int v30 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v12 + *(double *)(a1 + 48)];
              [v28 createQualificationEventIntervalWithQualificationID:v25 withChildNodeNames:&unk_1F29EE1B0 withStartDate:v29 withEndDate:v30];

              unint64_t v21 = 0x1E4F92000;
              goto LABEL_18;
            case 4:
              uint64_t v28 = [*(id *)(v21 + 2304) debugInstance];
              double v29 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v12];
              [v28 createQualificationEventPointWithQualificationID:v25 withChildNodeNames:&unk_1F29EE1C8 withStartDate:v29];
LABEL_18:

              if (v22 != ++v24) {
                continue;
              }
              uint64_t v22 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
              if (!v22) {
                goto LABEL_20;
              }
              goto LABEL_10;
            default:
              uint64_t v11 = v33;
              goto LABEL_23;
          }
        }
      }
LABEL_20:

      double v31 = [*(id *)(v21 + 2304) debugInstance];
      double v32 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dateByAddingTimeInterval:v12];
      [v31 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EE1E0 withStartDate:v32];

      sleep(*(double *)(a1 + 48));
      double v12 = v12 + *(double *)(a1 + 48);
      unint64_t v2 = 0x1E4F29000;
      unint64_t v4 = 0x1E4F92000;
      uint64_t v11 = v33;
      long long v19 = 0uLL;
    }
    while (v12 <= 5.0);
  }
  id v13 = [*(id *)(v2 + 24) stringWithFormat:@"end testPerformance4"];
  uint64_t v14 = *(void **)(v4 + 2488);
  double v15 = [*(id *)(v2 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v16 = [v15 lastPathComponent];
  unint64_t v17 = [*(id *)(v2 + 24) stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:1971];

  int v18 = PLLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v40 = v13;
    _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_23:
}

void __43__PLAccountingDebugService_testPerformance__block_invoke_713()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = [NSString stringWithFormat:@"join testPerformance4"];
  v1 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v3 = [v2 lastPathComponent];
  unint64_t v4 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPerformance]_block_invoke"];
  [v1 logMessage:v0 fromFile:v3 fromFunction:v4 fromLineNumber:1974];

  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    uint64_t v7 = v0;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)testShortDistributionEventDuration
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [NSString stringWithFormat:@"begin"];
  v3 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v5 = [v4 lastPathComponent];
  int v6 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testShortDistributionEventDuration]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2023];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138412290;
    uint64_t v24 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }

  double v8 = 0.0;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  do
  {
    double v10 = [MEMORY[0x1E4F92900] debugInstance];
    uint64_t v11 = [v9 dateByAddingTimeInterval:v8];
    [v10 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9EF0 withStartDate:v11];

    double v8 = v8 + 0.001;
  }
  while (v8 < 0.01);
  double v12 = [MEMORY[0x1E4F92900] debugInstance];
  id v13 = [v9 dateByAddingTimeInterval:0.01];
  [v12 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:&unk_1F29E9F18 withStartDate:v13];

  uint64_t v14 = [MEMORY[0x1E4F92900] debugInstance];
  [v14 createPowerEventForwardWithRootNodeID:10 withPower:v9 withStartDate:10.0];

  double v15 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v16 = [v9 dateByAddingTimeInterval:0.01];
  [v15 createPowerEventForwardWithRootNodeID:10 withPower:v16 withStartDate:10.0];

  unint64_t v17 = [NSString stringWithFormat:@"end"];
  int v18 = (void *)MEMORY[0x1E4F929B8];
  long long v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v20 = [v19 lastPathComponent];
  unint64_t v21 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testShortDistributionEventDuration]"];
  [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:2046];

  uint64_t v22 = PLLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138412290;
    uint64_t v24 = v17;
    _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }
}

- (void)testShortQualificationEventDuration
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [NSString stringWithFormat:@"begin"];
  v3 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v5 = [v4 lastPathComponent];
  int v6 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testShortQualificationEventDuration]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2050];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138412290;
    uint64_t v24 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }

  double v8 = 0.0;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  do
  {
    double v10 = [MEMORY[0x1E4F92900] debugInstance];
    uint64_t v11 = [v9 dateByAddingTimeInterval:v8];
    [v10 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EE210 withStartDate:v11];

    double v8 = v8 + 0.001;
  }
  while (v8 < 1.0);
  double v12 = [MEMORY[0x1E4F92900] debugInstance];
  id v13 = [v9 dateByAddingTimeInterval:1.0];
  [v12 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:&unk_1F29EE228 withStartDate:v13];

  uint64_t v14 = [MEMORY[0x1E4F92900] debugInstance];
  [v14 createPowerEventForwardWithRootNodeID:10 withPower:v9 withStartDate:10.0];

  double v15 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v16 = [v9 dateByAddingTimeInterval:1.0];
  [v15 createPowerEventForwardWithRootNodeID:10 withPower:v16 withStartDate:10.0];

  unint64_t v17 = [NSString stringWithFormat:@"end"];
  int v18 = (void *)MEMORY[0x1E4F929B8];
  long long v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v20 = [v19 lastPathComponent];
  unint64_t v21 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testShortQualificationEventDuration]"];
  [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:2073];

  uint64_t v22 = PLLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138412290;
    uint64_t v24 = v17;
    _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }
}

- (void)testAddRemoveDistributionEventForward
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [NSString stringWithFormat:@"begin"];
  v3 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v5 = [v4 lastPathComponent];
  int v6 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testAddRemoveDistributionEventForward]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2077];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v31 = 138412290;
    double v32 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v31, 0xCu);
  }

  double v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v9 = [MEMORY[0x1E4F92900] debugInstance];
  [v9 createDistributionEventForwardWithDistributionID:1 withAddingChildNodeName:@"App1" withStartDate:v8];

  double v10 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v11 = [v8 dateByAddingTimeInterval:1.0];
  [v10 createDistributionEventForwardWithDistributionID:1 withAddingChildNodeName:@"App2" withStartDate:v11];

  double v12 = [MEMORY[0x1E4F92900] debugInstance];
  id v13 = [v8 dateByAddingTimeInterval:2.0];
  [v12 createDistributionEventForwardWithDistributionID:1 withRemovingChildNodeName:@"App1" withStartDate:v13];

  uint64_t v14 = [MEMORY[0x1E4F92900] debugInstance];
  double v15 = [v8 dateByAddingTimeInterval:3.0];
  [v14 createDistributionEventForwardWithDistributionID:1 withRemovingChildNodeName:@"App2" withStartDate:v15];

  uint64_t v16 = [MEMORY[0x1E4F92900] debugInstance];
  [v16 createDistributionEventForwardWithDistributionID:7 withChildNodeNameToWeight:&unk_1F29E9F40 withStartDate:v8];

  unint64_t v17 = [MEMORY[0x1E4F92900] debugInstance];
  int v18 = [v8 dateByAddingTimeInterval:1.0];
  [v17 createDistributionEventForwardWithDistributionID:7 withRemovingChildNodeName:@"App1" withStartDate:v18];

  long long v19 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v20 = [v8 dateByAddingTimeInterval:2.0];
  [v19 createDistributionEventForwardWithDistributionID:7 withRemovingChildNodeName:@"App2" withStartDate:v20];

  unint64_t v21 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v22 = [v8 dateByAddingTimeInterval:3.0];
  [v21 createDistributionEventForwardWithDistributionID:7 withAddingChildNodeName:@"App2" withStartDate:v22];

  int v23 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v24 = [v8 dateByAddingTimeInterval:4.0];
  [v23 createDistributionEventForwardWithDistributionID:7 withAddingChildNodeName:@"App1" withStartDate:v24];

  uint64_t v25 = [NSString stringWithFormat:@"end"];
  uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
  int v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v28 = [v27 lastPathComponent];
  double v29 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testAddRemoveDistributionEventForward]"];
  [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:2109];

  int v30 = PLLogCommon();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    int v31 = 138412290;
    double v32 = v25;
    _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v31, 0xCu);
  }
}

- (void)testCorrectionInMemory
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [NSString stringWithFormat:@"begin"];
  v3 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v5 = [v4 lastPathComponent];
  int v6 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrectionInMemory]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2113];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412290;
    unint64_t v21 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v20, 0xCu);
  }

  double v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v9 = [MEMORY[0x1E4F92900] debugInstance];
  [v9 createPowerEventForwardWithRootNodeID:10 withPower:v8 withStartDate:5.0];

  sleep(2u);
  double v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];

  uint64_t v11 = [MEMORY[0x1E4F92900] debugInstance];
  double v12 = [v10 dateByAddingTimeInterval:-10.0];
  [v11 createPowerEventIntervalWithRootNodeID:2 withPower:v12 withStartDate:v10 withEndDate:10.0];

  id v13 = [MEMORY[0x1E4F92900] debugInstance];
  [v13 createPowerEventForwardWithRootNodeID:10 withPower:v10 withStartDate:0.0];

  uint64_t v14 = [NSString stringWithFormat:@"end"];
  double v15 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  unint64_t v17 = [v16 lastPathComponent];
  int v18 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCorrectionInMemory]"];
  [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:2131];

  long long v19 = PLLogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412290;
    unint64_t v21 = v14;
    _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v20, 0xCu);
  }
}

- (void)testPowerEventIntervalOverlap
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [NSString stringWithFormat:@"begin"];
  v3 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v5 = [v4 lastPathComponent];
  int v6 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPowerEventIntervalOverlap]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2135];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 138412290;
    int v27 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v26, 0xCu);
  }

  double v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v9 = [MEMORY[0x1E4F92900] debugInstance];
  double v10 = [v8 dateByAddingTimeInterval:-10.0];
  [v9 createPowerEventIntervalWithRootNodeID:6 withPower:v10 withStartDate:v8 withEndDate:10.0];

  sleep(2u);
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];

  double v12 = [MEMORY[0x1E4F92900] debugInstance];
  id v13 = [v11 dateByAddingTimeInterval:-4.0];
  [v12 createPowerEventIntervalWithRootNodeID:6 withPower:v13 withStartDate:v11 withEndDate:10.0];

  sleep(2u);
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] monotonicDate];

  double v15 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v16 = [v14 dateByAddingTimeInterval:-2.0];
  [v15 createPowerEventIntervalWithRootNodeID:6 withPower:v16 withStartDate:v14 withEndDate:10.0];

  sleep(2u);
  unint64_t v17 = [MEMORY[0x1E4F1C9C8] monotonicDate];

  int v18 = [MEMORY[0x1E4F92900] debugInstance];
  long long v19 = [v17 dateByAddingTimeInterval:-0.5];
  [v18 createPowerEventIntervalWithRootNodeID:6 withPower:v19 withStartDate:v17 withEndDate:10.0];

  int v20 = [NSString stringWithFormat:@"end"];
  unint64_t v21 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  int v23 = [v22 lastPathComponent];
  uint64_t v24 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testPowerEventIntervalOverlap]"];
  [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:2164];

  uint64_t v25 = PLLogCommon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 138412290;
    int v27 = v20;
    _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v26, 0xCu);
  }
}

- (void)testCurrentDistributionEventForward
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [NSString stringWithFormat:@"begin"];
  v3 = (void *)MEMORY[0x1E4F929B8];
  unint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  v5 = [v4 lastPathComponent];
  int v6 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCurrentDistributionEventForward]"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:2168];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 138412290;
    uint64_t v28 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v27, 0xCu);
  }

  double v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v9 = [MEMORY[0x1E4F92900] debugInstance];
  [v9 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:&unk_1F29E9F68 withStartDate:v8];

  double v10 = [MEMORY[0x1E4F92900] debugInstance];
  [v10 createDistributionEventPointWithDistributionID:4 withChildNodeNameToWeight:&unk_1F29E9F90 withStartDate:v8];

  sleep(1u);
  uint64_t v11 = [MEMORY[0x1E4F92900] debugInstance];
  double v12 = [v8 dateByAddingTimeInterval:1.0];
  [v11 createDistributionEventForwardWithDistributionID:3 withAddingChildNodeName:@"App3" withStartDate:v12];

  id v13 = [MEMORY[0x1E4F92900] debugInstance];
  uint64_t v14 = [v13 currentDistributionEventForwardWithDistributionID:3];
  char v15 = [&unk_1F29E9FB8 isEqualToDictionary:v14];

  if ((v15 & 1) == 0) {
    [(id)objc_opt_class() printError:@"testCurrentDistributionEventForward:: currentDistributionEventForwardWithDistributionID does not match"];
  }
  sleep(1u);
  uint64_t v16 = [MEMORY[0x1E4F92900] debugInstance];
  unint64_t v17 = [v8 dateByAddingTimeInterval:2.0];
  [v16 createDistributionEventForwardWithDistributionID:3 withRemovingChildNodeName:@"App3" withStartDate:v17];

  int v18 = [MEMORY[0x1E4F92900] debugInstance];
  long long v19 = [v18 currentDistributionEventForwardWithDistributionID:3];
  char v20 = [&unk_1F29E9FE0 isEqualToDictionary:v19];

  if ((v20 & 1) == 0) {
    [(id)objc_opt_class() printError:@"testCurrentDistributionEventForward:: currentDistributionEventForwardWithDistributionID does not match"];
  }
  unint64_t v21 = [NSString stringWithFormat:@"end"];
  uint64_t v22 = (void *)MEMORY[0x1E4F929B8];
  int v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  uint64_t v24 = [v23 lastPathComponent];
  uint64_t v25 = [NSString stringWithUTF8String:"-[PLAccountingDebugService testCurrentDistributionEventForward]"];
  [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:2198];

  int v26 = PLLogCommon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 138412290;
    uint64_t v28 = v21;
    _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v27, 0xCu);
  }
}

- (BOOL)verifyLastDistributionEventWithDistributionID:(int)a3 withNodeName:(id)a4 withWeight:(double)a5
{
  uint64_t v6 = *(void *)&a3;
  v51[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(PLAccountingDebugService *)self blockingClearQueues];
  if ((int)v6 < 1 || !v8)
  {
    long long v37 = objc_opt_class();
    long long v38 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]"];
    [v37 printError:v38];

    uint64_t v39 = 2210;
LABEL_13:
    NSLog(&cfstr_FailReturnedFr.isa, v39);
    BOOL v34 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = [&unk_1F29EE240 objectAtIndexedSubscript:v6];
  int v10 = [v9 intValue];

  if ((v10 - 1) >= 4)
  {
    uint64_t v39 = 2235;
    goto LABEL_13;
  }
  uint64_t v11 = [**((id **)&unk_1E692D950 + v10 - 1) entryKey];
  id v12 = objc_alloc(MEMORY[0x1E4F92A90]);
  uint64_t v13 = *MEMORY[0x1E4F92BA8];
  uint64_t v14 = [NSNumber numberWithInt:v6];
  char v15 = (void *)[v12 initWithKey:v13 withValue:v14 withComparisonOperation:0];

  uint64_t v16 = [MEMORY[0x1E4F92AD0] sharedCore];
  unint64_t v17 = [v16 storage];
  v51[0] = v15;
  int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  uint64_t v49 = v11;
  long long v19 = [v17 entriesForKey:v11 withComparisons:v18];

  if (v19)
  {
    char v20 = [v19 lastObject];
    unint64_t v21 = [v20 childNodeIDToWeight];
    if (v21)
    {
      uint64_t v47 = v20;
      id v22 = objc_alloc(MEMORY[0x1E4F92A90]);
      uint64_t v23 = [v22 initWithKey:*MEMORY[0x1E4F92BA0] withValue:v8 withComparisonOperation:0];
      uint64_t v24 = [MEMORY[0x1E4F92AD0] sharedCore];
      uint64_t v25 = [v24 storage];
      int v26 = [MEMORY[0x1E4F92908] entryKey];
      uint64_t v48 = (void *)v23;
      uint64_t v50 = v23;
      int v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      uint64_t v28 = [v25 entriesForKey:v26 withComparisons:v27];

      if (v28 && [v28 count])
      {
        uint64_t v29 = [v28 firstObject];
        int v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v29, "entryID"));
        int v31 = [v21 objectForKeyedSubscript:v30];

        [v31 doubleValue];
        double v33 = vabdd_f64(v32, a5);
        BOOL v34 = v33 <= 0.001;
        if (v33 > 0.001)
        {
          long long v35 = objc_opt_class();
          long long v36 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]"];
          [v35 printError:v36];

          NSLog(&cfstr_FailReturnedFr.isa, 2273);
        }
      }
      else
      {
        uint64_t v42 = objc_opt_class();
        uint64_t v43 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]"];
        [v42 printError:v43];

        NSLog(&cfstr_FailReturnedFr.isa, 2265);
        BOOL v34 = 0;
      }
      uint64_t v11 = v49;
      char v20 = v47;
    }
    else
    {
      uint64_t v44 = objc_opt_class();
      uint64_t v45 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]"];
      [v44 printError:v45];

      NSLog(&cfstr_FailReturnedFr.isa, 2254);
      BOOL v34 = 0;
    }
  }
  else
  {
    id v40 = objc_opt_class();
    uint64_t v41 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]"];
    [v40 printError:v41];

    NSLog(&cfstr_FailReturnedFr.isa, 2246);
    BOOL v34 = 0;
  }

LABEL_20:
  return v34;
}

- (BOOL)verifyLastQualificationEventWithQualificationID:(int)a3 withNodeName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(PLAccountingDebugService *)self blockingClearQueues];
  if ((int)v4 <= 0)
  {
    id v22 = objc_opt_class();
    uint64_t v23 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]"];
    [v22 printError:v23];

    uint64_t v24 = 2286;
  }
  else
  {
    uint64_t v7 = [&unk_1F29EE258 objectAtIndexedSubscript:v4];
    int v8 = [v7 intValue];

    if ((v8 - 1) < 4)
    {
      uint64_t v9 = [**((id **)&unk_1E692D970 + v8 - 1) entryKey];
      id v10 = objc_alloc(MEMORY[0x1E4F92A90]);
      uint64_t v11 = *MEMORY[0x1E4F92BC8];
      id v12 = [NSNumber numberWithInt:v4];
      uint64_t v13 = (void *)[v10 initWithKey:v11 withValue:v12 withComparisonOperation:0];

      uint64_t v14 = [MEMORY[0x1E4F92AD0] sharedCore];
      char v15 = [v14 storage];
      v53[0] = v13;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
      uint64_t v51 = (void *)v9;
      unint64_t v17 = [v15 entriesForKey:v9 withComparisons:v16];

      if (!v17)
      {
        int v26 = objc_opt_class();
        int v27 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]"];
        [v26 printError:v27];

        NSLog(&cfstr_FailReturnedFr.isa, 2322);
        BOOL v25 = 0;
        uint64_t v28 = (void *)v9;
LABEL_24:

        goto LABEL_25;
      }
      int v18 = [v17 lastObject];
      long long v19 = [v18 childNodeIDs];
      char v20 = v19;
      if (v19)
      {
        if (v6 || ![v19 count])
        {
          if ([v6 isEqualToString:@"__GLOBAL__"])
          {
            uint64_t v21 = 1;
          }
          else
          {
            uint64_t v50 = v18;
            id v32 = objc_alloc(MEMORY[0x1E4F92A90]);
            uint64_t v33 = [v32 initWithKey:*MEMORY[0x1E4F92BA0] withValue:v6 withComparisonOperation:0];
            BOOL v34 = [MEMORY[0x1E4F92AD0] sharedCore];
            long long v35 = [v34 storage];
            long long v36 = [MEMORY[0x1E4F92908] entryKey];
            uint64_t v49 = (void *)v33;
            uint64_t v52 = v33;
            long long v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
            long long v38 = [v35 entriesForKey:v36 withComparisons:v37];

            if (!v38 || ![v38 count])
            {
              uint64_t v47 = objc_opt_class();
              uint64_t v48 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]"];
              [v47 printError:v48];

              NSLog(&cfstr_FailReturnedFr.isa, 2355);
              BOOL v25 = 0;
              int v18 = v50;
              uint64_t v28 = v51;
              goto LABEL_23;
            }
            uint64_t v39 = [v38 firstObject];
            uint64_t v21 = [v39 entryID];

            int v18 = v50;
          }
          id v40 = [NSNumber numberWithInt:v21];
          char v41 = [v20 containsObject:v40];

          if (v41)
          {
            BOOL v25 = 1;
LABEL_22:
            uint64_t v28 = v51;
LABEL_23:

            goto LABEL_24;
          }
          uint64_t v44 = objc_opt_class();
          uint64_t v45 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]"];
          [v44 printError:v45];

          uint64_t v31 = 2364;
        }
        else
        {
          uint64_t v42 = objc_opt_class();
          uint64_t v43 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]"];
          [v42 printError:v43];

          uint64_t v31 = 2338;
        }
      }
      else
      {
        uint64_t v29 = objc_opt_class();
        int v30 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]"];
        [v29 printError:v30];

        uint64_t v31 = 2330;
      }
      NSLog(&cfstr_FailReturnedFr.isa, v31);
      BOOL v25 = 0;
      goto LABEL_22;
    }
    uint64_t v24 = 2311;
  }
  NSLog(&cfstr_FailReturnedFr.isa, v24);
  BOOL v25 = 0;
LABEL_25:

  return v25;
}

- (BOOL)verifyLastPowerEventWithRootNodeID:(int)a3 withPower:(double)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  [(PLAccountingDebugService *)self blockingClearQueues];
  if (a3 <= 0)
  {
    long long v35 = objc_opt_class();
    long long v36 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:]"];
    [v35 printError:v36];

    uint64_t v37 = 2377;
LABEL_11:
    NSLog(&cfstr_FailReturnedFr.isa, v37);
    return 0;
  }
  uint64_t v6 = a3;
  uint64_t v7 = [&unk_1F29EE270 objectAtIndexedSubscript:a3];
  int v8 = [v7 intValue];

  if ((v8 - 1) >= 3)
  {
    uint64_t v37 = 2398;
    goto LABEL_11;
  }
  uint64_t v9 = [**((id **)&unk_1E692D990 + v8 - 1) entryKey];
  id v10 = objc_alloc(MEMORY[0x1E4F92A90]);
  uint64_t v11 = *MEMORY[0x1E4F92BA0];
  id v12 = [&unk_1F29EE288 objectAtIndexedSubscript:v6];
  uint64_t v13 = (void *)[v10 initWithKey:v11 withValue:v12 withComparisonOperation:0];

  uint64_t v14 = [MEMORY[0x1E4F92AD0] sharedCore];
  char v15 = [v14 storage];
  uint64_t v16 = [MEMORY[0x1E4F92908] entryKey];
  v44[0] = v13;
  unint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  int v18 = [v15 entriesForKey:v16 withComparisons:v17];

  if (v18)
  {
    long long v19 = [v18 firstObject];
    id v20 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v21 = *MEMORY[0x1E4F92BC0];
    id v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v19, "entryID"));
    uint64_t v23 = (void *)[v20 initWithKey:v21 withValue:v22 withComparisonOperation:0];

    uint64_t v24 = [MEMORY[0x1E4F92AD0] sharedCore];
    BOOL v25 = [v24 storage];
    uint64_t v43 = v23;
    int v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    int v27 = [v25 entriesForKey:v9 withComparisons:v26];

    if (v27 && [v27 count])
    {
      uint64_t v28 = [v27 lastObject];
      uint64_t v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F92BB8]];
      [v29 doubleValue];
      double v31 = vabdd_f64(v30 / 1000.0, a4);

      BOOL v32 = v31 <= 0.001;
      if (v31 > 0.001)
      {
        uint64_t v33 = objc_opt_class();
        BOOL v34 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:]"];
        [v33 printError:v34];

        NSLog(&cfstr_FailReturnedFr.isa, 2428);
      }
    }
    else
    {
      long long v38 = objc_opt_class();
      uint64_t v39 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:]"];
      [v38 printError:v39];

      NSLog(&cfstr_FailReturnedFr.isa, 2421);
      BOOL v32 = 0;
    }
  }
  else
  {
    id v40 = objc_opt_class();
    char v41 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:]"];
    [v40 printError:v41];

    NSLog(&cfstr_FailReturnedFr.isa, 2409);
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)verifyTotalEnergyWithNodeName:(id)a3 withTotalEnergy:(double)a4 withRootNodeID:(int)a5 withEpsilon:(double)a6
{
  uint64_t v7 = *(void *)&a5;
  v63[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  [(PLAccountingDebugService *)self blockingClearQueues];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F92A90]);
    id v12 = (void *)[v11 initWithKey:*MEMORY[0x1E4F92BA0] withValue:v10 withComparisonOperation:0];
    uint64_t v13 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v14 = [v13 storage];
    char v15 = [MEMORY[0x1E4F92908] entryKey];
    long long v56 = v12;
    v63[0] = v12;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
    unint64_t v17 = [v14 entriesForKey:v15 withComparisons:v16];

    if (!v17)
    {
      uint64_t v39 = objc_opt_class();
      id v40 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:]"];
      [v39 printError:v40];

      NSLog(&cfstr_FailReturnedFr.isa, 2454);
      BOOL v38 = 0;
LABEL_24:

      goto LABEL_25;
    }
    id v55 = v17;
    int v18 = [v17 firstObject];
    id v19 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v20 = *MEMORY[0x1E4F92B80];
    long long v54 = v18;
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v18, "entryID"));
    uint64_t v22 = [v19 initWithKey:v20 withValue:v21 withComparisonOperation:0];

    id v23 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v24 = *MEMORY[0x1E4F92B88];
    BOOL v25 = [NSNumber numberWithInt:v7];
    int v26 = (void *)[v23 initWithKey:v24 withValue:v25 withComparisonOperation:0];

    int v27 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v28 = [v27 storage];
    uint64_t v29 = [MEMORY[0x1E4F928F8] entryKey];
    uint64_t v53 = (void *)v22;
    v62[0] = v22;
    v62[1] = v26;
    double v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    double v31 = [v28 entriesForKey:v29 withComparisons:v30];

    if (v31)
    {
      uint64_t v32 = [v31 count];
      if (a4 != 0.0 && !v32) {
        goto LABEL_6;
      }
    }
    else if (a4 != 0.0)
    {
LABEL_6:
      uint64_t v33 = objc_opt_class();
      BOOL v34 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:]"];
      [v33 printError:v34];
      uint64_t v35 = 2470;
      goto LABEL_22;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v41 = v31;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v58;
      uint64_t v45 = *MEMORY[0x1E4F92B78];
      double v46 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v58 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v48 = [*(id *)(*((void *)&v57 + 1) + 8 * i) objectForKeyedSubscript:v45];
          [v48 doubleValue];
          double v46 = v46 + v49 / 1000.0;
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v57 objects:v61 count:16];
      }
      while (v43);
    }
    else
    {
      double v46 = 0.0;
    }

    if (vabdd_f64(v46, a4) <= a6)
    {
      BOOL v38 = 1;
      unint64_t v17 = v55;
      id v12 = v56;
      uint64_t v50 = v54;
LABEL_23:

      goto LABEL_24;
    }
    uint64_t v51 = objc_opt_class();
    BOOL v34 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:]"];
    [v51 printError:v34];
    uint64_t v35 = 2482;
LABEL_22:
    uint64_t v50 = v54;
    unint64_t v17 = v55;

    NSLog(&cfstr_FailReturnedFr.isa, v35);
    BOOL v38 = 0;
    id v12 = v56;
    goto LABEL_23;
  }
  long long v36 = objc_opt_class();
  uint64_t v37 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:]"];
  [v36 printError:v37];

  NSLog(&cfstr_FailReturnedFr.isa, 2443);
  BOOL v38 = 0;
LABEL_25:

  return v38;
}

- (BOOL)verifyTotalCorrectionEnergyWithNodeName:(id)a3 withTotalCorrectionEnergy:(double)a4 withRootNodeID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v60[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(PLAccountingDebugService *)self blockingClearQueues];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v10 = [v9 initWithKey:*MEMORY[0x1E4F92BA0] withValue:v8 withComparisonOperation:0];
    id v11 = [MEMORY[0x1E4F92AD0] sharedCore];
    id v12 = [v11 storage];
    uint64_t v13 = [MEMORY[0x1E4F92908] entryKey];
    uint64_t v53 = (void *)v10;
    v60[0] = v10;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
    char v15 = [v12 entriesForKey:v13 withComparisons:v14];

    if (!v15)
    {
      double v46 = objc_opt_class();
      uint64_t v47 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:]"];
      [v46 printError:v47];

      NSLog(&cfstr_FailReturnedFr.isa, 2506);
      BOOL v42 = 0;
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v52 = v15;
    uint64_t v16 = [v15 firstObject];
    id v17 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v18 = *MEMORY[0x1E4F92B80];
    uint64_t v51 = v16;
    id v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "entryID"));
    uint64_t v20 = [v17 initWithKey:v18 withValue:v19 withComparisonOperation:0];

    uint64_t v21 = (void *)v20;
    id v22 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v23 = *MEMORY[0x1E4F92B88];
    uint64_t v24 = [NSNumber numberWithInt:v5];
    BOOL v25 = (void *)[v22 initWithKey:v23 withValue:v24 withComparisonOperation:0];

    int v26 = [MEMORY[0x1E4F92AD0] sharedCore];
    int v27 = [v26 storage];
    uint64_t v28 = [MEMORY[0x1E4F928F8] entryKey];
    v59[0] = v21;
    v59[1] = v25;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    double v30 = [v27 entriesForKey:v28 withComparisons:v29];

    if (v30 && [v30 count])
    {
      uint64_t v50 = v21;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v55;
        uint64_t v35 = *MEMORY[0x1E4F92B68];
        double v36 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v55 != v34) {
              objc_enumerationMutation(v31);
            }
            BOOL v38 = [*(id *)(*((void *)&v54 + 1) + 8 * i) objectForKeyedSubscript:v35];
            [v38 doubleValue];
            double v36 = v36 + v39 / 1000.0;
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v33);
      }
      else
      {
        double v36 = 0.0;
      }

      if (vabdd_f64(v36, a4) <= 0.001)
      {
        BOOL v42 = 1;
        char v15 = v52;
        uint64_t v21 = v50;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v48 = objc_opt_class();
      uint64_t v44 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:]"];
      [v48 printError:v44];
      uint64_t v45 = 2532;
      char v15 = v52;
      uint64_t v21 = v50;
    }
    else
    {
      uint64_t v43 = objc_opt_class();
      uint64_t v44 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:]"];
      [v43 printError:v44];
      uint64_t v45 = 2521;
      char v15 = v52;
    }

    NSLog(&cfstr_FailReturnedFr.isa, v45);
    BOOL v42 = 0;
    goto LABEL_21;
  }
  id v40 = objc_opt_class();
  id v41 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:]"];
  [v40 printError:v41];

  NSLog(&cfstr_FailReturnedFr.isa, 2495);
  BOOL v42 = 0;
LABEL_23:

  return v42;
}

- (BOOL)verifyAggregateRootNodeEnergyWithNodeName:(id)a3 withRootNodeID:(int)a4 withEnergy:(double)a5 withDate:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  v62[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  [(PLAccountingDebugService *)self blockingClearQueues];
  if (v10 && (int)v8 > 0)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v13 = [v12 initWithKey:*MEMORY[0x1E4F92BA0] withValue:v10 withComparisonOperation:0];
    uint64_t v14 = [MEMORY[0x1E4F92AD0] sharedCore];
    char v15 = [v14 storage];
    uint64_t v16 = [MEMORY[0x1E4F92908] entryKey];
    long long v60 = (void *)v13;
    v62[0] = v13;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
    uint64_t v18 = [v15 entriesForKey:v16 withComparisons:v17];

    if (!v18)
    {
      uint64_t v48 = objc_opt_class();
      double v49 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:]"];
      [v48 printError:v49];

      NSLog(&cfstr_FailReturnedFr.isa, 2557);
      BOOL v47 = 0;
LABEL_14:

      goto LABEL_15;
    }
    long long v58 = v18;
    [v18 firstObject];
    uint64_t v20 = v19 = v11;
    id v21 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v22 = *MEMORY[0x1E4F92B58];
    long long v59 = (void *)v20;
    uint64_t v23 = (void *)v20;
    id v11 = v19;
    uint64_t v24 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v23, "entryID"));
    uint64_t v25 = [v21 initWithKey:v22 withValue:v24 withComparisonOperation:0];

    id v26 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v27 = *MEMORY[0x1E4F92B60];
    uint64_t v28 = [NSNumber numberWithInt:v8];
    uint64_t v29 = [v26 initWithKey:v27 withValue:v28 withComparisonOperation:0];

    [v11 timeIntervalSince1970];
    double v31 = floor(v30 / 3600.0) * 3600.0;
    id v32 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v33 = [NSNumber numberWithDouble:v31];
    uint64_t v34 = [v32 initWithKey:@"timestamp" withValue:v33 withComparisonOperation:0];

    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"timeInterval" withValue:&unk_1F29F0B00 withComparisonOperation:0];
    double v36 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D20] andName:*MEMORY[0x1E4F92B48]];
    uint64_t v37 = [MEMORY[0x1E4F92AD0] sharedCore];
    BOOL v38 = [v37 storage];
    long long v56 = (void *)v29;
    long long v57 = (void *)v25;
    v61[0] = v25;
    v61[1] = v29;
    long long v55 = (void *)v34;
    v61[2] = v34;
    v61[3] = v35;
    double v39 = (void *)v35;
    id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
    id v41 = [v38 lastEntryForKey:v36 withComparisons:v40 isSingleton:1];

    if (a5 == 0.0 || v41)
    {
      uint64_t v50 = [v41 objectForKeyedSubscript:*MEMORY[0x1E4F92B50]];
      [v50 doubleValue];
      double v52 = v51 / 1000.0;

      if (vabdd_f64(v52, a5) <= 0.001)
      {
        BOOL v47 = 1;
        uint64_t v18 = v58;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v53 = objc_opt_class();
      uint64_t v43 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:]"];
      [v53 printError:v43];
      uint64_t v44 = 2597;
    }
    else
    {
      BOOL v42 = objc_opt_class();
      uint64_t v43 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:]"];
      [v42 printError:v43];
      uint64_t v44 = 2589;
    }
    uint64_t v18 = v58;

    NSLog(&cfstr_FailReturnedFr.isa, v44);
    BOOL v47 = 0;
    goto LABEL_13;
  }
  uint64_t v45 = objc_opt_class();
  double v46 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:]"];
  [v45 printError:v46];

  NSLog(&cfstr_FailReturnedFr.isa, 2546);
  BOOL v47 = 0;
LABEL_15:

  return v47;
}

- (BOOL)verifyAggregateQualificationEnergyWithQualificationID:(int)a3 withRootNodeID:(int)a4 withNodeName:(id)a5 withQualificationEnergy:(double)a6 withDate:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  v69[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a7;
  [(PLAccountingDebugService *)self blockingClearQueues];
  if ((int)v10 >= 1 && (int)v9 >= 1 && v12)
  {
    long long v67 = v13;
    id v14 = objc_alloc(MEMORY[0x1E4F92A90]);
    id v65 = v12;
    uint64_t v15 = [v14 initWithKey:*MEMORY[0x1E4F92BA0] withValue:v12 withComparisonOperation:0];
    uint64_t v16 = [MEMORY[0x1E4F92AD0] sharedCore];
    id v17 = [v16 storage];
    uint64_t v18 = [MEMORY[0x1E4F92908] entryKey];
    id v66 = (void *)v15;
    v69[0] = v15;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
    uint64_t v20 = [v17 entriesForKey:v18 withComparisons:v19];

    if (!v20)
    {
      double v52 = objc_opt_class();
      uint64_t v53 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:]"];
      [v52 printError:v53];

      NSLog(&cfstr_FailReturnedFr.isa, 2623);
      BOOL v51 = 0;
      long long v54 = v66;
      id v12 = v65;
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v63 = v20;
    id v21 = [v20 firstObject];
    id v22 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v23 = *MEMORY[0x1E4F92B30];
    long long v64 = v21;
    uint64_t v24 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v21, "entryID"));
    uint64_t v25 = [v22 initWithKey:v23 withValue:v24 withComparisonOperation:0];

    id v26 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v27 = *MEMORY[0x1E4F92B40];
    uint64_t v28 = [NSNumber numberWithInt:v9];
    uint64_t v29 = [v26 initWithKey:v27 withValue:v28 withComparisonOperation:0];

    id v30 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v31 = *MEMORY[0x1E4F92B38];
    id v32 = [NSNumber numberWithInt:v10];
    uint64_t v33 = [v30 initWithKey:v31 withValue:v32 withComparisonOperation:0];

    [v67 timeIntervalSince1970];
    double v35 = floor(v34 / 3600.0) * 3600.0;
    id v36 = objc_alloc(MEMORY[0x1E4F92A90]);
    uint64_t v37 = [NSNumber numberWithDouble:v35];
    uint64_t v38 = [v36 initWithKey:@"timestamp" withValue:v37 withComparisonOperation:0];

    double v39 = (void *)v38;
    id v40 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"timeInterval" withValue:&unk_1F29F0B00 withComparisonOperation:0];
    id v41 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D20] andName:*MEMORY[0x1E4F92B20]];
    BOOL v42 = [MEMORY[0x1E4F92AD0] sharedCore];
    uint64_t v43 = [v42 storage];
    long long v61 = (void *)v29;
    id v62 = (void *)v25;
    v68[0] = v25;
    v68[1] = v29;
    long long v60 = (void *)v33;
    v68[2] = v33;
    v68[3] = v39;
    v68[4] = v40;
    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:5];
    uint64_t v45 = [v43 lastEntryForKey:v41 withComparisons:v44 isSingleton:1];

    if (a6 == 0.0 || v45)
    {
      long long v55 = [v45 objectForKeyedSubscript:*MEMORY[0x1E4F92B28]];
      [v55 doubleValue];
      double v57 = v56 / 1000.0;

      id v12 = v65;
      if (vabdd_f64(v57, a6) <= 0.001)
      {
        BOOL v51 = 1;
        long long v54 = v66;
        uint64_t v20 = v63;
LABEL_14:

        id v13 = v67;
        goto LABEL_15;
      }
      long long v58 = objc_opt_class();
      BOOL v47 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:]"];
      [v58 printError:v47];
      uint64_t v48 = 2667;
      uint64_t v20 = v63;
    }
    else
    {
      double v46 = objc_opt_class();
      BOOL v47 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:]"];
      [v46 printError:v47];
      uint64_t v48 = 2659;
      uint64_t v20 = v63;
      id v12 = v65;
    }

    NSLog(&cfstr_FailReturnedFr.isa, v48);
    BOOL v51 = 0;
    long long v54 = v66;
    goto LABEL_14;
  }
  double v49 = objc_opt_class();
  uint64_t v50 = [NSString stringWithUTF8String:"-[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:]"];
  [v49 printError:v50];

  NSLog(&cfstr_FailReturnedFr.isa, 2612);
  BOOL v51 = 0;
LABEL_16:

  return v51;
}

- (void)blockingLogGasGaugeWithTotalPower:(double)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"GasGauge"];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__8;
  uint64_t v25 = __Block_byref_object_dispose__8;
  id v26 = (id)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10 withDate:v8];
  [(id)v22[5] setObject:v9 forKeyedSubscript:@"timestampEnd"];
  id v11 = [NSNumber numberWithDouble:a3];
  [(id)v22[5] setObject:v11 forKeyedSubscript:@"TotalPower"];

  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = objc_alloc(MEMORY[0x1E4F929E8]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__PLAccountingDebugService_blockingLogGasGaugeWithTotalPower_withStartDate_withEndDate___block_invoke;
  v18[3] = &unk_1E692D908;
  uint64_t v20 = &v21;
  id v14 = v12;
  id v19 = v14;
  uint64_t v15 = (void *)[v13 initWithOperator:self forEntryKey:v10 withBlock:v18];
  uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v27 = @"entry";
  v28[0] = v22[5];
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  [v16 postNotificationName:@"PLBatteryAgent.fakeLogEntry" object:0 userInfo:v17];

  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v21, 8);
}

void __88__PLAccountingDebugService_blockingLogGasGaugeWithTotalPower_withStartDate_withEndDate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 objectForKeyedSubscript:@"entry"];
  v3 = [v6 objectForKeyedSubscript:@"timestampEnd"];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"timestampEnd"];
  int v5 = [v3 isEqualToDate:v4];

  if (v5) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (void)blockingClearQueues
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_sync(v3, block);

  uint64_t v4 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_826;
  v27[3] = &unk_1E692A250;
  v27[4] = self;
  dispatch_sync(v4, v27);

  int v5 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_832;
  v26[3] = &unk_1E692A250;
  v26[4] = self;
  dispatch_sync(v5, v26);

  id v6 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_838;
  v25[3] = &unk_1E692A250;
  v25[4] = self;
  dispatch_sync(v6, v25);

  uint64_t v7 = (void *)MEMORY[0x1E4F92A88];
  id v8 = [MEMORY[0x1E4F929B8] storageQueueNameForClass:objc_opt_class()];
  id v9 = [v7 workQueueForKey:v8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_843;
  v24[3] = &unk_1E692A250;
  v24[4] = self;
  dispatch_sync(v9, v24);

  uint64_t v10 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v11 = [v10 storage];
  [v11 blockingFlushCachesWithReason:@"PLAccountingDebugService"];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_851;
    id v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v23 = v12;
    if (qword_1EBD5C148 != -1) {
      dispatch_once(&qword_1EBD5C148, &v19);
    }
    if (byte_1EBD5C11D)
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"flushes cleared", v19, v20, v21, v22, v23);
      id v14 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
      uint64_t v16 = [v15 lastPathComponent];
      id v17 = [NSString stringWithUTF8String:"-[PLAccountingDebugService blockingClearQueues]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:2715];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v0 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1EBD5C120 != -1) {
      dispatch_once(&qword_1EBD5C120, block);
    }
    if (_MergedGlobals_95)
    {
      v1 = [NSString stringWithFormat:@"PLAccountingEngine work queue cleared"];
      unint64_t v2 = (void *)MEMORY[0x1E4F929B8];
      v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
      uint64_t v4 = [v3 lastPathComponent];
      int v5 = [NSString stringWithUTF8String:"-[PLAccountingDebugService blockingClearQueues]_block_invoke"];
      [v2 logMessage:v1 fromFile:v4 fromFunction:v5 fromLineNumber:2700];

      id v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v9 = v1;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_95 = result;
  return result;
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke_826()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v0 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_827;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1EBD5C128 != -1) {
      dispatch_once(&qword_1EBD5C128, block);
    }
    if (byte_1EBD5C119)
    {
      v1 = [NSString stringWithFormat:@"PLAccountingDistributionManager work queue cleared"];
      unint64_t v2 = (void *)MEMORY[0x1E4F929B8];
      v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
      uint64_t v4 = [v3 lastPathComponent];
      int v5 = [NSString stringWithUTF8String:"-[PLAccountingDebugService blockingClearQueues]_block_invoke"];
      [v2 logMessage:v1 fromFile:v4 fromFunction:v5 fromLineNumber:2703];

      id v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v9 = v1;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_827(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C119 = result;
  return result;
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke_832()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v0 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_833;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1EBD5C130 != -1) {
      dispatch_once(&qword_1EBD5C130, block);
    }
    if (byte_1EBD5C11A)
    {
      v1 = [NSString stringWithFormat:@"PLAccountingCorrectionManager work queue cleared"];
      unint64_t v2 = (void *)MEMORY[0x1E4F929B8];
      v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
      uint64_t v4 = [v3 lastPathComponent];
      int v5 = [NSString stringWithUTF8String:"-[PLAccountingDebugService blockingClearQueues]_block_invoke"];
      [v2 logMessage:v1 fromFile:v4 fromFunction:v5 fromLineNumber:2706];

      id v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v9 = v1;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_833(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C11A = result;
  return result;
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke_838()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v0 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_839;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1EBD5C138 != -1) {
      dispatch_once(&qword_1EBD5C138, block);
    }
    if (byte_1EBD5C11B)
    {
      v1 = [NSString stringWithFormat:@"PLAccountingQualificationManager work queue cleared"];
      unint64_t v2 = (void *)MEMORY[0x1E4F929B8];
      v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
      uint64_t v4 = [v3 lastPathComponent];
      int v5 = [NSString stringWithUTF8String:"-[PLAccountingDebugService blockingClearQueues]_block_invoke"];
      [v2 logMessage:v1 fromFile:v4 fromFunction:v5 fromLineNumber:2709];

      id v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v9 = v1;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_839(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C11B = result;
  return result;
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke_843()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v0 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_844;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1EBD5C140 != -1) {
      dispatch_once(&qword_1EBD5C140, block);
    }
    if (byte_1EBD5C11C)
    {
      v1 = [NSString stringWithFormat:@"PLAccountingOperator storage queue cleared"];
      unint64_t v2 = (void *)MEMORY[0x1E4F929B8];
      v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
      uint64_t v4 = [v3 lastPathComponent];
      int v5 = [NSString stringWithUTF8String:"-[PLAccountingDebugService blockingClearQueues]_block_invoke"];
      [v2 logMessage:v1 fromFile:v4 fromFunction:v5 fromLineNumber:2712];

      id v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v9 = v1;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_844(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C11C = result;
  return result;
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_851(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C11D = result;
  return result;
}

+ (void)printError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"&&&&&&&&&&&&&&&&&&%@&&&&&&&&&&&&&&&&&&", a3];
  uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
  int v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m"];
  id v6 = [v5 lastPathComponent];
  uint64_t v7 = [NSString stringWithUTF8String:"+[PLAccountingDebugService printError:]"];
  [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:2719];

  id v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v10 = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)setTestNames:(id)a3
{
}

- (void).cxx_destruct
{
}

@end