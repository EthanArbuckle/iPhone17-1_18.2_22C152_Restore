@interface PLBatteryUIResponseTypeOngoingUpgradeInsight
- (BOOL)didUpgrade;
- (BOOL)didUpgradeInLast:(double)a3;
- (BOOL)shouldShowSuggestionThroughOverrides;
- (BOOL)suggest;
- (NSDate)end;
- (NSDictionary)batteryBreakdown_Last24hrs;
- (PLBatteryUIResponderService)responderService;
- (double)lastUpgradeTimestamp;
- (id)dependencies;
- (id)result;
- (void)configure:(id)a3;
- (void)didUpgrade;
- (void)run;
- (void)setBatteryBreakdown_Last24hrs:(id)a3;
- (void)setEnd:(id)a3;
- (void)setLastUpgradeTimestamp:(double)a3;
- (void)setResponderService:(id)a3;
- (void)setSuggest:(BOOL)a3;
@end

@implementation PLBatteryUIResponseTypeOngoingUpgradeInsight

- (id)dependencies
{
  return &unk_1F4014F98;
}

- (void)configure:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"end"];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v6];
  [(PLBatteryUIResponseTypeOngoingUpgradeInsight *)self setEnd:v7];

  id v8 = [MEMORY[0x1E4F929C0] objectForKey:@"LastUpgradeTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  [v8 doubleValue];
  -[PLBatteryUIResponseTypeOngoingUpgradeInsight setLastUpgradeTimestamp:](self, "setLastUpgradeTimestamp:");
}

- (void)run
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "OngoingUpgradeInsight: Restore occured more than a week ago", v1, 2u);
}

void __51__PLBatteryUIResponseTypeOngoingUpgradeInsight_run__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  int v8 = [v7 isEqualToString:@"DeviceSetup"];

  if (v8)
  {
    v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __51__PLBatteryUIResponseTypeOngoingUpgradeInsight_run__block_invoke_cold_1(v9);
    }

    v10 = [v6 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
    [v10 floatValue];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11 >= 1.0;

    *a4 = 1;
  }
}

- (id)result
{
  if (![(PLBatteryUIResponseTypeOngoingUpgradeInsight *)self suggest]) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  ADClientSetValueForScalarKey();
  v3 = objc_opt_new();
  [v3 setObject:@"insight" forKeyedSubscript:@"category"];
  [v3 setObject:@"ongoingUpgrade" forKeyedSubscript:@"type"];
  v9 = v3;
  id v4 = v3;
  AnalyticsSendEventLazy();
  double v5 = (void *)MEMORY[0x1E4F1C9C8];
  [(PLBatteryUIResponseTypeOngoingUpgradeInsight *)self lastUpgradeTimestamp];
  id v6 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:v6];

  AnalyticsSendEventLazy();
  return &unk_1F4011900;
}

id __54__PLBatteryUIResponseTypeOngoingUpgradeInsight_result__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __54__PLBatteryUIResponseTypeOngoingUpgradeInsight_result__block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"duration";
  v1 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (BOOL)shouldShowSuggestionThroughOverrides
{
  BOOL v2 = +[PLUtilities inBUIDemoMode];
  if (v2)
  {
    v3 = +[PLUtilities powerlogDefaultForKey:@"BUI_ONGOINGUPGRADE_SUGGESTION_SHOW"];
    char v4 = [v3 BOOLValue];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)didUpgradeInLast:(double)a3
{
  double v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v5 timeIntervalSince1970];
  double v7 = v6;
  [(PLBatteryUIResponseTypeOngoingUpgradeInsight *)self lastUpgradeTimestamp];
  double v9 = v7 - v8;

  v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeOngoingUpgradeInsight didUpgradeInLast:](v10, v9);
  }

  return v9 <= a3;
}

- (BOOL)didUpgrade
{
  BOOL v2 = [(PLBatteryUIResponseTypeOngoingUpgradeInsight *)self responderService];
  v3 = [v2 storage];
  char v4 = [NSString stringWithFormat:@"SELECT DISTINCT Build FROM PLConfigAgent_EventNone_Config"];
  double v5 = [v3 entriesForKey:@"PLConfigAgent_EventNone_Config" withQuery:v4];

  double v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(PLBatteryUIResponseTypeOngoingUpgradeInsight *)v5 didUpgrade];
  }

  BOOL v7 = (unint64_t)[v5 count] > 1;
  return v7;
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

- (double)lastUpgradeTimestamp
{
  return self->_lastUpgradeTimestamp;
}

- (void)setLastUpgradeTimestamp:(double)a3
{
  self->_lastUpgradeTimestamp = a3;
}

- (NSDictionary)batteryBreakdown_Last24hrs
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBatteryBreakdown_Last24hrs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_Last24hrs, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

void __51__PLBatteryUIResponseTypeOngoingUpgradeInsight_run__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "OngoingUpgradeInsight: DeviceSetup entity in the breakdown", v1, 2u);
}

- (void)didUpgradeInLast:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "OngoingUpgradeInsight: Seconds since last upgrade:%f", (uint8_t *)&v2, 0xCu);
}

- (void)didUpgrade
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "OngoingUpgradeInsight: Build count:%lu", (uint8_t *)&v3, 0xCu);
}

@end