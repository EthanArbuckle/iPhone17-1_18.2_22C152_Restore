@interface WPDClient
+ (BOOL)enableScanAdvertVouchers;
+ (NSMutableSet)unknownUseCases;
+ (NSSet)approvedBundleIDs;
+ (NSSet)approvedProcesses;
+ (void)generateStateDump;
+ (void)initialize;
- (BOOL)canDisableScans;
- (BOOL)entitledForObjectDiscovery;
- (BOOL)entitledForRanging;
- (BOOL)entitledForZones;
- (BOOL)isObjectDiscovery;
- (BOOL)isTestModeClient;
- (BOOL)pendingSent;
- (BOOL)portTickled;
- (BOOL)registered;
- (BOOL)scanDenylisted;
- (BOOL)scansOff;
- (BOOL)supportsObjectDiscovery;
- (BOOL)supportsRanging;
- (NSMutableDictionary)advertTimerState;
- (NSMutableDictionary)advertTimers;
- (NSMutableDictionary)connectionTimer;
- (NSMutableDictionary)connections;
- (NSMutableDictionary)scanTimers;
- (NSMutableSet)endpointsSet;
- (NSMutableSet)lePipePeersSet;
- (NSString)bundleID;
- (NSString)clientTypeString;
- (NSString)description;
- (NSString)machName;
- (NSString)processName;
- (NSUUID)clientUUID;
- (NSUUID)identifier;
- (NSXPCConnection)conn;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)serverQueue;
- (OS_voucher)advertVoucher;
- (OS_voucher)scanVoucher;
- (WPDAdvertisingManager)advertisingManager;
- (WPDClient)initWithXPCConnection:(id)a3 server:(id)a4;
- (WPDClientDelegate)delegate;
- (WPDObjectDiscoveryManager)objectDiscoveryManager;
- (WPDPipeManager)pipeManager;
- (WPDScanManager)scanManager;
- (WPDZoneManager)zoneManager;
- (WPDaemonServer)server;
- (double)advTimeout;
- (double)scanTimeout;
- (id)connectionForUUID:(id)a3;
- (id)getManager;
- (int)processID;
- (int64_t)holdVouchers;
- (void)_signpostBegin;
- (void)_signpostEnd;
- (void)addCharacteristic:(id)a3 forService:(id)a4;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)advertisingPendingOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfTypeAt:(unsigned __int8)a3;
- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4;
- (void)anyDiscoveredDevice:(id)a3;
- (void)cancelConnectionTimer:(id)a3;
- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6;
- (void)checkAllowDuplicates:(id)a3;
- (void)checkEntitlements;
- (void)clearDuplicateFilterCache:(id)a3;
- (void)clearDuplicateFilterCache_async:(id)a3;
- (void)connectToPeer:(id)a3 withOptions:(id)a4;
- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5;
- (void)connectedDeviceOverLEPipe:(id)a3;
- (void)createdConnection:(id)a3;
- (void)dealloc;
- (void)destroy;
- (void)destroy_async;
- (void)disableScanning;
- (void)disconnectFromPeer:(id)a3;
- (void)disconnectedDeviceOverLEPipe:(id)a3 withError:(id)a4;
- (void)disconnectedPeer:(id)a3 error:(id)a4;
- (void)discoverCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4;
- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4;
- (void)discoveredDevice:(id)a3;
- (void)discoveredDevices:(id)a3;
- (void)dumpDaemonState;
- (void)enableRanging:(BOOL)a3 reply:(id)a4;
- (void)enableTestMode;
- (void)endTestMode;
- (void)enteredZone:(id)a3 manufacturerData:(id)a4;
- (void)exitedZone:(id)a3;
- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)getAllTrackedZones;
- (void)getPowerLogStats:(id)a3;
- (void)isRangingEnabledReply:(id)a3;
- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)notifyClientStateChange:(int64_t)a3 Restricted:(BOOL)a4;
- (void)overrideAdvTimeout:(double)a3;
- (void)overrideScanTimeout:(double)a3;
- (void)peerTrackingAvailable;
- (void)peerTrackingFull;
- (void)queueBlock:(id)a3;
- (void)rangingEnabled:(BOOL)a3 withError:(id)a4;
- (void)readyForDataTransfer;
- (void)receivedData:(id)a3 fromCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6;
- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5;
- (void)receivedTestResponse:(id)a3;
- (void)registerEndpoint:(id)a3 requireAck:(BOOL)a4 requireEncryption:(BOOL)a5;
- (void)registerForAnyScanResults:(BOOL)a3;
- (void)registerWithDaemon:(id)a3 forProcess:(id)a4 machName:(id)a5 holdVouchers:(int64_t)a6;
- (void)resetConnection;
- (void)resumeCommunicationWithConnection:(id)a3 andProcessID:(int)a4;
- (void)sendDataToCharacteristic:(id)a3 inService:(id)a4 forPeer:(id)a5;
- (void)sendDatatoLePipe:(id)a3 forPeer:(id)a4;
- (void)sendRegisteredWithDaemonAndContinuingSession:(BOOL)a3;
- (void)sendTestRequest:(id)a3;
- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7;
- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6;
- (void)setAdvTimeout:(double)a3;
- (void)setAdvertTimerState:(id)a3;
- (void)setAdvertTimers:(id)a3;
- (void)setAdvertVoucher:(id)a3;
- (void)setAdvertisingManager:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCanDisableScans:(BOOL)a3;
- (void)setClientTypeString:(id)a3;
- (void)setClientUUID:(id)a3;
- (void)setConn:(id)a3;
- (void)setConnectionTimer:(id)a3;
- (void)setConnections:(id)a3;
- (void)setEndpointsSet:(id)a3;
- (void)setEntitledForObjectDiscovery:(BOOL)a3;
- (void)setEntitledForRanging:(BOOL)a3;
- (void)setEntitledForZones:(BOOL)a3;
- (void)setHoldVouchers:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsObjectDiscovery:(BOOL)a3;
- (void)setIsTestModeClient:(BOOL)a3;
- (void)setLePipePeersSet:(id)a3;
- (void)setMachName:(id)a3;
- (void)setMessageQueue:(id)a3;
- (void)setObjectDiscoveryManager:(id)a3;
- (void)setPendingSent:(BOOL)a3;
- (void)setPipeManager:(id)a3;
- (void)setPortTickled:(BOOL)a3;
- (void)setProcessID:(int)a3;
- (void)setProcessName:(id)a3;
- (void)setRegistered:(BOOL)a3;
- (void)setScanDenylisted:(BOOL)a3;
- (void)setScanManager:(id)a3;
- (void)setScanTimeout:(double)a3;
- (void)setScanTimers:(id)a3;
- (void)setScanVoucher:(id)a3;
- (void)setScansOff:(BOOL)a3;
- (void)setZoneManager:(id)a3;
- (void)setupConnection;
- (void)shouldSubscribe:(BOOL)a3 toPeer:(id)a4 withCharacteristic:(id)a5 inService:(id)a6;
- (void)startAdvertising:(id)a3;
- (void)startAdvertising:(id)a3 reply:(id)a4;
- (void)startAdvertising_async:(id)a3;
- (void)startScanning:(id)a3;
- (void)startScanning_async:(id)a3;
- (void)startTrackingPeerWithRequest:(id)a3;
- (void)startTrackingZone:(id)a3;
- (void)stopAdvertising:(id)a3;
- (void)stopAdvertising_async:(id)a3;
- (void)stopScanning:(id)a3;
- (void)stopScanning_async:(id)a3;
- (void)stopScans;
- (void)stopTrackingAllZones;
- (void)stopTrackingPeerWithRequest:(id)a3;
- (void)stopTrackingZones:(id)a3;
- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)tickleMachPort;
- (void)unregisterEndpoint:(id)a3;
- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6;
- (void)verifyApprovedUseCase;
@end

@implementation WPDClient

- (void)discoveredDevice:(id)a3
{
  id v4 = a3;
  v5 = [(WPDClient *)self serverQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__WPDClient_discoveredDevice___block_invoke;
  v7[3] = &unk_26469ADA0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)serverQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverQueue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

void __30__WPDClient_startAdvertising___block_invoke_606(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "startAdvertising_async:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

void __29__WPDClient_stopAdvertising___block_invoke_652(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "stopAdvertising_async:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)stopAdvertising_async:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WPDClient *)self registered])
  {
    uint64_t v5 = [v4 clientType];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_654);
    }
    id v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      id v8 = [(WPDClient *)self processName];
      *(_DWORD *)buf = 138543874;
      v31 = v8;
      __int16 v32 = 1024;
      int v33 = [(WPDClient *)self processID];
      __int16 v34 = 2048;
      uint64_t v35 = v5;
      _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "Stop advertising for process %{public}@ (%d) of type %ld", buf, 0x1Cu);
    }
    v9 = [(WPDClient *)self advertTimers];
    v10 = [NSNumber numberWithUnsignedChar:v5];
    v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      v12 = [(WPDClient *)self advertTimers];
      v13 = [NSNumber numberWithUnsignedChar:v5];
      v14 = [v12 objectForKeyedSubscript:v13];
      dispatch_source_cancel(v14);

      v15 = [(WPDClient *)self advertTimers];
      v16 = [NSNumber numberWithUnsignedChar:v5];
      [v15 setObject:0 forKeyedSubscript:v16];
    }
    if (v5 == 18)
    {
      v17 = [(WPDClient *)self objectDiscoveryManager];

      if (!v17)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_657);
        }
        v26 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDClient stopAdvertising_async:](v26);
        }
        v27 = (void *)MEMORY[0x263F087E8];
        uint64_t v28 = *MEMORY[0x263F08320];
        v29 = @"ObjectDiscovery advertising is not supported on this platform.";
        v20 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v22 = [v27 errorWithDomain:@"WPErrorDomain" code:27 userInfo:v20];
        goto LABEL_17;
      }
      uint64_t v18 = [(WPDClient *)self objectDiscoveryManager];
    }
    else
    {
      uint64_t v18 = [(WPDClient *)self advertisingManager];
    }
    v20 = (void *)v18;
    v21 = [(WPDClient *)self clientUUID];
    v22 = [v20 removeAdvertisingRequest:v4 forClient:v21];

LABEL_17:
    if (v22)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_660);
      }
      v23 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient stopAdvertising_async:](v23);
      }
    }
    else
    {
      v24 = [(WPDClient *)self conn];
      v25 = [v24 remoteObjectProxy];
      objc_msgSend(v25, "advertisingStoppedOfType:withError:", objc_msgSend(v4, "clientType"), 0);

      [(WPDClient *)self setPendingSent:0];
    }

    goto LABEL_24;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_663);
  }
  v19 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDClient stopAdvertising_async:](v19);
  }
LABEL_24:
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_665);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = [(WPDClient *)self processName];
    int v21 = 138412802;
    v22 = v7;
    __int16 v23 = 1024;
    int v24 = [(WPDClient *)self processID];
    __int16 v25 = 2048;
    uint64_t v26 = v3;
    _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "Advertising started for client %@ (%d) of type %ld", (uint8_t *)&v21, 0x1Cu);
  }
  id v8 = [(WPDClient *)self advertTimers];
  v9 = [NSNumber numberWithUnsignedChar:v3];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  if (!v10) {
    goto LABEL_8;
  }
  v11 = (void *)v10;
  v12 = [(WPDClient *)self advertTimerState];
  v13 = [NSNumber numberWithUnsignedChar:v3];
  v14 = [v12 objectForKeyedSubscript:v13];
  char v15 = [v14 BOOLValue];

  if ((v15 & 1) == 0)
  {
    v16 = [(WPDClient *)self advertTimers];
    v17 = [NSNumber numberWithUnsignedChar:v3];
    uint64_t v18 = [v16 objectForKeyedSubscript:v17];
    dispatch_resume(v18);

    id v8 = [(WPDClient *)self advertTimerState];
    v9 = [NSNumber numberWithUnsignedChar:v3];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v9];
LABEL_8:
  }
  [(WPDClient *)self setPendingSent:0];
  v19 = [(WPDClient *)self conn];
  v20 = [v19 remoteObjectProxy];
  [v20 advertisingStartedOfType:v3];
}

- (void)setPendingSent:(BOOL)a3
{
  self->_pendingSent = a3;
}

- (NSMutableDictionary)advertTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

void __27__WPDClient_startScanning___block_invoke_693(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "startScanning_async:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)startScanning_async:(id)a3
{
  v75[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 clientType];
  if (![(WPDClient *)self registered])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_695);
    }
    uint64_t v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient startScanning_async:].cold.6(v10, self);
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v74 = *MEMORY[0x263F08320];
    v75[0] = @"The client is currently not registered with the daemon";
    id v8 = [NSDictionary dictionaryWithObjects:v75 forKeys:&v74 count:1];
    uint64_t v9 = [v11 errorWithDomain:@"WPErrorDomain" code:2 userInfo:v8];
    goto LABEL_13;
  }
  if ([(WPDClient *)self scansOff])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_701);
    }
    id v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient startScanning_async:](v6, self);
    }
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v72 = *MEMORY[0x263F08320];
    v73 = @"The client is currently denylisted";
    id v8 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"WPErrorDomain" code:2 userInfo:v8];
LABEL_13:
    v12 = (void *)v9;

LABEL_14:
    v13 = [(WPDClient *)self conn];
    v14 = [v13 remoteObjectProxy];
    [v14 scanningFailedToStart:v12 ofType:v5];

    goto LABEL_15;
  }
  if (v5 == 18)
  {
    if (![(WPDClient *)self entitledForObjectDiscovery])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_707);
      }
      v51 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient startScanning_async:].cold.5(v51, self);
      }
      v52 = (void *)MEMORY[0x263F087E8];
      uint64_t v70 = *MEMORY[0x263F08320];
      v71 = @"The client is not entitled to scan for ObjectDiscovery";
      id v8 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      uint64_t v9 = [v52 errorWithDomain:@"WPErrorDomain" code:10 userInfo:v8];
      goto LABEL_13;
    }
    if (![(WPDClient *)self supportsObjectDiscovery])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_713);
      }
      v54 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient startScanning_async:].cold.4(v54, self);
      }
      v55 = (void *)MEMORY[0x263F087E8];
      uint64_t v68 = *MEMORY[0x263F08320];
      v69 = @"ObjectDiscovery not supported on this platform";
      id v8 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      uint64_t v9 = [v55 errorWithDomain:@"WPErrorDomain" code:10 userInfo:v8];
      goto LABEL_13;
    }
  }
  char v15 = [(WPDClient *)self scanManager];

  if (!v15)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_719);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient startScanning_async:]();
    }
    v53 = (void *)MEMORY[0x263F087E8];
    uint64_t v66 = *MEMORY[0x263F08320];
    v67 = @"WPDScanManager is nil";
    id v8 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    uint64_t v9 = [v53 errorWithDomain:@"WPErrorDomain" code:10 userInfo:v8];
    goto LABEL_13;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_725);
  }
  v16 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    uint64_t v18 = [(WPDClient *)self processName];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [(WPDClient *)self processID];
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v4;
    _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "Start scanning for process %{public}@ (%d) with %{public}@", buf, 0x1Cu);
  }
  v19 = [(WPDClient *)self scanManager];
  v20 = [(WPDClient *)self clientUUID];
  v12 = [v19 addScanRequest:v4 forClient:v20];

  [v4 clientType];
  kdebug_trace();
  if (v12) {
    goto LABEL_14;
  }
  if (v5 == 18)
  {
    int v21 = [(WPDClient *)self objectDiscoveryManager];
    BOOL v22 = v21 == 0;

    if (!v22)
    {
      __int16 v23 = [(WPDClient *)self objectDiscoveryManager];
      int v24 = [(WPDClient *)self clientUUID];
      __int16 v25 = [v23 addScanRequest:v4 forClient:v24];

      if (v25)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_728);
        }
        uint64_t v26 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDClient startScanning_async:](v26, v25);
        }
      }
    }
  }
  [v4 updateTime];
  uint64_t v28 = v27;
  if ([(WPDClient *)self isTestModeClient])
  {
    [(WPDClient *)self scanTimeout];
    if (v29 != 0.0)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_731);
      }
      v30 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        [(WPDClient *)self scanTimeout];
        uint64_t v33 = v32;
        __int16 v34 = [(WPDClient *)self clientTypeString];
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v34;
        _os_log_impl(&dword_22316D000, v31, OS_LOG_TYPE_DEFAULT, "Setting scan update time to %f for %@", buf, 0x16u);
      }
      [(WPDClient *)self scanTimeout];
      uint64_t v28 = v35;
    }
  }
  uint64_t v36 = [(WPDClient *)self scanTimers];
  v37 = [NSNumber numberWithUnsignedChar:v5];
  v38 = [v36 objectForKeyedSubscript:v37];

  if (v38)
  {
    v39 = [(WPDClient *)self scanTimers];
    v40 = [NSNumber numberWithUnsignedChar:v5];
    v41 = [v39 objectForKeyedSubscript:v40];
    dispatch_source_cancel(v41);

    v42 = [(WPDClient *)self scanTimers];
    v43 = [NSNumber numberWithUnsignedChar:v5];
    [v42 setObject:0 forKeyedSubscript:v43];
  }
  if (*(double *)&v28 > 0.0)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_734);
    }
    v44 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v28;
      _os_log_impl(&dword_22316D000, v44, OS_LOG_TYPE_DEFAULT, "Setting scan timer for type %d with time %.2f ", buf, 0x12u);
    }
    v45 = [(WPDClient *)self serverQueue];
    v46 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v45);

    dispatch_time_t v47 = dispatch_time(0, (uint64_t)(*(double *)&v28 * 1000000000.0));
    dispatch_source_set_timer(v46, v47, 0xFFFFFFFFFFFFFFFFLL, 0);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    v58 = __33__WPDClient_startScanning_async___block_invoke_735;
    v59 = &unk_26469AF78;
    char v64 = v5;
    v63[1] = v28;
    v48 = v46;
    v60 = v48;
    objc_copyWeak(v63, (id *)buf);
    id v61 = v4;
    v62 = self;
    dispatch_source_set_event_handler(v48, &v56);
    v49 = [(WPDClient *)self scanTimers];
    v50 = [NSNumber numberWithUnsignedChar:v5];
    [v49 setObject:v48 forKeyedSubscript:v50];

    dispatch_resume(v48);
    objc_destroyWeak(v63);

    objc_destroyWeak((id *)buf);
  }
  v12 = [(WPDClient *)self conn];
  v13 = [v12 remoteObjectProxy];
  [v13 scanningStartedOfType:v5];
