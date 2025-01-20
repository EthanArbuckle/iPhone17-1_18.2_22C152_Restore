@interface UIPDFTextRangeWidget
- (BOOL)hitTest:(CGPoint)a3 fixedPoint:(CGPoint *)a4 preceeds:(BOOL *)a5;
- (CGPoint)currentSelectionPointOnPage;
- (CGPoint)initialSelectionPointOnPage;
- (CGPoint)selectedPointFor:(CGPoint)a3;
- (CGPoint)viewOffset;
- (CGRect)selectionRectangle;
- (NSString)description;
- (UIPDFPageView)pageView;
- (UIPDFTextRangeWidget)init;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)hide;
- (void)layoutEndSelectionGrabber:(CGRect)a3 transform:(CGAffineTransform *)a4 width:(double)a5 extraHeight:(double)a6 unitSize:(CGSize)a7;
- (void)layoutStartSelectionGrabber:(CGRect)a3 transform:(CGAffineTransform *)a4 width:(double)a5 extraHeight:(double)a6 unitSize:(CGSize)a7;
- (void)layoutWidget;
- (void)remove;
- (void)setPageView:(id)a3;
- (void)setSelectedGrabber:(unint64_t)a3;
- (void)setSelection:(id)a3;
@end

@implementation UIPDFTextRangeWidget

- (UIPDFTextRangeWidget)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)UIPDFTextRangeWidget;
  v2 = [(UIPDFTextRangeWidget *)&v13 init];
  if (v2)
  {
    *(_OWORD *)components = xmmword_186B9C4B0;
    long long v15 = unk_186B9C4C0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v2->_grabberColor = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v2->_startSelectionGrabber = (CALayer *)[MEMORY[0x1E4F39BE8] layer];
    v2->_startHandle = (CALayer *)[MEMORY[0x1E4F39BE8] layer];
    v4 = (CGImage *)objc_msgSend(+[UIImage kitImageNamed:](UIImage, "kitImageNamed:", @"kb-drag-dot.png"), "CGImage");
    CGImageRetain(v4);
    float v12 = 1.0;
    BOOL v5 = CPIsRetina(&v12);
    double v6 = 14.0;
    if (v5) {
      double v6 = fmax((float)(1.0 / v12), 0.5) * 28.0;
    }
    v2->_handleHeight = v6;
    v2->_handleWidth = v6;
    -[CALayer setBounds:](v2->_startHandle, "setBounds:", 0.0, 0.0, v6, v6);
    [(CALayer *)v2->_startHandle setDelegate:v2];
    v7 = (CALayer *)[MEMORY[0x1E4F39C88] layer];
    v2->_startBar = v7;
    [(CALayer *)v7 setBackgroundColor:v2->_grabberColor];
    [(CALayer *)v2->_startSelectionGrabber addSublayer:v2->_startBar];
    [(CALayer *)v2->_startSelectionGrabber addSublayer:v2->_startHandle];
    v2->_endSelectionGrabber = (CALayer *)[MEMORY[0x1E4F39BE8] layer];
    v8 = (CALayer *)[MEMORY[0x1E4F39BE8] layer];
    v2->_endHandle = v8;
    -[CALayer setBounds:](v8, "setBounds:", 0.0, 0.0, v2->_handleWidth, v2->_handleHeight);
    [(CALayer *)v2->_endHandle setDelegate:v2];
    if (v5)
    {
      double v9 = v12;
      [(CALayer *)v2->_startHandle setContentsScale:v12];
      [(CALayer *)v2->_endHandle setContentsScale:v9];
    }
    v10 = (CALayer *)[MEMORY[0x1E4F39C88] layer];
    v2->_endBar = v10;
    [(CALayer *)v10 setBackgroundColor:v2->_grabberColor];
    [(CALayer *)v2->_endSelectionGrabber addSublayer:v2->_endBar];
    [(CALayer *)v2->_endSelectionGrabber addSublayer:v2->_endHandle];
    CGImageRelease(v4);
    v2->_fixedSelectionGrabber = 0;
  }
  return v2;
}

