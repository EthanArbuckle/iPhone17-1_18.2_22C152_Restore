@interface ATXLayoutGenerator
+ (id)sortLayouts:(id)a3;
- (ATXLayoutGenerator)initWithRankedSuggestions:(id)a3 layoutsToConsider:(id)a4 hyperParameters:(id)a5 suggestionDeduplicator:(id)a6;
- (double)marginalScoreForSuggestion:(id)a3 topRankingSuggestion:(id)a4;
- (double)weightForConfidenceCategory:(int64_t)a3;
- (id)generateGreedySuggestionLayoutForUILayoutType:(int64_t)a3 layoutTypesForRankedSuggestions:(id)a4 isSuggestionsWidgetLayout:(BOOL)a5;
- (id)generateLayoutToSuggestionDictionary;
- (id)generateValidLayouts;
- (id)uuidOfHighestConfidenceSuggestionFromRankedSuggestions:(id)a3 uiLayoutType:(int64_t)a4;
- (void)scoreLayout:(id)a3;
@end

@implementation ATXLayoutGenerator

- (ATXLayoutGenerator)initWithRankedSuggestions:(id)a3 layoutsToConsider:(id)a4 hyperParameters:(id)a5 suggestionDeduplicator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXLayoutGenerator;
  v15 = [(ATXLayoutGenerator *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rankedSuggestions, a3);
    objc_storeStrong((id *)&v16->_layoutsToConsider, a4);
    objc_storeStrong((id *)&v16->_hyperParameters, a5);
    objc_storeStrong((id *)&v16->_deduplicator, a6);
  }

  return v16;
}

- (id)generateValidLayouts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [(ATXLayoutGenerator *)self generateLayoutToSuggestionDictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_layoutsToConsider;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = -[ATXLayoutGenerator generateGreedySuggestionLayoutForUILayoutType:layoutTypesForRankedSuggestions:isSuggestionsWidgetLayout:](self, "generateGreedySuggestionLayoutForUILayoutType:layoutTypesForRankedSuggestions:isSuggestionsWidgetLayout:", objc_msgSend(v10, "integerValue", (void)v15), v4, 1);
        if (v11) {
          [v3 addObject:v11];
        }
        id v12 = -[ATXLayoutGenerator generateGreedySuggestionLayoutForUILayoutType:layoutTypesForRankedSuggestions:isSuggestionsWidgetLayout:](self, "generateGreedySuggestionLayoutForUILayoutType:layoutTypesForRankedSuggestions:isSuggestionsWidgetLayout:", [v10 integerValue], v4, 0);
        if (v12) {
          [v3 addObject:v12];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [(id)objc_opt_class() sortLayouts:v3];

  return v13;
}

- (id)generateLayoutToSuggestionDictionary
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_rankedSuggestions;
  uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v4;
        v5 = *(void **)(*((void *)&v29 + 1) + 8 * v4);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v6 = [v5 uiSpecification];
        uint64_t v7 = [v6 preferredLayoutConfigs];

        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "applicableLayoutType"));
              id v14 = [v3 objectForKeyedSubscript:v13];

              if (!v14)
              {
                long long v15 = objc_opt_new();
                long long v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "applicableLayoutType"));
                [v3 setObject:v15 forKeyedSubscript:v16];
              }
              long long v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "applicableLayoutType"));
              long long v18 = [v3 objectForKeyedSubscript:v17];
              [v18 addObject:v5];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v9);
        }

        uint64_t v4 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  v19 = (void *)[v3 copy];
  return v19;
}

