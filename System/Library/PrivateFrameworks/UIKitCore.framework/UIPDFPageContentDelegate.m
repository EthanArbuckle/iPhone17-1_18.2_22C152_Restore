@interface UIPDFPageContentDelegate
- (BOOL)isCancelled;
- (BOOL)pageHasSelection;
- (CALayer)owner;
- (CGAffineTransform)transform;
- (CGColor)highlightColor;
- (CGRect)box;
- (UIPDFDocument)document;
- (UIPDFPageContentDelegate)init;
- (UIPDFPageView)view;
- (unint64_t)pageIndex;
- (unint64_t)pageRotation;
- (void)addRect:(CGRect)a3 toPath:(CGPath *)a4 transform:(CGAffineTransform *)a5 view:(id)a6 owner:(id)a7;
- (void)computeTransform;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)drawSelectionLayer:(id)a3 inContext:(CGContext *)a4;
- (void)drawSelectionLayerBlockMode:(id)a3 inContext:(CGContext *)a4;
- (void)setBox:(CGRect)a3;
- (void)setDocument:(id)a3;
- (void)setHighlightColor:(CGColor *)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setPageRotation:(unint64_t)a3;
- (void)setView:(id)a3;
@end

@implementation UIPDFPageContentDelegate

- (UIPDFPageContentDelegate)init
{
  v7.receiver = self;
  v7.super_class = (Class)UIPDFPageContentDelegate;
  result = [(UIPDFPageContentDelegate *)&v7 init];
  if (result)
  {
    result->_document = 0;
    result->_pageIndex = 0;
    result->_view = 0;
    CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    result->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    result->_bounds.size = v4;
    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_transform.c = v6;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v5 + 32);
    result->_white = 0;
    result->_highlightColor = 0;
    result->_owner = 0;
    result->_box.origin = v3;
    result->_box.size = v4;
    result->_pageRotation = 0;
    result->_lock._os_unfair_lock_opaque = 0;
    result->_threadCount = 0;
    result->_isCancelled = 0;
  }
  return result;
}

- (void)dealloc
{
  CGColorRelease(self->_white);
  [(UIPDFPageContentDelegate *)self setDocument:0];
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageContentDelegate;
  [(UIPDFPageContentDelegate *)&v3 dealloc];
}

- (void)computeTransform
{
  unint64_t pageRotation = self->_pageRotation;
  [(CALayer *)self->_owner bounds];
  CGPDFComputeTransform((uint64_t)v9, pageRotation, self->_box.origin.x, self->_box.origin.y, self->_box.size.width, self->_box.size.height, v4, v5, v6, v7);
  long long v8 = v9[1];
  *(_OWORD *)&self->_transform.a = v9[0];
  *(_OWORD *)&self->_transform.c = v8;
  *(_OWORD *)&self->_transform.tx = v9[2];
}

