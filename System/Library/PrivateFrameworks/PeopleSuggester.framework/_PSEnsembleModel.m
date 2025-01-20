@interface _PSEnsembleModel
+ (id)_suggestionInteractionPredicatesForFirstPartyMessages:(BOOL)a3 bundleID:(id)a4 interactionRecipients:(id)a5;
+ (id)feedbackDictionary;
+ (id)orderedSuggestionProxiesWithProxyOrder:(id)a3 suggestionProxies:(id)a4 suggestionsWithSharePlayAddedBlock:(id)a5;
+ (void)forgetSession:(id)a3;
+ (void)saveFeedback:(id)a3 forSessionId:(id)a4 feedbackActionType:(int64_t)a5 isFallbackFetch:(BOOL)a6;
- (AMLPipelineLogger)amlPipelineLogger;
- (BOOL)PSConfidenceModelInUse;
- (BOOL)allowConcurrentReads;
- (BOOL)allowNonSupportedBundleIDs;
- (BOOL)areRecipientsBlockedForSuggestion:(id)a3;
- (BOOL)copyRemoteRuleMinerMLModel:(id)a3;
- (BOOL)coreMLModelNeedsDurableFeatures;
- (BOOL)enablePipelineCheckpointing;
- (BOOL)excludeSuggestionWithConversationId:(id)a3;
- (BOOL)loadPSConfig:(id)a3;
- (BOOL)loadPSConfigPath:(id)a3;
- (BOOL)supportsDirectAutocompleteModelInit;
- (BOOL)useSyntheticSharingInteractions;
- (CNContactStore)contactStore;
- (NSArray)allOtherInteractionCacheDirections;
- (NSArray)allOtherInteractionCacheMechanism;
- (NSArray)defaultContactKeysToFetch;
- (NSArray)messageDirections;
- (NSArray)shareSheetMechanisms;
- (NSDictionary)psConfig;
- (NSDictionary)psConfigForAdaptableModel;
- (NSNumber)maxCandidatesFromMessageCache;
- (NSNumber)maxCandidatesFromShareSheetCache;
- (NSNumber)messageMechanism;
- (NSSet)cachedSupportedBundleIDs;
- (NSString)currentSpanId;
- (NSString)traceId;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialID;
- (NSString)trialTreatmentId;
- (NSUserDefaults)peopleSuggesterDefaults;
- (PPContactStore)portraitContactStore;
- (PPTopicStore)topicStore;
- (TRIClient)trialClient;
- (TRITrackingId)trialTrackingID;
- (_CDInteractionCache)allOtherInteractionCache;
- (_CDInteractionCache)messageInteractionCache;
- (_CDInteractionCache)shareInteractionCache;
- (_CDInteractionStore)interactionStore;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSConfidenceModelForSharing)confidenceModelForSharing;
- (_PSContactResolver)contactResolver;
- (_PSCoreMLScoringModel)coreMLScoringModel;
- (_PSEnsembleModel)init;
- (_PSFTZKWOrchestrator)zkwFTOrchestrator;
- (_PSFTZKWTrialData)zkwFTTrialData;
- (_PSHeuristics)heuristics;
- (_PSInteractionAndContactMonitor)contactMonitor;
- (_PSKNNModel)knnMapsModel;
- (_PSKNNModel)knnModel;
- (_PSKNNModel)knnNameOrContactRankerModel;
- (_PSKNNModel)knnSiriNLContactRankerModel;
- (_PSKNNModel)knnZkwModel;
- (_PSRuleMiningModel)ruleMiningModel;
- (_PSSharingContactRankerModel)sharingContactRankerModel;
- (id)_knnZKWSuggestionsWithPredictionContext:(id)a3 modelConfiguration:(id)a4 maxSuggestions:(unint64_t)a5;
- (id)appExtensionSuggestionsFromContext:(id)a3;
- (id)autocompleteSearchResultsWithPredictionContext:(id)a3;
- (id)candidatesForShareSheetRanking;
- (id)computeEphemeralFeaturesWithPredictionContext:(id)a3;
- (id)deviceIdentifier;
- (id)familyPredictionsWithMaxSuggestions:(unint64_t)a3 predictionContext:(id)a4;
- (id)fetchShareSheetSupportedBundleIDs;
- (id)fetchSupportedBundleIDsWithPredictionContextFilters:(id)a3;
- (id)finalSuggestionProxiesForInteractionStatistics:(id)a3 config:(id)a4 trialClient:(id)a5 context:(id)a6;
- (id)getLatestTrialMLModelVersion;
- (id)getMeContactIdentifier;
- (id)getModelProxiesArrayWithPredictionContext:(id)a3;
- (id)getModelSuggestionsProxyDictWithModelProxiesArray:(id)a3;
- (id)getPETMessageFrom:(id)a3 withConfig:(id)a4 andContext:(id)a5;
- (id)getPhotoBasedFeaturesAsync:(id)a3 withTimeout:(double)a4;
- (id)getSuggestionsFromInteractionsStatistics:(id)a3 withConfig:(id)a4 trialClient:(id)a5 andPredictionContext:(id)a6;
- (id)mapsSuggestionArrayWithArray:(id)a3 appendingUniqueElementsFromArray:(id)a4 contactResolver:(id)a5 meContactId:(id)a6;
- (id)mergedSuggestionsWithFamilySuggestions:(id)a3 shareSheetSuggestions:(id)a4 maxSuggestions:(unint64_t)a5 supportedBundleIds:(id)a6;
- (id)predictWithMapsPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4;
- (id)predictWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4;
- (id)predictWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4 contactKeysToFetch:(id)a5;
- (id)psr_getPhotoBasedFeaturesAsync:(id)a3 withTimeout:(double)a4;
- (id)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4;
- (id)rankedGlobalSuggestionsForSiriNLWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4 interactionId:(id)a5;
- (id)rankedGlobalSuggestionsWithPredictionContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(unint64_t)a5;
- (id)rankedGlobalSuggestionsWithPredictionContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(unint64_t)a5 excludeBackfillSuggestions:(BOOL)a6;
- (id)rankedHandlesFromCandidateHandles:(id)a3;
- (id)rankedNameSuggestionsWithPredictionContext:(id)a3 name:(id)a4;
- (id)rankedSiriMLCRHandles:(id)a3 context:(id)a4;
- (id)rerankMapsSuggestions:(id)a3 usingPredictionContext:(id)a4 contactResolver:(id)a5;
- (id)suggestZKWSuggestionsWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4;
- (id)suggestionsFromSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 contactKeysToFetch:(id)a5 meContactIdentifier:(id)a6 maxSuggestions:(unint64_t)a7;
- (id)trialIdentifier;
- (id)validateCoreMLModelWithRawInput:(id)a3 predictionContext:(id)a4;
- (int)modelProxyToVirtualFeatureStoreFeature:(id)a3;
- (int64_t)pruneCandidatesForRanking:(id)a3;
- (void)addAdaptedModelUsageInfoToSuggestions:(id)a3;
- (void)addAdditionalStatsSignalsToCandidates:(id)a3 withTrialClient:(id)a4;
- (void)addExtraInformationWithSuggestions:(id)a3 modelSuggestionProxiesDict:(id)a4;
- (void)addSuggestedRankFeature:(id)a3 interactionsStatistics:(id)a4;
- (void)addSupportedBundleIDs:(id)a3;
- (void)addTrialInfoToPredictionContext:(id)a3 withExperiment:(id)a4;
- (void)addUTIInfo:(id)a3 predictionContext:(id)a4;
- (void)discardAdaptedModel;
- (void)discardTrialModels;
- (void)enrichConfig:(id)a3 withInformationFromPredictionContext:(id)a4;
- (void)evaluateCandidates:(id)a3 psrMLModel:(id)a4;
- (void)freeCaches;
- (void)freeCachesIfNotCoreDuetDaemon;
- (void)getCoreMLSuggestionProxiesWithPredictionContext:(id)a3 modelSuggestionProxiesDict:(id)a4 candidateToFeatureVectorDictGetter:(id)a5;
- (void)getHeuristicSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5;
- (void)getKnnSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5;
- (void)getLatestTrialMLModelVersion;
- (void)getMeContactIdentifier;
- (void)getOtherSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5;
- (void)getPhotoBasedFeatures:(id)a3;
- (void)getRuleMiningSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5;
- (void)intializeKNNContactRankerModelWithInteractionStore:(id)a3 knowledgeStore:(id)a4;
- (void)loadDefaultAdaptableModelConfig;
- (void)loadDefaultPSConfig;
- (void)logPipeline:(id)a3 withPipelineStage:(id)a4 andSessionID:(id)a5 andCandidateNames:(id)a6;
- (void)logPipelineWithSuggestions:(id)a3 interactionsStatistics:(id)a4 pipelineStage:(id)a5 sessionID:(id)a6;
- (void)populateCaches;
- (void)populateCachesWithSupportedBundleIDs:(id)a3;
- (void)psrDataCollectionForContext:(id)a3 timeToWaitInSeconds:(int)a4 maxComputationTime:(double)a5 withConfigAndStatsBlock:(id)a6;
- (void)refreshCaches;
- (void)registerWithTrial;
- (void)sendDataToPETAsync:(id)a3 withConfig:(id)a4 andContext:(id)a5;
- (void)setAllOtherInteractionCache:(id)a3;
- (void)setAllOtherInteractionCacheDirections:(id)a3;
- (void)setAllOtherInteractionCacheMechanism:(id)a3;
- (void)setAllowNonSupportedBundleIDs:(BOOL)a3;
- (void)setAmlPipelineLogger:(id)a3;
- (void)setCachedSupportedBundleIDs:(id)a3;
- (void)setConfidenceModelForSharing:(id)a3;
- (void)setContactMonitor:(id)a3;
- (void)setContactResolver:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setCoreMLScoringModel:(id)a3;
- (void)setCurrentSpanId:(id)a3;
- (void)setDefaultContactKeysToFetch:(id)a3;
- (void)setEnablePipelineCheckpointing:(BOOL)a3;
- (void)setHeuristics:(id)a3;
- (void)setInteractionStore:(id)a3;
- (void)setKnnMapsModel:(id)a3;
- (void)setKnnModel:(id)a3;
- (void)setKnnNameOrContactRankerModel:(id)a3;
- (void)setKnnSiriNLContactRankerModel:(id)a3;
- (void)setKnnZkwModel:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setMaxCandidatesFromMessageCache:(id)a3;
- (void)setMaxCandidatesFromShareSheetCache:(id)a3;
- (void)setMessageDirections:(id)a3;
- (void)setMessageInteractionCache:(id)a3;
- (void)setMessageMechanism:(id)a3;
- (void)setPSConfidenceModelInUse:(BOOL)a3;
- (void)setPeopleAnalysisFromAssetsWithPredictionContext:(id)a3 identifiersOfPeopleInPhotos:(id)a4;
- (void)setPeopleSuggesterDefaults:(id)a3;
- (void)setPhotoAnalysisFromAssetsWithPredictionContext:(id)a3;
- (void)setPortraitContactStore:(id)a3;
- (void)setPsConfig:(id)a3;
- (void)setPsConfigForAdaptableModel:(id)a3;
- (void)setRuleMiningModel:(id)a3;
- (void)setShareInteractionCache:(id)a3;
- (void)setShareSheetMechanisms:(id)a3;
- (void)setSharingContactRankerModel:(id)a3;
- (void)setTopicStore:(id)a3;
- (void)setTraceId:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)setTrialDeploymentId:(id)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialID:(id)a3;
- (void)setTrialTrackingID:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
- (void)setUseSyntheticSharingInteractions:(BOOL)a3;
- (void)setZkwFTOrchestrator:(id)a3;
- (void)setZkwFTTrialData:(id)a3;
- (void)setupAeroMLPipelineLoggerWithModel:(id)a3;
- (void)updateFactorLevels;
- (void)updateTrialID:(id)a3;
@end

@implementation _PSEnsembleModel

- (_PSEnsembleModel)init
{
  v14.receiver = self;
  v14.super_class = (Class)_PSEnsembleModel;
  v2 = [(_PSEnsembleModel *)&v14 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_lock._os_unfair_lock_opaque = 0;
    v2->_populateCacheLock._os_unfair_lock_opaque = 0;
    v4 = [(_PSEnsembleModel *)v2 interactionStore];
    v5 = [(_PSEnsembleModel *)v3 knowledgeStore];
    [(_PSEnsembleModel *)v3 initializeEnsembleModelsWithInteractionStore:v4 knowledgeStore:v5];

    [(_PSEnsembleModel *)v3 loadDefaultPSConfig];
    [(_PSEnsembleModel *)v3 loadDefaultAdaptableModelConfig];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.coreduetd.queue", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v9 = [MEMORY[0x1E4F28B50] mainBundle];
    v10 = [v9 bundleIdentifier];
    v11 = +[_PSConstants mobileCoreDuetBundleId];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      if (init__pasOnceToken6 != -1) {
        dispatch_once(&init__pasOnceToken6, &__block_literal_global_4);
      }
    }
  }
  return v3;
}

- (BOOL)supportsDirectAutocompleteModelInit
{
  return 1;
}

+ (id)feedbackDictionary
{
  if (feedbackDictionary__pasOnceToken7 != -1) {
    dispatch_once(&feedbackDictionary__pasOnceToken7, &__block_literal_global_397);
  }
  v2 = (void *)feedbackDictionary__pasExprOnceResult;

  return v2;
}

+ (void)saveFeedback:(id)a3 forSessionId:(id)a4 feedbackActionType:(int64_t)a5 isFallbackFetch:(BOOL)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = +[_PSLogging rewriteChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2048;
    int64_t v25 = a5;
    _os_log_impl(&dword_1A314B000, v11, OS_LOG_TYPE_INFO, "Received feedback in coreduetd %@,%@,%ld", buf, 0x20u);
  }

  int v12 = +[_PSEnsembleModel feedbackDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81___PSEnsembleModel_saveFeedback_forSessionId_feedbackActionType_isFallbackFetch___block_invoke;
  v15[3] = &unk_1E5ADED30;
  id v16 = v10;
  id v17 = v9;
  int64_t v18 = a5;
  BOOL v19 = a6;
  id v13 = v9;
  id v14 = v10;
  [v12 runWithLockAcquired:v15];
}

+ (void)forgetSession:(id)a3
{
  id v3 = a3;
  v4 = +[_PSEnsembleModel feedbackDictionary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34___PSEnsembleModel_forgetSession___block_invoke;
  v6[3] = &unk_1E5ADED58;
  id v7 = v3;
  id v5 = v3;
  [v4 runWithLockAcquired:v6];
}

- (void)loadDefaultPSConfig
{
  id v3 = +[_PSConfig defaultConfig];
  [(_PSEnsembleModel *)self loadPSConfig:v3];
}

- (BOOL)loadPSConfigPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  id v12 = 0;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5 error:&v12];
  id v7 = v12;
  if (!v6)
  {
    v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSEnsembleModel loadPSConfigPath:]();
    }
  }
  BOOL v9 = [(_PSEnsembleModel *)self loadPSConfig:v6];
  if (v9)
  {
    id v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_INFO, "Trial: loaded psConfig from:%@", buf, 0xCu);
    }
  }
  return v9;
}

- (BOOL)loadPSConfig:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_psConfig, a3);
  psConfig = self->_psConfig;
  if (psConfig)
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    BOOL v9 = [v5 objectForKeyedSubscript:v8];

    uint64_t v10 = [v9 objectForKeyedSubscript:@"maxCandidatesFromShareSheetCache"];
    v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = &unk_1EF674CA0;
    }
    [(_PSEnsembleModel *)self setMaxCandidatesFromShareSheetCache:v12];

    uint64_t v13 = [v9 objectForKeyedSubscript:@"maxCandidatesFromMessageCache"];
    id v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = (void *)v13;
    }
    else {
      uint64_t v15 = &unk_1EF674CA0;
    }
    [(_PSEnsembleModel *)self setMaxCandidatesFromMessageCache:v15];

    id v16 = [v9 objectForKeyedSubscript:@"useSyntheticSharingInteractions"];
    -[_PSEnsembleModel setUseSyntheticSharingInteractions:](self, "setUseSyntheticSharingInteractions:", [v16 BOOLValue]);

    if ([(_PSEnsembleModel *)self useSyntheticSharingInteractions]) {
      id v17 = &unk_1EF675EA0;
    }
    else {
      id v17 = &unk_1EF675EB8;
    }
    objc_storeStrong((id *)&self->_shareSheetMechanisms, v17);
    messageDirections = self->_messageDirections;
    self->_messageDirections = (NSArray *)&unk_1EF675ED0;

    messageMechanism = self->_messageMechanism;
    self->_messageMechanism = (NSNumber *)&unk_1EF674D48;

    allOtherInteractionCacheDirections = self->_allOtherInteractionCacheDirections;
    self->_allOtherInteractionCacheDirections = (NSArray *)&unk_1EF675EE8;

    allOtherInteractionCacheMechanism = self->_allOtherInteractionCacheMechanism;
    self->_allOtherInteractionCacheMechanism = (NSArray *)&unk_1EF675F00;

    __int16 v22 = [(_PSEnsembleModel *)self ruleMiningModel];

    if (v22)
    {
      id v23 = [(_PSEnsembleModel *)self ruleMiningModel];
      [v23 updateModelProperties:self->_psConfig];
    }
    __int16 v24 = [(_PSEnsembleModel *)self sharingContactRankerModel];

    if (v24)
    {
      int64_t v25 = [(_PSEnsembleModel *)self sharingContactRankerModel];
      [v25 updateModelProperties:self->_psConfig];
    }
    uint64_t v26 = [(_PSEnsembleModel *)self knnModel];

    if (v26)
    {
      v27 = [(_PSEnsembleModel *)self knnModel];
      [v27 updateModelProperties:self->_psConfig];
    }
    v28 = [(_PSEnsembleModel *)self knnMapsModel];

    if (v28)
    {
      v29 = [(_PSEnsembleModel *)self knnMapsModel];
      [v29 updateModelProperties:self->_psConfig];
    }
    v30 = [(_PSEnsembleModel *)self knnZkwModel];

    if (v30)
    {
      v31 = [(_PSEnsembleModel *)self knnZkwModel];
      [v31 updateModelProperties:self->_psConfig];
    }
    v32 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];

    if (v32)
    {
      v33 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];
      [v33 updateModelProperties:self->_psConfig];
    }
    v34 = [(_PSEnsembleModel *)self heuristics];

    if (v34)
    {
      v35 = [(_PSEnsembleModel *)self heuristics];
      [v35 updateModelProperties:self->_psConfig];
    }
  }

  return psConfig != 0;
}

- (void)loadDefaultAdaptableModelConfig
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 URLForResource:@"com.apple.PeopleSuggester.Config.Default.AdaptableModel" withExtension:@"plist"];
  id v6 = [v4 path];

  id v5 = +[_PSBehaviorRuleRankingUtilities loadAdaptableModelConfig:v6];
  [(_PSEnsembleModel *)self setPsConfigForAdaptableModel:v5];
}

- (void)updateTrialID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 138412546;
    long long v16 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        v11 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          id v14 = [v10 reasonType];
          uint64_t v15 = [v10 reason];
          *(_DWORD *)buf = v16;
          __int16 v22 = v14;
          __int16 v23 = 2112;
          __int16 v24 = v15;
          _os_log_debug_impl(&dword_1A314B000, v11, OS_LOG_TYPE_DEBUG, "Suggestion ReasonType:%@, Reason:%@", buf, 0x16u);
        }
        id v12 = [(_PSEnsembleModel *)self trialID];
        uint64_t v13 = (void *)[v12 copy];
        [v10 setTrialID:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }
}

- (void)registerWithTrial
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v3 = (void *)getTRIClientClass_softClass;
  uint64_t v20 = getTRIClientClass_softClass;
  if (!getTRIClientClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __getTRIClientClass_block_invoke;
    uint64_t v15 = &unk_1E5ADE858;
    long long v16 = &v17;
    __getTRIClientClass_block_invoke((uint64_t)buf);
    id v3 = (void *)v18[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v17, 8);
  uint64_t v5 = [v4 clientWithIdentifier:210];
  trialClient = self->_trialClient;
  self->_trialClient = v5;

  if (self->_trialClient)
  {
    uint64_t v7 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "Trial: get trial client", buf, 2u);
    }

    [(_PSEnsembleModel *)self updateFactorLevels];
    objc_initWeak((id *)buf, self);
    uint64_t v8 = self->_trialClient;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37___PSEnsembleModel_registerWithTrial__block_invoke;
    v10[3] = &unk_1E5ADED80;
    objc_copyWeak(&v11, (id *)buf);
    id v9 = (id)[(TRIClient *)v8 addUpdateHandlerForNamespaceName:@"COREML_SYSTEMS_PEOPLE_SUGGESTER" usingBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)copyRemoteRuleMinerMLModel:(id)a3
{
  if (a3)
  {
    id v3 = +[_PSBehaviorRuleRankingUtilities compileMLModelAtPath:](_PSBehaviorRuleRankingUtilities, "compileMLModelAtPath:");
    if (v3)
    {
      id v4 = +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath];
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v4];
      if (+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:v4])
      {
        BOOL v6 = +[_PSBehaviorRuleRankingUtilities copyFileFromURL:v3 toURL:v5];
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_PSEnsembleModel copyRemoteRuleMinerMLModel:]();
    }

    return 0;
  }
  return v6;
}

- (void)discardAdaptedModel
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Discarding adapted model failed at path:%@", v2, v3, v4, v5, v6);
}

- (void)discardTrialModels
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9_0(&dword_1A314B000, v0, v1, "Discarding trial model failed at path:%@", v2, v3, v4, v5, v6);
}

- (id)getLatestTrialMLModelVersion
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v3 = +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath];
  if ([v2 fileExistsAtPath:v3])
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v3];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2050000000;
    uint64_t v5 = (void *)getMLModelClass_softClass_0;
    uint64_t v19 = getMLModelClass_softClass_0;
    if (!getMLModelClass_softClass_0)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getMLModelClass_block_invoke_0;
      v15[3] = &unk_1E5ADE858;
      void v15[4] = &v16;
      __getMLModelClass_block_invoke_0((uint64_t)v15);
      uint64_t v5 = (void *)v17[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v16, 8);
    id v14 = 0;
    uint64_t v7 = [v6 modelWithContentsOfURL:v4 error:&v14];
    id v8 = v14;
    if (v8)
    {
      id v9 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_PSEnsembleModel getLatestTrialMLModelVersion]();
      }
      uint64_t v10 = &stru_1EF653EA8;
    }
    else
    {
      id v9 = [v7 modelDescription];
      id v11 = [v9 metadata];
      id v12 = [v11 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
      uint64_t v10 = [v12 objectForKeyedSubscript:@"mlModelVersion"];
    }
  }
  else
  {
    uint64_t v10 = &stru_1EF653EA8;
  }

  return v10;
}

- (void)updateFactorLevels
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Trial: failed to load trial config, fallback to default config", v2, v3, v4, v5, v6);
}

- (BOOL)coreMLModelNeedsDurableFeatures
{
  uint64_t v3 = [(TRIClient *)self->_trialClient levelForFactor:@"coreMLModelNeedsDurableFeatures" withNamespaceName:@"COREML_SYSTEMS_PEOPLE_SUGGESTER"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(TRIClient *)self->_trialClient levelForFactor:@"coreMLModelNeedsDurableFeatures" withNamespaceName:@"COREML_SYSTEMS_PEOPLE_SUGGESTER"];
  char v5 = [v4 BOOLeanValue];

  return v5;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  knowledgeStore = self->_knowledgeStore;
  if (!knowledgeStore)
  {
    char v5 = [MEMORY[0x1E4F5B560] knowledgeStore];
    uint8_t v6 = self->_knowledgeStore;
    self->_knowledgeStore = v5;

    knowledgeStore = self->_knowledgeStore;
  }
  uint64_t v7 = knowledgeStore;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (BOOL)allowConcurrentReads
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];

  uint64_t v4 = +[_PSConstants mobileCoreDuetBundleId];
  v8[0] = v4;
  char v5 = +[_PSConstants macKnowledgeAgentBundleId];
  v8[1] = v5;
  uint8_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  LOBYTE(v2) = [v6 containsObject:v3];

  return (char)v2;
}

- (_CDInteractionStore)interactionStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  interactionStore = self->_interactionStore;
  if (!interactionStore)
  {
    char v5 = (void *)MEMORY[0x1E4F5B400];
    uint8_t v6 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    uint64_t v7 = [v5 storeWithDirectory:v6 readOnly:1];
    id v8 = self->_interactionStore;
    self->_interactionStore = v7;

    [(_CDInteractionStore *)self->_interactionStore setReadConcurrently:[(_PSEnsembleModel *)self allowConcurrentReads]];
    interactionStore = self->_interactionStore;
  }
  id v9 = interactionStore;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (NSUserDefaults)peopleSuggesterDefaults
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  peopleSuggesterDefaults = self->_peopleSuggesterDefaults;
  if (!peopleSuggesterDefaults)
  {
    char v5 = (NSUserDefaults *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PeopleSuggester"];
    uint8_t v6 = self->_peopleSuggesterDefaults;
    self->_peopleSuggesterDefaults = v5;

    peopleSuggesterDefaults = self->_peopleSuggesterDefaults;
  }
  uint64_t v7 = peopleSuggesterDefaults;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (CNContactStore)contactStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_contactStore && getuid())
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    uint64_t v4 = (void *)getCNContactStoreClass_softClass_0;
    uint64_t v13 = getCNContactStoreClass_softClass_0;
    if (!getCNContactStoreClass_softClass_0)
    {
      ContactsLibraryCore_0();
      v11[3] = (uint64_t)objc_getClass("CNContactStore");
      getCNContactStoreClass_softClass_0 = v11[3];
      uint64_t v4 = (void *)v11[3];
    }
    char v5 = v4;
    _Block_object_dispose(&v10, 8);
    uint8_t v6 = (CNContactStore *)objc_alloc_init(v5);
    contactStore = self->_contactStore;
    self->_contactStore = v6;
  }
  id v8 = self->_contactStore;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (NSArray)defaultContactKeysToFetch
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  defaultContactKeysToFetch = self->_defaultContactKeysToFetch;
  if (!defaultContactKeysToFetch)
  {
    _PSDefaultContactKeysToFetch();
    char v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint8_t v6 = self->_defaultContactKeysToFetch;
    self->_defaultContactKeysToFetch = v5;

    defaultContactKeysToFetch = self->_defaultContactKeysToFetch;
  }
  uint64_t v7 = defaultContactKeysToFetch;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)fetchShareSheetSupportedBundleIDs
{
  uint64_t v3 = [(_PSEnsembleModel *)self peopleSuggesterDefaults];
  -[_PSEnsembleModel setAllowNonSupportedBundleIDs:](self, "setAllowNonSupportedBundleIDs:", [v3 BOOLForKey:@"_PSAllowNonSupportedBundleIDs"]);

  uint64_t v4 = _PSShareSheetSuggestionBundleIDs([(_PSEnsembleModel *)self allowNonSupportedBundleIDs]);
  char v5 = [v4 allObjects];

  return v5;
}

- (void)populateCaches
{
  id v3 = [(_PSEnsembleModel *)self fetchShareSheetSupportedBundleIDs];
  [(_PSEnsembleModel *)self populateCachesWithSupportedBundleIDs:v3];
}

