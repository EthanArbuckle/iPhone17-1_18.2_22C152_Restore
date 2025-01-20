@interface PGRelationshipWorkAnalyzer
- (NSString)name;
- (PGRelationshipWorkAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipWorkAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (!v4 || (double v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v7 = [WeakRetained momentNodes];
    v8 = +[PGPeopleInferencesConveniences momentNodesAtWorkInMomentNodes:v7];

    uint64_t v9 = [v8 count];
    v10 = +[PGLogging sharedLogging];
    v11 = [v10 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v39 = v9;
      _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[PGRelationshipWorkAnalyzer] Number of moments at work: %lu", buf, 0xCu);
    }

    if (!v9)
    {
      if (v4)
      {
        if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
        {
          char v36 = 0;
          v4[2](v4, &v36, 1.0);
          if (v36)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v39 = 43;
              *(_WORD *)&v39[4] = 2080;
              *(void *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationsh"
                                   "ipWorkAnalyzer.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_48;
    }
    v12 = [WeakRetained personNodes];
    v30 = v8;
    v13 = +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:v8 amongPersonNodes:v12];

    unint64_t v14 = [v13 count];
    v15 = +[PGLogging sharedLogging];
    v16 = [v15 loggingConnection];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v39 = v14;
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[PGRelationshipWorkAnalyzer] Number of people at work: %lu", buf, 0xCu);
    }

    if (v14)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v29 = v13;
      id v17 = v13;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        double v20 = 1.0 / (double)v14;
        uint64_t v21 = *(void *)v33;
        double v22 = 0.0;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v17);
            }
            v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if ((unint64_t)([v24 ageCategory] - 1) >= 2)
            {
              v25 = [v24 localIdentifier];
              v26 = [WeakRetained relationshipAnalyzerPropertiesForPersonLocalIdentifier:v25];
              if (v26) {
                objc_msgSend(v26, "registerNumberOfMomentsAtWork:amongMomentsAtWork:", objc_msgSend(v17, "countForObject:", v24), v9);
              }
              if (v4)
              {
                double Current = CFAbsoluteTimeGetCurrent();
                if (Current - v5 >= 0.01)
                {
                  char v36 = 0;
                  v4[2](v4, &v36, v22);
                  if (v36)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v39 = 72;
                      *(_WORD *)&v39[4] = 2080;
                      *(void *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Graph/People Inferences/Relationship/Relationship Analyz"
                                           "ers/PGRelationshipWorkAnalyzer.m";
                      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    v13 = v29;
                    v8 = v30;
                    goto LABEL_47;
                  }
                  double v5 = Current;
                }
              }
              double v22 = v20 + v22;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      v13 = v29;
      v8 = v30;
      if (!v4) {
        goto LABEL_47;
      }
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01) {
        goto LABEL_47;
      }
      char v36 = 0;
      v4[2](v4, &v36, 1.0);
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v39 = 76;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWorkAnalyzer.m";
      v28 = MEMORY[0x1E4F14500];
    }
    else
    {
      v8 = v30;
      if (!v4) {
        goto LABEL_47;
      }
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01) {
        goto LABEL_47;
      }
      char v36 = 0;
      v4[2](v4, &v36, 1.0);
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v39 = 52;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWorkAnalyzer.m";
      v28 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  char v36 = 0;
  v4[2](v4, &v36, 0.0);
  if (!v36)
  {
    double v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v39 = 34;
    *(_WORD *)&v39[4] = 2080;
    *(void *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWorkAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_49:
}

- (PGRelationshipWorkAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipWorkAnalyzer;
  double v5 = [(PGRelationshipWorkAnalyzer *)&v8 init];
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