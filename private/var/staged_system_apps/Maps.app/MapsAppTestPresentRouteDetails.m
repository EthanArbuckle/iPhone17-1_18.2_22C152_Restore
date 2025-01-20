@interface MapsAppTestPresentRouteDetails
- (BOOL)runTest;
- (void)directionsPlanDidSetup;
@end

@implementation MapsAppTestPresentRouteDetails

- (BOOL)runTest
{
  [(MapsAppTestRouteChrome *)self setChromeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestPresentRouteDetails;
  return [(MapsAppTestRouteChrome *)&v4 runTest];
}

- (void)directionsPlanDidSetup
{
  [(MapsAppTest *)self startedTest];
  v3 = [(MapsAppTest *)self testName];
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10037A870;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10037A8B4;
  v4[3] = &unk_1012E5D08;
  [(MapsAppTest *)self presentDismissTrayTestAndSubTestsWithPrefix:v3 presenter:v5 completion:v4];
}

@end