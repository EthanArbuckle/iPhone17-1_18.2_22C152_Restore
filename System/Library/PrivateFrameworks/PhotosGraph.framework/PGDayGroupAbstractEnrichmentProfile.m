@interface PGDayGroupAbstractEnrichmentProfile
- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4;
- (BOOL)canUseLocationInformationWithHighlightInfo:(id)a3 graph:(id)a4;
- (BOOL)collectsDebugInfo;
- (NSMutableDictionary)mutableDebugInfos;
- (NSString)identifier;
- (OS_os_log)loggingConnection;
- (PGCurationManager)curationManager;
- (PGDayGroupAbstractEnrichmentProfile)initWithCurationManager:(id)a3 loggingConnection:(id)a4;
- (PGDejunkerDeduperOptions)extendedCurationOptions;
- (double)promotionScoreWithHighlightInfo:(id)a3;
- (id)_childHighlightsToFetchCurationForHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)extendedCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5;
- (id)highlightInfoWithHighlight:(id)a3 graph:(id)a4 highlightTailorContext:(id)a5;
- (id)keyAssetCurationCriteriaWithHighlightInfo:(id)a3 graph:(id)a4;
- (id)keyAssetWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 graph:(id)a5 progressBlock:(id)a6;
- (id)momentProcessedLocationByMomentUUIDWithHighlightInfo:(id)a3 graph:(id)a4;
- (id)momentTitleByMomentUUIDWithHighlightInfo:(id)a3;
- (id)summaryCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5;
- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8;
- (unsigned)enrichmentStateWithHighlightInfo:(id)a3 highlightTailorContext:(id)a4;
- (void)setCollectsDebugInfo:(BOOL)a3;
- (void)setExtendedCurationOptions:(id)a3;
@end

@implementation PGDayGroupAbstractEnrichmentProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDebugInfos, 0);
  objc_storeStrong((id *)&self->_extendedCurationOptions, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
}

- (NSMutableDictionary)mutableDebugInfos
{
  return self->_mutableDebugInfos;
}

- (void)setExtendedCurationOptions:(id)a3
{
}

- (PGDejunkerDeduperOptions)extendedCurationOptions
{
  return self->_extendedCurationOptions;
}

- (void)setCollectsDebugInfo:(BOOL)a3
{
  self->_collectsDebugInfo = a3;
}

- (BOOL)collectsDebugInfo
{
  return self->_collectsDebugInfo;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (PGCurationManager)curationManager
{
  return self->_curationManager;
}

- (id)_childHighlightsToFetchCurationForHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = v5;
  v7 = [v5 childHighlights];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (+[PGHighlightEnrichmentUtilities canUseSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "canUseSharingComposition:forSharingFilter:", [v13 sharingComposition], v4))
        {
          [v13 promotionScore];
          double v15 = fabs(v14 + -0.2);
          if ((v15 <= 2.22044605e-16) | v10 & 1)
          {
            if (((v15 <= 2.22044605e-16) & v10) != 0)
            {
              char v10 = 1;
              continue;
            }
          }
          else
          {
            [v6 removeAllObjects];
            char v10 = 1;
          }
          v16 = [v13 objectID];
          [v6 addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)summaryCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v38 = a5;
  uint64_t v8 = (void (**)(void *, unsigned char *, double))_Block_copy(v38);
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  if (!v8
    || (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v52[3] < 0.01)
    || (v52[3] = v9, v50 = 0, v8[2](v8, &v50, 0.0), char v10 = *((unsigned char *)v56 + 24) | v50, (*((unsigned char *)v56 + 24) = v10) == 0))
  {
    v39 = [(PGDayGroupAbstractEnrichmentProfile *)self _childHighlightsToFetchCurationForHighlightInfo:v40 sharingFilter:v6];
    v12 = [(PGCurationManager *)self->_curationManager photoLibrary];
    v13 = [v12 librarySpecificFetchOptions];

    [v13 setIncludeGuestAssets:1];
    double v14 = +[PGHighlightEnrichmentUtilities assetPropertySetsForEnrichment];
    [v13 setFetchPropertySets:v14];

    double v15 = (void *)MEMORY[0x1E4F28BA0];
    v16 = +[PGHighlightEnrichmentUtilities internalPredicateForFetchingAssetsForSharingFilter:v6];
    v60[0] = v16;
    v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"highlightBeingSummaryAssets", v39];
    v60[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
    long long v19 = [v15 andPredicateWithSubpredicates:v18];
    [v13 setInternalPredicate:v19];

    long long v20 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v13];
    long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v20, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v22 = v20;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = [*(id *)(*((void *)&v46 + 1) + 8 * i) uuid];
          [v21 addObject:v26];
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v59 count:16];
      }
      while (v23);
    }

    if (v8)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v52[3] >= 0.01)
      {
        v52[3] = Current;
        char v50 = 0;
        v8[2](v8, &v50, 0.5);
        char v28 = *((unsigned char *)v56 + 24) | v50;
        *((unsigned char *)v56 + 24) = v28;
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v62 = 163;
            __int16 v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enri"
                  "ch/Enrichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v11 = (id)MEMORY[0x1E4F1CBF0];
          goto LABEL_32;
        }
      }
    }
    v29 = [(PGDayGroupAbstractEnrichmentProfile *)self curationOptionsWithHighlightInfo:v40 sharingFilter:v6];
    [v29 setUuidsOfEligibleAssets:v21];
    [v29 setDuration:21];
    v30 = objc_alloc_init(PGCurator_PHAsset);
    [(PGCurator *)v30 setLoggingConnection:self->_loggingConnection];
    v31 = [v40 feeder];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __100__PGDayGroupAbstractEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke;
    v41[3] = &unk_1E68F03F8;
    v32 = v8;
    id v42 = v32;
    v43 = &v51;
    v44 = &v55;
    uint64_t v45 = 0x3F847AE147AE147BLL;
    v33 = [(PGCurator_PHAsset *)v30 bestAssetsForFeeder:v31 options:v29 debugInfo:0 progressBlock:v41];

    if (*((unsigned char *)v56 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v62 = 175;
        __int16 v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/E"
              "nrichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
        v34 = MEMORY[0x1E4F14500];
LABEL_23:
        _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v8
        || (double v35 = CFAbsoluteTimeGetCurrent(), v35 - v52[3] < 0.01)
        || (v52[3] = v35,
            char v50 = 0,
            v32[2](v32, &v50, 1.0),
            char v36 = *((unsigned char *)v56 + 24) | v50,
            (*((unsigned char *)v56 + 24) = v36) == 0))
      {
        id v11 = v33;
        goto LABEL_31;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v62 = 177;
        __int16 v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/E"
              "nrichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
        v34 = MEMORY[0x1E4F14500];
        goto LABEL_23;
      }
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v62 = 145;
    __int16 v63 = 2080;
    v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/Enric"
          "hment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_33:
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v11;
}

