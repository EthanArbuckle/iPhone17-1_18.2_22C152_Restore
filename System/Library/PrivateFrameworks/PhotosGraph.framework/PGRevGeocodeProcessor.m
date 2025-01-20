@interface PGRevGeocodeProcessor
+ (id)momentsRequiringRevGeocodingWithUUIDs:(id)a3 inPhotoLibrary:(id)a4 defaultToAllAssets:(BOOL)a5 loggingConnection:(id)a6;
+ (id)reverseGeoFetchOptionsForPhotoLibrary:(id)a3;
- (BOOL)_populateCacheWithRegions:(id)a3 withProgressBlock:(id)a4;
- (BOOL)_regionIsHome:(id)a3;
- (BOOL)_revGeocodeAssetClusters:(id)a3 progressBlock:(id)a4;
- (BOOL)_setRevGeoLocationData:(id)a3 onAssets:(id)a4;
- (BOOL)revGeocodeAssets:(id)a3 progressBlock:(id)a4;
- (BOOL)revGeocodeMoments:(id)a3 progressBlock:(id)a4;
- (NSArray)homeLocations;
- (OS_os_log)loggingConnection;
- (PGRevGeocodeProcessor)initWithPhotoLibrary:(id)a3 homeLocations:(id)a4 loggingConnection:(id)a5 locationCache:(id)a6;
- (PHPhotoLibrary)photoLibrary;
- (double)numberOfAssetClusters100mPlusFromCenter;
- (double)numberOfAssetClustersWithin100mOfCenter;
- (double)numberOfAssetClustersWithin10mOfCenter;
- (double)numberOfAssetClustersWithin20mOfCenter;
- (double)numberOfAssetClustersWithin50mOfCenter;
- (double)sumNumberOfAssetClustersPerMoment;
- (double)sumNumberOfAssetsPerCluster;
- (double)sumSquareNumberOfAssetClustersPerMoment;
- (double)sumSquareNumberOfAssetsPerCluster;
- (id)_clusterAssets:(id)a3 assetsWithInvalidLocationInMoment:(id *)a4;
- (id)_clusterAssetsInMoment:(id)a3 assetsWithInvalidLocationInMoment:(id *)a4;
- (id)_revGeoLocationDataForRegion:(id)a3;
- (unint64_t)numberOfAssetClustersRevGeocoded;
- (unint64_t)numberOfMomentsRevGeocoded;
- (void)_processMetricsOfAssetClustersInMoment:(id)a3;
- (void)_resetMetrics;
- (void)_updateGeoInfoForAssetClusters:(id)a3 progressBlock:(id)a4;
- (void)setHomeLocations:(id)a3;
- (void)setLoggingConnection:(id)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PGRevGeocodeProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_locationCache, 0);
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

