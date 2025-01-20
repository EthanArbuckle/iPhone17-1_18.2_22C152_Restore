@interface PNUserDefaults
+ (BOOL)disableLLMAssetCuration;
+ (BOOL)dontSplitMomentsAcrossChaptersForImplicitMontage;
+ (BOOL)enableAssetScopingTokenPromotion;
+ (BOOL)enableChapterValidator;
+ (BOOL)enableLocationPromptBinding;
+ (BOOL)enableMediaAnalysisEmbeddingSearch;
+ (BOOL)enableMockGeneralMCError;
+ (BOOL)enableMockNetworkError;
+ (BOOL)enableMockNotEnoughAssetsError;
+ (BOOL)enableMockRateLimitingError;
+ (BOOL)enableMockServerRequestTimeout;
+ (BOOL)enableOnDemandCaptionGeneration;
+ (BOOL)enableStorytellingMomentFiltering;
+ (BOOL)enableTraitDeduping;
+ (BOOL)forceSequentialAssetCurationCalls;
+ (BOOL)globalTraitsUseAPhotoOfBeforeTrait;
+ (BOOL)globalTraitsUseMomentValidation;
+ (BOOL)globalTraitsUseSemanticSimilarity;
+ (BOOL)locationCurationAvoidPeople;
+ (BOOL)promotePlayableAssetsInStories;
+ (BOOL)promptValidationOfflineLLMQUEnabled;
+ (BOOL)saveVisualClustersToDebugAlbums;
+ (BOOL)shufflePromptParameters;
+ (BOOL)useGMSStreaming;
+ (BOOL)useGMSTemplates;
+ (BOOL)useLLMBasedMusicKeywordGeneration;
+ (BOOL)useLanguageDetectionLexiconFallback;
+ (BOOL)useMockQUMusicForCuration;
+ (BOOL)useMultilingualSafety;
+ (BOOL)useNormalDistributionForMoments;
+ (BOOL)useOtherQueryTokenAssetsForEventDisambiguation;
+ (BOOL)usePromptBindingMatchingUserQueryMethod;
+ (BOOL)useQueryAnnotationPromptBindingPersonAndPetNames;
+ (BOOL)useStillAssetsOnlyInBackgound;
+ (BOOL)useUnsupportedCharactersDetection;
+ (NSDictionary)assetCurationPegasusParameters;
+ (NSDictionary)assetCurationThimbleParameters;
+ (NSDictionary)freeformStoryPegasusParameters;
+ (NSDictionary)freeformStoryThimbleParameters;
+ (NSDictionary)globalTraitsPegasusParameters;
+ (NSDictionary)globalTraitsThimbleParameters;
+ (NSDictionary)musicKeywordsPegasusParameters;
+ (NSDictionary)musicKeywordsThimbleParameters;
+ (NSDictionary)promptRankingParameters;
+ (NSNumber)chapterCurationRandomizerSeed;
+ (NSNumber)chapterCuratorFeatureTypesForDistribution;
+ (NSNumber)globalAndPersonalTraitsSeed;
+ (NSNumber)globalTraitsMaximumTextSimilarityScore;
+ (NSNumber)numberOfChaptersPerStory;
+ (NSNumber)numberOfGlobalTraits;
+ (NSNumber)numberOfShotsPerChapter;
+ (NSNumber)numberOfTraitsToSelect;
+ (NSNumber)storyAssetsFetcherSimilarityThreshold;
+ (NSNumber)storytellerSelectedTraitsCount;
+ (NSString)ajaxDawToken;
+ (NSString)appleMusicMCPrivacyDisclosureState;
+ (NSString)appleMusicSmartSearchMode;
+ (NSString)assetCurationLocale;
+ (NSString)eventElectionMode;
+ (NSString)fallbackAssetCuration30bModelName;
+ (NSString)fallbackBase30bModelName;
+ (NSString)fallbackGlobalTraits30bModelName;
+ (NSString)fallbackQueryUnderstanding30bModelName;
+ (NSString)fallbackStorytelling30bModelName;
+ (NSString)globalTraitsLocale;
+ (NSString)memoryCreationAvailabilityState;
+ (NSString)mockQUMusic;
+ (NSString)shufflePromptParametersSeed;
+ (NSString)storyMusicMaestroEmbeddingApproach;
+ (NSString)storytellerLocale;
+ (double)assetScopingTokenPromotionLikeliness;
+ (double)assetsSelectionUsingOverlappingMomentsThreshold;
+ (double)chapterValidatorMatchingRatioThresholdPerShotForFocusedChapters;
+ (double)chapterValidatorMinimumCoverageOfStoryAssetsInFinalChapters;
+ (double)chapterValidatorMinimumRatioOfMatchingShotsForFocusedChapters;
+ (double)chapterValidatorMinimumRatioOfNonoverlappingAssetsForDistinctShot;
+ (double)globalTraitsRetrievalThreshold;
+ (double)globalTraitsScopedAssetsRetrievalThreshold;
+ (double)minimumCumulativeDistributionOfMomentFrequency;
+ (double)personalTraitGeneratorMinNumberOfStandardDeviations;
+ (double)personalTraitGeneratorMinRatioOfAssets;
+ (double)shotlistMatchingRetrievalThreshold;
+ (double)storyMusicCurationTimeoutSeconds;
+ (double)tripHighlightRepresentativeAssetsThreshold;
+ (int64_t)assetCurationModelVersion;
+ (int64_t)chapterValidatorMinimumNumberOfMatchingShotsForFocusedChapters;
+ (int64_t)chapterValidatorMinimumNumberOfRetrievedFilteredAssetPerChapter;
+ (int64_t)collectionToStoryContextTokenLimit;
+ (int64_t)generateNextStoryTitleStyleIndex;
+ (int64_t)globalTraitsMatchingEmbeddingSearchRetrievalLimit;
+ (int64_t)globalTraitsModelVersion;
+ (int64_t)globalTraitsNumberOfTraitsForMomentOverlap;
+ (int64_t)globalTraitsScopingEmbeddingSearchRetrievalLimit;
+ (int64_t)keyAssetEmbeddingSearchRetrievalLimit;
+ (int64_t)maximumNumberOfMomentsForEntireLibraryRetrieval;
+ (int64_t)maximumNumberOfMomentsForExtendedTokens;
+ (int64_t)maximumNumberOfMomentsForMomentExpansion;
+ (int64_t)maximumNumberOfMomentsForStoryGeneration;
+ (int64_t)minimumNumberOfLongTrips;
+ (int64_t)numberOfEventSuggestions;
+ (int64_t)placeholderAssetFetchMultiplier;
+ (int64_t)promoterStatusMergeCandidateLimit;
+ (int64_t)promoterStatusVerifiedPersonLimit;
+ (int64_t)promptValidationAssetCountThreshold;
+ (int64_t)queryAnnotationPromptBindingNumberOfLocationNames;
+ (int64_t)queryAnnotationPromptBindingNumberOfPersonAndPetNames;
+ (int64_t)queryPeopleRequiredInRetrievalMomentLimit;
+ (int64_t)shotlistMatchingEmbeddingSearchRetrievalLimit;
+ (int64_t)storytellerModelVersion;
+ (int64_t)userQueryEmbeddingSearchRetrievalLimit;
+ (int64_t)visualClusterBasedStoryMode;
+ (void)_registerDefaults;
+ (void)initialize;
@end

