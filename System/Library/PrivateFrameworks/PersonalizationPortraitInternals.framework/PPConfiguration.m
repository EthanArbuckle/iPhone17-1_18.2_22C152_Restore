@interface PPConfiguration
+ (id)sharedInstance;
+ (void)reload;
- (BOOL)enableECRMessageTokenCountsPlugin;
- (BOOL)flattenNamedEntitiesForCoreML;
- (BOOL)flattenTopicsForCoreML;
- (BOOL)isMultilingual;
- (BOOL)locationFeedbackUsesCoreML;
- (BOOL)locationScoringUsesCoreML;
- (BOOL)locationScoringUsesHybrid;
- (BOOL)namedEntityFeedbackUsesCoreML;
- (BOOL)namedEntityScoringUsesCoreML;
- (BOOL)namedEntityScoringUsesHybrid;
- (BOOL)notificationExtractionEnabled;
- (BOOL)portraitMusicDataCollectionCollectNonAMPNowPlaying;
- (BOOL)safariDataDetectorsEnabledForHighMemoryDevices;
- (BOOL)safariDonationTitleExtractionEnabled;
- (BOOL)skipInsignificantEmailExtractions;
- (BOOL)storeNewExtractions;
- (BOOL)topicFeedbackUsesCoreML;
- (BOOL)topicMappingUsesCoreML;
- (BOOL)topicScoringUsesCoreML;
- (BOOL)topicScoringUsesHybrid;
- (BOOL)use2StageScoreInterpreterForLocationScoring;
- (BOOL)use2StageScoreInterpreterForNEScoring;
- (BOOL)use2StageScoreInterpreterForTPScoring;
- (BOOL)useCachedPortraitScores;
- (BOOL)useRawNEExtractionScores;
- (PPConfiguration)initWithTrialWrapper:(id)a3;
- (double)decayedFeedbackCountsHalfLifeDays;
- (double)halfValuePosition;
- (double)locationDecayHalfLifeSeconds;
- (double)mapsSearchQueryFromDateInterval;
- (double)maxEmailHarvestingEligiblityInterval;
- (double)namedEntityDecayHalfLifeSeconds;
- (double)navigationMinimumTimeInterval;
- (double)nonReaderTextWeight;
- (double)portraitAnalyticsSamplingRate;
- (double)portraitMusicDataCollectionSamplingRateForAMP;
- (double)portraitMusicDataCollectionSamplingRateForCTS;
- (double)routineExtractionScoreCountWeight;
- (double)routineExtractionScoreDecayHalfLifeDays;
- (double)routineExtractionScoreDurationWeight;
- (double)scoreThreshold;
- (double)socialHighlightCacheTimeoutInterval;
- (double)socialHighlightDecayInterval;
- (double)socialHighlightFeedbackDeletionInterval;
- (double)socialHighlightMetricReportingInterval;
- (double)socialHighlightRankedStorageMaxAge;
- (double)sportsMetricsSamplingRate;
- (double)topicDecayHalfLifeSeconds;
- (double)topicMappingCoreMLThreshold;
- (float)feedbackSessionLogsExtractionsSamplingRate;
- (float)feedbackSessionLogsSamplingRate;
- (float)recordSourceContactsInitialScore;
- (float)recordSourceNonContactsInitialScore;
- (float)remoteTopicsMultiplier;
- (float)scoreThresholdForLocation;
- (float)scoreThresholdForNamedEntity;
- (float)scoreThresholdForTopic;
- (float)topicsMultiplierForBundleId:(id)a3 algorithm:(unint64_t)a4;
- (id)_algorithmsForNode:(id)a3 bundleId:(id)a4 customRules:(id)a5;
- (id)_algorithmsToDelete:(id)a3 bundleId:(id)a4 customRules:(id)a5;
- (id)_mapAlgorithmNamesToNumbers:(id)a3 domain:(unsigned __int8)a4;
- (id)availablePortraitVariantNames;
- (id)contactsLabelScoringMap;
- (id)differentiallyPrivateEntityLogLevels;
- (id)engagementKValues;
- (id)extractionAlgorithmsForBundleId:(id)a3 sourceLanguage:(id)a4 conservative:(BOOL)a5 domain:(unsigned __int8)a6;
- (id)feedbackSessionLogsSamplingRateOverrides;
- (id)hyperparametersForMappingId:(id)a3;
- (id)naturalPortraitVariantName;
- (id)portraitMusicDataCollectionAMPBundleIds;
- (id)portraitVariantName;
- (id)sportsMetricsEventName;
- (id)topicCalibrationTrie;
- (id)trialWrapperReloadingIfNeeded;
- (int)feedbackSessionLogsGeohashLength;
- (int)maxNumberMappedTopics;
- (int)maxNumberNamedEntities;
- (int)portraitAnalyticsMaximumNumberOfRecords;
- (int)portraitMusicDataCollectionMaximumRecordsPerType;
- (int)queryTimeNextFromMinutes;
- (int)sportsMetricsNumberOfLeaguesLogged;
- (int)sportsMetricsNumberOfTeamsLogged;
- (unint64_t)maxUniqueTokensInECRTokenCounts;
- (unint64_t)sentenceEmbeddingVersion;
- (unsigned)customTaggerMaxTokenCount;
- (unsigned)mapsSearchQueryLimit;
- (unsigned)maxItemsInFeatureDictionary;
- (unsigned)maxNEExtractions;
- (unsigned)maxRelevantHighlightContacts;
- (unsigned)namedEntityLoadAndMonitorInitialLoadLimit;
- (unsigned)navigationMinimumDistanceInMeters;
- (unsigned)nextEventsFuzzMinutes;
- (unsigned)peopleSuggesterMax;
- (unsigned)queryTimeNextToMinutes;
- (unsigned)queryTimeOtherToMinutes;
- (unsigned)socialHighlightMaxNumHighlights;
- (unsigned)socialHighlightTopKCount;
- (void)_loadConfigParams;
- (void)_loadContactsConfigParams;
- (void)_loadContactsConfigParamsWithGuardedData:(id)a3;
- (void)_loadGlobalConfigParams;
- (void)_loadGlobalConfigParamsWithGuardedData:(id)a3;
- (void)_loadLocationsConfigParams;
- (void)_loadLocationsConfigParamsWithGuardedData:(id)a3;
- (void)_loadNamedEntitiesConfigParams;
- (void)_loadNamedEntitiesConfigParamsWithGuardedData:(id)a3;
- (void)_loadQuickTypeConfigParams;
- (void)_loadQuickTypeConfigParamsWithGuardedData:(id)a3;
- (void)_loadSocialHighlightConfigParams;
- (void)_loadSocialHighlightConfigParamsWithGuardedData:(id)a3;
- (void)_loadTopicsConfigParams;
- (void)_loadTopicsConfigParamsWithGuardedData:(id)a3;
- (void)_loadUniversalSearchConfigParams;
- (void)_loadUniversalSearchConfigParamsWithGuardedData:(id)a3;
@end

@implementation PPConfiguration

double __47__PPConfiguration_socialHighlightDecayInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 456);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __50__PPConfiguration_socialHighlightMaxNumHighlights__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 496);
  return result;
}

uint64_t __43__PPConfiguration_socialHighlightTopKCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 500);
  return result;
}

double __54__PPConfiguration_socialHighlightCacheTimeoutInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 472);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)sharedInstance
{
  v2 = +[PPTrialWrapper sharedInstance];
  pthread_mutex_lock(&configLock_25742);
  v3 = (void *)sharedConfig;
  if (!sharedConfig || (!*(void *)(sharedConfig + 32) ? (BOOL v4 = v2 == 0) : (BOOL v4 = 1), !v4))
  {
    v5 = [[PPConfiguration alloc] initWithTrialWrapper:v2];
    v6 = (void *)sharedConfig;
    sharedConfig = (uint64_t)v5;

    v3 = (void *)sharedConfig;
  }
  id v7 = v3;
  pthread_mutex_unlock(&configLock_25742);

  return v7;
}

- (double)socialHighlightDecayInterval
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PPConfiguration_socialHighlightDecayInterval__block_invoke;
  v8[3] = &unk_1E65DBFB0;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  double v3 = *(double *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.SocialLayer"];
  uint64_t v5 = [v4 integerForKey:@"SharedWithYouDecayOverride"];
  if (v5 >= 1)
  {
    v6 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPConfiguration: Social highlights decay override with nonzero value found: %ld", (uint8_t *)&buf, 0xCu);
    }

    double v3 = (double)v5;
  }

  return v3;
}

- (unsigned)socialHighlightTopKCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PPConfiguration_socialHighlightTopKCount__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)socialHighlightMaxNumHighlights
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PPConfiguration_socialHighlightMaxNumHighlights__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)socialHighlightCacheTimeoutInterval
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PPConfiguration_socialHighlightCacheTimeoutInterval__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_cachedAlgorithms, 0);
  objc_storeStrong((id *)&self->_assetUpdateHandlerToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)hyperparametersForMappingId:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__25280;
  v14 = __Block_byref_object_dispose__25281;
  id v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PPConfiguration_hyperparametersForMappingId___block_invoke;
  v9[3] = &unk_1E65DBFB0;
  v9[4] = &v10;
  [(_PASLock *)lock runWithLockAcquired:v9];
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  id v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

void __47__PPConfiguration_hyperparametersForMappingId___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (unint64_t)maxUniqueTokensInECRTokenCounts
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PPConfiguration_maxUniqueTokensInECRTokenCounts__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__PPConfiguration_maxUniqueTokensInECRTokenCounts__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 528);
  return result;
}

- (BOOL)enableECRMessageTokenCountsPlugin
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_enableECRMessageTokenCountsPlugin__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__PPConfiguration_enableECRMessageTokenCountsPlugin__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 520);
  return result;
}

- (double)maxEmailHarvestingEligiblityInterval
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PPConfiguration_maxEmailHarvestingEligiblityInterval__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __55__PPConfiguration_maxEmailHarvestingEligiblityInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 512);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)skipInsignificantEmailExtractions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_skipInsignificantEmailExtractions__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__PPConfiguration_skipInsignificantEmailExtractions__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 504);
  return result;
}

- (double)socialHighlightMetricReportingInterval
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PPConfiguration_socialHighlightMetricReportingInterval__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __57__PPConfiguration_socialHighlightMetricReportingInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 488);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)socialHighlightFeedbackDeletionInterval
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PPConfiguration_socialHighlightFeedbackDeletionInterval__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __58__PPConfiguration_socialHighlightFeedbackDeletionInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 480);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)socialHighlightRankedStorageMaxAge
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PPConfiguration_socialHighlightRankedStorageMaxAge__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __53__PPConfiguration_socialHighlightRankedStorageMaxAge__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 464);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unsigned)maxItemsInFeatureDictionary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PPConfiguration_maxItemsInFeatureDictionary__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__PPConfiguration_maxItemsInFeatureDictionary__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 452);
  return result;
}

- (BOOL)useCachedPortraitScores
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PPConfiguration_useCachedPortraitScores__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__PPConfiguration_useCachedPortraitScores__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 450);
  return result;
}

- (BOOL)useRawNEExtractionScores
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PPConfiguration_useRawNEExtractionScores__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__PPConfiguration_useRawNEExtractionScores__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 449);
  return result;
}

- (BOOL)storeNewExtractions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PPConfiguration_storeNewExtractions__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__PPConfiguration_storeNewExtractions__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 448);
  return result;
}

- (double)scoreThreshold
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PPConfiguration_scoreThreshold__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __33__PPConfiguration_scoreThreshold__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 440);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unsigned)maxNEExtractions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PPConfiguration_maxNEExtractions__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PPConfiguration_maxNEExtractions__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 436);
  return result;
}

