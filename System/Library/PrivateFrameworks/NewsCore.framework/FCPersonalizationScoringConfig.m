@interface FCPersonalizationScoringConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)dampenerEnabled;
- (BOOL)multiplierEnabled;
- (BOOL)nicheContentBoostOnlyAboveBaselineMembership;
- (BOOL)nicheContentExcludeNonGroupableTopics;
- (BOOL)nicheContentManagedTopicBoostAllTags;
- (BOOL)nicheContentShouldBoostPublisher;
- (BOOL)respectHalfLifeOverride;
- (FCPersonalizationCohortConfig)conversionCohort;
- (FCPersonalizationCohortConfig)userCohort;
- (FCPersonalizationLowFlowEstimationConfig)lowFlowBoostEventEstimationConfig;
- (FCPersonalizationLowFlowEstimationConfig)lowFlowBoostFetchEstimationConfig;
- (FCPersonalizationScoringConfig)init;
- (FCPersonalizationScoringConfig)initWithAnfMultiplier:(double)a3 articleEmbeddingScoreCoefficient:(double)a4 articleEmbeddingScoreDampenerWeight:(double)a5 articleLengthAggregateWeight:(double)a6 articleReadPenalty:(double)a7 articleListenedPenalty:(double)a8 audioMultiplierForFreeUsers:(double)a9 audioMultiplierForTrialUsers:(uint64_t)a10 audioMultiplierForPaidUsers:(void *)a11 autofavoritedVoteCoefficient:(BOOL)a12 baselineRatePrior:(void *)a13 bundleFreeMultiplierForFreeUsers:(void *)a14 bundleFreeMultiplierForTrialUsers:(void *)a15 bundleFreeMultiplierForPaidUsers:(BOOL)a16 bundlePaidMultiplierForFreeUsers:(double)a17 bundlePaidMultiplierForTrialUsers:(double)a18 bundlePaidMultiplierForPaidUsers:(double)a19 conversionCoefficientForFreeUsers:(double)a20 conversionCoefficientForTrialUsers:(double)a21 conversionCoefficientForPaidUsers:(double)a22 conversionCohort:(double)a23 ctrWithOneAutofavorited:(double)a24 ctrWithOneSubscribed:(double)a25 ctrWithSubscribedChannel:(double)a26 ctrWithThreeAutofavorited:(double)a27 ctrWithThreeSubscribed:(double)a28 ctrWithTwoAutofavorited:(double)a29 ctrWithTwoSubscribed:(double)a30 ctrWithZeroAutofavorited:(double)a31 ctrWithZeroSubscribed:(double)a32 decayFactor:(double)a33 featuredMultiplierForFreeUsers:(double)a34 featuredMultiplierForTrialUsers:(double)a35 featuredMultiplierForPaidUsers:(double)a36 evergreenMultiplierForFreeUsers:(double)a37 evergreenMultiplierForTrialUsers:(double)a38 evergreenMultiplierForPaidUsers:(double)a39 globalScoreCoefficientFree:(double)a40 globalScoreCoefficientPaid:(double)a41 globalScoreCoefficientHalfLife:(double)a42 globalScoreCoefficientInitialMultiplier:(double)a43 globalScoreDemocratizationFactor:(double)a44 localScoreDemocratizationFactor:(double)a45 conversionScoreDemocratizationFactor:(double)a46 headlineSeenPenalty:(double)a47 halfLifeCoefficient:(double)a48 userFeedbackHalfLifeCoefficient:(double)a49 evergreenHalfLifeCoefficient:(double)a50 respectHalfLifeOverride:(double)a51 mutedVoteCoefficient:(double)a52 personalizationCoefficient:(double)a53 publisherAggregateWeight:(double)a54 sparseTagsPenalty:(double)a55 subscribedChannelScoreCoefficient:(double)a56 subscribedTopicsScoreCoefficient:(double)a57 userCohort:(double)a58 lowFlowBoostFetchCountWeight:(double)a59 lowFlowBoostFactor:(double)a60 lowFlowBoostMaxProductFactor:(double)a61 lowFlowBoostFetchEstimationConfig:(double)a62 lowFlowBoostEventEstimationConfig:(double)a63 nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQualityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:dampenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlsoReadScoreCoefficient:;
- (FCPersonalizationScoringConfig)initWithCoder:(id)a3;
- (FCPersonalizationScoringConfig)initWithConfigDictionary:(id)a3;
- (FCPersonalizationScoringConfig)initWithConfigDictionary:(id)a3 defaultConfig:(id)a4;
- (double)anfMultiplier;
- (double)articleEmbeddingScoreCoefficient;
- (double)articleEmbeddingScoreDampenerWeight;
- (double)articleLengthAggregateWeight;
- (double)articleListenedPenalty;
- (double)articleReadPenalty;
- (double)audioMultiplierForFreeUsers;
- (double)audioMultiplierForPaidUsers;
- (double)audioMultiplierForTrialUsers;
- (double)autofavoritedVoteCoefficient;
- (double)baselineRatePrior;
- (double)bundleFreeMultiplierForFreeUsers;
- (double)bundleFreeMultiplierForPaidUsers;
- (double)bundleFreeMultiplierForTrialUsers;
- (double)bundlePaidMultiplierForFreeUsers;
- (double)bundlePaidMultiplierForPaidUsers;
- (double)bundlePaidMultiplierForTrialUsers;
- (double)clientSideEngagementBoostANFMutiplier;
- (double)clientSideEngagementBoostFeatureCandidateArticleMultiplier;
- (double)clientSideEngagementBoostFeaturedArticleMultiplier;
- (double)clientSideEngagementBoostFreeCohortCTRCap;
- (double)clientSideEngagementBoostPaidCohortCTRCap;
- (double)clientSideEngagementBoostReduceVisibilityMultiplier;
- (double)clientSideEngagementBoostTagQualityMultiplier;
- (double)contentTriggerDampenerCoefficient;
- (double)contentTriggerMaxDampener;
- (double)contentTriggerMinScoreWeight;
- (double)contentTriggerScoreExponent;
- (double)contentTriggerTagWeightExponent;
- (double)conversionCoefficientForFreeUsers;
- (double)conversionCoefficientForPaidUsers;
- (double)conversionCoefficientForTrialUsers;
- (double)conversionScoreDemocratizationFactor;
- (double)ctrWithOneAutofavorited;
- (double)ctrWithOneSubscribed;
- (double)ctrWithSubscribedChannel;
- (double)ctrWithThreeAutofavorited;
- (double)ctrWithThreeSubscribed;
- (double)ctrWithTwoAutofavorited;
- (double)ctrWithTwoSubscribed;
- (double)ctrWithZeroAutofavorited;
- (double)ctrWithZeroSubscribed;
- (double)decayFactor;
- (double)evergreenHalfLifeCoefficient;
- (double)evergreenMultiplierForFreeUsers;
- (double)evergreenMultiplierForPaidUsers;
- (double)evergreenMultiplierForTrialUsers;
- (double)featuredMultiplierForFreeUsers;
- (double)featuredMultiplierForPaidUsers;
- (double)featuredMultiplierForTrialUsers;
- (double)globalScoreCoefficientFree;
- (double)globalScoreCoefficientHalfLife;
- (double)globalScoreCoefficientInitialMultiplier;
- (double)globalScoreCoefficientPaid;
- (double)globalScoreDemocratizationFactor;
- (double)halfLifeCoefficient;
- (double)headlineSeenPenalty;
- (double)localScoreDemocratizationFactor;
- (double)lowFlowBoostFactor;
- (double)lowFlowBoostFetchCountWeight;
- (double)lowFlowBoostMaxProductFactor;
- (double)mutedVoteCoefficient;
- (double)nicheContentBaselineMembershipMultiplier;
- (double)nicheContentDefaultFlowRate;
- (double)nicheContentDefaultSubscriptionRate;
- (double)nicheContentManagedTopicBoost;
- (double)nicheContentPublisherFlowExponent;
- (double)nicheContentPublisherSubscriptionExponent;
- (double)nicheContentQualityThreshold;
- (double)nicheContentServerFlowWeight;
- (double)nicheContentTopicFlowExponent;
- (double)nicheContentTopicSubscriptionExponent;
- (double)peopleAlsoReadBaselineScore;
- (double)peopleAlsoReadConditionalScoreCoefficient;
- (double)peopleAlsoReadScoreCoefficient;
- (double)personalizationCoefficient;
- (double)personalizedMultiplierBaselineMembership;
- (double)personalizedMultiplierMembershipDampener;
- (double)personalizedMultiplierPostBaselineCurvature;
- (double)personalizedMultiplierPreBaselineCurvature;
- (double)publisherAggregateWeight;
- (double)publisherDampenerWeight;
- (double)recentlyFollowedDurationThreshold;
- (double)recentlyFollowedMultiplier;
- (double)sparseTagsPenalty;
- (double)subscribedChannelScoreCoefficient;
- (double)subscribedTopicsScoreCoefficient;
- (double)tabiScoreCoefficient;
- (double)userFeedbackHalfLifeCoefficient;
- (int64_t)contentTriggerMaxEventCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAnfMultiplier:(double)a3;
- (void)setArticleEmbeddingScoreCoefficient:(double)a3;
- (void)setArticleEmbeddingScoreDampenerWeight:(double)a3;
- (void)setArticleLengthAggregateWeight:(double)a3;
- (void)setArticleListenedPenalty:(double)a3;
- (void)setArticleReadPenalty:(double)a3;
- (void)setAudioMultiplierForFreeUsers:(double)a3;
- (void)setAudioMultiplierForPaidUsers:(double)a3;
- (void)setAudioMultiplierForTrialUsers:(double)a3;
- (void)setAutofavoritedVoteCoefficient:(double)a3;
- (void)setBaselineRatePrior:(double)a3;
- (void)setBundleFreeMultiplierForFreeUsers:(double)a3;
- (void)setBundleFreeMultiplierForPaidUsers:(double)a3;
- (void)setBundleFreeMultiplierForTrialUsers:(double)a3;
- (void)setBundlePaidMultiplierForFreeUsers:(double)a3;
- (void)setBundlePaidMultiplierForPaidUsers:(double)a3;
- (void)setBundlePaidMultiplierForTrialUsers:(double)a3;
- (void)setClientSideEngagementBoostANFMutiplier:(double)a3;
- (void)setClientSideEngagementBoostFeatureCandidateArticleMultiplier:(double)a3;
- (void)setClientSideEngagementBoostFeaturedArticleMultiplier:(double)a3;
- (void)setClientSideEngagementBoostFreeCohortCTRCap:(double)a3;
- (void)setClientSideEngagementBoostPaidCohortCTRCap:(double)a3;
- (void)setClientSideEngagementBoostReduceVisibilityMultiplier:(double)a3;
- (void)setClientSideEngagementBoostTagQualityMultiplier:(double)a3;
- (void)setContentTriggerDampenerCoefficient:(double)a3;
- (void)setContentTriggerMaxDampener:(double)a3;
- (void)setContentTriggerMaxEventCount:(int64_t)a3;
- (void)setContentTriggerMinScoreWeight:(double)a3;
- (void)setContentTriggerScoreExponent:(double)a3;
- (void)setContentTriggerTagWeightExponent:(double)a3;
- (void)setConversionCoefficientForFreeUsers:(double)a3;
- (void)setConversionCoefficientForPaidUsers:(double)a3;
- (void)setConversionCoefficientForTrialUsers:(double)a3;
- (void)setConversionCohort:(id)a3;
- (void)setConversionScoreDemocratizationFactor:(double)a3;
- (void)setCtrWithOneAutofavorited:(double)a3;
- (void)setCtrWithOneSubscribed:(double)a3;
- (void)setCtrWithSubscribedChannel:(double)a3;
- (void)setCtrWithThreeAutofavorited:(double)a3;
- (void)setCtrWithThreeSubscribed:(double)a3;
- (void)setCtrWithTwoAutofavorited:(double)a3;
- (void)setCtrWithTwoSubscribed:(double)a3;
- (void)setCtrWithZeroAutofavorited:(double)a3;
- (void)setCtrWithZeroSubscribed:(double)a3;
- (void)setDampenerEnabled:(BOOL)a3;
- (void)setDecayFactor:(double)a3;
- (void)setEvergreenHalfLifeCoefficient:(double)a3;
- (void)setEvergreenMultiplierForFreeUsers:(double)a3;
- (void)setEvergreenMultiplierForPaidUsers:(double)a3;
- (void)setEvergreenMultiplierForTrialUsers:(double)a3;
- (void)setFeaturedMultiplierForFreeUsers:(double)a3;
- (void)setFeaturedMultiplierForPaidUsers:(double)a3;
- (void)setFeaturedMultiplierForTrialUsers:(double)a3;
- (void)setGlobalScoreCoefficientFree:(double)a3;
- (void)setGlobalScoreCoefficientHalfLife:(double)a3;
- (void)setGlobalScoreCoefficientInitialMultiplier:(double)a3;
- (void)setGlobalScoreCoefficientPaid:(double)a3;
- (void)setGlobalScoreDemocratizationFactor:(double)a3;
- (void)setHalfLifeCoefficient:(double)a3;
- (void)setHeadlineSeenPenalty:(double)a3;
- (void)setLocalScoreDemocratizationFactor:(double)a3;
- (void)setLowFlowBoostEventEstimationConfig:(id)a3;
- (void)setLowFlowBoostFactor:(double)a3;
- (void)setLowFlowBoostFetchCountWeight:(double)a3;
- (void)setLowFlowBoostFetchEstimationConfig:(id)a3;
- (void)setLowFlowBoostMaxProductFactor:(double)a3;
- (void)setMultiplierEnabled:(BOOL)a3;
- (void)setMutedVoteCoefficient:(double)a3;
- (void)setNicheContentBaselineMembershipMultiplier:(double)a3;
- (void)setNicheContentBoostOnlyAboveBaselineMembership:(BOOL)a3;
- (void)setNicheContentDefaultFlowRate:(double)a3;
- (void)setNicheContentDefaultSubscriptionRate:(double)a3;
- (void)setNicheContentExcludeNonGroupableTopics:(BOOL)a3;
- (void)setNicheContentManagedTopicBoost:(double)a3;
- (void)setNicheContentManagedTopicBoostAllTags:(BOOL)a3;
- (void)setNicheContentPublisherFlowExponent:(double)a3;
- (void)setNicheContentPublisherSubscriptionExponent:(double)a3;
- (void)setNicheContentQualityThreshold:(double)a3;
- (void)setNicheContentServerFlowWeight:(double)a3;
- (void)setNicheContentShouldBoostPublisher:(BOOL)a3;
- (void)setNicheContentTopicFlowExponent:(double)a3;
- (void)setNicheContentTopicSubscriptionExponent:(double)a3;
- (void)setPeopleAlsoReadBaselineScore:(double)a3;
- (void)setPeopleAlsoReadConditionalScoreCoefficient:(double)a3;
- (void)setPeopleAlsoReadScoreCoefficient:(double)a3;
- (void)setPersonalizationCoefficient:(double)a3;
- (void)setPersonalizedMultiplierBaselineMembership:(double)a3;
- (void)setPersonalizedMultiplierMembershipDampener:(double)a3;
- (void)setPersonalizedMultiplierPostBaselineCurvature:(double)a3;
- (void)setPersonalizedMultiplierPreBaselineCurvature:(double)a3;
- (void)setPublisherAggregateWeight:(double)a3;
- (void)setPublisherDampenerWeight:(double)a3;
- (void)setRecentlyFollowedDurationThreshold:(double)a3;
- (void)setRecentlyFollowedMultiplier:(double)a3;
- (void)setRespectHalfLifeOverride:(BOOL)a3;
- (void)setSparseTagsPenalty:(double)a3;
- (void)setSubscribedChannelScoreCoefficient:(double)a3;
- (void)setSubscribedTopicsScoreCoefficient:(double)a3;
- (void)setTabiScoreCoefficient:(double)a3;
- (void)setUserCohort:(id)a3;
- (void)setUserFeedbackHalfLifeCoefficient:(double)a3;
@end

