@interface PHAQuestionController
- (BOOL)generateQuestionsWithOptions:(int64_t)a3 limit:(unint64_t)a4 handleQuestionVersionBump:(BOOL)a5 updateInvalidQuestions:(BOOL)a6 progress:(id)a7;
- (BOOL)generateQuestionsWithOptions:(int64_t)a3 progress:(id)a4;
- (BOOL)persistQuestions:(id)a3;
- (NSMutableDictionary)questionTypeImportanceByQuestionType;
- (NSUbiquitousKeyValueStore)store;
- (OS_os_log)loggingConnection;
- (PGManager)graphManager;
- (PGTrialSession)trialSession;
- (PHAQuestionController)initWithGraphManager:(id)a3;
- (double)importanceOfQuestionType:(id)a3;
- (id)allQuestionFactories;
- (id)currentQuestionsKVSData;
- (id)questionFactoriesForOptions:(int64_t)a3;
- (id)selectedQuestionsFromSortedQuestionsByQuestionType:(id)a3 withLimit:(unint64_t)a4;
- (void)_handleKVSQuestionsUpdateIfNeededWithProgressBlock:(id)a3;
- (void)_handleQuestionVersionBumpIfNeededWithProgressBlock:(id)a3;
- (void)_syncAnsweredQuestionsWithProgressBlock:(id)a3;
- (void)_updateInvalidQuestionsWithProgressBlock:(id)a3;
- (void)assignScoreToQuestions:(id)a3;
- (void)removeCurrentKVSData;
- (void)setGraphManager:(id)a3;
- (void)setQuestionTypeImportanceByQuestionType:(id)a3;
- (void)setStore:(id)a3;
- (void)setTrialSession:(id)a3;
@end

@implementation PHAQuestionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_questionTypeImportanceByQuestionType, 0);
  objc_storeStrong((id *)&self->_trialSession, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);

  objc_storeStrong((id *)&self->_graphManager, 0);
}

- (void)setStore:(id)a3
{
}

- (NSUbiquitousKeyValueStore)store
{
  return self->_store;
}

- (void)setQuestionTypeImportanceByQuestionType:(id)a3
{
}

- (NSMutableDictionary)questionTypeImportanceByQuestionType
{
  return self->_questionTypeImportanceByQuestionType;
}

- (void)setTrialSession:(id)a3
{
}