- (unsigned)maxRelevantHighlightContacts
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PPConfiguration_maxRelevantHighlightContacts__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__PPConfiguration_maxRelevantHighlightContacts__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 432);
  return result;
}

- (unint64_t)sentenceEmbeddingVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PPConfiguration_sentenceEmbeddingVersion__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__PPConfiguration_sentenceEmbeddingVersion__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 424);
  return result;
}

- (unsigned)queryTimeOtherToMinutes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PPConfiguration_queryTimeOtherToMinutes__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__PPConfiguration_queryTimeOtherToMinutes__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 416);
  return result;
}

- (int)queryTimeNextFromMinutes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PPConfiguration_queryTimeNextFromMinutes__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__PPConfiguration_queryTimeNextFromMinutes__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 408);
  return result;
}

- (unsigned)queryTimeNextToMinutes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_queryTimeNextToMinutes__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__PPConfiguration_queryTimeNextToMinutes__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 412);
  return result;
}

- (unsigned)nextEventsFuzzMinutes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PPConfiguration_nextEventsFuzzMinutes__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__PPConfiguration_nextEventsFuzzMinutes__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 404);
  return result;
}

- (unsigned)navigationMinimumDistanceInMeters
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_navigationMinimumDistanceInMeters__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__PPConfiguration_navigationMinimumDistanceInMeters__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 400);
  return result;
}

- (double)navigationMinimumTimeInterval
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_navigationMinimumTimeInterval__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __48__PPConfiguration_navigationMinimumTimeInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 392);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unsigned)peopleSuggesterMax
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__PPConfiguration_peopleSuggesterMax__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__PPConfiguration_peopleSuggesterMax__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 384);
  return result;
}

- (float)recordSourceNonContactsInitialScore
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PPConfiguration_recordSourceNonContactsInitialScore__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __54__PPConfiguration_recordSourceNonContactsInitialScore__block_invoke(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 380);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (float)recordSourceContactsInitialScore
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PPConfiguration_recordSourceContactsInitialScore__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __51__PPConfiguration_recordSourceContactsInitialScore__block_invoke(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 376);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)contactsLabelScoringMap
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__25280;
  uint64_t v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PPConfiguration_contactsLabelScoringMap__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__PPConfiguration_contactsLabelScoringMap__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (double)mapsSearchQueryFromDateInterval
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PPConfiguration_mapsSearchQueryFromDateInterval__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __50__PPConfiguration_mapsSearchQueryFromDateInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 352);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unsigned)mapsSearchQueryLimit
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PPConfiguration_mapsSearchQueryLimit__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__PPConfiguration_mapsSearchQueryLimit__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 348);
  return result;
}

- (unsigned)namedEntityLoadAndMonitorInitialLoadLimit
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PPConfiguration_namedEntityLoadAndMonitorInitialLoadLimit__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__PPConfiguration_namedEntityLoadAndMonitorInitialLoadLimit__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 360);
  return result;
}

- (unsigned)customTaggerMaxTokenCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_customTaggerMaxTokenCount__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__PPConfiguration_customTaggerMaxTokenCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 344);
  return result;
}

- (int)maxNumberNamedEntities
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_maxNumberNamedEntities__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__PPConfiguration_maxNumberNamedEntities__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 340);
  return result;
}

- (int)maxNumberMappedTopics
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PPConfiguration_maxNumberMappedTopics__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__PPConfiguration_maxNumberMappedTopics__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 336);
  return result;
}

- (double)routineExtractionScoreDecayHalfLifeDays
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PPConfiguration_routineExtractionScoreDecayHalfLifeDays__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __58__PPConfiguration_routineExtractionScoreDecayHalfLifeDays__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 320);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)routineExtractionScoreDurationWeight
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PPConfiguration_routineExtractionScoreDurationWeight__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __55__PPConfiguration_routineExtractionScoreDurationWeight__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 312);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)routineExtractionScoreCountWeight
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_routineExtractionScoreCountWeight__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __52__PPConfiguration_routineExtractionScoreCountWeight__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 304);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)locationScoringUsesCoreML
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_locationScoringUsesCoreML__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__PPConfiguration_locationScoringUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 296);
  return result;
}

- (double)topicMappingCoreMLThreshold
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PPConfiguration_topicMappingCoreMLThreshold__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __46__PPConfiguration_topicMappingCoreMLThreshold__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 288);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)topicMappingUsesCoreML
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_topicMappingUsesCoreML__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__PPConfiguration_topicMappingUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 283);
  return result;
}

- (BOOL)use2StageScoreInterpreterForLocationScoring
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PPConfiguration_use2StageScoreInterpreterForLocationScoring__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__PPConfiguration_use2StageScoreInterpreterForLocationScoring__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 282);
  return result;
}

- (BOOL)use2StageScoreInterpreterForTPScoring
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PPConfiguration_use2StageScoreInterpreterForTPScoring__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__PPConfiguration_use2StageScoreInterpreterForTPScoring__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 281);
  return result;
}

- (BOOL)use2StageScoreInterpreterForNEScoring
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PPConfiguration_use2StageScoreInterpreterForNEScoring__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__PPConfiguration_use2StageScoreInterpreterForNEScoring__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 280);
  return result;
}

- (id)engagementKValues
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__25280;
  uint64_t v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PPConfiguration_engagementKValues__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__PPConfiguration_engagementKValues__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (BOOL)locationFeedbackUsesCoreML
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PPConfiguration_locationFeedbackUsesCoreML__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__PPConfiguration_locationFeedbackUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 267);
  return result;
}

- (BOOL)topicFeedbackUsesCoreML
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PPConfiguration_topicFeedbackUsesCoreML__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__PPConfiguration_topicFeedbackUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 266);
  return result;
}

- (BOOL)namedEntityFeedbackUsesCoreML
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_namedEntityFeedbackUsesCoreML__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__PPConfiguration_namedEntityFeedbackUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 265);
  return result;
}

- (BOOL)notificationExtractionEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_notificationExtractionEnabled__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__PPConfiguration_notificationExtractionEnabled__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 264);
  return result;
}

- (double)decayedFeedbackCountsHalfLifeDays
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PPConfiguration_decayedFeedbackCountsHalfLifeDays__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __52__PPConfiguration_decayedFeedbackCountsHalfLifeDays__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 256);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)flattenNamedEntitiesForCoreML
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_flattenNamedEntitiesForCoreML__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__PPConfiguration_flattenNamedEntitiesForCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 251);
  return result;
}

- (BOOL)flattenTopicsForCoreML
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_flattenTopicsForCoreML__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__PPConfiguration_flattenTopicsForCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 250);
  return result;
}

- (BOOL)locationScoringUsesHybrid
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_locationScoringUsesHybrid__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__PPConfiguration_locationScoringUsesHybrid__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 254);
  return result;
}

- (BOOL)topicScoringUsesHybrid
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_topicScoringUsesHybrid__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__PPConfiguration_topicScoringUsesHybrid__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 253);
  return result;
}

- (BOOL)namedEntityScoringUsesHybrid
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PPConfiguration_namedEntityScoringUsesHybrid__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__PPConfiguration_namedEntityScoringUsesHybrid__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 252);
  return result;
}

- (BOOL)namedEntityScoringUsesCoreML
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PPConfiguration_namedEntityScoringUsesCoreML__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__PPConfiguration_namedEntityScoringUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 249);
  return result;
}

- (BOOL)topicScoringUsesCoreML
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_topicScoringUsesCoreML__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__PPConfiguration_topicScoringUsesCoreML__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 248);
  return result;
}

- (double)locationDecayHalfLifeSeconds
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PPConfiguration_locationDecayHalfLifeSeconds__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __47__PPConfiguration_locationDecayHalfLifeSeconds__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 240);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)namedEntityDecayHalfLifeSeconds
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PPConfiguration_namedEntityDecayHalfLifeSeconds__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __50__PPConfiguration_namedEntityDecayHalfLifeSeconds__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 232);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)topicDecayHalfLifeSeconds
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_topicDecayHalfLifeSeconds__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __44__PPConfiguration_topicDecayHalfLifeSeconds__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 224);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)portraitAnalyticsMaximumNumberOfRecords
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PPConfiguration_portraitAnalyticsMaximumNumberOfRecords__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__PPConfiguration_portraitAnalyticsMaximumNumberOfRecords__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 216);
  return result;
}

- (int)feedbackSessionLogsGeohashLength
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PPConfiguration_feedbackSessionLogsGeohashLength__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__PPConfiguration_feedbackSessionLogsGeohashLength__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 212);
  return result;
}

- (float)feedbackSessionLogsExtractionsSamplingRate
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PPConfiguration_feedbackSessionLogsExtractionsSamplingRate__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __61__PPConfiguration_feedbackSessionLogsExtractionsSamplingRate__block_invoke(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 208);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)feedbackSessionLogsSamplingRateOverrides
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__25280;
  uint64_t v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PPConfiguration_feedbackSessionLogsSamplingRateOverrides__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__PPConfiguration_feedbackSessionLogsSamplingRateOverrides__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (float)feedbackSessionLogsSamplingRate
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PPConfiguration_feedbackSessionLogsSamplingRate__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __50__PPConfiguration_feedbackSessionLogsSamplingRate__block_invoke(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 192);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (float)scoreThresholdForLocation
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_scoreThresholdForLocation__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __44__PPConfiguration_scoreThresholdForLocation__block_invoke(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 188);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (float)scoreThresholdForTopic
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_scoreThresholdForTopic__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __41__PPConfiguration_scoreThresholdForTopic__block_invoke(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 184);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (float)scoreThresholdForNamedEntity
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PPConfiguration_scoreThresholdForNamedEntity__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __47__PPConfiguration_scoreThresholdForNamedEntity__block_invoke(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 180);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)safariDataDetectorsEnabledForHighMemoryDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PPConfiguration_safariDataDetectorsEnabledForHighMemoryDevices__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__PPConfiguration_safariDataDetectorsEnabledForHighMemoryDevices__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 177);
  return result;
}

- (BOOL)safariDonationTitleExtractionEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PPConfiguration_safariDonationTitleExtractionEnabled__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__PPConfiguration_safariDonationTitleExtractionEnabled__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 176);
  return result;
}

- (id)topicCalibrationTrie
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__25280;
  uint64_t v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PPConfiguration_topicCalibrationTrie__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__PPConfiguration_topicCalibrationTrie__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (double)sportsMetricsSamplingRate
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PPConfiguration_sportsMetricsSamplingRate__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __44__PPConfiguration_sportsMetricsSamplingRate__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 88);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)sportsMetricsEventName
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__25280;
  uint64_t v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_sportsMetricsEventName__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__PPConfiguration_sportsMetricsEventName__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (int)sportsMetricsNumberOfLeaguesLogged
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PPConfiguration_sportsMetricsNumberOfLeaguesLogged__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__PPConfiguration_sportsMetricsNumberOfLeaguesLogged__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 76);
  return result;
}

- (int)sportsMetricsNumberOfTeamsLogged
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PPConfiguration_sportsMetricsNumberOfTeamsLogged__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__PPConfiguration_sportsMetricsNumberOfTeamsLogged__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 72);
  return result;
}

- (id)portraitMusicDataCollectionAMPBundleIds
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__25280;
  uint64_t v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PPConfiguration_portraitMusicDataCollectionAMPBundleIds__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__PPConfiguration_portraitMusicDataCollectionAMPBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (BOOL)portraitMusicDataCollectionCollectNonAMPNowPlaying
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PPConfiguration_portraitMusicDataCollectionCollectNonAMPNowPlaying__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __69__PPConfiguration_portraitMusicDataCollectionCollectNonAMPNowPlaying__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 60);
  return result;
}

