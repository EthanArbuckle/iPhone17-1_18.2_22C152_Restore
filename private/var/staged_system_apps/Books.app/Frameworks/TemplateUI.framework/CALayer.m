@interface CALayer
- (id)tui_allAnimationsInTree;
- (id)tui_allLayersInTree;
- (id)tui_basicPropertiesToCopy;
- (id)tui_deepCopyLayer;
- (id)tui_propertiesToCopy;
- (id)tui_uniqueAnimationKeyWithPrefix:(id)a3;
- (void)tui_addLayerAndSublayersToArray:(id)a3 allowHiddenLayers:(BOOL)a4;
- (void)tui_moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 geometryFlipped:(BOOL)a5 retinaScale:(double)a6 animate:(BOOL)a7;
@end

@implementation CALayer

- (id)tui_deepCopyLayer
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithLayer:self];
  if (v3)
  {
    v4 = [(CALayer *)self sublayers];
    v5 = v4;
    if (v4)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v6 = [v4 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v6)
      {
        id v7 = v6;
        id v8 = 0;
        uint64_t v9 = *(void *)v43;
        do
        {
          v10 = 0;
          v11 = v8;
          do
          {
            if (*(void *)v43 != v9) {
              objc_enumerationMutation(v5);
            }
            id v8 = *(id *)(*((void *)&v42 + 1) + 8 * (void)v10);

            id v12 = [v8 tui_deepCopyLayer];
            if (v12) {
              [v3 addSublayer:v12];
            }

            v10 = (char *)v10 + 1;
            v11 = v8;
          }
          while (v7 != v10);
          id v7 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v7);
      }
    }
    v13 = [(CALayer *)self mask];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 tui_deepCopyLayer];
      if (v15) {
        [v3 setMask:v15];
      }
    }
    v33 = v5;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v16 = [(CALayer *)self tui_propertiesToCopy];
    id v17 = [v16 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v39;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (([v21 isEqualToString:@"sublayers"] & 1) == 0
            && ([v21 isEqualToString:@"mask"] & 1) == 0
            && [(CALayer *)self shouldArchiveValueForKey:v21])
          {
            v22 = [(CALayer *)self valueForKey:v21];
            [v3 setValue:v22 forKey:v21];
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v18);
    }

    if ([(CALayer *)self needsDisplay]) {
      [v3 setNeedsDisplay];
    }
    if ([(CALayer *)self needsLayout]) {
      [v3 setNeedsLayout];
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v23 = [(CALayer *)self animationKeys];
    id v24 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
          v29 = [(CALayer *)self animationForKey:v28];
          if (([v29 isRemovedOnCompletion] & 1) == 0) {
            [v3 addAnimation:v29 forKey:v28];
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v25);
    }

    id v30 = v3;
  }

  return v3;
}

- (id)tui_basicPropertiesToCopy
{
  return +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", @"bounds", @"position", @"zPosition", @"anchorPoint", @"anchorPointZ", @"transform", @"hidden", @"doubleSided", @"geometryFlipped", @"sublayerTransform", @"masksToBounds", @"contents", @"contentsRect", @"contentsGravity", @"contentsScale", @"contentsCenter", @"minificationFilter",
           @"magnificationFilter",
           @"minificationFilterBias",
           @"opaque",
           @"needsDisplayOnBoundsChange",
           @"edgeAntialiasingMask",
           @"backgroundColor",
           @"cornerRadius",
           @"borderWidth",
           @"borderColor",
           @"opacity",
           @"compositingFilter",
           @"filters",
           @"backgroundFilters",
           @"shouldRasterize",
           @"rasterizationScale",
           @"shadowColor",
           @"shadowOpacity",
           @"shadowOffset",
           @"shadowRadius",
           @"shadowPath",
           @"actions",
           @"name",
           @"style",
           @"beginTime",
           @"duration",
           @"speed",
           @"timeOffset",
           @"repeatCount",
           @"repeatDuration",
           @"autoreverses",
           @"fillMode",
           0);
}

- (id)tui_propertiesToCopy
{
  if (!qword_2DF1C0) {
    qword_2DF1C0 = (uint64_t)NSClassFromString(@"CAShapeLayer");
  }
  id v3 = [(CALayer *)self tui_basicPropertiesToCopy];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = &off_266278;
LABEL_11:
    [v3 addObjectsFromArray:v4];
    goto LABEL_12;
  }
  if (objc_opt_isKindOfClass())
  {
    v4 = &off_266290;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 addObject:@"scrollMode"];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = &off_2662A8;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (id)tui_allLayersInTree
{
  id v3 = +[NSMutableArray array];
  [(CALayer *)self tui_addLayerAndSublayersToArray:v3 allowHiddenLayers:1];

  return v3;
}

