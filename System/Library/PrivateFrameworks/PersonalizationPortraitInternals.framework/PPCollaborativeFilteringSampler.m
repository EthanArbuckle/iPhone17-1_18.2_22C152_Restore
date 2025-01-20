@interface PPCollaborativeFilteringSampler
- (BOOL)constructAndSendMessageForSamplingRate:(double)a3 shouldContinueBlock:(id)a4 error:(id *)a5;
- (PPCollaborativeFilteringSampler)init;
- (PPCollaborativeFilteringSampler)initWithSamplingWeightTrie:(id)a3;
- (id)_weightedSampleFeedbackItems:(id)a3;
- (unsigned)_probabilityForItemString:(id)a3 clientIdentifier:(id)a4;
@end

@implementation PPCollaborativeFilteringSampler

- (void).cxx_destruct
{
}

- (BOOL)constructAndSendMessageForSamplingRate:(double)a3 shouldContinueBlock:(id)a4 error:(id *)a5
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v71 = (uint64_t (**)(void))a4;
  if ([MEMORY[0x1E4F89FC8] yesWithProbability:a3])
  {
    v8 = +[PPLocalTopicStore defaultStore];
    v9 = objc_opt_new();
    v10 = [v8 rankedTopicsWithQuery:v9 error:a5];

    if (v10)
    {
      v72 = objc_msgSend(v10, "_pas_shuffledArrayUsingRng:", 0);

      if ((v71[2]() & 1) == 0)
      {
        v46 = pp_default_log_handle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring snapshot", buf, 2u);
        }

        char v70 = 0;
        goto LABEL_50;
      }
      v11 = objc_opt_new();
      v68 = [v11 pendingTopicFeedback];

      v73 = [(PPCollaborativeFilteringSampler *)self _weightedSampleFeedbackItems:v68];
      v12 = +[PPTrialWrapper sharedInstance];
      v13 = [v12 concatenatedTreatmentNames];
      v69 = objc_msgSend(v13, "_pas_stringBackedByUTF8CString");

      v14 = +[PPConfiguration sharedInstance];
      LODWORD(v13) = [v14 portraitAnalyticsMaximumNumberOfRecords];

      if (v13)
      {
        unint64_t v15 = 0;
        while (1)
        {
          v16 = (void *)MEMORY[0x1CB79D060]();
          if ((v71[2]() & 1) == 0) {
            break;
          }
          if (v15 == [v72 count])
          {
            goto LABEL_29;
          }
          v17 = objc_opt_new();
          if (v73)
          {
            v18 = [v73 clientIdentifier];

            if (v18)
            {
              v19 = [v73 clientIdentifier];
              v20 = objc_msgSend(v19, "_pas_stringBackedByUTF8CString");
              [v17 setObject:v20 forKeyedSubscript:@"clientIdentifier"];
            }
            v21 = [v73 feedbackItems];
            v22 = [v21 firstObject];
            v23 = [v22 itemString];

            if (v23)
            {
              v24 = [v73 feedbackItems];
              v25 = [v24 firstObject];
              v26 = [v25 itemString];
              v27 = objc_msgSend(v26, "_pas_stringBackedByUTF8CString");
              [v17 setObject:v27 forKeyedSubscript:@"clientTopic"];
            }
            v28 = [v73 feedbackItems];
            v29 = [v28 firstObject];
            int v30 = [v29 itemFeedbackType];

            if (v30)
            {
              v31 = NSNumber;
              v32 = [v73 feedbackItems];
              v33 = [v32 firstObject];
              v34 = objc_msgSend(v31, "numberWithUnsignedInt:", objc_msgSend(v33, "itemFeedbackType"));
              [v17 setObject:v34 forKeyedSubscript:@"engagementType"];
            }
          }
          [v17 setObject:v69 forKeyedSubscript:@"activeTreatments"];
          v35 = [v72 objectAtIndexedSubscript:v15];
          v36 = [v35 item];
          v37 = [v36 topicIdentifier];
          v38 = objc_msgSend(v37, "_pas_stringBackedByUTF8CString");
          [v17 setObject:v38 forKeyedSubscript:@"topic"];

          v39 = NSNumber;
          v40 = [v72 objectAtIndexedSubscript:v15];
          [v40 score];
          LODWORD(v42) = vcvtmd_s64_f64(v41 * 5.0);
          v43 = [v39 numberWithInt:v42];
          [v17 setObject:v43 forKeyedSubscript:@"score"];

          AnalyticsSendEvent();
          v44 = +[PPConfiguration sharedInstance];
          ++v15;
          LODWORD(v43) = [v44 portraitAnalyticsMaximumNumberOfRecords];

          if (v15 >= (int)v43) {
            goto LABEL_29;
          }
        }
        v47 = pp_default_log_handle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v47, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring snapshot in loop.", buf, 2u);
        }

        char v70 = 0;
        goto LABEL_49;
      }
