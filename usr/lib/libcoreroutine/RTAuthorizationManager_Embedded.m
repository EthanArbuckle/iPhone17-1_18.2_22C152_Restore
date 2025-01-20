@interface RTAuthorizationManager_Embedded
- (BOOL)isLocationServicesEnabled;
- (RTAuthorizationManager_Embedded)initWithMetricManager:(id)a3 platform:(id)a4 userSessionMonitor:(id)a5;
@end

@implementation RTAuthorizationManager_Embedded

- (RTAuthorizationManager_Embedded)initWithMetricManager:(id)a3 platform:(id)a4 userSessionMonitor:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTAuthorizationManager_Embedded;
  v8 = [(RTAuthorizationManager *)&v14 initWithPlatform:v7 userSessionMonitor:a5];
  if (v8)
  {
    if ([v7 supportsCoreRoutineCapability]) {
      uint64_t v9 = [v7 supportsMultiUser] ^ 1;
    }
    else {
      uint64_t v9 = 0;
    }
    [(RTAuthorizationManager *)v8 setSupported:v9];
    v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = [(RTAuthorizationManager *)v8 isSupported];
      v12 = @"NO";
      if (v11) {
        v12 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "CoreRoutine's services supported, %@", buf, 0xCu);
    }
  }
  return v8;
}

- (BOOL)isLocationServicesEnabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F1E600] locationServicesEnabled:1];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = @"NO";
    if (v2) {
      v4 = @"YES";
    }
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "Location services enabled, %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

@end