@implementation FCPersonalizationScoringConfig

- (FCPersonalizationScoringConfig)initWithConfigDictionary:(id)a3 defaultConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v270.receiver = self;
  v270.super_class = (Class)FCPersonalizationScoringConfig;
  v8 = [(FCPersonalizationScoringConfig *)&v270 init];
  if (v8)
  {
    v268 = v8;
    [v7 anfMultiplier];
    double v10 = FCAppConfigurationDoubleValue(v6, @"anfMultiplier", v9);
    [v7 anfMultiplier];
    if (v10 >= 0.0) {
      double v11 = v10;
    }
    double v267 = v11;
    [v7 articleEmbeddingScoreCoefficient];
    double v13 = FCAppConfigurationDoubleValue(v6, @"articleEmbeddingScoreCoefficient", v12);
    [v7 articleEmbeddingScoreCoefficient];
    if (v13 >= 0.0) {
      double v14 = v13;
    }
    double v266 = v14;
    [v7 articleEmbeddingScoreDampenerWeight];
    double v16 = FCAppConfigurationDoubleValue(v6, @"articleEmbeddingScoreDampenerWeight", v15);
    [v7 articleEmbeddingScoreDampenerWeight];
    if (v16 >= 0.0) {
      double v17 = v16;
    }
    double v265 = v17;
    [v7 articleLengthAggregateWeight];
    double v19 = FCAppConfigurationDoubleValue(v6, @"articleLengthAggregateWeight", v18);
    [v7 articleLengthAggregateWeight];
    if (v19 >= 0.0) {
      double v20 = v19;
    }
    double v264 = v20;
    [v7 articleReadPenalty];
    double v22 = FCAppConfigurationDoubleValue(v6, @"articleReadPenalty", v21);
    [v7 articleReadPenalty];
    if (v22 <= 1.0 && v22 >= 0.0) {
      double v23 = v22;
    }
    double v263 = v23;
    [v7 articleListenedPenalty];
    double v26 = FCAppConfigurationDoubleValue(v6, @"articleListenedPenalty", v25);
    [v7 articleListenedPenalty];
    if (v26 <= 1.0 && v26 >= 0.0) {
      double v27 = v26;
    }
    double v262 = v27;
    [v7 audioMultiplierForFreeUsers];
    double v261 = FCAppConfigurationDoubleValue(v6, @"audioMultiplierForAUsers", v29);
    [v7 audioMultiplierForTrialUsers];
    double v260 = FCAppConfigurationDoubleValue(v6, @"audioMultiplierForBUsers", v30);
    [v7 audioMultiplierForPaidUsers];
    double v259 = FCAppConfigurationDoubleValue(v6, @"audioMultiplierForCUsers", v31);
    [v7 autofavoritedVoteCoefficient];
    double v33 = FCAppConfigurationDoubleValue(v6, @"autofavoritedVoteCoefficient", v32);
    [v7 autofavoritedVoteCoefficient];
    if (v33 <= 1.0 && v33 >= 0.0) {
      double v34 = v33;
    }
    double v258 = v34;
    [v7 baselineRatePrior];
    double v37 = FCAppConfigurationDoubleValue(v6, @"baselineRatePrior", v36);
    [v7 baselineRatePrior];
    if (v37 >= 0.0) {
      double v38 = v37;
    }
    double v257 = v38;
    [v7 bundleFreeMultiplierForFreeUsers];
    double v256 = FCAppConfigurationDoubleValue(v6, @"bundleFreeMultiplierForAUsers", v39);
    [v7 bundleFreeMultiplierForTrialUsers];
    double v255 = FCAppConfigurationDoubleValue(v6, @"bundleFreeMultiplierForBUsers", v40);
    [v7 bundleFreeMultiplierForPaidUsers];
    double v254 = FCAppConfigurationDoubleValue(v6, @"bundleFreeMultiplierForCUsers", v41);
    [v7 bundlePaidMultiplierForFreeUsers];
    double v252 = FCAppConfigurationDoubleValue(v6, @"bundlePaidMultiplierForAUsers", v42);
    [v7 bundlePaidMultiplierForTrialUsers];
    double v251 = FCAppConfigurationDoubleValue(v6, @"bundlePaidMultiplierForBUsers", v43);
    [v7 bundlePaidMultiplierForPaidUsers];
    double v249 = FCAppConfigurationDoubleValue(v6, @"bundlePaidMultiplierForCUsers", v44);
    [v7 conversionCoefficientForFreeUsers];
    double v46 = FCAppConfigurationDoubleValue(v6, @"conversionCoefficientForFreeUsers", v45);
    [v7 conversionCoefficientForFreeUsers];
    if (v46 >= 0.0) {
      double v47 = v46;
    }
    double v247 = v47;
    [v7 conversionCoefficientForTrialUsers];
    double v49 = FCAppConfigurationDoubleValue(v6, @"conversionCoefficientForTrialUsers", v48);
    [v7 conversionCoefficientForTrialUsers];
    if (v49 >= 0.0) {
      double v50 = v49;
    }
    double v246 = v50;
    [v7 conversionCoefficientForPaidUsers];
    double v52 = FCAppConfigurationDoubleValue(v6, @"conversionCoefficientForPaidUsers", v51);
    [v7 conversionCoefficientForPaidUsers];
    if (v52 >= 0.0) {
      double v53 = v52;
    }
    double v245 = v53;
    v253 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"conversionCohort", 0);
    if (v253)
    {
      v54 = [FCPersonalizationCohortConfig alloc];
      v250 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"conversionCohort", 0);
      uint64_t v55 = -[FCPersonalizationCohortConfig initWithConfigDictionary:](v54, "initWithConfigDictionary:");
    }
    else
    {
      uint64_t v55 = [v7 conversionCohort];
      v250 = (void *)v55;
    }
    [v7 ctrWithOneAutofavorited];
    double v58 = FCAppConfigurationDoubleValue(v6, @"ctrWithOneAutofavorited", v57);
    [v7 ctrWithOneAutofavorited];
    if (v58 >= 0.0) {
      double v59 = v58;
    }
    double v244 = v59;
    [v7 ctrWithOneSubscribed];
    double v61 = FCAppConfigurationDoubleValue(v6, @"ctrWithOneSubscribed", v60);
    [v7 ctrWithOneSubscribed];
    if (v61 >= 0.0) {
      double v62 = v61;
    }
    double v243 = v62;
    [v7 ctrWithSubscribedChannel];
    double v64 = FCAppConfigurationDoubleValue(v6, @"ctrWithSubscribedChannel", v63);
    [v7 ctrWithSubscribedChannel];
    if (v64 >= 0.0) {
      double v65 = v64;
    }
    double v242 = v65;
    [v7 ctrWithThreeAutofavorited];
    double v67 = FCAppConfigurationDoubleValue(v6, @"ctrWithThreeAutofavorited", v66);
    [v7 ctrWithThreeAutofavorited];
    if (v67 >= 0.0) {
      double v68 = v67;
    }
    double v241 = v68;
    [v7 ctrWithThreeSubscribed];
    double v70 = FCAppConfigurationDoubleValue(v6, @"ctrWithThreeSubscribed", v69);
    [v7 ctrWithThreeSubscribed];
    if (v70 >= 0.0) {
      double v71 = v70;
    }
    double v240 = v71;
    [v7 ctrWithTwoAutofavorited];
    double v73 = FCAppConfigurationDoubleValue(v6, @"ctrWithTwoAutofavorited", v72);
    [v7 ctrWithTwoAutofavorited];
    if (v73 >= 0.0) {
      double v74 = v73;
    }
    double v239 = v74;
    [v7 ctrWithTwoSubscribed];
    double v76 = FCAppConfigurationDoubleValue(v6, @"ctrWithTwoSubscribed", v75);
    [v7 ctrWithTwoSubscribed];
    if (v76 >= 0.0) {
      double v77 = v76;
    }
    double v238 = v77;
    [v7 ctrWithZeroAutofavorited];
    double v79 = FCAppConfigurationDoubleValue(v6, @"ctrWithZeroAutofavorited", v78);
    [v7 ctrWithZeroAutofavorited];
    if (v79 >= 0.0) {
      double v80 = v79;
    }
    double v237 = v80;
    [v7 ctrWithZeroSubscribed];
    double v82 = FCAppConfigurationDoubleValue(v6, @"ctrWithZeroSubscribed", v81);
    [v7 ctrWithZeroSubscribed];
    if (v82 >= 0.0) {
      double v83 = v82;
    }
    double v236 = v83;
    [v7 decayFactor];
    double v85 = FCAppConfigurationDoubleValue(v6, @"decayFactor", v84);
    [v7 decayFactor];
    if (v85 < 1.0 && v85 >= 0.0) {
      double v86 = v85;
    }
    double v235 = v86;
    [v7 featuredMultiplierForFreeUsers];
    double v234 = FCAppConfigurationDoubleValue(v6, @"featuredMultiplierForAUsers", v88);
    [v7 featuredMultiplierForTrialUsers];
    double v233 = FCAppConfigurationDoubleValue(v6, @"featuredMultiplierForBUsers", v89);
    [v7 featuredMultiplierForPaidUsers];
    double v232 = FCAppConfigurationDoubleValue(v6, @"featuredMultiplierForCUsers", v90);
    [v7 evergreenMultiplierForFreeUsers];
    double v231 = FCAppConfigurationDoubleValue(v6, @"evergreenMultiplierForAUsers", v91);
    [v7 evergreenMultiplierForTrialUsers];
    double v230 = FCAppConfigurationDoubleValue(v6, @"evergreenMultiplierForBUsers", v92);
    [v7 evergreenMultiplierForPaidUsers];
    double v229 = FCAppConfigurationDoubleValue(v6, @"evergreenMultiplierForCUsers", v93);
    [v7 globalScoreCoefficientFree];
    double v95 = FCAppConfigurationDoubleValue(v6, @"globalScoreCoefficientFree", v94);
    [v7 globalScoreCoefficientFree];
    if (v95 <= 1.0 && v95 >= 0.0) {
      double v96 = v95;
    }
    double v228 = v96;
    [v7 globalScoreCoefficientPaid];
    double v99 = FCAppConfigurationDoubleValue(v6, @"globalScoreCoefficientPaid", v98);
    [v7 globalScoreCoefficientPaid];
    if (v99 <= 1.0 && v99 >= 0.0) {
      double v100 = v99;
    }
    double v227 = v100;
    [v7 globalScoreCoefficientHalfLife];
    double v103 = FCAppConfigurationDoubleValue(v6, @"globalScoreCoefficientHalfLife", v102);
    [v7 globalScoreCoefficientHalfLife];
    if (v103 > 0.0) {
      double v104 = v103;
    }
    double v226 = v104;
    [v7 globalScoreCoefficientInitialMultiplier];
    double v225 = FCAppConfigurationDoubleValue(v6, @"globalScoreCoefficientInitialMultiplier", v105);
    [v7 globalScoreDemocratizationFactor];
    double v107 = FCAppConfigurationDoubleValue(v6, @"globalScoreDemocratizationFactor", v106);
    [v7 globalScoreDemocratizationFactor];
    if (v107 <= 1.0 && v107 >= 0.0) {
      double v108 = v107;
    }
    double v224 = v108;
    [v7 localScoreDemocratizationFactor];
    double v111 = FCAppConfigurationDoubleValue(v6, @"localScoreDemocratizationFactor", v110);
    [v7 localScoreDemocratizationFactor];
    if (v111 <= 1.0 && v111 >= 0.0) {
      double v112 = v111;
    }
    double v223 = v112;
    [v7 conversionScoreDemocratizationFactor];
    double v115 = FCAppConfigurationDoubleValue(v6, @"conversionScoreDemocratizationFactor", v114);
    [v7 conversionScoreDemocratizationFactor];
    if (v115 <= 1.0 && v115 >= 0.0) {
      double v116 = v115;
    }
    double v222 = v116;
    [v7 headlineSeenPenalty];
    double v119 = FCAppConfigurationDoubleValue(v6, @"headlineSeenPenalty", v118);
    [v7 headlineSeenPenalty];
    if (v119 <= 1.0 && v119 >= 0.0) {
      double v120 = v119;
    }
    double v220 = v120;
    [v7 halfLifeCoefficient];
    double v123 = FCAppConfigurationDoubleValue(v6, @"halfLifeCoefficient", v122);
    [v7 halfLifeCoefficient];
    if (v123 >= 0.0) {
      double v124 = v123;
    }
    double v219 = v124;
    [v7 userFeedbackHalfLifeCoefficient];
    double v126 = FCAppConfigurationDoubleValue(v6, @"userFeedbackHalfLifeCoefficient", v125);
    [v7 userFeedbackHalfLifeCoefficient];
    if (v126 > 0.0) {
      double v127 = v126;
    }
    double v218 = v127;
    [v7 evergreenHalfLifeCoefficient];
    double v129 = FCAppConfigurationDoubleValue(v6, @"evergreenHalfLifeCoefficient", v128);
    [v7 evergreenHalfLifeCoefficient];
    if (v129 > 0.0) {
      double v130 = v129;
    }
    double v217 = v130;
    unsigned int v221 = FCAppConfigurationBoolValue(v6, @"respectHalfLifeOverride", [v7 respectHalfLifeOverride]);
    [v7 mutedVoteCoefficient];
    double v132 = FCAppConfigurationDoubleValue(v6, @"mutedVoteCoefficient", v131);
    [v7 mutedVoteCoefficient];
    if (v132 <= 1.0 && v132 >= 0.0) {
      double v133 = v132;
    }
    double v215 = v133;
    [v7 personalizationCoefficient];
    double v136 = FCAppConfigurationDoubleValue(v6, @"personalizationCoefficient", v135);
    [v7 personalizationCoefficient];
    if (v136 <= 1.0 && v136 >= 0.0) {
      double v137 = v136;
    }
    double v214 = v137;
    [v7 publisherAggregateWeight];
    double v140 = FCAppConfigurationDoubleValue(v6, @"publisherAggregateWeight", v139);
    [v7 publisherAggregateWeight];
    if (v140 >= 0.0) {
      double v141 = v140;
    }
    double v213 = v141;
    [v7 sparseTagsPenalty];
    double v143 = FCAppConfigurationDoubleValue(v6, @"sparseTagsPenalty", v142);
    [v7 sparseTagsPenalty];
    if (v143 <= 1.0 && v143 >= 0.0) {
      double v144 = v143;
    }
    double v212 = v144;
    [v7 subscribedChannelScoreCoefficient];
    double v147 = FCAppConfigurationDoubleValue(v6, @"subscribedChannelScoreCoefficient", v146);
    [v7 subscribedChannelScoreCoefficient];
    if (v147 <= 1.0 && v147 >= 0.0) {
      double v148 = v147;
    }
    double v211 = v148;
    [v7 subscribedTopicsScoreCoefficient];
    double v151 = FCAppConfigurationDoubleValue(v6, @"subscribedTopicsScoreCoefficient", v150);
    [v7 subscribedTopicsScoreCoefficient];
    if (v151 <= 1.0 && v151 >= 0.0) {
      double v152 = v151;
    }
    double v210 = v152;
    v154 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"userCohort", 0);
    if (v154)
    {
      v155 = [FCPersonalizationCohortConfig alloc];
      v216 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"userCohort", 0);
      v156 = -[FCPersonalizationCohortConfig initWithConfigDictionary:](v155, "initWithConfigDictionary:");
    }
    else
    {
      v156 = [v7 userCohort];
      v216 = v156;
    }
    [v7 lowFlowBoostFetchCountWeight];
    double v158 = FCAppConfigurationDoubleValue(v6, @"lowFlowBoostFetchCountWeight", v157);
    [v7 lowFlowBoostFetchCountWeight];
    if (v158 <= 1.0 && v158 >= 0.0) {
      double v159 = v158;
    }
    double v209 = v159;
    [v7 lowFlowBoostFactor];
    double v162 = FCAppConfigurationDoubleValue(v6, @"lowFlowBoostFactor", v161);
    [v7 lowFlowBoostFactor];
    if (v162 >= 0.0) {
      double v163 = v162;
    }
    double v208 = v163;
    [v7 lowFlowBoostMaxProductFactor];
    FCAppConfigurationDoubleValue(v6, @"lowFlowBoostMaxProductFactor", v164);
    [v7 lowFlowBoostMaxProductFactor];
    v165 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"lowFlowBoostFetchEstimationConfig", 0);
    if (v165)
    {
      v166 = [FCPersonalizationLowFlowEstimationConfig alloc];
      v167 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"lowFlowBoostFetchEstimationConfig", 0);
      uint64_t v168 = [(FCPersonalizationLowFlowEstimationConfig *)v166 initWithConfigDictionary:v167];
    }
    else
    {
      uint64_t v168 = [v7 lowFlowBoostFetchEstimationConfig];
      v167 = (void *)v168;
    }
    v269 = (void *)v168;
    v169 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"lowFlowBoostEventEstimationConfig", 0);
    v248 = (void *)v55;
    if (v169)
    {
      v170 = [FCPersonalizationLowFlowEstimationConfig alloc];
      uint64_t v206 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"lowFlowBoostEventEstimationConfig", 0);
      v171 = -[FCPersonalizationLowFlowEstimationConfig initWithConfigDictionary:](v170, "initWithConfigDictionary:");
    }
    else
    {
      v171 = [v7 lowFlowBoostEventEstimationConfig];
    }
    unsigned int v207 = FCAppConfigurationBoolValue(v6, @"nicheContentBoostOnlyAboveBaselineMembership", [v7 nicheContentBoostOnlyAboveBaselineMembership]);
    [v7 nicheContentBaselineMembershipMultiplier];
    FCAppConfigurationDoubleValue(v6, @"nicheContentBaselineMembershipMultiplier", v172);
    FCAppConfigurationBoolValue(v6, @"nicheContentManagedTopicBoostAllTags", [v7 nicheContentManagedTopicBoostAllTags]);
    [v7 nicheContentDefaultFlowRate];
    FCAppConfigurationDoubleValue(v6, @"nicheContentDefaultFlowRate", v173);
    [v7 nicheContentDefaultFlowRate];
    [v7 nicheContentDefaultSubscriptionRate];
    FCAppConfigurationDoubleValue(v6, @"nicheContentDefaultSubscriptionRate", v174);
    [v7 nicheContentDefaultSubscriptionRate];
    FCAppConfigurationBoolValue(v6, @"nicheContentExcludeNonGroupableTopics", [v7 nicheContentExcludeNonGroupableTopics]);
    FCAppConfigurationBoolValue(v6, @"nicheContentShouldBoostPublisher", [v7 nicheContentShouldBoostPublisher]);
    [v7 nicheContentTopicFlowExponent];
    FCAppConfigurationDoubleValue(v6, @"nicheContentTopicFlowExponent", v175);
    [v7 nicheContentTopicFlowExponent];
    [v7 nicheContentPublisherFlowExponent];
    FCAppConfigurationDoubleValue(v6, @"nicheContentPublisherFlowExponent", v176);
    [v7 nicheContentPublisherFlowExponent];
    [v7 nicheContentManagedTopicBoost];
    FCAppConfigurationDoubleValue(v6, @"nicheContentManagedTopicBoost", v177);
    [v7 nicheContentManagedTopicBoost];
    [v7 nicheContentServerFlowWeight];
    FCAppConfigurationDoubleValue(v6, @"nicheContentServerFlowWeight", v178);
    [v7 nicheContentServerFlowWeight];
    [v7 nicheContentTopicSubscriptionExponent];
    FCAppConfigurationDoubleValue(v6, @"nicheContentTopicSubscriptionExponent", v179);
    [v7 nicheContentTopicSubscriptionExponent];
    [v7 nicheContentPublisherSubscriptionExponent];
    FCAppConfigurationDoubleValue(v6, @"nicheContentPublisherSubscriptionExponent", v180);
    [v7 nicheContentPublisherSubscriptionExponent];
    [v7 nicheContentQualityThreshold];
    FCAppConfigurationDoubleValue(v6, @"nicheContentQualityThreshold", v181);
    [v7 nicheContentQualityThreshold];
    FCAppConfigurationIntegerValue(v6, @"contentTriggerMaxEventCount", [v7 contentTriggerMaxEventCount]);
    [v7 contentTriggerMaxEventCount];
    [v7 contentTriggerScoreExponent];
    FCAppConfigurationDoubleValue(v6, @"contentTriggerScoreExponent", v182);
    [v7 contentTriggerScoreExponent];
    [v7 contentTriggerTagWeightExponent];
    FCAppConfigurationDoubleValue(v6, @"contentTriggerTagWeightExponent", v183);
    [v7 contentTriggerTagWeightExponent];
    [v7 contentTriggerMinScoreWeight];
    FCAppConfigurationDoubleValue(v6, @"contentTriggerMinScoreWeight", v184);
    [v7 contentTriggerMinScoreWeight];
    [v7 contentTriggerMaxDampener];
    FCAppConfigurationDoubleValue(v6, @"contentTriggerMaxDampener", v185);
    [v7 contentTriggerMaxDampener];
    [v7 contentTriggerDampenerCoefficient];
    FCAppConfigurationDoubleValue(v6, @"contentTriggerDampenerCoefficient", v186);
    [v7 contentTriggerDampenerCoefficient];
    [v7 personalizedMultiplierBaselineMembership];
    FCAppConfigurationDoubleValue(v6, @"personalizedMultiplierBaselineMembership", v187);
    [v7 personalizedMultiplierBaselineMembership];
    [v7 personalizedMultiplierPreBaselineCurvature];
    FCAppConfigurationDoubleValue(v6, @"personalizedMultiplierPreBaselineCurvature", v188);
    [v7 personalizedMultiplierPreBaselineCurvature];
    [v7 personalizedMultiplierPostBaselineCurvature];
    FCAppConfigurationDoubleValue(v6, @"personalizedMultiplierPostBaselineCurvature", v189);
    [v7 personalizedMultiplierPostBaselineCurvature];
    [v7 personalizedMultiplierMembershipDampener];
    FCAppConfigurationDoubleValue(v6, @"personalizedMultiplierMembershipDampener", v190);
    [v7 personalizedMultiplierMembershipDampener];
    [v7 publisherDampenerWeight];
    FCAppConfigurationDoubleValue(v6, @"publisherDampenerWeight", v191);
    [v7 publisherDampenerWeight];
    [v7 recentlyFollowedDurationThreshold];
    FCAppConfigurationDoubleValue(v6, @"recentlyFollowedDurationThreshold", v192);
    [v7 recentlyFollowedDurationThreshold];
    [v7 recentlyFollowedMultiplier];
    FCAppConfigurationDoubleValue(v6, @"recentlyFollowedMultiplier", v193);
    [v7 recentlyFollowedMultiplier];
    [v7 tabiScoreCoefficient];
    FCAppConfigurationDoubleValue(v6, @"tabiScoreCoefficient", v194);
    [v7 tabiScoreCoefficient];
    [v7 clientSideEngagementBoostFeaturedArticleMultiplier];
    FCAppConfigurationDoubleValue(v6, @"clientSideEngagementBoostFeaturedArticleMultiplier", v195);
    [v7 clientSideEngagementBoostFeaturedArticleMultiplier];
    [v7 clientSideEngagementBoostFeatureCandidateArticleMultiplier];
    FCAppConfigurationDoubleValue(v6, @"clientSideEngagementBoostFeatureCandidateArticleMultiplier", v196);
    [v7 clientSideEngagementBoostFeatureCandidateArticleMultiplier];
    [v7 clientSideEngagementBoostFreeCohortCTRCap];
    FCAppConfigurationDoubleValue(v6, @"clientSideEngagementBoostFreeCohortCTRCap", v197);
    [v7 clientSideEngagementBoostFreeCohortCTRCap];
    [v7 clientSideEngagementBoostPaidCohortCTRCap];
    FCAppConfigurationDoubleValue(v6, @"clientSideEngagementBoostPaidCohortCTRCap", v198);
    [v7 clientSideEngagementBoostPaidCohortCTRCap];
    [v7 clientSideEngagementBoostTagQualityMultiplier];
    FCAppConfigurationDoubleValue(v6, @"clientSideEngagementBoostTagQualityMultiplier", v199);
    [v7 clientSideEngagementBoostTagQualityMultiplier];
    [v7 clientSideEngagementBoostReduceVisibilityMultiplier];
    FCAppConfigurationDoubleValue(v6, @"clientSideEngagementBoostReduceVisibilityMultiplier", v200);
    [v7 clientSideEngagementBoostReduceVisibilityMultiplier];
    [v7 clientSideEngagementBoostANFMutiplier];
    FCAppConfigurationDoubleValue(v6, @"clientSideEngagementBoostANFMutiplier", v201);
    [v7 clientSideEngagementBoostANFMutiplier];
    FCAppConfigurationBoolValue(v6, @"dampenerEnabled", [v7 dampenerEnabled]);
    FCAppConfigurationBoolValue(v6, @"multiplierEnabled", [v7 multiplierEnabled]);
    [v7 peopleAlsoReadBaselineScore];
    FCAppConfigurationDoubleValue(v6, @"peopleAlsoReadBaselineScore", v202);
    [v7 peopleAlsoReadBaselineScore];
    [v7 peopleAlsoReadConditionalScoreCoefficient];
    FCAppConfigurationDoubleValue(v6, @"peopleAlsoReadConditionalScoreCoefficient", v203);
    [v7 peopleAlsoReadConditionalScoreCoefficient];
    [v7 peopleAlsoReadScoreCoefficient];
    FCAppConfigurationDoubleValue(v6, @"peopleAlsoReadScoreCoefficient", v204);
    [v7 peopleAlsoReadScoreCoefficient];
    v56 = objc_retain(-[FCPersonalizationScoringConfig initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQualityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:dampenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlsoReadScoreCoefficient:](v268, "initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTop"
              "icBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroup"
              "ableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponen"
              "t:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheCo"
              "ntentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTrigger"
              "ScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:conte"
              "ntTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCur"
              "vature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampe"
              "nerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEnga"
              "gementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSide"
              "EngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQual"
              "ityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:da"
              "mpenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peop"
              "leAlsoReadScoreCoefficient:",
              v55,
              v221,
              v156,
              v269,
              v171,
              v207,
              v267,
              v266,
              v265,
              v264,
              v263,
              v262,
              v261,
              v260,
              *(void *)&v259,
              *(void *)&v258,
              *(void *)&v257,
              *(void *)&v256,
              *(void *)&v255,
              *(void *)&v254,
              *(void *)&v252,
              *(void *)&v251,
              *(void *)&v249,
              *(void *)&v247,
              *(void *)&v246,
              *(void *)&v245,
              *(void *)&v244,
              *(void *)&v243,
              *(void *)&v242,
              *(void *)&v241,
              *(void *)&v240,
              *(void *)&v239,
              *(void *)&v238,
              *(void *)&v237,
              *(void *)&v236,
              *(void *)&v235,
              *(void *)&v234,
              *(void *)&v233,
              *(void *)&v232,
              *(void *)&v231,
              *(void *)&v230,
              *(void *)&v229,
              *(void *)&v228,
              *(void *)&v227,
              *(void *)&v226,
              *(void *)&v225,
              *(void *)&v224,
              *(void *)&v223,
              *(void *)&v222,
              *(void *)&v220,
              *(void *)&v219,
              *(void *)&v218,
              *(void *)&v217,
              *(void *)&v215,
              *(void *)&v214,
              *(void *)&v213,
              *(void *)&v212,
              *(void *)&v211,
              *(void *)&v210,
              *(void *)&v209,
              *(void *)&v208));
    if (v169)
    {

      v171 = (FCPersonalizationLowFlowEstimationConfig *)v206;
    }

    if (v165) {
    if (v154)
    }

    if (v253) {
  }
    }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (double)decayFactor
{
  return self->_decayFactor;
}

