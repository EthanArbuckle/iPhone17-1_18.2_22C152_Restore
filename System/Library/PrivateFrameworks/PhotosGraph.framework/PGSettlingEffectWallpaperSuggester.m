@interface PGSettlingEffectWallpaperSuggester
+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 statistics:(id *)a6;
+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6;
+ (id)analyticsPayloadFromFRCFilteringStatistics:(id *)a3 photoLibrary:(id)a4;
+ (id)analyticsPayloadFromHighlightStatistics:(id *)a3;
+ (id)analyticsPayloadFromPostFilteringStatistics:(id)a3;
+ (id)prefilteringInternalPredicateWithForbiddenAssetUUIDs:(id)a3;
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
- (BOOL)hasEnoughSettlingEffectAssets;
- (PGSettlingEffectWallpaperSuggester)initWithSession:(id)a3;
- (PGSettlingEffectWallpaperSuggesterFilteringContext)filteringContext;
- (id)consolidatedCandidatesFromWallpaperCandidates:(id)a3 highlightCandidates:(id)a4;
- (id)fetchCandidateSuggestions;
- (id)fetchSortedWallpaperCandidatesWithProgressReporter:(id)a3;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (unint64_t)totalLivePhotos;
- (void)deleteLegacySettlingEffectSuggestions;
- (void)processFRCFromCandidates:(id)a3 withProgressReporter:(id)a4;
- (void)sendSettlingEffectStatisticsEvent;
- (void)setAvailableFeaturesForCandidates:(id)a3 pass:(BOOL)a4;
- (void)setFilteringContext:(id)a3;
@end

@implementation PGSettlingEffectWallpaperSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteringContext, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong((id *)&self->_assetGater, 0);
}

- (void)setFilteringContext:(id)a3
{
}

- (PGSettlingEffectWallpaperSuggesterFilteringContext)filteringContext
{
  return self->_filteringContext;
}

- (void)sendSettlingEffectStatisticsEvent
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PGAbstractSuggester *)self session];
  v5 = objc_opt_class();
  v6 = [v4 photoLibrary];
  long long v7 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfEliminationsThruSettlingEffectScore;
  long long v26 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruVideoDecision;
  long long v27 = v7;
  long long v28 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruCrop;
  uint64_t v29 = *(void *)&self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates;
  long long v8 = *(_OWORD *)&self->_filteringStatistics.postfilteringStatistics.numberOfEliminationsThruSettlingEffectScore;
  long long v22 = *(_OWORD *)&self->_filteringStatistics.numberOfLivePhotos;
  long long v23 = v8;
  long long v9 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStabilization;
  long long v24 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruResourceAvailability;
  long long v25 = v9;
  v10 = [v5 analyticsPayloadFromFRCFilteringStatistics:&v22 photoLibrary:v6];

  [v3 addEntriesFromDictionary:v10];
  v11 = [(id)objc_opt_class() analyticsPayloadFromPostFilteringStatistics:*(void *)&self->_filteringStatistics.postfilteringStatistics];
  [v3 addEntriesFromDictionary:v11];
  long long v12 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruGenericError;
  long long v22 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruFeatureDisabled;
  long long v23 = v12;
  long long v24 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruMetadataIntegrity;
  LODWORD(v25) = self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStillTransition;
  v13 = PFPosterSettlingEffectGatingStatisticsAnalyticsPayload();
  [v3 addEntriesFromDictionary:v13];
  v14 = objc_opt_class();
  long long v15 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfHighlightCandidates;
  long long v22 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfHighlightCandidatesForFRC;
  long long v23 = v15;
  LODWORD(v24) = self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruDeviceOwner;
  v16 = [v14 analyticsPayloadFromHighlightStatistics:&v22];
  [v3 addEntriesFromDictionary:v16];
  v17 = [v4 workingContext];
  v18 = [v17 analytics];
  v19 = (uint64_t *)MEMORY[0x1E4F8D240];
  [v18 sendEvent:*MEMORY[0x1E4F8D240] withPayload:v3];

  v20 = [v4 loggingConnection];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = *v19;
    LODWORD(v22) = 138412290;
    *(void *)((char *)&v22 + 4) = v21;
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Sent %@ event", (uint8_t *)&v22, 0xCu);
  }
}

- (unint64_t)totalLivePhotos
{
  v2 = [(PGAbstractSuggester *)self session];
  id v3 = [v2 photoLibrary];

  v4 = (void *)MEMORY[0x1E4F38EE8];
  v5 = [v3 librarySpecificFetchOptions];
  v6 = [v4 fetchAssetCollectionsWithType:2 subtype:213 options:v5];
  long long v7 = [v6 firstObject];

  long long v8 = [v3 librarySpecificFetchOptions];
  [v8 setShouldPrefetchCount:1];
  long long v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v8];
  unint64_t v10 = [v9 count];

  return v10;
}

- (BOOL)hasEnoughSettlingEffectAssets
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PGAbstractSuggester *)self session];
  id v3 = [v2 photoLibrary];
  v4 = [v3 librarySpecificFetchOptions];

  [v4 setFetchLimit:100];
  v18[0] = *MEMORY[0x1E4F394A8];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v4 setFetchPropertySets:v5];

  v6 = [MEMORY[0x1E4F8E858] settlingEffectAssetInternalSortDescriptors];
  [v4 setInternalSortDescriptors:v6];

  long long v7 = [MEMORY[0x1E4F8E858] fetchLivePhotoTabHighlightSettlingEffectAssetsWithOptions:v4 excludeExistingWallpapers:0];
  unint64_t v8 = [v7 count];
  long long v9 = @"Not enough content";
  if (v8 > 0x63) {
    long long v9 = @"Has enough content";
  }
  unint64_t v10 = v9;
  v11 = [v2 loggingConnection];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109634;
    v13[1] = [v7 count];
    __int16 v14 = 1024;
    int v15 = 100;
    __int16 v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Found %d (target:%d) FRC eligible highlight assets. %@", (uint8_t *)v13, 0x18u);
  }

  return v8 > 0x63;
}

