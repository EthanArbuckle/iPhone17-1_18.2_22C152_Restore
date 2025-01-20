@interface CRWirelessPairingServiceSession
- (BOOL)isActive;
- (BOOL)isPairingAvailable;
- (BTDeviceImpl)_remoteDeviceFromSession:(BTSessionImpl *)a3;
- (BTLocalDeviceImpl)_localDeviceForSession:(BTSessionImpl *)a3;
- (CRBluetoothManager)bluetoothManager;
- (CRCarPlayPreferences)carPlayPreferences;
- (CRWirelessPairingServiceSession)initWithBluetoothManager:(id)a3 preferences:(id)a4;
- (CRWirelessPairingServiceSessionDelegate)delegate;
- (NSData)bluetoothAddress;
- (NSString)keyIdentifier;
- (NSTimer)connectionTimer;
- (OS_dispatch_queue)sessionQueue;
- (OS_dispatch_semaphore)waitingOnSession;
- (OS_os_transaction)sessionTransaction;
- (id)_addressStringForDevice:(BTDeviceImpl *)a3;
- (id)_localDeviceAddressFromSession:(BTSessionImpl *)a3;
- (id)bluetoothConnectedHandler;
- (id)localOOBDataHandler;
- (id)promptResponseHandler;
- (id)sessionDetachHandler;
- (unint64_t)intent;
- (unsigned)_intendedServiceMask;
- (void)_mainQueue_blockSessionQueue;
- (void)_mainQueue_connectDevice:(BTDeviceImpl *)a3 session:(BTSessionImpl *)a4 completion:(id)a5;
- (void)_mainQueue_delegateDidFinishWithResult:(unint64_t)a3 error:(id)a4;
- (void)_mainQueue_handleDidConnectDevice:(BTDeviceImpl *)a3 service:(unsigned int)a4;
- (void)_mainQueue_handleEvent:(int)a3 forSession:(BTSessionImpl *)a4;
- (void)_mainQueue_handleLocalOOBDataC192:(char *)a3 r192:(char *)a4 c256:(char *)a5 r256:(char *)a6;
- (void)_mainQueue_invalidateSession;
- (void)_mainQueue_performWithPairingAgent:(id)a3;
- (void)_mainQueue_performWithSession:(id)a3;
- (void)_mainQueue_requestLocalOOBDataWithCompletion:(id)a3 errorHandler:(id)a4;
- (void)_mainQueue_unblockSessionQueue;
- (void)cancelPairing;
- (void)handlePairingPromptResponse:(BOOL)a3;
- (void)initializeForVehicleAddress:(id)a3 keyIdentifier:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)requestPairingForIntent:(unint64_t)a3 completion:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setBluetoothAddress:(id)a3;
- (void)setBluetoothConnectedHandler:(id)a3;
- (void)setConnectionTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setLocalOOBDataHandler:(id)a3;
- (void)setPromptResponseHandler:(id)a3;
- (void)setSessionDetachHandler:(id)a3;
- (void)setSessionTransaction:(id)a3;
- (void)setWaitingOnSession:(id)a3;
- (void)setupVehicleDataC192:(id)a3 r192:(id)a4 c256:(id)a5 r256:(id)a6 completion:(id)a7;
@end

@implementation CRWirelessPairingServiceSession

