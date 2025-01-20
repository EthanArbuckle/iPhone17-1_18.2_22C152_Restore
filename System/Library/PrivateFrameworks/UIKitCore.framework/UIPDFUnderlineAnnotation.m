@interface UIPDFUnderlineAnnotation
- (BOOL)recognizeGestures;
- (Class)viewClass;
- (int)annotationType;
- (void)drawInContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)drawLayerRotated:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6;
- (void)drawLayerUpright:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6;
@end

@implementation UIPDFUnderlineAnnotation

- (int)annotationType
{
  return 8;
}

- (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)drawLayerUpright:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6
{
  annotationController = self->super.super._annotationController;
  color = self->super.super._color;
  CGContextSaveGState(a4);
  CGContextSetStrokeColorWithColor(a4, color);
  CGContextSetLineWidth(a4, 1.0);
  memset(&rect, 0, sizeof(rect));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  if (a6)
  {
    uint64_t v12 = 0;
    while (1)
    {
      [a5 getBounds:&rect transform:&v30 index:v12];
      objc_msgSend(a5, "baseLineAtIndex:", v12, v30, v31, v32);
      double v14 = v13;
      if (a3) {
        break;
      }
      uint64_t v22 = -[UIPDFAnnotationController underlineImageFor:](annotationController, "underlineImageFor:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      if (!v22) {
        goto LABEL_5;
      }
      v23 = (CGImage *)v22;
      rect.origin.y = v14;
      v36.origin.x = rect.origin.x;
      v36.size.width = rect.size.width;
      v36.size.height = rect.size.height;
      v36.origin.y = v14;
      CGRect rect = CGRectIntegral(v36);
      CGFloat Height = (double)CGImageGetHeight(v23);
      CGFloat MinX = CGRectGetMinX(rect);
      CGFloat v26 = CGRectGetMinY(rect) - Height + -1.0;
      v37.size.width = CGRectGetWidth(rect);
      v37.origin.x = MinX;
      v37.origin.y = v26;
      v37.size.height = Height;
      CGContextDrawImage(a4, v37, v23);
LABEL_14:
      if (a6 == ++v12) {
        goto LABEL_15;
      }
    }
    -[UIPDFAnnotationController convertRect:toSurfaceLayer:](annotationController, "convertRect:toSurfaceLayer:", a3, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    rect.origin.x = v15;
    rect.origin.y = v16;
    rect.size.width = v17;
    rect.size.height = v18;
    -[UIPDFAnnotationController convertPoint:toSurfaceLayer:](annotationController, "convertPoint:toSurfaceLayer:", a3, 0.0, v14);
    double v14 = v19;
LABEL_5:
    if (CGRectGetHeight(rect) <= 16.0) {
      double v20 = 1.0;
    }
    else {
      double v20 = 3.0;
    }
    CGContextSetLineWidth(a4, v20);
    rect.origin.y = v14;
    v34.origin.x = rect.origin.x;
    v34.size.width = rect.size.width;
    v34.size.height = rect.size.height;
    v34.origin.y = v14;
    CGRect v35 = CGRectIntegral(v34);
    CGRect rect = v35;
    if (a3) {
      double v21 = CGRectGetMaxY(v35) + -1.0;
    }
    else {
      double v21 = CGRectGetMinY(v35) - v20;
    }
    CGContextSaveGState(a4);
    Mutable = CGPathCreateMutable();
    CGFloat v28 = CGRectGetMinX(rect);
    CGPathMoveToPoint(Mutable, 0, v28, v21);
    CGFloat MaxX = CGRectGetMaxX(rect);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v21);
    CGContextAddPath(a4, Mutable);
    CGContextStrokePath(a4);
    CGPathRelease(Mutable);
    CGContextRestoreGState(a4);
    goto LABEL_14;
  }
LABEL_15:
  CGContextRestoreGState(a4);
}

