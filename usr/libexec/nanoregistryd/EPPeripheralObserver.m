@interface EPPeripheralObserver
- (CBPeripheral)peripheral;
- (id)newConnectorWithDelegate:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation EPPeripheralObserver

- (CBPeripheral)peripheral
{
  v2 = [(EPResource *)self resourceManager];
  v3 = [v2 peripheral];

  return (CBPeripheral *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (id)newConnectorWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(EPResource *)self resourceManager];
  id v6 = [v5 newConnectorWithDelegate:v4];

  return v6;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = sub_1000A3BC0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = sub_1000A3BC0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        int v14 = 138412546;
        v15 = v13;
        __int16 v16 = 2048;
        v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling peripheral:didDiscoverServices: on %@[%p]", (uint8_t *)&v14, 0x16u);
      }
    }
    [v8 peripheral:v6 didDiscoverServices:v7];
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v12 = sub_1000A3BC0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      int v14 = sub_1000A3BC0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        __int16 v16 = NSStringFromClass(v15);
        int v17 = 138412546;
        v18 = v16;
        __int16 v19 = 2048;
        v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling peripheral:didDiscoverCharacteristicsForService:error: on %@[%p]", (uint8_t *)&v17, 0x16u);
      }
    }
    [v11 peripheral:v8 didDiscoverCharacteristicsForService:v9 error:v10];
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v12 = sub_1000A3BC0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      int v14 = sub_1000A3BC0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        __int16 v16 = NSStringFromClass(v15);
        int v17 = 138412546;
        v18 = v16;
        __int16 v19 = 2048;
        v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling peripheral:didWriteValueForCharacteristic:error: on %@[%p]", (uint8_t *)&v17, 0x16u);
      }
    }
    [v11 peripheral:v8 didWriteValueForCharacteristic:v9 error:v10];
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v12 = sub_1000A3BC0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      int v14 = sub_1000A3BC0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        __int16 v16 = NSStringFromClass(v15);
        int v17 = 138412546;
        v18 = v16;
        __int16 v19 = 2048;
        v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling peripheral:didUpdateValueForCharacteristic:error: on %@[%p]", (uint8_t *)&v17, 0x16u);
      }
    }
    [v11 peripheral:v8 didUpdateValueForCharacteristic:v9 error:v10];
  }
}

@end