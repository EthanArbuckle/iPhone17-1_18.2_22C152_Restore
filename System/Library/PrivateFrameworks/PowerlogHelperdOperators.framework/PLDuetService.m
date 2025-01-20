@interface PLDuetService
+ (id)aggregateNameDuetEnergyAccumulator;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionBatterySaverMode;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)eventIntervalDefinitionComplicationEvents;
+ (id)eventIntervalDefinitionDuetEvents;
+ (void)load;
- (PLDuetService)init;
- (PLDuetServiceDAS)dasEvent;
- (PLDuetServiceImpl)impl;
- (PLDuetServiceLpmSource)lpmSource;
- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4;
- (int64_t)registrationModeStringToEnum:(id)a3;
- (void)dealloc;
- (void)handleBatterySaverModeToken:(int)a3 withNotification:(id)a4;
- (void)initOperatorDependancies;
- (void)logEventForwardBatterySaverModeWithState:(BOOL)a3 fromNotification:(id)a4;
- (void)setupBatterySaverModeForNotification:(id)a3;
@end

@implementation PLDuetService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLDuetService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"DASPoliciesBlockingCriteria";
  objc_super v2 = +[PLDuetServiceDAS entryEventNoneDefinitionsDASPoliciesBlockingCriteria];
  v10[0] = v2;
  v9[1] = @"DASActivity";
  v3 = +[PLDuetServiceDAS entryEventNoneDefinitionsDASActivity];
  v10[1] = v3;
  v9[2] = @"DASDropCount";
  v4 = +[PLDuetServiceDAS entryEventNoneDefinitionsDASActivityDropCount];
  v10[2] = v4;
  v9[3] = @"DASInfo";
  v5 = +[PLDuetServiceDAS entryEventNoneDefinitionsDASInfo];
  v10[3] = v5;
  v9[4] = @"DASActivityLifecycle";
  v6 = +[PLDuetServiceDAS entryEventNoneDefinitionsDASActivityLifecycle];
  v10[4] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

+ (id)entryEventForwardDefinitions
{
  v12[7] = *MEMORY[0x1E4F143B8];
  v11[0] = @"BatterySaverMode";
  objc_super v2 = [a1 entryEventForwardDefinitionBatterySaverMode];
  v12[0] = v2;
  v11[1] = @"DASPrediction";
  v3 = +[PLDuetServiceDAS entryEventForwardDefinitionsDASPrediction];
  v12[1] = v3;
  v11[2] = @"DASApplicationUsagePrediction";
  v4 = +[PLDuetServiceDAS entryEventForwardDefinitionsDASApplicationPrediction];
  v12[2] = v4;
  v11[3] = @"LpmSourceInformation";
  v5 = +[PLDuetServiceLpmSource entryEventForwardDefinitionLpmSourceInformation];
  v12[3] = v5;
  v11[4] = @"DASEnergyBudgetAvailable";
  v6 = +[PLDuetServiceDAS entryEventForwardDefinitionsDASEnergyBudgetAvailable];
  v12[4] = v6;
  v11[5] = @"DASDataBudgetAvailable";
  v7 = +[PLDuetServiceDAS entryEventForwardDefinitionsDASDataBudgetAvailable];
  v12[5] = v7;
  v11[6] = @"DASTrial";
  v8 = +[PLDuetServiceDAS entryEventForwardDefinitionsDASTrial];
  v12[6] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];

  return v9;
}