- (int)portraitMusicDataCollectionMaximumRecordsPerType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PPConfiguration_portraitMusicDataCollectionMaximumRecordsPerType__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__PPConfiguration_portraitMusicDataCollectionMaximumRecordsPerType__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 56);
  return result;
}

- (double)portraitMusicDataCollectionSamplingRateForAMP
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PPConfiguration_portraitMusicDataCollectionSamplingRateForAMP__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __64__PPConfiguration_portraitMusicDataCollectionSamplingRateForAMP__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 48);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)portraitMusicDataCollectionSamplingRateForCTS
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PPConfiguration_portraitMusicDataCollectionSamplingRateForCTS__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __64__PPConfiguration_portraitMusicDataCollectionSamplingRateForCTS__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 40);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)portraitAnalyticsSamplingRate
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_portraitAnalyticsSamplingRate__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __48__PPConfiguration_portraitAnalyticsSamplingRate__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 32);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)isMultilingual
{
  v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)extractionAlgorithmsForBundleId:(id)a3 sourceLanguage:(id)a4 conservative:(BOOL)a5 domain:(unsigned __int8)a6
{
  unsigned int v59 = a6;
  BOOL v6 = a5;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  id v60 = a4;
  context = (void *)MEMORY[0x1CB79D060]();
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v10 = [v9 localeIdentifier];
  id v11 = [v8 componentsFromLocaleIdentifier:v10];
  uint64_t v12 = *MEMORY[0x1E4F1C438];
  uint64_t v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  v14 = (void *)v13;
  id v15 = &stru_1F253DF18;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  v68 = v15;

  v16 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v60];
  uint64_t v17 = [v16 objectForKeyedSubscript:v12];
  v18 = (void *)v17;
  v19 = v68;
  if (v17) {
    v19 = (void *)v17;
  }
  id v64 = v19;

  if (self)
  {
    if (v59 > 2) {
      v20 = @"UNK_ALGORITHM";
    }
    else {
      v20 = off_1E65DBFF8[v59];
    }
    v63 = v20;
  }
  else
  {
    v63 = 0;
  }
  v21 = pp_default_log_handle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v55 = [MEMORY[0x1E4F1CA20] currentLocale];
    v56 = [v55 localeIdentifier];
    *(_DWORD *)long long buf = 138413058;
    *(void *)&buf[4] = v63;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v60;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v56;
    *(_WORD *)&buf[32] = 2112;
    *(void *)&buf[34] = v66;
    _os_log_debug_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEBUG, "PPConfiguration: %@: determining extraction algorithms based on detected language %@, system language %@, and bundle %@", buf, 0x2Au);
  }
  v62 = (void *)[[NSString alloc] initWithFormat:@"%@:%@:%@:%d", v63, v64, v66, v6];
  v61 = [(_PASLRUCache *)self->_cachedAlgorithms objectForKey:v62];
  if (v61)
  {
    v22 = pp_default_log_handle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEBUG, "PPConfiguration: returning cached value for extraction algorithms.", buf, 2u);
    }

    v23 = pp_default_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&buf[4] = v63;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v61;
      _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEFAULT, "PPConfiguration: %@: running the following algorithms: %@", buf, 0x16u);
    }

    v24 = v61;
    id v25 = v61;
  }
  else
  {
    if (v59 == 2)
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&buf[24] = __Block_byref_object_copy__25280;
      *(void *)&buf[32] = __Block_byref_object_dispose__25281;
      *(void *)&buf[40] = 0;
      lock = self->_lock;
      uint64_t v73 = MEMORY[0x1E4F143A8];
      uint64_t v74 = 3221225472;
      v75 = __40__PPConfiguration__dictionaryForDomain___block_invoke_3;
      v76 = &unk_1E65DBFB0;
      v77 = buf;
      [(_PASLock *)lock runWithLockAcquired:&v73];
      id v57 = *(id *)(*(void *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);
    }
    else if (v59 == 1)
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&buf[24] = __Block_byref_object_copy__25280;
      *(void *)&buf[32] = __Block_byref_object_dispose__25281;
      *(void *)&buf[40] = 0;
      v28 = self->_lock;
      uint64_t v73 = MEMORY[0x1E4F143A8];
      uint64_t v74 = 3221225472;
      v75 = __40__PPConfiguration__dictionaryForDomain___block_invoke_2;
      v76 = &unk_1E65DBFB0;
      v77 = buf;
      [(_PASLock *)v28 runWithLockAcquired:&v73];
      id v57 = *(id *)(*(void *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);
    }
    else if (v59)
    {
      id v57 = (id)MEMORY[0x1E4F1CC08];
    }
    else
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&buf[24] = __Block_byref_object_copy__25280;
      *(void *)&buf[32] = __Block_byref_object_dispose__25281;
      *(void *)&buf[40] = 0;
      v26 = self->_lock;
      uint64_t v73 = MEMORY[0x1E4F143A8];
      uint64_t v74 = 3221225472;
      v75 = __40__PPConfiguration__dictionaryForDomain___block_invoke;
      v76 = &unk_1E65DBFB0;
      v77 = buf;
      [(_PASLock *)v26 runWithLockAcquired:&v73];
      id v57 = *(id *)(*(void *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);
    }
    v29 = pp_default_log_handle();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v30)
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v63;
        _os_log_debug_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEBUG, "PPConfiguration: %@: running only conservative algorithms.", buf, 0xCu);
      }

      v31 = [v57 objectForKeyedSubscript:@"CONSERVATIVE_RULES"];
      id v32 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v33 = [v57 objectForKeyedSubscript:@"CONSERVATIVE"];
      uint64_t v34 = [v32 initWithArray:v33];
    }
    else
    {
      if (v30)
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v63;
        _os_log_debug_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEBUG, "PPConfiguration: %@: running non-conservative algorithms.", buf, 0xCu);
      }

      v31 = [v57 objectForKeyedSubscript:@"AGGRESSIVE_RULES"];
      id v35 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v33 = [v57 objectForKeyedSubscript:@"AGGRESSIVE"];
      uint64_t v34 = [v35 initWithArray:v33];
    }
    v36 = (void *)v34;

    id v37 = objc_alloc(MEMORY[0x1E4F1CAA0]);
    v79[0] = @"*";
    v79[1] = v68;
    v79[2] = v64;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:3];
    v39 = (void *)[v37 initWithArray:v38];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v39;
    uint64_t v40 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v70 != v41) {
            objc_enumerationMutation(obj);
          }
          v43 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v44 = (void *)MEMORY[0x1CB79D060]();
          v45 = [v31 objectForKeyedSubscript:v43];
          v46 = [(PPConfiguration *)self _algorithmsForNode:v43 bundleId:v66 customRules:v45];

          [v36 unionSet:v46];
          if ([v43 isEqualToString:v68]
            && [(__CFString *)v68 isEqualToString:v64])
          {
            v47 = [v31 objectForKeyedSubscript:v43];
            v48 = [(PPConfiguration *)self _algorithmsToDelete:v43 bundleId:v66 customRules:v47];

            v49 = pp_default_log_handle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138413058;
              *(void *)&buf[4] = v63;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v48;
              *(_WORD *)&buf[22] = 2048;
              *(void *)&buf[24] = v59;
              *(_WORD *)&buf[32] = 2112;
              *(void *)&buf[34] = v43;
              _os_log_impl(&dword_1CA9A8000, v49, OS_LOG_TYPE_INFO, "PPConfiguration: %@: removing algorithms %@ for domain %lu and language %@.", buf, 0x2Au);
            }

            [v36 minusSet:v48];
          }
        }
        uint64_t v40 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v40);
    }

    if ([v36 count])
    {
      id v25 = [(PPConfiguration *)self _mapAlgorithmNamesToNumbers:v36 domain:v59];
      v50 = pp_default_log_handle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_1CA9A8000, v50, OS_LOG_TYPE_DEFAULT, "PPConfiguration: %@: running the following algorithms: %@", buf, 0x16u);
      }

      [(_PASLRUCache *)self->_cachedAlgorithms setObject:v25 forKey:v62];
    }
    else
    {
      v51 = pp_default_log_handle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413058;
        *(void *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v59;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v68;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v66;
        _os_log_impl(&dword_1CA9A8000, v51, OS_LOG_TYPE_DEFAULT, "PPConfiguration: %@: not running any algorithms for domain %d as language %@ has no algorithms for bundle ID %@", buf, 0x26u);
      }

      cachedAlgorithms = self->_cachedAlgorithms;
      v53 = objc_opt_new();
      [(_PASLRUCache *)cachedAlgorithms setObject:v53 forKey:v62];

      id v25 = (id)objc_opt_new();
    }

    v24 = 0;
  }

  return v25;
}

void __40__PPConfiguration__dictionaryForDomain___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __40__PPConfiguration__dictionaryForDomain___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

void __40__PPConfiguration__dictionaryForDomain___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

- (id)_mapAlgorithmNamesToNumbers:(id)a3 domain:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void *)MEMORY[0x1CB79D060]();
  id v7 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
      if (v4 == 2)
      {
        v14 = (void *)MEMORY[0x1E4F89E60];
      }
      else if (v4 == 1)
      {
        v14 = (void *)MEMORY[0x1E4F89EA8];
      }
      else
      {
        if (v4)
        {
          id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 0, (void)v20);
          goto LABEL_14;
        }
        v14 = (void *)MEMORY[0x1E4F89F98];
      }
      id v15 = objc_msgSend(v14, "algorithmForName:", *(void *)(*((void *)&v20 + 1) + 8 * v12), (void)v20);
LABEL_14:
      v16 = v15;
      if (![v15 unsignedIntegerValue])
      {
        v18 = pp_default_log_handle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v25 = v13;
          __int16 v26 = 1024;
          int v27 = v4;
          _os_log_fault_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_FAULT, "PPConfiguration: unknown algorithm %@ in domain %d", buf, 0x12u);
        }

        uint64_t v17 = objc_opt_new();
        goto LABEL_21;
      }
      [v7 addObject:v16];

      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v17 = (void *)[v7 copy];
LABEL_21:

  return v17;
}

- (id)_algorithmsToDelete:(id)a3 bundleId:(id)a4 customRules:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (v7)
  {
    id v8 = objc_opt_new();
    uint64_t v9 = [v7 objectForKeyedSubscript:@"DEL"];
    [v8 addObjectsFromArray:v9];

    uint64_t v10 = [v7 objectForKeyedSubscript:@"BUNDLES"];
    uint64_t v11 = [v6 lowercaseString];
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];

    if (v12)
    {
      uint64_t v13 = [v12 objectForKeyedSubscript:@"DEL"];
      [v8 addObjectsFromArray:v13];
    }
  }
  else
  {
    id v8 = objc_opt_new();
  }

  return v8;
}

- (id)_algorithmsForNode:(id)a3 bundleId:(id)a4 customRules:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (v7)
  {
    id v8 = objc_opt_new();
    uint64_t v9 = [v7 objectForKeyedSubscript:@"ADD"];
    [v8 addObjectsFromArray:v9];

    uint64_t v10 = [v7 objectForKeyedSubscript:@"BUNDLES"];
    uint64_t v11 = [v6 lowercaseString];
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];

    if (v12)
    {
      uint64_t v13 = [v12 objectForKeyedSubscript:@"ADD"];
      [v8 addObjectsFromArray:v13];
    }
  }
  else
  {
    id v8 = objc_opt_new();
  }

  return v8;
}

