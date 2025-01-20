@interface UIPDFParagraphWidget
- (BOOL)hitTest:(CGPoint)a3 fixedPoint:(CGPoint *)a4 preceeds:(BOOL *)a5;
- (CGPoint)currentSelectionPointOnPage;
- (CGPoint)initialSelectionPointOnPage;
- (CGPoint)viewOffset;
- (CGRect)adjustRect:(CGRect)a3 toPoint:(CGPoint)a4;
- (CGRect)selectionBoundsInEffectsSpace;
- (CGRect)selectionRectangle;
- (UIPDFPageView)pageView;
- (UIPDFParagraphWidget)init;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)endTracking;
- (void)hide;
- (void)layout;
- (void)remove;
- (void)setPageView:(id)a3;
- (void)setSelectedGrabberPosition:(CGRect)a3;
- (void)setSelection:(id)a3;
- (void)track:(CGPoint)a3;
@end

@implementation UIPDFParagraphWidget

- (UIPDFParagraphWidget)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)UIPDFParagraphWidget;
  v2 = [(UIPDFParagraphWidget *)&v13 init];
  if (v2)
  {
    *(_OWORD *)components = xmmword_186B9C4B0;
    long long v15 = unk_186B9C4C0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *((void *)v2 + 20) = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v4 = (CGImage *)objc_msgSend(+[UIImage kitImageNamed:](UIImage, "kitImageNamed:", @"kb-drag-dot.png"), "CGImage");
    CGImageRetain(v4);
    float v12 = 1.0;
    BOOL v5 = CPIsRetina(&v12);
    int v6 = v5;
    double v7 = 14.0;
    float v8 = v12;
    if (v5) {
      double v7 = fmax((float)(1.0 / v12), 0.5) * 28.0;
    }
    *((void *)v2 + 11) = makeGrabber(v5, 0.0, 0.0, v7, v7, v12);
    *((void *)v2 + 12) = makeGrabber(v6, 0.0, 0.0, v7, v7, v8);
    *((void *)v2 + 13) = makeGrabber(v6, 0.0, 0.0, v7, v7, v8);
    *((void *)v2 + 14) = makeGrabber(v6, 0.0, 0.0, v7, v7, v8);
    [*((id *)v2 + 11) setDelegate:v2];
    [*((id *)v2 + 12) setDelegate:v2];
    [*((id *)v2 + 13) setDelegate:v2];
    [*((id *)v2 + 14) setDelegate:v2];
    CGImageRelease(v4);
    long long v9 = *MEMORY[0x1E4F1DB20];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *((_OWORD *)v2 + 1) = *MEMORY[0x1E4F1DB20];
    *((_OWORD *)v2 + 2) = v10;
    *(_OWORD *)(v2 + 56) = v9;
    *(_OWORD *)(v2 + 72) = v10;
    v2[48] = 0;
  }
  return (UIPDFParagraphWidget *)v2;
}

- (void)dealloc
{
  CGColorRelease(self->_grabberColor);
  [(UIPDFParagraphWidget *)self remove];
  v3.receiver = self;
  v3.super_class = (Class)UIPDFParagraphWidget;
  [(UIPDFParagraphWidget *)&v3 dealloc];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  [a3 bounds];
  grabberColor = self->_grabberColor;
  CPCGInsetFillEllipseInRect(a4, grabberColor, v6, v7, v8, v9);
}

