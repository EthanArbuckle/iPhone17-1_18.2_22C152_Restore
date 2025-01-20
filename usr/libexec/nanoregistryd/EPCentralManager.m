@interface EPCentralManager
- (CBCentralManager)manager;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
@end

@implementation EPCentralManager

- (CBCentralManager)manager
{
  v2 = [(EPCentralManager *)self managerManager];
  v3 = [v2 manager];

  return (CBCentralManager *)v3;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = sub_1000A3BC0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = sub_1000A3BC0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = +[EPPairingAgentManager stringFromCBManagerState:](EPPairingAgentManager, "stringFromCBManagerState:", [v4 state]);
      int v16 = 134218242;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Received centralManagerDidUpdateState: with %@", (uint8_t *)&v16, 0x16u);
    }
  }
  v9 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v10 = sub_1000A3BC0();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = sub_1000A3BC0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = +[EPPairingAgentManager stringFromCBManagerState:](EPPairingAgentManager, "stringFromCBManagerState:", [v4 state]);
        int v16 = 134218754;
        v17 = self;
        __int16 v18 = 2112;
        v19 = v14;
        __int16 v20 = 2048;
        v21 = v9;
        __int16 v22 = 2112;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Calling centralManagerDidUpdateState: on %@[%p] with %@", (uint8_t *)&v16, 0x2Au);
      }
    }
    [v9 centralManagerDidUpdateState:v4];
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_1000A3BC0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = sub_1000A3BC0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [v7 identifier];
      v12 = [v11 UUIDString];
      int v21 = 134218242;
      __int16 v22 = self;
      __int16 v23 = 2112;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Received central:didConnectPeripheral: with peripheral %@", (uint8_t *)&v21, 0x16u);
    }
  }
  v13 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v14 = sub_1000A3BC0();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      int v16 = sub_1000A3BC0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        __int16 v18 = NSStringFromClass(v17);
        v19 = [v7 identifier];
        __int16 v20 = [v19 UUIDString];
        int v21 = 134218754;
        __int16 v22 = self;
        __int16 v23 = 2112;
        v24 = v18;
        __int16 v25 = 2048;
        v26 = v13;
        __int16 v27 = 2112;
        v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Calling central:didConnectPeripheral: on %@[%p] with peripheral %@", (uint8_t *)&v21, 0x2Au);
      }
    }
    [v13 centralManager:v6 didConnectPeripheral:v7];
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = sub_1000A3BC0();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = sub_1000A3BC0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v9 identifier];
      BOOL v15 = [v14 UUIDString];
      int v24 = 134218498;
      __int16 v25 = self;
      __int16 v26 = 2112;
      __int16 v27 = v15;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Received central:didDisconnectPeripheral: with peripheral %@ with error %@", (uint8_t *)&v24, 0x20u);
    }
  }
  int v16 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v17 = sub_1000A3BC0();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      v19 = sub_1000A3BC0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = (objc_class *)objc_opt_class();
        int v21 = NSStringFromClass(v20);
        __int16 v22 = [v9 identifier];
        __int16 v23 = [v22 UUIDString];
        int v24 = 134219010;
        __int16 v25 = self;
        __int16 v26 = 2112;
        __int16 v27 = v21;
        __int16 v28 = 2048;
        id v29 = v16;
        __int16 v30 = 2112;
        v31 = v23;
        __int16 v32 = 2112;
        id v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Calling central:didDisconnectPeripheral: on %@[%p] with peripheral %@ with error %@", (uint8_t *)&v24, 0x34u);
      }
    }
    [v16 centralManager:v8 didDisconnectPeripheral:v9 error:v10];
  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000A3BC0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = sub_1000A3BC0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [v7 identifier];
      BOOL v12 = [v11 UUIDString];
      int v21 = 134218242;
      __int16 v22 = self;
      __int16 v23 = 2112;
      int v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Received central:didUpdatePeripheralConnectionState: with peripheral %@", (uint8_t *)&v21, 0x16u);
    }
  }
  v13 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v14 = sub_1000A3BC0();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      int v16 = sub_1000A3BC0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        BOOL v18 = NSStringFromClass(v17);
        v19 = [v7 identifier];
        __int16 v20 = [v19 UUIDString];
        int v21 = 134218754;
        __int16 v22 = self;
        __int16 v23 = 2112;
        int v24 = v18;
        __int16 v25 = 2048;
        __int16 v26 = v13;
        __int16 v27 = 2112;
        __int16 v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Calling central:didUpdatePeripheralConnectionState: on %@[%p] with peripheral %@", (uint8_t *)&v21, 0x2Au);
      }
    }
    [v13 centralManager:v6 didUpdatePeripheralConnectionState:v7];
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = sub_1000A3BC0();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = sub_1000A3BC0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v9 identifier];
      BOOL v15 = [v14 UUIDString];
      int v27 = 134218498;
      __int16 v28 = self;
      __int16 v29 = 2112;
      __int16 v30 = v15;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Received central:didFailToConnectPeripheral: with peripheral %@ with error %@", (uint8_t *)&v27, 0x20u);
    }
  }
  int v16 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v17 = sub_1000A3BC0();
    BOOL v18 = v17;
    if (v10)
    {
      BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (v19)
      {
        __int16 v20 = sub_1000A3BC0();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v21 = (objc_class *)objc_opt_class();
          __int16 v22 = NSStringFromClass(v21);
          __int16 v23 = [v9 identifier];
          int v24 = [v23 UUIDString];
          int v27 = 134219010;
          __int16 v28 = self;
          __int16 v29 = 2112;
          __int16 v30 = v22;
          __int16 v31 = 2048;
          id v32 = v16;
          __int16 v33 = 2112;
          v34 = v24;
          __int16 v35 = 2112;
          id v36 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "EPCentralManagerManager[%p]: Calling central:didFailToConnectPeripheral: on %@[%p] with peripheral %@ with error %@", (uint8_t *)&v27, 0x34u);
LABEL_13:

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v25 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        __int16 v20 = sub_1000A3BC0();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = (objc_class *)objc_opt_class();
          __int16 v22 = NSStringFromClass(v26);
          __int16 v23 = [v9 identifier];
          int v24 = [v23 UUIDString];
          int v27 = 134218754;
          __int16 v28 = self;
          __int16 v29 = 2112;
          __int16 v30 = v22;
          __int16 v31 = 2048;
          id v32 = v16;
          __int16 v33 = 2112;
          v34 = v24;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Calling central:didFailToConnectPeripheral: on %@[%p] with peripheral %@ with no error", (uint8_t *)&v27, 0x2Au);
          goto LABEL_13;
        }
LABEL_14:
      }
    }
    [v16 centralManager:v8 didFailToConnectPeripheral:v9 error:v10];
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v13 centralManager:v14 didDiscoverPeripheral:v10 advertisementData:v11 RSSI:v12];
  }
}

@end