@implementation PNUserDefaults

+ (void)_registerDefaults
{
  v11[79] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = MEMORY[0x263EFFA88];
  v10[0] = @"PNPromoterStatusMergeCandidateLimit";
  v10[1] = @"PNPromoterStatusVerifiedPersonLimit";
  v11[0] = &unk_27076A128;
  v11[1] = &unk_27076A140;
  v10[2] = @"PNCollectionToStoryContextTokenLimit";
  v10[3] = @"PNPersonalTraitsMinRatioOfAssets";
  v11[2] = &unk_27076A158;
  v11[3] = &unk_27076A008;
  v10[4] = @"PNPersonalTraitGeneratorMinNumberOfStandardDeviations";
  v10[5] = @"PNUseGMSStreaming";
  v11[4] = &unk_27076A170;
  v11[5] = MEMORY[0x263EFFA88];
  uint64_t v4 = MEMORY[0x263EFFA80];
  v10[6] = @"PNUseGMSTemplates";
  v10[7] = @"PNEnableAssetScopingTokenPromotion";
  v11[6] = MEMORY[0x263EFFA88];
  v11[7] = MEMORY[0x263EFFA80];
  v10[8] = @"PNAssetScopingTokenPromotionLikeliness";
  v10[9] = @"kPNAssetsSelectionUsingOverlappingMomentsThreshold";
  v11[8] = &unk_27076A018;
  v11[9] = &unk_27076A028;
  v10[10] = @"kPNRetrievalThresholdGlobalTraitsScopedAssets";
  v10[11] = @"kPNRetrievalThresholdGlobalTraits";
  v11[10] = &unk_27076A038;
  v11[11] = &unk_27076A048;
  v10[12] = @"kPNRetrievalThresholdShotlistMatching";
  v10[13] = @"PNMaximumNumberOfMomentsForEntireLibraryRetrieval";
  v11[12] = &unk_27076A048;
  v11[13] = &unk_27076A188;
  v10[14] = @"PNMaximumNumberOfMomentsForStoryGeneration";
  v10[15] = @"PNMaximumNumberOfMomentsForMomentExpansion";
  v11[14] = &unk_27076A158;
  v11[15] = &unk_27076A1A0;
  v10[16] = @"PNMaximumNumberOfMomentsForExtendedTokens";
  v10[17] = @"PNUserQueryEmbeddingSearchRetrievalLimit";
  v11[16] = &unk_27076A1A0;
  v11[17] = &unk_27076A1B8;
  v10[18] = @"PNGlobalTraitsScopingEmbeddingSearchRetrievalLimit";
  v10[19] = @"PNGlobalTraitsMatchingEmbeddingSearchRetrievalLimit";
  v11[18] = &unk_27076A1D0;
  v11[19] = &unk_27076A1B8;
  v10[20] = @"PNShotlistMatchingEmbeddingSearchRetrievalLimit";
  v10[21] = @"PNKeyAssetEmbeddingSearchRetrievalLimit";
  v11[20] = &unk_27076A1D0;
  v11[21] = &unk_27076A1D0;
  v10[22] = @"PNPlaceholderAssetFetchMultiplier";
  v10[23] = @"PNQueryPeopleRequiredInRetrievalMomentLimit";
  v11[22] = &unk_27076A1E8;
  v11[23] = &unk_27076A200;
  v10[24] = @"PNMusicKeywordsPegasusParameters";
  v10[25] = @"PNMusicKeywordsThimbleParameters";
  v11[24] = &unk_27076A518;
  v11[25] = &unk_27076A540;
  v10[26] = @"kPNStoryMusicCurationTimeoutSeconds";
  v10[27] = @"PNEnableOnDemandCaptionGeneration";
  v11[26] = &unk_27076A1E8;
  v11[27] = MEMORY[0x263EFFA80];
  v10[28] = @"PNEnableMediaAnalysisEmbeddingSearch";
  v10[29] = @"kPNVisualClusterBasedStoryMode";
  v11[28] = MEMORY[0x263EFFA88];
  v11[29] = &unk_27076A218;
  v10[30] = @"kPNSaveVisualClustersToDebugAlbums";
  v10[31] = @"kPNStoryGenerationNumberOfGlobalTraits";
  v11[30] = MEMORY[0x263EFFA80];
  v11[31] = &unk_27076A230;
  v10[32] = @"kPNStoryGenerationNumberOfChaptersPerStory";
  v10[33] = @"kPNStoryGenerationNumberOfShotsPerChapter";
  v11[32] = &unk_27076A200;
  v11[33] = &unk_27076A230;
  v10[34] = @"kPNStoryGenerationNumberOfTraitsToSelect";
  v10[35] = @"PNForceSequentialAssetCurationCalls";
  v11[34] = &unk_27076A248;
  v11[35] = MEMORY[0x263EFFA80];
  v10[36] = @"kPNEnableChapterValidator";
  v10[37] = @"kPNChapterValidatorMatchingRatioThresholdPerShotForFocusedChapters";
  v11[36] = MEMORY[0x263EFFA80];
  v11[37] = &unk_27076A058;
  v10[38] = @"kPNChapterValidatorMinimumRatioOfMatchingShotsForFocusedChapters";
  v10[39] = @"kPNChapterValidatorMinimumNumberOfMatchingShotsForFocusedChapters";
  v11[38] = &unk_27076A018;
  v11[39] = &unk_27076A248;
  v10[40] = @"kPNChapterValidatorMinimumRatioOfNonoverlappingAssetsForDistinctShot";
  v10[41] = @"kPNChapterValidatorMinimumNumberOfRetrievedFilteredAssetPerChapter";
  v11[40] = &unk_27076A018;
  v11[41] = &unk_27076A230;
  v10[42] = @"kPNChapterValidatorMinimumCoverageOfStoryAssetsInFinalChapters";
  v10[43] = @"kPNPromotePlayableAssetsInStories";
  v11[42] = &unk_27076A018;
  v11[43] = MEMORY[0x263EFFA88];
  v10[44] = @"kPNShufflePromptParameters";
  v10[45] = @"kPNEnableStorytellingMomentFiltering";
  v11[44] = MEMORY[0x263EFFA88];
  v11[45] = MEMORY[0x263EFFA88];
  v10[46] = @"kPNDontSplitMomentsAcrossChaptersForImplicitMontage";
  v10[47] = @"kPNEnableTraitDeduping";
  v11[46] = MEMORY[0x263EFFA88];
  v11[47] = MEMORY[0x263EFFA80];
  v10[48] = @"PNUseStillAssetsOnlyInBackgound";
  v10[49] = @"PNEnableMockRateLimitingError";
  v11[48] = MEMORY[0x263EFFA80];
  v11[49] = MEMORY[0x263EFFA80];
  v10[50] = @"PNEnableMockNetworkError";
  v10[51] = @"PNEnableMockServerRequestTimeout";
  v11[50] = MEMORY[0x263EFFA80];
  v11[51] = MEMORY[0x263EFFA80];
  v10[52] = @"PNEnableGeneralMCError";
  v10[53] = @"kPNTripHighlightRepresentativeAssetsThreshold";
  v11[52] = MEMORY[0x263EFFA80];
  v11[53] = &unk_27076A068;
  v10[54] = @"PNPromptRankingParameters";
  v8[0] = @"weightForAction";
  v8[1] = @"weightForPerson";
  v9[0] = &unk_27076A078;
  v9[1] = &unk_27076A088;
  v8[2] = @"weightForPersonRelationship";
  v8[3] = @"weightForPlace";
  v9[2] = &unk_27076A088;
  v9[3] = &unk_27076A068;
  v8[4] = @"weightForCity";
  v8[5] = @"weightForTrait";
  v9[4] = &unk_27076A068;
  v9[5] = &unk_27076A078;
  v8[6] = @"defaultEmbeddingDistanceThreshold";
  v8[7] = @"MinimumEmbeddingDistanceThreshold";
  v9[6] = &unk_270769FE8;
  v9[7] = &unk_27076A098;
  v8[8] = @"embeddingDistanceThresholdDecrement";
  v8[9] = @"defaultMetadataDistanceThreshold";
  v9[8] = &unk_27076A0A8;
  v9[9] = &unk_27076A0B8;
  v8[10] = @"minimumMetadataDistanceThreshold";
  v8[11] = @"metadataDistanceThresholdDecrement";
  v9[10] = &unk_27076A0C8;
  v9[11] = &unk_27076A0A8;
  v8[12] = @"promptComparisonCount";
  v9[12] = &unk_27076A260;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:13];
  v11[54] = v5;
  v11[55] = &unk_27076A278;
  v10[55] = @"PNPromptValidationAssetCountThreshold";
  v10[56] = @"PNPromptValidationOfflineLLMQUEnabled";
  v11[56] = v3;
  v11[57] = &unk_27076A290;
  v10[57] = @"PNGlobalTraitsModelVersion";
  v10[58] = @"PNStorytellerModelVersion";
  v11[58] = &unk_27076A290;
  v11[59] = &unk_27076A290;
  v10[59] = @"PNAssetCurationModelVersion";
  v10[60] = @"PNGlobalTraitsUseMomentValidation";
  v11[60] = v4;
  v11[61] = &unk_27076A248;
  v10[61] = @"PNGlobalTraitsNumberOfTraitsForMomentOverlap";
  v10[62] = @"PNGlobalTraitsUseSemanticSimilarity";
  v11[62] = v4;
  v11[63] = &unk_27076A098;
  v10[63] = @"PNGlobalTraitsMaximumTextSimilarityScore";
  v10[64] = @"PNGlobalTraitsUseAPhotoOfBeforeTrait";
  v11[64] = v4;
  v10[65] = @"PNUseLanguageDetectionLexiconFallback";
  v11[65] = v4;
  v10[66] = @"PNUseUnsupportedCharactersDetection";
  v11[66] = v3;
  v10[67] = @"PNUseQueryAnnotationPromptBindingPersonAndPetNames";
  v11[67] = v3;
  v10[68] = @"PNUsePromptBindingRankedPeopleHome";
  v11[68] = v3;
  v10[69] = @"PNQueryAnnotationEnableLocationPromptBinding";
  v11[69] = v4;
  v10[70] = @"PNUseQueryAnnotationPromptBindingNumberOfPersonAndPetNames";
  v11[70] = &unk_27076A230;
  v10[71] = @"PNUseQueryAnnotationPromptBindingNumberOfLocationNames";
  v11[71] = &unk_27076A230;
  v10[72] = @"PNUseMultilingualSafety";
  v11[72] = v3;
  v10[73] = @"PNMinimumCumulativeDistributionOfMomentFrequency";
  v11[73] = &unk_27076A0B8;
  v10[74] = @"PNUseNormalDistributionForMoments";
  v11[74] = v3;
  v10[75] = @"kPNNumberOfEventSuggestions";
  v11[75] = &unk_27076A2A8;
  v10[76] = @"kPNUseOtherQueryTokenAssetsForEventDisambiguation";
  v11[76] = v4;
  v10[77] = @"kPNMinimumNumberOfLongTrips";
  v11[77] = &unk_27076A200;
  v10[78] = @"kPNMemoryStoryNextStyleIndex";
  v11[78] = &unk_27076A2C0;
  v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:79];
  [v2 registerDefaults:v6];

  v7 = (void *)xpc_copy_entitlement_for_self();
  if (v7 == (void *)MEMORY[0x263EF8698]) {
    +[LLMDefaults setupDefaultBackendWithRemoveUserOverwrite:0 enableLogging:0];
  }
}

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PNUserDefaults;
  objc_msgSendSuper2(&v3, sel_initialize);
  [a1 _registerDefaults];
}