- (void)processFRCFromCandidates:(id)a3 withProgressReporter:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x2020000000;
  char v92 = 0;
  id v72 = a4;
  int v6 = [v72 isCancelledWithProgress:0.0];
  *((unsigned char *)v90 + 24) = v6;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 497;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_74;
  }
  v59 = [(PGAbstractSuggester *)self session];
  long long v7 = [v59 loggingConnection];
  unint64_t v64 = [v71 count];
  v58 = [MEMORY[0x1E4F1C9C8] date];
  v63 = [v58 dateByAddingTimeInterval:480.0];
  unint64_t v8 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    long long v9 = [NSNumber numberWithDouble:480.0];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v64;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v58;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v9;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v63;
    _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Running L1 & FRC Gating for %d candidates. StartingDate: %@, MaxProcessingTime: %@s, MaxProcessingDate: %@", buf, 0x26u);
  }
  unint64_t v10 = v8;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  long long v12 = v10;
  v13 = v12;
  os_signpost_id_t spid = v11;
  unint64_t v57 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGSettlingEffectWallpaperSuggesterFRCGating", "", buf, 2u);
  }
  v70 = v13;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v55 = mach_absolute_time();
  __int16 v14 = [PGSettlingEffectConfig alloc];
  int v15 = [v59 photoLibrary];
  v61 = [(PGSettlingEffectConfig *)v14 initWithPhotoLibrary:v15 loggingConnection:v70];

  unint64_t v65 = [(PGSettlingEffectConfig *)v61 maxL1FailuresAllowed];
  unint64_t v62 = [(PGSettlingEffectConfig *)v61 maxFRCRequestsAllowed];
  if ([(PGSettlingEffectWallpaperSuggester *)self hasEnoughSettlingEffectAssets])
  {
    unint64_t v65 = [(PGSettlingEffectConfig *)v61 defaultL1FailuresAllowed];
    unint64_t v62 = [(PGSettlingEffectConfig *)v61 defaultFRCRequestsAllowed];
  }
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v64)
  {
    uint64_t v77 = 0;
    int v67 = 0;
    int v60 = 0;
    goto LABEL_63;
  }
  unint64_t v16 = 0;
  int v67 = 0;
  unint64_t v74 = 0;
  unint64_t v75 = 0;
  int v60 = 0;
  unint64_t v73 = 0;
  int v69 = 0;
  uint64_t v77 = 0;
  unint64_t v78 = v64 + 1;
  double v17 = 1.0 / (double)v64;
  while (1)
  {
    context = (void *)MEMORY[0x1D25FED50]();
    v18 = [v71 objectAtIndexedSubscript:v16];
    v79 = [v18 asset];
    v19 = [v18 suggestion];
    BOOL v20 = v19 != 0;

    if (v19) {
      uint64_t v21 = @"suggestion";
    }
    else {
      uint64_t v21 = @"highlight";
    }
    long long v22 = v70;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = [v79 uuid];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v16 + 1;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v64;
      *(_WORD *)&buf[14] = 2112;
      *(void *)&buf[16] = v21;
      *(_WORD *)&buf[24] = 2112;
      *(void *)&buf[26] = v23;
      _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Check FRC eligibility (%d/%d) for %@ asset: %@", buf, 0x22u);
    }
    long long v24 = self;
    assetGater = self->_assetGater;
    if (assetGater)
    {
      [(PGWallpaperSuggestionAssetGater *)assetGater settlingEffectGatingStatistics];
    }
    else
    {
      int v87 = 0;
      memset(v86, 0, sizeof(v86));
    }
    int v26 = +[PGWallpaperSuggestionAssetGater numberOfFailuresAfterStabilizationFromStatistics:v86];
    long long v27 = v24->_assetGater;
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __84__PGSettlingEffectWallpaperSuggester_processFRCFromCandidates_withProgressReporter___block_invoke;
    v82[3] = &unk_1E68E5668;
    v84 = &v89;
    id v28 = v72;
    id v83 = v28;
    double v85 = v17 * (double)v16;
    uint64_t v29 = [(PGWallpaperSuggestionAssetGater *)v27 gateAsset:v79 progressBlock:v82];
    uint64_t v30 = v29;
    if (v19)
    {
      if ([v29 passesSettlingEffect]) {
        v31 = v68;
      }
      else {
        v31 = v66;
      }
      [v31 addObject:v18];
    }
    else
    {
      v67 += [v29 passesSettlingEffect];
    }
    if ([(PGWallpaperSuggestionAssetGater *)v24->_assetGater isLastGatingCallingMediaAnalysis])
    {
      v32 = v24->_assetGater;
      if (v32)
      {
        [(PGWallpaperSuggestionAssetGater *)v32 settlingEffectGatingStatistics];
      }
      else
      {
        int v81 = 0;
        memset(v80, 0, sizeof(v80));
      }
      int v33 = +[PGWallpaperSuggestionAssetGater numberOfFailuresAfterStabilizationFromStatistics:v80];
      if (v33 > v26) {
        unint64_t v34 = v74;
      }
      else {
        unint64_t v34 = v74 + 1;
      }
      unint64_t v35 = v75;
      if (v33 > v26) {
        unint64_t v35 = v75 + 1;
      }
      unint64_t v74 = v34;
      unint64_t v75 = v35;
      int v36 = [v30 passesSettlingEffect];
      unsigned int v37 = [v30 didTimeout];
      v38 = [MEMORY[0x1E4F1C9C8] date];
      [v63 timeIntervalSinceDate:v38];
      double v40 = v39;
      v69 += v36;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)&buf[4] = v75 + v74;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v75;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v74 - v69;
        *(_WORD *)&buf[20] = 1024;
        *(_DWORD *)&buf[22] = v69;
        *(_WORD *)&buf[26] = 2048;
        *(double *)&buf[28] = v40;
        _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Attempted FRC for %d items, %d failed L1, %d failed FRC, %d passed. %.3fs processing time left.", buf, 0x24u);
      }
      v73 += v37;
      if (v75 >= v65 || v74 >= v62 || v73 > 1 || v40 < 0.0)
      {
        self = v24;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67110912;
          *(_DWORD *)&buf[4] = v75;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v65;
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&buf[16] = v74;
          *(_WORD *)&buf[20] = 1024;
          *(_DWORD *)&buf[22] = v62;
          *(_WORD *)&buf[26] = 1024;
          *(_DWORD *)&buf[28] = v73;
          *(_WORD *)&buf[32] = 1024;
          *(_DWORD *)&buf[34] = 1;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = v78;
          *(_WORD *)&buf[44] = 2048;
          *(double *)&buf[46] = v40;
          _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Reached (%d/%d) MAD L1 failures OR (%d/%d) FRC requests OR (%d/%d) timeouts allowed. %d untried. %.3fs processing time left.", buf, 0x36u);
        }
        if (v24->_noLimit)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] no limit mode is enabled, continue generation", buf, 2u);
          }
          int v42 = 4;
        }
        else
        {
          int v42 = 2;
        }

        int v60 = v78;
        goto LABEL_57;
      }
    }
    self = v24;
    if (*((unsigned char *)v90 + 24))
    {
      *((unsigned char *)v90 + 24) = 1;
    }
    else
    {
      char v41 = [v28 isCancelledWithProgress:v17 * (double)v16];
      *((unsigned char *)v90 + 24) = v41;
      self = v24;
      if ((v41 & 1) == 0)
      {
        int v42 = 0;
        goto LABEL_57;
      }
    }
    int v42 = 1;
    v43 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 606;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_57:

    LODWORD(v77) = v77 + v20;
    HIDWORD(v77) += !v20;
    if (v42)
    {
      if (v42 != 4) {
        break;
      }
    }
    ++v16;
    if (--v78 == 1) {
      goto LABEL_63;
    }
  }
  if (v42 == 2)
  {
LABEL_63:
    v44 = self->_assetGater;
    if (v44)
    {
      [(PGWallpaperSuggestionAssetGater *)v44 settlingEffectGatingStatistics];
      int v45 = v67;
      v46 = (void *)&unk_1D1F4E000;
    }
    else
    {
      memset(buf, 0, 52);
      int v45 = v67;
      v46 = &unk_1D1F4E000;
    }
    long long v47 = *(_OWORD *)&buf[16];
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruFeatureDisabled = *(_OWORD *)buf;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruGenericError = v47;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruMetadataIntegrity = *(_OWORD *)&buf[32];
    self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStillTransition = *(_DWORD *)&buf[48];
    [(PGWallpaperSuggestionAssetGater *)self->_assetGater logCurrentSettlingEffectGatingStatisticsWithPrefix:self->_loggingPrefix];
    [(PGWallpaperSuggestionAssetGater *)self->_assetGater logCurrentGatingStatisticsWithPrefix:self->_loggingPrefix];
    [(PGSettlingEffectWallpaperSuggester *)self setAvailableFeaturesForCandidates:v68 pass:1];
    [(PGSettlingEffectWallpaperSuggester *)self setAvailableFeaturesForCandidates:v66 pass:0];
    self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates = [v68 count];
    self->_filteringStatistics.numberOfFRCEligibleAssetCandidates = v45;
    v48 = v70;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      int v49 = [v68 count];
      *(_DWORD *)buf = v46[305];
      *(_DWORD *)&buf[4] = v49;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v77;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v45;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = HIDWORD(v77);
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v60;
      _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Found %d FRC eligible wallpapers from %d wallpaper candidates, %d FRC eligible highlight assets from %d candidates, %d untried", buf, 0x20u);
    }

    uint64_t v50 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v53 = v48;
    v54 = v53;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v54, OS_SIGNPOST_INTERVAL_END, spid, "PGSettlingEffectWallpaperSuggesterFRCGating", "", buf, 2u);
    }

    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "PGSettlingEffectWallpaperSuggesterFRCGating";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v50 - v55) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

