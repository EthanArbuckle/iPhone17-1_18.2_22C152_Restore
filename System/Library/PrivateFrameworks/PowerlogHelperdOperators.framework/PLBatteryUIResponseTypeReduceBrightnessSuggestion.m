@interface PLBatteryUIResponseTypeReduceBrightnessSuggestion
- (BOOL)isALSCurveHigherThanDefault;
- (BOOL)shouldShowSuggestionThroughOverrides;
- (BOOL)suggest;
- (NSDictionary)batteryBreakdown_Last24hrs;
- (PLBatteryUIResponderService)responderService;
- (double)energyPercent;
- (id)dependencies;
- (id)result;
- (void)configure:(id)a3;
- (void)run;
- (void)setBatteryBreakdown_Last24hrs:(id)a3;
- (void)setEnergyPercent:(double)a3;
- (void)setIsALSCurveHigherThanDefault:(BOOL)a3;
- (void)setResponderService:(id)a3;
- (void)setSuggest:(BOOL)a3;
@end

@implementation PLBatteryUIResponseTypeReduceBrightnessSuggestion

- (id)dependencies
{
  return &unk_1F4013318;
}

- (void)configure:(id)a3
{
  BOOL v4 = +[PLUtilities isALSCurveHigherThanDefault];
  [(PLBatteryUIResponseTypeReduceBrightnessSuggestion *)self setIsALSCurveHigherThanDefault:v4];
}

- (void)run
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Reduce Brightness Suggestion: ALS Curve is not higher than default", v1, 2u);
}

- (id)result
{
  v12[2] = *MEMORY[0x1E4F143B8];
  [(PLBatteryUIResponseTypeReduceBrightnessSuggestion *)self setBatteryBreakdown_Last24hrs:0];
  if ([(PLBatteryUIResponseTypeReduceBrightnessSuggestion *)self suggest])
  {
    ADClientSetValueForScalarKey();
    v3 = objc_opt_new();
    [v3 setObject:@"suggestion" forKeyedSubscript:@"category"];
    [v3 setObject:@"reduceBrightness" forKeyedSubscript:@"type"];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    v10 = v3;
    id v4 = v3;
    AnalyticsSendEventLazy();
    v11[0] = @"PLBatteryUISuggestionTypeKey";
    v11[1] = @"PLBatteryUISuggestionEnergyPercentKey";
    v12[0] = &unk_1F400CB50;
    v5 = (void *)MEMORY[0x1E4F28ED0];
    [(PLBatteryUIResponseTypeReduceBrightnessSuggestion *)self energyPercent];
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

id __59__PLBatteryUIResponseTypeReduceBrightnessSuggestion_result__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)shouldShowSuggestionThroughOverrides
{
  BOOL v2 = +[PLUtilities inBUIDemoMode];
  if (v2)
  {
    v3 = +[PLUtilities powerlogDefaultForKey:@"BUI_REDUCEBRIGHTNESS_SUGGESTION_SHOW"];
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

- (BOOL)isALSCurveHigherThanDefault
{
  return self->_isALSCurveHigherThanDefault;
}

- (void)setIsALSCurveHigherThanDefault:(BOOL)a3
{
  self->_isALSCurveHigherThanDefault = a3;
}

- (NSDictionary)batteryBreakdown_Last24hrs
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryBreakdown_Last24hrs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_Last24hrs, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end