- (void)setLoggingConnection:(id)a3
{
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (void)_resetMetrics
{
  self->_numberOfAssetClustersRevGeocoded = 0;
  *(_OWORD *)&self->_numberOfAssetClusters100mPlusFromCenter = 0u;
  *(_OWORD *)&self->_numberOfAssetClustersWithin50mOfCenter = 0u;
  *(_OWORD *)&self->_numberOfAssetClustersWithin10mOfCenter = 0u;
  *(_OWORD *)&self->_sumNumberOfAssetsPerCluster = 0u;
  *(_OWORD *)&self->_sumNumberOfAssetClustersPerMoment = 0u;
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

          uint64_t v19 = 104;
          if (v15 < 100.0) {
            uint64_t v19 = 96;
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

- (id)_clusterAssets:(id)a3 assetsWithInvalidLocationInMoment:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x1E4F8A930];
        [v12 locationCoordinate];
        if (objc_msgSend(v13, "canUseCoordinate:")) {
          uint64_t v14 = v7;
        }
        else {
          uint64_t v14 = v6;
        }
        [v14 addObject:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v9);
  }

  if (a4) {
    *a4 = v6;
  }
  if ([v7 count])
  {
    long long v38 = v6;
    double v15 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global_57262];
    [v15 setMaximumDistance:20.0];
    [v15 setMinimumNumberOfObjects:1];
    long long v36 = v15;
    long long v37 = v7;
    uint64_t v16 = [v15 performWithDataset:v7 progressBlock:0];
    id v41 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v40 = v16;
    uint64_t v17 = [v40 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v48;
      double v20 = *MEMORY[0x1E4F1E6D8];
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(v40);
          }
          uint64_t v22 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          v23 = [v22 meanRegion:20.0];
          if (v23)
          {
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            unint64_t v24 = [v22 objects];
            uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
            double v26 = v20;
            if (v25)
            {
              uint64_t v27 = v25;
              uint64_t v28 = *(void *)v44;
              double v26 = v20;
              do
              {
                for (uint64_t k = 0; k != v27; ++k)
                {
                  if (*(void *)v44 != v28) {
                    objc_enumerationMutation(v24);
                  }
                  long long v30 = [*(id *)(*((void *)&v43 + 1) + 8 * k) coarseLocationProperties];
                  [v30 gpsHorizontalAccuracy];
                  double v26 = fmax(v26, v31);
                }
                uint64_t v27 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
              }
              while (v27);
            }

            [v23 setClsHorizontalAccuracy:v26];
            long long v32 = [PGAssetCluster alloc];
            uint64_t v33 = [v22 objects];
            uint64_t v34 = [(PGAssetCluster *)v32 initWithAssets:v33 region:v23];

            [v41 addObject:v34];
          }
        }
        uint64_t v18 = [v40 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v18);
    }

    [(PGRevGeocodeProcessor *)self _processMetricsOfAssetClustersInMoment:v41];
    uint64_t v7 = v37;
    v6 = v38;
  }
  else
  {
    id v41 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v41;
}

double __74__PGRevGeocodeProcessor__clusterAssets_assetsWithInvalidLocationInMoment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 coarseLocationProperties];
  [v6 gpsHorizontalAccuracy];
  double v8 = v7;

  uint64_t v9 = [v5 coarseLocationProperties];
  [v9 gpsHorizontalAccuracy];
  double v11 = v10;

  LODWORD(v9) = [MEMORY[0x1E4F8A930] horizontalAccuracyIsCoarse:v8];
  double v12 = 21.0;
  if (v9 == [MEMORY[0x1E4F8A930] horizontalAccuracyIsCoarse:v11])
  {
    [v4 locationCoordinate];
    [v5 locationCoordinate];
    CLLocationCoordinate2DGetDistanceFrom();
    double v12 = v13;
  }

  return v12;
}

- (id)_clusterAssetsInMoment:(id)a3 assetsWithInvalidLocationInMoment:(id *)a4
{
  id v6 = a3;
  double v7 = objc_opt_class();
  double v8 = [(PGRevGeocodeProcessor *)self photoLibrary];
  uint64_t v9 = [v7 reverseGeoFetchOptionsForPhotoLibrary:v8];

  double v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v9];

  double v11 = [(PGRevGeocodeProcessor *)self _clusterAssets:v10 assetsWithInvalidLocationInMoment:a4];

  return v11;
}

