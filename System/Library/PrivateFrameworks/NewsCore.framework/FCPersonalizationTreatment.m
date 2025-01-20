@interface FCPersonalizationTreatment
+ (BOOL)supportsSecureCoding;
- (BOOL)computeUserVectorWithTabi;
- (BOOL)forYouGroupAllowUnfilteredArticles;
- (BOOL)lowQualityFilterShouldIsolateEvergreenItems;
- (BOOL)lowQualityFilterShouldPreserveItemsFromSubscribedChannels;
- (BOOL)personalizesSportsTagsInUserVector;
- (BOOL)reorderHeadlinesUsingEmbeddingScoreBeforeGrouping;
- (BOOL)shadowModeScoringEnabled;
- (BOOL)sportsTagSeenEnableFeedSource;
- (BOOL)sportsTagSeenEnableSportsManagementDetailSource;
- (BOOL)sportsTagSeenEnableSportsManagementSource;
- (FCPersonalizationOntologyLevelConfig)affinityGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)articleListTagFeedGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)articleRecirculationPrimaryOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)articleRecirculationQuaternaryOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)articleRecirculationSecondaryOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)articleRecirculationTertiaryOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)audioFeedOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)bestOfBundleOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)curatedIssuesOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)curatedOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)defaultOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)forYouOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)greatStoriesYouMissedOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)highlightsGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)introToSportsGroupForYouOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)introToSportsGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)latestStoriesOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)legacyAudioFeedOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)localNewsOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)localSectionGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)magazineFeedArticleOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)magazineFeedIssueOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)moreForYouOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)mySportsGroupForYouOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)mySportsGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)mySportsTopicsOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)newspaperMagazineFeedOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)newspaperSectionGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)newspaperTodayFeedOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)sportsEventArticlesGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)sportsEventTopicGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)sportsTopStoriesOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)tagDateRangeOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)tagFeedOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)tagForYouGroupOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)tagRecentStoriesOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)tagWidgetOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)todayWidgetOntologyLevelConfig;
- (FCPersonalizationOntologyLevelConfig)topicFeedOntologyLevelConfig;
- (FCPersonalizationScoringConfig)affinityGroupScoringConfig;
- (FCPersonalizationScoringConfig)articleListTagFeedGroupScoringConfig;
- (FCPersonalizationScoringConfig)articleRecirculationPrimaryScoringConfig;
- (FCPersonalizationScoringConfig)articleRecirculationQuaternaryScoringConfig;
- (FCPersonalizationScoringConfig)articleRecirculationSecondaryScoringConfig;
- (FCPersonalizationScoringConfig)articleRecirculationTertiaryScoringConfig;
- (FCPersonalizationScoringConfig)audioFeedScoringConfig;
- (FCPersonalizationScoringConfig)bestOfBundleScoringConfig;
- (FCPersonalizationScoringConfig)curatedIssuesScoringConfig;
- (FCPersonalizationScoringConfig)curatedScoringConfig;
- (FCPersonalizationScoringConfig)defaultScoringConfig;
- (FCPersonalizationScoringConfig)forYouScoringConfig;
- (FCPersonalizationScoringConfig)greatStoriesYouMissedScoringConfig;
- (FCPersonalizationScoringConfig)highlightsGroupScoringConfig;
- (FCPersonalizationScoringConfig)introToSportsGroupForYouScoringConfig;
- (FCPersonalizationScoringConfig)introToSportsGroupScoringConfig;
- (FCPersonalizationScoringConfig)latestStoriesScoringConfig;
- (FCPersonalizationScoringConfig)legacyAudioFeedScoringConfig;
- (FCPersonalizationScoringConfig)localNewsScoringConfig;
- (FCPersonalizationScoringConfig)localSectionGroupScoringConfig;
- (FCPersonalizationScoringConfig)magazineFeedArticleScoringConfig;
- (FCPersonalizationScoringConfig)magazineFeedIssueScoringConfig;
- (FCPersonalizationScoringConfig)moreForYouScoringConfig;
- (FCPersonalizationScoringConfig)mySportsGroupForYouScoringConfig;
- (FCPersonalizationScoringConfig)mySportsGroupScoringConfig;
- (FCPersonalizationScoringConfig)mySportsTopicsScoringConfig;
- (FCPersonalizationScoringConfig)newspaperMagazineFeedScoringConfig;
- (FCPersonalizationScoringConfig)newspaperSectionGroupScoringConfig;
- (FCPersonalizationScoringConfig)newspaperTodayFeedScoringConfig;
- (FCPersonalizationScoringConfig)notificationScoringConfig;
- (FCPersonalizationScoringConfig)sportsEventArticlesGroupScoringConfig;
- (FCPersonalizationScoringConfig)sportsEventTopicGroupScoringConfig;
- (FCPersonalizationScoringConfig)sportsTopStoriesScoringConfig;
- (FCPersonalizationScoringConfig)tagDateRangeScoringConfig;
- (FCPersonalizationScoringConfig)tagFeedScoringConfig;
- (FCPersonalizationScoringConfig)tagForYouGroupScoringConfig;
- (FCPersonalizationScoringConfig)tagRecentStoriesScoringConfig;
- (FCPersonalizationScoringConfig)tagWidgetScoringConfig;
- (FCPersonalizationScoringConfig)todayWidgetScoringConfig;
- (FCPersonalizationScoringConfig)topicFeedScoringConfig;
- (FCPersonalizationTagScoringConfig)defaultTagScoringConfig;
- (FCPersonalizationTagScoringConfig)sportsTagScoringConfig;
- (FCPersonalizationTopicsConfig)affinityGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)articleListTagFeedGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)articleRecirculationPrimaryTopicsConfig;
- (FCPersonalizationTopicsConfig)articleRecirculationQuaternaryTopicsConfig;
- (FCPersonalizationTopicsConfig)articleRecirculationSecondaryTopicsConfig;
- (FCPersonalizationTopicsConfig)articleRecirculationTertiaryTopicsConfig;
- (FCPersonalizationTopicsConfig)audioFeedTopicsConfig;
- (FCPersonalizationTopicsConfig)bestOfBundleTopicsConfig;
- (FCPersonalizationTopicsConfig)curatedIssuesTopicsConfig;
- (FCPersonalizationTopicsConfig)curatedTopicsConfig;
- (FCPersonalizationTopicsConfig)defaultTopicsConfig;
- (FCPersonalizationTopicsConfig)forYouTopicsConfig;
- (FCPersonalizationTopicsConfig)greatStoriesYouMissedTopicsConfig;
- (FCPersonalizationTopicsConfig)highlightsGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)introToSportsGroupForYouTopicsConfig;
- (FCPersonalizationTopicsConfig)introToSportsGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)latestStoriesTopicsConfig;
- (FCPersonalizationTopicsConfig)legacyAudioFeedTopicsConfig;
- (FCPersonalizationTopicsConfig)localNewsTopicsConfig;
- (FCPersonalizationTopicsConfig)localSectionGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)magazineFeedArticleTopicsConfig;
- (FCPersonalizationTopicsConfig)magazineFeedIssueTopicsConfig;
- (FCPersonalizationTopicsConfig)moreForYouTopicsConfig;
- (FCPersonalizationTopicsConfig)mySportsGroupForYouTopicsConfig;
- (FCPersonalizationTopicsConfig)mySportsGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)mySportsTopicsTopicsConfig;
- (FCPersonalizationTopicsConfig)newspaperMagazineFeedTopicsConfig;
- (FCPersonalizationTopicsConfig)newspaperSectionGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)newspaperTodayFeedTopicsConfig;
- (FCPersonalizationTopicsConfig)sportsEventArticlesGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)sportsEventTopicGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)sportsTopStoriesTopicsConfig;
- (FCPersonalizationTopicsConfig)tagDateRangeTopicsConfig;
- (FCPersonalizationTopicsConfig)tagFeedTopicsConfig;
- (FCPersonalizationTopicsConfig)tagForYouGroupTopicsConfig;
- (FCPersonalizationTopicsConfig)tagRecentStoriesTopicsConfig;
- (FCPersonalizationTopicsConfig)tagWidgetTopicsConfig;
- (FCPersonalizationTopicsConfig)todayWidgetTopicsConfig;
- (FCPersonalizationTopicsConfig)topicFeedTopicsConfig;
- (FCPersonalizationTreatment)init;
- (FCPersonalizationTreatment)initWithCoder:(id)a3;
- (FCPersonalizationTreatment)initWithPersonalizationTreatmentDictionary:(id)a3;
- (NSArray)shadowAffinityGroupTopicsConfig;
- (NSArray)shadowArticleListTagFeedGroupTopicsConfig;
- (NSArray)shadowArticleRecirculationPrimaryTopicsConfig;
- (NSArray)shadowArticleRecirculationQuaternaryTopicsConfig;
- (NSArray)shadowArticleRecirculationSecondaryTopicsConfig;
- (NSArray)shadowArticleRecirculationTertiaryTopicsConfig;
- (NSArray)shadowAudioFeedTopicsConfig;
- (NSArray)shadowBestOfBundleTopicsConfig;
- (NSArray)shadowCuratedIssuesTopicsConfig;
- (NSArray)shadowCuratedTopicsConfig;
- (NSArray)shadowDefaultTopicsConfig;
- (NSArray)shadowForYouTopicsConfig;
- (NSArray)shadowGreatStoriesYouMissedTopicsConfig;
- (NSArray)shadowHighlightsGroupTopicsConfig;
- (NSArray)shadowIntroToSportsGroupForYouTopicsConfig;
- (NSArray)shadowIntroToSportsGroupTopicsConfig;
- (NSArray)shadowLatestStoriesTopicsConfig;
- (NSArray)shadowLegacyAudioFeedTopicsConfig;
- (NSArray)shadowLocalNewsTopicsConfig;
- (NSArray)shadowLocalSectionGroupTopicsConfig;
- (NSArray)shadowMagazineFeedArticleTopicsConfig;
- (NSArray)shadowMagazineFeedIssueTopicsConfig;
- (NSArray)shadowMoreForYouTopicsConfig;
- (NSArray)shadowMySportsGroupForYouTopicsConfig;
- (NSArray)shadowMySportsGroupTopicsConfig;
- (NSArray)shadowMySportsTopicsTopicsConfig;
- (NSArray)shadowNewspaperMagazineFeedTopicsConfig;
- (NSArray)shadowNewspaperSectionGroupTopicsConfig;
- (NSArray)shadowNewspaperTodayFeedTopicsConfig;
- (NSArray)shadowSportsEventArticlesGroupTopicsConfig;
- (NSArray)shadowSportsEventTopicGroupTopicsConfig;
- (NSArray)shadowSportsTopStoriesTopicsConfig;
- (NSArray)shadowTagDateRangeTopicsConfig;
- (NSArray)shadowTagFeedTopicsConfig;
- (NSArray)shadowTagForYouGroupTopicsConfig;
- (NSArray)shadowTagRecentStoriesTopicsConfig;
- (NSArray)shadowTagWidgetTopicsConfig;
- (NSArray)shadowTodayWidgetTopicsConfig;
- (NSArray)shadowTopicFeedTopicsConfig;
- (NSDictionary)shadowAffinityGroupOntologyLevelConfig;
- (NSDictionary)shadowAffinityGroupScoringConfig;
- (NSDictionary)shadowArticleListTagFeedGroupOntologyLevelConfig;
- (NSDictionary)shadowArticleListTagFeedGroupScoringConfig;
- (NSDictionary)shadowArticleRecirculationPrimaryOntologyLevelConfig;
- (NSDictionary)shadowArticleRecirculationPrimaryScoringConfig;
- (NSDictionary)shadowArticleRecirculationQuaternaryOntologyLevelConfig;
- (NSDictionary)shadowArticleRecirculationQuaternaryScoringConfig;
- (NSDictionary)shadowArticleRecirculationSecondaryOntologyLevelConfig;
- (NSDictionary)shadowArticleRecirculationSecondaryScoringConfig;
- (NSDictionary)shadowArticleRecirculationTertiaryOntologyLevelConfig;
- (NSDictionary)shadowArticleRecirculationTertiaryScoringConfig;
- (NSDictionary)shadowAudioFeedOntologyLevelConfig;
- (NSDictionary)shadowAudioFeedScoringConfig;
- (NSDictionary)shadowBestOfBundleOntologyLevelConfig;
- (NSDictionary)shadowBestOfBundleScoringConfig;
- (NSDictionary)shadowCuratedIssuesOntologyLevelConfig;
- (NSDictionary)shadowCuratedIssuesScoringConfig;
- (NSDictionary)shadowCuratedOntologyLevelConfig;
- (NSDictionary)shadowCuratedScoringConfig;
- (NSDictionary)shadowDefaultOntologyLevelConfig;
- (NSDictionary)shadowDefaultScoringConfig;
- (NSDictionary)shadowForYouOntologyLevelConfig;
- (NSDictionary)shadowForYouScoringConfig;
- (NSDictionary)shadowGreatStoriesYouMissedOntologyLevelConfig;
- (NSDictionary)shadowGreatStoriesYouMissedScoringConfig;
- (NSDictionary)shadowHighlightsGroupOntologyLevelConfig;
- (NSDictionary)shadowHighlightsGroupScoringConfig;
- (NSDictionary)shadowIntroToSportsGroupForYouOntologyLevelConfig;
- (NSDictionary)shadowIntroToSportsGroupForYouScoringConfig;
- (NSDictionary)shadowIntroToSportsGroupOntologyLevelConfig;
- (NSDictionary)shadowIntroToSportsGroupScoringConfig;
- (NSDictionary)shadowLatestStoriesOntologyLevelConfig;
- (NSDictionary)shadowLatestStoriesScoringConfig;
- (NSDictionary)shadowLegacyAudioFeedOntologyLevelConfig;
- (NSDictionary)shadowLegacyAudioFeedScoringConfig;
- (NSDictionary)shadowLocalNewsOntologyLevelConfig;
- (NSDictionary)shadowLocalNewsScoringConfig;
- (NSDictionary)shadowLocalSectionGroupOntologyLevelConfig;
- (NSDictionary)shadowLocalSectionGroupScoringConfig;
- (NSDictionary)shadowMagazineFeedArticleOntologyLevelConfig;
- (NSDictionary)shadowMagazineFeedArticleScoringConfig;
- (NSDictionary)shadowMagazineFeedIssueOntologyLevelConfig;
- (NSDictionary)shadowMagazineFeedIssueScoringConfig;
- (NSDictionary)shadowMoreForYouOntologyLevelConfig;
- (NSDictionary)shadowMoreForYouScoringConfig;
- (NSDictionary)shadowMySportsGroupForYouOntologyLevelConfig;
- (NSDictionary)shadowMySportsGroupForYouScoringConfig;
- (NSDictionary)shadowMySportsGroupOntologyLevelConfig;
- (NSDictionary)shadowMySportsGroupScoringConfig;
- (NSDictionary)shadowMySportsTopicsOntologyLevelConfig;
- (NSDictionary)shadowMySportsTopicsScoringConfig;
- (NSDictionary)shadowNewspaperMagazineFeedOntologyLevelConfig;
- (NSDictionary)shadowNewspaperMagazineFeedScoringConfig;
- (NSDictionary)shadowNewspaperSectionGroupOntologyLevelConfig;
- (NSDictionary)shadowNewspaperSectionGroupScoringConfig;
- (NSDictionary)shadowNewspaperTodayFeedOntologyLevelConfig;
- (NSDictionary)shadowNewspaperTodayFeedScoringConfig;
- (NSDictionary)shadowNotificationScoringConfig;
- (NSDictionary)shadowSportsEventArticlesGroupOntologyLevelConfig;
- (NSDictionary)shadowSportsEventArticlesGroupScoringConfig;
- (NSDictionary)shadowSportsEventTopicGroupOntologyLevelConfig;
- (NSDictionary)shadowSportsEventTopicGroupScoringConfig;
- (NSDictionary)shadowSportsTopStoriesOntologyLevelConfig;
- (NSDictionary)shadowSportsTopStoriesScoringConfig;
- (NSDictionary)shadowTagDateRangeOntologyLevelConfig;
- (NSDictionary)shadowTagDateRangeScoringConfig;
- (NSDictionary)shadowTagFeedOntologyLevelConfig;
- (NSDictionary)shadowTagFeedScoringConfig;
- (NSDictionary)shadowTagForYouGroupOntologyLevelConfig;
- (NSDictionary)shadowTagForYouGroupScoringConfig;
- (NSDictionary)shadowTagRecentStoriesOntologyLevelConfig;
- (NSDictionary)shadowTagRecentStoriesScoringConfig;
- (NSDictionary)shadowTagWidgetOntologyLevelConfig;
- (NSDictionary)shadowTagWidgetScoringConfig;
- (NSDictionary)shadowTodayWidgetOntologyLevelConfig;
- (NSDictionary)shadowTodayWidgetScoringConfig;
- (NSDictionary)shadowTopicFeedOntologyLevelConfig;
- (NSDictionary)shadowTopicFeedScoringConfig;
- (double)appInFocusBaselineClickValue;
- (double)appInFocusBaselineImpressionValue;
- (double)appInFocusClickValue;
- (double)appInFocusImpressionValue;
- (double)appInstallBaselineClickValue;
- (double)appInstallBaselineImpressionValue;
- (double)appInstallClickValue;
- (double)appInstallImpressionValue;
- (double)appUsageOccurrenceDecayMultiplier;
- (double)appUsagePriorFactorExponent;
- (double)appUsageSignalWeight;
- (double)appUsageTagFavorabilityExponent;
- (double)appUsageTimeDecayMultiplier;
- (double)articleLengthLongThreshold;
- (double)articleLengthMediumThreshold;
- (double)audioFeedGroupScoreWeight;
- (double)autoFavoriteMaxIdleTime;
- (double)autoFavoriteMinClicks;
- (double)autoFavoriteMinEvents;
- (double)autoFavoriteMinObservationsExtAppUsage;
- (double)autoFavoriteMinObservationsSafari;
- (double)autoFavoriteMinRate;
- (double)autoFavoriteMinRelativeRate;
- (double)autoFavoriteMinScoreExtAppUsage;
- (double)autoFavoriteMinScoreSafari;
- (double)autoFavoritePriorFactorExponent;
- (double)autoFavoriteTagFavorabilityExponent;
- (double)autoGroupableFactor;
- (double)autoUnfavoriteFactor;
- (double)baselineClicksByAction;
- (double)baselineImpressionPrior;
- (double)baselineImpressionsByAction;
- (double)channelScoreWeight;
- (double)clicksToImpressionsRatioMaximum;
- (double)dislikeBaselineClickValue;
- (double)dislikeBaselineImpressionValue;
- (double)dislikeClickValue;
- (double)dislikeImpressionValue;
- (double)existingSubscriptionBaselineClickValue;
- (double)existingSubscriptionBaselineImpressionValue;
- (double)existingSubscriptionClickValue;
- (double)existingSubscriptionImpressionValue;
- (double)existingSubscriptionRelatedBaselineClickValue;
- (double)existingSubscriptionRelatedBaselineImpressionValue;
- (double)existingSubscriptionRelatedClickValue;
- (double)existingSubscriptionRelatedImpressionValue;
- (double)featureClicksByAction;
- (double)featureImpressionPrior;
- (double)featureImpressionsByAction;
- (double)filterableNotificationThresholdMultiplier;
- (double)groupImpressionBiasCorrectionFactor;
- (double)heavyClickBaselineClickValue;
- (double)heavyClickBaselineImpressionValue;
- (double)heavyClickClickValue;
- (double)heavyClickImpressionValue;
- (double)heavyClickMinimumDuration;
- (double)hourlyFlowRateAlpha;
- (double)hourlyFlowRateBeta;
- (double)hourlyFlowRateCeiling;
- (double)hourlyFlowRateDampeningFactor;
- (double)hourlyFlowRateDecayFactor;
- (double)hourlyFlowRateFloor;
- (double)hourlyFlowRateGamma;
- (double)hourlyFlowRateMinimum;
- (double)hourlyFlowRatePerSubscription;
- (double)hourlyFlowRatePriorWeight;
- (double)hourlyFlowRateSubscriptionCountBuffer;
- (double)ignoreBaselineClickValue;
- (double)ignoreBaselineImpressionValue;
- (double)ignoreClickValue;
- (double)ignoreImpressionValue;
- (double)indexImpressionBiasCorrectionFactor;
- (double)internalUsageSignalWeight;
- (double)likeBaselineClickValue;
- (double)likeBaselineImpressionValue;
- (double)likeClickValue;
- (double)likeImpressionValue;
- (double)lowQualityContentThreshold;
- (double)magazineFeedGroupScoreWeight;
- (double)managedTopicMultiplier;
- (double)managedWinnerTopicMultiplier;
- (double)metaGroupingHighestScoringRelativeScoreMultiplier;
- (double)metaGroupingRelatednessKWeight;
- (double)metaGroupingRelatednessThreshold;
- (double)metaGroupingSubscribedTopicMultiplier;
- (double)metaGroupingTopicScoreWeight;
- (double)minimumMyMagazinesIssueScoreBaselineMultiplier;
- (double)muteBaselineClickValue;
- (double)muteBaselineImpressionValue;
- (double)muteClickValue;
- (double)muteImpressionValue;
- (double)newsTodayWidgetClickBaselineClickValue;
- (double)newsTodayWidgetClickBaselineImpressionValue;
- (double)newsTodayWidgetClickClickValue;
- (double)newsTodayWidgetClickImpressionValue;
- (double)newsTodayWidgetPresentationBaselineClickValue;
- (double)newsTodayWidgetPresentationBaselineImpressionValue;
- (double)newsTodayWidgetPresentationClickValue;
- (double)newsTodayWidgetPresentationImpressionValue;
- (double)newsTodayWidgetVideoPlaybackBaselineClickValue;
- (double)newsTodayWidgetVideoPlaybackBaselineImpressionValue;
- (double)newsTodayWidgetVideoPlaybackClickValue;
- (double)newsTodayWidgetVideoPlaybackImpressionValue;
- (double)portraitDecayRate;
- (double)portraitGlobalThreshold;
- (double)portraitPriorFactorExponent;
- (double)portraitSignalWeight;
- (double)portraitTagFavorabilityExponent;
- (double)premiumSubscriptionActivationBaselineClickValue;
- (double)premiumSubscriptionActivationBaselineImpressionValue;
- (double)premiumSubscriptionActivationClickValue;
- (double)premiumSubscriptionActivationImpressionValue;
- (double)presentationBaselineClickValue;
- (double)presentationBaselineImpressionValue;
- (double)presentationClickValue;
- (double)presentationImpressionValue;
- (double)publisherBoostForIssueOpenBaselineClickValue;
- (double)publisherBoostForIssueOpenBaselineImpressionValue;
- (double)publisherBoostForIssueOpenClickValue;
- (double)publisherBoostForIssueOpenImpressionValue;
- (double)publisherBoostForSourceMoreFromFeedBaselineClickValue;
- (double)publisherBoostForSourceMoreFromFeedBaselineImpressionValue;
- (double)publisherBoostForSourceMoreFromFeedClickValue;
- (double)publisherBoostForSourceMoreFromFeedImpressionValue;
- (double)publisherDiversificationInitialPenalty;
- (double)publisherDiversificationPenalty;
- (double)publisherDiversificationPenaltyHalfLife;
- (double)publisherDiversityMaxArticleFilter;
- (double)recommendationPresentationExploreBaselineClickValue;
- (double)recommendationPresentationExploreBaselineImpressionValue;
- (double)recommendationPresentationExploreClickValue;
- (double)recommendationPresentationExploreImpressionValue;
- (double)recommendationPresentationFeedBaselineClickValue;
- (double)recommendationPresentationFeedBaselineImpressionValue;
- (double)recommendationPresentationFeedClickValue;
- (double)recommendationPresentationFeedImpressionValue;
- (double)relatedTopicMultiplier;
- (double)relatedTopicRatioFilter;
- (double)safariEventBlackoutSeconds;
- (double)safariHistoryBaselineClickValue;
- (double)safariHistoryBaselineImpressionValue;
- (double)safariHistoryClickValue;
- (double)safariHistoryImpressionValue;
- (double)safariOccurrenceDecayMultiplier;
- (double)safariPriorFactorExponent;
- (double)safariSignalWeight;
- (double)safariTagFavorabilityExponent;
- (double)safariTimeDecayMultiplier;
- (double)savedBaselineClickValue;
- (double)savedBaselineImpressionValue;
- (double)savedClickValue;
- (double)savedImpressionValue;
- (double)shareBaselineClickValue;
- (double)shareBaselineImpressionValue;
- (double)shareClickValue;
- (double)shareImpressionValue;
- (double)sportsTagSeenBaselineClickValue;
- (double)sportsTagSeenBaselineImpressionValue;
- (double)sportsTagSeenClickValue;
- (double)sportsTagSeenImpressionValue;
- (double)sportsTagSeenMinimumDuration;
- (double)subscribeBaselineClickValue;
- (double)subscribeBaselineImpressionValue;
- (double)subscribeClickValue;
- (double)subscribeImpressionValue;
- (double)subscribeRelatedBaselineClickValue;
- (double)subscribeRelatedBaselineImpressionValue;
- (double)subscribeRelatedClickValue;
- (double)subscribeRelatedImpressionValue;
- (double)swipeToArticleHeavyClickMinimumDuration;
- (double)swipeToArticleWeakClickMinimumDuration;
- (double)tappedBaselineClickValue;
- (double)tappedBaselineImpressionValue;
- (double)tappedClickValue;
- (double)tappedImpressionValue;
- (double)topStoriesGroupAggregatesGroupBias;
- (double)topicAutofavoritedMultiplier;
- (double)topicBoostForSourceRelatedFeedBaselineClickValue;
- (double)topicBoostForSourceRelatedFeedBaselineImpressionValue;
- (double)topicBoostForSourceRelatedFeedClickValue;
- (double)topicBoostForSourceRelatedFeedImpressionValue;
- (double)topicDiversityThreshold;
- (double)topicFavoritedMultiplier;
- (double)topicFeedFilterMutedTopics;
- (double)topicGroupSizeMultiplier;
- (double)topicGroupableMultiplier;
- (double)topicScoreWeight;
- (double)topicSpecificityMultiplier;
- (double)trackFinishedBaselineClickValue;
- (double)trackFinishedBaselineImpressionValue;
- (double)trackFinishedClickValue;
- (double)trackFinishedImpressionValue;
- (double)trackListenedBaselineClickValue;
- (double)trackListenedBaselineImpressionValue;
- (double)trackListenedClickValue;
- (double)trackListenedImpressionValue;
- (double)trackVisitedBaselineClickValue;
- (double)trackVisitedBaselineImpressionValue;
- (double)trackVisitedClickValue;
- (double)trackVisitedImpressionValue;
- (double)trendingGroupAggregatesGroupBias;
- (double)uGroupMinimumSubscribedChannelSourceFeedArticleRatio;
- (double)unmuteBaselineClickValue;
- (double)unmuteBaselineImpressionValue;
- (double)unmuteClickValue;
- (double)unmuteImpressionValue;
- (double)unsubscribeBaselineClickValue;
- (double)unsubscribeBaselineImpressionValue;
- (double)unsubscribeClickValue;
- (double)unsubscribeImpressionValue;
- (double)videoComplete25BaselineClickValue;
- (double)videoComplete25BaselineImpressionValue;
- (double)videoComplete25ClickValue;
- (double)videoComplete25ImpressionValue;
- (double)videoComplete50BaselineClickValue;
- (double)videoComplete50BaselineImpressionValue;
- (double)videoComplete50ClickValue;
- (double)videoComplete50ImpressionValue;
- (double)videoComplete75BaselineClickValue;
- (double)videoComplete75BaselineImpressionValue;
- (double)videoComplete75ClickValue;
- (double)videoComplete75ImpressionValue;
- (double)videoCompletePlaybackBaselineClickValue;
- (double)videoCompletePlaybackBaselineImpressionValue;
- (double)videoCompletePlaybackClickValue;
- (double)videoCompletePlaybackImpressionValue;
- (double)videoInitiatePlaybackBaselineClickValue;
- (double)videoInitiatePlaybackBaselineImpressionValue;
- (double)videoInitiatePlaybackClickValue;
- (double)videoInitiatePlaybackImpressionValue;
- (double)visitBaselineClickValue;
- (double)visitBaselineImpressionValue;
- (double)visitClickValue;
- (double)visitImpressionValue;
- (double)weakClickBaselineClickValue;
- (double)weakClickBaselineImpressionValue;
- (double)weakClickClickValue;
- (double)weakClickImpressionValue;
- (id)treatmentDictionary;
- (int64_t)auditionedAutoFavoritesEmitterLimit;
- (int64_t)extraArticlesToShowUser;
- (int64_t)forYouGroupFilteredSubsetCount;
- (int64_t)maxClusterSizeIPad;
- (int64_t)maxClusterSizeIPadAutoFavorite;
- (int64_t)maxClusterSizeIPhone;
- (int64_t)maxClusterSizeIPhoneAutoFavorite;
- (int64_t)maxEvergreenArticlesPerGroup;
- (int64_t)maxExternalSignalEventCount;
- (int64_t)maxIdealClusterSizeIPad;
- (int64_t)maxIdealClusterSizeIPadAutoFavorite;
- (int64_t)maxIdealClusterSizeIPhone;
- (int64_t)maxIdealClusterSizeIPhoneAutoFavorite;
- (int64_t)maxMoreForYouSizeIPad;
- (int64_t)maxMoreForYouSizeIPhone;
- (int64_t)maxNativeAdCountIPad;
- (int64_t)maxNativeAdCountIPadBestOfBundle;
- (int64_t)maxNativeAdCountIPadForYouGroup;
- (int64_t)maxNativeAdCountIPadGreatStoriesYouMissed;
- (int64_t)maxNativeAdCountIPhone;
- (int64_t)maxNativeAdCountIPhoneBestOfBundle;
- (int64_t)maxNativeAdCountIPhoneForYouGroup;
- (int64_t)maxNativeAdCountIPhoneGreatStoriesYouMissed;
- (int64_t)maxNumberOfSuggestions;
- (int64_t)maxNumberOfTotalTopicAndChannelGroups;
- (int64_t)maxPublisherOccurrencesIPad;
- (int64_t)maxPublisherOccurrencesIPadBestOfBundle;
- (int64_t)maxPublisherOccurrencesIPadForYouGroup;
- (int64_t)maxPublisherOccurrencesIPadGreatStoriesYouMissed;
- (int64_t)maxPublisherOccurrencesIPhone;
- (int64_t)maxPublisherOccurrencesIPhoneBestOfBundle;
- (int64_t)maxPublisherOccurrencesIPhoneForYouGroup;
- (int64_t)maxPublisherOccurrencesIPhoneGreatStoriesYouMissed;
- (int64_t)maxUnpaidArticlesIPad;
- (int64_t)maxUnpaidArticlesIPadBestOfBundle;
- (int64_t)maxUnpaidArticlesIPadForYouGroup;
- (int64_t)maxUnpaidArticlesIPadGreatStoriesYouMissed;
- (int64_t)maxUnpaidArticlesIPhone;
- (int64_t)maxUnpaidArticlesIPhoneBestOfBundle;
- (int64_t)maxUnpaidArticlesIPhoneForYouGroup;
- (int64_t)maxUnpaidArticlesIPhoneGreatStoriesYouMissed;
- (int64_t)minBaselineEventsToSubmitUserVector;
- (int64_t)minClusterSizeIPad;
- (int64_t)minClusterSizeIPadAutoFavorite;
- (int64_t)minClusterSizeIPhone;
- (int64_t)minClusterSizeIPhoneAutoFavorite;
- (int64_t)minIdealClusterSizeIPad;
- (int64_t)minIdealClusterSizeIPadAutoFavorite;
- (int64_t)minIdealClusterSizeIPhone;
- (int64_t)minIdealClusterSizeIPhoneAutoFavorite;
- (int64_t)minMoreForYouSizeIPad;
- (int64_t)minMoreForYouSizeIPhone;
- (int64_t)numEventsToDisableDefaultTopics;
- (int64_t)numSubscriptionsToDisableDefaultTopics;
- (int64_t)publisherTopicIDEventCountMinimum;
- (int64_t)thumbnailMinHammingDistance;
- (int64_t)topicDiversityWindowSize;
- (int64_t)trackListenedMinimumDuration;
- (int64_t)trackVisitedMinimumDuration;
- (int64_t)treatmentID;
- (unint64_t)publisherDiversityMaxPublisherCount;
- (unint64_t)publisherDiversityMinPublisherCount;
- (unint64_t)scoringVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setComputeUserVectorWithTabi:(BOOL)a3;
@end