- (void)populateCachesWithSupportedBundleIDs:(id)a3
{
  v186[3] = *MEMORY[0x1E4F143B8];
  id v159 = a3;
  uint64_t v4 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_populateCachesWithSupportedBundleIDs", " enableTelemetry=YES ", buf, 2u);
  }

  v160 = [(_PSEnsembleModel *)self interactionStore];
  v157 = [(_PSEnsembleModel *)self contactStore];
  v158 = [(_PSEnsembleModel *)self knowledgeStore];
  char v5 = [_PSContactResolver alloc];
  uint8_t v6 = [(_PSEnsembleModel *)self defaultContactKeysToFetch];
  uint64_t v7 = [(_PSContactResolver *)v5 initWithContactStore:v157 keysToFetch:v6];
  [(_PSEnsembleModel *)self setContactResolver:v7];

  os_unfair_lock_lock(&self->_populateCacheLock);
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v159];
  id v9 = [(_PSEnsembleModel *)self cachedSupportedBundleIDs];
  if (v9
    && ([(_PSEnsembleModel *)self cachedSupportedBundleIDs],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v8 isSubsetOfSet:v10],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    [(_PSEnsembleModel *)self setMessageInteractionCache:0];
    [(_PSEnsembleModel *)self setShareInteractionCache:0];
  }
  else
  {
    uint64_t v12 = (void *)[v8 copy];
    [(_PSEnsembleModel *)self setCachedSupportedBundleIDs:v12];
  }
  v156 = (void *)[v8 mutableCopy];
  uint64_t v13 = +[_PSConstants mobileMailBundleId];
  [v156 removeObject:v13];

  id v14 = self->_shareSheetMechanisms;
  uint64_t v15 = self->_messageDirections;
  uint64_t v16 = self->_messageMechanism;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v173[0] = MEMORY[0x1E4F143A8];
  v173[1] = 3221225472;
  v173[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke;
  v173[3] = &unk_1E5ADEDA8;
  uint64_t v18 = v15;
  v174 = v18;
  v150 = v16;
  v175 = v150;
  id v19 = v8;
  id v176 = v19;
  v152 = (void *)MEMORY[0x1A6243AD0](v173);
  v169[0] = MEMORY[0x1E4F143A8];
  v169[1] = 3221225472;
  v169[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_2;
  v169[3] = &unk_1E5ADEDA8;
  v155 = v18;
  v170 = v155;
  v149 = v14;
  v171 = v149;
  id v148 = v19;
  id v172 = v148;
  v151 = (void *)MEMORY[0x1A6243AD0](v169);
  uint64_t v20 = [(_PSEnsembleModel *)self messageInteractionCache];
  LODWORD(v18) = v20 == 0;

  if (v18)
  {
    id v21 = (void *)MEMORY[0x1E4F28F60];
    __int16 v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-14515200.0];
    __int16 v23 = [v21 predicateWithFormat:@"(startDate >= %@)", v22];
    [v17 addObject:v23];

    __int16 v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", v155];
    [v17 addObject:v24];

    int64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", v150];
    [v17 addObject:v25];

    uint64_t v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@)", v156];
    [v17 addObject:v26];

    v154 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v17];
    v27 = +[_PSInteractionStoreUtils interactionCacheFromStore:v160 size:350 queryPredicate:v154 filterBlock:v152];
    [(_PSEnsembleModel *)self setMessageInteractionCache:v27];
  }
  else
  {
    v154 = 0;
  }
  v28 = [(_PSEnsembleModel *)self shareInteractionCache];
  BOOL v29 = v28 == 0;

  if (v29)
  {
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

    v31 = (void *)MEMORY[0x1E4F28F60];
    v32 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-14515200.0];
    v33 = [v31 predicateWithFormat:@"(startDate >= %@)", v32];
    [v30 addObject:v33];

    v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", v149];
    [v30 addObject:v34];

    v35 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", v155];
    [v30 addObject:v35];

    v36 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(targetBundleId IN %@)", v148];
    [v30 addObject:v36];

    v153 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v30];
    v37 = +[_PSInteractionStoreUtils interactionCacheFromStore:v160 size:350 queryPredicate:v153 filterBlock:v151];
    [(_PSEnsembleModel *)self setShareInteractionCache:v37];

    id v17 = v30;
  }
  else
  {
    v153 = 0;
  }
  v38 = [(_PSEnsembleModel *)self contactMonitor];
  BOOL v39 = v38 == 0;

  if (v39)
  {
    v40 = [[_PSInteractionAndContactMonitor alloc] initWithInteractionStore:v160 contactStore:v157];
    [(_PSEnsembleModel *)self setContactMonitor:v40];

    v41 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v42 = dispatch_queue_create("com.apple.PeopleSuggester.ContactMonitor", v41);

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_3;
    block[3] = &unk_1E5ADE940;
    block[4] = self;
    dispatch_async(v42, block);
  }
  v43 = [(_PSEnsembleModel *)self ruleMiningModel];
  BOOL v44 = v43 == 0;

  if (v44)
  {
    v45 = [_PSRuleMiningModel alloc];
    v46 = [(_PSEnsembleModel *)self contactResolver];
    v47 = [(_PSEnsembleModel *)self psConfig];
    v48 = [(_PSRuleMiningModel *)v45 initWithKnowledgeStore:v158 contactresolver:v46 withConfig:v47];
    [(_PSEnsembleModel *)self setRuleMiningModel:v48];

    v49 = [(_PSEnsembleModel *)self ruleMiningModel];
    v50 = [(_PSEnsembleModel *)self psConfigForAdaptableModel];
    [v49 updateAdaptableModelProperties:v50];

    v51 = [(_PSEnsembleModel *)self ruleMiningModel];
    [v51 loadMLModel];
  }
  v52 = [(_PSEnsembleModel *)self knnModel];
  if (!v52) {
    goto LABEL_19;
  }
  v53 = (void *)MEMORY[0x1E4F1CAD0];
  v54 = [(_PSEnsembleModel *)self knnModel];
  v55 = [v54 filterBundleIds];
  v56 = [v53 setWithArray:v55];
  v57 = [MEMORY[0x1E4F1CAD0] setWithArray:v159];
  LOBYTE(v53) = [v56 isEqualToSet:v57];

  if ((v53 & 1) == 0)
  {
LABEL_19:
    v58 = [_PSKNNModel alloc];
    v59 = [(_PSEnsembleModel *)self contactResolver];
    v60 = [(_PSEnsembleModel *)self messageInteractionCache];
    v61 = [(_PSEnsembleModel *)self shareInteractionCache];
    v62 = [(_PSKNNModel *)v58 initWithK:100 interactionStore:v160 filterByBundleIds:v159 knowledgeStore:v158 contactResolver:v59 messageInteractionCache:v60 shareInteractionCache:v61];
    [(_PSEnsembleModel *)self setKnnModel:v62];

    v63 = [(_PSEnsembleModel *)self knnModel];
    v64 = [(_PSEnsembleModel *)self psConfig];
    [v63 updateModelProperties:v64];
  }
  v65 = [(_PSEnsembleModel *)self sharingContactRankerModel];
  BOOL v66 = v65 == 0;

  if (v66)
  {
    v67 = [_PSSharingContactRankerModel alloc];
    v68 = [(_PSEnsembleModel *)self messageInteractionCache];
    v69 = [(_PSEnsembleModel *)self shareInteractionCache];
    v70 = [(_PSSharingContactRankerModel *)v67 initWithInteractionStore:v160 messageInteractionCache:v68 shareInteractionCache:v69];
    [(_PSEnsembleModel *)self setSharingContactRankerModel:v70];

    v71 = [(_PSEnsembleModel *)self sharingContactRankerModel];
    v72 = [(_PSEnsembleModel *)self psConfig];
    [v71 updateModelProperties:v72];

    v73 = [(_PSEnsembleModel *)self sharingContactRankerModel];
    [v73 loadMLModel];
  }
  v74 = [(_PSEnsembleModel *)self knnZkwModel];
  BOOL v75 = v74 == 0;

  if (v75)
  {
    v76 = [_PSKNNModel alloc];
    v77 = [(_PSEnsembleModel *)self contactResolver];
    v78 = [(_PSEnsembleModel *)self messageInteractionCache];
    v79 = [(_PSEnsembleModel *)self shareInteractionCache];
    v80 = [(_PSKNNModel *)v76 initWithK:500 interactionStore:v160 filterByBundleIds:v159 knowledgeStore:v158 contactResolver:v77 messageInteractionCache:v78 shareInteractionCache:v79];
    [(_PSEnsembleModel *)self setKnnZkwModel:v80];

    v81 = [(_PSEnsembleModel *)self knnZkwModel];
    v82 = [(_PSEnsembleModel *)self psConfig];
    [v81 updateModelProperties:v82];

    v83 = [(_PSEnsembleModel *)self zkwFTOrchestrator];
    if (v83)
    {
    }
    else if (getuid())
    {
      v84 = [_PSFTZKWOrchestrator alloc];
      v85 = [(_PSEnsembleModel *)self knnZkwModel];
      v86 = [(_PSFTZKWOrchestrator *)v84 initWithKNNModel:v85 interactionStore:v160];
      [(_PSEnsembleModel *)self setZkwFTOrchestrator:v86];

      v167[0] = MEMORY[0x1E4F143A8];
      v167[1] = 3221225472;
      v167[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_4;
      v167[3] = &unk_1E5ADEDD0;
      v167[4] = self;
      +[_PSFTZKWTrialWrapper runWithData:v167];
      v87 = [(_PSEnsembleModel *)self zkwFTOrchestrator];
      [v87 populateCaches];
    }
  }
  v88 = [(_PSEnsembleModel *)self knnSiriNLContactRankerModel];
  BOOL v89 = v88 == 0;

  if (v89)
  {
    v90 = [_PSKNNModel alloc];
    v91 = [(_PSEnsembleModel *)self contactResolver];
    v92 = [(_PSEnsembleModel *)self messageInteractionCache];
    v93 = [(_PSEnsembleModel *)self shareInteractionCache];
    v94 = [(_PSKNNModel *)v90 initWithK:2000 interactionStore:v160 filterByBundleIds:v159 knowledgeStore:v158 contactResolver:v91 messageInteractionCache:v92 shareInteractionCache:v93];
    [(_PSEnsembleModel *)self setKnnSiriNLContactRankerModel:v94];

    v95 = [(_PSEnsembleModel *)self knnSiriNLContactRankerModel];
    v96 = [(_PSEnsembleModel *)self psConfig];
    [v95 updateModelProperties:v96];
  }
  v97 = [(_PSEnsembleModel *)self heuristics];
  BOOL v98 = v97 == 0;

  if (v98)
  {
    v99 = [_PSHeuristics alloc];
    v100 = [(_PSEnsembleModel *)self contactResolver];
    v101 = [(_PSEnsembleModel *)self cachedSupportedBundleIDs];
    v102 = [(_PSEnsembleModel *)self messageInteractionCache];
    v103 = [(_PSHeuristics *)v99 initWithKnowledgeStore:v158 interactionStore:v160 contactResolver:v100 shareSheetSupportedBundleIds:v101 messageInteractionCache:v102];
    [(_PSEnsembleModel *)self setHeuristics:v103];

    v104 = [(_PSEnsembleModel *)self heuristics];
    v105 = [(_PSEnsembleModel *)self psConfig];
    [v104 updateModelProperties:v105];
  }
  v106 = [(_PSEnsembleModel *)self topicStore];
  BOOL v107 = v106 == 0;

  if (v107)
  {
    uint64_t v182 = 0;
    v183 = &v182;
    uint64_t v184 = 0x2050000000;
    v108 = (void *)getPPTopicStoreClass_softClass;
    uint64_t v185 = getPPTopicStoreClass_softClass;
    if (!getPPTopicStoreClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v178 = 3221225472;
      v179 = __getPPTopicStoreClass_block_invoke;
      v180 = &unk_1E5ADE858;
      v181 = &v182;
      PersonalizationPortraitLibraryCore();
      Class Class = objc_getClass("PPTopicStore");
      *(void *)(v181[1] + 24) = Class;
      getPPTopicStoreClass_softClass Class = *(void *)(v181[1] + 24);
      v108 = (void *)v183[3];
    }
    id v110 = v108;
    _Block_object_dispose(&v182, 8);
    v111 = [v110 defaultStore];
    [(_PSEnsembleModel *)self setTopicStore:v111];
  }
  v112 = [(_PSEnsembleModel *)self portraitContactStore];
  BOOL v113 = v112 == 0;

  if (v113)
  {
    uint64_t v182 = 0;
    v183 = &v182;
    uint64_t v184 = 0x2050000000;
    v114 = (void *)getPPContactStoreClass_softClass;
    uint64_t v185 = getPPContactStoreClass_softClass;
    if (!getPPContactStoreClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v178 = 3221225472;
      v179 = __getPPContactStoreClass_block_invoke;
      v180 = &unk_1E5ADE858;
      v181 = &v182;
      PersonalizationPortraitLibraryCore();
      Class v115 = objc_getClass("PPContactStore");
      *(void *)(v181[1] + 24) = v115;
      getPPContactStoreClass_softClass Class = *(void *)(v181[1] + 24);
      v114 = (void *)v183[3];
    }
    v116 = v114;
    _Block_object_dispose(&v182, 8);
    id v117 = objc_alloc_init(v116);
    [(_PSEnsembleModel *)self setPortraitContactStore:v117];
  }
  v118 = [(_PSEnsembleModel *)self coreMLScoringModel];
  if (v118) {
    goto LABEL_42;
  }
  if (_os_feature_enabled_impl())
  {
    v118 = objc_alloc_init(_PSCoreMLScoringModel);
    [(_PSEnsembleModel *)self setCoreMLScoringModel:v118];
LABEL_42:
  }
  if (_os_feature_enabled_impl() && !self->_featureCache)
  {
    v120 = self->_allOtherInteractionCacheMechanism;
    v121 = self->_allOtherInteractionCacheDirections;
    id v119 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

    v122 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
    v147 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-14515200.0];
    v123 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate <= %@)", v122];
    [v119 addObject:v123];

    v124 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%@ <= startDate)", v147];
    [v119 addObject:v124];

    v125 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", v121];
    [v119 addObject:v125];

    v126 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", v120];
    [v119 addObject:v126];

    v127 = (void *)MEMORY[0x1E4F28F60];
    v128 = +[_PSConstants contactsAutocompleteBundleId];
    v129 = [v127 predicateWithFormat:@"(bundleId != %@)", v128];
    [v119 addObject:v129];

    if (v153)
    {
      v130 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v153];
      [v119 addObject:v130];
    }
    if (v154)
    {
      v131 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v154];
      [v119 addObject:v131];
    }
    v146 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v119];
    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_5;
    v161[3] = &unk_1E5ADEDF8;
    id v165 = v152;
    id v166 = v151;
    v132 = v121;
    v162 = v132;
    v145 = v120;
    v163 = v145;
    id v133 = v122;
    id v164 = v133;
    v134 = +[_PSInteractionStoreUtils interactionCacheFromStore:v160 size:100 queryPredicate:v146 filterBlock:v161];
    allOtherInteractionCache = self->_allOtherInteractionCache;
    self->_allOtherInteractionCache = v134;

    v136 = [_PSFeatureCache alloc];
    v137 = [(_PSEnsembleModel *)self candidatesForShareSheetRanking];
    v138 = [(_PSEnsembleModel *)self messageInteractionCache];
    v186[0] = v138;
    v139 = [(_PSEnsembleModel *)self shareInteractionCache];
    v186[1] = v139;
    v140 = [(_PSEnsembleModel *)self allOtherInteractionCache];
    v186[2] = v140;
    v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:3];
    v142 = [(_PSFeatureCache *)v136 initWithPredictionContext:0 candidates:v137 caches:v141 store:self->_interactionStore];
    featureCache = self->_featureCache;
    self->_featureCache = v142;

    v144 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v144))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v144, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_populateCachesWithSupportedBundleIDs", (const char *)&unk_1A3274816, buf, 2u);
    }
  }
  else
  {
    id v119 = v17;
  }
  os_unfair_lock_unlock(&self->_populateCacheLock);
}

- (void)intializeKNNContactRankerModelWithInteractionStore:(id)a3 knowledgeStore:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];

  if (!v7)
  {
    id v8 = [(_PSEnsembleModel *)self fetchShareSheetSupportedBundleIDs];
    id v9 = [_PSKNNModel alloc];
    uint64_t v10 = [(_PSEnsembleModel *)self contactResolver];
    char v11 = [(_PSEnsembleModel *)self messageInteractionCache];
    uint64_t v12 = [(_PSEnsembleModel *)self shareInteractionCache];
    uint64_t v13 = [(_PSKNNModel *)v9 initWithK:500 interactionStore:v16 filterByBundleIds:v8 knowledgeStore:v6 contactResolver:v10 messageInteractionCache:v11 shareInteractionCache:v12];
    [(_PSEnsembleModel *)self setKnnNameOrContactRankerModel:v13];

    id v14 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];
    uint64_t v15 = [(_PSEnsembleModel *)self psConfig];
    [v14 updateModelProperties:v15];
  }
}

- (void)refreshCaches
{
  id v3 = [(_PSEnsembleModel *)self zkwFTOrchestrator];

  if (v3)
  {
    id v4 = [(_PSEnsembleModel *)self zkwFTOrchestrator];
    [v4 populateCaches];
  }
}

- (void)freeCachesIfNotCoreDuetDaemon
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];

  char v5 = +[_PSConstants mobileCoreDuetBundleId];
  if ([v4 isEqual:v5])
  {
  }
  else
  {
    id v6 = +[_PSConstants macKnowledgeAgentBundleId];
    char v7 = [v4 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(_PSEnsembleModel *)self freeCaches];
      goto LABEL_8;
    }
  }
  id v8 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_DEFAULT, "Not freeing caches because we're coreduetd or knowledge-agent", v9, 2u);
  }

LABEL_8:
}

- (void)freeCaches
{
  p_populateCacheLock = &self->_populateCacheLock;
  os_unfair_lock_lock(&self->_populateCacheLock);
  id v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_DEFAULT, "Freeing caches now to save memory", v6, 2u);
  }

  [(_PSEnsembleModel *)self setMessageInteractionCache:0];
  [(_PSEnsembleModel *)self setShareInteractionCache:0];
  [(_PSEnsembleModel *)self setAllOtherInteractionCache:0];
  [(_PSEnsembleModel *)self setContactMonitor:0];
  [(_PSEnsembleModel *)self setRuleMiningModel:0];
  [(_PSEnsembleModel *)self setKnnModel:0];
  [(_PSEnsembleModel *)self setSharingContactRankerModel:0];
  [(_PSEnsembleModel *)self setKnnZkwModel:0];
  [(_PSEnsembleModel *)self setZkwFTOrchestrator:0];
  [(_PSEnsembleModel *)self setKnnNameOrContactRankerModel:0];
  [(_PSEnsembleModel *)self setKnnSiriNLContactRankerModel:0];
  [(_PSEnsembleModel *)self setHeuristics:0];
  [(_PSEnsembleModel *)self setCoreMLScoringModel:0];
  featureCache = self->_featureCache;
  self->_featureCache = 0;

  os_unfair_lock_unlock(p_populateCacheLock);
}

- (id)predictWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v8 = +[_PSConstants psDefaultsDomain];
  id v9 = (void *)[v7 initWithSuiteName:v8];

  uint64_t v10 = [v6 bundleID];
  char v11 = [v9 objectForKey:v10];

  uint64_t v12 = [v11 count];
  uint64_t v13 = +[_PSLogging generalChannel];
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v11;
      _os_log_impl(&dword_1A314B000, v13, OS_LOG_TYPE_DEFAULT, "Suggesting interactions from seeded handles: %@", buf, 0xCu);
    }

    [v6 setSuggestionPath:@"suggestionPathDemoMode"];
    uint64_t v15 = [(_PSEnsembleModel *)self heuristics];
    id v16 = [v15 seedSuggestionsForChatGuidsAndTransports:v11];
  }
  else
  {
    if (v14)
    {
      id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "showPotentialFamilyMembers"));
      [v6 bundleID];
      uint64_t v18 = v24 = a4;
      id v19 = [v6 attachments];
      uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isSharePlayAvailable"));
      *(_DWORD *)buf = 138413058;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      v28 = v18;
      __int16 v29 = 2112;
      id v30 = v19;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_1A314B000, v13, OS_LOG_TYPE_DEFAULT, "Prediction Context - Family: %@, Bundle Id: %@, Attachments: %@, SharePlay: %@", buf, 0x2Au);

      a4 = v24;
    }

    if ([v6 showPotentialFamilyMembers])
    {
      id v21 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_INFO, "iCloud Family Suggestions Active", buf, 2u);
      }

      uint64_t v22 = [(_PSEnsembleModel *)self familyPredictionsWithMaxSuggestions:a4 predictionContext:v6];
    }
    else
    {
      uint64_t v22 = [(_PSEnsembleModel *)self predictWithPredictionContext:v6 maxSuggestions:a4 contactKeysToFetch:0];
    }
    id v16 = (void *)v22;
    uint64_t v15 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v26 = v16;
      _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_DEFAULT, "Final ShareSheet suggestions: %{private}@", buf, 0xCu);
    }
  }

  return v16;
}

- (id)familyPredictionsWithMaxSuggestions:(unint64_t)a3 predictionContext:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(_PSFamilyRecommender);
  id v7 = [(_PSFamilyRecommender *)v6 familyRecommendationSuggestionsForShareSheetWithPredictionContext:v5];

  unint64_t v8 = [v7 count];
  if (v8 >= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = v8;
  }
  uint64_t v10 = objc_msgSend(v7, "subarrayWithRange:", 0, v9);

  return v10;
}

- (void)setPeopleAnalysisFromAssetsWithPredictionContext:(id)a3 identifiersOfPeopleInPhotos:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "Saving people IDs to prediction context", buf, 2u);
  }

  unint64_t v8 = [v5 attachments];
  unint64_t v9 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
        id v16 = objc_msgSend(v6, "allObjects", (void)v21);
        [v15 setPeopleInPhoto:v16];

        id v17 = [v15 peopleInPhoto];

        if (v17)
        {
          uint64_t v18 = [v15 peopleInPhoto];
          [v9 addObjectsFromArray:v18];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v12);
  }

  id v19 = [v9 allObjects];
  [v5 setPeopleInPhotoIdentifiers:v19];

  uint64_t v20 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_INFO, "Finished saving people IDs to prediction context", buf, 2u);
  }
}

- (void)setPhotoAnalysisFromAssetsWithPredictionContext:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_INFO, "Fetching scene descriptors and save person IDs", buf, 2u);
  }

  id v5 = [v3 attachments];
  long long v21 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [v11 photoLocalIdentifier];

        if (v12)
        {
          uint64_t v13 = [v11 photoLocalIdentifier];
          uint64_t v27 = v13;
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
          uint64_t v15 = +[_PSPhotoUtils assetsWithIdentifiers:v14];

          id v16 = +[_PSPhotoUtils sceneAnalysisFromAssets:v15];
          [v11 setPhotoSceneDescriptors:v16];

          id v17 = [v11 photoSceneDescriptors];

          if (v17)
          {
            uint64_t v18 = [v11 photoSceneDescriptors];
            [v21 addObjectsFromArray:v18];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }

  id v19 = [v21 allObjects];
  [v3 setScenesInPhotoIdentifiers:v19];

  uint64_t v20 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_INFO, "Finished fetching scene descriptors and saving person IDs", buf, 2u);
  }
}

- (id)fetchSupportedBundleIDsWithPredictionContextFilters:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSEnsembleModel *)self fetchShareSheetSupportedBundleIDs];
  id v6 = (id)[v5 mutableCopy];

  if (([v4 isSharePlayAvailable] & 1) == 0)
  {
    uint64_t v7 = +[_PSConstants sharePlayBundleId];
    [v6 removeObject:v7];
  }
  uint64_t v8 = [v4 suggestionsFilteredByBundleIds];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = objc_opt_new();
    uint64_t v11 = [v4 suggestionsFilteredByBundleIds];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __72___PSEnsembleModel_fetchSupportedBundleIDsWithPredictionContextFilters___block_invoke;
    uint64_t v18 = &unk_1E5ADEE20;
    id v6 = v6;
    id v19 = v6;
    id v12 = v10;
    id v20 = v12;
    [v11 enumerateObjectsUsingBlock:&v15];

    if (objc_msgSend(v12, "count", v15, v16, v17, v18))
    {
      id v13 = v12;

      id v6 = v13;
    }
  }

  return v6;
}

- (void)getPhotoBasedFeatures:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 distantFuture];
  [v6 timeIntervalSinceNow];
  -[_PSEnsembleModel getPhotoBasedFeaturesAsync:withTimeout:](self, "getPhotoBasedFeaturesAsync:withTimeout:", v5);
  uint64_t v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  v7[2]();
}

- (id)psr_getPhotoBasedFeaturesAsync:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = +[_PSLogging suggestionSignpost];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = +[_PSLogging suggestionSignpost];
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "_PSEnsembleModel_getPhotoBasedFeatures", " enableTelemetry=YES ", buf, 2u);
  }

  id v12 = [v6 bundleID];
  id v13 = [v6 attachments];
  *(void *)buf = 0;
  BOOL v39 = buf;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__1;
  v42 = __Block_byref_object_dispose__1;
  id v43 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  uint64_t v15 = +[_PSLogging suggestionSignpost];
  uint64_t v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v37 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v9, "_PSEnsembleModel_getPhotoBasedFeatures_personIDsOfPeopleInSharedPhotoAssets", " enableTelemetry=YES ", v37, 2u);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __63___PSEnsembleModel_psr_getPhotoBasedFeaturesAsync_withTimeout___block_invoke;
  v34[3] = &unk_1E5ADEE48;
  v36 = buf;
  id v17 = v14;
  v35 = v17;
  uint64_t v18 = +[_PSPhotoSuggestions phPersonIdentifiersOfPeopleInSharedPhotoAttachments:v13 forBundleID:v12 withCompletion:v34];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63___PSEnsembleModel_psr_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_2;
  v25[3] = &unk_1E5ADEE70;
  double v32 = a4;
  id v26 = v7;
  uint64_t v27 = v17;
  os_signpost_id_t v33 = v9;
  id v28 = v18;
  id v29 = v6;
  id v30 = self;
  __int16 v31 = buf;
  id v19 = v6;
  id v20 = v18;
  long long v21 = v17;
  id v22 = v7;
  long long v23 = (void *)MEMORY[0x1A6243AD0](v25);

  _Block_object_dispose(buf, 8);

  return v23;
}

- (id)getPhotoBasedFeaturesAsync:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if ([v6 isFallbackFetch])
  {
    uint64_t v7 = &__block_literal_global_559;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    os_signpost_id_t v9 = +[_PSLogging suggestionSignpost];
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    uint64_t v11 = +[_PSLogging suggestionSignpost];
    id v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "_PSEnsembleModel_getPhotoBasedFeatures", " enableTelemetry=YES ", buf, 2u);
    }

    id v13 = [v6 bundleID];
    dispatch_semaphore_t v14 = [v6 attachments];
    *(void *)buf = 0;
    v36 = buf;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__1;
    BOOL v39 = __Block_byref_object_dispose__1;
    id v40 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_560;
    block[3] = &unk_1E5ADEE98;
    os_signpost_id_t v33 = buf;
    os_signpost_id_t v34 = v10;
    id v31 = v14;
    id v32 = v13;
    id v15 = v13;
    id v16 = v14;
    dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
    if (getPhotoBasedFeaturesAsync_withTimeout___pasOnceToken63 != -1) {
      dispatch_once(&getPhotoBasedFeaturesAsync_withTimeout___pasOnceToken63, &__block_literal_global_563);
    }
    uint64_t v18 = (id)getPhotoBasedFeaturesAsync_withTimeout___pasExprOnceResult;
    dispatch_async(v18, v17);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_2;
    v22[3] = &unk_1E5ADEEC0;
    double v28 = a4;
    id v23 = v8;
    id v26 = v17;
    uint64_t v27 = buf;
    os_signpost_id_t v29 = v10;
    id v24 = v6;
    long long v25 = self;
    id v19 = v17;
    id v20 = v8;
    uint64_t v7 = (void *)MEMORY[0x1A6243AD0](v22);

    _Block_object_dispose(buf, 8);
  }

  return v7;
}

- (void)getCoreMLSuggestionProxiesWithPredictionContext:(id)a3 modelSuggestionProxiesDict:(id)a4 candidateToFeatureVectorDictGetter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"coreMLSuggestionProxies"];
  if (v11)
  {
    id v12 = (void *)v11;
    int v13 = _os_feature_enabled_impl();

    if (v13)
    {
      dispatch_semaphore_t v14 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetCoreMLSuggestions", " enableTelemetry=YES ", buf, 2u);
      }

      id v15 = [(_PSEnsembleModel *)self coreMLScoringModel];
      id v16 = [(_PSEnsembleModel *)self messageInteractionCache];
      dispatch_block_t v17 = [(_PSEnsembleModel *)self shareInteractionCache];
      uint64_t v18 = [v15 getSuggestionProxiesForCandidateToFeatureVectorDictGetter:v10 predictionContext:v8 messageInteractionCache:v16 shareInteractionCache:v17];
      [v9 setObject:v18 forKeyedSubscript:@"coreMLSuggestionProxies"];

      id v19 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)id v20 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetCoreMLSuggestions", (const char *)&unk_1A3274816, v20, 2u);
      }
    }
  }
}

- (void)getHeuristicSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"hyperRecentSuggestionProxies"];

  if (v11)
  {
    id v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    int v13 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleHyperRecencyHeuristic", " enableTelemetry=YES ", buf, 2u);
    }

    dispatch_semaphore_t v14 = [(_PSEnsembleModel *)self heuristics];
    id v15 = [v8 suggestionDate];
    id v16 = [v8 bundleID];
    dispatch_block_t v17 = [v14 hyperRecentHeuristicSuggestionProxiesWithReferenceDate:v15 predictionContextBundleId:v16];
    [v10 setObject:v17 forKeyedSubscript:@"hyperRecentSuggestionProxies"];

    uint64_t v18 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)v35 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleHyperRecencyHeuristic", (const char *)&unk_1A3274816, v35, 2u);
    }
  }
  id v19 = [v10 objectForKeyedSubscript:@"inPhoneCallSuggestionProxies"];

  if (v19)
  {
    id v20 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    long long v21 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)os_signpost_id_t v34 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleInPhoneCallHeuristic", " enableTelemetry=YES ", v34, 2u);
    }

    id v22 = [(_PSEnsembleModel *)self heuristics];
    id v23 = [v22 inPhoneCallHeuristicSuggestionProxiesWithBundleIds:v9 predictionContext:v8];
    [v10 setObject:v23 forKeyedSubscript:@"inPhoneCallSuggestionProxies"];

    id v24 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)os_signpost_id_t v33 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleInPhoneCallHeuristic", (const char *)&unk_1A3274816, v33, 2u);
    }
  }
  long long v25 = [v10 objectForKeyedSubscript:@"returnDocumentToSenderSuggestionProxies"];

  if (v25)
  {
    id v26 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    uint64_t v27 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)id v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v27, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetReturnToSenderHeuristic", " enableTelemetry=YES ", v32, 2u);
    }

    double v28 = [(_PSEnsembleModel *)self heuristics];
    os_signpost_id_t v29 = [v28 returnDocumentToSender:v8];
    [v10 setObject:v29 forKeyedSubscript:@"returnDocumentToSenderSuggestionProxies"];

    id v30 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)id v31 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetReturnToSenderHeuristic", (const char *)&unk_1A3274816, v31, 2u);
    }
  }
}

- (void)getRuleMiningSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"miningSuggestionProxies"];

  if (v11)
  {
    id v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getRuleMiningSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    int v13 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleMiningSuggestions", " enableTelemetry=YES ", buf, 2u);
    }

    dispatch_semaphore_t v14 = [(_PSEnsembleModel *)self ruleMiningModel];
    id v15 = [v8 photoSuggestedPeople];
    id v16 = (void *)[v15 copy];
    dispatch_block_t v17 = [v14 suggestionProxiesWithPredictionContext:v8 photoSuggestedPeople:v16 supportedBundleIDs:v9];
    [v10 setObject:v17 forKeyedSubscript:@"miningSuggestionProxies"];

    uint64_t v18 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)id v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleMiningSuggestions", (const char *)&unk_1A3274816, v19, 2u);
    }
  }
}

- (void)getKnnSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v8 objectForKeyedSubscript:@"knnSuggestionProxies"];

  if (v9)
  {
    id v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.6();
    }

    uint64_t v11 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    id v12 = [(_PSEnsembleModel *)self knnModel];
    int v13 = [v12 suggestionProxiesWithPredictionContext:v7];
    [v8 setObject:v13 forKeyedSubscript:@"knnSuggestionProxies"];

    dispatch_semaphore_t v14 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A3274816, v45, 2u);
    }
  }
  id v15 = [v8 objectForKeyedSubscript:@"knnSuggestionBasedOnSharesAllProxies"];

  if (v15)
  {
    id v16 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.5();
    }

    dispatch_block_t v17 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    uint64_t v18 = [(_PSEnsembleModel *)self knnModel];
    id v19 = [v18 suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:v7 withOnlyTopShares:0 withFilterOutNonMatchingSourceBundleIDs:0];
    [v8 setObject:v19 forKeyedSubscript:@"knnSuggestionBasedOnSharesAllProxies"];

    id v20 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A3274816, v45, 2u);
    }
  }
  long long v21 = [v8 objectForKeyedSubscript:@"knnSuggestionBasedOnSharesTopProxies"];

  if (v21)
  {
    id v22 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.4();
    }

    id v23 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    id v24 = [(_PSEnsembleModel *)self knnModel];
    long long v25 = [v24 suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:v7 withOnlyTopShares:1 withFilterOutNonMatchingSourceBundleIDs:0];
    [v8 setObject:v25 forKeyedSubscript:@"knnSuggestionBasedOnSharesTopProxies"];

    id v26 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A3274816, v45, 2u);
    }
  }
  uint64_t v27 = [v8 objectForKeyedSubscript:@"knnSuggestionBasedOnSharesAllAndAppFilterOnProxies"];

  if (v27)
  {
    double v28 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    os_signpost_id_t v29 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    id v30 = [(_PSEnsembleModel *)self knnModel];
    id v31 = [v30 suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:v7 withOnlyTopShares:0 withFilterOutNonMatchingSourceBundleIDs:1];
    [v8 setObject:v31 forKeyedSubscript:@"knnSuggestionBasedOnSharesAllAndAppFilterOnProxies"];

    id v32 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v32))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v32, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A3274816, v45, 2u);
    }
  }
  os_signpost_id_t v33 = [v8 objectForKeyedSubscript:@"knnSuggestionBasedOnSharesTopAndAppFilterOnProxies"];

  if (v33)
  {
    os_signpost_id_t v34 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    v35 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    v36 = [(_PSEnsembleModel *)self knnModel];
    uint64_t v37 = [v36 suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:v7 withOnlyTopShares:1 withFilterOutNonMatchingSourceBundleIDs:1];
    [v8 setObject:v37 forKeyedSubscript:@"knnSuggestionBasedOnSharesTopAndAppFilterOnProxies"];

    v38 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v38))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A3274816, v45, 2u);
    }
  }
  BOOL v39 = [v8 objectForKeyedSubscript:@"knnSuggestionBasedOnInteractionsProxies"];

  if (v39)
  {
    id v40 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    v41 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v41))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v41, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    v42 = [(_PSEnsembleModel *)self knnModel];
    id v43 = [v42 suggestionProxiesBasedOnNonSharingInteractionsWithPredictionContext:v7];
    [v8 setObject:v43 forKeyedSubscript:@"knnSuggestionBasedOnInteractionsProxies"];

    BOOL v44 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v44))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v44, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A3274816, v45, 2u);
    }
  }
}

