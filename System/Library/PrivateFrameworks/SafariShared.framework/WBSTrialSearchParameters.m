@interface WBSTrialSearchParameters
+ (BOOL)supportsSecureCoding;
+ (NSArray)searchParameters;
+ (id)codePathUUIDForHideIgnoredSiriSuggestedWebsites;
+ (id)getSearchParametersHelper:(id)a3 withTrial:(id)a4 withCache:(BOOL)a5;
- (BOOL)enableCompletionListHistoryDeduplicationSwitchToTabValue;
- (BOOL)enableCompletionListHistoryDeduplicationValue;
- (BOOL)isCFSearch;
- (BOOL)isDedupeThroughAlternativeURLsEnabled;
- (BOOL)isDuckDuckGoABEnabledForSearchEnginePreferenceObserver:(id)a3;
- (BOOL)isForVoiceSearch;
- (BOOL)isGoogleABEnabledForSearchEnginePreferenceObserver:(id)a3;
- (BOOL)isResultFilteringDisabled;
- (BOOL)shouldEmitTriggerLoggingForHidingIgnoredSiriSuggestedWebsite;
- (BOOL)shouldHideIgnoredSiriSuggestedSites;
- (BOOL)strengthenAutocompleteTriggerExtensionMatching;
- (NSString)codepathIDs;
- (WBSTrialSearchParameters)init;
- (WBSTrialSearchParameters)initWithCoder:(id)a3;
- (WBSTrialSearchParameters)initWithPreferences:(id)a3;
- (WBSTrialSearchParameters)initWithTrial:(BOOL)a3 forPrefs:(id)a4 forTrial:(id)a5;
- (double)CFSearchTimeout;
- (double)normalizedTopSitesScoreAndVisitCountMultiplier;
- (double)percentageThresholdForAnywhereInTitle;
- (double)percentageThresholdForAnywhereInURL;
- (int64_t)characterThresholdForAnywhereInTitleOrURL;
- (int64_t)characterThresholdForStartOfTitle;
- (int64_t)characterThresholdForStartOfTitleWord;
- (int64_t)characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit;
- (int64_t)characterThresholdForStartOfURL;
- (int64_t)characterThresholdForStartOfURLPathComponent;
- (int64_t)matchingWordsInTitleThreshold;
- (int64_t)maxBookmarksAndHistoryItems;
- (int64_t)thresholdForHidingIgnoredSiriSuggestedSites;
- (void)encodeWithCoder:(id)a3;
- (void)setCFSearchTimeout:(double)a3;
- (void)setCharacterThresholdForAnywhereInTitleOrURL:(int64_t)a3;
- (void)setCharacterThresholdForStartOfTitle:(int64_t)a3;
- (void)setCharacterThresholdForStartOfTitleWord:(int64_t)a3;
- (void)setCharacterThresholdForStartOfTitleWordMatchLongEnoughForTopHit:(int64_t)a3;
- (void)setCharacterThresholdForStartOfURL:(int64_t)a3;
- (void)setCharacterThresholdForStartOfURLPathComponent:(int64_t)a3;
- (void)setEnableCompletionListHistoryDeduplicationSwitchToTabValue:(BOOL)a3;
- (void)setEnableCompletionListHistoryDeduplicationValue:(BOOL)a3;
- (void)setIsCFSearch:(BOOL)a3;
- (void)setIsDedupeThroughAlternativeURLsEnabled:(BOOL)a3;
- (void)setIsForVoiceSearch:(BOOL)a3;
- (void)setIsResultFilteringDisabled:(BOOL)a3;
- (void)setMatchingWordsInTitleThreshold:(int64_t)a3;
- (void)setMaxBookmarksAndHistoryItems:(int64_t)a3;
- (void)setNormalizedTopSitesScoreAndVisitCountMultiplier:(double)a3;
- (void)setPercentageThresholdForAnywhereInTitle:(double)a3;
- (void)setPercentageThresholdForAnywhereInURL:(double)a3;
- (void)setStrengthenAutocompleteTriggerExtensionMatching:(BOOL)a3;
- (void)updateUsingPreferenceKeys:(id)a3;
- (void)updateWithDefaults;
- (void)updateWithTrial:(BOOL)a3 forTrial:(id)a4;
@end