- (CGRect)selectionBoundsInEffectsSpace
{
  objc_super v3 = [(UIPDFPageView *)self->_pageView effectsLayer];
  [(UIPDFSelection *)[[(UIPDFPageView *)self->_pageView page] selection] bounds];
  self->_boundsInPDFSpace.origin.x = v4;
  self->_boundsInPDFSpace.origin.y = v5;
  self->_boundsInPDFSpace.size.width = v6;
  self->_boundsInPDFSpace.size.height = v7;
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(UIView *)self->_pageView layer];
  -[CALayer convertRect:fromLayer:](v3, "convertRect:fromLayer:", v16, v9, v11, v13, v15);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)setSelection:(id)a3
{
  [a3 bounds];
  self->_boundsInPDFSpace.origin.CGFloat x = x;
  self->_boundsInPDFSpace.origin.CGFloat y = y;
  self->_boundsInPDFSpace.size.CGFloat width = width;
  self->_boundsInPDFSpace.size.CGFloat height = height;
  if (!self->_tracking)
  {
    double v9 = x;
    double v10 = y;
    double v11 = width;
    double v12 = height;
    memset(&v30[1], 0, sizeof(CGAffineTransform));
    if (a3)
    {
      [a3 transform];
      CGFloat x = self->_boundsInPDFSpace.origin.x;
      CGFloat y = self->_boundsInPDFSpace.origin.y;
      CGFloat width = self->_boundsInPDFSpace.size.width;
      CGFloat height = self->_boundsInPDFSpace.size.height;
    }
    v30[0] = v30[1];
    self->_boundsInPDFSpace = CGRectApplyAffineTransform(*(CGRect *)&x, v30);
    -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", v9, v10, v11, v12);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [(UIPDFPageView *)self->_pageView effectsLayer];
    -[CALayer convertRect:fromLayer:](v21, "convertRect:fromLayer:", [(UIView *)self->_pageView layer], v14, v16, v18, v20);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    if (CGRectIsNull(self->_initialRect))
    {
      self->_initialRect.origin.CGFloat x = v23;
      self->_initialRect.origin.CGFloat y = v25;
      self->_initialRect.size.CGFloat width = v27;
      self->_initialRect.size.CGFloat height = v29;
    }
    [(CALayer *)v21 addSublayer:self->_leftGrabber];
    [(CALayer *)v21 addSublayer:self->_rightGrabber];
    [(CALayer *)v21 addSublayer:self->_topGrabber];
    [(CALayer *)v21 addSublayer:self->_bottomGrabber];
  }
}

- (void)remove
{
  self->_leftGrabber = 0;
  [(CALayer *)self->_rightGrabber removeFromSuperlayer];
  self->_rightGrabber = 0;
  [(CALayer *)self->_topGrabber removeFromSuperlayer];
  self->_topGrabber = 0;
  [(CALayer *)self->_bottomGrabber removeFromSuperlayer];
  self->_bottomGrabber = 0;
  [(CAShapeLayer *)self->_trackingBorder removeFromSuperlayer];
  self->_trackingBorder = 0;
}

