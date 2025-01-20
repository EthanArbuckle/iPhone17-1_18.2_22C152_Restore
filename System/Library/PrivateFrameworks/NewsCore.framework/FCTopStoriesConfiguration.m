@interface FCTopStoriesConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isPromotingEnabled;
- (FCTopStoriesConfiguration)initWithConfigDictionary:(id)a3;
- (NSDictionary)styleConfigurations;
- (NSString)channelID;
- (int64_t)storyTypeTimeout;
- (unint64_t)hash;
@end

@implementation FCTopStoriesConfiguration

- (NSDictionary)styleConfigurations
{
  return self->_styleConfigurations;
}

- (int64_t)storyTypeTimeout
{
  return self->_storyTypeTimeout;
}

- (FCTopStoriesConfiguration)initWithConfigDictionary:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCTopStoriesConfiguration;
  v6 = [(FCTopStoriesConfiguration *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configDict, a3);
    v7->_promotingEnabled = FCAppConfigurationBoolValue(v5, @"promotingEnabled", 1);
    uint64_t v8 = FCAppConfigurationStringValue(v5, @"channelId", 0);
    channelID = v7->_channelID;
    v7->_channelID = (NSString *)v8;

    v7->_storyTypeTimeout = FCAppConfigurationIntegerValue(v5, @"badgesTimeout", 21600);
    v10 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"styleConfigs", 0);
    objc_storeStrong((id *)&v7->_styleConfigurations, (id)objc_msgSend(v10, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_275, &__block_literal_global_281_0));
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleConfigurations, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = v5;

  if (v6) {
    char v7 = objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", self->_configDict, v6[1]);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_configDict hash];
}

- (BOOL)isPromotingEnabled
{
  return self->_promotingEnabled;
}

- (NSString)channelID
{
  return self->_channelID;
}

@end