- (double)userFeedbackHalfLifeCoefficient
{
  return self->_userFeedbackHalfLifeCoefficient;
}

- (double)tabiScoreCoefficient
{
  return self->_tabiScoreCoefficient;
}

- (double)subscribedTopicsScoreCoefficient
{
  return self->_subscribedTopicsScoreCoefficient;
}

- (double)subscribedChannelScoreCoefficient
{
  return self->_subscribedChannelScoreCoefficient;
}

- (double)sparseTagsPenalty
{
  return self->_sparseTagsPenalty;
}

- (double)recentlyFollowedMultiplier
{
  return self->_recentlyFollowedMultiplier;
}

- (double)recentlyFollowedDurationThreshold
{
  return self->_recentlyFollowedDurationThreshold;
}

- (double)publisherDampenerWeight
{
  return self->_publisherDampenerWeight;
}

- (double)publisherAggregateWeight
{
  return self->_publisherAggregateWeight;
}

- (double)personalizedMultiplierPreBaselineCurvature
{
  return self->_personalizedMultiplierPreBaselineCurvature;
}

- (double)personalizedMultiplierPostBaselineCurvature
{
  return self->_personalizedMultiplierPostBaselineCurvature;
}

- (double)personalizedMultiplierMembershipDampener
{
  return self->_personalizedMultiplierMembershipDampener;
}

- (double)personalizedMultiplierBaselineMembership
{
  return self->_personalizedMultiplierBaselineMembership;
}

- (double)personalizationCoefficient
{
  return self->_personalizationCoefficient;
}

- (double)peopleAlsoReadScoreCoefficient
{
  return self->_peopleAlsoReadScoreCoefficient;
}

- (double)peopleAlsoReadConditionalScoreCoefficient
{
  return self->_peopleAlsoReadConditionalScoreCoefficient;
}

- (double)peopleAlsoReadBaselineScore
{
  return self->_peopleAlsoReadBaselineScore;
}

- (double)nicheContentTopicSubscriptionExponent
{
  return self->_nicheContentTopicSubscriptionExponent;
}

- (double)nicheContentTopicFlowExponent
{
  return self->_nicheContentTopicFlowExponent;
}

- (double)nicheContentServerFlowWeight
{
  return self->_nicheContentServerFlowWeight;
}

- (double)nicheContentQualityThreshold
{
  return self->_nicheContentQualityThreshold;
}

- (double)nicheContentPublisherSubscriptionExponent
{
  return self->_nicheContentPublisherSubscriptionExponent;
}

- (double)nicheContentPublisherFlowExponent
{
  return self->_nicheContentPublisherFlowExponent;
}

- (double)nicheContentManagedTopicBoost
{
  return self->_nicheContentManagedTopicBoost;
}

- (double)nicheContentDefaultSubscriptionRate
{
  return self->_nicheContentDefaultSubscriptionRate;
}

- (double)nicheContentDefaultFlowRate
{
  return self->_nicheContentDefaultFlowRate;
}

- (double)mutedVoteCoefficient
{
  return self->_mutedVoteCoefficient;
}

- (double)lowFlowBoostMaxProductFactor
{
  return self->_lowFlowBoostMaxProductFactor;
}

- (double)lowFlowBoostFetchCountWeight
{
  return self->_lowFlowBoostFetchCountWeight;
}

- (double)lowFlowBoostFactor
{
  return self->_lowFlowBoostFactor;
}

- (double)localScoreDemocratizationFactor
{
  return self->_localScoreDemocratizationFactor;
}

- (double)headlineSeenPenalty
{
  return self->_headlineSeenPenalty;
}

- (double)halfLifeCoefficient
{
  return self->_halfLifeCoefficient;
}

- (double)globalScoreDemocratizationFactor
{
  return self->_globalScoreDemocratizationFactor;
}

