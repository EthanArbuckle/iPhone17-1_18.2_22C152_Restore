@interface MapsAppTestRotatingRouteDetails
- (BOOL)runTest;
- (void)_performRotationTest;
- (void)directionsPlanDidSetup;
@end

@implementation MapsAppTestRotatingRouteDetails

- (BOOL)runTest
{
  [(MapsAppTestRouteChrome *)self setChromeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestRotatingRouteDetails;
  return [(MapsAppTestRouteChrome *)&v4 runTest];
}

- (void)directionsPlanDidSetup
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10037AE40;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  [(MapsAppTest *)self _presentDirectionDetailsWithCompletion:v2];
}

- (void)_performRotationTest
{
  [(MapsAppTest *)self startedTest];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10037AF5C;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [(MapsAppTest *)self rotateDeviceWithCompletion:v3];
}

@end