@interface PPFeedbackStorage
+ (id)storeTypeDescription:(unsigned __int8)a3;
+ (void)logFeedback:(id)a3 domain:(unsigned __int8)a4 domainStatus:(unsigned __int8)a5 inBackground:(BOOL)a6;
- (BOOL)deleteExpiredFeedbackWithShouldContinueBlock:(id)a3;
- (BOOL)processPendingFeedbackWithShouldContinueBlock:(id)a3 error:(id *)a4;
- (BOOL)storePendingFeedback:(id)a3 storeType:(unsigned __int8)a4 error:(id *)a5;
- (PPFeedbackStorage)init;
- (id)locationStore;
- (id)mappedTopicsPendingFeedbackWithShouldContinueBlock:(id)a3;
- (id)namedEntityStore;
- (id)pendingTopicFeedback;
- (id)topicStore;
@end

@implementation PPFeedbackStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_connectionsStoreOverride, 0);
  objc_storeStrong((id *)&self->_eventStoreOverride, 0);
  objc_storeStrong((id *)&self->_contactStoreOverride, 0);
  objc_storeStrong((id *)&self->_quickTypeBrokerOverride, 0);
  objc_storeStrong((id *)&self->_locationStoreOverride, 0);
  objc_storeStrong((id *)&self->_topicStoreOverride, 0);
  objc_storeStrong((id *)&self->_namedEntityStoreOverride, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (id)pendingTopicFeedback
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__20198;
  v12 = __Block_byref_object_dispose__20199;
  id v13 = 0;
  v3 = (void *)v9[5];
  v9[5] = MEMORY[0x1E4F1CBF0];

  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke;
  v7[3] = &unk_1E65D9E10;
  v7[4] = &v8;
  [(_PASLock *)lock runWithLockAcquired:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 publisherFromStartTime:0.0];
  v4 = [v3 filterWithIsIncluded:&__block_literal_global_139_20200];
  id v5 = [v4 mapWithTransform:&__block_literal_global_141];
  v6 = [v5 collect];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke_5;
  v8[3] = &unk_1E65DAFF8;
  v8[4] = *(void *)(a1 + 32);
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_143 receiveInput:v8];
}

void __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke_5(uint64_t a1, void *a2)
{
}

uint64_t __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 eventBody];
}

BOOL __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = [v2 storeType] == 2;

  return v3;
}

- (BOOL)processPendingFeedbackWithShouldContinueBlock:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (self)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__20198;
    v36 = __Block_byref_object_dispose__20199;
    id v37 = 0;
    db = self->_db;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = (uint64_t)__44__PPFeedbackStorage__lastProcessedTimestamp__block_invoke;
    v30 = &unk_1E65DAC20;
    v31 = &v32;
    [(PPSQLDatabase *)db readTransactionWithClient:7 block:&v27];
    id v7 = (id)v33[5];
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__20198;
  v36 = __Block_byref_object_dispose__20199;
  id v37 = 0;
  lock = self->_lock;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke;
  v24[3] = &unk_1E65D9E58;
  v26 = &v32;
  id v9 = v7;
  id v25 = v9;
  if ([(_PASLock *)lock runWithLockAcquired:v24 shouldContinueBlock:v5] == 1)
  {
    char v10 = 0;
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = (uint64_t)&v27;
    uint64_t v29 = 0x2020000000;
    v30 = 0;
    v11 = (void *)MEMORY[0x1CB79D060]();
    v12 = (void *)v33[5];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_2;
    v22[3] = &unk_1E65D9E80;
    id v23 = v9;
    id v13 = [v12 filterWithIsIncluded:v22];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_3;
    v21[3] = &unk_1E65D9EA8;
    v21[4] = &v27;
    v14 = [v13 mapWithTransform:v21];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_4;
    v20[3] = &unk_1E65D9ED0;
    v20[4] = self;
    v20[5] = &v27;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_135;
    v18[3] = &unk_1E65D9EF8;
    v18[4] = self;
    v15 = (uint64_t (**)(void))v5;
    id v19 = v15;
    id v16 = (id)[v14 sinkWithCompletion:v20 shouldContinue:v18];

    char v10 = v15[2](v15);
    _Block_object_dispose(&v27, 8);
  }

  _Block_object_dispose(&v32, 8);
  return v10;
}

void __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 doubleValue];
  uint64_t v5 = objc_msgSend(v4, "publisherFromStartTime:");

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