- (UIPDFPageView)view
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CGFloat v4 = self->_view;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setView:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_view = (UIPDFPageView *)a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCancelled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isCancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsCancelled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isCancelled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (!self->_view) {
    return;
  }
  if ([(UIPDFPageContentDelegate *)self isCancelled]) {
    return;
  }
  id v6 = [[(UIPDFPageView *)self->_view page] copyPage];
  if (!v6) {
    return;
  }
  CGFloat v7 = v6;
  os_unfair_lock_lock(&self->_lock);
  unint64_t threadCount = self->_threadCount;
  if (threadCount)
  {
    BOOL v9 = !self->_isCancelled;
  }
  else
  {
    self->_isCancelled = 0;
    BOOL v9 = 1;
  }
  self->_unint64_t threadCount = threadCount + 1;
  os_unfair_lock_unlock(&self->_lock);
  [(CALayer *)[(UIPDFPageContentDelegate *)self owner] bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  memset(&v24[1], 0, sizeof(CGAffineTransform));
  [(UIPDFPageContentDelegate *)self transform];
  CGContextSaveGState(a4);
  if (v9)
  {
    CGContextSetFillColorWithColor(a4, [+[UIColor whiteColor] CGColor]);
    v25.origin.x = v11;
    v25.origin.y = v13;
    v25.size.width = v15;
    v25.size.height = v17;
    CGContextFillRect(a4, v25);
    v26.origin.x = v11;
    v26.origin.y = v13;
    v26.size.width = v15;
    v26.size.height = v17;
    CGContextClipToRect(a4, v26);
    v24[0] = v24[1];
    CGContextConcatCTM(a4, v24);
    CGContextSetInterpolationQuality(a4, kCGInterpolationMedium);
    [v7 CGPage];
    CGContextDrawPDFPageWithProgressCallback();
  }
  else
  {
    v27.origin.x = v11;
    v27.origin.y = v13;
    v27.size.width = v15;
    v27.size.height = v17;
    CGContextClipToRect(a4, v27);
    v24[0] = v24[1];
    CGContextConcatCTM(a4, v24);
    CGContextSetInterpolationQuality(a4, kCGInterpolationMedium);
  }
  os_unfair_lock_lock(&self->_lock);
  unint64_t v18 = self->_threadCount;
  if (!v18)
  {
    if (self->_isCancelled)
    {
LABEL_15:
      self->_isCancelled = 0;
      goto LABEL_16;
    }
LABEL_17:
    char v20 = 0;
    goto LABEL_18;
  }
  unint64_t v19 = v18 - 1;
  self->_unint64_t threadCount = v19;
  if (!self->_isCancelled) {
    goto LABEL_17;
  }
  if (!v19) {
    goto LABEL_15;
  }
LABEL_16:
  char v20 = 1;
LABEL_18:
  os_unfair_lock_unlock(&self->_lock);

  v21 = [(UIPDFPageContentDelegate *)self view];
  if ([(UIPDFPageView *)v21 showAnnotations]) {
    LOBYTE(v22) = 0;
  }
  else {
    int v22 = ![(UIPDFPageView *)v21 allowHighlighting];
  }
  if (v21) {
    char v23 = v20;
  }
  else {
    char v23 = 1;
  }
  if ((v23 & 1) == 0 && (v22 & 1) == 0) {
    [(UIPDFPageView *)v21 drawAnnotations:a4];
  }

  CGContextRestoreGState(a4);
}

- (void)drawSelectionLayerBlockMode:(id)a3 inContext:(CGContext *)a4
{
  id v6 = [(UIPDFPageContentDelegate *)self view];
  if (v6)
  {
    CGFloat v7 = v6;
    long long v8 = [(UIPDFPageView *)v6 page];
    if (v8)
    {
      uint64_t v9 = [(UIPDFPage *)v8 selection];
      if (v9)
      {
        double v10 = (void *)v9;
        CGFloat v11 = [(UIPDFPageContentDelegate *)self owner];
        if (v11)
        {
          double v12 = v11;
          [v10 bounds];
          -[UIPDFPageView convertRectFromPDFPageSpace:](v7, "convertRectFromPDFPageSpace:");
          -[CALayer convertRect:fromLayer:](v12, "convertRect:fromLayer:", [(UIView *)v7 layer], v13, v14, v15, v16);
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGRect v25 = [(UIPDFPageContentDelegate *)self highlightColor];
          CGContextSaveGState(a4);
          CGContextSetFillColorWithColor(a4, v25);
          v27.origin.x = v18;
          v27.origin.y = v20;
          v27.size.width = v22;
          v27.size.height = v24;
          CGContextFillRect(a4, v27);
          CGContextRestoreGState(a4);
        }
      }
    }
  }
}

