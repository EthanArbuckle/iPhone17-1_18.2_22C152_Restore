@interface PLAWDCamera
+ (id)entryAggregateDefinitionAwdCamera;
+ (id)entryAggregateDefinitions;
+ (id)getSharedObjWithOperator:(id)a3;
- (BOOL)prevBackCameraState;
- (BOOL)prevFrontCameraState;
- (BOOL)prevTorchCameraState;
- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (PLEntryNotificationOperatorComposition)cameraEventCallback;
- (PLEntryNotificationOperatorComposition)cameraEventCallbackTorch;
- (double)backCameraTimestamp;
- (double)frontCameraTimestamp;
- (double)torchCameraTimestamp;
- (int64_t)cameraSubmitCnt;
- (void)addEntryToCameraTable:(id)a3 withValue:(double)a4;
- (void)handleBackCameraCallback:(id)a3;
- (void)handleCameraCallback:(id)a3;
- (void)handleFrontCameraCallback:(id)a3;
- (void)handleTorchCameraCallback:(id)a3;
- (void)initCameraStats;
- (void)reInitCameraStats;
- (void)resetCameraTable;
- (void)setBackCameraTimestamp:(double)a3;
- (void)setCameraEventCallback:(id)a3;
- (void)setCameraEventCallbackTorch:(id)a3;
- (void)setCameraSubmitCnt:(int64_t)a3;
- (void)setFrontCameraTimestamp:(double)a3;
- (void)setPrevBackCameraState:(BOOL)a3;
- (void)setPrevFrontCameraState:(BOOL)a3;
- (void)setPrevTorchCameraState:(BOOL)a3;
- (void)setTorchCameraTimestamp:(double)a3;
- (void)startMetricCollection:(id)a3;
- (void)stopMetricCollection:(id)a3;
@end

@implementation PLAWDCamera

+ (id)getSharedObjWithOperator:(id)a3
{
  v3 = (void *)plAwdCamera;
  if (!plAwdCamera)
  {
    id v4 = a3;
    v5 = [(PLAWDAuxMetrics *)[PLAWDCamera alloc] initWithOperator:v4];

    v6 = (void *)plAwdCamera;
    plAwdCamera = (uint64_t)v5;

    v3 = (void *)plAwdCamera;
  }

  return v3;
}

+ (id)entryAggregateDefinitions
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = kPLAWDAggregateNameCameraMetrics;
  v2 = [a1 entryAggregateDefinitionAwdCamera];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryAggregateDefinitionAwdCamera
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v21[0] = *MEMORY[0x263F5F880];
  v21[1] = v2;
  v22[0] = &unk_26E546680;
  v22[1] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v3;
  v23[1] = *MEMORY[0x263F5F870];
  v19[0] = kPLAWDCameraMetricsKey;
  id v4 = [MEMORY[0x263F5F650] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v19[1] = kPLAWDCameraMetricsValue;
  v20[0] = v5;
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v20[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  v23[2] = *MEMORY[0x263F5F828];
  v17 = &unk_26E546690;
  uint64_t v15 = *MEMORY[0x263F5F820];
  v16 = &unk_26E546690;
  v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v24[2] = v10;
  v23[3] = *MEMORY[0x263F5F830];
  uint64_t v14 = kPLAWDCameraMetricsValue;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v24[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (void)startMetricCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 addObject:v4];

  uint64_t v6 = [v4 longValue];
  if (v6 == 2031627)
  {
    [(PLAWDCamera *)self initCameraStats];
    uint64_t v7 = *MEMORY[0x263F5F8A0];
    v8 = [MEMORY[0x263F5F8E0] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F9B8]];
    id v9 = objc_alloc(MEMORY[0x263F5F658]);
    v10 = [(PLAWDAuxMetrics *)self operator];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __37__PLAWDCamera_startMetricCollection___block_invoke;
    v29[3] = &unk_264B99DD0;
    v29[4] = self;
    v11 = (void *)[v9 initWithOperator:v10 forEntryKey:v8 withBlock:v29];

    [(PLAWDCamera *)self setCameraEventCallback:v11];
    v12 = [MEMORY[0x263F5F8E0] entryKeyForType:v7 andName:*MEMORY[0x263F5F9C0]];
    id v13 = objc_alloc(MEMORY[0x263F5F658]);
    uint64_t v14 = [(PLAWDAuxMetrics *)self operator];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __37__PLAWDCamera_startMetricCollection___block_invoke_2;
    v28[3] = &unk_264B99DD0;
    v28[4] = self;
    uint64_t v15 = (void *)[v13 initWithOperator:v14 forEntryKey:v12 withBlock:v28];

    [(PLAWDCamera *)self setCameraEventCallbackTorch:v15];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      v25 = __37__PLAWDCamera_startMetricCollection___block_invoke_3;
      v26 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v27 = v16;
      if (startMetricCollection__defaultOnce_3 != -1) {
        dispatch_once(&startMetricCollection__defaultOnce_3, &block);
      }
      if (startMetricCollection__classDebugEnabled_3)
      {
        v17 = [NSString stringWithFormat:@"%@ : Start Camera collection ", @"*******PLAWDMetricsService*******", block, v24, v25, v26, v27];
        v18 = (void *)MEMORY[0x263F5F638];
        v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m"];
        v20 = [v19 lastPathComponent];
        v21 = [NSString stringWithUTF8String:"-[PLAWDCamera startMetricCollection:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:97];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
  }
}

uint64_t __37__PLAWDCamera_startMetricCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleCameraCallback:a2];
  }
  return result;
}

