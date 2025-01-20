@interface PGHighlightTailor
+ (BOOL)itemScoreIsAutoplayable:(double)a3;
- (BOOL)enrichAllHighlightsWithOptions:(unint64_t)a3 progressBlock:(id)a4;
- (BOOL)enrichDayHighlights:(id)a3 dayGroupHighlights:(id)a4 withOptions:(unint64_t)a5 progressBlock:(id)a6;
- (BOOL)enrichHighlights:(id)a3 options:(unint64_t)a4 progressBlock:(id)a5;
- (BOOL)shouldEnrichHighlight:(id)a3 withEnrichmentProfile:(id)a4 options:(unint64_t)a5;
- (PGHighlightTailor)initWithWorkingContext:(id)a3;
- (double)highlightVisibilityWeightForItem:(id)a3;
- (id)allHighlightModelsNeedingEnrichmentForHighlightSubtype:(int64_t)a3 options:(unint64_t)a4;
- (id)assetSortDescriptors;
- (id)bestEnrichmentProfileForHighlight:(id)a3 options:(unint64_t)a4;
- (id)computeChangedVisibilityScoresForItems:(id)a3;
- (id)enrichmentValuesForHighlight:(id)a3 usingEnrichmentProfile:(id)a4 graph:(id)a5 options:(unint64_t)a6 reportChangedValuesOnly:(BOOL)a7 highlightTailorContext:(id)a8 progressBlock:(id)a9;
- (id)initForTesting;
- (id)keyAssetFromHighlight:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)sortedCurationOfType:(unsigned __int16)a3 fromHighlight:(id)a4;
- (unint64_t)tailorOptionsAllowedForHighlight:(id)a3 originalOptions:(unint64_t)a4;
- (void)writeHighlightEnrichmentValues:(id)a3 toChangeRequest:(id)a4 highlight:(id)a5 options:(unint64_t)a6;
@end

@implementation PGHighlightTailor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_moodGenerationContext, 0);
  objc_storeStrong((id *)&self->_enrichmentCommitGroup, 0);
  objc_storeStrong((id *)&self->_enrichmentProfiles, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (id)sortedCurationOfType:(unsigned __int16)a3 fromHighlight:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = [v6 photoLibrary];
  v8 = [v7 librarySpecificFetchOptions];

  v9 = [(PGHighlightTailor *)self assetSortDescriptors];
  [v8 setSortDescriptors:v9];

  [v8 setHighlightCurationType:v4];
  v10 = +[PGHighlightEnrichmentUtilities assetPropertySetsForEnrichment];
  [v8 setFetchPropertySets:v10];

  [v8 setIncludeGuestAssets:1];
  v11 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v8];

  v12 = [v11 fetchedObjects];

  return v12;
}

- (id)keyAssetFromHighlight:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  workingContext = self->_workingContext;
  id v6 = a3;
  v7 = [(PGManagerWorkingContext *)workingContext photoLibrary];
  v8 = [v7 librarySpecificFetchOptions];

  [v8 setIncludeGuestAssets:1];
  [v8 setSharingFilter:v4];
  v9 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v6 referenceAsset:0 options:v8];

  v10 = [v9 firstObject];

  return v10;
}

- (id)bestEnrichmentProfileForHighlight:(id)a3 options:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->_enrichmentProfiles;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "canEnrichHighlight:withOptions:", v6, a4, (void)v15))
        {
          id v13 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)enrichDayHighlights:(id)a3 dayGroupHighlights:(id)a4 withOptions:(unint64_t)a5 progressBlock:(id)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v46 = a4;
  id v45 = a6;
  uint64_t v9 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v45);
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v59 = 0;
  v60 = (double *)&v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  if (v9)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v60[3] >= 0.01)
    {
      v60[3] = Current;
      LOBYTE(info.numer) = 0;
      v9[2](v9, &info, 0.0);
      char v11 = *((unsigned char *)v64 + 24) | LOBYTE(info.numer);
      *((unsigned char *)v64 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v68 = 956;
          *(_WORD *)&v68[4] = 2080;
          *(void *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Enrich/PGHighlightTailor.m";
          v12 = MEMORY[0x1E4F14500];
LABEL_37:
          _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_38;
        }
        goto LABEL_38;
      }
    }
  }
  uint64_t v13 = [v47 count];
  if (v13)
  {
    context = (void *)MEMORY[0x1D25FED50]();
    v14 = self->_loggingConnection;
    os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)v14);
    long long v16 = v14;
    long long v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "EnrichDayHighlights", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v18 = mach_absolute_time();
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __86__PGHighlightTailor_enrichDayHighlights_dayGroupHighlights_withOptions_progressBlock___block_invoke;
    v53[3] = &unk_1E68F03F8;
    v54 = v9;
    v55 = &v59;
    v56 = &v63;
    uint64_t v57 = 0x3F847AE147AE147BLL;
    BOOL v19 = [(PGHighlightTailor *)self enrichHighlights:v47 options:a5 progressBlock:v53];
    int v20 = *((unsigned __int8 *)v64 + 24);
    if (*((unsigned char *)v64 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v68 = 966;
        *(_WORD *)&v68[4] = 2080;
        *(void *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Enrich/PGHighlightTailor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v42 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v23 = v17;
      v24 = v23;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v68 = v13;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v24, OS_SIGNPOST_INTERVAL_END, v15, "EnrichDayHighlights", "Day Highlight count (%ld)", buf, 0xCu);
      }

      v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(NSString, "stringWithFormat:", @"Day Highlight count (%ld)", v13);
        *(_DWORD *)buf = 136315650;
        *(void *)v68 = "EnrichDayHighlights";
        *(_WORD *)&v68[8] = 2112;
        *(void *)&v68[10] = v26;
        __int16 v69 = 2048;
        double v70 = (float)((float)((float)((float)(v42 - v18) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
      }
    }

    if (v20) {
      goto LABEL_38;
    }
  }
  else
  {
    BOOL v19 = 1;
  }
  if ([v46 count]) {
    BOOL v27 = v19;
  }
  else {
    BOOL v27 = 0;
  }
  if (v27)
  {
    v28 = (void *)MEMORY[0x1D25FED50]();
    v29 = self->_loggingConnection;
    os_signpost_id_t v30 = os_signpost_id_generate((os_log_t)v29);
    v31 = v29;
    v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "EnrichDayGroupHighlights", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v33 = mach_absolute_time();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __86__PGHighlightTailor_enrichDayHighlights_dayGroupHighlights_withOptions_progressBlock___block_invoke_254;
    v48[3] = &unk_1E68F03F8;
    v49 = v9;
    v50 = &v59;
    v51 = &v63;
    uint64_t v52 = 0x3F847AE147AE147BLL;
    LOBYTE(v19) = [(PGHighlightTailor *)self enrichHighlights:v46 options:a5 progressBlock:v48];
    uint64_t v34 = mach_absolute_time();
    mach_timebase_info v35 = info;
    v36 = v32;
    v37 = v36;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      uint64_t v38 = [v46 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v68 = v38;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v37, OS_SIGNPOST_INTERVAL_END, v30, "EnrichDayGroupHighlights", "Day Group Highlight count (%ld)", buf, 0xCu);
    }

    v39 = v37;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = objc_msgSend(NSString, "stringWithFormat:", @"Day Group Highlight count (%ld)", objc_msgSend(v46, "count"));
      *(_DWORD *)buf = 136315650;
      *(void *)v68 = "EnrichDayGroupHighlights";
      *(_WORD *)&v68[8] = 2112;
      *(void *)&v68[10] = v40;
      __int16 v69 = 2048;
      double v70 = (float)((float)((float)((float)(v34 - v33) * (float)v35.numer) / (float)v35.denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
    }
  }
  if (*((unsigned char *)v64 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v68 = 978;
      *(_WORD *)&v68[4] = 2080;
      *(void *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Enrich/PGHighlightTailor.m";
      v12 = MEMORY[0x1E4F14500];
      goto LABEL_37;
    }
LABEL_38:
    LOBYTE(v19) = 0;
  }
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v19;
}

void __86__PGHighlightTailor_enrichDayHighlights_dayGroupHighlights_withOptions_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.7);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __86__PGHighlightTailor_enrichDayHighlights_dayGroupHighlights_withOptions_progressBlock___block_invoke_254(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2 + 0.7);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)enrichAllHighlightsWithOptions:(unint64_t)a3 progressBlock:(id)a4
{
  v57[3] = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v45 = 0;
  id v46 = (double *)&v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v38 = _Block_copy(v37);
  if (v38
    && (double Current = CFAbsoluteTimeGetCurrent(), Current - v46[3] >= 0.01)
    && (v46[3] = Current,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v38 + 2))(v38, &info, 0.0),
        char v7 = *((unsigned char *)v50 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v50 + 24) = v7) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v54 = 918;
      *(_WORD *)&v54[4] = 2080;
      *(void *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Enrich/PGHighlightTailor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    BOOL v8 = 0;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = (void *)MEMORY[0x1D25FED50]();
    char v11 = [(PGHighlightTailor *)self allHighlightModelsNeedingEnrichmentForHighlightSubtype:1000000301 options:a3];
    [v9 addObjectsFromArray:v11];
    v12 = [(PGHighlightTailor *)self allHighlightModelsNeedingEnrichmentForHighlightSubtype:1000000304 options:a3];
    [v9 addObjectsFromArray:v12];
    uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v57[0] = v13;
    v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"kind" ascending:1];
    v57[1] = v14;
    os_signpost_id_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
    v57[2] = v15;
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];
    [v9 sortUsingDescriptors:v16];

    long long v17 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v11 count];
      uint64_t v19 = [v12 count];
      uint64_t v20 = [v9 count];
      *(_DWORD *)buf = 134218496;
      *(void *)v54 = v18;
      *(_WORD *)&v54[8] = 2048;
      *(void *)&v54[10] = v19;
      __int16 v55 = 2048;
      double v56 = *(double *)&v20;
      _os_log_impl(&dword_1D1805000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "%tu day highlights and %tu day groups to enrich (%tu total)", buf, 0x20u);
    }

    uint64_t v21 = [v9 count];
    if (v21)
    {
      v22 = (void *)MEMORY[0x1D25FED50]();
      v23 = self->_loggingConnection;
      os_signpost_id_t v24 = os_signpost_id_generate((os_log_t)v23);
      v25 = v23;
      v26 = v25;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "EnrichHighlights", "", buf, 2u);
      }

      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      uint64_t v27 = mach_absolute_time();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __66__PGHighlightTailor_enrichAllHighlightsWithOptions_progressBlock___block_invoke;
      v39[3] = &unk_1E68F03F8;
      id v40 = v38;
      v41 = &v45;
      uint64_t v42 = &v49;
      uint64_t v43 = 0x3F847AE147AE147BLL;
      BOOL v8 = [(PGHighlightTailor *)self enrichHighlights:v9 options:a3 progressBlock:v39];
      int v28 = *((unsigned __int8 *)v50 + 24);
      if (*((unsigned char *)v50 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v54 = 946;
          *(_WORD *)&v54[4] = 2080;
          *(void *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Enrich/PGHighlightTailor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        uint64_t v36 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        v31 = v26;
        v32 = v31;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v54 = v21;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_END, v24, "EnrichHighlights", "Highlight count (%ld)", buf, 0xCu);
        }

        uint64_t v33 = v32;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"Highlight count (%ld)", v21);
          *(_DWORD *)buf = 136315650;
          *(void *)v54 = "EnrichHighlights";
          *(_WORD *)&v54[8] = 2112;
          *(void *)&v54[10] = v34;
          __int16 v55 = 2048;
          double v56 = (float)((float)((float)((float)(v36 - v27) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
        }
      }

      if (v28) {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  return v8;
}

void __66__PGHighlightTailor_enrichAllHighlightsWithOptions_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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

- (BOOL)enrichHighlights:(id)a3 options:(unint64_t)a4 progressBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    uint64_t v10 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    char v11 = [(PGManagerWorkingContext *)self->_workingContext serviceManager];
    v12 = self->_loggingConnection;
    workingContext = self->_workingContext;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke;
    v19[3] = &unk_1E68EA048;
    id v25 = v9;
    id v20 = v8;
    v14 = v12;
    uint64_t v21 = v14;
    v22 = self;
    id v15 = v10;
    id v23 = v15;
    unint64_t v27 = a4;
    id v16 = v11;
    id v24 = v16;
    v26 = &v28;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v19];
    BOOL v17 = *((unsigned char *)v29 + 24) != 0;

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v55 = a2;
  v3 = _Block_copy(*(const void **)(a1 + 72));
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  char v94 = 0;
  uint64_t v87 = 0;
  v88 = (double *)&v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  uint64_t v65 = (void (**)(void, void, double))v3;
  if (v3)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v88[3] >= 0.01)
    {
      v88[3] = Current;
      LOBYTE(v95) = 0;
      ((void (**)(void, int *, double))v65)[2](v65, &v95, 0.0);
      char v5 = *((unsigned char *)v92 + 24) | v95;
      *((unsigned char *)v92 + 24) = v5;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 787;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Enrich/PGHighlightTailor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_80;
      }
    }
  }
  unint64_t v6 = [*(id *)(a1 + 32) count];
  uint64_t v7 = *(id *)(a1 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PGHighlightTailor] Starting enrichment on %lu highlights.", buf, 0xCu);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_228;
  aBlock[3] = &unk_1E68EA020;
  v85 = buf;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  char v11 = *(void **)(a1 + 56);
  id v82 = v9;
  uint64_t v83 = v10;
  id v84 = v11;
  uint64_t v86 = *(void *)(a1 + 88);
  double v56 = (void (**)(void *, id))_Block_copy(aBlock);
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v57 = [v55 graph];
  uint64_t v59 = [[PGHighlightTailorContext alloc] initWithPhotoLibrary:*(void *)(a1 + 56) graph:v57 serviceManager:*(void *)(a1 + 64) loggingConnection:*(void *)(a1 + 40)];
  long long v80 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v77 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v12 = [obj countByEnumeratingWithState:&v77 objects:v99 count:16];
  if (!v12)
  {
    double v14 = 0.0;
    goto LABEL_63;
  }
  uint64_t v67 = 0;
  double v13 = 1.0 / (double)v6;
  uint64_t v61 = *(void *)v78;
  double v14 = 0.0;
  while (2)
  {
    uint64_t v60 = v12;
    for (uint64_t i = 0; i != v60; ++i)
    {
      if (*(void *)v78 != v61) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(NSObject **)(a1 + 40);
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_ERROR))
        {
          LOWORD(v95) = 0;
          _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Encountered error performing change request. Stopping enrichment.", (uint8_t *)&v95, 2u);
        }
        goto LABEL_77;
      }
      BOOL v17 = *(void **)(*((void *)&v77 + 1) + 8 * i);
      uint64_t v18 = v16;
      os_signpost_id_t v19 = os_signpost_id_generate(v18);
      id v20 = v18;
      uint64_t v21 = v20;
      os_signpost_id_t spid = v19;
      unint64_t v66 = v19 - 1;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        LOWORD(v95) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "EnrichOneHighlight", "", (uint8_t *)&v95, 2u);
      }

      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      uint64_t v62 = mach_absolute_time();
      v22 = (void *)MEMORY[0x1D25FED50]();
      id v23 = [v17 assetCollection];
      id v24 = [v23 localIdentifier];

      id v25 = [*(id *)(a1 + 48) bestEnrichmentProfileForHighlight:v17 options:*(void *)(a1 + 88)];
      if (v25)
      {
        v26 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v95 = 138412546;
          *(void *)v96 = v24;
          *(_WORD *)&v96[8] = 2112;
          *(void *)&v96[10] = v25;
          _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[PGHighlightTailor] Enriching highlight %@ with profile %@", (uint8_t *)&v95, 0x16u);
        }
        if (![*(id *)(a1 + 48) shouldEnrichHighlight:v17 withEnrichmentProfile:v25 options:*(void *)(a1 + 88)])
        {
          char v31 = *(id *)(a1 + 40);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = [v25 identifier];
            int v95 = 138412546;
            *(void *)v96 = v24;
            *(_WORD *)&v96[8] = 2112;
            *(void *)&v96[10] = v32;
            _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[PGHighlightTailor] %@ already up to date with profile %@", (uint8_t *)&v95, 0x16u);
          }