+ (int64_t)generateNextStoryTitleStyleIndex
{
  id v2 = a1;
  objc_sync_enter(v2);
  objc_super v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v4 = [v3 integerForKey:@"kPNMemoryStoryNextStyleIndex"];

  v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 setInteger:v4 + 1 forKey:@"kPNMemoryStoryNextStyleIndex"];

  objc_sync_exit(v2);
  return v4;
}

+ (NSString)eventElectionMode
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_super v3 = [v2 stringForKey:@"PNEventElectionMode"];

  return (NSString *)v3;
}

+ (BOOL)useNormalDistributionForMoments
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseNormalDistributionForMoments"];

  return v3;
}

+ (double)minimumCumulativeDistributionOfMomentFrequency
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"PNMinimumCumulativeDistributionOfMomentFrequency"];
  double v4 = v3;

  return v4;
}

+ (BOOL)useMultilingualSafety
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseMultilingualSafety"];

  return v3;
}

+ (BOOL)useUnsupportedCharactersDetection
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseUnsupportedCharactersDetection"];

  return v3;
}

+ (BOOL)useLanguageDetectionLexiconFallback
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseLanguageDetectionLexiconFallback"];

  return v3;
}

+ (BOOL)globalTraitsUseAPhotoOfBeforeTrait
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNGlobalTraitsUseAPhotoOfBeforeTrait"];

  return v3;
}

