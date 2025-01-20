@interface FCPaidBundleViaOfferConfig
- (BOOL)appLaunchUpsellEnabled;
- (BOOL)iconBadgeEnabled;
- (BOOL)iconBadgeMercuryEnabled;
- (BOOL)localNotificationEnabled;
- (BOOL)mastheadBannerEnabled;
- (BOOL)paywallsEnabled;
- (BOOL)subscriptionsDeeplinkEnabled;
- (BOOL)upsellEnabled;
- (FCPaidBundleViaOfferConfig)initWithConfigDictionary:(id)a3;
- (NSArray)vendorAdHocOfferIds;
- (NSString)localNotificationBody;
- (NSString)localNotificationSubtitle;
- (NSString)localNotificationTitle;
- (NSString)localNotificationURL;
- (int64_t)iconBadgeMaxNumberOfPresentations;
- (int64_t)iconBadgeQuiescenceInterval;
- (int64_t)localNotificationDelay;
- (int64_t)localNotificationMaxNumberOfPresentations;
- (int64_t)localNotificationQuiescenceInterval;
- (int64_t)upsellBestOfferRefreshQuiescenceInterval;
- (int64_t)upsellMaxNumberOfPresentations;
- (int64_t)upsellQuiescenceInterval;
- (void)setIconBadgeMaxNumberOfPresentations:(int64_t)a3;
- (void)setIconBadgeQuiescenceInterval:(int64_t)a3;
- (void)setLocalNotificationBody:(id)a3;
- (void)setLocalNotificationDelay:(int64_t)a3;
- (void)setLocalNotificationMaxNumberOfPresentations:(int64_t)a3;
- (void)setLocalNotificationQuiescenceInterval:(int64_t)a3;
- (void)setLocalNotificationSubtitle:(id)a3;
- (void)setLocalNotificationTitle:(id)a3;
- (void)setLocalNotificationURL:(id)a3;
- (void)setUpsellMaxNumberOfPresentations:(int64_t)a3;
- (void)setUpsellQuiescenceInterval:(int64_t)a3;
- (void)setVendorAdHocOfferIds:(id)a3;
@end

@implementation FCPaidBundleViaOfferConfig

- (FCPaidBundleViaOfferConfig)initWithConfigDictionary:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)FCPaidBundleViaOfferConfig;
  v5 = [(FCPaidBundleViaOfferConfig *)&v28 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationIntegerValue(v4, @"iconBadgeQuiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_iconBadgeQuiescenceInterval = v7;
    v5->_iconBadgeMaxNumberOfPresentations = FCAppConfigurationIntegerValue(v4, @"iconBadgeMaxNumberOfPresentations", 0);
    uint64_t v8 = FCAppConfigurationIntegerValue(v4, @"localNotificationQuiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_localNotificationQuiescenceInterval = v9;
    v5->_localNotificationMaxNumberOfPresentations = FCAppConfigurationIntegerValue(v4, @"localNotificationMaxNumberOfPresentations", 0);
    uint64_t v10 = FCAppConfigurationStringValue(v4, @"localNotificationTitle", 0);
    localNotificationTitle = v5->_localNotificationTitle;
    v5->_localNotificationTitle = (NSString *)v10;

    uint64_t v12 = FCAppConfigurationStringValue(v4, @"localNotificationSubtitle", 0);
    localNotificationSubtitle = v5->_localNotificationSubtitle;
    v5->_localNotificationSubtitle = (NSString *)v12;

    uint64_t v14 = FCAppConfigurationStringValue(v4, @"localNotificationBody", 0);
    localNotificationBody = v5->_localNotificationBody;
    v5->_localNotificationBody = (NSString *)v14;

    uint64_t v16 = FCAppConfigurationStringValue(v4, @"localNotificationURL", 0);
    localNotificationURL = v5->_localNotificationURL;
    v5->_localNotificationURL = (NSString *)v16;

    uint64_t v18 = FCAppConfigurationIntegerValue(v4, @"localNotificationDelay", 0x7FFFFFFFFFFFFFFFLL);
    if (v18) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_localNotificationDelay = v19;
    uint64_t v20 = FCAppConfigurationIntegerValue(v4, @"upsellQuiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
    if (v20) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_upsellQuiescenceInterval = v21;
    v5->_upsellMaxNumberOfPresentations = FCAppConfigurationIntegerValue(v4, @"upsellMaxNumberOfPresentations", 0);
    v29[0] = @"1Party_HW_News_Offer_1";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    uint64_t v23 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"vendorAdHocOfferIds", v22);
    vendorAdHocOfferIds = v5->_vendorAdHocOfferIds;
    v5->_vendorAdHocOfferIds = (NSArray *)v23;

    uint64_t v25 = FCAppConfigurationIntegerValue(v4, @"upsellBestOfferRefreshQuiescenceInterval", 86400);
    if (v25) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 86400;
    }
    v5->_upsellBestOfferRefreshQuiescenceInterval = v26;
    v5->_paywallsEnabled = +[FCFeatureEnablementChecker enabledInConfig:v4 forKey:@"paywallsEnabledLevel" withDefaultLevel:0xFFFFFFFFLL];
    v5->_subscriptionsDeeplinkEnabled = +[FCFeatureEnablementChecker enabledInConfig:v4 forKey:@"subscriptionsDeeplinkEnabledLevel" withDefaultLevel:0xFFFFFFFFLL];
    v5->_mastheadBannerEnabled = +[FCFeatureEnablementChecker enabledInConfig:v4 forKey:@"mastheadBannerEnabledLevel" withDefaultLevel:0xFFFFFFFFLL];
    v5->_iconBadgeEnabled = +[FCFeatureEnablementChecker enabledInConfig:v4 forKey:@"iconBadgeEnabledLevel" withDefaultLevel:0];
    v5->_iconBadgeMercuryEnabled = +[FCFeatureEnablementChecker enabledInConfig:v4 forKey:@"iconBadgeMercuryEnabledLevel" withDefaultLevel:0xFFFFFFFFLL];
    v5->_localNotificationEnabled = +[FCFeatureEnablementChecker enabledInConfig:v4 forKey:@"localNotificationEnabledLevel" withDefaultLevel:0];
    v5->_upsellEnabled = +[FCFeatureEnablementChecker enabledInConfig:v4 forKey:@"upsellEnabledLevel2" withDefaultLevel:0xFFFFFFFFLL];
    v5->_appLaunchUpsellEnabled = +[FCFeatureEnablementChecker enabledInConfig:v4 forKey:@"appLaunchUpsellEnabledLevel" withDefaultLevel:0xFFFFFFFFLL];
  }

  return v5;
}