LABEL_15:
}

- (WPDScanManager)scanManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanManager);
  return (WPDScanManager *)WeakRetained;
}

- (void)startAdvertising_async:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(WPDClient *)self registered])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_649);
    }
    v43 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient startAdvertising_async:](v43, self);
    }
    v42 = 0;
    goto LABEL_39;
  }
  uint64_t v5 = [v4 clientType];
  [v4 updateTime];
  v7 = v6;
  if ([(WPDClient *)self isTestModeClient])
  {
    [(WPDClient *)self advTimeout];
    if (v8 != 0.0)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_608);
      }
      uint64_t v9 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v9;
        [(WPDClient *)self advTimeout];
        uint64_t v12 = v11;
        v13 = [(WPDClient *)self clientTypeString];
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEFAULT, "Setting advert update time to %f for %@", buf, 0x16u);
      }
      [(WPDClient *)self advTimeout];
      v7 = v14;
    }
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_611);
  }
  char v15 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = [(WPDClient *)self processName];
    int v18 = [(WPDClient *)self processID];
    uint64_t v19 = [v4 advertisingRate];
    uint64_t v20 = [v4 advertisingRate];
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v18;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v5;
    __int16 v59 = 2048;
    uint64_t v60 = v19;
    __int16 v61 = 2048;
    double v62 = (double)v20 * 0.625;
    _os_log_impl(&dword_22316D000, v16, OS_LOG_TYPE_DEFAULT, "Start advertising for process %{public}@ (%d) of type %ld with advertising interval %ld (%.2f ms)", buf, 0x30u);
  }
  if (*(double *)&v7 > 0.0)
  {
    int v21 = [(WPDClient *)self advertTimers];
    BOOL v22 = [NSNumber numberWithUnsignedChar:v5];
    __int16 v23 = [v21 objectForKeyedSubscript:v22];

    if (v23)
    {
      int v24 = [(WPDClient *)self advertTimers];
      __int16 v25 = [NSNumber numberWithUnsignedChar:v5];
      uint64_t v26 = [v24 objectForKeyedSubscript:v25];
      dispatch_source_cancel(v26);

      uint64_t v27 = [(WPDClient *)self advertTimers];
      uint64_t v28 = [NSNumber numberWithUnsignedChar:v5];
      [v27 setObject:0 forKeyedSubscript:v28];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_615);
      }
      double v29 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDClient startAdvertising_async:](v5, v29);
      }
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_618);
    }
    v30 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v7;
      _os_log_impl(&dword_22316D000, v30, OS_LOG_TYPE_DEFAULT, "Setting advert timer for client %d with time %.2f ", buf, 0x12u);
    }
    v31 = [(WPDClient *)self serverQueue];
    uint64_t v32 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v31);

    dispatch_time_t v33 = dispatch_time(0, (uint64_t)(*(double *)&v7 * 1000000000.0));
    dispatch_source_set_timer(v32, v33, 0xFFFFFFFFFFFFFFFFLL, 0);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    uint64_t v47 = MEMORY[0x263EF8330];
    uint64_t v48 = 3221225472;
    v49 = __36__WPDClient_startAdvertising_async___block_invoke_619;
    v50 = &unk_26469AF78;
    char v55 = v5;
    v54[1] = v7;
    __int16 v34 = v32;
    v51 = v34;
    objc_copyWeak(v54, (id *)buf);
    id v52 = v4;
    v53 = self;
    dispatch_source_set_event_handler(v34, &v47);
    uint64_t v35 = [(WPDClient *)self advertTimerState];
    uint64_t v36 = [NSNumber numberWithUnsignedChar:v5];
    [v35 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v36];

    v37 = [(WPDClient *)self advertTimers];
    v38 = [NSNumber numberWithUnsignedChar:v5];
    [v37 setObject:v34 forKeyedSubscript:v38];

    objc_destroyWeak(v54);
    objc_destroyWeak((id *)buf);
  }
  if (v5 == 18)
  {
    v39 = [(WPDClient *)self objectDiscoveryManager];

    if (v39)
    {
      v40 = [(WPDClient *)self objectDiscoveryManager];
      v41 = [(WPDClient *)self clientUUID];
      v42 = [v40 addAdvertisingRequest:v4 forClient:v41];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_641);
      }
      v45 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient startAdvertising_async:](v45, self);
      }
      v46 = (void *)MEMORY[0x263F087E8];
      uint64_t v56 = *MEMORY[0x263F08320];
      uint64_t v57 = @"ObjectDiscovery advertising is not supported on this platform.";
      v40 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      v42 = [v46 errorWithDomain:@"WPErrorDomain" code:27 userInfo:v40];
    }
  }
  else
  {
    v40 = [(WPDClient *)self advertisingManager];
    v44 = [(WPDClient *)self clientUUID];
    v42 = [v40 addAdvertisingRequest:v4 forClient:v44];
  }
  if (v42)
  {
LABEL_39:
    -[WPDClient advertisingFailedToStart:ofType:](self, "advertisingFailedToStart:ofType:", v42, [v4 clientType]);
    [(WPDClient *)self setPendingSent:0];
  }
}

void __30__WPDClient_discoveredDevice___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  id v4 = [*v2 objectForKeyedSubscript:@"kDeviceType"];
  unsigned __int8 v5 = [v4 unsignedIntegerValue];

  id v6 = [*v2 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
  kdebug_trace();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_681);
  }
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    double v8 = *(void **)(a1 + 40);
    uint64_t v9 = v7;
    uint64_t v10 = [v8 processName];
    uint64_t v11 = [*(id *)(a1 + 40) clientUUID];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v10;
    __int16 v17 = 2112;
    int v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    __int16 v21 = 1024;
    int v22 = v5;
    __int16 v23 = 2112;
    int v24 = v3;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_INFO, "Telling process %@ (%@) about discovered device (%@) of type %d with data %@", buf, 0x30u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  uint64_t v12 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __30__WPDClient_discoveredDevice___block_invoke_682;
  v13[3] = &unk_26469AD78;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = *(id *)(a1 + 32);
  [v12 queueBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)clientUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)queueBlock:(id)a3
{
  block = (void (**)(void))a3;
  id v4 = [(WPDClient *)self conn];

  if (v4) {
    goto LABEL_2;
  }
  unsigned __int8 v5 = [(WPDClient *)self machName];

  if (!v5)
  {
    [MEMORY[0x263EFF940] raise:@"No NSXPConnection" format:@"We have no active NSXPCConnection or a mach port set"];
LABEL_2:
    block[2]();
    goto LABEL_5;
  }
  [(WPDClient *)self tickleMachPort];
  id v6 = [(WPDClient *)self messageQueue];
  dispatch_async(v6, block);

LABEL_5:
}

void __30__WPDClient_discoveredDevice___block_invoke_682(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained conn];
    id v4 = [v3 remoteObjectProxy];
    [v4 deviceDiscovered:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

- (NSXPCConnection)conn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 88, 1);
}

- (int)processID
{
  return self->_processID;
}

- (BOOL)registered
{
  return self->_registered;
}

- (BOOL)isTestModeClient
{
  return self->_isTestModeClient;
}

- (WPDAdvertisingManager)advertisingManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_advertisingManager);
  return (WPDAdvertisingManager *)WeakRetained;
}

- (BOOL)scansOff
{
  return self->_scansOff;
}

- (NSMutableDictionary)scanTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)startScanning:(id)a3
{
  id v4 = a3;
  if (_enableScanAdvertVouchers && ([(WPDClient *)self holdVouchers] & 4) != 0)
  {
    id v5 = (void *)voucher_copy();
    [(WPDClient *)self setScanVoucher:v5];

    [v4 setHoldVoucher:1];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_692);
    }
    id v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDClient startScanning:](v6, self);
    }
  }
  id location = 0;
  objc_initWeak(&location, self);
  v7 = [(WPDClient *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__WPDClient_startScanning___block_invoke_693;
  block[3] = &unk_26469AD78;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)stopAdvertising:(id)a3
{
  id v4 = a3;
  if (_enableScanAdvertVouchers && ([(WPDClient *)self holdVouchers] & 8) != 0)
  {
    [(WPDClient *)self setAdvertVoucher:0];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_651);
    }
    id v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDClient stopAdvertising:](v5, self);
    }
  }
  id location = 0;
  objc_initWeak(&location, self);
  id v6 = [(WPDClient *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__WPDClient_stopAdvertising___block_invoke_652;
  block[3] = &unk_26469AD78;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)startAdvertising:(id)a3
{
  id v4 = a3;
  if (_enableScanAdvertVouchers && ([(WPDClient *)self holdVouchers] & 8) != 0)
  {
    id v5 = (void *)voucher_copy();
    [(WPDClient *)self setAdvertVoucher:v5];

    [v4 setHoldVoucher:1];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_605);
    }
    id v6 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDClient startAdvertising:](v6, self);
    }
  }
  id location = 0;
  objc_initWeak(&location, self);
  id v7 = [(WPDClient *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__WPDClient_startAdvertising___block_invoke_606;
  block[3] = &unk_26469AD78;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (int64_t)holdVouchers
{
  return self->_holdVouchers;
}

void __26__WPDClient_stopScanning___block_invoke_757(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "stopScanning_async:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)stopScanning_async:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 clientType];
  if ([(WPDClient *)self registered])
  {
    if (v5 != 18)
    {
LABEL_5:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_768);
      }
      id v6 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v6;
        id v8 = [(WPDClient *)self processName];
        int v29 = 138543874;
        v30 = v8;
        __int16 v31 = 1024;
        int v32 = [(WPDClient *)self processID];
        __int16 v33 = 2114;
        id v34 = v4;
        _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "Stop scanning for process %{public}@ (%d) with %{public}@", (uint8_t *)&v29, 0x1Cu);
      }
      id v9 = [(WPDClient *)self scanTimers];
      id v10 = [NSNumber numberWithUnsignedChar:v5];
      id v11 = [v9 objectForKeyedSubscript:v10];

      if (v11)
      {
        uint64_t v12 = [(WPDClient *)self scanTimers];
        v13 = [NSNumber numberWithUnsignedChar:v5];
        id v14 = [v12 objectForKeyedSubscript:v13];
        dispatch_source_cancel(v14);

        id v15 = [(WPDClient *)self scanTimers];
        v16 = [NSNumber numberWithUnsignedChar:v5];
        [v15 setObject:0 forKeyedSubscript:v16];
      }
      kdebug_trace();
      if (v5 == 18)
      {
        __int16 v17 = [(WPDClient *)self objectDiscoveryManager];

        if (v17)
        {
          int v18 = [(WPDClient *)self objectDiscoveryManager];
          __int16 v19 = [(WPDClient *)self clientUUID];
          [v18 removeScanRequestsForClient:v19];
        }
      }
      uint64_t v20 = [(WPDClient *)self scanManager];
      __int16 v21 = [(WPDClient *)self clientUUID];
      int v22 = [v20 removeScanRequest:v4 forClient:v21];

      if (v22)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_771);
        }
        __int16 v23 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 67109120;
          LODWORD(v30) = v5;
          _os_log_impl(&dword_22316D000, v23, OS_LOG_TYPE_DEFAULT, "Trying to stop scanning for a type %d we don't scan for", (uint8_t *)&v29, 8u);
        }
      }
      else
      {
        uint64_t v26 = [(WPDClient *)self conn];
        uint64_t v27 = [v26 remoteObjectProxy];
        [v27 scanningStoppedOfType:v5];
      }
      goto LABEL_29;
    }
    if ([(WPDClient *)self entitledForObjectDiscovery])
    {
      if ([(WPDClient *)self supportsObjectDiscovery]) {
        goto LABEL_5;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_765);
      }
      uint64_t v28 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient stopScanning_async:](v28);
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_762);
      }
      uint64_t v25 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient stopScanning_async:](v25);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_759);
    }
    int v24 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient stopScanning_async:](v5, v24);
    }
  }
LABEL_29:
}

- (void)stopScanning:(id)a3
{
  id v4 = a3;
  if (_enableScanAdvertVouchers && ([(WPDClient *)self holdVouchers] & 4) != 0)
  {
    [(WPDClient *)self setScanVoucher:0];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_756);
    }
    uint64_t v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDClient stopScanning:](v5, self);
    }
  }
  id location = 0;
  objc_initWeak(&location, self);
  id v6 = [(WPDClient *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__WPDClient_stopScanning___block_invoke_757;
  block[3] = &unk_26469AD78;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

+ (NSMutableSet)unknownUseCases
{
  if (unknownUseCases_onceToken != -1) {
    dispatch_once(&unknownUseCases_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)unknownUseCases__unknownUseCases;
  return (NSMutableSet *)v2;
}

uint64_t __28__WPDClient_unknownUseCases__block_invoke()
{
  unknownUseCases__unknownUseCases = [MEMORY[0x263EFF9C0] set];
  return MEMORY[0x270F9A758]();
}

+ (NSSet)approvedBundleIDs
{
  if (approvedBundleIDs_onceToken != -1) {
    dispatch_once(&approvedBundleIDs_onceToken, &__block_literal_global_186_0);
  }
  v2 = (void *)approvedBundleIDs__approvedBundleIDs;
  return (NSSet *)v2;
}

uint64_t __30__WPDClient_approvedBundleIDs__block_invoke()
{
  approvedBundleIDs__approvedBundleIDs = [MEMORY[0x263EFFA08] setWithArray:&unk_26D646F08];
  return MEMORY[0x270F9A758]();
}

+ (NSSet)approvedProcesses
{
  if (approvedProcesses_onceToken != -1) {
    dispatch_once(&approvedProcesses_onceToken, &__block_literal_global_189_1);
  }
  v2 = (void *)approvedProcesses__approvedProcesses;
  return (NSSet *)v2;
}

uint64_t __30__WPDClient_approvedProcesses__block_invoke()
{
  approvedProcesses__approvedProcesses = [MEMORY[0x263EFFA08] setWithArray:&unk_26D646F20];
  return MEMORY[0x270F9A758]();
}

- (void)verifyApprovedUseCase
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_22316D000, v0, OS_LOG_TYPE_FAULT, "WPDClient not approved use case: (%@)", v1, 0xCu);
}

+ (void)generateStateDump
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_461);
  }
  uint64_t v2 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id v4 = +[WPDClient unknownUseCases];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = [v4 count];
    _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: unknown use cases (%ld):", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = +[WPDClient unknownUseCases];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_464);
        }
        id v11 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v10;
          _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (BOOL)enableScanAdvertVouchers
{
  return _enableScanAdvertVouchers;
}

