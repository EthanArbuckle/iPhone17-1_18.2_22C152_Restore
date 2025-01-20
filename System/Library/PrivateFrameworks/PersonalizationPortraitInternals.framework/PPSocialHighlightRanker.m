@interface PPSocialHighlightRanker
- (PPSocialHighlightRanker)init;
- (PPSocialHighlightRanker)initWithFirstPassScorer:(id)a3 topKScorer:(id)a4 topKCount:(unsigned int)a5;
- (id)rankSocialHighlights:(id)a3 client:(id)a4 performRerank:(BOOL)a5;
- (id)rerankSocialHighlightsForTopOneResult:(id)a3 client:(id)a4;
@end

@implementation PPSocialHighlightRanker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topKScorer, 0);
  objc_storeStrong((id *)&self->_firstPassScorer, 0);
}

- (id)rankSocialHighlights:(id)a3 client:(id)a4 performRerank:(BOOL)a5
{
  BOOL v35 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v45 = [v7 count];
    __int16 v46 = 2112;
    id v47 = v8;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_INFO, "PPSocialHighlightRanker: ranking %tu social highlights for '%@'", buf, 0x16u);
  }

  v10 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  v12 = pp_social_highlights_signpost_handle();
  v13 = v12;
  unint64_t v34 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Ranker.scoreSocialHighlights", "", buf, 2u);
  }
  os_signpost_id_t spid = v11;
  id v33 = v8;

  id v14 = v7;
  v15 = v14;
  if (self)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, buf, 16, v11);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v36 + 1) + 8 * v19);
          v21 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v22 = [v20 highlightIdentifier];
            v23 = [v20 calculatedFeatures];
            *(_DWORD *)v40 = 138740227;
            v41 = v22;
            __int16 v42 = 2117;
            v43 = v23;
            _os_log_debug_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEBUG, "PPSocialHighlightRanker: %{sensitive}@ - ranking features %{sensitive}@", v40, 0x16u);
          }
          [(PPSocialHighlightScorer *)self->_firstPassScorer scoreSocialHighlight:v20];
          objc_msgSend(v20, "setFirstPassScore:");
          [(PPSocialHighlightScorer *)self->_topKScorer scoreSocialHighlight:v20];
          objc_msgSend(v20, "setTopKScore:");
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:buf count:16];
      }
      while (v17);
    }
    id v24 = v15;
  }
  else
  {
    id v24 = 0;
  }

  v25 = pp_social_highlights_signpost_handle();
  v26 = v25;
  if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v26, OS_SIGNPOST_INTERVAL_END, spid, "Ranker.scoreSocialHighlights", " enableTelemetry=YES ", buf, 2u);
  }

  v27 = [v24 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_19419];
  v28 = v27;
  if (v35)
  {
    v29 = v33;
    id v30 = [(PPSocialHighlightRanker *)self rerankSocialHighlightsForTopOneResult:v27 client:v33];
  }
  else
  {
    id v30 = v27;
    v29 = v33;
  }

  return v30;
}

