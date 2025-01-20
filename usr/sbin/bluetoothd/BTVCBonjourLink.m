@interface BTVCBonjourLink
- (BTVCBonjourLink)init;
- (BTVCBonjourLink)initWithDelegate:(id)a3 queue:(id)a4;
- (int64_t)state;
- (void)_listenForBTVCBonjourEvents;
- (void)connectToPeer:(id)a3 withOptions:(id)a4;
- (void)disconnectFromPeer:(id)a3;
- (void)invalidate;
- (void)sendData:(id)a3 toPeer:(id)a4;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4;
- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10 useCaseList:(id)a11;
- (void)stopAdvertisingOfType:(int64_t)a3;
- (void)stopScanningForType:(int64_t)a3;
@end

@implementation BTVCBonjourLink

- (BTVCBonjourLink)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BTVCBonjourLink;
  v9 = [(BTVCBonjourLink *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_dispatch_queue, a4);
    v11 = [[BTVCBonjourService alloc] initWithQueue:v8];
    btvcBonjourService = v10->_btvcBonjourService;
    v10->_btvcBonjourService = v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
    advertiserTypesAdvData = v10->_advertiserTypesAdvData;
    v10->_advertiserTypesAdvData = (NSMutableDictionary *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    scannerTypesToScan = v10->_scannerTypesToScan;
    v10->_scannerTypesToScan = v15;

    v10->_state = 3;
    [(BTVCBonjourLink *)v10 _listenForBTVCBonjourEvents];
  }

  return v10;
}

- (BTVCBonjourLink)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  +[NSException raise:NSGenericException, @"%@ is not a valid initializer for %@", v3, v5 format];

  return 0;
}

- (void)invalidate
{
  v3 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] Invalidate by client", v5, 2u);
  }
  delegate = self->_delegate;
  self->_delegate = 0;
}

