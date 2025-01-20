@interface _PSRuleOverlapFeedback
- (BMBehaviorRetriever)behaviorRetriever;
- (BOOL)targetAppPredictedCorrectlyByRule:(id)a3 bundleId:(id)a4;
- (BOOL)wasInteractionAmongSuggestLess:(id)a3;
- (CNContactStore)contactStore;
- (NSUserDefaults)ruleOverlapFeedbackDefaults;
- (_CDInteractionStore)interactionStore;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSConfidenceModelForSharing)confidenceModelForSharing;
- (_PSRuleOverlapFeedback)init;
- (_PSRuleRankingMLModel)ruleRankingModel;
- (id)constantFeaturesFromContextItems:(id)a3;
- (id)constantPETFeaturesFromContextItems:(id)a3;
- (id)contextItemsFromEvent:(id)a3;
- (id)feedbackPETPayloadForRule:(id)a3 ForInteraction:(id)a4 ForContextItems:(id)a5 WithConstantFeatures:(id)a6;
- (id)feedbackPayloadForRule:(id)a3 ForInteraction:(id)a4 ForContextItems:(id)a5 WithConstantFeatures:(id)a6;
- (id)getSessionID;
- (id)interactionStoreEventsSinceDate:(id)a3;
- (id)loggingTrainDataForContactFillerModel:(id)a3 withMatchingInteraction:(id)a4 interactionRecipients:(id)a5 ruleRankingModel:(id)a6 contactPropertyCache:(id)a7 interactionCache:(id)a8;
- (id)matchFeedbackEvent:(id)a3 WithInteractions:(id)a4;
- (id)sharesheetFeedbackEventsSinceDate:(id)a3;
- (int)bucketedValue:(int)a3;
- (void)loggingForKnowledgeStoreEvent:(id)a3 WithMatchingInteraction:(id)a4;
- (void)modelAccuracyLogging:(id)a3 WithMatchingInteraction:(id)a4;
- (void)reviewLastDayOfShares;
- (void)scoreRanking:(int64_t)a3 forModelKey:(id)a4;
- (void)setConfidenceModelForSharing:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setInteractionStore:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setRuleOverlapFeedbackDefaults:(id)a3;
- (void)setRuleRankingModel:(id)a3;
- (void)writeRecordObjcWithData:(id)a3;
@end

@implementation _PSRuleOverlapFeedback

- (_PSRuleOverlapFeedback)init
{
  v23.receiver = self;
  v23.super_class = (Class)_PSRuleOverlapFeedback;
  v2 = [(_PSRuleOverlapFeedback *)&v23 init];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v3 = (void *)getBMBehaviorRetrieverClass_softClass_0;
  uint64_t v32 = getBMBehaviorRetrieverClass_softClass_0;
  if (!getBMBehaviorRetrieverClass_softClass_0)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getBMBehaviorRetrieverClass_block_invoke_0;
    v27 = &unk_1E5ADE858;
    v28 = &v29;
    BehaviorMinerLibraryCore_0();
    Class Class = objc_getClass("BMBehaviorRetriever");
    *(void *)(v28[1] + 24) = Class;
    getBMBehaviorRetrieverClass_softClass_0 = *(void *)(v28[1] + 24);
    v3 = (void *)v30[3];
  }
  v5 = v3;
  _Block_object_dispose(&v29, 8);
  v6 = (BMBehaviorRetriever *)objc_alloc_init(v5);
  behaviorRetriever = v2->_behaviorRetriever;
  v2->_behaviorRetriever = v6;

  v8 = (void *)MEMORY[0x1E4F5B400];
  v9 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
  uint64_t v10 = [v8 storeWithDirectory:v9 readOnly:1];
  interactionStore = v2->_interactionStore;
  v2->_interactionStore = (_CDInteractionStore *)v10;

  uint64_t v12 = [MEMORY[0x1E4F5B560] knowledgeStore];
  knowledgeStore = v2->_knowledgeStore;
  v2->_knowledgeStore = (_DKKnowledgeQuerying *)v12;

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v14 = (void *)getCNContactStoreClass_softClass_6;
  uint64_t v32 = getCNContactStoreClass_softClass_6;
  if (!getCNContactStoreClass_softClass_6)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getCNContactStoreClass_block_invoke_6;
    v27 = &unk_1E5ADE858;
    v28 = &v29;
    __getCNContactStoreClass_block_invoke_6((uint64_t)&v24);
    v14 = (void *)v30[3];
  }
  v15 = v14;
  _Block_object_dispose(&v29, 8);
  v16 = (CNContactStore *)objc_alloc_init(v15);
  contactStore = v2->_contactStore;
  v2->_contactStore = v16;

  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBehaviorRuleFeedback"];
  ruleOverlapFeedbackDefaults = v2->_ruleOverlapFeedbackDefaults;
  v2->_ruleOverlapFeedbackDefaults = (NSUserDefaults *)v18;

  v20 = objc_alloc_init(_PSConfidenceModelForSharing);
  confidenceModelForSharing = v2->_confidenceModelForSharing;
  v2->_confidenceModelForSharing = v20;

  return v2;
}

- (void)writeRecordObjcWithData:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v4 = (void *)getDESRecordStoreClass_softClass;
  uint64_t v11 = getDESRecordStoreClass_softClass;
  if (!getDESRecordStoreClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getDESRecordStoreClass_block_invoke;
    v7[3] = &unk_1E5ADE858;
    v7[4] = &v8;
    __getDESRecordStoreClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);
  v6 = (void *)[[v5 alloc] initWithBundleIdentifier:@"com.apple.PeopleSuggester.ProactiveShareSheetLighthousePFLPlugin"];
  [v6 saveRecordWithData:v3 recordInfo:&unk_1EF6768B8 completion:&__block_literal_global_32];
}

- (void)reviewLastDayOfShares
{
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "Initiating rule overlap logging.", v1, 2u);
}

- (id)getSessionID
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  if (os_variant_has_internal_content())
  {
    uint64_t v4 = [(NSUserDefaults *)self->_ruleOverlapFeedbackDefaults objectForKey:@"SessionId"];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(NSUserDefaults *)self->_ruleOverlapFeedbackDefaults objectForKey:@"SessionIdDate"];
      v7 = [v3 dateByAddingTimeInterval:-7776000.0];
      if ([v6 compare:v7] == -1)
      {
        uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v9 = [v8 UUIDString];

        [(NSUserDefaults *)self->_ruleOverlapFeedbackDefaults setObject:v9 forKey:@"SessionId"];
        [(NSUserDefaults *)self->_ruleOverlapFeedbackDefaults setObject:v3 forKey:@"SessionIdDate"];
        v5 = (void *)v9;
      }
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
      v5 = [v10 UUIDString];

      [(NSUserDefaults *)self->_ruleOverlapFeedbackDefaults setObject:v5 forKey:@"SessionId"];
      [(NSUserDefaults *)self->_ruleOverlapFeedbackDefaults setObject:v3 forKey:@"SessionIdDate"];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)matchFeedbackEvent:(id)a3 WithInteractions:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v24 = [v5 endDate];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v23 = 0;
    uint64_t v10 = *(void *)v26;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v14 = objc_msgSend(v5, "source", v23);
        v15 = [v14 bundleID];
        v16 = [v13 bundleId];
        int v17 = [v15 isEqualToString:v16];

        if (v17)
        {
          uint64_t v18 = [v13 endDate];
          [v18 timeIntervalSinceDate:v24];
          if (v19 >= 0.0)
          {
            double v20 = v19;
            if (v19 <= 180.0 && (!v23 || v19 < v11))
            {
              id v21 = v13;

              double v11 = v20;
              id v23 = v21;
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)loggingTrainDataForContactFillerModel:(id)a3 withMatchingInteraction:(id)a4 interactionRecipients:(id)a5 ruleRankingModel:(id)a6 contactPropertyCache:(id)a7 interactionCache:(id)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v56 = a4;
  id v15 = a5;
  id v48 = a6;
  id v54 = a7;
  id v53 = a8;
  v16 = objc_alloc_init(CAPContactFillerShareEvent);
  int v17 = objc_alloc_init(CAPContactFillerUserEvent);
  [(CAPContactFillerShareEvent *)v16 setUserEvent:v17];

  uint64_t v18 = objc_alloc_init(_PSContactFillerNormalizationConstants);
  double v19 = (void **)&off_1E5ADE000;
  double v20 = [(_PSRuleOverlapFeedback *)self interactionStore];
  +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:v20 normConstants:v18];

  v55 = v16;
  id v21 = [(CAPContactFillerShareEvent *)v16 userEvent];
  v22 = [(_PSRuleOverlapFeedback *)self behaviorRetriever];
  v52 = v18;
  +[_PSContactFillerDataCollectionUtilities extractUserFeaturesIntoPETMessage:v21 normConstants:v18 behaviorRetriever:v22];

  uint64_t v23 = [(_PSRuleOverlapFeedback *)self contextItemsFromEvent:v14];
  v51 = self;
  uint64_t v24 = [(_PSRuleOverlapFeedback *)self behaviorRetriever];
  v47 = (void *)v23;
  v57 = +[_PSContactFillerDataCollectionUtilities getBehaviorRulesGivenContext:v23 behaviorRetriever:v24];

  long long v25 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[_PSRuleOverlapFeedback loggingTrainDataForContactFillerModel:withMatchingInteraction:interactionRecipients:ruleRankingModel:contactPropertyCache:interactionCache:](v57);
  }

  long long v26 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[_PSRuleOverlapFeedback loggingTrainDataForContactFillerModel:withMatchingInteraction:interactionRecipients:ruleRankingModel:contactPropertyCache:interactionCache:](v15);
  }

  v46 = v14;
  long long v27 = +[_PSContactFillerDataCollectionUtilities getInteractionModelScoreForEvent:v14 forInteractionRecipients:v15];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v15;
  uint64_t v58 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v58)
  {
    uint64_t v49 = *(void *)v62;
    v50 = v27;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v62 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v28;
        uint64_t v29 = *(void *)(*((void *)&v61 + 1) + 8 * v28);
        uint64_t v30 = objc_alloc_init(CAPContactFillerContactEvent);
        uint64_t v31 = v19[127];
        uint64_t v32 = [obj objectForKeyedSubscript:v29];
        v33 = [v32 firstObject];
        v34 = [(_PSRuleOverlapFeedback *)v51 interactionStore];
        [v56 startDate];
        v36 = v35 = v19;
        [v31 extractFrequencyRecencyFeaturesIntoPETMessage:v30 recipientID:v29 interaction:v33 normConstants:v52 numberOfDaysToLookBack:28 interactionStore:v34 timeOfShareInteraction:v36 contactPropertyCache:v54 interactionCache:v53];

        double v19 = v35;
        v37 = v35[127];
        v38 = [obj objectForKeyedSubscript:v29];
        v39 = [v38 firstObject];
        -[CAPContactFillerContactEvent setWasShareRecipient:](v30, "setWasShareRecipient:", [v37 doesTheRecipientsMatchInInteraction1:v39 interaction2:v56]);

        v40 = v35[127];
        v41 = [obj objectForKeyedSubscript:v29];
        v42 = [v41 firstObject];
        v43 = [v40 filterRulesBasedOnInteractionGivenRuleList:v57 interaction:v42];

        -[CAPContactFillerContactEvent setNumberOfBehavioralRulesAdvocating:](v30, "setNumberOfBehavioralRulesAdvocating:", objc_msgSend(v35[127], "contactFillerBucketedValue:", objc_msgSend(v43, "count")));
        if ([v57 count]) {
          [v35[127] extractFeaturesFromBehaviorRulesIntoPETMessage:v30 behaviorRules:v43 contextItems:v47 ruleRankingModel:v48];
        }
        long long v27 = v50;
        if (v50)
        {
          v44 = [v50 objectForKeyedSubscript:v29];
          [v44 doubleValue];
          -[CAPContactFillerContactEvent setInteractionModelScore:](v30, "setInteractionModelScore:");
        }
        [(CAPContactFillerShareEvent *)v55 addContactEvent:v30];

        uint64_t v28 = v60 + 1;
      }
      while (v58 != v60 + 1);
      uint64_t v58 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v58);
  }

  return v55;
}

