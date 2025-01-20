@interface UICollectionLayoutItemSolver
@end

@implementation UICollectionLayoutItemSolver

double __124___UICollectionLayoutItemSolver__arrangeSolutionItems_alongLayoutAxis_forContainer_additionalLayoutOffset_interItemSpacing___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = -[_UICollectionSolutionGroupArrangementItem item](a2);
  id v6 = (id)[v5 edgeSpacing];

  [v6 spacingForEdge:a3];
  double v8 = v7;
  if ([v6 isSpacingFlexibleForEdge:a3]) {
    return v8 + *(double *)(a1 + 32);
  }
  return v8;
}

uint64_t __92___UICollectionLayoutItemSolver__enumerateSolutionFramesForQueryRect_itemLimit_withHandler___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v5 = (id)[*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
  id v6 = v5;
  if (!*(unsigned char *)(a1 + 96) || *(unsigned char *)(a1 + 97)) {
    goto LABEL_6;
  }
  if (v5)
  {
    uint64_t v7 = v5[8];
    uint64_t v8 = v5[9];
    uint64_t v9 = v5[10];
    uint64_t v10 = v5[11];
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v7 = 0;
  }
  uint64_t result = CGRectIntersectsRect(*(CGRect *)&v7, *(CGRect *)(a1 + 56));
  if (result) {
LABEL_6:
  }
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6)
  {
    if (v6[4] == 1) {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    if (*(unsigned char *)(a1 + 96)
      && v6[4] == 1
      && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= *(void *)(a1 + 88))
    {
      *a3 = 1;
    }
  }
  return result;
}

void __128___UICollectionLayoutItemSolver__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_supplementaryOffsets_itemLimit___block_invoke(uint64_t a1, id *a2)
{
  if (a2)
  {
    unint64_t v4 = (unint64_t)a2[4];
    if (v4 == 1)
    {
      uint64_t v5 = (uint64_t)a2[2] + *(void *)(a1 + 56);
      goto LABEL_11;
    }
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (*(void *)(a1 + 32)) {
        uint64_t v5 = (uint64_t)a2[2]
      }
           + objc_msgSend(*(id *)(a1 + 32), "offsetForElementKind:", (id)objc_msgSend(-[_UICollectionLayoutFramesQueryResult auxillaryItem](a2), "elementKind"));
      else {
        uint64_t v5 = (uint64_t)a2[2];
      }
LABEL_11:
      if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
  }
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"_UICollectionLayoutItemSolver.m" lineNumber:1300 description:@"Unknown frame type. Please file a radar!"];

LABEL_8:
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"_UICollectionLayoutItemSolver.m", 1304, @"Invalid parameter not satisfying: %@", @"adjustedIndex != NSNotFound" object file lineNumber description];

  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (!a2)
  {
    id v8 = 0;
    goto LABEL_13;
  }
LABEL_12:
  id v8 = a2[6];
LABEL_13:
  id v9 = v8;
  uint64_t v10 = [(_UICollectionLayoutFramesQueryResult *)a2 copyWithOffset:v9 index:*(double *)(a1 + 72) supplementaryEnrollmentIdentifier:*(double *)(a1 + 80)];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
}

void __133___UICollectionLayoutItemSolver__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a2 + 32);
    if (v4 == 1)
    {
      uint64_t v5 = (void *)(*(void *)(a1 + 56) + *(void *)(a2 + 16));
      goto LABEL_12;
    }
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      id v6 = -[_UICollectionLayoutFramesQueryResult auxillaryItem]((void *)a2);
      if (!v6)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"_UICollectionLayoutItemSolver.m", 1345, @"Invalid parameter not satisfying: %@", @"auxillaryItem" object file lineNumber description];
      }
      id v7 = (id)[v6 elementKind];
      if (![v7 length])
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"_UICollectionLayoutItemSolver.m", 1347, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
      }
      uint64_t v8 = -[_UICollectionLayoutSupplementaryEnroller countForKind:](*(void *)(a1 + 40), v7);
      if (v8 <= 0)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 32) file:@"_UICollectionLayoutItemSolver.m" lineNumber:1349 description:@"Failed to determine element kind count. Enrollment issue?"];
      }
      uint64_t v5 = (void *)(*(void *)(a2 + 16) + *(void *)(a1 + 88) * v8);
