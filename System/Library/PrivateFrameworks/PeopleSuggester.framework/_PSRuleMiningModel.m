@interface _PSRuleMiningModel
- (BMBehaviorRetriever)behaviorRetriever;
- (BOOL)_PSRuleMiningIsAdaptedMLModelOK;
- (BOOL)_PSRuleMiningIsMLModelInUse;
- (BOOL)isAdaptedModelCreated;
- (BOOL)isAdaptedModelUsed;
- (NSArray)behaviorRulesConsideringInTheContext;
- (NSArray)scores;
- (NSDictionary)psConfigForAdaptableModel;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSContactResolver)contactResolver;
- (_PSRuleMiningModel)initWithKnowledgeStore:(id)a3 contactresolver:(id)a4 withConfig:(id)a5;
- (_PSRuleRankingMLModel)ruleRankingModel;
- (double)_PSRuleMiningMLModelScoreThreshold;
- (double)_PSRuleMiningModelMinRuleConfidenceForSuggestion;
- (double)_PSRuleMiningModelMinSupportForSuggestion;
- (id)extractAdaptedModelRecipeID;
- (id)filterByRegularizingRules:(id)a3 invalidatedByAnyConflictingItems:(id)a4 containingItemTypes:(id)a5;
- (id)filterByRegularizingRulesByContextOverlap:(id)a3 regulularizeItems:(id)a4 queryItems:(id)a5 regularizationConstraint:(unint64_t)a6;
- (id)shareExtensionSuggestionsFromContext:(id)a3;
- (id)suggestionArrayWithArray:(id)a3 appendingUniqueElementsByBundleIdFromArray:(id)a4;
- (id)suggestionProxiesWithPredictionContext:(id)a3 photoSuggestedPeople:(id)a4 supportedBundleIDs:(id)a5;
- (int64_t)_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions;
- (int64_t)_PSRuleMiningModelRegularizingContextOverlapConstraint;
- (void)loadMLModel;
- (void)setBehaviorRulesConsideringInTheContext:(id)a3;
- (void)setPsConfigForAdaptableModel:(id)a3;
- (void)setRuleRankingModel:(id)a3;
- (void)setScores:(id)a3;
- (void)set_PSRuleMiningIsAdaptedMLModelOK:(BOOL)a3;
- (void)set_PSRuleMiningIsMLModelInUse:(BOOL)a3;
- (void)set_PSRuleMiningMLModelScoreThreshold:(double)a3;
- (void)set_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions:(int64_t)a3;
- (void)set_PSRuleMiningModelMinRuleConfidenceForSuggestion:(double)a3;
- (void)set_PSRuleMiningModelMinSupportForSuggestion:(double)a3;
- (void)set_PSRuleMiningModelRegularizingContextOverlapConstraint:(int64_t)a3;
- (void)updateModelProperties:(id)a3;
@end

@implementation _PSRuleMiningModel

- (_PSRuleMiningModel)initWithKnowledgeStore:(id)a3 contactresolver:(id)a4 withConfig:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_PSRuleMiningModel;
  v12 = [(_PSRuleMiningModel *)&v19 init];
  if (v12)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    v13 = (void *)getBMBehaviorRetrieverClass_softClass_1;
    uint64_t v28 = getBMBehaviorRetrieverClass_softClass_1;
    if (!getBMBehaviorRetrieverClass_softClass_1)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __getBMBehaviorRetrieverClass_block_invoke_1;
      v23 = &unk_1E5ADE858;
      v24 = &v25;
      BehaviorMinerLibraryCore_1();
      Class Class = objc_getClass("BMBehaviorRetriever");
      *(void *)(v24[1] + 24) = Class;
      getBMBehaviorRetrieverClass_softClass_1 = *(void *)(v24[1] + 24);
      v13 = (void *)v26[3];
    }
    v15 = v13;
    _Block_object_dispose(&v25, 8);
    v16 = (BMBehaviorRetriever *)objc_alloc_init(v15);
    behaviorRetriever = v12->_behaviorRetriever;
    v12->_behaviorRetriever = v16;

    [(_PSRuleMiningModel *)v12 setRuleRankingModel:0];
    [(_PSRuleMiningModel *)v12 setPsConfigForAdaptableModel:0];
    [(_PSRuleMiningModel *)v12 set_PSRuleMiningIsMLModelInUse:0];
    [(_PSRuleMiningModel *)v12 set_PSRuleMiningIsAdaptedMLModelOK:0];
    [(_PSRuleMiningModel *)v12 setBehaviorRulesConsideringInTheContext:0];
    [(_PSRuleMiningModel *)v12 setScores:0];
    objc_storeStrong((id *)&v12->_knowledgeStore, a3);
    objc_storeStrong((id *)&v12->_contactResolver, a4);
  }
  [(_PSRuleMiningModel *)v12 updateModelProperties:v11];

  return v12;
}

