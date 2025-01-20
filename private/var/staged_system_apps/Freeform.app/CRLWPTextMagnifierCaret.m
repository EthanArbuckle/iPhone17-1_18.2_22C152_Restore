@interface CRLWPTextMagnifierCaret
- (BOOL)p_isMagnifierStopping;
- (BOOL)shouldHideCanvasLayer;
- (BOOL)terminalPointPlacedCarefully;
- (CGPoint)animationPoint;
- (CGPoint)magnificationPoint;
- (CGPoint)offset;
- (CGPoint)terminalPoint;
- (CRLCanvasRep)target;
- (CRLWPTextMagnifierCaret)init;
- (NSString)maskImageName;
- (NSString)underlayImageName;
- (double)pointVelocity;
- (double)yOffset;
- (id)overlayImageName;
- (void)autoscrollWillNotStart;
- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6;
- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4;
- (void)postAutoscrollPoint:(CGPoint)a3;
- (void)remove;
- (void)setAnimationPoint:(CGPoint)a3;
- (void)setAutoscrollDirections:(int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMagnificationPoint:(CGPoint)a3;
- (void)setNeedsDisplay;
- (void)setOffset:(CGPoint)a3;
- (void)setPointVelocity:(double)a3;
- (void)setTarget:(id)a3;
- (void)setYOffset:(double)a3;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrameAndOffset;
- (void)zoomDownAnimation;
- (void)zoomUpAnimation;
@end

@implementation CRLWPTextMagnifierCaret

- (void)setTarget:(id)a3
{
  id v5 = a3;
  p_target = (void **)&self->_target;
  if (*p_target != v5)
  {
    id v11 = v5;
    v7 = (objc_class *)objc_opt_class();
    v8 = sub_10024715C(v7, *p_target);
    [v8 enableCaretAnimation];

    objc_storeStrong(p_target, a3);
    v9 = (objc_class *)objc_opt_class();
    v10 = sub_10024715C(v9, *p_target);
    [v10 disableCaretAnimation];

    id v5 = v11;
  }
}

- (CRLWPTextMagnifierCaret)init
{
  v12.receiver = self;
  v12.super_class = (Class)CRLWPTextMagnifierCaret;
  v2 = -[CRLWPTextMagnifierCaret initWithFrame:](&v12, "initWithFrame:", 0.0, 0.0, 106.0, 106.0);
  if (v2)
  {
    v3 = +[UIColor clearColor];
    [(CRLWPTextMagnifierCaret *)v2 setBackgroundColor:v3];

    v4 = objc_alloc_init(CRLWPTextMagnifierTimeWeightedPoint);
    weightedPoint = v2->_weightedPoint;
    v2->_weightedPoint = v4;

    v6 = -[CRLWPTextMagnifierRenderer initWithFrame:]([CRLWPTextMagnifierRenderer alloc], "initWithFrame:", 0.0, 0.0, 106.0, 106.0);
    magnifierRenderer = v2->_magnifierRenderer;
    v2->_magnifierRenderer = v6;

    [(CRLWPTextMagnifierRenderer *)v2->_magnifierRenderer setRendererDelegate:v2];
    [(CRLWPTextMagnifierCaret *)v2 addSubview:v2->_magnifierRenderer];
    v8 = [(CRLWPTextMagnifierCaret *)v2 overlayImageName];
    v9 = +[UIImage imageNamed:v8];

    id v10 = [objc_alloc((Class)UIImageView) initWithImage:v9];
    [(CRLWPTextMagnifierCaret *)v2 addSubview:v10];
  }
  return v2;
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPTextMagnifierCaret;
  -[CRLWPTextMagnifierCaret setFrame:](&v5, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  [(CRLWPTextMagnifierCaret *)self bounds];
  -[CRLWPTextMagnifierRenderer setFrame:](magnifierRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextMagnifierCaret;
  [(CRLWPTextMagnifierCaret *)&v3 setNeedsDisplay];
  [(CRLWPTextMagnifierRenderer *)self->_magnifierRenderer setNeedsDisplay];
}

- (CGPoint)magnificationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[CRLWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  if (x != self->_magnificationPoint.x || y != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.double x = x;
    self->_magnificationPoint.double y = y;
    [(CRLWPTextMagnifierCaret *)self updateFrameAndOffset];
    magnifierRenderer = self->_magnifierRenderer;
    [(CRLWPTextMagnifierRenderer *)magnifierRenderer setNeedsDisplay];
  }
}

- (CGPoint)terminalPoint
{
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint weightedPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3 = [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint historyCovers:0.5];
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint distanceCoveredInInterval:0.5];
  return v4 < 10.0 && v3;
}

- (CGPoint)animationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)postAutoscrollPoint:(CGPoint)a3
{
}

- (void)setAutoscrollDirections:(int)a3
{
}

- (void)autoscrollWillNotStart
{
}

- (void)zoomUpAnimation
{
  memset(&v7, 0, sizeof(v7));
  [(CRLWPTextMagnifierCaret *)self bounds];
  CGFloat MaxY = CGRectGetMaxY(v8);
  CGAffineTransformMakeTranslation(&v7, 0.0, MaxY * 0.5);
  CGAffineTransform v5 = v7;
  CGAffineTransformScale(&v6, &v5, 0.25, 0.25);
  CGAffineTransform v7 = v6;
  [(CRLWPTextMagnifierCaret *)self setTransform:&v6];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10027F2C8;
  v4[3] = &unk_1014CBBB0;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:0.075];
}

