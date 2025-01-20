@interface PRBTRangingClientProxy
- (NSDictionary)clientInfo;
- (PRBTRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4;
- (PRRemoteDevice)beacon;
- (id).cxx_construct;
- (id)convertToString:(int)a3;
- (void)activate;
- (void)connectWithClientInfo:(id)a3;
- (void)dealloc;
- (void)deinitCompanion;
- (void)didFailWithError:(id)a3;
- (void)fetchTxPower:(id)a3 isUT:(id)a4 reply:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didCompleteAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didConnectDevice:(id)a4 error:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4;
- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didFetchTxPower:(id)a4 fromDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didObserveAdvertisementWithDate:(id)a4 address:(id)a5 advertisementData:(id)a6 status:(unsigned __int8)a7 rssi:(int64_t)a8 reserved:(id)a9 uuid:(id)a10 ownershipType:(unint64_t)a11 channel:(unint64_t)a12;
- (void)findMyAccessoryManager:(id)a3 didStartAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didStartUnauthorizedAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didStopAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5;
- (void)handleError:(id)a3;
- (void)informDelegateOwnerRangeStoppedonDevice:(id)a3;
- (void)setBeacon:(id)a3;
- (void)setCurrentTask:(int)a3;
- (void)setUUID:(id)a3;
- (void)startOwnerRanging:(id)a3 reply:(id)a4;
- (void)startUTRanging:(id)a3 reply:(id)a4;
- (void)stopOwnerRanging:(id)a3 reply:(id)a4;
- (void)stopUTRanging:(id)a3 reply:(id)a4;
- (void)terminate;
@end

@implementation PRBTRangingClientProxy

- (PRBTRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PRBTRangingClientProxy.mm", 80, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v21 = +[NSAssertionHandler currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PRBTRangingClientProxy.mm", 81, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)PRBTRangingClientProxy;
  v10 = [(PRBTRangingClientProxy *)&v23 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a4);
    beacon = v11->_beacon;
    v11->_beacon = 0;

    v11->_cleaningUponDidFail = 0;
    *(_WORD *)&v11->_utFinding = 1;
    v11->_ranging = 0;
    v11->_currentTask = 0;
    v13 = [[PRNSXPCConnection alloc] initWithConnection:v7];
    connWrapper = v11->_connWrapper;
    v11->_connWrapper = (PRBTRangingClientProtocol *)v13;

    v15 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#btranging-retry _accessoryManager initWithDelegate", buf, 2u);
    }
    v16 = (CLFindMyAccessoryManager *)[objc_alloc((Class)CLFindMyAccessoryManager) initWithDelegate:v11 delegateQueue:v11->_queue];
    accessoryManager = v11->_accessoryManager;
    v11->_accessoryManager = v16;
  }
  v18 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PRBTRangingClientProxy init", buf, 2u);
  }

  return v11;
}

- (void)dealloc
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRBTRangingClientProxy dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRBTRangingClientProxy;
  [(PRBTRangingClientProxy *)&v4 dealloc];
}

- (void)activate
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PRBTRangingClientProxy activate", v3, 2u);
  }
}

- (void)terminate
{
  if (self->_beacon)
  {
    v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      beacon = self->_beacon;
      int v6 = 138412290;
      id v7 = beacon;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down BT ranging session. Beacon: %@", (uint8_t *)&v6, 0xCu);
    }
    [(PRBTRangingClientProxy *)self deinitCompanion];
  }
  [(PRBTRangingClientProtocol *)self->_connWrapper invalidate];
  voucher = self->_clientVoucher.voucher;
  self->_clientVoucher.voucher = 0;
}