uint64_t __37__PLAWDCamera_startMetricCollection___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleTorchCameraCallback:a2];
  }
  return result;
}

uint64_t __37__PLAWDCamera_startMetricCollection___block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled_3 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 removeObject:v4];

  uint64_t v6 = [v4 longValue];
  if (v6 == 2031627)
  {
    [(PLAWDCamera *)self setCameraEventCallback:0];
    [(PLAWDCamera *)self setCameraEventCallbackTorch:0];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      v19 = __36__PLAWDCamera_stopMetricCollection___block_invoke;
      v20 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v21 = v7;
      if (stopMetricCollection__defaultOnce_3 != -1) {
        dispatch_once(&stopMetricCollection__defaultOnce_3, &block);
      }
      if (stopMetricCollection__classDebugEnabled_3)
      {
        v8 = [NSString stringWithFormat:@"%@ : Stop Camera collection ", @"*******PLAWDMetricsService*******", block, v18, v19, v20, v21];
        id v9 = (void *)MEMORY[0x263F5F638];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLAWDCamera stopMetricCollection:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:114];

        id v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
  }
  uint64_t v14 = [(PLAWDAuxMetrics *)self runningMetrics];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    uint64_t v16 = (void *)plAwdCamera;
    plAwdCamera = 0;
  }
}

uint64_t __36__PLAWDCamera_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopMetricCollection__classDebugEnabled_3 = result;
  return result;
}

- (void)initCameraStats
{
  [(PLAWDCamera *)self setPrevFrontCameraState:0];
  [(PLAWDCamera *)self setPrevBackCameraState:0];
  [(PLAWDCamera *)self setPrevTorchCameraState:0];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __30__PLAWDCamera_initCameraStats__block_invoke;
    id v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (initCameraStats_defaultOnce != -1) {
      dispatch_once(&initCameraStats_defaultOnce, &block);
    }
    if (initCameraStats_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"%@ : init Camera stats: ", @"*******PLAWDMetricsService*******", block, v11, v12, v13, v14];
      uint64_t v5 = (void *)MEMORY[0x263F5F638];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m"];
      uint64_t v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLAWDCamera initCameraStats]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:130];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  [(PLAWDCamera *)self resetCameraTable];
}

