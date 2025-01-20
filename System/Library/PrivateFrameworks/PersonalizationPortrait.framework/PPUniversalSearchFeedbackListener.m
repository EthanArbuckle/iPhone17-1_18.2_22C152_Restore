@interface PPUniversalSearchFeedbackListener
- (PPUniversalSearchFeedbackListener)init;
- (id)fetchFeedbackCSSIParsedResults:(id)a3 feedbackBundleId:(id)a4 queryId:(int64_t)a5;
- (id)protectionClassForBundleId:(id)a3;
- (void)reportFeedback:(id)a3 queryId:(int64_t)a4;
- (void)sendFeedbackWithEngagementStrings:(id)a3 rejectionStrings:(id)a4 store:(id)a5;
- (void)sendMetricsFeedback:(unint64_t)a3 engagedCSSICount:(unint64_t)a4;
@end

@implementation PPUniversalSearchFeedbackListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_entityStore, 0);
}

- (id)protectionClassForBundleId:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.mobilemail"])
  {
    v4 = (id *)MEMORY[0x1E4F28340];
LABEL_5:
    id v5 = *v4;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS"])
  {
    v4 = (id *)MEMORY[0x1E4F28358];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)sendMetricsFeedback:(unint64_t)a3 engagedCSSICount:(unint64_t)a4
{
  id v5 = [[PPUniversalSearchSpotlightFeedback alloc] initWithOfferedCSSICount:a3 engagedCSSICount:a4];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v7 = pp_universal_search_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: sending metrics logging feedback to server", buf, 2u);
  }

  topicStore = self->_topicStore;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __74__PPUniversalSearchFeedbackListener_sendMetricsFeedback_engagedCSSICount___block_invoke;
  v16 = &unk_1E550E6D0;
  v9 = v5;
  v17 = v9;
  v10 = v6;
  v18 = v10;
  [(PPTopicStore *)topicStore registerUniversalSearchSpotlightFeedback:v9 completion:&v13];
  LODWORD(topicStore) = objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v10, 20.0, v13, v14, v15, v16);
  v11 = pp_universal_search_log_handle();
  v12 = v11;
  if (topicStore == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerUniversalSearchSpotlightFeedback timed out on server", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: registerUniversalSearchSpotlightFeedback reply received from server", buf, 2u);
  }
}

void __74__PPUniversalSearchFeedbackListener_sendMetricsFeedback_engagedCSSICount___block_invoke(uint64_t a1, int a2, void *a3)
{
  *(void *)&v11[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_semaphore_t v6 = pp_universal_search_log_handle();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [*(id *)(a1 + 32) offeredCSSICount];
      int v9 = [*(id *)(a1 + 32) engagedCSSICount];
      int v10 = 67109376;
      v11[0] = v8;
      LOWORD(v11[1]) = 1024;
      *(_DWORD *)((char *)&v11[1] + 2) = v9;
      _os_log_debug_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: Successfully sent metrics logging feedback with %u offeredCSSI and %u engagedCSSI", (uint8_t *)&v10, 0xEu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    *(void *)v11 = v5;
    _os_log_error_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerUniversalSearchSpotlightFeedback failed to execute on server with error: %@", (uint8_t *)&v10, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)sendFeedbackWithEngagementStrings:(id)a3 rejectionStrings:(id)a4 store:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [PPFeedback alloc];
    id v11 = 0;
    id v12 = 0;
    id v13 = v7;
    id v14 = v8;
LABEL_5:
    v15 = [(PPFeedback *)v10 initWithExplicitlyEngagedStrings:v11 explicitlyRejectedStrings:v12 implicitlyEngagedStrings:v13 implicitlyRejectedStrings:v14 offeredStrings:0];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [PPFeedback alloc];
    id v11 = v7;
    id v12 = v8;
    id v13 = 0;
    id v14 = 0;
    goto LABEL_5;
  }
  v15 = 0;
LABEL_7:
  v16 = [(PPBaseFeedback *)v15 feedbackItems];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    v19 = pp_universal_search_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18CAA6000, v19, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: sending feedback to server", buf, 2u);
    }

    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __94__PPUniversalSearchFeedbackListener_sendFeedbackWithEngagementStrings_rejectionStrings_store___block_invoke;
    v27 = &unk_1E550E6D0;
    v28 = v15;
    v20 = v18;
    v29 = v20;
    [v9 registerFeedback:v28 completion:&v24];
    int v21 = objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v20, 20.0, v24, v25, v26, v27);
    v22 = pp_universal_search_log_handle();
    v23 = v22;
    if (v21 == 1)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18CAA6000, v23, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerFeedback timed out on server", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18CAA6000, v23, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reply received from server", buf, 2u);
    }
  }
}