@implementation WBSTrialSearchParameters

+ (NSArray)searchParameters
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = +[WBSTrialManager shared];
  v4 = +[WBSTrialSearchParameters getSearchParametersHelper:v2 withTrial:v3 withCache:1];

  return (NSArray *)v4;
}

+ (id)getSearchParametersHelper:(id)a3 withTrial:(id)a4 withCache:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = (void *)standard_params;
  if (!standard_params || !a5)
  {
    v11 = objc_alloc_init(WBSTrialSearchParameters);
    v12 = (void *)standard_params;
    standard_params = (uint64_t)v11;

    v10 = (void *)standard_params;
  }
  [v10 updateUsingPreferenceKeys:v7];
  if (v8 && [v8 isReady] && objc_msgSend(v8, "inExperiment"))
  {
    v13 = (void *)trial_params;
    if (!trial_params || !a5)
    {
      if ([v8 runCFFlow])
      {
        v14 = [[WBSTrialSearchParameters alloc] initWithTrial:1 forPrefs:v7 forTrial:v8];
        [v9 addObject:v14];
      }
      v15 = [[WBSTrialSearchParameters alloc] initWithTrial:0 forPrefs:v7 forTrial:v8];
      [v9 addObject:v15];

      objc_storeStrong((id *)&trial_params, v9);
      v13 = (void *)trial_params;
    }
    id v16 = v13;

    v9 = v16;
  }
  else
  {
    [v9 addObject:standard_params];
  }

  return v9;
}