+ (void)initialize
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = _enableScanAdvertVouchers;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "WPDClient using custom enable scan advert vouchers: %d", (uint8_t *)v1, 8u);
}

- (WPDClient)initWithXPCConnection:(id)a3 server:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)WPDClient;
  uint64_t v9 = [(WPDClient *)&v38 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conn, a3);
    bundleID = v10->_bundleID;
    v10->_bundleID = 0;

    if (v7)
    {
      v10->_processID = [v7 processIdentifier];
      uint64_t v12 = [v7 valueForEntitlement:@"application-identifier"];
      long long v13 = v10->_bundleID;
      v10->_bundleID = (NSString *)v12;

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_475);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDClient initWithXPCConnection:server:]();
      }
    }
    else
    {
      long long v14 = [MEMORY[0x263F08AB0] processInfo];
      v10->_processID = [v14 processIdentifier];

      long long v15 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v16 = [v15 bundleIdentifier];
      __int16 v17 = v10->_bundleID;
      v10->_bundleID = (NSString *)v16;

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_480);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDClient initWithXPCConnection:server:]();
      }
    }
    objc_storeWeak((id *)&v10->_server, v8);
    uint64_t v18 = [v8 serverQueue];
    objc_storeWeak((id *)&v10->_serverQueue, v18);

    v10->_registered = 0;
    uint64_t v19 = [MEMORY[0x263F08C38] UUID];
    clientUUID = v10->_clientUUID;
    v10->_clientUUID = (NSUUID *)v19;

    *(_WORD *)&v10->_entitledForZones = 0;
    v10->_entitledForRanging = 0;
    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    connections = v10->_connections;
    v10->_connections = (NSMutableDictionary *)v21;

    v10->_pendingSent = 0;
    v10->_portTickled = 0;
    uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
    advertTimers = v10->_advertTimers;
    v10->_advertTimers = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
    advertTimerState = v10->_advertTimerState;
    v10->_advertTimerState = (NSMutableDictionary *)v25;

    uint64_t v27 = [MEMORY[0x263EFF9A0] dictionary];
    scanTimers = v10->_scanTimers;
    v10->_scanTimers = (NSMutableDictionary *)v27;

    uint64_t v29 = [MEMORY[0x263EFF9A0] dictionary];
    connectionTimer = v10->_connectionTimer;
    v10->_connectionTimer = (NSMutableDictionary *)v29;

    v10->_holdVouchers = 0;
    *(_WORD *)&v10->_isTestModeClient = 0;
    *(_WORD *)&v10->_scanDenylisted = 0;
    v10->_scanTimeout = 0.0;
    v10->_advTimeout = 0.0;
    uint64_t v31 = [MEMORY[0x263EFF9C0] set];
    lePipePeersSet = v10->_lePipePeersSet;
    v10->_lePipePeersSet = (NSMutableSet *)v31;

    uint64_t v33 = [MEMORY[0x263EFF9C0] set];
    endpointsSet = v10->_endpointsSet;
    v10->_endpointsSet = (NSMutableSet *)v33;

    *(_WORD *)&v10->_isObjectDiscovery = 256;
    v10->_supportsRanging = +[WPDaemonServer supportsRanging];
    if (initWithXPCConnection_server__onceToken != -1) {
      dispatch_once(&initWithXPCConnection_server__onceToken, &__block_literal_global_486);
    }
    scanVoucher = v10->_scanVoucher;
    v10->_scanVoucher = 0;

    advertVoucher = v10->_advertVoucher;
    v10->_advertVoucher = 0;

    [(WPDClient *)v10 setupConnection];
    [(WPDClient *)v10 checkEntitlements];
    v10->_wpDClientSignPostID = os_signpost_id_make_with_pointer((os_log_t)WiProxLog, v10);
  }

  return v10;
}

void __42__WPDClient_initWithXPCConnection_server___block_invoke_484()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  v1 = (void *)AllZeroUUID;
  AllZeroUUID = v0;

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_491);
  }
  uint64_t v2 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    __42__WPDClient_initWithXPCConnection_server___block_invoke_484_cold_1(v2);
  }
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D646F38];
  id v4 = (void *)DenylistedProcesses;
  DenylistedProcesses = v3;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_496);
  }
  uint64_t v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    uint64_t v5 = [(WPDClient *)self clientUUID];
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_INFO, "Deallocing WPDClient %@", buf, 0xCu);
  }
  uint64_t v6 = [(WPDClient *)self conn];

  if (v6)
  {
    id v7 = [(WPDClient *)self clientTypeString];
    char v8 = [v7 isEqual:@"WPATVSetup"];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(WPDClient *)self conn];
      [v9 invalidate];
    }
    [(WPDClient *)self setConn:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)WPDClient;
  [(WPDClient *)&v10 dealloc];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = [(WPDClient *)self clientUUID];
  uint64_t v5 = [(WPDClient *)self processName];
  uint64_t v6 = [(WPDClient *)self processID];
  id v7 = [(WPDClient *)self bundleID];
  char v8 = [(WPDClient *)self clientTypeString];
  uint64_t v9 = [v3 stringWithFormat:@" %@: %@ (%d) (%@) (%@) (%ld)", v4, v5, v6, v7, v8, -[WPDClient holdVouchers](self, "holdVouchers")];

  return (NSString *)v9;
}

- (void)registerWithDaemon:(id)a3 forProcess:(id)a4 machName:(id)a5 holdVouchers:(int64_t)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_506);
  }
  uint64_t v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    int v24 = v13;
    uint64_t v25 = [(WPDClient *)self clientUUID];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v25;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_debug_impl(&dword_22316D000, v24, OS_LOG_TYPE_DEBUG, "Registering with daemon client %@ type %@ for process %@", buf, 0x20u);
  }
  [(WPDClient *)self setProcessName:v11];
  [(WPDClient *)self setHoldVouchers:a6];
  [(WPDClient *)self setClientTypeString:v10];
  -[WPDClient setScanDenylisted:](self, "setScanDenylisted:", [(id)DenylistedProcesses containsObject:v11]);
  long long v14 = [(WPDClient *)self clientTypeString];
  -[WPDClient setIsObjectDiscovery:](self, "setIsObjectDiscovery:", [v14 isEqualToString:@"WPObjectDiscovery"]);

  if ([(WPDClient *)self isMemberOfClass:objc_opt_class()])
  {
    long long v15 = [(WPDClient *)self server];
    uint64_t v16 = v15;
    if (v12)
    {
      __int16 v17 = [v15 clientForMachName:v12];
      if (v17)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_515);
        }
        uint64_t v18 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = v18;
          uint64_t v20 = [(WPDClient *)self clientUUID];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_INFO, "WPDClient removing new client %@", buf, 0xCu);
        }
        uint64_t v21 = [(WPDClient *)self conn];
        objc_msgSend(v17, "resumeCommunicationWithConnection:andProcessID:", v21, -[WPDClient processID](self, "processID"));

        [v16 removeClient:self];
        goto LABEL_19;
      }
      [(WPDClient *)self setMachName:v12];
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __65__WPDClient_registerWithDaemon_forProcess_machName_holdVouchers___block_invoke_516;
    v26[3] = &unk_26469AEE0;
    objc_copyWeak(&v27, (id *)buf);
    uint64_t v23 = (void *)MEMORY[0x223CB07B0](v26);
    [v16 registerClient:self withMachName:v12 withCompletion:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
LABEL_19:

    goto LABEL_20;
  }
  [(WPDClient *)self setMachName:v12];
  [(WPDClient *)self setEntitledForObjectDiscovery:1];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_512);
  }
  int v22 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDClient registerWithDaemon:forProcess:machName:holdVouchers:](v22, self);
  }
LABEL_20:
}

void __65__WPDClient_registerWithDaemon_forProcess_machName_holdVouchers___block_invoke_516(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v17 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v16 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setRegistered:1];
    [v16 setScanManager:v17];
    [v16 setAdvertisingManager:v11];
    [v16 setZoneManager:v12];
    [v16 setPipeManager:v13];
    [v16 setObjectDiscoveryManager:v14];
    [v16 sendRegisteredWithDaemonAndContinuingSession:0];
  }
}

- (void)sendRegisteredWithDaemonAndContinuingSession:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(WPDClient *)self conn];

  if (v5)
  {
    uint64_t v6 = [(WPDClient *)self conn];
    id v7 = [v6 remoteObjectProxy];
    [v7 registeredWithDaemonAndContinuingSession:v3];
  }
  char v8 = [(WPDClient *)self server];
  uint64_t v9 = [v8 wpdState];
  uint64_t v10 = [v9 state];
  id v11 = [(WPDClient *)self scanManager];
  -[WPDClient notifyClientStateChange:Restricted:](self, "notifyClientStateChange:Restricted:", v10, [v11 restricted]);

  if (+[WPDaemonServer isInternalBuild])
  {
    [(WPDClient *)self verifyApprovedUseCase];
  }
}

- (void)tickleMachPort
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = [a2 clientUUID];
  OUTLINED_FUNCTION_3();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_22316D000, v5, OS_LOG_TYPE_ERROR, "WPDClient %{public}@ was not found for mach name %@", v7, 0x16u);
}

- (void)resumeCommunicationWithConnection:(id)a3 andProcessID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(WPDClient *)self conn];
  [v7 setInterruptionHandler:0];

  __int16 v8 = [(WPDClient *)self conn];
  [v8 setInvalidationHandler:0];

  uint64_t v9 = [(WPDClient *)self conn];
  [v9 invalidate];

  [(WPDClient *)self setConn:0];
  [(WPDClient *)self setProcessID:v4];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_569);
  }
  uint64_t v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = [(WPDClient *)self clientUUID];
    int v15 = 138412546;
    uint64_t v16 = v12;
    __int16 v17 = 1024;
    int v18 = [(WPDClient *)self processID];
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "WPDClient resuming new connection on old client %@ from new pid %d", (uint8_t *)&v15, 0x12u);
  }
  [(WPDClient *)self setConn:v6];

  [(WPDClient *)self setupConnection];
  [(WPDClient *)self sendRegisteredWithDaemonAndContinuingSession:1];
  [(WPDClient *)self setPortTickled:0];
  id v13 = [(WPDClient *)self messageQueue];

  if (v13)
  {
    id v14 = [(WPDClient *)self messageQueue];
    dispatch_activate(v14);
  }
}

- (void)checkEntitlements
{
  BOOL v3 = [(WPDClient *)self conn];

  if (v3)
  {
    uint64_t v4 = [(WPDClient *)self conn];
    uint64_t v5 = [v4 valueForEntitlement:@"com.apple.wirelessproxd-location"];
    -[WPDClient setEntitledForZones:](self, "setEntitledForZones:", [v5 BOOLValue]);

    id v6 = [(WPDClient *)self conn];
    id v7 = [v6 valueForEntitlement:@"com.apple.wirelessproxd-object-discovery"];
    -[WPDClient setEntitledForObjectDiscovery:](self, "setEntitledForObjectDiscovery:", [v7 BOOLValue]);

    id v9 = [(WPDClient *)self conn];
    __int16 v8 = [v9 valueForEntitlement:@"com.apple.wirelessproxd-enable-ranging"];
    -[WPDClient setEntitledForRanging:](self, "setEntitledForRanging:", [v8 BOOLValue]);
  }
}

- (void)endTestMode
{
}

- (void)setupConnection
{
  BOOL v3 = +[WPDXPCInterfaces serverInterface];
  uint64_t v4 = [(WPDClient *)self conn];
  [v4 setExportedInterface:v3];

  uint64_t v5 = [(WPDClient *)self conn];
  [v5 setExportedObject:self];

  id v6 = +[WPDXPCInterfaces clientInterface];
  id v7 = [(WPDClient *)self conn];
  [v7 setRemoteObjectInterface:v6];

  __int16 v8 = [(WPDClient *)self conn];
  id v9 = [(WPDClient *)self serverQueue];
  [v8 _setQueue:v9];

  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v10 = [(WPDClient *)self conn];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __28__WPDClient_setupConnection__block_invoke;
  v14[3] = &unk_26469ABC0;
  objc_copyWeak(&v15, &location);
  [v10 setInvalidationHandler:v14];

  id v11 = [(WPDClient *)self conn];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __28__WPDClient_setupConnection__block_invoke_573;
  v12[3] = &unk_26469ABC0;
  objc_copyWeak(&v13, &location);
  [v11 setInterruptionHandler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __28__WPDClient_setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_572);
    }
    uint64_t v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v3 = v2;
      uint64_t v4 = [WeakRetained clientUUID];
      uint64_t v5 = [WeakRetained processName];
      int v6 = 138543874;
      id v7 = v4;
      __int16 v8 = 2114;
      id v9 = v5;
      __int16 v10 = 1024;
      int v11 = [WeakRetained processID];
      _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "WPDClient %{public}@ XPC connection for process %{public}@ (%d) is becoming invalidated", (uint8_t *)&v6, 0x1Cu);
    }
    [WeakRetained destroy];
  }
}

void __28__WPDClient_setupConnection__block_invoke_573(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_576);
    }
    uint64_t v2 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v3 = v2;
      uint64_t v4 = [WeakRetained clientUUID];
      uint64_t v5 = [WeakRetained processName];
      int v6 = 138543874;
      id v7 = v4;
      __int16 v8 = 2114;
      id v9 = v5;
      __int16 v10 = 1024;
      int v11 = [WeakRetained processID];
      _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "WPDClient %{public}@ XPC connection for client %{public}@ (%d) is becoming interrupted", (uint8_t *)&v6, 0x1Cu);
    }
    [WeakRetained destroy];
  }
}

- (void)destroy
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WPDClient *)self machName];

  if (v3)
  {
    uint64_t v4 = [(WPDClient *)self messageQueue];

    if (!v4)
    {
      uint64_t v5 = (const char *)[@"com.apple.wirelessproxd.framework-message-queue" UTF8String];
      int v6 = dispatch_queue_attr_make_initially_inactive(0);
      id v7 = [(WPDClient *)self serverQueue];
      dispatch_queue_t v8 = dispatch_queue_create_with_target_V2(v5, v6, v7);
      [(WPDClient *)self setMessageQueue:v8];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_578);
    }
    id v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = v9;
      int v11 = [(WPDClient *)self clientUUID];
      uint64_t v12 = [(WPDClient *)self processName];
      int v13 = [(WPDClient *)self processID];
      id v14 = [(WPDClient *)self machName];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v30 = 2050;
      __int16 v31 = self;
      __int16 v32 = 2114;
      uint64_t v33 = v12;
      __int16 v34 = 1024;
      int v35 = v13;
      __int16 v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEFAULT, "Invalidating WPDClient %{public}@ (%{public}p) of process %{public}@ (%d) with mach port %@", buf, 0x30u);
    }
    id v15 = [(WPDClient *)self conn];
    [v15 invalidate];

    [(WPDClient *)self setConn:0];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_581);
    }
    uint64_t v16 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = v16;
      int v18 = [(WPDClient *)self clientUUID];
      uint64_t v19 = [(WPDClient *)self processName];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v18;
      __int16 v30 = 2050;
      __int16 v31 = self;
      __int16 v32 = 2114;
      uint64_t v33 = v19;
      __int16 v34 = 1024;
      int v35 = [(WPDClient *)self processID];
      _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "Removing WPDClient %{public}@ (%{public}p) of process %{public}@ (%d)", buf, 0x26u);
    }
    if ([(WPDClient *)self registered])
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      uint64_t v20 = [(WPDClient *)self serverQueue];
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __20__WPDClient_destroy__block_invoke_582;
      uint64_t v26 = &unk_26469AD78;
      objc_copyWeak(&v28, (id *)buf);
      id v27 = self;
      dispatch_async(v20, &v23);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    uint64_t v21 = [(WPDClient *)self conn];
    [v21 invalidate];

    int v22 = [(WPDClient *)self server];
    [v22 removeClient:self];
  }
}

