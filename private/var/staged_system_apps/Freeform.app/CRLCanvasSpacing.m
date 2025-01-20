@interface CRLCanvasSpacing
- (BOOL)containsNonIntersectingSpacingRectsWithRect:(CGRect)a3 forEdge:(int)a4;
- (BOOL)needsGuideForEdge:(int)a3 ofRect:(CGRect)a4;
- (NSMutableSet)associatedFrames;
- (double)exactOffset;
- (id)description;
- (id)spacingRectsRenderableForGuideRect:(CGRect)a3 withICC:(id)a4;
- (int)integerOffset;
- (int64_t)compare:(id)a3;
- (int64_t)guideType;
- (void)addSpacingRect:(double)a3 forFrame:(double)a4 andFrame:(double)a5;
- (void)initWithGuideType:(CGFloat)a3 withSpacingRect:(CGFloat)a4 forFrame:(CGFloat)a5 andFrame:(double)a6;
- (void)needsRedraw;
- (void)updateSpacingUIWithICC:(id)a3;
@end

@implementation CRLCanvasSpacing

- (void)initWithGuideType:(CGFloat)a3 withSpacingRect:(CGFloat)a4 forFrame:(CGFloat)a5 andFrame:(double)a6
{
  v37.receiver = a1;
  v37.super_class = (Class)CRLCanvasSpacing;
  v29 = [super init];
  if (v29)
  {
    id v30 = objc_alloc_init((Class)NSMutableSet);
    v31 = (void *)v29[1];
    v29[1] = v30;

    id v32 = objc_alloc_init((Class)NSMutableSet);
    v33 = (void *)v29[2];
    v29[2] = v32;

    if (a11 == 1) {
      +[CRLSwappableAxesGeometry standardAxesGeometry];
    }
    else {
    uint64_t v34 = +[CRLSwappableAxesGeometry swappedAxesGeometry];
    }
    v35 = (void *)v29[5];
    v29[5] = v34;

    v38.origin.x = a2;
    v38.origin.y = a3;
    v38.size.width = a4;
    v38.size.height = a5;
    if (!CGRectIsNull(v38)) {
      [v29 addSpacingRect:a2 forFrame:a3 andFrame:a4 a5:a6 a7:a7 a8:a8 a9:a9 a17:a18 a19:a20];
    }
  }
  return v29;
}

- (int)integerOffset
{
  if (![(NSMutableSet *)self->mSpacingRects count]) {
    return 1;
  }
  [(CRLCanvasSpacing *)self exactOffset];
  return (int)sub_100407DFC(v3);
}

- (double)exactOffset
{
  mHorizontalGeom = self->mHorizontalGeom;
  double v3 = [(NSMutableSet *)self->mSpacingRects anyObject];
  v4 = [v3 first];
  [v4 CGRectValue];
  -[CRLSwappableAxesGeometry rectWidth:](mHorizontalGeom, "rectWidth:");
  double v6 = v5;

  return v6;
}

- (int64_t)guideType
{
  return [(CRLSwappableAxesGeometry *)self->mHorizontalGeom horizontalOrientation] == 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int v5 = [(CRLCanvasSpacing *)self integerOffset];
  if (v5 <= (int)[v4 integerOffset])
  {
    int v7 = [(CRLCanvasSpacing *)self integerOffset];
    if (v7 >= (int)[v4 integerOffset]) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (void)addSpacingRect:(double)a3 forFrame:(double)a4 andFrame:(double)a5
{
  uint64_t v34 = objc_alloc_init(CRLMutablePair);
  v29 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a2, a3, a4, a5);
  [(CRLMutablePair *)v34 setFirst:v29];

  [(CRLMutablePair *)v34 setSecond:0];
  [*(id *)(a1 + 8) addObject:v34];
  id v30 = *(void **)(a1 + 16);
  v31 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a6, a7, a8, a9);
  [v30 addObject:v31];

  id v32 = *(void **)(a1 + 16);
  v33 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a10, a11, a12, a13);
  [v32 addObject:v33];
}