- (double)globalScoreCoefficientPaid
{
  return self->_globalScoreCoefficientPaid;
}

- (double)globalScoreCoefficientHalfLife
{
  return self->_globalScoreCoefficientHalfLife;
}

- (double)globalScoreCoefficientFree
{
  return self->_globalScoreCoefficientFree;
}

- (double)evergreenHalfLifeCoefficient
{
  return self->_evergreenHalfLifeCoefficient;
}

- (double)ctrWithZeroSubscribed
{
  return self->_ctrWithZeroSubscribed;
}

- (double)ctrWithZeroAutofavorited
{
  return self->_ctrWithZeroAutofavorited;
}

- (double)ctrWithTwoSubscribed
{
  return self->_ctrWithTwoSubscribed;
}

- (double)ctrWithTwoAutofavorited
{
  return self->_ctrWithTwoAutofavorited;
}

- (double)ctrWithThreeSubscribed
{
  return self->_ctrWithThreeSubscribed;
}

- (double)ctrWithThreeAutofavorited
{
  return self->_ctrWithThreeAutofavorited;
}

- (double)ctrWithSubscribedChannel
{
  return self->_ctrWithSubscribedChannel;
}

- (double)ctrWithOneSubscribed
{
  return self->_ctrWithOneSubscribed;
}

- (double)ctrWithOneAutofavorited
{
  return self->_ctrWithOneAutofavorited;
}

- (double)conversionScoreDemocratizationFactor
{
  return self->_conversionScoreDemocratizationFactor;
}

- (double)conversionCoefficientForTrialUsers
{
  return self->_conversionCoefficientForTrialUsers;
}

- (double)conversionCoefficientForPaidUsers
{
  return self->_conversionCoefficientForPaidUsers;
}

- (double)conversionCoefficientForFreeUsers
{
  return self->_conversionCoefficientForFreeUsers;
}

- (double)contentTriggerTagWeightExponent
{
  return self->_contentTriggerTagWeightExponent;
}

- (double)contentTriggerScoreExponent
{
  return self->_contentTriggerScoreExponent;
}

- (double)contentTriggerMinScoreWeight
{
  return self->_contentTriggerMinScoreWeight;
}

- (int64_t)contentTriggerMaxEventCount
{
  return self->_contentTriggerMaxEventCount;
}

- (double)contentTriggerMaxDampener
{
  return self->_contentTriggerMaxDampener;
}

- (double)contentTriggerDampenerCoefficient
{
  return self->_contentTriggerDampenerCoefficient;
}

- (double)clientSideEngagementBoostTagQualityMultiplier
{
  return self->_clientSideEngagementBoostTagQualityMultiplier;
}

- (double)clientSideEngagementBoostReduceVisibilityMultiplier
{
  return self->_clientSideEngagementBoostReduceVisibilityMultiplier;
}

- (double)clientSideEngagementBoostPaidCohortCTRCap
{
  return self->_clientSideEngagementBoostPaidCohortCTRCap;
}

- (double)clientSideEngagementBoostFreeCohortCTRCap
{
  return self->_clientSideEngagementBoostFreeCohortCTRCap;
}

- (double)clientSideEngagementBoostFeaturedArticleMultiplier
{
  return self->_clientSideEngagementBoostFeaturedArticleMultiplier;
}

- (double)clientSideEngagementBoostFeatureCandidateArticleMultiplier
{
  return self->_clientSideEngagementBoostFeatureCandidateArticleMultiplier;
}

- (double)clientSideEngagementBoostANFMutiplier
{
  return self->_clientSideEngagementBoostANFMutiplier;
}

- (double)baselineRatePrior
{
  return self->_baselineRatePrior;
}

- (double)autofavoritedVoteCoefficient
{
  return self->_autofavoritedVoteCoefficient;
}

- (double)articleReadPenalty
{
  return self->_articleReadPenalty;
}

- (double)articleListenedPenalty
{
  return self->_articleListenedPenalty;
}

- (double)articleLengthAggregateWeight
{
  return self->_articleLengthAggregateWeight;
}

- (double)articleEmbeddingScoreDampenerWeight
{
  return self->_articleEmbeddingScoreDampenerWeight;
}

- (double)articleEmbeddingScoreCoefficient
{
  return self->_articleEmbeddingScoreCoefficient;
}

- (double)anfMultiplier
{
  return self->_anfMultiplier;
}

- (FCPersonalizationScoringConfig)initWithAnfMultiplier:(double)a3 articleEmbeddingScoreCoefficient:(double)a4 articleEmbeddingScoreDampenerWeight:(double)a5 articleLengthAggregateWeight:(double)a6 articleReadPenalty:(double)a7 articleListenedPenalty:(double)a8 audioMultiplierForFreeUsers:(double)a9 audioMultiplierForTrialUsers:(uint64_t)a10 audioMultiplierForPaidUsers:(void *)a11 autofavoritedVoteCoefficient:(BOOL)a12 baselineRatePrior:(void *)a13 bundleFreeMultiplierForFreeUsers:(void *)a14 bundleFreeMultiplierForTrialUsers:(void *)a15 bundleFreeMultiplierForPaidUsers:(BOOL)a16 bundlePaidMultiplierForFreeUsers:(double)a17 bundlePaidMultiplierForTrialUsers:(double)a18 bundlePaidMultiplierForPaidUsers:(double)a19 conversionCoefficientForFreeUsers:(double)a20 conversionCoefficientForTrialUsers:(double)a21 conversionCoefficientForPaidUsers:(double)a22 conversionCohort:(double)a23 ctrWithOneAutofavorited:(double)a24 ctrWithOneSubscribed:(double)a25 ctrWithSubscribedChannel:(double)a26 ctrWithThreeAutofavorited:(double)a27 ctrWithThreeSubscribed:(double)a28 ctrWithTwoAutofavorited:(double)a29 ctrWithTwoSubscribed:(double)a30 ctrWithZeroAutofavorited:(double)a31 ctrWithZeroSubscribed:(double)a32 decayFactor:(double)a33 featuredMultiplierForFreeUsers:(double)a34 featuredMultiplierForTrialUsers:(double)a35 featuredMultiplierForPaidUsers:(double)a36 evergreenMultiplierForFreeUsers:(double)a37 evergreenMultiplierForTrialUsers:(double)a38 evergreenMultiplierForPaidUsers:(double)a39 globalScoreCoefficientFree:(double)a40 globalScoreCoefficientPaid:(double)a41 globalScoreCoefficientHalfLife:(double)a42 globalScoreCoefficientInitialMultiplier:(double)a43 globalScoreDemocratizationFactor:(double)a44 localScoreDemocratizationFactor:(double)a45 conversionScoreDemocratizationFactor:(double)a46 headlineSeenPenalty:(double)a47 halfLifeCoefficient:(double)a48 userFeedbackHalfLifeCoefficient:(double)a49 evergreenHalfLifeCoefficient:(double)a50 respectHalfLifeOverride:(double)a51 mutedVoteCoefficient:(double)a52 personalizationCoefficient:(double)a53 publisherAggregateWeight:(double)a54 sparseTagsPenalty:(double)a55 subscribedChannelScoreCoefficient:(double)a56 subscribedTopicsScoreCoefficient:(double)a57 userCohort:(double)a58 lowFlowBoostFetchCountWeight:(double)a59 lowFlowBoostFactor:(double)a60 lowFlowBoostMaxProductFactor:(double)a61 lowFlowBoostFetchEstimationConfig:(double)a62 lowFlowBoostEventEstimationConfig:(double)a63 nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQualityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:dampenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlsoReadScoreCoefficient:
{
  id v95 = a11;
  id v96 = a13;
  id v97 = a14;
  id v98 = a15;
  v125.receiver = a1;
  v125.super_class = (Class)FCPersonalizationScoringConfig;
  double v99 = [(FCPersonalizationScoringConfig *)&v125 init];
  double v100 = v99;
  if (v99)
  {
    unint64_t v122 = STACK[0x568];
    unint64_t v123 = STACK[0x570];
    unint64_t v121 = STACK[0x560];
    char v119 = STACK[0x558];
    char v120 = STACK[0x559];
    unint64_t v117 = STACK[0x548];
    unint64_t v118 = STACK[0x550];
    unint64_t v115 = STACK[0x538];
    unint64_t v116 = STACK[0x540];
    unint64_t v114 = STACK[0x530];
    unint64_t v113 = STACK[0x528];
    unint64_t v112 = STACK[0x520];
    unint64_t v111 = STACK[0x518];
    unint64_t v110 = STACK[0x510];
    unint64_t v109 = STACK[0x508];
    unint64_t v108 = STACK[0x500];
    unint64_t v107 = STACK[0x4F8];
    unint64_t v106 = STACK[0x4F0];
    unint64_t v105 = STACK[0x4E8];
    unint64_t v104 = STACK[0x4E0];
    unint64_t v103 = STACK[0x4D8];
    unint64_t v102 = STACK[0x4D0];
    v99->_anfMultiplier = a2;
    v99->_articleEmbeddingScoreCoefficient = a3;
    v99->_articleEmbeddingScoreDampenerWeight = a4;
    v99->_articleLengthAggregateWeight = a5;
    v99->_articleReadPenalty = a6;
    v99->_articleListenedPenalty = a7;
    v99->_audioMultiplierForFreeUsers = a8;
    v99->_audioMultiplierForTrialUsers = a9;
    v99->_audioMultiplierForPaidUsers = a17;
    v99->_autofavoritedVoteCoefficient = a18;
    v99->_baselineRatePrior = a19;
    v99->_bundleFreeMultiplierForFreeUsers = a20;
    v99->_bundleFreeMultiplierForTrialUsers = a21;
    v99->_bundleFreeMultiplierForPaidUsers = a22;
    v99->_bundlePaidMultiplierForFreeUsers = a23;
    v99->_bundlePaidMultiplierForTrialUsers = a24;
    v99->_bundlePaidMultiplierForPaidUsers = a25;
    v99->_conversionCoefficientForFreeUsers = a26;
    v99->_conversionCoefficientForTrialUsers = a27;
    v99->_conversionCoefficientForPaidUsers = a28;
    objc_storeStrong((id *)&v99->_conversionCohort, a11);
    v100->_ctrWithOneAutofavorited = a29;
    v100->_ctrWithOneSubscribed = a30;
    v100->_ctrWithSubscribedChannel = a31;
    v100->_ctrWithThreeAutofavorited = a32;
    v100->_ctrWithThreeSubscribed = a33;
    v100->_ctrWithTwoAutofavorited = a34;
    v100->_ctrWithTwoSubscribed = a35;
    v100->_ctrWithZeroAutofavorited = a36;
    v100->_ctrWithZeroSubscribed = a37;
    v100->_decayFactor = a38;
    v100->_featuredMultiplierForFreeUsers = a39;
    v100->_featuredMultiplierForTrialUsers = a40;
    v100->_featuredMultiplierForPaidUsers = a41;
    v100->_evergreenMultiplierForFreeUsers = a42;
    v100->_evergreenMultiplierForTrialUsers = a43;
    v100->_evergreenMultiplierForPaidUsers = a44;
    v100->_globalScoreCoefficientFree = a45;
    v100->_globalScoreCoefficientPaid = a46;
    v100->_globalScoreCoefficientHalfLife = a47;
    v100->_globalScoreCoefficientInitialMultiplier = a48;
    v100->_globalScoreDemocratizationFactor = a49;
    v100->_localScoreDemocratizationFactor = a50;
    v100->_conversionScoreDemocratizationFactor = a51;
    v100->_headlineSeenPenalty = a52;
    v100->_halfLifeCoefficient = a53;
    v100->_respectHalfLifeOverride = a12;
    v100->_evergreenHalfLifeCoefficient = a55;
    v100->_mutedVoteCoefficient = a56;
    v100->_personalizationCoefficient = a57;
    v100->_publisherAggregateWeight = a58;
    v100->_sparseTagsPenalty = a59;
    v100->_subscribedChannelScoreCoefficient = a60;
    v100->_subscribedTopicsScoreCoefficient = a61;
    objc_storeStrong((id *)&v100->_userCohort, a13);
    v100->_userFeedbackHalfLifeCoefficient = a54;
    v100->_lowFlowBoostFetchCountWeight = a62;
    v100->_lowFlowBoostFactor = a63;
    v100->_lowFlowBoostMaxProductFactor = a64;
    objc_storeStrong((id *)&v100->_lowFlowBoostFetchEstimationConfig, a14);
    objc_storeStrong((id *)&v100->_lowFlowBoostEventEstimationConfig, a15);
    v100->_nicheContentBaselineMembershipMultiplier = a65;
    v100->_nicheContentDefaultFlowRate = a67;
    v100->_nicheContentBoostOnlyAboveBaselineMembership = a16;
    v100->_nicheContentManagedTopicBoostAllTags = a66;
    v100->_nicheContentDefaultSubscriptionRate = a68;
    v100->_nicheContentExcludeNonGroupableTopics = a69;
    v100->_nicheContentShouldBoostPublisher = a70;
    v100->_nicheContentTopicFlowExponent = a71;
    v100->_nicheContentPublisherFlowExponent = a72;
    v100->_nicheContentManagedTopicBoost = a73;
    v100->_nicheContentServerFlowWeight = a74;
    v100->_nicheContentTopicSubscriptionExponent = a75;
    v100->_nicheContentPublisherSubscriptionExponent = a76;
    v100->_nicheContentQualityThreshold = a77;
    v100->_contentTriggerMaxEventCount = a78;
    v100->_contentTriggerScoreExponent = a79;
    v100->_contentTriggerTagWeightExponent = a80;
    v100->_contentTriggerMinScoreWeight = a81;
    *(void *)&v100->_contentTriggerMaxDampener = v102;
    *(void *)&v100->_contentTriggerDampenerCoefficient = v103;
    *(void *)&v100->_personalizedMultiplierBaselineMembership = v104;
    *(void *)&v100->_personalizedMultiplierPreBaselineCurvature = v105;
    *(void *)&v100->_personalizedMultiplierPostBaselineCurvature = v106;
    *(void *)&v100->_personalizedMultiplierMembershipDampener = v107;
    *(void *)&v100->_publisherDampenerWeight = v108;
    *(void *)&v100->_recentlyFollowedDurationThreshold = v109;
    *(void *)&v100->_recentlyFollowedMultiplier = v110;
    *(void *)&v100->_tabiScoreCoefficient = v111;
    *(void *)&v100->_clientSideEngagementBoostFeaturedArticleMultiplier = v112;
    *(void *)&v100->_clientSideEngagementBoostFeatureCandidateArticleMultiplier = v113;
    *(void *)&v100->_clientSideEngagementBoostFreeCohortCTRCap = v114;
    *(void *)&v100->_clientSideEngagementBoostPaidCohortCTRCap = v115;
    *(void *)&v100->_clientSideEngagementBoostTagQualityMultiplier = v116;
    *(void *)&v100->_clientSideEngagementBoostReduceVisibilityMultiplier = v117;
    *(void *)&v100->_clientSideEngagementBoostANFMutiplier = v118;
    v100->_dampenerEnabled = v119;
    v100->_multiplierEnabled = v120;
    *(void *)&v100->_peopleAlsoReadBaselineScore = v121;
    *(void *)&v100->_peopleAlsoReadConditionalScoreCoefficient = v122;
    *(void *)&v100->_peopleAlsoReadScoreCoefficient = v123;
  }

  return v100;
}

- (BOOL)respectHalfLifeOverride
{
  return self->_respectHalfLifeOverride;
}

- (BOOL)nicheContentShouldBoostPublisher
{
  return self->_nicheContentShouldBoostPublisher;
}

- (BOOL)nicheContentManagedTopicBoostAllTags
{
  return self->_nicheContentManagedTopicBoostAllTags;
}

- (BOOL)nicheContentExcludeNonGroupableTopics
{
  return self->_nicheContentExcludeNonGroupableTopics;
}

