@interface _RERuleMLElementComparator
+ (id)comparatorWithFilteringRules:(id)a3 rankingRules:(id)a4 model:(id)a5;
- (BOOL)shouldHideElement:(id)a3;
- (_RERuleMLElementComparator)initWithFilteringRules:(id)a3 rankingRules:(id)a4 model:(id)a5;
- (float)_relevanceForElement:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compareElement:(id)a3 toElement:(id)a4 level:(unint64_t)a5;
- (unint64_t)comparisonLevels;
@end

@implementation _RERuleMLElementComparator

- (_RERuleMLElementComparator)initWithFilteringRules:(id)a3 rankingRules:(id)a4 model:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)_RERuleMLElementComparator;
  v10 = [(REMLElementComparator *)&v54 initWithModel:a5];
  if (v10)
  {
    id v45 = v8;
    uint64_t v11 = [v8 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_69];
    filteringRules = v10->_filteringRules;
    v10->_filteringRules = (NSArray *)v11;

    id v44 = v9;
    uint64_t v13 = [v9 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_3];
    rankingRules = v10->_rankingRules;
    v10->_rankingRules = (NSArray *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v10->_filteringRules, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v16 = v10->_filteringRules;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v50 + 1) + 8 * i) conditionEvaluator];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v18);
    }

    uint64_t v22 = [v15 copy];
    filteringEvaluators = v10->_filteringEvaluators;
    v10->_filteringEvaluators = (NSArray *)v22;

    v24 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v10->_rankingRules, "count"));
    v25 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v10->_rankingRules, "count"));
    v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v10->_rankingRules, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v43 = v10;
    v27 = v10->_rankingRules;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          v33 = [v32 leftConditionEvaluator];
          [v24 addObject:v33];

          v34 = [v32 rightConditionEvaluator];
          [v25 addObject:v34];

          v35 = [v32 comparisonConditionEvaluator];
          [v26 addObject:v35];
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v29);
    }

    uint64_t v36 = [v24 copy];
    v10 = v43;
    leftRankingEvaluators = v43->_leftRankingEvaluators;
    v43->_leftRankingEvaluators = (NSArray *)v36;

    uint64_t v38 = [v25 copy];
    rightRankingEvaluators = v43->_rightRankingEvaluators;
    v43->_rightRankingEvaluators = (NSArray *)v38;

    uint64_t v40 = [v26 copy];
    comparisonRankingEvaluators = v43->_comparisonRankingEvaluators;
    v43->_comparisonRankingEvaluators = (NSArray *)v40;

    id v9 = v44;
    id v8 = v45;
  }

  return v10;
}

- (unint64_t)comparisonLevels
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  filteringRules = self->_filteringRules;
  rankingRules = self->_rankingRules;
  v7 = [(REMLElementComparator *)self model];
  id v8 = [v4 comparatorWithFilteringRules:filteringRules rankingRules:rankingRules model:v7];

  return v8;
}

+ (id)comparatorWithFilteringRules:(id)a3 rankingRules:(id)a4 model:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[_RERuleMLElementComparator alloc] initWithFilteringRules:v9 rankingRules:v8 model:v7];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonRankingEvaluators, 0);
  objc_storeStrong((id *)&self->_rightRankingEvaluators, 0);
  objc_storeStrong((id *)&self->_leftRankingEvaluators, 0);
  objc_storeStrong((id *)&self->_filteringEvaluators, 0);
  objc_storeStrong((id *)&self->_rankingRules, 0);
  objc_storeStrong((id *)&self->_filteringRules, 0);
}