LABEL_74:
  _Block_object_dispose(&v89, 8);
}

uint64_t __84__PGSettlingEffectWallpaperSuggester_processFRCFromCandidates_withProgressReporter___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:*(double *)(a1 + 48)];
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

- (id)consolidatedCandidatesFromWallpaperCandidates:(id)a3 highlightCandidates:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v38 = a4;
  long long v7 = [(PGAbstractSuggester *)self session];
  unint64_t v8 = [v7 loggingConnection];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  context = (void *)MEMORY[0x1D25FED50]();
  unint64_t v10 = (void *)MEMORY[0x1E4F8E858];
  os_signpost_id_t v11 = [v7 photoLibrary];
  long long v12 = [v10 fetchSettlingEffectSuggestionsInPhotoLibrary:v11];

  uint64_t v13 = [v12 count];
  __int16 v14 = (void *)MEMORY[0x1E4F8E858];
  unsigned int v37 = v7;
  int v15 = [v7 photoLibrary];
  unint64_t v16 = [v15 librarySpecificFetchOptions];
  double v17 = [v14 fetchLivePhotoTabHighlightSettlingEffectAssetsWithOptions:v16 excludeExistingWallpapers:1];

  uint64_t v18 = [v17 count];
  double v39 = v8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v19 = v8;
    *(_DWORD *)buf = 67109632;
    int v41 = [v12 count];
    __int16 v42 = 1024;
    int v43 = [v17 count];
    __int16 v44 = 1024;
    int v45 = v13 - v18;
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Found %d settling effect suggestions and %d settling effect highlight assets. Priority count: %d", buf, 0x14u);
  }
  BOOL v20 = (void *)[v38 copy];
  uint64_t v21 = v20;
  if (v13 != v18)
  {
    unint64_t v22 = [v20 count];
    if (v13 - v18 >= v22) {
      unint64_t v23 = v22;
    }
    else {
      unint64_t v23 = v13 - v18;
    }
    long long v24 = objc_msgSend(v21, "subarrayWithRange:", 0, v23);
    [v9 addObjectsFromArray:v24];
    uint64_t v25 = [v21 arrayByExcludingObjectsInArray:v24];

    int v26 = v39;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v27 = [v24 count];
      *(_DWORD *)buf = 67109120;
      int v41 = v27;
      _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Prioritize %d highlight candidates for processing.", buf, 8u);
    }

    uint64_t v21 = (void *)v25;
  }
  unint64_t v28 = [v6 count];
  unint64_t v29 = [v21 count];
  if (v28 <= v29) {
    unint64_t v30 = v29;
  }
  else {
    unint64_t v30 = v28;
  }
  if (v30)
  {
    unint64_t v31 = v29;
    for (unint64_t i = 0; i != v30; ++i)
    {
      if (i < v28)
      {
        int v33 = [v6 objectAtIndex:i];
        [v9 addObject:v33];
      }
      if (i < v31)
      {
        unint64_t v34 = [v21 objectAtIndex:i];
        [v9 addObject:v34];
      }
    }
  }

  return v9;
}

