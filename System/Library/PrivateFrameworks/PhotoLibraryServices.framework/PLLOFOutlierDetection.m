@interface PLLOFOutlierDetection
- (BOOL)filterZeroDistanceDataset;
- (PLLOFOutlierDetection)init;
- (double)createDistancesMatrixForDataset:(id)a3 distanceBlock:(id)a4;
- (id)createKNNMatrixWithDistanceMatrix:(double *)a3 size:(unint64_t)a4;
- (id)filteredObjectsWithDataset:(id)a3 distanceBlock:(id)a4;
- (id)lofScoresWithDataset:(id)a3 distanceBlock:(id)a4;
- (unint64_t)k;
- (void)freeDistancesMatrix:(double *)a3 forDataset:(id)a4;
- (void)setFilterZeroDistanceDataset:(BOOL)a3;
- (void)setK:(unint64_t)a3;
@end

@implementation PLLOFOutlierDetection

- (void)setFilterZeroDistanceDataset:(BOOL)a3
{
  self->_filterZeroDistanceDataset = a3;
}

- (BOOL)filterZeroDistanceDataset
{
  return self->_filterZeroDistanceDataset;
}

- (void)setK:(unint64_t)a3
{
  self->_k = a3;
}

- (unint64_t)k
{
  return self->_k;
}

- (id)lofScoresWithDataset:(id)a3 distanceBlock:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  if (v8 > 2)
  {
    unint64_t v9 = v8;
    id v48 = v7;
    v10 = [(PLLOFOutlierDetection *)self createDistancesMatrixForDataset:v6 distanceBlock:v7];
    v47 = self;
    v50 = [(PLLOFOutlierDetection *)self createKNNMatrixWithDistanceMatrix:v10 size:v9];
    id v51 = [MEMORY[0x1E4F1CA48] array];
    if ([v6 count])
    {
      unint64_t v11 = 0;
      v49 = v6;
      do
      {
        id v54 = v50;
        unint64_t v55 = v11;
        v12 = [v54 objectAtIndexedSubscript:v11];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        obuint64_t j = v12;
        double v13 = 0.0;
        double v14 = 0.0;
        uint64_t v56 = [v12 countByEnumeratingWithState:&v60 objects:v68 count:16];
        if (v56)
        {
          uint64_t v53 = *(void *)v61;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v61 != v53) {
                objc_enumerationMutation(obj);
              }
              uint64_t v57 = v15;
              uint64_t v16 = [*(id *)(*((void *)&v60 + 1) + 8 * v15) integerValue];
              id v17 = v54;
              v18 = [v17 objectAtIndexedSubscript:v16];
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              id v58 = v18;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v64 objects:v69 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v65;
                double v22 = 0.0;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v65 != v21) {
                      objc_enumerationMutation(v58);
                    }
                    uint64_t v24 = [*(id *)(*((void *)&v64 + 1) + 8 * i) integerValue];
                    v25 = v10[v24];
                    v26 = [v17 objectAtIndexedSubscript:v24];
                    v27 = [v26 lastObject];
                    double v28 = v25[[v27 integerValue]];

                    double v29 = v10[v16][v24];
                    if (v28 >= v29) {
                      double v29 = v28;
                    }
                    double v22 = v22 + v29;
                  }
                  uint64_t v20 = [v58 countByEnumeratingWithState:&v64 objects:v69 count:16];
                }
                while (v20);
              }
              else
              {
                double v22 = 0.0;
              }
              double v30 = 1.0 / (v22 / (double)(unint64_t)[v58 count]);

              double v14 = v14 + v30;
              uint64_t v15 = v57 + 1;
            }
            while (v57 + 1 != v56);
            uint64_t v56 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
          }
          while (v56);
        }
        id v59 = (id)[obj count];
        id v31 = v54;
        unint64_t v32 = v55;
        v33 = [v31 objectAtIndexedSubscript:v55];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v64 objects:v69 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v65;
          double v13 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v65 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = [*(id *)(*((void *)&v64 + 1) + 8 * j) integerValue];
              v39 = v10[v38];
              v40 = [v31 objectAtIndexedSubscript:v38];
              v41 = [v40 lastObject];
              double v42 = v39[[v41 integerValue]];

              unint64_t v32 = v55;
              double v43 = v10[v55][v38];
              if (v42 >= v43) {
                double v43 = v42;
              }
              double v13 = v13 + v43;
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v64 objects:v69 count:16];
          }
          while (v35);
        }
        double v44 = 1.0 / (v13 / (double)(unint64_t)[v33 count]);

        v45 = [NSNumber numberWithDouble:v14 / (double)(unint64_t)v59 / v44];
        [v51 addObject:v45];

        unint64_t v11 = v32 + 1;
        id v6 = v49;
      }
      while (v11 < [v49 count]);
    }
    [(PLLOFOutlierDetection *)v47 freeDistancesMatrix:v10 forDataset:v6];

    id v7 = v48;
  }
  else
  {
    id v51 = v6;
  }

  return v51;
}

