@interface CALayer
+ (Class)crl_renderableClass;
- (BOOL)crl_hideOverlayLayerDuringZoomOperations;
- (BOOL)crl_tilingSafeHasContents;
- (CGImage)crl_newRasterizedImageRef;
- (CGImage)crl_newRasterizedImageRefForLayerRect:(CGRect)a3;
- (CGRect)crl_frameIncludingSublayers;
- (NSArray)crl_sublayersForTilingLayerSupport;
- (id)tsd_newLayerForRepContentPileClone;
- (void)crl_addSpringScaleInAnimationWithDelay:(double)a3;
- (void)crl_addZoomAnimationFromPoint:(CGPoint)a3;
- (void)crl_addZoomAnimationFromPoint:(CGPoint)a3 startingScale:(double)a4;
- (void)crl_applyDefaultCanvasOverlayUIShadowSettings;
- (void)crl_cancelLayoutForTilingLayers;
- (void)crl_ignoreAccessibilityInvertColorsIfNeeded;
- (void)crl_ignoreAccessibilityInvertColorsIfNeeded:(BOOL)a3;
- (void)crl_removeSpringScaleInAnimation;
- (void)crl_removeZoomAnimation;
- (void)crl_setHideOverlayLayerDuringZoomOperations:(BOOL)a3;
- (void)crl_setIfDifferentFrame:(CGRect)a3 orTransform:(CGAffineTransform *)a4;
- (void)crl_setNeedsLayoutForTilingLayers;
- (void)crl_tilingSafeSetSublayers:(id)a3;
- (void)crl_undoIgnoreAccessibilityInvertColors;
- (void)p_clearAllLayerDelegates;
@end

@implementation CALayer

- (void)p_clearAllLayerDelegates
{
  v3 = [(CALayer *)self delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_opt_class();
  int v5 = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    int v6 = v5;
    v7 = [(CALayer *)self delegate];
    objc_opt_class();
    int v8 = objc_opt_isKindOfClass();

    if (((v6 | v8) & 1) == 0) {
      return;
    }
  }
  else
  {
    [(CALayer *)self setDelegate:0];
  }
  v9 = [(CALayer *)self sublayers];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) p_clearAllLayerDelegates];
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)crl_ignoreAccessibilityInvertColorsIfNeeded
{
}

- (void)crl_ignoreAccessibilityInvertColorsIfNeeded:(BOOL)a3
{
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v4 = [(CALayer *)self filters];

    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      int v5 = [(CALayer *)self filters];
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v15;
LABEL_5:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) name];
          unsigned __int8 v11 = [v10 isEqualToString:@"CRLCALayerAdditionsAXDoubleInvertFilterKey"];

          if (v11) {
            goto LABEL_17;
          }
          if (v7 == (id)++v9)
          {
            id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v7) {
              goto LABEL_5;
            }
            break;
          }
        }
      }

      int v5 = [(CALayer *)self filters];
      uint64_t v12 = sub_1000EE854();
      v13 = [v5 arrayByAddingObject:v12];
      [(CALayer *)self setFilters:v13];
    }
    else
    {
      int v5 = sub_1000EE854();
      v19 = v5;
      uint64_t v12 = +[NSArray arrayWithObjects:&v19 count:1];
      [(CALayer *)self setFilters:v12];
    }

LABEL_17:
    return;
  }

  [(CALayer *)self crl_undoIgnoreAccessibilityInvertColors];
}

- (void)crl_undoIgnoreAccessibilityInvertColors
{
  id v4 = [(CALayer *)self filters];
  v3 = [v4 crl_arrayOfObjectsPassingTest:&stru_1014D5218];
  [(CALayer *)self setFilters:v3];
}

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

- (id)tsd_newLayerForRepContentPileClone
{
  return objc_alloc_init((Class)CALayer);
}

