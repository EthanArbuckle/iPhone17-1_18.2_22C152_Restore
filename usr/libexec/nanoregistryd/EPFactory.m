@interface EPFactory
+ (BOOL)signalProcessNamed:(id)a3 withSignal:(int)a4;
+ (id)newService:(id)a3;
+ (id)queue;
+ (id)sharedFactory;
+ (id)sharedFactoryWithQueue:(id)a3;
+ (void)killProcessNamed:(id)a3;
- (BOOL)advertiserNotAvailableToPair;
- (BOOL)discovererShouldScanForProximity;
- (BOOL)dontAdvertiseWithServiceUUID;
- (EPAdvertiserManager)advertiserManager;
- (EPCentralManagerManager)centralManagerManager;
- (EPDiscovererManager)discovererManager;
- (EPNullResourceManager)advertisingManager;
- (EPNullResourceManager)nullManager;
- (EPOOBKeyGeneratorManager)keyGeneratorManager;
- (EPPairingAgentManager)agentManager;
- (EPPeripheralManagerManager)peripheralManagerManager;
- (NSArray)discovererDeviceUUIDs;
- (NSString)advertisingName;
- (id)initBase;
- (id)newAdvertiserWithDelegate:(id)a3;
- (id)newCentralManagerWithDelegate:(id)a3;
- (id)newDiscovererWithDelegate:(id)a3;
- (id)newKeyGeneratorWithDelegate:(id)a3;
- (id)newNullResourceWithDelegate:(id)a3;
- (id)newPeripheralManagerWithDelegate:(id)a3;
- (id)queue;
- (unint64_t)advertisingRate;
- (void)addAdvertisedCharacteristic:(id)a3 encryptionRequired:(BOOL)a4 withReadHandler:(id)a5 writeHandler:(id)a6;
- (void)killBluetoothDaemon;
- (void)removeAdvertisedCharacteristic:(id)a3;
- (void)setAdvertiserManager:(id)a3;
- (void)setAdvertiserNotAvailableToPair:(BOOL)a3;
- (void)setAdvertisingManager:(id)a3;
- (void)setAdvertisingName:(id)a3;
- (void)setAdvertisingRate:(unint64_t)a3;
- (void)setCentralManagerManager:(id)a3;
- (void)setDiscovererDeviceUUIDs:(id)a3;
- (void)setDiscovererManager:(id)a3;
- (void)setDiscovererShouldScanForProximity:(BOOL)a3;
- (void)setDontAdvertiseWithServiceUUID:(BOOL)a3;
- (void)setNullManager:(id)a3;
- (void)setPeripheralManagerManager:(id)a3;
@end

@implementation EPFactory

+ (id)queue
{
  return (id)qword_1001A13C8;
}

- (id)queue
{
  return (id)qword_1001A13C8;
}

+ (id)newService:(id)a3
{
  v4 = [a3 queue];
  v5 = [a1 sharedFactoryWithQueue:v4];

  return v5;
}

+ (id)sharedFactoryWithQueue:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C89EC;
  v8[3] = &unk_100166120;
  id v9 = a3;
  id v10 = a1;
  uint64_t v4 = qword_1001A13D0;
  id v5 = v9;
  if (v4 != -1) {
    dispatch_once(&qword_1001A13D0, v8);
  }
  id v6 = (id)qword_1001A13D8;

  return v6;
}

+ (id)sharedFactory
{
  return (id)qword_1001A13D8;
}

- (id)initBase
{
  v21.receiver = self;
  v21.super_class = (Class)EPFactory;
  v2 = [(EPFactory *)&v21 init];
  if (v2)
  {
    v3 = +[EPFactory queue];
    dispatch_assert_queue_V2(v3);

    uint64_t v4 = objc_opt_new();
    agentManager = v2->_agentManager;
    v2->_agentManager = (EPPairingAgentManager *)v4;

    uint64_t v6 = objc_opt_new();
    keyGeneratorManager = v2->_keyGeneratorManager;
    v2->_keyGeneratorManager = (EPOOBKeyGeneratorManager *)v6;

    uint64_t v8 = objc_opt_new();
    advertiserManager = v2->_advertiserManager;
    v2->_advertiserManager = (EPAdvertiserManager *)v8;

    uint64_t v10 = objc_opt_new();
    discovererManager = v2->_discovererManager;
    v2->_discovererManager = (EPDiscovererManager *)v10;

    uint64_t v12 = objc_opt_new();
    centralManagerManager = v2->_centralManagerManager;
    v2->_centralManagerManager = (EPCentralManagerManager *)v12;

    uint64_t v14 = objc_opt_new();
    peripheralManagerManager = v2->_peripheralManagerManager;
    v2->_peripheralManagerManager = (EPPeripheralManagerManager *)v14;

    v16 = [EPNullResourceManager alloc];
    v17 = +[EPFactory queue];
    v18 = [(EPResourceManager *)v16 initWithQueue:v17];
    nullManager = v2->_nullManager;
    v2->_nullManager = v18;
  }
  return v2;
}

