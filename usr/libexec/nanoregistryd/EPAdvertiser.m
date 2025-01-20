@interface EPAdvertiser
- (NSDictionary)devices;
- (void)advertiser:(id)a3 receivedData:(id)a4;
- (void)advertiser:(id)a3 receivedPairingRequestForDevice:(id)a4;
- (void)collection:(id)a3 deviceDidAppear:(id)a4;
- (void)collection:(id)a3 deviceDidDisappear:(id)a4;
@end

@implementation EPAdvertiser

- (NSDictionary)devices
{
  v2 = [(EPAdvertiser *)self manager];
  v3 = [v2 devicesDictionary];
  id v4 = [v3 copy];

  return (NSDictionary *)v4;
}

- (void)collection:(id)a3 deviceDidAppear:(id)a4
{
  id v5 = a4;
  v6 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v7 = sub_1000A3BC0();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      v9 = sub_1000A3BC0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        int v12 = 138412802;
        id v13 = v5;
        __int16 v14 = 2112;
        v15 = v11;
        __int16 v16 = 2048;
        v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling advertiser:deviceDidAppear: with device %@ on %@[%p]", (uint8_t *)&v12, 0x20u);
      }
    }
    [v6 advertiser:self deviceDidAppear:v5];
  }
}

- (void)collection:(id)a3 deviceDidDisappear:(id)a4
{
  id v5 = a4;
  v6 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v7 = sub_1000A3BC0();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      v9 = sub_1000A3BC0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        int v12 = 138412802;
        id v13 = v5;
        __int16 v14 = 2112;
        v15 = v11;
        __int16 v16 = 2048;
        v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling advertiser:deviceDidDisappear: with device %@ on %@[%p]", (uint8_t *)&v12, 0x20u);
      }
    }
    [v6 advertiser:self deviceDidDisappear:v5];
  }
}

- (void)advertiser:(id)a3 receivedPairingRequestForDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = sub_1000A3BC0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = sub_1000A3BC0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        int v14 = 138412802;
        id v15 = v7;
        __int16 v16 = 2112;
        v17 = v13;
        __int16 v18 = 2048;
        v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling advertiser:receivedPairingRequestForDevice: with device %@ on %@[%p]", (uint8_t *)&v14, 0x20u);
      }
    }
    [v8 advertiser:v6 receivedPairingRequestForDevice:v7];
  }
}

- (void)advertiser:(id)a3 receivedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = sub_1000A3BC0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = sub_1000A3BC0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        int v14 = 138412546;
        id v15 = v13;
        __int16 v16 = 2048;
        v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling advertiser:receivedData: on %@[%p]", (uint8_t *)&v14, 0x16u);
      }
    }
    [v8 advertiser:v6 receivedData:v7];
  }
}

@end