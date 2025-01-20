@interface THWInteractiveImageCalloutRep
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)controlContainerMasksToBounds:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)handleGesture:(id)a3;
- (BOOL)hovering;
- (BOOL)p_animatingCallouts;
- (CAGradientLayer)gradientLayer;
- (CALayer)lineShadow;
- (CALayer)shadowLayer;
- (CALayer)targetShadow;
- (CAShapeLayer)line;
- (CGPoint)sourcePoint;
- (CGPoint)targetPoint;
- (double)p_zoomDuration;
- (id)animationForChildRep:(id)a3 layer:(id)a4 withEvent:(id)a5;
- (id)animationForRepLayer:(id)a3 withEvent:(id)a4;
- (id)p_delayedAnimationForLayer:(id)a3 withEvent:(id)a4;
- (id)p_host;
- (void)addAdditionalChildBackgroundLayersToArray:(id)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)p_layoutLine;
- (void)p_updateGradient;
- (void)p_updateGradientColors;
- (void)p_updateLineAndShadows;
- (void)p_updateShadow;
- (void)p_updatedHovering;
- (void)screenScaleDidChange;
- (void)setLine:(id)a3;
- (void)setLineShadow:(id)a3;
- (void)setTargetShadow:(id)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)updateFromLayout;
@end

@implementation THWInteractiveImageCalloutRep

- (void)dealloc
{
  [(CAShapeLayer *)self->_line removeFromSuperlayer];

  [(CALayer *)self->_targetShadow removeFromSuperlayer];
  [(CALayer *)self->_lineShadow removeFromSuperlayer];

  [(CAGradientLayer *)self->_gradientLayer removeFromSuperlayer];
  [(CALayer *)self->_shadowLayer removeFromSuperlayer];

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutRep;
  [(THWInteractiveImageCalloutRep *)&v3 dealloc];
}

- (CGPoint)targetPoint
{
  id v2 = [self layout].calloutInfo;

  [v2 targetPoint];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)sourcePoint
{
  id v2 = [self layout].calloutInfo;

  [v2 sourcePoint];
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(THWInteractiveImageCalloutRep *)self interactiveCanvasController];
  v8 = v7;
  if (v4)
  {
    [v7 beginAnimations:@"callout opacity" context:0];
    [v8 setAnimationDuration:0.25];
    id v9 = [v8 layerForRep:self];
    double v10 = 0.0;
    if (v5) {
      *(float *)&double v10 = 1.0;
    }
    [v9 setOpacity:v10];
    [v8 commitAnimations];
  }
  else
  {
    id v11 = [v7 layerForRep:self];
    double v12 = 0.0;
    if (v5) {
      *(float *)&double v12 = 1.0;
    }
    [v11 setOpacity:v12];
  }
}

- (void)updateFromLayout
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutRep;
  [(THWInteractiveImageCalloutRep *)&v3 updateFromLayout];
  [(THWInteractiveImageCalloutRep *)self p_updateGradient];
  [(THWInteractiveImageCalloutRep *)self p_updateShadow];
  [(THWInteractiveImageCalloutRep *)self p_updateLineAndShadows];
  [(THWInteractiveImageCalloutRep *)self p_layoutLine];
}

- (void)didUpdateLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageCalloutRep;
  [(THWInteractiveImageCalloutRep *)&v4 didUpdateLayer:a3];
  [(THWInteractiveImageCalloutRep *)self p_updateGradientColors];
}

- (void)addAdditionalChildBackgroundLayersToArray:(id)a3
{
  if (self->_targetShadow) {
    [a3 addObject:];
  }
  if (self->_lineShadow) {
    [a3 addObject:];
  }
  if (self->_line) {
    [a3 addObject:];
  }
  if (self->_shadowLayer) {
    [a3 addObject:];
  }
  if (self->_gradientLayer)
  {
    [a3 addObject:];
  }
}

