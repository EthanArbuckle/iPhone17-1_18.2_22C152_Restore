@interface PGGraphSearchEnrichmentProcessor
- (BOOL)_shouldProcessGraphUpdate:(id)a3;
- (void)_processGraphUpdateInventory:(id)a3 onGraph:(id)a4 photoLibrary:(id)a5 curationManager:(id)a6 curationContext:(id)a7 searchComputationCache:(id)a8 progressBlock:(id)a9 loggingConnection:(id)a10 completionBlock:(id)a11;
- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6;
@end

@implementation PGGraphSearchEnrichmentProcessor

- (void)_processGraphUpdateInventory:(id)a3 onGraph:(id)a4 photoLibrary:(id)a5 curationManager:(id)a6 curationContext:(id)a7 searchComputationCache:(id)a8 progressBlock:(id)a9 loggingConnection:(id)a10 completionBlock:(id)a11
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v124 = a3;
  id v126 = a4;
  id v118 = a5;
  id v116 = a6;
  id v117 = a7;
  id v123 = a8;
  id v16 = a9;
  oslog = a10;
  v114 = v16;
  v115 = (void (**)(id, void *, void *))a11;
  uint64_t v176 = 0;
  v177 = &v176;
  uint64_t v178 = 0x2020000000;
  char v179 = 0;
  uint64_t v172 = 0;
  v173 = (double *)&v172;
  uint64_t v174 = 0x2020000000;
  uint64_t v175 = 0;
  v125 = _Block_copy(v16);
  if (!v125
    || (double v17 = CFAbsoluteTimeGetCurrent(), v17 - v173[3] < 0.01)
    || (v173[3] = v17,
        char v171 = 0,
        (*((void (**)(void *, char *, double))v125 + 2))(v125, &v171, 0.0),
        char v18 = *((unsigned char *)v177 + 24) | v171,
        (*((unsigned char *)v177 + 24) = v18) == 0))
  {
    v119 = +[PGGraphSynonymSupportHelper synonymsByIndexCategoryMaskForGraph:v126];
    v122 = [[PGSearchEntityAccumulator alloc] initWithSynonymsByCategoryMask:v119];
    v120 = [[PGSearchKeywordComputer alloc] initWithGraph:v126 searchComputationCache:v123];
    v19 = [v124 momentsToProcessForMomentUpdateTypes:31 includeMomentsToIngest:1];
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v19, "count"));
    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v167 objects:v186 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v168;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v168 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = [*(id *)(*((void *)&v167 + 1) + 8 * i) uuid];
          [v20 addObject:v25];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v167 objects:v186 count:16];
      }
      while (v22);
    }

    v113 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:v20 inGraph:v126];
    uint64_t v26 = [v113 uuids];
    v162[0] = MEMORY[0x1E4F143A8];
    v162[1] = 3221225472;
    v162[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke;
    v162[3] = &unk_1E68F03F8;
    id v27 = v125;
    id v163 = v27;
    v164 = &v172;
    uint64_t v166 = 0x3F847AE147AE147BLL;
    v165 = &v176;
    v112 = (void *)v26;
    v111 = [(PGSearchKeywordComputer *)v120 assetSearchKeywordsByMomentUUIDWithEventUUIDs:v26 ofType:0 searchEntityAccumulator:v122 progressBlock:v162];
    if (*((unsigned char *)v177 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_123:

        goto LABEL_124;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v188 = 131;
      *(_WORD *)&v188[4] = 2080;
      *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
      v28 = MEMORY[0x1E4F14500];
LABEL_16:
      _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_123;
    }
    if (v125)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v173[3] >= 0.01)
      {
        v173[3] = Current;
        char v171 = 0;
        (*((void (**)(id, char *, double))v27 + 2))(v27, &v171, 0.1);
        char v30 = *((unsigned char *)v177 + 24) | v171;
        *((unsigned char *)v177 + 24) = v30;
        if (v30)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_123;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v188 = 133;
          *(_WORD *)&v188[4] = 2080;
          *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
          v28 = MEMORY[0x1E4F14500];
          goto LABEL_16;
        }
      }
    }
    int v31 = _os_feature_enabled_impl();
    BOOL v32 = os_log_type_enabled(oslog, OS_LOG_TYPE_INFO);
    if (v31)
    {
      if (v32)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] search entity donation is enabled", buf, 2u);
      }
      v33 = (void *)MEMORY[0x1E4F71F08];
      v157[0] = MEMORY[0x1E4F143A8];
      v157[1] = 3221225472;
      v157[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_240;
      v157[3] = &unk_1E68F03F8;
      id v34 = v27;
      id v158 = v34;
      v159 = &v172;
      uint64_t v161 = 0x3F847AE147AE147BLL;
      v160 = &v176;
      v35 = [v33 progressReporterWithProgressBlock:v157];
      id v156 = 0;
      BOOL v36 = [(PGSearchEntityAccumulator *)v122 accumulatePersonAndPetRelationshipsFromGraph:v126 progressReporter:v35 error:&v156];
      id v37 = v156;
      if (v125
        && (double v38 = CFAbsoluteTimeGetCurrent(), v38 - v173[3] >= 0.01)
        && (v173[3] = v38,
            char v171 = 0,
            (*((void (**)(id, char *, double))v34 + 2))(v34, &v171, 0.5),
            char v39 = *((unsigned char *)v177 + 24) | v171,
            (*((unsigned char *)v177 + 24) = v39) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v188 = 150;
          *(_WORD *)&v188[4] = 2080;
          *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
          v40 = MEMORY[0x1E4F14500];
          v41 = "Cancelled at line %d in file %s";
LABEL_69:
          uint32_t v68 = 18;
LABEL_72:
          _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_INFO, v41, buf, v68);
        }
      }
      else
      {
        if (v36)
        {
          v56 = (void *)MEMORY[0x1E4F71F08];
          v151[0] = MEMORY[0x1E4F143A8];
          v151[1] = 3221225472;
          v151[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_241;
          v151[3] = &unk_1E68F03F8;
          id v152 = v34;
          v153 = &v172;
          uint64_t v155 = 0x3F847AE147AE147BLL;
          v154 = &v176;
          v57 = [v56 progressReporterWithProgressBlock:v151];
          v58 = [[PGSearchEntityPersister alloc] initWithPhotoLibrary:v118];
          id v150 = 0;
          LOBYTE(v56) = [(PGSearchEntityPersister *)v58 persistSearchEntitiesFromSearchEntityProvider:v122 progressReporter:v57 error:&v150];
          id v59 = v150;
          if ((v56 & 1) == 0 && os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v188 = v59;
            _os_log_error_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_ERROR, "[PGGraphSearchEnrichmentProcessor] Error returned by persistSearchEntitiesFromSearchEntityProvider(): (%@)", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v188 = v37;
          _os_log_error_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_ERROR, "[PGGraphSearchEnrichmentProcessor] Error returned by accumulatePersonAndPetRelationshipsFromGraph(): (%@)", buf, 0xCu);
        }
        if (v125
          && (double v66 = CFAbsoluteTimeGetCurrent(), v66 - v173[3] >= 0.01)
          && (v173[3] = v66,
              char v171 = 0,
              (*((void (**)(id, char *, double))v34 + 2))(v34, &v171, 1.0),
              char v67 = *((unsigned char *)v177 + 24) | v171,
              (*((unsigned char *)v177 + 24) = v67) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v188 = 167;
            *(_WORD *)&v188[4] = 2080;
            *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
            v40 = MEMORY[0x1E4F14500];
            v41 = "Cancelled at line %d in file %s";
            goto LABEL_69;
          }
        }
        else if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v41 = "[PGGraphSearchEnrichmentProcessor] search entity accumulation and persistence is complete";
          v40 = oslog;
          uint32_t v68 = 2;
          goto LABEL_72;
        }
      }

      goto LABEL_123;
    }
    if (v32)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] search entity donation is not enabled", buf, 2u);
    }
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v106 = [v124 uuidsOfHighlightsToDelete];
    [v124 highlightsToProcessForKind:0 withHighlightUpdateTypes:127 includeHighlightsToIngest:1];
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v44 = [v43 countByEnumeratingWithState:&v146 objects:v185 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v147;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v147 != v45) {
            objc_enumerationMutation(v43);
          }
          v47 = [*(id *)(*((void *)&v146 + 1) + 8 * j) uuid];
          [v42 addObject:v47];
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v146 objects:v185 count:16];
      }
      while (v44);
    }

    [v124 highlightsToProcessForKind:3 withHighlightUpdateTypes:127 includeHighlightsToIngest:1];
    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v49 = [v48 countByEnumeratingWithState:&v142 objects:v184 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v143;
      do
      {
        for (uint64_t k = 0; k != v49; ++k)
        {
          if (*(void *)v143 != v50) {
            objc_enumerationMutation(v48);
          }
          v52 = *(void **)(*((void *)&v142 + 1) + 8 * k);
          if (MEMORY[0x1D25FE3D0]([v52 type]))
          {
            v53 = [v52 uuid];
            [v42 addObject:v53];
          }
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v142 objects:v184 count:16];
      }
      while (v49);
    }

    if (v125)
    {
      double v54 = CFAbsoluteTimeGetCurrent();
      if (v54 - v173[3] >= 0.01)
      {
        v173[3] = v54;
        char v171 = 0;
        (*((void (**)(id, char *, double))v27 + 2))(v27, &v171, 0.2);
        char v55 = *((unsigned char *)v177 + 24) | v171;
        *((unsigned char *)v177 + 24) = v55;
        if (v55)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v188 = 197;
            *(_WORD *)&v188[4] = 2080;
            *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_122;
        }
      }
    }
    v103 = [v124 identifiersForMomentRelatedToUpdatedPersons];
    v60 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:");
    v104 = [v113 collectionByFormingUnionWith:v60];
    v110 = [v104 highlightNodes];
    v61 = +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:v126];
    v109 = [v61 highlightNodes];

    v62 = [v110 highlightGroupNodes];
    v108 = [v109 collectionByIntersecting:v62];

    v107 = [v110 collectionByFormingUnionWith:v108];
    v63 = [v107 uuids];
    [v42 unionSet:v63];

    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v137[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_244;
    v137[3] = &unk_1E68F03F8;
    id v64 = v27;
    id v138 = v64;
    v139 = &v172;
    v140 = &v176;
    uint64_t v141 = 0x3F847AE147AE147BLL;
    v105 = [(PGSearchKeywordComputer *)v120 searchKeywordsByEventWithEventUUIDs:v42 ofType:1 photoLibrary:v118 progressBlock:v137];
    if (*((unsigned char *)v177 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_121:

LABEL_122:
        goto LABEL_123;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v188 = 218;
      *(_WORD *)&v188[4] = 2080;
      *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
      v65 = MEMORY[0x1E4F14500];
LABEL_61:
      _os_log_impl(&dword_1D1805000, v65, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_121;
    }
    if (v125)
    {
      double v69 = CFAbsoluteTimeGetCurrent();
      if (v69 - v173[3] >= 0.01)
      {
        v173[3] = v69;
        char v171 = 0;
        (*((void (**)(id, char *, double))v64 + 2))(v64, &v171, 0.3);
        char v70 = *((unsigned char *)v177 + 24) | v171;
        *((unsigned char *)v177 + 24) = v70;
        if (v70)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_121;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v188 = 220;
          *(_WORD *)&v188[4] = 2080;
          *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
          v65 = MEMORY[0x1E4F14500];
          goto LABEL_61;
        }
      }
    }
    v182[0] = *MEMORY[0x1E4F8B4C8];
    v71 = [v42 allObjects];
    v183[0] = v71;
    v182[1] = *MEMORY[0x1E4F8B4D8];
    v72 = [v106 allObjects];
    v183[1] = v72;
    v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v183 forKeys:v182 count:2];

    if (v125)
    {
      double v73 = CFAbsoluteTimeGetCurrent();
      if (v73 - v173[3] >= 0.01)
      {
        v173[3] = v73;
        char v171 = 0;
        (*((void (**)(id, char *, double))v64 + 2))(v64, &v171, 0.4);
        char v74 = *((unsigned char *)v177 + 24) | v171;
        *((unsigned char *)v177 + 24) = v74;
        if (v74)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v188 = 227;
            *(_WORD *)&v188[4] = 2080;
            *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_120;
        }
      }
    }
    v75 = [v112 allObjects];
    uint64_t v76 = [v124 isResumingFullAnalysis];
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_246;
    v132[3] = &unk_1E68F03F8;
    id v77 = v64;
    id v133 = v77;
    v134 = &v172;
    v135 = &v176;
    uint64_t v136 = 0x3F847AE147AE147BLL;
    v101 = [(PGSearchKeywordComputer *)v120 searchableAssetUUIDsBySocialGroupWithEventUUIDs:v75 ofType:0 inPhotoLibrary:v118 isFullAnalysis:v76 progressBlock:v132];

    if (*((unsigned char *)v177 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_119:

LABEL_120:
        goto LABEL_121;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v188 = 232;
      *(_WORD *)&v188[4] = 2080;
      *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
      v78 = MEMORY[0x1E4F14500];
LABEL_87:
      _os_log_impl(&dword_1D1805000, v78, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_119;
    }
    if (v125)
    {
      double v79 = CFAbsoluteTimeGetCurrent();
      if (v79 - v173[3] >= 0.01)
      {
        v173[3] = v79;
        char v171 = 0;
        (*((void (**)(id, char *, double))v77 + 2))(v77, &v171, 0.5);
        char v80 = *((unsigned char *)v177 + 24) | v171;
        *((unsigned char *)v177 + 24) = v80;
        if (v80)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_119;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v188 = 234;
          *(_WORD *)&v188[4] = 2080;
          *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
          v78 = MEMORY[0x1E4F14500];
          goto LABEL_87;
        }
      }
    }
    v81 = [[PGZeroKeywordComputer alloc] initWithPhotoLibrary:v118 curationManager:v116 searchComputationCache:v123];
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_248;
    v127[3] = &unk_1E68F03F8;
    id v82 = v77;
    id v128 = v82;
    v129 = &v172;
    v130 = &v176;
    uint64_t v131 = 0x3F847AE147AE147BLL;
    v99 = v81;
    v100 = [(PGZeroKeywordComputer *)v81 zeroKeywordsWithGraph:v126 curationContext:v117 options:MEMORY[0x1E4F1CC08] progressBlock:v127];
    if (*((unsigned char *)v177 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v188 = 240;
        *(_WORD *)&v188[4] = 2080;
        *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
        v83 = MEMORY[0x1E4F14500];
LABEL_96:
        _os_log_impl(&dword_1D1805000, v83, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v125
        || (double v84 = CFAbsoluteTimeGetCurrent(), v84 - v173[3] < 0.01)
        || (v173[3] = v84,
            char v171 = 0,
            (*((void (**)(id, char *, double))v82 + 2))(v82, &v171, 0.6),
            char v85 = *((unsigned char *)v177 + 24) | v171,
            (*((unsigned char *)v177 + 24) = v85) == 0))
      {
        v97 = [[PGSearchMetadataComputer alloc] initWithGraph:v126];
        v98 = [(PGSearchMetadataComputer *)v97 searchMetadataWithOptions:MEMORY[0x1E4F1CC08]];
        if (v125
          && (double v86 = CFAbsoluteTimeGetCurrent(), v86 - v173[3] >= 0.01)
          && (v173[3] = v86,
              char v171 = 0,
              (*((void (**)(id, char *, double))v82 + 2))(v82, &v171, 0.7),
              char v87 = *((unsigned char *)v177 + 24) | v171,
              (*((unsigned char *)v177 + 24) = v87) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v188 = 247;
            *(_WORD *)&v188[4] = 2080;
            *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          uint64_t v88 = [v124 isResumingFullAnalysis];
          uint64_t v89 = *MEMORY[0x1E4F8B4B8];
          v180[0] = *MEMORY[0x1E4F8B4C0];
          v180[1] = v89;
          v181[0] = v105;
          v181[1] = v111;
          uint64_t v90 = *MEMORY[0x1E4F8B4F8];
          v180[2] = *MEMORY[0x1E4F8B4E8];
          v180[3] = v90;
          v181[2] = v101;
          v181[3] = v100;
          uint64_t v91 = *MEMORY[0x1E4F8B4F0];
          v180[4] = *MEMORY[0x1E4F8B4E0];
          v180[5] = v91;
          v181[4] = v98;
          v181[5] = v119;
          v180[6] = *MEMORY[0x1E4F8B4D0];
          v92 = [NSNumber numberWithBool:v88];
          v181[6] = v92;
          v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v181 forKeys:v180 count:7];

          v115[2](v115, v102, v93);
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
          {
            v94 = @"NO";
            if (v88) {
              v94 = @"YES";
            }
            *(_DWORD *)buf = 138412290;
            *(void *)v188 = v94;
            _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] Finished processing, isGraphRebuild: %@", buf, 0xCu);
          }
          if (v125)
          {
            double v95 = CFAbsoluteTimeGetCurrent();
            if (v95 - v173[3] >= 0.01)
            {
              v173[3] = v95;
              char v171 = 0;
              (*((void (**)(id, char *, double))v82 + 2))(v82, &v171, 1.0);
              char v96 = *((unsigned char *)v177 + 24) | v171;
              *((unsigned char *)v177 + 24) = v96;
              if (v96)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v188 = 264;
                  *(_WORD *)&v188[4] = 2080;
                  *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
              }
            }
          }
        }
        goto LABEL_118;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v188 = 242;
        *(_WORD *)&v188[4] = 2080;
        *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
        v83 = MEMORY[0x1E4F14500];
        goto LABEL_96;
      }
    }
