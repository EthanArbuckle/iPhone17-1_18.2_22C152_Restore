@interface UICollectionLayoutSectionEstimatedSolver
@end

@implementation UICollectionLayoutSectionEstimatedSolver

void __85___UICollectionLayoutSectionEstimatedSolver_queryFramesIntersectingRect_frameOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  v4 = v3;
  if (v3)
  {
    v5 = (void *)*((void *)v3 + 1);
    uint64_t v6 = *((void *)v3 + 3);
    uint64_t v7 = *((void *)v3 + 4);
    double v9 = *((double *)v3 + 5);
    double v8 = *((double *)v3 + 6);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    v5 = 0;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  double v10 = _UIPointValueForAxis(*(void *)(a1 + 48), v9, v8);
  double v11 = _UIPointValueForAxis(*(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v12 = _UISetPointValueForAxis(*(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v11 - v10);
  CGFloat v14 = v13;
  CGFloat Width = CGRectGetWidth(*(CGRect *)(a1 + 88));
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 88));
  unint64_t v17 = *(void *)(a1 + 120);
  if (v4) {
    uint64_t v18 = v4[2];
  }
  else {
    uint64_t v18 = 0;
  }
  if (v7 + v6 >= v17) {
    uint64_t v19 = v17 - v6;
  }
  else {
    uint64_t v19 = 0;
  }
  -[_UICollectionLayoutItemSolver queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:supplementaryOffsets:itemLimit:](v5, v6, v18, v19, v12, v14, Width, Height, v9 + *(double *)(a1 + 128), v8 + *(double *)(a1 + 136));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObjectsFromArray:v20];
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 80))
  {
    uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v4 = -[_UICollectionLayoutItemSolver supplementaryOffsets]((void **)v3);
    v5 = [v4 elementKinds];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = -[_UICollectionLayoutItemSolver supplementaryOffsets]((void **)v3);
      double v8 = [v7 offsetsByApplyingOffsets:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

      if (!v3) {
        goto LABEL_23;
      }
    }
    else
    {
      double v8 = 0;
      if (!v3) {
        goto LABEL_23;
      }
    }
    uint64_t v9 = *(void *)(v3 + 48);
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 56);
LABEL_9:
      if (!*(void *)(*(void *)(a1 + 32) + 56)) {
        goto LABEL_17;
      }
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        double v13 = -[_UICollectionPreferredSizes indexes](v12);
        uint64_t v14 = objc_msgSend(v13, "countOfIndexesInRange:", v11, v10);

        uint64_t v15 = *(void *)(a1 + 40);
        if (v15 && v8)
        {
          char v16 = -[_UICollectionPreferredSizes containsSupplementaryOffsets:](v15, v8);
          uint64_t v1 = 0;
          if (v14 || (v16 & 1) != 0) {
            goto LABEL_21;
          }
          goto LABEL_18;
        }
        if (v14)
        {
LABEL_17:
          uint64_t v1 = 0;
LABEL_21:

          return v1;
        }
      }
LABEL_18:
      unint64_t v17 = -[UIBarButtonItemGroup _items](*(id **)(a1 + 48));
      uint64_t v18 = objc_msgSend(v17, "countOfIndexesInRange:", v11, v10);

      uint64_t v19 = -[_UICollectionLayoutSolveParameters invalidatedAuxillaryOffsets](*(id **)(a1 + 48));
      int v20 = [v19 overlapsOffsets:v8];

      if (v18) {
        uint64_t v1 = 0;
      }
      else {
        uint64_t v1 = v20 ^ 1u;
      }
      goto LABEL_21;
    }
LABEL_23:
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  return 1;
}

id __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = [_UICollectionLayoutItemSolver alloc];
    v4 = [*(id *)(*(void *)(a1 + 32) + 16) group];
    v5 = -[_UICollectionLayoutItemSolver initWithItem:](v3, v4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 32) traitCollection];
    char v12 = [*(id *)(a1 + 32) layoutRTL];
    if (v9) {
      [(_UICollectionLayoutItemSolver *)v9 _solveForContainer:v8 layoutAxis:v11 traitCollection:0x7FFFFFFFFFFFFFFFLL maxFrameCount:v12 layoutRTL:0 preferredSizes:0 largestKnownItemSize:*MEMORY[0x1E4F1DB30] solutionRecursionDepth:*(double *)(MEMORY[0x1E4F1DB30] + 8)];
    }

    v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  return v2;
}

