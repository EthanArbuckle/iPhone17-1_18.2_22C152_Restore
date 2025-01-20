@interface PLBatteryUIResponseTypeNoteworthyInformation
- (BOOL)getBUIVisitDefaultValue;
- (BOOL)hasNoterworthyInformationThroughOverrides;
- (BOOL)hasNoteworthyInformation;
- (BOOL)hasRelevantSuggestion;
- (PLBatteryUIResponderService)responderService;
- (double)getDailyPercentDrainThresholdValue;
- (id)dependencies;
- (id)getResultFromCacheForSuggestionResponseType:(int64_t)a3;
- (id)getResultFromCacheForUISOCDrainResponseType;
- (id)result;
- (unint64_t)getNumDaysAboveDrainThreshold:(double)a3;
- (unint64_t)getNumDaysAboveDrainThresholdValue;
- (unint64_t)getNumDaysBelowUISOCLevel:(double)a3 forLastNDays:(unint64_t)a4;
- (unint64_t)getNumDaysBelowUISOCLevelThresholdValue;
- (unint64_t)getUISOCLevelPercentThresholdValue;
- (void)getBUIVisitDefaultValue;
- (void)run;
- (void)setHasNoteworthyInformation:(BOOL)a3;
- (void)setResponderService:(id)a3;
@end

@implementation PLBatteryUIResponseTypeNoteworthyInformation

- (id)dependencies
{
  return &unk_1F40132E8;
}

- (void)run
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(PLBatteryUIResponseTypeNoteworthyInformation *)self hasNoterworthyInformationThroughOverrides])
  {
    [(PLBatteryUIResponseTypeNoteworthyInformation *)self setHasNoteworthyInformation:1];
  }
  else
  {
    double v3 = (double)[(PLBatteryUIResponseTypeNoteworthyInformation *)self getUISOCLevelPercentThresholdValue];
    unint64_t v4 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self getNumDaysBelowUISOCLevelThresholdValue];
    unint64_t v5 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self getNumDaysBelowUISOCLevel:7 forLastNDays:v3];
    BOOL v6 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self hasRelevantSuggestion];
    BOOL v7 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self getBUIVisitDefaultValue];
    v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 134219008;
      double v11 = v3;
      __int16 v12 = 2048;
      unint64_t v13 = v4;
      __int16 v14 = 2048;
      unint64_t v15 = v5;
      __int16 v16 = 1024;
      BOOL v17 = v6;
      __int16 v18 = 1024;
      BOOL v19 = v7;
      _os_log_debug_impl(&dword_1E4220000, v8, OS_LOG_TYPE_DEBUG, "UISOCLevelPercentThresholdValue=%f, numDaysBelowUISOCLevelThresholdValue=%zu, numDaysBelowUISOCLevel=%zu, doesHaveRelevantSuggestion=%d, userHasVisitedBUI=%d", (uint8_t *)&v10, 0x2Cu);
    }

    BOOL v9 = v5 >= v4 && v6 && !v7;
    [(PLBatteryUIResponseTypeNoteworthyInformation *)self setHasNoteworthyInformation:v9];
  }
}

- (id)result
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  AnalyticsSendEventLazy();
  double v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PLBatteryUIResponseTypeNoteworthyInformation hasNoteworthyInformation](self, "hasNoteworthyInformation", v6, 3221225472, __54__PLBatteryUIResponseTypeNoteworthyInformation_result__block_invoke, &unk_1E6E479C8, self, @"hasNoteworthyInformation"));
  v9[0] = v3;
  unint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v4;
}

id __54__PLBatteryUIResponseTypeNoteworthyInformation_result__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = @"result";
  v1 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "hasNoteworthyInformation"));
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (unint64_t)getNumDaysAboveDrainThreshold:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self getResultFromCacheForUISOCDrainResponseType];
  unint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeNoteworthyInformation getNumDaysAboveDrainThreshold:]((uint64_t)v4, v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "objectForKeyedSubscript:", @"PLBatteryUIEnergyKey", (void)v17);
        [v12 doubleValue];
        double v14 = v13;

        if (v14 > a3) {
          ++v9;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
    unint64_t v15 = v9;
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (unint64_t)getNumDaysBelowUISOCLevel:(double)a3 forLastNDays:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT datetime(timestamp, 'unixepoch', 'localtime', 'start of day'), COUNT(*) FROM PLBatteryAgent_EventBackward_BatteryUI WHERE level <= %f AND timestamp >((SELECT MAX(timestamp) FROM PLBatteryAgent_EventBackward_Battery)-%zu*86400) GROUP BY datetime(timestamp, 'unixepoch', 'localtime', 'start of day');",
    *(void *)&a3,
  unint64_t v4 = a4);
  unint64_t v5 = [MEMORY[0x1E4F92A40] sharedSQLiteConnection];
  id v6 = [v5 performQuery:v4];

  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v11 = v6;
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_DEFAULT, "queryResult=%@", buf, 0xCu);
  }

  unint64_t v8 = [v6 count];
  return v8;
}