uint64_t __30__PLAWDCamera_initCameraStats__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  initCameraStats_classDebugEnabled = result;
  return result;
}

- (void)reInitCameraStats
{
  uint64_t v3 = [MEMORY[0x263EFF910] monotonicDate];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  if ([(PLAWDCamera *)self prevFrontCameraState]) {
    [(PLAWDCamera *)self setFrontCameraTimestamp:v5];
  }
  if ([(PLAWDCamera *)self prevBackCameraState]) {
    [(PLAWDCamera *)self setBackCameraTimestamp:v5];
  }
  if ([(PLAWDCamera *)self prevTorchCameraState]) {
    [(PLAWDCamera *)self setTorchCameraTimestamp:v5];
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __32__PLAWDCamera_reInitCameraStats__block_invoke;
    uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v6;
    if (reInitCameraStats_defaultOnce != -1) {
      dispatch_once(&reInitCameraStats_defaultOnce, &block);
    }
    if (reInitCameraStats_classDebugEnabled)
    {
      uint64_t v7 = [NSString stringWithFormat:@"%@ : Re-init Camera stats: ", @"*******PLAWDMetricsService*******", block, v14, v15, v16, v17];
      v8 = (void *)MEMORY[0x263F5F638];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m"];
      v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLAWDCamera reInitCameraStats]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:149];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  [(PLAWDCamera *)self resetCameraTable];
}

uint64_t __32__PLAWDCamera_reInitCameraStats__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reInitCameraStats_classDebugEnabled = result;
  return result;
}

- (void)resetCameraTable
{
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:kPLAWDAggregateNameCameraMetrics];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDCamera;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (void)addEntryToCameraTable:(id)a3 withValue:(double)a4
{
  uint64_t v6 = *MEMORY[0x263F5F888];
  uint64_t v7 = kPLAWDAggregateNameCameraMetrics;
  id v8 = a3;
  id v12 = +[PLOperator entryKeyForType:v6 andName:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v12];
  [v9 setObject:v8 forKeyedSubscript:kPLAWDCameraMetricsKey];

  v10 = [NSNumber numberWithDouble:a4];
  [v9 setObject:v10 forKeyedSubscript:kPLAWDCameraMetricsValue];

  uint64_t v11 = [(PLAWDAuxMetrics *)self operator];
  [v11 logEntry:v9];
}

- (void)handleCameraCallback:(id)a3
{
  id v10 = a3;
  objc_super v4 = [v10 objectForKey:@"entry"];
  double v5 = v4;
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x263F5F9B0];
    uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F9B0]];

    if (v7)
    {
      id v8 = [v5 objectForKeyedSubscript:v6];
      uint64_t v9 = [v8 intValue];

      if ([MEMORY[0x263F5F8E0] isBackFacingCamera:v9])
      {
        [(PLAWDCamera *)self handleBackCameraCallback:v10];
      }
      else if ([MEMORY[0x263F5F8E0] isFrontFacingCamera:v9])
      {
        [(PLAWDCamera *)self handleFrontCameraCallback:v10];
      }
    }
  }
}

