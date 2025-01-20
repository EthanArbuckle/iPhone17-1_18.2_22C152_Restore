@interface RAPEditLocationMapView
- (BOOL)crosshairEnabled;
- (BOOL)hideAllSuplementaryViews;
- (BlurredBackgroundLabel)descriptionView;
- (CGPoint)mapView:(id)a3 focusPointForPoint:(CGPoint)a4 gesture:(int64_t)a5;
- (CLLocationCoordinate2D)centerCoordinate;
- (MKMapView)mapView;
- (MapViewModeSelector)mapModeSegmentedControl;
- (NSLayoutAnchor)leadingContentGuide;
- (NSLayoutAnchor)trailingContentGuide;
- (NSLayoutYAxisAnchor)bottomContentGuide;
- (NSString)annotationTitle;
- (NSString)prompt;
- (RAPEditLocationMapView)initWithMapRect:(id)a3 viewMode:(int64_t)a4 markerViewAttributes:(id)a5;
- (RAPEditLocationMapViewDelegate)delegate;
- (RAPMKMarkerAnnotationView)crosshairAnnotationView;
- (UIView)floatingControlsView;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (int64_t)viewMode;
- (void)layoutSubviews;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4;
- (void)mapViewDidStartUserInteraction:(id)a3;
- (void)selectedMapModeDidChange:(id)a3;
- (void)setAnnotationTitle:(id)a3;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3;
- (void)setCrosshairAnnotationView:(id)a3;
- (void)setCrosshairEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setFloatingControlsView:(id)a3;
- (void)setHideAllSuplementaryViews:(BOOL)a3;
- (void)setMapModeSegmentedControl:(id)a3;
- (void)setMapView:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setViewMode:(int64_t)a3;
- (void)setupConstraints;
- (void)setupDescriptionViewAndAdditionalConstraints;
- (void)updateAnnotationTitleWithCenterCoordinate:(CLLocationCoordinate2D)a3;
- (void)updateAttributionInsets;
- (void)updateCrosshairPosition;
@end

@implementation RAPEditLocationMapView

