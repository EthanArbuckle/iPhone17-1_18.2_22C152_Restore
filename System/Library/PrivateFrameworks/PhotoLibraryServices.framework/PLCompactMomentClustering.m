@interface PLCompactMomentClustering
- (PLCompactMomentClustering)initWithDataManager:(id)a3 frequentLocations:(id)a4;
- (id)_assetClustersFromDataClusters:(id)a3;
- (id)_clusterAssetsWithUnusableLocation:(id)a3;
- (id)_clusterAssetsWithUsableLocation:(id)a3;
- (id)_mergeAssetClustersWithLocation:(id)a3 withAssetClustersWithoutLocation:(id)a4;
- (id)_processedLocationTypeByAssetUUIDFromAssets:(id)a3;
- (id)_runDBSCANClusteringWithAssets:(id)a3;
- (id)_shareStateByAssetUUIDFromAssets:(id)a3 momentHasMixedOwnership:(BOOL *)a4;
- (id)assetsByLocationTypeFromAssets:(id)a3;
- (id)createAssetClustersForAssetsInDay:(id)a3;
- (id)newAssetClusterFromAssetsSortedByDate:(id)a3;
- (unsigned)_validLocationTypeForBucketingAssets:(unsigned __int16)a3;
- (void)dealloc;
@end

@implementation PLCompactMomentClustering

- (id)_clusterAssetsWithUnusableLocation:(id)a3
{
  if (![a3 count]) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  v4 = [(PLDataClustering *)[PLDBSCANClustering alloc] initWithDistanceBlock:&__block_literal_global_242];
  [(PLDataDensityClustering *)v4 setMaximumDistance:10800.0];
  [(PLDataDensityClustering *)v4 setMinimumNumberOfObjects:1];
  id v5 = [(PLDBSCANClustering *)v4 performWithDataset:a3 progressBlock:0];

  return v5;
}

double __64__PLCompactMomentClustering__clusterAssetsWithUnusableLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(a2, "pl_date"), "timeIntervalSinceDate:", objc_msgSend(a3, "pl_date"));
  return fabs(v3);
}

- (id)_clusterAssetsWithUsableLocation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  if ([(NSSet *)self->_locationsOfInterest count] || [(NSSet *)self->_frequentLocations count])
  {
    id v5 = [(PLCompactMomentClustering *)self _processedLocationTypeByAssetUUIDFromAssets:a3];
    v6 = (void *)[v5 allValues];
    uint64_t v7 = [v6 firstObject];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v6);
          }
          if (![*(id *)(*((void *)&v24 + 1) + 8 * v11) isEqualToNumber:v7])
          {
            char v13 = 1;
            goto LABEL_20;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    Log = PLMomentsGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, Log, OS_LOG_TYPE_INFO, "Not splitting assets based on location type: not more than one location type", buf, 2u);
    }
    char v13 = 0;
  }
  else
  {
    v15 = PLMomentsGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Not splitting assets based on location type: locationsOfInterest and frequentLocations are empy", buf, 2u);
    }
    char v13 = 0;
    id v5 = 0;
  }
LABEL_20:
  buf[0] = 0;
  id v16 = [(PLCompactMomentClustering *)self _shareStateByAssetUUIDFromAssets:a3 momentHasMixedOwnership:buf];
  v17 = [PLDBSCANClustering alloc];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__PLCompactMomentClustering__clusterAssetsWithUsableLocation___block_invoke;
  v20[3] = &unk_1E5861E60;
  char v21 = v13;
  uint8_t v22 = buf[0];
  v20[4] = v5;
  v20[5] = v16;
  v18 = [(PLDataClustering *)v17 initWithDistanceBlock:v20];
  [(PLDataDensityClustering *)v18 setMaximumDistance:10800.0];
  [(PLDataDensityClustering *)v18 setMinimumNumberOfObjects:1];
  id v14 = [(PLDBSCANClustering *)v18 performWithDataset:a3 progressBlock:0];

  return v14;
}

