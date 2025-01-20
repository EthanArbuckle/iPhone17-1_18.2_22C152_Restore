@interface MapGestureCardDismissalHelper
- (BOOL)hasContinuousGestureInProgress;
- (MapGestureCardDismissalHelper)initWithMapView:(id)a3;
- (MapGestureCardDismissalHelperDelegate)delegate;
- (double)insidenessForGesture:(id)a3;
- (void)continuousGestureDidBegin:(id)a3;
- (void)continuousGestureDidChange:(id)a3;
- (void)continuousGestureDidEnd:(id)a3;
- (void)dealloc;
- (void)dismissCard;
- (void)handleMapViewContinuousGesture:(id)a3;
- (void)handleMapViewDiscreteGesture:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MapGestureCardDismissalHelper

- (MapGestureCardDismissalHelper)initWithMapView:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MapGestureCardDismissalHelper;
  v6 = [(MapGestureCardDismissalHelper *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapView, a3);
    uint64_t v8 = +[NSMutableDictionary dictionary];
    insidenessByGesture = v7->_insidenessByGesture;
    v7->_insidenessByGesture = (NSMutableDictionary *)v8;

    v10 = [(MKMapView *)v7->_mapView _panningGestureRecognizer];
    [v10 addTarget:v7 action:"handleMapViewContinuousGesture:"];

    v11 = [(MKMapView *)v7->_mapView _pinchGestureRecognizer];
    [v11 addTarget:v7 action:"handleMapViewContinuousGesture:"];

    v12 = [(MKMapView *)v7->_mapView _oneHandedZoomGestureRecognizer];
    [v12 addTarget:v7 action:"handleMapViewContinuousGesture:"];

    v13 = [(MKMapView *)v7->_mapView _rotationGestureRecognizer];
    [v13 addTarget:v7 action:"handleMapViewContinuousGesture:"];

    v14 = [(MKMapView *)v7->_mapView _doubleTapGestureRecognizer];
    [v14 addTarget:v7 action:"handleMapViewDiscreteGesture:"];

    v15 = [(MKMapView *)v7->_mapView _twoFingerTapGestureRecognizer];
    [v15 addTarget:v7 action:"handleMapViewDiscreteGesture:"];

    v16 = v7;
  }

  return v7;
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  v3 = [(MKMapView *)self->_mapView _panningGestureRecognizer];
  [v3 removeTarget:self action:"handleMapViewContinuousGesture:"];

  v4 = [(MKMapView *)self->_mapView _pinchGestureRecognizer];
  [v4 removeTarget:self action:"handleMapViewContinuousGesture:"];

  id v5 = [(MKMapView *)self->_mapView _oneHandedZoomGestureRecognizer];
  [v5 removeTarget:self action:"handleMapViewContinuousGesture:"];

  v6 = [(MKMapView *)self->_mapView _rotationGestureRecognizer];
  [v6 removeTarget:self action:"handleMapViewContinuousGesture:"];

  v7 = [(MKMapView *)self->_mapView _doubleTapGestureRecognizer];
  [v7 removeTarget:self action:"handleMapViewDiscreteGesture:"];

  uint64_t v8 = [(MKMapView *)self->_mapView _twoFingerTapGestureRecognizer];
  [v8 removeTarget:self action:"handleMapViewDiscreteGesture:"];

  v9.receiver = self;
  v9.super_class = (Class)MapGestureCardDismissalHelper;
  [(MapGestureCardDismissalHelper *)&v9 dealloc];
}

- (void)continuousGestureDidBegin:(id)a3
{
  id v4 = a3;
  unint64_t activeGestureCount = self->_activeGestureCount;
  self->_unint64_t activeGestureCount = activeGestureCount + 1;
  if (!activeGestureCount)
  {
    id v11 = v4;
    v6 = [(MapGestureCardDismissalHelper *)self delegate];
    self->_shouldIgnoreGestures = [v6 cardDismissalHelperShouldObserveGestures:self] ^ 1;
    [v6 dismissalRectTopEdgeForCardDismissalHelper:self coordinateSpace:self->_mapView];
    self->_dismissalRectTopEdge = v7 + -80.0;

    id v4 = v11;
  }
  if (!self->_shouldIgnoreGestures)
  {
    id v12 = v4;
    [(MapGestureCardDismissalHelper *)self insidenessForGesture:v4];
    uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    insidenessByGesture = self->_insidenessByGesture;
    v10 = +[NSValue valueWithNonretainedObject:v12];
    [(NSMutableDictionary *)insidenessByGesture setObject:v8 forKeyedSubscript:v10];

    id v4 = v12;
  }
}

