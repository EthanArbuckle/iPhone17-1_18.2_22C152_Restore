@interface MapsAppTestRotatingProactive
- (BOOL)runTest;
- (void)_performRotationTest;
@end

@implementation MapsAppTestRotatingProactive

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  unsigned int v4 = [v3 _mapstest_isUsingSampleProactiveData];

  if (v4) {
    int64_t v5 = 6000000000;
  }
  else {
    int64_t v5 = 1000000000;
  }
  dispatch_time_t v6 = dispatch_time(0, v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100752CB0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (void)_performRotationTest
{
  [(MapsAppTest *)self startedTest];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100752D38;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [(MapsAppTest *)self rotateDeviceWithCompletion:v3];
}

@end