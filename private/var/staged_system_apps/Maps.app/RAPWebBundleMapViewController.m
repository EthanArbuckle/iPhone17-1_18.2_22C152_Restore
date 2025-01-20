@interface RAPWebBundleMapViewController
- ($C79183323B9A0D5602617FF3BE5395AC)_coordinatePickingMapRect;
- (BOOL)_isStreetRAP;
- (BOOL)mapViewEnabled;
- (RAPWebBundleMapDelegate)delegate;
- (RAPWebBundleMapViewController)initWithReport:(id)a3 coordinate:(CLLocationCoordinate2D)a4;
- (id)_viewAttributes;
- (id)_webBundleQuestion;
- (void)_didChangeCenterCoordinate:(CLLocationCoordinate2D)a3 fromEditLocationMapView:(id)a4;
- (void)_didTapButton;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4;
- (void)editLocationMapViewFinishedRenderingMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMapViewEnabled:(BOOL)a3;
@end

@implementation RAPWebBundleMapViewController

- (RAPWebBundleMapViewController)initWithReport:(id)a3 coordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RAPWebBundleMapViewController;
  v9 = [(RAPWebBundleMapViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_report, a3);
    v10->_originalCoordinate.CLLocationDegrees latitude = latitude;
    v10->_originalCoordinate.CLLocationDegrees longitude = longitude;
    v10->_selectedCoordinate.CLLocationDegrees latitude = latitude;
    v10->_selectedCoordinate.CLLocationDegrees longitude = longitude;
    [(RAPWebBundleMapViewController *)v10 _setupSubviews];
    [(RAPWebBundleMapViewController *)v10 _setupConstraints];
  }

  return v10;
}

- (void)setMapViewEnabled:(BOOL)a3
{
}

- (BOOL)mapViewEnabled
{
  return [(RAPEditLocationMapView *)self->_editLocationMapView isUserInteractionEnabled];
}