void __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_7(void *a1, void *a2)
{
  v4 = -[_UICollectionLayoutItemSolver errorDescription](a2);

  if (v4)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
    uint64_t v5 = -[_UICollectionLayoutItemSolver errorDescription](a2);
    uint64_t v6 = a1[4];
    uint64_t v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v5;
  }
  else
  {
    uint64_t v8 = *(id **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v9 = -[_UICollectionLayoutItemSolver supplementaryOffsets]((void **)a2);
    -[_UICollectionLayoutAuxillaryOffsets incrementCountsFromOffsets:](v8, v9);

    if (a2)
    {
      uint64_t v10 = a2[6];
      if (v10) {
        uint64_t v10 = *(void *)(v10 + 56);
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    *(void *)(*(void *)(a1[7] + 8) + 24) += v10;
    *(void *)(*(void *)(a1[5] + 8) + 24) -= v10;
    uint64_t v11 = *(void *)(a1[5] + 8);
    if ((*(void *)(v11 + 24) & 0x8000000000000000) != 0) {
      *(void *)(v11 + 24) = 0;
    }
    char v12 = *(void **)(*(void *)(a1[8] + 8) + 40);
    [v12 addObject:a2];
  }
}

id *__66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_3(uint64_t a1)
{
  v2 = [_UICollectionLayoutItemSolver alloc];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) group];
  v4 = -[_UICollectionLayoutItemSolver initWithItem:](v2, v3);

  uint64_t v5 = -[_UICollectionPreferredSizes preferredSizesApplyingFrameOffset:supplementaryBaseOffsets:](*(void **)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = [*(id *)(a1 + 32) traitCollection];
  char v9 = [*(id *)(a1 + 32) layoutRTL];
  if (v4) {
    [(_UICollectionLayoutItemSolver *)(uint64_t)v4 _solveForContainer:v7 layoutAxis:v8 traitCollection:0x7FFFFFFFFFFFFFFFLL maxFrameCount:v9 layoutRTL:v5 preferredSizes:0 largestKnownItemSize:*(double *)(a1 + 80) solutionRecursionDepth:*(double *)(a1 + 88)];
  }

  return v4;
}

id __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!v1)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_5"];
    [v4 handleFailureInFunction:v5, @"_UICollectionLayoutSectionEstimatedSolver.m", 562, @"Invalid parameter not satisfying: %@", @"solution" file lineNumber description];
  }
  v2 = (void *)[v1 copy];

  return v2;
}