- (BOOL)nicheContentBoostOnlyAboveBaselineMembership
{
  return self->_nicheContentBoostOnlyAboveBaselineMembership;
}

- (double)nicheContentBaselineMembershipMultiplier
{
  return self->_nicheContentBaselineMembershipMultiplier;
}

- (BOOL)multiplierEnabled
{
  return self->_multiplierEnabled;
}

- (double)globalScoreCoefficientInitialMultiplier
{
  return self->_globalScoreCoefficientInitialMultiplier;
}

- (double)featuredMultiplierForTrialUsers
{
  return self->_featuredMultiplierForTrialUsers;
}

- (double)featuredMultiplierForPaidUsers
{
  return self->_featuredMultiplierForPaidUsers;
}

- (double)featuredMultiplierForFreeUsers
{
  return self->_featuredMultiplierForFreeUsers;
}

- (double)evergreenMultiplierForTrialUsers
{
  return self->_evergreenMultiplierForTrialUsers;
}

- (double)evergreenMultiplierForPaidUsers
{
  return self->_evergreenMultiplierForPaidUsers;
}

- (double)evergreenMultiplierForFreeUsers
{
  return self->_evergreenMultiplierForFreeUsers;
}

- (BOOL)dampenerEnabled
{
  return self->_dampenerEnabled;
}

- (double)bundlePaidMultiplierForTrialUsers
{
  return self->_bundlePaidMultiplierForTrialUsers;
}

- (double)bundlePaidMultiplierForPaidUsers
{
  return self->_bundlePaidMultiplierForPaidUsers;
}

- (double)bundlePaidMultiplierForFreeUsers
{
  return self->_bundlePaidMultiplierForFreeUsers;
}

- (double)bundleFreeMultiplierForTrialUsers
{
  return self->_bundleFreeMultiplierForTrialUsers;
}

- (double)bundleFreeMultiplierForPaidUsers
{
  return self->_bundleFreeMultiplierForPaidUsers;
}

- (double)bundleFreeMultiplierForFreeUsers
{
  return self->_bundleFreeMultiplierForFreeUsers;
}

- (double)audioMultiplierForTrialUsers
{
  return self->_audioMultiplierForTrialUsers;
}

- (double)audioMultiplierForPaidUsers
{
  return self->_audioMultiplierForPaidUsers;
}

- (double)audioMultiplierForFreeUsers
{
  return self->_audioMultiplierForFreeUsers;
}

- (FCPersonalizationCohortConfig)userCohort
{
  return self->_userCohort;
}

- (FCPersonalizationLowFlowEstimationConfig)lowFlowBoostFetchEstimationConfig
{
  return self->_lowFlowBoostFetchEstimationConfig;
}

- (FCPersonalizationLowFlowEstimationConfig)lowFlowBoostEventEstimationConfig
{
  return self->_lowFlowBoostEventEstimationConfig;
}

- (FCPersonalizationCohortConfig)conversionCohort
{
  return self->_conversionCohort;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowFlowBoostEventEstimationConfig, 0);
  objc_storeStrong((id *)&self->_lowFlowBoostFetchEstimationConfig, 0);
  objc_storeStrong((id *)&self->_userCohort, 0);
  objc_storeStrong((id *)&self->_conversionCohort, 0);
}

- (FCPersonalizationScoringConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v133.receiver = self;
  v133.super_class = (Class)FCPersonalizationScoringConfig;
  v5 = [(FCPersonalizationScoringConfig *)&v133 init];
  if (v5)
  {
    double v132 = v5;
    double v6 = FCAppConfigurationDoubleValue(v4, @"anfMultiplier", 1.0);
    if (v6 < 0.0) {
      double v6 = 1.0;
    }
    double v131 = v6;
    double v7 = FCAppConfigurationDoubleValue(v4, @"articleEmbeddingScoreCoefficient", 0.0);
    if (v7 < 0.0) {
      double v7 = 0.0;
    }
    double v130 = v7;
    double v8 = FCAppConfigurationDoubleValue(v4, @"articleEmbeddingScoreDampenerWeight", 0.0);
    if (v8 < 0.0) {
      double v8 = 0.0;
    }
    double v129 = v8;
    double v9 = FCAppConfigurationDoubleValue(v4, @"articleLengthAggregateWeight", 1.0);
    if (v9 < 0.0) {
      double v9 = 1.0;
    }
    double v128 = v9;
    double v10 = FCAppConfigurationDoubleValue(v4, @"articleReadPenalty", 0.0);
    if (v10 > 1.0 || v10 < 0.0) {
      double v10 = 0.0;
    }
    double v127 = v10;
    double v12 = FCAppConfigurationDoubleValue(v4, @"articleListenedPenalty", 0.0);
    if (v12 > 1.0 || v12 < 0.0) {
      double v12 = 0.0;
    }
    double v126 = v12;
    double v125 = FCAppConfigurationDoubleValue(v4, @"audioMultiplierForAUsers", 1.1);
    double v124 = FCAppConfigurationDoubleValue(v4, @"audioMultiplierForBUsers", 1.1);
    double v123 = FCAppConfigurationDoubleValue(v4, @"audioMultiplierForCUsers", 1.1);
    double v14 = FCAppConfigurationDoubleValue(v4, @"autofavoritedVoteCoefficient", 0.06);
    if (v14 > 1.0 || v14 < 0.0) {
      double v14 = 0.06;
    }
    double v122 = v14;
    double v16 = FCAppConfigurationDoubleValue(v4, @"baselineRatePrior", 0.0166666667);
    if (v16 < 0.0) {
      double v16 = 0.0166666667;
    }
    double v121 = v16;
    double v120 = FCAppConfigurationDoubleValue(v4, @"bundleFreeMultiplierForAUsers", 1.1);
    double v119 = FCAppConfigurationDoubleValue(v4, @"bundleFreeMultiplierForBUsers", 1.1);
    double v118 = FCAppConfigurationDoubleValue(v4, @"bundleFreeMultiplierForCUsers", 1.1);
    double v117 = FCAppConfigurationDoubleValue(v4, @"bundlePaidMultiplierForAUsers", 1.1);
    double v115 = FCAppConfigurationDoubleValue(v4, @"bundlePaidMultiplierForBUsers", 1.1);
    double v114 = FCAppConfigurationDoubleValue(v4, @"bundlePaidMultiplierForCUsers", 1.1);
    double v17 = FCAppConfigurationDoubleValue(v4, @"conversionCoefficientForFreeUsers", 0.0);
    if (v17 < 0.0) {
      double v17 = 0.0;
    }
    double v113 = v17;
    double v18 = FCAppConfigurationDoubleValue(v4, @"conversionCoefficientForTrialUsers", 0.0);
    if (v18 < 0.0) {
      double v18 = 0.0;
    }
    double v112 = v18;
    double v19 = FCAppConfigurationDoubleValue(v4, @"conversionCoefficientForPaidUsers", 0.0);
    if (v19 < 0.0) {
      double v19 = 0.0;
    }
    double v111 = v19;
    double v20 = [FCPersonalizationCohortConfig alloc];
    unint64_t v116 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"conversionCohort", 0);
    unint64_t v110 = [(FCPersonalizationCohortConfig *)v20 initWithConfigDictionary:v116];
    double v21 = FCAppConfigurationDoubleValue(v4, @"ctrWithOneAutofavorited", 0.004);
    if (v21 < 0.0) {
      double v21 = 0.004;
    }
    double v109 = v21;
    double v22 = FCAppConfigurationDoubleValue(v4, @"ctrWithOneSubscribed", 0.015);
    if (v22 < 0.0) {
      double v22 = 0.015;
    }
    double v108 = v22;
    double v23 = FCAppConfigurationDoubleValue(v4, @"ctrWithSubscribedChannel", 0.02);
    if (v23 < 0.0) {
      double v23 = 0.02;
    }
    double v107 = v23;
    double v24 = FCAppConfigurationDoubleValue(v4, @"ctrWithThreeAutofavorited", 0.012);
    if (v24 < 0.0) {
      double v24 = 0.012;
    }
    double v106 = v24;
    double v25 = FCAppConfigurationDoubleValue(v4, @"ctrWithThreeSubscribed", 0.025);
    if (v25 < 0.0) {
      double v25 = 0.025;
    }
    double v105 = v25;
    double v26 = FCAppConfigurationDoubleValue(v4, @"ctrWithTwoAutofavorited", 0.008);
    if (v26 < 0.0) {
      double v26 = 0.008;
    }
    double v104 = v26;
    double v27 = FCAppConfigurationDoubleValue(v4, @"ctrWithTwoSubscribed", 0.02);
    if (v27 < 0.0) {
      double v27 = 0.02;
    }
    double v103 = v27;
    double v28 = FCAppConfigurationDoubleValue(v4, @"ctrWithZeroAutofavorited", 0.0005);
    if (v28 < 0.0) {
      double v28 = 0.0005;
    }
    double v102 = v28;
    double v29 = FCAppConfigurationDoubleValue(v4, @"ctrWithZeroSubscribed", 0.001);
    if (v29 < 0.0) {
      double v29 = 0.001;
    }
    double v101 = v29;
    double v30 = FCAppConfigurationDoubleValue(v4, @"decayFactor", 0.99);
    if (v30 >= 1.0 || v30 < 0.0) {
      double v30 = 0.99;
    }
    double v100 = v30;
    double v99 = FCAppConfigurationDoubleValue(v4, @"featuredMultiplierForAUsers", 1.1);
    double v98 = FCAppConfigurationDoubleValue(v4, @"featuredMultiplierForBUsers", 1.1);
    double v97 = FCAppConfigurationDoubleValue(v4, @"featuredMultiplierForCUsers", 1.1);
    double v96 = FCAppConfigurationDoubleValue(v4, @"evergreenMultiplierForAUsers", 1.0);
    double v95 = FCAppConfigurationDoubleValue(v4, @"evergreenMultiplierForBUsers", 1.0);
    double v94 = FCAppConfigurationDoubleValue(v4, @"evergreenMultiplierForCUsers", 1.0);
    double v32 = FCAppConfigurationDoubleValue(v4, @"globalScoreCoefficientFree", 0.64);
    if (v32 > 1.0 || v32 < 0.0) {
      double v32 = 0.64;
    }
    double v93 = v32;
    double v34 = FCAppConfigurationDoubleValue(v4, @"globalScoreCoefficientPaid", 0.64);
    if (v34 > 1.0 || v34 < 0.0) {
      double v34 = 0.64;
    }
    double v92 = v34;
    double v36 = FCAppConfigurationDoubleValue(v4, @"globalScoreCoefficientHalfLife", 50.0);
    if (v36 <= 0.0) {
      double v36 = 50.0;
    }
    double v91 = v36;
    double v90 = FCAppConfigurationDoubleValue(v4, @"globalScoreCoefficientInitialMultiplier", 2.0);
    double v37 = FCAppConfigurationDoubleValue(v4, @"globalScoreDemocratizationFactor", 1.0);
    if (v37 > 1.0 || v37 < 0.0) {
      double v37 = 1.0;
    }
    double v88 = v37;
    double v39 = FCAppConfigurationDoubleValue(v4, @"localScoreDemocratizationFactor", 1.0);
    if (v39 > 1.0 || v39 < 0.0) {
      double v39 = 1.0;
    }
    double v87 = v39;
    double v41 = FCAppConfigurationDoubleValue(v4, @"conversionScoreDemocratizationFactor", 1.0);
    if (v41 > 1.0 || v41 < 0.0) {
      double v41 = 1.0;
    }
    double v86 = v41;
    double v43 = FCAppConfigurationDoubleValue(v4, @"headlineSeenPenalty", 0.0);
    if (v43 > 1.0 || v43 < 0.0) {
      double v43 = 0.0;
    }
    double v85 = v43;
    double v45 = FCAppConfigurationDoubleValue(v4, @"halfLifeCoefficient", 1.0);
    if (v45 < 0.0) {
      double v45 = 1.0;
    }
    double v84 = v45;
    double v46 = FCAppConfigurationDoubleValue(v4, @"userFeedbackHalfLifeCoefficient", 0.0);
    if (v46 < 0.0) {
      double v46 = 0.0;
    }
    double v82 = v46;
    double v47 = FCAppConfigurationDoubleValue(v4, @"evergreenHalfLifeCoefficient", 0.0);
    if (v47 < 0.0) {
      double v47 = 0.0;
    }
    double v81 = v47;
    unsigned int v89 = FCAppConfigurationBoolValue(v4, @"respectHalfLifeOverride", 0);
    double v48 = FCAppConfigurationDoubleValue(v4, @"mutedVoteCoefficient", 0.2);
    if (v48 > 1.0 || v48 < 0.0) {
      double v48 = 0.2;
    }
    double v79 = v48;
    double v50 = FCAppConfigurationDoubleValue(v4, @"personalizationCoefficient", 0.14);
    if (v50 > 1.0 || v50 < 0.0) {
      double v50 = 0.14;
    }
    double v78 = v50;
    double v52 = FCAppConfigurationDoubleValue(v4, @"publisherAggregateWeight", 1.0);
    if (v52 < 0.0) {
      double v52 = 1.0;
    }
    double v77 = v52;
    double v53 = FCAppConfigurationDoubleValue(v4, @"sparseTagsPenalty", 0.0);
    if (v53 > 1.0 || v53 < 0.0) {
      double v53 = 0.0;
    }
    double v76 = v53;
    double v55 = FCAppConfigurationDoubleValue(v4, @"subscribedChannelScoreCoefficient", 0.0);
    if (v55 > 1.0 || v55 < 0.0) {
      double v55 = 0.0;
    }
    double v75 = v55;
    double v57 = FCAppConfigurationDoubleValue(v4, @"subscribedTopicsScoreCoefficient", 0.0);
    if (v57 > 1.0 || v57 < 0.0) {
      double v57 = 0.0;
    }
    double v74 = v57;
    double v59 = [FCPersonalizationCohortConfig alloc];
    double v83 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"userCohort", 0);
    double v80 = [(FCPersonalizationCohortConfig *)v59 initWithConfigDictionary:v83];
    double v60 = FCAppConfigurationDoubleValue(v4, @"lowFlowBoostFetchCountWeight", 0.5);
    if (v60 > 1.0 || v60 < 0.0) {
      double v60 = 0.5;
    }
    double v72 = v60;
    double v62 = FCAppConfigurationDoubleValue(v4, @"lowFlowBoostFactor", 0.0);
    if (v62 < 0.0) {
      double v62 = 0.0;
    }
    double v71 = v62;
    FCAppConfigurationDoubleValue(v4, @"lowFlowBoostMaxProductFactor", 0.1);
    double v63 = [FCPersonalizationLowFlowEstimationConfig alloc];
    double v64 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"lowFlowBoostFetchEstimationConfig", 0);
    double v65 = [(FCPersonalizationLowFlowEstimationConfig *)v63 initWithConfigDictionary:v64];
    double v66 = [FCPersonalizationLowFlowEstimationConfig alloc];
    double v67 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"lowFlowBoostEventEstimationConfig", 0);
    double v68 = [(FCPersonalizationLowFlowEstimationConfig *)v66 initWithConfigDictionary:v67];
    unsigned int v73 = FCAppConfigurationBoolValue(v4, @"nicheContentBoostOnlyAboveBaselineMembership", 1);
    FCAppConfigurationDoubleValue(v4, @"nicheContentBaselineMembershipMultiplier", 1.0);
    FCAppConfigurationBoolValue(v4, @"nicheContentManagedTopicBoostAllTags", 0);
    FCAppConfigurationDoubleValue(v4, @"nicheContentDefaultFlowRate", 0.0);
    FCAppConfigurationDoubleValue(v4, @"nicheContentDefaultSubscriptionRate", 0.0);
    FCAppConfigurationBoolValue(v4, @"nicheContentExcludeNonGroupableTopics", 1);
    FCAppConfigurationBoolValue(v4, @"nicheContentShouldBoostPublisher", 1);
    FCAppConfigurationDoubleValue(v4, @"nicheContentTopicFlowExponent", 2.0);
    FCAppConfigurationDoubleValue(v4, @"nicheContentPublisherFlowExponent", 2.0);
    FCAppConfigurationDoubleValue(v4, @"nicheContentManagedTopicBoost", 0.0);
    FCAppConfigurationDoubleValue(v4, @"nicheContentServerFlowWeight", 0.0);
    FCAppConfigurationDoubleValue(v4, @"nicheContentTopicSubscriptionExponent", 1.0);
    FCAppConfigurationDoubleValue(v4, @"nicheContentPublisherSubscriptionExponent", 1.0);
    FCAppConfigurationDoubleValue(v4, @"nicheContentQualityThreshold", 0.06);
    FCAppConfigurationIntegerValue(v4, @"contentTriggerMaxEventCount", 50);
    FCAppConfigurationDoubleValue(v4, @"contentTriggerScoreExponent", 1.0);
    FCAppConfigurationDoubleValue(v4, @"contentTriggerTagWeightExponent", 0.0);
    FCAppConfigurationDoubleValue(v4, @"contentTriggerMinScoreWeight", 1.0);
    FCAppConfigurationDoubleValue(v4, @"contentTriggerMaxDampener", 1.0);
    FCAppConfigurationDoubleValue(v4, @"contentTriggerDampenerCoefficient", 0.0);
    FCAppConfigurationDoubleValue(v4, @"personalizedMultiplierBaselineMembership", 0.2);
    FCAppConfigurationDoubleValue(v4, @"personalizedMultiplierPreBaselineCurvature", 2.0);
    FCAppConfigurationDoubleValue(v4, @"personalizedMultiplierPostBaselineCurvature", 2.0);
    FCAppConfigurationDoubleValue(v4, @"personalizedMultiplierMembershipDampener", 0.0);
    FCAppConfigurationDoubleValue(v4, @"publisherDampenerWeight", 0.0);
    FCAppConfigurationDoubleValue(v4, @"recentlyFollowedDurationThreshold", 43200.0);
    FCAppConfigurationDoubleValue(v4, @"recentlyFollowedMultiplier", 1.0);
    FCAppConfigurationDoubleValue(v4, @"tabiScoreCoefficient", 0.0);
    FCAppConfigurationDoubleValue(v4, @"clientSideEngagementBoostFeaturedArticleMultiplier", 1.1);
    FCAppConfigurationDoubleValue(v4, @"clientSideEngagementBoostFeatureCandidateArticleMultiplier", 1.1);
    FCAppConfigurationDoubleValue(v4, @"clientSideEngagementBoostFreeCohortCTRCap", 0.75);
    FCAppConfigurationDoubleValue(v4, @"clientSideEngagementBoostPaidCohortCTRCap", 0.5);
    FCAppConfigurationDoubleValue(v4, @"clientSideEngagementBoostTagQualityMultiplier", 1.0);
    FCAppConfigurationDoubleValue(v4, @"clientSideEngagementBoostReduceVisibilityMultiplier", 0.1);
    FCAppConfigurationDoubleValue(v4, @"clientSideEngagementBoostANFMutiplier", 1.5);
    FCAppConfigurationBoolValue(v4, @"dampenerEnabled", 1);
    FCAppConfigurationBoolValue(v4, @"multiplierEnabled", 1);
    FCAppConfigurationDoubleValue(v4, @"peopleAlsoReadBaselineScore", 0.0);
    FCAppConfigurationDoubleValue(v4, @"peopleAlsoReadConditionalScoreCoefficient", 0.0);
    FCAppConfigurationDoubleValue(v4, @"peopleAlsoReadScoreCoefficient", 0.0);
    double v69 = objc_retain(-[FCPersonalizationScoringConfig initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQualityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:dampenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlsoReadScoreCoefficient:](v132, "initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTop"
              "icBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroup"
              "ableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponen"
              "t:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheCo"
              "ntentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTrigger"
              "ScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:conte"
              "ntTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCur"
              "vature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampe"
              "nerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEnga"
              "gementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSide"
              "EngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQual"
              "ityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:da"
              "mpenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peop"
              "leAlsoReadScoreCoefficient:",
              v110,
              v89,
              v80,
              v65,
              v68,
              v73,
              v131,
              v130,
              v129,
              v128,
              v127,
              v126,
              v125,
              v124,
              *(void *)&v123,
              *(void *)&v122,
              *(void *)&v121,
              *(void *)&v120,
              *(void *)&v119,
              *(void *)&v118,
              *(void *)&v117,
              *(void *)&v115,
              *(void *)&v114,
              *(void *)&v113,
              *(void *)&v112,
              *(void *)&v111,
              *(void *)&v109,
              *(void *)&v108,
              *(void *)&v107,
              *(void *)&v106,
              *(void *)&v105,
              *(void *)&v104,
              *(void *)&v103,
              *(void *)&v102,
              *(void *)&v101,
              *(void *)&v100,
              *(void *)&v99,
              *(void *)&v98,
              *(void *)&v97,
              *(void *)&v96,
              *(void *)&v95,
              *(void *)&v94,
              *(void *)&v93,
              *(void *)&v92,
              *(void *)&v91,
              *(void *)&v90,
              *(void *)&v88,
              *(void *)&v87,
              *(void *)&v86,
              *(void *)&v85,
              *(void *)&v84,
              *(void *)&v82,
              *(void *)&v81,
              *(void *)&v79,
              *(void *)&v78,
              *(void *)&v77,
              *(void *)&v76,
              *(void *)&v75,
              *(void *)&v74,
              *(void *)&v72,
              *(void *)&v71));
  }
  else
  {
    double v69 = 0;
  }

  return v69;
}

