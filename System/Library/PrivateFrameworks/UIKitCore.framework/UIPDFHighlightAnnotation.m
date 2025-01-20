@interface UIPDFHighlightAnnotation
- (BOOL)recognizeGestures;
- (Class)viewClass;
- (int)annotationType;
- (void)drawInContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)drawLayerRotated:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6;
- (void)drawLayerUpright:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6;
@end

@implementation UIPDFHighlightAnnotation

- (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (int)annotationType
{
  return 2;
}

- (void)drawLayerUpright:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6
{
  color = self->super.super._color;
  CopyWithAlpha = CGColorCreateCopyWithAlpha(color, 0.25);
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, color);
  memset(&v24, 0, sizeof(v24));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  if (a6)
  {
    for (uint64_t i = 0; a6 != i; ++i)
    {
      [a5 getBounds:&v24 transform:&v21 index:i];
      annotationController = self->super.super._annotationController;
      if (a3)
      {
        -[UIPDFAnnotationController convertRect:toSurfaceLayer:](annotationController, "convertRect:toSurfaceLayer:", a3, *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size);
        v24.origin.x = v15;
        v24.origin.y = v16;
        v24.size.width = v17;
        v24.size.height = v18;
      }
      else
      {
        uint64_t v19 = -[UIPDFAnnotationController newHighlightMaskImageFor:](annotationController, "newHighlightMaskImageFor:", *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size, v21, v22, v23);
        if (v19)
        {
          v20 = (CGImage *)v19;
          CGContextSaveGState(a4);
          CGContextClipToMask(a4, v24, v20);
          CGContextFillRect(a4, v24);
          CGContextRestoreGState(a4);
          CGImageRelease(v20);
          continue;
        }
      }
      CGContextSetFillColorWithColor(a4, CopyWithAlpha);
      CGContextFillRect(a4, v24);
    }
  }
  CGContextRestoreGState(a4);
  CGColorRelease(CopyWithAlpha);
}

- (void)drawLayerRotated:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6
{
  color = self->super.super._color;
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, color);
  memset(&v48, 0, sizeof(v48));
  float64x2_t v46 = 0u;
  float64x2_t v47 = 0u;
  float64x2_t v45 = 0u;
  if (a6)
  {
    uint64_t v12 = 0;
    do
    {
      objc_msgSend(a5, "getBounds:transform:index:", &v48, &v45, v12, *(_OWORD *)&v35);
      Mutable = CGPathCreateMutable();
      CGContextSaveGState(a4);
      double MinX = CGRectGetMinX(v48);
      float64x2_t v36 = vaddq_f64(v47, vaddq_f64(vmulq_n_f64(v45, MinX), vmulq_n_f64(v46, CGRectGetMinY(v48))));
      double v42 = CGRectGetMinX(v48);
      float64x2_t v43 = vaddq_f64(v47, vaddq_f64(vmulq_n_f64(v45, v42), vmulq_n_f64(v46, CGRectGetMaxY(v48))));
      double MaxX = CGRectGetMaxX(v48);
      float64x2_t v39 = vaddq_f64(v47, vaddq_f64(vmulq_n_f64(v45, MaxX), vmulq_n_f64(v46, CGRectGetMaxY(v48))));
      v14.f64[0] = CGRectGetMaxX(v48);
      float64x2_t v35 = v14;
      CGFloat y = v48.origin.y;
      v14.f64[0] = v48.origin.x;
      CGFloat height = v48.size.height;
      CGFloat width = v48.size.width;
      double MinY = CGRectGetMinY(*(CGRect *)v14.f64);
      CGFloat v20 = v39.f64[0];
      CGFloat v19 = v43.f64[0];
      float64x2_t v21 = vaddq_f64(v47, vaddq_f64(vmulq_n_f64(v45, v35.f64[0]), vmulq_n_f64(v46, MinY)));
      CGFloat v22 = v36.f64[0];
      double v23 = v21.f64[1];
      CGFloat v24 = v39.f64[1];
      CGFloat v25 = v43.f64[1];
      CGFloat v26 = v36.f64[1];
      if (a3)
      {
        float64x2_t v35 = v21;
        -[UIPDFAnnotationController convertPoint:toSurfaceLayer:](self->super.super._annotationController, "convertPoint:toSurfaceLayer:", a3);
        double v37 = v27;
        CGFloat v26 = v28;
        [(UIPDFAnnotationController *)self->super.super._annotationController convertPoint:a3 toSurfaceLayer:*(_OWORD *)&v43];
        double v44 = v29;
        CGFloat v25 = v30;
        [(UIPDFAnnotationController *)self->super.super._annotationController convertPoint:a3 toSurfaceLayer:*(_OWORD *)&v39];
        double v40 = v31;
        CGFloat v24 = v32;
        -[UIPDFAnnotationController convertPoint:toSurfaceLayer:](self->super.super._annotationController, "convertPoint:toSurfaceLayer:", a3, v35.f64[0], v23);
        CGFloat v20 = v40;
        CGFloat v19 = v44;
        v21.f64[0] = v33;
        CGFloat v22 = v37;
        double v23 = v34;
      }
      CPSetCGPathPoints4(Mutable, v22, v26, v19, v25, v20, v24, v21.f64[0], v23);
      CGPathCloseSubpath(Mutable);
      CGContextAddPath(a4, Mutable);
      CGContextFillPath(a4);
      CGContextRestoreGState(a4);
      CGPathRelease(Mutable);
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
          [(UIPDFHighlightAnnotation *)self drawLayerUpright:a3 inContext:a4 selection:v8 rectangles:v10];
        }
        else {
          [(UIPDFHighlightAnnotation *)self drawLayerRotated:a3 inContext:a4 selection:v8 rectangles:v10];
        }
      }
    }
  }
}

- (void)drawInContext:(CGContext *)a3
{
  annotationController = self->super.super._annotationController;
  if (!annotationController || ![(UIPDFAnnotationController *)annotationController tracking])
  {
    v6 = [(UIPDFAnnotation *)self selection];
    if (!v6)
    {
      id v7 = [(UIPDFAnnotation *)self archive];
      if (!v7) {
        return;
      }
      v8 = [[UIPDFSelection alloc] initWithPage:[(UIPDFAnnotation *)self page] fromArchive:v7];
      if (!v8) {
        return;
      }
      uint64_t v9 = v8;
      [(UIPDFAnnotation *)self setSelection:v8];
    }
    uint64_t v10 = [(UIPDFSelection *)v6 numberOfRectangles];
    if (v10)
    {
      uint64_t v11 = v10;
      memset(&v12[1], 0, sizeof(CGAffineTransform));
      if (v6) {
        [(UIPDFSelection *)v6 transform];
      }
      v12[0] = v12[1];
      if (CGAffineTransformIsIdentity(v12)) {
        [(UIPDFHighlightAnnotation *)self drawLayerUpright:0 inContext:a3 selection:v6 rectangles:v11];
      }
      else {
        [(UIPDFHighlightAnnotation *)self drawLayerRotated:0 inContext:a3 selection:v6 rectangles:v11];
      }
    }
  }
}

- (BOOL)recognizeGestures
{
  return 1;
}

@end