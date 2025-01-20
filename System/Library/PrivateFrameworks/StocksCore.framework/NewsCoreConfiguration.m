@interface NewsCoreConfiguration
- (BOOL)corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
- (BOOL)disableThumbnailsForArticleRecirculation;
- (BOOL)diversifyOptionalTopStories;
- (BOOL)enableCacheFallbackForArticleRecirculation;
- (BOOL)hideAlacartePaywalls;
- (BOOL)hideAllPaywalls;
- (BOOL)isOrderFeedEndpointEnabled;
- (BOOL)isPrivateDataEncryptionAllowed;
- (BOOL)isPrivateDataEncryptionMigrationDesired;
- (BOOL)isPrivateDataEncryptionRequired;
- (BOOL)isPrivateDataMigrationCleanupEnabled;
- (BOOL)privateDataShouldSecureSubscriptions;
- (BOOL)shouldShowAlternateHeadlines;
- (BOOL)terminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
- (BOOL)todayFeedEnabled;
- (BOOL)universalLinksEnabled;
- (BOOL)useSecureConnectionForAssets;
- (FCEmbedProxyConfiguration)embedProxyConfiguration;
- (FCForYouGroupsConfiguration)forYouGroupsConfiguration;
- (FCIAdConfiguration)iAdConfig;
- (FCNewsPersonalizationConfiguration)newsPersonalizationConfiguration;
- (FCNotificationsConfiguration)notificationsConfig;
- (FCPaidBundleConfiguration)paidBundleConfig;
- (FCPaidBundleViaOfferConfig)paidBundleViaOfferConfig;
- (FCPeopleAlsoReadConfiguration)peopleAlsoReadConfiguration;
- (FCPrefetchConfiguration)prefetchConfig;
- (FCPuzzlesConfiguration)puzzlesConfig;
- (FCTopStoriesConfiguration)topStoriesConfig;
- (FCVideoGroupsConfig)forYouVideoGroupsConfig;
- (NSArray)deprecatedSportsTopicTagIds;
- (NSArray)externalAnalyticsConfigurations;
- (NSArray)hiddenFeedIDs;
- (NSArray)mediaSharingBlacklistedChannelIDs;
- (NSArray)onboardingFeedIDs;
- (NSArray)permanentChannelIDs;
- (NSArray)presubscribedFeedIDs;
- (NSArray)topStoriesPublishDates;
- (NSDictionary)articleConfig;
- (NSDictionary)endpointConfigsByEnvironment;
- (NSNumber)currentTreatment;
- (NSString)aiAttributionArticleString;
- (NSString)anfRenderingConfiguration;
- (NSString)articleRecirculationComponentPlacementConfigJSON;
- (NSString)articleRecirculationConfigJSON;
- (NSString)breakingNewsChannelID;
- (NSString)briefingsTagID;
- (NSString)editorialChannelID;
- (NSString)editorialGemsSectionID;
- (NSString)embedConfigurationAssetID;
- (NSString)endOfArticleFeedConfigurationResourceId;
- (NSString)experimentalizableFieldPostfix;
- (NSString)exploreArticleID;
- (NSString)featuredStoriesTagID;
- (NSString)forYouRecordConfigID;
- (NSString)myMagazinesTagID;
- (NSString)mySportsTagID;
- (NSString)personalizationBundleIdMappingResourceId;
- (NSString)personalizationFavorabilityResourceId;
- (NSString)personalizationUrlMappingResourceId;
- (NSString)personalizationWhitelistResourceId;
- (NSString)savedStoriesTagID;
- (NSString)shortcutsTagID;
- (NSString)sportsTopStoriesTagID;
- (NSString)trendingTagID;
- (NSString)userConcernConfigurationResourceId;
- (NSString)webEmbedContentBlockerOverrides;
- (NSString)webEmbedContentBlockers;
- (NSString)widgetConfigID;
- (NTPBDiscoverMoreVideosInfo)shareDiscoverMoreVideosInfo;
- (_TtC10StocksCore21NewsCoreConfiguration)init;
- (double)articleDiversificationSimilarityExpectationEnd;
- (double)articleDiversificationSimilarityExpectationStart;
- (double)articleDiversificationUniquePublisherExpectationSlope;
- (double)articleDiversificationUniquePublisherExpectationYIntercept;
- (double)delayBeforeRetryingDroppedFeeds;
- (double)endOfArticleMinPaidHeadlineRatio;
- (double)interstitialAdLoadDelay;
- (double)minimumTrendingUnseenRatio;
- (double)prerollLoadingTimeout;
- (double)prerollReadyToPlayTimeout;
- (id)analyticsEnvelopeContentTypeConfigsForEnvironment:(unint64_t)a3;
- (id)copyWithZone:(void *)a3;
- (id)personalizationTreatment;
- (int64_t)analyticsEndpointMaxPayloadSize;
- (int64_t)appConfigRefreshRate;
- (int64_t)articleRapidUpdatesTimeout;
- (int64_t)articleRecirculationPopularFeedQueryTimeRange;
- (int64_t)autoRefreshMinimumInterval;
- (int64_t)autoScrollToTopFeedTimeout;
- (int64_t)corryBarMaxArticleCountForArticleList;
- (int64_t)corryBarMaxArticleCountForSingleArticle;
- (int64_t)endOfArticleExpireArticlesAfter;
- (int64_t)endOfArticleMaxInaccessiblePaidArticleCount;
- (int64_t)entitlementsRequestTimeoutDurationInSeconds;
- (int64_t)expirePinnedArticlesAfter;
- (int64_t)expiredPaidSubscriptionGroupCutoffTime;
- (int64_t)maxRetriesForDroppedFeeds;
- (int64_t)maximumNumberOfExpiredPaidSubscriptionGroups;
- (int64_t)maximumPaidSubscriptionGroupSizeiPad;
- (int64_t)maximumPaidSubscriptionGroupSizeiPhone;
- (int64_t)maximumTimesHeadlineInPaidSubscriptionGroup;
- (int64_t)minimumDistanceBetweenImageOnTopTiles;
- (int64_t)minimumDurationBetweenForYouGroupsWeekday;
- (int64_t)minimumDurationBetweenForYouGroupsWeekend;
- (int64_t)minimumDurationBetweenTrendingGroupsWeekday;
- (int64_t)minimumDurationBetweenTrendingGroupsWeekend;
- (int64_t)newFavoriteNotificationAlertsFrequency;
- (int64_t)notificationArticleCacheTimeout;
- (int64_t)notificationArticleWithRapidUpdatesCacheTimeout;
- (int64_t)notificationEnabledChannelsRefreshFrequency;
- (int64_t)optionalTopStoriesRefreshRate;
- (int64_t)savedArticlesCutoffTime;
- (int64_t)savedArticlesMaximumCountCellular;
- (int64_t)savedArticlesMaximumCountWiFi;
- (int64_t)savedArticlesOpenedCutoffTime;
- (int64_t)stateRestorationAllowedTimeWindow;
- (int64_t)subscriptionsGlobalMeteredCount;
- (int64_t)subscriptionsGracePeriodForTokenVerificationSeconds;
- (int64_t)subscriptionsPlacardGlobalMaximumPerDay;
- (int64_t)subscriptionsPlacardPublisherFrequencyInSeconds;
- (int64_t)trendingTopicsRefreshRate;
- (int64_t)widgetMinimumArticleExposureDurationToBePreseenInMilliseconds;
- (unint64_t)likeDislikeBehavior;
- (unint64_t)trendingStyle;
- (unsigned)widgetMinimumNumberOfTimesPreseenToBeSeen;
@end