- (void)addRect:(CGRect)a3 toPath:(CGPath *)a4 transform:(CGAffineTransform *)a5 view:(id)a6 owner:(id)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v42);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v44);
  objc_msgSend(a6, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a5->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a5->a, MinX), vmulq_n_f64(*(float64x2_t *)&a5->c, MinY))));
  objc_msgSend(a7, "convertPoint:fromLayer:", objc_msgSend(a6, "layer"), v15, v16);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  objc_msgSend(a6, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a5->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a5->a, MaxX), vmulq_n_f64(*(float64x2_t *)&a5->c, MinY))));
  objc_msgSend(a7, "convertPoint:fromLayer:", objc_msgSend(a6, "layer"), v21, v22);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  objc_msgSend(a6, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a5->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a5->a, MaxX), vmulq_n_f64(*(float64x2_t *)&a5->c, MaxY))));
  objc_msgSend(a7, "convertPoint:fromLayer:", objc_msgSend(a6, "layer"), v27, v28);
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  objc_msgSend(a6, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a5->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a5->a, MinX), vmulq_n_f64(*(float64x2_t *)&a5->c, MaxY))));
  objc_msgSend(a7, "convertPoint:fromLayer:", objc_msgSend(a6, "layer"), v33, v34);
  CPSetCGPathPoints4(a4, v18, v20, v24, v26, v30, v32, v35, v36);
  CGPathCloseSubpath(a4);
}

- (BOOL)pageHasSelection
{
  v2 = [(UIPDFPageView *)[(UIPDFPageContentDelegate *)self view] page];
  if (v2) {
    LOBYTE(v2) = [(UIPDFPage *)v2 selection] != 0;
  }
  return (char)v2;
}

- (void)drawSelectionLayer:(id)a3 inContext:(CGContext *)a4
{
  CGFloat v7 = [(UIPDFPageContentDelegate *)self view];
  if (v7)
  {
    long long v8 = v7;
    uint64_t v9 = [(UIPDFPageView *)v7 selectionController];
    if (v9)
    {
      double v10 = v9;
      if ([(UIPDFSelectionController *)v9 rangeMode]
        || [(UIPDFSelectionController *)v10 instantHighlightMode])
      {
        CGFloat v11 = [(UIPDFPageView *)v8 page];
        if (v11)
        {
          double v12 = [(UIPDFPage *)v11 selection];
          if (v12)
          {
            if ([(UIPDFSelection *)v12 CGSelection])
            {
              double v13 = [(UIPDFPageContentDelegate *)self owner];
              if (v13)
              {
                double v14 = v13;
                double v15 = v8;
                CGPDFSelectionRetain();
                double v16 = [(UIPDFPageContentDelegate *)self highlightColor];
                uint64_t NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
                if (NumberOfRectsAndTransforms)
                {
                  uint64_t v18 = NumberOfRectsAndTransforms;
                  for (uint64_t i = 0; i != v18; ++i)
                  {
                    long long v22 = 0u;
                    long long v23 = 0u;
                    memset(v21, 0, sizeof(v21));
                    CGPDFSelectionGetRectAndTransform();
                    Mutable = CGPathCreateMutable();
                    -[UIPDFPageContentDelegate addRect:toPath:transform:view:owner:](self, "addRect:toPath:transform:view:owner:", Mutable, v21, v8, v14, v22, v23);
                    CGContextSaveGState(a4);
                    CGContextSetFillColorWithColor(a4, v16);
                    CGContextAddPath(a4, Mutable);
                    CGContextFillPath(a4);
                    CGContextRestoreGState(a4);
                    CGPathRelease(Mutable);
                  }
                }
                CGPDFSelectionRelease();
              }
            }
          }
        }
      }
      else
      {
        [(UIPDFPageContentDelegate *)self drawSelectionLayerBlockMode:a3 inContext:a4];
      }
    }
  }
}

- (CALayer)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  self->_owner = (CALayer *)a3;
}

- (CGRect)box
{
  objc_copyStruct(v6, &self->_box, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setBox:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_box, &v3, 32, 1, 0);
}

- (unint64_t)pageRotation
{
  return self->_pageRotation;
}

- (void)setPageRotation:(unint64_t)a3
{
  self->_unint64_t pageRotation = a3;
}

- (CGColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(CGColor *)a3
{
  self->_highlightColor = a3;
}

- (UIPDFDocument)document
{
  return (UIPDFDocument *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDocument:(id)a3
{
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndeCGFloat x = a3;
}

- (CGAffineTransform)transform
{
  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

@end