- (PGTrialSession)trialSession
{
  return self->_trialSession;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setGraphManager:(id)a3
{
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (void)removeCurrentKVSData
{
  [(NSUbiquitousKeyValueStore *)self->_store removeObjectForKey:@"PHQuestionKVSDataKey"];
  store = self->_store;

  [(NSUbiquitousKeyValueStore *)store synchronize];
}

- (id)currentQuestionsKVSData
{
  return [(NSUbiquitousKeyValueStore *)self->_store arrayForKey:@"PHQuestionKVSDataKey"];
}

- (void)_handleKVSQuestionsUpdateIfNeededWithProgressBlock:(id)a3
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  v118 = (void (**)(id, unsigned char *, double))a3;
  v4 = [(PHAQuestionController *)self loggingConnection];
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PhotosChallengeQuestionKVSUpdate", "", buf, 2u);
  }

  uint64_t v8 = mach_absolute_time();
  v9 = [(PHAQuestionController *)self currentQuestionsKVSData];
  unint64_t v10 = [v9 count];
  if (!v10) {
    goto LABEL_106;
  }
  uint64_t v98 = v8;
  unint64_t v99 = v5 - 1;
  os_signpost_id_t spid = v5;
  v111 = v7;
  unsigned __int8 v140 = 0;
  double v11 = 1.0 / (double)v10;
  v115 = [MEMORY[0x1E4F1CA80] set];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  v107 = v9;
  obuint64_t j = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v136 objects:v149 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v137;
    double v15 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v137 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        v18 = [v17 objectForKeyedSubscript:@"syncedEntityIdentifier"];
        v19 = [v17 objectForKeyedSubscript:@"entityType"];
        __int16 v20 = [v19 unsignedIntValue];

        if (v18)
        {
          if ((v20 & 0xFFF7) == 0 || v20 == 3) {
            [v115 addObject:v18];
          }
        }
        double v15 = v15 + v11 * 0.1;
        v118[2](v118, &v140, v15);
        int v22 = v140;

        if (v22)
        {
          v23 = obj;
          goto LABEL_105;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v136 objects:v149 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v15 = 0.0;
  }

  v23 = [(PGManager *)self->_graphManager photoLibrary];
  v24 = [v23 librarySpecificFetchOptions];
  v25 = (void *)MEMORY[0x1E4F38EB8];
  v26 = [v115 allObjects];
  v27 = [v25 fetchAssetsWithCloudIdentifiers:v26 options:v24];

  if (![v27 count])
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_392);
    }
    v28 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v143 = v115;
      _os_log_impl(&dword_1D21F2000, v28, OS_LOG_TYPE_DEFAULT, "[Questions] No assets found with syncedEntityIdentifiers %@", buf, 0xCu);
    }
  }
  v118[2](v118, &v140, 0.2);
  if (!v140)
  {
    v91 = v24;
    v94 = v23;
    v29 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    v90 = v27;
    id v30 = v27;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v132 objects:v148 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v133;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v133 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v132 + 1) + 8 * j);
          v36 = [v35 cloudIdentifier];
          v37 = [v35 uuid];
          [v29 setObject:v37 forKeyedSubscript:v36];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v132 objects:v148 count:16];
      }
      while (v32);
    }

    v118[2](v118, &v140, 0.3);
    if (v140)
    {
LABEL_103:

      v7 = v111;
      v23 = v94;
      v27 = v90;
      v24 = v91;
      goto LABEL_104;
    }
    v92 = [MEMORY[0x1E4F1CA60] dictionary];
    v93 = [MEMORY[0x1E4F1CA48] array];
    v96 = [MEMORY[0x1E4F1CA48] array];
    v100 = [v94 librarySpecificFetchOptions];
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v95 = obj;
    uint64_t v102 = [v95 countByEnumeratingWithState:&v128 objects:v147 count:16];
    if (v102)
    {
      uint64_t v101 = *(void *)v129;
      while (2)
      {
        for (uint64_t k = 0; k != v102; ++k)
        {
          if (*(void *)v129 != v101) {
            objc_enumerationMutation(v95);
          }
          v39 = *(void **)(*((void *)&v128 + 1) + 8 * k);
          context = (void *)MEMORY[0x1D26057A0]();
          v40 = [v39 objectForKeyedSubscript:@"syncedEntityIdentifier"];
          v41 = [v39 objectForKeyedSubscript:@"type"];
          unsigned __int16 v42 = [v41 unsignedIntValue];

          v43 = [v39 objectForKeyedSubscript:@"entityType"];
          unsigned __int16 v44 = [v43 unsignedIntValue];

          v45 = [v39 objectForKeyedSubscript:@"state"];
          unsigned __int16 v46 = [v45 unsignedIntValue];

          v47 = [v39 objectForKeyedSubscript:@"additionalInfo"];
          id obja = [v39 objectForKeyedSubscript:@"creationDate"];
          v48 = [v39 objectForKeyedSubscript:@"score"];
          [v48 doubleValue];
          double v50 = v49;

          id v51 = v40;
          v52 = v51;
          uint64_t v53 = v44;
          unsigned __int16 v113 = v42;
          if ((v44 & 0xFFF7) != 0 && (uint64_t v54 = (uint64_t)v51, v44 != 3)
            || ([v29 objectForKeyedSubscript:v51],
                uint64_t v54 = objc_claimAutoreleasedReturnValue(),
                v52,
                uint64_t v53 = v44,
                v54))
          {
            int v104 = v53;
            v105 = v39;
            unsigned __int16 v106 = v44;
            unsigned __int16 v109 = v46;
            v110 = v52;
            uint64_t v108 = k;
            v114 = (void *)v54;
            int v103 = v42;
            v55 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"type = %d AND entityType = %d AND entityIdentifier = %@", v42, v53, v54];
            [v100 setPredicate:v55];

            v56 = [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v100 validQuestionsOnly:0];
            long long v124 = 0u;
            long long v125 = 0u;
            long long v126 = 0u;
            long long v127 = 0u;
            id v57 = v56;
            uint64_t v58 = [v57 countByEnumeratingWithState:&v124 objects:v146 count:16];
            if (v58)
            {
              uint64_t v59 = v58;
              uint64_t v60 = *(void *)v125;
LABEL_47:
              uint64_t v61 = 0;
              while (1)
              {
                if (*(void *)v125 != v60) {
                  objc_enumerationMutation(v57);
                }
                v62 = *(void **)(*((void *)&v124 + 1) + 8 * v61);
                v63 = [v62 additionalInfo];
                if (![v63 count] && !objc_msgSend(v47, "count")) {
                  break;
                }
                v64 = [v62 additionalInfo];
                char v65 = [v64 isEqualToDictionary:v47];

                if (v65) {
                  goto LABEL_62;
                }
                if (v59 == ++v61)
                {
                  uint64_t v59 = [v57 countByEnumeratingWithState:&v124 objects:v146 count:16];
                  if (v59) {
                    goto LABEL_47;
                  }
                  goto LABEL_55;
                }
              }

LABEL_62:
              id v69 = v62;

              if (!v69) {
                goto LABEL_70;
              }
              int v70 = [v69 state];
              if (v109 && v70 != v109)
              {
                id v71 = [v69 uuid];
                if (__PXLog_genericOnceToken != -1) {
                  dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_401);
                }
                v72 = __PXLog_genericOSLog;
                if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v143 = v71;
                  _os_log_impl(&dword_1D21F2000, v72, OS_LOG_TYPE_INFO, "[Questions] Updating question state for question %@", buf, 0xCu);
                }
                v73 = [NSNumber numberWithUnsignedShort:v109];
                [v92 setObject:v73 forKeyedSubscript:v71];

                [v93 addObject:v69];
                goto LABEL_75;
              }
            }
            else
            {
LABEL_55:

LABEL_70:
              if (__PXLog_genericOnceToken != -1) {
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_404);
              }
              v74 = __PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v143 = v103;
                *(_WORD *)&v143[4] = 2112;
                *(void *)&v143[6] = v114;
                *(_WORD *)&v143[14] = 1024;
                *(_DWORD *)&v143[16] = v104;
                __int16 v144 = 2112;
                v145 = v47;
                _os_log_impl(&dword_1D21F2000, v74, OS_LOG_TYPE_INFO, "[Questions] Syncing new question of type %d with entity identifier: %@ for entity type: %d and additionalInfo: %@", buf, 0x22u);
              }
              v75 = [v105 objectForKeyedSubscript:@"displayType"];
              unsigned __int16 v76 = [v75 unsignedIntValue];

              id v71 = objc_alloc_init(MEMORY[0x1E4F8D930]);
              [v71 setEntityIdentifier:v114];
              [v71 setType:v113];
              [v71 setState:v109];
              [v71 setEntityType:v106];
              [v71 setDisplayType:v76];
              [v71 setScore:v50];
              [v71 setAdditionalInfo:v47];
              [v71 setCreationDate:obja];
              [v96 addObject:v71];
              id v69 = 0;
