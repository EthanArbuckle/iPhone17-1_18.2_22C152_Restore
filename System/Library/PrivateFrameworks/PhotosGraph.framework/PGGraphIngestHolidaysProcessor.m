@interface PGGraphIngestHolidaysProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldCreateHolidayEdgeForEventRule:(id)a3 momentNode:(id)a4 momentLocalDate:(id)a5 withGraph:(id)a6 loggingConnection:(id)a7 localeCountryCode:(id)a8 keyboardLanguageCodes:(id)a9;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestHolidaysProcessor)initWithGraphBuilder:(id)a3;
- (void)deleteHolidayEdgesWithMomentNodes:(id)a3 inGraph:(id)a4;
- (void)insertHolidaysBetweenLocalDate:(id)a3 andLocalDate:(id)a4 graph:(id)a5 locale:(id)a6 loggingConnection:(id)a7 progressBlock:(id)a8;
- (void)insertHolidaysWithMomentNodes:(id)a3 graph:(id)a4 locale:(id)a5 loggingConnection:(id)a6 progressBlock:(id)a7;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestHolidaysProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

- (BOOL)shouldCreateHolidayEdgeForEventRule:(id)a3 momentNode:(id)a4 momentLocalDate:(id)a5 withGraph:(id)a6 loggingConnection:(id)a7 localeCountryCode:(id)a8 keyboardLanguageCodes:(id)a9
{
  return -[PGGraphIngestHolidayProcessorHelper isCelebratingForEventRule:momentNode:momentLocalDate:withGraph:loggingConnection:localeCountryCode:keyboardLanguageCodes:](self->_helper, "isCelebratingForEventRule:momentNode:momentLocalDate:withGraph:loggingConnection:localeCountryCode:keyboardLanguageCodes:", a3, a4, a5, a6, a7, a8);
}