- (BOOL)_regionIsHome:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 radius];
  double v6 = v5;
  [v4 center];
  uint64_t v24 = v7;
  uint64_t v25 = v8;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [(PGRevGeocodeProcessor *)self homeLocations];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    double v11 = v6 + 100.0;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "coordinate", 0, 0);
        uint64_t v18 = v14;
        uint64_t v19 = v15;
        CLLocationCoordinate2DGetDistanceFrom();
        if (v16 <= v11)
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16, v18, v19);
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)_revGeoLocationDataForRegion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CLSLocationCache *)self->_locationCache placemarksForLocation:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "revGeoLocationData", (void)v17);
        if (v10)
        {
          uint64_t v14 = (void *)v10;
          uint64_t v15 = [MEMORY[0x1E4F8AB70] infoFromPlistData:v10];
          objc_msgSend(v15, "setIsHome:", -[PGRevGeocodeProcessor _regionIsHome:](self, "_regionIsHome:", v4));
          double v13 = [v15 plistData];

          uint64_t v12 = v5;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  double v11 = +[PGLogging sharedLogging];
  uint64_t v12 = [v11 loggingConnection];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478083;
    id v22 = v4;
    __int16 v23 = 2113;
    uint64_t v24 = v5;
    _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: placemarks for region (%{private}@) did not contain rev geo data: (%{private}@)", buf, 0x16u);
  }
  double v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_populateCacheWithRegions:(id)a3 withProgressBlock:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F76D00];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithLocationCache:self->_locationCache];
  id v10 = objc_alloc(MEMORY[0x1E4F76D88]);
  v22[0] = v9;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  uint64_t v12 = (void *)[v10 initWithQueryPerformers:v11];

  double v13 = [(PGRevGeocodeProcessor *)self loggingConnection];
  [v12 setLoggingConnection:v13];

  id v19 = 0;
  char v14 = [v12 createCacheForRegions:v8 progressBlock:v7 error:&v19];

  id v15 = v19;
  if ((v14 & 1) == 0)
  {
    double v16 = +[PGLogging sharedLogging];
    long long v17 = [v16 loggingConnection];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v15;
      _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: Could not create cache for regions with error (%@)", buf, 0xCu);
    }
  }
  return v14;
}

- (void)_updateGeoInfoForAssetClusters:(id)a3 progressBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8)
  {
    unint64_t v9 = v8;
    id v25 = v7;
    id v10 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      double v14 = 1.0 / (double)v9;
      uint64_t v15 = *(void *)v29;
      double v16 = 0.0;
      double v17 = 0.0;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v11);
          }
          id v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v20 = (void *)MEMORY[0x1D25FED50]();
          if (v10)
          {
            double Current = CFAbsoluteTimeGetCurrent();
            if (Current - v16 >= 0.01)
            {
              char v27 = 0;
              v10[2](v10, &v27, v17);
              if (v27)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v33 = 337;
                  __int16 v34 = 2080;
                  long long v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                id v7 = v25;
                id v6 = v26;
                goto LABEL_23;
              }
              double v16 = Current;
            }
          }
          id v22 = objc_msgSend(v19, "region", v25);
          __int16 v23 = [(PGRevGeocodeProcessor *)self _revGeoLocationDataForRegion:v22];

          uint64_t v24 = [v19 assets];
          [(PGRevGeocodeProcessor *)self _setRevGeoLocationData:v23 onAssets:v24];

          double v17 = v14 + v17;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      double v16 = 0.0;
    }

    id v7 = v25;
    id v6 = v26;
    if (v10)
    {
      if (CFAbsoluteTimeGetCurrent() - v16 >= 0.01)
      {
        char v27 = 0;
        v10[2](v10, &v27, 1.0);
        if (v27)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v33 = 345;
            __int16 v34 = 2080;
            long long v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGRevGeocodeProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_23:
  }
}