+ (id)codePathUUIDForHideIgnoredSiriSuggestedWebsites
{
  if (+[WBSTrialSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::onceToken != -1) {
    dispatch_once(&+[WBSTrialSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::onceToken, &__block_literal_global_104);
  }
  v2 = (void *)+[WBSTrialSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::codePathUUID;
  return v2;
}

void __75__WBSTrialSearchParameters_codePathUUIDForHideIgnoredSiriSuggestedWebsites__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"81C7C46C-0C4F-40C3-9527-EC71B259C813"];
  v1 = (void *)+[WBSTrialSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::codePathUUID;
  +[WBSTrialSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::codePathUUID = v0;
}

- (WBSTrialSearchParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSTrialSearchParameters;
  v2 = [(WBSTrialSearchParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(WBSTrialSearchParameters *)v2 updateWithDefaults];
    v4 = v3;
  }

  return v3;
}

- (WBSTrialSearchParameters)initWithPreferences:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSTrialSearchParameters;
  v5 = [(WBSTrialSearchParameters *)&v11 init];
  objc_super v6 = v5;
  if (v5)
  {
    [(WBSTrialSearchParameters *)v5 updateWithDefaults];
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if (v4)
    {
      id v8 = v4;

      id v7 = v8;
    }
    [(WBSTrialSearchParameters *)v6 updateUsingPreferenceKeys:v7];
    v9 = v6;
  }
  return v6;
}

- (void)updateWithDefaults
{
  self->_isCFSearch = 0;
  *(_WORD *)&self->_isProvider1Enabled = 0;
  *(_DWORD *)&self->_isResultFilteringDisabled = 0x1000000;
  *(_WORD *)&self->_enableCompletionListHistoryDeduplicationSwitchToTabValue = 257;
  self->_CFSearchTimeout = 0.06;
  self->_characterThresholdForAnywhereInTitleOrURL = 18;
  *(int64x2_t *)&self->_percentageThresholdForAnywhereInTitle = vdupq_n_s64(0x3FE999999999999AuLL);
  *(_OWORD *)&self->_characterThresholdForStartOfURLPathComponent = xmmword_1A6D5F170;
  *(_OWORD *)&self->_characterThresholdForStartOfTitle = xmmword_1A6D5F180;
  *(_OWORD *)&self->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit = xmmword_1A6D5F190;
  self->_normalizedTopSitesScoreAndVisitCountMultiplier = 4.0;
  self->_maxBookmarksAndHistoryItems = -1;
  self->_thresholdForHidingIgnoredSiriSuggestedSites = -1;
}

- (void)updateUsingPreferenceKeys:(id)a3
{
  id v8 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (v8)
  {
    id v5 = v8;

    id v4 = v5;
  }
  if ([v4 BOOLForKey:@"WBSSearchRelevanceOverrideDefaults"])
  {
    if ([v4 BOOLForKey:@"WBSDisableTrial"])
    {
      self->_isResultFilteringDisabled = [v4 BOOLForKey:@"WBSDebugDisableResultFiltering"];
      self->_isDedupeThroughAlternativeURLsEnabled = [v4 BOOLForKey:@"WBSSearchRelevanceServerAssistedDeduplication"];
      self->_enableCompletionListHistoryDeduplicationValue = [v4 BOOLForKey:@"WBSSearchRelevanceHistoryDeduplication"];
      self->_enableCompletionListHistoryDeduplicationSwitchToTabValue = [v4 BOOLForKey:@"WBSSearchRelevanceHistoryDeduplicationSwitchToTab"];
      int v6 = [v4 BOOLForKey:@"WBSSearchRelevanceDecayResults"];
      double v7 = 0.0;
      if (v6) {
        double v7 = 4.0;
      }
      self->_normalizedTopSitesScoreAndVisitCountMultiplier = v7;
      self->_strengthenAutocompleteTriggerExtensionMatching = [v4 BOOLForKey:@"WBSSearchRelevanceStrengthenAutocompleteTriggerExtensionMatching"];
    }
    if (([v4 BOOLForKey:@"WBSSearchRelevanceOverrideDefaults"] & 1) == 0) {
      [(WBSTrialSearchParameters *)self updateWithDefaults];
    }
  }
}

- (WBSTrialSearchParameters)initWithTrial:(BOOL)a3 forPrefs:(id)a4 forTrial:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WBSTrialSearchParameters;
  v10 = [(WBSTrialSearchParameters *)&v21 init];
  if (v10)
  {
    objc_super v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if (v8)
    {
      id v12 = v8;

      objc_super v11 = v12;
    }
    v13 = [MEMORY[0x1E4F97FE0] sharedObserver];
    [v13 setDelegate:v10];

    [(WBSTrialSearchParameters *)v10 updateWithDefaults];
    v14 = +[WBSTrialManager shared];
    if (v9)
    {
      id v15 = v9;

      v14 = v15;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WBSTrialSearchParameters_initWithTrial_forPrefs_forTrial___block_invoke;
    block[3] = &unk_1E5C8CA70;
    id v16 = v10;
    v20 = v16;
    dispatch_async(MEMORY[0x1E4F14428], block);
    if (([v14 inExperiment] & 1) != 0
      && ([v11 BOOLForKey:@"WBSSearchRelevanceOverrideDefaults"] & 1) == 0
      && ([v11 BOOLForKey:@"WBSDisableTrial"] & 1) == 0)
    {
      [(WBSTrialSearchParameters *)v16 updateWithTrial:v6 forTrial:v14];
    }
    v17 = v16;
  }
  return v10;
}

void __60__WBSTrialSearchParameters_initWithTrial_forPrefs_forTrial___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x1E4F981E8] object:*(void *)(a1 + 32)];
}