- (id)fetchSortedWallpaperCandidatesWithProgressReporter:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)unint64_t v74 = 261;
      *(_WORD *)&v74[4] = 2080;
      *(void *)&v74[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v5 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_37;
  }
  id v6 = [(PGAbstractSuggester *)self session];
  long long v7 = [v6 loggingConnection];
  unint64_t v8 = [(PGSettlingEffectWallpaperSuggester *)self fetchCandidateSuggestions];
  id v9 = [v6 photoLibrary];
  unint64_t v10 = [v9 librarySpecificFetchOptions];
  [v10 setCacheSizeForFetch:200];
  [v10 setChunkSizeForFetch:200];
  os_signpost_id_t v11 = +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:1];
  [v10 setFetchPropertySets:v11];

  long long v12 = objc_opt_class();
  uint64_t v13 = [v6 forbiddenAssetUUIDs];
  __int16 v14 = [v12 prefilteringInternalPredicateWithForbiddenAssetUUIDs:v13];
  [v10 setInternalPredicate:v14];

  id v71 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v8 options:v10];
  p_filteringStatistics = &self->_filteringStatistics;
  self->_filteringStatistics.numberOfLivePhotoWallpaperSuggestions = [v71 count];
  if ([v4 isCancelledWithProgress:0.2])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)unint64_t v74 = 279;
      *(_WORD *)&v74[4] = 2080;
      *(void *)&v74[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v5 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_36;
  }
  unint64_t v64 = self;
  v54 = v10;
  uint64_t v55 = v9;
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v56 = v7;
  int v15 = v7;
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  double v17 = v15;
  uint64_t v18 = v17;
  unint64_t v52 = v16 - 1;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PGSettlingEffectWallpaperSuggesterFilterCandidates", "", buf, 2u);
  }
  os_signpost_id_t spid = v16;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v51 = mach_absolute_time();
  p_filteringStatistics->postfilteringStatistics = 0;
  p_postfilteringStatistics = &p_filteringStatistics->postfilteringStatistics;
  v53 = v6;
  unint64_t v65 = [v6 curationContext];
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v19 = [v8 count];
  uint64_t v70 = 0;
  uint64_t v20 = 0;
  unint64_t v57 = v19 / 0xC8;
  double v21 = 1.0 / (double)v19 * 0.8;
  v59 = v8;
  unint64_t v60 = v19;
  unint64_t v22 = v19;
  v58 = v18;
  while (1)
  {
    unint64_t v61 = v22 - 200;
    uint64_t v62 = v20;
    uint64_t v23 = v22 >= 0xC8 ? 200 : v22;
    uint64_t v24 = v60 - 200 * v20 >= 0xC8 ? 200 : v60 - 200 * v20;
    v63 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:");
    uint64_t v25 = objc_msgSend(v8, "objectsAtIndexes:");
    if (v24) {
      break;
    }
LABEL_28:
    int v36 = v58;
    unsigned int v37 = v58;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = [v63 firstIndex];
      uint64_t v39 = [v63 lastIndex];
      *(_DWORD *)buf = 134218240;
      *(void *)unint64_t v74 = v38;
      *(_WORD *)&v74[8] = 2048;
      *(void *)&v74[10] = v39;
      _os_log_debug_impl(&dword_1D1805000, v37, OS_LOG_TYPE_DEBUG, "[PGSettlingEffectWallpaperSuggester] processed candidates from %lu to %lu", buf, 0x16u);
    }

    v70 += 200;
    unint64_t v22 = v61;
    uint64_t v20 = v62 + 1;
    unint64_t v8 = v59;
    if (v62 == v57)
    {
      [(PGSettlingEffectWallpaperSuggester *)v64 setAvailableFeaturesForCandidates:v66 pass:0];
      int v41 = +[PGSettlingEffectWallpaperSuggestionCandidate sortDescriptorsForProcessing];
      v5 = [v67 sortedArrayUsingDescriptors:v41];

      __int16 v42 = v37;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = [v5 count];
        *(_DWORD *)buf = 134217984;
        *(void *)unint64_t v74 = v44;
        _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Fetched %lu sorted wallpaper candidates.", buf, 0xCu);
      }

      uint64_t v45 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v48 = v42;
      int v49 = v48;
      unint64_t v10 = v54;
      id v9 = v55;
      if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v49, OS_SIGNPOST_INTERVAL_END, spid, "PGSettlingEffectWallpaperSuggesterFilterCandidates", "", buf, 2u);
      }

      long long v7 = v56;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)unint64_t v74 = "PGSettlingEffectWallpaperSuggesterFilterCandidates";
        *(_WORD *)&v74[8] = 2048;
        *(double *)&v74[10] = (float)((float)((float)((float)(v45 - v51) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v49, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      id v6 = v53;
      goto LABEL_35;
    }
  }
  uint64_t v26 = 0;
  while (1)
  {
    int v27 = (void *)MEMORY[0x1D25FED50]();
    unint64_t v28 = [v25 objectAtIndexedSubscript:v26];
    unint64_t v29 = [v28 uuid];
    unint64_t v30 = [v71 objectForKeyedSubscript:v29];

    if (v30) {
      break;
    }
LABEL_27:

    if (v23 == ++v26) {
      goto LABEL_28;
    }
  }
  unint64_t v31 = [[PGSettlingEffectWallpaperSuggestionCandidate alloc] initWithAsset:v30 suggestion:v28];
  v32 = objc_opt_class();
  [(PGSettlingEffectWallpaperSuggester *)v64 filteringContext];
  v34 = int v33 = v4;
  LODWORD(v32) = [v32 candidate:v31 passesFilteringWithContext:v34 curationContext:v65 statistics:p_postfilteringStatistics];

  id v4 = v33;
  if (v32) {
    unint64_t v35 = v67;
  }
  else {
    unint64_t v35 = v66;
  }
  [v35 addObject:v31];
  if (![v33 isCancelledWithProgress:v21 * (double)(unint64_t)(v70 + v26) + 0.2])
  {

    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)unint64_t v74 = 316;
    *(_WORD *)&v74[4] = 2080;
    *(void *)&v74[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }

  v5 = (void *)MEMORY[0x1E4F1CBF0];
  id v6 = v53;
  unint64_t v10 = v54;
  id v9 = v55;
  long long v7 = v56;
  int v36 = v58;
  unint64_t v8 = v59;
LABEL_35:

LABEL_36:
LABEL_37:

  return v5;
}

