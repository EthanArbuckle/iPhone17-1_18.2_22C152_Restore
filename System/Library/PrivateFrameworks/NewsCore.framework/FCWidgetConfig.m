@interface FCWidgetConfig
+ (BOOL)supportsSecureCoding;
- (FCWidgetConfig)initWithCoder:(id)a3;
- (FCWidgetConfig)initWithConfigDictionary:(id)a3;
- (FCWidgetConfig)initWithWidgetConfig:(id)a3;
- (NSDictionary)configDictionary;
- (NTPBWidgetConfig)pbWidgetConfig;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)forYouBackgroundMinimumUpdateInterval;
- (int64_t)minimumArticleExposureDurationToBePreseen;
- (int64_t)smallWidgetSystemHoneymoonDuration;
- (int64_t)smallWidgetSystemReloadInterval;
- (int64_t)smallWidgetSystemReloadIntervalHoneymoon;
- (int64_t)smallWidgetSystemReloadJitterMax;
- (int64_t)smallWidgetSystemReloadJitterMaxHoneymoon;
- (int64_t)widgetSystemHoneymoonDuration;
- (int64_t)widgetSystemReloadInterval;
- (int64_t)widgetSystemReloadIntervalHoneymoon;
- (int64_t)widgetSystemReloadJitterMax;
- (int64_t)widgetSystemReloadJitterMaxHoneymoon;
- (unsigned)minimumNumberOfTimesPreseenToBeSeen;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigDictionary:(id)a3;
- (void)setPbWidgetConfig:(id)a3;
@end

@implementation FCWidgetConfig

- (FCWidgetConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCWidgetConfig;
  v5 = [(FCWidgetConfig *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configDictionary = v5->_configDictionary;
    v5->_configDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDictionary, 0);
  objc_storeStrong((id *)&self->_pbWidgetConfig, 0);
}

- (FCWidgetConfig)initWithWidgetConfig:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCWidgetConfig;
  v5 = [(FCWidgetConfig *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    pbWidgetConfig = v5->_pbWidgetConfig;
    v5->_pbWidgetConfig = (NTPBWidgetConfig *)v6;
  }
  return v5;
}

- (int64_t)forYouBackgroundMinimumUpdateInterval
{
  v3 = [(FCWidgetConfig *)self pbWidgetConfig];

  if (v3)
  {
    id v4 = [(FCWidgetConfig *)self pbWidgetConfig];
    uint64_t v5 = [v4 forYouBackgroundMinimumUpdateInterval];
  }
  else
  {
    id v4 = [(FCWidgetConfig *)self configDictionary];
    uint64_t v5 = FCAppConfigurationIntegerValue(v4, @"forYouBackgroundMinimumUpdateInterval", 1200);
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)minimumArticleExposureDurationToBePreseen
{
  v3 = [(FCWidgetConfig *)self pbWidgetConfig];

  if (v3)
  {
    id v4 = [(FCWidgetConfig *)self pbWidgetConfig];
    uint64_t v5 = [v4 minimumArticleExposureDurationToBePreseen];
  }
  else
  {
    id v4 = [(FCWidgetConfig *)self configDictionary];
    uint64_t v5 = FCAppConfigurationIntegerValue(v4, @"minimumArticleExposureDurationToBePreseen", 1000);
  }
  int64_t v6 = v5;

  return v6;
}

- (unsigned)minimumNumberOfTimesPreseenToBeSeen
{
  v3 = [(FCWidgetConfig *)self pbWidgetConfig];

  if (v3)
  {
    id v4 = [(FCWidgetConfig *)self pbWidgetConfig];
    unsigned int v5 = [v4 minimumNumberOfTimesPreseenToBeSeen];
  }
  else
  {
    id v4 = [(FCWidgetConfig *)self configDictionary];
    unsigned int v5 = FCAppConfigurationIntegerValue(v4, @"minimumNumberOfTimesPreseenToBeSeen", 2);
  }

  return v5;
}

- (int64_t)widgetSystemReloadInterval
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"widgetSystemReloadInterval", 300);

  return v3;
}

- (int64_t)widgetSystemReloadJitterMax
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"widgetSystemReloadJitterMax", 600);

  return v3;
}

- (int64_t)widgetSystemHoneymoonDuration
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"widgetSystemHoneymoonDuration", 172800);

  return v3;
}

- (int64_t)widgetSystemReloadIntervalHoneymoon
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"widgetSystemReloadIntervalHoneymoon", 300);

  return v3;
}

- (int64_t)widgetSystemReloadJitterMaxHoneymoon
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"widgetSystemReloadJitterMaxHoneymoon", 600);

  return v3;
}

- (int64_t)smallWidgetSystemReloadInterval
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"smallWidgetSystemReloadInterval", 7200);

  return v3;
}

- (int64_t)smallWidgetSystemReloadJitterMax
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"smallWidgetSystemReloadJitterMax", 600);

  return v3;
}

- (int64_t)smallWidgetSystemHoneymoonDuration
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"smallWidgetSystemHoneymoonDuration", 172800);

  return v3;
}

- (int64_t)smallWidgetSystemReloadIntervalHoneymoon
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"smallWidgetSystemReloadIntervalHoneymoon", 7200);

  return v3;
}

- (int64_t)smallWidgetSystemReloadJitterMaxHoneymoon
{
  v2 = [(FCWidgetConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"smallWidgetSystemReloadJitterMaxHoneymoon", 600);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(FCWidgetConfig);
  unsigned int v5 = [(FCWidgetConfig *)self pbWidgetConfig];
  [(FCWidgetConfig *)v4 setPbWidgetConfig:v5];

  int64_t v6 = [(FCWidgetConfig *)self configDictionary];
  [(FCWidgetConfig *)v4 setConfigDictionary:v6];

  return v4;
}

- (FCWidgetConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCWidgetConfig;
  unsigned int v5 = [(FCWidgetConfig *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pbWidgetConfig"];
    pbWidgetConfig = v5->_pbWidgetConfig;
    v5->_pbWidgetConfig = (NTPBWidgetConfig *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configDictionary"];
    configDictionary = v5->_configDictionary;
    v5->_configDictionary = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FCWidgetConfig *)self pbWidgetConfig];
  [v4 encodeObject:v5 forKey:@"pbWidgetConfig"];

  id v6 = [(FCWidgetConfig *)self configDictionary];
  [v4 encodeObject:v6 forKey:@"configDictionary"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTPBWidgetConfig)pbWidgetConfig
{
  return self->_pbWidgetConfig;
}

- (void)setPbWidgetConfig:(id)a3
{
}

- (NSDictionary)configDictionary
{
  return self->_configDictionary;
}

- (void)setConfigDictionary:(id)a3
{
}

@end