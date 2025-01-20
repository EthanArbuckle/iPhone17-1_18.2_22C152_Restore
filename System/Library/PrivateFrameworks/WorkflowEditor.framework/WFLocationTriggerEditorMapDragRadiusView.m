@interface WFLocationTriggerEditorMapDragRadiusView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isDragging;
- (BOOL)isMaximum;
- (BOOL)isMinimum;
- (BOOL)usesMetric;
- (CAShapeLayer)shapeLayer;
- (CGPoint)center;
- (CGPoint)maxPoint;
- (CGPoint)minPoint;
- (MKAnnotation)annotation;
- (MKMapView)mapView;
- (MKOverlay)overlay;
- (NSMeasurementFormatter)measurmentFormatter;
- (UIView)handleEndpointView;
- (WFLocationTriggerEditorMapDragRadiusView)initWithFrame:(CGRect)a3;
- (WFLocationTriggerEditorMapDragRadiusViewDelegate)delegate;
- (double)currentHandleDistance;
- (double)currentHandleDistanceNormalized;
- (double)feetToMeters:(double)a3;
- (double)maximumRadiusNormalized;
- (double)minimumInMeters;
- (double)minimumRadiusNormalized;
- (id)bezierPathWithEndPoint:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)shapeLayerWithEndPoint:(CGPoint)a3;
- (unint64_t)proximity;
- (void)addHandleForAnnotation:(id)a3 withOverlay:(id)a4;
- (void)animateHandleIn:(BOOL)a3;
- (void)drawRect:(CGRect)a3;
- (void)popAnimateHandle;
- (void)removeHandle:(BOOL)a3;
- (void)resizeCircleAfterDelay;
- (void)setAnnotation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandleEndpointView:(id)a3;
- (void)setIsDragging:(BOOL)a3;
- (void)setIsMaximum:(BOOL)a3;
- (void)setIsMinimum:(BOOL)a3;
- (void)setMapView:(id)a3;
- (void)setMeasurmentFormatter:(id)a3;
- (void)setOverlay:(id)a3;
- (void)setProximity:(unint64_t)a3;
- (void)setShapeLayer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation WFLocationTriggerEditorMapDragRadiusView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurmentFormatter, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_handleEndpointView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setMeasurmentFormatter:(id)a3
{
}

- (NSMeasurementFormatter)measurmentFormatter
{
  return self->_measurmentFormatter;
}

- (void)setIsMaximum:(BOOL)a3
{
  self->_isMaximum = a3;
}

- (BOOL)isMaximum
{
  return self->_isMaximum;
}

- (void)setIsMinimum:(BOOL)a3
{
  self->_isMinimum = a3;
}

- (BOOL)isMinimum
{
  return self->_isMinimum;
}

- (void)setShapeLayer:(id)a3
{
}

- (void)setOverlay:(id)a3
{
}

- (MKOverlay)overlay
{
  return self->_overlay;
}

- (void)setAnnotation:(id)a3
{
}

- (MKAnnotation)annotation
{
  return self->_annotation;
}

- (void)setHandleEndpointView:(id)a3
{
}

- (UIView)handleEndpointView
{
  return self->_handleEndpointView;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setMapView:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (unint64_t)proximity
{
  return self->_proximity;
}

- (void)setDelegate:(id)a3
{
}

- (WFLocationTriggerEditorMapDragRadiusViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFLocationTriggerEditorMapDragRadiusViewDelegate *)WeakRetained;
}