- (void)handleFrontCameraCallback:(id)a3
{
  objc_super v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    double v5 = [MEMORY[0x263EFF910] monotonicDate];
    [v5 timeIntervalSince1970];
    double v7 = v6;

    id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F9D0]];
    uint64_t v9 = [v8 BOOLValue];

    if (v9)
    {
      [(PLAWDCamera *)self setFrontCameraTimestamp:v7];
    }
    else if ([(PLAWDCamera *)self prevFrontCameraState])
    {
      [(PLAWDCamera *)self frontCameraTimestamp];
      if (v7 - v10 > 0.0) {
        -[PLAWDCamera addEntryToCameraTable:withValue:](self, "addEntryToCameraTable:withValue:", kPLAWDFrontCameraOnDuration);
      }
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __41__PLAWDCamera_handleFrontCameraCallback___block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v24 = v11;
      if (handleFrontCameraCallback__defaultOnce != -1) {
        dispatch_once(&handleFrontCameraCallback__defaultOnce, &block);
      }
      if (handleFrontCameraCallback__classDebugEnabled)
      {
        id v12 = NSString;
        BOOL v13 = [(PLAWDCamera *)self prevFrontCameraState];
        uint64_t v14 = [v12 stringWithFormat:@"%@ : FrontCameraCallback: currState=%d prevState=%d  ", @"*******PLAWDMetricsService*******", v9, v13, block, v21, v22, v23, v24];
        uint64_t v15 = (void *)MEMORY[0x263F5F638];
        uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m"];
        uint64_t v17 = [v16 lastPathComponent];
        uint64_t v18 = [NSString stringWithUTF8String:"-[PLAWDCamera handleFrontCameraCallback:]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:200];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDCamera *)self setPrevFrontCameraState:v9];
  }
}

uint64_t __41__PLAWDCamera_handleFrontCameraCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleFrontCameraCallback__classDebugEnabled = result;
  return result;
}

- (void)handleBackCameraCallback:(id)a3
{
  objc_super v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    double v5 = [MEMORY[0x263EFF910] monotonicDate];
    [v5 timeIntervalSince1970];
    double v7 = v6;

    id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F9D0]];
    uint64_t v9 = [v8 BOOLValue];

    if (v9)
    {
      [(PLAWDCamera *)self setBackCameraTimestamp:v7];
    }
    else if ([(PLAWDCamera *)self prevBackCameraState])
    {
      [(PLAWDCamera *)self backCameraTimestamp];
      if (v7 - v10 > 0.0) {
        -[PLAWDCamera addEntryToCameraTable:withValue:](self, "addEntryToCameraTable:withValue:", kPLAWDBackCameraOnDuration);
      }
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __40__PLAWDCamera_handleBackCameraCallback___block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v24 = v11;
      if (handleBackCameraCallback__defaultOnce != -1) {
        dispatch_once(&handleBackCameraCallback__defaultOnce, &block);
      }
      if (handleBackCameraCallback__classDebugEnabled)
      {
        id v12 = NSString;
        BOOL v13 = [(PLAWDCamera *)self prevBackCameraState];
        uint64_t v14 = [v12 stringWithFormat:@"%@ : BackCameraCallback: currState=%d prevState=%d  ", @"*******PLAWDMetricsService*******", v9, v13, block, v21, v22, v23, v24];
        uint64_t v15 = (void *)MEMORY[0x263F5F638];
        uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m"];
        uint64_t v17 = [v16 lastPathComponent];
        uint64_t v18 = [NSString stringWithUTF8String:"-[PLAWDCamera handleBackCameraCallback:]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:222];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDCamera *)self setPrevBackCameraState:v9];
  }
}

uint64_t __40__PLAWDCamera_handleBackCameraCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBackCameraCallback__classDebugEnabled = result;
  return result;
}