- (BOOL)_revGeocodeAssetClusters:(id)a3 progressBlock:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _Block_copy(v7);
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  long long v36 = (double *)&v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  unint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v10);
        }
        double v14 = [*(id *)(*((void *)&v31 + 1) + 8 * i) region];
        [v9 addObject:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v11);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__PGRevGeocodeProcessor__revGeocodeAssetClusters_progressBlock___block_invoke;
  v26[3] = &unk_1E68F03F8;
  id v15 = v8;
  id v27 = v15;
  long long v28 = &v35;
  long long v29 = &v39;
  uint64_t v30 = 0x3F847AE147AE147BLL;
  if ([(PGRevGeocodeProcessor *)self _populateCacheWithRegions:v9 withProgressBlock:v26])
  {
    if (!v15
      || (double Current = CFAbsoluteTimeGetCurrent(), Current - v36[3] < 0.01)
      || (v36[3] = Current,
          char v25 = 0,
          (*((void (**)(id, char *, double))v15 + 2))(v15, &v25, 0.5),
          char v17 = *((unsigned char *)v40 + 24) | v25,
          (*((unsigned char *)v40 + 24) = v17) == 0))
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __64__PGRevGeocodeProcessor__revGeocodeAssetClusters_progressBlock___block_invoke_282;
      v20[3] = &unk_1E68F03F8;
      id v21 = v15;
      id v22 = &v35;
      __int16 v23 = &v39;
      uint64_t v24 = 0x3F847AE147AE147BLL;
      [(PGRevGeocodeProcessor *)self _updateGeoInfoForAssetClusters:v10 progressBlock:v20];

      BOOL v18 = 1;
      goto LABEL_16;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v44 = 313;
      __int16 v45 = 2080;
      long long v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data"
            " Model Enrichment/PGRevGeocodeProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  BOOL v18 = 0;
LABEL_16:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v18;
}

void __64__PGRevGeocodeProcessor__revGeocodeAssetClusters_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __64__PGRevGeocodeProcessor__revGeocodeAssetClusters_progressBlock___block_invoke_282(uint64_t a1, unsigned char *a2, double a3)
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

- (BOOL)_setRevGeoLocationData:(id)a3 onAssets:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v5 = a4;
  uint64_t v39 = [MEMORY[0x1E4F76D08] sharedLocationShifter];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v13 = [v12 photosOneUpProperties];
        int v14 = [v13 shiftedLocationIsValid];

        if (v14)
        {
          id v15 = [MEMORY[0x1E4F1CA98] null];
          [v6 addObject:v15];
        }
        else
        {
          double v16 = [v12 location];
          id v15 = v16;
          if (v16
            && ([v16 coordinate],
                double v18 = v17,
                double v20 = v19,
                (objc_msgSend(MEMORY[0x1E4F8A930], "canUseCoordinate:") & 1) != 0)
            && (objc_msgSend(MEMORY[0x1E4F76D08], "isLocationShiftRequiredForCoordinate:", v18, v20) & 1) != 0)
          {
            objc_msgSend(v39, "shiftedCoordinateForOriginalCoordinate:", v18, v20);
            uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v21 longitude:v22];
          }
          else
          {
            uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
          }
          uint64_t v24 = (void *)v23;
          [v6 addObject:v23];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v9);
  }

  uint64_t v25 = [v7 count];
  if (v25)
  {
    unint64_t v26 = v25;
    unint64_t v27 = 0;
    while (1)
    {
      unint64_t v28 = v27 + 1000;
      unint64_t v29 = v27 + 1000 >= v26 ? v26 : v27 + 1000;
      uint64_t v30 = [(PGRevGeocodeProcessor *)self photoLibrary];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __57__PGRevGeocodeProcessor__setRevGeoLocationData_onAssets___block_invoke;
      v41[3] = &unk_1E68ECB78;
      unint64_t v45 = v27;
      unint64_t v46 = v29;
      id v42 = v7;
      id v43 = v6;
      id v44 = v38;
      id v40 = 0;
      char v31 = [v30 performChangesAndWait:v41 error:&v40];
      id v32 = v40;

      if ((v31 & 1) == 0) {
        break;
      }

      unint64_t v27 = v28;
      if (v28 >= v26) {
        goto LABEL_23;
      }
    }
    long long v34 = +[PGLogging sharedLogging];
    uint64_t v35 = [v34 loggingConnection];

    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v32;
      _os_log_error_impl(&dword_1D1805000, v35, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: Error saving reverse geocoding data to database: %@", buf, 0xCu);
    }

    BOOL v33 = 0;
  }
  else
  {
LABEL_23:
    BOOL v33 = 1;
  }

  return v33;
}

