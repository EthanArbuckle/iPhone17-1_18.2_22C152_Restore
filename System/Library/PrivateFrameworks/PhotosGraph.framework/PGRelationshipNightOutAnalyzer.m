@interface PGRelationshipNightOutAnalyzer
- (NSString)name;
- (PGRelationshipNightOutAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipNightOutAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (!v4 || (double v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v8 = [WeakRetained graph];
    v9 = [v8 momentNodesWithMeaning:8];

    uint64_t v10 = [v9 count];
    v11 = [PGGraphMomentNodeCollection alloc];
    v12 = [WeakRetained graph];
    v13 = [(MAElementCollection *)v11 initWithSet:v9 graph:v12];

    v14 = [WeakRetained personNodes];
    v15 = +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:v13 amongPersonNodes:v14];

    uint64_t v16 = [v15 count];
    if (v16)
    {
      unint64_t v17 = v16;
      v31 = v13;
      v32 = v9;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v30 = v15;
      id v18 = v15;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        double v21 = 1.0 / (double)v17;
        uint64_t v22 = *(void *)v34;
        double v23 = 0.0;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v18);
            }
            v25 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v26 = objc_msgSend(v25, "localIdentifier", v30, v31, v32);
            v27 = [WeakRetained relationshipAnalyzerPropertiesForPersonLocalIdentifier:v26];
            if (v27) {
              objc_msgSend(v27, "registerNumberOfNightsOut:amongNightsOut:", objc_msgSend(v18, "countForObject:", v25), v10);
            }
            if (v4)
            {
              double Current = CFAbsoluteTimeGetCurrent();
              if (Current - v5 >= 0.01)
              {
                char v37 = 0;
                v4[2](v4, &v37, v23);
                if (v37)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    int v40 = 60;
                    __int16 v41 = 2080;
                    v42 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipNightOutAnalyzer.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  v13 = v31;
                  v9 = v32;
                  v15 = v30;
                  goto LABEL_35;
                }
                double v5 = Current;
              }
            }
            double v23 = v21 + v23;
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      v13 = v31;
      v9 = v32;
      v15 = v30;
      if (!v4) {
        goto LABEL_35;
      }
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01) {
        goto LABEL_35;
      }
      char v37 = 0;
      v4[2](v4, &v37, 1.0);
      if (!v37 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 67109378;
      int v40 = 64;
      __int16 v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/Relationship Analyzers/PGRelationshipNightOutAnalyzer.m";
      v29 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!v4) {
        goto LABEL_35;
      }
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01) {
        goto LABEL_35;
      }
      char v37 = 0;
      v4[2](v4, &v37, 1.0);
      if (!v37 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 67109378;
      int v40 = 45;
      __int16 v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/Relationship Analyzers/PGRelationshipNightOutAnalyzer.m";
      v29 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
LABEL_35:

    goto LABEL_36;
  }
  char v37 = 0;
  v4[2](v4, &v37, 0.0);
  if (!v37)
  {
    double v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v40 = 34;
    __int16 v41 = 2080;
    v42 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipNightOutAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_36:
}

- (PGRelationshipNightOutAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipNightOutAnalyzer;
  double v5 = [(PGRelationshipNightOutAnalyzer *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipNightOutAnalyzer";
}

@end