void __100__PGDayGroupAbstractEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)extendedCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  double v10 = 0.0;
  if (v9)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v27 = 0;
      v9[2](v9, &v27, 0.0);
      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v31 = 120;
          __int16 v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich"
                "/Enrichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v12 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_16;
      }
      double v10 = Current;
    }
  }
  v13 = [(PGDayGroupAbstractEnrichmentProfile *)self _childHighlightsToFetchCurationForHighlightInfo:v8 sharingFilter:v6];
  double v14 = [(PGCurationManager *)self->_curationManager photoLibrary];
  double v15 = [v14 librarySpecificFetchOptions];

  [v15 setIncludeGuestAssets:1];
  v16 = +[PGHighlightEnrichmentUtilities assetPropertySetsForEnrichment];
  [v15 setFetchPropertySets:v16];

  v17 = (void *)MEMORY[0x1E4F28BA0];
  v18 = +[PGHighlightEnrichmentUtilities internalPredicateForFetchingAssetsForSharingFilter:v6];
  v29[0] = v18;
  long long v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"highlightBeingExtendedAssets", v13];
  v29[1] = v19;
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  long long v21 = [v17 andPredicateWithSubpredicates:v20];
  [v15 setInternalPredicate:v21];

  id v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v28[0] = v22;
  uint64_t v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v28[1] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v15 setInternalSortDescriptors:v24];

  v25 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v15];
  if (v9 && CFAbsoluteTimeGetCurrent() - v10 >= 0.01 && (char v27 = 0, v9[2](v9, &v27, 1.0), v27))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v31 = 138;
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/Enr"
            "ichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v12 = [v25 fetchedObjects];
  }

LABEL_16:
  return v12;
}

- (id)keyAssetWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 graph:(id)a5 progressBlock:(id)a6
{
  return +[PGHighlightEnrichmentUtilities keyAssetForDayGroupHighlightWithHighlightInfo:a3 sharingFilter:a4 curationManager:self->_curationManager progressBlock:a6];
}

- (double)promotionScoreWithHighlightInfo:(id)a3
{
  id v5 = a3;
  PGAbstractMethodException(self, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)momentProcessedLocationByMomentUUIDWithHighlightInfo:(id)a3 graph:(id)a4
{
  return 0;
}

- (id)momentTitleByMomentUUIDWithHighlightInfo:(id)a3
{
  return 0;
}

- (id)keyAssetCurationCriteriaWithHighlightInfo:(id)a3 graph:(id)a4
{
  return 0;
}

- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  id v6 = a3;
  PGAbstractMethodException(self, a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  PGAbstractMethodException(self, a2);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v15);
}

- (id)highlightInfoWithHighlight:(id)a3 graph:(id)a4 highlightTailorContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [[PGHighlightTailorHighlightInfo alloc] initWithHighlight:v9 graph:v8 highlightTailorContext:v7];

  return v10;
}

- (BOOL)canUseLocationInformationWithHighlightInfo:(id)a3 graph:(id)a4
{
  return +[PGHighlightEnrichmentUtilities canUseLocationInformationWithHighlightInfo:a3 graph:a4];
}

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  PGAbstractMethodException(self, a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (unsigned)enrichmentStateWithHighlightInfo:(id)a3 highlightTailorContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(a3, "childHighlights", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    unsigned __int16 v10 = 4;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 uuid];
        unsigned int v14 = [v5 pendingEnrichmentStateForHighlightUUID:v13];

        if (!v14) {
          unsigned int v14 = [v12 enrichmentState];
        }
        if (v10 >= v14) {
          unsigned __int16 v10 = v14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    unsigned __int16 v10 = 4;
  }

  return v10;
}

- (NSString)identifier
{
  PGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (PGDayGroupAbstractEnrichmentProfile)initWithCurationManager:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGDayGroupAbstractEnrichmentProfile;
  uint64_t v9 = [(PGDayGroupAbstractEnrichmentProfile *)&v14 init];
  unsigned __int16 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curationManager, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableDebugInfos = v10->_mutableDebugInfos;
    v10->_mutableDebugInfos = v11;
  }
  return v10;
}

@end