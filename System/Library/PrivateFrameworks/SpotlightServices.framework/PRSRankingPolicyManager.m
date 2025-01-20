@interface PRSRankingPolicyManager
+ (double)termFrequencyComponentFor:(id)a3 matchingString:(id)a4 weighted:(BOOL)a5;
+ (double)termFrequencyComponentForWord:(id)a3 inString:(id)a4;
+ (id)getSharedRankingPolicyManager;
- (BOOL)doesOrderedSpanExistWithStartingIndex:(unint64_t)a3 nextArray:(id)a4 arrayOfIndexArrays:(id)a5 level:(unint64_t)a6 currentOrderedSpan:(int64_t *)a7;
- (id)cookSQFOnClientWithServerProbabilities:(id)a3 qiCEPValues:(id)a4 localResultOrder:(id)a5 poorTextMatchCategories:(id)a6 minimumBagCEP:(double)a7 cook_sqf_topdown:(BOOL)a8 cook_sqf_fallback_qi_cep:(BOOL)a9;
- (id)cosineComponentsUsingWordMatches:(id)a3 withField:(id)a4 withCorpusCount:(double)a5 prefixVersion:(BOOL)a6;
- (void)computeNewFeaturesForProperty:(id)a3 query:(id)a4 qr_prop_query_norm_min_ordered_span:(double *)a5 qr_prop_query_norm_min_unordered_span:(double *)a6 qr_query_min_pair_dist_in_title:(double *)a7 prefix_match_norm_count:(double *)a8;
- (void)computeNewFeaturesForProperty:(id)a3 query:(id)a4 qr_prop_query_norm_min_ordered_span:(double *)a5 qr_prop_query_norm_min_unordered_span:(double *)a6 qr_query_min_pair_dist_in_title:(double *)a7 prefix_match_norm_count:(double *)a8 ordered_first_term_position:(double *)a9 prefixMatch:(BOOL)a10 queryBreakDown:(id)a11 isVirtualField:(BOOL)a12 locale:(id)a13;
- (void)computeNewFeaturesForProperty:(id)a3 query:(id)a4 qr_prop_query_norm_min_ordered_span:(double *)a5 qr_prop_query_norm_min_unordered_span:(double *)a6 qr_query_min_pair_dist_in_title:(double *)a7 prefix_match_norm_count:(double *)a8 prefixMatch:(BOOL)a9;
- (void)minimumAnyOrderSpanWithStartingIndex:(int64_t)a3 nextArray:(id)a4 arrayOfIndexArrays:(id)a5 level:(unint64_t)a6 currentAnyOrderSpan:(int64_t)a7 minimumSpan:(int64_t *)a8 minimumDistancePair:(int64_t *)a9 currentMinimumIndex:(int64_t)a10 currentMaximumIndex:(int64_t)a11;
@end

@implementation PRSRankingPolicyManager

+ (id)getSharedRankingPolicyManager
{
  if (getSharedRankingPolicyManager_onceToken != -1) {
    dispatch_once(&getSharedRankingPolicyManager_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)policyManager;
  return v2;
}

uint64_t __56__PRSRankingPolicyManager_getSharedRankingPolicyManager__block_invoke()
{
  policyManager = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (double)termFrequencyComponentFor:(id)a3 matchingString:(id)a4 weighted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new();
  unint64_t v10 = [v7 length];
  v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v35 = v8;
  v12 = [v8 componentsSeparatedByCharactersInSet:v11];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    double v15 = (double)v10;
    unint64_t v16 = (unint64_t)(double)v10;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if (v15 <= (double)(unint64_t)[v19 length]
          && !objc_msgSend(v19, "compare:options:range:", v7, 129, 0, v16))
        {
          v20 = [v9 objectForKey:v19];
          if (v20)
          {
            v21 = v20;
            v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue") + 1);
          }
          else
          {
            v22 = &unk_1F1861A78;
          }
          [v9 setObject:v22 forKey:v19];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v14);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v23 = [v9 allKeys];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v38;
    double v27 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v23);
        }
        v29 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        v30 = [v9 objectForKey:v29];
        unint64_t v31 = [v30 unsignedIntegerValue];

        double v32 = log((double)v31) + 1.0;
        if (v5)
        {
          double v33 = v32 * (double)(unint64_t)[v7 length];
          double v32 = v33 / (double)(unint64_t)[v29 length];
        }
        double v27 = v27 + v32;
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v25);
  }
  else
  {
    double v27 = 0.0;
  }

  return v27;
}

