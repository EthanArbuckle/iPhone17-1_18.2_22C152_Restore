@interface NRNetworkRelayPair
+ (BOOL)candidateSupportsNetworkRelayPairing:(id)a3;
+ (id)_extendedMetadataFromWatchSetupMetadata:(id)a3;
+ (id)_identifierDataFromName:(id)a3;
+ (id)_productTypeStringFromMajor:(unint64_t)a3 minor:(unint64_t)a4;
+ (id)sharedInstance;
+ (void)_getProductMajorAndMinorFromProductType:(id)a3 result:(id)a4;
- (BOOL)IDSAccountAndDevicePresent;
- (BOOL)isInitialPropertiesReceived;
- (BOOL)isNetworkRelayPairComplete;
- (BOOL)isReady;
- (BOOL)isTinkerPairing;
- (BOOL)postFailsafeObliteration;
- (EPServiceRegistry)serviceRegistry;
- (NRExtensiblePairingDelegate)pairingDelegate;
- (NRNetworkRelayPair)init;
- (id)_generateWatchSetupExtendedMetadata;
- (void)_invalidateIDSChannel;
- (void)accountAndDeviceReady;
- (void)dealloc;
- (void)discoverAndPairWithAdvertisedName:(id)a3 deviceID:(id)a4;
- (void)discoverAndPairWithAdvertisedName:(id)a3 deviceID:(id)a4 oobKey:(id)a5;
- (void)discoveredCandidateIdentifier:(id)a3 bluetoothIdentifier:(id)a4 metadata:(id)a5;
- (void)lostCandidateWithIdentifier:(id)a3;
- (void)networkRelayPairingCompletedWithIdentifier:(id)a3 error:(id)a4;
- (void)pairIDS;
- (void)propertiesReceived;
- (void)receivedNewPINAuthenticationData:(id)a3;
- (void)receivedNewPreSharedKeyAuthenticationData:(id)a3;
- (void)receivedNewPreSharedKeyAuthenticationRequest;
- (void)reset;
- (void)respondWithPasscode:(id)a3;
- (void)setIDSAccountAndDevicePresent:(BOOL)a3;
- (void)setIsInitialPropertiesReceived:(BOOL)a3;
- (void)setIsNetworkRelayPairComplete:(BOOL)a3;
- (void)setIsTinkerPairing:(BOOL)a3;
- (void)setPairingDelegate:(id)a3;
- (void)setPostFailsafeObliteration:(BOOL)a3;
- (void)startScanningForCandidatesWithDelegate:(id)a3;
- (void)stopScanningForCandidatesWithDelegate:(id)a3;
- (void)timeout;
- (void)waitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4;
@end

@implementation NRNetworkRelayPair

- (NRNetworkRelayPair)init
{
  v15.receiver = self;
  v15.super_class = (Class)NRNetworkRelayPair;
  v2 = [(NRNetworkRelayPair *)&v15 init];
  if (v2)
  {
    v3 = +[NRQueue registryDaemonQueue];
    uint64_t v4 = [v3 queue];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSHashTable weakObjectsHashTable];
    weakDiscoveryDelegates = v2->_weakDiscoveryDelegates;
    v2->_weakDiscoveryDelegates = (NSHashTable *)v6;

    uint64_t v8 = +[NetworkRelayAgent sharedInstance];
    networkRelayAgent = v2->_networkRelayAgent;
    v2->_networkRelayAgent = (NetworkRelayAgent *)v8;

    [(NetworkRelayAgent *)v2->_networkRelayAgent addDelegate:v2];
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    readableNameToCandidateInfoMap = v2->_readableNameToCandidateInfoMap;
    v2->_readableNameToCandidateInfoMap = v10;

    uint64_t v12 = +[NRSystemProperties sharedInstance];
    systemProperties = v2->_systemProperties;
    v2->_systemProperties = (NRSystemProperties *)v12;

    [(NRNetworkRelayPair *)v2 reset];
  }
  return v2;
}

- (void)dealloc
{
  v3 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[NRNetworkRelayPair dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(NRNetworkRelayPair *)self reset];
  v4.receiver = self;
  v4.super_class = (Class)NRNetworkRelayPair;
  [(NRNetworkRelayPair *)&v4 dealloc];
}