- (float)_relevanceForElement:(id)a3
{
  id v4 = a3;
  v5 = [v4 featureMap];
  v6 = +[REFeature forcedFeature];
  int v7 = [v5 hasValueForFeature:v6];

  if (v7)
  {
    id v8 = +[REFeature forcedFeature];
    id v9 = (void *)[v5 valueForFeature:v8];
    double v11 = REDoubleValueForTaggedPointer(v9, v10);

    v12 = RELogForDomain(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_RERuleMLElementComparator _relevanceForElement:](v4);
    }

    float v13 = v11;
  }
  else
  {
    v14 = RELogForDomain(4);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[_RERuleMLElementComparator _relevanceForElement:].cold.7(v14);
    }

    v15 = RELogForDomain(4);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[_RERuleMLElementComparator _relevanceForElement:].cold.6(v4);
    }

    v16 = [(REMLElementComparator *)self model];
    uint64_t v17 = [v16 predictWithFeatures:v5];

    [v17 probability];
    float v19 = v18;
    v20 = RELogForDomain(4);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[_RERuleMLElementComparator _relevanceForElement:].cold.5(v20);
    }

    v21 = RELogForDomain(4);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[_RERuleMLElementComparator _relevanceForElement:].cold.4(v4);
    }

    uint64_t v22 = RELogForDomain(4);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[_RERuleMLElementComparator _relevanceForElement:](v4, v17);
    }

    v23 = RELogForDomain(4);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[_RERuleMLElementComparator _relevanceForElement:](v17);
    }

    float v24 = 1.0;
    if (v19 <= 1.0) {
      float v24 = v19;
    }
    if (v19 >= 0.0) {
      float v13 = v24;
    }
    else {
      float v13 = 0.0;
    }
  }
  return v13;
}

