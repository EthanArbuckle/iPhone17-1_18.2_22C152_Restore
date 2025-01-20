@interface TTRIReminderLocationPickerMapDragRadiusView
- (BOOL)_usesMetric;
- (BOOL)isAccessibilityElement;
- (BOOL)isDragging;
- (BOOL)isMaximum;
- (BOOL)isMinimum;
- (BOOL)isOpaque;
- (CAShapeLayer)shapeLayer;
- (CGPoint)_maxPoint;
- (CGPoint)_minPoint;
- (CGPoint)_pointForRadius:(double)a3;
- (CGPoint)initialHandleCenterForDraggin;
- (CGRect)accessibilityFrame;
- (CLCircularRegion)region;
- (MKMapView)mapView;
- (NSMeasurementFormatter)measurementFormatter;
- (TTRIReminderLocationPickerMapDragRadiusView)initWithCoder:(id)a3;
- (TTRIReminderLocationPickerMapDragRadiusView)initWithFrame:(CGRect)a3 mapView:(id)a4;
- (TTRIReminderLocationPickerMapDragRadiusViewDelegate)delegate;
- (TTRIWorldBoundingMKCircle)overlay;
- (UIColor)circleColor;
- (UIColor)handleColor;
- (UIImageView)handleImageView;
- (double)_currentHandleDistance;
- (double)_radiusForPoint:(CGPoint)a3;
- (double)_ttriAccessibilityRadiusByAdding:(double)a3;
- (double)_ttriAccessibilityRadiusIncrement;
- (double)maximumRadius;
- (double)minimumRadius;
- (double)radius;
- (double)radiusPaddingMultiplier;
- (id)_bezierPathWithEndPoint:(CGPoint)a3;
- (id)_currentHandleDistanceMeasurement;
- (id)_measurementFor:(double)a3 fromUnit:(id)a4 toUnit:(id)a5 normalized:(BOOL)a6;
- (id)_shapeLayerWithEndPoint:(CGPoint)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)_animateHandleIn:(BOOL)a3;
- (void)_centerAndZoomToFitRegion:(id)a3 animated:(BOOL)a4;
- (void)_hideCircleAfterDelay;
- (void)_popAnimateHandle;
- (void)_removeHandle;
- (void)_updateHandleImageView;
- (void)_updateHandleImageViewWithPoint:(CGPoint)a3;
- (void)_updateRegionWithPoint:(CGPoint)a3;
- (void)_updateRegionWithRadius:(double)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)drawRect:(CGRect)a3;
- (void)handlePanGesture:(id)a3;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)setCircleColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandleColor:(id)a3;
- (void)setHandleImageView:(id)a3;
- (void)setInitialHandleCenterForDraggin:(CGPoint)a3;
- (void)setIsDragging:(BOOL)a3;
- (void)setIsMaximum:(BOOL)a3;
- (void)setIsMinimum:(BOOL)a3;
- (void)setMapView:(id)a3;
- (void)setMaximumRadius:(double)a3;
- (void)setMeasurementFormatter:(id)a3;
- (void)setMinimumRadius:(double)a3;
- (void)setOverlay:(id)a3;
- (void)setRadiusPaddingMultiplier:(double)a3;
- (void)setRegion:(id)a3;
- (void)setShapeLayer:(id)a3;
- (void)startEditingRegion:(id)a3;
- (void)stopEditing;
@end

@implementation TTRIReminderLocationPickerMapDragRadiusView

- (TTRIReminderLocationPickerMapDragRadiusView)initWithCoder:(id)a3
{
  return 0;
}