- (void)handleTorchCameraCallback:(id)a3
{
  objc_super v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    double v5 = [MEMORY[0x263EFF910] monotonicDate];
    [v5 timeIntervalSince1970];
    double v7 = v6;

    id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F9C8]];
    uint64_t v9 = [v8 BOOLValue];

    if (v9)
    {
      [(PLAWDCamera *)self setTorchCameraTimestamp:v7];
    }
    else if ([(PLAWDCamera *)self prevTorchCameraState])
    {
      [(PLAWDCamera *)self torchCameraTimestamp];
      if (v7 - v10 > 0.0) {
        -[PLAWDCamera addEntryToCameraTable:withValue:](self, "addEntryToCameraTable:withValue:", kPLAWDTorchCameraOnDuration);
      }
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __41__PLAWDCamera_handleTorchCameraCallback___block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v24 = v11;
      if (handleTorchCameraCallback__defaultOnce != -1) {
        dispatch_once(&handleTorchCameraCallback__defaultOnce, &block);
      }
      if (handleTorchCameraCallback__classDebugEnabled)
      {
        id v12 = NSString;
        BOOL v13 = [(PLAWDCamera *)self prevTorchCameraState];
        uint64_t v14 = [v12 stringWithFormat:@"%@ : TorchCameraCallback: currState=%d prevState=%d  ", @"*******PLAWDMetricsService*******", v9, v13, block, v21, v22, v23, v24];
        uint64_t v15 = (void *)MEMORY[0x263F5F638];
        uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m"];
        uint64_t v17 = [v16 lastPathComponent];
        uint64_t v18 = [NSString stringWithUTF8String:"-[PLAWDCamera handleTorchCameraCallback:]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:244];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDCamera *)self setPrevTorchCameraState:v9];
  }
}

uint64_t __41__PLAWDCamera_handleTorchCameraCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleTorchCameraCallback__classDebugEnabled = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  uint64_t v9 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
  double v10 = [MEMORY[0x263EFF910] monotonicDate];
  [v9 timeIntervalSince1970];
  double v12 = v11;
  [v10 timeIntervalSince1970];
  double v14 = v13;

  if ([v6 longValue] == 2031627)
  {
    if (v8)
    {
      uint64_t v15 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:kPLAWDAggregateNameCameraMetrics];
      uint64_t v16 = [(PLAWDAuxMetrics *)self operator];
      uint64_t v17 = [v16 storage];
      v56 = (void *)v15;
      uint64_t v18 = objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14 - v12);

      v55 = (void *)v18;
      v19 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v18];
      v20 = objc_opt_new();
      v57 = v20;
      v54 = v19;
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v21 = objc_opt_class();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __49__PLAWDCamera_submitDataToAWDServer_withAwdConn___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v21;
        if (submitDataToAWDServer_withAwdConn__defaultOnce_1 != -1) {
          dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_1, block);
        }
        if (submitDataToAWDServer_withAwdConn__classDebugEnabled_1)
        {
          v22 = [NSString stringWithFormat:@"aggregatedResults=%@", v19];
          v23 = (void *)MEMORY[0x263F5F638];
          uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m"];
          v25 = [v24 lastPathComponent];
          v26 = [NSString stringWithUTF8String:"-[PLAWDCamera submitDataToAWDServer:withAwdConn:]"];
          [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:268];

          uint64_t v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }

          v20 = v57;
          v19 = v54;
        }
      }
      if (v20)
      {
        id v53 = v6;
        objc_msgSend(v20, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
        v28 = [MEMORY[0x263EFF910] monotonicDate];
        [v28 timeIntervalSince1970];
        double v30 = v29;

        [v20 setCameraFrontOnDuration:0];
        [v20 setCameraBackOnDuration:0];
        [v20 setCameraTorchOnDuration:0];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v31 = v19;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v59 objects:v64 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v60 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              v37 = [v36 objectForKeyedSubscript:kPLAWDCameraMetricsKey];
              v38 = [v36 objectForKeyedSubscript:kPLAWDCameraMetricsValue];
              [v38 doubleValue];
              double v40 = v39;

              if ([v37 isEqualToString:kPLAWDFrontCameraOnDuration])
              {
                if ([(PLAWDCamera *)self prevFrontCameraState])
                {
                  [(PLAWDCamera *)self frontCameraTimestamp];
                  double v40 = v40 + v30 - v41;
                  [(PLAWDCamera *)self setFrontCameraTimestamp:v30];
                }
                [v57 setCameraFrontOnDuration:(v40 * 1000.0)];
              }
              else if ([v37 isEqualToString:kPLAWDBackCameraOnDuration])
              {
                if ([(PLAWDCamera *)self prevBackCameraState])
                {
                  [(PLAWDCamera *)self backCameraTimestamp];
                  double v40 = v40 + v30 - v42;
                  [(PLAWDCamera *)self setBackCameraTimestamp:v30];
                }
                [v57 setCameraBackOnDuration:(v40 * 1000.0)];
              }
              else if ([v37 isEqualToString:kPLAWDTorchCameraOnDuration])
              {
                if ([(PLAWDCamera *)self prevTorchCameraState])
                {
                  [(PLAWDCamera *)self torchCameraTimestamp];
                  double v40 = v40 + v30 - v43;
                  [(PLAWDCamera *)self setTorchCameraTimestamp:v30];
                }
                [v57 setCameraTorchOnDuration:(v40 * 1000.0)];
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v59 objects:v64 count:16];
          }
          while (v33);
        }

        [(PLAWDCamera *)self setCameraSubmitCnt:[(PLAWDCamera *)self cameraSubmitCnt] + 1];
        id v6 = v53;
        v20 = v57;
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v44 = objc_opt_class();
          v58[0] = MEMORY[0x263EF8330];
          v58[1] = 3221225472;
          v58[2] = __49__PLAWDCamera_submitDataToAWDServer_withAwdConn___block_invoke_75;
          v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v58[4] = v44;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_73 != -1) {
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_73, v58);
          }
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_74)
          {
            v45 = [NSString stringWithFormat:@"%@ : Submit Camera stats: submit cnt=%ld ", @"*******PLAWDMetricsService*******", -[PLAWDCamera cameraSubmitCnt](self, "cameraSubmitCnt")];
            v46 = (void *)MEMORY[0x263F5F638];
            v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m"];
            v48 = [v47 lastPathComponent];
            v49 = [NSString stringWithUTF8String:"-[PLAWDCamera submitDataToAWDServer:withAwdConn:]"];
            [v46 logMessage:v45 fromFile:v48 fromFunction:v49 fromLineNumber:309];

            v50 = PLLogCommon();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
              -[PLAWDDisplay startMetricCollection:]();
            }

            v20 = v57;
          }
        }
        [v8 setMetric:v20];
        v19 = v54;
      }
    }
    [(PLAWDCamera *)self reInitCameraStats];
    char v51 = [v7 submitMetric:v8];
  }
  else
  {
    char v51 = 0;
  }

  return v51;
}

