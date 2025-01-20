@interface UIView(SpringBoardAdditions)
+ (id)sb_firstDescendantOfViews:()SpringBoardAdditions passingTest:;
- (double)anchorPoint;
- (id)sb_firstDescendantOfClass:()SpringBoardAdditions;
- (id)sb_firstDescendantPassingTest:()SpringBoardAdditions;
- (id)sb_snapshotImage;
- (uint64_t)sb_firstDescendantOfClassNamed:()SpringBoardAdditions;
- (uint64_t)sb_hasActiveKeyboardOnScreen;
- (void)_printLayer:()SpringBoardAdditions level:;
- (void)sb_printLayerHierarchy;
- (void)sb_removeAllSubviews;
- (void)sb_removeAnimationsForKeys:()SpringBoardAdditions update:;
- (void)sb_removeAnimationsIncludingSubviews:()SpringBoardAdditions predicate:;
- (void)setAnchorPoint:()SpringBoardAdditions;
@end

@implementation UIView(SpringBoardAdditions)

- (uint64_t)sb_hasActiveKeyboardOnScreen
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v2 = [a1 superview];
    if (!v2) {
      return v2 & 1;
    }
    v3 = [a1 window];

    if (!v3)
    {
      LOBYTE(v2) = 0;
      return v2 & 1;
    }
  }
  v4 = [a1 firstResponder];
  if (v4 && UIKeyboardAutomaticIsOnScreen())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      objc_opt_class();
      LOBYTE(v2) = objc_opt_isKindOfClass();
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }

  return v2 & 1;
}

- (void)_printLayer:()SpringBoardAdditions level:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (a4 >= 1)
    {
      int v8 = a4;
      do
      {
        [v7 appendString:@"-----"];
        --v8;
      }
      while (v8);
    }
    [v7 appendString:@" "];
    v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v6 masksToBounds];
      [v6 bounds];
      v11 = NSStringFromCGRect(v32);
      *(_DWORD *)buf = 138544130;
      id v24 = v7;
      __int16 v25 = 2114;
      id v26 = v6;
      __int16 v27 = 1024;
      int v28 = v10;
      __int16 v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@layer: %{public}@, clipsToBounds: %d, bounds: %{public}@", buf, 0x26u);
    }
  }
  v12 = [v6 sublayers];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = (a4 + 1);
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v12);
        }
        [a1 _printLayer:*(void *)(*((void *)&v18 + 1) + 8 * v17++) level:v15];
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)sb_printLayerHierarchy
{
  id v2 = [a1 layer];
  [a1 _printLayer:v2 level:0];
}

- (id)sb_snapshotImage
{
  id v2 = [a1 window];
  v3 = [a1 superview];
  [a1 frame];
  objc_msgSend(v3, "convertRect:toView:", v2);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = objc_msgSend(v2, "createIOSurfaceWithFrame:", v5, v7, v9, v11);
  if (v12)
  {
    uint64_t v13 = (const void *)v12;
    id v14 = objc_alloc(MEMORY[0x1E4F42A80]);
    uint64_t v15 = [a1 _screen];
    [v15 scale];
    uint64_t v16 = objc_msgSend(v14, "_initWithIOSurface:scale:orientation:", v13, 0);

    CFRelease(v13);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)sb_removeAllSubviews
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "subviews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) removeFromSuperview];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)sb_removeAnimationsForKeys:()SpringBoardAdditions update:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = a4;
  long long v8 = [a1 layer];
  long long v9 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v10 = objc_msgSend(v8, "animationKeys", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ([v6 containsObject:v15])
        {
          [v8 removeAnimationForKey:v15];
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [v9 count];
  if (v7 && v16) {
    v7[2](v7, v9);
  }
}

- (void)sb_removeAnimationsIncludingSubviews:()SpringBoardAdditions predicate:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a4;
  id v6 = [a1 layer];
  long long v7 = [v6 animationKeys];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = [v6 animationForKey:v12];
        if (v5[2](v5, v13)) {
          [v6 removeAnimationForKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }
  if (a3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = [a1 subviews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "sb_removeAnimationsIncludingSubviews:predicate:", 1, v5);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v16);
    }
  }
}

- (double)anchorPoint
{
  v1 = [a1 layer];
  [v1 anchorPoint];
  double v3 = v2;

  return v3;
}

- (void)setAnchorPoint:()SpringBoardAdditions
{
  id v5 = [a1 layer];
  objc_msgSend(v5, "setAnchorPoint:", a2, a3);
}

+ (id)sb_firstDescendantOfViews:()SpringBoardAdditions passingTest:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v7);
  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "subviews", (void)v17);
          [v9 addObjectsFromArray:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      uint64_t v8 = objc_msgSend(a1, "sb_firstDescendantOfViews:passingTest:", v9, v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

- (id)sb_firstDescendantPassingTest:()SpringBoardAdditions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_class();
  v9[0] = a1;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = objc_msgSend(v5, "sb_firstDescendantOfViews:passingTest:", v6, v4);

  return v7;
}

- (id)sb_firstDescendantOfClass:()SpringBoardAdditions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__UIView_SpringBoardAdditions__sb_firstDescendantOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  double v3 = objc_msgSend(a1, "sb_firstDescendantPassingTest:", v5);
  return v3;
}

- (uint64_t)sb_firstDescendantOfClassNamed:()SpringBoardAdditions
{
  Class v4 = NSClassFromString(aClassName);
  return objc_msgSend(a1, "sb_firstDescendantOfClass:", v4);
}

@end