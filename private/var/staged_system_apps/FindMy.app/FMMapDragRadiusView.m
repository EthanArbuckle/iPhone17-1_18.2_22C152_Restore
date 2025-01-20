@interface FMMapDragRadiusView
- (BOOL)isDragging;
- (BOOL)isMaximum;
- (BOOL)isMinimum;
- (BOOL)usesMetric;
- (CAShapeLayer)shapeLayer;
- (CGPoint)maxPoint;
- (CGPoint)minPoint;
- (FMMapDragRadiusView)initWithCoder:(id)a3;
- (FMMapDragRadiusView)initWithFrame:(CGRect)a3;
- (FMMapDragRadiusViewDelegate)delegate;
- (MKMapView)mapView;
- (UIImageView)handleImageView;
- (_TtC6FindMy20FMFenceMapAnnotation)annotation;
- (double)currentHandleDistance;
- (double)currentHandleDistanceNormalized;
- (double)feetToMeters:(double)a3;
- (double)maximumRadiusNormalized;
- (double)minimumInMeters;
- (double)minimumRadiusNormalized;
- (id)bezierPathWithEndPoint:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)shapeLayerWithEndPoint:(CGPoint)a3;
- (void)_axSetCustomRadius:(double)a3;
- (void)addHandleForAnnotation:(id)a3;
- (void)animateHandleIn:(BOOL)a3;
- (void)drawRect:(CGRect)a3;
- (void)handlePan:(id)a3;
- (void)hideCircleAfterDelay;
- (void)initialize;
- (void)popAnimateHandle;
- (void)removeHandle:(BOOL)a3;
- (void)setAnnotation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandleImageView:(id)a3;
- (void)setIsDragging:(BOOL)a3;
- (void)setIsMaximum:(BOOL)a3;
- (void)setIsMinimum:(BOOL)a3;
- (void)setMapView:(id)a3;
- (void)setShapeLayer:(id)a3;
@end

@implementation FMMapDragRadiusView

- (void)initialize
{
  id v3 = objc_alloc((Class)UIImageView);
  v4 = +[UIImage imageNamed:@"FenceMapDragHandle"];
  v5 = +[UIColor fmfOrangeColor];
  v6 = [v4 tintedImageWithColor:v5];
  v7 = +[UIImage imageNamed:@"FenceMapDragHandle"];
  v8 = +[UIColor fmfOrangeColor];
  v9 = [v7 tintedImageWithColor:v8];
  id v10 = [v3 initWithImage:v6 highlightedImage:v9];
  [(FMMapDragRadiusView *)self setHandleImageView:v10];

  v11 = [(FMMapDragRadiusView *)self handleImageView];
  v12 = [v11 layer];
  [v12 setZPosition:50.0];

  id v13 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"handlePan:"];
  [(FMMapDragRadiusView *)self addGestureRecognizer:v13];
}

- (FMMapDragRadiusView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMMapDragRadiusView;
  id v3 = [(FMMapDragRadiusView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(FMMapDragRadiusView *)v3 initialize];
  }
  return v4;
}

- (FMMapDragRadiusView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMMapDragRadiusView;
  id v3 = -[FMMapDragRadiusView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(FMMapDragRadiusView *)v3 initialize];
  }
  return v4;
}

