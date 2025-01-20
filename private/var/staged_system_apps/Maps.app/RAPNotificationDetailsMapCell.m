@interface RAPNotificationDetailsMapCell
+ (id)identifier;
- (BOOL)_showsSingleMarker;
- (MKMapView)mapView;
- (RAPNotificationDetailsMapCell)initWithCoder:(id)a3;
- (RAPNotificationDetailsMapCell)initWithFrame:(CGRect)a3;
- (_TtC4Maps31RAPNotificationDetailsViewModel)viewModel;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)_commonInit;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateMapView;
- (void)setMapView:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation RAPNotificationDetailsMapCell

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (RAPNotificationDetailsMapCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDetailsMapCell;
  v3 = -[RAPNotificationDetailsMapCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RAPNotificationDetailsMapCell *)v3 _commonInit];
  }
  return v4;
}

- (RAPNotificationDetailsMapCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDetailsMapCell;
  v3 = [(RAPNotificationDetailsMapCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RAPNotificationDetailsMapCell *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(RAPNotificationDetailsMapCell *)self _setupViews];

  [(RAPNotificationDetailsMapCell *)self _setupConstraints];
}

- (void)_setupViews
{
  v3 = +[UIColor tableCellGroupedBackgroundColor];
  [(RAPNotificationDetailsMapCell *)self setBackgroundColor:v3];

  id v4 = [objc_alloc((Class)MKMapView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(RAPNotificationDetailsMapCell *)self setMapView:v4];

  v5 = [(RAPNotificationDetailsMapCell *)self mapView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = [(RAPNotificationDetailsMapCell *)self mapView];
  [v6 setUserInteractionEnabled:0];

  v7 = [(RAPNotificationDetailsMapCell *)self mapView];
  [v7 setDelegate:self];

  v8 = [(RAPNotificationDetailsMapCell *)self mapView];
  [v8 setShowsUserLocation:0];

  v9 = [(RAPNotificationDetailsMapCell *)self mapView];
  [v9 setCompassEnabled:0];

  v10 = [(RAPNotificationDetailsMapCell *)self mapView];
  [v10 setShowsAttribution:0];

  v11 = [(RAPNotificationDetailsMapCell *)self mapView];
  [v11 setClipsToBounds:1];

  v12 = [(RAPNotificationDetailsMapCell *)self mapView];
  v13 = [v12 layer];
  [v13 setCornerRadius:6.0];

  v14 = [(RAPNotificationDetailsMapCell *)self mapView];
  v15 = [v14 layer];
  [v15 setCornerCurve:kCACornerCurveContinuous];

  v16 = [(RAPNotificationDetailsMapCell *)self mapView];
  v17 = [v16 layer];
  [v17 setMaskedCorners:12];

  id v19 = [(RAPNotificationDetailsMapCell *)self contentView];
  v18 = [(RAPNotificationDetailsMapCell *)self mapView];
  [v19 addSubview:v18];
}

- (void)_setupConstraints
{
  v26 = [(RAPNotificationDetailsMapCell *)self mapView];
  v24 = [v26 topAnchor];
  v25 = [(RAPNotificationDetailsMapCell *)self contentView];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v27[0] = v22;
  v21 = [(RAPNotificationDetailsMapCell *)self mapView];
  id v19 = [v21 leadingAnchor];
  v20 = [(RAPNotificationDetailsMapCell *)self contentView];
  v18 = [v20 leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18 constant:4.0];
  v27[1] = v17;
  v16 = [(RAPNotificationDetailsMapCell *)self mapView];
  v14 = [v16 trailingAnchor];
  v15 = [(RAPNotificationDetailsMapCell *)self contentView];
  v13 = [v15 trailingAnchor];
  v3 = [v14 constraintEqualToAnchor:v13 constant:-4.0];
  v27[2] = v3;
  id v4 = [(RAPNotificationDetailsMapCell *)self mapView];
  v5 = [v4 bottomAnchor];
  objc_super v6 = [(RAPNotificationDetailsMapCell *)self contentView];
  v7 = [v6 bottomAnchor];
  v8 = [v5 constraintEqualToAnchor:v7 constant:-4.0];
  v27[3] = v8;
  v9 = [(RAPNotificationDetailsMapCell *)self mapView];
  v10 = [v9 heightAnchor];
  v11 = [v10 constraintEqualToConstant:194.0];
  v27[4] = v11;
  v12 = +[NSArray arrayWithObjects:v27 count:5];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)setViewModel:(id)a3
{
  v5 = (_TtC4Maps31RAPNotificationDetailsViewModel *)a3;
  if (self->_viewModel != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(RAPNotificationDetailsMapCell *)self _updateMapView];
    v5 = v6;
  }
}

- (BOOL)_showsSingleMarker
{
  v3 = [(RAPNotificationDetailsMapCell *)self viewModel];
  if ([v3 displayStyle] == (id)2)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(RAPNotificationDetailsMapCell *)self viewModel];
    BOOL v4 = [v5 displayStyle] == (id)4;
  }
  return v4;
}