LABEL_75:
            }
            double v15 = v15 + v11 * 0.6;
            v118[2](v118, &v140, v15);
            int v77 = v140;

            v67 = v114;
            if (v77)
            {

              goto LABEL_102;
            }
            uint64_t k = v108;
            v68 = context;
            v52 = v110;
          }
          else
          {
            if (__PXLog_genericOnceToken != -1) {
              dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_395);
            }
            v66 = __PXLog_genericOSLog;
            if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v143 = v52;
              _os_log_impl(&dword_1D21F2000, v66, OS_LOG_TYPE_DEFAULT, "[Questions] No entityIdentifier found for asset syncedEntityIdentifier %@", buf, 0xCu);
            }
            v67 = 0;
            v68 = context;
          }
        }
        uint64_t v102 = [v95 countByEnumeratingWithState:&v128 objects:v147 count:16];
        if (v102) {
          continue;
        }
        break;
      }
    }

    if (![v96 count] && !objc_msgSend(v93, "count"))
    {
LABEL_96:
      uint64_t v85 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v88 = v111;
      v89 = v88;
      if (v99 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D21F2000, v89, OS_SIGNPOST_INTERVAL_END, spid, "PhotosChallengeQuestionKVSUpdate", "", buf, 2u);
      }

      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v143 = "PhotosChallengeQuestionKVSUpdate";
        *(_WORD *)&v143[8] = 2048;
        *(double *)&v143[10] = (float)((float)((float)((float)(v85 - v98) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D21F2000, v89, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v118[2](v118, &v140, 1.0);
LABEL_102:

      goto LABEL_103;
    }
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_406;
    v120[3] = &unk_1E6918C28;
    id v121 = v93;
    id v122 = v92;
    id v123 = v96;
    id v119 = 0;
    int v78 = [v94 performChangesAndWait:v120 error:&v119];
    id v79 = v119;
    if (v79)
    {
      if (__PXLog_genericOnceToken != -1) {
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_408);
      }
      v80 = (void *)__PXLog_genericOSLog;
      if (!os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      v81 = v80;
      v82 = [v79 description];
      *(_DWORD *)buf = 138412290;
      *(void *)v143 = v82;
      _os_log_error_impl(&dword_1D21F2000, v81, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for updated questions: %@", buf, 0xCu);
    }
    else
    {
      v83 = @"NO";
      if (v78) {
        v83 = @"YES";
      }
      v81 = v83;
      if (__PXLog_genericOnceToken != -1) {
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_411);
      }
      v84 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v143 = v81;
        _os_log_impl(&dword_1D21F2000, v84, OS_LOG_TYPE_INFO, "[Questions] Succeeded updating questions: %@", buf, 0xCu);
      }
    }

LABEL_95:
    goto LABEL_96;
  }
LABEL_104:

LABEL_105:
  v9 = v107;

LABEL_106:
}

void __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_406(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v36 objects:v41 count:16];
  unint64_t v4 = 0x1E4F39000uLL;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v9 = [MEMORY[0x1E4F39258] changeRequestForQuestion:v8];
        unint64_t v10 = *(void **)(a1 + 40);
        double v11 = [v8 uuid];
        uint64_t v12 = [v10 objectForKeyedSubscript:v11];
        unsigned __int16 v13 = [v12 unsignedIntValue];

        [v9 setState:v13];
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v5);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = *(id *)(a1 + 48);
  uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v31 = *(void **)(v4 + 600);
        v16 = [v15 entityIdentifier];
        uint64_t v17 = [v15 type];
        uint64_t v18 = [v15 state];
        uint64_t v19 = [v15 entityType];
        uint64_t v20 = [v15 displayType];
        [v15 score];
        double v22 = v21;
        [v15 additionalInfo];
        v24 = unint64_t v23 = v4;
        v25 = [v15 creationDate];
        LOWORD(v27) = [v15 questionVersion];
        id v26 = (id)[v31 creationRequestForQuestionWithEntityIdentifier:v16 type:v17 state:v18 entityType:v19 displayType:v20 score:v24 additionalInfo:v22 creationDate:v25 questionVersion:v27];

        unint64_t v4 = v23;
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v30);
  }
}

uint64_t __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_409()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_402()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_399()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke_393()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __76__PHAQuestionController__handleKVSQuestionsUpdateIfNeededWithProgressBlock___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (void)_syncAnsweredQuestionsWithProgressBlock:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  char v65 = (void (**)(id, unsigned char *, double))a3;
  unint64_t v4 = [(PHAQuestionController *)self loggingConnection];
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v6 = v4;
  v7 = v6;
  unint64_t v60 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PhotosChallengeQuestionKVSSync", "", buf, 2u);
  }
  os_signpost_id_t spid = v5;

  uint64_t v56 = mach_absolute_time();
  uint64_t v61 = self;
  uint64_t v8 = [(PGManager *)self->_graphManager photoLibrary];
  v9 = [v8 librarySpecificFetchOptions];
  unint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"entityType != %d", 7);
  [v9 setPredicate:v10];

  double v11 = [MEMORY[0x1E4F39250] fetchAnsweredQuestionsWithOptions:v9 validQuestionsOnly:1];
  uint64_t v12 = [v11 count];
  if (!v12) {
    goto LABEL_42;
  }
  unint64_t v13 = v12;
  uint64_t v58 = v7;
  uint64_t v59 = v9;
  char v76 = 0;
  id v57 = v8;
  v67 = [v8 librarySpecificFetchOptions];
  [v67 setFetchLimit:1];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v64 = v63 = v11;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = v11;
  uint64_t v14 = [obj countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (!v14) {
    goto LABEL_36;
  }
  uint64_t v15 = v14;
  double v16 = 1.0 / (double)v13;
  uint64_t v17 = *(void *)v73;
  uint64_t v62 = *MEMORY[0x1E4F397F0];
  double v18 = 0.0;
  uint64_t v66 = *(void *)v73;
  do
  {
    uint64_t v19 = 0;
    uint64_t v68 = v15;
    do
    {
      if (*(void *)v73 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void **)(*((void *)&v72 + 1) + 8 * v19);
      double v21 = (void *)MEMORY[0x1D26057A0]();
      double v22 = [v20 entityIdentifier];
      if ([v20 entityType]
        && [v20 entityType] != 3
        && [v20 entityType] != 8)
      {
        v28 = v22;
        goto LABEL_21;
      }
      if ([v20 type] == 18) {
        goto LABEL_34;
      }
      unint64_t v23 = (void *)MEMORY[0x1E4F38EB8];
      v24 = [v20 entityIdentifier];
      v82 = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
      id v26 = [v23 fetchAssetsWithLocalIdentifiers:v25 options:v67];
      uint64_t v27 = [v26 firstObject];

      v28 = [v27 cloudIdentifier];

      if ([v28 length])
      {

LABEL_21:
        uint64_t v33 = [v20 additionalInfo];
        long long v34 = (void *)v33;
        long long v35 = (void *)MEMORY[0x1E4F1CC08];
        if (v33) {
          long long v35 = (void *)v33;
        }
        id v36 = v35;

        context = v21;
        if ([v20 type] == 29)
        {
          long long v37 = (void *)[v36 mutableCopy];
          [v37 removeObjectForKey:v62];

          id v36 = v37;
        }
        v79[0] = v28;
        v78[0] = @"syncedEntityIdentifier";
        v78[1] = @"type";
        long long v38 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v20, "type"));
        v79[1] = v38;
        v78[2] = @"entityType";
        long long v39 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v20, "entityType"));
        v79[2] = v39;
        v78[3] = @"state";
        v40 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v20, "state"));
        v79[3] = v40;
        v78[4] = @"displayType";
        v41 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v20, "displayType"));
        v79[4] = v41;
        v79[5] = v36;
        id v71 = v36;
        v78[5] = @"additionalInfo";
        v78[6] = @"score";
        uint64_t v42 = NSNumber;
        [v20 score];
        v43 = objc_msgSend(v42, "numberWithDouble:");
        v79[6] = v43;
        v78[7] = @"creationDate";
        unsigned __int16 v44 = [v20 creationDate];
        v79[7] = v44;
        v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:8];

        if ([MEMORY[0x1E4F28F98] propertyList:v45 isValidForFormat:200])
        {
          [v64 addObject:v45];
          double v18 = v16 + v18;
          v65[2](v65, &v76, v18);
          double v11 = v63;
          if (v76)
          {

            uint64_t v8 = v57;
            v7 = v58;
            goto LABEL_41;
          }
        }
        else
        {
          if (__PXLog_genericOnceToken != -1) {
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_383);
          }
          unsigned __int16 v46 = (void *)__PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
          {
            v47 = v46;
            int v48 = [v20 type];
            double v49 = [v20 uuid];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v81 = v48;
            *(_WORD *)&v81[4] = 2112;
            *(void *)&v81[6] = v49;
            _os_log_error_impl(&dword_1D21F2000, v47, OS_LOG_TYPE_ERROR, "[Questions] questionDataFormatValid == NO, not syncing question. Question Type: %d. Question UUID: %@", buf, 0x12u);
          }
        }

        uint64_t v15 = v68;
        uint64_t v17 = v66;
        double v21 = context;
        goto LABEL_33;
      }
      id v71 = v27;
      if (__PXLog_genericOnceToken != -1) {
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_357);
      }
      uint64_t v29 = (void *)__PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = v29;
        uint64_t v31 = [v27 uuid];
        long long v32 = [v20 uuid];
        *(_DWORD *)buf = 138412546;
        *(void *)v81 = v31;
        *(_WORD *)&v81[8] = 2112;
        *(void *)&v81[10] = v32;
        _os_log_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_DEFAULT, "[Questions] cloudIdentifier not found for asset %@, not syncing question %@", buf, 0x16u);
      }