+ (double)termFrequencyComponentForWord:(id)a3 inString:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v8 = [v6 componentsSeparatedByCharactersInSet:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v10)
  {

LABEL_13:
    double v15 = 0.0;
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v18;
  double v13 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      if (!objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "compare:options:", v5, 129, (void)v17)) {
        double v13 = v13 + 1.0;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v11);

  if (v13 == 0.0) {
    goto LABEL_13;
  }
  double v15 = log(v13) + 1.0;
LABEL_14:

  return v15;
}

- (id)cosineComponentsUsingWordMatches:(id)a3 withField:(id)a4 withCorpusCount:(double)a5 prefixVersion:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  double v13 = [v10 componentsSeparatedByCharactersInSet:v12];

  if ([v13 count])
  {
    uint64_t v14 = [v9 count];
    double v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
    if (v6) {
      unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
    }
    else {
      unint64_t v16 = 0;
    }
    long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
    long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
    if (v6) {
      long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
    }
    else {
      long long v19 = 0;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __100__PRSRankingPolicyManager_cosineComponentsUsingWordMatches_withField_withCorpusCount_prefixVersion___block_invoke;
    v26[3] = &unk_1E634D828;
    double v33 = a5;
    id v27 = v17;
    BOOL v34 = v6;
    id v28 = v10;
    id v29 = v15;
    id v30 = v16;
    id v31 = v18;
    id v32 = v19;
    id v20 = v19;
    id v21 = v18;
    id v22 = v16;
    id v23 = v15;
    id v24 = v17;
    [v9 enumerateKeysAndObjectsUsingBlock:v26];
    [v11 setTermFrequencies:v23];
    [v11 setTermFrequenciesWeighted:v22];
    [v11 setInverseDocFrequencies:v24];
    [v11 setTermInverseDoc:v21];
    [v11 setTermInverseDocWeighted:v20];
    objc_msgSend(v11, "setFieldLength:", objc_msgSend(v13, "count"));
  }
  return v11;
}

void __100__PRSRankingPolicyManager_cosineComponentsUsingWordMatches_withField_withCorpusCount_prefixVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v31 = a2;
  id v5 = a3;
  [v5 doubleValue];
  if (v6 == 0.0)
  {
    double v9 = 0.0;
  }
  else
  {
    double v7 = *(double *)(a1 + 80);
    [v5 doubleValue];
    double v9 = log(v7 / v8 + 1.0);
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
  [v10 addObject:v11];

  uint64_t v12 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 88))
  {
    +[PRSRankingPolicyManager termFrequencyComponentFor:v31 matchingString:v12 weighted:0];
    double v14 = v13;
    +[PRSRankingPolicyManager termFrequencyComponentFor:v31 matchingString:*(void *)(a1 + 40) weighted:1];
    double v16 = v15;
    long long v17 = *(void **)(a1 + 48);
    long long v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
    [v17 addObject:v18];

    long long v19 = *(void **)(a1 + 56);
    id v20 = [MEMORY[0x1E4F28ED0] numberWithDouble:v16];
    [v19 addObject:v20];

    id v21 = *(void **)(a1 + 64);
    id v22 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9 * v14];
    [v21 addObject:v22];

    id v23 = *(void **)(a1 + 72);
    id v24 = (void *)MEMORY[0x1E4F28ED0];
    double v25 = v9 * v16;
  }
  else
  {
    +[PRSRankingPolicyManager termFrequencyComponentForWord:v31 inString:v12];
    double v27 = v26;
    id v28 = *(void **)(a1 + 48);
    id v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    [v28 addObject:v29];

    id v23 = *(void **)(a1 + 64);
    id v24 = (void *)MEMORY[0x1E4F28ED0];
    double v25 = v9 * v27;
  }
  id v30 = [v24 numberWithDouble:v25];
  [v23 addObject:v30];
}

