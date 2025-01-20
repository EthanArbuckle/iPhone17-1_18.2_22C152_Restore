@interface UIView(TSAAdditions)
- (uint64_t)p_translateToView:()TSAAdditions above:siblingView:shouldScale:;
- (uint64_t)translateAndScaleToView:()TSAAdditions;
- (uint64_t)translateAndScaleToView:()TSAAdditions aboveSubview:;
- (uint64_t)translateAndScaleToView:()TSAAdditions belowSubview:;
- (uint64_t)translateToView:()TSAAdditions;
- (uint64_t)translateToView:()TSAAdditions aboveSubview:;
- (uint64_t)translateToView:()TSAAdditions belowSubview:;
- (void)childAtPoint:()TSAAdditions;
@end

@implementation UIView(TSAAdditions)

- (uint64_t)p_translateToView:()TSAAdditions above:siblingView:shouldScale:
{
  [a1 center];
  objc_msgSend((id)objc_msgSend(a1, "superview"), "convertPoint:toView:", a3, v11, v12);
  objc_msgSend(a1, "setCenter:");
  if (a6)
  {
    objc_msgSend((id)objc_msgSend(a1, "superview"), "convertRect:toView:", a3, 0.0, 0.0, 1.0, 1.0);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    if (a1) {
      [a1 transform];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    CGAffineTransformScale(&v20, &v19, v14, v16);
    CGAffineTransform v18 = v20;
    [a1 setTransform:&v18];
  }
  if (!a5) {
    return [a3 addSubview:a1];
  }
  if (a4) {
    return [a3 insertSubview:a1 aboveSubview:a5];
  }
  return [a3 insertSubview:a1 belowSubview:a5];
}

- (uint64_t)translateAndScaleToView:()TSAAdditions
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 0, 0, 1);
}

- (uint64_t)translateAndScaleToView:()TSAAdditions aboveSubview:
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 1, a4, 1);
}

- (uint64_t)translateAndScaleToView:()TSAAdditions belowSubview:
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 0, a4, 1);
}

- (uint64_t)translateToView:()TSAAdditions
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 0, 0, 0);
}

- (uint64_t)translateToView:()TSAAdditions aboveSubview:
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 1, a4, 0);
}

- (uint64_t)translateToView:()TSAAdditions belowSubview:
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 0, a4, 0);
}

- (void)childAtPoint:()TSAAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(a1, "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    [v10 frame];
    v18.x = a2;
    v18.y = a3;
    if (CGRectContainsPoint(v19, v18)) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

@end