- (TTRIReminderLocationPickerMapDragRadiusView)initWithFrame:(CGRect)a3 mapView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TTRIReminderLocationPickerMapDragRadiusView;
  v11 = -[TTRIReminderLocationPickerMapDragRadiusView initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    [MEMORY[0x1E4F94CD0] minimumRegionMonitoringDistance];
    v11->_minimumRadius = v12;
    v11->_maximumRadius = 241401.0;
    v11->_radiusPaddingMultiplier = 3.5;
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    handleImageView = v11->_handleImageView;
    v11->_handleImageView = (UIImageView *)v13;

    v15 = [(UIImageView *)v11->_handleImageView layer];
    [v15 setZPosition:50.0];

    objc_storeStrong((id *)&v11->_mapView, a4);
    v16 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x1E4F28E30]);
    measurementFormatter = v11->_measurementFormatter;
    v11->_measurementFormatter = v16;

    if ([(TTRIReminderLocationPickerMapDragRadiusView *)v11 _usesMetric]) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 2;
    }
    [(NSMeasurementFormatter *)v11->_measurementFormatter setUnitOptions:v18];
    v19 = [(NSMeasurementFormatter *)v11->_measurementFormatter numberFormatter];
    [v19 setMinimumFractionDigits:0];

    v20 = [(NSMeasurementFormatter *)v11->_measurementFormatter numberFormatter];
    [v20 setMaximumFractionDigits:1];

    uint64_t v21 = [MEMORY[0x1E4FB1618] blueColor];
    circleColor = v11->_circleColor;
    v11->_circleColor = (UIColor *)v21;

    uint64_t v23 = [MEMORY[0x1E4FB1618] blueColor];
    handleColor = v11->_handleColor;
    v11->_handleColor = (UIColor *)v23;

    [(TTRIReminderLocationPickerMapDragRadiusView *)v11 _updateHandleImageView];
    v25 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v11 action:sel_handlePanGesture_];
    [(TTRIReminderLocationPickerMapDragRadiusView *)v11 addGestureRecognizer:v25];
  }
  return v11;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  v46[3] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)TTRIReminderLocationPickerMapDragRadiusView;
  -[TTRIReminderLocationPickerMapDragRadiusView drawRect:](&v44, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if ([(TTRIReminderLocationPickerMapDragRadiusView *)self isDragging])
  {
    v4 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
    v5 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
    [v5 center];
    objc_msgSend(v4, "convertCoordinate:toPointToView:", self);
    double v7 = v6;
    double v9 = v8;

    id v10 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [v10 center];
    double v12 = v11 - v7;

    uint64_t v13 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [v13 center];
    CGFloat v15 = v14 - (v12 + v12);
    v16 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [v16 center];
    CGFloat v18 = v17 - v12;

    v19 = [(TTRIReminderLocationPickerMapDragRadiusView *)self circleColor];
    v20 = [(TTRIReminderLocationPickerMapDragRadiusView *)self circleColor];
    uint64_t v21 = [v20 colorWithAlphaComponent:0.15];

    CurrentContext = UIGraphicsGetCurrentContext();
    v47.origin.double x = v15;
    v47.origin.double y = v18;
    v47.size.double width = v12 + v12;
    v47.size.double height = v12 + v12;
    CGContextAddEllipseInRect(CurrentContext, v47);
    id v23 = v21;
    Components = CGColorGetComponents((CGColorRef)[v23 CGColor]);
    CGContextSetFillColor(CurrentContext, Components);
    CGContextFillPath(CurrentContext);
    v48.origin.double x = v15;
    v48.origin.double y = v18;
    v48.size.double width = v12 + v12;
    v48.size.double height = v12 + v12;
    CGContextAddEllipseInRect(CurrentContext, v48);
    id v25 = v19;
    v26 = CGColorGetComponents((CGColorRef)[v25 CGColor]);
    CGContextSetStrokeColor(CurrentContext, v26);
    CGContextSetLineWidth(CurrentContext, 3.0);
    CGContextStrokePath(CurrentContext);
    objc_super v27 = [(TTRIReminderLocationPickerMapDragRadiusView *)self _currentHandleDistanceMeasurement];
    v28 = [(TTRIReminderLocationPickerMapDragRadiusView *)self measurementFormatter];
    v29 = [v28 stringFromMeasurement:v27];

    v49.origin.double y = v9 + -16.0;
    v49.size.double width = v12 + -14.0;
    v49.size.double height = 16.0;
    v49.origin.double x = v7;
    CGRect v50 = CGRectIntegral(v49);
    double x = v50.origin.x;
    double y = v50.origin.y;
    double width = v50.size.width;
    double height = v50.size.height;
    [v25 set];
    v34 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
    [v25 set];
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    CGContextSetRGBFillColor(CurrentContext, 0.937254902, 0.560784314, 0.0784313725, 1.0);
    CGContextSetRGBStrokeColor(CurrentContext, 1.0, 1.0, 1.0, 0.5);
    CGContextSetTextDrawingMode(CurrentContext, kCGTextFill);
    CGContextSetLineWidth(CurrentContext, 2.0);
    id v35 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v35 setAlignment:1];
    [v35 setLineBreakMode:4];
    uint64_t v36 = *MEMORY[0x1E4FB0700];
    v45[0] = *MEMORY[0x1E4FB06F8];
    v45[1] = v36;
    v46[0] = v34;
    v46[1] = v25;
    v45[2] = *MEMORY[0x1E4FB0738];
    v46[2] = v35;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
    objc_msgSend(v29, "drawInRect:withAttributes:", v37, x, y, width, height);

    v38 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [v38 center];
    double v40 = v39;
    double v42 = v41;

    id v43 = -[TTRIReminderLocationPickerMapDragRadiusView _shapeLayerWithEndPoint:](self, "_shapeLayerWithEndPoint:", v40, v42);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
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
    && ([(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView],
        v16 = objc_claimAutoreleasedReturnValue(),
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

- (void)handlePanGesture:(id)a3
{
  id v4 = a3;
  [v4 translationInView:self];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 state];

  if ((unint64_t)(v9 - 3) < 2)
  {
    double v14 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [v14 setHighlighted:0];

    [(TTRIReminderLocationPickerMapDragRadiusView *)self initialHandleCenterForDraggin];
    double v16 = v6 + v15;
    [(TTRIReminderLocationPickerMapDragRadiusView *)self initialHandleCenterForDraggin];
    double v18 = v8 + v17;
    -[TTRIReminderLocationPickerMapDragRadiusView _updateRegionWithPoint:](self, "_updateRegionWithPoint:", v16, v18);
  }
  else if (v9 == 2)
  {
    [(TTRIReminderLocationPickerMapDragRadiusView *)self initialHandleCenterForDraggin];
    double v20 = v6 + v19;
    [(TTRIReminderLocationPickerMapDragRadiusView *)self initialHandleCenterForDraggin];
    double v22 = v8 + v21;
    -[TTRIReminderLocationPickerMapDragRadiusView _updateHandleImageViewWithPoint:](self, "_updateHandleImageViewWithPoint:", v20, v22);
  }
  else if (v9 == 1)
  {
    double v10 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [v10 center];
    -[TTRIReminderLocationPickerMapDragRadiusView setInitialHandleCenterForDraggin:](self, "setInitialHandleCenterForDraggin:");

    [(TTRIReminderLocationPickerMapDragRadiusView *)self setIsDragging:1];
    double v11 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [v11 setHighlighted:1];

    double v12 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
    double v13 = [(TTRIReminderLocationPickerMapDragRadiusView *)self overlay];
    [v12 removeOverlay:v13];

    [(TTRIReminderLocationPickerMapDragRadiusView *)self setNeedsDisplay];
  }
}

- (void)startEditingRegion:(id)a3
{
  id v14 = a3;
  id v4 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
  uint64_t v5 = [v4 isEqual:v14];

  if ((v5 & 1) == 0) {
    [(TTRIReminderLocationPickerMapDragRadiusView *)self stopEditing];
  }
  [(TTRIReminderLocationPickerMapDragRadiusView *)self setRegion:v14];
  [v14 center];
  double v7 = v6;
  double v9 = v8;
  [v14 radius];
  double v11 = +[MKCircle circleWithCenterCoordinate:radius:](TTRIWorldBoundingMKCircle, "circleWithCenterCoordinate:radius:", v7, v9, v10);
  [(TTRIReminderLocationPickerMapDragRadiusView *)self setOverlay:v11];

  double v12 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  double v13 = [(TTRIReminderLocationPickerMapDragRadiusView *)self overlay];
  [v12 addOverlay:v13];

  [(TTRIReminderLocationPickerMapDragRadiusView *)self _centerAndZoomToFitRegion:v14 animated:0];
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _animateHandleIn:v5];
}

- (void)stopEditing
{
  [(TTRIReminderLocationPickerMapDragRadiusView *)self setRegion:0];
  v3 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  id v4 = [(TTRIReminderLocationPickerMapDragRadiusView *)self overlay];
  [v3 removeOverlay:v4];

  [(TTRIReminderLocationPickerMapDragRadiusView *)self setOverlay:0];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
}

- (CAShapeLayer)shapeLayer
{
  shapeLayer = self->_shapeLayer;
  if (!shapeLayer)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    id v5 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleColor];
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v6, "CGColor"));

    [v4 setLineDashPattern:&unk_1F13364B0];
    [v4 setLineCap:@"round"];
    [v4 setLineWidth:2.0];
    [v4 setStrokeStart:0.0];
    [v4 setStrokeEnd:1.0];
    [v4 setZPosition:40.0];
    [(TTRIReminderLocationPickerMapDragRadiusView *)self setShapeLayer:v4];

    shapeLayer = self->_shapeLayer;
  }

  return shapeLayer;
}