- (void)updateWithTrial:(BOOL)a3 forTrial:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  BOOL v6 = +[WBSTrialManager shared];
  if (v13)
  {
    id v7 = v13;

    BOOL v6 = v7;
  }
  if (v4)
  {
    self->_isCFSearch = 1;
    [v6 CFSearchTimeoutForDefault:0.06];
    self->_CFSearchTimeout = v8;
  }
  self->_isProvider1Enabled = [v6 getBoolFactor:@"enableProvider1" forCF:0 forDefault:0];
  self->_isProvider2Enabled = [v6 getBoolFactor:@"enableProvider2" forCF:0 forDefault:0];
  self->_isDedupeThroughAlternativeURLsEnabled = [v6 getBoolFactor:@"enableDedupeThroughAlternativeURLs" forCF:v4 forDefault:0];
  self->_strengthenAutocompleteTriggerExtensionMatching = [v6 getBoolFactor:@"strengthenAutocompleteTriggerExtensionMatching" forCF:v4 forDefault:0];
  self->_enableCompletionListHistoryDeduplicationValue = [v6 getBoolFactor:@"enableCompletionListHistoryDeduplication" forCF:v4 forDefault:1];
  self->_characterThresholdForAnywhereInTitleOrURL = [v6 getIntFactor:@"characterThresholdForAnywhereInTitleOrURL" forCF:v4 forDefault:18];
  [v6 getFloatFactor:@"percentageThresholdForAnywhereInTitle" forCF:v4 forDefault:0.8];
  self->_percentageThresholdForAnywhereInTitle = v9;
  [v6 getFloatFactor:@"percentageThresholdForAnywhereInURL" forCF:v4 forDefault:0.8];
  self->_percentageThresholdForAnywhereInURL = v10;
  self->_characterThresholdForStartOfURLPathComponent = (uint64_t)(double)[v6 getIntFactor:@"characterThresholdForStartOfURLPathComponent" forCF:v4 forDefault:4];
  self->_matchingWordsInTitleThreshold = [v6 getIntFactor:@"matchingWordsInTitleThreshold" forCF:v4 forDefault:3];
  self->_characterThresholdForStartOfTitle = (uint64_t)(double)[v6 getIntFactor:@"characterThresholdForStartOfTitle" forCF:v4 forDefault:3];
  self->_characterThresholdForStartOfTitleWord = (uint64_t)(double)[v6 getIntFactor:@"characterThresholdForStartOfTitleWord" forCF:v4 forDefault:4];
  self->_characterThresholdForStartOfURL = (uint64_t)(double)[v6 getIntFactor:@"characterThresholdForStartOfURL" forCF:v4 forDefault:3];
  self->_normalizedTopSitesScoreAndVisitCountMultiplier = (double)[v6 getIntFactor:@"normalizedTopSitesScoreAndVisitCountMultiplier" forCF:v4 forDefault:4];
  self->_maxBookmarksAndHistoryItems = [v6 getIntFactor:@"maxBookmarksAndHistoryItems" forCF:v4 forDefault:-1];
  self->_thresholdForHidingIgnoredSiriSuggestedSites = [v6 getIntFactor:@"thresholdForHidingIgnoredSiriSuggestedSites" forCF:v4 forDefault:-1];
  self->_shouldHideIgnoredSiriSuggestedSites = [v6 getBoolFactor:@"shouldHideIgnoredSiriSuggestedSites" forCF:v4 forDefault:1];
  objc_super v11 = [v6 stringFactorWithName:@"codepathIDs"];
  codepathIDs = self->_codepathIDs;
  self->_codepathIDs = v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSTrialSearchParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSTrialSearchParameters;
  id v5 = [(WBSTrialSearchParameters *)&v14 init];
  if (v5)
  {
    v5->_isCFSearch = [v4 decodeBoolForKey:@"isCFSearch"];
    [v4 decodeFloatForKey:@"CFSearchTimeout"];
    v5->_CFSearchTimeout = v6;
    v5->_isProvider1Enabled = [v4 decodeBoolForKey:@"isProvider1Enabled"];
    v5->_isProvider2Enabled = [v4 decodeBoolForKey:@"isProvider2Enabled"];
    v5->_isResultFilteringDisabled = [v4 decodeBoolForKey:@"isResultFilteringDisabled"];
    v5->_isDedupeThroughAlternativeURLsEnabled = [v4 decodeBoolForKey:@"isDedupeThroughAlternativeURLsEnabled"];
    v5->_strengthenAutocompleteTriggerExtensionMatching = [v4 decodeBoolForKey:@"strengthenAutocompleteTriggerExtensionMatching"];
    v5->_enableCompletionListHistoryDeduplicationValue = [v4 decodeBoolForKey:@"enableCompletionListHistoryDeduplicationValue"];
    v5->_enableCompletionListHistoryDeduplicationSwitchToTabValue = [v4 decodeBoolForKey:@"enableCompletionListHistoryDeduplicationSwitchToTabValue"];
    v5->_characterThresholdForAnywhereInTitleOrURL = [v4 decodeIntegerForKey:@"characterThresholdForAnywhereInTitleOrURL"];
    [v4 decodeFloatForKey:@"percentageThresholdForAnywhereInTitle"];
    v5->_percentageThresholdForAnywhereInTitle = v7;
    [v4 decodeFloatForKey:@"percentageThresholdForAnywhereInURL"];
    v5->_percentageThresholdForAnywhereInURL = v8;
    v5->_characterThresholdForStartOfURLPathComponent = [v4 decodeIntegerForKey:@"characterThresholdForStartOfURLPathComponent"];
    v5->_matchingWordsInTitleThreshold = [v4 decodeIntegerForKey:@"matchingWordsInTitleThreshold"];
    v5->_characterThresholdForStartOfTitle = [v4 decodeIntegerForKey:@"characterThresholdForStartOfTitle"];
    v5->_characterThresholdForStartOfTitleWord = [v4 decodeIntegerForKey:@"characterThresholdForStartOfTitleWord"];
    v5->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit = [v4 decodeIntegerForKey:@"characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit"];
    v5->_characterThresholdForStartOfURL = [v4 decodeIntegerForKey:@"characterThresholdForStartOfURL"];
    v5->_maxBookmarksAndHistoryItems = [v4 decodeIntegerForKey:@"maxBookmarksAndHistoryItems"];
    [v4 decodeFloatForKey:@"normalizedTopSitesScoreAndVisitCountMultiplier"];
    v5->_normalizedTopSitesScoreAndVisitCountMultiplier = v9;
    v5->_thresholdForHidingIgnoredSiriSuggestedSites = [v4 decodeIntegerForKey:@"thresholdForHidingIgnoredSiriSuggestedSites"];
    v5->_shouldHideIgnoredSiriSuggestedSites = [v4 decodeBoolForKey:@"shouldHideIgnoredSiriSuggestedSites"];
    uint64_t v10 = [v4 decodeObjectForKey:@"codepathIDs"];
    codepathIDs = v5->_codepathIDs;
    v5->_codepathIDs = (NSString *)v10;

    id v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeBool:self->_isCFSearch forKey:@"isCFSearch"];
  double CFSearchTimeout = self->_CFSearchTimeout;
  *(float *)&double CFSearchTimeout = CFSearchTimeout;
  [v8 encodeFloat:@"CFSearchTimeout" forKey:CFSearchTimeout];
  [v8 encodeBool:self->_isProvider1Enabled forKey:@"isProvider1Enabled"];
  [v8 encodeBool:self->_isProvider2Enabled forKey:@"isProvider2Enabled"];
  [v8 encodeBool:self->_isResultFilteringDisabled forKey:@"isResultFilteringDisabled"];
  [v8 encodeBool:self->_isDedupeThroughAlternativeURLsEnabled forKey:@"isDedupeThroughAlternativeURLsEnabled"];
  [v8 encodeBool:self->_strengthenAutocompleteTriggerExtensionMatching forKey:@"strengthenAutocompleteTriggerExtensionMatching"];
  [v8 encodeBool:self->_enableCompletionListHistoryDeduplicationValue forKey:@"enableCompletionListHistoryDeduplicationValue"];
  [v8 encodeBool:self->_enableCompletionListHistoryDeduplicationSwitchToTabValue forKey:@"enableCompletionListHistoryDeduplicationSwitchToTabValue"];
  [v8 encodeInteger:self->_characterThresholdForAnywhereInTitleOrURL forKey:@"characterThresholdForAnywhereInTitleOrURL"];
  double percentageThresholdForAnywhereInTitle = self->_percentageThresholdForAnywhereInTitle;
  *(float *)&double percentageThresholdForAnywhereInTitle = percentageThresholdForAnywhereInTitle;
  [v8 encodeFloat:@"percentageThresholdForAnywhereInTitle" forKey:percentageThresholdForAnywhereInTitle];
  double percentageThresholdForAnywhereInURL = self->_percentageThresholdForAnywhereInURL;
  *(float *)&double percentageThresholdForAnywhereInURL = percentageThresholdForAnywhereInURL;
  [v8 encodeFloat:@"percentageThresholdForAnywhereInURL" forKey:percentageThresholdForAnywhereInURL];
  [v8 encodeInteger:self->_characterThresholdForStartOfURLPathComponent forKey:@"characterThresholdForStartOfURLPathComponent"];
  [v8 encodeInteger:self->_matchingWordsInTitleThreshold forKey:@"matchingWordsInTitleThreshold"];
  [v8 encodeInteger:self->_characterThresholdForStartOfTitle forKey:@"characterThresholdForStartOfTitle"];
  [v8 encodeInteger:self->_characterThresholdForStartOfTitleWord forKey:@"characterThresholdForStartOfTitleWord"];
  [v8 encodeInteger:self->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit forKey:@"characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit"];
  [v8 encodeInteger:self->_characterThresholdForStartOfURL forKey:@"characterThresholdForStartOfURL"];
  [v8 encodeInteger:self->_maxBookmarksAndHistoryItems forKey:@"maxBookmarksAndHistoryItems"];
  double normalizedTopSitesScoreAndVisitCountMultiplier = self->_normalizedTopSitesScoreAndVisitCountMultiplier;
  *(float *)&double normalizedTopSitesScoreAndVisitCountMultiplier = normalizedTopSitesScoreAndVisitCountMultiplier;
  [v8 encodeFloat:@"normalizedTopSitesScoreAndVisitCountMultiplier" forKey:normalizedTopSitesScoreAndVisitCountMultiplier];
  [v8 encodeInteger:self->_thresholdForHidingIgnoredSiriSuggestedSites forKey:@"thresholdForHidingIgnoredSiriSuggestedSites"];
  [v8 encodeBool:self->_shouldHideIgnoredSiriSuggestedSites forKey:@"shouldHideIgnoredSiriSuggestedSites"];
  [v8 encodeObject:self->_codepathIDs forKey:@"codepathIDs"];
}

