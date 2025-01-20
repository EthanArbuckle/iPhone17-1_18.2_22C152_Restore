@interface MapsPowerSourceController
+ (MapsPowerSourceController)sharedController;
- (MapsPowerSourceController)init;
- (int64_t)chargingState;
- (void)_handleNotifyCallback;
- (void)_updateChargingState;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MapsPowerSourceController

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = sub_100065038();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134349314;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Registering observer: %@", (uint8_t *)&v6, 0x16u);
  }

  [(GEOObserverHashTable *)self->_powerSourceObservers registerObserver:v4];
}

- (MapsPowerSourceController)init
{
  v28.receiver = self;
  v28.super_class = (Class)MapsPowerSourceController;
  id v2 = [(MapsPowerSourceController *)&v28 init];
  if (v2)
  {
    v3 = sub_100065038();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v30 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Maps.MapsPowerSourceController.callback", v5);
    v7 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v6;

    __int16 v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Maps.MapsPowerSourceController.isolation", v9);
    v11 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v10;

    id v12 = [objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MapsPowerSourceObserver queue:*((void *)v2 + 2)];
    v13 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v12;

    objc_initWeak(&location, v2);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100C131B0;
    v25[3] = &unk_1012F6090;
    objc_copyWeak(&v26, &location);
    v14 = objc_retainBlock(v25);
    uint32_t v15 = notify_register_dispatch("com.apple.system.powersources", (int *)v2 + 2, *((dispatch_queue_t *)v2 + 2), v14);
    v16 = sub_100065038();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        id v30 = v2;
        v18 = "[%{public}p] Failed to register for power source notifications";
        v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v30 = v2;
      v18 = "[%{public}p] Successfully registered for power source notification";
      v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_INFO;
      goto LABEL_9;
    }

    v21 = *((void *)v2 + 2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C131F0;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v24, &location);
    dispatch_async(v21, block);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return (MapsPowerSourceController *)v2;
}

+ (MapsPowerSourceController)sharedController
{
  if (qword_101610B08 != -1) {
    dispatch_once(&qword_101610B08, &stru_10131B8B8);
  }
  id v2 = (void *)qword_101610B00;

  return (MapsPowerSourceController *)v2;
}

- (void)dealloc
{
  v3 = sub_100065038();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    dispatch_queue_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  notify_cancel(self->_anyPowerSourceToken);
  v4.receiver = self;
  v4.super_class = (Class)MapsPowerSourceController;
  [(MapsPowerSourceController *)&v4 dealloc];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v5 = sub_100065038();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134349314;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Unregistering observer: %@", (uint8_t *)&v6, 0x16u);
  }

  [(GEOObserverHashTable *)self->_powerSourceObservers unregisterObserver:v4];
}

- (int64_t)chargingState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C13474;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateChargingState
{
  int64_t v3 = sub_100065038();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Updating charging state", buf, 0xCu);
  }

  id v4 = (const void *)IOPSCopyPowerSourcesByType();
  v5 = v4;
  if (v4)
  {
    CFArrayRef v6 = IOPSCopyPowerSourcesList(v4);
    CFArrayRef v7 = v6;
    if (v6)
    {
      if (CFArrayGetCount(v6) >= 1)
      {
        char v34 = 0;
        CFIndex v8 = 0;
        uint64_t v33 = 2;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v7, v8);
          dispatch_queue_t v10 = IOPSGetPowerSourceDescription(v5, ValueAtIndex);
          v11 = sub_100065038();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134349314;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}p] Checking power source: %@", buf, 0x16u);
          }

          id v12 = [v10 objectForKey:@"Type"];
          if (([v12 isEqualToString:@"InternalBattery"] & 1) == 0) {
            break;
          }
          v13 = [v10 objectForKey:@"Is Charging"];
          if ([v13 BOOLValue])
          {
          }
          else
          {
            v17 = [v10 objectForKey:@"Show Charging UI"];
            unsigned int v18 = [v17 BOOLValue];

            if (!v18)
            {
              v14 = sub_100065038();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134349056;
                *(void *)&uint8_t buf[4] = self;
                uint32_t v15 = v14;
                v16 = "[%{public}p] Power source is not charging; ignoring";
LABEL_14:
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0xCu);
              }
              goto LABEL_15;
            }
          }
          CFDictionaryRef v19 = IOPSCopyExternalPowerAdapterDetails();
          os_log_type_t v20 = sub_100065038();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134349314;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[%{public}p] Checking adapter details: %@", buf, 0x16u);
          }

          v21 = [(__CFDictionary *)v19 objectForKey:@"IsWireless"];
          unsigned __int8 v22 = [v21 BOOLValue];

          if (v22)
          {

            char v34 = 1;
            uint64_t v27 = 3;
            goto LABEL_33;
          }
          char v34 = 1;
LABEL_21:

          if (++v8 >= CFArrayGetCount(v7)) {
            goto LABEL_34;
          }
        }
        v14 = sub_100065038();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349056;
          *(void *)&uint8_t buf[4] = self;
          uint32_t v15 = v14;
          v16 = "[%{public}p] Power source is not internal; ignoring";
          goto LABEL_14;
        }
LABEL_15:

        goto LABEL_21;
      }
      char v34 = 0;
      uint64_t v27 = 2;
LABEL_33:
      uint64_t v33 = v27;
LABEL_34:
      CFRelease(v5);
      CFRelease(v7);
      if (v34) {
        uint64_t v28 = v33;
      }
      else {
        uint64_t v28 = 1;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v45 = 0;
      isolationQueue = self->_isolationQueue;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100C13B04;
      v35[3] = &unk_1012ECF98;
      v35[4] = self;
      v35[5] = buf;
      v35[6] = v28;
      dispatch_sync(isolationQueue, v35);
      id v30 = sub_100065038();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          v31 = @"YES";
        }
        else {
          v31 = @"NO";
        }
        v32 = v31;
        *(_DWORD *)v38 = 134349570;
        v39 = self;
        __int16 v40 = 2048;
        uint64_t v41 = v28;
        __int16 v42 = 2112;
        v43 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Calculated charging state: %ld, didChange: %@", v38, 0x20u);
      }
      if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
        [(GEOObserverHashTable *)self->_powerSourceObservers powerSourceController:self didUpdateChargingState:v28];
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      CFRelease(v5);
      v25 = sub_100065038();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%{public}p] Could not copy power sources list", buf, 0xCu);
      }

      id v26 = self->_isolationQueue;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100C13AF8;
      v36[3] = &unk_1012E5D08;
      v36[4] = self;
      dispatch_sync(v26, v36);
      [(GEOObserverHashTable *)self->_powerSourceObservers powerSourceController:self didUpdateChargingState:0];
    }
  }
  else
  {
    v23 = sub_100065038();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{public}p] Could not copy power sources by type", buf, 0xCu);
    }

    id v24 = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C13AEC;
    block[3] = &unk_1012E5D08;
    void block[4] = self;
    dispatch_sync(v24, block);
    [(GEOObserverHashTable *)self->_powerSourceObservers powerSourceController:self didUpdateChargingState:0];
  }
}

- (void)_handleNotifyCallback
{
  int64_t v3 = sub_100065038();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134349056;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Got update notification", (uint8_t *)&v4, 0xCu);
  }

  [(MapsPowerSourceController *)self _updateChargingState];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSourceObservers, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end