- (NSArray)crl_sublayersForTilingLayerSupport
{
  v2 = [(CALayer *)self sublayers];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (void)crl_setNeedsLayoutForTilingLayers
{
  id v3 = [(CALayer *)self crl_sublayersForTilingLayerSupport];
  [v3 makeObjectsPerformSelector:a2];
}

- (void)crl_cancelLayoutForTilingLayers
{
  id v3 = [(CALayer *)self crl_sublayersForTilingLayerSupport];
  [v3 makeObjectsPerformSelector:a2];
}

- (void)crl_tilingSafeSetSublayers:(id)a3
{
  id v6 = a3;
  id v4 = [(CALayer *)self sublayers];
  unsigned __int8 v5 = [v6 isEqualToArray:v4];

  if ((v5 & 1) == 0) {
    [(CALayer *)self setSublayers:v6];
  }
}

- (BOOL)crl_tilingSafeHasContents
{
  v2 = [(CALayer *)self contents];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)crl_applyDefaultCanvasOverlayUIShadowSettings
{
  id v3 = +[UIColor blackColor];
  -[CALayer setShadowColor:](self, "setShadowColor:", [v3 CGColor]);

  [(CALayer *)self setShadowRadius:15.0];
  LODWORD(v4) = 1045220557;
  [(CALayer *)self setShadowOpacity:v4];

  -[CALayer setShadowOffset:](self, "setShadowOffset:", 0.0, 4.0);
}

- (void)crl_setIfDifferentFrame:(CGRect)a3 orTransform:(CGAffineTransform *)a4
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((sub_100067C6C() & 1) != 0
    || (long long v9 = *(_OWORD *)&a4->c,
        *(_OWORD *)&t2.a = *(_OWORD *)&a4->a,
        *(_OWORD *)&t2.c = v9,
        *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a4->tx,
        sub_100067CA4()))
  {
    int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD808);
    }
    unsigned __int8 v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8AF0(v10, v11);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD828);
    }
    uint64_t v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CALayer(CRLAdditions) crl_setIfDifferentFrame:orTransform:]");
    long long v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CALayer_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:34 isFatal:0 description:"Attempting to set frame or transform on layer with NaN values."];
  }
  else
  {
    [(CALayer *)self anchorPoint];
    double v17 = sub_100066AB8(v15, v16, x, y, width);
    double v19 = v18;
    double v20 = sub_100064070();
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    [(CALayer *)self position];
    if (v28 != v17 || v27 != v19) {
      -[CALayer setPosition:](self, "setPosition:", v17, v19);
    }
    [(CALayer *)self bounds];
    v35.origin.double x = v20;
    v35.origin.double y = v22;
    v35.size.double width = v24;
    v35.size.height = v26;
    if (!CGRectEqualToRect(v34, v35)) {
      -[CALayer setBounds:](self, "setBounds:", v20, v22, v24, v26);
    }
    [(CALayer *)self affineTransform];
    long long v29 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v29;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a4->tx;
    if (!CGAffineTransformEqualToTransform(&t1, &t2))
    {
      long long v30 = *(_OWORD *)&a4->c;
      v31[0] = *(_OWORD *)&a4->a;
      v31[1] = v30;
      v31[2] = *(_OWORD *)&a4->tx;
      [(CALayer *)self setAffineTransform:v31];
    }
  }
}

- (void)crl_setHideOverlayLayerDuringZoomOperations:(BOOL)a3
{
  if (a3) {
    id v3 = 0;
  }
  else {
    id v3 = &off_10155DE98;
  }
  [(CALayer *)self setValue:v3 forKey:@"kOptOutFromHidingOverlayLayerDuringZoom"];
}

- (BOOL)crl_hideOverlayLayerDuringZoomOperations
{
  v2 = [(CALayer *)self valueForKey:@"kOptOutFromHidingOverlayLayerDuringZoom"];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)crl_addZoomAnimationFromPoint:(CGPoint)a3
{
}

