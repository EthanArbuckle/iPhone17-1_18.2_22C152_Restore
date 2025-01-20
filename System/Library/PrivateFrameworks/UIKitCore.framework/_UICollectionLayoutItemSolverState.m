@interface _UICollectionLayoutItemSolverState
- (id)initWithSolutionFrames:(void *)a3 itemFrameCount:(void *)a4 supplementaryFrameCount:(void *)a5 solvedFittingFrame:(void *)a6 preferredSizeGroupingRanges:(double)a7 additionalOffsetForOutermostGroup:(double)a8 errorDescription:(double)a9;
- (void)_generateMemoizedSolutionFramesBasedData;
- (void)auxillaryFrames;
- (void)itemFrames;
- (void)supplementaryDictByKindIndex;
- (void)supplementaryFrameOffsets;
@end

@implementation _UICollectionLayoutItemSolverState

- (void)itemFrames
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[1];
    if (!v3)
    {
      -[_UICollectionLayoutItemSolverState _generateMemoizedSolutionFramesBasedData]((uint64_t)a1);
      v3 = (void *)v2[1];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_generateMemoizedSolutionFramesBasedData
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(void *)(a1 + 24))
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:sel__generateMemoizedSolutionFramesBasedData, a1, @"_UICollectionLayoutItemSolver.m", 1725, @"Invalid parameter not satisfying: %@", @"!_supplementaryDictByKindIndex" object file lineNumber description];
    }
    if (*(void *)(a1 + 16))
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:sel__generateMemoizedSolutionFramesBasedData, a1, @"_UICollectionLayoutItemSolver.m", 1726, @"Invalid parameter not satisfying: %@", @"!_auxillaryFrames" object file lineNumber description];
    }
    if (*(void *)(a1 + 8))
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:sel__generateMemoizedSolutionFramesBasedData, a1, @"_UICollectionLayoutItemSolver.m", 1727, @"Invalid parameter not satisfying: %@", @"!_itemFrames" object file lineNumber description];
    }
    if (!*(void *)(a1 + 48))
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:sel__generateMemoizedSolutionFramesBasedData, a1, @"_UICollectionLayoutItemSolver.m", 1728, @"Invalid parameter not satisfying: %@", @"_solutionFrames" object file lineNumber description];
    }
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v30 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v28 = (void *)a1;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v32;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
          if (v9)
          {
            uint64_t v10 = v9[4];
            if (v10 == 1)
            {
              [v2 addObject:*(void *)(*((void *)&v31 + 1) + 8 * v8)];
            }
            else if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              [v3 addObject:*(void *)(*((void *)&v31 + 1) + 8 * v8)];
              v11 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](v9);
              if (!v11)
              {
                v14 = [MEMORY[0x1E4F28B00] currentHandler];
                [v14 handleFailureInMethod:sel__generateMemoizedSolutionFramesBasedData, v28, @"_UICollectionLayoutItemSolver.m", 1747, @"Invalid parameter not satisfying: %@", @"auxillaryItem" object file lineNumber description];
              }
              v12 = [v11 elementKind];
              if (![v12 length])
              {
                v15 = [MEMORY[0x1E4F28B00] currentHandler];
                [v15 handleFailureInMethod:sel__generateMemoizedSolutionFramesBasedData, v28, @"_UICollectionLayoutItemSolver.m", 1749, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];
              }
              v13 = +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, v12, v9[2]);
              if (!v13)
              {
                v27 = [MEMORY[0x1E4F28B00] currentHandler];
                [v27 handleFailureInMethod:sel__generateMemoizedSolutionFramesBasedData, v28, @"_UICollectionLayoutItemSolver.m", 1752, @"Invalid parameter not satisfying: %@", @"kindIndexKey" object file lineNumber description];
              }
              [v29 setObject:v9 forKeyedSubscript:v13];
              -[_UICollectionLayoutAuxillaryOffsets incrementCountForElementKind:]((uint64_t)v30, v12);
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v6);
    }

    v16 = (void *)v28[1];
    v28[1] = v2;
    id v17 = v2;

    v18 = (void *)v28[2];
    v28[2] = v3;
    id v19 = v3;

    v20 = (void *)v28[3];
    v28[3] = v29;
    id v21 = v29;

    v22 = (void *)v28[4];
    v28[4] = v30;
  }
}

- (id)initWithSolutionFrames:(void *)a3 itemFrameCount:(void *)a4 supplementaryFrameCount:(void *)a5 solvedFittingFrame:(void *)a6 preferredSizeGroupingRanges:(double)a7 additionalOffsetForOutermostGroup:(double)a8 errorDescription:(double)a9
{
  if (!a1) {
    return 0;
  }
  v30.receiver = a1;
  v30.super_class = (Class)_UICollectionLayoutItemSolverState;
  v23 = (id *)objc_msgSendSuper2(&v30, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong(v23 + 6, a2);
    v24[7] = a3;
    v24[8] = a4;
    *((double *)v24 + 13) = a7;
    *((double *)v24 + 14) = a8;
    *((double *)v24 + 15) = a9;
    *((double *)v24 + 16) = a10;
    uint64_t v25 = [a5 copy];
    id v26 = v24[9];
    v24[9] = (id)v25;

    *((double *)v24 + 11) = a11;
    *((double *)v24 + 12) = a12;
    uint64_t v27 = [a6 copy];
    id v28 = v24[10];
    v24[10] = (id)v27;
  }
  return v24;
}

- (void)auxillaryFrames
{
  if (a1)
  {
    id v2 = a1;
    id v3 = (void *)a1[2];
    if (!v3)
    {
      -[_UICollectionLayoutItemSolverState _generateMemoizedSolutionFramesBasedData]((uint64_t)a1);
      id v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_preferredSizeGroupingRanges, 0);
  objc_storeStrong((id *)&self->_solutionFrames, 0);
  objc_storeStrong((id *)&self->_geometricIndexer, 0);
  objc_storeStrong((id *)&self->_supplementaryFrameOffsets, 0);
  objc_storeStrong((id *)&self->_supplementaryDictByKindIndex, 0);
  objc_storeStrong((id *)&self->_auxillaryFrames, 0);
  objc_storeStrong((id *)&self->_itemFrames, 0);
}

- (void)supplementaryFrameOffsets
{
  if (a1)
  {
    id v2 = a1;
    id v3 = (void *)a1[4];
    if (!v3)
    {
      -[_UICollectionLayoutItemSolverState _generateMemoizedSolutionFramesBasedData]((uint64_t)a1);
      id v3 = (void *)v2[4];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)supplementaryDictByKindIndex
{
  if (a1)
  {
    id v2 = a1;
    id v3 = (void *)a1[3];
    if (!v3)
    {
      -[_UICollectionLayoutItemSolverState _generateMemoizedSolutionFramesBasedData]((uint64_t)a1);
      id v3 = (void *)v2[3];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

@end