- (BOOL)shouldHideElement:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = RELogForDomain(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 identifier];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "Evaluating ShouldHideElement for %@", buf, 0xCu);
  }
  if (![(NSArray *)self->_filteringRules count])
  {
LABEL_22:
    if (_fetchedInternalBuildOnceToken_9 != -1) {
      dispatch_once(&_fetchedInternalBuildOnceToken_9, &__block_literal_global_36_1);
    }
    if (_isInternalDevice_9)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____RE_Cached_Get__ShowAllElements_block_invoke_0;
      v73 = &unk_2644BC660;
      id v74 = 0;
      if (__RE_Cached_Get__ShowAllElements_onceToken_0 != -1) {
        dispatch_once(&__RE_Cached_Get__ShowAllElements_onceToken_0, buf);
      }
      os_unfair_lock_lock(&__RE_Cached_lock__ShowAllElements_0);
      if ((__RE_Cached_hasValue__ShowAllElements_0 & 1) == 0)
      {
        char v69 = 0;
        if (RelevanceEngineLibraryCore_2())
        {
          float v24 = [soft__REEngineDefaults_1() globalDefaults];
        }
        else
        {
          float v24 = 0;
        }
        unsigned int v26 = [v24 _BOOLValueForKey:@"ShowAllElements" set:&v69];
        if (v69) {
          uint64_t v27 = v26;
        }
        else {
          uint64_t v27 = 0;
        }
        uint64_t v28 = RELogForDomain(0);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          [NSNumber numberWithBool:v27];
          v30 = id v29 = v4;
          *(_DWORD *)v70 = 138412290;
          v71 = v30;
          _os_log_impl(&dword_21E6E6000, v28, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key ShowAllElements: %@", v70, 0xCu);

          id v4 = v29;
        }

        if (v69) {
          char v31 = v27;
        }
        else {
          char v31 = 0;
        }
        __RE_Cached__ShowAllElements_0 = v31;
        __RE_Cached_hasValue__ShowAllElements_0 = 1;
      }
      os_unfair_lock_unlock(&__RE_Cached_lock__ShowAllElements_0);
      int v32 = __RE_Cached__ShowAllElements_0;

      if (v32) {
        goto LABEL_45;
      }
    }
    if (RETrainingSimulationIsCurrentlyActive())
    {
LABEL_45:
      char v25 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x223C31460]();
      v33 = [(REMLElementComparator *)self model];
      v66 = v4;
      v34 = [v4 featureMap];
      v35 = [v33 predictionSetWithFeatures:v34];

      if ([(NSArray *)self->_filteringRules count])
      {
        unint64_t v37 = 0;
        char v62 = 0;
        *(void *)&long long v36 = 138412802;
        long long v55 = v36;
        v64 = v35;
        do
        {
          uint64_t v38 = -[NSArray objectAtIndexedSubscript:](self->_filteringEvaluators, "objectAtIndexedSubscript:", v37, v55);
          v39 = [(NSArray *)self->_filteringRules objectAtIndexedSubscript:v37];
          if ([v38 needsPredictionSet])
          {
            uint64_t v40 = [v66 featureMap];
            id v67 = 0;
            int v41 = [v38 acceptsFeatureMap:v40 predictionSet:v35 explanation:&v67];
            id v42 = v67;

            if (v41)
            {
              v43 = RELogForDomain(4);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                id v44 = [v38 condition];
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v44;
                _os_log_impl(&dword_21E6E6000, v43, OS_LOG_TYPE_DEFAULT, "Evaluator with condition %@ accepts the feature map. PredictionSet is not nil.", buf, 0xCu);
              }
              id v45 = [v66 identifier];
              id v46 = v39;
              id v47 = v45;
              id v48 = v42;
              if (v48 && REMLExplanationsEnabled())
              {
                v61 = objc_alloc_init(REMLExplanationFormatter);
                uint64_t v49 = [v46 type];
                long long v50 = RELogForDomain(4);
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  long long v51 = @"Including";
                  if (v49 != 1) {
                    long long v51 = 0;
                  }
                  if (!v49) {
                    long long v51 = @"Filtering";
                  }
                  v56 = v51;
                  uint64_t v57 = [MEMORY[0x263EFFA08] setWithObject:v48];
                  long long v52 = [(REMLExplanationFormatter *)v61 descriptionFromExplanations:v57];
                  *(_DWORD *)buf = v55;
                  *(void *)&buf[4] = v56;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v47;
                  *(_WORD *)&buf[22] = 2112;
                  v73 = v52;
                  _os_log_impl(&dword_21E6E6000, v50, OS_LOG_TYPE_DEFAULT, "%@ %@ because %@", buf, 0x20u);
                }
              }

              uint64_t v53 = [v46 type];
              if (v53 == 1)
              {
                char v62 = 0;
                v35 = v64;
              }
              else
              {
                v35 = v64;
                if (!v53) {
                  char v62 = 1;
                }
              }
            }
          }
          ++v37;
        }
        while (v37 < [(NSArray *)self->_filteringRules count]);
      }
      else
      {
        char v62 = 0;
      }

      id v4 = v66;
      char v25 = v62;
    }
    goto LABEL_70;
  }
  uint64_t v7 = 0;
  id v65 = v4;
  while (1)
  {
    id v8 = [(NSArray *)self->_filteringEvaluators objectAtIndexedSubscript:v7];
    id v9 = [(NSArray *)self->_filteringRules objectAtIndexedSubscript:v7];
    if (([v8 needsPredictionSet] & 1) == 0) {
      break;
    }
LABEL_21:

    if (++v7 >= [(NSArray *)self->_filteringRules count]) {
      goto LABEL_22;
    }
  }
  v10 = [v4 featureMap];
  id v68 = 0;
  int v11 = [v8 acceptsFeatureMap:v10 predictionSet:0 explanation:&v68];
  id v12 = v68;

  if (!v11) {
    goto LABEL_20;
  }
  float v13 = RELogForDomain(4);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v8 condition];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v14;
    _os_log_impl(&dword_21E6E6000, v13, OS_LOG_TYPE_DEFAULT, "Evaluator with condition %@ accepts the feature map. PredictionSet is nil.", buf, 0xCu);
  }
  v15 = [v4 identifier];
  id v16 = v9;
  id v17 = v15;
  id v18 = v12;
  if (v18 && REMLExplanationsEnabled())
  {
    v63 = objc_alloc_init(REMLExplanationFormatter);
    uint64_t v19 = [v16 type];
    v20 = RELogForDomain(4);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = @"Including";
      if (v19 != 1) {
        v21 = 0;
      }
      if (!v19) {
        v21 = @"Filtering";
      }
      contexta = v21;
      v60 = [MEMORY[0x263EFFA08] setWithObject:v18];
      uint64_t v22 = [(REMLExplanationFormatter *)v63 descriptionFromExplanations:v60];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = contexta;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      v73 = v22;
      _os_log_impl(&dword_21E6E6000, v20, OS_LOG_TYPE_DEFAULT, "%@ %@ because %@", buf, 0x20u);
    }
  }

  uint64_t v23 = [v16 type];
  if (v23 == 1)
  {
    char v25 = 0;
    id v4 = v65;
    goto LABEL_32;
  }
  id v4 = v65;
  if (v23)
  {
LABEL_20:

    goto LABEL_21;
  }
  char v25 = 1;
