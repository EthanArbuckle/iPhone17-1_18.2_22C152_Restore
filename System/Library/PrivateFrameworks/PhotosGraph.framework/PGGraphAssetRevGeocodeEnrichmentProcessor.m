@interface PGGraphAssetRevGeocodeEnrichmentProcessor
+ (id)homeLocationsWithServiceManager:(id)a3;
- (BOOL)_allowReverseGeocodingWithUpdateType:(int64_t)a3;
- (BOOL)requiresValidGraph;
- (BOOL)revGeoProviderDidChangeForGraphApplicationDataURL:(id)a3;
- (NSArray)homeLocations;
- (PGGraphAssetRevGeocodeEnrichmentProcessor)init;
- (double)numberOfAssetClusters100mPlusFromCenter;
- (double)numberOfAssetClustersWithin100mOfCenter;
- (double)numberOfAssetClustersWithin10mOfCenter;
- (double)numberOfAssetClustersWithin20mOfCenter;
- (double)numberOfAssetClustersWithin50mOfCenter;
- (double)sumNumberOfAssetClustersPerMoment;
- (double)sumNumberOfAssetsPerCluster;
- (double)sumSquareNumberOfAssetClustersPerMoment;
- (double)sumSquareNumberOfAssetsPerCluster;
- (unint64_t)numberOfAssetClustersRevGeocoded;
- (unint64_t)numberOfMomentsRevGeocoded;
- (void)_processMetricsOfAssetClustersInMoment:(id)a3;
- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6;
- (void)invalidateReverseLocationDataForRevGeoProviderChangeUsingManager:(id)a3 progressBlock:(id)a4;
- (void)sendMetricsForGeocodeProcesssor:(id)a3 toAnalytics:(id)a4 progressBlock:(id)a5;
- (void)setCurrentGeoProviderInGraphApplicationDataURL:(id)a3;
- (void)setHomeLocations:(id)a3;
@end

@implementation PGGraphAssetRevGeocodeEnrichmentProcessor

- (void).cxx_destruct
{
}

- (BOOL)requiresValidGraph
{
  return self->_requiresValidGraph;
}

- (unint64_t)numberOfAssetClustersRevGeocoded
{
  return self->_numberOfAssetClustersRevGeocoded;
}

- (unint64_t)numberOfMomentsRevGeocoded
{
  return self->_numberOfMomentsRevGeocoded;
}

- (double)numberOfAssetClusters100mPlusFromCenter
{
  return self->_numberOfAssetClusters100mPlusFromCenter;
}

- (double)numberOfAssetClustersWithin100mOfCenter
{
  return self->_numberOfAssetClustersWithin100mOfCenter;
}

- (double)numberOfAssetClustersWithin50mOfCenter
{
  return self->_numberOfAssetClustersWithin50mOfCenter;
}

- (double)numberOfAssetClustersWithin20mOfCenter
{
  return self->_numberOfAssetClustersWithin20mOfCenter;
}

- (double)numberOfAssetClustersWithin10mOfCenter
{
  return self->_numberOfAssetClustersWithin10mOfCenter;
}

- (double)sumSquareNumberOfAssetsPerCluster
{
  return self->_sumSquareNumberOfAssetsPerCluster;
}

- (double)sumNumberOfAssetsPerCluster
{
  return self->_sumNumberOfAssetsPerCluster;
}

- (double)sumSquareNumberOfAssetClustersPerMoment
{
  return self->_sumSquareNumberOfAssetClustersPerMoment;
}

- (double)sumNumberOfAssetClustersPerMoment
{
  return self->_sumNumberOfAssetClustersPerMoment;
}