- (void)tui_addLayerAndSublayersToArray:(id)a3 allowHiddenLayers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 || ![(CALayer *)self isHidden])
  {
    [v6 addObject:self];
    id v7 = [(CALayer *)self mask];

    if (v7)
    {
      id v8 = [(CALayer *)self mask];
      [v8 tui_addLayerAndSublayersToArray:v6 allowHiddenLayers:v4];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = [(CALayer *)self sublayers];
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) tui_addLayerAndSublayersToArray:v6 allowHiddenLayers:v4];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (id)tui_allAnimationsInTree
{
  v2 = [(CALayer *)self tui_allLayersInTree];
  id v3 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = [v8 animationKeys];
        id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v18;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = [v8 animationForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)];
              [v3 addObject:v14];
            }
            id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v11);
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)tui_moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 geometryFlipped:(BOOL)a5 retinaScale:(double)a6 animate:(BOOL)a7
{
  BOOL v9 = a5;
  uint64_t v12 = (NSString *)a4;
  [a3 bounds];
  double x = v13;
  double y = v15;
  double v18 = v17;
  double v20 = v19;
  [(CALayer *)self bounds];
  double v23 = v21 / a6;
  double v24 = v22 / a6;
  if (a6 == 1.0)
  {
    double v24 = v22;
    double v23 = v21;
  }
  if (v18 >= 0.00001) {
    double v25 = v18;
  }
  else {
    double v25 = 0.00001;
  }
  if (v20 >= 0.00001) {
    double v26 = v20;
  }
  else {
    double v26 = 0.00001;
  }
  if (v23 >= 0.00001) {
    double v27 = v23;
  }
  else {
    double v27 = 0.00001;
  }
  if (v24 >= 0.00001) {
    double v28 = v24;
  }
  else {
    double v28 = 0.00001;
  }
  if (v9)
  {
    if ([(NSString *)v12 isEqualToString:kCAGravityTopLeft])
    {
      v29 = &kCAGravityBottomLeft;
LABEL_22:
      CALayerContentsGravity v30 = *v29;
LABEL_23:
      v31 = v30;

      uint64_t v12 = v31;
      goto LABEL_24;
    }
    if ([(NSString *)v12 isEqualToString:kCAGravityTop])
    {
      v29 = &kCAGravityBottom;
      goto LABEL_22;
    }
    if ([(NSString *)v12 isEqualToString:kCAGravityTopRight])
    {
      v29 = &kCAGravityBottomRight;
      goto LABEL_22;
    }
    unsigned __int8 v37 = [(NSString *)v12 isEqualToString:kCAGravityBottomLeft];
    CALayerContentsGravity v30 = kCAGravityTopLeft;
    if (v37) {
      goto LABEL_23;
    }
    unsigned __int8 v38 = [(NSString *)v12 isEqualToString:kCAGravityBottom];
    CALayerContentsGravity v30 = kCAGravityTop;
    if (v38) {
      goto LABEL_23;
    }
    unsigned int v39 = [(NSString *)v12 isEqualToString:kCAGravityBottomRight];
    CALayerContentsGravity v30 = kCAGravityTopRight;
    if (v39) {
      goto LABEL_23;
    }
  }
LABEL_24:
  if ([(NSString *)v12 isEqualToString:kCAGravityTopLeft])
  {
LABEL_29:
    double y = y + v26 - v28;
LABEL_30:
    double v32 = 1.0;
LABEL_31:
    double v33 = 1.0;
    goto LABEL_32;
  }
  if ([(NSString *)v12 isEqualToString:kCAGravityTop])
  {
    double x = x + v25 * 0.5 - v27 * 0.5;
    goto LABEL_29;
  }
  if ([(NSString *)v12 isEqualToString:kCAGravityTopRight])
  {
    double x = x + v25 - v27;
    goto LABEL_29;
  }
  if ([(NSString *)v12 isEqualToString:kCAGravityLeft]) {
    goto LABEL_48;
  }
  if ([(NSString *)v12 isEqualToString:kCAGravityCenter])
  {
    double v36 = 0.5;
    double x = x + v25 * 0.5 - v27 * 0.5;
LABEL_49:
    double y = y + v26 * v36 - v28 * v36;
    goto LABEL_30;
  }
  if ([(NSString *)v12 isEqualToString:kCAGravityRight])
  {
    double x = x + v25 - v27;
LABEL_48:
    double v36 = 0.5;
    goto LABEL_49;
  }
  double v32 = 1.0;
  if ([(NSString *)v12 isEqualToString:kCAGravityBottomLeft]) {
    goto LABEL_31;
  }
  if ([(NSString *)v12 isEqualToString:kCAGravityBottom])
  {
    double x = x + v25 * 0.5 - v27 * 0.5;
    goto LABEL_31;
  }
  if ([(NSString *)v12 isEqualToString:kCAGravityBottomRight])
  {
    double x = x + v25 - v27;
    goto LABEL_31;
  }
  if ([(NSString *)v12 isEqualToString:kCAGravityResize])
  {
    double v33 = v25 / v27;
    double v32 = v26 / v28;
  }
  else
  {
    if ([(NSString *)v12 isEqualToString:kCAGravityResizeAspect])
    {
      if (v25 / v27 >= v26 / v28) {
        double v32 = v26 / v28;
      }
      else {
        double v32 = v25 / v27;
      }
    }
    else
    {
      if (![(NSString *)v12 isEqualToString:kCAGravityResizeAspectFill])
      {
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        goto LABEL_31;
      }
      if (v25 / v27 >= v26 / v28) {
        double v32 = v25 / v27;
      }
      else {
        double v32 = v26 / v28;
      }
    }
    double x = x + (v25 - v27 * v32) * 0.5;
    double y = y + (v26 - v28 * v32) * 0.5;
    double v33 = v32;
  }
LABEL_32:
  if (a6 != 1.0)
  {
    double v33 = v33 / a6;
    double v32 = v32 / a6;
  }
  if (!a7)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
  }
  CATransform3DMakeScale(&v41, v33, v32, 1.0);
  CATransform3D v40 = v41;
  [(CALayer *)self setTransform:&v40];
  [(CALayer *)self frame];
  double v35 = v34;
  [(CALayer *)self frame];
  -[CALayer setFrame:](self, "setFrame:", x, y, v35);
  if (!a7) {
    +[CATransaction commit];
  }
}

- (id)tui_uniqueAnimationKeyWithPrefix:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  uint64_t v6 = 1;
  do
  {
    id v7 = v5;
    id v5 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%lu", v4, v6];

    id v8 = [(CALayer *)self animationForKey:v5];

    ++v6;
  }
  while (v8);

  return v5;
}

@end