uint64_t __49__PLAWDCamera_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_1 = result;
  return result;
}

uint64_t __49__PLAWDCamera_submitDataToAWDServer_withAwdConn___block_invoke_75(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_74 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)cameraEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCameraEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)cameraEventCallbackTorch
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCameraEventCallbackTorch:(id)a3
{
}

- (BOOL)prevFrontCameraState
{
  return self->_prevFrontCameraState;
}

- (void)setPrevFrontCameraState:(BOOL)a3
{
  self->_prevFrontCameraState = a3;
}

- (BOOL)prevBackCameraState
{
  return self->_prevBackCameraState;
}

- (void)setPrevBackCameraState:(BOOL)a3
{
  self->_prevBackCameraState = a3;
}

- (BOOL)prevTorchCameraState
{
  return self->_prevTorchCameraState;
}

- (void)setPrevTorchCameraState:(BOOL)a3
{
  self->_prevTorchCameraState = a3;
}

- (double)frontCameraTimestamp
{
  return self->_frontCameraTimestamp;
}

- (void)setFrontCameraTimestamp:(double)a3
{
  self->_frontCameraTimestamp = a3;
}

- (double)backCameraTimestamp
{
  return self->_backCameraTimestamp;
}

- (void)setBackCameraTimestamp:(double)a3
{
  self->_backCameraTimestamp = a3;
}

- (double)torchCameraTimestamp
{
  return self->_torchCameraTimestamp;
}

- (void)setTorchCameraTimestamp:(double)a3
{
  self->_torchCameraTimestamp = a3;
}

- (int64_t)cameraSubmitCnt
{
  return self->_cameraSubmitCnt;
}

- (void)setCameraSubmitCnt:(int64_t)a3
{
  self->_cameraSubmitCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraEventCallbackTorch, 0);

  objc_storeStrong((id *)&self->_cameraEventCallback, 0);
}

@end