void __20__WPDClient_destroy__block_invoke_582(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "destroy_async");
    id WeakRetained = v3;
  }
}

- (void)destroy_async
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a1;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_15() processName];
  [a2 processID];
  int v7 = 138543618;
  dispatch_queue_t v8 = v5;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11(&dword_22316D000, v2, v6, "Scan voucher release for process %{public}@ (%d)", (uint8_t *)&v7);
}

void __26__WPDClient_destroy_async__block_invoke_588(int a1, int a2, dispatch_source_t source)
{
}

void __26__WPDClient_destroy_async__block_invoke_2(int a1, int a2, dispatch_source_t source)
{
}

void __26__WPDClient_destroy_async__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 pipeManager];
  uint64_t v5 = [*(id *)(a1 + 32) clientUUID];
  [v6 unregisterEndpoint:v4 forClient:v5];
}

- (void)addCharacteristic:(id)a3 forService:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_603);
  }
  dispatch_queue_t v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ for service %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = [(WPDClient *)self advertisingManager];
  __int16 v10 = [(WPDClient *)self clientUUID];
  [v9 addCharacteristic:v6 forService:v7 forClient:v10];
}

- (void)startAdvertising:(id)a3 reply:(id)a4
{
  id v7 = a4;
  [(WPDClient *)self startAdvertising:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

void __36__WPDClient_startAdvertising_async___block_invoke_619(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_621);
  }
  uint64_t v2 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 72);
    id v4 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    int v22 = v3;
    __int16 v23 = 2048;
    uint64_t v24 = v4;
    _os_log_impl(&dword_22316D000, v2, OS_LOG_TYPE_DEFAULT, "Advert timer expired for client %d after %.2f seconds", buf, 0x12u);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 40) clientType] == 8)
    {
      [*(id *)(a1 + 40) setUpdateTime:0.0];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_624);
      }
      id v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "HeySiri force stoping advertising", buf, 2u);
      }
      [WeakRetained stopAdvertising:*(void *)(a1 + 40)];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_627);
      }
      id v7 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_queue_t v8 = *(void **)(a1 + 48);
        int v9 = *(unsigned __int8 *)(a1 + 72);
        __int16 v10 = v7;
        int v11 = [v8 processName];
        int v12 = [*(id *)(a1 + 48) processID];
        uint64_t v13 = [*(id *)(a1 + 40) advertisingRate];
        uint64_t v14 = [*(id *)(a1 + 40) advertisingRate];
        *(_DWORD *)buf = 67110146;
        int v22 = v9;
        __int16 v23 = 2114;
        uint64_t v24 = v11;
        __int16 v25 = 1024;
        int v26 = v12;
        __int16 v27 = 2048;
        uint64_t v28 = v13;
        __int16 v29 = 2048;
        double v30 = (double)v14 * 0.625;
        _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Client has exceeded adv limit! Client: %d , Process: %{public}@ (%d) , Advertising interval: %ld (%.2f ms) ", buf, 0x2Cu);
      }
    }
    uint64_t v15 = [WeakRetained conn];
    uint64_t v16 = [v15 remoteObjectProxy];
    uint64_t v17 = *(void *)(a1 + 40);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __36__WPDClient_startAdvertising_async___block_invoke_628;
    v18[3] = &unk_26469AF50;
    objc_copyWeak(v19, (id *)(a1 + 56));
    v18[4] = WeakRetained;
    char v20 = *(unsigned char *)(a1 + 72);
    v19[1] = *(id *)(a1 + 64);
    [v16 updateAdvertisingRequest:v17 withUpdate:v18];

    objc_destroyWeak(v19);
  }
}

void __36__WPDClient_startAdvertising_async___block_invoke_628(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_18;
  }
  if (v3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) advertTimers];
    id v6 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 56)];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_634);
      }
      dispatch_queue_t v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *(unsigned __int8 *)(a1 + 56);
        uint64_t v10 = *(void *)(a1 + 48);
        int v20 = 67109376;
        *(_DWORD *)uint64_t v21 = v9;
        *(_WORD *)&v21[4] = 2048;
        *(void *)&v21[6] = v10;
        _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Updating advert request for client %d after %.2f seconds", (uint8_t *)&v20, 0x12u);
      }
      [*(id *)(a1 + 32) startAdvertising:v3];
      goto LABEL_18;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_637);
    }
    uint64_t v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = *(void **)(a1 + 32);
      uint64_t v13 = v17;
      uint64_t v14 = [v18 processName];
      int v19 = [*(id *)(a1 + 32) processID];
      int v20 = 138412546;
      *(void *)uint64_t v21 = v14;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v19;
      uint64_t v16 = "Tried to update the advertising request interval for process %@ (%d), but a client has asked us to stop in the meantime";
      goto LABEL_17;
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_631);
    }
    int v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(void **)(a1 + 32);
      uint64_t v13 = v11;
      uint64_t v14 = [v12 processName];
      int v15 = [*(id *)(a1 + 32) processID];
      int v20 = 138412546;
      *(void *)uint64_t v21 = v14;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v15;
      uint64_t v16 = "Tried to update the advertising request for process %@ (%d) - NOOP";
LABEL_17:
      _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0x12u);
    }
  }
LABEL_18:
}

- (void)advertisingStartedOfTypeAt:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = [(WPDClient *)self conn];
  id v4 = [v5 remoteObjectProxy];
  [v4 advertisingStartedOfTypeAt:v3];
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_667);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = v7;
    int v11 = [(WPDClient *)self processName];
    int v12 = [v6 localizedDescription];
    int v13 = 138412802;
    uint64_t v14 = v11;
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 2112;
    int v18 = v12;
    _os_log_error_impl(&dword_22316D000, v10, OS_LOG_TYPE_ERROR, "Advertising failed to start for client %@ type %d with error: %@", (uint8_t *)&v13, 0x1Cu);
  }
  dispatch_queue_t v8 = [(WPDClient *)self conn];
  int v9 = [v8 remoteObjectProxy];
  [v9 advertisingFailedToStart:v6 ofType:v4];

  [(WPDClient *)self setPendingSent:0];
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![(WPDClient *)self pendingSent])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_669);
    }
    id v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [(WPDClient *)self processName];
      int v10 = 138543618;
      int v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = v3;
      _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "Advertising pending for client %{public}@ type %ld", (uint8_t *)&v10, 0x16u);
    }
    dispatch_queue_t v8 = [(WPDClient *)self conn];
    int v9 = [v8 remoteObjectProxy];
    [v9 advertisingPendingOfType:v3];

    [(WPDClient *)self setPendingSent:1];
  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_671);
    }
    id v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      dispatch_queue_t v8 = v7;
      int v9 = [(WPDClient *)self processName];
      int v10 = [v6 localizedDescription];
      int v14 = 138412802;
      __int16 v15 = v9;
      __int16 v16 = 1024;
      int v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_error_impl(&dword_22316D000, v8, OS_LOG_TYPE_ERROR, "Advertising stopped for client %@ type %d with error: %@", (uint8_t *)&v14, 0x1Cu);

LABEL_10:
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_674);
    }
    int v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v8 = v11;
      int v9 = [(WPDClient *)self processName];
      int v14 = 138412546;
      __int16 v15 = v9;
      __int16 v16 = 1024;
      int v17 = v4;
      _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Advertising stopped for client %@ type %d", (uint8_t *)&v14, 0x12u);
      goto LABEL_10;
    }
  }
  __int16 v12 = [(WPDClient *)self conn];
  uint64_t v13 = [v12 remoteObjectProxy];
  [v13 advertisingStoppedOfType:v4 withError:v6];

  [(WPDClient *)self setPendingSent:0];
}

- (void)notifyClientStateChange:(int64_t)a3 Restricted:(BOOL)a4
{
  unint64_t v4 = a3;
  if (a3 == 3 && a4)
  {
    if ([(WPDClient *)self scanDenylisted])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_676);
      }
      id v6 = (void *)WiProxLog;
      unint64_t v4 = 2;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        -[WPDClient notifyClientStateChange:Restricted:](v6, self);
        unint64_t v4 = 2;
      }
    }
    else
    {
      unint64_t v4 = 3;
    }
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_679);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDClient notifyClientStateChange:Restricted:](v7, self, v4);
  }
  dispatch_queue_t v8 = [(WPDClient *)self conn];
  int v9 = [v8 remoteObjectProxy];
  [v9 stateDidChange:v4];

  if (v4 >= 3)
  {
    if (v4 == 3) {
      [(WPDClient *)self setScansOff:0];
    }
  }
  else
  {
    [(WPDClient *)self stopScans];
    [(WPDClient *)self setScansOff:1];
    int v10 = [(WPDClient *)self lePipePeersSet];
    [v10 removeAllObjects];
  }
}

- (void)discoveredDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(WPDClient *)self serverQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__WPDClient_discoveredDevices___block_invoke;
  v7[3] = &unk_26469ADA0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __31__WPDClient_discoveredDevices___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 count];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v3 = 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__WPDClient_discoveredDevices___block_invoke_2;
  v9[3] = &unk_26469AFA0;
  v9[4] = *(void *)(a1 + 40);
  v9[5] = v3;
  [v2 enumerateObjectsUsingBlock:v9];
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__WPDClient_discoveredDevices___block_invoke_686;
  v5[3] = &unk_26469AD78;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 32);
  [v4 queueBlock:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __31__WPDClient_discoveredDevices___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  id v7 = [v5 objectForKeyedSubscript:@"kDeviceType"];

  unsigned __int8 v8 = [v7 unsignedIntegerValue];
  kdebug_trace();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_684);
  }
  int v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    int v10 = *(void **)(a1 + 32);
    int v11 = v9;
    __int16 v12 = [v10 processName];
    uint64_t v13 = [*(id *)(a1 + 32) clientUUID];
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138413570;
    __int16 v16 = v12;
    __int16 v17 = 2112;
    __int16 v18 = v13;
    __int16 v19 = 2048;
    uint64_t v20 = a3 + 1;
    __int16 v21 = 2048;
    uint64_t v22 = v14;
    __int16 v23 = 1024;
    int v24 = v8;
    __int16 v25 = 2112;
    int v26 = v6;
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_INFO, "Telling process %@ (%@) about ADV Buffer (%ld/%ld) discovered device of type %d with data %@", (uint8_t *)&v15, 0x3Au);
  }
}

void __31__WPDClient_discoveredDevices___block_invoke_686(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained conn];
    id v4 = [v3 remoteObjectProxy];
    [v4 devicesDiscovered:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

- (void)anyDiscoveredDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(WPDClient *)self serverQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__WPDClient_anyDiscoveredDevice___block_invoke;
  v7[3] = &unk_26469ADA0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __33__WPDClient_anyDiscoveredDevice___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  id v4 = [*v2 objectForKeyedSubscript:@"kDeviceType"];
  unsigned __int8 v5 = [v4 unsignedIntegerValue];

  kdebug_trace();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_688);
  }
  id v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = v6;
    int v9 = [v7 processName];
    int v10 = [*(id *)(a1 + 40) clientUUID];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v9;
    __int16 v16 = 2112;
    __int16 v17 = v10;
    __int16 v18 = 1024;
    int v19 = v5;
    __int16 v20 = 2112;
    __int16 v21 = v3;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_INFO, "Telling process %@ (%@) about ANY discovered device of type %d with data %@", buf, 0x26u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  int v11 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __33__WPDClient_anyDiscoveredDevice___block_invoke_689;
  v12[3] = &unk_26469AD78;
  objc_copyWeak(&v14, (id *)buf);
  id v13 = *(id *)(a1 + 32);
  [v11 queueBlock:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __33__WPDClient_anyDiscoveredDevice___block_invoke_689(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained conn];
    id v4 = [v3 remoteObjectProxy];
    [v4 anyDiscoveredDevice:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

- (void)resetConnection
{
  uint64_t v3 = [(WPDClient *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__WPDClient_resetConnection__block_invoke;
  block[3] = &unk_26469AD50;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __28__WPDClient_resetConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connections];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__WPDClient_resetConnection__block_invoke_2;
  v4[3] = &unk_26469AFC8;
  v4[4] = *(void *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];

  uint64_t v3 = [*(id *)(a1 + 32) connections];
  [v3 removeAllObjects];
}

uint64_t __28__WPDClient_resetConnection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelConnectionTimer:a2];
}

- (void)registerForAnyScanResults:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(WPDClient *)self scanManager];
  id v5 = [(WPDClient *)self clientUUID];
  if (v3) {
    [v6 addSpyScanClient:v5];
  }
  else {
    [v6 removeSpyScanClient:v5];
  }
}

void __33__WPDClient_startScanning_async___block_invoke_735(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_737);
  }
  uint64_t v2 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 72);
    id v4 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    int v21 = v3;
    __int16 v22 = 2048;
    __int16 v23 = v4;
    _os_log_impl(&dword_22316D000, v2, OS_LOG_TYPE_DEFAULT, "Scan timer expired for client %d after %.2f seconds", buf, 0x12u);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 40) clientType] == 8)
    {
      [*(id *)(a1 + 40) setUpdateTime:0.0];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_740);
      }
      id v6 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "HeySiri force stoping scan", buf, 2u);
      }
      [WeakRetained stopScanning:*(void *)(a1 + 40)];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_743);
      }
      id v7 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 48);
        int v9 = *(unsigned __int8 *)(a1 + 72);
        int v10 = v7;
        int v11 = [v8 processName];
        int v12 = [*(id *)(a1 + 48) processID];
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 67109890;
        int v21 = v9;
        __int16 v22 = 2114;
        __int16 v23 = v11;
        __int16 v24 = 1024;
        int v25 = v12;
        __int16 v26 = 2114;
        uint64_t v27 = v13;
        _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Client has exceeded scan limit! Client: %d , Process: %{public}@ (%d) , Scan interval: %{public}@ ", buf, 0x22u);
      }
    }
    id v14 = [WeakRetained conn];
    int v15 = [v14 remoteObjectProxy];
    uint64_t v16 = *(void *)(a1 + 40);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __33__WPDClient_startScanning_async___block_invoke_744;
    v17[3] = &unk_26469AFF0;
    objc_copyWeak(v18, (id *)(a1 + 56));
    v17[4] = WeakRetained;
    char v19 = *(unsigned char *)(a1 + 72);
    v18[1] = *(id *)(a1 + 64);
    [v15 updateScanningRequest:v16 withUpdate:v17];

    objc_destroyWeak(v18);
  }
}

