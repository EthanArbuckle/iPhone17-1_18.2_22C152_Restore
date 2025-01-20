@interface SUSUILayoutStateMonitor
- (BOOL)_queue_fetchUILockState;
- (BOOL)_queue_setForegroundBundleID:(id)a3;
- (BOOL)_queue_setHomeScreenForeground:(BOOL)a3;
- (BOOL)_queue_setScreenOn:(BOOL)a3;
- (BOOL)fetchUILockedSync;
- (BOOL)isHomeScreenForeground;
- (BOOL)isScreenOn;
- (BOOL)isUILocked;
- (NSString)primaryForegroundBundleID;
- (SUSUILayoutStateMonitor)init;
- (void)_queue_UILockStateChanged:(BOOL)a3 initially:(BOOL)a4;
- (void)_queue_handleNewLayout:(id)a3 context:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation SUSUILayoutStateMonitor

- (void)_queue_handleNewLayout:(id)a3 context:(id)a4
{
  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v48 = 0;
  objc_storeStrong(&v48, a4);
  BSDispatchQueueAssert();
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_4BF8((uint64_t)v54, (uint64_t)location[0], (uint64_t)v48);
    _os_log_debug_impl(&def_46F0, oslog, type, "new layout: >>>\n%@\ncontext: >>>\n%@", v54, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (location[0])
  {
    char v44 = 0;
    char v43 = 0;
    char v42 = 0;
    id v41 = 0;
    memset(__b, 0, sizeof(__b));
    id v24 = [location[0] elements];
    id v25 = [v24 countByEnumeratingWithState:__b objects:v53 count:16];
    if (v25)
    {
      uint64_t v21 = *(void *)__b[2];
      uint64_t v22 = 0;
      id v23 = v25;
      while (1)
      {
        uint64_t v20 = v22;
        if (*(void *)__b[2] != v21) {
          objc_enumerationMutation(v24);
        }
        id v40 = *(id *)(__b[1] + 8 * v22);
        if ([v40 isSpringBoardElement])
        {
          v4 = (char *)[v40 layoutRole];
          if ((unint64_t)v4 <= 1)
          {
            v6 = v4 - 1;
            char v5 = 0;
          }
          else
          {
            v6 = v4 - 1;
            char v5 = 1;
          }
          if ((v5 & 1) == 0)
          {
            switch((unint64_t)v6)
            {
              case 0uLL:
                id v18 = [v40 identifier];
                unsigned __int8 v19 = [v18 isEqualToString:SBSDisplayLayoutElementHomeScreenIdentifier];

                if (v19)
                {
                  char v44 = 1;
                }
                else if ([v40 isUIApplicationElement])
                {
                  id v7 = [v40 bundleIdentifier];
                  id v8 = v41;
                  id v41 = v7;
                }
                else
                {
                  v52[0] = SBSDisplayLayoutElementAppSwitcherIdentifier;
                  v52[1] = SBSDisplayLayoutElementSpotlightFullscreenOverlayIdentifier;
                  v16 = +[NSArray arrayWithObjects:v52 count:2];
                  id v15 = [v40 identifier];
                  unsigned __int8 v17 = -[NSArray containsObject:](v16, "containsObject:");

                  if (v17) {
                    char v42 = 1;
                  }
                }
                break;
              case 1uLL:
              case 4uLL:
                break;
              case 2uLL:
                char v43 = 1;
                break;
              case 3uLL:
              case 5uLL:
                v51[0] = SBSDisplayLayoutElementTodayViewIdentifier;
                v51[1] = FBSDisplayLayoutElementControlCenterIdentifier;
                v51[2] = SBSDisplayLayoutElementSpotlightIdentifier;
                v51[3] = SBSDisplayLayoutElementSpotlightFullscreenOverlayIdentifier;
                v13 = +[NSArray arrayWithObjects:v51 count:4];
                id v12 = [v40 identifier];
                unsigned __int8 v14 = -[NSArray containsObject:](v13, "containsObject:");

                if (v14) {
                  char v42 = 1;
                }
                break;
              default:
                JUMPOUT(0);
            }
          }
        }
        ++v22;
        if (v20 + 1 >= (unint64_t)v23)
        {
          uint64_t v22 = 0;
          id v23 = [v24 countByEnumeratingWithState:__b objects:v53 count:16];
          if (!v23) {
            break;
          }
        }
      }
    }

    char v38 = 0;
    char v11 = 0;
    if (v44)
    {
      char v11 = 0;
      if ((v43 & 1) == 0) {
        char v11 = v42 ^ 1;
      }
    }
    char v38 = [(SUSUILayoutStateMonitor *)v50 _queue_setHomeScreenForeground:v11 & 1];
    char v37 = [(SUSUILayoutStateMonitor *)v50 _queue_setForegroundBundleID:v41];
    char v36 = -[SUSUILayoutStateMonitor _queue_setScreenOn:](v50, "_queue_setScreenOn:", (uint64_t)[location[0] displayBacklightLevel] > 0);
    char v35 = 0;
    char v10 = 1;
    if ((v38 & 1) == 0)
    {
      char v10 = 1;
      if ((v37 & 1) == 0) {
        char v10 = v36;
      }
    }
    char v35 = v10 & 1;
    if ((v10 & 1) != 0 && [(NSHashTable *)v50->_queue_observers count])
    {
      id v34 = [(NSHashTable *)v50->_queue_observers allObjects];
      queue = v50->_observerCalloutQueue;
      v27 = _NSConcreteStackBlock;
      int v28 = -1073741824;
      int v29 = 0;
      v30 = sub_21888;
      v31 = &unk_5CFB0;
      id v32 = v34;
      v33 = v50;
      dispatch_async(queue, &v27);
      objc_storeStrong((id *)&v33, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v34, 0);
    }
    objc_storeStrong(&v41, 0);
    int v45 = 0;
  }
  else
  {
    int v45 = 1;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_queue_setScreenOn:(BOOL)a3
{
  BOOL v4 = 0;
  if (self->_queue_isScreenOn != a3)
  {
    self->_queue_isScreenOn = a3;
    return 1;
  }
  return v4;
}

- (BOOL)_queue_setHomeScreenForeground:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  char v5 = 0;
  if (self->_queue_isHomeScreenForeground != a3)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_4E98((uint64_t)v9, v8->_queue_isHomeScreenForeground, v6);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "homescreen changed: %d -> %d", v9, 0xEu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8->_queue_isHomeScreenForeground = v6;
    char v5 = 1;
  }
  return v5 & 1;
}

- (BOOL)_queue_setForegroundBundleID:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v4 = 0;
  if (![(NSString *)v6->_queue_primaryForegroundBundleID isEqualToString:location[0]])
  {
    objc_storeStrong((id *)&v6->_queue_primaryForegroundBundleID, location[0]);
    char v4 = 1;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (SUSUILayoutStateMonitor)init
{
  SEL v40 = a2;
  id v41 = 0;
  v39.receiver = self;
  v39.super_class = (Class)SUSUILayoutStateMonitor;
  v16 = [(SUSUILayoutStateMonitor *)&v39 init];
  id v41 = v16;
  objc_storeStrong((id *)&v41, v16);
  if (v16)
  {
    id v38 = dispatch_semaphore_create(0);
    int64_t v37 = 10000000000;
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.softwareupdateservices.ui.ios.layoutMonitor", 0);
    v3 = v41->_queue;
    v41->_queue = (OS_dispatch_queue *)v2;

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.softwareupdateservices.ui.ios.layoutMonitor.observerQueue", 0);
    observerCalloutQueue = v41->_observerCalloutQueue;
    v41->_observerCalloutQueue = (OS_dispatch_queue *)v4;

    BOOL v6 = +[NSHashTable hashTableWithOptions:517];
    queue_observers = v41->_queue_observers;
    v41->_queue_observers = v6;

    id v36 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    id v14 = v36;
    v30 = _NSConcreteStackBlock;
    int v31 = -1073741824;
    int v32 = 0;
    v33 = sub_4340;
    id v34 = &unk_5FCC0;
    char v35 = v41;
    [v14 setTransitionHandler:&v30];
    id v8 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v36];
    layoutMonitor = v41->_layoutMonitor;
    v41->_layoutMonitor = v8;

    v24[0] = 0;
    v24[1] = v24;
    int v25 = 838860800;
    int v26 = 48;
    v27 = sub_208CC;
    int v28 = sub_20924;
    int v29 = v41;
    queue = v41->_queue;
    unsigned __int8 v17 = _NSConcreteStackBlock;
    int v18 = -1073741824;
    int v19 = 0;
    uint64_t v20 = sub_20954;
    uint64_t v21 = &unk_5FD10;
    uint64_t v22 = v41;
    v23[1] = v24;
    v23[0] = v38;
    dispatch_async(queue, &v17);
    if (v38)
    {
      dsema = v38;
      dispatch_time_t v10 = dispatch_time(0, v37);
      dispatch_semaphore_wait(dsema, v10);
    }
    objc_storeStrong(v23, 0);
    objc_storeStrong((id *)&v22, 0);
    _Block_object_dispose(v24, 8);
    objc_storeStrong((id *)&v29, 0);
    objc_storeStrong((id *)&v35, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v38, 0);
  }
  id v12 = v41;
  objc_storeStrong((id *)&v41, 0);
  return v12;
}

- (void)dealloc
{
  dispatch_queue_t v4 = self;
  SEL v3 = a2;
  notify_cancel(self->_queue_uiLockStateToken);
  v4->_queue_uiLockStateToken = -1;
  [(FBSDisplayLayoutMonitor *)v4->_layoutMonitor invalidate];
  v2.receiver = v4;
  v2.super_class = (Class)SUSUILayoutStateMonitor;
  [(SUSUILayoutStateMonitor *)&v2 dealloc];
}

- (NSString)primaryForegroundBundleID
{
  v17[2] = self;
  v17[1] = (id)a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  int v13 = 838860800;
  int v14 = 48;
  id v15 = sub_208CC;
  v16 = sub_20924;
  v17[0] = 0;
  queue = self->_queue;
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_20D3C;
  v9 = &unk_5FD38;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  id v4 = (id)v12[5];
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0);

  return (NSString *)v4;
}

