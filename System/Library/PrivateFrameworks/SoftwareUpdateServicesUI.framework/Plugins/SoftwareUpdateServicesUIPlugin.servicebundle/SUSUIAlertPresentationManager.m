@interface SUSUIAlertPresentationManager
- (BOOL)presentAlert:(id)a3 animated:(BOOL)a4;
- (NSSet)presentedAlerts;
- (OS_dispatch_queue)queue;
- (SUSUIAlertPresentationManager)initWithQueue:(id)a3;
- (id)_presenterForAlertItem:(id)a3;
- (id)presentedAlertsOfClass:(Class)a3;
- (void)_noteAlertDeactivated:(id)a3;
- (void)dismissAlert:(id)a3 animated:(BOOL)a4;
- (void)dismissAlertsOfClass:(Class)a3 animated:(BOOL)a4;
- (void)dismissAllAlertsAnimated:(BOOL)a3;
- (void)dismissAllAlertsExcludingClasses:(id)a3 animated:(BOOL)a4;
- (void)updateAlert:(id)a3 animated:(BOOL)a4;
- (void)updateAllAlertLockState:(BOOL)a3;
@end

@implementation SUSUIAlertPresentationManager

- (SUSUIAlertPresentationManager)initWithQueue:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)SUSUIAlertPresentationManager;
  v8 = [(SUSUIAlertPresentationManager *)&v9 init];
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v11->_queue, location[0]);
    v4 = (NSMutableArray *)+[NSMutableArray array];
    presenters = v11->_presenters;
    v11->_presenters = v4;
  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (NSSet)presentedAlerts
{
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = objc_alloc_init((Class)NSMutableSet);
  memset(__b, 0, sizeof(__b));
  obj = v15->_presenters;
  id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
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
      id v13 = *(id *)(__b[1] + 8 * v8);
      id v4 = v14[0];
      id v5 = [v13 alertItem];
      objc_msgSend(v4, "addObject:");

      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0;
        id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v3 = v14[0];
  objc_storeStrong(v14, 0);

  return (NSSet *)v3;
}

- (BOOL)presentAlert:(id)a3 animated:(BOOL)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v11 = a4;
  BSDispatchQueueAssert();
  id v10 = (id)SUSUILog();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v16, (uint64_t)location[0]);
    _os_log_impl(&def_46F0, (os_log_t)v10, v9, "[Alerts] Presenting alert: %@", v16, 0xCu);
  }
  objc_storeStrong(&v10, 0);
  [location[0] _setPresentationManager:v13];
  id v4 = [SUSUINotificationPresenter alloc];
  id v8 = [(SUSUINotificationPresenter *)v4 initWithQueue:v13->_queue alert:location[0]];
  if (([(NSMutableArray *)v13->_presenters containsObject:v8] & 1) == 0) {
    [(NSMutableArray *)v13->_presenters addObject:v8];
  }
  if ([v8 presentAlert])
  {
    char v14 = 1;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v15, (uint64_t)location[0]);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[Alerts] Failed presenting alert: %@", v15, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [location[0] _setPresentationManager:0];
    [(NSMutableArray *)v13->_presenters removeObject:v8];
    char v14 = 0;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (void)dismissAlert:(id)a3 animated:(BOOL)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  BSDispatchQueueAssert();
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v8, (uint64_t)location[0]);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[Alerts] Dismissing alert: %@", v8, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [location[0] dismissAlert];
  objc_storeStrong(location, 0);
}

- (void)dismissAlertsOfClass:(Class)a3 animated:(BOOL)a4
{
  v27 = self;
  SEL v26 = a2;
  Class v25 = a3;
  BOOL v24 = a4;
  BSDispatchQueueAssert();
  id v23 = (id)SUSUILog();
  os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
  {
    log = v23;
    os_log_type_t type = v22;
    uint64_t v11 = (uint64_t)v25;
    v16 = [(SUSUIAlertPresentationManager *)v27 presentedAlerts];
    v12 = v16;
    v21 = v12;
    id v15 = [(SUSUIAlertPresentationManager *)v27 presentedAlertsOfClass:v25];
    id v20 = v15;
    sub_58EC((uint64_t)v29, v11, (uint64_t)v12, (uint64_t)v20);
    _os_log_impl(&def_46F0, log, type, "[Alerts] Dismissing alerts of class: %@ (_presentedAlertItems: %@, ofClass: %@)", v29, 0x20u);

    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v21, 0);
  }
  objc_storeStrong(&v23, 0);
  id v19 = [(SUSUIAlertPresentationManager *)v27 presentedAlertsOfClass:v25];
  memset(__b, 0, sizeof(__b));
  id v9 = v19;
  id v10 = [v9 countByEnumeratingWithState:__b objects:v28 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(v9);
      }
      uint64_t v18 = *(void *)(__b[1] + 8 * v7);
      -[SUSUIAlertPresentationManager dismissAlert:animated:](v27, "dismissAlert:animated:", v18, v24, v8);
      ++v7;
      id v8 = (id)v4;
      if (v5 + 1 >= v4)
      {
        uint64_t v7 = 0;
        id v8 = [v9 countByEnumeratingWithState:__b objects:v28 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v19, 0);
}