- (void)handleError:(id)a3
{
  id v4 = a3;
  [(PRBTRangingClientProxy *)self setCurrentTask:0];
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003FE80;
  v7[3] = &unk_100847020;
  id v6 = v4;
  id v8 = v6;
  [(PRBTRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry didFailWithError: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004005C;
  v8[3] = &unk_1008463A0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)deinitCompanion
{
  if (!self->_utFinding && self->_currentTask == 7)
  {
    v3 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(PRRemoteDevice *)self->_beacon UUID];
      id v5 = [v4 UUIDString];
      int v8 = 136315138;
      id v9 = [v5 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#btranging-retry command stopAggressiveAdvertising on device %s", (uint8_t *)&v8, 0xCu);
    }
    accessoryManager = self->_accessoryManager;
    id v7 = [(PRRemoteDevice *)self->_beacon UUID];
    [(CLFindMyAccessoryManager *)accessoryManager stopAggressiveAdvertisingOnDevice:v7];
  }
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  int v8 = (CLFindMyAccessoryManager *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10
    || self->_accessoryManager == v8
    && ([(PRRemoteDevice *)self->_beacon UUID],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v10 isEqual:v11],
        v11,
        (v12 & 1) != 0))
  {
    v13 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#btranging-retry _accessoryManager didFailWithError for %@ with error:%@", buf, 0x16u);
    }
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"Generic companion ranging error.";
    v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v15 = PRErrorWithCodeAndUserInfo(301, v14);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EB78();
    }
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100040488;
    v18[3] = &unk_1008463A0;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = v15;
    id v17 = v15;
    dispatch_async((dispatch_queue_t)queue, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (void)findMyAccessoryManager:(id)a3 didConnectDevice:(id)a4 error:(id)a5
{
  int v8 = (CLFindMyAccessoryManager *)a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v9 UUIDString];
    *(_DWORD *)buf = 136315394;
    id v21 = [v12 UTF8String];
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#btranging-retry _accessoryManager didConnectDevice %s with #error:%@", buf, 0x16u);
  }
  if (!v9
    || self->_accessoryManager == v8
    && ([(PRRemoteDevice *)self->_beacon UUID],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v9 isEqual:v13],
        v13,
        (v14 & 1) != 0))
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100040750;
    block[3] = &unk_100847070;
    objc_copyWeak(&v19, (id *)buf);
    id v17 = v9;
    id v18 = v10;
    dispatch_async((dispatch_queue_t)queue, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4
{
  id v6 = (CLFindMyAccessoryManager *)a3;
  id v7 = a4;
  if (!v7
    || self->_accessoryManager == v6
    && ([(PRRemoteDevice *)self->_beacon UUID],
        int v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v7 isEqual:v8],
        v8,
        (v9 & 1) != 0))
  {
    id v10 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 UUIDString];
      *(_DWORD *)buf = 136315138;
      id v17 = [v11 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#btranging-retry _accessoryManager didDisconnect device %s", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100040FC4;
    v13[3] = &unk_1008463A0;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v7;
    dispatch_async((dispatch_queue_t)queue, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)findMyAccessoryManager:(id)a3 didFetchTxPower:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
  id v10 = (CLFindMyAccessoryManager *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12
    || self->_accessoryManager == v10
    && ([(PRRemoteDevice *)self->_beacon UUID],
        id v14 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v15 = [v12 isEqual:v14],
        v14,
        (v15 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100041360;
    block[3] = &unk_1008470C0;
    objc_copyWeak(&v21, &location);
    id v18 = v12;
    id v19 = v11;
    id v20 = v13;
    dispatch_async((dispatch_queue_t)queue, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)findMyAccessoryManager:(id)a3 didStartUnauthorizedAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5
{
  int v8 = (CLFindMyAccessoryManager *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9
    || self->_accessoryManager == v8
    && ([(PRRemoteDevice *)self->_beacon UUID],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v9 isEqual:v11],
        v11,
        (v12 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000418E0;
    v14[3] = &unk_100847070;
    objc_copyWeak(&v17, &location);
    id v15 = v9;
    id v16 = v10;
    dispatch_async((dispatch_queue_t)queue, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)findMyAccessoryManager:(id)a3 didStartAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5
{
  int v8 = (CLFindMyAccessoryManager *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9
    || self->_accessoryManager == v8
    && ([(PRRemoteDevice *)self->_beacon UUID],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v9 isEqual:v11],
        v11,
        (v12 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100041D90;
    v14[3] = &unk_100847070;
    objc_copyWeak(&v17, &location);
    id v15 = v9;
    id v16 = v10;
    dispatch_async((dispatch_queue_t)queue, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)findMyAccessoryManager:(id)a3 didStopAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5
{
  int v8 = (CLFindMyAccessoryManager *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9
    || self->_accessoryManager == v8
    && ([(PRRemoteDevice *)self->_beacon UUID],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v9 isEqual:v11],
        v11,
        (v12 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004243C;
    v14[3] = &unk_100847070;
    objc_copyWeak(&v17, &location);
    id v15 = v9;
    id v16 = v10;
    dispatch_async((dispatch_queue_t)queue, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)findMyAccessoryManager:(id)a3 didCompleteAggressiveAdvertisingOnDevice:(id)a4 withError:(id)a5
{
  int v8 = (CLFindMyAccessoryManager *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9
    || self->_accessoryManager == v8
    && ([(PRRemoteDevice *)self->_beacon UUID],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v9 isEqual:v11],
        v11,
        (v12 & 1) != 0))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100042850;
    v14[3] = &unk_100847070;
    objc_copyWeak(&v17, &location);
    id v15 = v9;
    id v16 = v10;
    dispatch_async((dispatch_queue_t)queue, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)findMyAccessoryManager:(id)a3 didObserveAdvertisementWithDate:(id)a4 address:(id)a5 advertisementData:(id)a6 status:(unsigned __int8)a7 rssi:(int64_t)a8 reserved:(id)a9 uuid:(id)a10 ownershipType:(unint64_t)a11 channel:(unint64_t)a12
{
  id v17 = (CLFindMyAccessoryManager *)a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  id v22 = a10;
  if (v22)
  {
    if (self->_accessoryManager == v17)
    {
      id v23 = [(PRRemoteDevice *)self->_beacon UUID];
      unsigned __int8 v24 = [v22 isEqual:v23];

      if (v24)
      {
        __int16 v25 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [v22 UUIDString];
          *(_DWORD *)buf = 136315650;
          id v33 = [v26 UTF8String];
          __int16 v34 = 1024;
          int v35 = a8;
          __int16 v36 = 1024;
          int v37 = a12;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#btranging-retry didObserveAdvertisementWithDate for %s with rssi:%d channel:%d", buf, 0x18u);
        }
        id v27 = [objc_alloc((Class)PRBTRSSI) initWithTimeStamp:a8 rssi_dbm:a12 channel:sub_100006C38()];
        connWrapper = self->_connWrapper;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100042D8C;
        v30[3] = &unk_100847020;
        id v31 = v27;
        id v29 = v27;
        [(PRBTRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v30];
      }
    }
  }
}

- (void)informDelegateOwnerRangeStoppedonDevice:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042ECC;
  v7[3] = &unk_100847020;
  id v8 = v4;
  id v6 = v4;
  [(PRBTRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)connectWithClientInfo:(id)a3
{
  id v5 = a3;
  id v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 objectForKey:PRProcessNameKey];
    id v8 = [v5 objectForKey:PRProcessIdentifierKey];
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    unsigned int v12 = [v8 intValue];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRBTRanging: XPC connection created. Process name: %@, pid: %d", (uint8_t *)&v9, 0x12u);
  }
  objc_storeStrong((id *)&self->_clientInfo, a3);
  [(PRBTRangingClientProxy *)self activate];
}

- (void)fetchTxPower:(id)a3 isUT:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  self->_utFinding = [v9 BOOLValue];
  [(PRBTRangingClientProxy *)self setCurrentTask:1];
  [(PRBTRangingClientProxy *)self setUUID:v8];
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004325C;
  block[3] = &unk_1008463A0;
  objc_copyWeak(&v17, &location);
  id v12 = v8;
  id v16 = v12;
  dispatch_async((dispatch_queue_t)queue, block);
  id v13 = (OS_voucher *)voucher_copy();
  voucher = self->_clientVoucher.voucher;
  self->_clientVoucher.voucher = v13;

  v10[2](v10, 1, 0);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)startUTRanging:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  [(PRBTRangingClientProxy *)self setCurrentTask:2];
  self->_ranging = 1;
  [(PRBTRangingClientProxy *)self setUUID:v6];
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000434F0;
  block[3] = &unk_1008463A0;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  dispatch_async((dispatch_queue_t)queue, block);
  v7[2](v7, 1, 0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)stopUTRanging:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void))a4;
  [(PRBTRangingClientProxy *)self setCurrentTask:0];
  self->_ranging = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043774;
  v7[3] = &unk_1008460E8;
  objc_copyWeak(&v8, &location);
  dispatch_async((dispatch_queue_t)queue, v7);
  v5[2](v5, 1, 0);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)startOwnerRanging:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  [(PRBTRangingClientProxy *)self setCurrentTask:5];
  self->_ranging = 1;
  self->_utFinding = 0;
  [(PRBTRangingClientProxy *)self setUUID:v6];
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043974;
  block[3] = &unk_1008463A0;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  dispatch_async((dispatch_queue_t)queue, block);
  v7[2](v7, 1, 0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)stopOwnerRanging:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  [(PRBTRangingClientProxy *)self setCurrentTask:8];
  self->_ranging = 0;
  self->_utFinding = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043C34;
  block[3] = &unk_1008463A0;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  dispatch_async((dispatch_queue_t)queue, block);
  v7[2](v7, 1, 0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)setCurrentTask:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PRBTRangingClientProxy *)self convertToString:v3];
    int v7 = 136315138;
    id v8 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry setting current task: %s", (uint8_t *)&v7, 0xCu);
  }
  self->_currentTask = v3;
}

- (void)setUUID:(id)a3
{
  id v4 = a3;
  if (!self->_beacon)
  {
    id v5 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 UUIDString];
      int v9 = 136315138;
      id v10 = [v6 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry setting beacon to: %s", (uint8_t *)&v9, 0xCu);
    }
    int v7 = (PRRemoteDevice *)[objc_alloc((Class)PRRemoteDevice) initWithBeaconUUID:v4];
    beacon = self->_beacon;
    self->_beacon = v7;
  }
}

- (id)convertToString:(int)a3
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1008471C0 + a3);
  }
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (PRRemoteDevice)beacon
{
  return (PRRemoteDevice *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBeacon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beacon, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);

  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_startOptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connWrapper, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

@end