- (void)scoreRanking:(int64_t)a3 forModelKey:(id)a4
{
  id v6 = a4;
  if (a3 != -1)
  {
    id v11 = v6;
    double v7 = 0.0;
    if (a3)
    {
      int64_t v8 = 12;
      if (a3 < 12) {
        int64_t v8 = a3;
      }
      double v7 = (double)(13 - v8) / 12.0;
    }
    uint64_t v9 = [(_PSRuleOverlapFeedback *)self confidenceModelForSharing];
    uint64_t v10 = [NSNumber numberWithDouble:v7];
    [v9 addEventForModel:v11 event:v10];

    id v6 = v11;
  }
}

- (void)modelAccuracyLogging:(id)a3 WithMatchingInteraction:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v64 = [MEMORY[0x1E4F1CA60] dictionary];
  double v7 = [v5 metadata];
  int64_t v8 = [MEMORY[0x1E4F5B5E0] modelSuggestionProxies];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9) {
    goto LABEL_61;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  id v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  id v73 = 0;
  id v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v14 fromData:v9 error:&v73];
  id v16 = v73;
  int v17 = v16;
  if (!v15) {
    goto LABEL_60;
  }
  id v59 = v16;
  uint64_t v60 = v15;
  long long v61 = v14;
  long long v62 = v7;
  id v63 = v5;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v15;
  uint64_t v18 = v64;
  uint64_t v67 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (!v67) {
    goto LABEL_59;
  }
  double v19 = @"hyperRecentSuggestionProxies";
  uint64_t v65 = *(void *)v70;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v70 != v65) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(void **)(*((void *)&v69 + 1) + 8 * v20);
      v22 = [obj objectForKeyedSubscript:v21];
      if ([v22 count])
      {
        unint64_t v23 = 1;
        while (1)
        {
          uint64_t v24 = [v22 objectAtIndexedSubscript:v23 - 1];
          BOOL v25 = +[_PSContactFillerDataCollectionUtilities doesSuggestionProxyMatch:v24 withInteraction:v6];

          if (v25) {
            break;
          }
          if ([v22 count] <= v23++)
          {
            uint64_t v27 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v27 = v23;
LABEL_15:
        uint64_t v18 = v64;
        double v19 = @"hyperRecentSuggestionProxies";
      }
      else
      {
        uint64_t v27 = 0;
      }
      if (![v22 count]) {
        uint64_t v27 = -1;
      }
      if ([v21 isEqualToString:@"hyperRecentSuggestionProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        [v18 setObject:v28 forKeyedSubscript:@"hyperRecencyHeuristicPredictedInteractionRank"];
LABEL_53:

        [(_PSRuleOverlapFeedback *)self scoreRanking:v27 forModelKey:v19];
        double v19 = @"hyperRecentSuggestionProxies";
        goto LABEL_54;
      }
      uint64_t v29 = @"inPhoneCallSuggestionProxies";
      if ([v21 isEqualToString:@"inPhoneCallSuggestionProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"inPhoneCallHeuristicPredictedInteractionRank";
LABEL_52:
        [v30 setObject:v31 forKeyedSubscript:v32];
        double v19 = v29;
        goto LABEL_53;
      }
      uint64_t v29 = @"photosGroupSuggestionProxiesAssetPresence";
      if ([v21 isEqualToString:@"photosGroupSuggestionProxiesAssetPresence"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"photoAssetHeuristicPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"photoSuggestionProxiesFilteredByAssetOrMomentPresence";
      if ([v21 isEqualToString:@"photoSuggestionProxiesFilteredByAssetOrMomentPresence"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"photoAssetOrMomentHeuristicPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"photosGroupSuggestionProxies";
      if ([v21 isEqualToString:@"photosGroupSuggestionProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"photoGroupHeuristicPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"miningSuggestionProxies";
      if ([v21 isEqualToString:@"miningSuggestionProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"miningPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"portraitContactSuggestionProxies";
      if ([v21 isEqualToString:@"portraitContactSuggestionProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"topicHeuristicPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionProxies";
      if ([v21 isEqualToString:@"knnSuggestionProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionBasedOnSharesAllProxies";
      if ([v21 isEqualToString:@"knnSuggestionBasedOnSharesAllProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnSharesAllPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionBasedOnSharesTopProxies";
      if ([v21 isEqualToString:@"knnSuggestionBasedOnSharesTopProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnSharesTopPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionBasedOnSharesAllAndAppFilterOnProxies";
      if ([v21 isEqualToString:@"knnSuggestionBasedOnSharesAllAndAppFilterOnProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnSharesAllAndAppFilterOnPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionBasedOnSharesTopAndAppFilterOnProxies";
      if ([v21 isEqualToString:@"knnSuggestionBasedOnSharesTopAndAppFilterOnProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnSharesTopAndAppFilterOnPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionBasedOnExpanseSessionsTopAndAppFilterOnProxies";
      if ([v21 isEqualToString:@"knnSuggestionBasedOnExpanseSessionsTopAndAppFilterOnProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnExpanseSessionsTopAndAppFilterOnPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionBasedOnExpanseSessionsAllAndAppFilterOnProxiesKey";
      if ([v21 isEqualToString:@"knnSuggestionBasedOnExpanseSessionsAllAndAppFilterOnProxiesKey"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnExpanseSessionsAllAndAppFilterOnPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionBasedOnExpanseSessionsTopProxies";
      if ([v21 isEqualToString:@"knnSuggestionBasedOnExpanseSessionsTopProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnExpanseSessionsTopPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionBasedOnExpanseSessionsAllProxiesKey";
      if ([v21 isEqualToString:@"knnSuggestionBasedOnExpanseSessionsAllProxiesKey"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnExpanseSessionsAllPredictedInteractionRank";
        goto LABEL_52;
      }
      uint64_t v29 = @"knnSuggestionBasedOnInteractionsProxies";
      if ([v21 isEqualToString:@"knnSuggestionBasedOnInteractionsProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        uint64_t v30 = v18;
        uint64_t v31 = v28;
        uint64_t v32 = @"knnNonShareInteractionsInteractionRank";
        goto LABEL_52;
      }
      if ([v21 isEqualToString:@"sharingContactRankerModelSuggestionProxies"])
      {
        uint64_t v28 = [NSNumber numberWithInt:v27];
        [v18 setObject:v28 forKeyedSubscript:@"sharingContactRankerInteractionRank"];
        double v19 = @"sharingContactRankerModelSuggestionProxies";
        goto LABEL_53;
      }
LABEL_54:

      ++v20;
    }
    while (v20 != v67);
    uint64_t v33 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    uint64_t v67 = v33;
  }
  while (v33);
LABEL_59:

  double v7 = v62;
  id v5 = v63;
  id v14 = v61;
  int v17 = v59;
  id v15 = v60;
LABEL_60:

LABEL_61:
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[_PSRuleOverlapFeedback wasInteractionAmongSuggestLess:](self, "wasInteractionAmongSuggestLess:", v6));
  [v64 setObject:v34 forKeyedSubscript:@"wasInteractionRecipientAmongSuggestLess"];

  v35 = [MEMORY[0x1E4F5B5E0] peopleSuggestionsDisabled];
  v36 = [v7 objectForKeyedSubscript:v35];
  [v64 setObject:v36 forKeyedSubscript:@"peopleSuggestionsDisabled"];

  v37 = [MEMORY[0x1E4F5B5E0] adaptedModelRecipeID];
  v38 = [v7 objectForKeyedSubscript:v37];
  [v64 setObject:v38 forKeyedSubscript:@"adaptedModelRecipeID"];

  v39 = [MEMORY[0x1E4F5B5E0] engagementType];
  v40 = [v7 objectForKeyedSubscript:v39];
  [v64 setObject:v40 forKeyedSubscript:@"engagementType"];

  v41 = [MEMORY[0x1E4F5B5E0] iCloudFamilyInvocation];
  v42 = [v7 objectForKeyedSubscript:v41];
  [v64 setObject:v42 forKeyedSubscript:@"iCloudFamilyInvocation"];

  v43 = [MEMORY[0x1E4F5B5E0] isAdaptedModelCreated];
  v44 = [v7 objectForKeyedSubscript:v43];
  [v64 setObject:v44 forKeyedSubscript:@"isAdaptedModelCreated"];

  v45 = [MEMORY[0x1E4F5B5E0] isAdaptedModelUsed];
  v46 = [v7 objectForKeyedSubscript:v45];
  [v64 setObject:v46 forKeyedSubscript:@"isAdaptedModelUsed"];

  v47 = [MEMORY[0x1E4F5B5E0] reasonType];
  id v48 = [v7 objectForKeyedSubscript:v47];
  [v64 setObject:v48 forKeyedSubscript:@"reasonType"];

  uint64_t v49 = [MEMORY[0x1E4F5B5E0] trackingID];
  v50 = [v7 objectForKeyedSubscript:v49];
  [v64 setObject:v50 forKeyedSubscript:@"trackingID"];

  v51 = [MEMORY[0x1E4F5B5E0] transportBundleID];
  v52 = [v7 objectForKeyedSubscript:v51];
  [v64 setObject:v52 forKeyedSubscript:@"transportBundleID"];

  id v53 = [MEMORY[0x1E4F5B5E0] sourceBundleID];
  id v54 = [v7 objectForKeyedSubscript:v53];
  [v64 setObject:v54 forKeyedSubscript:@"sourceBundleID"];

  v55 = [MEMORY[0x1E4F5B5E0] supportedBundleIDs];
  id v56 = [v7 objectForKeyedSubscript:v55];
  [v64 setObject:v56 forKeyedSubscript:@"supportedBundleIDs"];

  v57 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
    -[_PSRuleOverlapFeedback modelAccuracyLogging:WithMatchingInteraction:]();
  }

  id v58 = v64;
  AnalyticsSendEventLazy();
}

- (BOOL)wasInteractionAmongSuggestLess:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__16;
  v38 = __Block_byref_object_dispose__16;
  id v39 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = BiomeLibrary();
  id v5 = [v4 PeopleSuggester];
  long long v26 = [v5 SuggestLessFeedback];

  id v6 = [v26 publisherWithUseCase:@"PeopleSuggesterSuggestLessFeedback"];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __57___PSRuleOverlapFeedback_wasInteractionAmongSuggestLess___block_invoke_343;
  v33[3] = &unk_1E5ADEA50;
  v33[4] = &v34;
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_342 receiveInput:v33];
  BOOL v25 = v6;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)v35[5];
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v8)
  {
    uint64_t v28 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = +[_PSContactFillerDataCollectionUtilities getInteractionRecipientFromInteraction:](_PSContactFillerDataCollectionUtilities, "getInteractionRecipientFromInteraction:", v3, v25);
        if (v11)
        {
          uint64_t v12 = [v10 derivedIntentId];
          char v13 = [v12 isEqualToString:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        id v14 = [v3 recipients];
        if (v14)
        {
          id v15 = [v3 recipients];
          BOOL v16 = [v15 count] == 1;

          if (v16)
          {
            int v17 = [v3 recipients];
            uint64_t v18 = [v17 firstObject];

            double v19 = [v10 contactId];
            uint64_t v20 = [v18 personId];
            if ([v19 isEqualToString:v20])
            {

LABEL_16:
              LOBYTE(v8) = 1;
              goto LABEL_17;
            }
            id v21 = [v10 contactId];
            v22 = [v18 identifier];
            char v23 = [v21 isEqualToString:v22];

            if (v23) {
              goto LABEL_16;
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  _Block_object_dispose(&v34, 8);
  return v8;
}

- (void)loggingForKnowledgeStoreEvent:(id)a3 WithMatchingInteraction:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v85 = v6;
  uint64_t v8 = [(_PSRuleOverlapFeedback *)self contextItemsFromEvent:v6];
  uint64_t v9 = [getBMRetrievalFilterClass_0() filterWithOperand:1 inclusionOperator:0 items:v8];
  uint64_t v10 = [getBMItemTypeClass_0() interactionRecipients];
  long long v72 = [getBMItemTypeClass_0() interactionTargetBundleID];
  id v73 = (void *)v10;
  long long v71 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v10, v72, 0);
  long long v70 = [getBMRetrievalFilterClass_0() filterWithOperand:2 inclusionOperator:2 types:v71];
  v74 = (void *)v9;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v9, v70, 0);
  uint64_t v12 = [(_PSRuleOverlapFeedback *)self behaviorRetriever];
  long long v69 = (void *)v11;
  char v13 = [v12 retrieveRulesWithSupport:v11 confidence:0.0 filters:0.0];

  v84 = [(_PSRuleOverlapFeedback *)self constantFeaturesFromContextItems:v8];
  v83 = [(_PSRuleOverlapFeedback *)self constantPETFeaturesFromContextItems:v8];
  id v14 = [MEMORY[0x1E4F29128] UUID];
  v88 = [v14 UUIDString];

  id v15 = 0;
  if (os_variant_has_internal_content())
  {
    id v15 = [(NSUserDefaults *)self->_ruleOverlapFeedbackDefaults objectForKey:@"SessionId"];
    if (!v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v17 = [v16 UUIDString];

      id v15 = (void *)v17;
      [(NSUserDefaults *)self->_ruleOverlapFeedbackDefaults setObject:v17 forKey:@"SessionId"];
    }
  }
  id v80 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v75 addObject:&unk_1EF675960];
  id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id obj = v13;
  v82 = v15;
  uint64_t v87 = [obj countByEnumeratingWithState:&v96 objects:v103 count:16];
  if (v87)
  {
    uint64_t v81 = *(void *)v97;
    unint64_t v18 = 0x1E4F28000uLL;
    v78 = v8;
    id v79 = v7;
    v77 = self;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v97 != v81) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        id v21 = [(_PSRuleOverlapFeedback *)self feedbackPayloadForRule:v20 ForInteraction:v7 ForContextItems:v8 WithConstantFeatures:v84];
        v22 = [v20 consequent];
        char v23 = [v22 valueForKey:@"type"];

        uint64_t v24 = *(void **)(v18 + 3792);
        BOOL v25 = [getBMItemTypeClass_0() interactionTargetBundleID];
        v89 = v23;
        long long v26 = objc_msgSend(v24, "numberWithBool:", objc_msgSend(v23, "containsObject:", v25));
        [v21 setObject:v26 forKeyedSubscript:@"targetBundleIDInConsequent"];

        [v21 setObject:v88 forKeyedSubscript:@"uniqueShareEventIdentifier"];
        uint64_t v27 = [v85 metadata];
        uint64_t v28 = [MEMORY[0x1E4F5B5E0] targetBundleID];
        long long v29 = [v27 objectForKeyedSubscript:v28];

        if (v29)
        {
          BOOL v30 = +[_PSContactFillerDataCollectionUtilities recipientPredictedCorrectlyByRule:v20 interaction:v7 bundleId:v29];
          BOOL v31 = [(_PSRuleOverlapFeedback *)self targetAppPredictedCorrectlyByRule:v20 bundleId:v29];
          long long v32 = [NSNumber numberWithBool:v30];
          [v21 setObject:v32 forKeyedSubscript:@"personMatched"];

          uint64_t v33 = [NSNumber numberWithBool:v30 & v31];
          [v21 setObject:v33 forKeyedSubscript:@"personAndAppMatched"];

          uint64_t v34 = [v20 consequent];
          v35 = [v34 objectsPassingTest:&__block_literal_global_366];
          uint64_t v36 = [v35 valueForKey:@"value"];

          v37 = [v20 consequent];
          v38 = [v37 objectsPassingTest:&__block_literal_global_371];
          id v39 = [v38 valueForKey:@"value"];

          v40 = &stru_1EF653EA8;
          if ([v36 count] == 1)
          {
            uint64_t v41 = [v36 anyObject];
            v40 = [&stru_1EF653EA8 stringByAppendingString:v41];
          }
          if ([v39 count] == 1)
          {
            v42 = [v39 anyObject];
            uint64_t v43 = [(__CFString *)v40 stringByAppendingString:v42];

            v40 = (__CFString *)v43;
          }
          v44 = v80;
          v45 = [v80 allKeys];
          char v46 = [v45 containsObject:v40];

          if ((v46 & 1) == 0)
          {
            uint64_t v47 = arc4random();
            id v48 = [NSNumber numberWithUnsignedInt:v47];
            int v49 = [v75 containsObject:v48];

            if (v49)
            {
              do
              {
                uint64_t v47 = arc4random();
                v50 = [NSNumber numberWithUnsignedInt:v47];
                char v51 = [v75 containsObject:v50];
              }
              while ((v51 & 1) != 0);
            }
            v52 = [NSNumber numberWithUnsignedInt:v47];
            v44 = v80;
            [v80 setValue:v52 forKey:v40];
          }
          id v53 = [v44 valueForKey:v40];
          [v21 setObject:v53 forKeyedSubscript:@"recipientAndBundleIDAsInteger"];

          uint64_t v8 = v78;
          id v7 = v79;
          self = v77;
        }
        uint64_t v91 = MEMORY[0x1E4F143A8];
        uint64_t v92 = 3221225472;
        v93 = __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_3;
        v94 = &unk_1E5AE0EA0;
        id v54 = v21;
        id v95 = v54;
        AnalyticsSendEventLazy();
        v55 = [getPETEventTracker2Class() sharedInstance];
        id v56 = [(_PSRuleOverlapFeedback *)self feedbackPETPayloadForRule:v20 ForInteraction:v7 ForContextItems:v8 WithConstantFeatures:v83];
        v57 = [getBMItemTypeClass_0() interactionTargetBundleID];
        objc_msgSend(v56, "setTargetBundleIDInConsequent:", objc_msgSend(v89, "containsObject:", v57));

        [v56 setUniqueShareEventIdentifier:v88];
        if (v29)
        {
          BOOL v58 = +[_PSContactFillerDataCollectionUtilities recipientPredictedCorrectlyByRule:v20 interaction:v7 bundleId:v29];
          BOOL v59 = [(_PSRuleOverlapFeedback *)self targetAppPredictedCorrectlyByRule:v20 bundleId:v29];
          [v56 setPersonMatched:v58];
          [v56 setPersonAndAppMatched:v58 & v59];
        }
        id v15 = v82;
        if (v82) {
          [v56 setSessionId:v82];
        }
        [v55 logMessage:v56];
        [v86 addObject:v54];

        unint64_t v18 = 0x1E4F28000;
      }
      uint64_t v87 = [obj countByEnumeratingWithState:&v96 objects:v103 count:16];
    }
    while (v87);
  }

  if (v86)
  {
    uint64_t v60 = [MEMORY[0x1E4F1C9C8] date];
    long long v61 = [MEMORY[0x1E4F5B4C0] featureDict];
    v101 = v61;
    id v102 = v86;
    long long v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];

    id v63 = (void *)MEMORY[0x1E4F5B510];
    long long v64 = [MEMORY[0x1E4F5B5F8] behavioralRuleFeaturesStream];
    uint64_t v65 = [v63 eventWithStream:v64 startDate:v60 endDate:v60 identifierStringValue:&stru_1EF653EA8 metadata:v62];

    if (v65)
    {
      uint64_t v66 = [MEMORY[0x1E4F5B560] knowledgeStore];
      v100 = v65;
      uint64_t v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
      [v66 saveObjects:v67 tracker:&__block_literal_global_380 responseQueue:0 withCompletion:&__block_literal_global_383];
    }
    else
    {
      uint64_t v66 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        -[_PSRuleOverlapFeedback loggingForKnowledgeStoreEvent:WithMatchingInteraction:]();
      }
    }
    id v15 = v82;
  }
  v68 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v68, OS_LOG_TYPE_INFO, "Done with persisting featureDict in Knowledge store.", buf, 2u);
  }
}

- (id)feedbackPETPayloadForRule:(id)a3 ForInteraction:(id)a4 ForContextItems:(id)a5 WithConstantFeatures:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent);
  [v9 copyTo:v11];

  uint64_t v12 = [v8 antecedent];
  char v13 = [v12 valueForKey:@"type"];
  id v14 = (void *)[v13 mutableCopy];

  id v15 = [getBMItemTypeClass_0() isWeekend];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setIsWeekendInRule:](v11, "setIsWeekendInRule:", [v14 containsObject:v15]);

  BOOL v16 = [getBMItemTypeClass_0() hourOfDaySlot];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTimeOfDaySlotInRule:](v11, "setTimeOfDaySlotInRule:", [v14 containsObject:v16]);

  uint64_t v17 = [getBMItemTypeClass_0() interactionUTIType];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setUtiTypeInRule:](v11, "setUtiTypeInRule:", [v14 containsObject:v17]);

  unint64_t v18 = [getBMItemTypeClass_0() interactionContentURL];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setContentUrlInRule:](v11, "setContentUrlInRule:", [v14 containsObject:v18]);

  double v19 = [getBMItemTypeClass_0() interactionSharingSourceBundleID];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSourceBundleIdInRule:](v11, "setSourceBundleIdInRule:", [v14 containsObject:v19]);

  uint64_t v20 = [getBMItemTypeClass_0() interactionTargetBundleID];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTargetBundleIdInRule:](v11, "setTargetBundleIdInRule:", [v14 containsObject:v20]);

  id v21 = [getBMItemTypeClass_0() locationIdentifier];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLOIInRule:](v11, "setLOIInRule:", [v14 containsObject:v21]);

  v22 = [getBMItemTypeClass_0() interactionPhotoContact];
  LODWORD(v13) = [v14 containsObject:v22];

  if (v13)
  {
    char v23 = [v8 antecedent];
    uint64_t v24 = [v23 objectsPassingTest:&__block_literal_global_386];
    uint64_t v25 = [v24 count];
  }
  else
  {
    uint64_t v25 = 0;
  }
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v11 setPhotoContactInRule:v25];
  long long v26 = [getBMItemTypeClass_0() interactionPhotoScene];
  int v27 = [v14 containsObject:v26];

  if (v27)
  {
    uint64_t v28 = [v8 antecedent];
    long long v29 = [v28 objectsPassingTest:&__block_literal_global_388_0];
    uint64_t v30 = [v29 count];
  }
  else
  {
    uint64_t v30 = 0;
  }
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v11 setPhotoSceneInRule:v30];
  BOOL v31 = [getBMItemTypeClass_0() interactionExtractedTopicFromAttachment];
  int v32 = [v14 containsObject:v31];

  if (v32)
  {
    uint64_t v33 = [v8 antecedent];
    uint64_t v34 = [v33 objectsPassingTest:&__block_literal_global_390];
    int v35 = [v34 count];

    BOOL v36 = v35 != 0;
  }
  else
  {
    BOOL v36 = 0;
  }
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v11 setTopicInRule:v36];
  v37 = [v8 antecedent];
  v38 = (void *)[v37 mutableCopy];

  [v38 intersectSet:v10];
  id v39 = [v38 valueForKey:@"type"];
  v40 = (void *)[v39 mutableCopy];

  uint64_t v41 = [getBMItemTypeClass_0() isWeekend];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setIsWeekendOverlap:](v11, "setIsWeekendOverlap:", [v40 containsObject:v41]);

  v42 = [getBMItemTypeClass_0() hourOfDaySlot];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTimeOfDaySlotOverlap:](v11, "setTimeOfDaySlotOverlap:", [v40 containsObject:v42]);

  uint64_t v43 = [getBMItemTypeClass_0() interactionUTIType];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setUtiTypeOverlap:](v11, "setUtiTypeOverlap:", [v40 containsObject:v43]);

  v44 = [getBMItemTypeClass_0() interactionContentURL];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setContentUrlOverlap:](v11, "setContentUrlOverlap:", [v40 containsObject:v44]);

  v45 = [getBMItemTypeClass_0() interactionSharingSourceBundleID];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSourceBundleIdOverlap:](v11, "setSourceBundleIdOverlap:", [v40 containsObject:v45]);

  char v46 = [getBMItemTypeClass_0() interactionTargetBundleID];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTargetBundleIdOverlap:](v11, "setTargetBundleIdOverlap:", [v40 containsObject:v46]);

  uint64_t v47 = [getBMItemTypeClass_0() locationIdentifier];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLOIOverlap:](v11, "setLOIOverlap:", [v40 containsObject:v47]);

  id v48 = [getBMItemTypeClass_0() interactionPhotoContact];
  int v49 = [v40 containsObject:v48];

  if (v49)
  {
    v50 = [v38 objectsPassingTest:&__block_literal_global_392_0];
    uint64_t v51 = [v50 count];
  }
  else
  {
    uint64_t v51 = 0;
  }
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v11 setPhotoContactOverlap:v51];
  v52 = [getBMItemTypeClass_0() interactionPhotoScene];
  int v53 = [v40 containsObject:v52];

  if (v53)
  {
    id v54 = [v38 objectsPassingTest:&__block_literal_global_394_0];
    uint64_t v55 = [v54 count];
  }
  else
  {
    uint64_t v55 = 0;
  }
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v11 setPhotoSceneOverlap:v55];
  id v56 = [getBMItemTypeClass_0() interactionExtractedTopicFromAttachment];
  int v57 = [v40 containsObject:v56];

  if (v57)
  {
    BOOL v58 = [v38 objectsPassingTest:&__block_literal_global_396];
    int v59 = [v58 count];

    BOOL v60 = v59 != 0;
  }
  else
  {
    BOOL v60 = 0;
  }
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v11 setTopicOverlap:v60];
  long long v61 = NSNumber;
  [v8 support];
  long long v62 = objc_msgSend(v61, "numberWithDouble:");
  id v63 = [v62 stringValue];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v11 setSupport:v63];

  long long v64 = NSNumber;
  [v8 confidence];
  uint64_t v65 = objc_msgSend(v64, "numberWithDouble:");
  uint64_t v66 = [v65 stringValue];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v11 setConfidence:v66];

  return v11;
}

