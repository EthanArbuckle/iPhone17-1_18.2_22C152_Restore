@interface PGUserDefaults
+ (BOOL)boundTextFeaturesPerEvent;
+ (BOOL)enableMomentCLIPFeatureGraphIngest;
+ (BOOL)graphConsistencyCheckIsEnabled;
+ (BOOL)graphConsistencyNotificationIsEnabled;
+ (BOOL)isAlwaysShowingHolidayCalendarEvents;
+ (BOOL)isAutonamingDisabled;
+ (BOOL)isAutonamingFilteredOutInferencesIngestAllowed;
+ (BOOL)isAutonamingSignalPropertiesIngestAllowed;
+ (BOOL)isBehavioralCurationEnabled;
+ (BOOL)isMemoriesLivingOnFeedbackEnabled;
+ (BOOL)isMemoriesNotificationDisabled;
+ (BOOL)isMemoryElectionDisabled;
+ (BOOL)isPhotosChallengeEnabled;
+ (BOOL)isPublicEventsEnabled;
+ (BOOL)isRelationshipFilteredOutInferencesIngestAllowed;
+ (BOOL)isRelationshipInferenceDisabled;
+ (BOOL)isRelationshipSignalPropertiesIngestAllowed;
+ (BOOL)isShowingHolidayCalendarEvents;
+ (BOOL)musicCurationAllowExplicitMusicContent;
+ (BOOL)musicCurationShouldUseOldStylePreviewURL;
+ (BOOL)onThisDayHighlightKeyAssetRotationIsEnabled;
+ (BOOL)shouldDisableContentClassificationTask;
+ (BOOL)suppressGraphLiveUpdate;
+ (BOOL)useAOIsInExtendedTokens;
+ (BOOL)useExtendedCurationAssetCountForLocationTitles;
+ (BOOL)useIconicScoreForTrips;
+ (BOOL)useMeaningEdgeForEventLabelingAlgorithm;
+ (BOOL)wallpaperSkipSettlingEffectScoreGating;
+ (NSDictionary)extendedCurationOptions;
+ (double)graphConsistencyPercentageThresholdForTTR;
+ (double)minimumCumulativeDistributionOfAreaFrequency;
+ (double)minimumCumulativeDistributionOfCityFrequency;
+ (double)minimumCumulativeDistributionOfPersonFrequency;
+ (double)minimumCumulativeDistributionOfPersonWithNamedPersonFrequency;
+ (double)minimumCumulativeDistributionOfPersonWithTripFrequency;
+ (double)minimumRatioOfFocusedPersonFacesPerAssetForMultipleFocusedPersonsFacedAssets;
+ (double)relationshipTagMinConfidenceThreshold;
+ (double)usersChildrenInferenceMinimumLifespanYears;
+ (double)usersChildrenInferenceRecencyThresholdFromLatestMomentDateYears;
+ (double)usersPetsInferenceMinimumLifespanYears;
+ (double)usersPetsInferenceRecencyThresholdFromLatestMomentDateYears;
+ (unint64_t)maximumNumberOfFacesPerAssetForSingleFocusedPersonFacedAssets;
+ (unint64_t)maximumNumberOfTextFeaturesPerEvent;
+ (unint64_t)maximumNumberOfVisibleItems;
+ (unint64_t)maximumNumberOfVisibleRegularItems;
+ (unint64_t)minimumNumberOfCuratedAssetsForInterestingMoments;
+ (unint64_t)minimumNumberOfVisibleItems;
+ (void)_registerDefaults;
+ (void)initialize;
+ (void)setExtendedCurationOptions:(id)a3;
@end

@implementation PGUserDefaults

+ (double)minimumCumulativeDistributionOfAreaFrequency
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"minimumCumulativeDistributionOfAreaFrequency"];
  double v4 = v3;

  return v4;
}

+ (double)minimumCumulativeDistributionOfCityFrequency
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"minimumCumulativeDistributionOfCityFrequency"];
  double v4 = v3;

  return v4;
}

+ (double)minimumCumulativeDistributionOfPersonWithTripFrequency
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"minimumCumulativeDistributionOfPersonWithTripFrequency"];
  double v4 = v3;

  return v4;
}