BOOL __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = [v3 eventBody];
  uint64_t v6 = [v5 build];
  id v7 = [MEMORY[0x1E4F89FC8] osBuild];
  if ([v6 isEqual:v7])
  {
    uint64_t v8 = +[PPSettings sharedInstance];
    id v9 = [v5 clientBundleId];
    if ([v8 bundleIdentifierIsEnabledForDonation:v9])
    {
      [v3 timestamp];
      double v11 = v10;
      [*(id *)(a1 + 32) doubleValue];
      BOOL v13 = v11 > v12;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

id __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  uint64_t v5 = [v3 eventBody];

  return v5;
}

void __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] == 1)
  {
    uint64_t v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v3 error];
      LODWORD(v10) = 138412290;
      *(void *)((char *)&v10 + 4) = v9;
      _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPFeedbackStorage: error processing pending feedback: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = *(void **)(v5 + 8);
    *(void *)&long long v10 = MEMORY[0x1E4F143A8];
    *((void *)&v10 + 1) = 3221225472;
    double v11 = __49__PPFeedbackStorage__saveLastProcessedTimestamp___block_invoke;
    double v12 = &unk_1E65DB8F0;
    id v13 = v6;
    [v8 writeTransactionWithClient:7 block:&v10];
  }
}

uint64_t __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v224 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v151 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = [v3 storeType];
  uint64_t v152 = a1;
  id v6 = *(void **)(a1 + 40);
  id v174 = v3;
  uint64_t v172 = v4;
  v173 = v6;
  if (v4)
  {
    long long v201 = 0u;
    long long v202 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    obuint64_t j = [v174 feedbackItems];
    uint64_t v7 = [obj countByEnumeratingWithState:&v199 objects:v210 count:16];
    if (!v7) {
      goto LABEL_43;
    }
    uint64_t v8 = v7;
    v171 = v173 + 2;
    uint64_t v175 = *(void *)v200;
    id v9 = @"domain";
    int v162 = v5;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v166 = v8;
      do
      {
        if (*(void *)v200 != v175) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v199 + 1) + 8 * v10);
        double v12 = (void *)MEMORY[0x1CB79D060]();
        if (v5 != 3)
        {
          if (v5 == 2)
          {
            v176 = v12;
            uint64_t v177 = v10;
            id v37 = [v11 itemString];
            unsigned int v38 = [v11 itemFeedbackType];
            id v179 = v37;
            id v39 = v174;
            v168 = v173;
            v40 = -[PPFeedbackStorage topicStore](v172);
            if (v173)
            {
              id v163 = v40;
              v41 = [v39 mappingId];
              if (v41)
              {
                v42 = v41;
                v43 = v39;
                v44 = (void *)MEMORY[0x1CB79D060]();
                v156 = v42;
                v45 = [v163 unmapMappedTopicIdentifier:v179 mappingIdentifier:v42 error:0];
                v46 = [v45 allKeys];
                uint64_t v47 = objc_msgSend(v46, "_pas_mappedArrayWithTransform:", &__block_literal_global_206_20256);

                v48 = objc_opt_new();
                v154 = (void *)v47;
                v49 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v47];
                [v48 setMatchingTopicIds:v49];

                v50 = [v43 timestamp];
                [v48 setToDate:v50];

                v51 = [v43 timestamp];
                [v48 setScoringDate:v51];

                v52 = [v43 clientBundleId];
                v53 = +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v52, 1);
                [v48 setExcludingSourceBundleIds:v53];

                v54 = objc_opt_new();
                v196[0] = MEMORY[0x1E4F143A8];
                v196[1] = 3221225472;
                v196[2] = __101__PPFeedbackStorage__performAttributionForMappedTopic_baseFeedback_feedbackType_shouldContinueBlock___block_invoke_2;
                v196[3] = &unk_1E65D9F40;
                v198 = v168;
                id v55 = v54;
                id v197 = v55;
                v153 = v48;
                [v163 iterTopicRecordsWithQuery:v48 error:0 block:v196];
                v159 = v43;
                v56 = [v43 clientIdentifier];
                v57 = objc_msgSend(v56, "_pas_stringBackedByUTF8CString");

                v58 = (void *)MEMORY[0x1CB79D060]();
                v59 = [v55 allValues];
                v60 = (void *)[v59 mutableCopy];

                uint64_t v61 = [v60 lastObject];
                v62 = v9;
                unsigned int v184 = v38;
                if (v61)
                {
                  v63 = (void *)v61;
                  v181 = v60;
                  do
                  {
                    contexta = (void *)MEMORY[0x1CB79D060]();
                    [v60 removeLastObject];
                    *(void *)&long long v220 = @"algorithm";
                    v191 = objc_msgSend(MEMORY[0x1E4F89F98], "describeAlgorithm:", objc_msgSend(v63, "algorithm"));
                    *(void *)&long long buf = v191;
                    *((void *)&v220 + 1) = @"algorithmEnum";
                    v187 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v63, "algorithm"));
                    *((void *)&buf + 1) = v187;
                    *(void *)&long long v221 = @"source";
                    v64 = [v63 source];
                    v65 = [v64 bundleId];
                    v66 = +[PPMetricsUtils filterBundleId:v65];
                    v204 = v66;
                    v205 = v57;
                    *((void *)&v221 + 1) = @"clientId";
                    *(void *)&long long v222 = v62;
                    +[PPMetricsUtils stringifyDomain:0];
                    v68 = v67 = v57;
                    v206 = v68;
                    *((void *)&v222 + 1) = @"feedbackType";
                    v69 = +[PPMetricsUtils stringifyFeedbackType:v184];
                    v207 = v69;
                    *(void *)&long long v223 = @"isRemote";
                    v70 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v63, "isLocal") ^ 1);
                    v208 = v70;
                    *((void *)&v223 + 1) = @"feedbackTypeEnum";
                    v71 = [NSNumber numberWithUnsignedInt:v184];
                    v209 = v71;
                    v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v220 count:8];

                    v57 = v67;
                    v62 = @"domain";

                    v60 = v181;
                    +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.FeedbackAttributed" payload:v72 inBackground:1];

                    uint64_t v73 = [v181 lastObject];

                    v63 = (void *)v73;
                  }
                  while (v73);
                }

                int v5 = v162;
                uint64_t v8 = v166;
                id v9 = v62;
                v41 = v156;
                id v39 = v159;
              }

              v40 = v163;
            }

            v74 = v179;
            goto LABEL_40;
          }
          if (v5 != 1) {
            goto LABEL_41;
          }
          v176 = v12;
          uint64_t v177 = v10;
          id v13 = [v11 itemString];
          unsigned int v14 = [v11 itemFeedbackType];
          id v15 = v13;
          id v16 = v174;
          v17 = v173;
          v18 = -[PPFeedbackStorage namedEntityStore](v172);
          id v19 = objc_opt_new();
          v20 = (void *)MEMORY[0x1CB79D060]();
          v178 = v15;
          v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v15, 0);
          [v19 setMatchingNames:v21];

          [v19 setLimit:1];
          v22 = [v16 timestamp];
          [v19 setToDate:v22];

          [v19 setOrderByAscendingDate:1];
          id v23 = [v16 clientBundleId];
          v24 = +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v23, 1);
          [v19 setExcludingSourceBundleIds:v24];

          if (v173[2](v17))
          {
            id v25 = [v18 namedEntityRecordsWithQuery:v19 error:0];
            v26 = [v25 firstObject];

            if (v26)
            {
              if ((*v171)(v17))
              {
                unsigned int v190 = v14;
                uint64_t v27 = (void *)MEMORY[0x1E4F89E90];
                uint64_t v28 = [v26 entity];
                uint64_t v29 = objc_msgSend(v27, "describeCategory:", objc_msgSend(v28, "category"));

                v30 = [v26 entity];
                v31 = [v30 dynamicCategory];

                if (v31)
                {
                  uint64_t v32 = (void *)MEMORY[0x1CB79D060]();
                  id v33 = [NSString alloc];
                  uint64_t v34 = [v26 entity];
                  v35 = [v34 dynamicCategory];
                  uint64_t v36 = [v33 initWithFormat:@"%@:%@", v29, v35];

                  context = v36;
                }
                else
                {
                  context = v29;
                }
                v189 = (void *)MEMORY[0x1CB79D060]();
                *(void *)&long long v220 = @"algorithm";
                v186 = objc_msgSend(MEMORY[0x1E4F89EA8], "describeAlgorithm:", objc_msgSend(v26, "algorithm"));
                *(void *)&long long buf = v186;
                *((void *)&v220 + 1) = @"algorithmEnum";
                v183 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "algorithm"));
                *((void *)&buf + 1) = v183;
                *(void *)&long long v221 = @"source";
                v170 = [v26 source];
                id v165 = [v170 bundleId];
                v161 = +[PPMetricsUtils filterBundleId:v165];
                v204 = v161;
                *((void *)&v221 + 1) = @"clientId";
                v158 = [v16 clientIdentifier];
                v155 = objc_msgSend(v158, "_pas_stringBackedByUTF8CString");
                v205 = v155;
                *(void *)&long long v222 = @"domain";
                v94 = +[PPMetricsUtils stringifyDomain:1];
                v206 = v94;
                *((void *)&v222 + 1) = @"category";
                v95 = [context _pas_stringBackedByUTF8CString];
                v207 = v95;
                *(void *)&long long v223 = @"feedbackType";
                v96 = +[PPMetricsUtils stringifyFeedbackType:v190];
                v208 = v96;
                *((void *)&v223 + 1) = @"feedbackTypeEnum";
                v97 = [NSNumber numberWithUnsignedInt:v190];
                v209 = v97;
                v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v220 count:8];

                +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.FeedbackAttributed" payload:v98 inBackground:1];

                uint64_t v8 = v166;
                v93 = context;
                goto LABEL_36;
              }
            }
            else
            {
              v93 = pp_default_log_handle();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buf) = 138739971;
                *(void *)((char *)&buf + 4) = v178;
                _os_log_debug_impl(&dword_1CA9A8000, v93, OS_LOG_TYPE_DEBUG, "PPFeedbackStorage: unable to attribute feedback for named entity: %{sensitive}@", (uint8_t *)&buf, 0xCu);
              }