- (id)feedbackPayloadForRule:(id)a3 ForInteraction:(id)a4 ForContextItems:(id)a5 WithConstantFeatures:(id)a6
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = [v9 dictionary];
  char v13 = [v8 antecedent];
  id v14 = [v13 valueForKey:@"type"];
  id v15 = (void *)[v14 mutableCopy];

  BOOL v16 = NSNumber;
  uint64_t v17 = [getBMItemTypeClass_0() isWeekend];
  unint64_t v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v15, "containsObject:", v17));
  [v12 setObject:v18 forKeyedSubscript:@"isWeekendInRule"];

  double v19 = NSNumber;
  uint64_t v20 = [getBMItemTypeClass_0() hourOfDaySlot];
  id v21 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v15, "containsObject:", v20));
  [v12 setObject:v21 forKeyedSubscript:@"timeOfDaySlotInRule"];

  v22 = NSNumber;
  char v23 = [getBMItemTypeClass_0() interactionUTIType];
  uint64_t v24 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v15, "containsObject:", v23));
  [v12 setObject:v24 forKeyedSubscript:@"utiTypeInRule"];

  uint64_t v25 = NSNumber;
  long long v26 = [getBMItemTypeClass_0() interactionContentURL];
  int v27 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v15, "containsObject:", v26));
  [v12 setObject:v27 forKeyedSubscript:@"contentUrlInRule"];

  uint64_t v28 = NSNumber;
  long long v29 = [getBMItemTypeClass_0() interactionSharingSourceBundleID];
  uint64_t v30 = objc_msgSend(v28, "numberWithBool:", objc_msgSend(v15, "containsObject:", v29));
  [v12 setObject:v30 forKeyedSubscript:@"sourceBundleIdInRule"];

  BOOL v31 = NSNumber;
  int v32 = [getBMItemTypeClass_0() interactionTargetBundleID];
  uint64_t v33 = objc_msgSend(v31, "numberWithBool:", objc_msgSend(v15, "containsObject:", v32));
  [v12 setObject:v33 forKeyedSubscript:@"targetBundleIdInRule"];

  uint64_t v34 = NSNumber;
  int v35 = [getBMItemTypeClass_0() locationIdentifier];
  BOOL v36 = objc_msgSend(v34, "numberWithBool:", objc_msgSend(v15, "containsObject:", v35));
  [v12 setObject:v36 forKeyedSubscript:@"LOIInRule"];

  v37 = [getBMItemTypeClass_0() interactionPhotoContact];
  LODWORD(v35) = [v15 containsObject:v37];

  if (v35)
  {
    v38 = [v8 antecedent];
    id v39 = [v38 objectsPassingTest:&__block_literal_global_419];
    uint64_t v40 = [v39 count];

    uint64_t v41 = [NSNumber numberWithInt:v40];
    [v12 setObject:v41 forKeyedSubscript:@"photoContactInRule"];
  }
  v42 = [getBMItemTypeClass_0() interactionPhotoScene];
  int v43 = [v15 containsObject:v42];

  if (v43)
  {
    v44 = [v8 antecedent];
    v45 = [v44 objectsPassingTest:&__block_literal_global_424];
    uint64_t v46 = [v45 count];

    uint64_t v47 = [NSNumber numberWithInt:v46];
    [v12 setObject:v47 forKeyedSubscript:@"photoSceneInRule"];
  }
  id v48 = [v8 antecedent];
  int v49 = (void *)[v48 mutableCopy];

  [v49 intersectSet:v11];
  v50 = [v49 valueForKey:@"type"];
  uint64_t v51 = (void *)[v50 mutableCopy];

  v52 = NSNumber;
  int v53 = [getBMItemTypeClass_0() isWeekend];
  id v54 = objc_msgSend(v52, "numberWithBool:", objc_msgSend(v51, "containsObject:", v53));
  [v12 setObject:v54 forKeyedSubscript:@"isWeekendOverlap"];

  uint64_t v55 = NSNumber;
  id v56 = [getBMItemTypeClass_0() hourOfDaySlot];
  int v57 = objc_msgSend(v55, "numberWithBool:", objc_msgSend(v51, "containsObject:", v56));
  [v12 setObject:v57 forKeyedSubscript:@"timeOfDaySlotOverlap"];

  BOOL v58 = NSNumber;
  int v59 = [getBMItemTypeClass_0() interactionUTIType];
  BOOL v60 = objc_msgSend(v58, "numberWithBool:", objc_msgSend(v51, "containsObject:", v59));
  [v12 setObject:v60 forKeyedSubscript:@"utiTypeOverlap"];

  long long v61 = NSNumber;
  long long v62 = [getBMItemTypeClass_0() interactionContentURL];
  id v63 = objc_msgSend(v61, "numberWithBool:", objc_msgSend(v51, "containsObject:", v62));
  [v12 setObject:v63 forKeyedSubscript:@"contentUrlOverlap"];

  long long v64 = NSNumber;
  uint64_t v65 = [getBMItemTypeClass_0() interactionSharingSourceBundleID];
  uint64_t v66 = objc_msgSend(v64, "numberWithBool:", objc_msgSend(v51, "containsObject:", v65));
  [v12 setObject:v66 forKeyedSubscript:@"sourceBundleIdOverlap"];

  uint64_t v67 = NSNumber;
  v68 = [getBMItemTypeClass_0() interactionTargetBundleID];
  long long v69 = objc_msgSend(v67, "numberWithBool:", objc_msgSend(v51, "containsObject:", v68));
  [v12 setObject:v69 forKeyedSubscript:@"targetBundleIdOverlap"];

  long long v70 = NSNumber;
  long long v71 = [getBMItemTypeClass_0() locationIdentifier];
  long long v72 = objc_msgSend(v70, "numberWithBool:", objc_msgSend(v51, "containsObject:", v71));
  [v12 setObject:v72 forKeyedSubscript:@"LOIOverlap"];

  id v73 = [getBMItemTypeClass_0() interactionPhotoContact];
  LODWORD(v71) = [v51 containsObject:v73];

  if (v71)
  {
    v74 = [v49 objectsPassingTest:&__block_literal_global_450_0];
    uint64_t v75 = [v74 count];

    v76 = [NSNumber numberWithInt:v75];
    [v12 setObject:v76 forKeyedSubscript:@"photoContactOverlap"];
  }
  v77 = [getBMItemTypeClass_0() interactionPhotoScene];
  int v78 = [v51 containsObject:v77];

  if (v78)
  {
    id v79 = [v49 objectsPassingTest:&__block_literal_global_455_0];
    uint64_t v80 = [v79 count];

    uint64_t v81 = [NSNumber numberWithInt:v80];
    [v12 setObject:v81 forKeyedSubscript:@"photoSceneOverlap"];
  }
  v82 = NSNumber;
  [v8 support];
  v83 = objc_msgSend(v82, "numberWithDouble:");
  [v12 setObject:v83 forKeyedSubscript:@"support"];

  v84 = NSNumber;
  [v8 confidence];
  v85 = objc_msgSend(v84, "numberWithDouble:");
  [v12 setObject:v85 forKeyedSubscript:@"confidence"];

  [v12 addEntriesFromDictionary:v10];

  return v12;
}