void __33__WPDClient_startScanning_async___block_invoke_744(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_18;
  }
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) scanTimers];
    id v6 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 56)];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_750);
      }
      id v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *(unsigned __int8 *)(a1 + 56);
        uint64_t v10 = *(void *)(a1 + 48);
        int v20 = 67109376;
        *(_DWORD *)int v21 = v9;
        *(_WORD *)&v21[4] = 2048;
        *(void *)&v21[6] = v10;
        _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Updating scan request for client %d after %.2f seconds", (uint8_t *)&v20, 0x12u);
      }
      [*(id *)(a1 + 32) startScanning:v3];
      goto LABEL_18;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_753);
    }
    __int16 v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = *(void **)(a1 + 32);
      uint64_t v13 = v17;
      id v14 = [v18 processName];
      int v19 = [*(id *)(a1 + 32) processID];
      int v20 = 138412546;
      *(void *)int v21 = v14;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v19;
      uint64_t v16 = "Tried to update the scan request interval for process %@ (%d), but a client has asked us to stop in the meantime";
      goto LABEL_17;
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_747);
    }
    int v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(void **)(a1 + 32);
      uint64_t v13 = v11;
      id v14 = [v12 processName];
      int v15 = [*(id *)(a1 + 32) processID];
      int v20 = 138412546;
      *(void *)int v21 = v14;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v15;
      uint64_t v16 = "Tried to update the scan request for process %@ (%d) - NOOP";
LABEL_17:
      _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0x12u);
    }
  }
LABEL_18:
}

- (void)clearDuplicateFilterCache:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(WPDClient *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WPDClient_clearDuplicateFilterCache___block_invoke;
  block[3] = &unk_26469AD78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __39__WPDClient_clearDuplicateFilterCache___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "clearDuplicateFilterCache_async:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)clearDuplicateFilterCache_async:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 clientType];
  if ([(WPDClient *)self registered])
  {
    if (v5 != 18)
    {
LABEL_5:
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_782);
      }
      id v6 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v6;
        id v8 = [(WPDClient *)self processName];
        int v16 = 138543874;
        __int16 v17 = v8;
        __int16 v18 = 1024;
        int v19 = [(WPDClient *)self processID];
        __int16 v20 = 2114;
        id v21 = v4;
        _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "clear dup filter cache for process %{public}@ (%d) with %{public}@", (uint8_t *)&v16, 0x1Cu);
      }
      id v9 = [(WPDClient *)self scanManager];
      uint64_t v10 = [(WPDClient *)self clientUUID];
      int v11 = [v9 clearDuplicateFilterCache:v4 forClient:v10];

      if (v11)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_785);
        }
        int v12 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 67109120;
          LODWORD(v17) = v5;
          _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_DEFAULT, "Trying to clear dup filter cache for a type %d we don't scan for", (uint8_t *)&v16, 8u);
        }
      }

      goto LABEL_19;
    }
    if ([(WPDClient *)self entitledForObjectDiscovery])
    {
      if ([(WPDClient *)self supportsObjectDiscovery]) {
        goto LABEL_5;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_779);
      }
      int v15 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient clearDuplicateFilterCache_async:](v15);
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_776);
      }
      id v14 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient clearDuplicateFilterCache_async:](v14);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_773);
    }
    uint64_t v13 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient clearDuplicateFilterCache_async:](v5, v13);
    }
  }
LABEL_19:
}

- (void)startTrackingPeerWithRequest:(id)a3
{
  id v11 = a3;
  id v4 = [(WPDClient *)self scanManager];
  uint64_t v5 = [(WPDClient *)self clientUUID];
  id v6 = [v4 addPeerTrackingRequest:v11 forClient:v5];

  id v7 = [(WPDClient *)self conn];
  id v8 = [v7 remoteObjectProxy];
  id v9 = v8;
  if (v6)
  {
    [v8 failedToStartTrackingPeer:v11 error:v6];
  }
  else
  {
    uint64_t v10 = [v11 peerUUID];
    objc_msgSend(v9, "startedTrackingPeer:ofType:", v10, objc_msgSend(v11, "clientType"));
  }
}

- (void)stopTrackingPeerWithRequest:(id)a3
{
  id v11 = a3;
  id v4 = [(WPDClient *)self scanManager];
  uint64_t v5 = [(WPDClient *)self clientUUID];
  id v6 = [v4 removePeerTrackingRequest:v11 checkZonesAvailable:1 forClient:v5];

  id v7 = [(WPDClient *)self conn];
  id v8 = [v7 remoteObjectProxy];
  id v9 = v8;
  if (v6)
  {
    [v8 failedToStartTrackingPeer:v11 error:v6];
  }
  else
  {
    uint64_t v10 = [v11 peerUUID];
    objc_msgSend(v9, "stoppedTrackingPeer:ofType:", v10, objc_msgSend(v11, "clientType"));
  }
}

- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v8 = [(WPDClient *)self conn];
  id v7 = [v8 remoteObjectProxy];
  [v7 stoppedTrackingPeer:v6 ofType:v4];
}

- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_787);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [(WPDClient *)self processName];
    int v12 = 138412546;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Telling client %@ that peer %@ has been found", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = [(WPDClient *)self conn];
  id v11 = [v10 remoteObjectProxy];
  [v11 foundPeer:v6 ofType:v4];
}

- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_789);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [(WPDClient *)self processName];
    int v12 = 138412546;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Telling client %@ that peer %@ has been lost", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = [(WPDClient *)self conn];
  id v11 = [v10 remoteObjectProxy];
  [v11 lostPeer:v6 ofType:v4];
}

- (void)peerTrackingAvailable
{
  id v3 = [(WPDClient *)self conn];
  uint64_t v2 = [v3 remoteObjectProxy];
  [v2 peerTrackingAvailable];
}

- (void)peerTrackingFull
{
  id v3 = [(WPDClient *)self conn];
  uint64_t v2 = [v3 remoteObjectProxy];
  [v2 peerTrackingFull];
}

- (void)startTrackingZone:(id)a3
{
  id v4 = a3;
  if ([(WPDClient *)self entitledForZones])
  {
    uint64_t v5 = [(WPDClient *)self zoneManager];
    id v6 = [(WPDClient *)self clientUUID];
    id v7 = [v5 addZoneTrackingRequest:v4 forClient:v6];

    if (v7)
    {
      id v8 = [(WPDClient *)self conn];
      id v9 = [v8 remoteObjectProxy];
      uint64_t v10 = [v4 zones];
      [v9 failedToRegisterZones:v10 withError:v7];
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_791);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient startTrackingZone:]();
    }
    id v11 = [(WPDClient *)self conn];
    [v11 invalidate];
  }
}

- (void)stopTrackingZones:(id)a3
{
  id v4 = a3;
  if ([(WPDClient *)self entitledForZones])
  {
    uint64_t v5 = [(WPDClient *)self zoneManager];
    id v6 = [(WPDClient *)self clientUUID];
    [v5 unregisterZones:v4 forClient:v6];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_793);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient stopTrackingZones:]();
    }
    id v7 = [(WPDClient *)self conn];
    [v7 invalidate];
  }
}

- (void)stopTrackingAllZones
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Client %@ is not entitled to stop track all zones, invalidating connection", v2, v3, v4, v5, v6);
}

- (void)getAllTrackedZones
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Client %@ is not entitled to get all tracked zones, invalidating connection", v2, v3, v4, v5, v6);
}

- (void)enteredZone:(id)a3 manufacturerData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WPDClient *)self entitledForZones])
  {
    id v8 = [(WPDClient *)self conn];
    id v9 = [v8 remoteObjectProxy];
    [v9 enteredZone:v6 manufacturerData:v7];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_799);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient enteredZone:manufacturerData:]();
    }
    id v8 = [(WPDClient *)self conn];
    [v8 invalidate];
  }
}

- (void)exitedZone:(id)a3
{
  id v4 = a3;
  id v6 = [(WPDClient *)self conn];
  uint64_t v5 = [v6 remoteObjectProxy];
  [v5 exitedZone:v4];
}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqual:AllZeroUUID])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_801);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient connectToPeer:withOptions:]();
    }
    goto LABEL_43;
  }
  if ([(WPDClient *)self registered])
  {
    id v8 = (void *)MEMORY[0x223CB05A0]();
    id v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v7];
    uint64_t v10 = [(WPDClient *)self bundleID];

    if (v10)
    {
      id v11 = [(WPDClient *)self bundleID];
      [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263EFEE08]];

      int v12 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v13 = [(WPDClient *)self bundleID];
      __int16 v14 = [v12 arrayWithObject:v13];
      [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x263EFEE78]];
    }
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[WPDClient processID](self, "processID"));
    [v9 setObject:v15 forKeyedSubscript:*MEMORY[0x263EFEE10]];

    uint64_t v16 = [NSDictionary dictionaryWithDictionary:v9];

    __int16 v17 = [(WPDClient *)self connections];
    __int16 v18 = [v17 objectForKeyedSubscript:v6];

    if (v18)
    {
      __int16 v17 = [v18 getPeripheral];
      if (v17)
      {
        if ([v18 didConnectSent])
        {

LABEL_19:
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_808);
          }
          uint64_t v22 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            v44 = v22;
            v45 = [(WPDClient *)self clientUUID];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v6;
            __int16 v50 = 2114;
            uint64_t v51 = (uint64_t)v45;
            __int16 v52 = 2112;
            uint64_t v53 = v16;
            _os_log_debug_impl(&dword_22316D000, v44, OS_LOG_TYPE_DEBUG, "TODO: rdar_57238900 amend existing connection, Connect to %{public}@ called by client %{public}@ - options %@", buf, 0x20u);
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_811);
          }
          __int16 v23 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v6;
            _os_log_impl(&dword_22316D000, v23, OS_LOG_TYPE_DEFAULT, "We're already connected to this device %{public}@. Sending back didConnect again...", buf, 0xCu);
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_pipeManager);
          int v25 = [(WPDClient *)self clientUUID];
          [WeakRetained setPipeClientConnectionStatus:1 forPeer:v6 forClient:v25];

          [(WPDClient *)self connectedDevice:v6 withError:0 shouldDiscover:0];
LABEL_42:

          id v7 = (id)v16;
          goto LABEL_43;
        }
      }
    }
    __int16 v20 = [(WPDClient *)self lePipePeersSet];
    int v21 = [v20 containsObject:v6];

    if (v18)
    {

      if (v21) {
        goto LABEL_19;
      }
    }
    else if (v21)
    {
      goto LABEL_19;
    }
    id v26 = objc_loadWeakRetained((id *)&self->_pipeManager);
    uint64_t v27 = [(WPDClient *)self clientUUID];
    [v26 setConnectionInitiator:1 forPeer:v6 forClient:v27];

    kdebug_trace();
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_814);
    }
    uint64_t v28 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = v28;
      double v30 = [(WPDClient *)self clientUUID];
      uint64_t v31 = [(WPDClient *)self clientTypeString];
      __int16 v32 = [(WPDClient *)self processName];
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v6;
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)v30;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v31;
      __int16 v54 = 2114;
      char v55 = v32;
      __int16 v56 = 1024;
      int v57 = [(WPDClient *)self processID];
      __int16 v58 = 2112;
      uint64_t v59 = v16;
      _os_log_impl(&dword_22316D000, v29, OS_LOG_TYPE_DEFAULT, "Connect to %{public}@ called by client %{public}@ (%@) - process %{public}@ (%d) - options %@", buf, 0x3Au);
    }
    uint64_t v33 = [(WPDClient *)self scanManager];
    __int16 v34 = [(WPDClient *)self clientUUID];
    int v35 = [v33 connectToPeripheral:v6 fromClient:v34 withOptions:v16];

    if (v35)
    {
      [(WPDClient *)self connectedDevice:v6 withError:v35 shouldDiscover:0];
    }
    else
    {
      __int16 v36 = [(WPDClient *)self lePipePeersSet];
      char v37 = [v36 containsObject:v6];

      if ((v37 & 1) == 0)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_817);
        }
        uint64_t v38 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v6;
          __int16 v50 = 2048;
          uint64_t v51 = 0x4024000000000000;
          _os_log_impl(&dword_22316D000, v38, OS_LOG_TYPE_INFO, "Setting connection timer for peer %@ with time %.2f ", buf, 0x16u);
        }
        v39 = [(WPDClient *)self serverQueue];
        v40 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v39);

        dispatch_time_t v41 = dispatch_time(0, 10000000000);
        dispatch_source_set_timer(v40, v41, 0xFFFFFFFFFFFFFFFFLL, 0);
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __39__WPDClient_connectToPeer_withOptions___block_invoke_818;
        handler[3] = &unk_26469AD78;
        objc_copyWeak(&v48, (id *)buf);
        id v42 = v6;
        id v47 = v42;
        dispatch_source_set_event_handler(v40, handler);
        [(WPDClient *)self cancelConnectionTimer:v42];
        v43 = [(WPDClient *)self connectionTimer];
        [v43 setObject:v40 forKeyedSubscript:v42];

        dispatch_resume(v40);
        objc_destroyWeak(&v48);
        objc_destroyWeak((id *)buf);
      }
    }

    goto LABEL_42;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_823);
  }
  int v19 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDClient connectToPeer:withOptions:](v19, v6);
  }
LABEL_43:
}

void __39__WPDClient_connectToPeer_withOptions___block_invoke_818(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [NSString stringWithFormat:@"The connection to peer %@ didn't complete in %.2f seconds", *(void *)(a1 + 32), 0x4024000000000000];
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = v3;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v6 = [v4 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v5];

    [WeakRetained connectedDevice:*(void *)(a1 + 32) withError:v6 shouldDiscover:0];
  }
}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_825);
  }
  uint64_t v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    int v12 = [v9 localizedDescription];
    int v29 = 138543362;
    double v30 = v12;
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "Sending connected device with error %{public}@", (uint8_t *)&v29, 0xCu);
  }
  [(WPDClient *)self cancelConnectionTimer:v8];
  uint64_t v13 = [(WPDClient *)self connections];
  __int16 v14 = [v13 objectForKeyedSubscript:v8];

  if (v9)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_828);
    }
    id v15 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient connectedDevice:withError:shouldDiscover:](v15);
    }
    uint64_t v16 = [(WPDClient *)self scanManager];
    __int16 v17 = [(WPDClient *)self clientUUID];
    [v16 removePeripheralConnection:v8 forClient:v17];

    if (v14)
    {
      __int16 v18 = [(WPDClient *)self connections];
      [v18 removeObjectForKey:v8];
    }
  }
  if (!v5)
  {
    uint64_t v22 = [(WPDClient *)self conn];
    __int16 v23 = [v22 remoteObjectProxy];
    __int16 v24 = v23;
    id v25 = v8;
    id v26 = v9;
    uint64_t v27 = 0;
LABEL_25:
    [v23 connectedDevice:v25 withError:v26 shouldDiscover:v27];

    goto LABEL_26;
  }
  int v19 = [(WPDClient *)self lePipePeersSet];
  char v20 = [v19 containsObject:v8];

  if ((v20 & 1) == 0)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_831);
    }
    uint64_t v28 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_22316D000, v28, OS_LOG_TYPE_DEFAULT, "connectedDevice over GATT", (uint8_t *)&v29, 2u);
    }
    uint64_t v22 = [(WPDClient *)self conn];
    __int16 v23 = [v22 remoteObjectProxy];
    __int16 v24 = v23;
    id v25 = v8;
    id v26 = v9;
    uint64_t v27 = 1;
    goto LABEL_25;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_834);
  }
  int v21 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_22316D000, v21, OS_LOG_TYPE_DEFAULT, "connectedDevice over Pipe, set didConnectSent flag", (uint8_t *)&v29, 2u);
  }
  [v14 setDidConnectSent:1];
LABEL_26:
}

- (void)connectedDeviceOverLEPipe:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_836);
  }
  BOOL v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = [(WPDClient *)self clientUUID];
    id v8 = [(WPDClient *)self processName];
    int v20 = 138412802;
    id v21 = v4;
    __int16 v22 = 2112;
    __int16 v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "Sending connected device over LE pipe to peer %@ for client %@ (%@)", (uint8_t *)&v20, 0x20u);
  }
  [(WPDClient *)self cancelConnectionTimer:v4];
  id v9 = [(WPDClient *)self connections];
  uint64_t v10 = [v9 objectForKeyedSubscript:v4];

  if (v10)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_839);
    }
    id v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "Setting didConnectSent flag", (uint8_t *)&v20, 2u);
    }
    [v10 setDidConnectSent:1];
  }
  int v12 = [(WPDClient *)self lePipePeersSet];
  [v12 addObject:v4];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_842);
  }
  uint64_t v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = v13;
    id v15 = [(WPDClient *)self clientTypeString];
    uint64_t v16 = [(WPDClient *)self processName];
    __int16 v17 = [(WPDClient *)self lePipePeersSet];
    int v20 = 138413058;
    id v21 = v15;
    __int16 v22 = 2112;
    __int16 v23 = v16;
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2112;
    uint64_t v27 = v17;
    _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEFAULT, "%@ (%@) connected over LE Pipe %@, current pipes %@", (uint8_t *)&v20, 0x2Au);
  }
  __int16 v18 = [(WPDClient *)self conn];
  int v19 = [v18 remoteObjectProxy];
  [v19 connectedDeviceOverLEPipe:v4];
}

