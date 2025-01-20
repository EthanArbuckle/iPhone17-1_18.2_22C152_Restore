@interface FCPersonalizationUtilities
+ (id)diversifyItems:(id)a3 withPreselectedItems:(id)a4 limit:(unint64_t)a5 similarityStartExpectation:(double)a6 similarityEndExpectation:(double)a7 publisherDiversificationSlope:(double)a8 publisherDiversificationYIntercept:(double)a9;
@end

@implementation FCPersonalizationUtilities

+ (id)diversifyItems:(id)a3 withPreselectedItems:(id)a4 limit:(unint64_t)a5 similarityStartExpectation:(double)a6 similarityEndExpectation:(double)a7 publisherDiversificationSlope:(double)a8 publisherDiversificationYIntercept:(double)a9
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  v17 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v26 = NSNumber;
    v27 = v17;
    v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v29 = [NSNumber numberWithUnsignedInteger:a5];
    *(_DWORD *)buf = 138412546;
    v48 = v28;
    __int16 v49 = 2112;
    v50 = v29;
    _os_log_debug_impl(&dword_1A460D000, v27, OS_LOG_TYPE_DEBUG, "Diversifying set of %@ items down to %@", buf, 0x16u);

    if (a5) {
      goto LABEL_3;
    }
  }
  else if (a5)
  {
LABEL_3:
    if ([v15 count] <= a5)
    {
      uint64_t v42 = MEMORY[0x1E4F143A8];
      uint64_t v43 = 3221225472;
      v44 = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_2;
      v45 = &unk_1E5B505B0;
      id v46 = v15;
      id v22 = v46;
      v25 = v22;
    }
    else
    {
      v18 = objc_msgSend(v15, "fc_subarrayWithMaxCount:", 10 * a5);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_4;
      aBlock[3] = &unk_1E5B50620;
      id v41 = &__block_literal_global_8;
      v19 = _Block_copy(aBlock);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_6;
      v39[3] = &__block_descriptor_48_e8_Q16__0Q8l;
      *(double *)&v39[4] = a8;
      *(double *)&v39[5] = a9;
      v20 = _Block_copy(v39);
      v21 = (void *)MEMORY[0x1E4F1C978];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_7;
      v31[3] = &unk_1E5B50700;
      id v32 = v16;
      id v33 = v18;
      id v35 = v19;
      unint64_t v36 = a5;
      double v37 = a6;
      double v38 = a7;
      id v34 = v20;
      id v22 = v18;
      id v23 = v20;
      id v24 = v19;
      v25 = objc_msgSend(v21, "fc_array:", v31);
    }
    goto LABEL_9;
  }
  v25 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_9:

  return v25;
}

id __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

double __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = objc_msgSend(v5, "fc_setByMinusingSet:", v4);
  unint64_t v7 = [v6 count];

  v8 = objc_msgSend(v5, "fc_setByIntersectingSet:", v4);

  unint64_t v9 = [v8 count];
  if (v7) {
    return (double)v9 / (double)v7;
  }
  else {
    return 1.0;
  }
}

double __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_5;
  id v16 = &unk_1E5B505F8;
  id v6 = *(id *)(a1 + 32);
  id v17 = v5;
  id v18 = v6;
  id v7 = v5;
  v8 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &v13);
  unint64_t v9 = objc_msgSend(v8, "valueForKeyPath:", @"@max.self", v13, v14, v15, v16);
  [v9 doubleValue];
  double v11 = v10;

  return v11;
}

id __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 topicIDs];
  v8 = [v3 setWithArray:v7];
  unint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  double v10 = [v6 topicIDs];

  double v11 = [v9 setWithArray:v10];
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v8, v11);
  v12 = objc_msgSend(v2, "numberWithDouble:");

  return v12;
}

unint64_t __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_6(uint64_t a1, unint64_t a2)
{
  return vcvtpd_u64_f64(*(double *)(a1 + 40) + *(double *)(a1 + 32) * (double)a2);
}

