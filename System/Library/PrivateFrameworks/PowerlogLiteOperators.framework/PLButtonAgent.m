@interface PLButtonAgent
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionTrackpadPowerState;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionActionButtonInteraction;
+ (id)entryEventForwardDefinitionActionButtonSelection;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLButtonAgent)init;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLHIDEventOperatorComposition)buttonEvent;
- (PLHIDEventOperatorComposition)smartCoverEvent;
- (PLXPCListenerOperatorComposition)buttonInteractionListener;
- (PLXPCListenerOperatorComposition)buttonSelectionChangedListener;
- (PLXPCListenerOperatorComposition)buttonSelectionListener;
- (PLXPCListenerOperatorComposition)captureButtonActionListener;
- (int64_t)interactionTypeStringToEnum:(id)a3;
- (void)initOperatorDependancies;
- (void)logEventBackwardCaptureButtonAction:(id)a3;
- (void)logEventForwardActionButtonInteraction:(id)a3;
- (void)logEventForwardActionButtonSelection:(id)a3;
- (void)logEventForwardSmartCover:(__IOHIDEvent *)a3;
- (void)logEventPointButton:(__IOHIDEvent *)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setButtonEvent:(id)a3;
- (void)setButtonInteractionListener:(id)a3;
- (void)setButtonSelectionChangedListener:(id)a3;
- (void)setButtonSelectionListener:(id)a3;
- (void)setCaptureButtonActionListener:(id)a3;
- (void)setSmartCoverEvent:(id)a3;
@end

@implementation PLButtonAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLButtonAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v18 = @"Button";
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v14[0] = *MEMORY[0x1E4F92CD0];
  v14[1] = v2;
  v15[0] = &unk_1F29F0CA0;
  v15[1] = MEMORY[0x1E4F1CC28];
  v14[2] = *MEMORY[0x1E4F92CB8];
  v15[2] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v17[0] = v3;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"ButtonType";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v12[1] = @"EventType";
  v13[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v17[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

  return v10;
}

+ (id)entryEventForwardDefinitionActionButtonInteraction
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F0CB0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"type";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionActionButtonSelection
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F29F0CC0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"action";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v10[1] = @"sub-action";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitions
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v21[0] = @"CoverState";
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v3 = *MEMORY[0x1E4F92C60];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v3;
  v18[0] = &unk_1F29F0CB0;
  v18[1] = MEMORY[0x1E4F1CC28];
  void v17[2] = *MEMORY[0x1E4F92CB8];
  v18[2] = MEMORY[0x1E4F1CC28];
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"Side";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v15[1] = @"State";
  v16[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v16[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v20[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v9;
  v21[1] = @"ActionButtonSelection";
  uint64_t v10 = [a1 entryEventForwardDefinitionActionButtonSelection];
  v22[1] = v10;
  v21[2] = @"ActionButtonInteraction";
  v11 = [a1 entryEventForwardDefinitionActionButtonInteraction];
  v22[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  return v12;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionTrackpadPowerState
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0CB0;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"ActiveDurationMs";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"ReadyDurationMs";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLButtonAgent)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLButtonAgent;
    self = [(PLAgent *)&v5 init];
    uint64_t v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke;
  v20[3] = &unk_1E692A6F8;
  v20[4] = self;
  v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29EA5D0 withBlock:v20];
  [(PLButtonAgent *)self setCaptureButtonActionListener:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke_98;
  v19[3] = &unk_1E692A6F8;
  v19[4] = self;
  v6 = (void *)[v5 initWithOperator:self withRegistration:&unk_1F29EA5F8 withBlock:v19];
  [(PLButtonAgent *)self setButtonSelectionChangedListener:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke_103;
  void v18[3] = &unk_1E692A6F8;
  v18[4] = self;
  v8 = (void *)[v7 initWithOperator:self withRegistration:&unk_1F29EA620 withBlock:v18];
  [(PLButtonAgent *)self setButtonSelectionListener:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke_108;
  void v17[3] = &unk_1E692A6F8;
  v17[4] = self;
  uint64_t v10 = (void *)[v9 initWithOperator:self withRegistration:&unk_1F29EA648 withBlock:v17];
  [(PLButtonAgent *)self setButtonInteractionListener:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F929F0]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke_110;
  void v16[3] = &unk_1E692E730;
  v16[4] = self;
  uint64_t v12 = (void *)[v11 initWithOperator:self forUsagePage:11 andUsage:1 withBlock:v16];
  [(PLButtonAgent *)self setButtonEvent:v12];

  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    id v13 = objc_alloc(MEMORY[0x1E4F929F0]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke_2;
    void v15[3] = &unk_1E692E730;
    v15[4] = self;
    v14 = (void *)[v13 initWithOperator:self forUsagePage:65280 andUsage:41 withBlock:v15];
    [(PLButtonAgent *)self setSmartCoverEvent:v14];
  }
}

void __41__PLButtonAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Button action payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardCaptureButtonAction:v6];
}

void __41__PLButtonAgent_initOperatorDependancies__block_invoke_98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Action Button Selection Changed payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardActionButtonSelection:v6];
}

void __41__PLButtonAgent_initOperatorDependancies__block_invoke_103(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Action Button Selection Daily payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardActionButtonSelection:v6];
}

void __41__PLButtonAgent_initOperatorDependancies__block_invoke_108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Action Button Interaction payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardActionButtonInteraction:v6];
}

uint64_t __41__PLButtonAgent_initOperatorDependancies__block_invoke_110(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) logEventPointButton:a2];
  v4 = *(void **)(a1 + 32);
  return [v4 logEventForwardSmartCover:a2];
}

