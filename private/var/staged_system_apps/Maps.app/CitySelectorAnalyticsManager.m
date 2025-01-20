@interface CitySelectorAnalyticsManager
- (CitySelectorAnalyticsManager)init;
- (void)citySelectorRevealed;
- (void)cleanUp;
- (void)logEvent;
@end

@implementation CitySelectorAnalyticsManager

- (CitySelectorAnalyticsManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CitySelectorAnalyticsManager;
  v2 = [(CitySelectorAnalyticsManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->event.target = 27;
    uint64_t v4 = geo_dispatch_queue_create_with_qos();
    utilityQueue = v3->_utilityQueue;
    v3->_utilityQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)citySelectorRevealed
{
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B6A4F0;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)logEvent
{
}

- (void)cleanUp
{
  self->event.action = 0;
}

- (void).cxx_destruct
{
}

@end