void __57__PGRevGeocodeProcessor__setRevGeoLocationData_onAssets___block_invoke(uint64_t a1)
{
  for (unint64_t i = *(void *)(a1 + 56); i < *(void *)(a1 + 64); ++i)
  {
    v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
    id v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v5 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:v3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 setShiftedLocation:v4];
    }
    [v5 setReverseLocationData:*(void *)(a1 + 48)];
    [v5 setReverseLocationDataIsValid:1];
  }
}

- (BOOL)revGeocodeMoments:(id)a3 progressBlock:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v50 = a4;
  id v5 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v50);
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  uint64_t v66 = 0;
  v67 = (double *)&v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  if (v5)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v67[3] >= 0.01)
    {
      v67[3] = Current;
      LOBYTE(info.numer) = 0;
      v5[2](v5, &info, 0.0);
      char v7 = *((unsigned char *)v71 + 24) | LOBYTE(info.numer);
      *((unsigned char *)v71 + 24) = v7;
      if (v7)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v75 = 142;
          *(_WORD *)&v75[4] = 2080;
          *(void *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        BOOL v8 = 0;
        goto LABEL_59;
      }
    }
  }
  unint64_t v53 = [v54 count];
  if (!v53)
  {
    BOOL v8 = 1;
    goto LABEL_59;
  }
  uint64_t v9 = [(PGRevGeocodeProcessor *)self loggingConnection];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = v9;
  uint64_t v12 = v11;
  os_signpost_id_t spid = v10;
  unint64_t v48 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ReverseGeocodeMoments", "", buf, 2u);
  }
  long long v49 = v12;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v13 = mach_absolute_time();
  [(PGRevGeocodeProcessor *)self _resetMetrics];
  uint64_t v46 = v13;
  int v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = 0;
  uint64_t v51 = 0;
  unint64_t v52 = v53 - 1;
  double v17 = 0.0;
  double v18 = 1.0 / (double)v53;
  do
  {
    double v19 = (void *)MEMORY[0x1D25FED50]();
    if (!v5
      || (double v20 = CFAbsoluteTimeGetCurrent(), v20 - v67[3] < 0.01)
      || (v67[3] = v20,
          char v64 = 0,
          v5[2](v5, (mach_timebase_info *)&v64, v17),
          char v21 = *((unsigned char *)v71 + 24) | v64,
          (*((unsigned char *)v71 + 24) = v21) == 0))
    {
      uint64_t v23 = [v54 objectAtIndexedSubscript:v16];
      id v63 = 0;
      uint64_t v24 = [(PGRevGeocodeProcessor *)self _clusterAssetsInMoment:v23 assetsWithInvalidLocationInMoment:&v63];
      id v25 = v63;
      [v14 addObjectsFromArray:v24];
      if (v25) {
        [v15 addObjectsFromArray:v25];
      }
      if (v5)
      {
        double v26 = CFAbsoluteTimeGetCurrent();
        if (v26 - v67[3] >= 0.01)
        {
          v67[3] = v26;
          char v64 = 0;
          v5[2](v5, (mach_timebase_info *)&v64, v17 + v18 * 0.5);
          char v27 = *((unsigned char *)v71 + 24) | v64;
          *((unsigned char *)v71 + 24) = v27;
          if (v27)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v75 = 180;
              *(_WORD *)&v75[4] = 2080;
              *(void *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_40:
            int v22 = 1;
            goto LABEL_41;
          }
        }
      }
      unint64_t v28 = [v15 count];
      if (v28 && (v28 > 0x3E7 || v52 == v16))
      {
        BOOL v29 = [(PGRevGeocodeProcessor *)self _setRevGeoLocationData:0 onAssets:v15];
        [v15 removeAllObjects];
        if (!v29)
        {
          BOOL v33 = +[PGLogging sharedLogging];
          long long v34 = [v33 loggingConnection];

          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: stopping reverse geocoding early", buf, 2u);
          }

          goto LABEL_40;
        }
      }
      if ((unint64_t)[v14 count] > 0x3E7 || v52 == v16)
      {
        double v30 = 0.7 / (double)v53 * (double)(unint64_t)(v16 - v51 + 1);
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __57__PGRevGeocodeProcessor_revGeocodeMoments_progressBlock___block_invoke;
        v56[3] = &unk_1E68ECB50;
        double v60 = v17;
        double v61 = v30;
        v57 = v5;
        uint64_t v58 = &v66;
        uint64_t v62 = 0x3F847AE147AE147BLL;
        v59 = &v70;
        if (![(PGRevGeocodeProcessor *)self _revGeocodeAssetClusters:v14 progressBlock:v56])
        {
          char v31 = +[PGLogging sharedLogging];
          id v32 = [v31 loggingConnection];

          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1805000, v32, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: stopping reverse geocoding early", buf, 2u);
          }

          goto LABEL_40;
        }
        [v14 removeAllObjects];

        uint64_t v51 = v16 + 1;
        double v17 = v17 + v30;
      }
      int v22 = 0;
      double v17 = v18 + v17;