- (id)differentiallyPrivateEntityLogLevels
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__25280;
  uint64_t v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PPConfiguration_differentiallyPrivateEntityLogLevels__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__PPConfiguration_differentiallyPrivateEntityLogLevels__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (float)topicsMultiplierForBundleId:(id)a3 algorithm:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__25280;
  v38 = __Block_byref_object_dispose__25281;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__25280;
  id v32 = __Block_byref_object_dispose__25281;
  id v33 = 0;
  id v7 = [MEMORY[0x1E4F89F98] describeAlgorithm:a4];
  lock = self->_lock;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v22 = __57__PPConfiguration_topicsMultiplierForBundleId_algorithm___block_invoke;
  long long v23 = &unk_1E65DBFD8;
  __int16 v26 = &v34;
  id v9 = v6;
  id v24 = v9;
  int v27 = &v28;
  id v10 = v7;
  id v25 = v10;
  [(_PASLock *)lock runWithLockAcquired:&v20];
  id v11 = v35;
  if (v35[5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    id v11 = v35;
    uint64_t v12 = (void *)v35[5];
  }
  else
  {
    uint64_t v12 = 0;
  }
  v11[5] = (uint64_t)&unk_1F256B2A0;

LABEL_6:
  uint64_t v13 = v29;
  if (!v29[5])
  {
    v14 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = v29;
    v14 = (void *)v29[5];
LABEL_10:
    v13[5] = (uint64_t)&unk_1F256B2A0;
  }
  objc_msgSend((id)v35[5], "floatValue", v20, v21, v22, v23);
  float v16 = v15;
  [(id)v29[5] floatValue];
  float v18 = v16 * v17;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

uint64_t __57__PPConfiguration_topicsMultiplierForBundleId_algorithm___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a2[16];
  uint64_t v4 = a1[4];
  id v5 = a2;
  uint64_t v6 = [v3 objectForKeyedSubscript:v4];
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = (void *)v5[17];
  *(void *)(*(void *)(a1[7] + 8) + 40) = [v9 objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (double)nonReaderTextWeight
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PPConfiguration_nonReaderTextWeight__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __38__PPConfiguration_nonReaderTextWeight__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 24);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)halfValuePosition
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PPConfiguration_halfValuePosition__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __36__PPConfiguration_halfValuePosition__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 16);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)availablePortraitVariantNames
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__25280;
  id v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PPConfiguration_availablePortraitVariantNames__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__PPConfiguration_availablePortraitVariantNames__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)naturalPortraitVariantName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__25280;
  id v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PPConfiguration_naturalPortraitVariantName__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__PPConfiguration_naturalPortraitVariantName__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)portraitVariantName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__25280;
  id v10 = __Block_byref_object_dispose__25281;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PPConfiguration_portraitVariantName__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__PPConfiguration_portraitVariantName__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (float)remoteTopicsMultiplier
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPConfiguration_remoteTopicsMultiplier__block_invoke;
  v5[3] = &unk_1E65DBFB0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __41__PPConfiguration_remoteTopicsMultiplier__block_invoke(uint64_t a1, uint64_t a2)
{
  float result = *(float *)(a2 + 8);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_loadConfigParams
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__PPConfiguration__loadConfigParams__block_invoke;
  v3[3] = &unk_1E65DBF88;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __36__PPConfiguration__loadConfigParams__block_invoke(uint64_t a1, void *a2)
{
  float v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _loadGlobalConfigParamsWithGuardedData:v4];
  [*(id *)(a1 + 32) _loadTopicsConfigParamsWithGuardedData:v4];
  [*(id *)(a1 + 32) _loadNamedEntitiesConfigParamsWithGuardedData:v4];
  [*(id *)(a1 + 32) _loadLocationsConfigParamsWithGuardedData:v4];
  [*(id *)(a1 + 32) _loadContactsConfigParamsWithGuardedData:v4];
  [*(id *)(a1 + 32) _loadQuickTypeConfigParamsWithGuardedData:v4];
  [*(id *)(a1 + 32) _loadSocialHighlightConfigParamsWithGuardedData:v4];
  [*(id *)(a1 + 32) _loadUniversalSearchConfigParamsWithGuardedData:v4];
}

- (void)_loadTopicsConfigParamsWithGuardedData:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v7 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  uint64_t v8 = [v7 filepathForFactor:@"topicCalibration.trie" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];

  if ([(__CFString *)v8 length])
  {
    int v9 = [objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:v8];
    objc_storeStrong(v4 + 21, v9);
  }
  else
  {
    int v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = v8;
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: Empty or missing asset contents for \"%@\"", (uint8_t *)&v102, 0xCu);
    }
  }

  id v10 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  id v11 = [v10 plistForFactorName:@"configuration_topics.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];

  if ((unint64_t)[v11 count] <= 1)
  {
    uint64_t v12 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];

    if (v12)
    {
      uint64_t v13 = pp_default_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v102) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad topics configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v102, 2u);
      }

      id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      float v15 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
      float v16 = [v15 defaultFilepathForFactor:@"configuration_topics.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
      uint64_t v17 = [v14 initWithContentsOfFile:v16];

      id v11 = (void *)v17;
    }
  }
  float v18 = [v11 objectForKeyedSubscript:@"RemoteTopicsMultiplier"];
  if (!v18 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), uint64_t v20 = v18, (isKindOfClass & 1) == 0))
  {
    uint64_t v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"RemoteTopicsMultiplier";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    uint64_t v20 = &unk_1F256B290;
  }
  id v23 = v20;

  [v23 floatValue];
  *((_DWORD *)v4 + 2) = v24;

  id v25 = [v11 objectForKeyedSubscript:@"TopicFeedbackUsesCoreML"];
  if (!v25 || (objc_opt_class(), char v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    uint64_t v28 = MEMORY[0x1E4F14500];
    id v29 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"TopicFeedbackUsesCoreML";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    int v27 = &unk_1F256B290;
  }
  id v30 = v27;

  *((unsigned char *)v4 + 266) = [v30 BOOLValue];
  v31 = [v11 objectForKeyedSubscript:@"TopicMappingUsesCoreML"];
  if (!v31 || (objc_opt_class(), char v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    uint64_t v34 = MEMORY[0x1E4F14500];
    id v35 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"TopicMappingUsesCoreML";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    id v33 = &unk_1F256B290;
  }
  id v36 = v33;

  *((unsigned char *)v4 + 283) = [v36 BOOLValue];
  id v37 = [v11 objectForKeyedSubscript:@"TopicMappingCoreMLThreshold"];
  if (!v37 || (objc_opt_class(), v38 = objc_opt_isKindOfClass(), id v39 = v37, (v38 & 1) == 0))
  {
    uint64_t v40 = MEMORY[0x1E4F14500];
    id v41 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"TopicMappingCoreMLThreshold";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    id v39 = &unk_1F256B290;
  }
  id v42 = v39;

  [v42 doubleValue];
  v4[36] = v43;

  v44 = [v11 objectForKeyedSubscript:@"LinearModelHyperparameters"];
  if (!v44 || (objc_opt_class(), char v45 = objc_opt_isKindOfClass(), v46 = v44, (v45 & 1) == 0))
  {
    v47 = MEMORY[0x1E4F14500];
    id v48 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"LinearModelHyperparameters";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v46 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v49 = v46;

  id v50 = v4[41];
  v4[41] = v49;

  v51 = [v11 objectForKeyedSubscript:@"Use2StageScoreInterpreterForTPScoring"];
  if (!v51 || (objc_opt_class(), char v52 = objc_opt_isKindOfClass(), v53 = v51, (v52 & 1) == 0))
  {
    v54 = MEMORY[0x1E4F14500];
    id v55 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"Use2StageScoreInterpreterForTPScoring";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v53 = &unk_1F256B290;
  }
  id v56 = v53;

  *((unsigned char *)v4 + 281) = [v56 BOOLValue];
  id v57 = [v11 objectForKeyedSubscript:@"FlattenTopicsForCoreML"];
  if (!v57 || (objc_opt_class(), v58 = objc_opt_isKindOfClass(), unsigned int v59 = v57, (v58 & 1) == 0))
  {
    id v60 = MEMORY[0x1E4F14500];
    id v61 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"FlattenTopicsForCoreML";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    unsigned int v59 = &unk_1F256B290;
  }
  id v62 = v59;

  *((unsigned char *)v4 + 250) = [v62 BOOLValue];
  v63 = [v11 objectForKeyedSubscript:@"TopicScoringUsesCoreML"];
  if (!v63 || (objc_opt_class(), char v64 = objc_opt_isKindOfClass(), v65 = v63, (v64 & 1) == 0))
  {
    id v66 = MEMORY[0x1E4F14500];
    id v67 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"TopicScoringUsesCoreML";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v65 = &unk_1F256B290;
  }
  id v68 = v65;

  *((unsigned char *)v4 + 248) = [v68 BOOLValue];
  long long v69 = [v11 objectForKeyedSubscript:@"TopicScoringUsesHybrid"];
  if (!v69 || (objc_opt_class(), char v70 = objc_opt_isKindOfClass(), v71 = v69, (v70 & 1) == 0))
  {
    long long v72 = MEMORY[0x1E4F14500];
    id v73 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"TopicScoringUsesHybrid";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    long long v71 = &unk_1F256B290;
  }
  id v74 = v71;

  *((unsigned char *)v4 + 253) = [v74 BOOLValue];
  v75 = [v11 objectForKeyedSubscript:@"TopicDecayHalfLifeSeconds"];
  if (!v75 || (objc_opt_class(), char v76 = objc_opt_isKindOfClass(), v77 = v75, (v76 & 1) == 0))
  {
    v78 = MEMORY[0x1E4F14500];
    id v79 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"TopicDecayHalfLifeSeconds";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v77 = &unk_1F256B290;
  }
  id v80 = v77;

  [v80 doubleValue];
  v4[28] = v81;

  v82 = [v11 objectForKeyedSubscript:@"ScoreThresholdForTopic"];
  if (!v82 || (objc_opt_class(), char v83 = objc_opt_isKindOfClass(), v84 = v82, (v83 & 1) == 0))
  {
    v85 = MEMORY[0x1E4F14500];
    id v86 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"ScoreThresholdForTopic";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v84 = &unk_1F256B290;
  }
  id v87 = v84;

  [v87 doubleValue];
  *(float *)&double v88 = v88;
  *((_DWORD *)v4 + 46) = LODWORD(v88);

  v89 = [v11 objectForKeyedSubscript:@"MaxNumberMappedTopics"];
  if (!v89 || (objc_opt_class(), char v90 = objc_opt_isKindOfClass(), v91 = v89, (v90 & 1) == 0))
  {
    v92 = MEMORY[0x1E4F14500];
    id v93 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"MaxNumberMappedTopics";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v91 = &unk_1F256B290;
  }
  id v94 = v91;

  *((_DWORD *)v4 + 84) = [v94 intValue];
  v95 = [v11 objectForKeyedSubscript:@"ExtractionAlgorithmConfiguration"];
  if (!v95 || (objc_opt_class(), char v96 = objc_opt_isKindOfClass(), v97 = v95, (v96 & 1) == 0))
  {
    v98 = MEMORY[0x1E4F14500];
    id v99 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      int v102 = 138412290;
      v103 = @"ExtractionAlgorithmConfiguration";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v102, 0xCu);
    }

    v97 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v100 = v97;

  id v101 = v4[19];
  v4[19] = v100;
}

- (void)_loadTopicsConfigParams
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PPConfiguration__loadTopicsConfigParams__block_invoke;
  v3[3] = &unk_1E65DBF88;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __42__PPConfiguration__loadTopicsConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadTopicsConfigParamsWithGuardedData:a2];
}

