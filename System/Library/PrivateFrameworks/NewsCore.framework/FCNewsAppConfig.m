@interface FCNewsAppConfig
+ (void)configurationWithData:(void *)a3 storefrontID:(void *)a4 preferredLanguageTags:;
+ (void)defaultConfigurationForStoreFrontID:(uint64_t)a1;
- (BOOL)adInstrumentationEnabled;
- (BOOL)aggregatesInAppXavierEnabled;
- (BOOL)aggregatesInNotificationExtensionXavierEnabled;
- (BOOL)aggregatesInWidgetsXavierEnabled;
- (BOOL)allowAnyChannelForTodayChannelGroups;
- (BOOL)appReviewRequestEnabled;
- (BOOL)articleEmbeddingsEnabled;
- (BOOL)articleEmbeddingsScoringEnabled;
- (BOOL)articleLinkBehaviorImprovementsEnabled;
- (BOOL)audioFeedConfigRequestsEnabled;
- (BOOL)autoOnboardShortcuts;
- (BOOL)checkForPaywallConfigChangesEnabled;
- (BOOL)clientSideEngagementBoostEnabled;
- (BOOL)considerAutofavoritesInMappingCandidates;
- (BOOL)corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
- (BOOL)dimNonSubscriberContentOffline;
- (BOOL)disableThumbnailsForArticleRecirculation;
- (BOOL)diversifyOptionalTopStories;
- (BOOL)enableAIAttribution;
- (BOOL)enableBadgeInSpotlightTabBar;
- (BOOL)enableCacheFallbackForArticleRecirculation;
- (BOOL)enableLocationBasedAutofavorites;
- (BOOL)enableNewsPersonalizationAutoFavorites;
- (BOOL)enableTabiAdSegments;
- (BOOL)enableTabiCohortMemberships;
- (BOOL)enableTabiMyMagazinesPersonalization;
- (BOOL)enableTabiTagScoring;
- (BOOL)fallbackToReverseChronSorting;
- (BOOL)feedDifferentiationModeEnabled;
- (BOOL)fineGrainedNewsletterManagementEnabled;
- (BOOL)forYouGroupShouldPromoteAccessibleHeadline;
- (BOOL)foregroundHeartbeatEventEnabled;
- (BOOL)foregroundHeartbeatEventShouldUseQueue;
- (BOOL)hideAlacartePaywalls;
- (BOOL)hideAllPaywalls;
- (BOOL)inAppMessagesEnabled;
- (BOOL)inFeedDebugging;
- (BOOL)isAnalyticsJitterEnabled;
- (BOOL)isArticleToolbarCompressionEnabled;
- (BOOL)isCardFeedRedesignEnabled;
- (BOOL)isDefaultConfiguration;
- (BOOL)isImprovedManagedTopicGroupingEnabled;
- (BOOL)isOrderFeedEndpointEnabled;
- (BOOL)isPrivateDataEncryptionAllowed;
- (BOOL)isPrivateDataEncryptionMigrationDesired;
- (BOOL)isPrivateDataEncryptionRequired;
- (BOOL)isPrivateDataMigrationCleanupEnabled;
- (BOOL)isSIWAOnMacEnabled;
- (BOOL)isSportsSyncingSupported;
- (BOOL)issuesNewsletterOptinEnabled;
- (BOOL)liveActivitiesEnabled;
- (BOOL)moreFromIssueEOAEnabled;
- (BOOL)moreToReadEOAEnabled;
- (BOOL)newSearchEndpointConfigEnabled;
- (BOOL)notificationAssetPrefetchingRequiresWatch;
- (BOOL)notificationEnableAssetPrefetching;
- (BOOL)offlineModeEnabled;
- (BOOL)paidBundleViaOfferEnabled;
- (BOOL)personalizationAnalyticsEnabled;
- (BOOL)personalizationEventTrackingEnabled;
- (BOOL)privateDataShouldCleanupAfterSecureSubscriptions;
- (BOOL)privateDataShouldCleanupToV4;
- (BOOL)privateDataShouldMigrateToV4;
- (BOOL)privateDataShouldSecureSubscriptions;
- (BOOL)servicesBundleCIPActivationEnabled;
- (BOOL)shouldManuallySupplementEvergreenWithIssueArticles;
- (BOOL)shouldProxyURLBucketFetch;
- (BOOL)shouldShowAlternateHeadlines;
- (BOOL)shouldShuffleReportedHeadlines;
- (BOOL)smarterMessagingEnabled;
- (BOOL)splitTopicGroups;
- (BOOL)sportsNativeAdsEnabled;
- (BOOL)sportsRecommendationHidesIgnoredTags;
- (BOOL)sportsRecordEnabled;
- (BOOL)sportsSyncingV2Enabled;
- (BOOL)statelessPersonalizationAllowedForExtensions;
- (BOOL)statelessPersonalizationEnabled;
- (BOOL)tabiBackgroundRefreshEnabled;
- (BOOL)tabiScoringInNotificationExtensionEnabled;
- (BOOL)tabiScoringInWidgetsEnabled;
- (BOOL)terminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
- (BOOL)todayFeedConfigRequestsEnabled;
- (BOOL)todayFeedEnabled;
- (BOOL)todayPerformanceAlertsEnabled;
- (BOOL)universalLinksEnabled;
- (BOOL)useAltSportsRecommendationMapping;
- (BOOL)useMultipleNativeAds;
- (BOOL)useNewsArticleSearch;
- (BOOL)useNotificationsV2;
- (BOOL)useSecureConnectionForAssets;
- (BOOL)useWelcomeSeries;
- (BOOL)userSegmentationInWidgetAllowed;
- (BOOL)widgetAnalyticsEnabled;
- (BOOL)widgetBackgroundInteractionEnabled;
- (BOOL)widgetContentPrefetchEnabled;
- (BOOL)widgetFetchOfTodayFeedLiteConfigEnabled;
- (FCAppReviewRequestConfig)appReviewRequestConfig;
- (FCArticleLinkBehaviorConfig)articleLinkBehaviorConfig;
- (FCArticleModalBrandBarConfig)articleModalBrandBarConfig;
- (FCEmbedProxyConfiguration)embedProxyConfiguration;
- (FCForYouGroupsConfiguration)forYouGroupsConfiguration;
- (FCIAdConfiguration)iAdConfig;
- (FCLaunchPresentationConfig)launchPresentationConfig;
- (FCLocationSharingUpsellConfig)locationSharingUpsellConfig;
- (FCNewsAppConfig)init;
- (FCNewsPersonalizationConfiguration)newsPersonalizationConfiguration;
- (FCNewsPlusLabelConfigGroup)newsPlusLabelConfigGroup;
- (FCNewsTabiConfiguration)newsTabiConfiguration;
- (FCNotificationsConfiguration)notificationsConfig;
- (FCOfflineDownloadsConfiguration)offlineDownloadsConfig;
- (FCOfflineDownloadsConfiguration)offlineDownloadsConfigDefault;
- (FCOfflineDownloadsConfiguration)offlineDownloadsConfigOptimized;
- (FCPaidBundleConfiguration)paidBundleConfig;
- (FCPaidBundleViaOfferConfig)paidBundleViaOfferConfig;
- (FCPeopleAlsoReadConfiguration)peopleAlsoReadConfiguration;
- (FCPersonalizationPublisherDampeningConfig)publisherDampeningConfig;
- (FCPersonalizationPublisherDampeningConfig)shadowPublisherDampeningConfig;
- (FCPrefetchConfiguration)prefetchConfig;
- (FCPuzzlesConfiguration)puzzlesConfig;
- (FCSmarterMessagingConfig)smarterMessagingConfig;
- (FCSportsFavoritesSyncModalConfig)sportsFavoritesSyncModalConfig;
- (FCSportsPrivacyConfiguration)sportsPrivacyConfiguration;
- (FCSportsUpsellConfig)sportsUpsellConfig;
- (FCStatelessPersonalizationPublisherFavorability)statelessPersonalizationPublisherFavorability;
- (FCTimesOfDayConfiguration)timesOfDayConfiguration;
- (FCTopStoriesConfiguration)topStoriesConfig;
- (FCVideoGroupsConfig)forYouVideoGroupsConfig;
- (NSArray)aLaCartePaidSubscriptionGroupWhitelistedChannelIDs;
- (NSArray)analyticsDenylistDescriptorsInternal;
- (NSArray)analyticsDenylistDescriptorsPublic;
- (NSArray)analyticsDenylistDescriptorsSeed;
- (NSArray)analyticsEventNamesInternalAllowlist;
- (NSArray)analyticsEventNamesPublicAllowlist;
- (NSArray)analyticsEventNamesSeedAllowlist;
- (NSArray)appleNewsNotificationChannelIDs;
- (NSArray)deprecatedSportsTopicTagIds;
- (NSArray)discoverNewsPlusChannelIDs;
- (NSArray)editoralRecommendedSportsTopicTagIds;
- (NSArray)editorialFallbackSportsTopicTagIds;
- (NSArray)externalAnalyticsConfigurations;
- (NSArray)freeGlobalESLArticleListIDs;
- (NSArray)freeNotificationItemListIDs;
- (NSArray)hiddenFeedIDs;
- (NSArray)liveActivityAssetServerURLs;
- (NSArray)mediaSharingBlacklistedChannelIDs;
- (NSArray)offlineModeDetectionIgnoredHosts;
- (NSArray)onboardingFeedIDs;
- (NSArray)paidGlobalESLArticleListIDs;
- (NSArray)paidNotificationItemListIDs;
- (NSArray)permanentChannelIDs;
- (NSArray)presubscribedFeedIDs;
- (NSArray)recommendedIssueAllowList;
- (NSArray)recommendedIssueDenyList;
- (NSArray)searchConfigurationProfiles;
- (NSArray)sportsSearchConfigurationProfiles;
- (NSArray)topStoriesPublishDates;
- (NSData)autoFavoritesServiceConfigurationJSONData;
- (NSData)delayedNotificationSchedulerConfigurationData;
- (NSData)delayedNotificationVendorConfigurationData;
- (NSData)notificationScoringServiceConfigurationJSONData;
- (NSDictionary)articleConfig;
- (NSDictionary)campaignReferralConfigsByID;
- (NSDictionary)channelGroupBaselineMultipliers;
- (NSDictionary)channelPaywallConfigsByChannelID;
- (NSDictionary)channelPickerConfigsByName;
- (NSDictionary)channelUpsellConfigsByChannelID;
- (NSDictionary)configDictionary;
- (NSDictionary)editorialTopicEventMapping;
- (NSDictionary)editorialTopicEventMappingProperties;
- (NSDictionary)endpointConfigsByEnvironment;
- (NSDictionary)financeURLAnalyticsAllowLists;
- (NSDictionary)languageConfigDictionary;
- (NSDictionary)localInForYouTopicTagAllowList;
- (NSDictionary)superfeedConfigOverrideResourceIDs;
- (NSDictionary)tagFeedGroupClusteringKnobOverrides;
- (NSDictionary)todayFeedGroupClusteringKnobOverrides;
- (NSNumber)currentTreatment;
- (NSString)aiAttributionArticleString;
- (NSString)anfRenderingConfiguration;
- (NSString)articleRecirculationComponentPlacementConfigJSON;
- (NSString)articleRecirculationConfigJSON;
- (NSString)audioConfigRecordID;
- (NSString)audioHistoryFeedConfigurationResourceId;
- (NSString)audioPlaylistFeedConfigurationResourceId;
- (NSString)blockedArticleLearnMoreURL;
- (NSString)breakingNewsChannelID;
- (NSString)briefingsTagID;
- (NSString)bundleChannelPickerSuggestionsTabiPackageResourceId;
- (NSString)businessAudioTagID;
- (NSString)channelFeedConfigurationResourceId;
- (NSString)channelPickerConfigurationResourceId;
- (NSString)conversionCohortsExpField;
- (NSString)description;
- (NSString)editorialChannelID;
- (NSString)editorialGemsSectionID;
- (NSString)embedConfigurationAssetID;
- (NSString)endOfArticleFeedConfigurationResourceId;
- (NSString)engagementCohortsExpField;
- (NSString)enterOfflineModeButtonTitle;
- (NSString)exitOfflineModeButtonTitle;
- (NSString)experimentalizableFieldPostfix;
- (NSString)exploreArticleID;
- (NSString)featuredStoriesTagID;
- (NSString)feedNavigationConfigJSON;
- (NSString)forYouPremiumRecordConfigID;
- (NSString)forYouRecordConfigID;
- (NSString)freeTagESLArticleListIDPrefix;
- (NSString)historyFeedConfigurationResourceId;
- (NSString)inConversationsAudioTagID;
- (NSString)issueArticleRecirculationConfig;
- (NSString)localAreasMappingResourceId;
- (NSString)locationRecommendationMappingsResourceId;
- (NSString)magazinesConfigRecordID;
- (NSString)myMagazinesTagID;
- (NSString)mySportsHighlightsTagID;
- (NSString)mySportsScoresTagID;
- (NSString)mySportsTagID;
- (NSString)newsFeedFormatConfiguration;
- (NSString)nonBundleChannelPickerSuggestionsTabiPackageResourceId;
- (NSString)offlineModeUnavailableMessage;
- (NSString)offlineStatusBannerUpsellMessage;
- (NSString)paidTagESLArticleListIDPrefix;
- (NSString)personalizationBundleIdMappingResourceId;
- (NSString)personalizationFavorabilityResourceId;
- (NSString)personalizationUrlMappingResourceId;
- (NSString)personalizationWhitelistResourceId;
- (NSString)savedFeedConfigurationResourceId;
- (NSString)savedStoriesTagID;
- (NSString)searchEndpointConfigurationResourceID;
- (NSString)searchFeedConfigurationResourceId;
- (NSString)searchMoreFeedConfigurationResourceId;
- (NSString)sectionFeedConfigurationResourceId;
- (NSString)sharedWithYouFeedLayoutConfigurationResourceId;
- (NSString)sharedWithYouTagID;
- (NSString)shortcutsConfigResourceId;
- (NSString)shortcutsCurationResourceId;
- (NSString)shortcutsTagID;
- (NSString)sportEventHighlightsTagID;
- (NSString)sportHighlightsTagID;
- (NSString)sportLeagueHighlightsTagID;
- (NSString)sportLeagueScoresTagID;
- (NSString)sportScoresTagID;
- (NSString)sportTeamHighlightsTagID;
- (NSString)sportTeamScoresTagID;
- (NSString)sportsBoxScoreConfigurationResourceId;
- (NSString)sportsBracketConfigurationResourceId;
- (NSString)sportsBracketTagID;
- (NSString)sportsConfigurationResourceId;
- (NSString)sportsFeaturedEventsResourceId;
- (NSString)sportsInjuryReportConfigurationResourceId;
- (NSString)sportsKeyPlayerConfigurationResourceId;
- (NSString)sportsLineScoreConfigurationResourceId;
- (NSString)sportsScoreConfigurationResourceId;
- (NSString)sportsStandingConfigurationResourceId;
- (NSString)sportsStandingsTagID;
- (NSString)sportsSyncingConfigurationResourceId;
- (NSString)sportsSyncingConfigurationV2ResourceId;
- (NSString)sportsTaxonomyResourceId;
- (NSString)sportsTopStoriesTagID;
- (NSString)spotlightChannelID;
- (NSString)storefrontID;
- (NSString)tagFeedLayoutConfigurationResourceId;
- (NSString)todayFeedEditionConfigJSON;
- (NSString)todayFeedKnobs;
- (NSString)topicFeedConfigurationResourceId;
- (NSString)translationMapResourceID;
- (NSString)trendingTagID;
- (NSString)userConcernConfigurationResourceId;
- (NSString)userVectorModelResourceId;
- (NSString)userVectorWhitelistResourceId;
- (NSString)webEmbedContentBlockerOverrides;
- (NSString)webEmbedContentBlockers;
- (NSString)webEmbedDataSourcesConfigurationResourceId;
- (NSString)widgetConfigID;
- (NTPBDiscoverMoreVideosInfo)shareDiscoverMoreVideosInfo;
- (double)analyticsJitterLowerBound;
- (double)analyticsJitterUpperBound;
- (double)articleBannerAdRequestThrottle;
- (double)articleDiversificationSimilarityExpectationEnd;
- (double)articleDiversificationSimilarityExpectationStart;
- (double)articleDiversificationUniquePublisherExpectationSlope;
- (double)articleDiversificationUniquePublisherExpectationYIntercept;
- (double)audioPlaylistSweepListeningPercentageThreshold;
- (double)continueReadingDismissalInterval;
- (double)delayBeforeRetryingDroppedFeeds;
- (double)derivedPersonalizationDataBalanceValue;
- (double)endOfArticleMinPaidHeadlineRatio;
- (double)feedBannerAdRequestThrottle;
- (double)feedLineHeightMultiplier;
- (double)interstitialAdLoadDelay;
- (double)interstitialAdRequestThrottle;
- (double)liveActivityScheduleDelay;
- (double)liveActivityScheduleRandomInitialDelay;
- (double)liveActivityScheduleRetryInterval;
- (double)liveActivityScheduleRetryTimeWindow;
- (double)liveActivityScheduleTimeWindow;
- (double)minMembershipForTaxonomyCandidates;
- (double)minMembershipThreshold;
- (double)minMembershipThresholdForLocalRecommendation;
- (double)minScoreThresholdForSportsRecommendations;
- (double)minimumTrendingUnseenRatio;
- (double)nativeInArticleAdRequestThrottle;
- (double)nativeInFeedAdRequestThrottle;
- (double)newsletterSubscriptionStatusCacheTimeout;
- (double)offlineModeDetectionPingInterval;
- (double)offlineModeDetectionPingTimeoutInterval;
- (double)offlineModeMinimumSecondsSinceSuccessToOffline;
- (double)offlineModeThrottleUnreliableDetectionTimeoutInterval;
- (double)prerollAdRequestThrottle;
- (double)prerollLoadingTimeout;
- (double)prerollReadyToPlayTimeout;
- (double)tagSubscriptionRepromptDelay;
- (double)todayFeedConfigEndpointTimeoutAfterCK;
- (double)todayPerformanceAlertGapExpansionThreshold;
- (double)todayPerformanceAlertPrewarmThreshold;
- (double)todayPerformanceAlertSpinnerThreshold;
- (double)widgetTelemetrySamplingRate;
- (id)analyticsEnvelopeContentTypeConfigsForEnvironment:(unint64_t)a3;
- (id)appAnalyticsAppHealthEndpointUrlForEnvironment:(unint64_t)a3;
- (id)appAnalyticsAppHeartbeatEndpointUrlForEnvironment:(unint64_t)a3;
- (id)appAnalyticsEndpointUrlForEnvironment:(unint64_t)a3;
- (id)appAnalyticsNotificationReceiptEndpointUrlForEnvironment:(unint64_t)a3;
- (id)expFieldForKey:(void *)a1;
- (id)jsonEncodableObject;
- (id)localizedStorefrontID;
- (id)paidALaCartePaywallConfigForChannelID:(id)a3;
- (id)personalizationTreatment;
- (id)todayConfigWithIdentifier:(id)a3 queueConfigs:(id)a4 backgroundColorLight:(id)a5 backgroundColorDark:(id)a6 audioIndicatorColor:(id)a7 widgetBannerConfig:(id)a8;
- (int64_t)alternateUniversalLinksResourceRefreshRate;
- (int64_t)analyticsEndpointMaxPayloadSize;
- (int64_t)appConfigRefreshRate;
- (int64_t)articleAdPrefetchLimit;
- (int64_t)articleRapidUpdatesTimeout;
- (int64_t)articleReadCountThreshold;
- (int64_t)articleRecirculationPopularFeedQueryTimeRange;
- (int64_t)audioPlaylistSweepRecencyThresholdInDays;
- (int64_t)autoRefreshMinimumInterval;
- (int64_t)autoScrollToTopFeedTimeout;
- (int64_t)bestOfferRequestTimeoutDurationInSeconds;
- (int64_t)corryBarMaxArticleCountForArticleList;
- (int64_t)corryBarMaxArticleCountForSingleArticle;
- (int64_t)criticalStorageThreshold;
- (int64_t)dailyChannelUpsellsCountLimit;
- (int64_t)emailSignupRequiredAppLaunchCount;
- (int64_t)endOfArticleExpireArticlesAfter;
- (int64_t)endOfArticleMaxInaccessiblePaidArticleCount;
- (int64_t)entitlementsCacheRecoveryAttemptDurationInSeconds;
- (int64_t)entitlementsRequestTimeoutDurationInSeconds;
- (int64_t)expirePinnedArticlesAfter;
- (int64_t)expiredPaidSubscriptionGroupCutoffTime;
- (int64_t)feedAdScreenfulsToPrefetch;
- (int64_t)forYouMaxDailyEvergreenArticlesForFreeUsers;
- (int64_t)forYouMaxDailyEvergreenArticlesForPaidUsers;
- (int64_t)liveActivityFollowedAlertsThreshold;
- (int64_t)liveActivityScheduleRetryCountMax;
- (int64_t)liveActivityScheduledAlertsThreshold;
- (int64_t)lowStorageThreshold;
- (int64_t)maxCuratedShortcutsCount;
- (int64_t)maxIssuesPerESLInventoryRequest;
- (int64_t)maxRetriesForDroppedFeeds;
- (int64_t)maxSportRecommendationsPerSport;
- (int64_t)maxSportRecommendationsWithLeagueTypeCollege;
- (int64_t)maxSuggestedShortcutsCount;
- (int64_t)maxTagESLArticleListsToQuery;
- (int64_t)maximumBundleSessionTime;
- (int64_t)maximumBundleSessionValue;
- (int64_t)maximumMastheadWelcomeMessageTime;
- (int64_t)maximumNumberOfExpiredPaidSubscriptionGroups;
- (int64_t)maximumPaidSubscriptionGroupSizeiPad;
- (int64_t)maximumPaidSubscriptionGroupSizeiPhone;
- (int64_t)maximumPremiumHeadlinesGroupSlottingTime;
- (int64_t)maximumPremiumStoriesUnlockedTipTime;
- (int64_t)maximumRetryAfterForCK;
- (int64_t)maximumTimesHeadlineInPaidSubscriptionGroup;
- (int64_t)maximumTrendingGroupSizeiPad;
- (int64_t)maximumTrendingGroupSizeiPhone;
- (int64_t)minShortcutsOnboardCount;
- (int64_t)minimumBucketGroupConfigVersion;
- (int64_t)minimumDistanceBetweenImageOnTopTiles;
- (int64_t)minimumDurationBetweenForYouGroupsWeekday;
- (int64_t)minimumDurationBetweenForYouGroupsWeekend;
- (int64_t)minimumDurationBetweenTrendingGroupsWeekday;
- (int64_t)minimumDurationBetweenTrendingGroupsWeekend;
- (int64_t)newFavoriteNotificationAlertsFrequency;
- (int64_t)newsletterSubscriptionType;
- (int64_t)notificationArticleCacheTimeout;
- (int64_t)notificationArticleWithRapidUpdatesCacheTimeout;
- (int64_t)notificationEnabledChannelsRefreshFrequency;
- (int64_t)notificationPoolAutoRefreshInterval;
- (int64_t)notificationPoolMaxAge;
- (int64_t)numberOfFetchedHeadlinesToReport;
- (int64_t)optimizedStorageAutoEnablementThreshold;
- (int64_t)optionalTopStoriesRefreshRate;
- (int64_t)savedArticlesCutoffTime;
- (int64_t)savedArticlesMaximumCountCellular;
- (int64_t)savedArticlesMaximumCountWiFi;
- (int64_t)savedArticlesOpenedCutoffTime;
- (int64_t)shortcutsCustomizeAffordanceDisplayMinLaunchCount;
- (int64_t)shortcutsCustomizeAffordanceSendToBackPositionMinLaunchCount;
- (int64_t)shortcutsMaxCount;
- (int64_t)shortcutsOnboardCount;
- (int64_t)singleChannelFeedMinFeedItemsPerRequest;
- (int64_t)singleTopicFeedMinFeedItemsPerRequest;
- (int64_t)smallWidgetSystemHoneymoonDuration;
- (int64_t)smallWidgetSystemReloadInterval;
- (int64_t)smallWidgetSystemReloadIntervalHoneymoon;
- (int64_t)smallWidgetSystemReloadJitterMax;
- (int64_t)smallWidgetSystemReloadJitterMaxHoneymoon;
- (int64_t)sportsManagementMinChildItemsCount;
- (int64_t)sportsManagementRecommendedItemsCount;
- (int64_t)stateRestorationAllowedTimeWindow;
- (int64_t)subscriptionsGlobalMeteredCount;
- (int64_t)subscriptionsGracePeriodForTokenVerificationSeconds;
- (int64_t)subscriptionsPlacardGlobalMaximumPerDay;
- (int64_t)subscriptionsPlacardPublisherFrequencyInSeconds;
- (int64_t)todayFeedLoadToCacheTimeWindow;
- (int64_t)todayPerformanceAlertsMinNewsVersion;
- (int64_t)topStoriesLocalNewsExpiration;
- (int64_t)trendingTopicsRefreshRate;
- (int64_t)widgetForYouBackgroundMinimumUpdateInterval;
- (int64_t)widgetMinimumArticleExposureDurationToBePreseenInMilliseconds;
- (int64_t)widgetSystemHoneymoonDuration;
- (int64_t)widgetSystemReloadInterval;
- (int64_t)widgetSystemReloadIntervalHoneymoon;
- (int64_t)widgetSystemReloadJitterMax;
- (int64_t)widgetSystemReloadJitterMaxHoneymoon;
- (unint64_t)bestOfBundleFeedGroupKind;
- (unint64_t)likeDislikeBehavior;
- (unint64_t)trendingStyle;
- (unsigned)widgetMinimumNumberOfTimesPreseenToBeSeen;
- (void)initWithConfigDictionary:(void *)a3 storefrontID:(void *)a4 languageConfigDictionary:;
@end

