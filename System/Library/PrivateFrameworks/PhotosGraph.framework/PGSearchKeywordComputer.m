@interface PGSearchKeywordComputer
- (PGSearchComputationCache)searchComputationCache;
- (PGSearchKeywordComputer)initWithGraph:(id)a3 searchComputationCache:(id)a4;
- (id)_holidayNodesForTimedEvent:(id)a3;
- (id)_personLocalIdentifiersBySocialGroupUUIDWithPhotoLibrary:(id)a3 graph:(id)a4;
- (id)_personUUIDsInSocialGroupNode:(id)a3 photoLibrary:(id)a4;
- (id)assetSearchKeywordsByMomentUUIDWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 progressBlock:(id)a5;
- (id)assetSearchKeywordsByMomentUUIDWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 searchEntityAccumulator:(id)a5 progressBlock:(id)a6;
- (id)searchKeywordsByEventWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 photoLibrary:(id)a5 progressBlock:(id)a6;
- (id)searchableAssetUUIDsBySocialGroupWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 inPhotoLibrary:(id)a5 isFullAnalysis:(BOOL)a6 progressBlock:(id)a7;
- (void)_enumerateBusinessAndPublicEventKeywordsForEvent:(id)a3 usingBlock:(id)a4;
- (void)_enumerateEventNodesForUUIDs:(id)a3 ofType:(unint64_t)a4 usingBlock:(id)a5;
@end

@implementation PGSearchKeywordComputer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchComputationCache, 0);
  objc_storeStrong((id *)&self->_holidayService, 0);
  objc_storeStrong((id *)&self->_userLocale, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersBySocialGroupUUID, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (PGSearchComputationCache)searchComputationCache
{
  return self->_searchComputationCache;
}

- (id)_holidayNodesForTimedEvent:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 celebratedHolidayNodes];
  id v38 = (id)[v5 mutableCopy];

  v6 = [v4 holidayNodes];
  v36 = self;
  v7 = [(NSLocale *)self->_userLocale countryCode];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    unint64_t v12 = 0x1E4F76000uLL;
    uint64_t v32 = *(void *)v49;
    id v33 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v34 = v10;
      do
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
        if ((objc_msgSend(v38, "containsObject:", v14, v32, v33) & 1) == 0)
        {
          v41 = v14;
          v37 = [v14 name];
          v15 = -[CLSHolidayCalendarEventService eventRuleForHolidayName:](v36->_holidayService, "eventRuleForHolidayName:");
          v16 = v15;
          if (v15)
          {
            v17 = [v15 commonCelebratedCountryCodes];
            v18 = [v17 objectForKeyedSubscript:v7];

            if (v18)
            {
              uint64_t v35 = v13;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id obj = [v4 dateNodes];
              uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
              if (v43)
              {
                uint64_t v19 = *(void *)v45;
                uint64_t v39 = *(void *)v45;
                v40 = v16;
                do
                {
                  for (uint64_t i = 0; i != v43; ++i)
                  {
                    if (*(void *)v45 != v19) {
                      objc_enumerationMutation(obj);
                    }
                    v21 = objc_msgSend(v16, "localDateByEvaluatingRuleForYear:countryCode:", objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "year"), v7);
                    v22 = [*(id *)(v12 + 3176) startOfDayForDate:v21];
                    v23 = [*(id *)(v12 + 3176) endOfDayForDate:v21];
                    v24 = [v4 localStartDate];
                    if ([v24 compare:v22] == 1)
                    {
                      [v4 localEndDate];
                      v25 = v7;
                      v27 = id v26 = v4;
                      unint64_t v28 = v12;
                      uint64_t v29 = [v27 compare:v23];

                      id v4 = v26;
                      v7 = v25;
                      uint64_t v19 = v39;

                      BOOL v30 = v29 == -1;
                      unint64_t v12 = v28;
                      v16 = v40;
                      if (v30) {
                        [v38 addObject:v41];
                      }
                    }
                    else
                    {
                    }
                  }
                  uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
                }
                while (v43);
              }

              uint64_t v11 = v32;
              id v8 = v33;
              uint64_t v10 = v34;
              uint64_t v13 = v35;
            }
          }
        }
        ++v13;
      }
      while (v13 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v10);
  }

  return v38;
}

- (id)_personUUIDsInSocialGroupNode:(id)a3 photoLibrary:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 graph];
  uint64_t v9 = [(PGSearchKeywordComputer *)self _personLocalIdentifiersBySocialGroupUUIDWithPhotoLibrary:v7 graph:v8];
  uint64_t v10 = [v6 UUID];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  unint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = objc_msgSend(MEMORY[0x1E4F391F0], "uuidFromLocalIdentifier:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        if (v18) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v12;
}

- (void)_enumerateBusinessAndPublicEventKeywordsForEvent:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 dictionary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__PGSearchKeywordComputer__enumerateBusinessAndPublicEventKeywordsForEvent_usingBlock___block_invoke;
  v16[3] = &unk_1E68E9CB8;
  id v17 = v8;
  id v9 = v8;
  [v7 enumerateBusinessesUsingBlock:v16];
  uint64_t v10 = [v7 publicEventNodes];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PGSearchKeywordComputer__enumerateBusinessAndPublicEventKeywordsForEvent_usingBlock___block_invoke_2;
  v13[3] = &unk_1E68E9CE0;
  id v14 = v10;
  id v15 = v5;
  id v11 = v5;
  id v12 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
}

void __87__PGSearchKeywordComputer__enumerateBusinessAndPublicEventKeywordsForEvent_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 universalStartDate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  id v6 = v5;

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

void __87__PGSearchKeywordComputer__enumerateBusinessAndPublicEventKeywordsForEvent_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v7 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v42 = [*(id *)(a1 + 32) count];
  uint64_t v40 = a1;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v9 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v11 = v4;
  uint64_t v43 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
  uint64_t v39 = v11;
  if (!v43)
  {

    [v5 setObject:v6 forKeyedSubscript:&unk_1F28D20B8];
LABEL_26:
    uint64_t v32 = [v7 allObjects];
    [v5 setObject:v32 forKeyedSubscript:&unk_1F28D20D0];

    goto LABEL_27;
  }
  id v12 = v6;
  v37 = v5;
  id v38 = v8;
  id v13 = v5;
  uint64_t v41 = *(void *)v53;
  int v14 = 1;
  id v15 = v11;
  uint64_t v35 = v7;
  v36 = v6;
  long long v47 = v10;
  do
  {
    for (uint64_t i = 0; i != v43; ++i)
    {
      if (*(void *)v53 != v41) {
        objc_enumerationMutation(v15);
      }
      id v17 = [*(id *)(*((void *)&v52 + 1) + 8 * i) targetNode];
      v18 = [v17 name];
      if ([v18 length]) {
        [v12 addObject:v18];
      }
      long long v46 = v18;
      uint64_t v19 = [v17 businessCategories];
      if ([v7 count]) {
        v14 &= [v7 intersectsSet:v19];
      }
      long long v45 = (void *)v19;
      [v7 unionSet:v19];
      if (v42)
      {
        uint64_t v44 = i;
        long long v20 = v9;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v21 = *(id *)(v40 + 32);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v49;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v49 != v24) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(void **)(*((void *)&v48 + 1) + 8 * j);
              v27 = [v26 businessNode];
              int v28 = [v27 isSameNodeAsNode:v17];

              if (v28)
              {
                uint64_t v29 = [v26 name];
                [v38 addObject:v29];

                BOOL v30 = [v26 performers];
                [v47 unionSet:v30];

                v31 = [v26 localizedCategories];
                [v20 unionSet:v31];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v56 count:16];
          }
          while (v23);
        }

        id v12 = v36;
        id v13 = v37;
        id v7 = v35;
        id v15 = v39;
        id v9 = v20;
        uint64_t v10 = v47;
        uint64_t i = v44;
      }
    }
    uint64_t v43 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
  }
  while (v43);

  id v5 = v13;
  id v6 = v12;
  [v13 setObject:v12 forKeyedSubscript:&unk_1F28D20B8];
  id v8 = v38;
  if (v14) {
    goto LABEL_26;
  }