- (BOOL)hitTest:(CGPoint)a3 fixedPoint:(CGPoint *)a4 preceeds:(BOOL *)a5
{
  -[CALayer convertPoint:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:fromLayer:", [(UIView *)self->_pageView layer], a3.x, a3.y);
  double v9 = v8;
  double v11 = v10;
  *a4 = *(CGPoint *)MEMORY[0x1E4F1DAD8];
  *a5 = 0;
  p_topGrabber = &self->_topGrabber;
  [(CALayer *)self->_topGrabber position];
  *(float *)&double v13 = (v13 - v9) * (v13 - v9) + (v14 - v11) * (v14 - v11);
  float v15 = sqrtf(*(float *)&v13);
  double v16 = v15;
  p_bottomGrabber = &self->_bottomGrabber;
  [(CALayer *)self->_bottomGrabber position];
  *(float *)&double v18 = (v18 - v9) * (v18 - v9) + (v19 - v11) * (v19 - v11);
  float v20 = sqrtf(*(float *)&v18);
  double v21 = v20;
  if (v20 >= v15) {
    double v22 = v15;
  }
  else {
    double v22 = v20;
  }
  [(CALayer *)self->_leftGrabber position];
  *(float *)&double v23 = (v23 - v9) * (v23 - v9) + (v24 - v11) * (v24 - v11);
  float v25 = sqrtf(*(float *)&v23);
  double v26 = v25;
  if (v22 > v25) {
    double v22 = v25;
  }
  p_rightGrabber = &self->_rightGrabber;
  [(CALayer *)self->_rightGrabber position];
  BOOL result = 0;
  *(float *)&double v29 = (v29 - v9) * (v29 - v9) + (v30 - v11) * (v30 - v11);
  double v31 = sqrtf(*(float *)&v29);
  if (v22 <= v31) {
    double v32 = v22;
  }
  else {
    double v32 = v31;
  }
  if (v32 <= 20.0)
  {
    if (v32 == v16)
    {
      [(CALayer *)*p_bottomGrabber position];
      double v34 = v33;
      double v36 = v35;
      [(CALayer *)*p_bottomGrabber bounds];
      double v37 = v36 - CGRectGetHeight(v49);
    }
    else if (v32 == v21)
    {
      [(CALayer *)*p_topGrabber position];
      double v34 = v38;
      double v40 = v39;
      [(CALayer *)*p_topGrabber bounds];
      double v37 = v40 + CGRectGetHeight(v50);
      p_topGrabber = &self->_bottomGrabber;
    }
    else if (v32 == v26)
    {
      [(CALayer *)*p_rightGrabber position];
      double v42 = v41;
      double v37 = v43;
      [(CALayer *)*p_rightGrabber bounds];
      double v34 = v42 - CGRectGetWidth(v51);
      p_topGrabber = &self->_leftGrabber;
    }
    else
    {
      if (v32 != v31) {
        return 0;
      }
      [(CALayer *)*p_rightGrabber position];
      double v45 = v44;
      double v37 = v46;
      [(CALayer *)self->_leftGrabber bounds];
      double v34 = v45 + CGRectGetWidth(v52);
      p_topGrabber = &self->_rightGrabber;
    }
    -[CALayer convertPoint:fromLayer:]([(UIView *)self->_pageView layer], "convertPoint:fromLayer:", [(UIPDFPageView *)self->_pageView effectsLayer], v34, v37);
    a4->CGFloat x = v47;
    a4->CGFloat y = v48;
    self->_selectedGrabber = *p_topGrabber;
    return 1;
  }
  return result;
}

- (CGPoint)viewOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)layout
{
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  LODWORD(v3) = 1.0;
  [(CALayer *)self->_leftGrabber setOpacity:v3];
  LODWORD(v4) = 1.0;
  [(CALayer *)self->_rightGrabber setOpacity:v4];
  LODWORD(v5) = 1.0;
  [(CALayer *)self->_topGrabber setOpacity:v5];
  LODWORD(v6) = 1.0;
  [(CALayer *)self->_bottomGrabber setOpacity:v6];
  CGFloat v7 = [(UIPDFPageView *)self->_pageView effectsLayer];
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", self->_boundsInPDFSpace.origin.x, self->_boundsInPDFSpace.origin.y, self->_boundsInPDFSpace.size.width, self->_boundsInPDFSpace.size.height);
  -[CALayer convertRect:fromLayer:](v7, "convertRect:fromLayer:", [(UIView *)self->_pageView layer], v8, v9, v10, v11);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  -[CALayer convertRect:fromLayer:](v7, "convertRect:fromLayer:", 0, 0.0, 0.0, 1.0, 1.0);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  if ([(UIView *)self->_pageView window])
  {
    -[CALayer convertRect:toLayer:](v7, "convertRect:toLayer:", [(UIView *)self->_pageView layer], v21, v23, v25, v27);
    -[UIWindow convertRect:toWindow:]([(UIView *)self->_pageView window], "convertRect:toWindow:", 0, v28, v29, v30, v31);
    double v25 = v32;
    double v27 = v33;
  }
  memset(&v42, 0, sizeof(v42));
  CATransform3DMakeScale(&v42, v25, v27, 1.0);
  CATransform3D v41 = v42;
  [(CALayer *)self->_leftGrabber setTransform:&v41];
  CATransform3D v40 = v42;
  [(CALayer *)self->_rightGrabber setTransform:&v40];
  CATransform3D v39 = v42;
  [(CALayer *)self->_topGrabber setTransform:&v39];
  CATransform3D v38 = v42;
  [(CALayer *)self->_bottomGrabber setTransform:&v38];
  v43.origin.CGFloat x = v13;
  v43.origin.CGFloat y = v15;
  v43.size.CGFloat width = v17;
  v43.size.CGFloat height = v19;
  double MinX = CGRectGetMinX(v43);
  v44.origin.CGFloat x = v13;
  v44.origin.CGFloat y = v15;
  v44.size.CGFloat width = v17;
  v44.size.CGFloat height = v19;
  -[CALayer setPosition:](self->_leftGrabber, "setPosition:", MinX, CGRectGetMidY(v44));
  v45.origin.CGFloat x = v13;
  v45.origin.CGFloat y = v15;
  v45.size.CGFloat width = v17;
  v45.size.CGFloat height = v19;
  double MaxX = CGRectGetMaxX(v45);
  v46.origin.CGFloat x = v13;
  v46.origin.CGFloat y = v15;
  v46.size.CGFloat width = v17;
  v46.size.CGFloat height = v19;
  -[CALayer setPosition:](self->_rightGrabber, "setPosition:", MaxX, CGRectGetMidY(v46));
  v47.origin.CGFloat x = v13;
  v47.origin.CGFloat y = v15;
  v47.size.CGFloat width = v17;
  v47.size.CGFloat height = v19;
  double MidX = CGRectGetMidX(v47);
  v48.origin.CGFloat x = v13;
  v48.origin.CGFloat y = v15;
  v48.size.CGFloat width = v17;
  v48.size.CGFloat height = v19;
  -[CALayer setPosition:](self->_topGrabber, "setPosition:", MidX, CGRectGetMinY(v48));
  v49.origin.CGFloat x = v13;
  v49.origin.CGFloat y = v15;
  v49.size.CGFloat width = v17;
  v49.size.CGFloat height = v19;
  double v37 = CGRectGetMidX(v49);
  v50.origin.CGFloat x = v13;
  v50.origin.CGFloat y = v15;
  v50.size.CGFloat width = v17;
  v50.size.CGFloat height = v19;
  -[CALayer setPosition:](self->_bottomGrabber, "setPosition:", v37, CGRectGetMaxY(v50));
  [(CALayer *)self->_leftGrabber setNeedsDisplay];
  [(CALayer *)self->_rightGrabber setNeedsDisplay];
  [(CALayer *)self->_topGrabber setNeedsDisplay];
  [(CALayer *)self->_bottomGrabber setNeedsDisplay];
}