- (BOOL)needsGuideForEdge:(int)a3 ofRect:(CGRect)a4
{
  double width = a4.size.width;
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v7 = 0;
  switch(a3)
  {
    case 0:
      double MinX = CGRectGetMinX(a4);
      double v9 = MinX - (double)[(CRLCanvasSpacing *)self integerOffset];
      goto LABEL_5;
    case 1:
    case 4:
      return v7;
    case 2:
      double MaxX = CGRectGetMaxX(a4);
      double v9 = MaxX + (double)[(CRLCanvasSpacing *)self integerOffset];
LABEL_5:
      v12 = sub_1000644A8;
      goto LABEL_9;
    case 3:
      double MinY = CGRectGetMinY(a4);
      double v9 = MinY - (double)[(CRLCanvasSpacing *)self integerOffset];
      goto LABEL_8;
    case 5:
      double MaxY = CGRectGetMaxY(a4);
      double v9 = MaxY + (double)[(CRLCanvasSpacing *)self integerOffset];
LABEL_8:
      v12 = sub_1000643E0;
LABEL_9:
      v10 = v12;
      break;
    default:
      v10 = 0;
      double v9 = 0.0;
      break;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v15 = self->mSpacingRects;
  id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v16)
  {
    id v17 = v16;
    BOOL v7 = 0;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v35 + 1) + 8 * i) first:width height:height v35];
        [v20 CGRectValue];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;

        -[CRLSwappableAxesGeometry rectMinX:](self->mHorizontalGeom, "rectMinX:", v22, v24, v26, v28);
        if (vabdd_f64(v29, v9) <= 0.01)
        {
          id v30 = -[CRLSwappableAxesGeometry rectMaxX:](self->mHorizontalGeom, "rectMaxX:", v22, v24, v26, v28);
          if (vabdd_f64(v31, v9) <= 0.01
            && !((unsigned int (*)(id, double, double, double, double, double, double, double, double))v10)(v30, x, y, width, height, v22, v24, v26, v28))
          {
            continue;
          }
        }
        BOOL v7 = 1;
      }
      id v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v17);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)containsNonIntersectingSpacingRectsWithRect:(CGRect)a3 forEdge:(int)a4
{
  double x = a3.origin.x;
  double y = a3.origin.y;
  double width = a3.size.width;
  double height = a3.size.height;
  double v9 = sub_100063FC4(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v10 = self->mSpacingRects;
  id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = [*(id *)(*((void *)&v29 + 1) + 8 * i) first];
        [v16 CGRectValue];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;

        double v25 = sub_100063FC4(a4, v18, v20, v22, v24);
        BOOL v26 = vabdd_f64(v9, v25) >= 1.0 && v9 != v25;
        if (!sub_10006525C(x, y, width, height, v18, v20, v22, v24)) {
          v13 |= v26;
        }
      }
      id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (void)needsRedraw
{
  self->mHasBeenDrawn = 0;
}

- (id)spacingRectsRenderableForGuideRect:(CGRect)a3 withICC:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (self->mHasBeenDrawn)
  {
    v10 = 0;
  }
  else
  {
    mRenderable = self->mRenderable;
    if (!mRenderable)
    {
      id v12 = +[CRLCanvasRenderable renderable];
      char v13 = self->mRenderable;
      self->mRenderable = v12;

      -[CRLCanvasRenderable setPosition:](self->mRenderable, "setPosition:", CGPointZero.x, CGPointZero.y);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v14 = self->mSpacingRects;
      id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v14);
            }
            double v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            double v20 = [v19 first:v33];
            [v20 CGRectValue];
            double v22 = v21;
            double v24 = v23;
            double v26 = v25;
            double v28 = v27;

            if (!sub_10006525C(v22, v24, v26, v28, x, y, width, height))
            {
              long long v29 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", [(CRLSwappableAxesGeometry *)self->mHorizontalGeom horizontalOrientation], v9, 1, v22, v24, v26, v28);
              [v19 setSecond:v29];
              long long v30 = self->mRenderable;
              long long v31 = +[CRLCanvasRenderable renderableFromLayer:v29];
              [(CRLCanvasRenderable *)v30 addSubrenderable:v31];
            }
          }
          id v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v16);
      }

      mRenderable = self->mRenderable;
    }
    self->mHasBeenDrawn = 1;
    v10 = mRenderable;
  }

  return v10;
}

- (void)updateSpacingUIWithICC:(id)a3
{
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v5 = self->mSpacingRects;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [v10 first:v21];
        [v11 CGRectValue];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;

        double v20 = [v10 second];
        [v20 setFrameFromSpacingRect:v4 icc:v13, v15, v17, v19];
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

- (id)description
{
  double v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([(CRLCanvasSpacing *)self guideType]) {
    CFStringRef v5 = @"vertical";
  }
  else {
    CFStringRef v5 = @"horizontal";
  }
  [(CRLCanvasSpacing *)self exactOffset];
  id v7 = +[NSString stringWithFormat:@"<%@ %p: %@ spacing with size %f>", v4, self, v5, v6];

  return v7;
}

- (NSMutableSet)associatedFrames
{
  return self->mAssociatedFrames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHorizontalGeom, 0);
  objc_storeStrong((id *)&self->mRenderable, 0);
  objc_storeStrong((id *)&self->mAssociatedFrames, 0);

  objc_storeStrong((id *)&self->mSpacingRects, 0);
}

@end