- (void)disconnectFromPeer:(id)a3
{
  *(void *)&v42[11] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 isEqual:AllZeroUUID])
  {
    BOOL v5 = [(WPDClient *)self connections];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_847);
    }
    uint64_t v7 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = [(WPDClient *)self clientUUID];
      uint64_t v10 = [(WPDClient *)self processName];
      int v11 = [(WPDClient *)self processID];
      int v12 = [v6 subscribedCharacteristics];
      int v35 = 138544386;
      id v36 = v4;
      __int16 v37 = 2114;
      uint64_t v38 = v9;
      __int16 v39 = 2114;
      id v40 = v10;
      __int16 v41 = 1024;
      *(_DWORD *)id v42 = v11;
      v42[2] = 2114;
      *(void *)&v42[3] = v12;
      _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "Disconnect from %{public}@ called by client %{public}@ - process %{public}@ (%d) - subscribed characteristics: %{public}@", (uint8_t *)&v35, 0x30u);
    }
    if (![(WPDClient *)self registered])
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_856);
      }
      int v20 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient disconnectFromPeer:](v20);
      }
      goto LABEL_34;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pipeManager);
    __int16 v14 = [(WPDClient *)self clientUUID];
    [WeakRetained setConnectionInitiator:0 forPeer:v4 forClient:v14];

    if (!v6)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_850);
      }
      id v21 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        int v35 = 138412290;
        id v36 = v4;
        _os_log_impl(&dword_22316D000, v21, OS_LOG_TYPE_INFO, "WPDConnection doesn't exist for %@", (uint8_t *)&v35, 0xCu);
      }
      __int16 v22 = [(WPDClient *)self lePipePeersSet];
      int v23 = [v22 containsObject:v4];

      if (v23)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_853);
        }
        __int16 v24 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = v24;
          __int16 v26 = [(WPDClient *)self clientTypeString];
          uint64_t v27 = [(WPDClient *)self processName];
          uint64_t v28 = [(WPDClient *)self lePipePeersSet];
          int v35 = 138413058;
          id v36 = v26;
          __int16 v37 = 2112;
          uint64_t v38 = v27;
          __int16 v39 = 2112;
          id v40 = v4;
          __int16 v41 = 2112;
          *(void *)id v42 = v28;
          _os_log_impl(&dword_22316D000, v25, OS_LOG_TYPE_DEFAULT, "%@ (%@) Disconnect over LE Pipe %@, current pipes %@", (uint8_t *)&v35, 0x2Au);
        }
        id v29 = objc_loadWeakRetained((id *)&self->_pipeManager);
        double v30 = [(WPDClient *)self clientUUID];
        [v29 setPipeClientConnectionStatus:0 forPeer:v4 forClient:v30];

        [(WPDClient *)self disconnectedDeviceOverLEPipe:v4 withError:0];
      }
      else
      {
        uint64_t v31 = [(WPDClient *)self scanManager];
        __int16 v32 = [(WPDClient *)self clientUUID];
        [v31 removePeripheralConnection:v4 forClient:v32];

        [(WPDClient *)self cancelConnectionTimer:v4];
        uint64_t v33 = [(WPDClient *)self conn];
        __int16 v34 = [v33 remoteObjectProxy];
        [v34 disconnectedDevice:v4 withError:0];
      }
      goto LABEL_34;
    }
    uint64_t v15 = [v6 fetchConnectionType];
    if ((unint64_t)(v15 - 1) > 1)
    {
      if (v15)
      {
        int v19 = 0;
LABEL_33:
        [(WPDClient *)self disconnectedPeer:v4 error:v19];

LABEL_34:
        goto LABEL_35;
      }
      uint64_t v16 = [(WPDClient *)self scanManager];
      __int16 v17 = [(WPDClient *)self clientUUID];
      [v16 disconnectFromCentral:v4 forClient:v17];
      int v19 = 0;
    }
    else
    {
      uint64_t v16 = [(WPDClient *)self scanManager];
      __int16 v17 = [v6 subscribedCharacteristics];
      __int16 v18 = [(WPDClient *)self clientUUID];
      int v19 = [v16 disconnectFromPeripheral:v4 withSubscribedCharacteristics:v17 forClient:v18];
    }
    goto LABEL_33;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_844);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDClient disconnectFromPeer:]();
  }
LABEL_35:
}

- (void)disconnectedPeer:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WPDClient *)self connections];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    if ([v9 didConnectSent])
    {
      uint64_t v10 = [(WPDClient *)self lePipePeersSet];
      char v11 = [v10 containsObject:v6];

      if (v11)
      {
LABEL_23:
        __int16 v18 = [(WPDClient *)self connections];
        [v18 removeObjectForKey:v6];
        goto LABEL_24;
      }
      int v12 = [(WPDClient *)self conn];
      uint64_t v13 = [v12 remoteObjectProxy];
      [v13 disconnectedDevice:v6 withError:v7];
    }
    else
    {
      if (v7)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_861);
        }
        int v20 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDClient stopAdvertising_async:](v20);
        }
        [(WPDClient *)self connectedDevice:v6 withError:v7 shouldDiscover:0];
        goto LABEL_23;
      }
      int v12 = [NSString stringWithFormat:@"locally initiated disconnection"];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_867);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient disconnectedPeer:error:]();
      }
      id v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08320];
      __int16 v24 = v12;
      __int16 v22 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v13 = [v21 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v22];

      [(WPDClient *)self connectedDevice:v6 withError:v13 shouldDiscover:0];
    }

    goto LABEL_23;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_858);
  }
  __int16 v14 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEFAULT, "Disconnected peer %@ but no connection object is set - check to see if we have pending connection", buf, 0xCu);
  }
  uint64_t v15 = [(WPDClient *)self scanManager];
  uint64_t v16 = [(WPDClient *)self clientUUID];
  [v15 removePeripheralConnection:v6 forClient:v16];

  [(WPDClient *)self cancelConnectionTimer:v6];
  __int16 v17 = [(WPDClient *)self lePipePeersSet];
  LOBYTE(v16) = [v17 containsObject:v6];

  if ((v16 & 1) == 0)
  {
    __int16 v18 = [(WPDClient *)self conn];
    int v19 = [v18 remoteObjectProxy];
    [v19 disconnectedDevice:v6 withError:0];

LABEL_24:
  }
}

- (void)disconnectedDeviceOverLEPipe:(id)a3 withError:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_869);
  }
  id v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = [v7 localizedDescription];
    char v11 = [(WPDClient *)self clientUUID];
    int v12 = [(WPDClient *)self processName];
    uint64_t v13 = [(WPDClient *)self lePipePeersSet];
    int v22 = 138413314;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    uint64_t v31 = v13;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "Disconnected peer %@ over LE pipe with err %@ for client %@ (%@), pipe peers %@", (uint8_t *)&v22, 0x34u);
  }
  __int16 v14 = [(WPDClient *)self lePipePeersSet];
  int v15 = [v14 containsObject:v6];

  if (v15)
  {
    uint64_t v16 = [(WPDClient *)self lePipePeersSet];
    [v16 removeObject:v6];

    __int16 v17 = [(WPDClient *)self scanManager];
    __int16 v18 = [(WPDClient *)self clientUUID];
    [v17 removePeripheralConnection:v6 forClient:v18];

    [(WPDClient *)self cancelConnectionTimer:v6];
    int v19 = [(WPDClient *)self conn];
    int v20 = [v19 remoteObjectProxy];
    [v20 disconnectedDeviceOverLEPipe:v6 withError:v7];

    id v21 = [(WPDClient *)self connections];
    [v21 removeObjectForKey:v6];
  }
}

- (void)createdConnection:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  uint64_t v5 = [v4 fetchConnectionType];
  id v6 = [v4 getPeripheralUUID];
  if (!v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_877);
    }
    char v11 = (void *)WiProxLog;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v8 = v11;
    id v9 = [(WPDClient *)self clientUUID];
    *(_DWORD *)int v20 = 138543618;
    *(void *)&v20[4] = v6;
    *(_WORD *)&v20[12] = 2114;
    *(void *)&v20[14] = v9;
    uint64_t v10 = "Created a connection to central %{public}@ for client %{public}@";
LABEL_12:
    _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, v10, v20, 0x16u);

LABEL_13:
    -[WPDClient cancelConnectionTimer:](self, "cancelConnectionTimer:", v6, *(_OWORD *)v20, *(void *)&v20[16], v21);
    goto LABEL_18;
  }
  if (v5 != 1)
  {
    if (v5 != 2) {
      goto LABEL_18;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_871);
    }
    id v7 = (void *)WiProxLog;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v8 = v7;
    id v9 = [(WPDClient *)self clientUUID];
    *(_DWORD *)int v20 = 138543618;
    *(void *)&v20[4] = v6;
    *(_WORD *)&v20[12] = 2114;
    *(void *)&v20[14] = v9;
    uint64_t v10 = "Created a dual connection to peer %{public}@ for client %{public}@";
    goto LABEL_12;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_874);
  }
  int v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    __int16 v14 = [(WPDClient *)self clientUUID];
    *(_DWORD *)int v20 = 138543618;
    *(void *)&v20[4] = v6;
    *(_WORD *)&v20[12] = 2114;
    *(void *)&v20[14] = v14;
    _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "Created a connection to peripheral %{public}@ for client %{public}@", v20, 0x16u);
  }
LABEL_18:
  int v15 = [(WPDClient *)self connections];
  uint64_t v16 = [v15 objectForKeyedSubscript:v6];

  if (v16)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_880);
    }
    __int16 v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v20 = 138543362;
      *(void *)&v20[4] = v6;
      _os_log_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEFAULT, "Being given a new connection to %{public}@ when we already have a connection to it", v20, 0xCu);
    }
  }
  if (([(WPDClient *)self holdVouchers] & 2) != 0) {
    [v4 holdVoucher];
  }
  __int16 v18 = [(WPDClient *)self connections];
  [v18 setObject:v4 forKeyedSubscript:v6];

  int v19 = [v4 getPeripheralUUID];
  [(WPDClient *)self connectedDevice:v19 withError:0 shouldDiscover:1];
}

- (void)cancelConnectionTimer:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WPDClient *)self connectionTimer];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_882);
    }
    id v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "Cancel connnection timer for peer %@", (uint8_t *)&v11, 0xCu);
    }
    id v8 = [(WPDClient *)self connectionTimer];
    id v9 = [v8 objectForKeyedSubscript:v4];
    dispatch_source_cancel(v9);

    uint64_t v10 = [(WPDClient *)self connectionTimer];
    [v10 setObject:0 forKeyedSubscript:v4];
  }
}

- (void)shouldSubscribe:(BOOL)a3 toPeer:(id)a4 withCharacteristic:(id)a5 inService:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 isEqual:AllZeroUUID])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_884);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient shouldSubscribe:toPeer:withCharacteristic:inService:]();
    }
  }
  else
  {
    uint64_t v13 = [(WPDClient *)self connections];
    __int16 v14 = [v13 objectForKeyedSubscript:v10];

    if ([(WPDClient *)self registered] && v14)
    {
      id v15 = (id)[v14 subscribe:v8 toPeer:v10 withCharacteristic:v11 inService:v12];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_887);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient shouldSubscribe:toPeer:withCharacteristic:inService:]();
      }
    }
  }
}

- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(WPDClient *)self lePipePeersSet];
  int v14 = [v13 containsObject:v12];

  if (v14)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_889);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient updatedNotificationState:forCharacteristic:inService:withPeripheral:]();
    }
    id v15 = [(WPDClient *)self lePipePeersSet];
    [v15 removeObject:v12];
  }
  uint64_t v16 = [(WPDClient *)self connections];
  __int16 v17 = [v16 objectForKeyedSubscript:v12];

  if ([v17 didConnectSent] && objc_msgSend(v17, "fetchConnectionType") != 2)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_892);
    }
    int v20 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEFAULT, "We've already sent a didConnect event as the central might have subscribed in the meantime. Not sending didConnect again because it's not dual connection", v21, 2u);
    }
  }
  else
  {
    [v17 setDidConnectSent:1];
    __int16 v18 = [(WPDClient *)self conn];
    int v19 = [v18 remoteObjectProxy];
    [v19 updatedNotificationState:v8 forCharacteristic:v10 inService:v11 withPeripheral:v12];
  }
}

- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6
{
  BOOL v8 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(WPDClient *)self lePipePeersSet];
  int v14 = [v13 containsObject:v10];

  if (v14)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_894);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient central:subscribed:toCharacteristic:inService:]();
    }
    id v15 = [(WPDClient *)self lePipePeersSet];
    [v15 removeObject:v10];
  }
  uint64_t v16 = [(WPDClient *)self lePipePeersSet];
  char v17 = [v16 containsObject:v10];

  if ((v17 & 1) == 0)
  {
    __int16 v18 = [(WPDClient *)self conn];
    int v19 = [v18 remoteObjectProxy];
    [v19 central:v10 subscribed:v8 toCharacteristic:v11 inService:v12];
  }
  int v20 = [(WPDClient *)self connections];
  uint64_t v21 = [v20 objectForKeyedSubscript:v10];

  if (v8)
  {
    [v21 setDidConnectSent:1];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_897);
    }
    int v22 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v22;
      __int16 v24 = [v10 UUIDString];
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v24;
      __int16 v34 = 2114;
      id v35 = v11;
      _os_log_impl(&dword_22316D000, v23, OS_LOG_TYPE_DEFAULT, "Central %{public}@ has unsubscribed from characteristics %{public}@", buf, 0x16u);
    }
    if (v21)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_900);
      }
      id v25 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v25, OS_LOG_TYPE_DEFAULT, "A connection already existed...disconnecting", buf, 2u);
      }
      [(WPDClient *)self disconnectFromPeer:v10];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_903);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDClient central:subscribed:toCharacteristic:inService:]();
      }
      __int16 v26 = [NSString stringWithFormat:@"A central unsubscribed while a connection didn't exist"];
      uint64_t v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F08320];
      uint64_t v31 = v26;
      __int16 v28 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      id v29 = [v27 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v28];

      [(WPDClient *)self connectedDevice:v10 withError:v29 shouldDiscover:0];
    }
  }
}

- (void)discoverCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(WPDClient *)self connections];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if ([(WPDClient *)self registered] && v9)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_908);
    }
    id v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_INFO, "Trying to discover characteristics and services %@ on device %@", (uint8_t *)&v11, 0x16u);
    }
    [v9 discoverCharacteristicsAndServices:v6 forPeripheral:v7];
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_911);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient discoverCharacteristicsAndServices:forPeripheral:]();
    }
  }
}

- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(WPDClient *)self lePipePeersSet];
  int v9 = [v8 containsObject:v7];

  if (v9)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_913);
    }
    id v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v10;
      id v12 = [(WPDClient *)self clientTypeString];
      __int16 v13 = [(WPDClient *)self processName];
      id v14 = [(WPDClient *)self lePipePeersSet];
      int v17 = 138413058;
      __int16 v18 = v12;
      __int16 v19 = 2112;
      int v20 = v13;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "%@ (%@) connected to LE pipe during service discovery %{public}@, current pipes %@", (uint8_t *)&v17, 0x2Au);
    }
  }
  else
  {
    uint64_t v15 = [(WPDClient *)self conn];
    uint64_t v16 = [v15 remoteObjectProxy];
    [v16 discoveredCharacteristicsAndServices:v6 forPeripheral:v7];
  }
}

