@interface NTPBConfig
+ (Class)endpointConfigsType;
+ (Class)externalAnalyticsConfigType;
+ (Class)languageConfigsType;
- (BOOL)alternativeButlerWidgetConfigEnabled;
- (BOOL)articleSearchEnabled;
- (BOOL)corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
- (BOOL)disableThumbnailsForArticleRecirculation;
- (BOOL)diversifyOptionalTopStories;
- (BOOL)hasAlternativeButlerWidgetConfig;
- (BOOL)hasAlternativeButlerWidgetConfigEnabled;
- (BOOL)hasAnalyticsEndpointMaxPayloadSize;
- (BOOL)hasAnfEmbedConfigurationAsset;
- (BOOL)hasAppConfigRefreshRate;
- (BOOL)hasArticleDiversitySimilarityExpectationEnd;
- (BOOL)hasArticleDiversitySimilarityExpectationStart;
- (BOOL)hasArticleRapidUpdatesTimeout;
- (BOOL)hasArticleRecirculationComponentPlacementConfig;
- (BOOL)hasArticleRecirculationConfig;
- (BOOL)hasArticleRecirculationPopularFeedQueryTimeRange;
- (BOOL)hasArticleSearchEnabled;
- (BOOL)hasAutoRefreshMinimumInterval;
- (BOOL)hasAutoScrollToTopFeedTimeout;
- (BOOL)hasBatchedFeedTimeout;
- (BOOL)hasBinningConfig;
- (BOOL)hasButlerWidgetConfig;
- (BOOL)hasCorryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
- (BOOL)hasCorryBarMaxArticleCountForArticleList;
- (BOOL)hasCorryBarMaxArticleCountForSingleArticle;
- (BOOL)hasDisableThumbnailsForArticleRecirculation;
- (BOOL)hasDiversifyOptionalTopStories;
- (BOOL)hasEnabledPrivateDataEncryptionLevel;
- (BOOL)hasEndOfArticleMaxInaccessiblePaidArticles;
- (BOOL)hasEndOfArticleMinPaidHeadlineRatio;
- (BOOL)hasExperimentalizableFieldPostfix;
- (BOOL)hasExpirePinnedArticlesAfter;
- (BOOL)hasExpiredPaidSubscriptionGroupCutoffTime;
- (BOOL)hasFallbackLanguageTag;
- (BOOL)hasForYouNonPersonalizedGroupsOrder;
- (BOOL)hasForYouVideoGroupsConfig;
- (BOOL)hasIadConfig;
- (BOOL)hasInitialArticlesFromNewFavorite;
- (BOOL)hasInterstitialAdLoadDelay;
- (BOOL)hasLongReminderTime;
- (BOOL)hasMaxExpiredPaidSubscriptionGroupCount;
- (BOOL)hasMaxPaidSubscriptionGroupSizeIPad;
- (BOOL)hasMaxPaidSubscriptionGroupSizeIPhone;
- (BOOL)hasMaxTimesHeadlineInPaidSubscriptionGroup;
- (BOOL)hasMaximumRatioOfArticlesInForYouGroup;
- (BOOL)hasMinimumArticleUpdateInterval;
- (BOOL)hasMinimumDistanceBetweenImageOnTopTiles;
- (BOOL)hasMinimumDurationBetweenForYouGroupsWeekday;
- (BOOL)hasMinimumDurationBetweenForYouGroupsWeekend;
- (BOOL)hasMinimumDurationBetweenTrendingGroupsWeekday;
- (BOOL)hasMinimumDurationBetweenTrendingGroupsWeekend;
- (BOOL)hasMinimumFollowCountToRemovePersonalizePlacardInFollowing;
- (BOOL)hasMinimumTrendingUnseenRatio;
- (BOOL)hasNewFavoriteNotificationAlertsFrequency;
- (BOOL)hasNewsletterSubscriptionChecked;
- (BOOL)hasNotificationArticleCacheTimeout;
- (BOOL)hasNotificationArticleWithRapidUpdatesCacheTimeout;
- (BOOL)hasNotificationEnabledChannelsRefreshFrequency;
- (BOOL)hasNumberOfScreenfulsScrolledToBypassWidgetTimeLimit;
- (BOOL)hasOptionalTopStoriesRefreshRate;
- (BOOL)hasOrderFeedEnabledLevel;
- (BOOL)hasOrderFeedEnabledLevelDeprecated;
- (BOOL)hasOrderFeedEndpointEnabled;
- (BOOL)hasPaidSubscriptionConfig;
- (BOOL)hasPersonalizationBundleIdMappingResourceId;
- (BOOL)hasPersonalizationConfig;
- (BOOL)hasPersonalizationPortraitConfigResourceId;
- (BOOL)hasPersonalizationPublisherFavorabilityScoresResourceId;
- (BOOL)hasPersonalizationTreatment;
- (BOOL)hasPersonalizationUrlMappingResourceId;
- (BOOL)hasPersonalizationWhitelistResourceId;
- (BOOL)hasPersonalizationWidgetSectionMappingResourceId;
- (BOOL)hasPrefetchConfig;
- (BOOL)hasPrerollLoadingTimeout;
- (BOOL)hasPrivateDataMigrationCleanupLevel;
- (BOOL)hasPublisherDiversitySlope;
- (BOOL)hasPublisherDiversityYIntercept;
- (BOOL)hasSavedArticlesCutoffTime;
- (BOOL)hasSavedArticlesMaximumCountCellular;
- (BOOL)hasSavedArticlesMaximumCountWifi;
- (BOOL)hasSavedArticlesOpenedCutoffTime;
- (BOOL)hasShortReminderTime;
- (BOOL)hasStateRestorationAllowedTimeWindow;
- (BOOL)hasSubscriptionsGlobalMeteredCount;
- (BOOL)hasSubscriptionsGracePeriodForTokenVerificationSeconds;
- (BOOL)hasSubscriptionsPlacardGlobalMaxPerDay;
- (BOOL)hasSubscriptionsPlacardPublisherFrequencyDays;
- (BOOL)hasSubscriptionsPlacardPublisherFrequencySeconds;
- (BOOL)hasTerminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
- (BOOL)hasTileProminenceScoreBalanceValue;
- (BOOL)hasTimeBetweenSameWidgetReinsertion;
- (BOOL)hasTimeBetweenWidgetInsertions;
- (BOOL)hasTreatmentId;
- (BOOL)hasTrendingStyle;
- (BOOL)hasTrendingTopicsRefreshRate;
- (BOOL)hasUniversalLinksEnabled;
- (BOOL)hasUsUkUseAuWhatsNewFeatures;
- (BOOL)hasUseSecureConnectionForAssets;
- (BOOL)hasUserSegmentationApiConfiguration;
- (BOOL)hasUserSegmentationApiModMax;
- (BOOL)hasUserSegmentationApiModThreshold;
- (BOOL)hasWidgetConfig;
- (BOOL)hasWidgetConfig2;
- (BOOL)hasWidgetEventImmediateUploadModuloForHashing;
- (BOOL)hasWidgetEventImmediateUploadPopulationCeiling;
- (BOOL)hasWidgetEventImmediateUploadPopulationFloor;
- (BOOL)isEqual:(id)a3;
- (BOOL)newsletterSubscriptionChecked;
- (BOOL)orderFeedEndpointEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)terminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
- (BOOL)universalLinksEnabled;
- (BOOL)usUkUseAuWhatsNewFeatures;
- (BOOL)useSecureConnectionForAssets;
- (NSMutableArray)endpointConfigs;
- (NSMutableArray)externalAnalyticsConfigs;
- (NSMutableArray)languageConfigs;
- (NSString)anfEmbedConfigurationAsset;
- (NSString)articleRecirculationComponentPlacementConfig;
- (NSString)articleRecirculationConfig;
- (NSString)experimentalizableFieldPostfix;
- (NSString)fallbackLanguageTag;
- (NSString)forYouNonPersonalizedGroupsOrder;
- (NSString)personalizationBundleIdMappingResourceId;
- (NSString)personalizationPortraitConfigResourceId;
- (NSString)personalizationPublisherFavorabilityScoresResourceId;
- (NSString)personalizationUrlMappingResourceId;
- (NSString)personalizationWhitelistResourceId;
- (NSString)personalizationWidgetSectionMappingResourceId;
- (NTPBBinningConfig)binningConfig;
- (NTPBIAdConfig)iadConfig;
- (NTPBPaidSubscriptionConfig)paidSubscriptionConfig;
- (NTPBPersonalizationConfig)personalizationConfig;
- (NTPBPersonalizationTreatment)personalizationTreatment;
- (NTPBPrefetchConfig)prefetchConfig;
- (NTPBUserSegmentationApiConfiguration)userSegmentationApiConfiguration;
- (NTPBVideoGroupsConfig)forYouVideoGroupsConfig;
- (NTPBWidgetConfig)alternativeButlerWidgetConfig;
- (NTPBWidgetConfig)butlerWidgetConfig;
- (NTPBWidgetConfig)widgetConfig;
- (NTPBWidgetConfig)widgetConfig2;
- (double)articleDiversitySimilarityExpectationEnd;
- (double)articleDiversitySimilarityExpectationStart;
- (double)batchedFeedTimeout;
- (double)endOfArticleMinPaidHeadlineRatio;
- (double)interstitialAdLoadDelay;
- (double)maximumRatioOfArticlesInForYouGroup;
- (double)minimumTrendingUnseenRatio;
- (double)prerollLoadingTimeout;
- (double)publisherDiversitySlope;
- (double)publisherDiversityYIntercept;
- (double)tileProminenceScoreBalanceValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endpointConfigsAtIndex:(unint64_t)a3;
- (id)externalAnalyticsConfigAtIndex:(unint64_t)a3;
- (id)languageConfigsAtIndex:(unint64_t)a3;
- (int)orderFeedEnabledLevelDeprecated;
- (int)trendingStyle;
- (int64_t)analyticsEndpointMaxPayloadSize;
- (int64_t)appConfigRefreshRate;
- (int64_t)articleRapidUpdatesTimeout;
- (int64_t)articleRecirculationPopularFeedQueryTimeRange;
- (int64_t)autoRefreshMinimumInterval;
- (int64_t)autoScrollToTopFeedTimeout;
- (int64_t)corryBarMaxArticleCountForArticleList;
- (int64_t)corryBarMaxArticleCountForSingleArticle;
- (int64_t)endOfArticleMaxInaccessiblePaidArticles;
- (int64_t)expirePinnedArticlesAfter;
- (int64_t)expiredPaidSubscriptionGroupCutoffTime;
- (int64_t)initialArticlesFromNewFavorite;
- (int64_t)longReminderTime;
- (int64_t)maxExpiredPaidSubscriptionGroupCount;
- (int64_t)maxPaidSubscriptionGroupSizeIPad;
- (int64_t)maxPaidSubscriptionGroupSizeIPhone;
- (int64_t)maxTimesHeadlineInPaidSubscriptionGroup;
- (int64_t)minimumArticleUpdateInterval;
- (int64_t)minimumDistanceBetweenImageOnTopTiles;
- (int64_t)minimumDurationBetweenForYouGroupsWeekday;
- (int64_t)minimumDurationBetweenForYouGroupsWeekend;
- (int64_t)minimumDurationBetweenTrendingGroupsWeekday;
- (int64_t)minimumDurationBetweenTrendingGroupsWeekend;
- (int64_t)minimumFollowCountToRemovePersonalizePlacardInFollowing;
- (int64_t)newFavoriteNotificationAlertsFrequency;
- (int64_t)notificationArticleCacheTimeout;
- (int64_t)notificationArticleWithRapidUpdatesCacheTimeout;
- (int64_t)notificationEnabledChannelsRefreshFrequency;
- (int64_t)numberOfScreenfulsScrolledToBypassWidgetTimeLimit;
- (int64_t)optionalTopStoriesRefreshRate;
- (int64_t)savedArticlesCutoffTime;
- (int64_t)savedArticlesMaximumCountCellular;
- (int64_t)savedArticlesMaximumCountWifi;
- (int64_t)savedArticlesOpenedCutoffTime;
- (int64_t)shortReminderTime;
- (int64_t)stateRestorationAllowedTimeWindow;
- (int64_t)subscriptionsGlobalMeteredCount;
- (int64_t)subscriptionsGracePeriodForTokenVerificationSeconds;
- (int64_t)subscriptionsPlacardGlobalMaxPerDay;
- (int64_t)subscriptionsPlacardPublisherFrequencyDays;
- (int64_t)subscriptionsPlacardPublisherFrequencySeconds;
- (int64_t)timeBetweenSameWidgetReinsertion;
- (int64_t)timeBetweenWidgetInsertions;
- (int64_t)topStoriesPublishTimeIntervals;
- (int64_t)topStoriesPublishTimeIntervalsAtIndex:(unint64_t)a3;
- (int64_t)treatmentId;
- (int64_t)trendingTopicsRefreshRate;
- (int64_t)userSegmentationApiModMax;
- (int64_t)userSegmentationApiModThreshold;
- (int64_t)widgetEventImmediateUploadModuloForHashing;
- (int64_t)widgetEventImmediateUploadPopulationCeiling;
- (int64_t)widgetEventImmediateUploadPopulationFloor;
- (unint64_t)endpointConfigsCount;
- (unint64_t)externalAnalyticsConfigsCount;
- (unint64_t)hash;
- (unint64_t)languageConfigsCount;
- (unint64_t)topStoriesPublishTimeIntervalsCount;
- (unsigned)enabledPrivateDataEncryptionLevel;
- (unsigned)orderFeedEnabledLevel;
- (unsigned)privateDataMigrationCleanupLevel;
- (void)addEndpointConfigs:(id)a3;
- (void)addExternalAnalyticsConfig:(id)a3;
- (void)addLanguageConfigs:(id)a3;
- (void)addTopStoriesPublishTimeIntervals:(int64_t)a3;
- (void)clearEndpointConfigs;
- (void)clearExternalAnalyticsConfigs;
- (void)clearLanguageConfigs;
- (void)clearTopStoriesPublishTimeIntervals;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAlternativeButlerWidgetConfig:(id)a3;
- (void)setAlternativeButlerWidgetConfigEnabled:(BOOL)a3;
- (void)setAnalyticsEndpointMaxPayloadSize:(int64_t)a3;
- (void)setAnfEmbedConfigurationAsset:(id)a3;
- (void)setAppConfigRefreshRate:(int64_t)a3;
- (void)setArticleDiversitySimilarityExpectationEnd:(double)a3;
- (void)setArticleDiversitySimilarityExpectationStart:(double)a3;
- (void)setArticleRapidUpdatesTimeout:(int64_t)a3;
- (void)setArticleRecirculationComponentPlacementConfig:(id)a3;
- (void)setArticleRecirculationConfig:(id)a3;
- (void)setArticleRecirculationPopularFeedQueryTimeRange:(int64_t)a3;
- (void)setArticleSearchEnabled:(BOOL)a3;
- (void)setAutoRefreshMinimumInterval:(int64_t)a3;
- (void)setAutoScrollToTopFeedTimeout:(int64_t)a3;
- (void)setBatchedFeedTimeout:(double)a3;
- (void)setBinningConfig:(id)a3;
- (void)setButlerWidgetConfig:(id)a3;
- (void)setCorryBarHideDiscoverMoreInterstitialForNonOnboardedUsers:(BOOL)a3;
- (void)setCorryBarMaxArticleCountForArticleList:(int64_t)a3;
- (void)setCorryBarMaxArticleCountForSingleArticle:(int64_t)a3;
- (void)setDisableThumbnailsForArticleRecirculation:(BOOL)a3;
- (void)setDiversifyOptionalTopStories:(BOOL)a3;
- (void)setEnabledPrivateDataEncryptionLevel:(unsigned int)a3;
- (void)setEndOfArticleMaxInaccessiblePaidArticles:(int64_t)a3;
- (void)setEndOfArticleMinPaidHeadlineRatio:(double)a3;
- (void)setEndpointConfigs:(id)a3;
- (void)setExperimentalizableFieldPostfix:(id)a3;
- (void)setExpirePinnedArticlesAfter:(int64_t)a3;
- (void)setExpiredPaidSubscriptionGroupCutoffTime:(int64_t)a3;
- (void)setExternalAnalyticsConfigs:(id)a3;
- (void)setFallbackLanguageTag:(id)a3;
- (void)setForYouNonPersonalizedGroupsOrder:(id)a3;
- (void)setForYouVideoGroupsConfig:(id)a3;
- (void)setHasAlternativeButlerWidgetConfigEnabled:(BOOL)a3;
- (void)setHasAnalyticsEndpointMaxPayloadSize:(BOOL)a3;
- (void)setHasAppConfigRefreshRate:(BOOL)a3;
- (void)setHasArticleDiversitySimilarityExpectationEnd:(BOOL)a3;
- (void)setHasArticleDiversitySimilarityExpectationStart:(BOOL)a3;
- (void)setHasArticleRapidUpdatesTimeout:(BOOL)a3;
- (void)setHasArticleRecirculationPopularFeedQueryTimeRange:(BOOL)a3;
- (void)setHasArticleSearchEnabled:(BOOL)a3;
- (void)setHasAutoRefreshMinimumInterval:(BOOL)a3;
- (void)setHasAutoScrollToTopFeedTimeout:(BOOL)a3;
- (void)setHasBatchedFeedTimeout:(BOOL)a3;
- (void)setHasCorryBarHideDiscoverMoreInterstitialForNonOnboardedUsers:(BOOL)a3;
- (void)setHasCorryBarMaxArticleCountForArticleList:(BOOL)a3;
- (void)setHasCorryBarMaxArticleCountForSingleArticle:(BOOL)a3;
- (void)setHasDisableThumbnailsForArticleRecirculation:(BOOL)a3;
- (void)setHasDiversifyOptionalTopStories:(BOOL)a3;
- (void)setHasEnabledPrivateDataEncryptionLevel:(BOOL)a3;
- (void)setHasEndOfArticleMaxInaccessiblePaidArticles:(BOOL)a3;
- (void)setHasEndOfArticleMinPaidHeadlineRatio:(BOOL)a3;
- (void)setHasExpirePinnedArticlesAfter:(BOOL)a3;
- (void)setHasExpiredPaidSubscriptionGroupCutoffTime:(BOOL)a3;
- (void)setHasInitialArticlesFromNewFavorite:(BOOL)a3;
- (void)setHasInterstitialAdLoadDelay:(BOOL)a3;
- (void)setHasLongReminderTime:(BOOL)a3;
- (void)setHasMaxExpiredPaidSubscriptionGroupCount:(BOOL)a3;
- (void)setHasMaxPaidSubscriptionGroupSizeIPad:(BOOL)a3;
- (void)setHasMaxPaidSubscriptionGroupSizeIPhone:(BOOL)a3;
- (void)setHasMaxTimesHeadlineInPaidSubscriptionGroup:(BOOL)a3;
- (void)setHasMaximumRatioOfArticlesInForYouGroup:(BOOL)a3;
- (void)setHasMinimumArticleUpdateInterval:(BOOL)a3;
- (void)setHasMinimumDistanceBetweenImageOnTopTiles:(BOOL)a3;
- (void)setHasMinimumDurationBetweenForYouGroupsWeekday:(BOOL)a3;
- (void)setHasMinimumDurationBetweenForYouGroupsWeekend:(BOOL)a3;
- (void)setHasMinimumDurationBetweenTrendingGroupsWeekday:(BOOL)a3;
- (void)setHasMinimumDurationBetweenTrendingGroupsWeekend:(BOOL)a3;
- (void)setHasMinimumFollowCountToRemovePersonalizePlacardInFollowing:(BOOL)a3;
- (void)setHasMinimumTrendingUnseenRatio:(BOOL)a3;
- (void)setHasNewFavoriteNotificationAlertsFrequency:(BOOL)a3;
- (void)setHasNewsletterSubscriptionChecked:(BOOL)a3;
- (void)setHasNotificationArticleCacheTimeout:(BOOL)a3;
- (void)setHasNotificationArticleWithRapidUpdatesCacheTimeout:(BOOL)a3;
- (void)setHasNotificationEnabledChannelsRefreshFrequency:(BOOL)a3;
- (void)setHasNumberOfScreenfulsScrolledToBypassWidgetTimeLimit:(BOOL)a3;
- (void)setHasOptionalTopStoriesRefreshRate:(BOOL)a3;
- (void)setHasOrderFeedEnabledLevel:(BOOL)a3;
- (void)setHasOrderFeedEnabledLevelDeprecated:(BOOL)a3;
- (void)setHasOrderFeedEndpointEnabled:(BOOL)a3;
- (void)setHasPrerollLoadingTimeout:(BOOL)a3;
- (void)setHasPrivateDataMigrationCleanupLevel:(BOOL)a3;
- (void)setHasPublisherDiversitySlope:(BOOL)a3;
- (void)setHasPublisherDiversityYIntercept:(BOOL)a3;
- (void)setHasSavedArticlesCutoffTime:(BOOL)a3;
- (void)setHasSavedArticlesMaximumCountCellular:(BOOL)a3;
- (void)setHasSavedArticlesMaximumCountWifi:(BOOL)a3;
- (void)setHasSavedArticlesOpenedCutoffTime:(BOOL)a3;
- (void)setHasShortReminderTime:(BOOL)a3;
- (void)setHasStateRestorationAllowedTimeWindow:(BOOL)a3;
- (void)setHasSubscriptionsGlobalMeteredCount:(BOOL)a3;
- (void)setHasSubscriptionsGracePeriodForTokenVerificationSeconds:(BOOL)a3;
- (void)setHasSubscriptionsPlacardGlobalMaxPerDay:(BOOL)a3;
- (void)setHasSubscriptionsPlacardPublisherFrequencyDays:(BOOL)a3;
- (void)setHasSubscriptionsPlacardPublisherFrequencySeconds:(BOOL)a3;
- (void)setHasTerminateAppOnBackgroundAfterJoiningOrLeavingExperiment:(BOOL)a3;
- (void)setHasTileProminenceScoreBalanceValue:(BOOL)a3;
- (void)setHasTimeBetweenSameWidgetReinsertion:(BOOL)a3;
- (void)setHasTimeBetweenWidgetInsertions:(BOOL)a3;
- (void)setHasTreatmentId:(BOOL)a3;
- (void)setHasTrendingStyle:(BOOL)a3;
- (void)setHasTrendingTopicsRefreshRate:(BOOL)a3;
- (void)setHasUniversalLinksEnabled:(BOOL)a3;
- (void)setHasUsUkUseAuWhatsNewFeatures:(BOOL)a3;
- (void)setHasUseSecureConnectionForAssets:(BOOL)a3;
- (void)setHasUserSegmentationApiModMax:(BOOL)a3;
- (void)setHasUserSegmentationApiModThreshold:(BOOL)a3;
- (void)setHasWidgetEventImmediateUploadModuloForHashing:(BOOL)a3;
- (void)setHasWidgetEventImmediateUploadPopulationCeiling:(BOOL)a3;
- (void)setHasWidgetEventImmediateUploadPopulationFloor:(BOOL)a3;
- (void)setIadConfig:(id)a3;
- (void)setInitialArticlesFromNewFavorite:(int64_t)a3;
- (void)setInterstitialAdLoadDelay:(double)a3;
- (void)setLanguageConfigs:(id)a3;
- (void)setLongReminderTime:(int64_t)a3;
- (void)setMaxExpiredPaidSubscriptionGroupCount:(int64_t)a3;
- (void)setMaxPaidSubscriptionGroupSizeIPad:(int64_t)a3;
- (void)setMaxPaidSubscriptionGroupSizeIPhone:(int64_t)a3;
- (void)setMaxTimesHeadlineInPaidSubscriptionGroup:(int64_t)a3;
- (void)setMaximumRatioOfArticlesInForYouGroup:(double)a3;
- (void)setMinimumArticleUpdateInterval:(int64_t)a3;
- (void)setMinimumDistanceBetweenImageOnTopTiles:(int64_t)a3;
- (void)setMinimumDurationBetweenForYouGroupsWeekday:(int64_t)a3;
- (void)setMinimumDurationBetweenForYouGroupsWeekend:(int64_t)a3;
- (void)setMinimumDurationBetweenTrendingGroupsWeekday:(int64_t)a3;
- (void)setMinimumDurationBetweenTrendingGroupsWeekend:(int64_t)a3;
- (void)setMinimumFollowCountToRemovePersonalizePlacardInFollowing:(int64_t)a3;
- (void)setMinimumTrendingUnseenRatio:(double)a3;
- (void)setNewFavoriteNotificationAlertsFrequency:(int64_t)a3;
- (void)setNewsletterSubscriptionChecked:(BOOL)a3;
- (void)setNotificationArticleCacheTimeout:(int64_t)a3;
- (void)setNotificationArticleWithRapidUpdatesCacheTimeout:(int64_t)a3;
- (void)setNotificationEnabledChannelsRefreshFrequency:(int64_t)a3;
- (void)setNumberOfScreenfulsScrolledToBypassWidgetTimeLimit:(int64_t)a3;
- (void)setOptionalTopStoriesRefreshRate:(int64_t)a3;
- (void)setOrderFeedEnabledLevel:(unsigned int)a3;
- (void)setOrderFeedEnabledLevelDeprecated:(int)a3;
- (void)setOrderFeedEndpointEnabled:(BOOL)a3;
- (void)setPaidSubscriptionConfig:(id)a3;
- (void)setPersonalizationBundleIdMappingResourceId:(id)a3;
- (void)setPersonalizationConfig:(id)a3;
- (void)setPersonalizationPortraitConfigResourceId:(id)a3;
- (void)setPersonalizationPublisherFavorabilityScoresResourceId:(id)a3;
- (void)setPersonalizationTreatment:(id)a3;
- (void)setPersonalizationUrlMappingResourceId:(id)a3;
- (void)setPersonalizationWhitelistResourceId:(id)a3;
- (void)setPersonalizationWidgetSectionMappingResourceId:(id)a3;
- (void)setPrefetchConfig:(id)a3;
- (void)setPrerollLoadingTimeout:(double)a3;
- (void)setPrivateDataMigrationCleanupLevel:(unsigned int)a3;
- (void)setPublisherDiversitySlope:(double)a3;
- (void)setPublisherDiversityYIntercept:(double)a3;
- (void)setSavedArticlesCutoffTime:(int64_t)a3;
- (void)setSavedArticlesMaximumCountCellular:(int64_t)a3;
- (void)setSavedArticlesMaximumCountWifi:(int64_t)a3;
- (void)setSavedArticlesOpenedCutoffTime:(int64_t)a3;
- (void)setShortReminderTime:(int64_t)a3;
- (void)setStateRestorationAllowedTimeWindow:(int64_t)a3;
- (void)setSubscriptionsGlobalMeteredCount:(int64_t)a3;
- (void)setSubscriptionsGracePeriodForTokenVerificationSeconds:(int64_t)a3;
- (void)setSubscriptionsPlacardGlobalMaxPerDay:(int64_t)a3;
- (void)setSubscriptionsPlacardPublisherFrequencyDays:(int64_t)a3;
- (void)setSubscriptionsPlacardPublisherFrequencySeconds:(int64_t)a3;
- (void)setTerminateAppOnBackgroundAfterJoiningOrLeavingExperiment:(BOOL)a3;
- (void)setTileProminenceScoreBalanceValue:(double)a3;
- (void)setTimeBetweenSameWidgetReinsertion:(int64_t)a3;
- (void)setTimeBetweenWidgetInsertions:(int64_t)a3;
- (void)setTopStoriesPublishTimeIntervals:(int64_t *)a3 count:(unint64_t)a4;
- (void)setTreatmentId:(int64_t)a3;
- (void)setTrendingStyle:(int)a3;
- (void)setTrendingTopicsRefreshRate:(int64_t)a3;
- (void)setUniversalLinksEnabled:(BOOL)a3;
- (void)setUsUkUseAuWhatsNewFeatures:(BOOL)a3;
- (void)setUseSecureConnectionForAssets:(BOOL)a3;
- (void)setUserSegmentationApiConfiguration:(id)a3;
- (void)setUserSegmentationApiModMax:(int64_t)a3;
- (void)setUserSegmentationApiModThreshold:(int64_t)a3;
- (void)setWidgetConfig2:(id)a3;
- (void)setWidgetConfig:(id)a3;
- (void)setWidgetEventImmediateUploadModuloForHashing:(int64_t)a3;
- (void)setWidgetEventImmediateUploadPopulationCeiling:(int64_t)a3;
- (void)setWidgetEventImmediateUploadPopulationFloor:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBConfig

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBConfig;
  [(NTPBConfig *)&v3 dealloc];
}

- (BOOL)hasFallbackLanguageTag
{
  return self->_fallbackLanguageTag != 0;
}

- (void)clearLanguageConfigs
{
}

- (void)addLanguageConfigs:(id)a3
{
  id v4 = a3;
  languageConfigs = self->_languageConfigs;
  id v8 = v4;
  if (!languageConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_languageConfigs;
    self->_languageConfigs = v6;

    id v4 = v8;
    languageConfigs = self->_languageConfigs;
  }
  [(NSMutableArray *)languageConfigs addObject:v4];
}

- (unint64_t)languageConfigsCount
{
  return [(NSMutableArray *)self->_languageConfigs count];
}

- (id)languageConfigsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_languageConfigs objectAtIndex:a3];
}

+ (Class)languageConfigsType
{
  return (Class)objc_opt_class();
}

- (void)setShortReminderTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_shortReminderTime = a3;
}

- (void)setHasShortReminderTime:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasShortReminderTime
{
  return (*(void *)&self->_has >> 44) & 1;
}

- (void)setLongReminderTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_longReminderTime = a3;
}

- (void)setHasLongReminderTime:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasLongReminderTime
{
  return (*(void *)&self->_has >> 17) & 1;
}

- (void)setNewsletterSubscriptionChecked:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x80u;
  self->_newsletterSubscriptionChecked = a3;
}

- (void)setHasNewsletterSubscriptionChecked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v3;
}

- (BOOL)hasNewsletterSubscriptionChecked
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (void)setBatchedFeedTimeout:(double)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_batchedFeedTimeout = a3;
}

- (void)setHasBatchedFeedTimeout:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasBatchedFeedTimeout
{
  return (*(void *)&self->_has >> 8) & 1;
}

- (void)setInterstitialAdLoadDelay:(double)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_interstitialAdLoadDelay = a3;
}

- (void)setHasInterstitialAdLoadDelay:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasInterstitialAdLoadDelay
{
  return (*(void *)&self->_has >> 16) & 1;
}

- (void)setPrerollLoadingTimeout:(double)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_prerollLoadingTimeout = a3;
}