- (void)getOtherSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"sharingContactRankerModelSuggestionProxies"];

  if (v11)
  {
    id v44 = v9;
    id v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.4();
    }
    id v13 = v8;

    dispatch_semaphore_t v14 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleContactRankerModelSuggestions", " enableTelemetry=YES ", buf, 2u);
    }

    id v15 = [(_PSEnsembleModel *)self sharingContactRankerModel];
    id v16 = [(_PSEnsembleModel *)self ruleMiningModel];
    dispatch_block_t v17 = [v16 behaviorRulesConsideringInTheContext];
    uint64_t v18 = [v10 objectForKeyedSubscript:@"knnSuggestionBasedOnSharesAllProxies"];
    id v19 = [(_PSEnsembleModel *)self ruleMiningModel];
    id v20 = [v19 scores];
    long long v21 = [v15 suggestionProxiesWithPredictionContext:v13 supportedBundleIDs:v44 behaviorRulesConsideringInTheContext:v17 interactionModelSuggestions:v18 ruleRankingMLModelScores:v20];
    [v10 setObject:v21 forKeyedSubscript:@"sharingContactRankerModelSuggestionProxies"];

    id v22 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleContactRankerModelSuggestions", (const char *)&unk_1A3274816, v45, 2u);
    }

    id v8 = v13;
    id v9 = v44;
  }
  id v23 = [v10 objectForKeyedSubscript:@"backFillProxies"];

  if (v23)
  {
    id v24 = +[_PSHeuristics PSHeuristicsRecencyReasonToString:0];
    long long v25 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    id v26 = [(_PSEnsembleModel *)self heuristics];
    uint64_t v27 = [(_PSEnsembleModel *)self messageInteractionCache];
    double v28 = [v27 interactions];
    os_signpost_id_t v29 = objc_msgSend(v26, "proxiesByRecencyUsingInteractions:startIndex:reason:allowNonSupportedBundleIDs:", v28, 100, 0, -[_PSEnsembleModel allowNonSupportedBundleIDs](self, "allowNonSupportedBundleIDs"));
    [v10 setObject:v29 forKeyedSubscript:@"backFillProxies"];
  }
  id v30 = [v10 objectForKeyedSubscript:@"messagesRecencyProxies"];

  if (v30)
  {
    id v31 = +[_PSHeuristics PSHeuristicsRecencyReasonToString:1];
    id v32 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    os_signpost_id_t v33 = [(_PSEnsembleModel *)self heuristics];
    os_signpost_id_t v34 = [(_PSEnsembleModel *)self messageInteractionCache];
    v35 = [v34 interactions];
    v36 = objc_msgSend(v33, "proxiesByRecencyUsingInteractions:startIndex:reason:allowNonSupportedBundleIDs:", v35, 0, 1, -[_PSEnsembleModel allowNonSupportedBundleIDs](self, "allowNonSupportedBundleIDs"));
    [v10 setObject:v36 forKeyedSubscript:@"messagesRecencyProxies"];
  }
  uint64_t v37 = [v10 objectForKeyedSubscript:@"shareSheetRecencyProxies"];

  if (v37)
  {
    v38 = +[_PSHeuristics PSHeuristicsRecencyReasonToString:2];
    BOOL v39 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:]();
    }

    id v40 = [(_PSEnsembleModel *)self heuristics];
    v41 = [(_PSEnsembleModel *)self shareInteractionCache];
    v42 = [v41 interactions];
    id v43 = objc_msgSend(v40, "proxiesByRecencyUsingInteractions:startIndex:reason:allowNonSupportedBundleIDs:", v42, 0, 2, -[_PSEnsembleModel allowNonSupportedBundleIDs](self, "allowNonSupportedBundleIDs"));
    [v10 setObject:v43 forKeyedSubscript:@"shareSheetRecencyProxies"];
  }
}

- (id)getModelProxiesArrayWithPredictionContext:(id)a3
{
  int v4 = [a3 isFallbackFetch];
  id v5 = [(_PSEnsembleModel *)self psConfig];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v4) {
    id v10 = @"fallbackModelProxiesArray";
  }
  else {
    id v10 = @"modelProxiesArray";
  }
  uint64_t v11 = [v8 objectForKeyedSubscript:v10];

  return v11;
}

- (id)getModelSuggestionsProxyDictWithModelProxiesArray:(id)a3
{
  id v3 = a3;
  int v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_PSEnsembleModel getModelSuggestionsProxyDictWithModelProxiesArray:](v3);
  }

  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v6 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_571);
  id v7 = (void *)[v5 initWithObjects:v6 forKeys:v3];

  return v7;
}

- (id)getMeContactIdentifier
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(_PSEnsembleModel *)self contactStore];
  id v3 = getCNContactIdentifierKey_0();
  v12[0] = v3;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v11 = 0;
  id v5 = [v2 _crossPlatformUnifiedMeContactWithKeysToFetch:v4 error:&v11];
  id v6 = v11;

  if (v6)
  {
    id v7 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel getMeContactIdentifier]();
    }
  }
  if (v5)
  {
    id v8 = [v5 identifier];
  }
  else
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSEnsembleModel getMeContactIdentifier]();
    }

    id v8 = 0;
  }

  return v8;
}

- (id)predictWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4 contactKeysToFetch:(id)a5
{
  v295[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v221 = a5;
  id v7 = [AeroMLTracerSession alloc];
  v239 = v6;
  id v8 = [v6 sessionID];
  id v9 = +[_PSConstants peopleSuggesterShareSheetProjectName];
  v223 = [(AeroMLTracerSession *)v7 initWithTraceId:v8 projectName:v9];

  id v10 = [v6 currentSpanId];
  v232 = [(AeroMLTracerSession *)v223 createSubSpanWithName:@"predictWithPredictionContext" parentSpanId:v10];

  [v232 start];
  id v11 = [(_PSEnsembleModel *)self deviceIdentifier];
  [v232 addDeviceIdentifier:v11];

  v225 = [v232 createSubSpanWithName:@"readTrialInfo"];
  [v225 start];
  v228 = objc_alloc_init(_PSTrialClient);
  v222 = [(_PSTrialClient *)v228 getTrialExperiment];
  [(_PSEnsembleModel *)self addTrialInfoToPredictionContext:v6 withExperiment:v222];
  uint64_t v236 = [(_PSTrialClient *)v228 shouldActivatePSR];
  unsigned int v199 = [(_PSTrialClient *)v228 dataCollectionTimeToWaitInSeconds];
  BOOL v207 = [(_PSTrialClient *)v228 shouldEnableDataCollection];
  [(_PSTrialClient *)v228 maxComputationTime];
  double v13 = v12;
  [v225 end];
  unsigned int v14 = _os_feature_enabled_impl();
  v224 = [v232 createSubSpanWithName:@"fetchSupportedBundleIDsWithPredictionContextFilters"];
  [v224 start];
  id v15 = [(_PSEnsembleModel *)self fetchSupportedBundleIDsWithPredictionContextFilters:v6];
  [v6 setSupportedBundleIds:v15];

  [v224 end];
  id v16 = [v6 suggestionsFilteredByBundleIds];

  if (v16)
  {
    dispatch_block_t v17 = [v6 suggestionsFilteredByBundleIds];
    uint64_t v18 = [v17 componentsJoinedByString:@", "];
    [v232 logDebugEventWithName:@"ClientRequestBundleIdFilters" details:v18 attributes:MEMORY[0x1E4F1CC08]];
  }
  id v19 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v236;
    _os_log_debug_impl(&dword_1A314B000, v19, OS_LOG_TYPE_DEBUG, "ShouldActiveRSR Overwrite from trial: %d", buf, 8u);
  }

  v294[0] = @"PSRFeatureFlag";
  id v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v14);
  v295[0] = v20;
  v294[1] = @"shouldActivatePSRTrialOverwrite";
  long long v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v236);
  v295[1] = v21;
  v294[2] = @"isFallbackFetch";
  id v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v6, "isFallbackFetch"));
  v295[2] = v22;
  v294[3] = @"sourceBundleID";
  id v23 = NSString;
  id v24 = [v6 bundleID];
  long long v25 = [v23 stringWithFormat:@"%@", v24];
  v295[3] = v25;
  v294[4] = @"attachments_count";
  id v26 = NSString;
  uint64_t v27 = [v6 attachments];
  double v28 = objc_msgSend(v26, "stringWithFormat:", @"%ld", objc_msgSend(v27, "count"));
  v295[4] = v28;
  os_signpost_id_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v295 forKeys:v294 count:5];
  [v232 addAttributes:v29];

  if ((v14 & v236) == 1)
  {
    [v6 setIsPSRActive:1];
    [v6 setReasonType:@"PS_Rewrite"];
    if (predictWithPredictionContext_maxSuggestions_contactKeysToFetch___pasOnceToken141 != -1) {
      dispatch_once(&predictWithPredictionContext_maxSuggestions_contactKeysToFetch___pasOnceToken141, &__block_literal_global_615);
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v291 = __Block_byref_object_copy__1;
    v292 = __Block_byref_object_dispose__1;
    id v293 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2;
    block[3] = &unk_1E5ADEF08;
    v276 = buf;
    obuint64_t j = v232;
    id v274 = obj;
    v275 = self;
    dispatch_block_t v30 = dispatch_block_create((dispatch_block_flags_t)0, block);
    dispatch_async((dispatch_queue_t)predictWithPredictionContext_maxSuggestions_contactKeysToFetch__getMeContactIdentifierPrefetchQueue, v30);
    v270[0] = MEMORY[0x1E4F143A8];
    v270[1] = 3221225472;
    v270[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_3;
    v270[3] = &unk_1E5ADEF30;
    id v271 = v30;
    v272 = buf;
    id v31 = v30;
    v229 = (void (**)(void))MEMORY[0x1A6243AD0](v270);

    _Block_object_dispose(buf, 8);
    id v32 = [v6 queryStartDate];
    os_signpost_id_t v33 = v32;
    if (v32)
    {
      id v215 = v32;
    }
    else
    {
      id v215 = [MEMORY[0x1E4F1C9C8] now];
    }

    if (([v6 isFallbackFetch] & 1) != 0
      || ![(_PSTrialClient *)v228 shouldComputePhotoBasedFeatures])
    {
      v198 = (void (**)(void))&__block_literal_global_623;
    }
    else
    {
      v56 = [(_PSEnsembleModel *)self peopleSuggesterDefaults];
      [v56 doubleForKey:@"_PSGetPhotoBasedFeaturesTimeout"];
      if (v57 == 0.0) {
        double v58 = v13;
      }
      else {
        double v58 = v57;
      }

      v59 = [v215 dateByAddingTimeInterval:v58];
      [v59 timeIntervalSinceNow];
      double v61 = v60;
      v62 = +[_PSLogging rewriteChannel];
      double v63 = fmax(v61, 0.0);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v63;
        _os_log_impl(&dword_1A314B000, v62, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Remaining photo based features timeout is %f", buf, 0xCu);
      }

      v64 = [obj createSubSpanWithName:@"psr_getPhotoBasedFeaturesAsync"];
      [v64 start];
      v198 = [(_PSEnsembleModel *)self psr_getPhotoBasedFeaturesAsync:v6 withTimeout:v63];
      [v64 end];
    }
    v65 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v66 = [v6 sessionID];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v66;
      _os_log_impl(&dword_1A314B000, v65, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Getting suggestions for ShareSheet session %@", buf, 0xCu);
    }
    v67 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v67))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v67, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_predictWithPredictionContext", " enableTelemetry=YES ", buf, 2u);
    }

    int v68 = [v6 isFallbackFetch];
    v69 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v69))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v69, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSTrialClientLoading", " enableTelemetry=YES ", buf, 2u);
    }

    v213 = [obj createSubSpanWithName:@"loadTrialInfoConfig"];
    [v213 start];
    id v227 = [(_PSTrialClient *)v228 configWithAnchorDate:v215];
    [(_PSEnsembleModel *)self enrichConfig:v227 withInformationFromPredictionContext:v6];
    [v213 end];
    v70 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v70))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v70, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSTrialClientLoading", (const char *)&unk_1A3274816, buf, 2u);
    }

    v71 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v71))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v71, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSInteractionsStatisticsQuery", " enableTelemetry=YES ", buf, 2u);
    }

    if (v68)
    {
      v289[0] = @"ConversationBundleId";
      v289[1] = @"timeSinceLastOutgoingInteraction";
      v289[2] = @"numberOfSharesWithConversation";
      v289[3] = @"numberOfOutgoingInteractionsWithConversation";
      v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v289 count:4];
      [v227 setStatsToCompute:v72];

      [v227 setFetchLimit:1000];
      [v227 setShouldSortAscending:1];
      v288[0] = @"numberOfSharesWithConversation";
      v288[1] = @"numberOfOutgoingInteractionsWithConversation";
      v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v288 count:2];
      [v227 setFeatureNamesToSortWith:v73];

      [v227 setIsFallbackFetch:1];
    }
    v74 = predictWithPredictionContext_maxSuggestions_contactKeysToFetch__trialRankingModelPrefetchQueue;
    v268[0] = MEMORY[0x1E4F143A8];
    v268[1] = 3221225472;
    v268[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_633;
    v268[3] = &unk_1E5ADE940;
    BOOL v75 = v228;
    v269 = v75;
    dispatch_async(v74, v268);
    v217 = [obj createSubSpanWithName:@"getInteractionsStatisticsForConfig"];
    [v217 start];
    v76 = [(_PSEnsembleModel *)self interactionStore];
    v238 = [v76 getInteractionsStatisticsForConfig:v227];

    if (v238)
    {
      v77 = [v238 queryStats];
      [v217 addAttributes:v77];
    }
    [v217 end];
    v78 = [MEMORY[0x1E4F1C9C8] now];
    [v78 timeIntervalSinceDate:v215];
    BOOL v80 = v79 > v13;

    if (v80)
    {
      v81 = +[_PSConstants suggestionPathBestEffort];
      [v239 setSuggestionPath:v81];
    }
    v82 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.4(v238);
    }

    v83 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:]();
    }

    v211 = [obj createSubSpanWithName:@"logPipeline_interactionsStatisticsCandidate_sourcing"];
    [v211 start];
    v84 = [(_PSEnsembleModel *)self peopleSuggesterDefaults];
    -[_PSEnsembleModel setEnablePipelineCheckpointing:](self, "setEnablePipelineCheckpointing:", [v84 BOOLForKey:@"enablePipelineCheckpointing"]);

    v85 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      BOOL v86 = [(_PSEnsembleModel *)self enablePipelineCheckpointing];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v86;
      _os_log_impl(&dword_1A314B000, v85, OS_LOG_TYPE_INFO, "_PSEnsemble: enablePipelineCheckpointing = %d", buf, 8u);
    }

    v87 = [(_PSTrialClient *)v75 rankingModel];
    [(_PSEnsembleModel *)self setupAeroMLPipelineLoggerWithModel:v87];

    v88 = [v239 sessionID];
    [(_PSEnsembleModel *)self logPipeline:v238 withPipelineStage:@"candidate_sourcing" andSessionID:v88 andCandidateNames:0];

    [v211 end];
    BOOL v89 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v89))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v89, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSInteractionsStatisticsQuery", (const char *)&unk_1A3274816, buf, 2u);
    }

    v219 = [obj createSubSpanWithName:@"pruneCandidatesForRanking"];
    [v219 start];
    int64_t v90 = [(_PSEnsembleModel *)self pruneCandidatesForRanking:v238];
    v286 = @"pruneCount";
    v91 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v90);
    v287 = v91;
    v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v287 forKeys:&v286 count:1];
    [v219 addAttributes:v92];

    [v219 end];
    v93 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:](v238);
    }

    if (v68)
    {
      v94 = +[_PSLogging rewriteChannel];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v94, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Skipped additional stats signals", buf, 2u);
      }

      v95 = +[_PSLogging rewriteChannel];
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v95, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Skipped photo based signals", buf, 2u);
      }
    }
    else
    {
      [(_PSEnsembleModel *)self addAdditionalStatsSignalsToCandidates:v238 withTrialClient:v75];
      v96 = [obj createSubSpanWithName:@"logPipeline_interactionsStatisticsCandidates_with_additional_features"];
      [v96 start];
      v97 = [v239 sessionID];
      [(_PSEnsembleModel *)self logPipeline:v238 withPipelineStage:@"candidates_with_additional_features" andSessionID:v97 andCandidateNames:0];

      [v96 end];
      v198[2]();
      BOOL v98 = [v239 peopleInPhotoIdentifiers];
      [v238 computePASSFeatureWithPeopleDetectedInPhoto:v98];

      v95 = [obj createSubSpanWithName:@"logPipeline_interactionsStatisticsCandidates_with_photo_based_features"];
      [v95 start];
      v99 = [v239 sessionID];
      [(_PSEnsembleModel *)self logPipeline:v238 withPipelineStage:@"candidates_with_photo_based_features" andSessionID:v99 andCandidateNames:0];

      [v95 end];
    }

    v100 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
      -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:]();
    }

    if (v68)
    {
      v101 = +[_PSLogging rewriteChannel];
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v101, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: skipped coreML model", buf, 2u);
      }
    }
    else
    {
      v101 = [obj createSubSpanWithName:@"evaluateCandidates"];
      [v101 start];
      v102 = [(_PSTrialClient *)v75 rankingModel];
      [(_PSEnsembleModel *)self evaluateCandidates:v238 psrMLModel:v102];

      [v101 end];
      v103 = +[_PSLogging rewriteChannel];
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v103, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Ran the features through the coreML model", buf, 2u);
      }

      v104 = [obj createSubSpanWithName:@"logPipeline_interactionsStatisticsCandidates_with_coreml_output"];
      [v104 start];
      v105 = [v239 sessionID];
      [(_PSEnsembleModel *)self logPipeline:v238 withPipelineStage:@"candidates_with_coreml_output" andSessionID:v105 andCandidateNames:0];

      [v104 end];
    }

    v209 = [obj createSubSpanWithName:@"finalSuggestionProxiesForInteractionStatistics"];
    [v209 start];
    v206 = [(_PSEnsembleModel *)self finalSuggestionProxiesForInteractionStatistics:v238 config:v227 trialClient:v75 context:v239];
    [v209 end];
    v106 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v106))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v106, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleDedupingAndTrimming", (const char *)&unk_1A3274816, buf, 2u);
    }

    BOOL v107 = [v239 sessionID];
    [(_PSEnsembleModel *)self setTraceId:v107];

    v108 = [obj getSpanId];
    [(_PSEnsembleModel *)self setCurrentSpanId:v108];

    v109 = [(_PSEnsembleModel *)self fetchSupportedBundleIDsWithPredictionContextFilters:v239];
    id v110 = [(_PSEnsembleModel *)self defaultContactKeysToFetch];
    v111 = v229[2]();
    id v231 = [(_PSEnsembleModel *)self suggestionsFromSuggestionProxies:v206 supportedBundleIDs:v109 contactKeysToFetch:v110 meContactIdentifier:v111 maxSuggestions:a4];

    v208 = [obj createSubSpanWithName:@"logPipelineWithSuggestions"];
    [v208 start];
    v112 = [v239 sessionID];
    [(_PSEnsembleModel *)self logPipelineWithSuggestions:v231 interactionsStatistics:v238 pipelineStage:@"final_candidates_after_UI_resolution" sessionID:v112];

    [v208 end];
    [(_PSEnsembleModel *)self addSuggestedRankFeature:v231 interactionsStatistics:v238];
    [(_PSEnsembleModel *)self addSupportedBundleIDs:v231];
    [(_PSEnsembleModel *)self addUTIInfo:v231 predictionContext:v239];
    BOOL v113 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v231;
      _os_log_impl(&dword_1A314B000, v113, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: final suggestions %{private}@", buf, 0xCu);
    }

    v114 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v114))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v114, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleDedupingAndTrimming", (const char *)&unk_1A3274816, buf, 2u);
    }

    Class v115 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v115))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v115, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_predictWithPredictionContext", (const char *)&unk_1A3274816, buf, 2u);
    }

    if ([v231 count])
    {
      v116 = [v231 firstObject];
      id v117 = [v116 utiList];
    }
    else
    {
      id v117 = &stru_1EF653EA8;
    }
    v284[0] = @"utiList";
    v197 = v117;
    v118 = [NSString stringWithFormat:@"%@", v117];
    v285[0] = v118;
    v284[1] = @"predictionContext_photoSuggestedPeople";
    id v119 = NSString;
    v205 = [v239 photoSuggestedPeople];
    v204 = objc_msgSend(v119, "stringWithFormat:", @"%ld", objc_msgSend(v205, "count"));
    v285[1] = v204;
    v284[2] = @"predictionContext_scenesInPhotoIdentifiers";
    v120 = NSString;
    v203 = [v239 scenesInPhotoIdentifiers];
    v202 = objc_msgSend(v120, "stringWithFormat:", @"%ld", objc_msgSend(v203, "count"));
    v285[2] = v202;
    v284[3] = @"predictionContext_peopleInPhotoIdentifiers";
    v121 = NSString;
    v201 = [v239 peopleInPhotoIdentifiers];
    v200 = objc_msgSend(v121, "stringWithFormat:", @"%ld", objc_msgSend(v201, "count"));
    v285[3] = v200;
    v284[4] = @"predictionContext_suggestionPath";
    v122 = NSString;
    v123 = [v239 suggestionPath];
    v124 = [v122 stringWithFormat:@"%@", v123];
    v285[4] = v124;
    v284[5] = @"messageInteractionCache_count";
    v125 = NSString;
    v126 = [(_PSEnsembleModel *)self messageInteractionCache];
    v127 = objc_msgSend(v125, "stringWithFormat:", @"%ld", objc_msgSend(v126, "size"));
    v285[5] = v127;
    v284[6] = @"shareInteractionCache_count";
    v128 = NSString;
    v129 = [(_PSEnsembleModel *)self shareInteractionCache];
    v130 = objc_msgSend(v128, "stringWithFormat:", @"%ld", objc_msgSend(v129, "size"));
    v285[6] = v130;
    v284[7] = @"allOtherInteractionCache_count";
    v131 = NSString;
    v132 = [(_PSEnsembleModel *)self allOtherInteractionCache];
    id v133 = objc_msgSend(v131, "stringWithFormat:", @"%ld", objc_msgSend(v132, "size"));
    v285[7] = v133;
    v134 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v285 forKeys:v284 count:8];
    [obj addAttributes:v134];

    if (v207)
    {
      v265[0] = MEMORY[0x1E4F143A8];
      v265[1] = 3221225472;
      v265[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_706;
      v265[3] = &unk_1E5ADEF58;
      id v266 = v227;
      id v267 = v238;
      [(_PSEnsembleModel *)self psrDataCollectionForContext:v239 timeToWaitInSeconds:v199 maxComputationTime:v265 withConfigAndStatsBlock:v13];
    }
    [obj end];
  }
  else
  {
    [v6 setReasonType:@"PS_Legacy"];
    os_signpost_id_t v34 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetFetchSupportedBundleIDs", " enableTelemetry=YES ", buf, 2u);
    }

    v229 = [(_PSEnsembleModel *)self fetchSupportedBundleIDsWithPredictionContextFilters:v6];
    [(_PSEnsembleModel *)self populateCachesWithSupportedBundleIDs:v229];
    v264[0] = MEMORY[0x1E4F143A8];
    v264[1] = 3221225472;
    v264[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_712;
    v264[3] = &unk_1E5ADE940;
    v264[4] = self;
    id v226 = (id)MEMORY[0x1A6243AD0](v264);
    v35 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetFetchSupportedBundleIDs", (const char *)&unk_1A3274816, buf, 2u);
    }

    v36 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [(_PSEnsembleModel *)self messageInteractionCache];
      uint64_t v38 = [v37 size];
      BOOL v39 = [(_PSEnsembleModel *)self shareInteractionCache];
      uint64_t v40 = [v39 size];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v40;
      _os_log_impl(&dword_1A314B000, v36, OS_LOG_TYPE_DEFAULT, "Messages interaction count: %tu, Sharing interaction count: %tu", buf, 0x16u);
    }
    v41 = [(_PSEnsembleModel *)self peopleSuggesterDefaults];
    int v42 = [v41 BOOLForKey:@"_PSReturnRecentNonSystemSuggestions"];

    if (v42)
    {
      id v43 = [(_PSEnsembleModel *)self heuristics];
      id v231 = [v43 recentNonSystemSuggestionsForBundleIDs:v229 numberOfSuggestion:a4];

      id v44 = +[_PSLogging heuristicsChannel];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v231, "count"));
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v45;
        _os_log_impl(&dword_1A314B000, v44, OS_LOG_TYPE_INFO, "Returning %@ recent non-system suggestions", buf, 0xCu);
      }
    }
    else
    {
      v46 = [(_PSEnsembleModel *)self getModelProxiesArrayWithPredictionContext:v6];
      v47 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        v48 = objc_msgSend(v46, "_pas_componentsJoinedByString:", @",");
        -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.7(v48, (uint64_t)v283, v47);
      }

      v49 = [(_PSEnsembleModel *)self getModelSuggestionsProxyDictWithModelProxiesArray:v46];
      v50 = [v49 objectForKeyedSubscript:@"coreMLSuggestionProxies"];
      BOOL v51 = v50 == 0;

      if (!v51
        && [(_PSEnsembleModel *)self coreMLModelNeedsDurableFeatures]
        && ![(_PSFeatureCache *)self->_featureCache isDurableFeaturesSetAdmissible])
      {
        [v49 removeObjectForKey:@"coreMLSuggestionProxies"];
      }
      v237 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:a4];
      v52 = [(_PSEnsembleModel *)self candidatesForShareSheetRanking];
      if (!_os_feature_enabled_impl()
        || ([v49 objectForKeyedSubscript:@"coreMLSuggestionProxies"],
            v53 = objc_claimAutoreleasedReturnValue(),
            BOOL v54 = v53 == 0,
            v53,
            v54))
      {
        v55 = 0;
      }
      else
      {
        v55 = [(_PSFeatureCache *)self->_featureCache fetchFeaturesWithCandidates:v52 context:v239];
      }
      v261[0] = MEMORY[0x1E4F143A8];
      v261[1] = 3221225472;
      v261[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_717;
      v261[3] = &unk_1E5ADEFA8;
      id v210 = v52;
      id v262 = v210;
      id v212 = v55;
      id v263 = v212;
      v220 = (void *)MEMORY[0x1A6243AD0](v261);

      if (v220) {
        -[_PSEnsembleModel getCoreMLSuggestionProxiesWithPredictionContext:modelSuggestionProxiesDict:candidateToFeatureVectorDictGetter:](self, "getCoreMLSuggestionProxiesWithPredictionContext:modelSuggestionProxiesDict:candidateToFeatureVectorDictGetter:", v239, v49);
      }
      v135 = +[_PSConfig defaultConfig];
      v136 = (objc_class *)objc_opt_class();
      v137 = NSStringFromClass(v136);
      v138 = [v135 objectForKeyedSubscript:v137];
      v139 = [v138 objectForKeyedSubscript:@"enablePhotoBasedFeatures"];
      int v140 = [v139 BOOLValue];

      if (v140)
      {
        v141 = [(_PSEnsembleModel *)self peopleSuggesterDefaults];
        [v141 doubleForKey:@"_PSGetPhotoBasedFeaturesTimeout"];
        if (v142 == 0.0) {
          double v143 = 0.275;
        }
        else {
          double v143 = v142;
        }

        v218 = [(_PSEnsembleModel *)self getPhotoBasedFeaturesAsync:v239 withTimeout:v143];
      }
      else
      {
        v144 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A314B000, v144, OS_LOG_TYPE_INFO, "Photos-based features fetching is disabled", buf, 2u);
        }

        v218 = (void (**)(void))&__block_literal_global_727;
      }
      [(_PSEnsembleModel *)self getHeuristicSuggestionProxies:v239 supportedBundleIDs:v229 modelSuggestionProxiesDict:v49];
      [(_PSEnsembleModel *)self getRuleMiningSuggestionProxies:v239 supportedBundleIDs:v229 modelSuggestionProxiesDict:v49];
      [(_PSEnsembleModel *)self getOtherSuggestionProxies:v239 supportedBundleIDs:v229 modelSuggestionProxiesDict:v49];
      v216 = [(_PSEnsembleModel *)self getMeContactIdentifier];
      v218[2]();
      [(_PSEnsembleModel *)self getKnnSuggestionProxies:v239 supportedBundleIDs:v229 modelSuggestionProxiesDict:v49];
      v145 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v145, OS_LOG_TYPE_INFO, "Prediction Context - Start to re-order", buf, 2u);
      }

      v146 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v146))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v146, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleDedupingAndTrimming", " enableTelemetry=YES ", buf, 2u);
      }

      long long v259 = 0u;
      long long v260 = 0u;
      long long v257 = 0u;
      long long v258 = 0u;
      obja = v46;
      uint64_t v147 = [obja countByEnumeratingWithState:&v257 objects:v282 count:16];
      if (v147)
      {
        uint64_t v148 = *(void *)v258;
        do
        {
          for (uint64_t i = 0; i != v147; ++i)
          {
            if (*(void *)v258 != v148) {
              objc_enumerationMutation(obja);
            }
            uint64_t v150 = *(void *)(*((void *)&v257 + 1) + 8 * i);
            v151 = [v49 objectForKeyedSubscript:v150];
            BOOL v152 = v151 == 0;

            if (!v152)
            {
              v153 = [v49 objectForKeyedSubscript:v150];
              [v237 addObjectsFromArray:v153];
            }
          }
          uint64_t v147 = [obja countByEnumeratingWithState:&v257 objects:v282 count:16];
        }
        while (v147);
      }

      v154 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        *(void *)&uint8_t buf[4] = v49;
        _os_log_impl(&dword_1A314B000, v154, OS_LOG_TYPE_DEFAULT, "modelSuggestionProxiesDict: %{private}@", buf, 0xCu);
      }

      v155 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
      {
        v255[0] = MEMORY[0x1E4F143A8];
        v255[1] = 3221225472;
        v255[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_728;
        v255[3] = &unk_1E5ADEFD0;
        id v256 = v49;
        __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_728((uint64_t)v255);
        id v156 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v156;
        _os_log_impl(&dword_1A314B000, v155, OS_LOG_TYPE_DEFAULT, "modelSuggestionProxiesDict - counts: %@", buf, 0xCu);
      }
      if (!v221)
      {
        id v221 = [(_PSEnsembleModel *)self defaultContactKeysToFetch];
      }
      v157 = [v237 array];
      v214 = [(_PSEnsembleModel *)self suggestionsFromSuggestionProxies:v157 supportedBundleIDs:v229 contactKeysToFetch:v221 meContactIdentifier:v216 maxSuggestions:a4];

      unint64_t v158 = [v214 count];
      if (v158 >= a4) {
        unint64_t v159 = a4;
      }
      else {
        unint64_t v159 = v158;
      }
      v160 = objc_msgSend(v214, "subarrayWithRange:", 0, v159);
      [(_PSEnsembleModel *)self addAdaptedModelUsageInfoToSuggestions:v160];
      [(_PSEnsembleModel *)self addSupportedBundleIDs:v160];
      long long v253 = 0u;
      long long v254 = 0u;
      long long v251 = 0u;
      long long v252 = 0u;
      id v161 = v160;
      uint64_t v162 = [v161 countByEnumeratingWithState:&v251 objects:v281 count:16];
      if (v162)
      {
        uint64_t v163 = *(void *)v252;
        do
        {
          for (uint64_t j = 0; j != v162; ++j)
          {
            if (*(void *)v252 != v163) {
              objc_enumerationMutation(v161);
            }
            id v165 = *(void **)(*((void *)&v251 + 1) + 8 * j);
            id v166 = (void *)[v49 copy];
            [v165 setModelSuggestionProxies:v166];

            if ([v239 isFallbackFetch])
            {
              id v167 = [NSString alloc];
              v168 = [v165 reason];
              v169 = (void *)[v167 initWithFormat:@"%@\n%@", v168, @"Fallback Suggestion"];
              [v165 setReason:v169];
            }
          }
          uint64_t v162 = [v161 countByEnumeratingWithState:&v251 objects:v281 count:16];
        }
        while (v162);
      }

      [(_PSEnsembleModel *)self addUTIInfo:v161 predictionContext:v239];
      v170 = [v49 objectForKeyedSubscript:@"coreMLSuggestionProxies"];
      if (v170)
      {
        v171 = [v49 objectForKeyedSubscript:@"coreMLSuggestionProxies"];
        BOOL v172 = [v171 count] == 0;

        if (!v172)
        {
          if (_os_feature_enabled_impl())
          {
            queue = self->_queue;
            v248[0] = MEMORY[0x1E4F143A8];
            v248[1] = 3221225472;
            v248[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_738;
            v248[3] = &unk_1E5ADEFF8;
            v248[4] = self;
            id v249 = v161;
            id v250 = v49;
            dispatch_async(queue, v248);
          }
        }
      }
      v174 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v237, "count"));
      id v175 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v176 = [v239 isFallbackFetch];
      if (v176) {
        v177 = @"fallback";
      }
      else {
        v177 = @"ensemble";
      }
      if (v176) {
        uint64_t v178 = 2;
      }
      else {
        uint64_t v178 = 0;
      }
      v244[0] = MEMORY[0x1E4F143A8];
      v244[1] = 3221225472;
      v244[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_745;
      v244[3] = &unk_1E5ADF020;
      id v179 = v175;
      id v245 = v179;
      id v180 = v174;
      id v246 = v180;
      v247 = v177;
      [v161 enumerateObjectsUsingBlock:v244];
      v181 = [v239 sessionID];
      if (!v181)
      {
        uint64_t v182 = [MEMORY[0x1E4F29128] UUID];
        v181 = [v182 UUIDString];

        v183 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v183, OS_LOG_TYPE_FAULT)) {
          -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.6();
        }
      }
      uint64_t v277 = 0;
      v278 = &v277;
      uint64_t v279 = 0x2050000000;
      uint64_t v184 = (void *)getPSPeopleSuggestionsMetricsInferenceEventClass_softClass;
      uint64_t v280 = getPSPeopleSuggestionsMetricsInferenceEventClass_softClass;
      if (!getPSPeopleSuggestionsMetricsInferenceEventClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __getPSPeopleSuggestionsMetricsInferenceEventClass_block_invoke;
        v291 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5ADE858;
        v292 = (void (*)(uint64_t))&v277;
        ReportingPluginLibraryCore();
        Class Class = objc_getClass("PSPeopleSuggestionsMetricsInferenceEvent");
        *(void *)(*((void *)v292 + 1) + 24) = Class;
        getPSPeopleSuggestionsMetricsInferenceEventClass_softClass Class = *(void *)(*((void *)v292 + 1) + 24);
        uint64_t v184 = (void *)v278[3];
      }
      v186 = v184;
      _Block_object_dispose(&v277, 8);
      id v187 = [v186 alloc];
      v188 = (void *)[v180 copy];
      v189 = (void *)[v187 initWithIdentifier:v181 responseType:v178 suggestions:v188];

      if (v189)
      {
        [getPSMetricsManagerClass() recordWithPeopleInference:v189];
      }
      else
      {
        v190 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v190, OS_LOG_TYPE_FAULT)) {
          -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.5();
        }
      }
      v191 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v191))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v191, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleDedupingAndTrimming", (const char *)&unk_1A3274816, buf, 2u);
      }

      v192 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v193 = [v161 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v193;
        _os_log_impl(&dword_1A314B000, v192, OS_LOG_TYPE_DEFAULT, "Returning %tu suggestions", buf, 0xCu);
      }

      v240[0] = MEMORY[0x1E4F143A8];
      v240[1] = 3221225472;
      v240[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_751;
      v240[3] = &unk_1E5ADF048;
      v241 = v228;
      v242 = self;
      id v243 = v239;
      [(_PSEnsembleModel *)self psrDataCollectionForContext:v243 timeToWaitInSeconds:v199 maxComputationTime:v240 withConfigAndStatsBlock:v13];
      [v232 end];
      v194 = v243;
      id v231 = v161;

      id v44 = obja;
    }

    v195 = v226;
    if (v226)
    {
      (*((void (**)(void))v226 + 2))();
      v195 = v226;
    }
  }

  return v231;
}