- (void)updateModelProperties:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v15 = [v4 objectForKeyedSubscript:v6];

  v7 = [v15 objectForKeyedSubscript:@"_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions"];
  -[_PSRuleMiningModel set_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions:](self, "set_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions:", [v7 integerValue]);

  v8 = [v15 objectForKeyedSubscript:@"_PSRuleMiningModelRegularizingContextOverlapConstraint"];
  -[_PSRuleMiningModel set_PSRuleMiningModelRegularizingContextOverlapConstraint:](self, "set_PSRuleMiningModelRegularizingContextOverlapConstraint:", [v8 integerValue]);

  id v9 = [v15 objectForKeyedSubscript:@"_PSRuleMiningModelMinRuleConfidenceForSuggestion"];
  [v9 doubleValue];
  -[_PSRuleMiningModel set_PSRuleMiningModelMinRuleConfidenceForSuggestion:](self, "set_PSRuleMiningModelMinRuleConfidenceForSuggestion:");

  id v10 = [v15 objectForKeyedSubscript:@"_PSRuleMiningModelMinSupportForSuggestion"];
  [v10 doubleValue];
  -[_PSRuleMiningModel set_PSRuleMiningModelMinSupportForSuggestion:](self, "set_PSRuleMiningModelMinSupportForSuggestion:");

  id v11 = [v15 objectForKeyedSubscript:@"_PSRuleMiningIsMLModelInUse"];
  -[_PSRuleMiningModel set_PSRuleMiningIsMLModelInUse:](self, "set_PSRuleMiningIsMLModelInUse:", [v11 BOOLValue]);

  v12 = [v15 objectForKeyedSubscript:@"_PSRuleMiningIsAdaptedMLModelOK"];
  -[_PSRuleMiningModel set_PSRuleMiningIsAdaptedMLModelOK:](self, "set_PSRuleMiningIsAdaptedMLModelOK:", [v12 BOOLValue]);

  v13 = [v15 objectForKeyedSubscript:@"_PSRuleMiningMLModelScoreThreshold"];
  v14 = v13;
  if (!v13) {
    v13 = &unk_1EF6767D8;
  }
  [v13 doubleValue];
  -[_PSRuleMiningModel set_PSRuleMiningMLModelScoreThreshold:](self, "set_PSRuleMiningMLModelScoreThreshold:");
}

- (void)loadMLModel
{
  v3 = [(_PSRuleMiningModel *)self ruleRankingModel];
  if (!v3)
  {
    if (![(_PSRuleMiningModel *)self _PSRuleMiningIsMLModelInUse]) {
      return;
    }
    id v4 = [_PSRuleRankingMLModel alloc];
    id v7 = [(_PSRuleMiningModel *)self psConfigForAdaptableModel];
    BOOL v5 = [(_PSRuleMiningModel *)self _PSRuleMiningIsAdaptedMLModelOK];
    [(_PSRuleMiningModel *)self _PSRuleMiningMLModelScoreThreshold];
    v6 = -[_PSRuleRankingMLModel initWithAdaptableModelConfig:isAdaptedMLModelOK:scoreThreshold:](v4, "initWithAdaptableModelConfig:isAdaptedMLModelOK:scoreThreshold:", v7, v5);
    [(_PSRuleMiningModel *)self setRuleRankingModel:v6];

    v3 = v7;
  }
}

- (BOOL)isAdaptedModelCreated
{
  v3 = [(_PSRuleMiningModel *)self ruleRankingModel];

  if (!v3) {
    return 0;
  }
  id v4 = [(_PSRuleMiningModel *)self ruleRankingModel];
  char v5 = [v4 isAdaptedModelCreated];

  return v5;
}