void *__66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_6(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v2 >= *(void *)(a1 + 104))
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = [NSString stringWithUTF8String:"-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_6"];
    [v25 handleFailureInFunction:v26, @"_UICollectionLayoutSectionEstimatedSolver.m", 568, @"Invalid parameter not satisfying: %@", @"resolveOffset<resolveBookmarkRange.length" file lineNumber description];

    unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  uint64_t v3 = *(void *)(a1 + 96) + v2;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(id *)(v4 + 104);
    uint64_t v6 = v5;
    if (v5) {
      uint64_t v5 = (void *)v5[2];
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = [v5 objectAtIndexedSubscript:v3];

  if (v7 && (uint64_t v8 = v7[1]) != 0)
  {
    char v9 = v8;
    uint64_t v10 = v8[6];
    if (v10)
    {
      char v11 = 0;
      uint64_t v12 = *(void *)(v10 + 56);
      uint64_t v13 = *(void *)(v10 + 64);
    }
    else
    {
      uint64_t v12 = 0;
      char v11 = 0;
      uint64_t v13 = 0;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = [NSString stringWithUTF8String:"-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_6"];
    [v27 handleFailureInFunction:v28, @"_UICollectionLayoutSectionEstimatedSolver.m", 573, @"Invalid parameter not satisfying: %@", @"solution" file lineNumber description];

    uint64_t v12 = 0;
    char v9 = 0;
    uint64_t v13 = 0;
    char v11 = 1;
  }
  uint64_t v14 = -[_UICollectionPreferredSizes preferredSizesApplyingFrameOffset:supplementaryBaseOffsets:](*(void **)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  uint64_t v15 = *(void **)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 112);
  unint64_t v17 = [*(id *)(a1 + 32) traitCollection];
  char v18 = [*(id *)(a1 + 32) layoutRTL];
  if (v11)
  {

    uint64_t v20 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    [(_UICollectionLayoutItemSolver *)(uint64_t)v9 _solveForContainer:v16 layoutAxis:v17 traitCollection:0x7FFFFFFFFFFFFFFFLL maxFrameCount:v18 layoutRTL:v14 preferredSizes:0 largestKnownItemSize:*(double *)(a1 + 120) solutionRecursionDepth:*(double *)(a1 + 128)];

    uint64_t v19 = v9[6];
    if (v19)
    {
      uint64_t v20 = *(void *)(v19 + 56);
      uint64_t v19 = *(void *)(v19 + 64);
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8);
  if (!*(unsigned char *)(v21 + 24))
  {
    BOOL v23 = v12 != v20 || v13 != v19;
    *(unsigned char *)(v21 + 24) = v23;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

  return v9;
}

id __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_4(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_4"];
    [v14 handleFailureInFunction:v15, @"_UICollectionLayoutSectionEstimatedSolver.m", 552, @"Invalid parameter not satisfying: %@", @"nextBookmarkIndex != NSNotFound" file lineNumber description];

    unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(id *)(v3 + 104);
    uint64_t v5 = v4;
    if (v4) {
      uint64_t v4 = (void *)v4[2];
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
  }
  unint64_t v6 = [v4 count];

  if (v2 >= v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v17 = [NSString stringWithUTF8String:"-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_4"];
    [v16 handleFailureInFunction:v17, @"_UICollectionLayoutSectionEstimatedSolver.m", 553, @"Invalid parameter not satisfying: %@", @"nextBookmarkIndex < self.solutionState.bookmarks.count" file lineNumber description];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = *(id *)(v7 + 104);
    char v9 = v8;
    if (v8) {
      uint64_t v8 = (void *)v8[2];
    }
  }
  else
  {
    char v9 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v10 = [v8 objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

  if (v10) {
    char v11 = (void *)v10[1];
  }
  else {
    char v11 = 0;
  }
  id v12 = v11;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return v12;
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_9(uint64_t a1)
{
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1) {
    return 6;
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return 5;
  }
  return 2;
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_8(void *a1)
{
  if (!a1[5]) {
    return 6;
  }
  uint64_t v1 = a1[4];
  if (v1 && *(unsigned char *)(v1 + 24)) {
    return 2;
  }
  if (a1[7]) {
    return 3;
  }
  return 2;
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_13(uint64_t a1)
{
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1) {
    return 6;
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return 5;
  }
  return 2;
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_11(void *a1)
{
  if (*(uint64_t *)(*(void *)(a1[6] + 8) + 24) < 1) {
    return 6;
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 24) < a1[12]) {
    return 3;
  }
  if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24) || !(*(unsigned int (**)(void))(a1[5] + 16))()) {
    return 2;
  }
  unint64_t v3 = *(void *)(*(void *)(a1[9] + 8) + 24);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  uint64_t v4 = a1[4];
  if (v4)
  {
    uint64_t v5 = *(id *)(v4 + 104);
    unint64_t v6 = v5;
    if (v5) {
      uint64_t v5 = (void *)v5[2];
    }
  }
  else
  {
    unint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  unint64_t v7 = [v5 count];

  if (v3 >= v7)
  {
LABEL_12:
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    char v9 = [NSString stringWithUTF8String:"-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_11"];
    [v8 handleFailureInFunction:v9, @"_UICollectionLayoutSectionEstimatedSolver.m", 703, @"Invalid parameter not satisfying: %@", @"lastResolvedBookmarkIndex != NSNotFound && lastResolvedBookmarkIndex < self.solutionState.bookmarks.count" file lineNumber description];
  }
  *(void *)(*(void *)(a1[10] + 8) + 24) = *(void *)(*(void *)(a1[9] + 8) + 24) + 1;
  unint64_t v10 = *(void *)(*(void *)(a1[10] + 8) + 24);
  uint64_t v11 = a1[4];
  if (v11)
  {
    id v12 = *(id *)(v11 + 104);
    uint64_t v13 = v12;
    if (v12) {
      id v12 = (void *)v12[2];
    }
  }
  else
  {
    uint64_t v13 = 0;
    id v12 = 0;
  }
  unint64_t v14 = [v12 count];

  if (v10 >= v14) {
    return 2;
  }
  else {
    return 4;
  }
}

void __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a4)
  {
    if (!a1[7])
    {
      unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[_UICollectionLayoutSectionEstimatedSolver _solveWithParameters:]_block_invoke_10"];
      [v10 handleFailureInFunction:v11, @"_UICollectionLayoutSectionEstimatedSolver.m", 764, @"Invalid parameter not satisfying: %@", @"resolveBookmarkRange.length" file lineNumber description];
    }
    if (a1[6])
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = a1[4];
        if (v6)
        {
          unint64_t v7 = *(id *)(v6 + 104);
          uint64_t v8 = v7;
          if (v7) {
            unint64_t v7 = (void *)v7[2];
          }
        }
        else
        {
          uint64_t v8 = 0;
          unint64_t v7 = 0;
        }
        char v9 = [v7 objectAtIndexedSubscript:v5];

        (*(void (**)(void))(a1[5] + 16))();
        ++v5;
      }
      while (v5 < a1[6]);
    }
  }
}

uint64_t __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_12(void *a1)
{
  if (*(uint64_t *)(*(void *)(a1[5] + 8) + 24) < 1) {
    return 6;
  }
  unint64_t v1 = *(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v2 = a1[4];
  if (v2)
  {
    unint64_t v3 = *(id *)(v2 + 104);
    uint64_t v4 = v3;
    if (v3) {
      unint64_t v3 = (void *)v3[2];
    }
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v3 = 0;
  }
  unint64_t v5 = [v3 count];

  if (v1 >= v5) {
    return 2;
  }
  else {
    return 4;
  }
}

_UIOrderedRangeIndexerImpl *__85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(_UIOrderedRangeIndexerImpl **)(v3 + 8);
    v8[0] = 0;
    v8[1] = 0;
    uint64_t v9 = 0;
    result = _UIOrderedRangeIndexerImpl::binarySearchForLocation(v4, a2, (uint64_t)v8);
    uint64_t v6 = v9;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  unint64_t v7 = *(void **)(a1 + 40);
  return (_UIOrderedRangeIndexerImpl *)[v7 addIndex:v6];
}

void __85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v4)
  {
    unint64_t v5 = -[_UICollectionLayoutSolveParameters indexesForInvalidatedAuxillariesOfKind:](*(id **)(a1 + 40), a2);
    if (v5)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke_3;
      v7[3] = &unk_1E52DADC0;
      id v8 = v4;
      id v9 = *(id *)(a1 + 56);
      [v5 enumerateIndexesUsingBlock:v7];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 48), @"_UICollectionLayoutSectionEstimatedSolver.m", 1005, @"Invalid parameter not satisfying: %@", @"elementKindIndexes" object file lineNumber description];
    }
  }
}