- (id)fetchCandidateSuggestions
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PGAbstractSuggester *)self session];
  id v4 = [v3 loggingConnection];
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  id v6 = v4;
  long long v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PGSettlingEffectWallpaperSuggesterFetchCandidateSuggestions", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v26 = mach_absolute_time();
  unint64_t v8 = [v3 photoLibrary];
  id v9 = [v8 librarySpecificFetchOptions];

  unint64_t v10 = (void *)MEMORY[0x1E4F28BA0];
  os_signpost_id_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v32[0] = v11;
  long long v12 = [MEMORY[0x1E4F39310] predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper];
  v32[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  __int16 v14 = [v10 andPredicateWithSubpredicates:v13];
  [v9 setPredicate:v14];

  int v15 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v9];
  p_filteringStatistics = &self->_filteringStatistics;
  self->_filteringStatistics.numberOfWallpaperSuggestions = [v15 count];
  double v17 = v7;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v15 count];
    *(_DWORD *)buf = 134217984;
    unint64_t v29 = (const char *)v18;
    _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Fetched %lu existing wallpaper suggestions.", buf, 0xCu);
  }

  unint64_t v19 = [MEMORY[0x1E4F8E858] filterSuggestions:v15 excludingSingleFeature:1];
  p_filteringStatistics->numberOfWallpaperSuggestionsWithoutSettlingEffect = [v19 count];

  uint64_t v20 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v23 = v17;
  uint64_t v24 = v23;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v24, OS_SIGNPOST_INTERVAL_END, v5, "PGSettlingEffectWallpaperSuggesterFetchCandidateSuggestions", "", buf, 2u);
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v29 = "PGSettlingEffectWallpaperSuggesterFetchCandidateSuggestions";
    __int16 v30 = 2048;
    double v31 = (float)((float)((float)((float)(v20 - v26) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v15;
}

- (void)setAvailableFeaturesForCandidates:(id)a3 pass:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = [(PGAbstractSuggester *)self session];
  unint64_t v8 = [v7 loggingConnection];
  id v9 = [v7 photoLibrary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __77__PGSettlingEffectWallpaperSuggester_setAvailableFeaturesForCandidates_pass___block_invoke;
  v18[3] = &unk_1E68E55B8;
  id v10 = v6;
  id v19 = v10;
  os_signpost_id_t v11 = v8;
  uint64_t v20 = v11;
  BOOL v21 = v4;
  id v17 = 0;
  char v12 = [v9 performChangesAndWait:v18 error:&v17];
  uint64_t v13 = (__CFString *)v17;

  if (v12)
  {
    __int16 v14 = v11;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (v4) {
        int v15 = @"Set";
      }
      else {
        int v15 = @"Cleared";
      }
      int v16 = [v10 count];
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = v16;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] %@ settling effect for %d suggestions", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v13;
    _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "[PGSettlingEffectWallpaperSuggester] Error updating availableFeatures: %@", buf, 0xCu);
  }
}

void __77__PGSettlingEffectWallpaperSuggester_setAvailableFeaturesForCandidates_pass___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v4 = 138412290;
    long long v15 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
        id v9 = objc_msgSend(v8, "suggestion", v15, (void)v16);
        if (v9)
        {
          id v10 = [MEMORY[0x1E4F39318] changeRequestForSuggestion:v9];
          objc_msgSend(v10, "setAvailableFeatures:", objc_msgSend(v9, "availableFeatures") & 0xFFFFFFFFFFFFFFFELL | *(unsigned __int8 *)(a1 + 48));
LABEL_8:

          goto LABEL_10;
        }
        os_signpost_id_t v11 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          char v12 = v11;
          id v10 = [v8 asset];
          uint64_t v13 = [v10 uuid];
          *(_DWORD *)buf = v15;
          BOOL v21 = v13;
          _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[PGSettlingEffectWallpaperSuggester] Missing PHSuggestion for asset: %@, skip updating availableFeatures", buf, 0xCu);

          goto LABEL_8;
        }
LABEL_10:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v14 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
      uint64_t v5 = v14;
    }
    while (v14);
  }
}

- (void)deleteLegacySettlingEffectSuggestions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [(PGAbstractSuggester *)self session];
  uint64_t v3 = [v2 loggingConnection];
  long long v4 = [v2 photoLibrary];
  uint64_t v5 = [v4 librarySpecificFetchOptions];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"subtype", 680);
  [v5 setPredicate:v6];

  uint64_t v7 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v5];
  if ([v7 count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__PGSettlingEffectWallpaperSuggester_deleteLegacySettlingEffectSuggestions__block_invoke;
    v14[3] = &unk_1E68F0B18;
    id v8 = v7;
    id v15 = v8;
    id v13 = 0;
    char v9 = [v4 performChangesAndWait:v14 error:&v13];
    id v10 = v13;
    if (v9)
    {
      os_signpost_id_t v11 = v3;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = [v8 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = v12;
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Deleted %d legacy settling effect suggestions", buf, 8u);
      }
    }
    else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_error_impl(&dword_1D1805000, v3, OS_LOG_TYPE_ERROR, "[PGSettlingEffectWallpaperSuggester] Error deleting legacy settling effect suggestions: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v3, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] No legacy settling effect suggestions to delete.", buf, 2u);
  }
}

uint64_t __75__PGSettlingEffectWallpaperSuggester_deleteLegacySettlingEffectSuggestions__block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F39318] deleteSuggestions:*(void *)(a1 + 32)];
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:a4];
  if (![v7 isCancelledWithProgress:0.0])
  {
    id v8 = [(PGAbstractSuggester *)self session];
    char v9 = [v8 loggingConnection];
    p_filteringStatistics = &self->_filteringStatistics;
    *(_OWORD *)&self->_filteringStatistics.numberOfLivePhotos = 0u;
    *(_OWORD *)&self->_filteringStatistics.postfilteringStatistics.numberOfEliminationsThruSettlingEffectScore = 0u;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruResourceAvailability = 0u;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStabilization = 0u;
    *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruVideoDecision = 0u;
    *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfEliminationsThruSettlingEffectScore = 0u;
    *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruCrop = 0u;
    *(void *)&self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates = 0;
    self->_filteringStatistics.numberOfLivePhotos = [(PGSettlingEffectWallpaperSuggester *)self totalLivePhotos];
    if ([v7 isCancelledWithProgress:0.05])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 91;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        os_signpost_id_t v11 = MEMORY[0x1E4F14500];
        int v12 = "Cancelled at line %d in file %s";
LABEL_14:
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
        uint32_t v15 = 18;
LABEL_17:
        _os_log_impl(&dword_1D1805000, v11, v14, v12, buf, v15);
        goto LABEL_70;
      }
      goto LABEL_70;
    }
    if (([MEMORY[0x1E4F8A378] currentDeviceSupportsSettlingEffect] & 1) == 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v12 = "[PGSettlingEffectWallpaperSuggester] The current device doesn't support SettlingEffect, returning 0 suggestions";
        os_signpost_id_t v11 = v9;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 2;
        goto LABEL_17;
      }
      goto LABEL_70;
    }
    int v13 = [v6 noLimitPerFeature];
    self->_noLimit = v13;
    if (v13 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] no limit mode: ON", buf, 2u);
    }
    [(PGSettlingEffectWallpaperSuggester *)self deleteLegacySettlingEffectSuggestions];
    if ([v7 isCancelledWithProgress:0.1])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 108;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        os_signpost_id_t v11 = MEMORY[0x1E4F14500];
        int v12 = "Cancelled at line %d in file %s";
        goto LABEL_14;
      }
