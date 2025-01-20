@interface CLStarkManager
- (BOOL)checkVehicleConnectionStatus;
- (BOOL)isConnected;
- (CLStarkManager)init;
- (id)connectionUpdateHandler;
- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4;
- (void)accessoryManager:(id)a3 didDisconnectVehicleAccessory:(id)a4;
- (void)dealloc;
- (void)setConnectionUpdateHandler:(id)a3;
- (void)setIsConnected:(BOOL)a3;
@end

@implementation CLStarkManager

- (CLStarkManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)CLStarkManager;
  v2 = [(CLStarkManager *)&v9 init];
  if (v2)
  {
    Class v3 = off_102478F18();
    if (v3)
    {
      v4 = v3;
      if (qword_102418FD0 != -1) {
        dispatch_once(&qword_102418FD0, &stru_102328BF0);
      }
      v5 = qword_102418FD8;
      if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#fmc CarKit is available.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102418FD0 != -1) {
          dispatch_once(&qword_102418FD0, &stru_102328BF0);
        }
        v8 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStarkManager init]", "%s\n", v8);
        if (v8 != (char *)buf) {
          free(v8);
        }
      }
      v6 = (CRVehicleAccessoryManager *)objc_alloc_init(v4);
      v2->fAccessoryManager = v6;
      [(CRVehicleAccessoryManager *)v6 addObserver:v2];
      v2->_isConnected = [(CLStarkManager *)v2 checkVehicleConnectionStatus];
    }
  }
  return v2;
}

- (void)dealloc
{
  if ([(CLStarkManager *)self connectionUpdateHandler]) {

  }
  [(CRVehicleAccessoryManager *)self->fAccessoryManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CLStarkManager;
  [(CLStarkManager *)&v3 dealloc];
}

- (BOOL)checkVehicleConnectionStatus
{
  id v2 = [[-[CRVehicleAccessoryManager connectedVehicleAccessories](self->fAccessoryManager, "connectedVehicleAccessories") count];
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_102328BF0);
  }
  objc_super v3 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v7 = v2 != 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#fmc Vehicle connection status: %{public}d.", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_102328BF0);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStarkManager checkVehicleConnectionStatus]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  return v2 != 0;
}

- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4
{
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_102328BF0);
  }
  v6 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = [[objc_msgSend(a4, "vehicleName") UTF8String];
    __int16 v11 = 2080;
    id v12 = [[objc_msgSend(a4, "bluetoothAddress") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#fmc Vehicle connected: name, %s, address, %s.", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_102328BF0);
    }
    [objc_msgSend(a4, "vehicleName") UTF8String];
    [objc_msgSend(a4, "bluetoothAddress") UTF8String];
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStarkManager accessoryManager:didConnectVehicleAccessory:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (!self->_isConnected)
  {
    self->_isConnected = 1;
    if ([(CLStarkManager *)self connectionUpdateHandler])
    {
      BOOL v7 = [(CLStarkManager *)self connectionUpdateHandler];
      v7[2](v7, self->_isConnected, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"CarKit %@", [a4 vehicleName]), [a4 vehicleModelName], [a4 bluetoothAddress]);
    }
  }
}

- (void)accessoryManager:(id)a3 didDisconnectVehicleAccessory:(id)a4
{
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_102328BF0);
  }
  v6 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = [[[a4 vehicleName] UTF8String];
    __int16 v12 = 2080;
    id v13 = [[objc_msgSend(a4, "bluetoothAddress") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#fmc Vehicle disconnected: name, %s, address, %s.", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_102328BF0);
    }
    [objc_msgSend(a4, "vehicleName") UTF8String];
    [objc_msgSend(a4, "bluetoothAddress") UTF8String];
    objc_super v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStarkManager accessoryManager:didDisconnectVehicleAccessory:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  BOOL v7 = [(CLStarkManager *)self checkVehicleConnectionStatus];
  if (self->_isConnected != v7)
  {
    self->_isConnected = v7;
    if ([(CLStarkManager *)self connectionUpdateHandler])
    {
      v8 = [(CLStarkManager *)self connectionUpdateHandler];
      v8[2](v8, self->_isConnected, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"CarKit %@", [a4 vehicleName]), [a4 vehicleModelName], [a4 bluetoothAddress]);
    }
  }
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (id)connectionUpdateHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setConnectionUpdateHandler:(id)a3
{
}

@end