+ (id)entryEventBackwardDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"DASEnergyBudgetReport";
  objc_super v2 = +[PLDuetServiceDAS entryEventBackwardDefinitionsDASEnergyBudgetReport];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventForwardDefinitionBatterySaverMode
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities hasBattery])
  {
    v14[0] = *MEMORY[0x1E4F92C50];
    uint64_t v12 = *MEMORY[0x1E4F92CD0];
    v13 = &unk_1F4011EB8;
    objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v15[0] = v2;
    v14[1] = *MEMORY[0x1E4F92CA8];
    v10[0] = @"Mode";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v10[1] = @"Value";
    v11[0] = v4;
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v11[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v15[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v8;
}

+ (id)entryEventIntervalDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"DuetEvents";
  v3 = [a1 eventIntervalDefinitionDuetEvents];
  v7[1] = @"ComplicationEvents";
  v8[0] = v3;
  v4 = [a1 eventIntervalDefinitionComplicationEvents];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)eventIntervalDefinitionDuetEvents
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if ([a1 isDebugEnabled])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C08];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F4011EC8;
    v18[1] = MEMORY[0x1E4F1CC38];
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"BundleID";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
    v16[0] = v4;
    v15[1] = @"UpdateType";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v16[1] = v6;
    v15[2] = @"StartDate";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_DateFormat");
    v16[2] = v8;
    void v15[3] = @"EndDate";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_DateFormat");
    v16[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)eventIntervalDefinitionComplicationEvents
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"DuetEnergyAccumulator";
  uint64_t v2 = [a1 aggregateNameDuetEnergyAccumulator];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)aggregateNameDuetEnergyAccumulator
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4011EB8;
  v22[1] = &unk_1F400CAA8;
  v21[2] = *MEMORY[0x1E4F92C08];
  v22[2] = MEMORY[0x1E4F1CC38];
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v14;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"BundleID";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v20[0] = v4;
  v19[1] = @"QualificationID";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v20[1] = v6;
  void v19[2] = @"Energy";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v20[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v24[1] = v9;
  v23[2] = *MEMORY[0x1E4F92BE0];
  v17 = &unk_1F4011ED8;
  uint64_t v15 = *MEMORY[0x1E4F92BD8];
  v16 = &unk_1F4011EE8;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v23[3] = *MEMORY[0x1E4F92BF0];
  v24[2] = v11;
  v24[3] = &unk_1F4013300;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  uint64_t v4 = *MEMORY[0x1E4F92D20];
  id v5 = a3;
  v6 = +[PLOperator entryKeyForType:v4 andName:@"DuetEnergyAccumulator"];
  LODWORD(v4) = [v5 isEqualToString:v6];

  if (v4) {
    return @"ID < 0";
  }
  else {
    return 0;
  }
}

- (PLDuetService)init
{
  if ([MEMORY[0x1E4F92A38] nonUIBuild])
  {
    v3 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLDuetService;
    uint64_t v4 = [(PLOperator *)&v12 init];
    if (v4)
    {
      uint64_t v5 = objc_opt_new();
      lpmSource = v4->_lpmSource;
      v4->_lpmSource = (PLDuetServiceLpmSource *)v5;

      uint64_t v7 = objc_opt_new();
      dasEvent = v4->_dasEvent;
      v4->_dasEvent = (PLDuetServiceDAS *)v7;

      uint64_t v9 = objc_opt_new();
      impl = v4->_impl;
      v4->_impl = (PLDuetServiceImpl *)v9;
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  v3 = [(PLDuetService *)self impl];

  if (v3)
  {
    uint64_t v4 = [(PLDuetService *)self impl];
    [v4 initOperatorDependancies:self];
  }
  uint64_t v5 = [(PLDuetService *)self lpmSource];
  [v5 initOperatorDependanciesLpmSource:self];

  v6 = [(PLDuetService *)self dasEvent];
  [v6 initOperatorDependanciesDAS:self];

  if (+[PLUtilities hasBattery])
  {
    [(PLDuetService *)self setupBatterySaverModeForNotification:@"com.apple.system.lowpowermode"];
  }
}

- (void)setupBatterySaverModeForNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetService setupBatterySaverModeForNotification:].cold.4();
  }

  int out_token = -1;
  id v6 = v4;
  uint64_t v7 = (const char *)[v6 UTF8String];
  v8 = [(PLOperator *)self workQueue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __54__PLDuetService_setupBatterySaverModeForNotification___block_invoke;
  handler[3] = &unk_1E6E48EB8;
  handler[4] = self;
  id v9 = v6;
  id v16 = v9;
  uint32_t v10 = notify_register_dispatch(v7, &out_token, v8, handler);

  v11 = PLLogCommon();
  objc_super v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PLDuetService setupBatterySaverModeForNotification:]();
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLDuetService setupBatterySaverModeForNotification:]();
    }

    if ([v9 isEqualToString:@"com.apple.system.lowpowermode"])
    {
      v13 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v14 = [v13 isLowPowerModeEnabled];

      [(PLDuetService *)self logEventForwardBatterySaverModeWithState:v14 fromNotification:v9];
    }
    else
    {
      [(PLDuetService *)self handleBatterySaverModeToken:out_token withNotification:v9];
    }
    objc_super v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLDuetService setupBatterySaverModeForNotification:]();
    }
  }
}