- (BOOL)targetAppPredictedCorrectlyByRule:(id)a3 bundleId:(id)a4
{
  id v5 = a4;
  id v6 = [a3 consequent];
  id v7 = [v6 objectsPassingTest:&__block_literal_global_466];
  id v8 = [v7 valueForKey:@"value"];

  LOBYTE(v6) = [v8 containsObject:v5];
  return (char)v6;
}

- (id)constantFeaturesFromContextItems:(id)a3
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v100 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675978, 0);
  uint64_t v7 = [v5 predicateWithFormat:@"direction IN %@", v6];

  id v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675990, &unk_1EF6759A8, 0);
  uint64_t v10 = [v8 predicateWithFormat:@"direction IN %@", v9];

  id v11 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675990, &unk_1EF6759A8, 0);
  uint64_t v13 = [v11 predicateWithFormat:@"direction IN %@ && mechanism == %@", v12, &unk_1EF6759C0];

  id v14 = [(_PSRuleOverlapFeedback *)self interactionStore];
  id v129 = 0;
  long long v98 = (void *)v10;
  uint64_t v15 = [v14 countInteractionsUsingPredicate:v10 error:&v129];
  id v16 = v129;

  uint64_t v17 = [(_PSRuleOverlapFeedback *)self interactionStore];
  id v128 = 0;
  long long v99 = (void *)v7;
  uint64_t v18 = [v17 countInteractionsUsingPredicate:v7 error:&v128];
  id v103 = v128;

  uint64_t v104 = self;
  double v19 = [(_PSRuleOverlapFeedback *)self interactionStore];
  id v127 = 0;
  long long v97 = (void *)v13;
  uint64_t v20 = [v19 countInteractionsUsingPredicate:v13 error:&v127];
  id v21 = v127;

  id v102 = v16;
  if (__PAIR128__((unint64_t)v103, (unint64_t)v16) != 0 || v21)
  {
    v22 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v133 = v16;
      __int16 v134 = 2112;
      id v135 = v103;
      __int16 v136 = 2112;
      id v137 = v21;
      _os_log_error_impl(&dword_1A314B000, v22, OS_LOG_TYPE_ERROR, "Interaction store retrieval error. Sent messages query: %@, Recieved messages query: %@, Shares query: %@", buf, 0x20u);
    }
  }
  long long v96 = v21;
  char v23 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](self, "bucketedValue:", v15));
  [v4 setObject:v23 forKeyedSubscript:@"totalMessagesSent"];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](self, "bucketedValue:", v18));
  [v4 setObject:v24 forKeyedSubscript:@"totalMessagesRecieved"];

  uint64_t v25 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](self, "bucketedValue:", v20));
  v101 = v4;
  [v4 setObject:v25 forKeyedSubscript:@"totalShares"];

  long long v26 = [(BMBehaviorRetriever *)self->_behaviorRetriever retrieveRulesWithFilters:0];
  v118 = [MEMORY[0x1E4F1CA80] set];
  v117 = [MEMORY[0x1E4F1CA80] set];
  v115 = [MEMORY[0x1E4F1CA80] set];
  v113 = [MEMORY[0x1E4F1CA80] set];
  v111 = [MEMORY[0x1E4F1CA80] set];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id obj = v26;
  uint64_t v109 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
  if (v109)
  {
    unsigned int v114 = 0;
    unsigned int v112 = 0;
    uint64_t v108 = 0;
    unsigned int v107 = 0;
    unsigned int v116 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v106 = *(void *)v124;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v124 != v106) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void **)(*((void *)&v123 + 1) + 8 * v29);
        [v30 confidence];
        uint64_t v110 = v29;
        if (v31 <= 0.75)
        {
          [v30 confidence];
          if (v32 <= 0.25) {
            int v33 = v108;
          }
          else {
            int v33 = v108 + 1;
          }
          if (v32 > 0.25) {
            unsigned int v34 = v107;
          }
          else {
            unsigned int v34 = v107 + 1;
          }
          unsigned int v107 = v34;
          LODWORD(v108) = v33;
        }
        else
        {
          ++HIDWORD(v108);
        }
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        int v35 = [v30 antecedent];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v119 objects:v130 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v120;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v120 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void **)(*((void *)&v119 + 1) + 8 * i);
              uint64_t v41 = [v40 type];
              v42 = [getBMItemTypeClass_0() interactionPhotoContact];
              int v43 = [v41 isEqual:v42];

              if (v43)
              {
                [v118 addObject:v40];
                uint64_t v28 = (v28 + 1);
              }
              else
              {
                v44 = [v40 type];
                v45 = [getBMItemTypeClass_0() interactionPhotoScene];
                int v46 = [v44 isEqual:v45];

                if (v46)
                {
                  [v117 addObject:v40];
                  uint64_t v27 = (v27 + 1);
                }
                else
                {
                  uint64_t v47 = [v40 type];
                  id v48 = [getBMItemTypeClass_0() interactionSharingSourceBundleID];
                  int v49 = [v47 isEqual:v48];

                  if (v49)
                  {
                    [v115 addObject:v40];
                    ++v116;
                  }
                  else
                  {
                    v50 = [v40 type];
                    uint64_t v51 = [getBMItemTypeClass_0() interactionTargetBundleID];
                    int v52 = [v50 isEqual:v51];

                    if (v52)
                    {
                      [v113 addObject:v40];
                      ++v114;
                    }
                    else
                    {
                      int v53 = [v40 type];
                      id v54 = [getBMItemTypeClass_0() locationIdentifier];
                      int v55 = [v53 isEqual:v54];

                      if (v55)
                      {
                        [v111 addObject:v40];
                        ++v112;
                      }
                    }
                  }
                }
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v119 objects:v130 count:16];
          }
          while (v37);
        }

        uint64_t v29 = v110 + 1;
      }
      while (v110 + 1 != v109);
      uint64_t v109 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
    }
    while (v109);
  }
  else
  {
    unsigned int v114 = 0;
    unsigned int v112 = 0;
    uint64_t v108 = 0;
    unsigned int v107 = 0;
    unsigned int v116 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
  }

  id v56 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v107));
  [v101 setObject:v56 forKeyedSubscript:@"lowConfidenceRuleCount"];

  int v57 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v108));
  [v101 setObject:v57 forKeyedSubscript:@"mediumConfidenceRuleCount"];

  BOOL v58 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", HIDWORD(v108)));
  [v101 setObject:v58 forKeyedSubscript:@"highConfidenceRuleCount"];

  int v59 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v28));
  [v101 setObject:v59 forKeyedSubscript:@"photoContactContainingRuleCount"];

  BOOL v60 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v27));
  [v101 setObject:v60 forKeyedSubscript:@"photoSceneContainingRuleCount"];

  long long v61 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v116));
  [v101 setObject:v61 forKeyedSubscript:@"sourceBundleIdContainingRuleCount"];

  long long v62 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v114));
  [v101 setObject:v62 forKeyedSubscript:@"targetBundleIdContainingRuleCount"];

  id v63 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v112));
  [v101 setObject:v63 forKeyedSubscript:@"locationOfInterestContainingRuleCount"];

  long long v64 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v118, "count")));
  [v101 setObject:v64 forKeyedSubscript:@"photoContactRulesCardinality"];

  uint64_t v65 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v117, "count")));
  [v101 setObject:v65 forKeyedSubscript:@"photoSceneRulesCardinality"];

  uint64_t v66 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v115, "count")));
  [v101 setObject:v66 forKeyedSubscript:@"sourceBundleIdRulesCardinality"];

  uint64_t v67 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v113, "count")));
  [v101 setObject:v67 forKeyedSubscript:@"targetBundleIdRulesCardinality"];

  v68 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v111, "count")));
  [v101 setObject:v68 forKeyedSubscript:@"locationOfInterestRulesCardinality"];

  long long v69 = [v100 valueForKey:@"type"];
  long long v70 = (void *)[v69 mutableCopy];

  long long v71 = NSNumber;
  long long v72 = [getBMItemTypeClass_0() interactionUTIType];
  id v73 = objc_msgSend(v71, "numberWithBool:", objc_msgSend(v70, "containsObject:", v72));
  [v101 setObject:v73 forKeyedSubscript:@"utiTypeInContext"];

  v74 = NSNumber;
  uint64_t v75 = [getBMItemTypeClass_0() interactionContentURL];
  v76 = objc_msgSend(v74, "numberWithBool:", objc_msgSend(v70, "containsObject:", v75));
  [v101 setObject:v76 forKeyedSubscript:@"contentUrlInContext"];

  v77 = NSNumber;
  int v78 = [getBMItemTypeClass_0() interactionSharingSourceBundleID];
  id v79 = objc_msgSend(v77, "numberWithBool:", objc_msgSend(v70, "containsObject:", v78));
  [v101 setObject:v79 forKeyedSubscript:@"sourceBundleIdInContext"];

  uint64_t v80 = NSNumber;
  uint64_t v81 = [getBMItemTypeClass_0() interactionTargetBundleID];
  v82 = objc_msgSend(v80, "numberWithBool:", objc_msgSend(v70, "containsObject:", v81));
  [v101 setObject:v82 forKeyedSubscript:@"targetBundleIdInContext"];

  v83 = NSNumber;
  v84 = [getBMItemTypeClass_0() locationIdentifier];
  v85 = objc_msgSend(v83, "numberWithBool:", objc_msgSend(v70, "containsObject:", v84));
  [v101 setObject:v85 forKeyedSubscript:@"LOIInContext"];

  id v86 = [getBMItemTypeClass_0() interactionPhotoContact];
  LODWORD(v84) = [v70 containsObject:v86];

  if (v84)
  {
    uint64_t v87 = [v100 objectsPassingTest:&__block_literal_global_547];
    uint64_t v88 = [v87 count];

    v89 = [NSNumber numberWithInt:v88];
    [v101 setObject:v89 forKeyedSubscript:@"photoContactInContext"];
  }
  v90 = [getBMItemTypeClass_0() interactionPhotoScene];
  int v91 = [v70 containsObject:v90];

  if (v91)
  {
    uint64_t v92 = [v100 objectsPassingTest:&__block_literal_global_552];
    uint64_t v93 = [v92 count];

    v94 = [NSNumber numberWithInt:v93];
    [v101 setObject:v94 forKeyedSubscript:@"photoSceneInContext"];
  }

  return v101;
}

