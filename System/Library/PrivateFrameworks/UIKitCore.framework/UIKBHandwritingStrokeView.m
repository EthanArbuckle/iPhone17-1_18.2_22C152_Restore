@interface UIKBHandwritingStrokeView
- ($89C9DF7554150EC42DA90319EED2ADED)viewPointFromDataPoint:(SEL)a3;
- (BOOL)_wantsDeepDrawing;
- (CGContext)bitmapContext;
- (CGRect)aggregateInvalidRect;
- (CGRect)convertRectToBitmapCoordinates:(CGRect)a3;
- (CGRect)convertRectToViewCoordinates:(CGRect)a3;
- (CGRect)handwritingPointToRect:(id *)a3;
- (UIKBHandwritingView)keyView;
- (double)scaleFactor;
- (void)addHandwritingPoint:(id *)a3;
- (void)addTrapezoidFromFirstPoint:(id *)a3 secondPoint:(id *)a4;
- (void)clearRect:(CGRect)a3;
- (void)createBitmapIfNeeded;
- (void)dealloc;
- (void)displayAggregateInvalidRect;
- (void)drawRect:(CGRect)a3;
- (void)redrawStrokesInRect:(CGRect)a3;
- (void)setKeyView:(id)a3;
- (void)updateInkColor;
@end

@implementation UIKBHandwritingStrokeView

- (void)dealloc
{
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    CFRelease(bitmapContext);
    self->_bitmapContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingStrokeView;
  [(UIView *)&v4 dealloc];
}

- (BOOL)_wantsDeepDrawing
{
  return 0;
}

- (CGRect)handwritingPointToRect:(id *)a3
{
  double v6 = fmax(v5 * 1.10000002, 1.20000005);
  double v7 = v6 + -0.200000003;
  BOOL v8 = v6 < 2.5999999;
  double v9 = 2.3999999;
  if (v8) {
    double v9 = v7;
  }
  double v10 = v3 - v9;
  double v11 = v4 - v9;
  double v12 = v9 + v9;
  double v13 = v12;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)createBitmapIfNeeded
{
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    size_t Height = CGBitmapContextGetHeight(bitmapContext);
    double v5 = +[UIScreen mainScreen];
    [v5 scale];
    double v7 = v6;
    [(UIView *)self bounds];
    double v8 = (double)Height;
    double v10 = v7 * v9;

    if (v10 - (double)Height < 1.0) {
      return;
    }
    double v12 = self->_bitmapContext;
    if (v12)
    {
      Image = CGBitmapContextCreateImage(v12);
      CFRelease(self->_bitmapContext);
      self->_bitmapContext = 0;
    }
    else
    {
      Image = 0;
    }
  }
  else
  {
    Image = 0;
    double v8 = 0.0;
  }
  double v13 = +[UIScreen mainScreen];
  [v13 scale];
  self->_double scaleFactor = v14;

  [(UIView *)self bounds];
  double v16 = v15;
  double v18 = v17;
  double scaleFactor = self->_scaleFactor;
  double v21 = scaleFactor * v20;
  CGFloat v23 = scaleFactor * v22;
  CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_aggregateInvalidRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_aggregateInvalidRect.size = v24;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  self->_bitmapContext = CGBitmapContextCreate(0, (unint64_t)v21, (unint64_t)v23, 8uLL, 0, DeviceGray, 1u);
  CFRelease(DeviceGray);
  v26 = self->_bitmapContext;
  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v21;
  v28.size.height = v23;
  CGRect v29 = CGRectOffset(v28, -v16, -v18);
  CGContextClearRect(v26, v29);
  if (Image)
  {
    v30.origin.x = v16;
    v30.origin.y = v18;
    v30.size.width = v21;
    v30.size.height = v8;
    CGContextDrawImage(self->_bitmapContext, v30, Image);
    CFRelease(Image);
  }
  [(UIKBHandwritingStrokeView *)self updateInkColor];
}

- (void)updateInkColor
{
  bitmapContext = self->_bitmapContext;
  id v3 = [(UIKBHandwritingStrokeView *)self keyView];
  CGContextSetFillColorWithColor(bitmapContext, (CGColorRef)[v3 inkColor]);
}