- (void)insertHolidaysBetweenLocalDate:(id)a3 andLocalDate:(id)a4 graph:(id)a5 locale:(id)a6 loggingConnection:(id)a7 progressBlock:(id)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v32 = a4;
  id v14 = a5;
  id v15 = a6;
  id v33 = a7;
  id v16 = a8;
  v17 = _Block_copy(v16);
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  v45 = (double *)&v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  if (!v17
    || (double v18 = CFAbsoluteTimeGetCurrent(), v18 - v45[3] < 0.01)
    || (v45[3] = v18,
        char v43 = 0,
        (*((void (**)(void *, char *, double))v17 + 2))(v17, &v43, 0.0),
        char v19 = *((unsigned char *)v49 + 24) | v43,
        (*((unsigned char *)v49 + 24) = v19) == 0))
  {
    v20 = [v14 infoNode];
    v21 = v20;
    if (!v15)
    {
      id v15 = [v20 locale];
    }
    v22 = [v15 countryCode];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F76CB8]) initWithLocale:v15];
    v24 = +[PGGraphIngestHolidayProcessorHelper keyboardLanguageCodesForInfoNode:v21 holidayService:v23];
    [(PGGraphIngestHolidayProcessorHelper *)self->_helper prepareIfNeededWithGraph:v14];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __123__PGGraphIngestHolidaysProcessor_insertHolidaysBetweenLocalDate_andLocalDate_graph_locale_loggingConnection_progressBlock___block_invoke;
    v34[3] = &unk_1E68EACA8;
    id v25 = v17;
    uint64_t v42 = 0x3F847AE147AE147BLL;
    v40 = &v44;
    v41 = &v48;
    id v39 = v25;
    v34[4] = self;
    id v26 = v22;
    id v35 = v26;
    id v27 = v24;
    id v36 = v27;
    id v37 = v14;
    id v38 = v33;
    [v23 enumerateEventRulesForAllCountriesBetweenLocalDate:v31 andLocalDate:v32 usingBlock:v34];
    if (*((unsigned char *)v49 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109378;
      int v53 = 160;
      __int16 v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestHolidaysProcessor.m";
      v28 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!v17) {
        goto LABEL_17;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v45[3] < 0.01) {
        goto LABEL_17;
      }
      v45[3] = Current;
      char v43 = 0;
      (*((void (**)(id, char *, double))v25 + 2))(v25, &v43, 1.0);
      char v30 = *((unsigned char *)v49 + 24) | v43;
      *((unsigned char *)v49 + 24) = v30;
      if (!v30 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 67109378;
      int v53 = 161;
      __int16 v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestHolidaysProcessor.m";
      v28 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v53 = 107;
    __int16 v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Ingest"
          "/Ingest Processing/PGGraphIngestHolidaysProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_18:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
}

void __123__PGGraphIngestHolidaysProcessor_insertHolidaysBetweenLocalDate_andLocalDate_graph_locale_loggingConnection_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v9 = (void *)MEMORY[0x1D25FED50]();
  if (*(void *)(a1 + 72)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8),
        Current - *(double *)(v11 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v11 + 24) = Current,
        buf[0] = 0,
        (*(void (**)(double))(*(void *)(a1 + 72) + 16))(0.5),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    v12 = [*(id *)(*(void *)(a1 + 32) + 16) momentsCelebratingRule:v7 localDates:v8 userCountryCode:*(void *)(a1 + 40) keyboardLanguageCodes:*(void *)(a1 + 48) graph:*(void *)(a1 + 56) loggingConnection:*(void *)(a1 + 64)];
    v13 = v12;
    if (v12)
    {
      id v14 = [v12 holidayDateNodes];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        v55[0] = @"name";
        id v16 = [v7 name];
        v55[1] = @"holc";
        v56[0] = v16;
        v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "category"));
        v56[1] = v17;
        double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];

        char v19 = [*(id *)(a1 + 56) addUniqueNodeWithLabel:@"Holiday" domain:401 properties:v18 didCreate:0];
        if (v19)
        {
          id v39 = v18;
          id v41 = v8;
          id v42 = v7;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          v20 = [v13 holidayDateNodes];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v47 objects:v52 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v48 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v25 = (id)[*(id *)(a1 + 56) addUniqueEdgeWithLabel:@"HOLIDAY" sourceNode:*(void *)(*((void *)&v47 + 1) + 8 * i) targetNode:v19 domain:401 properties:0];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v47 objects:v52 count:16];
            }
            while (v22);
          }
          v40 = v9;

          id v26 = [v13 positivelyClassifiedMomentNodes];
          id v27 = (void *)[v26 mutableCopy];

          v28 = [v13 positivelyClassifiedMomentNodes];
          unint64_t v29 = [v28 count];

          if (v29 >= 3)
          {
            char v30 = [v13 negativelyClassifiedMomentNodes];
            [v27 addObjectsFromArray:v30];
          }
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v31 = v27;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v44 != v34) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v36 = *(void *)(*((void *)&v43 + 1) + 8 * j);
                id v37 = (id)[*(id *)(a1 + 56) addUniqueEdgeWithLabel:@"CELEBRATING" sourceNode:v36 targetNode:v19 domain:401 properties:0];
                [*(id *)(*(void *)(a1 + 32) + 8) addMeaningToMeaningfulEventNode:v36 meaningLabel:@"HolidayEvent" meaningIsReliable:1];
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
            }
            while (v33);
          }

          id v8 = v41;
          id v7 = v42;
          double v18 = v39;
          v9 = v40;
        }
        else
        {
          id v38 = *(NSObject **)(a1 + 64);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v54 = v18;
            _os_log_error_impl(&dword_1D1805000, v38, OS_LOG_TYPE_ERROR, "Could not create holiday with properties %@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (void)insertHolidaysWithMomentNodes:(id)a3 graph:(id)a4 locale:(id)a5 loggingConnection:(id)a6 progressBlock:(id)a7
{
  id v33 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = +[PGGraphMomentNode firstAndLastMomentNodesInMomentNodes:a3];
  id v16 = [v15 firstObject];
  uint64_t v17 = [v15 lastObject];
  double v18 = (void *)v17;
  if (v16) {
    BOOL v19 = v17 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19)
  {
    v20 = [v33 localDatesForMomentNode:v16];
    id v31 = [v20 allObjects];

    uint64_t v21 = [v33 localDatesForMomentNode:v18];
    uint64_t v22 = [v21 allObjects];

    [v31 sortedArrayUsingSelector:sel_compare_];
    id v32 = v14;
    id v23 = v13;
    v24 = self;
    v26 = id v25 = v12;
    id v27 = [v26 firstObject];

    v28 = [v22 sortedArrayUsingSelector:sel_compare_];
    unint64_t v29 = [v28 lastObject];

    id v12 = v25;
    char v30 = v24;
    id v13 = v23;
    id v14 = v32;
    [(PGGraphIngestHolidaysProcessor *)v30 insertHolidaysBetweenLocalDate:v27 andLocalDate:v29 graph:v33 locale:v25 loggingConnection:v13 progressBlock:v32];
  }
}

- (void)deleteHolidayEdgesWithMomentNodes:(id)a3 inGraph:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init(v5);
  id v8 = [v7 celebratedHolidayNodes];
  v9 = +[PGGraphEdgeCollection edgesFromNodes:v7 toNodes:v8];

  [v10 removeEdges:v9];
  [v6 executeGraphChangeRequest:v10];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  graphBuilder = self->_graphBuilder;
  id v8 = a3;
  v9 = [(PGGraphBuilder *)graphBuilder graph];
  id v10 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  id v12 = v10;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGGraphIngestHolidaysProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v14 = mach_absolute_time();
  uint64_t v15 = objc_msgSend(v8, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v9, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);

  if ([v15 count])
  {
    [(PGGraphIngestHolidaysProcessor *)self deleteHolidayEdgesWithMomentNodes:v15 inGraph:v9];
    id v16 = [v15 set];
    [(PGGraphIngestHolidaysProcessor *)self insertHolidaysWithMomentNodes:v16 graph:v9 locale:0 loggingConnection:v13 progressBlock:v6];
  }
  uint64_t v17 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v20 = v13;
  uint64_t v21 = v20;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v21, OS_SIGNPOST_INTERVAL_END, v11, "PGGraphIngestHolidaysProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "PGGraphIngestHolidaysProcessor";
    __int16 v25 = 2048;
    double v26 = (float)((float)((float)((float)(v17 - v14) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 isResumingFullAnalysis] & 1) != 0 || (objc_msgSend(v3, "hasMomentsToInsert"))
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [v3 momentUpdateTypes];
    BOOL v4 = ([(id)objc_opt_class() requiredMomentUpdateTypes] & v5) != 0;
  }

  return v4;
}

- (PGGraphIngestHolidaysProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphIngestHolidaysProcessor;
  id v6 = [(PGGraphIngestHolidaysProcessor *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    id v8 = objc_alloc_init(PGGraphIngestHolidayProcessorHelper);
    helper = v7->_helper;
    v7->_helper = v8;
  }
  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 15;
}

@end