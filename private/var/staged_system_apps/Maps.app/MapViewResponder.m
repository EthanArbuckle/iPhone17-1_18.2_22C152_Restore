@interface MapViewResponder
- (MKMapView)mapView;
- (MapViewResponder)init;
- (MapViewResponder)initWithMapView:(id)a3;
- (MapViewResponderHandling)target;
- (void)_nonselectingTapGestureRecognizerAction:(id)a3;
- (void)dealloc;
- (void)setTarget:(id)a3;
@end

@implementation MapViewResponder

- (MapViewResponder)initWithMapView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapViewResponder;
  v5 = [(MapViewResponder *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mapView, v4);
    v7 = [v4 _nonselectingTapGestureRecognizer];
    [v7 addTarget:v6 action:"_nonselectingTapGestureRecognizerAction:"];

    v8 = v6;
  }

  return v6;
}

- (void)setTarget:(id)a3
{
}

- (MapViewResponder)init
{
  id v3 = objc_alloc_init((Class)MKMapView);
  id v4 = [(MapViewResponder *)self initWithMapView:v3];

  return v4;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  id v4 = [WeakRetained _nonselectingTapGestureRecognizer];
  [v4 removeTarget:self action:0];

  v5.receiver = self;
  v5.super_class = (Class)MapViewResponder;
  [(MapViewResponder *)&v5 dealloc];
}

- (void)_nonselectingTapGestureRecognizerAction:(id)a3
{
  id v4 = a3;
  id v11 = [(MapViewResponder *)self target];
  objc_super v5 = [(MapViewResponder *)self mapView];
  v6 = [(MapViewResponder *)self mapView];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  [v11 didTapMapView:v5 atPoint:v8];
}

- (MapViewResponderHandling)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (MapViewResponderHandling *)WeakRetained;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);

  objc_destroyWeak((id *)&self->_target);
}

@end