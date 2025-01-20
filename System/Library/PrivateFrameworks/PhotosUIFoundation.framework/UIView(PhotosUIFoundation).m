@interface UIView(PhotosUIFoundation)
- (BOOL)px_hasRightToLeftLayoutDirection;
- (BOOL)px_isAncestorOfFocusEnvironment:()PhotosUIFoundation;
- (double)currentDynamicRangeHeadroom;
- (double)maximumDynamicRangeHeadroom;
- (double)px_screenScale;
- (uint64_t)px_enumerateDescendantSubviewsUsingBlock:()PhotosUIFoundation;
- (uint64_t)px_layoutDirection;
- (uint64_t)px_leadingEdge;
- (uint64_t)px_trailingEdge;
- (void)px_enumerateDescendantSubviewsPassingTest:()PhotosUIFoundation usingBlock:;
@end

@implementation UIView(PhotosUIFoundation)

- (double)maximumDynamicRangeHeadroom
{
  v1 = [a1 window];
  v2 = [v1 screen];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263F82B60] mainScreen];
  }
  v5 = v4;

  [v5 maximumDynamicRangeHeadroom];
  double v7 = v6;

  return v7;
}

- (double)px_screenScale
{
  v1 = [a1 window];
  v2 = [v1 screen];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263F82B60] mainScreen];
  }
  v5 = v4;

  [v5 scale];
  if (v6 == 0.0) {
    double v7 = 1.0;
  }
  else {
    double v7 = v6;
  }

  return v7;
}

- (uint64_t)px_layoutDirection
{
  uint64_t v1 = [a1 effectiveUserInterfaceLayoutDirection];
  if (v1) {
    return 2 * (v1 == 1);
  }
  else {
    return 1;
  }
}

- (double)currentDynamicRangeHeadroom
{
  uint64_t v1 = [a1 window];
  v2 = [v1 screen];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263F82B60] mainScreen];
  }
  v5 = v4;

  [v5 currentDynamicRangeHeadroom];
  double v7 = v6;

  return v7;
}

- (BOOL)px_isAncestorOfFocusEnvironment:()PhotosUIFoundation
{
  id v4 = a3;
  v5 = v4;
  for (BOOL i = v4 != 0; v5 != a1 && v5; BOOL i = v5 != 0)
  {
    double v7 = v5;
    v5 = [v5 parentFocusEnvironment];
  }
  return i;
}

- (void)px_enumerateDescendantSubviewsPassingTest:()PhotosUIFoundation usingBlock:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v6 = a3;
  double v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [a1 subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v8);
      }
      v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      if (v6[2](v6, v12))
      {
        v7[2](v7, v12, (uint64_t)(v22 + 3));
        if (*((unsigned char *)v22 + 24)) {
          break;
        }
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __83__UIView_PhotosUIFoundation__px_enumerateDescendantSubviewsPassingTest_usingBlock___block_invoke;
        v14[3] = &unk_26545B2B0;
        v15 = v7;
        v16 = &v21;
        objc_msgSend(v12, "px_enumerateDescendantSubviewsPassingTest:usingBlock:", v6, v14);
        BOOL v13 = *((unsigned char *)v22 + 24) == 0;

        if (!v13) {
          break;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v21, 8);
}

- (uint64_t)px_enumerateDescendantSubviewsUsingBlock:()PhotosUIFoundation
{
  return objc_msgSend(a1, "px_enumerateDescendantSubviewsPassingTest:usingBlock:", &__block_literal_global_6392, a3);
}

- (uint64_t)px_trailingEdge
{
  uint64_t v1 = PXFlipLayoutDirection(objc_msgSend(a1, "px_layoutDirection"));

  return PXLeadingRectEdge(v1);
}

- (uint64_t)px_leadingEdge
{
  uint64_t v1 = objc_msgSend(a1, "px_layoutDirection");

  return PXLeadingRectEdge(v1);
}

- (BOOL)px_hasRightToLeftLayoutDirection
{
  return [a1 effectiveUserInterfaceLayoutDirection] == 1;
}

@end