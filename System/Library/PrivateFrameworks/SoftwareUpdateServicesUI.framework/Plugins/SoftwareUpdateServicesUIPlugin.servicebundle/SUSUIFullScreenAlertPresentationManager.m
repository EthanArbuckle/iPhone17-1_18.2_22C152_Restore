@interface SUSUIFullScreenAlertPresentationManager
- (NSMutableArray)activeFullScreenAlerts;
- (SUSUIFullScreenAlertPresentationManager)initWithQueue:(id)a3;
- (void)dismissAlert:(id)a3;
- (void)dismissAlertsOfClass:(Class)a3;
- (void)presentAlert:(id)a3 completion:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setActiveFullScreenAlerts:(id)a3;
@end

@implementation SUSUIFullScreenAlertPresentationManager

- (SUSUIFullScreenAlertPresentationManager)initWithQueue:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)SUSUIFullScreenAlertPresentationManager;
  v10 = [(SUSUIFullScreenAlertPresentationManager *)&v11 init];
  v13 = v10;
  objc_storeStrong((id *)&v13, v10);
  if (v10)
  {
    v4 = +[NSMapTable strongToStrongObjectsMapTable];
    alertToHandleMapping = v13->_alertToHandleMapping;
    v13->_alertToHandleMapping = v4;

    v6 = +[NSMapTable strongToStrongObjectsMapTable];
    alertActivationBlocks = v13->_alertActivationBlocks;
    v13->_alertActivationBlocks = v6;

    objc_storeStrong((id *)&v13->_queue, location[0]);
  }
  v9 = v13;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v9;
}

- (NSMutableArray)activeFullScreenAlerts
{
  v15 = self;
  v14[1] = (id)a2;
  BSDispatchQueueAssert();
  v14[0] = 0;
  memset(__b, 0, sizeof(__b));
  obj = [(NSMapTable *)v15->_alertToHandleMapping keyEnumerator];
  id v11 = [(NSEnumerator *)obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(__b[1] + 8 * v8);
      if (!v14[0])
      {
        id v2 = +[NSMutableArray array];
        id v3 = v14[0];
        v14[0] = v2;
      }
      [v14[0] addObject:v13];
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0;
        id v9 = [(NSEnumerator *)obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v5 = v14[0];
  objc_storeStrong(v14, 0);

  return (NSMutableArray *)v5;
}

- (void)presentAlert:(id)a3 completion:(id)a4
{
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  BSDispatchQueueAssert();
  id v10 = [location[0] configurationContext];
  id v6 = [location[0] remoteDefinition];
  id v9 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:");

  [v9 addObserver:v13];
  [(NSMapTable *)v13->_alertToHandleMapping setObject:v9 forKey:location[0]];
  if (v11)
  {
    alertActivationBlocks = v13->_alertActivationBlocks;
    id v5 = objc_retainBlock(v11);
    -[NSMapTable setObject:forKey:](alertActivationBlocks, "setObject:forKey:");
  }
  id v8 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
  {
    sub_4BF8((uint64_t)v14, (uint64_t)location[0], (uint64_t)v9);
    _os_log_debug_impl(&def_46F0, (os_log_t)v8, OS_LOG_TYPE_DEBUG, "Activate full-screen alert (%@) with handle: %@", v14, 0x16u);
  }
  objc_storeStrong(&v8, 0);
  [v9 activateWithOptions:0];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissAlert:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssert();
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_548C((uint64_t)v7, (uint64_t)location[0]);
    _os_log_debug_impl(&def_46F0, oslog, OS_LOG_TYPE_DEBUG, "invalidating full-screen alert (%@)", v7, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v3 = [(NSMapTable *)v6->_alertToHandleMapping objectForKey:location[0]];
  [v3 invalidate];

  [(NSMapTable *)v6->_alertToHandleMapping removeObjectForKey:location[0]];
  objc_storeStrong(location, 0);
}

- (void)dismissAlertsOfClass:(Class)a3
{
  v14 = self;
  SEL v13 = a2;
  Class v12 = a3;
  BSDispatchQueueAssert();
  memset(__b, 0, sizeof(__b));
  id v7 = [(NSMapTable *)v14->_alertToHandleMapping copy];
  id obj = [v7 keyEnumerator];

  id v9 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v9)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    id v6 = v9;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(__b[1] + 8 * v5);
      if (objc_opt_isKindOfClass()) {
        [(SUSUIFullScreenAlertPresentationManager *)v14 dismissAlert:v11];
      }
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0;
        id v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = (id)SUSUILog();
  os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
  {
    sub_548C((uint64_t)v15, (uint64_t)location[0]);
    _os_log_debug_impl(&def_46F0, (os_log_t)v12, v11, "remoteAlertHandleDidActivate: %@", v15, 0xCu);
  }
  objc_storeStrong(&v12, 0);
  queue = v14->_queue;
  uint64_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_99C4;
  id v8 = &unk_5CFB0;
  id v9 = v14;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  SEL v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = (id)SUSUILog();
  os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
  {
    sub_548C((uint64_t)v14, (uint64_t)location[0]);
    _os_log_debug_impl(&def_46F0, (os_log_t)v11, v10, "remoteAlertHandleDidActivate: %@", v14, 0xCu);
  }
  objc_storeStrong(&v11, 0);
  queue = v13->_queue;
  uint64_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_9BDC;
  id v8 = &unk_5CC30;
  id v9 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = (id)SUSUILog();
  os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
  {
    sub_4BF8((uint64_t)v18, (uint64_t)location[0], (uint64_t)v15);
    _os_log_debug_impl(&def_46F0, (os_log_t)v14, v13, "remoteAlertHandle: %@, error: %@", v18, 0x16u);
  }
  objc_storeStrong(&v14, 0);
  queue = v17->_queue;
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_9E10;
  os_log_type_t v10 = &unk_5CFB0;
  id v11 = location[0];
  id v12 = v17;
  dispatch_async(queue, &v6);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)setActiveFullScreenAlerts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end