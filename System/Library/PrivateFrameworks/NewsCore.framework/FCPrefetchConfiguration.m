@interface FCPrefetchConfiguration
- (BOOL)isBackgroundFetchEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPrefetchForYouFeed;
- (FCPrefetchConfiguration)initWithConfigDictionary:(id)a3;
- (FCPrefetchConfiguration)initWithDefaults;
- (NSDictionary)scheduledBGFetchTimes;
- (NSDictionary)scheduledMicroUpdateTimes;
- (double)minimumBackgroundFetchInterval;
- (int64_t)scheduledBGFetchTimeJitter;
- (int64_t)scheduledMicroUpdateTimeJitter;
- (unint64_t)hash;
@end

@implementation FCPrefetchConfiguration

- (double)minimumBackgroundFetchInterval
{
  return self->_minimumBackgroundFetchInterval;
}

- (BOOL)isBackgroundFetchEnabled
{
  return self->_backgroundFetchEnabled;
}

- (FCPrefetchConfiguration)initWithConfigDictionary:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPrefetchConfiguration;
  v6 = [(FCPrefetchConfiguration *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configDict, a3);
    v7->_backgroundFetchEnabled = FCAppConfigurationBoolValue(v5, @"backgroundFetchEnabled2", 1);
    v7->_minimumBackgroundFetchInterval = (double)FCAppConfigurationIntegerValue(v5, @"backgroundFetchMinimumInterval", 0);
    v7->_shouldPrefetchForYouFeed = FCAppConfigurationBoolValue(v5, @"feedPrefetchForYou", 1);
    uint64_t v8 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"scheduledBGFetchTimes", &unk_1EF8D9948);
    scheduledBGFetchTimes = v7->_scheduledBGFetchTimes;
    v7->_scheduledBGFetchTimes = (NSDictionary *)v8;

    v7->_scheduledBGFetchTimeJitter = FCAppConfigurationIntegerValue(v5, @"scheduledBGFetchJitter", 3600);
    v10 = FCDefaultScheduledMicroUpdateTimes();
    uint64_t v11 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"scheduledMicroUpdateTimes", v10);
    scheduledMicroUpdateTimes = v7->_scheduledMicroUpdateTimes;
    v7->_scheduledMicroUpdateTimes = (NSDictionary *)v11;

    v7->_scheduledMicroUpdateTimeJitter = FCAppConfigurationIntegerValue(v5, @"scheduledMicroUpdateJitter", 3600);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledMicroUpdateTimes, 0);
  objc_storeStrong((id *)&self->_scheduledBGFetchTimes, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
}

- (FCPrefetchConfiguration)initWithDefaults
{
  v8.receiver = self;
  v8.super_class = (Class)FCPrefetchConfiguration;
  v2 = [(FCPrefetchConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_backgroundFetchEnabled = 257;
    scheduledBGFetchTimes = v2->_scheduledBGFetchTimes;
    v2->_minimumBackgroundFetchInterval = 0.0;
    v2->_scheduledBGFetchTimes = (NSDictionary *)&unk_1EF8D9920;

    v3->_scheduledBGFetchTimeJitter = 3600;
    uint64_t v5 = FCDefaultScheduledMicroUpdateTimes();
    scheduledMicroUpdateTimes = v3->_scheduledMicroUpdateTimes;
    v3->_scheduledMicroUpdateTimes = (NSDictionary *)v5;

    v3->_scheduledMicroUpdateTimeJitter = 3600;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
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

- (BOOL)shouldPrefetchForYouFeed
{
  return self->_shouldPrefetchForYouFeed;
}

- (NSDictionary)scheduledBGFetchTimes
{
  return self->_scheduledBGFetchTimes;
}

- (int64_t)scheduledBGFetchTimeJitter
{
  return self->_scheduledBGFetchTimeJitter;
}

- (NSDictionary)scheduledMicroUpdateTimes
{
  return self->_scheduledMicroUpdateTimes;
}

- (int64_t)scheduledMicroUpdateTimeJitter
{
  return self->_scheduledMicroUpdateTimeJitter;
}

@end