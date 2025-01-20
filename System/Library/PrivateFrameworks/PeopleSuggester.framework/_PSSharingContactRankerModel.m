@interface _PSSharingContactRankerModel
- (BOOL)_PSSharingContactRankerMLModelInUse;
- (_CDInteractionCache)messageInteractionCache;
- (_CDInteractionCache)shareInteractionCache;
- (_CDInteractionStore)interactionStore;
- (_PSSharingContactFeatureExtraction)feaExtractionHandle;
- (_PSSharingContactRankerMLModel)sharingContactRankerMLModel;
- (_PSSharingContactRankerModel)initWithInteractionStore:(id)a3 messageInteractionCache:(id)a4 shareInteractionCache:(id)a5;
- (double)_PSSharingContactRankerMLModelScoreThreshold;
- (id)suggestionProxiesWithPredictionContext:(id)a3 supportedBundleIDs:(id)a4 behaviorRulesConsideringInTheContext:(id)a5 interactionModelSuggestions:(id)a6 ruleRankingMLModelScores:(id)a7;
- (void)loadMLModel;
- (void)setFeaExtractionHandle:(id)a3;
- (void)setMessageInteractionCache:(id)a3;
- (void)setShareInteractionCache:(id)a3;
- (void)setSharingContactRankerMLModel:(id)a3;
- (void)set_PSSharingContactRankerMLModelInUse:(BOOL)a3;
- (void)set_PSSharingContactRankerMLModelScoreThreshold:(double)a3;
- (void)updateModelProperties:(id)a3;
@end

@implementation _PSSharingContactRankerModel

- (_PSSharingContactRankerModel)initWithInteractionStore:(id)a3 messageInteractionCache:(id)a4 shareInteractionCache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(_PSSharingContactRankerModel *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interactionStore, a3);
    objc_storeStrong((id *)&v13->_messageInteractionCache, a4);
    objc_storeStrong((id *)&v13->_shareInteractionCache, a5);
    sharingContactRankerMLModel = v13->_sharingContactRankerMLModel;
    v13->_sharingContactRankerMLModel = 0;

    feaExtractionHandle = v13->_feaExtractionHandle;
    v13->_feaExtractionHandle = 0;
  }
  return v13;
}

- (void)updateModelProperties:(id)a3
{
  id v4 = a3;
  v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_PSSharingContactRankerModel updateModelProperties:](v5);
  }

  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 objectForKeyedSubscript:v7];

  id v9 = [v8 objectForKeyedSubscript:@"_PSharingContactRankerMLModelInUse"];
  -[_PSSharingContactRankerModel set_PSSharingContactRankerMLModelInUse:](self, "set_PSSharingContactRankerMLModelInUse:", [v9 BOOLValue]);

  id v10 = [v8 objectForKeyedSubscript:@"_PSSharingContactRankerMLModelScoreThreshold"];
  id v11 = v10;
  if (!v10) {
    id v10 = &unk_1EF6767E8;
  }
  [v10 doubleValue];
  -[_PSSharingContactRankerModel set_PSSharingContactRankerMLModelScoreThreshold:](self, "set_PSSharingContactRankerMLModelScoreThreshold:");
}