- (CGRect)convertRectToBitmapCoordinates:(CGRect)a3
{
  double scaleFactor = self->_scaleFactor;
  double v4 = a3.origin.x * scaleFactor;
  double v5 = a3.origin.y * scaleFactor;
  double v6 = a3.size.width * scaleFactor;
  double v7 = a3.size.height * scaleFactor;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)convertRectToViewCoordinates:(CGRect)a3
{
  double scaleFactor = self->_scaleFactor;
  double v4 = a3.origin.x / scaleFactor;
  double v5 = a3.origin.y / scaleFactor;
  double v6 = a3.size.width / scaleFactor;
  double v7 = a3.size.height / scaleFactor;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)addHandwritingPoint:(id *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  [(UIKBHandwritingStrokeView *)self createBitmapIfNeeded];
  -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:", v8, v7, v6);
  -[UIKBHandwritingStrokeView handwritingPointToRect:](self, "handwritingPointToRect:");
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  bitmapContext = self->_bitmapContext;
  -[UIKBHandwritingStrokeView convertRectToBitmapCoordinates:](self, "convertRectToBitmapCoordinates:");
  CGContextFillEllipseInRect(bitmapContext, v19);
  v20.origin.x = v11;
  v20.origin.y = v13;
  v20.size.width = v15;
  v20.size.height = v17;
  self->_aggregateInvalidRect = CGRectUnion(self->_aggregateInvalidRect, v20);
}

- (void)addTrapezoidFromFirstPoint:(id *)a3 secondPoint:(id *)a4
{
  if (v4 != v7 || v5 != v8)
  {
    double v11 = v9;
    double v12 = v8;
    double v13 = v7;
    double v14 = v6;
    double v15 = v5;
    double v16 = v4;
    [(UIKBHandwritingStrokeView *)self createBitmapIfNeeded];
    -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:", v16, v15, v14);
    float64_t v58 = v19;
    float64_t v60 = v18;
    double v21 = v20;
    -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:", v13, v12, v11);
    double v25 = fmax(v21 * 1.10000002, 1.20000005);
    double v26 = v25 + -0.200000003;
    if (v25 >= 2.5999999) {
      double v26 = 2.3999999;
    }
    float v27 = v26;
    double v28 = fmax(v24 * 1.10000002, 1.20000005);
    if (v28 >= 2.5999999) {
      double v29 = 2.3999999;
    }
    else {
      double v29 = v28 + -0.200000003;
    }
    v30.f64[0] = v60;
    v30.f64[1] = v58;
    float v31 = v29;
    *(float32x2_t *)&v30.f64[0] = vcvt_f32_f64(v30);
    v22.f64[1] = v23;
    float32x2_t v32 = vcvt_f32_f64(v22);
    float32x2_t v33 = vsub_f32(v32, *(float32x2_t *)&v30.f64[0]);
    float32x2_t v34 = vmul_f32(v33, v33);
    v34.i32[0] = vadd_f32(v34, (float32x2_t)vdup_lane_s32((int32x2_t)v34, 1)).u32[0];
    float32x2_t v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
    float32x2_t v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
    float32x2_t v37 = vmul_n_f32(v33, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
    double v38 = v37.f32[0];
    double v39 = v37.f32[0] * 6.123234e-17;
    double v40 = v37.f32[1];
    *(float *)&double v39 = v39 - v40;
    *(float *)&double v40 = v38 - v40 * 6.123234e-17;
    HIDWORD(v39) = LODWORD(v40);
    *(float *)&double v40 = self->_scaleFactor;
    float32x2_t v41 = vmul_n_f32(*(float32x2_t *)&v39, v27 + 0.2);
    float32x2_t v42 = vmul_n_f32(*(float32x2_t *)&v39, v31 + 0.2);
    float32x2_t v56 = vmul_n_f32(vadd_f32(v41, *(float32x2_t *)&v30.f64[0]), *(float *)&v40);
    float32x2_t v57 = vmul_n_f32(vadd_f32(v42, v32), *(float *)&v40);
    float32x2_t v59 = vmul_n_f32(vsub_f32(v32, v42), *(float *)&v40);
    float32x2_t v61 = vmul_n_f32(vsub_f32(*(float32x2_t *)&v30.f64[0], v41), *(float *)&v40);
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, v56.f32[0], v56.f32[1]);
    CGPathAddLineToPoint(Mutable, 0, v57.f32[0], v57.f32[1]);
    CGPathAddLineToPoint(Mutable, 0, v59.f32[0], v59.f32[1]);
    CGPathAddLineToPoint(Mutable, 0, v61.f32[0], v61.f32[1]);
    CGPathCloseSubpath(Mutable);
    BoundingBodouble x = CGPathGetBoundingBox(Mutable);
    double x = BoundingBox.origin.x;
    double y = BoundingBox.origin.y;
    double width = BoundingBox.size.width;
    double height = BoundingBox.size.height;
    CGContextAddPath(self->_bitmapContext, Mutable);
    CGPathRelease(Mutable);
    CGContextFillPath(self->_bitmapContext);
    CGFloat v48 = self->_aggregateInvalidRect.origin.x;
    CGFloat v49 = self->_aggregateInvalidRect.origin.y;
    CGFloat v50 = self->_aggregateInvalidRect.size.width;
    CGFloat v51 = self->_aggregateInvalidRect.size.height;
    -[UIKBHandwritingStrokeView convertRectToViewCoordinates:](self, "convertRectToViewCoordinates:", x, y, width, height);
    v64.origin.double x = v52;
    v64.origin.double y = v53;
    v64.size.double width = v54;
    v64.size.double height = v55;
    v63.origin.double x = v48;
    v63.origin.double y = v49;
    v63.size.double width = v50;
    v63.size.double height = v51;
    self->_aggregateInvalidRect = CGRectUnion(v63, v64);
  }
}