+ (NSNumber)globalTraitsMaximumTextSimilarityScore
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"PNGlobalTraitsMaximumTextSimilarityScore"];

  return (NSNumber *)v3;
}

+ (BOOL)globalTraitsUseSemanticSimilarity
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNGlobalTraitsUseSemanticSimilarity"];

  return v3;
}

+ (int64_t)globalTraitsNumberOfTraitsForMomentOverlap
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNGlobalTraitsNumberOfTraitsForMomentOverlap"];

  return v3;
}

+ (BOOL)globalTraitsUseMomentValidation
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNGlobalTraitsUseMomentValidation"];

  return v3;
}

+ (NSString)assetCurationLocale
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PNAssetCurationLocale"];

  return (NSString *)v3;
}

+ (NSString)storytellerLocale
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PNStorytellerLocale"];

  return (NSString *)v3;
}

+ (NSString)globalTraitsLocale
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PNGlobalTraitsLocale"];

  return (NSString *)v3;
}

+ (int64_t)assetCurationModelVersion
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNAssetCurationModelVersion"];

  return v3;
}

+ (int64_t)storytellerModelVersion
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNStorytellerModelVersion"];

  return v3;
}

+ (int64_t)globalTraitsModelVersion
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNGlobalTraitsModelVersion"];

  return v3;
}