- (id)suggestionProxiesWithPredictionContext:(id)a3 supportedBundleIDs:(id)a4 behaviorRulesConsideringInTheContext:(id)a5 interactionModelSuggestions:(id)a6 ruleRankingMLModelScores:(id)a7
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  id v89 = a5;
  id v11 = a6;
  id v87 = a7;
  [(_PSSharingContactRankerModel *)self loadMLModel];
  v12 = [(_PSSharingContactRankerModel *)self sharingContactRankerMLModel];

  if (v12)
  {
    v13 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_PSSharingContactRankerModel suggestionProxiesWithPredictionContext:supportedBundleIDs:behaviorRulesConsideringInTheContext:interactionModelSuggestions:ruleRankingMLModelScores:](v89);
    }

    v14 = [(_PSSharingContactRankerModel *)self messageInteractionCache];
    v15 = [v14 interactions];
    v16 = [(_PSSharingContactRankerModel *)self shareInteractionCache];
    v17 = [v16 interactions];
    v18 = +[_PSContactFillerDataCollectionUtilities getListOfContactsFromCashedMessagesInteraction:v15 cashedShareInteractions:v17];

    v19 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[_PSSharingContactRankerModel suggestionProxiesWithPredictionContext:supportedBundleIDs:behaviorRulesConsideringInTheContext:interactionModelSuggestions:ruleRankingMLModelScores:](v18);
    }

    id v83 = v11;
    v85 = +[_PSContactFillerDataCollectionUtilities getInteractionModelScoreForSuggestions:v11 forInteractionRecipients:v18];
    id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obuint64_t j = v18;
    uint64_t v20 = [obj countByEnumeratingWithState:&v100 objects:v112 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v101;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v101 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v100 + 1) + 8 * i);
          v25 = [MEMORY[0x1E4F1CA60] dictionary];
          v26 = [(_PSSharingContactRankerModel *)self feaExtractionHandle];
          v27 = [obj objectForKeyedSubscript:v24];
          v28 = [v27 firstObject];
          [v26 extractFeaturesInto:v25 withPredictionContext:v88 forContactId:v24 forInteraction:v28 behaviorRulesConsideringInTheContext:v89 ruleRankingMLModelScores:v87 interactionModelScores:v85];

          [v86 addObject:v25];
          [v90 addObject:v24];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v100 objects:v112 count:16];
      }
      while (v21);
    }

    uint64_t v29 = +[_PSBehaviorRuleRankingUtilities reformatFeaturesInFeatureDictArray:v86];
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v31 = [(_PSSharingContactRankerModel *)self sharingContactRankerMLModel];
    v82 = (void *)v29;
    v32 = [v31 scoresOnFeatures:v29];

    if ([v32 count])
    {
      unint64_t v33 = 0;
      do
      {
        v34 = [v32 objectAtIndexedSubscript:v33];
        [v34 doubleValue];
        double v36 = v35;

        if (v36 != -1.0)
        {
          v37 = [(_PSSharingContactRankerModel *)self sharingContactRankerMLModel];
          [v37 scoreThreshold];
          double v39 = v38;

          if (v36 >= v39)
          {
            v40 = [_PSSharingContactRankerScoredContact alloc];
            v41 = [v90 objectAtIndexedSubscript:v33];
            v42 = [obj objectForKeyedSubscript:v41];
            v43 = [v42 firstObject];
            v44 = [(_PSSharingContactRankerScoredContact *)v40 initWithScore:v43 interaction:v36];
            [v30 addObject:v44];
          }
        }
        ++v33;
      }
      while ([v32 count] > v33);
    }
    v80 = v32;
    v81 = v30;
    v45 = [v30 sortedArrayUsingComparator:&__block_literal_global_42];
    id v84 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v96 objects:v111 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v97;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v97 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = *(void **)(*((void *)&v96 + 1) + 8 * j);
          v52 = [v51 interaction];
          v53 = [v52 bundleId];

          v54 = +[_PSConstants mobileMessagesBundleId];
          int v55 = [v53 isEqualToString:v54];

          v56 = [v51 interaction];
          v57 = v56;
          if (v55)
          {
            uint64_t v58 = [v56 domainIdentifier];
          }
          else
          {
            v59 = [v56 derivedIntentIdentifier];

            if (v59) {
              BOOL v60 = v53 == 0;
            }
            else {
              BOOL v60 = 1;
            }
            if (v60)
            {
              v61 = 0;
              goto LABEL_37;
            }
            v57 = [v51 interaction];
            uint64_t v58 = [v57 derivedIntentIdentifier];
          }
          v61 = (void *)v58;

          if (v53) {
            BOOL v62 = v61 == 0;
          }
          else {
            BOOL v62 = 1;
          }
          if (!v62)
          {
            v63 = [_PSSuggestionProxy alloc];
            v64 = (objc_class *)objc_opt_class();
            v65 = NSStringFromClass(v64);
            v66 = [(_PSSuggestionProxy *)v63 initWithBundleID:v53 interactionRecipients:v61 contactID:0 reason:@"contact ranker model" reasonType:v65];

            [v84 addObject:v66];
          }