- (void)minimumAnyOrderSpanWithStartingIndex:(int64_t)a3 nextArray:(id)a4 arrayOfIndexArrays:(id)a5 level:(unint64_t)a6 currentAnyOrderSpan:(int64_t)a7 minimumSpan:(int64_t *)a8 minimumDistancePair:(int64_t *)a9 currentMinimumIndex:(int64_t)a10 currentMaximumIndex:(int64_t)a11
{
  id v13 = a4;
  id v14 = a5;
  if ([v14 count] == a6)
  {
    double v15 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PRSRankingPolicyManager minimumAnyOrderSpanWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:](a6, v15);
    }
  }
  else if ([v13 count])
  {
    unint64_t v16 = 0;
    unint64_t v17 = a6 + 1;
    id v27 = v13;
    do
    {
      long long v18 = [v13 objectAtIndex:v16];
      uint64_t v19 = [v18 integerValue];

      int64_t v20 = v19 - a3;
      if (v19 - a3 < 0) {
        int64_t v20 = a3 - v19;
      }
      if (v20 < *a9) {
        *a9 = v20;
      }
      uint64_t v21 = v19 - a11;
      if (v19 <= a11) {
        int64_t v22 = a11;
      }
      else {
        int64_t v22 = v19;
      }
      if (v19 <= a11) {
        uint64_t v21 = 0;
      }
      if (a10 > v19) {
        int64_t v23 = v19;
      }
      else {
        int64_t v23 = a10;
      }
      if (a10 > v19) {
        int64_t v24 = a11;
      }
      else {
        int64_t v24 = v22;
      }
      if (a10 > v19) {
        uint64_t v21 = a10 - v19;
      }
      int64_t v25 = v21 + a7;
      if (v17 == [v14 count])
      {
        if (*a8 > v25) {
          *a8 = v25;
        }
      }
      else
      {
        double v26 = [v14 objectAtIndex:v17];
        [(PRSRankingPolicyManager *)self minimumAnyOrderSpanWithStartingIndex:v19 nextArray:v26 arrayOfIndexArrays:v14 level:v17 currentAnyOrderSpan:v25 minimumSpan:a8 minimumDistancePair:a9 currentMinimumIndex:v23 currentMaximumIndex:v24];

        id v13 = v27;
      }
      ++v16;
    }
    while ([v13 count] > v16);
  }
}

- (BOOL)doesOrderedSpanExistWithStartingIndex:(unint64_t)a3 nextArray:(id)a4 arrayOfIndexArrays:(id)a5 level:(unint64_t)a6 currentOrderedSpan:(int64_t *)a7
{
  id v12 = a4;
  id v13 = a5;
  if ([v13 count] != a6)
  {
    if (![v12 count])
    {
LABEL_7:
      BOOL v14 = 0;
      goto LABEL_10;
    }
    uint64_t v15 = 0;
    while (1)
    {
      unint64_t v16 = [v12 objectAtIndex:v15];
      unint64_t v17 = [v16 integerValue];

      if (v17 > a3) {
        break;
      }
      if ([v12 count] <= (unint64_t)++v15) {
        goto LABEL_7;
      }
    }
    *a7 += v17 - a3;
    unint64_t v18 = a6 + 1;
    if (v18 != [v13 count])
    {
      uint64_t v19 = [v13 objectAtIndex:v18];
      BOOL v14 = [(PRSRankingPolicyManager *)self doesOrderedSpanExistWithStartingIndex:v17 nextArray:v19 arrayOfIndexArrays:v13 level:v18 currentOrderedSpan:a7];

      goto LABEL_10;
    }
  }
  BOOL v14 = 1;
LABEL_10:

  return v14;
}

- (void)computeNewFeaturesForProperty:(id)a3 query:(id)a4 qr_prop_query_norm_min_ordered_span:(double *)a5 qr_prop_query_norm_min_unordered_span:(double *)a6 qr_query_min_pair_dist_in_title:(double *)a7 prefix_match_norm_count:(double *)a8
{
  uint64_t v9 = 0;
  LOBYTE(v8) = 0;
  [(PRSRankingPolicyManager *)self computeNewFeaturesForProperty:a3 query:a4 qr_prop_query_norm_min_ordered_span:a5 qr_prop_query_norm_min_unordered_span:a6 qr_query_min_pair_dist_in_title:a7 prefix_match_norm_count:&v9 prefixMatch:v8];
}

