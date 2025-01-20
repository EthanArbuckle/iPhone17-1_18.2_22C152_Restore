@interface SMScreenLockMonitor
+ (BOOL)isDeviceLocked;
- (OS_dispatch_queue)queue;
- (SMScreenLockMonitor)initWithQueue:(id)a3 handler:(id)a4;
- (id)handler;
- (int)screenLockNotificationToken;
- (void)_registerForLockNotifications;
- (void)_unregisterForLockNotification;
- (void)setHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScreenLockNotificationToken:(int)a3;
@end

@implementation SMScreenLockMonitor

- (SMScreenLockMonitor)initWithQueue:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SMScreenLockMonitor initWithQueue:handler:]";
    __int16 v23 = 1024;
    int v24 = 43;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SMScreenLockMonitor initWithQueue:handler:]";
      __int16 v23 = 1024;
      int v24 = 44;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v20.receiver = self;
  v20.super_class = (Class)SMScreenLockMonitor;
  v12 = [(SMScreenLockMonitor *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    uint64_t v14 = [v9 copy];
    id handler = v13->_handler;
    v13->_id handler = (id)v14;

    queue = v13->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__SMScreenLockMonitor_initWithQueue_handler___block_invoke;
    block[3] = &unk_1E6B90E70;
    v19 = v13;
    dispatch_async(queue, block);
  }
  return v13;
}

uint64_t __45__SMScreenLockMonitor_initWithQueue_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForLockNotifications];
}

- (void)_registerForLockNotifications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SMScreenLockMonitor _registerForLockNotifications]";
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  int out_token = 0;
  objc_initWeak(&location, self);
  v4 = [(SMScreenLockMonitor *)self queue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __52__SMScreenLockMonitor__registerForLockNotifications__block_invoke;
  handler[3] = &unk_1E6B954B0;
  objc_copyWeak(&v11, &location);
  uint32_t v5 = notify_register_dispatch((const char *)*MEMORY[0x1E4FA77B8], &out_token, v4, handler);

  [(SMScreenLockMonitor *)self setScreenLockNotificationToken:out_token];
  if (v5)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SMScreenLockMonitor _registerForLockNotifications]";
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%s, unable to register for screen lock notifications", buf, 0xCu);
    }
  }
  else
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SMScreenLockMonitor _registerForLockNotifications]";
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%s, registered for screen lock notifications", buf, 0xCu);
    }
  }

  BOOL v7 = +[SMScreenLockMonitor isDeviceLocked];
  id v8 = [(SMScreenLockMonitor *)self handler];

  if (v8)
  {
    v9 = [(SMScreenLockMonitor *)self handler];
    v9[2](v9, v7);
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__SMScreenLockMonitor__registerForLockNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained handler];

    id WeakRetained = v5;
    if (v2)
    {
      BOOL v3 = +[SMScreenLockMonitor isDeviceLocked];
      v4 = [v5 handler];
      v4[2](v4, v3);

      id WeakRetained = v5;
    }
  }
}

- (void)_unregisterForLockNotification
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[SMScreenLockMonitor _unregisterForLockNotification]";
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  notify_cancel([(SMScreenLockMonitor *)self screenLockNotificationToken]);
  [(SMScreenLockMonitor *)self setHandler:0];
}

+ (BOOL)isDeviceLocked
{
  return SBSGetScreenLockStatus() != 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (int)screenLockNotificationToken
{
  return self->_screenLockNotificationToken;
}

- (void)setScreenLockNotificationToken:(int)a3
{
  self->_screenLockNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end