+ (BOOL)enableMockGeneralMCError
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNEnableGeneralMCError"];

  return v3;
}

+ (BOOL)enableMockServerRequestTimeout
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNEnableMockServerRequestTimeout"];

  return v3;
}

+ (BOOL)enableMockNotEnoughAssetsError
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNEnableMockNotEnoughAssetsError"];

  return v3;
}

+ (BOOL)enableMockNetworkError
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNEnableMockNetworkError"];

  return v3;
}

+ (BOOL)enableMockRateLimitingError
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNEnableMockRateLimitingError"];

  return v3;
}

+ (BOOL)useStillAssetsOnlyInBackgound
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseStillAssetsOnlyInBackgound"];

  return v3;
}

+ (NSString)memoryCreationAvailabilityState
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PNMemoryCreationAvailabilityState"];

  return (NSString *)v3;
}

+ (BOOL)enableTraitDeduping
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPNEnableTraitDeduping"];

  return v3;
}

+ (BOOL)dontSplitMomentsAcrossChaptersForImplicitMontage
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPNDontSplitMomentsAcrossChaptersForImplicitMontage"];

  return v3;
}

+ (NSNumber)chapterCuratorFeatureTypesForDistribution
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"kPNChapterCuratorFeatureTypesForDistribution"];

  return (NSNumber *)v3;
}