- (BOOL)usesMetric
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  v3 = [v2 objectForKey:*MEMORY[0x263EFF560]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (double)minimumRadiusNormalized
{
  BOOL v2 = [(WFLocationTriggerEditorMapDragRadiusView *)self usesMetric];
  double result = 328.084015;
  if (v2) {
    return 100.0;
  }
  return result;
}

- (double)maximumRadiusNormalized
{
  BOOL v2 = [(WFLocationTriggerEditorMapDragRadiusView *)self usesMetric];
  double result = 7920000.0;
  if (v2) {
    return 2414016.0;
  }
  return result;
}

- (double)currentHandleDistance
{
  v3 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
  [v3 center];
  double v5 = v4;
  double v7 = v6;

  v8 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  objc_msgSend(v8, "convertPoint:toCoordinateFromView:", self, v5, v7);
  double v10 = v9;
  double v12 = v11;

  v13 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:v10 longitude:v12];
  id v14 = objc_alloc(MEMORY[0x263F00A50]);
  v15 = [(WFLocationTriggerEditorMapDragRadiusView *)self annotation];
  [v15 coordinate];
  double v17 = v16;
  v18 = [(WFLocationTriggerEditorMapDragRadiusView *)self annotation];
  [v18 coordinate];
  v19 = objc_msgSend(v14, "initWithLatitude:longitude:", v17);

  [v13 distanceFromLocation:v19];
  double v21 = v20;

  return v21;
}

- (double)currentHandleDistanceNormalized
{
  [(WFLocationTriggerEditorMapDragRadiusView *)self currentHandleDistance];
  double v4 = v3;
  BOOL v5 = [(WFLocationTriggerEditorMapDragRadiusView *)self usesMetric];
  double v6 = v4 * 3.28083992;
  if (v5) {
    double v6 = v4;
  }
  return floor(v6 / 10.0) * 10.0;
}

- (CGPoint)maxPoint
{
  double v3 = [(WFLocationTriggerEditorMapDragRadiusView *)self annotation];
  double v4 = MEMORY[0x237DCD310]([v3 coordinate]);

  [(WFLocationTriggerEditorMapDragRadiusView *)self usesMetric];
  BOOL v5 = [(WFLocationTriggerEditorMapDragRadiusView *)self annotation];
  [v5 coordinate];
  MKMapPoint v6 = MKMapPointForCoordinate(v15);

  v16.x = v6.x + v4 * 2414016.0;
  v16.y = v6.y;
  CLLocationCoordinate2D v7 = MKCoordinateForMapPoint(v16);
  v8 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  objc_msgSend(v8, "convertCoordinate:toPointToView:", self, v7.latitude, v7.longitude);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)minPoint
{
  double v3 = [(WFLocationTriggerEditorMapDragRadiusView *)self annotation];
  double v4 = MEMORY[0x237DCD310]([v3 coordinate]);

  if ([(WFLocationTriggerEditorMapDragRadiusView *)self usesMetric]) {
    double v5 = 100.0;
  }
  else {
    double v5 = 100.000008;
  }
  MKMapPoint v6 = [(WFLocationTriggerEditorMapDragRadiusView *)self annotation];
  [v6 coordinate];
  MKMapPoint v7 = MKMapPointForCoordinate(v16);

  v17.x = v7.x + v4 * v5;
  v17.y = v7.y;
  CLLocationCoordinate2D v8 = MKCoordinateForMapPoint(v17);
  double v9 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  objc_msgSend(v9, "convertCoordinate:toPointToView:", self, v8.latitude, v8.longitude);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)resizeCircleAfterDelay
{
  [(WFLocationTriggerEditorMapDragRadiusView *)self setIsDragging:0];
  [(WFLocationTriggerEditorMapDragRadiusView *)self removeHandle:0];
  double v3 = [(WFLocationTriggerEditorMapDragRadiusView *)self annotation];
  double v4 = [(WFLocationTriggerEditorMapDragRadiusView *)self overlay];
  [(WFLocationTriggerEditorMapDragRadiusView *)self addHandleForAnnotation:v3 withOverlay:v4];

  [(WFLocationTriggerEditorMapDragRadiusView *)self setNeedsDisplay];
}

- (double)feetToMeters:(double)a3
{
  return a3 * 0.304800004;
}

