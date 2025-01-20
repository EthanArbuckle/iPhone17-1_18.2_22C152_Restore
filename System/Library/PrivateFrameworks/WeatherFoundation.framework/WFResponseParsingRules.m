@interface WFResponseParsingRules
+ (BOOL)aqiEnabledByRules:(id)a3 forLocation:(id)a4;
- (BOOL)aqiEnabledForCountryCode:(id)a3;
- (WFResponseParsingRules)initWithSettings:(id)a3;
- (WFSettings)settings;
@end

@implementation WFResponseParsingRules

+ (BOOL)aqiEnabledByRules:(id)a3 forLocation:(id)a4
{
  if (!a3) {
    return 1;
  }
  id v5 = a3;
  v6 = [a4 countryAbbreviation];
  char v7 = [v5 aqiEnabledForCountryCode:v6];

  return v7;
}

- (WFResponseParsingRules)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFResponseParsingRules;
  v6 = [(WFResponseParsingRules *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (BOOL)aqiEnabledForCountryCode:(id)a3
{
  id v4 = a3;
  id v5 = [(WFResponseParsingRules *)self settings];
  v6 = [v5 aqiEnabledCountryCodes];

  if (v6)
  {
    char v7 = [v6 allObjects];
  }
  else
  {
    char v7 = &unk_26CD65330;
  }
  char v8 = [v7 containsObject:v4];

  return v8;
}

- (WFSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end