- (void)setHomeLocations:(id)a3
{
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (BOOL)_allowReverseGeocodingWithUpdateType:(int64_t)a3
{
  BOOL v3 = 1;
  if ((unint64_t)a3 <= 3 && a3 != 1)
  {
    v4 = [MEMORY[0x1E4F76D80] reachabilityForInternetConnection];
    BOOL v3 = [v4 currentNetworkStatus] == 2;
  }
  return v3;
}

- (void)_processMetricsOfAssetClustersInMoment:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = a3;
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v6 = [v5 assets];
        uint64_t v7 = [v6 count];

        v8 = [v5 region];
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        [v8 center];
        uint64_t v33 = v9;
        uint64_t v34 = v10;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v11 = [v5 assets];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v30;
          double v15 = 0.0;
LABEL_8:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            v17 = [*(id *)(*((void *)&v29 + 1) + 8 * v16) location];
            [v17 coordinate];

            CLLocationCoordinate2DGetDistanceFrom();
            if (v15 < v18) {
              double v15 = v18;
            }
            if (v15 >= 100.0) {
              break;
            }
            if (v13 == ++v16)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
              if (v13) {
                goto LABEL_8;
              }
              break;
            }
          }

          uint64_t v19 = 88;
          if (v15 < 100.0) {
            uint64_t v19 = 80;
          }
          p_numberOfAssetClustersWithin50mOfCenter = (double *)((char *)self + v19);
          if (v15 < 50.0) {
            p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin50mOfCenter;
          }
          if (v15 < 20.0) {
            p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin20mOfCenter;
          }
          if (v15 < 10.0) {
            p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin10mOfCenter;
          }
        }
        else
        {

          p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin10mOfCenter;
        }
        double *p_numberOfAssetClustersWithin50mOfCenter = *p_numberOfAssetClustersWithin50mOfCenter + 1.0;
        v21.i64[0] = v7;
        v21.i64[1] = v7 * v7;
        *(float64x2_t *)&self->_sumNumberOfAssetsPerCluster = vaddq_f64(*(float64x2_t *)&self->_sumNumberOfAssetsPerCluster, vcvtq_f64_u64(v21));
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v28);
  }
  uint64_t v22 = [obj count];
  unint64_t numberOfMomentsRevGeocoded = self->_numberOfMomentsRevGeocoded;
  unint64_t v24 = self->_numberOfAssetClustersRevGeocoded + v22;
  v25.i64[0] = v22;
  v25.i64[1] = v22 * v22;
  *(float64x2_t *)&self->_sumNumberOfAssetClustersPerMoment = vaddq_f64(*(float64x2_t *)&self->_sumNumberOfAssetClustersPerMoment, vcvtq_f64_u64(v25));
  self->_unint64_t numberOfMomentsRevGeocoded = numberOfMomentsRevGeocoded + 1;
  self->_numberOfAssetClustersRevGeocoded = v24;
}