LABEL_27:
  if (v42)
  {
    [v5 setObject:v8 forKeyedSubscript:&unk_1F28D20E8];
    id v33 = [v10 allObjects];
    [v5 setObject:v33 forKeyedSubscript:&unk_1F28D2100];

    uint64_t v34 = [v9 allObjects];
    [v5 setObject:v34 forKeyedSubscript:&unk_1F28D2118];
  }
  (*(void (**)(void))(*(void *)(v40 + 40) + 16))();
}

- (id)_personLocalIdentifiersBySocialGroupUUIDWithPhotoLibrary:(id)a3 graph:(id)a4
{
  personLocalIdentifiersBySocialGroupUUID = self->_personLocalIdentifiersBySocialGroupUUID;
  if (!personLocalIdentifiersBySocialGroupUUID)
  {
    graph = self->_graph;
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = +[PGGraphNodeCollection nodesInGraph:graph];
    id v11 = [v8 fetchMemberNodesBySocialGroupNodeForSocialGroups:v10];
    id v12 = [(PGGraph *)self->_graph memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:v11 shouldIncludeMeNode:1 simulateMeNodeNotSet:0];
    id v13 = self->_personLocalIdentifiersBySocialGroupUUID;
    self->_personLocalIdentifiersBySocialGroupUUID = v12;

    int v14 = +[PGPeopleUtilities validateKeyedSocialGroups:self->_personLocalIdentifiersBySocialGroupUUID withPhotoLibrary:v9 graph:v8];

    id v15 = self->_personLocalIdentifiersBySocialGroupUUID;
    self->_personLocalIdentifiersBySocialGroupUUID = v14;

    personLocalIdentifiersBySocialGroupUUID = self->_personLocalIdentifiersBySocialGroupUUID;
  }
  return personLocalIdentifiersBySocialGroupUUID;
}

- (void)_enumerateEventNodesForUUIDs:(id)a3 ofType:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    uint64_t v10 = +[PGGraphHighlightNodeCollection highlightNodesForUUIDs:v8 inGraph:self->_graph];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__PGSearchKeywordComputer__enumerateEventNodesForUUIDs_ofType_usingBlock___block_invoke_2;
    v13[3] = &unk_1E68E9C90;
    id v14 = v9;
    [v10 enumerateNodesUsingBlock:v13];
    id v11 = v14;
    goto LABEL_5;
  }
  if (!a4)
  {
    uint64_t v10 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:v8 inGraph:self->_graph];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__PGSearchKeywordComputer__enumerateEventNodesForUUIDs_ofType_usingBlock___block_invoke;
    v15[3] = &unk_1E68E9C68;
    id v16 = v9;
    [v10 enumerateNodesUsingBlock:v15];
    id v11 = v16;
LABEL_5:

    goto LABEL_8;
  }
  id v12 = +[PGLogging sharedLogging];
  uint64_t v10 = [v12 loggingConnection];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a4;
    _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Cannot get graph node for uuid of unsupported asset collection type %ld", buf, 0xCu);
  }
LABEL_8:
}

uint64_t __74__PGSearchKeywordComputer__enumerateEventNodesForUUIDs_ofType_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__PGSearchKeywordComputer__enumerateEventNodesForUUIDs_ofType_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)searchableAssetUUIDsBySocialGroupWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 inPhotoLibrary:(id)a5 isFullAnalysis:(BOOL)a6 progressBlock:(id)a7
{
  uint64_t v8 = a6;
  v71[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v35 = a5;
  id v12 = a7;
  id v13 = (void (**)(void *, int *, double))_Block_copy(v12);
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v53 = 0;
  long long v54 = (double *)&v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  if (!v13
    || (double v14 = CFAbsoluteTimeGetCurrent(), v14 - v54[3] < 0.01)
    || (v54[3] = v14,
        LOBYTE(v65) = 0,
        v13[2](v13, (int *)&v65, 0.0),
        char v15 = *((unsigned char *)v58 + 24) | v65,
        (*((unsigned char *)v58 + 24) = v15) == 0))
  {
    id v33 = [MEMORY[0x1E4F1CA60] dictionary];
    id v17 = [v35 librarySpecificFetchOptions];
    v71[0] = *MEMORY[0x1E4F394A8];
    unint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
    [v17 setFetchPropertySets:v18];

    id v19 = 0;
    uint64_t buf = 0;
    *(void *)&long long v69 = &buf;
    *((void *)&v69 + 1) = 0x2020000000;
    uint64_t v70 = v8 << 63 >> 63;
    if ((v8 & 1) == 0)
    {
      long long v20 = [MEMORY[0x1E4F1CA48] array];
      id v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v34];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke;
      v50[3] = &unk_1E68E9BF0;
      id v19 = v20;
      id v51 = v19;
      p_uint64_t buf = &buf;
      [(PGSearchKeywordComputer *)self _enumerateEventNodesForUUIDs:v21 ofType:a4 usingBlock:v50];
    }
    if (v13)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v54[3] >= 0.01)
      {
        v54[3] = Current;
        LOBYTE(v61) = 0;
        v13[2](v13, &v61, 0.5);
        char v23 = *((unsigned char *)v58 + 24) | v61;
        *((unsigned char *)v58 + 24) = v23;
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            uint64_t v65 = 0x25004000202;
            LOWORD(v66) = 2080;
            *(void *)((char *)&v66 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Search/PGSearchKeywordComputer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v65, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CC08];
          goto LABEL_27;
        }
      }
    }
    uint64_t v24 = v17;
    uint64_t v65 = 0;
    *(void *)&long long v66 = &v65;
    *((void *)&v66 + 1) = 0x2020000000;
    uint64_t v67 = 0x3FE0000000000000;
    uint64_t v25 = self;
    graph = self->_graph;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_312;
    v37[3] = &unk_1E68E9C40;
    v27 = v13;
    uint64_t v44 = &v53;
    long long v45 = &v65;
    uint64_t v48 = 0x3F847AE147AE147BLL;
    long long v46 = &v57;
    uint64_t v43 = v27;
    v37[4] = v25;
    id v38 = v35;
    long long v47 = &buf;
    char v49 = v8;
    id v17 = v24;
    id v39 = v24;
    id v40 = &unk_1F28D40C8;
    id v41 = v19;
    id v28 = v33;
    id v42 = v28;
    [(MAGraph *)graph enumerateNodesWithLabel:@"SocialGroup" domain:302 usingBlock:v37];
    if (*((unsigned char *)v58 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v61 = 67109378;
        int v62 = 646;
        __int16 v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GSearchKeywordComputer.m";
        uint64_t v29 = MEMORY[0x1E4F14500];
LABEL_18:
        _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v61, 0x12u);
      }
    }
    else
    {
      if (!v13
        || (double v30 = CFAbsoluteTimeGetCurrent(), v30 - v54[3] < 0.01)
        || (v54[3] = v30,
            char v36 = 0,
            v27[2](v27, (int *)&v36, 1.0),
            char v31 = *((unsigned char *)v58 + 24) | v36,
            (*((unsigned char *)v58 + 24) = v31) == 0))
      {
        id v16 = v28;
        goto LABEL_26;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v61 = 67109378;
        int v62 = 648;
        __int16 v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GSearchKeywordComputer.m";
        uint64_t v29 = MEMORY[0x1E4F14500];
        goto LABEL_18;
      }
    }
    id v16 = (id)MEMORY[0x1E4F1CC08];
