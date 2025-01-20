@interface FCSmarterMessagingConfig
- (BOOL)discoverNewsPlusBubbleTipEnabled;
- (BOOL)todayFeedMastheadBannerEnabledForSubscribers;
- (FCSmarterMessagingConfig)initWithDictionary:(id)a3;
- (NSArray)placementsBlocklist;
- (NSArray)segmentSetIdsAllowlist;
- (NSDictionary)engagementUpsellConfig;
- (NSString)discoverNewsPlusBubbleTipBody;
- (NSString)discoverNewsPlusBubbleTipTitle;
- (NSString)puzzleHubInfoBubbleTipBody;
- (NSString)puzzleHubInfoBubbleTipIconUrl;
- (NSString)puzzleHubInfoBubbleTipTitle;
- (int64_t)highChurnPropensitySegmentSetId;
- (int64_t)lowChurnPropensitySegmentSetId;
- (int64_t)maxEnableNotificationBubbleTipPresentations;
- (int64_t)maxNewsPlusStoriesBubbleTipPresentations;
- (int64_t)maxPuzzleHubInfoBubbleTipPresentations;
- (int64_t)maxShortcutsBubbleTipPresentations;
- (int64_t)maxSportsOnboardingBubbleTipPresentations;
- (int64_t)maxSportsScoresBubbleTipPresentations;
- (int64_t)mediumChurnPropensitySegmentSetId;
- (int64_t)newsPlusStoriesBubbleTipPresentationsQuiescenceInterval;
- (int64_t)notificationBubbleTipPresentationsQuiescenceInterval;
- (int64_t)puzzleHubInfoBubbleTipPresentationsQuiescenceInterval;
- (int64_t)shortcutsBubbleTipPresentationsQuiescenceInterval;
- (int64_t)sportsBubbleTipPresentationsQuiescenceInterval;
- (int64_t)sportsScoresBubbleTipPresentationsQuiescenceInterval;
- (void)setDiscoverNewsPlusBubbleTipBody:(id)a3;
- (void)setDiscoverNewsPlusBubbleTipTitle:(id)a3;
- (void)setPuzzleHubInfoBubbleTipBody:(id)a3;
- (void)setPuzzleHubInfoBubbleTipIconUrl:(id)a3;
- (void)setPuzzleHubInfoBubbleTipTitle:(id)a3;
@end

@implementation FCSmarterMessagingConfig

- (NSArray)placementsBlocklist
{
  return self->_placementsBlocklist;
}

- (NSDictionary)engagementUpsellConfig
{
  return self->_engagementUpsellConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverNewsPlusBubbleTipBody, 0);
  objc_storeStrong((id *)&self->_discoverNewsPlusBubbleTipTitle, 0);
  objc_storeStrong((id *)&self->_puzzleHubInfoBubbleTipIconUrl, 0);
  objc_storeStrong((id *)&self->_puzzleHubInfoBubbleTipBody, 0);
  objc_storeStrong((id *)&self->_puzzleHubInfoBubbleTipTitle, 0);
  objc_storeStrong((id *)&self->_engagementUpsellConfig, 0);
  objc_storeStrong((id *)&self->_placementsBlocklist, 0);
  objc_storeStrong((id *)&self->_segmentSetIdsAllowlist, 0);
}