LABEL_41:

      goto LABEL_42;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = 167;
      *(_WORD *)&v75[4] = 2080;
      *(void *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    int v22 = 1;
LABEL_42:
    if (v22) {
      goto LABEL_56;
    }
    ++v16;
  }
  while (v53 != v16);
  uint64_t v35 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v38 = v49;
  uint64_t v39 = v38;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    unint64_t numberOfMomentsRevGeocoded = self->_numberOfMomentsRevGeocoded;
    *(_DWORD *)buf = 134217984;
    *(void *)v75 = numberOfMomentsRevGeocoded;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v39, OS_SIGNPOST_INTERVAL_END, spid, "ReverseGeocodeMoments", "[REVGEO] Reverse geocode %lu moments", buf, 0xCu);
  }

  uint64_t v41 = v39;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    id v42 = objc_msgSend(NSString, "stringWithFormat:", @"[REVGEO] Reverse geocode %lu moments", self->_numberOfMomentsRevGeocoded);
    *(_DWORD *)buf = 136315650;
    *(void *)v75 = "ReverseGeocodeMoments";
    *(_WORD *)&v75[8] = 2112;
    *(void *)&v75[10] = v42;
    __int16 v76 = 2048;
    double v77 = (float)((float)((float)((float)(v35 - v46) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  if (v5)
  {
    double v43 = CFAbsoluteTimeGetCurrent();
    if (v43 - v67[3] >= 0.01)
    {
      v67[3] = v43;
      char v64 = 0;
      v5[2](v5, (mach_timebase_info *)&v64, 1.0);
      char v44 = *((unsigned char *)v71 + 24) | v64;
      *((unsigned char *)v71 + 24) = v44;
      if (v44)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v75 = 224;
          *(_WORD *)&v75[4] = 2080;
          *(void *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_56:
        BOOL v8 = 0;
        goto LABEL_58;
      }
    }
  }
  BOOL v8 = 1;
LABEL_58:

LABEL_59:
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);

  return v8;
}

void __57__PGRevGeocodeProcessor_revGeocodeMoments_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + a3 * v7);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)revGeocodeAssets:(id)a3 progressBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  double v30 = [MEMORY[0x1E4F1CA48] array];
  double v6 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = [v12 locationDataProperties];
        [v13 coordinate];
        double v15 = v14;
        double v17 = v16;

        if (objc_msgSend(MEMORY[0x1E4F8A930], "canUseCoordinate:", v15, v17))
        {
          id v18 = objc_alloc(MEMORY[0x1E4F1E5A8]);
          double v19 = [MEMORY[0x1E4F29128] UUID];
          double v20 = [v19 UUIDString];
          char v21 = objc_msgSend(v18, "initWithCenter:radius:identifier:", v20, v15, v17, 20.0);

          int v22 = [v12 coarseLocationProperties];
          [v22 gpsHorizontalAccuracy];
          objc_msgSend(v21, "setClsHorizontalAccuracy:");

          uint64_t v23 = [PGAssetCluster alloc];
          uint64_t v35 = v12;
          uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
          id v25 = [(PGAssetCluster *)v23 initWithAssets:v24 region:v21];

          [v30 addObject:v25];
        }
        else
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  [(PGRevGeocodeProcessor *)self _setRevGeoLocationData:0 onAssets:v6];
  BOOL v26 = [(PGRevGeocodeProcessor *)self _revGeocodeAssetClusters:v30 progressBlock:v29];

  return v26;
}