LABEL_26:

    _Block_object_dispose(&v65, 8);
LABEL_27:

    _Block_object_dispose(&buf, 8);
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x23704000202;
    LOWORD(v69) = 2080;
    *(void *)((char *)&v69 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Search/PGSearchKeywordComputer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  id v16 = (id)MEMORY[0x1E4F1CC08];
LABEL_28:
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  return v16;
}

void __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D25FED50]();
  id v5 = [v3 eventCollection];
  id v6 = [v5 eventMomentNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_2;
  v9[3] = &unk_1E68EF338;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 enumerateNodesUsingBlock:v9];
}

void __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_312(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (*(void *)(a1 + 80)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v7 = *(void *)(*(void *)(a1 + 88) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 120))
    && (*(double *)(v7 + 24) = Current,
        char v34 = 0,
        (*(void (**)(double))(*(void *)(a1 + 80) + 16))(*(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                                + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = (*(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                             + 24)
                                                                 + 1.0)
                                                                * 0.5;
    uint64_t v8 = [*(id *)(a1 + 32) _personUUIDsInSocialGroupNode:v5 photoLibrary:*(void *)(a1 + 40)];
    unint64_t v9 = [v8 count];
    if (v9 >= 2)
    {
      unint64_t v10 = v9 > 3 ? (v9 >> 1) + 1 : v9;
      if (v10 < v9 && *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) >= v10)
      {
        if (*(unsigned char *)(a1 + 128)) {
          [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.@count >= %lu AND SUBQUERY(%K, $f, $f.%K IN %@ AND $f.%K IN %@).@count >= %lu", @"detectedFaces", v10, @"detectedFaces", @"personForFace.verifiedType", *(void *)(a1 + 56), @"personForFace.personUUID", v8, v10, v25, v26];
        }
        else {
        uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ AND %K.@count >= %lu AND SUBQUERY(%K, $f, $f.%K IN %@ AND $f.%K IN %@).@count >= %lu", @"moment.uuid", *(void *)(a1 + 64), @"detectedFaces", v10, @"detectedFaces", @"personForFace.verifiedType", *(void *)(a1 + 56), @"personForFace.personUUID", v8, v10];
        }
        [*(id *)(a1 + 48) setInternalPredicate:v11];

        id v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:*(void *)(a1 + 48)];
        id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v31 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = [*(id *)(*((void *)&v30 + 1) + 8 * i) uuid];
              [v13 addObject:v19];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
          }
          while (v16);
        }

        long long v20 = [*(id *)(a1 + 40) librarySpecificFetchOptions];
        [v20 setIncludedDetectionTypes:&unk_1F28D40E0];
        id v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"personForFace.personUUID", v8];
        [v20 setInternalPredicate:v21];

        uint64_t v22 = [MEMORY[0x1E4F391F0] fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v13 options:v20];
        char v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_345;
        v27[3] = &unk_1E68E9C18;
        id v28 = v23;
        unint64_t v29 = v10;
        id v24 = v23;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        [*(id *)(a1 + 72) setObject:v24 forKeyedSubscript:v8];
      }
    }
  }
}

