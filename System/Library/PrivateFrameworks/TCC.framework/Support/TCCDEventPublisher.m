@interface TCCDEventPublisher
+ (id)sharedPublisher;
- (TCCDEventPublisher)init;
- (void)_addPendingEvent:(id)a3;
- (void)_addSubscriber:(unint64_t)a3 withFilterCriteria:(id)a4;
- (void)_handleError:(int)a3;
- (void)_handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)_publishPendingEvents;
- (void)_removeSubscriber:(unint64_t)a3;
- (void)checkEntitlementForSubscriber:(id)a3 completionHandler:(id)a4;
- (void)publish:(id)a3;
- (void)sendEvent:(id)a3 toSubscriber:(id)a4;
@end

@implementation TCCDEventPublisher

- (void)_handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = xpc_copy_description(v8);
    v11 = tcc_events_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = "Add";
      if (a3 == 1) {
        v13 = "Remove";
      }
      int v14 = 136446722;
      if (a3 == 2) {
        v13 = "Initial Barrier";
      }
      v15 = v13;
      __int16 v16 = 2048;
      unint64_t v17 = a4;
      __int16 v18 = 2082;
      v19 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Received event: action=%{public}s, token=%llu, descriptor=%{public}s", (uint8_t *)&v14, 0x20u);
    }

    free(v10);
  }
  else
  {
    v12 = tcc_events_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100052804(a3, a4, v12);
    }
  }
  switch(a3)
  {
    case 2u:
      self->_receivedInitialBarrier = 1;
      [(TCCDEventPublisher *)self _publishPendingEvents];
      break;
    case 1u:
      [(TCCDEventPublisher *)self _removeSubscriber:a4];
      break;
    case 0u:
      [(TCCDEventPublisher *)self _addSubscriber:a4 withFilterCriteria:v9];
      break;
  }
}

- (void)_addSubscriber:(unint64_t)a3 withFilterCriteria:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000033AC;
  block[3] = &unk_100095568;
  v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

+ (id)sharedPublisher
{
  if (qword_1000AC788 != -1) {
    dispatch_once(&qword_1000AC788, &stru_1000967E8);
  }
  v2 = (void *)qword_1000AC780;
  return v2;
}

- (TCCDEventPublisher)init
{
  v16.receiver = self;
  v16.super_class = (Class)TCCDEventPublisher;
  v2 = [(TCCDEventPublisher *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableArray array];
    pendingEvents = v2->_pendingEvents;
    v2->_pendingEvents = (NSMutableArray *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("TCCDEventPublisherQueue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = xpc_event_publisher_create();
    publisher = v2->_publisher;
    v2->_publisher = (OS_xpc_event_publisher *)v10;

    objc_initWeak(&location, v2);
    v13[1] = _NSConcreteStackBlock;
    v13[2] = (id)3221225472;
    v13[3] = sub_100003198;
    v13[4] = &unk_100096810;
    objc_copyWeak(&v14, &location);
    xpc_event_publisher_set_handler();
    objc_copyWeak(v13, &location);
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();
    objc_destroyWeak(v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_handleError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = tcc_events_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100052778(v3, v4);
  }
}

- (void)checkEntitlementForSubscriber:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 token];
  v9 = v6;
  id v7 = v6;
  id v8 = v5;
  xpc_event_publisher_fire_with_reply();
}

- (void)_removeSubscriber:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000520A0;
  v4[3] = &unk_100096888;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)queue, v4);
}

- (void)_addPendingEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_pendingEvents addObject:v4];
  id v5 = tcc_events_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000529CC((uint64_t)v4, v5);
  }

  if ((unint64_t)[(NSMutableArray *)self->_pendingEvents count] >= 0x21)
  {
    [(NSMutableArray *)self->_pendingEvents removeObjectAtIndex:0];
    id v6 = tcc_events_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100052940((uint64_t)self, v6);
    }
  }
}

- (void)_publishPendingEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = self->_pendingEvents;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[TCCDEventPublisher publish:](self, "publish:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_pendingEvents removeAllObjects];
}

- (void)sendEvent:(id)a3 toSubscriber:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 token];
  id v7 = [v5 xpcObject];
  int v8 = xpc_event_publisher_fire();

  if (v8)
  {
    long long v9 = tcc_events_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543874;
      id v11 = v5;
      __int16 v12 = 2114;
      id v13 = v6;
      __int16 v14 = 2082;
      uint64_t v15 = xpc_strerror();
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Sending %{public}@ to %{public}@ failed with error: %{public}s", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)publish:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100052530;
  v7[3] = &unk_100094FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end