LABEL_118:

    goto LABEL_119;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v188 = 112;
    *(_WORD *)&v188[4] = 2080;
    *(void *)&v188[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_124:
  _Block_object_dispose(&v172, 8);
  _Block_object_dispose(&v176, 8);
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_240(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.4 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_241(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_244(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_246(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.4);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_248(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)_shouldProcessGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 hasHighlightsToInsert] & 1) != 0 || (objc_msgSend(v3, "hasHighlightsToDelete")) {
    int v4 = 1;
  }
  else {
    int v4 = [v3 hasHighlightsToUpdate];
  }
  if (([v3 hasMomentsToInsert] & 1) != 0
    || ([v3 hasMomentsToDelete] & 1) != 0
    || ((v4 | [v3 hasMomentsToUpdate]) & 1) != 0
    || ([v3 hasPersonsToDelete] & 1) != 0
    || ([v3 identifiersForMomentRelatedToUpdatedPersons],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [v3 isResumingFullAnalysis];
  }

  return v7;
}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 enrichmentLoggingConnection];
  os_signpost_id_t v15 = os_signpost_id_generate(v14);
  id v16 = v14;
  double v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PGGraphSearchEnrichmentProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v32 = mach_absolute_time();
  BOOL v18 = [(PGGraphSearchEnrichmentProcessor *)self _shouldProcessGraphUpdate:v12];
  BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] Run search processor to donate graph data to Search enrichment", buf, 2u);
    }
    v20 = [v10 photoLibrary];
    int v31 = +[PGSearchComputationCache persistentStoreURLWithManager:v10];
    id v21 = [[PGSearchComputationCache alloc] initWithPersistentStoreURL:v31 photoLibrary:v20];
    if ([v12 isResumingFullAnalysis]) {
      [(PGSearchComputationCache *)v21 invalidateCache];
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v46 = 1;
    uint64_t v22 = [v10 curationManager];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __114__PGGraphSearchEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke;
    v33[3] = &unk_1E68E9DE8;
    id v43 = buf;
    id v34 = v17;
    v35 = self;
    id v36 = v12;
    id v23 = v20;
    id v37 = v23;
    id v24 = v22;
    id v38 = v24;
    id v39 = v11;
    v25 = v21;
    v40 = v25;
    id v42 = v13;
    id v41 = v10;
    [v41 performSynchronousConcurrentGraphReadUsingBlock:v33];
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      [(PGSearchComputationCache *)v25 save];
    }

    _Block_object_dispose(buf, 8);
  }
  else if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] Should not run search processor since there are no changes needed to donate to Search enrichment", buf, 2u);
  }
  uint64_t v26 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v29 = v17;
  char v30 = v29;
  if (v15 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v30, OS_SIGNPOST_INTERVAL_END, v15, "PGGraphSearchEnrichmentProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "PGGraphSearchEnrichmentProcessor";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v26 - v32) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

void __114__PGGraphSearchEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 96);
    uint64_t v9 = *(void *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 56);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __114__PGGraphSearchEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_226;
    v13[3] = &unk_1E68E9DC0;
    uint64_t v10 = *(void *)(a1 + 80);
    id v14 = *(id *)(a1 + 88);
    id v15 = *(id *)(a1 + 32);
    [v8 _processGraphUpdateInventory:v4 onGraph:v3 photoLibrary:v12 curationManager:v5 curationContext:v6 searchComputationCache:v10 progressBlock:v7 loggingConnection:v9 completionBlock:v13];
  }
  else
  {
    id v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1805000, v11, OS_LOG_TYPE_FAULT, "[PGGraphSearchEnrichmentProcessor] Search enrichment will not run because the graph is unavailable", buf, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
  }
}

void __114__PGGraphSearchEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 photoLibrary];
  [v8 requestSearchIndexGraphUpdates:v7 supportingData:v6 withCompletion:0];

  uint64_t v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] Donate the graph data to Search enrichment", v10, 2u);
  }
}

@end