- (PGRevGeocodeProcessor)initWithPhotoLibrary:(id)a3 homeLocations:(id)a4 loggingConnection:(id)a5 locationCache:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PGRevGeocodeProcessor;
  double v14 = [(PGRevGeocodeProcessor *)&v17 init];
  double v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_photoLibrary, v10);
    objc_storeStrong((id *)&v15->_homeLocations, a4);
    objc_storeStrong((id *)&v15->_loggingConnection, a5);
    objc_storeStrong((id *)&v15->_locationCache, a6);
  }

  return v15;
}

+ (id)reverseGeoFetchOptionsForPhotoLibrary:(id)a3
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v3 = [a3 librarySpecificFetchOptions];
  uint64_t v4 = *MEMORY[0x1E4F394D0];
  v7[0] = *MEMORY[0x1E4F39440];
  v7[1] = v4;
  v7[2] = *MEMORY[0x1E4F39518];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  [v3 addFetchPropertySets:v5];

  [v3 setIncludeGuestAssets:1];
  return v3;
}

+ (id)momentsRequiringRevGeocodingWithUUIDs:(id)a3 inPhotoLibrary:(id)a4 defaultToAllAssets:(BOOL)a5 loggingConnection:(id)a6
{
  BOOL v7 = a5;
  v43[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  os_signpost_id_t v12 = os_signpost_id_generate(v10);
  id v13 = v10;
  double v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MomentsRequiringRevGeocoding", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v15 = mach_absolute_time();
  double v16 = [v11 librarySpecificFetchOptions];

  objc_super v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $asset, $asset.%K == NO).@count != 0", @"assets", @"additionalAttributes.reverseLocationDataIsValid"];
  if ([v9 count])
  {
    uint64_t v34 = v15;
    id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", v9];
    double v19 = (void *)MEMORY[0x1E4F28BA0];
    v43[0] = v17;
    v43[1] = v18;
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    uint64_t v21 = [v19 andPredicateWithSubpredicates:v20];

    objc_super v17 = (void *)v21;
  }
  else
  {
    if (!v7)
    {
      uint64_t v24 = 0;
      goto LABEL_14;
    }
    uint64_t v34 = v15;
  }
  [v16 setInternalPredicate:v17];
  int v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  id v42 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  [v16 setSortDescriptors:v23];

  uint64_t v24 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v16];
  uint64_t v25 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  unint64_t v28 = v14;
  id v29 = v28;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    uint64_t v30 = [v24 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = (const char *)v30;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v29, OS_SIGNPOST_INTERVAL_END, v12, "MomentsRequiringRevGeocoding", "[REVGEO] Fetch %lu moments requiring reverse geocoding", buf, 0xCu);
  }

  long long v31 = v29;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    long long v32 = objc_msgSend(NSString, "stringWithFormat:", @"[REVGEO] Fetch %lu moments requiring reverse geocoding", objc_msgSend(v24, "count"));
    *(_DWORD *)buf = 136315650;
    uint64_t v37 = "MomentsRequiringRevGeocoding";
    __int16 v38 = 2112;
    uint64_t v39 = v32;
    __int16 v40 = 2048;
    double v41 = (float)((float)((float)((float)(v25 - v34) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
LABEL_14:

  return v24;
}

@end