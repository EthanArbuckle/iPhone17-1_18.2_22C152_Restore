@interface PLTimeSpanClustering
- (PLTimeSpanClustering)init;
- (double)minimumSpan;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
- (unint64_t)_findNearestIndexMatchingTimeSpan:(unint64_t)a3 inDataset:(id)a4;
- (unint64_t)averageNumberOfObjects;
- (void)setAverageNumberOfObjects:(unint64_t)a3;
- (void)setMinimumSpan:(double)a3;
@end

@implementation PLTimeSpanClustering

- (void)setMinimumSpan:(double)a3
{
  self->_minimumSpan = a3;
}

- (double)minimumSpan
{
  return self->_minimumSpan;
}

- (void)setAverageNumberOfObjects:(unint64_t)a3
{
  self->_averageNumberOfObjects = a3;
}

- (unint64_t)averageNumberOfObjects
{
  return self->_averageNumberOfObjects;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, unsigned char *, double))a4;
  v8 = [v6 sortedArrayUsingComparator:&__block_literal_global_29866];
  v9 = [MEMORY[0x1E4F1CA48] array];
  unint64_t averageNumberOfObjects = self->_averageNumberOfObjects;
  unint64_t v11 = [v6 count];
  char v23 = 0;
  if (averageNumberOfObjects >= v11)
  {
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v12 = 0;
    while (1)
    {
      v7[2](v7, &v23, (double)averageNumberOfObjects / (double)v11);
      if (v23) {
        break;
      }
      unint64_t v13 = [(PLTimeSpanClustering *)self _findNearestIndexMatchingTimeSpan:averageNumberOfObjects inDataset:v8];
      v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v12, v13 - v12);
      v15 = [v8 objectsAtIndexes:v14];

      v16 = +[PLDataCluster clusterWithObjects:v15];
      [v9 addObject:v16];

      unint64_t averageNumberOfObjects = self->_averageNumberOfObjects + v13;
      unint64_t v12 = v13;
      if (averageNumberOfObjects >= v11) {
        goto LABEL_8;
      }
    }
    unint64_t v13 = v12;
  }
LABEL_8:
  v17 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v13, v11 - v13, v6);
  v18 = [v22 objectsAtIndexes:v17];

  v19 = +[PLDataCluster clusterWithObjects:v18];
  [v9 addObject:v19];

  v20 = [MEMORY[0x1E4F1C978] arrayWithArray:v9];

  return v20;
}

uint64_t __57__PLTimeSpanClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = objc_msgSend(a2, "pl_date");
  id v6 = objc_msgSend(v4, "pl_date");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (unint64_t)_findNearestIndexMatchingTimeSpan:(unint64_t)a3 inDataset:(id)a4
{
  id v6 = a4;
  if ([v6 count] <= a3)
  {
    uint64_t v13 = [v6 count] - 1;
  }
  else
  {
    v35 = self;
    uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
    v8 = [v6 objectAtIndexedSubscript:a3];
    if (a3 + 1 >= [v6 count])
    {
      id v22 = v7;
      id v15 = v8;
LABEL_18:
      uint64_t v13 = [v6 count] - 1;
      uint64_t v7 = v22;
    }
    else
    {
      int64_t v9 = a3 - 1;
      unint64_t v10 = a3 - 2;
      double v11 = 0.0;
      unint64_t v12 = 2;
      uint64_t v13 = a3;
      v34 = v6;
      unint64_t v31 = a3 - 2;
      unint64_t v32 = a3;
      while (1)
      {
        uint64_t v14 = v10 + v12 + 1;
        id v15 = [v6 objectAtIndexedSubscript:v14];
        v16 = objc_msgSend(v15, "pl_date");
        [v16 timeIntervalSince1970];
        double v18 = v17;
        v19 = objc_msgSend(v8, "pl_date");
        [v19 timeIntervalSince1970];
        double v21 = v18 - v20;

        if (v21 >= v35->_minimumSpan)
        {
          uint64_t v13 = v14 - 1;
LABEL_21:

          id v15 = v8;
          goto LABEL_25;
        }
        id v33 = v7;
        if (v11 < v21)
        {
          uint64_t v13 = v14;
          double v11 = v21;
        }
        id v15 = v15;

        if (v12 > v35->_averageNumberOfObjects)
        {
          v8 = v15;
          id v6 = v34;
          goto LABEL_21;
        }
        id v22 = [v34 objectAtIndexedSubscript:v9];
        char v23 = objc_msgSend(v7, "pl_date");
        [v23 timeIntervalSince1970];
        double v25 = v24;
        v26 = objc_msgSend(v22, "pl_date");
        [v26 timeIntervalSince1970];
        double v28 = v25 - v27;

        if (v28 >= v35->_minimumSpan)
        {
          id v6 = v34;
          uint64_t v13 = v9;
          goto LABEL_24;
        }
        if (v28 > v11) {
          uint64_t v13 = v9;
        }
        --v9;
        id v22 = v22;

        if (v9 <= (uint64_t)(v32 - v35->_averageNumberOfObjects)) {
          break;
        }
        if (v28 > v11) {
          double v11 = v28;
        }

        id v6 = v34;
        unint64_t v29 = [v34 count];
        ++v12;
        unint64_t v10 = v31;
        v8 = v15;
        uint64_t v7 = v22;
        if (v31 + v12 + 1 >= v29) {
          goto LABEL_18;
        }
      }
      id v33 = v22;
      id v6 = v34;
LABEL_24:

      uint64_t v7 = v33;
    }
LABEL_25:
  }
  return v13;
}

- (PLTimeSpanClustering)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLTimeSpanClustering;
  result = [(PLTimeSpanClustering *)&v3 init];
  if (result)
  {
    result->_minimumSpan = 21600.0;
    result->_unint64_t averageNumberOfObjects = 500;
  }
  return result;
}

@end