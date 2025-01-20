@interface PLBatteryUIResponseTypeAutoBrightnessSuggestion
- (BOOL)hasALSPowerSaved;
- (BOOL)isALSEnabled;
- (BOOL)shouldShowSuggestionThroughOverrides;
- (BOOL)suggest;
- (NSArray)alsPowerSavedEntries;
- (PLBatteryUIResponderService)responderService;
- (double)energyPercent;
- (id)dependencies;
- (id)result;
- (void)configure:(id)a3;
- (void)run;
- (void)setAlsPowerSavedEntries:(id)a3;
- (void)setEnergyPercent:(double)a3;
- (void)setHasALSPowerSaved:(BOOL)a3;
- (void)setIsALSEnabled:(BOOL)a3;
- (void)setResponderService:(id)a3;
- (void)setSuggest:(BOOL)a3;
@end

@implementation PLBatteryUIResponseTypeAutoBrightnessSuggestion

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  id v8 = [MEMORY[0x1E4F929C0] objectForKey:@"BKEnableALS" forApplicationID:@"com.apple.backboardd" synchronize:1];
  [(PLBatteryUIResponseTypeAutoBrightnessSuggestion *)self setHasALSPowerSaved:+[PLDisplayAgent shouldLogALSPowerSaved]];
  -[PLBatteryUIResponseTypeAutoBrightnessSuggestion setIsALSEnabled:](self, "setIsALSEnabled:", [v8 BOOLValue]);
  v4 = [(PLBatteryUIResponseTypeAutoBrightnessSuggestion *)self responderService];
  v5 = [v4 storage];
  v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ALSPowerSaved"];
  v7 = [v5 entriesForKey:v6];
  [(PLBatteryUIResponseTypeAutoBrightnessSuggestion *)self setAlsPowerSavedEntries:v7];
}

- (void)run
{
}

- (id)result
{
  v12[2] = *MEMORY[0x1E4F143B8];
  [(PLBatteryUIResponseTypeAutoBrightnessSuggestion *)self setAlsPowerSavedEntries:0];
  if ([(PLBatteryUIResponseTypeAutoBrightnessSuggestion *)self suggest])
  {
    ADClientSetValueForScalarKey();
    v3 = objc_opt_new();
    [v3 setObject:@"suggestion" forKeyedSubscript:@"category"];
    [v3 setObject:@"autoBrightness" forKeyedSubscript:@"type"];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    v10 = v3;
    id v4 = v3;
    AnalyticsSendEventLazy();
    v11[0] = @"PLBatteryUISuggestionTypeKey";
    v11[1] = @"PLBatteryUISuggestionEnergyPercentKey";
    v12[0] = &unk_1F400C178;
    v5 = (void *)MEMORY[0x1E4F28ED0];
    [(PLBatteryUIResponseTypeAutoBrightnessSuggestion *)self energyPercent];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    v12[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

id __57__PLBatteryUIResponseTypeAutoBrightnessSuggestion_result__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)shouldShowSuggestionThroughOverrides
{
  BOOL v2 = +[PLUtilities inBUIDemoMode];
  if (v2)
  {
    v3 = +[PLUtilities powerlogDefaultForKey:@"BUI_AUTOBRIGHTNESS_SUGGESTION_SHOW"];
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

- (double)energyPercent
{
  return self->_energyPercent;
}

- (void)setEnergyPercent:(double)a3
{
  self->_energyPercent = a3;
}

- (BOOL)isALSEnabled
{
  return self->_isALSEnabled;
}

- (void)setIsALSEnabled:(BOOL)a3
{
  self->_isALSEnabled = a3;
}

- (BOOL)hasALSPowerSaved
{
  return self->_hasALSPowerSaved;
}

- (void)setHasALSPowerSaved:(BOOL)a3
{
  self->_hasALSPowerSaved = a3;
}

- (NSArray)alsPowerSavedEntries
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAlsPowerSavedEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alsPowerSavedEntries, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end