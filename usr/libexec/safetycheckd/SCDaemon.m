@interface SCDaemon
+ (id)sharedDaemon;
- (NSArray)XPCListenerPairs;
- (NSArray)activeXPCListenerPairs;
- (NSArray)backgroundSystemTasks;
- (NSArray)notifyDListeners;
- (OS_dispatch_queue)workQueue;
- (SCDaemon)init;
- (id)_listenersByEventName;
- (void)registerBackgroundSystemTasks;
- (void)registerXPCEventHandlers;
- (void)setActiveXPCListenerPairs:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)start;
- (void)wakeXPCListeners;
@end

@implementation SCDaemon

+ (id)sharedDaemon
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000024C0;
  block[3] = &unk_100004178;
  block[4] = a1;
  if (qword_100008478 != -1) {
    dispatch_once(&qword_100008478, block);
  }
  v2 = (void *)qword_100008470;

  return v2;
}

- (SCDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCDaemon;
  v2 = [(SCDaemon *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.safetycheckd.queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)start
{
  [(SCDaemon *)self wakeXPCListeners];
  [(SCDaemon *)self registerXPCEventHandlers];

  [(SCDaemon *)self registerBackgroundSystemTasks];
}

- (void)wakeXPCListeners
{
  dispatch_queue_t v3 = [(SCDaemon *)self XPCListenerPairs];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) first];
        [v8 resume];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(SCDaemon *)self setActiveXPCListenerPairs:v3];
}

- (void)registerXPCEventHandlers
{
  dispatch_queue_t v3 = [(SCDaemon *)self _listenersByEventName];
  workQueue = self->_workQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002758;
  handler[3] = &unk_1000041A0;
  id v7 = v3;
  id v5 = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)workQueue, handler);
}

- (void)registerBackgroundSystemTasks
{
  dispatch_queue_t v3 = [(SCDaemon *)self backgroundSystemTasks];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        long long v9 = [(SCDaemon *)self workQueue];
        [v8 registerForTaskUsingQueue:v9];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_listenersByEventName
{
  dispatch_queue_t v3 = +[NSMutableDictionary dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(SCDaemon *)self notifyDListeners];
  id v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v6 = [v5 interestedEvents];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v18;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * (void)j);
              long long v12 = [v3 objectForKey:v11];
              if (!v12)
              {
                long long v12 = +[NSMutableArray array];
                [v3 setObject:v12 forKey:v11];
              }
              [v12 addObject:v5];
            }
            id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v8);
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }

  return v3;
}

- (NSArray)XPCListenerPairs
{
  uint64_t v20 = kSharingRemindersMachServiceName;
  id v2 = objc_alloc_init((Class)SCSharingReminderDelegate);
  id v21 = v2;
  dispatch_queue_t v3 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  id v4 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [v3 allKeys];
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v10 = [v3 valueForKey:v9];
        id v11 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v9];
        [v11 setDelegate:v10];
        long long v12 = +[SCPair pairWithFirst:v11 second:v10];
        [v4 addObject:v12];
      }
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSArray *)v4;
}

- (NSArray)notifyDListeners
{
  id v2 = objc_alloc_init((Class)SCSharingReminderXPCService);
  id v5 = v2;
  dispatch_queue_t v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (NSArray)backgroundSystemTasks
{
  id v2 = objc_opt_new();
  dispatch_queue_t v3 = +[SCSharingReminderXPCService tasks];
  [v2 addObjectsFromArray:v3];

  return (NSArray *)v2;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSArray)activeXPCListenerPairs
{
  return self->_activeXPCListenerPairs;
}

- (void)setActiveXPCListenerPairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeXPCListenerPairs, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end