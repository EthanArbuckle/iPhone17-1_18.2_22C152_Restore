@interface PXStoryMomentsFibonacciClustering
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
@end

@implementation PXStoryMomentsFibonacciClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6 = a3;
  if (![v6 count])
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PXStoryAutoEditMomentsProvider.m", 84, @"Invalid parameter not satisfying: %@", @"dataset.count > 0" object file lineNumber description];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((unint64_t)[v6 count] >= 2)
  {
    unint64_t v9 = 0;
    uint64_t v10 = 1;
    unint64_t v11 = 2;
    uint64_t v12 = 2;
    do
    {
      unint64_t v8 = v11;
      v13 = (void *)MEMORY[0x1E4F8A788];
      v14 = objc_msgSend(v6, "subarrayWithRange:", v9, v12);
      v15 = [v13 clusterWithObjects:v14];
      [v7 addObject:v15];

      uint64_t v16 = v10 + v12;
      unint64_t v11 = v8 + v10 + v12;
      unint64_t v17 = [v6 count];
      unint64_t v9 = v8;
      uint64_t v10 = v12;
      uint64_t v12 = v16;
    }
    while (v11 <= v17);
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (v8 < [v6 count])
  {
    uint64_t v18 = [v6 count];
    v19 = (void *)MEMORY[0x1E4F8A788];
    v20 = objc_msgSend(v6, "subarrayWithRange:", v8, v18 - v8);
    v21 = [v19 clusterWithObjects:v20];
    [v7 addObject:v21];
  }
  v22 = (void *)[v7 copy];

  return v22;
}

@end