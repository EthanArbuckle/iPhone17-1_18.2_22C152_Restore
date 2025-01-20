@interface MapsAppTestResizingPlacecard
- (BOOL)runTest;
- (void)_performResizingTest;
- (void)placecardDidPresent;
@end

@implementation MapsAppTestResizingPlacecard

- (BOOL)runTest
{
  [(MapsAppTestPlacecardChrome *)self setPlacecardChromeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestResizingPlacecard;
  return [(MapsAppTestPlacecardChrome *)&v4 runTest];
}

- (void)placecardDidPresent
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007BBD1C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
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
    v5[2] = sub_1007BBDF0;
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