- (id)p_host
{
  id v3 = [(THWInteractiveImageCalloutRep *)self interactiveCanvasController];

  return [v3 ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWInteractiveImageCalloutHosting];
}

- (void)p_updatedHovering
{
  id v3 = [(THWInteractiveImageCalloutRep *)self p_host];

  [v3 interactiveImageCalloutUpdatedHovering:self];
}

- (void)screenScaleDidChange
{
  [self canvas].contentsScale
  double v4 = v3;
  -[CAGradientLayer setContentsScale:](self->_gradientLayer, "setContentsScale:");
  [(CALayer *)self->_shadowLayer setContentsScale:v4];

  [(THWInteractiveImageCalloutRep *)self p_updateLineAndShadows];
}

- (void)p_updateShadow
{
  if (self->_shadowLayer) {
    goto LABEL_3;
  }
  self->_shadowLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionGradientLayer);
  [(CALayer *)self->_shadowLayer setDelegate:[(THWInteractiveImageCalloutRep *)self interactiveCanvasController]];
  [self canvas].contentsScale;
  -[CALayer setContentsScale:](self->_shadowLayer, "setContentsScale:");
  -[CALayer setShadowOffset:](self->_shadowLayer, "setShadowOffset:", 0.0, 1.0);
  LODWORD(v3) = 1058642330;
  [(CALayer *)self->_shadowLayer setShadowOpacity:v3];
  [(CALayer *)self->_shadowLayer setShadowRadius:2.0];
  -[CALayer setShadowColor:](self->_shadowLayer, "setShadowColor:", objc_msgSend(objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "colorWithAlphaComponent:", 0.5), "CGColor"));
  if (self->_shadowLayer)
  {
LABEL_3:
    [self layout].backgroundRectTitleOnly
    -[THWInteractiveImageCalloutRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:");
    [self canvas].contentsScale;
    TSDRoundedRectForScale();
    CGFloat v42 = v5;
    CGFloat v43 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    [self layout].backgroundRect;
    -[THWInteractiveImageCalloutRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:");
    [self canvas].contentsScale
    TSDRoundedRectForScale();
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(CALayer *)self->_shadowLayer bounds];
    double v19 = v18;
    double v21 = v20;
    shadowLayer = self->_shadowLayer;
    long long v23 = *(_OWORD *)&CATransform3DIdentity.m33;
    v46[4] = *(_OWORD *)&CATransform3DIdentity.m31;
    v46[5] = v23;
    long long v24 = *(_OWORD *)&CATransform3DIdentity.m43;
    v46[6] = *(_OWORD *)&CATransform3DIdentity.m41;
    v46[7] = v24;
    long long v25 = *(_OWORD *)&CATransform3DIdentity.m13;
    v46[0] = *(_OWORD *)&CATransform3DIdentity.m11;
    v46[1] = v25;
    long long v26 = *(_OWORD *)&CATransform3DIdentity.m23;
    v46[2] = *(_OWORD *)&CATransform3DIdentity.m21;
    v46[3] = v26;
    [(CALayer *)shadowLayer setTransform:v46];
    v27 = self->_shadowLayer;
    TSDCenterOfRect();
    TSDRectWithCenterAndSize();
    -[CALayer setFrame:](v27, "setFrame:");
    [(CALayer *)self->_shadowLayer bounds];
    if (v19 != v29 || v21 != v28)
    {
      [(CALayer *)self->_shadowLayer bounds];
      TSDRectWithSize();
      CGRect v48 = CGRectInset(v47, 2.0 * -0.5, 2.0 * -0.5);
      [(CALayer *)self->_shadowLayer setShadowPath:[+[TSDBezierPath bezierPathWithRoundedRect:cornerRadius:](TSDBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v48.origin.x, v48.origin.y, v48.size.width, v48.size.height, 4.0) CGPath]];
    }
    CGFloat v31 = -(2.0 * 0.5 + 2.0);
    v49.origin.CGFloat x = v11;
    v49.origin.CGFloat y = v13;
    v49.size.CGFloat width = v15;
    v49.size.CGFloat height = v17;
    CGRect v50 = CGRectInset(v49, v31, v31);
    CGFloat x = v50.origin.x;
    CGFloat y = v50.origin.y;
    CGFloat width = v50.size.width;
    CGFloat height = v50.size.height;
    v50.origin.CGFloat y = v42;
    v50.origin.CGFloat x = v43;
    v50.size.CGFloat width = v7;
    v50.size.CGFloat height = v9;
    CGRect v51 = CGRectInset(v50, v31, v31);
    CGFloat v36 = v51.origin.x;
    CGFloat v37 = v51.origin.y;
    CGFloat v38 = v51.size.width;
    CGFloat v39 = v51.size.height;
    memset(&v45, 0, sizeof(v45));
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    double v40 = CGRectGetHeight(v51);
    v52.origin.CGFloat x = v36;
    v52.origin.CGFloat y = v37;
    v52.size.CGFloat width = v38;
    v52.size.CGFloat height = v39;
    CGFloat v41 = CGRectGetHeight(v52);
    CATransform3DMakeScale(&v45, 1.0, v40 / v41, 1.0);
    CATransform3D v44 = v45;
    [(CALayer *)self->_shadowLayer setTransform:&v44];
  }
}