- (void)setHandleColor:(id)a3
{
  objc_storeStrong((id *)&self->_handleColor, a3);

  [(TTRIReminderLocationPickerMapDragRadiusView *)self _updateHandleImageView];
}

- (double)radius
{
  v2 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
  [v2 radius];
  double v4 = v3;

  return v4;
}

- (void)_updateHandleImageView
{
  double v3 = (void *)MEMORY[0x1E4FB1818];
  double v4 = RemindersUICoreBundleGet();
  id v5 = [v3 imageNamed:@"locationDragHandle" inBundle:v4 compatibleWithTraitCollection:0];
  id v6 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleColor];
  objc_msgSend(v5, "ttr_tintedImageWithColor:", v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  double v7 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
  [v7 setImage:v10];

  double v8 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
  [v8 setHighlightedImage:v10];

  double v9 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
  [v9 sizeToFit];
}

- (void)_updateHandleImageViewWithPoint:(CGPoint)a3
{
  double x = a3.x;
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _minPoint];
  double v6 = v5;
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _maxPoint];
  if (v7 >= 0.0)
  {
    double v8 = v7;
    [(TTRIReminderLocationPickerMapDragRadiusView *)self setIsMinimum:0];
    [(TTRIReminderLocationPickerMapDragRadiusView *)self setIsMaximum:0];
    double v9 = x;
    if (x <= v6)
    {
      -[TTRIReminderLocationPickerMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 1, x);
      double v9 = v6;
    }
    if (x >= v8)
    {
      -[TTRIReminderLocationPickerMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 1, v9);
      double v9 = v8;
    }
    CGFloat v10 = v9 + -12.0;
    double v11 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [v11 frame];
    v18.size.double width = 24.0;
    v18.size.double height = 24.0;
    v18.origin.double x = v10;
    CGRect v19 = CGRectIntegral(v18);
    double v12 = v19.origin.x;
    double y = v19.origin.y;
    double width = v19.size.width;
    double height = v19.size.height;
    double v16 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    objc_msgSend(v16, "setFrame:", v12, y, width, height);

    [(TTRIReminderLocationPickerMapDragRadiusView *)self setNeedsDisplay];
  }
}