LABEL_32:

LABEL_70:
  return v25 & 1;
}

- (int64_t)compareElement:(id)a3 toElement:(id)a4 level:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 != 1)
  {
    uint64_t v30 = (void *)MEMORY[0x223C31460]();
    [(_RERuleMLElementComparator *)self _relevanceForElement:v8];
    int v32 = v31;
    [(_RERuleMLElementComparator *)self _relevanceForElement:v9];
    int v34 = v33;
    LODWORD(v35) = v32;
    long long v36 = [NSNumber numberWithFloat:v35];
    LODWORD(v37) = v34;
    uint64_t v38 = [NSNumber numberWithFloat:v37];
    uint64_t v39 = [v36 compare:v38];
    if (v39 == 1) {
      int64_t v29 = 1;
    }
    else {
      int64_t v29 = -1;
    }

    if (!v39)
    {
      uint64_t v40 = [v8 identifier];
      int v41 = [v9 identifier];
      uint64_t v42 = [v40 compare:v41];

      if (v42 == 1) {
        uint64_t v43 = 1;
      }
      else {
        uint64_t v43 = -1;
      }
      if (v42) {
        int64_t v29 = v43;
      }
      else {
        int64_t v29 = 0;
      }
    }
    goto LABEL_45;
  }
  long long v51 = v8;
  if ([(NSArray *)self->_rankingRules count])
  {
    for (unint64_t i = 0; i < [(NSArray *)self->_rankingRules count]; ++i)
    {
      int v11 = [(NSArray *)self->_leftRankingEvaluators objectAtIndexedSubscript:i];
      id v12 = [(NSArray *)self->_rightRankingEvaluators objectAtIndexedSubscript:i];
      float v13 = [(NSArray *)self->_comparisonRankingEvaluators objectAtIndexedSubscript:i];
      if (([v11 needsPredictionSet] & 1) == 0 && (objc_msgSend(v12, "needsPredictionSet") & 1) == 0)
      {
        v14 = [v8 featureMap];
        id v15 = v9;
        id v16 = [v9 featureMap];
        if ([v11 acceptsFeatureMap:v14 predictionSet:0 explanation:0]
          && [v12 acceptsFeatureMap:v16 predictionSet:0 explanation:0]
          && [v13 compareFeatureMap:v14 toFeatureMap:v16])
        {
          id v47 = [(NSArray *)self->_rankingRules objectAtIndexedSubscript:i];
          int64_t v29 = [v47 order];
LABEL_50:

          id v8 = v51;
          id v9 = v15;
          goto LABEL_45;
        }
        if ([v11 acceptsFeatureMap:v16 predictionSet:0 explanation:0]
          && [v12 acceptsFeatureMap:v14 predictionSet:0 explanation:0]
          && [v13 compareFeatureMap:v16 toFeatureMap:v14])
        {
          id v47 = [(NSArray *)self->_rankingRules objectAtIndexedSubscript:i];
          uint64_t v48 = [v47 order];
          if (v48 == 1) {
            int64_t v29 = -1;
          }
          else {
            int64_t v29 = v48 != 0;
          }
          goto LABEL_50;
        }

        id v8 = v51;
        id v9 = v15;
      }
    }
  }
  id v17 = (void *)MEMORY[0x223C31460]();
  id v18 = [(REMLElementComparator *)self model];
  uint64_t v19 = [v8 featureMap];
  long long v52 = [v18 predictionSetWithFeatures:v19];

  v20 = [(REMLElementComparator *)self model];
  v21 = [v9 featureMap];
  uint64_t v22 = [v20 predictionSetWithFeatures:v21];

  if (![(NSArray *)self->_rankingRules count])
  {
    int64_t v29 = 0;
    goto LABEL_44;
  }
  uint64_t v49 = v17;
  long long v50 = v9;
  uint64_t v23 = 0;
  while (1)
  {
    float v24 = -[NSArray objectAtIndexedSubscript:](self->_leftRankingEvaluators, "objectAtIndexedSubscript:", v23, v49);
    char v25 = [(NSArray *)self->_rightRankingEvaluators objectAtIndexedSubscript:v23];
    unsigned int v26 = [(NSArray *)self->_comparisonRankingEvaluators objectAtIndexedSubscript:v23];
    if (([v24 needsPredictionSet] & 1) == 0 && !objc_msgSend(v25, "needsPredictionSet")) {
      goto LABEL_25;
    }
    uint64_t v27 = [v51 featureMap];
    uint64_t v28 = [v50 featureMap];
    if ([v24 acceptsFeatureMap:v27 predictionSet:v52 explanation:0]
      && [v25 acceptsFeatureMap:v28 predictionSet:v22 explanation:0]
      && [v26 compareFeatureMap:v27 toFeatureMap:v28])
    {
      id v44 = [(NSArray *)self->_rankingRules objectAtIndexedSubscript:v23];
      int64_t v29 = [v44 order];
      goto LABEL_42;
    }
    if ([v24 acceptsFeatureMap:v28 predictionSet:v22 explanation:0]
      && [v25 acceptsFeatureMap:v27 predictionSet:v52 explanation:0]
      && [v26 compareFeatureMap:v28 toFeatureMap:v27])
    {
      break;
    }

LABEL_25:
    if (++v23 >= [(NSArray *)self->_rankingRules count])
    {
      int64_t v29 = 0;
      goto LABEL_43;
    }
  }
  id v44 = [(NSArray *)self->_rankingRules objectAtIndexedSubscript:v23];
  uint64_t v45 = [v44 order];
  if (v45 == 1) {
    int64_t v29 = -1;
  }
  else {
    int64_t v29 = v45 != 0;
  }