LABEL_31:
          v29 = 0;
          goto LABEL_35;
        }
        unint64_t v27 = *(void **)(a1 + 48);
        uint64_t v28 = *(void *)(a1 + 88);
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_236;
        v69[3] = &unk_1E68ECB50;
        double v70 = v65;
        uint64_t v71 = &v87;
        double v74 = v14;
        double v75 = v13;
        uint64_t v73 = 0x3F847AE147AE147BLL;
        v72 = &v91;
        v29 = [v27 enrichmentValuesForHighlight:v17 usingEnrichmentProfile:v25 graph:v57 options:v28 reportChangedValuesOnly:1 highlightTailorContext:v59 progressBlock:v69];
        if (*((unsigned char *)v92 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            int v95 = 67109378;
            *(_DWORD *)v96 = 855;
            *(_WORD *)&v96[4] = 2080;
            *(void *)&v96[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Enrich/PGHighlightTailor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v95, 0x12u);
          }

LABEL_42:
          int v39 = 0;
          goto LABEL_44;
        }
        uint64_t v33 = *(id *)(a1 + 40);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = [v25 identifier];
          int v95 = 138412802;
          *(void *)v96 = v24;
          *(_WORD *)&v96[8] = 2112;
          *(void *)&v96[10] = v34;
          __int16 v97 = 2112;
          v98 = v29;
          _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[PGHighlightTailor] Enriched %@ with profile %@, values: %@", (uint8_t *)&v95, 0x20u);
        }
      }
      else
      {
        if (![v17 enrichmentState]) {
          goto LABEL_31;
        }
        v29 = objc_alloc_init(PGHighlightEnrichmentValues);
        [(PGHighlightEnrichmentValues *)v29 setClearCurations:1];
        uint64_t v30 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          int v95 = 138412290;
          *(void *)v96 = v24;
          _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "[PGHighlightTailor] No profile, reset highlight %@ to not enriched", (uint8_t *)&v95, 0xCu);
        }
      }
LABEL_35:
      ++v67;
      mach_timebase_info v35 = *(id *)(a1 + 40);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = [*(id *)(a1 + 32) count];
        int v95 = 134218240;
        *(void *)v96 = v67;
        *(_WORD *)&v96[8] = 2048;
        *(void *)&v96[10] = v36;
        _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[PGHighlightTailor] Enrichment progress: %ld / %ld", (uint8_t *)&v95, 0x16u);
      }

      double v14 = v13 + v14;
      if (v65)
      {
        double v37 = CFAbsoluteTimeGetCurrent();
        if (v37 - v88[3] >= 0.01)
        {
          v88[3] = v37;
          char v68 = 0;
          ((void (**)(void, char *, double))v65)[2](v65, &v68, v14);
          char v38 = *((unsigned char *)v92 + 24) | v68;
          *((unsigned char *)v92 + 24) = v38;
          if (v38)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              int v95 = 67109378;
              *(_DWORD *)v96 = 875;
              *(_WORD *)&v96[4] = 2080;
              *(void *)&v96[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Enrich/PGHighlightTailor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v95, 0x12u);
            }
            goto LABEL_42;
          }
        }
      }
      int v39 = 1;
