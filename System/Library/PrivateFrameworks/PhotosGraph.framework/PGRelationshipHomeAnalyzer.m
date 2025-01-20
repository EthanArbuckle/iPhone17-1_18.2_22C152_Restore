@interface PGRelationshipHomeAnalyzer
- (NSString)name;
- (PGRelationshipHomeAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipHomeAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v28 = 0;
      v4[2](v4, &v28, 0.0);
      if (v28)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v31 = 34;
          __int16 v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "People Inferences/Relationship/Relationship Analyzers/PGRelationshipHomeAnalyzer.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_24;
      }
      double v5 = Current;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  v8 = [WeakRetained momentNodes];
  v9 = +[PGPeopleInferencesConveniences momentNodesAtHomeInMomentNodes:v8];

  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = [WeakRetained personNodes];
    v23 = v9;
    v13 = +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:v9 amongPersonNodes:v12];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v20 = [v14 countForObject:v19];
          v21 = [v19 localIdentifier];
          v22 = [WeakRetained relationshipAnalyzerPropertiesForPersonLocalIdentifier:v21];

          if (v22) {
            [v22 registerNumberOfMomentsAtHome:v20 amongMomentsAtHome:v11];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
      {
        char v28 = 0;
        v4[2](v4, &v28, 1.0);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v31 = 56;
            __int16 v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipHomeAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    v9 = v23;
  }

LABEL_24:
}

- (PGRelationshipHomeAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipHomeAnalyzer;
  double v5 = [(PGRelationshipHomeAnalyzer *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipHomeAnalyzer";
}

@end