- (void)addSuggestedRankFeature:(id)a3 interactionsStatistics:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 initFeature:@"suggestedRank" withValue:&unk_1EF674E20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    uint64_t v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v14 = objc_msgSend(v13, "conversationIdentifier", (void)v16);
        if (!v14)
        {
          unsigned int v14 = [v13 derivedIntentIdentifier];
        }
        id v15 = [NSNumber numberWithInt:v11 + i];
        [v6 setValue:v15 forFeature:@"suggestedRank" andConversationId:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v11 = (v11 + i);
    }
    while (v9);
  }
}

- (void)addAdaptedModelUsageInfoToSuggestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = [(_PSEnsembleModel *)self ruleMiningModel];

        if (v10)
        {
          uint64_t v11 = [(_PSEnsembleModel *)self ruleMiningModel];
          objc_msgSend(v9, "setIsAdaptedModelCreated:", objc_msgSend(v11, "isAdaptedModelCreated"));

          double v12 = [(_PSEnsembleModel *)self ruleMiningModel];
          objc_msgSend(v9, "setIsAdaptedModelUsed:", objc_msgSend(v12, "isAdaptedModelUsed"));

          double v13 = [(_PSEnsembleModel *)self ruleMiningModel];
          unsigned int v14 = [v13 extractAdaptedModelRecipeID];
          [v9 setAdaptedModelRecipeID:v14];
        }
        else
        {
          [v9 setIsAdaptedModelCreated:0];
          [v9 setIsAdaptedModelUsed:0];
          [v9 setAdaptedModelRecipeID:0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (int)modelProxyToVirtualFeatureStoreFeature:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"knnSuggestionProxies"])
  {
    int v4 = 691;
  }
  else if ([v3 isEqualToString:@"inPhoneCallSuggestionProxies"])
  {
    int v4 = 695;
  }
  else if ([v3 isEqualToString:@"miningSuggestionProxies"])
  {
    int v4 = 692;
  }
  else if ([v3 isEqualToString:@"hyperRecentSuggestionProxies"])
  {
    int v4 = 698;
  }
  else if ([v3 isEqualToString:@"backFillProxies"])
  {
    int v4 = 702;
  }
  else if ([v3 isEqualToString:@"photosGroupSuggestionProxies"])
  {
    int v4 = 700;
  }
  else if ([v3 isEqualToString:@"photosGroupSuggestionProxiesAssetPresence"])
  {
    int v4 = 701;
  }
  else if ([v3 isEqualToString:@"photoSuggestionProxiesFilteredByAssetOrMomentPresence"])
  {
    int v4 = 699;
  }
  else if ([v3 isEqualToString:@"returnDocumentToSenderSuggestionProxies"])
  {
    int v4 = 704;
  }
  else if ([v3 isEqualToString:@"shareSheetRecencyProxies"])
  {
    int v4 = 708;
  }
  else if ([v3 isEqualToString:@"messagesRecencyProxies"])
  {
    int v4 = 709;
  }
  else if ([v3 isEqualToString:@"coreMLSuggestionProxies"])
  {
    int v4 = 703;
  }
  else
  {
    uint64_t v5 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_PSEnsembleModel modelProxyToVirtualFeatureStoreFeature:]();
    }

    int v4 = 0;
  }

  return v4;
}

- (void)addTrialInfoToPredictionContext:(id)a3 withExperiment:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 experimentId];
  [v6 setTrialExperimentId:v7];

  uint64_t v8 = [v5 treatmentId];
  [v6 setTrialTreatmentId:v8];

  uint64_t v9 = NSString;
  uint64_t v10 = [v5 deploymentId];

  objc_msgSend(v9, "stringWithFormat:", @"%d", v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setTrialDeploymentId:v11];
}

- (void)addExtraInformationWithSuggestions:(id)a3 modelSuggestionProxiesDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke;
  v17[3] = &unk_1E5ADF070;
  v17[4] = self;
  v17[5] = v18;
  [v6 enumerateObjectsUsingBlock:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_755;
  v16[3] = &unk_1E5ADF0C0;
  v16[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v16];
  uint64_t v8 = [(_PSEnsembleModel *)self trialID];
  uint64_t v9 = (void *)[v8 copy];

  if (v9)
  {
    featureCache = self->_featureCache;
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F4FEE8]) initWithIntValue:0 doubleValue:0 stringValue:v9 BOOLValue:0 timeBucketValue:0];
    [(_PSFeatureCache *)featureCache setFeatureValueForFeatureName:706 featureValue:v11 candidate:@"self" bundleID:@"self"];
  }
  double v12 = +[_PSConstants ensembleModel];
  if (_os_feature_enabled_impl())
  {
    uint64_t v13 = +[_PSConstants coreMLModel];

    double v12 = (void *)v13;
  }
  unsigned int v14 = self->_featureCache;
  long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F4FEE8]) initWithIntValue:0 doubleValue:0 stringValue:v12 BOOLValue:0 timeBucketValue:0];
  [(_PSFeatureCache *)v14 setFeatureValueForFeatureName:705 featureValue:v15 candidate:@"self" bundleID:@"self"];

  _Block_object_dispose(v18, 8);
}

- (void)addUTIInfo:(id)a3 predictionContext:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = [v6 attachments];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unsigned int v14 = [v13 UTI];

        if (v14)
        {
          long long v15 = [v13 UTI];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v10);
  }

  long long v16 = [v7 allObjects];
  long long v17 = [v16 componentsJoinedByString:@","];
  long long v18 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v34 = v17;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "UTI list passed in _PSSuggestion objects: %@", buf, 0xCu);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = v5;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "setUtiList:", v17, (void)v24);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v21);
  }
}

- (void)addSupportedBundleIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_PSEnsembleModel *)self fetchShareSheetSupportedBundleIDs];
  id v6 = [v5 componentsJoinedByString:@","];
  id v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "Supported bundle IDs passed in _PSSuggestion objects: %@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setSupportedBundleIDs:", v6, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

+ (id)_suggestionInteractionPredicatesForFirstPartyMessages:(BOOL)a3 bundleID:(id)a4 interactionRecipients:(id)a5
{
  BOOL v6 = a3;
  v23[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7)
  {
    id v10 = 0;
    if (v8) {
      goto LABEL_3;
    }
LABEL_8:
    if (v10) {
      long long v13 = v10;
    }
    else {
      long long v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v14 = [v13 arrayByAddingObject:@"interactionRecipients"];

    id v10 = (id)v14;
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  id v10 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:@"bundleID"];
  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10)
  {
LABEL_4:
    uint64_t v11 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[_PSEnsembleModel _suggestionInteractionPredicatesForFirstPartyMessages:bundleID:interactionRecipients:](v10, v11);
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_17;
  }
LABEL_12:
  if (_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___pasOnceToken200 != -1) {
    dispatch_once(&_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___pasOnceToken200, &__block_literal_global_768);
  }
  long long v15 = &_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__firstPartyMessagesPredicates;
  if (!v6) {
    long long v15 = &_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__thirdPartyPredicates;
  }
  long long v16 = (void *)*v15;
  v22[0] = @"bundleID";
  v22[1] = @"interactionRecipients";
  v23[0] = v7;
  v23[1] = v9;
  long long v17 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = v16;
  long long v18 = [v17 dictionaryWithObjects:v23 forKeys:v22 count:2];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105___PSEnsembleModel__suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___block_invoke_2;
  v20[3] = &unk_1E5ADF0E8;
  id v21 = v18;
  uint64_t v11 = v18;
  uint64_t v12 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v20);

LABEL_17:

  return v12;
}

- (id)suggestionsFromSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 contactKeysToFetch:(id)a5 meContactIdentifier:(id)a6 maxSuggestions:(unint64_t)a7
{
  uint64_t v7 = MEMORY[0x1F4188790](self, a2, a3, a4, a5, a6, a7);
  unint64_t v419 = v8;
  id v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  long long v15 = (void *)v7;
  uint64_t v627 = *MEMORY[0x1E4F143B8];
  id v17 = v16;
  id v422 = v14;
  id v458 = v12;
  id v432 = v10;
  long long v18 = [AeroMLTracerSession alloc];
  v463 = v15;
  id v19 = [v15 traceId];
  uint64_t v20 = +[_PSConstants peopleSuggesterShareSheetProjectName];
  v423 = [(AeroMLTracerSession *)v18 initWithTraceId:v19 projectName:v20];

  id v21 = [v15 currentSpanId];
  v429 = [(AeroMLTracerSession *)v423 createSubSpanWithName:@"suggestionsFromSuggestionProxies" parentSpanId:v21];

  [v429 start];
  v426 = [v429 createSubSpanWithName:@"cachedMessagesInteractions"];
  [v426 start];
  uint64_t v22 = [v15 messageInteractionCache];
  v433 = [v22 interactions];

  [v426 end];
  v425 = [v429 createSubSpanWithName:@"cachedShares"];
  [v425 start];
  id v23 = [v15 shareInteractionCache];
  v434 = [v23 interactions];

  [v425 end];
  v468 = +[_PSConstants messagesBundleIds];
  v442 = +[_PSConstants mailBundleIds];
  v437 = +[_PSConstants shareplayBundleIds];
  v431 = +[_PSConstants systemBundleIds];
  v443 = [MEMORY[0x1E4F1CA80] setWithArray:v422];
  v464 = _PSShareSheetExtensionBundleIDToAppBundleIDMapping([v15 allowNonSupportedBundleIDs]);
  id v441 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v424 = [v429 createSubSpanWithName:@"buildSuggestionTemplates"];
  [v424 start];
  long long v593 = 0u;
  long long v592 = 0u;
  long long v591 = 0u;
  long long v590 = 0u;
  obuint64_t j = v17;
  uint64_t v449 = [obj countByEnumeratingWithState:&v590 objects:v623 count:16];
  if (v449)
  {
    uint64_t v446 = *(void *)v591;
    do
    {
      id v465 = 0;
      long long v24 = obj;
      do
      {
        if (*(void *)v591 != v446) {
          objc_enumerationMutation(v24);
        }
        v486 = (_PSSuggestionProxy *)*(id *)(*((void *)&v590 + 1) + 8 * (void)v465);
        id v455 = (id)MEMORY[0x1A6243860]();
        uint64_t v25 = [(_PSSuggestionProxy *)v486 interactionRecipients];
        uint64_t v478 = [(_PSSuggestionProxy *)v486 contactID];
        if (!(v25 | v478))
        {
          long long v26 = [(_PSSuggestionProxy *)v486 handles];
          BOOL v27 = v26 == 0;

          if (v27)
          {
            v488 = 0;
            goto LABEL_226;
          }
        }
        long long v28 = [(_PSSuggestionProxy *)v486 bundleID];
        if (v28)
        {
          long long v29 = [(_PSSuggestionProxy *)v486 bundleID];
          int v30 = [v443 containsObject:v29];

          if (!v30)
          {
            v488 = (void *)v25;
            goto LABEL_226;
          }
        }
        if (!v478) {
          goto LABEL_55;
        }
        long long v31 = [(_PSSuggestionProxy *)v486 handle];
        BOOL v32 = v31 == 0;

        if (!v32) {
          goto LABEL_55;
        }
        id v507 = v443;
        os_signpost_id_t v33 = +[_PSConstants mobileMailBundleId];
        [v507 removeObject:v33];

        if (![(_PSSuggestionProxy *)v486 useGroupsWhenFindingRecipient])
        {
          long long v589 = 0u;
          long long v588 = 0u;
          long long v587 = 0u;
          long long v586 = 0u;
          id v34 = v434;
          id v35 = (id)[v34 countByEnumeratingWithState:&v586 objects:v622 count:16];
          if (!v35) {
            goto LABEL_27;
          }
          uint64_t v36 = *(void *)v587;
          do
          {
            for (uint64_t i = 0; i != v35; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v587 != v36) {
                objc_enumerationMutation(v34);
              }
              uint64_t v38 = *(void **)(*((void *)&v586 + 1) + 8 * i);
              BOOL v39 = [v38 recipients];
              if ((unint64_t)[v39 count] <= 1)
              {
                uint64_t v40 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personId == %@", v478];
                v41 = [v39 filteredArrayUsingPredicate:v40];

                if ([v41 count] == 1)
                {
                  id v35 = v38;

                  goto LABEL_27;
                }
              }
            }
            id v35 = (id)[v34 countByEnumeratingWithState:&v586 objects:v622 count:16];
          }
          while (v35);
LABEL_27:

          long long v585 = 0u;
          long long v584 = 0u;
          long long v583 = 0u;
          long long v582 = 0u;
          id v42 = v433;
          id v43 = (id)[v42 countByEnumeratingWithState:&v582 objects:v621 count:16];
          if (v43)
          {
            uint64_t v44 = *(void *)v583;
            do
            {
              for (uint64_t j = 0; j != v43; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v583 != v44) {
                  objc_enumerationMutation(v42);
                }
                v46 = *(void **)(*((void *)&v582 + 1) + 8 * (void)j);
                v47 = [v46 recipients];
                if ((unint64_t)[v47 count] <= 1)
                {
                  v48 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personId == %@", v478];
                  v49 = [v47 filteredArrayUsingPredicate:v48];

                  if ([v49 count] == 1)
                  {
                    id v43 = v46;

                    goto LABEL_39;
                  }
                }
              }
              id v43 = (id)[v42 countByEnumeratingWithState:&v582 objects:v621 count:16];
            }
            while (v43);
          }
LABEL_39:

          if (v35)
          {
            v50 = [v43 startDate];
            BOOL v51 = [v35 startDate];
            [v50 timeIntervalSinceDate:v51];
            BOOL v53 = v52 > 0.0;

            if (!v53 || (id v54 = v43, v35, (v35 = v54) != 0))
            {

LABEL_44:
              v56 = [v35 bundleId];
              double v57 = +[_PSConstants mobileMessagesBundleId];
              if ([v56 isEqualToString:v57])
              {

LABEL_47:
                double v61 = [(_PSSuggestionProxy *)v486 reason];
                v62 = [(_PSSuggestionProxy *)v486 reasonType];
                double v63 = +[_PSPhotoSuggestions suggestionTemplateForPhotoContactIdWithMessages:v478 cdInteraction:v35 reason:v61 reasonType:v62];

                if (v63) {
                  [v441 addObject:v63];
                }
              }
              else
              {
                double v58 = [v35 targetBundleId];
                v59 = +[_PSConstants shareSheetTargetBundleIdMessages];
                int v60 = [v58 isEqualToString:v59];

                if (v60) {
                  goto LABEL_47;
                }
                v64 = [v35 targetBundleId];
                v65 = +[_PSConstants shareSheetTargetBundleIdMail];
                int v66 = [v64 isEqualToString:v65];

                v67 = [_PSSuggestionProxy alloc];
                if (v66)
                {
                  int v68 = +[_PSConstants mobileMailBundleId];
                  v69 = (void *)MEMORY[0x1E4F5B3D8];
                  v70 = [v35 recipients];
                  v71 = [v69 generateConversationIdFromInteractionRecipients:v70];
                  v72 = [(_PSSuggestionProxy *)v486 contactID];
                  v73 = [(_PSSuggestionProxy *)v486 handle];
                  v74 = [(_PSSuggestionProxy *)v486 reason];
                  BOOL v75 = [(_PSSuggestionProxy *)v486 reasonType];
                  v76 = [(_PSSuggestionProxy *)v67 initWithBundleID:v68 interactionRecipients:v71 contactID:v72 handle:v73 reason:v74 reasonType:v75];
                }
                else
                {
                  v77 = [v35 bundleId];
                  v78 = [v35 derivedIntentIdentifier];
                  double v79 = [(_PSSuggestionProxy *)v486 reason];
                  BOOL v80 = [(_PSSuggestionProxy *)v486 reasonType];
                  v76 = [(_PSSuggestionProxy *)v67 initWithBundleID:v77 interactionRecipients:v78 contactID:v478 reason:v79 reasonType:v80];
                }
                double v63 = v76;

                v486 = v63;
              }

              goto LABEL_54;
            }
          }
          v55 = [v463 interactionStore];
          id v35 = +[_PSInteractionStoreUtils mostRecentInteractionWithRecipientMatchingContactIdentifier:v478 bundleIds:v507 store:v55 singleRecipient:1];

          if (v35) {
            goto LABEL_44;
          }
        }
LABEL_54:

LABEL_55:
        v493 = [(_PSSuggestionProxy *)v486 bundleID];
        v488 = [(_PSSuggestionProxy *)v486 interactionRecipients];

        if ([v442 containsObject:v493])
        {
          v81 = [MEMORY[0x1E4F5B3D8] recipientIdentifiersFromMobileMailConversationId:v488];
          v82 = v81;
          v83 = v81;
          if (v81)
          {
            if ([v81 count])
            {
              v84 = [_PSSuggestionTemplate alloc];
              v85 = [(_PSSuggestionProxy *)v486 reason];
              BOOL v86 = [(_PSSuggestionProxy *)v486 reasonType];
              v87 = [(_PSSuggestionProxy *)v486 modelScore];
              v88 = [(_PSSuggestionTemplate *)v84 initWithBundleID:v493 interactionRecipients:v488 image:0 groupName:0 recipientContactIDs:0 recipientEmailAddresses:v82 recipientPhoneNumbers:0 recipientDisplayNames:0 contactIdToHandleMapping:0 reason:v85 reasonType:v86 modelScore:v87];

              [v441 addObject:v88];
            }
            v83 = v82;
          }
          goto LABEL_225;
        }
        BOOL v89 = [(_PSSuggestionProxy *)v486 reason];
        int64_t v90 = +[_PSConstants inCallHeuristicReason];
        if ([v89 isEqualToString:v90])
        {
          int v91 = 1;
        }
        else
        {
          v92 = [(_PSSuggestionProxy *)v486 reason];
          v93 = +[_PSConstants inCallCollaborationHeuristicReason];
          int v91 = [v92 isEqualToString:v93];
        }
        unsigned int context = [v468 containsObject:v493];
        int v495 = [v437 containsObject:v493];
        if (v91)
        {
          if (v478)
          {
            v94 = [(_PSSuggestionProxy *)v486 handle];
            v435 = v94;
            if (v94)
            {

LABEL_70:
              uint64_t v96 = +[_PSHeuristics templateForPhoneCallHeuristicFromSuggestionProxy:v486];
              v83 = (void *)v96;
              if (v96)
              {
                [v441 addObject:v96];
                v83 = (void *)v96;
              }
              goto LABEL_225;
            }
            v435 = 0;
          }
          v95 = [(_PSSuggestionProxy *)v486 handles];

          if (v478)
          {

            if (v95) {
              goto LABEL_70;
            }
          }
          else if (v95)
          {
            goto LABEL_70;
          }
        }
        long long v581 = 0u;
        long long v580 = 0u;
        long long v579 = 0u;
        long long v578 = 0u;
        id v499 = v434;
        uint64_t v97 = [v499 countByEnumeratingWithState:&v578 objects:v620 count:16];
        if (!v97) {
          goto LABEL_89;
        }
        uint64_t v98 = *(void *)v579;
        int v503 = v495 ^ 1;
LABEL_75:
        uint64_t v99 = 0;
        while (1)
        {
          if (*(void *)v579 != v98) {
            objc_enumerationMutation(v499);
          }
          v100 = *(void **)(*((void *)&v578 + 1) + 8 * v99);
          v101 = [v100 domainIdentifier];
          int v102 = [v101 isEqual:v488];

          v103 = [v100 derivedIntentIdentifier];
          int v104 = [v103 isEqual:v488];

          v105 = [v100 targetBundleId];
          if ([v105 isEqual:v493])
          {
            int v106 = 1;
          }
          else
          {
            BOOL v107 = [v100 targetBundleId];
            v108 = [v464 objectForKeyedSubscript:v107];
            int v106 = [v108 isEqual:v493];
          }
          if (context & v102 & 1) != 0 || ((context ^ 1) & v106 & v104) {
            break;
          }
          if ((v503 | v102 | v104))
          {
            if (((v503 | v102) ^ 1 | v495)) {
              break;
            }
          }
          else
          {
            v109 = (void *)MEMORY[0x1E4F5B3D8];
            id v110 = [v100 recipients];
            v111 = [v109 generateConversationIdFromInteractionRecipients:v110];
            LOBYTE(v109) = [v111 isEqual:v488];

            if (v109) {
              break;
            }
          }
          if (v97 == ++v99)
          {
            uint64_t v97 = [v499 countByEnumeratingWithState:&v578 objects:v620 count:16];
            if (!v97)
            {
LABEL_89:
              v451 = 0;
              id v453 = 0;
              char v112 = 0;
              char v496 = 0;
              goto LABEL_102;
            }
            goto LABEL_75;
          }
        }
        id v453 = v100;

        if (!v453)
        {
          v451 = 0;
          id v453 = 0;
          char v112 = 0;
          char v496 = 0;
          goto LABEL_103;
        }
        id v499 = [v453 recipients];
        if ((unint64_t)[v499 count] < 2)
        {
          v451 = 0;
          char v112 = 0;
        }
        else
        {
          BOOL v113 = [v453 contentURL];
          if (v113)
          {
            v114 = [v453 groupName];
            BOOL v115 = v114 == 0;

            if (!v115)
            {
              v451 = 0;
              char v112 = 0;
              char v496 = 1;
              goto LABEL_103;
            }
          }
          else
          {
          }
          v116 = [v453 recipients];
          id v117 = objc_msgSend(v116, "_pas_mappedArrayWithTransform:", &__block_literal_global_801);
          [v453 setRecipients:v117];

          v118 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG)) {
            -[_PSEnsembleModel suggestionsFromSuggestionProxies:supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:](&v576, v577, v118);
          }

          char v112 = 1;
          id v499 = (id)objc_opt_new();
          v451 = v499;
        }
        char v496 = 1;
LABEL_102:

LABEL_103:
        long long v575 = 0u;
        long long v574 = 0u;
        long long v573 = 0u;
        long long v572 = 0u;
        id v500 = v433;
        uint64_t v508 = [v500 countByEnumeratingWithState:&v572 objects:v619 count:16];
        if (!v508) {
          goto LABEL_155;
        }
        uint64_t v504 = *(void *)v573;
        while (2)
        {
          uint64_t v119 = 0;
LABEL_106:
          if (*(void *)v573 != v504) {
            objc_enumerationMutation(v500);
          }
          v120 = *(void **)(*((void *)&v572 + 1) + 8 * v119);
          if (v112)
          {
            v121 = [*(id *)(*((void *)&v572 + 1) + 8 * v119) contentURL];
            if (!v121)
            {
              v473 = [v120 groupName];
              if (!v473)
              {
                v473 = 0;
                goto LABEL_136;
              }
            }
            v122 = [v120 bundleId];
            if ([v468 containsObject:v122]
              && ([v120 domainIdentifier], (v123 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v124 = [v120 domainIdentifier];
              if ([v451 containsObject:v124])
              {

                if (!v121) {
                  goto LABEL_115;
                }
LABEL_118:
                char v112 = 1;
                goto LABEL_119;
              }
              v125 = [v120 recipients];
              if (v125)
              {
                v126 = [v120 recipients];
                uint64_t v127 = [v126 count];
                v128 = [v453 recipients];
                BOOL v129 = v127 == [v128 count];
              }
              else
              {
                BOOL v129 = 0;
              }

              if (v121)
              {

                if (v129)
                {
LABEL_126:
                  v130 = (void *)MEMORY[0x1A6243860]();
                  v131 = [v120 recipients];
                  v132 = objc_msgSend(v131, "_pas_mappedArrayWithTransform:", &__block_literal_global_801);
                  [v120 setRecipients:v132];

                  id v133 = (void *)MEMORY[0x1E4F1CAD0];
                  v134 = [v120 recipients];
                  v135 = [v134 valueForKey:@"identifier"];
                  v136 = [v133 setWithArray:v135];

                  v137 = (void *)MEMORY[0x1E4F1CAD0];
                  v138 = [v453 recipients];
                  v139 = [v138 valueForKey:@"identifier"];
                  int v140 = [v137 setWithArray:v139];

                  int v141 = [v136 isEqualToSet:v140];
                  if (v141)
                  {
                    double v142 = [v453 contentURL];
                    BOOL v143 = v142 == 0;

                    if (v143)
                    {
                      v144 = [v120 contentURL];
                      [v453 setContentURL:v144];
                    }
                    v145 = [v453 groupName];
                    BOOL v146 = v145 == 0;

                    if (v146)
                    {
                      uint64_t v147 = [v120 groupName];
                      [v453 setGroupName:v147];
                    }
                    uint64_t v148 = +[_PSLogging generalChannel];
                    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
                    {
                      id v156 = [v120 groupName];
                      v157 = [v120 contentURL];
                      *(_DWORD *)buf = 138740227;
                      *(void *)&uint8_t buf[4] = v156;
                      *(_WORD *)&buf[12] = 2117;
                      *(void *)&buf[14] = v157;
                      _os_log_debug_impl(&dword_1A314B000, v148, OS_LOG_TYPE_DEBUG, "Resolved group name or display image, group name: %{sensitive}@, display name: %{sensitive}@", buf, 0x16u);
                    }
                  }

                  v121 = [v120 domainIdentifier];
                  [v451 addObject:v121];
                  char v112 = v141 ^ 1;
                  goto LABEL_119;
                }
              }
              else
              {

                if (v129) {
                  goto LABEL_126;
                }
              }
LABEL_136:
              char v112 = 1;
            }
            else
            {

              if (v121) {
                goto LABEL_118;
              }
LABEL_115:
              char v112 = 1;
              v121 = v473;
LABEL_119:
            }
          }
          else
          {
            char v112 = 0;
          }
          if (context)
          {
            v149 = [v120 domainIdentifier];
            if (!v149) {
              goto LABEL_153;
            }
            uint64_t v150 = [v120 bundleId];
            if ([v150 isEqual:v493])
            {
              v151 = [v120 domainIdentifier];
              char v152 = [v151 isEqual:v488];

              if (v152) {
                goto LABEL_156;
              }
LABEL_153:
              if (v508 == ++v119)
              {
                uint64_t v508 = [v500 countByEnumeratingWithState:&v572 objects:v619 count:16];
                if (!v508)
                {
LABEL_155:

                  id v158 = 0;
                  unint64_t v159 = v453;
                  goto LABEL_165;
                }
                continue;
              }
              goto LABEL_106;
            }
LABEL_149:

            goto LABEL_153;
          }
          break;
        }
        v149 = [v120 derivedIntentIdentifier];
        if (!v149) {
          goto LABEL_153;
        }
        uint64_t v150 = [v120 bundleId];
        char v153 = [v150 isEqual:v493];
        if (v153) {
          goto LABEL_146;
        }
        os_log_t oslog = [v464 objectForKeyedSubscript:v493];
        if (!oslog)
        {
          os_log_t oslog = 0;
          goto LABEL_149;
        }
        v459 = [v120 bundleId];
        id v460 = [v464 objectForKeyedSubscript:v493];
        if ([v459 isEqual:v460])
        {
LABEL_146:
          v154 = [v120 derivedIntentIdentifier];
          char v155 = [v154 isEqual:v488];

          if (v153)
          {

            goto LABEL_152;
          }
        }
        else
        {
          char v155 = 0;
        }

LABEL_152:
        if ((v155 & 1) == 0) {
          goto LABEL_153;
        }
LABEL_156:
        id v160 = v120;

        id v158 = v160;
        char v161 = v496 ^ 1;
        if (!v160) {
          char v161 = 1;
        }
        if (v161)
        {
          unint64_t v159 = v453;
          if (v160) {
            unint64_t v159 = v160;
          }
        }
        else
        {
          uint64_t v162 = [v160 startDate];
          uint64_t v163 = [v453 startDate];
          BOOL v164 = [v162 compare:v163] == -1;

          if (!v164)
          {
            id v444 = v160;
            v440 = v444;
            goto LABEL_168;
          }
          unint64_t v159 = v453;
          id v158 = v160;
        }
LABEL_165:
        v440 = v158;
        id v444 = v159;
        if (v444)
        {
LABEL_168:
          v438 = (void *)MEMORY[0x1A6243860]();
          id v170 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v505 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v501 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v484 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v509 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v497 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          if (context)
          {
            long long v569 = 0u;
            long long v568 = 0u;
            long long v567 = 0u;
            long long v566 = 0u;
            v171 = [v444 recipients];
            uint64_t v172 = [v171 countByEnumeratingWithState:&v566 objects:v617 count:16];
            if (!v172) {
              goto LABEL_185;
            }
            uint64_t v173 = *(void *)v567;
            while (1)
            {
              for (uint64_t k = 0; k != v172; ++k)
              {
                if (*(void *)v567 != v173) {
                  objc_enumerationMutation(v171);
                }
                id v175 = *(void **)(*((void *)&v566 + 1) + 8 * k);
                int v176 = [v175 personId];
                if (v176)
                {
                  v177 = [v175 identifier];
                  BOOL v178 = v177 == 0;

                  if (!v178)
                  {
                    id v179 = [v175 personId];
                    [v170 addObject:v179];

                    id v180 = [v175 identifier];
                    v181 = [v175 personId];
                    [v509 setObject:v180 forKeyedSubscript:v181];
                  }
                }
                uint64_t v182 = [v175 identifier];

                if (v182)
                {
                  if ([v175 type] == 2)
                  {
                    v183 = [v175 identifier];
                    [v505 addObject:v183];
                  }
                  else
                  {
                    if ([v175 type] != 1) {
                      continue;
                    }
                    v183 = [v175 identifier];
                    [v501 addObject:v183];
                  }
                }
              }
              uint64_t v172 = [v171 countByEnumeratingWithState:&v566 objects:v617 count:16];
              if (!v172)
              {
LABEL_185:

                goto LABEL_215;
              }
            }
          }
          contexta = (void *)MEMORY[0x1A6243860]();
          long long v565 = 0u;
          long long v564 = 0u;
          long long v563 = 0u;
          long long v562 = 0u;
          uint64_t v184 = [v444 recipients];
          uint64_t v185 = [v184 countByEnumeratingWithState:&v562 objects:v616 count:16];
          if (!v185)
          {
LABEL_214:

LABEL_215:
            v197 = [v444 contentURL];

            if (v197)
            {
              uint64_t v594 = 0;
              v595 = &v594;
              uint64_t v596 = 0x2050000000;
              v198 = (void *)getINImageClass_softClass_0;
              uint64_t v597 = getINImageClass_softClass_0;
              if (!getINImageClass_softClass_0)
              {
                *(void *)buf = MEMORY[0x1E4F143A8];
                *(void *)&uint8_t buf[8] = 3221225472;
                *(void *)&uint8_t buf[16] = __getINImageClass_block_invoke_0;
                os_log_t v625 = (os_log_t)&unk_1E5ADE858;
                v626 = &v594;
                __getINImageClass_block_invoke_0((uint64_t)buf);
                v198 = (void *)v595[3];
              }
              id v199 = v198;
              _Block_object_dispose(&v594, 8);
              v200 = [v444 contentURL];
              v201 = [v199 imageWithURL:v200];
            }
            else
            {
              v201 = 0;
            }
            v202 = [_PSSuggestionTemplate alloc];
            uint64_t v203 = [v464 objectForKeyedSubscript:v493];
            v204 = (void *)v203;
            if (v203) {
              v205 = (void *)v203;
            }
            else {
              v205 = v493;
            }
            v206 = [v444 groupName];
            BOOL v207 = [(_PSSuggestionProxy *)v486 reason];
            v208 = [(_PSSuggestionProxy *)v486 reasonType];
            v209 = [(_PSSuggestionProxy *)v486 modelScore];
            id v210 = [(_PSSuggestionTemplate *)v202 initWithBundleID:v205 interactionRecipients:v488 image:v201 groupName:v206 recipientContactIDs:v170 recipientEmailAddresses:v505 recipientPhoneNumbers:v501 recipientDisplayNames:v484 contactIdToHandleMapping:v509 handleToDisplayNameMapping:v497 reason:v207 reasonType:v208 modelScore:v209];

            [v441 addObject:v210];
            goto LABEL_224;
          }
          uint64_t v186 = *(void *)v563;
          while (2)
          {
            uint64_t v187 = 0;
LABEL_189:
            if (*(void *)v563 != v186) {
              objc_enumerationMutation(v184);
            }
            v188 = *(void **)(*((void *)&v562 + 1) + 8 * v187);
            v189 = [v188 personId];
            v190 = [v188 identifier];
            v191 = [v188 displayName];
            uint64_t v192 = [v191 length];

            if (v189)
            {
              [v170 addObject:v189];
              if (v190)
              {
                [v509 setObject:v190 forKeyedSubscript:v189];
                goto LABEL_195;
              }
LABEL_212:

              if (v185 == ++v187)
              {
                uint64_t v185 = [v184 countByEnumeratingWithState:&v562 objects:v616 count:16];
                if (!v185) {
                  goto LABEL_214;
                }
                continue;
              }
              goto LABEL_189;
            }
            break;
          }
          if (v190)
          {
LABEL_195:
            if ([v188 type] == 2)
            {
              [v505 addObject:v190];
              BOOL v193 = v189 != 0;
              if (v192 < 1) {
                BOOL v193 = 1;
              }
              if (v193) {
                goto LABEL_212;
              }
            }
            else if ([v188 type] == 1)
            {
              [v501 addObject:v190];
              BOOL v194 = v189 != 0;
              if (v192 < 1) {
                BOOL v194 = 1;
              }
              if (v194) {
                goto LABEL_212;
              }
            }
            else
            {
              if (v189) {
                goto LABEL_212;
              }
              if (v192 < 1) {
                goto LABEL_212;
              }
              v195 = [v188 displayName];
              [v484 addObject:v195];

              if ([v188 type]) {
                goto LABEL_212;
              }
            }
            v196 = [v188 displayName];
            [v497 setObject:v196 forKeyedSubscript:v190];
          }
          else
          {
            if (v192 < 1) {
              goto LABEL_212;
            }
            v196 = [v188 displayName];
            [v484 addObject:v196];
          }

          goto LABEL_212;
        }
        id v165 = +[_PSEnsembleModel _suggestionInteractionPredicatesForFirstPartyMessages:context bundleID:v493 interactionRecipients:v488];
        id v166 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
        v618 = v166;
        id v167 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v618 count:1];

        v570[0] = MEMORY[0x1E4F143A8];
        v570[1] = 3221225472;
        v570[2] = __126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke_810;
        v570[3] = &unk_1E5ADF130;
        v570[4] = v463;
        id v168 = v167;
        id v571 = v168;
        v169 = objc_msgSend(v165, "_pas_leftFoldWithInitialObject:accumulate:", 0, v570);
        if (v169)
        {
          id v444 = v169;

          goto LABEL_168;
        }

        id v444 = 0;
LABEL_224:

        v83 = v453;
LABEL_225:

LABEL_226:

        long long v24 = obj;
        id v465 = (char *)v465 + 1;
      }
      while (v465 != (id)v449);
      uint64_t v211 = [obj countByEnumeratingWithState:&v590 objects:v623 count:16];
      uint64_t v449 = v211;
    }
    while (v211);
  }

  [v424 end];
  id v212 = [MEMORY[0x1E4F1CA48] array];
  if ([v441 count])
  {
    uint64_t v213 = 0;
    unint64_t v214 = 0;
    unint64_t v215 = v419 + 2;
    do
    {
      uint64_t v216 = [v441 count];
      if (v216 + v213 >= v215) {
        unint64_t v217 = v419 + 2;
      }
      else {
        unint64_t v217 = v216 + v213;
      }
      v218 = objc_msgSend(v441, "subarrayWithRange:", v214, v217);
      [v212 addObject:v218];

      v214 += v215;
      v213 += -2 - v419;
    }
    while (v214 < [v441 count]);
  }
  id v430 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v427 = [MEMORY[0x1E4F1CA80] set];
  v445 = [MEMORY[0x1E4F1CA80] set];
  v428 = [MEMORY[0x1E4F1CA80] set];
  v447 = [MEMORY[0x1E4F1CA60] dictionary];
  id v506 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v510 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v502 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v489 = [v429 createSubSpanWithName:@"goThroughSuggestionTemplates"];
  [v489 start];
  long long v561 = 0u;
  long long v560 = 0u;
  long long v559 = 0u;
  long long v558 = 0u;
  id v421 = v212;
  uint64_t v418 = [v421 countByEnumeratingWithState:&v558 objects:v615 count:16];
  if (v418)
  {
    uint64_t v416 = 0;
    uint64_t v417 = 0;
    uint64_t v487 = 0;
    uint64_t v485 = 0;
    unint64_t v439 = 0;
    uint64_t v436 = 0;
    v420 = 0;
    uint64_t v219 = *(void *)v559;
    uint64_t v413 = *(void *)v559;
    while (1)
    {
      uint64_t v220 = 0;
      do
      {
        if (*(void *)v559 != v219)
        {
          uint64_t v221 = v220;
          objc_enumerationMutation(v421);
          uint64_t v220 = v221;
        }
        uint64_t v414 = v220;
        v222 = *(void **)(*((void *)&v558 + 1) + 8 * v220);
        v415 = (void *)MEMORY[0x1A6243860]();
        id v498 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id contextb = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v223 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v224 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v494 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v557 = 0u;
        long long v556 = 0u;
        long long v555 = 0u;
        long long v554 = 0u;
        id v456 = v222;
        uint64_t v474 = [v456 countByEnumeratingWithState:&v554 objects:v614 count:16];
        if (v474)
        {
          os_log_t osloga = *(os_log_t *)v555;
          do
          {
            uint64_t v225 = 0;
            do
            {
              if (*(os_log_t *)v555 != osloga)
              {
                uint64_t v226 = v225;
                objc_enumerationMutation(v456);
                uint64_t v225 = v226;
              }
              uint64_t v479 = v225;
              id v227 = *(void **)(*((void *)&v554 + 1) + 8 * v225);
              long long v550 = 0u;
              long long v551 = 0u;
              long long v552 = 0u;
              long long v553 = 0u;
              v228 = [v227 recipientContactIDs];
              uint64_t v229 = [v228 countByEnumeratingWithState:&v550 objects:v613 count:16];
              if (v229)
              {
                uint64_t v230 = *(void *)v551;
                do
                {
                  for (uint64_t m = 0; m != v229; ++m)
                  {
                    if (*(void *)v551 != v230) {
                      objc_enumerationMutation(v228);
                    }
                    uint64_t v232 = *(void *)(*((void *)&v550 + 1) + 8 * m);
                    v233 = [v506 objectForKeyedSubscript:v232];
                    BOOL v234 = v233 == 0;

                    if (v234)
                    {
                      [v498 addObject:v232];
                      v235 = [v227 contactIdToHandleMapping];
                      uint64_t v236 = [v235 objectForKeyedSubscript:v232];

                      if (v236)
                      {
                        [v494 setObject:v236 forKeyedSubscript:v232];
                        [contextb addObject:v236];
                      }
                    }
                  }
                  uint64_t v229 = [v228 countByEnumeratingWithState:&v550 objects:v613 count:16];
                }
                while (v229);
              }

              long long v549 = 0u;
              long long v548 = 0u;
              long long v547 = 0u;
              long long v546 = 0u;
              v237 = [v227 recipientEmailAddresses];
              uint64_t v238 = [v237 countByEnumeratingWithState:&v546 objects:v612 count:16];
              if (v238)
              {
                uint64_t v239 = *(void *)v547;
                do
                {
                  for (uint64_t n = 0; n != v238; ++n)
                  {
                    if (*(void *)v547 != v239) {
                      objc_enumerationMutation(v237);
                    }
                    uint64_t v241 = *(void *)(*((void *)&v546 + 1) + 8 * n);
                    v242 = [v510 objectForKeyedSubscript:v241];
                    BOOL v243 = v242 == 0;

                    if (v243) {
                      [v223 addObject:v241];
                    }
                  }
                  uint64_t v238 = [v237 countByEnumeratingWithState:&v546 objects:v612 count:16];
                }
                while (v238);
              }

              long long v545 = 0u;
              long long v544 = 0u;
              long long v543 = 0u;
              long long v542 = 0u;
              v244 = [v227 recipientPhoneNumbers];
              uint64_t v245 = [v244 countByEnumeratingWithState:&v542 objects:v611 count:16];
              if (v245)
              {
                uint64_t v246 = *(void *)v543;
                do
                {
                  for (iuint64_t i = 0; ii != v245; ++ii)
                  {
                    if (*(void *)v543 != v246) {
                      objc_enumerationMutation(v244);
                    }
                    uint64_t v248 = *(void *)(*((void *)&v542 + 1) + 8 * ii);
                    id v249 = [v502 objectForKeyedSubscript:v248];
                    BOOL v250 = v249 == 0;

                    if (v250) {
                      [v224 addObject:v248];
                    }
                  }
                  uint64_t v245 = [v244 countByEnumeratingWithState:&v542 objects:v611 count:16];
                }
                while (v245);
              }

              uint64_t v225 = v479 + 1;
            }
            while (v479 + 1 != v474);
            uint64_t v474 = [v456 countByEnumeratingWithState:&v554 objects:v614 count:16];
          }
          while (v474);
        }

        if ([v498 count])
        {
          int v466 = [v489 getMonotonicTimeInMilliseconds];
          long long v251 = [v463 contactStore];
          CNContactClass Class = getCNContactClass();
          long long v253 = [v498 allObjects];
          long long v254 = [CNContactClass predicateForContactsWithIdentifiers:v253];
          id v541 = v420;
          v480 = [v251 unifiedContactsMatchingPredicate:v254 keysToFetch:v458 error:&v541];
          id v255 = v541;

          int v461 = [v489 getMonotonicTimeInMilliseconds];
          v475 = [v480 valueForKey:@"identifier"];
          os_log_t oslogb = [v498 setByAddingObjectsFromArray:v475];
          if (v255
            || (unint64_t v256 = [v480 count], v256 < objc_msgSend(v498, "count"))
            || (unint64_t v257 = -[NSObject count](oslogb, "count"), v257 > [v498 count]))
          {
            long long v258 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v258, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v255;
              _os_log_error_impl(&dword_1A314B000, v258, OS_LOG_TYPE_ERROR, "Problem encountred when fetching contacts by identifiers. Fewer contacts were returned, different identifiers were returned or an error occured: %@", buf, 0xCu);
            }

            long long v259 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v259, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138740483;
              *(void *)&uint8_t buf[4] = v480;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v498;
              *(_WORD *)&buf[22] = 2112;
              os_log_t v625 = oslogb;
              _os_log_impl(&dword_1A314B000, v259, OS_LOG_TYPE_INFO, "contacts: %{sensitive}@ templateContactIDs: %@ mergedContactIdentifiers: %@", buf, 0x20u);
            }

            long long v540 = 0u;
            long long v539 = 0u;
            long long v538 = 0u;
            long long v537 = 0u;
            id v260 = contextb;
            uint64_t v261 = [v260 countByEnumeratingWithState:&v537 objects:v610 count:16];
            if (v261)
            {
              uint64_t v262 = *(void *)v538;
              do
              {
                for (juint64_t j = 0; jj != v261; ++jj)
                {
                  if (*(void *)v538 != v262) {
                    objc_enumerationMutation(v260);
                  }
                  v264 = *(void **)(*((void *)&v537 + 1) + 8 * jj);
                  if ([v264 containsString:@"@"]) {
                    v265 = v223;
                  }
                  else {
                    v265 = v224;
                  }
                  [v265 addObject:v264];
                }
                uint64_t v261 = [v260 countByEnumeratingWithState:&v537 objects:v610 count:16];
              }
              while (v261);
            }
          }
          else
          {
            long long v535 = 0u;
            long long v536 = 0u;
            long long v533 = 0u;
            long long v534 = 0u;
            id v380 = contextb;
            uint64_t v381 = [v380 countByEnumeratingWithState:&v533 objects:v609 count:16];
            if (v381)
            {
              uint64_t v382 = *(void *)v534;
              do
              {
                for (kuint64_t k = 0; kk != v381; ++kk)
                {
                  if (*(void *)v534 != v382) {
                    objc_enumerationMutation(v380);
                  }
                  uint64_t v384 = *(void *)(*((void *)&v533 + 1) + 8 * kk);
                  [v223 removeObject:v384];
                  [v224 removeObject:v384];
                }
                uint64_t v381 = [v380 countByEnumeratingWithState:&v533 objects:v609 count:16];
              }
              while (v381);
            }

            long long v531 = 0u;
            long long v532 = 0u;
            long long v529 = 0u;
            long long v530 = 0u;
            id v260 = v480;
            uint64_t v385 = [v260 countByEnumeratingWithState:&v529 objects:v608 count:16];
            if (v385)
            {
              uint64_t v386 = *(void *)v530;
              do
              {
                for (muint64_t m = 0; mm != v385; ++mm)
                {
                  if (*(void *)v530 != v386) {
                    objc_enumerationMutation(v260);
                  }
                  v388 = *(void **)(*((void *)&v529 + 1) + 8 * mm);
                  v389 = [v388 identifier];
                  if (v389)
                  {
                    [v506 setObject:v388 forKeyedSubscript:v389];
                    v390 = [v494 objectForKeyedSubscript:v389];
                    if ([v390 containsString:@"@"]) {
                      v391 = v510;
                    }
                    else {
                      v391 = v502;
                    }
                    [v391 setObject:v388 forKeyedSubscript:v390];
                  }
                }
                uint64_t v385 = [v260 countByEnumeratingWithState:&v529 objects:v608 count:16];
              }
              while (v385);
            }
          }

          uint64_t v417 = (v417 - v466 + v461);
          uint64_t v416 = (v416 + 1);
        }
        else
        {
          id v255 = v420;
        }
        long long v527 = 0u;
        long long v528 = 0u;
        long long v525 = 0u;
        long long v526 = 0u;
        id v467 = v223;
        uint64_t v481 = [v467 countByEnumeratingWithState:&v525 objects:v607 count:16];
        if (v481)
        {
          uint64_t v476 = *(void *)v526;
          do
          {
            uint64_t v266 = 0;
            id v267 = v255;
            do
            {
              if (*(void *)v526 != v476) {
                objc_enumerationMutation(v467);
              }
              uint64_t v268 = *(void *)(*((void *)&v525 + 1) + 8 * v266);
              v269 = [getCNContactClass() predicateForContactsMatchingEmailAddress:v268];
              int v270 = [v489 getMonotonicTimeInMilliseconds];
              id v271 = [v463 contactStore];
              id v524 = v267;
              v272 = [v271 unifiedContactsMatchingPredicate:v269 keysToFetch:v458 error:&v524];
              id v255 = v524;

              int v273 = [v489 getMonotonicTimeInMilliseconds];
              if (v255)
              {
                id v274 = +[_PSLogging generalChannel];
                if (os_log_type_enabled(v274, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v255;
                  _os_log_error_impl(&dword_1A314B000, v274, OS_LOG_TYPE_ERROR, "Error fetching contacts by email: %@", buf, 0xCu);
                }
              }
              else
              {
                if (![v272 count]) {
                  goto LABEL_308;
                }
                id v274 = [v272 firstObject];
                [v510 setObject:v274 forKeyedSubscript:v268];
              }

LABEL_308:
              uint64_t v487 = (v273 - v270 + v487);
              ++v266;
              id v267 = v255;
            }
            while (v481 != v266);
            unint64_t v439 = (v439 + v481);
            uint64_t v481 = [v467 countByEnumeratingWithState:&v525 objects:v607 count:16];
          }
          while (v481);
        }

        long long v522 = 0u;
        long long v523 = 0u;
        long long v520 = 0u;
        long long v521 = 0u;
        id v462 = v224;
        uint64_t v275 = [v462 countByEnumeratingWithState:&v520 objects:v606 count:16];
        if (!v275)
        {
          id v276 = v255;
          goto LABEL_327;
        }
        uint64_t v482 = *(void *)v521;
        id v276 = v255;
        do
        {
          uint64_t v277 = 0;
          uint64_t v278 = v275;
          uint64_t v436 = (v436 + v275);
          uint64_t v279 = v276;
          do
          {
            if (*(void *)v521 != v482) {
              objc_enumerationMutation(v462);
            }
            uint64_t v280 = *(void *)(*((void *)&v520 + 1) + 8 * v277);
            uint64_t v594 = 0;
            v595 = &v594;
            uint64_t v596 = 0x2050000000;
            v281 = (void *)getCNPhoneNumberClass_softClass;
            uint64_t v597 = getCNPhoneNumberClass_softClass;
            if (!getCNPhoneNumberClass_softClass)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&uint8_t buf[8] = 3221225472;
              *(void *)&uint8_t buf[16] = __getCNPhoneNumberClass_block_invoke;
              os_log_t v625 = (os_log_t)&unk_1E5ADE858;
              v626 = &v594;
              ContactsLibraryCore_0();
              Class Class = objc_getClass("CNPhoneNumber");
              *(void *)(v626[1] + 24) = Class;
              getCNPhoneNumberClass_softClass Class = *(void *)(v626[1] + 24);
              v281 = (void *)v595[3];
            }
            id v283 = v281;
            _Block_object_dispose(&v594, 8);
            uint64_t v284 = v280;
            v285 = [v283 phoneNumberWithStringValue:v280];
            v286 = [getCNContactClass() predicateForContactsMatchingPhoneNumber:v285];
            int v287 = [v489 getMonotonicTimeInMilliseconds];
            v288 = [v463 contactStore];
            id v519 = v279;
            v289 = [v288 unifiedContactsMatchingPredicate:v286 keysToFetch:v458 error:&v519];
            id v276 = v519;

            int v290 = [v489 getMonotonicTimeInMilliseconds];
            if (v276)
            {
              v291 = +[_PSLogging generalChannel];
              if (os_log_type_enabled(v291, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v276;
                _os_log_error_impl(&dword_1A314B000, v291, OS_LOG_TYPE_ERROR, "Error fetching contacts by phone number: %@", buf, 0xCu);
              }
            }
            else
            {
              if (![v289 count]) {
                goto LABEL_323;
              }
              v291 = [v289 firstObject];
              [v502 setObject:v291 forKeyedSubscript:v284];
            }

LABEL_323:
            uint64_t v485 = (v290 - v287 + v485);
            ++v277;
            uint64_t v279 = v276;
          }
          while (v278 != v277);
          uint64_t v275 = [v462 countByEnumeratingWithState:&v520 objects:v606 count:16];
        }
        while (v275);
LABEL_327:
        v420 = v276;

        v292 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v292, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v506;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v502;
          *(_WORD *)&buf[22] = 2112;
          os_log_t v625 = v510;
          _os_log_debug_impl(&dword_1A314B000, v292, OS_LOG_TYPE_DEBUG, "Change templates to suggestions, contactIDMapping: %@, phoneMapping: %@, emailMapping: %@", buf, 0x20u);
        }

        long long v517 = 0u;
        long long v518 = 0u;
        long long v515 = 0u;
        long long v516 = 0u;
        id v293 = v456;
        uint64_t v483 = [v293 countByEnumeratingWithState:&v515 objects:v605 count:16];
        if (v483)
        {
          uint64_t v477 = *(void *)v516;
          do
          {
            for (nuint64_t n = 0; nn != v483; ++nn)
            {
              if (*(void *)v516 != v477) {
                objc_enumerationMutation(v293);
              }
              v295 = *(void **)(*((void *)&v515 + 1) + 8 * nn);
              v296 = [v463 contactStore];
              v297 = [v295 suggestionWithContactIDMapping:v506 phoneMapping:v502 emailMapping:v510 contactStore:v296 contactKeysToFetch:v458];

              v298 = v297;
              if (!v297) {
                goto LABEL_414;
              }
              char v299 = [v463 areRecipientsBlockedForSuggestion:v297];
              v298 = v297;
              if (v299) {
                goto LABEL_414;
              }
              v300 = [v297 conversationIdentifier];
              char v301 = [v463 excludeSuggestionWithConversationId:v300];

              v298 = v297;
              if (v301) {
                goto LABEL_414;
              }
              BOOL v302 = v432 != 0;
              v303 = [v297 recipients];
              if ([v303 count] != 1) {
                BOOL v302 = 0;
              }

              v298 = v297;
              if (v302)
              {
                uint64_t v304 = [v297 recipients];
                v305 = [(id)v304 firstObject];
                v306 = [v305 contact];
                v307 = [v306 identifier];

                LOBYTE(v304) = [v307 isEqualToString:v432];
                v298 = v297;
                if (v304) {
                  goto LABEL_414;
                }
              }
              v308 = [v298 bundleID];
              char v309 = [v431 containsObject:v308];

              if (v309)
              {
                v310 = [v297 recipients];
                BOOL v311 = [v310 count] == 1;

                if (v311)
                {
                  v312 = [v297 conversationIdentifier];
                  if (v312)
                  {
                    v313 = [v297 conversationIdentifier];
                    char v314 = [v445 containsObject:v313];

                    if ((v314 & 1) == 0)
                    {
                      v315 = [v297 conversationIdentifier];
                      [v445 addObject:v315];

                      v316 = [v297 recipients];
                      v317 = [v316 firstObject];

                      v318 = [v317 contact];
                      v319 = [v318 identifier];

                      v320 = [v297 bundleID];
                      int v321 = [v437 containsObject:v320];

                      if (v321)
                      {
                        v322 = [v297 bundleID];
                        uint64_t v323 = [v319 stringByAppendingString:v322];

                        v319 = (void *)v323;
                      }
                      if ([v297 isReturnToSender])
                      {
                        id v324 = [NSString alloc];
                        v325 = [v297 bundleID];
                        v326 = +[_PSConstants returnToSenderReason];
                        uint64_t v327 = [v324 initWithFormat:@"%@_%@_%@", v319, v325, v326];

                        v319 = (void *)v327;
                      }
                      v328 = [v297 bundleID];
                      v329 = +[_PSConstants collaborationSuggestionBundleId];
                      int v330 = [v328 isEqualToString:v329];

                      if (v330)
                      {
                        v331 = [v297 conversationIdentifier];
                        v332 = [v297 bundleID];
                        uint64_t v333 = [v331 stringByAppendingString:v332];

                        v319 = (void *)v333;
                      }
                      if (v319 && ([v427 containsObject:v319] & 1) == 0)
                      {
                        [v427 addObject:v319];
                        [v430 addObject:v297];
                      }
                    }
                  }
                  goto LABEL_411;
                }
                v344 = [v297 recipients];
                BOOL v345 = (unint64_t)[v344 count] > 1;

                if (!v345) {
                  goto LABEL_411;
                }
                v346 = [v297 conversationIdentifier];
                if (!v346) {
                  goto LABEL_411;
                }
                v347 = [v297 conversationIdentifier];
                char v348 = [v445 containsObject:v347];

                if (v348) {
                  goto LABEL_411;
                }
                v349 = [v297 conversationIdentifier];
                [v445 addObject:v349];

                v350 = [v297 bundleID];
                v351 = +[_PSConstants mobileMessagesBundleId];
                if ([v350 isEqualToString:v351])
                {
                  v352 = [v297 conversationIdentifier];
                  BOOL v353 = v352 == 0;

                  if (!v353)
                  {
                    v354 = [v297 conversationIdentifier];
                    v355 = [v354 componentsSeparatedByString:@";"];
                    v356 = [v355 lastObject];

                    if (v356 && ([v427 containsObject:v356] & 1) == 0)
                    {
                      v357 = [v297 recipients];
                      v358 = [v357 valueForKey:@"handle"];
                      v359 = [v358 sortedArrayUsingSelector:sel_compare_];

                      if (([v428 containsObject:v359] & 1) == 0)
                      {
                        [v427 addObject:v356];
                        [v428 addObject:v359];
                        [v430 addObject:v297];
                      }
                    }
                    goto LABEL_411;
                  }
                }
                else
                {
                }
                [v430 addObject:v297];
                goto LABEL_411;
              }
              os_log_t oslogc = [v297 bundleID];
              v334 = [v297 derivedIntentIdentifier];
              v454 = [v334 stringByAppendingString:oslogc];

              v335 = [v297 groupName];
              v452 = [v335 stringByAppendingString:v454];

              v450 = [v297 recipients];
              id v457 = [v447 objectForKeyedSubscript:oslogc];
              if (!v457)
              {
                id v457 = [MEMORY[0x1E4F1CA80] set];
                [v447 setObject:v457 forKeyedSubscript:oslogc];
              }
              if (v452 && ([v457 containsObject:v452] & 1) != 0)
              {

                goto LABEL_413;
              }
              if (!v454 || ([v445 containsObject:v454] & 1) != 0) {
                goto LABEL_410;
              }
              [v445 addObject:v454];
              if (v452) {
                [v457 addObject:v452];
              }
              if (![v450 count])
              {
                [v430 addObject:v297];
                goto LABEL_410;
              }
              if ([v450 count] == 1)
              {
                v336 = [v297 recipients];
                v337 = [v336 firstObject];

                v338 = [v337 contact];
                v339 = [v338 identifier];

                v340 = [v337 handle];
                v341 = [v337 displayName];
                v342 = v341;
                if (v341)
                {
                  v343 = [v341 stringByAppendingString:oslogc];

                  if (v339) {
                    goto LABEL_368;
                  }
LABEL_402:
                  if (v340)
                  {
                    v604 = v340;
                    v373 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v604 count:1];
                    char v374 = [v428 containsObject:v373];

                    if ((v374 & 1) == 0)
                    {
                      v603 = v340;
                      v375 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v603 count:1];
                      [v428 addObject:v375];

                      goto LABEL_408;
                    }
                  }
                  else if (v343)
                  {
                    v602 = v343;
                    v376 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v602 count:1];
                    char v377 = [v428 containsObject:v376];

                    if ((v377 & 1) == 0)
                    {
                      v601 = v343;
                      v378 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v601 count:1];
                      [v428 addObject:v378];

LABEL_408:
                      [v430 addObject:v297];
                    }
                  }
                }
                else
                {
                  v343 = 0;
                  if (!v339) {
                    goto LABEL_402;
                  }
LABEL_368:
                  if (([v427 containsObject:v339] & 1) == 0)
                  {
                    [v427 addObject:v339];
                    goto LABEL_408;
                  }
                }

                goto LABEL_410;
              }
              v360 = [MEMORY[0x1E4F1CA48] array];
              long long v513 = 0u;
              long long v514 = 0u;
              long long v511 = 0u;
              long long v512 = 0u;
              id v361 = v450;
              uint64_t v362 = [v361 countByEnumeratingWithState:&v511 objects:v600 count:16];
              if (!v362) {
                goto LABEL_396;
              }
              uint64_t v363 = *(void *)v512;
              do
              {
                for (uint64_t i1 = 0; i1 != v362; ++i1)
                {
                  if (*(void *)v512 != v363) {
                    objc_enumerationMutation(v361);
                  }
                  v365 = *(void **)(*((void *)&v511 + 1) + 8 * i1);
                  v366 = [v365 contact];

                  if (v366)
                  {
                    v367 = [v365 contact];
                    v368 = [v367 identifier];
                    [v360 addObject:v368];
                  }
                  else
                  {
                    v369 = [v365 handle];

                    if (v369)
                    {
                      v367 = [v365 handle];
                      [v360 addObject:v367];
                    }
                    else
                    {
                      v370 = [v365 displayName];

                      if (!v370) {
                        continue;
                      }
                      v367 = [v365 displayName];
                      v371 = [v367 stringByAppendingString:oslogc];
                      [v360 addObject:v371];
                    }
                  }
                }
                uint64_t v362 = [v361 countByEnumeratingWithState:&v511 objects:v600 count:16];
              }
              while (v362);