LABEL_44:

      if (!v39)
      {

LABEL_77:
        goto LABEL_79;
      }
      uint64_t v40 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v43 = v21;
      v44 = v43;
      if (v66 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        LOWORD(v95) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v44, OS_SIGNPOST_INTERVAL_END, spid, "EnrichOneHighlight", "", (uint8_t *)&v95, 2u);
      }

      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        int v95 = 136315394;
        *(void *)v96 = "EnrichOneHighlight";
        *(_WORD *)&v96[8] = 2048;
        *(double *)&v96[10] = (float)((float)((float)((float)(v40 - v62) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v44, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v95, 0x16u);
      }
      if (v29)
      {
        if (![(PGHighlightEnrichmentValues *)v29 hasChanges])
        {
          uint64_t v45 = *(id *)(a1 + 40);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            id v46 = [v17 uuid];
            int v95 = 138412290;
            *(void *)v96 = v46;
            _os_log_impl(&dword_1D1805000, v45, OS_LOG_TYPE_INFO, "No change in enrichment for highlight %@", (uint8_t *)&v95, 0xCu);
          }
        }
        if ([(PGHighlightEnrichmentValues *)v29 hasChanges] || *(unsigned char *)(a1 + 88) == 0xFF)
        {
          uint64_t v47 = [(PGHighlightEnrichmentValues *)v29 enrichmentState];
          uint64_t v48 = [v17 uuid];
          [(PGHighlightTailorContext *)v59 savePendingEnrichmentState:v47 forHighlightUUID:v48];

          [v64 addObject:v29];
          if ((unint64_t)[v64 count] >= 0x14)
          {
            id v49 = v64;
            id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

            v56[2](v56, v49);
          }
        }
      }
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v77 objects:v99 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_63:

  if (v65
    && (double v50 = CFAbsoluteTimeGetCurrent(), v50 - v88[3] >= 0.01)
    && (v88[3] = v50,
        LOBYTE(info.numer) = 0,
        ((void (**)(void, mach_timebase_info *, double))v65)[2](v65, &info, v14),
        char v51 = *((unsigned char *)v92 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v92 + 24) = v51) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v95 = 67109378;
      *(_DWORD *)v96 = 902;
      *(_WORD *)&v96[4] = 2080;
      *(void *)&v96[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Enrich/PGHighlightTailor.m";
      char v52 = MEMORY[0x1E4F14500];
      goto LABEL_75;
    }
  }
  else
  {
    v56[2](v56, v64);
    dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 48) + 24), 0xFFFFFFFFFFFFFFFFLL);
    if (v65
      && (double v53 = CFAbsoluteTimeGetCurrent(), v53 - v88[3] >= 0.01)
      && (v88[3] = v53,
          LOBYTE(info.numer) = 0,
          ((void (**)(void, mach_timebase_info *, double))v65)[2](v65, &info, 1.0),
          char v54 = *((unsigned char *)v92 + 24) | LOBYTE(info.numer),
          (*((unsigned char *)v92 + 24) = v54) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v95 = 67109378;
        *(_DWORD *)v96 = 908;
        *(_WORD *)&v96[4] = 2080;
        *(void *)&v96[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Enrich/PGHighlightTailor.m";
        char v52 = MEMORY[0x1E4F14500];
LABEL_75:
        _os_log_impl(&dword_1D1805000, v52, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v95, 0x12u);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    }
  }
LABEL_79:

  _Block_object_dispose(buf, 8);
LABEL_80:
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_228(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    char v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "Encountered error performing change request. Stopping enrichment.", buf, 2u);
    }
  }
  else if ([v3 count])
  {
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 40) + 24));
    unint64_t v6 = *(id *)(a1 + 32);
    os_signpost_id_t v7 = os_signpost_id_generate(v6);
    uint64_t v8 = v6;
    id v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CommitBatchOfHighlightEnrichmentChanges", "", buf, 2u);
    }

    *(void *)buf = 0;
    mach_timebase_info((mach_timebase_info_t)buf);
    uint64_t v10 = mach_absolute_time();
    char v11 = *(void **)(a1 + 48);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_229;
    v24[3] = &unk_1E68EFDB0;
    id v12 = v4;
    uint64_t v13 = *(void *)(a1 + 40);
    id v25 = v12;
    uint64_t v26 = v13;
    uint64_t v27 = *(void *)(a1 + 64);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_2;
    v17[3] = &unk_1E68E9FF8;
    uint64_t v21 = v10;
    os_signpost_id_t v22 = v7;
    uint64_t v18 = v9;
    uint64_t v23 = *(void *)buf;
    int8x16_t v16 = *(int8x16_t *)(a1 + 32);
    id v14 = (id)v16.i64[0];
    int8x16_t v19 = vextq_s8(v16, v16, 8uLL);
    uint64_t v20 = *(void *)(a1 + 56);
    id v15 = v9;
    [v11 performChanges:v24 completionHandler:v17];
  }
}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_236(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 64) + a3 * *(double *)(a1 + 72));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_229(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "highlight", (void)v10);
        id v9 = [v8 changeRequest];
        if (v9) {
          [*(id *)(a1 + 40) writeHighlightEnrichmentValues:v7 toChangeRequest:v9 highlight:v8 options:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = mach_absolute_time();
  uint64_t v6 = *(void *)(a1 + 64);
  unsigned int v8 = *(_DWORD *)(a1 + 80);
  unsigned int v7 = *(_DWORD *)(a1 + 84);
  id v9 = *(id *)(a1 + 32);
  long long v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CommitBatchOfHighlightEnrichmentChanges", "", (uint8_t *)&v14, 2u);
  }

  long long v12 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    uint64_t v15 = "CommitBatchOfHighlightEnrichmentChanges";
    __int16 v16 = 2048;
    double v17 = (float)((float)((float)((float)(v5 - v6) * (float)v8) / (float)v7) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v14, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 24));
  if (v4)
  {
    long long v13 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = v4;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "Error performing enrichment change request: %@", (uint8_t *)&v14, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (BOOL)shouldEnrichHighlight:(id)a3 withEnrichmentProfile:(id)a4 options:(unint64_t)a5
{
  int v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ((v5 & 0x40000000) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v7 isUpToDate])
  {
    unsigned int v9 = [v7 enrichmentState];
    BOOL v10 = v9 < [v8 targetEnrichmentState];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (id)allHighlightModelsNeedingEnrichmentForHighlightSubtype:(int64_t)a3 options:(unint64_t)a4
{
  int v4 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];

  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v14[0] = v8;
  unsigned int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v7 setSortDescriptors:v9];

  if ((v4 & 0x40000000) == 0)
  {
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(enrichmentVersion != highlightVersion) || (enrichmentState != %ld)", 4);
    [v7 setInternalPredicate:v10];
  }
  os_signpost_id_t v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:a3 options:v7];
  if ([v11 count])
  {
    long long v12 = [v11 fetchedObjects];
  }
  else
  {
    long long v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (void)writeHighlightEnrichmentValues:(id)a3 toChangeRequest:(id)a4 highlight:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 clearCurations])
  {
    [v11 setEnrichmentState:0];
    [v11 clearCurations];
    goto LABEL_49;
  }
  uint64_t v13 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  if (v6 == -1)
  {
    uint64_t v14 = [v10 enrichmentState];
    if (v14 == 0xFFFF)
    {
      if (![v12 enrichmentState]) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    int v15 = v14;
    [v11 setEnrichmentState:v14];
    if (v15)
    {
LABEL_6:
      __int16 v16 = [MEMORY[0x1E4F1C9C8] date];
      [v11 setLastEnrichmentDate:v16];

      [v11 didEnrichHighlight];
    }
  }
LABEL_7:
  [v10 promotionScore];
  if (v17 != -1.0) {
    objc_msgSend(v11, "setPromotionScore:");
  }
  if ([v10 smartDescriptionPrivateUpdated])
  {
    uint64_t v18 = [v10 smartDescriptionPrivate];
    [v11 setSmartDescription:v18];
  }
  if ([v10 verboseSmartDescriptionPrivateUpdated])
  {
    int8x16_t v19 = [v10 verboseSmartDescriptionPrivate];
    [v11 setVerboseSmartDescription:v19];
  }
  if ([v10 smartDescriptionSharedUpdated])
  {
    uint64_t v20 = [v10 smartDescriptionShared];
    [v11 setSmartDescriptionShared:v20];
  }
  if ([v10 verboseSmartDescriptionSharedUpdated])
  {
    uint64_t v21 = [v10 verboseSmartDescriptionShared];
    [v11 setVerboseSmartDescriptionShared:v21];
  }
  if ([v10 smartDescriptionMixedUpdated])
  {
    os_signpost_id_t v22 = [v10 smartDescriptionMixed];
    [v11 setSmartDescriptionMixed:v22];
  }
  id v59 = v12;
  if ([v10 verboseSmartDescriptionMixedUpdated])
  {
    uint64_t v23 = [v10 verboseSmartDescriptionMixed];
    [v11 setVerboseSmartDescriptionMixed:v23];
  }
  id v24 = [v10 momentTitleByMomentUUID];
  id v25 = v24;
  if (v24)
  {
    uint64_t v26 = [v24 allKeys];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __86__PGHighlightTailor_writeHighlightEnrichmentValues_toChangeRequest_highlight_options___block_invoke;
    v66[3] = &unk_1E68E9FD0;
    id v67 = v25;
    [v11 enumerateMomentChangeRequestsForUUIDs:v26 inPhotoLibrary:v13 usingBlock:v66];
  }
  uint64_t v27 = [v10 momentProcessedLocationByMomentUUID];
  uint64_t v28 = v27;
  if (v27)
  {
    v29 = [v27 allKeys];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __86__PGHighlightTailor_writeHighlightEnrichmentValues_toChangeRequest_highlight_options___block_invoke_2;
    v64[3] = &unk_1E68E9FD0;
    id v65 = v28;
    [v11 enumerateMomentChangeRequestsForUUIDs:v29 inPhotoLibrary:v13 usingBlock:v64];
  }
  uint64_t v30 = [v10 keyAssetPrivate];
  if (v30) {
    [v11 setKeyAssetPrivate:v30];
  }
  uint64_t v31 = [v10 keyAssetShared];
  if (v31) {
    [v11 setKeyAssetShared:v31];
  }
  v32 = [v10 mixedSharingCompositionKeyAssetRelationshipValue];
  uint64_t v33 = v32;
  if (v32) {
    objc_msgSend(v11, "setMixedSharingCompositionKeyAssetRelationship:", objc_msgSend(v32, "unsignedShortValue"));
  }
  uint64_t v34 = [v10 extendedCuration];
  if (v34) {
    [v11 setAssets:v34 forCurationType:2];
  }
  char v54 = (void *)v31;
  mach_timebase_info v35 = [v10 summaryCuration];
  uint64_t v36 = v35;
  if (v35)
  {
    if ([v35 count]) {
      [v11 setAssets:v36 forCurationType:1];
    }
    else {
      [v11 clearCurationWithType:1];
    }
  }
  char v51 = v36;
  char v52 = (void *)v34;
  double v53 = v33;
  id v55 = (void *)v30;
  double v56 = v28;
  uint64_t v57 = v25;
  v58 = (void *)v13;
  uint64_t v37 = [v10 mood];
  if (v37 != -1) {
    [v11 setMood:v37];
  }
  char v38 = [v10 visibilityScoreByAsset];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  int v39 = [v10 visibilityScoreByAsset];
  uint64_t v40 = [v39 keyEnumerator];

  uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v61 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        id v46 = [v38 objectForKey:v45];
        [v46 doubleValue];
        double v48 = v47;
        [v45 highlightVisibilityScore];
        if (v48 != v49)
        {
          double v50 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:v45];
          [v46 doubleValue];
          objc_msgSend(v50, "setHighlightVisibilityScore:");
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v42);
  }

  id v12 = v59;