- (id)constantPETFeaturesFromContextItems:(id)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  v84 = objc_alloc_init(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent);
  uint64_t v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675978, 0);
  uint64_t v6 = [v4 predicateWithFormat:@"direction IN %@", v5];

  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675990, &unk_1EF6759A8, 0);
  uint64_t v9 = [v7 predicateWithFormat:@"direction IN %@", v8];

  uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
  id v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675990, &unk_1EF6759A8, 0);
  uint64_t v12 = [v10 predicateWithFormat:@"direction IN %@ && mechanism == %@", v11, &unk_1EF6759C0];

  uint64_t v13 = [(_PSRuleOverlapFeedback *)self interactionStore];
  id v111 = 0;
  id v79 = (void *)v9;
  uint64_t v14 = [v13 countInteractionsUsingPredicate:v9 error:&v111];
  id v15 = v111;

  id v16 = [(_PSRuleOverlapFeedback *)self interactionStore];
  id v110 = 0;
  uint64_t v80 = (void *)v6;
  uint64_t v17 = [v16 countInteractionsUsingPredicate:v6 error:&v110];
  id v82 = v110;

  v83 = self;
  uint64_t v18 = [(_PSRuleOverlapFeedback *)self interactionStore];
  id v109 = 0;
  int v78 = (void *)v12;
  uint64_t v19 = [v18 countInteractionsUsingPredicate:v12 error:&v109];
  id v20 = v109;

  if (v15 || v82 || v20)
  {
    id v21 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v115 = v15;
      __int16 v116 = 2112;
      id v117 = v82;
      __int16 v118 = 2112;
      id v119 = v20;
      _os_log_error_impl(&dword_1A314B000, v21, OS_LOG_TYPE_ERROR, "Interaction store retrieval error. Sent messages query: %@, Recieved messages query: %@, Shares query: %@", buf, 0x20u);
    }
  }
  v76 = v20;
  v77 = v15;
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setTotalMessagesSent:[(_PSRuleOverlapFeedback *)self bucketedValue:v14]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setTotalMessagesRecieved:[(_PSRuleOverlapFeedback *)self bucketedValue:v17]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setTotalShares:[(_PSRuleOverlapFeedback *)self bucketedValue:v19]];
  v22 = [(BMBehaviorRetriever *)self->_behaviorRetriever retrieveRulesWithFilters:0];
  id v100 = [MEMORY[0x1E4F1CA80] set];
  long long v99 = [MEMORY[0x1E4F1CA80] set];
  long long v97 = [MEMORY[0x1E4F1CA80] set];
  id v95 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v93 = [MEMORY[0x1E4F1CA80] set];
  int v91 = [MEMORY[0x1E4F1CA80] set];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obj = v22;
  uint64_t v89 = [obj countByEnumeratingWithState:&v105 objects:v113 count:16];
  if (v89)
  {
    unsigned int v92 = 0;
    uint64_t v88 = 0;
    unsigned int v87 = 0;
    unsigned int v94 = 0;
    unsigned int v96 = 0;
    unsigned int v98 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v86 = *(void *)v106;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v106 != v86) {
          objc_enumerationMutation(obj);
        }
        long long v26 = *(void **)(*((void *)&v105 + 1) + 8 * v25);
        [v26 confidence];
        uint64_t v90 = v25;
        if (v27 <= 0.75)
        {
          [v26 confidence];
          if (v28 <= 0.25) {
            int v29 = v88;
          }
          else {
            int v29 = v88 + 1;
          }
          if (v28 > 0.25) {
            unsigned int v30 = v87;
          }
          else {
            unsigned int v30 = v87 + 1;
          }
          unsigned int v87 = v30;
          LODWORD(v88) = v29;
        }
        else
        {
          ++HIDWORD(v88);
        }
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        double v31 = [v26 antecedent];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v101 objects:v112 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v102;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v102 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void **)(*((void *)&v101 + 1) + 8 * i);
              uint64_t v37 = [v36 type];
              uint64_t v38 = [getBMItemTypeClass_0() interactionPhotoContact];
              int v39 = [v37 isEqual:v38];

              if (v39)
              {
                [v100 addObject:v36];
                uint64_t v24 = (v24 + 1);
              }
              else
              {
                uint64_t v40 = [v36 type];
                uint64_t v41 = [getBMItemTypeClass_0() interactionPhotoScene];
                int v42 = [v40 isEqual:v41];

                if (v42)
                {
                  [v99 addObject:v36];
                  uint64_t v23 = (v23 + 1);
                }
                else
                {
                  int v43 = [v36 type];
                  v44 = [getBMItemTypeClass_0() interactionSharingSourceBundleID];
                  int v45 = [v43 isEqual:v44];

                  if (v45)
                  {
                    [v97 addObject:v36];
                    ++v98;
                  }
                  else
                  {
                    int v46 = [v36 type];
                    uint64_t v47 = [getBMItemTypeClass_0() interactionTargetBundleID];
                    int v48 = [v46 isEqual:v47];

                    if (v48)
                    {
                      [v95 addObject:v36];
                      ++v96;
                    }
                    else
                    {
                      int v49 = [v36 type];
                      v50 = [getBMItemTypeClass_0() locationIdentifier];
                      int v51 = [v49 isEqual:v50];

                      if (v51)
                      {
                        [v93 addObject:v36];
                        ++v94;
                      }
                      else
                      {
                        int v52 = [v36 type];
                        int v53 = [getBMItemTypeClass_0() interactionExtractedTopicFromAttachment];
                        int v54 = [v52 isEqual:v53];

                        if (v54)
                        {
                          [v91 addObject:v36];
                          ++v92;
                        }
                      }
                    }
                  }
                }
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v101 objects:v112 count:16];
          }
          while (v33);
        }

        uint64_t v25 = v90 + 1;
      }
      while (v90 + 1 != v89);
      uint64_t v89 = [obj countByEnumeratingWithState:&v105 objects:v113 count:16];
    }
    while (v89);
  }
  else
  {
    unsigned int v92 = 0;
    uint64_t v88 = 0;
    unsigned int v87 = 0;
    unsigned int v94 = 0;
    unsigned int v96 = 0;
    unsigned int v98 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }

  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setLowConfidenceRuleCount:[(_PSRuleOverlapFeedback *)v83 bucketedValue:v87]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setMediumConfidenceRuleCount:[(_PSRuleOverlapFeedback *)v83 bucketedValue:v88]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setHighConfidenceRuleCount:[(_PSRuleOverlapFeedback *)v83 bucketedValue:HIDWORD(v88)]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setPhotoContactContainingRuleCount:[(_PSRuleOverlapFeedback *)v83 bucketedValue:v24]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setPhotoSceneContainingRuleCount:[(_PSRuleOverlapFeedback *)v83 bucketedValue:v23]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setSourceBundleIdContainingRuleCount:[(_PSRuleOverlapFeedback *)v83 bucketedValue:v98]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setTargetBundleIdContainingRuleCount:[(_PSRuleOverlapFeedback *)v83 bucketedValue:v96]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setLocationOfInterestContainingRuleCount:[(_PSRuleOverlapFeedback *)v83 bucketedValue:v94]];
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setTopicContainingRuleCount:[(_PSRuleOverlapFeedback *)v83 bucketedValue:v92]];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoContactRulesCardinality:](v84, "setPhotoContactRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", [v100 count]));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoSceneRulesCardinality:](v84, "setPhotoSceneRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", [v99 count]));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSourceBundleIdRulesCardinality:](v84, "setSourceBundleIdRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", [v97 count]));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTargetBundleIdRulesCardinality:](v84, "setTargetBundleIdRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", [v95 count]));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLocationOfInterestRulesCardinality:](v84, "setLocationOfInterestRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", [v93 count]));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTopicRulesCardinality:](v84, "setTopicRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", [v91 count]));
  int v55 = [v81 valueForKey:@"type"];
  id v56 = (void *)[v55 mutableCopy];

  int v57 = [getBMItemTypeClass_0() interactionUTIType];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setUtiTypeInContext:](v84, "setUtiTypeInContext:", [v56 containsObject:v57]);

  BOOL v58 = [getBMItemTypeClass_0() interactionContentURL];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setContentUrlInContext:](v84, "setContentUrlInContext:", [v56 containsObject:v58]);

  int v59 = [getBMItemTypeClass_0() interactionSharingSourceBundleID];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSourceBundleIdInContext:](v84, "setSourceBundleIdInContext:", [v56 containsObject:v59]);

  BOOL v60 = [getBMItemTypeClass_0() interactionTargetBundleID];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTargetBundleIdInContext:](v84, "setTargetBundleIdInContext:", [v56 containsObject:v60]);

  long long v61 = [getBMItemTypeClass_0() locationIdentifier];
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLOIInContext:](v84, "setLOIInContext:", [v56 containsObject:v61]);

  long long v62 = [getBMItemTypeClass_0() interactionPhotoContact];
  int v63 = [v56 containsObject:v62];

  if (v63)
  {
    long long v64 = [v81 objectsPassingTest:&__block_literal_global_557];
    uint64_t v65 = [v64 count];
  }
  else
  {
    uint64_t v65 = 0;
  }
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setPhotoContactInContext:v65];
  uint64_t v66 = [getBMItemTypeClass_0() interactionPhotoScene];
  int v67 = [v56 containsObject:v66];

  if (v67)
  {
    v68 = [v81 objectsPassingTest:&__block_literal_global_559_0];
    uint64_t v69 = [v68 count];
  }
  else
  {
    uint64_t v69 = 0;
  }
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setPhotoSceneInContext:v69];
  long long v70 = [getBMItemTypeClass_0() interactionExtractedTopicFromAttachment];
  int v71 = [v56 containsObject:v70];

  if (v71)
  {
    long long v72 = [v81 objectsPassingTest:&__block_literal_global_561];
    int v73 = [v72 count];

    BOOL v74 = v73 != 0;
  }
  else
  {
    BOOL v74 = 0;
  }
  [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)v84 setTopicInContext:v74];

  return v84;
}