LABEL_33:

      double v22 = v28;
LABEL_34:

      ++v19;
    }
    while (v15 != v19);
    uint64_t v15 = [obj countByEnumeratingWithState:&v72 objects:v83 count:16];
  }
  while (v15);
LABEL_36:

  [(NSUbiquitousKeyValueStore *)v61->_store setArray:v64 forKey:@"PHQuestionKVSDataKey"];
  [(NSUbiquitousKeyValueStore *)v61->_store synchronizeWithCompletionHandler:&__block_literal_global_387];
  uint64_t v50 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v7 = v58;
  uint64_t v53 = v58;
  uint64_t v54 = v53;
  if (v60 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v54, OS_SIGNPOST_INTERVAL_END, spid, "PhotosChallengeQuestionKVSSync", "", buf, 2u);
  }

  uint64_t v8 = v57;
  double v11 = v63;
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v81 = "PhotosChallengeQuestionKVSSync";
    *(_WORD *)&v81[8] = 2048;
    *(double *)&v81[10] = (float)((float)((float)((float)(v50 - v56) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
LABEL_41:

  v9 = v59;
LABEL_42:
}

void __65__PHAQuestionController__syncAnsweredQuestionsWithProgressBlock___block_invoke_384(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_389);
    }
    uint64_t v3 = (void *)__PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      unint64_t v4 = v3;
      os_signpost_id_t v5 = [v2 description];
      int v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_1D21F2000, v4, OS_LOG_TYPE_ERROR, "[Questions] Store synchronize error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __65__PHAQuestionController__syncAnsweredQuestionsWithProgressBlock___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __65__PHAQuestionController__syncAnsweredQuestionsWithProgressBlock___block_invoke_381()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __65__PHAQuestionController__syncAnsweredQuestionsWithProgressBlock___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (void)_updateInvalidQuestionsWithProgressBlock:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void (**)(id, unsigned char *, double))a3;
  os_signpost_id_t v5 = [(PGManager *)self->_graphManager photoLibrary];
  int v6 = [v5 librarySpecificFetchOptions];
  char v39 = 0;
  v7 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:v6 validQuestionsOnly:0];
  v4[2](v4, &v39, 0.2);
  if (!v39)
  {
    v28 = v7;
    uint64_t v29 = v6;
    uint64_t v8 = [MEMORY[0x1E4F39250] questionsWithValidEntitiesFromQuestions:v7 photoLibrary:v5];
    v9 = [MEMORY[0x1E4F1CA80] set];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v35 + 1) + 8 * i) uuid];
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v12);
    }

    v4[2](v4, &v39, 0.4);
    v7 = v28;
    int v6 = v29;
    if (!v39)
    {
      double v16 = [v5 librarySpecificFetchOptions];
      uint64_t v17 = [MEMORY[0x1E4F39250] fetchInvalidatedQuestionsWithOptions:v16];
      v4[2](v4, &v39, 0.6);
      if (!v39)
      {
        double v18 = [MEMORY[0x1E4F39250] questionsWithValidEntitiesFromQuestions:v17 photoLibrary:v5];
        v4[2](v4, &v39, 0.8);
        if (!v39)
        {
          if ([v28 count] || objc_msgSend(v18, "count"))
          {
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __66__PHAQuestionController__updateInvalidQuestionsWithProgressBlock___block_invoke;
            v31[3] = &unk_1E6918C28;
            id v32 = v28;
            id v33 = v9;
            id v26 = v18;
            id v34 = v18;
            id v30 = 0;
            int v19 = [v5 performChangesAndWait:v31 error:&v30];
            id v27 = v30;
            if (v27)
            {
              if (__PXLog_genericOnceToken != -1) {
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_348);
              }
              uint64_t v20 = (void *)__PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
              {
                double v21 = v20;
                v24 = [v27 description];
                *(_DWORD *)buf = 138412290;
                v41 = v24;
                _os_log_error_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes to invalidate questions: %@", buf, 0xCu);
              }
            }
            else
            {
              double v22 = @"NO";
              if (v19) {
                double v22 = @"YES";
              }
              v25 = v22;
              if (__PXLog_genericOnceToken != -1) {
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_351);
              }
              unint64_t v23 = __PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v25;
                _os_log_impl(&dword_1D21F2000, v23, OS_LOG_TYPE_INFO, "[Questions] Succeeded invalidating questions: %@", buf, 0xCu);
              }
            }
            double v18 = v26;
          }
          v4[2](v4, &v39, 1.0);
        }
      }
    }
  }
}