LABEL_49:
}

void __86__PGHighlightTailor_writeHighlightEnrichmentValues_toChangeRequest_highlight_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  int v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  char v6 = v5;
  if (v5)
  {
    id v7 = [v5 title];
    id v8 = [v7 stringValue];

    [v12 setTitle:v8];
    unsigned int v9 = [v6 subtitle];
    id v10 = [v9 stringValue];

    [v12 setSubtitle:v10];
    id v11 = [v6 locationNames];
    [v12 setLocalizedLocationNames:v11];
  }
}

void __86__PGHighlightTailor_writeHighlightEnrichmentValues_toChangeRequest_highlight_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  int v4 = *(void **)(a1 + 32);
  id v7 = a2;
  int v5 = [v4 objectForKeyedSubscript:a3];
  uint64_t v6 = [v5 unsignedShortValue];

  [v7 setProcessedLocation:v6];
}

- (id)enrichmentValuesForHighlight:(id)a3 usingEnrichmentProfile:(id)a4 graph:(id)a5 options:(unint64_t)a6 reportChangedValuesOnly:(BOOL)a7 highlightTailorContext:(id)a8 progressBlock:(id)a9
{
  BOOL v10 = a7;
  uint64_t v382 = *MEMORY[0x1E4F143B8];
  id v310 = a3;
  id v309 = a4;
  id v307 = a5;
  id v13 = a8;
  id v298 = a9;
  uint64_t v370 = 0;
  v371 = &v370;
  uint64_t v372 = 0x2020000000;
  char v373 = 0;
  uint64_t v366 = 0;
  v367 = (double *)&v366;
  uint64_t v368 = 0x2020000000;
  uint64_t v369 = 0;
  v308 = (void (**)(void *, unsigned char *, double))_Block_copy(v298);
  v306 = v13;
  if (!v308
    || (double v14 = CFAbsoluteTimeGetCurrent(), v14 - v367[3] < 0.01)
    || (v367[3] = v14,
        info[0] = 0,
        v308[2](v308, info, 0.0),
        char v15 = *((unsigned char *)v371 + 24) | info[0],
        (*((unsigned char *)v371 + 24) = v15) == 0))
  {
    double v17 = [v309 highlightInfoWithHighlight:v310 graph:v307 highlightTailorContext:v13];
    if (!v17)
    {
      __int16 v16 = 0;
LABEL_371:

      goto LABEL_372;
    }
    v293 = [[PGHighlightEnrichmentValues alloc] initWithHighlight:v310];
    uint64_t v18 = [v310 assetCollection];
    char v290 = [(PGHighlightTailor *)self tailorOptionsAllowedForHighlight:v18 originalOptions:a6];
    int v19 = [v310 isUpToDate];
    unsigned int v289 = [v309 enrichmentStateWithHighlightInfo:v17 highlightTailorContext:v306];
    int v20 = [v310 enrichmentState];
    v297 = v17;
    v292 = v18;
    if ((a6 & 0x40000000) == 0 && ((v19 ^ 1) & 1) == 0 && v289 == v20) {
      goto LABEL_363;
    }
    int v21 = [v18 sharingComposition];
    BOOL v285 = v10;
    if (v21)
    {
      if (v21 == 1)
      {
        uint64_t v23 = (void *)MEMORY[0x1D25FED50]();
        id v25 = 0;
        char v26 = 0;
        id v24 = v292;
        goto LABEL_20;
      }
      if (v21 != 2)
      {
        uint64_t v23 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v27 = 0;
        int v283 = 0;
        uint64_t v282 = 0;
        id v25 = 0;
        goto LABEL_23;
      }
      char v22 = 1;
    }
    else
    {
      char v22 = 0;
    }
    uint64_t v23 = (void *)MEMORY[0x1D25FED50]();
    id v24 = v18;
    id v25 = [(PGHighlightTailor *)self keyAssetFromHighlight:v18 sharingFilter:0];
    char v26 = 1;
    if ((v22 & 1) == 0)
    {
      int v283 = 1;
      uint64_t v27 = 0;
      uint64_t v282 = 0;
LABEL_23:
      uint64_t v28 = 0;
      goto LABEL_25;
    }
LABEL_20:
    uint64_t v27 = [(PGHighlightTailor *)self keyAssetFromHighlight:v24 sharingFilter:1];
    if (v26)
    {
      uint64_t v28 = +[PGHighlightEnrichmentUtilities keyAssetForMixedSharingCompositionKeyAssetRelationship:keyAssetPrivate:keyAssetShared:](PGHighlightEnrichmentUtilities, "keyAssetForMixedSharingCompositionKeyAssetRelationship:keyAssetPrivate:keyAssetShared:", [v24 mixedSharingCompositionKeyAssetRelationship], v25, v27);
      int v283 = 1;
      uint64_t v282 = 0x100000001;
    }
    else
    {
      uint64_t v282 = 0x100000000;
      uint64_t v28 = 0;
      int v283 = 0;
    }
LABEL_25:
    if ((v290 & 8) == 0)
    {
      id v29 = v25;
      id v288 = v27;
      id v286 = v28;
LABEL_62:
      v287 = v29;
      double v48 = [v29 uuid];
      [v297 setKeyAssetPrivateUUID:v48];

      uint64_t v33 = [v288 uuid];
      [v297 setKeyAssetSharedUUID:v33];
      int v39 = 1;
LABEL_63:

      if (!v39)
      {
LABEL_69:
        int v51 = 1;
        goto LABEL_361;
      }
      if (v308)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v367[3] >= 0.01)
        {
          v367[3] = Current;
          info[0] = 0;
          v308[2](v308, info, 0.1);
          char v50 = *((unsigned char *)v371 + 24) | info[0];
          *((unsigned char *)v371 + 24) = v50;
          if (v50)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = 282;
              *(_WORD *)&uint8_t buf[8] = 2080;
              *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Enrich/PGHighlightTailor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            goto LABEL_69;
          }
        }
      }
      v281 = [(PGHighlightTailor *)self assetSortDescriptors];
      char v52 = (void *)MEMORY[0x1D25FED50]();
      double v53 = [(PGHighlightTailor *)self sortedCurationOfType:2 fromHighlight:v292];
      char v54 = v297;
      id v55 = v53;
      if ((v290 & 0x10) == 0)
      {
        id v56 = v53;
LABEL_133:
        objc_msgSend(v54, "setNumberOfExtendedAssets:", objc_msgSend(v56, "count"));
        long long v60 = [v56 valueForKey:@"uuid"];
        [v54 setUuidsOfEligibleAssets:v60];
        v279 = v56;
        int v67 = 1;
LABEL_134:

        if (!v67)
        {
LABEL_237:
          int v51 = 1;
LABEL_360:

LABEL_361:
          uint64_t v18 = v292;
          if (v51)
          {
            __int16 v16 = 0;
LABEL_370:

            double v17 = v297;
            goto LABEL_371;
          }
LABEL_363:
          if (v308
            && (double v269 = CFAbsoluteTimeGetCurrent(), v269 - v367[3] >= 0.01)
            && (v367[3] = v269,
                info[0] = 0,
                v308[2](v308, info, 1.0),
                char v270 = *((unsigned char *)v371 + 24) | info[0],
                (*((unsigned char *)v371 + 24) = v270) != 0))
          {
            v271 = MEMORY[0x1E4F14500];
            id v272 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(v271, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = 609;
              *(_WORD *)&uint8_t buf[8] = 2080;
              *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Enrich/PGHighlightTailor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            __int16 v16 = 0;
            uint64_t v18 = v292;
          }
          else
          {
            __int16 v16 = v293;
          }
          goto LABEL_370;
        }
        if (v308)
        {
          double v94 = CFAbsoluteTimeGetCurrent();
          if (v94 - v367[3] >= 0.01)
          {
            v367[3] = v94;
            info[0] = 0;
            uint64_t v93 = ((uint64_t (*)(void *, unsigned char *, double))v308[2])(v308, info, 0.2);
            char v95 = *((unsigned char *)v371 + 24) | info[0];
            *((unsigned char *)v371 + 24) = v95;
            if (v95)
            {
              v96 = MEMORY[0x1E4F14500];
              id v97 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&uint8_t buf[4] = 356;
                *(_WORD *)&uint8_t buf[8] = 2080;
                *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Enrich/PGHighlightTailor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
LABEL_140:

              goto LABEL_237;
            }
          }
        }
        if (v290)
        {
          [v309 promotionScoreWithHighlightInfo:v297];
          double v99 = v98;
          [v292 promotionScore];
          if (!v285 || v99 != v100) {
            [(PGHighlightEnrichmentValues *)v293 setPromotionScore:v99];
          }
          uint64_t v93 = [v297 setPromotionScore:v99];
        }
        if (v308)
        {
          double v101 = CFAbsoluteTimeGetCurrent();
          if (v101 - v367[3] >= 0.01)
          {
            v367[3] = v101;
            info[0] = 0;
            uint64_t v93 = ((uint64_t (*)(void *, unsigned char *, double))v308[2])(v308, info, 0.3);
            char v102 = *((unsigned char *)v371 + 24) | info[0];
            *((unsigned char *)v371 + 24) = v102;
            if (v102)
            {
              v103 = MEMORY[0x1E4F14500];
              id v104 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&uint8_t buf[4] = 367;
                *(_WORD *)&uint8_t buf[8] = 2080;
                *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Enrich/PGHighlightTailor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              goto LABEL_140;
            }
          }
        }
        if ((v290 & 0x20) == 0)
        {
LABEL_195:
          if (v308)
          {
            double v131 = CFAbsoluteTimeGetCurrent();
            if (v131 - v367[3] >= 0.01)
            {
              v367[3] = v131;
              info[0] = 0;
              uint64_t v93 = ((uint64_t (*)(void *, unsigned char *, double))v308[2])(v308, info, 0.4);
              char v132 = *((unsigned char *)v371 + 24) | info[0];
              *((unsigned char *)v371 + 24) = v132;
              if (v132)
              {
                v133 = MEMORY[0x1E4F14500];
                id v134 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&uint8_t buf[4] = 410;
                  *(_WORD *)&uint8_t buf[8] = 2080;
                  *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Enrich/PGHighlightTailor.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                goto LABEL_237;
              }
            }
          }
          if ((v290 & 0x10) == 0)
          {
LABEL_231:
            if (v308)
            {
              double v156 = CFAbsoluteTimeGetCurrent();
              if (v156 - v367[3] >= 0.01)
              {
                v367[3] = v156;
                info[0] = 0;
                v308[2](v308, info, 0.6);
                char v157 = *((unsigned char *)v371 + 24) | info[0];
                *((unsigned char *)v371 + 24) = v157;
                if (v157)
                {
                  v158 = MEMORY[0x1E4F14500];
                  id v159 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = 446;
                    *(_WORD *)&uint8_t buf[8] = 2080;
                    *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Enrich/PGHighlightTailor.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  goto LABEL_237;
                }
              }
            }
            *(void *)buf = 0;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            char v378 = 1;
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_214;
            aBlock[3] = &unk_1E68E9FA8;
            BOOL v329 = v285;
            v328 = buf;
            void aBlock[4] = self;
            id objb = v310;
            id v327 = objb;
            v304 = (unsigned int (**)(void *, void *, void *, id))_Block_copy(aBlock);
            if ((v290 & 2) != 0)
            {
              v160 = self->_loggingConnection;
              os_signpost_id_t v161 = os_signpost_id_generate((os_log_t)v160);
              v162 = v160;
              v163 = v162;
              if (v161 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v162))
              {
                *(_WORD *)mach_timebase_info info = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v163, OS_SIGNPOST_INTERVAL_BEGIN, v161, "PGHighlightTailorGenerateTitle", "", info, 2u);
              }

              mach_timebase_info v325 = 0;
              mach_timebase_info(&v325);
              uint64_t v164 = mach_absolute_time();
              if (v283)
              {
                v165 = (void *)MEMORY[0x1D25FED50]();
                id v324 = 0;
                v166 = [v309 titleWithHighlightInfo:v297 sharingFilter:0 curatedAssets:v279 keyAsset:v287 createVerboseTitle:0 error:&v324];
                id v167 = v324;
                v168 = [v166 title];
                v169 = [v168 stringValue];

                v170 = [v292 smartDescriptionPrivate];
                if (v304[2](v304, v169, v170, v167)) {
                  [(PGHighlightEnrichmentValues *)v293 setSmartDescriptionPrivate:v169];
                }
              }
              if (HIDWORD(v282))
              {
                v171 = (void *)MEMORY[0x1D25FED50]();
                id v323 = 0;
                v172 = [v309 titleWithHighlightInfo:v297 sharingFilter:1 curatedAssets:v279 keyAsset:v288 createVerboseTitle:0 error:&v323];
                id v173 = v323;
                v174 = [v172 title];
                v175 = [v174 stringValue];

                v176 = [v292 smartDescriptionShared];
                if (v304[2](v304, v175, v176, v173)) {
                  [(PGHighlightEnrichmentValues *)v293 setSmartDescriptionShared:v175];
                }
              }
              if (v282)
              {
                v177 = (void *)MEMORY[0x1D25FED50]();
                id v322 = 0;
                v178 = [v309 titleWithHighlightInfo:v297 sharingFilter:2 curatedAssets:v279 keyAsset:v286 createVerboseTitle:0 error:&v322];
                id v179 = v322;
                v180 = [v178 title];
                v181 = [v180 stringValue];

                v182 = [v292 smartDescriptionMixed];
                if (v304[2](v304, v181, v182, v179)) {
                  [(PGHighlightEnrichmentValues *)v293 setSmartDescriptionMixed:v181];
                }
              }
              uint64_t v183 = mach_absolute_time();
              uint32_t numer = v325.numer;
              uint32_t denom = v325.denom;
              v186 = v163;
              v187 = v186;
              if (v161 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v186))
              {
                *(_WORD *)mach_timebase_info info = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v187, OS_SIGNPOST_INTERVAL_END, v161, "PGHighlightTailorGenerateTitle", "", info, 2u);
              }

              v188 = v187;
              if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)mach_timebase_info info = 136315394;
                *(void *)&info[4] = "PGHighlightTailorGenerateTitle";
                *(_WORD *)&info[12] = 2048;
                *(double *)&info[14] = (float)((float)((float)((float)(v183 - v164) * (float)numer) / (float)denom)
                                             / 1000000.0);
                _os_log_impl(&dword_1D1805000, v188, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", info, 0x16u);
              }
            }
            if (v308)
            {
              double v189 = CFAbsoluteTimeGetCurrent();
              if (v189 - v367[3] >= 0.01)
              {
                v367[3] = v189;
                LOBYTE(v325.numer) = 0;
                ((void (**)(void *, mach_timebase_info *, double))v308)[2](v308, &v325, 0.7);
                char v190 = *((unsigned char *)v371 + 24) | LOBYTE(v325.numer);
                *((unsigned char *)v371 + 24) = v190;
                if (v190)
                {
                  v191 = MEMORY[0x1E4F14500];
                  id v192 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(v191, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)mach_timebase_info info = 67109378;
                    *(_DWORD *)&info[4] = 503;
                    *(_WORD *)&info[8] = 2080;
                    *(void *)&info[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Enrich/PGHighlightTailor.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", info, 0x12u);
                  }

                  goto LABEL_340;
                }
              }
            }
            if ((v290 & 4) != 0)
            {
              v193 = self->_loggingConnection;
              os_signpost_id_t v194 = os_signpost_id_generate((os_log_t)v193);
              v195 = v193;
              v196 = v195;
              if (v194 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v195))
              {
                *(_WORD *)mach_timebase_info info = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v196, OS_SIGNPOST_INTERVAL_BEGIN, v194, "PGHighlightTailorGenerateVerboseTitle", "", info, 2u);
              }

              mach_timebase_info v325 = 0;
              mach_timebase_info(&v325);
              uint64_t v197 = mach_absolute_time();
              if (v283)
              {
                v198 = (void *)MEMORY[0x1D25FED50]();
                id v321 = 0;
                v199 = [v309 titleWithHighlightInfo:v297 sharingFilter:0 curatedAssets:0 keyAsset:0 createVerboseTitle:1 error:&v321];
                id v200 = v321;
                v201 = [v199 title];
                v202 = [v201 stringValue];

                v203 = [v292 verboseSmartDescriptionPrivate];
                if (v304[2](v304, v202, v203, v200)) {
                  [(PGHighlightEnrichmentValues *)v293 setVerboseSmartDescriptionPrivate:v202];
                }
              }
              if (HIDWORD(v282))
              {
                v204 = (void *)MEMORY[0x1D25FED50]();
                id v320 = 0;
                v205 = [v309 titleWithHighlightInfo:v297 sharingFilter:1 curatedAssets:0 keyAsset:0 createVerboseTitle:1 error:&v320];
                id v206 = v320;
                v207 = [v205 title];
                v208 = [v207 stringValue];

                v209 = [v292 verboseSmartDescriptionShared];
                if (v304[2](v304, v208, v209, v206)) {
                  [(PGHighlightEnrichmentValues *)v293 setVerboseSmartDescriptionShared:v208];
                }
              }
              if (v282)
              {
                v210 = (void *)MEMORY[0x1D25FED50]();
                id v319 = 0;
                v211 = [v309 titleWithHighlightInfo:v297 sharingFilter:2 curatedAssets:0 keyAsset:0 createVerboseTitle:1 error:&v319];
                id v212 = v319;
                v213 = [v211 title];
                v214 = [v213 stringValue];

                v215 = [v292 verboseSmartDescriptionMixed];
                if (v304[2](v304, v214, v215, v212)) {
                  [(PGHighlightEnrichmentValues *)v293 setVerboseSmartDescriptionMixed:v214];
                }
              }
              uint64_t v216 = mach_absolute_time();
              uint32_t v217 = v325.numer;
              uint32_t v218 = v325.denom;
              v219 = v196;
              v220 = v219;
              if (v194 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v219))
              {
                *(_WORD *)mach_timebase_info info = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v220, OS_SIGNPOST_INTERVAL_END, v194, "PGHighlightTailorGenerateVerboseTitle", "", info, 2u);
              }

              v221 = v220;
              if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)mach_timebase_info info = 136315394;
                *(void *)&info[4] = "PGHighlightTailorGenerateVerboseTitle";
                *(_WORD *)&info[12] = 2048;
                *(double *)&info[14] = (float)((float)((float)((float)(v216 - v197) * (float)v217) / (float)v218)
                                             / 1000000.0);
                _os_log_impl(&dword_1D1805000, v221, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", info, 0x16u);
              }
            }
            v222 = v297;
            if (v308)
            {
              double v223 = CFAbsoluteTimeGetCurrent();
              if (v223 - v367[3] >= 0.01)
              {
                v367[3] = v223;
                LOBYTE(v325.numer) = 0;
                ((void (**)(void *, mach_timebase_info *, double))v308)[2](v308, &v325, 0.8);
                char v224 = *((unsigned char *)v371 + 24) | LOBYTE(v325.numer);
                *((unsigned char *)v371 + 24) = v224;
                if (v224)
                {
                  v225 = MEMORY[0x1E4F14500];
                  id v226 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)mach_timebase_info info = 67109378;
                    *(_DWORD *)&info[4] = 538;
                    *(_WORD *)&info[8] = 2080;
                    *(void *)&info[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Enrich/PGHighlightTailor.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", info, 0x12u);
                  }

                  goto LABEL_340;
                }
              }
            }
            if ((v290 & 0x40) != 0)
            {
              v284 = (void *)MEMORY[0x1D25FED50]();
              v227 = [v297 feeder];
              v228 = [v227 allItems];
              uint64_t v229 = [(PGHighlightTailor *)self computeChangedVisibilityScoresForItems:v228];
              v230 = (void *)v229;
              if (v285)
              {
                v231 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                long long v317 = 0u;
                long long v318 = 0u;
                long long v315 = 0u;
                long long v316 = 0u;
                v232 = [v230 keyEnumerator];
                uint64_t v233 = [v232 countByEnumeratingWithState:&v315 objects:v375 count:16];
                if (v233)
                {
                  uint64_t v234 = *(void *)v316;
                  do
                  {
                    for (uint64_t i = 0; i != v233; ++i)
                    {
                      if (*(void *)v316 != v234) {
                        objc_enumerationMutation(v232);
                      }
                      v236 = *(void **)(*((void *)&v315 + 1) + 8 * i);
                      v237 = [v230 objectForKey:v236];
                      [v236 highlightVisibilityScore];
                      double v239 = v238;
                      [v237 doubleValue];
                      if (v240 != v239) {
                        [v231 setObject:v237 forKey:v236];
                      }
                    }
                    uint64_t v233 = [v232 countByEnumeratingWithState:&v315 objects:v375 count:16];
                  }
                  while (v233);
                }

                id v241 = v231;
              }
              else
              {
                id v241 = (id)v229;
              }
              if ([v241 count]) {
                [(PGHighlightEnrichmentValues *)v293 setVisibilityScoreByAsset:v241];
              }

              v222 = v297;
            }
            if (v308)
            {
              double v242 = CFAbsoluteTimeGetCurrent();
              if (v242 - v367[3] >= 0.01)
              {
                v367[3] = v242;
                LOBYTE(v325.numer) = 0;
                ((void (**)(void *, mach_timebase_info *, double))v308)[2](v308, &v325, 0.9);
                char v243 = *((unsigned char *)v371 + 24) | LOBYTE(v325.numer);
                *((unsigned char *)v371 + 24) = v243;
                if (v243)
                {
                  v244 = MEMORY[0x1E4F14500];
                  id v245 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(v244, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)mach_timebase_info info = 67109378;
                    *(_DWORD *)&info[4] = 563;
                    *(_WORD *)&info[8] = 2080;
                    *(void *)&info[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Enrich/PGHighlightTailor.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", info, 0x12u);
                  }

                  goto LABEL_340;
                }
              }
            }
            if ((v290 & 0x80) == 0)
            {
LABEL_334:
              if (!v308
                || (double v259 = CFAbsoluteTimeGetCurrent(), v259 - v367[3] < 0.01)
                || (v367[3] = v259,
                    LOBYTE(v325.numer) = 0,
                    ((void (**)(void *, mach_timebase_info *, double))v308)[2](v308, &v325, 0.95),
                    char v260 = *((unsigned char *)v371 + 24) | LOBYTE(v325.numer),
                    (*((unsigned char *)v371 + 24) = v260) == 0))
              {
                if ((_BYTE)a6 == 0xFF)
                {
                  unsigned __int8 v263 = [v309 canUseLocationInformationWithHighlightInfo:v222 graph:v307];
                  int v264 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
                  if (v289 >= 2) {
                    unsigned int v265 = 2;
                  }
                  else {
                    unsigned int v265 = v289;
                  }
                  if (((*(unsigned char *)(*(void *)&buf[8] + 24) != 0) & v263) != 0) {
                    uint64_t v266 = v289;
                  }
                  else {
                    uint64_t v266 = v265;
                  }
                  if ((v263 & 1) == 0)
                  {
                    v267 = self->_loggingConnection;
                    if (os_log_type_enabled((os_log_t)v267, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)mach_timebase_info info = 67109376;
                      *(_DWORD *)&info[4] = v289;
                      *(_WORD *)&info[8] = 1024;
                      *(_DWORD *)&info[10] = v266;
                      _os_log_impl(&dword_1D1805000, (os_log_t)v267, OS_LOG_TYPE_DEFAULT, "[PGHighlightTailor] Couldn't satisfy enrichment state %d: not enough location data available. Falling back to enrichment state %d", info, 0xEu);
                    }

                    int v264 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
                  }
                  if (!v264)
                  {
                    v268 = self->_loggingConnection;
                    if (os_log_type_enabled((os_log_t)v268, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)mach_timebase_info info = 67109376;
                      *(_DWORD *)&info[4] = v289;
                      *(_WORD *)&info[8] = 1024;
                      *(_DWORD *)&info[10] = v266;
                      _os_log_impl(&dword_1D1805000, (os_log_t)v268, OS_LOG_TYPE_DEFAULT, "[PGHighlightTailor] Couldn't satisfy enrichment state %d: error encountered while generating titles. Falling back to enrichment state %d", info, 0xEu);
                    }
                  }
                  if (v266 != [objb enrichmentState]) {
                    [(PGHighlightEnrichmentValues *)v293 setEnrichmentState:v266];
                  }
                }
                int v51 = 0;
                goto LABEL_359;
              }
              v261 = MEMORY[0x1E4F14500];
              id v262 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v261, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)mach_timebase_info info = 67109378;
                *(_DWORD *)&info[4] = 584;
                *(_WORD *)&info[8] = 2080;
                *(void *)&info[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Enrich/PGHighlightTailor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", info, 0x12u);
              }

