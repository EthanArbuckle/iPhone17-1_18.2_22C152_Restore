@interface FCChannelUpsellConfig
- (FCChannelUpsellConfig)initWithChannelID:(id)a3 configDictionary:(id)a4;
- (FCEmailSignupConfig)emailSignupConfiguration;
- (FCHideMyEmailSignupConfig)hideMyEmailSignupConfiguration;
- (FCSIWAPurchaseConfig)siwaPurchaseConfiguration;
- (NSDictionary)triggersByMethod;
- (NSString)channelID;
- (int64_t)engagedUserQuiescenceInterval;
- (int64_t)presentationCap;
- (int64_t)presentationCountResetInterval;
- (int64_t)quiescenceInterval;
- (void)setChannelID:(id)a3;
- (void)setEmailSignupConfiguration:(id)a3;
- (void)setEngagedUserQuiescenceInterval:(int64_t)a3;
- (void)setHideMyEmailSignupConfiguration:(id)a3;
- (void)setPresentationCap:(int64_t)a3;
- (void)setPresentationCountResetInterval:(int64_t)a3;
- (void)setQuiescenceInterval:(int64_t)a3;
- (void)setSiwaPurchaseConfiguration:(id)a3;
- (void)setTriggersByMethod:(id)a3;
@end

@implementation FCChannelUpsellConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideMyEmailSignupConfiguration, 0);
  objc_storeStrong((id *)&self->_siwaPurchaseConfiguration, 0);
  objc_storeStrong((id *)&self->_emailSignupConfiguration, 0);
  objc_storeStrong((id *)&self->_triggersByMethod, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

- (FCChannelUpsellConfig)initWithChannelID:(id)a3 configDictionary:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)FCChannelUpsellConfig;
  v9 = [(FCChannelUpsellConfig *)&v38 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_channelID, a3);
    v33 = v8;
    v11 = FCAppConfigurationArrayValueWithDefaultValue(v8, @"triggers", 0);
    v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [[FCChannelUpsellTrigger alloc] initWithConfigDictionary:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCChannelUpsellTrigger triggerMethod](v18, "triggerMethod"));
          [v12 setObject:v18 forKeyedSubscript:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v15);
    }

    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v12];
    triggersByMethod = v10->_triggersByMethod;
    v10->_triggersByMethod = (NSDictionary *)v20;

    id v8 = v33;
    v10->_presentationCap = FCAppConfigurationIntegerValue(v33, @"presentationCap", 1);
    v10->_presentationCountResetInterval = FCAppConfigurationIntegerValue(v33, @"presentationCountResetInterval", 0);
    v10->_quiescenceInterval = FCAppConfigurationIntegerValue(v33, @"quiescenceInterval", 0);
    v10->_engagedUserQuiescenceInterval = FCAppConfigurationIntegerValue(v33, @"engagedUserQuiescenceInterval", 0);
    v22 = [FCEmailSignupConfig alloc];
    v23 = FCAppConfigurationDictionaryValueWithDefaultValue(v33, @"emailSignupConfiguration", 0);
    uint64_t v24 = [(FCEmailSignupConfig *)v22 initWithConfigDictionary:v23];
    emailSignupConfiguration = v10->_emailSignupConfiguration;
    v10->_emailSignupConfiguration = (FCEmailSignupConfig *)v24;

    v26 = FCAppConfigurationDictionaryValueWithDefaultValue(v33, @"hideMyEmailSignupConfiguration", 0);
    if (v26)
    {
      v27 = [[FCHideMyEmailSignupConfig alloc] initWithConfigDictionary:v26];
      hideMyEmailSignupConfiguration = v10->_hideMyEmailSignupConfiguration;
      v10->_hideMyEmailSignupConfiguration = v27;
    }
    v29 = FCAppConfigurationDictionaryValueWithDefaultValue(v33, @"siwaPurchaseConfiguration", 0);
    if (v29)
    {
      v30 = [[FCSIWAPurchaseConfig alloc] initWithConfigDictionary:v29];
      siwaPurchaseConfiguration = v10->_siwaPurchaseConfiguration;
      v10->_siwaPurchaseConfiguration = v30;
    }
  }

  return v10;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
}

- (NSDictionary)triggersByMethod
{
  return self->_triggersByMethod;
}

- (void)setTriggersByMethod:(id)a3
{
}

- (int64_t)presentationCap
{
  return self->_presentationCap;
}

- (void)setPresentationCap:(int64_t)a3
{
  self->_presentationCap = a3;
}

- (int64_t)presentationCountResetInterval
{
  return self->_presentationCountResetInterval;
}

- (void)setPresentationCountResetInterval:(int64_t)a3
{
  self->_presentationCountResetInterval = a3;
}

- (int64_t)quiescenceInterval
{
  return self->_quiescenceInterval;
}

- (void)setQuiescenceInterval:(int64_t)a3
{
  self->_quiescenceInterval = a3;
}

- (int64_t)engagedUserQuiescenceInterval
{
  return self->_engagedUserQuiescenceInterval;
}

- (void)setEngagedUserQuiescenceInterval:(int64_t)a3
{
  self->_engagedUserQuiescenceInterval = a3;
}

- (FCEmailSignupConfig)emailSignupConfiguration
{
  return self->_emailSignupConfiguration;
}

- (void)setEmailSignupConfiguration:(id)a3
{
}

- (FCSIWAPurchaseConfig)siwaPurchaseConfiguration
{
  return self->_siwaPurchaseConfiguration;
}

- (void)setSiwaPurchaseConfiguration:(id)a3
{
}

- (FCHideMyEmailSignupConfig)hideMyEmailSignupConfiguration
{
  return self->_hideMyEmailSignupConfiguration;
}

- (void)setHideMyEmailSignupConfiguration:(id)a3
{
}

@end