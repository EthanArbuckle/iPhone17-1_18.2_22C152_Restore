@interface MapsAppTestRotatingRoute
- (BOOL)runTest;
- (void)_performRotationTest;
- (void)directionsPlanDidSetup;
@end

@implementation MapsAppTestRotatingRoute

- (BOOL)runTest
{
  [(MapsAppTestRouteChrome *)self setChromeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestRotatingRoute;
  return [(MapsAppTestRouteChrome *)&v4 runTest];
}

- (void)directionsPlanDidSetup
{
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10037ACF8;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performRotationTest
{
  [(MapsAppTest *)self startedTest];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10037AD80;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [(MapsAppTest *)self rotateDeviceWithCompletion:v3];
}

@end