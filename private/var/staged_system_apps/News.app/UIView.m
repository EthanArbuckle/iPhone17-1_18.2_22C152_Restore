@interface UIView
+ (id)fr_adjacentSiblingViewsFromViews:(id)a3;
+ (void)fr_animateWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5 options:(unint64_t)a6 animations:(id)a7 completion:(id)a8;
- (BOOL)fr_hasAncestorOfType:(Class)a3;
- (BOOL)visible;
- (CGRect)fr_adjustedWidthAndXOriginFromFrame:(CGRect)a3;
- (double)fr_height;
- (double)fr_width;
- (id)fr_firstAncestorOfType:(Class)a3;
- (id)fr_selfOrFirstAncestorOfType:(Class)a3;
- (id)fr_subviewsOfType:(Class)a3;
- (void)fr_accessibilityWorkaroundFor20458918ByClearingParentTableCellsChildCache;
- (void)fr_recolorLabelSubviewsWithColor:(id)a3;
- (void)fr_setBlurred:(BOOL)a3 radius:(double)a4 animated:(BOOL)a5 duration:(double)a6;
- (void)fr_setHeight:(double)a3;
- (void)fr_setMaxX:(double)a3;
- (void)fr_setMaxY:(double)a3;
- (void)fr_setMinX:(double)a3;
- (void)fr_setMinY:(double)a3;
- (void)roundOrigin;
- (void)setFr_height:(double)a3;
- (void)setFr_width:(double)a3;
@end

@implementation UIView

- (void)roundOrigin
{
  [(UIView *)self frame];
  double v4 = round(v3);
  double v6 = round(v5);

  -[UIView setFrame:](self, "setFrame:", v4, v6);
}

- (void)fr_setMinX:(double)a3
{
  [(UIView *)self frame];

  [(UIView *)self setFrame:a3];
}

- (void)fr_setMaxX:(double)a3
{
  [(UIView *)self frame];

  [(UIView *)self setFrame:a3 - v5];
}

- (void)fr_setMinY:(double)a3
{
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:");
}

- (void)fr_setMaxY:(double)a3
{
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:");
}

- (double)fr_width
{
  [(UIView *)self frame];

  return CGRectGetWidth(*(CGRect *)&v2);
}

- (void)setFr_width:(double)a3
{
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:");
}

- (double)fr_height
{
  [(UIView *)self frame];

  return CGRectGetHeight(*(CGRect *)&v2);
}

- (void)setFr_height:(double)a3
{
}

- (void)fr_setHeight:(double)a3
{
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:");
}

- (void)fr_accessibilityWorkaroundFor20458918ByClearingParentTableCellsChildCache
{
  id v2 = [(UIView *)self fr_selfOrFirstAncestorOfType:objc_opt_class()];
  NSSelectorFromString(@"_accessibilityClearChildren");
  if (objc_opt_respondsToSelector()) {
    [v2 _accessibilityClearChildren];
  }
}

- (BOOL)fr_hasAncestorOfType:(Class)a3
{
  double v3 = [(UIView *)self fr_firstAncestorOfType:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)fr_firstAncestorOfType:(Class)a3
{
  uint64_t v3 = [(UIView *)self superview];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [v4 superview];

      BOOL v4 = (void *)v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
    id v6 = v4;
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }

  return v6;
}

- (id)fr_selfOrFirstAncestorOfType:(Class)a3
{
  uint64_t v3 = self;
  if (v3)
  {
    BOOL v4 = v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [v4 superview];

      BOOL v4 = (void *)v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
    id v6 = v4;
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }

  return v6;
}

- (id)fr_subviewsOfType:(Class)a3
{
  BOOL v4 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(UIView *)self subviews];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

- (CGRect)fr_adjustedWidthAndXOriginFromFrame:(CGRect)a3
{
  CGFloat width = a3.size.width;
  CGFloat x = a3.origin.x;
  [(UIView *)self frame];
  double v7 = x;
  double v8 = width;
  result.size.height = v6;
  result.size.CGFloat width = v8;
  result.origin.y = v5;
  result.origin.CGFloat x = v7;
  return result;
}

+ (void)fr_animateWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5 options:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  id v15 = a7;
  id v13 = a8;
  if (a5)
  {
    id v14 = a5;
    a5 = objc_alloc_init(FRCustomAnimationCurveFactory);
    [a5 setTimingFunction:v14];

    a6 |= 0x60000uLL;
  }
  +[UIView _animateWithDuration:a6 delay:a5 options:v15 factory:v13 animations:a3 completion:a4];
}