- (void)reset
{
  v3 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[NRNetworkRelayPair reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  pairedBluetoothIdentifier = self->_pairedBluetoothIdentifier;
  self->_pairedBluetoothIdentifier = 0;

  *(_WORD *)&self->_isNetworkRelayPairComplete = 0;
  self->_isInitialPropertiesReceived = 0;
  authData = self->_authData;
  self->_authData = 0;

  timer = self->_timer;
  if (timer)
  {
    [(AbstractTimer *)timer invalidate];
    v7 = self->_timer;
    self->_timer = 0;
  }
  [(NetworkRelayAgent *)self->_networkRelayAgent stopPushingCandidates];
  [(NetworkRelayAgent *)self->_networkRelayAgent stopScanningForCandidates];
  [(NetworkRelayAgent *)self->_networkRelayAgent invalidatePairingManagerIfIdle];
}

- (void)timeout
{
  timer = self->_timer;
  self->_timer = 0;

  objc_super v4 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Timeout trying to pair with NRNetworkRelayPair", buf, 2u);
  }

  v5 = nrGetPairingError();
  NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
  NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
  CFStringRef v18 = @"timer fired";
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v7 = +[NSError errorWithDomain:@"com.apple.nanoregistry.pairingerror" code:1 userInfo:v6];
  v20 = v7;
  int v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  v9 = [v5 domain];
  v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, [v5 code], v8);

  v11 = [(NRNetworkRelayPair *)self pairingDelegate];
  uint64_t v12 = [v11 pairingReport];
  [v12 setOriginalError:v10];

  v13 = +[NRQueue registryDaemonQueue];
  v14 = [v13 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095450;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v14, block);

  [(NRNetworkRelayPair *)self reset];
}

+ (id)sharedInstance
{
  if (qword_1001A1298 != -1) {
    dispatch_once(&qword_1001A1298, &stru_1001685A0);
  }
  v2 = (void *)qword_1001A1290;

  return v2;
}

+ (BOOL)candidateSupportsNetworkRelayPairing:(id)a3
{
  v3 = sub_10001381C(a3);
  objc_super v4 = [v3 objectForKeyedSubscript:@"v"];
  BOOL v5 = [v4 unsignedIntegerValue] == (id)4;

  return v5;
}

- (void)startScanningForCandidatesWithDelegate:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100095630;
    v7[3] = &unk_100165530;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);
  }
}

- (void)stopScanningForCandidatesWithDelegate:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009573C;
    v7[3] = &unk_100165530;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);
  }
}

- (void)discoverAndPairWithAdvertisedName:(id)a3 deviceID:(id)a4 oobKey:(id)a5
{
  id v8 = a3;
  v9 = (NSUUID *)a4;
  id v10 = a5;
  v11 = +[NRNetworkRelayPair _identifierDataFromName:v8];
  uint64_t v12 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v26 = v8;
    __int16 v27 = 2114;
    v28 = v11;
    __int16 v29 = 2114;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Discover and pair with OOBKey:- advertised name: %{public}@ (identifier %{public}@, OOBKey: %{public}@", buf, 0x20u);
  }

  [(NRNetworkRelayPair *)self _invalidateIDSChannel];
  nrDeviceUUID = self->_nrDeviceUUID;
  self->_nrDeviceUUID = v9;
  v14 = v9;

  objc_storeStrong((id *)&self->_authData, a5);
  objc_super v15 = [(NRNetworkRelayPair *)self pairingDelegate];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100095A0C;
  v22[3] = &unk_1001685C8;
  v22[4] = self;
  id v23 = v11;
  id v24 = v10;
  id v16 = v10;
  id v17 = v11;
  [v15 createDeviceFromPairingRequest:v8 discoveredBy:2 withBlock:v22];

  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100095A20;
  v21[3] = &unk_1001655F8;
  v21[4] = self;
  NSErrorUserInfoKey v19 = +[TimerFactory timerWithIdentifier:@"com.apple.NanoRegistry.NetworkRelayPair" delay:1 gracePeriod:queue waking:v21 handlerQueue:90.0 handlerBlock:0.0];
  timer = self->_timer;
  self->_timer = v19;
}