- (id)generateGreedySuggestionLayoutForUILayoutType:(int64_t)a3 layoutTypesForRankedSuggestions:(id)a4 isSuggestionsWidgetLayout:(BOOL)a5
{
  BOOL v81 = a5;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v76 = a4;
  unint64_t v6 = 0x1E5F00000uLL;
  v77 = +[ATXSuggestionLayout minSuggestionLayoutTypesForUILayoutType:a3];
  int64_t v89 = a3;
  v90 = +[ATXSuggestionLayout maxSuggestionLayoutTypesForUILayoutType:a3];
  v88 = objc_opt_new();
  uint64_t v7 = 1;
  unint64_t v8 = 0x1E4F28000uLL;
  v91 = objc_opt_new();
  do
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:v7];
    uint64_t v10 = [v76 objectForKeyedSubscript:v9];
    unint64_t v11 = [v10 count];
    id v12 = [NSNumber numberWithUnsignedInteger:v7];
    id v13 = [v77 objectForKeyedSubscript:v12];
    unint64_t v14 = [v13 unsignedIntegerValue];

    if (v11 < v14)
    {
      v46 = __atxlog_handle_blending();
      long long v17 = v91;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = +[ATXSuggestionLayout stringFromUILayoutType:v89];
        *(_DWORD *)buf = 138412290;
        v101 = v47;
        _os_log_impl(&dword_1AE67F000, v46, OS_LOG_TYPE_DEFAULT, "Blending: Don't have enough suggestions to create UI layout %@", buf, 0xCu);
      }
      v48 = 0;
      v49 = v88;
      goto LABEL_53;
    }
    long long v15 = objc_opt_new();
    long long v16 = [NSNumber numberWithUnsignedInteger:v7];
    long long v17 = v91;
    [v91 setObject:v15 forKeyedSubscript:v16];

    ++v7;
  }
  while (v7 != 8);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  obj = self->_rankedSuggestions;
  uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v96 objects:v105 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    char v86 = 0;
    uint64_t v20 = *(void *)v97;
    int v21 = !v81;
    char v85 = 1;
    uint64_t v78 = *(void *)v97;
    while (1)
    {
      uint64_t v22 = 0;
      uint64_t v79 = v19;
      do
      {
        if (*(void *)v97 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v96 + 1) + 8 * v22);
        uint64_t v24 = (void *)MEMORY[0x1B3E6F520]();
        int v84 = [v23 isValidForSuggestionsWidget];
        if (!v84 || v81)
        {
          if ((v84 | v21) != 1) {
            goto LABEL_39;
          }
LABEL_15:
          v82 = v24;
          uint64_t v83 = v22;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v26 = [v23 uiSpecification];
          long long v27 = [v26 preferredLayoutConfigs];

          uint64_t v28 = [v27 countByEnumeratingWithState:&v92 objects:v104 count:16];
          if (!v28) {
            goto LABEL_38;
          }
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v93;
          while (2)
          {
            uint64_t v31 = 0;
LABEL_18:
            if (*(void *)v93 != v30) {
              objc_enumerationMutation(v27);
            }
            long long v32 = objc_msgSend(*(id *)(v8 + 3792), "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v92 + 1) + 8 * v31), "applicableLayoutType"));
            v33 = [v17 objectForKeyedSubscript:v32];
            unint64_t v34 = [v33 count];
            uint64_t v35 = [v90 objectForKeyedSubscript:v32];
            unint64_t v36 = [v35 unsignedIntegerValue];

            if (v34 >= v36) {
              goto LABEL_35;
            }
            v37 = [v23 executableSpecification];
            if (![v37 executableType]) {
              goto LABEL_24;
            }
            v38 = [v23 executableSpecification];
            if ([v38 executableType] == 3)
            {

LABEL_24:
              unint64_t v39 = v89;
LABEL_25:
              if ((v39 > 0x10 || ((1 << v39) & 0x10428) == 0)
                && !+[ATXSuggestionLayout isCompositeLayout:"isCompositeLayout:"])
              {
LABEL_35:
                long long v17 = v91;
                goto LABEL_36;
              }
            }
            else
            {
              v44 = [v23 executableSpecification];
              uint64_t v45 = [v44 executableType];

              unint64_t v39 = v89;
              if (v45 == 4) {
                goto LABEL_25;
              }
            }
            long long v17 = v91;
            if ([(ATXUniversalSuggestionDeduplicatorProtocol *)self->_deduplicator suggestionIsDuplicate:v23 existingSuggestions:v88])
            {
              v40 = __atxlog_handle_blending();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v101 = v23;
                _os_log_debug_impl(&dword_1AE67F000, v40, OS_LOG_TYPE_DEBUG, "Ignore duplicate prediction while building layout. Suggestion: %@", buf, 0xCu);
              }
            }
            else
            {
              v41 = [v91 objectForKeyedSubscript:v32];
              [v41 addObject:v23];

              [v88 addObject:v23];
              v85 &= v84;
              v42 = [v23 scoreSpecification];
              BOOL v43 = [v42 suggestedConfidenceCategory] > 2;

              v86 |= v43;
            }
LABEL_36:
            unint64_t v8 = 0x1E4F28000;

            if (v29 == ++v31)
            {
              uint64_t v29 = [v27 countByEnumeratingWithState:&v92 objects:v104 count:16];
              if (!v29)
              {
LABEL_38:

                unint64_t v6 = 0x1E5F00000;
                uint64_t v20 = v78;
                uint64_t v19 = v79;
                int v21 = !v81;
                uint64_t v24 = v82;
                uint64_t v22 = v83;
                goto LABEL_39;
              }
              continue;
            }
            goto LABEL_18;
          }
        }
        char v25 = [*(id *)(v6 + 1496) isCompositeLayout:v89];
        if (v84 | v21) == 1 && (v25) {
          goto LABEL_15;
        }
LABEL_39:
        ++v22;
      }
      while (v22 != v19);
      uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v96 objects:v105 count:16];
      if (!v19) {
        goto LABEL_46;
      }
    }
  }
  char v85 = 1;
  char v86 = 0;