- (void)_updateRegionWithPoint:(CGPoint)a3
{
  double x = a3.x;
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _minPoint];
  if (x > v5) {
    [(TTRIReminderLocationPickerMapDragRadiusView *)self setIsMinimum:0];
  }
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _maxPoint];
  if (x < v6) {
    [(TTRIReminderLocationPickerMapDragRadiusView *)self setIsMaximum:0];
  }
  if ([(TTRIReminderLocationPickerMapDragRadiusView *)self isMinimum]) {
    [(TTRIReminderLocationPickerMapDragRadiusView *)self minimumRadius];
  }
  else {
    [(TTRIReminderLocationPickerMapDragRadiusView *)self _currentHandleDistance];
  }
  double v8 = v7;
  if ([(TTRIReminderLocationPickerMapDragRadiusView *)self isMaximum])
  {
    [(TTRIReminderLocationPickerMapDragRadiusView *)self maximumRadius];
    double v8 = v9;
  }
  double v10 = 114.0;
  if (v8 >= 114.0) {
    double v10 = v8;
  }

  [(TTRIReminderLocationPickerMapDragRadiusView *)self _updateRegionWithRadius:v10];
}

- (void)_updateRegionWithRadius:(double)a3
{
  [(TTRIReminderLocationPickerMapDragRadiusView *)self minimumRadius];
  double v6 = v5;
  [(TTRIReminderLocationPickerMapDragRadiusView *)self maximumRadius];
  if (v7 >= a3) {
    double v7 = a3;
  }
  if (v6 >= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  double v10 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
  [v10 center];
  double v12 = v11;
  double v14 = v13;
  double v15 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
  double v16 = [v15 identifier];
  id v27 = (id)objc_msgSend(v9, "initWithCenter:radius:identifier:", v16, v12, v14, v8);

  [v27 center];
  double v18 = v17;
  double v20 = v19;
  [v27 radius];
  double v22 = +[MKCircle circleWithCenterCoordinate:radius:](TTRIWorldBoundingMKCircle, "circleWithCenterCoordinate:radius:", v18, v20, v21);
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _centerAndZoomToFitRegion:v27 animated:0];
  [(TTRIReminderLocationPickerMapDragRadiusView *)self setRegion:v27];
  id v23 = [(TTRIReminderLocationPickerMapDragRadiusView *)self overlay];

  if (v23)
  {
    v24 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
    id v25 = [(TTRIReminderLocationPickerMapDragRadiusView *)self overlay];
    [v24 removeOverlay:v25];

    [(TTRIReminderLocationPickerMapDragRadiusView *)self setOverlay:0];
  }
  v26 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  [v26 addOverlay:v22];

  [(TTRIReminderLocationPickerMapDragRadiusView *)self setOverlay:v22];
  [(TTRIReminderLocationPickerMapDragRadiusView *)self setNeedsDisplay];
  [(TTRIReminderLocationPickerMapDragRadiusView *)self performSelector:sel__hideCircleAfterDelay withObject:0 afterDelay:0.01];
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _popAnimateHandle];
}

