@interface Browse_WirelessProximity
- (Browse_WirelessProximity)initWithQueue:(id)a3;
- (void)_entityResolved:(id)a3;
- (void)cancel;
- (void)deviceScannerDidUpdateState:(id)a3;
- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5;
- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5;
- (void)start;
@end

@implementation Browse_WirelessProximity

- (Browse_WirelessProximity)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)Browse_WirelessProximity;
  v6 = [(Browse_WirelessProximity *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = objc_opt_new();
    beaconToEntityMap = v7->_beaconToEntityMap;
    v7->_beaconToEntityMap = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)start
{
  if (+[PKDefaults airPrintBeaconDiscoveryAllowed])
  {
    v3 = (WPDeviceScanner *)[objc_alloc(off_1000C8738()) initWithDelegate:self queue:self->_queue];
    scanner = self->_scanner;
    self->_scanner = v3;

    id v5 = self->_scanner;
    [(WPDeviceScanner *)v5 registerForDevicesMatching:&off_1000B90B8 options:0];
  }
}

- (void)cancel
{
  scanner = self->_scanner;
  if (scanner)
  {
    [(WPDeviceScanner *)scanner unregisterAllDeviceChanges];
    [(WPDeviceScanner *)self->_scanner invalidate];
    v4 = self->_scanner;
    self->_scanner = 0;
  }
}

- (void)deviceScannerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412802;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    __int16 v10 = 2048;
    id v11 = [v4 state];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ scanner %@ state: %ld", (uint8_t *)&v6, 0x20u);
  }
}

- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138413058;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2048;
    id v15 = [v7 state];
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ didFailToRegisterDevices scanner %@ state: %ld error %@", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = [(NSMutableDictionary *)self->_beaconToEntityMap objectForKey:v7];
  if (v9)
  {
    int v10 = [v8 objectForKeyedSubscript:@"kPuckID"];
    id v11 = [v8 objectForKeyedSubscript:@"kPuckRSSI"];
    [v9 updateWithPuckID:v10 rssi:v11];
  }
  else
  {
    __int16 v12 = [WPBrowse_Entity alloc];
    id v13 = [v8 objectForKeyedSubscript:@"kPuckID"];
    __int16 v14 = [v8 objectForKeyedSubscript:@"kPuckAirPrintData"];
    id v15 = [v8 objectForKeyedSubscript:@"kPuckRSSI"];
    __int16 v16 = [(WPBrowse_Entity *)v12 initWithPuckID:v13 airPrintData:v14 rssi:v15];

    if (v16)
    {
      [(NSMutableDictionary *)self->_beaconToEntityMap setObject:v16 forKey:v7];
      objc_initWeak((id *)location, self);
      id v17 = self->_queue;
      v18 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003A3B8;
      block[3] = &unk_1000A2B00;
      v22 = v16;
      v23 = v17;
      v19 = v17;
      objc_copyWeak(&v24, (id *)location);
      dispatch_async(v18, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v20 = _PKLogCategory(PKLogCategoryDiscovery[0]);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 138412547;
        *(void *)&location[4] = self;
        __int16 v26 = 2113;
        id v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ not creating browse entity for device with data %{private}@", location, 0x16u);
      }
    }
  }
}

- (void)_entityResolved:(id)a3
{
  id v4 = a3;
  id v5 = [v4 txtRecordDictionary];

  if (v5)
  {
    int v6 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resolved %@, adding to found printer list", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v7 = [(Browse_Implementation *)self addEntity];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v4);
  }
  else
  {
    uint64_t v7 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Couldn't reach %@, not adding", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconToEntityMap, 0);
  objc_storeStrong((id *)&self->_scanner, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end