- (void)popAnimateHandle
{
  v2 = [(FMMapDragRadiusView *)self handleImageView];
  id v3 = [v2 layer];

  v4 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
  [v4 setDuration:0.349999994];
  memset(&v29, 0, sizeof(v29));
  if (v3)
  {
    [v3 transform];
    CATransform3DScale(&v29, &v28, 0.5, 0.5, 1.0);
    memset(&v27, 0, sizeof(v27));
    [v3 transform];
    CATransform3DScale(&v27, &v26, 1.20000005, 1.20000005, 1.0);
    memset(&v25, 0, sizeof(v25));
    [v3 transform];
    CATransform3DScale(&v25, &v24, 0.899999976, 0.899999976, 1.0);
    memset(&v23, 0, sizeof(v23));
    [v3 transform];
  }
  else
  {
    memset(&v28, 0, sizeof(v28));
    CATransform3DScale(&v29, &v28, 0.5, 0.5, 1.0);
    memset(&v27, 0, sizeof(v27));
    memset(&v26, 0, sizeof(v26));
    CATransform3DScale(&v27, &v26, 1.20000005, 1.20000005, 1.0);
    memset(&v25, 0, sizeof(v25));
    memset(&v24, 0, sizeof(v24));
    CATransform3DScale(&v25, &v24, 0.899999976, 0.899999976, 1.0);
    memset(&v23, 0, sizeof(v23));
  }
  CATransform3D v22 = v29;
  v5 = +[NSValue valueWithCATransform3D:&v22];
  CATransform3D v22 = v27;
  objc_super v6 = +[NSValue valueWithCATransform3D:&v22];
  CATransform3D v22 = v25;
  v7 = +[NSValue valueWithCATransform3D:&v22];
  CATransform3D v22 = v23;
  v8 = +[NSValue valueWithCATransform3D:&v22];
  v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, v6, v7, v8, 0);

  [v4 setValues:v9];
  id v10 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v11) = 0.5;
  v12 = +[NSNumber numberWithFloat:v11];
  LODWORD(v13) = *(_DWORD *)"fff?";
  v14 = +[NSNumber numberWithFloat:v13];
  LODWORD(v15) = 1.0;
  v16 = +[NSNumber numberWithFloat:v15];
  v17 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v12, v14, v16, 0);

  [v4 setKeyTimes:v17];
  v18 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v19 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  v20 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, v19, v20, 0);

  [v4 setTimingFunctions:v21];
  [v4 setFillMode:kCAFillModeForwards];
  [v4 setRemovedOnCompletion:0];
  [v3 addAnimation:v4 forKey:@"transform"];
}

- (id)bezierPathWithEndPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v6 = [(FMMapDragRadiusView *)self mapView];
  v7 = [(FMMapDragRadiusView *)self annotation];
  [v7 coordinate];
  [v6 convertCoordinate:self toPointToView:self];
  double v9 = v8;
  double v11 = v10;

  v12 = +[UIBezierPath bezierPath];
  long long v14 = xmmword_100559DC0;
  [v12 setLineDash:&v14 count:2 phase:0.0];
  [v12 setLineWidth:2.0];
  [v12 setLineCapStyle:1];
  [v12 moveToPoint:floor(v9), floor(v11)];
  [v12 addLineToPoint:floor(x), floor(y)];
  [v12 stroke];

  return v12;
}

- (CAShapeLayer)shapeLayer
{
  shapeLayer = self->_shapeLayer;
  if (!shapeLayer)
  {
    id v4 = objc_alloc_init((Class)CAShapeLayer);
    id v5 = +[UIColor fmfOrangeColor];
    [v4 setStrokeColor:[v5 CGColor]];
    id v6 = +[UIColor clearColor];
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v6, "CGColor"));

    [v4 setLineDashPattern:&off_100646868];
    [v4 setLineCap:@"round"];
    [v4 setLineWidth:2.0];
    [v4 setStrokeStart:0.0];
    [v4 setStrokeEnd:1.0];
    [v4 setZPosition:40.0];
    [(FMMapDragRadiusView *)self setShapeLayer:v4];

    shapeLayer = self->_shapeLayer;
  }

  return shapeLayer;
}

- (id)shapeLayerWithEndPoint:(CGPoint)a3
{
  id v4 = -[FMMapDragRadiusView bezierPathWithEndPoint:](self, "bezierPathWithEndPoint:", a3.x, a3.y);
  id v5 = [(FMMapDragRadiusView *)self shapeLayer];
  id v6 = v4;
  [v5 setPath:[v6 CGPath]];
  v7 = [v5 superlayer];

  if (!v7)
  {
    double v8 = [(FMMapDragRadiusView *)self layer];
    [v8 addSublayer:v5];
  }

  return v5;
}