LABEL_12:
      id v9 = *(id *)(a2 + 48);
      v15 = [(_UICollectionLayoutFramesQueryResult *)(id *)a2 copyWithOffset:v9 index:*(double *)(a1 + 64) supplementaryEnrollmentIdentifier:*(double *)(a1 + 72)];

      uint64_t v10 = v15;
      if (v15) {
        goto LABEL_14;
      }
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 32) file:@"_UICollectionLayoutItemSolver.m" lineNumber:1357 description:@"Failed to compute a result during item query."];

  uint64_t v10 = 0;
LABEL_14:
  v16 = v10;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
}

void __66___UICollectionLayoutItemSolver__solveWithCustomGroupItemProvider__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  [a2 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  *(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8)+ 32), v19);
  v14 = [_UICollectionLayoutFramesQueryResult alloc];
  v15 = (void *)[a2 zIndex];
  if (v14) {
    v16 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v14->super.isa, 0, a3, v15, (void *)1, *(void **)(*(void *)(a1 + 32) + 16), 0, 0, v7, v9, v11, v13);
  }
  else {
    v16 = 0;
  }
  v17 = v16;
  [*(id *)(a1 + 40) addObject:v16];
}

void __44___UICollectionLayoutItemSolver__solveGroup__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a3 >= 2)
  {
    CGFloat v6 = *(void **)(a1 + 104);
    double v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
    [v6 addObject:v7];

    double v8 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    CGFloat v10 = objc_msgSend(*(id *)(a1 + 128), "subarrayWithRange:", a2, a3);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
    double v12 = v9;
    double v13 = v8;
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v50;
      double v12 = v9;
      double v13 = v8;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v50 != v15) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void *)(*((void *)&v49 + 1) + 8 * v16);
          if (!v17)
          {
            CGRect v19 = 0;
            v18 = 0;
LABEL_20:
            char v20 = 1;
            goto LABEL_10;
          }
          v18 = *(id *)(v17 + 8);
          CGRect v19 = v18;
          if (!v18) {
            goto LABEL_20;
          }
          char v20 = 0;
          v18 = (void *)v18[2];
LABEL_10:
          v21 = [v18 layoutSize];
          if (![v21 isEstimated]
            || ((v20 & 1) != 0 ? (uint64_t v22 = 0) : (uint64_t v22 = v19[7]),
                -[_UICollectionPreferredSizes objectAtIndexedSubscript:](v22, 0),
                v23 = objc_claimAutoreleasedReturnValue(),
                v23,
                v23))
          {
            if (v17)
            {
              double v24 = *(double *)(v17 + 40);
              double v13 = fmax(*(double *)(v17 + 32), v13);
            }
            else
            {
              double v24 = 0.0;
              double v13 = fmax(v13, 0.0);
            }
            double v12 = fmax(v24, v12);
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v25 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
        uint64_t v14 = v25;
      }
      while (v25);
    }
    if (v8 != v13 || v9 != v12)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v27 = v10;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (!v28) {
        goto LABEL_47;
      }
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v46;
      while (1)
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v46 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8 * v31);
          if (v32)
          {
            v33 = *(id *)(v32 + 8);
            v34 = v33;
            if (v33)
            {
              char v35 = 0;
              v33 = (void *)v33[2];
              goto LABEL_36;
            }
          }
          else
          {
            v34 = 0;
            v33 = 0;
          }
          char v35 = 1;