+ (double)minimumCumulativeDistributionOfPersonWithNamedPersonFrequency
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"minimumCumulativeDistributionOfPersonWithNamedPersonFrequency"];
  double v4 = v3;

  return v4;
}

+ (double)minimumCumulativeDistributionOfPersonFrequency
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"minimumCumulativeDistributionOfPersonFrequency"];
  double v4 = v3;

  return v4;
}

+ (BOOL)useAOIsInExtendedTokens
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"useAOIsInExtendedTokens"];

  return v3;
}

+ (BOOL)enableMomentCLIPFeatureGraphIngest
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enableMomentCLIPFeatureGraphIngest"];

  return v3;
}

+ (double)usersPetsInferenceMinimumLifespanYears
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"usersPetsInferenceMinimumLifespanYears"];
  double v4 = v3;

  return v4;
}

+ (double)usersPetsInferenceRecencyThresholdFromLatestMomentDateYears
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"usersPetsInferenceRecencyThresholdYears"];
  double v4 = v3;

  return v4;
}

+ (double)usersChildrenInferenceMinimumLifespanYears
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"usersChildrenInferenceMinimumLifespanYears"];
  double v4 = v3;

  return v4;
}

+ (double)usersChildrenInferenceRecencyThresholdFromLatestMomentDateYears
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"usersChildrenInferenceRecencyThresholdYears"];
  double v4 = v3;

  return v4;
}

+ (BOOL)wallpaperSkipSettlingEffectScoreGating
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PGWallpaperSkipSettlingEffectScoreGating"];

  return v3;
}

+ (BOOL)useIconicScoreForTrips
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PGCuratedLibraryTripKeyAssetUseIconicScore"];

  return v3;
}

+ (double)relationshipTagMinConfidenceThreshold
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"PGRelationshipTagMinConfidenceThreshold"];
  double v4 = v3;

  return v4;
}

+ (BOOL)useMeaningEdgeForEventLabelingAlgorithm
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PGUseMeaningEdgeForEventLabelingAlgorithm"];

  return v3;
}

+ (BOOL)shouldDisableContentClassificationTask
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PGShouldDisableContentClassificationTask"];

  return v3;
}

+ (BOOL)musicCurationAllowExplicitMusicContent
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPGMusicCurationAllowExplicitMusicContent"];

  return v3;
}

+ (BOOL)musicCurationShouldUseOldStylePreviewURL
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPGMusicCurationShouldUseOldStylePreviewURL"];

  return v3;
}

+ (unint64_t)minimumNumberOfVisibleItems
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 valueForKey:@"PGMinimumNumberOfVisibleItems"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

+ (unint64_t)maximumNumberOfVisibleItems
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 valueForKey:@"PGMaximumNumberOfVisibleItems"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

+ (unint64_t)maximumNumberOfVisibleRegularItems
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 valueForKey:@"PGMaximumNumberOfVisibleRegularItems"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

+ (void)setExtendedCurationOptions:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"extendedCurationOptions"];
}

+ (NSDictionary)extendedCurationOptions
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 objectForKey:@"extendedCurationOptions"];

  return (NSDictionary *)v3;
}

+ (BOOL)isPhotosChallengeEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"photosChallengeProfileEnabled"];

  return v3;
}

+ (BOOL)isBehavioralCurationEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"behavioralCurationEnabled"];

  return v3;
}

+ (BOOL)onThisDayHighlightKeyAssetRotationIsEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PGOnThisDayHighlightKeyAssetRotationIsEnabled"];

  return v3;
}

+ (double)graphConsistencyPercentageThresholdForTTR
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"PGGraphConsistencyPercentageThresholdForTTR"];
  double v4 = v3;

  return v4;
}

+ (BOOL)graphConsistencyNotificationIsEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PGGraphConsistencyNotificationIsEnabled"];

  return v3;
}

+ (BOOL)graphConsistencyCheckIsEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PGGraphConsistencyCheckIsEnabled"];

  return v3;
}

+ (BOOL)suppressGraphLiveUpdate
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PGSuppressGraphLiveUpdate"];

  return v3;
}

+ (BOOL)isMemoryElectionDisabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"disableMemoryElection"];

  return v3;
}