- (void)_popAnimateHandle
{
  v2 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
  double v3 = [v2 layer];

  double v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  [v4 setDuration:0.35];
  memset(&v33, 0, sizeof(v33));
  if (v3)
  {
    [v3 transform];
    CATransform3DScale(&v33, &v32, 0.5, 0.5, 1.0);
    memset(&v31, 0, sizeof(v31));
    [v3 transform];
    CATransform3DScale(&v31, &v30, 1.2, 1.2, 1.0);
    memset(&v29, 0, sizeof(v29));
    [v3 transform];
    CATransform3DScale(&v29, &v28, 0.9, 0.9, 1.0);
    memset(&v27, 0, sizeof(v27));
    [v3 transform];
  }
  else
  {
    memset(&v32, 0, sizeof(v32));
    CATransform3DScale(&v33, &v32, 0.5, 0.5, 1.0);
    memset(&v31, 0, sizeof(v31));
    memset(&v30, 0, sizeof(v30));
    CATransform3DScale(&v31, &v30, 1.2, 1.2, 1.0);
    memset(&v29, 0, sizeof(v29));
    memset(&v28, 0, sizeof(v28));
    CATransform3DScale(&v29, &v28, 0.9, 0.9, 1.0);
    memset(&v27, 0, sizeof(v27));
  }
  double v5 = (void *)MEMORY[0x1E4F1C978];
  CATransform3D v26 = v33;
  double v6 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v26];
  CATransform3D v26 = v31;
  double v7 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v26];
  CATransform3D v26 = v29;
  double v8 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v26];
  CATransform3D v26 = v27;
  id v9 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v26];
  double v10 = objc_msgSend(v5, "arrayWithObjects:", v6, v7, v8, v9, 0);

  [v4 setValues:v10];
  double v11 = (void *)MEMORY[0x1E4F1C978];
  double v12 = [NSNumber numberWithFloat:0.0];
  LODWORD(v13) = 0.5;
  double v14 = [NSNumber numberWithFloat:v13];
  LODWORD(v15) = *(_DWORD *)"fff?";
  double v16 = [NSNumber numberWithFloat:v15];
  LODWORD(v17) = 1.0;
  double v18 = [NSNumber numberWithFloat:v17];
  double v19 = objc_msgSend(v11, "arrayWithObjects:", v12, v14, v16, v18, 0);

  [v4 setKeyTimes:v19];
  double v20 = (void *)MEMORY[0x1E4F1C978];
  double v21 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  uint64_t v22 = *MEMORY[0x1E4F3A490];
  id v23 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  v24 = [MEMORY[0x1E4F39C10] functionWithName:v22];
  id v25 = objc_msgSend(v20, "arrayWithObjects:", v21, v23, v24, 0);

  [v4 setTimingFunctions:v25];
  [v4 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v4 setRemovedOnCompletion:0];
  [v3 addAnimation:v4 forKey:@"transform"];
}