- (void)sendMetricsForGeocodeProcesssor:(id)a3 toAnalytics:(id)a4 progressBlock:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v47 = a4;
  id v46 = a5;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v55 = 0;
  v56 = (double *)&v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  v48 = _Block_copy(v46);
  if (!v48
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v56[3] < 0.01)
    || (v56[3] = v8,
        char v54 = 0,
        (*((void (**)(void *, char *, double))v48 + 2))(v48, &v54, 0.0),
        char v9 = *((unsigned char *)v60 + 24) | v54,
        (*((unsigned char *)v60 + 24) = v9) == 0))
  {
    [v7 sumNumberOfAssetClustersPerMoment];
    double v45 = v10;
    unint64_t v11 = [v7 numberOfMomentsRevGeocoded];
    [v7 sumNumberOfAssetClustersPerMoment];
    double v44 = v12;
    [v7 sumSquareNumberOfAssetClustersPerMoment];
    double v43 = v13;
    unint64_t v14 = [v7 numberOfMomentsRevGeocoded];
    [v7 sumNumberOfAssetsPerCluster];
    double v16 = v15;
    unint64_t v17 = [v7 numberOfAssetClustersRevGeocoded];
    [v7 sumNumberOfAssetsPerCluster];
    double v19 = v18;
    [v7 sumSquareNumberOfAssetsPerCluster];
    double v21 = v20;
    unint64_t v22 = [v7 numberOfAssetClustersRevGeocoded];
    [v7 numberOfAssetClustersWithin10mOfCenter];
    double v24 = v23;
    unint64_t v25 = [v7 numberOfAssetClustersRevGeocoded];
    [v7 numberOfAssetClustersWithin20mOfCenter];
    double v27 = v26;
    unint64_t v28 = [v7 numberOfAssetClustersRevGeocoded];
    [v7 numberOfAssetClustersWithin50mOfCenter];
    double v30 = v29;
    unint64_t v31 = [v7 numberOfAssetClustersRevGeocoded];
    [v7 numberOfAssetClustersWithin100mOfCenter];
    double v33 = v32;
    unint64_t v34 = [v7 numberOfAssetClustersRevGeocoded];
    [v7 numberOfAssetClusters100mPlusFromCenter];
    long long v36 = -[PGRevGeoMetricEvent initWithNumberOfAssetClustersPerMomentMean:numberOfAssetClustersPerMomentStdDev:numberOfAssetsPerClusterMean:numberOfAssetsPerClusterStdDev:ratioAssetClustersWithin10mOfCenter:ratioAssetClustersWithin20mOfCenter:ratioAssetClustersWithin50mOfCenter:ratioAssetClustersWithin100mOfCenter:ratioAssetClusters100mPlusFromCenter:]([PGRevGeoMetricEvent alloc], "initWithNumberOfAssetClustersPerMomentMean:numberOfAssetClustersPerMomentStdDev:numberOfAssetsPerClusterMean:numberOfAssetsPerClusterStdDev:ratioAssetClustersWithin10mOfCenter:ratioAssetClustersWithin20mOfCenter:ratioAssetClustersWithin50mOfCenter:ratioAssetClustersWithin100mOfCenter:ratioAssetClusters100mPlusFromCenter:", v45 / (double)v11, sqrt((double)v14 * v43 - v44 * v44) / (double)v14, v16 / (double)v17, sqrt((double)v22 * v21 - v19 * v19) / (double)v22, v24 / (double)v25, v27 / (double)v28, v30 / (double)v31, v33 / (double)v34, v35 / (double)(unint64_t)[v7 numberOfAssetClustersRevGeocoded]);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __103__PGGraphAssetRevGeocodeEnrichmentProcessor_sendMetricsForGeocodeProcesssor_toAnalytics_progressBlock___block_invoke;
    v49[3] = &unk_1E68F03F8;
    id v37 = v48;
    id v50 = v37;
    v51 = &v55;
    v52 = &v59;
    uint64_t v53 = 0x3F847AE147AE147BLL;
    [(PGAbstractMetricEvent *)v36 gatherMetricsWithProgressBlock:v49];
    if (*((unsigned char *)v60 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      *(_DWORD *)buf = 67109378;
      int v64 = 299;
      __int16 v65 = 2080;
      v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data"
            " Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
      long long v38 = MEMORY[0x1E4F14500];
    }
    else
    {
      v39 = [(PGRevGeoMetricEvent *)v36 identifier];
      v40 = [(PGRevGeoMetricEvent *)v36 payload];
      [v47 sendEvent:v39 withPayload:v40];

      if (!v48) {
        goto LABEL_15;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v56[3] < 0.01) {
        goto LABEL_15;
      }
      v56[3] = Current;
      char v54 = 0;
      (*((void (**)(id, char *, double))v37 + 2))(v37, &v54, 1.0);
      char v42 = *((unsigned char *)v60 + 24) | v54;
      *((unsigned char *)v60 + 24) = v42;
      if (!v42 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 67109378;
      int v64 = 302;
      __int16 v65 = 2080;
      v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data"
            " Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
      long long v38 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v64 = 281;
    __int16 v65 = 2080;
    v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data M"
          "odel Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_16:
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
}

void __103__PGGraphAssetRevGeocodeEnrichmentProcessor_sendMetricsForGeocodeProcesssor_toAnalytics_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v82 = a3;
  id v79 = a4;
  id v81 = a5;
  id v80 = a6;
  double v10 = (void (**)(void *, unsigned char *, double))_Block_copy(v80);
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x2020000000;
  char v101 = 0;
  uint64_t v94 = 0;
  v95 = (double *)&v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 0;
  if (!v10
    || (double v11 = CFAbsoluteTimeGetCurrent(), v11 - v95[3] < 0.01)
    || (v95[3] = v11,
        LOBYTE(info.numer) = 0,
        ((void (**)(void *, mach_timebase_info *, double))v10)[2](v10, &info, 0.0),
        char v12 = *((unsigned char *)v99 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v99 + 24) = v12) == 0))
  {
    double v13 = [v82 enrichmentLoggingConnection];
    os_signpost_id_t v14 = os_signpost_id_generate(v13);
    double v15 = v13;
    double v16 = v15;
    os_signpost_id_t spid = v14;
    unint64_t v78 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PGGraphAssetRevGeocodeEnrichmentProcessor", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v75 = mach_absolute_time();
    if (-[PGGraphAssetRevGeocodeEnrichmentProcessor _allowReverseGeocodingWithUpdateType:](self, "_allowReverseGeocodingWithUpdateType:", [v81 updateType]))
    {
      v76 = [v82 photoLibrary];
      uint64_t v17 = objc_msgSend(v76, "pg_urlForGraphApplicationData");
      v74 = (void *)v17;
      if (!v17)
      {
        double v30 = +[PGLogging sharedLogging];
        unint64_t v31 = [v30 loggingConnection];

        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1805000, v31, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: nil graph application data URL", buf, 2u);
        }

        if (!v10
          || (double Current = CFAbsoluteTimeGetCurrent(), Current - v95[3] < 0.01)
          || (v95[3] = Current,
              char v92 = 0,
              v10[2](v10, &v92, 1.0),
              char v33 = *((unsigned char *)v99 + 24) | v92,
              (*((unsigned char *)v99 + 24) = v33) == 0))
        {
          uint64_t v36 = mach_absolute_time();
          uint32_t numer = info.numer;
          uint32_t denom = info.denom;
          v39 = v16;
          v40 = v39;
          if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v40, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphAssetRevGeocodeEnrichmentProcessor", "", buf, 2u);
          }

          if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
            goto LABEL_85;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)v104 = "PGGraphAssetRevGeocodeEnrichmentProcessor";
          *(_WORD *)&v104[8] = 2048;
          *(double *)&v104[10] = (float)((float)((float)((float)(v36 - v75) * (float)numer) / (float)denom) / 1000000.0);
          double v35 = "[Performance] %s: %f ms";
          unint64_t v34 = v40;
          uint32_t v41 = 22;
          goto LABEL_48;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v104 = 219;
          *(_WORD *)&v104[4] = 2080;
          *(void *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
          unint64_t v34 = MEMORY[0x1E4F14500];
          double v35 = "Cancelled at line %d in file %s";
LABEL_47:
          uint32_t v41 = 18;
LABEL_48:
          _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, v35, buf, v41);
        }
LABEL_85:

        goto LABEL_86;
      }
      if ([(PGGraphAssetRevGeocodeEnrichmentProcessor *)self revGeoProviderDidChangeForGraphApplicationDataURL:v17])
      {
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __123__PGGraphAssetRevGeocodeEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke;
        v87[3] = &unk_1E68F03F8;
        v88 = v10;
        v89 = &v94;
        v90 = &v98;
        uint64_t v91 = 0x3F847AE147AE147BLL;
        [(PGGraphAssetRevGeocodeEnrichmentProcessor *)self invalidateReverseLocationDataForRevGeoProviderChangeUsingManager:v82 progressBlock:v87];
        if (*((unsigned char *)v99 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v104 = 229;
            *(_WORD *)&v104[4] = 2080;
            *(void *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_85;
        }
        [(PGGraphAssetRevGeocodeEnrichmentProcessor *)self setCurrentGeoProviderInGraphApplicationDataURL:v17];
      }
      if (v10)
      {
        double v42 = CFAbsoluteTimeGetCurrent();
        if (v42 - v95[3] >= 0.01)
        {
          v95[3] = v42;
          char v92 = 0;
          v10[2](v10, &v92, 0.2);
          char v43 = *((unsigned char *)v99 + 24) | v92;
          *((unsigned char *)v99 + 24) = v43;
          if (v43)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v104 = 234;
              *(_WORD *)&v104[4] = 2080;
              *(void *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
              unint64_t v34 = MEMORY[0x1E4F14500];
              double v35 = "Cancelled at line %d in file %s";
              goto LABEL_47;
            }
            goto LABEL_85;
          }
        }
      }
      double v44 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v45 = [v81 isResumingFullAnalysis];
      if ((v45 & 1) == 0)
      {
        [v81 momentsToProcessForMomentUpdateTypes:20 includeMomentsToIngest:1];
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v47 = [v46 countByEnumeratingWithState:&v83 objects:v102 count:16];
        if (v47)
        {
          uint64_t v48 = *(void *)v84;
          do
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              if (*(void *)v84 != v48) {
                objc_enumerationMutation(v46);
              }
              id v50 = [*(id *)(*((void *)&v83 + 1) + 8 * i) uuid];
              [v44 addObject:v50];
            }
            uint64_t v47 = [v46 countByEnumeratingWithState:&v83 objects:v102 count:16];
          }
          while (v47);
        }
      }
      v51 = +[PGRevGeocodeProcessor momentsRequiringRevGeocodingWithUUIDs:v44 inPhotoLibrary:v76 defaultToAllAssets:v45 loggingConnection:v16];
      if (v10)
      {
        double v52 = CFAbsoluteTimeGetCurrent();
        if (v52 - v95[3] >= 0.01)
        {
          v95[3] = v52;
          char v92 = 0;
          v10[2](v10, &v92, 0.3);
          char v53 = *((unsigned char *)v99 + 24) | v92;
          *((unsigned char *)v99 + 24) = v53;
          if (v53)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v104 = 251;
              *(_WORD *)&v104[4] = 2080;
              *(void *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            goto LABEL_84;
          }
        }
      }
      char v54 = objc_opt_class();
      uint64_t v55 = [v82 serviceManager];
      v56 = [v54 homeLocationsWithServiceManager:v55];
      homeLocations = self->_homeLocations;
      self->_homeLocations = v56;

      uint64_t v58 = [PGRevGeocodeProcessor alloc];
      uint64_t v59 = self->_homeLocations;
      v60 = [v82 locationCache];
      uint64_t v61 = [(PGRevGeocodeProcessor *)v58 initWithPhotoLibrary:v76 homeLocations:v59 loggingConnection:v16 locationCache:v60];

      BOOL v62 = [(PGRevGeocodeProcessor *)v61 revGeocodeMoments:v51 progressBlock:v80];
      if (v10
        && (double v63 = CFAbsoluteTimeGetCurrent(), v63 - v95[3] >= 0.01)
        && (v95[3] = v63,
            char v92 = 0,
            v10[2](v10, &v92, 0.7),
            char v64 = *((unsigned char *)v99 + 24) | v92,
            (*((unsigned char *)v99 + 24) = v64) != 0))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_83:

LABEL_84:
          goto LABEL_85;
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v104 = 255;
        *(_WORD *)&v104[4] = 2080;
        *(void *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
        __int16 v65 = MEMORY[0x1E4F14500];
      }
      else
      {
        if (!v62) {
          goto LABEL_83;
        }
        if ([(PGRevGeocodeProcessor *)v61 numberOfMomentsRevGeocoded]
          && [(PGRevGeocodeProcessor *)v61 numberOfAssetClustersRevGeocoded])
        {
          v66 = [v82 analytics];
          [(PGGraphAssetRevGeocodeEnrichmentProcessor *)self sendMetricsForGeocodeProcesssor:v61 toAnalytics:v66 progressBlock:v80];
        }
        uint64_t v67 = mach_absolute_time();
        uint32_t v69 = info.numer;
        uint32_t v68 = info.denom;
        v70 = v16;
        v71 = v70;
        if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v71, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphAssetRevGeocodeEnrichmentProcessor", "", buf, 2u);
        }

        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v104 = "PGGraphAssetRevGeocodeEnrichmentProcessor";
          *(_WORD *)&v104[8] = 2048;
          *(double *)&v104[10] = (float)((float)((float)((float)(v67 - v75) * (float)v69) / (float)v68) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v71, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        if (!v10) {
          goto LABEL_83;
        }
        double v72 = CFAbsoluteTimeGetCurrent();
        if (v72 - v95[3] < 0.01) {
          goto LABEL_83;
        }
        v95[3] = v72;
        char v92 = 0;
        v10[2](v10, &v92, 1.0);
        char v73 = *((unsigned char *)v99 + 24) | v92;
        *((unsigned char *)v99 + 24) = v73;
        if (!v73 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_83;
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v104 = 264;
        *(_WORD *)&v104[4] = 2080;
        *(void *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
        __int16 v65 = MEMORY[0x1E4F14500];
      }
      _os_log_impl(&dword_1D1805000, v65, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_83;
    }
    double v18 = +[PGLogging sharedLogging];
    double v19 = [v18 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "AssetsRevGeocoding: reverse geocoding not allowed", buf, 2u);
    }

    if (v10
      && (double v20 = CFAbsoluteTimeGetCurrent(), v20 - v95[3] >= 0.01)
      && (v95[3] = v20,
          char v92 = 0,
          v10[2](v10, &v92, 1.0),
          char v21 = *((unsigned char *)v99 + 24) | v92,
          (*((unsigned char *)v99 + 24) = v21) != 0))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_86:

        goto LABEL_87;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v104 = 208;
      *(_WORD *)&v104[4] = 2080;
      *(void *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
      unint64_t v22 = MEMORY[0x1E4F14500];
      double v23 = "Cancelled at line %d in file %s";
      uint32_t v24 = 18;
    }
    else
    {
      uint64_t v25 = mach_absolute_time();
      uint32_t v27 = info.numer;
      uint32_t v26 = info.denom;
      unint64_t v28 = v16;
      double v29 = v28;
      if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v29, OS_SIGNPOST_INTERVAL_END, v14, "PGGraphAssetRevGeocodeEnrichmentProcessor", "", buf, 2u);
      }

      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
        goto LABEL_86;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)v104 = "PGGraphAssetRevGeocodeEnrichmentProcessor";
      *(_WORD *)&v104[8] = 2048;
      *(double *)&v104[10] = (float)((float)((float)((float)(v25 - v75) * (float)v27) / (float)v26) / 1000000.0);
      double v23 = "[Performance] %s: %f ms";
      unint64_t v22 = v29;
      uint32_t v24 = 22;
    }
    _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, v23, buf, v24);
    goto LABEL_86;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v104 = 198;
    *(_WORD *)&v104[4] = 2080;
    *(void *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_87:
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);
}

void __123__PGGraphAssetRevGeocodeEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)invalidateReverseLocationDataForRevGeoProviderChangeUsingManager:(id)a3 progressBlock:(id)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 enrichmentLoggingConnection];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  char v9 = v7;
  double v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "InvalidReverseLocationRevGeoProviderChange", "", buf, 2u);
  }
  unint64_t v46 = v8 - 1;
  uint64_t v47 = v10;
  os_signpost_id_t spid = v8;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v45 = mach_absolute_time();
  id v51 = v6;
  double v11 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);
  id v48 = v5;
  char v12 = [v5 photoLibrary];
  double v13 = [v12 librarySpecificFetchOptions];
  v64[0] = *MEMORY[0x1E4F39518];
  os_signpost_id_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
  [v13 addFetchPropertySets:v14];

  [v13 setIncludeGuestAssets:1];
  double v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"additionalAttributes.reverseLocationDataIsValid == YES"];
  [v13 setInternalPredicate:v15];

  id v50 = v13;
  double v16 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v13];
  dispatch_group_t v17 = dispatch_group_create();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke;
  aBlock[3] = &unk_1E68EABB8;
  dispatch_group_t group = v17;
  dispatch_group_t v57 = group;
  id v49 = v12;
  id v58 = v49;
  double v18 = _Block_copy(aBlock);
  double v19 = [MEMORY[0x1E4F1CA48] array];
  double v52 = (void (**)(void, void))v18;
  if ([v16 count])
  {
    uint64_t v54 = 0;
    uint64_t v20 = 0;
    double v21 = 0.0;
    while (1)
    {
      unint64_t v22 = (void *)MEMORY[0x1D25FED50]();
      double v23 = [v16 objectAtIndex:v20];
      uint32_t v24 = (void *)MEMORY[0x1E4F8A930];
      [v23 locationCoordinate];
      if (objc_msgSend(v24, "canUseCoordinate:"))
      {
        uint64_t v25 = (void *)MEMORY[0x1E4F8AB70];
        uint32_t v26 = [v23 photosOneUpProperties];
        uint32_t v27 = [v26 reverseLocationData];
        unint64_t v28 = [v25 infoFromPlistData:v27];

        if (([v28 locationWasResolvedWithBestRevGeoProvider] & 1) == 0) {
          [v19 addObject:v23];
        }
        if ((unint64_t)[v19 count] >= 0x3E8)
        {
          dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
          double v29 = (void *)[v19 copy];
          ((void (**)(void, void *))v52)[2](v52, v29);

          v54 += [v19 count];
          [v19 removeAllObjects];
        }
        if (v11)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          if (Current - v21 >= 0.01)
          {
            char v55 = 0;
            v11[2](v11, &v55, 0.5);
            if (v55)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)uint64_t v61 = 182;
                *(_WORD *)&v61[4] = 2080;
                *(void *)&v61[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              double v32 = v47;
              unint64_t v31 = v48;
              char v43 = v50;
              long long v38 = v51;
              v39 = v49;
              goto LABEL_27;
            }
            double v21 = Current;
          }
        }
      }
      if (++v20 >= (unint64_t)[v16 count]) {
        goto LABEL_19;
      }
    }
  }
  uint64_t v54 = 0;
