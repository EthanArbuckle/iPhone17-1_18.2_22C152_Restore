@interface UICollectionViewLayout(PhotosUI)
- (id)pu_layoutAttributesForElementClosestToPoint:()PhotosUI inRect:passingTest:;
@end

@implementation UICollectionViewLayout(PhotosUI)

- (id)pu_layoutAttributesForElementClosestToPoint:()PhotosUI inRect:passingTest:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v14 = a9;
  v15 = objc_msgSend(a1, "layoutAttributesForElementsInRect:", a4, a5, a6, a7);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v18 = 0;
    uint64_t v19 = *(void *)v28;
    double v20 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v15);
        }
        v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (([v22 isHidden] & 1) == 0)
        {
          [v22 frame];
          UIDistanceBetweenPointAndRect();
          if (v23 < v20)
          {
            double v24 = v23;
            if (v14[2](v14, v22))
            {
              id v25 = v22;

              double v20 = v24;
              v18 = v25;
            }
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end