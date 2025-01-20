@interface THWInteractiveImageSidebarRep
- (BOOL)controlContainerMasksToBounds:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)masksToBounds;
- (id)additionalLayersUnderLayer;
- (id)animationForChildRep:(id)a3 layer:(id)a4 withEvent:(id)a5;
- (id)animationForRepLayer:(id)a3 withEvent:(id)a4;
- (id)p_animationForEvent:(id)a3 duration:(double)a4 delayFactor:(double)a5 durationFactor:(double)a6;
- (id)p_calloutForRep:(id)a3;
- (id)p_host;
- (id)p_layerForCallout:(id)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)p_addFrameAnimationForLayer:(id)a3 duration:(double)a4;
- (void)p_createGradientBackgroundLayerIfNeeded;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation THWInteractiveImageSidebarRep

- (void)dealloc
{
  [(CAGradientLayer *)self->_gradientLayer setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageSidebarRep;
  [(THWInteractiveImageSidebarRep *)&v3 dealloc];
}

- (id)p_host
{
  id v3 = [(THWInteractiveImageSidebarRep *)self interactiveCanvasController];

  return [v3 ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWInteractiveImageSidebarRepHosting];
}

- (void)p_createGradientBackgroundLayerIfNeeded
{
  if (!self->_gradientLayer)
  {
    self->_gradientLayer = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    [(CAGradientLayer *)self->_gradientLayer setDelegate:[(THWInteractiveImageSidebarRep *)self interactiveCanvasController]];
    [(CAGradientLayer *)self->_gradientLayer setLocations:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), +[NSNumber numberWithDouble:1.0], 0)];
    [(CAGradientLayer *)self->_gradientLayer setColors:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.960784314, 1.0) CGColor], [+[TSUColor colorWithWhite:0.905882353 alpha:1.0] CGColor], 0)];
    [(CAGradientLayer *)self->_gradientLayer setBorderWidth:2.0];
    -[self->_gradientLayer setBorderColor:[+[TSUColor whiteColor](TSUColor, "whiteColor") CGColor]];
    -[CAGradientLayer setShadowOffset:](self->_gradientLayer, "setShadowOffset:", 0.0, 1.0);
    LODWORD(v3) = 1058642330;
    [(CAGradientLayer *)self->_gradientLayer setShadowOpacity:v3];
    gradientLayer = self->_gradientLayer;
    id v5 = [[TSUColor blackColor] CGColor];
    [(CAGradientLayer *)gradientLayer setShadowColor:v5];
  }
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (id)additionalLayersUnderLayer
{
  [(THWInteractiveImageSidebarRep *)self p_createGradientBackgroundLayerIfNeeded];
  if (!self->_gradientLayer) {
    return 0;
  }
  [(THWInteractiveImageSidebarRep *)self updateLayerGeometryFromLayout:"updateLayerGeometryFromLayout:"];
  gradientLayer = self->_gradientLayer;
  return +[NSArray arrayWithObjects:&gradientLayer count:1];
}

- (BOOL)masksToBounds
{
  return 1;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(THWInteractiveImageSidebarRep *)self interactiveCanvasController];
  if (v4)
  {
    v8 = v7;
    [v7 beginAnimations:@"sidebar visibility" context:0];
    [self p_host].interactiveImageSidebarAnimationDuration:self;
    [v8 setAnimationDuration:];
    [v8 setAnimationUseRepFiltering:1];
    [self layout].setHidden:!v5;
    [v8 layoutIfNeeded];
    [v8 commitAnimations];
  }
  else
  {
    id v9 = [(THWInteractiveImageSidebarRep *)self layout];
    [v9 setHidden:!v5];
  }
}

- (void)p_addFrameAnimationForLayer:(id)a3 duration:(double)a4
{
  [a3 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [a3 position];
  double v13 = v12;
  double v14 = -0.35 / a4 + 1.0;
  v15 = +[CABasicAnimation animationWithKeyPath:@"bounds"];
  double v16 = v14 * a4;
  [(CABasicAnimation *)v15 setBeginTime:v14 * a4];
  uint64_t v17 = kCAAnimationRelative;
  [(CABasicAnimation *)v15 setBeginTimeMode:kCAAnimationRelative];
  [(CABasicAnimation *)v15 setFillMode:kCAFillModeBoth];
  [(CABasicAnimation *)v15 setRemovedOnCompletion:1];
  double v18 = (1.0 - v14) * a4;
  [(CABasicAnimation *)v15 setDuration:v18];
  [(CABasicAnimation *)v15 setFromValue:+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v7, v9, v11, 0.0)];
  [(CABasicAnimation *)v15 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  [a3 addAnimation:v15 forKey:@"bounds"];
  v19 = +[CABasicAnimation animationWithKeyPath:@"position"];
  [(CABasicAnimation *)v19 setBeginTime:v16];
  [(CABasicAnimation *)v19 setBeginTimeMode:v17];
  [(CABasicAnimation *)v19 setFillMode:kCAFillModeBoth];
  [(CABasicAnimation *)v19 setRemovedOnCompletion:1];
  [(CABasicAnimation *)v19 setDuration:v18];
  [(CABasicAnimation *)v19 setFromValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, 0.0)];
  [(CABasicAnimation *)v19 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];

  [a3 addAnimation:v19 forKey:@"position"];
}

- (id)p_layerForCallout:(id)a3
{
  id v4 = [self layoutForCallout:a3];
  if (!v4) {
    return 0;
  }
  id v5 = [[self interactiveCanvasController] repForLayout:v4];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  id v7 = [(THWInteractiveImageSidebarRep *)self interactiveCanvasController];

  return [v7 layerForRep:v6];
}