- (void)computeNewFeaturesForProperty:(id)a3 query:(id)a4 qr_prop_query_norm_min_ordered_span:(double *)a5 qr_prop_query_norm_min_unordered_span:(double *)a6 qr_query_min_pair_dist_in_title:(double *)a7 prefix_match_norm_count:(double *)a8 prefixMatch:(BOOL)a9
{
  uint64_t v21 = 0;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CA20];
  id v16 = a4;
  id v17 = a3;
  unint64_t v18 = [v15 currentLocale];
  LOBYTE(v20) = 0;
  LOBYTE(v19) = a9;
  [(PRSRankingPolicyManager *)self computeNewFeaturesForProperty:v17 query:v16 qr_prop_query_norm_min_ordered_span:a5 qr_prop_query_norm_min_unordered_span:a6 qr_query_min_pair_dist_in_title:a7 prefix_match_norm_count:a8 ordered_first_term_position:&v21 prefixMatch:v19 queryBreakDown:0 isVirtualField:v20 locale:v18];
}

- (void)computeNewFeaturesForProperty:(id)a3 query:(id)a4 qr_prop_query_norm_min_ordered_span:(double *)a5 qr_prop_query_norm_min_unordered_span:(double *)a6 qr_query_min_pair_dist_in_title:(double *)a7 prefix_match_norm_count:(double *)a8 ordered_first_term_position:(double *)a9 prefixMatch:(BOOL)a10 queryBreakDown:(id)a11 isVirtualField:(BOOL)a12 locale:(id)a13
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a11;
  id v97 = a13;
  unint64_t v78 = [v14 count];
  uint64_t v15 = objc_opt_new();
  id v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v83 = v13;
  v91 = [v13 componentsSeparatedByCharactersInSet:v16];

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  obuint64_t j = v14;
  uint64_t v88 = [obj countByEnumeratingWithState:&v118 objects:v126 count:16];
  if (v88)
  {
    uint64_t v17 = 0;
    unint64_t v98 = 0;
    v86 = v15;
    uint64_t v87 = *(void *)v119;
    char v85 = 1;
LABEL_3:
    uint64_t v18 = 0;
    uint64_t v19 = 5;
    if (v17 > 5) {
      uint64_t v19 = v17;
    }
    uint64_t v90 = v19 - v17;
    while (1)
    {
      if (*(void *)v119 != v87) {
        objc_enumerationMutation(obj);
      }
      if (v18 == v90) {
        break;
      }
      uint64_t v93 = v18;
      uint64_t v95 = v17;
      uint64_t v20 = *(void *)(*((void *)&v118 + 1) + 8 * v18);
      uint64_t v21 = objc_opt_new();
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v22 = v91;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v114 objects:v125 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v115;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v115 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v114 + 1) + 8 * i);
            if (+[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:isEqualToString:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:isEqualToString:", v27, v20)|| a10&& +[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:v27 hasPrefix:v20 locale:v97])
            {

              long long v112 = 0u;
              long long v113 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              id v28 = v22;
              uint64_t v29 = [v28 countByEnumeratingWithState:&v110 objects:v124 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = 0;
                uint64_t v32 = *(void *)v111;
                do
                {
                  for (uint64_t j = 0; j != v30; ++j)
                  {
                    if (*(void *)v111 != v32) {
                      objc_enumerationMutation(v28);
                    }
                    uint64_t v34 = *(void *)(*((void *)&v110 + 1) + 8 * j);
                    if (+[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:isEqualToString:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:isEqualToString:", v34, v20)|| a10&& +[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:v34 hasPrefix:v20 locale:v97])
                    {
                      v35 = [MEMORY[0x1E4F28ED0] numberWithInteger:v31 + j];
                      [v21 addObject:v35];

                      ++v98;
                    }
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v110 objects:v124 count:16];
                  v31 += j;
                }
                while (v30);
              }

              uint64_t v15 = v86;
              if ([v21 count]) {
                [v86 addObject:v21];
              }
              goto LABEL_33;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v114 objects:v125 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      char v85 = 0;
LABEL_33:
      uint64_t v17 = v95 + 1;

      uint64_t v18 = v93 + 1;
      if (v93 + 1 == v88)
      {
        uint64_t v88 = [obj countByEnumeratingWithState:&v118 objects:v126 count:16];
        if (v88) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v98 = 0;
    char v85 = 1;
  }

  if (![v15 count])
  {
    *a5 = 2147483650.0;
    *a6 = 2147483650.0;
    v36 = v83;
    *a8 = 2147483650.0;
    *a7 = 2147483650.0;
    *a9 = 2147483650.0;
    goto LABEL_95;
  }
  [v15 firstObject];
  uint64_t v108 = 0x7FFFFFFFLL;
  v94 = uint64_t v109 = 0x7FFFFFFFLL;
  v36 = v83;
  uint64_t v96 = [v94 count];
  if (!v96)
  {
    *a7 = (double)v108;
    *a5 = 2147483650.0;
    *a9 = 2147483650.0;
    double v72 = 2147483650.0;
    unint64_t v76 = v98;
    char v41 = v85;
    goto LABEL_91;
  }
  uint64_t v37 = 0;
  uint64_t v38 = 0x7FFFFFFFLL;
  uint64_t v39 = 0x7FFFFFFFLL;
  uint64_t v40 = 0x7FFFFFFFLL;
  char v41 = v85;
  do
  {
    uint64_t v107 = 0;
    if ((unint64_t)[v15 count] < 2)
    {
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      v55 = [v15 firstObject];
      uint64_t v56 = [v55 countByEnumeratingWithState:&v103 objects:v123 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v104;
        double v59 = 1.79769313e308;
        do
        {
          for (uint64_t k = 0; k != v57; ++k)
          {
            if (*(void *)v104 != v58) {
              objc_enumerationMutation(v55);
            }
            v61 = *(void **)(*((void *)&v103 + 1) + 8 * k);
            [v61 doubleValue];
            if (v62 < v59)
            {
              [v61 doubleValue];
              double v59 = v63;
            }
          }
          uint64_t v57 = [v55 countByEnumeratingWithState:&v103 objects:v123 count:16];
        }
        while (v57);
      }
      else
      {
        double v59 = 1.79769313e308;
      }

      uint64_t v38 = (uint64_t)v59;
      unint64_t v64 = [obj count];
      if (v41)
      {
        if (v64 == 1)
        {
          uint64_t v40 = 0;
          uint64_t v39 = 0;
          uint64_t v108 = 0;
          goto LABEL_82;
        }
LABEL_76:
        uint64_t v40 = 0;
        uint64_t v39 = 0;
        uint64_t v108 = 0x7FFFFFFFLL;
        goto LABEL_82;
      }
      if (v64 < 2) {
        goto LABEL_76;
      }
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v65 = obj;
      uint64_t v66 = [v65 countByEnumeratingWithState:&v99 objects:v122 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = 0;
        uint64_t v69 = *(void *)v100;
        do
        {
          for (uint64_t m = 0; m != v67; ++m)
          {
            if (*(void *)v100 != v69) {
              objc_enumerationMutation(v65);
            }
            v68 += [v36 localizedStandardContainsString:*(void *)(*((void *)&v99 + 1) + 8 * m)];
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v99 objects:v122 count:16];
        }
        while (v67);

        if (v68 == 1)
        {
          v71 = [v36 componentsSeparatedByString:@" "];
          uint64_t v108 = [v71 count];
        }
        uint64_t v40 = 0;
        uint64_t v39 = 0;
        uint64_t v38 = (uint64_t)v59;
      }
      else
      {

        uint64_t v40 = 0;
        uint64_t v39 = 0;
      }
    }
    else
    {
      if (v41)
      {
        long long v42 = [v94 objectAtIndexedSubscript:v37];
        uint64_t v43 = [v42 integerValue];
        long long v44 = [v15 objectAtIndex:1];
        LODWORD(v43) = [(PRSRankingPolicyManager *)self doesOrderedSpanExistWithStartingIndex:v43 nextArray:v44 arrayOfIndexArrays:v15 level:1 currentOrderedSpan:&v107];

        if (v43)
        {
          if (v40 > v107)
          {
            v45 = [v94 objectAtIndexedSubscript:v37];
            uint64_t v38 = [v45 integerValue];

            uint64_t v40 = v107;
          }
        }
      }
      if (a12)
      {
        uint64_t v89 = v40;
        uint64_t v46 = v39;
        uint64_t v47 = v38;
        v48 = [v94 objectAtIndexedSubscript:v37];
        uint64_t v49 = [v48 integerValue];
        v50 = [v15 objectAtIndex:1];
        v51 = [v94 objectAtIndexedSubscript:v37];
        uint64_t v52 = [v51 integerValue];
        v53 = [v94 objectAtIndexedSubscript:v37];
        -[PRSRankingPolicyManager minimumAnyOrderSpanWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:](self, "minimumAnyOrderSpanWithStartingIndex:nextArray:arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:", v49, v50, v15, 1, 0, &v109, &v108, v52, [v53 integerValue]);

        char v41 = v85;
        if (v85)
        {
          uint64_t v54 = v109;
          if (v46 < v109) {
            uint64_t v54 = v46;
          }
          v36 = v83;
          uint64_t v38 = v47;
          if (v46 > v109)
          {
            uint64_t v39 = v54;
LABEL_81:
            uint64_t v40 = v89;
            goto LABEL_82;
          }
          if ([obj count] == 1) {
            uint64_t v108 = 0;
          }
        }
        else
        {
          v36 = v83;
          uint64_t v38 = v47;
        }
        uint64_t v39 = v46;
        goto LABEL_81;
      }
    }
LABEL_82:
    ++v37;
  }
  while (v37 != v96);
  *a7 = (double)v108;
  double v72 = 2147483650.0;
  double v73 = (double)v78;
  double v74 = 2147483650.0;
  double v75 = 2147483650.0;
  unint64_t v76 = v98;
  if (((v40 != 0x7FFFFFFF) & v41) != 0)
  {
    double v74 = ((double)v40 + 2.0) / v73;
    double v75 = (double)v38;
  }
  *a5 = v74;
  *a9 = v75;
  if (((v39 != 0x7FFFFFFF) & v41) == 1) {
    double v72 = ((double)v39 + 2.0) / v73;
  }
LABEL_91:
  *a6 = v72;
  if (((v76 != 0) & v41) == 1) {
    double v77 = (double)(v76 / v78);
  }
  else {
    double v77 = 2147483650.0;
  }
  *a8 = v77;

LABEL_95:
}

- (id)cookSQFOnClientWithServerProbabilities:(id)a3 qiCEPValues:(id)a4 localResultOrder:(id)a5 poorTextMatchCategories:(id)a6 minimumBagCEP:(double)a7 cook_sqf_topdown:(BOOL)a8 cook_sqf_fallback_qi_cep:(BOOL)a9
{
  BOOL v46 = a8;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v48 = a4;
  id v14 = a5;
  id v15 = a6;
  v50 = objc_opt_new();
  uint64_t v54 = objc_opt_new();
  id v16 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = v14;
  uint64_t v17 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v75 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = +[PRSRankingUtilities bundleIDForCategory:*(void *)(*((void *)&v74 + 1) + 8 * i)];
        [v54 addObject:v20];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
    }
    while (v17);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v52 = v15;
  uint64_t v21 = [v52 countByEnumeratingWithState:&v70 objects:v85 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v71 != v22) {
          objc_enumerationMutation(v52);
        }
        uint64_t v24 = +[PRSRankingUtilities bundleIDForCategory:*(void *)(*((void *)&v70 + 1) + 8 * j)];
        [v16 addObject:v24];
      }
      uint64_t v21 = [v52 countByEnumeratingWithState:&v70 objects:v85 count:16];
    }
    while (v21);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v25 = [v13 allKeys];
  char v26 = 0;
  uint64_t v27 = [v25 countByEnumeratingWithState:&v66 objects:v84 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v67 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v66 + 1) + 8 * k);
        uint64_t v31 = [v13 objectForKey:v30];
        [v31 doubleValue];
        double v33 = v32;

        if (v26)
        {
          char v26 = 1;
        }
        else if ([v30 hasPrefix:@"com.apple.parsec."])
        {
          char v26 = 0;
        }
        else
        {
          char v26 = [v54 containsObject:v30];
        }
        if ([v30 hasPrefix:@"com.apple.parsec."])
        {
          uint64_t v34 = [MEMORY[0x1E4F28ED0] numberWithDouble:v33];
          [v50 setObject:v34 forKey:v30];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v66 objects:v84 count:16];
    }
    while (v27);
  }

  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  double v65 = 0.0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  if (!a9) {
    double v65 = a7;
  }
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __175__PRSRankingPolicyManager_cookSQFOnClientWithServerProbabilities_qiCEPValues_localResultOrder_poorTextMatchCategories_minimumBagCEP_cook_sqf_topdown_cook_sqf_fallback_qi_cep___block_invoke;
  v55[3] = &unk_1E634D850;
  char v62 = v26;
  id v49 = v48;
  id v56 = v49;
  v60 = v63;
  v61 = v64;
  id v35 = v50;
  id v57 = v35;
  id v51 = v13;
  id v58 = v51;
  id v36 = v16;
  id v59 = v36;
  uint64_t v37 = (void (**)(void, void, void))MEMORY[0x1C1885400](v55);
  if (v46)
  {
    uint64_t v38 = 0;
    uint64_t v39 = 1;
  }
  else
  {
    uint64_t v38 = [obj count] - 1;
    uint64_t v39 = -1;
  }
  unint64_t v40 = 0;
  char v41 = 0;
  while (v40 < [obj count])
  {
    uint64_t v42 = [v54 objectAtIndex:v38];

    ((void (**)(void, uint64_t, BOOL))v37)[2](v37, v42, !v46);
    ++v40;
    v38 += v39;
    char v41 = (void *)v42;
  }
  uint64_t v43 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v79 = v51;
    __int16 v80 = 2112;
    v81 = v54;
    __int16 v82 = 2112;
    id v83 = v35;
    _os_log_impl(&dword_1BDB2A000, v43, OS_LOG_TYPE_INFO, "[Ranking Log] Cooking SQF: Server SQF received:%@ \n Local sorted categories(desc order): %@\n Final cooked SQF dictionary: %@\n", buf, 0x20u);
  }

  id v44 = v35;
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v64, 8);

  return v44;
}