- (void)drawLayerRotated:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6
{
  annotationController = self->super.super._annotationController;
  color = self->super.super._color;
  CGContextSaveGState(a4);
  CGContextSetStrokeColorWithColor(a4, color);
  CGContextSetLineWidth(a4, 1.0);
  memset(&v28, 0, sizeof(v28));
  float64x2_t v26 = 0u;
  float64x2_t v27 = 0u;
  float64x2_t v25 = 0u;
  if (a6)
  {
    uint64_t v12 = 0;
    do
    {
      objc_msgSend(a5, "getBounds:transform:index:", &v28, &v25, v12, *(_OWORD *)v23);
      double MinX = CGRectGetMinX(v28);
      float64x2_t x = vaddq_f64(v27, vaddq_f64(vmulq_n_f64(v25, MinX + 1.0), vmulq_n_f64(v26, CGRectGetMinY(v28) + 1.0)));
      double MaxX = CGRectGetMaxX(v28);
      float64x2_t v15 = vaddq_f64(v27, vaddq_f64(vmulq_n_f64(v25, MaxX + 1.0), vmulq_n_f64(v26, CGRectGetMinY(v28) + 1.0)));
      double v16 = v15.f64[1];
      double v17 = x.f64[1];
      *(float64x2_t *)v23 = v15;
      if (a3)
      {
        -[UIPDFAnnotationController convertPoint:toSurfaceLayer:](annotationController, "convertPoint:toSurfaceLayer:", a3);
        x.f64[0] = v18;
        double v17 = v19;
        -[UIPDFAnnotationController convertPoint:toSurfaceLayer:](annotationController, "convertPoint:toSurfaceLayer:", a3, v23[0], v16);
        *(_OWORD *)v23 = v20;
        double v16 = v21;
      }
      CGContextSaveGState(a4);
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, x.f64[0], v17 + -2.0);
      CGPathAddLineToPoint(Mutable, 0, v23[0], v16 + -2.0);
      CGContextAddPath(a4, Mutable);
      CGContextStrokePath(a4);
      CGPathRelease(Mutable);
      CGContextRestoreGState(a4);
      ++v12;
    }
    while (a6 != v12);
  }
  CGContextRestoreGState(a4);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if ([(UIPDFAnnotationController *)self->super.super._annotationController tracking])
  {
    v7 = [(UIPDFAnnotation *)self selection];
    if (v7)
    {
      v8 = v7;
      uint64_t v9 = [(UIPDFSelection *)v7 numberOfRectangles];
      if (v9)
      {
        uint64_t v10 = v9;
        memset(&v11[1], 0, sizeof(CGAffineTransform));
        [(UIPDFSelection *)v8 transform];
        v11[0] = v11[1];
        if (CGAffineTransformIsIdentity(v11)) {
          [(UIPDFUnderlineAnnotation *)self drawLayerUpright:a3 inContext:a4 selection:v8 rectangles:v10];
        }
        else {
          [(UIPDFUnderlineAnnotation *)self drawLayerRotated:a3 inContext:a4 selection:v8 rectangles:v10];
        }
      }
    }
  }
}

- (void)drawInContext:(CGContext *)a3
{
  if (![(UIPDFAnnotationController *)self->super.super._annotationController tracking])
  {
    v5 = [(UIPDFAnnotation *)self selection];
    if (v5)
    {
      v6 = v5;
      uint64_t v7 = [(UIPDFSelection *)v5 numberOfRectangles];
      if (v7)
      {
        uint64_t v8 = v7;
        memset(&v9[1], 0, sizeof(CGAffineTransform));
        [(UIPDFSelection *)v6 transform];
        v9[0] = v9[1];
        if (CGAffineTransformIsIdentity(v9)) {
          [(UIPDFUnderlineAnnotation *)self drawLayerUpright:0 inContext:a3 selection:v6 rectangles:v8];
        }
        else {
          [(UIPDFUnderlineAnnotation *)self drawLayerRotated:0 inContext:a3 selection:v6 rectangles:v8];
        }
      }
    }
  }
}

- (BOOL)recognizeGestures
{
  return 1;
}

@end