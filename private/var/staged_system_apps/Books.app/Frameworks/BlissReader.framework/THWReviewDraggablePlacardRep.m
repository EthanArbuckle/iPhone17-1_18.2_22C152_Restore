@interface THWReviewDraggablePlacardRep
- (BOOL)allowSublayerUpdatesWhenPaused;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)handleGesture:(id)a3;
- (BOOL)isPressed;
- (BOOL)shadowValid;
- (CALayer)imageLayer;
- (CAShapeLayer)calloutLayer;
- (CGImage)currentImageContents;
- (CGPath)p_cachedPathForSize:(CGSize)a3 arrowDirection:(int)a4;
- (id)calloutPathAnimationWithduration:(double)a3;
- (id)contentTextRep;
- (id)p_dragHosting;
- (id)p_pathWithDirection:(int)a3 size:(CGSize)a4 includeWedge:(BOOL)a5;
- (int)arrowDirection;
- (void)addAdditionalChildBackgroundLayersToArray:(id)a3;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)dealloc;
- (void)p_updateLayers;
- (void)setArrowDirection:(int)a3;
- (void)setPressed:(BOOL)a3;
- (void)updateLayerBoundsAndWPPosition;
@end

@implementation THWReviewDraggablePlacardRep

- (void)dealloc
{
  cachedPath = self->_cachedPath;
  if (cachedPath)
  {
    CFRelease(cachedPath);
    self->_cachedPath = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THWReviewDraggablePlacardRep;
  [(THWReviewDraggablePlacardRep *)&v4 dealloc];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)updateLayerBoundsAndWPPosition
{
  id v3 = [(THWReviewDraggablePlacardRep *)self interactiveCanvasController];
  id v4 = [v3 layerForRep:self];
  [(THWReviewDraggablePlacardRep *)self layerFrameInScaledCanvasRelativeToParent];
  TSDRectWithSize();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 bounds];
  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v12;
  if (!CGRectEqualToRect(v16, v17)) {
    [v4 setBounds:v6, v8, v10, v12];
  }
  id v13 = [self layout].contentTextLayout;
  if (v13)
  {
    id v14 = [v3 layerForRep:[v3 repForLayout:v13]];
    [v14 position];
    [v14 setPosition:v10 * 0.5];
  }
}

- (id)contentTextRep
{
  id result = [[self layout] contentTextLayout];
  if (result)
  {
    id v4 = result;
    objc_opt_class();
    [self interactiveCanvasController].repForLayout:v4];
    return (id)TSUDynamicCast();
  }
  return result;
}

