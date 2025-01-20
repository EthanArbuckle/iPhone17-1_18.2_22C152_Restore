@interface UICollectionLayoutAuxillaryItemSolver
@end

@implementation UICollectionLayoutAuxillaryItemSolver

void __82___UICollectionLayoutAuxillaryItemSolver_queryFramesIntersectingRect_frameOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (double *)(id)[*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = *((void *)v3 + 8);
    uint64_t v6 = *((void *)v3 + 9);
    uint64_t v7 = *((void *)v3 + 10);
    uint64_t v8 = *((void *)v3 + 11);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v5 = 0;
  }
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), *(CGRect *)&v5))
  {
    if (v4)
    {
      CGFloat v10 = v4[8];
      CGFloat v9 = v4[9];
      CGFloat v11 = v4[10];
      CGFloat v12 = v4[11];
    }
    else
    {
      CGFloat v9 = 0.0;
      CGFloat v11 = 0.0;
      CGFloat v12 = 0.0;
      CGFloat v10 = 0.0;
    }
    double v13 = *(double *)(a1 + 80);
    v29.origin.x = v10;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v12;
    double v14 = v13 + CGRectGetMinX(v29);
    double v15 = *(double *)(a1 + 88);
    v30.origin.x = v10;
    v30.origin.y = v9;
    v30.size.width = v11;
    v30.size.height = v12;
    double v16 = v15 + CGRectGetMinY(v30);
    v31.origin.x = v10;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v12;
    double Width = CGRectGetWidth(v31);
    v32.origin.x = v10;
    v32.origin.y = v9;
    v32.size.width = v11;
    v32.size.height = v12;
    double Height = CGRectGetHeight(v32);
    v19 = [_UICollectionLayoutFramesQueryResult alloc];
    if (v4)
    {
      char v20 = *((unsigned char *)v4 + 8) != 0;
      v21 = (void *)*((void *)v4 + 2);
      v22 = (void *)*((void *)v4 + 4);
      id v23 = *((id *)v4 + 5);
      v24 = (void *)*((void *)v4 + 6);
    }
    else
    {
      id v23 = 0;
      v21 = 0;
      char v20 = 0;
      v22 = 0;
      v24 = 0;
    }
    v25 = *(void **)(a1 + 96);
    id v26 = v24;
    v27 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v19->super.isa, v20, v21, (void *)1, v22, v23, v25, v26, v14, v16, Width, Height);

    [*(id *)(a1 + 32) addObject:v27];
  }
}

void __49___UICollectionLayoutAuxillaryItemSolver_resolve__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v49 = [a2 boundarySupplementaryItem];
  uint64_t v6 = [a2 decorationItem];
  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 2;
  }

  uint64_t v8 = [a2 elementKind];
  if (![v8 length])
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:*(void *)(a1 + 112), *(void *)(a1 + 32), @"_UICollectionLayoutAuxillaryItemSolver.m", 292, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];
  }
  CGFloat v9 = -[_UICollectionLayoutSupplementaryEnroller enrollSupplementaryForKind:](*(id **)(a1 + 40), v8);
  if (!v9)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:*(void *)(a1 + 112) object:*(void *)(a1 + 32) file:@"_UICollectionLayoutAuxillaryItemSolver.m" lineNumber:296 description:@"Failed to receive an enrollment identifier."];
  }
  CGFloat v10 = (void *)-[_UICollectionLayoutSupplementaryEnroller kindIndexForEnrollmentIdentifier:](*(void *)(a1 + 40), (uint64_t)v9);
  if (v10 == (void *)0x7FFFFFFFFFFFFFFFLL)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:*(void *)(a1 + 112) object:*(void *)(a1 + 32) file:@"_UICollectionLayoutAuxillaryItemSolver.m" lineNumber:298 description:@"Failed to determine the kindIndex for specified supplementary enrollment identifier."];
  }
  CGFloat v11 = [a2 size];
  *(void *)(*(void *)(a1 + 32) + 56) |= [v11 _containerSizeDependentAxes];

  double v12 = -[_UICollectionLayoutAuxillaryItemSolver _sizeForSupplementaryItem:container:preferredSizes:preferredIndex:](*(void *)(a1 + 32), a2, *(void *)(a1 + 48), *(void *)(a1 + 56), (uint64_t)v10);
  double v14 = v13;
  double v15 = -[_UICollectionLayoutAuxillaryItemSolver _frameForSupplementaryItem:container:primaryContentFrame:supplementaryItemSize:frameOffset:layoutRTL:](*(void *)(a1 + 32), a2, *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 184), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), v12, v13, *(double *)(a1 + 152), *(double *)(a1 + 160));
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [_UICollectionLayoutFramesQueryResult alloc];
  id v23 = [a2 item];
  v24 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v22->super.isa, 0, v10, (void *)1, (void *)v7, v23, *(void **)(a1 + 168), v9, v15, v17, v19, v21);

  [*(id *)(a1 + 64) addObject:v24];
  if ([v49 pinToVisibleBounds]) {
    [*(id *)(a1 + 72) addIndex:a3];
  }
  if ([v49 extendsBoundary])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    uint64_t v25 = *(void *)(a1 + 80);
    id v26 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v10];
    v27 = [a2 elementKind];
    -[_UICollectionLayoutAuxillaryOffsets addIndexes:forElementKind:](v25, (uint64_t)v26, v27);
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v28 = *(void *)(a1 + 176);
    int v29 = [v49 extendsBoundary];
    if (v28)
    {
      if (v29)
      {
        unint64_t v30 = [v49 alignment];
        if (v28 != 1)
        {
          if (v28 != 2) {
            goto LABEL_35;
          }
          uint64_t v31 = v30 - 1 >= 8 ? 0 : qword_186B93C20[v30 - 1];
          if (v30 - 2 >= 3 && v30 - 6 >= 3) {
            goto LABEL_35;
          }
          goto LABEL_30;
        }
        uint64_t v31 = 2;
        if (v30 - 2 >= 3) {
          uint64_t v31 = 8 * (v30 - 6 < 3);
        }
        if (v30 <= 8 && ((1 << v30) & 0x176) != 0)
        {
LABEL_30:
          if (!v31)
          {
            double v32 = _UISizeValueForAxis(*(void *)(a1 + 176), v12, v14);
            double v33 = _UISizeValueForAxis(*(void *)(a1 + 176), *(double *)(a1 + 136), *(double *)(a1 + 144));
            if (v32 > v33)
            {
              double v34 = v32 - v33;
              uint64_t v35 = *(void *)(*(void *)(a1 + 96) + 8);
              if (*(double *)(v35 + 24) >= v34) {
                double v34 = *(double *)(v35 + 24);
              }
              *(double *)(v35 + 24) = v34;
            }
          }
        }
      }
    }
  }