- (void)animateHandleIn:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FMMapDragRadiusView *)self annotation];
  id v6 = [v5 overlay];
  [v6 boundingMapRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(FMMapDragRadiusView *)self mapView];
  [v15 visibleMapRect];
  v63.origin.double x = v16;
  v63.origin.double y = v17;
  v63.size.width = v18;
  v63.size.height = v19;
  v58.origin.double x = v8;
  v58.origin.double y = v10;
  v58.size.width = v12;
  v58.size.height = v14;
  BOOL v20 = MKMapRectIntersectsRect(v58, v63);

  if (v20)
  {
    v21 = [(FMMapDragRadiusView *)self mapView];
    CATransform3D v22 = [(FMMapDragRadiusView *)self annotation];
    [v22 coordinate];
    [v21 convertCoordinate:self toPointToView:self];
    double v24 = v23;
    double v26 = v25;

    CATransform3D v27 = [(FMMapDragRadiusView *)self handleImageView];
    [v27 setCenter:floor(v24), floor(v26)];

    CATransform3D v28 = [(FMMapDragRadiusView *)self handleImageView];
    [(FMMapDragRadiusView *)self addSubview:v28];

    CATransform3D v29 = [(FMMapDragRadiusView *)self annotation];
    v30 = [v29 overlay];
    [v30 boundingMapRect];
    MKCoordinateRegion v60 = MKCoordinateRegionForMapRect(v59);
    double latitude = v60.center.latitude;
    double longitude = v60.center.longitude;
    double latitudeDelta = v60.span.latitudeDelta;
    double longitudeDelta = v60.span.longitudeDelta;

    v35 = [(FMMapDragRadiusView *)self mapView];
    [v35 convertRegion:self toRectToView:latitude, longitude, latitudeDelta, longitudeDelta];
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;

    v61.origin.double x = v37;
    v61.origin.double y = v39;
    v61.size.width = v41;
    v61.size.height = v43;
    double v44 = floor(CGRectGetMaxX(v61));
    v62.origin.double x = v37;
    v62.origin.double y = v39;
    v62.size.width = v41;
    v62.size.height = v43;
    double MidY = CGRectGetMidY(v62);
    v46 = [(FMMapDragRadiusView *)self handleImageView];
    id v53 = v46;
    if (v44 - v24 >= 12.0)
    {
      double v47 = floor(MidY);
      [v46 setAlpha:1.0];

      [(FMMapDragRadiusView *)self frame];
      v57.width = v48;
      v57.height = v49;
      UIGraphicsBeginImageContext(v57);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      id v51 = -[FMMapDragRadiusView shapeLayerWithEndPoint:](self, "shapeLayerWithEndPoint:", v44, v47);
      CGContextRestoreGState(CurrentContext);
      UIGraphicsEndImageContext();
      if (v3)
      {
        v52 = +[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        [v52 setDuration:0.35];
        [v52 setFromValue:&off_100646880];
        [v52 setToValue:&off_100646890];
        [(CAShapeLayer *)self->_shapeLayer addAnimation:v52 forKey:@"strokeEndAnimation"];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10006D040;
        v55[3] = &unk_10061EC80;
        v55[4] = self;
        *(double *)&v55[5] = v44;
        *(double *)&v55[6] = v47;
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_10006D098;
        v54[3] = &unk_10061ECA8;
        v54[4] = self;
        +[UIView animateWithDuration:v55 animations:v54 completion:0.349999994];

        return;
      }
      id v53 = [(FMMapDragRadiusView *)self handleImageView];
      [v53 setCenter:v44, v47];
    }
    else
    {
      [v46 setAlpha:0.0];
    }
  }
}

- (void)addHandleForAnnotation:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = [(FMMapDragRadiusView *)self isDragging];
  id v5 = v9;
  if (v9)
  {
    if ((v4 & 1) == 0)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v5 = v9;
      if (isKindOfClass)
      {
        id v7 = [(FMMapDragRadiusView *)self annotation];
        BOOL v8 = v7 != v9;

        [(FMMapDragRadiusView *)self setAnnotation:v9];
        [(FMMapDragRadiusView *)self animateHandleIn:v8];
        id v5 = v9;
      }
    }
  }
}

