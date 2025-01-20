@interface PLBatteryUIResponseTypeRecentUsageInsight
- (BOOL)didUpgrade;
- (BOOL)shouldShowSuggestionThroughOverrides;
- (BOOL)suggest;
- (NSDate)end;
- (NSMutableArray)batteryBreakdown_Last10Days;
- (PLBatteryUIResponderService)responderService;
- (double)energyThresholdForUpgradeInsight;
- (double)firstEntryTimestamp;
- (double)foregroundTimeThresholdForUpgradeInsight;
- (double)getfirstEntryTimestampFromDb;
- (double)lastUpgradeTimestamp;
- (double)maxTimeValAfterUpgrade;
- (double)maxTimeValBeforeUpgrade;
- (double)minDrainPercentBeforeUpgrade;
- (double)minTimeValAfterUpgrade;
- (double)minTimeValBeforeUpgrade;
- (id)dependencies;
- (id)result;
- (void)configure:(id)a3;
- (void)didUpgrade;
- (void)run;
- (void)setBatteryBreakdown_Last10Days:(id)a3;
- (void)setEnd:(id)a3;
- (void)setEnergyThresholdForUpgradeInsight:(double)a3;
- (void)setFirstEntryTimestamp:(double)a3;
- (void)setForegroundTimeThresholdForUpgradeInsight:(double)a3;
- (void)setLastUpgradeTimestamp:(double)a3;
- (void)setMaxTimeValAfterUpgrade:(double)a3;
- (void)setMaxTimeValBeforeUpgrade:(double)a3;
- (void)setMinDrainPercentBeforeUpgrade:(double)a3;
- (void)setMinTimeValAfterUpgrade:(double)a3;
- (void)setMinTimeValBeforeUpgrade:(double)a3;
- (void)setResponderService:(id)a3;
- (void)setSuggest:(BOOL)a3;
@end

@implementation PLBatteryUIResponseTypeRecentUsageInsight

- (id)dependencies
{
  return &unk_1F4014FB0;
}

- (void)configure:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"end"];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v6];
  [(PLBatteryUIResponseTypeRecentUsageInsight *)self setEnd:v7];

  [(PLBatteryUIResponseTypeRecentUsageInsight *)self getfirstEntryTimestampFromDb];
  -[PLBatteryUIResponseTypeRecentUsageInsight setFirstEntryTimestamp:](self, "setFirstEntryTimestamp:");
  v8 = [MEMORY[0x1E4F929C0] objectForKey:@"LastUpgradeTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  [v8 doubleValue];
  -[PLBatteryUIResponseTypeRecentUsageInsight setLastUpgradeTimestamp:](self, "setLastUpgradeTimestamp:");

  +[PLUtilities containerPath];
  v9 = (void *)_CFPreferencesCopyValueWithContainer();
  v10 = v9;
  if (v9)
  {
    [v9 doubleValue];
    double v12 = v11;
  }
  else
  {
    double v12 = 864000.0;
  }

  [(PLBatteryUIResponseTypeRecentUsageInsight *)self setMaxTimeValBeforeUpgrade:v12];
  +[PLUtilities containerPath];
  v13 = (void *)_CFPreferencesCopyValueWithContainer();
  v14 = v13;
  if (v13)
  {
    [v13 doubleValue];
    double v16 = v15;
  }
  else
  {
    double v16 = 259200.0;
  }

  [(PLBatteryUIResponseTypeRecentUsageInsight *)self setMinTimeValBeforeUpgrade:v16];
  +[PLUtilities containerPath];
  v17 = (void *)_CFPreferencesCopyValueWithContainer();
  v18 = v17;
  if (v17)
  {
    [v17 doubleValue];
    double v20 = v19;
  }
  else
  {
    double v20 = 864000.0;
  }

  [(PLBatteryUIResponseTypeRecentUsageInsight *)self setMaxTimeValAfterUpgrade:v20];
  +[PLUtilities containerPath];
  v21 = (void *)_CFPreferencesCopyValueWithContainer();
  v22 = v21;
  if (v21)
  {
    [v21 doubleValue];
    double v24 = v23;
  }
  else
  {
    double v24 = 86400.0;
  }

  [(PLBatteryUIResponseTypeRecentUsageInsight *)self setMinTimeValAfterUpgrade:v24];
  +[PLUtilities containerPath];
  v25 = (void *)_CFPreferencesCopyValueWithContainer();
  v26 = v25;
  if (v25)
  {
    [v25 doubleValue];
    double v28 = v27;
  }
  else
  {
    double v28 = 0.3;
  }

  [(PLBatteryUIResponseTypeRecentUsageInsight *)self setMinDrainPercentBeforeUpgrade:v28];
  +[PLUtilities containerPath];
  v29 = (void *)_CFPreferencesCopyValueWithContainer();
  v30 = v29;
  double v31 = 1.3;
  double v32 = 1.3;
  if (v29)
  {
    [v29 doubleValue];
    double v32 = v33;
  }

  [(PLBatteryUIResponseTypeRecentUsageInsight *)self setEnergyThresholdForUpgradeInsight:v32];
  +[PLUtilities containerPath];
  v34 = (void *)_CFPreferencesCopyValueWithContainer();
  v35 = v34;
  if (v34)
  {
    [v34 doubleValue];
    double v31 = v36;
  }

  [(PLBatteryUIResponseTypeRecentUsageInsight *)self setForegroundTimeThresholdForUpgradeInsight:v31];
}