@implementation FCPersonalizationTreatment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowAffinityGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventTopicGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagDateRangeOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagRecentStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagForYouGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventArticlesGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperSectionGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalSectionGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMoreForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperTodayFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleListTagFeedGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowHighlightsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsTopStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsTopicsOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagWidgetOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTodayWidgetOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperMagazineFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalNewsOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowLatestStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowGreatStoriesYouMissedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedIssuesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowBestOfBundleOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationQuaternaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationTertiaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationSecondaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationPrimaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowAudioFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowLegacyAudioFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedIssueOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedArticleOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTopicFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowDefaultOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowAffinityGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventTopicGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagDateRangeTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagRecentStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagForYouGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventArticlesGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperSectionGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalSectionGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMoreForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperTodayFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleListTagFeedGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowHighlightsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsTopStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsTopicsTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagWidgetTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTodayWidgetTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperMagazineFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalNewsTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowLatestStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowGreatStoriesYouMissedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedIssuesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowBestOfBundleTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationQuaternaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationTertiaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationSecondaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationPrimaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowAudioFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowLegacyAudioFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedIssueTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedArticleTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTopicFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowDefaultTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowAffinityGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventTopicGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagDateRangeScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagRecentStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagForYouGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventArticlesGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperSectionGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalSectionGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMoreForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperTodayFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleListTagFeedGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowHighlightsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsTopStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsTopicsScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowNotificationScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagWidgetScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTodayWidgetScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperMagazineFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalNewsScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowLatestStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowGreatStoriesYouMissedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedIssuesScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowBestOfBundleScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationQuaternaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationTertiaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationSecondaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationPrimaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowAudioFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowLegacyAudioFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedIssueScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedArticleScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTopicFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowDefaultScoringConfig, 0);
  objc_storeStrong((id *)&self->_affinityGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventTopicGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagDateRangeOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagRecentStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagForYouGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventArticlesGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_newspaperSectionGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_localSectionGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_moreForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_newspaperTodayFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleListTagFeedGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_highlightsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_sportsTopStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_mySportsTopicsOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagWidgetOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_todayWidgetOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_newspaperMagazineFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_localNewsOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_latestStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_greatStoriesYouMissedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_forYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_curatedIssuesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_curatedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_bestOfBundleOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationQuaternaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationTertiaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationSecondaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationPrimaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_audioFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_legacyAudioFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedIssueOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedArticleOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_topicFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_defaultOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_affinityGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventTopicGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagDateRangeTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagRecentStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagForYouGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventArticlesGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_newspaperSectionGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_localSectionGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_moreForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_newspaperTodayFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleListTagFeedGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_highlightsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_sportsTopStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_mySportsTopicsTopicsConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagWidgetTopicsConfig, 0);
  objc_storeStrong((id *)&self->_todayWidgetTopicsConfig, 0);
  objc_storeStrong((id *)&self->_newspaperMagazineFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_localNewsTopicsConfig, 0);
  objc_storeStrong((id *)&self->_latestStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_greatStoriesYouMissedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_forYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_curatedIssuesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_curatedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_bestOfBundleTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationQuaternaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationTertiaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationSecondaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationPrimaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_audioFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_legacyAudioFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedIssueTopicsConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedArticleTopicsConfig, 0);
  objc_storeStrong((id *)&self->_topicFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_defaultTopicsConfig, 0);
  objc_storeStrong((id *)&self->_sportsTagScoringConfig, 0);
  objc_storeStrong((id *)&self->_defaultTagScoringConfig, 0);
  objc_storeStrong((id *)&self->_affinityGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventTopicGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagDateRangeScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagRecentStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagForYouGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventArticlesGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_newspaperSectionGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_localSectionGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_moreForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_newspaperTodayFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleListTagFeedGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_highlightsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_sportsTopStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_mySportsTopicsScoringConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_notificationScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagWidgetScoringConfig, 0);
  objc_storeStrong((id *)&self->_todayWidgetScoringConfig, 0);
  objc_storeStrong((id *)&self->_newspaperMagazineFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_localNewsScoringConfig, 0);
  objc_storeStrong((id *)&self->_latestStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_greatStoriesYouMissedScoringConfig, 0);
  objc_storeStrong((id *)&self->_forYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_curatedIssuesScoringConfig, 0);
  objc_storeStrong((id *)&self->_curatedScoringConfig, 0);
  objc_storeStrong((id *)&self->_bestOfBundleScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationQuaternaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationTertiaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationSecondaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationPrimaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_audioFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_legacyAudioFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedIssueScoringConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedArticleScoringConfig, 0);
  objc_storeStrong((id *)&self->_topicFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_defaultScoringConfig, 0);
  objc_storeStrong((id *)&self->_treatmentDictionary, 0);
  objc_storeStrong((id *)&self->_pbTreatment, 0);
}

- (FCPersonalizationScoringConfig)defaultScoringConfig
{
  return self->_defaultScoringConfig;
}

