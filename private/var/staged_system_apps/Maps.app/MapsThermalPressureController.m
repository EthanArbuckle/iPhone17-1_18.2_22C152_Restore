@interface MapsThermalPressureController
+ (MapsThermalPressureController)sharedController;
+ (NSDictionary)mitigations;
- (BOOL)shouldActivateMitigationNamed:(id)a3;
- (MapsThermalPressureController)init;
- (id)_observersOfMitigationNamed:(id)a3;
- (int)currentThermalPressureLevel;
- (void)_handleNotifyCallback;
- (void)_updateAllObservers;
- (void)_updateObserversOfMitigationNamed:(id)a3;
- (void)addObserver:(id)a3 forMitigationNamed:(id)a4;
- (void)addThermalPressureObserver:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3 forMitigationNamed:(id)a4;
- (void)removeThermalPressureObserver:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation MapsThermalPressureController

- (int)currentThermalPressureLevel
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  isolationQueue = self->_isolationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v11 = sub_10010585C;
  v12 = &unk_1012E73F0;
  v13 = self;
  v14 = &v15;
  v3 = isolationQueue;
  v4 = v10;
  label = dispatch_queue_get_label(v3);
  v6 = dispatch_queue_get_label(0);
  if (label == v6 || label && v6 && !strcmp(label, v6))
  {
    v11((uint64_t)v4);
  }
  else
  {
    dispatch_sync(v3, v4);
  }

  int v8 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (void)addThermalPressureObserver:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v14 = sub_10009D6F8;
  uint64_t v15 = &unk_1012E5D58;
  id v6 = v4;
  id v16 = v6;
  uint64_t v17 = self;
  v7 = isolationQueue;
  int v8 = v13;
  label = dispatch_queue_get_label(v7);
  v10 = dispatch_queue_get_label(0);
  if (label == v10 || (label ? (BOOL v11 = v10 == 0) : (BOOL v11 = 1), !v11 && !strcmp(label, v10)))
  {
    v14((uint64_t)v8);
  }
  else
  {
    dispatch_sync(v7, v8);
  }
}

- (BOOL)shouldActivateMitigationNamed:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_notifyInitialized)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    isolationQueue = self->_isolationQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    uint64_t v15 = sub_10006B544;
    id v16 = &unk_1012E7A60;
    int v18 = self;
    v19 = &v20;
    id v17 = v4;
    v7 = isolationQueue;
    int v8 = v14;
    label = dispatch_queue_get_label(v7);
    v10 = dispatch_queue_get_label(0);
    if (label == v10 || label && v10 && !strcmp(label, v10))
    {
      v15((uint64_t)v8);
    }
    else
    {
      dispatch_sync(v7, v8);
    }

    BOOL v11 = *((unsigned char *)v21 + 24) != 0;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (MapsThermalPressureController)sharedController
{
  if (qword_1016106E8 != -1) {
    dispatch_once(&qword_1016106E8, &stru_101316648);
  }
  v2 = (void *)qword_1016106E0;

  return (MapsThermalPressureController *)v2;
}

- (void)addObserver:(id)a3 forMitigationNamed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009D7AC;
  v11[3] = &unk_1012FA980;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_copyWeak(&v14, &location);
  dispatch_async(isolationQueue, v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (id)_observersOfMitigationNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_mitigationObservers objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___ThermalPressureObserver queue:self->_isolationQueue];
    [(NSMutableDictionary *)self->_mitigationObservers setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (MapsThermalPressureController)init
{
  v28.receiver = self;
  v28.super_class = (Class)MapsThermalPressureController;
  id v2 = [(MapsThermalPressureController *)&v28 init];
  if (!v2) {
    return (MapsThermalPressureController *)v2;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.Maps.MapsThermalPressureController.isolation", v3);
  id v5 = (void *)*((void *)v2 + 5);
  *((void *)v2 + 5) = v4;

  uint64_t v6 = objc_opt_new();
  id v7 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v6;

  id v8 = [objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___ThermalPressureObserver queue:*((void *)v2 + 5)];
  id v9 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v8;

  objc_initWeak(&location, v2);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100AB4268;
  v25[3] = &unk_1012F6090;
  int v18 = &v26;
  objc_copyWeak(&v26, &location);
  handler = objc_retainBlock(v25);
  if (notify_register_dispatch(kOSThermalNotificationPressureLevelName, (int *)v2 + 7, *((dispatch_queue_t *)v2 + 5), handler))
  {
    id v10 = sub_10009D894();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to register for thermal pressure notifications", buf, 2u);
    }
  }
  else
  {
    if (!notify_get_state(*((_DWORD *)v2 + 7), (uint64_t *)v2 + 4))
    {
      *((unsigned char *)v2 + 24) = 1;
      goto LABEL_11;
    }
    id v10 = sub_10009D894();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to initialize thermal pressure state", buf, 2u);
    }
  }

LABEL_11:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v11 = [(id)objc_opt_class() mitigations];
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v15, "isEqualToString:", @"NavigationDisableLockScreen", v18, handler, (void)v20))
        {
          _GEOConfigAddDelegateListenerForKey();
        }
        else
        {
          id v16 = +[NSUserDefaults standardUserDefaults];
          [v16 addObserver:v2 forKeyPath:v15 options:0 context:&off_101316688];
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v12);
  }

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  return (MapsThermalPressureController *)v2;
}