- (BOOL)isGoogleABEnabledForSearchEnginePreferenceObserver:(id)a3
{
  return self->_isProvider1Enabled;
}

- (BOOL)isDuckDuckGoABEnabledForSearchEnginePreferenceObserver:(id)a3
{
  return self->_isProvider2Enabled;
}

- (BOOL)shouldEmitTriggerLoggingForHidingIgnoredSiriSuggestedWebsite
{
  return [(NSString *)self->_codepathIDs containsString:@"81C7C46C-0C4F-40C3-9527-EC71B259C813"];
}

- (BOOL)isCFSearch
{
  return self->_isCFSearch;
}

- (void)setIsCFSearch:(BOOL)a3
{
  self->_isCFSearch = a3;
}

- (double)CFSearchTimeout
{
  return self->_CFSearchTimeout;
}

- (void)setCFSearchTimeout:(double)a3
{
  self->_double CFSearchTimeout = a3;
}

- (BOOL)isForVoiceSearch
{
  return self->_isForVoiceSearch;
}

- (void)setIsForVoiceSearch:(BOOL)a3
{
  self->_isForVoiceSearch = a3;
}

- (BOOL)isResultFilteringDisabled
{
  return self->_isResultFilteringDisabled;
}

- (void)setIsResultFilteringDisabled:(BOOL)a3
{
  self->_isResultFilteringDisabled = a3;
}