LABEL_340:
              int v51 = 1;
LABEL_359:

              _Block_object_dispose(buf, 8);
              goto LABEL_360;
            }
            v291 = (void *)MEMORY[0x1D25FED50]();
            v246 = [v309 momentProcessedLocationByMomentUUIDWithHighlightInfo:v297 graph:v307];
            v247 = v246;
            if (v285)
            {
              if ([v246 count])
              {
                id v248 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                [v297 momentFetchResult];
                long long v313 = 0u;
                long long v314 = 0u;
                long long v311 = 0u;
                long long v312 = 0u;
                id v249 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v250 = [v249 countByEnumeratingWithState:&v311 objects:v374 count:16];
                if (v250)
                {
                  uint64_t v251 = *(void *)v312;
                  do
                  {
                    for (uint64_t j = 0; j != v250; ++j)
                    {
                      if (*(void *)v312 != v251) {
                        objc_enumerationMutation(v249);
                      }
                      v253 = *(void **)(*((void *)&v311 + 1) + 8 * j);
                      v254 = [v253 uuid];
                      v255 = [v247 objectForKeyedSubscript:v254];
                      uint64_t v256 = [v255 unsignedShortValue];

                      if ([v253 processedLocation] != v256)
                      {
                        v257 = [NSNumber numberWithUnsignedShort:v256];
                        [v248 setObject:v257 forKeyedSubscript:v254];
                      }
                    }
                    uint64_t v250 = [v249 countByEnumeratingWithState:&v311 objects:v374 count:16];
                  }
                  while (v250);
                }

                id v258 = v248;
              }
              else
              {
                id v258 = v247;
              }
              if (![v258 count]) {
                goto LABEL_333;
              }
            }
            else
            {
              id v258 = v246;
            }
            [(PGHighlightEnrichmentValues *)v293 setMomentProcessedLocationByMomentUUID:v258];
