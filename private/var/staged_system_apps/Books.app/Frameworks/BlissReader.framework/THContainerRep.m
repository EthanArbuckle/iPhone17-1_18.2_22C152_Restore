@interface THContainerRep
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4;
- (BOOL)directlyManagesLayerContent;
- (id)childRepsForHitTesting;
- (unint64_t)hitTestOptions;
@end

@implementation THContainerRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (unint64_t)hitTestOptions
{
  return 5;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat x = a3.x;
  double y = a3.y;
  if (([(THContainerRep *)self hitTestOptions] & 1) != 0
    && ([(THContainerRep *)self naturalBoundsForHitTesting],
        v27.CGFloat x = x,
        v27.double y = y,
        CGRectContainsPoint(v28, v27)))
  {
    LOBYTE(v4) = 1;
  }
  else if (([(THContainerRep *)self hitTestOptions] & 4) != 0 {
         && (long long v24 = 0u,
  }
             long long v25 = 0u,
             long long v22 = 0u,
             long long v23 = 0u,
             id v5 = [*(id *)&self->TSDContainerRep_opaque[OBJC_IVAR___TSDContainerRep_mChildReps] reverseObjectEnumerator], (v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16)) != 0))
  {
    id v7 = v6;
    int v4 = 0;
    uint64_t v8 = *(void *)v23;
    float64x2_t v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = objc_msgSend(objc_msgSend(v10, "layout", *(void *)&v17.f64[0]), "geometry");
        if (v11)
        {
          [v11 inverseTransform];
          float64x2_t v12 = v19;
          float64x2_t v13 = v20;
          float64x2_t v14 = v21;
        }
        else
        {
          float64x2_t v20 = 0u;
          float64x2_t v21 = 0u;
          float64x2_t v14 = 0uLL;
          float64x2_t v12 = 0uLL;
          float64x2_t v13 = 0uLL;
          float64x2_t v19 = 0u;
        }
        v4 |= [v10 containsPoint:vaddq_f64(v14, vmlaq_f64(vmulq_n_f64(v13, y), v17, v12))];
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4 & 1;
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v27 = *(void *)&a3.x;
  double y = a3.y;
  if (([(THContainerRep *)self hitTestOptions] & 1) == 0) {
    goto LABEL_20;
  }
  TSDRectWithCenterAndSize();
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(THContainerRep *)self naturalBoundsForHitTesting];
  v39.origin.CGFloat x = v8;
  v39.origin.double y = v10;
  v39.size.double width = v12;
  v39.size.double height = v14;
  if (CGRectIntersectsRect(v38, v39))
  {
    LOBYTE(v15) = 1;
  }
  else
  {
LABEL_20:
    if (([(THContainerRep *)self hitTestOptions] & 4) != 0
      && (long long v35 = 0u,
          long long v36 = 0u,
          long long v33 = 0u,
          long long v34 = 0u,
          v16 = [*(id *)&self->TSDContainerRep_opaque[OBJC_IVAR___TSDContainerRep_mChildReps] reverseObjectEnumerator], (id v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16)) != 0))
    {
      id v18 = v17;
      int v15 = 0;
      uint64_t v19 = *(void *)v34;
      float64x2_t v28 = (float64x2_t)vdupq_lane_s64(v27, 0);
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          float64x2_t v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v22 = objc_msgSend(objc_msgSend(v21, "layout", *(void *)&v28.f64[0]), "geometry");
          if (v22)
          {
            [v22 inverseTransform];
            float64x2_t v23 = v30;
            float64x2_t v24 = v31;
            float64x2_t v25 = v32;
          }
          else
          {
            float64x2_t v31 = 0u;
            float64x2_t v32 = 0u;
            float64x2_t v25 = 0uLL;
            float64x2_t v23 = 0uLL;
            float64x2_t v24 = 0uLL;
            float64x2_t v30 = 0u;
          }
          v15 |= [v21 containsPoint:vaddq_f64(v25, vmlaq_f64(vmulq_n_f64(v24, y), v28, v23)) withSlop:width, height];
        }
        id v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v18);
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  return v15 & 1;
}

- (id)childRepsForHitTesting
{
  if (([(THContainerRep *)self hitTestOptions] & 4) == 0) {
    return 0;
  }

  return [(THContainerRep *)self childReps];
}

@end