- (BOOL)isAdaptedModelUsed
{
  v3 = [(_PSRuleMiningModel *)self ruleRankingModel];

  if (!v3) {
    return 0;
  }
  id v4 = [(_PSRuleMiningModel *)self ruleRankingModel];
  char v5 = [v4 isAdaptedModelUsed];

  return v5;
}

- (id)extractAdaptedModelRecipeID
{
  v3 = [(_PSRuleMiningModel *)self ruleRankingModel];

  if (v3)
  {
    id v4 = [(_PSRuleMiningModel *)self ruleRankingModel];
    char v5 = [v4 extractAdaptedModelRecipeID];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)suggestionProxiesWithPredictionContext:(id)a3 photoSuggestedPeople:(id)a4 supportedBundleIDs:(id)a5
{
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  id v144 = a3;
  id v139 = a4;
  id v147 = a5;
  v145 = self;
  [(_PSRuleMiningModel *)self loadMLModel];
  v8 = +[_PSLogging coreBehaviorChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [(_PSRuleMiningModel *)self _PSRuleMiningIsMLModelInUse];
    id v10 = "false";
    if (v9) {
      id v10 = "true";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v10;
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_INFO, "CoreBehavior - _PSRuleMiningIsMLModelInUse: %s", buf, 0xCu);
  }

  if ([(_PSRuleMiningModel *)self _PSRuleMiningIsMLModelInUse])
  {
    id v11 = [(_PSRuleMiningModel *)self ruleRankingModel];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      v13 = [(_PSRuleMiningModel *)self ruleRankingModel];
      v14 = [v13 giveModelDescription];

      id v15 = [v14 metadata];
      v16 = [v15 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
      v17 = [v16 objectForKeyedSubscript:@"mlModelVersion"];

      v18 = +[_PSLogging coreBehaviorChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v17;
        _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester ML model version: %@", buf, 0xCu);
      }

      objc_super v19 = +[_PSLogging coreBehaviorChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = NSNumber;
        uint64_t v21 = [(_PSRuleMiningModel *)v145 ruleRankingModel];
        [v21 scoreThreshold];
        v22 = objc_msgSend(v20, "numberWithDouble:");
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v22;
        _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester ML model threshold: %@", buf, 0xCu);
      }
    }
  }
  id v156 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v141 = [MEMORY[0x1E4F1CA80] set];
  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  v23 = [v144 attachments];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v185 objects:v199 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v186;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v186 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void **)(*((void *)&v185 + 1) + 8 * i);
        uint64_t v28 = [v27 contentURL];
        v29 = [v28 host];

        if (v29 && [v29 length])
        {
          id BMItemClass_0 = getBMItemClass_0();
          v31 = [getBMItemTypeClass_1() interactionContentURL];
          v32 = [BMItemClass_0 itemWithType:v31 stringValue:v29];

          if (v32) {
            [v156 addObject:v32];
          }
        }
        v33 = [v27 UTI];
        v34 = v33;
        if (v33 && [v33 length])
        {
          id v35 = getBMItemClass_0();
          v36 = [getBMItemTypeClass_1() interactionUTIType];
          v37 = [v35 itemWithType:v36 stringValue:v34];

          if (v37) {
            [v156 addObject:v37];
          }
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v185 objects:v199 count:16];
    }
    while (v24);
  }

  +[_PSPhotoUtils candidateLocalIdentifiersFromPhotoSuggestedPeople:v139];
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [obj countByEnumeratingWithState:&v181 objects:v198 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v182;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v182 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = *(void *)(*((void *)&v181 + 1) + 8 * j);
        id v42 = getBMItemClass_0();
        v43 = [getBMItemTypeClass_1() interactionPhotoContact];
        v44 = [v42 itemWithType:v43 stringValue:v41];

        if (v44) {
          [v156 addObject:v44];
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v181 objects:v198 count:16];
    }
    while (v38);
  }

  [v144 peopleInPhotoIdentifiers];
  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  id v153 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = [v153 countByEnumeratingWithState:&v177 objects:v197 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v178;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v178 != v46) {
          objc_enumerationMutation(v153);
        }
        uint64_t v48 = *(void *)(*((void *)&v177 + 1) + 8 * k);
        id v49 = getBMItemClass_0();
        v50 = [getBMItemTypeClass_1() interactionPhotoContact];
        v51 = [v49 itemWithType:v50 stringValue:v48];

        if (v51) {
          [v156 addObject:v51];
        }
      }
      uint64_t v45 = [v153 countByEnumeratingWithState:&v177 objects:v197 count:16];
    }
    while (v45);
  }

  v52 = [v144 bundleID];
  BOOL v53 = v52 == 0;

  if (!v53)
  {
    id v54 = getBMItemClass_0();
    v55 = [getBMItemTypeClass_1() interactionSharingSourceBundleID];
    v56 = [v144 bundleID];
    v57 = [v54 itemWithType:v55 stringValue:v56];

    if (v57) {
      [v156 addObject:v57];
    }
  }
  v58 = [v144 suggestionDate];
  BOOL v59 = v58 == 0;

  if (v59)
  {
    v142 = 0;
  }
  else
  {
    v60 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v61 = [v144 suggestionDate];
    v62 = [v60 components:32 fromDate:v61];

    id v63 = getBMItemClass_0();
    v64 = [getBMItemTypeClass_1() hourOfDaySlot];
    v65 = NSNumber;
    uint64_t v66 = [v62 hour];
    uint64_t v189 = 0;
    v190 = &v189;
    uint64_t v191 = 0x2020000000;
    v67 = (uint64_t (*)(uint64_t))getBMHourSlotForHourOfDaySymbolLoc_ptr_0;
    v192 = getBMHourSlotForHourOfDaySymbolLoc_ptr_0;
    if (!getBMHourSlotForHourOfDaySymbolLoc_ptr_0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getBMHourSlotForHourOfDaySymbolLoc_block_invoke_0;
      v201 = &unk_1E5ADE858;
      v202 = &v189;
      __getBMHourSlotForHourOfDaySymbolLoc_block_invoke_0((uint64_t)buf);
      v67 = (uint64_t (*)(uint64_t))v190[3];
    }
    _Block_object_dispose(&v189, 8);
    if (!v67)
    {
      -[_PSBlockedHandlesCache beginSyncingWithTU]();
      __break(1u);
    }
    v68 = [v65 numberWithInteger:v67(v66)];
    v69 = [v63 itemWithType:v64 numberValue:v68];

    [v156 addObject:v69];
    [v141 addObject:v69];
    v70 = NSNumber;
    v71 = [v144 suggestionDate];
    v72 = objc_msgSend(v70, "numberWithBool:", objc_msgSend(v60, "isDateInWeekend:", v71));

    id v73 = getBMItemClass_0();
    v74 = [getBMItemTypeClass_1() isWeekend];
    v142 = [v73 itemWithType:v74 numberValue:v72];
  }
  v155 = [MEMORY[0x1E4F1CA80] set];
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  v75 = [v144 locationUUIDs];
  uint64_t v76 = [v75 countByEnumeratingWithState:&v173 objects:v196 count:16];
  if (v76)
  {
    uint64_t v77 = *(void *)v174;
    do
    {
      for (uint64_t m = 0; m != v76; ++m)
      {
        if (*(void *)v174 != v77) {
          objc_enumerationMutation(v75);
        }
        v79 = *(void **)(*((void *)&v173 + 1) + 8 * m);
        id v80 = getBMItemClass_0();
        v81 = [getBMItemTypeClass_1() locationIdentifier];
        v82 = [v79 UUIDString];
        v83 = [v80 itemWithType:v81 stringValue:v82];

        if (v83) {
          [v155 addObject:v83];
        }
      }
      uint64_t v76 = [v75 countByEnumeratingWithState:&v173 objects:v196 count:16];
    }
    while (v76);
  }

  [v156 unionSet:v155];
  v138 = [getBMRetrievalFilterClass_1() filterWithOperand:1 inclusionOperator:0 items:v156];
  v157 = [getBMItemTypeClass_1() interactionRecipients];
  v84 = [getBMItemTypeClass_1() interactionTargetBundleID];
  v137 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v157, v84, 0);
  v136 = [getBMRetrievalFilterClass_1() filterWithOperand:2 inclusionOperator:2 types:v137];
  v135 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v138, v136, 0);
  v85 = [(_PSRuleMiningModel *)v145 behaviorRetriever];
  [(_PSRuleMiningModel *)v145 _PSRuleMiningModelMinSupportForSuggestion];
  double v87 = v86;
  [(_PSRuleMiningModel *)v145 _PSRuleMiningModelMinRuleConfidenceForSuggestion];
  v134 = [v85 retrieveRulesWithSupport:v135 confidence:v87 filters:v88];

  v89 = (void *)MEMORY[0x1E4F1CAD0];
  v90 = [getBMItemTypeClass_1() hourOfDaySlot];
  v91 = [getBMItemTypeClass_1() isWeekend];
  v92 = [getBMItemTypeClass_1() locationIdentifier];
  v93 = objc_msgSend(v89, "setWithObjects:", v90, v91, v92, 0);
  v140 = [(_PSRuleMiningModel *)v145 filterByRegularizingRules:v134 invalidatedByAnyConflictingItems:v155 containingItemTypes:v93];

  if (v142) {
    [v156 addObject:v142];
  }
  if (![(_PSRuleMiningModel *)v145 _PSRuleMiningIsMLModelInUse]
    || ([(_PSRuleMiningModel *)v145 ruleRankingModel],
        v94 = objc_claimAutoreleasedReturnValue(),
        BOOL v95 = v94 == 0,
        v94,
        v95))
  {
    v98 = [(_PSRuleMiningModel *)v145 filterByRegularizingRulesByContextOverlap:v140 regulularizeItems:v141 queryItems:v156 regularizationConstraint:[(_PSRuleMiningModel *)v145 _PSRuleMiningModelRegularizingContextOverlapConstraint]];
    v170[0] = MEMORY[0x1E4F143A8];
    v170[1] = 3221225472;
    v170[2] = __101___PSRuleMiningModel_suggestionProxiesWithPredictionContext_photoSuggestedPeople_supportedBundleIDs___block_invoke;
    v170[3] = &unk_1E5AE14E8;
    id v171 = v156;
    v172 = v145;
    v97 = [v98 sortedArrayUsingComparator:v170];
    v99 = v171;
  }
  else
  {
    [(_PSRuleMiningModel *)v145 setBehaviorRulesConsideringInTheContext:v140];
    v96 = [(_PSRuleMiningModel *)v145 ruleRankingModel];
    v97 = [v96 rankRules:v140 contextItems:v156];

    v98 = [(_PSRuleMiningModel *)v145 ruleRankingModel];
    v99 = [v98 scores];
    [(_PSRuleMiningModel *)v145 setScores:v99];
  }

  v100 = +[_PSLogging coreBehaviorChannel];
  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
  {
    v101 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v97, "count"));
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v101;
    _os_log_impl(&dword_1A314B000, v100, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester Number of Rules: %@", buf, 0xCu);
  }
  [(_PSRuleMiningModel *)v145 setBehaviorRulesConsideringInTheContext:v97];
  id v146 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v143 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v168 = 0u;
  long long v169 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  id v148 = v97;
  uint64_t v150 = [v148 countByEnumeratingWithState:&v166 objects:v195 count:16];
  if (v150)
  {
    uint64_t v149 = *(void *)v167;
    do
    {
      uint64_t v102 = 0;
      do
      {
        if (*(void *)v167 != v149)
        {
          uint64_t v103 = v102;
          objc_enumerationMutation(v148);
          uint64_t v102 = v103;
        }
        v104 = *(void **)(*((void *)&v166 + 1) + 8 * v102);
        long long v162 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        long long v165 = 0u;
        v151 = v104;
        uint64_t v152 = v102;
        v105 = [v104 consequent];
        uint64_t v106 = [v105 countByEnumeratingWithState:&v162 objects:v194 count:16];
        if (!v106)
        {
          v108 = 0;
          v107 = 0;
          goto LABEL_99;
        }
        v107 = 0;
        v108 = 0;
        uint64_t v109 = *(void *)v163;
        do
        {
          for (uint64_t n = 0; n != v106; ++n)
          {
            if (*(void *)v163 != v109) {
              objc_enumerationMutation(v105);
            }
            v111 = *(void **)(*((void *)&v162 + 1) + 8 * n);
            v112 = [v111 type];
            int v113 = [v112 isEqual:v84];

            if (v113)
            {
              uint64_t v114 = [v111 value];
              v115 = v107;
              v107 = (void *)v114;
            }
            else
            {
              v116 = [v111 type];
              int v117 = [v116 isEqual:v157];

              if (!v117) {
                continue;
              }
              uint64_t v118 = [v111 value];
              v115 = v108;
              v108 = (void *)v118;
            }
          }
          uint64_t v106 = [v105 countByEnumeratingWithState:&v162 objects:v194 count:16];
        }
        while (v106);

        if (v107 && v108 && [v147 containsObject:v107])
        {
          v105 = _PSSuggestionKey(v107, v108);
          if (([v146 containsObject:v105] & 1) == 0)
          {
            [v146 addObject:v105];
            v119 = [_PSSuggestionProxy alloc];
            v120 = [v151 description];
            v121 = (objc_class *)objc_opt_class();
            v122 = NSStringFromClass(v121);
            v123 = [(_PSSuggestionProxy *)v119 initWithBundleID:v107 interactionRecipients:v108 contactID:0 reason:v120 reasonType:v122];

            if (v123) {
              [v143 addObject:v123];
            }
          }
LABEL_99:
        }
        uint64_t v102 = v152 + 1;
      }
      while (v152 + 1 != v150);
      uint64_t v150 = [v148 countByEnumeratingWithState:&v166 objects:v195 count:16];
    }
    while (v150);
  }

  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v124 = v143;
  uint64_t v125 = [v124 countByEnumeratingWithState:&v158 objects:v193 count:16];
  if (v125)
  {
    uint64_t v126 = *(void *)v159;
    do
    {
      for (iuint64_t i = 0; ii != v125; ++ii)
      {
        if (*(void *)v159 != v126) {
          objc_enumerationMutation(v124);
        }
        v128 = *(void **)(*((void *)&v158 + 1) + 8 * ii);
        v129 = +[_PSLogging coreBehaviorChannel];
        if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
        {
          v130 = [v128 interactionRecipients];
          v131 = [v128 bundleID];
          v132 = [v128 reason];
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v130;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v131;
          *(_WORD *)&buf[22] = 2112;
          v201 = v132;
          _os_log_impl(&dword_1A314B000, v129, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester Suggestion proxy: %@ %@ %@", buf, 0x20u);
        }
      }
      uint64_t v125 = [v124 countByEnumeratingWithState:&v158 objects:v193 count:16];
    }
    while (v125);
  }

  return v124;
}

