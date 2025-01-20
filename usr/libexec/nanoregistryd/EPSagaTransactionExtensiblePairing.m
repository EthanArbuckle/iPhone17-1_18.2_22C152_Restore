@interface EPSagaTransactionExtensiblePairing
- (BOOL)isInternalInstall;
- (EPServiceRegistry)serviceRegistry;
- (EPTransactionDelegate)delegate;
- (NRPairingReport)pairingReport;
- (NSUUID)pairingID;
- (id)_diffsForSettingDeviceIsActive:(BOOL)a3 withPairingID:(id)a4 collection:(id)a5;
- (id)_getSetIsActiveDiffWithIsActive:(BOOL)a3 withPairingID:(id)a4 collection:(id)a5;
- (id)_pathToNanoRegistryStateDirectory;
- (id)getLocalPairingStorePairingID:(id)a3;
- (id)makeLocalPairingStorePairingID:(id)a3;
- (id)registry;
- (id)routingSlipEntry;
- (id)routingSlipEntryPairingIDKey;
- (id)routingSlipEntryPairingStartedIDKey;
- (id)unpairHelper;
- (void)_beginDirectBluetoothPairingTransaction;
- (void)_beginNetworkRelayBluetoothPairingTransaction;
- (void)_cleanUpDiscoveredDevicesWithCollection:(id)a3;
- (void)activateDevice:(id)a3 withCompletion:(id)a4;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)cancelWithError:(id)a3;
- (void)copyPropertiesToRTCReporter:(id)a3;
- (void)createDeviceFromPairingRequest:(id)a3 discoveredBy:(unint64_t)a4 withBlock:(id)a5;
- (void)createLocalPairingStore:(id)a3 andNotifyPairingBeginning:(BOOL)a4 bluetoothIdentifier:(id)a5 withBlock:(id)a6;
- (void)createLocalPairingStore:(id)a3 andNotifyPairingBeginning:(BOOL)a4 withBlock:(id)a5;
- (void)deleteUnexpectedIDSPairedDevices;
- (void)filePairingReport;
- (void)getPairedPairingIDForBluetoothID:(id)a3 completion:(id)a4;
- (void)initializeAllIDSChannelsBlock:(id)a3;
- (void)invalidate;
- (void)invalidateIDSChannels;
- (void)notifyPasscode:(id)a3;
- (void)pairingCompleted;
- (void)pushVersion4CompatibilityMessageIfNeeded;
- (void)savePairingReport;
- (void)sendXPCBTPairRequestMessage:(id)a3 withCompletion:(id)a4;
- (void)sendXPCDeviceNeedsPasscodeMessage:(id)a3 passcode:(id)a4;
- (void)sendXPCOOBKeyChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPairingID:(id)a3;
- (void)setServiceRegistry:(id)a3;
- (void)transactionDidComplete;
- (void)unpairDeviceWithPairingID:(id)a3 obliterationString:(id)a4 shouldBrick:(id)a5 storeUnpair:(id)a6 migrationUnpair:(id)a7 shouldPreserveESim:(id)a8 pairingReport:(id)a9 remoteUnpairRequestUUID:(id)a10 shouldConnectionWithDevice:(BOOL)a11;
- (void)updateNRMutableDeviceFromEPDevice:(id)a3 withNRUUID:(id)a4 withBlock:(id)a5;
- (void)updateRegistryForUnpairing:(id)a3 withBlock:(id)a4;
- (void)voidIDSService:(Class)a3;
- (void)voidIDSServices;
@end

@implementation EPSagaTransactionExtensiblePairing

