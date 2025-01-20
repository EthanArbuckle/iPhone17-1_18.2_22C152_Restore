@interface HIDChargerNotifier
+ (id)stateToStr:(unsigned __int8)a3;
- (ACCBLEPairingProvider)pairingProvider;
- (BOOL)pending;
- (Class)ACCBLEPairingProvider;
- (HIDChargerNotifier)initWithQueue:(id)a3;
- (HIDChargerNotifierDelegate)delegate;
- (NSBundle)pairingProviderBundle;
- (NSLock)lock;
- (NSString)accConnIdentifier;
- (OS_dispatch_queue)queue;
- (unsigned)state;
- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7;
- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5;
- (void)blePairing:(id)a3 pairingFinished:(id)a4 blePairingUUID:(id)a5;
- (void)blePairingNoAccessories:(id)a3;
- (void)changeState:(unsigned __int8)a3;
- (void)setACCBLEPairingProvider:(Class)a3;
- (void)setAccConnIdentifier:(id)a3;
- (void)setBTAuthState:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLock:(id)a3;
- (void)setPairingData:(id)a3;
- (void)setPairingProvider:(id)a3;
- (void)setPairingProviderBundle:(id)a3;
- (void)setPending:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)start;
- (void)stop;
@end

@implementation HIDChargerNotifier

+ (id)stateToStr:(unsigned __int8)a3
{
  if (a3 > 3u) {
    return @"unknown";
  }
  else {
    return *(&off_1000B1F18 + (char)a3);
  }
}

- (HIDChargerNotifier)initWithQueue:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HIDChargerNotifier;
  v6 = [(HIDChargerNotifier *)&v38 init];
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = objc_opt_new();
    lock = v7->_lock;
    v7->_lock = (NSLock *)v9;

    if (v7->_lock)
    {
      objc_storeStrong((id *)&v7->_queue, a3);
      uint64_t v11 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AccessoryBLEPairing.framework"];
      pairingProviderBundle = v7->_pairingProviderBundle;
      v7->_pairingProviderBundle = (NSBundle *)v11;

      uint64_t v13 = [(NSBundle *)v7->_pairingProviderBundle classNamed:@"ACCBLEPairingProvider"];
      Class ACCBLEPairingProvider = v7->_ACCBLEPairingProvider;
      v7->_Class ACCBLEPairingProvider = (Class)v13;

      if (v7->_ACCBLEPairingProvider)
      {
        v15 = +[ACCTransportClient sharedClient];
        uint64_t v16 = [v15 createConnectionWithType:2 andIdentifier:@"chargerNotifier"];
        accConnIdentifier = v7->_accConnIdentifier;
        v7->_accConnIdentifier = (NSString *)v16;

        if (v7->_accConnIdentifier)
        {
          v18 = +[ACCTransportClient sharedClient];
          uint64_t v19 = kACCProperties_Connection_HideFromUI;
          v20 = +[NSNull null];
          [v18 setProperty:v19 value:v20 forEndpointWithUUID:v7->_accConnIdentifier];

          v8 = v7;
          goto LABEL_12;
        }
        v29 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100071A34(v29, v30, v31, v32, v33, v34, v35, v36);
        }
      }
      else
      {
        v21 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_1000719FC(v21, v22, v23, v24, v25, v26, v27, v28);
        }
      }
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (void)start
{
  v3 = (ACCBLEPairingProvider *)[objc_alloc(self->_ACCBLEPairingProvider) initWithDelegate:self];
  pairingProvider = self->_pairingProvider;
  self->_pairingProvider = v3;

  if (!self->_pairingProvider)
  {
    id v5 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100071A6C(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)stop
{
  if (self->_accConnIdentifier)
  {
    id v3 = +[ACCTransportClient sharedClient];
    [v3 destroyConnectionWithUUID:self->_accConnIdentifier];
  }
}

- (void)changeState:(unsigned __int8)a3
{
  [(NSLock *)self->_lock lock];
  self->_state = a3;
  self->_pending = 1;
  [(NSLock *)self->_lock unlock];
  id location = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040F84;
  block[3] = &unk_1000B1240;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setBTAuthState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting auth state (%u)", (uint8_t *)v7, 8u);
  }
  uint64_t v6 = +[ACCTransportClient sharedClient];
  [v6 setConnectionAuthenticated:self->_accConnIdentifier state:v3];
}

- (void)setPairingData:(id)a3
{
  id v4 = a3;
  id v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting pairing data", v7, 2u);
  }
  uint64_t v6 = +[ACCTransportClient sharedClient];
  [v6 setProperty:kACCProperties_Endpoint_OOBPairingData value:v4 forConnectionWithUUID:self->_accConnIdentifier];
}

- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7
{
  id v8 = a4;
  uint64_t v9 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accessory %@ attached to charger", (uint8_t *)&v10, 0xCu);
  }
  [(HIDChargerNotifier *)self changeState:1];
}

- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5
{
  id v6 = a4;
  id v7 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Accessory %@ detached from charger", (uint8_t *)&v8, 0xCu);
  }
  [(HIDChargerNotifier *)self changeState:0];
}

- (void)blePairingNoAccessories:(id)a3
{
  id v4 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No accessories on charger", v5, 2u);
  }
  [(HIDChargerNotifier *)self changeState:3];
}

- (void)blePairing:(id)a3 pairingFinished:(id)a4 blePairingUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004149C;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async(queue, block);
}

- (HIDChargerNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HIDChargerNotifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACCBLEPairingProvider)pairingProvider
{
  return self->_pairingProvider;
}

- (void)setPairingProvider:(id)a3
{
}

- (NSBundle)pairingProviderBundle
{
  return self->_pairingProviderBundle;
}

- (void)setPairingProviderBundle:(id)a3
{
}

- (Class)ACCBLEPairingProvider
{
  return self->_ACCBLEPairingProvider;
}

- (void)setACCBLEPairingProvider:(Class)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (BOOL)pending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (NSString)accConnIdentifier
{
  return self->_accConnIdentifier;
}

- (void)setAccConnIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accConnIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ACCBLEPairingProvider, 0);
  objc_storeStrong((id *)&self->_pairingProviderBundle, 0);
  objc_storeStrong((id *)&self->_pairingProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end