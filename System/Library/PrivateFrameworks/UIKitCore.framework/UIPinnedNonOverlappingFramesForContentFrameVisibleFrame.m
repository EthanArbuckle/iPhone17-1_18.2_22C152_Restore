@interface UIPinnedNonOverlappingFramesForContentFrameVisibleFrame
@end

@implementation UIPinnedNonOverlappingFramesForContentFrameVisibleFrame

void ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  if (a2)
  {
    double v5 = a2[8];
    double v6 = a2[9];
    double v7 = a2[10];
    double v8 = a2[11];
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    double v5 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v5, v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v10 = [NSNumber numberWithUnsignedInteger:a3];
  [v9 setObject:v11 forKeyedSubscript:v10];
}

BOOL ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](a2);
  if (!v4)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<_UICollectionLayoutFramesQueryResult *> * _Nonnull _UIPinnedNonOverlappingFramesForContentFrameVisibleFrame(NSArray<_UICollectionLayoutFramesQueryResult *> *const __strong _Nonnull, CGRect, CGRect, BOOL)_block_invoke_2");
    [v8 handleFailureInFunction:v9, @"_UICollectionLayoutHelpers.m", 2042, @"Invalid parameter not satisfying: %@", @"auxillaryItem" file lineNumber description];
  }
  double v5 = [v4 containerAnchor];
  BOOL v6 = ([v5 edges] & a3) != 0;

  return v6;
}

double ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double x = *MEMORY[0x1E4F1DB28];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(double **)(*((void *)&v18 + 1) + 8 * v10);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40)))
        {
          v24.origin.double x = x;
          v24.origin.CGFloat y = y;
          v24.size.CGFloat width = width;
          v24.size.CGFloat height = height;
          if (CGRectIsEmpty(v24))
          {
            if (v11)
            {
              double x = v11[8];
              CGFloat y = v11[9];
              CGFloat width = v11[10];
              CGFloat height = v11[11];
            }
            else
            {
              CGFloat height = 0.0;
              CGFloat width = 0.0;
              CGFloat y = 0.0;
              double x = 0.0;
            }
          }
          else
          {
            if (v11)
            {
              uint64_t v12 = *((void *)v11 + 8);
              uint64_t v13 = *((void *)v11 + 9);
              uint64_t v14 = *((void *)v11 + 10);
              uint64_t v15 = *((void *)v11 + 11);
            }
            else
            {
              uint64_t v13 = 0;
              uint64_t v14 = 0;
              uint64_t v15 = 0;
              uint64_t v12 = 0;
            }
            v26.origin.double x = x;
            v26.origin.CGFloat y = y;
            v26.size.CGFloat width = width;
            v26.size.CGFloat height = height;
            CGRect v25 = CGRectUnion(*(CGRect *)&v12, v26);
            double x = v25.origin.x;
            CGFloat y = v25.origin.y;
            CGFloat width = v25.size.width;
            CGFloat height = v25.size.height;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v16 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v8 = v16;
    }
    while (v16);
  }

  return x;
}

BOOL ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke_4(CGRect *a1, char a2)
{
  if ((a2 & 8) != 0)
  {
    double v4 = ceil(CGRectGetMaxX(a1[1]));
    double MaxX = CGRectGetMaxX(a1[2]);
    return v4 >= floor(MaxX);
  }
  if ((a2 & 1) == 0)
  {
    if ((a2 & 4) == 0)
    {
      if ((a2 & 2) == 0) {
        return 0;
      }
      double v6 = floor(CGRectGetMinX(a1[1]));
      double MinX = CGRectGetMinX(a1[2]);
      return v6 <= ceil(MinX);
    }
    double v4 = ceil(CGRectGetMaxY(a1[1]));
    double MaxX = CGRectGetMaxY(a1[2]);
    return v4 >= floor(MaxX);
  }
  double v6 = floor(CGRectGetMinY(a1[1]));
  double MinX = CGRectGetMinY(a1[2]);
  return v6 <= ceil(MinX);
}

void ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke_555(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  double v6 = [v4 objectForKeyedSubscript:v5];
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (a2) {
    uint64_t v15 = *(void **)(a2 + 16);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:]((id *)a2, v15, v8, v10, v12, v14);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v16];
}

@end