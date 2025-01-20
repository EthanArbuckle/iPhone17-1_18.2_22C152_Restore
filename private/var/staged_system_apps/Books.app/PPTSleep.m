@interface PPTSleep
- (void)startTest;
@end

@implementation PPTSleep

- (void)startTest
{
  [(PPTBasicTest *)self setRunning:1];
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B7CE8;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end