double __62__PLCompactMomentClustering__clusterAssetsWithUsableLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(a2, "pl_date"), "timeIntervalSinceDate:", objc_msgSend(a3, "pl_date"));
  double v7 = fabs(v6);
  if (v7 <= 10800.0)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      int v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(a2, "pl_uuid")), "unsignedShortValue");
      if (v8 != objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(a3, "pl_uuid")), "unsignedShortValue"))return 10801.0; {
    }
      }
    if (*(unsigned char *)(a1 + 49))
    {
      char v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", objc_msgSend(a2, "pl_uuid")), "unsignedShortValue");
      int v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", objc_msgSend(a3, "pl_uuid")), "unsignedShortValue");
      BOOL v11 = v9 == 2 && v10 != 2 || v9 != 2 && v10 == 2;
    }
    else
    {
      BOOL v11 = 0;
    }
    objc_msgSend(a2, "pl_coordinate");
    objc_msgSend(a3, "pl_coordinate");
    objc_msgSend(a2, "pl_gpsHorizontalAccuracy", v13, v14);
    double v16 = fmin(fmax(v15, 0.0), 5000.0);
    objc_msgSend(a3, "pl_gpsHorizontalAccuracy");
    double v18 = fmin(fmax(v17, 0.0), 5000.0);
    CLLocationCoordinate2DGetDistanceFrom();
    double v20 = fmax(v19 + (v16 + v18) * -0.5, 0.0);
    if (v7 > 300.0 || v11)
    {
      char v21 = v7 > 7200.0 || v11;
      if (v21)
      {
        return v20 * 3.6 + 7200.0;
      }
      else if (v20 / v7 >= 60.0)
      {
        return 10801.0;
      }
    }
    else if (v20 >= 10000.0)
    {
      return 10801.0;
    }
  }
  return v7;
}

- (id)_shareStateByAssetUUIDFromAssets:(id)a3 momentHasMixedOwnership:(BOOL *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {
    char v15 = 0;
    if (!a4) {
      return v6;
    }
    goto LABEL_9;
  }
  uint64_t v8 = v7;
  double v17 = a4;
  char v9 = 0;
  char v10 = 0;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend(v13, "shareState", v17);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v14), objc_msgSend(v13, "uuid"));
      v9 |= v14 != 2;
      v10 |= v14 == 2;
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v8);
  char v15 = v9 & v10;
  a4 = v17;
  if (v17) {
LABEL_9:
  }
    *a4 = v15 & 1;
  return v6;
}

- (unsigned)_validLocationTypeForBucketingAssets:(unsigned __int16)a3
{
  if ((a3 - 1) > 4) {
    return 6;
  }
  else {
    return word_19BA9A120[(unsigned __int16)(a3 - 1)];
  }
}