- (void)killBluetoothDaemon
{
  v2 = sub_1000A3BC0();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    uint64_t v4 = sub_1000A3BC0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000FB864(v4);
    }
  }
}

+ (void)killProcessNamed:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() signalProcessNamed:v3 withSignal:9];
}

+ (BOOL)signalProcessNamed:(id)a3 withSignal:(int)a4
{
  id v5 = a3;
  *(_OWORD *)v46 = xmmword_10011A758;
  uint64_t v47 = 0;
  size_t size = 0;
  if (sysctl(v46, 3u, 0, &size, 0, 0) == -1)
  {
    uint64_t v14 = sub_1000A3BC0();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    BOOL v16 = 0;
    if (!v15) {
      goto LABEL_33;
    }
    v17 = sub_1000A3BC0();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    int v18 = *__error();
    *(_DWORD *)buf = 138412546;
    size_t v41 = (size_t)v5;
    __int16 v42 = 1024;
    LODWORD(v43) = v18;
    v19 = "Error calling sysctl, trying to kill process %@ error %d";
    v20 = v17;
    uint32_t v21 = 18;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_25;
  }
  uint64_t v6 = (char *)malloc_type_malloc(size, 0xD1D1CA2CuLL);
  if (!v6)
  {
    v22 = sub_1000A3BC0();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    BOOL v16 = 0;
    if (!v23) {
      goto LABEL_33;
    }
    v17 = sub_1000A3BC0();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 134218242;
    size_t v41 = size;
    __int16 v42 = 2112;
    id v43 = v5;
    v19 = "Failed to allocate memory, %zu bytes trying to kill process %@";
    v20 = v17;
    uint32_t v21 = 22;
    goto LABEL_24;
  }
  while (1)
  {
    v7 = v6;
    if (sysctl(v46, 3u, v6, &size, 0, 0) != -1) {
      break;
    }
    if (*__error() != 12)
    {
      v32 = sub_1000A3BC0();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

      if (v33)
      {
        uint64_t v10 = sub_1000A3BC0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = *__error();
          *(_DWORD *)buf = 138412546;
          size_t v41 = (size_t)v5;
          __int16 v42 = 1024;
          LODWORD(v43) = v34;
          v11 = "Error calling sysctl, trying to kill process %@ error %d";
          uint64_t v12 = v10;
          uint32_t v13 = 18;
LABEL_29:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
LABEL_30:
      }
LABEL_31:
      free(v7);
      goto LABEL_32;
    }
    size += size / 0xA;
    uint64_t v6 = (char *)malloc_type_realloc(v7, size, 0x1504CDCFuLL);
    if (!v6)
    {
      uint64_t v8 = sub_1000A3BC0();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        uint64_t v10 = sub_1000A3BC0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          size_t v41 = size;
          __int16 v42 = 2112;
          id v43 = v5;
          v11 = "Failed to reallocate memory, %zu bytes trying to kill process %@";
          uint64_t v12 = v10;
          uint32_t v13 = 22;
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      goto LABEL_31;
    }
  }
  id v24 = v5;
  v25 = (const char *)[v24 UTF8String];
  if (size < 0x288)
  {
LABEL_20:
    free(v7);
  }
  else
  {
    v26 = v25;
    size_t v27 = size / 0x288;
    v28 = v7 + 243;
    while (1)
    {
      size_t v29 = *(int *)(v28 - 203);
      if (v29)
      {
        if (!strncmp(v26, v28, 0x10uLL)) {
          break;
        }
      }
      v28 += 648;
      if (!--v27) {
        goto LABEL_20;
      }
    }
    free(v7);
    if (v29 != -1)
    {
      if (kill(v29, a4) != -1)
      {
        BOOL v16 = 1;
        goto LABEL_33;
      }
      v36 = sub_1000A3BC0();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

      BOOL v16 = 0;
      if (!v37) {
        goto LABEL_33;
      }
      v17 = sub_1000A3BC0();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      int v38 = *__error();
      *(_DWORD *)buf = 134218498;
      size_t v41 = v29;
      __int16 v42 = 2112;
      id v43 = v24;
      __int16 v44 = 1024;
      int v45 = v38;
      v19 = "Failed to kill pid %lu for process named %@, error %d";
      v20 = v17;
      uint32_t v21 = 28;
      goto LABEL_24;
    }
  }
  v30 = sub_1000A3BC0();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

  BOOL v16 = 0;
  if (!v31) {
    goto LABEL_33;
  }
  v17 = sub_1000A3BC0();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    size_t v41 = (size_t)v24;
    v19 = "Did not find process named %@";
    v20 = v17;
    uint32_t v21 = 12;
    goto LABEL_24;
  }