- (id)registry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  v3 = [WeakRetained serviceFromClass:objc_opt_class()];

  return v3;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionExtensiblePairing: cancelWithError: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (!v4)
  {
    v8 = [(EPSagaTransactionExtensiblePairing *)self routingSlipEntry];
    unsigned __int8 v9 = [v8 transactionBeganWithThisNR];

    if (v9)
    {
      id v4 = 0;
    }
    else
    {
      nrGetPairingError();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = [(EPSagaTransactionExtensiblePairing *)self unpairHelper];
  unsigned int v11 = [v10 startUnpairDueToError:v4];

  if (v11)
  {
    [(NRExtensiblePair *)self->_extensiblePair reset:1];
    [(EPSagaTransactionExtensiblePairing *)self transactionDidComplete];
  }
}

- (void)notifyPasscode:(id)a3
{
  uint64_t v3 = 16;
  if (!self->_useNetworkRelayBluetoothPairing) {
    uint64_t v3 = 8;
  }
  [*(id *)((char *)&self->super.isa + v3) respondWithPasscode:a3];
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NRFeatureFlags sharedInstance];
  nrFeatureFlags = self->_nrFeatureFlags;
  self->_nrFeatureFlags = v8;

  objc_storeWeak((id *)&self->_routingSlipEntry, v7);
  objc_storeWeak((id *)&self->_serviceRegistry, v6);
  [v6 addService:self];

  [(EPSagaTransactionExtensiblePairing *)self pairingReport];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  [WeakRetained setTransactionBeganWithThisNR:1];

  id v11 = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  int v12 = [v11 objectForKeyedSubscript:@"extensiblePairingAdvertisedName"];
  advertisedName = self->_advertisedName;
  self->_advertisedName = v12;

  v14 = sub_10001381C(self->_advertisedName);
  v15 = [v14 objectForKeyedSubscript:@"v"];
  id v16 = [v15 integerValue];

  unint64_t v17 = sub_100052B40((unint64_t)v16);
  v18 = nr_daemon_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    v20 = nr_daemon_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = self->_advertisedName;
      v24 = sub_100052B50(v17);
      int v31 = 138543874;
      v32 = v22;
      __int16 v33 = 2114;
      v34 = v23;
      __int16 v35 = 2114;
      v36 = v24;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@, advertised name: %{public}@, strategy: %{public}@", (uint8_t *)&v31, 0x20u);
    }
  }
  if (v17 == 4 && ![(NRFeatureFlags *)self->_nrFeatureFlags networkRelayPairing])
  {
    v26 = +[NRSystemProperties sharedInstance];
    self->_BOOL useNetworkRelayBluetoothPairing = [v26 isVirtualDevice];

    BOOL useNetworkRelayBluetoothPairing = self->_useNetworkRelayBluetoothPairing;
  }
  else
  {
    BOOL useNetworkRelayBluetoothPairing = v17 == 4;
    self->_BOOL useNetworkRelayBluetoothPairing = useNetworkRelayBluetoothPairing;
  }
  v27 = nr_daemon_log();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

  if (useNetworkRelayBluetoothPairing)
  {
    if (v28)
    {
      v29 = nr_daemon_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Using NetworkRelay for pairing Bluetooth (advertising/discoverying/pairing)", (uint8_t *)&v31, 2u);
      }
    }
    [(EPSagaTransactionExtensiblePairing *)self _beginNetworkRelayBluetoothPairingTransaction];
  }
  else
  {
    if (v28)
    {
      v30 = nr_daemon_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Using NanoRegistry for pairing Bluetooth (advertising/discoverying/pairing)", (uint8_t *)&v31, 2u);
      }
    }
    [(EPSagaTransactionExtensiblePairing *)self _beginDirectBluetoothPairingTransaction];
  }
}