- (id)shareExtensionSuggestionsFromContext:(id)a3
{
  v96[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[_PSAppUsageUtilities sharesFromSourceToTargetBundleValues];
  uint64_t v5 = +[_PSAppUsageUtilities appUsageDurations];
  v6 = [v3 appBundleIdsToShareExtensionBundleIdsMapping];
  id v7 = [v3 bundleID];
  v67 = (void *)v5;
  v68 = (void *)v4;
  uint64_t v8 = +[_PSAppUsageUtilities mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping:v6 sourceBundleId:v7 sharesFromSourceToTargetBundle:v4 appUsageDurations:v5];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v10 = [v3 bundleID];

  if (v10)
  {
    id BMItemClass_0 = getBMItemClass_0();
    BOOL v12 = [getBMItemTypeClass_1() bundleIdOfHostOpenedShareExtension];
    v13 = [v3 bundleID];
    v14 = [BMItemClass_0 itemWithType:v12 stringValue:v13];

    if (v14) {
      [v9 addObject:v14];
    }
  }
  uint64_t v66 = (void *)v8;
  v69 = v3;
  v65 = v9;
  uint64_t v15 = [getBMRetrievalFilterClass_1() filterWithOperand:1 inclusionOperator:1 items:v9];
  id BMRetrievalFilterClass_1 = getBMRetrievalFilterClass_1();
  v17 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = [getBMItemTypeClass_1() bundleIdOfShareExtensionOpened];
  v96[0] = v18;
  objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1];
  uint64_t v20 = [v17 setWithArray:v19];
  uint64_t v21 = [BMRetrievalFilterClass_1 filterWithOperand:2 inclusionOperator:1 types:v20];

  v22 = [(_PSRuleMiningModel *)self behaviorRetriever];
  v23 = (void *)MEMORY[0x1E4F1CAD0];
  id v63 = (void *)v21;
  v64 = (void *)v15;
  v95[0] = v15;
  v95[1] = v21;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
  uint64_t v25 = [v23 setWithArray:v24];
  v26 = [v22 retrieveRulesWithFilters:v25];

  uint64_t v27 = (void *)MEMORY[0x1E4F29008];
  uint64_t v28 = NSStringFromSelector(sel_confidence);
  uint64_t v29 = [v27 sortDescriptorWithKey:v28 ascending:0];

  v30 = (void *)MEMORY[0x1E4F29008];
  v31 = NSStringFromSelector(sel_support);
  uint64_t v32 = [v30 sortDescriptorWithKey:v31 ascending:0];

  v60 = (void *)v32;
  v61 = (void *)v29;
  v94[0] = v29;
  v94[1] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
  v62 = v26;
  v34 = [v26 sortedArrayUsingDescriptors:v33];

  id v35 = +[_PSLogging coreBehaviorChannel];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
    *(_DWORD *)buf = 138412290;
    v93 = v36;
    _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_INFO, "CoreBehavior - Extension Suggester Number of Rules: %@", buf, 0xCu);
  }
  v74 = [MEMORY[0x1E4F1CA48] array];
  v37 = [MEMORY[0x1E4F1CA80] set];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v34;
  uint64_t v72 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
  if (v72)
  {
    uint64_t v71 = *(void *)v85;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v85 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v73 = v38;
        uint64_t v39 = *(void **)(*((void *)&v84 + 1) + 8 * v38);
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        v40 = [v39 consequent];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v80 objects:v90 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v81;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v81 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = [*(id *)(*((void *)&v80 + 1) + 8 * i) value];
              if (([v37 containsObject:v45] & 1) == 0)
              {
                uint64_t v46 = [_PSSuggestion alloc];
                v47 = [v39 description];
                uint64_t v48 = (objc_class *)objc_opt_class();
                id v49 = NSStringFromClass(v48);
                v50 = [(_PSSuggestion *)v46 initWithBundleID:v45 conversationIdentifier:0 groupName:0 recipients:0 reason:v47 reasonType:v49];

                if (v45) {
                  BOOL v51 = v50 == 0;
                }
                else {
                  BOOL v51 = 1;
                }
                if (!v51)
                {
                  [v37 addObject:v45];
                  [v74 addObject:v50];
                }
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v80 objects:v90 count:16];
          }
          while (v42);
        }

        uint64_t v38 = v73 + 1;
      }
      while (v73 + 1 != v72);
      uint64_t v72 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
    }
    while (v72);
  }

  v89[0] = v74;
  v89[1] = v66;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v53 = [v52 countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v77;
    v56 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v57 = 0;
      v58 = v56;
      do
      {
        if (*(void *)v77 != v55) {
          objc_enumerationMutation(v52);
        }
        v56 = [(_PSRuleMiningModel *)self suggestionArrayWithArray:v58 appendingUniqueElementsByBundleIdFromArray:*(void *)(*((void *)&v76 + 1) + 8 * v57)];

        ++v57;
        v58 = v56;
      }
      while (v54 != v57);
      uint64_t v54 = [v52 countByEnumeratingWithState:&v76 objects:v88 count:16];
    }
    while (v54);
  }
  else
  {
    v56 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v56;
}