- (void)setHasPrerollLoadingTimeout:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasPrerollLoadingTimeout
{
  return (*(void *)&self->_has >> 37) & 1;
}

- (void)clearEndpointConfigs
{
}

- (void)addEndpointConfigs:(id)a3
{
  id v4 = a3;
  endpointConfigs = self->_endpointConfigs;
  id v8 = v4;
  if (!endpointConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_endpointConfigs;
    self->_endpointConfigs = v6;

    id v4 = v8;
    endpointConfigs = self->_endpointConfigs;
  }
  [(NSMutableArray *)endpointConfigs addObject:v4];
}

- (unint64_t)endpointConfigsCount
{
  return [(NSMutableArray *)self->_endpointConfigs count];
}

- (id)endpointConfigsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_endpointConfigs objectAtIndex:a3];
}

+ (Class)endpointConfigsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPersonalizationConfig
{
  return self->_personalizationConfig != 0;
}

- (BOOL)hasIadConfig
{
  return self->_iadConfig != 0;
}

- (BOOL)hasPrefetchConfig
{
  return self->_prefetchConfig != 0;
}

- (void)setTileProminenceScoreBalanceValue:(double)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_tileProminenceScoreBalanceValue = a3;
}

- (void)setHasTileProminenceScoreBalanceValue:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTileProminenceScoreBalanceValue
{
  return (*(void *)&self->_has >> 51) & 1;
}

- (void)setMinimumArticleUpdateInterval:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_minimumArticleUpdateInterval = a3;
}

- (void)setHasMinimumArticleUpdateInterval:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasMinimumArticleUpdateInterval
{
  return (*(void *)&self->_has >> 23) & 1;
}

- (void)setInitialArticlesFromNewFavorite:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_initialArticlesFromNewFavorite = a3;
}

- (void)setHasInitialArticlesFromNewFavorite:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasInitialArticlesFromNewFavorite
{
  return (*(void *)&self->_has >> 15) & 1;
}

- (void)setAutoScrollToTopFeedTimeout:(int64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_autoScrollToTopFeedTimeout = a3;
}

- (void)setHasAutoScrollToTopFeedTimeout:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasAutoScrollToTopFeedTimeout
{
  return (*(void *)&self->_has >> 7) & 1;
}

- (void)setTrendingTopicsRefreshRate:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_trendingTopicsRefreshRate = a3;
}

- (void)setHasTrendingTopicsRefreshRate:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTrendingTopicsRefreshRate
{
  return (*(void *)&self->_has >> 55) & 1;
}

- (void)setAppConfigRefreshRate:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_appConfigRefreshRate = a3;
}

- (void)setHasAppConfigRefreshRate:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasAppConfigRefreshRate
{
  return (*(void *)&self->_has >> 1) & 1;
}

- (void)setMinimumDistanceBetweenImageOnTopTiles:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_minimumDistanceBetweenImageOnTopTiles = a3;
}

- (void)setHasMinimumDistanceBetweenImageOnTopTiles:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasMinimumDistanceBetweenImageOnTopTiles
{
  return (*(void *)&self->_has >> 24) & 1;
}

- (void)setTimeBetweenWidgetInsertions:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_timeBetweenWidgetInsertions = a3;
}

- (void)setHasTimeBetweenWidgetInsertions:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTimeBetweenWidgetInsertions
{
  return (*(void *)&self->_has >> 53) & 1;
}

- (void)setTimeBetweenSameWidgetReinsertion:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_timeBetweenSameWidgetReinsertion = a3;
}

- (void)setHasTimeBetweenSameWidgetReinsertion:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTimeBetweenSameWidgetReinsertion
{
  return (*(void *)&self->_has >> 52) & 1;
}

- (void)setNumberOfScreenfulsScrolledToBypassWidgetTimeLimit:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit = a3;
}

- (void)setHasNumberOfScreenfulsScrolledToBypassWidgetTimeLimit:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasNumberOfScreenfulsScrolledToBypassWidgetTimeLimit
{
  return (*(void *)&self->_has >> 35) & 1;
}

- (void)setArticleRapidUpdatesTimeout:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_articleRapidUpdatesTimeout = a3;
}

- (void)setHasArticleRapidUpdatesTimeout:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasArticleRapidUpdatesTimeout
{
  return (*(void *)&self->_has >> 4) & 1;
}

- (void)setSubscriptionsGlobalMeteredCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_subscriptionsGlobalMeteredCount = a3;
}

- (void)setHasSubscriptionsGlobalMeteredCount:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsGlobalMeteredCount
{
  return (*(void *)&self->_has >> 46) & 1;
}

- (BOOL)hasAnfEmbedConfigurationAsset
{
  return self->_anfEmbedConfigurationAsset != 0;
}

- (void)setSubscriptionsPlacardPublisherFrequencyDays:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_subscriptionsPlacardPublisherFrequencyDays = a3;
}

- (void)setHasSubscriptionsPlacardPublisherFrequencyDays:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsPlacardPublisherFrequencyDays
{
  return (*(void *)&self->_has >> 49) & 1;
}

- (void)setSubscriptionsPlacardGlobalMaxPerDay:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_subscriptionsPlacardGlobalMaxPerDay = a3;
}

- (void)setHasSubscriptionsPlacardGlobalMaxPerDay:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsPlacardGlobalMaxPerDay
{
  return HIWORD(*(void *)&self->_has) & 1;
}

- (void)setSubscriptionsGracePeriodForTokenVerificationSeconds:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_subscriptionsGracePeriodForTokenVerificationSeconds = a3;
}

- (void)setHasSubscriptionsGracePeriodForTokenVerificationSeconds:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsGracePeriodForTokenVerificationSeconds
{
  return (*(void *)&self->_has >> 47) & 1;
}

- (void)setNewFavoriteNotificationAlertsFrequency:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_newFavoriteNotificationAlertsFrequency = a3;
}

- (void)setHasNewFavoriteNotificationAlertsFrequency:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasNewFavoriteNotificationAlertsFrequency
{
  return (*(void *)&self->_has >> 31) & 1;
}

- (void)setEndOfArticleMinPaidHeadlineRatio:(double)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_endOfArticleMinPaidHeadlineRatio = a3;
}

- (void)setHasEndOfArticleMinPaidHeadlineRatio:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasEndOfArticleMinPaidHeadlineRatio
{
  return (*(void *)&self->_has >> 12) & 1;
}

- (void)setEndOfArticleMaxInaccessiblePaidArticles:(int64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_endOfArticleMaxInaccessiblePaidArticles = a3;
}

- (void)setHasEndOfArticleMaxInaccessiblePaidArticles:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasEndOfArticleMaxInaccessiblePaidArticles
{
  return (*(void *)&self->_has >> 11) & 1;
}

- (BOOL)hasWidgetConfig
{
  return self->_widgetConfig != 0;
}

- (void)setUniversalLinksEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x400u;
  self->_universalLinksEnabled = a3;
}

- (void)setHasUniversalLinksEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFBFF | v3;
}

- (BOOL)hasUniversalLinksEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 10) & 1;
}

- (void)setNotificationArticleCacheTimeout:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_notificationArticleCacheTimeout = a3;
}

- (void)setHasNotificationArticleCacheTimeout:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasNotificationArticleCacheTimeout
{
  return HIDWORD(*(void *)&self->_has) & 1;
}

- (void)setNotificationArticleWithRapidUpdatesCacheTimeout:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_notificationArticleWithRapidUpdatesCacheTimeout = a3;
}

- (void)setHasNotificationArticleWithRapidUpdatesCacheTimeout:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasNotificationArticleWithRapidUpdatesCacheTimeout
{
  return (*(void *)&self->_has >> 33) & 1;
}

- (BOOL)hasForYouNonPersonalizedGroupsOrder
{
  return self->_forYouNonPersonalizedGroupsOrder != 0;
}

- (int64_t)notificationEnabledChannelsRefreshFrequency
{
  if ((*(void *)&self->_has & 0x400000000) != 0) {
    return self->_notificationEnabledChannelsRefreshFrequency;
  }
  else {
    return 604800;
  }
}

- (void)setNotificationEnabledChannelsRefreshFrequency:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_notificationEnabledChannelsRefreshFrequency = a3;
}

- (void)setHasNotificationEnabledChannelsRefreshFrequency:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasNotificationEnabledChannelsRefreshFrequency
{
  return (*(void *)&self->_has >> 34) & 1;
}

- (int64_t)savedArticlesMaximumCountWifi
{
  if ((*(void *)&self->_has & 0x40000000000) != 0) {
    return self->_savedArticlesMaximumCountWifi;
  }
  else {
    return 100;
  }
}

- (void)setSavedArticlesMaximumCountWifi:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_savedArticlesMaximumCountWifi = a3;
}

- (void)setHasSavedArticlesMaximumCountWifi:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasSavedArticlesMaximumCountWifi
{
  return (*(void *)&self->_has >> 42) & 1;
}

- (int64_t)savedArticlesMaximumCountCellular
{
  if ((*(void *)&self->_has & 0x20000000000) != 0) {
    return self->_savedArticlesMaximumCountCellular;
  }
  else {
    return 10;
  }
}

- (void)setSavedArticlesMaximumCountCellular:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_savedArticlesMaximumCountCellular = a3;
}

- (void)setHasSavedArticlesMaximumCountCellular:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasSavedArticlesMaximumCountCellular
{
  return (*(void *)&self->_has >> 41) & 1;
}

- (int64_t)savedArticlesCutoffTime
{
  if ((*(void *)&self->_has & 0x10000000000) != 0) {
    return self->_savedArticlesCutoffTime;
  }
  else {
    return 2592000;
  }
}

- (void)setSavedArticlesCutoffTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_savedArticlesCutoffTime = a3;
}

- (void)setHasSavedArticlesCutoffTime:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasSavedArticlesCutoffTime
{
  return (*(void *)&self->_has >> 40) & 1;
}

- (int64_t)savedArticlesOpenedCutoffTime
{
  if ((*(void *)&self->_has & 0x80000000000) != 0) {
    return self->_savedArticlesOpenedCutoffTime;
  }
  else {
    return 21600;
  }
}

- (void)setSavedArticlesOpenedCutoffTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_savedArticlesOpenedCutoffTime = a3;
}

- (void)setHasSavedArticlesOpenedCutoffTime:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasSavedArticlesOpenedCutoffTime
{
  return (*(void *)&self->_has >> 43) & 1;
}

- (BOOL)hasAlternativeButlerWidgetConfig
{
  return self->_alternativeButlerWidgetConfig != 0;
}

- (void)setAlternativeButlerWidgetConfigEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 4u;
  self->_alternativeButlerWidgetConfigEnabled = a3;
}

- (void)setHasAlternativeButlerWidgetConfigEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v3;
}

- (BOOL)hasAlternativeButlerWidgetConfigEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (BOOL)hasButlerWidgetConfig
{
  return self->_butlerWidgetConfig != 0;
}

- (BOOL)hasPaidSubscriptionConfig
{
  return self->_paidSubscriptionConfig != 0;
}

- (double)articleDiversitySimilarityExpectationStart
{
  double result = 0.0;
  if ((*(void *)&self->_has & 8) != 0) {
    return self->_articleDiversitySimilarityExpectationStart;
  }
  return result;
}

- (void)setArticleDiversitySimilarityExpectationStart:(double)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_articleDiversitySimilarityExpectationStart = a3;
}

- (void)setHasArticleDiversitySimilarityExpectationStart:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasArticleDiversitySimilarityExpectationStart
{
  return (*(void *)&self->_has >> 3) & 1;
}

- (double)articleDiversitySimilarityExpectationEnd
{
  if ((*(void *)&self->_has & 4) != 0) {
    return self->_articleDiversitySimilarityExpectationEnd;
  }
  else {
    return 0.1;
  }
}

- (void)setArticleDiversitySimilarityExpectationEnd:(double)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_articleDiversitySimilarityExpectationEnd = a3;
}

- (void)setHasArticleDiversitySimilarityExpectationEnd:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasArticleDiversitySimilarityExpectationEnd
{
  return (*(void *)&self->_has >> 2) & 1;
}

- (int64_t)maxPaidSubscriptionGroupSizeIPad
{
  if ((*(void *)&self->_has & 0x80000) != 0) {
    return self->_maxPaidSubscriptionGroupSizeIPad;
  }
  else {
    return 5;
  }
}

- (void)setMaxPaidSubscriptionGroupSizeIPad:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_maxPaidSubscriptionGroupSizeIPad = a3;
}

- (void)setHasMaxPaidSubscriptionGroupSizeIPad:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasMaxPaidSubscriptionGroupSizeIPad
{
  return (*(void *)&self->_has >> 19) & 1;
}

- (int64_t)maxPaidSubscriptionGroupSizeIPhone
{
  if ((*(void *)&self->_has & 0x100000) != 0) {
    return self->_maxPaidSubscriptionGroupSizeIPhone;
  }
  else {
    return 5;
  }
}

- (void)setMaxPaidSubscriptionGroupSizeIPhone:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_maxPaidSubscriptionGroupSizeIPhone = a3;
}

- (void)setHasMaxPaidSubscriptionGroupSizeIPhone:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasMaxPaidSubscriptionGroupSizeIPhone
{
  return (*(void *)&self->_has >> 20) & 1;
}

- (int64_t)maxTimesHeadlineInPaidSubscriptionGroup
{
  if ((*(void *)&self->_has & 0x200000) != 0) {
    return self->_maxTimesHeadlineInPaidSubscriptionGroup;
  }
  else {
    return 3;
  }
}

- (void)setMaxTimesHeadlineInPaidSubscriptionGroup:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_maxTimesHeadlineInPaidSubscriptionGroup = a3;
}

- (void)setHasMaxTimesHeadlineInPaidSubscriptionGroup:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasMaxTimesHeadlineInPaidSubscriptionGroup
{
  return (*(void *)&self->_has >> 21) & 1;
}

- (double)publisherDiversitySlope
{
  double result = 0.75;
  if ((*(void *)&self->_has & 0x4000000000) != 0) {
    return self->_publisherDiversitySlope;
  }
  return result;
}

- (void)setPublisherDiversitySlope:(double)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_publisherDiversitySlope = a3;
}

- (void)setHasPublisherDiversitySlope:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasPublisherDiversitySlope
{
  return (*(void *)&self->_has >> 38) & 1;
}

- (double)publisherDiversityYIntercept
{
  double result = 0.25;
  if ((*(void *)&self->_has & 0x8000000000) != 0) {
    return self->_publisherDiversityYIntercept;
  }
  return result;
}

- (void)setPublisherDiversityYIntercept:(double)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_publisherDiversityYIntercept = a3;
}

- (void)setHasPublisherDiversityYIntercept:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasPublisherDiversityYIntercept
{
  return (*(void *)&self->_has >> 39) & 1;
}

- (int64_t)expiredPaidSubscriptionGroupCutoffTime
{
  if ((*(void *)&self->_has & 0x4000) != 0) {
    return self->_expiredPaidSubscriptionGroupCutoffTime;
  }
  else {
    return 864000;
  }
}

- (void)setExpiredPaidSubscriptionGroupCutoffTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_expiredPaidSubscriptionGroupCutoffTime = a3;
}

- (void)setHasExpiredPaidSubscriptionGroupCutoffTime:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasExpiredPaidSubscriptionGroupCutoffTime
{
  return (*(void *)&self->_has >> 14) & 1;
}

- (int64_t)maxExpiredPaidSubscriptionGroupCount
{
  if ((*(void *)&self->_has & 0x40000) != 0) {
    return self->_maxExpiredPaidSubscriptionGroupCount;
  }
  else {
    return 3;
  }
}

- (void)setMaxExpiredPaidSubscriptionGroupCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_maxExpiredPaidSubscriptionGroupCount = a3;
}

- (void)setHasMaxExpiredPaidSubscriptionGroupCount:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasMaxExpiredPaidSubscriptionGroupCount
{
  return (*(void *)&self->_has >> 18) & 1;
}

- (BOOL)hasWidgetConfig2
{
  return self->_widgetConfig2 != 0;
}

- (void)setSubscriptionsPlacardPublisherFrequencySeconds:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_subscriptionsPlacardPublisherFrequencySeconds = a3;
}

- (void)setHasSubscriptionsPlacardPublisherFrequencySeconds:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsPlacardPublisherFrequencySeconds
{
  return (*(void *)&self->_has >> 50) & 1;
}

- (void)setTreatmentId:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_treatmentId = a3;
}

- (void)setHasTreatmentId:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTreatmentId
{
  return (*(void *)&self->_has >> 54) & 1;
}

- (BOOL)hasBinningConfig
{
  return self->_binningConfig != 0;
}

- (BOOL)hasPersonalizationTreatment
{
  return self->_personalizationTreatment != 0;
}

- (int64_t)analyticsEndpointMaxPayloadSize
{
  if (*(void *)&self->_has) {
    return self->_analyticsEndpointMaxPayloadSize;
  }
  else {
    return 500000;
  }
}

- (void)setAnalyticsEndpointMaxPayloadSize:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_analyticsEndpointMaxPayloadSize = a3;
}

- (void)setHasAnalyticsEndpointMaxPayloadSize:(BOOL)a3
{
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasAnalyticsEndpointMaxPayloadSize
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)orderFeedEndpointEnabled
{
  return (*((_WORD *)&self->_has + 4) & 0x100) == 0 || self->_orderFeedEndpointEnabled;
}

- (void)setOrderFeedEndpointEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x100u;
  self->_orderFeedEndpointEnabled = a3;
}

- (void)setHasOrderFeedEndpointEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v3;
}

- (BOOL)hasOrderFeedEndpointEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (BOOL)hasPersonalizationBundleIdMappingResourceId
{
  return self->_personalizationBundleIdMappingResourceId != 0;
}

- (BOOL)hasPersonalizationUrlMappingResourceId
{
  return self->_personalizationUrlMappingResourceId != 0;
}

- (BOOL)hasPersonalizationWhitelistResourceId
{
  return self->_personalizationWhitelistResourceId != 0;
}

- (void)setEnabledPrivateDataEncryptionLevel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_enabledPrivateDataEncryptionLevel = a3;
}

- (void)setHasEnabledPrivateDataEncryptionLevel:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasEnabledPrivateDataEncryptionLevel
{
  return (*(void *)&self->_has >> 61) & 1;
}

- (BOOL)hasPersonalizationPublisherFavorabilityScoresResourceId
{
  return self->_personalizationPublisherFavorabilityScoresResourceId != 0;
}

- (BOOL)hasPersonalizationWidgetSectionMappingResourceId
{
  return self->_personalizationWidgetSectionMappingResourceId != 0;
}

- (void)setCorryBarMaxArticleCountForArticleList:(int64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_corryBarMaxArticleCountForArticleList = a3;
}

- (void)setHasCorryBarMaxArticleCountForArticleList:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasCorryBarMaxArticleCountForArticleList
{
  return (*(void *)&self->_has >> 9) & 1;
}

- (void)setCorryBarMaxArticleCountForSingleArticle:(int64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_corryBarMaxArticleCountForSingleArticle = a3;
}

- (void)setHasCorryBarMaxArticleCountForSingleArticle:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasCorryBarMaxArticleCountForSingleArticle
{
  return (*(void *)&self->_has >> 10) & 1;
}

- (void)setCorryBarHideDiscoverMoreInterstitialForNonOnboardedUsers:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x10u;
  self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers = a3;
}

- (void)setHasCorryBarHideDiscoverMoreInterstitialForNonOnboardedUsers:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v3;
}

- (BOOL)hasCorryBarHideDiscoverMoreInterstitialForNonOnboardedUsers
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
}

- (void)clearExternalAnalyticsConfigs
{
}

- (void)addExternalAnalyticsConfig:(id)a3
{
  id v4 = a3;
  externalAnalyticsConfigs = self->_externalAnalyticsConfigs;
  id v8 = v4;
  if (!externalAnalyticsConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_externalAnalyticsConfigs;
    self->_externalAnalyticsConfigs = v6;

    id v4 = v8;
    externalAnalyticsConfigs = self->_externalAnalyticsConfigs;
  }
  [(NSMutableArray *)externalAnalyticsConfigs addObject:v4];
}

- (unint64_t)externalAnalyticsConfigsCount
{
  return [(NSMutableArray *)self->_externalAnalyticsConfigs count];
}

- (id)externalAnalyticsConfigAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_externalAnalyticsConfigs objectAtIndex:a3];
}

+ (Class)externalAnalyticsConfigType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPersonalizationPortraitConfigResourceId
{
  return self->_personalizationPortraitConfigResourceId != 0;
}

- (int)orderFeedEnabledLevelDeprecated
{
  if ((*(void *)&self->_has & 0x8000000000000000) != 0) {
    return self->_orderFeedEnabledLevelDeprecated;
  }
  else {
    return 0;
  }
}

- (void)setOrderFeedEnabledLevelDeprecated:(int)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_orderFeedEnabledLevelDeprecated = a3;
}

- (void)setHasOrderFeedEnabledLevelDeprecated:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasOrderFeedEnabledLevelDeprecated
{
  return *(void *)&self->_has >> 63;
}

- (BOOL)hasExperimentalizableFieldPostfix
{
  return self->_experimentalizableFieldPostfix != 0;
}

- (void)setMinimumFollowCountToRemovePersonalizePlacardInFollowing:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_minimumFollowCountToRemovePersonalizePlacardInFollowing = a3;
}

- (void)setHasMinimumFollowCountToRemovePersonalizePlacardInFollowing:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasMinimumFollowCountToRemovePersonalizePlacardInFollowing
{
  return (*(void *)&self->_has >> 29) & 1;
}

- (void)setUseSecureConnectionForAssets:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x1000u;
  self->_useSecureConnectionForAssets = a3;
}

- (void)setHasUseSecureConnectionForAssets:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xEFFF | v3;
}

- (BOOL)hasUseSecureConnectionForAssets
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 12) & 1;
}

- (void)setUsUkUseAuWhatsNewFeatures:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x800u;
  self->_usUkUseAuWhatsNewFeatures = a3;
}

- (void)setHasUsUkUseAuWhatsNewFeatures:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xF7FF | v3;
}

- (BOOL)hasUsUkUseAuWhatsNewFeatures
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 11) & 1;
}

- (void)setOrderFeedEnabledLevel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_orderFeedEnabledLevel = a3;
}

- (void)setHasOrderFeedEnabledLevel:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasOrderFeedEnabledLevel
{
  return (*(void *)&self->_has >> 62) & 1;
}

- (void)setStateRestorationAllowedTimeWindow:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_stateRestorationAllowedTimeWindow = a3;
}

- (void)setHasStateRestorationAllowedTimeWindow:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasStateRestorationAllowedTimeWindow
{
  return (*(void *)&self->_has >> 45) & 1;
}

- (void)setAutoRefreshMinimumInterval:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_autoRefreshMinimumInterval = a3;
}

- (void)setHasAutoRefreshMinimumInterval:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasAutoRefreshMinimumInterval
{
  return (*(void *)&self->_has >> 6) & 1;
}

- (BOOL)terminateAppOnBackgroundAfterJoiningOrLeavingExperiment
{
  return (*((_WORD *)&self->_has + 4) & 0x200) != 0 && self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
}

- (void)setTerminateAppOnBackgroundAfterJoiningOrLeavingExperiment:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x200u;
  self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment = a3;
}

- (void)setHasTerminateAppOnBackgroundAfterJoiningOrLeavingExperiment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFDFF | v3;
}

- (BOOL)hasTerminateAppOnBackgroundAfterJoiningOrLeavingExperiment
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 9) & 1;
}

- (unint64_t)topStoriesPublishTimeIntervalsCount
{
  return self->_topStoriesPublishTimeIntervals.count;
}

- (int64_t)topStoriesPublishTimeIntervals
{
  return self->_topStoriesPublishTimeIntervals.list;
}

- (void)clearTopStoriesPublishTimeIntervals
{
}

- (void)addTopStoriesPublishTimeIntervals:(int64_t)a3
{
}

- (int64_t)topStoriesPublishTimeIntervalsAtIndex:(unint64_t)a3
{
  p_topStoriesPublishTimeIntervals = &self->_topStoriesPublishTimeIntervals;
  unint64_t count = self->_topStoriesPublishTimeIntervals.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_topStoriesPublishTimeIntervals->list[a3];
}

- (void)setTopStoriesPublishTimeIntervals:(int64_t *)a3 count:(unint64_t)a4
{
}

- (BOOL)articleSearchEnabled
{
  return (*((_WORD *)&self->_has + 4) & 8) == 0 || self->_articleSearchEnabled;
}

- (void)setArticleSearchEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 8u;
  self->_articleSearchEnabled = a3;
}

- (void)setHasArticleSearchEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v3;
}

- (BOOL)hasArticleSearchEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setMaximumRatioOfArticlesInForYouGroup:(double)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_maximumRatioOfArticlesInForYouGroup = a3;
}

- (void)setHasMaximumRatioOfArticlesInForYouGroup:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasMaximumRatioOfArticlesInForYouGroup
{
  return (*(void *)&self->_has >> 22) & 1;
}

- (void)setMinimumTrendingUnseenRatio:(double)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_minimumTrendingUnseenRatio = a3;
}

- (void)setHasMinimumTrendingUnseenRatio:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasMinimumTrendingUnseenRatio
{
  return (*(void *)&self->_has >> 30) & 1;
}

- (int)trendingStyle
{
  if ((*((_WORD *)&self->_has + 4) & 2) != 0) {
    return self->_trendingStyle;
  }
  else {
    return 0;
  }
}

- (void)setTrendingStyle:(int)a3
{
  *((_WORD *)&self->_has + 4) |= 2u;
  self->_trendingStyle = a3;
}

- (void)setHasTrendingStyle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v3;
}

- (BOOL)hasTrendingStyle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setMinimumDurationBetweenForYouGroupsWeekday:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_minimumDurationBetweenForYouGroupsWeekday = a3;
}

- (void)setHasMinimumDurationBetweenForYouGroupsWeekday:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasMinimumDurationBetweenForYouGroupsWeekday
{
  return (*(void *)&self->_has >> 25) & 1;
}

- (void)setMinimumDurationBetweenForYouGroupsWeekend:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_minimumDurationBetweenForYouGroupsWeekend = a3;
}

- (void)setHasMinimumDurationBetweenForYouGroupsWeekend:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasMinimumDurationBetweenForYouGroupsWeekend
{
  return (*(void *)&self->_has >> 26) & 1;
}

- (void)setMinimumDurationBetweenTrendingGroupsWeekday:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_minimumDurationBetweenTrendingGroupsWeekday = a3;
}

- (void)setHasMinimumDurationBetweenTrendingGroupsWeekday:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasMinimumDurationBetweenTrendingGroupsWeekday
{
  return (*(void *)&self->_has >> 27) & 1;
}

- (void)setMinimumDurationBetweenTrendingGroupsWeekend:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_minimumDurationBetweenTrendingGroupsWeekend = a3;
}

- (void)setHasMinimumDurationBetweenTrendingGroupsWeekend:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasMinimumDurationBetweenTrendingGroupsWeekend
{
  return (*(void *)&self->_has >> 28) & 1;
}

- (BOOL)diversifyOptionalTopStories
{
  return (*((_WORD *)&self->_has + 4) & 0x40) == 0 || self->_diversifyOptionalTopStories;
}

- (void)setDiversifyOptionalTopStories:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x40u;
  self->_diversifyOptionalTopStories = a3;
}

- (void)setHasDiversifyOptionalTopStories:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v3;
}

- (BOOL)hasDiversifyOptionalTopStories
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (BOOL)hasForYouVideoGroupsConfig
{
  return self->_forYouVideoGroupsConfig != 0;
}

- (BOOL)hasArticleRecirculationConfig
{
  return self->_articleRecirculationConfig != 0;
}

- (void)setOptionalTopStoriesRefreshRate:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_optionalTopStoriesRefreshRate = a3;
}

- (void)setHasOptionalTopStoriesRefreshRate:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasOptionalTopStoriesRefreshRate
{
  return (*(void *)&self->_has >> 36) & 1;
}

- (int64_t)expirePinnedArticlesAfter
{
  if ((*(void *)&self->_has & 0x2000) != 0) {
    return self->_expirePinnedArticlesAfter;
  }
  else {
    return 604800;
  }
}

- (void)setExpirePinnedArticlesAfter:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_expirePinnedArticlesAfter = a3;
}

- (void)setHasExpirePinnedArticlesAfter:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasExpirePinnedArticlesAfter
{
  return (*(void *)&self->_has >> 13) & 1;
}

- (void)setUserSegmentationApiModThreshold:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_userSegmentationApiModThreshold = a3;
}

- (void)setHasUserSegmentationApiModThreshold:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasUserSegmentationApiModThreshold
{
  return (*(void *)&self->_has >> 57) & 1;
}

- (void)setUserSegmentationApiModMax:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_userSegmentationApiModMax = a3;
}

- (void)setHasUserSegmentationApiModMax:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasUserSegmentationApiModMax
{
  return HIBYTE(*(void *)&self->_has) & 1;
}

- (void)setPrivateDataMigrationCleanupLevel:(unsigned int)a3
{
  *((_WORD *)&self->_has + 4) |= 1u;
  self->_privateDataMigrationCleanupLevel = a3;
}

- (void)setHasPrivateDataMigrationCleanupLevel:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (BOOL)hasPrivateDataMigrationCleanupLevel
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (BOOL)hasArticleRecirculationComponentPlacementConfig
{
  return self->_articleRecirculationComponentPlacementConfig != 0;
}

- (int64_t)widgetEventImmediateUploadPopulationFloor
{
  if ((*(void *)&self->_has & 0x1000000000000000) != 0) {
    return self->_widgetEventImmediateUploadPopulationFloor;
  }
  else {
    return 0;
  }
}

- (void)setWidgetEventImmediateUploadPopulationFloor:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_widgetEventImmediateUploadPopulationFloor = a3;
}

- (void)setHasWidgetEventImmediateUploadPopulationFloor:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasWidgetEventImmediateUploadPopulationFloor
{
  return (*(void *)&self->_has >> 60) & 1;
}

- (int64_t)widgetEventImmediateUploadPopulationCeiling
{
  if ((*(void *)&self->_has & 0x800000000000000) != 0) {
    return self->_widgetEventImmediateUploadPopulationCeiling;
  }
  else {
    return 1;
  }
}

- (void)setWidgetEventImmediateUploadPopulationCeiling:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_widgetEventImmediateUploadPopulationCeiling = a3;
}

- (void)setHasWidgetEventImmediateUploadPopulationCeiling:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasWidgetEventImmediateUploadPopulationCeiling
{
  return (*(void *)&self->_has >> 59) & 1;
}