- (void)p_updateLayers
{
  id v3 = [(THWReviewDraggablePlacardRep *)self layout];
  objc_msgSend(objc_msgSend(v3, "geometry"), "size");
  TSDRectWithSize();
  double v5 = v4;
  double v7 = v6;
  [self canvas].viewScale
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeScale(&v32, v8, v8);
  double v9 = (CGImage *)objc_msgSend(objc_msgSend(v3, "contentImage"), "CGImage");
  if (v9)
  {
    double v10 = v9;
    TSDRectWithSize();
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    TSDCenterOfRect();
    float64x2_t v26 = vaddq_f64(*(float64x2_t *)&v32.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v32.c, v19), *(float64x2_t *)&v32.a, v20));
    imageLayer = self->_imageLayer;
    if (!imageLayer)
    {
      v22 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
      self->_imageLayer = v22;
      [(CALayer *)v22 setContentsGravity:kCAGravityResizeAspect];
      [(CALayer *)self->_imageLayer setCornerRadius:2.0];
      [(CALayer *)self->_imageLayer setBorderWidth:1.0];
      [(CALayer *)self->_imageLayer setBorderColor:[+[TSUColor colorWithWhite:0.0 alpha:0.3] CGColor]];
      [(CALayer *)self->_imageLayer setDelegate:[(THWReviewDraggablePlacardRep *)self interactiveCanvasController]];
      imageLayer = self->_imageLayer;
    }
    -[CALayer setBounds:](imageLayer, "setBounds:", v12, v14, v16, v18, *(_OWORD *)&v26);
    -[CALayer setPosition:](self->_imageLayer, "setPosition:", v27, v28);
    CGAffineTransform v31 = v32;
    [(CALayer *)self->_imageLayer setAffineTransform:&v31];
    if (v10 != self->_currentImageContents)
    {
      [(CALayer *)self->_imageLayer setContents:v10];
      self->_currentImageContents = v10;
    }
  }
  else
  {

    self->_imageLayer = 0;
    self->_currentImageContents = 0;
  }
  if (!self->_calloutLayer)
  {
    self->_calloutLayer = (CAShapeLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionShapeLayer);
    -[self->_calloutLayer setBackgroundColor:[+[TSUColor clearColor](TSUColor, "clearColor") CGColor]];
    [self->_calloutLayer setFillColor:[+[TSUColor whiteColor](TSUColor, "whiteColor") CGColor]];
    [(CAShapeLayer *)self->_calloutLayer setLineWidth:1.0];
    [(CAShapeLayer *)self->_calloutLayer setStrokeColor:[+[TSUColor colorWithWhite:0.0 alpha:0.1] CGColor]];
    -[self->_calloutLayer setShadowColor:[+[TSUColor blackColor](TSUColor, "blackColor") CGColor]];
    LODWORD(v23) = 0.25;
    [(CAShapeLayer *)self->_calloutLayer setShadowOpacity:v23];
    [(CAShapeLayer *)self->_calloutLayer setDelegate:[(THWReviewDraggablePlacardRep *)self interactiveCanvasController]];
  }
  v24 = -[THWReviewDraggablePlacardRep p_cachedPathForSize:arrowDirection:](self, "p_cachedPathForSize:arrowDirection:", [(THWReviewDraggablePlacardRep *)self arrowDirection], v5, v7);
  if (!CGPathEqualToPath(v24, [(CAShapeLayer *)self->_calloutLayer path])) {
    [(CAShapeLayer *)self->_calloutLayer setPath:v24];
  }
  if (!self->_shadowValid)
  {
    if ([(THWReviewDraggablePlacardRep *)self isPressed]) {
      double v25 = 7.0;
    }
    else {
      double v25 = 3.0;
    }
    CGPoint v30 = CGPointZero;
    TSDOriginRotate();
    [(CAShapeLayer *)self->_calloutLayer setShadowOffset:v30];
    [(CAShapeLayer *)self->_calloutLayer setShadowRadius:v25];
    self->_shadowValid = 1;
  }
  CGAffineTransform v29 = v32;
  [(CAShapeLayer *)self->_calloutLayer setAffineTransform:&v29];
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWReviewDraggablePlacardRep;
  -[THWReviewDraggablePlacardRep addAdditionalChildLayersToArray:](&v5, "addAdditionalChildLayersToArray:");
  [(THWReviewDraggablePlacardRep *)self p_updateLayers];
  if (self->_imageLayer) {
    [a3 addObject:];
  }
}

- (void)addAdditionalChildBackgroundLayersToArray:(id)a3
{
  [(THWReviewDraggablePlacardRep *)self p_updateLayers];
  if (self->_calloutLayer)
  {
    [a3 addObject:];
  }
}

- (BOOL)allowSublayerUpdatesWhenPaused
{
  return 1;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 != (id)TSWPImmediatePress)
  {
    id v6 = [a3 gestureKind];
    if (v6 != (id)TSWPTapAndTouch) {
      return 0;
    }
  }
  id v8 = [(THWReviewDraggablePlacardRep *)self p_dragHosting];

  return [v8 reviewDragAllowDraggingForRep:self];
}