- (void)p_updateGradientColors
{
  unsigned int v3 = [[self layout] highlighted];
  unsigned int v4 = [self layout].titleOnly;
  unsigned int v5 = v4;
  if (v3)
  {
    double v6 = [(THWInteractiveImageCalloutRep *)self gradientLayer];
    if (v5)
    {
      id v7 = [+[TSUColor colorWithRed:0.0 green:0.392156863 blue:0.819607843 alpha:1.0] CGColor];
      double v8 = 1.0;
      double v9 = 0.392156863;
      double v10 = 0.819607843;
LABEL_7:
      CGFloat v11 = +[TSUColor colorWithRed:0.0 green:v9 blue:v10 alpha:v8];
      goto LABEL_11;
    }
    id v7 = [+[TSUColor colorWithWhite:0.850980392 alpha:1.0] CGColor];
    double v13 = 1.0;
    double v12 = 0.850980392;
  }
  else
  {
    if (v4 && objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "selected"))
    {
      double v6 = [(THWInteractiveImageCalloutRep *)self gradientLayer];
      id v7 = [+[TSUColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0] CGColor];
      double v10 = 1.0;
      double v8 = 1.0;
      double v9 = 0.478431373;
      goto LABEL_7;
    }
    double v6 = [(THWInteractiveImageCalloutRep *)self gradientLayer];
    id v7 = [+[TSUColor colorWithWhite:1.0 alpha:1.0] CGColor];
    double v12 = 1.0;
    double v13 = 1.0;
  }
  CGFloat v11 = +[TSUColor colorWithWhite:v12 alpha:v13];
LABEL_11:
  double v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, [(TSUColor *)v11 CGColor], 0);

  [(CAGradientLayer *)v6 setColors:v14];
}

- (BOOL)p_animatingCallouts
{
  id v3 = [(THWInteractiveImageCalloutRep *)self p_host];

  return [v3 interactiveImageCalloutIsAnimating:self];
}

- (double)p_zoomDuration
{
  id v3 = [(THWInteractiveImageCalloutRep *)self p_host];

  [v3 interactiveImageCalloutZoomAnimationDuration:self];
  return result;
}