LABEL_36:
            }
            int v5 = v162;
          }

          v74 = v178;
          goto LABEL_39;
        }
        v176 = v12;
        uint64_t v177 = v10;
        v75 = [v11 itemString];
        uint64_t v76 = [v11 itemFeedbackType];
        id v77 = v75;
        id v78 = v174;
        v79 = v173;
        v80 = -[PPFeedbackStorage locationStore](v172);
        v81 = objc_opt_new();
        v180 = v77;
        [v81 setFuzzyMatchingString:v77];
        v82 = [v78 timestamp];
        [v81 setToDate:v82];

        [v81 setLimit:1];
        [v81 setOrderByAscendingDate:1];
        v83 = [v78 clientBundleId];
        v84 = +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v83, 2);
        [v81 setExcludingSourceBundleIds:v84];

        uint64_t v8 = v166;
        if (v173[2](v79))
        {
          v85 = [v80 locationRecordsWithQuery:v81 error:0];
          v86 = [v85 firstObject];

          if (v86)
          {
            if ((*v171)(v79))
            {
              contextb = (void *)MEMORY[0x1CB79D060]();
              *(void *)&long long v220 = @"algorithm";
              v192 = objc_msgSend(MEMORY[0x1E4F89E60], "describeAlgorithm:", objc_msgSend(v86, "algorithm"));
              *(void *)&long long buf = v192;
              *((void *)&v220 + 1) = @"algorithmEnum";
              v188 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v86, "algorithm"));
              *((void *)&buf + 1) = v188;
              *(void *)&long long v221 = @"source";
              v185 = [v86 source];
              v182 = [v185 bundleId];
              v169 = +[PPMetricsUtils filterBundleId:v182];
              v204 = v169;
              *((void *)&v221 + 1) = @"clientId";
              id v164 = [v78 clientIdentifier];
              v160 = objc_msgSend(v164, "_pas_stringBackedByUTF8CString");
              v205 = v160;
              *(void *)&long long v222 = @"domain";
              v157 = +[PPMetricsUtils stringifyDomain:2];
              v206 = v157;
              *((void *)&v222 + 1) = @"category";
              v87 = (void *)MEMORY[0x1E4F89E48];
              v88 = [v86 location];
              v89 = objc_msgSend(v87, "describeCategory:", objc_msgSend(v88, "category"));
              v207 = v89;
              *(void *)&long long v223 = @"feedbackType";
              v90 = +[PPMetricsUtils stringifyFeedbackType:v76];
              v208 = v90;
              *((void *)&v223 + 1) = @"feedbackTypeEnum";
              v91 = [NSNumber numberWithUnsignedInt:v76];
              v209 = v91;
              v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v220 count:8];

              uint64_t v8 = v166;
              +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.FeedbackAttributed" payload:v92 inBackground:1];
              goto LABEL_31;
            }
          }
          else
          {
            v92 = pp_default_log_handle();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 138739971;
              *(void *)((char *)&buf + 4) = v180;
              _os_log_debug_impl(&dword_1CA9A8000, v92, OS_LOG_TYPE_DEBUG, "PPFeedbackStorage: unable to attribute feedback for location: %{sensitive}@", (uint8_t *)&buf, 0xCu);
            }