- ($C79183323B9A0D5602617FF3BE5395AC)_coordinatePickingMapRect
{
  double longitude = self->_selectedCoordinate.longitude;
  if (longitude < -180.0
    || longitude > 180.0
    || (double latitude = self->_selectedCoordinate.latitude, latitude < -90.0)
    || latitude > 90.0)
  {
    objc_super v12 = [(RAPReport *)self->_report initialQuestion];
    v13 = [v12 reportedPlace];
    double v5 = sub_100581834(v13);
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
  }
  else
  {
    MKCoordinateRegionMakeWithDistance(*(CLLocationCoordinate2D *)(&longitude - 1), 200.0, 200.0);
    MKMapRectForCoordinateRegion();
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  double v17 = v5;
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  result.var1.var1 = v20;
  result.var1.var0 = v19;
  result.var0.var1 = v18;
  result.var0.var0 = v17;
  return result;
}

- (void)_setupSubviews
{
  v3 = [RAPEditLocationMapView alloc];
  [(RAPWebBundleMapViewController *)self _coordinatePickingMapRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = 32;
  v13 = [(RAPReport *)self->_report _context];
  unsigned __int8 v14 = [v13 isShowingTraffic];
  if (v14)
  {
    uint64_t v15 = 7;
  }
  else
  {
    uint64_t v12 = [(RAPReport *)self->_report _context];
    id v16 = [(id)v12 mapType];
    switch((unint64_t)v16)
    {
      case 1uLL:
        uint64_t v15 = 2;
        break;
      case 2uLL:
        uint64_t v15 = 1;
        break;
      case 3uLL:
        uint64_t v15 = 6;
        break;
      case 4uLL:
        uint64_t v15 = 5;
        break;
      default:
        uint64_t v17 = 3;
        if (v16 != (id)104) {
          uint64_t v17 = 0;
        }
        if (v16 == (id)103) {
          uint64_t v15 = -1;
        }
        else {
          uint64_t v15 = v17;
        }
        break;
    }
  }
  double v18 = [(RAPWebBundleMapViewController *)self _viewAttributes];
  double v19 = -[RAPEditLocationMapView initWithMapRect:viewMode:markerViewAttributes:](v3, "initWithMapRect:viewMode:markerViewAttributes:", v15, v18, v5, v7, v9, v11);
  editLocationMapView = self->_editLocationMapView;
  self->_editLocationMapView = v19;

  if ((v14 & 1) == 0) {
  [(RAPEditLocationMapView *)self->_editLocationMapView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  [(RAPEditLocationMapView *)self->_editLocationMapView setDelegate:self];
  [(RAPEditLocationMapView *)self->_editLocationMapView setCrosshairEnabled:1];
  [(RAPEditLocationMapView *)self->_editLocationMapView setHideAllSuplementaryViews:1];
  v21 = [(RAPEditLocationMapView *)self->_editLocationMapView mapView];
  [v21 setPitchEnabled:0];

  v22 = [(RAPEditLocationMapView *)self->_editLocationMapView mapView];
  [v22 setRotateEnabled:0];

  v23 = [(RAPEditLocationMapView *)self->_editLocationMapView layer];
  [v23 setCornerRadius:10.0];

  v24 = [(RAPEditLocationMapView *)self->_editLocationMapView layer];
  [v24 setMasksToBounds:1];

  v25 = [(RAPWebBundleMapViewController *)self view];
  [v25 addSubview:self->_editLocationMapView];

  if (sub_1000BBB44(self) != 5)
  {
    v26 = +[UIButton buttonWithType:1];
    alternateButton = self->_alternateButton;
    self->_alternateButton = v26;

    v28 = +[UIImage systemImageNamed:@"arrow.up.left.and.arrow.down.right"];
    id v38 = [v28 imageWithRenderingMode:2];

    [(UIButton *)self->_alternateButton setImage:v38 forState:0];
    [(UIButton *)self->_alternateButton setAdjustsImageWhenHighlighted:0];
    v29 = +[UIColor whiteColor];
    [(UIButton *)self->_alternateButton setTintColor:v29];

    [(UIButton *)self->_alternateButton setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UIButton setContentEdgeInsets:](self->_alternateButton, "setContentEdgeInsets:", 10.0, 10.0, 10.0, 10.0);
    v30 = self->_alternateButton;
    v31 = +[UIImageSymbolConfiguration configurationWithPointSize:15.0];
    [(UIButton *)v30 setPreferredSymbolConfiguration:v31 forImageInState:0];

    [(UIButton *)self->_alternateButton addTarget:self action:"_didTapButton" forControlEvents:64];
    v32 = [(RAPWebBundleMapViewController *)self view];
    [v32 addSubview:self->_alternateButton];

    id v33 = objc_alloc((Class)UIVisualEffectView);
    v34 = +[UIBlurEffect effectWithStyle:16];
    v35 = (UIVisualEffectView *)[v33 initWithEffect:v34];
    backgroundBlurView = self->_backgroundBlurView;
    self->_backgroundBlurView = v35;

    [(UIVisualEffectView *)self->_backgroundBlurView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)self->_backgroundBlurView _setCornerRadius:6.0];
    v37 = [(RAPWebBundleMapViewController *)self view];
    [v37 insertSubview:self->_backgroundBlurView belowSubview:self->_alternateButton];
  }
}

- (void)_setupConstraints
{
  v39 = [(RAPEditLocationMapView *)self->_editLocationMapView leadingAnchor];
  v41 = [(RAPWebBundleMapViewController *)self view];
  v37 = [v41 leadingAnchor];
  v35 = [v39 constraintEqualToAnchor:v37];
  v44[0] = v35;
  v31 = [(RAPEditLocationMapView *)self->_editLocationMapView trailingAnchor];
  id v33 = [(RAPWebBundleMapViewController *)self view];
  v29 = [v33 trailingAnchor];
  v27 = [v31 constraintEqualToAnchor:v29];
  v44[1] = v27;
  v3 = [(RAPEditLocationMapView *)self->_editLocationMapView topAnchor];
  double v4 = [(RAPWebBundleMapViewController *)self view];
  double v5 = [v4 topAnchor];
  double v6 = [v3 constraintEqualToAnchor:v5];
  v44[2] = v6;
  double v7 = [(RAPEditLocationMapView *)self->_editLocationMapView bottomAnchor];
  double v8 = [(RAPWebBundleMapViewController *)self view];
  double v9 = [v8 bottomAnchor];
  double v10 = [v7 constraintEqualToAnchor:v9];
  v44[3] = v10;
  double v11 = +[NSArray arrayWithObjects:v44 count:4];
  +[NSLayoutConstraint activateConstraints:v11];

  if (sub_1000BBB44(self) != 5)
  {
    v42 = [(UIButton *)self->_alternateButton topAnchor];
    v40 = [(RAPEditLocationMapView *)self->_editLocationMapView topAnchor];
    id v38 = [v42 constraintEqualToAnchor:v40];
    v43[0] = v38;
    v36 = [(UIButton *)self->_alternateButton leadingAnchor];
    v34 = [(RAPEditLocationMapView *)self->_editLocationMapView leadingAnchor];
    v32 = [v36 constraintEqualToAnchor:v34];
    v43[1] = v32;
    v30 = [(UIButton *)self->_alternateButton heightAnchor];
    v28 = [v30 constraintEqualToConstant:40.0];
    v43[2] = v28;
    v26 = [(UIButton *)self->_alternateButton widthAnchor];
    v25 = [(UIButton *)self->_alternateButton heightAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v43[3] = v24;
    v23 = [(UIVisualEffectView *)self->_backgroundBlurView centerXAnchor];
    v22 = [(UIButton *)self->_alternateButton centerXAnchor];
    uint64_t v12 = [v23 constraintEqualToAnchor:v22];
    v43[4] = v12;
    v13 = [(UIVisualEffectView *)self->_backgroundBlurView centerYAnchor];
    unsigned __int8 v14 = [(UIButton *)self->_alternateButton centerYAnchor];
    uint64_t v15 = [v13 constraintEqualToAnchor:v14];
    v43[5] = v15;
    id v16 = [(UIVisualEffectView *)self->_backgroundBlurView heightAnchor];
    uint64_t v17 = [v16 constraintEqualToConstant:30.0];
    v43[6] = v17;
    double v18 = [(UIVisualEffectView *)self->_backgroundBlurView widthAnchor];
    double v19 = [(UIVisualEffectView *)self->_backgroundBlurView heightAnchor];
    double v20 = [v18 constraintEqualToAnchor:v19];
    v43[7] = v20;
    v21 = +[NSArray arrayWithObjects:v43 count:8];
    +[NSLayoutConstraint activateConstraints:v21];
  }
}

- (void)_didTapButton
{
  BOOL v3 = [(RAPWebBundleMapViewController *)self _isStreetRAP];
  objc_initWeak(location, self);
  v26 = [RAPWebBundleEditLocationViewController alloc];
  [(RAPWebBundleMapViewController *)self _coordinatePickingMapRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(RAPReport *)self->_report _context];
  id v25 = [v12 mapType];
  v13 = [(RAPReport *)self->_report _context];
  id v14 = [v13 isShowingTraffic];
  uint64_t v15 = [(RAPWebBundleMapViewController *)self _viewAttributes];
  if (v3) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 7;
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10084F00C;
  v29[3] = &unk_1012FABB8;
  objc_copyWeak(&v30, location);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10084F0C4;
  v27[3] = &unk_1012E6708;
  objc_copyWeak(&v28, location);
  uint64_t v17 = -[RAPWebBundleEditLocationViewController initWithInitialCoordinates:inMapRect:mapType:isShowingTraffic:analyticsTarget:markerViewAttributes:showAnnotationTitle:searchResultTypes:selectionHandler:cancelSelectionHandler:](v26, "initWithInitialCoordinates:inMapRect:mapType:isShowingTraffic:analyticsTarget:markerViewAttributes:showAnnotationTitle:searchResultTypes:selectionHandler:cancelSelectionHandler:", v25, v14, 1158, v15, v3, v16, self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude, v5, v7, v9, v11, v29, v27);
  editLocationViewController = self->_editLocationViewController;
  self->_editLocationViewController = v17;

  double v19 = [(RAPWebBundleMapViewController *)self _webBundleQuestion];
  id v20 = [v19 questionType];

  v21 = 0;
  switch((unint64_t)v20)
  {
    case 1uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0x1AuLL:
      v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"[RAP Web Module] Map Footer Correct Location" value:@"localized string not found" table:0];
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"[RAP Web Module] Map Footer Add" value:@"localized string not found" table:0];
      goto LABEL_9;
    case 9uLL:
    case 0xCuLL:
    case 0x18uLL:
    case 0x19uLL:
      v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"[RAP Web Module] Map Footer Place" value:@"localized string not found" table:0];
      goto LABEL_9;
    case 0x15uLL:
    case 0x16uLL:
      v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"[RAP Web Module] Map Footer Street" value:@"localized string not found" table:0];
LABEL_9:
      v21 = (void *)v23;

      break;
    default:
      break;
  }
  id v24 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_editLocationViewController];
  [v24 setModalPresentationStyle:2];
  [v24 setModalInPresentation:1];
  [(RAPWebBundleEditLocationViewController *)self->_editLocationViewController setPromptText:v21];
  [(RAPWebBundleMapViewController *)self presentViewController:v24 animated:1 completion:0];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
}