- (BOOL)handleGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 != (id)TSWPImmediatePress)
  {
    id v6 = [a3 gestureKind];
    return v6 == (id)TSWPTapAndTouch;
  }
  unsigned int v8 = [a3 gestureState];
  if (v8 - 2 < 4)
  {
    [self.p_dragHosting reviewDragHandleForRep:self withGesture:a3];
    return 1;
  }
  if (v8 == 1)
  {
    [self.p_dragHosting reviewDragWillBeginForRep:self withGesture:a3];
    return 1;
  }
  return 0;
}

- (void)setArrowDirection:(int)a3
{
  if (self->_arrowDirection != a3)
  {
    self->_arrowDirection = a3;
    id v3 = [(THWReviewDraggablePlacardRep *)self canvas];
    [v3 invalidateLayers];
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    self->_shadowValid = 0;
    id v3 = [(THWReviewDraggablePlacardRep *)self canvas];
    [v3 invalidateLayers];
  }
}

- (id)calloutPathAnimationWithduration:(double)a3
{
  int prevArrowDirection = self->_prevArrowDirection;
  int arrowDirection = self->_arrowDirection;
  if (arrowDirection) {
    BOOL v5 = prevArrowDirection == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || prevArrowDirection == arrowDirection) {
    return 0;
  }
  double v9 = +[CAKeyframeAnimation animationWithKeyPath:@"path"];
  objc_opt_class();
  [(CAShapeLayer *)self->_calloutLayer presentationLayer];
  id v10 = [(id)TSUDynamicCast() valueForKeyPath:@"path"];
  uint64_t v11 = self->_arrowDirection;
  TSDMixSizes();
  id v12 = -[THWReviewDraggablePlacardRep p_pathWithDirection:size:includeWedge:](self, "p_pathWithDirection:size:includeWedge:", v11, 0);
  uint64_t v13 = self->_arrowDirection;
  TSDMixSizes();
  -[v9 setValues:[NSArray arrayWithObjects:v10, [v12 CGPath], [self p_pathWithDirection:v13 size:0 includeWedge:0], self->_cachedPath, 0]];
  [(CAKeyframeAnimation *)v9 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], 0)];
  double v14 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v15) = 1053609165;
  double v16 = +[NSNumber numberWithFloat:v15];
  LODWORD(v17) = 1058642330;
  double v18 = +[NSNumber numberWithFloat:v17];
  LODWORD(v19) = 1.0;
  [(CAKeyframeAnimation *)v9 setKeyTimes:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v14, v16, v18, +[NSNumber numberWithFloat:v19], 0)];
  [(CAKeyframeAnimation *)v9 setDuration:a3];
  [(CAKeyframeAnimation *)v9 setFillMode:kCAFillModeBoth];
  return v9;
}

- (CGPath)p_cachedPathForSize:(CGSize)a3 arrowDirection:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  id result = self->_cachedPath;
  if (!result
    || (a3.width == self->_cachedPathSize.width ? (BOOL v9 = a3.height == self->_cachedPathSize.height) : (BOOL v9 = 0),
        !v9 || self->_cachedPathArrowDirection != a4))
  {
    self->_int prevArrowDirection = self->_cachedPathArrowDirection;
    self->_prevPathSize = self->_cachedPathSize;
    cachedPath = self->_cachedPath;
    if (cachedPath)
    {
      CFRelease(cachedPath);
      self->_cachedPath = 0;
    }
    self->_cachedPathSize.double width = width;
    self->_cachedPathSize.double height = height;
    self->_cachedPathArrowDirection = v4;
    id result = CGPathRetain([-[THWReviewDraggablePlacardRep p_pathWithDirection:size:includeWedge:](self, "p_pathWithDirection:size:includeWedge:", v4, 1, width, height) CGPath]);
    self->_cachedPath = result;
  }
  return result;
}