_UIOrderedRangeIndexerImpl *__85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke_3(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(_UIOrderedRangeIndexerImpl **)(v3 + 8);
    v8[0] = 0;
    v8[1] = 0;
    uint64_t v9 = 0;
    result = _UIOrderedRangeIndexerImpl::binarySearchForLocation(v4, a2, (uint64_t)v8);
    uint64_t v6 = v9;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  unint64_t v7 = *(void **)(a1 + 40);
  return (_UIOrderedRangeIndexerImpl *)[v7 addIndex:v6];
}

void __103___UICollectionLayoutSectionEstimatedSolver__updateSolutionAuxillaryRangeIndexerKindDict_fromBookmark___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) rangeForElementKind:a2];
  if (v5)
  {
    NSUInteger v6 = v4;
    NSUInteger v7 = v5;
    uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
    if (v8
      || (uint64_t v9 = objc_alloc_init(_UIOrderedRangeIndexer),
          [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:a2],
          (uint64_t v8 = (uint64_t)v9) != 0))
    {
      id v10 = (id)v8;
      v12.location = v6;
      v12.length = v7;
      _UIOrderedRangeIndexerImpl::appendRange(*(_UIOrderedRangeIndexerImpl **)(v8 + 8), v12);
    }
    else
    {
      id v10 = 0;
    }
  }
}

@end