- (void)run
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Recent Usage Insight: Upgrade found in bucket %d", (uint8_t *)v2, 8u);
}

- (id)result
{
  [(PLBatteryUIResponseTypeRecentUsageInsight *)self setBatteryBreakdown_Last10Days:0];
  if (![(PLBatteryUIResponseTypeRecentUsageInsight *)self suggest]) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  ADClientSetValueForScalarKey();
  uint64_t v3 = objc_opt_new();
  [v3 setObject:@"insight" forKeyedSubscript:@"category"];
  [v3 setObject:@"upgradeUsage" forKeyedSubscript:@"type"];
  double v6 = v3;
  id v4 = v3;
  AnalyticsSendEventLazy();

  return &unk_1F4011950;
}

id __51__PLBatteryUIResponseTypeRecentUsageInsight_result__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)didUpgrade
{
  uint64_t v3 = [(PLBatteryUIResponseTypeRecentUsageInsight *)self end];
  [v3 timeIntervalSince1970];
  double v5 = v4;
  [(PLBatteryUIResponseTypeRecentUsageInsight *)self lastUpgradeTimestamp];
  double v7 = v6;

  [(PLBatteryUIResponseTypeRecentUsageInsight *)self lastUpgradeTimestamp];
  if (v8 == 0.0)
  {
    v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeRecentUsageInsight didUpgrade]();
    }
  }
  else
  {
    double v10 = v5 - v7;
    [(PLBatteryUIResponseTypeRecentUsageInsight *)self minTimeValAfterUpgrade];
    if (v10 <= v11
      || ([(PLBatteryUIResponseTypeRecentUsageInsight *)self maxTimeValAfterUpgrade], v10 >= v12))
    {
      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypeRecentUsageInsight didUpgrade]();
      }
    }
    else
    {
      [(PLBatteryUIResponseTypeRecentUsageInsight *)self lastUpgradeTimestamp];
      double v14 = v13;
      [(PLBatteryUIResponseTypeRecentUsageInsight *)self firstEntryTimestamp];
      double v16 = v14 - v15;
      [(PLBatteryUIResponseTypeRecentUsageInsight *)self minTimeValBeforeUpgrade];
      if (v16 > v17) {
        return 1;
      }
      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypeRecentUsageInsight didUpgrade]();
      }
    }
  }

  return 0;
}