@implementation NewsCoreConfiguration

- (NSString)experimentalizableFieldPostfix
{
  if (*(void *)&self->experimentalizableFieldPostfix[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_experimentalizableFieldPostfix])
  {
    sub_1AFFC8E38();
    v2 = (void *)sub_1AFFCAE68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (int64_t)analyticsEndpointMaxPayloadSize
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_analyticsEndpointMaxPayloadSize);
}

- (int64_t)maxRetriesForDroppedFeeds
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_maxRetriesForDroppedFeeds);
}

- (double)delayBeforeRetryingDroppedFeeds
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_delayBeforeRetryingDroppedFeeds);
}

- (BOOL)enableCacheFallbackForArticleRecirculation
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_enableCacheFallbackForArticleRecirculation);
}

- (double)prerollLoadingTimeout
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_prerollLoadingTimeout);
}

- (double)prerollReadyToPlayTimeout
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_prerollReadyToPlayTimeout);
}

- (BOOL)isPrivateDataEncryptionRequired
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_isPrivateDataEncryptionRequired);
}

- (_TtC10StocksCore21NewsCoreConfiguration)init
{
  result = (_TtC10StocksCore21NewsCoreConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  MEMORY[0x1F4188790](self);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  memcpy(v4, (const void *)(v3 + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration), 0x10BAuLL);
  sub_1AFD55D10((uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v5, (const void *)(v3 + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_paidBundleConfiguration), 0x1F9uLL);
  sub_1AFE05844((uint64_t)v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (BOOL)isOrderFeedEndpointEnabled
{
  return 1;
}

- (BOOL)useSecureConnectionForAssets
{
  return 1;
}

- (NSString)forYouRecordConfigID
{
  uint64_t v2 = (void *)sub_1AFFCAE68();

  return (NSString *)v2;
}

- (BOOL)isPrivateDataEncryptionAllowed
{
  return 1;
}

- (BOOL)isPrivateDataEncryptionMigrationDesired
{
  return 0;
}

- (BOOL)isPrivateDataMigrationCleanupEnabled
{
  return 0;
}

- (BOOL)privateDataShouldSecureSubscriptions
{
  return 0;
}

- (FCTopStoriesConfiguration)topStoriesConfig
{
  uint64_t v2 = self;
  NewsCoreConfiguration.topStoriesConfig.getter();
  v4 = v3;

  return (FCTopStoriesConfiguration *)v4;
}

- (BOOL)diversifyOptionalTopStories
{
  return 1;
}

- (int64_t)articleRapidUpdatesTimeout
{
  return 60;
}

- (int64_t)savedArticlesCutoffTime
{
  return 0;
}

- (int64_t)savedArticlesOpenedCutoffTime
{
  return 0;
}

- (int64_t)savedArticlesMaximumCountWiFi
{
  return 0;
}

- (int64_t)savedArticlesMaximumCountCellular
{
  return 0;
}

- (NSDictionary)endpointConfigsByEnvironment
{
  uint64_t v2 = self;
  NewsCoreConfiguration.endpointConfigsByEnvironment.getter();

  uint64_t v3 = (void *)sub_1AFFCAC78();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3;
}

- (id)analyticsEnvelopeContentTypeConfigsForEnvironment:(unint64_t)a3
{
  uint64_t v3 = self;
  NewsCoreConfiguration.analyticsEnvelopeContentTypeConfigs(for:)();

  sub_1AFD8F6AC(0, (unint64_t *)&qword_1EB819E90);
  sub_1AFD8F6AC(0, &qword_1EB81B2A0);
  sub_1AFE040C8();
  v4 = (void *)sub_1AFFCAC78();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)personalizationTreatment
{
  return sub_1AFE0018C(self);
}

- (NSNumber)currentTreatment
{
  id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 0);

  return (NSNumber *)v2;
}

- (BOOL)shouldShowAlternateHeadlines
{
  return 0;
}

- (int64_t)subscriptionsGlobalMeteredCount
{
  return 0;
}

- (double)endOfArticleMinPaidHeadlineRatio
{
  double result = *(double *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
                                            + 3790];
  if (self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3798]) {
    return 0.25;
  }
  return result;
}

- (int64_t)endOfArticleMaxInaccessiblePaidArticleCount
{
  if (self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3814]) {
    return 2;
  }
  else {
    return *(void *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
  }
                                            + 3806];
}

- (int64_t)endOfArticleExpireArticlesAfter
{
  if (self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3830]) {
    return 2592000;
  }
  else {
    return *(void *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
  }
                                            + 3822];
}