- (void)sendDataToCharacteristic:(id)a3 inService:(id)a4 forPeer:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v10 isEqual:AllZeroUUID])
  {
    int v11 = [(WPDClient *)self lePipePeersSet];
    int v12 = [v11 containsObject:v10];

    if (v12)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_918);
      }
      __int16 v13 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "Send data over LE pipe", buf, 2u);
      }
      id v14 = [v8 data];
      [(WPDClient *)self sendDatatoLePipe:v14 forPeer:v10];
      goto LABEL_27;
    }
    uint64_t v15 = [(WPDClient *)self connections];
    id v14 = [v15 objectForKeyedSubscript:v10];

    if ([(WPDClient *)self registered] && v14)
    {
      uint64_t v16 = [v8 data];
      [v16 length];
      kdebug_trace();

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_921);
      }
      int v17 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = v17;
        __int16 v19 = [v10 UUIDString];
        int v20 = [v8 data];
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = v19;
        __int16 v33 = 2048;
        uint64_t v34 = [v20 length];
        _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_INFO, "Begin sending data to peer %@ of length %ld", buf, 0x16u);
      }
      __int16 v21 = [v14 sendDataToCharacteristic:v8 inService:v9 forPeer:v10];
      if (!v21) {
        goto LABEL_26;
      }
      id v22 = [v8 data];
      __int16 v23 = [v8 uuid];
      __int16 v24 = [v23 UUIDString];
      [(WPDClient *)self sentData:v22 forCharacteristic:v24 inService:v9 forPeripheral:v10 withError:v21];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_924);
      }
      uint64_t v25 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      {
        -[WPDClient sendDataToCharacteristic:inService:forPeer:](v25, self, (uint64_t)v14);
        if (v14) {
          goto LABEL_27;
        }
      }
      else if (v14)
      {
LABEL_27:

        goto LABEL_28;
      }
      __int16 v21 = [NSString stringWithFormat:@"Device is already disconnected"];
      __int16 v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F08320];
      uint64_t v30 = v21;
      uint64_t v27 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v22 = [v26 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v27];

      __int16 v23 = [v8 data];
      __int16 v24 = [v8 uuid];
      __int16 v28 = [v24 UUIDString];
      [(WPDClient *)self sentData:v23 forCharacteristic:v28 inService:v9 forPeripheral:v10 withError:v22];
    }
LABEL_26:

    goto LABEL_27;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_915);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDClient sendDataToCharacteristic:inService:forPeer:]();
  }
LABEL_28:
}

- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  [v12 length];
  kdebug_trace();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_929);
  }
  int v17 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = v17;
    __int16 v19 = [v13 UUIDString];
    uint64_t v20 = [v12 length];
    __int16 v21 = [v14 localizedDescription];
    int v24 = 138412802;
    uint64_t v25 = v19;
    __int16 v26 = 2048;
    uint64_t v27 = v20;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_INFO, "End sending data to peer %@ of length %ld with error: %@", (uint8_t *)&v24, 0x20u);
  }
  id v22 = [(WPDClient *)self conn];
  __int16 v23 = [v22 remoteObjectProxy];
  [v23 sentData:v12 forCharacteristic:v16 inService:v15 forPeripheral:v13 withError:v14];
}

- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_931);
  }
  id v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    id v15 = v14;
    id v16 = [v12 UUIDString];
    uint64_t v17 = [v10 length];
    __int16 v18 = [v13 localizedDescription];
    int v21 = 138413058;
    id v22 = v16;
    __int16 v23 = 2048;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    __int16 v28 = v18;
    _os_log_impl(&dword_22316D000, v15, OS_LOG_TYPE_INFO, "End sending data to peer %@ of length %ld to enpoint %@ with error: %@", (uint8_t *)&v21, 0x2Au);
  }
  __int16 v19 = [(WPDClient *)self conn];
  uint64_t v20 = [v19 remoteObjectProxy];
  [v20 sentData:v10 toEndpoint:v11 forPeripheral:v12 withError:v13];
}

- (void)receivedData:(id)a3 fromCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_933);
  }
  id v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = v14;
    __int16 v18 = [v13 UUIDString];
    int v19 = 138412802;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v18;
    _os_log_debug_impl(&dword_22316D000, v17, OS_LOG_TYPE_DEBUG, "Client received value update for characteristic %@ in service %@ for peripheral %@. Notifying client implementation.", (uint8_t *)&v19, 0x20u);
  }
  id v15 = [(WPDClient *)self conn];
  id v16 = [v15 remoteObjectProxy];
  [v16 receivedData:v10 forCharacteristic:v11 inService:v12 forPeripheral:v13];
}

- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(WPDClient *)self lePipePeersSet];
  char v12 = [v11 containsObject:v9];

  if ((v12 & 1) == 0)
  {
    id v13 = [(WPDClient *)self lePipePeersSet];
    [v13 addObject:v9];
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_935);
  }
  id v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDClient receivedData:fromEndpoint:forPeripheral:]((uint64_t)v8, v14, v9);
  }
  id v15 = [(WPDClient *)self conn];
  id v16 = [v15 remoteObjectProxy];
  [v16 receivedData:v10 fromEndpoint:v8 forPeripheral:v9];
}

- (void)enableRanging:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  id v7 = [(WPDClient *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__WPDClient_enableRanging_reply___block_invoke;
  block[3] = &unk_26469B018;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __33__WPDClient_enableRanging_reply___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_20;
  }
  if (([*(id *)(a1 + 32) supportsRanging] & 1) == 0)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_937);
    }
    id v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __33__WPDClient_enableRanging_reply___block_invoke_cold_2(a1, (id *)(a1 + 32), v9);
    }
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"Ranging is not supported.";
    id v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    BOOL v12 = v10;
    uint64_t v13 = 27;
    goto LABEL_15;
  }
  if (([*(id *)(a1 + 32) entitledForRanging] & 1) == 0)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_945);
    }
    id v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __33__WPDClient_enableRanging_reply___block_invoke_cold_1(a1, (id *)(a1 + 32), v14);
    }
    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    __int16 v18 = @"The client is not entitled to manipulate ranging.";
    id v11 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    BOOL v12 = v15;
    uint64_t v13 = 29;
LABEL_15:
    id v8 = [v12 errorWithDomain:@"WPErrorDomain" code:v13 userInfo:v11];

    goto LABEL_16;
  }
  uint64_t v3 = [WeakRetained server];
  [v3 enableRanging:*(unsigned __int8 *)(a1 + 56)];

  id v4 = [WeakRetained scanManager];
  [v4 enableRanging:*(unsigned __int8 *)(a1 + 56)];

  uint64_t v5 = [WeakRetained advertisingManager];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  id v7 = [WeakRetained clientUUID];
  [v5 enableRanging:v6 forClient:v7];

  id v8 = 0;
LABEL_16:
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v8);
  }
  else {
    [WeakRetained rangingEnabled:*(unsigned __int8 *)(a1 + 56) withError:v8];
  }

LABEL_20:
}

- (void)isRangingEnabledReply:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WPDClient *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WPDClient_isRangingEnabledReply___block_invoke;
  block[3] = &unk_26469AC88;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__WPDClient_isRangingEnabledReply___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained entitledForRanging])
    {
      id v4 = [v3 server];
      uint64_t v5 = [v4 isRangingEnabled];

      id v6 = 0;
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_950);
      }
      id v7 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        __35__WPDClient_isRangingEnabledReply___block_invoke_cold_1(v7);
      }
      id v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F08320];
      v12[0] = @"The client is not entitled to manipulate ranging";
      id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v6 = [v8 errorWithDomain:@"WPErrorDomain" code:29 userInfo:v9];

      uint64_t v5 = 0;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v10, v6, v5);
    }
    else {
      [v3 rangingEnabled:v5 withError:v6];
    }
  }
}

- (void)rangingEnabled:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_955);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    if (v4) {
      uint64_t v10 = "enabled";
    }
    else {
      uint64_t v10 = "disabled";
    }
    uint64_t v11 = v7;
    BOOL v12 = [(WPDClient *)self processName];
    int v13 = 136315906;
    id v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 1024;
    int v18 = [(WPDClient *)self processID];
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEBUG, "Ranging %s for client %@ (%d) with error: %@", (uint8_t *)&v13, 0x26u);
  }
  id v8 = [(WPDClient *)self conn];
  id v9 = [v8 remoteObjectProxy];
  [v9 rangingEnabled:v4 withError:v6];
}

- (void)checkAllowDuplicates:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t))a3;
  if ([(WPDClient *)self registered])
  {
    v4[2](v4, 1);
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_959);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDClient checkAllowDuplicates:]();
    }
  }
}

- (id)getManager
{
  uint64_t v2 = [(WPDClient *)self advertisingManager];
  uint64_t v3 = [v2 getManager];

  return v3;
}

- (id)connectionForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WPDClient *)self connections];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)readyForDataTransfer
{
  if ([(WPDClient *)self registered])
  {
    id v3 = [(WPDClient *)self connections];
    [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_961];
  }
}

uint64_t __33__WPDClient_readyForDataTransfer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 readyForDataTransfer];
}

- (void)enableTestMode
{
  if ([(WPDClient *)self isTestModeClient])
  {
    id v4 = [(WPDClient *)self server];
    [v4 enableTestMode];
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFF940];
    id v4 = [(WPDClient *)self processName];
    [v3 raise:@"Illegal Operation", @"Enabling test mode for process %@ is not supported", v4 format];
  }
}

- (void)overrideScanTimeout:(double)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_969);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(WPDClient *)self clientTypeString];
    int v8 = 134218242;
    double v9 = a3;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "Overriding scan timeout to %f for %@", (uint8_t *)&v8, 0x16u);
  }
  [(WPDClient *)self setScanTimeout:a3];
}

- (void)overrideAdvTimeout:(double)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_971);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(WPDClient *)self clientTypeString];
    int v8 = 134218242;
    double v9 = a3;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22316D000, v6, OS_LOG_TYPE_DEFAULT, "Overriding advertising timeout to %f for %@", (uint8_t *)&v8, 0x16u);
  }
  [(WPDClient *)self setAdvTimeout:a3];
}

- (void)getPowerLogStats:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = [(WPDClient *)self server];
  id v6 = [v5 statsManager];
  id v7 = [v6 getStatsDictionary];

  v4[2](v4, v7);
}

- (void)disableScanning
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(WPDClient *)self canDisableScans])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_976);
    }
    id v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = [(WPDClient *)self processName];
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v5;
      __int16 v12 = 1024;
      int v13 = [(WPDClient *)self processID];
      _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "Disabling all scanning called by process %{public}@ (%d)", buf, 0x12u);
    }
    id v6 = [(WPDClient *)self server];
    id v7 = [(WPDClient *)self clientUUID];
    [v6 disableScanningForClient:v7];
  }
  else
  {
    int v8 = (void *)MEMORY[0x263EFF940];
    id v9 = [(WPDClient *)self processName];
    [v8 raise:@"Illegal Operation", @"Disabling scans for process %@ is not supported", v9 format];
  }
}

- (void)dumpDaemonState
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_978);
  }
  id v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEFAULT, "Manually triggered statedump", v5, 2u);
  }
  id v4 = [(WPDClient *)self server];
  [v4 dumpDaemonState];
}

- (void)registerEndpoint:(id)a3 requireAck:(BOOL)a4 requireEncryption:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    endpointsSet = self->_endpointsSet;
    id v9 = a3;
    [(NSMutableSet *)endpointsSet addObject:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pipeManager);
    uint64_t v11 = [(WPDClient *)self clientUUID];
    [WeakRetained registerEndpoint:v9 requireAck:v6 requireEncryption:v5 forClient:v11];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_980);
    }
    __int16 v12 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = v12;
      uint64_t v14 = [(WPDClient *)self endpointsSet];
      int v15 = 138412290;
      uint64_t v16 = v14;
      _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "registerEndpoint: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)unregisterEndpoint:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3)
  {
    endpointsSet = self->_endpointsSet;
    id v5 = a3;
    [(NSMutableSet *)endpointsSet removeObject:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pipeManager);
    id v7 = [(WPDClient *)self clientUUID];
    [WeakRetained unregisterEndpoint:v5 forClient:v7];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_982);
    }
    int v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      __int16 v10 = [(WPDClient *)self endpointsSet];
      int v11 = 138412290;
      __int16 v12 = v10;
      _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "unregisterEndpoint: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)sendDatatoLePipe:(id)a3 forPeer:(id)a4
{
  p_pipeManager = &self->_pipeManager;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pipeManager);
  id v9 = [(WPDClient *)self clientUUID];
  [WeakRetained sendData:v8 forPeer:v7 forClient:v9];
}

- (void)stopScans
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  id v3 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v4, v5, "Trying to stop scanning when process %d (client %@) is not registered with daemon - ignoring", v6, v7, v8, v9, v10);
}

- (void)sendTestRequest:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_986);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    [(WPDClient *)(uint64_t)v4 sendTestRequest:self];
  }
  if ([(WPDClient *)self isTestModeClient])
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"kWPTestRequestKeyID"];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 integerValue];
      if ((unint64_t)(v8 - 1) <= 7)
      {
        id location = 0;
        objc_initWeak(&location, self);
        uint64_t v9 = [(WPDClient *)self serverQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __29__WPDClient_sendTestRequest___block_invoke_987;
        block[3] = &unk_26469AD78;
        objc_copyWeak(&v14, &location);
        id v13 = v4;
        dispatch_async(v9, block);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_989);
    }
    int v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      [(WPDClient *)v8 sendTestRequest:self];
    }
    goto LABEL_18;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_992);
  }
  uint8_t v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDClient sendTestRequest:](v10, self);
  }
LABEL_19:
}

uint64_t __29__WPDClient_sendTestRequest___block_invoke_987(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    if ([WeakRetained isObjectDiscovery])
    {
      id v3 = [v8 server];
      id v4 = [v3 spObjectDiscoveryClient];

      if (v4)
      {
        uint64_t v5 = [v8 server];
        uint64_t v6 = [v5 spObjectDiscoveryClient];
        [v6 sendTestRequest:*(void *)(a1 + 32)];
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)receivedTestResponse:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_994);
  }
  uint64_t v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    [(WPDClient *)(uint64_t)v4 receivedTestResponse:self];
  }
  uint64_t v6 = [(WPDClient *)self conn];
  uint64_t v7 = [v6 remoteObjectProxy];
  [v7 receivedTestResponse:v4];
}

- (void)_signpostBegin
{
  id v3 = (id)WiProxLog;
  id v4 = v3;
  os_signpost_id_t wpDClientSignPostID = self->_wpDClientSignPostID;
  if (wpDClientSignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_22316D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, wpDClientSignPostID, "receivedPayload", (const char *)&unk_2231D26A1, v6, 2u);
  }
}

- (void)_signpostEnd
{
  id v3 = (id)WiProxLog;
  id v4 = v3;
  os_signpost_id_t wpDClientSignPostID = self->_wpDClientSignPostID;
  if (wpDClientSignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_22316D000, v4, OS_SIGNPOST_INTERVAL_END, wpDClientSignPostID, "receivedPayload", (const char *)&unk_2231D26A1, v6, 2u);
  }
}

- (WPDClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WPDClientDelegate *)WeakRetained;
}

- (void)setClientUUID:(id)a3
{
}

- (NSString)clientTypeString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClientTypeString:(id)a3
{
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (void)setProcessName:(id)a3
{
}

- (void)setIsTestModeClient:(BOOL)a3
{
  self->_isTestModeClient = a3;
}

- (BOOL)canDisableScans
{
  return self->_canDisableScans;
}

- (void)setCanDisableScans:(BOOL)a3
{
  self->_canDisableScans = a3;
}

- (NSMutableSet)endpointsSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEndpointsSet:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (void)setConn:(id)a3
{
}

- (OS_dispatch_queue)messageQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMessageQueue:(id)a3
{
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (WPDaemonServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (WPDaemonServer *)WeakRetained;
}

- (NSString)machName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMachName:(id)a3
{
}

- (BOOL)portTickled
{
  return self->_portTickled;
}

- (void)setPortTickled:(BOOL)a3
{
  self->_portTickled = a3;
}

- (void)setHoldVouchers:(int64_t)a3
{
  self->_holdVouchers = a3;
}

- (void)setScanManager:(id)a3
{
}

- (void)setAdvertisingManager:(id)a3
{
}

- (WPDZoneManager)zoneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoneManager);
  return (WPDZoneManager *)WeakRetained;
}