LABEL_31:
          }
          int v5 = v162;
        }

        v74 = v180;
LABEL_39:
        id v9 = @"domain";
LABEL_40:
        uint64_t v10 = v177;

        double v12 = v176;
LABEL_41:
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v199 objects:v210 count:16];
      if (!v8)
      {
LABEL_43:

        break;
      }
    }
  }

  v99 = [v174 feedbackItems];
  v100 = (void *)[v99 mutableCopy];

  id v101 = v100;
  self;
  v102 = objc_opt_new();
  long long v220 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  id v103 = v101;
  uint64_t v104 = [v103 countByEnumeratingWithState:&v220 objects:v210 count:16];
  if (v104)
  {
    uint64_t v105 = v104;
    uint64_t v106 = *(void *)v221;
    do
    {
      for (uint64_t i = 0; i != v105; ++i)
      {
        if (*(void *)v221 != v106) {
          objc_enumerationMutation(v103);
        }
        v108 = *(void **)(*((void *)&v220 + 1) + 8 * i);
        if ([v108 itemFeedbackType] == 5)
        {
          v109 = [v108 itemString];
          [v102 addObject:v109];
        }
      }
      uint64_t v105 = [v103 countByEnumeratingWithState:&v220 objects:v210 count:16];
    }
    while (v105);
  }

  uint64_t v110 = [v103 count];
  if (v110 - 1 >= 0)
  {
    uint64_t v111 = v110;
    do
    {
      --v111;
      v112 = (void *)MEMORY[0x1CB79D060]();
      v113 = [v103 objectAtIndexedSubscript:v111];
      int v114 = [v113 itemFeedbackType];
      if ((v114 - 1) >= 4)
      {
        if (v114 == 5)
        {
          [v103 removeObjectAtIndex:v111];
          goto LABEL_58;
        }
        v115 = pp_default_log_handle();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          int v116 = [v113 itemFeedbackType];
          LODWORD(buf) = 67109120;
          DWORD1(buf) = v116;
          _os_log_error_impl(&dword_1CA9A8000, v115, OS_LOG_TYPE_ERROR, "invalid feedbackType: %u", (uint8_t *)&buf, 8u);
        }
      }
      else
      {
        v115 = [v113 itemString];
        [v102 removeObject:v115];
      }

LABEL_58:
    }
    while (v111 > 0);
  }
  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id v117 = v102;
  uint64_t v118 = [v117 countByEnumeratingWithState:&v199 objects:&buf count:16];
  if (v118)
  {
    uint64_t v119 = v118;
    uint64_t v120 = *(void *)v200;
    do
    {
      for (uint64_t j = 0; j != v119; ++j)
      {
        if (*(void *)v200 != v120) {
          objc_enumerationMutation(v117);
        }
        v122 = (void *)[objc_alloc(MEMORY[0x1E4F89E30]) initWithItemString:*(void *)(*((void *)&v199 + 1) + 8 * j) itemFeedbackType:4];
        [v103 addObject:v122];
      }
      uint64_t v119 = [v117 countByEnumeratingWithState:&v199 objects:&buf count:16];
    }
    while (v119);
  }

  v123 = [PPInternalFeedback alloc];
  v124 = [v174 timestamp];
  v125 = [v174 clientIdentifier];
  v126 = [v174 clientBundleId];
  v127 = [v174 mappingId];
  uint64_t v128 = [v174 storeType];
  v129 = [v174 build];
  v130 = [(PPInternalFeedback *)v123 initWithFeedbackItems:v103 timestamp:v124 clientIdentifier:v125 clientBundleId:v126 mappingId:v127 storeType:v128 build:v129];

  uint64_t v131 = *(void *)(v152 + 32);
  v132 = v130;
  if (v131)
  {
    v133 = objc_msgSend((id)objc_opt_class(), "storeTypeDescription:", -[PPInternalFeedback storeType](v132, "storeType"));
    v134 = pp_default_log_handle();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      v135 = [(PPBaseFeedback *)v132 feedbackItems];
      uint64_t v136 = [v135 count];
      *(_DWORD *)v210 = 138412546;
      v211 = v133;
      __int16 v212 = 2048;
      uint64_t v213 = v136;
      _os_log_impl(&dword_1CA9A8000, v134, OS_LOG_TYPE_DEFAULT, "filterPendingFeedbackItems(%@): Filtering %tu pending items", v210, 0x16u);
    }
    v137 = pp_default_log_handle();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
    {
      v138 = [(PPBaseFeedback *)v132 timestamp];
      v139 = [(PPBaseFeedback *)v132 clientIdentifier];
      v140 = [(PPBaseFeedback *)v132 clientBundleId];
      v141 = [(PPBaseFeedback *)v132 mappingId];
      *(_DWORD *)v210 = 138413314;
      v211 = v133;
      __int16 v212 = 2112;
      uint64_t v213 = (uint64_t)v138;
      __int16 v214 = 2112;
      v215 = v139;
      __int16 v216 = 2112;
      v217 = v140;
      __int16 v218 = 2112;
      v219 = v141;
      _os_log_impl(&dword_1CA9A8000, v137, OS_LOG_TYPE_INFO, "filterPendingFeedbackItems(%@): Filtering items for (%@, %@, %@, %@)", v210, 0x34u);
    }
    v142 = [(PPBaseFeedback *)v132 feedbackItems];
    uint64_t v143 = [v142 count];

    if (v143)
    {
      switch([(PPInternalFeedback *)v132 storeType])
      {
        case 1u:
          v144 = -[PPFeedbackStorage namedEntityStore](v131);
          goto LABEL_92;
        case 2u:
          v144 = -[PPFeedbackStorage topicStore](v131);
          goto LABEL_92;
        case 3u:
          v144 = -[PPFeedbackStorage locationStore](v131);
          goto LABEL_92;
        case 4u:
          v145 = pp_default_log_handle();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR)) {
            goto LABEL_86;
          }
          break;
        case 5u:
          v145 = pp_default_log_handle();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
          {
LABEL_86:
            v147 = objc_msgSend((id)objc_opt_class(), "storeTypeDescription:", -[PPInternalFeedback storeType](v132, "storeType"));
            *(_DWORD *)v210 = 138412290;
            v211 = v147;
            _os_log_error_impl(&dword_1CA9A8000, v145, OS_LOG_TYPE_ERROR, "found pending items for unsupported PPStoreType value of %@", v210, 0xCu);
          }
          break;
        case 6u:
          v148 = *(void **)(v131 + 64);
          if (v148) {
            goto LABEL_90;
          }
          v144 = +[PPLocalConnectionsStore defaultStore];
          goto LABEL_92;
        case 7u:
          v148 = *(void **)(v131 + 40);
          if (v148)
          {
LABEL_90:
            v144 = v148;
          }
          else
          {
            v144 = +[PPLocalQuickTypeBroker sharedInstance];
          }