- (void)crl_addZoomAnimationFromPoint:(CGPoint)a3 startingScale:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(CALayer *)self crl_removeZoomAnimation];
  id v38 = +[NSMutableArray array];
  [(CALayer *)self position];
  if (x != v9 || y != v8)
  {
    [(CALayer *)self frame];
    double v11 = x - CGRectGetMinX(v40);
    [(CALayer *)self frame];
    double v13 = v11 / v12;
    [(CALayer *)self frame];
    double v14 = y - CGRectGetMinY(v41);
    [(CALayer *)self frame];
    double v16 = v14 / v15;
    double v17 = +[CABasicAnimation animationWithKeyPath:@"anchorPoint"];
    double v18 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, v16);
    [v17 setToValue:v18];
    [v17 setFromValue:v18];

    [v17 setDuration:0.2];
    [v38 addObject:v17];
    [(CALayer *)self anchorPoint];
    double v20 = sub_100064680(v13, v16, v19);
    double v22 = v21;
    [(CALayer *)self frame];
    double v24 = v20 * v23;
    [(CALayer *)self frame];
    double v26 = v22 * v25;
    double v27 = +[CABasicAnimation animationWithKeyPath:@"position"];
    double v28 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v26);
    [v27 setToValue:v28];
    [v27 setFromValue:v28];

    [v27 setDuration:0.2];
    [v27 setAdditive:1];
    [v38 addObject:v27];
  }
  long long v29 = +[CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
  long long v30 = +[NSNumber numberWithDouble:a4];
  [v29 setFromValue:v30];

  v31 = +[NSNumber numberWithDouble:1.0];
  [v29 setToValue:v31];

  v32 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  [v29 setTimingFunction:v32];

  [v29 setDuration:0.2];
  [v38 addObject:v29];
  v33 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  CGRect v34 = +[NSNumber numberWithDouble:0.0];
  [v33 setFromValue:v34];

  CGRect v35 = +[NSNumber numberWithDouble:1.0];
  [v33 setToValue:v35];

  v36 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  [v33 setTimingFunction:v36];

  [v33 setDuration:0.2];
  [v38 addObject:v33];
  id v37 = objc_alloc_init((Class)CAAnimationGroup);
  [v37 setAnimations:v38];
  [v37 setDuration:0.2];
  [(CALayer *)self addAnimation:v37 forKey:@"CRLZoomAnimationKey"];
}

- (void)crl_removeZoomAnimation
{
}

- (void)crl_addSpringScaleInAnimationWithDelay:(double)a3
{
  [(CALayer *)self crl_removeSpringScaleInAnimation];
  LODWORD(v5) = 1051260355;
  LODWORD(v6) = 1062501089;
  LODWORD(v7) = 1062501089;
  double v8 = +[CAMediaTimingFunction functionWithControlPoints:v5 :0.0 :v6 :v7];
  double v9 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  int v10 = +[NSNumber numberWithDouble:0.0];
  [v9 setFromValue:v10];

  [v9 setBeginTime:a3];
  [v9 setDuration:0.2];
  [v9 setTimingFunction:v8];
  [v9 setFillMode:kCAFillModeBoth];
  double v11 = +[CASpringAnimation animationWithKeyPath:@"transform.scale.xy"];
  [v11 setFromValue:&off_10155E0A8];
  [v11 setToValue:&off_10155E0B8];
  [v11 setMass:1.0];
  [v11 setStiffness:200.0];
  [v11 setDamping:35.0];
  [v11 setInitialVelocity:0.0];
  [v11 settlingDuration];
  [v11 setDuration:];
  [v11 setBeginTime:a3];
  [v11 settlingDuration];
  double v13 = v12;
  [v9 duration];
  if (v13 >= v14) {
    double v14 = v13;
  }
  double v15 = v14 + a3;
  id v16 = objc_alloc_init((Class)CAAnimationGroup);
  v18[0] = v9;
  v18[1] = v11;
  double v17 = +[NSArray arrayWithObjects:v18 count:2];
  [v16 setAnimations:v17];

  [v16 setDuration:v15];
  [v16 setFillMode:kCAFillModeBoth];
  [(CALayer *)self addAnimation:v16 forKey:@"CRLSpringScaleInAnimationKey"];
}

- (void)crl_removeSpringScaleInAnimation
{
}