- (id)p_pathWithDirection:(int)a3 size:(CGSize)a4 includeWedge:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  memset(&m.c, 0, 32);
  if (a3 != 0 && a5) {
    double v8 = 13.0;
  }
  else {
    double v8 = 0.0;
  }
  double v9 = 0.0;
  *(_OWORD *)&m.a = 0uLL;
  CGAffineTransformMakeTranslation(&m, 0.5, 0.5);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, &m, 3.5, 0.0);
  double v22 = v8;
  double v31 = -v8;
  if (a3 == 1) {
    double v9 = -v8;
  }
  double v30 = (width + -30.0) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v30, 0.0);
  cp1double x = width * 0.5 + -5.0;
  double x = width * 0.5;
  CGPathAddCurveToPoint(Mutable, &m, v30 + 7.0, 0.0, cp1x, v9, width * 0.5, v9);
  double v23 = (width + 30.0) * 0.5 + -7.0;
  double v24 = width * 0.5 + 5.0;
  double v11 = (width + 30.0) * 0.5;
  CGPathAddCurveToPoint(Mutable, &m, v24, v9, v23, 0.0, v11, 0.0);
  CGPathAddLineToPoint(Mutable, &m, width + -3.5, 0.0);
  CGPathAddArcToPoint(Mutable, &m, width, 0.0, width, 3.5, 3.5);
  double v12 = 0.0;
  if (a3 == 2) {
    double v12 = v8;
  }
  CGFloat v13 = width + v12;
  double v29 = (height + -30.0) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, width, v29);
  double y = height * 0.5;
  cp1double y = height * 0.5 + -5.0;
  CGPathAddCurveToPoint(Mutable, &m, width, v29 + 7.0, v13, cp1y, v13, height * 0.5);
  double v14 = height * 0.5 + 5.0;
  double v15 = (height + 30.0) * 0.5 + -7.0;
  double v16 = (height + 30.0) * 0.5;
  CGPathAddCurveToPoint(Mutable, &m, v13, v14, width, v15, width, v16);
  CGPathAddLineToPoint(Mutable, &m, width, height + -3.5);
  CGPathAddArcToPoint(Mutable, &m, width, height, width + -3.5, height, 3.5);
  double v17 = v22;
  if (a3 != 3) {
    double v17 = 0.0;
  }
  CGFloat v18 = height + v17;
  CGPathAddLineToPoint(Mutable, &m, v11, height);
  CGPathAddCurveToPoint(Mutable, &m, v23, height, v24, v18, x, v18);
  CGPathAddCurveToPoint(Mutable, &m, cp1x, v18, v30 + 7.0, height, v30, height);
  CGPathAddLineToPoint(Mutable, &m, 3.5, height);
  CGPathAddArcToPoint(Mutable, &m, 0.0, height, 0.0, height + -3.5, 3.5);
  if (a3 == 4) {
    double v19 = v31;
  }
  else {
    double v19 = 0.0;
  }
  CGPathAddLineToPoint(Mutable, &m, 0.0, v16);
  CGPathAddCurveToPoint(Mutable, &m, 0.0, v15, v19, v14, v19, y);
  CGPathAddCurveToPoint(Mutable, &m, v19, cp1y, 0.0, v29 + 7.0, 0.0, v29);
  CGPathAddLineToPoint(Mutable, &m, 0.0, 3.5);
  CGPathAddArcToPoint(Mutable, &m, 0.0, 0.0, 3.5, 0.0, 3.5);
  CGPathCloseSubpath(Mutable);
  double v20 = +[TSDBezierPath bezierPathWithCGPath:Mutable];
  CGPathRelease(Mutable);
  return v20;
}

- (id)p_dragHosting
{
  id v3 = [(THWReviewDraggablePlacardRep *)self interactiveCanvasController];

  return [v3 ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWReviewDragHosting];
}

- (int)arrowDirection
{
  return self->_arrowDirection;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (CAShapeLayer)calloutLayer
{
  return self->_calloutLayer;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (CGImage)currentImageContents
{
  return self->_currentImageContents;
}

- (BOOL)shadowValid
{
  return self->_shadowValid;
}

@end