void __94__PPUniversalSearchFeedbackListener_sendFeedbackWithEngagementStrings_rejectionStrings_store___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_semaphore_t v6 = pp_universal_search_log_handle();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [*(id *)(a1 + 32) feedbackItems];
      int v9 = 134217984;
      uint64_t v10 = [v8 count];
      _os_log_debug_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: Successfully sent feedback with %tu feedback items.", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    uint64_t v10 = (uint64_t)v5;
    _os_log_error_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerFeedback failed to execute on server with error: %@", (uint8_t *)&v9, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)fetchFeedbackCSSIParsedResults:(id)a3 feedbackBundleId:(id)a4 queryId:(int64_t)a5
{
  v63[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__3712;
  v55 = __Block_byref_object_dispose__3713;
  id v56 = 0;
  v46 = v7;
  v47 = objc_opt_new();
  [v47 setIdentifiers:v7];
  if (([v8 isEqualToString:@"com.apple.mobilemail"] & 1) == 0
    && ([v8 isEqualToString:@"com.apple.MobileSMS"] & 1) == 0)
  {
    id v36 = 0;
    goto LABEL_35;
  }
  v45 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  uint64_t v9 = *MEMORY[0x1E4F23398];
  v63[0] = *MEMORY[0x1E4F23390];
  v63[1] = v9;
  v63[2] = *MEMORY[0x1E4F233A0];
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:3];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v11 = [(PPUniversalSearchFeedbackListener *)self protectionClassForBundleId:v8];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __93__PPUniversalSearchFeedbackListener_fetchFeedbackCSSIParsedResults_feedbackBundleId_queryId___block_invoke;
  v48[3] = &unk_1E550E6A8;
  v50 = &v51;
  v43 = v10;
  v49 = v43;
  [v45 slowFetchAttributes:v44 protectionClass:v11 bundleID:v8 identifiers:v7 completionHandler:v48];

  int v12 = [MEMORY[0x1E4F93B18] waitForSemaphore:v43 timeoutSeconds:20.0];
  id v13 = pp_universal_search_log_handle();
  id v14 = v13;
  if (v12 == 1)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18CAA6000, v14, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: registerFeedback timed out on server", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18CAA6000, v14, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reply received from server", buf, 2u);
    }

    v15 = (void *)v52[5];
    if (!v15) {
      goto LABEL_33;
    }
    uint64_t v16 = [v15 count];
    if (v16 == [v46 count])
    {
      uint64_t v17 = pp_default_log_handle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int64_t v38 = v52[5];
        *(_DWORD *)buf = 138739971;
        int64_t v58 = v38;
        _os_log_debug_impl(&dword_18CAA6000, v17, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: CoreSpotlight slow fetch results: %{sensitive}@", buf, 0xCu);
      }

      unint64_t v18 = 0;
      *(void *)&long long v19 = 134218243;
      long long v41 = v19;
      while (v18 < objc_msgSend((id)v52[5], "count", v41))
      {
        v20 = [(id)v52[5] objectAtIndexedSubscript:v18];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v20;
          v22 = [v21 objectAtIndexedSubscript:0];
          v23 = [v21 objectAtIndexedSubscript:1];
          uint64_t v24 = [v21 objectAtIndexedSubscript:2];
          if (v23)
          {
            if (v22)
            {
              uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
              BOOL v26 = v22 == v25;

              if (!v26)
              {
                v27 = +[PPSpotlightScoringFeatureVector decodeFeatureVectorFromData:v22 version:v23];
                v28 = [v27 qidStrings];
                v29 = [v28 allObjects];

                v30 = pp_default_log_handle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v41;
                  int64_t v58 = a5;
                  __int16 v59 = 2117;
                  uint64_t v60 = (uint64_t)v29;
                  _os_log_debug_impl(&dword_18CAA6000, v30, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: Topic Qids of feedback of queryId:%lld: %{sensitive}@", buf, 0x16u);
                }

                v31 = [v47 topicStrings];
                [v31 addObjectsFromArray:v29];
              }
            }
          }
          if (v24)
          {
            v32 = [MEMORY[0x1E4F1CA98] null];
            BOOL v33 = v24 == v32;

            if (!v33)
            {
              v34 = pp_default_log_handle();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v41;
                int64_t v58 = a5;
                __int16 v59 = 2117;
                uint64_t v60 = (uint64_t)v24;
                _os_log_debug_impl(&dword_18CAA6000, v34, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: Portrait NE of feedback of queryId:%lld: %{sensitive}@", buf, 0x16u);
              }

              v35 = [v47 neStrings];
              [v35 addObjectsFromArray:v24];
            }
          }
        }
        ++v18;
      }
      id v36 = v47;
      goto LABEL_34;
    }
    id v14 = pp_universal_search_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = [(id)v52[5] count];
      uint64_t v40 = [v46 count];
      *(_DWORD *)buf = 134218496;
      int64_t v58 = v39;
      __int16 v59 = 2048;
      uint64_t v60 = v40;
      __int16 v61 = 2048;
      int64_t v62 = a5;
      _os_log_error_impl(&dword_18CAA6000, v14, OS_LOG_TYPE_ERROR, "CoreSpotlight returned mis-matching count of fetchedObjects(%lu) when fetching identifiers(%lu) of query %lld", buf, 0x20u);
    }
  }