- (CRWirelessPairingServiceSession)initWithBluetoothManager:(id)a3 preferences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CRWirelessPairingServiceSession;
  v9 = [(CRWirelessPairingServiceSession *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_intent = 0;
    v9->_btSession = 0;
    v9->_pairingAgent = 0;
    v9->_active = 0;
    objc_storeStrong((id *)&v9->_bluetoothManager, a3);
    objc_storeStrong((id *)&v10->_carPlayPreferences, a4);
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.carkit.pairing.btSession", v11);
    sessionQueue = v10->_sessionQueue;
    v10->_sessionQueue = (OS_dispatch_queue *)v12;

    sessionTransaction = v10->_sessionTransaction;
    v10->_sessionTransaction = 0;

    connectionTimer = v10->_connectionTimer;
    v10->_connectionTimer = 0;

    bluetoothAddress = v10->_bluetoothAddress;
    v10->_bluetoothAddress = 0;

    id promptResponseHandler = v10->_promptResponseHandler;
    v10->_id promptResponseHandler = 0;

    id localOOBDataHandler = v10->_localOOBDataHandler;
    v10->_id localOOBDataHandler = 0;

    id bluetoothConnectedHandler = v10->_bluetoothConnectedHandler;
    v10->_id bluetoothConnectedHandler = 0;

    id sessionDetachHandler = v10->_sessionDetachHandler;
    v10->_id sessionDetachHandler = 0;
  }
  return v10;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100074570();
  }

  [(CRWirelessPairingServiceSession *)self _mainQueue_invalidateSession];
}

- (BOOL)isPairingAvailable
{
  v2 = [(CRWirelessPairingServiceSession *)self carPlayPreferences];
  unsigned __int8 v3 = [v2 isCarPlayAllowed];

  if ((v3 & 1) == 0)
  {
    v4 = CarPairingLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000745A4();
    }
  }
  return v3;
}

- (void)handlePairingPromptResponse:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = [(CRWirelessPairingServiceSession *)self promptResponseHandler];
  if (v5)
  {
    v6 = CarPairingLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"NO";
      if (v3) {
        CFStringRef v7 = @"YES";
      }
      int v11 = 138543362;
      CFStringRef v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "handlePairingPromptResponse %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v5[2](v5, v3);
    [(CRWirelessPairingServiceSession *)self setPromptResponseHandler:0];
    id v8 = +[CARAnalytics sharedInstance];
    v9 = v8;
    if (v3) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    [v8 setCarKeyPairingResult:v10];
  }
}

- (void)initializeForVehicleAddress:(id)a3 keyIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044A38;
  block[3] = &unk_1000BE930;
  objc_copyWeak(&v18, &location);
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)requestPairingForIntent:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100044C18;
  v8[3] = &unk_1000BE9A8;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)setupVehicleDataC192:(id)a3 r192:(id)a4 c256:(id)a5 r256:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045674;
  block[3] = &unk_1000BEA48;
  objc_copyWeak(&v28, &location);
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)cancelPairing
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100045DD4;
  v2[3] = &unk_1000BD740;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
  if (a3)
  {
    id v4 = (id)os_transaction_create();
    [(CRWirelessPairingServiceSession *)self setSessionTransaction:v4];
  }
  else
  {
    [(CRWirelessPairingServiceSession *)self setSessionTransaction:0];
  }
}

- (BTLocalDeviceImpl)_localDeviceForSession:(BTSessionImpl *)a3
{
  if (!BTLocalDeviceGetDefault()) {
    return 0;
  }
  id v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100074920();
  }

  return 0;
}

- (id)_localDeviceAddressFromSession:(BTSessionImpl *)a3
{
  id v3 = [(CRWirelessPairingServiceSession *)self _localDeviceForSession:a3];
  if (v3)
  {
    if (BTLocalDeviceGetAddressString())
    {
      id v4 = CarPairingLogging();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1000749BC();
      }
LABEL_8:

      id v3 = 0;
      goto LABEL_9;
    }
    __int16 v7 = 0;
    int v6 = 0;
    if (BTDeviceAddressFromString())
    {
      id v4 = CarPairingLogging();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100074954();
      }
      goto LABEL_8;
    }
    id v3 = +[NSData dataWithBytes:&v6 length:6];
  }
LABEL_9:

  return v3;
}

- (BTDeviceImpl)_remoteDeviceFromSession:(BTSessionImpl *)a3
{
  id v4 = [(CRWirelessPairingServiceSession *)self bluetoothAddress];

  if (!v4) {
    return 0;
  }
  __int16 v9 = 0;
  int v8 = 0;
  v5 = [(CRWirelessPairingServiceSession *)self bluetoothAddress];
  [v5 getBytes:&v8 length:6];

  if (BTDeviceFromAddress())
  {
    int v6 = CarPairingLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100074A24();
    }

    return 0;
  }
  return 0;
}

