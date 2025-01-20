@interface MapQuickActionMenuPresenter
- (BOOL)_isValidLabelMarkerForInitiatingOrbGesture:(id)a3;
- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4;
- (MKAnnotation)annotation;
- (MapQuickActionMenuPresenter)initWithMapView:(id)a3;
- (MapQuickActionMenuPresenter)initWithView:(id)a3;
- (id)_imageForStyleAttributes:(id)a3 screenScale:(double)a4 isNightMode:(BOOL)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)previewViewController;
- (void)_fetchImageForLabelMarkerWithCompletion:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)invalidateIfNeeded;
- (void)reset;
- (void)setAnnotation:(id)a3;
@end

@implementation MapQuickActionMenuPresenter

- (MapQuickActionMenuPresenter)initWithMapView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapQuickActionMenuPresenter;
  v6 = [(QuickActionMenuPresenter *)&v11 initWithView:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapView, a3);
    uint64_t v8 = geo_dispatch_queue_create_with_qos();
    iconFetchingQueue = v7->_iconFetchingQueue;
    v7->_iconFetchingQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (MapQuickActionMenuPresenter)initWithView:(id)a3
{
  return [(MapQuickActionMenuPresenter *)self initWithMapView:0];
}

- (void)invalidateIfNeeded
{
  p_containerView = &self->_containerView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_containerView);
    [v5 removeFromSuperview];

    objc_storeWeak((id *)p_containerView, 0);
  }

  [(MapQuickActionMenuPresenter *)self reset];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MapQuickActionMenuPresenter;
  [(MapQuickActionMenuPresenter *)&v4 dealloc];
}

- (void)reset
{
  v6.receiver = self;
  v6.super_class = (Class)MapQuickActionMenuPresenter;
  [(QuickActionMenuPresenter *)&v6 reset];
  labelMarker = self->super._labelMarker;
  self->super._labelMarker = 0;

  searchResult = self->super._searchResult;
  self->super._searchResult = 0;

  resolvedMapItem = self->super._resolvedMapItem;
  self->super._resolvedMapItem = 0;
}

- (id)previewViewController
{
  v3 = [[PreviewViewController alloc] initWithNibName:0 bundle:0];
  [(PreviewViewController *)v3 setLabelMarker:self->super._labelMarker searchresult:self->super._searchResult mapView:self->_mapView];

  return v3;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  objc_super v6 = [(QuickActionMenuPresenter *)self containerViewController];
  uint64_t v7 = sub_1000BBB44(v6);

  if (v7 == 5)
  {
    id v8 = 0;
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100ADF8D4;
    v21[3] = &unk_1012F3FB8;
    id v22 = [objc_alloc((Class)UIImageView) initWithFrame:0.0, 0.0, 50.0, 50.0];
    id v9 = v22;
    [(MapQuickActionMenuPresenter *)self _fetchImageForLabelMarkerWithCompletion:v21];
    v10 = [v9 layer];
    [v10 setCornerRadius:25.0];

    [v9 setClipsToBounds:1];
    id v11 = objc_alloc((Class)UIView);
    v12 = [(QuickActionMenuPresenter *)self containerViewController];
    v13 = [v12 view];
    [v13 bounds];
    id v14 = [v11 initWithFrame:];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(QuickActionMenuPresenter *)self containerViewController];
    v16 = [v15 view];
    [v16 addSubview:v14];

    objc_storeWeak((id *)&self->_containerView, v14);
    id v17 = objc_alloc((Class)UIPreviewTarget);
    [(QuickActionMenuPresenter *)self location];
    id v18 = [v17 initWithContainer:v14];
    v19 = objc_opt_new();
    id v8 = [objc_alloc((Class)UITargetedPreview) initWithView:v9 parameters:v19 target:v18];
  }

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  if (a5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100ADF9B4;
    v6[3] = &unk_1012E5D08;
    v6[4] = self;
    [a5 addCompletion:v6 a4];
  }
  else
  {
    [(MapQuickActionMenuPresenter *)self invalidateIfNeeded];
  }
}

- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [v7 hitTest:0 withEvent:x, y];
  -[MKMapView convertPoint:fromView:](self->_mapView, "convertPoint:fromView:", v7, x, y);
  double v10 = v9;
  double v12 = v11;
  if ([(MKMapView *)self->_mapView calloutViewContainsPoint:"calloutViewContainsPoint:"])
  {
    v13 = [(MKMapView *)self->_mapView selectedAnnotations];
    id v14 = [v13 count];

    if (v14 == (id)1)
    {
      v15 = [(MKMapView *)self->_mapView selectedAnnotations];
      v16 = [v15 firstObject];

      [(MapQuickActionMenuPresenter *)self setAnnotation:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v16 annotation];

        v16 = (void *)v17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(QuickActionMenuPresenter *)self setSearchResult:v16];
        id v18 = self;
        uint64_t v19 = 4;
        goto LABEL_20;
      }
    }
    v16 = [(MKMapView *)self->_mapView _selectedLabelMarker];
    if (![(MapQuickActionMenuPresenter *)self _isValidLabelMarkerForInitiatingOrbGesture:v16])
    {
      BOOL v34 = 0;
      goto LABEL_34;
    }
    [(QuickActionMenuPresenter *)self setLabelMarker:v16];
    [(QuickActionMenuPresenter *)self setUiTarget:4];
    if (![v16 isTransitLine])
    {
LABEL_21:
      BOOL v34 = 1;
LABEL_34:

      goto LABEL_35;
    }
    id v18 = self;
    uint64_t v19 = 7;