- (CGRect)adjustRect:(CGRect)a3 toPoint:(CGPoint)a4
{
  CGFloat x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat v8 = a3.origin.x;
  selectedGrabber = self->_selectedGrabber;
  if (selectedGrabber == self->_leftGrabber)
  {
    double width = a3.size.width + CGRectGetMinX(a3) - a4.x;
    CGFloat v8 = x;
  }
  else if (selectedGrabber == self->_rightGrabber)
  {
    double width = a3.size.width + a4.x - CGRectGetMaxX(a3);
  }
  else
  {
    CGFloat v10 = a4.y;
    if (selectedGrabber == self->_bottomGrabber)
    {
      double height = a3.size.height + a4.y - CGRectGetMaxY(a3);
    }
    else
    {
      double height = a3.size.height + CGRectGetMinY(a3) - a4.y;
      CGFloat y = v10;
    }
  }
  double v11 = v8;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)setSelectedGrabberPosition:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v14);
  selectedGrabber = self->_selectedGrabber;
  if (selectedGrabber == self->_leftGrabber)
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v17);
LABEL_7:
    double MidX = MinX;
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double MinY = CGRectGetMidY(v19);
    goto LABEL_8;
  }
  if (selectedGrabber == self->_rightGrabber)
  {
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double MinX = CGRectGetMaxX(v18);
    goto LABEL_7;
  }
  if (selectedGrabber == self->_bottomGrabber)
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v15);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    double MinY = CGRectGetMaxY(v16);
  }
LABEL_8:
  double v12 = self->_selectedGrabber;
  -[CALayer setPosition:](v12, "setPosition:", MidX, MinY);
}