- (id)_bezierPathWithEndPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v6 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];

  if (v6)
  {
    double v7 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
    double v8 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
    [v8 center];
    objc_msgSend(v7, "convertCoordinate:toPointToView:", self);
    double v10 = v9;
    double v12 = v11;

    double v13 = [MEMORY[0x1E4FB14C0] bezierPath];
    long long v15 = xmmword_1B9977F50;
    [v13 setLineDash:&v15 count:2 phase:0.0];
    [v13 setLineWidth:2.0];
    [v13 setLineCapStyle:1];
    objc_msgSend(v13, "moveToPoint:", floor(v10), floor(v12));
    objc_msgSend(v13, "addLineToPoint:", floor(x), floor(y));
    [v13 stroke];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (id)_shapeLayerWithEndPoint:(CGPoint)a3
{
  double v4 = -[TTRIReminderLocationPickerMapDragRadiusView _bezierPathWithEndPoint:](self, "_bezierPathWithEndPoint:", a3.x, a3.y);
  double v5 = [(TTRIReminderLocationPickerMapDragRadiusView *)self shapeLayer];
  id v6 = v4;
  objc_msgSend(v5, "setPath:", objc_msgSend(v6, "CGPath"));
  double v7 = [v5 superlayer];

  if (!v7)
  {
    double v8 = [(TTRIReminderLocationPickerMapDragRadiusView *)self layer];
    [v8 addSublayer:v5];
  }

  return v5;
}

- (void)_animateHandleIn:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(TTRIReminderLocationPickerMapDragRadiusView *)self overlay];
  [v5 originalBoundingMapRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  [v14 visibleMapRect];
  v61.origin.double x = v15;
  v61.origin.double y = v16;
  v61.size.double width = v17;
  v61.size.double height = v18;
  v56.origin.double x = v7;
  v56.origin.double y = v9;
  v56.size.double width = v11;
  v56.size.double height = v13;
  BOOL v19 = MKMapRectIntersectsRect(v56, v61);

  if (v19)
  {
    double v20 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
    double v21 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
    [v21 center];
    objc_msgSend(v20, "convertCoordinate:toPointToView:", self);
    double v23 = v22;
    double v25 = v24;

    CATransform3D v26 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    objc_msgSend(v26, "setCenter:", floor(v23), floor(v25));

    CATransform3D v27 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [(TTRIReminderLocationPickerMapDragRadiusView *)self addSubview:v27];

    v57.origin.double x = v7;
    v57.origin.double y = v9;
    v57.size.double width = v11;
    v57.size.double height = v13;
    MKCoordinateRegion v58 = MKCoordinateRegionForMapRect(v57);
    double latitude = v58.center.latitude;
    double longitude = v58.center.longitude;
    double latitudeDelta = v58.span.latitudeDelta;
    double longitudeDelta = v58.span.longitudeDelta;
    CATransform3D v32 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
    objc_msgSend(v32, "convertRegion:toRectToView:", self, latitude, longitude, latitudeDelta, longitudeDelta);
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;

    v59.origin.double x = v34;
    v59.origin.double y = v36;
    v59.size.double width = v38;
    v59.size.double height = v40;
    double v41 = floor(CGRectGetMaxX(v59));
    v60.origin.double x = v34;
    v60.origin.double y = v36;
    v60.size.double width = v38;
    v60.size.double height = v40;
    double MidY = CGRectGetMidY(v60);
    id v43 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    id v51 = v43;
    if (v41 - v23 >= 12.0)
    {
      double v44 = floor(MidY);
      [v43 setAlpha:1.0];

      [(TTRIReminderLocationPickerMapDragRadiusView *)self frame];
      v55.double width = v45;
      v55.double height = v46;
      UIGraphicsBeginImageContext(v55);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      id v48 = -[TTRIReminderLocationPickerMapDragRadiusView _shapeLayerWithEndPoint:](self, "_shapeLayerWithEndPoint:", v41, v44);
      CGContextRestoreGState(CurrentContext);
      UIGraphicsEndImageContext();
      if (v3)
      {
        CGRect v49 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
        [v49 setDuration:0.35];
        [v49 setFromValue:&unk_1F13365A0];
        [v49 setToValue:&unk_1F13365B0];
        CGRect v50 = [(TTRIReminderLocationPickerMapDragRadiusView *)self shapeLayer];
        [v50 addAnimation:v49 forKey:@"strokeEndAnimation"];

        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __64__TTRIReminderLocationPickerMapDragRadiusView__animateHandleIn___block_invoke;
        v53[3] = &unk_1E61D3B58;
        v53[4] = self;
        *(double *)&v53[5] = v41;
        *(double *)&v53[6] = v44;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __64__TTRIReminderLocationPickerMapDragRadiusView__animateHandleIn___block_invoke_2;
        v52[3] = &unk_1E61D3A68;
        v52[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v53 animations:v52 completion:0.35];

        return;
      }
      id v51 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
      objc_msgSend(v51, "setCenter:", v41, v44);
    }
    else
    {
      [v43 setAlpha:0.0];
    }
  }
}

void __64__TTRIReminderLocationPickerMapDragRadiusView__animateHandleIn___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) handleImageView];
  objc_msgSend(v3, "setCenter:", v1, v2);
}

uint64_t __64__TTRIReminderLocationPickerMapDragRadiusView__animateHandleIn___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _popAnimateHandle];
  }
  return result;
}