LABEL_33:
  id v36 = 0;
LABEL_34:

LABEL_35:
  _Block_object_dispose(&v51, 8);

  return v36;
}

void __93__PPUniversalSearchFeedbackListener_fetchFeedbackCSSIParsedResults_feedbackBundleId_queryId___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  dispatch_semaphore_t v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v43 = [MEMORY[0x1E4F28B50] mainBundle];
    v44 = [v43 bundleIdentifier];
    v45 = objc_opt_new();
    v46 = [v45 processName];
    *(_DWORD *)buf = 138412546;
    id v96 = v44;
    __int16 v97 = 2112;
    int64_t v98 = (int64_t)v46;
    _os_log_debug_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_DEBUG, "Feedback from bundleId:%@, process:%@", buf, 0x16u);
  }
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v7 bundleIdentifier];
  char v9 = [v8 isEqualToString:@"com.apple.Spotlight"];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_semaphore_t v10 = pp_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138740227;
        id v96 = v93;
        __int16 v97 = 2048;
        int64_t v98 = a4;
        _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reportFeedback, visible result feedback:%{sensitive}@, queryId:%lld", buf, 0x16u);
      }

      id v11 = v93;
      for (unint64_t i = 0; ; ++i)
      {
        id v13 = [v11 results];
        BOOL v14 = i < [v13 count];

        if (!v14) {
          goto LABEL_62;
        }
        v15 = (void *)MEMORY[0x192F97350]();
        uint64_t v16 = [v11 results];
        uint64_t v17 = [v16 objectAtIndexedSubscript:i];

        unint64_t v18 = [v17 resultBundleId];
        if ([v18 isEqualToString:@"com.apple.mobilemail"])
        {
        }
        else
        {
          long long v19 = [v17 resultBundleId];
          int v20 = [v19 isEqualToString:@"com.apple.MobileSMS"];

          if (!v20) {
            goto LABEL_17;
          }
        }
        id v21 = [v17 identifier];
        BOOL v22 = [v21 length] == 0;

        if (v22)
        {
          uint64_t v25 = pp_default_log_handle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_18CAA6000, v25, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: Received Feedback on SFSearchResult with empty or nil identifier", buf, 2u);
          }
        }
        else
        {
          v23 = [(PPSpotlightSessionState *)v5->_sessionState seenSpotlightIds];
          uint64_t v24 = [v17 identifier];
          [v23 addObject:v24];

          uint64_t v25 = [(PPSpotlightSessionState *)v5->_sessionState seenBundleIds];
          BOOL v26 = [v17 resultBundleId];
          [v25 addObject:v26];
        }
