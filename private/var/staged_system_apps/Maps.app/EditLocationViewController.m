@interface EditLocationViewController
- (BOOL)isShowingTraffic;
- (CLLocationCoordinate2D)featureCoordinate;
- (CLLocationCoordinate2D)selectedCoordinate;
- (EditLocationViewController)initWithInitialCoordinates:(CLLocationCoordinate2D)a3 inMapRect:(id)a4 analyticsTarget:(int)a5 markerViewAttributes:(id)a6;
- (RAPEditLocationMapView)editLocationMapView;
- (RAPMarkerViewAttributes)attributes;
- (id)changeHandler;
- (int)analyticsTarget;
- (unint64_t)mapType;
- (void)_captureUserAction:(int)a3;
- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4;
- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4;
- (void)editLocationMapViewFinishedPanning:(id)a3;
- (void)editLocationMapViewFinishedZoomingIn:(id)a3;
- (void)editLocationMapViewFinishedZoomingOut:(id)a3;
- (void)setAnalyticsTarget:(int)a3;
- (void)setAttributes:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setEditLocationMapView:(id)a3;
- (void)setFeatureCoordinate:(CLLocationCoordinate2D)a3;
- (void)setIsShowingTraffic:(BOOL)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setupConstraints;
- (void)viewDidLoad;
@end

@implementation EditLocationViewController

- (EditLocationViewController)initWithInitialCoordinates:(CLLocationCoordinate2D)a3 inMapRect:(id)a4 analyticsTarget:(int)a5 markerViewAttributes:(id)a6
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v9 = a4.var0.var1;
  double v10 = a4.var0.var0;
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)EditLocationViewController;
  v15 = [(EditLocationViewController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_mapRect.origin.x = v10;
    v15->_mapRect.origin.y = v9;
    v15->_mapRect.size.width = var0;
    v15->_mapRect.size.height = var1;
    v15->_featureCoordinate.CLLocationDegrees latitude = latitude;
    v15->_featureCoordinate.CLLocationDegrees longitude = longitude;
    v15->_analyticsTarget = a5;
    v17 = (RAPMarkerViewAttributes *)[v14 copy];
    attributes = v16->_attributes;
    v16->_attributes = v17;
  }
  return v16;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)EditLocationViewController;
  [(EditLocationViewController *)&v16 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(EditLocationViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [RAPEditLocationMapView alloc];
  if ([(EditLocationViewController *)self isShowingTraffic])
  {
    uint64_t v6 = 7;
  }
  else
  {
    unint64_t v7 = [(EditLocationViewController *)self mapType];
    switch(v7)
    {
      case 1uLL:
        uint64_t v6 = 2;
        break;
      case 2uLL:
        uint64_t v6 = 1;
        break;
      case 3uLL:
        uint64_t v6 = 6;
        break;
      case 4uLL:
        uint64_t v6 = 5;
        break;
      default:
        uint64_t v8 = 3;
        if (v7 != 104) {
          uint64_t v8 = 0;
        }
        if (v7 == 103) {
          uint64_t v6 = -1;
        }
        else {
          uint64_t v6 = v8;
        }
        break;
    }
  }
  double v9 = -[RAPEditLocationMapView initWithMapRect:viewMode:markerViewAttributes:](v5, "initWithMapRect:viewMode:markerViewAttributes:", v6, self->_attributes, self->_mapRect.origin.x, self->_mapRect.origin.y, self->_mapRect.size.width, self->_mapRect.size.height);
  editLocationMapView = self->_editLocationMapView;
  self->_editLocationMapView = v9;

  [(RAPEditLocationMapView *)self->_editLocationMapView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RAPEditLocationMapView *)self->_editLocationMapView setDelegate:self];
  [(RAPEditLocationMapView *)self->_editLocationMapView setCrosshairEnabled:1];
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"Pan & zoom map to refine location [Report an Issue]" value:@"localized string not found" table:0];
  [(RAPEditLocationMapView *)self->_editLocationMapView setPrompt:v12];

  v13 = [(EditLocationViewController *)self view];
  [v13 addSubview:self->_editLocationMapView];

  [(EditLocationViewController *)self setupConstraints];
  id v14 = [(EditLocationViewController *)self navigationItem];
  v15 = [v14 rightBarButtonItem];
  [v15 setEnabled:0];
}

- (void)setupConstraints
{
  v24 = [(EditLocationViewController *)self editLocationMapView];
  v22 = [v24 leadingAnchor];
  v23 = [(EditLocationViewController *)self view];
  v21 = [v23 leadingAnchor];
  objc_super v20 = [v22 constraintEqualToAnchor:v21];
  v25[0] = v20;
  v19 = [(EditLocationViewController *)self editLocationMapView];
  v17 = [v19 trailingAnchor];
  v18 = [(EditLocationViewController *)self view];
  objc_super v16 = [v18 trailingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v25[1] = v15;
  id v14 = [(EditLocationViewController *)self editLocationMapView];
  v13 = [v14 topAnchor];
  v3 = [(EditLocationViewController *)self view];
  v4 = [v3 safeAreaLayoutGuide];
  v5 = [v4 topAnchor];
  uint64_t v6 = [v13 constraintEqualToAnchor:v5];
  v25[2] = v6;
  unint64_t v7 = [(EditLocationViewController *)self editLocationMapView];
  uint64_t v8 = [v7 bottomAnchor];
  double v9 = [(EditLocationViewController *)self view];
  double v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v25[3] = v11;
  v12 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (CLLocationCoordinate2D)selectedCoordinate
{
  v2 = [(EditLocationViewController *)self editLocationMapView];
  [v2 centerCoordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CLLocationDegrees longitude = v8;
  result.CLLocationDegrees latitude = v7;
  return result;
}

- (void)_captureUserAction:(int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    uint64_t v4 = [(EditLocationViewController *)self analyticsTarget];
    +[GEOAPPortal captureUserAction:v3 target:v4 value:0];
  }
}

- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double v7 = [(EditLocationViewController *)self navigationItem];
  double v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:1];

  double v9 = [(EditLocationViewController *)self changeHandler];

  if (v9)
  {
    double v10 = [(EditLocationViewController *)self changeHandler];
    v10[2](latitude, longitude);
  }
}

- (void)editLocationMapViewFinishedPanning:(id)a3
{
}

- (void)editLocationMapViewFinishedZoomingIn:(id)a3
{
}

- (void)editLocationMapViewFinishedZoomingOut:(id)a3
{
}

- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)a4 <= 2)
  {
    id v7 = v6;
    [(EditLocationViewController *)self _captureUserAction:dword_100F6F0E0[a4]];
    id v6 = v7;
  }
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (RAPEditLocationMapView)editLocationMapView
{
  return self->_editLocationMapView;
}

- (void)setEditLocationMapView:(id)a3
{
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (CLLocationCoordinate2D)featureCoordinate
{
  double latitude = self->_featureCoordinate.latitude;
  double longitude = self->_featureCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setFeatureCoordinate:(CLLocationCoordinate2D)a3
{
  self->_featureCoordinate = a3;
}

- (RAPMarkerViewAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (BOOL)isShowingTraffic
{
  return self->_isShowingTraffic;
}

- (void)setIsShowingTraffic:(BOOL)a3
{
  self->_isShowingTraffic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_editLocationMapView, 0);

  objc_storeStrong(&self->_changeHandler, 0);
}

@end