- (void)fr_setBlurred:(BOOL)a3 radius:(double)a4 animated:(BOOL)a5 duration:(double)a6
{
  BOOL v7 = a5;
  BOOL v9 = a3;
  if (!UIAccessibilityIsReduceTransparencyEnabled())
  {
    v12 = +[UIScreen mainScreen];
    [v12 scale];
    double v14 = v13;

    uint64_t v15 = +[NSNumber numberWithDouble:a4];
    long long v16 = (_UNKNOWN **)v15;
    if (v9)
    {
      if (v7)
      {
        v17 = (_UNKNOWN **)v15;
        long long v16 = &off_1000CFCC0;
        double v18 = 0.7;
        double v19 = v14;
LABEL_10:
        v20 = [(UIView *)self layer];
        [v20 setShouldRasterize:1];

        v21 = [(UIView *)self layer];
        [v21 setRasterizationScale:v18];

        +[CATransaction begin];
        +[CATransaction setAnimationDuration:a6];
        v42 = _NSConcreteStackBlock;
        uint64_t v43 = 3221225472;
        v44 = sub_10006CF1C;
        v45 = &unk_1000CA8D0;
        v46 = self;
        v22 = v17;
        id v47 = v22;
        v48 = @"filters.gaussianBlur.inputRadius";
        BOOL v51 = v9;
        uint64_t v49 = 0x3FE6666666666666;
        double v50 = v14;
        +[CATransaction setCompletionBlock:&v42];
        v23 = +[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterGaussianBlur, v42, v43, v44, v45, v46);
        [v23 setName:@"gaussianBlur"];
        [v23 setCachesInputImage:0];
        [v23 setValue:v16 forKey:@"inputRadius"];
        [v23 setValue:@"low" forKey:@"inputQuality"];
        v24 = [(UIView *)self layer];
        v54 = v23;
        v25 = +[NSArray arrayWithObjects:&v54 count:1];
        [v24 setFilters:v25];

        v26 = +[CABasicAnimation animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
        [v26 setRemovedOnCompletion:0];
        [v26 setFillMode:kCAFillModeForwards];
        [v26 setFromValue:v16];
        [v26 setToValue:v22];
        v27 = [(UIView *)self layer];
        [v27 addAnimation:v26 forKey:@"filters.gaussianBlur.inputRadius"];

        +[CATransaction begin];
        +[CATransaction setAnimationDuration:a6 * 0.1];
        v28 = +[CABasicAnimation animationWithKeyPath:@"rasterizationScale"];
        [v28 setRemovedOnCompletion:1];
        v29 = +[NSNumber numberWithDouble:v19];
        [v28 setFromValue:v29];

        v30 = +[NSNumber numberWithDouble:v18];
        [v28 setToValue:v30];

        [v28 setFillMode:kCAFillModeBackwards];
        if (!v9)
        {
          v31 = [(UIView *)self layer];
          [v31 convertTime:0 fromLayer:CACurrentMediaTime()];
          [v28 setBeginTime:v32 + a6 - a6 * 0.1];
        }
        v33 = [(UIView *)self layer];
        [v33 addAnimation:v28 forKey:@"rasterizationScale"];

        +[CATransaction commit];
        +[CATransaction commit];

        goto LABEL_15;
      }
      v34 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
      v35 = [(UIView *)self layer];
      [v35 setShouldRasterize:1];

      v36 = [(UIView *)self layer];
      [v36 setRasterizationScale:0.7];

      [v34 setName:@"gaussianBlur"];
      [v34 setCachesInputImage:0];
      [v34 setValue:v16 forKey:@"inputRadius"];
      [v34 setValue:@"low" forKey:@"inputQuality"];
      v37 = [(UIView *)self layer];
      v53 = v34;
      v38 = +[NSArray arrayWithObjects:&v53 count:1];
      [v37 setFilters:v38];

      v22 = v16;
      long long v16 = &off_1000CFCC0;
    }
    else
    {
      if (v7)
      {
        v17 = &off_1000CFCC0;
        double v19 = 0.7;
        double v18 = v14;
        goto LABEL_10;
      }
      v39 = [(UIView *)self layer];
      [v39 setFilters:&__NSArray0__struct];

      v40 = [(UIView *)self layer];
      [v40 setShouldRasterize:0];

      v41 = [(UIView *)self layer];
      [v41 setRasterizationScale:1.0];

      v22 = &off_1000CFCC0;
    }
LABEL_15:

    return;
  }
  double v11 = 1.0;
  v52[1] = 3221225472;
  v52[0] = _NSConcreteStackBlock;
  v52[2] = sub_10006CF10;
  v52[3] = &unk_1000C98B8;
  if (v9) {
    double v11 = 0.0;
  }
  v52[4] = self;
  *(double *)&v52[5] = v11;
  +[UIView fr_animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "fr_animateWithDuration:delay:timingFunction:options:animations:completion:", 0, 0, v52, 0, a6);
}

+ (id)fr_adjacentSiblingViewsFromViews:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray array];
  double v5 = +[NSHashTable hashTableWithOptions:512];
  double v6 = +[NSHashTable hashTableWithOptions:512];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 addObject:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v9);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  id v12 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v36;
    uint64_t v27 = *(void *)v36;
    v28 = v6;
    do
    {
      uint64_t v15 = 0;
      id v29 = v13;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v15) superview:v27];
        if (([v6 containsObject:v16] & 1) == 0)
        {
          v17 = +[NSMutableArray array];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          double v18 = [v16 subviews];
          id v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v32;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v32 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
                if ([v5 containsObject:v23])
                {
                  [v17 addObject:v23];
                }
                else if ([v17 count])
                {
                  id v24 = [v17 copy];
                  [v4 addObject:v24];

                  [v17 removeAllObjects];
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
            }
            while (v20);
          }

          if ([v17 count])
          {
            id v25 = [v17 copy];
            [v4 addObject:v25];
          }
          double v6 = v28;
          [v28 addObject:v16];

          uint64_t v14 = v27;
          id v13 = v29;
        }

        uint64_t v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v13);
  }

  return v4;
}

- (void)fr_recolorLabelSubviewsWithColor:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = [(UIView *)self subviews];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setTextColor:v4];
        }
        else {
          [v10 fr_recolorLabelSubviewsWithColor:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)visible
{
  if ([(UIView *)self isHidden]) {
    return 0;
  }
  [(UIView *)self alpha];
  if (v3 <= 0.0) {
    return 0;
  }
  [(UIView *)self frame];
  return !CGRectIsEmpty(v5);
}

@end