- (void)didUpdateLayer:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)THWInteractiveImageSidebarRep;
  [(THWInteractiveImageSidebarRep *)&v13 didUpdateLayer:a3];
  unsigned int v4 = [self p_host].interactiveImageSidebarIsExpanded:self;
  id v5 = [[self interactiveCanvasController] containerLayerForRep:self];
  id v7 = v5;
  if (!v4)
  {
    LODWORD(v6) = 1064514355;
    [v5 setOpacity:v6];
    [(CAGradientLayer *)self->_gradientLayer setShadowRadius:0.0];
    [(CAGradientLayer *)self->_gradientLayer setCornerRadius:0.0];
LABEL_9:
    objc_msgSend(-[THWInteractiveImageSidebarRep p_layerForCallout:](self, "p_layerForCallout:", objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "previousCallout")), "setOpacity:", 0.0);
    goto LABEL_10;
  }
  if (objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "currentCallout"))
  {
    unsigned int v8 = [self layout].hidden;
    LODWORD(v9) = 1064514355;
    if (v8) {
      *(float *)&double v9 = 0.0;
    }
  }
  else
  {
    double v9 = 0.0;
  }
  [v7 setOpacity:v9];
  [(CAGradientLayer *)self->_gradientLayer setShadowRadius:2.0];
  [(CAGradientLayer *)self->_gradientLayer setCornerRadius:4.0];
  if (objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "currentCallout")) {
    goto LABEL_9;
  }
LABEL_10:
  [self interactiveCanvasController].animationDuration;
  if (v10 > 0.0)
  {
    double v11 = v10;
    id v12 = [-self p_layerForCallout:[self layout].currentCallout];
    if (v12) {
      [(THWInteractiveImageSidebarRep *)self p_addFrameAnimationForLayer:v12 duration:v11];
    }
  }
}

- (id)p_animationForEvent:(id)a3 duration:(double)a4 delayFactor:(double)a5 durationFactor:(double)a6
{
  double v9 = +[CABasicAnimation animationWithKeyPath:a3];
  [(CABasicAnimation *)v9 setDuration:a4 * a6];
  [(CABasicAnimation *)v9 setBeginTime:a4 * a5];
  [(CABasicAnimation *)v9 setBeginTimeMode:kCAAnimationRelative];
  [(CABasicAnimation *)v9 setFillMode:kCAFillModeBoth];
  [(CABasicAnimation *)v9 setRemovedOnCompletion:1];
  [(CABasicAnimation *)v9 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  return v9;
}

- (id)animationForRepLayer:(id)a3 withEvent:(id)a4
{
  unsigned int v7 = [-[THWInteractiveImageSidebarRep p_host](self, "p_host") interactiveImageSidebarIsExpanded:self];
  [self interactiveCanvasController].animationDuration;
  if (v8 <= 0.0) {
    return 0;
  }
  double v9 = v8;
  if (v7
    && (!objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "previousCallout")
     || !objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "currentCallout"))
    && (([a4 isEqualToString:@"bounds"] & 1) != 0
     || [a4 isEqualToString:@"position"])
    && (objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self) == a3|| self->_gradientLayer == a3))
  {
    return +[NSNull null];
  }
  else
  {
    if ((([a4 isEqualToString:@"position"] & 1) != 0
       || [a4 isEqualToString:@"bounds"])
      && (self->_gradientLayer == a3
       || objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self) == a3))
    {
      if (v7)
      {
        double v11 = 1.0 - (-0.25 / v9 + 1.0);
        id v12 = self;
        id v13 = a4;
        double v14 = v9;
        double v15 = -0.25 / v9 + 1.0;
      }
      else
      {
        double v15 = 0.0;
        id v12 = self;
        id v13 = a4;
        double v14 = v9;
        double v11 = -0.25 / v9 + 1.0;
      }
    }
    else
    {
      if (![a4 isEqualToString:@"opacity"]
        || objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "containerLayerForRep:", self) != a3)
      {
        return 0;
      }
      double v15 = -0.25 / v9 + 1.0;
      double v11 = 1.0 - v15;
      id v12 = self;
      id v13 = a4;
      double v14 = v9;
    }
    return [(THWInteractiveImageSidebarRep *)v12 p_animationForEvent:v13 duration:v14 delayFactor:v15 durationFactor:v11];
  }
}

- (id)animationForChildRep:(id)a3 layer:(id)a4 withEvent:(id)a5
{
  if (![a5 isEqualToString:@"opacity"]
    || -[THWInteractiveImageSidebarRep p_layerForCallout:](self, "p_layerForCallout:", objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "previousCallout")) != a4)
  {
    return 0;
  }
  [self interactiveCanvasController].animationDuration;

  return -[THWInteractiveImageSidebarRep p_animationForEvent:duration:delayFactor:durationFactor:](self, "p_animationForEvent:duration:delayFactor:durationFactor:", a5);
}

- (id)p_calloutForRep:(id)a3
{
  objc_opt_class();
  [a3 info];
  unsigned int v4 = (void *)TSUDynamicCast();

  return [v4 instanceData];
}

- (BOOL)controlContainerMasksToBounds:(id)a3
{
  return 1;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  objc_opt_class();
  id v5 = (void *)TSUDynamicCast();

  [v5 setDelegate:self];
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  objc_opt_class();
  unsigned int v4 = (void *)TSUDynamicCast();

  [v4 setDelegate:0];
}

@end