LABEL_19:
  if ([v19 count])
  {
    ((void (**)(void, void *))v52)[2](v52, v19);
    v54 += [v19 count];
  }
  double v32 = v47;
  unint64_t v31 = v48;
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v33 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v36 = v47;
  id v37 = v36;
  long long v38 = v51;
  v39 = v49;
  if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v61 = v54;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v37, OS_SIGNPOST_INTERVAL_END, spid, "InvalidReverseLocationRevGeoProviderChange", "%ld assets invalidated", buf, 0xCu);
  }

  v40 = v37;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    float v41 = (float)((float)((float)(v33 - v45) * (float)numer) / (float)denom) / 1000000.0;
    double v42 = objc_msgSend(NSString, "stringWithFormat:", @"%ld assets invalidated", v54);
    *(_DWORD *)buf = 136315650;
    *(void *)uint64_t v61 = "InvalidReverseLocationRevGeoProviderChange";
    *(_WORD *)&v61[8] = 2112;
    *(void *)&v61[10] = v42;
    __int16 v62 = 2048;
    double v63 = v41;
    _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  char v43 = v50;
LABEL_27:
}

void __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke_2;
  v8[3] = &unk_1E68F0B18;
  id v9 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke_3;
  v6[3] = &unk_1E68EAB90;
  id v7 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 performChanges:v8 completionHandler:v6];
}