- (BOOL)isDedupeThroughAlternativeURLsEnabled
{
  return self->_isDedupeThroughAlternativeURLsEnabled;
}

- (void)setIsDedupeThroughAlternativeURLsEnabled:(BOOL)a3
{
  self->_isDedupeThroughAlternativeURLsEnabled = a3;
}

- (BOOL)strengthenAutocompleteTriggerExtensionMatching
{
  return self->_strengthenAutocompleteTriggerExtensionMatching;
}

- (void)setStrengthenAutocompleteTriggerExtensionMatching:(BOOL)a3
{
  self->_strengthenAutocompleteTriggerExtensionMatching = a3;
}

- (BOOL)enableCompletionListHistoryDeduplicationValue
{
  return self->_enableCompletionListHistoryDeduplicationValue;
}

- (void)setEnableCompletionListHistoryDeduplicationValue:(BOOL)a3
{
  self->_enableCompletionListHistoryDeduplicationValue = a3;
}

- (BOOL)enableCompletionListHistoryDeduplicationSwitchToTabValue
{
  return self->_enableCompletionListHistoryDeduplicationSwitchToTabValue;
}

- (void)setEnableCompletionListHistoryDeduplicationSwitchToTabValue:(BOOL)a3
{
  self->_enableCompletionListHistoryDeduplicationSwitchToTabValue = a3;
}