- (FCPersonalizationTreatment)initWithPersonalizationTreatmentDictionary:(id)a3
{
  id v5 = a3;
  v1314.receiver = self;
  v1314.super_class = (Class)FCPersonalizationTreatment;
  v6 = [(FCPersonalizationTreatment *)&v1314 init];
  v7 = v6;
  if (v6)
  {
    pbTreatment = v6->_pbTreatment;
    v6->_pbTreatment = 0;

    objc_storeStrong((id *)&v7->_treatmentDictionary, a3);
    v7->_treatmentID = FCAppConfigurationIntegerValue(v5, @"treatmentId", 0);
    v9 = [FCPersonalizationScoringConfig alloc];
    v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"defaultScoringConfig", 0);
    uint64_t v11 = [(FCPersonalizationScoringConfig *)v9 initWithConfigDictionary:v10];
    defaultScoringConfig = v7->_defaultScoringConfig;
    v7->_defaultScoringConfig = (FCPersonalizationScoringConfig *)v11;

    v13 = [FCPersonalizationScoringConfig alloc];
    v14 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"topicFeedScoringConfig", 0);
    v15 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v16 = [(FCPersonalizationScoringConfig *)v13 initWithConfigDictionary:v14 defaultConfig:v15];
    topicFeedScoringConfig = v7->_topicFeedScoringConfig;
    v7->_topicFeedScoringConfig = (FCPersonalizationScoringConfig *)v16;

    v18 = [FCPersonalizationScoringConfig alloc];
    v19 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"magazineFeedArticleScoringConfig", 0);
    v20 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v21 = [(FCPersonalizationScoringConfig *)v18 initWithConfigDictionary:v19 defaultConfig:v20];
    magazineFeedArticleScoringConfig = v7->_magazineFeedArticleScoringConfig;
    v7->_magazineFeedArticleScoringConfig = (FCPersonalizationScoringConfig *)v21;

    v23 = [FCPersonalizationScoringConfig alloc];
    v24 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"magazineFeedIssueScoringConfig", 0);
    v25 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v26 = [(FCPersonalizationScoringConfig *)v23 initWithConfigDictionary:v24 defaultConfig:v25];
    magazineFeedIssueScoringConfig = v7->_magazineFeedIssueScoringConfig;
    v7->_magazineFeedIssueScoringConfig = (FCPersonalizationScoringConfig *)v26;

    v28 = [FCPersonalizationScoringConfig alloc];
    v29 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"audioFeedScoringConfig", 0);
    v30 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v31 = [(FCPersonalizationScoringConfig *)v28 initWithConfigDictionary:v29 defaultConfig:v30];
    legacyAudioFeedScoringConfig = v7->_legacyAudioFeedScoringConfig;
    v7->_legacyAudioFeedScoringConfig = (FCPersonalizationScoringConfig *)v31;

    v33 = [FCPersonalizationScoringConfig alloc];
    v34 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"audioFeed2ScoringConfig", 0);
    uint64_t v35 = [(FCPersonalizationScoringConfig *)v33 initWithConfigDictionary:v34 defaultConfig:v7->_legacyAudioFeedScoringConfig];
    audioFeedScoringConfig = v7->_audioFeedScoringConfig;
    v7->_audioFeedScoringConfig = (FCPersonalizationScoringConfig *)v35;

    v37 = [FCPersonalizationScoringConfig alloc];
    v38 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleRecirculationPrimaryScoringConfig", 0);
    v39 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v40 = [(FCPersonalizationScoringConfig *)v37 initWithConfigDictionary:v38 defaultConfig:v39];
    articleRecirculationPrimaryScoringConfig = v7->_articleRecirculationPrimaryScoringConfig;
    v7->_articleRecirculationPrimaryScoringConfig = (FCPersonalizationScoringConfig *)v40;

    v42 = [FCPersonalizationScoringConfig alloc];
    v43 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleRecirculationSecondaryScoringConfig", 0);
    v44 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v45 = [(FCPersonalizationScoringConfig *)v42 initWithConfigDictionary:v43 defaultConfig:v44];
    articleRecirculationSecondaryScoringConfig = v7->_articleRecirculationSecondaryScoringConfig;
    v7->_articleRecirculationSecondaryScoringConfig = (FCPersonalizationScoringConfig *)v45;

    v47 = [FCPersonalizationScoringConfig alloc];
    v48 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleRecirculationTertiaryScoringConfig", 0);
    v49 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v50 = [(FCPersonalizationScoringConfig *)v47 initWithConfigDictionary:v48 defaultConfig:v49];
    articleRecirculationTertiaryScoringConfig = v7->_articleRecirculationTertiaryScoringConfig;
    v7->_articleRecirculationTertiaryScoringConfig = (FCPersonalizationScoringConfig *)v50;

    v52 = [FCPersonalizationScoringConfig alloc];
    v53 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleRecirculationQuaternaryScoringConfig", 0);
    v54 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v55 = [(FCPersonalizationScoringConfig *)v52 initWithConfigDictionary:v53 defaultConfig:v54];
    articleRecirculationQuaternaryScoringConfig = v7->_articleRecirculationQuaternaryScoringConfig;
    v7->_articleRecirculationQuaternaryScoringConfig = (FCPersonalizationScoringConfig *)v55;

    v57 = [FCPersonalizationScoringConfig alloc];
    v58 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"bestOfBundleScoringConfig", 0);
    v59 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v60 = [(FCPersonalizationScoringConfig *)v57 initWithConfigDictionary:v58 defaultConfig:v59];
    bestOfBundleScoringConfig = v7->_bestOfBundleScoringConfig;
    v7->_bestOfBundleScoringConfig = (FCPersonalizationScoringConfig *)v60;

    v62 = [FCPersonalizationScoringConfig alloc];
    v63 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"curatedScoringConfig", 0);
    v64 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v65 = [(FCPersonalizationScoringConfig *)v62 initWithConfigDictionary:v63 defaultConfig:v64];
    curatedScoringConfig = v7->_curatedScoringConfig;
    v7->_curatedScoringConfig = (FCPersonalizationScoringConfig *)v65;

    v67 = [FCPersonalizationScoringConfig alloc];
    v68 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"curatedIssuesScoringConfig", 0);
    v69 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v70 = [(FCPersonalizationScoringConfig *)v67 initWithConfigDictionary:v68 defaultConfig:v69];
    curatedIssuesScoringConfig = v7->_curatedIssuesScoringConfig;
    v7->_curatedIssuesScoringConfig = (FCPersonalizationScoringConfig *)v70;

    v72 = [FCPersonalizationScoringConfig alloc];
    v73 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"forYouScoringConfig", 0);
    v74 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v75 = [(FCPersonalizationScoringConfig *)v72 initWithConfigDictionary:v73 defaultConfig:v74];
    forYouScoringConfig = v7->_forYouScoringConfig;
    v7->_forYouScoringConfig = (FCPersonalizationScoringConfig *)v75;

    v77 = [FCPersonalizationScoringConfig alloc];
    v78 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"greatStoriesYouMissedScoringConfig", 0);
    v79 = [(FCPersonalizationTreatment *)v7 forYouScoringConfig];
    uint64_t v80 = [(FCPersonalizationScoringConfig *)v77 initWithConfigDictionary:v78 defaultConfig:v79];
    greatStoriesYouMissedScoringConfig = v7->_greatStoriesYouMissedScoringConfig;
    v7->_greatStoriesYouMissedScoringConfig = (FCPersonalizationScoringConfig *)v80;

    v82 = [FCPersonalizationScoringConfig alloc];
    v83 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"latestStoriesScoringConfig", 0);
    v84 = [(FCPersonalizationTreatment *)v7 forYouScoringConfig];
    uint64_t v85 = [(FCPersonalizationScoringConfig *)v82 initWithConfigDictionary:v83 defaultConfig:v84];
    latestStoriesScoringConfig = v7->_latestStoriesScoringConfig;
    v7->_latestStoriesScoringConfig = (FCPersonalizationScoringConfig *)v85;

    v87 = [FCPersonalizationScoringConfig alloc];
    v88 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"localNewsScoringConfig", 0);
    v89 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v90 = [(FCPersonalizationScoringConfig *)v87 initWithConfigDictionary:v88 defaultConfig:v89];
    localNewsScoringConfig = v7->_localNewsScoringConfig;
    v7->_localNewsScoringConfig = (FCPersonalizationScoringConfig *)v90;

    v92 = [FCPersonalizationScoringConfig alloc];
    v93 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"newspaperMagazineFeedScoringConfig", 0);
    v94 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v95 = [(FCPersonalizationScoringConfig *)v92 initWithConfigDictionary:v93 defaultConfig:v94];
    newspaperMagazineFeedScoringConfig = v7->_newspaperMagazineFeedScoringConfig;
    v7->_newspaperMagazineFeedScoringConfig = (FCPersonalizationScoringConfig *)v95;

    v97 = [FCPersonalizationScoringConfig alloc];
    v98 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"todayWidgetScoringConfig", 0);
    v99 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v100 = [(FCPersonalizationScoringConfig *)v97 initWithConfigDictionary:v98 defaultConfig:v99];
    todayWidgetScoringConfig = v7->_todayWidgetScoringConfig;
    v7->_todayWidgetScoringConfig = (FCPersonalizationScoringConfig *)v100;

    v102 = [FCPersonalizationScoringConfig alloc];
    v103 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagWidgetScoringConfig", 0);
    v104 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v105 = [(FCPersonalizationScoringConfig *)v102 initWithConfigDictionary:v103 defaultConfig:v104];
    tagWidgetScoringConfig = v7->_tagWidgetScoringConfig;
    v7->_tagWidgetScoringConfig = (FCPersonalizationScoringConfig *)v105;

    v107 = [FCPersonalizationScoringConfig alloc];
    v108 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"notificationScoringConfig", 0);
    v109 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v110 = [(FCPersonalizationScoringConfig *)v107 initWithConfigDictionary:v108 defaultConfig:v109];
    notificationScoringConfig = v7->_notificationScoringConfig;
    v7->_notificationScoringConfig = (FCPersonalizationScoringConfig *)v110;

    v112 = [FCPersonalizationScoringConfig alloc];
    v113 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"mySportsGroupScoringConfig", 0);
    v114 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v115 = [(FCPersonalizationScoringConfig *)v112 initWithConfigDictionary:v113 defaultConfig:v114];
    mySportsGroupScoringConfig = v7->_mySportsGroupScoringConfig;
    v7->_mySportsGroupScoringConfig = (FCPersonalizationScoringConfig *)v115;

    v117 = [FCPersonalizationScoringConfig alloc];
    v118 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"mySportsGroupForYouScoringConfig", 0);
    v119 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v120 = [(FCPersonalizationScoringConfig *)v117 initWithConfigDictionary:v118 defaultConfig:v119];
    mySportsGroupForYouScoringConfig = v7->_mySportsGroupForYouScoringConfig;
    v7->_mySportsGroupForYouScoringConfig = (FCPersonalizationScoringConfig *)v120;

    v122 = [FCPersonalizationScoringConfig alloc];
    v123 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"mySportsTopicsScoringConfig", 0);
    v124 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v125 = [(FCPersonalizationScoringConfig *)v122 initWithConfigDictionary:v123 defaultConfig:v124];
    mySportsTopicsScoringConfig = v7->_mySportsTopicsScoringConfig;
    v7->_mySportsTopicsScoringConfig = (FCPersonalizationScoringConfig *)v125;

    v127 = [FCPersonalizationScoringConfig alloc];
    v128 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"sportsTopStoriesScoringConfig", 0);
    v129 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v130 = [(FCPersonalizationScoringConfig *)v127 initWithConfigDictionary:v128 defaultConfig:v129];
    sportsTopStoriesScoringConfig = v7->_sportsTopStoriesScoringConfig;
    v7->_sportsTopStoriesScoringConfig = (FCPersonalizationScoringConfig *)v130;

    v132 = [FCPersonalizationScoringConfig alloc];
    v133 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"introToSportsGroupScoringConfig", 0);
    v134 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v135 = [(FCPersonalizationScoringConfig *)v132 initWithConfigDictionary:v133 defaultConfig:v134];
    introToSportsGroupScoringConfig = v7->_introToSportsGroupScoringConfig;
    v7->_introToSportsGroupScoringConfig = (FCPersonalizationScoringConfig *)v135;

    v137 = [FCPersonalizationScoringConfig alloc];
    v138 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"introToSportsGroupForYouScoringConfig", 0);
    v139 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v140 = [(FCPersonalizationScoringConfig *)v137 initWithConfigDictionary:v138 defaultConfig:v139];
    introToSportsGroupForYouScoringConfig = v7->_introToSportsGroupForYouScoringConfig;
    v7->_introToSportsGroupForYouScoringConfig = (FCPersonalizationScoringConfig *)v140;

    v142 = [FCPersonalizationScoringConfig alloc];
    v143 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"highlightsGroupScoringConfig", 0);
    v144 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v145 = [(FCPersonalizationScoringConfig *)v142 initWithConfigDictionary:v143 defaultConfig:v144];
    highlightsGroupScoringConfig = v7->_highlightsGroupScoringConfig;
    v7->_highlightsGroupScoringConfig = (FCPersonalizationScoringConfig *)v145;

    v147 = [FCPersonalizationScoringConfig alloc];
    v148 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleListTagFeedGroupScoringConfig", 0);
    v149 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v150 = [(FCPersonalizationScoringConfig *)v147 initWithConfigDictionary:v148 defaultConfig:v149];
    articleListTagFeedGroupScoringConfig = v7->_articleListTagFeedGroupScoringConfig;
    v7->_articleListTagFeedGroupScoringConfig = (FCPersonalizationScoringConfig *)v150;

    v152 = [FCPersonalizationScoringConfig alloc];
    v153 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagFeedScoringConfig", 0);
    v154 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v155 = [(FCPersonalizationScoringConfig *)v152 initWithConfigDictionary:v153 defaultConfig:v154];
    tagFeedScoringConfig = v7->_tagFeedScoringConfig;
    v7->_tagFeedScoringConfig = (FCPersonalizationScoringConfig *)v155;

    v157 = [FCPersonalizationScoringConfig alloc];
    v158 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"newspaperTodayFeedScoringConfig", 0);
    v159 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v160 = [(FCPersonalizationScoringConfig *)v157 initWithConfigDictionary:v158 defaultConfig:v159];
    newspaperTodayFeedScoringConfig = v7->_newspaperTodayFeedScoringConfig;
    v7->_newspaperTodayFeedScoringConfig = (FCPersonalizationScoringConfig *)v160;

    v162 = [FCPersonalizationScoringConfig alloc];
    v163 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"moreForYouScoringConfig", 0);
    v164 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v165 = [(FCPersonalizationScoringConfig *)v162 initWithConfigDictionary:v163 defaultConfig:v164];
    moreForYouScoringConfig = v7->_moreForYouScoringConfig;
    v7->_moreForYouScoringConfig = (FCPersonalizationScoringConfig *)v165;

    v167 = [FCPersonalizationScoringConfig alloc];
    v168 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"localSectionGroupScoringConfig", 0);
    v169 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v170 = [(FCPersonalizationScoringConfig *)v167 initWithConfigDictionary:v168 defaultConfig:v169];
    localSectionGroupScoringConfig = v7->_localSectionGroupScoringConfig;
    v7->_localSectionGroupScoringConfig = (FCPersonalizationScoringConfig *)v170;

    v172 = [FCPersonalizationScoringConfig alloc];
    v173 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"newspaperSectionGroupScoringConfig", 0);
    v174 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v175 = [(FCPersonalizationScoringConfig *)v172 initWithConfigDictionary:v173 defaultConfig:v174];
    newspaperSectionGroupScoringConfig = v7->_newspaperSectionGroupScoringConfig;
    v7->_newspaperSectionGroupScoringConfig = (FCPersonalizationScoringConfig *)v175;

    v177 = [FCPersonalizationScoringConfig alloc];
    v178 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"sportsEventArticlesGroupScoringConfig", 0);
    v179 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v180 = [(FCPersonalizationScoringConfig *)v177 initWithConfigDictionary:v178 defaultConfig:v179];
    sportsEventArticlesGroupScoringConfig = v7->_sportsEventArticlesGroupScoringConfig;
    v7->_sportsEventArticlesGroupScoringConfig = (FCPersonalizationScoringConfig *)v180;

    v182 = [FCPersonalizationScoringConfig alloc];
    v183 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagForYouGroupScoringConfig", 0);
    v184 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v185 = [(FCPersonalizationScoringConfig *)v182 initWithConfigDictionary:v183 defaultConfig:v184];
    tagForYouGroupScoringConfig = v7->_tagForYouGroupScoringConfig;
    v7->_tagForYouGroupScoringConfig = (FCPersonalizationScoringConfig *)v185;

    v187 = [FCPersonalizationScoringConfig alloc];
    v188 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagRecentStoriesScoringConfig", 0);
    v189 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v190 = [(FCPersonalizationScoringConfig *)v187 initWithConfigDictionary:v188 defaultConfig:v189];
    tagRecentStoriesScoringConfig = v7->_tagRecentStoriesScoringConfig;
    v7->_tagRecentStoriesScoringConfig = (FCPersonalizationScoringConfig *)v190;

    v192 = [FCPersonalizationScoringConfig alloc];
    v193 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagDateRangeScoringConfig", 0);
    v194 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v195 = [(FCPersonalizationScoringConfig *)v192 initWithConfigDictionary:v193 defaultConfig:v194];
    tagDateRangeScoringConfig = v7->_tagDateRangeScoringConfig;
    v7->_tagDateRangeScoringConfig = (FCPersonalizationScoringConfig *)v195;

    v197 = [FCPersonalizationScoringConfig alloc];
    v198 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"sportsEventTopicGroupScoringConfig", 0);
    v199 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v200 = [(FCPersonalizationScoringConfig *)v197 initWithConfigDictionary:v198 defaultConfig:v199];
    sportsEventTopicGroupScoringConfig = v7->_sportsEventTopicGroupScoringConfig;
    v7->_sportsEventTopicGroupScoringConfig = (FCPersonalizationScoringConfig *)v200;

    v202 = [FCPersonalizationScoringConfig alloc];
    v203 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"affinityGroupScoringConfig", 0);
    v204 = [(FCPersonalizationTreatment *)v7 defaultScoringConfig];
    uint64_t v205 = [(FCPersonalizationScoringConfig *)v202 initWithConfigDictionary:v203 defaultConfig:v204];
    affinityGroupScoringConfig = v7->_affinityGroupScoringConfig;
    v7->_affinityGroupScoringConfig = (FCPersonalizationScoringConfig *)v205;

    v207 = [FCPersonalizationTopicsConfig alloc];
    v208 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"defaultTopicsConfig", 0);
    uint64_t v209 = [(FCPersonalizationTopicsConfig *)v207 initWithConfig:v208];
    defaultTopicsConfig = v7->_defaultTopicsConfig;
    v7->_defaultTopicsConfig = (FCPersonalizationTopicsConfig *)v209;

    v211 = [FCPersonalizationTopicsConfig alloc];
    v212 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"topicFeedTopicsConfig", 0);
    v213 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v214 = [(FCPersonalizationTopicsConfig *)v211 initWithConfig:v212 defaultConfig:v213];
    topicFeedTopicsConfig = v7->_topicFeedTopicsConfig;
    v7->_topicFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v214;

    v216 = [FCPersonalizationTopicsConfig alloc];
    v217 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"magazineFeedArticleTopicsConfig", 0);
    v218 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v219 = [(FCPersonalizationTopicsConfig *)v216 initWithConfig:v217 defaultConfig:v218];
    magazineFeedArticleTopicsConfig = v7->_magazineFeedArticleTopicsConfig;
    v7->_magazineFeedArticleTopicsConfig = (FCPersonalizationTopicsConfig *)v219;

    v221 = [FCPersonalizationTopicsConfig alloc];
    v222 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"magazineFeedIssueTopicsConfig", 0);
    v223 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v224 = [(FCPersonalizationTopicsConfig *)v221 initWithConfig:v222 defaultConfig:v223];
    magazineFeedIssueTopicsConfig = v7->_magazineFeedIssueTopicsConfig;
    v7->_magazineFeedIssueTopicsConfig = (FCPersonalizationTopicsConfig *)v224;

    v226 = [FCPersonalizationTopicsConfig alloc];
    v227 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"audioFeedTopicsConfig", 0);
    v228 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v229 = [(FCPersonalizationTopicsConfig *)v226 initWithConfig:v227 defaultConfig:v228];
    legacyAudioFeedTopicsConfig = v7->_legacyAudioFeedTopicsConfig;
    v7->_legacyAudioFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v229;

    v231 = [FCPersonalizationTopicsConfig alloc];
    v232 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"audioFeed2TopicsConfig", 0);
    uint64_t v233 = [(FCPersonalizationTopicsConfig *)v231 initWithConfig:v232 defaultConfig:v7->_legacyAudioFeedTopicsConfig];
    audioFeedTopicsConfig = v7->_audioFeedTopicsConfig;
    v7->_audioFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v233;

    v235 = [FCPersonalizationTopicsConfig alloc];
    v236 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"articleRecirculationPrimaryTopicsConfig", 0);
    v237 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v238 = [(FCPersonalizationTopicsConfig *)v235 initWithConfig:v236 defaultConfig:v237];
    articleRecirculationPrimaryTopicsConfig = v7->_articleRecirculationPrimaryTopicsConfig;
    v7->_articleRecirculationPrimaryTopicsConfig = (FCPersonalizationTopicsConfig *)v238;

    v240 = [FCPersonalizationTopicsConfig alloc];
    v241 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"articleRecirculationSecondaryTopicsConfig", 0);
    v242 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v243 = [(FCPersonalizationTopicsConfig *)v240 initWithConfig:v241 defaultConfig:v242];
    articleRecirculationSecondaryTopicsConfig = v7->_articleRecirculationSecondaryTopicsConfig;
    v7->_articleRecirculationSecondaryTopicsConfig = (FCPersonalizationTopicsConfig *)v243;

    v245 = [FCPersonalizationTopicsConfig alloc];
    v246 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"articleRecirculationTertiaryTopicsConfig", 0);
    v247 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v248 = [(FCPersonalizationTopicsConfig *)v245 initWithConfig:v246 defaultConfig:v247];
    articleRecirculationTertiaryTopicsConfig = v7->_articleRecirculationTertiaryTopicsConfig;
    v7->_articleRecirculationTertiaryTopicsConfig = (FCPersonalizationTopicsConfig *)v248;

    v250 = [FCPersonalizationTopicsConfig alloc];
    v251 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"articleRecirculationQuaternaryTopicsConfig", 0);
    v252 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v253 = [(FCPersonalizationTopicsConfig *)v250 initWithConfig:v251 defaultConfig:v252];
    articleRecirculationQuaternaryTopicsConfig = v7->_articleRecirculationQuaternaryTopicsConfig;
    v7->_articleRecirculationQuaternaryTopicsConfig = (FCPersonalizationTopicsConfig *)v253;

    v255 = [FCPersonalizationTopicsConfig alloc];
    v256 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"bestOfBundleTopicsConfig", 0);
    v257 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v258 = [(FCPersonalizationTopicsConfig *)v255 initWithConfig:v256 defaultConfig:v257];
    bestOfBundleTopicsConfig = v7->_bestOfBundleTopicsConfig;
    v7->_bestOfBundleTopicsConfig = (FCPersonalizationTopicsConfig *)v258;

    v260 = [FCPersonalizationTopicsConfig alloc];
    v261 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"curatedTopicsConfig", 0);
    v262 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v263 = [(FCPersonalizationTopicsConfig *)v260 initWithConfig:v261 defaultConfig:v262];
    curatedTopicsConfig = v7->_curatedTopicsConfig;
    v7->_curatedTopicsConfig = (FCPersonalizationTopicsConfig *)v263;

    v265 = [FCPersonalizationTopicsConfig alloc];
    v266 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"curatedIssuesTopicsConfig", 0);
    v267 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v268 = [(FCPersonalizationTopicsConfig *)v265 initWithConfig:v266 defaultConfig:v267];
    curatedIssuesTopicsConfig = v7->_curatedIssuesTopicsConfig;
    v7->_curatedIssuesTopicsConfig = (FCPersonalizationTopicsConfig *)v268;

    v270 = [FCPersonalizationTopicsConfig alloc];
    v271 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"forYouTopicsConfig", 0);
    v272 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v273 = [(FCPersonalizationTopicsConfig *)v270 initWithConfig:v271 defaultConfig:v272];
    forYouTopicsConfig = v7->_forYouTopicsConfig;
    v7->_forYouTopicsConfig = (FCPersonalizationTopicsConfig *)v273;

    v275 = [FCPersonalizationTopicsConfig alloc];
    v276 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"greatStoriesYouMissedTopicsConfig", 0);
    v277 = [(FCPersonalizationTreatment *)v7 forYouTopicsConfig];
    uint64_t v278 = [(FCPersonalizationTopicsConfig *)v275 initWithConfig:v276 defaultConfig:v277];
    greatStoriesYouMissedTopicsConfig = v7->_greatStoriesYouMissedTopicsConfig;
    v7->_greatStoriesYouMissedTopicsConfig = (FCPersonalizationTopicsConfig *)v278;

    v280 = [FCPersonalizationTopicsConfig alloc];
    v281 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"latestStoriesTopicsConfig", 0);
    v282 = [(FCPersonalizationTreatment *)v7 forYouTopicsConfig];
    uint64_t v283 = [(FCPersonalizationTopicsConfig *)v280 initWithConfig:v281 defaultConfig:v282];
    latestStoriesTopicsConfig = v7->_latestStoriesTopicsConfig;
    v7->_latestStoriesTopicsConfig = (FCPersonalizationTopicsConfig *)v283;

    v285 = [FCPersonalizationTopicsConfig alloc];
    v286 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"localNewsTopicsConfig", 0);
    v287 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v288 = [(FCPersonalizationTopicsConfig *)v285 initWithConfig:v286 defaultConfig:v287];
    localNewsTopicsConfig = v7->_localNewsTopicsConfig;
    v7->_localNewsTopicsConfig = (FCPersonalizationTopicsConfig *)v288;

    v290 = [FCPersonalizationTopicsConfig alloc];
    v291 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"newspaperMagazineFeedTopicsConfig", 0);
    v292 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v293 = [(FCPersonalizationTopicsConfig *)v290 initWithConfig:v291 defaultConfig:v292];
    newspaperMagazineFeedTopicsConfig = v7->_newspaperMagazineFeedTopicsConfig;
    v7->_newspaperMagazineFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v293;

    v295 = [FCPersonalizationTopicsConfig alloc];
    v296 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"todayWidgetTopicsConfig", 0);
    v297 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v298 = [(FCPersonalizationTopicsConfig *)v295 initWithConfig:v296 defaultConfig:v297];
    todayWidgetTopicsConfig = v7->_todayWidgetTopicsConfig;
    v7->_todayWidgetTopicsConfig = (FCPersonalizationTopicsConfig *)v298;

    v300 = [FCPersonalizationTopicsConfig alloc];
    v301 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"tagWidgetTopicsConfig", 0);
    v302 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v303 = [(FCPersonalizationTopicsConfig *)v300 initWithConfig:v301 defaultConfig:v302];
    tagWidgetTopicsConfig = v7->_tagWidgetTopicsConfig;
    v7->_tagWidgetTopicsConfig = (FCPersonalizationTopicsConfig *)v303;

    v305 = [FCPersonalizationTopicsConfig alloc];
    v306 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"mySportsGroupTopicsConfig", 0);
    v307 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v308 = [(FCPersonalizationTopicsConfig *)v305 initWithConfig:v306 defaultConfig:v307];
    mySportsGroupTopicsConfig = v7->_mySportsGroupTopicsConfig;
    v7->_mySportsGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v308;

    v310 = [FCPersonalizationTopicsConfig alloc];
    v311 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"mySportsGroupForYouTopicsConfig", 0);
    v312 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v313 = [(FCPersonalizationTopicsConfig *)v310 initWithConfig:v311 defaultConfig:v312];
    mySportsGroupForYouTopicsConfig = v7->_mySportsGroupForYouTopicsConfig;
    v7->_mySportsGroupForYouTopicsConfig = (FCPersonalizationTopicsConfig *)v313;

    v315 = [FCPersonalizationTopicsConfig alloc];
    v316 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"mySportsTopicsTopicsConfig", 0);
    v317 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v318 = [(FCPersonalizationTopicsConfig *)v315 initWithConfig:v316 defaultConfig:v317];
    mySportsTopicsTopicsConfig = v7->_mySportsTopicsTopicsConfig;
    v7->_mySportsTopicsTopicsConfig = (FCPersonalizationTopicsConfig *)v318;

    v320 = [FCPersonalizationTopicsConfig alloc];
    v321 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"sportsTopStoriesTopicsConfig", 0);
    v322 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v323 = [(FCPersonalizationTopicsConfig *)v320 initWithConfig:v321 defaultConfig:v322];
    sportsTopStoriesTopicsConfig = v7->_sportsTopStoriesTopicsConfig;
    v7->_sportsTopStoriesTopicsConfig = (FCPersonalizationTopicsConfig *)v323;

    v325 = [FCPersonalizationTopicsConfig alloc];
    v326 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"introToSportsGroupTopicsConfig", 0);
    v327 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v328 = [(FCPersonalizationTopicsConfig *)v325 initWithConfig:v326 defaultConfig:v327];
    introToSportsGroupTopicsConfig = v7->_introToSportsGroupTopicsConfig;
    v7->_introToSportsGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v328;

    v330 = [FCPersonalizationTopicsConfig alloc];
    v331 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"introToSportsGroupForYouTopicsConfig", 0);
    v332 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v333 = [(FCPersonalizationTopicsConfig *)v330 initWithConfig:v331 defaultConfig:v332];
    introToSportsGroupForYouTopicsConfig = v7->_introToSportsGroupForYouTopicsConfig;
    v7->_introToSportsGroupForYouTopicsConfig = (FCPersonalizationTopicsConfig *)v333;

    v335 = [FCPersonalizationTopicsConfig alloc];
    v336 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"highlightsGroupTopicsConfig", 0);
    v337 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v338 = [(FCPersonalizationTopicsConfig *)v335 initWithConfig:v336 defaultConfig:v337];
    highlightsGroupTopicsConfig = v7->_highlightsGroupTopicsConfig;
    v7->_highlightsGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v338;

    v340 = [FCPersonalizationTopicsConfig alloc];
    v341 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"articleListTagFeedGroupTopicsConfig", 0);
    v342 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v343 = [(FCPersonalizationTopicsConfig *)v340 initWithConfig:v341 defaultConfig:v342];
    articleListTagFeedGroupTopicsConfig = v7->_articleListTagFeedGroupTopicsConfig;
    v7->_articleListTagFeedGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v343;

    v345 = [FCPersonalizationTopicsConfig alloc];
    v346 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"tagFeedTopicsConfig", 0);
    v347 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v348 = [(FCPersonalizationTopicsConfig *)v345 initWithConfig:v346 defaultConfig:v347];
    tagFeedTopicsConfig = v7->_tagFeedTopicsConfig;
    v7->_tagFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v348;

    v350 = [FCPersonalizationTopicsConfig alloc];
    v351 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"newspaperTodayFeedTopicsConfig", 0);
    v352 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v353 = [(FCPersonalizationTopicsConfig *)v350 initWithConfig:v351 defaultConfig:v352];
    newspaperTodayFeedTopicsConfig = v7->_newspaperTodayFeedTopicsConfig;
    v7->_newspaperTodayFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v353;

    v355 = [FCPersonalizationTopicsConfig alloc];
    v356 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"moreForYouTopicsConfig", 0);
    v357 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v358 = [(FCPersonalizationTopicsConfig *)v355 initWithConfig:v356 defaultConfig:v357];
    moreForYouTopicsConfig = v7->_moreForYouTopicsConfig;
    v7->_moreForYouTopicsConfig = (FCPersonalizationTopicsConfig *)v358;

    v360 = [FCPersonalizationTopicsConfig alloc];
    v361 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"localSectionGroupTopicsConfig", 0);
    v362 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v363 = [(FCPersonalizationTopicsConfig *)v360 initWithConfig:v361 defaultConfig:v362];
    localSectionGroupTopicsConfig = v7->_localSectionGroupTopicsConfig;
    v7->_localSectionGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v363;

    v365 = [FCPersonalizationTopicsConfig alloc];
    v366 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"newspaperSectionGroupTopicsConfig", 0);
    v367 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v368 = [(FCPersonalizationTopicsConfig *)v365 initWithConfig:v366 defaultConfig:v367];
    newspaperSectionGroupTopicsConfig = v7->_newspaperSectionGroupTopicsConfig;
    v7->_newspaperSectionGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v368;

    v370 = [FCPersonalizationTopicsConfig alloc];
    v371 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"sportsEventArticlesGroupTopicsConfig", 0);
    v372 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v373 = [(FCPersonalizationTopicsConfig *)v370 initWithConfig:v371 defaultConfig:v372];
    sportsEventArticlesGroupTopicsConfig = v7->_sportsEventArticlesGroupTopicsConfig;
    v7->_sportsEventArticlesGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v373;

    v375 = [FCPersonalizationTopicsConfig alloc];
    v376 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"tagForYouGroupTopicsConfig", 0);
    v377 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v378 = [(FCPersonalizationTopicsConfig *)v375 initWithConfig:v376 defaultConfig:v377];
    tagForYouGroupTopicsConfig = v7->_tagForYouGroupTopicsConfig;
    v7->_tagForYouGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v378;

    v380 = [FCPersonalizationTopicsConfig alloc];
    v381 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"tagRecentStoriesTopicsConfig", 0);
    v382 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v383 = [(FCPersonalizationTopicsConfig *)v380 initWithConfig:v381 defaultConfig:v382];
    tagRecentStoriesTopicsConfig = v7->_tagRecentStoriesTopicsConfig;
    v7->_tagRecentStoriesTopicsConfig = (FCPersonalizationTopicsConfig *)v383;

    v385 = [FCPersonalizationTopicsConfig alloc];
    v386 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"tagDateRangeTopicsConfig", 0);
    v387 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v388 = [(FCPersonalizationTopicsConfig *)v385 initWithConfig:v386 defaultConfig:v387];
    tagDateRangeTopicsConfig = v7->_tagDateRangeTopicsConfig;
    v7->_tagDateRangeTopicsConfig = (FCPersonalizationTopicsConfig *)v388;

    v390 = [FCPersonalizationTopicsConfig alloc];
    v391 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"sportsEventTopicGroupTopicsConfig", 0);
    v392 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v393 = [(FCPersonalizationTopicsConfig *)v390 initWithConfig:v391 defaultConfig:v392];
    sportsEventTopicGroupTopicsConfig = v7->_sportsEventTopicGroupTopicsConfig;
    v7->_sportsEventTopicGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v393;

    v395 = [FCPersonalizationTopicsConfig alloc];
    v396 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"affinityGroupTopicsConfig", 0);
    v397 = [(FCPersonalizationTreatment *)v7 defaultTopicsConfig];
    uint64_t v398 = [(FCPersonalizationTopicsConfig *)v395 initWithConfig:v396 defaultConfig:v397];
    affinityGroupTopicsConfig = v7->_affinityGroupTopicsConfig;
    v7->_affinityGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v398;

    v400 = [FCPersonalizationOntologyLevelConfig alloc];
    v401 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"defaultOntologyLevelConfig", 0);
    uint64_t v402 = [(FCPersonalizationOntologyLevelConfig *)v400 initWithConfig:v401];
    defaultOntologyLevelConfig = v7->_defaultOntologyLevelConfig;
    v7->_defaultOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v402;

    v404 = [FCPersonalizationOntologyLevelConfig alloc];
    v405 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"topicFeedOntologyLevelConfig", 0);
    v406 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v407 = [(FCPersonalizationOntologyLevelConfig *)v404 initWithConfig:v405 defaultConfig:v406];
    topicFeedOntologyLevelConfig = v7->_topicFeedOntologyLevelConfig;
    v7->_topicFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v407;

    v409 = [FCPersonalizationOntologyLevelConfig alloc];
    v410 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"magazineFeedArticleOntologyLevelConfig", 0);
    v411 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v412 = [(FCPersonalizationOntologyLevelConfig *)v409 initWithConfig:v410 defaultConfig:v411];
    magazineFeedArticleOntologyLevelConfig = v7->_magazineFeedArticleOntologyLevelConfig;
    v7->_magazineFeedArticleOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v412;

    v414 = [FCPersonalizationOntologyLevelConfig alloc];
    v415 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"magazineFeedIssueOntologyLevelConfig", 0);
    v416 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v417 = [(FCPersonalizationOntologyLevelConfig *)v414 initWithConfig:v415 defaultConfig:v416];
    magazineFeedIssueOntologyLevelConfig = v7->_magazineFeedIssueOntologyLevelConfig;
    v7->_magazineFeedIssueOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v417;

    v419 = [FCPersonalizationOntologyLevelConfig alloc];
    v420 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"audioFeedOntologyLevelConfig", 0);
    v421 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v422 = [(FCPersonalizationOntologyLevelConfig *)v419 initWithConfig:v420 defaultConfig:v421];
    legacyAudioFeedOntologyLevelConfig = v7->_legacyAudioFeedOntologyLevelConfig;
    v7->_legacyAudioFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v422;

    v424 = [FCPersonalizationOntologyLevelConfig alloc];
    v425 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"audioFeed2OntologyLevelConfig", 0);
    uint64_t v426 = [(FCPersonalizationOntologyLevelConfig *)v424 initWithConfig:v425 defaultConfig:v7->_legacyAudioFeedOntologyLevelConfig];
    audioFeedOntologyLevelConfig = v7->_audioFeedOntologyLevelConfig;
    v7->_audioFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v426;

    v428 = [FCPersonalizationOntologyLevelConfig alloc];
    v429 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleRecirculationPrimaryOntologyLevelConfig", 0);
    v430 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v431 = [(FCPersonalizationOntologyLevelConfig *)v428 initWithConfig:v429 defaultConfig:v430];
    articleRecirculationPrimaryOntologyLevelConfig = v7->_articleRecirculationPrimaryOntologyLevelConfig;
    v7->_articleRecirculationPrimaryOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v431;

    v433 = [FCPersonalizationOntologyLevelConfig alloc];
    v434 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleRecirculationSecondaryOntologyLevelConfig", 0);
    v435 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v436 = [(FCPersonalizationOntologyLevelConfig *)v433 initWithConfig:v434 defaultConfig:v435];
    articleRecirculationSecondaryOntologyLevelConfig = v7->_articleRecirculationSecondaryOntologyLevelConfig;
    v7->_articleRecirculationSecondaryOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v436;

    v438 = [FCPersonalizationOntologyLevelConfig alloc];
    v439 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleRecirculationTertiaryOntologyLevelConfig", 0);
    v440 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v441 = [(FCPersonalizationOntologyLevelConfig *)v438 initWithConfig:v439 defaultConfig:v440];
    articleRecirculationTertiaryOntologyLevelConfig = v7->_articleRecirculationTertiaryOntologyLevelConfig;
    v7->_articleRecirculationTertiaryOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v441;

    v443 = [FCPersonalizationOntologyLevelConfig alloc];
    v444 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleRecirculationQuaternaryOntologyLevelConfig", 0);
    v445 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v446 = [(FCPersonalizationOntologyLevelConfig *)v443 initWithConfig:v444 defaultConfig:v445];
    articleRecirculationQuaternaryOntologyLevelConfig = v7->_articleRecirculationQuaternaryOntologyLevelConfig;
    v7->_articleRecirculationQuaternaryOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v446;

    v448 = [FCPersonalizationOntologyLevelConfig alloc];
    v449 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"bestOfBundleOntologyLevelConfig", 0);
    v450 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v451 = [(FCPersonalizationOntologyLevelConfig *)v448 initWithConfig:v449 defaultConfig:v450];
    bestOfBundleOntologyLevelConfig = v7->_bestOfBundleOntologyLevelConfig;
    v7->_bestOfBundleOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v451;

    v453 = [FCPersonalizationOntologyLevelConfig alloc];
    v454 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"curatedOntologyLevelConfig", 0);
    v455 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v456 = [(FCPersonalizationOntologyLevelConfig *)v453 initWithConfig:v454 defaultConfig:v455];
    curatedOntologyLevelConfig = v7->_curatedOntologyLevelConfig;
    v7->_curatedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v456;

    v458 = [FCPersonalizationOntologyLevelConfig alloc];
    v459 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"curatedIssuesOntologyLevelConfig", 0);
    v460 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v461 = [(FCPersonalizationOntologyLevelConfig *)v458 initWithConfig:v459 defaultConfig:v460];
    curatedIssuesOntologyLevelConfig = v7->_curatedIssuesOntologyLevelConfig;
    v7->_curatedIssuesOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v461;

    v463 = [FCPersonalizationOntologyLevelConfig alloc];
    v464 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"forYouOntologyLevelConfig", 0);
    v465 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v466 = [(FCPersonalizationOntologyLevelConfig *)v463 initWithConfig:v464 defaultConfig:v465];
    forYouOntologyLevelConfig = v7->_forYouOntologyLevelConfig;
    v7->_forYouOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v466;

    v468 = [FCPersonalizationOntologyLevelConfig alloc];
    v469 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"greatStoriesYouMissedOntologyLevelConfig", 0);
    v470 = [(FCPersonalizationTreatment *)v7 forYouOntologyLevelConfig];
    uint64_t v471 = [(FCPersonalizationOntologyLevelConfig *)v468 initWithConfig:v469 defaultConfig:v470];
    greatStoriesYouMissedOntologyLevelConfig = v7->_greatStoriesYouMissedOntologyLevelConfig;
    v7->_greatStoriesYouMissedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v471;

    v473 = [FCPersonalizationOntologyLevelConfig alloc];
    v474 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"latestStoriesOntologyLevelConfig", 0);
    v475 = [(FCPersonalizationTreatment *)v7 forYouOntologyLevelConfig];
    uint64_t v476 = [(FCPersonalizationOntologyLevelConfig *)v473 initWithConfig:v474 defaultConfig:v475];
    latestStoriesOntologyLevelConfig = v7->_latestStoriesOntologyLevelConfig;
    v7->_latestStoriesOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v476;

    v478 = [FCPersonalizationOntologyLevelConfig alloc];
    v479 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"localNewsOntologyLevelConfig", 0);
    v480 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v481 = [(FCPersonalizationOntologyLevelConfig *)v478 initWithConfig:v479 defaultConfig:v480];
    localNewsOntologyLevelConfig = v7->_localNewsOntologyLevelConfig;
    v7->_localNewsOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v481;

    v483 = [FCPersonalizationOntologyLevelConfig alloc];
    v484 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"newspaperMagazineFeedOntologyLevelConfig", 0);
    v485 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v486 = [(FCPersonalizationOntologyLevelConfig *)v483 initWithConfig:v484 defaultConfig:v485];
    newspaperMagazineFeedOntologyLevelConfig = v7->_newspaperMagazineFeedOntologyLevelConfig;
    v7->_newspaperMagazineFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v486;

    v488 = [FCPersonalizationOntologyLevelConfig alloc];
    v489 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"todayWidgetOntologyLevelConfig", 0);
    v490 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v491 = [(FCPersonalizationOntologyLevelConfig *)v488 initWithConfig:v489 defaultConfig:v490];
    todayWidgetOntologyLevelConfig = v7->_todayWidgetOntologyLevelConfig;
    v7->_todayWidgetOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v491;

    v493 = [FCPersonalizationOntologyLevelConfig alloc];
    v494 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagWidgetOntologyLevelConfig", 0);
    v495 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v496 = [(FCPersonalizationOntologyLevelConfig *)v493 initWithConfig:v494 defaultConfig:v495];
    tagWidgetOntologyLevelConfig = v7->_tagWidgetOntologyLevelConfig;
    v7->_tagWidgetOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v496;

    v498 = [FCPersonalizationOntologyLevelConfig alloc];
    v499 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"mySportsGroupOntologyLevelConfig", 0);
    v500 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v501 = [(FCPersonalizationOntologyLevelConfig *)v498 initWithConfig:v499 defaultConfig:v500];
    mySportsGroupOntologyLevelConfig = v7->_mySportsGroupOntologyLevelConfig;
    v7->_mySportsGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v501;

    v503 = [FCPersonalizationOntologyLevelConfig alloc];
    v504 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"mySportsGroupForYouOntologyLevelConfig", 0);
    v505 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v506 = [(FCPersonalizationOntologyLevelConfig *)v503 initWithConfig:v504 defaultConfig:v505];
    mySportsGroupForYouOntologyLevelConfig = v7->_mySportsGroupForYouOntologyLevelConfig;
    v7->_mySportsGroupForYouOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v506;

    v508 = [FCPersonalizationOntologyLevelConfig alloc];
    v509 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"mySportsTopicsOntologyLevelConfig", 0);
    v510 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v511 = [(FCPersonalizationOntologyLevelConfig *)v508 initWithConfig:v509 defaultConfig:v510];
    mySportsTopicsOntologyLevelConfig = v7->_mySportsTopicsOntologyLevelConfig;
    v7->_mySportsTopicsOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v511;

    v513 = [FCPersonalizationOntologyLevelConfig alloc];
    v514 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"sportsTopStoriesOntologyLevelConfig", 0);
    v515 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v516 = [(FCPersonalizationOntologyLevelConfig *)v513 initWithConfig:v514 defaultConfig:v515];
    sportsTopStoriesOntologyLevelConfig = v7->_sportsTopStoriesOntologyLevelConfig;
    v7->_sportsTopStoriesOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v516;

    v518 = [FCPersonalizationOntologyLevelConfig alloc];
    v519 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"introToSportsGroupOntologyLevelConfig", 0);
    v520 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v521 = [(FCPersonalizationOntologyLevelConfig *)v518 initWithConfig:v519 defaultConfig:v520];
    introToSportsGroupOntologyLevelConfig = v7->_introToSportsGroupOntologyLevelConfig;
    v7->_introToSportsGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v521;

    v523 = [FCPersonalizationOntologyLevelConfig alloc];
    v524 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"introToSportsGroupForYouOntologyLevelConfig", 0);
    v525 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v526 = [(FCPersonalizationOntologyLevelConfig *)v523 initWithConfig:v524 defaultConfig:v525];
    introToSportsGroupForYouOntologyLevelConfig = v7->_introToSportsGroupForYouOntologyLevelConfig;
    v7->_introToSportsGroupForYouOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v526;

    v528 = [FCPersonalizationOntologyLevelConfig alloc];
    v529 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"highlightsGroupOntologyLevelConfig", 0);
    v530 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v531 = [(FCPersonalizationOntologyLevelConfig *)v528 initWithConfig:v529 defaultConfig:v530];
    highlightsGroupOntologyLevelConfig = v7->_highlightsGroupOntologyLevelConfig;
    v7->_highlightsGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v531;

    v533 = [FCPersonalizationOntologyLevelConfig alloc];
    v534 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"articleListTagFeedGroupOntologyLevelConfig", 0);
    v535 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v536 = [(FCPersonalizationOntologyLevelConfig *)v533 initWithConfig:v534 defaultConfig:v535];
    articleListTagFeedGroupOntologyLevelConfig = v7->_articleListTagFeedGroupOntologyLevelConfig;
    v7->_articleListTagFeedGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v536;

    v538 = [FCPersonalizationOntologyLevelConfig alloc];
    v539 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagFeedOntologyLevelConfig", 0);
    v540 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v541 = [(FCPersonalizationOntologyLevelConfig *)v538 initWithConfig:v539 defaultConfig:v540];
    tagFeedOntologyLevelConfig = v7->_tagFeedOntologyLevelConfig;
    v7->_tagFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v541;

    v543 = [FCPersonalizationOntologyLevelConfig alloc];
    v544 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"newspaperTodayFeedOntologyLevelConfig", 0);
    v545 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v546 = [(FCPersonalizationOntologyLevelConfig *)v543 initWithConfig:v544 defaultConfig:v545];
    newspaperTodayFeedOntologyLevelConfig = v7->_newspaperTodayFeedOntologyLevelConfig;
    v7->_newspaperTodayFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v546;

    v548 = [FCPersonalizationOntologyLevelConfig alloc];
    v549 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"moreForYouOntologyLevelConfig", 0);
    v550 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v551 = [(FCPersonalizationOntologyLevelConfig *)v548 initWithConfig:v549 defaultConfig:v550];
    moreForYouOntologyLevelConfig = v7->_moreForYouOntologyLevelConfig;
    v7->_moreForYouOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v551;

    v553 = [FCPersonalizationOntologyLevelConfig alloc];
    v554 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"localSectionGroupOntologyLevelConfig", 0);
    v555 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v556 = [(FCPersonalizationOntologyLevelConfig *)v553 initWithConfig:v554 defaultConfig:v555];
    localSectionGroupOntologyLevelConfig = v7->_localSectionGroupOntologyLevelConfig;
    v7->_localSectionGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v556;

    v558 = [FCPersonalizationOntologyLevelConfig alloc];
    v559 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"newspaperSectionGroupOntologyLevelConfig", 0);
    v560 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v561 = [(FCPersonalizationOntologyLevelConfig *)v558 initWithConfig:v559 defaultConfig:v560];
    newspaperSectionGroupOntologyLevelConfig = v7->_newspaperSectionGroupOntologyLevelConfig;
    v7->_newspaperSectionGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v561;

    v563 = [FCPersonalizationOntologyLevelConfig alloc];
    v564 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"sportsEventArticlesGroupOntologyLevelConfig", 0);
    v565 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v566 = [(FCPersonalizationOntologyLevelConfig *)v563 initWithConfig:v564 defaultConfig:v565];
    sportsEventArticlesGroupOntologyLevelConfig = v7->_sportsEventArticlesGroupOntologyLevelConfig;
    v7->_sportsEventArticlesGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v566;

    v568 = [FCPersonalizationOntologyLevelConfig alloc];
    v569 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagForYouGroupOntologyLevelConfig", 0);
    v570 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v571 = [(FCPersonalizationOntologyLevelConfig *)v568 initWithConfig:v569 defaultConfig:v570];
    tagForYouGroupOntologyLevelConfig = v7->_tagForYouGroupOntologyLevelConfig;
    v7->_tagForYouGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v571;

    v573 = [FCPersonalizationOntologyLevelConfig alloc];
    v574 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagRecentStoriesOntologyLevelConfig", 0);
    v575 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v576 = [(FCPersonalizationOntologyLevelConfig *)v573 initWithConfig:v574 defaultConfig:v575];
    tagRecentStoriesOntologyLevelConfig = v7->_tagRecentStoriesOntologyLevelConfig;
    v7->_tagRecentStoriesOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v576;

    v578 = [FCPersonalizationOntologyLevelConfig alloc];
    v579 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"tagDateRangeOntologyLevelConfig", 0);
    v580 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v581 = [(FCPersonalizationOntologyLevelConfig *)v578 initWithConfig:v579 defaultConfig:v580];
    tagDateRangeOntologyLevelConfig = v7->_tagDateRangeOntologyLevelConfig;
    v7->_tagDateRangeOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v581;

    v583 = [FCPersonalizationOntologyLevelConfig alloc];
    v584 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"sportsEventTopicGroupOntologyLevelConfig", 0);
    v585 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v586 = [(FCPersonalizationOntologyLevelConfig *)v583 initWithConfig:v584 defaultConfig:v585];
    sportsEventTopicGroupOntologyLevelConfig = v7->_sportsEventTopicGroupOntologyLevelConfig;
    v7->_sportsEventTopicGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v586;

    v588 = [FCPersonalizationOntologyLevelConfig alloc];
    v589 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"affinityGroupOntologyLevelConfig", 0);
    v590 = [(FCPersonalizationTreatment *)v7 defaultOntologyLevelConfig];
    uint64_t v591 = [(FCPersonalizationOntologyLevelConfig *)v588 initWithConfig:v589 defaultConfig:v590];
    affinityGroupOntologyLevelConfig = v7->_affinityGroupOntologyLevelConfig;
    v7->_affinityGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v591;

    uint64_t v593 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowDefaultScoringConfig", 0);
    v594 = (void *)v593;
    v595 = (void *)MEMORY[0x1E4F1CC08];
    if (v593) {
      v596 = (void *)v593;
    }
    else {
      v596 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v7->_shadowDefaultScoringConfig, v596);

    uint64_t v597 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTopicFeedScoringConfig", 0);
    v598 = (void *)v597;
    if (v597) {
      v599 = (void *)v597;
    }
    else {
      v599 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTopicFeedScoringConfig, v599);

    uint64_t v600 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMagazineFeedArticleScoringConfig", 0);
    v601 = (void *)v600;
    if (v600) {
      v602 = (void *)v600;
    }
    else {
      v602 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMagazineFeedArticleScoringConfig, v602);

    uint64_t v603 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMagazineFeedIssueScoringConfig", 0);
    v604 = (void *)v603;
    if (v603) {
      v605 = (void *)v603;
    }
    else {
      v605 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMagazineFeedIssueScoringConfig, v605);

    uint64_t v606 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowAudioFeedScoringConfig", 0);
    v607 = (void *)v606;
    if (v606) {
      v608 = (void *)v606;
    }
    else {
      v608 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowLegacyAudioFeedScoringConfig, v608);

    uint64_t v609 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowAudioFeed2ScoringConfig", 0);
    v610 = (void *)v609;
    if (v609) {
      v611 = (void *)v609;
    }
    else {
      v611 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowAudioFeedScoringConfig, v611);

    uint64_t v612 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleRecirculationPrimaryScoringConfig", 0);
    v613 = (void *)v612;
    if (v612) {
      v614 = (void *)v612;
    }
    else {
      v614 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationPrimaryScoringConfig, v614);

    uint64_t v615 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleRecirculationSecondaryScoringConfig", 0);
    v616 = (void *)v615;
    if (v615) {
      v617 = (void *)v615;
    }
    else {
      v617 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationSecondaryScoringConfig, v617);

    uint64_t v618 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleRecirculationTertiaryScoringConfig", 0);
    v619 = (void *)v618;
    if (v618) {
      v620 = (void *)v618;
    }
    else {
      v620 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationTertiaryScoringConfig, v620);

    uint64_t v621 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleRecirculationQuaternaryScoringConfig", 0);
    v622 = (void *)v621;
    if (v621) {
      v623 = (void *)v621;
    }
    else {
      v623 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationQuaternaryScoringConfig, v623);

    uint64_t v624 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowBestOfBundleScoringConfig", 0);
    v625 = (void *)v624;
    if (v624) {
      v626 = (void *)v624;
    }
    else {
      v626 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowBestOfBundleScoringConfig, v626);

    uint64_t v627 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowCuratedScoringConfig", 0);
    v628 = (void *)v627;
    if (v627) {
      v629 = (void *)v627;
    }
    else {
      v629 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowCuratedScoringConfig, v629);

    uint64_t v630 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowCuratedIssuesScoringConfig", 0);
    v631 = (void *)v630;
    if (v630) {
      v632 = (void *)v630;
    }
    else {
      v632 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowCuratedIssuesScoringConfig, v632);

    uint64_t v633 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowForYouScoringConfig", 0);
    v634 = (void *)v633;
    if (v633) {
      v635 = (void *)v633;
    }
    else {
      v635 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowForYouScoringConfig, v635);

    uint64_t v636 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowGreatStoriesYouMissedScoringConfig", 0);
    v637 = (void *)v636;
    if (v636) {
      v638 = (void *)v636;
    }
    else {
      v638 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowGreatStoriesYouMissedScoringConfig, v638);

    uint64_t v639 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowLatestStoriesScoringConfig", 0);
    v640 = (void *)v639;
    if (v639) {
      v641 = (void *)v639;
    }
    else {
      v641 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowLatestStoriesScoringConfig, v641);

    uint64_t v642 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowLocalNewsScoringConfig", 0);
    v643 = (void *)v642;
    if (v642) {
      v644 = (void *)v642;
    }
    else {
      v644 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowLocalNewsScoringConfig, v644);

    uint64_t v645 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowNewspaperMagazineFeedScoringConfig", 0);
    v646 = (void *)v645;
    if (v645) {
      v647 = (void *)v645;
    }
    else {
      v647 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowNewspaperMagazineFeedScoringConfig, v647);

    uint64_t v648 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTodayWidgetScoringConfig", 0);
    v649 = (void *)v648;
    if (v648) {
      v650 = (void *)v648;
    }
    else {
      v650 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTodayWidgetScoringConfig, v650);

    uint64_t v651 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagWidgetScoringConfig", 0);
    v652 = (void *)v651;
    if (v651) {
      v653 = (void *)v651;
    }
    else {
      v653 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagWidgetScoringConfig, v653);

    uint64_t v654 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowNotificationScoringConfig", 0);
    v655 = (void *)v654;
    if (v654) {
      v656 = (void *)v654;
    }
    else {
      v656 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowNotificationScoringConfig, v656);

    uint64_t v657 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMySportsGroupScoringConfig", 0);
    v658 = (void *)v657;
    if (v657) {
      v659 = (void *)v657;
    }
    else {
      v659 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMySportsGroupScoringConfig, v659);

    uint64_t v660 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMySportsGroupForYouScoringConfig", 0);
    v661 = (void *)v660;
    if (v660) {
      v662 = (void *)v660;
    }
    else {
      v662 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMySportsGroupForYouScoringConfig, v662);

    uint64_t v663 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMySportsTopicsScoringConfig", 0);
    v664 = (void *)v663;
    if (v663) {
      v665 = (void *)v663;
    }
    else {
      v665 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMySportsTopicsScoringConfig, v665);

    uint64_t v666 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowSportsTopStoriesScoringConfig", 0);
    v667 = (void *)v666;
    if (v666) {
      v668 = (void *)v666;
    }
    else {
      v668 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowSportsTopStoriesScoringConfig, v668);

    uint64_t v669 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowIntroToSportsGroupScoringConfig", 0);
    v670 = (void *)v669;
    if (v669) {
      v671 = (void *)v669;
    }
    else {
      v671 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupScoringConfig, v671);

    uint64_t v672 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowIntroToSportsGroupForYouScoringConfig", 0);
    v673 = (void *)v672;
    if (v672) {
      v674 = (void *)v672;
    }
    else {
      v674 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupForYouScoringConfig, v674);

    uint64_t v675 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowHighlightsGroupScoringConfig", 0);
    v676 = (void *)v675;
    if (v675) {
      v677 = (void *)v675;
    }
    else {
      v677 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowHighlightsGroupScoringConfig, v677);

    uint64_t v678 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleListTagFeedGroupScoringConfig", 0);
    v679 = (void *)v678;
    if (v678) {
      v680 = (void *)v678;
    }
    else {
      v680 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleListTagFeedGroupScoringConfig, v680);

    uint64_t v681 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagFeedScoringConfig", 0);
    v682 = (void *)v681;
    if (v681) {
      v683 = (void *)v681;
    }
    else {
      v683 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagFeedScoringConfig, v683);

    uint64_t v684 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowNewspaperTodayFeedScoringConfig", 0);
    v685 = (void *)v684;
    if (v684) {
      v686 = (void *)v684;
    }
    else {
      v686 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowNewspaperTodayFeedScoringConfig, v686);

    uint64_t v687 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMoreForYouScoringConfig", 0);
    v688 = (void *)v687;
    if (v687) {
      v689 = (void *)v687;
    }
    else {
      v689 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMoreForYouScoringConfig, v689);

    uint64_t v690 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowLocalSectionGroupScoringConfig", 0);
    v691 = (void *)v690;
    if (v690) {
      v692 = (void *)v690;
    }
    else {
      v692 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowLocalSectionGroupScoringConfig, v692);

    uint64_t v693 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowNewspaperSectionGroupScoringConfig", 0);
    v694 = (void *)v693;
    if (v693) {
      v695 = (void *)v693;
    }
    else {
      v695 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowNewspaperSectionGroupScoringConfig, v695);

    uint64_t v696 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowSportsEventArticlesGroupScoringConfig", 0);
    v697 = (void *)v696;
    if (v696) {
      v698 = (void *)v696;
    }
    else {
      v698 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowSportsEventArticlesGroupScoringConfig, v698);

    uint64_t v699 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagForYouGroupScoringConfig", 0);
    v700 = (void *)v699;
    if (v699) {
      v701 = (void *)v699;
    }
    else {
      v701 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagForYouGroupScoringConfig, v701);

    uint64_t v702 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagRecentStoriesScoringConfig", 0);
    v703 = (void *)v702;
    if (v702) {
      v704 = (void *)v702;
    }
    else {
      v704 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagRecentStoriesScoringConfig, v704);

    uint64_t v705 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagDateRangeScoringConfig", 0);
    v706 = (void *)v705;
    if (v705) {
      v707 = (void *)v705;
    }
    else {
      v707 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagDateRangeScoringConfig, v707);

    uint64_t v708 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowSportsEventTopicGroupScoringConfig", 0);
    v709 = (void *)v708;
    if (v708) {
      v710 = (void *)v708;
    }
    else {
      v710 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowSportsEventTopicGroupScoringConfig, v710);

    uint64_t v711 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowAffinityGroupScoringConfig", 0);
    v712 = (void *)v711;
    if (v711) {
      v713 = (void *)v711;
    }
    else {
      v713 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowAffinityGroupScoringConfig, v713);

    uint64_t v714 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowDefaultTopicsConfig", 0);
    v715 = (void *)v714;
    v716 = (void *)MEMORY[0x1E4F1CBF0];
    if (v714) {
      v717 = (void *)v714;
    }
    else {
      v717 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v7->_shadowDefaultTopicsConfig, v717);

    uint64_t v718 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowTopicFeedTopicsConfig", 0);
    v719 = (void *)v718;
    if (v718) {
      v720 = (void *)v718;
    }
    else {
      v720 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowTopicFeedTopicsConfig, v720);

    uint64_t v721 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowMagazineFeedArticleTopicsConfig", 0);
    v722 = (void *)v721;
    if (v721) {
      v723 = (void *)v721;
    }
    else {
      v723 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowMagazineFeedArticleTopicsConfig, v723);

    uint64_t v724 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowMagazineFeedIssueTopicsConfig", 0);
    v725 = (void *)v724;
    if (v724) {
      v726 = (void *)v724;
    }
    else {
      v726 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowMagazineFeedIssueTopicsConfig, v726);

    uint64_t v727 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowAudioFeedTopicsConfig", 0);
    v728 = (void *)v727;
    if (v727) {
      v729 = (void *)v727;
    }
    else {
      v729 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowLegacyAudioFeedTopicsConfig, v729);

    uint64_t v730 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowAudioFeed2TopicsConfig", 0);
    v731 = (void *)v730;
    if (v730) {
      v732 = (void *)v730;
    }
    else {
      v732 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowAudioFeedTopicsConfig, v732);

    uint64_t v733 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowArticleRecirculationPrimaryTopicsConfig", 0);
    v734 = (void *)v733;
    if (v733) {
      v735 = (void *)v733;
    }
    else {
      v735 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationPrimaryTopicsConfig, v735);

    uint64_t v736 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowArticleRecirculationSecondaryTopicsConfig", 0);
    v737 = (void *)v736;
    if (v736) {
      v738 = (void *)v736;
    }
    else {
      v738 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationSecondaryTopicsConfig, v738);

    uint64_t v739 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowArticleRecirculationTertiaryTopicsConfig", 0);
    v740 = (void *)v739;
    if (v739) {
      v741 = (void *)v739;
    }
    else {
      v741 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationTertiaryTopicsConfig, v741);

    uint64_t v742 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowArticleRecirculationQuaternaryTopicsConfig", 0);
    v743 = (void *)v742;
    if (v742) {
      v744 = (void *)v742;
    }
    else {
      v744 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationQuaternaryTopicsConfig, v744);

    uint64_t v745 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowBestOfBundleTopicsConfig", 0);
    v746 = (void *)v745;
    if (v745) {
      v747 = (void *)v745;
    }
    else {
      v747 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowBestOfBundleTopicsConfig, v747);

    uint64_t v748 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowCuratedTopicsConfig", 0);
    v749 = (void *)v748;
    if (v748) {
      v750 = (void *)v748;
    }
    else {
      v750 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowCuratedTopicsConfig, v750);

    uint64_t v751 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowCuratedIssuesTopicsConfig", 0);
    v752 = (void *)v751;
    if (v751) {
      v753 = (void *)v751;
    }
    else {
      v753 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowCuratedIssuesTopicsConfig, v753);

    uint64_t v754 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowForYouTopicsConfig", 0);
    v755 = (void *)v754;
    if (v754) {
      v756 = (void *)v754;
    }
    else {
      v756 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowForYouTopicsConfig, v756);

    uint64_t v757 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowGreatStoriesYouMissedTopicsConfig", 0);
    v758 = (void *)v757;
    if (v757) {
      v759 = (void *)v757;
    }
    else {
      v759 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowGreatStoriesYouMissedTopicsConfig, v759);

    uint64_t v760 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowLatestStoriesTopicsConfig", 0);
    v761 = (void *)v760;
    if (v760) {
      v762 = (void *)v760;
    }
    else {
      v762 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowLatestStoriesTopicsConfig, v762);

    uint64_t v763 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowLocalNewsTopicsConfig", 0);
    v764 = (void *)v763;
    if (v763) {
      v765 = (void *)v763;
    }
    else {
      v765 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowLocalNewsTopicsConfig, v765);

    uint64_t v766 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowNewspaperMagazineFeedTopicsConfig", 0);
    v767 = (void *)v766;
    if (v766) {
      v768 = (void *)v766;
    }
    else {
      v768 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowNewspaperMagazineFeedTopicsConfig, v768);

    uint64_t v769 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowTodayWidgetTopicsConfig", 0);
    v770 = (void *)v769;
    if (v769) {
      v771 = (void *)v769;
    }
    else {
      v771 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowTodayWidgetTopicsConfig, v771);

    uint64_t v772 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowTagWidgetTopicsConfig", 0);
    v773 = (void *)v772;
    if (v772) {
      v774 = (void *)v772;
    }
    else {
      v774 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowTagWidgetTopicsConfig, v774);

    uint64_t v775 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowMySportsGroupTopicsConfig", 0);
    v776 = (void *)v775;
    if (v775) {
      v777 = (void *)v775;
    }
    else {
      v777 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowMySportsGroupTopicsConfig, v777);

    uint64_t v778 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowMySportsGroupForYouTopicsConfig", 0);
    v779 = (void *)v778;
    if (v778) {
      v780 = (void *)v778;
    }
    else {
      v780 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowMySportsGroupForYouTopicsConfig, v780);

    uint64_t v781 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowMySportsTopicsTopicsConfig", 0);
    v782 = (void *)v781;
    if (v781) {
      v783 = (void *)v781;
    }
    else {
      v783 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowMySportsTopicsTopicsConfig, v783);

    uint64_t v784 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowSportsTopStoriesTopicsConfig", 0);
    v785 = (void *)v784;
    if (v784) {
      v786 = (void *)v784;
    }
    else {
      v786 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowSportsTopStoriesTopicsConfig, v786);

    uint64_t v787 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowIntroToSportsGroupTopicsConfig", 0);
    v788 = (void *)v787;
    if (v787) {
      v789 = (void *)v787;
    }
    else {
      v789 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupTopicsConfig, v789);

    uint64_t v790 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowIntroToSportsGroupForYouTopicsConfig", 0);
    v791 = (void *)v790;
    if (v790) {
      v792 = (void *)v790;
    }
    else {
      v792 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupForYouTopicsConfig, v792);

    uint64_t v793 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowHighlightsGroupTopicsConfig", 0);
    v794 = (void *)v793;
    if (v793) {
      v795 = (void *)v793;
    }
    else {
      v795 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowHighlightsGroupTopicsConfig, v795);

    uint64_t v796 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowArticleListTagFeedGroupTopicsConfig", 0);
    v797 = (void *)v796;
    if (v796) {
      v798 = (void *)v796;
    }
    else {
      v798 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowArticleListTagFeedGroupTopicsConfig, v798);

    uint64_t v799 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowTagFeedTopicsConfig", 0);
    v800 = (void *)v799;
    if (v799) {
      v801 = (void *)v799;
    }
    else {
      v801 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowTagFeedTopicsConfig, v801);

    uint64_t v802 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowNewspaperTodayFeedTopicsConfig", 0);
    v803 = (void *)v802;
    if (v802) {
      v804 = (void *)v802;
    }
    else {
      v804 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowNewspaperTodayFeedTopicsConfig, v804);

    uint64_t v805 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowMoreForYouTopicsConfig", 0);
    v806 = (void *)v805;
    if (v805) {
      v807 = (void *)v805;
    }
    else {
      v807 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowMoreForYouTopicsConfig, v807);

    uint64_t v808 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowLocalSectionGroupTopicsConfig", 0);
    v809 = (void *)v808;
    if (v808) {
      v810 = (void *)v808;
    }
    else {
      v810 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowLocalSectionGroupTopicsConfig, v810);

    uint64_t v811 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowNewspaperSectionGroupTopicsConfig", 0);
    v812 = (void *)v811;
    if (v811) {
      v813 = (void *)v811;
    }
    else {
      v813 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowNewspaperSectionGroupTopicsConfig, v813);

    uint64_t v814 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowSportsEventArticlesGroupTopicsConfig", 0);
    v815 = (void *)v814;
    if (v814) {
      v816 = (void *)v814;
    }
    else {
      v816 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowSportsEventArticlesGroupTopicsConfig, v816);

    uint64_t v817 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowTagForYouGroupTopicsConfig", 0);
    v818 = (void *)v817;
    if (v817) {
      v819 = (void *)v817;
    }
    else {
      v819 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowTagForYouGroupTopicsConfig, v819);

    uint64_t v820 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowTagRecentStoriesTopicsConfig", 0);
    v821 = (void *)v820;
    if (v820) {
      v822 = (void *)v820;
    }
    else {
      v822 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowTagRecentStoriesTopicsConfig, v822);

    uint64_t v823 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowTagDateRangeTopicsConfig", 0);
    v824 = (void *)v823;
    if (v823) {
      v825 = (void *)v823;
    }
    else {
      v825 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowTagDateRangeTopicsConfig, v825);

    uint64_t v826 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowSportsEventTopicGroupTopicsConfig", 0);
    v827 = (void *)v826;
    if (v826) {
      v828 = (void *)v826;
    }
    else {
      v828 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowSportsEventTopicGroupTopicsConfig, v828);

    uint64_t v829 = FCAppConfigurationArrayValueWithDefaultValue(v5, @"shadowAffinityGroupTopicsConfig", 0);
    v830 = (void *)v829;
    if (v829) {
      v831 = (void *)v829;
    }
    else {
      v831 = v716;
    }
    objc_storeStrong((id *)&v7->_shadowAffinityGroupTopicsConfig, v831);

    uint64_t v832 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowDefaultOntologyLevelConfig", 0);
    v833 = (void *)v832;
    if (v832) {
      v834 = (void *)v832;
    }
    else {
      v834 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowDefaultOntologyLevelConfig, v834);

    uint64_t v835 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTopicFeedOntologyLevelConfig", 0);
    v836 = (void *)v835;
    if (v835) {
      v837 = (void *)v835;
    }
    else {
      v837 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTopicFeedOntologyLevelConfig, v837);

    uint64_t v838 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMagazineFeedArticleOntologyLevelConfig", 0);
    v839 = (void *)v838;
    if (v838) {
      v840 = (void *)v838;
    }
    else {
      v840 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMagazineFeedArticleOntologyLevelConfig, v840);

    uint64_t v841 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMagazineFeedIssueOntologyLevelConfig", 0);
    v842 = (void *)v841;
    if (v841) {
      v843 = (void *)v841;
    }
    else {
      v843 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMagazineFeedIssueOntologyLevelConfig, v843);

    uint64_t v844 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowAudioFeedOntologyLevelConfig", 0);
    v845 = (void *)v844;
    if (v844) {
      v846 = (void *)v844;
    }
    else {
      v846 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowLegacyAudioFeedOntologyLevelConfig, v846);

    uint64_t v847 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowAudioFeed2OntologyLevelConfig", 0);
    v848 = (void *)v847;
    if (v847) {
      v849 = (void *)v847;
    }
    else {
      v849 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowAudioFeedOntologyLevelConfig, v849);

    uint64_t v850 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleRecirculationPrimaryOntologyLevelConfig", 0);
    v851 = (void *)v850;
    if (v850) {
      v852 = (void *)v850;
    }
    else {
      v852 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationPrimaryOntologyLevelConfig, v852);

    uint64_t v853 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleRecirculationSecondaryOntologyLevelConfig", 0);
    v854 = (void *)v853;
    if (v853) {
      v855 = (void *)v853;
    }
    else {
      v855 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationSecondaryOntologyLevelConfig, v855);

    uint64_t v856 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleRecirculationTertiaryOntologyLevelConfig", 0);
    v857 = (void *)v856;
    if (v856) {
      v858 = (void *)v856;
    }
    else {
      v858 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationTertiaryOntologyLevelConfig, v858);

    uint64_t v859 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleRecirculationQuaternaryOntologyLevelConfig", 0);
    v860 = (void *)v859;
    if (v859) {
      v861 = (void *)v859;
    }
    else {
      v861 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationQuaternaryOntologyLevelConfig, v861);

    uint64_t v862 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowBestOfBundleOntologyLevelConfig", 0);
    v863 = (void *)v862;
    if (v862) {
      v864 = (void *)v862;
    }
    else {
      v864 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowBestOfBundleOntologyLevelConfig, v864);

    uint64_t v865 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowCuratedOntologyLevelConfig", 0);
    v866 = (void *)v865;
    if (v865) {
      v867 = (void *)v865;
    }
    else {
      v867 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowCuratedOntologyLevelConfig, v867);

    uint64_t v868 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowCuratedIssuesOntologyLevelConfig", 0);
    v869 = (void *)v868;
    if (v868) {
      v870 = (void *)v868;
    }
    else {
      v870 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowCuratedIssuesOntologyLevelConfig, v870);

    uint64_t v871 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowForYouOntologyLevelConfig", 0);
    v872 = (void *)v871;
    if (v871) {
      v873 = (void *)v871;
    }
    else {
      v873 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowForYouOntologyLevelConfig, v873);

    uint64_t v874 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowGreatStoriesYouMissedOntologyLevelConfig", 0);
    v875 = (void *)v874;
    if (v874) {
      v876 = (void *)v874;
    }
    else {
      v876 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowGreatStoriesYouMissedOntologyLevelConfig, v876);

    uint64_t v877 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowLatestStoriesOntologyLevelConfig", 0);
    v878 = (void *)v877;
    if (v877) {
      v879 = (void *)v877;
    }
    else {
      v879 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowLatestStoriesOntologyLevelConfig, v879);

    uint64_t v880 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowLocalNewsOntologyLevelConfig", 0);
    v881 = (void *)v880;
    if (v880) {
      v882 = (void *)v880;
    }
    else {
      v882 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowLocalNewsOntologyLevelConfig, v882);

    uint64_t v883 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowNewspaperMagazineFeedOntologyLevelConfig", 0);
    v884 = (void *)v883;
    if (v883) {
      v885 = (void *)v883;
    }
    else {
      v885 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowNewspaperMagazineFeedOntologyLevelConfig, v885);

    uint64_t v886 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTodayWidgetOntologyLevelConfig", 0);
    v887 = (void *)v886;
    if (v886) {
      v888 = (void *)v886;
    }
    else {
      v888 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTodayWidgetOntologyLevelConfig, v888);

    uint64_t v889 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagWidgetOntologyLevelConfig", 0);
    v890 = (void *)v889;
    if (v889) {
      v891 = (void *)v889;
    }
    else {
      v891 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagWidgetOntologyLevelConfig, v891);

    uint64_t v892 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMySportsGroupOntologyLevelConfig", 0);
    v893 = (void *)v892;
    if (v892) {
      v894 = (void *)v892;
    }
    else {
      v894 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMySportsGroupOntologyLevelConfig, v894);

    uint64_t v895 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMySportsGroupForYouOntologyLevelConfig", 0);
    v896 = (void *)v895;
    if (v895) {
      v897 = (void *)v895;
    }
    else {
      v897 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMySportsGroupForYouOntologyLevelConfig, v897);

    uint64_t v898 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMySportsTopicsOntologyLevelConfig", 0);
    v899 = (void *)v898;
    if (v898) {
      v900 = (void *)v898;
    }
    else {
      v900 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMySportsTopicsOntologyLevelConfig, v900);

    uint64_t v901 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowSportsTopStoriesOntologyLevelConfig", 0);
    v902 = (void *)v901;
    if (v901) {
      v903 = (void *)v901;
    }
    else {
      v903 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowSportsTopStoriesOntologyLevelConfig, v903);

    uint64_t v904 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowIntroToSportsGroupOntologyLevelConfig", 0);
    v905 = (void *)v904;
    if (v904) {
      v906 = (void *)v904;
    }
    else {
      v906 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupOntologyLevelConfig, v906);

    uint64_t v907 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowIntroToSportsGroupForYouOntologyLevelConfig", 0);
    v908 = (void *)v907;
    if (v907) {
      v909 = (void *)v907;
    }
    else {
      v909 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupForYouOntologyLevelConfig, v909);

    uint64_t v910 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowHighlightsGroupOntologyLevelConfig", 0);
    v911 = (void *)v910;
    if (v910) {
      v912 = (void *)v910;
    }
    else {
      v912 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowHighlightsGroupOntologyLevelConfig, v912);

    uint64_t v913 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowArticleListTagFeedGroupOntologyLevelConfig", 0);
    v914 = (void *)v913;
    if (v913) {
      v915 = (void *)v913;
    }
    else {
      v915 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowArticleListTagFeedGroupOntologyLevelConfig, v915);

    uint64_t v916 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagFeedOntologyLevelConfig", 0);
    v917 = (void *)v916;
    if (v916) {
      v918 = (void *)v916;
    }
    else {
      v918 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagFeedOntologyLevelConfig, v918);

    uint64_t v919 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowNewspaperTodayFeedOntologyLevelConfig", 0);
    v920 = (void *)v919;
    if (v919) {
      v921 = (void *)v919;
    }
    else {
      v921 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowNewspaperTodayFeedOntologyLevelConfig, v921);

    uint64_t v922 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowMoreForYouOntologyLevelConfig", 0);
    v923 = (void *)v922;
    if (v922) {
      v924 = (void *)v922;
    }
    else {
      v924 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowMoreForYouOntologyLevelConfig, v924);

    uint64_t v925 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowLocalSectionGroupOntologyLevelConfig", 0);
    v926 = (void *)v925;
    if (v925) {
      v927 = (void *)v925;
    }
    else {
      v927 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowLocalSectionGroupOntologyLevelConfig, v927);

    uint64_t v928 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowNewspaperSectionGroupOntologyLevelConfig", 0);
    v929 = (void *)v928;
    if (v928) {
      v930 = (void *)v928;
    }
    else {
      v930 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowNewspaperSectionGroupOntologyLevelConfig, v930);

    uint64_t v931 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowSportsEventArticlesGroupOntologyLevelConfig", 0);
    v932 = (void *)v931;
    if (v931) {
      v933 = (void *)v931;
    }
    else {
      v933 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowSportsEventArticlesGroupOntologyLevelConfig, v933);

    uint64_t v934 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagForYouGroupOntologyLevelConfig", 0);
    v935 = (void *)v934;
    if (v934) {
      v936 = (void *)v934;
    }
    else {
      v936 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagForYouGroupOntologyLevelConfig, v936);

    uint64_t v937 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagRecentStoriesOntologyLevelConfig", 0);
    v938 = (void *)v937;
    if (v937) {
      v939 = (void *)v937;
    }
    else {
      v939 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagRecentStoriesOntologyLevelConfig, v939);

    uint64_t v940 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowTagDateRangeOntologyLevelConfig", 0);
    v941 = (void *)v940;
    if (v940) {
      v942 = (void *)v940;
    }
    else {
      v942 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowTagDateRangeOntologyLevelConfig, v942);

    uint64_t v943 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowSportsEventTopicGroupOntologyLevelConfig", 0);
    v944 = (void *)v943;
    if (v943) {
      v945 = (void *)v943;
    }
    else {
      v945 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowSportsEventTopicGroupOntologyLevelConfig, v945);

    uint64_t v946 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"shadowAffinityGroupOntologyLevelConfig", 0);
    v947 = (void *)v946;
    if (v946) {
      v948 = (void *)v946;
    }
    else {
      v948 = v595;
    }
    objc_storeStrong((id *)&v7->_shadowAffinityGroupOntologyLevelConfig, v948);

    v949 = [FCPersonalizationTagScoringConfig alloc];
    v950 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"defaultTagScoringConfig", 0);
    uint64_t v951 = [(FCPersonalizationTagScoringConfig *)v949 initWithConfigDictionary:v950];
    defaultTagScoringConfig = v7->_defaultTagScoringConfig;
    v7->_defaultTagScoringConfig = (FCPersonalizationTagScoringConfig *)v951;

    v953 = [FCPersonalizationTagScoringConfig alloc];
    v954 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"sportsTagScoringConfig", 0);
    v955 = [(FCPersonalizationTreatment *)v7 defaultTagScoringConfig];
    uint64_t v956 = [(FCPersonalizationTagScoringConfig *)v953 initWithConfigDictionary:v954 defaultConfig:v955];
    sportsTagScoringConfig = v7->_sportsTagScoringConfig;
    v7->_sportsTagScoringConfig = (FCPersonalizationTagScoringConfig *)v956;

    double v958 = FCAppConfigurationDoubleValue(v5, @"hourlyFlowRateMinimum", 4.0);
    if (v958 < 0.0) {
      double v958 = 4.0;
    }
    v7->_hourlyFlowRateMinimum = v958;
    double v959 = FCAppConfigurationDoubleValue(v5, @"hourlyFlowRateSubscriptionCountBuffer", 0.0);
    if (v959 < 0.0) {
      double v959 = 0.0;
    }
    v7->_hourlyFlowRateSubscriptionCountBuffer = v959;
    double v960 = FCAppConfigurationDoubleValue(v5, @"hourlyFlowRateDampeningFactor", 2.0);
    if (v960 <= 0.0) {
      double v960 = 2.0;
    }
    v7->_hourlyFlowRateDampeningFactor = v960;
    double v961 = FCAppConfigurationDoubleValue(v5, @"hourlyFlowRatePerSubscription", 1.0);
    if (v961 < 0.0) {
      double v961 = 1.0;
    }
    v7->_hourlyFlowRatePerSubscription = v961;
    double v962 = FCAppConfigurationDoubleValue(v5, @"extraHeadlinesToShowTheUser", 0.0);
    if (v962 < 0.0) {
      double v962 = 0.0;
    }
    v7->_extraArticlesToShowUser = (uint64_t)v962;
    double v963 = FCAppConfigurationDoubleValue(v5, @"hourlyFlowRateAlpha", 0.535544906);
    if (v963 <= 0.0) {
      double v963 = 0.535544906;
    }
    v7->_hourlyFlowRateAlpha = v963;
    double v964 = FCAppConfigurationDoubleValue(v5, @"hourlyFlowRateBeta", 0.464455094);
    if (v964 <= 0.0) {
      double v964 = 0.464455094;
    }
    v7->_hourlyFlowRateBeta = v964;
    v7->_hourlyFlowRateGamma = fmax(FCAppConfigurationDoubleValue(v5, @"hourlyFlowRateGamma", 0.0), 0.0);
    double v965 = FCAppConfigurationDoubleValue(v5, @"flowRateDecayFactor", 0.99);
    if (v965 >= 1.0 || v965 < 0.0) {
      double v965 = 0.99;
    }
    v7->_hourlyFlowRateDecayFactor = v965;
    double v967 = FCAppConfigurationDoubleValue(v5, @"flowRatePriorWeight", 1.0);
    if (v967 < 0.0) {
      double v967 = 1.0;
    }
    v7->_hourlyFlowRatePriorWeight = v967;
    double v968 = FCAppConfigurationDoubleValue(v5, @"hourlyFlowRateFloor", 1.0);
    if (v968 < 0.0) {
      double v968 = 1.0;
    }
    v7->_hourlyFlowRateFloor = v968;
    double v969 = FCAppConfigurationDoubleValue(v5, @"hourlyFlowRateCeiling", 416.66);
    if (v969 < 0.0) {
      double v969 = 416.66;
    }
    v7->_hourlyFlowRateCeiling = v969;
    double v970 = FCAppConfigurationDoubleValue(v5, @"baselineImpressionPrior", 60.0);
    if (v970 < 0.0) {
      double v970 = 60.0;
    }
    v7->_baselineImpressionPrior = v970;
    double v971 = FCAppConfigurationDoubleValue(v5, @"featureImpressionPrior", 0.0);
    if (v971 < 0.0) {
      double v971 = 0.0;
    }
    v7->_featureImpressionPrior = v971;
    double v972 = FCAppConfigurationDoubleValue(v5, @"articleLengthLongThreshold", 5000.0);
    if (v972 < 0.0) {
      double v972 = 5000.0;
    }
    v7->_articleLengthLongThreshold = v972;
    double v973 = FCAppConfigurationDoubleValue(v5, @"articleLengthMediumThreshold", 2000.0);
    if (v973 < 0.0) {
      double v973 = 2000.0;
    }
    v7->_articleLengthMediumThreshold = v973;
    uint64_t v974 = FCAppConfigurationIntegerValue(v5, @"publisherTopicIDEventCountMinimum", 5);
    uint64_t v975 = (uint64_t)(double)v974;
    if (v974 < 0) {
      uint64_t v975 = 5;
    }
    v7->_publisherTopicIDEventCountMinimum = v975;
    double v976 = FCAppConfigurationDoubleValue(v5, @"publisherDiversificationPenalty", 0.2);
    if (v976 > 1.0 || v976 < 0.0) {
      double v976 = 0.2;
    }
    v7->_publisherDiversificationPenalty = v976;
    double v978 = FCAppConfigurationDoubleValue(v5, @"publisherDiversificationInitialPenalty", 0.4);
    if (v978 > 1.0 || v978 < 0.0) {
      double v978 = 0.4;
    }
    v7->_publisherDiversificationInitialPenalty = v978;
    double v980 = FCAppConfigurationDoubleValue(v5, @"publisherDiversificationPenaltyHalfLife", 200.0);
    if (v980 <= 0.0) {
      double v980 = 200.0;
    }
    v7->_publisherDiversificationPenaltyHalfLife = v980;
    double v981 = FCAppConfigurationDoubleValue(v5, @"heavyClickMinimumDuration", 7.0);
    if (v981 < 0.0) {
      double v981 = 7.0;
    }
    v7->_heavyClickMinimumDuration = v981;
    double v982 = FCAppConfigurationDoubleValue(v5, @"trackVisitedMinimumDuration", 10.0);
    if (v982 < 0.0) {
      double v982 = 10.0;
    }
    v7->_trackVisitedMinimumDuration = (uint64_t)v982;
    double v983 = FCAppConfigurationDoubleValue(v5, @"trackListenedMinimumDuration", 30.0);
    if (v983 < 0.0) {
      double v983 = 30.0;
    }
    v7->_trackListenedMinimumDuration = (uint64_t)v983;
    double v984 = FCAppConfigurationDoubleValue(v5, @"swipeToArticleWeakClickMinimumDuration", 4.0);
    if (v984 < 0.0) {
      double v984 = 4.0;
    }
    v7->_swipeToArticleWeakClickMinimumDuration = v984;
    double v985 = FCAppConfigurationDoubleValue(v5, @"swipeToArticleHeavyClickMinimumDuration", 10.0);
    if (v985 < 0.0) {
      double v985 = 10.0;
    }
    v7->_swipeToArticleHeavyClickMinimumDuration = v985;
    double v986 = FCAppConfigurationDoubleValue(v5, @"lowQualityContentThreshold", 0.2);
    if (v986 > 1.0 || v986 < 0.0) {
      double v986 = 0.2;
    }
    v7->_lowQualityContentThreshold = v986;
    v7->_lowQualityFilterShouldPreserveItemsFromSubscribedChannels = FCAppConfigurationBoolValue(v5, @"lowQualityFilterShouldPreserveItemsFromSubscribedChannels", 0);
    v7->_lowQualityFilterShouldIsolateEvergreenItems = FCAppConfigurationBoolValue(v5, @"lowQualityFilterShouldIsolateEvergreenItems", 0);
    double v988 = FCAppConfigurationDoubleValue(v5, @"sportsTagSeenMinimumDuration", 3.0);
    if (v988 < 0.0) {
      double v988 = 3.0;
    }
    v7->_sportsTagSeenMinimumDuration = v988;
    v7->_sportsTagSeenEnableFeedSource = FCAppConfigurationBoolValue(v5, @"sportsTagSeenEnableFeedSource", 0);
    v7->_sportsTagSeenEnableSportsManagementSource = FCAppConfigurationBoolValue(v5, @"sportsTagSeenEnableSportsManagementSource", 1);
    v7->_sportsTagSeenEnableSportsManagementDetailSource = FCAppConfigurationBoolValue(v5, @"sportsTagSeenEnableSportsManagementDetailSource", 1);
    uint64_t v989 = FCAppConfigurationIntegerValue(v5, @"thumbnailMinHammingDistance", 37);
    uint64_t v990 = (uint64_t)(double)v989;
    if (v989 <= 0) {
      uint64_t v990 = 37;
    }
    v7->_thumbnailMinHammingDistance = v990;
    double v991 = FCAppConfigurationDoubleValue(v5, @"presentationImpressionValue", 1.0);
    if (v991 < 0.0) {
      double v991 = 1.0;
    }
    v7->_presentationImpressionValue = v991;
    double v992 = FCAppConfigurationDoubleValue(v5, @"heavyClickImpressionValue", 3.0);
    if (v992 < 0.0) {
      double v992 = 3.0;
    }
    v7->_heavyClickImpressionValue = v992;
    double v993 = FCAppConfigurationDoubleValue(v5, @"likeImpressionValue", 2.0);
    if (v993 < 0.0) {
      double v993 = 2.0;
    }
    v7->_likeImpressionValue = v993;
    double v994 = FCAppConfigurationDoubleValue(v5, @"shareImpressionValue", 2.0);
    if (v994 < 0.0) {
      double v994 = 2.0;
    }
    v7->_shareImpressionValue = v994;
    double v995 = FCAppConfigurationDoubleValue(v5, @"savedImpressionValue", 1.0);
    if (v995 < 0.0) {
      double v995 = 1.0;
    }
    v7->_savedImpressionValue = v995;
    double v996 = FCAppConfigurationDoubleValue(v5, @"subscribeImpressionValue", 10.0);
    if (v996 < 0.0) {
      double v996 = 10.0;
    }
    v7->_subscribeImpressionValue = v996;
    double v997 = FCAppConfigurationDoubleValue(v5, @"subscribeRelatedImpressionValue", 0.0);
    if (v997 < 0.0) {
      double v997 = 0.0;
    }
    v7->_subscribeRelatedImpressionValue = v997;
    double v998 = FCAppConfigurationDoubleValue(v5, @"existingSubscriptionImpressionValue", 5.0);
    if (v998 < 0.0) {
      double v998 = 5.0;
    }
    v7->_existingSubscriptionImpressionValue = v998;
    double v999 = FCAppConfigurationDoubleValue(v5, @"existingSubscriptionRelatedImpressionValue", 0.0);
    if (v999 < 0.0) {
      double v999 = 0.0;
    }
    v7->_existingSubscriptionRelatedImpressionValue = v999;
    double v1000 = FCAppConfigurationDoubleValue(v5, @"tappedImpressionValue", 0.0);
    if (v1000 < 0.0) {
      double v1000 = 0.0;
    }
    v7->_tappedImpressionValue = v1000;
    double v1001 = FCAppConfigurationDoubleValue(v5, @"weakClickImpressionValue", 0.0);
    if (v1001 < 0.0) {
      double v1001 = 0.0;
    }
    v7->_weakClickImpressionValue = v1001;
    double v1002 = FCAppConfigurationDoubleValue(v5, @"unsubscribeImpressionValue", 0.0);
    if (v1002 < 0.0) {
      double v1002 = 0.0;
    }
    v7->_unsubscribeImpressionValue = v1002;
    double v1003 = FCAppConfigurationDoubleValue(v5, @"visitImpressionValue", 3.0);
    if (v1003 < 0.0) {
      double v1003 = 3.0;
    }
    v7->_visitImpressionValue = v1003;
    double v1004 = FCAppConfigurationDoubleValue(v5, @"dislikeImpressionValue", 50.0);
    if (v1004 < 0.0) {
      double v1004 = 50.0;
    }
    v7->_dislikeImpressionValue = v1004;
    double v1005 = FCAppConfigurationDoubleValue(v5, @"recommendationPresentationFeedImpressionValue", 0.0);
    if (v1005 < 0.0) {
      double v1005 = 0.0;
    }
    v7->_recommendationPresentationFeedImpressionValue = v1005;
    double v1006 = FCAppConfigurationDoubleValue(v5, @"recommendationPresentationExploreImpressionValue", 4.0);
    if (v1006 < 0.0) {
      double v1006 = 4.0;
    }
    v7->_recommendationPresentationExploreImpressionValue = v1006;
    double v1007 = FCAppConfigurationDoubleValue(v5, @"premiumSubscriptionActivationImpressionValue", 25.0);
    if (v1007 < 0.0) {
      double v1007 = 25.0;
    }
    v7->_premiumSubscriptionActivationImpressionValue = v1007;
    double v1008 = FCAppConfigurationDoubleValue(v5, @"muteImpressionValue", 50.0);
    if (v1008 < 0.0) {
      double v1008 = 50.0;
    }
    v7->_muteImpressionValue = v1008;
    double v1009 = FCAppConfigurationDoubleValue(v5, @"unmuteImpressionValue", 0.0);
    if (v1009 < 0.0) {
      double v1009 = 0.0;
    }
    v7->_unmuteImpressionValue = v1009;
    double v1010 = FCAppConfigurationDoubleValue(v5, @"videoInitiatePlaybackImpressionValue", 1.0);
    if (v1010 < 0.0) {
      double v1010 = 1.0;
    }
    v7->_videoInitiatePlaybackImpressionValue = v1010;
    double v1011 = FCAppConfigurationDoubleValue(v5, @"videoCompletePlaybackImpressionValue", 2.0);
    if (v1011 < 0.0) {
      double v1011 = 2.0;
    }
    v7->_videoCompletePlaybackImpressionValue = v1011;
    double v1012 = FCAppConfigurationDoubleValue(v5, @"videoComplete25ImpressionValue", 0.0);
    if (v1012 < 0.0) {
      double v1012 = 0.0;
    }
    v7->_videoComplete25ImpressionValue = v1012;
    double v1013 = FCAppConfigurationDoubleValue(v5, @"videoComplete50ImpressionValue", 0.0);
    if (v1013 < 0.0) {
      double v1013 = 0.0;
    }
    v7->_videoComplete50ImpressionValue = v1013;
    double v1014 = FCAppConfigurationDoubleValue(v5, @"videoComplete75ImpressionValue", 0.0);
    if (v1014 < 0.0) {
      double v1014 = 0.0;
    }
    v7->_videoComplete75ImpressionValue = v1014;
    double v1015 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetPresentationImpressionValue", 0.0);
    if (v1015 < 0.0) {
      double v1015 = 0.0;
    }
    v7->_newsTodayWidgetPresentationImpressionValue = v1015;
    double v1016 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetClickImpressionValue", 0.0);
    if (v1016 < 0.0) {
      double v1016 = 0.0;
    }
    v7->_newsTodayWidgetClickImpressionValue = v1016;
    double v1017 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetVideoPlaybackImpressionValue", 0.0);
    if (v1017 < 0.0) {
      double v1017 = 0.0;
    }
    v7->_newsTodayWidgetVideoPlaybackImpressionValue = v1017;
    double v1018 = FCAppConfigurationDoubleValue(v5, @"appInstallImpressionValue", 0.0);
    if (v1018 < 0.0) {
      double v1018 = 0.0;
    }
    v7->_appInstallImpressionValue = v1018;
    double v1019 = FCAppConfigurationDoubleValue(v5, @"appInFocusImpressionValue", 0.0);
    if (v1019 < 0.0) {
      double v1019 = 0.0;
    }
    v7->_appInFocusImpressionValue = v1019;
    double v1020 = FCAppConfigurationDoubleValue(v5, @"safariHistoryImpressionValue", 0.0);
    if (v1020 < 0.0) {
      double v1020 = 0.0;
    }
    v7->_safariHistoryImpressionValue = v1020;
    double v1021 = FCAppConfigurationDoubleValue(v5, @"publisherBoostForSourceMoreFromFeedImpressionValue", 0.0);
    if (v1021 < 0.0) {
      double v1021 = 0.0;
    }
    v7->_publisherBoostForSourceMoreFromFeedImpressionValue = v1021;
    double v1022 = FCAppConfigurationDoubleValue(v5, @"topicBoostForSourceRelatedFeedImpressionValue", 0.0);
    if (v1022 < 0.0) {
      double v1022 = 0.0;
    }
    v7->_topicBoostForSourceRelatedFeedImpressionValue = v1022;
    double v1023 = FCAppConfigurationDoubleValue(v5, @"publisherBoostForIssueOpenImpressionValue", 0.0);
    if (v1023 < 0.0) {
      double v1023 = 0.0;
    }
    v7->_publisherBoostForIssueOpenImpressionValue = v1023;
    double v1024 = FCAppConfigurationDoubleValue(v5, @"trackVisitedImpressionValue", 1.0);
    if (v1024 < 0.0) {
      double v1024 = 1.0;
    }
    v7->_trackVisitedImpressionValue = v1024;
    double v1025 = FCAppConfigurationDoubleValue(v5, @"trackListenedImpressionValue", 3.0);
    if (v1025 < 0.0) {
      double v1025 = 3.0;
    }
    v7->_trackListenedImpressionValue = v1025;
    double v1026 = FCAppConfigurationDoubleValue(v5, @"trackFinishedImpressionValue", 10.0);
    if (v1026 < 0.0) {
      double v1026 = 10.0;
    }
    v7->_trackFinishedImpressionValue = v1026;
    double v1027 = FCAppConfigurationDoubleValue(v5, @"sportsTagSeenImpressionValue", 1.0);
    if (v1027 < 0.0) {
      double v1027 = 1.0;
    }
    v7->_sportsTagSeenImpressionValue = v1027;
    double v1028 = FCAppConfigurationDoubleValue(v5, @"ignoreImpressionValue", 50.0);
    if (v1028 < 0.0) {
      double v1028 = 50.0;
    }
    v7->_ignoreImpressionValue = v1028;
    double v1029 = FCAppConfigurationDoubleValue(v5, @"presentationBaselineImpressionValue", 1.0);
    if (v1029 < 0.0) {
      double v1029 = 1.0;
    }
    v7->_presentationBaselineImpressionValue = v1029;
    double v1030 = FCAppConfigurationDoubleValue(v5, @"heavyClickBaselineImpressionValue", 0.0);
    if (v1030 < 0.0) {
      double v1030 = 0.0;
    }
    v7->_heavyClickBaselineImpressionValue = v1030;
    double v1031 = FCAppConfigurationDoubleValue(v5, @"likeBaselineImpressionValue", 0.0);
    if (v1031 < 0.0) {
      double v1031 = 0.0;
    }
    v7->_likeBaselineImpressionValue = v1031;
    double v1032 = FCAppConfigurationDoubleValue(v5, @"shareBaselineImpressionValue", 0.0);
    if (v1032 < 0.0) {
      double v1032 = 0.0;
    }
    v7->_shareBaselineImpressionValue = v1032;
    double v1033 = FCAppConfigurationDoubleValue(v5, @"savedBaselineImpressionValue", 0.0);
    if (v1033 < 0.0) {
      double v1033 = 0.0;
    }
    v7->_savedBaselineImpressionValue = v1033;
    double v1034 = FCAppConfigurationDoubleValue(v5, @"subscribeBaselineImpressionValue", 0.0);
    if (v1034 < 0.0) {
      double v1034 = 0.0;
    }
    v7->_subscribeBaselineImpressionValue = v1034;
    double v1035 = FCAppConfigurationDoubleValue(v5, @"subscribeRelatedBaselineImpressionValue", 0.0);
    if (v1035 < 0.0) {
      double v1035 = 0.0;
    }
    v7->_subscribeRelatedBaselineImpressionValue = v1035;
    double v1036 = FCAppConfigurationDoubleValue(v5, @"existingSubscriptionBaselineImpressionValue", 0.0);
    if (v1036 < 0.0) {
      double v1036 = 0.0;
    }
    v7->_existingSubscriptionBaselineImpressionValue = v1036;
    double v1037 = FCAppConfigurationDoubleValue(v5, @"existingSubscriptionRelatedBaselineImpressionValue", 0.0);
    if (v1037 < 0.0) {
      double v1037 = 0.0;
    }
    v7->_existingSubscriptionRelatedBaselineImpressionValue = v1037;
    double v1038 = FCAppConfigurationDoubleValue(v5, @"tappedBaselineImpressionValue", 0.0);
    if (v1038 < 0.0) {
      double v1038 = 0.0;
    }
    v7->_tappedBaselineImpressionValue = v1038;
    double v1039 = FCAppConfigurationDoubleValue(v5, @"weakClickBaselineImpressionValue", 0.0);
    if (v1039 < 0.0) {
      double v1039 = 0.0;
    }
    v7->_weakClickBaselineImpressionValue = v1039;
    double v1040 = FCAppConfigurationDoubleValue(v5, @"unsubscribeBaselineImpressionValue", 0.0);
    if (v1040 < 0.0) {
      double v1040 = 0.0;
    }
    v7->_unsubscribeBaselineImpressionValue = v1040;
    double v1041 = FCAppConfigurationDoubleValue(v5, @"visitBaselineImpressionValue", 0.0);
    if (v1041 < 0.0) {
      double v1041 = 0.0;
    }
    v7->_visitBaselineImpressionValue = v1041;
    double v1042 = FCAppConfigurationDoubleValue(v5, @"dislikeBaselineImpressionValue", 0.0);
    if (v1042 < 0.0) {
      double v1042 = 0.0;
    }
    v7->_dislikeBaselineImpressionValue = v1042;
    double v1043 = FCAppConfigurationDoubleValue(v5, @"recommendationPresentationFeedBaselineImpressionValue", 0.0);
    if (v1043 < 0.0) {
      double v1043 = 0.0;
    }
    v7->_recommendationPresentationFeedBaselineImpressionValue = v1043;
    double v1044 = FCAppConfigurationDoubleValue(v5, @"recommendationPresentationExploreBaselineImpressionValue", 0.0);
    if (v1044 < 0.0) {
      double v1044 = 0.0;
    }
    v7->_recommendationPresentationExploreBaselineImpressionValue = v1044;
    double v1045 = FCAppConfigurationDoubleValue(v5, @"premiumSubscriptionActivationBaselineImpressionValue", 0.0);
    if (v1045 < 0.0) {
      double v1045 = 0.0;
    }
    v7->_premiumSubscriptionActivationBaselineImpressionValue = v1045;
    double v1046 = FCAppConfigurationDoubleValue(v5, @"muteBaselineImpressionValue", 0.0);
    if (v1046 < 0.0) {
      double v1046 = 0.0;
    }
    v7->_muteBaselineImpressionValue = v1046;
    double v1047 = FCAppConfigurationDoubleValue(v5, @"unmuteBaselineImpressionValue", 0.0);
    if (v1047 < 0.0) {
      double v1047 = 0.0;
    }
    v7->_unmuteBaselineImpressionValue = v1047;
    double v1048 = FCAppConfigurationDoubleValue(v5, @"videoInitiatePlaybackBaselineImpressionValue", 0.0);
    if (v1048 < 0.0) {
      double v1048 = 0.0;
    }
    v7->_videoInitiatePlaybackBaselineImpressionValue = v1048;
    double v1049 = FCAppConfigurationDoubleValue(v5, @"videoCompletePlaybackBaselineImpressionValue", 0.0);
    if (v1049 < 0.0) {
      double v1049 = 0.0;
    }
    v7->_videoCompletePlaybackBaselineImpressionValue = v1049;
    double v1050 = FCAppConfigurationDoubleValue(v5, @"videoComplete25BaselineImpressionValue", 0.0);
    if (v1050 < 0.0) {
      double v1050 = 0.0;
    }
    v7->_videoComplete25BaselineImpressionValue = v1050;
    double v1051 = FCAppConfigurationDoubleValue(v5, @"videoComplete50BaselineImpressionValue", 0.0);
    if (v1051 < 0.0) {
      double v1051 = 0.0;
    }
    v7->_videoComplete50BaselineImpressionValue = v1051;
    double v1052 = FCAppConfigurationDoubleValue(v5, @"videoComplete75BaselineImpressionValue", 0.0);
    if (v1052 < 0.0) {
      double v1052 = 0.0;
    }
    v7->_videoComplete75BaselineImpressionValue = v1052;
    double v1053 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetPresentationBaselineImpressionValue", 1.0);
    if (v1053 < 0.0) {
      double v1053 = 1.0;
    }
    v7->_newsTodayWidgetPresentationBaselineImpressionValue = v1053;
    double v1054 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetClickBaselineImpressionValue", 0.0);
    if (v1054 < 0.0) {
      double v1054 = 0.0;
    }
    v7->_newsTodayWidgetClickBaselineImpressionValue = v1054;
    double v1055 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetVideoPlaybackBaselineImpressionValue", 0.0);
    if (v1055 < 0.0) {
      double v1055 = 0.0;
    }
    v7->_newsTodayWidgetVideoPlaybackBaselineImpressionValue = v1055;
    double v1056 = FCAppConfigurationDoubleValue(v5, @"appInstallBaselineImpressionValue", 0.0);
    if (v1056 < 0.0) {
      double v1056 = 0.0;
    }
    v7->_appInstallBaselineImpressionValue = v1056;
    double v1057 = FCAppConfigurationDoubleValue(v5, @"appInFocusBaselineImpressionValue", 0.0);
    if (v1057 < 0.0) {
      double v1057 = 0.0;
    }
    v7->_appInFocusBaselineImpressionValue = v1057;
    double v1058 = FCAppConfigurationDoubleValue(v5, @"safariHistoryBaselineImpressionValue", 0.0);
    if (v1058 < 0.0) {
      double v1058 = 0.0;
    }
    v7->_safariHistoryBaselineImpressionValue = v1058;
    double v1059 = FCAppConfigurationDoubleValue(v5, @"publisherBoostForSourceMoreFromFeedBaselineImpressionValue", 0.0);
    if (v1059 < 0.0) {
      double v1059 = 0.0;
    }
    v7->_publisherBoostForSourceMoreFromFeedBaselineImpressionValue = v1059;
    double v1060 = FCAppConfigurationDoubleValue(v5, @"topicBoostForSourceRelatedFeedBaselineImpressionValue", 0.0);
    if (v1060 < 0.0) {
      double v1060 = 0.0;
    }
    v7->_topicBoostForSourceRelatedFeedBaselineImpressionValue = v1060;
    double v1061 = FCAppConfigurationDoubleValue(v5, @"publisherBoostForIssueOpenBaselineImpressionValue", 0.0);
    if (v1061 < 0.0) {
      double v1061 = 0.0;
    }
    v7->_publisherBoostForIssueOpenBaselineImpressionValue = v1061;
    double v1062 = FCAppConfigurationDoubleValue(v5, @"trackVisitedBaselineImpressionValue", 1.0);
    if (v1062 < 0.0) {
      double v1062 = 1.0;
    }
    v7->_trackVisitedBaselineImpressionValue = v1062;
    double v1063 = FCAppConfigurationDoubleValue(v5, @"trackListenedBaselineImpressionValue", 3.0);
    if (v1063 < 0.0) {
      double v1063 = 3.0;
    }
    v7->_trackListenedBaselineImpressionValue = v1063;
    double v1064 = FCAppConfigurationDoubleValue(v5, @"trackFinishedBaselineImpressionValue", 10.0);
    if (v1064 < 0.0) {
      double v1064 = 10.0;
    }
    v7->_trackFinishedBaselineImpressionValue = v1064;
    double v1065 = FCAppConfigurationDoubleValue(v5, @"sportsTagSeenBaselineImpressionValue", 1.0);
    if (v1065 < 0.0) {
      double v1065 = 1.0;
    }
    v7->_sportsTagSeenBaselineImpressionValue = v1065;
    double v1066 = FCAppConfigurationDoubleValue(v5, @"ignoreBaselineImpressionValue", 0.0);
    if (v1066 < 0.0) {
      double v1066 = 0.0;
    }
    v7->_ignoreBaselineImpressionValue = v1066;
    double v1067 = FCAppConfigurationDoubleValue(v5, @"presentationClickValue", 0.0);
    if (v1067 < 0.0) {
      double v1067 = 0.0;
    }
    v7->_presentationClickValue = v1067;
    double v1068 = FCAppConfigurationDoubleValue(v5, @"heavyClickClickValue", 3.0);
    if (v1068 < 0.0) {
      double v1068 = 3.0;
    }
    v7->_heavyClickClickValue = v1068;
    double v1069 = FCAppConfigurationDoubleValue(v5, @"likeClickValue", 2.0);
    if (v1069 < 0.0) {
      double v1069 = 2.0;
    }
    v7->_likeClickValue = v1069;
    double v1070 = FCAppConfigurationDoubleValue(v5, @"shareClickValue", 2.0);
    if (v1070 < 0.0) {
      double v1070 = 2.0;
    }
    v7->_shareClickValue = v1070;
    double v1071 = FCAppConfigurationDoubleValue(v5, @"savedClickValue", 1.0);
    if (v1071 < 0.0) {
      double v1071 = 1.0;
    }
    v7->_savedClickValue = v1071;
    double v1072 = FCAppConfigurationDoubleValue(v5, @"subscribeClickValue", 10.0);
    if (v1072 < 0.0) {
      double v1072 = 10.0;
    }
    v7->_subscribeClickValue = v1072;
    double v1073 = FCAppConfigurationDoubleValue(v5, @"subscribeRelatedClickValue", 0.0);
    if (v1073 < 0.0) {
      double v1073 = 0.0;
    }
    v7->_subscribeRelatedClickValue = v1073;
    double v1074 = FCAppConfigurationDoubleValue(v5, @"existingSubscriptionClickValue", 5.0);
    if (v1074 < 0.0) {
      double v1074 = 5.0;
    }
    v7->_existingSubscriptionClickValue = v1074;
    double v1075 = FCAppConfigurationDoubleValue(v5, @"existingSubscriptionRelatedClickValue", 0.0);
    if (v1075 < 0.0) {
      double v1075 = 0.0;
    }
    v7->_existingSubscriptionRelatedClickValue = v1075;
    double v1076 = FCAppConfigurationDoubleValue(v5, @"tappedClickValue", 0.0);
    if (v1076 < 0.0) {
      double v1076 = 0.0;
    }
    v7->_tappedClickValue = v1076;
    double v1077 = FCAppConfigurationDoubleValue(v5, @"weakClickClickValue", 1.0);
    if (v1077 < 0.0) {
      double v1077 = 1.0;
    }
    v7->_weakClickClickValue = v1077;
    double v1078 = FCAppConfigurationDoubleValue(v5, @"unsubscribeClickValue", 0.0);
    if (v1078 < 0.0) {
      double v1078 = 0.0;
    }
    v7->_double unsubscribeClickValue = v1078;
    double v1079 = FCAppConfigurationDoubleValue(v5, @"visitClickValue", 3.0);
    if (v1079 < 0.0) {
      double v1079 = 3.0;
    }
    v7->_visitClickValue = v1079;
    double v1080 = FCAppConfigurationDoubleValue(v5, @"dislikeClickValue", 0.0);
    if (v1080 < 0.0) {
      double v1080 = 0.0;
    }
    v7->_dislikeClickValue = v1080;
    double v1081 = FCAppConfigurationDoubleValue(v5, @"recommendationPresentationFeedClickValue", 0.0);
    if (v1081 < 0.0) {
      double v1081 = 0.0;
    }
    v7->_recommendationPresentationFeedClickValue = v1081;
    double v1082 = FCAppConfigurationDoubleValue(v5, @"recommendationPresentationExploreClickValue", 0.0);
    if (v1082 < 0.0) {
      double v1082 = 0.0;
    }
    v7->_recommendationPresentationExploreClickValue = v1082;
    double v1083 = FCAppConfigurationDoubleValue(v5, @"premiumSubscriptionActivationClickValue", 25.0);
    if (v1083 < 0.0) {
      double v1083 = 25.0;
    }
    v7->_premiumSubscriptionActivationClickValue = v1083;
    double v1084 = FCAppConfigurationDoubleValue(v5, @"muteClickValue", 0.0);
    if (v1084 < 0.0) {
      double v1084 = 0.0;
    }
    v7->_muteClickValue = v1084;
    double v1085 = FCAppConfigurationDoubleValue(v5, @"unmuteClickValue", 0.0);
    if (v1085 < 0.0) {
      double v1085 = 0.0;
    }
    v7->_unmuteClickValue = v1085;
    double v1086 = FCAppConfigurationDoubleValue(v5, @"videoInitiatePlaybackClickValue", 1.0);
    if (v1086 < 0.0) {
      double v1086 = 1.0;
    }
    v7->_videoInitiatePlaybackClickValue = v1086;
    double v1087 = FCAppConfigurationDoubleValue(v5, @"videoCompletePlaybackClickValue", 2.0);
    if (v1087 < 0.0) {
      double v1087 = 2.0;
    }
    v7->_videoCompletePlaybackClickValue = v1087;
    double v1088 = FCAppConfigurationDoubleValue(v5, @"videoComplete25ClickValue", 0.0);
    if (v1088 < 0.0) {
      double v1088 = 0.0;
    }
    v7->_videoComplete25ClickValue = v1088;
    double v1089 = FCAppConfigurationDoubleValue(v5, @"videoComplete50ClickValue", 0.0);
    if (v1089 < 0.0) {
      double v1089 = 0.0;
    }
    v7->_videoComplete50ClickValue = v1089;
    double v1090 = FCAppConfigurationDoubleValue(v5, @"videoComplete75ClickValue", 0.0);
    if (v1090 < 0.0) {
      double v1090 = 0.0;
    }
    v7->_videoComplete75ClickValue = v1090;
    double v1091 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetPresentationClickValue", 0.0);
    if (v1091 < 0.0) {
      double v1091 = 0.0;
    }
    v7->_newsTodayWidgetPresentationClickValue = v1091;
    double v1092 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetClickClickValue", 1.0);
    if (v1092 < 0.0) {
      double v1092 = 1.0;
    }
    v7->_newsTodayWidgetClickClickValue = v1092;
    double v1093 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetVideoPlaybackClickValue", 1.0);
    if (v1093 < 0.0) {
      double v1093 = 1.0;
    }
    v7->_newsTodayWidgetVideoPlaybackClickValue = v1093;
    double v1094 = FCAppConfigurationDoubleValue(v5, @"appInstallClickValue", 0.0);
    if (v1094 < 0.0) {
      double v1094 = 0.0;
    }
    v7->_appInstallClickValue = v1094;
    double v1095 = FCAppConfigurationDoubleValue(v5, @"appInFocusClickValue", 0.0);
    if (v1095 < 0.0) {
      double v1095 = 0.0;
    }
    v7->_appInFocusClickValue = v1095;
    double v1096 = FCAppConfigurationDoubleValue(v5, @"safariHistoryClickValue", 0.0);
    if (v1096 < 0.0) {
      double v1096 = 0.0;
    }
    v7->_safariHistoryClickValue = v1096;
    double v1097 = FCAppConfigurationDoubleValue(v5, @"publisherBoostForSourceMoreFromFeedClickValue", 0.0);
    if (v1097 < 0.0) {
      double v1097 = 0.0;
    }
    v7->_publisherBoostForSourceMoreFromFeedClickValue = v1097;
    double v1098 = FCAppConfigurationDoubleValue(v5, @"topicBoostForSourceRelatedFeedClickValue", 0.0);
    if (v1098 < 0.0) {
      double v1098 = 0.0;
    }
    v7->_topicBoostForSourceRelatedFeedClickValue = v1098;
    double v1099 = FCAppConfigurationDoubleValue(v5, @"publisherBoostForIssueOpenClickValue", 0.0);
    if (v1099 < 0.0) {
      double v1099 = 0.0;
    }
    v7->_publisherBoostForIssueOpenClickValue = v1099;
    double v1100 = FCAppConfigurationDoubleValue(v5, @"trackVisitedClickValue", 1.0);
    if (v1100 < 0.0) {
      double v1100 = 1.0;
    }
    v7->_trackVisitedClickValue = v1100;
    double v1101 = FCAppConfigurationDoubleValue(v5, @"trackListenedClickValue", 3.0);
    if (v1101 < 0.0) {
      double v1101 = 3.0;
    }
    v7->_trackListenedClickValue = v1101;
    double v1102 = FCAppConfigurationDoubleValue(v5, @"trackFinishedClickValue", 10.0);
    if (v1102 < 0.0) {
      double v1102 = 10.0;
    }
    v7->_trackFinishedClickValue = v1102;
    double v1103 = FCAppConfigurationDoubleValue(v5, @"sportsTagSeenClickValue", 0.0);
    if (v1103 < 0.0) {
      double v1103 = 0.0;
    }
    v7->_sportsTagSeenClickValue = v1103;
    double v1104 = FCAppConfigurationDoubleValue(v5, @"ignoreClickValue", 0.0);
    if (v1104 < 0.0) {
      double v1104 = 0.0;
    }
    v7->_ignoreClickValue = v1104;
    double v1105 = FCAppConfigurationDoubleValue(v5, @"metaGroupingRelatednessThreshold", 0.7);
    if (v1105 > 1.0 || v1105 < 0.0) {
      double v1105 = 0.7;
    }
    v7->_metaGroupingRelatednessThreshold = v1105;
    double v1107 = FCAppConfigurationDoubleValue(v5, @"metaGroupingRelatednessKWeight", 0.1);
    if (v1107 < 0.0) {
      double v1107 = 0.1;
    }
    v7->_metaGroupingRelatednessKWeight = v1107;
    double v1108 = FCAppConfigurationDoubleValue(v5, @"metaGroupingTopicScoreWeight", 0.5);
    if (v1108 > 1.0 || v1108 < 0.0) {
      double v1108 = 0.5;
    }
    v7->_metaGroupingTopicScoreWeight = v1108;
    double v1110 = FCAppConfigurationDoubleValue(v5, @"metaGroupingHighestScoringRelativeScoreMultiplier", 100.0);
    if (v1110 <= 0.0) {
      double v1110 = 100.0;
    }
    v7->_metaGroupingHighestScoringRelativeScoreMultiplier = v1110;
    double v1111 = FCAppConfigurationDoubleValue(v5, @"metaGroupingSubscribedTopicMultiplier", 5.0);
    if (v1111 <= 0.0) {
      double v1111 = 5.0;
    }
    v7->_metaGroupingSubscribedTopicMultiplier = v1111;
    double v1112 = FCAppConfigurationDoubleValue(v5, @"presentationBaselineClickValue", 0.0);
    if (v1112 < 0.0) {
      double v1112 = 0.0;
    }
    v7->_presentationBaselineClickValue = v1112;
    double v1113 = FCAppConfigurationDoubleValue(v5, @"heavyClickBaselineClickValue", 0.0);
    if (v1113 < 0.0) {
      double v1113 = 0.0;
    }
    v7->_heavyClickBaselineClickValue = v1113;
    double v1114 = FCAppConfigurationDoubleValue(v5, @"likeBaselineClickValue", 0.0);
    if (v1114 < 0.0) {
      double v1114 = 0.0;
    }
    v7->_likeBaselineClickValue = v1114;
    double v1115 = FCAppConfigurationDoubleValue(v5, @"shareBaselineClickValue", 0.0);
    if (v1115 < 0.0) {
      double v1115 = 0.0;
    }
    v7->_shareBaselineClickValue = v1115;
    double v1116 = FCAppConfigurationDoubleValue(v5, @"savedBaselineClickValue", 0.0);
    if (v1116 < 0.0) {
      double v1116 = 0.0;
    }
    v7->_savedBaselineClickValue = v1116;
    double v1117 = FCAppConfigurationDoubleValue(v5, @"subscribeBaselineClickValue", 0.0);
    if (v1117 < 0.0) {
      double v1117 = 0.0;
    }
    v7->_subscribeBaselineClickValue = v1117;
    double v1118 = FCAppConfigurationDoubleValue(v5, @"subscribeRelatedBaselineClickValue", 0.0);
    if (v1118 < 0.0) {
      double v1118 = 0.0;
    }
    v7->_subscribeRelatedBaselineClickValue = v1118;
    double v1119 = FCAppConfigurationDoubleValue(v5, @"existingSubscriptionBaselineClickValue", 0.0);
    if (v1119 < 0.0) {
      double v1119 = 0.0;
    }
    v7->_existingSubscriptionBaselineClickValue = v1119;
    double v1120 = FCAppConfigurationDoubleValue(v5, @"existingSubscriptionRelatedBaselineClickValue", 0.0);
    if (v1120 < 0.0) {
      double v1120 = 0.0;
    }
    v7->_existingSubscriptionRelatedBaselineClickValue = v1120;
    double v1121 = FCAppConfigurationDoubleValue(v5, @"tappedBaselineClickValue", 0.0);
    if (v1121 < 0.0) {
      double v1121 = 0.0;
    }
    v7->_tappedBaselineClickValue = v1121;
    double v1122 = FCAppConfigurationDoubleValue(v5, @"weakClickBaselineClickValue", 1.0);
    if (v1122 < 0.0) {
      double v1122 = 1.0;
    }
    v7->_weakClickBaselineClickValue = v1122;
    double v1123 = FCAppConfigurationDoubleValue(v5, @"unsubscribeBaselineClickValue", 0.0);
    if (v1123 < 0.0) {
      double v1123 = 0.0;
    }
    v7->_unsubscribeBaselineClickValue = v1123;
    double v1124 = FCAppConfigurationDoubleValue(v5, @"visitBaselineClickValue", 0.0);
    if (v1124 < 0.0) {
      double v1124 = 0.0;
    }
    v7->_visitBaselineClickValue = v1124;
    double v1125 = FCAppConfigurationDoubleValue(v5, @"dislikeBaselineClickValue", 0.0);
    if (v1125 < 0.0) {
      double v1125 = 0.0;
    }
    v7->_dislikeBaselineClickValue = v1125;
    double v1126 = FCAppConfigurationDoubleValue(v5, @"recommendationPresentationFeedBaselineClickValue", 0.0);
    if (v1126 < 0.0) {
      double v1126 = 0.0;
    }
    v7->_recommendationPresentationFeedBaselineClickValue = v1126;
    double v1127 = FCAppConfigurationDoubleValue(v5, @"recommendationPresentationExploreBaselineClickValue", 0.0);
    if (v1127 < 0.0) {
      double v1127 = 0.0;
    }
    v7->_recommendationPresentationExploreBaselineClickValue = v1127;
    double v1128 = FCAppConfigurationDoubleValue(v5, @"premiumSubscriptionActivationBaselineClickValue", 0.0);
    if (v1128 < 0.0) {
      double v1128 = 0.0;
    }
    v7->_premiumSubscriptionActivationBaselineClickValue = v1128;
    double v1129 = FCAppConfigurationDoubleValue(v5, @"muteBaselineClickValue", 0.0);
    if (v1129 < 0.0) {
      double v1129 = 0.0;
    }
    v7->_muteBaselineClickValue = v1129;
    double v1130 = FCAppConfigurationDoubleValue(v5, @"unmuteBaselineClickValue", 0.0);
    if (v1130 < 0.0) {
      double v1130 = 0.0;
    }
    v7->_unmuteBaselineClickValue = v1130;
    double v1131 = FCAppConfigurationDoubleValue(v5, @"videoInitiatePlaybackBaselineClickValue", 0.0);
    if (v1131 < 0.0) {
      double v1131 = 0.0;
    }
    v7->_videoInitiatePlaybackBaselineClickValue = v1131;
    double v1132 = FCAppConfigurationDoubleValue(v5, @"videoCompletePlaybackBaselineClickValue", 0.0);
    if (v1132 < 0.0) {
      double v1132 = 0.0;
    }
    v7->_videoCompletePlaybackBaselineClickValue = v1132;
    double v1133 = FCAppConfigurationDoubleValue(v5, @"videoComplete25BaselineClickValue", 0.0);
    if (v1133 < 0.0) {
      double v1133 = 0.0;
    }
    v7->_videoComplete25BaselineClickValue = v1133;
    double v1134 = FCAppConfigurationDoubleValue(v5, @"videoComplete50BaselineClickValue", 0.0);
    if (v1134 < 0.0) {
      double v1134 = 0.0;
    }
    v7->_videoComplete50BaselineClickValue = v1134;
    double v1135 = FCAppConfigurationDoubleValue(v5, @"videoComplete75BaselineClickValue", 0.0);
    if (v1135 < 0.0) {
      double v1135 = 0.0;
    }
    v7->_videoComplete75BaselineClickValue = v1135;
    double v1136 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetPresentationBaselineClickValue", 0.0);
    if (v1136 < 0.0) {
      double v1136 = 0.0;
    }
    v7->_newsTodayWidgetPresentationBaselineClickValue = v1136;
    double v1137 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetClickBaselineClickValue", 1.0);
    if (v1137 < 0.0) {
      double v1137 = 1.0;
    }
    v7->_newsTodayWidgetClickBaselineClickValue = v1137;
    double v1138 = FCAppConfigurationDoubleValue(v5, @"newsTodayWidgetVideoPlaybackBaselineClickValue", 0.0);
    if (v1138 < 0.0) {
      double v1138 = 0.0;
    }
    v7->_newsTodayWidgetVideoPlaybackBaselineClickValue = v1138;
    double v1139 = FCAppConfigurationDoubleValue(v5, @"appInstallBaselineClickValue", 0.0);
    if (v1139 < 0.0) {
      double v1139 = 0.0;
    }
    v7->_appInstallBaselineClickValue = v1139;
    double v1140 = FCAppConfigurationDoubleValue(v5, @"appInFocusBaselineClickValue", 0.0);
    if (v1140 < 0.0) {
      double v1140 = 0.0;
    }
    v7->_appInFocusBaselineClickValue = v1140;
    double v1141 = FCAppConfigurationDoubleValue(v5, @"safariHistoryBaselineClickValue", 0.0);
    if (v1141 < 0.0) {
      double v1141 = 0.0;
    }
    v7->_safariHistoryBaselineClickValue = v1141;
    double v1142 = FCAppConfigurationDoubleValue(v5, @"publisherBoostForSourceMoreFromFeedBaselineClickValue", 0.0);
    if (v1142 < 0.0) {
      double v1142 = 0.0;
    }
    v7->_publisherBoostForSourceMoreFromFeedBaselineClickValue = v1142;
    double v1143 = FCAppConfigurationDoubleValue(v5, @"topicBoostForSourceRelatedFeedBaselineClickValue", 0.0);
    if (v1143 < 0.0) {
      double v1143 = 0.0;
    }
    v7->_topicBoostForSourceRelatedFeedBaselineClickValue = v1143;
    double v1144 = FCAppConfigurationDoubleValue(v5, @"publisherBoostForIssueOpenBaselineClickValue", 0.0);
    if (v1144 < 0.0) {
      double v1144 = 0.0;
    }
    v7->_publisherBoostForIssueOpenBaselineClickValue = v1144;
    double v1145 = FCAppConfigurationDoubleValue(v5, @"trackVisitedBaselineClickValue", 1.0);
    if (v1145 < 0.0) {
      double v1145 = 1.0;
    }
    v7->_trackVisitedBaselineClickValue = v1145;
    double v1146 = FCAppConfigurationDoubleValue(v5, @"trackListenedBaselineClickValue", 3.0);
    if (v1146 < 0.0) {
      double v1146 = 3.0;
    }
    v7->_trackListenedBaselineClickValue = v1146;
    double v1147 = FCAppConfigurationDoubleValue(v5, @"trackFinishedBaselineClickValue", 10.0);
    if (v1147 < 0.0) {
      double v1147 = 10.0;
    }
    v7->_trackFinishedBaselineClickValue = v1147;
    double v1148 = FCAppConfigurationDoubleValue(v5, @"sportsTagSeenBaselineClickValue", 0.0);
    if (v1148 < 0.0) {
      double v1148 = 0.0;
    }
    v7->_sportsTagSeenBaselineClickValue = v1148;
    double v1149 = FCAppConfigurationDoubleValue(v5, @"ignoreBaselineClickValue", 0.0);
    if (v1149 < 0.0) {
      double v1149 = 0.0;
    }
    v7->_ignoreBaselineClickValue = v1149;
    uint64_t v1150 = FCAppConfigurationIntegerValue(v5, @"minClusterSizeIPhone", 3);
    uint64_t v1151 = (uint64_t)(double)v1150;
    if (v1150 <= 0) {
      uint64_t v1151 = 3;
    }
    v7->_minClusterSizeIPhone = v1151;
    uint64_t v1152 = FCAppConfigurationIntegerValue(v5, @"maxClusterSizeIPhone", 30);
    uint64_t v1153 = (uint64_t)(double)v1152;
    if (v1152 <= 0) {
      uint64_t v1153 = 30;
    }
    v7->_maxClusterSizeIPhone = v1153;
    uint64_t v1154 = FCAppConfigurationIntegerValue(v5, @"minMoreForYouSizeIPhone", 3);
    uint64_t v1155 = (uint64_t)(double)v1154;
    if (v1154 <= 0) {
      uint64_t v1155 = 3;
    }
    v7->_minMoreForYouSizeIPhone = v1155;
    uint64_t v1156 = FCAppConfigurationIntegerValue(v5, @"maxMoreForYouSizeIPhone", 30);
    uint64_t v1157 = (uint64_t)(double)v1156;
    if (v1156 <= 0) {
      uint64_t v1157 = 30;
    }
    v7->_maxMoreForYouSizeIPhone = v1157;
    uint64_t v1158 = FCAppConfigurationIntegerValue(v5, @"minIdealClusterSizeIPhone", 3);
    uint64_t v1159 = (uint64_t)(double)v1158;
    if (v1158 <= 0) {
      uint64_t v1159 = 3;
    }
    v7->_minIdealClusterSizeIPhone = v1159;
    uint64_t v1160 = FCAppConfigurationIntegerValue(v5, @"maxIdealClusterSizeIPhone", 5);
    uint64_t v1161 = (uint64_t)(double)v1160;
    if (v1160 <= 0) {
      uint64_t v1161 = 5;
    }
    v7->_maxIdealClusterSizeIPhone = v1161;
    uint64_t v1162 = FCAppConfigurationIntegerValue(v5, @"minClusterSizeIPhoneAutoFavorite", 3);
    uint64_t v1163 = (uint64_t)(double)v1162;
    if (v1162 <= 0) {
      uint64_t v1163 = 3;
    }
    v7->_minClusterSizeIPhoneAutoFavorite = v1163;
    uint64_t v1164 = FCAppConfigurationIntegerValue(v5, @"maxClusterSizeIPhoneAutoFavorite", 3);
    uint64_t v1165 = (uint64_t)(double)v1164;
    if (v1164 <= 0) {
      uint64_t v1165 = 3;
    }
    v7->_maxClusterSizeIPhoneAutoFavorite = v1165;
    uint64_t v1166 = FCAppConfigurationIntegerValue(v5, @"minIdealClusterSizeIPhoneAutoFavorite", 3);
    uint64_t v1167 = (uint64_t)(double)v1166;
    if (v1166 <= 0) {
      uint64_t v1167 = 3;
    }
    v7->_minIdealClusterSizeIPhoneAutoFavorite = v1167;
    uint64_t v1168 = FCAppConfigurationIntegerValue(v5, @"maxIdealClusterSizeIPhoneAutoFavorite", 3);
    uint64_t v1169 = (uint64_t)(double)v1168;
    if (v1168 <= 0) {
      uint64_t v1169 = 3;
    }
    v7->_maxIdealClusterSizeIPhoneAutoFavorite = v1169;
    uint64_t v1170 = FCAppConfigurationIntegerValue(v5, @"maxPublisherOccurrencesIPhone", 2);
    uint64_t v1171 = (uint64_t)(double)v1170;
    if (v1170 <= 0) {
      uint64_t v1171 = 2;
    }
    v7->_maxPublisherOccurrencesIPhone = v1171;
    uint64_t v1172 = FCAppConfigurationIntegerValue(v5, @"maxPublisherOccurrencesIPhoneBestOfBundle", 2);
    uint64_t v1173 = (uint64_t)(double)v1172;
    if (v1172 <= 0) {
      uint64_t v1173 = 2;
    }
    v7->_maxPublisherOccurrencesIPhoneBestOfBundle = v1173;
    uint64_t v1174 = FCAppConfigurationIntegerValue(v5, @"maxPublisherOccurrencesIPhoneForYouGroup", 2);
    uint64_t v1175 = (uint64_t)(double)v1174;
    if (v1174 <= 0) {
      uint64_t v1175 = 2;
    }
    v7->_maxPublisherOccurrencesIPhoneForYouGroup = v1175;
    uint64_t v1176 = FCAppConfigurationIntegerValue(v5, @"maxPublisherOccurrencesIPhoneGreatStoriesYouMissed", 2);
    uint64_t v1177 = (uint64_t)(double)v1176;
    if (v1176 <= 0) {
      uint64_t v1177 = 2;
    }
    v7->_maxPublisherOccurrencesIPhoneGreatStoriesYouMissed = v1177;
    uint64_t v1178 = FCAppConfigurationIntegerValue(v5, @"maxUnpaidArticlesIPhone", 1);
    uint64_t v1179 = (uint64_t)(double)v1178;
    if (v1178 < 0) {
      uint64_t v1179 = 1;
    }
    v7->_maxUnpaidArticlesIPhone = v1179;
    uint64_t v1180 = FCAppConfigurationIntegerValue(v5, @"maxUnpaidArticlesIPhoneBestOfBundle", 99);
    uint64_t v1181 = (uint64_t)(double)v1180;
    if (v1180 < 0) {
      uint64_t v1181 = 99;
    }
    v7->_maxUnpaidArticlesIPhoneBestOfBundle = v1181;
    uint64_t v1182 = FCAppConfigurationIntegerValue(v5, @"maxUnpaidArticlesIPhoneForYouGroup", 1);
    uint64_t v1183 = (uint64_t)(double)v1182;
    if (v1182 < 0) {
      uint64_t v1183 = 1;
    }
    v7->_maxUnpaidArticlesIPhoneForYouGroup = v1183;
    uint64_t v1184 = FCAppConfigurationIntegerValue(v5, @"maxUnpaidArticlesIPhoneGreatStoriesYouMissed", 1);
    uint64_t v1185 = (uint64_t)(double)v1184;
    if (v1184 < 0) {
      uint64_t v1185 = 1;
    }
    v7->_maxUnpaidArticlesIPhoneGreatStoriesYouMissed = v1185;
    uint64_t v1186 = FCAppConfigurationIntegerValue(v5, @"maxNativeAdCountIPhone", 0);
    uint64_t v1187 = (uint64_t)(double)v1186;
    if (v1186 < 0) {
      uint64_t v1187 = 0;
    }
    v7->_maxNativeAdCountIPhone = v1187;
    uint64_t v1188 = FCAppConfigurationIntegerValue(v5, @"maxNativeAdCountIPhoneBestOfBundle", 0);
    uint64_t v1189 = (uint64_t)(double)v1188;
    if (v1188 < 0) {
      uint64_t v1189 = 0;
    }
    v7->_maxNativeAdCountIPhoneBestOfBundle = v1189;
    uint64_t v1190 = FCAppConfigurationIntegerValue(v5, @"maxNativeAdCountIPhoneForYouGroup", 0);
    uint64_t v1191 = (uint64_t)(double)v1190;
    if (v1190 < 0) {
      uint64_t v1191 = 0;
    }
    v7->_maxNativeAdCountIPhoneForYouGroup = v1191;
    uint64_t v1192 = FCAppConfigurationIntegerValue(v5, @"maxNativeAdCountIPhoneGreatStoriesYouMissed", 0);
    uint64_t v1193 = (uint64_t)(double)v1192;
    if (v1192 < 0) {
      uint64_t v1193 = 0;
    }
    v7->_maxNativeAdCountIPhoneGreatStoriesYouMissed = v1193;
    uint64_t v1194 = FCAppConfigurationIntegerValue(v5, @"minClusterSizeIPad", 3);
    uint64_t v1195 = (uint64_t)(double)v1194;
    if (v1194 <= 0) {
      uint64_t v1195 = 3;
    }
    v7->_minClusterSizeIPad = v1195;
    uint64_t v1196 = FCAppConfigurationIntegerValue(v5, @"maxClusterSizeIPad", 30);
    uint64_t v1197 = (uint64_t)(double)v1196;
    if (v1196 <= 0) {
      uint64_t v1197 = 30;
    }
    v7->_maxClusterSizeIPad = v1197;
    uint64_t v1198 = FCAppConfigurationIntegerValue(v5, @"minMoreForYouSizeIPad", 3);
    uint64_t v1199 = (uint64_t)(double)v1198;
    if (v1198 <= 0) {
      uint64_t v1199 = 3;
    }
    v7->_minMoreForYouSizeIPad = v1199;
    uint64_t v1200 = FCAppConfigurationIntegerValue(v5, @"maxMoreForYouSizeIPad", 30);
    uint64_t v1201 = (uint64_t)(double)v1200;
    if (v1200 <= 0) {
      uint64_t v1201 = 30;
    }
    v7->_maxMoreForYouSizeIPad = v1201;
    uint64_t v1202 = FCAppConfigurationIntegerValue(v5, @"minIdealClusterSizeIPad", 5);
    uint64_t v1203 = (uint64_t)(double)v1202;
    if (v1202 <= 0) {
      uint64_t v1203 = 5;
    }
    v7->_minIdealClusterSizeIPad = v1203;
    uint64_t v1204 = FCAppConfigurationIntegerValue(v5, @"maxIdealClusterSizeIPad", 9);
    uint64_t v1205 = (uint64_t)(double)v1204;
    if (v1204 <= 0) {
      uint64_t v1205 = 9;
    }
    v7->_maxIdealClusterSizeIPad = v1205;
    uint64_t v1206 = FCAppConfigurationIntegerValue(v5, @"minClusterSizeIPadAutoFavorite", 5);
    uint64_t v1207 = (uint64_t)(double)v1206;
    if (v1206 <= 0) {
      uint64_t v1207 = 5;
    }
    v7->_minClusterSizeIPadAutoFavorite = v1207;
    uint64_t v1208 = FCAppConfigurationIntegerValue(v5, @"maxClusterSizeIPadAutoFavorite", 5);
    uint64_t v1209 = (uint64_t)(double)v1208;
    if (v1208 <= 0) {
      uint64_t v1209 = 5;
    }
    v7->_maxClusterSizeIPadAutoFavorite = v1209;
    uint64_t v1210 = FCAppConfigurationIntegerValue(v5, @"minIdealClusterSizeIPadAutoFavorite", 5);
    uint64_t v1211 = (uint64_t)(double)v1210;
    if (v1210 <= 0) {
      uint64_t v1211 = 5;
    }
    v7->_minIdealClusterSizeIPadAutoFavorite = v1211;
    uint64_t v1212 = FCAppConfigurationIntegerValue(v5, @"maxIdealClusterSizeIPadAutoFavorite", 5);
    uint64_t v1213 = (uint64_t)(double)v1212;
    if (v1212 <= 0) {
      uint64_t v1213 = 5;
    }
    v7->_maxIdealClusterSizeIPadAutoFavorite = v1213;
    uint64_t v1214 = FCAppConfigurationIntegerValue(v5, @"maxPublisherOccurrencesIPad", 2);
    uint64_t v1215 = (uint64_t)(double)v1214;
    if (v1214 <= 0) {
      uint64_t v1215 = 2;
    }
    v7->_maxPublisherOccurrencesIPad = v1215;
    uint64_t v1216 = FCAppConfigurationIntegerValue(v5, @"maxPublisherOccurrencesIPadBestOfBundle", 2);
    uint64_t v1217 = (uint64_t)(double)v1216;
    if (v1216 <= 0) {
      uint64_t v1217 = 2;
    }
    v7->_maxPublisherOccurrencesIPadBestOfBundle = v1217;
    uint64_t v1218 = FCAppConfigurationIntegerValue(v5, @"maxPublisherOccurrencesIPadForYouGroup", 2);
    uint64_t v1219 = (uint64_t)(double)v1218;
    if (v1218 <= 0) {
      uint64_t v1219 = 2;
    }
    v7->_maxPublisherOccurrencesIPadForYouGroup = v1219;
    uint64_t v1220 = FCAppConfigurationIntegerValue(v5, @"maxPublisherOccurrencesIPadGreatStoriesYouMissed", 2);
    uint64_t v1221 = (uint64_t)(double)v1220;
    if (v1220 <= 0) {
      uint64_t v1221 = 2;
    }
    v7->_maxPublisherOccurrencesIPadGreatStoriesYouMissed = v1221;
    uint64_t v1222 = FCAppConfigurationIntegerValue(v5, @"maxUnpaidArticlesIPad", 1);
    uint64_t v1223 = (uint64_t)(double)v1222;
    if (v1222 < 0) {
      uint64_t v1223 = 1;
    }
    v7->_maxUnpaidArticlesIPad = v1223;
    uint64_t v1224 = FCAppConfigurationIntegerValue(v5, @"maxUnpaidArticlesIPadBestOfBundle", 99);
    uint64_t v1225 = (uint64_t)(double)v1224;
    if (v1224 < 0) {
      uint64_t v1225 = 99;
    }
    v7->_maxUnpaidArticlesIPadBestOfBundle = v1225;
    uint64_t v1226 = FCAppConfigurationIntegerValue(v5, @"maxUnpaidArticlesIPadForYouGroup", 1);
    uint64_t v1227 = (uint64_t)(double)v1226;
    if (v1226 < 0) {
      uint64_t v1227 = 1;
    }
    v7->_maxUnpaidArticlesIPadForYouGroup = v1227;
    uint64_t v1228 = FCAppConfigurationIntegerValue(v5, @"maxUnpaidArticlesIPadGreatStoriesYouMissed", 1);
    uint64_t v1229 = (uint64_t)(double)v1228;
    if (v1228 < 0) {
      uint64_t v1229 = 1;
    }
    v7->_maxUnpaidArticlesIPadGreatStoriesYouMissed = v1229;
    uint64_t v1230 = FCAppConfigurationIntegerValue(v5, @"maxNativeAdCountIPad", 0);
    uint64_t v1231 = (uint64_t)(double)v1230;
    if (v1230 < 0) {
      uint64_t v1231 = 0;
    }
    v7->_maxNativeAdCountIPad = v1231;
    uint64_t v1232 = FCAppConfigurationIntegerValue(v5, @"maxNativeAdCountIPadBestOfBundle", 0);
    uint64_t v1233 = (uint64_t)(double)v1232;
    if (v1232 < 0) {
      uint64_t v1233 = 0;
    }
    v7->_maxNativeAdCountIPadBestOfBundle = v1233;
    uint64_t v1234 = FCAppConfigurationIntegerValue(v5, @"maxNativeAdCountIPadForYouGroup", 0);
    uint64_t v1235 = (uint64_t)(double)v1234;
    if (v1234 < 0) {
      uint64_t v1235 = 0;
    }
    v7->_maxNativeAdCountIPadForYouGroup = v1235;
    uint64_t v1236 = FCAppConfigurationIntegerValue(v5, @"maxNativeAdCountIPadGreatStoriesYouMissed", 0);
    uint64_t v1237 = (uint64_t)(double)v1236;
    if (v1236 < 0) {
      uint64_t v1237 = 0;
    }
    v7->_maxNativeAdCountIPadGreatStoriesYouMissed = v1237;
    double v1238 = FCAppConfigurationDoubleValue(v5, @"relatedTopicMultiplier", 0.8);
    if (v1238 > 1.0 || v1238 < 0.0) {
      double v1238 = 0.8;
    }
    v7->_relatedTopicMultiplier = v1238;
    double v1240 = FCAppConfigurationDoubleValue(v5, @"relatedTopicRatioFilter", 0.3);
    if (v1240 > 1.0 || v1240 < 0.0) {
      double v1240 = 0.3;
    }
    v7->_relatedTopicRatioFilter = v1240;
    v7->_managedTopicMultiplier = FCAppConfigurationDoubleValue(v5, @"managedTopicMultiplier", 1.0);
    v7->_managedWinnerTopicMultiplier = FCAppConfigurationDoubleValue(v5, @"managedWinnerTopicMultiplier", 1.0);
    v7->_topicAutofavoritedMultiplier = FCAppConfigurationDoubleValue(v5, @"topicAutofavoritedMultiplier", 1.0);
    v7->_topicFavoritedMultiplier = FCAppConfigurationDoubleValue(v5, @"topicFavoritedMultiplier", 1.0);
    v7->_topicGroupSizeMultiplier = FCAppConfigurationDoubleValue(v5, @"topicGroupSizeMultiplier", 1.0);
    v7->_topicGroupableMultiplier = FCAppConfigurationDoubleValue(v5, @"topicGroupableMultiplier", 1.0);
    v7->_channelScoreWeight = FCAppConfigurationDoubleValue(v5, @"channelScoreWeight", 0.5);
    v7->_topicScoreWeight = FCAppConfigurationDoubleValue(v5, @"topicScoreWeight", 0.5);
    v7->_topicSpecificityMultiplier = FCAppConfigurationDoubleValue(v5, @"topicSpecificityMultiplier", 1.0);
    uint64_t v1242 = FCAppConfigurationIntegerValue(v5, @"publisherDiversityMinPublisherCount", 3);
    unint64_t v1243 = (unint64_t)(double)v1242;
    if (v1242 <= 0) {
      unint64_t v1243 = 3;
    }
    v7->_publisherDiversityMinPublisherCount = v1243;
    uint64_t v1244 = FCAppConfigurationIntegerValue(v5, @"publisherDiversityMaxPublisherCount", 10);
    unint64_t v1245 = (unint64_t)(double)v1244;
    if (v1244 <= 0) {
      unint64_t v1245 = 10;
    }
    v7->_publisherDiversityMaxPublisherCount = v1245;
    double v1246 = FCAppConfigurationDoubleValue(v5, @"publisherDiversityMaxArticleFilter", 0.3);
    if (v1246 <= 0.0) {
      double v1246 = 0.3;
    }
    v7->_publisherDiversityMaxArticleFilter = v1246;
    uint64_t v1247 = FCAppConfigurationIntegerValue(v5, @"maxEvergreenArticlesPerGroup", 2);
    uint64_t v1248 = (uint64_t)(double)v1247;
    if (v1247 < 0) {
      uint64_t v1248 = 2;
    }
    v7->_maxEvergreenArticlesPerGroup = v1248;
    double v1249 = FCAppConfigurationDoubleValue(v5, @"safariSignalWeight", 1.0);
    if (v1249 > 1.0 || v1249 < 0.0) {
      double v1249 = 1.0;
    }
    v7->_safariSignalWeight = v1249;
    double v1251 = FCAppConfigurationDoubleValue(v5, @"safariTimeDecayMultiplier", 0.99);
    if (v1251 <= 0.0) {
      double v1251 = 0.99;
    }
    v7->_safariTimeDecayMultiplier = v1251;
    double v1252 = FCAppConfigurationDoubleValue(v5, @"safariOccurrenceDecayMultiplier", 0.995);
    if (v1252 > 1.0 || v1252 < 0.0) {
      double v1252 = 0.995;
    }
    v7->_safariOccurrenceDecayMultiplier = v1252;
    double v1254 = FCAppConfigurationDoubleValue(v5, @"safariEventBlackoutSeconds", 90.0);
    if (v1254 < 0.0) {
      double v1254 = 90.0;
    }
    v7->_safariEventBlackoutSeconds = v1254;
    double v1255 = FCAppConfigurationDoubleValue(v5, @"autoFavoriteMinObservationsSafari", 4.0);
    if (v1255 <= 0.0) {
      double v1255 = 4.0;
    }
    v7->_autoFavoriteMinObservationsSafari = v1255;
    double v1256 = FCAppConfigurationDoubleValue(v5, @"autoFavoriteMinScoreSafari", 3.0);
    if (v1256 <= 0.0) {
      double v1256 = 3.0;
    }
    v7->_autoFavoriteMinScoreSafari = v1256;
    v7->_safariTagFavorabilityExponent = FCAppConfigurationDoubleValue(v5, @"safariTagFavorabilityExponent", 1.0);
    v7->_safariPriorFactorExponent = FCAppConfigurationDoubleValue(v5, @"safariPriorFactorExponent", 0.0);
    double v1257 = FCAppConfigurationDoubleValue(v5, @"appUsageSignalWeight", 1.0);
    if (v1257 > 1.0 || v1257 < 0.0) {
      double v1257 = 1.0;
    }
    v7->_appUsageSignalWeight = v1257;
    double v1259 = FCAppConfigurationDoubleValue(v5, @"appUsageTimeDecayMultiplier", 0.99);
    if (v1259 > 1.0 || v1259 < 0.0) {
      double v1259 = 0.99;
    }
    v7->_appUsageTimeDecayMultiplier = v1259;
    double v1261 = FCAppConfigurationDoubleValue(v5, @"appUsageOccurrenceDecayMultiplier", 0.995);
    if (v1261 <= 0.0) {
      double v1261 = 0.995;
    }
    v7->_appUsageOccurrenceDecayMultiplier = v1261;
    double v1262 = FCAppConfigurationDoubleValue(v5, @"autoFavoriteMinObservationsExtAppUsage", 1.0);
    if (v1262 <= 0.0) {
      double v1262 = 1.0;
    }
    v7->_autoFavoriteMinObservationsExtAppUsage = v1262;
    double v1263 = FCAppConfigurationDoubleValue(v5, @"autoFavoriteMinScoreExtAppUsage", 1.0);
    if (v1263 <= 0.0) {
      double v1263 = 1.0;
    }
    v7->_autoFavoriteMinScoreExtAppUsage = v1263;
    v7->_appUsageTagFavorabilityExponent = FCAppConfigurationDoubleValue(v5, @"appUsageTagFavorabilityExponent", 1.0);
    v7->_appUsagePriorFactorExponent = FCAppConfigurationDoubleValue(v5, @"appUsagePriorFactorExponent", 0.0);
    double v1264 = FCAppConfigurationDoubleValue(v5, @"portraitSignalWeight", 1.0);
    if (v1264 > 1.0 || v1264 < 0.0) {
      double v1264 = 1.0;
    }
    v7->_portraitSignalWeight = v1264;
    double v1266 = FCAppConfigurationDoubleValue(v5, @"portraitDecayRate", 1209600.0);
    if (v1266 < 0.0) {
      double v1266 = 1209600.0;
    }
    v7->_portraitDecayRate = v1266;
    double v1267 = FCAppConfigurationDoubleValue(v5, @"portraitGlobalThreshold", 0.6);
    if (v1267 > 1.0 || v1267 < 0.0) {
      double v1267 = 0.6;
    }
    v7->_portraitGlobalThreshold = v1267;
    v7->_portraitTagFavorabilityExponent = FCAppConfigurationDoubleValue(v5, @"portraitTagFavorabilityExponent", 1.0);
    v7->_portraitPriorFactorExponent = FCAppConfigurationDoubleValue(v5, @"portraitPriorFactorExponent", 0.0);
    double v1269 = FCAppConfigurationDoubleValue(v5, @"internalUsageSignalWeight", 1.0);
    if (v1269 > 1.0 || v1269 < 0.0) {
      double v1269 = 1.0;
    }
    v7->_internalUsageSignalWeight = v1269;
    double v1271 = FCAppConfigurationDoubleValue(v5, @"autoFavoriteMaxIdleTime", 604800.0);
    if (v1271 <= 0.0) {
      double v1271 = 604800.0;
    }
    v7->_autoFavoriteMaxIdleTime = v1271;
    double v1272 = FCAppConfigurationDoubleValue(v5, @"autoFavoriteMinClicks", 10.0);
    if (v1272 <= 0.0) {
      double v1272 = 10.0;
    }
    v7->_autoFavoriteMinClicks = v1272;
    double v1273 = FCAppConfigurationDoubleValue(v5, @"autoFavoriteMinEvents", 25.0);
    if (v1273 <= 0.0) {
      double v1273 = 25.0;
    }
    v7->_autoFavoriteMinEvents = v1273;
    double v1274 = FCAppConfigurationDoubleValue(v5, @"autoFavoriteMinRate", 0.1);
    if (v1274 <= 0.0) {
      double v1274 = 0.1;
    }
    v7->_autoFavoriteMinRate = v1274;
    double v1275 = FCAppConfigurationDoubleValue(v5, @"autoFavoriteMinRelativeRate", 0.75);
    if (v1275 <= 0.0) {
      double v1275 = 0.75;
    }
    v7->_autoFavoriteMinRelativeRate = v1275;
    double v1276 = FCAppConfigurationDoubleValue(v5, @"autoUnfavoriteFactor", 1.1);
    if (v1276 <= 0.0) {
      double v1276 = 1.1;
    }
    v7->_autoUnfavoriteFactor = v1276;
    double v1277 = FCAppConfigurationDoubleValue(v5, @"autoGroupableFactor", 0.8);
    if (v1277 <= 0.0) {
      double v1277 = 0.8;
    }
    v7->_autoGroupableFactor = v1277;
    v7->_autoFavoriteTagFavorabilityExponent = FCAppConfigurationDoubleValue(v5, @"autoFavoriteTagFavorabilityExponent", 1.0);
    v7->_autoFavoritePriorFactorExponent = FCAppConfigurationDoubleValue(v5, @"autoFavoritePriorFactorExponent", 1.0);
    double v1278 = FCAppConfigurationDoubleValue(v5, @"groupImpressionBiasCorrectionFactor", 1.0);
    if (v1278 >= 1.0 || v1278 < 0.0) {
      double v1278 = 1.0;
    }
    v7->_groupImpressionBiasCorrectionFactor = v1278;
    double v1280 = FCAppConfigurationDoubleValue(v5, @"indexImpressionBiasCorrectionFactor", 1.0);
    if (v1280 >= 1.0 || v1280 < 0.0) {
      double v1280 = 1.0;
    }
    v7->_indexImpressionBiasCorrectionFactor = v1280;
    uint64_t v1282 = FCAppConfigurationIntegerValue(v5, @"maxNumberOfSuggestions", 40);
    uint64_t v1283 = (uint64_t)(double)v1282;
    if (v1282 < 0) {
      uint64_t v1283 = 40;
    }
    v7->_maxNumberOfSuggestions = v1283;
    double v1284 = FCAppConfigurationDoubleValue(v5, @"uGroupMinimumSubscribedChannelSourceFeedArticleRatio", 0.5);
    if (v1284 < 0.0) {
      double v1284 = 0.5;
    }
    v7->_uGroupMinimumSubscribedChannelSourceFeedArticleRatio = v1284;
    v7->_numEventsToDisableDefaultTopics = FCAppConfigurationIntegerValue(v5, @"numEventsToDisableDefaultTopics", -1);
    uint64_t v1285 = FCAppConfigurationIntegerValue(v5, @"numSubscriptionsToDisableDefaultTopics", 5);
    uint64_t v1286 = (uint64_t)(double)v1285;
    if (v1285 < 0) {
      uint64_t v1286 = 5;
    }
    v7->_numSubscriptionsToDisableDefaultTopics = v1286;
    uint64_t v1287 = FCAppConfigurationIntegerValue(v5, @"auditionedAutoFavoritesEmitterLimit", 1);
    uint64_t v1288 = (uint64_t)(double)v1287;
    if (v1287 < 0) {
      uint64_t v1288 = 1;
    }
    v7->_auditionedAutoFavoritesEmitterLimit = v1288;
    double v1289 = FCAppConfigurationDoubleValue(v5, @"topicDiversityThreshold", 1.0);
    if (v1289 >= 1.0 || v1289 < 0.0) {
      double v1289 = 1.0;
    }
    v7->_topicDiversityThreshold = v1289;
    uint64_t v1291 = FCAppConfigurationIntegerValue(v5, @"topicDiversityWindowSize", 3);
    uint64_t v1292 = (uint64_t)(double)v1291;
    if (v1291 <= 0) {
      uint64_t v1292 = 3;
    }
    v7->_topicDiversityWindowSize = v1292;
    uint64_t v1293 = FCAppConfigurationIntegerValue(v5, @"minBaselineEventsToSubmitUserVector", 0);
    uint64_t v1294 = (uint64_t)(double)v1293;
    if (v1293 < 0) {
      uint64_t v1294 = 0;
    }
    v7->_minBaselineEventsToSubmitUserVector = v1294;
    v7->_personalizesSportsTagsInUserVector = FCAppConfigurationBoolValue(v5, @"personalizesFavoritedSportsTags", 0);
    v7->_shadowModeScoringEnabled = FCAppConfigurationBoolValue(v5, @"shadowModeScoringEnabled", 0);
    v7->_topicFeedFilterMutedTopics = (double)FCAppConfigurationBoolValue(v5, @"topicFeedFilterMutedTopics", 1);
    v7->_magazineFeedGroupScoreWeight = FCAppConfigurationDoubleValue(v5, @"magazineFeedGroupScoreWeight", 0.0);
    v7->_audioFeedGroupScoreWeight = FCAppConfigurationDoubleValue(v5, @"audioFeedGroupScoreWeight", 0.0);
    v7->_forYouGroupFilteredSubsetCount = FCAppConfigurationIntegerValue(v5, @"forYouGroupFilteredSubsetCount", 100);
    v7->_forYouGroupAllowUnfilteredArticles = FCAppConfigurationBoolValue(v5, @"forYouGroupAllowUnfilteredArticles", 0);
    v7->_topStoriesGroupAggregatesGroupBias = FCAppConfigurationDoubleValue(v5, @"topStoriesGroupAggregatesGroupBias", 1.0);
    v7->_trendingGroupAggregatesGroupBias = FCAppConfigurationDoubleValue(v5, @"trendingGroupAggregatesGroupBias", 1.0);
    v7->_clicksToImpressionsRatioMaximum = FCAppConfigurationDoubleValue(v5, @"clicksToImpressionsRatioMaximum", 1.0);
    v7->_featureClicksByAction[1] = v7->_presentationClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[2] = *(_OWORD *)&v7->_tappedClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[4] = *(_OWORD *)&v7->_heavyClickClickValue;
    v7->_featureClicksByAction[6] = v7->_dislikeClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[7] = *(_OWORD *)&v7->_shareClickValue;
    double unsubscribeClickValue = v7->_unsubscribeClickValue;
    v7->_featureClicksByAction[9] = v7->_subscribeClickValue;
    v7->_featureClicksByAction[10] = unsubscribeClickValue;
    v7->_featureClicksByAction[11] = v7->_visitClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[12] = *(_OWORD *)&v7->_subscribeRelatedClickValue;
    v7->_featureClicksByAction[14] = v7->_existingSubscriptionRelatedClickValue;
    long long v1296 = *(_OWORD *)&v7->_premiumSubscriptionActivationClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[15] = *(_OWORD *)&v7->_recommendationPresentationFeedClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[17] = v1296;
    *(_OWORD *)&v7->_featureClicksByAction[19] = *(_OWORD *)&v7->_unmuteClickValue;
    v7->_featureClicksByAction[21] = v7->_videoCompletePlaybackClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[22] = *(_OWORD *)&v7->_newsTodayWidgetPresentationClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[24] = *(_OWORD *)&v7->_newsTodayWidgetVideoPlaybackClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[26] = *(_OWORD *)&v7->_appInFocusClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[28] = *(_OWORD *)&v7->_videoComplete25ClickValue;
    v7->_featureClicksByAction[30] = v7->_videoComplete75ClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[31] = *(_OWORD *)&v7->_publisherBoostForSourceMoreFromFeedClickValue;
    v7->_featureClicksByAction[33] = v7->_publisherBoostForIssueOpenClickValue;
    v7->_featureImpressionsByAction[1] = v7->_presentationImpressionValue;
    long long v1297 = *(_OWORD *)&v7->_heavyClickImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[2] = *(_OWORD *)&v7->_tappedImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[4] = v1297;
    v7->_featureImpressionsByAction[6] = v7->_dislikeImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[7] = *(_OWORD *)&v7->_shareImpressionValue;
    *(double *)&long long v1297 = v7->_unsubscribeImpressionValue;
    v7->_featureImpressionsByAction[9] = v7->_subscribeImpressionValue;
    *(void *)&v7->_featureImpressionsByAction[10] = v1297;
    v7->_featureImpressionsByAction[11] = v7->_visitImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[12] = *(_OWORD *)&v7->_subscribeRelatedImpressionValue;
    v7->_featureImpressionsByAction[14] = v7->_existingSubscriptionRelatedImpressionValue;
    long long v1298 = *(_OWORD *)&v7->_premiumSubscriptionActivationImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[15] = *(_OWORD *)&v7->_recommendationPresentationFeedImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[17] = v1298;
    *(_OWORD *)&v7->_featureImpressionsByAction[19] = *(_OWORD *)&v7->_unmuteImpressionValue;
    v7->_featureImpressionsByAction[21] = v7->_videoCompletePlaybackImpressionValue;
    long long v1299 = *(_OWORD *)&v7->_newsTodayWidgetVideoPlaybackImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[22] = *(_OWORD *)&v7->_newsTodayWidgetPresentationImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[24] = v1299;
    long long v1300 = *(_OWORD *)&v7->_videoComplete25ImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[26] = *(_OWORD *)&v7->_appInFocusImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[28] = v1300;
    v7->_featureImpressionsByAction[30] = v7->_videoComplete75ImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[31] = *(_OWORD *)&v7->_publisherBoostForSourceMoreFromFeedImpressionValue;
    v7->_featureImpressionsByAction[33] = v7->_publisherBoostForIssueOpenImpressionValue;
    v7->_baselineClicksByAction[1] = v7->_presentationBaselineClickValue;
    long long v1301 = *(_OWORD *)&v7->_heavyClickBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[2] = *(_OWORD *)&v7->_tappedBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[4] = v1301;
    v7->_baselineClicksByAction[6] = v7->_dislikeBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[7] = *(_OWORD *)&v7->_shareBaselineClickValue;
    v7->_baselineClicksByAction[9] = v7->_subscribeBaselineClickValue;
    v7->_baselineClicksByAction[10] = v7->_unsubscribeBaselineClickValue;
    v7->_baselineClicksByAction[11] = v7->_visitBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[12] = *(_OWORD *)&v7->_subscribeRelatedBaselineClickValue;
    v7->_baselineClicksByAction[14] = v7->_existingSubscriptionRelatedBaselineClickValue;
    long long v1302 = *(_OWORD *)&v7->_premiumSubscriptionActivationBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[15] = *(_OWORD *)&v7->_recommendationPresentationFeedBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[17] = v1302;
    *(_OWORD *)&v7->_baselineClicksByAction[19] = *(_OWORD *)&v7->_unmuteBaselineClickValue;
    v7->_baselineClicksByAction[21] = v7->_videoCompletePlaybackBaselineClickValue;
    long long v1303 = *(_OWORD *)&v7->_newsTodayWidgetVideoPlaybackBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[22] = *(_OWORD *)&v7->_newsTodayWidgetPresentationBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[24] = v1303;
    long long v1304 = *(_OWORD *)&v7->_videoComplete25BaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[26] = *(_OWORD *)&v7->_appInFocusBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[28] = v1304;
    v7->_baselineClicksByAction[30] = v7->_videoComplete75BaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[31] = *(_OWORD *)&v7->_publisherBoostForSourceMoreFromFeedBaselineClickValue;
    v7->_baselineClicksByAction[33] = v7->_publisherBoostForIssueOpenBaselineClickValue;
    v7->_baselineImpressionsByAction[1] = v7->_presentationBaselineImpressionValue;
    long long v1305 = *(_OWORD *)&v7->_heavyClickBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[2] = *(_OWORD *)&v7->_tappedBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[4] = v1305;
    v7->_baselineImpressionsByAction[6] = v7->_dislikeBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[7] = *(_OWORD *)&v7->_shareBaselineImpressionValue;
    v7->_baselineImpressionsByAction[9] = v7->_subscribeBaselineImpressionValue;
    v7->_baselineImpressionsByAction[10] = v7->_unsubscribeBaselineImpressionValue;
    v7->_baselineImpressionsByAction[11] = v7->_visitBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[12] = *(_OWORD *)&v7->_subscribeRelatedBaselineImpressionValue;
    v7->_baselineImpressionsByAction[14] = v7->_existingSubscriptionRelatedBaselineImpressionValue;
    long long v1306 = *(_OWORD *)&v7->_premiumSubscriptionActivationBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[15] = *(_OWORD *)&v7->_recommendationPresentationFeedBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[17] = v1306;
    *(_OWORD *)&v7->_baselineImpressionsByAction[19] = *(_OWORD *)&v7->_unmuteBaselineImpressionValue;
    v7->_baselineImpressionsByAction[21] = v7->_videoCompletePlaybackBaselineImpressionValue;
    long long v1307 = *(_OWORD *)&v7->_newsTodayWidgetVideoPlaybackBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[22] = *(_OWORD *)&v7->_newsTodayWidgetPresentationBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[24] = v1307;
    long long v1308 = *(_OWORD *)&v7->_videoComplete25BaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[26] = *(_OWORD *)&v7->_appInFocusBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[28] = v1308;
    v7->_baselineImpressionsByAction[30] = v7->_videoComplete75BaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[31] = *(_OWORD *)&v7->_publisherBoostForSourceMoreFromFeedBaselineImpressionValue;
    v7->_baselineImpressionsByAction[33] = v7->_publisherBoostForIssueOpenBaselineImpressionValue;
    v7->_filterableNotificationThresholdMultiplier = FCAppConfigurationDoubleValue(v5, @"filterableNotificationThresholdMultiplier", 1.0);
    double v1309 = FCAppConfigurationDoubleValue(v5, @"minimumMyMagazinesIssueScoreBaselineMultiplier", 0.0);
    if (v1309 < 0.0) {
      double v1309 = 0.0;
    }
    v7->_minimumMyMagazinesIssueScoreBaselineMultiplier = v1309;
    v7->_reorderHeadlinesUsingEmbeddingScoreBeforeGrouping = FCAppConfigurationBoolValue(v5, @"reorderHeadlinesUsingTitleEmbeddingScoreBeforeGrouping", 0);
    v7->_maxNumberOfTotalTopicAndChannelGroups = FCAppConfigurationIntegerValue(v5, @"maxNumberOfTotalTopicAndChannelGroups", 1000);
    v7->_scoringVersion = FCAppConfigurationIntegerValue(v5, @"scoringVersion", 0);
    v1310 = FCAppConfigurationNumberValue(v5, @"maxExternalSignalEventCount", &unk_1EF8D8040);
    v7->_maxExternalSignalEventCount = [v1310 integerValue];

    v1312[0] = MEMORY[0x1E4F143A8];
    v1312[1] = 3221225472;
    v1312[2] = __73__FCPersonalizationTreatment_initWithPersonalizationTreatmentDictionary___block_invoke;
    v1312[3] = &unk_1E5B4C090;
    id v1313 = v5;
    v7->_computeUserVectorWithTabi = __73__FCPersonalizationTreatment_initWithPersonalizationTreatmentDictionary___block_invoke((uint64_t)v1312);
  }
  return v7;
}