- (void)_beginDirectBluetoothPairingTransaction
{
  uint64_t v3 = [NRExtensiblePair alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  v5 = [(NRExtensiblePair *)v3 initWithServiceRegistry:WeakRetained];
  extensiblePair = self->_extensiblePair;
  self->_extensiblePair = v5;

  [(NRExtensiblePair *)self->_extensiblePair setDelegate:self];
  id v7 = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  [v7 addService:self->_extensiblePair];

  id v8 = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  unsigned __int8 v9 = [v8 serviceFromClass:objc_opt_class()];

  v10 = +[NRQueue registryDaemonQueue];
  id v11 = [v10 queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000EE924;
  v12[3] = &unk_100165B28;
  v12[4] = self;
  [v9 checkIfFlaggedForRecoveryWithQueue:v11 completion:v12];
}

- (void)_beginNetworkRelayBluetoothPairingTransaction
{
  uint64_t v3 = +[NRNetworkRelayPair sharedInstance];
  networkRelayPair = self->_networkRelayPair;
  self->_networkRelayPair = v3;

  [(NRNetworkRelayPair *)self->_networkRelayPair setPairingDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v6 = [WeakRetained serviceFromClass:objc_opt_class()];

  id v7 = +[NRQueue registryDaemonQueue];
  id v8 = [v7 queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000EECD8;
  v9[3] = &unk_100165B28;
  v9[4] = self;
  [v6 checkIfFlaggedForRecoveryWithQueue:v8 completion:v9];
}

- (void)transactionDidComplete
{
  if (!self->_transactionComplete)
  {
    self->_transactionComplete = 1;
    p_serviceRegistry = &self->_serviceRegistry;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
    [WeakRetained removeService:self];

    id v5 = objc_loadWeakRetained((id *)p_serviceRegistry);
    id v6 = [v5 optionalServiceFromClass:objc_opt_class()];
    [v5 removeService:v6];

    id v7 = [(EPSagaTransactionExtensiblePairing *)self delegate];
    [v7 transactionDidComplete:self];
  }
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id obj = a3;
  id v6 = a4;
  objc_storeWeak((id *)&self->_routingSlipEntry, obj);
  objc_storeWeak((id *)&self->_serviceRegistry, v6);

  self->_transactionComplete = 0;
  id v7 = [obj objectForKeyedSubscript:@"extensiblePairingDeviceID"];
  id v8 = [obj objectForKeyedSubscript:@"pairingStarted"];
  unsigned __int8 v9 = v8;
  if (v7 && [v8 BOOLValue])
  {
    v10 = [obj routingSlipError];
    [(EPSagaTransactionExtensiblePairing *)self cancelWithError:v10];
  }
  [(EPSagaTransactionExtensiblePairing *)self transactionDidComplete];
}

- (id)_getSetIsActiveDiffWithIsActive:(BOOL)a3 withPairingID:(id)a4 collection:(id)a5
{
  id v5 = [(EPSagaTransactionExtensiblePairing *)self _diffsForSettingDeviceIsActive:a3 withPairingID:a4 collection:a5];
  if (v5) {
    id v6 = [objc_alloc((Class)NRDeviceCollectionDiff) initWithDeviceCollectionDiffDeviceDiffs:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_diffsForSettingDeviceIsActive:(BOOL)a3 withPairingID:(id)a4 collection:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  unsigned __int8 v9 = +[NSMutableDictionary dictionary];
  v10 = [v8 activeDeviceID];

  id v11 = +[NSDate date];
  if (!v7) {
    goto LABEL_6;
  }
  if (v6)
  {
    int v12 = +[NSMutableDictionary dictionary];
    if (([v7 isEqual:v10] & 1) == 0)
    {
      id v13 = +[NRMutableDevice diffsToActivate:1 withDate:v11];
      [v12 addEntriesFromDictionary:v13];
    }
    v14 = +[NRMutableDevice diffsToSetStatusCode:1];
    [v12 addEntriesFromDictionary:v14];

    id v15 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v12];
    id v16 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v15 andChangeType:1];
    [v9 setObject:v16 forKeyedSubscript:v7];

LABEL_6:
    if (!v10 || [v10 isEqual:v7] && v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v17 = v7;

  [v17 isEqual:v17];
  v10 = v17;
LABEL_11:
  v18 = +[NSMutableDictionary dictionary];
  BOOL v19 = +[NRMutableDevice diffsToActivate:0 withDate:v11];
  [v18 addEntriesFromDictionary:v19];

  v20 = +[NRMutableDevice diffsToClearStatusCodeAndCompatibilityState];
  [v18 addEntriesFromDictionary:v20];

  id v21 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v18];
  id v22 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v21 andChangeType:1];
  [v9 setObject:v22 forKeyedSubscript:v10];

LABEL_12:
  if ([v9 count]) {
    v23 = v9;
  }
  else {
    v23 = 0;
  }
  id v24 = v23;

  return v24;
}

- (id)getLocalPairingStorePairingID:(id)a3
{
  id v3 = a3;
  id v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v5 = [v4 objectAtIndex:0];
  BOOL v6 = [v5 stringByAppendingPathComponent:@"DeviceRegistry"];

  id v7 = [v3 UUIDString];

  id v8 = [v6 stringByAppendingPathComponent:v7];

  return v8;
}

- (id)makeLocalPairingStorePairingID:(id)a3
{
  id v3 = [(EPSagaTransactionExtensiblePairing *)self getLocalPairingStorePairingID:a3];
  id v4 = +[NSFileManager defaultManager];
  id v12 = 0;
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v6 = v12;

  if (v5)
  {
    id v7 = v3;
  }
  else
  {
    id v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000FCB9C((uint64_t)v3, (uint64_t)v6, v10);
      }
    }
    id v7 = 0;
  }

  return v7;
}

- (void)activateDevice:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EPSagaTransactionExtensiblePairing *)self registry];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000EF6FC;
  v11[3] = &unk_100166238;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 grabRegistryWithWriteBlockAsync:v11];
}