- (id)contextItemsFromEvent:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v77 = v3;
  v76 = [v3 metadata];
  id v5 = [MEMORY[0x1E4F5B5E0] locationUUIDs];
  uint64_t v75 = [v76 objectForKeyedSubscript:v5];

  if (v75)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v7 = v75;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v87 objects:v98 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v88 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          BMItemClass Class = getBMItemClass();
          uint64_t v13 = [getBMItemTypeClass_0() locationIdentifier];
          uint64_t v14 = [v11 UUIDString];
          id v15 = [BMItemClass itemWithType:v13 stringValue:v14];

          if (v15) {
            [v6 addObject:v15];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v87 objects:v98 count:16];
      }
      while (v8);
    }

    [v4 unionSet:v6];
  }
  id v16 = [v77 source];
  uint64_t v17 = [v16 bundleID];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    id v19 = getBMItemClass();
    id v20 = [getBMItemTypeClass_0() interactionSharingSourceBundleID];
    id v21 = [v77 source];
    v22 = [v21 bundleID];
    uint64_t v23 = [v19 itemWithType:v20 stringValue:v22];

    if (v23) {
      [v4 addObject:v23];
    }
  }
  uint64_t v24 = [v77 startDate];
  BOOL v25 = v24 == 0;

  if (!v25)
  {
    long long v26 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    double v27 = [v77 startDate];
    double v28 = [v26 components:32 fromDate:v27];

    id v29 = getBMItemClass();
    unsigned int v30 = [getBMItemTypeClass_0() hourOfDaySlot];
    double v31 = NSNumber;
    uint64_t v32 = [v28 hour];
    uint64_t v92 = 0;
    uint64_t v93 = &v92;
    uint64_t v94 = 0x2020000000;
    uint64_t v33 = (uint64_t (*)(uint64_t))getBMHourSlotForHourOfDaySymbolLoc_ptr;
    id v95 = getBMHourSlotForHourOfDaySymbolLoc_ptr;
    if (!getBMHourSlotForHourOfDaySymbolLoc_ptr)
    {
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __getBMHourSlotForHourOfDaySymbolLoc_block_invoke;
      v91[3] = &unk_1E5ADE858;
      v91[4] = &v92;
      __getBMHourSlotForHourOfDaySymbolLoc_block_invoke((uint64_t)v91);
      uint64_t v33 = (uint64_t (*)(uint64_t))v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v33)
    {
      -[_PSBlockedHandlesCache beginSyncingWithTU]();
      __break(1u);
    }
    uint64_t v34 = [v31 numberWithInteger:v33(v32)];
    int v35 = [v29 itemWithType:v30 numberValue:v34];

    [v4 addObject:v35];
    uint64_t v36 = NSNumber;
    uint64_t v37 = [v77 startDate];
    uint64_t v38 = objc_msgSend(v36, "numberWithBool:", objc_msgSend(v26, "isDateInWeekend:", v37));

    id v39 = getBMItemClass();
    uint64_t v40 = [getBMItemTypeClass_0() isWeekend];
    uint64_t v41 = [v39 itemWithType:v40 numberValue:v38];

    if (v41)
    {
      [v4 addObject:v41];
    }
  }
  int v42 = [MEMORY[0x1E4F5B5E0] attachments];
  BOOL v74 = [v76 objectForKeyedSubscript:v42];

  if (v74)
  {
    int v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    int v73 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    id v86 = 0;
    int v45 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v73 fromData:v74 error:&v86];
    id v72 = v86;
    if (v45)
    {
      if (![v45 count])
      {
LABEL_46:

        goto LABEL_47;
      }
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      int v46 = v45;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v82 objects:v97 count:16];
      if (v47)
      {
        uint64_t v48 = *(void *)v83;
        do
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v83 != v48) {
              objc_enumerationMutation(v46);
            }
            v50 = *(void **)(*((void *)&v82 + 1) + 8 * j);
            int v51 = [v50 contentURL];
            int v52 = [v51 host];

            if (v52 && [v52 length])
            {
              id v53 = getBMItemClass();
              int v54 = [getBMItemTypeClass_0() interactionContentURL];
              int v55 = [v53 itemWithType:v54 stringValue:v52];

              if (v55) {
                [v4 addObject:v55];
              }
            }
            id v56 = [v50 UTI];
            int v57 = v56;
            if (v56 && [v56 length])
            {
              id v58 = getBMItemClass();
              int v59 = [getBMItemTypeClass_0() interactionUTIType];
              BOOL v60 = [v58 itemWithType:v59 stringValue:v57];

              if (v60) {
                [v4 addObject:v60];
              }
            }
          }
          uint64_t v47 = [v46 countByEnumeratingWithState:&v82 objects:v97 count:16];
        }
        while (v47);
      }
    }
    else
    {
      int v46 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[_PSRuleOverlapFeedback contextItemsFromEvent:]();
      }
    }

    goto LABEL_46;
  }