void __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__22;
  v67 = __Block_byref_object_dispose__22;
  id v68 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__22;
  v61 = __Block_byref_object_dispose__22;
  id v62 = (id)objc_opt_new();
  if (*(void *)(a1 + 32)) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F1CBF0];
  }
  [(id)v58[5] addObjectsFromArray:v3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_18;
  aBlock[3] = &unk_1E5B50668;
  v56 = &v57;
  id v55 = *(id *)(a1 + 32);
  id v35 = (uint64_t (**)(void))_Block_copy(aBlock);
  uint64_t v4 = [(id)v58[5] count];
  id v5 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v6 = [v5 mutableCopy];
    id v7 = (void *)v64[5];
    v64[5] = v6;
  }
  else
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_2_20;
    v53[3] = &unk_1E5B50690;
    v53[4] = &v57;
    v53[5] = &v63;
    objc_msgSend(v5, "fc_subarrayWithCount:result:", 1, v53);
  }
  unint64_t v9 = MEMORY[0x1E4F14500];
  *(void *)&long long v8 = 136315906;
  long long v33 = v8;
  while ((unint64_t)v35[2]() < *(void *)(a1 + 64))
  {
    double v10 = *(double *)(a1 + 72);
    double v11 = *(double *)(a1 + 80);
    unint64_t v12 = [(id)v58[5] count];
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v14 = [*(id *)(a1 + 32) count];
    uint64_t v15 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [(id)v58[5] count] + 1);
    unint64_t v16 = v35[2]();
    double v17 = v10 + (v11 - v10) * (((double)v12 + -1.0) / (double)(unint64_t)(v14 + v13));
    id v18 = (id)FCPersonalizationLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v24 = [NSNumber numberWithUnsignedInteger:v16];
      if (v16 <= 1) {
        v25 = &stru_1EF8299B8;
      }
      else {
        v25 = @"s";
      }
      v26 = objc_msgSend(NSNumber, "numberWithDouble:", v17, v33);
      v27 = [NSNumber numberWithUnsignedInteger:v15];
      *(_DWORD *)buf = 138413058;
      v70 = v24;
      __int16 v71 = 2112;
      v72 = (char *)v25;
      __int16 v73 = 2112;
      *(void *)v74 = v26;
      *(_WORD *)&v74[8] = 2112;
      *(void *)&v74[10] = v27;
      _os_log_debug_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEBUG, "%@ item%@ chosen so far, our similarity threshold is %@ and our unique publisher requirement is %@", buf, 0x2Au);
    }
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v45 = 0;
    id v46 = &v45;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0x7FEFFFFFFFFFFFFFLL;
    v19 = (void *)v64[5];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_28;
    v36[3] = &unk_1E5B506D8;
    id v37 = *(id *)(a1 + 56);
    double v38 = &v57;
    v39 = v44;
    v40 = &v45;
    double v43 = v17;
    id v41 = &v49;
    uint64_t v42 = v15;
    [v19 enumerateObjectsUsingBlock:v36];
    uint64_t v20 = v50[3];
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = v46[3];
      v50[3] = v20;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)[[NSString alloc] initWithFormat:@"Didn't find a candidate, this should be impossible"];
          *(_DWORD *)buf = v33;
          v70 = "+[FCPersonalizationUtilities diversifyItems:withPreselectedItems:limit:similarityStartExpectation:simila"
                "rityEndExpectation:publisherDiversificationSlope:publisherDiversificationYIntercept:]_block_invoke";
          __int16 v71 = 2080;
          v72 = "FCPersonalizationUtilities.m";
          __int16 v73 = 1024;
          *(_DWORD *)v74 = 228;
          *(_WORD *)&v74[4] = 2114;
          *(void *)&v74[6] = v31;
          _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        uint64_t v20 = v50[3];
      }
    }
    id v22 = objc_msgSend((id)v64[5], "objectAtIndex:", v20, v33);
    [(id)v64[5] removeObjectAtIndex:v50[3]];
    [(id)v58[5] addObject:v22];
    id v23 = (id)FCPersonalizationLog;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v28 = [NSNumber numberWithUnsignedInteger:v50[3]];
      v29 = [NSNumber numberWithUnsignedInteger:v35[2]()];
      v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v64[5], "count"));
      *(_DWORD *)buf = 138412802;
      v70 = v28;
      __int16 v71 = 2112;
      v72 = v29;
      __int16 v73 = 2112;
      *(void *)v74 = v30;
      _os_log_debug_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEBUG, "Candidate added from index %@, we have now chosen %@ candidates and have %@ remaining in our candidate pool", buf, 0x20u);
    }
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
  }
  id v32 = objc_msgSend((id)v58[5], "fc_subarrayFromIndex:inclusive:", objc_msgSend(*(id *)(a1 + 32), "count"), 1);
  [v34 addObjectsFromArray:v32];

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);
}