- (int64_t)characterThresholdForAnywhereInTitleOrURL
{
  return self->_characterThresholdForAnywhereInTitleOrURL;
}

- (void)setCharacterThresholdForAnywhereInTitleOrURL:(int64_t)a3
{
  self->_characterThresholdForAnywhereInTitleOrURL = a3;
}

- (double)percentageThresholdForAnywhereInTitle
{
  return self->_percentageThresholdForAnywhereInTitle;
}

- (void)setPercentageThresholdForAnywhereInTitle:(double)a3
{
  self->_double percentageThresholdForAnywhereInTitle = a3;
}

- (double)percentageThresholdForAnywhereInURL
{
  return self->_percentageThresholdForAnywhereInURL;
}

- (void)setPercentageThresholdForAnywhereInURL:(double)a3
{
  self->_double percentageThresholdForAnywhereInURL = a3;
}

- (int64_t)characterThresholdForStartOfURLPathComponent
{
  return self->_characterThresholdForStartOfURLPathComponent;
}

- (void)setCharacterThresholdForStartOfURLPathComponent:(int64_t)a3
{
  self->_characterThresholdForStartOfURLPathComponent = a3;
}

- (int64_t)matchingWordsInTitleThreshold
{
  return self->_matchingWordsInTitleThreshold;
}

- (void)setMatchingWordsInTitleThreshold:(int64_t)a3
{
  self->_matchingWordsInTitleThreshold = a3;
}

- (int64_t)characterThresholdForStartOfTitle
{
  return self->_characterThresholdForStartOfTitle;
}

- (void)setCharacterThresholdForStartOfTitle:(int64_t)a3
{
  self->_characterThresholdForStartOfTitle = a3;
}

- (int64_t)characterThresholdForStartOfTitleWord
{
  return self->_characterThresholdForStartOfTitleWord;
}

- (void)setCharacterThresholdForStartOfTitleWord:(int64_t)a3
{
  self->_characterThresholdForStartOfTitleWord = a3;
}

- (int64_t)characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit
{
  return self->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit;
}

- (void)setCharacterThresholdForStartOfTitleWordMatchLongEnoughForTopHit:(int64_t)a3
{
  self->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit = a3;
}

- (int64_t)characterThresholdForStartOfURL
{
  return self->_characterThresholdForStartOfURL;
}

- (void)setCharacterThresholdForStartOfURL:(int64_t)a3
{
  self->_characterThresholdForStartOfURL = a3;
}

- (double)normalizedTopSitesScoreAndVisitCountMultiplier
{
  return self->_normalizedTopSitesScoreAndVisitCountMultiplier;
}

- (void)setNormalizedTopSitesScoreAndVisitCountMultiplier:(double)a3
{
  self->_double normalizedTopSitesScoreAndVisitCountMultiplier = a3;
}

- (int64_t)maxBookmarksAndHistoryItems
{
  return self->_maxBookmarksAndHistoryItems;
}

- (void)setMaxBookmarksAndHistoryItems:(int64_t)a3
{
  self->_maxBookmarksAndHistoryItems = a3;
}

- (int64_t)thresholdForHidingIgnoredSiriSuggestedSites
{
  return self->_thresholdForHidingIgnoredSiriSuggestedSites;
}

- (BOOL)shouldHideIgnoredSiriSuggestedSites
{
  return self->_shouldHideIgnoredSiriSuggestedSites;
}

- (NSString)codepathIDs
{
  return self->_codepathIDs;
}

- (void).cxx_destruct
{
}

@end