@implementation FCNewsAppConfig

void __48__FCNewsAppConfig__loadSuperfeedConfigOverrides__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__FCNewsAppConfig__loadSuperfeedConfigOverrides__block_invoke_2;
  v6[3] = &unk_1E5B4F600;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

- (NSString)newsFeedFormatConfiguration
{
  v2 = [(FCNewsAppConfig *)self configDictionary];
  id v3 = FCAppConfigurationStringValue(v2, @"newsFeedFormatConfiguration", 0);

  return (NSString *)v3;
}

- (BOOL)clientSideEngagementBoostEnabled
{
  if (NFInternalBuild())
  {
    id v3 = NewsCoreUserDefaults();
    uint64_t v4 = [v3 integerForKey:@"news.features.clientSideEngagementBoost"];

    if (v4 == 1) {
      return 1;
    }
    if (v4 == 2) {
      return 0;
    }
  }
  v6 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v7 = FCAppConfigurationIntegerValue(v6, @"clientSideEngagementBoostEnabled", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v7];
}

- (BOOL)enableTabiCohortMemberships
{
  v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"enableTabiCohortMemberships", 0);

  return v3;
}

- (BOOL)statelessPersonalizationAllowedForExtensions
{
  v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"statelessPersonalizationAllowedForExtensions", 1);

  return v3;
}

- (BOOL)aggregatesInAppXavierEnabled
{
  v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"aggregatesInXavierEnabled", 1);

  return v3;
}

uint64_t __50__FCNewsAppConfig__loadNotificationsConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"channelId"];
}

uint64_t __75__FCNewsAppConfig_languageConfigDictionaryForConfig_preferredLanguageTags___block_invoke(uint64_t a1, void *a2)
{
  return [a2 lowercaseString];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPaidALaCartePaywallConfigs, 0);
  objc_storeStrong((id *)&self->_widgetConfig, 0);
  objc_storeStrong((id *)&self->_analyticsContentTypeConfigsByContentTypeByEnvironment, 0);
  objc_storeStrong((id *)&self->_lazyPersonalizationTreatment, 0);
  objc_storeStrong((id *)&self->_superfeedConfigOverrideResourceIDs, 0);
  objc_storeStrong((id *)&self->_campaignReferralConfigsByID, 0);
  objc_storeStrong((id *)&self->_launchPresentationConfig, 0);
  objc_storeStrong((id *)&self->_channelPickerConfigsByName, 0);
  objc_storeStrong((id *)&self->_timesOfDayConfiguration, 0);
  objc_storeStrong((id *)&self->_notificationScoringServiceConfigurationJSONData, 0);
  objc_storeStrong((id *)&self->_autoFavoritesServiceConfigurationJSONData, 0);
  objc_storeStrong((id *)&self->_newsTabiConfiguration, 0);
  objc_storeStrong((id *)&self->_newsPersonalizationConfiguration, 0);
  objc_storeStrong((id *)&self->_sportsPrivacyConfiguration, 0);
  objc_storeStrong((id *)&self->_sportEventHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_sportLeagueHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_sportLeagueScoresTagID, 0);
  objc_storeStrong((id *)&self->_sportTeamHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_sportTeamScoresTagID, 0);
  objc_storeStrong((id *)&self->_sportHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_sportScoresTagID, 0);
  objc_storeStrong((id *)&self->_mySportsHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_mySportsScoresTagID, 0);
  objc_storeStrong((id *)&self->_sportsTopStoriesTagID, 0);
  objc_storeStrong((id *)&self->_mySportsTagID, 0);
  objc_storeStrong((id *)&self->_blockedArticleLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_shortcutsTagID, 0);
  objc_storeStrong((id *)&self->_sharedWithYouTagID, 0);
  objc_storeStrong((id *)&self->_myMagazinesTagID, 0);
  objc_storeStrong((id *)&self->_paidBundleConfig, 0);
  objc_storeStrong((id *)&self->_paidBundleViaOfferConfig, 0);
  objc_storeStrong((id *)&self->_locationSharingUpsellConfig, 0);
  objc_storeStrong((id *)&self->_sportsUpsellConfig, 0);
  objc_storeStrong((id *)&self->_channelPaywallConfigsByChannelID, 0);
  objc_storeStrong((id *)&self->_channelUpsellConfigsByChannelID, 0);
  objc_storeStrong((id *)&self->_shareDiscoverMoreVideosInfo, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsConfigurations, 0);
  objc_storeStrong((id *)&self->_prefetchConfig, 0);
  objc_storeStrong((id *)&self->_iAdConfig, 0);
  objc_storeStrong((id *)&self->_puzzlesConfig, 0);
  objc_storeStrong((id *)&self->_forYouGroupsConfiguration, 0);
  objc_storeStrong((id *)&self->_topStoriesConfig, 0);
  objc_storeStrong((id *)&self->_notificationsConfig, 0);
  objc_storeStrong((id *)&self->_endpointConfigsByEnvironment, 0);
  objc_storeStrong((id *)&self->_forYouVideoGroupsConfig, 0);
  objc_storeStrong((id *)&self->_languageConfigDictionary, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_offlineDownloadsConfigOptimized, 0);
  objc_storeStrong((id *)&self->_offlineDownloadsConfigDefault, 0);
  objc_storeStrong((id *)&self->_peopleAlsoReadConfiguration, 0);
  objc_storeStrong((id *)&self->_configDictionary, 0);
}

- (FCNewsTabiConfiguration)newsTabiConfiguration
{
  return self->_newsTabiConfiguration;
}

- (FCTimesOfDayConfiguration)timesOfDayConfiguration
{
  return self->_timesOfDayConfiguration;
}

- (FCPaidBundleViaOfferConfig)paidBundleViaOfferConfig
{
  return self->_paidBundleViaOfferConfig;
}

- (FCPersonalizationPublisherDampeningConfig)shadowPublisherDampeningConfig
{
  char v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v4 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"shadowPublisherDampeningConfig", 0);

  if (v4)
  {
    id v5 = [[FCPersonalizationPublisherDampeningConfig alloc] initWithConfig:v4];
  }
  else
  {
    id v5 = [(FCNewsAppConfig *)self publisherDampeningConfig];
  }
  v6 = v5;

  return v6;
}

- (FCPersonalizationPublisherDampeningConfig)publisherDampeningConfig
{
  v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"publisherDampeningConfig", 0);

  uint64_t v4 = [[FCPersonalizationPublisherDampeningConfig alloc] initWithConfig:v3];
  return v4;
}

- (FCTopStoriesConfiguration)topStoriesConfig
{
  return self->_topStoriesConfig;
}

- (int64_t)articleRapidUpdatesTimeout
{
  v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"articleRapidUpdatesTimeout", 21600);

  return v3;
}

- (FCPaidBundleConfiguration)paidBundleConfig
{
  return self->_paidBundleConfig;
}