- (double)minimumInMeters
{
  if ([(WFLocationTriggerEditorMapDragRadiusView *)self usesMetric]) {
    return 100.0;
  }
  [(WFLocationTriggerEditorMapDragRadiusView *)self feetToMeters:328.084015];
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  double v5 = [a3 anyObject];
  [v5 locationInView:self];
  double v7 = v6;

  [(WFLocationTriggerEditorMapDragRadiusView *)self minPoint];
  if (v7 > v8) {
    [(WFLocationTriggerEditorMapDragRadiusView *)self setIsMinimum:0];
  }
  [(WFLocationTriggerEditorMapDragRadiusView *)self maxPoint];
  if (v7 < v9) {
    [(WFLocationTriggerEditorMapDragRadiusView *)self setIsMaximum:0];
  }
  if ([(WFLocationTriggerEditorMapDragRadiusView *)self isMinimum]) {
    [(WFLocationTriggerEditorMapDragRadiusView *)self minimumInMeters];
  }
  else {
    [(WFLocationTriggerEditorMapDragRadiusView *)self currentHandleDistance];
  }
  double v11 = v10;
  if ([(WFLocationTriggerEditorMapDragRadiusView *)self isMaximum]) {
    double v11 = 2414016.0;
  }
  if ([(WFLocationTriggerEditorMapDragRadiusView *)self usesMetric]) {
    double v12 = 114.0;
  }
  else {
    double v12 = 104.0;
  }
  double v13 = [(WFLocationTriggerEditorMapDragRadiusView *)self delegate];
  double v14 = v13;
  if (v11 >= v12) {
    double v15 = v11;
  }
  else {
    double v15 = v12;
  }
  id v23 = [v13 mapRadiusView:self overlayForRadius:v15];

  if (v23)
  {
    CLLocationCoordinate2D v16 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
    MKMapPoint v17 = [(WFLocationTriggerEditorMapDragRadiusView *)self overlay];
    [v16 removeOverlay:v17];

    [(WFLocationTriggerEditorMapDragRadiusView *)self setNeedsDisplay];
    [(WFLocationTriggerEditorMapDragRadiusView *)self setOverlay:v23];
    v18 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
    v19 = [(WFLocationTriggerEditorMapDragRadiusView *)self overlay];
    [v18 addOverlay:v19];

    [(WFLocationTriggerEditorMapDragRadiusView *)self performSelector:sel_resizeCircleAfterDelay withObject:0 afterDelay:0.00999999978];
    [(WFLocationTriggerEditorMapDragRadiusView *)self popAnimateHandle];
  }
  double v20 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  [v20 setScrollEnabled:1];

  double v21 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  [v21 setZoomEnabled:1];

  v22 = [(WFLocationTriggerEditorMapDragRadiusView *)self delegate];
  [v22 mapRadiusView:self radiusDidChange:v11];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v20 = [a3 anyObject];
  [v20 locationInView:self];
  double v6 = v5;
  [(WFLocationTriggerEditorMapDragRadiusView *)self minPoint];
  double v8 = v7;
  [(WFLocationTriggerEditorMapDragRadiusView *)self maxPoint];
  if (v9 >= 0.0)
  {
    double v10 = v9;
    [(WFLocationTriggerEditorMapDragRadiusView *)self setIsMinimum:0];
    [(WFLocationTriggerEditorMapDragRadiusView *)self setIsMaximum:0];
    double v11 = v6;
    if (v6 <= v8)
    {
      [(WFLocationTriggerEditorMapDragRadiusView *)self setIsMinimum:1];
      double v11 = v8;
    }
    if (v6 >= v10)
    {
      [(WFLocationTriggerEditorMapDragRadiusView *)self setIsMaximum:1];
      double v11 = v10;
    }
    double v12 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
    objc_msgSend(v19, "setFrame:", v11 + -12.0, v14, v16, v18);

    [(WFLocationTriggerEditorMapDragRadiusView *)self setNeedsDisplay];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[WFLocationTriggerEditorMapDragRadiusView setIsDragging:](self, "setIsDragging:", 1, a4);
  double v5 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  double v6 = [(WFLocationTriggerEditorMapDragRadiusView *)self overlay];
  [v5 removeOverlay:v6];

  double v7 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  [v7 setScrollEnabled:0];

  double v8 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  [v8 setZoomEnabled:0];

  [(WFLocationTriggerEditorMapDragRadiusView *)self setNeedsDisplay];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([(WFLocationTriggerEditorMapDragRadiusView *)self isDragging]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)[v4 numberOfTouches] < 2)
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFLocationTriggerEditorMapDragRadiusView;
    BOOL v5 = [(WFLocationTriggerEditorMapDragRadiusView *)&v7 gestureRecognizerShouldBegin:v4];
  }

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  objc_super v7 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v22.origin.CGFloat x = v9 + -15.0;
  v22.origin.CGFloat y = v11 + -15.0;
  v22.size.width = v13 + 30.0;
  v22.size.height = v15 + 30.0;
  v21.CGFloat x = x;
  v21.CGFloat y = y;
  if (CGRectContainsPoint(v22, v21)
    && ([(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView],
        double v16 = objc_claimAutoreleasedReturnValue(),
        [v16 superview],
        double v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        v17))
  {
    double v18 = self;
  }
  else
  {
    double v18 = 0;
  }
  return v18;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v59[3] = *MEMORY[0x263EF8340];
  *(void *)&rect.origin.CGFloat y = self;
  *(void *)&rect.size.CGFloat width = WFLocationTriggerEditorMapDragRadiusView;
  -[CGFloat drawRect:]((objc_super *)&rect.origin.y, sel_drawRect_);
  if ([(WFLocationTriggerEditorMapDragRadiusView *)self isDragging])
  {
    [(WFLocationTriggerEditorMapDragRadiusView *)self center];
    double v9 = v8;
    double v55 = v10;
    double v11 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
    [v11 center];
    rect.origin.CGFloat x = v9;
    double v13 = v12 - v9;

    double v14 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
    [v14 center];
    double v16 = v15 - (v13 + v13);
    double v17 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
    [v17 center];
    double v19 = v18 - v13;

    id v20 = [MEMORY[0x263F825C8] clearColor];
    CGPoint v21 = [MEMORY[0x263F825C8] systemBlueColor];
    CGRect v22 = [v21 colorWithAlphaComponent:0.15];

    CurrentContext = UIGraphicsGetCurrentContext();
    if ([(WFLocationTriggerEditorMapDragRadiusView *)self proximity] == 2)
    {
      CGContextSaveGState(CurrentContext);
      v60.origin.CGFloat x = x;
      v60.origin.CGFloat y = y;
      v60.size.CGFloat width = width;
      v60.size.CGFloat height = height;
      CGContextAddRect(CurrentContext, v60);
    }
    v61.origin.CGFloat x = v16;
    v61.origin.CGFloat y = v19;
    v61.size.CGFloat width = v13 + v13;
    v61.size.CGFloat height = v13 + v13;
    CGContextAddEllipseInRect(CurrentContext, v61);
    if ([(WFLocationTriggerEditorMapDragRadiusView *)self proximity] == 2) {
      CGContextEOClip(CurrentContext);
    }
    id v24 = v22;
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v24 CGColor]);
    if ([(WFLocationTriggerEditorMapDragRadiusView *)self proximity] == 2)
    {
      v62.origin.CGFloat x = x;
      v62.origin.CGFloat y = y;
      v62.size.CGFloat width = width;
      v62.size.CGFloat height = height;
      CGContextFillRect(CurrentContext, v62);
      CGContextRestoreGState(CurrentContext);
    }
    else
    {
      CGContextFillPath(CurrentContext);
    }
    v63.origin.CGFloat x = v16;
    v63.origin.CGFloat y = v19;
    v63.size.CGFloat width = v13 + v13;
    v63.size.CGFloat height = v13 + v13;
    CGContextAddEllipseInRect(CurrentContext, v63);
    id v25 = v20;
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v25 CGColor]);
    CGContextSetLineWidth(CurrentContext, 4.0);
    CGContextStrokePath(CurrentContext);
    id v26 = [v25 colorWithAlphaComponent:0.5];
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v26 CGColor]);

    [(WFLocationTriggerEditorMapDragRadiusView *)self currentHandleDistanceNormalized];
    double v28 = v27;
    if ([(WFLocationTriggerEditorMapDragRadiusView *)self isMinimum])
    {
      [(WFLocationTriggerEditorMapDragRadiusView *)self minimumRadiusNormalized];
      double v28 = v29;
    }
    if ([(WFLocationTriggerEditorMapDragRadiusView *)self isMaximum]
      || (double v30 = (double)(unint64_t)v28,
          [(WFLocationTriggerEditorMapDragRadiusView *)self maximumRadiusNormalized],
          v31 <= v30))
    {
      [(WFLocationTriggerEditorMapDragRadiusView *)self maximumRadiusNormalized];
      double v30 = (double)(unint64_t)v32;
    }
    id v33 = objc_alloc(MEMORY[0x263F08980]);
    if ([(WFLocationTriggerEditorMapDragRadiusView *)self usesMetric]) {
      [MEMORY[0x263F08CE8] meters];
    }
    else {
    v34 = [MEMORY[0x263F08CE8] feet];
    }
    v35 = (void *)[v33 initWithDoubleValue:v34 unit:v30];

    v36 = [(WFLocationTriggerEditorMapDragRadiusView *)self measurmentFormatter];
    v37 = [v36 stringFromMeasurement:v35];

    v64.origin.CGFloat y = v55 + -16.0;
    v64.size.CGFloat height = 16.0;
    v64.origin.CGFloat x = rect.origin.x;
    v64.size.CGFloat width = v13;
    CGRect v65 = CGRectIntegral(v64);
    double v38 = v65.origin.x;
    double v39 = v65.origin.y;
    double v40 = v65.size.width;
    double v41 = v65.size.height;
    v42 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83590] addingSymbolicTraits:2 options:0];
    v43 = [MEMORY[0x263F81708] fontWithDescriptor:v42 size:0.0];
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    CGContextSetRGBFillColor(CurrentContext, 0.398999989, 0.125, 0.672999978, 1.0);
    CGContextSetRGBStrokeColor(CurrentContext, 1.0, 1.0, 1.0, 0.5);
    CGContextSetTextDrawingMode(CurrentContext, kCGTextFill);
    CGContextSetLineWidth(CurrentContext, 2.0);
    id v44 = objc_alloc_init(MEMORY[0x263F81650]);
    [v44 setAlignment:1];
    CGFloat v45 = *MEMORY[0x263F814F0];
    v59[0] = v43;
    uint64_t v46 = *MEMORY[0x263F81500];
    rect.size.CGFloat height = v45;
    uint64_t v57 = v46;
    v47 = [v24 colorWithAlphaComponent:1.0];
    uint64_t v58 = *MEMORY[0x263F81540];
    v59[1] = v47;
    v59[2] = v44;
    v48 = [NSDictionary dictionaryWithObjects:v59 forKeys:&rect.size.height count:3];

    objc_msgSend(v37, "drawWithRect:options:attributes:context:", 33, v48, 0, v38, v39 + -0.5, v40, v41);
    v49 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
    [v49 center];
    double v51 = v50;
    double v53 = v52;

    id v54 = -[WFLocationTriggerEditorMapDragRadiusView shapeLayerWithEndPoint:](self, "shapeLayerWithEndPoint:", v51, v53);
  }
}