void __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = objc_msgSend(MEMORY[0x1E4F38ED0], "changeRequestForAsset:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setReverseLocationData:0];
        [v6 setReverseLocationDataIsValid:0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = +[PGLogging sharedLogging];
    long long v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Cannot reset the reverse location information with error %@", (uint8_t *)&v8, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setCurrentGeoProviderInGraphApplicationDataURL:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 URLByAppendingPathComponent:@"revgeoprovider.plist"];
  uint64_t v4 = [MEMORY[0x1E4F8AB68] currentRevGeoProvider];
  double v13 = @"revgeoprovider";
  v14[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v10 = 0;
  char v6 = [v5 writeToURL:v3 error:&v10];
  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    int v8 = +[PGLogging sharedLogging];
    id v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: Could not save the new rev geo provider with error (%@)", buf, 0xCu);
    }
  }
}

- (BOOL)revGeoProviderDidChangeForGraphApplicationDataURL:(id)a3
{
  uint64_t v3 = [a3 URLByAppendingPathComponent:@"revgeoprovider.plist"];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
  id v5 = [MEMORY[0x1E4F8AB68] currentRevGeoProvider];
  char v6 = [v4 objectForKeyedSubscript:@"revgeoprovider"];
  char v7 = [v5 isEqualToString:v6] ^ 1;

  return v7;
}

- (PGGraphAssetRevGeocodeEnrichmentProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGGraphAssetRevGeocodeEnrichmentProcessor;
  uint64_t v2 = [(PGGraphAssetRevGeocodeEnrichmentProcessor *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    homeLocations = v2->_homeLocations;
    v2->_homeLocations = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_requiresValidGraph = 0;
  }
  return v3;
}

+ (id)homeLocationsWithServiceManager:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_super v6 = [v4 mePerson];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__PGGraphAssetRevGeocodeEnrichmentProcessor_homeLocationsWithServiceManager___block_invoke;
  v9[3] = &unk_1E68EABE0;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateAddressesOfType:0 asCLLocationsWithBlock:v9];

  return v7;
}

uint64_t __77__PGGraphAssetRevGeocodeEnrichmentProcessor_homeLocationsWithServiceManager___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end