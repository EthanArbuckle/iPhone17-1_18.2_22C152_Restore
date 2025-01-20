@interface BKHumanPresenceHIDEventProcessor
- (BKHumanPresenceHIDEventProcessor)init;
- (BKIOHIDServiceMatcher)presenceServiceMatcher;
- (BKIOHIDServiceMatcher)proximityServiceMatcher;
- (NSMutableDictionary)displayUUIDToSensorRecords;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_setPresence:(BOOL)a3 forDisplayUUID:(id)a4;
- (void)_setProximityInCentimeters:(double)a3 forDisplayUUID:(id)a4;
- (void)dealloc;
- (void)getStatus:(unint64_t *)a3 presence:(BOOL *)a4 proximityInCentimeters:(double *)a5 forDisplayUUID:(id)a6;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)serviceDidDisappear:(id)a3;
- (void)setDisplayUUIDToSensorRecords:(id)a3;
- (void)setPresenceServiceMatcher:(id)a3;
- (void)setProximityServiceMatcher:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation BKHumanPresenceHIDEventProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximityServiceMatcher, 0);
  objc_storeStrong((id *)&self->_presenceServiceMatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_queue_displayUUIDToSensorRecords, 0);
}

- (void)setProximityServiceMatcher:(id)a3
{
}

- (BKIOHIDServiceMatcher)proximityServiceMatcher
{
  return self->_proximityServiceMatcher;
}

- (void)setPresenceServiceMatcher:(id)a3
{
}

- (BKIOHIDServiceMatcher)presenceServiceMatcher
{
  return self->_presenceServiceMatcher;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDisplayUUIDToSensorRecords:(id)a3
{
}

- (NSMutableDictionary)displayUUIDToSensorRecords
{
  return self->_queue_displayUUIDToSensorRecords;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v6 = a4;
  int IntegerValue = IOHIDEventGetIntegerValue();
  if (!IntegerValue)
  {
    IOHIDEventGetFloatValue();
    double v15 = v14;
    v16 = BKLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v20 = 138543618;
      *(void *)&v20[4] = objc_opt_class();
      *(_WORD *)&v20[12] = 2048;
      *(double *)&v20[14] = v15;
      id v17 = *(id *)&v20[4];
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@: human proximity event %g", v20, 0x16u);
    }
    v18 = [v6 displayUUID];
    v13 = sub_1000503BC(v18);

    [(BKHumanPresenceHIDEventProcessor *)self _setProximityInCentimeters:v13 forDisplayUUID:v15];
    goto LABEL_9;
  }
  if (IntegerValue == 3)
  {
    IOHIDEventGetFloatValue();
    double v9 = v8;
    v10 = BKLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v20 = 138543618;
      *(void *)&v20[4] = objc_opt_class();
      *(_WORD *)&v20[12] = 2048;
      *(double *)&v20[14] = v9;
      id v11 = *(id *)&v20[4];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: human presence event %g", v20, 0x16u);
    }
    v12 = [v6 displayUUID];
    v13 = sub_1000503BC(v12);

    -[BKHumanPresenceHIDEventProcessor _setPresence:forDisplayUUID:](self, "_setPresence:forDisplayUUID:", v9 > 0.0, v13, *(_OWORD *)v20, *(void *)&v20[16]);
LABEL_9:
  }
  return 0;
}

- (void)getStatus:(unint64_t *)a3 presence:(BOOL *)a4 proximityInCentimeters:(double *)a5 forDisplayUUID:(id)a6
{
  id v10 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000504E0;
  block[3] = &unk_1000F6DD8;
  block[4] = self;
  id v14 = v10;
  double v15 = a4;
  v16 = a5;
  id v17 = a3;
  id v12 = v10;
  dispatch_sync(queue, block);
}

- (void)_setPresence:(BOOL)a3 forDisplayUUID:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005066C;
  block[3] = &unk_1000F73B8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_setProximityInCentimeters:(double)a3 forDisplayUUID:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050810;
  block[3] = &unk_1000F7868;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)serviceDidDisappear:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = BKLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v4;
    id v6 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: removing %{public}@", (uint8_t *)&v12, 0x16u);
  }
  v7 = [v4 displayUUID];
  id v8 = sub_1000503BC(v7);

  double v9 = [(NSMutableDictionary *)self->_queue_displayUUIDToSensorRecords objectForKey:v8];
  [v9 removeService:v4];
  id v10 = [v9 services];
  id v11 = [v10 count];

  if (!v11) {
    [(NSMutableDictionary *)self->_queue_displayUUIDToSensorRecords removeObjectForKey:v8];
  }
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v8 = 138543618;
    long long v19 = v8;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v11);
        id v13 = BKLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          __int16 v14 = objc_opt_class();
          *(_DWORD *)buf = v19;
          v25 = v14;
          __int16 v26 = 2114;
          v27 = v12;
          id v15 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: found %{public}@", buf, 0x16u);
        }
        v16 = [v12 displayUUID];
        id v17 = sub_1000503BC(v16);

        v18 = [(NSMutableDictionary *)self->_queue_displayUUIDToSensorRecords objectForKey:v17];
        if (!v18)
        {
          v18 = objc_alloc_init(_BKHIDHumanPresenceSensorRecord);
          [(NSMutableDictionary *)self->_queue_displayUUIDToSensorRecords setObject:v18 forKey:v17];
        }
        -[_BKHIDHumanPresenceSensorRecord addService:](v18, "addService:", v12, v19, (void)v20);

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v9);
  }
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_queue_displayUUIDToSensorRecords withName:@"sensors"];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (void)dealloc
{
  [(BKIOHIDServiceMatcher *)self->_proximityServiceMatcher invalidate];
  [(BKIOHIDServiceMatcher *)self->_presenceServiceMatcher invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKHumanPresenceHIDEventProcessor;
  [(BKHumanPresenceHIDEventProcessor *)&v3 dealloc];
}

- (BKHumanPresenceHIDEventProcessor)init
{
  v13.receiver = self;
  v13.super_class = (Class)BKHumanPresenceHIDEventProcessor;
  v2 = [(BKHumanPresenceHIDEventProcessor *)&v13 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queue_displayUUIDToSensorRecords = v2->_queue_displayUUIDToSensorRecords;
    v2->_queue_displayUUIDToSensorRecords = v5;

    id v7 = +[BKHIDSystemInterface sharedInstance];
    long long v8 = (BKIOHIDServiceMatcher *)[objc_alloc((Class)BKIOHIDServiceMatcher) initWithUsagePage:32 usage:17 builtIn:0 dataProvider:v7];
    presenceServiceMatcher = v2->_presenceServiceMatcher;
    v2->_presenceServiceMatcher = v8;

    [(BKIOHIDServiceMatcher *)v2->_presenceServiceMatcher startObserving:v2 queue:v2->_queue];
    uint64_t v10 = (BKIOHIDServiceMatcher *)[objc_alloc((Class)BKIOHIDServiceMatcher) initWithUsagePage:32 usage:18 builtIn:0 dataProvider:v7];
    proximityServiceMatcher = v2->_proximityServiceMatcher;
    v2->_proximityServiceMatcher = v10;

    [(BKIOHIDServiceMatcher *)v2->_proximityServiceMatcher startObserving:v2 queue:v2->_queue];
  }
  return v2;
}

@end