- (RAPEditLocationMapView)initWithMapRect:(id)a3 viewMode:(int64_t)a4 markerViewAttributes:(id)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  id v11 = a5;
  v52.receiver = self;
  v52.super_class = (Class)RAPEditLocationMapView;
  v12 = [(RAPEditLocationMapView *)&v52 init];
  if (v12)
  {
    v13 = [[MapViewModeSelector alloc] initWithDesiredViewModes:&off_1013AD890];
    mapModeSegmentedControl = v12->_mapModeSegmentedControl;
    v12->_mapModeSegmentedControl = v13;

    [(MapViewModeSelector *)v12->_mapModeSegmentedControl setSelectedViewMode:a4];
    [(MapViewModeSelector *)v12->_mapModeSegmentedControl addTarget:v12 action:"selectedMapModeDidChange:" forControlEvents:4096];
    uint64_t v15 = sub_1005CA8A0(v12->_mapModeSegmentedControl);
    floatingControlsView = v12->_floatingControlsView;
    v12->_floatingControlsView = (UIView *)v15;

    id v17 = objc_alloc((Class)MKMapView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v21 = [v17 initWithFrame:CGRectZero.origin.x, y, width, height];
    mapView = v12->_mapView;
    v12->_mapView = v21;

    [(MKMapView *)v12->_mapView setShowsUserLocation:1];
    [(MKMapView *)v12->_mapView _setShowsVenues:1];
    [(MKMapView *)v12->_mapView setShowsAttribution:0];
    [(MKMapView *)v12->_mapView setShowsCompass:0];
    -[MKMapView _setEdgeInsets:](v12->_mapView, "_setEdgeInsets:", 40.0, 0.0, 0.0, 0.0);
    [(MKMapView *)v12->_mapView setDelegate:v12];
    v23 = [(MKMapView *)v12->_mapView _mapLayer];
    [v23 setStaysCenteredDuringPinch:1];

    v24 = [(MKMapView *)v12->_mapView _mapLayer];
    [v24 setStaysCenteredDuringRotation:1];

    if (sub_1000BBB44(v12) == 5)
    {
      v25 = +[UIColor systemBlueColor];
      [(MKMapView *)v12->_mapView setTintColor:v25];
    }
    v26 = v12->_mapView;
    uint64_t v27 = objc_opt_class();
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    [(MKMapView *)v26 registerClass:v27 forAnnotationViewWithReuseIdentifier:v29];

    [(MKMapView *)v12->_mapView setBackdropViewQualityChangingDisabled:1];
    int64_t v30 = a4 - 1;
    if ((unint64_t)(a4 - 1) > 6) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = qword_100F6FEF0[v30];
    }
    [(MKMapView *)v12->_mapView setMapType:v31];
    [(MKMapView *)v12->_mapView setShowsTraffic:a4 == 7];
    if (v9 != MKMapRectNull.origin.x || v8 != MKMapRectNull.origin.y) {
      -[MKMapView setVisibleMapRect:](v12->_mapView, "setVisibleMapRect:", v9, v8, var0, var1);
    }
    v32 = v12->_mapView;
    uint64_t v51 = 0;
    long long v50 = 0u;
    int64x2_t v48 = 0u;
    _MKCartographicConfigurationDefault();
    int64x2_t v49 = vdupq_n_s64(1uLL);
    *(void *)&long long v50 = 0;
    switch(v30)
    {
      case 0:
        int64x2_t v48 = vdupq_n_s64(1uLL);
        v49.i64[0] = 0;
        break;
      case 1:
        v49.i64[0] = 0;
        int64x2_t v48 = (int64x2_t)1uLL;
        break;
      case 2:
        uint64_t v33 = 4;
        goto LABEL_18;
      case 4:
        int64x2_t v34 = vdupq_n_s64(1uLL);
        goto LABEL_16;
      case 5:
        int64x2_t v34 = (int64x2_t)xmmword_100F67600;
LABEL_16:
        int64x2_t v48 = v34;
        break;
      case 6:
        uint64_t v33 = 2;
LABEL_18:
        v48.i64[1] = v33;
        break;
      default:
        break;
    }
    [(MKMapView *)v32 _setCartographicConfiguration:&v48 animated:0];
    -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](v12->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0, *(_OWORD *)&v48, *(_OWORD *)&v49, v50, v51);
    [(RAPEditLocationMapView *)v12 addSubview:v12->_mapView];
    v35 = +[GEOPlatform sharedPlatform];
    unsigned int v36 = [v35 isInternalInstall];

    if (v36)
    {
      v37 = -[WatermarkView initWithFrame:]([WatermarkView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      watermarkView = v12->_watermarkView;
      v12->_watermarkView = v37;

      [(WatermarkView *)v12->_watermarkView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(RAPEditLocationMapView *)v12 addSubview:v12->_watermarkView];
    }
    [(RAPEditLocationMapView *)v12 addSubview:v12->_floatingControlsView];
    v39 = objc_alloc_init(RAPMKMarkerAnnotationView);
    crosshairAnnotationView = v12->_crosshairAnnotationView;
    v12->_crosshairAnnotationView = v39;

    [(RAPMKMarkerAnnotationView *)v12->_crosshairAnnotationView setSelected:1];
    v41 = [v11 styleAttributes];
    [(RAPMKMarkerAnnotationView *)v12->_crosshairAnnotationView _setStyleAttributes:v41];

    [(RAPMKMarkerAnnotationView *)v12->_crosshairAnnotationView setAlpha:0.0];
    [(RAPMKMarkerAnnotationView *)v12->_crosshairAnnotationView setHidden:1];
    v42 = [(RAPEditLocationMapView *)v12 mapView];
    [v42 addSubview:v12->_crosshairAnnotationView];

    v43 = -[BlurredBackgroundLabel initWithFrame:]([BlurredBackgroundLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    descriptionView = v12->_descriptionView;
    v12->_descriptionView = v43;

    v45 = (objc_class *)objc_opt_class();
    v46 = NSStringFromClass(v45);
    [(BlurredBackgroundLabel *)v12->_descriptionView setGroupName:v46];

    [(BlurredBackgroundLabel *)v12->_descriptionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKMapView *)v12->_mapView addSubview:v12->_descriptionView];
    [(RAPEditLocationMapView *)v12 setupConstraints];
  }

  return v12;
}

- (void)setupDescriptionViewAndAdditionalConstraints
{
  v18 = [(RAPEditLocationMapView *)self descriptionView];
  v16 = [v18 topAnchor];
  id v17 = [(RAPEditLocationMapView *)self mapView];
  uint64_t v15 = [v17 topAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v19[0] = v14;
  v13 = [(RAPEditLocationMapView *)self descriptionView];
  v3 = [v13 leadingAnchor];
  v4 = [(RAPEditLocationMapView *)self mapView];
  v5 = [v4 leadingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v19[1] = v6;
  v7 = [(RAPEditLocationMapView *)self descriptionView];
  double v8 = [v7 trailingAnchor];
  double v9 = [(RAPEditLocationMapView *)self mapView];
  v10 = [v9 trailingAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v19[2] = v11;
  v12 = +[NSArray arrayWithObjects:v19 count:3];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)setupConstraints
{
  v39 = [(RAPEditLocationMapView *)self mapView];
  v38 = [v39 leadingAnchor];
  v37 = [(RAPEditLocationMapView *)self leadingAnchor];
  unsigned int v36 = [v38 constraintEqualToAnchor:v37];
  v40[0] = v36;
  v35 = [(RAPEditLocationMapView *)self mapView];
  int64x2_t v34 = [v35 trailingAnchor];
  uint64_t v33 = [(RAPEditLocationMapView *)self trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v40[1] = v32;
  uint64_t v31 = [(RAPEditLocationMapView *)self mapView];
  int64_t v30 = [v31 topAnchor];
  v29 = [(RAPEditLocationMapView *)self topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v40[2] = v28;
  uint64_t v27 = [(RAPEditLocationMapView *)self mapView];
  v26 = [v27 bottomAnchor];
  v25 = [(RAPEditLocationMapView *)self bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v40[3] = v24;
  v23 = [(RAPEditLocationMapView *)self floatingControlsView];
  v21 = [v23 leadingAnchor];
  v22 = [(RAPEditLocationMapView *)self layoutMarginsGuide];
  v20 = [v22 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v40[4] = v19;
  v18 = [(RAPEditLocationMapView *)self floatingControlsView];
  v16 = [v18 trailingAnchor];
  id v17 = [(RAPEditLocationMapView *)self layoutMarginsGuide];
  v3 = [v17 trailingAnchor];
  v4 = [v16 constraintEqualToAnchor:v3];
  v40[5] = v4;
  v5 = [(RAPEditLocationMapView *)self floatingControlsView];
  v6 = [v5 bottomAnchor];
  v7 = [(RAPEditLocationMapView *)self mapView];
  double v8 = [v7 safeAreaLayoutGuide];
  double v9 = [v8 bottomAnchor];
  v10 = [v6 constraintEqualToAnchor:v9 constant:-8.0];
  v40[6] = v10;
  id v11 = +[NSArray arrayWithObjects:v40 count:7];
  +[NSLayoutConstraint activateConstraints:v11];

  v12 = +[GEOPlatform sharedPlatform];
  LODWORD(v7) = [v12 isInternalInstall];

  if (v7)
  {
    LODWORD(v13) = 1148846080;
    v14 = [(WatermarkView *)self->_watermarkView _maps_constraintsEqualToEdgesOfView:self priority:v13];
    uint64_t v15 = [v14 allConstraints];
    +[NSLayoutConstraint activateConstraints:v15];
  }
  [(RAPEditLocationMapView *)self setupDescriptionViewAndAdditionalConstraints];
  [(RAPEditLocationMapView *)self updateCrosshairPosition];
}

- (void)updateCrosshairPosition
{
  v3 = [(RAPEditLocationMapView *)self crosshairAnnotationView];

  if (v3)
  {
    v4 = [(RAPEditLocationMapView *)self mapView];
    v5 = [(RAPEditLocationMapView *)self mapView];
    [v5 centerCoordinate];
    double v7 = v6;
    double v9 = v8;
    v10 = [(RAPEditLocationMapView *)self mapView];
    [v4 convertCoordinate:v10 toPointToView:v7];
    double v12 = v11;
    double v14 = v13;

    uint64_t v15 = [(RAPEditLocationMapView *)self mapView];
    v16 = [(RAPEditLocationMapView *)self mapView];
    [v16 center];
    double v18 = v17;
    double v20 = v19;
    v21 = [(RAPEditLocationMapView *)self mapView];
    v22 = [v21 superview];
    [v15 convertPoint:v22 fromView:v18];
    double v24 = v23;
    double v26 = v25;

    [(RAPMKMarkerAnnotationView *)self->_crosshairAnnotationView centerOffset];
    if (vabdd_f64(v12, v24) != INFINITY)
    {
      double v28 = v14 - v26 + v27 + 1.5;
      if (fabs(v28) != INFINITY)
      {
        crosshairAnnotationView = self->_crosshairAnnotationView;
        double v30 = v26 + v28;
        -[RAPMKMarkerAnnotationView setCenter:](crosshairAnnotationView, "setCenter:", v24 + v12 - v24, v30);
      }
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RAPEditLocationMapView;
  [(RAPEditLocationMapView *)&v3 layoutSubviews];
  [(RAPEditLocationMapView *)self updateCrosshairPosition];
  [(RAPEditLocationMapView *)self updateAttributionInsets];
}

- (void)updateAttributionInsets
{
  -[UIView systemLayoutSizeFittingSize:](self->_floatingControlsView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v4 = v3 + 8.0;
  v5 = [(RAPEditLocationMapView *)self superview];
  [v5 safeAreaInsets];
  double v7 = v4 + v6;

  double v8 = +[UIApplication sharedApplication];
  id v9 = [v8 userInterfaceLayoutDirection];

  mapView = self->_mapView;
  id v15 = [(RAPEditLocationMapView *)self superview];
  [v15 safeAreaInsets];
  double v13 = v12 + 8.0;
  if (v9 == (id)1)
  {
    double v14 = 0.0;
  }
  else
  {
    double v13 = 0.0;
    double v14 = v11 + 8.0;
  }
  -[MKMapView _setAttributionInsets:](mapView, "_setAttributionInsets:", 0.0, v13, v7, v14);
}

- (void)selectedMapModeDidChange:(id)a3
{
  double v4 = [(RAPEditLocationMapView *)self mapModeSegmentedControl];
  id v5 = [v4 selectedViewMode];

  if (v5 == (id)2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  double v7 = [(RAPEditLocationMapView *)self mapView];
  double v8 = v7;
  if ((unint64_t)(v6 - 1) > 6) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_100F6FEF0[v6 - 1];
  }
  [v7 setMapType:v9];

  v10 = [(RAPEditLocationMapView *)self mapView];
  [v10 setShowsTraffic:v6 == 7];

  id v11 = [(RAPEditLocationMapView *)self delegate];
  [v11 editLocationMapView:self didChangeViewMode:v6];
}

- (void)setCrosshairEnabled:(BOOL)a3
{
  self->_crosshairEnabled = a3;
  BOOL v3 = !a3;
  id v4 = [(RAPEditLocationMapView *)self crosshairAnnotationView];
  [v4 setHidden:v3];
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  id v5 = [(RAPEditLocationMapView *)self crosshairAnnotationView];
  [v5 setAlpha:1.0];

  [(RAPEditLocationMapView *)self updateCrosshairPosition];
  uint64_t v6 = [(RAPEditLocationMapView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(RAPEditLocationMapView *)self delegate];
    [v8 editLocationMapViewFinishedRenderingMap:self];
  }
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v5 = [(RAPEditLocationMapView *)self mapView];
  [v5 setCenterCoordinate:latitude, longitude];
}

- (CLLocationCoordinate2D)centerCoordinate
{
  v2 = [(RAPEditLocationMapView *)self mapView];
  [v2 centerCoordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double longitude = v8;
  result.double latitude = v7;
  return result;
}

- (void)setPrompt:(id)a3
{
  id v6 = a3;
  -[BlurredBackgroundLabel setHidden:](self->_descriptionView, "setHidden:", [v6 length] == 0);
  if (![(NSString *)self->_prompt isEqualToString:v6])
  {
    double v4 = (NSString *)[v6 copy];
    prompt = self->_prompt;
    self->_prompt = v4;

    [(BlurredBackgroundLabel *)self->_descriptionView setText:v6];
  }
}

- (void)setAnnotationTitle:(id)a3
{
  id v7 = a3;
  if ((-[NSString isEqual:](self->_annotationTitle, "isEqual:") & 1) == 0)
  {
    double v4 = (NSString *)[v7 copy];
    annotationTitle = self->_annotationTitle;
    self->_annotationTitle = v4;

    id v6 = [(RAPEditLocationMapView *)self crosshairAnnotationView];
    [v6 setAnnotationTitle:v7];
  }
}

- (void)setViewMode:(int64_t)a3
{
  double v5 = [(RAPEditLocationMapView *)self mapModeSegmentedControl];
  id v6 = [v5 selectedViewMode];

  if (v6 != (id)a3)
  {
    if ((unint64_t)(a3 - 1) > 6) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = qword_100F6FEF0[a3 - 1];
    }
    double v8 = [(RAPEditLocationMapView *)self mapView];
    [v8 setMapType:v7];

    uint64_t v9 = [(RAPEditLocationMapView *)self mapModeSegmentedControl];
    [v9 setSelectedViewMode:a3];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained editLocationMapView:self didChangeViewMode:a3];
  }
}

- (int64_t)viewMode
{
  v2 = [(RAPEditLocationMapView *)self mapModeSegmentedControl];
  id v3 = [v2 selectedViewMode];

  return (int64_t)v3;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = [v6 dequeueReusableAnnotationViewWithIdentifier:v9];

    [v10 setAnnotation:v7];
    LODWORD(v11) = 1148846080;
    [v10 setDisplayPriority:v11];
    double v12 = +[RAPEntryPoint entryPointStyleAttributes];
    id v13 = [v12 copy];
    [v10 _setStyleAttributes:v13];

LABEL_5:
    [v10 setSubtitleVisibility:2];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    v10 = [v6 dequeueReusableAnnotationViewWithIdentifier:v15];

    [v10 setAnnotation:v7];
    LODWORD(v16) = 1148846080;
    [v10 setDisplayPriority:v16];
    double v17 = [(RAPEditLocationMapView *)self crosshairAnnotationView];
    double v18 = [v17 _styleAttributes];
    id v19 = [v18 copy];
    [v10 _setStyleAttributes:v19];

    [v10 setSelected:0];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  uint64_t v7 = [v10 annotation];
  [v6 deselectAnnotation:v7 animated:0];

  double v8 = [v10 annotation];
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if (v7)
  {
    uint64_t v9 = [(RAPEditLocationMapView *)self delegate];
    [v9 editLocationMapView:self didSelectAnnotationView:v10];
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  if (self->_userInteracted)
  {
    id v5 = a3;
    id v10 = [(RAPEditLocationMapView *)self delegate];
    [v5 centerCoordinate];
    double v7 = v6;
    double v9 = v8;

    [v10 editLocationMapView:self didChangeCenterCoordinate:v7, v9];
  }
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  self->_userInteracted = 1;
}

- (CGPoint)mapView:(id)a3 focusPointForPoint:(CGPoint)a4 gesture:(int64_t)a5
{
  if (a5 == 1)
  {
    double v6 = [(RAPEditLocationMapView *)self mapView];
    double v7 = [(RAPEditLocationMapView *)self mapView];
    [v7 centerCoordinate];
    double v9 = v8;
    double v11 = v10;
    double v12 = [(RAPEditLocationMapView *)self mapView];
    [v6 convertCoordinate:v12 toPointToView:v9];
    CGFloat x = v13;
    CGFloat y = v15;
  }
  else
  {
    CGFloat y = a4.y;
    CGFloat x = a4.x;
  }
  double v17 = x;
  double v18 = y;
  result.CGFloat y = v18;
  result.CGFloat x = v17;
  return result;
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  id v11 = a3;
  if (a4 == 1)
  {
    id v14 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = WeakRetained;
    if (a5 == 1) {
      [WeakRetained editLocationMapViewFinishedZoomingIn:self];
    }
    else {
      [WeakRetained editLocationMapViewFinishedZoomingOut:self];
    }
  }
  else
  {
    if (a4) {
      goto LABEL_8;
    }
    id v14 = v11;
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 editLocationMapViewFinishedPanning:self];
  }

  id v11 = v14;
LABEL_8:
}

- (NSLayoutYAxisAnchor)bottomContentGuide
{
  v2 = [(RAPEditLocationMapView *)self floatingControlsView];
  id v3 = [v2 topAnchor];

  return (NSLayoutYAxisAnchor *)v3;
}

- (NSLayoutAnchor)leadingContentGuide
{
  v2 = [(RAPEditLocationMapView *)self floatingControlsView];
  id v3 = [v2 leadingAnchor];

  return (NSLayoutAnchor *)v3;
}

- (NSLayoutAnchor)trailingContentGuide
{
  v2 = [(RAPEditLocationMapView *)self floatingControlsView];
  id v3 = [v2 trailingAnchor];

  return (NSLayoutAnchor *)v3;
}

- (void)setHideAllSuplementaryViews:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hideAllSuplementaryViews = a3;
  id v5 = [(RAPEditLocationMapView *)self floatingControlsView];
  [v5 setHidden:v3];

  id v6 = [(RAPEditLocationMapView *)self descriptionView];
  [v6 setHidden:v3];
}

- (void)updateAnnotationTitleWithCenterCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v6 = [(RAPEditLocationMapView *)self mapView];
  double v7 = [v6 _mapLayer];
  double v8 = [(RAPEditLocationMapView *)self mapView];
  [v8 convertCoordinate:self toPointToView:latitude longitude];
  double v9 = [v7 rapMarkerAtPoint:];

  [(RAPEditLocationMapView *)self setAnnotationTitle:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v10 = [v9 featureHandles];
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) featureType] == 1)
        {
          double v15 = [v9 name];
          [(RAPEditLocationMapView *)self setAnnotationTitle:v15];

          goto LABEL_11;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (BOOL)crosshairEnabled
{
  return self->_crosshairEnabled;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (NSString)annotationTitle
{
  return self->_annotationTitle;
}

- (RAPEditLocationMapViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPEditLocationMapViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hideAllSuplementaryViews
{
  return self->_hideAllSuplementaryViews;
}

- (MapViewModeSelector)mapModeSegmentedControl
{
  return self->_mapModeSegmentedControl;
}

- (void)setMapModeSegmentedControl:(id)a3
{
}

- (UIView)floatingControlsView
{
  return self->_floatingControlsView;
}

- (void)setFloatingControlsView:(id)a3
{
}

- (BlurredBackgroundLabel)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (RAPMKMarkerAnnotationView)crosshairAnnotationView
{
  return self->_crosshairAnnotationView;
}

- (void)setCrosshairAnnotationView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crosshairAnnotationView, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_floatingControlsView, 0);
  objc_storeStrong((id *)&self->_mapModeSegmentedControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationTitle, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_watermarkView, 0);
}

@end