- (void)dealloc
{
  CGColorRelease(self->_grabberColor);
  [(UIPDFTextRangeWidget *)self remove];
  v3.receiver = self;
  v3.super_class = (Class)UIPDFTextRangeWidget;
  [(UIPDFTextRangeWidget *)&v3 dealloc];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  [a3 bounds];
  grabberColor = self->_grabberColor;
  CPCGInsetFillEllipseInRect(a4, grabberColor, v6, v7, v8, v9);
}

- (void)layoutStartSelectionGrabber:(CGRect)a3 transform:(CGAffineTransform *)a4 width:(double)a5 extraHeight:(double)a6 unitSize:(CGSize)a7
{
  double width = a7.width;
  double height = a3.size.height;
  double v12 = a3.size.width;
  double x = a3.origin.x;
  double y = a3.origin.y;
  unint64_t v14 = [[(UIPDFPageView *)self->_pageView page] rotation];
  long long v15 = *(_OWORD *)&a4->c;
  v43[0] = *(_OWORD *)&a4->a;
  v43[1] = v15;
  v43[2] = *(_OWORD *)&a4->tx;
  CPRotationDegreesFromTransform((double *)v43);
  double v17 = v16;
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", x, y, v12, height);
  -[CALayer convertRect:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertRect:fromLayer:", [(UIView *)self->_pageView layer], v18, v19, v20, v21);
  if (v14 == 180 || v14 == 0) {
    double v27 = CGRectGetHeight(*(CGRect *)&v22);
  }
  else {
    double v27 = CGRectGetWidth(*(CGRect *)&v22);
  }
  double v28 = v27;
  double v29 = v17 - (double)v14;
  [(UIPDFPageView *)self->_pageView convertPointFromPDFPageSpace:vaddq_f64(*(float64x2_t *)&a4->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a4->a, x), vmulq_n_f64(*(float64x2_t *)&a4->c, y)))];
  -[CALayer convertPoint:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:fromLayer:", [(UIView *)self->_pageView layer], v30, v31);
  double v33 = v32;
  double v35 = v34;
  -[CALayer setAnchorPoint:](self->_startSelectionGrabber, "setAnchorPoint:", 0.5, 1.0);
  -[CALayer setBounds:](self->_startSelectionGrabber, "setBounds:", 0.0, 0.0, a5, v28 + a6);
  -[CALayer setPosition:](self->_startSelectionGrabber, "setPosition:", v33, v35);
  CATransform3DMakeRotation(&v42, v29 * -0.0174532925, 0.0, 0.0, 1.0);
  startSelectionGrabber = self->_startSelectionGrabber;
  CATransform3D v41 = v42;
  [(CALayer *)startSelectionGrabber setTransform:&v41];
  [(CALayer *)self->_startSelectionGrabber bounds];
  double MidX = CGRectGetMidX(v44);
  [(CALayer *)self->_startSelectionGrabber bounds];
  -[CALayer setPosition:](self->_startHandle, "setPosition:", MidX, a6 * 0.5 + CGRectGetMinY(v45));
  -[CALayer setBounds:](self->_startBar, "setBounds:", 0.0, 0.0, width + width, v28);
  -[CALayer setAnchorPoint:](self->_startBar, "setAnchorPoint:", 0.5, 1.0);
  [(CALayer *)self->_startSelectionGrabber bounds];
  double v38 = CGRectGetMidX(v46);
  [(CALayer *)self->_startSelectionGrabber bounds];
  -[CALayer setPosition:](self->_startBar, "setPosition:", v38, CGRectGetMaxY(v47));
  [(CALayer *)self->_startHandle setNeedsDisplay];
}