void __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_345(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ((unint64_t)[a3 count] >= *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 uuid];
  [v3 addObject:v5];

  unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v7 = [v4 personNodes];

  unint64_t v8 = [v7 count];
  if (v6 <= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v6;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

- (id)assetSearchKeywordsByMomentUUIDWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 searchEntityAccumulator:(id)a5 progressBlock:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v29 = a5;
  id aBlock = a6;
  unint64_t v10 = CreateSearchLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  id v12 = v10;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "assetSearchKeywordsByMomentUUIDWithEventUUIDs", "", (uint8_t *)&buf, 2u);
  }

  id v14 = _Block_copy(aBlock);
  uint64_t buf = 0;
  p_uint64_t buf = &buf;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  long long v45 = (double *)&v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  if (v14
    && (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v45[3] >= 0.01)
    && (v45[3] = v15,
        LOBYTE(v52[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v14 + 2))(v14, v52, 0.0),
        char v16 = *((unsigned char *)p_buf + 24) | LOBYTE(v52[0]),
        (*((unsigned char *)p_buf + 24) = v16) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v55 = 0x16C04000202;
      LOWORD(v56) = 2080;
      *(void *)((char *)&v56 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Search/PGSearchKeywordComputer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v55, 0x12u);
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    unint64_t v18 = objc_alloc_init(PGSearchKeywordComputerKeywordAggregator);
    id v19 = [(PGGraph *)self->_graph meNodeCollection];
    uint64_t v55 = 0;
    *(void *)&long long v56 = &v55;
    *((void *)&v56 + 1) = 0x2020000000;
    uint64_t v57 = 0;
    double v20 = 1.0 / (double)(unint64_t)[v31 count];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke;
    v33[3] = &unk_1E68E9BC8;
    id v21 = v14;
    id v38 = &v44;
    id v39 = &v55;
    id v40 = &buf;
    uint64_t v41 = 0x3F847AE147AE147BLL;
    double v42 = v20;
    id v37 = v21;
    v33[4] = self;
    uint64_t v22 = v18;
    char v34 = v22;
    id v35 = v29;
    unint64_t v43 = a4;
    id v23 = v19;
    id v36 = v23;
    [(PGSearchKeywordComputer *)self _enumerateEventNodesForUUIDs:v31 ofType:a4 usingBlock:v33];
    if (v14
      && (double Current = CFAbsoluteTimeGetCurrent(), Current - v45[3] >= 0.01)
      && (v45[3] = Current,
          char v32 = 0,
          (*((void (**)(id, char *, double))v21 + 2))(v21, &v32, 1.0),
          char v25 = *((unsigned char *)p_buf + 24) | v32,
          (*((unsigned char *)p_buf + 24) = v25) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v52[0] = 67109378;
        v52[1] = 557;
        __int16 v53 = 2080;
        long long v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GSearchKeywordComputer.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v52, 0x12u);
      }
      uint64_t v17 = (void *)MEMORY[0x1E4F1CC08];
    }
    else
    {
      uint64_t v26 = v13;
      v27 = v26;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        LOWORD(v52[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_END, v11, "assetSearchKeywordsByMomentUUIDWithEventUUIDs", "", (uint8_t *)v52, 2u);
      }

      uint64_t v17 = [(PGSearchKeywordComputerKeywordAggregator *)v22 aggregatedKeywords];
    }

    _Block_object_dispose(&v55, 8);
  }
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&buf, 8);

  return v17;
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v92[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unint64_t v6 = (void *)MEMORY[0x1D25FED50]();
  if (*(void *)(a1 + 64)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v8 + 24) = Current,
        char v84 = 0,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(double *)(a1 + 104)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                            + 24);
    unint64_t v9 = *(void **)(a1 + 32);
    unint64_t v10 = [v5 businessedEvent];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_2;
    v81[3] = &unk_1E68E9B78;
    id v82 = *(id *)(a1 + 40);
    id v83 = *(id *)(a1 + 48);
    [v9 _enumerateBusinessAndPublicEventKeywordsForEvent:v10 usingBlock:v81];

    if (!*(void *)(a1 + 112) && [v5 isPartOfTrip])
    {
      os_signpost_id_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v12 = [v11 localizedStringForKey:@"PGHighlightTripSearchableText" value:@"PGHighlightTripSearchableText" table:@"Localizable"];

      v92[0] = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:1];
      v90 = &unk_1F28D1F98;
      v91 = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
      double v15 = [v5 eventCollection];
      char v16 = [v15 eventMomentNodes];
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_296;
      v76[3] = &unk_1E68E9BA0;
      id v77 = *(id *)(a1 + 40);
      id v78 = v14;
      id v79 = *(id *)(a1 + 48);
      id v80 = v12;
      id v17 = v12;
      id v18 = v14;
      [v16 enumerateNodesUsingBlock:v76];
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v20 = [v5 meaningfulEvent];
    id v21 = [v20 meaningNodes];

    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_297;
    v73[3] = &unk_1E68E9AB0;
    id v22 = v19;
    uint64_t v23 = *(void *)(a1 + 32);
    id v74 = v22;
    uint64_t v75 = v23;
    [v21 enumerateNodesUsingBlock:v73];
    if ([v22 count])
    {
      v88 = &unk_1F28D1FB0;
      id v89 = v22;
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      char v25 = [v5 eventCollection];
      uint64_t v26 = [v25 eventMomentNodes];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_299;
      v68[3] = &unk_1E68E9BA0;
      id v69 = *(id *)(a1 + 40);
      id v70 = v24;
      id v71 = *(id *)(a1 + 48);
      id v72 = v22;
      id v27 = v24;
      [v26 enumerateNodesUsingBlock:v68];
    }
    id v28 = *(void **)(a1 + 32);
    id v29 = [v5 timedEvent];
    long long v30 = [v28 _holidayNodesForTimedEvent:v29];

    if ([v30 count])
    {
      char v51 = v21;
      long long v52 = v6;
      __int16 v53 = v5;
      id v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v30, "count"));
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v32 = v30;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v64 objects:v87 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v65 != v35) {
              objc_enumerationMutation(v32);
            }
            id v37 = [*(id *)(*((void *)&v64 + 1) + 8 * i) name];
            if ([v37 length])
            {
              id v38 = [MEMORY[0x1E4F76CA8] localizedNameForName:v37];
              [v31 addObject:v38];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v64 objects:v87 count:16];
        }
        while (v34);
      }

      v85 = &unk_1F28D1FC8;
      v86 = v31;
      id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      id v5 = v53;
      id v40 = [v53 eventCollection];
      uint64_t v41 = [v40 eventMomentNodes];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_300;
      v59[3] = &unk_1E68E9BA0;
      id v60 = *(id *)(a1 + 40);
      id v61 = v39;
      id v62 = *(id *)(a1 + 48);
      id v63 = v31;
      id v42 = v31;
      id v43 = v39;
      [v41 enumerateNodesUsingBlock:v59];

      id v21 = v51;
      unint64_t v6 = v52;
    }
    uint64_t v44 = [v5 locatedEvent];
    int v45 = [v44 happensPartiallyAtHomeOrWorkOfPersonNodes:*(void *)(a1 + 56)];

    if (v45)
    {
      uint64_t v46 = [v5 eventCollection];
      uint64_t v47 = [v46 eventMomentNodes];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_301;
      v54[3] = &unk_1E68E9BA0;
      id v48 = *(id *)(a1 + 56);
      uint64_t v49 = *(void *)(a1 + 32);
      uint64_t v50 = *(void **)(a1 + 40);
      id v55 = v48;
      uint64_t v56 = v49;
      id v57 = v50;
      id v58 = *(id *)(a1 + 48);
      [v47 enumerateNodesUsingBlock:v54];
    }
  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [a2 anyObject];
  uint64_t v7 = [v6 sourceNode];
  uint64_t v8 = (void *)MEMORY[0x1E4F391D0];
  unint64_t v9 = [v7 localIdentifier];
  unint64_t v10 = [v8 uuidFromLocalIdentifier:v9];

  if ([v6 hasRoutineInfo])
  {
    os_signpost_id_t v11 = [v6 universalStartDate];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v14 = v13;

    char v16 = [v6 universalEndDate];
    id v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    double v15 = v18;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1C9C8] distantPast];
    double v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  [*(id *)(a1 + 32) aggregateKeywordArraysByCategoryMask:v5 forMomentUUID:v10 fromUniversalStartDate:v14 toEndDate:v15];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v15];
  double v20 = *(void **)(a1 + 40);
  id v24 = 0;
  [v20 accumulatePublicEventsInPublicEventKeywords:v5 forMomentUUID:v10 dateInterval:v19 error:&v24];

  id v21 = v24;
  if (v21)
  {
    id v22 = +[PGLogging sharedLogging];
    uint64_t v23 = [v22 loggingConnection];

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 138412290;
      id v26 = v21;
      _os_log_error_impl(&dword_1D1805000, v23, OS_LOG_TYPE_ERROR, "Error returned by accumulatePublicEventsInPublicEventKeywords(): (%@)", buf, 0xCu);
    }
  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_296(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v3 aggregateKeywordsByCategoryMask:v4 forMomentNode:v5];
  unint64_t v6 = (void *)MEMORY[0x1E4F391D0];
  uint64_t v7 = [v5 localIdentifier];

  uint64_t v8 = [v6 uuidFromLocalIdentifier:v7];

  unint64_t v9 = (void *)a1[6];
  uint64_t v10 = a1[7];
  id v14 = 0;
  [v9 accumulateTrip:v10 forMomentUUID:v8 error:&v14];
  id v11 = v14;
  if (v11)
  {
    id v12 = +[PGLogging sharedLogging];
    id v13 = [v12 loggingConnection];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 138412290;
      id v16 = v11;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "Error returned by accumulateTrip(): (%@)", buf, 0xCu);
    }
  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_297(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 label];
  if (([v4 isEqualToString:@"Gathering"] & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

    if (!v5)
    {
      unint64_t v6 = localizationKeyForMeaningLabel(v4);
      if (v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v8 = [v7 localizedStringForKey:v6 value:v6 table:@"Localizable"];

        [*(id *)(a1 + 32) setValue:v8 forKey:v4];
      }
      else
      {
        unint64_t v9 = +[PGLogging sharedLogging];
        uint64_t v10 = [v9 loggingConnection];

        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t buf = 138412290;
          uint64_t v17 = v4;
          _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "No localization key for meaning label: (%@)", buf, 0xCu);
        }
      }
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_298;
    v13[3] = &unk_1E68E9AB0;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v14 = v11;
    uint64_t v15 = v12;
    [v3 traverseParentMeaningHierarchyUsingBlock:v13];
  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_299(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v3 aggregateKeywordsByCategoryMask:v4 forMomentNode:v5];
  unint64_t v6 = (void *)MEMORY[0x1E4F391D0];
  uint64_t v7 = [v5 localIdentifier];

  uint64_t v8 = [v6 uuidFromLocalIdentifier:v7];

  unint64_t v9 = (void *)a1[6];
  uint64_t v10 = a1[7];
  id v14 = 0;
  [v9 accumulateMeanings:v10 forMomentUUID:v8 error:&v14];
  id v11 = v14;
  if (v11)
  {
    uint64_t v12 = +[PGLogging sharedLogging];
    id v13 = [v12 loggingConnection];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 138412290;
      id v16 = v11;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "Error returned by accumulateMeanings(): (%@)", buf, 0xCu);
    }
  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_300(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v3 aggregateKeywordsByCategoryMask:v4 forMomentNode:v5];
  unint64_t v6 = (void *)MEMORY[0x1E4F391D0];
  uint64_t v7 = [v5 localIdentifier];

  uint64_t v8 = [v6 uuidFromLocalIdentifier:v7];

  unint64_t v9 = (void *)a1[6];
  uint64_t v10 = a1[7];
  id v14 = 0;
  [v9 accumulateHolidays:v10 forMomentUUID:v8 error:&v14];
  id v11 = v14;
  if (v11)
  {
    uint64_t v12 = +[PGLogging sharedLogging];
    id v13 = [v12 loggingConnection];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 138412290;
      id v16 = v11;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "Error returned by accumulateHolidays(): (%@)", buf, 0xCu);
    }
  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_301(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 happensPartiallyAtHomeOrWorkOfPersonNodes:*(void *)(a1 + 32)])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_2_302;
    v4[3] = &unk_1E68EC120;
    v4[4] = *(void *)(a1 + 40);
    id v5 = v3;
    id v6 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    [v5 enumeratePreciseAddressEdgesAndNodesUsingBlock:v4];
  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_2_302(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v8 = [v6 collection];
  unint64_t v9 = [v8 homeWorkNodes];

  if ([v9 count])
  {
    uint64_t v10 = [v6 graph];
    id v11 = +[PGGraphNodeCollection nodesInGraph:v10];

    uint64_t v12 = [v11 homeOrWorkNodes];
    id v13 = [v9 collectionByIntersecting:v12];

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_3;
    v35[3] = &unk_1E68EE048;
    id v14 = v7;
    uint64_t v15 = *(void *)(a1 + 32);
    id v36 = v14;
    uint64_t v37 = v15;
    [v13 enumerateNodesUsingBlock:v35];
    if ([v14 count])
    {
      id v16 = (void *)MEMORY[0x1E4F391D0];
      uint64_t v17 = [*(id *)(a1 + 40) localIdentifier];
      uint64_t v18 = [v16 uuidFromLocalIdentifier:v17];

      id v19 = [v5 universalStartDate];
      double v20 = v19;
      if (v19)
      {
        id v21 = v19;
      }
      else
      {
        id v21 = [MEMORY[0x1E4F1C9C8] distantPast];
      }
      id v22 = v21;
      uint64_t v33 = v11;

      uint64_t v23 = [v5 universalEndDate];
      id v24 = v23;
      if (v23)
      {
        id v25 = v23;
      }
      else
      {
        id v25 = [MEMORY[0x1E4F1C9C8] distantFuture];
      }
      id v26 = v25;

      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v22 endDate:v26];
      [*(id *)(a1 + 48) aggregateKeywordsByCategoryMask:v14 forMomentUUID:v18 duringDateInterval:v27];
      id v28 = *(void **)(a1 + 56);
      id v34 = 0;
      [v28 accumulateHomeAndWorkWithHomeAndWorkKeywords:v14 forMomentUUID:v18 dateInterval:v27 error:&v34];
      id v29 = v34;
      if (v29)
      {
        id v32 = v22;
        long long v30 = +[PGLogging sharedLogging];
        id v31 = [v30 loggingConnection];

        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t buf = 138412290;
          id v39 = v29;
          _os_log_error_impl(&dword_1D1805000, v31, OS_LOG_TYPE_ERROR, "Error returned by accumulateHomeAndWorkWithomeAndWorkKeywords(): (%@)", buf, 0xCu);
        }

        id v22 = v32;
      }

      id v11 = v33;
    }

    unint64_t v9 = v13;
  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = [a2 label];
  if ([v5 isEqualToString:@"Home"])
  {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:&unk_1F28D1FF8];
  }
  else if ([v5 isEqualToString:@"Work"])
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 localizedStringForKey:@"PGWorkSearchableText" value:@"PGWorkSearchableText" table:@"Localizable"];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:&unk_1F28D2010];
  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_298(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 label];
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

  if (!v4)
  {
    id v5 = localizationKeyForMeaningLabel(v3);
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v7 = [v6 localizedStringForKey:v5 value:v5 table:@"Localizable"];

      [*(id *)(a1 + 32) setValue:v7 forKey:v3];
    }
    else
    {
      uint64_t v8 = +[PGLogging sharedLogging];
      unint64_t v9 = [v8 loggingConnection];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v3;
        _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "No localization key for meaning label: (%@)", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (id)assetSearchKeywordsByMomentUUIDWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 progressBlock:(id)a5
{
  return [(PGSearchKeywordComputer *)self assetSearchKeywordsByMomentUUIDWithEventUUIDs:a3 ofType:a4 searchEntityAccumulator:0 progressBlock:a5];
}

- (id)searchKeywordsByEventWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 photoLibrary:(id)a5 progressBlock:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = _Block_copy(v12);
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  id v39 = (double *)&v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  if (v13
    && (double v14 = CFAbsoluteTimeGetCurrent(), v14 - v39[3] >= 0.01)
    && (v39[3] = v14,
        LOBYTE(v46[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v13 + 2))(v13, v46, 0.0),
        char v15 = *((unsigned char *)v43 + 24) | LOBYTE(v46[0]),
        (*((unsigned char *)v43 + 24) = v15) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x4B04000202;
      LOWORD(v50) = 2080;
      *(void *)((char *)&v50 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Search/PGSearchKeywordComputer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
    id v16 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
    uint64_t v18 = [(PGGraph *)self->_graph meNodeCollection];
    uint64_t buf = 0;
    *(void *)&long long v50 = &buf;
    *((void *)&v50 + 1) = 0x2020000000;
    uint64_t v51 = 0;
    unint64_t v19 = [v10 count];
    v27[1] = 3221225472;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke;
    v27[3] = &unk_1E68E9BC8;
    p_uint64_t buf = &buf;
    double v35 = 1.0 / (double)v19;
    id v20 = v13;
    uint64_t v36 = 0x3F847AE147AE147BLL;
    uint64_t v33 = &v38;
    id v34 = &v42;
    id v31 = v20;
    void v27[4] = self;
    id v28 = v11;
    unint64_t v37 = a4;
    id v21 = v18;
    id v29 = v21;
    id v22 = v17;
    id v30 = v22;
    [(PGSearchKeywordComputer *)self _enumerateEventNodesForUUIDs:v10 ofType:a4 usingBlock:v27];
    if (v13
      && (double Current = CFAbsoluteTimeGetCurrent(), Current - v39[3] >= 0.01)
      && (v39[3] = Current,
          char v26 = 0,
          (*((void (**)(id, char *, double))v20 + 2))(v20, &v26, 1.0),
          char v24 = *((unsigned char *)v43 + 24) | v26,
          (*((unsigned char *)v43 + 24) = v24) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v46[0] = 67109378;
        v46[1] = 347;
        __int16 v47 = 2080;
        id v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GSearchKeywordComputer.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v46, 0x12u);
      }
      id v16 = (id)MEMORY[0x1E4F1CC08];
    }
    else
    {
      id v16 = v22;
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v16;
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v199 = *MEMORY[0x1E4F143B8];
  id v141 = a2;
  context = (void *)MEMORY[0x1D25FED50]();
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24);
  v140 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [v141 peopledEvent];
  v139 = [v4 personNodes];

  if ([v139 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v187 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    id v6 = v139;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v187 objects:v198 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v188;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v188 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = (void *)MEMORY[0x1E4F391D0];
          id v11 = [*(id *)(*((void *)&v187 + 1) + 8 * i) localIdentifier];
          id v12 = [v10 uuidFromLocalIdentifier:v11];

          if (v12) {
            [v5 addObject:v12];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v187 objects:v198 count:16];
      }
      while (v7);
    }

    [v140 setObject:v5 forKeyedSubscript:&unk_1F28D1F20];
  }
  if (*(void *)(a1 + 64)
    && (double v13 = CFAbsoluteTimeGetCurrent(),
        uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8),
        v13 - *(double *)(v14 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v14 + 24) = v13,
        LOBYTE(v149) = 0,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    char v15 = [v141 peopledEvent];
    v138 = [v15 petNodes];

    if ([v138 count])
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v185 = 0u;
      long long v186 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      id v17 = v138;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v183 objects:v197 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v184;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v184 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = (void *)MEMORY[0x1E4F391D0];
            id v22 = [*(id *)(*((void *)&v183 + 1) + 8 * j) localIdentifier];
            uint64_t v23 = [v21 uuidFromLocalIdentifier:v22];

            if (v23) {
              [v16 addObject:v23];
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v183 objects:v197 count:16];
        }
        while (v18);
      }

      [v140 setObject:v16 forKeyedSubscript:&unk_1F28D1F38];
    }
    if (*(void *)(a1 + 64)
      && (double v24 = CFAbsoluteTimeGetCurrent(),
          uint64_t v25 = *(void *)(*(void *)(a1 + 80) + 8),
          v24 - *(double *)(v25 + 24) >= *(double *)(a1 + 104))
      && (*(double *)(v25 + 24) = v24,
          LOBYTE(v149) = 0,
          (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72)
                                                                                               + 8)
                                                                                   + 24)),
          (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                 + 24)) != 0))
    {
      *a3 = 1;
    }
    else
    {
      char v26 = [v141 peopledEvent];
      v137 = [v26 socialGroupNodes];

      if ([v137 count])
      {
        id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v28 = +[PGGraphSocialGroupNode importanceSortDescriptors];
        id v29 = [v137 sortedArrayUsingDescriptors:v28];

        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v179 objects:v196 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v180;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v180 != v32) {
                objc_enumerationMutation(v30);
              }
              id v34 = [*(id *)(a1 + 32) _personUUIDsInSocialGroupNode:*(void *)(*((void *)&v179 + 1) + 8 * k) photoLibrary:*(void *)(a1 + 40)];
              if ((unint64_t)[v34 count] >= 2) {
                [v27 addObject:v34];
              }
            }
            uint64_t v31 = [v30 countByEnumeratingWithState:&v179 objects:v196 count:16];
          }
          while (v31);
        }

        if ([v27 count]) {
          [v140 setObject:v27 forKeyedSubscript:&unk_1F28D1F50];
        }
      }
      if (*(void *)(a1 + 64)
        && (double v35 = CFAbsoluteTimeGetCurrent(),
            uint64_t v36 = *(void *)(*(void *)(a1 + 80) + 8),
            v35 - *(double *)(v36 + 24) >= *(double *)(a1 + 104))
        && (*(double *)(v36 + 24) = v35,
            LOBYTE(v149) = 0,
            (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72)
                                                                                                 + 8)
                                                                                     + 24)),
            (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88)
                                                                                               + 8)
                                                                                   + 24)) != 0))
      {
        *a3 = 1;
      }
      else
      {
        unint64_t v37 = [v141 locatedEvent];
        v136 = [v37 addressNodes];

        if ([v136 count])
        {
          uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v136, "count"));
          long long v177 = 0u;
          long long v178 = 0u;
          long long v175 = 0u;
          long long v176 = 0u;
          id v39 = v136;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v175 objects:v195 count:16];
          if (v40)
          {
            uint64_t v41 = *(void *)v176;
            do
            {
              for (uint64_t m = 0; m != v40; ++m)
              {
                if (*(void *)v176 != v41) {
                  objc_enumerationMutation(v39);
                }
                id v43 = locationNamesByCategoryForAddress(*(void **)(*((void *)&v175 + 1) + 8 * m));
                [v38 addObject:v43];
              }
              uint64_t v40 = [v39 countByEnumeratingWithState:&v175 objects:v195 count:16];
            }
            while (v40);
          }

          [v140 setObject:v38 forKeyedSubscript:&unk_1F28D1F68];
        }
        if (*(void *)(a1 + 64)
          && (double v44 = CFAbsoluteTimeGetCurrent(),
              uint64_t v45 = *(void *)(*(void *)(a1 + 80) + 8),
              v44 - *(double *)(v45 + 24) >= *(double *)(a1 + 104))
          && (*(double *)(v45 + 24) = v44,
              LOBYTE(v149) = 0,
              (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                       + 24)),
              (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88)
                                                                                                 + 8)
                                                                                     + 24)) != 0))
        {
          *a3 = 1;
        }
        else
        {
          uint64_t v46 = [v141 timedEvent];
          v133 = [v46 dateNodes];

          if ([v133 count])
          {
            __int16 v47 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v133, "count"));
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            id v48 = v133;
            uint64_t v49 = [v48 countByEnumeratingWithState:&v171 objects:v194 count:16];
            if (v49)
            {
              uint64_t v50 = *(void *)v172;
              do
              {
                for (uint64_t n = 0; n != v49; ++n)
                {
                  if (*(void *)v172 != v50) {
                    objc_enumerationMutation(v48);
                  }
                  uint64_t v52 = [*(id *)(*((void *)&v171 + 1) + 8 * n) localDate];
                  if (v52) {
                    [v47 addObject:v52];
                  }
                }
                uint64_t v49 = [v48 countByEnumeratingWithState:&v171 objects:v194 count:16];
              }
              while (v49);
            }

            [v140 setObject:v47 forKeyedSubscript:&unk_1F28D1F80];
          }
          if (*(void *)(a1 + 64))
          {
            double Current = CFAbsoluteTimeGetCurrent();
            uint64_t v54 = *(void *)(*(void *)(a1 + 80) + 8);
            if (Current - *(double *)(v54 + 24) >= *(double *)(a1 + 104))
            {
              *(double *)(v54 + 24) = Current;
              LOBYTE(v149) = 0;
              (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                       + 24));
              *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88)
                                                                                                + 8)
                                                                                    + 24);
              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
                goto LABEL_81;
              }
            }
          }
          if (*(void *)(a1 + 112) && [v141 isTrip])
          {
            id v55 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            uint64_t v56 = [v55 localizedStringForKey:@"PGHighlightTripSearchableText" value:@"PGHighlightTripSearchableText" table:@"Localizable"];
            [v140 setObject:v56 forKeyedSubscript:&unk_1F28D1F98];
          }
          if (*(void *)(a1 + 64)
            && (double v57 = CFAbsoluteTimeGetCurrent(),
                uint64_t v58 = *(void *)(*(void *)(a1 + 80) + 8),
                v57 - *(double *)(v58 + 24) >= *(double *)(a1 + 104))
            && (*(double *)(v58 + 24) = v57,
                LOBYTE(v149) = 0,
                (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                         + 24)),
                (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                       + 24)) != 0))
          {
LABEL_81:
            *a3 = 1;
          }
          else
          {
            id v59 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            id v60 = [v141 meaningfulEvent];
            id v61 = [v60 meaningNodes];

            if (!v61)
            {
              if ([v141 isTrip])
              {
                id v61 = 0;
              }
              else
              {
                id v62 = [v141 eventCollection];
                id v63 = [v62 eventMomentNodes];
                id v61 = [v63 meaningNodes];
              }
            }
            v169[0] = MEMORY[0x1E4F143A8];
            v169[1] = 3221225472;
            v169[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_257;
            v169[3] = &unk_1E68E9AB0;
            v169[4] = *(void *)(a1 + 32);
            id v132 = v59;
            id v170 = v132;
            v129 = v61;
            [v61 enumerateNodesUsingBlock:v169];
            if ([v132 count])
            {
              long long v64 = [v132 allObjects];
              [v140 setObject:v64 forKeyedSubscript:&unk_1F28D1FB0];
            }
            if (*(void *)(a1 + 64)
              && (double v65 = CFAbsoluteTimeGetCurrent(),
                  uint64_t v66 = *(void *)(*(void *)(a1 + 80) + 8),
                  v65 - *(double *)(v66 + 24) >= *(double *)(a1 + 104))
              && (*(double *)(v66 + 24) = v65,
                  LOBYTE(v149) = 0,
                  (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                           + 24)),
                  (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                         + 24)) != 0))
            {
              *a3 = 1;
            }
            else
            {
              long long v67 = *(void **)(a1 + 32);
              v68 = [v141 timedEvent];
              v131 = [v67 _holidayNodesForTimedEvent:v68];

              if ([v131 count])
              {
                id v69 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v131, "count"));
                long long v167 = 0u;
                long long v168 = 0u;
                long long v165 = 0u;
                long long v166 = 0u;
                id v70 = v131;
                uint64_t v71 = [v70 countByEnumeratingWithState:&v165 objects:v193 count:16];
                if (v71)
                {
                  uint64_t v72 = *(void *)v166;
                  do
                  {
                    for (iuint64_t i = 0; ii != v71; ++ii)
                    {
                      if (*(void *)v166 != v72) {
                        objc_enumerationMutation(v70);
                      }
                      id v74 = [*(id *)(*((void *)&v165 + 1) + 8 * ii) name];
                      if ([v74 length])
                      {
                        uint64_t v75 = [MEMORY[0x1E4F76CA8] localizedNameForName:v74];
                        [v69 addObject:v75];
                      }
                    }
                    uint64_t v71 = [v70 countByEnumeratingWithState:&v165 objects:v193 count:16];
                  }
                  while (v71);
                }

                [v140 setObject:v69 forKeyedSubscript:&unk_1F28D1FC8];
              }
              if (*(void *)(a1 + 64)
                && (double v76 = CFAbsoluteTimeGetCurrent(),
                    uint64_t v77 = *(void *)(*(void *)(a1 + 80) + 8),
                    v76 - *(double *)(v77 + 24) >= *(double *)(a1 + 104))
                && (*(double *)(v77 + 24) = v76,
                    LOBYTE(v149) = 0,
                    (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                             + 24)),
                    (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                           + 24)) != 0))
              {
                *a3 = 1;
              }
              else
              {
                id v78 = [v141 locatedEvent];
                v130 = [v78 roiNodes];

                if ([v130 count])
                {
                  id v79 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v130, "count"));
                  long long v163 = 0u;
                  long long v164 = 0u;
                  long long v161 = 0u;
                  long long v162 = 0u;
                  id v80 = v130;
                  uint64_t v81 = [v80 countByEnumeratingWithState:&v161 objects:v192 count:16];
                  if (v81)
                  {
                    uint64_t v82 = *(void *)v162;
                    do
                    {
                      for (juint64_t j = 0; jj != v81; ++jj)
                      {
                        if (*(void *)v162 != v82) {
                          objc_enumerationMutation(v80);
                        }
                        char v84 = *(void **)(*((void *)&v161 + 1) + 8 * jj);
                        v85 = [v84 label];
                        char v86 = [v85 isEqualToString:@"Urban"];

                        if ((v86 & 1) == 0)
                        {
                          v87 = [v84 localizedName];
                          if ([v87 length]) {
                            [v79 addObject:v87];
                          }
                        }
                      }
                      uint64_t v81 = [v80 countByEnumeratingWithState:&v161 objects:v192 count:16];
                    }
                    while (v81);
                  }

                  if ([v79 count]) {
                    v88 = v79;
                  }
                  else {
                    v88 = 0;
                  }
                  [v140 setObject:v88 forKeyedSubscript:&unk_1F28D1FE0];
                }
                if (*(void *)(a1 + 64))
                {
                  double v89 = CFAbsoluteTimeGetCurrent();
                  uint64_t v90 = *(void *)(*(void *)(a1 + 80) + 8);
                  if (v89 - *(double *)(v90 + 24) >= *(double *)(a1 + 104))
                  {
                    *(double *)(v90 + 24) = v89;
                    LOBYTE(v149) = 0;
                    (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                             + 24));
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                          + 24);
                    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
                      goto LABEL_134;
                    }
                  }
                }
                v91 = [v141 locatedEvent];
                if ([v91 happensPartiallyAtHomeOfPersonNodes:*(void *)(a1 + 48)]) {
                  uint64_t v92 = MEMORY[0x1E4F1CC38];
                }
                else {
                  uint64_t v92 = 0;
                }
                [v140 setObject:v92 forKeyedSubscript:&unk_1F28D1FF8];

                v93 = [v141 locatedEvent];
                int v94 = [v93 happensPartiallyAtWorkOfPersonNodes:*(void *)(a1 + 48)];

                if (v94)
                {
                  v95 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                  v96 = [v95 localizedStringForKey:@"PGWorkSearchableText" value:@"PGWorkSearchableText" table:@"Localizable"];
                  [v140 setObject:v96 forKeyedSubscript:&unk_1F28D2010];
                }
                if (*(void *)(a1 + 64)
                  && (double v97 = CFAbsoluteTimeGetCurrent(),
                      uint64_t v98 = *(void *)(*(void *)(a1 + 80) + 8),
                      v97 - *(double *)(v98 + 24) >= *(double *)(a1 + 104))
                  && (*(double *)(v98 + 24) = v97,
                      LOBYTE(v149) = 0,
                      (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                               + 24)),
                      (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                             + 24)) != 0))
                {
LABEL_134:
                  *a3 = 1;
                }
                else
                {
                  v99 = [MEMORY[0x1E4F1CA60] dictionary];
                  v100 = *(void **)(a1 + 32);
                  v101 = [v141 businessedEvent];
                  v159[0] = MEMORY[0x1E4F143A8];
                  v159[1] = 3221225472;
                  v159[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_275;
                  v159[3] = &unk_1E68E9AD8;
                  id v102 = v99;
                  id v160 = v102;
                  [v100 _enumerateBusinessAndPublicEventKeywordsForEvent:v101 usingBlock:v159];

                  v157[0] = MEMORY[0x1E4F143A8];
                  v157[1] = 3221225472;
                  v157[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_3;
                  v157[3] = &unk_1E68E9B00;
                  id v128 = v140;
                  id v158 = v128;
                  [v102 enumerateKeysAndObjectsUsingBlock:v157];
                  if (*(void *)(a1 + 64)
                    && (double v103 = CFAbsoluteTimeGetCurrent(),
                        uint64_t v104 = *(void *)(*(void *)(a1 + 80) + 8),
                        v103 - *(double *)(v104 + 24) >= *(double *)(a1 + 104))
                    && (*(double *)(v104 + 24) = v103,
                        LOBYTE(v149) = 0,
                        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                                 + 24)),
                        (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                               + 24)) != 0))
                  {
                    *a3 = 1;
                  }
                  else
                  {
                    v105 = [v141 timedEvent];
                    v106 = [v105 seasonNodes];

                    v107 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v106, "count"));
                    long long v155 = 0u;
                    long long v156 = 0u;
                    long long v153 = 0u;
                    long long v154 = 0u;
                    id v108 = v106;
                    uint64_t v109 = [v108 countByEnumeratingWithState:&v153 objects:v191 count:16];
                    if (v109)
                    {
                      uint64_t v110 = *(void *)v154;
                      do
                      {
                        for (kuint64_t k = 0; kk != v109; ++kk)
                        {
                          if (*(void *)v154 != v110) {
                            objc_enumerationMutation(v108);
                          }
                          v112 = [*(id *)(*((void *)&v153 + 1) + 8 * kk) localizedName];
                          [v107 addObject:v112];
                        }
                        uint64_t v109 = [v108 countByEnumeratingWithState:&v153 objects:v191 count:16];
                      }
                      while (v109);
                    }

                    [v128 setObject:v107 forKeyedSubscript:&unk_1F28D2028];
                    if (*(void *)(a1 + 64)
                      && (double v113 = CFAbsoluteTimeGetCurrent(),
                          uint64_t v114 = *(void *)(*(void *)(a1 + 80) + 8),
                          v113 - *(double *)(v114 + 24) >= *(double *)(a1 + 104))
                      && (*(double *)(v114 + 24) = v113,
                          LOBYTE(v149) = 0,
                          (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)),
                          (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                                 + 24)) != 0))
                    {
                      *a3 = 1;
                    }
                    else
                    {
                      v115 = [MEMORY[0x1E4F1CA60] dictionary];
                      uint64_t v149 = 0;
                      v150 = &v149;
                      uint64_t v151 = 0x2020000000;
                      uint64_t v152 = 0;
                      v116 = [v141 eventCollection];
                      v117 = [v116 eventMomentNodes];
                      v146[0] = MEMORY[0x1E4F143A8];
                      v146[1] = 3221225472;
                      v146[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_281;
                      v146[3] = &unk_1E68EF338;
                      v148 = &v149;
                      id v118 = v115;
                      id v147 = v118;
                      [v117 enumerateNodesUsingBlock:v146];

                      if (*(void *)(a1 + 64)
                        && (double v119 = CFAbsoluteTimeGetCurrent(),
                            uint64_t v120 = *(void *)(*(void *)(a1 + 80) + 8),
                            v119 - *(double *)(v120 + 24) >= *(double *)(a1 + 104))
                        && (*(double *)(v120 + 24) = v119,
                            char v145 = 0,
                            (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)),
                            (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) != 0))
                      {
                        *a3 = 1;
                      }
                      else
                      {
                        unint64_t v121 = v150[3];
                        v122 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v118, "count"));
                        v142[0] = MEMORY[0x1E4F143A8];
                        v142[1] = 3221225472;
                        v142[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_3_286;
                        v142[3] = &unk_1E68E9B50;
                        double v144 = (double)v121 * 0.3;
                        id v123 = v122;
                        id v143 = v123;
                        [v118 enumerateKeysAndObjectsUsingBlock:v142];
                        [v128 setObject:v123 forKeyedSubscript:&unk_1F28D2040];
                        if (*(void *)(a1 + 64)
                          && (double v124 = CFAbsoluteTimeGetCurrent(),
                              uint64_t v125 = *(void *)(*(void *)(a1 + 80) + 8),
                              v124 - *(double *)(v125 + 24) >= *(double *)(a1 + 104))
                          && (*(double *)(v125 + 24) = v124,
                              char v145 = 0,
                              (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)),
                              (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) |= v145) != 0))
                        {
                          *a3 = 1;
                        }
                        else
                        {
                          v126 = *(void **)(a1 + 56);
                          v127 = [v141 UUID];
                          [v126 setObject:v128 forKeyedSubscript:v127];
                        }
                      }

                      _Block_object_dispose(&v149, 8);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_257(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 label];
  if (([v4 isEqualToString:@"Gathering"] & 1) == 0)
  {
    id v5 = localizationKeyForMeaningLabel(v4);
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v7 = [v6 localizedStringForKey:v5 value:v5 table:@"Localizable"];

      [*(id *)(a1 + 40) addObject:v7];
    }
    else
    {
      uint64_t v8 = +[PGLogging sharedLogging];
      unint64_t v9 = [v8 loggingConnection];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 138412290;
        uint64_t v14 = v4;
        _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "No localization key for meaning label: (%@)", buf, 0xCu);
      }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_259;
    v11[3] = &unk_1E68E9AB0;
    id v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    [v3 traverseParentMeaningHierarchyUsingBlock:v11];
  }
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_275(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_2;
  v4[3] = &unk_1E68EB5B0;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 allObjects];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_281(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 numberOfAssets];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_2_282;
  v5[3] = &unk_1E68E9B28;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = v4;
  [v3 enumerateSceneEdgesAndNodesUsingBlock:v5];
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_3_286(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  [a3 doubleValue];
  if (v5 >= *(double *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_2_282(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  if ([a2 isSearchableForEvent])
  {
    if ([v10 isIndexed])
    {
      uint64_t v5 = [v10 sceneIdentifier];
      if (v5)
      {
        id v6 = [NSNumber numberWithUnsignedLongLong:v5];
        uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
        uint64_t v8 = [v7 unsignedIntegerValue];

        unint64_t v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40) + v8];
        [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v6];
      }
    }
  }
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  [v6 addObjectsFromArray:v5];
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_259(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 label];
  uint64_t v4 = localizationKeyForMeaningLabel(v3);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:v4 value:v4 table:@"Localizable"];

    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    id v7 = +[PGLogging sharedLogging];
    uint64_t v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "No localization key for meaning label: (%@)", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (PGSearchKeywordComputer)initWithGraph:(id)a3 searchComputationCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGSearchKeywordComputer;
  int v9 = [(PGSearchKeywordComputer *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    objc_storeStrong((id *)&v10->_searchComputationCache, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    userLocale = v10->_userLocale;
    v10->_userLocale = (NSLocale *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F76CB8]) initWithLocale:v10->_userLocale];
    holidayService = v10->_holidayService;
    v10->_holidayService = (CLSHolidayCalendarEventService *)v13;
  }
  return v10;
}

@end