- (void)_loadNamedEntitiesConfigParamsWithGuardedData:(id)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  uint64_t v7 = [v6 plistForFactorName:@"configuration_named_entities.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"];

  if ((unint64_t)[v7 count] <= 1)
  {
    uint64_t v8 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];

    if (v8)
    {
      int v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v103) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad named entities configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v103, 2u);
      }

      id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v11 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
      uint64_t v12 = [v11 defaultFilepathForFactor:@"configuration_named_entities.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"];
      uint64_t v13 = [v10 initWithContentsOfFile:v12];

      uint64_t v7 = (void *)v13;
    }
  }
  id v14 = [v7 objectForKeyedSubscript:@"NamedEntityFeedbackUsesCoreML"];
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), float v16 = v14, (isKindOfClass & 1) == 0))
  {
    uint64_t v17 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"NamedEntityFeedbackUsesCoreML";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    float v16 = &unk_1F256B290;
  }
  id v19 = v16;

  v4[265] = [v19 BOOLValue];
  uint64_t v20 = [v7 objectForKeyedSubscript:@"MaxNumberNamedEntities"];
  if (!v20 || (objc_opt_class(), char v21 = objc_opt_isKindOfClass(), v22 = v20, (v21 & 1) == 0))
  {
    id v23 = MEMORY[0x1E4F14500];
    id v24 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"MaxNumberNamedEntities";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    id v22 = &unk_1F256A2E0;
  }
  id v25 = v22;

  *((_DWORD *)v4 + 85) = [v25 intValue];
  char v26 = [v7 objectForKeyedSubscript:@"Use2StageScoreInterpreterForNEScoring"];
  if (!v26 || (objc_opt_class(), char v27 = objc_opt_isKindOfClass(), v28 = v26, (v27 & 1) == 0))
  {
    id v29 = MEMORY[0x1E4F14500];
    id v30 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"Use2StageScoreInterpreterForNEScoring";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    uint64_t v28 = &unk_1F256B290;
  }
  id v31 = v28;

  v4[280] = [v31 BOOLValue];
  char v32 = [v7 objectForKeyedSubscript:@"NamedEntityScoringUsesCoreML"];
  if (!v32 || (objc_opt_class(), v33 = objc_opt_isKindOfClass(), uint64_t v34 = v32, (v33 & 1) == 0))
  {
    id v35 = MEMORY[0x1E4F14500];
    id v36 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"NamedEntityScoringUsesCoreML";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    uint64_t v34 = &unk_1F256B290;
  }
  id v37 = v34;

  v4[249] = [v37 BOOLValue];
  char v38 = [v7 objectForKeyedSubscript:@"NamedEntityDecayHalfLifeSeconds"];
  if (!v38 || (objc_opt_class(), v39 = objc_opt_isKindOfClass(), uint64_t v40 = v38, (v39 & 1) == 0))
  {
    id v41 = MEMORY[0x1E4F14500];
    id v42 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"NamedEntityDecayHalfLifeSeconds";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    uint64_t v40 = &unk_1F256B290;
  }
  id v43 = v40;

  [v43 doubleValue];
  *((void *)v4 + 29) = v44;

  char v45 = [v7 objectForKeyedSubscript:@"ScoreThresholdForNamedEntity"];
  if (!v45 || (objc_opt_class(), char v46 = objc_opt_isKindOfClass(), v47 = v45, (v46 & 1) == 0))
  {
    id v48 = MEMORY[0x1E4F14500];
    id v49 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"ScoreThresholdForNamedEntity";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v47 = &unk_1F256B290;
  }
  id v50 = v47;

  [v50 floatValue];
  *((_DWORD *)v4 + 45) = v51;

  char v52 = [v7 objectForKeyedSubscript:@"FlattenNamedEntitiesForCoreML"];
  if (!v52 || (objc_opt_class(), char v53 = objc_opt_isKindOfClass(), v54 = v52, (v53 & 1) == 0))
  {
    id v55 = MEMORY[0x1E4F14500];
    id v56 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"FlattenNamedEntitiesForCoreML";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v54 = &unk_1F256B290;
  }
  id v57 = v54;

  v4[251] = [v57 BOOLValue];
  char v58 = [v7 objectForKeyedSubscript:@"NamedEntityScoringUsesHybrid"];
  if (!v58 || (objc_opt_class(), char v59 = objc_opt_isKindOfClass(), v60 = v58, (v59 & 1) == 0))
  {
    id v61 = MEMORY[0x1E4F14500];
    id v62 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"NamedEntityScoringUsesHybrid";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    id v60 = &unk_1F256B290;
  }
  id v63 = v60;

  v4[252] = [v63 BOOLValue];
  char v64 = [v7 objectForKeyedSubscript:@"DifferentiallyPrivateLogLevels"];
  if (!v64 || (objc_opt_class(), v65 = objc_opt_isKindOfClass(), id v66 = v64, (v65 & 1) == 0))
  {
    id v67 = MEMORY[0x1E4F14500];
    id v68 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"DifferentiallyPrivateLogLevels";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    id v66 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v69 = v66;

  char v70 = (void *)*((void *)v4 + 15);
  *((void *)v4 + 15) = v69;

  long long v71 = [v7 objectForKeyedSubscript:@"CustomTaggerMaxTokenCount"];
  if (!v71 || (objc_opt_class(), char v72 = objc_opt_isKindOfClass(), v73 = v71, (v72 & 1) == 0))
  {
    id v74 = MEMORY[0x1E4F14500];
    id v75 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"CustomTaggerMaxTokenCount";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    id v73 = &unk_1F256B290;
  }
  id v76 = v73;

  v4[344] = [v76 unsignedShortValue];
  v77 = [v7 objectForKeyedSubscript:@"NamedEntityLoadAndMonitorInitialLoadLimit"];
  if (!v77 || (objc_opt_class(), v78 = objc_opt_isKindOfClass(), id v79 = v77, (v78 & 1) == 0))
  {
    id v80 = MEMORY[0x1E4F14500];
    id v81 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"NamedEntityLoadAndMonitorInitialLoadLimit";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    id v79 = &unk_1F256A2F8;
  }
  id v82 = v79;

  *((_DWORD *)v4 + 90) = [v82 unsignedIntegerValue];
  char v83 = [v7 objectForKeyedSubscript:@"MapsSearchQueryLimit"];
  if (!v83 || (objc_opt_class(), char v84 = objc_opt_isKindOfClass(), v85 = v83, (v84 & 1) == 0))
  {
    id v86 = MEMORY[0x1E4F14500];
    id v87 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"MapsSearchQueryLimit";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v85 = &unk_1F256A2F8;
  }
  id v88 = v85;

  *((_DWORD *)v4 + 87) = [v88 unsignedIntegerValue];
  v89 = [v7 objectForKeyedSubscript:@"MapsSearchQueryFromDateInterval"];
  if (!v89 || (objc_opt_class(), char v90 = objc_opt_isKindOfClass(), v91 = v89, (v90 & 1) == 0))
  {
    v92 = MEMORY[0x1E4F14500];
    id v93 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"MapsSearchQueryFromDateInterval";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v91 = &unk_1F256A340;
  }
  id v94 = v91;

  [v94 doubleValue];
  *((void *)v4 + 44) = v95;

  char v96 = [v7 objectForKeyedSubscript:@"ExtractionAlgorithmConfiguration"];
  if (!v96 || (objc_opt_class(), char v97 = objc_opt_isKindOfClass(), v98 = v96, (v97 & 1) == 0))
  {
    id v99 = MEMORY[0x1E4F14500];
    id v100 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      int v103 = 138412290;
      uint64_t v104 = @"ExtractionAlgorithmConfiguration";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v103, 0xCu);
    }

    v98 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v101 = v98;

  int v102 = (void *)*((void *)v4 + 18);
  *((void *)v4 + 18) = v101;
}

- (void)_loadNamedEntitiesConfigParams
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__PPConfiguration__loadNamedEntitiesConfigParams__block_invoke;
  v3[3] = &unk_1E65DBF88;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __49__PPConfiguration__loadNamedEntitiesConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadNamedEntitiesConfigParamsWithGuardedData:a2];
}

