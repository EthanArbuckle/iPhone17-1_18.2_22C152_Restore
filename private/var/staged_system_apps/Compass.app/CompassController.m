@interface CompassController
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(id)a3;
- (CLLocationManager)sharedLocManager;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (int64_t)preferredStatusBarStyle;
- (void)_setSharedLocationManagerOnPagesIfNeeded;
- (void)configureForTestingWithOptions:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setSharedLocManager:(id)a3;
- (void)startAnimations;
- (void)startLocationUpdatesIfNecessary;
- (void)stopAnimations;
- (void)stopLocationUpdates;
- (void)testCleanup;
- (void)updateDisplay:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CompassController

- (id)childViewControllerForStatusBarHidden
{
  return self->_compassPageController;
}

- (void)startAnimations
{
  if (!self->_displayLink)
  {
    v3 = +[CADisplayLink displayLinkWithTarget:self selector:"updateDisplay:"];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    id v6 = +[NSRunLoop currentRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:NSRunLoopCommonModes];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CompassController;
  [(CompassController *)&v3 viewDidLoad];
  [(CompassController *)self startLocationUpdatesIfNecessary];
  [(CompassController *)self startAnimations];
}

- (void)loadView
{
  id v9 = objc_alloc_init((Class)UIView);
  [v9 _accessibilitySetInterfaceStyleIntent:2];
  [(CompassController *)self setView:v9];
  objc_super v3 = +[UIColor whiteColor];
  [v9 setTintColor:v3];

  v4 = objc_alloc_init(CompassPageViewController);
  compassPageController = self->_compassPageController;
  self->_compassPageController = v4;

  [(CompassController *)self _setSharedLocationManagerOnPagesIfNeeded];
  [(CompassController *)self addChildViewController:self->_compassPageController];
  id v6 = [(CompassPageViewController *)self->_compassPageController view];
  [v6 setAutoresizingMask:18];

  v7 = [(CompassPageViewController *)self->_compassPageController view];
  [v9 bounds];
  [v7 setFrame:];

  v8 = [(CompassPageViewController *)self->_compassPageController view];
  [v9 addSubview:v8];
}

- (void)_setSharedLocationManagerOnPagesIfNeeded
{
  objc_super v3 = [(CompassController *)self sharedLocManager];

  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    compassPageController = self->_compassPageController;
    id v5 = [(CompassController *)self sharedLocManager];
    [(CompassPageViewController *)compassPageController setSharedLocationManager:v5];
  }
}

- (void)startLocationUpdatesIfNecessary
{
  objc_super v3 = [(CompassController *)self sharedLocManager];
  unsigned int v4 = [v3 authorizationStatus];

  if (v4)
  {
    if (v4 - 3 > 1)
    {
      id v5 = [(CompassController *)self sharedLocManager];
      return;
    }
    id v6 = [(CompassController *)self sharedLocManager];
    [v6 startUpdatingLocation];
  }
  else
  {
    id v6 = [(CompassController *)self sharedLocManager];
    [v6 requestWhenInUseAuthorization];
  }
}

- (CLLocationManager)sharedLocManager
{
  sharedLocManager = self->_sharedLocManager;
  if (!sharedLocManager)
  {
    unsigned int v4 = (CLLocationManager *)objc_alloc_init((Class)CLLocationManager);
    id v5 = self->_sharedLocManager;
    self->_sharedLocManager = v4;

    [(CLLocationManager *)self->_sharedLocManager setDelegate:self];
    [(CompassController *)self _setSharedLocationManagerOnPagesIfNeeded];
    sharedLocManager = self->_sharedLocManager;
  }

  return sharedLocManager;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  [v5 objectAtIndexedSubscript:[v5 count] - 1];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(CompassPageViewController *)self->_compassPageController setUserLocation:v6];
  [(CompassPageViewController *)self->_compassPageController updateConsole];
}

- (void)updateDisplay:(id)a3
{
  id v4 = a3;
  if ([(CompassController *)self isViewLoaded]) {
    [(CompassPageViewController *)self->_compassPageController updateDisplay:v4];
  }
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_compassPageController;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  unsigned int v4 = [a3 authorizationStatus];
  if (v4 <= 4 && ((1 << v4) & 0x19) != 0)
  {
    [(CompassController *)self startLocationUpdatesIfNecessary];
  }
  else
  {
    [(CompassController *)self stopLocationUpdates];
    compassPageController = self->_compassPageController;
    [(CompassPageViewController *)compassPageController setUserLocation:0];
  }
}

- (void)stopAnimations
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompassController;
  [(CompassController *)&v4 viewWillDisappear:a3];
  if ([(CompassController *)self isMovingFromParentViewController]) {
    [(CompassController *)self stopAnimations];
  }
}

- (void)dealloc
{
  [(CLLocationManager *)self->_sharedLocManager stopUpdatingLocation];
  v3.receiver = self;
  v3.super_class = (Class)CompassController;
  [(CompassController *)&v3 dealloc];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(id)a3
{
  return 1;
}

- (void)stopLocationUpdates
{
  id v2 = [(CompassController *)self sharedLocManager];
  [v2 stopUpdatingLocation];
}

- (void)configureForTestingWithOptions:(id)a3
{
}

- (void)testCleanup
{
}

- (void)setSharedLocManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_compassPageController, 0);

  objc_storeStrong((id *)&self->_sharedLocManager, 0);
}

@end