- (FCPersonalizationTopicsConfig)defaultTopicsConfig
{
  return self->_defaultTopicsConfig;
}

- (FCPersonalizationOntologyLevelConfig)defaultOntologyLevelConfig
{
  return self->_defaultOntologyLevelConfig;
}

- (FCPersonalizationTopicsConfig)forYouTopicsConfig
{
  return self->_forYouTopicsConfig;
}

- (FCPersonalizationScoringConfig)forYouScoringConfig
{
  return self->_forYouScoringConfig;
}

- (FCPersonalizationOntologyLevelConfig)forYouOntologyLevelConfig
{
  return self->_forYouOntologyLevelConfig;
}

uint64_t __73__FCPersonalizationTreatment_initWithPersonalizationTreatmentDictionary___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = NewsCoreUserDefaults();
  v3 = [v2 valueForKey:@"news.features.enableTabiBasedUserVector"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;
  v6 = v5;
  if (!v5) {
    id v5 = &unk_1EF8D8058;
  }
  uint64_t v7 = [v5 integerValue];

  if (v7 == 1) {
    return 1;
  }
  if (v7 == 2) {
    return 0;
  }
  v9 = *(void **)(a1 + 32);
  return FCAppConfigurationBoolValue(v9, @"computeUserVectorWithTabi", 0);
}