- (void)clearRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIKBHandwritingStrokeView *)self createBitmapIfNeeded];
  [(UIView *)self bounds];
  v20.origin.double x = v8;
  v20.origin.double y = v9;
  v20.size.double width = v10;
  v20.size.double height = v11;
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  if (CGRectEqualToRect(v14, v20))
  {
    ClipBoundingBodouble x = CGContextGetClipBoundingBox(self->_bitmapContext);
    bitmapContext = self->_bitmapContext;
    CGRect v16 = CGRectOffset(ClipBoundingBox, -ClipBoundingBox.origin.x, -ClipBoundingBox.origin.y);
    CGContextClearRect(bitmapContext, v16);
    [(UIView *)self setNeedsDisplay];
  }
  else
  {
    -[UIKBHandwritingStrokeView convertRectToBitmapCoordinates:](self, "convertRectToBitmapCoordinates:", x, y, width, height);
    CGRect v18 = CGRectIntegral(v17);
    CGContextClearRect(self->_bitmapContext, v18);
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    self->_aggregateInvalidRect = CGRectIntegral(v19);
    -[UIKBHandwritingStrokeView redrawStrokesInRect:](self, "redrawStrokesInRect:", x, y, width, height);
    [(UIKBHandwritingStrokeView *)self displayAggregateInvalidRect];
  }
}

- ($89C9DF7554150EC42DA90319EED2ADED)viewPointFromDataPoint:(SEL)a3
{
  double v4 = [(UIKBHandwritingStrokeView *)self keyView];
  [v4 pageOffset];

  return result;
}

- (void)redrawStrokesInRect:(CGRect)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  double v4 = [(UIKBHandwritingStrokeView *)self keyView];
  double v5 = [v4 interpolatedPoints];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        CGFloat v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v10 = v9;
        id v11 = 0;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v38;
          do
          {
            uint64_t v14 = 0;
            double v15 = v11;
            do
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v10);
              }
              CGRect v16 = *(void **)(*((void *)&v37 + 1) + 8 * v14);
              [v16 UIKBHandwritingPointValue];
              double v18 = v17;
              double v20 = v19;
              double v22 = v21;
              -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:");
              -[UIKBHandwritingStrokeView handwritingPointToRect:](self, "handwritingPointToRect:");
              CGFloat x = v23;
              CGFloat y = v25;
              CGFloat width = v27;
              CGFloat height = v29;
              if (v15)
              {
                [v15 UIKBHandwritingPointValue];
                -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:");
                -[UIKBHandwritingStrokeView handwritingPointToRect:](self, "handwritingPointToRect:");
                v51.origin.CGFloat x = v31;
                v51.origin.CGFloat y = v32;
                v51.size.CGFloat width = v33;
                v51.size.CGFloat height = v34;
                v48.origin.CGFloat x = x;
                v48.origin.CGFloat y = y;
                v48.size.CGFloat width = width;
                v48.size.CGFloat height = height;
                CGRect v49 = CGRectUnion(v48, v51);
                CGRect v50 = CGRectInset(v49, -0.200000003, -0.200000003);
                CGFloat x = v50.origin.x;
                CGFloat y = v50.origin.y;
                CGFloat width = v50.size.width;
                CGFloat height = v50.size.height;
              }
              v52.origin.CGFloat x = x;
              v52.origin.CGFloat y = y;
              v52.size.CGFloat width = width;
              v52.size.CGFloat height = height;
              if (CGRectIntersectsRect(a3, v52))
              {
                if (v15)
                {
                  [v15 UIKBHandwritingPointValue];
                  -[UIKBHandwritingStrokeView addTrapezoidFromFirstPoint:secondPoint:](self, "addTrapezoidFromFirstPoint:secondPoint:");
                }
                -[UIKBHandwritingStrokeView addHandwritingPoint:](self, "addHandwritingPoint:", v18, v20, v22);
              }
              id v11 = v16;

              ++v14;
              double v15 = v11;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v12);
        }
      }
      double v5 = obj;
      uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v6);
  }
}