- (void)dismissAllAlertsAnimated:(BOOL)a3
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id location = (id)SUSUILog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    log = location;
    os_log_type_t type = v6;
    sub_5A1C(v5);
    _os_log_impl(&def_46F0, log, type, "[Alerts] Dismissing all alerts", v5, 2u);
  }
  objc_storeStrong(&location, 0);
  [(SUSUIAlertPresentationManager *)v10 dismissAllAlertsExcludingClasses:0 animated:v8];
}

- (void)dismissAllAlertsExcludingClasses:(id)a3 animated:(BOOL)a4
{
  SEL v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v24 = a4;
  id v23 = (id)SUSUILog();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v29, (uint64_t)location[0]);
    _os_log_impl(&def_46F0, (os_log_t)v23, type, "[Alerts] Dismissing all alerts excluding classes: %@", v29, 0xCu);
  }
  objc_storeStrong(&v23, 0);
  memset(__b, 0, sizeof(__b));
  obj = [(SUSUIAlertPresentationManager *)v26 presentedAlerts];
  id v15 = [(NSSet *)obj countByEnumeratingWithState:__b objects:v28 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    id v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void *)(__b[1] + 8 * v12);
      char v19 = 0;
      memset(v17, 0, sizeof(v17));
      id v8 = location[0];
      id v9 = [v8 countByEnumeratingWithState:v17 objects:v27 count:16];
      if (v9)
      {
        uint64_t v5 = *(void *)v17[2];
        uint64_t v6 = 0;
        id v7 = v9;
        while (1)
        {
          uint64_t v4 = v6;
          if (*(void *)v17[2] != v5) {
            objc_enumerationMutation(v8);
          }
          aClassName = *(NSString **)(v17[1] + 8 * v6);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            NSClassFromString(aClassName);
            if (objc_opt_isKindOfClass()) {
              break;
            }
          }
          ++v6;
          if (v4 + 1 >= (unint64_t)v7)
          {
            uint64_t v6 = 0;
            id v7 = [v8 countByEnumeratingWithState:v17 objects:v27 count:16];
            if (!v7) {
              goto LABEL_16;
            }
          }
        }
        char v19 = 1;
      }
LABEL_16:

      if ((v19 & 1) == 0) {
        [(SUSUIAlertPresentationManager *)v26 dismissAlert:v21 animated:v24];
      }
      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0;
        id v13 = [(NSSet *)obj countByEnumeratingWithState:__b objects:v28 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (void)updateAlert:(id)a3 animated:(BOOL)a4
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  BSDispatchQueueAssert();
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v11, (uint64_t)location[0]);
    _os_log_impl(&def_46F0, oslog, type, "[Alerts] Updating alert: %@", v11, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v5 = [(SUSUIAlertPresentationManager *)v10 _presenterForAlertItem:location[0]];
  if (v5) {
    [v5 updateAlert];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)updateAllAlertLockState:(BOOL)a3
{
  v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  BSDispatchQueueAssert();
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v14) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_548C((uint64_t)v18, (uint64_t)v3);
    _os_log_impl(&def_46F0, oslog, type, "[Alerts] Updating alert lock state to isUILocked: %@", v18, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  memset(__b, 0, sizeof(__b));
  obj = [(SUSUIAlertPresentationManager *)v16 presentedAlerts];
  id v9 = [(NSSet *)obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v6);
      [v11 setIsUILocked:v14];
      [(SUSUIAlertPresentationManager *)v16 updateAlert:v11 animated:1];
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0;
        id v7 = [(NSSet *)obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }
}

- (id)presentedAlertsOfClass:(Class)a3
{
  uint64_t v18 = self;
  v17[2] = (id)a2;
  v17[1] = a3;
  BSDispatchQueueAssert();
  v17[0] = +[NSMutableSet set];
  memset(__b, 0, sizeof(__b));
  obj = v18->_presenters;
  id v14 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v14)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    id v12 = v14;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v11);
      id v7 = [v16 alertItem];
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v5 = v17[0];
        id v6 = [v16 alertItem];
        objc_msgSend(v5, "addObject:");
      }
      ++v11;
      if (v9 + 1 >= (unint64_t)v12)
      {
        uint64_t v11 = 0;
        id v12 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  id v4 = v17[0];
  objc_storeStrong(v17, 0);

  return v4;
}

- (void)_noteAlertDeactivated:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssert();
  id v4 = [(SUSUIAlertPresentationManager *)v6 _presenterForAlertItem:location[0]];
  if (v4)
  {
    id v3 = [v4 alertItem];
    [v3 _setPresentationManager:0];

    [v4 dismissAlert];
    [(NSMutableArray *)v6->_presenters removeObject:v4];
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (id)_presenterForAlertItem:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v17->_presenters;
  id v12 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    id v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v9);
      id v5 = [v14 alertItem];
      unsigned __int8 v6 = [v5 isEqual:location[0]];

      if (v6) {
        break;
      }
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0;
        id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v10) {
          goto LABEL_9;
        }
      }
    }
    objc_storeStrong(&v15, v14);
  }
LABEL_9:

  id v4 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end