- (CGRect)crl_frameIncludingSublayers
{
  [(CALayer *)self frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (![(CALayer *)self masksToBounds])
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    double v11 = [(CALayer *)self sublayers];
    id v12 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v48;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v47 + 1) + 8 * i) crl_frameIncludingSublayers];
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          double v24 = [(CALayer *)self superlayer];

          if (v24)
          {
            double v25 = [(CALayer *)self superlayer];
            [v25 convertRect:self fromLayer:v17, v19, v21, v23];
            CGFloat x = v26;
            CGFloat y = v28;
            CGFloat width = v30;
            CGFloat height = v32;
          }
          else
          {
            [(CALayer *)self frame];
            double v46 = v4;
            double v34 = v6;
            double v35 = v8;
            double v36 = v10;
            double v38 = v37;
            [(CALayer *)self frame];
            CGFloat v40 = v39;
            v52.origin.CGFloat x = v17;
            v52.origin.CGFloat y = v19;
            v52.size.CGFloat width = v21;
            v52.size.CGFloat height = v23;
            CGFloat v41 = v38;
            CGFloat v10 = v36;
            CGFloat v8 = v35;
            CGFloat v6 = v34;
            CGFloat v4 = v46;
            CGRect v53 = CGRectOffset(v52, v41, v40);
            CGFloat x = v53.origin.x;
            CGFloat y = v53.origin.y;
            CGFloat width = v53.size.width;
            CGFloat height = v53.size.height;
          }
          v54.origin.CGFloat x = v4;
          v54.origin.CGFloat y = v6;
          v54.size.CGFloat width = v8;
          v54.size.CGFloat height = v10;
          v57.origin.CGFloat x = x;
          v57.origin.CGFloat y = y;
          v57.size.CGFloat width = width;
          v57.size.CGFloat height = height;
          CGRect v55 = CGRectUnion(v54, v57);
          CGFloat v4 = v55.origin.x;
          CGFloat v6 = v55.origin.y;
          CGFloat v8 = v55.size.width;
          CGFloat v10 = v55.size.height;
        }
        id v13 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v13);
    }
  }
  double v42 = v4;
  double v43 = v6;
  double v44 = v8;
  double v45 = v10;
  result.size.CGFloat height = v45;
  result.size.CGFloat width = v44;
  result.origin.CGFloat y = v43;
  result.origin.CGFloat x = v42;
  return result;
}

- (CGImage)crl_newRasterizedImageRef
{
  [(CALayer *)self crl_frameIncludingSublayers];

  return -[CALayer crl_newRasterizedImageRefForLayerRect:](self, "crl_newRasterizedImageRefForLayerRect:");
}

