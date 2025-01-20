@interface PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper
@end

@implementation PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper

void __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke(uint64_t a1@<X0>, _OWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = a2[1];
  *a3 = *a2;
  a3[1] = v4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [*(id *)(*(void *)(a1 + 32) + 56) reverseObjectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        if (v10)
        {
          long long v11 = a3[1];
          v13[0] = *a3;
          v13[1] = v11;
          [v10 indexPathAfterRevertingChangesFromIndexPath:v13 hasIncrementalChanges:0 objectChanged:0];
        }
        else
        {
          long long v14 = 0u;
          long long v15 = 0u;
        }
        long long v12 = v15;
        *a3 = v14;
        a3[1] = v12;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

void *__115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  result = *(void **)(*(void *)(a1 + 32) + 64);
  if (result) {
    return (void *)[result visualPositionAfterRevertingChangesFromIndex:a2];
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

void __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_3(uint64_t a1@<X0>, _OWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = a2[1];
  *a3 = *a2;
  a3[1] = v4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        if (v10)
        {
          long long v11 = a3[1];
          v13[0] = *a3;
          v13[1] = v11;
          [v10 indexPathAfterApplyingChangesToIndexPath:v13 hasIncrementalChanges:0 objectChanged:0];
        }
        else
        {
          long long v14 = 0u;
          long long v15 = 0u;
        }
        long long v12 = v15;
        *a3 = v14;
        a3[1] = v12;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

void *__115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  result = *(void **)(*(void *)(a1 + 32) + 64);
  if (result) {
    return (void *)[result visualPositionAfterApplyingChangesToIndex:a2];
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

void __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) headerRect];
  CGRectGetMinY(v2);
  [*(id *)(a1 + 32) sectionRect];
  CGRectGetMinY(v3);
  PXFloatApproximatelyEqualToFloat();
}

uint64_t __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_6(uint64_t a1, unint64_t a2)
{
  if (*(void *)(*(void *)(a1 + 32) + 32) == 1 && ((a2 ^ (a2 >> 2) & 1) & 1) != 0) {
    a2 ^= 5uLL;
  }
  return a2;
}

double __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_7(void *a1)
{
  id v1 = a1;
  [v1 sectionRect];
  double v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [v1 keyAssetRect];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v19.origin.x = v11;
  v19.origin.y = v13;
  v19.size.width = v15;
  v19.size.height = v17;
  if (!CGRectIsNull(v19))
  {
    v20.origin.x = v11;
    v20.origin.y = v13;
    v20.size.width = v15;
    v20.size.height = v17;
    CGRectGetMaxY(v20);
    v21.origin.x = v3;
    v21.origin.y = v5;
    v21.size.width = v7;
    v21.size.height = v9;
    CGRectGetMaxY(v21);
  }
  return v3;
}

double __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_8(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a3);
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  double v16 = a6;
  if (a1 >= a2) {
    CGRectGetMinY(*(CGRect *)&v13);
  }
  else {
    CGRectGetMaxY(*(CGRect *)&v13);
  }
  return MidX;
}

void __168___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke()
{
}

@end