LABEL_20:
    [(QuickActionMenuPresenter *)v18 setUiTarget:v19];
    goto LABEL_21;
  }
  if ([v8 isDescendantOfView:self->_mapView])
  {
    [(MKMapView *)self->_mapView _edgeInsets];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    [(MKMapView *)self->_mapView bounds];
    v39.origin.double x = v23 + v28;
    v39.origin.double y = v21 + v29;
    v39.size.width = v30 - (v23 + v27);
    v39.size.height = v31 - (v21 + v25);
    v38.double x = v10;
    v38.double y = v12;
    if (CGRectContainsPoint(v39, v38))
    {
      v16 = -[MKMapView _annotationAtPoint:avoidCurrent:](self->_mapView, "_annotationAtPoint:avoidCurrent:", 0, v10, v12);
      [(MapQuickActionMenuPresenter *)self setAnnotation:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v32 = [v16 annotation];

        v16 = (void *)v32;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(QuickActionMenuPresenter *)self setSearchResult:v16];
        unsigned int v33 = [(SearchResult *)self->super._searchResult appearance];
        if (v33 == 1)
        {
          id v18 = self;
          uint64_t v19 = 5;
        }
        else if (v33 == 3)
        {
          id v18 = self;
          uint64_t v19 = 6;
        }
        else
        {
          id v18 = self;
          uint64_t v19 = 0;
        }
        goto LABEL_20;
      }
      v35 = -[MKMapView _labelMarkerAtPoint:](self->_mapView, "_labelMarkerAtPoint:", v10, v12);
      if ([(MapQuickActionMenuPresenter *)self _isValidLabelMarkerForInitiatingOrbGesture:v35])
      {
        [(QuickActionMenuPresenter *)self setLabelMarker:v35];
        if (![v35 isTransitLine])
        {
          BOOL v34 = 1;
          [(QuickActionMenuPresenter *)self setUiTarget:1];
          goto LABEL_33;
        }
        [(QuickActionMenuPresenter *)self setUiTarget:7];
      }
      else
      {
        if (sub_1000BBB44(self->_mapView) != 5)
        {
          BOOL v34 = 0;
          goto LABEL_33;
        }
        -[MKMapView convertPoint:toCoordinateFromView:](self->_mapView, "convertPoint:toCoordinateFromView:", v7, x, y);
        v36 = +[SearchResult customSearchResultWithCoordinate:](SearchResult, "customSearchResultWithCoordinate:");
        [(QuickActionMenuPresenter *)self setSearchResult:v36];
      }
      BOOL v34 = 1;
LABEL_33:

      goto LABEL_34;
    }
  }
  BOOL v34 = 0;
LABEL_35:

  return v34;
}

- (BOOL)_isValidLabelMarkerForInitiatingOrbGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(QuickActionMenuPresenter *)self delegate];
  LOBYTE(self) = [v5 mapQuickActionMenuPresenter:self shouldBeginOrbGestureForLabelMarkerOnMap:v4];

  return (char)self;
}

- (void)_fetchImageForLabelMarkerWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    uint64_t v5 = [(QuickActionMenuPresenter *)self presentingViewController];
    objc_super v6 = [v5 view];
    id v7 = [v6 window];
    id v8 = [v7 screen];
    double v9 = v8;
    if (v8)
    {
      [v8 scale];
      uint64_t v11 = v10;
    }
    else
    {
      double v12 = +[UIScreen mainScreen];
      [v12 scale];
      uint64_t v11 = v13;
    }
    id v14 = [(VKLabelMarker *)self->super._labelMarker iconImageKeys];
    unsigned int v15 = [(VKLabelMarker *)self->super._labelMarker featureType];
    v16 = [(MKMapView *)self->_mapView traitCollection];
    BOOL v17 = [v16 userInterfaceStyle] == (id)2;

    id v18 = [(VKLabelMarker *)self->super._labelMarker styleAttributes];
    iconFetchingQueue = self->_iconFetchingQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100ADFFA4;
    v22[3] = &unk_101316FC0;
    id v23 = v14;
    uint64_t v27 = v11;
    unsigned int v28 = v15;
    id v25 = v18;
    id v26 = v4;
    double v24 = self;
    BOOL v29 = v17;
    id v20 = v18;
    id v21 = v14;
    dispatch_async(iconFetchingQueue, v22);
  }
}

- (id)_imageForStyleAttributes:(id)a3 screenScale:(double)a4 isNightMode:(BOOL)a5
{
  iconFetchingQueue = self->_iconFetchingQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(iconFetchingQueue);
  LOBYTE(v12) = a5;
  double v9 = +[MKIconManager imageForStyle:v8 size:4 forScale:1 format:0 transparent:0 transitMode:1 interactive:a4 nightMode:v12];

  if (!v9)
  {
    id v10 = [objc_alloc((Class)GEOFeatureStyleAttributes) initWithAttributes:5, 3, 6, 223, 0];
    LOBYTE(v13) = a5;
    double v9 = +[MKIconManager imageForStyle:v10 size:4 forScale:1 format:0 transparent:0 transitMode:1 interactive:a4 nightMode:v13];
  }

  return v9;
}

- (MKAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_iconFetchingQueue, 0);
  objc_destroyWeak((id *)&self->_containerView);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end