- (void)p_updateGradient
{
  if (!self->_gradientLayer)
  {
    self->_gradientLayer = (CAGradientLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionGradientLayer);
    [(CAGradientLayer *)self->_gradientLayer setDelegate:[(THWInteractiveImageCalloutRep *)self interactiveCanvasController]];
    [(CAGradientLayer *)self->_gradientLayer setLocations:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), +[NSNumber numberWithDouble:1.0], 0)];
    [(CAGradientLayer *)self->_gradientLayer setMasksToBounds:0];
    gradientLayer = self->_gradientLayer;
    [self canvas].contentsScale
    -[CAGradientLayer setContentsScale:](gradientLayer, "setContentsScale:");
    [(CAGradientLayer *)self->_gradientLayer setCornerRadius:4.0];
    [(CAGradientLayer *)self->_gradientLayer setBorderWidth:2.0];
    [(CAGradientLayer *)self->_gradientLayer setBorderColor:[+[TSUColor colorWithWhite:0.929411765 alpha:1.0] CGColor]];
    -[CAGradientLayer setAnchorPoint:](self->_gradientLayer, "setAnchorPoint:", 0.5, 0.0);
  }
  [(THWInteractiveImageCalloutRep *)self p_updateGradientColors];
  if (self->_gradientLayer)
  {
    [self layout].backgroundRect;
    -[THWInteractiveImageCalloutRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:");
    [self canvas].contentsScale;
    TSDRoundedRectForScale();
    -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
    unsigned int v4 = self->_gradientLayer;
    [(CAGradientLayer *)v4 setContentsGravity:kCAGravityBottom];
  }
}

- (id)p_delayedAnimationForLayer:(id)a3 withEvent:(id)a4
{
  if ((objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout", a3), "titleOnly") & 1) != 0
    || !objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "selected")
    || ![(THWInteractiveImageCalloutRep *)self p_animatingCallouts])
  {
    return 0;
  }
  [(THWInteractiveImageCalloutRep *)self p_zoomDuration];
  double v7 = v6;
  double v8 = -0.224999994 / v6 + 1.0;
  double v9 = +[CABasicAnimation animationWithKeyPath:a4];
  [(CABasicAnimation *)v9 setBeginTime:v7 * v8];
  [(CABasicAnimation *)v9 setBeginTimeMode:kCAAnimationRelative];
  [(CABasicAnimation *)v9 setFillMode:kCAFillModeBoth];
  [(CABasicAnimation *)v9 setDuration:v7 * (1.0 - v8)];
  return v9;
}