- (id)_processedLocationTypeByAssetUUIDFromAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        char v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [(PLCompactMomentClustering *)self _validLocationTypeForBucketingAssets:+[PLMomentGenerationUtils locationTypeForAsset:v10 locationsOfInterest:self->_locationsOfInterest frequentLocations:self->_frequentLocations]];
        objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v11), objc_msgSend(v10, "uuid"));
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)_assetClustersFromDataClusters:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 count];
  id v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  context = (void *)MEMORY[0x19F38D3B0]();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(a3);
        }
        char v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 approximateRegionWithMaximumRadius:100.0];
        v12 = (void *)[v10 objects];
        uint64_t v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pl_date" ascending:1];
        long long v13 = -[PLAssetCluster initWithAssetsSortedByDate:region:]([PLAssetCluster alloc], "initWithAssetsSortedByDate:region:", objc_msgSend(v12, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v20, 1)), v11);
        [v5 addObject:v13];
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)_mergeAssetClustersWithLocation:(id)a3 withAssetClustersWithoutLocation:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = [a3 count];
  v40 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = a4;
  uint64_t v39 = [a4 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v52;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v52 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v5;
        uint64_t v6 = *(void **)(*((void *)&v51 + 1) + 8 * v5);
        uint64_t v7 = (void *)[v6 startDate];
        uint64_t v8 = (void *)[v6 endDate];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v9 = [a3 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v48;
          uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          double v14 = -10800.0;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v48 != v12) {
                objc_enumerationMutation(a3);
              }
              objc_msgSend((id)objc_msgSend(v8, "earlierDate:", objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "endDate")), "timeIntervalSinceDate:", objc_msgSend(v7, "laterDate:", objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "startDate")));
              if (v16 > v14)
              {
                double v14 = v16;
                uint64_t v13 = v11 + i;
              }
            }
            v11 += v10;
            uint64_t v10 = [a3 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v10);
        }
        else
        {
          uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v17 = [NSNumber numberWithUnsignedInteger:v13];
        long long v18 = (void *)[v40 objectForKeyedSubscript:v17];
        if (!v18)
        {
          long long v18 = (void *)[MEMORY[0x1E4F1CA48] array];
          [v40 setObject:v18 forKeyedSubscript:v17];
        }
        [v18 addObject:v6];
        uint64_t v5 = v41 + 1;
      }
      while (v41 + 1 != v39);
      uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v39);
  }
  long long v19 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v36)
  {
    for (uint64_t j = 0; j != v36; ++j)
    {
      long long v21 = (void *)[a3 objectAtIndexedSubscript:j];
      uint64_t v22 = objc_msgSend(v40, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", j));
      if (v22)
      {
        v23 = (void *)v22;
        uint64_t v24 = objc_msgSend((id)objc_msgSend(v21, "assets"), "mutableCopy");
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v44;
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v44 != v27) {
                objc_enumerationMutation(v23);
              }
              objc_msgSend(v24, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * k), "assets"));
            }
            uint64_t v26 = [v23 countByEnumeratingWithState:&v43 objects:v55 count:16];
          }
          while (v26);
        }
        if ([v24 count])
        {
          objc_msgSend(v24, "sortUsingDescriptors:", objc_msgSend((id)objc_msgSend(v24, "firstObject"), "assetComparisonSortDescriptors"));
          uint64_t v29 = (void *)[v21 location];
          if (v29)
          {
            id v30 = objc_alloc(MEMORY[0x1E4F1E5A8]);
            [v29 coordinate];
            uint64_t v29 = objc_msgSend(v30, "initWithCenter:radius:identifier:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), v31, v32, 0.0);
          }
          v33 = [[PLAssetCluster alloc] initWithAssetsSortedByDate:v24 region:v29];
          [v19 addObject:v33];
        }
        else
        {
        }
      }
      else
      {
        [v19 addObject:v21];
      }
    }
  }
  uint64_t v34 = [v40 objectForKeyedSubscript:&unk_1EEBECC90];
  if (v34) {
    [v19 addObjectsFromArray:v34];
  }
  return v19;
}

- (id)_runDBSCANClusteringWithAssets:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "pl_coordinate");
        double latitude = v29.latitude;
        double longitude = v29.longitude;
        if (!CLLocationCoordinate2DIsValid(v29)) {
          goto LABEL_16;
        }
        BOOL v14 = latitude != 0.0;
        if (longitude != 0.0) {
          BOOL v14 = 1;
        }
        if (!v14 || (latitude == 40.0 ? (v15 = longitude == -100.0) : (v15 = 0), double v16 = (void *)v5, v15)) {
LABEL_16:
        }
          double v16 = (void *)v6;
        [v16 addObject:v11];
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
  id v17 = [(PLCompactMomentClustering *)self _clusterAssetsWithUsableLocation:v5];
  id v18 = [(PLCompactMomentClustering *)self _clusterAssetsWithUnusableLocation:v6];
  id v19 = [(PLCompactMomentClustering *)self _assetClustersFromDataClusters:v17];
  id v20 = [(PLCompactMomentClustering *)self _assetClustersFromDataClusters:v18];
  if ([v19 count])
  {
    if ([v20 count]) {
      id v20 = [(PLCompactMomentClustering *)self _mergeAssetClustersWithLocation:v19 withAssetClustersWithoutLocation:v20];
    }
    else {
      id v20 = v19;
    }
  }
  uint64_t v22 = (void *)[v20 mutableCopy];
  objc_msgSend(v22, "sortUsingDescriptors:", +[PLAssetCluster sortByTimeSortDescriptors](PLAssetCluster, "sortByTimeSortDescriptors"));
  return v22;
}