LABEL_46:

  for (uint64_t i = 1; i != 8; ++i)
  {
    v51 = [*(id *)(v8 + 3792) numberWithUnsignedInteger:i];
    v52 = [v17 objectForKeyedSubscript:v51];
    unint64_t v53 = v8;
    unint64_t v54 = [v52 count];
    v55 = [*(id *)(v53 + 3792) numberWithUnsignedInteger:i];
    v56 = [v90 objectForKeyedSubscript:v55];
    unint64_t v57 = [v56 unsignedIntegerValue];

    if (v54 > v57) {
      goto LABEL_54;
    }
    v58 = [*(id *)(v53 + 3792) numberWithUnsignedInteger:i];
    v59 = [v17 objectForKeyedSubscript:v58];
    unint64_t v60 = [v59 count];
    v61 = [*(id *)(v53 + 3792) numberWithUnsignedInteger:i];
    v62 = [v77 objectForKeyedSubscript:v61];
    unint64_t v63 = [v62 unsignedIntegerValue];

    if (v60 < v63)
    {
LABEL_54:
      v48 = 0;
      v49 = v88;
      goto LABEL_55;
    }
    unint64_t v8 = 0x1E4F28000;
  }
  id v64 = objc_alloc(*(Class *)(v6 + 1496));
  v65 = [v17 objectForKeyedSubscript:&unk_1F0627E50];
  v66 = [v17 objectForKeyedSubscript:&unk_1F0627E68];
  v67 = [v17 objectForKeyedSubscript:&unk_1F0627E80];
  v68 = [v17 objectForKeyedSubscript:&unk_1F0627E98];
  v69 = [v17 objectForKeyedSubscript:&unk_1F0627EB0];
  v70 = [v17 objectForKeyedSubscript:&unk_1F0627EC8];
  v71 = [v17 objectForKeyedSubscript:&unk_1F0627EE0];
  v48 = (void *)[v64 initWithLayoutType:v89 oneByOneSuggestions:v65 oneByTwoSuggestions:v66 twoByTwoSuggestions:v67 oneByFourSuggestions:v68 twoByFourSuggestions:v69 fourByFourSuggestions:v70 fourByEightSuggestions:v71];

  [v48 setIsValidForSuggestionsWidget:v85 & 1];
  [v48 setConfidenceWarrantsSnappingOrNPlusOne:v86 & 1];
  v49 = v88;
  v72 = [(ATXLayoutGenerator *)self uuidOfHighestConfidenceSuggestionFromRankedSuggestions:v88 uiLayoutType:v89];
  [v48 setUuidOfHighestConfidenceSuggestion:v72];

  [(ATXLayoutGenerator *)self scoreLayout:v48];
  v46 = __atxlog_handle_blending();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v73 = +[ATXSuggestionLayout stringFromUILayoutType:v89];
    [v48 layoutScore];
    *(_DWORD *)buf = 138412546;
    v101 = v73;
    __int16 v102 = 2048;
    uint64_t v103 = v74;
    _os_log_impl(&dword_1AE67F000, v46, OS_LOG_TYPE_DEFAULT, "Blending: Created UI layout %@ (score: %.2f)", buf, 0x16u);
  }
  long long v17 = v91;