- (BOOL)hasRelevantSuggestion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self getResultFromCacheForSuggestionResponseType:13];
  unint64_t v4 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self getResultFromCacheForSuggestionResponseType:14];
  unint64_t v5 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self getResultFromCacheForSuggestionResponseType:15];
  id v6 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self getResultFromCacheForSuggestionResponseType:17];
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    double v13 = v3;
    __int16 v14 = 2112;
    unint64_t v15 = v4;
    __int16 v16 = 2112;
    long long v17 = v5;
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_DEFAULT, "resultAutolockSuggestion=%@, resultAutoBrightnessSuggestion=%@, resultReduceBrightnessSuggestion=%@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t v8 = [v3 count];
  uint64_t v9 = [v4 count] + v8;
  uint64_t v10 = v9 + [v5 count];
  LOBYTE(v10) = v10 + [v6 count] != 0;

  return v10;
}

- (id)getResultFromCacheForUISOCDrainResponseType
{
  double v3 = PLBatteryUsageUIKeyFromConfiguration();
  unint64_t v4 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self responderService];
  unint64_t v5 = [v4 responseCache];
  id v6 = [v5 objectForKeyedSubscript:&unk_1F400C8F8];
  uint64_t v7 = [v6 objectForKeyedSubscript:v3];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"result"];

  return v8;
}

- (id)getResultFromCacheForSuggestionResponseType:(int64_t)a3
{
  unint64_t v5 = PLBatteryUsageUIKeyFromConfiguration();
  id v6 = [(PLBatteryUIResponseTypeNoteworthyInformation *)self responderService];
  uint64_t v7 = [v6 responseCache];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 objectForKeyedSubscript:v5];
  double v11 = [v10 objectForKeyedSubscript:@"result"];

  return v11;
}

- (double)getDailyPercentDrainThresholdValue
{
  if (!+[PLUtilities inBUIDemoMode]) {
    return 100.0;
  }
  v2 = +[PLUtilities powerlogDefaultForKey:@"BUI_NOTEWORTHY_INFORMATION_DAILY_PERCENT_DRAIN_THRESHOLD"];
  double v3 = v2;
  if (v2 && ([v2 doubleValue], v4 > 0.0))
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 100.0;
  }

  return v6;
}

- (unint64_t)getNumDaysAboveDrainThresholdValue
{
  if (!+[PLUtilities inBUIDemoMode]) {
    return 7;
  }
  v2 = +[PLUtilities powerlogDefaultForKey:@"BUI_NOTEWORTHY_INFORMATION_NUM_DAYS_ABOVE_DRAIN_THRESHOLD"];
  double v3 = v2;
  if (v2 && [v2 unsignedIntValue]) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 7;
  }

  return v4;
}

- (unint64_t)getUISOCLevelPercentThresholdValue
{
  if (!+[PLUtilities inBUIDemoMode]) {
    return 10;
  }
  v2 = +[PLUtilities powerlogDefaultForKey:@"BUI_NOTEWORTHY_INFORMATION_UISOC_LEVEL_THRESHOLD"];
  double v3 = v2;
  if (v2 && ([v2 doubleValue], v4 > 0.0))
  {
    [v3 doubleValue];
    unint64_t v6 = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = 10;
  }

  return v6;
}

- (unint64_t)getNumDaysBelowUISOCLevelThresholdValue
{
  if (!+[PLUtilities inBUIDemoMode]) {
    return 5;
  }
  v2 = +[PLUtilities powerlogDefaultForKey:@"BUI_NOTEWORTHY_INFORMATION_NUM_DAYS_BELOW_UISOC_LEVEL_THRESHOLD"];
  double v3 = v2;
  if (v2 && [v2 unsignedIntValue]) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 5;
  }

  return v4;
}

- (BOOL)getBUIVisitDefaultValue
{
  v2 = [MEMORY[0x1E4F929C0] objectForKey:@"BUIVisitDefaultKey" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  char v3 = [v2 BOOLValue];

  unint64_t v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(PLBatteryUIResponseTypeNoteworthyInformation *)v3 getBUIVisitDefaultValue];
  }

  return v3;
}

- (BOOL)hasNoterworthyInformationThroughOverrides
{
  BOOL v2 = +[PLUtilities inBUIDemoMode];
  if (v2)
  {
    char v3 = +[PLUtilities powerlogDefaultForKey:@"BUI_HAS_NOTEWORTHY_INFORMATION"];
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

- (BOOL)hasNoteworthyInformation
{
  return self->_hasNoteworthyInformation;
}

- (void)setHasNoteworthyInformation:(BOOL)a3
{
  self->_hasNoteworthyInformation = a3;
}

- (void).cxx_destruct
{
}

- (void)getNumDaysAboveDrainThreshold:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "UISOCDrainResult=%@", (uint8_t *)&v2, 0xCu);
}

- (void)getBUIVisitDefaultValue
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "BUIVisitDefaultValue=%d", (uint8_t *)v2, 8u);
}

@end