- (void)_loadQuickTypeConfigParamsWithGuardedData:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  uint64_t v7 = [v6 plistForFactorName:@"configuration_quicktype.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_QUICKTYPE"];

  if ((unint64_t)[v7 count] <= 1)
  {
    uint64_t v8 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];

    if (v8)
    {
      int v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v45) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad contacts configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v45, 2u);
      }

      id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v11 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
      uint64_t v12 = [v11 defaultFilepathForFactor:@"configuration_quicktype.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_QUICKTYPE"];
      uint64_t v13 = [v10 initWithContentsOfFile:v12];

      uint64_t v7 = (void *)v13;
    }
  }
  id v14 = [v7 objectForKeyedSubscript:@"NavigationMinimumDistanceInMeters"];
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), float v16 = v14, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v45 = 138412290;
      char v46 = @"NavigationMinimumDistanceInMeters";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    float v16 = &unk_1F256B290;
  }
  id v17 = v16;

  [v17 doubleValue];
  uint64_t v19 = v18;

  v4[49] = v19;
  uint64_t v20 = [v7 objectForKeyedSubscript:@"NavigationMinimumDistanceInMeters"];
  if (!v20 || (objc_opt_class(), char v21 = objc_opt_isKindOfClass(), v22 = v20, (v21 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v45 = 138412290;
      char v46 = @"NavigationMinimumDistanceInMeters";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    id v22 = &unk_1F256B290;
  }
  id v23 = v22;

  int v24 = [v23 unsignedIntegerValue];
  *((_DWORD *)v4 + 100) = v24;
  id v25 = [v7 objectForKeyedSubscript:@"NextEventFuzzMinutes"];
  if (!v25 || (objc_opt_class(), char v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v45 = 138412290;
      char v46 = @"NextEventFuzzMinutes";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    char v27 = &unk_1F256B290;
  }
  id v28 = v27;

  char v29 = [v28 unsignedIntValue];
  *((unsigned char *)v4 + 404) = v29;
  id v30 = [v7 objectForKeyedSubscript:@"QueryTimeNextToMinutes"];
  if (!v30 || (objc_opt_class(), v31 = objc_opt_isKindOfClass(), char v32 = v30, (v31 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v45 = 138412290;
      char v46 = @"QueryTimeNextToMinutes";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    char v32 = &unk_1F256B290;
  }
  id v33 = v32;

  int v34 = [v33 unsignedIntegerValue];
  *((_DWORD *)v4 + 103) = v34;
  id v35 = [v7 objectForKeyedSubscript:@"QueryTimeNextFromMinutes"];
  if (!v35 || (objc_opt_class(), v36 = objc_opt_isKindOfClass(), id v37 = v35, (v36 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v45 = 138412290;
      char v46 = @"QueryTimeNextFromMinutes";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    id v37 = &unk_1F256B290;
  }
  id v38 = v37;

  int v39 = [v38 integerValue];
  *((_DWORD *)v4 + 102) = v39;
  uint64_t v40 = [v7 objectForKeyedSubscript:@"QueryTimeOtherToMinutes"];
  if (!v40 || (objc_opt_class(), char v41 = objc_opt_isKindOfClass(), v42 = v40, (v41 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v45 = 138412290;
      char v46 = @"QueryTimeOtherToMinutes";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v45, 0xCu);
    }
    id v42 = &unk_1F256B290;
  }
  id v43 = v42;

  int v44 = [v43 unsignedIntegerValue];
  *((_DWORD *)v4 + 104) = v44;
}

- (void)_loadQuickTypeConfigParams
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PPConfiguration__loadQuickTypeConfigParams__block_invoke;
  v3[3] = &unk_1E65DBF88;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __45__PPConfiguration__loadQuickTypeConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadQuickTypeConfigParamsWithGuardedData:a2];
}

- (void)_loadSocialHighlightConfigParamsWithGuardedData:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  uint64_t v7 = [v6 plistForFactorName:@"configuration_social_highlight.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"];

  if ((unint64_t)[v7 count] <= 1)
  {
    uint64_t v8 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];

    if (v8)
    {
      int v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v59) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad social highlights configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v59, 2u);
      }

      id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v11 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
      uint64_t v12 = [v11 defaultFilepathForFactor:@"configuration_social_highlight.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"];
      uint64_t v13 = [v10 initWithContentsOfFile:v12];

      uint64_t v7 = (void *)v13;
    }
  }
  id v14 = [v7 objectForKeyedSubscript:@"MaxRelevantContacts"];
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), float v16 = v14, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v59 = 138412290;
      id v60 = @"MaxRelevantContacts";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    float v16 = &unk_1F256B290;
  }
  id v17 = v16;

  int v18 = [v17 unsignedIntegerValue];
  v4[108] = v18;
  uint64_t v19 = [v7 objectForKeyedSubscript:@"HighlightDecayInterval"];
  if (!v19 || (objc_opt_class(), char v20 = objc_opt_isKindOfClass(), v21 = v19, (v20 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v59 = 138412290;
      id v60 = @"HighlightDecayInterval";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    char v21 = &unk_1F256A370;
  }
  id v22 = v21;

  [v22 doubleValue];
  uint64_t v24 = v23;

  *((void *)v4 + 57) = v24;
  id v25 = [v7 objectForKeyedSubscript:@"RankedStorageMaxAge"];
  if (!v25 || (objc_opt_class(), char v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v59 = 138412290;
      id v60 = @"RankedStorageMaxAge";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    char v27 = &unk_1F256A3A0;
  }
  id v28 = v27;

  [v28 doubleValue];
  uint64_t v30 = v29;

  *((void *)v4 + 58) = v30;
  char v31 = [v7 objectForKeyedSubscript:@"CacheTimeoutInterval"];
  if (!v31 || (objc_opt_class(), char v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v59 = 138412290;
      id v60 = @"CacheTimeoutInterval";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    id v33 = &unk_1F256A388;
  }
  id v34 = v33;

  [v34 doubleValue];
  uint64_t v36 = v35;

  *((void *)v4 + 59) = v36;
  id v37 = [v7 objectForKeyedSubscript:@"FeedbackDeletionInterval"];
  if (!v37 || (objc_opt_class(), v38 = objc_opt_isKindOfClass(), int v39 = v37, (v38 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v59 = 138412290;
      id v60 = @"FeedbackDeletionInterval";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    int v39 = &unk_1F256A358;
  }
  id v40 = v39;

  [v40 doubleValue];
  uint64_t v42 = v41;

  *((void *)v4 + 60) = v42;
  id v43 = [v7 objectForKeyedSubscript:@"MetricReportingInterval"];
  if (!v43 || (objc_opt_class(), v44 = objc_opt_isKindOfClass(), int v45 = v43, (v44 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v59 = 138412290;
      id v60 = @"MetricReportingInterval";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    int v45 = &unk_1F256A358;
  }
  id v46 = v45;

  [v46 doubleValue];
  uint64_t v48 = v47;

  *((void *)v4 + 61) = v48;
  id v49 = [v7 objectForKeyedSubscript:@"MaxNumHighlights"];
  if (!v49 || (objc_opt_class(), char v50 = objc_opt_isKindOfClass(), v51 = v49, (v50 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v59 = 138412290;
      id v60 = @"MaxNumHighlights";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    int v51 = &unk_1F256A310;
  }
  id v52 = v51;

  int v53 = [v52 unsignedIntegerValue];
  v4[124] = v53;
  v54 = [v7 objectForKeyedSubscript:@"TopKCount"];
  if (!v54 || (objc_opt_class(), char v55 = objc_opt_isKindOfClass(), v56 = v54, (v55 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v59 = 138412290;
      id v60 = @"TopKCount";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v59, 0xCu);
    }
    id v56 = &unk_1F256A328;
  }
  id v57 = v56;

  int v58 = [v57 unsignedIntegerValue];
  v4[125] = v58;
}

- (void)_loadSocialHighlightConfigParams
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PPConfiguration__loadSocialHighlightConfigParams__block_invoke;
  v3[3] = &unk_1E65DBF88;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __51__PPConfiguration__loadSocialHighlightConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadSocialHighlightConfigParamsWithGuardedData:a2];
}

- (void)_loadUniversalSearchConfigParamsWithGuardedData:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  uint64_t v7 = [v6 plistForFactorName:@"config_universal_search.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_UNIVERSAL_SEARCH"];

  uint64_t v8 = pp_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v57 = 138412290;
    int v58 = v7;
    _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "ppunivSearch %@", (uint8_t *)&v57, 0xCu);
  }

  if ((unint64_t)[(__CFString *)v7 count] <= 1)
  {
    int v9 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];

    if (v9)
    {
      id v10 = pp_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v57) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad universal search configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v57, 2u);
      }

      id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v12 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
      uint64_t v13 = [v12 defaultFilepathForFactor:@"config_universal_search.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_UNIVERSAL_SEARCH"];
      uint64_t v14 = [v11 initWithContentsOfFile:v13];

      uint64_t v7 = (__CFString *)v14;
    }
  }
  float v15 = [(__CFString *)v7 objectForKeyedSubscript:@"MaxNEExtractions"];
  if (!v15 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v17 = v15, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v57 = 138412290;
      int v58 = @"MaxNEExtractions";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    id v17 = &unk_1F256B290;
  }
  id v18 = v17;

  unsigned __int8 v19 = [v18 unsignedIntValue];
  v4[109] = v19;
  char v20 = [(__CFString *)v7 objectForKeyedSubscript:@"ScoreThreshold"];
  if (!v20 || (objc_opt_class(), char v21 = objc_opt_isKindOfClass(), v22 = v20, (v21 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v57 = 138412290;
      int v58 = @"ScoreThreshold";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    id v22 = &unk_1F256B290;
  }
  id v23 = v22;

  [v23 doubleValue];
  uint64_t v25 = v24;

  *((void *)v4 + 55) = v25;
  char v26 = [(__CFString *)v7 objectForKeyedSubscript:@"StoreNewExtractions"];
  if (!v26 || (objc_opt_class(), char v27 = objc_opt_isKindOfClass(), v28 = v26, (v27 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v57 = 138412290;
      int v58 = @"StoreNewExtractions";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    id v28 = &unk_1F256B290;
  }
  id v29 = v28;

  char v30 = [v29 BOOLValue];
  *((unsigned char *)v4 + 448) = v30;
  char v31 = [(__CFString *)v7 objectForKeyedSubscript:@"UseRawNEExtractionScores"];
  if (!v31 || (objc_opt_class(), char v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v57 = 138412290;
      int v58 = @"UseRawNEExtractionScores";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    id v33 = &unk_1F256B290;
  }
  id v34 = v33;

  char v35 = [v34 BOOLValue];
  *((unsigned char *)v4 + 449) = v35;
  uint64_t v36 = [(__CFString *)v7 objectForKeyedSubscript:@"UseCachedPortraitScores"];
  if (!v36 || (objc_opt_class(), char v37 = objc_opt_isKindOfClass(), v38 = v36, (v37 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v57 = 138412290;
      int v58 = @"UseCachedPortraitScores";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    char v38 = &unk_1F256B290;
  }
  id v39 = v38;

  char v40 = [v39 BOOLValue];
  *((unsigned char *)v4 + 450) = v40;
  uint64_t v41 = [(__CFString *)v7 objectForKeyedSubscript:@"MaxItemsInFeatureDictionary"];
  if (!v41 || (objc_opt_class(), char v42 = objc_opt_isKindOfClass(), v43 = v41, (v42 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v57 = 138412290;
      int v58 = @"MaxItemsInFeatureDictionary";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    id v43 = &unk_1F256B290;
  }
  id v44 = v43;

  unsigned __int8 v45 = [v44 unsignedIntValue];
  v4[113] = v45;
  id v46 = [(__CFString *)v7 objectForKeyedSubscript:@"SkipInsignificantEmailExtractions"];
  if (!v46 || (objc_opt_class(), v47 = objc_opt_isKindOfClass(), uint64_t v48 = v46, (v47 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v57 = 138412290;
      int v58 = @"SkipInsignificantEmailExtractions";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    uint64_t v48 = &unk_1F256B290;
  }
  id v49 = v48;

  char v50 = [v49 BOOLValue];
  *((unsigned char *)v4 + 504) = v50;
  int v51 = [(__CFString *)v7 objectForKeyedSubscript:@"MaxEmailHarvestingEligiblityInterval"];
  if (!v51 || (objc_opt_class(), char v52 = objc_opt_isKindOfClass(), v53 = v51, (v52 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v57 = 138412290;
      int v58 = @"MaxEmailHarvestingEligiblityInterval";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v57, 0xCu);
    }
    int v53 = &unk_1F256A370;
  }
  id v54 = v53;

  [v54 doubleValue];
  uint64_t v56 = v55;

  *((void *)v4 + 64) = v56;
}

- (void)_loadUniversalSearchConfigParams
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PPConfiguration__loadUniversalSearchConfigParams__block_invoke;
  v3[3] = &unk_1E65DBF88;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __51__PPConfiguration__loadUniversalSearchConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadUniversalSearchConfigParamsWithGuardedData:a2];
}

- (void)_loadContactsConfigParamsWithGuardedData:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  uint64_t v7 = [v6 plistForFactorName:@"configuration_contacts.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_CONTACTS"];

  if ((unint64_t)[v7 count] <= 1)
  {
    uint64_t v8 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];

    if (v8)
    {
      int v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v36) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad contacts configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v36, 2u);
      }

      id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v11 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
      uint64_t v12 = [v11 defaultFilepathForFactor:@"configuration_contacts.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_CONTACTS"];
      uint64_t v13 = [v10 initWithContentsOfFile:v12];

      uint64_t v7 = (void *)v13;
    }
  }
  uint64_t v14 = [v7 objectForKeyedSubscript:@"ContactLabelScoringMap"];
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), float v16 = v14, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v36 = 138412290;
      char v37 = @"ContactLabelScoringMap";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v36, 0xCu);
    }
    float v16 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v17 = v16;

  id v18 = (void *)v4[46];
  v4[46] = v17;

  unsigned __int8 v19 = [v7 objectForKeyedSubscript:@"RecordSourceContactsInitialScore"];
  if (!v19 || (objc_opt_class(), char v20 = objc_opt_isKindOfClass(), v21 = v19, (v20 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v36 = 138412290;
      char v37 = @"RecordSourceContactsInitialScore";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v36, 0xCu);
    }
    char v21 = &unk_1F256B290;
  }
  id v22 = v21;

  [v22 floatValue];
  int v24 = v23;

  *((_DWORD *)v4 + 94) = v24;
  uint64_t v25 = [v7 objectForKeyedSubscript:@"RecordSourceNonContactsInitialScore"];
  if (!v25 || (objc_opt_class(), char v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v36 = 138412290;
      char v37 = @"RecordSourceNonContactsInitialScore";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v36, 0xCu);
    }
    char v27 = &unk_1F256B290;
  }
  id v28 = v27;

  [v28 floatValue];
  int v30 = v29;

  *((_DWORD *)v4 + 95) = v30;
  char v31 = [v7 objectForKeyedSubscript:@"PeopleSuggesterMaxCount"];
  if (!v31 || (objc_opt_class(), char v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v36 = 138412290;
      char v37 = @"PeopleSuggesterMaxCount";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v36, 0xCu);
    }
    id v33 = &unk_1F256B290;
  }
  id v34 = v33;

  char v35 = [v34 unsignedIntValue];
  *((unsigned char *)v4 + 384) = v35;
}

- (void)_loadContactsConfigParams
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PPConfiguration__loadContactsConfigParams__block_invoke;
  v3[3] = &unk_1E65DBF88;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __44__PPConfiguration__loadContactsConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadContactsConfigParamsWithGuardedData:a2];
}