- (void)initWithConfigDictionary:(void *)a3 storefrontID:(void *)a4 languageConfigDictionary:
{
  uint64_t v333 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_113;
  }
  v322.receiver = a1;
  v322.super_class = (Class)FCNewsAppConfig;
  v10 = objc_msgSendSuper2(&v322, sel_init);
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    v12 = (void *)v10[2];
    v10[2] = v11;

    uint64_t v13 = [v8 copy];
    v14 = (void *)v10[6];
    v10[6] = v13;

    id v291 = v9;
    uint64_t v15 = [v9 copy];
    v16 = (void *)v10[7];
    v10[7] = v15;

    id v17 = objc_alloc(MEMORY[0x1E4F81BD0]);
    v320[0] = MEMORY[0x1E4F143A8];
    v320[1] = 3221225472;
    v320[2] = __82__FCNewsAppConfig_initWithConfigDictionary_storefrontID_languageConfigDictionary___block_invoke;
    v320[3] = &unk_1E5B4C840;
    id v321 = v7;
    uint64_t v18 = [v17 initWithConstructor:v320];
    v19 = (void *)v10[49];
    v10[49] = v18;

    v20 = [v10 languageConfigDictionary];
    v21 = FCAppConfigurationDictionaryValueWithOverride(v20, @"peopleAlsoReadConfiguration", @"news.news_personalization.people_also_read_config_overrides.enabled", @"news.news_personalization.people_also_read_config_overrides.json");

    v22 = [[FCPeopleAlsoReadConfiguration alloc] initWithDictionary:v21];
    v23 = (void *)v10[3];
    v10[3] = v22;

    v24 = [FCOfflineDownloadsConfiguration alloc];
    v25 = [v10 configDictionary];
    v26 = FCAppConfigurationDictionaryValueWithDefaultValue(v25, @"offlineDownloadsConfig", 0);
    uint64_t v27 = [(FCOfflineDownloadsConfiguration *)v24 initWithDictionary:v26 optimized:0];
    v28 = (void *)v10[4];
    v10[4] = v27;

    v29 = [FCOfflineDownloadsConfiguration alloc];
    v30 = [v10 configDictionary];
    v31 = FCAppConfigurationDictionaryValueWithDefaultValue(v30, @"offlineDownloadsConfigOptimized", 0);
    uint64_t v32 = [(FCOfflineDownloadsConfiguration *)v29 initWithDictionary:v31 optimized:1];
    v33 = (void *)v10[5];
    v10[5] = v32;

    v34 = [v10 configDictionary];
    __int16 v35 = FCAppConfigurationIntegerValue(v34, @"enabledPrivateDataEncryptionLevel", 896);

    v36 = [v10 configDictionary];
    char log = FCAppConfigurationIntegerValue(v36, @"privateDataMigrationCleanupLevel", 7);

    v37 = [v10 configDictionary];
    char v38 = FCAppConfigurationIntegerValue(v37, @"privateDataSecureSubscriptionsLevel", 7);

    v39 = [v10 configDictionary];
    uint64_t v40 = FCAppConfigurationIntegerValue(v39, @"privateDataSecureSubscriptionsCleanupLevel", 0xFFFFFFFFLL);

    v41 = [v10 configDictionary];
    unsigned __int8 v42 = FCAppConfigurationIntegerValue(v41, @"privateDataEncryptionRequiredLevel", 7);

    v43 = [v10 configDictionary];
    uint64_t v44 = FCAppConfigurationIntegerValue(v43, @"privateDataMigrateToV4Level2", 0);

    [v10 configDictionary];
    id v45 = v7;
    id v46 = v8;
    v48 = v47 = v10;
    uint64_t v49 = FCAppConfigurationIntegerValue(v48, @"privateDataCleanupToV4Level2", 0);

    v293 = v46;
    v294 = v47;
    v292 = v45;
    if (NFInternalBuild())
    {
      v47[8] = (v35 & 0x480) != 0;
      v47[9] = (v35 & 0x80) != 0;
      v47[10] = log & 1;
      v47[11] = v38 & 1;
      v50 = v47;
    }
    else
    {
      v50 = v47;
      if (NFSeedBuild())
      {
        v47[8] = (v35 & 0x900) != 0;
        v47[9] = HIBYTE(v35) & 1;
        v47[10] = (log & 2) != 0;
        v47[11] = (v38 & 2) != 0;
        v42 >>= 1;
      }
      else
      {
        v47[8] = (v35 & 0x1200) != 0;
        v47[9] = (v35 & 0x200) != 0;
        v47[10] = (log & 4) != 0;
        v47[11] = (v38 & 4) != 0;
        v42 >>= 2;
      }
    }
    v50[13] = v42 & 1;
    v50[12] = +[FCFeatureEnablementChecker enabledForCurrentLevel:v40];
    v50[14] = +[FCFeatureEnablementChecker enabledForCurrentLevel:v44];
    v50[15] = +[FCFeatureEnablementChecker enabledForCurrentLevel:v49];
    v297 = [MEMORY[0x1E4F1CA60] dictionary];
    v298 = objc_opt_new();
    v51 = [v50 configDictionary];
    v52 = FCAppConfigurationArrayValueWithDefaultValue(v51, @"endpointConfigs", 0);

    long long v325 = 0u;
    long long v326 = 0u;
    long long v323 = 0u;
    long long v324 = 0u;
    obuint64_t j = v52;
    uint64_t v299 = [obj countByEnumeratingWithState:&v323 objects:v330 count:16];
    if (v299)
    {
      uint64_t v296 = *(void *)v324;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v324 != v296) {
            objc_enumerationMutation(obj);
          }
          uint64_t v308 = v53;
          v54 = *(void **)(*((void *)&v323 + 1) + 8 * v53);
          v306 = [FCEndpointConfiguration alloc];
          v316 = FCAppConfigurationStringValue(v54, @"clientApiBaseUrl", 0);
          FCAppConfigurationStringValue(v54, @"newsNotificationsBaseUrl", 0);
          os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
          v315 = FCAppConfigurationStringValue(v54, @"staticAssetBaseUrl", 0);
          v305 = FCAppConfigurationStringValue(v54, @"remoteDataSourceBaseUrl", 0);
          v304 = FCAppConfigurationStringValue(v54, @"newsletterApiBaseUrl", 0);
          v303 = FCAppConfigurationStringValue(v54, @"appAnalyticsEndpointUrl", 0);
          v314 = FCAppConfigurationStringValue(v54, @"fairPlayEndpointUrl", 0);
          v313 = FCAppConfigurationStringValue(v54, @"searchApiBaseUrl", 0);
          v312 = FCAppConfigurationStringValue(v54, @"puzzlesArchiveApiBaseUrl", 0);
          v311 = FCAppConfigurationStringValue(v54, @"appAnalyticsNotificationReceiptBaseUrl", 0);
          v310 = FCAppConfigurationStringValue(v54, @"authTokenApiBaseUrl", 0);
          v309 = FCAppConfigurationStringValue(v54, @"sportsDataVisualizationApiBaseUrl", 0);
          v302 = FCAppConfigurationStringValue(v54, @"fineGrainedNewsletterSubscriptionBaseUrl", 0);
          v301 = FCAppConfigurationStringValue(v54, @"appAnalyticsSportsEventsEndpointUrl", 0);
          v300 = FCAppConfigurationStringValue(v54, @"appHealthEventsEndpointUrl", 0);
          v55 = FCAppConfigurationStringValue(v54, @"appHeartbeatEventsEndpointUrl", 0);
          v56 = FCAppConfigurationStringValue(v54, @"ckOrderFeedBaseUrl", 0);
          v57 = FCAppConfigurationStringValue(v54, @"ckMultiFetchBaseUrl", 0);
          v58 = FCAppConfigurationStringValue(v54, @"ckRecordFetchBaseUrl", 0);
          v59 = FCAppConfigurationStringValue(v54, @"ckEdgeCachedOrderFeedBaseUrl", 0);
          v60 = FCAppConfigurationStringValue(v54, @"ckEdgeCachedMultiFetchBaseUrl", 0);
          v307 = -[FCEndpointConfiguration initWithClientAPIBaseURLString:notificationsBaseURLString:staticAssetBaseURLString:remoteDataSourceBaseURLString:newsletterAPIBaseURLString:appAnalyticsBaseURLString:fairPlayBaseURLString:searchAPIBaseURLString:puzzlesArchiveAPIBaseURLString:appAnalyticsNotificationReceiptBaseURLString:authTokenAPIBaseURLString:sportsDataVisualizationAPIBaseURLString:fineGrainedNewsletterSubscriptionBaseURLString:appAnalyticsSportsEventsBaseURLString:appAnalyticsAppHealthBaseURLString:appAnalyticsAppHeartbeatBaseURLString:ckOrderFeedBaseURLString:ckMultiFetchBaseURLString:ckRecordFetchBaseURLString:ckEdgeCachedOrderFeedBaseURLString:ckEdgeCachedMultiFetchBaseURLString:](v306, "initWithClientAPIBaseURLString:notificationsBaseURLString:staticAssetBaseURLString:remoteDataSourceBaseURLString:newsletterAPIBaseURLString:appAnalyticsBaseURLString:fairPlayBaseURLString:searchAPIBaseURLString:puzzlesArchiveAPIBaseURLString:appAnalyticsNotificationReceiptBaseURLString:authTokenAPIBaseURLString:sportsDataVisualizationAPIBaseURLString:fineGrainedNewsletterSubscriptionBaseURLString:appAnalyticsSportsEventsBaseURLString:appAnalyticsAppHealthBaseURLString:appAnalyticsAppHeartbeatBaseURLString:ckOrderFeedBaseURLString:ckMultiFetchBaseURLString:ckRecordFetchBaseURLString:ckEdgeCachedOrderFeedBaseURLString:ckEdgeCachedMultiFetchBaseURLString:", v316, loga, v315, v305, v304, v303, v314, v313, v312, v311, v310,
                   v309,
                   v302,
                   v301,
                   v300,
                   v55,
                   v56,
                   v57,
                   v58,
                   v59,
                   v60);

          v61 = FCAppConfigurationStringValue(v54, @"environment", 0);
          uint64_t v62 = FCEndpointEnvironmentForEnvironment(v61);

          v63 = [NSNumber numberWithUnsignedInteger:v62];
          [v297 setObject:v307 forKey:v63];
          v64 = (void *)FCAppConfigurationLog;
          if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_INFO))
          {
            logb = v64;
            v65 = [(FCEndpointConfiguration *)v307 clientAPIBaseURLString];
            v66 = [(FCEndpointConfiguration *)v307 notificationsBaseURLString];
            v67 = [(FCEndpointConfiguration *)v307 staticAssetBaseURLString];
            v68 = [(FCEndpointConfiguration *)v307 remoteDataSourceBaseURLString];
            v69 = [(FCEndpointConfiguration *)v307 newsletterAPIBaseURLString];
            v70 = [(FCEndpointConfiguration *)v307 appAnalyticsAppHeartbeatBaseURLString];
            *(_DWORD *)buf = 134219522;
            *(void *)&buf[4] = v62;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v65;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v66;
            LOWORD(v328[0]) = 2112;
            *(void *)((char *)v328 + 2) = v67;
            HIWORD(v328[2]) = 2112;
            *(void *)&v328[3] = v68;
            LOWORD(v328[5]) = 2112;
            *(void *)((char *)&v328[5] + 2) = v69;
            HIWORD(v328[7]) = 2112;
            v329 = v70;
            _os_log_impl(&dword_1A460D000, logb, OS_LOG_TYPE_INFO, "endpointConfig - environment: %ld, clientAPIURL: %@, notificationsURL: %@, staticAssetURL: %@, remoteDataSourcesURL: %@, newsletterURL: %@, appHeartbeatUrl: %@", buf, 0x48u);
          }
          v71 = FCAppConfigurationStringValue(v54, @"analyticsEndpointUrlsJson", 0);
          v72 = FCAppConfigurationStringValue(v54, @"analyticsEnvelopeContentTypePropJson", 0);
          v73 = FCAnalyticsEnvelopeContentTypeConfigsByContentType(v71, v72);
          [v298 setObject:v73 forKeyedSubscript:v63];

          uint64_t v53 = v308 + 1;
        }
        while (v299 != v308 + 1);
        uint64_t v299 = [obj countByEnumeratingWithState:&v323 objects:v330 count:16];
      }
      while (v299);
    }

    v74 = (void *)*((void *)v294 + 9);
    *((void *)v294 + 9) = v297;
    id v75 = v297;

    v76 = (void *)*((void *)v294 + 50);
    *((void *)v294 + 50) = v298;

    v77 = [v294 languageConfigDictionary];
    v78 = FCAppConfigurationArrayValueWithDefaultValue(v77, @"preSubscribedNotificationsChannelIds", 0);

    v79 = [v294 languageConfigDictionary];
    v80 = FCAppConfigurationArrayValueWithDefaultValue(v79, @"recommendedNotificationChannels", 0);

    v81 = objc_msgSend(v80, "fc_arrayByTransformingWithBlock:", &__block_literal_global_169);
    v82 = [[FCNotificationsConfiguration alloc] initWithPresubscribedChannelIDs:v78 recommendedNotificationChannelIDs:v81];
    v83 = (void *)*((void *)v294 + 10);
    *((void *)v294 + 10) = v82;

    v84 = [v294 languageConfigDictionary];
    v85 = FCAppConfigurationDictionaryValueWithDefaultValue(v84, @"topStoriesConfig", 0);

    v86 = [[FCTopStoriesConfiguration alloc] initWithConfigDictionary:v85];
    v87 = (void *)*((void *)v294 + 11);
    *((void *)v294 + 11) = v86;

    v88 = [v294 configDictionary];
    v89 = FCAppConfigurationStringValue(v88, @"forYouNonPersonalizedGroupsOrder", 0);

    v90 = [[FCForYouGroupsConfiguration alloc] initWithJSONConfiguration:v89];
    v91 = (void *)*((void *)v294 + 12);
    *((void *)v294 + 12) = v90;

    id v92 = v293;
    v93 = [v294 languageConfigDictionary];
    v94 = FCAppConfigurationDictionaryValueWithDefaultValue(v93, @"puzzlesConfig", 0);

    *(void *)v330 = @"143441";
    *(void *)&v330[8] = @"143455";
    v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v330 count:2];
    v96 = [[FCPuzzlesConfiguration alloc] initWithConfigDictionary:v94 storefrontID:v92 defaultSupportedStorefronts:v95];

    v97 = (void *)*((void *)v294 + 13);
    *((void *)v294 + 13) = v96;

    v98 = [v294 configDictionary];
    v99 = FCAppConfigurationDictionaryValueWithDefaultValue(v98, @"iadConfig", 0);

    v100 = [[FCIAdConfiguration alloc] initWithConfigDictionary:v99];
    v101 = (void *)*((void *)v294 + 14);
    *((void *)v294 + 14) = v100;

    v102 = [v294 configDictionary];
    v103 = FCAppConfigurationDictionaryValueWithDefaultValue(v102, @"prefetchConfig", 0);

    v104 = [[FCPrefetchConfiguration alloc] initWithConfigDictionary:v103];
    v105 = (void *)*((void *)v294 + 15);
    *((void *)v294 + 15) = v104;

    v106 = [v294 languageConfigDictionary];
    v107 = FCAppConfigurationDictionaryValueWithDefaultValue(v106, @"shareVideoPlayerConfig", 0);

    v108 = objc_opt_new();
    v109 = FCAppConfigurationStringValue(v107, @"discoverMoreVideosTitle", 0);
    [v108 setTitle:v109];

    v110 = FCAppConfigurationStringValue(v107, @"discoverMoreVideosSubtitle", 0);
    [v108 setSubtitle:v110];

    v111 = FCAppConfigurationStringValue(v107, @"discoverMoreVideosUrl", 0);
    [v108 setActionURLString:v111];

    v112 = (void *)*((void *)v294 + 17);
    *((void *)v294 + 17) = v108;

    v113 = [v294 configDictionary];
    v114 = FCAppConfigurationDictionaryValueWithDefaultValue(v113, @"widgetConfig2", 0);

    v115 = [[FCWidgetConfig alloc] initWithConfigDictionary:v114];
    v116 = (void *)*((void *)v294 + 51);
    *((void *)v294 + 51) = v115;

    v117 = [v294 languageConfigDictionary];
    v118 = FCAppConfigurationDictionaryValueWithDefaultValue(v117, @"channelPaywallConfigurations", 0);

    v119 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v118, "count"));
    memset(buf, 0, sizeof(buf));
    memset(v328, 0, sizeof(v328));
    id v120 = v118;
    uint64_t v121 = [v120 countByEnumeratingWithState:buf objects:v330 count:16];
    if (v121)
    {
      uint64_t v122 = v121;
      uint64_t v123 = **(void **)&buf[16];
      do
      {
        for (uint64_t i = 0; i != v122; ++i)
        {
          if (**(void **)&buf[16] != v123) {
            objc_enumerationMutation(v120);
          }
          uint64_t v125 = *(void *)(*(void *)&buf[8] + 8 * i);
          v126 = [FCChannelPaywallConfig alloc];
          v127 = [v120 objectForKeyedSubscript:v125];
          v128 = [(FCChannelPaywallConfig *)v126 initWithChannelID:v125 configDictionary:v127];

          [v119 setObject:v128 forKeyedSubscript:v125];
        }
        uint64_t v122 = [v120 countByEnumeratingWithState:buf objects:v330 count:16];
      }
      while (v122);
    }

    uint64_t v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v119];
    v130 = (void *)*((void *)v294 + 19);
    *((void *)v294 + 19) = v129;

    v131 = [v294 languageConfigDictionary];
    v132 = FCAppConfigurationDictionaryValueWithDefaultValue(v131, @"channelUpsellConfigurations2", 0);

    v133 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v132, "count"));
    memset(buf, 0, sizeof(buf));
    memset(v328, 0, sizeof(v328));
    id v134 = v132;
    uint64_t v135 = [v134 countByEnumeratingWithState:buf objects:v330 count:16];
    if (v135)
    {
      uint64_t v136 = v135;
      uint64_t v137 = **(void **)&buf[16];
      do
      {
        for (uint64_t j = 0; j != v136; ++j)
        {
          if (**(void **)&buf[16] != v137) {
            objc_enumerationMutation(v134);
          }
          uint64_t v139 = *(void *)(*(void *)&buf[8] + 8 * j);
          v140 = [FCChannelUpsellConfig alloc];
          v141 = [v134 objectForKeyedSubscript:v139];
          v142 = [(FCChannelUpsellConfig *)v140 initWithChannelID:v139 configDictionary:v141];

          [v133 setObject:v142 forKeyedSubscript:v139];
        }
        uint64_t v136 = [v134 countByEnumeratingWithState:buf objects:v330 count:16];
      }
      while (v136);
    }

    uint64_t v143 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v133];
    v144 = v294;
    v145 = (void *)*((void *)v294 + 18);
    *((void *)v294 + 18) = v143;

    v146 = [v294 languageConfigDictionary];
    v147 = FCAppConfigurationDictionaryValueWithDefaultValue(v146, @"sportsUpsellConfiguration", 0);

    v148 = [[FCSportsUpsellConfig alloc] initWithConfigDictionary:v147];
    v149 = (void *)*((void *)v294 + 20);
    *((void *)v294 + 20) = v148;

    v150 = [v294 languageConfigDictionary];
    v151 = FCAppConfigurationDictionaryValueWithDefaultValue(v150, @"locationSharingUpsellConfiguration", 0);

    v152 = [[FCLocationSharingUpsellConfig alloc] initWithConfigDictionary:v151];
    v153 = (void *)*((void *)v294 + 21);
    *((void *)v294 + 21) = v152;

    v154 = [v294 languageConfigDictionary];
    v155 = FCAppConfigurationDictionaryValueWithDefaultValue(v154, @"paidBundleViaOfferConfiguration", 0);

    v156 = [[FCPaidBundleViaOfferConfig alloc] initWithConfigDictionary:v155];
    v157 = (void *)*((void *)v294 + 22);
    *((void *)v294 + 22) = v156;

    id v158 = v92;
    v159 = [v294 languageConfigDictionary];
    v160 = FCAppConfigurationDictionaryValueWithDefaultValue(v159, @"paidBundleConfig", 0);

    v161 = [FCPaidBundleConfiguration alloc];
    v162 = -[FCNewsAppConfig localizedStorefrontID](v294);
    *(void *)v330 = @"143441";
    *(void *)&v330[8] = @"143455";
    *(void *)&v330[16] = @"143444";
    v331 = @"143460";
    v163 = [MEMORY[0x1E4F1C978] arrayWithObjects:v330 count:4];
    uint64_t v164 = [(FCPaidBundleConfiguration *)v161 initWithConfigDictionary:v160 storefrontID:v158 localizedStorefrontID:v162 defaultSupportedStoreFronts:v163];

    v165 = (void *)*((void *)v294 + 23);
    *((void *)v294 + 23) = v164;

    if (NFInternalBuild())
    {
      v166 = NewsCoreUserDefaults();
      if ([v166 integerForKey:@"news.features.statelessPersonalization"] == 1)
      {
        v167 = [v294 configDictionary];
        v168 = FCAppConfigurationDictionaryValueWithDefaultValue(v167, @"newsPersonalizationConfiguration", 0);

        if (!v168)
        {
          v169 = FCStatelessPersonalizationLog;
          if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v330 = 0;
            _os_log_impl(&dword_1A460D000, v169, OS_LOG_TYPE_DEFAULT, "Stateless Personalization Enabled, but not personalization configuration was specified, falling back to default", v330, 2u);
          }
          uint64_t v170 = +[FCNewsPersonalizationConfiguration defaultConfiguration];
          v171 = (void *)*((void *)v294 + 40);
          *((void *)v294 + 40) = v170;
          goto LABEL_47;
        }
      }
      else
      {
      }
    }
    if (NFInternalBuild()
      && ([v294 configDictionary],
          v172 = objc_claimAutoreleasedReturnValue(),
          FCAppConfigurationDictionaryValueWithDefaultValue(v172, @"internalNewsPersonalizationConfiguration", 0), v173 = objc_claimAutoreleasedReturnValue(), v173, v172, v173))
    {
      v174 = FCStatelessPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v330 = 0;
        _os_log_impl(&dword_1A460D000, v174, OS_LOG_TYPE_DEFAULT, "Loading internal news personalization configuration", v330, 2u);
      }
      v175 = [FCNewsPersonalizationConfiguration alloc];
      v176 = [v294 configDictionary];
      v171 = v176;
      v177 = @"internalNewsPersonalizationConfiguration";
    }
    else
    {
      v178 = FCStatelessPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v330 = 0;
        _os_log_impl(&dword_1A460D000, v178, OS_LOG_TYPE_DEFAULT, "Loading news personalization configuration", v330, 2u);
      }
      v175 = [FCNewsPersonalizationConfiguration alloc];
      v176 = [v294 configDictionary];
      v171 = v176;
      v177 = @"newsPersonalizationConfiguration";
    }
    v179 = FCAppConfigurationDictionaryValueWithDefaultValue(v176, (uint64_t)v177, 0);
    uint64_t v180 = [(FCNewsPersonalizationConfiguration *)v175 initWithDictionary:v179];
    v181 = (void *)*((void *)v294 + 40);
    *((void *)v294 + 40) = v180;

LABEL_47:
    if (!NFInternalBuild()) {
      goto LABEL_57;
    }
    NewsCoreUserDefaults();
    v182 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();
    if ([(FCNewsTabiConfiguration *)v182 BOOLForKey:@"news.news_personalization.tabi.allow_tabi_configuration_from_user_defaults"])
    {
      v183 = NewsCoreUserDefaults();
      v184 = [v183 stringForKey:@"news.news_personalization.tabi.custom_tabi_configuration"];

      if (!v184) {
        goto LABEL_57;
      }
      v185 = NewsCoreUserDefaults();
      v182 = [v185 stringForKey:@"news.news_personalization.tabi.custom_tabi_configuration"];

      v186 = FCTabiConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v330 = 138543362;
        *(void *)&v330[4] = v182;
        _os_log_impl(&dword_1A460D000, v186, OS_LOG_TYPE_DEFAULT, "Found tabi config override enabled, specified as %{public}@", v330, 0xCu);
      }
      v187 = (void *)MEMORY[0x1E4F28D90];
      v188 = [(FCNewsTabiConfiguration *)v182 dataUsingEncoding:4];
      *(void *)buf = 0;
      v189 = [v187 JSONObjectWithData:v188 options:0 error:buf];
      id v190 = *(id *)buf;

      if (v190)
      {
        v191 = (void *)FCTabiConfigurationLog;
        v144 = v294;
        if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
        {
          v289 = v191;
          v290 = [v190 localizedDescription];
          *(_DWORD *)v330 = 138543362;
          *(void *)&v330[4] = v290;
          _os_log_error_impl(&dword_1A460D000, v289, OS_LOG_TYPE_ERROR, "Failed to decode tabi config into Dictionary, proceeding as if no override is in place %{public}@", v330, 0xCu);
        }
      }
      else
      {
        v195 = [[FCNewsTabiConfiguration alloc] initWithDictionary:v189];
        v278 = [(FCNewsTabiConfiguration *)v195 packageAssetIDs];
        uint64_t v279 = [v278 count];

        if (v279)
        {
          objc_storeStrong((id *)v294 + 41, v195);
          v280 = FCTabiConfigurationLog;
          if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT))
          {
            v281 = v280;
            v282 = [(FCNewsTabiConfiguration *)v195 version];
            *(_DWORD *)v330 = 138543362;
            *(void *)&v330[4] = v282;
            _os_log_impl(&dword_1A460D000, v281, OS_LOG_TYPE_DEFAULT, "Loaded user defaults tabi configuration version %{public}@", v330, 0xCu);

            v280 = FCTabiConfigurationLog;
          }
          v144 = v294;
          if (!os_log_type_enabled(v280, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_75;
          }
          uint64_t v283 = *((void *)v294 + 41);
          *(_DWORD *)v330 = 138543362;
          *(void *)&v330[4] = v283;
          v209 = v280;
          goto LABEL_74;
        }
        v288 = FCTabiConfigurationLog;
        if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v330 = 0;
          _os_log_error_impl(&dword_1A460D000, v288, OS_LOG_TYPE_ERROR, "Defaults specified tabi configuration didn't specify any packageAssetIDs, proceeding as if no override is in place", v330, 2u);
        }

        v144 = v294;
      }
    }
LABEL_57:
    v192 = [v144 languageConfigDictionary];
    FCAppConfigurationDictionaryValueWithDefaultValue(v192, @"newsTabiConfigurationV2", 0);
    v182 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();

    v193 = [v144 languageConfigDictionary];
    FCAppConfigurationDictionaryValueWithDefaultValue(v193, @"newsTabiConfigurationDawnburstD", 0);
    v189 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();

    v194 = [v144 languageConfigDictionary];
    FCAppConfigurationDictionaryValueWithDefaultValue(v194, @"newsTabiConfigurationDawnburstB", 0);
    v195 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();

    if (v182)
    {
      v196 = FCTabiConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v330 = 0;
        _os_log_impl(&dword_1A460D000, v196, OS_LOG_TYPE_DEFAULT, "Found V2 tabi configuration", v330, 2u);
      }
      v197 = [FCNewsTabiConfiguration alloc];
      v198 = v182;
    }
    else if (v189)
    {
      v199 = FCTabiConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v330 = 0;
        _os_log_impl(&dword_1A460D000, v199, OS_LOG_TYPE_DEFAULT, "Found DawnburstD tabi configuration", v330, 2u);
      }
      v197 = [FCNewsTabiConfiguration alloc];
      v198 = v189;
    }
    else
    {
      v200 = FCTabiConfigurationLog;
      BOOL v201 = os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT);
      if (!v195)
      {
        if (v201)
        {
          *(_WORD *)v330 = 0;
          _os_log_impl(&dword_1A460D000, v200, OS_LOG_TYPE_DEFAULT, "Using baseline tabi configuration", v330, 2u);
        }
        v284 = [FCNewsTabiConfiguration alloc];
        v203 = [v144 languageConfigDictionary];
        v285 = FCAppConfigurationDictionaryValueWithDefaultValue(v203, @"newsTabiConfiguration", MEMORY[0x1E4F1CC08]);
        uint64_t v286 = [(FCNewsTabiConfiguration *)v284 initWithDictionary:v285];
        v287 = (void *)v144[41];
        v144[41] = v286;

        goto LABEL_70;
      }
      if (v201)
      {
        *(_WORD *)v330 = 0;
        _os_log_impl(&dword_1A460D000, v200, OS_LOG_TYPE_DEFAULT, "Found DawnburstB tabi configuration", v330, 2u);
      }
      v197 = [FCNewsTabiConfiguration alloc];
      v198 = v195;
    }
    uint64_t v202 = [(FCNewsTabiConfiguration *)v197 initWithDictionary:v198];
    v203 = (void *)v144[41];
    v144[41] = v202;
LABEL_70:

    v204 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      v205 = (void *)v144[41];
      v206 = v204;
      v207 = [v205 version];
      *(_DWORD *)v330 = 138543362;
      *(void *)&v330[4] = v207;
      _os_log_impl(&dword_1A460D000, v206, OS_LOG_TYPE_DEFAULT, "Loaded tabi configuration version %{public}@", v330, 0xCu);

      v204 = FCAppConfigurationLog;
    }
    if (!os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_75;
    }
    uint64_t v208 = v144[41];
    *(_DWORD *)v330 = 138543362;
    *(void *)&v330[4] = v208;
    v209 = v204;
LABEL_74:
    _os_log_impl(&dword_1A460D000, v209, OS_LOG_TYPE_DEFAULT, "Full configuration %{public}@", v330, 0xCu);
