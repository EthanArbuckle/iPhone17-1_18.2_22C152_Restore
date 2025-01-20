@interface RAPInlineMapViewModel
- (BOOL)accessPointsEnabled;
- (BOOL)allowsEditing;
- (CLLocationCoordinate2D)originalCoordinate;
- (CLLocationCoordinate2D)selectedCoordinate;
- (MKMapView)mapView;
- (NSString)instructionalText;
- (RAPInlineMapViewModelDelegate)delegate;
- (VKLabelMarker)selectedLabelMarker;
- (id)initForPickingFeatureOfKind:(int64_t)a3 centerCoordinate:(CLLocationCoordinate2D)a4 markerViewAttributes:(id)a5 accessPointsEnabled:(BOOL)a6 delegate:(id)a7;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)viewAttributeObserver;
- (int64_t)kind;
- (int64_t)selectedViewMode;
- (void)_initMapView;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)setAccessPointsEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMapView:(id)a3;
- (void)setSelectedLabelMarker:(id)a3;
- (void)setSelectedViewMode:(int64_t)a3;
- (void)setViewAttributeObserver:(id)a3;
- (void)updateCenterCoordinate:(CLLocationCoordinate2D)a3;
- (void)updateMapPickingKind:(int64_t)a3;
@end

@implementation RAPInlineMapViewModel

- (id)initForPickingFeatureOfKind:(int64_t)a3 centerCoordinate:(CLLocationCoordinate2D)a4 markerViewAttributes:(id)a5 accessPointsEnabled:(BOOL)a6 delegate:(id)a7
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v13 = a5;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RAPInlineMapViewModel;
  v15 = [(RAPInlineMapViewModel *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    v16->_kind = a3;
    v16->_selectedViewMode = 0;
    v16->_originalCoordinate.CLLocationDegrees latitude = latitude;
    v16->_originalCoordinate.CLLocationDegrees longitude = longitude;
    v16->_selectedCoordinate.CLLocationDegrees latitude = latitude;
    v16->_selectedCoordinate.CLLocationDegrees longitude = longitude;
    v17 = (RAPMarkerViewAttributes *)[v13 copy];
    markerViewAttributes = v16->_markerViewAttributes;
    v16->_markerViewAttributes = v17;

    v16->_accessPointsEnabled = a6;
    [(RAPInlineMapViewModel *)v16 _initMapView];
  }

  return v16;
}

- (void)setMapView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_mapView, obj);
    [(RAPInlineMapViewModel *)self _initMapView];
    v5 = obj;
  }
}

- (void)_initMapView
{
  p_mapView = &self->_mapView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (!WeakRetained) {
    return;
  }
  double latitude = self->_selectedCoordinate.latitude;
  double longitude = self->_selectedCoordinate.longitude;
  id v7 = objc_loadWeakRetained((id *)p_mapView);
  [v7 setCenterCoordinate:latitude, longitude];

  id v8 = objc_loadWeakRetained((id *)p_mapView);
  [v8 setDelegate:self];

  id v9 = objc_loadWeakRetained((id *)p_mapView);
  [v9 setShowsUserLocation:0];

  id v10 = objc_loadWeakRetained((id *)p_mapView);
  [v10 setShowsAttribution:0];

  v11 = +[MKPointOfInterestFilter filterIncludingAllCategories];
  id v12 = objc_loadWeakRetained((id *)p_mapView);
  [v12 setPointOfInterestFilter:v11];

  id v13 = objc_loadWeakRetained((id *)p_mapView);
  [v13 _setShowsVenues:1];

  unint64_t v14 = self->_selectedViewMode - 1;
  if (v14 > 6) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = qword_100F73650[v14];
  }
  id v16 = objc_loadWeakRetained((id *)p_mapView);
  [v16 setMapType:v15];

  BOOL v17 = [(RAPInlineMapViewModel *)self allowsEditing];
  id v18 = objc_loadWeakRetained((id *)p_mapView);
  [v18 setZoomEnabled:v17];

  BOOL v19 = [(RAPInlineMapViewModel *)self allowsEditing];
  id v20 = objc_loadWeakRetained((id *)p_mapView);
  [v20 setScrollEnabled:v19];

  BOOL v21 = [(RAPInlineMapViewModel *)self allowsEditing];
  id v22 = objc_loadWeakRetained((id *)p_mapView);
  [v22 setPitchEnabled:v21];

  BOOL v23 = [(RAPInlineMapViewModel *)self allowsEditing];
  id v24 = objc_loadWeakRetained((id *)p_mapView);
  [v24 setRotateEnabled:v23];

  BOOL v25 = [(RAPInlineMapViewModel *)self allowsEditing];
  id v26 = objc_loadWeakRetained((id *)p_mapView);
  [v26 setUserInteractionEnabled:v25];

  int64_t kind = self->_kind;
  if (kind)
  {
    if (kind != 1) {
      goto LABEL_10;
    }
    v28 = +[MKPointOfInterestFilter filterIncludingAllCategories];
    id v29 = objc_loadWeakRetained((id *)p_mapView);
    [v29 setPointOfInterestFilter:v28];
  }
  else
  {
    v28 = objc_loadWeakRetained((id *)p_mapView);
    [v28 _setCanSelectAllLabels:1];
  }