- (double)interstitialAdLoadDelay
{
  double result = *(double *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
                                            + 3838];
  if (self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3846]) {
    return 1.0;
  }
  return result;
}

- (BOOL)todayFeedEnabled
{
  return 0;
}

- (NSArray)permanentChannelIDs
{
  return (NSArray *)0;
}

- (NSString)briefingsTagID
{
  return (NSString *)0;
}

- (FCNotificationsConfiguration)notificationsConfig
{
  return (FCNotificationsConfiguration *)sub_1AFE00608((uint64_t)self, (uint64_t)a2, (Class *)0x1E4F7E5F0);
}

- (FCEmbedProxyConfiguration)embedProxyConfiguration
{
  id v2 = self;
  id v3 = NewsCoreConfiguration.embedProxyConfiguration.getter();

  return (FCEmbedProxyConfiguration *)v3;
}

- (int64_t)entitlementsRequestTimeoutDurationInSeconds
{
  return *(void *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3942];
}

- (FCPeopleAlsoReadConfiguration)peopleAlsoReadConfiguration
{
  return (FCPeopleAlsoReadConfiguration *)0;
}

- (int64_t)appConfigRefreshRate
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)trendingTopicsRefreshRate
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)notificationEnabledChannelsRefreshFrequency
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSArray)presubscribedFeedIDs
{
  int64_t result = (NSArray *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)breakingNewsChannelID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)trendingTagID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)featuredStoriesTagID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)savedStoriesTagID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)myMagazinesTagID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)mySportsTagID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)sportsTopStoriesTagID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)shortcutsTagID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)editorialGemsSectionID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)editorialChannelID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSArray)hiddenFeedIDs
{
  int64_t result = (NSArray *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (FCForYouGroupsConfiguration)forYouGroupsConfiguration
{
  int64_t result = (FCForYouGroupsConfiguration *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekday
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekend
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekday
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekend
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)expiredPaidSubscriptionGroupCutoffTime
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)maximumNumberOfExpiredPaidSubscriptionGroups
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)maximumTimesHeadlineInPaidSubscriptionGroup
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)maximumPaidSubscriptionGroupSizeiPad
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)maximumPaidSubscriptionGroupSizeiPhone
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)optionalTopStoriesRefreshRate
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (double)minimumTrendingUnseenRatio
{
  sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (FCVideoGroupsConfig)forYouVideoGroupsConfig
{
  double result = (FCVideoGroupsConfig *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)minimumDistanceBetweenImageOnTopTiles
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)expirePinnedArticlesAfter
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  NewsCoreConfiguration.copy(with:)((uint64_t)v3);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1AFFCBCC8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (BOOL)universalLinksEnabled
{
  return 1;
}

- (NSString)embedConfigurationAssetID
{
  sub_1AFFC8E38();
  id v2 = (void *)sub_1AFFCAE68();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSArray)mediaSharingBlacklistedChannelIDs
{
  sub_1AFFC8E38();
  id v2 = (void *)sub_1AFFCB1B8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (NSString)webEmbedContentBlockers
{
  sub_1AFFC8E38();
  id v2 = (void *)sub_1AFFCAE68();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)webEmbedContentBlockerOverrides
{
  sub_1AFFC8E38();
  id v2 = (void *)sub_1AFFCAE68();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)anfRenderingConfiguration
{
  sub_1AFFC8E38();
  id v2 = (void *)sub_1AFFCAE68();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)endOfArticleFeedConfigurationResourceId
{
  sub_1AFFC8E38();
  id v2 = (void *)sub_1AFFCAE68();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)userConcernConfigurationResourceId
{
  if (*(void *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 4046])
  {
    sub_1AFFC8E38();
    id v2 = (void *)sub_1AFFCAE68();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)aiAttributionArticleString
{
  if (*(void *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 4062])
  {
    sub_1AFFC8E38();
    id v2 = (void *)sub_1AFFCAE68();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v2 = 0;
  }

  return (NSString *)v2;
}

- (FCPaidBundleConfiguration)paidBundleConfig
{
  return (FCPaidBundleConfiguration *)sub_1AFE0018C(self);
}

- (FCPaidBundleViaOfferConfig)paidBundleViaOfferConfig
{
  return (FCPaidBundleViaOfferConfig *)sub_1AFE0018C(self);
}

- (FCNewsPersonalizationConfiguration)newsPersonalizationConfiguration
{
  return (FCNewsPersonalizationConfiguration *)sub_1AFE00608((uint64_t)self, (uint64_t)a2, (Class *)0x1E4F7E5B8);
}

- (int64_t)subscriptionsPlacardGlobalMaximumPerDay
{
  int64_t result = *(void *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
                                            + 3894];
  if (result < 0) {
    __break(1u);
  }
  return result;
}

- (int64_t)subscriptionsPlacardPublisherFrequencyInSeconds
{
  double v2 = *(double *)(self + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3952);
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 < 9.22337204e18) {
    return (uint64_t)v2;
  }
LABEL_7:
  __break(1u);
  return self;
}

- (int64_t)subscriptionsGracePeriodForTokenVerificationSeconds
{
  double v2 = *(double *)(self + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3968);
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 < 9.22337204e18) {
    return (uint64_t)v2;
  }
LABEL_7:
  __break(1u);
  return self;
}

- (BOOL)hideAllPaywalls
{
  return self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3910];
}

