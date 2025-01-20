@interface PPTStoreDependentTest
- (BOOL)hasHandler;
- (BOOL)waitForCACommitBeforeTrackingMetric;
- (PPTStoreDependentTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6;
- (int)handlerTimeout;
@end

@implementation PPTStoreDependentTest

- (PPTStoreDependentTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PPTStoreDependentTest;
  return [(PPTBasicTest *)&v7 initWithName:a3 options:a4 testDefinition:a5 isMainTest:a6];
}

- (BOOL)waitForCACommitBeforeTrackingMetric
{
  return 0;
}

- (int)handlerTimeout
{
  return 3;
}

- (BOOL)hasHandler
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A5CCC;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  return 0;
}

@end