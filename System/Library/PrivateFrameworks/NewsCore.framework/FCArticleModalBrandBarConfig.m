@interface FCArticleModalBrandBarConfig
- (BOOL)enabled;
- (FCArticleModalBrandBarConfig)initWithConfigDictionary:(id)a3;
- (NSString)ctaTitle;
- (NSString)ctaUrl;
- (NSString)messageBody;
- (NSString)messageTitle;
- (int)campaignVersion;
- (int)maxCount;
- (int64_t)quiescenceInterval;
@end

@implementation FCArticleModalBrandBarConfig

- (FCArticleModalBrandBarConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FCArticleModalBrandBarConfig;
  v5 = [(FCArticleModalBrandBarConfig *)&v21 init];
  if (v5)
  {
    v5->_enabled = FCAppConfigurationBoolValue(v4, @"enabled", 0);
    v5->_maxCount = FCAppConfigurationIntegerValue(v4, @"maxCount", 3);
    v5->_quiescenceInterval = FCAppConfigurationIntegerValue(v4, @"quiescenceInterval", 172800);
    v6 = FCBundle();
    v7 = [v6 localizedStringForKey:@"Apple News" value:&stru_1EF8299B8 table:0];
    uint64_t v8 = FCAppConfigurationStringValue(v4, @"messageTitle", v7);
    messageTitle = v5->_messageTitle;
    v5->_messageTitle = (NSString *)v8;

    v10 = FCBundle();
    v11 = [v10 localizedStringForKey:@"The best stories from the sources you love, all in one place.", &stru_1EF8299B8, 0 value table];
    uint64_t v12 = FCAppConfigurationStringValue(v4, @"messageBody", v11);
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSString *)v12;

    v14 = FCBundle();
    v15 = [v14 localizedStringForKey:@"MORE" value:&stru_1EF8299B8 table:0];
    uint64_t v16 = FCAppConfigurationStringValue(v4, @"ctaTitle", v15);
    ctaTitle = v5->_ctaTitle;
    v5->_ctaTitle = (NSString *)v16;

    uint64_t v18 = FCAppConfigurationStringValue(v4, @"ctaUrl", 0);
    ctaUrl = v5->_ctaUrl;
    v5->_ctaUrl = (NSString *)v18;

    v5->_campaignVersion = FCAppConfigurationIntegerValue(v4, @"campaignVersion", 0);
  }

  return v5;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)quiescenceInterval
{
  return self->_quiescenceInterval;
}

- (int)maxCount
{
  return self->_maxCount;
}

- (NSString)messageTitle
{
  return self->_messageTitle;
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (NSString)ctaTitle
{
  return self->_ctaTitle;
}

- (NSString)ctaUrl
{
  return self->_ctaUrl;
}

- (int)campaignVersion
{
  return self->_campaignVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctaUrl, 0);
  objc_storeStrong((id *)&self->_ctaTitle, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_messageTitle, 0);
}

@end