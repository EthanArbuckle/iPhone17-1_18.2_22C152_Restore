@interface RAPRouteStepMapViewCell
- (MKMapView)mapView;
- (RAPRouteStepMapViewCell)initWithIdentifier:(id)a3 route:(id)a4 routeStep:(id)a5;
- (TransitSteppingCameraFramer)cameraFramer;
- (void)_setupRouteAnnotationsController;
- (void)setCameraFramer:(id)a3;
- (void)setMapView:(id)a3;
@end

@implementation RAPRouteStepMapViewCell

- (RAPRouteStepMapViewCell)initWithIdentifier:(id)a3 route:(id)a4 routeStep:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)RAPRouteStepMapViewCell;
  v11 = [(RAPRouteStepMapViewCell *)&v35 initWithStyle:0 reuseIdentifier:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_route, a4);
    objc_storeStrong((id *)&v12->_routeStep, a5);
    v13 = [(RAPRouteStepMapViewCell *)v12 mapView];
    [(RAPRouteStepMapViewCell *)v12 addSubview:v13];

    v14 = +[NSMutableArray array];
    v15 = [(RAPRouteStepMapViewCell *)v12 mapView];
    v16 = [v15 topAnchor];
    v17 = [(RAPRouteStepMapViewCell *)v12 topAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v14 addObject:v18];

    v19 = [(RAPRouteStepMapViewCell *)v12 mapView];
    v20 = [v19 widthAnchor];
    v21 = [(RAPRouteStepMapViewCell *)v12 widthAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v14 addObject:v22];

    v23 = [(RAPRouteStepMapViewCell *)v12 mapView];
    v24 = [v23 leadingAnchor];
    v25 = [(RAPRouteStepMapViewCell *)v12 leadingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v14 addObject:v26];

    v27 = [(RAPRouteStepMapViewCell *)v12 mapView];
    v28 = [v27 bottomAnchor];
    v29 = [(RAPRouteStepMapViewCell *)v12 bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    [v14 addObject:v30];

    v31 = [(RAPRouteStepMapViewCell *)v12 mapView];
    v32 = [v31 heightAnchor];
    v33 = [v32 constraintEqualToConstant:110.0];
    [v14 addObject:v33];

    +[NSLayoutConstraint activateConstraints:v14];
    [(RAPRouteStepMapViewCell *)v12 _setupRouteAnnotationsController];
  }
  return v12;
}

- (void)_setupRouteAnnotationsController
{
  if (!self->_routeAnnotationsController)
  {
    v3 = objc_alloc_init(RouteAnnotationsController);
    routeAnnotationsController = self->_routeAnnotationsController;
    self->_routeAnnotationsController = v3;

    v5 = [(RAPRouteStepMapViewCell *)self mapView];
    [(RouteAnnotationsController *)self->_routeAnnotationsController setMapView:v5];

    v6 = [[RouteAnnotationsConfiguration alloc] initWithRoute:self->_route];
    [(RouteAnnotationsController *)self->_routeAnnotationsController setConfiguration:v6];
  }
}

- (TransitSteppingCameraFramer)cameraFramer
{
  cameraFramer = self->_cameraFramer;
  if (!cameraFramer)
  {
    v4 = objc_alloc_init(TransitSteppingCameraFramer);
    v5 = self->_cameraFramer;
    self->_cameraFramer = v4;

    cameraFramer = self->_cameraFramer;
  }

  return cameraFramer;
}

- (MKMapView)mapView
{
  mapView = self->_mapView;
  if (!mapView)
  {
    v4 = [objc_alloc((Class)MKMapView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_mapView;
    self->_mapView = v4;

    unsigned int v6 = [(GEOComposedRoute *)self->_route transportType];
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_1003FF538;
    v14 = &unk_1012E92C8;
    v15 = self;
    BOOL v16 = v6 == 1;
    v7 = objc_retainBlock(&v11);
    if (v6 == 1)
    {
      v8 = [(RAPRouteStepMapViewCell *)self cameraFramer];
      [v8 rectForStep:self->_routeStep stepIndex:[self->_routeStep stepIndex] handler:v7];
    }
    else
    {
      double v9 = sub_1008C0030(self->_routeStep);
      ((void (*)(void ***, double))v7[2])(v7, v9);
    }
    -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v11, v12, v13, v14);
    [(MKMapView *)self->_mapView setUserInteractionEnabled:0];
    [(MKMapView *)self->_mapView setDelegate:self];

    mapView = self->_mapView;
  }

  return mapView;
}

- (void)setMapView:(id)a3
{
}

- (void)setCameraFramer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraFramer, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_routeStep, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_routeAnnotationsController, 0);
}

@end