- (void)removeHandle:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(WFLocationTriggerEditorMapDragRadiusView *)self isDragging])
  {
    if (v3)
    {
      [(WFLocationTriggerEditorMapDragRadiusView *)self setAnnotation:0];
      [(WFLocationTriggerEditorMapDragRadiusView *)self setOverlay:0];
    }
    BOOL v5 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
    [v5 removeFromSuperview];

    id v6 = [(WFLocationTriggerEditorMapDragRadiusView *)self shapeLayer];
    [v6 removeFromSuperlayer];
  }
}

- (void)addHandleForAnnotation:(id)a3 withOverlay:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(WFLocationTriggerEditorMapDragRadiusView *)self annotation];
    BOOL v9 = v8 != v7;

    [(WFLocationTriggerEditorMapDragRadiusView *)self setAnnotation:v7];
    [(WFLocationTriggerEditorMapDragRadiusView *)self setOverlay:v6];

    [(WFLocationTriggerEditorMapDragRadiusView *)self animateHandleIn:v9];
  }
}

- (void)animateHandleIn:(BOOL)a3
{
  BOOL v3 = a3;
  [(WFLocationTriggerEditorMapDragRadiusView *)self center];
  double v6 = v5;
  double v8 = v7;
  BOOL v9 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
  objc_msgSend(v9, "setCenter:", v6, v8);

  double v10 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
  [(WFLocationTriggerEditorMapDragRadiusView *)self addSubview:v10];

  double v11 = [(WFLocationTriggerEditorMapDragRadiusView *)self delegate];
  double v12 = [(WFLocationTriggerEditorMapDragRadiusView *)self overlay];
  [v11 mapRadiusView:self boundingMapRectForOverlay:v12];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v46.origin.CGFloat x = v14;
  v46.origin.CGFloat y = v16;
  v46.size.CGFloat width = v18;
  v46.size.CGFloat height = v20;
  MKCoordinateRegion v47 = MKCoordinateRegionForMapRect(v46);
  double latitude = v47.center.latitude;
  double longitude = v47.center.longitude;
  double latitudeDelta = v47.span.latitudeDelta;
  double longitudeDelta = v47.span.longitudeDelta;
  id v25 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  objc_msgSend(v25, "convertRegion:toRectToView:", self, latitude, longitude, latitudeDelta, longitudeDelta);
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  v48.origin.CGFloat x = v27;
  v48.origin.CGFloat y = v29;
  v48.size.CGFloat width = v31;
  v48.size.CGFloat height = v33;
  double v34 = floor(CGRectGetMaxX(v48));
  v35 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
  id v41 = v35;
  if (v34 - v6 >= 12.0)
  {
    [v35 setAlpha:1.0];

    [(WFLocationTriggerEditorMapDragRadiusView *)self frame];
    v45.CGFloat width = v36;
    v45.CGFloat height = v37;
    UIGraphicsBeginImageContext(v45);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    id v39 = -[WFLocationTriggerEditorMapDragRadiusView shapeLayerWithEndPoint:](self, "shapeLayerWithEndPoint:", v34, v8);
    CGContextRestoreGState(CurrentContext);
    UIGraphicsEndImageContext();
    if (v3)
    {
      double v40 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
      [v40 setDuration:0.35];
      [v40 setFromValue:&unk_26E7C1878];
      [v40 setToValue:&unk_26E7C1888];
      [(CAShapeLayer *)self->_shapeLayer addAnimation:v40 forKey:@"strokeEndAnimation"];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __60__WFLocationTriggerEditorMapDragRadiusView_animateHandleIn___block_invoke;
      v43[3] = &unk_264BFDA48;
      v43[4] = self;
      *(double *)&v43[5] = v34;
      *(double *)&v43[6] = v8;
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __60__WFLocationTriggerEditorMapDragRadiusView_animateHandleIn___block_invoke_2;
      v42[3] = &unk_264BFDA70;
      v42[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v43 animations:v42 completion:0.349999994];

      return;
    }
    id v41 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
    objc_msgSend(v41, "setCenter:", v34, v8);
  }
  else
  {
    [v35 setAlpha:0.0];
  }
}