- (id)createAssetClustersForAssetsInDay:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v45 = (void *)[MEMORY[0x1E4F1CA48] array];
  int v38 = _os_feature_enabled_impl();
  if (v38)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __63__PLCompactMomentClustering_createAssetClustersForAssetsInDay___block_invoke;
    v55[3] = &unk_1E5861E10;
    v55[4] = v5;
    [a3 enumerateObjectsUsingBlock:v55];
    if ([v5 count])
    {
      uint64_t v6 = [MEMORY[0x1E4F28E60] indexSet];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __63__PLCompactMomentClustering_createAssetClustersForAssetsInDay___block_invoke_2;
      v54[3] = &unk_1E5861E38;
      v54[4] = a3;
      v54[5] = v45;
      v54[6] = v6;
      [v5 enumerateKeysAndObjectsUsingBlock:v54];
      a3 = (id)[a3 mutableCopy];
      [a3 removeObjectsAtIndexes:v6];
    }
    else
    {
      id v7 = a3;
    }
  }
  unint64_t v42 = [a3 count];
  if (v42 < 0x801)
  {
    objc_msgSend(v45, "addObjectsFromArray:", -[PLCompactMomentClustering _runDBSCANClusteringWithAssets:](self, "_runDBSCANClusteringWithAssets:", a3));
  }
  else
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "dateCreated"), "timeIntervalSinceDate:", objc_msgSend((id)objc_msgSend(a3, "firstObject"), "dateCreated"));
    double v9 = v8;
    Log = PLMomentsGetLog();
    BOOL v11 = os_log_type_enabled(Log, OS_LOG_TYPE_INFO);
    if (v9 >= 7200.0)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v61 = v42;
        _os_log_impl(&dword_19B3C7000, Log, OS_LOG_TYPE_INFO, "[MomentsGeneration].CompactMoments Using partial clustering for %lu items.", buf, 0xCu);
      }
      unint64_t v24 = 0;
      id v25 = 0;
      id v40 = a3;
      unint64_t v41 = v42 - 1;
      uint64_t v26 = 2048;
      uint64_t v39 = self;
      do
      {
        while (1)
        {
          if (v24 + v26 >= v42) {
            uint64_t v26 = v42 - v24;
          }
          id v27 = -[PLCompactMomentClustering _runDBSCANClusteringWithAssets:](self, "_runDBSCANClusteringWithAssets:", objc_msgSend(a3, "subarrayWithRange:", v24, v26));
          uint64_t v28 = [v27 count];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v29 = [v27 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (v29) {
            break;
          }
          id v25 = 0;
          v24 += v26;
          if (v24 > v41) {
            goto LABEL_26;
          }
        }
        uint64_t v30 = v29;
        uint64_t v43 = v26;
        unint64_t v44 = v24;
        uint64_t v31 = 0;
        uint64_t v32 = *(void *)v51;
        id v33 = v25;
        id v25 = 0;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v51 != v32) {
              objc_enumerationMutation(v27);
            }
            uint64_t v35 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            if (v28 - 1 - v31 == i)
            {
              if (v33)
              {
                v58[0] = v33;
                v58[1] = v35;
                id v25 = +[PLAssetCluster mergedCluster:](PLAssetCluster, "mergedCluster:", [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2]);
              }
              else
              {
                id v25 = *(id *)(*((void *)&v50 + 1) + 8 * i);
              }
            }
            else if (-v31 == i && v33)
            {
              v57[0] = v33;
              v57[1] = v35;
              objc_msgSend(v45, "addObject:", +[PLAssetCluster mergedCluster:](PLAssetCluster, "mergedCluster:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v57, 2)));
              id v33 = 0;
            }
            else
            {
              [v45 addObject:v35];
            }
          }
          v31 += v30;
          uint64_t v30 = [v27 countByEnumeratingWithState:&v50 objects:v59 count:16];
        }
        while (v30);
        uint64_t v26 = v43;
        v24 += v43;
        a3 = v40;
        self = v39;
      }
      while (v43 + v44 <= v41);
      if (v25) {
        [v45 addObject:v25];
      }
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v61 = v42;
        _os_log_impl(&dword_19B3C7000, Log, OS_LOG_TYPE_INFO, "[MomentsGeneration].CompactMoments Numbers of assets %lu exceeding clustering limit, but are close in time.", buf, 0xCu);
      }
      if ([(NSSet *)self->_locationsOfInterest count] || [(NSSet *)self->_frequentLocations count])
      {
        uint64_t v12 = PLMomentsGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "[MomentsGeneration].CompactMoments Trying to split based off of home/work/frequentLocation before defaulting to tagging as one cluster.", buf, 2u);
        }
        id v13 = -[PLCompactMomentClustering assetsByLocationTypeFromAssets:](self, "assetsByLocationTypeFromAssets:", [MEMORY[0x1E4F1CAD0] setWithArray:a3]);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v47;
          uint64_t v17 = MEMORY[0x1E4F1CBF0];
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v47 != v16) {
                objc_enumerationMutation(v13);
              }
              id v19 = (void *)[v13 objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * j)];
              uint64_t v20 = objc_msgSend((id)objc_msgSend(v19, "anyObject"), "assetComparisonSortDescriptors");
              if (v20) {
                uint64_t v21 = v20;
              }
              else {
                uint64_t v21 = v17;
              }
              id v22 = -[PLCompactMomentClustering newAssetClusterFromAssetsSortedByDate:](self, "newAssetClusterFromAssetsSortedByDate:", [v19 sortedArrayUsingDescriptors:v21]);
              [v45 addObject:v22];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
          }
          while (v15);
        }
      }
      else
      {
        uint64_t v36 = PLMomentsGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_INFO, "[MomentsGeneration].CompactMoments Not trying to split cluster based off locationType since locationsOfInterest and frequentLocations are empty. Tagging as one cluster.", buf, 2u);
        }
        id v37 = [(PLCompactMomentClustering *)self newAssetClusterFromAssetsSortedByDate:a3];
        [v45 addObject:v37];
      }
    }
  }