LABEL_75:

    v210 = [v144 languageConfigDictionary];
    v211 = FCAppConfigurationDictionaryValueWithDefaultValue(v210, @"channelPickerConfigurations", 0);

    v212 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v211, "count"));
    memset(buf, 0, sizeof(buf));
    memset(v328, 0, sizeof(v328));
    id v213 = v211;
    uint64_t v214 = [v213 countByEnumeratingWithState:buf objects:v330 count:16];
    if (v214)
    {
      uint64_t v215 = v214;
      uint64_t v216 = **(void **)&buf[16];
      do
      {
        for (uint64_t k = 0; k != v215; ++k)
        {
          if (**(void **)&buf[16] != v216) {
            objc_enumerationMutation(v213);
          }
          uint64_t v218 = *(void *)(*(void *)&buf[8] + 8 * k);
          v219 = [FCChannelPickerConfig alloc];
          v220 = [v213 objectForKeyedSubscript:v218];
          v221 = [(FCChannelPickerConfig *)v219 initWithPickerID:v218 configDictionary:v220];

          [v212 setObject:v221 forKeyedSubscript:v218];
        }
        uint64_t v215 = [v213 countByEnumeratingWithState:buf objects:v330 count:16];
      }
      while (v215);
    }

    uint64_t v222 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v212];
    v223 = (void *)*((void *)v294 + 45);
    *((void *)v294 + 45) = v222;

    v224 = [v294 configDictionary];
    v225 = FCAppConfigurationDictionaryValueWithDefaultValue(v224, @"launchPresentationConfigV2", 0);

    v226 = [[FCLaunchPresentationConfig alloc] initWithConfigDictionary:v225];
    v227 = (void *)*((void *)v294 + 46);
    *((void *)v294 + 46) = v226;

    v228 = [v294 languageConfigDictionary];
    v229 = FCAppConfigurationDictionaryValueWithDefaultValue(v228, @"campaignReferralConfigurations", 0);

    v230 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v229, "count"));
    memset(buf, 0, sizeof(buf));
    memset(v328, 0, sizeof(v328));
    id v231 = v229;
    uint64_t v232 = [v231 countByEnumeratingWithState:buf objects:v330 count:16];
    if (v232)
    {
      uint64_t v233 = v232;
      uint64_t v234 = **(void **)&buf[16];
      do
      {
        for (uint64_t m = 0; m != v233; ++m)
        {
          if (**(void **)&buf[16] != v234) {
            objc_enumerationMutation(v231);
          }
          uint64_t v236 = *(void *)(*(void *)&buf[8] + 8 * m);
          v237 = [FCCampaignReferralConfig alloc];
          v238 = [v231 objectForKeyedSubscript:v236];
          v239 = [(FCCampaignReferralConfig *)v237 initWithCampaignID:v236 configDictionary:v238];

          [v230 setObject:v239 forKeyedSubscript:v236];
        }
        uint64_t v233 = [v231 countByEnumeratingWithState:buf objects:v330 count:16];
      }
      while (v233);
    }

    uint64_t v240 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v230];
    v10 = v294;
    v241 = (void *)*((void *)v294 + 47);
    *((void *)v294 + 47) = v240;

    if (NFInternalBuild()
      && ([v294 configDictionary],
          v242 = objc_claimAutoreleasedReturnValue(),
          FCAppConfigurationDictionaryValueWithDefaultValue(v242, @"timesOfDayConfiguration", 0),
          v243 = objc_claimAutoreleasedReturnValue(),
          v243,
          v242,
          !v243))
    {
      v276 = FCStatelessPersonalizationLog;
      id v7 = v292;
      id v8 = v293;
      id v9 = v291;
      if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v330 = 0;
        _os_log_impl(&dword_1A460D000, v276, OS_LOG_TYPE_DEFAULT, "See an internal build with no times of day configuration in the app config, falling back to default", v330, 2u);
      }
      uint64_t v277 = +[FCTimesOfDayConfiguration defaultConfiguration];
      v245 = (void *)*((void *)v294 + 44);
      *((void *)v294 + 44) = v277;
    }
    else
    {
      v244 = [FCTimesOfDayConfiguration alloc];
      v245 = [v294 configDictionary];
      v246 = FCAppConfigurationDictionaryValueWithDefaultValue(v245, @"timesOfDayConfiguration", 0);
      uint64_t v247 = [(FCTimesOfDayConfiguration *)v244 initWithDictionary:v246];
      v248 = (void *)*((void *)v294 + 44);
      *((void *)v294 + 44) = v247;

      id v7 = v292;
      id v8 = v293;
      id v9 = v291;
    }

    v249 = [v294 languageConfigDictionary];
    v250 = FCAppConfigurationDictionaryValueWithDefaultValue(v249, @"superfeedConfigOverrides", 0);

    v251 = (void *)MEMORY[0x1E4F1C9E8];
    *(void *)v330 = MEMORY[0x1E4F143A8];
    *(void *)&v330[8] = 3221225472;
    *(void *)&v330[16] = __48__FCNewsAppConfig__loadSuperfeedConfigOverrides__block_invoke;
    v331 = (__CFString *)&unk_1E5B4BF78;
    id v332 = v250;
    id v252 = v250;
    uint64_t v253 = objc_msgSend(v251, "fc_dictionary:", v330);
    v254 = (void *)*((void *)v294 + 48);
    *((void *)v294 + 48) = v253;

    v255 = [v294 languageConfigDictionary];
    v256 = FCAppConfigurationDictionaryValueWithDefaultValue(v255, @"autoFavoritesServiceConfiguration", 0);

    if (v256)
    {
      id v257 = v256;
      *(void *)buf = 0;
      v258 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v257 options:0 error:buf];
      id v259 = *(id *)buf;
      v260 = FCAutoFavoritesServiceLog;
      if (v259)
      {
        if (os_log_type_enabled((os_log_t)FCAutoFavoritesServiceLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v330 = 138543362;
          *(void *)&v330[4] = v259;
          _os_log_error_impl(&dword_1A460D000, v260, OS_LOG_TYPE_ERROR, "Encountered error when encoding auto favorites service configuration as data, storing empty configuration. Error=%{public}@", v330, 0xCu);
        }
        id v261 = [@"{}" dataUsingEncoding:4];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)FCAutoFavoritesServiceLog, OS_LOG_TYPE_DEFAULT))
        {
          v262 = v260;
          uint64_t v263 = [v258 length];
          *(_DWORD *)v330 = 134218242;
          *(void *)&v330[4] = v263;
          *(_WORD *)&v330[12] = 2114;
          *(void *)&v330[14] = v257;
          _os_log_impl(&dword_1A460D000, v262, OS_LOG_TYPE_DEFAULT, "Successfully encoded %lu bytes for auto favorites service configuration %{public}@", v330, 0x16u);
        }
        id v261 = v258;
      }
      v264 = (void *)*((void *)v294 + 42);
      *((void *)v294 + 42) = v261;
    }
    else
    {
      *(void *)v330 = MEMORY[0x1E4F143A8];
      *(void *)&v330[8] = 3221225472;
      *(void *)&v330[16] = __57__FCNewsAppConfig__loadAutoFavoritesServiceConfiguration__block_invoke;
      v331 = (__CFString *)&unk_1E5B4C018;
      id v332 = v294;
      __57__FCNewsAppConfig__loadAutoFavoritesServiceConfiguration__block_invoke((uint64_t)v330);
    }

    v265 = [v294 languageConfigDictionary];
    v266 = FCAppConfigurationDictionaryValueWithDefaultValue(v265, @"notificationScoringServiceConfiguration", 0);

    if (v266)
    {
      id v267 = v266;
      *(void *)buf = 0;
      v268 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v267 options:0 error:buf];
      id v269 = *(id *)buf;
      v270 = FCNotificationsLog;
      if (v269)
      {
        if (os_log_type_enabled((os_log_t)FCNotificationsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v330 = 138543362;
          *(void *)&v330[4] = v269;
          _os_log_error_impl(&dword_1A460D000, v270, OS_LOG_TYPE_ERROR, "Encountered error when encoding notification scoring service configuration as data, storing empty configuration. Error=%{public}@", v330, 0xCu);
        }
        id v271 = [@"{}" dataUsingEncoding:4];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
        {
          v272 = v270;
          uint64_t v273 = [v268 length];
          *(_DWORD *)v330 = 134218242;
          *(void *)&v330[4] = v273;
          *(_WORD *)&v330[12] = 2114;
          *(void *)&v330[14] = v267;
          _os_log_impl(&dword_1A460D000, v272, OS_LOG_TYPE_DEFAULT, "Successfully encoded %lu bytes for notification scoring service configuration %{public}@", v330, 0x16u);
        }
        id v271 = v268;
      }
      v274 = (void *)*((void *)v294 + 43);
      *((void *)v294 + 43) = v271;
    }
    else
    {
      *(void *)v330 = MEMORY[0x1E4F143A8];
      *(void *)&v330[8] = 3221225472;
      *(void *)&v330[16] = __63__FCNewsAppConfig__loadNotificationScoringServiceConfiguration__block_invoke;
      v331 = (__CFString *)&unk_1E5B4C018;
      id v332 = v294;
      __63__FCNewsAppConfig__loadNotificationScoringServiceConfiguration__block_invoke((uint64_t)v330);
    }
  }
LABEL_113:

  return v10;
}

- (NSDictionary)languageConfigDictionary
{
  return self->_languageConfigDictionary;
}

- (int64_t)appConfigRefreshRate
{
  v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"appConfigRefreshRate", 3600);

  return v3;
}

- (BOOL)isDefaultConfiguration
{
  v2 = [(FCNewsAppConfig *)self configDictionary];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSDictionary)configDictionary
{
  return self->_configDictionary;
}

- (id)localizedStorefrontID
{
  if (a1)
  {
    v2 = [a1 storefrontID];
    BOOL v3 = [a1 languageConfigDictionary];
    uint64_t v4 = FCAppConfigurationStringValue(v3, @"languageTag", &stru_1EF8299B8);
    id v5 = [v4 lowercaseString];

    if ([v2 isEqualToString:@"143455"]
      && [v5 isEqualToString:@"fr-ca"])
    {
      uint64_t v6 = [NSString stringWithFormat:@"%@-%@", v2, v5];

      v2 = (void *)v6;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

+ (void)configurationWithData:(void *)a3 storefrontID:(void *)a4 preferredLanguageTags:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v40 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "data");
    *(_DWORD *)buf = 136315906;
    v61 = "+[FCNewsAppConfig configurationWithData:storefrontID:preferredLanguageTags:]";
    __int16 v62 = 2080;
    v63 = "FCNewsAppConfig.m";
    __int16 v64 = 1024;
    int v65 = 171;
    __int16 v66 = 2114;
    v67 = v40;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "preferredLanguageTags");
    *(_DWORD *)buf = 136315906;
    v61 = "+[FCNewsAppConfig configurationWithData:storefrontID:preferredLanguageTags:]";
    __int16 v62 = 2080;
    v63 = "FCNewsAppConfig.m";
    __int16 v64 = 1024;
    int v65 = 172;
    __int16 v66 = 2114;
    v67 = v41;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (v6
    && ([MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:0],
        (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v46 = v7;
    id v47 = v6;
    id v10 = v9;
    id v45 = v8;
    id v11 = v8;
    self;
    v12 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v13 = FCAppConfigurationArrayValueWithDefaultValue(v10, @"languageConfigs", 0);
    uint64_t v44 = v10;
    v14 = FCAppConfigurationStringValue(v10, @"fallbackLanguageTag", 0);
    v50 = [v14 lowercaseString];

    v43 = v11;
    unsigned __int8 v42 = objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", &__block_literal_global_28);
    uint64_t v49 = [v13 firstObject];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = v13;
    uint64_t v15 = [obj countByEnumeratingWithState:&v55 objects:buf count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v56 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v20 = FCAppConfigurationStringValue(v19, @"languageTag", &stru_1EF8299B8);
          v21 = [v20 lowercaseString];

          [v12 setObject:v19 forKeyedSubscript:v21];
          v22 = __75__FCNewsAppConfig_languageConfigDictionaryForConfig_preferredLanguageTags___block_invoke_2(v21);
          v23 = [v12 objectForKeyedSubscript:v22];

          if (!v23) {
            [v12 setObject:v19 forKeyedSubscript:v22];
          }
          if ([v21 isEqualToString:v50])
          {
            id v24 = v19;

            uint64_t v49 = v24;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v55 objects:buf count:16];
      }
      while (v16);
    }

    if ([v12 count])
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v25 = v42;
      id v26 = v42;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v52;
        while (2)
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v52 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v51 + 1) + 8 * j);
            uint64_t v32 = __75__FCNewsAppConfig_languageConfigDictionaryForConfig_preferredLanguageTags___block_invoke_2(v31);
            uint64_t v33 = [v12 objectForKeyedSubscript:v31];
            if (v33
              || ([v12 objectForKeyedSubscript:v32], (uint64_t v33 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v34 = (void *)v33;

              goto LABEL_34;
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v51 objects:v59 count:16];
          v34 = 0;
          if (v28) {
            continue;
          }
          break;
        }
      }
      else
      {
        v34 = 0;
      }
LABEL_34:
    }
    else
    {
      v34 = 0;
      v25 = v42;
    }
    if (v34) {
      v37 = v34;
    }
    else {
      v37 = v49;
    }
    id v38 = v37;

    __int16 v35 = v44;
    id v6 = v47;
    id v8 = v45;
    if (v38)
    {
      id v7 = v46;
      v36 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:]([FCNewsAppConfig alloc], v44, v46, v38);
    }
    else
    {
      v36 = 0;
      id v7 = v46;
    }
  }
  else
  {
    __int16 v35 = 0;
    v36 = 0;
  }

  return v36;
}

id __75__FCNewsAppConfig_languageConfigDictionaryForConfig_preferredLanguageTags___block_invoke_2(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@"-"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [v1 substringToIndex:v2];
  }
  uint64_t v4 = v3;

  return v4;
}

- (double)offlineModeMinimumSecondsSinceSuccessToOffline
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"offlineModeMinimumSecondsSinceSuccessToOffline", 10.0);

  return v3;
}

- (NSArray)offlineModeDetectionIgnoredHosts
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"offlineModeDetectionIgnoredHosts", &unk_1EF8D8A90);

  return (NSArray *)v3;
}

- (int64_t)shortcutsMaxCount
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"shortcutsMaxCount", 8);

  return v3;
}

- (id)personalizationTreatment
{
  if (self) {
    self = (FCNewsAppConfig *)self->_lazyPersonalizationTreatment;
  }
  return (id)[(FCNewsAppConfig *)self value];
}

- (BOOL)adInstrumentationEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"adInstrumentationEnabled", 0);

  return v3;
}

- (FCSportsPrivacyConfiguration)sportsPrivacyConfiguration
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"sportsPrivacyConfiguration", 0);

  uint64_t v4 = [[FCSportsPrivacyConfiguration alloc] initWithConfigDictionary:v3];
  return v4;
}

- (int64_t)entitlementsRequestTimeoutDurationInSeconds
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"entitlementsRequestTimeoutDurationInSeconds", 5);

  return v3;
}

- (FCOfflineDownloadsConfiguration)offlineDownloadsConfig
{
  int64_t v3 = NewsCoreUserDefaults();
  if ([v3 BOOLForKey:@"optimized_storage_enabled"]) {
    [(FCNewsAppConfig *)self offlineDownloadsConfigOptimized];
  }
  else {
  uint64_t v4 = [(FCNewsAppConfig *)self offlineDownloadsConfigDefault];
  }

  return (FCOfflineDownloadsConfiguration *)v4;
}

- (FCOfflineDownloadsConfiguration)offlineDownloadsConfigDefault
{
  return self->_offlineDownloadsConfigDefault;
}

- (BOOL)foregroundHeartbeatEventEnabled
{
  if (NFInternalBuild())
  {
    int64_t v3 = NewsCoreUserDefaults();
    uint64_t v4 = [v3 integerForKey:@"news.features.foregroundHeartbeatEventEnabled"];

    if (v4 == 1) {
      return 1;
    }
    if (v4 == 2) {
      return 0;
    }
  }
  id v6 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v7 = FCAppConfigurationIntegerValue(v6, @"foregroundHeartbeatEventEnabled2", 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v7];
}

- (BOOL)personalizationEventTrackingEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"personalizationEventTrackingEnabled2", 0);

  if (!NFInternalBuild()) {
    goto LABEL_4;
  }
  uint64_t v4 = NewsCoreUserDefaults();
  uint64_t v5 = [v4 integerForKey:@"news.features.personalizationEventTracking"];

  if (v5 == 2) {
    return 0;
  }
  if (v5 == 1) {
    return 1;
  }
LABEL_4:
  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (int64_t)stateRestorationAllowedTimeWindow
{
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"news.demo.allow_long_state_restoration"];

  if (v4) {
    return 86400;
  }
  id v6 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v7 = FCAppConfigurationIntegerValue(v6, @"stateRestorationAllowedTimeWindow", 7200);

  return v7;
}

- (BOOL)enableNewsPersonalizationAutoFavorites
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"enableNewsPersonalizationAutoFavorites", 0);

  if (NFInternalBuild())
  {
    char v4 = NewsCoreUserDefaults();
    uint64_t v5 = [v4 integerForKey:@"news.features.enableNewsPersonalizationAutoFavorites"];

    if (v5 == 1)
    {
      return 1;
    }
    else if (v5 == 2)
    {
      return 0;
    }
  }
  return v3;
}

- (int64_t)todayFeedLoadToCacheTimeWindow
{
  if (!NFInternalBuild()) {
    goto LABEL_11;
  }
  char v3 = NewsCoreUserDefaults();
  if (([v3 BOOLForKey:@"enable_config_overrides"] & 1) == 0)
  {

LABEL_11:
    id v7 = [(FCNewsAppConfig *)self configDictionary];
    uint64_t v8 = FCAppConfigurationIntegerValue(v7, @"todayFeedLoadToCacheTimeWindow", 7200);
    goto LABEL_12;
  }
  objc_opt_class();
  char v4 = NewsCoreUserDefaults();
  uint64_t v5 = [v4 objectForKey:@"override_today_feed_load_to_cache_time_window"];
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = [v7 integerValue];
LABEL_12:
  int64_t v9 = v8;

  return v9;
}

- (int64_t)newsletterSubscriptionType
{
  uint64_t v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"newsletterConfig", 0);

  int64_t v4 = FCAppConfigurationIntegerValue(v3, @"newsletterSubscriptionType", 2);
  return v4;
}

- (double)newsletterSubscriptionStatusCacheTimeout
{
  uint64_t v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"newsletterConfig", 0);

  double v4 = (double)FCAppConfigurationIntegerValue(v3, @"newsletterSubscriptionStatusCacheTimeout", 86400);
  return v4;
}

- (BOOL)personalizationAnalyticsEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"personalizationAnalytics", 0);

  if (!NFInternalBuild()) {
    goto LABEL_4;
  }
  double v4 = NewsCoreUserDefaults();
  uint64_t v5 = [v4 integerForKey:@"news.features.personalizationAnalytics"];

  if (v5 == 2) {
    return 0;
  }
  if (v5 == 1) {
    return 1;
  }
LABEL_4:
  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)fallbackToReverseChronSorting
{
  if (NFInternalBuild())
  {
    uint64_t v3 = NewsCoreUserDefaults();
    uint64_t v4 = [v3 integerForKey:@"news.features.fallbackToReverseChronSorting"];

    if (v4 == 1) {
      return 1;
    }
    if (v4 == 2) {
      return 0;
    }
  }
  id v6 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v7 = FCAppConfigurationIntegerValue(v6, @"fallbackToReverseChronSorting", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v7];
}

- (BOOL)enableTabiTagScoring
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"enableTabiTagScoring", 0);

  if (NFInternalBuild())
  {
    uint64_t v4 = NewsCoreUserDefaults();
    uint64_t v5 = [v4 integerForKey:@"news.features.enableTabiTagScoring"];

    if (v5 == 1)
    {
      return 1;
    }
    else if (v5 == 2)
    {
      return 0;
    }
  }
  return v3;
}

- (BOOL)articleEmbeddingsScoringEnabled
{
  if (NFInternalBuild())
  {
    char v3 = NewsCoreUserDefaults();
    uint64_t v4 = [v3 integerForKey:@"news.features.articleEmbeddingsScoring"];

    if (v4 == 1) {
      return 1;
    }
    if (v4 == 2) {
      return 0;
    }
  }
  id v6 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v7 = FCAppConfigurationIntegerValue(v6, @"articleEmbeddingsScoringEnabled", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v7];
}

- (BOOL)statelessPersonalizationEnabled
{
  if (NFInternalBuild())
  {
    char v3 = NewsCoreUserDefaults();
    uint64_t v4 = [v3 integerForKey:@"news.features.statelessPersonalization"];

    if (v4 == 1) {
      return 1;
    }
    if (v4 == 2) {
      return 0;
    }
  }
  id v6 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v7 = FCAppConfigurationIntegerValue(v6, @"statelessPersonalizationEnabled2", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v7];
}

- (id)expFieldForKey:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (NFInternalBuild())
    {
      uint64_t v4 = NewsCoreUserDefaults();
      int v5 = [v4 BOOLForKey:@"use_cached_exp_fields"];

      if (!v5)
      {
        id v10 = [a1 languageConfigDictionary];
        uint64_t v8 = FCAppConfigurationStringValue(v10, (uint64_t)v3, 0);

        id v11 = NewsCoreUserDefaults();
        id v6 = v11;
        if (v8) {
          [v11 setObject:v8 forKey:v3];
        }
        else {
          [v11 removeObjectForKey:v3];
        }
        goto LABEL_7;
      }
      id v6 = NewsCoreUserDefaults();
      uint64_t v7 = [v6 stringForKey:v3];
    }
    else
    {
      id v6 = [a1 languageConfigDictionary];
      uint64_t v7 = FCAppConfigurationStringValue(v6, (uint64_t)v3, 0);
    }
    uint64_t v8 = (void *)v7;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (FCNewsPersonalizationConfiguration)newsPersonalizationConfiguration
{
  return self->_newsPersonalizationConfiguration;
}

