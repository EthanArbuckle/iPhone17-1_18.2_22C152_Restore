@interface MapsAppTestRecents
- (BOOL)runTest;
@end

@implementation MapsAppTestRecents

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  unsigned int v4 = [v3 _mapstest_isUsingSampleProactiveData];

  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 6000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10049021C;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MapsAppTestRecents *)self _startRecentsTest];
  }
  return 1;
}

@end