LABEL_25:

LABEL_32:
  BOOL v16 = 0;
LABEL_33:

  return v16;
}

- (id)newKeyGeneratorWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[EPFactory queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(EPOOBKeyGeneratorManager *)self->_keyGeneratorManager newGeneratorWithDelegate:v4];
  return v6;
}

- (id)newDiscovererWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[EPFactory queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(EPDiscovererManager *)self->_discovererManager newDiscovererWithDelegate:v4];
  return v6;
}

- (id)newAdvertiserWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[EPFactory queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(EPAdvertiserManager *)self->_advertiserManager newAdvertiserWithDelegate:v4];
  return v6;
}

- (id)newCentralManagerWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[EPFactory queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(EPCentralManagerManager *)self->_centralManagerManager newManagerWithDelegate:v4];
  return v6;
}

- (id)newPeripheralManagerWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[EPFactory queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(EPPeripheralManagerManager *)self->_peripheralManagerManager newManagerWithDelegate:v4];
  return v6;
}

- (void)setAdvertisingName:(id)a3
{
}

- (NSString)advertisingName
{
  return [(EPAdvertiserManager *)self->_advertiserManager name];
}

- (void)setAdvertisingRate:(unint64_t)a3
{
}

- (unint64_t)advertisingRate
{
  return [(EPAdvertiserManager *)self->_advertiserManager advertisingRate];
}

- (void)setAdvertiserNotAvailableToPair:(BOOL)a3
{
}

- (BOOL)advertiserNotAvailableToPair
{
  return [(EPAdvertiserManager *)self->_advertiserManager notAvailableToPair];
}

- (void)setDontAdvertiseWithServiceUUID:(BOOL)a3
{
}

- (BOOL)dontAdvertiseWithServiceUUID
{
  return [(EPAdvertiserManager *)self->_advertiserManager dontAdvertiseWithServiceUUID];
}

- (void)setDiscovererDeviceUUIDs:(id)a3
{
}

- (NSArray)discovererDeviceUUIDs
{
  return [(EPDiscovererManager *)self->_discovererManager discoverDeviceUUIDs];
}

- (void)setDiscovererShouldScanForProximity:(BOOL)a3
{
}

- (BOOL)discovererShouldScanForProximity
{
  return [(EPDiscovererManager *)self->_discovererManager scanForProximity];
}

- (id)newNullResourceWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[EPFactory queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(EPResourceManager *)self->_nullManager newResourceWithDelegate:v4];
  return v6;
}

- (void)addAdvertisedCharacteristic:(id)a3 encryptionRequired:(BOOL)a4 withReadHandler:(id)a5 writeHandler:(id)a6
{
}

- (void)removeAdvertisedCharacteristic:(id)a3
{
}

- (EPAdvertiserManager)advertiserManager
{
  return self->_advertiserManager;
}

- (void)setAdvertiserManager:(id)a3
{
}

- (EPDiscovererManager)discovererManager
{
  return self->_discovererManager;
}

- (void)setDiscovererManager:(id)a3
{
}

- (EPCentralManagerManager)centralManagerManager
{
  return self->_centralManagerManager;
}

- (void)setCentralManagerManager:(id)a3
{
}

- (EPPeripheralManagerManager)peripheralManagerManager
{
  return self->_peripheralManagerManager;
}

- (void)setPeripheralManagerManager:(id)a3
{
}

- (EPNullResourceManager)nullManager
{
  return self->_nullManager;
}

- (void)setNullManager:(id)a3
{
}

- (EPNullResourceManager)advertisingManager
{
  return self->_advertisingManager;
}

- (void)setAdvertisingManager:(id)a3
{
}

- (EPOOBKeyGeneratorManager)keyGeneratorManager
{
  return self->_keyGeneratorManager;
}

- (EPPairingAgentManager)agentManager
{
  return self->_agentManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentManager, 0);
  objc_storeStrong((id *)&self->_keyGeneratorManager, 0);
  objc_storeStrong((id *)&self->_advertisingManager, 0);
  objc_storeStrong((id *)&self->_nullManager, 0);
  objc_storeStrong((id *)&self->_peripheralManagerManager, 0);
  objc_storeStrong((id *)&self->_centralManagerManager, 0);
  objc_storeStrong((id *)&self->_discovererManager, 0);

  objc_storeStrong((id *)&self->_advertiserManager, 0);
}

@end