@interface PGGraphPhotosHighlightEnrichmentProcessor
+ (BOOL)_hasEnoughHighlightsInPhotoLibrary:(id)a3 atEnrichmentState:(unsigned __int16)a4 aboveThreshold:(double)a5;
+ (BOOL)hasCompletedEnrichmentForLibrary:(id)a3;
+ (BOOL)hasCompletedFirstTimeExperienceForLibrary:(id)a3;
- (BOOL)curatedLibraryFTEIsReady;
- (PGGraphPhotosHighlightEnrichmentProcessor)init;
- (PGGraphPhotosHighlightEnrichmentProcessor)initWithHighlightTailorOptions:(unint64_t)a3;
- (id)_dayGroupHighlightsToEnrichForDayHighlights:(id)a3 dayGroupHighlights:(id)a4;
- (unint64_t)highlightTailorOptions;
- (void)_logFirstTimeExperienceMetricsIfNeededWithManager:(id)a3;
- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6;
- (void)setHighlightTailorOptions:(unint64_t)a3;
@end

@implementation PGGraphPhotosHighlightEnrichmentProcessor

- (BOOL)curatedLibraryFTEIsReady
{
  return self->_curatedLibraryFTEIsReady;
}

- (void)setHighlightTailorOptions:(unint64_t)a3
{
  self->_highlightTailorOptions = a3;
}

- (unint64_t)highlightTailorOptions
{
  return self->_highlightTailorOptions;
}

- (void)_logFirstTimeExperienceMetricsIfNeededWithManager:(id)a3
{
  id v4 = a3;
  v5 = [v4 photoLibrary];
  v6 = objc_msgSend(v5, "pg_urlForGraphApplicationData");
  v7 = [v6 path];

  v8 = [v7 stringByAppendingPathComponent:@"ftemetrics"];
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    self->_curatedLibraryFTEIsReady = 1;
  }
  else if ([(id)objc_opt_class() hasCompletedFirstTimeExperienceForLibrary:v5])
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __95__PGGraphPhotosHighlightEnrichmentProcessor__logFirstTimeExperienceMetricsIfNeededWithManager___block_invoke;
    v16 = &unk_1E68F0AF0;
    id v17 = v5;
    id v18 = v4;
    [v18 performSynchronousConcurrentGraphReadUsingBlock:&v13];
    v11 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v13, v14, v15, v16);
    v12 = [MEMORY[0x1E4F1C9B8] data];
    [v11 createFileAtPath:v8 contents:v12 attributes:0];

    self->_curatedLibraryFTEIsReady = 1;
  }
}

void __95__PGGraphPhotosHighlightEnrichmentProcessor__logFirstTimeExperienceMetricsIfNeededWithManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PGCuratedLibraryFTEMetricEvent alloc];
  v5 = [v3 graph];

  uint64_t v6 = [v5 librarySizeRange];
  v7 = [*(id *)(a1 + 32) migrationDate];
  v11 = [(PGCuratedLibraryFTEMetricEvent *)v4 initWithLibrarySizeRange:v6 migrationDate:v7];

  [(PGAbstractMetricEvent *)v11 gatherMetricsWithProgressBlock:0];
  v8 = [*(id *)(a1 + 40) analytics];
  v9 = [(PGCuratedLibraryFTEMetricEvent *)v11 identifier];
  int v10 = [(PGCuratedLibraryFTEMetricEvent *)v11 payload];
  [v8 sendEvent:v9 withPayload:v10];
}

- (id)_dayGroupHighlightsToEnrichForDayHighlights:(id)a3 dayGroupHighlights:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v7 = [v5 firstObject];
    v8 = [(id)objc_opt_class() fetchParentDayGroupHighlightsForDayHighlights:v5];
    if ([v8 count])
    {
      v9 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
      [v9 addObjectsFromArray:v6];
      id v10 = [v9 allObjects];

      goto LABEL_6;
    }
  }
  id v10 = v6;