LABEL_333:

            v222 = v297;
            goto LABEL_334;
          }
          v303 = (void *)MEMORY[0x1D25FED50](v93);
          v135 = self->_loggingConnection;
          os_signpost_id_t v136 = os_signpost_id_generate((os_log_t)v135);
          v137 = v135;
          v138 = v137;
          if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v138, OS_SIGNPOST_INTERVAL_BEGIN, v136, "PGHighlightTailorGenerateSummaryCuration", "", buf, 2u);
          }

          *(void *)mach_timebase_info info = 0;
          mach_timebase_info((mach_timebase_info_t)info);
          uint64_t v139 = mach_absolute_time();
          v140 = [(PGHighlightTailor *)self sortedCurationOfType:1 fromHighlight:v292];
          if (v283)
          {
            v335[0] = MEMORY[0x1E4F143A8];
            v335[1] = 3221225472;
            v335[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_212;
            v335[3] = &unk_1E68F03F8;
            v336 = v308;
            v337 = &v366;
            uint64_t v339 = 0x3F847AE147AE147BLL;
            v338 = &v370;
            v141 = [v309 summaryCurationWithHighlightInfo:v297 sharingFilter:0 progressBlock:v335];
          }
          else
          {
            v141 = 0;
          }
          if ((v282 & 0x100000000) != 0)
          {
            v330[0] = MEMORY[0x1E4F143A8];
            v330[1] = 3221225472;
            v330[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_2;
            v330[3] = &unk_1E68F03F8;
            v331 = v308;
            v332 = &v366;
            uint64_t v334 = 0x3F847AE147AE147BLL;
            v333 = &v370;
            v142 = [v309 summaryCurationWithHighlightInfo:v297 sharingFilter:1 progressBlock:v330];

            BOOL v143 = v141 != 0;
            int v144 = v282;
            if (!v141) {
              int v144 = 0;
            }
            if (v144 == 1 && v142)
            {
              id v145 = [v141 arrayByAddingObjectsFromArray:v142];
LABEL_219:
              v147 = v145;
              v148 = [v145 sortedArrayUsingDescriptors:v281];

              if (!v285 || ([v148 isEqualToArray:v140] & 1) == 0)
              {
                if (v148) {
                  v149 = v148;
                }
                else {
                  v149 = (void *)MEMORY[0x1E4F1CBF0];
                }
                [(PGHighlightEnrichmentValues *)v293 setSummaryCuration:v149];
              }
              uint64_t v150 = mach_absolute_time();
              unsigned int v151 = *(_DWORD *)info;
              unsigned int v152 = *(_DWORD *)&info[4];
              v153 = v138;
              v154 = v153;
              if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v153))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v154, OS_SIGNPOST_INTERVAL_END, v136, "PGHighlightTailorGenerateSummaryCuration", "", buf, 2u);
              }

              v155 = v154;
              if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&uint8_t buf[4] = "PGHighlightTailorGenerateSummaryCuration";
                *(_WORD *)&buf[12] = 2048;
                *(double *)&buf[14] = (float)((float)((float)((float)(v150 - v139) * (float)v151) / (float)v152)
                                            / 1000000.0);
                _os_log_impl(&dword_1D1805000, v155, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
              }

              goto LABEL_231;
            }
          }
          else
          {
            v142 = 0;
            BOOL v143 = v141 != 0;
          }
          if (v143) {
            v146 = v141;
          }
          else {
            v146 = v142;
          }
          id v145 = v146;
          goto LABEL_219;
        }
        context = (void *)MEMORY[0x1D25FED50](v93);
        v105 = self->_loggingConnection;
        os_signpost_id_t v106 = os_signpost_id_generate((os_log_t)v105);
        v107 = v105;
        v108 = v107;
        unint64_t v278 = v106 - 1;
        if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v108, OS_SIGNPOST_INTERVAL_BEGIN, v106, "PGHighlightTailorGenerateMomentTitles", "", buf, 2u);
        }
        os_signpost_id_t spid = v106;
        v277 = v108;

        *(void *)mach_timebase_info info = 0;
        mach_timebase_info((mach_timebase_info_t)info);
        uint64_t v275 = mach_absolute_time();
        v109 = [v309 momentTitleByMomentUUIDWithHighlightInfo:v297];
        v110 = v109;
        if (v285)
        {
          if (objc_msgSend(v109, "count", v106))
          {
            id v302 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v297 momentFetchResult];
            long long v342 = 0u;
            long long v343 = 0u;
            long long v340 = 0u;
            long long v341 = 0u;
            id obja = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v111 = [obja countByEnumeratingWithState:&v340 objects:v379 count:16];
            if (!v111) {
              goto LABEL_181;
            }
            uint64_t v112 = *(void *)v341;
            while (1)
            {
              for (uint64_t k = 0; k != v111; ++k)
              {
                if (*(void *)v341 != v112) {
                  objc_enumerationMutation(obja);
                }
                v114 = *(void **)(*((void *)&v340 + 1) + 8 * k);
                v115 = [v114 uuid];
                v116 = [v110 objectForKeyedSubscript:v115];

                v117 = [v116 title];
                v118 = [v117 stringValue];

                v119 = [v114 title];
                if ([v118 length] || !objc_msgSend(v119, "length"))
                {
                  BOOL v120 = ![v118 length] || v118 == v119;
                  if (v120 || ([v118 isEqualToString:v119] & 1) != 0)
                  {
                    v121 = [v116 subtitle];
                    v122 = [v121 stringValue];

                    v123 = [v114 localizedSubtitle];
                    if (([v122 length] || !objc_msgSend(v123, "length"))
                      && (![v122 length]
                       || v122 == v123
                       || ([v122 isEqualToString:v123] & 1) != 0))
                    {

                      goto LABEL_179;
                    }
                  }
                }
                v122 = [v114 uuid];
                [v302 setObject:v116 forKeyedSubscript:v122];
LABEL_179:
              }
              uint64_t v111 = [obja countByEnumeratingWithState:&v340 objects:v379 count:16];
              if (!v111)
              {
LABEL_181:

                id v124 = v302;
                goto LABEL_187;
              }
            }
          }
          id v124 = v110;