LABEL_70:

      goto LABEL_71;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Starting to generate Settling Effect on existing wallpaper suggestions", buf, 2u);
    }
    long long v16 = v9;
    os_signpost_id_t v17 = os_signpost_id_generate(v16);
    uint64_t v18 = v16;
    long long v19 = v18;
    unint64_t v65 = v17 - 1;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PGSettlingEffectWallpaperSuggester", "", buf, 2u);
    }
    os_signpost_id_t spid = v17;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v20 = mach_absolute_time();
    BOOL v21 = [v7 childProgressReporterFromStart:0.11 toEnd:0.19];
    int v69 = [(PGSettlingEffectWallpaperSuggester *)self fetchSortedWallpaperCandidatesWithProgressReporter:v21];
    uint64_t v66 = [v69 count];
    if ([v7 isCancelledWithProgress:0.2])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 120;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_69;
    }
    uint64_t v59 = v20;
    uint64_t v62 = v21;
    v63 = v19;
    uint64_t v22 = [v7 childProgressReporterFromStart:0.21 toEnd:0.29];
    uint64_t v23 = [PGSettlingEffectHighlightProcessor alloc];
    __int16 v24 = [v8 photoLibrary];
    int v25 = [(PGSettlingEffectHighlightProcessor *)v23 initWithPhotoLibrary:v24];

    unint64_t v61 = (void *)v22;
    uint64_t v26 = v22;
    int v27 = v25;
    unint64_t v28 = [(PGSettlingEffectHighlightProcessor *)v25 fetchHighlightCandidatesWithProgressReporter:v26];
    uint64_t v29 = [v28 count];
    int v76 = 0;
    long long v74 = 0u;
    long long v75 = 0u;
    if (v27) {
      [(PGSettlingEffectHighlightProcessor *)v27 statistics];
    }
    long long v30 = v75;
    *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfHighlightCandidatesForFRC = v74;
    *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfHighlightCandidates = v30;
    self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruDeviceOwner = v76;
    unint64_t v60 = v28;
    if ([v7 isCancelledWithProgress:0.3])
    {
      BOOL v21 = v62;
      long long v19 = v63;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 130;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        double v31 = MEMORY[0x1E4F14500];
LABEL_35:
        _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_68;
      }
      goto LABEL_68;
    }
    if (!(v66 + v29))
    {
      BOOL v21 = v62;
      long long v19 = v63;
      if (![v7 isCancelledWithProgress:1.0])
      {
        id v67 = v27;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v63, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Found 0 candidates", buf, 2u);
        }
        uint64_t v58 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        unint64_t v35 = v63;
        int v36 = v35;
        if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v36, OS_SIGNPOST_INTERVAL_END, spid, "PGSettlingEffectWallpaperSuggester", "", buf, 2u);
        }

        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "PGSettlingEffectWallpaperSuggester";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (float)((float)((float)((float)(v58 - v59) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        logger = self->_logger;
        assetGater = self->_assetGater;
        if (assetGater)
        {
          [(PGWallpaperSuggestionAssetGater *)assetGater currentGatingStatistics];
        }
        else
        {
          uint64_t v73 = 0;
          memset(v72, 0, sizeof(v72));
        }
        long long v41 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfEliminationsThruSettlingEffectScore;
        long long v81 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruVideoDecision;
        long long v82 = v41;
        long long v83 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruCrop;
        uint64_t v84 = *(void *)&self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates;
        long long v42 = *(_OWORD *)&self->_filteringStatistics.postfilteringStatistics.numberOfEliminationsThruSettlingEffectScore;
        *(_OWORD *)buf = *(_OWORD *)&p_filteringStatistics->numberOfLivePhotos;
        *(_OWORD *)&buf[16] = v42;
        long long v43 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStabilization;
        long long v79 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruResourceAvailability;
        long long v80 = v43;
        [(PGSettlingEffectWallpaperSuggesterLogger *)logger logFilteringStatistics:buf assetGaterStatistics:v72];
        int v27 = v67;
        goto LABEL_68;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 133;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        double v31 = MEMORY[0x1E4F14500];
        goto LABEL_35;
      }
LABEL_68:

LABEL_69:
      goto LABEL_70;
    }
    uint64_t v32 = [(PGSettlingEffectWallpaperSuggester *)self consolidatedCandidatesFromWallpaperCandidates:v69 highlightCandidates:v28];
    long long v19 = v63;
    unint64_t v57 = (void *)v32;
    if ([v7 isCancelledWithProgress:0.4])
    {
      BOOL v21 = v62;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 144;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_67;
    }
    id v68 = v27;
    v56 = [v7 childProgressReporterFromStart:0.41 toEnd:0.89];
    -[PGSettlingEffectWallpaperSuggester processFRCFromCandidates:withProgressReporter:](self, "processFRCFromCandidates:withProgressReporter:", v32);
    uint64_t v39 = self->_logger;
    double v40 = self->_assetGater;
    BOOL v21 = v62;
    if (v40)
    {
      [(PGWallpaperSuggestionAssetGater *)v40 currentGatingStatistics];
    }
    else
    {
      uint64_t v71 = 0;
      memset(v70, 0, sizeof(v70));
    }
    long long v44 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.numberOfEliminationsThruSettlingEffectScore;
    long long v81 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruVideoDecision;
    long long v82 = v44;
    long long v83 = *(_OWORD *)&self->_filteringStatistics.highlightStatistics.highlightStatistics.numberOfEliminationsThruCrop;
    uint64_t v84 = *(void *)&self->_filteringStatistics.numberOfFRCEligibleWallpaperCandidates;
    long long v45 = *(_OWORD *)&self->_filteringStatistics.postfilteringStatistics.numberOfEliminationsThruSettlingEffectScore;
    *(_OWORD *)buf = *(_OWORD *)&p_filteringStatistics->numberOfLivePhotos;
    *(_OWORD *)&buf[16] = v45;
    long long v46 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruStabilization;
    long long v79 = *(_OWORD *)&self->_filteringStatistics.frcGatingStatistics.numberOfEliminationsThruResourceAvailability;
    long long v80 = v46;
    [(PGSettlingEffectWallpaperSuggesterLogger *)v39 logFilteringStatistics:buf assetGaterStatistics:v70];
    if ([v7 isCancelledWithProgress:0.9])
    {
      int v27 = v68;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 151;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        long long v47 = MEMORY[0x1E4F14500];
        v48 = "Cancelled at line %d in file %s";
LABEL_59:
        uint32_t v49 = 18;
LABEL_65:
        _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, v48, buf, v49);
      }
    }
    else
    {
      [(PGSettlingEffectWallpaperSuggester *)self sendSettlingEffectStatisticsEvent];
      int v27 = v68;
      if (![v7 isCancelledWithProgress:1.0])
      {
        uint64_t v50 = mach_absolute_time();
        uint32_t v52 = info.numer;
        uint32_t v51 = info.denom;
        v53 = v63;
        v54 = v53;
        if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v54, OS_SIGNPOST_INTERVAL_END, spid, "PGSettlingEffectWallpaperSuggester", "", buf, 2u);
        }

        if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
          goto LABEL_66;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "PGSettlingEffectWallpaperSuggester";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (float)((float)((float)((float)(v50 - v59) * (float)v52) / (float)v51) / 1000000.0);
        v48 = "[Performance] %s: %f ms";
        long long v47 = v54;
        uint32_t v49 = 22;
        goto LABEL_65;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 156;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
        long long v47 = MEMORY[0x1E4F14500];
        v48 = "Cancelled at line %d in file %s";
        goto LABEL_59;
      }
    }