- (void)layoutEndSelectionGrabber:(CGRect)a3 transform:(CGAffineTransform *)a4 width:(double)a5 extraHeight:(double)a6 unitSize:(CGSize)a7
{
  double width = a7.width;
  double height = a3.size.height;
  double v12 = a3.size.width;
  double x = a3.origin.x;
  double y = a3.origin.y;
  unint64_t v14 = [[(UIPDFPageView *)self->_pageView page] rotation];
  long long v15 = *(_OWORD *)&a4->c;
  v43[0] = *(_OWORD *)&a4->a;
  v43[1] = v15;
  v43[2] = *(_OWORD *)&a4->tx;
  CPRotationDegreesFromTransform((double *)v43);
  double v17 = v16;
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", x, y, v12, height);
  -[CALayer convertRect:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertRect:fromLayer:", [(UIView *)self->_pageView layer], v18, v19, v20, v21);
  if (v14 == 180 || v14 == 0) {
    double v27 = CGRectGetHeight(*(CGRect *)&v22);
  }
  else {
    double v27 = CGRectGetWidth(*(CGRect *)&v22);
  }
  double v28 = v27;
  double v29 = v17 - (double)v14;
  [(UIPDFPageView *)self->_pageView convertPointFromPDFPageSpace:vaddq_f64(*(float64x2_t *)&a4->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a4->a, x), vmulq_n_f64(*(float64x2_t *)&a4->c, y)))];
  -[CALayer convertPoint:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:fromLayer:", [(UIView *)self->_pageView layer], v30, v31);
  double v33 = v32;
  double v35 = v34;
  -[CALayer setAnchorPoint:](self->_endSelectionGrabber, "setAnchorPoint:", 0.5, 1.0);
  -[CALayer setBounds:](self->_endSelectionGrabber, "setBounds:", 0.0, 0.0, a5, v28 + a6);
  -[CALayer setPosition:](self->_endSelectionGrabber, "setPosition:", v33, v35);
  CATransform3DMakeRotation(&v42, v29 * -0.0174532925, 0.0, 0.0, 1.0);
  endSelectionGrabber = self->_endSelectionGrabber;
  CATransform3D v41 = v42;
  [(CALayer *)endSelectionGrabber setTransform:&v41];
  [(CALayer *)self->_endSelectionGrabber bounds];
  double MidX = CGRectGetMidX(v44);
  [(CALayer *)self->_endSelectionGrabber bounds];
  -[CALayer setPosition:](self->_endHandle, "setPosition:", MidX, a6 * 0.5 + CGRectGetMaxY(v45));
  -[CALayer setBounds:](self->_endBar, "setBounds:", 0.0, 0.0, width + width, v28);
  -[CALayer setAnchorPoint:](self->_endBar, "setAnchorPoint:", 0.5, 1.0);
  [(CALayer *)self->_endSelectionGrabber bounds];
  double v38 = CGRectGetMidX(v46);
  [(CALayer *)self->_endSelectionGrabber bounds];
  -[CALayer setPosition:](self->_endBar, "setPosition:", v38, CGRectGetMaxY(v47));
  [(CALayer *)self->_endHandle setNeedsDisplay];
}

- (void)layoutWidget
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  LODWORD(v3) = 1.0;
  [(CALayer *)self->_startSelectionGrabber setOpacity:v3];
  LODWORD(v4) = 1.0;
  [(CALayer *)self->_endSelectionGrabber setOpacity:v4];
  BOOL v5 = [[(UIPDFPageView *)self->_pageView page] selection];
  if ([(UIPDFSelection *)v5 numberOfRectangles])
  {
    CGFloat v6 = [(UIPDFPageView *)self->_pageView effectsLayer];
    -[CALayer convertRect:fromLayer:](v6, "convertRect:fromLayer:", 0, 0.0, 0.0, 1.0, 1.0);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    if ([(UIView *)self->_pageView window])
    {
      -[CALayer convertRect:toLayer:](v6, "convertRect:toLayer:", [(UIView *)self->_pageView layer], v8, v10, v12, v14);
      -[UIWindow convertRect:toWindow:]([(UIView *)self->_pageView window], "convertRect:toWindow:", 0, v15, v16, v17, v18);
      double v12 = v19;
      double v14 = v20;
    }
    memset(&v25, 0, sizeof(v25));
    CATransform3DMakeScale(&v25, v12, v14, 1.0);
    memset(v24, 0, sizeof(v24));
    CATransform3D v22 = v25;
    memset(v23, 0, sizeof(v23));
    [(CALayer *)self->_startHandle setTransform:&v22];
    CATransform3D v21 = v25;
    [(CALayer *)self->_endHandle setTransform:&v21];
    [(UIPDFSelection *)v5 getBounds:v24 transform:v23 index:self->_startRectangle];
    *(double *)v24 = self->_startX;
    -[UIPDFTextRangeWidget layoutStartSelectionGrabber:transform:width:extraHeight:unitSize:](self, "layoutStartSelectionGrabber:transform:width:extraHeight:unitSize:", v23);
    [(UIPDFSelection *)v5 getBounds:v24 transform:v23 index:self->_endRectangle];
    *(double *)v24 = self->_endX;
    -[UIPDFTextRangeWidget layoutEndSelectionGrabber:transform:width:extraHeight:unitSize:](self, "layoutEndSelectionGrabber:transform:width:extraHeight:unitSize:", v23);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)setSelectedGrabber:(unint64_t)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 24;
  }
  self->_fixedSelectionGrabber = *(CALayer **)((char *)&self->super.isa + v3);
}