- (id)filterByRegularizingRulesByContextOverlap:(id)a3 regulularizeItems:(id)a4 queryItems:(id)a5 regularizationConstraint:(unint64_t)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 count] && objc_msgSend(v10, "count") < a6)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v12 = [v10 valueForKey:@"type"];
    v30 = (void *)[v12 mutableCopy];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v28 = v9;
    obuint64_t j = v9;
    uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      uint64_t v29 = *(void *)v35;
      do
      {
        uint64_t v16 = 0;
        uint64_t v31 = v14;
        do
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v34 + 1) + 8 * v16);
          v18 = objc_msgSend(v17, "antecedent", v28);
          objc_super v19 = (void *)[v18 mutableCopy];

          [v19 intersectSet:v11];
          uint64_t v20 = (void *)[v19 mutableCopy];
          if ([v20 count] >= a6)
          {
            [v19 intersectSet:v10];
            if ([v19 count])
            {
              unint64_t v21 = a6;
              id v22 = v11;
              id v23 = v10;
              uint64_t v24 = [v20 valueForKey:@"type"];
              uint64_t v25 = (void *)[v24 mutableCopy];

              [v25 unionSet:v30];
              uint64_t v26 = [v25 count];
              if (v26 != [v30 count]) {
                [v32 addObject:v17];
              }

              id v10 = v23;
              id v11 = v22;
              a6 = v21;
              uint64_t v15 = v29;
              uint64_t v14 = v31;
            }
            else
            {
              [v32 addObject:v17];
            }
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v14);
    }

    id v9 = v28;
  }
  else
  {
    id v32 = v9;
  }

  return v32;
}