- (BOOL)useSecureConnectionForAssets
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"useSecureConnectionForAssets", 1);

  return v3;
}

- (NSDictionary)endpointConfigsByEnvironment
{
  return self->_endpointConfigsByEnvironment;
}

- (int64_t)maximumRetryAfterForCK
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maximumRetryAfterForCK", 3600);

  return v3;
}

- (BOOL)isOrderFeedEndpointEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"orderFeedEnabledLevel", 7);

  if (NFInternalBuild())
  {
    uint64_t v4 = 1;
  }
  else
  {
    int v5 = NFSeedBuild();
    uint64_t v4 = 4;
    if (v5) {
      uint64_t v4 = 2;
    }
  }
  return (v4 & v3) != 0;
}

- (NSString)experimentalizableFieldPostfix
{
  uint64_t v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v3 = FCAppConfigurationStringValue(v2, @"experimentalizableFieldPostfix", 0);

  return (NSString *)v3;
}

- (NSNumber)currentTreatment
{
  return 0;
}

- (BOOL)articleEmbeddingsEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"articleEmbeddingsEnabled", 0);

  if (!NFInternalBuild()) {
    goto LABEL_4;
  }
  uint64_t v4 = NewsCoreUserDefaults();
  uint64_t v5 = [v4 integerForKey:@"news.features.articleEmbeddingsEnabled"];

  if (v5 == 2) {
    return 0;
  }
  if (v5 == 1) {
    return 1;
  }
LABEL_4:
  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (FCStatelessPersonalizationPublisherFavorability)statelessPersonalizationPublisherFavorability
{
  uint64_t v3 = [FCStatelessPersonalizationPublisherFavorability alloc];
  uint64_t v4 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v5 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"statelessPersonalizationPublisherFavorability", 0);
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v8 = [(FCStatelessPersonalizationPublisherFavorability *)v3 initWithArray:v7];

  return v8;
}

- (FCPuzzlesConfiguration)puzzlesConfig
{
  return self->_puzzlesConfig;
}

- (NSString)engagementCohortsExpField
{
  return (NSString *)-[FCNewsAppConfig expFieldForKey:](self, @"engagementCohortsExpField");
}

- (NSString)conversionCohortsExpField
{
  return (NSString *)-[FCNewsAppConfig expFieldForKey:](self, @"conversionCohortsExpField");
}

- (NSArray)deprecatedSportsTopicTagIds
{
  uint64_t v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  uint64_t v4 = FCAppConfigurationArrayValueWithDefaultValue(v3, @"deprecatedSportsTopicTagIds", 0);
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (FCPrefetchConfiguration)prefetchConfig
{
  return self->_prefetchConfig;
}

- (FCIAdConfiguration)iAdConfig
{
  return self->_iAdConfig;
}

- (double)analyticsJitterUpperBound
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"analyticsJitterUpperBound", 600.0);

  return v3;
}

- (double)analyticsJitterLowerBound
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"analyticsJitterLowerBound", -600.0);

  return v3;
}

- (BOOL)shouldShowAlternateHeadlines
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"shouldShowAlternateHeadlines", 1);

  return v3;
}

- (BOOL)isAnalyticsJitterEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"analyticsJitterEnabledLevel", 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (NSString)todayFeedEditionConfigJSON
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationStringValue(v2, @"todayFeedEditionConfigJson", 0);

  return (NSString *)v3;
}

- (NSArray)analyticsDenylistDescriptorsInternal
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"analyticsDenylistDescriptorsInternal", 0);
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (BOOL)smarterMessagingEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"smarterMessagingEnabledLevel", 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)appReviewRequestEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"appReviewRequestEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (FCSmarterMessagingConfig)smarterMessagingConfig
{
  uint64_t v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"smarterMessagingConfig", 0);

  uint64_t v4 = [[FCSmarterMessagingConfig alloc] initWithDictionary:v3];
  return v4;
}

FCPersonalizationTreatment *__82__FCNewsAppConfig_initWithConfigDictionary_storefrontID_languageConfigDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [FCPersonalizationTreatment alloc];
  uint64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(*(void **)(a1 + 32), @"personalizationTreatment", 0);
  uint64_t v4 = [(FCPersonalizationTreatment *)v2 initWithPersonalizationTreatmentDictionary:v3];

  return v4;
}

- (int64_t)subscriptionsGlobalMeteredCount
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"subscriptionsGlobalMeteredCount", 30);

  return v3;
}

- (int64_t)feedAdScreenfulsToPrefetch
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"feedAdScreenfulsToPrefetch", 3);

  return v3;
}

- (BOOL)enableTabiAdSegments
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"enableTabiAdSegments", 0);

  return v3;
}

- (int64_t)bestOfferRequestTimeoutDurationInSeconds
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"bestOfferRequestTimeoutDurationInSeconds", 5);

  return v3;
}

- (BOOL)autoOnboardShortcuts
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"autoOnboardShortcuts", 0);

  return v3;
}

- (int64_t)articleAdPrefetchLimit
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"articleAdPrefetchLimit", 3);

  return v3;
}

- (double)prerollAdRequestThrottle
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"prerollAdRequestThrottle", 1.0);

  return v3;
}

- (double)nativeInFeedAdRequestThrottle
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"nativeInFeedAdRequestThrottle", 1.0);

  return v3;
}

- (double)nativeInArticleAdRequestThrottle
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"nativeInArticleAdRequestThrottle", 1.0);

  return v3;
}

- (double)interstitialAdRequestThrottle
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"interstitialAdRequestThrottle", 1.0);

  return v3;
}

- (double)feedBannerAdRequestThrottle
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"feedBannerAdRequestThrottle", 1.0);

  return v3;
}

- (double)articleBannerAdRequestThrottle
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"articleBannerAdRequestThrottle", 1.0);

  return v3;
}

- (NSDictionary)financeURLAnalyticsAllowLists
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"financeURLAnalyticsAllowLists", 0);

  return (NSDictionary *)v3;
}

- (NSString)embedConfigurationAssetID
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationStringValue(v2, @"anfEmbedConfigurationAsset", 0);

  return (NSString *)v3;
}

- (BOOL)useWelcomeSeries
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"useWelcomeSeriesEnabledLevel", 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)sportsSyncingV2Enabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"sportsSyncingV2EnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)offlineModeEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"offlineModeEnabledLevel", 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)liveActivitiesEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"liveActivitiesEnabledLevel", 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)inFeedDebugging
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"inFeedDebuggingLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)inAppMessagesEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"inAppMessagesEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)feedDifferentiationModeEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"feedDifferentiationModeEnabledLevel", 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)enableAIAttribution
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"enableAIAttributionEnabledLevelV2", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (NSArray)topStoriesPublishDates
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"topStoriesPublishTimeIntervals", 0);

  uint64_t v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_2187);

  return (NSArray *)v4;
}

- (id)appAnalyticsAppHeartbeatEndpointUrlForEnvironment:(unint64_t)a3
{
  uint64_t v5 = [(FCNewsAppConfig *)self endpointConfigsByEnvironment];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = [v7 appAnalyticsAppHeartbeatBaseURLString];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CB10]);
    id v10 = [v7 appAnalyticsAppHeartbeatBaseURLString];
    id v11 = (void *)[v9 initWithString:v10];
  }
  else
  {
    id v11 = [(FCNewsAppConfig *)self appAnalyticsEndpointUrlForEnvironment:a3];
  }

  return v11;
}

- (NSString)personalizationWhitelistResourceId
{
  uint64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v4 = FCAppConfigurationStringValue(v3, @"personalizationWhitelistResourceId", 0);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(FCNewsAppConfig *)self configDictionary];
    FCAppConfigurationStringValue(v7, @"personalizationWhitelistResourceId", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)personalizationUrlMappingResourceId
{
  uint64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v4 = FCAppConfigurationStringValue(v3, @"personalizationUrlMappingResourceId", 0);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(FCNewsAppConfig *)self configDictionary];
    FCAppConfigurationStringValue(v7, @"personalizationUrlMappingResourceId", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)personalizationFavorabilityResourceId
{
  uint64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v4 = FCAppConfigurationStringValue(v3, @"personalizationPublisherFavorabilityScoresResourceId", 0);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(FCNewsAppConfig *)self configDictionary];
    FCAppConfigurationStringValue(v7, @"personalizationPublisherFavorabilityScoresResourceId", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)personalizationBundleIdMappingResourceId
{
  uint64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v4 = FCAppConfigurationStringValue(v3, @"personalizationBundleIdMappingResourceId", 0);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(FCNewsAppConfig *)self configDictionary];
    FCAppConfigurationStringValue(v7, @"personalizationBundleIdMappingResourceId", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (BOOL)foregroundHeartbeatEventShouldUseQueue
{
  if (NFInternalBuild()
    && (NewsCoreUserDefaults(),
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKey:@"news.features.foregroundHeartbeatEventShouldUseQueue"],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    uint64_t v5 = NewsCoreUserDefaults();
    char v6 = [v5 BOOLForKey:@"news.features.foregroundHeartbeatEventShouldUseQueue"];
  }
  else
  {
    uint64_t v5 = [(FCNewsAppConfig *)self configDictionary];
    char v6 = FCAppConfigurationBoolValue(v5, @"foregroundHeartbeatEventShouldUseQueue", 1);
  }
  BOOL v7 = v6;

  return v7;
}

- (NSDictionary)todayFeedGroupClusteringKnobOverrides
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NewsCoreUserDefaults();
  int v4 = [v3 BOOLForKey:@"news.news_personalization.cluster_config_overrides.enabled"];

  if (!NFInternalBuild() || !v4) {
    goto LABEL_9;
  }
  uint64_t v5 = NewsCoreUserDefaults();
  char v6 = [v5 stringForKey:@"news.news_personalization.cluster_config_overrides.json"];

  if (![v6 length])
  {
LABEL_8:

LABEL_9:
    char v6 = [(FCNewsAppConfig *)self languageConfigDictionary];
    uint64_t v8 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"todayFeedGroupClusteringKnobOverrides", 0);
    goto LABEL_10;
  }
  BOOL v7 = [v6 dataUsingEncoding:4];
  id v13 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v13];
  id v9 = v13;
  if (v9)
  {
    id v10 = v9;
    id v11 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v10;
      _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "Failed to parse debug override value for todayFeedGroupClusteringKnobOverrides error: %@", buf, 0xCu);
    }

    goto LABEL_8;
  }

LABEL_10:
  return (NSDictionary *)v8;
}

- (BOOL)checkForPaywallConfigChangesEnabled
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"checkForPaywallConfigChangesEnabled", 0);

  return v3;
}

- (int64_t)autoRefreshMinimumInterval
{
  uint64_t v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"autoRefreshMinimumInterval", 120);

  return v3;
}

- (FCNewsAppConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCNewsAppConfig init]";
    __int16 v9 = 2080;
    id v10 = "FCNewsAppConfig.m";
    __int16 v11 = 1024;
    int v12 = 152;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  int64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNewsAppConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (void)defaultConfigurationForStoreFrontID:(uint64_t)a1
{
  id v2 = a2;
  self;
  int64_t v3 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:]([FCNewsAppConfig alloc], 0, v2, 0);

  return v3;
}

- (int64_t)optimizedStorageAutoEnablementThreshold
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"optimizedStorageAutoEnablementThreshold", 3000000000);

  return v3;
}

void __48__FCNewsAppConfig__loadSuperfeedConfigOverrides__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v5 = [a3 objectForKeyedSubscript:@"resourceId"];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

void __57__FCNewsAppConfig__loadAutoFavoritesServiceConfiguration__block_invoke(uint64_t a1)
{
  id v2 = FCAutoFavoritesServiceLog;
  if (os_log_type_enabled((os_log_t)FCAutoFavoritesServiceLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Found nil auto favorites service configuration, storing empty configuration", v6, 2u);
  }
  uint64_t v3 = [@"{}" dataUsingEncoding:4];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 336);
  *(void *)(v4 + 336) = v3;
}

void __63__FCNewsAppConfig__loadNotificationScoringServiceConfiguration__block_invoke(uint64_t a1)
{
  id v2 = FCAutoFavoritesServiceLog;
  if (os_log_type_enabled((os_log_t)FCAutoFavoritesServiceLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Found nil notification scoring service configuration, storing empty configuration", v6, 2u);
  }
  uint64_t v3 = [@"{}" dataUsingEncoding:4];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 344);
  *(void *)(v4 + 344) = v3;
}

- (NSData)delayedNotificationSchedulerConfigurationData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"delayedNotificationSchedulerConfiguration", 0);

  if (v3)
  {
    id v4 = v3;
    id v14 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v14];
    id v6 = v14;
    BOOL v7 = FCNotificationsLog;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)FCNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = (uint64_t)v6;
        _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "Encountered error when encoding delayed notification scheduler configuration as data, storing empty configuration. Error=%{public}@", buf, 0xCu);
      }
      id v8 = [@"{}" dataUsingEncoding:4];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = v7;
        uint64_t v12 = [v5 length];
        *(_DWORD *)buf = 134218242;
        uint64_t v16 = v12;
        __int16 v17 = 2114;
        id v18 = v4;
        _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Successfully encoded %lu bytes for delayed notification scheduler configuration %{public}@", buf, 0x16u);
      }
      id v8 = v5;
    }
    id v10 = v8;
  }
  else
  {
    __int16 v9 = FCNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Found nil delayed notification scheduler configuration, returning empty configuration", buf, 2u);
    }
    id v10 = [@"{}" dataUsingEncoding:4];
  }

  return (NSData *)v10;
}

- (NSData)delayedNotificationVendorConfigurationData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"delayedNotificationVendorConfiguration", 0);

  if (v3)
  {
    id v4 = v3;
    id v14 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v14];
    id v6 = v14;
    BOOL v7 = FCNotificationsLog;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)FCNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = (uint64_t)v6;
        _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "Encountered error when encoding delayed notification vendor configuration as data, storing empty configuration. Error=%{public}@", buf, 0xCu);
      }
      id v8 = [@"{}" dataUsingEncoding:4];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = v7;
        uint64_t v12 = [v5 length];
        *(_DWORD *)buf = 134218242;
        uint64_t v16 = v12;
        __int16 v17 = 2114;
        id v18 = v4;
        _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Successfully encoded %lu bytes for delayed notification vendor configuration %{public}@", buf, 0x16u);
      }
      id v8 = v5;
    }
    id v10 = v8;
  }
  else
  {
    __int16 v9 = FCNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Found nil delayed notification vendor configuration, returning empty configuration", buf, 2u);
    }
    id v10 = [@"{}" dataUsingEncoding:4];
  }

  return (NSData *)v10;
}

- (NSDictionary)localInForYouTopicTagAllowList
{
  uint64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v4 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"localInForYouTopicTagAllowList", 0);

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__FCNewsAppConfig_localInForYouTopicTagAllowList__block_invoke;
    v8[3] = &unk_1E5B4F628;
    v8[4] = self;
    __49__FCNewsAppConfig_localInForYouTopicTagAllowList__block_invoke((uint64_t)v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  return (NSDictionary *)v6;
}

id __49__FCNewsAppConfig_localInForYouTopicTagAllowList__block_invoke(uint64_t a1)
{
  id v2 = FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Found nil for local in for you topic tag allow list, returning default", v5, 2u);
  }
  if (*(void *)(a1 + 32)) {
    uint64_t v3 = &unk_1EF8D9768;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (int64_t)trendingTopicsRefreshRate
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"trendingTopicsRefreshRate", 3600);

  return v3;
}

- (int64_t)dailyChannelUpsellsCountLimit
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"dailyChannelUpsellsCountLimit", 3);

  return v3;
}

- (int64_t)minShortcutsOnboardCount
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minShortcutsOnboardCount", 4);

  return v3;
}

- (int64_t)shortcutsOnboardCount
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"shortcutsOnboardCount", 6);

  return v3;
}

- (int64_t)maxCuratedShortcutsCount
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxCuratedShortcutsCount", 1);

  return v3;
}

- (int64_t)maxSuggestedShortcutsCount
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxSuggestedShortcutsCount", 5);

  return v3;
}

- (int64_t)shortcutsCustomizeAffordanceDisplayMinLaunchCount
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"shortcutsCustomizeAffordanceDisplayMinLaunchCount", 2);

  return v3;
}

- (int64_t)shortcutsCustomizeAffordanceSendToBackPositionMinLaunchCount
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"shortcutsCustomizeAffordanceSendToBackPositionMinLaunchCount", 15);

  return v3;
}

- (FCNotificationsConfiguration)notificationsConfig
{
  return self->_notificationsConfig;
}

- (int64_t)notificationEnabledChannelsRefreshFrequency
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"notificationEnabledChannelsRefreshFrequency", 604800);

  return v3;
}

- (int64_t)savedArticlesCutoffTime
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"savedArticlesCutoffTime", 15552000);

  return v3;
}

- (int64_t)savedArticlesOpenedCutoffTime
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"savedArticlesOpenedCutoffTime", 21600);

  return v3;
}

- (int64_t)savedArticlesMaximumCountWiFi
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"savedArticlesMaximumCountWifi", 100);

  return v3;
}

- (int64_t)savedArticlesMaximumCountCellular
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"savedArticlesMaximumCountCellular", 10);

  return v3;
}

- (int64_t)maximumBundleSessionValue
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxBundleSessionValue", 10);

  return v3;
}

- (int64_t)maximumBundleSessionTime
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxBundleSessionTime", 86400);

  return v3;
}

- (int64_t)maximumMastheadWelcomeMessageTime
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxMastheadWelcomeMessageTime", 604800);

  return v3;
}

- (int64_t)maximumPremiumHeadlinesGroupSlottingTime
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxPremiumHeadlinesGroupSlottingTime", 604800);

  return v3;
}

- (int64_t)maximumPremiumStoriesUnlockedTipTime
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxPremiumStoriesUnlockedTipTime", 604800);

  return v3;
}

- (NSString)blockedArticleLearnMoreURL
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"blockedArticleLearnMoreURL", 0);

  return (NSString *)v3;
}

- (NSArray)presubscribedFeedIDs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"preSubscribedFeedIds", 0);

  return (NSArray *)v3;
}

- (NSArray)permanentChannelIDs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"permanentChannelIds", 0);

  return (NSArray *)v3;
}

- (NSArray)appleNewsNotificationChannelIDs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"appleNewsNotificationChannelIds", 0);

  return (NSArray *)v3;
}

- (BOOL)isPrivateDataEncryptionAllowed
{
  return self->_privateDataEncryptionAllowed;
}

- (BOOL)isPrivateDataEncryptionMigrationDesired
{
  return self->_privateDataEncryptionMigrationDesired;
}

- (BOOL)isPrivateDataMigrationCleanupEnabled
{
  return self->_privateDataMigrationCleanupEnabled;
}

- (BOOL)privateDataShouldSecureSubscriptions
{
  return self->_privateDataShouldSecureSubscriptions;
}

- (BOOL)privateDataShouldCleanupAfterSecureSubscriptions
{
  return self->_privateDataShouldCleanupAfterSecureSubscriptions;
}

- (BOOL)isPrivateDataEncryptionRequired
{
  return self->_privateDataEncryptionRequired;
}

- (NSString)breakingNewsChannelID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"breakingNewsChannelId", 0);

  return (NSString *)v3;
}

- (NSString)briefingsTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"briefingsTagId", 0);

  return (NSString *)v3;
}

- (NSString)trendingTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"trendingTagId", 0);

  return (NSString *)v3;
}

- (NSString)featuredStoriesTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"featuredStoriesTagId", 0);

  return (NSString *)v3;
}

- (NSString)savedStoriesTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"savedStoriesTagId", 0);

  return (NSString *)v3;
}

- (NSString)myMagazinesTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"myMagazinesTagId", 0);

  return (NSString *)v3;
}

- (NSString)sharedWithYouTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sharedWithYouTagId", 0);

  return (NSString *)v3;
}

- (NSString)shortcutsTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"shortcutsTagId", 0);

  return (NSString *)v3;
}

- (NSString)mySportsTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"mySportsTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportsTopStoriesTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportsTopStoriesTagId", 0);

  return (NSString *)v3;
}

- (NSString)mySportsScoresTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"mySportsScoresTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportScoresTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportScoresTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportTeamScoresTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportTeamScoresTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportLeagueScoresTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportLeagueScoresTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportsStandingsTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportLeagueStandingsTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportsBracketTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportBracketTagId", 0);

  return (NSString *)v3;
}

- (NSString)mySportsHighlightsTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"mySportsHighlightsTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportHighlightsTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportHighlightsTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportTeamHighlightsTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportTeamHighlightsTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportLeagueHighlightsTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportLeagueHighlightsTagId", 0);

  return (NSString *)v3;
}

- (NSString)sportEventHighlightsTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sportEventHighlightsTagId", 0);

  return (NSString *)v3;
}

- (NSString)editorialChannelID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"appleEditorialChannelId", 0);

  return (NSString *)v3;
}

