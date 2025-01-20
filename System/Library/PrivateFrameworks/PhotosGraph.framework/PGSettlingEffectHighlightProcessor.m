@interface PGSettlingEffectHighlightProcessor
+ (BOOL)candidate:(id)a3 passesFilteringWithStatistics:(id *)a4;
- ($A9CF91C44B74F55383E7EE3F9750FD28)statistics;
- (PGSettlingEffectHighlightProcessor)initWithPhotoLibrary:(id)a3;
- (id)fetchHighlightCandidatesWithProgressReporter:(id)a3;
- (void)logStatistics:(id *)a3;
@end

@implementation PGSettlingEffectHighlightProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- ($A9CF91C44B74F55383E7EE3F9750FD28)statistics
{
  long long v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3.var3;
  *(_OWORD *)&retstr->var3.var1 = v3;
  retstr->var3.var5 = self[1].var3.var2;
  return self;
}

- (void)logStatistics:(id *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int var2 = a3->var2;
    int v8 = 67109120;
    int v9 = var2;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGSettlingEffectHighlightProcessor] %d on-demand settling effect score requested", (uint8_t *)&v8, 8u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int var1 = a3->var1;
    int v8 = 67109120;
    int v9 = var1;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGSettlingEffectHighlightProcessor] Filtered out %d for settlingEffectScore", (uint8_t *)&v8, 8u);
  }
}

