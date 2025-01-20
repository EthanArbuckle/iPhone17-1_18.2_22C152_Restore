@interface UIView(PhotosUICoreScrolling)
- (id)_px_leafScrollViewAtPoint:()PhotosUICoreScrolling;
- (id)px_rootScrollView;
- (uint64_t)px_areAllContainerScrollViewsScrolledAtEdge:()PhotosUICoreScrolling;
- (uint64_t)px_areAllScrollViewsContainingPoint:()PhotosUICoreScrolling scrolledAtEdge:;
- (uint64_t)px_containerScrollViewsScrollableAxes;
- (uint64_t)px_scrollableAxesAtPoint:()PhotosUICoreScrolling;
@end

@implementation UIView(PhotosUICoreScrolling)

- (id)px_rootScrollView
{
  id v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = v2;

        v3 = v4;
      }
      uint64_t v5 = [v2 superview];

      v2 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (uint64_t)px_containerScrollViewsScrollableAxes
{
  id v1 = a1;
  if (!v1) {
    return 0;
  }
  v2 = v1;
  uint64_t v3 = 0;
  do
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v2;
      if ([v4 isScrollEnabled]) {
        v3 |= objc_msgSend(v4, "px_scrollableAxis");
      }
    }
    uint64_t v5 = [v2 superview];

    v2 = (void *)v5;
  }
  while (v5);
  return v3;
}

- (uint64_t)px_scrollableAxesAtPoint:()PhotosUICoreScrolling
{
  uint64_t v6 = objc_msgSend(a1, "hitTest:withEvent:", 0);
  v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = a1;
  }
  id v9 = v8;

  uint64_t v10 = objc_msgSend(v9, "_px_leafScrollViewAtPoint:", a2, a3);
  v11 = (void *)v10;
  if (v10) {
    v12 = (void *)v10;
  }
  else {
    v12 = v9;
  }
  id v13 = v12;

  uint64_t v14 = objc_msgSend(v13, "px_containerScrollViewsScrollableAxes");
  return v14;
}

- (uint64_t)px_areAllContainerScrollViewsScrolledAtEdge:()PhotosUICoreScrolling
{
  id v4 = a1;
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_7:
    uint64_t v7 = [v5 superview];

    uint64_t v5 = (void *)v7;
    if (!v7) {
      return 1;
    }
  }
  id v6 = v5;
  if (![v6 isScrollEnabled] || objc_msgSend(v6, "px_isScrolledAtEdge:", a3))
  {

    goto LABEL_7;
  }

  return 0;
}

- (id)_px_leafScrollViewAtPoint:()PhotosUICoreScrolling
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_msgSend(a1, "subviews", 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
      objc_msgSend(v11, "convertPoint:fromView:", a1, a2, a3);
      double v13 = v12;
      double v15 = v14;
      if (objc_msgSend(v11, "pointInside:withEvent:", 0))
      {
        objc_msgSend(v11, "_px_leafScrollViewAtPoint:", v13, v15);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v16) {
          goto LABEL_13;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v6 = a1;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v16 = v6;
    id v6 = v16;
LABEL_13:
    v17 = v16;
    goto LABEL_15;
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (uint64_t)px_areAllScrollViewsContainingPoint:()PhotosUICoreScrolling scrolledAtEdge:
{
  uint64_t v9 = objc_msgSend(a1, "hitTest:withEvent:", 0);
  uint64_t v10 = (void *)v9;
  if (v9) {
    v11 = (void *)v9;
  }
  else {
    v11 = a1;
  }
  id v12 = v11;

  uint64_t v13 = objc_msgSend(v12, "_px_leafScrollViewAtPoint:", a2, a3);
  double v14 = (void *)v13;
  if (v13) {
    double v15 = (void *)v13;
  }
  else {
    double v15 = v12;
  }
  id v16 = v15;

  uint64_t v17 = objc_msgSend(v16, "px_areAllContainerScrollViewsScrolledAtEdge:", a5);
  return v17;
}

@end