- (NSString)spotlightChannelID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"spotlightChannelId", 0);

  return (NSString *)v3;
}

- (NSString)editorialGemsSectionID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"editorialGemsSectionId", 0);

  return (NSString *)v3;
}

- (double)feedLineHeightMultiplier
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"feedLineHeightMultiplier", 1.0);

  return v3;
}

- (NSArray)aLaCartePaidSubscriptionGroupWhitelistedChannelIDs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"paidALaCarteSubscriptionGroupWhitelistedChannelIds", 0);
  id v4 = v3;
  if (!v3) {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)paidALaCartePaywallConfigForChannelID:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!self->_cachedPaidALaCartePaywallConfigs)
  {
    id v24 = v4;
    id v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v7 = [(FCNewsAppConfig *)self languageConfigDictionary];
    id v8 = FCAppConfigurationDictionaryValueWithDefaultValue(v7, @"paidALaCartePaywallConfigs2", 0);

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v15 = [FCPaidALaCartePaywallConfig alloc];
          uint64_t v16 = [v9 objectForKeyedSubscript:v14];
          __int16 v17 = [(FCPaidALaCartePaywallConfig *)v15 initWithChannelID:v14 configDictionary:v16];

          id v18 = [(FCPaidALaCartePaywallConfig *)v17 channelID];
          uint64_t v19 = [v18 length];

          if (v19)
          {
            v20 = [(FCPaidALaCartePaywallConfig *)v17 channelID];
            [(NSDictionary *)v6 setObject:v17 forKeyedSubscript:v20];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    cachedPaidALaCartePaywallConfigs = self->_cachedPaidALaCartePaywallConfigs;
    self->_cachedPaidALaCartePaywallConfigs = v6;

    id v5 = v24;
  }
  if ([v5 length])
  {
    v22 = [(NSDictionary *)self->_cachedPaidALaCartePaywallConfigs objectForKeyedSubscript:v5];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSString)todayFeedKnobs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationStringValue(v2, @"todayFeedKnobs", @"{}");

  return (NSString *)v3;
}

- (NSArray)hiddenFeedIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationStringValue(v2, @"hiddenFeedId", 0);

  if (v3)
  {
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (FCForYouGroupsConfiguration)forYouGroupsConfiguration
{
  return self->_forYouGroupsConfiguration;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekday
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumDurationBetweenForYouGroupsWeekday", 28800);

  return v3;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekend
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumDurationBetweenForYouGroupsWeekend", 14400);

  return v3;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekday
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumDurationBetweenTrendingGroupsWeekday", 28800);

  return v3;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekend
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumDurationBetweenTrendingGroupsWeekend", 14400);

  return v3;
}

- (int64_t)expiredPaidSubscriptionGroupCutoffTime
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"expiredPaidSubscriptionGroupCutoffTime", 0);

  return v3;
}

- (int64_t)maximumNumberOfExpiredPaidSubscriptionGroups
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxExpiredPaidSubscriptionGroupCount", 0);

  return v3;
}

- (int64_t)maximumTimesHeadlineInPaidSubscriptionGroup
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxTimesHeadlineInPaidSubscriptionGroup", 0);

  return v3;
}

- (int64_t)maximumPaidSubscriptionGroupSizeiPad
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxPaidSubscriptionGroupSizeIPad", 0);

  return v3;
}

- (int64_t)maximumPaidSubscriptionGroupSizeiPhone
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxPaidSubscriptionGroupSizeIPhone", 0);

  return v3;
}

- (BOOL)diversifyOptionalTopStories
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  BOOL v3 = FCAppConfigurationIntegerValue(v2, @"diversifyOptionalTopStories", 1) != 0;

  return v3;
}

- (int64_t)optionalTopStoriesRefreshRate
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"optionalTopStoriesRefreshRate", 14400);

  return v3;
}

- (double)minimumTrendingUnseenRatio
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"minimumTrendingUnseenRatio", 0.5);

  return v3;
}

- (FCVideoGroupsConfig)forYouVideoGroupsConfig
{
  forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  if (!forYouVideoGroupsConfig)
  {
    id v4 = [(FCNewsAppConfig *)self configDictionary];
    id v5 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"forYouVideoGroupsConfig", 0);

    if (v5)
    {
      id v6 = [[FCVideoGroupsConfig alloc] initWithConfigDictionary:v5];
      BOOL v7 = self->_forYouVideoGroupsConfig;
      self->_forYouVideoGroupsConfig = v6;
    }
    forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  }
  return forYouVideoGroupsConfig;
}

- (double)endOfArticleMinPaidHeadlineRatio
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"endOfArticleMinPaidHeadlineRatio", 0.25);

  return v3;
}

- (int64_t)endOfArticleMaxInaccessiblePaidArticleCount
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"endOfArticleMaxInaccessiblePaidArticles", 2);

  return v3;
}

- (int64_t)endOfArticleExpireArticlesAfter
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"endOfArticleExpireArticlesAfter", 7776000);

  return v3;
}

- (NSString)endOfArticleFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"endOfArticleFeedConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (int64_t)minimumDistanceBetweenImageOnTopTiles
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumDistanceBetweenImageOnTopTiles", 4);

  return v3;
}

- (NSString)nonBundleChannelPickerSuggestionsTabiPackageResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"nonBundleChannelPickerSuggestionsTabiPackageResourceId", 0);

  return (NSString *)v3;
}

- (NSString)bundleChannelPickerSuggestionsTabiPackageResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"bundleChannelPickerSuggestionsTabiPackageResourceId", 0);

  return (NSString *)v3;
}

- (NSString)forYouRecordConfigID
{
  self;
  if (qword_1EB5D1130 != -1) {
    dispatch_once(&qword_1EB5D1130, &__block_literal_global_2694);
  }
  id v3 = (id)_MergedGlobals_150;
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = -[FCNewsAppConfig localizedStorefrontID](self);
    self;
    if (qword_1EB5D1160 != -1) {
      dispatch_once(&qword_1EB5D1160, &__block_literal_global_2706);
    }
    id v6 = (id)qword_1EB5D1158;
    BOOL v7 = [v6 objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [NSString stringWithFormat:@"Y-%@-en", @"143441"];
    }
    uint64_t v10 = v9;

    uint64_t v11 = [(FCNewsAppConfig *)self languageConfigDictionary];
    FCAppConfigurationStringValue(v11, @"forYouConfigId", v10);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (NSString)forYouPremiumRecordConfigID
{
  self;
  if (qword_1EB5D1140 != -1) {
    dispatch_once(&qword_1EB5D1140, &__block_literal_global_2696);
  }
  id v3 = (id)qword_1EB5D1138;
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = -[FCNewsAppConfig localizedStorefrontID](self);
    self;
    if (qword_1EB5D1170 != -1) {
      dispatch_once(&qword_1EB5D1170, &__block_literal_global_2717);
    }
    id v6 = (id)qword_1EB5D1168;
    BOOL v7 = [v6 objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [NSString stringWithFormat:@"YP-%@-en", @"143441"];
    }
    uint64_t v10 = v9;

    uint64_t v11 = [(FCNewsAppConfig *)self languageConfigDictionary];
    FCAppConfigurationStringValue(v11, @"forYouPremiumConfigId", v10);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (NSString)audioConfigRecordID
{
  id v3 = -[FCNewsAppConfig localizedStorefrontID](self);
  self;
  if (qword_1EB5D11A0 != -1) {
    dispatch_once(&qword_1EB5D11A0, &__block_literal_global_2732);
  }
  id v4 = (id)qword_1EB5D1198;
  id v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"U-%@-en", @"143441"];
  }
  id v8 = v7;

  id v9 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v10 = FCAppConfigurationStringValue(v9, @"audioConfigId", v8);

  return (NSString *)v10;
}

- (NSArray)freeGlobalESLArticleListIDs
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v4 = FCAppConfigurationStringValue(v3, @"freeEvergreenArticleListId", 0);

  id v5 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v6 = FCAppConfigurationStringValue(v5, @"freeEvergreenArticleListId2", v4);

  id v7 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v8 = v7;
  if (v6)
  {
    v12[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v10 = FCAppConfigurationArrayValueWithDefaultValue(v8, @"freeEvergreenArticleListIds", v9);
  }
  else
  {
    uint64_t v10 = FCAppConfigurationArrayValueWithDefaultValue(v7, @"freeEvergreenArticleListIds", MEMORY[0x1E4F1CBF0]);
  }

  return (NSArray *)v10;
}

- (NSArray)paidGlobalESLArticleListIDs
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v4 = FCAppConfigurationStringValue(v3, @"paidEvergreenArticleListId", 0);

  id v5 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v6 = FCAppConfigurationStringValue(v5, @"paidEvergreenArticleListId2", v4);

  id v7 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v8 = v7;
  if (v6)
  {
    v12[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v10 = FCAppConfigurationArrayValueWithDefaultValue(v8, @"paidEvergreenArticleListIds", v9);
  }
  else
  {
    uint64_t v10 = FCAppConfigurationArrayValueWithDefaultValue(v7, @"paidEvergreenArticleListIds", MEMORY[0x1E4F1CBF0]);
  }

  return (NSArray *)v10;
}

- (NSString)freeTagESLArticleListIDPrefix
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v3 = FCAppConfigurationStringValue(v2, @"freeTagEvergreenArticleListIdPrefix", 0);

  return (NSString *)v3;
}

- (NSString)paidTagESLArticleListIDPrefix
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v3 = FCAppConfigurationStringValue(v2, @"paidTagEvergreenArticleListIdPrefix", 0);

  return (NSString *)v3;
}

- (int64_t)maxTagESLArticleListsToQuery
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxTagEvergreenArticleListsToQuery", 30);

  return v3;
}

- (BOOL)shouldManuallySupplementEvergreenWithIssueArticles
{
  int64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v4 = FCAppConfigurationArrayValueWithDefaultValue(v3, @"freeEvergreenArticleListIds", 0);
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(FCNewsAppConfig *)self languageConfigDictionary];
    id v7 = FCAppConfigurationArrayValueWithDefaultValue(v6, @"paidEvergreenArticleListIds", 0);
    BOOL v5 = v7 == 0;
  }
  return v5;
}

- (int64_t)forYouMaxDailyEvergreenArticlesForFreeUsers
{
  int64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v4 = FCAppConfigurationIntegerValue(v3, @"forYouMaxDailyEvergreenArticlesForFreeUsers", 30);

  BOOL v5 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v6 = FCAppConfigurationIntegerValue(v5, @"forYouMaxDailyEvergreenArticlesForFreeUsers2", v4);

  return v6;
}

- (int64_t)forYouMaxDailyEvergreenArticlesForPaidUsers
{
  int64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v4 = FCAppConfigurationIntegerValue(v3, @"forYouMaxDailyEvergreenArticlesForPaidUsers", 30);

  BOOL v5 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v6 = FCAppConfigurationIntegerValue(v5, @"forYouMaxDailyEvergreenArticlesForPaidUsers2", v4);

  return v6;
}

- (int64_t)maxIssuesPerESLInventoryRequest
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxIssuesPerESLInventoryRequest", 100);

  return v3;
}

- (NSArray)freeNotificationItemListIDs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"freeNotificationItemListIds", &unk_1EF8D8A60);

  return (NSArray *)v3;
}

- (NSArray)paidNotificationItemListIDs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"paidNotificationItemListIds", &unk_1EF8D8A78);

  return (NSArray *)v3;
}

- (int64_t)notificationPoolAutoRefreshInterval
{
  if (NFInternalBuild())
  {
    objc_opt_class();
    int64_t v3 = NewsCoreUserDefaults();
    uint64_t v4 = [v3 objectForKey:@"notification_pool_auto_refresh_interval"];
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        BOOL v5 = v4;
      }
      else {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  if ([v6 longLongValue])
  {
    int64_t v7 = [v6 longLongValue];
  }
  else
  {
    id v8 = [(FCNewsAppConfig *)self configDictionary];
    int64_t v7 = FCAppConfigurationIntegerValue(v8, @"notificationPoolAutoRefreshInterval", 14400);
  }
  return v7;
}

- (int64_t)notificationPoolMaxAge
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"notificationPoolMaxAge", 86400);

  return v3;
}

- (int64_t)expirePinnedArticlesAfter
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"expirePinnedArticlesAfter", 0);

  return v3;
}

- (int64_t)singleTopicFeedMinFeedItemsPerRequest
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"singleTopicFeedMinFeedItemsPerRequest", 20);

  return v3;
}

- (int64_t)singleChannelFeedMinFeedItemsPerRequest
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"singleChannelFeedMinFeedItemsPerRequest", 20);

  return v3;
}

- (id)todayConfigWithIdentifier:(id)a3 queueConfigs:(id)a4 backgroundColorLight:(id)a5 backgroundColorDark:(id)a6 audioIndicatorColor:(id)a7 widgetBannerConfig:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v15 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    if (self) {
      goto LABEL_4;
    }
LABEL_18:
    v20 = 0;
    goto LABEL_14;
  }
  long long v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "queueConfigs");
  *(_DWORD *)buf = 136315906;
  v37 = "-[FCNewsAppConfig todayConfigWithIdentifier:queueConfigs:backgroundColorLight:backgroundColorDark:audioIndicator"
        "Color:widgetBannerConfig:]";
  __int16 v38 = 2080;
  v39 = "FCNewsAppConfig.m";
  __int16 v40 = 1024;
  int v41 = 1495;
  __int16 v42 = 2114;
  v43 = v28;
  _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  if (!self) {
    goto LABEL_18;
  }
LABEL_4:
  v20 = self->_widgetConfig;
  if (v20)
  {
    self = (FCNewsAppConfig *)objc_opt_new();
    id v30 = v16;
    [(FCNewsAppConfig *)self setBackgroundColorLight:v16];
    id v29 = v17;
    [(FCNewsAppConfig *)self setBackgroundColorDark:v17];
    [(FCNewsAppConfig *)self setAudioIndicatorColor:v18];
    id v21 = v14;
    [(FCNewsAppConfig *)self setWidgetIdentifier:v14];
    [(FCNewsAppConfig *)self setWidgetBannerConfig:v19];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v15;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          [(FCNewsAppConfig *)self addTodayQueueConfigs:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v24);
    }

    id v14 = v21;
    id v17 = v29;
    id v16 = v30;
  }
  else
  {
    self = 0;
  }
LABEL_14:

  return self;
}

- (int64_t)widgetForYouBackgroundMinimumUpdateInterval
{
  if (self) {
    self = (FCNewsAppConfig *)self->_widgetConfig;
  }
  return [(FCNewsAppConfig *)self forYouBackgroundMinimumUpdateInterval];
}

- (id)analyticsEnvelopeContentTypeConfigsForEnvironment:(unint64_t)a3
{
  if (self) {
    analyticsContentTypeConfigsByContentTypeByEnvironment = self->_analyticsContentTypeConfigsByContentTypeByEnvironment;
  }
  else {
    analyticsContentTypeConfigsByContentTypeByEnvironment = 0;
  }
  BOOL v5 = NSNumber;
  id v6 = analyticsContentTypeConfigsByContentTypeByEnvironment;
  int64_t v7 = [v5 numberWithUnsignedInteger:a3];
  id v8 = [(NSDictionary *)v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)appAnalyticsEndpointUrlForEnvironment:(unint64_t)a3
{
  uint64_t v4 = [(FCNewsAppConfig *)self endpointConfigsByEnvironment];
  BOOL v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = [v6 appAnalyticsBaseURLString];
  id v8 = (void *)v7;
  id v9 = @"https://news-events.apple.com/analyticseventsv2/async";
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  uint64_t v10 = v9;

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10];
  return v11;
}

- (id)appAnalyticsNotificationReceiptEndpointUrlForEnvironment:(unint64_t)a3
{
  uint64_t v4 = [(FCNewsAppConfig *)self endpointConfigsByEnvironment];
  BOOL v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = [v6 appAnalyticsNotificationReceiptBaseURLString];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CB10]);
    id v9 = [v6 appAnalyticsNotificationReceiptBaseURLString];
    uint64_t v7 = (void *)[v8 initWithString:v9];
  }
  return v7;
}

- (id)appAnalyticsAppHealthEndpointUrlForEnvironment:(unint64_t)a3
{
  BOOL v5 = [(FCNewsAppConfig *)self endpointConfigsByEnvironment];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [v7 appAnalyticsAppHealthBaseURLString];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CB10]);
    uint64_t v10 = [v7 appAnalyticsAppHealthBaseURLString];
    uint64_t v11 = (void *)[v9 initWithString:v10];
  }
  else
  {
    uint64_t v11 = [(FCNewsAppConfig *)self appAnalyticsEndpointUrlForEnvironment:a3];
  }

  return v11;
}

- (int64_t)maxRetriesForDroppedFeeds
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxRetriesForDroppedFeeds", 2);

  return v3;
}

- (double)delayBeforeRetryingDroppedFeeds
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"delayBeforeRetryingDroppedFeeds", 1.5);

  return v3;
}

- (int64_t)subscriptionsPlacardPublisherFrequencyInSeconds
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"subscriptionsPlacardPublisherFrequencySeconds", 86400);

  return v3;
}

- (int64_t)subscriptionsPlacardGlobalMaximumPerDay
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"subscriptionsPlacardGlobalMaxPerDay", 1);

  return v3;
}

- (int64_t)subscriptionsGracePeriodForTokenVerificationSeconds
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"subscriptionsGracePeriodForTokenVerificationSeconds", 1296000);

  return v3;
}

- (BOOL)hideAllPaywalls
{
  return 0;
}

- (BOOL)hideAlacartePaywalls
{
  return 0;
}

- (int64_t)entitlementsCacheRecoveryAttemptDurationInSeconds
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"entitlementsCacheRecoveryAttemptDurationSeconds", 2592000);

  return v3;
}

- (BOOL)enableCacheFallbackForArticleRecirculation
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"enableCacheFallbackForArticleRecirculation", 1);

  return v3;
}

- (NSArray)onboardingFeedIDs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"onboardingTagIds", 0);

  return (NSArray *)v3;
}

- (NSArray)discoverNewsPlusChannelIDs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"discoverNewsPlusChannelIds", 0);

  return (NSArray *)v3;
}

- (NSArray)recommendedIssueAllowList
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"recommendedIssueAllowList", MEMORY[0x1E4F1CBF0]);

  return (NSArray *)v3;
}

- (NSArray)recommendedIssueDenyList
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"recommendedIssueDenyList", MEMORY[0x1E4F1CBF0]);

  return (NSArray *)v3;
}

- (BOOL)todayPerformanceAlertsEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"todayPerformanceAlertsEnabled", 1);

  return v3;
}

- (int64_t)todayPerformanceAlertsMinNewsVersion
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"todayPerformanceAlertsMinNewsVersion", 0);

  return v3;
}

- (double)todayPerformanceAlertPrewarmThreshold
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"todayPerformanceAlertPrewarmThreshold", 10.0);

  return v3;
}

- (double)todayPerformanceAlertGapExpansionThreshold
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"todayPerformanceAlertGapExpansionThreshold", 10.0);

  return v3;
}

- (double)todayPerformanceAlertSpinnerThreshold
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"todayPerformanceAlertSpinnerThreshold", 5.0);

  return v3;
}

- (double)todayFeedConfigEndpointTimeoutAfterCK
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"todayFeedConfigEndpointTimeoutAfterCK", 2.0);

  return v3;
}

- (int64_t)autoScrollToTopFeedTimeout
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"autoScrollToTopFeedTimeout", 14400);

  return v3;
}

- (NSString)webEmbedContentBlockers
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"webEmbedContentBlockers", @"[{\"trigger\": {\"url-filter\": \".*\",\"unless-domain\": [\"*apple.com\"]},\"action\": {\"type\": \"block\"}}]");

  return (NSString *)v3;
}

- (NSString)webEmbedContentBlockerOverrides
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"webEmbedContentBlockerOverrides", 0);

  return (NSString *)v3;
}

- (NSString)anfRenderingConfiguration
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"anfRenderingConfiguration", 0);

  return (NSString *)v3;
}

- (double)interstitialAdLoadDelay
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"interstitialAdLoadDelay", 1.0);

  return v3;
}

- (double)prerollLoadingTimeout
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"prerollLoadingTimeout", 0.0);

  return v3;
}

- (double)prerollReadyToPlayTimeout
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"prerollReadyToPlayTimeout", 2.0);

  return v3;
}

- (BOOL)widgetContentPrefetchEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"widgetContentPrefetchEnabled", 1);

  return v3;
}

- (BOOL)widgetBackgroundInteractionEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"widgetBackgroundInteractionEnabled", 0);

  return v3;
}

- (BOOL)widgetFetchOfTodayFeedLiteConfigEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"widgetFetchOfTodayFeedLiteConfigEnabled", 1);

  return v3;
}

- (BOOL)widgetAnalyticsEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"widgetAnalyticsEnabled2", 1);

  return v3;
}

- (BOOL)userSegmentationInWidgetAllowed
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"userSegmentationInWidgetAllowed", 1);

  return v3;
}

- (int64_t)newFavoriteNotificationAlertsFrequency
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"newFavoriteNotificationAlertsFrequency", 0);

  return v3;
}