- (void)setSelection:(id)a3
{
  if (a3)
  {
    if ([a3 CGSelection])
    {
      self->_startIndedouble x = [a3 startIndex];
      self->_endIndedouble x = [a3 endIndex];
      if (CGPDFSelectionGetNumberOfRectsAndTransforms())
      {
        uint64_t NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
        uint64_t v6 = NumberOfRectsAndTransforms;
        if (NumberOfRectsAndTransforms < 1)
        {
          uint64_t v11 = 0;
          if (NumberOfRectsAndTransforms) {
            int64_t v12 = 0;
          }
          else {
            int64_t v12 = -1;
          }
        }
        else
        {
          uint64_t v7 = 0;
          startIndedouble x = self->_startIndex;
          while (1)
          {
            RangeForRectIndedouble x = CGPDFSelectionGetRangeForRectIndex();
            if (RangeForRectIndex <= startIndex && startIndex <= RangeForRectIndex + v10) {
              break;
            }
            if (v6 == ++v7)
            {
              uint64_t v7 = v6;
              break;
            }
          }
          uint64_t v11 = 0;
          int64_t v12 = v7 - (v7 == v6);
          endIndedouble x = self->_endIndex;
          while (1)
          {
            uint64_t v14 = CGPDFSelectionGetRangeForRectIndex();
            if (v14 <= endIndex && endIndex <= v14 + v15) {
              break;
            }
            if (v6 == ++v11)
            {
              uint64_t v11 = v6;
              break;
            }
          }
        }
        CGPDFSelectionGetStartCursorXPosition();
        self->_startX = v16;
        CGPDFSelectionGetEndCursorXPosition();
        self->_endX = v17;
        self->_startRectangle = v12;
        self->_endRectangle = v11 - (v11 == v6);
        [(UIPDFTextRangeWidget *)self layoutWidget];
        double v18 = [(UIPDFPageView *)self->_pageView effectsLayer];
        [(CALayer *)v18 addSublayer:self->_startSelectionGrabber];
        endSelectionGrabber = self->_endSelectionGrabber;
        [(CALayer *)v18 addSublayer:endSelectionGrabber];
      }
    }
  }
}

- (void)remove
{
  self->_startSelectionGrabber = 0;
  [(CALayer *)self->_endSelectionGrabber removeFromSuperlayer];
  self->_endSelectionGrabber = 0;
}

