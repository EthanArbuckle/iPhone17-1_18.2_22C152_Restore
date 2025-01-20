@interface PGRelationshipSocialGroupAnalyzer
- (NSString)name;
- (PGRelationshipSocialGroupAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipSocialGroupAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (!v4 || (double v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v8 = [WeakRetained graph];
    v9 = [WeakRetained personNodes];
    v10 = +[PGPeopleInferencesConveniences topPersonNodeIdentifierForTwoPersonSocialGroupsFromPersonNodes:v8 personNodes:v9];

    if ([v10 length])
    {
      if (v4)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v5 >= 0.01)
        {
          char v15 = 0;
          v4[2](v4, &v15, 0.5);
          if (v15)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
LABEL_28:

              goto LABEL_29;
            }
            *(_DWORD *)buf = 67109378;
            int v17 = 45;
            __int16 v18 = 2080;
            v19 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipSocialGroupAnalyzer.m";
            v12 = MEMORY[0x1E4F14500];
LABEL_18:
            _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_28;
          }
          double v5 = Current;
        }
      }
      v13 = [WeakRetained relationshipAnalyzerPropertiesForPersonLocalIdentifier:v10];
      v14 = v13;
      if (v13) {
        [v13 registerTopTwoPersonSocialGroup];
      }
      if (v4)
      {
        if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
        {
          char v15 = 0;
          v4[2](v4, &v15, 1.0);
          if (v15)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v17 = 53;
              __int16 v18 = 2080;
              v19 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipSocialGroupAnalyzer.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_28;
    }
    if (!v4) {
      goto LABEL_28;
    }
    if (CFAbsoluteTimeGetCurrent() - v5 < 0.01) {
      goto LABEL_28;
    }
    char v15 = 0;
    v4[2](v4, &v15, 1.0);
    if (!v15 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 67109378;
    int v17 = 42;
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipSocialGroupAnalyzer.m";
    v12 = MEMORY[0x1E4F14500];
    goto LABEL_18;
  }
  char v15 = 0;
  v4[2](v4, &v15, 0.0);
  if (!v15)
  {
    double v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v17 = 34;
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipSocialGroupAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_29:
}

- (PGRelationshipSocialGroupAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipSocialGroupAnalyzer;
  double v5 = [(PGRelationshipSocialGroupAnalyzer *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipSocialGroupAnalyzer";
}

@end