- (FCPersonalizationScoringConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    double v8 = "-[FCPersonalizationScoringConfig init]";
    __int16 v9 = 2080;
    double v10 = "FCPersonalizationScoringConfig.m";
    __int16 v11 = 1024;
    int v12 = 16;
    __int16 v13 = 2114;
    double v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersonalizationScoringConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationScoringConfig)initWithCoder:(id)a3
{
  id v3 = a3;
  [v3 decodeDoubleForKey:@"anfMultiplier"];
  double v121 = v4;
  [v3 decodeDoubleForKey:@"articleEmbeddingScoreCoefficient"];
  double v120 = v5;
  [v3 decodeDoubleForKey:@"articleEmbeddingScoreDampenerWeight"];
  double v119 = v6;
  [v3 decodeDoubleForKey:@"articleLengthAggregateWeight"];
  double v118 = v7;
  [v3 decodeDoubleForKey:@"articleReadPenalty"];
  double v117 = v8;
  [v3 decodeDoubleForKey:@"articleListenedPenalty"];
  double v116 = v9;
  [v3 decodeDoubleForKey:@"audioMultiplierForFreeUsers"];
  double v115 = v10;
  [v3 decodeDoubleForKey:@"audioMultiplierForTrialUsers"];
  double v114 = v11;
  [v3 decodeDoubleForKey:@"audioMultiplierForPaidUsers"];
  uint64_t v113 = v12;
  [v3 decodeDoubleForKey:@"autofavoritedVoteCoefficient"];
  uint64_t v112 = v13;
  [v3 decodeDoubleForKey:@"baselineRatePrior"];
  uint64_t v111 = v14;
  [v3 decodeDoubleForKey:@"bundleFreeMultiplierForFreeUsers"];
  uint64_t v110 = v15;
  [v3 decodeDoubleForKey:@"bundleFreeMultiplierForTrialUsers"];
  uint64_t v109 = v16;
  [v3 decodeDoubleForKey:@"bundleFreeMultiplierForPaidUsers"];
  uint64_t v108 = v17;
  [v3 decodeDoubleForKey:@"bundlePaidMultiplierForFreeUsers"];
  uint64_t v107 = v18;
  [v3 decodeDoubleForKey:@"bundlePaidMultiplierForTrialUsers"];
  uint64_t v106 = v19;
  [v3 decodeDoubleForKey:@"bundlePaidMultiplierForPaidUsers"];
  uint64_t v105 = v20;
  [v3 decodeDoubleForKey:@"conversionCoefficientForFreeUsers"];
  uint64_t v104 = v21;
  [v3 decodeDoubleForKey:@"conversionCoefficientForTrialUsers"];
  uint64_t v102 = v22;
  [v3 decodeDoubleForKey:@"conversionCoefficientForPaidUsers"];
  uint64_t v101 = v23;
  double v103 = [v3 decodeObjectForKey:@"conversionCohort"];
  [v3 decodeDoubleForKey:@"ctrWithOneAutofavorited"];
  uint64_t v100 = v24;
  [v3 decodeDoubleForKey:@"ctrWithOneSubscribed"];
  uint64_t v99 = v25;
  [v3 decodeDoubleForKey:@"ctrWithSubscribedChannel"];
  uint64_t v98 = v26;
  [v3 decodeDoubleForKey:@"ctrWithThreeAutofavorited"];
  uint64_t v97 = v27;
  [v3 decodeDoubleForKey:@"ctrWithThreeSubscribed"];
  uint64_t v96 = v28;
  [v3 decodeDoubleForKey:@"ctrWithTwoAutofavorited"];
  uint64_t v95 = v29;
  [v3 decodeDoubleForKey:@"ctrWithTwoSubscribed"];
  uint64_t v94 = v30;
  [v3 decodeDoubleForKey:@"ctrWithZeroAutofavorited"];
  uint64_t v93 = v31;
  [v3 decodeDoubleForKey:@"ctrWithZeroSubscribed"];
  uint64_t v92 = v32;
  [v3 decodeDoubleForKey:@"decayFactor"];
  uint64_t v91 = v33;
  [v3 decodeDoubleForKey:@"featuredMultiplierForFreeUsers"];
  uint64_t v90 = v34;
  [v3 decodeDoubleForKey:@"featuredMultiplierForTrialUsers"];
  uint64_t v89 = v35;
  [v3 decodeDoubleForKey:@"featuredMultiplierForPaidUsers"];
  uint64_t v88 = v36;
  [v3 decodeDoubleForKey:@"evergreenMultiplierForFreeUsers"];
  uint64_t v87 = v37;
  [v3 decodeDoubleForKey:@"evergreenMultiplierForTrialUsers"];
  uint64_t v86 = v38;
  [v3 decodeDoubleForKey:@"evergreenMultiplierForPaidUsers"];
  uint64_t v85 = v39;
  [v3 decodeDoubleForKey:@"globalScoreCoefficientFree"];
  uint64_t v84 = v40;
  [v3 decodeDoubleForKey:@"globalScoreCoefficientPaid"];
  uint64_t v82 = v41;
  [v3 decodeDoubleForKey:@"globalScoreCoefficientHalfLife"];
  uint64_t v81 = v42;
  [v3 decodeDoubleForKey:@"globalScoreCoefficientInitialMultiplier"];
  uint64_t v80 = v43;
  [v3 decodeDoubleForKey:@"globalScoreDemocratizationFactor"];
  uint64_t v79 = v44;
  [v3 decodeDoubleForKey:@"localScoreDemocratizationFactor"];
  uint64_t v78 = v45;
  [v3 decodeDoubleForKey:@"conversionScoreDemocratizationFactor"];
  uint64_t v77 = v46;
  [v3 decodeDoubleForKey:@"headlineSeenPenalty"];
  uint64_t v76 = v47;
  [v3 decodeDoubleForKey:@"halfLifeCoefficient"];
  uint64_t v75 = v48;
  [v3 decodeDoubleForKey:@"userFeedbackHalfLifeCoefficient"];
  uint64_t v74 = v49;
  [v3 decodeDoubleForKey:@"evergreenHalfLifeCoefficient"];
  uint64_t v73 = v50;
  unsigned int v83 = [v3 decodeBoolForKey:@"respectHalfLifeOverride"];
  [v3 decodeDoubleForKey:@"mutedVoteCoefficient"];
  uint64_t v71 = v51;
  [v3 decodeDoubleForKey:@"personalizationCoefficient"];
  uint64_t v70 = v52;
  [v3 decodeDoubleForKey:@"publisherAggregateWeight"];
  uint64_t v69 = v53;
  [v3 decodeDoubleForKey:@"sparseTagsPenalty"];
  uint64_t v68 = v54;
  [v3 decodeDoubleForKey:@"subscribedChannelScoreCoefficient"];
  uint64_t v67 = v55;
  [v3 decodeDoubleForKey:@"subscribedTopicsScoreCoefficient"];
  uint64_t v66 = v56;
  double v57 = [v3 decodeObjectForKey:@"userCohort"];
  [v3 decodeDoubleForKey:@"lowFlowBoostFetchCountWeight"];
  uint64_t v65 = v58;
  [v3 decodeDoubleForKey:@"lowFlowBoostFactor"];
  uint64_t v64 = v59;
  [v3 decodeDoubleForKey:@"lowFlowBoostMaxProductFactor"];
  double v60 = [v3 decodeObjectForKey:@"lowFlowBoostFetchEstimationConfig"];
  double v61 = [v3 decodeObjectForKey:@"lowFlowBoostEventEstimationConfig"];
  unsigned int v72 = [v3 decodeBoolForKey:@"nicheContentBoostOnlyAboveBaselineMembership"];
  [v3 decodeDoubleForKey:@"nicheContentBaselineMembershipMultiplier"];
  [v3 decodeBoolForKey:@"nicheContentManagedTopicBoostAllTags"];
  [v3 decodeDoubleForKey:@"nicheContentDefaultFlowRate"];
  [v3 decodeDoubleForKey:@"nicheContentDefaultSubscriptionRate"];
  [v3 decodeBoolForKey:@"nicheContentExcludeNonGroupableTopics"];
  [v3 decodeBoolForKey:@"nicheContentShouldBoostPublisher"];
  [v3 decodeDoubleForKey:@"nicheContentTopicFlowExponent"];
  [v3 decodeDoubleForKey:@"nicheContentPublisherFlowExponent"];
  [v3 decodeDoubleForKey:@"nicheContentManagedTopicBoost"];
  [v3 decodeDoubleForKey:@"nicheContentServerFlowWeight"];
  [v3 decodeDoubleForKey:@"nicheContentTopicSubscriptionExponent"];
  [v3 decodeDoubleForKey:@"nicheContentPublisherSubscriptionExponent"];
  [v3 decodeDoubleForKey:@"nicheContentQualityThreshold"];
  [v3 decodeIntegerForKey:@"contentTriggerMaxEventCount"];
  [v3 decodeDoubleForKey:@"contentTriggerScoreExponent"];
  [v3 decodeDoubleForKey:@"contentTriggerTagWeightExponent"];
  [v3 decodeDoubleForKey:@"contentTriggerMinScoreWeight"];
  [v3 decodeDoubleForKey:@"contentTriggerMaxDampener"];
  [v3 decodeDoubleForKey:@"contentTriggerDampenerCoefficient"];
  [v3 decodeDoubleForKey:@"personalizedMultiplierBaselineMembership"];
  [v3 decodeDoubleForKey:@"personalizedMultiplierPreBaselineCurvature"];
  [v3 decodeDoubleForKey:@"personalizedMultiplierPostBaselineCurvature"];
  [v3 decodeDoubleForKey:@"personalizedMultiplierMembershipDampener"];
  [v3 decodeDoubleForKey:@"publisherDampenerWeight"];
  [v3 decodeDoubleForKey:@"recentlyFollowedDurationThreshold"];
  [v3 decodeDoubleForKey:@"recentlyFollowedMultiplier"];
  [v3 decodeDoubleForKey:@"tabiScoreCoefficient"];
  [v3 decodeDoubleForKey:@"clientSideEngagementBoostFeaturedArticleMultiplier"];
  [v3 decodeDoubleForKey:@"clientSideEngagementBoostFeatureCandidateArticleMultiplier"];
  [v3 decodeDoubleForKey:@"clientSideEngagementBoostFreeCohortCTRCap"];
  [v3 decodeDoubleForKey:@"clientSideEngagementBoostPaidCohortCTRCap"];
  [v3 decodeDoubleForKey:@"clientSideEngagementBoostTagQualityMultiplier"];
  [v3 decodeDoubleForKey:@"clientSideEngagementBoostReduceVisibilityMultiplier"];
  [v3 decodeDoubleForKey:@"clientSideEngagementBoostANFMutiplier"];
  [v3 decodeBoolForKey:@"dampenerEnabled"];
  [v3 decodeBoolForKey:@"multiplierEnabled"];
  [v3 decodeDoubleForKey:@"peopleAlsoReadBaselineScore"];
  [v3 decodeDoubleForKey:@"peopleAlsoReadConditionalScoreCoefficient"];
  [v3 decodeDoubleForKey:@"peopleAlsoReadScoreCoefficient"];

  double v62 = -[FCPersonalizationScoringConfig initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQualityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:dampenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlsoReadScoreCoefficient:](self, "initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponen"
          "t:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTop"
          "icSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMa"
          "xEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTr"
          "iggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultip"
          "lierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:"
          "publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clie"
          "ntSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clie"
          "ntSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQu"
          "alityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:damp"
          "enerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlso"
          "ReadScoreCoefficient:",
          v103,
          v83,
          v57,
          v60,
          v61,
          v72,
          v121,
          v120,
          v119,
          v118,
          v117,
          v116,
          v115,
          v114,
          v113,
          v112,
          v111,
          v110,
          v109,
          v108,
          v107,
          v106,
          v105,
          v104,
          v102,
          v101,
          v100,
          v99,
          v98,
          v97,
          v96,
          v95,
          v94,
          v93,
          v92,
          v91,
          v90,
          v89,
          v88,
          v87,
          v86,
          v85,
          v84,
          v82,
          v81,
          v80,
          v79,
          v78,
          v77,
          v76,
          v75,
          v74,
          v73,
          v71,
          v70,
          v69,
          v68,
          v67,
          v66,
          v65,
          v64);

  return v62;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [(FCPersonalizationScoringConfig *)self anfMultiplier];
  objc_msgSend(v8, "encodeDouble:forKey:", @"anfMultiplier");
  [(FCPersonalizationScoringConfig *)self articleEmbeddingScoreCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"articleEmbeddingScoreCoefficient");
  [(FCPersonalizationScoringConfig *)self articleEmbeddingScoreDampenerWeight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"articleEmbeddingScoreDampenerWeight");
  [(FCPersonalizationScoringConfig *)self articleLengthAggregateWeight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"articleLengthAggregateWeight");
  [(FCPersonalizationScoringConfig *)self articleReadPenalty];
  objc_msgSend(v8, "encodeDouble:forKey:", @"articleReadPenalty");
  [(FCPersonalizationScoringConfig *)self articleListenedPenalty];
  objc_msgSend(v8, "encodeDouble:forKey:", @"articleListenedPenalty");
  [(FCPersonalizationScoringConfig *)self audioMultiplierForFreeUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"audioMultiplierForAUsers");
  [(FCPersonalizationScoringConfig *)self audioMultiplierForTrialUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"audioMultiplierForBUsers");
  [(FCPersonalizationScoringConfig *)self audioMultiplierForPaidUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"audioMultiplierForCUsers");
  [(FCPersonalizationScoringConfig *)self autofavoritedVoteCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"autofavoritedVoteCoefficient");
  [(FCPersonalizationScoringConfig *)self baselineRatePrior];
  objc_msgSend(v8, "encodeDouble:forKey:", @"baselineRatePrior");
  [(FCPersonalizationScoringConfig *)self bundleFreeMultiplierForFreeUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bundleFreeMultiplierForFreeUsers");
  [(FCPersonalizationScoringConfig *)self bundleFreeMultiplierForTrialUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bundleFreeMultiplierForTrialUsers");
  [(FCPersonalizationScoringConfig *)self bundleFreeMultiplierForPaidUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bundleFreeMultiplierForPaidUsers");
  [(FCPersonalizationScoringConfig *)self bundlePaidMultiplierForFreeUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bundlePaidMultiplierForFreeUsers");
  [(FCPersonalizationScoringConfig *)self bundlePaidMultiplierForTrialUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bundlePaidMultiplierForTrialUsers");
  [(FCPersonalizationScoringConfig *)self bundlePaidMultiplierForPaidUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bundlePaidMultiplierForPaidUsers");
  [(FCPersonalizationScoringConfig *)self conversionCoefficientForFreeUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"conversionCoefficientForFreeUsers");
  [(FCPersonalizationScoringConfig *)self conversionCoefficientForTrialUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"conversionCoefficientForTrialUsers");
  [(FCPersonalizationScoringConfig *)self conversionCoefficientForPaidUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"conversionCoefficientForPaidUsers");
  double v4 = [(FCPersonalizationScoringConfig *)self conversionCohort];
  [v8 encodeObject:v4 forKey:@"conversionCohort"];

  [(FCPersonalizationScoringConfig *)self ctrWithOneAutofavorited];
  objc_msgSend(v8, "encodeDouble:forKey:", @"ctrWithOneAutofavorited");
  [(FCPersonalizationScoringConfig *)self ctrWithOneSubscribed];
  objc_msgSend(v8, "encodeDouble:forKey:", @"ctrWithOneSubscribed");
  [(FCPersonalizationScoringConfig *)self ctrWithSubscribedChannel];
  objc_msgSend(v8, "encodeDouble:forKey:", @"ctrWithSubscribedChannel");
  [(FCPersonalizationScoringConfig *)self ctrWithThreeAutofavorited];
  objc_msgSend(v8, "encodeDouble:forKey:", @"ctrWithThreeAutofavorited");
  [(FCPersonalizationScoringConfig *)self ctrWithThreeSubscribed];
  objc_msgSend(v8, "encodeDouble:forKey:", @"ctrWithThreeSubscribed");
  [(FCPersonalizationScoringConfig *)self ctrWithTwoAutofavorited];
  objc_msgSend(v8, "encodeDouble:forKey:", @"ctrWithTwoAutofavorited");
  [(FCPersonalizationScoringConfig *)self ctrWithTwoSubscribed];
  objc_msgSend(v8, "encodeDouble:forKey:", @"ctrWithTwoSubscribed");
  [(FCPersonalizationScoringConfig *)self ctrWithZeroAutofavorited];
  objc_msgSend(v8, "encodeDouble:forKey:", @"ctrWithZeroAutofavorited");
  [(FCPersonalizationScoringConfig *)self ctrWithZeroSubscribed];
  objc_msgSend(v8, "encodeDouble:forKey:", @"ctrWithZeroSubscribed");
  [(FCPersonalizationScoringConfig *)self decayFactor];
  objc_msgSend(v8, "encodeDouble:forKey:", @"decayFactor");
  [(FCPersonalizationScoringConfig *)self featuredMultiplierForFreeUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"featuredMultiplierForFreeUsers");
  [(FCPersonalizationScoringConfig *)self featuredMultiplierForTrialUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"featuredMultiplierForTrialUsers");
  [(FCPersonalizationScoringConfig *)self featuredMultiplierForPaidUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"featuredMultiplierForPaidUsers");
  [(FCPersonalizationScoringConfig *)self evergreenMultiplierForFreeUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"evergreenMultiplierForFreeUsers");
  [(FCPersonalizationScoringConfig *)self evergreenMultiplierForTrialUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"evergreenMultiplierForTrialUsers");
  [(FCPersonalizationScoringConfig *)self evergreenMultiplierForPaidUsers];
  objc_msgSend(v8, "encodeDouble:forKey:", @"evergreenMultiplierForPaidUsers");
  [(FCPersonalizationScoringConfig *)self globalScoreCoefficientFree];
  objc_msgSend(v8, "encodeDouble:forKey:", @"globalScoreCoefficientFree");
  [(FCPersonalizationScoringConfig *)self globalScoreCoefficientPaid];
  objc_msgSend(v8, "encodeDouble:forKey:", @"globalScoreCoefficientPaid");
  [(FCPersonalizationScoringConfig *)self globalScoreCoefficientHalfLife];
  objc_msgSend(v8, "encodeDouble:forKey:", @"globalScoreCoefficientHalfLife");
  [(FCPersonalizationScoringConfig *)self globalScoreCoefficientInitialMultiplier];
  objc_msgSend(v8, "encodeDouble:forKey:", @"globalScoreCoefficientInitialMultiplier");
  [(FCPersonalizationScoringConfig *)self globalScoreDemocratizationFactor];
  objc_msgSend(v8, "encodeDouble:forKey:", @"globalScoreDemocratizationFactor");
  [(FCPersonalizationScoringConfig *)self localScoreDemocratizationFactor];
  objc_msgSend(v8, "encodeDouble:forKey:", @"localScoreDemocratizationFactor");
  [(FCPersonalizationScoringConfig *)self conversionScoreDemocratizationFactor];
  objc_msgSend(v8, "encodeDouble:forKey:", @"conversionScoreDemocratizationFactor");
  [(FCPersonalizationScoringConfig *)self headlineSeenPenalty];
  objc_msgSend(v8, "encodeDouble:forKey:", @"headlineSeenPenalty");
  [(FCPersonalizationScoringConfig *)self halfLifeCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"halfLifeCoefficient");
  [(FCPersonalizationScoringConfig *)self userFeedbackHalfLifeCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"userFeedbackHalfLifeCoefficient");
  [(FCPersonalizationScoringConfig *)self evergreenHalfLifeCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"evergreenHalfLifeCoefficient");
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig respectHalfLifeOverride](self, "respectHalfLifeOverride"), @"respectHalfLifeOverride");
  [(FCPersonalizationScoringConfig *)self mutedVoteCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"mutedVoteCoefficient");
  [(FCPersonalizationScoringConfig *)self personalizationCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"personalizationCoefficient");
  [(FCPersonalizationScoringConfig *)self publisherAggregateWeight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"publisherAggregateWeight");
  [(FCPersonalizationScoringConfig *)self sparseTagsPenalty];
  objc_msgSend(v8, "encodeDouble:forKey:", @"sparseTagsPenalty");
  [(FCPersonalizationScoringConfig *)self subscribedChannelScoreCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"subscribedChannelScoreCoefficient");
  [(FCPersonalizationScoringConfig *)self subscribedTopicsScoreCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"subscribedTopicsScoreCoefficient");
  double v5 = [(FCPersonalizationScoringConfig *)self userCohort];
  [v8 encodeObject:v5 forKey:@"userCohort"];

  [(FCPersonalizationScoringConfig *)self lowFlowBoostFetchCountWeight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"lowFlowBoostFetchCountWeight");
  [(FCPersonalizationScoringConfig *)self lowFlowBoostFactor];
  objc_msgSend(v8, "encodeDouble:forKey:", @"lowFlowBoostFactor");
  [(FCPersonalizationScoringConfig *)self lowFlowBoostMaxProductFactor];
  objc_msgSend(v8, "encodeDouble:forKey:", @"lowFlowBoostMaxProductFactor");
  double v6 = [(FCPersonalizationScoringConfig *)self lowFlowBoostFetchEstimationConfig];
  [v8 encodeObject:v6 forKey:@"lowFlowBoostFetchEstimationConfig"];

  double v7 = [(FCPersonalizationScoringConfig *)self lowFlowBoostEventEstimationConfig];
  [v8 encodeObject:v7 forKey:@"lowFlowBoostEventEstimationConfig"];

  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig nicheContentBoostOnlyAboveBaselineMembership](self, "nicheContentBoostOnlyAboveBaselineMembership"), @"nicheContentBoostOnlyAboveBaselineMembership");
  [(FCPersonalizationScoringConfig *)self nicheContentBaselineMembershipMultiplier];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentBaselineMembershipMultiplier");
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig nicheContentManagedTopicBoostAllTags](self, "nicheContentManagedTopicBoostAllTags"), @"nicheContentManagedTopicBoostAllTags");
  [(FCPersonalizationScoringConfig *)self nicheContentDefaultFlowRate];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentDefaultFlowRate");
  [(FCPersonalizationScoringConfig *)self nicheContentDefaultSubscriptionRate];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentDefaultSubscriptionRate");
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig nicheContentExcludeNonGroupableTopics](self, "nicheContentExcludeNonGroupableTopics"), @"nicheContentExcludeNonGroupableTopics");
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig nicheContentShouldBoostPublisher](self, "nicheContentShouldBoostPublisher"), @"nicheContentShouldBoostPublisher");
  [(FCPersonalizationScoringConfig *)self nicheContentTopicFlowExponent];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentTopicFlowExponent");
  [(FCPersonalizationScoringConfig *)self nicheContentPublisherFlowExponent];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentPublisherFlowExponent");
  [(FCPersonalizationScoringConfig *)self nicheContentManagedTopicBoost];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentManagedTopicBoost");
  [(FCPersonalizationScoringConfig *)self nicheContentServerFlowWeight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentServerFlowWeight");
  [(FCPersonalizationScoringConfig *)self nicheContentTopicSubscriptionExponent];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentTopicSubscriptionExponent");
  [(FCPersonalizationScoringConfig *)self nicheContentPublisherSubscriptionExponent];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentPublisherSubscriptionExponent");
  [(FCPersonalizationScoringConfig *)self nicheContentQualityThreshold];
  objc_msgSend(v8, "encodeDouble:forKey:", @"nicheContentQualityThreshold");
  objc_msgSend(v8, "encodeInteger:forKey:", -[FCPersonalizationScoringConfig contentTriggerMaxEventCount](self, "contentTriggerMaxEventCount"), @"contentTriggerMaxEventCount");
  [(FCPersonalizationScoringConfig *)self contentTriggerScoreExponent];
  objc_msgSend(v8, "encodeDouble:forKey:", @"contentTriggerScoreExponent");
  [(FCPersonalizationScoringConfig *)self contentTriggerTagWeightExponent];
  objc_msgSend(v8, "encodeDouble:forKey:", @"contentTriggerTagWeightExponent");
  [(FCPersonalizationScoringConfig *)self contentTriggerMinScoreWeight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"contentTriggerMinScoreWeight");
  [(FCPersonalizationScoringConfig *)self contentTriggerMaxDampener];
  objc_msgSend(v8, "encodeDouble:forKey:", @"contentTriggerMaxDampener");
  [(FCPersonalizationScoringConfig *)self contentTriggerDampenerCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"contentTriggerDampenerCoefficient");
  [(FCPersonalizationScoringConfig *)self personalizedMultiplierBaselineMembership];
  objc_msgSend(v8, "encodeDouble:forKey:", @"personalizedMultiplierBaselineMembership");
  [(FCPersonalizationScoringConfig *)self personalizedMultiplierPreBaselineCurvature];
  objc_msgSend(v8, "encodeDouble:forKey:", @"personalizedMultiplierPreBaselineCurvature");
  [(FCPersonalizationScoringConfig *)self personalizedMultiplierPostBaselineCurvature];
  objc_msgSend(v8, "encodeDouble:forKey:", @"personalizedMultiplierPostBaselineCurvature");
  [(FCPersonalizationScoringConfig *)self personalizedMultiplierMembershipDampener];
  objc_msgSend(v8, "encodeDouble:forKey:", @"personalizedMultiplierMembershipDampener");
  [(FCPersonalizationScoringConfig *)self publisherDampenerWeight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"publisherDampenerWeight");
  [(FCPersonalizationScoringConfig *)self recentlyFollowedDurationThreshold];
  objc_msgSend(v8, "encodeDouble:forKey:", @"recentlyFollowedDurationThreshold");
  [(FCPersonalizationScoringConfig *)self recentlyFollowedMultiplier];
  objc_msgSend(v8, "encodeDouble:forKey:", @"recentlyFollowedMultiplier");
  [(FCPersonalizationScoringConfig *)self tabiScoreCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"tabiScoreCoefficient");
  [(FCPersonalizationScoringConfig *)self clientSideEngagementBoostFeaturedArticleMultiplier];
  objc_msgSend(v8, "encodeDouble:forKey:", @"clientSideEngagementBoostFeaturedArticleMultiplier");
  [(FCPersonalizationScoringConfig *)self clientSideEngagementBoostFeatureCandidateArticleMultiplier];
  objc_msgSend(v8, "encodeDouble:forKey:", @"clientSideEngagementBoostFeatureCandidateArticleMultiplier");
  [(FCPersonalizationScoringConfig *)self clientSideEngagementBoostFreeCohortCTRCap];
  objc_msgSend(v8, "encodeDouble:forKey:", @"clientSideEngagementBoostFreeCohortCTRCap");
  [(FCPersonalizationScoringConfig *)self clientSideEngagementBoostPaidCohortCTRCap];
  objc_msgSend(v8, "encodeDouble:forKey:", @"clientSideEngagementBoostPaidCohortCTRCap");
  [(FCPersonalizationScoringConfig *)self clientSideEngagementBoostTagQualityMultiplier];
  objc_msgSend(v8, "encodeDouble:forKey:", @"clientSideEngagementBoostTagQualityMultiplier");
  [(FCPersonalizationScoringConfig *)self clientSideEngagementBoostReduceVisibilityMultiplier];
  objc_msgSend(v8, "encodeDouble:forKey:", @"clientSideEngagementBoostReduceVisibilityMultiplier");
  [(FCPersonalizationScoringConfig *)self clientSideEngagementBoostANFMutiplier];
  objc_msgSend(v8, "encodeDouble:forKey:", @"clientSideEngagementBoostANFMutiplier");
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig dampenerEnabled](self, "dampenerEnabled"), @"dampenerEnabled");
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig multiplierEnabled](self, "multiplierEnabled"), @"multiplierEnabled");
  [(FCPersonalizationScoringConfig *)self peopleAlsoReadBaselineScore];
  objc_msgSend(v8, "encodeDouble:forKey:", @"peopleAlsoReadBaselineScore");
  [(FCPersonalizationScoringConfig *)self peopleAlsoReadConditionalScoreCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"peopleAlsoReadConditionalScoreCoefficient");
  [(FCPersonalizationScoringConfig *)self peopleAlsoReadScoreCoefficient];
  objc_msgSend(v8, "encodeDouble:forKey:", @"peopleAlsoReadScoreCoefficient");
}

