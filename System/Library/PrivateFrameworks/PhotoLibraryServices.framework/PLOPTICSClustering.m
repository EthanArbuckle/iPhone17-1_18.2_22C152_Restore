@interface PLOPTICSClustering
- (id)extractRootClusters:(id)a3 inOriginalDataset:(id)a4 inProgressBlock:(id)a5;
- (id)extractSubClusters:(id)a3 inDataset:(id)a4 parentIndex:(int64_t)a5 inProgressBlock:(id)a6;
- (id)orderedDatasetByReachabilityDistance:(id)a3;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
- (id)prepareOrderedDatasetIndexRange:(_NSRange)a3 inDataset:(id)a4;
- (id)preprocessData:(id)a3;
- (int64_t)updateReachibilityDistance:(id)a3 forIndex:(unint64_t)a4;
- (void)updateNeighbors:(id)a3 forIndex:(unint64_t)a4;
@end

@implementation PLOPTICSClustering

- (void).cxx_destruct
{
}

- (int64_t)updateReachibilityDistance:(id)a3 forIndex:(unint64_t)a4
{
  id v6 = a3;
  [(PLDataDensityClustering *)self maximumDistance];
  double v8 = v7;
  v9 = [v6 objectAtIndexedSubscript:a4];
  v10 = [v9 neighbors];
  unint64_t v11 = [v10 count];
  unint64_t v12 = [(PLDataDensityClustering *)self minimumNumberOfObjects];

  if (v11 < v12)
  {
    [(PLDataDensityClustering *)self maximumDistance];
    [v9 setCoreDistance:v13 + 1.0];
    v14 = [v9 neighbors];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      unint64_t v16 = 0;
      do
      {
        v17 = [v9 neighborAtIndex:v16];
        v18 = [v17 objectForKeyedSubscript:@"originalIndex"];
        uint64_t v19 = [v18 unsignedIntegerValue];

        v20 = [v6 objectAtIndexedSubscript:v19];
        [v20 reachabilityDistance];
        BOOL v22 = v21 <= 3.40282347e38;
        double v23 = 3.40282347e38;
        if (v22) {
          objc_msgSend(v20, "reachabilityDistance", 3.40282347e38);
        }
        [v20 setReachabilityDistance:v23];

        ++v16;
        v24 = [v9 neighbors];
        unint64_t v25 = [v24 count];
      }
      while (v16 < v25);
    }
    goto LABEL_21;
  }
  [v9 sortNeighborsByDistance];
  objc_msgSend(v9, "updateCoreDistanceForNeighbor:", -[PLDataDensityClustering minimumNumberOfObjects](self, "minimumNumberOfObjects") - 1);
  v26 = [v9 neighbors];
  uint64_t v27 = [v26 count];

  if (!v27)
  {
LABEL_21:
    int64_t v29 = -1;
    goto LABEL_22;
  }
  unint64_t v28 = 0;
  int64_t v29 = -1;
  do
  {
    v30 = [v9 neighborAtIndex:v28];
    v31 = [v30 objectForKeyedSubscript:@"originalIndex"];
    uint64_t v32 = [v31 unsignedIntegerValue];

    v33 = [v30 objectForKeyedSubscript:@"distance"];
    [v33 doubleValue];
    double v35 = v34;

    [v9 coreDistance];
    if (v36 > v35)
    {
      [v9 coreDistance];
      double v35 = v37;
    }
    v38 = [v6 objectAtIndexedSubscript:v32];
    [v38 reachabilityDistance];
    if (v35 >= v39)
    {
      [v38 reachabilityDistance];
      double v35 = v40;
    }
    [v38 setReachabilityDistance:v35];
    [v38 reachabilityDistance];
    if (v8 >= v41)
    {
      [v38 reachabilityDistance];
      double v8 = v42;
    }
    [v38 reachabilityDistance];
    if (v8 == v43) {
      int64_t v29 = v32;
    }

    ++v28;
    v44 = [v9 neighbors];
    unint64_t v45 = [v44 count];
  }
  while (v28 < v45);
LABEL_22:

  return v29;
}