LABEL_187:
          if (![v124 count]) {
            goto LABEL_189;
          }
        }
        else
        {
          id v124 = v109;
        }
        -[PGHighlightEnrichmentValues setMomentTitleByMomentUUID:](v293, "setMomentTitleByMomentUUID:", v124, spid);
LABEL_189:
        uint64_t v125 = mach_absolute_time();
        unsigned int v126 = *(_DWORD *)info;
        unsigned int v127 = *(_DWORD *)&info[4];
        v128 = v277;
        v129 = v128;
        if (v278 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v128))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v129, OS_SIGNPOST_INTERVAL_END, spid, "PGHighlightTailorGenerateMomentTitles", "", buf, 2u);
        }

        v130 = v129;
        if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "PGHighlightTailorGenerateMomentTitles";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (float)((float)((float)((float)(v125 - v275) * (float)v126) / (float)v127) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v130, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        goto LABEL_195;
      }
      uint64_t v57 = self->_loggingConnection;
      os_signpost_id_t v58 = os_signpost_id_generate((os_log_t)v57);
      id v59 = v57;
      long long v60 = v59;
      if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v58, "PGHighlightTailorGenerateExtendedCuration", "", buf, 2u);
      }

      *(void *)mach_timebase_info info = 0;
      mach_timebase_info((mach_timebase_info_t)info);
      v301 = (void *)mach_absolute_time();
      if (v283)
      {
        v357[0] = MEMORY[0x1E4F143A8];
        v357[1] = 3221225472;
        v357[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_207;
        v357[3] = &unk_1E68F03F8;
        v358 = v308;
        v359 = &v366;
        uint64_t v361 = 0x3F847AE147AE147BLL;
        v360 = &v370;
        id v61 = [v309 extendedCurationWithHighlightInfo:v297 sharingFilter:0 progressBlock:v357];
        if (*((unsigned char *)v371 + 24))
        {
          long long v62 = MEMORY[0x1E4F14500];
          id v63 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = 297;
            *(_WORD *)&uint8_t buf[8] = 2080;
            *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Enrich/PGHighlightTailor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

LABEL_87:
          v279 = 0;
          int v67 = 0;
          goto LABEL_134;
        }
      }
      else
      {
        id v61 = 0;
      }
      if (HIDWORD(v282))
      {
        v352[0] = MEMORY[0x1E4F143A8];
        v352[1] = 3221225472;
        v352[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_208;
        v352[3] = &unk_1E68F03F8;
        v353 = v308;
        v354 = &v366;
        uint64_t v356 = 0x3F847AE147AE147BLL;
        v355 = &v370;
        id v64 = [v309 extendedCurationWithHighlightInfo:v297 sharingFilter:1 progressBlock:v352];
        if (*((unsigned char *)v371 + 24))
        {
          id v65 = MEMORY[0x1E4F14500];
          id v66 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = 305;
            *(_WORD *)&uint8_t buf[8] = 2080;
            *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Enrich/PGHighlightTailor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_87;
        }
      }
      else
      {
        id v64 = 0;
      }
      if (v282)
      {
        long long v350 = 0u;
        long long v351 = 0u;
        long long v348 = 0u;
        long long v349 = 0u;
        id v61 = v61;
        uint64_t v68 = [v61 countByEnumeratingWithState:&v348 objects:v381 count:16];
        if (v68)
        {
          v280 = v55;
          uint64_t v69 = *(void *)v349;
          double v70 = (double *)MEMORY[0x1E4F8E750];
          double v71 = *MEMORY[0x1E4F8E750];
          while (2)
          {
            for (uint64_t m = 0; m != v68; ++m)
            {
              if (*(void *)v349 != v69) {
                objc_enumerationMutation(v61);
              }
              [*(id *)(*((void *)&v348 + 1) + 8 * m) curationScore];
              if (v73 > v71)
              {
                char obj = 0;
                goto LABEL_101;
              }
            }
            uint64_t v68 = [v61 countByEnumeratingWithState:&v348 objects:v381 count:16];
            if (v68) {
              continue;
            }
            break;
          }
          char obj = 1;
LABEL_101:
          id v55 = v280;
        }
        else
        {
          double v70 = (double *)MEMORY[0x1E4F8E750];
          char obj = 1;
        }

        double v74 = v55;
        long long v346 = 0u;
        long long v347 = 0u;
        long long v344 = 0u;
        long long v345 = 0u;
        id v64 = v64;
        uint64_t v75 = [v64 countByEnumeratingWithState:&v344 objects:v380 count:16];
        if (v75)
        {
          uint64_t v76 = *(void *)v345;
          double v77 = *v70;
LABEL_105:
          uint64_t v78 = 0;
          while (1)
          {
            if (*(void *)v345 != v76) {
              objc_enumerationMutation(v64);
            }
            [*(id *)(*((void *)&v344 + 1) + 8 * v78) curationScore];
            if (v79 > v77) {
              break;
            }
            if (v75 == ++v78)
            {
              uint64_t v75 = [v64 countByEnumeratingWithState:&v344 objects:v380 count:16];
              if (v75) {
                goto LABEL_105;
              }
              goto LABEL_111;
            }
          }

          id v55 = v74;
          if ((obj & 1) == 0) {
            goto LABEL_183;
          }
          long long v80 = v61;
          id v61 = 0;
        }
        else
        {
LABEL_111:

          id v55 = v74;
          if (obj)
          {
LABEL_183:
            BOOL v81 = v61 != 0;
            if (v61 && v64)
            {
              id v83 = [v61 arrayByAddingObjectsFromArray:v64];
LABEL_121:
              id v84 = v83;
              v85 = [v83 sortedArrayUsingDescriptors:v281];

              if (!v285 || ([v85 isEqualToArray:v55] & 1) == 0)
              {
                if (v85) {
                  uint64_t v86 = v85;
                }
                else {
                  uint64_t v86 = (void *)MEMORY[0x1E4F1CBF0];
                }
                [(PGHighlightEnrichmentValues *)v293 setExtendedCuration:v86];
              }
              uint64_t v87 = mach_absolute_time();
              unsigned int v88 = *(_DWORD *)info;
              unsigned int v89 = *(_DWORD *)&info[4];
              uint64_t v90 = v60;
              uint64_t v91 = v90;
              if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v91, OS_SIGNPOST_INTERVAL_END, v58, "PGHighlightTailorGenerateExtendedCuration", "", buf, 2u);
              }

              v92 = v91;
              if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&uint8_t buf[4] = "PGHighlightTailorGenerateExtendedCuration";
                *(_WORD *)&buf[12] = 2048;
                *(double *)&buf[14] = (float)((float)((float)((float)(v87 - (unint64_t)v301) * (float)v88)
                                                    / (float)v89)
                                            / 1000000.0);
                _os_log_impl(&dword_1D1805000, v92, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
              }

              char v54 = v297;
              id v56 = v85;
              goto LABEL_133;
            }
LABEL_117:
            if (v81) {
              id v82 = v61;
            }
            else {
              id v82 = v64;
            }
            id v83 = v82;
            goto LABEL_121;
          }
          long long v80 = v64;
          id v64 = 0;
        }
      }
      BOOL v81 = v61 != 0;
      goto LABEL_117;
    }
    uint64_t v30 = self->_loggingConnection;
    os_signpost_id_t v31 = os_signpost_id_generate((os_log_t)v30);
    v32 = v30;
    uint64_t v33 = v32;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "PGHighlightTailorGenerateKeyAsset", "", buf, 2u);
    }

    *(void *)mach_timebase_info info = 0;
    mach_timebase_info((mach_timebase_info_t)info);
    v300 = (void *)mach_absolute_time();
    if (v283)
    {
      v364[0] = MEMORY[0x1E4F143A8];
      v364[1] = 3221225472;
      v364[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke;
      v364[3] = &unk_1E68F03F8;
      v365[0] = v308;
      v365[1] = &v366;
      v365[3] = (id)0x3F847AE147AE147BLL;
      v365[2] = &v370;
      v287 = [v309 keyAssetWithHighlightInfo:v297 sharingFilter:0 graph:v307 progressBlock:v364];
      if (*((unsigned char *)v371 + 24))
      {
        uint64_t v34 = v365;
        mach_timebase_info v35 = MEMORY[0x1E4F14500];
        id v36 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 241;
          *(_WORD *)&uint8_t buf[8] = 2080;
          *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Enrich/PGHighlightTailor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v288 = 0;
LABEL_44:

        id v286 = 0;
        int v39 = 0;
        goto LABEL_63;
      }
      if (!v285 || ([v287 isEqual:v25] & 1) == 0) {
        [(PGHighlightEnrichmentValues *)v293 setKeyAssetPrivate:v287];
      }

      id v29 = v287;
    }
    else
    {
      id v29 = 0;
    }
    if (HIDWORD(v282))
    {
      v287 = v29;
      v362[0] = MEMORY[0x1E4F143A8];
      v362[1] = 3221225472;
      v362[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_205;
      v362[3] = &unk_1E68F03F8;
      v363[0] = v308;
      v363[1] = &v366;
      v363[3] = (id)0x3F847AE147AE147BLL;
      v363[2] = &v370;
      id v288 = [v309 keyAssetWithHighlightInfo:v297 sharingFilter:1 graph:v307 progressBlock:v362];
      if (*((unsigned char *)v371 + 24))
      {
        uint64_t v34 = v363;
        uint64_t v37 = MEMORY[0x1E4F14500];
        id v38 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 251;
          *(_WORD *)&uint8_t buf[8] = 2080;
          *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Enrich/PGHighlightTailor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_44;
      }
      if (!v285 || ([v288 isEqual:v27] & 1) == 0) {
        [(PGHighlightEnrichmentValues *)v293 setKeyAssetShared:v288];
      }
    }
    else
    {
      id v288 = 0;
    }
    if (v282)
    {
      uint64_t v40 = +[PGHighlightEnrichmentUtilities mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:](PGHighlightEnrichmentUtilities, "mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:", v29, v288, [v310 kind] == 3);
      id v286 = +[PGHighlightEnrichmentUtilities keyAssetForMixedSharingCompositionKeyAssetRelationship:v40 keyAssetPrivate:v29 keyAssetShared:v288];
    }
    else
    {
      uint64_t v40 = 0;
      id v286 = 0;
    }
    if (!v285 || [v292 mixedSharingCompositionKeyAssetRelationship] != v40)
    {
      uint64_t v41 = [NSNumber numberWithUnsignedShort:v40];
      [(PGHighlightEnrichmentValues *)v293 setMixedSharingCompositionKeyAssetRelationshipValue:v41];
    }
    uint64_t v42 = mach_absolute_time();
    unsigned int v43 = *(_DWORD *)info;
    unsigned int v44 = *(_DWORD *)&info[4];
    uint64_t v45 = v33;
    id v46 = v45;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v46, OS_SIGNPOST_INTERVAL_END, v31, "PGHighlightTailorGenerateKeyAsset", "", buf, 2u);
    }

    double v47 = v46;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "PGHighlightTailorGenerateKeyAsset";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v42 - (unint64_t)v300) * (float)v43) / (float)v44)
                                  / 1000000.0);
      _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    goto LABEL_62;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 175;
    *(_WORD *)&uint8_t buf[8] = 2080;
    *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Enrich/PGHighlightTailor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  __int16 v16 = 0;
