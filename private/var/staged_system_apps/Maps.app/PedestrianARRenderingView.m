@interface PedestrianARRenderingView
- (ARSession)session;
- (BOOL)gotFirstFrame;
- (BOOL)shouldGenerateFeatures;
- (BOOL)shouldShowFeatures;
- (GEOComposedRoute)route;
- (PedestrianARRenderingView)initWithGuidanceObserver:(id)a3 navigationService:(id)a4;
- (PedestrianARVKMapViewMapDelegate)mapViewDelegate;
- (PedestrianARVKRenderer)vkRenderer;
- (VKMapView)vkMapView;
- (void)dealloc;
- (void)deviceOrientationDidChange:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)setGotFirstFrame:(BOOL)a3;
- (void)setMapViewDelegate:(id)a3;
- (void)setRoute:(id)a3;
- (void)setSession:(id)a3;
- (void)setShouldGenerateFeatures:(BOOL)a3;
- (void)setShouldShowFeatures:(BOOL)a3;
- (void)setVkMapView:(id)a3;
- (void)setVkRenderer:(id)a3;
- (void)tapGestureRecognizerFired:(id)a3;
@end

@implementation PedestrianARRenderingView

- (PedestrianARRenderingView)initWithGuidanceObserver:(id)a3 navigationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v29 = sub_1005762E4();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v37 = "-[PedestrianARRenderingView initWithGuidanceObserver:navigationService:]";
      __int16 v38 = 2080;
      v39 = "PedestrianARRenderingView.m";
      __int16 v40 = 1024;
      int v41 = 48;
      __int16 v42 = 2080;
      v43 = "guidanceObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v30 = sub_1005762E4();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v37 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v32 = sub_1005762E4();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v37 = "-[PedestrianARRenderingView initWithGuidanceObserver:navigationService:]";
      __int16 v38 = 2080;
      v39 = "PedestrianARRenderingView.m";
      __int16 v40 = 1024;
      int v41 = 49;
      __int16 v42 = 2080;
      v43 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v33 = sub_1005762E4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v37 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)PedestrianARRenderingView;
  v8 = -[PedestrianARRenderingView initWithFrame:](&v35, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v8)
  {
    v9 = sub_100AD7284();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v37 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v10 = +[MKSystemController sharedInstance];
    id v11 = [v10 requiresRTT];
    v12 = +[UIScreen mainScreen];
    [v12 nativeScale];
    v13 = +[VKMapViewDescriptor descriptorWithShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:](VKMapViewDescriptor, "descriptorWithShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:", v11, 0, 0, 0, 1);

    v14 = (VKMapView *)[objc_alloc((Class)VKMapView) initWithDescriptor:v13];
    vkMapView = v8->_vkMapView;
    v8->_vkMapView = v14;

    [(VKMapView *)v8->_vkMapView setDesiredMapMode:4];
    [(VKMapView *)v8->_vkMapView setMapType:9];
    v16 = [v7 lastLocation];

    if (v16)
    {
      v17 = [(VKMapView *)v8->_vkMapView userLocationAnimator];
      v18 = [v7 lastLocation];
      v19 = [v7 lastLocation];
      v20 = [v19 routeMatch];
      [v17 updateLocation:v18 routeMatch:v20];
    }
    v21 = [[PedestrianARVKMapViewMapDelegate alloc] initWithMapView:v8->_vkMapView];
    mapViewDelegate = v8->_mapViewDelegate;
    v8->_mapViewDelegate = v21;

    v23 = [[PedestrianARVKRenderer alloc] initWithMapView:v8->_vkMapView navigationService:v7 mapViewDelegate:v8->_mapViewDelegate guidanceObserver:v6];
    vkRenderer = v8->_vkRenderer;
    v8->_vkRenderer = v23;

    v25 = [(PedestrianARRenderingView *)v8 layer];
    [v25 addSublayer:v8->_vkMapView];

    id v26 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v8 action:"tapGestureRecognizerFired:"];
    [v26 setDelaysTouchesEnded:0];
    [(PedestrianARRenderingView *)v8 addGestureRecognizer:v26];
    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v8 selector:"deviceOrientationDidChange:" name:UIDeviceOrientationDidChangeNotification object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = sub_100AD7284();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  [WeakRetained _removeObserver:self];

  [(VKMapView *)self->_vkMapView setARSession:0];
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARRenderingView;
  [(PedestrianARRenderingView *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PedestrianARRenderingView;
  [(PedestrianARRenderingView *)&v12 layoutSubviews];
  [(PedestrianARRenderingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(PedestrianARRenderingView *)self vkMapView];
  [v11 setFrame:v4, v6, v8, v10];
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)PedestrianARRenderingView;
  [(PedestrianARRenderingView *)&v8 didMoveToWindow];
  double v3 = [(PedestrianARRenderingView *)self vkMapView];
  double v4 = [(PedestrianARRenderingView *)self window];
  double v5 = [v4 windowScene];
  unint64_t v6 = (unint64_t)[v5 interfaceOrientation] - 1;
  if (v6 > 3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_100F73578[v6];
  }
  [v3 setARInterfaceOrientation:v7];
}

- (void)setSession:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained != v4)
  {
    unint64_t v6 = sub_100AD7284();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 134349314;
      double v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got a new ARSession: %@", (uint8_t *)&v9, 0x16u);
    }

    id v7 = objc_loadWeakRetained((id *)&self->_session);
    [v7 _removeObserver:self];

    id v8 = objc_storeWeak((id *)&self->_session, v4);
    [v4 _addObserver:self];

    self->_gotFirstFrame = 0;
  }
}