- (FCPersonalizationTagScoringConfig)defaultTagScoringConfig
{
  return self->_defaultTagScoringConfig;
}

- (double)clicksToImpressionsRatioMaximum
{
  return self->_clicksToImpressionsRatioMaximum;
}

- (double)publisherDiversificationPenalty
{
  return self->_publisherDiversificationPenalty;
}

- (int64_t)treatmentID
{
  return self->_treatmentID;
}

- (BOOL)shadowModeScoringEnabled
{
  return self->_shadowModeScoringEnabled;
}

- (FCPersonalizationTopicsConfig)magazineFeedIssueTopicsConfig
{
  return self->_magazineFeedIssueTopicsConfig;
}

- (FCPersonalizationScoringConfig)magazineFeedIssueScoringConfig
{
  return self->_magazineFeedIssueScoringConfig;
}

- (FCPersonalizationOntologyLevelConfig)magazineFeedIssueOntologyLevelConfig
{
  return self->_magazineFeedIssueOntologyLevelConfig;
}

- (FCPersonalizationTreatment)init
{
  return [(FCPersonalizationTreatment *)self initWithPersonalizationTreatmentDictionary:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTreatment)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:5];
  uint64_t v7 = objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"treatmentDictionary"];

  v9 = [(FCPersonalizationTreatment *)self initWithPersonalizationTreatmentDictionary:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (*(_OWORD *)&self->_pbTreatment != 0)
  {
    id v5 = v4;
    objc_msgSend(v4, "encodeObject:forKey:");
    id v4 = v5;
  }
}