LABEL_372:
  _Block_object_dispose(&v366, 8);
  _Block_object_dispose(&v370, 8);

  return v16;
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_205(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_207(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.05 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_208(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.05 + 0.15);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_212(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.4);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

uint64_t __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_214(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a2;
  unint64_t v8 = a3;
  id v9 = a4;
  BOOL v10 = v9;
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v9) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = *(unsigned char *)(v11 + 24) == 0;
  }
  char v13 = !v12;
  *(unsigned char *)(v11 + 24) = v13;
  if (*(unsigned char *)(a1 + 56))
  {
    if (v9)
    {
      double v14 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        char v15 = *(void **)(a1 + 40);
        __int16 v16 = v14;
        double v17 = [v15 uuid];
        int v20 = 138412546;
        int v21 = v17;
        __int16 v22 = 2112;
        uint64_t v23 = v10;
        _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Failed to generate title for highlight %@: %@", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_13;
    }
    if (!(v7 | v8))
    {
LABEL_13:
      uint64_t v18 = 0;
      goto LABEL_14;
    }
    uint64_t v18 = 1;
    if (v7 && v8) {
      uint64_t v18 = [(id)v7 isEqualToString:v8] ^ 1;
    }
  }
  else
  {
    uint64_t v18 = 1;
  }
LABEL_14:

  return v18;
}

- (unint64_t)tailorOptionsAllowedForHighlight:(id)a3 originalOptions:(unint64_t)a4
{
  int v5 = [a3 kind];
  uint64_t v6 = -1073741824;
  if (v5 == 3) {
    uint64_t v6 = -1073741793;
  }
  if (!v5) {
    uint64_t v6 = -1073741569;
  }
  return v6 & a4;
}

- (id)computeChangedVisibilityScoresForItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        -[PGHighlightTailor highlightVisibilityWeightForItem:](self, "highlightVisibilityWeightForItem:", v11, (void)v17);
        double v13 = v12;
        double v14 = (void *)MEMORY[0x1E4F38EB8];
        [v11 clsHighlightVisibilityScore];
        if ((objc_msgSend(v14, "isScore:closeToValue:") & 1) == 0)
        {
          char v15 = [NSNumber numberWithDouble:v13];
          [v5 setObject:v15 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (double)highlightVisibilityWeightForItem:(id)a3
{
  id v3 = a3;
  [v3 clsContentScore];
  double v5 = v4;
  [v3 clsAutoplaySuggestionScore];
  double v7 = v6;
  [v3 clsBehavioralScore];
  float v9 = v8;
  if ([v3 isVideo])
  {
    [v3 clsDuration];
    if (v10 >= 2.0 && ([v3 clsHasPoorResolution] & 1) == 0)
    {
      int v12 = [v3 clsIsLongExposure];
      int v11 = 1;
      goto LABEL_7;
    }
  }
  int v11 = [v3 clsIsLoopOrBounce];
  int v12 = [v3 clsIsLongExposure];
  double v13 = 0.0;
  if (v11) {
LABEL_7:
  }
    double v13 = 20.0;
  if (v7 > 0.5) {
    int v14 = 1;
  }
  else {
    int v14 = v11;
  }
  double v15 = 100.0;
  if (v12) {
    double v15 = 0.0;
  }
  if (!v14) {
    double v15 = 0.0;
  }
  double v16 = (v13 + v15 + v5 * 10.0 + v9) / 131.0;

  return v16;
}

- (id)assetSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v6[1] = v3;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)PGHighlightTailor;
  return [(PGHighlightTailor *)&v3 init];
}

- (PGHighlightTailor)initWithWorkingContext:(id)a3
{
  v26[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PGHighlightTailor;
  double v6 = [(PGHighlightTailor *)&v25 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workingContext, a3);
    float v8 = [v5 curationManager];
    float v9 = [v5 loggingConnection];
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = v9;
    int v11 = v9;

    int v12 = [[PGAggregationEnrichmentProfile alloc] initWithCurationManager:v8 loggingConnection:v11];
    v26[0] = v12;
    double v13 = [(PGDayGroupAbstractEnrichmentProfile *)[PGTripEnrichmentProfile alloc] initWithCurationManager:v8 loggingConnection:v11];
    v26[1] = v13;
    int v14 = [(PGDefaultEnrichmentProfile *)[PGCompleteEnrichmentProfile alloc] initWithCurationManager:v8 loggingConnection:v11];
    v26[2] = v14;
    double v15 = [(PGDefaultEnrichmentProfile *)[PGSceneCompleteEnrichmentProfile alloc] initWithCurationManager:v8 loggingConnection:v11];
    v26[3] = v15;
    double v16 = [(PGDefaultEnrichmentProfile *)[PGPartialEnrichmentProfile alloc] initWithCurationManager:v8 loggingConnection:v11];
    v26[4] = v16;
    long long v17 = [[PGDefaultEnrichmentProfile alloc] initWithCurationManager:v8 loggingConnection:v11];
    v26[5] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:6];
    enrichmentProfiles = v7->_enrichmentProfiles;
    v7->_enrichmentProfiles = (NSArray *)v18;

    dispatch_group_t v20 = dispatch_group_create();
    enrichmentCommitGroup = v7->_enrichmentCommitGroup;
    v7->_enrichmentCommitGroup = (OS_dispatch_group *)v20;

    uint64_t v22 = [[PGMoodGenerationContext alloc] initWithReferenceDate:0];
    moodGenerationContext = v7->_moodGenerationContext;
    v7->_moodGenerationContext = v22;
  }
  return v7;
}

+ (BOOL)itemScoreIsAutoplayable:(double)a3
{
  return a3 * 131.0 >= 100.0;
}

@end