LABEL_10:
  if (CLLocationCoordinate2DIsValid(self->_selectedCoordinate))
  {
    id v30 = objc_alloc((Class)MKPointAnnotation);
    v31 = [(RAPMarkerViewAttributes *)self->_markerViewAttributes title];
    v32 = [v30 initWithCoordinate:v31 title:0 subtitle:self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude];
    centerPointAnnotation = self->_centerPointAnnotation;
    self->_centerPointAnnotation = v32;

    id v34 = objc_loadWeakRetained((id *)p_mapView);
    [v34 addAnnotation:self->_centerPointAnnotation];
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  if (self->_centerPointAnnotation == a4)
  {
    id v4 = [objc_alloc((Class)MKMarkerAnnotationView) initWithAnnotation:self->_centerPointAnnotation reuseIdentifier:@"CenterPointAnnotationView"];
    v6 = [(RAPMarkerViewAttributes *)self->_markerViewAttributes styleAttributes];
    [v4 _setStyleAttributes:v6];

    [v4 setSelected:1];
    LODWORD(v7) = 1148846080;
    [v4 setDisplayPriority:v7];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)instructionalText
{
  v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  int64_t kind = self->_kind;
  if (kind == 3)
  {
    v6 = +[NSBundle mainBundle];
    if (v4 == (id)5) {
      CFStringRef v7 = @"Click map to edit entrance. [Report an Issue]";
    }
    else {
      CFStringRef v7 = @"Tap map to edit entrance. [Report an Issue]";
    }
  }
  else if (kind == 1)
  {
    BOOL accessPointsEnabled = self->_accessPointsEnabled;
    v6 = +[NSBundle mainBundle];
    if (accessPointsEnabled)
    {
      if (v4 == (id)5) {
        CFStringRef v7 = @"Click map to edit location and entrances [Report an Issue]";
      }
      else {
        CFStringRef v7 = @"Tap map to edit location and entrances [Report an Issue]";
      }
    }
    else if (v4 == (id)5)
    {
      CFStringRef v7 = @"Click map to edit location [Report an Issue]";
    }
    else
    {
      CFStringRef v7 = @"Tap map to edit location [Report an Issue]";
    }
  }
  else
  {
    if (kind)
    {
      id v9 = &stru_101324E70;
      goto LABEL_19;
    }
    v6 = +[NSBundle mainBundle];
    if (v4 == (id)5) {
      CFStringRef v7 = @"Click map to select a label [Report an Issue]";
    }
    else {
      CFStringRef v7 = @"Tap map to select a label [Report an Issue]";
    }
  }
  id v9 = [v6 localizedStringForKey:v7 value:@"localized string not found" table:0];

LABEL_19:

  return (NSString *)v9;
}

- (void)updateMapPickingKind:(int64_t)a3
{
  if (self->_kind != a3)
  {
    self->_int64_t kind = a3;
    id v4 = [(RAPInlineMapViewModel *)self instructionalText];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained setAccessibilityLabel:v4];

    id viewAttributeObserver = self->_viewAttributeObserver;
    if (viewAttributeObserver)
    {
      CFStringRef v7 = (void (*)(void))*((void *)viewAttributeObserver + 2);
      v7();
    }
  }
}