void __66__PHAQuestionController__updateInvalidQuestionsWithProgressBlock___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = *(void **)(a1 + 40);
        v9 = [v7 uuid];
        LOBYTE(v8) = [v8 containsObject:v9];

        if ((v8 & 1) == 0)
        {
          id v10 = [MEMORY[0x1E4F39258] changeRequestForQuestion:v7];
          [v10 setState:4];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = objc_msgSend(MEMORY[0x1E4F39258], "changeRequestForQuestion:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
        [v16 setState:0];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

uint64_t __66__PHAQuestionController__updateInvalidQuestionsWithProgressBlock___block_invoke_349()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __66__PHAQuestionController__updateInvalidQuestionsWithProgressBlock___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (void)_handleQuestionVersionBumpIfNeededWithProgressBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, unsigned char *, double))a3;
  uint64_t v5 = [(PGManager *)self->_graphManager photoLibrary];
  int v6 = [v5 librarySpecificFetchOptions];
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"questionVersion < %d", self->_currentQuestionVersion);
  [v6 setPredicate:v7];

  uint64_t v8 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:v6 validQuestionsOnly:0];
  char v16 = 0;
  v4[2](v4, &v16, 0.5);
  if (!v16)
  {
    if ([v8 count])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __77__PHAQuestionController__handleQuestionVersionBumpIfNeededWithProgressBlock___block_invoke;
      v14[3] = &unk_1E6918C50;
      id v15 = v8;
      id v13 = 0;
      int v9 = [v5 performChangesAndWait:v14 error:&v13];
      id v10 = v13;
      if (v9)
      {
        if (__PXLog_genericOnceToken != -1) {
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_343);
        }
        id v11 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_INFO, "[Questions] Succeeded handling question version bump", buf, 2u);
        }
      }
      else
      {
        if (__PXLog_genericOnceToken != -1) {
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_346_9227);
        }
        uint64_t v12 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v10;
          _os_log_error_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_ERROR, "[Questions] Failed to delete unanswered questions below current version with error: %@", buf, 0xCu);
        }
      }
    }
    v4[2](v4, &v16, 1.0);
  }
}

uint64_t __77__PHAQuestionController__handleQuestionVersionBumpIfNeededWithProgressBlock___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F39258] deleteQuestions:*(void *)(a1 + 32)];
}

uint64_t __77__PHAQuestionController__handleQuestionVersionBumpIfNeededWithProgressBlock___block_invoke_344()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __77__PHAQuestionController__handleQuestionVersionBumpIfNeededWithProgressBlock___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (id)allQuestionFactories
{
  v35[28] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PGManager *)self->_graphManager workingContext];
  id v34 = (void *)[objc_alloc(MEMORY[0x1E4F8D360]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[0] = v34;
  id v33 = (void *)[objc_alloc(MEMORY[0x1E4F8D780]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[1] = v33;
  id v32 = (void *)[objc_alloc(MEMORY[0x1E4F8D8C8]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[2] = v32;
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F8D850]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[3] = v31;
  id v30 = (void *)[objc_alloc(MEMORY[0x1E4F8D7C0]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[4] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F8D8A8]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[5] = v29;
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F8D950]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[6] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F8D718]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[7] = v27;
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F8D910]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[8] = v26;
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F8D640]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[9] = v25;
  long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F8D320]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[10] = v24;
  long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F8D7B8]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[11] = v23;
  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F8D888]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[12] = v22;
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F8D630]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[13] = v21;
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F8D7A0]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[14] = v20;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F8D798]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[15] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F8D938]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[16] = v18;
  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F8D878]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[17] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F8D8F0]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[18] = v16;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F8D8F8]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[19] = v15;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F8D368]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[20] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F8D328]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[21] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F8D3D8]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[22] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F8D958]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[23] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F8D768]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[24] = v8;
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F8D710]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[25] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F8D3E8]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[26] = v10;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F8D918]) initWithWorkingContext:v3 questionVersion:self->_currentQuestionVersion];
  v35[27] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:28];

  id v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];

  return v13;
}

- (id)questionFactoriesForOptions:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = [(PHAQuestionController *)self allQuestionFactories];
    uint64_t v5 = v4;
    if (a3 == 536838143)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA80] set];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if ((objc_msgSend(v12, "questionOptions", (void)v14) & a3) != 0) {
              [v6 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
  }

  return v6;
}

- (double)importanceOfQuestionType:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_questionTypeImportanceByQuestionType objectForKeyedSubscript:v4];
  unsigned __int16 v6 = [v4 unsignedIntegerValue];
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
    if (v6 <= 0x1Eu && ((0x7FFFFDFFu >> v6) & 1) != 0)
    {
      uint64_t v9 = off_1E6918C90[(__int16)v6];
      uint64_t v10 = [(PGTrialSession *)self->_trialSession levelForFactorName:v9 withNamespaceType:2];
      id v11 = v10;
      if (v10)
      {
        [v10 doubleValue];
        double v8 = v12;
      }
      else
      {
        if (__PXLog_genericOnceToken != -1) {
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_307);
        }
        id v13 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412290;
          long long v17 = v9;
          _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "nil level found for factor %@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
    long long v14 = [NSNumber numberWithDouble:v8];
    [(NSMutableDictionary *)self->_questionTypeImportanceByQuestionType setObject:v14 forKeyedSubscript:v4];
  }
  return v8;
}