- (id)_webBundleQuestion
{
  BOOL v3 = [(RAPReport *)self->_report initialQuestion];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(RAPReport *)self->_report initialQuestion];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)_isStreetRAP
{
  v2 = [(RAPWebBundleMapViewController *)self _webBundleQuestion];
  BOOL v3 = [v2 questionType] == (id)21 || [v2 questionType] == (id)22;

  return v3;
}

- (void)_didChangeCenterCoordinate:(CLLocationCoordinate2D)a3 fromEditLocationMapView:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = a4;
  double v8 = [v7 mapView];
  double v9 = [v8 _mapLayer];
  double v10 = [v7 mapView];
  [v10 convertCoordinate:v7 toPointToView:latitude, longitude];
  double v12 = v11;
  double v14 = v13;

  [v9 rapMarkerAtPoint:v12, v14];
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v15 = [(RAPWebBundleMapViewController *)self delegate];
  [v15 rapWebBundleMapViewController:self marker:v16 didUpdateLocationTo:latitude longitude];
}

- (id)_viewAttributes
{
  v2 = [RAPMarkerViewAttributes alloc];
  BOOL v3 = +[GEOFeatureStyleAttributes RAPLocationStyleAttributes];
  double v4 = [(RAPMarkerViewAttributes *)v2 initWithTitle:0 styleAttributes:v3];

  return v4;
}

- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = a3;
  self->_selectedCoordinate.double latitude = latitude;
  self->_selectedCoordinate.double longitude = longitude;
  if ([(RAPWebBundleMapViewController *)self _isStreetRAP]) {
    [v7 updateAnnotationTitleWithCenterCoordinate:latitude, longitude];
  }
  -[RAPWebBundleMapViewController _didChangeCenterCoordinate:fromEditLocationMapView:](self, "_didChangeCenterCoordinate:fromEditLocationMapView:", self->_editLocationMapView, latitude, longitude);
}

- (void)editLocationMapViewFinishedRenderingMap:(id)a3
{
  if (!self->_mapIsInitialized)
  {
    id v4 = a3;
    [v4 centerCoordinate];
    -[RAPWebBundleMapViewController _didChangeCenterCoordinate:fromEditLocationMapView:](self, "_didChangeCenterCoordinate:fromEditLocationMapView:", v4);

    self->_mapIsInitialized = 1;
  }
}

- (RAPWebBundleMapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPWebBundleMapDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editLocationViewController, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_editLocationMapView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);

  objc_storeStrong((id *)&self->_alternateButton, 0);
}

@end