- (void)freeDistancesMatrix:(double *)a3 forDataset:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    unint64_t v5 = 0;
    do
      free(a3[v5++]);
    while (v5 < [v6 count]);
  }
  free(a3);
}

- (double)createDistancesMatrixForDataset:(id)a3 distanceBlock:(id)a4
{
  id v5 = a3;
  id v6 = (double (**)(id, void *, void *))a4;
  size_t v7 = [v5 count];
  unint64_t v8 = (double **)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
      v8[i] = (double *)malloc_type_calloc(v7, 8uLL, 0x100004000313F17uLL);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v20 = v8;
    do
    {
      context = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v12 = 0;
      double v13 = v8;
      double v14 = &v8[v11];
      do
      {
        if (v12)
        {
          uint64_t v15 = [v5 objectAtIndexedSubscript:v11];
          uint64_t v16 = [v5 objectAtIndexedSubscript:v11 + v12];
          double v17 = v6[2](v6, v15, v16);

          (*v14)[v10 + v12] = v17;
          v18 = &v13[v10];
        }
        else
        {
          double v17 = 0.0;
          v18 = v14;
        }
        (*v18)[v11] = v17;
        ++v12;
        ++v13;
      }
      while (v11 + v12 < v7);
      ++v11;
      ++v10;
      unint64_t v8 = v20;
    }
    while (v11 != v7);
  }

  return v8;
}

- (id)createKNNMatrixWithDistanceMatrix:(double *)a3 size:(unint64_t)a4
{
  id v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  if (a4)
  {
    uint64_t v6 = 0;
    do
    {
      unint64_t k = self->_k;
      if (k + 1 < a4) {
        unint64_t v8 = k + 1;
      }
      else {
        unint64_t v8 = a4;
      }
      unint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = a3[v6];
      do
      {
        if (v6 != v10)
        {
          unint64_t v13 = [v9 count];
          unint64_t v14 = self->_k;
          if (v13 < v14
            || (double v15 = v12[v10],
                [v9 lastObject],
                uint64_t v16 = objc_claimAutoreleasedReturnValue(),
                double v17 = v12[[v16 integerValue]],
                v16,
                v15 < v17))
          {
            v18 = [NSNumber numberWithUnsignedInteger:v10];
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __64__PLLOFOutlierDetection_createKNNMatrixWithDistanceMatrix_size___block_invoke;
            v22[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
            v22[4] = v12;
            objc_msgSend(v9, "insertObject:atIndex:", v18, objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v18, 0, v11, 1024, v22));
            if (v13 >= v14)
            {

              [v9 removeLastObject];
            }
            else
            {
              ++v11;
            }
          }
        }
        ++v10;
      }
      while (a4 != v10);
      [v21 addObject:v9];

      ++v6;
    }
    while (v6 != a4);
  }
  return v21;
}

uint64_t __64__PLLOFOutlierDetection_createKNNMatrixWithDistanceMatrix_size___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  double v7 = *(double *)(v5 + 8 * [a2 integerValue]);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v6 integerValue];

  double v10 = *(double *)(v8 + 8 * v9);
  if (v7 < v10) {
    return -1;
  }
  else {
    return v7 > v10;
  }
}