LABEL_37:
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v96 objects:v111 count:16];
      }
      while (v48);
    }
    v79 = v46;

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v67 = v84;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v92 objects:v110 count:16];
    v69 = &off_1E5ADE000;
    if (v68)
    {
      uint64_t v70 = v68;
      uint64_t v71 = *(void *)v93;
      do
      {
        for (uint64_t k = 0; k != v70; ++k)
        {
          if (*(void *)v93 != v71) {
            objc_enumerationMutation(v67);
          }
          v73 = *(void **)(*((void *)&v92 + 1) + 8 * k);
          v74 = [v69[172] coreBehaviorChannel];
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            v75 = [v73 interactionRecipients];
            v76 = [v73 bundleID];
            v77 = [v73 reason];
            *(_DWORD *)buf = 138412802;
            v105 = v75;
            __int16 v106 = 2112;
            v107 = v76;
            __int16 v108 = 2112;
            v109 = v77;
            _os_log_impl(&dword_1A314B000, v74, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester Suggestion proxy: %@ %@ %@", buf, 0x20u);

            v69 = &off_1E5ADE000;
          }
        }
        uint64_t v70 = [v67 countByEnumeratingWithState:&v92 objects:v110 count:16];
      }
      while (v70);
    }

    id v11 = v83;
  }
  else
  {
    id v67 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v67;
}

- (void)loadMLModel
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "sharingContactRankerModel - loadMLModel", v1, 2u);
}

- (BOOL)_PSSharingContactRankerMLModelInUse
{
  return self->__PSSharingContactRankerMLModelInUse;
}

- (void)set_PSSharingContactRankerMLModelInUse:(BOOL)a3
{
  self->__PSSharingContactRankerMLModelInUse = a3;
}

- (double)_PSSharingContactRankerMLModelScoreThreshold
{
  return self->__PSSharingContactRankerMLModelScoreThreshold;
}

- (void)set_PSSharingContactRankerMLModelScoreThreshold:(double)a3
{
  self->__PSSharingContactRankerMLModelScoreThreshold = a3;
}

- (_PSSharingContactRankerMLModel)sharingContactRankerMLModel
{
  return (_PSSharingContactRankerMLModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSharingContactRankerMLModel:(id)a3
{
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (_CDInteractionCache)messageInteractionCache
{
  return self->_messageInteractionCache;
}

- (void)setMessageInteractionCache:(id)a3
{
}

- (_CDInteractionCache)shareInteractionCache
{
  return self->_shareInteractionCache;
}

- (void)setShareInteractionCache:(id)a3
{
}

- (_PSSharingContactFeatureExtraction)feaExtractionHandle
{
  return (_PSSharingContactFeatureExtraction *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFeaExtractionHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feaExtractionHandle, 0);
  objc_storeStrong((id *)&self->_shareInteractionCache, 0);
  objc_storeStrong((id *)&self->_messageInteractionCache, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);

  objc_storeStrong((id *)&self->_sharingContactRankerMLModel, 0);
}

- (void)updateModelProperties:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "sharingContactRankerModel - updateModelProperties", v1, 2u);
}

- (void)suggestionProxiesWithPredictionContext:(void *)a1 supportedBundleIDs:behaviorRulesConsideringInTheContext:interactionModelSuggestions:ruleRankingMLModelScores:.cold.1(void *a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Number of recipients considering: %@", v4, v5, v6, v7, 2u);
}

- (void)suggestionProxiesWithPredictionContext:(void *)a1 supportedBundleIDs:behaviorRulesConsideringInTheContext:interactionModelSuggestions:ruleRankingMLModelScores:.cold.2(void *a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Number of behavior rules to consider for this share event: %@", v4, v5, v6, v7, 2u);
}

@end