LABEL_35:
  if ([v49 extendsBoundary])
  {
    uint64_t v36 = *(void *)(a1 + 176);
    if ((unint64_t)(v36 - 1) >= 2)
    {
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v46 = *(void *)(a1 + 112);
      uint64_t v47 = *(void *)(a1 + 32);
      v48 = [v49 _externalDescription];
      [v45 handleFailureInMethod:v46, v47, @"_UICollectionLayoutAuxillaryItemSolver.m", 343, @"UICollectionView internal inconsistency: layout axis is unspecified when solving boundary supplementary item: %@", v48 object file lineNumber description];

      uint64_t v36 = *(void *)(a1 + 176);
    }
    double v37 = _UIRectUnionOnAxis(v36, *(CGFloat *)(*(void *)(*(void *)(a1 + 104) + 8) + 32), *(CGFloat *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), *(CGFloat *)(*(void *)(*(void *)(a1 + 104) + 8) + 48), *(CGFloat *)(*(void *)(*(void *)(a1 + 104) + 8) + 56), v15, v17, v19, v21);
    uint64_t v38 = *(void *)(*(void *)(a1 + 104) + 8);
    *(double *)(v38 + 32) = v37;
    *(void *)(v38 + 40) = v39;
    *(void *)(v38 + 48) = v40;
    *(void *)(v38 + 56) = v41;
  }
}

void *__65___UICollectionLayoutAuxillaryItemSolver__updateGeometricIndexer__block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  if (a2)
  {
    CGFloat v3 = a2[8];
    CGFloat v4 = a2[9];
    CGFloat v5 = a2[10];
    CGFloat v6 = a2[11];
  }
  else
  {
    CGFloat v4 = 0.0;
    CGFloat v5 = 0.0;
    CGFloat v6 = 0.0;
    CGFloat v3 = 0.0;
  }
  return -[_UIRTree insertFrame:forIndex:](*(void **)(a1 + 32), a3, v3, v4, v5, v6);
}

uint64_t __113___UICollectionLayoutAuxillaryItemSolver__requiredContentSizeForSupplementaryFrames_forLayoutAxis_containerSize___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

void __49___UICollectionLayoutAuxillaryItemSolver_resolve__block_invoke_2(uint64_t a1, double *a2, uint64_t a3)
{
  CGFloat v6 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](a2);
  id v29 = [v6 boundarySupplementaryItem];

  if (a2)
  {
    double v7 = a2[10];
    double v8 = a2[11];
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
  }
  double v9 = -[_UICollectionLayoutAuxillaryItemSolver _frameForSupplementaryItem:container:primaryContentFrame:supplementaryItemSize:frameOffset:layoutRTL:](*(void *)(a1 + 32), v29, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 128), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v7, v8, *(double *)(a1 + 96), *(double *)(a1 + 104));
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  if (a2) {
    double v17 = (void *)*((void *)a2 + 2);
  }
  else {
    double v17 = 0;
  }
  double v18 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:]((id *)a2, v17, v9, v10, v11, v12);
  [*(id *)(a1 + 48) setObject:v18 atIndexedSubscript:a3];
  if ([v29 extendsBoundary])
  {
    uint64_t v19 = *(void *)(a1 + 112);
    if ((unint64_t)(v19 - 1) >= 2)
    {
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v26 = *(void *)(a1 + 120);
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = [v29 _externalDescription];
      [v25 handleFailureInMethod:v26, v27, @"_UICollectionLayoutAuxillaryItemSolver.m", 373, @"UICollectionView internal inconsistency: layout axis is unspecified when solving boundary supplementary item: %@", v28 object file lineNumber description];

      uint64_t v19 = *(void *)(a1 + 112);
    }
    double v20 = _UIRectUnionOnAxis(v19, *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 56), v13, v14, v15, v16);
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    *(double *)(v21 + 32) = v20;
    *(void *)(v21 + 40) = v22;
    *(void *)(v21 + 48) = v23;
    *(void *)(v21 + 56) = v24;
  }
}

@end