- (void)setAnfMultiplier:(double)a3
{
  self->_anfMultiplier = a3;
}

- (void)setArticleEmbeddingScoreCoefficient:(double)a3
{
  self->_articleEmbeddingScoreCoefficient = a3;
}

- (void)setArticleEmbeddingScoreDampenerWeight:(double)a3
{
  self->_articleEmbeddingScoreDampenerWeight = a3;
}

- (void)setArticleLengthAggregateWeight:(double)a3
{
  self->_articleLengthAggregateWeight = a3;
}

- (void)setArticleReadPenalty:(double)a3
{
  self->_articleReadPenalty = a3;
}

- (void)setArticleListenedPenalty:(double)a3
{
  self->_articleListenedPenalty = a3;
}

- (void)setAudioMultiplierForFreeUsers:(double)a3
{
  self->_audioMultiplierForFreeUsers = a3;
}

- (void)setAudioMultiplierForTrialUsers:(double)a3
{
  self->_audioMultiplierForTrialUsers = a3;
}

- (void)setAudioMultiplierForPaidUsers:(double)a3
{
  self->_audioMultiplierForPaidUsers = a3;
}

- (void)setAutofavoritedVoteCoefficient:(double)a3
{
  self->_autofavoritedVoteCoefficient = a3;
}