- (id)filterByRegularizingRules:(id)a3 invalidatedByAnyConflictingItems:(id)a4 containingItemTypes:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a4;
  id v8 = a5;
  if ([v8 count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v23 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v15 = [v14 antecedent];
          uint64_t v16 = [v15 valueForKey:@"type"];
          v17 = (void *)[v16 mutableCopy];

          uint64_t v18 = [v17 count];
          if (v18 == [v8 count])
          {
            objc_super v19 = [v14 antecedent];
            uint64_t v20 = (void *)[v19 mutableCopy];

            [v17 unionSet:v8];
            uint64_t v21 = [v17 count];
            if (v21 == [v8 count])
            {
              [v20 intersectSet:v24];
              if ([v24 count])
              {
                if ([v20 count]) {
                  [v25 addObject:v14];
                }
              }
            }
          }
          else
          {
            [v25 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }

    id v7 = v23;
  }
  else
  {
    id v25 = v7;
  }

  return v25;
}

- (id)suggestionArrayWithArray:(id)a3 appendingUniqueElementsByBundleIdFromArray:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 arrayByAddingObjectsFromArray:a4];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "bundleID", (void)v17);
        char v14 = [v6 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          [v5 addObject:v12];
          uint64_t v15 = [v12 bundleID];
          [v6 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v5;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_PSContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (NSArray)behaviorRulesConsideringInTheContext
{
  return self->_behaviorRulesConsideringInTheContext;
}

- (void)setBehaviorRulesConsideringInTheContext:(id)a3
{
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (BMBehaviorRetriever)behaviorRetriever
{
  return self->_behaviorRetriever;
}

- (int64_t)_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions
{
  return self->__PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions;
}

- (void)set_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions:(int64_t)a3
{
  self->__PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions = a3;
}

- (int64_t)_PSRuleMiningModelRegularizingContextOverlapConstraint
{
  return self->__PSRuleMiningModelRegularizingContextOverlapConstraint;
}

- (void)set_PSRuleMiningModelRegularizingContextOverlapConstraint:(int64_t)a3
{
  self->__PSRuleMiningModelRegularizingContextOverlapConstraint = a3;
}

- (double)_PSRuleMiningModelMinRuleConfidenceForSuggestion
{
  return self->__PSRuleMiningModelMinRuleConfidenceForSuggestion;
}

- (void)set_PSRuleMiningModelMinRuleConfidenceForSuggestion:(double)a3
{
  self->__PSRuleMiningModelMinRuleConfidenceForSuggestiouint64_t n = a3;
}

- (double)_PSRuleMiningModelMinSupportForSuggestion
{
  return self->__PSRuleMiningModelMinSupportForSuggestion;
}

- (void)set_PSRuleMiningModelMinSupportForSuggestion:(double)a3
{
  self->__PSRuleMiningModelMinSupportForSuggestiouint64_t n = a3;
}

- (double)_PSRuleMiningMLModelScoreThreshold
{
  return self->__PSRuleMiningMLModelScoreThreshold;
}

- (void)set_PSRuleMiningMLModelScoreThreshold:(double)a3
{
  self->__PSRuleMiningMLModelScoreThreshold = a3;
}

- (BOOL)_PSRuleMiningIsMLModelInUse
{
  return self->__PSRuleMiningIsMLModelInUse;
}

- (void)set_PSRuleMiningIsMLModelInUse:(BOOL)a3
{
  self->__PSRuleMiningIsMLModelInUse = a3;
}

- (BOOL)_PSRuleMiningIsAdaptedMLModelOK
{
  return self->__PSRuleMiningIsAdaptedMLModelOK;
}

- (void)set_PSRuleMiningIsAdaptedMLModelOK:(BOOL)a3
{
  self->__PSRuleMiningIsAdaptedMLModelOK = a3;
}

- (NSDictionary)psConfigForAdaptableModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPsConfigForAdaptableModel:(id)a3
{
}

- (_PSRuleRankingMLModel)ruleRankingModel
{
  return (_PSRuleRankingMLModel *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRuleRankingModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleRankingModel, 0);
  objc_storeStrong((id *)&self->_psConfigForAdaptableModel, 0);
  objc_storeStrong((id *)&self->_behaviorRetriever, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_behaviorRulesConsideringInTheContext, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);

  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end