- (void)updateNeighbors:(id)a3 forIndex:(unint64_t)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectAtIndex:a4];
  [v7 setProcessed:1];
  double v8 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = [v6 objectAtIndex:v9];
      unint64_t v11 = v10;
      if (a4 != v9 && ([v10 processed] & 1) == 0)
      {
        unint64_t v12 = [(PLDataClustering *)self distanceBlock];
        double v13 = [v7 object];
        v14 = [v11 object];
        double v15 = ((double (**)(void, void *, void *))v12)[2](v12, v13, v14);

        [(PLDataDensityClustering *)self maximumDistance];
        if (v15 <= v16)
        {
          v20[0] = @"originalIndex";
          v17 = [NSNumber numberWithUnsignedInteger:v9];
          v20[1] = @"distance";
          v21[0] = v17;
          v18 = [NSNumber numberWithDouble:v15];
          v21[1] = v18;
          uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
          [v8 addObject:v19];
        }
      }

      ++v9;
    }
    while (v9 < [v6 count]);
  }
  [v7 registerNeighbors:v8 deleteExisting:1];
}

- (id)prepareOrderedDatasetIndexRange:(_NSRange)a3 inDataset:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLOPTICSClustering.m", 529, @"Invalid parameter not satisfying: %@", @"indexRange.location != NSNotFound" object file lineNumber description];
  }
  unint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  v10 = objc_msgSend(v8, "subarrayWithRange:", location, length);
  unint64_t v11 = [v9 arrayWithArray:v10];

  unint64_t v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_139];
  [v12 enumerateObjectsUsingBlock:&__block_literal_global_141];

  return v12;
}

uint64_t __64__PLOPTICSClustering_prepareOrderedDatasetIndexRange_inDataset___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setProcessed:0];
}

uint64_t __64__PLOPTICSClustering_prepareOrderedDatasetIndexRange_inDataset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 reachabilityDistance];
  double v6 = v5;
  [v4 reachabilityDistance];
  double v8 = v7;

  if (v6 < v8) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)orderedDatasetByReachabilityDistance:(id)a3
{
  v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_132];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_134];
  return v3;
}

uint64_t __59__PLOPTICSClustering_orderedDatasetByReachabilityDistance___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setProcessed:0];
}

uint64_t __59__PLOPTICSClustering_orderedDatasetByReachabilityDistance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 reachabilityDistance];
  double v6 = v5;
  [v4 reachabilityDistance];
  double v8 = v7;

  if (v6 < v8) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)preprocessData:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__25283;
  v17 = __Block_byref_object_dispose__25284;
  id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__PLOPTICSClustering_preprocessData___block_invoke;
  v12[3] = &unk_1E586E198;
  v12[4] = self;
  v12[5] = &v13;
  [v4 enumerateObjectsUsingBlock:v12];
  double v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v14[5], "count"));
  unint64_t v6 = 0;
  int64_t v7 = 0;
  do
  {
    if (v7 == -1) {
      break;
    }
    double v8 = [(id)v14[5] objectAtIndex:v7];
    [v8 setOrder:v6];
    [(PLOPTICSClustering *)self updateNeighbors:v14[5] forIndex:v7];
    int64_t v7 = [(PLOPTICSClustering *)self updateReachibilityDistance:v14[5] forIndex:v7];
    if (v7 < 0)
    {
      uint64_t v9 = [(id)v14[5] indexOfObjectPassingTest:&__block_literal_global_129_25285];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v7 = -1;
      }
      else {
        int64_t v7 = v9;
      }
    }
    [v5 addObject:v8];
    unint64_t v10 = [(id)v14[5] count];
    ++v6;
  }
  while (v6 < v10);
  _Block_object_dispose(&v13, 8);

  return v5;
}

void __37__PLOPTICSClustering_preprocessData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 maximumDistance];
  +[PLOPTICSClusteringObject clusterObjectWithObject:index:epsilon:](PLOPTICSClusteringObject, "clusterObjectWithObject:index:epsilon:", v6, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
}

uint64_t __37__PLOPTICSClustering_preprocessData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 processed] ^ 1;
  *a4 = result;
  return result;
}

