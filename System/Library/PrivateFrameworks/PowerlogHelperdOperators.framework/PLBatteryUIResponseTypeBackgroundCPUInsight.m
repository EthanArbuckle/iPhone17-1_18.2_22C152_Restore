@interface PLBatteryUIResponseTypeBackgroundCPUInsight
- (BOOL)suggest;
- (NSMutableArray)batteryBreakdown_Last10Days;
- (NSMutableDictionary)perAppUsage;
- (PLBatteryUIResponderService)responderService;
- (id)dependencies;
- (id)result;
- (void)run;
- (void)setBatteryBreakdown_Last10Days:(id)a3;
- (void)setPerAppUsage:(id)a3;
- (void)setResponderService:(id)a3;
- (void)setSuggest:(BOOL)a3;
@end

@implementation PLBatteryUIResponseTypeBackgroundCPUInsight

- (id)dependencies
{
  return &unk_1F4014290;
}

- (void)run
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Background CPU Insight: Successfully retrieved 10 day breakdown from cache", v1, 2u);
}

- (id)result
{
  v7[2] = *MEMORY[0x1E4F143B8];
  [(PLBatteryUIResponseTypeBackgroundCPUInsight *)self setBatteryBreakdown_Last10Days:0];
  if ([(PLBatteryUIResponseTypeBackgroundCPUInsight *)self suggest])
  {
    v6[0] = @"PLBatteryUISuggestionTypeKey";
    v6[1] = @"PLBatteryUIPerAppUsageKey";
    v7[0] = &unk_1F400DA08;
    v3 = [(PLBatteryUIResponseTypeBackgroundCPUInsight *)self perAppUsage];
    v7[1] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
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

- (NSMutableDictionary)perAppUsage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPerAppUsage:(id)a3
{
}

- (NSMutableArray)batteryBreakdown_Last10Days
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryBreakdown_Last10Days:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_Last10Days, 0);
  objc_storeStrong((id *)&self->_perAppUsage, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end