LABEL_53:

LABEL_55:
  return v48;
}

- (id)uuidOfHighestConfidenceSuggestionFromRankedSuggestions:(id)a3 uiLayoutType:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    if (a4)
    {
      uint64_t v7 = [v6 firstObject];
      unint64_t v8 = [(ATXSuggestionReranker *)v7 uuid];
    }
    else
    {
      uint64_t v7 = [[ATXSuggestionReranker alloc] initWithProactiveSuggestions:v6 hyperParameters:self->_hyperParameters];
      uint64_t v10 = [(ATXSuggestionReranker *)v7 rerankedSuggestions];
      unint64_t v11 = [v10 firstObject];
      unint64_t v8 = [v11 uuid];
    }
  }
  else
  {
    uint64_t v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXLayoutGenerator uuidOfHighestConfidenceSuggestionFromRankedSuggestions:uiLayoutType:](v9);
    }

    unint64_t v8 = objc_opt_new();
  }

  return v8;
}

- (void)scoreLayout:(id)a3
{
  id v4 = a3;
  v5 = [(NSArray *)self->_rankedSuggestions firstObject];
  if (v5)
  {
    id v6 = +[ATXSuggestionLayout minSuggestionLayoutTypesForUILayoutType:](ATXSuggestionLayout, "minSuggestionLayoutTypesForUILayoutType:", [v4 layoutType]);
    uint64_t v7 = [v6 objectForKeyedSubscript:&unk_1F0627E50];
    uint64_t v8 = [v7 unsignedIntegerValue];

    if (v8)
    {
      unint64_t v9 = 0;
      double v10 = 0.0;
      do
      {
        unint64_t v11 = [v4 oneByOneSuggestions];
        id v12 = [v11 objectAtIndexedSubscript:v9];

        [(ATXLayoutGenerator *)self marginalScoreForSuggestion:v12 topRankingSuggestion:v5];
        double v10 = v10 + v13;

        ++v9;
        unint64_t v14 = [v6 objectForKeyedSubscript:&unk_1F0627E50];
        unint64_t v15 = [v14 unsignedIntegerValue];
      }
      while (v9 < v15);
    }
    else
    {
      double v10 = 0.0;
    }
    long long v17 = [v6 objectForKeyedSubscript:&unk_1F0627E68];
    uint64_t v18 = [v17 unsignedIntegerValue];

    if (v18)
    {
      unint64_t v19 = 0;
      do
      {
        uint64_t v20 = [v4 oneByTwoSuggestions];
        int v21 = [v20 objectAtIndexedSubscript:v19];

        [(ATXLayoutGenerator *)self marginalScoreForSuggestion:v21 topRankingSuggestion:v5];
        double v10 = v10 + v22;

        ++v19;
        uint64_t v23 = [v6 objectForKeyedSubscript:&unk_1F0627E68];
        unint64_t v24 = [v23 unsignedIntegerValue];
      }
      while (v19 < v24);
    }
    char v25 = [v6 objectForKeyedSubscript:&unk_1F0627E80];
    uint64_t v26 = [v25 unsignedIntegerValue];

    if (v26)
    {
      unint64_t v27 = 0;
      do
      {
        uint64_t v28 = [v4 twoByTwoSuggestions];
        uint64_t v29 = [v28 objectAtIndexedSubscript:v27];

        [(ATXLayoutGenerator *)self marginalScoreForSuggestion:v29 topRankingSuggestion:v5];
        double v10 = v10 + v30;

        ++v27;
        uint64_t v31 = [v6 objectForKeyedSubscript:&unk_1F0627E80];
        unint64_t v32 = [v31 unsignedIntegerValue];
      }
      while (v27 < v32);
    }
    v33 = [v6 objectForKeyedSubscript:&unk_1F0627E98];
    uint64_t v34 = [v33 unsignedIntegerValue];

    if (v34)
    {
      unint64_t v35 = 0;
      do
      {
        unint64_t v36 = [v4 oneByFourSuggestions];
        v37 = [v36 objectAtIndexedSubscript:v35];

        [(ATXLayoutGenerator *)self marginalScoreForSuggestion:v37 topRankingSuggestion:v5];
        double v10 = v10 + v38;

        ++v35;
        unint64_t v39 = [v6 objectForKeyedSubscript:&unk_1F0627E98];
        unint64_t v40 = [v39 unsignedIntegerValue];
      }
      while (v35 < v40);
    }
    v41 = [v6 objectForKeyedSubscript:&unk_1F0627EB0];
    uint64_t v42 = [v41 unsignedIntegerValue];

    if (v42)
    {
      unint64_t v43 = 0;
      do
      {
        v44 = [v4 twoByFourSuggestions];
        uint64_t v45 = [v44 objectAtIndexedSubscript:v43];

        [(ATXLayoutGenerator *)self marginalScoreForSuggestion:v45 topRankingSuggestion:v5];
        double v10 = v10 + v46;

        ++v43;
        v47 = [v6 objectForKeyedSubscript:&unk_1F0627EB0];
        unint64_t v48 = [v47 unsignedIntegerValue];
      }
      while (v43 < v48);
    }
    [v4 setLayoutScore:v10];
  }
  else
  {
    long long v16 = __atxlog_handle_blending();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[ATXLayoutGenerator scoreLayout:](v16);
    }
  }
}