LABEL_6:

  return v10;
}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  *(void *)((char *)&v74[2] + 4) = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v44 = a4;
  id v10 = a5;
  id v45 = a6;
  v11 = _Block_copy(v45);
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  uint64_t v65 = 0;
  v66 = (double *)&v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  if (!v11
    || (double v12 = CFAbsoluteTimeGetCurrent(), v12 - v66[3] < 0.01)
    || (v66[3] = v12,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v11 + 2))(v11, &info, 0.0),
        char v13 = *((unsigned char *)v70 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v70 + 24) = v13) == 0))
  {
    uint64_t v14 = [v47 enrichmentLoggingConnection];
    os_signpost_id_t v15 = os_signpost_id_generate(v14);
    v16 = v14;
    id v17 = v16;
    unint64_t v42 = v15 - 1;
    os_signpost_id_t spid = v15;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PGGraphPhotosHighlightEnrichmentProcessor", "", (uint8_t *)&buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v41 = mach_absolute_time();
    id v18 = [PGHighlightTailor alloc];
    v19 = [v47 workingContextForEnrichment];
    v46 = [(PGHighlightTailor *)v18 initWithWorkingContext:v19];

    uint64_t v20 = [v10 updateType];
    int v21 = [v10 isResumingFullAnalysis];
    if (v20 == 4) {
      int v22 = 1;
    }
    else {
      int v22 = v21;
    }
    if (v22 == 1)
    {
      unint64_t highlightTailorOptions = self->_highlightTailorOptions;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke;
      v59[3] = &unk_1E68F03F8;
      id v60 = v11;
      v61 = &v65;
      v62 = &v69;
      uint64_t v63 = 0x3F847AE147AE147BLL;
      [(PGHighlightTailor *)v46 enrichAllHighlightsWithOptions:highlightTailorOptions progressBlock:v59];
      if (*((unsigned char *)v70 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int buf = 67109378;
          LODWORD(v74[0]) = 68;
          WORD2(v74[0]) = 2080;
          *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEnrichmentProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }

        goto LABEL_42;
      }
      [(PGGraphPhotosHighlightEnrichmentProcessor *)self _logFirstTimeExperienceMetricsIfNeededWithManager:v47];
      id v26 = v60;
LABEL_32:

      uint64_t v34 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v37 = v17;
      v38 = v37;
      if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v38, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphPhotosHighlightEnrichmentProcessor", "", (uint8_t *)&buf, 2u);
      }

      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        int buf = 136315394;
        v74[0] = "PGGraphPhotosHighlightEnrichmentProcessor";
        LOWORD(v74[1]) = 2048;
        *(double *)((char *)&v74[1] + 2) = (float)((float)((float)((float)(v34 - v41) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
      }
      if (v11)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v66[3] >= 0.01)
        {
          v66[3] = Current;
          char v48 = 0;
          (*((void (**)(void *, char *, double))v11 + 2))(v11, &v48, 1.0);
          char v40 = *((unsigned char *)v70 + 24) | v48;
          *((unsigned char *)v70 + 24) = v40;
          if (v40)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              int buf = 67109378;
              LODWORD(v74[0]) = 106;
              WORD2(v74[0]) = 2080;
              *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEn"
                                             "richmentProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_42;
    }
    if (v20 == 2) {
      uint64_t v24 = 127;
    }
    else {
      uint64_t v24 = 4;
    }
    v25 = [v10 highlightsToProcessForKind:0 withHighlightUpdateTypes:v24 includeHighlightsToIngest:v20 == 2];
    id v26 = [v25 allObjects];

    v27 = [v10 highlightsToProcessForKind:3 withHighlightUpdateTypes:v24 includeHighlightsToIngest:v20 == 2];
    v28 = [v27 allObjects];

    v29 = [(PGGraphPhotosHighlightEnrichmentProcessor *)self _dayGroupHighlightsToEnrichForDayHighlights:v26 dayGroupHighlights:v28];

    unint64_t v30 = self->_highlightTailorOptions;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_249;
    v54[3] = &unk_1E68F03F8;
    id v31 = v11;
    id v55 = v31;
    v56 = &v65;
    v57 = &v69;
    uint64_t v58 = 0x3F847AE147AE147BLL;
    [(PGHighlightTailor *)v46 enrichDayHighlights:v26 dayGroupHighlights:v29 withOptions:v30 progressBlock:v54];
    if (*((unsigned char *)v70 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        LODWORD(v74[0]) = 88;
        WORD2(v74[0]) = 2080;
        *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEnrichmentProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
LABEL_29:

LABEL_42:
      goto LABEL_43;
    }
    if ((~LODWORD(self->_highlightTailorOptions) & 0x26) != 0)
    {
      v32 = [v10 highlightsToProcessForKind:0 withHighlightUpdateTypes:123 includeHighlightsToIngest:1];
      v33 = [v32 allObjects];

      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_250;
      v49[3] = &unk_1E68F03F8;
      id v50 = v31;
      v51 = &v65;
      v52 = &v69;
      uint64_t v53 = 0x3F847AE147AE147BLL;
      [(PGHighlightTailor *)v46 enrichHighlights:v33 options:-1073741786 progressBlock:v49];
      if (*((unsigned char *)v70 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int buf = 67109378;
          LODWORD(v74[0]) = 101;
          WORD2(v74[0]) = 2080;
          *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEnrichmentProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }

        goto LABEL_29;
      }
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int buf = 67109378;
    LODWORD(v74[0]) = 56;
    WORD2(v74[0]) = 2080;
    *(void *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_43:
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
}

void __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_249(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.9);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_250(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.9);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (PGGraphPhotosHighlightEnrichmentProcessor)initWithHighlightTailorOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPhotosHighlightEnrichmentProcessor;
  result = [(PGGraphPhotosHighlightEnrichmentProcessor *)&v5 init];
  if (result)
  {
    result->_unint64_t highlightTailorOptions = a3;
    result->_curatedLibraryFTEIsReady = 0;
  }
  return result;
}

- (PGGraphPhotosHighlightEnrichmentProcessor)init
{
  return [(PGGraphPhotosHighlightEnrichmentProcessor *)self initWithHighlightTailorOptions:255];
}

+ (BOOL)_hasEnoughHighlightsInPhotoLibrary:(id)a3 atEnrichmentState:(unsigned __int16)a4 aboveThreshold:(double)a5
{
  unsigned int v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 librarySpecificFetchOptions];
  [v8 setShouldPrefetchCount:1];
  v9 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v8];
  uint64_t v10 = [v9 count];
  if (v10)
  {
    unint64_t v11 = v10;
    double v12 = [v7 librarySpecificFetchOptions];
    char v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", @"enrichmentState", v6);
    [v12 setInternalPredicate:v13];

    [v12 setShouldPrefetchCount:1];
    uint64_t v14 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v12];
    unint64_t v15 = [v14 count];
    double v16 = (double)v15 / (double)v11;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v17 = PHShortDescriptionForPhotosHighlightEnrichmentState();
      *(_DWORD *)int buf = 134218754;
      double v21 = v16 * 100.0;
      __int16 v22 = 2048;
      unint64_t v23 = v15;
      __int16 v24 = 2048;
      unint64_t v25 = v11;
      __int16 v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Enriched %.2f%% highlights (%tu/%tu in total) at state %@", buf, 0x2Au);
    }
    BOOL v18 = v16 >= a5;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)hasCompletedEnrichmentForLibrary:(id)a3
{
  return [a1 _hasEnoughHighlightsInPhotoLibrary:a3 atEnrichmentState:4 aboveThreshold:0.95];
}

+ (BOOL)hasCompletedFirstTimeExperienceForLibrary:(id)a3
{
  return [a1 _hasEnoughHighlightsInPhotoLibrary:a3 atEnrichmentState:3 aboveThreshold:0.9];
}

@end