- (id)filteredObjectsWithDataset:(id)a3 distanceBlock:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] > 2)
  {
    uint64_t v8 = [v6 count];
    id v45 = v7;
    v47 = self;
    long long v63 = [(PLLOFOutlierDetection *)self createDistancesMatrixForDataset:v6 distanceBlock:v7];
    uint64_t v44 = v8;
    id v51 = -[PLLOFOutlierDetection createKNNMatrixWithDistanceMatrix:size:](self, "createKNNMatrixWithDistanceMatrix:size:");
    id v49 = [MEMORY[0x1E4F1CA48] array];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v46 = v6;
    obuint64_t j = v6;
    uint64_t v52 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v52)
    {
      uint64_t v58 = 0;
      uint64_t v50 = *(void *)v65;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v65 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v53 = *(void *)(*((void *)&v64 + 1) + 8 * v9);
          uint64_t v54 = v9;
          id v57 = v51;
          double v10 = [v57 objectAtIndexedSubscript:v58];
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v55 = v10;
          double v11 = 0.0;
          double v12 = 0.0;
          uint64_t v59 = [v10 countByEnumeratingWithState:&v68 objects:v77 count:16];
          if (v59)
          {
            uint64_t v56 = *(void *)v69;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v69 != v56) {
                  objc_enumerationMutation(v55);
                }
                uint64_t v60 = v13;
                uint64_t v14 = [*(id *)(*((void *)&v68 + 1) + 8 * v13) integerValue];
                id v15 = v57;
                uint64_t v16 = [v15 objectAtIndexedSubscript:v14];
                long long v72 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                id v61 = v16;
                uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:buf count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v73;
                  double v20 = 0.0;
                  do
                  {
                    for (uint64_t i = 0; i != v18; ++i)
                    {
                      if (*(void *)v73 != v19) {
                        objc_enumerationMutation(v61);
                      }
                      uint64_t v22 = [*(id *)(*((void *)&v72 + 1) + 8 * i) integerValue];
                      v23 = v63[v22];
                      uint64_t v24 = [v15 objectAtIndexedSubscript:v22];
                      v25 = [v24 lastObject];
                      double v26 = v23[[v25 integerValue]];

                      double v27 = v63[v14][v22];
                      if (v26 >= v27) {
                        double v27 = v26;
                      }
                      double v20 = v20 + v27;
                    }
                    uint64_t v18 = [v61 countByEnumeratingWithState:&v72 objects:buf count:16];
                  }
                  while (v18);
                }
                else
                {
                  double v20 = 0.0;
                }
                double v28 = 1.0 / (v20 / (double)(unint64_t)[v61 count]);

                double v12 = v12 + v28;
                uint64_t v13 = v60 + 1;
              }
              while (v60 + 1 != v59);
              uint64_t v59 = [v55 countByEnumeratingWithState:&v68 objects:v77 count:16];
            }
            while (v59);
          }
          id v62 = (id)[v55 count];
          id v29 = v57;
          double v30 = [v29 objectAtIndexedSubscript:v58];
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v72 objects:buf count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v73;
            double v11 = 0.0;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v73 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = [*(id *)(*((void *)&v72 + 1) + 8 * j) integerValue];
                uint64_t v36 = v63[v35];
                v37 = [v29 objectAtIndexedSubscript:v35];
                uint64_t v38 = [v37 lastObject];
                double v39 = v36[[v38 integerValue]];

                double v40 = v63[v58][v35];
                if (v39 >= v40) {
                  double v40 = v39;
                }
                double v11 = v11 + v40;
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v72 objects:buf count:16];
            }
            while (v32);
          }
          double v41 = 1.0 / (v11 / (double)(unint64_t)[v30 count]);

          if (v12 / (double)(unint64_t)v62 / v41 <= 1.1) {
            [v49 addObject:v53];
          }
          ++v58;
          uint64_t v9 = v54 + 1;
        }
        while (v54 + 1 != v52);
        uint64_t v52 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v52);
    }

    [(PLLOFOutlierDetection *)v47 freeDistancesMatrix:v63 forDataset:obj];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v43 = [v49 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v79 = v44 - v43;
      __int16 v80 = 2048;
      uint64_t v81 = v44;
      _os_log_debug_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "LOF Filtering: Filtered %ld outliers for %ld objects", buf, 0x16u);
    }

    id v7 = v45;
    id v6 = v46;
  }
  else
  {
    id v49 = v6;
  }

  return v49;
}

- (PLLOFOutlierDetection)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLLOFOutlierDetection;
  result = [(PLLOFOutlierDetection *)&v3 init];
  if (result) {
    result->_unint64_t k = 4;
  }
  return result;
}

@end