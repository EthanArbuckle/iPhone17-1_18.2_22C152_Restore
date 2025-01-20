@interface UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions
@end

@implementation UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_6(uint64_t a1, void *a2)
{
  if (a2 && a2[10] == 3 && a2[6] != 0x7FFFFFFFFFFFFFFFLL && a2[1] != a2[3])
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    id v6 = [v3 objectForKeyedSubscript:v4];

    v5 = v6;
    if (v6)
    {
      -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v6, 0, a2[4]);
      v5 = v6;
    }
  }
}

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "finalSectionIndexForInitialSectionIndex:");
  if (a2)
  {
    id v7 = *(id *)(a2 + 16);
    v8 = *(void **)(a2 + 8);
  }
  else
  {
    id v7 = 0;
    v8 = 0;
  }
  id v9 = v8;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (id *)v7;
    v11 = v10;
    if (v10 && ![v10[2] count]) {
      [v11[3] count];
    }
    v12 = -[_UICollectionPreferredSizes indexes]((uint64_t)v11);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_3;
    v23[3] = &unk_1E52E10F0;
    uint64_t v27 = a3;
    id v24 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 40);
    v13 = v11;
    v25 = v13;
    [v12 enumerateIndexesUsingBlock:v23];

    v14 = -[_UICollectionPreferredSizes elementKinds]((uint64_t)v13);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_4;
    v16[3] = &unk_1E52E1140;
    v17 = v13;
    id v18 = v9;
    uint64_t v21 = v6;
    uint64_t v22 = a3;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    v15 = v13;
    [v14 enumerateObjectsUsingBlock:v16];
  }
}

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v4 = [*(id *)(a1 + 32) supplementaryFrameWithKind:*(void *)(a1 + 40) index:a2];
  if (v4)
  {
    v16 = v4;
    v5 = -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(void *)(a1 + 48), v2);
    if (!v5)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_5");
      [v12 handleFailureInFunction:v13, @"_UICollectionCompositionalLayoutSolver.m", 4047, @"Invalid parameter not satisfying: %@", @"supplementaryPreferredSize" file lineNumber description];
    }
    uint64_t v6 = v16[7];
    if ((unint64_t)(v6 - 2) >= 2)
    {
      if (v6 == 1)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        v11 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_5");
        [v10 handleFailureInFunction:v11 file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:4065 description:@"Unexpected supplementary kind (global) while rebasing. Please file a bug on UICollectionView."];
LABEL_16:

        goto LABEL_17;
      }
      if (v6 != 4)
      {
LABEL_17:

        v4 = v16;
        goto LABEL_18;
      }
      id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v2 inSection:*(void *)(a1 + 80)];
      v8 = [*(id *)(a1 + 56) finalIndexPathForInitialIndexPath:v7];
      id v9 = v8;
      if (v8)
      {
        uint64_t v2 = [v8 item];
        [v9 section];
      }
      else
      {
        uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      if (!v10)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        v15 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_5");
        [v14 handleFailureInFunction:v15, @"_UICollectionCompositionalLayoutSolver.m", 4070, @"Invalid parameter not satisfying: %@", @"finalSectionPreferredSizes" file lineNumber description];
      }
      v11 = -[_UICollectionPreferredSizes objectForKeyedSubscript:]((uint64_t)v10, *(void **)(a1 + 40));
      -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v11, (uint64_t)v5, v2);
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_18:
}

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 56)];
  id v17 = (id)v4;
  if (!v4)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_3");
    [v9 handleFailureInFunction:v10 file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:4022 description:@"Failed to determine the initial index path for specified item during rebase. Pleae file a bug on UICollectionView."];

    uint64_t v4 = 0;
  }
  v5 = [*(id *)(a1 + 32) finalIndexPathForInitialIndexPath:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v5 section]);
    if (!v7)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_3");
      [v11 handleFailureInFunction:v12, @"_UICollectionCompositionalLayoutSolver.m", 4026, @"Invalid parameter not satisfying: %@", @"finalPreferredSizes" file lineNumber description];
    }
    v8 = -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(void *)(a1 + 40), a2);
    if (!v8)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_3");
      [v13 handleFailureInFunction:v14, @"_UICollectionCompositionalLayoutSolver.m", 4028, @"Invalid parameter not satisfying: %@", @"preferredSize" file lineNumber description];
    }
    if ([v6 item] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_3");
      [v15 handleFailureInFunction:v16 file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:4029 description:@"Failed to get a valid indexPath for an item during rebase. Please file a bug on UICollectionView."];
    }
    -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v7, (uint64_t)v8, [v6 item]);
  }
}

_UICollectionPreferredSizes *___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v5 = [NSNumber numberWithInteger:a2];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v6 = objc_alloc_init(_UICollectionPreferredSizes);
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v8 = [NSNumber numberWithInteger:a2];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  return v6;
}

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v4 = -[_UICollectionPreferredSizes objectForKeyedSubscript:](*(void *)(a1 + 32), a2);
  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_4");
    [v7 handleFailureInFunction:v8, @"_UICollectionCompositionalLayoutSolver.m", 4039, @"Invalid parameter not satisfying: %@", @"initialSupplementaryPreferredSizes" file lineNumber description];
  }
  v5 = -[_UICollectionPreferredSizes indexes]((uint64_t)v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_5;
  v9[3] = &unk_1E52E1118;
  id v10 = *(id *)(a1 + 40);
  v11 = a2;
  id v12 = v4;
  long long v15 = *(_OWORD *)(a1 + 64);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v6 = v4;
  [v5 enumerateIndexesUsingBlock:v9];
}

@end