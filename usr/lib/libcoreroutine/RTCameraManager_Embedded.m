@interface RTCameraManager_Embedded
- (RTCameraManager_Embedded)init;
- (RTDarwinNotificationHelper)notificationHelper;
- (void)_handleCameraPowerNotification:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)dealloc;
- (void)handleCameraPowerNotification:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
@end

@implementation RTCameraManager_Embedded

- (void)_handleCameraPowerNotification:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(RTDarwinNotificationHelper *)self->_notificationHelper stateForNotificationName:v7] == 1;
  if ([v7 isEqualToString:@"com.apple.isp.frontcamerapower"]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v7 isEqualToString:@"com.apple.isp.backcamerapower"];
  }
  v6 = [[RTCameraManagerNotificationCameraPowerChanged alloc] initWithCameraType:v5 powerState:v4];
  if (v6) {
    [(RTNotifier *)self postNotification:v6];
  }
}

- (void)handleCameraPowerNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTCameraManager_Embedded_handleCameraPowerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (RTCameraManager_Embedded)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTCameraManager_Embedded;
  v2 = [(RTNotifier *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    notificationHelper = v2->_notificationHelper;
    v2->_notificationHelper = (RTDarwinNotificationHelper *)v3;
  }
  return v2;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserverForNotificationName:@"com.apple.isp.frontcamerapower"];
  [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserverForNotificationName:@"com.apple.isp.backcamerapower"];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)dealloc
{
  [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserverForNotificationName:@"com.apple.isp.frontcamerapower"];
  [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserverForNotificationName:@"com.apple.isp.backcamerapower"];
  v3.receiver = self;
  v3.super_class = (Class)RTCameraManager_Embedded;
  [(RTCameraManager_Embedded *)&v3 dealloc];
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    if ([(RTNotifier *)self getNumberOfObservers:v7] == 1)
    {
      objc_initWeak(location, self);
      notificationHelper = self->_notificationHelper;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __53__RTCameraManager_Embedded_internalAddObserver_name___block_invoke;
      v20[3] = &unk_1E6B91900;
      objc_copyWeak(&v21, location);
      [(RTDarwinNotificationHelper *)notificationHelper addObserverForNotificationName:@"com.apple.isp.frontcamerapower" handler:v20];
      v11 = self->_notificationHelper;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __53__RTCameraManager_Embedded_internalAddObserver_name___block_invoke_2;
      v18 = &unk_1E6B91900;
      objc_copyWeak(&v19, location);
      [(RTDarwinNotificationHelper *)v11 addObserverForNotificationName:@"com.apple.isp.backcamerapower" handler:&v15];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(location);
    }
    BOOL v13 = -[RTDarwinNotificationHelper stateForNotificationName:](self->_notificationHelper, "stateForNotificationName:", v7, v15, v16, v17, v18) == 1;
    if ([v7 isEqualToString:@"com.apple.isp.frontcamerapower"]) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = [v7 isEqualToString:@"com.apple.isp.backcamerapower"];
    }
    v12 = [[RTCameraManagerNotificationCameraPowerChanged alloc] initWithCameraType:v14 powerState:v13];
    if (v12) {
      [(RTNotifier *)self postNotification:v12 toObserver:v6];
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityCamera);
    v12 = (RTCameraManagerNotificationCameraPowerChanged *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v7;
      _os_log_error_impl(&dword_1D9BFA000, &v12->super.super, OS_LOG_TYPE_ERROR, "Unsupported notification %@", (uint8_t *)location, 0xCu);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if (![(RTNotifier *)self getNumberOfObservers:v5])
    {
      [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserverForNotificationName:@"com.apple.isp.frontcamerapower"];
      [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserverForNotificationName:@"com.apple.isp.backcamerapower"];
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityCamera);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Unsupported notification %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void).cxx_destruct
{
}

@end