LABEL_29:
      v48 = objc_opt_new();
      v49 = (void *)[@"PersonalizationPortrait" copy];
      [v48 setCaller:v49];

      v50 = dispatch_group_create();
      dispatch_group_enter(v50);
      *(void *)buf = 0;
      v82 = buf;
      uint64_t v83 = 0x3032000000;
      v84 = __Block_byref_object_copy__6804;
      v85 = __Block_byref_object_dispose__6805;
      id v86 = 0;
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __100__PPCollaborativeFilteringSampler_constructAndSendMessageForSamplingRate_shouldContinueBlock_error___block_invoke;
      v78[3] = &unk_1E65D8E40;
      v80 = buf;
      v51 = v50;
      v79 = v51;
      v67 = v48;
      [v48 makeRequestWithCompletion:v78];
      v66 = v51;
      int v52 = [MEMORY[0x1E4F93B18] waitForGroup:v51 timeoutSeconds:8.0];
      char v70 = v71[2]();
      if (v70)
      {
        if (v52 == 1 || !*((void *)v82 + 5))
        {
          char v70 = 0;
          goto LABEL_48;
        }
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v53 = *((id *)v82 + 5);
        uint64_t v54 = [v53 countByEnumeratingWithState:&v74 objects:v93 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v75 != v55) {
                objc_enumerationMutation(v53);
              }
              v57 = *(void **)(*((void *)&v74 + 1) + 8 * i);
              v58 = (void *)MEMORY[0x1CB79D060]();
              v59 = pp_default_log_handle();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
              {
                v63 = [v57 ID];
                v64 = [v57 name];
                *(_DWORD *)v89 = 138740227;
                v90 = v63;
                __int16 v91 = 2117;
                v92 = v64;
                _os_log_debug_impl(&dword_1CA9A8000, v59, OS_LOG_TYPE_DEBUG, "PPMaintenance: TV app favorite: %{sensitive}@: \t\t %{sensitive}@", v89, 0x16u);
              }
              v60 = [v57 ID];

              if (v60)
              {
                v87 = @"sportsFavorite";
                v61 = [v57 ID];
                v88 = v61;
                v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
                AnalyticsSendEvent();
              }
            }
            uint64_t v54 = [v53 countByEnumeratingWithState:&v74 objects:v93 count:16];
          }
          while (v54);
        }
      }
      else
      {
        v53 = pp_default_log_handle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v89 = 0;
          _os_log_debug_impl(&dword_1CA9A8000, v53, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring WLKFavorite request for snapshot.", v89, 2u);
        }
      }

LABEL_48:
      _Block_object_dispose(buf, 8);

LABEL_49:
LABEL_50:
      v45 = v72;
      goto LABEL_51;
    }
    v45 = pp_default_log_handle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_ERROR, "PPMaintenance: unable to fetch ranked topics.", buf, 2u);
    }
    char v70 = 0;
  }
  else
  {
    pp_default_log_handle();
    v45 = char v70 = 1;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      char v70 = 1;
      _os_log_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_INFO, "Skipping snapshot sampling.", buf, 2u);
    }
  }
LABEL_51:

  return v70;
}

void __100__PPCollaborativeFilteringSampler_constructAndSendMessageForSamplingRate_shouldContinueBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPMaintenance: Enters favRequest completion block.", (uint8_t *)&v11, 2u);
  }

  if (v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v5;
    v10 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "PPMaintenance: Failed to make WLKFavoritesRequest: %@", (uint8_t *)&v11, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_weightedSampleFeedbackItems:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count])
  {
    v25 = 0;
    goto LABEL_26;
  }
  v4 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v27 = v3;
    obj = v5;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v13 = [v11 feedbackItems];
        v14 = [v13 firstObject];
        unint64_t v15 = [v14 itemString];

        if (v15)
        {
          v16 = [v11 clientIdentifier];
          uint64_t v17 = [(PPCollaborativeFilteringSampler *)self _probabilityForItemString:v15 clientIdentifier:v16];

          v8 += v17;
          v18 = [NSNumber numberWithUnsignedInt:v17];
          [v4 addObject:v18];
        }
        else
        {
          [v4 addObject:&unk_1F2568DB0];
          v18 = pp_default_log_handle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPCollaborativeFilteringSampler: found feedback without item string.", buf, 2u);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);

    if (!v8)
    {
      v25 = 0;
LABEL_24:
      id v3 = v27;
      goto LABEL_25;
    }
    v19 = objc_opt_new();
    unint64_t v20 = [v19 next];

    if ([v4 count])
    {
      uint64_t v21 = 0;
      unsigned int v22 = 0;
      unsigned int v23 = v20 % v8;
      while (1)
      {
        v24 = [v4 objectAtIndexedSubscript:v21];
        v22 += [v24 intValue];

        if (v22 >= v23) {
          break;
        }
        if (++v21 >= (unint64_t)[v4 count]) {
          goto LABEL_18;
        }
      }
      v25 = [obj objectAtIndexedSubscript:v21];
      goto LABEL_24;
    }
LABEL_18:
    id v5 = pp_default_log_handle();
    id v3 = v27;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPCollaborativeFilteringSampler: sampling identified no items", buf, 2u);
    }
  }

  v25 = 0;
LABEL_25:

LABEL_26:
  return v25;
}

- (unsigned)_probabilityForItemString:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a4;
  samplingWeightTrie = self->_samplingWeightTrie;
  unsigned int v8 = (objc_class *)NSString;
  id v9 = a3;
  v10 = (void *)[[v8 alloc] initWithFormat:@"%@:%@", v6, v9];

  unsigned int v11 = [(_PASCFBurstTrie *)samplingWeightTrie payloadForString:v10];
  if (!v11)
  {
    id v12 = self->_samplingWeightTrie;
    uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@:*", v6];
    unsigned int v14 = [(_PASCFBurstTrie *)v12 payloadForString:v13];

    if (v14) {
      unsigned int v11 = v14;
    }
    else {
      unsigned int v11 = 100;
    }
  }

  return v11;
}

- (PPCollaborativeFilteringSampler)init
{
  id v3 = +[PPTrialWrapper sharedInstance];
  v4 = [v3 filepathForFactor:@"collaborativeFilteringWeights.trie" namespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL"];

  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:v4];
    self = [(PPCollaborativeFilteringSampler *)self initWithSamplingWeightTrie:v5];

    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (PPCollaborativeFilteringSampler)initWithSamplingWeightTrie:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPCollaborativeFilteringSampler;
  id v6 = [(PPCollaborativeFilteringSampler *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_samplingWeightTrie, a3);
  }

  return v7;
}

@end