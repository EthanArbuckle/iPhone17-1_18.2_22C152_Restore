@interface PPTShowDVCTest
- (void)startTest;
@end

@implementation PPTShowDVCTest

- (void)startTest
{
  [(PPTBasicTest *)self setRunning:1];
  v3 = [(PPTBasicTest *)self bookController];
  +[THTestDriver goToFirstChapterWithController:v3];

  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100185EEC;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end