+ (BOOL)enableStorytellingMomentFiltering
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPNEnableStorytellingMomentFiltering"];

  return v3;
}

+ (NSString)shufflePromptParametersSeed
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"kPNShufflePromptParametersSeed"];

  return (NSString *)v3;
}

+ (BOOL)shufflePromptParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPNShufflePromptParameters"];

  return v3;
}

+ (BOOL)promotePlayableAssetsInStories
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPNPromotePlayableAssetsInStories"];

  return v3;
}

+ (double)chapterValidatorMinimumCoverageOfStoryAssetsInFinalChapters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNChapterValidatorMinimumCoverageOfStoryAssetsInFinalChapters"];
  double v4 = v3;

  return v4;
}

+ (int64_t)chapterValidatorMinimumNumberOfRetrievedFilteredAssetPerChapter
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"kPNChapterValidatorMinimumNumberOfRetrievedFilteredAssetPerChapter"];

  return v3;
}

+ (double)chapterValidatorMinimumRatioOfNonoverlappingAssetsForDistinctShot
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNChapterValidatorMinimumRatioOfNonoverlappingAssetsForDistinctShot"];
  double v4 = v3;

  return v4;
}

+ (int64_t)chapterValidatorMinimumNumberOfMatchingShotsForFocusedChapters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"kPNChapterValidatorMinimumNumberOfMatchingShotsForFocusedChapters"];

  return v3;
}

+ (double)chapterValidatorMinimumRatioOfMatchingShotsForFocusedChapters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNChapterValidatorMinimumRatioOfMatchingShotsForFocusedChapters"];
  double v4 = v3;

  return v4;
}

+ (double)chapterValidatorMatchingRatioThresholdPerShotForFocusedChapters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNChapterValidatorMatchingRatioThresholdPerShotForFocusedChapters"];
  double v4 = v3;

  return v4;
}

+ (BOOL)enableChapterValidator
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPNEnableChapterValidator"];

  return v3;
}

+ (NSNumber)chapterCurationRandomizerSeed
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"kPNChapterCurationRandomizerSeed"];

  return (NSNumber *)v3;
}

+ (NSNumber)numberOfTraitsToSelect
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"kPNStoryGenerationNumberOfTraitsToSelect"];

  return (NSNumber *)v3;
}

+ (NSNumber)numberOfShotsPerChapter
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"kPNStoryGenerationNumberOfShotsPerChapter"];

  return (NSNumber *)v3;
}

+ (NSNumber)numberOfChaptersPerStory
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"kPNStoryGenerationNumberOfChaptersPerStory"];

  return (NSNumber *)v3;
}

+ (NSNumber)numberOfGlobalTraits
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"kPNStoryGenerationNumberOfGlobalTraits"];

  return (NSNumber *)v3;
}

+ (BOOL)saveVisualClustersToDebugAlbums
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPNSaveVisualClustersToDebugAlbums"];

  return v3;
}

+ (int64_t)visualClusterBasedStoryMode
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"kPNVisualClusterBasedStoryMode"];

  return v3;
}

+ (BOOL)enableMediaAnalysisEmbeddingSearch
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNEnableMediaAnalysisEmbeddingSearch"];

  return v3;
}

+ (BOOL)enableOnDemandCaptionGeneration
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNEnableOnDemandCaptionGeneration"];

  return v3;
}

+ (BOOL)disableLLMAssetCuration
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNDisableLLMAssetCuration"];

  return v3;
}

+ (double)storyMusicCurationTimeoutSeconds
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNStoryMusicCurationTimeoutSeconds"];
  double v4 = v3;

  return v4;
}

+ (NSDictionary)musicKeywordsThimbleParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v3 = [v2 dictionaryForKey:@"PNMusicKeywordsThimbleParameters"];

  return (NSDictionary *)v3;
}

+ (NSDictionary)musicKeywordsPegasusParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v3 = [v2 dictionaryForKey:@"PNMusicKeywordsPegasusParameters"];

  return (NSDictionary *)v3;
}

+ (BOOL)promptValidationOfflineLLMQUEnabled
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNPromptValidationOfflineLLMQUEnabled"];

  return v3;
}

+ (int64_t)promptValidationAssetCountThreshold
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNPromptValidationAssetCountThreshold"];

  return v3;
}