- (void)p_updateLineAndShadows
{
  [self canvas].viewScale
  double v4 = v3;
  unsigned int v5 = [(THWInteractiveImageCalloutRep *)self targetShadow];
  if (!v5) {
    unsigned int v5 = (CALayer *)+[TSDNoDefaultImplicitActionLayer layer];
  }
  id v6 = +[TSUImage imageNamed:@"circle-shadow" inBundle:THBundle()];
  [self canvas].contentsScale;
  double v8 = v7;
  [v5 setContents:[v6 CGImageForContentsScale:]];
  [(CALayer *)v5 setContentsScale:v8];
  [v6 size];
  double v10 = v9;
  [v6 size];
  -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, v10, v11);
  double v12 = [(THWInteractiveImageCalloutRep *)self lineShadow];
  if (!v12) {
    double v12 = (CALayer *)+[TSDNoDefaultImplicitActionLayer layer];
  }
  -[CALayer setBounds:](v12, "setBounds:", 0.0, 0.0, 10.0, 6.0);
  [v12 setShadowColor:[+[TSUColor blackColor](TSUColor, "blackColor") CGColor]];
  -[CALayer setShadowOffset:](v12, "setShadowOffset:", 0.0, 0.0);
  LODWORD(v13) = 0.5;
  [(CALayer *)v12 setShadowOpacity:v13];
  [(CALayer *)v12 setShadowRadius:v4];
  [(CALayer *)v12 bounds];
  CGRectInset(v16, -2.0, 2.0);
  TSDScaleRectAroundPoint();
  [(CALayer *)v12 setShadowPath:[+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:") CGPath]];
  [(CALayer *)v12 setMasksToBounds:1];
  double v14 = [(THWInteractiveImageCalloutRep *)self line];
  if (!v14) {
    double v14 = (CAShapeLayer *)+[TSDNoDefaultImplicitActionShapeLayer layer];
  }
  -[v14 setStrokeColor:[+[TSUColor whiteColor](TSUColor, "whiteColor") CGColor]];
  [(CAShapeLayer *)v14 setFillColor:0];
  [(CAShapeLayer *)v14 setLineWidth:v4 + v4];
  -[CAShapeLayer setBackgroundColor:](v14, "setBackgroundColor:", objc_msgSend(objc_msgSend(+[TSUColor redColor](TSUColor, "redColor"), "colorWithAlphaComponent:", 0.5), "CGColor"));
  [(THWInteractiveImageCalloutRep *)self setLine:v14];
  [(THWInteractiveImageCalloutRep *)self setTargetShadow:v5];

  [(THWInteractiveImageCalloutRep *)self setLineShadow:v12];
}

- (void)p_layoutLine
{
  id v3 = [(THWInteractiveImageCalloutRep *)self p_host];
  [(THWInteractiveImageCalloutRep *)self targetPoint];
  [v3 interactiveImageCallout:self];
  double v5 = v4;
  double v7 = v6;
  [(THWInteractiveImageCalloutRep *)self sourcePoint];
  [v3 interactiveImageCallout:self];
  double v9 = v8;
  double v11 = v10;
  -[THWInteractiveImageCalloutRep convertUnscaledPointToLayerRelative:](self, "convertUnscaledPointToLayerRelative:", v5, v7);
  double v13 = v12;
  double v15 = v14;
  -[THWInteractiveImageCalloutRep convertUnscaledPointToLayerRelative:](self, "convertUnscaledPointToLayerRelative:", v9, v11);
  CGFloat v17 = v16;
  CGFloat v60 = v18;
  [self canvas].viewScale
  double v20 = v19 * 4.0;
  CGFloat v21 = v20 + v20;
  double v22 = (v20 + v20) * 0.5;
  CGFloat v23 = v13 - v22;
  CGFloat rect = v15 - v22;
  [(THWInteractiveImageCalloutRep *)self targetPoint];
  double v25 = v24;
  [(THWInteractiveImageCalloutRep *)self sourcePoint];
  double v27 = v25 - v26;
  [(THWInteractiveImageCalloutRep *)self targetPoint];
  double v29 = v28;
  [(THWInteractiveImageCalloutRep *)self sourcePoint];
  double v31 = v29 - v30;
  double v32 = sqrt(v27 * v27 + v31 * v31);
  double v61 = v31 / v32;
  double v62 = v27 / v32;
  double v33 = v20;
  double v63 = v20;
  CGFloat v34 = v13 - v27 / v32 * v20;
  CGFloat v35 = v15 - v61 * v33;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v17, v60);
  CGPathAddLineToPoint(Mutable, 0, v34, v35);
  v70.origin.CGFloat x = v23;
  v70.origin.CGFloat y = rect;
  v70.size.CGFloat width = v21;
  v70.size.CGFloat height = v21;
  CGPathAddEllipseInRect(Mutable, 0, v70);
  long long v37 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v69.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v69.m33 = v37;
  long long v38 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v69.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v69.m43 = v38;
  long long v39 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v69.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v69.m13 = v39;
  long long v40 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v69.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v69.m23 = v40;
  *(_OWORD *)&v68.m31 = *(_OWORD *)&v69.m31;
  *(_OWORD *)&v68.m33 = v37;
  *(_OWORD *)&v68.m41 = *(_OWORD *)&v69.m41;
  *(_OWORD *)&v68.m43 = v38;
  *(_OWORD *)&v68.m11 = *(_OWORD *)&v69.m11;
  *(_OWORD *)&v68.m13 = v39;
  *(_OWORD *)&v68.m21 = *(_OWORD *)&v69.m21;
  *(_OWORD *)&v68.m23 = v40;
  CATransform3DTranslate(&v69, &v68, 0.0, 1.0, 0.0);
  CATransform3D a = v69;
  CATransform3DTranslate(&v68, &a, (v17 + v34) * 0.5, (v60 + v35) * 0.5, 0.0);
  CATransform3D v69 = v68;
  float v41 = v61;
  float v42 = v62;
  float v43 = atan2f(v41, v42);
  CATransform3D a = v69;
  CATransform3DRotate(&v68, &a, v43, 0.0, 0.0, 1.0);
  CATransform3D v69 = v68;
  TSDSubtractPoints();
  CATransform3D a = v69;
  CATransform3DScale(&v68, &a, (sqrt(v44 * v44 + v45 * v45) - v63) / 10.0, 1.0, 1.0);
  CATransform3D v69 = v68;
  if ([(THWInteractiveImageCalloutRep *)self p_animatingCallouts]
    && [(CAShapeLayer *)[(THWInteractiveImageCalloutRep *)self line] path])
  {
    v46 = CGPathRetain([(CAShapeLayer *)[(THWInteractiveImageCalloutRep *)self line] path]);
    memset(&v68, 0, sizeof(v68));
    CGRect v47 = [(THWInteractiveImageCalloutRep *)self lineShadow];
    if (v47) {
      [(CALayer *)v47 transform];
    }
    else {
      memset(&v68, 0, sizeof(v68));
    }
    [(CALayer *)[(THWInteractiveImageCalloutRep *)self targetShadow] position];
    double v50 = v49;
    double v51 = v48;
    if (v49 != v13
      || v48 != v15
      || (a = v68, CATransform3D b = v69, !CATransform3DEqualToTransform(&a, &b))
      || !CGPathEqualToPath(v46, Mutable))
    {
      [(CAShapeLayer *)[(THWInteractiveImageCalloutRep *)self line] setPath:Mutable];
      v65[1] = v69;
      v65[0] = v69;
      [(CALayer *)[(THWInteractiveImageCalloutRep *)self lineShadow] setTransform:v65];
      -[CALayer setPosition:]([(THWInteractiveImageCalloutRep *)self targetShadow], "setPosition:", v13, v15);
      [(THWInteractiveImageCalloutRep *)self p_zoomDuration];
      double v53 = v52;
      [self interactiveCanvasController].animationBeginTime;
      double v55 = v54;
      id v56 = +[CABasicAnimation animation];
      [v56 setDelegate:0];
      [v56 setKeyPath:@"path"];
      [v56 setFromValue:v46];
      [v56 setToValue:Mutable];
      [v56 setBeginTime:v55];
      [v56 setDuration:v53];
      [v56 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
      [v56 setFillMode:kCAFillModeBoth];
      [(CAShapeLayer *)[(THWInteractiveImageCalloutRep *)self line] addAnimation:v56 forKey:@"path"];
      id v57 = +[CABasicAnimation animation];
      [v57 setDelegate:0];
      [v57 setKeyPath:@"transform"];
      CATransform3D a = v68;
      [v57 setFromValue:[NSValue valueWithCATransform3D:&a]];
      CATransform3D a = v69;
      [v57 setToValue:[NSValue valueWithCATransform3D:&a]];
      [v57 setBeginTime:v55];
      [v57 setDuration:v53];
      [v57 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
      [v57 setFillMode:kCAFillModeBoth];
      [(CALayer *)[(THWInteractiveImageCalloutRep *)self lineShadow] addAnimation:v57 forKey:@"transform"];
      id v58 = +[CABasicAnimation animation];
      [v58 setDelegate:0];
      [v58 setKeyPath:@"position"];
      [v58 setFromValue:[NSValue valueWithCGPoint:v50, v51]];
      [v58 setToValue:[NSValue valueWithCGPoint:v13, v15]];
      [v58 setBeginTime:v55];
      [v58 setDuration:v53];
      [v58 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
      [v58 setFillMode:kCAFillModeBoth];
      [(CALayer *)[(THWInteractiveImageCalloutRep *)self targetShadow] addAnimation:v58 forKey:@"position"];
    }
    CGPathRelease(v46);
  }
  else
  {
    [(CAShapeLayer *)[(THWInteractiveImageCalloutRep *)self line] setPath:Mutable];
    v64[1] = v69;
    v64[0] = v69;
    [(CALayer *)[(THWInteractiveImageCalloutRep *)self lineShadow] setTransform:v64];
    -[CALayer setPosition:]([(THWInteractiveImageCalloutRep *)self targetShadow], "setPosition:", v13, v15);
  }
  CGPathRelease(Mutable);
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  objc_opt_class();
  double v5 = (void *)TSUDynamicCast();

  [v5 setDelegate:self];
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  objc_opt_class();
  double v4 = (void *)TSUDynamicCast();

  [v4 setDelegate:0];
}

- (BOOL)controlContainerMasksToBounds:(id)a3
{
  return 1;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v3 = [a3 gestureKind];
  return v3 == (id)TSWPImmediatePress;
}

- (BOOL)handleGesture:(id)a3
{
  switch([a3 gestureState])
  {
    case 1u:
      id v5 = [(THWInteractiveImageCalloutRep *)self layout];
      uint64_t v6 = 1;
      goto LABEL_8;
    case 2u:
      if (objc_msgSend(-[THWInteractiveImageCalloutRep p_host](self, "p_host"), "interactiveImageCalloutIsScrollViewDragging:", self))
      {
        objc_opt_class();
        [(id)TSUDynamicCast() cancel];
LABEL_7:
        id v5 = [(THWInteractiveImageCalloutRep *)self layout];
        uint64_t v6 = 0;
      }
      else
      {
        [a3 naturalLocationForRep:self];
        id v8 = -[THWInteractiveImageCalloutRep containsPoint:](self, "containsPoint:");
        id v5 = [(THWInteractiveImageCalloutRep *)self layout];
        uint64_t v6 = (uint64_t)v8;
      }
LABEL_8:
      [v5 setHighlighted:v6];
      return 1;
    case 3u:
      if (objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "highlighted"))
      {
        [self layout setHighlighted:0];
        [-[THWInteractiveImageCalloutRep p_host](self, "p_host") interactiveImageCalloutPressed:self];
      }
      return 1;
    case 4u:
    case 5u:
      goto LABEL_7;
    default:
      return 1;
  }
}

- (id)animationForRepLayer:(id)a3 withEvent:(id)a4
{
  if ((self->_gradientLayer != a3 || ([a4 isEqualToString:@"bounds"] & 1) == 0)
    && (self->_shadowLayer != a3
     || ([a4 isEqualToString:@"transform"] & 1) == 0
     && ![a4 isEqualToString:@"position"]))
  {
    return 0;
  }

  return [(THWInteractiveImageCalloutRep *)self p_delayedAnimationForLayer:a3 withEvent:a4];
}

- (id)animationForChildRep:(id)a3 layer:(id)a4 withEvent:(id)a5
{
  if (([a5 isEqualToString:@"bounds"] & 1) == 0
    && ![a5 isEqualToString:@"position"]
    || [a3 parentRep] != self
    || objc_msgSend(-[THWInteractiveImageCalloutRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", a3) != a4)
  {
    return 0;
  }

  return [(THWInteractiveImageCalloutRep *)self p_delayedAnimationForLayer:a4 withEvent:a5];
}

- (CAShapeLayer)line
{
  return self->_line;
}

- (void)setLine:(id)a3
{
}

- (CALayer)targetShadow
{
  return self->_targetShadow;
}

- (void)setTargetShadow:(id)a3
{
}

- (CALayer)lineShadow
{
  return self->_lineShadow;
}

- (void)setLineShadow:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (CALayer)shadowLayer
{
  return self->_shadowLayer;
}

- (BOOL)hovering
{
  return self->_hovering;
}

@end