- (id)_addressStringForDevice:(BTDeviceImpl *)a3
{
  memset(v5, 0, sizeof(v5));
  if (BTDeviceGetAddressString())
  {
    id v3 = 0;
  }
  else
  {
    id v3 = +[NSString stringWithUTF8String:v5];
  }

  return v3;
}

- (unsigned)_intendedServiceMask
{
  if ((id)[(CRWirelessPairingServiceSession *)self intent] == (id)2) {
    return 128;
  }
  else {
    return -1;
  }
}

- (void)_mainQueue_performWithSession:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!self->_btSession)
  {
    id location = sub_1000465C0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    [(CRWirelessPairingServiceSession *)self setWaitingOnSession:v5];

    int v6 = BTSessionAttachWithQueue();
    if (v6)
    {
      __int16 v7 = CarPairingLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100074A8C();
      }
    }
    else
    {
      [(CRWirelessPairingServiceSession *)self _mainQueue_blockSessionQueue];
    }
  }
  objc_initWeak(&location, self);
  int v8 = [(CRWirelessPairingServiceSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046684;
  block[3] = &unk_1000BD7B8;
  objc_copyWeak(&v12, &location);
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_mainQueue_blockSessionQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [(CRWirelessPairingServiceSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004682C;
  block[3] = &unk_1000BD1B0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_mainQueue_unblockSessionQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100074AF4();
  }

  id v4 = [(CRWirelessPairingServiceSession *)self waitingOnSession];
  dispatch_semaphore_signal(v4);
}

- (void)_mainQueue_invalidateSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [(CRWirelessPairingServiceSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046994;
  block[3] = &unk_1000BD1B0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_mainQueue_handleEvent:(int)a3 forSession:(BTSessionImpl *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ((a3 - 1) >= 3)
  {
    if (a3) {
      return;
    }
    id v11 = CarPairingLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100074B90();
    }

    self->_btSession = a4;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100046D84;
    v12[3] = &unk_1000BD1B0;
    v12[4] = self;
    id v10 = self;
    [(CRWirelessPairingServiceSession *)v10 setSessionDetachHandler:v12];
    [(CRWirelessPairingServiceSession *)v10 _mainQueue_unblockSessionQueue];
    goto LABEL_12;
  }
  __int16 v7 = CarPairingLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100074BF8();
  }

  int v8 = [(CRWirelessPairingServiceSession *)self sessionDetachHandler];

  if (v8)
  {
    id v9 = CarPairingLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100074BC4();
    }

    id v10 = [(CRWirelessPairingServiceSession *)self sessionDetachHandler];
    ((void (*)(void))v10->_pairingAgent)();
LABEL_12:
  }
}

- (void)_mainQueue_performWithPairingAgent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100046ECC;
  v6[3] = &unk_1000BEA98;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(CRWirelessPairingServiceSession *)self _mainQueue_performWithSession:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_mainQueue_requestLocalOOBDataWithCompletion:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v10[2] = sub_100047178;
  v10[3] = &unk_1000BEAE8;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  [(CRWirelessPairingServiceSession *)self _mainQueue_performWithPairingAgent:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_mainQueue_handleLocalOOBDataC192:(char *)a3 r192:(char *)a4 c256:(char *)a5 r256:(char *)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v16 = +[NSData dataWithBytes:a3 length:16];
  id v11 = +[NSData dataWithBytes:a4 length:16];
  id v12 = +[NSData dataWithBytes:a5 length:16];
  id v13 = +[NSData dataWithBytes:a6 length:16];
  id v14 = [(CRWirelessPairingServiceSession *)self localOOBDataHandler];

  if (v14)
  {
    id v15 = [(CRWirelessPairingServiceSession *)self localOOBDataHandler];
    ((void (**)(void, id, void *, void *, void *))v15)[2](v15, v16, v11, v12, v13);

    [(CRWirelessPairingServiceSession *)self setLocalOOBDataHandler:0];
  }
}

- (void)_mainQueue_connectDevice:(BTDeviceImpl *)a3 session:(BTSessionImpl *)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unsigned int v8 = [(CRWirelessPairingServiceSession *)self _intendedServiceMask];
  if (BTServiceAddCallbacks())
  {
    id v9 = CarPairingLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100074D30();
    }

    if (v7) {
LABEL_5:
    }
      v7[2](v7, 0);
  }
  else
  {
    BOOL v10 = BTDeviceConnectServices() == 0;
    id v11 = CarPairingLogging();
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "started connecting BT using OOB pairing data, service mask: %u", (uint8_t *)&buf, 8u);
      }

      objc_initWeak(&buf, self);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100047754;
      v20[3] = &unk_1000BEB10;
      objc_copyWeak(v22, &buf);
      v22[1] = a4;
      id v21 = v7;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100047810;
      v18[3] = &unk_1000BD640;
      id v13 = objc_retainBlock(v20);
      id v19 = v13;
      [(CRWirelessPairingServiceSession *)self setBluetoothConnectedHandler:v18];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100047890;
      v16[3] = &unk_1000BEB38;
      id v14 = v13;
      id v17 = v14;
      id v15 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v16 block:30.0];
      [(CRWirelessPairingServiceSession *)self setConnectionTimer:v15];

      objc_destroyWeak(v22);
      objc_destroyWeak(&buf);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100074CC8();
      }

      if (v7) {
        goto LABEL_5;
      }
    }
  }
}