- (void)displayAggregateInvalidRect
{
  p_aggregateInvalidRect = &self->_aggregateInvalidRect;
  CGRect v5 = CGRectIntegral(self->_aggregateInvalidRect);
  -[UIView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  p_aggregateInvalidRect->origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  p_aggregateInvalidRect->size = v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  CGFloat v8 = [(UIKBHandwritingStrokeView *)self keyView];

  if (v8)
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      id v10 = 0;
    }
    else {
      id v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSaveGState(v10);
    id v11 = [(UIKBHandwritingStrokeView *)self keyView];
    uint64_t v12 = [v11 inkColor];

    if (v12)
    {
      uint64_t v13 = [(UIKBHandwritingStrokeView *)self keyView];
      [v13 recreateInkMaskIfNeeded];

      [(UIView *)self bounds];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      double v22 = [(UIKBHandwritingStrokeView *)self keyView];
      double v23 = (CGImage *)[v22 inkMask];
      v63.origin.double x = v15;
      v63.origin.CGFloat y = v17;
      v63.size.CGFloat width = v19;
      v63.size.CGFloat height = v21;
      CGContextClipToMask(v10, v63, v23);
    }
    double v24 = [(UIKBHandwritingStrokeView *)self keyView];
    double v25 = [v24 bezierPathFIFO];

    if (v25)
    {
      double v26 = [(UIKBHandwritingStrokeView *)self keyView];
      [v26 pageOffset];
      double v28 = x + v27;

      uint64_t v60 = 0;
      info[0] = v10;
      *(double *)&info[1] = v28;
      *(CGFloat *)&info[2] = y;
      *(CGFloat *)&info[3] = width;
      *(CGFloat *)&info[4] = height;
      info[5] = 0;
      info[6] = 0;
      double v29 = [(UIKBHandwritingStrokeView *)self keyView];
      [v29 inkWidth];
      info[7] = v30;

      CGFloat v31 = [(UIKBHandwritingStrokeView *)self keyView];
      [v31 pageOffset];
      CGContextTranslateCTM(v10, -v32, 0.0);

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      CGFloat v33 = [(UIKBHandwritingStrokeView *)self keyView];
      CGFloat v34 = [v33 interpolatedPoints];

      uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v61 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v56 != v36) {
              objc_enumerationMutation(v34);
            }
            long long v38 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            LOBYTE(v60) = 0;
            CGPathApply((CGPathRef)[v38 CGPath], info, (CGPathApplierFunction)clipHandwritingPath);
          }
          uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v61 count:16];
        }
        while (v35);
      }

      LOBYTE(v60) = 0;
      long long v39 = [(UIKBHandwritingStrokeView *)self keyView];
      long long v40 = [v39 currentPath];
      BOOL v41 = v40 == 0;

      if (!v41)
      {
        long long v42 = [(UIKBHandwritingStrokeView *)self keyView];
        id v43 = [v42 currentPath];
        CGPathApply((CGPathRef)[v43 CGPath], info, (CGPathApplierFunction)clipHandwritingPath);
      }
      long long v44 = [(UIKBHandwritingStrokeView *)self keyView];
      [v44 inkWidth];
      CGContextSetLineWidth(v10, v45);

      CGContextSetLineCap(v10, kCGLineCapRound);
      CGContextSetLineJoin(v10, kCGLineJoinRound);
      v46 = [(UIKBHandwritingStrokeView *)self keyView];
      CGContextSetStrokeColorWithColor(v10, (CGColorRef)[v46 inkColor]);

      CGContextStrokePath(v10);
    }
    else
    {
      bitmapContext = self->_bitmapContext;
      if (bitmapContext)
      {
        Image = CGBitmapContextCreateImage(bitmapContext);
        size_t v49 = CGBitmapContextGetWidth(self->_bitmapContext);
        size_t v50 = CGBitmapContextGetHeight(self->_bitmapContext);
        [(UIView *)self bounds];
        if (v50 && v49) {
          double v54 = v53 * (double)v50 / (double)v49;
        }
        CGContextDrawImage(v10, *(CGRect *)&v51, Image);
        CFRelease(Image);
      }
    }
    CGContextRestoreGState(v10);
  }
}

- (UIKBHandwritingView)keyView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyView);
  return (UIKBHandwritingView *)WeakRetained;
}

- (void)setKeyView:(id)a3
{
}

- (CGContext)bitmapContext
{
  return self->_bitmapContext;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (CGRect)aggregateInvalidRect
{
  double x = self->_aggregateInvalidRect.origin.x;
  double y = self->_aggregateInvalidRect.origin.y;
  double width = self->_aggregateInvalidRect.size.width;
  double height = self->_aggregateInvalidRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end