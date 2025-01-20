@interface PGRelationshipAnniversaryAnalyzer
- (NSString)name;
- (PGRelationshipAnniversaryAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipAnniversaryAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _Block_copy(v4);
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  if (v5
    && (double v6 = CFAbsoluteTimeGetCurrent(), v6 - v26[3] >= 0.01)
    && (v26[3] = v6,
        LOBYTE(v33[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v5 + 2))(v5, v33, 0.0),
        char v7 = *((unsigned char *)v30 + 24) | LOBYTE(v33[0]),
        (*((unsigned char *)v30 + 24) = v7) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x2104000202;
      LOWORD(v37) = 2080;
      *(void *)((char *)&v37 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/People Inferences/Relationship/Relationship Analyzers/PGRela"
                                      "tionshipAnniversaryAnalyzer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v9 = [WeakRetained personNodes];
    unint64_t v10 = [v9 count];
    uint64_t buf = 0;
    *(void *)&long long v37 = &buf;
    *((void *)&v37 + 1) = 0x2020000000;
    uint64_t v38 = 0;
    double v11 = 1.0 / (double)v10;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__PGRelationshipAnniversaryAnalyzer_runAnalysisWithProgressBlock___block_invoke;
    v17[3] = &unk_1E68E58F0;
    id v12 = WeakRetained;
    id v18 = v12;
    p_uint64_t buf = &buf;
    double v23 = v11;
    id v13 = v5;
    id v19 = v13;
    v21 = &v25;
    uint64_t v24 = 0x3F847AE147AE147BLL;
    v22 = &v29;
    [v9 enumerateNodesUsingBlock:v17];
    if (v5)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v26[3] >= 0.01)
      {
        v26[3] = Current;
        char v16 = 0;
        (*((void (**)(id, char *, double))v13 + 2))(v13, &v16, 1.0);
        char v15 = *((unsigned char *)v30 + 24) | v16;
        *((unsigned char *)v30 + 24) = v15;
        if (v15)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            v33[0] = 67109378;
            v33[1] = 54;
            __int16 v34 = 2080;
            v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipAnniversaryAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v33, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

void __66__PGRelationshipAnniversaryAnalyzer_runAnalysisWithProgressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  double v6 = [v5 anniversaryDate];

  if (v6)
  {
    char v7 = *(void **)(a1 + 32);
    v8 = [v5 localIdentifier];
    v9 = [v7 relationshipAnalyzerPropertiesForPersonLocalIdentifier:v8];

    if (v9) {
      [v9 registerAnniversaryDate];
    }
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(a1 + 72)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
  if (*(void *)(a1 + 40))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    if (Current - *(double *)(v11 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v11 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                               + 24));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
}

- (PGRelationshipAnniversaryAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipAnniversaryAnalyzer;
  id v5 = [(PGRelationshipAnniversaryAnalyzer *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipAnniversaryAnalyzer";
}

@end