- (void)_listenForBTVCBonjourEvents
{
  id location = 0;
  objc_initWeak(&location, self);
  v3 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] _listenForBTVCBonjourEvents\n", buf, 2u);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1005C6EA8;
  v16[3] = &unk_1009B84C8;
  objc_copyWeak(&v17, &location);
  [(BTVCBonjourService *)self->_btvcBonjourService setDeviceDidStartScanning:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1005C6FB8;
  v14[3] = &unk_1009B8518;
  objc_copyWeak(&v15, &location);
  [(BTVCBonjourService *)self->_btvcBonjourService setDeviceFoundHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005C7258;
  v12[3] = &unk_1009B8518;
  objc_copyWeak(&v13, &location);
  [(BTVCBonjourService *)self->_btvcBonjourService setDeviceLostHandler:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005C74C8;
  v10[3] = &unk_1009B8568;
  objc_copyWeak(&v11, &location);
  [(BTVCBonjourService *)self->_btvcBonjourService setAdvertisingStateUpdateHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005C7724;
  v8[3] = &unk_1009B8590;
  objc_copyWeak(&v9, &location);
  [(BTVCBonjourService *)self->_btvcBonjourService setDeviceDidConnectHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005C7858;
  v6[3] = &unk_1009B85B8;
  objc_copyWeak(&v7, &location);
  [(BTVCBonjourService *)self->_btvcBonjourService setDeviceDidDisconnectHandler:v6];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005C7968;
  v4[3] = &unk_1009B85E0;
  objc_copyWeak(&v5, &location);
  [(BTVCBonjourService *)self->_btvcBonjourService setDeviceDidReceiveDataHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4
{
  id v6 = a4;
  id v7 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[BTVCBonjourLink startAdvertisingOfType:withData:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v22 = (const char *)a3;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] startAdvertisingOfType %ld with data %@\n", buf, 0x16u);
  }
  advertiserTypesAdvData = v8->_advertiserTypesAdvData;
  id v11 = +[NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)advertiserTypesAdvData setObject:v6 forKeyedSubscript:v11];

  id location = 0;
  objc_initWeak(&location, v8);
  v19[0] = @"BTVCBonjourLinkType";
  v12 = +[NSNumber numberWithInteger:a3];
  v19[1] = @"BTVCBonjourPayloadKey";
  v20[0] = v12;
  v20[1] = v6;
  id v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  v14 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[BTVCBonjourLink startAdvertisingOfType:withData:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] %s _btvcBonjourService startAdvertisingWithData", buf, 0xCu);
  }
  btvcBonjourService = v8->_btvcBonjourService;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1005C7D9C;
  v16[3] = &unk_1009B8608;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a3;
  [(BTVCBonjourService *)btvcBonjourService startAdvertisingWithData:v13 completionHandler:v16];
  objc_destroyWeak(v17);

  objc_destroyWeak(&location);
  objc_sync_exit(v8);
}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  id v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BTVCBonjourLink stopAdvertisingOfType:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  id v6 = self;
  objc_sync_enter(v6);
  advertiserTypesAdvData = v6->_advertiserTypesAdvData;
  id v8 = +[NSNumber numberWithInteger:a3];
  id v9 = [(NSMutableDictionary *)advertiserTypesAdvData objectForKeyedSubscript:v8];
  LODWORD(advertiserTypesAdvData) = v9 == 0;

  v10 = qword_100A19FE8;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT);
  if (advertiserTypesAdvData)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] No Advertising for type %ld, not stopping anything!\n", buf, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] stopAdvertisingOfType %ld", buf, 0xCu);
    }
    v22[0] = @"BTVCBonjourLinkType";
    v12 = +[NSNumber numberWithInteger:a3];
    v22[1] = @"BTVCBonjourPayloadKey";
    v23[0] = v12;
    id v13 = v6->_advertiserTypesAdvData;
    v14 = +[NSNumber numberWithInteger:a3];
    id v15 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v14];
    v23[1] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    id v17 = v6->_advertiserTypesAdvData;
    objc_super v18 = +[NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v17 removeObjectForKey:v18];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, v6);
    btvcBonjourService = v6->_btvcBonjourService;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_1005C819C;
    v20[3] = &unk_1009B8608;
    objc_copyWeak(v21, (id *)buf);
    v21[1] = (id)a3;
    [(BTVCBonjourService *)btvcBonjourService stopAdvertisingForData:v16 completionHandler:v20];
    objc_destroyWeak(v21);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v6);
}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10 useCaseList:(id)a11
{
  id v29 = a4;
  id v31 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a11;
  v20 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[BTVCBonjourLink startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
  }
  v21 = self;
  objc_sync_enter(v21);
  v22 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] startScanningForType 1\n", buf, 2u);
  }
  CFStringRef v32 = @"scanMode";
  __int16 v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a7, v29);
  v33 = v23;
  id v24 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  v25 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] startScanningForType _scannerTypesToScan\n", buf, 2u);
  }
  scannerTypesToScan = v21->_scannerTypesToScan;
  v27 = +[NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)scannerTypesToScan setObject:v24 forKey:v27];

  v28 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = (const char *)a3;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] [Discovery] starting for type %ld\n", buf, 0xCu);
  }
  [(BTVCBonjourService *)v21->_btvcBonjourService startDiscovery];

  objc_sync_exit(v21);
}

- (void)stopScanningForType:(int64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  id v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    int64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] [Discovery] stopping for type %ld\n", (uint8_t *)&v11, 0xCu);
  }
  scannerTypesToScan = v4->_scannerTypesToScan;
  id v7 = +[NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)scannerTypesToScan removeObjectForKey:v7];

  id v8 = [(NSMutableDictionary *)v4->_scannerTypesToScan allKeys];
  BOOL v9 = [v8 count] == 0;

  btvcBonjourService = v4->_btvcBonjourService;
  if (v9) {
    [(BTVCBonjourService *)btvcBonjourService stopDiscovery];
  }
  else {
    [(BTVCBonjourService *)btvcBonjourService startDiscovery];
  }
  objc_sync_exit(v4);
}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] Connecting to peer %@", (uint8_t *)&v7, 0xCu);
  }
  [(BTVCBonjourService *)self->_btvcBonjourService connectToDevice:v5];
}

- (void)disconnectFromPeer:(id)a3
{
  id v4 = a3;
  id v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourLink] Disconnecting from peer %@", (uint8_t *)&v6, 0xCu);
  }
  [(BTVCBonjourService *)self->_btvcBonjourService disconnectFromDevice:v4];
}

- (void)sendData:(id)a3 toPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  btvcBonjourService = self->_btvcBonjourService;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005C8950;
  v11[3] = &unk_1009B8630;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(BTVCBonjourService *)btvcBonjourService sendData:v10 toDevice:v9 completionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_dispatch_queue, 0);
  objc_storeStrong((id *)&self->_scannerTypesToScan, 0);
  objc_storeStrong((id *)&self->_advertiserTypesAdvData, 0);

  objc_storeStrong((id *)&self->_btvcBonjourService, 0);
}

@end