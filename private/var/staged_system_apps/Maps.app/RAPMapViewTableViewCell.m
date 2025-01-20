@interface RAPMapViewTableViewCell
- (RAPMapViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 viewModel:(id)a5;
- (void)layoutSubviews;
- (void)setupConstraints;
- (void)setupSubviews;
@end

@implementation RAPMapViewTableViewCell

- (RAPMapViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 viewModel:(id)a5
{
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RAPMapViewTableViewCell;
  v10 = [(RAPMapViewTableViewCell *)&v19 initWithStyle:a3 reuseIdentifier:a4];
  v11 = v10;
  if (v10)
  {
    p_viewModel = (id *)&v10->_viewModel;
    objc_storeStrong((id *)&v10->_viewModel, a5);
    v13 = (MKMapView *)objc_alloc_init((Class)MKMapView);
    mapView = v11->_mapView;
    v11->_mapView = v13;

    [(MKMapView *)v11->_mapView setTranslatesAutoresizingMaskIntoConstraints:0];
    [*p_viewModel setMapView:v11->_mapView];
    id v15 = [objc_alloc((Class)MKMarkerAnnotationView) initWithAnnotation:0 reuseIdentifier:0];
    v16 = +[GEOFeatureStyleAttributes homeStyleAttributes];
    [v15 _setStyleAttributes:v16];

    [(RAPMapViewTableViewCell *)v11 setupSubviews];
    [(RAPMapViewTableViewCell *)v11 setupConstraints];
    [(RAPMapViewTableViewCell *)v11 setSelectionStyle:0];
    v17 = [*p_viewModel instructionalText];
    [(RAPMapViewTableViewCell *)v11 setAccessibilityLabel:v17];
  }
  return v11;
}

- (void)setupSubviews
{
  [(MKMapView *)self->_mapView setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [(RAPMapViewTableViewCell *)self contentView];
  [v3 addSubview:self->_mapView];

  [(RAPInlineMapViewModel *)self->_viewModel selectedCoordinate];
  MKCoordinateRegion v14 = MKCoordinateRegionMakeWithDistance(v13, 200.0, 200.0);
  -[MKMapView setRegion:animated:](self->_mapView, "setRegion:animated:", 1, v14.center.latitude, v14.center.longitude, v14.span.latitudeDelta, v14.span.longitudeDelta);
  [(MKMapView *)self->_mapView setShowsUserLocation:1];
  [(MKMapView *)self->_mapView setUserTrackingMode:1 animated:1];
  v4 = -[BlurredBackgroundLabel initWithFrame:]([BlurredBackgroundLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  descriptionBackgroundView = self->_descriptionBackgroundView;
  self->_descriptionBackgroundView = v4;

  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [(BlurredBackgroundLabel *)self->_descriptionBackgroundView setGroupName:v7];

  [(BlurredBackgroundLabel *)self->_descriptionBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(RAPInlineMapViewModel *)self->_viewModel instructionalText];
  [(BlurredBackgroundLabel *)self->_descriptionBackgroundView setText:v8];

  id v9 = [(RAPMapViewTableViewCell *)self contentView];
  [v9 addSubview:self->_mapView];

  mapView = self->_mapView;
  v11 = self->_descriptionBackgroundView;

  [(MKMapView *)mapView addSubview:v11];
}

- (void)setupConstraints
{
  v3 = [(RAPMapViewTableViewCell *)self contentView];
  v4 = [(BlurredBackgroundLabel *)self->_descriptionBackgroundView leadingAnchor];
  v5 = [(RAPMapViewTableViewCell *)self leadingAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  v34[0] = v6;
  v7 = [(BlurredBackgroundLabel *)self->_descriptionBackgroundView trailingAnchor];
  v8 = [(RAPMapViewTableViewCell *)self trailingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  v34[1] = v9;
  v10 = +[NSArray arrayWithObjects:v34 count:2];

  unsigned int v11 = [(RAPInlineMapViewModel *)self->_viewModel allowsEditing];
  descriptionBackgroundView = self->_descriptionBackgroundView;
  if (v11)
  {
    CLLocationCoordinate2D v13 = [(BlurredBackgroundLabel *)descriptionBackgroundView topAnchor];
    [v3 topAnchor];
  }
  else
  {
    CLLocationCoordinate2D v13 = [(BlurredBackgroundLabel *)descriptionBackgroundView bottomAnchor];
    [v3 bottomAnchor];
  MKCoordinateRegion v14 = };
  id v15 = [v13 constraintEqualToAnchor:v14];

  v32 = [v10 arrayByAddingObject:v15];

  +[NSLayoutConstraint activateConstraints:v32];
  v31 = [(MKMapView *)self->_mapView topAnchor];
  v30 = [v3 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v33[0] = v29;
  v28 = [(MKMapView *)self->_mapView bottomAnchor];
  v27 = [v3 bottomAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v33[1] = v26;
  v25 = [(MKMapView *)self->_mapView leadingAnchor];
  v16 = [(RAPMapViewTableViewCell *)self leadingAnchor];
  v17 = [v25 constraintEqualToAnchor:v16];
  v33[2] = v17;
  v18 = [(MKMapView *)self->_mapView trailingAnchor];
  objc_super v19 = [(RAPMapViewTableViewCell *)self trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v33[3] = v20;
  v21 = [v3 heightAnchor];
  v22 = [(BlurredBackgroundLabel *)self->_descriptionBackgroundView heightAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:235.0];
  v33[4] = v23;
  v24 = +[NSArray arrayWithObjects:v33 count:5];

  +[NSLayoutConstraint activateConstraints:v24];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)RAPMapViewTableViewCell;
  [(RAPMapViewTableViewCell *)&v12 layoutSubviews];
  -[BlurredBackgroundLabel systemLayoutSizeFittingSize:](self->_descriptionBackgroundView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v4 = v3;
  v5 = +[UIApplication sharedApplication];
  id v6 = [v5 userInterfaceLayoutDirection];

  mapView = self->_mapView;
  [(RAPMapViewTableViewCell *)self safeAreaInsets];
  double v9 = v8;
  if (v6 == (id)1)
  {
    double v9 = v8 + 8.0;
    [(RAPMapViewTableViewCell *)self safeAreaInsets];
  }
  else
  {
    [(RAPMapViewTableViewCell *)self safeAreaInsets];
    double v10 = v11 + 8.0;
  }
  -[MKMapView _setAttributionInsets:](mapView, "_setAttributionInsets:", 0.0, v9, v4, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_descriptionBackgroundView, 0);
}

@end