uint64_t __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  return v2 - [*(id *)(a1 + 32) count];
}

void __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_2_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = a3;
  [v5 addObjectsFromArray:a2];
  uint64_t v7 = [v6 mutableCopy];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_28(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  unint64_t v9 = *(double (**)(uint64_t, id, uint64_t))(v7 + 16);
  id v10 = a2;
  double v11 = v9(v7, v10, v8);
  unint64_t v12 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    id v32 = NSNumber;
    long long v33 = v12;
    id v34 = [v32 numberWithDouble:v11];
    id v35 = [NSNumber numberWithUnsignedInteger:a3];
    int v43 = 138412546;
    v44 = v34;
    __int16 v45 = 2112;
    id v46 = v35;
    _os_log_debug_impl(&dword_1A460D000, v33, OS_LOG_TYPE_DEBUG, "Found similarity value of %@ for candidate at index %@", (uint8_t *)&v43, 0x16u);
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v11 < *(double *)(v13 + 24))
  {
    uint64_t v14 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v36 = NSNumber;
      id v37 = v14;
      double v38 = [v36 numberWithDouble:v11];
      int v43 = 138412290;
      v44 = v38;
      _os_log_debug_impl(&dword_1A460D000, v37, OS_LOG_TYPE_DEBUG, "Similarity value %@ is our new lowest similarity value we have found so far", (uint8_t *)&v43, 0xCu);

      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    *(double *)(v13 + 24) = v11;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  }
  uint64_t v15 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "fc_arrayByTransformingWithBlock:", &__block_literal_global_32_0);
  unint64_t v16 = [v10 publisherID];

  if (v16) {
    double v17 = v16;
  }
  else {
    double v17 = @"unknown+publisher+id";
  }
  id v18 = [v15 arrayByAddingObject:v17];
  unint64_t v19 = objc_msgSend(v18, "fc_uniqueCount");

  if (v19 >= *(void *)(a1 + 72))
  {
    double v25 = *(double *)(a1 + 80);
    v26 = (void *)FCPersonalizationLog;
    BOOL v27 = os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG);
    if (v11 <= v25)
    {
      if (v27)
      {
        v39 = NSNumber;
        v40 = v26;
        id v41 = [v39 numberWithDouble:v11];
        uint64_t v42 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
        int v43 = 138412546;
        v44 = v41;
        __int16 v45 = 2112;
        id v46 = v42;
        _os_log_debug_impl(&dword_1A460D000, v40, OS_LOG_TYPE_DEBUG, "Similarity value %@ satisified our threshold of %@ and has been chosen", (uint8_t *)&v43, 0x16u);
      }
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
      *a4 = 1;
    }
    else if (v27)
    {
      v28 = NSNumber;
      v29 = v26;
      v30 = [v28 numberWithDouble:v11];
      v31 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
      int v43 = 138412546;
      v44 = v30;
      __int16 v45 = 2112;
      id v46 = v31;
      _os_log_debug_impl(&dword_1A460D000, v29, OS_LOG_TYPE_DEBUG, "Similarity value %@ did not satisify our threshold of %@ and has not been chosen", (uint8_t *)&v43, 0x16u);
    }
  }
  else
  {
    uint64_t v20 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      v21 = NSNumber;
      id v22 = v20;
      id v23 = [v21 numberWithUnsignedInteger:v19];
      id v24 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
      int v43 = 138412546;
      v44 = v23;
      __int16 v45 = 2112;
      id v46 = v24;
      _os_log_debug_impl(&dword_1A460D000, v22, OS_LOG_TYPE_DEBUG, "If we chose this item our unique publisher count would be %@ which doesn't satisfy our requirement of %@", (uint8_t *)&v43, 0x16u);
    }
  }
}

uint64_t __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_29(uint64_t a1, void *a2)
{
  return [a2 publisherID];
}

@end