LABEL_26:
  objc_msgSend(v45, "sortUsingDescriptors:", +[PLAssetCluster sortByTimeSortDescriptors](PLAssetCluster, "sortByTimeSortDescriptors"));
  if (v38) {

  }
  return v45;
}

uint64_t __63__PLCompactMomentClustering_createAssetClustersForAssetsInDay___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = +[PLMomentGenerationUtils shouldConsiderAssetAsOutlierForMomentClustering:a2];
  if (result)
  {
    uint64_t result = +[PLMomentGenerationUtils externalOriginatorStateForAsset:a2];
    if (result)
    {
      uint64_t v7 = result;
      double v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithShort:", result));
      if (!v8)
      {
        double v8 = (void *)[MEMORY[0x1E4F28E60] indexSet];
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, objc_msgSend(NSNumber, "numberWithShort:", v7));
      }
      return [v8 addIndex:a3];
    }
  }
  return result;
}

uint64_t __63__PLCompactMomentClustering_createAssetClustersForAssetsInDay___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = -[PLAssetCluster initWithAssetsSortedByDate:region:]([PLAssetCluster alloc], "initWithAssetsSortedByDate:region:", [*(id *)(a1 + 32) objectsAtIndexes:a3], 0);
  [*(id *)(a1 + 40) addObject:v5];

  uint64_t v6 = *(void **)(a1 + 48);
  return [v6 addIndexes:a3];
}

- (id)assetsByLocationTypeFromAssets:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(PLCompactMomentClustering *)self _processedLocationTypeByAssetUUIDFromAssets:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        BOOL v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(v11, "uuid")), "unsignedShortValue");
        id v13 = objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v12));
        if (!v13)
        {
          id v13 = (void *)[MEMORY[0x1E4F1CA80] set];
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, objc_msgSend(NSNumber, "numberWithUnsignedShort:", v12));
        }
        [v13 addObject:v11];
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)newAssetClusterFromAssetsSortedByDate:(id)a3
{
  id v4 = [+[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:") approximateRegionWithMaximumRadius:100.0];
  id v5 = [PLAssetCluster alloc];
  return [(PLAssetCluster *)v5 initWithAssetsSortedByDate:a3 region:v4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLCompactMomentClustering;
  [(PLCompactMomentClustering *)&v3 dealloc];
}

- (PLCompactMomentClustering)initWithDataManager:(id)a3 frequentLocations:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PLCompactMomentClustering;
  id v6 = [(PLCompactMomentClustering *)&v11 init];
  if (v6)
  {
    uint64_t v7 = (NSSet *)[a3 locationsOfInterest];
    v6->_locationsOfInterest = v7;
    uint64_t v8 = v7;
    v6->_frequentLocations = (NSSet *)a4;
    id v9 = a4;
  }
  return v6;
}

@end