void __175__PRSRankingPolicyManager_cookSQFOnClientWithServerProbabilities_qiCEPValues_localResultOrder_poorTextMatchCategories_minimumBagCEP_cook_sqf_topdown_cook_sqf_fallback_qi_cep___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v25 = v5;
  if (!*(unsigned char *)(a1 + 80))
  {
    id v16 = *(void **)(a1 + 32);
    id v17 = v5;
    objc_msgSend(v16, "doubleValueForKey:", objc_msgSend(v17, "UTF8String"));
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    double v20 = *(double *)(v19 + 24);
    BOOL v21 = v20 > v18;
    if (a3) {
      BOOL v21 = v20 < v18;
    }
    if (v20 == 0.0)
    {
      uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
      if (v20 <= 0.0) {
        LOBYTE(v21) = 0;
      }
      if (*(double *)(v22 + 24) != 0.0 && !v21) {
        goto LABEL_25;
      }
    }
    else
    {
      if (v20 <= 0.0 || !v21) {
        goto LABEL_25;
      }
      uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
    }
    *(double *)(v22 + 24) = v18;
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
LABEL_25:
    *(void *)(v19 + 24) = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v24 = *(void **)(a1 + 40);
    id v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    id v13 = v24;
    id v14 = v12;
    id v15 = v17;
    goto LABEL_26;
  }
  double v6 = [*(id *)(a1 + 48) objectForKey:v5];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  BOOL v10 = v8 > v9;
  if (!a3) {
    BOOL v10 = v8 < v9;
  }
  if (v9 == 0.0) {
    BOOL v10 = 1;
  }
  if (v10) {
    double v9 = v8;
  }
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v9;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24);
  if ([*(id *)(a1 + 56) containsObject:v25]) {
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
  }
  uint64_t v11 = *(void **)(a1 + 40);
  id v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  id v13 = v11;
  id v14 = v12;
  id v15 = v25;
LABEL_26:
  [v13 setObject:v14 forKey:v15];
}

- (void)minimumAnyOrderSpanWithStartingIndex:(uint64_t)a1 nextArray:(NSObject *)a2 arrayOfIndexArrays:level:currentAnyOrderSpan:minimumSpan:minimumDistancePair:currentMinimumIndex:currentMaximumIndex:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "calculation exceeded max level %lu", (uint8_t *)&v2, 0xCu);
}

@end