- (void)continuousGestureDidEnd:(id)a3
{
  id v4 = a3;
  if (!self->_shouldIgnoreGestures)
  {
    insidenessByGesture = self->_insidenessByGesture;
    id v8 = v4;
    v6 = +[NSValue valueWithNonretainedObject:v4];
    [(NSMutableDictionary *)insidenessByGesture removeObjectForKey:v6];

    id v4 = v8;
  }
  unint64_t v7 = self->_activeGestureCount - 1;
  self->_unint64_t activeGestureCount = v7;
  if (!v7)
  {
    *(_WORD *)&self->_shouldIgnoreGestures = 0;
    self->_dismissalRectTopEdge = 1.79769313e308;
  }
}

- (void)continuousGestureDidChange:(id)a3
{
  id v4 = a3;
  if (self->_shouldIgnoreGestures) {
    goto LABEL_13;
  }
  id v17 = v4;
  id v5 = [(MKMapView *)self->_mapView _rotationGestureRecognizer];

  if (v5 == v17)
  {
LABEL_9:
    [(MapGestureCardDismissalHelper *)self dismissCard];
    id v8 = v17;
    goto LABEL_10;
  }
  id v6 = [(MKMapView *)self->_mapView _oneHandedZoomGestureRecognizer];
  if (v6 == v17)
  {

    id v8 = v17;
LABEL_7:
    [v8 scale];
    id v8 = v17;
    if (v9 >= 0.910000026 && v9 <= 1.86000001) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v7 = [(MKMapView *)self->_mapView _pinchGestureRecognizer];

  id v8 = v17;
  if (v7 == v17) {
    goto LABEL_7;
  }
LABEL_10:
  v10 = +[NSValue valueWithNonretainedObject:v8];
  id v11 = [(NSMutableDictionary *)self->_insidenessByGesture objectForKeyedSubscript:v10];
  [v11 floatValue];
  double v13 = v12;

  [(MapGestureCardDismissalHelper *)self insidenessForGesture:v17];
  double v15 = v14;
  v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(NSMutableDictionary *)self->_insidenessByGesture setObject:v16 forKeyedSubscript:v10];

  if (v15 > v13) {
    [(MapGestureCardDismissalHelper *)self dismissCard];
  }

  id v4 = v17;
LABEL_13:
}

- (BOOL)hasContinuousGestureInProgress
{
  return self->_activeGestureCount != 0;
}

- (void)dismissCard
{
  if ([(MapGestureCardDismissalHelper *)self hasContinuousGestureInProgress])
  {
    if (self->_didDismiss) {
      return;
    }
    self->_didDismiss = 1;
  }
  id v3 = [(MapGestureCardDismissalHelper *)self delegate];
  [v3 requestDismissalWithCardDismissalHelper:self];
}

- (double)insidenessForGesture:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 numberOfTouches];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    double v8 = 0.0;
    do
    {
      [v4 locationOfTouch:v7 inView:self->_mapView];
      double dismissalRectTopEdge = self->_dismissalRectTopEdge;
      double v11 = fmax(v8, v10 - dismissalRectTopEdge);
      if (v10 > dismissalRectTopEdge) {
        double v8 = v11;
      }
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (void)handleMapViewContinuousGesture:(id)a3
{
  id v7 = a3;
  id v4 = (char *)[v7 state];
  if ((unint64_t)(v4 - 3) < 2)
  {
    [(MapGestureCardDismissalHelper *)self continuousGestureDidEnd:v7];
    goto LABEL_8;
  }
  if (v4 == (char *)2)
  {
    [(MapGestureCardDismissalHelper *)self continuousGestureDidChange:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == (char *)1;
  id v6 = v7;
  if (v5)
  {
    [(MapGestureCardDismissalHelper *)self continuousGestureDidBegin:v7];
LABEL_8:
    id v6 = v7;
  }
}

- (void)handleMapViewDiscreteGesture:(id)a3
{
  id v4 = [(MapGestureCardDismissalHelper *)self delegate];
  unsigned int v5 = [v4 cardDismissalHelperShouldObserveGestures:self];

  if (v5)
  {
    [(MapGestureCardDismissalHelper *)self dismissCard];
  }
}

- (MapGestureCardDismissalHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapGestureCardDismissalHelperDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_insidenessByGesture, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end