- (int64_t)widgetEventImmediateUploadModuloForHashing
{
  if ((*(void *)&self->_has & 0x400000000000000) != 0) {
    return self->_widgetEventImmediateUploadModuloForHashing;
  }
  else {
    return 1000;
  }
}

- (void)setWidgetEventImmediateUploadModuloForHashing:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_widgetEventImmediateUploadModuloForHashing = a3;
}

- (void)setHasWidgetEventImmediateUploadModuloForHashing:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasWidgetEventImmediateUploadModuloForHashing
{
  return (*(void *)&self->_has >> 58) & 1;
}

- (int64_t)articleRecirculationPopularFeedQueryTimeRange
{
  if ((*(void *)&self->_has & 0x20) != 0) {
    return self->_articleRecirculationPopularFeedQueryTimeRange;
  }
  else {
    return 86400;
  }
}

- (void)setArticleRecirculationPopularFeedQueryTimeRange:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_articleRecirculationPopularFeedQueryTimeRange = a3;
}

- (void)setHasArticleRecirculationPopularFeedQueryTimeRange:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasArticleRecirculationPopularFeedQueryTimeRange
{
  return (*(void *)&self->_has >> 5) & 1;
}

- (BOOL)disableThumbnailsForArticleRecirculation
{
  return (*((_WORD *)&self->_has + 4) & 0x20) != 0 && self->_disableThumbnailsForArticleRecirculation;
}

- (void)setDisableThumbnailsForArticleRecirculation:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x20u;
  self->_disableThumbnailsForArticleRecirculation = a3;
}

- (void)setHasDisableThumbnailsForArticleRecirculation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v3;
}

- (BOOL)hasDisableThumbnailsForArticleRecirculation
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (BOOL)hasUserSegmentationApiConfiguration
{
  return self->_userSegmentationApiConfiguration != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBConfig;
  id v4 = [(NTPBConfig *)&v8 description];
  v5 = [(NTPBConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  fallbackLanguageTag = self->_fallbackLanguageTag;
  if (fallbackLanguageTag) {
    [v3 setObject:fallbackLanguageTag forKey:@"fallback_language_tag"];
  }
  if ([(NSMutableArray *)self->_languageConfigs count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_languageConfigs, "count"));
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    uint64_t v7 = self->_languageConfigs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v173 objects:v179 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v174;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v174 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v173 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v173 objects:v179 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"language_configs"];
  }
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000) != 0)
  {
    v14 = [NSNumber numberWithLongLong:self->_shortReminderTime];
    [v4 setObject:v14 forKey:@"short_reminder_time"];

    uint64_t has = (uint64_t)self->_has;
  }
  if ((has & 0x20000) != 0)
  {
    v97 = [NSNumber numberWithLongLong:self->_longReminderTime];
    [v4 setObject:v97 forKey:@"long_reminder_time"];

    uint64_t has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_16:
      if ((has & 0x100) == 0) {
        goto LABEL_17;
      }
      goto LABEL_152;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
    goto LABEL_16;
  }
  v98 = [NSNumber numberWithBool:self->_newsletterSubscriptionChecked];
  [v4 setObject:v98 forKey:@"newsletter_subscription_checked"];

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_17:
    if ((has & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_153;
  }
LABEL_152:
  v99 = [NSNumber numberWithDouble:self->_batchedFeedTimeout];
  [v4 setObject:v99 forKey:@"batched_feed_timeout"];

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_18:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_153:
  v100 = [NSNumber numberWithDouble:self->_interstitialAdLoadDelay];
  [v4 setObject:v100 forKey:@"interstitial_ad_load_delay"];

  if ((*(void *)&self->_has & 0x2000000000) != 0)
  {
LABEL_19:
    v15 = [NSNumber numberWithDouble:self->_prerollLoadingTimeout];
    [v4 setObject:v15 forKey:@"preroll_loading_timeout"];
  }
LABEL_20:
  if ([(NSMutableArray *)self->_endpointConfigs count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_endpointConfigs, "count"));
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    v17 = self->_endpointConfigs;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v169 objects:v178 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v170;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v170 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v169 + 1) + 8 * j) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v169 objects:v178 count:16];
      }
      while (v19);
    }

    [v4 setObject:v16 forKey:@"endpoint_configs"];
  }
  personalizationConfig = self->_personalizationConfig;
  if (personalizationConfig)
  {
    v24 = [(NTPBPersonalizationConfig *)personalizationConfig dictionaryRepresentation];
    [v4 setObject:v24 forKey:@"personalization_config"];
  }
  iadConfig = self->_iadConfig;
  if (iadConfig)
  {
    v26 = [(NTPBIAdConfig *)iadConfig dictionaryRepresentation];
    [v4 setObject:v26 forKey:@"iad_config"];
  }
  prefetchConfig = self->_prefetchConfig;
  if (prefetchConfig)
  {
    v28 = [(NTPBPrefetchConfig *)prefetchConfig dictionaryRepresentation];
    [v4 setObject:v28 forKey:@"prefetch_config"];
  }
  p_uint64_t has = &self->_has;
  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x8000000000000) != 0)
  {
    v101 = [NSNumber numberWithDouble:self->_tileProminenceScoreBalanceValue];
    [v4 setObject:v101 forKey:@"tile_prominence_score_balance_value"];

    uint64_t v30 = *(void *)p_has;
    if ((*(void *)p_has & 0x800000) == 0)
    {
LABEL_37:
      if ((v30 & 0x8000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_157;
    }
  }
  else if ((v30 & 0x800000) == 0)
  {
    goto LABEL_37;
  }
  v102 = [NSNumber numberWithLongLong:self->_minimumArticleUpdateInterval];
  [v4 setObject:v102 forKey:@"minimum_article_update_interval"];

  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x8000) == 0)
  {
LABEL_38:
    if ((v30 & 0x80) == 0) {
      goto LABEL_39;
    }
    goto LABEL_158;
  }
LABEL_157:
  v103 = [NSNumber numberWithLongLong:self->_initialArticlesFromNewFavorite];
  [v4 setObject:v103 forKey:@"initial_articles_from_new_favorite"];

  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x80) == 0)
  {
LABEL_39:
    if ((v30 & 0x80000000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_159;
  }
LABEL_158:
  v104 = [NSNumber numberWithLongLong:self->_autoScrollToTopFeedTimeout];
  [v4 setObject:v104 forKey:@"auto_scroll_to_top_feed_timeout"];

  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x80000000000000) == 0)
  {
LABEL_40:
    if ((v30 & 2) == 0) {
      goto LABEL_41;
    }
    goto LABEL_160;
  }
LABEL_159:
  v105 = [NSNumber numberWithLongLong:self->_trendingTopicsRefreshRate];
  [v4 setObject:v105 forKey:@"trending_topics_refresh_rate"];

  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 2) == 0)
  {
LABEL_41:
    if ((v30 & 0x1000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_161;
  }
LABEL_160:
  v106 = [NSNumber numberWithLongLong:self->_appConfigRefreshRate];
  [v4 setObject:v106 forKey:@"app_config_refresh_rate"];

  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x1000000) == 0)
  {
LABEL_42:
    if ((v30 & 0x20000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_162;
  }
LABEL_161:
  v107 = [NSNumber numberWithLongLong:self->_minimumDistanceBetweenImageOnTopTiles];
  [v4 setObject:v107 forKey:@"minimum_distance_between_image_on_top_tiles"];

  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x20000000000000) == 0)
  {
LABEL_43:
    if ((v30 & 0x10000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_163;
  }
LABEL_162:
  v108 = [NSNumber numberWithLongLong:self->_timeBetweenWidgetInsertions];
  [v4 setObject:v108 forKey:@"time_between_widget_insertions"];

  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x10000000000000) == 0)
  {
LABEL_44:
    if ((v30 & 0x800000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_164;
  }
LABEL_163:
  v109 = [NSNumber numberWithLongLong:self->_timeBetweenSameWidgetReinsertion];
  [v4 setObject:v109 forKey:@"time_between_same_widget_reinsertion"];

  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x800000000) == 0)
  {
LABEL_45:
    if ((v30 & 0x10) == 0) {
      goto LABEL_46;
    }
    goto LABEL_165;
  }
LABEL_164:
  v110 = [NSNumber numberWithLongLong:self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit];
  [v4 setObject:v110 forKey:@"number_of_screenfuls_scrolled_to_bypass_widget_timeLimit"];

  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x10) == 0)
  {
LABEL_46:
    if ((v30 & 0x400000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_165:
  v111 = [NSNumber numberWithLongLong:self->_articleRapidUpdatesTimeout];
  [v4 setObject:v111 forKey:@"article_rapid_updates_timeout"];

  if ((*(void *)&self->_has & 0x400000000000) != 0)
  {
LABEL_47:
    v31 = [NSNumber numberWithLongLong:self->_subscriptionsGlobalMeteredCount];
    [v4 setObject:v31 forKey:@"subscriptions_global_metered_count"];
  }
LABEL_48:
  anfEmbedConfigurationAsset = self->_anfEmbedConfigurationAsset;
  if (anfEmbedConfigurationAsset) {
    [v4 setObject:anfEmbedConfigurationAsset forKey:@"anf_embed_configuration_asset"];
  }
  v33 = &self->_has;
  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 0x2000000000000) != 0)
  {
    v112 = [NSNumber numberWithLongLong:self->_subscriptionsPlacardPublisherFrequencyDays];
    [v4 setObject:v112 forKey:@"subscriptions_placard_publisher_frequency_days"];

    uint64_t v34 = *(void *)v33;
    if ((*(void *)v33 & 0x1000000000000) == 0)
    {
LABEL_52:
      if ((v34 & 0x800000000000) == 0) {
        goto LABEL_53;
      }
      goto LABEL_169;
    }
  }
  else if ((v34 & 0x1000000000000) == 0)
  {
    goto LABEL_52;
  }
  v113 = [NSNumber numberWithLongLong:self->_subscriptionsPlacardGlobalMaxPerDay];
  [v4 setObject:v113 forKey:@"subscriptions_placard_global_max_per_day"];

  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 0x800000000000) == 0)
  {
LABEL_53:
    if ((v34 & 0x80000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_170;
  }
LABEL_169:
  v114 = [NSNumber numberWithLongLong:self->_subscriptionsGracePeriodForTokenVerificationSeconds];
  [v4 setObject:v114 forKey:@"subscriptions_grace_period_for_token_verification_seconds"];

  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 0x80000000) == 0)
  {
LABEL_54:
    if ((v34 & 0x1000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_171;
  }
LABEL_170:
  v115 = [NSNumber numberWithLongLong:self->_newFavoriteNotificationAlertsFrequency];
  [v4 setObject:v115 forKey:@"new_favorite_notification_alerts_frequency"];

  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 0x1000) == 0)
  {
LABEL_55:
    if ((v34 & 0x800) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_171:
  v116 = [NSNumber numberWithDouble:self->_endOfArticleMinPaidHeadlineRatio];
  [v4 setObject:v116 forKey:@"end_of_article_min_paid_headline_ratio"];

  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_56:
    v35 = [NSNumber numberWithLongLong:self->_endOfArticleMaxInaccessiblePaidArticles];
    [v4 setObject:v35 forKey:@"end_of_article_max_inaccessible_paid_articles"];
  }
LABEL_57:
  widgetConfig = self->_widgetConfig;
  if (widgetConfig)
  {
    v37 = [(NTPBWidgetConfig *)widgetConfig dictionaryRepresentation];
    [v4 setObject:v37 forKey:@"widget_config"];
  }
  v38 = &self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
    v39 = [NSNumber numberWithBool:self->_universalLinksEnabled];
    [v4 setObject:v39 forKey:@"universal_links_enabled"];
  }
  uint64_t v40 = *(void *)v38;
  if ((*(void *)v38 & 0x100000000) != 0)
  {
    v41 = [NSNumber numberWithLongLong:self->_notificationArticleCacheTimeout];
    [v4 setObject:v41 forKey:@"notification_article_cache_timeout"];

    uint64_t v40 = (uint64_t)self->_has;
  }
  if ((v40 & 0x200000000) != 0)
  {
    v42 = [NSNumber numberWithLongLong:self->_notificationArticleWithRapidUpdatesCacheTimeout];
    [v4 setObject:v42 forKey:@"notification_article_with_rapid_updates_cache_timeout"];
  }
  forYouNonPersonalizedGroupsOrder = self->_forYouNonPersonalizedGroupsOrder;
  if (forYouNonPersonalizedGroupsOrder) {
    [v4 setObject:forYouNonPersonalizedGroupsOrder forKey:@"for_you_non_personalized_groups_order"];
  }
  v44 = &self->_has;
  uint64_t v45 = (uint64_t)self->_has;
  if ((v45 & 0x400000000) != 0)
  {
    v117 = [NSNumber numberWithLongLong:self->_notificationEnabledChannelsRefreshFrequency];
    [v4 setObject:v117 forKey:@"notification_enabled_channels_refresh_frequency"];

    uint64_t v45 = *(void *)v44;
    if ((*(void *)v44 & 0x40000000000) == 0)
    {
LABEL_69:
      if ((v45 & 0x20000000000) == 0) {
        goto LABEL_70;
      }
      goto LABEL_175;
    }
  }
  else if ((v45 & 0x40000000000) == 0)
  {
    goto LABEL_69;
  }
  v118 = [NSNumber numberWithLongLong:self->_savedArticlesMaximumCountWifi];
  [v4 setObject:v118 forKey:@"saved_articles_maximum_count_wifi"];

  uint64_t v45 = (uint64_t)self->_has;
  if ((v45 & 0x20000000000) == 0)
  {
LABEL_70:
    if ((v45 & 0x10000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_176;
  }
LABEL_175:
  v119 = [NSNumber numberWithLongLong:self->_savedArticlesMaximumCountCellular];
  [v4 setObject:v119 forKey:@"saved_articles_maximum_count_cellular"];

  uint64_t v45 = (uint64_t)self->_has;
  if ((v45 & 0x10000000000) == 0)
  {
LABEL_71:
    if ((v45 & 0x80000000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
LABEL_176:
  v120 = [NSNumber numberWithLongLong:self->_savedArticlesCutoffTime];
  [v4 setObject:v120 forKey:@"saved_articles_cutoff_time"];

  if ((*(void *)&self->_has & 0x80000000000) != 0)
  {
LABEL_72:
    v46 = [NSNumber numberWithLongLong:self->_savedArticlesOpenedCutoffTime];
    [v4 setObject:v46 forKey:@"saved_articles_opened_cutoff_time"];
  }
LABEL_73:
  alternativeButlerWidgetConfig = self->_alternativeButlerWidgetConfig;
  if (alternativeButlerWidgetConfig)
  {
    v48 = [(NTPBWidgetConfig *)alternativeButlerWidgetConfig dictionaryRepresentation];
    [v4 setObject:v48 forKey:@"alternative_butler_widget_config"];
  }
  if ((*((_WORD *)&self->_has + 4) & 4) != 0)
  {
    v49 = [NSNumber numberWithBool:self->_alternativeButlerWidgetConfigEnabled];
    [v4 setObject:v49 forKey:@"alternative_butler_widget_config_enabled"];
  }
  butlerWidgetConfig = self->_butlerWidgetConfig;
  if (butlerWidgetConfig)
  {
    v51 = [(NTPBWidgetConfig *)butlerWidgetConfig dictionaryRepresentation];
    [v4 setObject:v51 forKey:@"butler_widget_config"];
  }
  paidSubscriptionConfig = self->_paidSubscriptionConfig;
  if (paidSubscriptionConfig)
  {
    v53 = [(NTPBPaidSubscriptionConfig *)paidSubscriptionConfig dictionaryRepresentation];
    [v4 setObject:v53 forKey:@"paid_subscription_config"];
  }
  v54 = &self->_has;
  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 8) != 0)
  {
    v121 = [NSNumber numberWithDouble:self->_articleDiversitySimilarityExpectationStart];
    [v4 setObject:v121 forKey:@"article_diversity_similarity_expectation_start"];

    uint64_t v55 = *(void *)v54;
    if ((*(void *)v54 & 4) == 0)
    {
LABEL_83:
      if ((v55 & 0x80000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_180;
    }
  }
  else if ((v55 & 4) == 0)
  {
    goto LABEL_83;
  }
  v122 = [NSNumber numberWithDouble:self->_articleDiversitySimilarityExpectationEnd];
  [v4 setObject:v122 forKey:@"article_diversity_similarity_expectation_end"];

  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x80000) == 0)
  {
LABEL_84:
    if ((v55 & 0x100000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_181;
  }
LABEL_180:
  v123 = [NSNumber numberWithLongLong:self->_maxPaidSubscriptionGroupSizeIPad];
  [v4 setObject:v123 forKey:@"max_paid_subscription_group_size_iPad"];

  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x100000) == 0)
  {
LABEL_85:
    if ((v55 & 0x200000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_182;
  }
LABEL_181:
  v124 = [NSNumber numberWithLongLong:self->_maxPaidSubscriptionGroupSizeIPhone];
  [v4 setObject:v124 forKey:@"max_paid_subscription_group_size_iPhone"];

  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x200000) == 0)
  {
LABEL_86:
    if ((v55 & 0x4000000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_183;
  }
LABEL_182:
  v125 = [NSNumber numberWithLongLong:self->_maxTimesHeadlineInPaidSubscriptionGroup];
  [v4 setObject:v125 forKey:@"max_times_headline_in_paid_subscription_group"];

  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x4000000000) == 0)
  {
LABEL_87:
    if ((v55 & 0x8000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_184;
  }
LABEL_183:
  v126 = [NSNumber numberWithDouble:self->_publisherDiversitySlope];
  [v4 setObject:v126 forKey:@"publisher_diversity_slope"];

  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x8000000000) == 0)
  {
LABEL_88:
    if ((v55 & 0x4000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_185;
  }
LABEL_184:
  v127 = [NSNumber numberWithDouble:self->_publisherDiversityYIntercept];
  [v4 setObject:v127 forKey:@"publisher_diversity_y_intercept"];

  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x4000) == 0)
  {
LABEL_89:
    if ((v55 & 0x40000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_90;
  }
LABEL_185:
  v128 = [NSNumber numberWithLongLong:self->_expiredPaidSubscriptionGroupCutoffTime];
  [v4 setObject:v128 forKey:@"expired_paid_subscription_group_cutoff_time"];

  if ((*(void *)&self->_has & 0x40000) != 0)
  {
LABEL_90:
    v56 = [NSNumber numberWithLongLong:self->_maxExpiredPaidSubscriptionGroupCount];
    [v4 setObject:v56 forKey:@"max_expired_paid_subscription_group_count"];
  }
LABEL_91:
  widgetConfig2 = self->_widgetConfig2;
  if (widgetConfig2)
  {
    v58 = [(NTPBWidgetConfig *)widgetConfig2 dictionaryRepresentation];
    [v4 setObject:v58 forKey:@"widget_config_2"];
  }
  uint64_t v59 = (uint64_t)self->_has;
  if ((v59 & 0x4000000000000) != 0)
  {
    v60 = [NSNumber numberWithLongLong:self->_subscriptionsPlacardPublisherFrequencySeconds];
    [v4 setObject:v60 forKey:@"subscriptions_placard_publisher_frequency_seconds"];

    uint64_t v59 = (uint64_t)self->_has;
  }
  if ((v59 & 0x40000000000000) != 0)
  {
    v61 = [NSNumber numberWithLongLong:self->_treatmentId];
    [v4 setObject:v61 forKey:@"treatment_id"];
  }
  binningConfig = self->_binningConfig;
  if (binningConfig)
  {
    v63 = [(NTPBBinningConfig *)binningConfig dictionaryRepresentation];
    [v4 setObject:v63 forKey:@"binning_config"];
  }
  personalizationTreatment = self->_personalizationTreatment;
  if (personalizationTreatment)
  {
    v65 = [(NTPBPersonalizationTreatment *)personalizationTreatment dictionaryRepresentation];
    [v4 setObject:v65 forKey:@"personalization_treatment"];
  }
  if (*(void *)&self->_has)
  {
    v66 = [NSNumber numberWithLongLong:self->_analyticsEndpointMaxPayloadSize];
    [v4 setObject:v66 forKey:@"analytics_endpoint_max_payload_size"];
  }
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
    v67 = [NSNumber numberWithBool:self->_orderFeedEndpointEnabled];
    [v4 setObject:v67 forKey:@"order_feed_endpoint_enabled"];
  }
  personalizationBundleIdMappingResourceId = self->_personalizationBundleIdMappingResourceId;
  if (personalizationBundleIdMappingResourceId) {
    [v4 setObject:personalizationBundleIdMappingResourceId forKey:@"personalization_bundle_id_mapping_resource_id"];
  }
  personalizationUrlMappingResourceId = self->_personalizationUrlMappingResourceId;
  if (personalizationUrlMappingResourceId) {
    [v4 setObject:personalizationUrlMappingResourceId forKey:@"personalization_url_mapping_resource_id"];
  }
  personalizationWhitelistResourceId = self->_personalizationWhitelistResourceId;
  if (personalizationWhitelistResourceId) {
    [v4 setObject:personalizationWhitelistResourceId forKey:@"personalization_whitelist_resource_id"];
  }
  if ((*(void *)&self->_has & 0x2000000000000000) != 0)
  {
    v71 = [NSNumber numberWithUnsignedInt:self->_enabledPrivateDataEncryptionLevel];
    [v4 setObject:v71 forKey:@"enabled_private_data_encryption_level"];
  }
  personalizationPublisherFavorabilityScoresResourceId = self->_personalizationPublisherFavorabilityScoresResourceId;
  if (personalizationPublisherFavorabilityScoresResourceId) {
    [v4 setObject:personalizationPublisherFavorabilityScoresResourceId forKey:@"personalization_publisher_favorability_scores_resource_id"];
  }
  personalizationWidgetSectionMappingResourceId = self->_personalizationWidgetSectionMappingResourceId;
  if (personalizationWidgetSectionMappingResourceId) {
    [v4 setObject:personalizationWidgetSectionMappingResourceId forKey:@"personalization_widget_section_mapping_resource_id"];
  }
  uint64_t v74 = (uint64_t)self->_has;
  if ((v74 & 0x200) != 0)
  {
    v75 = [NSNumber numberWithLongLong:self->_corryBarMaxArticleCountForArticleList];
    [v4 setObject:v75 forKey:@"corry_bar_max_article_count_for_article_list"];

    uint64_t v74 = (uint64_t)self->_has;
  }
  __int16 v76 = *((_WORD *)&self->_has + 4);
  if ((v74 & 0x400) != 0)
  {
    v77 = [NSNumber numberWithLongLong:self->_corryBarMaxArticleCountForSingleArticle];
    [v4 setObject:v77 forKey:@"corry_bar_max_article_count_for_single_article"];

    __int16 v76 = *((_WORD *)&self->_has + 4);
  }
  if ((v76 & 0x10) != 0)
  {
    v78 = [NSNumber numberWithBool:self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers];
    [v4 setObject:v78 forKey:@"corry_bar_hide_discover_more_interstitial_for_non_onboarded_users"];
  }
  if ([(NSMutableArray *)self->_externalAnalyticsConfigs count])
  {
    v79 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_externalAnalyticsConfigs, "count"));
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    v80 = self->_externalAnalyticsConfigs;
    uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v165 objects:v177 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      uint64_t v83 = *(void *)v166;
      do
      {
        for (uint64_t k = 0; k != v82; ++k)
        {
          if (*(void *)v166 != v83) {
            objc_enumerationMutation(v80);
          }
          v85 = objc_msgSend(*(id *)(*((void *)&v165 + 1) + 8 * k), "dictionaryRepresentation", (void)v165);
          [v79 addObject:v85];
        }
        uint64_t v82 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v165 objects:v177 count:16];
      }
      while (v82);
    }

    [v4 setObject:v79 forKey:@"external_analytics_config"];
  }
  personalizationPortraitConfigResourceId = self->_personalizationPortraitConfigResourceId;
  if (personalizationPortraitConfigResourceId) {
    [v4 setObject:personalizationPortraitConfigResourceId forKey:@"personalization_portrait_config_resource_id"];
  }
  if ((*(void *)&self->_has & 0x8000000000000000) != 0)
  {
    v87 = [NSNumber numberWithInt:self->_orderFeedEnabledLevelDeprecated];
    [v4 setObject:v87 forKey:@"order_feed_enabled_level_deprecated"];
  }
  experimentalizableFieldPostfix = self->_experimentalizableFieldPostfix;
  if (experimentalizableFieldPostfix) {
    [v4 setObject:experimentalizableFieldPostfix forKey:@"experimentalizable_field_postfix"];
  }
  uint64_t v89 = (uint64_t)self->_has;
  if ((v89 & 0x20000000) != 0)
  {
    v90 = [NSNumber numberWithLongLong:self->_minimumFollowCountToRemovePersonalizePlacardInFollowing];
    [v4 setObject:v90 forKey:@"minimum_follow_count_to_remove_personalize_placard_in_following"];

    uint64_t v89 = (uint64_t)self->_has;
  }
  __int16 v91 = *((_WORD *)&self->_has + 4);
  if ((v91 & 0x1000) != 0)
  {
    v129 = [NSNumber numberWithBool:self->_useSecureConnectionForAssets];
    [v4 setObject:v129 forKey:@"use_secure_connection_for_assets"];

    uint64_t v89 = (uint64_t)self->_has;
    __int16 v91 = *((_WORD *)&self->_has + 4);
    if ((v91 & 0x800) == 0)
    {
LABEL_142:
      if ((v89 & 0x4000000000000000) == 0) {
        goto LABEL_143;
      }
      goto LABEL_189;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x800) == 0)
  {
    goto LABEL_142;
  }
  v130 = objc_msgSend(NSNumber, "numberWithBool:", self->_usUkUseAuWhatsNewFeatures, (void)v165);
  [v4 setObject:v130 forKey:@"us_uk_use_au_whats_new_features"];

  uint64_t v89 = (uint64_t)self->_has;
  __int16 v91 = *((_WORD *)&self->_has + 4);
  if ((v89 & 0x4000000000000000) == 0)
  {
LABEL_143:
    if ((v89 & 0x200000000000) == 0) {
      goto LABEL_144;
    }
    goto LABEL_190;
  }
LABEL_189:
  v131 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_orderFeedEnabledLevel, (void)v165);
  [v4 setObject:v131 forKey:@"order_feed_enabled_level"];

  uint64_t v89 = (uint64_t)self->_has;
  __int16 v91 = *((_WORD *)&self->_has + 4);
  if ((v89 & 0x200000000000) == 0)
  {
LABEL_144:
    if ((v89 & 0x40) == 0) {
      goto LABEL_145;
    }
    goto LABEL_191;
  }
LABEL_190:
  v132 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_stateRestorationAllowedTimeWindow, (void)v165);
  [v4 setObject:v132 forKey:@"state_restoration_allowed_time_window"];

  __int16 v91 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x40) == 0)
  {
LABEL_145:
    if ((v91 & 0x200) == 0) {
      goto LABEL_147;
    }
    goto LABEL_146;
  }
LABEL_191:
  v133 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_autoRefreshMinimumInterval, (void)v165);
  [v4 setObject:v133 forKey:@"auto_refresh_minimum_interval"];

  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
  {
LABEL_146:
    v92 = objc_msgSend(NSNumber, "numberWithBool:", self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment, (void)v165);
    [v4 setObject:v92 forKey:@"terminate_app_on_background_after_joining_or_leaving_experiment"];
  }
LABEL_147:
  v93 = PBRepeatedInt64NSArray();
  [v4 setObject:v93 forKey:@"top_stories_publish_time_intervals"];

  v94 = &self->_has;
  __int16 v95 = *((_WORD *)&self->_has + 4);
  if ((v95 & 8) != 0)
  {
    v134 = [NSNumber numberWithBool:self->_articleSearchEnabled];
    [v4 setObject:v134 forKey:@"article_search_enabled"];

    uint64_t v96 = *(void *)v94;
    __int16 v95 = *((_WORD *)&self->_has + 4);
    if ((*(void *)v94 & 0x400000) == 0) {
      goto LABEL_195;
    }
    goto LABEL_194;
  }
  uint64_t v96 = *(void *)v94;
  if ((*(void *)v94 & 0x400000) != 0)
  {
LABEL_194:
    v135 = objc_msgSend(NSNumber, "numberWithDouble:", self->_maximumRatioOfArticlesInForYouGroup, (void)v165);
    [v4 setObject:v135 forKey:@"maximum_ratio_of_articles_in_for_you_group"];

    uint64_t v96 = (uint64_t)self->_has;
    __int16 v95 = *((_WORD *)&self->_has + 4);
  }
LABEL_195:
  if ((v96 & 0x40000000) != 0)
  {
    v153 = [NSNumber numberWithDouble:self->_minimumTrendingUnseenRatio];
    [v4 setObject:v153 forKey:@"minimum_trending_unseen_ratio"];

    uint64_t v96 = (uint64_t)self->_has;
    __int16 v95 = *((_WORD *)&self->_has + 4);
    if ((v95 & 2) == 0)
    {
LABEL_197:
      if ((v96 & 0x2000000) == 0) {
        goto LABEL_198;
      }
      goto LABEL_228;
    }
  }
  else if ((v95 & 2) == 0)
  {
    goto LABEL_197;
  }
  v154 = objc_msgSend(NSNumber, "numberWithInt:", self->_trendingStyle, (void)v165);
  [v4 setObject:v154 forKey:@"trending_style"];

  uint64_t v96 = (uint64_t)self->_has;
  __int16 v95 = *((_WORD *)&self->_has + 4);
  if ((v96 & 0x2000000) == 0)
  {
LABEL_198:
    if ((v96 & 0x4000000) == 0) {
      goto LABEL_199;
    }
    goto LABEL_229;
  }
LABEL_228:
  v155 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumDurationBetweenForYouGroupsWeekday, (void)v165);
  [v4 setObject:v155 forKey:@"minimum_duration_between_for_you_groups_weekday"];

  uint64_t v96 = (uint64_t)self->_has;
  __int16 v95 = *((_WORD *)&self->_has + 4);
  if ((v96 & 0x4000000) == 0)
  {
LABEL_199:
    if ((v96 & 0x8000000) == 0) {
      goto LABEL_200;
    }
    goto LABEL_230;
  }
LABEL_229:
  v156 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumDurationBetweenForYouGroupsWeekend, (void)v165);
  [v4 setObject:v156 forKey:@"minimum_duration_between_for_you_groups_weekend"];

  uint64_t v96 = (uint64_t)self->_has;
  __int16 v95 = *((_WORD *)&self->_has + 4);
  if ((v96 & 0x8000000) == 0)
  {
LABEL_200:
    if ((v96 & 0x10000000) == 0) {
      goto LABEL_201;
    }
    goto LABEL_231;
  }