- (id)rerankSocialHighlightsForTopOneResult:(id)a3 client:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v38 = (void *)MEMORY[0x1CB79D060]();
  id v7 = objc_msgSend(a4, "_pas_stringBackedByUTF8CString");
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_topKCount];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __72__PPSocialHighlightRanker_rerankSocialHighlightsForTopOneResult_client___block_invoke;
  v54[3] = &unk_1E65D9AF0;
  id v9 = v8;
  id v55 = v9;
  v56 = self;
  [v6 enumerateObjectsUsingBlock:v54];
  __int16 v42 = v6;
  v43 = (void *)[v6 mutableCopy];
  v10 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v50 + 1) + 8 * i) second];
        objc_msgSend(v10, "addIndex:", objc_msgSend(v16, "unsignedIntegerValue"));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v13);
  }

  long long v36 = v10;
  [v43 removeObjectsAtIndexes:v10];
  uint64_t v17 = [v11 count];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v37 = v11;
  obuint64_t j = [v11 reverseObjectEnumerator];
  uint64_t v44 = [obj countByEnumeratingWithState:&v46 objects:v63 count:16];
  if (v44)
  {
    uint64_t v41 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v47 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        context = (void *)MEMORY[0x1CB79D060]();
        v20 = [v19 first];
        v61[0] = @"oldRank";
        v21 = [v19 second];
        v62[0] = v21;
        v61[1] = @"newRank";
        v22 = [NSNumber numberWithUnsignedInteger:v17];
        v62[1] = v22;
        v61[2] = @"clientIdentifier";
        v23 = v7;
        id v24 = v7;
        if (!v7)
        {
          v40 = [MEMORY[0x1E4F1CA98] null];
          v23 = v40;
        }
        v62[2] = v23;
        v61[3] = @"isStarred";
        v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v20, "highlightType") == 2);
        v62[3] = v25;
        v62[4] = MEMORY[0x1E4F1CC38];
        v61[4] = @"didUprank";
        v61[5] = @"batchSize";
        v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
        v62[5] = v26;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:6];
        +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.ItemUpranked" payload:v27 inBackground:0];

        id v7 = v24;
        if (!v24) {

        }
        [v20 setIsTopKResult:1];
        [v20 topKScore];
        objc_msgSend(v20, "setScore:");
        [v43 insertObject:v20 atIndex:0];
        --v17;
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v46 objects:v63 count:16];
    }
    while (v44);
  }

  if (![v37 count])
  {
    v28 = (void *)MEMORY[0x1CB79D060]();
    v59[0] = @"clientIdentifier";
    v29 = v7;
    if (!v7)
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
    }
    v60[0] = v29;
    v60[1] = MEMORY[0x1E4F1CC28];
    v59[1] = @"didUprank";
    v59[2] = @"batchSize";
    id v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
    v60[2] = v30;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:3];
    +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.ItemUpranked" payload:v31 inBackground:0];

    if (!v7) {
    v32 = pp_social_highlights_log_handle();
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [v42 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v58 = v33;
      _os_log_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightRanker: none of the %tu highlights were eligible to be upranked.", buf, 0xCu);
    }
  }
  unint64_t v34 = (void *)[v43 copy];

  return v34;
}

- (PPSocialHighlightRanker)init
{
  v3 = +[PPSocialHighlightMLScorer sharedFirstPassInstance];
  v4 = +[PPSocialHighlightMLScorer sharedTopKInstance];
  v5 = +[PPConfiguration sharedInstance];
  id v6 = -[PPSocialHighlightRanker initWithFirstPassScorer:topKScorer:topKCount:](self, "initWithFirstPassScorer:topKScorer:topKCount:", v3, v4, [v5 socialHighlightTopKCount]);

  return v6;
}

- (PPSocialHighlightRanker)initWithFirstPassScorer:(id)a3 topKScorer:(id)a4 topKCount:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PPSocialHighlightRanker;
  id v11 = [(PPSocialHighlightRanker *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_firstPassScorer, a3);
    objc_storeStrong((id *)&v12->_topKScorer, a4);
    v12->_topKCount = a5;
  }

  return v12;
}

void __72__PPSocialHighlightRanker_rerankSocialHighlightsForTopOneResult_client___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  [v13 firstPassScore];
  objc_msgSend(v13, "setScore:");
  [v13 setIsTopKResult:0];
  [v13 topKScore];
  if (v5 > 0.0)
  {
    [v13 firstPassScore];
    if (v6 >= 0.0)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F93BB8]);
      id v8 = [NSNumber numberWithUnsignedInteger:a3];
      id v9 = (void *)[v7 initWithFirst:v13 second:v8];

      unint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_72_19410);
      unint64_t v11 = [*(id *)(a1 + 32) count];
      unint64_t v12 = *(unsigned int *)(*(void *)(a1 + 40) + 24);
      if (v11 < v12 || v10 < v12) {
        [*(id *)(a1 + 32) insertObject:v9 atIndex:v10];
      }
    }
  }
}

uint64_t __72__PPSocialHighlightRanker_rerankSocialHighlightsForTopOneResult_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v6 = (void *)MEMORY[0x1E4F89FC8];
  id v7 = [v4 first];
  [v7 topKScore];
  double v9 = v8;
  unint64_t v10 = [v5 first];
  [v10 topKScore];
  uint64_t v12 = [v6 reverseCompareDouble:v9 withDouble:v11];

  if (!v12)
  {
    id v13 = (void *)MEMORY[0x1E4F89FC8];
    objc_super v14 = [v4 first];
    [v14 score];
    double v16 = v15;
    uint64_t v17 = [v5 first];
    [v17 score];
    uint64_t v12 = [v13 reverseCompareDouble:v16 withDouble:v18];
  }
  return v12;
}

uint64_t __69__PPSocialHighlightRanker_rankSocialHighlights_client_performRerank___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  [a2 firstPassScore];
  double v7 = v6;
  [v5 firstPassScore];
  double v9 = v8;

  return [v4 reverseCompareDouble:v7 withDouble:v9];
}

@end