LABEL_17:
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = pp_default_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138740227;
        id v96 = v93;
        __int16 v97 = 2048;
        int64_t v98 = a4;
        _os_log_debug_impl(&dword_18CAA6000, v27, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reportFeedback, clearing intermediates at local search feedback:%{sensitive}@, queryId:%lld", buf, 0x16u);
      }

      v28 = [(PPSpotlightSessionState *)v5->_sessionState seenBundleIds];
      [v28 removeAllObjects];

      id v11 = [(PPSpotlightSessionState *)v5->_sessionState seenSpotlightIds];
      [v11 removeAllObjects];
      goto LABEL_62;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = pp_default_log_handle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138740227;
        id v96 = v93;
        __int16 v97 = 2048;
        int64_t v98 = a4;
        _os_log_debug_impl(&dword_18CAA6000, v29, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reportFeedback, engagement feedback:%{sensitive}@, queryId:%lld", buf, 0x16u);
      }

      id v11 = v93;
      v91 = [v11 result];
      v30 = [v91 resultBundleId];
      if ([v30 isEqualToString:@"com.apple.mobilemail"])
      {
      }
      else
      {
        v47 = [v91 resultBundleId];
        int v48 = [v47 isEqualToString:@"com.apple.MobileSMS"];

        if (!v48)
        {
LABEL_61:

LABEL_62:
          goto LABEL_63;
        }
      }
      v49 = [v91 identifier];
      BOOL v50 = [v49 length] == 0;

      if (!v50)
      {
        uint64_t v51 = [(PPSpotlightSessionState *)v5->_sessionState engagedSpotlightIds];
        v52 = [v91 identifier];
        [v51 addObject:v52];

        os_log_t loga = [(PPSpotlightSessionState *)v5->_sessionState engagedBundleIds];
        uint64_t v53 = [v91 resultBundleId];
        [loga addObject:v53];

        goto LABEL_61;
      }
      log = pp_default_log_handle();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18CAA6000, log, OS_LOG_TYPE_ERROR, "PPUniversalSearchFeedbackListener: Received Feedback on SFSearchResult with empty or nil identifier", buf, 2u);
      }
