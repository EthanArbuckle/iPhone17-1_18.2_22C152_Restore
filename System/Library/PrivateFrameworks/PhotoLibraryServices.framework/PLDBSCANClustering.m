@interface PLDBSCANClustering
- (id)_expandClusterForObject:(id)a3 dataset:(id)a4 objectsMappedToCluster:(__CFSet *)a5 visitedObjects:(unint64_t *)a6 distancesFlatMatrix:(double *)a7 neighbors:(id)a8;
- (id)_neighborsAtIndex:(unint64_t)a3 withDistancesFlatMatrix:(double *)a4 datasetSize:(unint64_t)a5;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
@end

@implementation PLDBSCANClustering

- (id)_expandClusterForObject:(id)a3 dataset:(id)a4 objectsMappedToCluster:(__CFSet *)a5 visitedObjects:(unint64_t *)a6 distancesFlatMatrix:(double *)a7 neighbors:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  v16 = objc_opt_new();
  [v16 addObject:v13];
  v24 = v13;
  CFSetAddValue(a5, v13);
  v17 = [MEMORY[0x1E4F28E60] indexSet];
  v25 = v15;
  [v17 addIndexes:v15];
  uint64_t v26 = [v14 count];
  while ([v17 count])
  {
    uint64_t v18 = [v17 firstIndex];
    v19 = [v14 objectAtIndexedSubscript:v18];
    if (!a6[v18])
    {
      a6[v18] = 1;
      v20 = [(PLDBSCANClustering *)self _neighborsAtIndex:v18 withDistancesFlatMatrix:a7 datasetSize:v26];
      unint64_t v21 = [v20 count];
      if (v21 >= [(PLDataDensityClustering *)self minimumNumberOfObjects])
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __122__PLDBSCANClustering__expandClusterForObject_dataset_objectsMappedToCluster_visitedObjects_distancesFlatMatrix_neighbors___block_invoke;
        v28[3] = &unk_1E5873A00;
        id v29 = v25;
        id v30 = v17;
        [v20 enumerateIndexesUsingBlock:v28];
      }
    }
    if (!CFSetContainsValue(a5, v19))
    {
      [v16 addObject:v19];
      CFSetAddValue(a5, v19);
    }
    [v17 removeIndex:v18];
  }
  v22 = +[PLDataCluster clusterWithObjects:v16];

  return v22;
}

uint64_t __122__PLDBSCANClustering__expandClusterForObject_dataset_objectsMappedToCluster_visitedObjects_distancesFlatMatrix_neighbors___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) addIndex:a2];
    v5 = *(void **)(a1 + 40);
    return [v5 addIndex:a2];
  }
  return result;
}

- (id)_neighborsAtIndex:(unint64_t)a3 withDistancesFlatMatrix:(double *)a4 datasetSize:(unint64_t)a5
{
  v9 = objc_opt_new();
  [(PLDataDensityClustering *)self maximumDistance];
  if (a5)
  {
    double v11 = v10;
    unint64_t v12 = 0;
    do
    {
      if (a3 != v12 && a4[-[PLDataClustering flatMatrixIndexForRow:andColumn:]((uint64_t)self, v12, a3)] <= v11) {
        [v9 addIndex:v12];
      }
      ++v12;
    }
    while (a5 != v12);
  }
  return v9;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34 = self;
  if ((unint64_t)[v6 count] >= 0x801)
  {
    v8 = objc_alloc_init(PLSamplingClustering);
    [(PLSamplingClustering *)v8 setNumberOfClusters:2048];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __55__PLDBSCANClustering_performWithDataset_progressBlock___block_invoke;
    v41[3] = &unk_1E5869728;
    id v42 = v7;
    v9 = [(PLSamplingClustering *)v8 performWithDataset:v6 progressBlock:v41];
    double v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2048];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __55__PLDBSCANClustering_performWithDataset_progressBlock___block_invoke_2;
    v39[3] = &unk_1E5869750;
    id v11 = v10;
    id v40 = v11;
    [v9 enumerateObjectsUsingBlock:v39];
    id v12 = v11;

    id v6 = v12;
    self = v34;
  }
  uint64_t v13 = [v6 count];
  id v14 = [(PLDataClustering *)self createDistancesFlatMatrixForDataset:v6];
  id v15 = malloc_type_calloc(8uLL, v13, 0x7A2DFF3FuLL);
  uint64_t v33 = v13;
  CFMutableSetRef cf = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v13, 0);
  v31 = [MEMORY[0x1E4F1CA48] array];
  id v30 = [MEMORY[0x1E4F1CA48] array];
  if ([(PLDataDensityClustering *)self minimumNumberOfObjects]) {
    unint64_t v32 = [(PLDataDensityClustering *)self minimumNumberOfObjects] - 1;
  }
  else {
    unint64_t v32 = 0;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v28 = v7;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v16);
        }
        if (!v15[v19])
        {
          uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v15[v19] = 1;
          [(PLDBSCANClustering *)self _neighborsAtIndex:v19 withDistancesFlatMatrix:v14 datasetSize:v33];
          v24 = v23 = self;
          if ([v24 count] >= v32)
          {
            v25 = [(PLDBSCANClustering *)v23 _expandClusterForObject:v22 dataset:v16 objectsMappedToCluster:cf visitedObjects:v15 distancesFlatMatrix:v14 neighbors:v24];
            [v30 addObject:v25];
          }
          else
          {
            [v31 addObject:v22];
          }

          self = v34;
        }
        ++v19;
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v18);

    id v7 = v28;
  }
  else
  {

    if (!v15) {
      goto LABEL_21;
    }
  }
  free(v15);
LABEL_21:
  [(PLDataClustering *)self freeDistancesFlatMatrix:v14];
  CFRelease(cf);
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithArray:v30];

  return v26;
}

uint64_t __55__PLDBSCANClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, double a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(double))(result + 16))(a2 * 0.1);
  }
  return result;
}

void __55__PLDBSCANClustering_performWithDataset_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 objects];
  v3 = [v4 firstObject];
  [v2 addObject:v3];
}

@end