- (void)track:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  -[CALayer convertPoint:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:fromLayer:", [(UIView *)self->_pageView layer], x, y);
  double v7 = v6;
  double v9 = v8;
  Mutable = CGPathCreateMutable();
  if (self->_tracking)
  {
    -[CALayer convertPoint:fromLayer:]([(UIPDFPageView *)self->_pageView effectsLayer], "convertPoint:fromLayer:", [(UIView *)self->_pageView layer], x, y);
    -[UIPDFParagraphWidget adjustRect:toPoint:](self, "adjustRect:toPoint:", self->_initialRect.origin.x, self->_initialRect.origin.y, self->_initialRect.size.width, self->_initialRect.size.height, v11, v12);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat width = v17;
    CGFloat height = v19;
    self->_currentTrackingRect.origin.double x = v13;
    self->_currentTrackingRect.origin.double y = v15;
    self->_currentTrackingRect.size.CGFloat width = v17;
    self->_currentTrackingRect.size.CGFloat height = v19;
    -[UIPDFParagraphWidget setSelectedGrabberPosition:](self, "setSelectedGrabberPosition:");
  }
  else
  {
    p_leftGrabber = &self->_leftGrabber;
    [(CALayer *)self->_leftGrabber setOpacity:0.0];
    [(CALayer *)self->_rightGrabber setOpacity:0.0];
    [(CALayer *)self->_topGrabber setOpacity:0.0];
    [(CALayer *)self->_bottomGrabber setOpacity:0.0];
    selectedGrabber = self->_selectedGrabber;
    if (!selectedGrabber)
    {
      double MinX = CGRectGetMinX(self->_initialRect);
      if (v7 >= MinX)
      {
        double MinX = CGRectGetMaxX(self->_initialRect);
        p_leftGrabber = &self->_rightGrabber;
        if (v7 <= MinX)
        {
          double MinX = CGRectGetMinY(self->_initialRect);
          if (v9 <= MinX) {
            p_leftGrabber = &self->_topGrabber;
          }
          else {
            p_leftGrabber = &self->_bottomGrabber;
          }
        }
      }
      selectedGrabber = *p_leftGrabber;
      self->_selectedGrabber = *p_leftGrabber;
    }
    LODWORD(MinX) = 1.0;
    [(CALayer *)selectedGrabber setOpacity:MinX];
    self->_trackingBorder = (CAShapeLayer *)[MEMORY[0x1E4F39C88] layer];
    [(CAShapeLayer *)self->_trackingBorder setStrokeColor:[+[UIColor blueColor] CGColor]];
    [(CAShapeLayer *)self->_trackingBorder setFillColor:0];
    [(CALayer *)[(UIPDFPageView *)self->_pageView effectsLayer] insertSublayer:self->_trackingBorder atIndex:0];
    self->_tracking = 1;
    -[UIPDFParagraphWidget setSelectedGrabberPosition:](self, "setSelectedGrabberPosition:", self->_initialRect.origin.x, self->_initialRect.origin.y, self->_initialRect.size.width, self->_initialRect.size.height);
    self->_currentTrackingRect.origin = self->_initialRect.origin;
    self->_currentTrackingRect.size = self->_initialRect.size;
    CGFloat v14 = self->_initialRect.origin.x;
    CGFloat v16 = self->_initialRect.origin.y;
    CGFloat width = self->_initialRect.size.width;
    CGFloat height = self->_initialRect.size.height;
  }
  v25.origin.double x = v14;
  v25.origin.double y = v16;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v25);
  [(CAShapeLayer *)self->_trackingBorder setPath:Mutable];
  CGPathRelease(Mutable);
}

- (void)endTracking
{
  [(CAShapeLayer *)self->_trackingBorder removeFromSuperlayer];
  self->_trackingBorder = 0;
  self->_tracking = 0;
  LODWORD(v3) = 1.0;
  [(CALayer *)self->_leftGrabber setOpacity:v3];
  LODWORD(v4) = 1.0;
  [(CALayer *)self->_rightGrabber setOpacity:v4];
  LODWORD(v5) = 1.0;
  [(CALayer *)self->_topGrabber setOpacity:v5];
  LODWORD(v6) = 1.0;
  [(CALayer *)self->_bottomGrabber setOpacity:v6];
  self->_selectedGrabber = 0;
  [(UIPDFParagraphWidget *)self selectionBoundsInEffectsSpace];
  self->_initialRect.origin.double x = v7;
  self->_initialRect.origin.double y = v8;
  self->_initialRect.size.CGFloat width = v9;
  self->_initialRect.size.CGFloat height = v10;
  [(UIPDFParagraphWidget *)self layout];
}

- (CGRect)selectionRectangle
{
  p_currentTrackingRect = &self->_currentTrackingRect;
  if (CGRectIsNull(self->_currentTrackingRect))
  {
    CGSize size = self->_initialRect.size;
    p_currentTrackingRect->origin = self->_initialRect.origin;
    p_currentTrackingRect->CGSize size = size;
  }
  double x = self->_currentTrackingRect.origin.x;
  double y = self->_currentTrackingRect.origin.y;
  double width = self->_currentTrackingRect.size.width;
  double height = self->_currentTrackingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)currentSelectionPointOnPage
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)hide
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CALayer *)self->_leftGrabber setOpacity:0.0];
  [(CALayer *)self->_rightGrabber setOpacity:0.0];
  [(CALayer *)self->_topGrabber setOpacity:0.0];
  [(CALayer *)self->_bottomGrabber setOpacity:0.0];
  double v3 = (void *)MEMORY[0x1E4F39CF8];
  [v3 commit];
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