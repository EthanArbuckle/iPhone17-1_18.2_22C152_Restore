@interface BBSmartPL
- (NSDate)lastLogDate;
- (PLEntryNotificationOperatorComposition)bbHwOtherCallback;
- (PLSmartPLService)operator;
- (PLTelephonyConnection)connection;
- (double)cxoDuration;
- (double)logDuration;
- (void)handleMavBBHwOtherCallback:(id)a3;
- (void)setBbHwOtherCallback:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCxoDuration:(double)a3;
- (void)setLastLogDate:(id)a3;
- (void)setLogDuration:(double)a3;
- (void)setOperator:(id)a3;
- (void)startWithOperator:(id)a3;
- (void)triggerBBCoreDump;
@end

@implementation BBSmartPL

- (void)startWithOperator:(id)a3
{
  id v4 = a3;
  [(BBSmartPL *)self setOperator:v4];
  v5 = [MEMORY[0x263EFF910] monotonicDate];
  [(BBSmartPL *)self setLastLogDate:v5];

  [(BBSmartPL *)self setLogDuration:0.0];
  [(BBSmartPL *)self setCxoDuration:0.0];
  v6 = [MEMORY[0x263F5F920] sharedTelephonyConnection];
  [(BBSmartPL *)self setConnection:v6];

  v7 = [MEMORY[0x263F5F8C8] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F990]];
  id v8 = objc_alloc(MEMORY[0x263F5F658]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__BBSmartPL_startWithOperator___block_invoke;
  v10[3] = &unk_264B99DD0;
  v10[4] = self;
  v9 = (void *)[v8 initWithOperator:v4 forEntryKey:v7 withBlock:v10];

  [(BBSmartPL *)self setBbHwOtherCallback:v9];
}

uint64_t __31__BBSmartPL_startWithOperator___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleMavBBHwOtherCallback:a2];
  }
  return result;
}

- (void)triggerBBCoreDump
{
  v2 = [(BBSmartPL *)self connection];
  v3 = [NSString stringWithFormat:@"Auto-trigger of core dump by Powerlog: smartPL"];
  char v4 = [v2 requestBasebandCoreDump:v3];

  if ((v4 & 1) == 0)
  {
    v5 = [NSString stringWithFormat:@"Core dump failed"];
    v6 = (void *)MEMORY[0x263F5F638];
    v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/SmartPL/BBSmartPL.m"];
    id v8 = [v7 lastPathComponent];
    v9 = [NSString stringWithUTF8String:"-[BBSmartPL triggerBBCoreDump]"];
    [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:52];

    v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PLAWDNetworkUsage handleNameConnectionCallback:]((uint64_t)v5, v10);
    }
  }
}

- (void)handleMavBBHwOtherCallback:(id)a3
{
  char v4 = [a3 objectForKey:@"entry"];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F970]];
  [v5 doubleValue];
  double v7 = v6;
  [(BBSmartPL *)self logDuration];
  [(BBSmartPL *)self setLogDuration:v7 + v8];

  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F950]];
  [v9 doubleValue];
  double v11 = v10;
  [(BBSmartPL *)self cxoDuration];
  [(BBSmartPL *)self setCxoDuration:v11 + v12];

  v13 = [v4 entryDate];
  v14 = [(BBSmartPL *)self lastLogDate];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v16 >= 1200.0)
  {
    v17 = [MEMORY[0x263F5F8C8] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F948]];
    v18 = [(BBSmartPL *)self operator];
    v19 = [v18 storage];
    v20 = [v19 lastEntryForKey:v17];

    v21 = [v20 objectForKeyedSubscript:@"callStatus"];
    if ([v21 isEqualToString:@"Inactive"])
    {
      [(BBSmartPL *)self cxoDuration];
      double v23 = v22;
      [(BBSmartPL *)self logDuration];
      if (v23 / v24 < 0.0)
      {
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v25 = objc_opt_class();
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v45 = 3221225472;
          v46 = __40__BBSmartPL_handleMavBBHwOtherCallback___block_invoke;
          v47 = &__block_descriptor_40_e5_v8__0lu32l8;
          uint64_t v48 = v25;
          if (handleMavBBHwOtherCallback__defaultOnce != -1) {
            dispatch_once(&handleMavBBHwOtherCallback__defaultOnce, &block);
          }
          if (handleMavBBHwOtherCallback__classDebugEnabled)
          {
            v26 = NSString;
            [(BBSmartPL *)self cxoDuration];
            double v28 = v27;
            [(BBSmartPL *)self logDuration];
            v30 = objc_msgSend(v26, "stringWithFormat:", @"SMARTPL - trigger Core Dump%f", v28 / v29, block, v45, v46, v47, v48);
            v31 = (void *)MEMORY[0x263F5F638];
            v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/SmartPL/BBSmartPL.m"];
            v33 = [v32 lastPathComponent];
            v34 = [NSString stringWithUTF8String:"-[BBSmartPL handleMavBBHwOtherCallback:]"];
            [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:74];

            v35 = PLLogCommon();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              -[PLAWDNetworkUsage handleNameConnectionCallback:]((uint64_t)v30, v35);
            }
          }
        }
        [(BBSmartPL *)self triggerBBCoreDump];
        v36 = [(BBSmartPL *)self operator];
        uint64_t v37 = objc_opt_class();
        v38 = NSString;
        [(BBSmartPL *)self cxoDuration];
        double v40 = v39;
        [(BBSmartPL *)self logDuration];
        v42 = objc_msgSend(v38, "stringWithFormat:", @"cxoDuration/logDuration=%f", v40 / v41);
        [v36 logEventPointSmartPLFiredFromAuxilary:v37 withReason:v42];
      }
    }
    v43 = [MEMORY[0x263EFF910] monotonicDate];
    [(BBSmartPL *)self setLastLogDate:v43];

    [(BBSmartPL *)self setLogDuration:0.0];
    [(BBSmartPL *)self setCxoDuration:0.0];
  }
}

uint64_t __40__BBSmartPL_handleMavBBHwOtherCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleMavBBHwOtherCallback__classDebugEnabled = result;
  return result;
}

- (PLSmartPLService)operator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operator);

  return (PLSmartPLService *)WeakRetained;
}

- (void)setOperator:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)bbHwOtherCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBbHwOtherCallback:(id)a3
{
}

- (NSDate)lastLogDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastLogDate:(id)a3
{
}

- (double)logDuration
{
  return self->_logDuration;
}

- (void)setLogDuration:(double)a3
{
  self->_logDuration = a3;
}

- (double)cxoDuration
{
  return self->_cxoDuration;
}

- (void)setCxoDuration:(double)a3
{
  self->_cxoDuration = a3;
}

- (PLTelephonyConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (PLTelephonyConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_lastLogDate, 0);
  objc_storeStrong((id *)&self->_bbHwOtherCallback, 0);

  objc_destroyWeak((id *)&self->_operator);
}

@end