- (int64_t)notificationArticleCacheTimeout
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"notificationArticleCacheTimeout", 300);

  return v3;
}

- (int64_t)notificationArticleWithRapidUpdatesCacheTimeout
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"notificationArticleWithRapidUpdatesCacheTimeout", 120);

  return v3;
}

- (BOOL)notificationEnableAssetPrefetching
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"notificationEnableAssetPrefetching", 1);

  return v3;
}

- (BOOL)notificationAssetPrefetchingRequiresWatch
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"notificationAssetPrefetchingRequiresWatch", 1);

  return v3;
}

- (BOOL)universalLinksEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"universalLinksEnabled", 0);

  return v3;
}

- (NSString)widgetConfigID
{
  self;
  if (qword_1EB5D1150 != -1) {
    dispatch_once(&qword_1EB5D1150, &__block_literal_global_2698);
  }
  id v3 = (id)qword_1EB5D1148;
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    BOOL v5 = -[FCNewsAppConfig localizedStorefrontID](self);
    self;
    if (qword_1EB5D1180 != -1) {
      dispatch_once(&qword_1EB5D1180, &__block_literal_global_2722);
    }
    id v6 = (id)qword_1EB5D1178;
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [NSString stringWithFormat:@"W-%@-en", @"143441"];
    }
    uint64_t v10 = v9;

    uint64_t v11 = [(FCNewsAppConfig *)self languageConfigDictionary];
    FCAppConfigurationStringValue(v11, @"widgetSectionConfigId", v10);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (int64_t)widgetMinimumArticleExposureDurationToBePreseenInMilliseconds
{
  return [(FCWidgetConfig *)self->_widgetConfig minimumArticleExposureDurationToBePreseen];
}

- (unsigned)widgetMinimumNumberOfTimesPreseenToBeSeen
{
  return [(FCWidgetConfig *)self->_widgetConfig minimumNumberOfTimesPreseenToBeSeen];
}

- (int64_t)widgetSystemReloadInterval
{
  return [(FCWidgetConfig *)self->_widgetConfig widgetSystemReloadInterval];
}

- (int64_t)widgetSystemReloadJitterMax
{
  return [(FCWidgetConfig *)self->_widgetConfig widgetSystemReloadJitterMax];
}

- (int64_t)widgetSystemHoneymoonDuration
{
  return [(FCWidgetConfig *)self->_widgetConfig widgetSystemHoneymoonDuration];
}

- (int64_t)widgetSystemReloadIntervalHoneymoon
{
  return [(FCWidgetConfig *)self->_widgetConfig widgetSystemReloadIntervalHoneymoon];
}

- (int64_t)widgetSystemReloadJitterMaxHoneymoon
{
  return [(FCWidgetConfig *)self->_widgetConfig widgetSystemReloadJitterMaxHoneymoon];
}

- (double)widgetTelemetrySamplingRate
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"widgetTelemetrySamplingRate2", 0.01);

  return v3;
}

- (int64_t)smallWidgetSystemReloadInterval
{
  return [(FCWidgetConfig *)self->_widgetConfig smallWidgetSystemReloadInterval];
}

- (int64_t)smallWidgetSystemReloadJitterMax
{
  return [(FCWidgetConfig *)self->_widgetConfig smallWidgetSystemReloadJitterMax];
}

- (int64_t)smallWidgetSystemHoneymoonDuration
{
  return [(FCWidgetConfig *)self->_widgetConfig smallWidgetSystemHoneymoonDuration];
}

- (int64_t)smallWidgetSystemReloadIntervalHoneymoon
{
  return [(FCWidgetConfig *)self->_widgetConfig smallWidgetSystemReloadIntervalHoneymoon];
}

- (int64_t)smallWidgetSystemReloadJitterMaxHoneymoon
{
  return [(FCWidgetConfig *)self->_widgetConfig smallWidgetSystemReloadJitterMaxHoneymoon];
}

- (double)articleDiversificationSimilarityExpectationStart
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"articleDiversitySimilarityExpectationStart", 0.0);

  return v3;
}

- (double)articleDiversificationSimilarityExpectationEnd
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"articleDiversitySimilarityExpectationEnd", 0.1);

  return v3;
}

- (double)articleDiversificationUniquePublisherExpectationSlope
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"publisherDiversitySlope", 0.75);

  return v3;
}

- (double)articleDiversificationUniquePublisherExpectationYIntercept
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"publisherDiversityYIntercept", 0.25);

  return v3;
}

- (int64_t)analyticsEndpointMaxPayloadSize
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"analyticsEndpointMaxPayloadSize", 500000);

  return v3;
}

- (NSString)locationRecommendationMappingsResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"locationRecommendationMappingsResourceId", 0);

  return (NSString *)v3;
}

- (NSString)localAreasMappingResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"localAreasMappingResourceId", 0);

  return (NSString *)v3;
}

- (NSString)tagFeedLayoutConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"tagFeedLayoutConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (NSString)topicFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"topicFeedConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (NSString)channelFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"channelFeedConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (NSString)sectionFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sectionFeedConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (NSString)sharedWithYouFeedLayoutConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"sharedFeedConfigurationResourceId", @"shared-feed-config-143441-en");

  return (NSString *)v3;
}

- (NSString)savedFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"savedFeedConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (NSString)historyFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"historyFeedConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (NSString)searchFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"searchFeedConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (NSString)searchMoreFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"searchMoreFeedConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (NSString)audioHistoryFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"audioHistoryFeedConfigurationResourceId", @"audio-history-feed-config-143441-en");

  return (NSString *)v3;
}

- (NSString)audioPlaylistFeedConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"audioPlaylistFeedConfigurationResourceId", @"audio-playlist-feed-config-143441-en");

  return (NSString *)v3;
}

- (NSString)userConcernConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"userConcernConfigurationResourceId", @"user-concern-config-143441-en");

  return (NSString *)v3;
}

- (NSString)channelPickerConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"channelPickerConfigurationResourceId", @"configuration-channel-picker-143441-en");

  return (NSString *)v3;
}

- (NSString)searchEndpointConfigurationResourceID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"searchEndpointConfigurationResourceID", @"configuration-search-endpoint-143441-en");

  return (NSString *)v3;
}

- (NSString)inConversationsAudioTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"inConversationsAudioTagId", 0);

  return (NSString *)v3;
}

- (NSString)businessAudioTagID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"businessAudioTagId", 0);

  return (NSString *)v3;
}

- (NSString)translationMapResourceID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"languageMapResourceId", 0);

  return (NSString *)v3;
}

- (NSString)userVectorWhitelistResourceId
{
  int64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v4 = FCAppConfigurationStringValue(v3, @"userVectorWhitelistResourceId", 0);
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(FCNewsAppConfig *)self configDictionary];
    FCAppConfigurationStringValue(v7, @"userVectorWhitelistResourceId", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)userVectorModelResourceId
{
  int64_t v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  id v4 = FCAppConfigurationStringValue(v3, @"userVectorModelResourceId", 0);
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(FCNewsAppConfig *)self configDictionary];
    FCAppConfigurationStringValue(v7, @"userVectorModelResourceId", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (int64_t)articleReadCountThreshold
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"articleReadCountThreshold", 1);

  return v3;
}

- (int64_t)corryBarMaxArticleCountForArticleList
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"corryBarMaxArticleCountForArticleList", 10);

  return v3;
}

- (int64_t)corryBarMaxArticleCountForSingleArticle
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"corryBarMaxArticleCountForSingleArticle", 5);

  return v3;
}

- (BOOL)corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers", 0);

  return v3;
}

- (NSString)exploreArticleID
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationStringValue(v2, @"exploreArticleId", 0);

  return (NSString *)v3;
}

- (NSArray)externalAnalyticsConfigurations
{
  externalAnalyticsConfigurations = self->_externalAnalyticsConfigurations;
  if (!externalAnalyticsConfigurations)
  {
    id v4 = [(FCNewsAppConfig *)self configDictionary];
    BOOL v5 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"externalAnalyticsConfig", 0);

    objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_2158);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_externalAnalyticsConfigurations;
    self->_externalAnalyticsConfigurations = v6;

    externalAnalyticsConfigurations = self->_externalAnalyticsConfigurations;
  }
  return externalAnalyticsConfigurations;
}

uint64_t __50__FCNewsAppConfig_externalAnalyticsConfigurations__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F82A38] externalAnalyticsConfigWithDictionary:a2];
}

- (NSArray)mediaSharingBlacklistedChannelIDs
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"mediaSharingBlacklistedChannelIds", 0);

  return (NSArray *)v3;
}

- (int64_t)topStoriesLocalNewsExpiration
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"topStoriesLocalNewsExpiration", 21600);

  return v3;
}

- (BOOL)terminateAppOnBackgroundAfterJoiningOrLeavingExperiment
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"terminateAppOnBackgroundAfterJoiningOrLeavingExperiment", 0);

  return v3;
}

uint64_t __41__FCNewsAppConfig_topStoriesPublishDates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  double v3 = (double)[a2 integerValue];
  return [v2 dateWithTimeIntervalSinceReferenceDate:v3];
}

- (unint64_t)trendingStyle
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationStringValue(v2, @"trendingStyle", 0);

  unint64_t v4 = 0;
  if (([v3 isEqualToString:@"TrendingCellStyleNumberedCircle"] & 1) == 0) {
    unint64_t v4 = [v3 isEqualToString:@"TrendingCellStyleImageOnSide"];
  }

  return v4;
}

- (NSString)articleRecirculationConfigJSON
{
  double v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  unint64_t v4 = FCAppConfigurationStringValue(v3, @"articleRecirculationConfig", 0);
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(FCNewsAppConfig *)self configDictionary];
    FCAppConfigurationStringValue(v7, @"articleRecirculationConfig", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)issueArticleRecirculationConfig
{
  double v3 = [(FCNewsAppConfig *)self languageConfigDictionary];
  unint64_t v4 = FCAppConfigurationStringValue(v3, @"issueArticleRecirculationConfig", 0);
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(FCNewsAppConfig *)self configDictionary];
    FCAppConfigurationStringValue(v7, @"issueArticleRecirculationConfig", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NTPBDiscoverMoreVideosInfo)shareDiscoverMoreVideosInfo
{
  return self->_shareDiscoverMoreVideosInfo;
}

- (NSString)articleRecirculationComponentPlacementConfigJSON
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationStringValue(v2, @"articleRecirculationComponentPlacementConfig", 0);

  return (NSString *)v3;
}

- (int64_t)articleRecirculationPopularFeedQueryTimeRange
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"articleRecirculationPopularFeedQueryTimeRange", 86400);

  return v3;
}

- (BOOL)disableThumbnailsForArticleRecirculation
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"disableThumbnailsForArticleRecirculation", 0);

  return v3;
}

- (NSString)feedNavigationConfigJSON
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationStringValue(v2, @"feedNavConfig", @"{\"items\":[]}");

  return (NSString *)v3;
}

- (NSString)shortcutsCurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationStringValue(v2, @"shortcutsCurationResourceId", 0);

  return (NSString *)v3;
}

- (NSString)shortcutsConfigResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationStringValue(v2, @"shortcutsConfigResourceId", 0);

  return (NSString *)v3;
}

- (NSString)description
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = [v2 description];

  return (NSString *)v3;
}

- (BOOL)enableBadgeInSpotlightTabBar
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"enableBadgeInSpotlightTabBar", 0);

  return v3;
}

- (NSString)magazinesConfigRecordID
{
  char v3 = -[FCNewsAppConfig localizedStorefrontID](self);
  self;
  if (qword_1EB5D1190 != -1) {
    dispatch_once(&qword_1EB5D1190, &__block_literal_global_2727);
  }
  id v4 = (id)qword_1EB5D1188;
  BOOL v5 = [v4 objectForKeyedSubscript:v3];

  id v6 = [(FCNewsAppConfig *)self languageConfigDictionary];
  uint64_t v7 = FCAppConfigurationStringValue(v6, @"maConfigId", v5);

  return (NSString *)v7;
}

- (BOOL)isArticleToolbarCompressionEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"articleToolbarCompressionEnabled", 1);

  return v3;
}

- (int64_t)lowStorageThreshold
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"lowStorageThreshold", 1000000000);

  return v3;
}

- (int64_t)criticalStorageThreshold
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"criticalStorageThreshold", 200000000);

  return v3;
}

- (int64_t)maximumTrendingGroupSizeiPad
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxTrendingGroupSizeIpad", 6);

  return v3;
}

- (int64_t)maximumTrendingGroupSizeiPhone
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxTrendingGroupSizeIphone", 4);

  return v3;
}

- (unint64_t)likeDislikeBehavior
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  unint64_t v3 = FCAppConfigurationIntegerValue(v2, @"likeDislikeBehavior", 1);

  return v3;
}

- (unint64_t)bestOfBundleFeedGroupKind
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  unint64_t v3 = FCAppConfigurationIntegerValue(v2, @"bestOfBundleFeedGroupKind", 1);

  return v3;
}

- (int64_t)emailSignupRequiredAppLaunchCount
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"emailSignupRequiredAppLaunchCount", 4);

  return v3;
}

- (BOOL)issuesNewsletterOptinEnabled
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"newsletterConfig", 0);

  LOBYTE(v2) = FCAppConfigurationBoolValue(v3, @"issuesNewsletterOptinEnabled", 0);
  return (char)v2;
}

- (BOOL)enableLocationBasedAutofavorites
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"enableLocationBasedAutofavorites", 1);

  return v3;
}

- (BOOL)forYouGroupShouldPromoteAccessibleHeadline
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"forYouGroupShouldPromoteAccessibleHeadline", 0);

  return v3;
}

- (BOOL)todayFeedEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"feed3EnabledLevel", 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)useNewsArticleSearch
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"searchConfigurationProfiles", 0);

  LOBYTE(v2) = [v3 containsObject:@"newsArticleSearch"];
  return (char)v2;
}

- (BOOL)useMultipleNativeAds
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"useMultipleNativeAdsEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)useNotificationsV2
{
  if (!NFInternalBuild()) {
    goto LABEL_5;
  }
  uint64_t v3 = NewsCoreUserDefaults();
  uint64_t v4 = [v3 integerForKey:@"news.features.useNotificationsV2"];

  if (v4 == 1)
  {
    LOBYTE(isPlatformVersionAtLeast) = 1;
    return isPlatformVersionAtLeast;
  }
  if (v4 == 2)
  {
    LOBYTE(isPlatformVersionAtLeast) = 0;
  }
  else
  {
LABEL_5:
    int isPlatformVersionAtLeast = __isPlatformVersionAtLeast(2, 19, 0, 0);
    if (isPlatformVersionAtLeast)
    {
      id v6 = [(FCNewsAppConfig *)self configDictionary];
      uint64_t v7 = FCAppConfigurationIntegerValue(v6, @"useNotificationsV2EnabledLevel", 0);

      LOBYTE(isPlatformVersionAtLeast) = +[FCFeatureEnablementChecker enabledForCurrentLevel:v7];
    }
  }
  return isPlatformVersionAtLeast;
}

- (NSArray)searchConfigurationProfiles
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"searchConfigurationProfiles", 0);

  if ([v3 count]) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  BOOL v5 = v4;

  return (NSArray *)v5;
}

- (NSArray)sportsSearchConfigurationProfiles
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"sportsSearchConfigurationProfiles", 0);

  if ([v3 count]) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  BOOL v5 = v4;

  return (NSArray *)v5;
}

- (BOOL)isSportsSyncingSupported
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"isSportsSyncingSupported", 1);

  return v3;
}

- (BOOL)servicesBundleCIPActivationEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"servicesBundleCIPActivationEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)paidBundleViaOfferEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"paidBundleViaOfferEnabledLevel", 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)isSIWAOnMacEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"signInWithAppleOnMacEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)fineGrainedNewsletterManagementEnabled
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = @"143441";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v4 = [(FCNewsAppConfig *)self storefrontID];
  if ([v3 containsObject:v4]) {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v5 = 0;
  }

  id v6 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v7 = FCAppConfigurationIntegerValue(v6, @"fineGrainedNewsletterManagementEnabledLevel", v5);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v7];
}

- (BOOL)dimNonSubscriberContentOffline
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"dimNonSubscriberContentOffline", 0);

  return v3;
}

- (NSString)offlineModeUnavailableMessage
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationStringValue(v2, @"offlineModeUnavailableMessage", 0);

  return (NSString *)v3;
}

- (NSString)offlineStatusBannerUpsellMessage
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationStringValue(v2, @"offlineStatusBannerUpsellMessage", 0);

  return (NSString *)v3;
}

- (NSString)enterOfflineModeButtonTitle
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationStringValue(v2, @"enterOfflineModeButtonTitle", 0);

  return (NSString *)v3;
}

- (NSString)exitOfflineModeButtonTitle
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  char v3 = FCAppConfigurationStringValue(v2, @"exitOfflineModeButtonTitle", 0);

  return (NSString *)v3;
}

- (BOOL)newSearchEndpointConfigEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"newSearchEndpointConfigEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)moreToReadEOAEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"moreToReadEOAEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)moreFromIssueEOAEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"moreFromIssueEOAEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)splitTopicGroups
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"splitTopicGroups", 0);

  return v3;
}

- (double)continueReadingDismissalInterval
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"continueReadingDismissalIntervalSeconds", 6.0);

  return v3;
}

- (BOOL)isCardFeedRedesignEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"feedRedesignEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (int64_t)alternateUniversalLinksResourceRefreshRate
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"alternateUniversalLinksResourceRefreshRate", 86400);

  return v3;
}

- (BOOL)todayFeedConfigRequestsEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"todayFeedConfigRequestsEnabledLevel", 0);

  if (!NFInternalBuild()) {
    goto LABEL_4;
  }
  id v4 = NewsCoreUserDefaults();
  uint64_t v5 = [v4 integerForKey:@"news.features.todayfeedconfigrequests"];

  if (v5 == 2) {
    return 0;
  }
  if (v5 == 1) {
    return 1;
  }
LABEL_4:
  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)audioFeedConfigRequestsEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioFeedConfigRequestsEnabledLevel", 0);

  if (!NFInternalBuild()) {
    goto LABEL_4;
  }
  id v4 = NewsCoreUserDefaults();
  uint64_t v5 = [v4 integerForKey:@"news.features.audiofeedconfigrequests"];

  if (v5 == 2) {
    return 0;
  }
  if (v5 == 1) {
    return 1;
  }
LABEL_4:
  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)sportsRecordEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"sportsRecordEnabled", 0xFFFFFFFFLL);

  if (!NFInternalBuild()) {
    goto LABEL_4;
  }
  id v4 = NewsCoreUserDefaults();
  uint64_t v5 = [v4 integerForKey:@"news.features.useSportsRecord"];

  if (v5 == 2) {
    return 0;
  }
  if (v5 == 1) {
    return 1;
  }
LABEL_4:
  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)sportsRecommendationHidesIgnoredTags
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"sportsRecommendationHidesIgnoredTags", 1);

  if (!NFInternalBuild()) {
    goto LABEL_4;
  }
  id v4 = NewsCoreUserDefaults();
  uint64_t v5 = [v4 integerForKey:@"news.sports.sportsRecommendationHidesIgnoredTags"];

  if (v5 == 2) {
    return 0;
  }
  if (v5 == 1) {
    return 1;
  }
LABEL_4:
  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)sportsNativeAdsEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"sportsNativeAdsEnabled", 1);

  if (!NFInternalBuild()) {
    goto LABEL_4;
  }
  id v4 = NewsCoreUserDefaults();
  uint64_t v5 = [v4 integerForKey:@"news.sports.nativeAdsEnabled"];

  if (v5 == 2) {
    return 0;
  }
  if (v5 == 1) {
    return 1;
  }
LABEL_4:
  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)isImprovedManagedTopicGroupingEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"improvedManagedTopicGroupingEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (NSArray)analyticsEventNamesPublicAllowlist
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"analyticsEventNamesPublicAllowlist", 0);
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSArray)analyticsEventNamesSeedAllowlist
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"analyticsEventNamesSeedAllowlist", 0);
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSArray)analyticsEventNamesInternalAllowlist
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"analyticsEventNamesInternalAllowlist", 0);
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (BOOL)shouldProxyURLBucketFetch
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"shouldProxyURLBucketFetch", 1);

  return v3;
}

- (int64_t)minimumBucketGroupConfigVersion
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumBucketGroupConfigVersion", 2);

  return v3;
}

- (FCEmbedProxyConfiguration)embedProxyConfiguration
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"embedProxyConfiguration", 0);

  id v4 = [[FCEmbedProxyConfiguration alloc] initWithDictionary:v3];
  return v4;
}

- (double)derivedPersonalizationDataBalanceValue
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"derivedPersonalizationDataBalanceValue", 1.0);

  return v3;
}

- (FCNewsPlusLabelConfigGroup)newsPlusLabelConfigGroup
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"newsPlusLabelConfigGroup", 0);

  id v4 = [[FCNewsPlusLabelConfigGroup alloc] initWithConfigDictionary:v3];
  return v4;
}