LABEL_396:

              v372 = [v360 sortedArrayUsingSelector:sel_compare_];
              if (([v428 containsObject:v372] & 1) == 0)
              {
                [v428 addObject:v372];
                [v430 addObject:v297];
              }

LABEL_410:
LABEL_411:
              os_log_t oslogc = +[_PSLogging generalChannel];
              if (os_log_type_enabled(oslogc, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138740227;
                *(void *)&uint8_t buf[4] = v430;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v428;
                _os_log_debug_impl(&dword_1A314B000, oslogc, OS_LOG_TYPE_DEBUG, "suggestions array: %{sensitive}@, addedRecipientInfo: %@", buf, 0x16u);
              }
LABEL_413:

              v298 = v297;
LABEL_414:
            }
            uint64_t v483 = [v293 countByEnumeratingWithState:&v515 objects:v605 count:16];
          }
          while (v483);
        }

        BOOL v379 = [v430 count] < v419;
        if (!v379) {
          goto LABEL_442;
        }
        uint64_t v219 = v413;
        uint64_t v220 = v414 + 1;
      }
      while (v414 + 1 != v418);
      uint64_t v392 = [v421 countByEnumeratingWithState:&v558 objects:v615 count:16];
      uint64_t v418 = v392;
      v393 = v421;
      uint64_t v219 = v413;
      if (!v392) {
        goto LABEL_443;
      }
    }
  }
  uint64_t v416 = 0;
  uint64_t v417 = 0;
  uint64_t v487 = 0;
  uint64_t v485 = 0;
  unint64_t v439 = 0;
  uint64_t v436 = 0;
  v420 = 0;
LABEL_442:
  v393 = v421;
LABEL_443:

  [v489 end];
  [v463 updateTrialID:v430];
  v394 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v394, OS_LOG_TYPE_DEBUG)) {
    -[_PSEnsembleModel suggestionsFromSuggestionProxies:supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:](v463);
  }

  v598[0] = @"suggestionProxiesCount";
  v395 = NSString;
  uint64_t v396 = (uint64_t)obj;
  if (obj) {
    uint64_t v396 = [obj count];
  }
  v397 = objc_msgSend(v395, "stringWithFormat:", @"%ld", v396);
  v599[0] = v397;
  v598[1] = @"suggestionsCountAfterResolution";
  v398 = NSString;
  uint64_t v399 = (uint64_t)v430;
  if (v430) {
    uint64_t v399 = [v430 count];
  }
  v400 = objc_msgSend(v398, "stringWithFormat:", @"%ld", v399);
  v599[1] = v400;
  v598[2] = @"templateBatches_total";
  v401 = NSString;
  uint64_t v402 = (uint64_t)v421;
  if (v421) {
    uint64_t v402 = [v421 count];
  }
  v403 = objc_msgSend(v401, "stringWithFormat:", @"%ld", v402);
  v599[2] = v403;
  v598[3] = @"contactStoreIdQueryTimeSumInMillis";
  v404 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v417);
  v599[3] = v404;
  v598[4] = @"contactStoreIdQueryCount";
  v405 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v416);
  v599[4] = v405;
  v598[5] = @"contactStorePhoneQueryTimeSumInMillis";
  v406 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v485);
  v599[5] = v406;
  v598[6] = @"contactStorePhoneQueryCount";
  v407 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v436);
  v599[6] = v407;
  v598[7] = @"contactStoreEmailQueryTimeSumInMillis";
  v408 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v487);
  v599[7] = v408;
  v598[8] = @"contactStoreEmailQueryCount";
  v409 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v439);
  v599[8] = v409;
  v410 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v599 forKeys:v598 count:9];
  [v429 addAttributes:v410];

  [v429 end];
  v411 = (void *)[v430 copy];

  return v411;
}

- (BOOL)areRecipientsBlockedForSuggestion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend(a3, "recipients", 0);
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = ((char *)i + 1))
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v8 = +[_PSBlockedHandlesCache sharedBlockedHandlesCache];
        uint64_t v9 = [v7 handle];
        int v10 = [v8 isHandleBlocked:v9];

        if (v10)
        {
          id v4 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = [v7 handle];
            *(_DWORD *)buf = 138478083;
            long long v18 = v11;
            __int16 v19 = 2113;
            uint64_t v20 = v7;
            _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_DEFAULT, "handle %{private}@ is blocked; dropping recipient %{private}@",
              buf,
              0x16u);
          }
          LOBYTE(v4) = 1;
          goto LABEL_13;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v4;
}

- (BOOL)excludeSuggestionWithConversationId:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0 && ([v3 _appearsToBeBusinessID] & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0 && ([v3 _appearsToBeTemporaryID] & 1) != 0;

  return v4;
}

- (id)mergedSuggestionsWithFamilySuggestions:(id)a3 shareSheetSuggestions:(id)a4 maxSuggestions:(unint64_t)a5 supportedBundleIds:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:a3];
  if ([v11 count])
  {
    id v43 = v10;
    v41 = v9;
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v40 = v11;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
    unint64_t v15 = a5;
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v51 != v17) {
            objc_enumerationMutation(v13);
          }
          __int16 v19 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "recipients", v40);
          uint64_t v20 = [v19 firstObject];

          id v21 = [v20 contact];
          uint64_t v22 = [v21 identifier];

          if (v22) {
            [v12 addObject:v22];
          }
        }
        uint64_t v16 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v16);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v23 = v41;
    id v10 = v43;
    uint64_t v45 = [v23 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v47;
      id v42 = v23;
LABEL_13:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v47 != v44) {
          objc_enumerationMutation(v23);
        }
        uint64_t v25 = *(void **)(*((void *)&v46 + 1) + 8 * v24);
        if (objc_msgSend(v13, "count", v40) == v15) {
          break;
        }
        long long v26 = [v25 bundleID];
        int v27 = [v10 containsObject:v26];

        if (v27)
        {
          long long v28 = [v25 recipients];
          unint64_t v29 = [v28 count];

          if (v29 > 1) {
            goto LABEL_20;
          }
          int v30 = [v25 recipients];
          long long v31 = [v30 firstObject];
          [v31 contact];
          os_signpost_id_t v33 = v32 = v15;
          id v34 = [v33 identifier];
          char v35 = [v12 containsObject:v34];

          id v10 = v43;
          unint64_t v15 = v32;
          id v23 = v42;

          if ((v35 & 1) == 0) {
LABEL_20:
          }
            [v13 addObject:v25];
        }
        if (v45 == ++v24)
        {
          uint64_t v45 = [v23 countByEnumeratingWithState:&v46 objects:v54 count:16];
          if (v45) {
            goto LABEL_13;
          }
          break;
        }
      }
    }

    uint64_t v36 = (void *)[v13 copy];
    uint64_t v11 = v40;
    id v9 = v41;
  }
  else
  {
    unint64_t v37 = [v9 count];
    if (v37 >= a5) {
      unint64_t v38 = a5;
    }
    else {
      unint64_t v38 = v37;
    }
    uint64_t v36 = objc_msgSend(v9, "subarrayWithRange:", 0, v38);
  }

  return v36;
}

- (id)predictWithMapsPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [_PSContactResolver alloc];
  unint64_t v8 = [(_PSEnsembleModel *)self contactStore];
  id v9 = _PSMapsContactKeysToFetch();
  id v10 = [(_PSContactResolver *)v7 initWithContactStore:v8 keysToFetch:v9];

  uint64_t v11 = [(_PSEnsembleModel *)self contactStore];
  uint64_t v12 = getCNContactIdentifierKey_0();
  v65[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
  id v60 = 0;
  uint64_t v14 = objc_msgSend(v11, "_ios_meContactWithKeysToFetch:error:", v13, &v60);
  id v15 = v60;

  long long v53 = v15;
  if (v15)
  {
    uint64_t v16 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_PSEnsembleModel predictWithMapsPredictionContext:maxSuggestions:]();
    }
  }
  v55 = [v14 identifier];
  uint64_t v17 = [MEMORY[0x1E4F5B560] knowledgeStoreWithDirectReadOnlyAccess];
  id v54 = [(_PSEnsembleModel *)self interactionStore];
  os_unfair_lock_lock(&self->_lock);
  long long v18 = [(_PSEnsembleModel *)self knnMapsModel];

  long long v52 = v14;
  if (!v18)
  {
    __int16 v19 = [[_PSKNNModel alloc] initWithK:500 interactionStore:v54 filterByBundleIds:0 knowledgeStore:v17 contactResolver:v10 messageInteractionCache:0 shareInteractionCache:0];
    [(_PSEnsembleModel *)self setKnnMapsModel:v19];

    uint64_t v20 = [(_PSEnsembleModel *)self knnMapsModel];
    id v21 = [(_PSEnsembleModel *)self psConfig];
    [v20 updateModelProperties:v21];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v22 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSMapsPeopleKnnSuggestions", (const char *)&unk_1A3274816, buf, 2u);
  }

  id v23 = [(_PSEnsembleModel *)self knnMapsModel];
  uint64_t v24 = [v23 rankedMapsShareEtaSuggestions:v6 maxSuggestions:a4];

  uint64_t v25 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSMapsPeopleKnnSuggestions", (const char *)&unk_1A3274816, buf, 2u);
  }
  long long v51 = (void *)v17;

  long long v26 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [v24 count];
    *(_DWORD *)buf = 134349315;
    uint64_t v62 = v27;
    __int16 v63 = 2113;
    v64 = v24;
    _os_log_impl(&dword_1A314B000, v26, OS_LOG_TYPE_DEFAULT, "Maps ShareETA KNN suggestions: %{public}tu (%{private}@)", buf, 0x16u);
  }

  id v28 = v24;
  unint64_t v29 = v28;
  if ([v28 count] < a4)
  {
    int v30 = [(_PSEnsembleModel *)self knnMapsModel];
    long long v31 = v30;
    if (a4 <= 0x64) {
      unint64_t v32 = 100;
    }
    else {
      unint64_t v32 = a4;
    }
    os_signpost_id_t v33 = [v30 mapsShareEtaDefaultKnnSuggestions:v6 maxSuggestions:v32];

    unint64_t v29 = [(_PSEnsembleModel *)self mapsSuggestionArrayWithArray:v28 appendingUniqueElementsFromArray:v33 contactResolver:v10 meContactId:v55];
  }
  uint64_t v34 = [v6 seedContactIdentifiers];
  if (v34 && (v35 = (void *)v34, uint64_t v36 = [v29 count], v35, v36))
  {
    id v37 = [(_PSEnsembleModel *)self rerankMapsSuggestions:v29 usingPredictionContext:v6 contactResolver:v10];
  }
  else
  {
    id v37 = v29;
  }
  unint64_t v38 = v37;
  BOOL v39 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __68___PSEnsembleModel_predictWithMapsPredictionContext_maxSuggestions___block_invoke;
    v58[3] = &unk_1E5ADF158;
    id v59 = v29;
    uint64_t v40 = objc_msgSend(v38, "_pas_mappedArrayWithIndexedTransform:", v58);
    v41 = objc_msgSend(v40, "_pas_componentsJoinedByString:", @", ");

    *(_DWORD *)buf = 138543362;
    uint64_t v62 = (uint64_t)v41;
    _os_log_impl(&dword_1A314B000, v39, OS_LOG_TYPE_DEFAULT, "Maps ShareETA re-ranking: %{public}@", buf, 0xCu);
  }
  id v42 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __68___PSEnsembleModel_predictWithMapsPredictionContext_maxSuggestions___block_invoke_862;
    v56[3] = &unk_1E5ADF158;
    id v57 = v29;
    id v43 = objc_msgSend(v38, "_pas_mappedArrayWithIndexedTransform:", v56);
    uint64_t v44 = objc_msgSend(v43, "_pas_componentsJoinedByString:", @", ");

    *(_DWORD *)buf = 138477827;
    uint64_t v62 = (uint64_t)v44;
    _os_log_impl(&dword_1A314B000, v42, OS_LOG_TYPE_DEFAULT, "Maps ShareETA re-ranking private: %{private}@", buf, 0xCu);
  }
  uint64_t v45 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    long long v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
    *(_DWORD *)buf = 138543362;
    uint64_t v62 = (uint64_t)v46;
    _os_log_impl(&dword_1A314B000, v45, OS_LOG_TYPE_DEFAULT, "Total Maps ShareETA Suggestions count = %{public}@", buf, 0xCu);
  }
  unint64_t v47 = [v38 count];
  if (v47 >= a4) {
    unint64_t v48 = a4;
  }
  else {
    unint64_t v48 = v47;
  }
  long long v49 = objc_msgSend(v38, "subarrayWithRange:", 0, v48);

  return v49;
}

- (id)rerankMapsSuggestions:(id)a3 usingPredictionContext:(id)a4 contactResolver:(id)a5
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(_PSEnsembleModel *)self contactStore];
  v108 = self;
  uint64_t v12 = [(_PSEnsembleModel *)self defaultContactKeysToFetch];
  char v112 = objc_msgSend(v11, "_ios_meContactWithKeysToFetch:error:", v12, 0);

  v122 = objc_opt_new();
  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  v137 = v9;
  id v13 = [v9 seedContactIdentifiers];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v181 objects:v196 count:16];
  id v113 = v10;
  id v114 = v8;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v182;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v182 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = [v10 contactWithIdentifier:*(void *)(*((void *)&v181 + 1) + 8 * i)];
        if (v18)
        {
          __int16 v19 = [_PSRecipient alloc];
          uint64_t v20 = [v18 identifier];
          id v21 = [(_PSRecipient *)v19 initWithIdentifier:v20 handle:0 contact:v18];

          if (v21)
          {
            uint64_t v22 = [v112 identifier];
            id v23 = [v18 identifier];
            char v24 = [v22 isEqualToString:v23];

            if ((v24 & 1) == 0) {
              [v122 addObject:v21];
            }
            id v10 = v113;
            id v8 = v114;
          }
        }
        else
        {
          id v21 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[_PSEnsembleModel rerankMapsSuggestions:usingPredictionContext:contactResolver:](&v179, v180, v21);
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v181 objects:v196 count:16];
    }
    while (v15);
  }

  uint64_t v25 = v122;
  if ([v122 count])
  {
    uint64_t v26 = [v122 count];
    uint64_t v27 = [v137 seedContactIdentifiers];
    uint64_t v28 = [v27 count];

    if (v26 != v28)
    {
      unint64_t v29 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v29, OS_LOG_TYPE_DEFAULT, "Dropped a few contact ids from seedContactIdentifiers since a recipient could not be generated", buf, 2u);
      }
    }
    id v136 = (id)objc_opt_new();
    BOOL v115 = objc_opt_new();
    v109 = objc_opt_new();
    v135 = objc_opt_new();
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    obuint64_t j = v8;
    uint64_t v118 = [obj countByEnumeratingWithState:&v174 objects:v195 count:16];
    if (v118)
    {
      uint64_t v116 = *(void *)v175;
      do
      {
        for (uint64_t j = 0; j != v118; ++j)
        {
          if (*(void *)v175 != v116) {
            objc_enumerationMutation(obj);
          }
          long long v31 = *(void **)(*((void *)&v174 + 1) + 8 * j);
          long long v170 = 0u;
          long long v171 = 0u;
          long long v172 = 0u;
          long long v173 = 0u;
          v132 = v31;
          unint64_t v32 = [v31 recipients];
          id v123 = (id)[v32 countByEnumeratingWithState:&v170 objects:v194 count:16];
          if (v123)
          {
            uint64_t v33 = *(void *)v171;
            BOOL v129 = v32;
            uint64_t v120 = *(void *)v171;
            do
            {
              uint64_t v34 = 0;
              do
              {
                if (*(void *)v171 != v33) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v126 = v34;
                char v35 = [*(id *)(*((void *)&v170 + 1) + 8 * v34) contact];
                long long v166 = 0u;
                long long v167 = 0u;
                long long v168 = 0u;
                long long v169 = 0u;
                id v36 = v25;
                uint64_t v37 = [v36 countByEnumeratingWithState:&v166 objects:v193 count:16];
                if (v37)
                {
                  uint64_t v38 = v37;
                  uint64_t v39 = *(void *)v167;
                  while (2)
                  {
                    for (uint64_t k = 0; k != v38; ++k)
                    {
                      if (*(void *)v167 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      if (v35)
                      {
                        v41 = *(void **)(*((void *)&v166 + 1) + 8 * k);
                        id v42 = [v41 contact];

                        if (v42)
                        {
                          id v43 = [v35 identifier];
                          uint64_t v44 = [v41 contact];
                          uint64_t v45 = [v44 identifier];
                          int v46 = [v43 isEqualToString:v45];

                          if (v46)
                          {
                            [v115 addObject:v132];

                            uint64_t v25 = v122;
                            goto LABEL_44;
                          }
                        }
                      }
                    }
                    uint64_t v38 = [v36 countByEnumeratingWithState:&v166 objects:v193 count:16];
                    if (v38) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v34 = v126 + 1;
                uint64_t v33 = v120;
                uint64_t v25 = v122;
                unint64_t v32 = v129;
              }
              while ((id)(v126 + 1) != v123);
              id v123 = (id)[v129 countByEnumeratingWithState:&v170 objects:v194 count:16];
            }
            while (v123);
          }

          [v109 addObject:v132];
LABEL_44:
          ;
        }
        uint64_t v118 = [obj countByEnumeratingWithState:&v174 objects:v195 count:16];
      }
      while (v118);
    }

    uint64_t v47 = [v25 count];
    if (v47 != [v115 count])
    {
      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      id obja = v25;
      unint64_t v48 = v115;
      uint64_t v121 = [obja countByEnumeratingWithState:&v162 objects:v192 count:16];
      if (v121)
      {
        uint64_t v117 = *(void *)v163;
        do
        {
          for (uint64_t m = 0; m != v121; ++m)
          {
            if (*(void *)v163 != v117) {
              objc_enumerationMutation(obja);
            }
            long long v50 = *(void **)(*((void *)&v162 + 1) + 8 * m);
            long long v158 = 0u;
            long long v159 = 0u;
            long long v160 = 0u;
            long long v161 = 0u;
            long long v51 = v48;
            id v124 = (id)[(_PSSuggestion *)v51 countByEnumeratingWithState:&v158 objects:v191 count:16];
            if (v124)
            {
              uint64_t v52 = *(void *)v159;
              v130 = v51;
              uint64_t v133 = m;
              uint64_t v119 = *(void *)v159;
              do
              {
                uint64_t v53 = 0;
                do
                {
                  if (*(void *)v159 != v52) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v127 = v53;
                  id v54 = *(void **)(*((void *)&v158 + 1) + 8 * v53);
                  long long v154 = 0u;
                  long long v155 = 0u;
                  long long v156 = 0u;
                  long long v157 = 0u;
                  v55 = [v54 recipients];
                  uint64_t v56 = [v55 countByEnumeratingWithState:&v154 objects:v190 count:16];
                  if (v56)
                  {
                    uint64_t v57 = v56;
                    uint64_t v58 = *(void *)v155;
                    while (2)
                    {
                      for (uint64_t n = 0; n != v57; ++n)
                      {
                        if (*(void *)v155 != v58) {
                          objc_enumerationMutation(v55);
                        }
                        id v60 = *(void **)(*((void *)&v154 + 1) + 8 * n);
                        double v61 = [v50 contact];
                        uint64_t v62 = [v61 identifier];
                        __int16 v63 = [v60 contact];
                        v64 = [v63 identifier];
                        int v65 = [v62 isEqualToString:v64];

                        if (v65)
                        {

                          unint64_t v48 = v115;
                          v73 = v130;
                          uint64_t m = v133;
                          goto LABEL_69;
                        }
                      }
                      uint64_t v57 = [v55 countByEnumeratingWithState:&v154 objects:v190 count:16];
                      if (v57) {
                        continue;
                      }
                      break;
                    }
                  }

                  uint64_t v53 = v127 + 1;
                  long long v51 = v130;
                  uint64_t m = v133;
                  uint64_t v52 = v119;
                }
                while ((id)(v127 + 1) != v124);
                unint64_t v48 = v115;
                id v124 = (id)[(_PSSuggestion *)v130 countByEnumeratingWithState:&v158 objects:v191 count:16];
              }
              while (v124);
            }

            int v66 = [(_PSEnsembleModel *)v108 contactResolver];
            v67 = [v50 contact];
            int v68 = [v66 allEmailAndPhoneNumberHandlesForContact:v67];
            v69 = [v68 firstObject];
            [v50 setHandle:v69];

            v70 = [_PSSuggestion alloc];
            v71 = [v50 handle];
            v189 = v50;
            v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v189 count:1];
            LOBYTE(v107) = 0;
            v73 = [(_PSSuggestion *)v70 initWithBundleID:v71 conversationIdentifier:0 groupName:0 recipients:v72 derivedIntentIdentifier:0 image:0 reason:@"Maps Seeded Contact" reasonType:0 score:0 familySuggestion:v107];

            [v135 addObject:v73];
LABEL_69:
          }
          uint64_t v121 = [obja countByEnumeratingWithState:&v162 objects:v192 count:16];
        }
        while (v121);
      }
    }
    if ([v115 count]) {
      [v136 addObjectsFromArray:v115];
    }
    id v10 = v113;
    if ((unint64_t)[v115 count] > 1) {
      unint64_t v74 = 2;
    }
    else {
      unint64_t v74 = [v115 count];
    }
    id v8 = v114;
    if ([v135 count])
    {
      long long v148 = 0uLL;
      long long v149 = 0uLL;
      long long v146 = 0uLL;
      long long v147 = 0uLL;
      id v125 = (id)[v135 copy];
      uint64_t v131 = [v125 countByEnumeratingWithState:&v146 objects:v187 count:16];
      if (v131)
      {
        uint64_t v128 = *(void *)v147;
        do
        {
          uint64_t v75 = 0;
          do
          {
            if (*(void *)v147 != v128) {
              objc_enumerationMutation(v125);
            }
            uint64_t v134 = v75;
            v76 = *(void **)(*((void *)&v146 + 1) + 8 * v75);
            long long v142 = 0u;
            long long v143 = 0u;
            long long v144 = 0u;
            long long v145 = 0u;
            v77 = [v76 recipients];
            uint64_t v78 = [v77 countByEnumeratingWithState:&v142 objects:v186 count:16];
            if (v78)
            {
              uint64_t v79 = v78;
              uint64_t v80 = *(void *)v143;
              do
              {
                for (iuint64_t i = 0; ii != v79; ++ii)
                {
                  if (*(void *)v143 != v80) {
                    objc_enumerationMutation(v77);
                  }
                  v82 = *(void **)(*((void *)&v142 + 1) + 8 * ii);
                  v83 = [v137 seedContactIdentifiers];
                  v84 = [v82 contact];
                  v85 = [v84 identifier];
                  int v86 = [v83 containsObject:v85];

                  if (v86)
                  {
                    v87 = [v82 contact];
                    v88 = [v87 postalAddresses];
                    uint64_t v89 = [v88 count];

                    if (v89)
                    {
                      int64_t v90 = [v137 seedContactIdentifiers];
                      int v91 = [v82 contact];
                      v92 = [v91 identifier];
                      unint64_t v93 = [v90 indexOfObject:v92];

                      if (v93 > [v136 count]) {
                        unint64_t v93 = [v136 count];
                      }
                      [v136 insertObject:v76 atIndex:v93];
                      [v135 removeObject:v76];
                    }
                  }
                }
                uint64_t v79 = [v77 countByEnumeratingWithState:&v142 objects:v186 count:16];
              }
              while (v79);
            }

            uint64_t v75 = v134 + 1;
          }
          while (v134 + 1 != v131);
          uint64_t v131 = [v125 countByEnumeratingWithState:&v146 objects:v187 count:16];
        }
        while (v131);
      }

      [v136 addObjectsFromArray:v109];
      [v136 addObjectsFromArray:v135];
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v94 = v109;
      uint64_t v95 = [v94 countByEnumeratingWithState:&v138 objects:v185 count:16];
      id v10 = v113;
      id v8 = v114;
      if (v95)
      {
        uint64_t v96 = v95;
        uint64_t v97 = *(void *)v139;
        do
        {
          for (juint64_t j = 0; jj != v96; ++jj)
          {
            if (*(void *)v139 != v97) {
              objc_enumerationMutation(v94);
            }
            uint64_t v99 = *(void *)(*((void *)&v138 + 1) + 8 * jj);
            if (([v136 containsObject:v99] & 1) == 0) {
              [v136 addObject:v99];
            }
          }
          uint64_t v96 = [v94 countByEnumeratingWithState:&v138 objects:v185 count:16];
        }
        while (v96);
      }
    }
    else
    {
      long long v152 = 0uLL;
      long long v153 = 0uLL;
      long long v150 = 0uLL;
      long long v151 = 0uLL;
      id v100 = v109;
      uint64_t v101 = [v100 countByEnumeratingWithState:&v150 objects:v188 count:16];
      if (v101)
      {
        uint64_t v102 = v101;
        uint64_t v103 = *(void *)v151;
        do
        {
          for (kuint64_t k = 0; kk != v102; ++kk)
          {
            if (*(void *)v151 != v103) {
              objc_enumerationMutation(v100);
            }
            uint64_t v105 = *(void *)(*((void *)&v150 + 1) + 8 * kk);
            if (v74 > [v136 count]) {
              unint64_t v74 = [v136 count];
            }
            [v136 insertObject:v105 atIndex:v74++];
          }
          uint64_t v102 = [v100 countByEnumeratingWithState:&v150 objects:v188 count:16];
        }
        while (v102);
      }
    }

    uint64_t v25 = v122;
  }
  else
  {
    id v136 = v8;
  }

  return v136;
}

- (id)mapsSuggestionArrayWithArray:(id)a3 appendingUniqueElementsFromArray:(id)a4 contactResolver:(id)a5 meContactId:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v36 = a5;
  id v35 = a6;
  id v9 = [a3 arrayByAddingObjectsFromArray:a4];
  id v33 = [MEMORY[0x1E4F1CA48] array];
  id v10 = [MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    id v34 = v11;
    do
    {
      uint64_t v15 = 0;
      uint64_t v37 = v13;
      do
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v38 + 1) + 8 * v15);
        uint64_t v17 = [v16 recipients];
        uint64_t v18 = [v17 count];

        if (v18 == 1)
        {
          __int16 v19 = v10;
          uint64_t v20 = [v16 recipients];
          id v21 = [v20 firstObject];

          uint64_t v22 = [v21 contact];
          if (v22)
          {
            id v23 = (void *)v22;
            char v24 = [v36 allEmailAndPhoneNumberHandlesForContact:v22];
            uint64_t v25 = [v21 handle];
            char v26 = [v24 containsObject:v25];

            if ((v26 & 1) == 0) {
              goto LABEL_16;
            }
LABEL_11:
            unint64_t v29 = [v23 identifier];
            if (([v29 isEqualToString:v35] & 1) == 0)
            {
              int v30 = [v23 identifier];
              char v31 = [v19 containsObject:v30];

              if (v31)
              {
                id v11 = v34;
                goto LABEL_16;
              }
              [v33 addObject:v16];
              unint64_t v29 = [v23 identifier];
              [v19 addObject:v29];
              id v11 = v34;
            }

            goto LABEL_16;
          }
          uint64_t v27 = [v21 handle];
          id v23 = [v36 resolveContactIfPossibleFromContactIdentifierString:v27 pickFirstOfMultiple:1];

          uint64_t v28 = [v23 identifier];
          [v21 setIdentifier:v28];

          [v21 setContact:v23];
          if (v23) {
            goto LABEL_11;
          }
LABEL_16:

          id v10 = v19;
          uint64_t v13 = v37;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v13);
  }

  return v33;
}

- (id)suggestZKWSuggestionsWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  v94[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 bundleID];
  uint64_t v7 = +[_PSConstants mobileSharePlayPeoplePickerBundleId];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = +[_PSConstants mobileFacetimeBundleId];
    [v5 setBundleID:v9];
  }
  id v10 = [v5 bundleID];
  id v11 = +[_PSConstants macSharePlayPeoplePickerBundleId];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = +[_PSConstants macFacetimeBundleId];
    [v5 setBundleID:v13];
  }
  uint64_t v14 = [v5 bundleID];
  uint64_t v15 = +[_PSConstants preferencesBundleId];
  if ([v14 isEqualToString:v15])
  {
  }
  else
  {
    uint64_t v16 = [v5 bundleID];
    uint64_t v17 = +[_PSConstants mobilePhoneBundleId];
    int v18 = [v16 isEqualToString:v17];

    if (!v18) {
      goto LABEL_9;
    }
  }
  __int16 v19 = +[_PSConstants mobileMessagesBundleId];
  [v5 setBundleID:v19];

LABEL_9:
  uint64_t v20 = [v5 bundleID];
  id v21 = +[_PSConstants passwordsAppBundleId];
  int v22 = [v20 isEqualToString:v21];

  if (v22)
  {
    id v23 = +[_PSConstants mobileMessagesBundleId];
    [v5 setBundleID:v23];
  }
  char v24 = [v5 bundleID];
  uint64_t v25 = +[_PSConstants macSafariBundleId];
  if ([v24 isEqualToString:v25]) {
    goto LABEL_14;
  }
  char v26 = [v5 bundleID];
  uint64_t v27 = +[_PSConstants macSafariTechnologyPreviewBundleId];
  if ([v26 isEqualToString:v27])
  {

LABEL_14:
LABEL_15:
    uint64_t v28 = +[_PSConstants mobileMessagesBundleId];
    [v5 setBundleID:v28];

    goto LABEL_16;
  }
  v73 = [v5 bundleID];
  unint64_t v74 = +[_PSConstants macSafariPlatformSupportBundleId];
  char v75 = [v73 isEqualToString:v74];

  if (v75) {
    goto LABEL_15;
  }
LABEL_16:
  BOOL v29 = +[_PSFTZKWConfig useBlendingLayer];
  int v30 = [v5 bundleID];
  char v31 = +[_PSConstants findMyBundleId];
  int v32 = [v30 isEqualToString:v31];

  if (v32)
  {
    id v33 = +[_PSConstants mobileMessagesBundleId];
    [v5 setBundleID:v33];
  }
  id v34 = [v5 bundleID];
  id v35 = +[_PSConstants mobileFacetimeBundleId];
  if ([v34 isEqualToString:v35])
  {
    int v36 = 0;
  }
  else
  {
    uint64_t v37 = [v5 bundleID];
    long long v38 = +[_PSConstants macFacetimeBundleId];
    int v39 = [v37 isEqualToString:v38];

    int v36 = v39 ^ 1;
  }

  long long v40 = [v5 bundleID];
  long long v41 = +[_PSConstants mobileMessagesBundleId];
  if ([v40 isEqualToString:v41])
  {
    int v42 = 1;
  }
  else
  {
    uint64_t v43 = [v5 bundleID];
    uint64_t v44 = +[_PSConstants macMessagesBundleId];
    int v42 = [v43 isEqualToString:v44];
  }
  if ((_os_feature_enabled_impl() ^ 1 | v36))
  {
    if (v42)
    {
      uint64_t v45 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EF674D48];
      int v46 = [_PSKNNModelConfiguration alloc];
      int64_t v90 = v45;
      uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
      unint64_t v48 = (void *)MEMORY[0x1E4F1CAD0];
      long long v49 = [v5 bundleID];
      long long v50 = [v48 setWithObject:v49];
      uint64_t v89 = v50;
      long long v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
      uint64_t v52 = [(_PSKNNModelConfiguration *)v46 initWithInteractionMechanisms:v47 interactionCountMaxDepths:&unk_1EF675F18 interactionHistoryRelativeStartDates:&unk_1EF675F30 bundleIds:v51 modelType:0 clusterPruneThreshold:5 modelName:@"PastMessages"];

      uint64_t v53 = [(_PSEnsembleModel *)self _knnZKWSuggestionsWithPredictionContext:v5 modelConfiguration:v52 maxSuggestions:a4];
    }
    else
    {
      uint64_t v53 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v54 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v54, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeTotalTime", " enableTelemetry=YES ", buf, 2u);
    }

    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __78___PSEnsembleModel_suggestZKWSuggestionsWithPredictionContext_maxSuggestions___block_invoke;
    v88[3] = &unk_1E5ADEDD0;
    v88[4] = self;
    +[_PSFTZKWTrialWrapper runIfUpdated:v88];
    v55 = [(_PSFTZKWOrchestrator *)self->_zkwFTOrchestrator config];
    [v55 setUseBlendingLayer:v29];

    v85 = [(_PSFTZKWOrchestrator *)self->_zkwFTOrchestrator getSuggestionsWithPredictionContext:v5];
    uint64_t v56 = [_PSFTZKWSuggestionsTransformerFactory alloc];
    uint64_t v57 = [(_PSEnsembleModel *)self interactionStore];
    uint64_t v58 = self;
    id v59 = [(_PSFTZKWSuggestionsTransformerFactory *)v56 initWithInteractionStore:v57];

    v83 = (void *)MEMORY[0x1E4F1CA48];
    v82 = [(_PSFTZKWSuggestionsTransformerFactory *)v59 mapRecipientsToContactsWithUnmapped:1];
    v94[0] = v82;
    v81 = [(_PSFTZKWSuggestionsTransformerFactory *)v59 filterIDSReachable];
    v94[1] = v81;
    uint64_t v80 = +[_PSConstants mobileMessagesBundleId];
    v93[0] = v80;
    uint64_t v79 = +[_PSConstants macMessagesBundleId];
    v93[1] = v79;
    uint64_t v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
    v77 = [(_PSFTZKWSuggestionsTransformerFactory *)v59 formatWithBundleIdsForGroupMatching:v78];
    v94[2] = v77;
    id v60 = [v5 seedRecipients];
    double v61 = [(_PSFTZKWSuggestionsTransformerFactory *)v59 deduplicateWithSeedRecipients:v60];
    v94[3] = v61;
    uint64_t v62 = [(_PSFTZKWSuggestionsTransformerFactory *)v59 deduplicateWithMaxSuggestions:a4];
    v94[4] = v62;
    __int16 v63 = [(_PSEnsembleModel *)v58 zkwFTTrialData];
    v64 = [v63 experimentIdentifiers];
    int v65 = [(_PSEnsembleModel *)v58 zkwFTTrialData];
    int v66 = [v65 rolloutIdentifiers];
    v87 = v59;
    v67 = [(_PSFTZKWSuggestionsTransformerFactory *)v59 annotateWithTrialExperimentIdentifiers:v64 rolloutIdentifiers:v66];
    v94[5] = v67;
    int v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:6];
    v84 = [v83 arrayWithArray:v68];

    v69 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v69))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v69, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeTransformersTotalTime", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v53 = +[_PSFTZKWSuggestionsTransformerFactory getResultsFromTransformers:v84 suggestions:v85];
    v70 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v70))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v70, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeTransformersTotalTime", (const char *)&unk_1A3274816, buf, 2u);
    }

    v71 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v71))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v71, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeTotalTime", (const char *)&unk_1A3274816, buf, 2u);
    }

    v72 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      v92 = v53;
      _os_log_impl(&dword_1A314B000, v72, OS_LOG_TYPE_DEFAULT, "Final ZKW suggestions post-transformers: %{sensitive}@", buf, 0xCu);
    }
  }

  return v53;
}

- (id)_knnZKWSuggestionsWithPredictionContext:(id)a3 modelConfiguration:(id)a4 maxSuggestions:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_PSEnsembleModel *)self knnZkwModel];
  id v11 = [v10 rankedZkwSuggestionsWithPredictionContext:v9 modelConfiguration:v8 maxSuggestions:a5];

  int v12 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[_PSEnsembleModel _knnZKWSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:]();
  }

  [(_PSEnsembleModel *)self updateTrialID:v11];
  uint64_t v13 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[_PSEnsembleModel _knnZKWSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:](self);
  }

  uint64_t v14 = (void *)[v11 copy];

  return v14;
}

- (id)rankedGlobalSuggestionsWithPredictionContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(unint64_t)a5 excludeBackfillSuggestions:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __120___PSEnsembleModel_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions___block_invoke;
  v28[3] = &unk_1E5ADE9A8;
  v28[4] = self;
  id v10 = a3;
  id v11 = (void *)MEMORY[0x1A6243AD0](v28);
  int v12 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];
  uint64_t v13 = [v12 rankedGlobalSuggestionsWithPredictionContext:v10 maxSuggestions:a5 contactsOnly:v8 interactions:0 contactIdIsInStoreBlock:v11];

  uint64_t v14 = (void *)[v13 mutableCopy];
  uint64_t v15 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = "NO";
    if (v6) {
      uint64_t v16 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v30 = (uint64_t)v16;
    _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_INFO, "excludeBackfillSuggestions for rankedGlobalSuggestionsWithPredictionContext %s", buf, 0xCu);
  }

  if ([v14 count] < a5 && !v6)
  {
    uint64_t v17 = [(_PSEnsembleModel *)self contactMonitor];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __120___PSEnsembleModel_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions___block_invoke_891;
    char v24 = &unk_1E5ADF180;
    uint64_t v25 = self;
    id v26 = v14;
    unint64_t v27 = a5;
    [v17 enumerateContactStoreWithBlock:&v21];
  }
  int v18 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [v14 count];
    *(_DWORD *)buf = 134218243;
    uint64_t v30 = v19;
    __int16 v31 = 2113;
    int v32 = v14;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "Returning %tu suggestions for rankedGlobalSuggestions, full suggestions: %{private}@", buf, 0x16u);
  }

  return v14;
}

- (id)rankedGlobalSuggestionsWithPredictionContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(unint64_t)a5
{
  return [(_PSEnsembleModel *)self rankedGlobalSuggestionsWithPredictionContext:a3 contactsOnly:a4 maxSuggestions:a5 excludeBackfillSuggestions:0];
}

- (id)rankedGlobalSuggestionsForSiriNLWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4 interactionId:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if ([MEMORY[0x1E4F5B3B8] isRunningOnInternalBuild])
  {
    BOOL v8 = objc_alloc_init(_PSContactSuggester);
    id v9 = [(_PSContactSuggester *)v8 contactPriorsForContactIdentifiers:0];
    id v10 = [v9 allValues];

    unint64_t v11 = [v10 count];
    if (v11 >= a4) {
      unint64_t v12 = a4;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v13 = objc_msgSend(v10, "subarrayWithRange:", 0, v12);
    uint64_t v14 = +[_PSSiriNLRankerUtilities knowledgeEventWithContactPriors:v13 interactionId:v7];
    if (v14)
    {
      uint64_t v15 = [(_PSEnsembleModel *)self knowledgeStore];
      v18[0] = v14;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v15 saveObjects:v16 tracker:&__block_literal_global_901 responseQueue:0 withCompletion:&__block_literal_global_904];
    }
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)rankedNameSuggestionsWithPredictionContext:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];
  id v9 = [v8 rankedNameSuggestionsWithPredictionContext:v7 forName:v6];

  return v9;
}

- (id)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];
  id v9 = [v8 rankedAutocompleteSuggestionsWithPredictionContext:v7 candidates:v6];

  return v9;
}

- (id)autocompleteSearchResultsWithPredictionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];
  id v6 = [v5 messagesGroupResultsForPredictionContext:v4];

  return v6;
}

- (id)rankedSiriMLCRHandles:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];
  id v9 = [v8 rankedSiriMLCRHandles:v7 context:v6];

  return v9;
}

- (id)rankedHandlesFromCandidateHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSEnsembleModel *)self knnNameOrContactRankerModel];
  id v6 = [v5 rankedHandlesFromCandidateHandles:v4];

  return v6;
}

- (id)appExtensionSuggestionsFromContext:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetAppSuggestionsTotalTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  id v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke;
    v32[3] = &unk_1E5ADEFD0;
    id v33 = v3;
    id v6 = __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke((uint64_t)v32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_INFO, "appExtensionSuggestionsFromContext - appBundleIdsToShareExtensionBundleIdsMapping: %@", (uint8_t *)&buf, 0xCu);
  }
  id v7 = +[_PSAppUsageUtilities sharesFromSourceToTargetBundleValues];
  BOOL v8 = +[_PSAppUsageUtilities appUsageDurations];
  id v9 = [v3 appBundleIdsToShareExtensionBundleIdsMapping];
  id v10 = [v3 bundleID];
  unint64_t v11 = +[_PSAppUsageUtilities mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping:v9 sourceBundleId:v10 sharesFromSourceToTargetBundle:v7 appUsageDurations:v8];

  unint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v11, "count"));
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  BOOL v29 = __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke_909;
  uint64_t v30 = &unk_1E5ADF1E8;
  id v13 = v12;
  id v31 = v13;
  [v11 enumerateObjectsUsingBlock:&v27];
  uint64_t v14 = objc_msgSend(v3, "sessionID", v27, v28, v29, v30);
  if (!v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v15 UUIDString];
  }
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2050000000;
  uint64_t v16 = (void *)getPSAppSuggestionsMetricsInferenceEventClass_softClass;
  uint64_t v37 = getPSAppSuggestionsMetricsInferenceEventClass_softClass;
  if (!getPSAppSuggestionsMetricsInferenceEventClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    int v39 = __getPSAppSuggestionsMetricsInferenceEventClass_block_invoke;
    long long v40 = &unk_1E5ADE858;
    long long v41 = &v34;
    ReportingPluginLibraryCore();
    Class Class = objc_getClass("PSAppSuggestionsMetricsInferenceEvent");
    *(void *)(v41[1] + 24) = Class;
    getPSAppSuggestionsMetricsInferenceEventClass_softClass Class = *(void *)(v41[1] + 24);
    uint64_t v16 = (void *)v35[3];
  }
  int v18 = v16;
  _Block_object_dispose(&v34, 8);
  id v19 = [v18 alloc];
  uint64_t v20 = (void *)[v13 copy];
  uint64_t v21 = (void *)[v19 initWithIdentifier:v14 suggestions:v20];

  if (v21)
  {
    [getPSMetricsManagerClass() recordWithAppInference:v21];
  }
  else
  {
    uint64_t v22 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[_PSEnsembleModel appExtensionSuggestionsFromContext:]();
    }
  }
  id v23 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v23))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetAppSuggestionsTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&buf, 2u);
  }

  char v24 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1A314B000, v24, OS_LOG_TYPE_INFO, "appExtensionSuggestionsFromContext - final results: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  id v25 = v11;
  return v25;
}

- (id)candidatesForShareSheetRanking
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "Fetch candidates for Share Sheet", buf, 2u);
  }

  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke_3;
  v77[3] = &unk_1E5ADF238;
  id v6 = v4;
  id v78 = v6;
  id v7 = v5;
  id v79 = v7;
  uint64_t v8 = MEMORY[0x1A6243AD0](v77);
  id v9 = [(_PSEnsembleModel *)self shareInteractionCache];

  if (v9)
  {
    id v10 = [(_PSEnsembleModel *)self shareInteractionCache];
    unint64_t v11 = [v10 uniqueConversationCandidates];

    id v13 = __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke(v12, v11);
    uint64_t v14 = [(_PSEnsembleModel *)self maxCandidatesFromShareSheetCache];
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v13, v14);
  }
  uint64_t v15 = [(_PSEnsembleModel *)self messageInteractionCache];

  if (v15)
  {
    uint64_t v16 = [(_PSEnsembleModel *)self messageInteractionCache];
    uint64_t v17 = [v16 uniqueConversationCandidates];

    id v19 = __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke(v18, v17);
    uint64_t v20 = [(_PSEnsembleModel *)self maxCandidatesFromMessageCache];
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v19, v20);
  }
  uint64_t v21 = objc_opt_new();
  [v21 addObjectsFromArray:v6];
  [v21 addObjectsFromArray:v7];
  uint64_t v22 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138478083;
    uint64_t v83 = (uint64_t)v6;
    __int16 v84 = 2113;
    id v85 = v7;
    _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_INFO, "Top candidates are: %{private}@, remaining candidates are: %{private}@", buf, 0x16u);
  }
  double v61 = v7;
  uint64_t v62 = v6;

  id v23 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v24 = v21;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v74 != v27) {
          objc_enumerationMutation(v24);
        }
        BOOL v29 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        uint64_t v30 = [v29 recipientsId];
        if (v30)
        {
          id v31 = (void *)v30;
          int v32 = [v29 domainId];

          if (v32)
          {
            id v33 = [v29 recipientsId];
            [v23 setObject:v29 forKeyedSubscript:v33];
          }
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v73 objects:v81 count:16];
    }
    while (v26);
  }
  id v60 = (void *)v8;

  uint64_t v34 = [(_PSEnsembleModel *)self maxCandidatesFromMessageCache];
  uint64_t v35 = [v34 integerValue];
  uint64_t v36 = [(_PSEnsembleModel *)self maxCandidatesFromShareSheetCache];
  uint64_t v37 = [v36 integerValue];

  long long v38 = objc_opt_new();
  int v65 = _PSShareSheetExtensionBundleIDToAppBundleIDMapping([(_PSEnsembleModel *)self allowNonSupportedBundleIDs]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = v24;
  uint64_t v68 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
  if (v68)
  {
    unint64_t v67 = v37 + v35;
    uint64_t v66 = *(void *)v70;
LABEL_21:
    uint64_t v39 = 0;
    while (1)
    {
      if (*(void *)v70 != v66) {
        objc_enumerationMutation(obj);
      }
      long long v40 = *(void **)(*((void *)&v69 + 1) + 8 * v39);
      if ([v38 count] >= v67) {
        break;
      }
      long long v41 = [v40 domainId];
      if (!v41)
      {
        uint64_t v42 = [v40 recipientsId];

        if (!v42) {
          goto LABEL_29;
        }
        uint64_t v43 = [v40 recipientsId];
        long long v41 = [v23 objectForKeyedSubscript:v43];

        uint64_t v44 = [v41 domainId];
        [v40 setDomainId:v44];

        uint64_t v45 = [v41 derivedIntentId];
        [v40 setDerivedIntentId:v45];
      }
LABEL_29:
      int v46 = [v40 domainId];
      if (v46)
      {

LABEL_32:
        unint64_t v48 = [_PSCandidate alloc];
        long long v49 = [v40 domainId];
        long long v50 = [v40 derivedIntentId];
        long long v51 = [v40 bundleId];
        uint64_t v52 = [v65 objectForKeyedSubscript:v51];
        uint64_t v53 = (uint64_t)v52;
        if (!v52)
        {
          uint64_t v53 = [v40 bundleId];
          __int16 v63 = (void *)v53;
        }
        id v54 = [v40 recipientsId];
        v55 = [(_PSCandidate *)v48 initWithDomainId:v49 derivedIntentId:v50 bundleId:v53 recipientsId:v54];
        [v38 addObject:v55];

        if (!v52) {
        goto LABEL_37;
        }
      }
      uint64_t v47 = [v40 recipientsId];

      if (v47) {
        goto LABEL_32;
      }
LABEL_37:
      if (v68 == ++v39)
      {
        uint64_t v68 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
        if (v68) {
          goto LABEL_21;
        }
        break;
      }
    }
  }

  uint64_t v56 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v57 = [v38 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v83 = v57;
    _os_log_impl(&dword_1A314B000, v56, OS_LOG_TYPE_DEFAULT, "Fetched %tu candidates", buf, 0xCu);
  }

  uint64_t v58 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v83 = (uint64_t)v38;
    _os_log_impl(&dword_1A314B000, v58, OS_LOG_TYPE_INFO, "Fetched candidates for Share Sheet ranking %{private}@", buf, 0xCu);
  }

  return v38;
}

- (id)computeEphemeralFeaturesWithPredictionContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_INFO, "Computing ephemeral features", (uint8_t *)&v14, 2u);
  }

  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  featureCache = self->_featureCache;
  os_unfair_lock_unlock(&self->_lock);
  if (!featureCache) {
    [(_PSEnsembleModel *)self populateCaches];
  }
  [(_PSEnsembleModel *)self getPhotoBasedFeatures:v4];
  os_unfair_lock_lock(&self->_lock);
  [(_PSFeatureCache *)self->_featureCache setPredictionContextWithContext:v4];
  uint64_t v8 = self->_featureCache;
  id v9 = [(_PSEnsembleModel *)self candidatesForShareSheetRanking];
  id v10 = [(_PSFeatureCache *)v8 computeEphemeralFeaturesWithCandidates:v9 context:v4];

  unint64_t v11 = +[_PSFeaturePreprocessor encodeFeatureVectors:v10];
  os_unfair_lock_unlock(p_lock);
  uint64_t v12 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 138477827;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_INFO, "Computed ephemeral features %{private}@", (uint8_t *)&v14, 0xCu);
  }

  return v11;
}

- (id)validateCoreMLModelWithRawInput:(id)a3 predictionContext:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "Validating CoreML model", buf, 2u);
  }

  uint64_t v8 = +[_PSFeaturePreprocessor rawDataToCandidateFeatureDict:v6];

  [v5 setIsCoreMLValidationFetch:1];
  id v9 = objc_alloc_init(_PSCoreMLScoringModel);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70___PSEnsembleModel_validateCoreMLModelWithRawInput_predictionContext___block_invoke;
  v14[3] = &unk_1E5ADF260;
  id v10 = v8;
  id v15 = v10;
  unint64_t v11 = [(_PSCoreMLScoringModel *)v9 scoreCandidates:v14 predictionContext:v5];
  uint64_t v12 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_INFO, "candidateToScore: %{private}@", buf, 0xCu);
  }

  return v5;
}

- (int64_t)pruneCandidatesForRanking:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_DEFAULT, "Pruning all candidates that the user never sent a message to.", buf, 2u);
  }

  id v5 = [v3 conversationIds];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46___PSEnsembleModel_pruneCandidatesForRanking___block_invoke;
  v11[3] = &unk_1E5ADF288;
  id v6 = v3;
  id v12 = v6;
  id v7 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v11);

  [v6 removeConversationIds:v7];
  uint64_t v8 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    int v14 = v7;
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_DEFAULT, "Finished pruning candidates. Candidates removed: %@", buf, 0xCu);
  }

  int64_t v9 = [v7 count];
  return v9;
}

- (void)addAdditionalStatsSignalsToCandidates:(id)a3 withTrialClient:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v7))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_addAdditionalNonStatsSignalsToCandidates", " enableTelemetry=YES ", (uint8_t *)&v12, 2u);
  }

  uint64_t v8 = [v5 additionalFeaturesToCompute];
  [v6 computeFeaturesForRecipe:v8];

  int64_t v9 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v5 additionalFeaturesToCompute];
    int v12 = 138412290;
    id v13 = v10;
    _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Finished computing additional features %@", (uint8_t *)&v12, 0xCu);
  }
  unint64_t v11 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_addAdditionalNonStatsSignalsToCandidates", (const char *)&unk_1A3274816, (uint8_t *)&v12, 2u);
  }
}

- (void)setupAeroMLPipelineLoggerWithModel:(id)a3
{
  id v4 = a3;
  if ([(_PSEnsembleModel *)self enablePipelineCheckpointing]
    && ([MEMORY[0x1E4F93B08] isInternalBuild] & 1) != 0)
  {
    id v5 = [(_PSEnsembleModel *)self amlPipelineLogger];

    if (v5)
    {
      id v6 = +[_PSLogging rewriteChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        id v7 = "_PSEnsemble: reusing AMLPipelineLogger object";
LABEL_8:
        _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v24, 2u);
      }
    }
    else
    {
      uint64_t v8 = [v4 modelDescription];
      id v6 = [v8 inputDescriptionsByName];

      int64_t v9 = [v4 modelDescription];
      id v10 = [v9 metadata];
      unint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1E8B8]];

      uint64_t v29 = 0;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x2050000000;
      int v12 = (void *)getAMLFeaturesSpecificationClass_softClass;
      uint64_t v32 = getAMLFeaturesSpecificationClass_softClass;
      if (!getAMLFeaturesSpecificationClass_softClass)
      {
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        uint64_t v26 = __getAMLFeaturesSpecificationClass_block_invoke;
        uint64_t v27 = &unk_1E5ADE858;
        uint64_t v28 = &v29;
        AeroMLLibraryCore();
        v30[3] = (uint64_t)objc_getClass("AMLFeaturesSpecification");
        getAMLFeaturesSpecificationClass_softClass Class = *(void *)(v28[1] + 24);
        int v12 = (void *)v30[3];
      }
      id v13 = v12;
      _Block_object_dispose(&v29, 8);
      id v14 = [v13 alloc];
      uint64_t v15 = [v6 allValues];
      uint64_t v16 = (void *)[v14 initWithFeaturesDescription:v15];

      uint64_t v29 = 0;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x2050000000;
      uint64_t v17 = (void *)getAMLFeaturesConfigurationClass_softClass;
      uint64_t v32 = getAMLFeaturesConfigurationClass_softClass;
      if (!getAMLFeaturesConfigurationClass_softClass)
      {
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        uint64_t v26 = __getAMLFeaturesConfigurationClass_block_invoke;
        uint64_t v27 = &unk_1E5ADE858;
        uint64_t v28 = &v29;
        AeroMLLibraryCore();
        v30[3] = (uint64_t)objc_getClass("AMLFeaturesConfiguration");
        getAMLFeaturesConfigurationClass_softClass Class = *(void *)(v28[1] + 24);
        uint64_t v17 = (void *)v30[3];
      }
      uint64_t v18 = v17;
      _Block_object_dispose(&v29, 8);
      id v19 = (void *)[[v18 alloc] initWithBundleIdentifier:@"com.apple.peoplesuggester.sharesheet" modelName:@"peoplesuggester-sharesheet-rewrite" versionId:v11 expirationPolicy:3 featuresDescription:v16];
      uint64_t v29 = 0;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x2050000000;
      uint64_t v20 = (void *)getAMLPipelineLoggerClass_softClass;
      uint64_t v32 = getAMLPipelineLoggerClass_softClass;
      if (!getAMLPipelineLoggerClass_softClass)
      {
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        uint64_t v26 = __getAMLPipelineLoggerClass_block_invoke;
        uint64_t v27 = &unk_1E5ADE858;
        uint64_t v28 = &v29;
        AeroMLLibraryCore();
        v30[3] = (uint64_t)objc_getClass("AMLPipelineLogger");
        getAMLPipelineLoggerClass_softClass Class = *(void *)(v28[1] + 24);
        uint64_t v20 = (void *)v30[3];
      }
      uint64_t v21 = v20;
      _Block_object_dispose(&v29, 8);
      uint64_t v22 = (void *)[[v21 alloc] initWithFeaturesConfiguration:v19];
      [(_PSEnsembleModel *)self setAmlPipelineLogger:v22];

      id v23 = +[_PSLogging rewriteChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1A314B000, v23, OS_LOG_TYPE_INFO, "_PSEnsemble: created AMLPipelineLogger object", (uint8_t *)&v24, 2u);
      }
    }
  }
  else
  {
    id v6 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      id v7 = "_PSEnsemble: pipeline checkpointing is disabled";
      goto LABEL_8;
    }
  }
}

- (void)logPipelineWithSuggestions:(id)a3 interactionsStatistics:(id)a4 pipelineStage:(id)a5 sessionID:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v27 = a4;
  id v28 = a5;
  id v29 = a6;
  id v10 = [(_PSEnsembleModel *)self amlPipelineLogger];

  if (v10)
  {
    id v33 = objc_opt_new();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = v30;
    uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v43 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v35 = [v37 groupName];
          if (v35)
          {
            id v11 = objc_alloc(MEMORY[0x1E4F28E78]);
            int v12 = [v37 groupName];
            uint64_t v13 = [v11 initWithString:v12];
          }
          else
          {
            int v12 = objc_opt_new();
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v14 = [v37 recipients];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v55 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v39;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v39 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                  uint64_t v51 = 0;
                  uint64_t v52 = &v51;
                  uint64_t v53 = 0x2050000000;
                  id v19 = (void *)getCNContactFormatterClass_softClass;
                  uint64_t v54 = getCNContactFormatterClass_softClass;
                  if (!getCNContactFormatterClass_softClass)
                  {
                    uint64_t v46 = MEMORY[0x1E4F143A8];
                    uint64_t v47 = 3221225472;
                    unint64_t v48 = __getCNContactFormatterClass_block_invoke;
                    long long v49 = &unk_1E5ADE858;
                    long long v50 = &v51;
                    ContactsLibraryCore_0();
                    Class Class = objc_getClass("CNContactFormatter");
                    *(void *)(v50[1] + 24) = Class;
                    getCNContactFormatterClass_softClass Class = *(void *)(v50[1] + 24);
                    id v19 = (void *)v52[3];
                  }
                  id v21 = v19;
                  _Block_object_dispose(&v51, 8);
                  uint64_t v22 = [v18 contact];
                  id v23 = [v21 stringFromContact:v22 style:0];

                  if (v23) {
                    [v12 addObject:v23];
                  }
                }
                uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v55 count:16];
              }
              while (v15);
            }

            if (![v12 count]) {
              [v12 addObject:@"unable_to_resolve"];
            }
            uint64_t v13 = _PASJoinStrings();
          }
          uint64_t v24 = (void *)v13;

          uint64_t v25 = [v37 conversationIdentifier];
          if (v25)
          {
            [v33 setObject:v24 forKeyedSubscript:v25];
          }
          else
          {
            uint64_t v26 = [v37 derivedIntentIdentifier];
            [v33 setObject:v24 forKeyedSubscript:v26];
          }
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
      }
      while (v34);
    }

    [(_PSEnsembleModel *)self logPipeline:v27 withPipelineStage:v28 andSessionID:v29 andCandidateNames:v33];
  }
}