- (BOOL)upsellEnabled
{
  return self->_upsellEnabled;
}

- (BOOL)subscriptionsDeeplinkEnabled
{
  return self->_subscriptionsDeeplinkEnabled;
}

- (BOOL)paywallsEnabled
{
  return self->_paywallsEnabled;
}

- (BOOL)mastheadBannerEnabled
{
  return self->_mastheadBannerEnabled;
}

- (BOOL)localNotificationEnabled
{
  return self->_localNotificationEnabled;
}

- (BOOL)iconBadgeMercuryEnabled
{
  return self->_iconBadgeMercuryEnabled;
}

- (BOOL)iconBadgeEnabled
{
  return self->_iconBadgeEnabled;
}

- (BOOL)appLaunchUpsellEnabled
{
  return self->_appLaunchUpsellEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorAdHocOfferIds, 0);
  objc_storeStrong((id *)&self->_localNotificationURL, 0);
  objc_storeStrong((id *)&self->_localNotificationBody, 0);
  objc_storeStrong((id *)&self->_localNotificationSubtitle, 0);
  objc_storeStrong((id *)&self->_localNotificationTitle, 0);
}

- (int64_t)iconBadgeQuiescenceInterval
{
  return self->_iconBadgeQuiescenceInterval;
}

- (void)setIconBadgeQuiescenceInterval:(int64_t)a3
{
  self->_iconBadgeQuiescenceInterval = a3;
}

- (int64_t)iconBadgeMaxNumberOfPresentations
{
  return self->_iconBadgeMaxNumberOfPresentations;
}

- (void)setIconBadgeMaxNumberOfPresentations:(int64_t)a3
{
  self->_iconBadgeMaxNumberOfPresentations = a3;
}

- (int64_t)localNotificationQuiescenceInterval
{
  return self->_localNotificationQuiescenceInterval;
}

- (void)setLocalNotificationQuiescenceInterval:(int64_t)a3
{
  self->_localNotificationQuiescenceInterval = a3;
}

- (int64_t)localNotificationMaxNumberOfPresentations
{
  return self->_localNotificationMaxNumberOfPresentations;
}

- (void)setLocalNotificationMaxNumberOfPresentations:(int64_t)a3
{
  self->_localNotificationMaxNumberOfPresentations = a3;
}

- (NSString)localNotificationTitle
{
  return self->_localNotificationTitle;
}

- (void)setLocalNotificationTitle:(id)a3
{
}

- (NSString)localNotificationSubtitle
{
  return self->_localNotificationSubtitle;
}

- (void)setLocalNotificationSubtitle:(id)a3
{
}

- (NSString)localNotificationBody
{
  return self->_localNotificationBody;
}

- (void)setLocalNotificationBody:(id)a3
{
}

- (NSString)localNotificationURL
{
  return self->_localNotificationURL;
}

- (void)setLocalNotificationURL:(id)a3
{
}

- (int64_t)localNotificationDelay
{
  return self->_localNotificationDelay;
}

- (void)setLocalNotificationDelay:(int64_t)a3
{
  self->_localNotificationDelay = a3;
}

- (int64_t)upsellQuiescenceInterval
{
  return self->_upsellQuiescenceInterval;
}

- (void)setUpsellQuiescenceInterval:(int64_t)a3
{
  self->_upsellQuiescenceInterval = a3;
}

- (int64_t)upsellMaxNumberOfPresentations
{
  return self->_upsellMaxNumberOfPresentations;
}

- (void)setUpsellMaxNumberOfPresentations:(int64_t)a3
{
  self->_upsellMaxNumberOfPresentations = a3;
}

- (NSArray)vendorAdHocOfferIds
{
  return self->_vendorAdHocOfferIds;
}

- (void)setVendorAdHocOfferIds:(id)a3
{
}

- (int64_t)upsellBestOfferRefreshQuiescenceInterval
{
  return self->_upsellBestOfferRefreshQuiescenceInterval;
}

@end