+ (NSDictionary)promptRankingParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 dictionaryForKey:@"PNPromptRankingParameters"];

  return (NSDictionary *)v3;
}

+ (NSDictionary)freeformStoryThimbleParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 dictionaryForKey:@"PNFreeformStoryThimbleParameters"];

  return (NSDictionary *)v3;
}

+ (NSDictionary)freeformStoryPegasusParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 dictionaryForKey:@"PNFreeformStoryPegasusParameters"];

  return (NSDictionary *)v3;
}

+ (NSDictionary)assetCurationThimbleParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 dictionaryForKey:@"PNAssetCurationThimbleParameters"];

  return (NSDictionary *)v3;
}

+ (NSDictionary)assetCurationPegasusParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 dictionaryForKey:@"PNAssetCurationPegasusParameters"];

  return (NSDictionary *)v3;
}

+ (NSDictionary)globalTraitsThimbleParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 dictionaryForKey:@"PNGlobalTraitsThimbleParameters"];

  return (NSDictionary *)v3;
}

+ (NSDictionary)globalTraitsPegasusParameters
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 dictionaryForKey:@"PNGlobalTraitsPegasusParameters"];

  return (NSDictionary *)v3;
}

+ (NSString)fallbackQueryUnderstanding30bModelName
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 stringForKey:@"PNFallbackQueryUnderstanding30bModelName"];

  return (NSString *)v3;
}

+ (BOOL)forceSequentialAssetCurationCalls
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNForceSequentialAssetCurationCalls"];

  return v3;
}

+ (NSNumber)storytellerSelectedTraitsCount
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"PNStorytellerSelectedTraitsCount"];

  return (NSNumber *)v3;
}

+ (NSNumber)globalAndPersonalTraitsSeed
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"PNGlobalAndPersonalTraitsSeed"];

  return (NSNumber *)v3;
}

+ (BOOL)useGMSTemplates
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseGMSTemplates"];

  return v3;
}

+ (BOOL)useGMSStreaming
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseGMSStreaming"];

  return v3;
}

+ (double)assetScopingTokenPromotionLikeliness
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"PNAssetScopingTokenPromotionLikeliness"];
  double v4 = v3;

  return v4;
}

+ (double)tripHighlightRepresentativeAssetsThreshold
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNTripHighlightRepresentativeAssetsThreshold"];
  double v4 = v3;

  return v4;
}

+ (BOOL)enableAssetScopingTokenPromotion
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNEnableAssetScopingTokenPromotion"];

  return v3;
}

+ (NSString)appleMusicMCPrivacyDisclosureState
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PNAppleMusicMCPrivacyDisclosureState"];

  return (NSString *)v3;
}

+ (NSString)appleMusicSmartSearchMode
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PNAppleMusicSmartSearchMode"];

  return (NSString *)v3;
}

+ (NSString)storyMusicMaestroEmbeddingApproach
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PNStoryMusicMaestroEmbeddingApproach"];

  return (NSString *)v3;
}

+ (NSString)mockQUMusic
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 stringForKey:@"PNMockQUMusic"];

  return (NSString *)v3;
}

+ (BOOL)useMockQUMusicForCuration
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseMockQUMusicForCuration"];

  return v3;
}

+ (BOOL)useLLMBasedMusicKeywordGeneration
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseLLMBasedMusicKeywordGeneration"];

  return v3;
}

+ (int64_t)queryPeopleRequiredInRetrievalMomentLimit
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNQueryPeopleRequiredInRetrievalMomentLimit"];

  return v3;
}

+ (int64_t)placeholderAssetFetchMultiplier
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNPlaceholderAssetFetchMultiplier"];

  return v3;
}

+ (int64_t)keyAssetEmbeddingSearchRetrievalLimit
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNKeyAssetEmbeddingSearchRetrievalLimit"];

  return v3;
}

+ (int64_t)shotlistMatchingEmbeddingSearchRetrievalLimit
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNShotlistMatchingEmbeddingSearchRetrievalLimit"];

  return v3;
}

+ (int64_t)globalTraitsMatchingEmbeddingSearchRetrievalLimit
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNGlobalTraitsMatchingEmbeddingSearchRetrievalLimit"];

  return v3;
}

+ (int64_t)globalTraitsScopingEmbeddingSearchRetrievalLimit
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNGlobalTraitsScopingEmbeddingSearchRetrievalLimit"];

  return v3;
}

+ (int64_t)userQueryEmbeddingSearchRetrievalLimit
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNUserQueryEmbeddingSearchRetrievalLimit"];

  return v3;
}