+ (BOOL)isPublicEventsEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"enablePublicEvents"];

  return v3;
}

+ (BOOL)boundTextFeaturesPerEvent
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PGBoundPHTextFeatures"];

  return v3;
}

+ (unint64_t)maximumNumberOfTextFeaturesPerEvent
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 valueForKey:@"PGMaximumNumberOfTextFeaturesPerEvent"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

+ (BOOL)isRelationshipFilteredOutInferencesIngestAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ingestRelationshipFilteredOutInferences"];

  return v3;
}

+ (BOOL)isRelationshipSignalPropertiesIngestAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ingestRelationshipSignalProperties"];

  return v3;
}

+ (BOOL)isRelationshipInferenceDisabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"relationshipInferenceDisabled"];

  return v3;
}

+ (BOOL)isAutonamingFilteredOutInferencesIngestAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ingestAutonamingFilteredOutInferences"];

  return v3;
}

+ (BOOL)isAutonamingSignalPropertiesIngestAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ingestAutonamingSignalProperties"];

  return v3;
}

+ (BOOL)isAutonamingDisabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"autonamingDisabled"];

  return v3;
}

+ (double)minimumRatioOfFocusedPersonFacesPerAssetForMultipleFocusedPersonsFacedAssets
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"PGPeopleMemoryMinimumRatioOfFocusedPersonFacesPerAssetForMultipleFocusedPersonsFacedAssets"];
  double v4 = v3;

  return v4;
}

+ (unint64_t)maximumNumberOfFacesPerAssetForSingleFocusedPersonFacedAssets
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v3 = [v2 valueForKey:@"PGPeopleMemoryMaximumNumberOfFacesPerAssetForSingleFocusedPersonFacedAssets"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

+ (BOOL)isMemoriesLivingOnFeedbackEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v3 = [v2 valueForKey:@"PGMemoriesLivingOnFeedbackEnabled"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

+ (BOOL)isMemoriesNotificationDisabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"notificationDisabled"];

  return v3;
}

+ (unint64_t)minimumNumberOfCuratedAssetsForInterestingMoments
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 valueForKey:@"PGMinimumNumberOfCuratedAssetsForInterestingMoments"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

+ (BOOL)isAlwaysShowingHolidayCalendarEvents
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"alwaysShowHolidayCalendarEvents"];

  return v3;
}

+ (BOOL)isShowingHolidayCalendarEvents
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"showHolidayCalendarEvents"];

  return v3;
}

+ (BOOL)useExtendedCurationAssetCountForLocationTitles
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"kPGUseExtendedCurationAssetCountForLocationTitles"];

  return v3;
}