- (id)extractSubClusters:(id)a3 inDataset:(id)a4 parentIndex:(int64_t)a5 inProgressBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v10 indexRange];
  uint64_t v15 = -[PLOPTICSClustering prepareOrderedDatasetIndexRange:inDataset:](self, "prepareOrderedDatasetIndexRange:inDataset:", v13, v14, v11);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__25283;
  v40[4] = __Block_byref_object_dispose__25284;
  id v41 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  uint64_t v33 = 0;
  double v34 = &v33;
  uint64_t v35 = 0x3032000000;
  double v36 = __Block_byref_object_copy__25283;
  double v37 = __Block_byref_object_dispose__25284;
  id v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__PLOPTICSClustering_extractSubClusters_inDataset_parentIndex_inProgressBlock___block_invoke;
  void v21[3] = &unk_1E58677B8;
  v26 = v40;
  id v16 = v11;
  id v22 = v16;
  uint64_t v27 = v39;
  id v17 = v10;
  id v23 = v17;
  v24 = self;
  int64_t v30 = a5;
  unint64_t v28 = &v33;
  id v18 = v12;
  id v25 = v18;
  int64_t v29 = v31;
  [v15 enumerateObjectsUsingBlock:v21];
  id v19 = (id)v34[5];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v40, 8);

  return v19;
}

void __79__PLOPTICSClustering_extractSubClusters_inDataset_parentIndex_inProgressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v31 = v8;
  if (a3)
  {
    id v9 = v8;
    if (([v9 processed] & 1) == 0)
    {
      id v10 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(v9, "order") - 1);
      [v9 reachabilityDistance];
      double v12 = v11;
      [v10 reachabilityDistance];
      *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v12 - v13;
      if (*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) > 0.0)
      {
        unint64_t v14 = [v9 order];
        if (v14 >= [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) order])
        {
          uint64_t v18 = [v9 order];
          unint64_t v15 = v18 - [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) order];
        }
        else
        {
          unint64_t v15 = 0;
        }
        id v19 = [*(id *)(a1 + 40) clusterSize];
        uint64_t v20 = [v19 unsignedIntegerValue];

        if (v15 > [*(id *)(a1 + 48) minimumNumberOfObjects]
          && v20 - v15 >= [*(id *)(a1 + 48) minimumNumberOfObjects])
        {
          [*(id *)(a1 + 48) maximumDistance];
          double v22 = v21 + 1.0;
          unint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) order];
          unint64_t v24 = [v9 order];
          uint64_t v25 = -1;
          while (v23 < v24)
          {
            v26 = [*(id *)(a1 + 32) objectAtIndex:v23];
            [v26 setProcessed:1];
            [v26 coreDistance];
            if (v27 < v22)
            {
              [v26 coreDistance];
              double v22 = v28;
              uint64_t v25 = [v26 order];
            }

            ++v23;
            unint64_t v24 = [v9 order];
          }
          int64_t v29 = +[PLOPTICSClusterDescriptor clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:](PLOPTICSClusterDescriptor, "clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:", [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) order], v15, *(void *)(a1 + 96), v25, v22);
          [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v29];
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
        }
      }
    }
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    id v17 = v8;
    id v9 = *(id *)(v16 + 40);
    *(void *)(v16 + 40) = v17;
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 56), "completedUnitCount") + 1);
  uint64_t v30 = *(void *)(a1 + 56);
  if (v30)
  {
    [*(id *)(*(void *)(a1 + 48) + 56) fractionCompleted];
    (*(void (**)(uint64_t, uint64_t))(v30 + 16))(v30, *(void *)(*(void *)(a1 + 88) + 8) + 24);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)extractRootClusters:(id)a3 inOriginalDataset:(id)a4 inProgressBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [MEMORY[0x1E4F1CA48] array];
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__25283;
  v44[4] = __Block_byref_object_dispose__25284;
  id v45 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __76__PLOPTICSClustering_extractRootClusters_inOriginalDataset_inProgressBlock___block_invoke;
  v32[3] = &unk_1E5867790;
  double v37 = v44;
  id v38 = v43;
  v32[4] = self;
  id v13 = v10;
  id v33 = v13;
  SEL v40 = a2;
  id v14 = v12;
  id v34 = v14;
  id v15 = v9;
  id v35 = v15;
  id v16 = v11;
  id v36 = v16;
  double v39 = v41;
  [v15 enumerateObjectsUsingBlock:v32];
  if ([v14 count])
  {
    id v17 = [v14 lastObject];
    uint64_t v18 = [v17 endIndex];
    uint64_t v19 = [v18 unsignedIntegerValue];

    if ([v15 count] - v19 == 2)
    {
      uint64_t v31 = [v17 indexRange];
      [v17 indexRange];
      uint64_t v30 = v20;
      double v21 = [v17 rootLevel];
      uint64_t v22 = [v21 integerValue];
      unint64_t v23 = [v17 minCoreDistanceIndex];
      uint64_t v24 = [v23 integerValue];
      uint64_t v25 = [v17 minCoreDistance];
      [v25 doubleValue];
      v26 = +[PLOPTICSClusterDescriptor clusterDescriptor:v31 rootLevel:v30 + 1 minCoreDistanceIndex:v22 minCoreDistance:v24];

      [v14 removeLastObject];
      [v14 addObject:v26];
    }
  }
  double v27 = v36;
  id v28 = v14;

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);

  return v28;
}

