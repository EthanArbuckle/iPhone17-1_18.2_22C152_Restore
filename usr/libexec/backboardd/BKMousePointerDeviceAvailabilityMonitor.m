@interface BKMousePointerDeviceAvailabilityMonitor
- (BKMousePointerDeviceAvailabilityMonitor)init;
- (BOOL)hasDeviceAvailable;
- (NSArray)deviceServices;
- (void)_locked_notifyObserversDidAddDevices:(id)a3;
- (void)_locked_notifyObserversDidChangeAvailability;
- (void)_locked_notifyObserversDidRemoveDevices:(id)a3;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)removeObserver:(id)a3;
- (void)serviceDidDisappear:(id)a3;
@end

@implementation BKMousePointerDeviceAvailabilityMonitor

- (NSArray)deviceServices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_activeServices copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observerContexts, 0);
  objc_storeStrong((id *)&self->_hidServiceMatcher, 0);

  objc_storeStrong((id *)&self->_activeServices, 0);
}

- (void)_locked_notifyObserversDidRemoveDevices:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = BKLogMousePointer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "devices removed: %{public}@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_observerContexts;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 queue];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100035C2C;
        v13[3] = &unk_1000F8E50;
        v13[4] = v11;
        id v14 = v4;
        dispatch_async(v12, v13);
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)_locked_notifyObserversDidAddDevices:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = BKLogMousePointer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "devices added: %{public}@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_observerContexts;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 queue];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100035E74;
        v13[3] = &unk_1000F8E50;
        v13[4] = v11;
        id v14 = v4;
        dispatch_async(v12, v13);
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)_locked_notifyObserversDidChangeAvailability
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = BKLogMousePointer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(NSMutableArray *)self->_activeServices count] != 0;
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "now available: %{BOOL}u", buf, 8u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_observerContexts;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v10 queue];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1000360AC;
        v12[3] = &unk_1000F8E50;
        v12[4] = v10;
        v12[5] = self;
        dispatch_async(v11, v12);
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSMutableArray *)self->_observerContexts copy];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 observer];

        if (v11 == v4) {
          [(NSMutableArray *)self->_observerContexts removeObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if (![(NSMutableArray *)self->_observerContexts count])
  {
    observerContexts = self->_observerContexts;
    self->_observerContexts = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = [[_BKMousePointerDeviceAvailabilityMonitorObserverContext alloc] initWithObserver:v6 queue:v7];
  observerContexts = self->_observerContexts;
  if (!observerContexts)
  {
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v11 = self->_observerContexts;
    self->_observerContexts = v10;

    observerContexts = self->_observerContexts;
  }
  [(NSMutableArray *)observerContexts addObject:v8];
  if ([(NSMutableArray *)self->_activeServices count])
  {
    if (objc_opt_respondsToSelector())
    {
      id v12 = [(NSMutableArray *)self->_activeServices copy];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100036434;
      block[3] = &unk_1000F8E50;
      id v18 = v6;
      id v19 = v12;
      id v13 = v12;
      dispatch_async(v7, block);
    }
    if (objc_opt_respondsToSelector())
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100036440;
      v14[3] = &unk_1000F8E50;
      id v15 = v6;
      long long v16 = self;
      dispatch_async(v7, v14);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)hasDeviceAvailable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSMutableArray *)v2->_activeServices count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)serviceDidDisappear:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  [v4 removeDisappearanceObserver:self];
  if ([(NSMutableArray *)self->_activeServices containsObject:v4])
  {
    [(NSMutableArray *)self->_activeServices removeObject:v4];
    id v7 = v4;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
    [(BKMousePointerDeviceAvailabilityMonitor *)self _locked_notifyObserversDidRemoveDevices:v5];

    if (![(NSMutableArray *)self->_activeServices count])
    {
      activeServices = self->_activeServices;
      self->_activeServices = 0;

      [(BKMousePointerDeviceAvailabilityMonitor *)self _locked_notifyObserversDidChangeAvailability];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableArray *)self->_activeServices count];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "serviceStatus", (void)v16) == (id)1
          && ([(NSMutableArray *)self->_activeServices containsObject:v12] & 1) == 0)
        {
          activeServices = self->_activeServices;
          if (!activeServices)
          {
            long long v14 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
            id v15 = self->_activeServices;
            self->_activeServices = v14;

            activeServices = self->_activeServices;
          }
          [(NSMutableArray *)activeServices addObject:v12];
          [v12 addDisappearanceObserver:self queue:self->_queue];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if ((v6 != 0) == ([(NSMutableArray *)self->_activeServices count] == 0)) {
    [(BKMousePointerDeviceAvailabilityMonitor *)self _locked_notifyObserversDidChangeAvailability];
  }
  -[BKMousePointerDeviceAvailabilityMonitor _locked_notifyObserversDidAddDevices:](self, "_locked_notifyObserversDidAddDevices:", v7, (void)v16);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  [(BKIOHIDServiceMatcher *)self->_hidServiceMatcher invalidate];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_activeServices;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) removeDisappearanceObserver:self];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BKMousePointerDeviceAvailabilityMonitor;
  [(BKMousePointerDeviceAvailabilityMonitor *)&v8 dealloc];
}

- (BKMousePointerDeviceAvailabilityMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)BKMousePointerDeviceAvailabilityMonitor;
  v2 = [(BKMousePointerDeviceAvailabilityMonitor *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.backboard.BKMousePointerDeviceAvailabilityMonitor.queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v13[0] = @"DeviceUsagePage";
    v13[1] = @"DeviceUsage";
    v14[0] = &off_100103490;
    v14[1] = &off_1001034A8;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v7 = objc_alloc((Class)BKIOHIDServiceMatcher);
    objc_super v8 = +[BKHIDSystemInterface sharedInstance];
    long long v9 = (BKIOHIDServiceMatcher *)[v7 initWithMatchingDictionary:v6 dataProvider:v8];
    hidServiceMatcher = v3->_hidServiceMatcher;
    v3->_hidServiceMatcher = v9;

    [(BKIOHIDServiceMatcher *)v3->_hidServiceMatcher startObserving:v3 queue:v3->_queue];
  }
  return v3;
}

@end