- (void)setZoneManager:(id)a3
{
}

- (WPDPipeManager)pipeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipeManager);
  return (WPDPipeManager *)WeakRetained;
}

- (void)setPipeManager:(id)a3
{
}

- (WPDObjectDiscoveryManager)objectDiscoveryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectDiscoveryManager);
  return (WPDObjectDiscoveryManager *)WeakRetained;
}

- (void)setObjectDiscoveryManager:(id)a3
{
}

- (NSMutableDictionary)connections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setConnections:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 184, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)entitledForZones
{
  return self->_entitledForZones;
}

- (void)setEntitledForZones:(BOOL)a3
{
  self->_entitledForZones = a3;
}

- (BOOL)entitledForObjectDiscovery
{
  return self->_entitledForObjectDiscovery;
}

- (void)setEntitledForObjectDiscovery:(BOOL)a3
{
  self->_entitledForObjectDiscovery = a3;
}

- (BOOL)entitledForRanging
{
  return self->_entitledForRanging;
}

- (void)setEntitledForRanging:(BOOL)a3
{
  self->_entitledForRanging = a3;
}

- (BOOL)pendingSent
{
  return self->_pendingSent;
}

- (void)setAdvertTimers:(id)a3
{
}

- (NSMutableDictionary)advertTimerState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAdvertTimerState:(id)a3
{
}

- (void)setScanTimers:(id)a3
{
}

- (NSMutableDictionary)connectionTimer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setConnectionTimer:(id)a3
{
}

- (BOOL)scanDenylisted
{
  return self->_scanDenylisted;
}

- (void)setScanDenylisted:(BOOL)a3
{
  self->_scanDenylisted = a3;
}

- (void)setScansOff:(BOOL)a3
{
  self->_scansOff = a3;
}

- (double)scanTimeout
{
  return self->_scanTimeout;
}

- (void)setScanTimeout:(double)a3
{
  self->_scanTimeout = a3;
}

- (double)advTimeout
{
  return self->_advTimeout;
}

- (void)setAdvTimeout:(double)a3
{
  self->_advTimeout = a3;
}

- (NSMutableSet)lePipePeersSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLePipePeersSet:(id)a3
{
}

- (BOOL)isObjectDiscovery
{
  return self->_isObjectDiscovery;
}

- (void)setIsObjectDiscovery:(BOOL)a3
{
  self->_isObjectDiscovery = a3;
}

- (BOOL)supportsObjectDiscovery
{
  return self->_supportsObjectDiscovery;
}

- (BOOL)supportsRanging
{
  return self->_supportsRanging;
}

- (OS_voucher)scanVoucher
{
  return self->_scanVoucher;
}

- (void)setScanVoucher:(id)a3
{
}

- (OS_voucher)advertVoucher
{
  return self->_advertVoucher;
}

- (void)setAdvertVoucher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertVoucher, 0);
  objc_storeStrong((id *)&self->_scanVoucher, 0);
  objc_storeStrong((id *)&self->_lePipePeersSet, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_scanTimers, 0);
  objc_storeStrong((id *)&self->_advertTimerState, 0);
  objc_storeStrong((id *)&self->_advertTimers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_destroyWeak((id *)&self->_objectDiscoveryManager);
  objc_destroyWeak((id *)&self->_pipeManager);
  objc_destroyWeak((id *)&self->_zoneManager);
  objc_destroyWeak((id *)&self->_advertisingManager);
  objc_destroyWeak((id *)&self->_scanManager);
  objc_storeStrong((id *)&self->_machName, 0);
  objc_destroyWeak((id *)&self->_serverQueue);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_endpointsSet, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_clientTypeString, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithXPCConnection:server:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_22316D000, v0, (uint64_t)v0, "PID %d bundleID %@ from local process", v1);
}

- (void)initWithXPCConnection:server:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_22316D000, v0, (uint64_t)v0, "PID %d bundleID %@", v1);
}

void __42__WPDClient_initWithXPCConnection_server___block_invoke_484_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = AllZeroUUID;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "Initialised AllZeroUUID to %@", (uint8_t *)&v1, 0xCu);
}

- (void)registerWithDaemon:(void *)a1 forProcess:(void *)a2 machName:holdVouchers:.cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id v4 = [a2 clientUUID];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEBUG, "WPDClient subclass instance created %@", v5, 0xCu);
}

- (void)startAdvertising:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v4 = a1;
  [a2 processName];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_22316D000, v5, v6, "Advert voucher copy for process %{public}@ (%d)", v7, v8, v9, v10, 2u);
}

- (void)startAdvertising_async:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 processID];
  id v4 = [a2 clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_22316D000, v5, v6, "Trying to start advertising ObjectDiscovery for process %d (client %@) when not supported - ignoring", v7, v8, v9, v10, v11);
}

- (void)startAdvertising_async:(unsigned __int8)a1 .cold.2(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "Canceled previous advert timer for client %d", (uint8_t *)v2, 8u);
}

- (void)startAdvertising_async:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v4 = a1;
  OUTLINED_FUNCTION_16();
  uint64_t v5 = [a2 clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_22316D000, v6, v7, "Trying to start advertising when process %d (client %@) is not registered with daemon - ignoring", v8, v9, v10, v11, v12);
}

- (void)stopAdvertising:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v4 = a1;
  [a2 processName];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_22316D000, v5, v6, "Advert voucher release for process %{public}@ (%d)", v7, v8, v9, v10, 2u);
}

- (void)stopAdvertising_async:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v1, v4, "%@", v5);
}

- (void)stopAdvertising_async:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v4, v5, "Trying to stop advertising ObjectDiscovery for process %d (client %@) when not supported - ignoring", v6, v7, v8, v9, v10);
}

- (void)stopAdvertising_async:(void *)a1 .cold.3(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v4, v5, "Trying to stop advertising when process %d (client %@) is not registered with daemon - ignoring", v6, v7, v8, v9, v10);
}

- (void)notifyClientStateChange:(uint64_t)a3 Restricted:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = [a2 processName];
  [a2 processID];
  int v7 = 138412802;
  uint64_t v8 = v6;
  OUTLINED_FUNCTION_7();
  __int16 v9 = 2048;
  uint64_t v10 = a3;
  _os_log_debug_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEBUG, "Notifying client %@ (%d) about state change %ld", (uint8_t *)&v7, 0x1Cu);
}

- (void)notifyClientStateChange:(void *)a1 Restricted:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a1;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_15() processName];
  v6[0] = 67109890;
  v6[1] = 3;
  __int16 v7 = 1024;
  int v8 = 2;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 1024;
  int v12 = [a2 processID];
  _os_log_debug_impl(&dword_22316D000, v2, OS_LOG_TYPE_DEBUG, "Modified state %d -> %d for client %@ (%d) per <rdar://problem/33456853>", (uint8_t *)v6, 0x1Eu);
}

- (void)startScanning:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v4 = a1;
  [a2 processName];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_22316D000, v5, v6, "Scan voucher copy for process %{public}@ (%d)", v7, v8, v9, v10, 2u);
}

- (void)startScanning_async:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v4 = a1;
  OUTLINED_FUNCTION_16();
  uint64_t v5 = [a2 clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_22316D000, v6, v7, "Trying to start scanning for denylisted process %d (client %@) while in restricted state - ignoring", v8, v9, v10, v11, v12);
}

- (void)startScanning_async:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPDScanManager is nil", v2, v3, v4, v5, v6);
}

- (void)startScanning_async:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v3, v5, "Failed to enable ADV Buffer with error %@", v6);
}

- (void)startScanning_async:(void *)a1 .cold.4(void *a1, void *a2)
{
  id v4 = a1;
  OUTLINED_FUNCTION_16();
  uint64_t v5 = [a2 clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_22316D000, v6, v7, "Trying to start scanning ObjectDiscovery (18) for process %d (client %@) when not supported - ignoring", v8, v9, v10, v11, v12);
}

- (void)startScanning_async:(void *)a1 .cold.5(void *a1, void *a2)
{
  id v4 = a1;
  OUTLINED_FUNCTION_16();
  uint64_t v5 = [a2 clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_22316D000, v6, v7, "Trying to start scanning ObjectDiscovery (18) for process %d (client %@) when not entitled - ignoring", v8, v9, v10, v11, v12);
}

- (void)startScanning_async:(void *)a1 .cold.6(void *a1, void *a2)
{
  id v4 = a1;
  OUTLINED_FUNCTION_16();
  uint64_t v5 = [a2 clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_22316D000, v6, v7, "Trying to start scanning when process %d (client %@) is not registered with daemon - ignoring", v8, v9, v10, v11, v12);
}

- (void)stopScanning:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v4 = a1;
  [a2 processName];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_22316D000, v5, v6, "Scan voucher release for process %{public}@ (%d)", v7, v8, v9, v10, 2u);
}

- (void)stopScanning_async:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v4, v5, "Trying to stop scanning ObjectDiscovery (18) for process %d (client %@) when not supported - ignoring", v6, v7, v8, v9, v10);
}

- (void)stopScanning_async:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v4, v5, "Trying to stop scanning ObjectDiscovery (18) for process %d (client %@) when not entitled - ignoring", v6, v7, v8, v9, v10);
}

- (void)stopScanning_async:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  id v3 = a2;
  OUTLINED_FUNCTION_8();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_22(&dword_22316D000, v5, v6, "Trying to stop scanning for type %d when process %d (client %@) is not registered with daemon - ignoring", v7, v8, v9, v10, v11);
}

- (void)clearDuplicateFilterCache_async:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  id v3 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v4, v5, "Trying to clear dup filter cache ObjectDiscovery (18) for process %d (client %@) when not supported - ignoring", v6, v7, v8, v9, v10);
}

- (void)clearDuplicateFilterCache_async:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  id v3 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v4, v5, "Trying to clear dup filter cache ObjectDiscovery (18) for process %d (client %@) when not entitled - ignoring", v6, v7, v8, v9, v10);
}

- (void)clearDuplicateFilterCache_async:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  id v3 = a2;
  OUTLINED_FUNCTION_8();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_22(&dword_22316D000, v5, v6, "Trying to clear dup filter cache for type %d when process %d (client %@) is not registered with daemon - ignoring", v7, v8, v9, v10, v11);
}

- (void)startTrackingZone:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Client %@ is not entitled to track zones, invalidating connection", v2, v3, v4, v5, v6);
}

- (void)stopTrackingZones:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Client %@ is not entitled to stop tracking zones, invalidating connection", v2, v3, v4, v5, v6);
}

- (void)enteredZone:manufacturerData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Client %@ is not entitled to receive entered zone event, invalidating connection", v2, v3, v4, v5, v6);
}

- (void)connectToPeer:withOptions:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "Trying to connect to peripheral with all-zero UUID - ignoring", v2, v3, v4, v5, v6);
}

- (void)connectToPeer:(void *)a1 withOptions:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 UUIDString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v3, v5, "Trying to connect to peripheral %@ while device isn't registered with daemon - ignoring", v6);
}

- (void)connectedDevice:(void *)a1 withError:shouldDiscover:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v1, v4, "Sending connected device with error %{public}@", v5);
}

- (void)disconnectFromPeer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "Trying to disconnect from peripheral with all-zero UUID - ignoring", v2, v3, v4, v5, v6);
}

- (void)disconnectFromPeer:(void *)a1 .cold.2(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() UUIDString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v1, v4, "Trying to disconnect to peripheral %@ while device isn't registered with daemon - ignoring", v5);
}

- (void)disconnectedPeer:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)shouldSubscribe:toPeer:withCharacteristic:inService:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "Trying to subscribe to characteristic on peripheral with all-zero UUID - ignoring", v2, v3, v4, v5, v6);
}

- (void)shouldSubscribe:toPeer:withCharacteristic:inService:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "Trying to subscribe while device isn't registered with daemon or there's no connection %@ - ignoring", v2, v3, v4, v5, v6);
}

- (void)updatedNotificationState:forCharacteristic:inService:withPeripheral:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "subscription shouldn't happened over LE pipe - peripheral %@ LE pipe failed!! go back to GATT :((", v2, v3, v4, v5, v6);
}

- (void)central:subscribed:toCharacteristic:inService:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "A connection didn't exist...sending didConnect with error", v2, v3, v4, v5, v6);
}

- (void)central:subscribed:toCharacteristic:inService:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "subscribed shouldn't be received over LE pipe - Central %@ LE pipe failed!! go back to GATT :((", v2, v3, v4, v5, v6);
}

- (void)discoverCharacteristicsAndServices:forPeripheral:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "Trying to discover characteristics while device isn't registered with daemon - ignoring", v2, v3, v4, v5, v6);
}

- (void)sendDataToCharacteristic:inService:forPeer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "Trying to send data to service on peripheral with all-zero UUID - ignoring", v2, v3, v4, v5, v6);
}

- (void)sendDataToCharacteristic:(void *)a1 inService:(void *)a2 forPeer:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  v6[0] = 67109378;
  v6[1] = [a2 registered];
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_22316D000, v5, OS_LOG_TYPE_ERROR, "Trying to send data while device isn't registered %d with daemon OR connection %@ is not valid - ignoring", (uint8_t *)v6, 0x12u);
}

- (void)receivedData:(uint64_t)a1 fromEndpoint:(void *)a2 forPeripheral:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 UUIDString];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_20(&dword_22316D000, v6, v7, "Client received data from endpoint %@ for peripheral %@. Notifying client implementation.", v8, v9, v10, v11, v12);
}

void __33__WPDClient_enableRanging_reply___block_invoke_cold_1(uint64_t a1, id *a2, void *a3)
{
  id v4 = *a2;
  id v5 = a3;
  [v4 processID];
  uint64_t v6 = [*a2 clientUUID];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_21(&dword_22316D000, v7, v8, "Trying to %s ranging for process %d (client %@) when not entitled - ignoring", v9, v10, v11, v12, v13);
}

void __33__WPDClient_enableRanging_reply___block_invoke_cold_2(uint64_t a1, id *a2, void *a3)
{
  id v4 = *a2;
  id v5 = a3;
  [v4 processID];
  uint64_t v6 = [*a2 clientUUID];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_21(&dword_22316D000, v7, v8, "Trying to %s ranging for process %d (client %@) when ranging is not supported - ignoring", v9, v10, v11, v12, v13);
}

void __35__WPDClient_isRangingEnabledReply___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_8();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_9() clientUUID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v4, v5, "Trying to read ranging state for process %d (client %@) when not entitled - ignoring", v6, v7, v8, v9, v10);
}

- (void)checkAllowDuplicates:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "Being asked to check for duplicates when client isn't registered", v2, v3, v4, v5, v6);
}

- (void)sendTestRequest:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v11 = [a3 clientUUID];
  OUTLINED_FUNCTION_3_1(&dword_22316D000, v5, v6, "NOOP send test request %u for client %@, dropping on the floor", v7, v8, v9, v10, 2u);
}

- (void)sendTestRequest:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id v4 = [a2 clientUUID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_1(&dword_22316D000, v3, v5, "Send test request for non-test client %@, dropping on the floor", v6);
}

- (void)sendTestRequest:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = [a3 clientUUID];
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 1024;
  int v12 = [a3 isTestModeClient];
  _os_log_debug_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEBUG, "Send test request %@ for client %@ (test: %d)", (uint8_t *)&v7, 0x1Cu);
}

- (void)receivedTestResponse:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 clientUUID];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_20(&dword_22316D000, v6, v7, "Received test response %@ for client %@", v8, v9, v10, v11, v12);
}

@end