- (void)sendXPCOOBKeyChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(EPSagaTransactionExtensiblePairing *)self registry];
  [v5 sendXPCOOBKeyChanged:v4];
}

- (id)_pathToNanoRegistryStateDirectory
{
  return +[NRDataFilePaths _pathToNanoRegistryStateDirectory];
}

- (void)deleteUnexpectedIDSPairedDevices
{
  id v2 = [(EPSagaTransactionExtensiblePairing *)self registry];
  [v2 deleteUnexpectedIDSPairedDevices];
}

- (void)createDeviceFromPairingRequest:(id)a3 discoveredBy:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  id v11 = [WeakRetained objectForKeyedSubscript:@"extensiblePairingDeviceID"];

  id v12 = nr_daemon_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    v14 = nr_daemon_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = v8;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "createDeviceFromPairingRequest: advertisedName: %{public}@, pairingID: %{public}@", buf, 0x16u);
    }
  }
  id v15 = [(EPSagaTransactionExtensiblePairing *)self registry];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000EFA1C;
  v19[3] = &unk_100169DE8;
  v19[4] = self;
  id v20 = v8;
  id v22 = v9;
  unint64_t v23 = a4;
  id v21 = v11;
  id v16 = v9;
  id v17 = v11;
  id v18 = v8;
  [v15 xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:v18 completion:v19];
}

- (void)updateNRMutableDeviceFromEPDevice:(id)a3 withNRUUID:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  id v12 = v11;
  if (!v11)
  {
    BOOL v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "updateNRMutableDeviceFromEPDevice: Received nil uuid, making up a whole new one", buf, 2u);
    }

    id v12 = objc_opt_new();
  }
  v14 = [v8 name];
  id v15 = nr_daemon_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    id v17 = nr_daemon_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v8 name];
      advertisedName = self->_advertisedName;
      *(_DWORD *)buf = 138544130;
      v36 = v18;
      __int16 v37 = 2114;
      v38 = advertisedName;
      __int16 v39 = 2114;
      id v40 = v11;
      __int16 v41 = 2114;
      v42 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "updateNRMutableDeviceFromEPDevice: EPDeviceAdvertisedName: %{public}@, _advertisedName: %{public}@, NRUUID: %{public}@, pairingID: %{public}@", buf, 0x2Au);
    }
  }
  if (!v14) {
    v14 = self->_advertisedName;
  }
  id v20 = [v8 uuid];
  id v21 = [v8 btAddress];
  id v22 = [(EPSagaTransactionExtensiblePairing *)self registry];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000F055C;
  v28[3] = &unk_100169DC0;
  v29 = v14;
  id v30 = v12;
  id v31 = v20;
  id v32 = v21;
  id v33 = v10;
  uint64_t v34 = -30;
  id v23 = v10;
  id v24 = v21;
  id v25 = v20;
  id v26 = v12;
  v27 = v14;
  [v22 grabRegistryWithWriteBlockAsync:v28];
}

- (void)sendXPCDeviceNeedsPasscodeMessage:(id)a3 passcode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EPSagaTransactionExtensiblePairing *)self registry];
  [v8 sendXPCDeviceNeedsPasscodeMessage:v7 passcode:v6];
}

- (void)getPairedPairingIDForBluetoothID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EPSagaTransactionExtensiblePairing *)self registry];
  [v8 getPairedPairingIDForBluetoothID:v7 completion:v6];
}

- (void)createLocalPairingStore:(id)a3 andNotifyPairingBeginning:(BOOL)a4 withBlock:(id)a5
{
}

- (void)createLocalPairingStore:(id)a3 andNotifyPairingBeginning:(BOOL)a4 bluetoothIdentifier:(id)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = [(EPSagaTransactionExtensiblePairing *)self registry];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F0E50;
  v17[3] = &unk_100169E10;
  id v18 = v10;
  BOOL v19 = self;
  BOOL v22 = a4;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v13 grabRegistryWithWriteBlockAsync:v17];
}

- (NRPairingReport)pairingReport
{
  id v2 = [(EPSagaTransactionExtensiblePairing *)self unpairHelper];
  id v3 = [v2 pairingReport];

  return (NRPairingReport *)v3;
}

- (void)savePairingReport
{
  id v2 = [(EPSagaTransactionExtensiblePairing *)self unpairHelper];
  [v2 savePairingReport];
}