- (void)_updateMapView
{
  v3 = [(RAPNotificationDetailsMapCell *)self viewModel];
  unsigned int v4 = [v3 mapType];
  if (v4 > 4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_100F73DD8[v4];
  }
  objc_super v6 = [(RAPNotificationDetailsMapCell *)self mapView];
  [v6 setMapType:v5];

  v7 = [(RAPNotificationDetailsMapCell *)self viewModel];
  v8 = [v7 mapRegion];

  [v8 southLat];
  double v10 = v9;
  [v8 northLat];
  if (v10 == v11)
  {
    [v8 westLng];
    double v13 = v12;
    [v8 eastLng];
    if (v13 == v14)
    {
      [v8 southLat];
      [v8 westLng];
      MKMapRectMakeWithRadialDistance();
      id v19 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v15, v16, v17, v18];

      v8 = v19;
    }
  }
  GEOMapRectForMapRegion();
  double v23 = v20;
  double v25 = v24;
  double v26 = v21;
  double v27 = v22;
  BOOL v28 = v24 == MKMapRectNull.origin.y && v20 == MKMapRectNull.origin.x;
  double v29 = 0.0;
  if (!v28 && v21 != 0.0 && v22 != 0.0)
  {
    if ([(RAPNotificationDetailsMapCell *)self _showsSingleMarker]) {
      double v29 = 48.5;
    }
    else {
      double v29 = 0.0;
    }
    v30 = [(RAPNotificationDetailsMapCell *)self mapView];
    [v30 setVisibleMapRect:0 edgePadding:v23 v25 v26 v27 v29 0.0 0.0 0.0];
  }
  v31 = [(RAPNotificationDetailsMapCell *)self mapView];
  v32 = [(RAPNotificationDetailsMapCell *)self mapView];
  v33 = [v32 annotations];
  [v31 removeAnnotations:v33];

  v34 = [(RAPNotificationDetailsMapCell *)self viewModel];
  v35 = [v34 mapItems];

  LODWORD(v33) = [(RAPNotificationDetailsMapCell *)self _showsSingleMarker];
  v36 = [(RAPNotificationDetailsMapCell *)self viewModel];
  id v37 = [v36 displayStyle];

  if (v33)
  {
    if (v37 == (id)2)
    {
      id v38 = [v35 firstObject];
      if (!v38) {
        goto LABEL_34;
      }
      goto LABEL_32;
    }
    v47 = [(RAPNotificationDetailsMapCell *)self viewModel];
    id v48 = [v47 displayStyle];

    if (v48 == (id)4)
    {
      v49 = [(RAPNotificationDetailsMapCell *)self viewModel];
      v50 = [v49 updatedLabel];

      id v51 = objc_alloc((Class)MKPlacemark);
      v52 = [v50 center];
      [v52 lat];
      CLLocationDegrees v54 = v53;
      v55 = [v50 center];
      [v55 lng];
      CLLocationCoordinate2D v57 = CLLocationCoordinate2DMake(v54, v56);
      id v58 = [v51 initWithCoordinate:0 addressDictionary:v57.latitude, v57.longitude];

      id v38 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v58];
      v59 = [v50 localizedText];
      [v38 setName:v59];

      if (v38)
      {
LABEL_32:
        v60 = [[RAPAnnotation alloc] initWithMapItem:v38];
        v61 = [(RAPNotificationDetailsMapCell *)self mapView];
        [v61 addAnnotation:v60];

        v62 = [(RAPNotificationDetailsMapCell *)self mapView];
        [v62 selectAnnotation:v60 animated:0];

        [(RAPAnnotation *)v60 coordinate];
        MKMapPoint v63 = MKMapPointForCoordinate(v74);
        v75.origin.double x = v23;
        v75.origin.double y = v25;
        v75.size.double width = v26;
        v75.size.double height = v27;
        MKMapRect v76 = MKMapRectOffset(v75, v63.x - (v23 + v26 * 0.5), v63.y - (v25 + v27 * 0.5));
        double x = v76.origin.x;
        double y = v76.origin.y;
        double width = v76.size.width;
        double height = v76.size.height;
        v68 = [(RAPNotificationDetailsMapCell *)self mapView];
        [v68 setVisibleMapRect:0, x, y, width, height, v29, 0.0, 0.0, 0.0];

LABEL_33:
      }
    }
  }
  else if (v37 == (id)5)
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v38 = v35;
    id v39 = [v38 countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v70;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v70 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          v44 = [RAPAnnotation alloc];
          v45 = -[RAPAnnotation initWithMapItem:](v44, "initWithMapItem:", v43, (void)v69);
          v46 = [(RAPNotificationDetailsMapCell *)self mapView];
          [v46 addAnnotation:v45];
        }
        id v40 = [v38 countByEnumeratingWithState:&v69 objects:v73 count:16];
      }
      while (v40);
    }
    goto LABEL_33;
  }
LABEL_34:
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dequeueReusableAnnotationViewWithIdentifier:@"RAPNotificationMarker"];
  if (!v6) {
    id v6 = [objc_alloc((Class)MKMarkerAnnotationView) initWithAnnotation:v5 reuseIdentifier:@"RAPNotificationMarker"];
  }
  [v6 setDraggable:0];
  v7 = [v5 styleAttributes];
  if (!v7)
  {
    v7 = +[GEOFeatureStyleAttributes RAPLocationStyleAttributes];
  }
  [v6 _setStyleAttributes:v7];
  [v6 setAnnotation:v5];

  return v6;
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end