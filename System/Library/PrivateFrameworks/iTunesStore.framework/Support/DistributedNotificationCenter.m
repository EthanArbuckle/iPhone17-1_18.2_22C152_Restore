@interface DistributedNotificationCenter
+ (id)defaultCenter;
+ (void)observeXPCServer:(id)a3;
+ (void)registerObserverWithMessage:(id)a3 connection:(id)a4;
+ (void)unregisterObserverWithMessage:(id)a3 connection:(id)a4;
- (DistributedNotificationCenter)init;
- (void)_addObserverWithPortName:(id)a3 notificationName:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_removeObserverWithPortName:(id)a3 notificationName:(id)a4;
- (void)_saveRegisteredPortNames;
- (void)dealloc;
- (void)postNotificationName:(__CFString *)a3;
@end

@implementation DistributedNotificationCenter

- (DistributedNotificationCenter)init
{
  v16.receiver = self;
  v16.super_class = (Class)DistributedNotificationCenter;
  v11 = [(DistributedNotificationCenter *)&v16 init];
  if (v11)
  {
    v11->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.DistributedNotificationCenter", 0);
    v11->_observers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2 = (void *)CFPreferencesCopyAppValue(@"DistributedNotificationObservers", kSSUserDefaultsIdentifier);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v3 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v3)
      {
        id v4 = v3;
        uint64_t v5 = *(void *)v13;
        do
        {
          for (i = 0; i != v4; i = (char *)i + 1)
          {
            if (*(void *)v13 != v5) {
              objc_enumerationMutation(v2);
            }
            uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
            id v8 = [v2 objectForKey:v7];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v8 count])
                {
                  v9 = [[DistributedNotificationObserver alloc] initWithServiceName:v7];
                  [(DistributedNotificationObserver *)v9 addObservedNotificationNames:v8];
                  if (v9)
                  {
                    [(NSMutableDictionary *)v11->_observers setObject:v9 forKey:v7];
                  }
                }
              }
            }
          }
          id v4 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
        }
        while (v4);
      }
    }
  }
  return v11;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)DistributedNotificationCenter;
  [(DistributedNotificationCenter *)&v3 dealloc];
}

+ (id)defaultCenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011A9D0;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401E48 != -1) {
    dispatch_once(&qword_100401E48, block);
  }
  return (id)qword_100401E40;
}

- (void)postNotificationName:(__CFString *)a3
{
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011AA90;
  v6[3] = &unk_1003A3838;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a3, 0, 0, 1u);
}

+ (void)observeXPCServer:(id)a3
{
  [a3 addObserver:a1 selector:"registerObserverWithMessage:connection:" forMessage:42];

  [a3 addObserver:a1 selector:"unregisterObserverWithMessage:connection:" forMessage:43];
}

+ (void)registerObserverWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011ACD8;
  v4[3] = &unk_1003A3380;
  v4[4] = a3;
  objc_msgSend(+[DistributedNotificationCenter defaultCenter](DistributedNotificationCenter, "defaultCenter"), "_handleMessage:connection:usingBlock:", a3, a4, v4);
}

+ (void)unregisterObserverWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011AF64;
  v4[3] = &unk_1003A3410;
  v4[4] = a3;
  void v4[5] = a1;
  objc_msgSend(+[DistributedNotificationCenter defaultCenter](DistributedNotificationCenter, "defaultCenter"), "_handleMessage:connection:usingBlock:", a3, a4, v4);
}

- (void)_addObserverWithPortName:(id)a3 notificationName:(id)a4
{
  uint64_t v7 = (DistributedNotificationObserver *)-[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:");
  if (!v7)
  {
    id v8 = [[DistributedNotificationObserver alloc] initWithServiceName:a3];
    [(NSMutableDictionary *)self->_observers setObject:v8 forKey:a3];
    uint64_t v7 = v8;
  }
  v9 = v7;
  [(DistributedNotificationObserver *)v7 addObservedNotificationName:a4];
  [(DistributedNotificationCenter *)self _saveRegisteredPortNames];
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.DistributedNotificationCenter");
  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B2A8;
  block[3] = &unk_1003A3438;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_removeObserverWithPortName:(id)a3 notificationName:(id)a4
{
  id v7 = -[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:");
  if (v7)
  {
    id v8 = v7;
    [v7 removeObservedNotificationName:a4];
    if (!objc_msgSend(objc_msgSend(v8, "observedNotificationNames"), "count")) {
      [(NSMutableDictionary *)self->_observers removeObjectForKey:a3];
    }
    [(DistributedNotificationCenter *)self _saveRegisteredPortNames];
  }
}

- (void)_saveRegisteredPortNames
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  observers = self->_observers;
  id v5 = [(NSMutableDictionary *)observers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(observers);
        }
        objc_msgSend(v3, "setObject:forKey:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i)), "observedNotificationNames"), *(void *)(*((void *)&v10 + 1) + 8 * i));
      }
      id v6 = [(NSMutableDictionary *)observers countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  CFStringRef v9 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"DistributedNotificationObservers", v3, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v9);
}

@end