LABEL_66:

LABEL_67:
    goto LABEL_68;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 84;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Suggestions/Suggesters/Autobahn/SettlingEffect/PGSettlingEffectWallpaperSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_71:

  return (id)MEMORY[0x1E4F1CBF0];
}

- (PGSettlingEffectWallpaperSuggester)initWithSession:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PGSettlingEffectWallpaperSuggester;
  uint64_t v5 = [(PGAbstractSuggester *)&v18 initWithSession:v4];
  if (v5)
  {
    id v6 = -[PGSettlingEffectWallpaperSuggesterFilteringContext initInOrientation:]([PGSettlingEffectWallpaperSuggesterFilteringContext alloc], "initInOrientation:", [MEMORY[0x1E4F8E858] primaryOrientation]);
    filteringContext = v5->_filteringContext;
    v5->_filteringContext = v6;

    id v8 = [PGWallpaperSuggestionAssetGater alloc];
    char v9 = [v4 loggingConnection];
    uint64_t v10 = [(PGWallpaperSuggestionAssetGater *)v8 initWithType:5 loggingConnection:v9];
    assetGater = v5->_assetGater;
    v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v10;

    loggingPrefix = v5->_loggingPrefix;
    v5->_loggingPrefix = (NSString *)@"[PGSettlingEffectWallpaperSuggester]";

    int v13 = [PGSettlingEffectWallpaperSuggesterLogger alloc];
    os_log_type_t v14 = [v4 loggingConnection];
    uint64_t v15 = [(PGSettlingEffectWallpaperSuggesterLogger *)v13 initWithLoggingConnection:v14];
    logger = v5->_logger;
    v5->_logger = (PGSettlingEffectWallpaperSuggesterLogger *)v15;
  }
  return v5;
}

+ (id)analyticsPayloadFromHighlightStatistics:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [NSNumber numberWithInt:a3->var0];
  [v4 setObject:v5 forKeyedSubscript:@"HighlightCandidatesForFRC"];

  id v6 = [NSNumber numberWithInt:a3->var1];
  [v4 setObject:v6 forKeyedSubscript:@"HighlightFailedSettlingEffectScore"];

  id v7 = [NSNumber numberWithInt:a3->var2];
  [v4 setObject:v7 forKeyedSubscript:@"HighlightSettlingEffectScoreRequested"];

  uint64_t var0 = a3->var3.var0;
  uint64_t var1 = a3->var3.var1;
  uint64_t var2 = a3->var3.var2;
  uint64_t var3 = a3->var3.var3;
  uint64_t var4 = a3->var3.var4;
  uint64_t var5 = a3->var3.var5;
  os_log_type_t v14 = [NSNumber numberWithInt:var0];
  [v4 setObject:v14 forKeyedSubscript:@"HighlightAssets"];

  uint64_t v15 = [NSNumber numberWithInt:var1];
  [v4 setObject:v15 forKeyedSubscript:@"HighlightCandidates"];

  long long v16 = [NSNumber numberWithInt:var2];
  [v4 setObject:v16 forKeyedSubscript:@"HighlightFailedCrop"];

  os_signpost_id_t v17 = [NSNumber numberWithInt:var3];
  [v4 setObject:v17 forKeyedSubscript:@"HighlightFailedNSFW"];

  objc_super v18 = [NSNumber numberWithInt:var4];
  [v4 setObject:v18 forKeyedSubscript:@"HighlightKnownFRCFailures"];

  long long v19 = [NSNumber numberWithInt:var5];
  [v4 setObject:v19 forKeyedSubscript:@"HighlightFailedDeviceOwner"];

  return v4;
}

+ (id)analyticsPayloadFromPostFilteringStatistics:(id)a3
{
  uint64_t var1 = a3.var1;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSNumber numberWithInt:a3];
  [v5 setObject:v6 forKeyedSubscript:@"WallpaperFailedSettlingEffectScore"];

  id v7 = [NSNumber numberWithInt:var1];
  [v5 setObject:v7 forKeyedSubscript:@"WallpaperSettlingEffectScoreRequested"];

  return v5;
}

