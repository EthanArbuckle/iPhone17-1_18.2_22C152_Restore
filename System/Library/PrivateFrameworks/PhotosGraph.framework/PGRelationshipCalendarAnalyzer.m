@interface PGRelationshipCalendarAnalyzer
- (NSString)name;
- (PGRelationshipCalendarAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipCalendarAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void (**)(void *, unsigned char *, double))_Block_copy(v4);
  double v6 = 0.0;
  if (!v5 || (double v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v9 = [WeakRetained serviceManager];
    v10 = [MEMORY[0x1E4F1C9C8] date];
    v11 = [MEMORY[0x1E4F76C68] dateByAddingMonths:-2 toDate:v10];
    v12 = [MEMORY[0x1E4F28BD0] set];
    v45 = WeakRetained;
    v13 = [WeakRetained contactIdentifiers];
    v48 = v9;
    v14 = [v9 workCalendarEventsMatchingContactIdentifiers:v13 fromUniversalDate:v11 toUniversalDate:v10];

    uint64_t v46 = [v14 count];
    if (v5)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v6 >= 0.01)
      {
        char v61 = 0;
        v5[2](v5, &v61, 0.7);
        if (v61)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v66 = 50;
            __int16 v67 = 2080;
            v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipCalendarAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = v45;
LABEL_46:

          goto LABEL_47;
        }
        double v6 = Current;
      }
    }
    v41 = v11;
    v42 = v10;
    v43 = v5;
    id v44 = v4;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v40 = v14;
    obuint64_t j = v14;
    uint64_t v17 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v58 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x1D25FED50]();
          v23 = [v21 attendees];
          v24 = [v48 personsFromEventParticipants:v23 excludeCurrentUser:1];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v54;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v54 != v27) {
                  objc_enumerationMutation(v24);
                }
                [v12 addObject:*(void *)(*((void *)&v53 + 1) + 8 * j)];
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v53 objects:v63 count:16];
            }
            while (v26);
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
      }
      while (v18);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v29 = v12;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v62 count:16];
    v16 = v45;
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v49 + 1) + 8 * k);
          uint64_t v35 = [v29 countForObject:v34];
          v36 = [v34 CNIdentifier];
          if (v36)
          {
            v37 = [v45 personLocalIdentifierForContactIdentifier:v36];
            if ([v37 length])
            {
              v38 = [v45 relationshipAnalyzerPropertiesForPersonLocalIdentifier:v37];
              v39 = v38;
              if (v38) {
                [v38 registerAttendance:v35 amongWorkCalendarEvents:v46];
              }
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v49 objects:v62 count:16];
      }
      while (v31);
    }

    v5 = v43;
    id v4 = v44;
    v11 = v41;
    v10 = v42;
    v14 = v40;
    if (v43)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v61 = 0;
        v43[2](v43, &v61, 1.0);
        if (v61)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v66 = 79;
            __int16 v67 = 2080;
            v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipCalendarAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_46;
  }
  char v61 = 0;
  v5[2](v5, &v61, 0.0);
  if (!v61)
  {
    double v6 = v7;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v66 = 39;
    __int16 v67 = 2080;
    v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipCalendarAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_47:
}

- (PGRelationshipCalendarAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipCalendarAnalyzer;
  v5 = [(PGRelationshipCalendarAnalyzer *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipCalendarAnalyzer";
}

@end