- (void)discoverAndPairWithAdvertisedName:(id)a3 deviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NRNetworkRelayPair _identifierDataFromName:v6];
  objc_storeStrong((id *)&self->_nrDeviceUUID, a4);
  objc_storeStrong((id *)&self->_deviceBeingPairedIdentifier, v8);
  v9 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Discover and pair with deviceID:- advertised name: %{public}@ (identifier %{public}@, device ID: %{public}@", buf, 0x20u);
  }

  [(NRNetworkRelayPair *)self _invalidateIDSChannel];
  id v10 = [(NRNetworkRelayPair *)self pairingDelegate];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100095C60;
  v17[3] = &unk_1001685C8;
  v17[4] = self;
  id v18 = v8;
  id v19 = v7;
  id v11 = v7;
  id v12 = v8;
  [v10 createDeviceFromPairingRequest:v6 discoveredBy:2 withBlock:v17];

  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100095CC4;
  v16[3] = &unk_1001655F8;
  v16[4] = self;
  v14 = +[TimerFactory timerWithIdentifier:@"com.apple.NanoRegistry.NetworkRelayPair" delay:1 gracePeriod:queue waking:v16 handlerQueue:90.0 handlerBlock:0.0];
  timer = self->_timer;
  self->_timer = v14;
}

- (void)_invalidateIDSChannel
{
  if (![(NRNetworkRelayPair *)self IDSAccountAndDevicePresent])
  {
    v3 = networkrelay_pairing_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(NRNetworkRelayPair *)self pairingDelegate];
      BOOL v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asking %@ to invalidate IDS channels.", (uint8_t *)&v8, 0xCu);
    }
    id v7 = [(NRNetworkRelayPair *)self pairingDelegate];
    [v7 invalidateIDSChannels];
  }
}

- (BOOL)isReady
{
  if (![(NRNetworkRelayPair *)self isNetworkRelayPairComplete]
    || ![(NRNetworkRelayPair *)self IDSAccountAndDevicePresent])
  {
    return 0;
  }

  return [(NRNetworkRelayPair *)self isInitialPropertiesReceived];
}

- (void)respondWithPasscode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100095EB0;
  v7[3] = &unk_100165530;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)networkRelayPairingCompletedWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095FFC;
  block[3] = &unk_100165868;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)pairIDS
{
  v3 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[NRNetworkRelayPair pairIDS]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000965D0;
  v15[3] = &unk_100165980;
  v15[4] = self;
  id v4 = objc_retainBlock(v15);
  authData = self->_authData;
  if (authData && [(NSData *)authData length])
  {
    id v6 = [objc_alloc((Class)IDSLocalPairingAddPairedDeviceInfo) initWithCBUUID:self->_pairedBluetoothIdentifier pairingProtocolVersion:0 BTOutOfBandKey:self->_authData];
    [v6 setPairingType:self->_isTinkerPairing];
    [v6 setShouldPairDirectlyOverIPsec:1];
    id v7 = [(NRNetworkRelayPair *)self pairingDelegate];
    nrDeviceUUID = self->_nrDeviceUUID;
    pairedBluetoothIdentifier = self->_pairedBluetoothIdentifier;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100096928;
    v12[3] = &unk_1001685F0;
    v12[4] = self;
    id v13 = v6;
    id v14 = v4;
    id v10 = v6;
    [v7 createLocalPairingStore:nrDeviceUUID andNotifyPairingBeginning:1 bluetoothIdentifier:pairedBluetoothIdentifier withBlock:v12];
  }
  else
  {
    id v10 = networkrelay_pairing_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = self->_authData;
      *(_DWORD *)buf = 138412290;
      id v17 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to pair IDS Auth data is %@", buf, 0xCu);
    }
  }
}

- (void)accountAndDeviceReady
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096DE8;
  block[3] = &unk_1001655F8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)propertiesReceived
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096FF4;
  block[3] = &unk_1001655F8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

+ (id)_identifierDataFromName:(id)a3
{
  v3 = sub_10001381C(a3);
  id v4 = [v3 objectForKeyedSubscript:@"v"];
  unsigned __int8 v5 = [v4 unsignedCharValue];

  id v6 = [v3 objectForKeyedSubscript:@"n"];
  unsigned int v7 = [v6 unsignedIntValue];

  id v8 = [v3 objectForKeyedSubscript:@"s"];
  unsigned __int8 v9 = [v8 unsignedCharValue];

  id v10 = [v3 objectForKeyedSubscript:@"m"];
  unsigned __int8 v11 = [v10 unsignedCharValue];

  id v12 = [objc_alloc((Class)WatchSetupAdvertisementIdentifier) initWithAdvertisingIdentifier:v7 & 0x1FFFF pairingStrategy:v5 & 7 deviceSize:v9 & 0x3F enclosureMaterial:v11 & 0x3F];
  id v13 = [v12 packedIdentifierData];

  return v13;
}

