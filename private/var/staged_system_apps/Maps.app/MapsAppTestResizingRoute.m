@interface MapsAppTestResizingRoute
- (BOOL)runTest;
- (void)_performResizingTest;
- (void)directionsPlanDidSetup;
@end

@implementation MapsAppTestResizingRoute

- (BOOL)runTest
{
  [(MapsAppTestRouteChrome *)self setChromeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestResizingRoute;
  return [(MapsAppTestRouteChrome *)&v4 runTest];
}

- (void)directionsPlanDidSetup
{
}

- (void)_performResizingTest
{
  unsigned int v3 = [(MapsAppTest *)self canUpdateTrayLayout];
  [(MapsAppTest *)self startedTest];
  if (v3)
  {
    objc_super v4 = [(MapsAppTest *)self testName];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10037B080;
    v5[3] = &unk_1012E5D08;
    v5[4] = self;
    [(MapsAppTest *)self resizingTestAndSubTestsWithPrefix:v4 completion:v5];
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

@end