- (void)_mainQueue_handleDidConnectDevice:(BTDeviceImpl *)a3 service:(unsigned int)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100047978;
  v6[3] = &unk_1000BEB60;
  void v6[4] = self;
  v6[5] = a3;
  [(CRWirelessPairingServiceSession *)self _mainQueue_performWithSession:v6];
}

- (void)_mainQueue_delegateDidFinishWithResult:(unint64_t)a3 error:(id)a4
{
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v6 = [(CRWirelessPairingServiceSession *)self delegate];
  if (v6)
  {
    if (a3 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_8;
      }
      id v7 = [(CRWirelessPairingServiceSession *)self delegate];
      [v7 pairingServiceSession:self didFailPairingAttemptWithError:v8];
    }
    else
    {
      id v7 = [(CRWirelessPairingServiceSession *)self delegate];
      [v7 pairingServiceSessionDidFinishPairing:self];
    }
  }
LABEL_8:
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (CRWirelessPairingServiceSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRWirelessPairingServiceSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CRBluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (CRCarPlayPreferences)carPlayPreferences
{
  return self->_carPlayPreferences;
}

- (OS_dispatch_semaphore)waitingOnSession
{
  return self->_waitingOnSession;
}

- (void)setWaitingOnSession:(id)a3
{
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (OS_os_transaction)sessionTransaction
{
  return self->_sessionTransaction;
}

- (void)setSessionTransaction:(id)a3
{
}

- (NSTimer)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
}

- (id)promptResponseHandler
{
  return self->_promptResponseHandler;
}

- (void)setPromptResponseHandler:(id)a3
{
}

- (id)localOOBDataHandler
{
  return self->_localOOBDataHandler;
}

- (void)setLocalOOBDataHandler:(id)a3
{
}

- (id)bluetoothConnectedHandler
{
  return self->_bluetoothConnectedHandler;
}

- (void)setBluetoothConnectedHandler:(id)a3
{
}

- (id)sessionDetachHandler
{
  return self->_sessionDetachHandler;
}

- (void)setSessionDetachHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionDetachHandler, 0);
  objc_storeStrong(&self->_bluetoothConnectedHandler, 0);
  objc_storeStrong(&self->_localOOBDataHandler, 0);
  objc_storeStrong(&self->_promptResponseHandler, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_waitingOnSession, 0);
  objc_storeStrong((id *)&self->_carPlayPreferences, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);

  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end