LABEL_92:
          v145 = v144;
          [v144 processFeedback:v132];
          break;
        default:
          v145 = pp_default_log_handle();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_FAULT))
          {
            int v146 = [(PPInternalFeedback *)v132 storeType];
            *(_DWORD *)v210 = 67109120;
            LODWORD(v211) = v146;
            _os_log_fault_impl(&dword_1CA9A8000, v145, OS_LOG_TYPE_FAULT, "found pending items for invalid PPStoreType value of %u", v210, 8u);
          }
          break;
      }
    }
  }

  uint64_t v149 = (*(uint64_t (**)(void))(*(void *)(v152 + 40) + 16))();

  return v149;
}

- (id)namedEntityStore
{
  v1 = *(void **)(a1 + 16);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = +[PPLocalNamedEntityStore defaultStore];
  }
  return v2;
}

- (id)topicStore
{
  v1 = *(void **)(a1 + 24);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = +[PPLocalTopicStore defaultStore];
  }
  return v2;
}

- (id)locationStore
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = +[PPLocalLocationStore defaultStore];
  }
  return v2;
}

void __101__PPFeedbackStorage__performAttributionForMappedTopic_baseFeedback_feedbackType_shouldContinueBlock___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(uint64_t (**)(uint64_t))(v5 + 16);
  id v7 = a2;
  if ((v6(v5) & 1) == 0) {
    *a3 = 1;
  }
  uint64_t v8 = *(void **)(a1 + 32);
  id v10 = [v7 topic];
  id v9 = [v10 topicIdentifier];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