- (BOOL)isHomeScreenForeground
{
  unsigned __int8 v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = self->_queue;
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_20E8C;
  v9 = &unk_5FD38;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

- (BOOL)isScreenOn
{
  unsigned __int8 v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = self->_queue;
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_20FCC;
  v9 = &unk_5FD38;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

- (void)addObserver:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_queue;
  char v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_21104;
  id v8 = &unk_5CFB0;
  id v9 = location[0];
  dispatch_time_t v10 = v12;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)removeObserver:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_queue;
  char v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_21268;
  id v8 = &unk_5CFB0;
  id v9 = location[0];
  dispatch_time_t v10 = v12;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)fetchUILockedSync
{
  unsigned __int8 v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = self->_queue;
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_213D4;
  id v9 = &unk_5FD38;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

- (BOOL)_queue_fetchUILockState
{
  state64[2] = (uint64_t)self;
  state64[1] = (uint64_t)a2;
  state64[0] = 0;
  notify_get_state(self->_queue_uiLockStateToken, state64);
  return state64[0] == 1;
}

- (void)_queue_UILockStateChanged:(BOOL)a3 initially:(BOOL)a4
{
  int v19 = self;
  SEL v18 = a2;
  BOOL v17 = a3;
  BOOL v16 = a4;
  if (a4 || v19->_isUILocked != v17)
  {
    v19->_isUILocked = v17;
    if (!v16)
    {
      id location = (id)SUSUILog();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        if (v17) {
          CFStringRef v4 = @"YES";
        }
        else {
          CFStringRef v4 = @"NO";
        }
        sub_548C((uint64_t)v20, (uint64_t)v4);
        _os_log_impl(&def_46F0, (os_log_t)location, v14, "UI lock state changed: isUILocked=%@", v20, 0xCu);
      }
      objc_storeStrong(&location, 0);
      int v13 = [(NSHashTable *)v19->_queue_observers allObjects];
      queue = v19->_observerCalloutQueue;
      int v6 = _NSConcreteStackBlock;
      int v7 = -1073741824;
      int v8 = 0;
      id v9 = sub_216B4;
      dispatch_time_t v10 = &unk_5CFB0;
      uint64_t v11 = v13;
      id v12 = v19;
      dispatch_async(queue, &v6);
      objc_storeStrong((id *)&v12, 0);
      objc_storeStrong((id *)&v11, 0);
      objc_storeStrong((id *)&v13, 0);
    }
  }
}

- (BOOL)isUILocked
{
  return self->_isUILocked;
}

- (void).cxx_destruct
{
}

@end