- (void)_removeHandle
{
  if (![(TTRIReminderLocationPickerMapDragRadiusView *)self isDragging])
  {
    id v3 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
    [v3 removeFromSuperview];

    id v4 = [(TTRIReminderLocationPickerMapDragRadiusView *)self shapeLayer];
    [v4 removeFromSuperlayer];
  }
}

- (void)_hideCircleAfterDelay
{
  [(TTRIReminderLocationPickerMapDragRadiusView *)self setIsDragging:0];
  id v3 = [(TTRIReminderLocationPickerMapDragRadiusView *)self delegate];
  id v4 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
  [v3 mapDragRadiusView:self didUpdateRegion:v4];

  [(TTRIReminderLocationPickerMapDragRadiusView *)self setNeedsDisplay];

  [(TTRIReminderLocationPickerMapDragRadiusView *)self _animateHandleIn:0];
}

- (CGPoint)_pointForRadius:(double)a3
{
  double v5 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
  [v5 center];
  double v7 = v6;

  double v8 = MEMORY[0x1BA9DA230](v7);
  double v9 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
  [v9 center];
  MKMapPoint v10 = MKMapPointForCoordinate(v19);

  v20.double x = v10.x + v8 * a3;
  v20.double y = v10.y;
  CLLocationCoordinate2D v11 = MKCoordinateForMapPoint(v20);
  double v12 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  objc_msgSend(v12, "convertCoordinate:toPointToView:", self, v11.latitude, v11.longitude);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)_minPoint
{
  [(TTRIReminderLocationPickerMapDragRadiusView *)self minimumRadius];

  -[TTRIReminderLocationPickerMapDragRadiusView _pointForRadius:](self, "_pointForRadius:");
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)_maxPoint
{
  [(TTRIReminderLocationPickerMapDragRadiusView *)self maximumRadius];

  -[TTRIReminderLocationPickerMapDragRadiusView _pointForRadius:](self, "_pointForRadius:");
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (double)_currentHandleDistance
{
  double v3 = [(TTRIReminderLocationPickerMapDragRadiusView *)self handleImageView];
  [v3 center];
  double v5 = v4;
  double v7 = v6;

  -[TTRIReminderLocationPickerMapDragRadiusView _radiusForPoint:](self, "_radiusForPoint:", v5, v7);
  return result;
}

- (double)_radiusForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  objc_msgSend(v6, "convertPoint:toCoordinateFromView:", self, x, y);
  double v8 = v7;
  double v10 = v9;

  CLLocationCoordinate2D v11 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v8 longitude:v10];
  double v12 = [(TTRIReminderLocationPickerMapDragRadiusView *)self region];
  [v12 center];
  double v14 = v13;
  double v16 = v15;

  double v17 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v14 longitude:v16];
  [v11 distanceFromLocation:v17];
  double v19 = v18;

  return v19;
}

- (id)_currentHandleDistanceMeasurement
{
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _currentHandleDistance];
  double v4 = v3;
  double v5 = [MEMORY[0x1E4F291E0] meters];
  if ([(TTRIReminderLocationPickerMapDragRadiusView *)self _usesMetric]) {
    [MEMORY[0x1E4F291E0] meters];
  }
  else {
  double v6 = [MEMORY[0x1E4F291E0] feet];
  }
  double v7 = [(TTRIReminderLocationPickerMapDragRadiusView *)self _measurementFor:v5 fromUnit:v6 toUnit:1 normalized:v4];

  return v7;
}

- (id)_measurementFor:(double)a3 fromUnit:(id)a4 toUnit:(id)a5 normalized:(BOOL)a6
{
  BOOL v6 = a6;
  double v9 = (objc_class *)MEMORY[0x1E4F28E28];
  id v10 = a5;
  id v11 = a4;
  double v12 = (void *)[[v9 alloc] initWithDoubleValue:v11 unit:a3];

  double v13 = [v12 measurementByConvertingToUnit:v10];

  id v14 = v13;
  double v15 = v14;
  double v16 = v14;
  if (v6)
  {
    [v14 doubleValue];
    double v18 = floor(v17 / 10.0) * 10.0;
    id v19 = objc_alloc(MEMORY[0x1E4F28E28]);
    MKMapPoint v20 = [v15 unit];
    double v16 = (void *)[v19 initWithDoubleValue:v20 unit:v18];
  }

  return v16;
}