- (double)getfirstEntryTimestampFromDb
{
  uint64_t v3 = *MEMORY[0x1E4F92D20];
  double v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AppRunTime"];
  double v5 = [MEMORY[0x1E4F92968] entryKeyForType:v3 andName:*MEMORY[0x1E4F92B48]];
  double v6 = [MEMORY[0x1E4F92968] entryKeyForType:v3 andName:*MEMORY[0x1E4F92B20]];
  double v7 = [(PLBatteryUIResponseTypeRecentUsageInsight *)self responderService];
  double v8 = [v7 storage];
  v9 = [v8 entryForKey:v4 withID:1];

  double v10 = [(PLBatteryUIResponseTypeRecentUsageInsight *)self responderService];
  double v11 = [v10 storage];
  double v12 = [v11 entryForKey:v5 withID:1];

  double v13 = [(PLBatteryUIResponseTypeRecentUsageInsight *)self responderService];
  double v14 = [v13 storage];
  double v15 = [v14 entryForKey:v6 withID:1];

  double v16 = 9.22337204e18;
  if (v9 && v12 && v15)
  {
    double v17 = [v9 objectForKeyedSubscript:@"timestamp"];
    [v17 doubleValue];
    double v19 = v18;
    double v20 = [v12 objectForKeyedSubscript:@"timestamp"];
    [v20 doubleValue];
    double v22 = fmax(v19, v21);
    double v23 = [v15 objectForKeyedSubscript:@"timestamp"];
    [v23 doubleValue];
    double v16 = fmax(v22, v24);
  }
  return v16;
}

- (BOOL)shouldShowSuggestionThroughOverrides
{
  BOOL v2 = +[PLUtilities inBUIDemoMode];
  if (v2)
  {
    uint64_t v3 = +[PLUtilities powerlogDefaultForKey:@"BUI_RECENTUSAGE_SUGGESTION_SHOW"];
    char v4 = [v3 BOOLValue];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResponderService:(id)a3
{
}

- (BOOL)suggest
{
  return self->_suggest;
}

- (void)setSuggest:(BOOL)a3
{
  self->_suggest = a3;
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
}

- (double)firstEntryTimestamp
{
  return self->_firstEntryTimestamp;
}

- (void)setFirstEntryTimestamp:(double)a3
{
  self->_firstEntryTimestamp = a3;
}

- (double)lastUpgradeTimestamp
{
  return self->_lastUpgradeTimestamp;
}

- (void)setLastUpgradeTimestamp:(double)a3
{
  self->_lastUpgradeTimestamp = a3;
}

- (double)minTimeValBeforeUpgrade
{
  return self->_minTimeValBeforeUpgrade;
}

- (void)setMinTimeValBeforeUpgrade:(double)a3
{
  self->_minTimeValBeforeUpgrade = a3;
}

- (double)maxTimeValBeforeUpgrade
{
  return self->_maxTimeValBeforeUpgrade;
}

- (void)setMaxTimeValBeforeUpgrade:(double)a3
{
  self->_maxTimeValBeforeUpgrade = a3;
}

- (double)minTimeValAfterUpgrade
{
  return self->_minTimeValAfterUpgrade;
}

- (void)setMinTimeValAfterUpgrade:(double)a3
{
  self->_minTimeValAfterUpgrade = a3;
}

- (double)maxTimeValAfterUpgrade
{
  return self->_maxTimeValAfterUpgrade;
}

- (void)setMaxTimeValAfterUpgrade:(double)a3
{
  self->_maxTimeValAfterUpgrade = a3;
}

- (double)minDrainPercentBeforeUpgrade
{
  return self->_minDrainPercentBeforeUpgrade;
}

- (void)setMinDrainPercentBeforeUpgrade:(double)a3
{
  self->_minDrainPercentBeforeUpgrade = a3;
}

- (double)energyThresholdForUpgradeInsight
{
  return self->_energyThresholdForUpgradeInsight;
}

- (void)setEnergyThresholdForUpgradeInsight:(double)a3
{
  self->_energyThresholdForUpgradeInsight = a3;
}

- (double)foregroundTimeThresholdForUpgradeInsight
{
  return self->_foregroundTimeThresholdForUpgradeInsight;
}

- (void)setForegroundTimeThresholdForUpgradeInsight:(double)a3
{
  self->_foregroundTimeThresholdForUpgradeInsight = a3;
}

- (NSMutableArray)batteryBreakdown_Last10Days
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBatteryBreakdown_Last10Days:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_Last10Days, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)didUpgrade
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Recent Usage Insight: After upgrade time criteria not satisfied", v2, v3, v4, v5, v6);
}

@end