- (CGImage)crl_newRasterizedImageRefForLayerRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  [(CALayer *)v7 frame];
  v108.origin.CGFloat x = v8;
  v108.origin.CGFloat y = v9;
  v108.size.CGFloat width = v10;
  v108.size.CGFloat height = v11;
  v93.origin.CGFloat x = x;
  v93.origin.CGFloat y = y;
  v93.size.CGFloat width = width;
  v93.size.CGFloat height = height;
  id v12 = v7;
  if (CGRectEqualToRect(v93, v108))
  {
    id v13 = [(CALayer *)v7 sublayers];
    id v14 = [v13 count];

    id v12 = v7;
    if ((unint64_t)v14 <= 1)
    {
      double v15 = v7;
      while (1)
      {
        [(CALayer *)v15 borderWidth];
        if (v16 != 0.0) {
          goto LABEL_20;
        }
        double v17 = [(CALayer *)v15 mask];
        if (v17) {
          break;
        }
        [(CALayer *)v15 opacity];
        if (v18 != 1.0) {
          break;
        }
        [(CALayer *)v15 cornerRadius];
        if (v19 != 0.0) {
          break;
        }
        [(CALayer *)v15 shadowOpacity];
        if (v20 != 0.0 || [(CALayer *)v15 backgroundColor]) {
          break;
        }
        if (v15) {
          [(CALayer *)v15 transform];
        }
        else {
          memset(&v91, 0, sizeof(v91));
        }
        if (!CATransform3DIsIdentity(&v91)) {
          break;
        }
        [(CALayer *)v15 contentsRect];
        v109.origin.CGFloat x = 0.0;
        v109.origin.CGFloat y = 0.0;
        v109.size.CGFloat width = 1.0;
        v109.size.CGFloat height = 1.0;
        if (!CGRectEqualToRect(v94, v109)) {
          goto LABEL_20;
        }
        double v21 = [(CALayer *)v15 sublayers];
        id v22 = [v21 count];

        if (v22 != (id)1)
        {
          v82 = [(CALayer *)v15 contents];

          if (v82)
          {
            Image = [(CALayer *)v15 contents];

            CGImageRetain((CGImageRef)Image);
            id v12 = v15;
            goto LABEL_41;
          }
LABEL_20:
          id v12 = v15;
          goto LABEL_21;
        }
        [(CALayer *)v15 bounds];
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        v31 = [(CALayer *)v15 sublayers];
        double v32 = [v31 lastObject];
        [v32 bounds];
        v110.origin.CGFloat x = v33;
        v110.origin.CGFloat y = v34;
        v110.size.CGFloat width = v35;
        v110.size.CGFloat height = v36;
        v95.origin.CGFloat x = v24;
        v95.origin.CGFloat y = v26;
        v95.size.CGFloat width = v28;
        v95.size.CGFloat height = v30;
        BOOL v37 = CGRectEqualToRect(v95, v110);

        if (!v37) {
          goto LABEL_20;
        }
        double v38 = [(CALayer *)v15 sublayers];
        id v12 = [v38 lastObject];

        double v39 = [(CALayer *)v12 sublayers];
        id v40 = [v39 count];

        double v15 = v12;
        if ((unint64_t)v40 >= 2) {
          goto LABEL_21;
        }
      }

      goto LABEL_20;
    }
  }