- (void)updateCenterCoordinate:(CLLocationCoordinate2D)a3
{
  if (a3.longitude >= -180.0 && a3.longitude <= 180.0 && a3.latitude >= -90.0 && a3.latitude <= 90.0)
  {
    self->_selectedCoordinate = a3;
    p_mapView = &self->_mapView;
    int64_t kind = self->_kind;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    id v7 = WeakRetained;
    if (!kind)
    {
      id v8 = WeakRetained;
      [v8 convertCoordinate:v8 toPointToView:self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude];
      double v10 = v9;
      double v12 = v11;

      id v13 = objc_loadWeakRetained((id *)p_mapView);
      [v13 _labelMarkerAtPoint:v10, v12];
      unint64_t v14 = (VKLabelMarker *)objc_claimAutoreleasedReturnValue();
      selectedLabelMarker = self->_selectedLabelMarker;
      self->_selectedLabelMarker = v14;

      id v7 = objc_loadWeakRetained((id *)p_mapView);
    }
    [v7 setCenterCoordinate:0, self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude];

    id v16 = objc_loadWeakRetained((id *)p_mapView);
    [v16 removeAnnotation:self->_centerPointAnnotation];

    -[MKPointAnnotation setCoordinate:](self->_centerPointAnnotation, "setCoordinate:", self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);
    id v17 = objc_loadWeakRetained((id *)p_mapView);
    [v17 addAnnotation:self->_centerPointAnnotation];
  }
}

- (BOOL)allowsEditing
{
  return (self->_kind < 9uLL) & (0x1F4u >> self->_kind);
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  [a3 centerCoordinate];
  self->_selectedCoordinate.double latitude = v5;
  self->_selectedCoordinate.double longitude = v6;
}

- (void)setSelectedViewMode:(int64_t)a3
{
  if (self->_selectedViewMode != a3)
  {
    self->_selectedViewMode = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    unint64_t v5 = self->_selectedViewMode - 1;
    if (v5 > 6) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_100F73650[v5];
    }
    id v7 = WeakRetained;
    [WeakRetained setMapType:v6];
  }
}

- (int64_t)kind
{
  return self->_kind;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (int64_t)selectedViewMode
{
  return self->_selectedViewMode;
}

- (id)viewAttributeObserver
{
  return self->_viewAttributeObserver;
}

- (void)setViewAttributeObserver:(id)a3
{
}

- (CLLocationCoordinate2D)originalCoordinate
{
  double latitude = self->_originalCoordinate.latitude;
  double longitude = self->_originalCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (BOOL)accessPointsEnabled
{
  return self->_accessPointsEnabled;
}

- (void)setAccessPointsEnabled:(BOOL)a3
{
  self->_BOOL accessPointsEnabled = a3;
}

- (VKLabelMarker)selectedLabelMarker
{
  return self->_selectedLabelMarker;
}

- (void)setSelectedLabelMarker:(id)a3
{
}

- (CLLocationCoordinate2D)selectedCoordinate
{
  double latitude = self->_selectedCoordinate.latitude;
  double longitude = self->_selectedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (RAPInlineMapViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPInlineMapViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedLabelMarker, 0);
  objc_storeStrong(&self->_viewAttributeObserver, 0);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_centerPointAnnotation, 0);
  objc_storeStrong((id *)&self->_markerViewAttributes, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end