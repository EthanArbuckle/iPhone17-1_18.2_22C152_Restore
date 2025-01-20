@interface RTDarwinNotificationHelper
- (NSMutableDictionary)registrations;
- (RTDarwinNotificationHelper)init;
- (unint64_t)stateForNotificationName:(id)a3;
- (void)_handleDarwinNotificationCallback:(id)a3;
- (void)addObserver:(id)a3 center:(__CFNotificationCenter *)a4 key:(id)a5 callback:(void *)a6 info:(void *)a7 suspensionBehavior:(int64_t)a8;
- (void)addObserverForNotificationName:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)postNotification:(id)a3;
- (void)removeObserver:(id)a3 center:(__CFNotificationCenter *)a4 key:(id)a5 info:(void *)a6;
- (void)removeObserverForNotificationName:(id)a3;
- (void)setRegistrations:(id)a3;
@end

@implementation RTDarwinNotificationHelper

- (unint64_t)stateForNotificationName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t state64 = 0;
  v5 = [(NSMutableDictionary *)self->_registrations objectForKey:v4];

  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_registrations objectForKey:v4];
    v7 = [v6 registrationToken];
    int v8 = [v7 intValue];

    if (notify_get_state(v8, &state64))
    {
      v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Could not get state for %@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = state64;

  return v10;
}

void __69__RTDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleDarwinNotificationCallback:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_handleDarwinNotificationCallback:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "darwin notification received, %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = [(NSMutableDictionary *)v5->_registrations objectForKey:v4];
    int v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 handler];
      uint64_t v10 = v9;
      if (v9) {
        (*(void (**)(uint64_t))(v9 + 16))(v9);
      }
    }
    else
    {
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "failed call darwin notification handler, record nil", (uint8_t *)&v11, 2u);
      }
    }
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName", (uint8_t *)&v11, 2u);
    }
  }

  objc_sync_exit(v5);
}

- (RTDarwinNotificationHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTDarwinNotificationHelper;
  v2 = [(RTDarwinNotificationHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    registrations = v2->_registrations;
    v2->_registrations = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_registrations allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) notificationName];
        [(RTDarwinNotificationHelper *)self removeObserverForNotificationName:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)RTDarwinNotificationHelper;
  [(RTDarwinNotificationHelper *)&v9 dealloc];
}

- (void)addObserverForNotificationName:(id)a3 handler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  objc_sync_enter(v8);
  if (!v6)
  {
    long long v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName", buf, 2u);
    }
    goto LABEL_12;
  }
  if (!v7)
  {
    long long v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_12;
  }
  objc_super v9 = [(NSMutableDictionary *)v8->_registrations objectForKey:v6];

  if (v9)
  {
    long long v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "registration already exists for notification name %@, returning", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_22;
  }
  objc_initWeak(&location, v8);
  int out_token = -1;
  id v11 = v6;
  long long v12 = (const char *)[v11 UTF8String];
  id v13 = MEMORY[0x1E4F14428];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __69__RTDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke;
  v27 = &unk_1E6B91EA0;
  objc_copyWeak(&v29, &location);
  id v14 = v11;
  id v28 = v14;
  uint32_t v15 = notify_register_dispatch(v12, &out_token, MEMORY[0x1E4F14428], &v24);

  if (v15 || out_token == -1)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v33 = v14;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = v15;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = out_token;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "failed to register for darwin notification, %@, status, %d, registration token, %d", buf, 0x18u);
    }
  }
  else
  {
    v16 = [RTDarwinNotificationRecord alloc];
    v17 = [NSNumber numberWithInt:out_token, v24, v25, v26, v27];
    v18 = [(RTDarwinNotificationRecord *)v16 initWithNotificationName:v14 registrationToken:v17 handler:v7];

    if (v18)
    {
      v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = [v18 notificationName];
        v21 = [v18 registrationToken];
        v22 = [v18 registrationToken];
        BOOL is_valid_token = notify_is_valid_token([v22 intValue]);
        *(_DWORD *)buf = 138412802;
        id v33 = v20;
        __int16 v34 = 2112;
        *(void *)v35 = v21;
        *(_WORD *)&v35[8] = 1024;
        BOOL v36 = is_valid_token;
        _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "added registration for for notification name, %@, token, %@, valid, %d", buf, 0x1Cu);
      }
      [(NSMutableDictionary *)v8->_registrations setObject:v18 forKey:v14];
    }
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
LABEL_22:
  objc_sync_exit(v8);
}

- (void)removeObserverForNotificationName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    id v6 = [(NSMutableDictionary *)v5->_registrations objectForKey:v4];
    id v7 = v6;
    if (!v6)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "registration doesn't exist for notification %@, returning", (uint8_t *)&v15, 0xCu);
      }
      goto LABEL_10;
    }
    int v8 = [v6 registrationToken];
    int v9 = [v8 intValue];

    uint32_t v10 = notify_cancel(v9);
    if (v10)
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        long long v12 = [v7 notificationName];
        int v15 = 138412546;
        id v16 = v12;
        __int16 v17 = 1024;
        uint32_t v18 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "failed to cancel registration for darwin notification, %@, status, %u", (uint8_t *)&v15, 0x12u);
      }
LABEL_10:

      goto LABEL_14;
    }
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [v7 notificationName];
      int v15 = 138412290;
      id v16 = v14;
      _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "removing registration for for notification name, %@", (uint8_t *)&v15, 0xCu);
    }
    [(NSMutableDictionary *)v5->_registrations removeObjectForKey:v4];
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName", (uint8_t *)&v15, 2u);
    }
  }
LABEL_14:

  objc_sync_exit(v5);
}

- (void)postNotification:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (const char *)[a3 UTF8String];
    notify_post(v3);
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName", v5, 2u);
    }
  }
}

- (void)addObserver:(id)a3 center:(__CFNotificationCenter *)a4 key:(id)a5 callback:(void *)a6 info:(void *)a7 suspensionBehavior:(int64_t)a8
{
}

- (void)removeObserver:(id)a3 center:(__CFNotificationCenter *)a4 key:(id)a5 info:(void *)a6
{
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end