+ (id)analyticsPayloadFromFRCFilteringStatistics:(id *)a3 photoLibrary:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  id v8 = [NSNumber numberWithInt:a3->var0];
  [v7 setObject:v8 forKeyedSubscript:@"LivePhotos"];

  char v9 = [NSNumber numberWithInt:a3->var3];
  [v7 setObject:v9 forKeyedSubscript:@"LivePhotoWallpaper"];

  uint64_t v10 = [MEMORY[0x1E4F8E858] fetchSettlingEffectSuggestionsInPhotoLibrary:v6];
  os_signpost_id_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  [v7 setObject:v11 forKeyedSubscript:@"CurrentWallpaperPassFRC"];

  int v12 = (void *)MEMORY[0x1E4F38EB8];
  int v13 = [v6 librarySpecificFetchOptions];

  os_log_type_t v14 = [v12 fetchKeyAssetForEachSuggestion:v10 options:v13];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  [v7 setObject:v15 forKeyedSubscript:@"CurrentWallpaperAssetPassFRC"];

  long long v16 = [NSNumber numberWithInt:a3->var7];
  [v7 setObject:v16 forKeyedSubscript:@"ProcessedWallpaperFRCEligibleCandidates"];

  os_signpost_id_t v17 = [NSNumber numberWithInt:a3->var8];
  [v7 setObject:v17 forKeyedSubscript:@"ProcessedHighlightFRCEligibleCandidates"];

  return v7;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int v36 = [v10 photoLibrary];
  int v12 = [v36 librarySpecificFetchOptions];
  int v13 = [a1 prefilteringInternalPredicateWithForbiddenAssetUUIDs:0];
  [v12 setInternalPredicate:v13];

  os_log_type_t v14 = (void *)MEMORY[0x1E4F38EB8];
  uint64_t v15 = [v10 localIdentifier];
  v51[0] = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  os_signpost_id_t v17 = [v14 fetchAssetsWithLocalIdentifiers:v16 options:v12];
  objc_super v18 = [v17 firstObject];

  if (v18)
  {
    long long v19 = [[PGSettlingEffectWallpaperSuggestionCandidate alloc] initWithAsset:v10 suggestion:0];
    id v20 = [[PGSettlingEffectWallpaperSuggesterFilteringContext alloc] initInOrientation:a5];
    uint64_t v50 = 0;
    BOOL v21 = v11;
    if ([a1 candidate:v19 passesFilteringWithContext:v20 curationContext:v11 statistics:&v50])
    {
      uint64_t v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v23 = [v22 BOOLForKey:*MEMORY[0x1E4F8EAC8]];

      if (v23)
      {
        __int16 v24 = [PGWallpaperSuggestionAssetGater alloc];
        int v25 = [(PGWallpaperSuggestionAssetGater *)v24 initWithType:5 loggingConnection:MEMORY[0x1E4F14500]];
        [(PGWallpaperSuggestionAssetGater *)v25 setCoversTracks:1];
        [(PGWallpaperSuggestionAssetGater *)v25 setIsUserInitiated:1];
        uint64_t v26 = [(PGWallpaperSuggestionAssetGater *)v25 gateAsset:v10 progressBlock:&__block_literal_global_5916];
        char v27 = [v26 passesSettlingEffect];
        if (a6 && (v27 & 1) == 0)
        {
          unint64_t v28 = v26;
          if (v25)
          {
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            BOOL v21 = v11;
            if (v49 > 0)
            {
              uint64_t v29 = @"Failed feature enablement check";
LABEL_53:
              unint64_t v35 = a6;
              goto LABEL_54;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v48 > 0)
            {
              uint64_t v29 = @"Failed hardware support check";
              goto LABEL_53;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v47 > 0)
            {
              uint64_t v29 = @"Failed to download resources";
              goto LABEL_53;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v46 > 0)
            {
              uint64_t v29 = @"Failed supported adjustment check";
              goto LABEL_53;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v45 > 0)
            {
              uint64_t v29 = @"Failed with generic failure";
              goto LABEL_53;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v44 > 0)
            {
              uint64_t v29 = @"Failed metadata check";
              goto LABEL_53;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v43 > 0)
            {
              uint64_t v29 = @"Failed stabilization";
              goto LABEL_53;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v42 > 0)
            {
              uint64_t v29 = @"Failed video quality";
LABEL_52:
              BOOL v21 = v11;
              goto LABEL_53;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v41 > 0)
            {
              uint64_t v29 = @"Failed metadata integrity";
              goto LABEL_52;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v40 > 0)
            {
              uint64_t v29 = @"Failed FRC";
              goto LABEL_52;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v39 > 0)
            {
              uint64_t v29 = @"Failed video decision";
              goto LABEL_52;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            if (v38 > 0)
            {
              uint64_t v29 = @"Failed layout decision";
              goto LABEL_52;
            }
            [(PGWallpaperSuggestionAssetGater *)v25 settlingEffectGatingStatistics];
            BOOL v21 = v11;
            unint64_t v35 = a6;
            if (v37 > 0)
            {
              uint64_t v29 = @"Failed still transition";
              goto LABEL_54;
            }
          }
          else
          {
            unint64_t v35 = a6;
            BOOL v21 = v11;
          }
          uint64_t v29 = @"Unknown Reason";
LABEL_54:
          double v31 = v36;
          *unint64_t v35 = v29;

          BOOL v30 = 0;
          goto LABEL_26;
        }
      }
      if (a6)
      {
        if (v23) {
          int v33 = @"Pass";
        }
        else {
          int v33 = @"Pass w/o FRC";
        }
        *a6 = v33;
      }
      BOOL v30 = 1;
      BOOL v21 = v11;
    }
    else if (a6)
    {
      BOOL v30 = 0;
      if ((int)v50 < 1) {
        uint64_t v32 = @"Unknown Reason";
      }
      else {
        uint64_t v32 = @"Low Settling Effect Score";
      }
      *a6 = v32;
    }
    else
    {
      BOOL v30 = 0;
    }
    double v31 = v36;
LABEL_26:

    goto LABEL_27;
  }
  BOOL v30 = 0;
  if (a6) {
    *a6 = @"Fails Predicate";
  }
  BOOL v21 = v11;
  double v31 = v36;
LABEL_27:

  return v30;
}

+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 statistics:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 asset];
  char v9 = [v7 suggestion];

  if (v9)
  {
    uint64_t v10 = [v9 subtype];
    BOOL v11 = v10 != 655 && v10 != 605;
    if (v10 == 605) {
      goto LABEL_17;
    }
    uint64_t v12 = v10;
    if (v10 == 655) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  char v20 = 0;
  +[PGSettlingEffectScoreHelper analyzedSettlingEffectScoreForAsset:v8 requestedOnDemand:&v20];
  float v14 = v13;
  if (v20) {
    ++a6->var1;
  }
  uint64_t v15 = [v8 mediaAnalysisProperties];
  +[PGSettlingEffectWallpaperSuggesterFilteringContext minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:](PGSettlingEffectWallpaperSuggesterFilteringContext, "minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:", v12, [v15 mediaAnalysisVersion]);
  double v17 = v16;

  double v18 = v14;
  if (v17 <= v18)
  {
    BOOL v11 = 1;
  }
  else if (+[PGUserDefaults wallpaperSkipSettlingEffectScoreGating])
  {
    BOOL v11 = 1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      double v22 = v18;
      __int16 v23 = 2048;
      double v24 = v17;
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] PGWallpaperSkipSettlingEffectScoreGating is ON. Skip gating settlingEffectScore (%.3f < %.3f)", buf, 0x16u);
    }
  }
  else
  {
    BOOL v11 = 0;
    ++a6->var0;
  }
LABEL_17:

  return v11;
}

+ (id)prefilteringInternalPredicateWithForbiddenAssetUUIDs:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [MEMORY[0x1E4F8E858] settlingEffectLivePhotoPredicate];
  [v4 addObject:v5];
  if ([v3 count])
  {
    id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"uuid", v3];
    [v4 addObject:v6];
  }
  id v7 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];

  return v7;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:680];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:6];
}

@end