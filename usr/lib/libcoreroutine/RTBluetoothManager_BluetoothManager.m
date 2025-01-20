@interface RTBluetoothManager_BluetoothManager
- (BOOL)observingConnections;
- (BluetoothManager)bluetoothManager;
- (NSSet)connectedDevices;
- (int64_t)carKitConnectionState;
- (int64_t)getCarKitConnectionStateFromConnectedDevices:(id)a3;
- (void)_fetchCarKitConnectedStateWithHandler:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)dealloc;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)setCarKitConnectionState:(int64_t)a3;
- (void)setConnectedDevices:(id)a3;
- (void)setObservingConnections:(BOOL)a3;
- (void)shouldObserveConnections;
- (void)updateConnections;
@end

@implementation RTBluetoothManager_BluetoothManager

- (BluetoothManager)bluetoothManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTBluetoothManager_BluetoothManager_bluetoothManager__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  if (bluetoothManager_onceToken != -1) {
    dispatch_once(&bluetoothManager_onceToken, block);
  }
  v2 = [MEMORY[0x1E4F50B70] sharedInstance];

  return (BluetoothManager *)v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RTBluetoothManager_BluetoothManager;
  [(RTBluetoothManager_BluetoothManager *)&v4 dealloc];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v6 = a3;
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    v5 = v6;
  }
}

- (void)updateConnections
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setObservingConnections:(BOOL)a3
{
  if (self->_observingConnections != a3)
  {
    self->_observingConnections = a3;
    if (a3)
    {
      objc_super v4 = (void *)MEMORY[0x1E4F1CAD0];
      v5 = [(RTBluetoothManager_BluetoothManager *)self bluetoothManager];
      id v6 = [v5 connectedDevices];
      v7 = [v4 setWithArray:v6];
      [(RTBluetoothManager_BluetoothManager *)self setConnectedDevices:v7];

      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel_updateConnections name:*MEMORY[0x1E4F50B08] object:0];

      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel_updateConnections name:*MEMORY[0x1E4F50B18] object:0];

      id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 addObserver:self selector:sel_updateConnections name:*MEMORY[0x1E4F50AE8] object:0];
    }
    else
    {
      [(RTBluetoothManager_BluetoothManager *)self setConnectedDevices:0];
      [(RTBluetoothManager_BluetoothManager *)self setCarKitConnectionState:0];
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 removeObserver:self name:*MEMORY[0x1E4F50B08] object:0];

      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 removeObserver:self name:*MEMORY[0x1E4F50B18] object:0];

      id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 removeObserver:self name:*MEMORY[0x1E4F50AE8] object:0];
    }
  }
}

- (void)shouldObserveConnections
{
  v3 = +[RTNotification notificationName];
  if ([(RTNotifier *)self getNumberOfObservers:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = +[RTNotification notificationName];
    if ([(RTNotifier *)self getNumberOfObservers:v5])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = +[RTNotification notificationName];
      BOOL v4 = [(RTNotifier *)self getNumberOfObservers:v6] != 0;
    }
  }

  [(RTBluetoothManager_BluetoothManager *)self setObservingConnections:v4];
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTBluetoothManager_BluetoothManager;
  [(RTBluetoothManager *)&v11 internalAddObserver:a3 name:v6];
  v7 = +[RTNotification notificationName];
  if (([v6 isEqualToString:v7] & 1) == 0)
  {
    v8 = +[RTNotification notificationName];
    if (![v6 isEqualToString:v8])
    {
      v9 = +[RTNotification notificationName];
      char v10 = [v6 isEqualToString:v9];

      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  [(RTBluetoothManager_BluetoothManager *)self shouldObserveConnections];
LABEL_6:
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTBluetoothManager_BluetoothManager;
  [(RTBluetoothManager *)&v11 internalRemoveObserver:a3 name:v6];
  v7 = +[RTNotification notificationName];
  if (([v6 isEqualToString:v7] & 1) == 0)
  {
    v8 = +[RTNotification notificationName];
    if (![v6 isEqualToString:v8])
    {
      v9 = +[RTNotification notificationName];
      char v10 = [v6 isEqualToString:v9];

      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  [(RTBluetoothManager_BluetoothManager *)self shouldObserveConnections];
LABEL_6:
}

- (int64_t)getCarKitConnectionStateFromConnectedDevices:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  v5 = [v3 predicateWithBlock:&__block_literal_global_22];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  uint64_t v7 = [v6 count];
  if (v7) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = 2;
  }

  return v8;
}

- (void)_fetchCarKitConnectedStateWithHandler:(id)a3
{
  int64_t v8 = (void (**)(id, int64_t))a3;
  id v4 = [(RTBluetoothManager_BluetoothManager *)self bluetoothManager];

  if (v4)
  {
    v5 = [(RTBluetoothManager_BluetoothManager *)self bluetoothManager];
    id v6 = [v5 connectedDevices];
    int64_t v7 = [(RTBluetoothManager_BluetoothManager *)self getCarKitConnectionStateFromConnectedDevices:v6];
  }
  else
  {
    int64_t v7 = 0;
  }
  v8[2](v8, v7);
}

- (void)setCarKitConnectionState:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_carKitConnectionState != a3)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = +[RTBluetoothManager carKitConnectionStateToString:self->_carKitConnectionState];
      int64_t v7 = +[RTBluetoothManager carKitConnectionStateToString:a3];
      int v9 = 138412546;
      char v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "CarKit connection state changed from, %@, to, %@", (uint8_t *)&v9, 0x16u);
    }
    self->_carKitConnectionState = a3;
    int64_t v8 = [[RTBluetoothManagerNotificationCarKitConnectionStateChanged alloc] initWithCarKitConnectionState:self->_carKitConnectionState];
    [(RTNotifier *)self postNotification:v8];
  }
}

- (NSSet)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
}

- (BOOL)observingConnections
{
  return self->_observingConnections;
}

- (int64_t)carKitConnectionState
{
  return self->_carKitConnectionState;
}

- (void).cxx_destruct
{
}

@end