- (void)removeHandle:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(FMMapDragRadiusView *)self isDragging])
  {
    if (v3)
    {
      id v5 = [(FMMapDragRadiusView *)self annotation];
      [v5 setDidZoomOnSelection:0];

      [(FMMapDragRadiusView *)self setAnnotation:0];
    }
    id v6 = [(FMMapDragRadiusView *)self handleImageView];
    [v6 removeFromSuperview];

    id v7 = [(FMMapDragRadiusView *)self shapeLayer];
    [v7 removeFromSuperlayer];
  }

  [(FMMapDragRadiusView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  v52.receiver = self;
  v52.super_class = (Class)FMMapDragRadiusView;
  -[FMMapDragRadiusView drawRect:](&v52, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if ([(FMMapDragRadiusView *)self isDragging])
  {
    unsigned __int8 v4 = [(FMMapDragRadiusView *)self mapView];
    id v5 = [(FMMapDragRadiusView *)self annotation];
    [v5 coordinate];
    [v4 convertCoordinate:self toPointToView:self];
    double v7 = v6;
    double v9 = v8;

    double v10 = [(FMMapDragRadiusView *)self handleImageView];
    [v10 center];
    double v12 = v11 - v7;

    double v13 = [(FMMapDragRadiusView *)self handleImageView];
    [v13 center];
    CGFloat v15 = v14 - (v12 + v12);
    double v16 = [(FMMapDragRadiusView *)self handleImageView];
    [v16 center];
    CGFloat v18 = v17 - v12;

    double v19 = +[UIColor fmfOrangeColor];
    BOOL v20 = +[UIColor fmfOverlayColor];
    CurrentContext = UIGraphicsGetCurrentContext();
    v55.origin.double x = v15;
    v55.origin.double y = v18;
    v55.size.double width = v12 + v12;
    v55.size.double height = v12 + v12;
    CGContextAddEllipseInRect(CurrentContext, v55);
    id v22 = v20;
    Components = CGColorGetComponents((CGColorRef)[v22 CGColor]);
    CGContextSetFillColor(CurrentContext, Components);
    CGContextFillPath(CurrentContext);
    v56.origin.double x = v15;
    v56.origin.double y = v18;
    v56.size.double width = v12 + v12;
    v56.size.double height = v12 + v12;
    CGContextAddEllipseInRect(CurrentContext, v56);
    id v24 = v19;
    double v25 = CGColorGetComponents((CGColorRef)[v24 CGColor]);
    CGContextSetStrokeColor(CurrentContext, v25);
    CGContextSetLineWidth(CurrentContext, 3.0);
    CGContextStrokePath(CurrentContext);
    id v26 = [v24 colorWithAlphaComponent:0.5];
    CATransform3D v27 = CGColorGetComponents((CGColorRef)[v26 CGColor]);
    CGContextSetStrokeColor(CurrentContext, v27);

    [(FMMapDragRadiusView *)self currentHandleDistanceNormalized];
    double v29 = v28;
    if ([(FMMapDragRadiusView *)self isMinimum])
    {
      [(FMMapDragRadiusView *)self minimumRadiusNormalized];
      double v29 = v30;
    }
    if ([(FMMapDragRadiusView *)self isMaximum]
      || ([(FMMapDragRadiusView *)self maximumRadiusNormalized],
          v31 <= (double)(unint64_t)v29))
    {
      [(FMMapDragRadiusView *)self maximumRadiusNormalized];
      unint64_t v32 = (unint64_t)v33;
    }
    else
    {
      unint64_t v32 = (unint64_t)v29;
    }
    v34 = +[NSNumber numberWithUnsignedInteger:v32];
    v35 = +[NSNumberFormatter localizedStringFromNumber:v34 numberStyle:1];

    if ([(FMMapDragRadiusView *)self usesMetric]) {
      double v36 = @"METERS";
    }
    else {
      double v36 = @"FEET";
    }
    CGFloat v37 = sub_10006AB54(v36);
    double v38 = +[NSString stringWithFormat:@"%@ %@", v35, v37];

    v57.origin.double y = v9 + -16.0;
    v57.size.double width = v12 + -14.0;
    v57.size.double height = 16.0;
    v57.origin.double x = v7;
    CGRect v58 = CGRectIntegral(v57);
    double x = v58.origin.x;
    double y = v58.origin.y;
    double width = v58.size.width;
    double height = v58.size.height;
    [v24 set];
    CGFloat v43 = +[UIFont boldSystemFontOfSize:12.0];
    [v24 set];
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    CGContextSetRGBFillColor(CurrentContext, 0.937254906, 0.56078434, 0.0784313753, 1.0);
    CGContextSetRGBStrokeColor(CurrentContext, 1.0, 1.0, 1.0, 0.5);
    CGContextSetTextDrawingMode(CurrentContext, kCGTextFill);
    CGContextSetLineWidth(CurrentContext, 2.0);
    id v44 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v44 setAlignment:1];
    [v44 setLineBreakMode:4];
    v53[0] = NSFontAttributeName;
    v53[1] = NSForegroundColorAttributeName;
    v54[0] = v43;
    v54[1] = v24;
    v53[2] = NSParagraphStyleAttributeName;
    v54[2] = v44;
    v45 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];
    [v38 drawInRect:v45 withAttributes:x, y, width, height];

    v46 = [(FMMapDragRadiusView *)self handleImageView];
    [v46 center];
    double v48 = v47;
    double v50 = v49;

    id v51 = -[FMMapDragRadiusView shapeLayerWithEndPoint:](self, "shapeLayerWithEndPoint:", v48, v50);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = [(FMMapDragRadiusView *)self handleImageView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v22.origin.CGFloat x = v9 + -15.0;
  v22.origin.CGFloat y = v11 + -15.0;
  v22.size.double width = v13 + 30.0;
  v22.size.double height = v15 + 30.0;
  v21.CGFloat x = x;
  v21.CGFloat y = y;
  if (CGRectContainsPoint(v22, v21)
    && ([(FMMapDragRadiusView *)self handleImageView],
        double v16 = objc_claimAutoreleasedReturnValue(),
        [v16 superview],
        double v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        v17))
  {
    CGFloat v18 = self;
  }
  else
  {
    CGFloat v18 = 0;
  }

  return v18;
}

- (void)handlePan:(id)a3
{
  id v29 = a3;
  unsigned __int8 v4 = (char *)[v29 state];
  if ((unint64_t)(v4 - 3) < 2)
  {
    double v7 = [(FMMapDragRadiusView *)self handleImageView];
    [v7 setHighlighted:0];

    [v29 locationInView:self];
    double v9 = v8;
    [(FMMapDragRadiusView *)self minPoint];
    if (v9 > v10) {
      [(FMMapDragRadiusView *)self setIsMinimum:0];
    }
    [(FMMapDragRadiusView *)self maxPoint];
    if (v9 < v11) {
      [(FMMapDragRadiusView *)self setIsMaximum:0];
    }
    if ([(FMMapDragRadiusView *)self isMinimum]) {
      [(FMMapDragRadiusView *)self minimumInMeters];
    }
    else {
      [(FMMapDragRadiusView *)self currentHandleDistance];
    }
    double v26 = v12;
    if ([(FMMapDragRadiusView *)self isMaximum]) {
      double v26 = 241401.0;
    }
    CATransform3D v27 = [(FMMapDragRadiusView *)self annotation];
    [v27 setCustomRadius:v26];

    [(FMMapDragRadiusView *)self performSelector:"hideCircleAfterDelay" withObject:0 afterDelay:0.05];
    double v28 = [(FMMapDragRadiusView *)self delegate];
    [v28 didStopDraggingHandle:self];

    [(FMMapDragRadiusView *)self popAnimateHandle];
LABEL_21:
    [(FMMapDragRadiusView *)self setNeedsDisplay];
    goto LABEL_22;
  }
  if (v4 == (char *)2)
  {
    [v29 locationInView:self];
    double v14 = v13;
    [(FMMapDragRadiusView *)self minPoint];
    double v16 = v15;
    [(FMMapDragRadiusView *)self maxPoint];
    if (v17 < 0.0) {
      goto LABEL_22;
    }
    double v18 = v17;
    [(FMMapDragRadiusView *)self setIsMinimum:0];
    [(FMMapDragRadiusView *)self setIsMaximum:0];
    CGFloat v19 = v14;
    if (v14 <= v16)
    {
      [(FMMapDragRadiusView *)self setIsMinimum:1];
      CGFloat v19 = v16;
    }
    if (v14 >= v18)
    {
      [(FMMapDragRadiusView *)self setIsMaximum:1];
      CGFloat v19 = v18;
    }
    BOOL v20 = [(FMMapDragRadiusView *)self handleImageView];
    [v20 frame];
    v31.size.double width = 24.0;
    v31.size.double height = 24.0;
    v31.origin.double x = v19;
    CGRect v32 = CGRectIntegral(v31);
    double x = v32.origin.x;
    double y = v32.origin.y;
    double width = v32.size.width;
    double height = v32.size.height;
    double v25 = [(FMMapDragRadiusView *)self handleImageView];
    [v25 setFrame:x, y, width, height];

    goto LABEL_21;
  }
  if (v4 == (char *)1)
  {
    [(FMMapDragRadiusView *)self setIsDragging:1];
    id v5 = [(FMMapDragRadiusView *)self handleImageView];
    [v5 setHighlighted:1];

    [(FMMapDragRadiusView *)self setNeedsDisplay];
    double v6 = [(FMMapDragRadiusView *)self delegate];
    [v6 willStartDraggingHandle:self];
  }
LABEL_22:
}

- (void)_axSetCustomRadius:(double)a3
{
  id v4 = [(FMMapDragRadiusView *)self annotation];
  [v4 setCustomRadius:a3];
}

- (double)minimumInMeters
{
  if ([(FMMapDragRadiusView *)self usesMetric]) {
    return 100.0;
  }

  [(FMMapDragRadiusView *)self feetToMeters:300.0];
  return result;
}

- (double)feetToMeters:(double)a3
{
  return a3 * 0.3048;
}

- (void)hideCircleAfterDelay
{
  [(FMMapDragRadiusView *)self setIsDragging:0];

  [(FMMapDragRadiusView *)self setNeedsDisplay];
}

- (CGPoint)minPoint
{
  BOOL v3 = [(FMMapDragRadiusView *)self annotation];
  [v3 coordinate];
  double v5 = MKMapPointsPerMeterAtLatitude(v4);

  if ([(FMMapDragRadiusView *)self usesMetric]) {
    double v6 = 100.0;
  }
  else {
    double v6 = 91.44;
  }
  double v7 = [(FMMapDragRadiusView *)self annotation];
  [v7 coordinate];
  MKMapPoint v8 = MKMapPointForCoordinate(v17);

  v18.double x = v8.x + v5 * v6;
  v18.double y = v8.y;
  CLLocationCoordinate2D v9 = MKCoordinateForMapPoint(v18);
  double v10 = [(FMMapDragRadiusView *)self mapView];
  [v10 convertCoordinate:self toPointToView:v9.latitude, v9.longitude];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)maxPoint
{
  BOOL v3 = [(FMMapDragRadiusView *)self annotation];
  [v3 coordinate];
  double v5 = MKMapPointsPerMeterAtLatitude(v4);

  if ([(FMMapDragRadiusView *)self usesMetric]) {
    double v6 = 241401.0;
  }
  else {
    double v6 = 241401.6;
  }
  double v7 = [(FMMapDragRadiusView *)self annotation];
  [v7 coordinate];
  MKMapPoint v8 = MKMapPointForCoordinate(v17);

  v18.double x = v8.x + v5 * v6;
  v18.double y = v8.y;
  CLLocationCoordinate2D v9 = MKCoordinateForMapPoint(v18);
  double v10 = [(FMMapDragRadiusView *)self mapView];
  [v10 convertCoordinate:self toPointToView:v9.latitude, v9.longitude];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (double)currentHandleDistanceNormalized
{
  [(FMMapDragRadiusView *)self currentHandleDistance];
  double v4 = v3;
  unsigned int v5 = [(FMMapDragRadiusView *)self usesMetric];
  double v6 = v4 * 3.28084;
  if (v5) {
    double v6 = v4;
  }
  return floor(v6 / 10.0) * 10.0;
}

- (double)currentHandleDistance
{
  double v3 = [(FMMapDragRadiusView *)self handleImageView];
  [v3 center];
  double v5 = v4;
  double v7 = v6;

  MKMapPoint v8 = [(FMMapDragRadiusView *)self mapView];
  [v8 convertPoint:self toCoordinateFromView:v5];
  double v10 = v9;
  double v12 = v11;

  id v13 = [objc_alloc((Class)CLLocation) initWithLatitude:v10 longitude:v12];
  id v14 = objc_alloc((Class)CLLocation);
  double v15 = [(FMMapDragRadiusView *)self annotation];
  [v15 coordinate];
  double v17 = v16;
  MKMapPoint v18 = [(FMMapDragRadiusView *)self annotation];
  [v18 coordinate];
  id v19 = [v14 initWithLatitude:v17];

  [v13 distanceFromLocation:v19];
  double v21 = v20;

  return v21;
}

- (double)maximumRadiusNormalized
{
  unsigned int v2 = [(FMMapDragRadiusView *)self usesMetric];
  double result = 792000.0;
  if (v2) {
    return 241401.0;
  }
  return result;
}

- (double)minimumRadiusNormalized
{
  unsigned int v2 = [(FMMapDragRadiusView *)self usesMetric];
  double result = 300.0;
  if (v2) {
    return 100.0;
  }
  return result;
}

- (BOOL)usesMetric
{
  id v2 = objc_alloc_init((Class)FMDistanceCalculator);
  BOOL v3 = [v2 measurementSystem] == (id)2;

  return v3;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (_TtC6FindMy20FMFenceMapAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (FMMapDragRadiusViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FMMapDragRadiusViewDelegate *)a3;
}

- (UIImageView)handleImageView
{
  return self->_handleImageView;
}

- (void)setHandleImageView:(id)a3
{
}

- (void)setShapeLayer:(id)a3
{
}

- (BOOL)isMinimum
{
  return self->_isMinimum;
}

- (void)setIsMinimum:(BOOL)a3
{
  self->_isMinimum = a3;
}

- (BOOL)isMaximum
{
  return self->_isMaximum;
}

- (void)setIsMaximum:(BOOL)a3
{
  self->_isMaximum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_handleImageView, 0);
  objc_storeStrong((id *)&self->_annotation, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end