LABEL_60:

      goto LABEL_61;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = pp_default_log_handle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138740227;
        id v96 = v93;
        __int16 v97 = 2048;
        int64_t v98 = a4;
        _os_log_debug_impl(&dword_18CAA6000, v31, OS_LOG_TYPE_DEBUG, "PPUniversalSearchFeedbackListener: reportFeedback, search view disappear feedback:%{sensitive}@, queryId:%lld", buf, 0x16u);
      }

      id v11 = (id)objc_opt_new();
      v91 = objc_opt_new();
      log = objc_opt_new();
      v86 = objc_opt_new();
      v85 = objc_opt_new();
      v84 = objc_opt_new();
      v92 = objc_opt_new();
      v32 = (void *)MEMORY[0x192F97350]();
      BOOL v33 = [(PPSpotlightSessionState *)v5->_sessionState engagedSpotlightIds];
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __60__PPUniversalSearchFeedbackListener_reportFeedback_queryId___block_invoke;
      v94[3] = &unk_1E550E680;
      v94[4] = v5;
      v94[5] = a4;
      v34 = objc_msgSend(v33, "_pas_mappedArrayWithIndexedTransform:", v94);

      uint64_t v35 = 0;
      for (unint64_t j = 0; j < [v34 count]; ++j)
      {
        v37 = (void *)MEMORY[0x192F97350]();
        int64_t v38 = [v34 objectAtIndexedSubscript:j];
        uint64_t v39 = [v38 topicStrings];
        if (v39)
        {
          uint64_t v40 = [v38 topicStrings];
        }
        else
        {
          uint64_t v40 = 0;
        }

        if ([v40 count]) {
          ++v35;
        }
        long long v41 = [v38 neStrings];
        if (v41)
        {
          v42 = [v38 neStrings];
        }
        else
        {
          v42 = 0;
        }

        [log unionSet:v42];
        [v86 unionSet:v40];
      }
      for (unint64_t k = 0; ; ++k)
      {
        v55 = [(PPSpotlightSessionState *)v5->_sessionState seenSpotlightIds];
        BOOL v56 = k < [v55 count];

        if (!v56) {
          break;
        }
        v57 = (void *)MEMORY[0x192F97350]();
        int64_t v58 = [(PPSpotlightSessionState *)v5->_sessionState seenSpotlightIds];
        __int16 v59 = [v58 objectAtIndexedSubscript:k];

        uint64_t v60 = [(PPSpotlightSessionState *)v5->_sessionState seenBundleIds];
        __int16 v61 = [v60 objectAtIndexedSubscript:k];

        char v62 = [v61 isEqualToString:@"com.apple.mobilemail"];
        v63 = v85;
        if ((v62 & 1) != 0
          || (int v64 = [v61 isEqualToString:@"com.apple.MobileSMS"], v63 = v84, v64))
        {
          [v63 addObject:v59];
        }
      }
      uint64_t v65 = [(PPUniversalSearchFeedbackListener *)v5 fetchFeedbackCSSIParsedResults:v85 feedbackBundleId:@"com.apple.mobilemail" queryId:a4];
      if (v65) {
        [v92 addObject:v65];
      }
      v83 = (void *)v65;
      uint64_t v66 = [(PPUniversalSearchFeedbackListener *)v5 fetchFeedbackCSSIParsedResults:v84 feedbackBundleId:@"com.apple.MobileSMS" queryId:a4];
      if (v66) {
        [v92 addObject:v66];
      }
      v88 = (void *)v66;
      uint64_t v67 = 0;
      for (unint64_t m = 0; m < [v92 count]; ++m)
      {
        v69 = (void *)MEMORY[0x192F97350]();
        v70 = [v92 objectAtIndexedSubscript:m];
        v71 = [v70 topicStrings];
        BOOL v72 = [v71 count] != 0;

        v73 = [v70 neStrings];
        [v11 unionSet:v73];

        v74 = [v70 topicStrings];
        [v91 unionSet:v74];

        v67 += v72;
      }
      v75 = (void *)[v11 mutableCopy];
      [v75 minusSet:log];
      v76 = (void *)[v91 mutableCopy];
      [v76 minusSet:v86];
      v77 = [v86 allObjects];
      v78 = [v76 allObjects];
      [(PPUniversalSearchFeedbackListener *)v5 sendFeedbackWithEngagementStrings:v77 rejectionStrings:v78 store:v5->_topicStore];

      v79 = [log allObjects];
      v80 = [v75 allObjects];
      [(PPUniversalSearchFeedbackListener *)v5 sendFeedbackWithEngagementStrings:v79 rejectionStrings:v80 store:v5->_entityStore];

      [(PPUniversalSearchFeedbackListener *)v5 sendMetricsFeedback:v67 engagedCSSICount:v35];
      uint64_t v81 = objc_opt_new();
      sessionState = v5->_sessionState;
      v5->_sessionState = (PPSpotlightSessionState *)v81;

      goto LABEL_60;
    }
  }
LABEL_63:
  objc_sync_exit(v5);
}

id __60__PPUniversalSearchFeedbackListener_reportFeedback_queryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v13 = a2;
  dispatch_semaphore_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a2;
  id v8 = [v6 arrayWithObjects:&v13 count:1];
  char v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "engagedBundleIds", v13, v14);
  dispatch_semaphore_t v10 = [v9 objectAtIndexedSubscript:a3];
  id v11 = [v5 fetchFeedbackCSSIParsedResults:v8 feedbackBundleId:v10 queryId:*(void *)(a1 + 40)];

  return v11;
}

- (PPUniversalSearchFeedbackListener)init
{
  v10.receiver = self;
  v10.super_class = (Class)PPUniversalSearchFeedbackListener;
  v2 = [(PPUniversalSearchFeedbackListener *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    entityStore = v2->_entityStore;
    v2->_entityStore = (PPNamedEntityStore *)v3;

    [(PPNamedEntityStore *)v2->_entityStore setClientIdentifier:@"spotlight"];
    uint64_t v5 = objc_opt_new();
    topicStore = v2->_topicStore;
    v2->_topicStore = (PPTopicStore *)v5;

    [(PPTopicStore *)v2->_topicStore setClientIdentifier:@"spotlight"];
    uint64_t v7 = objc_opt_new();
    sessionState = v2->_sessionState;
    v2->_sessionState = (PPSpotlightSessionState *)v7;
  }
  return v2;
}

@end