LABEL_21:
  [(CALayer *)v7 crl_frameIncludingSublayers];
  CGFloat v41 = v96.origin.x;
  CGFloat v42 = v96.origin.y;
  CGFloat v43 = v96.size.width;
  CGFloat v44 = v96.size.height;
  CGRect v97 = CGRectInset(v96, -1.0, -1.0);
  v111.origin.CGFloat x = x;
  v111.origin.CGFloat y = y;
  v111.size.CGFloat width = width;
  v111.size.CGFloat height = height;
  if (!CGRectContainsRect(v97, v111))
  {
    unsigned int v45 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD848);
    }
    double v46 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      v79 = v46;
      v106.origin.CGFloat x = x;
      v106.origin.CGFloat y = y;
      v106.size.CGFloat width = width;
      v106.size.CGFloat height = height;
      v80 = NSStringFromCGRect(v106);
      v107.origin.CGFloat x = v41;
      v107.origin.CGFloat y = v42;
      v107.size.CGFloat width = v43;
      v107.size.CGFloat height = v44;
      v81 = NSStringFromCGRect(v107);
      *(_DWORD *)v92 = 67110402;
      *(_DWORD *)&v92[4] = v45;
      *(_WORD *)&v92[8] = 2082;
      *(void *)&v92[10] = "-[CALayer(CRLAdditions) crl_newRasterizedImageRefForLayerRect:]";
      *(_WORD *)&v92[18] = 2082;
      *(void *)&v92[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CALayer_CRLAdditions.m";
      *(_WORD *)&v92[28] = 1024;
      *(_DWORD *)&v92[30] = 243;
      *(_WORD *)&v92[34] = 2114;
      *(void *)&v92[36] = v80;
      *(_WORD *)&v92[44] = 2114;
      *(void *)&v92[46] = v81;
      _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Specified rect %{public}@ exceeds layer's frame including sublayers %{public}@", v92, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD868);
    }
    long long v47 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v47);
    }
    long long v48 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CALayer(CRLAdditions) crl_newRasterizedImageRefForLayerRect:]");
    long long v49 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CALayer_CRLAdditions.m"];
    v98.origin.CGFloat x = x;
    v98.origin.CGFloat y = y;
    v98.size.CGFloat width = width;
    v98.size.CGFloat height = height;
    long long v50 = NSStringFromCGRect(v98);
    v99.origin.CGFloat x = v41;
    v99.origin.CGFloat y = v42;
    v99.size.CGFloat width = v43;
    v99.size.CGFloat height = v44;
    v51 = NSStringFromCGRect(v99);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v48, v49, 243, 0, "Specified rect %{public}@ exceeds layer's frame including sublayers %{public}@", v50, v51);
  }
  v100.origin.CGFloat x = v41;
  v100.origin.CGFloat y = v42;
  v100.size.CGFloat width = v43;
  v100.size.CGFloat height = v44;
  v112.origin.CGFloat x = x;
  v112.origin.CGFloat y = y;
  v112.size.CGFloat width = width;
  v112.size.CGFloat height = height;
  CGRect v101 = CGRectIntersection(v100, v112);
  double v52 = v101.origin.x;
  double v53 = v101.origin.y;
  double v54 = v101.size.width;
  double v55 = v101.size.height;
  [(CALayer *)v7 frame];
  double MinX = CGRectGetMinX(v102);
  v103.origin.CGFloat x = v52;
  v103.origin.CGFloat y = v53;
  v103.size.CGFloat width = v54;
  v103.size.CGFloat height = v55;
  double v83 = CGRectGetMinX(v103);
  [(CALayer *)v7 frame];
  double MinY = CGRectGetMinY(v104);
  v105.origin.CGFloat x = v52;
  v105.origin.CGFloat y = v53;
  v105.size.CGFloat width = v54;
  v105.size.CGFloat height = v55;
  double v57 = CGRectGetMinY(v105);
  [(CALayer *)v7 contentsScale];
  double v59 = v58;
  double v60 = sub_1000646A4(v54, v55, v58);
  double v62 = v61;
  double v63 = (double)sub_1004549A8();
  if (v62 * v60 > v63)
  {
    double v64 = sub_10006727C(v60, v62, v63);
    double v60 = sub_10006538C(v64);
    double v62 = v65;
    double v59 = v60 / v54;
  }
  v66 = sub_100455AA8(11, v60, v62);
  if (v66)
  {
    v67 = v66;
    CGAffineTransformMakeScale(&transform, v59, v59);
    CGContextConcatCTM(v67, &transform);
    if (v12) {
      [(CALayer *)v12 transform];
    }
    else {
      memset(&v89, 0, sizeof(v89));
    }
    if (!CATransform3DIsIdentity(&v89))
    {
      long long v69 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)v92 = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v92[16] = v69;
      *(_OWORD *)&v92[32] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      *(_OWORD *)&v88.a = *(_OWORD *)v92;
      *(_OWORD *)&v88.c = v69;
      *(_OWORD *)&v88.tCGFloat x = *(_OWORD *)&v92[32];
      CGAffineTransformTranslate((CGAffineTransform *)v92, &v88, -v52, -v53);
      [(CALayer *)v7 anchorPoint];
      double v71 = v70;
      double v73 = v72;
      [(CALayer *)v7 bounds];
      double v75 = sub_1000652F0(v71, v73, v74);
      double v77 = v76;
      CGAffineTransform t2 = *(CGAffineTransform *)v92;
      CGAffineTransformTranslate(&v88, &t2, v75, v76);
      *(CGAffineTransform *)v92 = v88;
      [(CALayer *)v7 affineTransform];
      CGAffineTransform t2 = *(CGAffineTransform *)v92;
      CGAffineTransformConcat(&v88, &t1, &t2);
      *(CGAffineTransform *)v92 = v88;
      CGAffineTransform t2 = v88;
      CGAffineTransformTranslate(&v88, &t2, -v75, -v77);
      *(CGAffineTransform *)v92 = v88;
      CGContextConcatCTM(v67, &v88);
    }
    CGAffineTransformMakeTranslation(&v85, MinX - v83, MinY - v57);
    CGContextConcatCTM(v67, &v85);
    [(CALayer *)v7 renderInContext:v67];
    Image = CGBitmapContextCreateImage(v67);
    CGContextRelease(v67);
  }
  else
  {
    Image = 0;
  }
LABEL_41:

  return (CGImage *)Image;
}

@end