- (FCSmarterMessagingConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FCSmarterMessagingConfig;
  v5 = [(FCSmarterMessagingConfig *)&v23 init];
  if (v5)
  {
    v5->_lowChurnPropensitySegmentSetId = FCAppConfigurationIntegerValue(v4, @"lowChurnPropensitySegmentSetId", 0);
    v5->_mediumChurnPropensitySegmentSetId = FCAppConfigurationIntegerValue(v4, @"mediumChurnPropensitySegmentSetId", 0);
    v5->_highChurnPropensitySegmentSetId = FCAppConfigurationIntegerValue(v4, @"highChurnPropensitySegmentSetId", 0);
    uint64_t v6 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"segmentSetIdsAllowlist", 0);
    segmentSetIdsAllowlist = v5->_segmentSetIdsAllowlist;
    v5->_segmentSetIdsAllowlist = (NSArray *)v6;

    uint64_t v8 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"placementsBlocklist", 0);
    placementsBlocklist = v5->_placementsBlocklist;
    v5->_placementsBlocklist = (NSArray *)v8;

    v5->_todayFeedMastheadBannerEnabledForSubscribers = FCAppConfigurationBoolValue(v4, @"todayFeedMastheadBannerEnabledForSubscribers", 0);
    uint64_t v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"engagementUpsellConfig2", 0);
    engagementUpsellConfig = v5->_engagementUpsellConfig;
    v5->_engagementUpsellConfig = (NSDictionary *)v10;

    v5->_maxEnableNotificationBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, @"maxEnableNotificationBubbleTipPresentations", 0);
    v5->_notificationBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, @"notificationBubbleTipPresentationsQuiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
    v5->_maxSportsOnboardingBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, @"maxSportsOnboardingBubbleTipPresentations", 0);
    v5->_sportsBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, @"sportsBubbleTipPresentationsQuiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
    v5->_maxSportsScoresBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, @"maxSportsScoresBubbleTipPresentations", 0);
    v5->_sportsScoresBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, @"sportsScoresBubbleTipPresentationsQuiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
    v5->_maxShortcutsBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, @"maxShortcutsBubbleTipPresentations", 0);
    v5->_shortcutsBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, @"shortcutsBubbleTipPresentationsQuiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
    v5->_maxPuzzleHubInfoBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, @"maxPuzzleHubInfoBubbleTipPresentations", 0);
    v5->_puzzleHubInfoBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, @"puzzleHubInfoBubbleTipPresentationsQuiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v12 = FCAppConfigurationStringValue(v4, @"puzzleHubInfoBubbleTipBody", 0);
    puzzleHubInfoBubbleTipBody = v5->_puzzleHubInfoBubbleTipBody;
    v5->_puzzleHubInfoBubbleTipBody = (NSString *)v12;

    uint64_t v14 = FCAppConfigurationStringValue(v4, @"puzzleHubInfoBubbleTipTitle", 0);
    puzzleHubInfoBubbleTipTitle = v5->_puzzleHubInfoBubbleTipTitle;
    v5->_puzzleHubInfoBubbleTipTitle = (NSString *)v14;

    uint64_t v16 = FCAppConfigurationStringValue(v4, @"puzzleHubInfoBubbleTipIconUrl", 0);
    puzzleHubInfoBubbleTipIconUrl = v5->_puzzleHubInfoBubbleTipIconUrl;
    v5->_puzzleHubInfoBubbleTipIconUrl = (NSString *)v16;

    uint64_t v18 = FCAppConfigurationStringValue(v4, @"discoverNewsPlusBubbleTipBody", 0);
    discoverNewsPlusBubbleTipBody = v5->_discoverNewsPlusBubbleTipBody;
    v5->_discoverNewsPlusBubbleTipBody = (NSString *)v18;

    uint64_t v20 = FCAppConfigurationStringValue(v4, @"discoverNewsPlusBubbleTipTitle", 0);
    discoverNewsPlusBubbleTipTitle = v5->_discoverNewsPlusBubbleTipTitle;
    v5->_discoverNewsPlusBubbleTipTitle = (NSString *)v20;

    v5->_discoverNewsPlusBubbleTipEnabled = FCAppConfigurationBoolValue(v4, @"discoverNewsPlusBubbleTipEnabled", 1);
    v5->_maxNewsPlusStoriesBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, @"maxNewsPlusStoriesBubbleTipPresentations", 0);
    v5->_newsPlusStoriesBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, @"newsPlusStoriesBubbleTipPresentationsQuiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
  }

  return v5;
}

