@interface PLRegionsHierarchicalClustering
- (id)_postProcessClusters:(id)a3;
- (id)_processData:(id)a3;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
@end

@implementation PLRegionsHierarchicalClustering

- (id)_postProcessClusters:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v54 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v10 = [MEMORY[0x1E4F28E60] indexSet];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v50 != v14) {
                objc_enumerationMutation(v11);
              }
              objc_msgSend(v10, "addIndex:", objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * j), "index"));
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v59 count:16];
          }
          while (v13);
        }

        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke;
        v47[3] = &unk_1E5871AD0;
        v47[4] = v11;
        id v48 = v4;
        [v10 enumerateRangesWithOptions:0 usingBlock:v47];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v6);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v58 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    unint64_t v19 = 0;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v43 + 1) + 8 * k);
        if ([v22 count] > v19) {
          unint64_t v19 = [v22 count];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v58 count:16];
    }
    while (v18);
  }
  else
  {
    unint64_t v19 = 0;
  }

  uint64_t v23 = [v16 count];
  if (v23 >= 1)
  {
    unint64_t v24 = vcvtpd_u64_f64((double)v19 / 6.0);
    for (unint64_t m = v23 + 1; m > 1; --m)
    {
      v26 = [v16 objectAtIndexedSubscript:m - 2];
      if ((unint64_t)[v26 count] <= 3)
      {
      }
      else
      {
        v27 = [v16 objectAtIndexedSubscript:m - 2];
        unint64_t v28 = [v27 count];

        if (v28 >= v24) {
          continue;
        }
      }
      [v16 removeObjectAtIndex:m - 2];
    }
  }
  if (![v16 count])
  {
    v29 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v30 = obj;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v39 objects:v57 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v40;
      do
      {
        for (uint64_t n = 0; n != v32; ++n)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(v30);
          }
          [v29 addObjectsFromArray:*(void *)(*((void *)&v39 + 1) + 8 * n)];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v39 objects:v57 count:16];
      }
      while (v32);
    }

    [v16 addObject:v29];
  }
  v35 = [v16 sortedArrayUsingComparator:&__block_literal_global_37_92983];
  v36 = [v35 valueForKey:@"object"];

  return v36;
}

void __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke_2;
  v7[3] = &__block_descriptor_48_e64_B24__0__PLRegionsHierarchicalClusteringObject_8__NSDictionary_16l;
  v7[4] = a2;
  v7[5] = a3;
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v7];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  [*(id *)(a1 + 40) addObject:v6];
}

uint64_t __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 object];
  uint64_t v7 = objc_msgSend(v6, "pl_date");
  v8 = [v4 objectAtIndexedSubscript:0];

  v9 = [v8 object];
  v10 = objc_msgSend(v9, "pl_date");
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

BOOL __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 index];
  unint64_t v4 = *(void *)(a1 + 32);
  return v3 >= v4 && v3 < *(void *)(a1 + 40) + v4;
}

- (id)_processData:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = +[PLRegionsHierarchicalClusteringObject clusterObjectWithObject:*(void *)(*((void *)&v44 + 1) + 8 * i) index:v8 + i];
        [v4 addObject:v11];
      }
      v8 += i;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v7);
  }
  uint64_t v33 = v5;

  unint64_t v12 = [v4 count];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(unint64_t)((double)v12 + (double)v12)];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = v4;
  uint64_t v35 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v35)
  {
    unint64_t v15 = 0;
    uint64_t v34 = *(void *)v41;
    double v16 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v14);
        }
        if (++v15 < v12)
        {
          uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          unint64_t v19 = v15;
          do
          {
            uint64_t v20 = [v14 objectAtIndexedSubscript:v19];
            __48__PLRegionsHierarchicalClustering__processData___block_invoke((uint64_t)v20, v18, v20);
            double v22 = v21;
            uint64_t v23 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v13 addObject:v23];

            if (v22 > v16) {
              double v16 = v22;
            }

            ++v19;
          }
          while (v19 < v12);
        }
      }
      uint64_t v35 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v35);
  }
  else
  {
    double v16 = 0.0;
  }

  [v13 count];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v24 = v13;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * k) doubleValue];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v26);
  }

  v29 = [(PLDataClustering *)[PLHierarchicalClustering alloc] initWithDistanceBlock:&__block_literal_global_23];
  [(PLHierarchicalClustering *)v29 setK:1];
  [(PLHierarchicalClustering *)v29 setThreshold:fmax(v16 / 10.0, 1000.0)];
  id v30 = [(PLHierarchicalClustering *)v29 performWithDataset:v14 progressBlock:&__block_literal_global_28_92994];
  uint64_t v31 = [v30 valueForKey:@"objects"];

  return v31;
}

uint64_t __48__PLRegionsHierarchicalClustering__processData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 object];
  objc_msgSend(v5, "pl_coordinate");

  uint64_t v6 = [v4 object];

  objc_msgSend(v6, "pl_coordinate");
  return CLLocationCoordinate2DGetDistanceFrom();
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v33 = v5;
  [v5 sortedArrayUsingComparator:&__block_literal_global_93000];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        objc_msgSend(v11, "pl_coordinate");
        double latitude = v47.latitude;
        double longitude = v47.longitude;
        if (CLLocationCoordinate2DIsValid(v47))
        {
          BOOL v14 = latitude != 0.0;
          if (longitude != 0.0) {
            BOOL v14 = 1;
          }
          if (v14 && (latitude != 40.0 || longitude != -100.0)) {
            [v6 addObject:v11];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v8);
  }
  uint64_t v32 = v6;
  uint64_t v31 = [(PLRegionsHierarchicalClustering *)self _processData:v6];
  double v16 = -[PLRegionsHierarchicalClustering _postProcessClusters:](self, "_postProcessClusters:");
  uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        if ([v23 count])
        {
          id v24 = +[PLDataCluster clusterWithObjects:v23];
          uint64_t v25 = [v24 meanRegion:50.0];
          uint64_t v26 = [v24 objects];
          [v17 setObject:v26 forKeyedSubscript:v25];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v20);
  }

  if (![v17 count])
  {
    uint64_t v27 = +[PLDataCluster clusterWithObjects:v33];
    unint64_t v28 = [v27 meanRegion:100.0];
    v29 = [v27 objects];
    [v17 setObject:v29 forKeyedSubscript:v28];
  }
  return v17;
}

uint64_t __68__PLRegionsHierarchicalClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(a2, "pl_date");
  uint64_t v6 = objc_msgSend(v4, "pl_date");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end