id __101__PPFeedbackStorage__performAttributionForMappedTopic_baseFeedback_feedbackType_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 unsignedIntegerValue];

  id v6 = objc_msgSend(v4, "initWithFormat:", @"Q%tu", v5);
  return v6;
}

uint64_t __49__PPFeedbackStorage__saveLastProcessedTimestamp___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return +[PPSQLKVStore setNumber:v2 forKey:@"pendingFeedbackProcessedDate" transaction:a2];
  }
  return result;
}

uint64_t __44__PPFeedbackStorage__lastProcessedTimestamp__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[PPSQLKVStore numberForKey:@"pendingFeedbackProcessedDate" transaction:a2];
  return MEMORY[0x1F41817F8]();
}

- (id)mappedTopicsPendingFeedbackWithShouldContinueBlock:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__20198;
  v24 = __Block_byref_object_dispose__20199;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__20198;
  v18 = __Block_byref_object_dispose__20199;
  id v19 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke;
  v13[3] = &unk_1E65D9E10;
  v13[4] = &v14;
  if ([(_PASLock *)lock runWithLockAcquired:v13 shouldContinueBlock:v4] == 1)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [(id)v15[5] filterWithIsIncluded:&__block_literal_global_115];
    uint64_t v8 = [v7 mapWithTransform:&__block_literal_global_118];
    id v9 = [v8 collect];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke_5;
    v12[3] = &unk_1E65DAFF8;
    v12[4] = &v20;
    id v10 = (id)[v9 sinkWithCompletion:&__block_literal_global_120_20285 receiveInput:v12];

    id v6 = (id)v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v6;
}

uint64_t __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 publisherFromStartTime:0.0];
  return MEMORY[0x1F41817F8]();
}

void __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke_5(uint64_t a1, void *a2)
{
}

uint64_t __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 eventBody];
}