LABEL_36:
          v36 = objc_msgSend(v33, "layoutSize", (void)v45);
          if ([v36 _axesUniformAcrossSiblings])
          {
            -[_UICollectionLayoutItemSolver setSolveResult:]((uint64_t)v34, 0);
            if (v35) {
              v37 = 0;
            }
            else {
              v37 = (void *)v34[7];
            }
            id v38 = v37;
            v39 = -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v38, 0);
            [(_UICollectionLayoutItemSolver *)(uint64_t)v34 _solveSingleItemWithPreferredSize:v13 groupMaxItemSize:v12];

            double v40 = -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v34);
            if (v32)
            {
              *(double *)(v32 + 16) = v40;
              *(void *)(v32 + 24) = v41;
              *(void *)(v32 + 32) = v42;
              *(void *)(v32 + 40) = v43;
            }
          }

          ++v31;
        }
        while (v29 != v31);
        uint64_t v44 = [v27 countByEnumeratingWithState:&v45 objects:v53 count:16];
        uint64_t v29 = v44;
        if (!v44)
        {
LABEL_47:

          break;
        }
      }
    }
  }
}

uint64_t __66___UICollectionLayoutItemSolver__solveWithCustomGroupItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

double __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    [*(id *)(a1 + 32) effectiveContentSize];
    double v4 = v6;
    uint64_t v5 = (double *)(a1 + 48);
  }
  else
  {
    double result = 0.0;
    if (a2 != 1) {
      return result;
    }
    objc_msgSend(*(id *)(a1 + 32), "effectiveContentSize", 0.0);
    uint64_t v5 = (double *)(a1 + 40);
  }
  return v4 - *v5;
}

uint64_t __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    double v6 = [*(id *)(a1 + 32) top];
    unsigned int v4 = [v6 isFlexibleSpacing];

    uint64_t v5 = [*(id *)(a1 + 32) bottom];
  }
  else
  {
    if (a2 != 1) {
      return 0;
    }
    v3 = [*(id *)(a1 + 32) leading];
    unsigned int v4 = [v3 isFlexibleSpacing];

    uint64_t v5 = [*(id *)(a1 + 32) trailing];
  }
  double v7 = v5;
  int v8 = [v5 isFlexibleSpacing];

  uint64_t v9 = 1;
  if (v4) {
    uint64_t v9 = 2;
  }
  if (v8) {
    return v9;
  }
  else {
    return v4;
  }
}

double __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    unsigned int v4 = [*(id *)(a1 + 32) top];
    [v4 spacing];
    double v6 = v8;
    double v7 = [*(id *)(a1 + 32) bottom];
    goto LABEL_5;
  }
  double v3 = 0.0;
  if (a2 == 1)
  {
    unsigned int v4 = [*(id *)(a1 + 32) leading];
    [v4 spacing];
    double v6 = v5;
    double v7 = [*(id *)(a1 + 32) trailing];
LABEL_5:
    uint64_t v9 = v7;
    [v7 spacing];
    double v3 = v6 + v10;
  }
  return v3;
}

void __71___UICollectionLayoutItemSolver__transformGroupArrangementItemsForRTL___block_invoke(_OWORD *a1, void *a2)
{
  unsigned int v4 = -[_UICollectionSolutionGroupArrangementItem item](a2);
  if (([v4 ignoresRTL] & 1) == 0)
  {
    if (a2)
    {
      uint64_t v5 = a2[2];
      uint64_t v6 = a2[3];
      uint64_t v7 = a2[4];
      uint64_t v8 = a2[5];
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v5 = 0;
    }
    long long v9 = a1[3];
    *(_OWORD *)&v10.a = a1[2];
    *(_OWORD *)&v10.c = v9;
    *(_OWORD *)&v10.tx = a1[4];
    CGRect v11 = CGRectApplyAffineTransform(*(CGRect *)&v5, &v10);
    if (a2) {
      *(CGRect *)(a2 + 2) = v11;
    }
  }
}

@end