LABEL_42:

LABEL_43:
  id v9 = v50;
  id v8 = v51;
  id v17 = v49;
LABEL_44:

LABEL_45:

  return v29;
}

- (void)_relevanceForElement:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_21E6E6000, v2, v3, "%@ - forced relevance %f", v4, v5, v6, v7, v8);
}

- (void)_relevanceForElement:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 explanationDescription];
  OUTLINED_FUNCTION_0_4(&dword_21E6E6000, v2, v3, "Explanation: %@", v4, v5, v6, v7, 2u);
}

- (void)_relevanceForElement:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v3 = [a1 identifier];
  [a2 bias];
  OUTLINED_FUNCTION_0_5(&dword_21E6E6000, v4, v5, "Bias for element %@ : %f", v6, v7, v8, v9, 2u);
}

- (void)_relevanceForElement:(void *)a1 .cold.4(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_21E6E6000, v2, v3, "Probability for element %@ : %f", v4, v5, v6, v7, v8);
}

- (void)_relevanceForElement:(os_log_t)log .cold.5(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E6E6000, log, OS_LOG_TYPE_DEBUG, "\n\n\n\n\n\n", v1, 2u);
}

- (void)_relevanceForElement:(void *)a1 .cold.6(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_4(&dword_21E6E6000, v2, v3, "Running prediction %@", v4, v5, v6, v7, 2u);
}

- (void)_relevanceForElement:(os_log_t)log .cold.7(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E6E6000, log, OS_LOG_TYPE_DEBUG, "\n\n", v1, 2u);
}

@end