- (double)featureClicksByAction
{
  return self->_featureClicksByAction;
}

- (double)featureImpressionsByAction
{
  return self->_featureImpressionsByAction;
}

- (double)baselineClicksByAction
{
  return self->_baselineClicksByAction;
}

- (double)baselineImpressionsByAction
{
  return self->_baselineImpressionsByAction;
}

- (id)treatmentDictionary
{
  return self->_treatmentDictionary;
}

- (double)hourlyFlowRateMinimum
{
  return self->_hourlyFlowRateMinimum;
}

- (double)hourlyFlowRateSubscriptionCountBuffer
{
  return self->_hourlyFlowRateSubscriptionCountBuffer;
}

- (double)hourlyFlowRateDampeningFactor
{
  return self->_hourlyFlowRateDampeningFactor;
}

- (double)hourlyFlowRatePerSubscription
{
  return self->_hourlyFlowRatePerSubscription;
}

- (int64_t)extraArticlesToShowUser
{
  return self->_extraArticlesToShowUser;
}

- (double)hourlyFlowRateDecayFactor
{
  return self->_hourlyFlowRateDecayFactor;
}

- (double)hourlyFlowRatePriorWeight
{
  return self->_hourlyFlowRatePriorWeight;
}

- (double)hourlyFlowRateFloor
{
  return self->_hourlyFlowRateFloor;
}