+ (NSDictionary)mitigations
{
  if (qword_1016106F8 != -1) {
    dispatch_once(&qword_1016106F8, &stru_101316668);
  }
  id v2 = (void *)qword_1016106F0;

  return (NSDictionary *)v2;
}

- (void)dealloc
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(id)objc_opt_class() mitigations];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v8 isEqualToString:@"NavigationDisableLockScreen"] & 1) == 0)
        {
          id v9 = +[NSUserDefaults standardUserDefaults];
          [v9 removeObserver:self forKeyPath:v8 context:&off_101316688];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  GEOConfigRemoveDelegateListenerForAllKeys();
  notify_cancel(self->_token);
  v10.receiver = self;
  v10.super_class = (Class)MapsThermalPressureController;
  [(MapsThermalPressureController *)&v10 dealloc];
}

- (void)removeObserver:(id)a3 forMitigationNamed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AB450C;
  v11[3] = &unk_1012FA980;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_copyWeak(&v14, &location);
  dispatch_async(isolationQueue, v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)removeThermalPressureObserver:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  id v14 = sub_100AB470C;
  uint64_t v15 = &unk_1012E5D58;
  id v6 = v4;
  id v16 = v6;
  id v17 = self;
  id v7 = isolationQueue;
  id v8 = v13;
  label = dispatch_queue_get_label(v7);
  id v10 = dispatch_queue_get_label(0);
  if (label == v10 || (label ? (BOOL v11 = v10 == 0) : (BOOL v11 = 1), !v11 && !strcmp(label, v10)))
  {
    v14((uint64_t)v8);
  }
  else
  {
    dispatch_sync(v7, v8);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &off_101316688
    && ([(id)objc_opt_class() mitigations],
        id v13 = objc_claimAutoreleasedReturnValue(),
        [v13 allKeys],
        id v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 containsObject:v10],
        v14,
        v13,
        v15))
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100AB4938;
    block[3] = &unk_1012E7ED0;
    id v19 = v10;
    objc_copyWeak(&v20, &location);
    dispatch_async(isolationQueue, block);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MapsThermalPressureController;
    [(MapsThermalPressureController *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_handleNotifyCallback
{
  uint32_t state = notify_get_state(self->_token, &self->_currentThermalPressureLevel);
  id v4 = sub_10009D894();
  id v5 = v4;
  if (state)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to retrieve thermal pressure level", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unint64_t currentThermalPressureLevel = self->_currentThermalPressureLevel;
      int v7 = 134217984;
      unint64_t v8 = currentThermalPressureLevel;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Updated _currentThermalPressureLevel to %llu", (uint8_t *)&v7, 0xCu);
    }

    [(MapsThermalPressureController *)self _updateAllObservers];
  }
}

- (void)_updateObserversOfMitigationNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsThermalPressureController *)self _observersOfMitigationNamed:v4];
  [v5 didUpdateMitigationNamed:v4];
}

- (void)_updateAllObservers
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_mitigationObservers;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v9 = -[MapsThermalPressureController _observersOfMitigationNamed:](self, "_observersOfMitigationNamed:", v8, (void)v10);
        [v9 didUpdateMitigationNamed:v8];
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(GEOObserverHashTable *)self->_thermalPressureObservers didUpdateThermalPressureLevel:LODWORD(self->_currentThermalPressureLevel)];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_LockscreenThermalMitigationThreshold && a3.var1 == off_1015F1028)
  {
    id v5 = sub_10009D894();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Mitigation changed: NavigationDisableLockScreen", v6, 2u);
    }

    [(MapsThermalPressureController *)self _updateObserversOfMitigationNamed:@"NavigationDisableLockScreen"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_thermalPressureObservers, 0);

  objc_storeStrong((id *)&self->_mitigationObservers, 0);
}

@end