@interface PGRelationshipHolidayAnalyzer
- (NSString)name;
- (PGRelationshipHolidayAnalyzer)initWithRelationshipProcessor:(id)a3;
- (id)_familyHolidayMomentsFromMomentNodes:(id)a3 inGraph:(id)a4;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipHolidayAnalyzer

- (void).cxx_destruct
{
}

- (id)_familyHolidayMomentsFromMomentNodes:(id)a3 inGraph:(id)a4
{
  id v5 = a3;
  v6 = +[PGGraphHolidayNodeCollection holidayNodesWithCategory:2 inGraph:a4];
  v7 = [v6 celebratingMomentNodes];
  v8 = [v7 collectionByIntersecting:v5];

  return v8;
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (!v4 || (double v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v8 = [WeakRetained momentNodes];
    v9 = [WeakRetained graph];
    v10 = [(PGRelationshipHolidayAnalyzer *)self _familyHolidayMomentsFromMomentNodes:v8 inGraph:v9];

    uint64_t v11 = [v10 count];
    if (v11)
    {
      uint64_t v12 = v11;
      v13 = [WeakRetained personNodes];
      v14 = +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:v10 amongPersonNodes:v13];

      if (v4)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v5 >= 0.01)
        {
          char v30 = 0;
          v4[2](v4, &v30, 0.5);
          if (v30)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v33 = 46;
              __int16 v34 = 2080;
              v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipHolidayAnalyzer.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

LABEL_30:
            goto LABEL_31;
          }
          double v5 = Current;
        }
      }
      v25 = v10;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v22 = [v16 countForObject:v21];
            v23 = [v21 localIdentifier];
            v24 = [WeakRetained relationshipAnalyzerPropertiesForPersonLocalIdentifier:v23];

            if (v24) {
              [v24 registerAttendance:v22 amongFamilyHolidays:v12];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v18);
      }

      v10 = v25;
    }
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
      {
        char v30 = 0;
        v4[2](v4, &v30, 1.0);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v33 = 58;
            __int16 v34 = 2080;
            v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipHolidayAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_30;
  }
  char v30 = 0;
  v4[2](v4, &v30, 0.0);
  if (!v30)
  {
    double v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v33 = 34;
    __int16 v34 = 2080;
    v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipHolidayAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_31:
}

- (PGRelationshipHolidayAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipHolidayAnalyzer;
  double v5 = [(PGRelationshipHolidayAnalyzer *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipHolidayAnalyzer";
}

@end