- (FCAppReviewRequestConfig)appReviewRequestConfig
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"appReviewRequestConfig", 0);

  id v4 = [[FCAppReviewRequestConfig alloc] initWithDictionary:v3];
  return v4;
}

- (NSArray)analyticsDenylistDescriptorsPublic
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"analyticsDenylistDescriptorsPublic", 0);
  id v4 = v3;
  if (!v3) {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSArray)analyticsDenylistDescriptorsSeed
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"analyticsDenylistDescriptorsSeed", 0);
  id v4 = v3;
  if (!v3) {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSDictionary)editorialTopicEventMapping
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  id v4 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"editorialTopicEventMapping", 0);
  uint64_t v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v6 = v4;

  return v6;
}

- (NSDictionary)editorialTopicEventMappingProperties
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  uint64_t v4 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"editorialTopicEventMappingProperties", 0);
  uint64_t v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x1E4F1CC08];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = objc_msgSend(v7, "fc_dictionaryByTransformingValuesWithBlock:", &__block_literal_global_2525);

  return (NSDictionary *)v8;
}

FCEditorialTopicEventMappingProperty *__55__FCNewsAppConfig_editorialTopicEventMappingProperties__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [[FCEditorialTopicEventMappingProperty alloc] initWithDictionary:v2];

  return v3;
}

- (NSArray)editoralRecommendedSportsTopicTagIds
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  uint64_t v4 = FCAppConfigurationArrayValueWithDefaultValue(v3, @"editoralRecommendedSportsTopicTagIds", 0);
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (NSArray)editorialFallbackSportsTopicTagIds
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  uint64_t v4 = FCAppConfigurationArrayValueWithDefaultValue(v3, @"editorialFallbackSportsTopicTagIds", 0);
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (int64_t)sportsManagementRecommendedItemsCount
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationIntegerValue(v3, @"sportsManagementRecommendedItemsCount", 5);
  return v4;
}

- (int64_t)sportsManagementMinChildItemsCount
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationIntegerValue(v3, @"sportsManagementMinChildItemsCount", 15);
  return v4;
}

- (NSString)sportsTaxonomyResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"taxonomyResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsStandingConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"standingConfigurationResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsBoxScoreConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"boxScoreConfigurationResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsKeyPlayerConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"keyPlayerConfigurationResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsLineScoreConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"lineScoreConfigurationResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsInjuryReportConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"injuryReportConfigurationResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsBracketConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"bracketConfigurationResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsScoreConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"scoreConfigurationResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsSyncingConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"sportsSyncingConfigurationResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsSyncingConfigurationV2ResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"sportsSyncingConfigurationV2ResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsFeaturedEventsResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"featuredEventsResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)sportsConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"sportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationStringValue(v3, @"configurationResourceId", &stru_1EF8299B8);

  return (NSString *)v4;
}

- (NSString)webEmbedDataSourcesConfigurationResourceId
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationStringValue(v2, @"webEmbedDataSourcesConfigurationResourceId", 0);

  return (NSString *)v3;
}

- (int64_t)liveActivityFollowedAlertsThreshold
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"liveActivityFollowedAlertsThreshold", 3);

  return v3;
}

- (int64_t)liveActivityScheduledAlertsThreshold
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"liveActivityScheduledAlertsThreshold", 3);

  return v3;
}

- (double)liveActivityScheduleDelay
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"liveActivityScheduleDelay", 10.0);

  return v3;
}

- (double)liveActivityScheduleRandomInitialDelay
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"liveActivityScheduleRandomInitialDelay", 30.0);

  return v3;
}

- (double)liveActivityScheduleTimeWindow
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"liveActivityScheduleTimeWindow", 300.0);

  return v3;
}

- (double)liveActivityScheduleRetryInterval
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"liveActivityScheduleRetryInterval", 300.0);

  return v3;
}

- (double)liveActivityScheduleRetryTimeWindow
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"liveActivityScheduleRetryTimeWindow", 3600.0);

  return v3;
}

- (int64_t)liveActivityScheduleRetryCountMax
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"liveActivityScheduleRetryCountMax", 5);

  return v3;
}

- (NSArray)liveActivityAssetServerURLs
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = [MEMORY[0x1E4F1C978] array];
  int64_t v4 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"liveActivityAssetServerURLs", v3);

  uint64_t v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_2616);

  return (NSArray *)v5;
}

uint64_t __46__FCNewsAppConfig_liveActivityAssetServerURLs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1CB10] URLWithString:a2];
}

- (BOOL)useAltSportsRecommendationMapping
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  LOBYTE(v2) = FCAppConfigurationBoolValue(v3, @"useAltSportsRecommendationMapping", 0);
  return (char)v2;
}

- (double)minMembershipForTaxonomyCandidates
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  double v4 = FCAppConfigurationDoubleValue(v3, @"minMembershipForTaxonomyCandidates", 0.0);
  return v4;
}

- (BOOL)considerAutofavoritesInMappingCandidates
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  LOBYTE(v2) = FCAppConfigurationBoolValue(v3, @"considerAutofavoritesInMappingCandidates", 1);
  return (char)v2;
}

- (double)minScoreThresholdForSportsRecommendations
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  double v4 = FCAppConfigurationDoubleValue(v3, @"minScoreThresholdForSportsRecommendations", 0.0);
  return v4;
}

- (double)minMembershipThreshold
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  double v4 = FCAppConfigurationDoubleValue(v3, @"minMembershipThreshold", 0.051);
  return v4;
}

- (double)minMembershipThresholdForLocalRecommendation
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  double v4 = FCAppConfigurationDoubleValue(v3, @"minMembershipThresholdForLocalRecommendation", 0.0);
  return v4;
}

- (int64_t)maxSportRecommendationsWithLeagueTypeCollege
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationIntegerValue(v3, @"maxSportRecommendationsWithLeagueTypeCollege", 2);
  return v4;
}

- (int64_t)maxSportRecommendationsPerSport
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"localizedSportsDataConfiguration", 0);

  int64_t v4 = FCAppConfigurationIntegerValue(v3, @"maxSportRecommendationsPerSport", 3);
  return v4;
}

- (NSDictionary)tagFeedGroupClusteringKnobOverrides
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v3 = NewsCoreUserDefaults();
  int v4 = [v3 BOOLForKey:@"news.news_personalization.cluster_config_overrides.enabled"];

  if (!NFInternalBuild() || !v4) {
    goto LABEL_9;
  }
  uint64_t v5 = NewsCoreUserDefaults();
  id v6 = [v5 stringForKey:@"news.news_personalization.cluster_config_overrides.json"];

  if (![v6 length])
  {
LABEL_8:

LABEL_9:
    id v6 = [(FCNewsAppConfig *)self languageConfigDictionary];
    id v8 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"tagFeedGroupClusteringKnobOverrides", 0);
    goto LABEL_10;
  }
  id v7 = [v6 dataUsingEncoding:4];
  id v13 = 0;
  id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v13];
  id v9 = v13;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "Failed to parse debug override value for topicFeedGroupClusteringKnobOverrides error: %@", buf, 0xCu);
    }

    goto LABEL_8;
  }

LABEL_10:
  return (NSDictionary *)v8;
}

- (FCArticleLinkBehaviorConfig)articleLinkBehaviorConfig
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"articleLinkBehaviorConfig", 0);

  int v4 = [[FCArticleLinkBehaviorConfig alloc] initWithConfigDictionary:v3];
  return v4;
}

- (FCArticleModalBrandBarConfig)articleModalBrandBarConfig
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"articleModalBrandBarConfig", 0);

  int v4 = [[FCArticleModalBrandBarConfig alloc] initWithConfigDictionary:v3];
  return v4;
}

- (FCSportsFavoritesSyncModalConfig)sportsFavoritesSyncModalConfig
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  int64_t v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"sportsFavoritesSyncModalConfig", 0);

  int v4 = [[FCSportsFavoritesSyncModalConfig alloc] initWithConfigDictionary:v3];
  return v4;
}

- (BOOL)articleLinkBehaviorImprovementsEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  uint64_t v3 = FCAppConfigurationIntegerValue(v2, @"articleLinkBehaviorImprovementsEnabledLevel", 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:v3];
}

- (BOOL)allowAnyChannelForTodayChannelGroups
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int v3 = FCAppConfigurationBoolValue(v2, @"allowAnyChannelForTodayChannelGroups", 0);

  if (NFInternalBuild()
    && (NewsCoreUserDefaults(),
        int v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKey:@"news.personalization.allow_any_channel_for_today_channel_groups"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = NewsCoreUserDefaults();
    int v3 = [v6 BOOLForKey:@"news.personalization.allow_any_channel_for_today_channel_groups"];

    id v7 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "See internal user with allow any channel for today channel groups override as %d", (uint8_t *)v10, 8u);
    }
  }
  else if (v3)
  {
    id v8 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "allowAnyChannelForTodayChannelGroups being reported as true from app config", (uint8_t *)v10, 2u);
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (double)tagSubscriptionRepromptDelay
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"tagSubscriptionRepromptDelay", 0.0);

  return v3;
}

- (id)jsonEncodableObject
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = (void *)[v2 copy];

  return v3;
}

void __41__FCNewsAppConfig_overrideForYouConfigID__block_invoke()
{
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if ([v4 BOOLForKey:@"enable_config_overrides"])
    {
      v0 = NewsCoreUserDefaults();
      uint64_t v1 = [v0 stringForKey:@"override_foryouconfig_id"];
      id v2 = (void *)_MergedGlobals_150;
      _MergedGlobals_150 = v1;
    }
    else
    {
      v0 = (void *)_MergedGlobals_150;
      _MergedGlobals_150 = 0;
    }

    double v3 = v4;
  }
  else
  {
    double v3 = (void *)_MergedGlobals_150;
    _MergedGlobals_150 = 0;
  }
}

void __48__FCNewsAppConfig_overrideForYouPremiumConfigID__block_invoke()
{
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if ([v4 BOOLForKey:@"enable_config_overrides"])
    {
      v0 = NewsCoreUserDefaults();
      uint64_t v1 = [v0 stringForKey:@"override_foryouconfig_premium_id"];
      id v2 = (void *)qword_1EB5D1138;
      qword_1EB5D1138 = v1;
    }
    else
    {
      v0 = (void *)qword_1EB5D1138;
      qword_1EB5D1138 = 0;
    }

    double v3 = v4;
  }
  else
  {
    double v3 = (void *)qword_1EB5D1138;
    qword_1EB5D1138 = 0;
  }
}

void __48__FCNewsAppConfig_overrideWidgetSectionConfigID__block_invoke()
{
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if ([v4 BOOLForKey:@"enable_config_overrides"])
    {
      v0 = NewsCoreUserDefaults();
      uint64_t v1 = [v0 stringForKey:@"override_widgetsectionconfig_id"];
      id v2 = (void *)qword_1EB5D1148;
      qword_1EB5D1148 = v1;
    }
    else
    {
      v0 = (void *)qword_1EB5D1148;
      qword_1EB5D1148 = 0;
    }

    double v3 = v4;
  }
  else
  {
    double v3 = (void *)qword_1EB5D1148;
    qword_1EB5D1148 = 0;
  }
}

void __69__FCNewsAppConfig_defaultForYouRecordConfigIDByLocalizedStorefrontID__block_invoke()
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"143441";
  v0 = [NSString stringWithFormat:@"%@-%@-en", @"Y", @"143441"];
  v8[0] = v0;
  v7[1] = @"143455";
  uint64_t v1 = [NSString stringWithFormat:@"%@-%@-en", @"Y", @"143455"];
  v8[1] = v1;
  v7[2] = @"143455-fr-ca";
  id v2 = [NSString stringWithFormat:@"%@-%@-fr", @"Y", @"143455"];
  v8[2] = v2;
  v7[3] = @"143444";
  double v3 = [NSString stringWithFormat:@"%@-%@-en", @"Y", @"143444"];
  v8[3] = v3;
  v7[4] = @"143460";
  id v4 = [NSString stringWithFormat:@"%@-%@-en", @"Y", @"143460"];
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v6 = (void *)qword_1EB5D1158;
  qword_1EB5D1158 = v5;
}

void __76__FCNewsAppConfig_defaultForYouPremiumRecordConfigIDByLocalizedStorefrontID__block_invoke()
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"143441";
  v0 = [NSString stringWithFormat:@"%@-%@-en", @"YP", @"143441"];
  v8[0] = v0;
  v7[1] = @"143455";
  uint64_t v1 = [NSString stringWithFormat:@"%@-%@-en", @"YP", @"143455"];
  v8[1] = v1;
  v7[2] = @"143455-fr-ca";
  id v2 = [NSString stringWithFormat:@"%@-%@-fr", @"YP", @"143455"];
  v8[2] = v2;
  v7[3] = @"143444";
  double v3 = [NSString stringWithFormat:@"%@-%@-en", @"YP", @"143444"];
  v8[3] = v3;
  v7[4] = @"143460";
  id v4 = [NSString stringWithFormat:@"%@-%@-en", @"YP", @"143460"];
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v6 = (void *)qword_1EB5D1168;
  qword_1EB5D1168 = v5;
}

void __69__FCNewsAppConfig_defaultWidgetRecordConfigIDByLocalizedStorefrontID__block_invoke()
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"143441";
  v0 = [NSString stringWithFormat:@"%@-%@-en", @"W", @"143441"];
  v8[0] = v0;
  v7[1] = @"143455";
  uint64_t v1 = [NSString stringWithFormat:@"%@-%@-en", @"W", @"143455"];
  v8[1] = v1;
  v7[2] = @"143455-fr-ca";
  id v2 = [NSString stringWithFormat:@"%@-%@-fr", @"W", @"143455"];
  v8[2] = v2;
  v7[3] = @"143444";
  double v3 = [NSString stringWithFormat:@"%@-%@-en", @"W", @"143444"];
  v8[3] = v3;
  v7[4] = @"143460";
  id v4 = [NSString stringWithFormat:@"%@-%@-en", @"W", @"143460"];
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v6 = (void *)qword_1EB5D1178;
  qword_1EB5D1178 = v5;
}

void __72__FCNewsAppConfig_defaultMagazinesConfigRecordIDByLocalizedStorefrontID__block_invoke()
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"143441";
  v0 = [NSString stringWithFormat:@"%@-%@-en", @"configuration-magazines", @"143441"];
  v8[0] = v0;
  v7[1] = @"143455";
  uint64_t v1 = [NSString stringWithFormat:@"%@-%@-en", @"configuration-magazines", @"143455"];
  v8[1] = v1;
  v7[2] = @"143455-fr-ca";
  id v2 = [NSString stringWithFormat:@"%@-%@-fr", @"configuration-magazines", @"143455"];
  v8[2] = v2;
  v7[3] = @"143444";
  double v3 = [NSString stringWithFormat:@"%@-%@-en", @"configuration-magazines", @"143444"];
  v8[3] = v3;
  v7[4] = @"143460";
  id v4 = [NSString stringWithFormat:@"%@-%@-en", @"configuration-magazines", @"143460"];
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v6 = (void *)qword_1EB5D1188;
  qword_1EB5D1188 = v5;
}

void __68__FCNewsAppConfig_defaultAudioConfigRecordIDByLocalizedStorefrontID__block_invoke()
{
  void v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"143441";
  v0 = [NSString stringWithFormat:@"%@-%@-en", @"U", @"143441"];
  v8[0] = v0;
  v7[1] = @"143455";
  uint64_t v1 = [NSString stringWithFormat:@"%@-%@-en", @"U", @"143455"];
  v8[1] = v1;
  v7[2] = @"143455-fr-ca";
  id v2 = [NSString stringWithFormat:@"%@-%@-fr", @"U", @"143455"];
  v8[2] = v2;
  v7[3] = @"143444";
  double v3 = [NSString stringWithFormat:@"%@-%@-en", @"U", @"143444"];
  v8[3] = v3;
  v7[4] = @"143460";
  id v4 = [NSString stringWithFormat:@"%@-%@-en", @"U", @"143460"];
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v6 = (void *)qword_1EB5D1198;
  qword_1EB5D1198 = v5;
}

- (int64_t)numberOfFetchedHeadlinesToReport
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"headlinePersonalizationInstrumentationConfig", 0);

  if (FCAppConfigurationBoolValue(v3, @"sendsAllFetchedHeadlines", 0))
  {
    int64_t v4 = FCAppConfigurationIntegerValue(v3, @"maxNumberOfHeadlines", 0);
  }
  else
  {
    int64_t v4 = FCAppConfigurationIntegerValue(v3, @"numberOfSampledHeadlines", 0);
    uint64_t v5 = FCAppConfigurationIntegerValue(v3, @"maxNumberOfHeadlines", 0);
    if (v4 >= v5) {
      int64_t v4 = v5;
    }
  }

  return v4;
}

- (BOOL)shouldShuffleReportedHeadlines
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"headlinePersonalizationInstrumentationConfig", 0);

  LOBYTE(v2) = FCAppConfigurationBoolValue(v3, @"sendsAllFetchedHeadlines", 0) ^ 1;
  return (char)v2;
}

- (NSString)aiAttributionArticleString
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationStringValue(v2, @"aiAttributionArticleString", 0);

  return (NSString *)v3;
}

- (BOOL)enableTabiMyMagazinesPersonalization
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"enableTabiMyMagazinesPersonalization", 0);

  return v3;
}

- (BOOL)aggregatesInNotificationExtensionXavierEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"aggregatesInNotificationExtensionXavierEnabled", 1);

  return v3;
}

- (BOOL)tabiScoringInNotificationExtensionEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"tabiScoringInNotificationExtensionEnabled", 0);

  return v3;
}

- (BOOL)aggregatesInWidgetsXavierEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"aggregatesInWidgetsXavierEnabled", 1);

  return v3;
}

- (BOOL)tabiScoringInWidgetsEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"tabiScoringInWidgetsEnabled", 0);

  return v3;
}

- (NSDictionary)articleConfig
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"articleConfig", 0);

  return (NSDictionary *)v3;
}

- (int64_t)audioPlaylistSweepRecencyThresholdInDays
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioPlaylistSweepRecencyThresholdInDays", 7);

  return v3;
}

- (double)audioPlaylistSweepListeningPercentageThreshold
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"audioPlaylistSweepListeningPercentageThreshold", 0.4);

  return v3;
}

- (double)offlineModeDetectionPingInterval
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"offlineModeDetectionPingInterval", 1.0);

  return v3;
}

- (double)offlineModeDetectionPingTimeoutInterval
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"offlineModeDetectionPingTimeoutInterval", 5.0);

  return v3;
}

- (double)offlineModeThrottleUnreliableDetectionTimeoutInterval
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  double v3 = FCAppConfigurationDoubleValue(v2, @"offlineModeThrottleUnreliableDetectionTimeoutInterval", 10.0);

  return v3;
}

- (NSDictionary)channelGroupBaselineMultipliers
{
  id v2 = [(FCNewsAppConfig *)self languageConfigDictionary];
  double v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"channelGroupBaselineMultipliers", MEMORY[0x1E4F1CC08]);

  return (NSDictionary *)v3;
}

- (BOOL)tabiBackgroundRefreshEnabled
{
  id v2 = [(FCNewsAppConfig *)self configDictionary];
  char v3 = FCAppConfigurationBoolValue(v2, @"tabiBackgroundRefreshEnabled", 1);

  return v3;
}

- (FCPeopleAlsoReadConfiguration)peopleAlsoReadConfiguration
{
  return self->_peopleAlsoReadConfiguration;
}

- (FCOfflineDownloadsConfiguration)offlineDownloadsConfigOptimized
{
  return self->_offlineDownloadsConfigOptimized;
}

- (NSDictionary)channelUpsellConfigsByChannelID
{
  return self->_channelUpsellConfigsByChannelID;
}

- (NSDictionary)channelPaywallConfigsByChannelID
{
  return self->_channelPaywallConfigsByChannelID;
}

- (FCSportsUpsellConfig)sportsUpsellConfig
{
  return self->_sportsUpsellConfig;
}

- (FCLocationSharingUpsellConfig)locationSharingUpsellConfig
{
  return self->_locationSharingUpsellConfig;
}

- (NSData)autoFavoritesServiceConfigurationJSONData
{
  return self->_autoFavoritesServiceConfigurationJSONData;
}

- (NSData)notificationScoringServiceConfigurationJSONData
{
  return self->_notificationScoringServiceConfigurationJSONData;
}

- (NSDictionary)channelPickerConfigsByName
{
  return self->_channelPickerConfigsByName;
}

- (FCLaunchPresentationConfig)launchPresentationConfig
{
  return self->_launchPresentationConfig;
}

- (NSDictionary)campaignReferralConfigsByID
{
  return self->_campaignReferralConfigsByID;
}

- (NSDictionary)superfeedConfigOverrideResourceIDs
{
  return self->_superfeedConfigOverrideResourceIDs;
}

- (BOOL)privateDataShouldMigrateToV4
{
  return self->_privateDataShouldMigrateToV4;
}

- (BOOL)privateDataShouldCleanupToV4
{
  return self->_privateDataShouldCleanupToV4;
}

@end