LABEL_47:
  long long v61 = [MEMORY[0x1E4F5B5E0] photoSuggestedContacts];
  long long v62 = [v76 objectForKeyedSubscript:v61];

  if (v62)
  {
    int v63 = +[_PSPhotoUtils candidateLocalIdentifiersFromPhotoSuggestedPeople:v62];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v78 objects:v96 count:16];
    if (v64)
    {
      uint64_t v65 = *(void *)v79;
      do
      {
        for (uint64_t k = 0; k != v64; ++k)
        {
          if (*(void *)v79 != v65) {
            objc_enumerationMutation(v63);
          }
          uint64_t v67 = *(void *)(*((void *)&v78 + 1) + 8 * k);
          id v68 = getBMItemClass();
          uint64_t v69 = [getBMItemTypeClass_0() interactionPhotoContact];
          long long v70 = [v68 itemWithType:v69 stringValue:v67];

          if (v70) {
            [v4 addObject:v70];
          }
        }
        uint64_t v64 = [v63 countByEnumeratingWithState:&v78 objects:v96 count:16];
      }
      while (v64);
    }
  }

  return v4;
}

- (int)bucketedValue:(int)a3
{
  int result = a3;
  if (a3 >= 11)
  {
    if (a3 > 0x64)
    {
      if (a3 > 0x3E7) {
        return 1000;
      }
      else {
        return a3 - (unsigned __int16)a3 % 0x64u;
      }
    }
    else
    {
      return a3 - a3 % 0xAu;
    }
  }
  return result;
}