- (void)setBaselineRatePrior:(double)a3
{
  self->_baselineRatePrior = a3;
}

- (void)setBundleFreeMultiplierForFreeUsers:(double)a3
{
  self->_bundleFreeMultiplierForFreeUsers = a3;
}

- (void)setBundleFreeMultiplierForTrialUsers:(double)a3
{
  self->_bundleFreeMultiplierForTrialUsers = a3;
}

- (void)setBundleFreeMultiplierForPaidUsers:(double)a3
{
  self->_bundleFreeMultiplierForPaidUsers = a3;
}

- (void)setBundlePaidMultiplierForFreeUsers:(double)a3
{
  self->_bundlePaidMultiplierForFreeUsers = a3;
}

- (void)setBundlePaidMultiplierForTrialUsers:(double)a3
{
  self->_bundlePaidMultiplierForTrialUsers = a3;
}

- (void)setBundlePaidMultiplierForPaidUsers:(double)a3
{
  self->_bundlePaidMultiplierForPaidUsers = a3;
}

- (void)setConversionCoefficientForFreeUsers:(double)a3
{
  self->_conversionCoefficientForFreeUsers = a3;
}

- (void)setConversionCoefficientForTrialUsers:(double)a3
{
  self->_conversionCoefficientForTrialUsers = a3;
}

- (void)setConversionCoefficientForPaidUsers:(double)a3
{
  self->_conversionCoefficientForPaidUsers = a3;
}

- (void)setConversionCohort:(id)a3
{
}

- (void)setCtrWithOneAutofavorited:(double)a3
{
  self->_ctrWithOneAutofavorited = a3;
}

- (void)setCtrWithOneSubscribed:(double)a3
{
  self->_ctrWithOneSubscribed = a3;
}

- (void)setCtrWithSubscribedChannel:(double)a3
{
  self->_ctrWithSubscribedChannel = a3;
}

- (void)setCtrWithThreeAutofavorited:(double)a3
{
  self->_ctrWithThreeAutofavorited = a3;
}

- (void)setCtrWithThreeSubscribed:(double)a3
{
  self->_ctrWithThreeSubscribed = a3;
}

- (void)setCtrWithTwoAutofavorited:(double)a3
{
  self->_ctrWithTwoAutofavorited = a3;
}

- (void)setCtrWithTwoSubscribed:(double)a3
{
  self->_ctrWithTwoSubscribed = a3;
}

- (void)setCtrWithZeroAutofavorited:(double)a3
{
  self->_ctrWithZeroAutofavorited = a3;
}

- (void)setCtrWithZeroSubscribed:(double)a3
{
  self->_ctrWithZeroSubscribed = a3;
}

- (void)setDecayFactor:(double)a3
{
  self->_decayFactor = a3;
}

- (void)setFeaturedMultiplierForFreeUsers:(double)a3
{
  self->_featuredMultiplierForFreeUsers = a3;
}

- (void)setFeaturedMultiplierForTrialUsers:(double)a3
{
  self->_featuredMultiplierForTrialUsers = a3;
}

- (void)setFeaturedMultiplierForPaidUsers:(double)a3
{
  self->_featuredMultiplierForPaidUsers = a3;
}

- (void)setEvergreenMultiplierForFreeUsers:(double)a3
{
  self->_evergreenMultiplierForFreeUsers = a3;
}

- (void)setEvergreenMultiplierForTrialUsers:(double)a3
{
  self->_evergreenMultiplierForTrialUsers = a3;
}

- (void)setEvergreenMultiplierForPaidUsers:(double)a3
{
  self->_evergreenMultiplierForPaidUsers = a3;
}

- (void)setGlobalScoreCoefficientFree:(double)a3
{
  self->_globalScoreCoefficientFree = a3;
}

- (void)setGlobalScoreCoefficientPaid:(double)a3
{
  self->_globalScoreCoefficientPaid = a3;
}

- (void)setGlobalScoreCoefficientHalfLife:(double)a3
{
  self->_globalScoreCoefficientHalfLife = a3;
}

- (void)setGlobalScoreCoefficientInitialMultiplier:(double)a3
{
  self->_globalScoreCoefficientInitialMultiplier = a3;
}

- (void)setGlobalScoreDemocratizationFactor:(double)a3
{
  self->_globalScoreDemocratizationFactor = a3;
}

- (void)setLocalScoreDemocratizationFactor:(double)a3
{
  self->_localScoreDemocratizationFactor = a3;
}

- (void)setConversionScoreDemocratizationFactor:(double)a3
{
  self->_conversionScoreDemocratizationFactor = a3;
}

- (void)setHeadlineSeenPenalty:(double)a3
{
  self->_headlineSeenPenalty = a3;
}

- (void)setHalfLifeCoefficient:(double)a3
{
  self->_halfLifeCoefficient = a3;
}

- (void)setUserFeedbackHalfLifeCoefficient:(double)a3
{
  self->_userFeedbackHalfLifeCoefficient = a3;
}

- (void)setEvergreenHalfLifeCoefficient:(double)a3
{
  self->_evergreenHalfLifeCoefficient = a3;
}

- (void)setRespectHalfLifeOverride:(BOOL)a3
{
  self->_respectHalfLifeOverride = a3;
}

- (void)setMutedVoteCoefficient:(double)a3
{
  self->_mutedVoteCoefficient = a3;
}

- (void)setPersonalizationCoefficient:(double)a3
{
  self->_personalizationCoefficient = a3;
}

- (void)setPublisherAggregateWeight:(double)a3
{
  self->_publisherAggregateWeight = a3;
}

- (void)setSparseTagsPenalty:(double)a3
{
  self->_sparseTagsPenalty = a3;
}

- (void)setSubscribedChannelScoreCoefficient:(double)a3
{
  self->_subscribedChannelScoreCoefficient = a3;
}

- (void)setSubscribedTopicsScoreCoefficient:(double)a3
{
  self->_subscribedTopicsScoreCoefficient = a3;
}

- (void)setTabiScoreCoefficient:(double)a3
{
  self->_tabiScoreCoefficient = a3;
}

- (void)setUserCohort:(id)a3
{
}

- (void)setLowFlowBoostFetchCountWeight:(double)a3
{
  self->_lowFlowBoostFetchCountWeight = a3;
}

- (void)setLowFlowBoostFactor:(double)a3
{
  self->_lowFlowBoostFactor = a3;
}

- (void)setLowFlowBoostMaxProductFactor:(double)a3
{
  self->_lowFlowBoostMaxProductFactor = a3;
}

- (void)setLowFlowBoostFetchEstimationConfig:(id)a3
{
}

- (void)setLowFlowBoostEventEstimationConfig:(id)a3
{
}

- (void)setNicheContentBoostOnlyAboveBaselineMembership:(BOOL)a3
{
  self->_nicheContentBoostOnlyAboveBaselineMembership = a3;
}

- (void)setNicheContentBaselineMembershipMultiplier:(double)a3
{
  self->_nicheContentBaselineMembershipMultiplier = a3;
}

- (void)setNicheContentManagedTopicBoostAllTags:(BOOL)a3
{
  self->_nicheContentManagedTopicBoostAllTags = a3;
}

- (void)setNicheContentDefaultFlowRate:(double)a3
{
  self->_nicheContentDefaultFlowRate = a3;
}

- (void)setNicheContentDefaultSubscriptionRate:(double)a3
{
  self->_nicheContentDefaultSubscriptionRate = a3;
}

- (void)setNicheContentExcludeNonGroupableTopics:(BOOL)a3
{
  self->_nicheContentExcludeNonGroupableTopics = a3;
}

- (void)setNicheContentShouldBoostPublisher:(BOOL)a3
{
  self->_nicheContentShouldBoostPublisher = a3;
}

- (void)setNicheContentTopicFlowExponent:(double)a3
{
  self->_nicheContentTopicFlowExponent = a3;
}

- (void)setNicheContentPublisherFlowExponent:(double)a3
{
  self->_nicheContentPublisherFlowExponent = a3;
}

- (void)setNicheContentManagedTopicBoost:(double)a3
{
  self->_nicheContentManagedTopicBoost = a3;
}

- (void)setNicheContentServerFlowWeight:(double)a3
{
  self->_nicheContentServerFlowWeight = a3;
}

- (void)setNicheContentTopicSubscriptionExponent:(double)a3
{
  self->_nicheContentTopicSubscriptionExponent = a3;
}

- (void)setNicheContentPublisherSubscriptionExponent:(double)a3
{
  self->_nicheContentPublisherSubscriptionExponent = a3;
}

- (void)setNicheContentQualityThreshold:(double)a3
{
  self->_nicheContentQualityThreshold = a3;
}

- (void)setContentTriggerMaxEventCount:(int64_t)a3
{
  self->_contentTriggerMaxEventCount = a3;
}

- (void)setContentTriggerScoreExponent:(double)a3
{
  self->_contentTriggerScoreExponent = a3;
}

- (void)setContentTriggerTagWeightExponent:(double)a3
{
  self->_contentTriggerTagWeightExponent = a3;
}

- (void)setContentTriggerMinScoreWeight:(double)a3
{
  self->_contentTriggerMinScoreWeight = a3;
}

- (void)setContentTriggerMaxDampener:(double)a3
{
  self->_contentTriggerMaxDampener = a3;
}

- (void)setContentTriggerDampenerCoefficient:(double)a3
{
  self->_contentTriggerDampenerCoefficient = a3;
}

- (void)setPersonalizedMultiplierBaselineMembership:(double)a3
{
  self->_personalizedMultiplierBaselineMembership = a3;
}

- (void)setPersonalizedMultiplierPreBaselineCurvature:(double)a3
{
  self->_personalizedMultiplierPreBaselineCurvature = a3;
}

- (void)setPersonalizedMultiplierPostBaselineCurvature:(double)a3
{
  self->_personalizedMultiplierPostBaselineCurvature = a3;
}

- (void)setPersonalizedMultiplierMembershipDampener:(double)a3
{
  self->_personalizedMultiplierMembershipDampener = a3;
}

- (void)setPublisherDampenerWeight:(double)a3
{
  self->_publisherDampenerWeight = a3;
}

- (void)setRecentlyFollowedDurationThreshold:(double)a3
{
  self->_recentlyFollowedDurationThreshold = a3;
}

- (void)setRecentlyFollowedMultiplier:(double)a3
{
  self->_recentlyFollowedMultiplier = a3;
}

- (void)setClientSideEngagementBoostFeaturedArticleMultiplier:(double)a3
{
  self->_clientSideEngagementBoostFeaturedArticleMultiplier = a3;
}

- (void)setClientSideEngagementBoostFeatureCandidateArticleMultiplier:(double)a3
{
  self->_clientSideEngagementBoostFeatureCandidateArticleMultiplier = a3;
}

- (void)setClientSideEngagementBoostFreeCohortCTRCap:(double)a3
{
  self->_clientSideEngagementBoostFreeCohortCTRCap = a3;
}

- (void)setClientSideEngagementBoostPaidCohortCTRCap:(double)a3
{
  self->_clientSideEngagementBoostPaidCohortCTRCap = a3;
}

- (void)setClientSideEngagementBoostTagQualityMultiplier:(double)a3
{
  self->_clientSideEngagementBoostTagQualityMultiplier = a3;
}

- (void)setClientSideEngagementBoostReduceVisibilityMultiplier:(double)a3
{
  self->_clientSideEngagementBoostReduceVisibilityMultiplier = a3;
}

- (void)setClientSideEngagementBoostANFMutiplier:(double)a3
{
  self->_clientSideEngagementBoostANFMutiplier = a3;
}

- (void)setDampenerEnabled:(BOOL)a3
{
  self->_dampenerEnabled = a3;
}

- (void)setMultiplierEnabled:(BOOL)a3
{
  self->_multiplierEnabled = a3;
}

- (void)setPeopleAlsoReadBaselineScore:(double)a3
{
  self->_peopleAlsoReadBaselineScore = a3;
}

- (void)setPeopleAlsoReadConditionalScoreCoefficient:(double)a3
{
  self->_peopleAlsoReadConditionalScoreCoefficient = a3;
}

- (void)setPeopleAlsoReadScoreCoefficient:(double)a3
{
  self->_peopleAlsoReadScoreCoefficient = a3;
}

@end