void __60__WFLocationTriggerEditorMapDragRadiusView_animateHandleIn___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) handleEndpointView];
  objc_msgSend(v3, "setCenter:", v1, v2);
}

uint64_t __60__WFLocationTriggerEditorMapDragRadiusView_animateHandleIn___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) popAnimateHandle];
  }
  return result;
}

- (id)shapeLayerWithEndPoint:(CGPoint)a3
{
  id v4 = -[WFLocationTriggerEditorMapDragRadiusView bezierPathWithEndPoint:](self, "bezierPathWithEndPoint:", a3.x, a3.y);
  double v5 = [(WFLocationTriggerEditorMapDragRadiusView *)self shapeLayer];
  id v6 = v4;
  objc_msgSend(v5, "setPath:", objc_msgSend(v6, "CGPath"));
  double v7 = [v5 superlayer];

  if (!v7)
  {
    double v8 = [(WFLocationTriggerEditorMapDragRadiusView *)self layer];
    [v8 addSublayer:v5];
  }
  return v5;
}

- (CAShapeLayer)shapeLayer
{
  shapeLayer = self->_shapeLayer;
  if (!shapeLayer)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F15880]);
    id v5 = [MEMORY[0x263F825C8] systemBlueColor];
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));
    [v4 setLineDashPattern:&unk_26E7C1810];
    [v4 setLineCap:@"round"];
    [v4 setLineWidth:2.0];
    [v4 setStrokeStart:0.0];
    [v4 setStrokeEnd:1.0];
    [v4 setZPosition:40.0];
    [(WFLocationTriggerEditorMapDragRadiusView *)self setShapeLayer:v4];

    shapeLayer = self->_shapeLayer;
  }
  return shapeLayer;
}