BOOL __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 eventBody];
  if ([v3 isMapped])
  {
    id v4 = [v2 eventBody];
    BOOL v5 = [v4 storeType] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)deleteExpiredFeedbackWithShouldContinueBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PPFeedbackStorage_deleteExpiredFeedbackWithShouldContinueBlock___block_invoke;
  v8[3] = &unk_1E65D9DE8;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [(_PASLock *)lock runWithLockAcquired:v8 shouldContinueBlock:v6];
  LOBYTE(lock) = *((unsigned char *)v12 + 24) == 0;

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __66__PPFeedbackStorage_deleteExpiredFeedbackWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PPFeedbackStorage_deleteExpiredFeedbackWithShouldContinueBlock___block_invoke_2;
  v4[3] = &unk_1E65D9DC0;
  id v5 = *(id *)(a1 + 32);
  [a2 pruneExpiredEventsWithBlock:v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __66__PPFeedbackStorage_deleteExpiredFeedbackWithShouldContinueBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0) {
    *a2 = 1;
  }
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    double v7 = a3;
    _os_log_debug_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEBUG, "PPFeedbackStorage: deleted feedback from %lf", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)storePendingFeedback:(id)a3 storeType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v5 = a4;
  double v7 = a3;
  uint64_t v8 = [v7 clientBundleId];

  if (v8)
  {
    [v7 setStoreType:v5];
    id v9 = [v7 clientIdentifier];
    int v10 = [v9 isEqualToString:@"ICLex"];

    if (v10)
    {
      uint64_t v11 = v7;
      double v7 = v11;
      if (self)
      {
        uint64_t v32 = 0;
        id v33 = &v32;
        uint64_t v34 = 0x3032000000;
        v35 = __Block_byref_object_copy__20198;
        uint64_t v36 = __Block_byref_object_dispose__20199;
        id v37 = 0;
        lock = self->_lock;
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        uint64_t v39 = 3221225472;
        v40 = __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke;
        v41 = &unk_1E65D9D98;
        double v7 = v11;
        LOBYTE(v44) = v5;
        v42 = v7;
        v43 = &v32;
        [(_PASLock *)lock runWithLockAcquired:buf];
        uint64_t v13 = (id)v33[5];

        _Block_object_dispose(&v32, 8);
        if (v13)
        {
          char v14 = v13;
          uint64_t v32 = 0;
          id v33 = &v32;
          uint64_t v34 = 0x2020000000;
          LOBYTE(v35) = 1;
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          uint64_t v16 = self->_lock;
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          uint64_t v39 = 3221225472;
          v40 = __44__PPFeedbackStorage__removeExistingSession___block_invoke;
          v41 = &unk_1E65D9D00;
          double v44 = Current + -40.0;
          uint64_t v13 = v14;
          v42 = v13;
          v43 = &v32;
          [(_PASLock *)v16 runWithLockAcquired:buf];
          LODWORD(v16) = *((unsigned __int8 *)v33 + 24);

          _Block_object_dispose(&v32, 8);
          if (v16)
          {
            v17 = [v13 feedbackItems];
            uint64_t v29 = (void *)[v17 mutableCopy];

            v18 = [v7 feedbackItems];
            [v29 addObjectsFromArray:v18];

            uint64_t v28 = [PPInternalFeedback alloc];
            id v19 = [v13 timestamp];
            uint64_t v20 = [v13 clientIdentifier];
            v21 = [v13 clientBundleId];
            uint64_t v22 = [v13 mappingId];
            id v23 = [v13 build];
            uint64_t v24 = [(PPInternalFeedback *)v28 initWithFeedbackItems:v29 timestamp:v19 clientIdentifier:v20 clientBundleId:v21 mappingId:v22 storeType:v5 build:v23];

            double v7 = v24;
          }
        }
      }
      else
      {

        uint64_t v13 = 0;
      }
    }
    id v25 = self->_lock;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __58__PPFeedbackStorage_storePendingFeedback_storeType_error___block_invoke;
    v30[3] = &unk_1E65D9CB0;
    double v7 = v7;
    v31 = v7;
    [(_PASLock *)v25 runWithLockAcquired:v30];
    v26 = v31;
  }
  else
  {
    v26 = pp_default_log_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_ERROR, "nil clientBundleId in client feedback", buf, 2u);
    }
  }

  return v8 != 0;
}

void __58__PPFeedbackStorage_storePendingFeedback_storeType_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)MEMORY[0x1CB79D060]();
  id v4 = [v5 source];
  [v4 sendEvent:*(void *)(a1 + 32)];
}

void __44__PPFeedbackStorage__removeExistingSession___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PPFeedbackStorage__removeExistingSession___block_invoke_2;
  v6[3] = &unk_1E65D9CD8;
  uint64_t v9 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 pruneWithPredicateBlock:v6];
}

uint64_t __44__PPFeedbackStorage__removeExistingSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  if (v4 >= *(double *)(a1 + 48))
  {
    int v6 = [v3 eventBody];
    uint64_t v5 = [v6 isEqual:*(void *)(a1 + 32)];

    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v7 + 24)) {
      char v8 = v5;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)(v7 + 24) = v8;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 publisherFromStartTime:CFAbsoluteTimeGetCurrent() + -30.0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_2;
  v8[3] = &unk_1E65D9D28;
  id v9 = *(id *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 48);
  uint64_t v5 = [v4 filterWithIsIncluded:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_109;
  v7[3] = &unk_1E65D9D70;
  v7[4] = *(void *)(a1 + 40);
  id v6 = (id)[v5 sinkWithCompletion:&__block_literal_global_20292 receiveInput:v7];
}