- (double)hourlyFlowRateCeiling
{
  return self->_hourlyFlowRateCeiling;
}

- (double)hourlyFlowRateAlpha
{
  return self->_hourlyFlowRateAlpha;
}

- (double)hourlyFlowRateBeta
{
  return self->_hourlyFlowRateBeta;
}

- (double)hourlyFlowRateGamma
{
  return self->_hourlyFlowRateGamma;
}

- (double)baselineImpressionPrior
{
  return self->_baselineImpressionPrior;
}

- (double)featureImpressionPrior
{
  return self->_featureImpressionPrior;
}

- (double)articleLengthLongThreshold
{
  return self->_articleLengthLongThreshold;
}

- (double)articleLengthMediumThreshold
{
  return self->_articleLengthMediumThreshold;
}

- (double)publisherDiversificationInitialPenalty
{
  return self->_publisherDiversificationInitialPenalty;
}

- (double)publisherDiversificationPenaltyHalfLife
{
  return self->_publisherDiversificationPenaltyHalfLife;
}

- (int64_t)publisherTopicIDEventCountMinimum
{
  return self->_publisherTopicIDEventCountMinimum;
}

- (double)presentationImpressionValue
{
  return self->_presentationImpressionValue;
}

- (double)heavyClickImpressionValue
{
  return self->_heavyClickImpressionValue;
}

- (double)likeImpressionValue
{
  return self->_likeImpressionValue;
}

- (double)shareImpressionValue
{
  return self->_shareImpressionValue;
}

- (double)savedImpressionValue
{
  return self->_savedImpressionValue;
}

- (double)subscribeImpressionValue
{
  return self->_subscribeImpressionValue;
}

- (double)subscribeRelatedImpressionValue
{
  return self->_subscribeRelatedImpressionValue;
}

- (double)existingSubscriptionImpressionValue
{
  return self->_existingSubscriptionImpressionValue;
}

- (double)existingSubscriptionRelatedImpressionValue
{
  return self->_existingSubscriptionRelatedImpressionValue;
}

- (double)unsubscribeImpressionValue
{
  return self->_unsubscribeImpressionValue;
}

- (double)tappedImpressionValue
{
  return self->_tappedImpressionValue;
}

- (double)weakClickImpressionValue
{
  return self->_weakClickImpressionValue;
}

- (double)visitImpressionValue
{
  return self->_visitImpressionValue;
}

- (double)dislikeImpressionValue
{
  return self->_dislikeImpressionValue;
}

- (double)recommendationPresentationFeedImpressionValue
{
  return self->_recommendationPresentationFeedImpressionValue;
}

- (double)recommendationPresentationExploreImpressionValue
{
  return self->_recommendationPresentationExploreImpressionValue;
}

- (double)premiumSubscriptionActivationImpressionValue
{
  return self->_premiumSubscriptionActivationImpressionValue;
}

- (double)muteImpressionValue
{
  return self->_muteImpressionValue;
}

- (double)unmuteImpressionValue
{
  return self->_unmuteImpressionValue;
}

- (double)videoInitiatePlaybackImpressionValue
{
  return self->_videoInitiatePlaybackImpressionValue;
}

- (double)videoCompletePlaybackImpressionValue
{
  return self->_videoCompletePlaybackImpressionValue;
}

- (double)videoComplete25ImpressionValue
{
  return self->_videoComplete25ImpressionValue;
}

- (double)videoComplete50ImpressionValue
{
  return self->_videoComplete50ImpressionValue;
}

- (double)videoComplete75ImpressionValue
{
  return self->_videoComplete75ImpressionValue;
}

- (double)newsTodayWidgetPresentationImpressionValue
{
  return self->_newsTodayWidgetPresentationImpressionValue;
}

- (double)newsTodayWidgetClickImpressionValue
{
  return self->_newsTodayWidgetClickImpressionValue;
}

- (double)newsTodayWidgetVideoPlaybackImpressionValue
{
  return self->_newsTodayWidgetVideoPlaybackImpressionValue;
}

- (double)appInstallImpressionValue
{
  return self->_appInstallImpressionValue;
}

- (double)appInFocusImpressionValue
{
  return self->_appInFocusImpressionValue;
}

- (double)safariHistoryImpressionValue
{
  return self->_safariHistoryImpressionValue;
}

- (double)publisherBoostForSourceMoreFromFeedImpressionValue
{
  return self->_publisherBoostForSourceMoreFromFeedImpressionValue;
}

- (double)topicBoostForSourceRelatedFeedImpressionValue
{
  return self->_topicBoostForSourceRelatedFeedImpressionValue;
}

- (double)publisherBoostForIssueOpenImpressionValue
{
  return self->_publisherBoostForIssueOpenImpressionValue;
}

- (double)trackVisitedImpressionValue
{
  return self->_trackVisitedImpressionValue;
}

- (double)trackListenedImpressionValue
{
  return self->_trackListenedImpressionValue;
}

- (double)trackFinishedImpressionValue
{
  return self->_trackFinishedImpressionValue;
}

- (double)sportsTagSeenImpressionValue
{
  return self->_sportsTagSeenImpressionValue;
}

- (double)ignoreImpressionValue
{
  return self->_ignoreImpressionValue;
}

- (double)presentationClickValue
{
  return self->_presentationClickValue;
}

- (double)heavyClickClickValue
{
  return self->_heavyClickClickValue;
}

- (double)likeClickValue
{
  return self->_likeClickValue;
}

- (double)shareClickValue
{
  return self->_shareClickValue;
}

- (double)savedClickValue
{
  return self->_savedClickValue;
}

- (double)subscribeClickValue
{
  return self->_subscribeClickValue;
}

- (double)subscribeRelatedClickValue
{
  return self->_subscribeRelatedClickValue;
}

- (double)existingSubscriptionClickValue
{
  return self->_existingSubscriptionClickValue;
}

- (double)existingSubscriptionRelatedClickValue
{
  return self->_existingSubscriptionRelatedClickValue;
}

- (double)unsubscribeClickValue
{
  return self->_unsubscribeClickValue;
}

- (double)tappedClickValue
{
  return self->_tappedClickValue;
}

- (double)weakClickClickValue
{
  return self->_weakClickClickValue;
}

- (double)visitClickValue
{
  return self->_visitClickValue;
}

- (double)dislikeClickValue
{
  return self->_dislikeClickValue;
}

- (double)recommendationPresentationFeedClickValue
{
  return self->_recommendationPresentationFeedClickValue;
}

- (double)recommendationPresentationExploreClickValue
{
  return self->_recommendationPresentationExploreClickValue;
}

- (double)premiumSubscriptionActivationClickValue
{
  return self->_premiumSubscriptionActivationClickValue;
}

- (double)muteClickValue
{
  return self->_muteClickValue;
}

- (double)unmuteClickValue
{
  return self->_unmuteClickValue;
}

- (double)videoInitiatePlaybackClickValue
{
  return self->_videoInitiatePlaybackClickValue;
}

- (double)videoCompletePlaybackClickValue
{
  return self->_videoCompletePlaybackClickValue;
}

- (double)videoComplete25ClickValue
{
  return self->_videoComplete25ClickValue;
}

- (double)videoComplete50ClickValue
{
  return self->_videoComplete50ClickValue;
}

- (double)videoComplete75ClickValue
{
  return self->_videoComplete75ClickValue;
}

- (double)newsTodayWidgetPresentationClickValue
{
  return self->_newsTodayWidgetPresentationClickValue;
}

- (double)newsTodayWidgetClickClickValue
{
  return self->_newsTodayWidgetClickClickValue;
}

- (double)newsTodayWidgetVideoPlaybackClickValue
{
  return self->_newsTodayWidgetVideoPlaybackClickValue;
}

- (double)appInstallClickValue
{
  return self->_appInstallClickValue;
}

- (double)appInFocusClickValue
{
  return self->_appInFocusClickValue;
}

- (double)safariHistoryClickValue
{
  return self->_safariHistoryClickValue;
}

- (double)publisherBoostForSourceMoreFromFeedClickValue
{
  return self->_publisherBoostForSourceMoreFromFeedClickValue;
}

- (double)topicBoostForSourceRelatedFeedClickValue
{
  return self->_topicBoostForSourceRelatedFeedClickValue;
}

- (double)publisherBoostForIssueOpenClickValue
{
  return self->_publisherBoostForIssueOpenClickValue;
}

- (double)trackVisitedClickValue
{
  return self->_trackVisitedClickValue;
}

- (double)trackListenedClickValue
{
  return self->_trackListenedClickValue;
}

- (double)trackFinishedClickValue
{
  return self->_trackFinishedClickValue;
}

- (double)sportsTagSeenClickValue
{
  return self->_sportsTagSeenClickValue;
}

- (double)ignoreClickValue
{
  return self->_ignoreClickValue;
}

- (double)presentationBaselineImpressionValue
{
  return self->_presentationBaselineImpressionValue;
}

- (double)heavyClickBaselineImpressionValue
{
  return self->_heavyClickBaselineImpressionValue;
}

- (double)likeBaselineImpressionValue
{
  return self->_likeBaselineImpressionValue;
}

- (double)shareBaselineImpressionValue
{
  return self->_shareBaselineImpressionValue;
}

- (double)savedBaselineImpressionValue
{
  return self->_savedBaselineImpressionValue;
}

- (double)subscribeBaselineImpressionValue
{
  return self->_subscribeBaselineImpressionValue;
}

- (double)subscribeRelatedBaselineImpressionValue
{
  return self->_subscribeRelatedBaselineImpressionValue;
}

- (double)existingSubscriptionBaselineImpressionValue
{
  return self->_existingSubscriptionBaselineImpressionValue;
}

- (double)existingSubscriptionRelatedBaselineImpressionValue
{
  return self->_existingSubscriptionRelatedBaselineImpressionValue;
}

- (double)unsubscribeBaselineImpressionValue
{
  return self->_unsubscribeBaselineImpressionValue;
}

- (double)tappedBaselineImpressionValue
{
  return self->_tappedBaselineImpressionValue;
}

- (double)weakClickBaselineImpressionValue
{
  return self->_weakClickBaselineImpressionValue;
}

- (double)visitBaselineImpressionValue
{
  return self->_visitBaselineImpressionValue;
}

- (double)dislikeBaselineImpressionValue
{
  return self->_dislikeBaselineImpressionValue;
}

- (double)recommendationPresentationFeedBaselineImpressionValue
{
  return self->_recommendationPresentationFeedBaselineImpressionValue;
}

- (double)recommendationPresentationExploreBaselineImpressionValue
{
  return self->_recommendationPresentationExploreBaselineImpressionValue;
}

- (double)premiumSubscriptionActivationBaselineImpressionValue
{
  return self->_premiumSubscriptionActivationBaselineImpressionValue;
}

- (double)muteBaselineImpressionValue
{
  return self->_muteBaselineImpressionValue;
}

- (double)unmuteBaselineImpressionValue
{
  return self->_unmuteBaselineImpressionValue;
}

- (double)videoInitiatePlaybackBaselineImpressionValue
{
  return self->_videoInitiatePlaybackBaselineImpressionValue;
}

- (double)videoCompletePlaybackBaselineImpressionValue
{
  return self->_videoCompletePlaybackBaselineImpressionValue;
}

- (double)videoComplete25BaselineImpressionValue
{
  return self->_videoComplete25BaselineImpressionValue;
}

- (double)videoComplete50BaselineImpressionValue
{
  return self->_videoComplete50BaselineImpressionValue;
}

- (double)videoComplete75BaselineImpressionValue
{
  return self->_videoComplete75BaselineImpressionValue;
}

- (double)newsTodayWidgetPresentationBaselineImpressionValue
{
  return self->_newsTodayWidgetPresentationBaselineImpressionValue;
}

- (double)newsTodayWidgetClickBaselineImpressionValue
{
  return self->_newsTodayWidgetClickBaselineImpressionValue;
}

- (double)newsTodayWidgetVideoPlaybackBaselineImpressionValue
{
  return self->_newsTodayWidgetVideoPlaybackBaselineImpressionValue;
}

- (double)appInstallBaselineImpressionValue
{
  return self->_appInstallBaselineImpressionValue;
}

- (double)appInFocusBaselineImpressionValue
{
  return self->_appInFocusBaselineImpressionValue;
}

- (double)safariHistoryBaselineImpressionValue
{
  return self->_safariHistoryBaselineImpressionValue;
}

- (double)publisherBoostForSourceMoreFromFeedBaselineImpressionValue
{
  return self->_publisherBoostForSourceMoreFromFeedBaselineImpressionValue;
}

- (double)topicBoostForSourceRelatedFeedBaselineImpressionValue
{
  return self->_topicBoostForSourceRelatedFeedBaselineImpressionValue;
}

- (double)publisherBoostForIssueOpenBaselineImpressionValue
{
  return self->_publisherBoostForIssueOpenBaselineImpressionValue;
}

- (double)trackVisitedBaselineImpressionValue
{
  return self->_trackVisitedBaselineImpressionValue;
}

- (double)trackListenedBaselineImpressionValue
{
  return self->_trackListenedBaselineImpressionValue;
}

- (double)trackFinishedBaselineImpressionValue
{
  return self->_trackFinishedBaselineImpressionValue;
}

- (double)sportsTagSeenBaselineImpressionValue
{
  return self->_sportsTagSeenBaselineImpressionValue;
}

- (double)ignoreBaselineImpressionValue
{
  return self->_ignoreBaselineImpressionValue;
}

- (double)presentationBaselineClickValue
{
  return self->_presentationBaselineClickValue;
}

- (double)heavyClickBaselineClickValue
{
  return self->_heavyClickBaselineClickValue;
}

- (double)likeBaselineClickValue
{
  return self->_likeBaselineClickValue;
}

- (double)shareBaselineClickValue
{
  return self->_shareBaselineClickValue;
}

- (double)savedBaselineClickValue
{
  return self->_savedBaselineClickValue;
}

- (double)subscribeBaselineClickValue
{
  return self->_subscribeBaselineClickValue;
}

- (double)subscribeRelatedBaselineClickValue
{
  return self->_subscribeRelatedBaselineClickValue;
}

- (double)existingSubscriptionBaselineClickValue
{
  return self->_existingSubscriptionBaselineClickValue;
}

- (double)existingSubscriptionRelatedBaselineClickValue
{
  return self->_existingSubscriptionRelatedBaselineClickValue;
}

- (double)unsubscribeBaselineClickValue
{
  return self->_unsubscribeBaselineClickValue;
}

- (double)tappedBaselineClickValue
{
  return self->_tappedBaselineClickValue;
}

- (double)weakClickBaselineClickValue
{
  return self->_weakClickBaselineClickValue;
}

- (double)visitBaselineClickValue
{
  return self->_visitBaselineClickValue;
}

- (double)dislikeBaselineClickValue
{
  return self->_dislikeBaselineClickValue;
}

- (double)recommendationPresentationFeedBaselineClickValue
{
  return self->_recommendationPresentationFeedBaselineClickValue;
}

- (double)recommendationPresentationExploreBaselineClickValue
{
  return self->_recommendationPresentationExploreBaselineClickValue;
}

- (double)premiumSubscriptionActivationBaselineClickValue
{
  return self->_premiumSubscriptionActivationBaselineClickValue;
}

- (double)muteBaselineClickValue
{
  return self->_muteBaselineClickValue;
}

- (double)unmuteBaselineClickValue
{
  return self->_unmuteBaselineClickValue;
}

- (double)videoInitiatePlaybackBaselineClickValue
{
  return self->_videoInitiatePlaybackBaselineClickValue;
}

- (double)videoCompletePlaybackBaselineClickValue
{
  return self->_videoCompletePlaybackBaselineClickValue;
}

- (double)videoComplete25BaselineClickValue
{
  return self->_videoComplete25BaselineClickValue;
}

- (double)videoComplete50BaselineClickValue
{
  return self->_videoComplete50BaselineClickValue;
}

- (double)videoComplete75BaselineClickValue
{
  return self->_videoComplete75BaselineClickValue;
}

- (double)newsTodayWidgetPresentationBaselineClickValue
{
  return self->_newsTodayWidgetPresentationBaselineClickValue;
}

- (double)newsTodayWidgetClickBaselineClickValue
{
  return self->_newsTodayWidgetClickBaselineClickValue;
}

- (double)newsTodayWidgetVideoPlaybackBaselineClickValue
{
  return self->_newsTodayWidgetVideoPlaybackBaselineClickValue;
}

- (double)appInstallBaselineClickValue
{
  return self->_appInstallBaselineClickValue;
}

- (double)appInFocusBaselineClickValue
{
  return self->_appInFocusBaselineClickValue;
}

- (double)safariHistoryBaselineClickValue
{
  return self->_safariHistoryBaselineClickValue;
}

- (double)publisherBoostForSourceMoreFromFeedBaselineClickValue
{
  return self->_publisherBoostForSourceMoreFromFeedBaselineClickValue;
}

- (double)topicBoostForSourceRelatedFeedBaselineClickValue
{
  return self->_topicBoostForSourceRelatedFeedBaselineClickValue;
}

- (double)publisherBoostForIssueOpenBaselineClickValue
{
  return self->_publisherBoostForIssueOpenBaselineClickValue;
}

- (double)trackVisitedBaselineClickValue
{
  return self->_trackVisitedBaselineClickValue;
}

- (double)trackListenedBaselineClickValue
{
  return self->_trackListenedBaselineClickValue;
}

- (double)trackFinishedBaselineClickValue
{
  return self->_trackFinishedBaselineClickValue;
}

- (double)sportsTagSeenBaselineClickValue
{
  return self->_sportsTagSeenBaselineClickValue;
}

- (double)ignoreBaselineClickValue
{
  return self->_ignoreBaselineClickValue;
}

- (double)heavyClickMinimumDuration
{
  return self->_heavyClickMinimumDuration;
}

- (int64_t)trackVisitedMinimumDuration
{
  return self->_trackVisitedMinimumDuration;
}

- (int64_t)trackListenedMinimumDuration
{
  return self->_trackListenedMinimumDuration;
}

- (double)swipeToArticleWeakClickMinimumDuration
{
  return self->_swipeToArticleWeakClickMinimumDuration;
}

- (double)swipeToArticleHeavyClickMinimumDuration
{
  return self->_swipeToArticleHeavyClickMinimumDuration;
}

- (double)lowQualityContentThreshold
{
  return self->_lowQualityContentThreshold;
}

- (BOOL)lowQualityFilterShouldPreserveItemsFromSubscribedChannels
{
  return self->_lowQualityFilterShouldPreserveItemsFromSubscribedChannels;
}

- (BOOL)lowQualityFilterShouldIsolateEvergreenItems
{
  return self->_lowQualityFilterShouldIsolateEvergreenItems;
}

- (double)sportsTagSeenMinimumDuration
{
  return self->_sportsTagSeenMinimumDuration;
}

- (BOOL)sportsTagSeenEnableFeedSource
{
  return self->_sportsTagSeenEnableFeedSource;
}

- (BOOL)sportsTagSeenEnableSportsManagementSource
{
  return self->_sportsTagSeenEnableSportsManagementSource;
}

- (BOOL)sportsTagSeenEnableSportsManagementDetailSource
{
  return self->_sportsTagSeenEnableSportsManagementDetailSource;
}

- (int64_t)thumbnailMinHammingDistance
{
  return self->_thumbnailMinHammingDistance;
}

- (int64_t)minClusterSizeIPhone
{
  return self->_minClusterSizeIPhone;
}

- (int64_t)maxClusterSizeIPhone
{
  return self->_maxClusterSizeIPhone;
}

- (int64_t)minMoreForYouSizeIPhone
{
  return self->_minMoreForYouSizeIPhone;
}

- (int64_t)maxMoreForYouSizeIPhone
{
  return self->_maxMoreForYouSizeIPhone;
}

- (int64_t)minIdealClusterSizeIPhone
{
  return self->_minIdealClusterSizeIPhone;
}

- (int64_t)maxIdealClusterSizeIPhone
{
  return self->_maxIdealClusterSizeIPhone;
}

- (int64_t)minClusterSizeIPhoneAutoFavorite
{
  return self->_minClusterSizeIPhoneAutoFavorite;
}

- (int64_t)maxClusterSizeIPhoneAutoFavorite
{
  return self->_maxClusterSizeIPhoneAutoFavorite;
}

- (int64_t)minIdealClusterSizeIPhoneAutoFavorite
{
  return self->_minIdealClusterSizeIPhoneAutoFavorite;
}

- (int64_t)maxIdealClusterSizeIPhoneAutoFavorite
{
  return self->_maxIdealClusterSizeIPhoneAutoFavorite;
}

- (int64_t)maxPublisherOccurrencesIPhone
{
  return self->_maxPublisherOccurrencesIPhone;
}

- (int64_t)maxPublisherOccurrencesIPhoneBestOfBundle
{
  return self->_maxPublisherOccurrencesIPhoneBestOfBundle;
}

- (int64_t)maxPublisherOccurrencesIPhoneForYouGroup
{
  return self->_maxPublisherOccurrencesIPhoneForYouGroup;
}

- (int64_t)maxPublisherOccurrencesIPhoneGreatStoriesYouMissed
{
  return self->_maxPublisherOccurrencesIPhoneGreatStoriesYouMissed;
}

- (int64_t)maxUnpaidArticlesIPhone
{
  return self->_maxUnpaidArticlesIPhone;
}

- (int64_t)maxUnpaidArticlesIPhoneBestOfBundle
{
  return self->_maxUnpaidArticlesIPhoneBestOfBundle;
}

- (int64_t)maxUnpaidArticlesIPhoneForYouGroup
{
  return self->_maxUnpaidArticlesIPhoneForYouGroup;
}

- (int64_t)maxUnpaidArticlesIPhoneGreatStoriesYouMissed
{
  return self->_maxUnpaidArticlesIPhoneGreatStoriesYouMissed;
}

- (int64_t)maxNativeAdCountIPhone
{
  return self->_maxNativeAdCountIPhone;
}

- (int64_t)maxNativeAdCountIPhoneBestOfBundle
{
  return self->_maxNativeAdCountIPhoneBestOfBundle;
}

- (int64_t)maxNativeAdCountIPhoneForYouGroup
{
  return self->_maxNativeAdCountIPhoneForYouGroup;
}

- (int64_t)maxNativeAdCountIPhoneGreatStoriesYouMissed
{
  return self->_maxNativeAdCountIPhoneGreatStoriesYouMissed;
}

- (int64_t)minClusterSizeIPad
{
  return self->_minClusterSizeIPad;
}

- (int64_t)maxClusterSizeIPad
{
  return self->_maxClusterSizeIPad;
}

- (int64_t)minMoreForYouSizeIPad
{
  return self->_minMoreForYouSizeIPad;
}

- (int64_t)maxMoreForYouSizeIPad
{
  return self->_maxMoreForYouSizeIPad;
}

- (int64_t)minIdealClusterSizeIPad
{
  return self->_minIdealClusterSizeIPad;
}

- (int64_t)maxIdealClusterSizeIPad
{
  return self->_maxIdealClusterSizeIPad;
}

- (int64_t)minClusterSizeIPadAutoFavorite
{
  return self->_minClusterSizeIPadAutoFavorite;
}

- (int64_t)maxClusterSizeIPadAutoFavorite
{
  return self->_maxClusterSizeIPadAutoFavorite;
}

- (int64_t)minIdealClusterSizeIPadAutoFavorite
{
  return self->_minIdealClusterSizeIPadAutoFavorite;
}

- (int64_t)maxIdealClusterSizeIPadAutoFavorite
{
  return self->_maxIdealClusterSizeIPadAutoFavorite;
}

- (int64_t)maxPublisherOccurrencesIPad
{
  return self->_maxPublisherOccurrencesIPad;
}

- (int64_t)maxPublisherOccurrencesIPadBestOfBundle
{
  return self->_maxPublisherOccurrencesIPadBestOfBundle;
}

- (int64_t)maxPublisherOccurrencesIPadForYouGroup
{
  return self->_maxPublisherOccurrencesIPadForYouGroup;
}

- (int64_t)maxPublisherOccurrencesIPadGreatStoriesYouMissed
{
  return self->_maxPublisherOccurrencesIPadGreatStoriesYouMissed;
}

- (int64_t)maxUnpaidArticlesIPad
{
  return self->_maxUnpaidArticlesIPad;
}

- (int64_t)maxUnpaidArticlesIPadBestOfBundle
{
  return self->_maxUnpaidArticlesIPadBestOfBundle;
}

- (int64_t)maxUnpaidArticlesIPadForYouGroup
{
  return self->_maxUnpaidArticlesIPadForYouGroup;
}

- (int64_t)maxUnpaidArticlesIPadGreatStoriesYouMissed
{
  return self->_maxUnpaidArticlesIPadGreatStoriesYouMissed;
}

- (int64_t)maxNativeAdCountIPad
{
  return self->_maxNativeAdCountIPad;
}

- (int64_t)maxNativeAdCountIPadBestOfBundle
{
  return self->_maxNativeAdCountIPadBestOfBundle;
}

- (int64_t)maxNativeAdCountIPadForYouGroup
{
  return self->_maxNativeAdCountIPadForYouGroup;
}

- (int64_t)maxNativeAdCountIPadGreatStoriesYouMissed
{
  return self->_maxNativeAdCountIPadGreatStoriesYouMissed;
}

- (double)relatedTopicMultiplier
{
  return self->_relatedTopicMultiplier;
}

- (double)relatedTopicRatioFilter
{
  return self->_relatedTopicRatioFilter;
}

- (double)managedTopicMultiplier
{
  return self->_managedTopicMultiplier;
}

- (double)managedWinnerTopicMultiplier
{
  return self->_managedWinnerTopicMultiplier;
}

- (double)topicAutofavoritedMultiplier
{
  return self->_topicAutofavoritedMultiplier;
}

- (double)topicFavoritedMultiplier
{
  return self->_topicFavoritedMultiplier;
}

- (double)topicGroupSizeMultiplier
{
  return self->_topicGroupSizeMultiplier;
}

- (double)topicGroupableMultiplier
{
  return self->_topicGroupableMultiplier;
}

- (double)channelScoreWeight
{
  return self->_channelScoreWeight;
}

- (double)topicScoreWeight
{
  return self->_topicScoreWeight;
}

- (double)topicSpecificityMultiplier
{
  return self->_topicSpecificityMultiplier;
}

- (unint64_t)publisherDiversityMinPublisherCount
{
  return self->_publisherDiversityMinPublisherCount;
}

- (unint64_t)publisherDiversityMaxPublisherCount
{
  return self->_publisherDiversityMaxPublisherCount;
}

- (double)publisherDiversityMaxArticleFilter
{
  return self->_publisherDiversityMaxArticleFilter;
}

- (int64_t)maxEvergreenArticlesPerGroup
{
  return self->_maxEvergreenArticlesPerGroup;
}

- (double)internalUsageSignalWeight
{
  return self->_internalUsageSignalWeight;
}

- (double)autoFavoriteMinClicks
{
  return self->_autoFavoriteMinClicks;
}

- (double)autoFavoriteMinEvents
{
  return self->_autoFavoriteMinEvents;
}

- (double)autoFavoriteMinRate
{
  return self->_autoFavoriteMinRate;
}

- (double)autoFavoriteMinRelativeRate
{
  return self->_autoFavoriteMinRelativeRate;
}

- (double)autoUnfavoriteFactor
{
  return self->_autoUnfavoriteFactor;
}

- (double)autoGroupableFactor
{
  return self->_autoGroupableFactor;
}

- (double)autoFavoriteTagFavorabilityExponent
{
  return self->_autoFavoriteTagFavorabilityExponent;
}

- (double)autoFavoritePriorFactorExponent
{
  return self->_autoFavoritePriorFactorExponent;
}

- (double)autoFavoriteMaxIdleTime
{
  return self->_autoFavoriteMaxIdleTime;
}

- (double)safariSignalWeight
{
  return self->_safariSignalWeight;
}

- (double)safariTimeDecayMultiplier
{
  return self->_safariTimeDecayMultiplier;
}

