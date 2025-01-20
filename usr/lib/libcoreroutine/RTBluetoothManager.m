@interface RTBluetoothManager
+ (BOOL)supportsNotificationName:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)carKitConnectionStateToString:(int64_t)a3;
- (void)_fetchCarKitConnectedStateWithHandler:(id)a3;
- (void)fetchCarKitConnectedStateWithHandler:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
@end

@implementation RTBluetoothManager

void __55__RTBluetoothManager_BluetoothManager_bluetoothManager__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F50B70];
  id v2 = [*(id *)(a1 + 32) queue];
  [v1 setSharedInstanceQueue:v2];
}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [*(id *)(a1 + 32) bluetoothManager];
  v4 = [v3 connectedDevices];
  v5 = [v2 setWithArray:v4];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v17 = [*(id *)(a1 + 32) connectedDevices];
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = [v17 count];
      _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%lu previously connected devices", buf, 0xCu);
    }
    v7 = [*(id *)(a1 + 32) connectedDevices];
    [v7 enumerateObjectsUsingBlock:&__block_literal_global_60];

    v8 = _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [v5 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%lu newly connected devices", buf, 0xCu);
    }

    [v5 enumerateObjectsUsingBlock:&__block_literal_global_7];
  }
  v9 = [*(id *)(a1 + 32) connectedDevices];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v11 = [*(id *)(a1 + 32) connectedDevices];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_8;
    v20[3] = &unk_1E6B97038;
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 32);
    id v21 = v12;
    uint64_t v22 = v13;
    [v11 enumerateObjectsUsingBlock:v20];
  }
  if ([v5 count])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_10;
    v19[3] = &unk_1E6B97060;
    v19[4] = *(void *)(a1 + 32);
    [v5 enumerateObjectsUsingBlock:v19];
  }
  [*(id *)(a1 + 32) setConnectedDevices:v5];
  v14 = *(void **)(a1 + 32);
  v15 = [v14 bluetoothManager];
  v16 = [v15 connectedDevices];
  [*(id *)(a1 + 32) setCarKitConnectionState:[v14 getCarKitConnectionStateFromConnectedDevices:v16]];
}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);
  }
}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);
  }
}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0 && objc_msgSend(v3, "type") == 17)
  {
    int v4 = _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "handsfree device disconnected, %@", (uint8_t *)&v9, 0xCu);
    }

    id v5 = [RTBluetoothManagerNotificationDisconnected alloc];
    uint64_t v6 = [v3 name];
    v7 = [v3 address];
    v8 = [(RTBluetoothManagerNotificationDisconnected *)v5 initWithDeviceName:v6 andDeviceAddress:v7];

    [*(id *)(a1 + 40) postNotification:v8];
  }
}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) connectedDevices];
  char v5 = [v4 containsObject:v3];

  if ((v5 & 1) == 0 && [v3 type] == 17)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "handsfree device connected, %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = [RTBluetoothManagerNotificationConnected alloc];
    v8 = [v3 name];
    int v9 = [v3 address];
    id v10 = [(RTBluetoothManagerNotificationConnected *)v7 initWithDeviceName:v8 andDeviceAddress:v9];

    [*(id *)(a1 + 32) postNotification:v10];
  }
}

BOOL __84__RTBluetoothManager_BluetoothManager_getCarKitConnectionStateFromConnectedDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 17;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[RTBluetoothManager allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RTBluetoothManager;
    return [super allocWithZone:a3];
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    char v5 = _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
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
    char v5 = _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
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
  if ([v3 isEqualToString:v4])
  {
    char v5 = 1;
  }
  else
  {
    int v6 = +[RTNotification notificationName];
    if ([v3 isEqualToString:v6])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = +[RTNotification notificationName];
      char v5 = [v3 isEqualToString:v7];
    }
  }

  return v5;
}

- (void)fetchCarKitConnectedStateWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [(RTNotifier *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__RTBluetoothManager_fetchCarKitConnectedStateWithHandler___block_invoke;
    v6[3] = &unk_1E6B90CE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __59__RTBluetoothManager_fetchCarKitConnectedStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCarKitConnectedStateWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchCarKitConnectedStateWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__RTBluetoothManager__fetchCarKitConnectedStateWithHandler___block_invoke;
    block[3] = &unk_1E6B90868;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __60__RTBluetoothManager__fetchCarKitConnectedStateWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)carKitConnectionStateToString:(int64_t)a3
{
  id v3 = @"unknown";
  if (a3 == 1) {
    id v3 = @"connected";
  }
  if (a3 == 2) {
    return @"disconnected";
  }
  else {
    return v3;
  }
}

@end