- (NSArray)segmentSetIdsAllowlist
{
  return self->_segmentSetIdsAllowlist;
}

- (int64_t)mediumChurnPropensitySegmentSetId
{
  return self->_mediumChurnPropensitySegmentSetId;
}

- (int64_t)lowChurnPropensitySegmentSetId
{
  return self->_lowChurnPropensitySegmentSetId;
}

- (int64_t)highChurnPropensitySegmentSetId
{
  return self->_highChurnPropensitySegmentSetId;
}

- (BOOL)todayFeedMastheadBannerEnabledForSubscribers
{
  return self->_todayFeedMastheadBannerEnabledForSubscribers;
}

- (int64_t)maxEnableNotificationBubbleTipPresentations
{
  return self->_maxEnableNotificationBubbleTipPresentations;
}

- (int64_t)notificationBubbleTipPresentationsQuiescenceInterval
{
  return self->_notificationBubbleTipPresentationsQuiescenceInterval;
}

- (int64_t)maxSportsOnboardingBubbleTipPresentations
{
  return self->_maxSportsOnboardingBubbleTipPresentations;
}

- (int64_t)sportsBubbleTipPresentationsQuiescenceInterval
{
  return self->_sportsBubbleTipPresentationsQuiescenceInterval;
}

- (int64_t)maxSportsScoresBubbleTipPresentations
{
  return self->_maxSportsScoresBubbleTipPresentations;
}

- (int64_t)sportsScoresBubbleTipPresentationsQuiescenceInterval
{
  return self->_sportsScoresBubbleTipPresentationsQuiescenceInterval;
}

- (int64_t)maxShortcutsBubbleTipPresentations
{
  return self->_maxShortcutsBubbleTipPresentations;
}

- (int64_t)shortcutsBubbleTipPresentationsQuiescenceInterval
{
  return self->_shortcutsBubbleTipPresentationsQuiescenceInterval;
}

- (int64_t)maxPuzzleHubInfoBubbleTipPresentations
{
  return self->_maxPuzzleHubInfoBubbleTipPresentations;
}

- (int64_t)puzzleHubInfoBubbleTipPresentationsQuiescenceInterval
{
  return self->_puzzleHubInfoBubbleTipPresentationsQuiescenceInterval;
}

- (NSString)puzzleHubInfoBubbleTipTitle
{
  return self->_puzzleHubInfoBubbleTipTitle;
}

- (void)setPuzzleHubInfoBubbleTipTitle:(id)a3
{
}

- (NSString)puzzleHubInfoBubbleTipBody
{
  return self->_puzzleHubInfoBubbleTipBody;
}

- (void)setPuzzleHubInfoBubbleTipBody:(id)a3
{
}

- (NSString)puzzleHubInfoBubbleTipIconUrl
{
  return self->_puzzleHubInfoBubbleTipIconUrl;
}

- (void)setPuzzleHubInfoBubbleTipIconUrl:(id)a3
{
}

- (NSString)discoverNewsPlusBubbleTipTitle
{
  return self->_discoverNewsPlusBubbleTipTitle;
}

- (void)setDiscoverNewsPlusBubbleTipTitle:(id)a3
{
}

- (NSString)discoverNewsPlusBubbleTipBody
{
  return self->_discoverNewsPlusBubbleTipBody;
}

- (void)setDiscoverNewsPlusBubbleTipBody:(id)a3
{
}

- (BOOL)discoverNewsPlusBubbleTipEnabled
{
  return self->_discoverNewsPlusBubbleTipEnabled;
}

- (int64_t)maxNewsPlusStoriesBubbleTipPresentations
{
  return self->_maxNewsPlusStoriesBubbleTipPresentations;
}

- (int64_t)newsPlusStoriesBubbleTipPresentationsQuiescenceInterval
{
  return self->_newsPlusStoriesBubbleTipPresentationsQuiescenceInterval;
}

@end