- (void)zoomDownAnimation
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10027F3CC;
  v3[3] = &unk_1014CBBB0;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10027F614;
  v2[3] = &unk_1014CE260;
  v2[4] = self;
  +[UIView animateWithDuration:v3 animations:v2 completion:0.15];
}

- (void)remove
{
  [(UIWindow *)self->_hostWindow setHidden:1];
  hostWindow = self->_hostWindow;
  self->_hostWindow = 0;
}

- (void)updateFrameAndOffset
{
  BOOL v3 = [(CRLWPTextMagnifierCaret *)self superview];
  [(CRLWPTextMagnifierCaret *)self magnificationPoint];
  double v5 = v4;
  double v7 = v6;
  CGRect v8 = [(CRLWPTextMagnifierCaret *)self target];
  v9 = [v8 interactiveCanvasController];
  id v10 = [v9 layerHost];
  id v11 = [v10 canvasView];
  [v3 convertPoint:v11 fromView:v5];
  double v13 = v12;
  double v15 = v14;

  [(CRLWPTextMagnifierCaret *)self bounds];
  double v17 = v15 + v16 * 0.5;
  double v18 = v17 + -60.0;
  double v19 = v17 + -75.0;
  if (v18 >= 75.0) {
    double v20 = 60.0;
  }
  else {
    double v20 = v19;
  }
  [(CRLWPTextMagnifierCaret *)self offset];
  double v22 = v13 + v21;
  [(CRLWPTextMagnifierCaret *)self offset];
  self->_yOffset = v20;
  -[CRLWPTextMagnifierCaret setCenter:](self, "setCenter:", round(v22), round(v15 + v23 - v20));
  [(CRLWPTextMagnifierCaret *)self frame];
  CGRect v26 = CGRectIntegral(v25);

  -[CRLWPTextMagnifierCaret setFrame:](self, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v12 = a3;
  [(CRLWPTextMagnifierCaret *)self setTarget:v12];
  [(CRLWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint clearHistory];
  [(CRLWPTextMagnifierCaret *)self setAutoscrollDirections:0];
  [(CRLWPTextMagnifierCaret *)self setNeedsLayout];
  [(CRLWPTextMagnifierCaret *)self setNeedsDisplay];
  id v13 = objc_alloc((Class)UIWindow);
  double v14 = +[UIScreen mainScreen];
  [v14 bounds];
  double v15 = [v13 initWithFrame:];
  hostWindow = self->_hostWindow;
  self->_hostWindow = v15;

  [(UIWindow *)self->_hostWindow setWindowLevel:UIWindowLevelStatusBar + 1.0];
  double v17 = +[UIColor clearColor];
  [(UIWindow *)self->_hostWindow setBackgroundColor:v17];

  uint64_t v18 = objc_opt_class();
  double v19 = [v12 interactiveCanvasController];

  double v20 = [v19 delegate];
  sub_1002469D0(v18, v20);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  double v21 = -[CRLWPTextMagnifierCaretController initWithPreferredStatusBarStyle:]([CRLWPTextMagnifierCaretController alloc], "initWithPreferredStatusBarStyle:", [v22 preferredStatusBarStyle]);
  [(CRLWPTextMagnifierCaretController *)v21 setView:self];
  [(UIWindow *)self->_hostWindow setRootViewController:v21];
  [(UIWindow *)self->_hostWindow addSubview:self];
  [(UIWindow *)self->_hostWindow setHidden:0];
  -[CRLWPTextMagnifierCaret setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  [(CRLWPTextMagnifierCaret *)self frame];
  -[CRLWPTextMagnifierCaret setFrame:](self, "setFrame:");
  -[CRLWPTextMagnifierCaret setOffset:](self, "setOffset:", x, y);
  if (v6) {
    [(CRLWPTextMagnifierCaret *)self zoomUpAnimation];
  }
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    [(CRLWPTextMagnifierCaret *)self zoomDownAnimation];
  }
  else
  {
    [(CRLWPTextMagnifierCaret *)self remove];
    [(CRLWPTextMagnifierCaret *)self setTarget:0];
  }
  self->_magnificationPoint = (CGPoint)xmmword_101175150;
  double y = CGPointZero.y;

  -[CRLWPTextMagnifierCaret setOffset:](self, "setOffset:", CGPointZero.x, y);
}

- (BOOL)p_isMagnifierStopping
{
  if (self->_magnificationPoint.x != INFINITY || self->_magnificationPoint.y != INFINITY) {
    return 0;
  }
  [(CRLWPTextMagnifierCaret *)self offset];
  return v5 == CGPointZero.y && v4 == CGPointZero.x;
}

- (id)overlayImageName
{
  return @"kb-loupe-hi";
}

- (NSString)maskImageName
{
  return (NSString *)@"kb-loupe-mask";
}

- (BOOL)shouldHideCanvasLayer
{
  double v2 = [(CRLWPTextMagnifierCaret *)self target];
  BOOL v3 = [v2 interactiveCanvasController];

  uint64_t v4 = objc_opt_class();
  double v5 = sub_1002469D0(v4, v3);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    double v7 = [v5 layerHost];
    CGRect v8 = sub_1002469D0(v6, v7);
  }
  return 1;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v6 = [(CRLWPTextMagnifierCaret *)self target];
  if (v6)
  {
    double v7 = (void *)v6;
    unsigned __int8 v8 = [(CRLWPTextMagnifierCaret *)self p_isMagnifierStopping];

    if ((v8 & 1) == 0)
    {
      double v9 = [(CRLWPTextMagnifierCaret *)self target];
      id v40 = [v9 interactiveCanvasController];

      double v10 = [v40 layerHost];
      id v11 = [v10 canvasView];

      [(CRLWPTextMagnifierCaret *)self frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v20 = [(CRLWPTextMagnifierCaret *)self superview];
      [v11 convertRect:v20 fromView:v13, v15, v17, v19];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      +[UIScreen crl_screenScale];
      CGFloat v30 = v29;
      v42.width = v26;
      v42.height = v28;
      UIGraphicsBeginImageContextWithOptions(v42, 1, v30);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextScaleCTM(CurrentContext, 1.0, -1.0);
      CGContextScaleCTM(CurrentContext, 1.2, 1.2);
      [(CRLWPTextMagnifierCaret *)self yOffset];
      CGContextTranslateCTM(CurrentContext, -v22, -v24 - v32);
      CGContextTranslateCTM(CurrentContext, v26 * -0.100000001, v28 * -0.899999999);
      v33 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      CGContextSaveGState(a4);
      v34 = [(CRLWPTextMagnifierCaret *)self maskImageName];
      v35 = +[UIImage imageNamed:v34];

      id v36 = v35;
      v37 = (CGImage *)[v36 CGImage];
      v43.origin.double x = 0.0;
      v43.origin.double y = 0.0;
      v43.size.width = v26;
      v43.size.height = v28;
      CGContextClipToMask(a4, v43, v37);
      id v38 = v33;
      v39 = (CGImage *)[v38 CGImage];
      v44.origin.double x = 0.0;
      v44.origin.double y = 0.0;
      v44.size.width = v26;
      v44.size.height = v28;
      CGContextDrawImage(a4, v44, v39);
      CGContextRestoreGState(a4);
    }
  }
}

- (CRLCanvasRep)target
{
  return self->_target;
}

- (double)pointVelocity
{
  return self->_pointVelocity;
}

- (void)setPointVelocity:(double)a3
{
  self->_pointVelocitdouble y = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_magnificationPoint = a3;
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (NSString)underlayImageName
{
  return self->_underlayImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlayImageName, 0);
  objc_storeStrong((id *)&self->_hostWindow, 0);
  objc_storeStrong((id *)&self->_magnifierRenderer, 0);
  objc_storeStrong((id *)&self->_weightedPoint, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

@end