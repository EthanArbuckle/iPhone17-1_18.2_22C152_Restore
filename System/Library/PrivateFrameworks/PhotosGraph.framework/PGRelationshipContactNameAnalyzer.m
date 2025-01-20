@interface PGRelationshipContactNameAnalyzer
- (NSString)name;
- (PGRelationshipContactNameAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipContactNameAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _Block_copy(v4);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  if (v5
    && (double v6 = CFAbsoluteTimeGetCurrent(), v6 - v35[3] >= 0.01)
    && (v35[3] = v6,
        LOBYTE(v42[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v5 + 2))(v5, v42, 0.0),
        char v7 = *((unsigned char *)v39 + 24) | LOBYTE(v42[0]),
        (*((unsigned char *)v39 + 24) = v7) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x2604000202;
      LOWORD(v46) = 2080;
      *(void *)((char *)&v46 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/People Inferences/Relationship/Relationship Analyzers/PGRela"
                                      "tionshipContactNameAnalyzer.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v9 = [WeakRetained graph];
    v10 = [v9 inferredUserLocales];
    v11 = [WeakRetained serviceManager];
    v12 = [v11 mePerson];
    v13 = [WeakRetained personNodes];
    unint64_t v14 = [v13 count];
    uint64_t buf = 0;
    *(void *)&long long v46 = &buf;
    *((void *)&v46 + 1) = 0x2020000000;
    uint64_t v47 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__PGRelationshipContactNameAnalyzer_runAnalysisWithProgressBlock___block_invoke;
    v23[3] = &unk_1E68EFCE8;
    p_uint64_t buf = &buf;
    double v32 = 1.0 / (double)v14;
    id v15 = v5;
    id v28 = v15;
    v30 = &v34;
    uint64_t v33 = 0x3F847AE147AE147BLL;
    v31 = &v38;
    id v16 = v11;
    id v24 = v16;
    id v17 = v10;
    id v25 = v17;
    id v18 = WeakRetained;
    id v26 = v18;
    id v19 = v12;
    id v27 = v19;
    [v13 enumerateNodesUsingBlock:v23];
    if (v5)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v35[3] >= 0.01)
      {
        v35[3] = Current;
        char v22 = 0;
        (*((void (**)(id, char *, double))v15 + 2))(v15, &v22, 1.0);
        char v21 = *((unsigned char *)v39 + 24) | v22;
        *((unsigned char *)v39 + 24) = v21;
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            v42[0] = 67109378;
            v42[1] = 105;
            __int16 v43 = 2080;
            v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipContactNameAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v42, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

void __66__PGRelationshipContactNameAnalyzer_runAnalysisWithProgressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24);
  if (*(void *)(a1 + 64)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v7 + 24) = Current,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    v8 = [v5 name];
    if ([v8 length])
    {
      v9 = [v5 contactIdentifier];
      if ([v9 length]
        && ([*(id *)(a1 + 32) personForIdentifier:v9],
            (id v10 = (id)objc_claimAutoreleasedReturnValue()) != 0)
        || (id v10 = objc_alloc_init(MEMORY[0x1E4F76D50]), [v10 setFullName:v8], v10))
      {
        if ((unint64_t)([*(id *)(a1 + 32) relationshipHintForPerson:v10 usingLocales:*(void *)(a1 + 40)]- 8) <= 2)
        {
          v11 = *(void **)(a1 + 48);
          v12 = [v5 localIdentifier];
          v13 = [v11 relationshipAnalyzerPropertiesForPersonLocalIdentifier:v12];

          if (v13) {
            [v13 registerParentContactName];
          }
        }
        if (*(void *)(a1 + 56) && objc_msgSend(v10, "hasSameFamilyNameAsPerson:"))
        {
          unint64_t v14 = *(void **)(a1 + 48);
          id v15 = [v5 localIdentifier];
          id v16 = [v14 relationshipAnalyzerPropertiesForPersonLocalIdentifier:v15];

          if (v16) {
            [v16 registerSameFamilyNameAsMePerson];
          }
        }
      }
    }
  }
}

- (PGRelationshipContactNameAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipContactNameAnalyzer;
  id v5 = [(PGRelationshipContactNameAnalyzer *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipContactNameAnalyzer";
}

@end