- (double)marginalScoreForSuggestion:(id)a3 topRankingSuggestion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 scoreSpecification];
  -[ATXLayoutGenerator weightForConfidenceCategory:](self, "weightForConfidenceCategory:", [v8 suggestedConfidenceCategory]);
  double v10 = v9 + 0.0;

  LODWORD(self) = [v7 isEqual:v6];
  double result = v10 + 1000.0;
  if (!self) {
    return v10;
  }
  return result;
}

- (double)weightForConfidenceCategory:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 100.0;
  }
  else {
    return dbl_1AE6F5680[a3];
  }
}

+ (id)sortLayouts:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a3;
  v5 = [v3 sortDescriptorWithKey:@"self.layoutScore" ascending:0];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = [v4 sortedArrayUsingDescriptors:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deduplicator, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_layoutsToConsider, 0);
  objc_storeStrong((id *)&self->_rankedSuggestions, 0);
}

- (void)uuidOfHighestConfidenceSuggestionFromRankedSuggestions:(os_log_t)log uiLayoutType:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "uuidOfHighestConfidenceSuggestionFromRankedSuggestions received empty rankedSuggestions", v1, 2u);
}

- (void)scoreLayout:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Tried to score the generated layout, but Layout Selector was unable to find the top ranked valid suggestion.", v1, 2u);
}

@end