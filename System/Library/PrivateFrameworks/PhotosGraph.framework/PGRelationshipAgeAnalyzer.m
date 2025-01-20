@interface PGRelationshipAgeAnalyzer
- (NSString)name;
- (PGRelationshipAgeAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipAgeAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id aBlock = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  v5 = [WeakRetained graph];
  v6 = _Block_copy(aBlock);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  if (v6
    && (double v7 = CFAbsoluteTimeGetCurrent(), v7 - v39[3] >= 0.01)
    && (v39[3] = v7,
        LOBYTE(v46[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v6 + 2))(v6, v46, 0.0),
        char v8 = *((unsigned char *)v43 + 24) | LOBYTE(v46[0]),
        (*((unsigned char *)v43 + 24) = v8) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x2704000202;
      LOWORD(v50) = 2080;
      *(void *)((char *)&v50 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/People Inferences/Relationship/Relationship Analyzers/PGRela"
                                      "tionshipAgeAnalyzer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    v9 = [v5 meNode];
    v10 = v9;
    if (v9) {
      uint64_t v11 = [v9 ageCategory];
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = [WeakRetained relationshipAnalyzerPropertiesByPersonLocalIdentifier];
    unint64_t v13 = [v12 count];

    if (v13 && v11)
    {
      uint64_t buf = 0;
      *(void *)&long long v50 = &buf;
      *((void *)&v50 + 1) = 0x2020000000;
      uint64_t v51 = 0;
      v14 = [WeakRetained relationshipAnalyzerPropertiesByPersonLocalIdentifier];
      v24 = [v14 allKeys];
      v15 = +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:");
      v16 = [v15 personNodeByLocalIdentifier];
      double v17 = 1.0 / (double)v13;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __58__PGRelationshipAgeAnalyzer_runAnalysisWithProgressBlock___block_invoke;
      v29[3] = &unk_1E68E8378;
      id v18 = v6;
      id v31 = v18;
      v32 = &v38;
      uint64_t v35 = 0x3F847AE147AE147BLL;
      p_uint64_t buf = &buf;
      v34 = &v42;
      double v36 = v17;
      id v19 = v16;
      id v30 = v19;
      uint64_t v37 = v11;
      [v14 enumerateKeysAndObjectsUsingBlock:v29];
      if ((unint64_t)(v11 - 3) <= 2)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __58__PGRelationshipAgeAnalyzer_runAnalysisWithProgressBlock___block_invoke_2;
        v27[3] = &unk_1E68E83A0;
        id v28 = v14;
        +[PGImportantEntitiesChildrenProcessor processUserChildrenInGraph:v5 progressBlock:aBlock withProcessInferredChildNodeClosure:v27];
      }
      if (v6)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v39[3] >= 0.01)
        {
          v39[3] = Current;
          char v26 = 0;
          (*((void (**)(id, char *, double))v18 + 2))(v18, &v26, 1.0);
          char v21 = *((unsigned char *)v43 + 24) | v26;
          *((unsigned char *)v43 + 24) = v21;
          if (v21)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              v46[0] = 67109378;
              v46[1] = 108;
              __int16 v47 = 2080;
              v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipAgeAnalyzer.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v46, 0x12u);
            }
          }
        }
      }

      _Block_object_dispose(&buf, 8);
    }
    else if (v6)
    {
      double v22 = CFAbsoluteTimeGetCurrent();
      if (v22 - v39[3] >= 0.01)
      {
        v39[3] = v22;
        LOBYTE(v46[0]) = 0;
        (*((void (**)(void *, _DWORD *, double))v6 + 2))(v6, v46, 1.0);
        char v23 = *((unsigned char *)v43 + 24) | LOBYTE(v46[0]);
        *((unsigned char *)v43 + 24) = v23;
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 0x2F04000202;
            LOWORD(v50) = 2080;
            *(void *)((char *)&v50 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Graph/People Inferences/Relationship/Relationship Anal"
                                            "yzers/PGRelationshipAgeAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
        }
      }
    }
  }
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
}

void __58__PGRelationshipAgeAnalyzer_runAnalysisWithProgressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (*(void *)(a1 + 40)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8),
        Current - *(double *)(v10 + 24) >= *(double *)(a1 + 72))
    && (*(double *)(v10 + 24) = Current,
        (*(void (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 80)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
    uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    uint64_t v12 = [v11 ageCategory];
    if (v12)
    {
      unint64_t v13 = v12;
      uint64_t v14 = *(void *)(a1 + 88);
      if (v12 != v14) {
        [v8 penalizePersonAgeCategoryDifferentThanMeNode];
      }
      if (v13 > 2)
      {
        BOOL v15 = 0;
        if (v13 == 4 && v14 != 4) {
          BOOL v15 = *(void *)(a1 + 88) != 5;
        }
      }
      else
      {
        [v8 penalizePersonScoresForChild];
        BOOL v15 = 0;
      }
      BOOL v16 = v13 != v14 && v13 == 5;
      if (v16 || v15) {
        [v8 registerPersonOldEnoughToBeMeNodeParentOrMyGrandparent];
      }
    }
  }
}

void __58__PGRelationshipAgeAnalyzer_runAnalysisWithProgressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 localIdentifier];
  if (v3)
  {
    v6 = v3;
    v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    if (v4)
    {
      v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
      [v5 registerPersonAsMeNodeChild];
    }
    v3 = v6;
  }
}

- (PGRelationshipAgeAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipAgeAnalyzer;
  v5 = [(PGRelationshipAgeAnalyzer *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipAgeAnalyzer";
}

@end