- (id)_generateWatchSetupExtendedMetadata
{
  v3 = +[NRPairingCompatibilityVersionInfo systemVersions];
  unsigned __int8 v4 = [v3 maxPairingCompatibilityVersion];

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  BOOL v5 = [(NRNetworkRelayPair *)self postFailsafeObliteration];
  id v6 = [(NRSystemProperties *)self->_systemProperties encodedSystemVersion];
  id v7 = [v6 intValue];

  id v8 = [(NRSystemProperties *)self->_systemProperties productType];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009747C;
  v13[3] = &unk_100168618;
  v13[4] = &v18;
  v13[5] = &v14;
  +[NRNetworkRelayPair _getProductMajorAndMinorFromProductType:v8 result:v13];
  id v9 = objc_alloc((Class)WatchSetupExtendedMetadata);
  id v10 = [v9 initWithPairingVersion:v4 productVersionMajor:*((unsigned __int8 *)v19 + 24) productVersionMinor:*((unsigned __int8 *)v15 + 24) postFailSafeObliteration:v5 encodedSystemVersion:v7];
  unsigned __int8 v11 = [v10 packedExtendedMetadataData];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)waitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009755C;
  block[3] = &unk_100166838;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

+ (id)_extendedMetadataFromWatchSetupMetadata:(id)a3
{
  v3 = sub_1000975EC(a3);
  if (v3)
  {
    unsigned __int8 v4 = objc_opt_new();
    BOOL v5 = [v3 objectForKeyedSubscript:off_1001A0A70];
    [v4 setPairingVersion:[v5 integerValue]];

    [v4 setChipID:123];
    id v6 = [v3 objectForKeyedSubscript:off_1001A0A90];
    [v4 setEncodedSystemVersion:[v6 integerValue]];

    id v7 = [v3 objectForKeyedSubscript:off_1001A0A78];
    id v8 = [v7 unsignedIntegerValue];

    id v9 = [v3 objectForKeyedSubscript:off_1001A0A80];
    id v10 = [v9 unsignedIntegerValue];

    unsigned __int8 v11 = +[NRNetworkRelayPair _productTypeStringFromMajor:v8 minor:v10];
    [v4 setProductType:v11];

    [v4 setIsCellularEnabled:1];
    id v12 = [v3 objectForKeyedSubscript:off_1001A0A88];
    [v4 setPostFailsafeObliteration:[v12 BOOLValue]];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (void)_getProductMajorAndMinorFromProductType:(id)a3 result:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v20 = 0;
    id v6 = (void (**)(id, id, id))a4;
    id v7 = +[NSRegularExpression regularExpressionWithPattern:@"Watch(?<MAJOR>\\d+),(?<MINOR>\\d+)" options:0 error:&v20];
    id v8 = v20;
    if (v8)
    {
      id v9 = networkrelay_pairing_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error creating a regular expression: %@", buf, 0xCu);
      }
      id v10 = 0;
      id v11 = 0;
    }
    else
    {
      id v9 = [v7 matchesInString:v5 options:0 range:[v5 length]];
      if ([v9 count] == (id)1)
      {
        id v12 = [v9 firstObject];
        id v13 = [v12 rangeWithName:@"MAJOR"];
        objc_super v15 = [v5 substringWithRange:v13, v14];
        id v16 = [v12 rangeWithName:@"MINOR"];
        uint64_t v18 = [v5 substringWithRange:v16, v17];
        id v11 = [v15 integerValue];
        id v10 = [v18 integerValue];
      }
      else
      {
        id v12 = networkrelay_pairing_log_handle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v19 = [v9 count];
          *(_DWORD *)buf = 138412546;
          id v22 = v5;
          __int16 v23 = 2048;
          id v24 = v19;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unexpected number of matches from %@, got %lu", buf, 0x16u);
        }
        id v10 = 0;
        id v11 = 0;
      }
    }
    v6[2](v6, v11, v10);
  }
}

