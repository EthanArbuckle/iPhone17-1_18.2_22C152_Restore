@interface PGRelationshipMomentFrequencyAnalyzer
- (NSString)name;
- (PGRelationshipMomentFrequencyAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipMomentFrequencyAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (!v4 || (double v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = [WeakRetained momentNodes];
    v10 = [WeakRetained personNodes];
    v11 = +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:v9 amongPersonNodes:v10];

    if (![v11 count])
    {
      if (v4)
      {
        if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
        {
          char v67 = 0;
          v4[2](v4, &v67, 1.0);
          if (v67)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v74 = 47;
              __int16 v75 = 2080;
              v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_67;
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v53 = v11;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v64 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "countForObject:", *(void *)(*((void *)&v63 + 1) + 8 * i)));
          [v8 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v14);
    }

    if (v4)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v5 >= 0.01)
      {
        char v67 = 0;
        v4[2](v4, &v67, 0.25);
        if (v67)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v74 = 56;
            __int16 v75 = 2080;
            v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = v53;
          goto LABEL_67;
        }
        double v5 = Current;
      }
    }
    v19 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v8];
    v20 = (void *)MEMORY[0x1E4F28C68];
    v71 = v19;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    v22 = [v20 expressionForFunction:@"average:" arguments:v21];
    [v22 expressionValueWithObject:0 context:0];
    v23 = v54 = v4;
    [v23 doubleValue];
    double v25 = v24;

    v26 = (void *)MEMORY[0x1E4F28C68];
    v70 = v19;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    v28 = [v26 expressionForFunction:@"stddev:" arguments:v27];
    v29 = [v28 expressionValueWithObject:0 context:0];
    [v29 doubleValue];
    double v31 = v30;

    v4 = v54;
    if (v54)
    {
      double v32 = CFAbsoluteTimeGetCurrent();
      if (v32 - v5 >= 0.01)
      {
        char v67 = 0;
        v54[2](v54, &v67, 0.5);
        if (v67)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v74 = 62;
            __int16 v75 = 2080;
            v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = v53;
          goto LABEL_66;
        }
        double v5 = v32;
      }
    }
    v52 = v19;
    v33 = [MEMORY[0x1E4F1CA80] set];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v34 = v12;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v60 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          v40 = [v39 localIdentifier];
          unint64_t v41 = [v34 countForObject:v39];
          [MEMORY[0x1E4F76C60] cumulativeNormalDistributionForX:(double)v41 mu:v25 sigma:v31];
          if (v42 >= 0.6) {
            [v33 addObject:v40];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v59 objects:v69 count:16];
      }
      while (v36);
    }

    v4 = v54;
    if (v54)
    {
      double v43 = CFAbsoluteTimeGetCurrent();
      v19 = v52;
      if (v43 - v5 >= 0.01)
      {
        char v67 = 0;
        v54[2](v54, &v67, 0.75);
        if (v67)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v74 = 77;
            __int16 v75 = 2080;
            v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = v53;
LABEL_65:

LABEL_66:
LABEL_67:

          goto LABEL_68;
        }
        double v5 = v43;
      }
    }
    else
    {
      v19 = v52;
    }
    uint64_t v44 = [v33 count];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v45 = v33;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v56;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v56 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = [WeakRetained relationshipAnalyzerPropertiesForPersonLocalIdentifier:*(void *)(*((void *)&v55 + 1) + 8 * k)];
          v51 = v50;
          if (v50) {
            [v50 registerTopPersonAmongTopPeople:v44];
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v55 objects:v68 count:16];
      }
      while (v47);
    }

    v11 = v53;
    v4 = v54;
    if (v54)
    {
      if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
      {
        char v67 = 0;
        v54[2](v54, &v67, 1.0);
        if (v67)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v74 = 89;
            __int16 v75 = 2080;
            v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_65;
  }
  char v67 = 0;
  v4[2](v4, &v67, 0.0);
  if (!v67)
  {
    double v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v74 = 38;
    __int16 v75 = 2080;
    v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_68:
}

- (PGRelationshipMomentFrequencyAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipMomentFrequencyAnalyzer;
  double v5 = [(PGRelationshipMomentFrequencyAnalyzer *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipMomentFrequencyAnalyzer";
}

@end