uint64_t __50__PHAQuestionController_importanceOfQuestionType___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (BOOL)persistQuestions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGManager *)self->_graphManager photoLibrary];
  unsigned __int16 v6 = [MEMORY[0x1E4F1C9C8] date];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__PHAQuestionController_persistQuestions___block_invoke;
  v18[3] = &unk_1E6918C28;
  id v7 = v4;
  id v19 = v7;
  id v8 = v6;
  id v20 = v8;
  long long v21 = self;
  id v17 = 0;
  int v9 = [v5 performChangesAndWait:v18 error:&v17];
  id v10 = v17;
  if (!v10)
  {
    long long v14 = @"NO";
    if (v9) {
      long long v14 = @"YES";
    }
    double v12 = v14;
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_305);
    }
    long long v15 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v23 = v12;
      _os_log_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_INFO, "[Questions] Succeeded persisting questions: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (__PXLog_genericOnceToken != -1) {
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_296);
  }
  id v11 = (void *)__PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
  {
    double v12 = v11;
    id v13 = [v10 description];
    *(_DWORD *)buf = 138412290;
    long long v23 = v13;
    _os_log_error_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for questions: %@", buf, 0xCu);

LABEL_12:
  }

  return v9;
}

void __42__PHAQuestionController_persistQuestions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "persistWithCreationDate:questionVersion:", *(void *)(a1 + 40), *(__int16 *)(*(void *)(a1 + 48) + 8), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __42__PHAQuestionController_persistQuestions___block_invoke_303()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __42__PHAQuestionController_persistQuestions___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (void)assignScoreToQuestions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v10, "type"));
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];
        id v13 = v12;
        if (v12)
        {
          [v12 addObject:v10];
        }
        else
        {
          long long v14 = [MEMORY[0x1E4F1CA48] arrayWithObject:v10];
          [v4 setObject:v14 forKeyedSubscript:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localFactoryScore" ascending:0];
  uint64_t v24 = v15;
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__PHAQuestionController_assignScoreToQuestions___block_invoke;
  v18[3] = &unk_1E6918C00;
  id v19 = v16;
  id v17 = v16;
  [v4 enumerateKeysAndObjectsUsingBlock:v18];
}

void __48__PHAQuestionController_assignScoreToQuestions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  [v9 sortUsingDescriptors:*(void *)(a1 + 32)];
  uint64_t v4 = [v9 count];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = 0;
    double v7 = 1.0 / (double)(unint64_t)(v4 + 1);
    do
    {
      uint64_t v8 = [v9 objectAtIndexedSubscript:v6];
      [v8 setScore:v7 * (double)v5];

      ++v6;
      --v5;
    }
    while (v5);
  }
}

- (id)selectedQuestionsFromSortedQuestionsByQuestionType:(id)a3 withLimit:(unint64_t)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = v6;
  if (a4)
  {
    uint64_t v8 = [v6 allKeys];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __86__PHAQuestionController_selectedQuestionsFromSortedQuestionsByQuestionType_withLimit___block_invoke;
    v59[3] = &unk_1E6918BD8;
    v59[4] = self;
    id v9 = [v8 sortedArrayUsingComparator:v59];
    long long v10 = (void *)[v9 mutableCopy];

    id v11 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v12 = 0x1E4F1C000uLL;
    uint64_t v43 = v10;
    while (1)
    {
      id v13 = objc_msgSend(v7, "allValues", v43);
      uint64_t v14 = [v13 count];

      if (!v14) {
        break;
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v15 = v10;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v56;
        double v19 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v56 != v18) {
              objc_enumerationMutation(v15);
            }
            [(PHAQuestionController *)self importanceOfQuestionType:*(void *)(*((void *)&v55 + 1) + 8 * i)];
            double v19 = v19 + v21;
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v55 objects:v62 count:16];
        }
        while (v17);
      }
      else
      {
        double v19 = 0.0;
      }

      unsigned __int16 v46 = [*(id *)(v12 + 2688) set];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v22 = v15;
      uint64_t v44 = [v22 countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v52;
        double v23 = (double)a4;
        while (2)
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v52 != v45) {
              objc_enumerationMutation(v22);
            }
            uint64_t v25 = *(void *)(*((void *)&v51 + 1) + 8 * j);
            [(PHAQuestionController *)self importanceOfQuestionType:v25];
            double v27 = v26 / v19;
            double v28 = fmax(floor(v26 / v19 * v23), 1.0);
            if (v27 <= 0.0) {
              double v28 = 0.0;
            }
            unint64_t v29 = (unint64_t)v28;
            id v30 = [v7 objectForKeyedSubscript:v25];
            unint64_t v31 = [v30 count];
            if (v31 >= v29) {
              unint64_t v32 = v29;
            }
            else {
              unint64_t v32 = v31;
            }
            if (v32)
            {
              while (1)
              {
                id v33 = [v30 firstObject];
                [v30 removeObjectAtIndex:0];
                [v11 addObject:v33];

                if (!--a4) {
                  break;
                }
                if (!--v32) {
                  goto LABEL_26;
                }
              }

              long long v10 = v43;
              goto LABEL_43;
            }
LABEL_26:
            uint64_t v34 = [v30 count];
            if (v27 == 0.0 || v34 == 0) {
              [v46 addObject:v25];
            }
          }
          uint64_t v44 = [v22 countByEnumeratingWithState:&v51 objects:v61 count:16];
          if (v44) {
            continue;
          }
          break;
        }
      }

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v36 = v46;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v47 objects:v60 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v48;
        do
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v48 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void *)(*((void *)&v47 + 1) + 8 * k);
            [v7 removeObjectForKey:v41];
            [v22 removeObject:v41];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v60 count:16];
        }
        while (v38);
      }

      long long v10 = v43;
      unint64_t v12 = 0x1E4F1C000;
    }