- (id)bezierPathWithEndPoint:(CGPoint)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [(WFLocationTriggerEditorMapDragRadiusView *)self center];
  id v3 = [MEMORY[0x263F824C0] bezierPath];
  long long v11 = xmmword_234B79660;
  [v3 setLineDash:&v11 count:2 phase:0.0];
  [v3 setLineWidth:2.0];
  [v3 setLineCapStyle:1];
  UIRoundToViewScale();
  double v5 = v4;
  UIRoundToViewScale();
  objc_msgSend(v3, "moveToPoint:", v5, v6);
  UIRoundToViewScale();
  double v8 = v7;
  UIRoundToViewScale();
  objc_msgSend(v3, "addLineToPoint:", v8, v9);
  [v3 stroke];
  return v3;
}

- (void)popAnimateHandle
{
  double v2 = [(WFLocationTriggerEditorMapDragRadiusView *)self handleEndpointView];
  id v3 = [v2 layer];

  double v4 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
  [v4 setDuration:0.349999994];
  memset(&v33, 0, sizeof(v33));
  if (v3)
  {
    [v3 transform];
    CATransform3DScale(&v33, &v32, 0.5, 0.5, 1.0);
    memset(&v31, 0, sizeof(v31));
    [v3 transform];
    CATransform3DScale(&v31, &v30, 1.20000005, 1.20000005, 1.0);
    memset(&v29, 0, sizeof(v29));
    [v3 transform];
    CATransform3DScale(&v29, &v28, 0.899999976, 0.899999976, 1.0);
    memset(&v27, 0, sizeof(v27));
    [v3 transform];
  }
  else
  {
    memset(&v32, 0, sizeof(v32));
    CATransform3DScale(&v33, &v32, 0.5, 0.5, 1.0);
    memset(&v31, 0, sizeof(v31));
    memset(&v30, 0, sizeof(v30));
    CATransform3DScale(&v31, &v30, 1.20000005, 1.20000005, 1.0);
    memset(&v29, 0, sizeof(v29));
    memset(&v28, 0, sizeof(v28));
    CATransform3DScale(&v29, &v28, 0.899999976, 0.899999976, 1.0);
    memset(&v27, 0, sizeof(v27));
  }
  double v5 = (void *)MEMORY[0x263EFF8C0];
  CATransform3D v26 = v33;
  double v6 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v26];
  CATransform3D v26 = v31;
  double v7 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v26];
  CATransform3D v26 = v29;
  double v8 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v26];
  CATransform3D v26 = v27;
  double v9 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v26];
  double v10 = objc_msgSend(v5, "arrayWithObjects:", v6, v7, v8, v9, 0);

  [v4 setValues:v10];
  long long v11 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v12 = [NSNumber numberWithFloat:0.0];
  LODWORD(v13) = 0.5;
  double v14 = [NSNumber numberWithFloat:v13];
  LODWORD(v15) = 1063675494;
  double v16 = [NSNumber numberWithFloat:v15];
  LODWORD(v17) = 1.0;
  double v18 = [NSNumber numberWithFloat:v17];
  double v19 = objc_msgSend(v11, "arrayWithObjects:", v12, v14, v16, v18, 0);

  [v4 setKeyTimes:v19];
  double v20 = (void *)MEMORY[0x263EFF8C0];
  CGPoint v21 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  uint64_t v22 = *MEMORY[0x263F15EB8];
  id v23 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  id v24 = [MEMORY[0x263F15808] functionWithName:v22];
  id v25 = objc_msgSend(v20, "arrayWithObjects:", v21, v23, v24, 0);

  [v4 setTimingFunctions:v25];
  [v4 setFillMode:*MEMORY[0x263F15AB0]];
  [v4 setRemovedOnCompletion:0];
  [v3 addAnimation:v4 forKey:@"transform"];
}