- (id)sharesheetFeedbackEventsSinceDate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  id v5 = BiomeLibrary();
  uint64_t v6 = [v5 ShareSheet];
  id v7 = [v6 Feedback];

  uint64_t v8 = [v7 publisherWithUseCase:@"ShareSheetFeedback"];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __60___PSRuleOverlapFeedback_sharesheetFeedbackEventsSinceDate___block_invoke_570;
  uint64_t v17 = &unk_1E5AE0EC8;
  id v18 = v3;
  id v19 = v4;
  id v9 = v4;
  id v10 = v3;
  id v11 = (id)[v8 sinkWithCompletion:&__block_literal_global_569 receiveInput:&v14];
  uint64_t v12 = objc_msgSend(v9, "allObjects", v14, v15, v16, v17);

  return v12;
}

- (id)interactionStoreEventsSinceDate:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate > %@)", v5];

  [v6 addObject:v7];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", &unk_1EF6764E8];
  [v6 addObject:v8];

  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", &unk_1EF6759C0];
  [v6 addObject:v9];

  id v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
  interactionStore = self->_interactionStore;
  uint64_t v12 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:0];
  v19[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v18 = 0;
  uint64_t v14 = [(_CDInteractionStore *)interactionStore queryInteractionsUsingPredicate:v10 sortDescriptors:v13 limit:100 offset:0 error:&v18];
  id v15 = v18;

  if (v15)
  {
    id v16 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_PSRuleOverlapFeedback interactionStoreEventsSinceDate:]();
    }
  }

  return v14;
}

- (BMBehaviorRetriever)behaviorRetriever
{
  return self->_behaviorRetriever;
}

- (_PSConfidenceModelForSharing)confidenceModelForSharing
{
  return self->_confidenceModelForSharing;
}

- (void)setConfidenceModelForSharing:(id)a3
{
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void)setInteractionStore:(id)a3
{
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (NSUserDefaults)ruleOverlapFeedbackDefaults
{
  return self->_ruleOverlapFeedbackDefaults;
}

- (void)setRuleOverlapFeedbackDefaults:(id)a3
{
}

- (_PSRuleRankingMLModel)ruleRankingModel
{
  return (_PSRuleRankingMLModel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRuleRankingModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleRankingModel, 0);
  objc_storeStrong((id *)&self->_ruleOverlapFeedbackDefaults, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_confidenceModelForSharing, 0);

  objc_storeStrong((id *)&self->_behaviorRetriever, 0);
}

- (void)loggingTrainDataForContactFillerModel:(void *)a1 withMatchingInteraction:interactionRecipients:ruleRankingModel:contactPropertyCache:interactionCache:.cold.1(void *a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Number of recipients considering: %@", v4, v5, v6, v7, v8);
}

- (void)loggingTrainDataForContactFillerModel:(void *)a1 withMatchingInteraction:interactionRecipients:ruleRankingModel:contactPropertyCache:interactionCache:.cold.2(void *a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Number of behavior rules to consider for this share event: %@", v4, v5, v6, v7, v8);
}

- (void)modelAccuracyLogging:WithMatchingInteraction:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "About to log accuracy CA feedback dictionary: %@", v1, 0xCu);
}

- (void)loggingForKnowledgeStoreEvent:WithMatchingInteraction:.cold.1()
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1A314B000, v0, OS_LOG_TYPE_ERROR, "Knowledge event creation failed.", v1, 2u);
}

- (void)contextItemsFromEvent:.cold.1()
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1A314B000, v0, OS_LOG_TYPE_ERROR, "No attachments for event.", v1, 2u);
}

- (void)interactionStoreEventsSinceDate:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A314B000, v0, v1, "Unable to query interaction store: %@", v2);
}

@end