LABEL_43:
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

uint64_t __86__PHAQuestionController_selectedQuestionsFromSortedQuestionsByQuestionType_withLimit___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 importanceOfQuestionType:a2];
  double v8 = v7;
  [*(id *)(a1 + 32) importanceOfQuestionType:v6];
  double v10 = v9;

  id v11 = [NSNumber numberWithDouble:v10];
  unint64_t v12 = [NSNumber numberWithDouble:v8];
  uint64_t v13 = [v11 compare:v12];

  return v13;
}

- (BOOL)generateQuestionsWithOptions:(int64_t)a3 limit:(unint64_t)a4 handleQuestionVersionBump:(BOOL)a5 updateInvalidQuestions:(BOOL)a6 progress:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  char v87 = 0;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke;
  v80[3] = &unk_1E6918B88;
  id v13 = v12;
  v82 = &v84;
  uint64_t v83 = 0;
  id v81 = v13;
  [(PHAQuestionController *)self _handleKVSQuestionsUpdateIfNeededWithProgressBlock:v80];
  if (*((unsigned char *)v85 + 24))
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_257);
    }
    uint64_t v14 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
    }
LABEL_21:
    LOBYTE(v17) = 0;
    goto LABEL_22;
  }
  if (v8)
  {
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_258;
    v76[3] = &unk_1E6918B88;
    uint64_t v79 = 0x3FB999999999999ALL;
    id v77 = v13;
    int v78 = &v84;
    [(PHAQuestionController *)self _handleQuestionVersionBumpIfNeededWithProgressBlock:v76];
    if (*((unsigned char *)v85 + 24))
    {
      if (__PXLog_genericOnceToken != -1) {
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_261_9269);
      }
      id v15 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
      }

      goto LABEL_21;
    }
  }
  if (v7)
  {
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_262;
    v72[3] = &unk_1E6918B88;
    uint64_t v75 = 0x3FC999999999999ALL;
    id v73 = v13;
    long long v74 = &v84;
    [(PHAQuestionController *)self _updateInvalidQuestionsWithProgressBlock:v72];
    if (*((unsigned char *)v85 + 24))
    {
      if (__PXLog_genericOnceToken != -1) {
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_265);
      }
      uint64_t v16 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
      }

      goto LABEL_21;
    }
  }
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_266;
  v68[3] = &unk_1E6918B88;
  uint64_t v71 = 0x3FD3333333333333;
  id v57 = v13;
  id v69 = v57;
  int v70 = &v84;
  [(PHAQuestionController *)self _syncAnsweredQuestionsWithProgressBlock:v68];
  if (*((unsigned char *)v85 + 24))
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_269_9272);
    }
    double v19 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
    }
    LOBYTE(v17) = 0;
  }
  else
  {
    long long v20 = [(PHAQuestionController *)self loggingConnection];
    os_signpost_id_t spid = os_signpost_id_generate(v20);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    double v21 = v20;
    id v22 = v21;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v22, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PhotosChallengeQuestionGeneration", "", buf, 2u);
    }
    long long v52 = v22;

    uint64_t v51 = mach_absolute_time();
    long long v54 = [(PHAQuestionController *)self questionFactoriesForOptions:a3];
    if ([v54 count])
    {
      long long v56 = [MEMORY[0x1E4F1CA60] dictionary];
      unint64_t v23 = [v54 count];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v24 = v54;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v63 objects:v95 count:16];
      if (v25)
      {
        double v26 = 0.6 / (double)v23;
        uint64_t v27 = *(void *)v64;
        double v28 = 0.4;
        obuint64_t j = v24;
        while (2)
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v64 != v27) {
              objc_enumerationMutation(obj);
            }
            id v30 = *(void **)(*((void *)&v63 + 1) + 8 * v29);
            double Current = CFAbsoluteTimeGetCurrent();
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_273;
            v58[3] = &unk_1E6918BB0;
            double v61 = v28;
            double v62 = v26;
            id v59 = v57;
            unint64_t v60 = &v84;
            unint64_t v32 = [v30 generateQuestionsWithLimit:a4 progressBlock:v58];
            uint64_t v17 = (void *)[v32 mutableCopy];

            if (*((unsigned char *)v85 + 24))
            {
              if (__PXLog_genericOnceToken != -1) {
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_276_9278);
              }
              long long v49 = __PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D21F2000, v49, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
              }

              LOBYTE(v17) = 0;
              uint64_t v41 = obj;
              goto LABEL_61;
            }
            id v33 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localFactoryScore" ascending:0];
            v94 = v33;
            uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
            [v17 sortUsingDescriptors:v34];

            long long v35 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v30, "questionType"));
            [v56 setObject:v17 forKeyedSubscript:v35];

            if (__PXLog_genericOnceToken != -1) {
              dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_285_9280);
            }
            id v36 = (id)__PXLog_genericOSLog;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              uint64_t v37 = (objc_class *)objc_opt_class();
              NSStringFromClass(v37);
              uint64_t v38 = (char *)(id)objc_claimAutoreleasedReturnValue();
              double v39 = CFAbsoluteTimeGetCurrent();
              uint64_t v40 = [v17 count];
              *(_DWORD *)buf = 138412802;
              v89 = v38;
              __int16 v90 = 2048;
              double v91 = v39 - Current;
              __int16 v92 = 2048;
              uint64_t v93 = v40;
              _os_log_impl(&dword_1D21F2000, v36, OS_LOG_TYPE_INFO, "[Performance] %@ took %.3fs to generate %tu questions", buf, 0x20u);
            }
            double v28 = v26 + v28;
            ++v29;
          }
          while (v25 != v29);
          id v24 = obj;
          uint64_t v25 = [obj countByEnumeratingWithState:&v63 objects:v95 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      uint64_t v41 = [(PHAQuestionController *)self selectedQuestionsFromSortedQuestionsByQuestionType:v56 withLimit:a4];
      [(PHAQuestionController *)self assignScoreToQuestions:v41];
      LODWORD(v17) = [(PHAQuestionController *)self persistQuestions:v41];
      if (v17)
      {
        int v42 = [v41 count];
        if (__PXLog_genericOnceToken != -1) {
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_288);
        }
        uint64_t v43 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v89) = v42;
          _os_log_impl(&dword_1D21F2000, v43, OS_LOG_TYPE_INFO, "[Questions] Generated %d questions", buf, 8u);
        }
      }
      uint64_t v44 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      long long v47 = v52;
      long long v48 = v47;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D21F2000, v48, OS_SIGNPOST_INTERVAL_END, spid, "PhotosChallengeQuestionGeneration", "", buf, 2u);
      }

      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v89 = "PhotosChallengeQuestionGeneration";
        __int16 v90 = 2048;
        double v91 = (float)((float)((float)((float)(v44 - v51) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D21F2000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
LABEL_61:
    }
    else
    {
      if (__PXLog_genericOnceToken != -1) {
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_272_9276);
      }
      long long v50 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v89) = a3;
        _os_log_impl(&dword_1D21F2000, v50, OS_LOG_TYPE_INFO, "[Questions] No question factories for options: %d", buf, 8u);
      }
      LOBYTE(v17) = 0;
    }
  }