+ (int64_t)maximumNumberOfMomentsForExtendedTokens
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNMaximumNumberOfMomentsForExtendedTokens"];

  return v3;
}

+ (int64_t)maximumNumberOfMomentsForMomentExpansion
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNMaximumNumberOfMomentsForMomentExpansion"];

  return v3;
}

+ (int64_t)maximumNumberOfMomentsForStoryGeneration
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNMaximumNumberOfMomentsForStoryGeneration"];

  return v3;
}

+ (int64_t)maximumNumberOfMomentsForEntireLibraryRetrieval
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNMaximumNumberOfMomentsForEntireLibraryRetrieval"];

  return v3;
}

+ (BOOL)useOtherQueryTokenAssetsForEventDisambiguation
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPNUseOtherQueryTokenAssetsForEventDisambiguation"];

  return v3;
}

+ (int64_t)numberOfEventSuggestions
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"kPNNumberOfEventSuggestions"];

  return v3;
}

+ (NSNumber)storyAssetsFetcherSimilarityThreshold
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 stringForKey:@"PNStoryAssetsFetcherSimilarityThreshold"];

  if ([v3 length])
  {
    double v4 = NSNumber;
    [v3 doubleValue];
    v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v5 = &unk_27076A0D8;
  }

  return (NSNumber *)v5;
}

+ (int64_t)queryAnnotationPromptBindingNumberOfLocationNames
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNUseQueryAnnotationPromptBindingNumberOfLocationNames"];

  return v3;
}

+ (int64_t)queryAnnotationPromptBindingNumberOfPersonAndPetNames
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNUseQueryAnnotationPromptBindingNumberOfPersonAndPetNames"];

  return v3;
}

+ (BOOL)enableLocationPromptBinding
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNQueryAnnotationEnableLocationPromptBinding"];

  return v3;
}

+ (BOOL)usePromptBindingMatchingUserQueryMethod
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUsePromptBindingRankedPeopleHome"];

  return v3;
}

+ (BOOL)useQueryAnnotationPromptBindingPersonAndPetNames
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNUseQueryAnnotationPromptBindingPersonAndPetNames"];

  return v3;
}

+ (int64_t)minimumNumberOfLongTrips
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"kPNMinimumNumberOfLongTrips"];

  return v3;
}

+ (double)shotlistMatchingRetrievalThreshold
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNRetrievalThresholdShotlistMatching"];
  double v4 = v3;

  return v4;
}

+ (double)assetsSelectionUsingOverlappingMomentsThreshold
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNAssetsSelectionUsingOverlappingMomentsThreshold"];
  double v4 = v3;

  return v4;
}

+ (double)globalTraitsRetrievalThreshold
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNRetrievalThresholdGlobalTraits"];
  double v4 = v3;

  return v4;
}

+ (double)globalTraitsScopedAssetsRetrievalThreshold
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"kPNRetrievalThresholdGlobalTraitsScopedAssets"];
  double v4 = v3;

  return v4;
}

+ (double)personalTraitGeneratorMinNumberOfStandardDeviations
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"PNPersonalTraitGeneratorMinNumberOfStandardDeviations"];
  double v4 = v3;

  return v4;
}

+ (double)personalTraitGeneratorMinRatioOfAssets
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"PNPersonalTraitsMinRatioOfAssets"];
  double v4 = v3;

  return v4;
}

+ (int64_t)collectionToStoryContextTokenLimit
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNCollectionToStoryContextTokenLimit"];

  return v3;
}

+ (NSString)fallbackAssetCuration30bModelName
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 stringForKey:@"PNFallbackAssetCuration30bModelName"];

  return (NSString *)v3;
}

+ (NSString)fallbackGlobalTraits30bModelName
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 stringForKey:@"PNFallbackGlobalTraits30bModelName"];

  return (NSString *)v3;
}

+ (NSString)fallbackStorytelling30bModelName
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 stringForKey:@"PNFallbackStorytelling30bModelName"];

  return (NSString *)v3;
}

+ (NSString)fallbackBase30bModelName
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 stringForKey:@"PNFallbackBase30bModelName"];

  return (NSString *)v3;
}

+ (NSString)ajaxDawToken
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 stringForKey:@"PNAjaxDawToken"];

  return (NSString *)v3;
}

+ (BOOL)locationCurationAvoidPeople
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNLocationCurationAvoidPeople"];

  return v3;
}

+ (int64_t)promoterStatusVerifiedPersonLimit
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNPromoterStatusVerifiedPersonLimit"];

  return v3;
}

+ (int64_t)promoterStatusMergeCandidateLimit
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PNPromoterStatusMergeCandidateLimit"];

  return v3;
}

@end