LABEL_230:
  v157 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumDurationBetweenTrendingGroupsWeekday, (void)v165);
  [v4 setObject:v157 forKey:@"minimum_duration_between_trending_groups_weekday"];

  __int16 v95 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x10000000) == 0)
  {
LABEL_201:
    if ((v95 & 0x40) == 0) {
      goto LABEL_203;
    }
    goto LABEL_202;
  }
LABEL_231:
  v158 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumDurationBetweenTrendingGroupsWeekend, (void)v165);
  [v4 setObject:v158 forKey:@"minimum_duration_between_trending_groups_weekend"];

  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
  {
LABEL_202:
    v136 = objc_msgSend(NSNumber, "numberWithBool:", self->_diversifyOptionalTopStories, (void)v165);
    [v4 setObject:v136 forKey:@"diversify_optional_top_stories"];
  }
LABEL_203:
  forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  if (forYouVideoGroupsConfig)
  {
    v138 = [(NTPBVideoGroupsConfig *)forYouVideoGroupsConfig dictionaryRepresentation];
    [v4 setObject:v138 forKey:@"for_you_video_groups_config"];
  }
  articleRecirculationConfig = self->_articleRecirculationConfig;
  if (articleRecirculationConfig) {
    [v4 setObject:articleRecirculationConfig forKey:@"article_recirculation_config"];
  }
  uint64_t v140 = (uint64_t)self->_has;
  if ((v140 & 0x1000000000) != 0)
  {
    v141 = [NSNumber numberWithLongLong:self->_optionalTopStoriesRefreshRate];
    [v4 setObject:v141 forKey:@"optional_top_stories_refresh_rate"];

    uint64_t v140 = (uint64_t)self->_has;
  }
  __int16 v142 = *((_WORD *)&self->_has + 4);
  if ((v140 & 0x2000) != 0)
  {
    v159 = [NSNumber numberWithLongLong:self->_expirePinnedArticlesAfter];
    [v4 setObject:v159 forKey:@"expire_pinned_articles_after"];

    uint64_t v140 = (uint64_t)self->_has;
    __int16 v142 = *((_WORD *)&self->_has + 4);
    if ((v140 & 0x200000000000000) == 0)
    {
LABEL_211:
      if ((v140 & 0x100000000000000) == 0) {
        goto LABEL_212;
      }
      goto LABEL_235;
    }
  }
  else if ((v140 & 0x200000000000000) == 0)
  {
    goto LABEL_211;
  }
  v160 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_userSegmentationApiModThreshold, (void)v165);
  [v4 setObject:v160 forKey:@"userSegmentationApiModThreshold"];

  __int16 v142 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x100000000000000) == 0)
  {
LABEL_212:
    if ((v142 & 1) == 0) {
      goto LABEL_214;
    }
    goto LABEL_213;
  }
LABEL_235:
  v161 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_userSegmentationApiModMax, (void)v165);
  [v4 setObject:v161 forKey:@"userSegmentationApiModMax"];

  if (*((_WORD *)&self->_has + 4))
  {
LABEL_213:
    v143 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_privateDataMigrationCleanupLevel, (void)v165);
    [v4 setObject:v143 forKey:@"private_data_migration_cleanup_level"];
  }
LABEL_214:
  articleRecirculationComponentPlacementConfig = self->_articleRecirculationComponentPlacementConfig;
  if (articleRecirculationComponentPlacementConfig) {
    [v4 setObject:articleRecirculationComponentPlacementConfig forKey:@"article_recirculation_component_placement_config"];
  }
  uint64_t v145 = (uint64_t)self->_has;
  if ((v145 & 0x1000000000000000) != 0)
  {
    v146 = [NSNumber numberWithLongLong:self->_widgetEventImmediateUploadPopulationFloor];
    [v4 setObject:v146 forKey:@"widget_event_immediate_upload_population_floor"];

    uint64_t v145 = (uint64_t)self->_has;
  }
  __int16 v147 = *((_WORD *)&self->_has + 4);
  if ((v145 & 0x800000000000000) != 0)
  {
    v162 = [NSNumber numberWithLongLong:self->_widgetEventImmediateUploadPopulationCeiling];
    [v4 setObject:v162 forKey:@"widget_event_immediate_upload_population_ceiling"];

    uint64_t v145 = (uint64_t)self->_has;
    __int16 v147 = *((_WORD *)&self->_has + 4);
    if ((v145 & 0x400000000000000) == 0)
    {
LABEL_220:
      if ((v145 & 0x20) == 0) {
        goto LABEL_221;
      }
      goto LABEL_239;
    }
  }
  else if ((v145 & 0x400000000000000) == 0)
  {
    goto LABEL_220;
  }
  v163 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_widgetEventImmediateUploadModuloForHashing, (void)v165);
  [v4 setObject:v163 forKey:@"widget_event_immediate_upload_modulo_for_hashing"];

  __int16 v147 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x20) == 0)
  {
LABEL_221:
    if ((v147 & 0x20) == 0) {
      goto LABEL_223;
    }
    goto LABEL_222;
  }
LABEL_239:
  v164 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_articleRecirculationPopularFeedQueryTimeRange, (void)v165);
  [v4 setObject:v164 forKey:@"article_recirculation_popular_feed_query_time_range"];

  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
  {
LABEL_222:
    v148 = objc_msgSend(NSNumber, "numberWithBool:", self->_disableThumbnailsForArticleRecirculation, (void)v165);
    [v4 setObject:v148 forKey:@"disable_thumbnails_for_article_recirculation"];
  }