LABEL_22:

  _Block_object_dispose(&v84, 8);
  return (char)v17;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * 0.1);
  if (*a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_258(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * 0.1);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a2;
  return result;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_262(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * 0.1);
  if (*a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_266(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * 0.1);
  if (*a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_273(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48) + a3 * *(double *)(a1 + 56));
  if (*a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_286()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_283()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2_274()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_270()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2_267()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2_263()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2_259()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __118__PHAQuestionController_generateQuestionsWithOptions_limit_handleQuestionVersionBump_updateInvalidQuestions_progress___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (BOOL)generateQuestionsWithOptions:(int64_t)a3 progress:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke;
  v28[3] = &unk_1E6918B38;
  id v30 = v32;
  id v7 = v6;
  id v29 = v7;
  unint64_t v31 = &v33;
  [(PHAQuestionController *)self _handleQuestionVersionBumpIfNeededWithProgressBlock:v28];
  if (*((unsigned char *)v34 + 24))
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_9293);
    }
    BOOL v8 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
    }
    BOOL v9 = 0;
  }
  else
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_247;
    v24[3] = &unk_1E6918B38;
    double v26 = v32;
    id v10 = v7;
    id v25 = v10;
    uint64_t v27 = &v33;
    [(PHAQuestionController *)self _updateInvalidQuestionsWithProgressBlock:v24];
    if (*((unsigned char *)v34 + 24))
    {
      if (__PXLog_genericOnceToken != -1) {
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_250);
      }
      id v11 = __PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_INFO, "[Questions] Question generation stop requested by progress handler.", buf, 2u);
      }
      BOOL v9 = 0;
    }
    else
    {
      id v12 = [(PGManager *)self->_graphManager photoLibrary];
      id v13 = [v12 librarySpecificFetchOptions];

      [v13 setShouldPrefetchCount:1];
      uint64_t v14 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:v13 validQuestionsOnly:1];
      uint64_t v15 = [v14 count];

      uint64_t v16 = [(PGTrialSession *)self->_trialSession levelForFactorName:@"QuestionGenerationLimit" withNamespaceType:2];
      [v16 doubleValue];
      double v18 = v17;

      if (v15 == (unint64_t)v18)
      {
        if (__PXLog_genericOnceToken != -1) {
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_254_9297);
        }
        double v19 = __PXLog_genericOSLog;
        BOOL v9 = 1;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v38 = v15;
          _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_INFO, "[Questions] 0 questions generated since already at unanswered question limit of %d", buf, 8u);
        }
      }
      else
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_255;
        v21[3] = &unk_1E6918B60;
        unint64_t v23 = v32;
        id v22 = v10;
        BOOL v9 = [(PHAQuestionController *)self generateQuestionsWithOptions:a3 limit:(unint64_t)v18 handleQuestionVersionBump:0 updateInvalidQuestions:0 progress:v21];
      }
    }
  }
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);

  return v9;
}

uint64_t __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke(void *a1, unsigned char *a2, double a3)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = *(double *)(*(void *)(a1[5] + 8) + 24) + a3 * 0.1;
  uint64_t result = (*(uint64_t (**)(double))(a1[4] + 16))(*(double *)(*(void *)(a1[5] + 8) + 24));
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *a2;
  return result;
}

uint64_t __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_247(void *a1, unsigned char *a2, double a3)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = *(double *)(*(void *)(a1[5] + 8) + 24) + a3 * 0.1;
  uint64_t result = (*(uint64_t (**)(double))(a1[4] + 16))(*(double *)(*(void *)(a1[5] + 8) + 24));
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *a2;
  return result;
}

uint64_t __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_255(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a2 * 0.8;
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_252()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_2_248()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __63__PHAQuestionController_generateQuestionsWithOptions_progress___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (PHAQuestionController)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PHAQuestionController;
  id v6 = [(PHAQuestionController *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29130]) _initWithStoreIdentifier:@"com.apple.photoanalysisd" usingEndToEndEncryption:1];
    store = v6->_store;
    v6->_store = (NSUbiquitousKeyValueStore *)v7;

    objc_storeStrong((id *)&v6->_graphManager, a3);
    os_log_t v9 = os_log_create("com.apple.photoanalysisd", "photosChallenge");
    loggingConnection = v6->_loggingConnection;
    v6->_loggingConnection = (OS_os_log *)v9;

    uint64_t v11 = [MEMORY[0x1E4F8D948] newTrialSession];
    trialSession = v6->_trialSession;
    v6->_trialSession = (PGTrialSession *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    questionTypeImportanceByQuestionType = v6->_questionTypeImportanceByQuestionType;
    v6->_questionTypeImportanceByQuestionType = (NSMutableDictionary *)v13;

    uint64_t v15 = [(PGTrialSession *)v6->_trialSession levelForFactorName:@"CurrentQuestionVersion" withNamespaceType:2];
    [v15 doubleValue];
    v6->_currentQuestionVersion = (int)v16;
  }
  return v6;
}

@end