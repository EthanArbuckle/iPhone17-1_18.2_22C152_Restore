@interface RTStarkManager
+ (BOOL)supportsNotificationName:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)connectionStateToString:(int64_t)a3;
- (RTDefaultsManager)defaultsManager;
- (RTStarkManager)init;
- (RTStarkManager)initWithDefaultsManager:(id)a3;
- (void)_fetchConnectionStateWithHandler:(id)a3;
- (void)fetchConnectionStateWithHandler:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)setDefaultsManager:(id)a3;
@end

@implementation RTStarkManager

uint64_t __30__RTStarkManager_CarKit_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

void __60__RTStarkManager_CarKit__updateTrustedConnectionEstablished__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTStarkManager_CarKit__updateTrustedConnectionEstablished__block_invoke_2;
  block[3] = &unk_1E6B92F80;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __60__RTStarkManager_CarKit__updateTrustedConnectionEstablished__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = _rt_log_facility_get_os_log(RTLogFacilityStark);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "error retrieving paired vehicles, %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return [*(id *)(a1 + 40) setTrustedConnectionEstablished:[*(id *)(a1 + 48) count] != 0];
}

uint64_t __51__RTStarkManager_CarKit_onPairedVehiclesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTrustedConnectionEstablished];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[RTStarkManager allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RTStarkManager;
    return [super allocWithZone:a3];
  }
}

- (RTStarkManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTStarkManager)initWithDefaultsManager:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTStarkManager;
    objc_super v6 = [(RTNotifier *)&v11 init];
    uint64_t v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_defaultsManager, a3);
    }
    self = v7;
    uint64_t v8 = self;
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[RTStarkManager initWithDefaultsManager:]";
      __int16 v14 = 1024;
      int v15 = 50;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityStark);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityStark);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3 = a3;
  id v4 = +[RTNotification notificationName];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)fetchConnectionStateWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [(RTNotifier *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__RTStarkManager_fetchConnectionStateWithHandler___block_invoke;
    v6[3] = &unk_1E6B90CE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __50__RTStarkManager_fetchConnectionStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchConnectionStateWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchConnectionStateWithHandler:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x1E4F28568];
    v8[0] = @"Not supported on this platform.";
    id v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = (void (**)(id, void, void *))a3;
    char v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];
    int v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:v5];
    v4[2](v4, 0, v6);
  }
}

+ (id)connectionStateToString:(int64_t)a3
{
  id v3 = @"Unknown";
  if (a3 == 1) {
    id v3 = @"Connected";
  }
  if (a3 == 2) {
    return @"Disconnected";
  }
  else {
    return v3;
  }
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end