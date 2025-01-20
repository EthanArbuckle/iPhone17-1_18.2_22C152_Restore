@interface PXStoryMomentsUniformClustering
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
@end

@implementation PXStoryMomentsUniformClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6 = a3;
  if (![v6 count])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXStoryAutoEditMomentsProvider.m", 61, @"Invalid parameter not satisfying: %@", @"dataset.count > 0" object file lineNumber description];
  }
  unint64_t v7 = [(PLDataDensityClustering *)self minimumNumberOfObjects];
  unint64_t v8 = v7 + [v6 count] - 1;
  unint64_t v9 = v8 / v7;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8 / v7];
  if (v7 <= v8)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    if (v9 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v9;
    }
    do
    {
      unint64_t v14 = [v6 count];
      unint64_t v15 = v7;
      if (v7 + v11 > v14) {
        unint64_t v15 = [v6 count] + v12;
      }
      v16 = (void *)MEMORY[0x1E4F8A788];
      v17 = objc_msgSend(v6, "subarrayWithRange:", v11, v15);
      v18 = [v16 clusterWithObjects:v17];
      [v10 addObject:v18];

      v12 -= v7;
      v11 += v7;
      --v13;
    }
    while (v13);
  }
  v19 = (void *)[v10 copy];

  return v19;
}

@end