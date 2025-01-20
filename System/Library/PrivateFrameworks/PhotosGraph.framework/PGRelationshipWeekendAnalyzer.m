@interface PGRelationshipWeekendAnalyzer
- (NSString)name;
- (PGRelationshipWeekendAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipWeekendAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (!v4 || (double v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v8 = [WeakRetained graph];
    v9 = [v8 anyNodeForLabel:@"Weekend" domain:400 properties:0];

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
              int v39 = 41;
              __int16 v40 = 2080;
              v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_42;
    }
    uint64_t v10 = [v9 edgesCount];
    v11 = [v9 collection];
    v12 = [v11 momentNodes];

    v13 = [WeakRetained personNodes];
    v14 = +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:v12 amongPersonNodes:v13];

    uint64_t v15 = [v14 count];
    if (v15)
    {
      unint64_t v16 = v15;
      v30 = v12;
      v31 = v9;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v29 = v14;
      id v17 = v14;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        double v20 = 1.0 / (double)v16;
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
            v25 = objc_msgSend(v24, "localIdentifier", v29, v30, v31);
            v26 = [WeakRetained relationshipAnalyzerPropertiesForPersonLocalIdentifier:v25];
            if (v26) {
              objc_msgSend(v26, "registerNumberOfWeekendMoments:amongWeekends:", objc_msgSend(v17, "countForObject:", v24), v10);
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
                    int v39 = 68;
                    __int16 v40 = 2080;
                    v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  v12 = v30;
                  v9 = v31;
                  v14 = v29;
                  goto LABEL_41;
                }
                double v5 = Current;
              }
            }
            double v22 = v20 + v22;
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      v12 = v30;
      v9 = v31;
      v14 = v29;
      if (!v4) {
        goto LABEL_41;
      }
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01) {
        goto LABEL_41;
      }
      char v36 = 0;
      v4[2](v4, &v36, 1.0);
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 67109378;
      int v39 = 72;
      __int16 v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
      v28 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!v4) {
        goto LABEL_41;
      }
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01) {
        goto LABEL_41;
      }
      char v36 = 0;
      v4[2](v4, &v36, 1.0);
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 67109378;
      int v39 = 53;
      __int16 v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
      v28 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
LABEL_41:

LABEL_42:
    goto LABEL_43;
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
    int v39 = 35;
    __int16 v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_43:
}

- (PGRelationshipWeekendAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipWeekendAnalyzer;
  double v5 = [(PGRelationshipWeekendAnalyzer *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipDayOfWeekAnalyzer";
}

@end