uint64_t __41__PLButtonAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) logEventForwardSmartCover:a2];
}

- (void)logEventPointButton:(__IOHIDEvent *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IOHIDEventGetType() == 3 && IOHIDEventGetIntegerValue() == 12)
  {
    v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Button"];
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v6 = IOHIDEventGetIntegerValue();
    uint64_t TimeStamp = IOHIDEventGetTimeStamp();
    uint64_t v8 = mach_absolute_time();
    id v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v8];
    double v11 = v10;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:TimeStamp];
    id v13 = [v9 dateByAddingTimeInterval:-(v11 - v12)];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withDate:v13];
    v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 134217984;
      uint64_t v19 = IntegerValue;
      _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "Button event: State %llu", (uint8_t *)&v18, 0xCu);
    }

    v16 = [NSNumber numberWithUnsignedLongLong:IntegerValue];
    [v14 setObject:v16 forKeyedSubscript:@"ButtonType"];

    v17 = [NSNumber numberWithUnsignedLongLong:v6];
    [v14 setObject:v17 forKeyedSubscript:@"EventType"];

    [(PLOperator *)self logEntry:v14];
  }
}

- (void)logEventForwardActionButtonInteraction:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v10 = +[PLOperator entryKeyForType:v4 andName:@"ActionButtonInteraction"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  id v7 = [v5 objectForKeyedSubscript:@"type"];

  int64_t v8 = [(PLButtonAgent *)self interactionTypeStringToEnum:v7];
  id v9 = [NSNumber numberWithInteger:v8];
  [v6 setObject:v9 forKeyedSubscript:@"type"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardActionButtonSelection:(id)a3
{
  id v11 = a3;
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ActionButtonSelection"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v11];
  uint64_t v6 = [v11 objectForKeyedSubscript:@"action"];
  if ([v6 containsString:@"Camera"])
  {
    int v7 = 1;
  }
  else
  {
    int64_t v8 = [v11 objectForKeyedSubscript:@"action"];
    int v7 = [v8 containsString:@"Focus"];
  }
  id v9 = [v11 objectForKeyedSubscript:@"param_value"];

  if (v9 && v7)
  {
    id v10 = [v11 objectForKeyedSubscript:@"param_value"];
    [v5 setObject:v10 forKeyedSubscript:@"sub-action"];
  }
  [(PLOperator *)self logEntry:v5];
}

- (void)logEventForwardSmartCover:(__IOHIDEvent *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IOHIDEventGetType() == 3 && IOHIDEventGetIntegerValue() == 65289)
  {
    uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"CoverState"];
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 134217984;
      uint64_t v19 = IntegerValue;
      _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "SmartCover event: State %llu", (uint8_t *)&v18, 0xCu);
    }

    uint64_t TimeStamp = IOHIDEventGetTimeStamp();
    uint64_t v8 = mach_absolute_time();
    id v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v8];
    double v11 = v10;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:TimeStamp];
    id v13 = [v9 dateByAddingTimeInterval:-(v11 - v12)];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withDate:v13];
    uint64_t v15 = IOHIDEventGetIntegerValue();
    if (v15 == 1)
    {
      v16 = &unk_1F29E6598;
    }
    else
    {
      if (v15 != 16)
      {
LABEL_10:

        return;
      }
      v16 = &unk_1F29E65B0;
    }
    [v14 setObject:v16 forKeyedSubscript:@"Side"];
    v17 = [NSNumber numberWithUnsignedLongLong:IntegerValue];
    [v14 setObject:v17 forKeyedSubscript:@"State"];

    [(PLOperator *)self logEntry:v14];
    goto LABEL_10;
  }
}

- (void)logEventBackwardCaptureButtonAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [v4 objectForKeyedSubscript:&unk_1F29E6598];
  [v5 setObject:v6 forKeyedSubscript:@"FullPress"];

  int v7 = [v4 objectForKeyedSubscript:&unk_1F29E65C8];
  [v5 setObject:v7 forKeyedSubscript:@"HalfPress"];

  uint64_t v8 = [v4 objectForKeyedSubscript:&unk_1F29E65E0];
  [v5 setObject:v8 forKeyedSubscript:@"Touch"];

  id v9 = [v4 objectForKeyedSubscript:@"TouchTimeInterval"];

  [v9 doubleValue];
  double v11 = v10;

  LODWORD(v12) = llround(v11);
  id v13 = [NSNumber numberWithInt:v12];
  [v5 setObject:v13 forKeyedSubscript:@"TouchTimeInterval"];

  v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412290;
    v16 = v5;
    _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "Button action updated payload: %@", (uint8_t *)&v15, 0xCu);
  }

  [(PLOperator *)self logForSubsystem:@"Button" category:@"CaptureButtonAction" data:v5];
}

- (int64_t)interactionTypeStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Pressed"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"LongPressed"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Suppressed"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (PLXPCListenerOperatorComposition)captureButtonActionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCaptureButtonActionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)buttonSelectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setButtonSelectionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)buttonSelectionChangedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setButtonSelectionChangedListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)buttonInteractionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setButtonInteractionListener:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (PLHIDEventOperatorComposition)buttonEvent
{
  return (PLHIDEventOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setButtonEvent:(id)a3
{
}

- (PLHIDEventOperatorComposition)smartCoverEvent
{
  return (PLHIDEventOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSmartCoverEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartCoverEvent, 0);
  objc_storeStrong((id *)&self->_buttonEvent, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_buttonInteractionListener, 0);
  objc_storeStrong((id *)&self->_buttonSelectionChangedListener, 0);
  objc_storeStrong((id *)&self->_buttonSelectionListener, 0);
  objc_storeStrong((id *)&self->_captureButtonActionListener, 0);
}

@end