- (BOOL)_usesMetric
{
  double v2 = [(TTRIReminderLocationPickerMapDragRadiusView *)self measurementFormatter];
  double v3 = [v2 locale];
  double v4 = [v3 objectForKey:*MEMORY[0x1E4F1C490]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)_centerAndZoomToFitRegion:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 radius];
  [(TTRIReminderLocationPickerMapDragRadiusView *)self radiusPaddingMultiplier];
  double v7 = MEMORY[0x1BA9DA210]([v6 center]);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  objc_msgSend(v14, "regionThatFits:", v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  [v6 center];
  double v25 = v24;
  double v27 = v26;

  objc_msgSend(v23, "setCenterCoordinate:animated:", v4, v25, v27);
  id v28 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  objc_msgSend(v28, "setRegion:animated:", v4, v16, v18, v20, v22);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  double v2 = [(TTRIReminderLocationPickerMapDragRadiusView *)self mapView];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v10 + -16.0;
  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  result.size.double height = v11;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (id)accessibilityLabel
{
  double v2 = RemindersUICoreBundleGet();
  double v3 = [v2 localizedStringForKey:@"Reminder radius" value:@"Reminder radius" table:@"Localizable"];

  return v3;
}

- (id)accessibilityValue
{
  double v3 = [(TTRIReminderLocationPickerMapDragRadiusView *)self _currentHandleDistanceMeasurement];
  double v4 = [(TTRIReminderLocationPickerMapDragRadiusView *)self measurementFormatter];
  double v5 = [v4 stringFromMeasurement:v3];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB2530];
}

- (void)accessibilityIncrement
{
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _ttriAccessibilityRadiusIncrement];
  double v4 = v3;
  [(TTRIReminderLocationPickerMapDragRadiusView *)self radius];
  double v6 = v4 + v5;

  [(TTRIReminderLocationPickerMapDragRadiusView *)self _ttriAccessibilityUpdateWithRadius:v6];
}

- (void)accessibilityDecrement
{
  [(TTRIReminderLocationPickerMapDragRadiusView *)self _ttriAccessibilityRadiusIncrement];
  double v4 = v3;
  [(TTRIReminderLocationPickerMapDragRadiusView *)self radius];
  double v6 = v5 - v4;

  [(TTRIReminderLocationPickerMapDragRadiusView *)self _ttriAccessibilityUpdateWithRadius:v6];
}

- (double)_ttriAccessibilityRadiusByAdding:(double)a3
{
  [(TTRIReminderLocationPickerMapDragRadiusView *)self radius];
  return v4 + a3;
}

- (double)_ttriAccessibilityRadiusIncrement
{
  if ([(TTRIReminderLocationPickerMapDragRadiusView *)self _usesMetric]) {
    return 200.0;
  }
  double v4 = [MEMORY[0x1E4F291E0] feet];
  double v5 = [MEMORY[0x1E4F291E0] meters];
  double v6 = [(TTRIReminderLocationPickerMapDragRadiusView *)self _measurementFor:v4 fromUnit:v5 toUnit:0 normalized:200.0];
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (TTRIReminderLocationPickerMapDragRadiusViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TTRIReminderLocationPickerMapDragRadiusViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMeasurementFormatter)measurementFormatter
{
  return self->_measurementFormatter;
}

- (void)setMeasurementFormatter:(id)a3
{
}

- (double)minimumRadius
{
  return self->_minimumRadius;
}

- (void)setMinimumRadius:(double)a3
{
  self->_minimumRadius = a3;
}

- (double)maximumRadius
{
  return self->_maximumRadius;
}

- (void)setMaximumRadius:(double)a3
{
  self->_maximumRadius = a3;
}

- (double)radiusPaddingMultiplier
{
  return self->_radiusPaddingMultiplier;
}

- (void)setRadiusPaddingMultiplier:(double)a3
{
  self->_radiusPaddingMultiplier = a3;
}

- (UIColor)circleColor
{
  return self->_circleColor;
}

- (void)setCircleColor:(id)a3
{
}

- (UIColor)handleColor
{
  return self->_handleColor;
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

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (TTRIWorldBoundingMKCircle)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
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

- (CGPoint)initialHandleCenterForDraggin
{
  double x = self->_initialHandleCenterForDraggin.x;
  double y = self->_initialHandleCenterForDraggin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialHandleCenterForDraggin:(CGPoint)a3
{
  self->_initialHandleCenterForDraggin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_handleImageView, 0);
  objc_storeStrong((id *)&self->_handleColor, 0);
  objc_storeStrong((id *)&self->_circleColor, 0);
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end