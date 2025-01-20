@interface NavigationIntentCapturer
+ (int64_t)creationPreference;
- (MKMapService)mapService;
- (NavigationIntentCapturer)initWithMapService:(id)a3;
- (NavigationSession)navigationSession;
- (void)captureStartNavigationIntent;
- (void)captureUserAction:(int)a3;
- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)setNavigationSession:(id)a3;
@end

@implementation NavigationIntentCapturer

- (NavigationIntentCapturer)initWithMapService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavigationIntentCapturer;
  v6 = [(NavigationIntentCapturer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapService, a3);
  }

  return v7;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)captureStartNavigationIntent
{
  v3 = [(NavigationIntentCapturer *)self navigationSession];
  v4 = [v3 currentRouteCollection];
  id v16 = [v4 currentRoute];

  if ([v16 source] != (id)2 && objc_msgSend(v16, "source") != (id)3)
  {
    id v5 = [v16 origin];
    v6 = [v16 destination];
    v7 = [v5 geoMapItem];
    v8 = +[CLPlacemark placemarkWithGEOMapItem:v7];

    objc_super v9 = [v6 geoMapItem];
    v10 = +[CLPlacemark placemarkWithGEOMapItem:v9];

    v11 = [v8 location];
    [v11 coordinate];
    if (CLLocationCoordinate2DIsValid(v18))
    {
      v12 = [v10 location];
      [v12 coordinate];
      BOOL v13 = CLLocationCoordinate2DIsValid(v19);

      if (!v13)
      {
LABEL_10:

        goto LABEL_11;
      }
      v11 = [(NavigationIntentCapturer *)self navigationSession];
      v14 = [v11 configuration];
      if ([v14 isETAOnlyMode]) {
        uint64_t v15 = 9016;
      }
      else {
        uint64_t v15 = 3001;
      }
      [(NavigationIntentCapturer *)self captureUserAction:v15];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)captureUserAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 9016 || a3 == 3001)
  {
    id v5 = [(NavigationIntentCapturer *)self navigationSession];
    v6 = [v5 configuration];
    v7 = [v6 startNavigationDetails];
    uint64_t v8 = (uint64_t)[v7 selectedRouteIndex];
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  objc_super v9 = [(NavigationIntentCapturer *)self navigationSession];
  id v10 = [v9 sessionInitiator];

  if (v10 == (id)2)
  {
    id v15 = +[CarDisplayController sharedInstance];
    v11 = [v15 chromeViewController];
    [v11 captureUserAction:v3 selectedRouteIndex:v8];
  }
  else
  {
    id v15 = +[GEORouteDetails routeDetailsWithResultIndex:v8];
    v11 = [(NavigationIntentCapturer *)self mapService];
    v12 = [(NavigationIntentCapturer *)self navigationSession];
    BOOL v13 = (char *)[v12 currentTransportType];
    if ((unint64_t)(v13 - 1) >= 5) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = (v13 + 300);
    }
    [v11 captureUserAction:v3 onTarget:v14 eventValue:0 routeDetails:v15];
  }
}

- (void)setNavigationSession:(id)a3
{
  id v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    v7 = v5;
    [(NavigationSession *)navigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_navigationSession, a3);
    [(NavigationSession *)self->_navigationSession addObserver:self];
    id v5 = v7;
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v8;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  [(NavigationIntentCapturer *)self setNavigationSession:v7];
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(NavigationIntentCapturer *)self navigationSession];

  if (a4 == 1 && v7 == v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A6A0F4;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (MKMapService)mapService
{
  return self->_mapService;
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSession, 0);

  objc_storeStrong((id *)&self->_mapService, 0);
}

@end