- (void)logPipeline:(id)a3 withPipelineStage:(id)a4 andSessionID:(id)a5 andCandidateNames:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(_PSEnsembleModel *)self amlPipelineLogger];

  if (v14)
  {
    uint64_t v15 = [[_PSInteractionsStatisticsFeatureProvider alloc] initWithInteractionsStatistics:v10];
    uint64_t v16 = [(_PSInteractionsStatisticsFeatureProvider *)v15 mlFeatures];
    uint64_t v17 = (void *)v16;
    if (v13)
    {
      uint64_t v18 = objc_opt_new();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __81___PSEnsembleModel_logPipeline_withPipelineStage_andSessionID_andCandidateNames___block_invoke;
      v28[3] = &unk_1E5ADF2B0;
      id v29 = v13;
      id v19 = v18;
      id v30 = v19;
      [v17 enumerateKeysAndObjectsUsingBlock:v28];
      id v20 = v19;
    }
    else
    {
      id v20 = (id)v16;
    }
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2050000000;
    id v21 = (void *)getAMLFeaturesDonationMetadataClass_softClass;
    uint64_t v34 = getAMLFeaturesDonationMetadataClass_softClass;
    if (!getAMLFeaturesDonationMetadataClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v36 = __getAMLFeaturesDonationMetadataClass_block_invoke;
      uint64_t v37 = &unk_1E5ADE858;
      long long v38 = &v31;
      AeroMLLibraryCore();
      Class Class = objc_getClass("AMLFeaturesDonationMetadata");
      *(void *)(v38[1] + 24) = Class;
      getAMLFeaturesDonationMetadataClass_softClass Class = *(void *)(v38[1] + 24);
      id v21 = (void *)v32[3];
    }
    id v23 = v21;
    _Block_object_dispose(&v31, 8);
    uint64_t v24 = (void *)[[v23 alloc] initWithSessionId:v12 metadata:0];
    uint64_t v25 = [(_PSEnsembleModel *)self amlPipelineLogger];
    uint64_t v26 = [v25 logPipelineAsync:v11 features:v20 metadata:v24 async:1];

    id v27 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1A314B000, v27, OS_LOG_TYPE_INFO, "_PSEnsemble: pipeline logged at %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    uint64_t v15 = +[_PSLogging rewriteChannel];
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A314B000, &v15->super, OS_LOG_TYPE_INFO, "_PSEnsemble: pipeline checkpointing is disabled", (uint8_t *)&buf, 2u);
    }
  }
}

- (void)evaluateCandidates:(id)a3 psrMLModel:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_evaluateCandidates", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v8 = [v6 modelDescription];
  int64_t v9 = [v8 metadata];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F1E898]];

  id v11 = [v10 objectForKeyedSubscript:@"model_type"];
  LODWORD(v9) = [@"set" isEqual:v11];

  if (!v9)
  {
    id v23 = [v5 conversationIds];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_986;
    v58[3] = &unk_1E5ADEE20;
    id v59 = v5;
    id v60 = v6;
    [v23 enumerateObjectsUsingBlock:v58];

    id v24 = v59;
    goto LABEL_31;
  }
  id v12 = [v6 modelDescription];
  id v13 = [v12 inputDescriptionsByName];

  id v14 = [v13 objectForKeyedSubscript:@"features"];
  uint64_t v15 = [v14 multiArrayConstraint];

  uint64_t v16 = [v15 shape];
  uint64_t v17 = [v16 objectAtIndexedSubscript:0];
  uint64_t v57 = [v17 unsignedIntegerValue];

  uint64_t v18 = [v16 objectAtIndexedSubscript:1];
  uint64_t v48 = [v18 unsignedIntegerValue];

  uint64_t v19 = [v15 dataType];
  char v20 = 0;
  uint64_t v21 = 0;
  uint64_t v53 = v15;
  uint64_t v54 = v13;
  uint64_t v52 = v16;
  if (v19 > 65599)
  {
    if (v19 != 131104)
    {
      uint64_t v22 = 0;
      if (v19 == 65600)
      {
        char v20 = 1;
        uint64_t v22 = 6;
        uint64_t v21 = 8;
      }
      goto LABEL_15;
    }
    char v20 = 0;
    uint64_t v22 = 3;
    goto LABEL_14;
  }
  if (v19 == 65552)
  {
    uint64_t v22 = 0;
    char v20 = 1;
    uint64_t v21 = 2;
  }
  else
  {
    uint64_t v22 = 0;
    if (v19 == 65568)
    {
      char v20 = 1;
      uint64_t v22 = 5;
LABEL_14:
      uint64_t v21 = 4;
    }
  }
LABEL_15:
  uint64_t v49 = v22;
  uint64_t v50 = v21;
  char v51 = v20;
  uint64_t v56 = v5;
  uint64_t v25 = [v10 objectForKeyedSubscript:@"feature_order"];
  uint64_t v26 = (void *)MEMORY[0x1A6243860]();
  id v27 = (void *)MEMORY[0x1E4F28D90];
  id v28 = [v25 dataUsingEncoding:4];
  id v79 = 0;
  id v29 = [v27 JSONObjectWithData:v28 options:8 error:&v79];
  id v30 = v79;

  uint64_t v31 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if (!v29) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Failed to parse JSON feature order: %@ (json: %@)", v30, v25 format];
  }
  uint64_t v47 = v30;
  v55 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*v31, @"Expected array, got %@ for feature order json %@", objc_opt_class(), v25 format];
  }
  id v32 = v29;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v75 objects:v82 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v76;
    uint64_t v36 = *v31;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v76 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v38 = *(void *)(*((void *)&v75 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:v36, @"Array member %@ is of unexpected type %@ (expected NSString), json %@", v38, objc_opt_class(), v25, v47 format];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v75 objects:v82 count:16];
    }
    while (v34);
  }

  if ([v32 count] != v48) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"shape feature count %tu must be equal to feature order count %tu, feature order: %@", v48, objc_msgSend(v32, "count"), v32 format];
  }
  uint64_t v39 = [NSNumber numberWithUnsignedLong:v50 * v48];
  v81[0] = v39;
  v81[1] = &unk_1EF674E68;
  long long v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];

  id v5 = v56;
  long long v41 = [v56 conversationIds];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke;
  v61[3] = &unk_1E5ADF2F8;
  uint64_t v71 = v48 * v57;
  uint64_t v72 = v50;
  id v62 = v32;
  char v74 = v51;
  id v63 = v56;
  id v64 = v52;
  id v65 = v53;
  id v66 = v40;
  id v67 = v54;
  uint64_t v68 = @"count";
  uint64_t v73 = v49;
  long long v69 = @"features";
  id v70 = v6;
  id v42 = v32;
  id v43 = v52;
  id v44 = v53;
  id v45 = v40;
  id v24 = v54;
  objc_msgSend(v41, "_pas_enumerateChunksOfSize:usingBlock:", v57, v61);

  id v10 = v55;
LABEL_31:

  uint64_t v46 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v46))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v46, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_evaluateCandidates", (const char *)&unk_1A3274816, buf, 2u);
  }
}

- (id)getSuggestionsFromInteractionsStatistics:(id)a3 withConfig:(id)a4 trialClient:(id)a5 andPredictionContext:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = +[_PSLogging rewriteChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 featureNamesToSortWith];
    *(_DWORD *)long long buf = 138412290;
    id v36 = v10;
    _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: sorting candidates using %@", buf, 0xCu);
  }
  id v11 = [v7 conversationIds];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke;
  v32[3] = &unk_1E5ADF320;
  id v12 = v8;
  id v33 = v12;
  id v13 = v7;
  id v34 = v13;
  id v14 = [v11 sortedArrayUsingComparator:v32];

  uint64_t v15 = +[_PSLogging rewriteChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v36 = v14;
    _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: ranked candidates %@", buf, 0xCu);
  }

  uint64_t v16 = objc_opt_new();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke_991;
  v28[3] = &unk_1E5ADF348;
  id v17 = v12;
  id v29 = v17;
  id v18 = v13;
  id v30 = v18;
  id v19 = v16;
  id v31 = v19;
  [v14 enumerateObjectsUsingBlock:v28];
  char v20 = +[_PSLogging rewriteChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138477827;
    id v36 = v19;
    _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: suggestions proxies found %{private}@", buf, 0xCu);
  }

  uint64_t v21 = +[_PSLogging rewriteChannel];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke_998;
    v26[3] = &unk_1E5ADF370;
    id v27 = v18;
    uint64_t v22 = objc_msgSend(v19, "_pas_mappedArrayWithTransform:", v26);
    *(_DWORD *)long long buf = 138412290;
    id v36 = v22;
    _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: <anonymised> suggestions proxies found %@", buf, 0xCu);
  }
  id v23 = v31;
  id v24 = v19;

  return v24;
}

+ (id)orderedSuggestionProxiesWithProxyOrder:(id)a3 suggestionProxies:(id)a4 suggestionsWithSharePlayAddedBlock:(id)a5
{
  v42[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v29 = (void (**)(id, NSObject *))a5;
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v42[0] = @"SuggestionProxyTypeInCall";
  v42[1] = @"SuggestionProxyTypeReturnToSender";
  v42[2] = @"SuggestionProxyTypePASS";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
  id v11 = (void *)[v9 initWithArray:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v41[0] = @"SuggestionProxyTypeHyperRecencyRewrite";
  v41[1] = @"SuggestionProxyTypeHyperRecencyIncomingRewrite";
  v41[2] = @"SuggestionProxyTypeFrequencyOfTopDomainURL";
  v41[3] = @"SuggestionProxyTypeFrequencyOfSharesFromCurrentApp";
  v41[4] = @"SuggestionProxyTypeFrequencyOfShares";
  v41[5] = @"SuggestionProxyTypeFromStats";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:6];
  id v31 = (void *)[v12 initWithArray:v13];

  id v30 = (id)objc_opt_new();
  id v14 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v33;
    *(void *)&long long v17 = 138543618;
    long long v28 = v17;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * v20);
        if (objc_msgSend(v14, "containsObject:", v21, v28))
        {
          uint64_t v22 = +[_PSLogging rewriteChannel];
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            goto LABEL_17;
          }
          *(_DWORD *)long long buf = v28;
          uint64_t v37 = v21;
          __int16 v38 = 2114;
          id v39 = v15;
          id v23 = v22;
          id v24 = "_PSEnsemble: found duplicate proxy key, skipping '%{public}@' in list %{public}@";
          goto LABEL_9;
        }
        [v14 addObject:v21];
        if ([v11 containsObject:v21])
        {
          uint64_t v22 = [v8 objectForKeyedSubscript:v21];
          if (v22) {
            [v30 addObjectsFromArray:v22];
          }
        }
        else if ([v31 containsObject:v21])
        {
          uint64_t v22 = [v8 objectForKeyedSubscript:v21];
          if (v22)
          {
            uint64_t v25 = v29[2](v29, v22);
            [v30 addObjectsFromArray:v25];
          }
        }
        else
        {
          uint64_t v22 = +[_PSLogging rewriteChannel];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = v28;
            uint64_t v37 = v21;
            __int16 v38 = 2114;
            id v39 = v15;
            id v23 = v22;
            id v24 = "_PSEnsemble: found unsupported proxy key '%{public}@' in list %{public}@";
LABEL_9:
            _os_log_fault_impl(&dword_1A314B000, v23, OS_LOG_TYPE_FAULT, v24, buf, 0x16u);
          }
        }
LABEL_17:

        ++v20;
      }
      while (v18 != v20);
      uint64_t v26 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
      uint64_t v18 = v26;
    }
    while (v26);
  }

  return v30;
}

- (id)finalSuggestionProxiesForInteractionStatistics:(id)a3 config:(id)a4 trialClient:(id)a5 context:(id)a6
{
  v51[9] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v43 = [(_PSEnsembleModel *)self getSuggestionsFromInteractionsStatistics:v10 withConfig:a4 trialClient:v12 andPredictionContext:v11];
  id v13 = [(_PSEnsembleModel *)self heuristics];
  id v14 = [(_PSEnsembleModel *)self fetchSupportedBundleIDsWithPredictionContextFilters:v11];
  uint64_t v46 = [v13 inPhoneCallHeuristicSuggestionProxiesWithBundleIds:v14 predictionContext:v11];

  id v15 = [(_PSEnsembleModel *)self heuristics];
  id v44 = [v15 returnDocumentToSender:v11];

  uint64_t v16 = [(_PSEnsembleModel *)self heuristics];
  id v45 = [v16 peopleAwareSuggestionProxiesForInteractionStatistics:v10];

  long long v17 = [(_PSEnsembleModel *)self heuristics];
  uint64_t v18 = [v17 hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:v10];

  uint64_t v19 = [(_PSEnsembleModel *)self heuristics];
  uint64_t v20 = [v19 hyperRecentHeuristicIncomingSuggestionProxiesForInteractionStatistics:v10];

  uint64_t v21 = [(_PSEnsembleModel *)self heuristics];
  uint64_t v22 = [v21 pastSharesWithCurrentAppAwareSuggestionProxiesForInteractionStatistics:v10];

  id v23 = [(_PSEnsembleModel *)self heuristics];
  id v24 = [v23 pastSharesAwareSuggestionProxiesForInteractionStatistics:v10];

  uint64_t v25 = [(_PSEnsembleModel *)self heuristics];
  uint64_t v26 = [v25 pastSharesOfTopDomainURLAwareSuggestionProxiesForInteractionStatistics:v10];

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __94___PSEnsembleModel_finalSuggestionProxiesForInteractionStatistics_config_trialClient_context___block_invoke;
  v47[3] = &unk_1E5ADF398;
  id v48 = v11;
  id v49 = v10;
  id v42 = v10;
  id v41 = v11;
  id v27 = (void *)MEMORY[0x1A6243AD0](v47);
  long long v28 = [v12 suggestionProxyOrder];

  id v29 = v46;
  if (!v46) {
    id v29 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v50[0] = @"SuggestionProxyTypeInCall";
  v50[1] = @"SuggestionProxyTypeReturnToSender";
  id v30 = v44;
  if (!v44) {
    id v30 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v51[0] = v29;
  v51[1] = v30;
  if (v18) {
    id v31 = v18;
  }
  else {
    id v31 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v50[2] = @"SuggestionProxyTypeHyperRecencyRewrite";
  v50[3] = @"SuggestionProxyTypeHyperRecencyIncomingRewrite";
  if (v20) {
    long long v32 = v20;
  }
  else {
    long long v32 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v51[2] = v31;
  v51[3] = v32;
  long long v33 = v45;
  if (!v45) {
    long long v33 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v50[4] = @"SuggestionProxyTypePASS";
  v50[5] = @"SuggestionProxyTypeFrequencyOfTopDomainURL";
  if (v26) {
    long long v34 = v26;
  }
  else {
    long long v34 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v51[4] = v33;
  v51[5] = v34;
  if (v22) {
    long long v35 = v22;
  }
  else {
    long long v35 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v50[6] = @"SuggestionProxyTypeFrequencyOfSharesFromCurrentApp";
  v50[7] = @"SuggestionProxyTypeFrequencyOfShares";
  if (v24) {
    id v36 = v24;
  }
  else {
    id v36 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v51[6] = v35;
  v51[7] = v36;
  v50[8] = @"SuggestionProxyTypeFromStats";
  if (v43) {
    uint64_t v37 = v43;
  }
  else {
    uint64_t v37 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v51[8] = v37;
  __int16 v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:9];
  id v39 = [(id)objc_opt_class() orderedSuggestionProxiesWithProxyOrder:v28 suggestionProxies:v38 suggestionsWithSharePlayAddedBlock:v27];

  return v39;
}

- (id)deviceIdentifier
{
  return [(_PSFeatureCache *)self->_featureCache deviceIdentifier];
}

- (id)trialIdentifier
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(_PSEnsembleModel *)self trialExperimentId];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"Missing";
  }
  [v3 setTask:v6];

  uint64_t v7 = [(_PSEnsembleModel *)self trialTreatmentId];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = @"Missing";
  }
  [v3 setTreatment:v9];

  uint64_t v10 = [(_PSEnsembleModel *)self trialDeploymentId];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = @"Missing";
  }
  [v3 setDeployment:v12];

  return v3;
}

- (void)sendDataToPETAsync:(id)a3 withConfig:(id)a4 andContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61___PSEnsembleModel_sendDataToPETAsync_withConfig_andContext___block_invoke;
  v15[3] = &unk_1E5ADF3C0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (id)getPETMessageFrom:(id)a3 withConfig:(id)a4 andContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_sendDataToPET", " enableTelemetry=YES ", buf, 2u);
  }

  id v12 = [_PSPETMessageBuilder alloc];
  id v13 = [(_PSEnsembleModel *)self deviceIdentifier];
  id v14 = [(_PSEnsembleModel *)self trialIdentifier];
  id v15 = [(_PSEnsembleModel *)self peopleSuggesterDefaults];
  id v16 = [(_PSPETMessageBuilder *)v12 initWithInteractionsStatistics:v10 andConfig:v9 andContext:v8 andDeviceIdentifier:v13 andTrialIdentifier:v14 andDefaults:v15];

  id v17 = [(_PSPETMessageBuilder *)v16 getPETMessage];
  id v18 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_sendDataToPET", (const char *)&unk_1A3274816, v20, 2u);
  }

  return v17;
}

- (void)enrichConfig:(id)a3 withInformationFromPredictionContext:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = [v5 bundleID];
  [v10 setBundleId:v6];

  uint64_t v7 = [v5 attachments];

  id v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_1012);

  if (v8 && [v8 count])
  {
    id v9 = [v8 firstObject];
    [v10 setTopDomainURL:v9];
  }
}

- (void)psrDataCollectionForContext:(id)a3 timeToWaitInSeconds:(int)a4 maxComputationTime:(double)a5 withConfigAndStatsBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasOnceToken291 != -1) {
    dispatch_once(&psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasOnceToken291, &__block_literal_global_1014);
  }
  id v12 = (id)psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasExprOnceResult;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_2;
  v17[3] = &unk_1E5ADF480;
  id v13 = v11;
  id v20 = v13;
  id v14 = v10;
  double v21 = a5;
  id v18 = v14;
  uint64_t v19 = self;
  int v22 = a4;
  id v15 = (void (**)(void))MEMORY[0x1A6243AD0](v17);
  id v16 = v15;
  if (a4 < 1) {
    v15[2](v15);
  }
  else {
    dispatch_async(v12, v15);
  }
}

- (void)setInteractionStore:(id)a3
{
}

- (void)setKnowledgeStore:(id)a3
{
}

- (PPTopicStore)topicStore
{
  return self->_topicStore;
}

- (void)setTopicStore:(id)a3
{
}

- (PPContactStore)portraitContactStore
{
  return self->_portraitContactStore;
}

- (void)setPortraitContactStore:(id)a3
{
}

- (_CDInteractionCache)messageInteractionCache
{
  return (_CDInteractionCache *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMessageInteractionCache:(id)a3
{
}

- (_CDInteractionCache)shareInteractionCache
{
  return (_CDInteractionCache *)objc_getProperty(self, a2, 88, 1);
}

- (void)setShareInteractionCache:(id)a3
{
}

- (_CDInteractionCache)allOtherInteractionCache
{
  return (_CDInteractionCache *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAllOtherInteractionCache:(id)a3
{
}

- (void)setPeopleSuggesterDefaults:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (void)setDefaultContactKeysToFetch:(id)a3
{
}

- (NSString)trialID
{
  return self->_trialID;
}

- (void)setTrialID:(id)a3
{
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (NSArray)shareSheetMechanisms
{
  return self->_shareSheetMechanisms;
}

- (void)setShareSheetMechanisms:(id)a3
{
}

- (NSArray)messageDirections
{
  return self->_messageDirections;
}

- (void)setMessageDirections:(id)a3
{
}

- (NSNumber)messageMechanism
{
  return self->_messageMechanism;
}

- (void)setMessageMechanism:(id)a3
{
}

- (NSArray)allOtherInteractionCacheMechanism
{
  return self->_allOtherInteractionCacheMechanism;
}

- (void)setAllOtherInteractionCacheMechanism:(id)a3
{
}

- (NSArray)allOtherInteractionCacheDirections
{
  return self->_allOtherInteractionCacheDirections;
}

- (void)setAllOtherInteractionCacheDirections:(id)a3
{
}

- (NSNumber)maxCandidatesFromShareSheetCache
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMaxCandidatesFromShareSheetCache:(id)a3
{
}

- (NSNumber)maxCandidatesFromMessageCache
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMaxCandidatesFromMessageCache:(id)a3
{
}

- (_PSCoreMLScoringModel)coreMLScoringModel
{
  return (_PSCoreMLScoringModel *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCoreMLScoringModel:(id)a3
{
}

- (_PSRuleMiningModel)ruleMiningModel
{
  return (_PSRuleMiningModel *)objc_getProperty(self, a2, 224, 1);
}

- (void)setRuleMiningModel:(id)a3
{
}

- (_PSSharingContactRankerModel)sharingContactRankerModel
{
  return (_PSSharingContactRankerModel *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSharingContactRankerModel:(id)a3
{
}

- (_PSConfidenceModelForSharing)confidenceModelForSharing
{
  return (_PSConfidenceModelForSharing *)objc_getProperty(self, a2, 240, 1);
}

- (void)setConfidenceModelForSharing:(id)a3
{
}

- (BOOL)PSConfidenceModelInUse
{
  return self->_PSConfidenceModelInUse;
}

- (void)setPSConfidenceModelInUse:(BOOL)a3
{
  self->_PSConfidenceModelInUse = a3;
}

- (BOOL)useSyntheticSharingInteractions
{
  return self->_useSyntheticSharingInteractions;
}

- (void)setUseSyntheticSharingInteractions:(BOOL)a3
{
  self->_useSyntheticSharingInteractions = a3;
}

- (_PSKNNModel)knnModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 248, 1);
}

- (void)setKnnModel:(id)a3
{
}

- (_PSKNNModel)knnMapsModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 256, 1);
}

- (void)setKnnMapsModel:(id)a3
{
}

- (_PSKNNModel)knnZkwModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 264, 1);
}

- (void)setKnnZkwModel:(id)a3
{
}

- (_PSKNNModel)knnNameOrContactRankerModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 272, 1);
}

- (void)setKnnNameOrContactRankerModel:(id)a3
{
}

- (_PSKNNModel)knnSiriNLContactRankerModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 280, 1);
}

- (void)setKnnSiriNLContactRankerModel:(id)a3
{
}

- (_PSHeuristics)heuristics
{
  return (_PSHeuristics *)objc_getProperty(self, a2, 288, 1);
}

- (void)setHeuristics:(id)a3
{
}

- (_PSInteractionAndContactMonitor)contactMonitor
{
  return self->_contactMonitor;
}

- (void)setContactMonitor:(id)a3
{
}

- (NSSet)cachedSupportedBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 304, 1);
}

- (void)setCachedSupportedBundleIDs:(id)a3
{
}

- (_PSContactResolver)contactResolver
{
  return (_PSContactResolver *)objc_getProperty(self, a2, 312, 1);
}

- (void)setContactResolver:(id)a3
{
}

- (_PSFTZKWOrchestrator)zkwFTOrchestrator
{
  return self->_zkwFTOrchestrator;
}

- (void)setZkwFTOrchestrator:(id)a3
{
}

- (_PSFTZKWTrialData)zkwFTTrialData
{
  return self->_zkwFTTrialData;
}

- (void)setZkwFTTrialData:(id)a3
{
}

- (BOOL)allowNonSupportedBundleIDs
{
  return self->_allowNonSupportedBundleIDs;
}

- (void)setAllowNonSupportedBundleIDs:(BOOL)a3
{
  self->_allowNonSupportedBundleIDs = a3;
}

- (NSDictionary)psConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 336, 1);
}

- (void)setPsConfig:(id)a3
{
}

- (NSDictionary)psConfigForAdaptableModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 344, 1);
}

- (void)setPsConfigForAdaptableModel:(id)a3
{
}

- (TRIClient)trialClient
{
  return (TRIClient *)objc_getProperty(self, a2, 352, 1);
}

- (void)setTrialClient:(id)a3
{
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 360, 1);
}

- (void)setTrialTrackingID:(id)a3
{
}

- (AMLPipelineLogger)amlPipelineLogger
{
  return (AMLPipelineLogger *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAmlPipelineLogger:(id)a3
{
}

- (BOOL)enablePipelineCheckpointing
{
  return self->_enablePipelineCheckpointing;
}

- (void)setEnablePipelineCheckpointing:(BOOL)a3
{
  self->_enablePipelineCheckpointing = a3;
}

- (NSString)traceId
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setTraceId:(id)a3
{
}

- (NSString)currentSpanId
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCurrentSpanId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSpanId, 0);
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_amlPipelineLogger, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_psConfigForAdaptableModel, 0);
  objc_storeStrong((id *)&self->_psConfig, 0);
  objc_storeStrong((id *)&self->_zkwFTTrialData, 0);
  objc_storeStrong((id *)&self->_zkwFTOrchestrator, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_cachedSupportedBundleIDs, 0);
  objc_storeStrong((id *)&self->_contactMonitor, 0);
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_knnSiriNLContactRankerModel, 0);
  objc_storeStrong((id *)&self->_knnNameOrContactRankerModel, 0);
  objc_storeStrong((id *)&self->_knnZkwModel, 0);
  objc_storeStrong((id *)&self->_knnMapsModel, 0);
  objc_storeStrong((id *)&self->_knnModel, 0);
  objc_storeStrong((id *)&self->_confidenceModelForSharing, 0);
  objc_storeStrong((id *)&self->_sharingContactRankerModel, 0);
  objc_storeStrong((id *)&self->_ruleMiningModel, 0);
  objc_storeStrong((id *)&self->_coreMLScoringModel, 0);
  objc_storeStrong((id *)&self->_maxCandidatesFromMessageCache, 0);
  objc_storeStrong((id *)&self->_maxCandidatesFromShareSheetCache, 0);
  objc_storeStrong((id *)&self->_allOtherInteractionCacheDirections, 0);
  objc_storeStrong((id *)&self->_allOtherInteractionCacheMechanism, 0);
  objc_storeStrong((id *)&self->_messageMechanism, 0);
  objc_storeStrong((id *)&self->_messageDirections, 0);
  objc_storeStrong((id *)&self->_shareSheetMechanisms, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialID, 0);
  objc_storeStrong((id *)&self->_defaultContactKeysToFetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_peopleSuggesterDefaults, 0);
  objc_storeStrong((id *)&self->_allOtherInteractionCache, 0);
  objc_storeStrong((id *)&self->_shareInteractionCache, 0);
  objc_storeStrong((id *)&self->_messageInteractionCache, 0);
  objc_storeStrong((id *)&self->_portraitContactStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_featureCache, 0);
}

- (void)loadPSConfigPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "Trial: failed to load trial config with path:%@, with error：%@");
}

- (void)copyRemoteRuleMinerMLModel:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Remote ML model load attempted with null path", v2, v3, v4, v5, v6);
}

- (void)getLatestTrialMLModelVersion
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "Failed to load trial model with compiled model path: %@ with error: %@");
}

- (void)getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction Heuristic - Return to Sender", v2, v3, v4, v5, v6);
}

- (void)getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction Heuristic - In-Call", v2, v3, v4, v5, v6);
}

- (void)getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction Heuristic - Hyper-Recency", v2, v3, v4, v5, v6);
}

- (void)getRuleMiningSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction - Corebehavior", v2, v3, v4, v5, v6);
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction - kNN based on interactions", v2, v3, v4, v5, v6);
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction - kNN based on top shares, filtering out nonMatchingSourceApps", v2, v3, v4, v5, v6);
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction - kNN based on all shares, filtering out nonMatchingSourceApps", v2, v3, v4, v5, v6);
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction - kNN based on top shares", v2, v3, v4, v5, v6);
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction - kNN based on all shares", v2, v3, v4, v5, v6);
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction - kNN", v2, v3, v4, v5, v6);
}

- (void)getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0(&dword_1A314B000, v0, v1, "Prediction - %@", v2);
}

- (void)getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Prediction - ContactRankerModel", v2, v3, v4, v5, v6);
}

- (void)getModelSuggestionsProxyDictWithModelProxiesArray:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_pas_componentsJoinedByString:", @",");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Model proxies array: %@", v4, v5, v6, v7, v8);
}

- (void)getMeContactIdentifier
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0(&dword_1A314B000, v0, v1, "Error fetching isMe from contacts: %@", v2);
}

- (void)predictWithPredictionContext:maxSuggestions:contactKeysToFetch:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0(&dword_1A314B000, v0, v1, "_PSEnsemble: Candidate Features with additional features %{private}@", v2);
}

- (void)predictWithPredictionContext:(void *)a1 maxSuggestions:contactKeysToFetch:.cold.2(void *a1)
{
  uint64_t v1 = [a1 conversationIds];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "_PSEnsemble: Candidates after pruning %{private}@", v4, v5, v6, v7, v8);
}

- (void)predictWithPredictionContext:maxSuggestions:contactKeysToFetch:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0(&dword_1A314B000, v0, v1, "_PSEnsemble: InteractionStatistics Candidates with Features %{private}@", v2);
}

- (void)predictWithPredictionContext:(void *)a1 maxSuggestions:contactKeysToFetch:.cold.4(void *a1)
{
  uint64_t v1 = [a1 conversationIds];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "_PSEnsemble: InteractionStatistics Candidates %{private}@", v4, v5, v6, v7, v8);
}

- (void)predictWithPredictionContext:maxSuggestions:contactKeysToFetch:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "Event is nil when trying to record people inference", v2, v3, v4, v5, v6);
}

- (void)predictWithPredictionContext:maxSuggestions:contactKeysToFetch:.cold.6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "no sessionID", v2, v3, v4, v5, v6);
}

- (void)predictWithPredictionContext:(void *)a1 maxSuggestions:(uint64_t)a2 contactKeysToFetch:(NSObject *)a3 .cold.7(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = a1;
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = v5;
  _os_log_debug_impl(&dword_1A314B000, a3, OS_LOG_TYPE_DEBUG, "Model proxies array: %@", (uint8_t *)a2, 0xCu);
}

- (void)modelProxyToVirtualFeatureStoreFeature:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9_0(&dword_1A314B000, v0, v1, "Unknown model Proxy key: %@", v2, v3, v4, v5, v6);
}

+ (void)_suggestionInteractionPredicatesForFirstPartyMessages:(void *)a1 bundleID:(NSObject *)a2 interactionRecipients:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "_pas_componentsJoinedByString:", @", ");
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "_suggestionInteractionPredicates returning @[] because %{public}@ is nil", v4, 0xCu);
}

- (void)suggestionsFromSuggestionProxies:(void *)a1 supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:.cold.1(void *a1)
{
  uint64_t v1 = [a1 trialID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Updated all suggestions with trialID: %@", v4, v5, v6, v7, v8);
}

- (void)suggestionsFromSuggestionProxies:(os_log_t)log supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "Attempting to resolve group name or display image", buf, 2u);
}

- (void)predictWithMapsPredictionContext:maxSuggestions:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Maps ShareETA error fetching isMe from contacts: %@", v2, v3, v4, v5, v6);
}

- (void)rerankMapsSuggestions:(uint8_t *)buf usingPredictionContext:(unsigned char *)a2 contactResolver:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "Rerank Maps Suggestions: While resolving seeded contact Ids, contact is nil", buf, 2u);
}

- (void)_knnZKWSuggestionsWithPredictionContext:(void *)a1 modelConfiguration:maxSuggestions:.cold.1(void *a1)
{
  uint64_t v1 = [a1 trialID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Updated all suggestions with trialID: %@", v4, v5, v6, v7, v8);
}

- (void)_knnZKWSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "about to do upateTrialID for zkw suggestions", v2, v3, v4, v5, v6);
}

- (void)appExtensionSuggestionsFromContext:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "App suggestion inference event item is nil", v2, v3, v4, v5, v6);
}

@end