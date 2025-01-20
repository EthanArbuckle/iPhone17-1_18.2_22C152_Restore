@interface FCNewsPlusLabelConfig
- (BOOL)enabled;
- (FCNewsPlusLabelConfig)initWithConfigDictionary:(id)a3;
- (NSString)toolTipAlternativeBodyForVoiceOver;
- (NSString)toolTipBody;
- (NSString)toolTipTitle;
- (int)toolTipDisplayMaxCount;
- (int64_t)toolTipDisplayQuiescenceInterval;
@end

@implementation FCNewsPlusLabelConfig

- (FCNewsPlusLabelConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCNewsPlusLabelConfig;
  v5 = [(FCNewsPlusLabelConfig *)&v19 init];
  if (v5)
  {
    v5->_enabled = FCAppConfigurationBoolValue(v4, @"enabled", 0);
    v5->_toolTipDisplayQuiescenceInterval = FCAppConfigurationIntegerValue(v4, @"toolTipDisplayQuiescenceInterval", 86400);
    v5->_toolTipDisplayMaxCount = FCAppConfigurationIntegerValue(v4, @"toolTipDisplayMaxCount", 0);
    v6 = FCBundle();
    v7 = [v6 localizedStringForKey:@"Welcome to News+" value:&stru_1EF8299B8 table:0];
    uint64_t v8 = FCAppConfigurationStringValue(v4, @"toolTipTitle", v7);
    toolTipTitle = v5->_toolTipTitle;
    v5->_toolTipTitle = (NSString *)v8;

    v10 = FCBundle();
    v11 = [v10 localizedStringForKey:@"Stories with this badge are part of your subscription." value:&stru_1EF8299B8 table:0];
    uint64_t v12 = FCAppConfigurationStringValue(v4, @"toolTipBody", v11);
    toolTipBody = v5->_toolTipBody;
    v5->_toolTipBody = (NSString *)v12;

    v14 = FCBundle();
    v15 = [v14 localizedStringForKey:@"Stories with an Apple News+ badge are part of your subscription." value:&stru_1EF8299B8 table:0];
    uint64_t v16 = FCAppConfigurationStringValue(v4, @"toolTipAlternativeBodyForVoiceOver", v15);
    toolTipAlternativeBodyForVoiceOver = v5->_toolTipAlternativeBodyForVoiceOver;
    v5->_toolTipAlternativeBodyForVoiceOver = (NSString *)v16;
  }
  return v5;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)toolTipDisplayQuiescenceInterval
{
  return self->_toolTipDisplayQuiescenceInterval;
}

- (int)toolTipDisplayMaxCount
{
  return self->_toolTipDisplayMaxCount;
}

- (NSString)toolTipTitle
{
  return self->_toolTipTitle;
}

- (NSString)toolTipBody
{
  return self->_toolTipBody;
}

- (NSString)toolTipAlternativeBodyForVoiceOver
{
  return self->_toolTipAlternativeBodyForVoiceOver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolTipAlternativeBodyForVoiceOver, 0);
  objc_storeStrong((id *)&self->_toolTipBody, 0);
  objc_storeStrong((id *)&self->_toolTipTitle, 0);
}

@end