void __76__PLOPTICSClustering_extractRootClusters_inOriginalDataset_inProgressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v35 = v7;
  if (!a3)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    id v12 = v7;
    id v8 = *(id *)(v11 + 40);
    *(void *)(v11 + 40) = v12;
    goto LABEL_21;
  }
  id v8 = v7;
  if ([v8 processed]) {
    goto LABEL_21;
  }
  unint64_t v9 = [v8 order];
  if (v9 >= [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) order])
  {
    uint64_t v13 = [v8 order];
    uint64_t v10 = v13 - [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) order];
  }
  else
  {
    uint64_t v10 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v10;
  [*(id *)(a1 + 32) maximumDistance];
  double v15 = v14;
  unint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  if (v16 <= [*(id *)(a1 + 32) minimumNumberOfObjects])
  {
    [v8 setProcessed:1];
    uint64_t v24 = [*(id *)(a1 + 56) objectAtIndex:a3 - 1];
    [v8 reachabilityDistance];
    double v26 = v25;
    [v24 reachabilityDistance];
    if (v26 != v27) {
      goto LABEL_20;
    }
  }
  else
  {
    double v17 = v15 + 1.0;
    unint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) order];
    unint64_t v19 = [v8 order];
    uint64_t v20 = -1;
    while (v18 < v19)
    {
      double v21 = [*(id *)(a1 + 40) objectAtIndex:v18];
      [v21 setProcessed:1];
      [v21 coreDistance];
      if (v22 < v17)
      {
        [v21 coreDistance];
        double v17 = v23;
        uint64_t v20 = [v21 order];
      }

      ++v18;
      unint64_t v19 = [v8 order];
    }
    unint64_t v28 = [v8 order] - 1;
    if (v28 <= [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) order])
    {
      unint64_t v29 = [v8 order] - 1;
      if (v29 <= [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) order])
      {
        id v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 32) file:@"PLOPTICSClustering.m" lineNumber:321 description:@"End Index should be larger than Start Index."];
      }
    }
    uint64_t v24 = +[PLOPTICSClusterDescriptor clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:](PLOPTICSClusterDescriptor, "clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:", [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) order], *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), -1, v20, v17);
    [*(id *)(a1 + 48) addObject:v24];
  }
  uint64_t v30 = [*(id *)(a1 + 56) objectAtIndex:a3];
  uint64_t v31 = *(void *)(*(void *)(a1 + 72) + 8);
  char v32 = *(void **)(v31 + 40);
  *(void *)(v31 + 40) = v30;

