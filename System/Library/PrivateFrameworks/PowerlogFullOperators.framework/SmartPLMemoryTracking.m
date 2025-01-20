@interface SmartPLMemoryTracking
+ (id)defaults;
- (PLEntryNotificationOperatorComposition)memoryTrackingNotification;
- (PLSmartPLService)operator;
- (void)handleMemoryTracking:(id)a3;
- (void)setMemoryTrackingNotification:(id)a3;
- (void)setOperator:(id)a3;
- (void)startWithOperator:(id)a3;
@end

@implementation SmartPLMemoryTracking

+ (id)defaults
{
  v2 = (void *)[&unk_26E546AC8 mutableCopy];
  if (([MEMORY[0x263F5F688] isFullModeDaemon] & 1) == 0)
  {
    if ([MEMORY[0x263F5F668] is64Bit]) {
      v3 = &unk_26E546A28;
    }
    else {
      v3 = &unk_26E546A40;
    }
    [v2 setObject:v3 forKeyedSubscript:@"MemoryTrackingTriggerThreshold"];
  }

  return v2;
}

- (void)startWithOperator:(id)a3
{
  [(SmartPLMemoryTracking *)self setOperator:a3];
  v4 = [MEMORY[0x263F5F900] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5FA20]];
  id v5 = objc_alloc(MEMORY[0x263F5F658]);
  v6 = [(SmartPLMemoryTracking *)self operator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SmartPLMemoryTracking_startWithOperator___block_invoke;
  v8[3] = &unk_264B99DD0;
  v8[4] = self;
  v7 = (void *)[v5 initWithOperator:v6 forEntryKey:v4 withBlock:v8];

  [(SmartPLMemoryTracking *)self setMemoryTrackingNotification:v7];
}

void __43__SmartPLMemoryTracking_startWithOperator___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectForKey:@"entry"];
  [v2 handleMemoryTracking:v3];
}

- (void)handleMemoryTracking:(id)a3
{
  id v4 = a3;
  id v5 = +[SmartPLMemoryTracking defaults];
  v6 = [v5 objectForKeyedSubscript:@"MemoryTrackingDirtyPercent"];
  [v6 floatValue];
  double v8 = v7;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke;
  block[3] = &unk_264B9A240;
  v34 = @"MemoryTrackingDirtyPercent";
  double v35 = v8;
  if (handleMemoryTracking__defaultOnce != -1) {
    dispatch_once(&handleMemoryTracking__defaultOnce, block);
  }
  double v9 = *(double *)&handleMemoryTracking__objectForKey;

  v10 = [v5 objectForKeyedSubscript:@"MemoryTrackingOverhead"];
  [v10 floatValue];
  double v12 = v11;

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke_2;
  v30[3] = &unk_264B9A240;
  v31 = @"MemoryTrackingOverhead";
  double v32 = v12;
  if (handleMemoryTracking__defaultOnce_34 != -1) {
    dispatch_once(&handleMemoryTracking__defaultOnce_34, v30);
  }
  double v13 = *(double *)&handleMemoryTracking__objectForKey_35;

  v14 = [v5 objectForKeyedSubscript:@"MemoryTrackingTriggerThreshold"];
  [v14 floatValue];
  double v16 = v15;

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke_3;
  v27[3] = &unk_264B9A240;
  v28 = @"MemoryTrackingTriggerThreshold";
  double v29 = v16;
  if (handleMemoryTracking__defaultOnce_36 != -1) {
    dispatch_once(&handleMemoryTracking__defaultOnce_36, v27);
  }
  double v17 = *(double *)&handleMemoryTracking__objectForKey_37;

  v18 = [v4 objectForKeyedSubscript:@"MallocSize"];

  [v18 doubleValue];
  double v20 = v13 + v19 * v9;

  if (v20 > v17)
  {
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"dirtyMemoryGuess greater than threshold %f", *(void *)&v20);
    v22 = [(SmartPLMemoryTracking *)self operator];
    [v22 logEventPointSmartPLFiredFromAuxilary:objc_opt_class() withReason:v21];

    v23 = [(SmartPLMemoryTracking *)self operator];
    [v23 logEventPointStackShotWithReason:v21];

    v24 = [(SmartPLMemoryTracking *)self operator];
    v25 = [MEMORY[0x263F08AB0] processInfo];
    v26 = [v25 processName];
    [v24 logEventPointSampleForProcessName:v26];
  }
}

uint64_t __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] doubleForKey:*(void *)(a1 + 32) ifNotSet:*(double *)(a1 + 40)];
  handleMemoryTracking__objectForKey = v2;
  return result;
}

uint64_t __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] doubleForKey:*(void *)(a1 + 32) ifNotSet:*(double *)(a1 + 40)];
  handleMemoryTracking__objectForKey_35 = v2;
  return result;
}

uint64_t __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] doubleForKey:*(void *)(a1 + 32) ifNotSet:*(double *)(a1 + 40)];
  handleMemoryTracking__objectForKey_37 = v2;
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

- (PLEntryNotificationOperatorComposition)memoryTrackingNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMemoryTrackingNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryTrackingNotification, 0);

  objc_destroyWeak((id *)&self->_operator);
}

@end