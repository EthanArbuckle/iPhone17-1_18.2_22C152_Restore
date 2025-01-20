@interface BKOrientationManager
- (BKOrientationManager)init;
- (id)_initWithDeviceOrientationManager:(id)a3;
- (void)_queue_postUpdatedRawAccelerometerDeviceOrientation:(int64_t)a3;
- (void)dealloc;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)serviceDidDisappear:(id)a3;
@end

@implementation BKOrientationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_queue_HIDServiceMatcher, 0);
  objc_storeStrong((id *)&self->_queue_HIDService, 0);
  objc_storeStrong((id *)&self->_queue_orientationManager, 0);
  objc_storeStrong((id *)&self->_queue_orientationManagerOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue_processDeathWatchers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerCalloutQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_postUpdatedRawAccelerometerDeviceOrientation:(int64_t)a3
{
  notifyQueue = self->_notifyQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100093840;
  v4[3] = &unk_1000F8C30;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(notifyQueue, v4);
}

- (void)serviceDidDisappear:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  queue_HIDService = self->_queue_HIDService;
  p_queue_HIDService = &self->_queue_HIDService;
  LODWORD(queue) = [v5 isEqual:queue_HIDService];

  if (queue)
  {
    objc_storeStrong((id *)p_queue_HIDService, 0);
  }
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v10 = a4;
  queue = self->_queue;
  v7 = (BKIOHIDServiceMatcher *)a3;
  dispatch_assert_queue_V2(queue);
  queue_HIDServiceMatcher = self->_queue_HIDServiceMatcher;

  if (queue_HIDServiceMatcher == v7)
  {
    v9 = [v10 firstObject];
    objc_storeStrong((id *)&self->_queue_HIDService, v9);
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(BKIOHIDServiceMatcher *)self->_queue_HIDServiceMatcher invalidate];
  [(BSCompoundAssertion *)self->_observers invalidate];
  v4.receiver = self;
  v4.super_class = (Class)BKOrientationManager;
  [(BKOrientationManager *)&v4 dealloc];
}

- (id)_initWithDeviceOrientationManager:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BKOrientationManager;
  v6 = [(BKOrientationManager *)&v25 init];
  if (v6)
  {
    uint64_t v7 = BSDispatchQueueCreateWithFixedPriority();
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    id v9 = objc_alloc_init((Class)NSOperationQueue);
    id v10 = (void *)*((void *)v6 + 14);
    *((void *)v6 + 14) = v9;

    [*((id *)v6 + 14) setUnderlyingQueue:*((void *)v6 + 1)];
    uint64_t Serial = BSDispatchQueueCreateSerial();
    v12 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = Serial;

    uint64_t v13 = +[BSCompoundAssertion assertionWithIdentifier:@"BKOrientationManagerObservers"];
    v14 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v13;

    *((void *)v6 + 9) = -1;
    *((void *)v6 + 10) = -1;
    *((void *)v6 + 11) = -1;
    *((void *)v6 + 12) = 0;
    *(_OWORD *)(v6 + 56) = xmmword_1000BF680;
    *((void *)v6 + 5) = 0xBFF0000000000000;
    *((_DWORD *)v6 + 12) = -1082130432;
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    v16 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v15;

    uint64_t v17 = BSDispatchQueueCreateWithQualityOfService();
    v18 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = v17;

    sub_10001B86C((uint64_t)v6, 0.0);
    sub_10001B9C8((uint64_t)v6, 0.0);
    objc_storeStrong((id *)v6 + 15, a3);
    sub_100093CC0(v6);
    v19 = +[BKSDefaults localDefaults];
    v6[104] = [v19 ignoreAccelerometerAndOrientationEvents];

    id v20 = objc_alloc((Class)BKIOHIDServiceMatcher);
    v21 = +[BKHIDSystemInterface sharedInstance];
    id v22 = [v20 initWithUsagePage:65280 usage:3 builtIn:1 dataProvider:v21];
    v23 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = v22;

    [*((id *)v6 + 17) startObserving:v6 queue:*((void *)v6 + 1)];
  }

  return v6;
}

- (BKOrientationManager)init
{
  id v3 = objc_alloc_init((Class)CMDeviceOrientationManager);
  objc_super v4 = [(BKOrientationManager *)self _initWithDeviceOrientationManager:v3];

  return v4;
}

@end