- (void)setRoute:(id)a3
{
  double v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    objc_storeStrong((id *)&self->_route, a3);
    unint64_t v6 = sub_100AD7284();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 134349314;
      int v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got a new route: %@", (uint8_t *)&v8, 0x16u);
    }

    id v7 = [(PedestrianARRenderingView *)self vkRenderer];
    [v7 setRoute:v5];
  }
}

- (BOOL)shouldGenerateFeatures
{
  v2 = [(PedestrianARRenderingView *)self vkRenderer];
  unsigned __int8 v3 = [v2 shouldGenerateFeatures];

  return v3;
}

- (void)setShouldGenerateFeatures:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = sub_100AD7284();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = @"NO";
    if (v3) {
      unint64_t v6 = @"YES";
    }
    id v7 = v6;
    int v9 = 134349314;
    __int16 v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Should generate features: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [(PedestrianARRenderingView *)self vkRenderer];
  [v8 setShouldGenerateFeatures:v3];
}

- (BOOL)shouldShowFeatures
{
  v2 = [(PedestrianARRenderingView *)self vkRenderer];
  unsigned __int8 v3 = [v2 shouldShowFeatures];

  return v3;
}

- (void)setShouldShowFeatures:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = sub_100AD7284();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = @"NO";
    if (v3) {
      unint64_t v6 = @"YES";
    }
    id v7 = v6;
    int v9 = 134349314;
    __int16 v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Should show features: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [(PedestrianARRenderingView *)self vkRenderer];
  [v8 setShouldShowFeatures:v3];
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  double v5 = sub_100AD7284();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    __int16 v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Got first frame from ARKit", buf, 0xCu);
  }

  unint64_t v6 = [(PedestrianARRenderingView *)self session];
  [v6 _removeObserver:self];

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AD7AF4;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)deviceOrientationDidChange:(id)a3
{
  id v4 = [(PedestrianARRenderingView *)self window];
  double v5 = [v4 windowScene];

  if (v5)
  {
    id v10 = [(PedestrianARRenderingView *)self vkMapView];
    unint64_t v6 = [(PedestrianARRenderingView *)self window];
    id v7 = [v6 windowScene];
    unint64_t v8 = (unint64_t)[v7 interfaceOrientation] - 1;
    if (v8 > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_100F73578[v8];
    }
    [v10 setARInterfaceOrientation:v9];
  }
}

- (void)tapGestureRecognizerFired:(id)a3
{
  id v7 = a3;
  id v4 = [(PedestrianARRenderingView *)self vkMapView];
  unsigned int v5 = [v4 enableDebugLabelHighlighting];

  if (v5)
  {
    unint64_t v6 = [(PedestrianARRenderingView *)self vkMapView];
    [v7 locationInView:self];
    [v6 debugHighlightLabelAtPoint:];
  }
}

- (ARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (ARSession *)WeakRetained;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (PedestrianARVKMapViewMapDelegate)mapViewDelegate
{
  return self->_mapViewDelegate;
}

- (void)setMapViewDelegate:(id)a3
{
}

- (PedestrianARVKRenderer)vkRenderer
{
  return self->_vkRenderer;
}

- (void)setVkRenderer:(id)a3
{
}

- (VKMapView)vkMapView
{
  return self->_vkMapView;
}

- (void)setVkMapView:(id)a3
{
}

- (BOOL)gotFirstFrame
{
  return self->_gotFirstFrame;
}

- (void)setGotFirstFrame:(BOOL)a3
{
  self->_gotFirstFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vkMapView, 0);
  objc_storeStrong((id *)&self->_vkRenderer, 0);
  objc_storeStrong((id *)&self->_mapViewDelegate, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_destroyWeak((id *)&self->_session);
}

@end