- (void)setPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [[EPSagaOperandUUID alloc] initWithUUID:v4];

  self = (EPSagaTransactionExtensiblePairing *)((char *)self + 48);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  id v7 = [WeakRetained operands];
  [v7 setObject:v5 forKeyedSubscript:@"extensiblePairingDeviceID"];

  id v8 = objc_loadWeakRetained((id *)&self->super.isa);
  [v8 persist];
}

- (void)filePairingReport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  id v5 = [WeakRetained objectForKeyedSubscript:@"extensiblePairingDeviceID"];

  id v4 = [(EPSagaTransactionExtensiblePairing *)self unpairHelper];
  [v4 filePairingReportWithPairingID:v5];
}

- (void)unpairDeviceWithPairingID:(id)a3 obliterationString:(id)a4 shouldBrick:(id)a5 storeUnpair:(id)a6 migrationUnpair:(id)a7 shouldPreserveESim:(id)a8 pairingReport:(id)a9 remoteUnpairRequestUUID:(id)a10 shouldConnectionWithDevice:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = +[NRQueue registryDaemonQueue];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000F15C0;
  v34[3] = &unk_100169E38;
  v34[4] = self;
  id v35 = v17;
  id v36 = v18;
  id v37 = v19;
  id v38 = v20;
  id v39 = v21;
  id v40 = v22;
  id v41 = v23;
  id v42 = v24;
  BOOL v43 = a11;
  id v26 = v24;
  id v27 = v23;
  id v28 = v22;
  id v29 = v21;
  id v30 = v20;
  id v31 = v19;
  id v32 = v18;
  id v33 = v17;
  [v25 dispatchAsync:v34];
}

- (void)pairingCompleted
{
  p_routingSlipEntry = &self->_routingSlipEntry;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  id v5 = [WeakRetained objectForKeyedSubscript:@"extensiblePairingDeviceID"];

  id v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 UUIDString];
      int v18 = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "EPSagaTransactionExtensiblePairing: Pairing is done for %{public}@.", (uint8_t *)&v18, 0xCu);
    }
  }
  id v10 = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  [v10 removeService:self->_extensiblePair];

  id v11 = [(EPSagaTransactionExtensiblePairing *)self pairingReport];
  if ([v11 isErrorSet])
  {
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)p_routingSlipEntry);
    BOOL v13 = [v12 errors];
    id v14 = [v13 count];

    if (!v14)
    {
      [(EPSagaTransactionExtensiblePairing *)self transactionDidComplete];
      id v15 = [(EPSagaTransactionExtensiblePairing *)self registry];
      id v16 = [v15 mirrorOfActiveDevice];
      [(EPSagaTransactionExtensiblePairing *)self copyPropertiesToRTCReporter:v16];

      id v17 = [(EPSagaTransactionExtensiblePairing *)self unpairHelper];
      [v17 addToOrCapOffRTCPairingMetric:0];

      goto LABEL_9;
    }
  }
  [(EPSagaTransactionExtensiblePairing *)self cancelWithError:0];
LABEL_9:
}

- (void)updateRegistryForUnpairing:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = [(EPSagaTransactionExtensiblePairing *)self pairingReport];
    id v10 = [(EPSagaTransactionExtensiblePairing *)self registry];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000F1940;
    v13[3] = &unk_100169E60;
    id v14 = v9;
    id v15 = v6;
    id v16 = self;
    id v17 = v8;
    id WeakRetained = v9;
    [v10 grabRegistryWithWriteBlockAsync:v13];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
    id v12 = [WeakRetained queue];
    dispatch_async(v12, v8);

    goto LABEL_5;
  }
LABEL_6:
}

- (void)_cleanUpDiscoveredDevicesWithCollection:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v5 objectForKeyedSubscript:v10];
        if (([v11 isActive] & 1) == 0
          && ([v11 isPaired] & 1) == 0
          && ([v11 isArchived] & 1) == 0)
        {
          id v12 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:0 andChangeType:2];
          [v4 setObject:v12 forKeyedSubscript:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [objc_alloc((Class)NRDeviceCollectionDiff) initWithDeviceCollectionDiffDeviceDiffs:v4];
  id v14 = [v5 applyDiff:v13];
}

- (BOOL)isInternalInstall
{
  id v2 = [(EPSagaTransactionExtensiblePairing *)self registry];
  unsigned __int8 v3 = [v2 isInternalInstall];

  return v3;
}