- (BOOL)hideAlacartePaywalls
{
  return self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3911];
}

- (FCIAdConfiguration)iAdConfig
{
  sub_1AFD8F6AC(0, &qword_1EB8114A0);
  v5[0] = self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 1494];
  long long v6 = *(_OWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 1502];
  sub_1AFD5CBB4(v5);

  return (FCIAdConfiguration *)v3;
}

- (unint64_t)likeDislikeBehavior
{
  return *(void *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3918];
}

- (int64_t)autoRefreshMinimumInterval
{
  return 120;
}

- (NSArray)deprecatedSportsTopicTagIds
{
  double v2 = (void *)sub_1AFFCB1B8();

  return (NSArray *)v2;
}

- (FCPuzzlesConfiguration)puzzlesConfig
{
  return (FCPuzzlesConfiguration *)sub_1AFE00608((uint64_t)self, (uint64_t)a2, (Class *)0x1E4F7E748);
}

- (NSDictionary)articleConfig
{
  if (*(void *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 4206])
  {
    sub_1AFE05158(0, (unint64_t *)&qword_1EB819C78, MEMORY[0x1E4FAAFC8], MEMORY[0x1E4FBAEA0]);
    sub_1AFE04130();
    id v3 = self;
    uint64_t v4 = sub_1AFFCAD48();
    if (v4)
    {
      sub_1AFDFB658(v4);

      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v5 = self;
  }
  sub_1AFDF9EB4(MEMORY[0x1E4FBC860]);

LABEL_6:
  long long v6 = (void *)sub_1AFFCAC78();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v6;
}

- (NSArray)onboardingFeedIDs
{
  int64_t result = (NSArray *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)autoScrollToTopFeedTimeout
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (FCPrefetchConfiguration)prefetchConfig
{
  int64_t result = (FCPrefetchConfiguration *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)newFavoriteNotificationAlertsFrequency
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)notificationArticleCacheTimeout
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)notificationArticleWithRapidUpdatesCacheTimeout
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)widgetConfigID
{
  int64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)widgetMinimumArticleExposureDurationToBePreseenInMilliseconds
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (unsigned)widgetMinimumNumberOfTimesPreseenToBeSeen
{
  unsigned int result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (double)articleDiversificationSimilarityExpectationStart
{
  sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (double)articleDiversificationSimilarityExpectationEnd
{
  sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (double)articleDiversificationUniquePublisherExpectationSlope
{
  sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (double)articleDiversificationUniquePublisherExpectationYIntercept
{
  sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)personalizationBundleIdMappingResourceId
{
  double result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)personalizationUrlMappingResourceId
{
  double result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)personalizationWhitelistResourceId
{
  double result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)personalizationFavorabilityResourceId
{
  double result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)corryBarMaxArticleCountForArticleList
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)corryBarMaxArticleCountForSingleArticle
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (BOOL)corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers
{
  BOOL result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)exploreArticleID
{
  BOOL result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSArray)externalAnalyticsConfigurations
{
  BOOL result = (NSArray *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)stateRestorationAllowedTimeWindow
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (BOOL)terminateAppOnBackgroundAfterJoiningOrLeavingExperiment
{
  BOOL result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSArray)topStoriesPublishDates
{
  BOOL result = (NSArray *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)articleRecirculationConfigJSON
{
  BOOL result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (unint64_t)trendingStyle
{
  unint64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NTPBDiscoverMoreVideosInfo)shareDiscoverMoreVideosInfo
{
  unint64_t result = (NTPBDiscoverMoreVideosInfo *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (NSString)articleRecirculationComponentPlacementConfigJSON
{
  unint64_t result = (NSString *)sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (int64_t)articleRecirculationPopularFeedQueryTimeRange
{
  int64_t result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

- (BOOL)disableThumbnailsForArticleRecirculation
{
  BOOL result = sub_1AFFCB9A8();
  __break(1u);
  return result;
}

@end