LABEL_223:
  userSegmentationApiConfiguration = self->_userSegmentationApiConfiguration;
  if (userSegmentationApiConfiguration)
  {
    v150 = [(NTPBUserSegmentationApiConfiguration *)userSegmentationApiConfiguration dictionaryRepresentation];
    [v4 setObject:v150 forKey:@"user_segmentation_api_configuration"];
  }
  id v151 = v4;

  return v151;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_fallbackLanguageTag) {
    PBDataWriterWriteStringField();
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v5 = self->_languageConfigs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v7);
  }

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t has = (uint64_t)self->_has;
  }
  if ((has & 0x20000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_14:
      if ((has & 0x100) == 0) {
        goto LABEL_15;
      }
      goto LABEL_149;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteDoubleField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_150:
  PBDataWriterWriteDoubleField();
  if ((*(void *)&self->_has & 0x2000000000) != 0) {
LABEL_17:
  }
    PBDataWriterWriteDoubleField();
LABEL_18:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v11 = self->_endpointConfigs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v13);
  }

  if (self->_personalizationConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_iadConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_prefetchConfig) {
    PBDataWriterWriteSubmessage();
  }
  p_uint64_t has = &self->_has;
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x8000000000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v17 = *(void *)p_has;
    if ((*(void *)p_has & 0x800000) == 0)
    {
LABEL_33:
      if ((v17 & 0x8000) == 0) {
        goto LABEL_34;
      }
      goto LABEL_154;
    }
  }
  else if ((v17 & 0x800000) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x8000) == 0)
  {
LABEL_34:
    if ((v17 & 0x80) == 0) {
      goto LABEL_35;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x80) == 0)
  {
LABEL_35:
    if ((v17 & 0x80000000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x80000000000000) == 0)
  {
LABEL_36:
    if ((v17 & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_37:
    if ((v17 & 0x1000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x1000000) == 0)
  {
LABEL_38:
    if ((v17 & 0x20000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x20000000000000) == 0)
  {
LABEL_39:
    if ((v17 & 0x10000000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x10000000000000) == 0)
  {
LABEL_40:
    if ((v17 & 0x800000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x800000000) == 0)
  {
LABEL_41:
    if ((v17 & 0x10) == 0) {
      goto LABEL_42;
    }
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x10) == 0)
  {
LABEL_42:
    if ((v17 & 0x400000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_162:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x400000000000) != 0) {
LABEL_43:
  }
    PBDataWriterWriteInt64Field();
LABEL_44:
  if (self->_anfEmbedConfigurationAsset) {
    PBDataWriterWriteStringField();
  }
  uint64_t v18 = &self->_has;
  uint64_t v19 = (uint64_t)self->_has;
  if ((v19 & 0x2000000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v19 = *(void *)v18;
    if ((*(void *)v18 & 0x1000000000000) == 0)
    {
LABEL_48:
      if ((v19 & 0x800000000000) == 0) {
        goto LABEL_49;
      }
      goto LABEL_166;
    }
  }
  else if ((v19 & 0x1000000000000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteInt64Field();
  uint64_t v19 = (uint64_t)self->_has;
  if ((v19 & 0x800000000000) == 0)
  {
LABEL_49:
    if ((v19 & 0x80000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteInt64Field();
  uint64_t v19 = (uint64_t)self->_has;
  if ((v19 & 0x80000000) == 0)
  {
LABEL_50:
    if ((v19 & 0x1000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteInt64Field();
  uint64_t v19 = (uint64_t)self->_has;
  if ((v19 & 0x1000) == 0)
  {
LABEL_51:
    if ((v19 & 0x800) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_168:
  PBDataWriterWriteDoubleField();
  if ((*(void *)&self->_has & 0x800) != 0) {
LABEL_52:
  }
    PBDataWriterWriteInt64Field();
LABEL_53:
  if (self->_widgetConfig) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v20 = &self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v21 = *(void *)v20;
  if ((*(void *)v20 & 0x100000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v21 = (uint64_t)self->_has;
  }
  if ((v21 & 0x200000000) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_forYouNonPersonalizedGroupsOrder) {
    PBDataWriterWriteStringField();
  }
  v22 = &self->_has;
  uint64_t v23 = (uint64_t)self->_has;
  if ((v23 & 0x400000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v23 = *(void *)v22;
    if ((*(void *)v22 & 0x40000000000) == 0)
    {
LABEL_65:
      if ((v23 & 0x20000000000) == 0) {
        goto LABEL_66;
      }
      goto LABEL_172;
    }
  }
  else if ((v23 & 0x40000000000) == 0)
  {
    goto LABEL_65;
  }
  PBDataWriterWriteInt64Field();
  uint64_t v23 = (uint64_t)self->_has;
  if ((v23 & 0x20000000000) == 0)
  {
LABEL_66:
    if ((v23 & 0x10000000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteInt64Field();
  uint64_t v23 = (uint64_t)self->_has;
  if ((v23 & 0x10000000000) == 0)
  {
LABEL_67:
    if ((v23 & 0x80000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_173:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x80000000000) != 0) {
LABEL_68:
  }
    PBDataWriterWriteInt64Field();
LABEL_69:
  if (self->_alternativeButlerWidgetConfig) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((_WORD *)&self->_has + 4) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_butlerWidgetConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_paidSubscriptionConfig) {
    PBDataWriterWriteSubmessage();
  }
  v24 = &self->_has;
  uint64_t v25 = (uint64_t)self->_has;
  if ((v25 & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v25 = *(void *)v24;
    if ((*(void *)v24 & 4) == 0)
    {
LABEL_79:
      if ((v25 & 0x80000) == 0) {
        goto LABEL_80;
      }
      goto LABEL_177;
    }
  }
  else if ((v25 & 4) == 0)
  {
    goto LABEL_79;
  }
  PBDataWriterWriteDoubleField();
  uint64_t v25 = (uint64_t)self->_has;
  if ((v25 & 0x80000) == 0)
  {
LABEL_80:
    if ((v25 & 0x100000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteInt64Field();
  uint64_t v25 = (uint64_t)self->_has;
  if ((v25 & 0x100000) == 0)
  {
LABEL_81:
    if ((v25 & 0x200000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteInt64Field();
  uint64_t v25 = (uint64_t)self->_has;
  if ((v25 & 0x200000) == 0)
  {
LABEL_82:
    if ((v25 & 0x4000000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteInt64Field();
  uint64_t v25 = (uint64_t)self->_has;
  if ((v25 & 0x4000000000) == 0)
  {
LABEL_83:
    if ((v25 & 0x8000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteDoubleField();
  uint64_t v25 = (uint64_t)self->_has;
  if ((v25 & 0x8000000000) == 0)
  {
LABEL_84:
    if ((v25 & 0x4000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteDoubleField();
  uint64_t v25 = (uint64_t)self->_has;
  if ((v25 & 0x4000) == 0)
  {
LABEL_85:
    if ((v25 & 0x40000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_86;
  }
LABEL_182:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x40000) != 0) {
LABEL_86:
  }
    PBDataWriterWriteInt64Field();
LABEL_87:
  if (self->_widgetConfig2) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v26 = (uint64_t)self->_has;
  if ((v26 & 0x4000000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v26 = (uint64_t)self->_has;
  }
  if ((v26 & 0x40000000000000) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_binningConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_personalizationTreatment) {
    PBDataWriterWriteSubmessage();
  }
  if (*(void *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_personalizationBundleIdMappingResourceId) {
    PBDataWriterWriteStringField();
  }
  if (self->_personalizationUrlMappingResourceId) {
    PBDataWriterWriteStringField();
  }
  if (self->_personalizationWhitelistResourceId) {
    PBDataWriterWriteStringField();
  }
  if ((*(void *)&self->_has & 0x2000000000000000) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_personalizationPublisherFavorabilityScoresResourceId) {
    PBDataWriterWriteStringField();
  }
  if (self->_personalizationWidgetSectionMappingResourceId) {
    PBDataWriterWriteStringField();
  }
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x200) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v27 = (uint64_t)self->_has;
  }
  __int16 v28 = *((_WORD *)&self->_has + 4);
  if ((v27 & 0x400) != 0)
  {
    PBDataWriterWriteInt64Field();
    __int16 v28 = *((_WORD *)&self->_has + 4);
  }
  if ((v28 & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v29 = self->_externalAnalyticsConfigs;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v31);
  }

  if (self->_personalizationPortraitConfigResourceId) {
    PBDataWriterWriteStringField();
  }
  if ((*(void *)&self->_has & 0x8000000000000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_experimentalizableFieldPostfix) {
    PBDataWriterWriteStringField();
  }
  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 0x20000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v34 = (uint64_t)self->_has;
  }
  __int16 v35 = *((_WORD *)&self->_has + 4);
  if ((v35 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v34 = (uint64_t)self->_has;
    __int16 v35 = *((_WORD *)&self->_has + 4);
    if ((v35 & 0x800) == 0)
    {
LABEL_136:
      if ((v34 & 0x4000000000000000) == 0) {
        goto LABEL_137;
      }
      goto LABEL_186;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x800) == 0)
  {
    goto LABEL_136;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v34 = (uint64_t)self->_has;
  __int16 v35 = *((_WORD *)&self->_has + 4);
  if ((v34 & 0x4000000000000000) == 0)
  {
LABEL_137:
    if ((v34 & 0x200000000000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteUint32Field();
  uint64_t v34 = (uint64_t)self->_has;
  __int16 v35 = *((_WORD *)&self->_has + 4);
  if ((v34 & 0x200000000000) == 0)
  {
LABEL_138:
    if ((v34 & 0x40) == 0) {
      goto LABEL_139;
    }
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteInt64Field();
  __int16 v35 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x40) == 0)
  {
LABEL_139:
    if ((v35 & 0x200) == 0) {
      goto LABEL_141;
    }
    goto LABEL_140;
  }
LABEL_188:
  PBDataWriterWriteInt64Field();
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0) {
LABEL_140:
  }
    PBDataWriterWriteBOOLField();
LABEL_141:
  if (self->_topStoriesPublishTimeIntervals.count)
  {
    unint64_t v36 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v36;
    }
    while (v36 < self->_topStoriesPublishTimeIntervals.count);
  }
  v37 = &self->_has;
  __int16 v38 = *((_WORD *)&self->_has + 4);
  if ((v38 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v39 = *(void *)v37;
    __int16 v38 = *((_WORD *)&self->_has + 4);
    if ((*(void *)v37 & 0x400000) == 0) {
      goto LABEL_192;
    }
    goto LABEL_191;
  }
  uint64_t v39 = *(void *)v37;
  if ((*(void *)v37 & 0x400000) != 0)
  {
LABEL_191:
    PBDataWriterWriteDoubleField();
    uint64_t v39 = (uint64_t)self->_has;
    __int16 v38 = *((_WORD *)&self->_has + 4);
  }
LABEL_192:
  if ((v39 & 0x40000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v39 = (uint64_t)self->_has;
    __int16 v38 = *((_WORD *)&self->_has + 4);
    if ((v38 & 2) == 0)
    {
LABEL_194:
      if ((v39 & 0x2000000) == 0) {
        goto LABEL_195;
      }
      goto LABEL_225;
    }
  }
  else if ((v38 & 2) == 0)
  {
    goto LABEL_194;
  }
  PBDataWriterWriteInt32Field();
  uint64_t v39 = (uint64_t)self->_has;
  __int16 v38 = *((_WORD *)&self->_has + 4);
  if ((v39 & 0x2000000) == 0)
  {
LABEL_195:
    if ((v39 & 0x4000000) == 0) {
      goto LABEL_196;
    }
    goto LABEL_226;
  }
LABEL_225:
  PBDataWriterWriteInt64Field();
  uint64_t v39 = (uint64_t)self->_has;
  __int16 v38 = *((_WORD *)&self->_has + 4);
  if ((v39 & 0x4000000) == 0)
  {
LABEL_196:
    if ((v39 & 0x8000000) == 0) {
      goto LABEL_197;
    }
    goto LABEL_227;
  }
LABEL_226:
  PBDataWriterWriteInt64Field();
  uint64_t v39 = (uint64_t)self->_has;
  __int16 v38 = *((_WORD *)&self->_has + 4);
  if ((v39 & 0x8000000) == 0)
  {
LABEL_197:
    if ((v39 & 0x10000000) == 0) {
      goto LABEL_198;
    }
    goto LABEL_228;
  }
LABEL_227:
  PBDataWriterWriteInt64Field();
  __int16 v38 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x10000000) == 0)
  {
LABEL_198:
    if ((v38 & 0x40) == 0) {
      goto LABEL_200;
    }
    goto LABEL_199;
  }
LABEL_228:
  PBDataWriterWriteInt64Field();
  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0) {
LABEL_199:
  }
    PBDataWriterWriteBOOLField();
LABEL_200:
  if (self->_forYouVideoGroupsConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_articleRecirculationConfig) {
    PBDataWriterWriteStringField();
  }
  uint64_t v40 = (uint64_t)self->_has;
  if ((v40 & 0x1000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v40 = (uint64_t)self->_has;
  }
  __int16 v41 = *((_WORD *)&self->_has + 4);
  if ((v40 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v40 = (uint64_t)self->_has;
    __int16 v41 = *((_WORD *)&self->_has + 4);
    if ((v40 & 0x200000000000000) == 0)
    {
LABEL_208:
      if ((v40 & 0x100000000000000) == 0) {
        goto LABEL_209;
      }
      goto LABEL_232;
    }
  }
  else if ((v40 & 0x200000000000000) == 0)
  {
    goto LABEL_208;
  }
  PBDataWriterWriteInt64Field();
  __int16 v41 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x100000000000000) == 0)
  {
LABEL_209:
    if ((v41 & 1) == 0) {
      goto LABEL_211;
    }
    goto LABEL_210;
  }
LABEL_232:
  PBDataWriterWriteInt64Field();
  if (*((_WORD *)&self->_has + 4)) {
LABEL_210:
  }
    PBDataWriterWriteUint32Field();
LABEL_211:
  if (self->_articleRecirculationComponentPlacementConfig) {
    PBDataWriterWriteStringField();
  }
  uint64_t v42 = (uint64_t)self->_has;
  if ((v42 & 0x1000000000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v42 = (uint64_t)self->_has;
  }
  __int16 v43 = *((_WORD *)&self->_has + 4);
  if ((v42 & 0x800000000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v42 = (uint64_t)self->_has;
    __int16 v43 = *((_WORD *)&self->_has + 4);
    if ((v42 & 0x400000000000000) == 0)
    {
LABEL_217:
      if ((v42 & 0x20) == 0) {
        goto LABEL_218;
      }
      goto LABEL_236;
    }
  }
  else if ((v42 & 0x400000000000000) == 0)
  {
    goto LABEL_217;
  }
  PBDataWriterWriteInt64Field();
  __int16 v43 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x20) == 0)
  {
LABEL_218:
    if ((v43 & 0x20) == 0) {
      goto LABEL_220;
    }
    goto LABEL_219;
  }
LABEL_236:
  PBDataWriterWriteInt64Field();
  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0) {
LABEL_219:
  }
    PBDataWriterWriteBOOLField();
LABEL_220:
  if (self->_userSegmentationApiConfiguration) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_fallbackLanguageTag copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 600);
  *(void *)(v5 + 600) = v6;

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v8 = self->_languageConfigs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v104 objects:v110 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v105 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v104 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLanguageConfigs:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v104 objects:v110 count:16];
    }
    while (v10);
  }

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000) != 0)
  {
    *(void *)(v5 + 384) = self->_shortReminderTime;
    *(void *)(v5 + 772) |= 0x100000000000uLL;
    uint64_t has = (uint64_t)self->_has;
  }
  if ((has & 0x20000) != 0)
  {
    *(void *)(v5 + 168) = self->_longReminderTime;
    *(void *)(v5 + 772) |= 0x20000uLL;
    uint64_t has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_12:
      if ((has & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
    goto LABEL_12;
  }
  *(unsigned char *)(v5 + 765) = self->_newsletterSubscriptionChecked;
  *(_WORD *)(v5 + 780) |= 0x80u;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(double *)(v5 + 96) = self->_batchedFeedTimeout;
  *(void *)(v5 + 772) |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_14:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_107:
  *(double *)(v5 + 160) = self->_interstitialAdLoadDelay;
  *(void *)(v5 + 772) |= 0x10000uLL;
  if ((*(void *)&self->_has & 0x2000000000) != 0)
  {
LABEL_15:
    *(double *)(v5 + 328) = self->_prerollLoadingTimeout;
    *(void *)(v5 + 772) |= 0x2000000000uLL;
  }
LABEL_16:
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v15 = self->_endpointConfigs;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v100 objects:v109 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v101;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v101 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = (void *)[*(id *)(*((void *)&v100 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addEndpointConfigs:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v100 objects:v109 count:16];
    }
    while (v17);
  }

  id v21 = [(NTPBPersonalizationConfig *)self->_personalizationConfig copyWithZone:a3];
  v22 = *(void **)(v5 + 664);
  *(void *)(v5 + 664) = v21;

  id v23 = [(NTPBIAdConfig *)self->_iadConfig copyWithZone:a3];
  v24 = *(void **)(v5 + 624);
  *(void *)(v5 + 624) = v23;

  id v25 = [(NTPBPrefetchConfig *)self->_prefetchConfig copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 720);
  *(void *)(v5 + 720) = v25;

  p_uint64_t has = &self->_has;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x8000000000000) != 0)
  {
    *(double *)(v5 + 440) = self->_tileProminenceScoreBalanceValue;
    *(void *)(v5 + 772) |= 0x8000000000000uLL;
    uint64_t v28 = *(void *)p_has;
    if ((*(void *)p_has & 0x800000) == 0)
    {
LABEL_25:
      if ((v28 & 0x8000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_111;
    }
  }
  else if ((v28 & 0x800000) == 0)
  {
    goto LABEL_25;
  }
  *(void *)(v5 + 216) = self->_minimumArticleUpdateInterval;
  *(void *)(v5 + 772) |= 0x800000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x8000) == 0)
  {
LABEL_26:
    if ((v28 & 0x80) == 0) {
      goto LABEL_27;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(void *)(v5 + 152) = self->_initialArticlesFromNewFavorite;
  *(void *)(v5 + 772) |= 0x8000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x80) == 0)
  {
LABEL_27:
    if ((v28 & 0x80000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(void *)(v5 + 88) = self->_autoScrollToTopFeedTimeout;
  *(void *)(v5 + 772) |= 0x80uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x80000000000000) == 0)
  {
LABEL_28:
    if ((v28 & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(void *)(v5 + 472) = self->_trendingTopicsRefreshRate;
  *(void *)(v5 + 772) |= 0x80000000000000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 2) == 0)
  {
LABEL_29:
    if ((v28 & 0x1000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(void *)(v5 + 40) = self->_appConfigRefreshRate;
  *(void *)(v5 + 772) |= 2uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x1000000) == 0)
  {
LABEL_30:
    if ((v28 & 0x20000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(void *)(v5 + 224) = self->_minimumDistanceBetweenImageOnTopTiles;
  *(void *)(v5 + 772) |= 0x1000000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x20000000000000) == 0)
  {
LABEL_31:
    if ((v28 & 0x10000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(void *)(v5 + 456) = self->_timeBetweenWidgetInsertions;
  *(void *)(v5 + 772) |= 0x20000000000000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x10000000000000) == 0)
  {
LABEL_32:
    if ((v28 & 0x800000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(void *)(v5 + 448) = self->_timeBetweenSameWidgetReinsertion;
  *(void *)(v5 + 772) |= 0x10000000000000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x800000000) == 0)
  {
LABEL_33:
    if ((v28 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_119;
  }
LABEL_118:
  *(void *)(v5 + 312) = self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit;
  *(void *)(v5 + 772) |= 0x800000000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x10) == 0)
  {
LABEL_34:
    if ((v28 & 0x400000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_119:
  *(void *)(v5 + 64) = self->_articleRapidUpdatesTimeout;
  *(void *)(v5 + 772) |= 0x10uLL;
  if ((*(void *)&self->_has & 0x400000000000) != 0)
  {
LABEL_35:
    *(void *)(v5 + 400) = self->_subscriptionsGlobalMeteredCount;
    *(void *)(v5 + 772) |= 0x400000000000uLL;
  }
LABEL_36:
  uint64_t v29 = [(NSString *)self->_anfEmbedConfigurationAsset copyWithZone:a3];
  uint64_t v30 = *(void **)(v5 + 528);
  *(void *)(v5 + 528) = v29;

  uint64_t v31 = &self->_has;
  uint64_t v32 = (uint64_t)self->_has;
  if ((v32 & 0x2000000000000) != 0)
  {
    *(void *)(v5 + 424) = self->_subscriptionsPlacardPublisherFrequencyDays;
    *(void *)(v5 + 772) |= 0x2000000000000uLL;
    uint64_t v32 = *(void *)v31;
    if ((*(void *)v31 & 0x1000000000000) == 0)
    {
LABEL_38:
      if ((v32 & 0x800000000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_123;
    }
  }
  else if ((v32 & 0x1000000000000) == 0)
  {
    goto LABEL_38;
  }
  *(void *)(v5 + 416) = self->_subscriptionsPlacardGlobalMaxPerDay;
  *(void *)(v5 + 772) |= 0x1000000000000uLL;
  uint64_t v32 = (uint64_t)self->_has;
  if ((v32 & 0x800000000000) == 0)
  {
LABEL_39:
    if ((v32 & 0x80000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_124;
  }
LABEL_123:
  *(void *)(v5 + 408) = self->_subscriptionsGracePeriodForTokenVerificationSeconds;
  *(void *)(v5 + 772) |= 0x800000000000uLL;
  uint64_t v32 = (uint64_t)self->_has;
  if ((v32 & 0x80000000) == 0)
  {
LABEL_40:
    if ((v32 & 0x1000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_125;
  }
LABEL_124:
  *(void *)(v5 + 280) = self->_newFavoriteNotificationAlertsFrequency;
  *(void *)(v5 + 772) |= 0x80000000uLL;
  uint64_t v32 = (uint64_t)self->_has;
  if ((v32 & 0x1000) == 0)
  {
LABEL_41:
    if ((v32 & 0x800) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_125:
  *(double *)(v5 + 128) = self->_endOfArticleMinPaidHeadlineRatio;
  *(void *)(v5 + 772) |= 0x1000uLL;
  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_42:
    *(void *)(v5 + 120) = self->_endOfArticleMaxInaccessiblePaidArticles;
    *(void *)(v5 + 772) |= 0x800uLL;
  }
LABEL_43:
  id v33 = [(NTPBWidgetConfig *)self->_widgetConfig copyWithZone:a3];
  uint64_t v34 = *(void **)(v5 + 744);
  *(void *)(v5 + 744) = v33;

  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 768) = self->_universalLinksEnabled;
    *(_WORD *)(v5 + 780) |= 0x400u;
  }
  uint64_t v35 = (uint64_t)self->_has;
  if ((v35 & 0x100000000) != 0)
  {
    *(void *)(v5 + 288) = self->_notificationArticleCacheTimeout;
    *(void *)(v5 + 772) |= 0x100000000uLL;
    uint64_t v35 = (uint64_t)self->_has;
  }
  if ((v35 & 0x200000000) != 0)
  {
    *(void *)(v5 + 296) = self->_notificationArticleWithRapidUpdatesCacheTimeout;
    *(void *)(v5 + 772) |= 0x200000000uLL;
  }
  uint64_t v36 = [(NSString *)self->_forYouNonPersonalizedGroupsOrder copyWithZone:a3];
  v37 = *(void **)(v5 + 608);
  *(void *)(v5 + 608) = v36;

  __int16 v38 = &self->_has;
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x400000000) != 0)
  {
    *(void *)(v5 + 304) = self->_notificationEnabledChannelsRefreshFrequency;
    *(void *)(v5 + 772) |= 0x400000000uLL;
    uint64_t v39 = *(void *)v38;
    if ((*(void *)v38 & 0x40000000000) == 0)
    {
LABEL_51:
      if ((v39 & 0x20000000000) == 0) {
        goto LABEL_52;
      }
      goto LABEL_129;
    }
  }
  else if ((v39 & 0x40000000000) == 0)
  {
    goto LABEL_51;
  }
  *(void *)(v5 + 368) = self->_savedArticlesMaximumCountWifi;
  *(void *)(v5 + 772) |= 0x40000000000uLL;
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x20000000000) == 0)
  {
LABEL_52:
    if ((v39 & 0x10000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_130;
  }
LABEL_129:
  *(void *)(v5 + 360) = self->_savedArticlesMaximumCountCellular;
  *(void *)(v5 + 772) |= 0x20000000000uLL;
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x10000000000) == 0)
  {
LABEL_53:
    if ((v39 & 0x80000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_130:
  *(void *)(v5 + 352) = self->_savedArticlesCutoffTime;
  *(void *)(v5 + 772) |= 0x10000000000uLL;
  if ((*(void *)&self->_has & 0x80000000000) != 0)
  {
LABEL_54:
    *(void *)(v5 + 376) = self->_savedArticlesOpenedCutoffTime;
    *(void *)(v5 + 772) |= 0x80000000000uLL;
  }
LABEL_55:
  id v40 = [(NTPBWidgetConfig *)self->_alternativeButlerWidgetConfig copyWithZone:a3];
  __int16 v41 = *(void **)(v5 + 520);
  *(void *)(v5 + 520) = v40;

  uint64_t v42 = &self->_has;
  if ((*((_WORD *)&self->_has + 4) & 4) != 0)
  {
    *(unsigned char *)(v5 + 760) = self->_alternativeButlerWidgetConfigEnabled;
    *(_WORD *)(v5 + 780) |= 4u;
  }
  id v43 = [(NTPBWidgetConfig *)self->_butlerWidgetConfig copyWithZone:a3];
  long long v44 = *(void **)(v5 + 560);
  *(void *)(v5 + 560) = v43;

  id v45 = [(NTPBPaidSubscriptionConfig *)self->_paidSubscriptionConfig copyWithZone:a3];
  long long v46 = *(void **)(v5 + 648);
  *(void *)(v5 + 648) = v45;

  uint64_t v47 = *(void *)v42;
  if ((*(void *)v42 & 8) != 0)
  {
    *(double *)(v5 + 56) = self->_articleDiversitySimilarityExpectationStart;
    *(void *)(v5 + 772) |= 8uLL;
    uint64_t v47 = (uint64_t)self->_has;
    if ((v47 & 4) == 0)
    {
LABEL_59:
      if ((v47 & 0x80000) == 0) {
        goto LABEL_60;
      }
      goto LABEL_134;
    }
  }
  else if ((v47 & 4) == 0)
  {
    goto LABEL_59;
  }
  *(double *)(v5 + 48) = self->_articleDiversitySimilarityExpectationEnd;
  *(void *)(v5 + 772) |= 4uLL;
  uint64_t v47 = (uint64_t)self->_has;
  if ((v47 & 0x80000) == 0)
  {
LABEL_60:
    if ((v47 & 0x100000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_135;
  }
LABEL_134:
  *(void *)(v5 + 184) = self->_maxPaidSubscriptionGroupSizeIPad;
  *(void *)(v5 + 772) |= 0x80000uLL;
  uint64_t v47 = (uint64_t)self->_has;
  if ((v47 & 0x100000) == 0)
  {
LABEL_61:
    if ((v47 & 0x200000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_136;
  }
LABEL_135:
  *(void *)(v5 + 192) = self->_maxPaidSubscriptionGroupSizeIPhone;
  *(void *)(v5 + 772) |= 0x100000uLL;
  uint64_t v47 = (uint64_t)self->_has;
  if ((v47 & 0x200000) == 0)
  {
LABEL_62:
    if ((v47 & 0x4000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_137;
  }
LABEL_136:
  *(void *)(v5 + 200) = self->_maxTimesHeadlineInPaidSubscriptionGroup;
  *(void *)(v5 + 772) |= 0x200000uLL;
  uint64_t v47 = (uint64_t)self->_has;
  if ((v47 & 0x4000000000) == 0)
  {
LABEL_63:
    if ((v47 & 0x8000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_138;
  }
LABEL_137:
  *(double *)(v5 + 336) = self->_publisherDiversitySlope;
  *(void *)(v5 + 772) |= 0x4000000000uLL;
  uint64_t v47 = (uint64_t)self->_has;
  if ((v47 & 0x8000000000) == 0)
  {
LABEL_64:
    if ((v47 & 0x4000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_139;
  }
LABEL_138:
  *(double *)(v5 + 344) = self->_publisherDiversityYIntercept;
  *(void *)(v5 + 772) |= 0x8000000000uLL;
  uint64_t v47 = (uint64_t)self->_has;
  if ((v47 & 0x4000) == 0)
  {
LABEL_65:
    if ((v47 & 0x40000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_139:
  *(void *)(v5 + 144) = self->_expiredPaidSubscriptionGroupCutoffTime;
  *(void *)(v5 + 772) |= 0x4000uLL;
  if ((*(void *)&self->_has & 0x40000) != 0)
  {
LABEL_66:
    *(void *)(v5 + 176) = self->_maxExpiredPaidSubscriptionGroupCount;
    *(void *)(v5 + 772) |= 0x40000uLL;
  }
LABEL_67:
  id v48 = [(NTPBWidgetConfig *)self->_widgetConfig2 copyWithZone:a3];
  long long v49 = *(void **)(v5 + 752);
  *(void *)(v5 + 752) = v48;

  uint64_t v50 = (uint64_t)self->_has;
  if ((v50 & 0x4000000000000) != 0)
  {
    *(void *)(v5 + 432) = self->_subscriptionsPlacardPublisherFrequencySeconds;
    *(void *)(v5 + 772) |= 0x4000000000000uLL;
    uint64_t v50 = (uint64_t)self->_has;
  }
  if ((v50 & 0x40000000000000) != 0)
  {
    *(void *)(v5 + 464) = self->_treatmentId;
    *(void *)(v5 + 772) |= 0x40000000000000uLL;
  }
  id v51 = [(NTPBBinningConfig *)self->_binningConfig copyWithZone:a3];
  long long v52 = *(void **)(v5 + 552);
  *(void *)(v5 + 552) = v51;

  id v53 = [(NTPBPersonalizationTreatment *)self->_personalizationTreatment copyWithZone:a3];
  long long v54 = *(void **)(v5 + 688);
  *(void *)(v5 + 688) = v53;

  if (*(void *)&self->_has)
  {
    *(void *)(v5 + 32) = self->_analyticsEndpointMaxPayloadSize;
    *(void *)(v5 + 772) |= 1uLL;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 766) = self->_orderFeedEndpointEnabled;
    *(_WORD *)(v5 + 780) |= 0x100u;
  }
  uint64_t v55 = [(NSString *)self->_personalizationBundleIdMappingResourceId copyWithZone:a3];
  v56 = *(void **)(v5 + 656);
  *(void *)(v5 + 656) = v55;

  uint64_t v57 = [(NSString *)self->_personalizationUrlMappingResourceId copyWithZone:a3];
  v58 = *(void **)(v5 + 696);
  *(void *)(v5 + 696) = v57;

  uint64_t v59 = [(NSString *)self->_personalizationWhitelistResourceId copyWithZone:a3];
  v60 = *(void **)(v5 + 704);
  *(void *)(v5 + 704) = v59;

  if ((*(void *)&self->_has & 0x2000000000000000) != 0)
  {
    *(_DWORD *)(v5 + 568) = self->_enabledPrivateDataEncryptionLevel;
    *(void *)(v5 + 772) |= 0x2000000000000000uLL;
  }
  uint64_t v61 = [(NSString *)self->_personalizationPublisherFavorabilityScoresResourceId copyWithZone:a3];
  v62 = *(void **)(v5 + 680);
  *(void *)(v5 + 680) = v61;

  uint64_t v63 = [(NSString *)self->_personalizationWidgetSectionMappingResourceId copyWithZone:a3];
  v64 = *(void **)(v5 + 712);
  *(void *)(v5 + 712) = v63;

  uint64_t v65 = (uint64_t)self->_has;
  if ((v65 & 0x200) != 0)
  {
    *(void *)(v5 + 104) = self->_corryBarMaxArticleCountForArticleList;
    *(void *)(v5 + 772) |= 0x200uLL;
    uint64_t v65 = (uint64_t)self->_has;
  }
  __int16 v66 = *((_WORD *)&self->_has + 4);
  if ((v65 & 0x400) != 0)
  {
    *(void *)(v5 + 112) = self->_corryBarMaxArticleCountForSingleArticle;
    *(void *)(v5 + 772) |= 0x400uLL;
    __int16 v66 = *((_WORD *)&self->_has + 4);
  }
  if ((v66 & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 762) = self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
    *(_WORD *)(v5 + 780) |= 0x10u;
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v67 = self->_externalAnalyticsConfigs;
  uint64_t v68 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v96 objects:v108 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v97;
    do
    {
      for (uint64_t k = 0; k != v69; ++k)
      {
        if (*(void *)v97 != v70) {
          objc_enumerationMutation(v67);
        }
        v72 = objc_msgSend(*(id *)(*((void *)&v96 + 1) + 8 * k), "copyWithZone:", a3, (void)v96);
        [(id)v5 addExternalAnalyticsConfig:v72];
      }
      uint64_t v69 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v96 objects:v108 count:16];
    }
    while (v69);
  }

  uint64_t v73 = [(NSString *)self->_personalizationPortraitConfigResourceId copyWithZone:a3];
  uint64_t v74 = *(void **)(v5 + 672);
  *(void *)(v5 + 672) = v73;

  if ((*(void *)&self->_has & 0x8000000000000000) != 0)
  {
    *(_DWORD *)(v5 + 644) = self->_orderFeedEnabledLevelDeprecated;
    *(void *)(v5 + 772) |= 0x8000000000000000;
  }
  uint64_t v75 = -[NSString copyWithZone:](self->_experimentalizableFieldPostfix, "copyWithZone:", a3, (void)v96);
  __int16 v76 = *(void **)(v5 + 584);
  *(void *)(v5 + 584) = v75;

  uint64_t v77 = (uint64_t)self->_has;
  if ((v77 & 0x20000000) != 0)
  {
    *(void *)(v5 + 264) = self->_minimumFollowCountToRemovePersonalizePlacardInFollowing;
    *(void *)(v5 + 772) |= 0x20000000uLL;
    uint64_t v77 = (uint64_t)self->_has;
  }
  __int16 v78 = *((_WORD *)&self->_has + 4);
  if ((v78 & 0x1000) != 0)
  {
    *(unsigned char *)(v5 + 770) = self->_useSecureConnectionForAssets;
    *(_WORD *)(v5 + 780) |= 0x1000u;
    uint64_t v77 = (uint64_t)self->_has;
    __int16 v78 = *((_WORD *)&self->_has + 4);
    if ((v78 & 0x800) == 0)
    {
LABEL_96:
      if ((v77 & 0x4000000000000000) == 0) {
        goto LABEL_97;
      }
      goto LABEL_143;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x800) == 0)
  {
    goto LABEL_96;
  }
  *(unsigned char *)(v5 + 769) = self->_usUkUseAuWhatsNewFeatures;
  *(_WORD *)(v5 + 780) |= 0x800u;
  uint64_t v77 = (uint64_t)self->_has;
  __int16 v78 = *((_WORD *)&self->_has + 4);
  if ((v77 & 0x4000000000000000) == 0)
  {
LABEL_97:
    if ((v77 & 0x200000000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_144;
  }
LABEL_143:
  *(_DWORD *)(v5 + 640) = self->_orderFeedEnabledLevel;
  *(void *)(v5 + 772) |= 0x4000000000000000uLL;
  uint64_t v77 = (uint64_t)self->_has;
  __int16 v78 = *((_WORD *)&self->_has + 4);
  if ((v77 & 0x200000000000) == 0)
  {
LABEL_98:
    if ((v77 & 0x40) == 0) {
      goto LABEL_99;
    }
    goto LABEL_145;
  }
LABEL_144:
  *(void *)(v5 + 392) = self->_stateRestorationAllowedTimeWindow;
  *(void *)(v5 + 772) |= 0x200000000000uLL;
  __int16 v78 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x40) == 0)
  {
LABEL_99:
    if ((v78 & 0x200) == 0) {
      goto LABEL_101;
    }
    goto LABEL_100;
  }
LABEL_145:
  *(void *)(v5 + 80) = self->_autoRefreshMinimumInterval;
  *(void *)(v5 + 772) |= 0x40uLL;
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
  {
LABEL_100:
    *(unsigned char *)(v5 + 767) = self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
    *(_WORD *)(v5 + 780) |= 0x200u;
  }
LABEL_101:
  PBRepeatedInt64Copy();
  v79 = &self->_has;
  __int16 v80 = *((_WORD *)&self->_has + 4);
  if ((v80 & 8) != 0)
  {
    *(unsigned char *)(v5 + 761) = self->_articleSearchEnabled;
    *(_WORD *)(v5 + 780) |= 8u;
    uint64_t v81 = *(void *)v79;
    __int16 v80 = *((_WORD *)&self->_has + 4);
    if ((*(void *)v79 & 0x400000) == 0) {
      goto LABEL_149;
    }
    goto LABEL_148;
  }
  uint64_t v81 = *(void *)v79;
  if ((*(void *)v79 & 0x400000) != 0)
  {
LABEL_148:
    *(double *)(v5 + 208) = self->_maximumRatioOfArticlesInForYouGroup;
    *(void *)(v5 + 772) |= 0x400000uLL;
    uint64_t v81 = (uint64_t)self->_has;
    __int16 v80 = *((_WORD *)&self->_has + 4);
  }
LABEL_149:
  if ((v81 & 0x40000000) != 0)
  {
    *(double *)(v5 + 272) = self->_minimumTrendingUnseenRatio;
    *(void *)(v5 + 772) |= 0x40000000uLL;
    uint64_t v81 = (uint64_t)self->_has;
    __int16 v80 = *((_WORD *)&self->_has + 4);
    if ((v80 & 2) == 0)
    {
LABEL_151:
      if ((v81 & 0x2000000) == 0) {
        goto LABEL_152;
      }
      goto LABEL_174;
    }
  }
  else if ((v80 & 2) == 0)
  {
    goto LABEL_151;
  }
  *(_DWORD *)(v5 + 732) = self->_trendingStyle;
  *(_WORD *)(v5 + 780) |= 2u;
  uint64_t v81 = (uint64_t)self->_has;
  __int16 v80 = *((_WORD *)&self->_has + 4);
  if ((v81 & 0x2000000) == 0)
  {
LABEL_152:
    if ((v81 & 0x4000000) == 0) {
      goto LABEL_153;
    }
    goto LABEL_175;
  }
LABEL_174:
  *(void *)(v5 + 232) = self->_minimumDurationBetweenForYouGroupsWeekday;
  *(void *)(v5 + 772) |= 0x2000000uLL;
  uint64_t v81 = (uint64_t)self->_has;
  __int16 v80 = *((_WORD *)&self->_has + 4);
  if ((v81 & 0x4000000) == 0)
  {
LABEL_153:
    if ((v81 & 0x8000000) == 0) {
      goto LABEL_154;
    }
    goto LABEL_176;
  }
LABEL_175:
  *(void *)(v5 + 240) = self->_minimumDurationBetweenForYouGroupsWeekend;
  *(void *)(v5 + 772) |= 0x4000000uLL;
  uint64_t v81 = (uint64_t)self->_has;
  __int16 v80 = *((_WORD *)&self->_has + 4);
  if ((v81 & 0x8000000) == 0)
  {
LABEL_154:
    if ((v81 & 0x10000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_177;
  }
LABEL_176:
  *(void *)(v5 + 248) = self->_minimumDurationBetweenTrendingGroupsWeekday;
  *(void *)(v5 + 772) |= 0x8000000uLL;
  __int16 v80 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x10000000) == 0)
  {
LABEL_155:
    if ((v80 & 0x40) == 0) {
      goto LABEL_157;
    }
    goto LABEL_156;
  }
LABEL_177:
  *(void *)(v5 + 256) = self->_minimumDurationBetweenTrendingGroupsWeekend;
  *(void *)(v5 + 772) |= 0x10000000uLL;
  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
  {
LABEL_156:
    *(unsigned char *)(v5 + 764) = self->_diversifyOptionalTopStories;
    *(_WORD *)(v5 + 780) |= 0x40u;
  }
LABEL_157:
  id v82 = [(NTPBVideoGroupsConfig *)self->_forYouVideoGroupsConfig copyWithZone:a3];
  uint64_t v83 = *(void **)(v5 + 616);
  *(void *)(v5 + 616) = v82;

  uint64_t v84 = [(NSString *)self->_articleRecirculationConfig copyWithZone:a3];
  v85 = *(void **)(v5 + 544);
  *(void *)(v5 + 544) = v84;

  uint64_t v86 = (uint64_t)self->_has;
  if ((v86 & 0x1000000000) != 0)
  {
    *(void *)(v5 + 320) = self->_optionalTopStoriesRefreshRate;
    *(void *)(v5 + 772) |= 0x1000000000uLL;
    uint64_t v86 = (uint64_t)self->_has;
  }
  __int16 v87 = *((_WORD *)&self->_has + 4);
  if ((v86 & 0x2000) != 0)
  {
    *(void *)(v5 + 136) = self->_expirePinnedArticlesAfter;
    *(void *)(v5 + 772) |= 0x2000uLL;
    uint64_t v86 = (uint64_t)self->_has;
    __int16 v87 = *((_WORD *)&self->_has + 4);
    if ((v86 & 0x200000000000000) == 0)
    {
LABEL_161:
      if ((v86 & 0x100000000000000) == 0) {
        goto LABEL_162;
      }
      goto LABEL_181;
    }
  }
  else if ((v86 & 0x200000000000000) == 0)
  {
    goto LABEL_161;
  }
  *(void *)(v5 + 488) = self->_userSegmentationApiModThreshold;
  *(void *)(v5 + 772) |= 0x200000000000000uLL;
  __int16 v87 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x100000000000000) == 0)
  {
LABEL_162:
    if ((v87 & 1) == 0) {
      goto LABEL_164;
    }
    goto LABEL_163;
  }
LABEL_181:
  *(void *)(v5 + 480) = self->_userSegmentationApiModMax;
  *(void *)(v5 + 772) |= 0x100000000000000uLL;
  if (*((_WORD *)&self->_has + 4))
  {
LABEL_163:
    *(_DWORD *)(v5 + 728) = self->_privateDataMigrationCleanupLevel;
    *(_WORD *)(v5 + 780) |= 1u;
  }
LABEL_164:
  uint64_t v88 = [(NSString *)self->_articleRecirculationComponentPlacementConfig copyWithZone:a3];
  uint64_t v89 = *(void **)(v5 + 536);
  *(void *)(v5 + 536) = v88;

  uint64_t v90 = (uint64_t)self->_has;
  if ((v90 & 0x1000000000000000) != 0)
  {
    *(void *)(v5 + 512) = self->_widgetEventImmediateUploadPopulationFloor;
    *(void *)(v5 + 772) |= 0x1000000000000000uLL;
    uint64_t v90 = (uint64_t)self->_has;
  }
  __int16 v91 = *((_WORD *)&self->_has + 4);
  if ((v90 & 0x800000000000000) != 0)
  {
    *(void *)(v5 + 504) = self->_widgetEventImmediateUploadPopulationCeiling;
    *(void *)(v5 + 772) |= 0x800000000000000uLL;
    uint64_t v90 = (uint64_t)self->_has;
    __int16 v91 = *((_WORD *)&self->_has + 4);
    if ((v90 & 0x400000000000000) == 0)
    {
LABEL_168:
      if ((v90 & 0x20) == 0) {
        goto LABEL_169;
      }
LABEL_185:
      *(void *)(v5 + 72) = self->_articleRecirculationPopularFeedQueryTimeRange;
      *(void *)(v5 + 772) |= 0x20uLL;
      if ((*((_WORD *)&self->_has + 4) & 0x20) == 0) {
        goto LABEL_171;
      }
      goto LABEL_170;
    }
  }
  else if ((v90 & 0x400000000000000) == 0)
  {
    goto LABEL_168;
  }
  *(void *)(v5 + 496) = self->_widgetEventImmediateUploadModuloForHashing;
  *(void *)(v5 + 772) |= 0x400000000000000uLL;
  __int16 v91 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x20) != 0) {
    goto LABEL_185;
  }
LABEL_169:
  if ((v91 & 0x20) != 0)
  {
LABEL_170:
    *(unsigned char *)(v5 + 763) = self->_disableThumbnailsForArticleRecirculation;
    *(_WORD *)(v5 + 780) |= 0x20u;
  }
LABEL_171:
  id v92 = [(NTPBUserSegmentationApiConfiguration *)self->_userSegmentationApiConfiguration copyWithZone:a3];
  v93 = *(void **)(v5 + 736);
  *(void *)(v5 + 736) = v92;

  id v94 = (id)v5;
  return v94;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_478;
  }
  fallbackLanguageTag = self->_fallbackLanguageTag;
  if ((unint64_t)fallbackLanguageTag | *((void *)v4 + 75))
  {
    if (!-[NSString isEqual:](fallbackLanguageTag, "isEqual:")) {
      goto LABEL_478;
    }
  }
  languageConfigs = self->_languageConfigs;
  if ((unint64_t)languageConfigs | *((void *)v4 + 79))
  {
    if (!-[NSMutableArray isEqual:](languageConfigs, "isEqual:")) {
      goto LABEL_478;
    }
  }
  uint64_t has = (uint64_t)self->_has;
  uint64_t v8 = *(void *)(v4 + 772);
  __int16 v9 = *((_WORD *)v4 + 390);
  if ((has & 0x100000000000) != 0)
  {
    if ((v8 & 0x100000000000) == 0 || self->_shortReminderTime != *((void *)v4 + 48)) {
      goto LABEL_478;
    }
  }
  else if ((v8 & 0x100000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_longReminderTime != *((void *)v4 + 21)) {
      goto LABEL_478;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_478;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0) {
      goto LABEL_478;
    }
    if (self->_newsletterSubscriptionChecked)
    {
      if (!v4[765]) {
        goto LABEL_478;
      }
    }
    else if (v4[765])
    {
      goto LABEL_478;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_478;
  }
  if ((has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_batchedFeedTimeout != *((double *)v4 + 12)) {
      goto LABEL_478;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_478;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_interstitialAdLoadDelay != *((double *)v4 + 20)) {
      goto LABEL_478;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_478;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v8 & 0x2000000000) == 0 || self->_prerollLoadingTimeout != *((double *)v4 + 41)) {
      goto LABEL_478;
    }
  }
  else if ((v8 & 0x2000000000) != 0)
  {
    goto LABEL_478;
  }
  endpointConfigs = self->_endpointConfigs;
  if ((unint64_t)endpointConfigs | *((void *)v4 + 72)
    && !-[NSMutableArray isEqual:](endpointConfigs, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationConfig = self->_personalizationConfig;
  if ((unint64_t)personalizationConfig | *((void *)v4 + 83))
  {
    if (!-[NTPBPersonalizationConfig isEqual:](personalizationConfig, "isEqual:")) {
      goto LABEL_478;
    }
  }
  iadConfig = self->_iadConfig;
  if ((unint64_t)iadConfig | *((void *)v4 + 78))
  {
    if (!-[NTPBIAdConfig isEqual:](iadConfig, "isEqual:")) {
      goto LABEL_478;
    }
  }
  prefetchConfig = self->_prefetchConfig;
  if ((unint64_t)prefetchConfig | *((void *)v4 + 90))
  {
    if (!-[NTPBPrefetchConfig isEqual:](prefetchConfig, "isEqual:")) {
      goto LABEL_478;
    }
  }
  uint64_t v14 = (uint64_t)self->_has;
  __int16 v15 = *((_WORD *)&self->_has + 4);
  uint64_t v16 = *(void *)(v4 + 772);
  if ((v14 & 0x8000000000000) != 0)
  {
    if ((v16 & 0x8000000000000) == 0 || self->_tileProminenceScoreBalanceValue != *((double *)v4 + 55)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x8000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x800000) != 0)
  {
    if ((v16 & 0x800000) == 0 || self->_minimumArticleUpdateInterval != *((void *)v4 + 27)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x800000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x8000) != 0)
  {
    if ((v16 & 0x8000) == 0 || self->_initialArticlesFromNewFavorite != *((void *)v4 + 19)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x8000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0 || self->_autoScrollToTopFeedTimeout != *((void *)v4 + 11)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x80000000000000) != 0)
  {
    if ((v16 & 0x80000000000000) == 0 || self->_trendingTopicsRefreshRate != *((void *)v4 + 59)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x80000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_appConfigRefreshRate != *((void *)v4 + 5)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 2) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x1000000) != 0)
  {
    if ((v16 & 0x1000000) == 0 || self->_minimumDistanceBetweenImageOnTopTiles != *((void *)v4 + 28)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x1000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x20000000000000) != 0)
  {
    if ((v16 & 0x20000000000000) == 0 || self->_timeBetweenWidgetInsertions != *((void *)v4 + 57)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x20000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x10000000000000) != 0)
  {
    if ((v16 & 0x10000000000000) == 0 || self->_timeBetweenSameWidgetReinsertion != *((void *)v4 + 56)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x10000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x800000000) != 0)
  {
    if ((v16 & 0x800000000) == 0 || self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit != *((void *)v4 + 39)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x800000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_articleRapidUpdatesTimeout != *((void *)v4 + 8)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x400000000000) != 0)
  {
    if ((v16 & 0x400000000000) == 0 || self->_subscriptionsGlobalMeteredCount != *((void *)v4 + 50)) {
      goto LABEL_478;
    }
  }
  else if ((v16 & 0x400000000000) != 0)
  {
    goto LABEL_478;
  }
  anfEmbedConfigurationAsset = self->_anfEmbedConfigurationAsset;
  if ((unint64_t)anfEmbedConfigurationAsset | *((void *)v4 + 66))
  {
    if (!-[NSString isEqual:](anfEmbedConfigurationAsset, "isEqual:")) {
      goto LABEL_478;
    }
    uint64_t v14 = (uint64_t)self->_has;
    __int16 v15 = *((_WORD *)&self->_has + 4);
  }
  uint64_t v18 = *(void *)(v4 + 772);
  if ((v14 & 0x2000000000000) != 0)
  {
    if ((v18 & 0x2000000000000) == 0 || self->_subscriptionsPlacardPublisherFrequencyDays != *((void *)v4 + 53)) {
      goto LABEL_478;
    }
  }
  else if ((v18 & 0x2000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x1000000000000) != 0)
  {
    if ((v18 & 0x1000000000000) == 0 || self->_subscriptionsPlacardGlobalMaxPerDay != *((void *)v4 + 52)) {
      goto LABEL_478;
    }
  }
  else if ((v18 & 0x1000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x800000000000) != 0)
  {
    if ((v18 & 0x800000000000) == 0
      || self->_subscriptionsGracePeriodForTokenVerificationSeconds != *((void *)v4 + 51))
    {
      goto LABEL_478;
    }
  }
  else if ((v18 & 0x800000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x80000000) != 0)
  {
    if ((v18 & 0x80000000) == 0 || self->_newFavoriteNotificationAlertsFrequency != *((void *)v4 + 35)) {
      goto LABEL_478;
    }
  }
  else if ((v18 & 0x80000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x1000) != 0)
  {
    if ((v18 & 0x1000) == 0 || self->_endOfArticleMinPaidHeadlineRatio != *((double *)v4 + 16)) {
      goto LABEL_478;
    }
  }
  else if ((v18 & 0x1000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x800) != 0)
  {
    if ((v18 & 0x800) == 0 || self->_endOfArticleMaxInaccessiblePaidArticles != *((void *)v4 + 15)) {
      goto LABEL_478;
    }
  }
  else if ((v18 & 0x800) != 0)
  {
    goto LABEL_478;
  }
  widgetConfig = self->_widgetConfig;
  if ((unint64_t)widgetConfig | *((void *)v4 + 93))
  {
    if (!-[NTPBWidgetConfig isEqual:](widgetConfig, "isEqual:")) {
      goto LABEL_478;
    }
    uint64_t v14 = (uint64_t)self->_has;
    __int16 v15 = *((_WORD *)&self->_has + 4);
  }
  uint64_t v20 = *(void *)(v4 + 772);
  if ((v15 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x400) == 0) {
      goto LABEL_478;
    }
    if (self->_universalLinksEnabled)
    {
      if (!v4[768]) {
        goto LABEL_478;
      }
    }
    else if (v4[768])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x400) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x100000000) != 0)
  {
    if ((v20 & 0x100000000) == 0 || self->_notificationArticleCacheTimeout != *((void *)v4 + 36)) {
      goto LABEL_478;
    }
  }
  else if ((v20 & 0x100000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x200000000) != 0)
  {
    if ((v20 & 0x200000000) == 0 || self->_notificationArticleWithRapidUpdatesCacheTimeout != *((void *)v4 + 37)) {
      goto LABEL_478;
    }
  }
  else if ((v20 & 0x200000000) != 0)
  {
    goto LABEL_478;
  }
  forYouNonPersonalizedGroupsOrder = self->_forYouNonPersonalizedGroupsOrder;
  if ((unint64_t)forYouNonPersonalizedGroupsOrder | *((void *)v4 + 76))
  {
    if (!-[NSString isEqual:](forYouNonPersonalizedGroupsOrder, "isEqual:")) {
      goto LABEL_478;
    }
    uint64_t v14 = (uint64_t)self->_has;
    __int16 v15 = *((_WORD *)&self->_has + 4);
  }
  uint64_t v22 = *(void *)(v4 + 772);
  if ((v14 & 0x400000000) != 0)
  {
    if ((v22 & 0x400000000) == 0 || self->_notificationEnabledChannelsRefreshFrequency != *((void *)v4 + 38)) {
      goto LABEL_478;
    }
  }
  else if ((v22 & 0x400000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x40000000000) != 0)
  {
    if ((v22 & 0x40000000000) == 0 || self->_savedArticlesMaximumCountWifi != *((void *)v4 + 46)) {
      goto LABEL_478;
    }
  }
  else if ((v22 & 0x40000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x20000000000) != 0)
  {
    if ((v22 & 0x20000000000) == 0 || self->_savedArticlesMaximumCountCellular != *((void *)v4 + 45)) {
      goto LABEL_478;
    }
  }
  else if ((v22 & 0x20000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x10000000000) != 0)
  {
    if ((v22 & 0x10000000000) == 0 || self->_savedArticlesCutoffTime != *((void *)v4 + 44)) {
      goto LABEL_478;
    }
  }
  else if ((v22 & 0x10000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x80000000000) != 0)
  {
    if ((v22 & 0x80000000000) == 0 || self->_savedArticlesOpenedCutoffTime != *((void *)v4 + 47)) {
      goto LABEL_478;
    }
  }
  else if ((v22 & 0x80000000000) != 0)
  {
    goto LABEL_478;
  }
  alternativeButlerWidgetConfig = self->_alternativeButlerWidgetConfig;
  if ((unint64_t)alternativeButlerWidgetConfig | *((void *)v4 + 65))
  {
    if (!-[NTPBWidgetConfig isEqual:](alternativeButlerWidgetConfig, "isEqual:")) {
      goto LABEL_478;
    }
    __int16 v15 = *((_WORD *)&self->_has + 4);
  }
  __int16 v24 = *((_WORD *)v4 + 390);
  if ((v15 & 4) != 0)
  {
    if ((v24 & 4) == 0) {
      goto LABEL_478;
    }
    if (self->_alternativeButlerWidgetConfigEnabled)
    {
      if (!v4[760]) {
        goto LABEL_478;
      }
    }
    else if (v4[760])
    {
      goto LABEL_478;
    }
  }
  else if ((v24 & 4) != 0)
  {
    goto LABEL_478;
  }
  butlerWidgetConfig = self->_butlerWidgetConfig;
  if ((unint64_t)butlerWidgetConfig | *((void *)v4 + 70)
    && !-[NTPBWidgetConfig isEqual:](butlerWidgetConfig, "isEqual:"))
  {
    goto LABEL_478;
  }
  paidSubscriptionConfig = self->_paidSubscriptionConfig;
  if ((unint64_t)paidSubscriptionConfig | *((void *)v4 + 81))
  {
    if (!-[NTPBPaidSubscriptionConfig isEqual:](paidSubscriptionConfig, "isEqual:")) {
      goto LABEL_478;
    }
  }
  uint64_t v27 = (uint64_t)self->_has;
  uint64_t v28 = *(void *)(v4 + 772);
  if ((v27 & 8) != 0)
  {
    if ((v28 & 8) == 0 || self->_articleDiversitySimilarityExpectationStart != *((double *)v4 + 7)) {
      goto LABEL_478;
    }
  }
  else if ((v28 & 8) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 4) != 0)
  {
    if ((v28 & 4) == 0 || self->_articleDiversitySimilarityExpectationEnd != *((double *)v4 + 6)) {
      goto LABEL_478;
    }
  }
  else if ((v28 & 4) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x80000) != 0)
  {
    if ((v28 & 0x80000) == 0 || self->_maxPaidSubscriptionGroupSizeIPad != *((void *)v4 + 23)) {
      goto LABEL_478;
    }
  }
  else if ((v28 & 0x80000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x100000) != 0)
  {
    if ((v28 & 0x100000) == 0 || self->_maxPaidSubscriptionGroupSizeIPhone != *((void *)v4 + 24)) {
      goto LABEL_478;
    }
  }
  else if ((v28 & 0x100000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x200000) != 0)
  {
    if ((v28 & 0x200000) == 0 || self->_maxTimesHeadlineInPaidSubscriptionGroup != *((void *)v4 + 25)) {
      goto LABEL_478;
    }
  }
  else if ((v28 & 0x200000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x4000000000) != 0)
  {
    if ((v28 & 0x4000000000) == 0 || self->_publisherDiversitySlope != *((double *)v4 + 42)) {
      goto LABEL_478;
    }
  }
  else if ((v28 & 0x4000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x8000000000) != 0)
  {
    if ((v28 & 0x8000000000) == 0 || self->_publisherDiversityYIntercept != *((double *)v4 + 43)) {
      goto LABEL_478;
    }
  }
  else if ((v28 & 0x8000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x4000) != 0)
  {
    if ((v28 & 0x4000) == 0 || self->_expiredPaidSubscriptionGroupCutoffTime != *((void *)v4 + 18)) {
      goto LABEL_478;
    }
  }
  else if ((v28 & 0x4000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x40000) != 0)
  {
    if ((v28 & 0x40000) == 0 || self->_maxExpiredPaidSubscriptionGroupCount != *((void *)v4 + 22)) {
      goto LABEL_478;
    }
  }
  else if ((v28 & 0x40000) != 0)
  {
    goto LABEL_478;
  }
  widgetConfig2 = self->_widgetConfig2;
  if ((unint64_t)widgetConfig2 | *((void *)v4 + 94))
  {
    if (!-[NTPBWidgetConfig isEqual:](widgetConfig2, "isEqual:")) {
      goto LABEL_478;
    }
    uint64_t v27 = (uint64_t)self->_has;
  }
  uint64_t v30 = *(void *)(v4 + 772);
  if ((v27 & 0x4000000000000) != 0)
  {
    if ((v30 & 0x4000000000000) == 0 || self->_subscriptionsPlacardPublisherFrequencySeconds != *((void *)v4 + 54)) {
      goto LABEL_478;
    }
  }
  else if ((v30 & 0x4000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x40000000000000) != 0)
  {
    if ((v30 & 0x40000000000000) == 0 || self->_treatmentId != *((void *)v4 + 58)) {
      goto LABEL_478;
    }
  }
  else if ((v30 & 0x40000000000000) != 0)
  {
    goto LABEL_478;
  }
  binningConfig = self->_binningConfig;
  if ((unint64_t)binningConfig | *((void *)v4 + 69)
    && !-[NTPBBinningConfig isEqual:](binningConfig, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationTreatment = self->_personalizationTreatment;
  if ((unint64_t)personalizationTreatment | *((void *)v4 + 86))
  {
    if (!-[NTPBPersonalizationTreatment isEqual:](personalizationTreatment, "isEqual:")) {
      goto LABEL_478;
    }
  }
  uint64_t v33 = *(void *)(v4 + 772);
  if (*(void *)&self->_has)
  {
    if ((v33 & 1) == 0 || self->_analyticsEndpointMaxPayloadSize != *((void *)v4 + 4)) {
      goto LABEL_478;
    }
  }
  else if (v33)
  {
    goto LABEL_478;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x100) == 0) {
      goto LABEL_478;
    }
    if (self->_orderFeedEndpointEnabled)
    {
      if (!v4[766]) {
        goto LABEL_478;
      }
    }
    else if (v4[766])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x100) != 0)
  {
    goto LABEL_478;
  }
  personalizationBundleIdMappingResourceId = self->_personalizationBundleIdMappingResourceId;
  if ((unint64_t)personalizationBundleIdMappingResourceId | *((void *)v4 + 82)
    && !-[NSString isEqual:](personalizationBundleIdMappingResourceId, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationUrlMappingResourceId = self->_personalizationUrlMappingResourceId;
  if ((unint64_t)personalizationUrlMappingResourceId | *((void *)v4 + 87))
  {
    if (!-[NSString isEqual:](personalizationUrlMappingResourceId, "isEqual:")) {
      goto LABEL_478;
    }
  }
  personalizationWhitelistResourceId = self->_personalizationWhitelistResourceId;
  if ((unint64_t)personalizationWhitelistResourceId | *((void *)v4 + 88))
  {
    if (!-[NSString isEqual:](personalizationWhitelistResourceId, "isEqual:")) {
      goto LABEL_478;
    }
  }
  uint64_t v37 = *(void *)(v4 + 772);
  if ((*(void *)&self->_has & 0x2000000000000000) != 0)
  {
    if ((v37 & 0x2000000000000000) == 0 || self->_enabledPrivateDataEncryptionLevel != *((_DWORD *)v4 + 142)) {
      goto LABEL_478;
    }
  }
  else if ((v37 & 0x2000000000000000) != 0)
  {
    goto LABEL_478;
  }
  personalizationPublisherFavorabilityScoresResourceId = self->_personalizationPublisherFavorabilityScoresResourceId;
  if ((unint64_t)personalizationPublisherFavorabilityScoresResourceId | *((void *)v4 + 85)
    && !-[NSString isEqual:](personalizationPublisherFavorabilityScoresResourceId, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationWidgetSectionMappingResourceId = self->_personalizationWidgetSectionMappingResourceId;
  if ((unint64_t)personalizationWidgetSectionMappingResourceId | *((void *)v4 + 89))
  {
    if (!-[NSString isEqual:](personalizationWidgetSectionMappingResourceId, "isEqual:")) {
      goto LABEL_478;
    }
  }
  uint64_t v40 = (uint64_t)self->_has;
  uint64_t v41 = *(void *)(v4 + 772);
  __int16 v42 = *((_WORD *)v4 + 390);
  if ((v40 & 0x200) != 0)
  {
    if ((v41 & 0x200) == 0 || self->_corryBarMaxArticleCountForArticleList != *((void *)v4 + 13)) {
      goto LABEL_478;
    }
  }
  else if ((v41 & 0x200) != 0)
  {
    goto LABEL_478;
  }
  if ((v40 & 0x400) != 0)
  {
    if ((v41 & 0x400) == 0 || self->_corryBarMaxArticleCountForSingleArticle != *((void *)v4 + 14)) {
      goto LABEL_478;
    }
  }
  else if ((v41 & 0x400) != 0)
  {
    goto LABEL_478;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
  {
    if ((v42 & 0x10) == 0) {
      goto LABEL_478;
    }
    if (self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers)
    {
      if (!v4[762]) {
        goto LABEL_478;
      }
    }
    else if (v4[762])
    {
      goto LABEL_478;
    }
  }
  else if ((v42 & 0x10) != 0)
  {
    goto LABEL_478;
  }
  externalAnalyticsConfigs = self->_externalAnalyticsConfigs;
  if ((unint64_t)externalAnalyticsConfigs | *((void *)v4 + 74)
    && !-[NSMutableArray isEqual:](externalAnalyticsConfigs, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationPortraitConfigResourceId = self->_personalizationPortraitConfigResourceId;
  if ((unint64_t)personalizationPortraitConfigResourceId | *((void *)v4 + 84))
  {
    if (!-[NSString isEqual:](personalizationPortraitConfigResourceId, "isEqual:")) {
      goto LABEL_478;
    }
  }
  uint64_t v45 = (uint64_t)self->_has;
  __int16 v46 = *((_WORD *)&self->_has + 4);
  uint64_t v47 = *(void *)(v4 + 772);
  if (v45 < 0)
  {
    if ((v47 & 0x8000000000000000) == 0 || self->_orderFeedEnabledLevelDeprecated != *((_DWORD *)v4 + 161)) {
      goto LABEL_478;
    }
  }
  else if (v47 < 0)
  {
    goto LABEL_478;
  }
  experimentalizableFieldPostfix = self->_experimentalizableFieldPostfix;
  if ((unint64_t)experimentalizableFieldPostfix | *((void *)v4 + 73))
  {
    if (!-[NSString isEqual:](experimentalizableFieldPostfix, "isEqual:")) {
      goto LABEL_478;
    }
    uint64_t v45 = (uint64_t)self->_has;
    __int16 v46 = *((_WORD *)&self->_has + 4);
  }
  uint64_t v49 = *(void *)(v4 + 772);
  if ((v45 & 0x20000000) != 0)
  {
    if ((v49 & 0x20000000) == 0
      || self->_minimumFollowCountToRemovePersonalizePlacardInFollowing != *((void *)v4 + 33))
    {
      goto LABEL_478;
    }
  }
  else if ((v49 & 0x20000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v46 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x1000) == 0) {
      goto LABEL_478;
    }
    if (self->_useSecureConnectionForAssets)
    {
      if (!v4[770]) {
        goto LABEL_478;
      }
    }
    else if (v4[770])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x1000) != 0)
  {
    goto LABEL_478;
  }
  if ((v46 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x800) == 0) {
      goto LABEL_478;
    }
    if (self->_usUkUseAuWhatsNewFeatures)
    {
      if (!v4[769]) {
        goto LABEL_478;
      }
    }
    else if (v4[769])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x800) != 0)
  {
    goto LABEL_478;
  }
  if ((v45 & 0x4000000000000000) != 0)
  {
    if ((v49 & 0x4000000000000000) == 0 || self->_orderFeedEnabledLevel != *((_DWORD *)v4 + 160)) {
      goto LABEL_478;
    }
  }
  else if ((v49 & 0x4000000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v45 & 0x200000000000) != 0)
  {
    if ((v49 & 0x200000000000) == 0 || self->_stateRestorationAllowedTimeWindow != *((void *)v4 + 49)) {
      goto LABEL_478;
    }
  }
  else if ((v49 & 0x200000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v45 & 0x40) != 0)
  {
    if ((v49 & 0x40) == 0 || self->_autoRefreshMinimumInterval != *((void *)v4 + 10)) {
      goto LABEL_478;
    }
  }
  else if ((v49 & 0x40) != 0)
  {
    goto LABEL_478;
  }
  if ((v46 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x200) == 0) {
      goto LABEL_478;
    }
    if (self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment)
    {
      if (!v4[767]) {
        goto LABEL_478;
      }
    }
    else if (v4[767])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x200) != 0)
  {
    goto LABEL_478;
  }
  if (!PBRepeatedInt64IsEqual()) {
    goto LABEL_478;
  }
  uint64_t v50 = (uint64_t)self->_has;
  __int16 v51 = *((_WORD *)&self->_has + 4);
  uint64_t v52 = *(void *)(v4 + 772);
  __int16 v53 = *((_WORD *)v4 + 390);
  if ((v51 & 8) != 0)
  {
    if ((v53 & 8) == 0) {
      goto LABEL_478;
    }
    if (self->_articleSearchEnabled)
    {
      if (!v4[761]) {
        goto LABEL_478;
      }
    }
    else if (v4[761])
    {
      goto LABEL_478;
    }
  }
  else if ((v53 & 8) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x400000) != 0)
  {
    if ((v52 & 0x400000) == 0 || self->_maximumRatioOfArticlesInForYouGroup != *((double *)v4 + 26)) {
      goto LABEL_478;
    }
  }
  else if ((v52 & 0x400000) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x40000000) != 0)
  {
    if ((v52 & 0x40000000) == 0 || self->_minimumTrendingUnseenRatio != *((double *)v4 + 34)) {
      goto LABEL_478;
    }
  }
  else if ((v52 & 0x40000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v51 & 2) != 0)
  {
    if ((v53 & 2) == 0 || self->_trendingStyle != *((_DWORD *)v4 + 183)) {
      goto LABEL_478;
    }
  }
  else if ((v53 & 2) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x2000000) != 0)
  {
    if ((v52 & 0x2000000) == 0 || self->_minimumDurationBetweenForYouGroupsWeekday != *((void *)v4 + 29)) {
      goto LABEL_478;
    }
  }
  else if ((v52 & 0x2000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x4000000) != 0)
  {
    if ((v52 & 0x4000000) == 0 || self->_minimumDurationBetweenForYouGroupsWeekend != *((void *)v4 + 30)) {
      goto LABEL_478;
    }
  }
  else if ((v52 & 0x4000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x8000000) != 0)
  {
    if ((v52 & 0x8000000) == 0 || self->_minimumDurationBetweenTrendingGroupsWeekday != *((void *)v4 + 31)) {
      goto LABEL_478;
    }
  }
  else if ((v52 & 0x8000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x10000000) != 0)
  {
    if ((v52 & 0x10000000) == 0 || self->_minimumDurationBetweenTrendingGroupsWeekend != *((void *)v4 + 32)) {
      goto LABEL_478;
    }
  }
  else if ((v52 & 0x10000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v51 & 0x40) != 0)
  {
    if ((v53 & 0x40) == 0) {
      goto LABEL_478;
    }
    if (self->_diversifyOptionalTopStories)
    {
      if (!v4[764]) {
        goto LABEL_478;
      }
    }
    else if (v4[764])
    {
      goto LABEL_478;
    }
  }
  else if ((v53 & 0x40) != 0)
  {
    goto LABEL_478;
  }
  forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  if ((unint64_t)forYouVideoGroupsConfig | *((void *)v4 + 77)
    && !-[NTPBVideoGroupsConfig isEqual:](forYouVideoGroupsConfig, "isEqual:"))
  {
    goto LABEL_478;
  }
  articleRecirculationConfig = self->_articleRecirculationConfig;
  if ((unint64_t)articleRecirculationConfig | *((void *)v4 + 68))
  {
    if (!-[NSString isEqual:](articleRecirculationConfig, "isEqual:")) {
      goto LABEL_478;
    }
  }
  uint64_t v56 = (uint64_t)self->_has;
  __int16 v57 = *((_WORD *)&self->_has + 4);
  uint64_t v58 = *(void *)(v4 + 772);
  __int16 v59 = *((_WORD *)v4 + 390);
  if ((v56 & 0x1000000000) != 0)
  {
    if ((v58 & 0x1000000000) == 0 || self->_optionalTopStoriesRefreshRate != *((void *)v4 + 40)) {
      goto LABEL_478;
    }
  }
  else if ((v58 & 0x1000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x2000) != 0)
  {
    if ((v58 & 0x2000) == 0 || self->_expirePinnedArticlesAfter != *((void *)v4 + 17)) {
      goto LABEL_478;
    }
  }
  else if ((v58 & 0x2000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x200000000000000) != 0)
  {
    if ((v58 & 0x200000000000000) == 0 || self->_userSegmentationApiModThreshold != *((void *)v4 + 61)) {
      goto LABEL_478;
    }
  }
  else if ((v58 & 0x200000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x100000000000000) != 0)
  {
    if ((v58 & 0x100000000000000) == 0 || self->_userSegmentationApiModMax != *((void *)v4 + 60)) {
      goto LABEL_478;
    }
  }
  else if ((v58 & 0x100000000000000) != 0)
  {
    goto LABEL_478;
  }
  if (v57)
  {
    if ((v59 & 1) == 0 || self->_privateDataMigrationCleanupLevel != *((_DWORD *)v4 + 182)) {
      goto LABEL_478;
    }
  }
  else if (v59)
  {
    goto LABEL_478;
  }
  articleRecirculationComponentPlacementConfig = self->_articleRecirculationComponentPlacementConfig;
  if ((unint64_t)articleRecirculationComponentPlacementConfig | *((void *)v4 + 67))
  {
    if (!-[NSString isEqual:](articleRecirculationComponentPlacementConfig, "isEqual:")) {
      goto LABEL_478;
    }
    uint64_t v56 = (uint64_t)self->_has;
    __int16 v57 = *((_WORD *)&self->_has + 4);
  }
  uint64_t v61 = *(void *)(v4 + 772);
  __int16 v62 = *((_WORD *)v4 + 390);
  if ((v56 & 0x1000000000000000) != 0)
  {
    if ((v61 & 0x1000000000000000) == 0 || self->_widgetEventImmediateUploadPopulationFloor != *((void *)v4 + 64)) {
      goto LABEL_478;
    }
  }
  else if ((v61 & 0x1000000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x800000000000000) != 0)
  {
    if ((v61 & 0x800000000000000) == 0 || self->_widgetEventImmediateUploadPopulationCeiling != *((void *)v4 + 63)) {
      goto LABEL_478;
    }
  }
  else if ((v61 & 0x800000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x400000000000000) != 0)
  {
    if ((v61 & 0x400000000000000) == 0 || self->_widgetEventImmediateUploadModuloForHashing != *((void *)v4 + 62)) {
      goto LABEL_478;
    }
  }
  else if ((v61 & 0x400000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x20) != 0)
  {
    if ((v61 & 0x20) == 0 || self->_articleRecirculationPopularFeedQueryTimeRange != *((void *)v4 + 9)) {
      goto LABEL_478;
    }
  }
  else if ((v61 & 0x20) != 0)
  {
    goto LABEL_478;
  }
  if ((v57 & 0x20) != 0)
  {
    if ((v62 & 0x20) != 0)
    {
      if (self->_disableThumbnailsForArticleRecirculation)
      {
        if (v4[763]) {
          goto LABEL_481;
        }
      }
      else if (!v4[763])
      {
        goto LABEL_481;
      }
    }
LABEL_478:
    char v63 = 0;
    goto LABEL_479;
  }
  if ((v62 & 0x20) != 0) {
    goto LABEL_478;
  }
LABEL_481:
  userSegmentationApiConfiguration = self->_userSegmentationApiConfiguration;
  if ((unint64_t)userSegmentationApiConfiguration | *((void *)v4 + 92)) {
    char v63 = -[NTPBUserSegmentationApiConfiguration isEqual:](userSegmentationApiConfiguration, "isEqual:");
  }
  else {
    char v63 = 1;
  }
LABEL_479:

  return v63;
}

- (unint64_t)hash
{
  NSUInteger v176 = [(NSString *)self->_fallbackLanguageTag hash];
  uint64_t v175 = [(NSMutableArray *)self->_languageConfigs hash];
  uint64_t has = (uint64_t)self->_has;
  __int16 v4 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000) != 0)
  {
    uint64_t v174 = 2654435761 * self->_shortReminderTime;
    if ((has & 0x20000) != 0)
    {
LABEL_3:
      uint64_t v173 = 2654435761 * self->_longReminderTime;
      if ((v4 & 0x80) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v172 = 0;
      if ((has & 0x100) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v9 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v174 = 0;
    if ((has & 0x20000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v173 = 0;
  if ((v4 & 0x80) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v172 = 2654435761 * self->_newsletterSubscriptionChecked;
  if ((has & 0x100) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double batchedFeedTimeout = self->_batchedFeedTimeout;
  double v6 = -batchedFeedTimeout;
  if (batchedFeedTimeout >= 0.0) {
    double v6 = self->_batchedFeedTimeout;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_15:
  if ((has & 0x10000) != 0)
  {
    double interstitialAdLoadDelay = self->_interstitialAdLoadDelay;
    double v12 = -interstitialAdLoadDelay;
    if (interstitialAdLoadDelay >= 0.0) {
      double v12 = self->_interstitialAdLoadDelay;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v170 = v10;
  if ((has & 0x2000000000) != 0)
  {
    double prerollLoadingTimeout = self->_prerollLoadingTimeout;
    double v17 = -prerollLoadingTimeout;
    if (prerollLoadingTimeout >= 0.0) {
      double v17 = self->_prerollLoadingTimeout;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  unint64_t v169 = v15;
  uint64_t v168 = [(NSMutableArray *)self->_endpointConfigs hash];
  unint64_t v167 = [(NTPBPersonalizationConfig *)self->_personalizationConfig hash];
  unint64_t v166 = [(NTPBIAdConfig *)self->_iadConfig hash];
  unint64_t v165 = [(NTPBPrefetchConfig *)self->_prefetchConfig hash];
  uint64_t v20 = (uint64_t)self->_has;
  if ((v20 & 0x8000000000000) != 0)
  {
    double tileProminenceScoreBalanceValue = self->_tileProminenceScoreBalanceValue;
    double v23 = -tileProminenceScoreBalanceValue;
    if (tileProminenceScoreBalanceValue >= 0.0) {
      double v23 = self->_tileProminenceScoreBalanceValue;
    }
    long double v24 = floor(v23 + 0.5);
    double v25 = (v23 - v24) * 1.84467441e19;
    unint64_t v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0) {
        v21 += (unint64_t)v25;
      }
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    unint64_t v21 = 0;
  }
  if ((v20 & 0x800000) != 0)
  {
    uint64_t v163 = 2654435761 * self->_minimumArticleUpdateInterval;
    if ((v20 & 0x8000) != 0)
    {
LABEL_41:
      uint64_t v162 = 2654435761 * self->_initialArticlesFromNewFavorite;
      if ((v20 & 0x80) != 0) {
        goto LABEL_42;
      }
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v163 = 0;
    if ((v20 & 0x8000) != 0) {
      goto LABEL_41;
    }
  }
  uint64_t v162 = 0;
  if ((v20 & 0x80) != 0)
  {
LABEL_42:
    uint64_t v161 = 2654435761 * self->_autoScrollToTopFeedTimeout;
    if ((v20 & 0x80000000000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v161 = 0;
  if ((v20 & 0x80000000000000) != 0)
  {
LABEL_43:
    uint64_t v160 = 2654435761 * self->_trendingTopicsRefreshRate;
    if ((v20 & 2) != 0) {
      goto LABEL_44;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v160 = 0;
  if ((v20 & 2) != 0)
  {
LABEL_44:
    uint64_t v159 = 2654435761 * self->_appConfigRefreshRate;
    if ((v20 & 0x1000000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v159 = 0;
  if ((v20 & 0x1000000) != 0)
  {
LABEL_45:
    uint64_t v158 = 2654435761 * self->_minimumDistanceBetweenImageOnTopTiles;
    if ((v20 & 0x20000000000000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v158 = 0;
  if ((v20 & 0x20000000000000) != 0)
  {
LABEL_46:
    uint64_t v157 = 2654435761 * self->_timeBetweenWidgetInsertions;
    if ((v20 & 0x10000000000000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v157 = 0;
  if ((v20 & 0x10000000000000) != 0)
  {
LABEL_47:
    uint64_t v156 = 2654435761 * self->_timeBetweenSameWidgetReinsertion;
    if ((v20 & 0x800000000) != 0) {
      goto LABEL_48;
    }
LABEL_58:
    uint64_t v155 = 0;
    if ((v20 & 0x10) != 0) {
      goto LABEL_49;
    }
    goto LABEL_59;
  }
LABEL_57:
  uint64_t v156 = 0;
  if ((v20 & 0x800000000) == 0) {
    goto LABEL_58;
  }
LABEL_48:
  uint64_t v155 = 2654435761 * self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit;
  if ((v20 & 0x10) != 0)
  {
LABEL_49:
    uint64_t v154 = 2654435761 * self->_articleRapidUpdatesTimeout;
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v154 = 0;
LABEL_60:
  unint64_t v164 = v21;
  if ((v20 & 0x400000000000) != 0) {
    uint64_t v153 = 2654435761 * self->_subscriptionsGlobalMeteredCount;
  }
  else {
    uint64_t v153 = 0;
  }
  NSUInteger v152 = [(NSString *)self->_anfEmbedConfigurationAsset hash];
  uint64_t v26 = (uint64_t)self->_has;
  if ((v26 & 0x2000000000000) != 0)
  {
    uint64_t v151 = 2654435761 * self->_subscriptionsPlacardPublisherFrequencyDays;
    if ((v26 & 0x1000000000000) != 0)
    {
LABEL_65:
      uint64_t v150 = 2654435761 * self->_subscriptionsPlacardGlobalMaxPerDay;
      if ((v26 & 0x800000000000) != 0) {
        goto LABEL_66;
      }
      goto LABEL_74;
    }
  }
  else
  {
    uint64_t v151 = 0;
    if ((v26 & 0x1000000000000) != 0) {
      goto LABEL_65;
    }
  }
  uint64_t v150 = 0;
  if ((v26 & 0x800000000000) != 0)
  {
LABEL_66:
    uint64_t v149 = 2654435761 * self->_subscriptionsGracePeriodForTokenVerificationSeconds;
    if ((v26 & 0x80000000) != 0) {
      goto LABEL_67;
    }
LABEL_75:
    uint64_t v148 = 0;
    if ((v26 & 0x1000) != 0) {
      goto LABEL_68;
    }
LABEL_76:
    unint64_t v31 = 0;
    goto LABEL_79;
  }
LABEL_74:
  uint64_t v149 = 0;
  if ((v26 & 0x80000000) == 0) {
    goto LABEL_75;
  }
LABEL_67:
  uint64_t v148 = 2654435761 * self->_newFavoriteNotificationAlertsFrequency;
  if ((v26 & 0x1000) == 0) {
    goto LABEL_76;
  }
LABEL_68:
  double endOfArticleMinPaidHeadlineRatio = self->_endOfArticleMinPaidHeadlineRatio;
  double v28 = -endOfArticleMinPaidHeadlineRatio;
  if (endOfArticleMinPaidHeadlineRatio >= 0.0) {
    double v28 = self->_endOfArticleMinPaidHeadlineRatio;
  }
  long double v29 = floor(v28 + 0.5);
  double v30 = (v28 - v29) * 1.84467441e19;
  unint64_t v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0) {
      v31 += (unint64_t)v30;
    }
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
LABEL_79:
  unint64_t v147 = v31;
  if ((v26 & 0x800) != 0) {
    uint64_t v146 = 2654435761 * self->_endOfArticleMaxInaccessiblePaidArticles;
  }
  else {
    uint64_t v146 = 0;
  }
  unint64_t v145 = [(NTPBWidgetConfig *)self->_widgetConfig hash];
  uint64_t v32 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x400) == 0)
  {
    uint64_t v144 = 0;
    if ((v32 & 0x100000000) != 0) {
      goto LABEL_84;
    }
LABEL_87:
    uint64_t v143 = 0;
    if ((v32 & 0x200000000) != 0) {
      goto LABEL_85;
    }
    goto LABEL_88;
  }
  uint64_t v144 = 2654435761 * self->_universalLinksEnabled;
  if ((v32 & 0x100000000) == 0) {
    goto LABEL_87;
  }
LABEL_84:
  uint64_t v143 = 2654435761 * self->_notificationArticleCacheTimeout;
  if ((v32 & 0x200000000) != 0)
  {
LABEL_85:
    uint64_t v142 = 2654435761 * self->_notificationArticleWithRapidUpdatesCacheTimeout;
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v142 = 0;
LABEL_89:
  NSUInteger v141 = [(NSString *)self->_forYouNonPersonalizedGroupsOrder hash];
  uint64_t v33 = (uint64_t)self->_has;
  if ((v33 & 0x400000000) != 0)
  {
    uint64_t v140 = 2654435761 * self->_notificationEnabledChannelsRefreshFrequency;
    if ((v33 & 0x40000000000) != 0)
    {
LABEL_91:
      uint64_t v139 = 2654435761 * self->_savedArticlesMaximumCountWifi;
      if ((v33 & 0x20000000000) != 0) {
        goto LABEL_92;
      }
      goto LABEL_97;
    }
  }
  else
  {
    uint64_t v140 = 0;
    if ((v33 & 0x40000000000) != 0) {
      goto LABEL_91;
    }
  }
  uint64_t v139 = 0;
  if ((v33 & 0x20000000000) != 0)
  {
LABEL_92:
    uint64_t v138 = 2654435761 * self->_savedArticlesMaximumCountCellular;
    if ((v33 & 0x10000000000) != 0) {
      goto LABEL_93;
    }
LABEL_98:
    uint64_t v137 = 0;
    if ((v33 & 0x80000000000) != 0) {
      goto LABEL_94;
    }
    goto LABEL_99;
  }
LABEL_97:
  uint64_t v138 = 0;
  if ((v33 & 0x10000000000) == 0) {
    goto LABEL_98;
  }
LABEL_93:
  uint64_t v137 = 2654435761 * self->_savedArticlesCutoffTime;
  if ((v33 & 0x80000000000) != 0)
  {
LABEL_94:
    uint64_t v136 = 2654435761 * self->_savedArticlesOpenedCutoffTime;
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v136 = 0;
LABEL_100:
  unint64_t v135 = [(NTPBWidgetConfig *)self->_alternativeButlerWidgetConfig hash];
  if ((*((_WORD *)&self->_has + 4) & 4) != 0) {
    uint64_t v134 = 2654435761 * self->_alternativeButlerWidgetConfigEnabled;
  }
  else {
    uint64_t v134 = 0;
  }
  unint64_t v133 = [(NTPBWidgetConfig *)self->_butlerWidgetConfig hash];
  unint64_t v132 = [(NTPBPaidSubscriptionConfig *)self->_paidSubscriptionConfig hash];
  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 8) != 0)
  {
    double articleDiversitySimilarityExpectationStart = self->_articleDiversitySimilarityExpectationStart;
    double v37 = -articleDiversitySimilarityExpectationStart;
    if (articleDiversitySimilarityExpectationStart >= 0.0) {
      double v37 = self->_articleDiversitySimilarityExpectationStart;
    }
    long double v38 = floor(v37 + 0.5);
    double v39 = (v37 - v38) * 1.84467441e19;
    unint64_t v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v35 += (unint64_t)v39;
      }
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  if ((v34 & 4) != 0)
  {
    double articleDiversitySimilarityExpectationEnd = self->_articleDiversitySimilarityExpectationEnd;
    double v42 = -articleDiversitySimilarityExpectationEnd;
    if (articleDiversitySimilarityExpectationEnd >= 0.0) {
      double v42 = self->_articleDiversitySimilarityExpectationEnd;
    }
    long double v43 = floor(v42 + 0.5);
    double v44 = (v42 - v43) * 1.84467441e19;
    unint64_t v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0) {
        v40 += (unint64_t)v44;
      }
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    unint64_t v40 = 0;
  }
  if ((v34 & 0x80000) != 0)
  {
    uint64_t v131 = 2654435761 * self->_maxPaidSubscriptionGroupSizeIPad;
    if ((v34 & 0x100000) != 0)
    {
LABEL_121:
      uint64_t v130 = 2654435761 * self->_maxPaidSubscriptionGroupSizeIPhone;
      if ((v34 & 0x200000) != 0) {
        goto LABEL_122;
      }
LABEL_129:
      uint64_t v129 = 0;
      if ((v34 & 0x4000000000) != 0) {
        goto LABEL_123;
      }
LABEL_130:
      unint64_t v49 = 0;
      goto LABEL_133;
    }
  }
  else
  {
    uint64_t v131 = 0;
    if ((v34 & 0x100000) != 0) {
      goto LABEL_121;
    }
  }
  uint64_t v130 = 0;
  if ((v34 & 0x200000) == 0) {
    goto LABEL_129;
  }
LABEL_122:
  uint64_t v129 = 2654435761 * self->_maxTimesHeadlineInPaidSubscriptionGroup;
  if ((v34 & 0x4000000000) == 0) {
    goto LABEL_130;
  }
LABEL_123:
  double publisherDiversitySlope = self->_publisherDiversitySlope;
  double v46 = -publisherDiversitySlope;
  if (publisherDiversitySlope >= 0.0) {
    double v46 = self->_publisherDiversitySlope;
  }
  long double v47 = floor(v46 + 0.5);
  double v48 = (v46 - v47) * 1.84467441e19;
  unint64_t v49 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
  if (v48 >= 0.0)
  {
    if (v48 > 0.0) {
      v49 += (unint64_t)v48;
    }
  }
  else
  {
    v49 -= (unint64_t)fabs(v48);
  }
LABEL_133:
  if ((v34 & 0x8000000000) != 0)
  {
    double publisherDiversityYIntercept = self->_publisherDiversityYIntercept;
    double v52 = -publisherDiversityYIntercept;
    if (publisherDiversityYIntercept >= 0.0) {
      double v52 = self->_publisherDiversityYIntercept;
    }
    long double v53 = floor(v52 + 0.5);
    double v54 = (v52 - v53) * 1.84467441e19;
    unint64_t v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0) {
        v50 += (unint64_t)v54;
      }
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    unint64_t v50 = 0;
  }
  if ((v34 & 0x4000) != 0) {
    uint64_t v127 = 2654435761 * self->_expiredPaidSubscriptionGroupCutoffTime;
  }
  else {
    uint64_t v127 = 0;
  }
  unint64_t v128 = v50;
  if ((v34 & 0x40000) != 0) {
    uint64_t v126 = 2654435761 * self->_maxExpiredPaidSubscriptionGroupCount;
  }
  else {
    uint64_t v126 = 0;
  }
  unint64_t v125 = [(NTPBWidgetConfig *)self->_widgetConfig2 hash];
  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x4000000000000) != 0)
  {
    uint64_t v124 = 2654435761 * self->_subscriptionsPlacardPublisherFrequencySeconds;
    if ((v55 & 0x40000000000000) != 0) {
      goto LABEL_149;
    }
  }
  else
  {
    uint64_t v124 = 0;
    if ((v55 & 0x40000000000000) != 0)
    {
LABEL_149:
      uint64_t v123 = 2654435761 * self->_treatmentId;
      goto LABEL_152;
    }
  }
  uint64_t v123 = 0;
LABEL_152:
  unint64_t v122 = [(NTPBBinningConfig *)self->_binningConfig hash];
  unint64_t v121 = [(NTPBPersonalizationTreatment *)self->_personalizationTreatment hash];
  if (*(void *)&self->_has)
  {
    uint64_t v120 = 2654435761 * self->_analyticsEndpointMaxPayloadSize;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0) {
      goto LABEL_154;
    }
  }
  else
  {
    uint64_t v120 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
    {
LABEL_154:
      uint64_t v119 = 2654435761 * self->_orderFeedEndpointEnabled;
      goto LABEL_157;
    }
  }
  uint64_t v119 = 0;
LABEL_157:
  NSUInteger v118 = [(NSString *)self->_personalizationBundleIdMappingResourceId hash];
  NSUInteger v117 = [(NSString *)self->_personalizationUrlMappingResourceId hash];
  NSUInteger v116 = [(NSString *)self->_personalizationWhitelistResourceId hash];
  if ((*(void *)&self->_has & 0x2000000000000000) != 0) {
    uint64_t v115 = 2654435761 * self->_enabledPrivateDataEncryptionLevel;
  }
  else {
    uint64_t v115 = 0;
  }
  NSUInteger v114 = [(NSString *)self->_personalizationPublisherFavorabilityScoresResourceId hash];
  NSUInteger v113 = [(NSString *)self->_personalizationWidgetSectionMappingResourceId hash];
  __int16 v56 = *((_WORD *)&self->_has + 4);
  uint64_t v57 = (uint64_t)self->_has;
  if ((v57 & 0x200) == 0)
  {
    uint64_t v112 = 0;
    if ((v57 & 0x400) != 0) {
      goto LABEL_162;
    }
LABEL_165:
    uint64_t v111 = 0;
    if ((v56 & 0x10) != 0) {
      goto LABEL_163;
    }
    goto LABEL_166;
  }
  uint64_t v112 = 2654435761 * self->_corryBarMaxArticleCountForArticleList;
  if ((v57 & 0x400) == 0) {
    goto LABEL_165;
  }
LABEL_162:
  uint64_t v111 = 2654435761 * self->_corryBarMaxArticleCountForSingleArticle;
  if ((v56 & 0x10) != 0)
  {
LABEL_163:
    uint64_t v110 = 2654435761 * self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
    goto LABEL_167;
  }
LABEL_166:
  uint64_t v110 = 0;
LABEL_167:
  uint64_t v109 = [(NSMutableArray *)self->_externalAnalyticsConfigs hash];
  NSUInteger v108 = [(NSString *)self->_personalizationPortraitConfigResourceId hash];
  if ((*(void *)&self->_has & 0x8000000000000000) != 0) {
    uint64_t v107 = 2654435761 * self->_orderFeedEnabledLevelDeprecated;
  }
  else {
    uint64_t v107 = 0;
  }
  NSUInteger v106 = [(NSString *)self->_experimentalizableFieldPostfix hash];
  uint64_t v58 = (uint64_t)self->_has;
  if ((v58 & 0x20000000) != 0)
  {
    uint64_t v105 = 2654435761 * self->_minimumFollowCountToRemovePersonalizePlacardInFollowing;
    if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
    {
LABEL_172:
      uint64_t v104 = 2654435761 * self->_useSecureConnectionForAssets;
      if ((*((_WORD *)&self->_has + 4) & 0x800) != 0) {
        goto LABEL_173;
      }
      goto LABEL_179;
    }
  }
  else
  {
    uint64_t v105 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0) {
      goto LABEL_172;
    }
  }
  uint64_t v104 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
  {
LABEL_173:
    uint64_t v103 = 2654435761 * self->_usUkUseAuWhatsNewFeatures;
    if ((v58 & 0x4000000000000000) != 0) {
      goto LABEL_174;
    }
    goto LABEL_180;
  }
LABEL_179:
  uint64_t v103 = 0;
  if ((v58 & 0x4000000000000000) != 0)
  {
LABEL_174:
    uint64_t v102 = 2654435761 * self->_orderFeedEnabledLevel;
    if ((v58 & 0x200000000000) != 0) {
      goto LABEL_175;
    }
LABEL_181:
    uint64_t v101 = 0;
    if ((v58 & 0x40) != 0) {
      goto LABEL_176;
    }
    goto LABEL_182;
  }
LABEL_180:
  uint64_t v102 = 0;
  if ((v58 & 0x200000000000) == 0) {
    goto LABEL_181;
  }
LABEL_175:
  uint64_t v101 = 2654435761 * self->_stateRestorationAllowedTimeWindow;
  if ((v58 & 0x40) != 0)
  {
LABEL_176:
    uint64_t v100 = 2654435761 * self->_autoRefreshMinimumInterval;
    goto LABEL_183;
  }
LABEL_182:
  uint64_t v100 = 0;
LABEL_183:
  unint64_t v171 = v9;
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0) {
    uint64_t v99 = 2654435761 * self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
  }
  else {
    uint64_t v99 = 0;
  }
  uint64_t v98 = PBRepeatedInt64Hash();
  uint64_t v59 = (uint64_t)self->_has;
  __int16 v60 = *((_WORD *)&self->_has + 4);
  if ((v60 & 8) != 0)
  {
    uint64_t v97 = 2654435761 * self->_articleSearchEnabled;
    if ((v59 & 0x400000) != 0) {
      goto LABEL_188;
    }
LABEL_193:
    unint64_t v65 = 0;
    goto LABEL_196;
  }
  uint64_t v97 = 0;
  if ((v59 & 0x400000) == 0) {
    goto LABEL_193;
  }
LABEL_188:
  double maximumRatioOfArticlesInForYouGroup = self->_maximumRatioOfArticlesInForYouGroup;
  double v62 = -maximumRatioOfArticlesInForYouGroup;
  if (maximumRatioOfArticlesInForYouGroup >= 0.0) {
    double v62 = self->_maximumRatioOfArticlesInForYouGroup;
  }
  long double v63 = floor(v62 + 0.5);
  double v64 = (v62 - v63) * 1.84467441e19;
  unint64_t v65 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
  if (v64 >= 0.0)
  {
    if (v64 > 0.0) {
      v65 += (unint64_t)v64;
    }
  }
  else
  {
    v65 -= (unint64_t)fabs(v64);
  }
LABEL_196:
  if ((v59 & 0x40000000) != 0)
  {
    double minimumTrendingUnseenRatio = self->_minimumTrendingUnseenRatio;
    double v68 = -minimumTrendingUnseenRatio;
    if (minimumTrendingUnseenRatio >= 0.0) {
      double v68 = self->_minimumTrendingUnseenRatio;
    }
    long double v69 = floor(v68 + 0.5);
    double v70 = (v68 - v69) * 1.84467441e19;
    unint64_t v66 = 2654435761u * (unint64_t)fmod(v69, 1.84467441e19);
    if (v70 >= 0.0)
    {
      if (v70 > 0.0) {
        v66 += (unint64_t)v70;
      }
    }
    else
    {
      v66 -= (unint64_t)fabs(v70);
    }
  }
  else
  {
    unint64_t v66 = 0;
  }
  if ((v60 & 2) != 0)
  {
    uint64_t v95 = 2654435761 * self->_trendingStyle;
    if ((v59 & 0x2000000) != 0)
    {
LABEL_206:
      uint64_t v94 = 2654435761 * self->_minimumDurationBetweenForYouGroupsWeekday;
      if ((v59 & 0x4000000) != 0) {
        goto LABEL_207;
      }
      goto LABEL_212;
    }
  }
  else
  {
    uint64_t v95 = 0;
    if ((v59 & 0x2000000) != 0) {
      goto LABEL_206;
    }
  }
  uint64_t v94 = 0;
  if ((v59 & 0x4000000) != 0)
  {
LABEL_207:
    uint64_t v93 = 2654435761 * self->_minimumDurationBetweenForYouGroupsWeekend;
    if ((v59 & 0x8000000) != 0) {
      goto LABEL_208;
    }
LABEL_213:
    uint64_t v92 = 0;
    if ((v59 & 0x10000000) != 0) {
      goto LABEL_209;
    }
    goto LABEL_214;
  }
LABEL_212:
  uint64_t v93 = 0;
  if ((v59 & 0x8000000) == 0) {
    goto LABEL_213;
  }
LABEL_208:
  uint64_t v92 = 2654435761 * self->_minimumDurationBetweenTrendingGroupsWeekday;
  if ((v59 & 0x10000000) != 0)
  {
LABEL_209:
    uint64_t v91 = 2654435761 * self->_minimumDurationBetweenTrendingGroupsWeekend;
    goto LABEL_215;
  }
LABEL_214:
  uint64_t v91 = 0;
LABEL_215:
  unint64_t v96 = v66;
  if ((v60 & 0x40) != 0) {
    uint64_t v90 = 2654435761 * self->_diversifyOptionalTopStories;
  }
  else {
    uint64_t v90 = 0;
  }
  unint64_t v89 = [(NTPBVideoGroupsConfig *)self->_forYouVideoGroupsConfig hash];
  NSUInteger v88 = [(NSString *)self->_articleRecirculationConfig hash];
  uint64_t v71 = (uint64_t)self->_has;
  if ((v71 & 0x1000000000) != 0)
  {
    uint64_t v87 = 2654435761 * self->_optionalTopStoriesRefreshRate;
    if ((v71 & 0x2000) != 0) {
      goto LABEL_220;
    }
  }
  else
  {
    uint64_t v87 = 0;
    if ((v71 & 0x2000) != 0)
    {
LABEL_220:
      uint64_t v85 = 2654435761 * self->_expirePinnedArticlesAfter;
      goto LABEL_223;
    }
  }
  uint64_t v85 = 0;
LABEL_223:
  __int16 v72 = *((_WORD *)&self->_has + 4);
  if ((v71 & 0x200000000000000) == 0)
  {
    uint64_t v73 = 0;
    if ((v71 & 0x100000000000000) != 0) {
      goto LABEL_225;
    }
LABEL_228:
    uint64_t v74 = 0;
    if (v72) {
      goto LABEL_226;
    }
    goto LABEL_229;
  }
  uint64_t v73 = 2654435761 * self->_userSegmentationApiModThreshold;
  if ((v71 & 0x100000000000000) == 0) {
    goto LABEL_228;
  }
LABEL_225:
  uint64_t v74 = 2654435761 * self->_userSegmentationApiModMax;
  if (v72)
  {
LABEL_226:
    uint64_t v75 = 2654435761 * self->_privateDataMigrationCleanupLevel;
    goto LABEL_230;
  }
LABEL_229:
  uint64_t v75 = 0;
LABEL_230:
  NSUInteger v76 = [(NSString *)self->_articleRecirculationComponentPlacementConfig hash];
  uint64_t v77 = (uint64_t)self->_has;
  if ((v77 & 0x1000000000000000) != 0)
  {
    uint64_t v78 = 2654435761 * self->_widgetEventImmediateUploadPopulationFloor;
    if ((v77 & 0x800000000000000) != 0) {
      goto LABEL_232;
    }
  }
  else
  {
    uint64_t v78 = 0;
    if ((v77 & 0x800000000000000) != 0)
    {
LABEL_232:
      uint64_t v79 = 2654435761 * self->_widgetEventImmediateUploadPopulationCeiling;
      goto LABEL_235;
    }
  }
  uint64_t v79 = 0;
LABEL_235:
  __int16 v80 = *((_WORD *)&self->_has + 4);
  if ((v77 & 0x400000000000000) == 0)
  {
    uint64_t v81 = 0;
    if ((v77 & 0x20) != 0) {
      goto LABEL_237;
    }
LABEL_240:
    uint64_t v82 = 0;
    if ((v80 & 0x20) != 0) {
      goto LABEL_238;
    }
LABEL_241:
    uint64_t v83 = 0;
    return v175 ^ v176 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v35 ^ v40 ^ v131 ^ v130 ^ v129 ^ v49 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v65 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v73 ^ v74 ^ v75 ^ v76 ^ v78 ^ v79 ^ v81 ^ v82 ^ v83 ^ [(NTPBUserSegmentationApiConfiguration *)self->_userSegmentationApiConfiguration hash];
  }
  uint64_t v81 = 2654435761 * self->_widgetEventImmediateUploadModuloForHashing;
  if ((v77 & 0x20) == 0) {
    goto LABEL_240;
  }
LABEL_237:
  uint64_t v82 = 2654435761 * self->_articleRecirculationPopularFeedQueryTimeRange;
  if ((v80 & 0x20) == 0) {
    goto LABEL_241;
  }
LABEL_238:
  uint64_t v83 = 2654435761 * self->_disableThumbnailsForArticleRecirculation;
  return v175 ^ v176 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v35 ^ v40 ^ v131 ^ v130 ^ v129 ^ v49 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v65 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v73 ^ v74 ^ v75 ^ v76 ^ v78 ^ v79 ^ v81 ^ v82 ^ v83 ^ [(NTPBUserSegmentationApiConfiguration *)self->_userSegmentationApiConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  __int16 v4 = (char *)a3;
  if (*((void *)v4 + 75)) {
    -[NTPBConfig setFallbackLanguageTag:](self, "setFallbackLanguageTag:");
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v5 = *((id *)v4 + 79);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v78 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBConfig *)self addLanguageConfigs:*(void *)(*((void *)&v77 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v77 objects:v83 count:16];
    }
    while (v7);
  }

  uint64_t v10 = *(void *)(v4 + 772);
  if ((v10 & 0x100000000000) != 0)
  {
    self->_shortReminderTime = *((void *)v4 + 48);
    *(void *)&self->_has |= 0x100000000000uLL;
    uint64_t v10 = *(void *)(v4 + 772);
  }
  if ((v10 & 0x20000) != 0)
  {
    self->_longReminderTime = *((void *)v4 + 21);
    *(void *)&self->_has |= 0x20000uLL;
    uint64_t v10 = *(void *)(v4 + 772);
    if ((*((_WORD *)v4 + 390) & 0x80) == 0)
    {
LABEL_14:
      if ((v10 & 0x100) == 0) {
        goto LABEL_15;
      }
      goto LABEL_30;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x80) == 0)
  {
    goto LABEL_14;
  }
  self->_newsletterSubscriptionChecked = v4[765];
  *((_WORD *)&self->_has + 4) |= 0x80u;
  uint64_t v10 = *(void *)(v4 + 772);
  if ((v10 & 0x100) == 0)
  {
LABEL_15:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double batchedFeedTimeout = *((double *)v4 + 12);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v10 = *(void *)(v4 + 772);
  if ((v10 & 0x10000) == 0)
  {
LABEL_16:
    if ((v10 & 0x2000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_31:
  self->_double interstitialAdLoadDelay = *((double *)v4 + 20);
  *(void *)&self->_has |= 0x10000uLL;
  if ((*(void *)(v4 + 772) & 0x2000000000) != 0)
  {
LABEL_17:
    self->_double prerollLoadingTimeout = *((double *)v4 + 41);
    *(void *)&self->_has |= 0x2000000000uLL;
  }
LABEL_18:
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v11 = *((id *)v4 + 72);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v74 != v14) {
          objc_enumerationMutation(v11);
        }
        [(NTPBConfig *)self addEndpointConfigs:*(void *)(*((void *)&v73 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v13);
  }

  personalizationConfig = self->_personalizationConfig;
  uint64_t v17 = *((void *)v4 + 83);
  if (personalizationConfig)
  {
    if (v17) {
      -[NTPBPersonalizationConfig mergeFrom:](personalizationConfig, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[NTPBConfig setPersonalizationConfig:](self, "setPersonalizationConfig:");
  }
  iadConfig = self->_iadConfig;
  uint64_t v19 = *((void *)v4 + 78);
  if (iadConfig)
  {
    if (v19) {
      -[NTPBIAdConfig mergeFrom:](iadConfig, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[NTPBConfig setIadConfig:](self, "setIadConfig:");
  }
  prefetchConfig = self->_prefetchConfig;
  uint64_t v21 = *((void *)v4 + 90);
  if (prefetchConfig)
  {
    if (v21) {
      -[NTPBPrefetchConfig mergeFrom:](prefetchConfig, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[NTPBConfig setPrefetchConfig:](self, "setPrefetchConfig:");
  }
  uint64_t v22 = (uint64_t *)(v4 + 772);
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 0x8000000000000) != 0)
  {
    self->_double tileProminenceScoreBalanceValue = *((double *)v4 + 55);
    *(void *)&self->_has |= 0x8000000000000uLL;
    uint64_t v23 = *v22;
    if ((*v22 & 0x800000) == 0)
    {
LABEL_47:
      if ((v23 & 0x8000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_72;
    }
  }
  else if ((v23 & 0x800000) == 0)
  {
    goto LABEL_47;
  }
  self->_minimumArticleUpdateInterval = *((void *)v4 + 27);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 0x8000) == 0)
  {
LABEL_48:
    if ((v23 & 0x80) == 0) {
      goto LABEL_49;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_initialArticlesFromNewFavorite = *((void *)v4 + 19);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 0x80) == 0)
  {
LABEL_49:
    if ((v23 & 0x80000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_autoScrollToTopFeedTimeout = *((void *)v4 + 11);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 0x80000000000000) == 0)
  {
LABEL_50:
    if ((v23 & 2) == 0) {
      goto LABEL_51;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_trendingTopicsRefreshRate = *((void *)v4 + 59);
  *(void *)&self->_has |= 0x80000000000000uLL;
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 2) == 0)
  {
LABEL_51:
    if ((v23 & 0x1000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_appConfigRefreshRate = *((void *)v4 + 5);
  *(void *)&self->_has |= 2uLL;
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 0x1000000) == 0)
  {
LABEL_52:
    if ((v23 & 0x20000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_minimumDistanceBetweenImageOnTopTiles = *((void *)v4 + 28);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 0x20000000000000) == 0)
  {
LABEL_53:
    if ((v23 & 0x10000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_timeBetweenWidgetInsertions = *((void *)v4 + 57);
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 0x10000000000000) == 0)
  {
LABEL_54:
    if ((v23 & 0x800000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_timeBetweenSameWidgetReinsertion = *((void *)v4 + 56);
  *(void *)&self->_has |= 0x10000000000000uLL;
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 0x800000000) == 0)
  {
LABEL_55:
    if ((v23 & 0x10) == 0) {
      goto LABEL_56;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit = *((void *)v4 + 39);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v23 = *(void *)(v4 + 772);
  if ((v23 & 0x10) == 0)
  {
LABEL_56:
    if ((v23 & 0x400000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_80:
  self->_articleRapidUpdatesTimeout = *((void *)v4 + 8);
  *(void *)&self->_has |= 0x10uLL;
  if ((*(void *)(v4 + 772) & 0x400000000000) != 0)
  {
LABEL_57:
    self->_subscriptionsGlobalMeteredCount = *((void *)v4 + 50);
    *(void *)&self->_has |= 0x400000000000uLL;
  }
LABEL_58:
  if (*((void *)v4 + 66)) {
    -[NTPBConfig setAnfEmbedConfigurationAsset:](self, "setAnfEmbedConfigurationAsset:");
  }
  long double v24 = (uint64_t *)(v4 + 772);
  uint64_t v25 = *(void *)(v4 + 772);
  if ((v25 & 0x2000000000000) != 0)
  {
    self->_subscriptionsPlacardPublisherFrequencyDays = *((void *)v4 + 53);
    *(void *)&self->_has |= 0x2000000000000uLL;
    uint64_t v25 = *v24;
    if ((*v24 & 0x1000000000000) == 0)
    {
LABEL_62:
      if ((v25 & 0x800000000000) == 0) {
        goto LABEL_63;
      }
      goto LABEL_84;
    }
  }
  else if ((v25 & 0x1000000000000) == 0)
  {
    goto LABEL_62;
  }
  self->_subscriptionsPlacardGlobalMaxPerDay = *((void *)v4 + 52);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v25 = *(void *)(v4 + 772);
  if ((v25 & 0x800000000000) == 0)
  {
LABEL_63:
    if ((v25 & 0x80000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_subscriptionsGracePeriodForTokenVerificationSeconds = *((void *)v4 + 51);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v25 = *(void *)(v4 + 772);
  if ((v25 & 0x80000000) == 0)
  {
LABEL_64:
    if ((v25 & 0x1000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_newFavoriteNotificationAlertsFrequency = *((void *)v4 + 35);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v25 = *(void *)(v4 + 772);
  if ((v25 & 0x1000) == 0)
  {
LABEL_65:
    if ((v25 & 0x800) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_86:
  self->_double endOfArticleMinPaidHeadlineRatio = *((double *)v4 + 16);
  *(void *)&self->_has |= 0x1000uLL;
  if ((*(void *)(v4 + 772) & 0x800) != 0)
  {
LABEL_66:
    self->_endOfArticleMaxInaccessiblePaidArticles = *((void *)v4 + 15);
    *(void *)&self->_has |= 0x800uLL;
  }
LABEL_67:
  widgetConfig = self->_widgetConfig;
  uint64_t v27 = *((void *)v4 + 93);
  if (widgetConfig)
  {
    if (v27) {
      -[NTPBWidgetConfig mergeFrom:](widgetConfig, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[NTPBConfig setWidgetConfig:](self, "setWidgetConfig:");
  }
  if ((*((_WORD *)v4 + 390) & 0x400) != 0)
  {
    self->_universalLinksEnabled = v4[768];
    *((_WORD *)&self->_has + 4) |= 0x400u;
  }
  uint64_t v28 = *(void *)(v4 + 772);
  if ((v28 & 0x100000000) != 0)
  {
    self->_notificationArticleCacheTimeout = *((void *)v4 + 36);
    *(void *)&self->_has |= 0x100000000uLL;
    uint64_t v28 = *(void *)(v4 + 772);
  }
  if ((v28 & 0x200000000) != 0)
  {
    self->_notificationArticleWithRapidUpdatesCacheTimeout = *((void *)v4 + 37);
    *(void *)&self->_has |= 0x200000000uLL;
  }
  if (*((void *)v4 + 76)) {
    -[NTPBConfig setForYouNonPersonalizedGroupsOrder:](self, "setForYouNonPersonalizedGroupsOrder:");
  }
  long double v29 = (uint64_t *)(v4 + 772);
  uint64_t v30 = *(void *)(v4 + 772);
  if ((v30 & 0x400000000) != 0)
  {
    self->_notificationEnabledChannelsRefreshFrequency = *((void *)v4 + 38);
    *(void *)&self->_has |= 0x400000000uLL;
    uint64_t v30 = *v29;
    if ((*v29 & 0x40000000000) == 0)
    {
LABEL_100:
      if ((v30 & 0x20000000000) == 0) {
        goto LABEL_101;
      }
      goto LABEL_109;
    }
  }
  else if ((v30 & 0x40000000000) == 0)
  {
    goto LABEL_100;
  }
  self->_savedArticlesMaximumCountWifuint64_t i = *((void *)v4 + 46);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v30 = *(void *)(v4 + 772);
  if ((v30 & 0x20000000000) == 0)
  {
LABEL_101:
    if ((v30 & 0x10000000000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_savedArticlesMaximumCountCellular = *((void *)v4 + 45);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v30 = *(void *)(v4 + 772);
  if ((v30 & 0x10000000000) == 0)
  {
LABEL_102:
    if ((v30 & 0x80000000000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_103;
  }
LABEL_110:
  self->_savedArticlesCutoffTime = *((void *)v4 + 44);
  *(void *)&self->_has |= 0x10000000000uLL;
  if ((*(void *)(v4 + 772) & 0x80000000000) != 0)
  {
LABEL_103:
    self->_savedArticlesOpenedCutoffTime = *((void *)v4 + 47);
    *(void *)&self->_has |= 0x80000000000uLL;
  }
LABEL_104:
  alternativeButlerWidgetConfig = self->_alternativeButlerWidgetConfig;
  uint64_t v32 = *((void *)v4 + 65);
  if (alternativeButlerWidgetConfig)
  {
    if (v32) {
      -[NTPBWidgetConfig mergeFrom:](alternativeButlerWidgetConfig, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[NTPBConfig setAlternativeButlerWidgetConfig:](self, "setAlternativeButlerWidgetConfig:");
  }
  if ((*((_WORD *)v4 + 390) & 4) != 0)
  {
    self->_alternativeButlerWidgetConfigEnabled = v4[760];
    *((_WORD *)&self->_has + 4) |= 4u;
  }
  butlerWidgetConfig = self->_butlerWidgetConfig;
  uint64_t v34 = *((void *)v4 + 70);
  if (butlerWidgetConfig)
  {
    if (v34) {
      -[NTPBWidgetConfig mergeFrom:](butlerWidgetConfig, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[NTPBConfig setButlerWidgetConfig:](self, "setButlerWidgetConfig:");
  }
  paidSubscriptionConfig = self->_paidSubscriptionConfig;
  uint64_t v36 = *((void *)v4 + 81);
  if (paidSubscriptionConfig)
  {
    if (v36) {
      -[NTPBPaidSubscriptionConfig mergeFrom:](paidSubscriptionConfig, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[NTPBConfig setPaidSubscriptionConfig:](self, "setPaidSubscriptionConfig:");
  }
  double v37 = (uint64_t *)(v4 + 772);
  uint64_t v38 = *(void *)(v4 + 772);
  if ((v38 & 8) != 0)
  {
    self->_double articleDiversitySimilarityExpectationStart = *((double *)v4 + 7);
    *(void *)&self->_has |= 8uLL;
    uint64_t v38 = *v37;
    if ((*v37 & 4) == 0)
    {
LABEL_128:
      if ((v38 & 0x80000) == 0) {
        goto LABEL_129;
      }
      goto LABEL_141;
    }
  }
  else if ((v38 & 4) == 0)
  {
    goto LABEL_128;
  }
  self->_double articleDiversitySimilarityExpectationEnd = *((double *)v4 + 6);
  *(void *)&self->_has |= 4uLL;
  uint64_t v38 = *(void *)(v4 + 772);
  if ((v38 & 0x80000) == 0)
  {
LABEL_129:
    if ((v38 & 0x100000) == 0) {
      goto LABEL_130;
    }
    goto LABEL_142;
  }
LABEL_141:
  self->_maxPaidSubscriptionGroupSizeIPad = *((void *)v4 + 23);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v38 = *(void *)(v4 + 772);
  if ((v38 & 0x100000) == 0)
  {
LABEL_130:
    if ((v38 & 0x200000) == 0) {
      goto LABEL_131;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_maxPaidSubscriptionGroupSizeIPhone = *((void *)v4 + 24);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v38 = *(void *)(v4 + 772);
  if ((v38 & 0x200000) == 0)
  {
LABEL_131:
    if ((v38 & 0x4000000000) == 0) {
      goto LABEL_132;
    }
    goto LABEL_144;
  }
LABEL_143:
  self->_maxTimesHeadlineInPaidSubscriptionGroup = *((void *)v4 + 25);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v38 = *(void *)(v4 + 772);
  if ((v38 & 0x4000000000) == 0)
  {
LABEL_132:
    if ((v38 & 0x8000000000) == 0) {
      goto LABEL_133;
    }
    goto LABEL_145;
  }
LABEL_144:
  self->_double publisherDiversitySlope = *((double *)v4 + 42);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v38 = *(void *)(v4 + 772);
  if ((v38 & 0x8000000000) == 0)
  {
LABEL_133:
    if ((v38 & 0x4000) == 0) {
      goto LABEL_134;
    }
    goto LABEL_146;
  }
LABEL_145:
  self->_double publisherDiversityYIntercept = *((double *)v4 + 43);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v38 = *(void *)(v4 + 772);
  if ((v38 & 0x4000) == 0)
  {
LABEL_134:
    if ((v38 & 0x40000) == 0) {
      goto LABEL_136;
    }
    goto LABEL_135;
  }
LABEL_146:
  self->_expiredPaidSubscriptionGroupCutoffTime = *((void *)v4 + 18);
  *(void *)&self->_has |= 0x4000uLL;
  if ((*(void *)(v4 + 772) & 0x40000) != 0)
  {
LABEL_135:
    self->_maxExpiredPaidSubscriptionGroupCount = *((void *)v4 + 22);
    *(void *)&self->_has |= 0x40000uLL;
  }
LABEL_136:
  widgetConfig2 = self->_widgetConfig2;
  uint64_t v40 = *((void *)v4 + 94);
  if (widgetConfig2)
  {
    if (v40) {
      -[NTPBWidgetConfig mergeFrom:](widgetConfig2, "mergeFrom:");
    }
  }
  else if (v40)
  {
    -[NTPBConfig setWidgetConfig2:](self, "setWidgetConfig2:");
  }
  uint64_t v41 = *(void *)(v4 + 772);
  if ((v41 & 0x4000000000000) != 0)
  {
    self->_subscriptionsPlacardPublisherFrequencySeconds = *((void *)v4 + 54);
    *(void *)&self->_has |= 0x4000000000000uLL;
    uint64_t v41 = *(void *)(v4 + 772);
  }
  if ((v41 & 0x40000000000000) != 0)
  {
    self->_treatmentId = *((void *)v4 + 58);
    *(void *)&self->_has |= 0x40000000000000uLL;
  }
  binningConfig = self->_binningConfig;
  uint64_t v43 = *((void *)v4 + 69);
  if (binningConfig)
  {
    if (v43) {
      -[NTPBBinningConfig mergeFrom:](binningConfig, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[NTPBConfig setBinningConfig:](self, "setBinningConfig:");
  }
  personalizationTreatment = self->_personalizationTreatment;
  uint64_t v45 = *((void *)v4 + 86);
  if (personalizationTreatment)
  {
    if (v45) {
      -[NTPBPersonalizationTreatment mergeFrom:](personalizationTreatment, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[NTPBConfig setPersonalizationTreatment:](self, "setPersonalizationTreatment:");
  }
  if (*(void *)(v4 + 772))
  {
    self->_analyticsEndpointMaxPayloadSize = *((void *)v4 + 4);
    *(void *)&self->_has |= 1uLL;
  }
  if ((*((_WORD *)v4 + 390) & 0x100) != 0)
  {
    self->_orderFeedEndpointEnabled = v4[766];
    *((_WORD *)&self->_has + 4) |= 0x100u;
  }
  if (*((void *)v4 + 82)) {
    -[NTPBConfig setPersonalizationBundleIdMappingResourceId:](self, "setPersonalizationBundleIdMappingResourceId:");
  }
  if (*((void *)v4 + 87)) {
    -[NTPBConfig setPersonalizationUrlMappingResourceId:](self, "setPersonalizationUrlMappingResourceId:");
  }
  if (*((void *)v4 + 88)) {
    -[NTPBConfig setPersonalizationWhitelistResourceId:](self, "setPersonalizationWhitelistResourceId:");
  }
  if ((*(void *)(v4 + 772) & 0x2000000000000000) != 0)
  {
    self->_enabledPrivateDataEncryptionLevel = *((_DWORD *)v4 + 142);
    *(void *)&self->_has |= 0x2000000000000000uLL;
  }
  if (*((void *)v4 + 85)) {
    -[NTPBConfig setPersonalizationPublisherFavorabilityScoresResourceId:](self, "setPersonalizationPublisherFavorabilityScoresResourceId:");
  }
  if (*((void *)v4 + 89)) {
    -[NTPBConfig setPersonalizationWidgetSectionMappingResourceId:](self, "setPersonalizationWidgetSectionMappingResourceId:");
  }
  uint64_t v46 = *(void *)(v4 + 772);
  if ((v46 & 0x200) != 0)
  {
    self->_corryBarMaxArticleCountForArticleList = *((void *)v4 + 13);
    *(void *)&self->_has |= 0x200uLL;
    uint64_t v46 = *(void *)(v4 + 772);
  }
  __int16 v47 = *((_WORD *)v4 + 390);
  if ((v46 & 0x400) != 0)
  {
    self->_corryBarMaxArticleCountForSingleArticle = *((void *)v4 + 14);
    *(void *)&self->_has |= 0x400uLL;
    __int16 v47 = *((_WORD *)v4 + 390);
  }
  if ((v47 & 0x10) != 0)
  {
    self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers = v4[762];
    *((_WORD *)&self->_has + 4) |= 0x10u;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v48 = *((id *)v4 + 74);
  uint64_t v49 = [v48 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v70 != v51) {
          objc_enumerationMutation(v48);
        }
        -[NTPBConfig addExternalAnalyticsConfig:](self, "addExternalAnalyticsConfig:", *(void *)(*((void *)&v69 + 1) + 8 * k), (void)v69);
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v69 objects:v81 count:16];
    }
    while (v50);
  }

  if (*((void *)v4 + 84)) {
    -[NTPBConfig setPersonalizationPortraitConfigResourceId:](self, "setPersonalizationPortraitConfigResourceId:");
  }
  if ((*(void *)(v4 + 772) & 0x8000000000000000) != 0)
  {
    self->_orderFeedEnabledLevelDeprecated = *((_DWORD *)v4 + 161);
    *(void *)&self->_has |= 0x8000000000000000;
  }
  if (*((void *)v4 + 73)) {
    -[NTPBConfig setExperimentalizableFieldPostfix:](self, "setExperimentalizableFieldPostfix:");
  }
  uint64_t v53 = *(void *)(v4 + 772);
  if ((v53 & 0x20000000) != 0)
  {
    self->_minimumFollowCountToRemovePersonalizePlacardInFollowing = *((void *)v4 + 33);
    *(void *)&self->_has |= 0x20000000uLL;
    uint64_t v53 = *(void *)(v4 + 772);
  }
  __int16 v54 = *((_WORD *)v4 + 390);
  if ((v54 & 0x1000) != 0)
  {
    self->_useSecureConnectionForAssets = v4[770];
    *((_WORD *)&self->_has + 4) |= 0x1000u;
    uint64_t v53 = *(void *)(v4 + 772);
    __int16 v54 = *((_WORD *)v4 + 390);
    if ((v54 & 0x800) == 0)
    {
LABEL_203:
      if ((v53 & 0x4000000000000000) == 0) {
        goto LABEL_204;
      }
      goto LABEL_216;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x800) == 0)
  {
    goto LABEL_203;
  }
  self->_usUkUseAuWhatsNewFeatures = v4[769];
  *((_WORD *)&self->_has + 4) |= 0x800u;
  uint64_t v53 = *(void *)(v4 + 772);
  __int16 v54 = *((_WORD *)v4 + 390);
  if ((v53 & 0x4000000000000000) == 0)
  {
LABEL_204:
    if ((v53 & 0x200000000000) == 0) {
      goto LABEL_205;
    }
    goto LABEL_217;
  }
LABEL_216:
  self->_orderFeedEnabledLevel = *((_DWORD *)v4 + 160);
  *(void *)&self->_has |= 0x4000000000000000uLL;
  uint64_t v53 = *(void *)(v4 + 772);
  __int16 v54 = *((_WORD *)v4 + 390);
  if ((v53 & 0x200000000000) == 0)
  {
LABEL_205:
    if ((v53 & 0x40) == 0) {
      goto LABEL_206;
    }
    goto LABEL_218;
  }
LABEL_217:
  self->_stateRestorationAllowedTimeWindow = *((void *)v4 + 49);
  *(void *)&self->_has |= 0x200000000000uLL;
  __int16 v54 = *((_WORD *)v4 + 390);
  if ((*(void *)(v4 + 772) & 0x40) == 0)
  {
LABEL_206:
    if ((v54 & 0x200) == 0) {
      goto LABEL_208;
    }
    goto LABEL_207;
  }
LABEL_218:
  self->_autoRefreshMinimumInterval = *((void *)v4 + 10);
  *(void *)&self->_has |= 0x40uLL;
  if ((*((_WORD *)v4 + 390) & 0x200) != 0)
  {
LABEL_207:
    self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment = v4[767];
    *((_WORD *)&self->_has + 4) |= 0x200u;
  }
LABEL_208:
  uint64_t v55 = objc_msgSend(v4, "topStoriesPublishTimeIntervalsCount", (void)v69);
  if (v55)
  {
    uint64_t v56 = v55;
    for (uint64_t m = 0; m != v56; ++m)
      -[NTPBConfig addTopStoriesPublishTimeIntervals:](self, "addTopStoriesPublishTimeIntervals:", [v4 topStoriesPublishTimeIntervalsAtIndex:m]);
  }
  uint64_t v58 = (uint64_t *)(v4 + 772);
  __int16 v59 = *((_WORD *)v4 + 390);
  if ((v59 & 8) != 0)
  {
    self->_articleSearchEnabled = v4[761];
    *((_WORD *)&self->_has + 4) |= 8u;
    uint64_t v60 = *v58;
    __int16 v59 = *((_WORD *)v4 + 390);
    if ((*v58 & 0x400000) == 0) {
      goto LABEL_222;
    }
    goto LABEL_221;
  }
  uint64_t v60 = *v58;
  if ((*v58 & 0x400000) != 0)
  {
LABEL_221:
    self->_double maximumRatioOfArticlesInForYouGroup = *((double *)v4 + 26);
    *(void *)&self->_has |= 0x400000uLL;
    uint64_t v60 = *(void *)(v4 + 772);
    __int16 v59 = *((_WORD *)v4 + 390);
  }
LABEL_222:
  if ((v60 & 0x40000000) != 0)
  {
    self->_double minimumTrendingUnseenRatio = *((double *)v4 + 34);
    *(void *)&self->_has |= 0x40000000uLL;
    uint64_t v60 = *(void *)(v4 + 772);
    __int16 v59 = *((_WORD *)v4 + 390);
    if ((v59 & 2) == 0)
    {
LABEL_224:
      if ((v60 & 0x2000000) == 0) {
        goto LABEL_225;
      }
      goto LABEL_235;
    }
  }
  else if ((v59 & 2) == 0)
  {
    goto LABEL_224;
  }
  self->_trendingStyle = *((_DWORD *)v4 + 183);
  *((_WORD *)&self->_has + 4) |= 2u;
  uint64_t v60 = *(void *)(v4 + 772);
  __int16 v59 = *((_WORD *)v4 + 390);
  if ((v60 & 0x2000000) == 0)
  {
LABEL_225:
    if ((v60 & 0x4000000) == 0) {
      goto LABEL_226;
    }
    goto LABEL_236;
  }
LABEL_235:
  self->_minimumDurationBetweenForYouGroupsWeekday = *((void *)v4 + 29);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v60 = *(void *)(v4 + 772);
  __int16 v59 = *((_WORD *)v4 + 390);
  if ((v60 & 0x4000000) == 0)
  {
LABEL_226:
    if ((v60 & 0x8000000) == 0) {
      goto LABEL_227;
    }
    goto LABEL_237;
  }
LABEL_236:
  self->_minimumDurationBetweenForYouGroupsWeekend = *((void *)v4 + 30);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v60 = *(void *)(v4 + 772);
  __int16 v59 = *((_WORD *)v4 + 390);
  if ((v60 & 0x8000000) == 0)
  {
LABEL_227:
    if ((v60 & 0x10000000) == 0) {
      goto LABEL_228;
    }
    goto LABEL_238;
  }
LABEL_237:
  self->_minimumDurationBetweenTrendingGroupsWeekday = *((void *)v4 + 31);
  *(void *)&self->_has |= 0x8000000uLL;
  __int16 v59 = *((_WORD *)v4 + 390);
  if ((*(void *)(v4 + 772) & 0x10000000) == 0)
  {
LABEL_228:
    if ((v59 & 0x40) == 0) {
      goto LABEL_230;
    }
    goto LABEL_229;
  }
LABEL_238:
  self->_minimumDurationBetweenTrendingGroupsWeekend = *((void *)v4 + 32);
  *(void *)&self->_has |= 0x10000000uLL;
  if ((*((_WORD *)v4 + 390) & 0x40) != 0)
  {
LABEL_229:
    self->_diversifyOptionalTopStories = v4[764];
    *((_WORD *)&self->_has + 4) |= 0x40u;
  }
LABEL_230:
  forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  uint64_t v62 = *((void *)v4 + 77);
  if (forYouVideoGroupsConfig)
  {
    if (v62) {
      -[NTPBVideoGroupsConfig mergeFrom:](forYouVideoGroupsConfig, "mergeFrom:");
    }
  }
  else if (v62)
  {
    -[NTPBConfig setForYouVideoGroupsConfig:](self, "setForYouVideoGroupsConfig:");
  }
  if (*((void *)v4 + 68)) {
    -[NTPBConfig setArticleRecirculationConfig:](self, "setArticleRecirculationConfig:");
  }
  uint64_t v63 = *(void *)(v4 + 772);
  if ((v63 & 0x1000000000) != 0)
  {
    self->_optionalTopStoriesRefreshRate = *((void *)v4 + 40);
    *(void *)&self->_has |= 0x1000000000uLL;
    uint64_t v63 = *(void *)(v4 + 772);
  }
  __int16 v64 = *((_WORD *)v4 + 390);
  if ((v63 & 0x2000) != 0)
  {
    self->_expirePinnedArticlesAfter = *((void *)v4 + 17);
    *(void *)&self->_has |= 0x2000uLL;
    uint64_t v63 = *(void *)(v4 + 772);
    __int16 v64 = *((_WORD *)v4 + 390);
    if ((v63 & 0x200000000000000) == 0)
    {
LABEL_248:
      if ((v63 & 0x100000000000000) == 0) {
        goto LABEL_249;
      }
      goto LABEL_265;
    }
  }
  else if ((v63 & 0x200000000000000) == 0)
  {
    goto LABEL_248;
  }
  self->_userSegmentationApiModThreshold = *((void *)v4 + 61);
  *(void *)&self->_has |= 0x200000000000000uLL;
  __int16 v64 = *((_WORD *)v4 + 390);
  if ((*(void *)(v4 + 772) & 0x100000000000000) == 0)
  {
LABEL_249:
    if ((v64 & 1) == 0) {
      goto LABEL_251;
    }
    goto LABEL_250;
  }
LABEL_265:
  self->_userSegmentationApiModMax = *((void *)v4 + 60);
  *(void *)&self->_has |= 0x100000000000000uLL;
  if (*((_WORD *)v4 + 390))
  {
LABEL_250:
    self->_privateDataMigrationCleanupLevel = *((_DWORD *)v4 + 182);
    *((_WORD *)&self->_has + 4) |= 1u;
  }
LABEL_251:
  if (*((void *)v4 + 67)) {
    -[NTPBConfig setArticleRecirculationComponentPlacementConfig:](self, "setArticleRecirculationComponentPlacementConfig:");
  }
  uint64_t v65 = *(void *)(v4 + 772);
  if ((v65 & 0x1000000000000000) != 0)
  {
    self->_widgetEventImmediateUploadPopulationFloor = *((void *)v4 + 64);
    *(void *)&self->_has |= 0x1000000000000000uLL;
    uint64_t v65 = *(void *)(v4 + 772);
  }
  __int16 v66 = *((_WORD *)v4 + 390);
  if ((v65 & 0x800000000000000) != 0)
  {
    self->_widgetEventImmediateUploadPopulationCeiling = *((void *)v4 + 63);
    *(void *)&self->_has |= 0x800000000000000uLL;
    uint64_t v65 = *(void *)(v4 + 772);
    __int16 v66 = *((_WORD *)v4 + 390);
    if ((v65 & 0x400000000000000) == 0)
    {
LABEL_257:
      if ((v65 & 0x20) == 0) {
        goto LABEL_258;
      }
      goto LABEL_269;
    }
  }
  else if ((v65 & 0x400000000000000) == 0)
  {
    goto LABEL_257;
  }
  self->_widgetEventImmediateUploadModuloForHashing = *((void *)v4 + 62);
  *(void *)&self->_has |= 0x400000000000000uLL;
  __int16 v66 = *((_WORD *)v4 + 390);
  if ((*(void *)(v4 + 772) & 0x20) == 0)
  {
LABEL_258:
    if ((v66 & 0x20) == 0) {
      goto LABEL_260;
    }
    goto LABEL_259;
  }
LABEL_269:
  self->_articleRecirculationPopularFeedQueryTimeRange = *((void *)v4 + 9);
  *(void *)&self->_has |= 0x20uLL;
  if ((*((_WORD *)v4 + 390) & 0x20) != 0)
  {
LABEL_259:
    self->_disableThumbnailsForArticleRecirculation = v4[763];
    *((_WORD *)&self->_has + 4) |= 0x20u;
  }
LABEL_260:
  userSegmentationApiConfiguration = self->_userSegmentationApiConfiguration;
  uint64_t v68 = *((void *)v4 + 92);
  if (userSegmentationApiConfiguration)
  {
    if (v68) {
      -[NTPBUserSegmentationApiConfiguration mergeFrom:](userSegmentationApiConfiguration, "mergeFrom:");
    }
  }
  else if (v68)
  {
    -[NTPBConfig setUserSegmentationApiConfiguration:](self, "setUserSegmentationApiConfiguration:");
  }
}

- (NSString)fallbackLanguageTag
{
  return self->_fallbackLanguageTag;
}

- (void)setFallbackLanguageTag:(id)a3
{
}

- (NSMutableArray)languageConfigs
{
  return self->_languageConfigs;
}

- (void)setLanguageConfigs:(id)a3
{
}

- (int64_t)shortReminderTime
{
  return self->_shortReminderTime;
}

- (int64_t)longReminderTime
{
  return self->_longReminderTime;
}

- (BOOL)newsletterSubscriptionChecked
{
  return self->_newsletterSubscriptionChecked;
}

- (double)batchedFeedTimeout
{
  return self->_batchedFeedTimeout;
}

- (double)interstitialAdLoadDelay
{
  return self->_interstitialAdLoadDelay;
}

- (double)prerollLoadingTimeout
{
  return self->_prerollLoadingTimeout;
}

- (NSMutableArray)endpointConfigs
{
  return self->_endpointConfigs;
}

- (void)setEndpointConfigs:(id)a3
{
}

- (NTPBPersonalizationConfig)personalizationConfig
{
  return self->_personalizationConfig;
}

- (void)setPersonalizationConfig:(id)a3
{
}

- (NTPBIAdConfig)iadConfig
{
  return self->_iadConfig;
}

- (void)setIadConfig:(id)a3
{
}

- (NTPBPrefetchConfig)prefetchConfig
{
  return self->_prefetchConfig;
}

- (void)setPrefetchConfig:(id)a3
{
}

- (double)tileProminenceScoreBalanceValue
{
  return self->_tileProminenceScoreBalanceValue;
}

- (int64_t)minimumArticleUpdateInterval
{
  return self->_minimumArticleUpdateInterval;
}

- (int64_t)initialArticlesFromNewFavorite
{
  return self->_initialArticlesFromNewFavorite;
}

- (int64_t)autoScrollToTopFeedTimeout
{
  return self->_autoScrollToTopFeedTimeout;
}

- (int64_t)trendingTopicsRefreshRate
{
  return self->_trendingTopicsRefreshRate;
}

- (int64_t)appConfigRefreshRate
{
  return self->_appConfigRefreshRate;
}

- (int64_t)minimumDistanceBetweenImageOnTopTiles
{
  return self->_minimumDistanceBetweenImageOnTopTiles;
}

- (int64_t)timeBetweenWidgetInsertions
{
  return self->_timeBetweenWidgetInsertions;
}

- (int64_t)timeBetweenSameWidgetReinsertion
{
  return self->_timeBetweenSameWidgetReinsertion;
}

- (int64_t)numberOfScreenfulsScrolledToBypassWidgetTimeLimit
{
  return self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit;
}

- (int64_t)articleRapidUpdatesTimeout
{
  return self->_articleRapidUpdatesTimeout;
}

- (int64_t)subscriptionsGlobalMeteredCount
{
  return self->_subscriptionsGlobalMeteredCount;
}

- (NSString)anfEmbedConfigurationAsset
{
  return self->_anfEmbedConfigurationAsset;
}

- (void)setAnfEmbedConfigurationAsset:(id)a3
{
}

- (int64_t)subscriptionsPlacardPublisherFrequencyDays
{
  return self->_subscriptionsPlacardPublisherFrequencyDays;
}

- (int64_t)subscriptionsPlacardGlobalMaxPerDay
{
  return self->_subscriptionsPlacardGlobalMaxPerDay;
}

- (int64_t)subscriptionsGracePeriodForTokenVerificationSeconds
{
  return self->_subscriptionsGracePeriodForTokenVerificationSeconds;
}

- (int64_t)newFavoriteNotificationAlertsFrequency
{
  return self->_newFavoriteNotificationAlertsFrequency;
}

- (double)endOfArticleMinPaidHeadlineRatio
{
  return self->_endOfArticleMinPaidHeadlineRatio;
}

- (int64_t)endOfArticleMaxInaccessiblePaidArticles
{
  return self->_endOfArticleMaxInaccessiblePaidArticles;
}

- (NTPBWidgetConfig)widgetConfig
{
  return self->_widgetConfig;
}

- (void)setWidgetConfig:(id)a3
{
}

- (BOOL)universalLinksEnabled
{
  return self->_universalLinksEnabled;
}

- (int64_t)notificationArticleCacheTimeout
{
  return self->_notificationArticleCacheTimeout;
}

- (int64_t)notificationArticleWithRapidUpdatesCacheTimeout
{
  return self->_notificationArticleWithRapidUpdatesCacheTimeout;
}

- (NSString)forYouNonPersonalizedGroupsOrder
{
  return self->_forYouNonPersonalizedGroupsOrder;
}

- (void)setForYouNonPersonalizedGroupsOrder:(id)a3
{
}

- (NTPBWidgetConfig)alternativeButlerWidgetConfig
{
  return self->_alternativeButlerWidgetConfig;
}

- (void)setAlternativeButlerWidgetConfig:(id)a3
{
}

- (BOOL)alternativeButlerWidgetConfigEnabled
{
  return self->_alternativeButlerWidgetConfigEnabled;
}

- (NTPBWidgetConfig)butlerWidgetConfig
{
  return self->_butlerWidgetConfig;
}

- (void)setButlerWidgetConfig:(id)a3
{
}

- (NTPBPaidSubscriptionConfig)paidSubscriptionConfig
{
  return self->_paidSubscriptionConfig;
}

- (void)setPaidSubscriptionConfig:(id)a3
{
}

- (NTPBWidgetConfig)widgetConfig2
{
  return self->_widgetConfig2;
}

- (void)setWidgetConfig2:(id)a3
{
}

- (int64_t)subscriptionsPlacardPublisherFrequencySeconds
{
  return self->_subscriptionsPlacardPublisherFrequencySeconds;
}

- (int64_t)treatmentId
{
  return self->_treatmentId;
}

- (NTPBBinningConfig)binningConfig
{
  return self->_binningConfig;
}

- (void)setBinningConfig:(id)a3
{
}

- (NTPBPersonalizationTreatment)personalizationTreatment
{
  return self->_personalizationTreatment;
}

- (void)setPersonalizationTreatment:(id)a3
{
}

- (NSString)personalizationBundleIdMappingResourceId
{
  return self->_personalizationBundleIdMappingResourceId;
}

- (void)setPersonalizationBundleIdMappingResourceId:(id)a3
{
}

- (NSString)personalizationUrlMappingResourceId
{
  return self->_personalizationUrlMappingResourceId;
}

- (void)setPersonalizationUrlMappingResourceId:(id)a3
{
}

- (NSString)personalizationWhitelistResourceId
{
  return self->_personalizationWhitelistResourceId;
}

- (void)setPersonalizationWhitelistResourceId:(id)a3
{
}

- (unsigned)enabledPrivateDataEncryptionLevel
{
  return self->_enabledPrivateDataEncryptionLevel;
}

- (NSString)personalizationPublisherFavorabilityScoresResourceId
{
  return self->_personalizationPublisherFavorabilityScoresResourceId;
}

- (void)setPersonalizationPublisherFavorabilityScoresResourceId:(id)a3
{
}

- (NSString)personalizationWidgetSectionMappingResourceId
{
  return self->_personalizationWidgetSectionMappingResourceId;
}

- (void)setPersonalizationWidgetSectionMappingResourceId:(id)a3
{
}

- (int64_t)corryBarMaxArticleCountForArticleList
{
  return self->_corryBarMaxArticleCountForArticleList;
}

- (int64_t)corryBarMaxArticleCountForSingleArticle
{
  return self->_corryBarMaxArticleCountForSingleArticle;
}

- (BOOL)corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers
{
  return self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
}

- (NSMutableArray)externalAnalyticsConfigs
{
  return self->_externalAnalyticsConfigs;
}

- (void)setExternalAnalyticsConfigs:(id)a3
{
}

- (NSString)personalizationPortraitConfigResourceId
{
  return self->_personalizationPortraitConfigResourceId;
}

- (void)setPersonalizationPortraitConfigResourceId:(id)a3
{
}

- (NSString)experimentalizableFieldPostfix
{
  return self->_experimentalizableFieldPostfix;
}

- (void)setExperimentalizableFieldPostfix:(id)a3
{
}

- (int64_t)minimumFollowCountToRemovePersonalizePlacardInFollowing
{
  return self->_minimumFollowCountToRemovePersonalizePlacardInFollowing;
}

- (BOOL)useSecureConnectionForAssets
{
  return self->_useSecureConnectionForAssets;
}

- (BOOL)usUkUseAuWhatsNewFeatures
{
  return self->_usUkUseAuWhatsNewFeatures;
}

- (unsigned)orderFeedEnabledLevel
{
  return self->_orderFeedEnabledLevel;
}

- (int64_t)stateRestorationAllowedTimeWindow
{
  return self->_stateRestorationAllowedTimeWindow;
}

- (int64_t)autoRefreshMinimumInterval
{
  return self->_autoRefreshMinimumInterval;
}

- (double)maximumRatioOfArticlesInForYouGroup
{
  return self->_maximumRatioOfArticlesInForYouGroup;
}

- (double)minimumTrendingUnseenRatio
{
  return self->_minimumTrendingUnseenRatio;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekday
{
  return self->_minimumDurationBetweenForYouGroupsWeekday;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekend
{
  return self->_minimumDurationBetweenForYouGroupsWeekend;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekday
{
  return self->_minimumDurationBetweenTrendingGroupsWeekday;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekend
{
  return self->_minimumDurationBetweenTrendingGroupsWeekend;
}

- (NTPBVideoGroupsConfig)forYouVideoGroupsConfig
{
  return self->_forYouVideoGroupsConfig;
}

- (void)setForYouVideoGroupsConfig:(id)a3
{
}

- (NSString)articleRecirculationConfig
{
  return self->_articleRecirculationConfig;
}

- (void)setArticleRecirculationConfig:(id)a3
{
}

- (int64_t)optionalTopStoriesRefreshRate
{
  return self->_optionalTopStoriesRefreshRate;
}

- (int64_t)userSegmentationApiModThreshold
{
  return self->_userSegmentationApiModThreshold;
}

- (int64_t)userSegmentationApiModMax
{
  return self->_userSegmentationApiModMax;
}

- (unsigned)privateDataMigrationCleanupLevel
{
  return self->_privateDataMigrationCleanupLevel;
}

- (NSString)articleRecirculationComponentPlacementConfig
{
  return self->_articleRecirculationComponentPlacementConfig;
}

- (void)setArticleRecirculationComponentPlacementConfig:(id)a3
{
}

- (NTPBUserSegmentationApiConfiguration)userSegmentationApiConfiguration
{
  return self->_userSegmentationApiConfiguration;
}

- (void)setUserSegmentationApiConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetConfig2, 0);
  objc_storeStrong((id *)&self->_widgetConfig, 0);
  objc_storeStrong((id *)&self->_userSegmentationApiConfiguration, 0);
  objc_storeStrong((id *)&self->_prefetchConfig, 0);
  objc_storeStrong((id *)&self->_personalizationWidgetSectionMappingResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationWhitelistResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationUrlMappingResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationTreatment, 0);
  objc_storeStrong((id *)&self->_personalizationPublisherFavorabilityScoresResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationPortraitConfigResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationConfig, 0);
  objc_storeStrong((id *)&self->_personalizationBundleIdMappingResourceId, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionConfig, 0);
  objc_storeStrong((id *)&self->_languageConfigs, 0);
  objc_storeStrong((id *)&self->_iadConfig, 0);
  objc_storeStrong((id *)&self->_forYouVideoGroupsConfig, 0);
  objc_storeStrong((id *)&self->_forYouNonPersonalizedGroupsOrder, 0);
  objc_storeStrong((id *)&self->_fallbackLanguageTag, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsConfigs, 0);
  objc_storeStrong((id *)&self->_experimentalizableFieldPostfix, 0);
  objc_storeStrong((id *)&self->_endpointConfigs, 0);
  objc_storeStrong((id *)&self->_butlerWidgetConfig, 0);
  objc_storeStrong((id *)&self->_binningConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationComponentPlacementConfig, 0);
  objc_storeStrong((id *)&self->_anfEmbedConfigurationAsset, 0);

  objc_storeStrong((id *)&self->_alternativeButlerWidgetConfig, 0);
}

@end