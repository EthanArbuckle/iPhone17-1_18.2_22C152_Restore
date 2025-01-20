@interface PLDataClustering
- (NSArray)numericValueKeypaths;
- (PLDataClustering)initWithDistanceBlock:(id)a3;
- (PLDataClustering)initWithNumericValueKeypaths:(id)a3;
- (double)createDistancesFlatMatrixForDataset:(id)a3;
- (double)createDistancesMatrixForDataset:(id)a3;
- (double)createDistancesMatrixForDataset:(id)a3 progressBlock:(id)a4;
- (id)clusterConsolidationBlock;
- (id)clusterKeyElementBlock;
- (id)distanceBlock;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
- (uint64_t)flatMatrixIndexForRow:(unint64_t)a3 andColumn:;
- (void)freeDistancesFlatMatrix:(double *)a3;
- (void)freeDistancesMatrix:(double *)a3 forDataset:(id)a4;
- (void)setClusterConsolidationBlock:(id)a3;
- (void)setClusterKeyElementBlock:(id)a3;
@end

@implementation PLDataClustering

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericValueKeypaths, 0);
  objc_storeStrong(&self->_clusterKeyElementBlock, 0);
  objc_storeStrong(&self->_clusterConsolidationBlock, 0);
  objc_storeStrong(&self->_distanceBlock, 0);
}

- (NSArray)numericValueKeypaths
{
  return self->_numericValueKeypaths;
}

- (void)setClusterKeyElementBlock:(id)a3
{
}

- (id)clusterKeyElementBlock
{
  return self->_clusterKeyElementBlock;
}

- (void)setClusterConsolidationBlock:(id)a3
{
}

- (id)clusterConsolidationBlock
{
  return self->_clusterConsolidationBlock;
}

- (id)distanceBlock
{
  return self->_distanceBlock;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (PLDataClustering)initWithNumericValueKeypaths:(id)a3
{
  id v5 = a3;
  v6 = [(PLDataClustering *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_numericValueKeypaths, a3);
  }

  return v7;
}

- (PLDataClustering)initWithDistanceBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PLDataClustering *)self init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x19F38D650](v4);
    id distanceBlock = v5->_distanceBlock;
    v5->_id distanceBlock = (id)v6;
  }
  return v5;
}

- (void)freeDistancesFlatMatrix:(double *)a3
{
}

- (double)createDistancesFlatMatrixForDataset:(id)a3
{
  unint64_t v5 = [a3 count];
  v18 = self;
  v19 = (double *)malloc_type_malloc(4 * ((v5 * (v5 - 1)) & 0x1FFFFFFFFFFFFFFFLL), 0xF726CC50uLL);
  uint64_t v6 = [(PLDataClustering *)self distanceBlock];
  if (v5)
  {
    v7 = v6;
    unint64_t v8 = 0;
    unint64_t v15 = v5;
    do
    {
      uint64_t v9 = 0;
      unint64_t v10 = v8;
      do
      {
        context = (void *)MEMORY[0x19F38D3B0]();
        unint64_t v17 = v10 + 500;
        if (v10 + 500 >= v5) {
          unint64_t v11 = v5;
        }
        else {
          unint64_t v11 = v10 + 500;
        }
        if (v10 < v11)
        {
          uint64_t v12 = 0;
          do
          {
            if (v9 != v12)
            {
              double v13 = v7[2](v7, [a3 objectAtIndexedSubscript:v8], objc_msgSend(a3, "objectAtIndexedSubscript:", v10 + v12));
              v19[-[PLDataClustering flatMatrixIndexForRow:andColumn:]((uint64_t)v18, v8, v10 + v12)] = v13;
            }
            ++v12;
          }
          while (v10 + v12 < v11);
        }
        v9 -= 500;
        v10 += 500;
        unint64_t v5 = v15;
      }
      while (v17 < v15);
      ++v8;
    }
    while (v8 != v15);
  }
  return v19;
}

- (uint64_t)flatMatrixIndexForRow:(unint64_t)a3 andColumn:
{
  if (result)
  {
    if (a2 == a3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_flatMatrixIndexForRow_andColumn_, result, @"PLDataClustering-NOARC.m", 114, @"distance when row == column should be considered as 0.0 in a flat matrix");
      return -1;
    }
    else
    {
      if (a2 >= a3) {
        unint64_t v3 = a3;
      }
      else {
        unint64_t v3 = a2;
      }
      if (a2 <= a3) {
        unint64_t v4 = a3;
      }
      else {
        unint64_t v4 = a2;
      }
      return v3 + (((v4 - 1) * v4) >> 1);
    }
  }
  return result;
}

- (void)freeDistancesMatrix:(double *)a3 forDataset:(id)a4
{
  if ([a4 count])
  {
    unint64_t v6 = 0;
    do
      free(a3[v6++]);
    while (v6 < [a4 count]);
  }
  free(a3);
}

- (double)createDistancesMatrixForDataset:(id)a3 progressBlock:(id)a4
{
  unint64_t v7 = [a3 count];
  unint64_t v8 = (double **)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
      v8[i] = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    unint64_t v10 = [(PLDataClustering *)self distanceBlock];
    unint64_t v11 = 0;
    char v31 = 0;
    double v12 = 1.0 / (double)v7;
    v24 = v8;
    double v13 = 0.0;
    v14 = v8;
    v25 = (void (**)(id, unsigned char *, double))a4;
    unint64_t v27 = v7;
    do
    {
      uint64_t v15 = 0;
      v26 = v14;
      unint64_t v16 = v11;
      unint64_t v17 = &v8[v11];
      do
      {
        context = (void *)MEMORY[0x19F38D3B0]();
        unint64_t v29 = v16 + 500;
        if (v16 + 500 >= v7) {
          unint64_t v18 = v7;
        }
        else {
          unint64_t v18 = v16 + 500;
        }
        uint64_t v30 = v15;
        v19 = v14;
        while (v16 < v18)
        {
          if (v15)
          {
            double v20 = v10[2](v10, [a3 objectAtIndexedSubscript:v11], objc_msgSend(a3, "objectAtIndexedSubscript:", v16));
            (*v17)[v16] = v20;
            v21 = v19;
          }
          else
          {
            double v20 = 0.0;
            v21 = v17;
          }
          (*v21)[v11] = v20;
          ++v16;
          ++v19;
          --v15;
        }
        v14 += 500;
        uint64_t v15 = v30 - 500;
        unint64_t v16 = v29;
        unint64_t v7 = v27;
      }
      while (v29 < v27);
      if (v25)
      {
        double v13 = v12 + v13;
        v25[2](v25, &v31, v13);
        unint64_t v8 = v24;
        v22 = v26;
        if (v31) {
          return v8;
        }
      }
      else
      {
        unint64_t v8 = v24;
        v22 = v26;
      }
      ++v11;
      v14 = v22 + 1;
    }
    while (v11 != v27);
  }
  return v8;
}

- (double)createDistancesMatrixForDataset:(id)a3
{
  return [(PLDataClustering *)self createDistancesMatrixForDataset:a3 progressBlock:0];
}

@end