+ (id)_productTypeStringFromMajor:(unint64_t)a3 minor:(unint64_t)a4
{
  return +[NSString stringWithFormat:@"Watch%lu,%lu", a3, a4];
}

- (void)discoveredCandidateIdentifier:(id)a3 bluetoothIdentifier:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)WatchSetupAdvertisementIdentifier) initWithPackedIdentifierData:v8];
  id v12 = [v11 humanReadableName];
  if (v12)
  {
    id v13 = +[NRNetworkRelayPair _extendedMetadataFromWatchSetupMetadata:v10];
    uint64_t v14 = networkrelay_pairing_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2114;
      id v27 = v9;
      __int16 v28 = 2114;
      id v29 = v10;
      __int16 v30 = 2114;
      v31 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Discovered candidate with identifier %{public}@ (name %{public}@), bluetooth UUID %{public}@, metadata %{public}@ (legacy %{public}@)", buf, 0x34u);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100097E18;
    block[3] = &unk_1001681F0;
    void block[4] = self;
    id v18 = v12;
    id v19 = v8;
    id v20 = v13;
    id v21 = v9;
    id v16 = v13;
    dispatch_async((dispatch_queue_t)queue, block);
  }
  else
  {
    id v16 = networkrelay_pairing_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Candidate discovered but failed to create a human readable name from Watch Setup identifier %{public}@", buf, 0xCu);
    }
  }
}

- (void)lostCandidateWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)WatchSetupAdvertisementIdentifier) initWithPackedIdentifierData:v4];
  id v6 = [v5 humanReadableName];
  id v7 = networkrelay_pairing_log_handle();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = v4;
      __int16 v14 = 2114;
      objc_super v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Lost candidate with identifier %{public}@ (name %{public}@)", buf, 0x16u);
    }

    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100098118;
    v10[3] = &unk_100165530;
    v10[4] = self;
    id v11 = v6;
    dispatch_async((dispatch_queue_t)queue, v10);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Candidate lost but failed to create a human readable name from Watch Setup identifier %{public}@", buf, 0xCu);
    }
  }
}

- (void)receivedNewPreSharedKeyAuthenticationData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000982E4;
  v7[3] = &unk_100165530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)receivedNewPreSharedKeyAuthenticationRequest
{
  v3 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received new authentication request, pushing.", v4, 2u);
  }

  dispatch_async((dispatch_queue_t)self->_queue, &stru_100168638);
}

- (void)receivedNewPINAuthenticationData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009848C;
  v7[3] = &unk_100165530;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (NRExtensiblePairingDelegate)pairingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingDelegate);

  return (NRExtensiblePairingDelegate *)WeakRetained;
}

- (void)setPairingDelegate:(id)a3
{
}

- (BOOL)isTinkerPairing
{
  return self->_isTinkerPairing;
}

- (void)setIsTinkerPairing:(BOOL)a3
{
  self->_isTinkerPairing = a3;
}

- (BOOL)postFailsafeObliteration
{
  return self->_postFailsafeObliteration;
}

- (void)setPostFailsafeObliteration:(BOOL)a3
{
  self->_postFailsafeObliteration = a3;
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (BOOL)isNetworkRelayPairComplete
{
  return self->_isNetworkRelayPairComplete;
}

- (void)setIsNetworkRelayPairComplete:(BOOL)a3
{
  self->_isNetworkRelayPairComplete = a3;
}

- (BOOL)IDSAccountAndDevicePresent
{
  return self->_IDSAccountAndDevicePresent;
}

- (void)setIDSAccountAndDevicePresent:(BOOL)a3
{
  self->_IDSAccountAndDevicePresent = a3;
}

- (BOOL)isInitialPropertiesReceived
{
  return self->_isInitialPropertiesReceived;
}

- (void)setIsInitialPropertiesReceived:(BOOL)a3
{
  self->_isInitialPropertiesReceived = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_destroyWeak((id *)&self->_pairingDelegate);
  objc_storeStrong((id *)&self->_systemProperties, 0);
  objc_storeStrong((id *)&self->_readableNameToCandidateInfoMap, 0);
  objc_storeStrong((id *)&self->_networkRelayAgent, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_deviceBeingPairedIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedBluetoothIdentifier, 0);
  objc_storeStrong((id *)&self->_nrDeviceUUID, 0);
  objc_storeStrong((id *)&self->_authData, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_weakDiscoveryDelegates, 0);
}

@end