- (CGPoint)selectedPointFor:(CGPoint)a3
{
  double v3 = a3.x + self->_offsetX;
  double v4 = a3.y + self->_offsetY;
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)hitTest:(CGPoint)a3 fixedPoint:(CGPoint *)a4 preceeds:(BOOL *)a5
{
  double y = a3.y;
  double x = a3.x;
  -[CALayer convertPoint:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:fromLayer:", [(UIView *)self->_pageView layer], a3.x, a3.y);
  double v11 = v10;
  double v13 = v12;
  *a4 = *(CGPoint *)MEMORY[0x1E4F1DAD8];
  *a5 = 0;
  [(CALayer *)self->_startHandle position];
  -[CALayer convertPoint:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:fromLayer:", self->_startSelectionGrabber, v14, v15);
  *(float *)&double v16 = (v16 - v11) * (v16 - v11) + (v17 - v13) * (v17 - v13);
  float v18 = sqrtf(*(float *)&v16);
  [(CALayer *)self->_endHandle position];
  -[CALayer convertPoint:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:fromLayer:", self->_endSelectionGrabber, v19, v20);
  *(float *)&double v21 = (v21 - v11) * (v21 - v11) + (v22 - v13) * (v22 - v13);
  float v23 = sqrtf(*(float *)&v21);
  BOOL v24 = v23 > 20.0 && v18 > 20.0;
  if (!v24)
  {
    BOOL v25 = v23 > 20.0 && v18 <= 20.0;
    if (v18 <= 20.0 && !v25) {
      BOOL v25 = v18 - v23 < 0.0;
    }
    v26 = [[(UIPDFPageView *)self->_pageView page] selection];
    [(UIPDFSelection *)v26 numberOfRectangles];
    memset(&v52, 0, sizeof(v52));
    memset(&v51, 0, sizeof(v51));
    memset(&v50, 0, sizeof(v50));
    memset(&v49, 0, sizeof(v49));
    [(UIPDFSelection *)v26 getBounds:&v52 transform:&v50 index:self->_startRectangle];
    [(UIPDFSelection *)v26 getBounds:&v51 transform:&v49 index:self->_endRectangle];
    if (v25)
    {
      CGRect v27 = v52;
      if (self->_startLeft) {
        double MinX = CGRectGetMinX(v27);
      }
      else {
        double MinX = CGRectGetMaxX(v27);
      }
      double v31 = MinX;
      double MidY = CGRectGetMidY(v52);
      CGRect v33 = v51;
      if (self->_endRight) {
        double MaxX = CGRectGetMaxX(v33);
      }
      else {
        double MaxX = CGRectGetMinX(v33);
      }
      double v37 = MaxX;
      double v38 = CGRectGetMidY(v51);
      a4->double x = v37;
      a4->double y = v38;
      CGAffineTransform v48 = v50;
      if (!CGAffineTransformIsIdentity(&v48))
      {
        double v39 = v31 * v50.b;
        double v31 = v50.tx + v31 * v50.a + MidY * v50.c;
        double MidY = v50.ty + v39 + MidY * v50.d;
        CGFloat v40 = v50.ty + v37 * v50.b + v38 * v50.d;
        a4->double x = v50.tx + v37 * v50.a + v38 * v50.c;
        a4->double y = v40;
      }
      self->_fixedSelectionGrabber = self->_endSelectionGrabber;
      *a5 = 1;
    }
    else
    {
      CGRect v29 = v51;
      if (self->_endRight) {
        double v30 = CGRectGetMaxX(v29);
      }
      else {
        double v30 = CGRectGetMinX(v29);
      }
      double v31 = v30;
      double MidY = CGRectGetMidY(v51);
      CGRect v35 = v52;
      if (self->_startLeft) {
        double v36 = CGRectGetMinX(v35);
      }
      else {
        double v36 = CGRectGetMaxX(v35);
      }
      double v41 = v36;
      double v42 = CGRectGetMidY(v52);
      a4->double x = v41;
      a4->double y = v42;
      CGAffineTransform v48 = v49;
      if (!CGAffineTransformIsIdentity(&v48))
      {
        double v43 = v31 * v49.b;
        double v31 = v49.tx + v31 * v49.a + MidY * v49.c;
        double MidY = v49.ty + v43 + MidY * v49.d;
        CGFloat v44 = v49.ty + v41 * v49.b + v42 * v49.d;
        a4->double x = v49.tx + v41 * v49.a + v42 * v49.c;
        a4->double y = v44;
      }
      *a5 = 0;
      self->_fixedSelectionGrabber = self->_startSelectionGrabber;
    }
    self->_initialSelectionPointOnPage.double x = v31;
    self->_initialSelectionPointOnPage.double y = MidY;
    -[UIPDFPageView convertPointFromPDFPageSpace:](self->_pageView, "convertPointFromPDFPageSpace:", v31, MidY);
    self->_offsetX = v45 - x;
    self->_offsetY = v46 - y;
  }
  return !v24;
}

- (CGPoint)viewOffset
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  if (self->_fixedSelectionGrabber == self->_endSelectionGrabber)
  {
    [(CALayer *)self->_startSelectionGrabber bounds];
    double v4 = (CGRectGetHeight(v14) - self->_handleHeight) * 0.5;
  }
  else
  {
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  -[CALayer convertPoint:toLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:toLayer:", [(UIView *)self->_pageView layer], 0.0, 0.0);
  double v6 = v5;
  double v8 = v7;
  -[CALayer convertPoint:toLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:toLayer:", [(UIView *)self->_pageView layer], v3, v4);
  double v10 = v9 - v6;
  double v12 = v11 - v8;
  result.double y = v12;
  result.double x = v10;
  return result;
}

- (CGRect)selectionRectangle
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGPoint)currentSelectionPointOnPage
{
  double v3 = [[(UIPDFPageView *)self->_pageView page] selection];
  if ([(UIPDFSelection *)v3 numberOfRectangles])
  {
    memset(&v19, 0, sizeof(v19));
    memset(&v18, 0, sizeof(v18));
    float64x2_t v16 = 0u;
    float64x2_t v17 = 0u;
    float64x2_t v15 = 0u;
    [(UIPDFSelection *)v3 getBounds:&v19 transform:&v15 index:self->_startRectangle];
    [(UIPDFSelection *)v3 getBounds:&v18 transform:&v15 index:self->_endRectangle];
    if (self->_fixedSelectionGrabber == self->_endSelectionGrabber)
    {
      CGRect v7 = v19;
      if (self->_startLeft) {
        double MinX = CGRectGetMinX(v7);
      }
      else {
        double MinX = CGRectGetMaxX(v7);
      }
      double v13 = MinX;
      double v9 = &v19;
    }
    else
    {
      CGRect v4 = v18;
      if (self->_endRight) {
        double MaxX = CGRectGetMaxX(v4);
      }
      else {
        double MaxX = CGRectGetMinX(v4);
      }
      double v13 = MaxX;
      double v9 = &v18;
    }
    CGFloat MidY = CGRectGetMidY(*v9);
    *(float64x2_t *)&v14.a = v15;
    *(float64x2_t *)&v14.c = v16;
    *(float64x2_t *)&v14.tdouble x = v17;
    IsIdentitdouble y = CGAffineTransformIsIdentity(&v14);
    v6.f64[0] = v13;
    v6.f64[1] = MidY;
    if (!IsIdentity) {
      float64x2_t v6 = vaddq_f64(v17, vaddq_f64(vmulq_n_f64(v15, v13), vmulq_laneq_f64(v16, v6, 1)));
    }
  }
  else
  {
    float64x2_t v6 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  }
  double v11 = v6.f64[1];
  result.double x = v6.f64[0];
  result.double y = v11;
  return result;
}

- (void)hide
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CALayer *)self->_startSelectionGrabber setOpacity:0.0];
  [(CALayer *)self->_endSelectionGrabber setOpacity:0.0];
  double v3 = (void *)MEMORY[0x1E4F39CF8];
  [v3 commit];
}

- (NSString)description
{
  double v3 = NSString;
  startIndedouble x = self->_startIndex;
  endIndedouble x = self->_endIndex;
  [(CALayer *)self->_startSelectionGrabber position];
  float64x2_t v6 = NSStringFromCGPoint(v8);
  [(CALayer *)self->_endSelectionGrabber position];
  return (NSString *)[v3 stringWithFormat:@"TextRangeWidget %lu - %lu, %@ %@", startIndex, endIndex, v6, NSStringFromCGPoint(v9)];
}

- (UIPDFPageView)pageView
{
  return self->_pageView;
}

- (void)setPageView:(id)a3
{
  self->_pageView = (UIPDFPageView *)a3;
}

- (CGPoint)initialSelectionPointOnPage
{
  double x = self->_initialSelectionPointOnPage.x;
  double y = self->_initialSelectionPointOnPage.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end