- (CGPoint)center
{
  id v3 = [(WFLocationTriggerEditorMapDragRadiusView *)self mapView];
  double v4 = [(WFLocationTriggerEditorMapDragRadiusView *)self annotation];
  [v4 coordinate];
  objc_msgSend(v3, "convertCoordinate:toPointToView:", self);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (void)setProximity:(unint64_t)a3
{
  self->_proximitCGFloat y = a3;
  [(WFLocationTriggerEditorMapDragRadiusView *)self setHidden:a3 == 0];
}

- (WFLocationTriggerEditorMapDragRadiusView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)WFLocationTriggerEditorMapDragRadiusView;
  id v3 = -[WFLocationTriggerEditorMapDragRadiusView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 16.0, 16.0);
    [(WFLocationTriggerEditorMapDragRadiusView *)v3 setHandleEndpointView:v4];

    double v5 = [(WFLocationTriggerEditorMapDragRadiusView *)v3 handleEndpointView];
    double v6 = [v5 layer];
    [v6 setCornerRadius:8.0];

    double v7 = [MEMORY[0x263F825C8] systemBlueColor];
    double v8 = [(WFLocationTriggerEditorMapDragRadiusView *)v3 handleEndpointView];
    [v8 setBackgroundColor:v7];

    double v9 = [(WFLocationTriggerEditorMapDragRadiusView *)v3 handleEndpointView];
    double v10 = [v9 layer];
    [v10 setZPosition:50.0];

    id v11 = objc_alloc_init(MEMORY[0x263F08988]);
    [(WFLocationTriggerEditorMapDragRadiusView *)v3 setMeasurmentFormatter:v11];

    uint64_t v12 = [(WFLocationTriggerEditorMapDragRadiusView *)v3 measurmentFormatter];
    [v12 setUnitOptions:3];

    double v13 = [(WFLocationTriggerEditorMapDragRadiusView *)v3 measurmentFormatter];
    [v13 setUnitStyle:3];
  }
  return v3;
}

@end