LABEL_20:
LABEL_21:

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "completedUnitCount") + 1);
  uint64_t v33 = *(void *)(a1 + 64);
  if (v33)
  {
    [*(id *)(*(void *)(a1 + 32) + 56) fractionCompleted];
    (*(void (**)(uint64_t, uint64_t))(v33 + 16))(v33, *(void *)(*(void *)(a1 + 88) + 8) + 24);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, unsigned char *))a4;
  if (![v7 count])
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLOPTICSClustering.m", 172, @"Invalid parameter not satisfying: %@", @"dataset.count > 0" object file lineNumber description];
  }
  v41[0] = 0;
  uint64_t v9 = 3 * [v7 count];
  uint64_t v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v9];
  progress = self->_progress;
  self->_progress = v10;

  uint64_t v12 = [(PLOPTICSClustering *)self preprocessData:v7];
  [(PLOPTICSClustering *)self orderedDatasetByReachabilityDistance:v12];
  v30 = unint64_t v29 = (void *)v12;
  uint64_t v13 = -[PLOPTICSClustering extractRootClusters:inOriginalDataset:inProgressBlock:](self, "extractRootClusters:inOriginalDataset:inProgressBlock:");
  double v14 = [MEMORY[0x1E4F1CA48] arrayWithArray:v13];
  if ([v14 count])
  {
    uint64_t v25 = v9;
    SEL v26 = a2;
    double v27 = v13;
    unint64_t v28 = v7;
    uint64_t v15 = [v14 count];
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      if (v17 >= [v30 count]) {
        break;
      }
      if (v16 >= v15)
      {
        unint64_t v21 = v17;
        uint64_t v20 = v16;
      }
      else
      {
        while (1)
        {
          unint64_t v18 = [v14 objectAtIndex:v16];
          unint64_t v19 = [(PLOPTICSClustering *)self extractSubClusters:v18 inDataset:v29 parentIndex:v16 inProgressBlock:v8];
          if ([v19 count])
          {
            uint64_t v20 = [v14 count];
            [v14 addObjectsFromArray:v19];
          }
          else
          {
            uint64_t v20 = -1;
          }
          uint64_t v15 = [v14 count];
          [(NSProgress *)self->_progress setCompletedUnitCount:[(NSProgress *)self->_progress completedUnitCount] + 1];
          if (v8)
          {
            [(NSProgress *)self->_progress fractionCompleted];
            v8[2](v8, v41);
          }
          if (v41[0]) {
            break;
          }
          unint64_t v21 = v17 + 1;
          if (v17 + 1 >= [v30 count]) {
            break;
          }
          ++v16;

          ++v17;
          if (v16 >= v15) {
            goto LABEL_18;
          }
        }
        unint64_t v21 = v17 + 1;
      }
LABEL_18:
      uint64_t v16 = v20;
      unint64_t v17 = v21;
    }
    while (v20 != -1);
    if (v41[0])
    {
      id v22 = (id)MEMORY[0x1E4F1CBF0];
      id v7 = v28;
    }
    else
    {
      uint64_t v35 = 0;
      id v36 = &v35;
      uint64_t v37 = 0x3032000000;
      id v38 = __Block_byref_object_copy__25283;
      double v39 = __Block_byref_object_dispose__25284;
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __55__PLOPTICSClustering_performWithDataset_progressBlock___block_invoke;
      void v31[3] = &unk_1E5867768;
      SEL v34 = v26;
      v31[4] = self;
      id v7 = v28;
      id v32 = v28;
      uint64_t v33 = &v35;
      [v14 enumerateObjectsUsingBlock:v31];
      [(NSProgress *)self->_progress setCompletedUnitCount:v25];
      if (v8)
      {
        [(NSProgress *)self->_progress fractionCompleted];
        v8[2](v8, v41);
      }
      id v22 = (id)v36[5];

      _Block_object_dispose(&v35, 8);
    }
    uint64_t v13 = v27;
  }
  else
  {
    [(NSProgress *)self->_progress setCompletedUnitCount:v9];
    if (v8)
    {
      [(NSProgress *)self->_progress fractionCompleted];
      v8[2](v8, v41);
    }
    id v22 = v14;
  }

  return v22;
}

void __55__PLOPTICSClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = [v15 minCoreDistanceIndex];
  uint64_t v4 = [v3 integerValue];

  if ((v4 & 0x8000000000000000) == 0)
  {
    double v5 = [v15 rootLevel];
    uint64_t v6 = [v5 integerValue];

    if (v6 == -1)
    {
      id v7 = [v15 clusterSize];
      uint64_t v8 = [v7 unsignedIntegerValue];

      if (!v8)
      {
        double v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PLOPTICSClustering.m" lineNumber:251 description:@"Cluster size shouldn't be zero"];
      }
      uint64_t v9 = [v15 startIndex];
      uint64_t v10 = [v9 unsignedIntegerValue];

      for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
      {
        uint64_t v12 = [*(id *)(a1 + 40) objectAtIndex:v10];
        [i addObject:v12];

        ++v10;
      }
      uint64_t v13 = +[PLDataCluster clusterWithObjects:i];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v13];
    }
  }
}

@end