uint64_t __54__PLDuetService_setupBatterySaverModeForNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleBatterySaverModeToken:a2 withNotification:*(void *)(a1 + 40)];
}

- (void)handleBatterySaverModeToken:(int)a3 withNotification:(id)a4
{
  id v6 = a4;
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64))
  {
    uint64_t v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLDuetService handleBatterySaverModeToken:withNotification:]();
    }
  }
  else
  {
    uint64_t v8 = state64;
    id v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLDuetService handleBatterySaverModeToken:withNotification:]();
    }

    [(PLDuetService *)self logEventForwardBatterySaverModeWithState:v8 != 0 fromNotification:v6];
  }
}

- (void)logEventForwardBatterySaverModeWithState:(BOOL)a3 fromNotification:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLDuetService logEventForwardBatterySaverModeWithState:fromNotification:]();
  }

  uint64_t v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"BatterySaverMode"];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8];
  int64_t v10 = [(PLDuetService *)self registrationModeStringToEnum:v6];
  v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
  [v9 setObject:v11 forKeyedSubscript:@"Mode"];

  objc_super v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v9 setObject:v12 forKeyedSubscript:@"Value"];

  [(PLOperator *)self logEntry:v9];
}

- (int64_t)registrationModeStringToEnum:(id)a3
{
  return [a3 isEqualToString:@"com.apple.system.lowpowermode"] ^ 1;
}

- (void)dealloc
{
  v3 = [(PLDuetService *)self impl];

  if (v3)
  {
    BOOL v4 = [(PLDuetService *)self impl];
    [v4 stopService];
  }
  uint64_t v5 = [(PLDuetService *)self lpmSource];
  [v5 stopService];

  id v6 = [(PLDuetService *)self dasEvent];
  [v6 stopService];

  v7.receiver = self;
  v7.super_class = (Class)PLDuetService;
  [(PLOperator *)&v7 dealloc];
}

- (PLDuetServiceLpmSource)lpmSource
{
  return (PLDuetServiceLpmSource *)objc_getProperty(self, a2, 48, 1);
}

- (PLDuetServiceDAS)dasEvent
{
  return (PLDuetServiceDAS *)objc_getProperty(self, a2, 56, 1);
}

- (PLDuetServiceImpl)impl
{
  return (PLDuetServiceImpl *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_dasEvent, 0);
  objc_storeStrong((id *)&self->_lpmSource, 0);
}

- (void)setupBatterySaverModeForNotification:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "batterysaver: setup complete for %@", v2, v3, v4, v5, v6);
}

- (void)setupBatterySaverModeForNotification:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "batterysaver: re-syncing %@", v2, v3, v4, v5, v6);
}

- (void)setupBatterySaverModeForNotification:.cold.3()
{
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_2_3(&dword_1E4220000, v0, v1, "batterysaver: failed to register for %@ with status %d");
}

- (void)setupBatterySaverModeForNotification:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "batterysaver: setting up %@", v2, v3, v4, v5, v6);
}

- (void)handleBatterySaverModeToken:withNotification:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1E4220000, v1, OS_LOG_TYPE_DEBUG, "batterysaver: callback %@=%llu", v2, 0x16u);
}

- (void)handleBatterySaverModeToken:withNotification:.cold.2()
{
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_2_3(&dword_1E4220000, v0, v1, "batterysaver: notify_get_state failed for %@ with status %d");
}

- (void)logEventForwardBatterySaverModeWithState:fromNotification:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1E4220000, v1, OS_LOG_TYPE_DEBUG, "batterysaver: %@=%d", v2, 0x12u);
}

@end