- (id)fetchHighlightCandidatesWithProgressReporter:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 44;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectHighlightProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    int v66 = 0;
    memset(buf, 0, sizeof(buf));
    v6 = self->_loggingConnection;
    os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)v6);
    int v8 = v6;
    int v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v62 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchHighlightCandidates", "", v62, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v10 = mach_absolute_time();
    v11 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v12 = +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:1];
    [v11 setFetchPropertySets:v12];

    v13 = [MEMORY[0x1E4F8E858] settlingEffectAssetInternalSortDescriptors];
    [v11 setInternalSortDescriptors:v13];

    v14 = [MEMORY[0x1E4F8E858] fetchLivePhotoTabHighlightCandidateAssetsWithOptions:v11 excludeExistingWallpapers:1 statistics:(unint64_t)buf | 0xC];
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      v16 = loggingConnection;
      int v17 = [v14 count];
      *(_DWORD *)v62 = 67109120;
      *(_DWORD *)&v62[4] = v17;
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[PGSettlingEffectHighlightProcessor] Found %d highlight candidate assets", v62, 8u);
    }
    if ([v4 isCancelledWithProgress:0.2])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v62 = 67109378;
        *(_DWORD *)&v62[4] = 56;
        *(_WORD *)&v62[8] = 2080;
        *(void *)&v62[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectHighlightProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v62, 0x12u);
      }
      v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      unint64_t v49 = v7 - 1;
      os_signpost_id_t spid = v7;
      v51 = v11;
      v52 = v9;
      id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v18 = [v14 count];
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      unint64_t v50 = v18 / 0xC8;
      double v21 = (1.0 / (double)v18 + 1.0) * 0.8;
      unint64_t v22 = 0x1E4F28000uLL;
      v54 = v14;
      do
      {
        uint64_t v53 = v20;
        v55 = objc_msgSend(*(id *)(v22 + 3424), "indexSetWithIndexesInRange:");
        v23 = objc_msgSend(v14, "objectsAtIndexes:");
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v57 objects:v64 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v58;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v58 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v57 + 1) + 8 * i);
              v30 = (void *)MEMORY[0x1D25FED50]();
              v31 = [[PGSettlingEffectWallpaperSuggestionCandidate alloc] initWithAsset:v29 suggestion:0];
              if ([(id)objc_opt_class() candidate:v31 passesFilteringWithStatistics:buf])objc_msgSend(v56, "addObject:", v31); {
              if ([v4 isCancelledWithProgress:v21 * (double)(unint64_t)(v19 + i) + 0.2])
              }
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v62 = 67109378;
                  *(_DWORD *)&v62[4] = 78;
                  *(_WORD *)&v62[8] = 2080;
                  *(void *)&v62[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffec"
                                        "tHighlightProcessor.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v62, 0x12u);
                }

                v5 = (void *)MEMORY[0x1E4F1CBF0];
                v11 = v51;
                int v9 = v52;
                v14 = v54;
                goto LABEL_32;
              }
            }
            v19 += i;
            uint64_t v26 = [v24 countByEnumeratingWithState:&v57 objects:v64 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }

        v32 = self->_loggingConnection;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = v32;
          uint64_t v34 = [v55 firstIndex];
          uint64_t v35 = [v55 lastIndex];
          *(_DWORD *)v62 = 134218240;
          *(void *)&v62[4] = v34;
          *(_WORD *)&v62[12] = 2048;
          *(void *)&v62[14] = v35;
          _os_log_debug_impl(&dword_1D1805000, v33, OS_LOG_TYPE_DEBUG, "[PGSettlingEffectHighlightProcessor] processed candidates from %lu to %lu", v62, 0x16u);
        }
        v14 = v54;
        uint64_t v20 = v53 + 1;
        unint64_t v22 = 0x1E4F28000;
      }
      while (v53 != v50);
      v37 = +[PGSettlingEffectWallpaperSuggestionCandidate sortDescriptorsForProcessing];
      v5 = [v56 sortedArrayUsingDescriptors:v37];

      *(_DWORD *)buf = [v5 count];
      v38 = self->_loggingConnection;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v40 = v38;
        int v41 = [v56 count];
        *(_DWORD *)v62 = 67109120;
        *(_DWORD *)&v62[4] = v41;
        _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_INFO, "[PGSettlingEffectHighlightProcessor] Found %d candidates", v62, 8u);
      }
      uint64_t v42 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      int v9 = v52;
      v45 = v52;
      v46 = v45;
      v11 = v51;
      if (v49 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        *(_WORD *)v62 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v46, OS_SIGNPOST_INTERVAL_END, spid, "FetchHighlightCandidates", "", v62, 2u);
      }

      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v62 = 136315394;
        *(void *)&v62[4] = "FetchHighlightCandidates";
        *(_WORD *)&v62[12] = 2048;
        *(double *)&v62[14] = (float)((float)((float)((float)(v42 - v10) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v46, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v62, 0x16u);
      }
      *(_OWORD *)v62 = *(_OWORD *)buf;
      *(_OWORD *)&v62[16] = *(_OWORD *)&buf[16];
      int v63 = v66;
      [(PGSettlingEffectHighlightProcessor *)self logStatistics:v62];
      long long v47 = *(_OWORD *)&buf[16];
      *(_OWORD *)&self->_statistics.numberOfHighlightCandidatesForFRC = *(_OWORD *)buf;
      *(_OWORD *)&self->_statistics.highlightStatistics.numberOfHighlightCandidates = v47;
      self->_statistics.highlightStatistics.numberOfEliminationsThruDeviceOwner = v66;
LABEL_32:
    }
  }

  return v5;
}

- (PGSettlingEffectHighlightProcessor)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSettlingEffectHighlightProcessor;
  v6 = [(PGSettlingEffectHighlightProcessor *)&v11 init];
  os_signpost_id_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    os_log_t v8 = os_log_create("com.apple.PhotosGraph", "suggestions");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v8;
  }
  return v7;
}

+ (BOOL)candidate:(id)a3 passesFilteringWithStatistics:(id *)a4
{
  id v5 = [a3 asset];
  char v12 = 0;
  +[PGSettlingEffectScoreHelper analyzedSettlingEffectScoreForAsset:v5 requestedOnDemand:&v12];
  float v7 = v6;
  if (v12) {
    ++a4->var2;
  }
  os_log_t v8 = [v5 mediaAnalysisProperties];
  +[PGSettlingEffectWallpaperSuggesterFilteringContext minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:](PGSettlingEffectWallpaperSuggesterFilteringContext, "minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:", 0, [v8 mediaAnalysisVersion]);
  double v10 = v9;

  if (v10 > v7) {
    ++a4->var1;
  }

  return v10 <= v7;
}

@end