- (void)_loadLocationsConfigParamsWithGuardedData:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  uint64_t v7 = [v6 plistForFactorName:@"configuration_locations.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];

  if ((unint64_t)[v7 count] <= 1)
  {
    uint64_t v8 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];

    if (v8)
    {
      int v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v69) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad locations configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v69, 2u);
      }

      id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v11 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
      uint64_t v12 = [v11 defaultFilepathForFactor:@"configuration_locations.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];
      uint64_t v13 = [v10 initWithContentsOfFile:v12];

      uint64_t v7 = (void *)v13;
    }
  }
  uint64_t v14 = [v7 objectForKeyedSubscript:@"Use2StageScoreInterpreterForLocationScoring"];
  if (!v14 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), float v16 = v14, (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"Use2StageScoreInterpreterForLocationScoring";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    float v16 = &unk_1F256B290;
  }
  id v17 = v16;

  char v18 = [v17 BOOLValue];
  v4[282] = v18;
  unsigned __int8 v19 = [v7 objectForKeyedSubscript:@"LocationDecayHalfLifeSeconds"];
  if (!v19 || (objc_opt_class(), char v20 = objc_opt_isKindOfClass(), v21 = v19, (v20 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"LocationDecayHalfLifeSeconds";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    char v21 = &unk_1F256B290;
  }
  id v22 = v21;

  [v22 doubleValue];
  uint64_t v24 = v23;

  *((void *)v4 + 30) = v24;
  uint64_t v25 = [v7 objectForKeyedSubscript:@"ScoreThresholdForLocation"];
  if (!v25 || (objc_opt_class(), char v26 = objc_opt_isKindOfClass(), v27 = v25, (v26 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"ScoreThresholdForLocation";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    char v27 = &unk_1F256B290;
  }
  id v28 = v27;

  [v28 floatValue];
  int v30 = v29;

  *((_DWORD *)v4 + 47) = v30;
  char v31 = [v7 objectForKeyedSubscript:@"LocationScoringUsesCoreML"];
  if (!v31 || (objc_opt_class(), char v32 = objc_opt_isKindOfClass(), v33 = v31, (v32 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"LocationScoringUsesCoreML";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    id v33 = &unk_1F256B290;
  }
  id v34 = v33;

  char v35 = [v34 BOOLValue];
  v4[296] = v35;
  int v36 = [v7 objectForKeyedSubscript:@"LocationFeedbackUsesCoreML"];
  if (!v36 || (objc_opt_class(), char v37 = objc_opt_isKindOfClass(), v38 = v36, (v37 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"LocationFeedbackUsesCoreML";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    uint64_t v38 = &unk_1F256B290;
  }
  id v39 = v38;

  char v40 = [v39 BOOLValue];
  v4[267] = v40;
  uint64_t v41 = [v7 objectForKeyedSubscript:@"LocationScoringUsesHybrid"];
  if (!v41 || (objc_opt_class(), char v42 = objc_opt_isKindOfClass(), v43 = v41, (v42 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"LocationScoringUsesHybrid";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    id v43 = &unk_1F256B290;
  }
  id v44 = v43;

  char v45 = [v44 BOOLValue];
  v4[254] = v45;
  id v46 = [v7 objectForKeyedSubscript:@"RoutineExtractionScoreCountWeight"];
  if (!v46 || (objc_opt_class(), v47 = objc_opt_isKindOfClass(), uint64_t v48 = v46, (v47 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"RoutineExtractionScoreCountWeight";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    uint64_t v48 = &unk_1F256B290;
  }
  id v49 = v48;

  [v49 doubleValue];
  uint64_t v51 = v50;

  *((void *)v4 + 38) = v51;
  char v52 = [v7 objectForKeyedSubscript:@"RoutineExtractionScoreDurationWeight"];
  if (!v52 || (objc_opt_class(), char v53 = objc_opt_isKindOfClass(), v54 = v52, (v53 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"RoutineExtractionScoreDurationWeight";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    id v54 = &unk_1F256B290;
  }
  id v55 = v54;

  [v55 doubleValue];
  uint64_t v57 = v56;

  *((void *)v4 + 39) = v57;
  int v58 = [v7 objectForKeyedSubscript:@"RoutineExtractionScoreDecayHalfLifeDays"];
  if (!v58 || (objc_opt_class(), char v59 = objc_opt_isKindOfClass(), v60 = v58, (v59 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"RoutineExtractionScoreDecayHalfLifeDays";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    id v60 = &unk_1F256B290;
  }
  id v61 = v60;

  [v61 doubleValue];
  uint64_t v63 = v62;

  *((void *)v4 + 40) = v63;
  char v64 = [v7 objectForKeyedSubscript:@"ExtractionAlgorithmConfiguration"];
  if (!v64 || (objc_opt_class(), v65 = objc_opt_isKindOfClass(), id v66 = v64, (v65 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v69 = 138412290;
      char v70 = @"ExtractionAlgorithmConfiguration";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v69, 0xCu);
    }
    id v66 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v67 = v66;

  id v68 = (void *)*((void *)v4 + 20);
  *((void *)v4 + 20) = v67;
}

- (void)_loadLocationsConfigParams
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PPConfiguration__loadLocationsConfigParams__block_invoke;
  v3[3] = &unk_1E65DBF88;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __45__PPConfiguration__loadLocationsConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadLocationsConfigParamsWithGuardedData:a2];
}

- (void)_loadGlobalConfigParamsWithGuardedData:(id)a3
{
  v200[1] = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  uint64_t v7 = [v6 plistForFactorName:@"configuration.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL"];

  if ((unint64_t)[v7 count] <= 1)
  {
    uint64_t v8 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];

    if (v8)
    {
      int v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v198) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPConfiguration: loaded a bad configuration plist from Trial. Falling back to assets in the build.", (uint8_t *)&v198, 2u);
      }

      id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v11 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
      uint64_t v12 = [v11 defaultFilepathForFactor:@"configuration.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL"];
      uint64_t v13 = [v10 initWithContentsOfFile:v12];

      uint64_t v7 = (void *)v13;
    }
  }
  uint64_t v14 = [(PPConfiguration *)self trialWrapperReloadingIfNeeded];
  uint64_t v15 = [v14 concatenatedTreatmentNames];
  float v16 = (void *)v15;
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  else {
    id v17 = @"TRIAL_NOT_AVAILABLE";
  }
  char v18 = v17;

  objc_storeStrong(v4 + 12, v17);
  objc_storeStrong(v4 + 13, v17);
  v200[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:1];
  id v20 = v4[14];
  v4[14] = (id)v19;

  char v21 = [v7 objectForKeyedSubscript:@"HalfValuePosition"];
  if (!v21 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), uint64_t v23 = v21, (isKindOfClass & 1) == 0))
  {
    uint64_t v24 = MEMORY[0x1E4F14500];
    id v25 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"HalfValuePosition";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    uint64_t v23 = &unk_1F256B290;
  }
  id v26 = v23;

  [v26 doubleValue];
  v4[2] = v27;

  id v28 = [v7 objectForKeyedSubscript:@"NonReaderTextWeight"];
  if (!v28 || (objc_opt_class(), v29 = objc_opt_isKindOfClass(), int v30 = v28, (v29 & 1) == 0))
  {
    char v31 = MEMORY[0x1E4F14500];
    id v32 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"NonReaderTextWeight";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    int v30 = &unk_1F256B290;
  }
  id v33 = v30;

  [v33 doubleValue];
  v4[3] = v34;

  char v35 = [v7 objectForKeyedSubscript:@"AnalyticsSamplingRate"];
  if (!v35 || (objc_opt_class(), v36 = objc_opt_isKindOfClass(), char v37 = v35, (v36 & 1) == 0))
  {
    uint64_t v38 = MEMORY[0x1E4F14500];
    id v39 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"AnalyticsSamplingRate";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    char v37 = &unk_1F256B290;
  }
  id v40 = v37;

  [v40 doubleValue];
  v4[4] = v41;

  char v42 = [v7 objectForKeyedSubscript:@"MusicDataCollectionSamplingRateForCTS"];
  if (!v42 || (objc_opt_class(), char v43 = objc_opt_isKindOfClass(), v44 = v42, (v43 & 1) == 0))
  {
    char v45 = MEMORY[0x1E4F14500];
    id v46 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"MusicDataCollectionSamplingRateForCTS";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    id v44 = &unk_1F256B290;
  }
  id v47 = v44;

  [v47 doubleValue];
  v4[5] = v48;

  id v49 = [v7 objectForKeyedSubscript:@"MusicDataCollectionSamplingRateForAMP"];
  if (!v49 || (objc_opt_class(), char v50 = objc_opt_isKindOfClass(), v51 = v49, (v50 & 1) == 0))
  {
    char v52 = MEMORY[0x1E4F14500];
    id v53 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"MusicDataCollectionSamplingRateForAMP";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    uint64_t v51 = &unk_1F256B290;
  }
  id v54 = v51;

  [v54 doubleValue];
  v4[6] = v55;

  uint64_t v56 = [v7 objectForKeyedSubscript:@"MusicDataCollectionMaximumRecordsPerType"];
  if (!v56 || (objc_opt_class(), char v57 = objc_opt_isKindOfClass(), v58 = v56, (v57 & 1) == 0))
  {
    char v59 = MEMORY[0x1E4F14500];
    id v60 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"MusicDataCollectionMaximumRecordsPerType";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    int v58 = &unk_1F256B290;
  }
  id v61 = v58;

  *((_DWORD *)v4 + 14) = [v61 intValue];
  uint64_t v62 = [v7 objectForKeyedSubscript:@"MusicDataCollectionCollectNonAMPNowPlaying"];
  if (!v62 || (objc_opt_class(), v63 = objc_opt_isKindOfClass(), char v64 = v62, (v63 & 1) == 0))
  {
    char v65 = MEMORY[0x1E4F14500];
    id v66 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"MusicDataCollectionCollectNonAMPNowPlaying";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    char v64 = &unk_1F256B290;
  }
  id v67 = v64;

  *((unsigned char *)v4 + 60) = [v67 BOOLValue];
  id v68 = [v7 objectForKeyedSubscript:@"MusicDataCollectionAMPBundleIds"];
  if (!v68 || (objc_opt_class(), char v69 = objc_opt_isKindOfClass(), v70 = v68, (v69 & 1) == 0))
  {
    uint64_t v71 = MEMORY[0x1E4F14500];
    id v72 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"MusicDataCollectionAMPBundleIds";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    char v70 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v73 = v70;

  id v74 = v4[8];
  v4[8] = v73;

  id v75 = [v7 objectForKeyedSubscript:@"SportsMetricsNumberOfTeamsLogged"];
  if (!v75 || (objc_opt_class(), char v76 = objc_opt_isKindOfClass(), v77 = v75, (v76 & 1) == 0))
  {
    char v78 = MEMORY[0x1E4F14500];
    id v79 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"SportsMetricsNumberOfTeamsLogged";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v77 = &unk_1F256B290;
  }
  id v80 = v77;

  *((_DWORD *)v4 + 18) = [v80 intValue];
  id v81 = [v7 objectForKeyedSubscript:@"SportsMetricsNumberOfLeaguesLogged"];
  if (!v81 || (objc_opt_class(), v82 = objc_opt_isKindOfClass(), char v83 = v81, (v82 & 1) == 0))
  {
    char v84 = MEMORY[0x1E4F14500];
    id v85 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"SportsMetricsNumberOfLeaguesLogged";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    char v83 = &unk_1F256B290;
  }
  id v86 = v83;

  *((_DWORD *)v4 + 19) = [v86 intValue];
  id v87 = [v7 objectForKeyedSubscript:@"SportsMetricsEventName"];
  if (!v87 || (objc_opt_class(), char v88 = objc_opt_isKindOfClass(), v89 = v87, (v88 & 1) == 0))
  {
    char v90 = MEMORY[0x1E4F14500];
    id v91 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"SportsMetricsEventName";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v89 = &stru_1F253DF18;
  }
  v92 = v89;

  id v93 = v4[10];
  v4[10] = v92;

  id v94 = [v7 objectForKeyedSubscript:@"SportsMetricsSamplingRate"];
  if (!v94 || (objc_opt_class(), v95 = objc_opt_isKindOfClass(), char v96 = v94, (v95 & 1) == 0))
  {
    char v97 = MEMORY[0x1E4F14500];
    id v98 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"SportsMetricsSamplingRate";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    char v96 = &unk_1F256B290;
  }
  id v99 = v96;

  [v99 doubleValue];
  v4[11] = v100;

  id v101 = [v7 objectForKeyedSubscript:@"TopicsSourceMultiplier"];
  if (!v101 || (objc_opt_class(), char v102 = objc_opt_isKindOfClass(), v103 = v101, (v102 & 1) == 0))
  {
    uint64_t v104 = MEMORY[0x1E4F14500];
    id v105 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"TopicsSourceMultiplier";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    int v103 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v106 = v103;

  id v107 = v4[16];
  v4[16] = v106;

  v108 = [v7 objectForKeyedSubscript:@"TopicsAlgorithmMultiplier"];
  if (!v108 || (objc_opt_class(), char v109 = objc_opt_isKindOfClass(), v110 = v108, (v109 & 1) == 0))
  {
    v111 = MEMORY[0x1E4F14500];
    id v112 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"TopicsAlgorithmMultiplier";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v110 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v113 = v110;

  id v114 = v4[17];
  v4[17] = v113;

  v115 = [v7 objectForKeyedSubscript:@"SafariDonationTitleExtractionEnabled"];
  if (!v115 || (objc_opt_class(), char v116 = objc_opt_isKindOfClass(), v117 = v115, (v116 & 1) == 0))
  {
    v118 = MEMORY[0x1E4F14500];
    id v119 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"SafariDonationTitleExtractionEnabled";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v117 = &unk_1F256B290;
  }
  id v120 = v117;

  *((unsigned char *)v4 + 176) = [v120 BOOLValue];
  v121 = [v7 objectForKeyedSubscript:@"SafariDataDetectorsEnabledForHighMemoryDevices"];
  if (!v121 || (objc_opt_class(), char v122 = objc_opt_isKindOfClass(), v123 = v121, (v122 & 1) == 0))
  {
    v124 = MEMORY[0x1E4F14500];
    id v125 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"SafariDataDetectorsEnabledForHighMemoryDevices";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v123 = &unk_1F256B290;
  }
  id v126 = v123;

  *((unsigned char *)v4 + 177) = [v126 BOOLValue];
  v127 = [v7 objectForKeyedSubscript:@"FeedbackSessionLogsSamplingRate"];
  if (!v127 || (objc_opt_class(), char v128 = objc_opt_isKindOfClass(), v129 = v127, (v128 & 1) == 0))
  {
    v130 = MEMORY[0x1E4F14500];
    id v131 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"FeedbackSessionLogsSamplingRate";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v129 = &unk_1F256B290;
  }
  id v132 = v129;

  [v132 floatValue];
  *((_DWORD *)v4 + 48) = v133;

  v134 = [v7 objectForKeyedSubscript:@"FeedbackSessionLogsSamplingRateOverrides"];
  if (!v134 || (objc_opt_class(), char v135 = objc_opt_isKindOfClass(), v136 = v134, (v135 & 1) == 0))
  {
    v137 = MEMORY[0x1E4F14500];
    id v138 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"FeedbackSessionLogsSamplingRateOverrides";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v136 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v139 = v136;

  id v140 = v4[25];
  v4[25] = v139;

  v141 = [v7 objectForKeyedSubscript:@"FeedbackSessionLogsExtractionsSamplingRate"];
  if (!v141 || (objc_opt_class(), char v142 = objc_opt_isKindOfClass(), v143 = v141, (v142 & 1) == 0))
  {
    v144 = MEMORY[0x1E4F14500];
    id v145 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"FeedbackSessionLogsExtractionsSamplingRate";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v143 = &unk_1F256B290;
  }
  id v146 = v143;

  [v146 floatValue];
  *((_DWORD *)v4 + 52) = v147;

  v148 = [v7 objectForKeyedSubscript:@"FeedbackSessionLogsGeohashLength"];
  if (!v148 || (objc_opt_class(), char v149 = objc_opt_isKindOfClass(), v150 = v148, (v149 & 1) == 0))
  {
    v151 = MEMORY[0x1E4F14500];
    id v152 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"FeedbackSessionLogsGeohashLength";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v150 = &unk_1F256B290;
  }
  id v153 = v150;

  *((_DWORD *)v4 + 53) = [v153 intValue];
  v154 = [v7 objectForKeyedSubscript:@"AnalyticsMaximumNumberOfRecords"];
  if (!v154 || (objc_opt_class(), char v155 = objc_opt_isKindOfClass(), v156 = v154, (v155 & 1) == 0))
  {
    v157 = MEMORY[0x1E4F14500];
    id v158 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"AnalyticsMaximumNumberOfRecords";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v156 = &unk_1F256B290;
  }
  id v159 = v156;

  *((_DWORD *)v4 + 54) = [v159 intValue];
  v160 = [v7 objectForKeyedSubscript:@"DecayedFeedbackCountsHalfLifeDays"];
  if (!v160 || (objc_opt_class(), char v161 = objc_opt_isKindOfClass(), v162 = v160, (v161 & 1) == 0))
  {
    v163 = MEMORY[0x1E4F14500];
    id v164 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"DecayedFeedbackCountsHalfLifeDays";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v162 = &unk_1F256B290;
  }
  id v165 = v162;

  [v165 doubleValue];
  v4[32] = v166;

  v167 = [v7 objectForKeyedSubscript:@"NotificationExtractionEnabled"];
  if (!v167 || (objc_opt_class(), char v168 = objc_opt_isKindOfClass(), v169 = v167, (v168 & 1) == 0))
  {
    v170 = MEMORY[0x1E4F14500];
    id v171 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"NotificationExtractionEnabled";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v169 = &unk_1F256B290;
  }
  id v172 = v169;

  *((unsigned char *)v4 + 264) = [v172 BOOLValue];
  v173 = [v7 objectForKeyedSubscript:@"EngagementKValues"];
  if (!v173 || (objc_opt_class(), char v174 = objc_opt_isKindOfClass(), v175 = v173, (v174 & 1) == 0))
  {
    v176 = MEMORY[0x1E4F14500];
    id v177 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"EngagementKValues";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v175 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v178 = v175;

  id v179 = v4[34];
  v4[34] = v178;

  v180 = [v7 objectForKeyedSubscript:@"SentenceEmbeddingVersion"];
  if (!v180 || (objc_opt_class(), char v181 = objc_opt_isKindOfClass(), v182 = v180, (v181 & 1) == 0))
  {
    v183 = MEMORY[0x1E4F14500];
    id v184 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"SentenceEmbeddingVersion";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v182 = &unk_1F256B290;
  }
  id v185 = v182;

  v4[53] = (id)[v185 unsignedIntegerValue];
  v186 = [v7 objectForKeyedSubscript:@"EnableECRMessageTokenCountsPlugin"];
  if (!v186 || (objc_opt_class(), char v187 = objc_opt_isKindOfClass(), v188 = v186, (v187 & 1) == 0))
  {
    v189 = MEMORY[0x1E4F14500];
    id v190 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"EnableECRMessageTokenCountsPlugin";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v188 = &unk_1F256B290;
  }
  id v191 = v188;

  *((unsigned char *)v4 + 520) = [v191 BOOLValue];
  v192 = [v7 objectForKeyedSubscript:@"MaxUniqueTokensInECRTokenCounts"];
  if (!v192 || (objc_opt_class(), char v193 = objc_opt_isKindOfClass(), v194 = v192, (v193 & 1) == 0))
  {
    v195 = MEMORY[0x1E4F14500];
    id v196 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
    {
      int v198 = 138412290;
      v199 = @"MaxUniqueTokensInECRTokenCounts";
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v198, 0xCu);
    }

    v194 = &unk_1F256A3B8;
  }
  id v197 = v194;

  v4[66] = (id)[v197 unsignedLongValue];
}

- (void)_loadGlobalConfigParams
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PPConfiguration__loadGlobalConfigParams__block_invoke;
  v3[3] = &unk_1E65DBF88;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __42__PPConfiguration__loadGlobalConfigParams__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadGlobalConfigParamsWithGuardedData:a2];
}

- (id)trialWrapperReloadingIfNeeded
{
  trialWrapper = self->_trialWrapper;
  if (trialWrapper)
  {
    float v3 = trialWrapper;
  }
  else
  {
    float v3 = +[PPTrialWrapper sharedInstance];
  }
  return v3;
}

- (PPConfiguration)initWithTrialWrapper:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PPConfiguration;
  val = [(PPConfiguration *)&v27 init];
  if (val)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = [v5 initWithGuardedData:v6];
    lock = val->_lock;
    val->_lock = (_PASLock *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:32];
    cachedAlgorithms = val->_cachedAlgorithms;
    val->_cachedAlgorithms = (_PASLRUCache *)v9;

    objc_storeStrong((id *)&val->_trialWrapper, a3);
    [(PPConfiguration *)val _loadConfigParams];
    id location = 0;
    objc_initWeak(&location, val);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [&unk_1F256AF70 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(&unk_1F256AF70);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          trialWrapper = val->_trialWrapper;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __40__PPConfiguration_initWithTrialWrapper___block_invoke;
          v20[3] = &unk_1E65DBF60;
          v20[4] = v14;
          objc_copyWeak(&v21, &location);
          id v16 = [(PPTrialWrapper *)trialWrapper addUpdateHandlerForNamespaceName:v14 block:v20];
          objc_destroyWeak(&v21);
        }
        uint64_t v11 = [&unk_1F256AF70 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v11);
    }
    objc_destroyWeak(&location);
  }

  return val;
}

void __40__PPConfiguration_initWithTrialWrapper___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPConfiguration: updating data in namespace %@ because of trial update.", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"PERSONALIZATION_PORTRAIT_GLOBAL"])
    {
      [WeakRetained _loadGlobalConfigParams];
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"PERSONALIZATION_PORTRAIT_TOPICS"])
    {
      [WeakRetained _loadTopicsConfigParams];
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"])
    {
      [WeakRetained _loadNamedEntitiesConfigParams];
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"PERSONALIZATION_PORTRAIT_LOCATIONS"])
    {
      [WeakRetained _loadLocationsConfigParams];
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"PERSONALIZATION_PORTRAIT_CONTACTS"])
    {
      [WeakRetained _loadContactsConfigParams];
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"PERSONALIZATION_PORTRAIT_QUICKTYPE"])
    {
      [WeakRetained _loadQuickTypeConfigParams];
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"])
    {
      [WeakRetained _loadSocialHighlightConfigParams];
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"PERSONALIZATION_PORTRAIT_UNIVERSAL_SEARCH"])
    {
      [WeakRetained _loadUniversalSearchConfigParams];
    }
    [WeakRetained[3] removeAllObjects];
  }
}

+ (void)reload
{
  pthread_mutex_lock(&configLock_25742);
  v2 = [PPConfiguration alloc];
  uint64_t v3 = +[PPTrialWrapper sharedInstance];
  uint64_t v4 = [(PPConfiguration *)v2 initWithTrialWrapper:v3];
  int v5 = (void *)sharedConfig;
  sharedConfig = v4;

  pthread_mutex_unlock(&configLock_25742);
}

@end