- (void)pushVersion4CompatibilityMessageIfNeeded
{
  id v2 = [(EPSagaTransactionExtensiblePairing *)self registry];
  [v2 pushVersion4CompatibilityMessageIfNeeded];
}

- (void)sendXPCBTPairRequestMessage:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v6 UUIDString];
      *(_DWORD *)buf = 138543362;
      id v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sendXPCBTPairRequestMessage: pairingID=%{public}@, adding EPSagaOperandExtensiblePairingStartedKey to operands", buf, 0xCu);
    }
  }
  id v12 = [[EPSagaOperandNumber alloc] initWithNumber:&__kCFBooleanTrue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  id v14 = [WeakRetained operands];
  [v14 setObject:v12 forKeyedSubscript:@"pairingStarted"];

  id v15 = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  [v15 persist];

  long long v16 = [(EPSagaTransactionExtensiblePairing *)self registry];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000F2014;
  v19[3] = &unk_100166A68;
  id v20 = v6;
  id v21 = v7;
  id v17 = v7;
  id v18 = v6;
  [v16 grabRegistryWithWriteBlockAsync:v19];
}

- (void)voidIDSServices
{
  unsigned __int8 v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Suspending IDS services A and C.", v6, 2u);
    }
  }
  [(EPSagaTransactionExtensiblePairing *)self voidIDSService:objc_opt_class()];
  [(EPSagaTransactionExtensiblePairing *)self voidIDSService:objc_opt_class()];
}

- (void)voidIDSService:(Class)a3
{
  p_serviceRegistry = &self->_serviceRegistry;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v7 = [WeakRetained optionalServiceFromClass:a3];

  id v6 = objc_loadWeakRetained((id *)p_serviceRegistry);
  [v6 removeService:v7];

  [v7 invalidate];
}

- (void)invalidate
{
  [(EPSagaTransactionExtensiblePairing *)self initializeAllIDSChannelsBlock:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  id v6 = [WeakRetained optionalServiceFromClass:objc_opt_class()];

  id v4 = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  [v4 removeService:v6];

  id v5 = objc_loadWeakRetained((id *)&self->_serviceRegistry);
  [v5 removeService:self];
}

- (void)copyPropertiesToRTCReporter:(id)a3
{
  id v3 = a3;
  id v7 = [v3 objectForKeyedSubscript:@"systemBuildVersion"];
  id v4 = [v3 objectForKeyedSubscript:@"hwModelStr"];

  id v5 = +[NRRTCPairingReporter sharedInstance];
  [v5 setGizmoHW:v4];

  id v6 = +[NRRTCPairingReporter sharedInstance];
  [v6 setGizmoBuild:v7];
}

- (void)initializeAllIDSChannelsBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(EPSagaTransactionExtensiblePairing *)self registry];
  [v5 initializeAllIDSChannelsBlock:v4];
}

- (void)invalidateIDSChannels
{
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating all IDS channels.", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = [(EPSagaTransactionExtensiblePairing *)self registry];
  [v8 invalidateIDSChannels];
}

- (NSUUID)pairingID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);
  id v3 = [WeakRetained objectForKeyedSubscript:@"extensiblePairingDeviceID"];

  return (NSUUID *)v3;
}

- (id)unpairHelper
{
  unpairHelper = self->_unpairHelper;
  if (!unpairHelper)
  {
    BOOL v4 = objc_alloc_init(EPSagaUnpairHelper);
    id v5 = self->_unpairHelper;
    self->_unpairHelper = v4;

    [(EPSagaUnpairHelper *)self->_unpairHelper setDelegate:self];
    unpairHelper = self->_unpairHelper;
  }

  return unpairHelper;
}

- (id)routingSlipEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipEntry);

  return WeakRetained;
}

- (EPServiceRegistry)serviceRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceRegistry);

  return (EPServiceRegistry *)WeakRetained;
}

- (id)routingSlipEntryPairingIDKey
{
  return @"extensiblePairingDeviceID";
}

- (id)routingSlipEntryPairingStartedIDKey
{
  return @"pairingStarted";
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setServiceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceRegistry);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unpairHelper, 0);
  objc_destroyWeak((id *)&self->_routingSlipEntry);
  objc_storeStrong((id *)&self->_advertisedName, 0);
  objc_storeStrong((id *)&self->_nrFeatureFlags, 0);
  objc_storeStrong((id *)&self->_networkRelayPair, 0);

  objc_storeStrong((id *)&self->_extensiblePair, 0);
}

@end