- (double)safariOccurrenceDecayMultiplier
{
  return self->_safariOccurrenceDecayMultiplier;
}

- (double)autoFavoriteMinObservationsSafari
{
  return self->_autoFavoriteMinObservationsSafari;
}

- (double)autoFavoriteMinScoreSafari
{
  return self->_autoFavoriteMinScoreSafari;
}

- (double)safariTagFavorabilityExponent
{
  return self->_safariTagFavorabilityExponent;
}

- (double)safariPriorFactorExponent
{
  return self->_safariPriorFactorExponent;
}

- (double)safariEventBlackoutSeconds
{
  return self->_safariEventBlackoutSeconds;
}

- (double)appUsageSignalWeight
{
  return self->_appUsageSignalWeight;
}

- (double)appUsageTimeDecayMultiplier
{
  return self->_appUsageTimeDecayMultiplier;
}

- (double)appUsageOccurrenceDecayMultiplier
{
  return self->_appUsageOccurrenceDecayMultiplier;
}

- (double)autoFavoriteMinObservationsExtAppUsage
{
  return self->_autoFavoriteMinObservationsExtAppUsage;
}

- (double)autoFavoriteMinScoreExtAppUsage
{
  return self->_autoFavoriteMinScoreExtAppUsage;
}

- (double)appUsageTagFavorabilityExponent
{
  return self->_appUsageTagFavorabilityExponent;
}

- (double)appUsagePriorFactorExponent
{
  return self->_appUsagePriorFactorExponent;
}

- (double)portraitSignalWeight
{
  return self->_portraitSignalWeight;
}

- (double)portraitDecayRate
{
  return self->_portraitDecayRate;
}

- (double)portraitGlobalThreshold
{
  return self->_portraitGlobalThreshold;
}

- (double)portraitTagFavorabilityExponent
{
  return self->_portraitTagFavorabilityExponent;
}

- (double)portraitPriorFactorExponent
{
  return self->_portraitPriorFactorExponent;
}

- (double)groupImpressionBiasCorrectionFactor
{
  return self->_groupImpressionBiasCorrectionFactor;
}

- (double)indexImpressionBiasCorrectionFactor
{
  return self->_indexImpressionBiasCorrectionFactor;
}

- (int64_t)maxNumberOfSuggestions
{
  return self->_maxNumberOfSuggestions;
}

- (double)uGroupMinimumSubscribedChannelSourceFeedArticleRatio
{
  return self->_uGroupMinimumSubscribedChannelSourceFeedArticleRatio;
}

- (int64_t)numEventsToDisableDefaultTopics
{
  return self->_numEventsToDisableDefaultTopics;
}

- (int64_t)numSubscriptionsToDisableDefaultTopics
{
  return self->_numSubscriptionsToDisableDefaultTopics;
}

- (double)metaGroupingRelatednessThreshold
{
  return self->_metaGroupingRelatednessThreshold;
}

- (double)metaGroupingRelatednessKWeight
{
  return self->_metaGroupingRelatednessKWeight;
}

- (double)metaGroupingTopicScoreWeight
{
  return self->_metaGroupingTopicScoreWeight;
}

- (double)metaGroupingHighestScoringRelativeScoreMultiplier
{
  return self->_metaGroupingHighestScoringRelativeScoreMultiplier;
}

- (double)metaGroupingSubscribedTopicMultiplier
{
  return self->_metaGroupingSubscribedTopicMultiplier;
}

- (int64_t)auditionedAutoFavoritesEmitterLimit
{
  return self->_auditionedAutoFavoritesEmitterLimit;
}

- (double)topicDiversityThreshold
{
  return self->_topicDiversityThreshold;
}

- (int64_t)topicDiversityWindowSize
{
  return self->_topicDiversityWindowSize;
}

- (int64_t)minBaselineEventsToSubmitUserVector
{
  return self->_minBaselineEventsToSubmitUserVector;
}

- (BOOL)personalizesSportsTagsInUserVector
{
  return self->_personalizesSportsTagsInUserVector;
}

- (FCPersonalizationScoringConfig)topicFeedScoringConfig
{
  return self->_topicFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)magazineFeedArticleScoringConfig
{
  return self->_magazineFeedArticleScoringConfig;
}

- (FCPersonalizationScoringConfig)legacyAudioFeedScoringConfig
{
  return self->_legacyAudioFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)audioFeedScoringConfig
{
  return self->_audioFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)articleRecirculationPrimaryScoringConfig
{
  return self->_articleRecirculationPrimaryScoringConfig;
}

- (FCPersonalizationScoringConfig)articleRecirculationSecondaryScoringConfig
{
  return self->_articleRecirculationSecondaryScoringConfig;
}

- (FCPersonalizationScoringConfig)articleRecirculationTertiaryScoringConfig
{
  return self->_articleRecirculationTertiaryScoringConfig;
}

- (FCPersonalizationScoringConfig)articleRecirculationQuaternaryScoringConfig
{
  return self->_articleRecirculationQuaternaryScoringConfig;
}

- (FCPersonalizationScoringConfig)bestOfBundleScoringConfig
{
  return self->_bestOfBundleScoringConfig;
}

- (FCPersonalizationScoringConfig)curatedScoringConfig
{
  return self->_curatedScoringConfig;
}

- (FCPersonalizationScoringConfig)curatedIssuesScoringConfig
{
  return self->_curatedIssuesScoringConfig;
}

- (FCPersonalizationScoringConfig)greatStoriesYouMissedScoringConfig
{
  return self->_greatStoriesYouMissedScoringConfig;
}

- (FCPersonalizationScoringConfig)latestStoriesScoringConfig
{
  return self->_latestStoriesScoringConfig;
}

- (FCPersonalizationScoringConfig)localNewsScoringConfig
{
  return self->_localNewsScoringConfig;
}

- (FCPersonalizationScoringConfig)newspaperMagazineFeedScoringConfig
{
  return self->_newspaperMagazineFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)todayWidgetScoringConfig
{
  return self->_todayWidgetScoringConfig;
}

- (FCPersonalizationScoringConfig)tagWidgetScoringConfig
{
  return self->_tagWidgetScoringConfig;
}

- (FCPersonalizationScoringConfig)notificationScoringConfig
{
  return self->_notificationScoringConfig;
}

- (FCPersonalizationScoringConfig)mySportsGroupScoringConfig
{
  return self->_mySportsGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)mySportsGroupForYouScoringConfig
{
  return self->_mySportsGroupForYouScoringConfig;
}

- (FCPersonalizationScoringConfig)mySportsTopicsScoringConfig
{
  return self->_mySportsTopicsScoringConfig;
}

- (FCPersonalizationScoringConfig)sportsTopStoriesScoringConfig
{
  return self->_sportsTopStoriesScoringConfig;
}

- (FCPersonalizationScoringConfig)introToSportsGroupScoringConfig
{
  return self->_introToSportsGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)introToSportsGroupForYouScoringConfig
{
  return self->_introToSportsGroupForYouScoringConfig;
}

- (FCPersonalizationScoringConfig)highlightsGroupScoringConfig
{
  return self->_highlightsGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)articleListTagFeedGroupScoringConfig
{
  return self->_articleListTagFeedGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)tagFeedScoringConfig
{
  return self->_tagFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)newspaperTodayFeedScoringConfig
{
  return self->_newspaperTodayFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)moreForYouScoringConfig
{
  return self->_moreForYouScoringConfig;
}

- (FCPersonalizationScoringConfig)localSectionGroupScoringConfig
{
  return self->_localSectionGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)newspaperSectionGroupScoringConfig
{
  return self->_newspaperSectionGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)sportsEventArticlesGroupScoringConfig
{
  return self->_sportsEventArticlesGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)tagForYouGroupScoringConfig
{
  return self->_tagForYouGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)tagRecentStoriesScoringConfig
{
  return self->_tagRecentStoriesScoringConfig;
}

- (FCPersonalizationScoringConfig)tagDateRangeScoringConfig
{
  return self->_tagDateRangeScoringConfig;
}

- (FCPersonalizationScoringConfig)sportsEventTopicGroupScoringConfig
{
  return self->_sportsEventTopicGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)affinityGroupScoringConfig
{
  return self->_affinityGroupScoringConfig;
}

- (FCPersonalizationTagScoringConfig)sportsTagScoringConfig
{
  return self->_sportsTagScoringConfig;
}

- (FCPersonalizationTopicsConfig)topicFeedTopicsConfig
{
  return self->_topicFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)magazineFeedArticleTopicsConfig
{
  return self->_magazineFeedArticleTopicsConfig;
}

- (FCPersonalizationTopicsConfig)legacyAudioFeedTopicsConfig
{
  return self->_legacyAudioFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)audioFeedTopicsConfig
{
  return self->_audioFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleRecirculationPrimaryTopicsConfig
{
  return self->_articleRecirculationPrimaryTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleRecirculationSecondaryTopicsConfig
{
  return self->_articleRecirculationSecondaryTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleRecirculationTertiaryTopicsConfig
{
  return self->_articleRecirculationTertiaryTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleRecirculationQuaternaryTopicsConfig
{
  return self->_articleRecirculationQuaternaryTopicsConfig;
}

- (FCPersonalizationTopicsConfig)bestOfBundleTopicsConfig
{
  return self->_bestOfBundleTopicsConfig;
}

- (FCPersonalizationTopicsConfig)curatedTopicsConfig
{
  return self->_curatedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)curatedIssuesTopicsConfig
{
  return self->_curatedIssuesTopicsConfig;
}

- (FCPersonalizationTopicsConfig)greatStoriesYouMissedTopicsConfig
{
  return self->_greatStoriesYouMissedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)latestStoriesTopicsConfig
{
  return self->_latestStoriesTopicsConfig;
}

- (FCPersonalizationTopicsConfig)localNewsTopicsConfig
{
  return self->_localNewsTopicsConfig;
}

- (FCPersonalizationTopicsConfig)newspaperMagazineFeedTopicsConfig
{
  return self->_newspaperMagazineFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)todayWidgetTopicsConfig
{
  return self->_todayWidgetTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagWidgetTopicsConfig
{
  return self->_tagWidgetTopicsConfig;
}

- (FCPersonalizationTopicsConfig)mySportsGroupTopicsConfig
{
  return self->_mySportsGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)mySportsGroupForYouTopicsConfig
{
  return self->_mySportsGroupForYouTopicsConfig;
}

- (FCPersonalizationTopicsConfig)mySportsTopicsTopicsConfig
{
  return self->_mySportsTopicsTopicsConfig;
}

- (FCPersonalizationTopicsConfig)sportsTopStoriesTopicsConfig
{
  return self->_sportsTopStoriesTopicsConfig;
}

- (FCPersonalizationTopicsConfig)introToSportsGroupTopicsConfig
{
  return self->_introToSportsGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)introToSportsGroupForYouTopicsConfig
{
  return self->_introToSportsGroupForYouTopicsConfig;
}

- (FCPersonalizationTopicsConfig)highlightsGroupTopicsConfig
{
  return self->_highlightsGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleListTagFeedGroupTopicsConfig
{
  return self->_articleListTagFeedGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagFeedTopicsConfig
{
  return self->_tagFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)newspaperTodayFeedTopicsConfig
{
  return self->_newspaperTodayFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)moreForYouTopicsConfig
{
  return self->_moreForYouTopicsConfig;
}

- (FCPersonalizationTopicsConfig)localSectionGroupTopicsConfig
{
  return self->_localSectionGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)newspaperSectionGroupTopicsConfig
{
  return self->_newspaperSectionGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)sportsEventArticlesGroupTopicsConfig
{
  return self->_sportsEventArticlesGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagForYouGroupTopicsConfig
{
  return self->_tagForYouGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagRecentStoriesTopicsConfig
{
  return self->_tagRecentStoriesTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagDateRangeTopicsConfig
{
  return self->_tagDateRangeTopicsConfig;
}

- (FCPersonalizationTopicsConfig)sportsEventTopicGroupTopicsConfig
{
  return self->_sportsEventTopicGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)affinityGroupTopicsConfig
{
  return self->_affinityGroupTopicsConfig;
}

- (FCPersonalizationOntologyLevelConfig)topicFeedOntologyLevelConfig
{
  return self->_topicFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)magazineFeedArticleOntologyLevelConfig
{
  return self->_magazineFeedArticleOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)legacyAudioFeedOntologyLevelConfig
{
  return self->_legacyAudioFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)audioFeedOntologyLevelConfig
{
  return self->_audioFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleRecirculationPrimaryOntologyLevelConfig
{
  return self->_articleRecirculationPrimaryOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleRecirculationSecondaryOntologyLevelConfig
{
  return self->_articleRecirculationSecondaryOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleRecirculationTertiaryOntologyLevelConfig
{
  return self->_articleRecirculationTertiaryOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleRecirculationQuaternaryOntologyLevelConfig
{
  return self->_articleRecirculationQuaternaryOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)bestOfBundleOntologyLevelConfig
{
  return self->_bestOfBundleOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)curatedOntologyLevelConfig
{
  return self->_curatedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)curatedIssuesOntologyLevelConfig
{
  return self->_curatedIssuesOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)greatStoriesYouMissedOntologyLevelConfig
{
  return self->_greatStoriesYouMissedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)latestStoriesOntologyLevelConfig
{
  return self->_latestStoriesOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)localNewsOntologyLevelConfig
{
  return self->_localNewsOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)newspaperMagazineFeedOntologyLevelConfig
{
  return self->_newspaperMagazineFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)todayWidgetOntologyLevelConfig
{
  return self->_todayWidgetOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagWidgetOntologyLevelConfig
{
  return self->_tagWidgetOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)mySportsGroupOntologyLevelConfig
{
  return self->_mySportsGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)mySportsGroupForYouOntologyLevelConfig
{
  return self->_mySportsGroupForYouOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)mySportsTopicsOntologyLevelConfig
{
  return self->_mySportsTopicsOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)sportsTopStoriesOntologyLevelConfig
{
  return self->_sportsTopStoriesOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)introToSportsGroupOntologyLevelConfig
{
  return self->_introToSportsGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)introToSportsGroupForYouOntologyLevelConfig
{
  return self->_introToSportsGroupForYouOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)highlightsGroupOntologyLevelConfig
{
  return self->_highlightsGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleListTagFeedGroupOntologyLevelConfig
{
  return self->_articleListTagFeedGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagFeedOntologyLevelConfig
{
  return self->_tagFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)newspaperTodayFeedOntologyLevelConfig
{
  return self->_newspaperTodayFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)moreForYouOntologyLevelConfig
{
  return self->_moreForYouOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)localSectionGroupOntologyLevelConfig
{
  return self->_localSectionGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)newspaperSectionGroupOntologyLevelConfig
{
  return self->_newspaperSectionGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)sportsEventArticlesGroupOntologyLevelConfig
{
  return self->_sportsEventArticlesGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagForYouGroupOntologyLevelConfig
{
  return self->_tagForYouGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagRecentStoriesOntologyLevelConfig
{
  return self->_tagRecentStoriesOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagDateRangeOntologyLevelConfig
{
  return self->_tagDateRangeOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)sportsEventTopicGroupOntologyLevelConfig
{
  return self->_sportsEventTopicGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)affinityGroupOntologyLevelConfig
{
  return self->_affinityGroupOntologyLevelConfig;
}

- (NSDictionary)shadowDefaultScoringConfig
{
  return self->_shadowDefaultScoringConfig;
}

- (NSDictionary)shadowTopicFeedScoringConfig
{
  return self->_shadowTopicFeedScoringConfig;
}

- (NSDictionary)shadowMagazineFeedArticleScoringConfig
{
  return self->_shadowMagazineFeedArticleScoringConfig;
}

- (NSDictionary)shadowMagazineFeedIssueScoringConfig
{
  return self->_shadowMagazineFeedIssueScoringConfig;
}

- (NSDictionary)shadowLegacyAudioFeedScoringConfig
{
  return self->_shadowLegacyAudioFeedScoringConfig;
}

- (NSDictionary)shadowAudioFeedScoringConfig
{
  return self->_shadowAudioFeedScoringConfig;
}

- (NSDictionary)shadowArticleRecirculationPrimaryScoringConfig
{
  return self->_shadowArticleRecirculationPrimaryScoringConfig;
}

- (NSDictionary)shadowArticleRecirculationSecondaryScoringConfig
{
  return self->_shadowArticleRecirculationSecondaryScoringConfig;
}

- (NSDictionary)shadowArticleRecirculationTertiaryScoringConfig
{
  return self->_shadowArticleRecirculationTertiaryScoringConfig;
}

- (NSDictionary)shadowArticleRecirculationQuaternaryScoringConfig
{
  return self->_shadowArticleRecirculationQuaternaryScoringConfig;
}

- (NSDictionary)shadowBestOfBundleScoringConfig
{
  return self->_shadowBestOfBundleScoringConfig;
}

- (NSDictionary)shadowCuratedScoringConfig
{
  return self->_shadowCuratedScoringConfig;
}

- (NSDictionary)shadowCuratedIssuesScoringConfig
{
  return self->_shadowCuratedIssuesScoringConfig;
}

- (NSDictionary)shadowForYouScoringConfig
{
  return self->_shadowForYouScoringConfig;
}

- (NSDictionary)shadowGreatStoriesYouMissedScoringConfig
{
  return self->_shadowGreatStoriesYouMissedScoringConfig;
}

- (NSDictionary)shadowLatestStoriesScoringConfig
{
  return self->_shadowLatestStoriesScoringConfig;
}

- (NSDictionary)shadowLocalNewsScoringConfig
{
  return self->_shadowLocalNewsScoringConfig;
}

- (NSDictionary)shadowNewspaperMagazineFeedScoringConfig
{
  return self->_shadowNewspaperMagazineFeedScoringConfig;
}

- (NSDictionary)shadowTodayWidgetScoringConfig
{
  return self->_shadowTodayWidgetScoringConfig;
}

- (NSDictionary)shadowTagWidgetScoringConfig
{
  return self->_shadowTagWidgetScoringConfig;
}

- (NSDictionary)shadowNotificationScoringConfig
{
  return self->_shadowNotificationScoringConfig;
}

- (NSDictionary)shadowMySportsGroupScoringConfig
{
  return self->_shadowMySportsGroupScoringConfig;
}

- (NSDictionary)shadowMySportsGroupForYouScoringConfig
{
  return self->_shadowMySportsGroupForYouScoringConfig;
}

- (NSDictionary)shadowMySportsTopicsScoringConfig
{
  return self->_shadowMySportsTopicsScoringConfig;
}

- (NSDictionary)shadowSportsTopStoriesScoringConfig
{
  return self->_shadowSportsTopStoriesScoringConfig;
}

- (NSDictionary)shadowIntroToSportsGroupScoringConfig
{
  return self->_shadowIntroToSportsGroupScoringConfig;
}

- (NSDictionary)shadowIntroToSportsGroupForYouScoringConfig
{
  return self->_shadowIntroToSportsGroupForYouScoringConfig;
}

- (NSDictionary)shadowHighlightsGroupScoringConfig
{
  return self->_shadowHighlightsGroupScoringConfig;
}

- (NSDictionary)shadowArticleListTagFeedGroupScoringConfig
{
  return self->_shadowArticleListTagFeedGroupScoringConfig;
}

- (NSDictionary)shadowTagFeedScoringConfig
{
  return self->_shadowTagFeedScoringConfig;
}

- (NSDictionary)shadowNewspaperTodayFeedScoringConfig
{
  return self->_shadowNewspaperTodayFeedScoringConfig;
}

- (NSDictionary)shadowMoreForYouScoringConfig
{
  return self->_shadowMoreForYouScoringConfig;
}

- (NSDictionary)shadowLocalSectionGroupScoringConfig
{
  return self->_shadowLocalSectionGroupScoringConfig;
}

- (NSDictionary)shadowNewspaperSectionGroupScoringConfig
{
  return self->_shadowNewspaperSectionGroupScoringConfig;
}

- (NSDictionary)shadowSportsEventArticlesGroupScoringConfig
{
  return self->_shadowSportsEventArticlesGroupScoringConfig;
}

- (NSDictionary)shadowTagForYouGroupScoringConfig
{
  return self->_shadowTagForYouGroupScoringConfig;
}

- (NSDictionary)shadowTagRecentStoriesScoringConfig
{
  return self->_shadowTagRecentStoriesScoringConfig;
}

- (NSDictionary)shadowTagDateRangeScoringConfig
{
  return self->_shadowTagDateRangeScoringConfig;
}

- (NSDictionary)shadowSportsEventTopicGroupScoringConfig
{
  return self->_shadowSportsEventTopicGroupScoringConfig;
}

- (NSDictionary)shadowAffinityGroupScoringConfig
{
  return self->_shadowAffinityGroupScoringConfig;
}

- (NSArray)shadowDefaultTopicsConfig
{
  return self->_shadowDefaultTopicsConfig;
}

- (NSArray)shadowTopicFeedTopicsConfig
{
  return self->_shadowTopicFeedTopicsConfig;
}

- (NSArray)shadowMagazineFeedArticleTopicsConfig
{
  return self->_shadowMagazineFeedArticleTopicsConfig;
}

- (NSArray)shadowMagazineFeedIssueTopicsConfig
{
  return self->_shadowMagazineFeedIssueTopicsConfig;
}

- (NSArray)shadowLegacyAudioFeedTopicsConfig
{
  return self->_shadowLegacyAudioFeedTopicsConfig;
}

- (NSArray)shadowAudioFeedTopicsConfig
{
  return self->_shadowAudioFeedTopicsConfig;
}

- (NSArray)shadowArticleRecirculationPrimaryTopicsConfig
{
  return self->_shadowArticleRecirculationPrimaryTopicsConfig;
}

- (NSArray)shadowArticleRecirculationSecondaryTopicsConfig
{
  return self->_shadowArticleRecirculationSecondaryTopicsConfig;
}

- (NSArray)shadowArticleRecirculationTertiaryTopicsConfig
{
  return self->_shadowArticleRecirculationTertiaryTopicsConfig;
}

- (NSArray)shadowArticleRecirculationQuaternaryTopicsConfig
{
  return self->_shadowArticleRecirculationQuaternaryTopicsConfig;
}

- (NSArray)shadowBestOfBundleTopicsConfig
{
  return self->_shadowBestOfBundleTopicsConfig;
}

- (NSArray)shadowCuratedTopicsConfig
{
  return self->_shadowCuratedTopicsConfig;
}

- (NSArray)shadowCuratedIssuesTopicsConfig
{
  return self->_shadowCuratedIssuesTopicsConfig;
}

- (NSArray)shadowForYouTopicsConfig
{
  return self->_shadowForYouTopicsConfig;
}

- (NSArray)shadowGreatStoriesYouMissedTopicsConfig
{
  return self->_shadowGreatStoriesYouMissedTopicsConfig;
}

- (NSArray)shadowLatestStoriesTopicsConfig
{
  return self->_shadowLatestStoriesTopicsConfig;
}

- (NSArray)shadowLocalNewsTopicsConfig
{
  return self->_shadowLocalNewsTopicsConfig;
}

- (NSArray)shadowNewspaperMagazineFeedTopicsConfig
{
  return self->_shadowNewspaperMagazineFeedTopicsConfig;
}

- (NSArray)shadowTodayWidgetTopicsConfig
{
  return self->_shadowTodayWidgetTopicsConfig;
}

- (NSArray)shadowTagWidgetTopicsConfig
{
  return self->_shadowTagWidgetTopicsConfig;
}

- (NSArray)shadowMySportsGroupTopicsConfig
{
  return self->_shadowMySportsGroupTopicsConfig;
}

- (NSArray)shadowMySportsGroupForYouTopicsConfig
{
  return self->_shadowMySportsGroupForYouTopicsConfig;
}

- (NSArray)shadowMySportsTopicsTopicsConfig
{
  return self->_shadowMySportsTopicsTopicsConfig;
}

- (NSArray)shadowSportsTopStoriesTopicsConfig
{
  return self->_shadowSportsTopStoriesTopicsConfig;
}

- (NSArray)shadowIntroToSportsGroupTopicsConfig
{
  return self->_shadowIntroToSportsGroupTopicsConfig;
}

- (NSArray)shadowIntroToSportsGroupForYouTopicsConfig
{
  return self->_shadowIntroToSportsGroupForYouTopicsConfig;
}

- (NSArray)shadowHighlightsGroupTopicsConfig
{
  return self->_shadowHighlightsGroupTopicsConfig;
}

- (NSArray)shadowArticleListTagFeedGroupTopicsConfig
{
  return self->_shadowArticleListTagFeedGroupTopicsConfig;
}

- (NSArray)shadowTagFeedTopicsConfig
{
  return self->_shadowTagFeedTopicsConfig;
}

- (NSArray)shadowNewspaperTodayFeedTopicsConfig
{
  return self->_shadowNewspaperTodayFeedTopicsConfig;
}

- (NSArray)shadowMoreForYouTopicsConfig
{
  return self->_shadowMoreForYouTopicsConfig;
}

- (NSArray)shadowLocalSectionGroupTopicsConfig
{
  return self->_shadowLocalSectionGroupTopicsConfig;
}

- (NSArray)shadowNewspaperSectionGroupTopicsConfig
{
  return self->_shadowNewspaperSectionGroupTopicsConfig;
}

- (NSArray)shadowSportsEventArticlesGroupTopicsConfig
{
  return self->_shadowSportsEventArticlesGroupTopicsConfig;
}

- (NSArray)shadowTagForYouGroupTopicsConfig
{
  return self->_shadowTagForYouGroupTopicsConfig;
}

- (NSArray)shadowTagRecentStoriesTopicsConfig
{
  return self->_shadowTagRecentStoriesTopicsConfig;
}

- (NSArray)shadowTagDateRangeTopicsConfig
{
  return self->_shadowTagDateRangeTopicsConfig;
}

- (NSArray)shadowSportsEventTopicGroupTopicsConfig
{
  return self->_shadowSportsEventTopicGroupTopicsConfig;
}

- (NSArray)shadowAffinityGroupTopicsConfig
{
  return self->_shadowAffinityGroupTopicsConfig;
}

- (NSDictionary)shadowDefaultOntologyLevelConfig
{
  return self->_shadowDefaultOntologyLevelConfig;
}

- (NSDictionary)shadowTopicFeedOntologyLevelConfig
{
  return self->_shadowTopicFeedOntologyLevelConfig;
}

- (NSDictionary)shadowMagazineFeedArticleOntologyLevelConfig
{
  return self->_shadowMagazineFeedArticleOntologyLevelConfig;
}

- (NSDictionary)shadowMagazineFeedIssueOntologyLevelConfig
{
  return self->_shadowMagazineFeedIssueOntologyLevelConfig;
}

- (NSDictionary)shadowLegacyAudioFeedOntologyLevelConfig
{
  return self->_shadowLegacyAudioFeedOntologyLevelConfig;
}

- (NSDictionary)shadowAudioFeedOntologyLevelConfig
{
  return self->_shadowAudioFeedOntologyLevelConfig;
}

- (NSDictionary)shadowArticleRecirculationPrimaryOntologyLevelConfig
{
  return self->_shadowArticleRecirculationPrimaryOntologyLevelConfig;
}

- (NSDictionary)shadowArticleRecirculationSecondaryOntologyLevelConfig
{
  return self->_shadowArticleRecirculationSecondaryOntologyLevelConfig;
}

- (NSDictionary)shadowArticleRecirculationTertiaryOntologyLevelConfig
{
  return self->_shadowArticleRecirculationTertiaryOntologyLevelConfig;
}

- (NSDictionary)shadowArticleRecirculationQuaternaryOntologyLevelConfig
{
  return self->_shadowArticleRecirculationQuaternaryOntologyLevelConfig;
}

- (NSDictionary)shadowBestOfBundleOntologyLevelConfig
{
  return self->_shadowBestOfBundleOntologyLevelConfig;
}

- (NSDictionary)shadowCuratedOntologyLevelConfig
{
  return self->_shadowCuratedOntologyLevelConfig;
}

- (NSDictionary)shadowCuratedIssuesOntologyLevelConfig
{
  return self->_shadowCuratedIssuesOntologyLevelConfig;
}

- (NSDictionary)shadowForYouOntologyLevelConfig
{
  return self->_shadowForYouOntologyLevelConfig;
}

- (NSDictionary)shadowGreatStoriesYouMissedOntologyLevelConfig
{
  return self->_shadowGreatStoriesYouMissedOntologyLevelConfig;
}

- (NSDictionary)shadowLatestStoriesOntologyLevelConfig
{
  return self->_shadowLatestStoriesOntologyLevelConfig;
}

- (NSDictionary)shadowLocalNewsOntologyLevelConfig
{
  return self->_shadowLocalNewsOntologyLevelConfig;
}

- (NSDictionary)shadowNewspaperMagazineFeedOntologyLevelConfig
{
  return self->_shadowNewspaperMagazineFeedOntologyLevelConfig;
}

- (NSDictionary)shadowTodayWidgetOntologyLevelConfig
{
  return self->_shadowTodayWidgetOntologyLevelConfig;
}

- (NSDictionary)shadowTagWidgetOntologyLevelConfig
{
  return self->_shadowTagWidgetOntologyLevelConfig;
}

- (NSDictionary)shadowMySportsGroupOntologyLevelConfig
{
  return self->_shadowMySportsGroupOntologyLevelConfig;
}

- (NSDictionary)shadowMySportsGroupForYouOntologyLevelConfig
{
  return self->_shadowMySportsGroupForYouOntologyLevelConfig;
}

- (NSDictionary)shadowMySportsTopicsOntologyLevelConfig
{
  return self->_shadowMySportsTopicsOntologyLevelConfig;
}

- (NSDictionary)shadowSportsTopStoriesOntologyLevelConfig
{
  return self->_shadowSportsTopStoriesOntologyLevelConfig;
}

- (NSDictionary)shadowIntroToSportsGroupOntologyLevelConfig
{
  return self->_shadowIntroToSportsGroupOntologyLevelConfig;
}

- (NSDictionary)shadowIntroToSportsGroupForYouOntologyLevelConfig
{
  return self->_shadowIntroToSportsGroupForYouOntologyLevelConfig;
}

- (NSDictionary)shadowHighlightsGroupOntologyLevelConfig
{
  return self->_shadowHighlightsGroupOntologyLevelConfig;
}

- (NSDictionary)shadowArticleListTagFeedGroupOntologyLevelConfig
{
  return self->_shadowArticleListTagFeedGroupOntologyLevelConfig;
}

- (NSDictionary)shadowTagFeedOntologyLevelConfig
{
  return self->_shadowTagFeedOntologyLevelConfig;
}

- (NSDictionary)shadowNewspaperTodayFeedOntologyLevelConfig
{
  return self->_shadowNewspaperTodayFeedOntologyLevelConfig;
}

- (NSDictionary)shadowMoreForYouOntologyLevelConfig
{
  return self->_shadowMoreForYouOntologyLevelConfig;
}

- (NSDictionary)shadowLocalSectionGroupOntologyLevelConfig
{
  return self->_shadowLocalSectionGroupOntologyLevelConfig;
}

- (NSDictionary)shadowNewspaperSectionGroupOntologyLevelConfig
{
  return self->_shadowNewspaperSectionGroupOntologyLevelConfig;
}

- (NSDictionary)shadowSportsEventArticlesGroupOntologyLevelConfig
{
  return self->_shadowSportsEventArticlesGroupOntologyLevelConfig;
}

- (NSDictionary)shadowTagForYouGroupOntologyLevelConfig
{
  return self->_shadowTagForYouGroupOntologyLevelConfig;
}

- (NSDictionary)shadowTagRecentStoriesOntologyLevelConfig
{
  return self->_shadowTagRecentStoriesOntologyLevelConfig;
}

- (NSDictionary)shadowTagDateRangeOntologyLevelConfig
{
  return self->_shadowTagDateRangeOntologyLevelConfig;
}

- (NSDictionary)shadowSportsEventTopicGroupOntologyLevelConfig
{
  return self->_shadowSportsEventTopicGroupOntologyLevelConfig;
}

- (NSDictionary)shadowAffinityGroupOntologyLevelConfig
{
  return self->_shadowAffinityGroupOntologyLevelConfig;
}

- (double)topicFeedFilterMutedTopics
{
  return self->_topicFeedFilterMutedTopics;
}

- (double)magazineFeedGroupScoreWeight
{
  return self->_magazineFeedGroupScoreWeight;
}

- (double)audioFeedGroupScoreWeight
{
  return self->_audioFeedGroupScoreWeight;
}

- (int64_t)forYouGroupFilteredSubsetCount
{
  return self->_forYouGroupFilteredSubsetCount;
}

- (BOOL)forYouGroupAllowUnfilteredArticles
{
  return self->_forYouGroupAllowUnfilteredArticles;
}

- (double)topStoriesGroupAggregatesGroupBias
{
  return self->_topStoriesGroupAggregatesGroupBias;
}

- (double)trendingGroupAggregatesGroupBias
{
  return self->_trendingGroupAggregatesGroupBias;
}

- (double)filterableNotificationThresholdMultiplier
{
  return self->_filterableNotificationThresholdMultiplier;
}

- (double)minimumMyMagazinesIssueScoreBaselineMultiplier
{
  return self->_minimumMyMagazinesIssueScoreBaselineMultiplier;
}

- (BOOL)reorderHeadlinesUsingEmbeddingScoreBeforeGrouping
{
  return self->_reorderHeadlinesUsingEmbeddingScoreBeforeGrouping;
}

- (int64_t)maxNumberOfTotalTopicAndChannelGroups
{
  return self->_maxNumberOfTotalTopicAndChannelGroups;
}

- (unint64_t)scoringVersion
{
  return self->_scoringVersion;
}

- (int64_t)maxExternalSignalEventCount
{
  return self->_maxExternalSignalEventCount;
}

- (BOOL)computeUserVectorWithTabi
{
  return self->_computeUserVectorWithTabi;
}

- (void)setComputeUserVectorWithTabi:(BOOL)a3
{
  self->_computeUserVectorWithTabi = a3;
}

@end