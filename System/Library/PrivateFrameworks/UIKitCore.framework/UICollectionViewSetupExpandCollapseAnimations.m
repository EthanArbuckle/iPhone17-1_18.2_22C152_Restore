@interface UICollectionViewSetupExpandCollapseAnimations
@end

@implementation UICollectionViewSetupExpandCollapseAnimations

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    v6 = *(void **)(a2 + 8);
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v7 section];
  if (v8 == [*(id *)(a1 + 32) section])
  {
    v9 = [v5 view];
    v10 = [v9 _layoutAttributes];
    uint64_t v11 = [v10 copy];

    if (!v11)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke");
      [v22 handleFailureInFunction:v23, @"UICollectionViewExpandCollapseAnimationGeneration.m", 125, @"Unable to get initial attributes for expanding item at index path %@", v7 file lineNumber description];
    }
    uint64_t v12 = [v5 finalLayoutAttributes];
    if (!v12)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      v25 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke");
      [v24 handleFailureInFunction:v25, @"UICollectionViewExpandCollapseAnimationGeneration.m", 128, @"Unable to get final attributes for expanding item at index path %@", v7 file lineNumber description];
    }
    [(id)v12 frame];
    v29.origin.x = v13;
    v29.origin.y = v14;
    v29.size.width = v15;
    v29.size.height = v16;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v29))
    {
      [(id)v12 center];
      double v18 = v17 - *(double *)(a1 + 72);
      [(id)v12 center];
      objc_msgSend((id)v11, "setCenter:", v18, v19 - *(double *)(a1 + 80));
      [(id)v11 setAlpha:1.0];
      if (v11)
      {
        long long v20 = *(_OWORD *)(a1 + 104);
        *(_OWORD *)(v11 + 240) = *(_OWORD *)(a1 + 88);
        *(_OWORD *)(v11 + 256) = v20;
        *(_WORD *)(v11 + 288) &= ~0x400u;
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_2;
      v26[3] = &unk_1E52D9F98;
      id v27 = v5;
      id v28 = (id)v11;
      +[UIView performWithoutAnimation:v26];
      [(id)v12 setAlpha:1.0];
      if (v12)
      {
        long long v21 = *(_OWORD *)(a1 + 136);
        *(_OWORD *)(v12 + 240) = *(_OWORD *)(a1 + 120);
        *(_OWORD *)(v12 + 256) = v21;
        *(_WORD *)(v12 + 288) |= 0x400u;
      }
    }
  }
}

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 _setLayoutAttributes:v1];
}

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    v6 = *(void **)(a2 + 8);
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v7 section];
  if (v8 == [*(id *)(a1 + 32) section])
  {
    id v9 = v5;
    if (!v9)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      v25 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke_3");
      [v24 handleFailureInFunction:v25, @"UICollectionViewExpandCollapseAnimationGeneration.m", 240, @"Could not find an animation for collapsing item at index path %@", v7 file lineNumber description];
    }
    v10 = [v9 view];
    uint64_t v11 = [v10 _layoutAttributes];
    uint64_t v12 = [v11 copy];

    if (!v12)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      id v27 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke_3");
      [v26 handleFailureInFunction:v27, @"UICollectionViewExpandCollapseAnimationGeneration.m", 243, @"Unable to get current layout attributes from collapsing item at index path %@", v7 file lineNumber description];
    }
    uint64_t v13 = [v9 finalLayoutAttributes];
    if (!v13)
    {
      id v28 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v29 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke_3");
      [v28 handleFailureInFunction:v29, @"UICollectionViewExpandCollapseAnimationGeneration.m", 245, @"Unable to get current layout attributes from collapsing item at index path %@", v7 file lineNumber description];
    }
    [(id)v12 frame];
    v33.origin.x = v14;
    v33.origin.y = v15;
    v33.size.width = v16;
    v33.size.height = v17;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v33))
    {
      if (v12)
      {
        long long v18 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)(v12 + 240) = *(_OWORD *)(a1 + 72);
        *(_OWORD *)(v12 + 256) = v18;
        *(_WORD *)(v12 + 288) &= ~0x400u;
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_4;
      v30[3] = &unk_1E52D9F98;
      id v31 = v9;
      id v19 = (id)v12;
      id v32 = v19;
      +[UIView performWithoutAnimation:v30];
      if (v13)
      {
        long long v20 = *(_OWORD *)(a1 + 120);
        *(_OWORD *)(v13 + 240) = *(_OWORD *)(a1 + 104);
        *(_OWORD *)(v13 + 256) = v20;
        *(_WORD *)(v13 + 288) |= 0x400u;
      }
      [v19 center];
      double v22 = v21 - *(double *)(a1 + 136);
      [v19 center];
      objc_msgSend((id)v13, "setCenter:", v22, v23 - *(double *)(a1 + 144));
      [v19 alpha];
      objc_msgSend((id)v13, "setAlpha:");
    }
  }
}

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 _setLayoutAttributes:v1];
}

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v34 = a3;
  if (a2) {
    id v5 = *(void **)(a2 + 8);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    id v7 = [v34 view];
    uint64_t v8 = [v7 _layoutAttributes];
    id v9 = (void *)[v8 copy];

    v10 = [v34 finalLayoutAttributes];
    if (v9)
    {
      [v9 size];
      double v12 = v11;
      double v14 = v13;
      [v10 size];
      if (v12 == v16 && v14 == v15)
      {
        [v9 center];
        double v18 = v17;
        double v20 = v19;
        [v10 center];
        if (v18 == v22 && v20 == v21)
        {
          [v9 center];
          double v24 = v23;
          double v26 = v25;
          double v28 = *(double *)(a1 + 48);
          double v27 = *(double *)(a1 + 56);
          uint64_t v29 = *(void *)(a1 + 64);
          [v9 center];
          uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
          if (v29 == 2)
          {
            if (v31 <= *(double *)(v32 + 40)) {
              double v27 = -v27;
            }
          }
          else if (v30 <= *(double *)(v32 + 32))
          {
            double v28 = -v28;
          }
          objc_msgSend(v9, "setCenter:", v24 + v28, v26 + v27);
          CGRect v33 = [v34 view];
          [v33 _setLayoutAttributes:v9];
        }
      }
    }
  }
}

@end