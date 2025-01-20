@interface DMDEventStreamDispatcher
- (DMDEventStreamDispatcher)initWithListeners:(id)a3;
- (NSMutableDictionary)distributedNotificationNameToListenersMap;
- (NSMutableDictionary)managedSettingsGroupsToListenersMap;
- (NSMutableDictionary)notifyMatchingNotificationToListenersMap;
- (NSPointerArray)alarmListeners;
- (void)_dispatchToListenerForKey:(id)a3 inMap:(id)a4 withBlock:(id)a5;
- (void)_registerEventStreamHandlers;
- (void)_registerListener:(id)a3 forKeys:(id)a4 inMap:(id)a5;
@end

@implementation DMDEventStreamDispatcher

- (DMDEventStreamDispatcher)initWithListeners:(id)a3
{
  id v22 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DMDEventStreamDispatcher;
  v4 = [(DMDEventStreamDispatcher *)&v28 init];
  if (v4)
  {
    uint64_t v5 = +[NSPointerArray weakObjectsPointerArray];
    alarmListeners = v4->_alarmListeners;
    v4->_alarmListeners = (NSPointerArray *)v5;

    uint64_t v7 = objc_opt_new();
    distributedNotificationNameToListenersMap = v4->_distributedNotificationNameToListenersMap;
    v4->_distributedNotificationNameToListenersMap = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    notifyMatchingNotificationToListenersMap = v4->_notifyMatchingNotificationToListenersMap;
    v4->_notifyMatchingNotificationToListenersMap = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    managedSettingsGroupsToListenersMap = v4->_managedSettingsGroupsToListenersMap;
    v4->_managedSettingsGroupsToListenersMap = (NSMutableDictionary *)v11;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v22;
    id v13 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v15);
          if ((objc_opt_respondsToSelector() & 1) != 0 && [v16 alarms])
          {
            v17 = v4->_alarmListeners;
            objc_sync_enter(v17);
            [(NSPointerArray *)v4->_alarmListeners addPointer:v16];
            objc_sync_exit(v17);
          }
          if (objc_opt_respondsToSelector())
          {
            v18 = [v16 distributedNotificationNames];
            [(DMDEventStreamDispatcher *)v4 _registerListener:v16 forKeys:v18 inMap:v4->_distributedNotificationNameToListenersMap];
          }
          if (objc_opt_respondsToSelector())
          {
            v19 = [v16 notifyMatchingNotifications];
            [(DMDEventStreamDispatcher *)v4 _registerListener:v16 forKeys:v19 inMap:v4->_notifyMatchingNotificationToListenersMap];
          }
          if (objc_opt_respondsToSelector())
          {
            v20 = [v16 managedSettingsGroups];
            [(DMDEventStreamDispatcher *)v4 _registerListener:v16 forKeys:v20 inMap:v4->_managedSettingsGroupsToListenersMap];
          }
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v13);
    }

    [(DMDEventStreamDispatcher *)v4 _registerEventStreamHandlers];
  }

  return v4;
}

- (void)_registerEventStreamHandlers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047418;
  block[3] = &unk_1000CA508;
  block[4] = self;
  if (qword_1000FBAE8 != -1) {
    dispatch_once(&qword_1000FBAE8, block);
  }
}

- (void)_registerListener:(id)a3 forKeys:(id)a4 inMap:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v13);
        id v15 = v9;
        objc_sync_enter(v15);
        v16 = [v15 objectForKeyedSubscript:v14];
        if (!v16)
        {
          v16 = +[NSPointerArray weakObjectsPointerArray];
          [v15 setObject:v16 forKeyedSubscript:v14];
        }
        [v16 addPointer:v7];

        objc_sync_exit(v15);
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)_dispatchToListenerForKey:(id)a3 inMap:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (v7)
  {
    id v10 = v8;
    objc_sync_enter(v10);
    id v11 = [v10 objectForKeyedSubscript:v7];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v12 = [v11 allObjects];
    id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          if (v9) {
            v9[2](v9, *(void *)(*((void *)&v16 + 1) + 8 * (void)v15));
          }
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }

    objc_sync_exit(v10);
  }
}

- (NSPointerArray)alarmListeners
{
  return self->_alarmListeners;
}

- (NSMutableDictionary)distributedNotificationNameToListenersMap
{
  return self->_distributedNotificationNameToListenersMap;
}

- (NSMutableDictionary)notifyMatchingNotificationToListenersMap
{
  return self->_notifyMatchingNotificationToListenersMap;
}

- (NSMutableDictionary)managedSettingsGroupsToListenersMap
{
  return self->_managedSettingsGroupsToListenersMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedSettingsGroupsToListenersMap, 0);
  objc_storeStrong((id *)&self->_notifyMatchingNotificationToListenersMap, 0);
  objc_storeStrong((id *)&self->_distributedNotificationNameToListenersMap, 0);

  objc_storeStrong((id *)&self->_alarmListeners, 0);
}

@end