uint64_t __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 eventBody];
  uint64_t v5 = [v4 mappingId];
  id v6 = [*(id *)(a1 + 32) mappingId];
  if (v5 == v6)
  {
    int v10 = 1;
  }
  else
  {
    uint64_t v7 = [v3 eventBody];
    char v8 = [v7 mappingId];
    id v9 = [*(id *)(a1 + 32) mappingId];
    int v10 = [v8 isEqual:v9];
  }
  uint64_t v11 = [v3 eventBody];
  if ([v11 storeType] == *(unsigned __int8 *)(a1 + 40))
  {
    double v12 = [v3 eventBody];
    uint64_t v13 = [v12 clientIdentifier];
    char v14 = [*(id *)(a1 + 32) clientIdentifier];
    if ([v13 isEqual:v14])
    {
      id v15 = [v3 eventBody];
      uint64_t v16 = [v15 clientBundleId];
      v17 = [*(id *)(a1 + 32) clientBundleId];
      uint64_t v18 = [v16 isEqual:v17] & v10;
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

uint64_t __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_109(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 eventBody];
  return MEMORY[0x1F41817F8]();
}

void __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = pp_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      double v4 = [v2 error];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "PPFeedbackStorage: error processing sessions, starting a new one. %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (PPFeedbackStorage)init
{
  id v3 = +[PPSQLDatabase sharedInstance];
  if (v3)
  {
    double v4 = +[PPPaths subdirectory:@"streams"];
    id v5 = v3;
    id v6 = v4;
    if (self)
    {
      v16.receiver = self;
      v16.super_class = (Class)PPFeedbackStorage;
      uint64_t v7 = [(PPFeedbackStorage *)&v16 init];
      self = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_db, v3);
        objc_storeStrong((id *)&self->_namedEntityStoreOverride, 0);
        objc_storeStrong((id *)&self->_topicStoreOverride, 0);
        objc_storeStrong((id *)&self->_locationStoreOverride, 0);
        objc_storeStrong((id *)&self->_quickTypeBrokerOverride, 0);
        objc_storeStrong((id *)&self->_contactStoreOverride, 0);
        objc_storeStrong((id *)&self->_eventStoreOverride, 0);
        objc_storeStrong((id *)&self->_connectionsStoreOverride, 0);
        char v8 = (void *)[objc_alloc(MEMORY[0x1E4F50278]) initWithStoreBasePath:v6 segmentSize:8 * NSPageSize()];
        id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:1 filterByAgeOnRead:1 maxAge:51200 maxStreamSize:86400.0];
        [v8 setPruningPolicy:v9];
        int v10 = (void *)[objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"portraitFeedback" storeConfig:v8];
        uint64_t v11 = (_PASLock *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v10];
        lock = self->_lock;
        self->_lock = v11;
      }
    }

    self = self;
    uint64_t v13 = self;
  }
  else
  {
    char v14 = pp_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v16.receiver) = 0;
      _os_log_fault_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_FAULT, "Failed to get db instance", (uint8_t *)&v16, 2u);
    }

    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)storeTypeDescription:(unsigned __int8)a3
{
  if (a3 >= 8u) {
    id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"INVALID_VALUE_OF_%u", a3);
  }
  else {
    id v3 = off_1E65D9F60[a3];
  }
  return v3;
}

+ (void)logFeedback:(id)a3 domain:(unsigned __int8)a4 domainStatus:(unsigned __int8)a5 inBackground:(BOOL)a6
{
  unsigned int v35 = a4;
  BOOL v36 = a6;
  unsigned int v34 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 clientIdentifier];
  int v8 = [v7 isEqualToString:@"ICLex"];

  if (v8)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v9 = [v6 feedbackItems];
    context = (void *)[v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (context)
    {
      uint64_t v32 = *(void *)v40;
      id v33 = v6;
      obuint64_t j = v9;
      do
      {
        for (uint64_t i = 0; i != context; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v40 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          double v12 = (void *)MEMORY[0x1CB79D060]();
          uint64_t v13 = (void *)MEMORY[0x1CB79D060]();
          v45[0] = @"clientId";
          char v14 = [v33 clientIdentifier];
          id v15 = objc_msgSend(v14, "_pas_stringBackedByUTF8CString");
          v46[0] = v15;
          v45[1] = @"mappingId";
          objc_super v16 = [v33 mappingId];
          v17 = v16;
          if (!v16)
          {
            v31 = objc_opt_new();
            v17 = v31;
          }
          v46[1] = v17;
          v45[2] = @"type";
          uint64_t v18 = +[PPMetricsUtils stringifyFeedbackType:](PPMetricsUtils, "stringifyFeedbackType:", [v11 itemFeedbackType]);
          v46[2] = v18;
          v45[3] = @"feedbackDomainStatus";
          id v19 = +[PPMetricsUtils stringifyFeedbackDomainStatus:v34];
          v46[3] = v19;
          v45[4] = @"domain";
          uint64_t v20 = +[PPMetricsUtils stringifyDomain:v35];
          v46[4] = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:5];

          if (!v16) {
          +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.FeedbackReceived" payload:v21 inBackground:v36];
          }
        }
        id v9 = obj;
        context = (void *)[obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (context);
      id v6 = v33;
    }
  }
  else
  {
    contexta = (void *)MEMORY[0x1CB79D060]();
    v43[0] = @"clientId";
    uint64_t v22 = [v6 clientIdentifier];
    v44[0] = v22;
    v43[1] = @"mappingId";
    id v23 = [v6 mappingId];
    uint64_t v24 = v23;
    if (!v23) {
      uint64_t v24 = objc_opt_new();
    }
    v44[1] = v24;
    v43[2] = @"type";
    id v25 = [v6 feedbackItems];
    v26 = [v25 firstObject];
    uint64_t v27 = +[PPMetricsUtils stringifyFeedbackType:](PPMetricsUtils, "stringifyFeedbackType:", [v26 itemFeedbackType]);
    v44[2] = v27;
    v43[3] = @"feedbackDomainStatus";
    uint64_t v28 = +[PPMetricsUtils stringifyFeedbackDomainStatus:v34];
    v44[3] = v28;
    v43[4] = @"domain";
    uint64_t v29 = +[PPMetricsUtils stringifyDomain:v35];
    v44[4] = v29;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:5];

    if (!v23) {
    +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.FeedbackReceived" payload:v9 inBackground:v36];
    }
  }
}

@end