+ (void)_registerDefaults
{
  v17[42] = *MEMORY[0x1E4F143B8];
  int v2 = _os_feature_enabled_impl();
  if (PGIsAppleInternal_onceToken != -1) {
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
  }
  if (v2) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 5;
  }
  if (v2) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 3;
  }
  uint64_t v5 = PGIsAppleInternal_isAppleInternal;
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  uint64_t v8 = MEMORY[0x1E4F1CC28];
  v17[2] = MEMORY[0x1E4F1CC28];
  v17[3] = &unk_1F28D2DC0;
  v17[0] = MEMORY[0x1E4F1CC38];
  v17[1] = MEMORY[0x1E4F1CC38];
  v17[4] = &unk_1F28D5958;
  v17[5] = MEMORY[0x1E4F1CC38];
  v17[6] = MEMORY[0x1E4F1CC28];
  v17[7] = MEMORY[0x1E4F1CC28];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", v5, @"showHolidayCalendarEvents", @"PGCuratedLibraryTripKeyAssetUseIconicScore", @"alwaysShowHolidayCalendarEvents", @"PGPeopleMemoryMaximumNumberOfFacesPerAssetForSingleFocusedPersonFacedAssets", @"PGPeopleMemoryMinimumRatioOfFocusedPersonFacesPerAssetForMultipleFocusedPersonsFacedAssets", @"enablePublicEvents", @"disableMemoryElection", @"autonamingDisabled", @"ingestAutonamingSignalProperties");
  v17[8] = v9;
  v17[9] = v8;
  v16[9] = @"ingestAutonamingFilteredOutInferences";
  v16[10] = @"relationshipInferenceDisabled";
  v17[10] = v8;
  v16[11] = @"ingestRelationshipSignalProperties";
  v10 = [NSNumber numberWithBool:v5];
  v17[11] = v10;
  v17[12] = v8;
  v16[12] = @"ingestRelationshipFilteredOutInferences";
  v16[13] = @"PGMaximumNumberOfTextFeaturesPerEvent";
  v17[13] = &unk_1F28D2DD8;
  v17[14] = v7;
  v16[14] = @"PGBoundPHTextFeatures";
  v16[15] = @"PGSuppressGraphLiveUpdate";
  v17[15] = v8;
  v17[16] = v8;
  v16[16] = @"PGOnThisDayHighlightKeyAssetRotationIsEnabled";
  v16[17] = @"behavioralCurationEnabled";
  v17[17] = v7;
  v16[18] = @"PGMaximumNumberOfVisibleRegularItems";
  v11 = [NSNumber numberWithUnsignedInteger:v4];
  v17[18] = v11;
  v16[19] = @"PGMaximumNumberOfVisibleItems";
  v12 = [NSNumber numberWithUnsignedInteger:v3];
  v17[19] = v12;
  v17[20] = &unk_1F28D2DF0;
  v16[20] = @"PGMinimumNumberOfVisibleItems";
  v16[21] = @"kPGUseExtendedCurationAssetCountForLocationTitles";
  v17[21] = v7;
  v16[22] = @"photosChallengeProfileEnabled";
  v13 = [NSNumber numberWithBool:v5];
  v17[22] = v13;
  v17[23] = v8;
  v16[23] = @"kPGMusicCurationShouldUseOldStylePreviewURL";
  v16[24] = @"kPGMusicCurationAllowExplicitMusicContent";
  v16[25] = @"PGUseMeaningEdgeForEventLabelingAlgorithm";
  v16[26] = @"PGGraphConsistencyCheckIsEnabled";
  v17[24] = v8;
  v17[25] = v8;
  v16[27] = @"PGGraphConsistencyNotificationIsEnabled";
  v16[28] = @"PGGraphConsistencyPercentageThresholdForTTR";
  v17[26] = v8;
  v17[27] = v8;
  v17[28] = &unk_1F28D5968;
  v16[29] = @"PGRelationshipTagMinConfidenceThreshold";
  v14 = [NSNumber numberWithDouble:1.0];
  v16[30] = @"PGWallpaperSkipSettlingEffectScoreGating";
  v16[31] = @"usersChildrenInferenceRecencyThresholdYears";
  v17[29] = v14;
  v17[30] = v8;
  v17[31] = &unk_1F28D5978;
  v17[32] = &unk_1F28D5988;
  v16[32] = @"usersChildrenInferenceMinimumLifespanYears";
  v16[33] = @"usersPetsInferenceRecencyThresholdYears";
  v17[33] = &unk_1F28D5978;
  v17[34] = &unk_1F28D5998;
  v16[34] = @"usersPetsInferenceMinimumLifespanYears";
  v16[35] = @"enableMomentCLIPFeatureGraphIngest";
  v17[35] = v8;
  v17[36] = v8;
  v16[36] = @"useAOIsInExtendedTokens";
  v16[37] = @"minimumCumulativeDistributionOfPersonFrequency";
  v17[37] = &unk_1F28D59A8;
  v17[38] = &unk_1F28D5958;
  v16[38] = @"minimumCumulativeDistributionOfPersonWithNamedPersonFrequency";
  v16[39] = @"minimumCumulativeDistributionOfPersonWithTripFrequency";
  v17[39] = &unk_1F28D59B8;
  v17[40] = &unk_1F28D59A8;
  v16[40] = @"minimumCumulativeDistributionOfCityFrequency";
  v16[41] = @"minimumCumulativeDistributionOfAreaFrequency";
  v17[41] = &unk_1F28D5958;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:42];
  [v6 registerDefaults:v15];
}

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PGUserDefaults;
  objc_msgSendSuper2(&v3, sel_initialize);
  [a1 _registerDefaults];
}

@end