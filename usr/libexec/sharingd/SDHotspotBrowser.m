@interface SDHotspotBrowser
+ (id)sharedBrowser;
- (BOOL)accountHasPairedPeers;
- (BOOL)accountHasTetheringSources;
- (BOOL)bluetoothAllowedForScreenState;
- (BOOL)d2dEncryptionAvailable;
- (BOOL)hasAppleID;
- (BOOL)isTetheringInUse;
- (BOOL)outstandingRequestsHasHotspotDeviceForID:(id)a3;
- (BOOL)pairedPeerIsValid:(id)a3;
- (BOOL)pausedForWiFiPasswordSharing;
- (BOOL)producerScanEnabled;
- (BOOL)sendMessage:(id)a3 toDeviceWithID:(id)a4 isRequest:(BOOL)a5 messageID:(id)a6 error:(id *)a7 identifier:(id *)a8;
- (BOOL)sendMessage:(id)a3 toPeer:(id)a4 isRequest:(BOOL)a5 messageID:(id)a6 error:(id *)a7 identifier:(id *)a8;
- (BOOL)serviceHasDuplicateForBTUUID:(id)a3;
- (BOOL)shouldBeAdvertisingRequest;
- (BOOL)shouldBeAdvertisingResponse;
- (BOOL)shouldBeConsumerScanning;
- (BOOL)sourceAdvertising;
- (BOOL)sourceScanning;
- (BOOL)targetAdvertising;
- (BOOL)targetScanning;
- (BOOL)tetheringSourceIsValid:(id)a3;
- (BOOL)updateIDHash;
- (BOOL)updateTimeString;
- (IDSContinuity)tetheringManager;
- (IDSService)idsService;
- (IDSService)tetheringService;
- (NSDate)browseStartTime;
- (NSMutableDictionary)discoveredDevices;
- (NSMutableDictionary)handlers;
- (NSMutableDictionary)outstandingRequests;
- (NSMutableDictionary)retrieveTimers;
- (NSString)altDSID;
- (NSString)modelCode;
- (NSString)targetIdentifier;
- (NSString)timeString;
- (NSTimer)advertiseResponseTimer;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)scanAssertionTimer;
- (OS_dispatch_source)scanResetTimer;
- (OS_os_transaction)transaction;
- (PCPersistentTimer)nextCrossoverPersistentTimer;
- (SDHotspotBrowser)init;
- (SDHotspotManager)hotspotManager;
- (SDStatusMonitor)monitor;
- (SFRemoteHotspotClient)clientProxy;
- (id)HMACWithDSID:(id)a3 timeString:(id)a4;
- (id)accountAltDSID;
- (id)appendHashToData:(id)a3 withType:(unsigned __int8)a4;
- (id)deviceForIdentifier:(id)a3;
- (id)formattedDate:(id)a3;
- (id)hotspotName;
- (id)hotspotPassword;
- (id)modelCodeForIdentifier:(id)a3;
- (id)nextDateForDayInterval:(int)a3;
- (id)pairedPeers;
- (id)tetheringPeers;
- (unint64_t)nextDayTimeOffset;
- (unsigned)IDHash;
- (unsigned)powerAssertionID;
- (void)activate;
- (void)addObservers;
- (void)addRetrieveTimer:(id)a3;
- (void)altDSIDUpdated:(id)a3;
- (void)appleIDChanged:(id)a3;
- (void)appleIDSignedIn:(id)a3;
- (void)appleIDSignedOut:(id)a3;
- (void)clearAccountAltDSID;
- (void)clearNextDayTimer;
- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6;
- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didStartAdvertisingOfType:(int64_t)a4;
- (void)continuity:(id)a3 didStartScanningForType:(int64_t)a4;
- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didStopScanningForType:(int64_t)a4;
- (void)continuityDidUpdateState:(id)a3;
- (void)credentialLog:(id)a3;
- (void)credentialsWithCompletionHandler:(id)a3 canConnectOn5GHz:(BOOL)a4;
- (void)debugInfoRequested:(id)a3;
- (void)disableTethering;
- (void)enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4;
- (void)generateNextDayTimeOffset;
- (void)handleIncomingResponse:(id)a3 identifier:(id)a4;
- (void)handleScanAssertionTimerFired;
- (void)handleScanResetTimerFired;
- (void)hotspotConnectionStateChanged:(id)a3;
- (void)invalidate;
- (void)invalidateScanAssertionTimer;
- (void)invalidateScanResetTimer;
- (void)invalidateTimerWithIdentifier:(id)a3;
- (void)nextDayTimerFired:(id)a3;
- (void)preventIdleSleepAssertion;
- (void)releaseIdleSleepAssertion;
- (void)removeObservers;
- (void)restartAdvertisingTetheringRequest;
- (void)restartAdvertisingTetheringResponse;
- (void)restartConsumerScanning;
- (void)restartProducerScanning;
- (void)restartScanAssertionTimer;
- (void)restartScanResetTimer;
- (void)retrieveTimerFired:(id)a3;
- (void)screenStateChanged:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setAdvertiseResponseTimer:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setBrowseStartTime:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setD2dEncryptionAvailable:(BOOL)a3;
- (void)setDiscoveredDevices:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setHasAppleID:(BOOL)a3;
- (void)setHotspotManager:(id)a3;
- (void)setIDHash:(unsigned int)a3;
- (void)setIdsService:(id)a3;
- (void)setModelCode:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setNextCrossoverPersistentTimer:(id)a3;
- (void)setNextDayTimeOffset:(unint64_t)a3;
- (void)setOutstandingRequests:(id)a3;
- (void)setPausedForWiFiPasswordSharing:(BOOL)a3;
- (void)setPowerAssertionID:(unsigned int)a3;
- (void)setProducerScanEnabled:(BOOL)a3;
- (void)setRetrieveTimers:(id)a3;
- (void)setScanAssertionTimer:(id)a3;
- (void)setScanResetTimer:(id)a3;
- (void)setShouldBeAdvertisingRequest:(BOOL)a3;
- (void)setShouldBeAdvertisingResponse:(BOOL)a3;
- (void)setShouldBeConsumerScanning:(BOOL)a3;
- (void)setSourceAdvertising:(BOOL)a3;
- (void)setSourceScanning:(BOOL)a3;
- (void)setTargetAdvertising:(BOOL)a3;
- (void)setTargetIdentifier:(id)a3;
- (void)setTargetScanning:(BOOL)a3;
- (void)setTetheringManager:(id)a3;
- (void)setTetheringService:(id)a3;
- (void)setTimeString:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setd2dEncryptionAvailable:(BOOL)a3;
- (void)startBrowsing;
- (void)stopAdvertisingResponse;
- (void)stopAdvertisingTetheringRequest;
- (void)stopBrowsing;
- (void)stopConsumerScanning;
- (void)stopProducerScanning;
- (void)tetheringDidRetrieveCredentials:(id)a3 credentials:(id)a4 requestRecord:(id)a5 error:(id)a6;
- (void)tetheringSupportChanged;
- (void)updateAccountState;
- (void)updateCrossoverTimer;
- (void)updateHasAppleID;
- (void)updateIDHashAndRestart;
- (void)wifiPasswordSharingChanged:(id)a3;
@end

@implementation SDHotspotBrowser

+ (id)sharedBrowser
{
  if (qword_10097FCD8 != -1) {
    dispatch_once(&qword_10097FCD8, &stru_1008CB9B0);
  }
  v2 = (void *)qword_10097FCD0;

  return v2;
}

- (SDHotspotBrowser)init
{
  v26.receiver = self;
  v26.super_class = (Class)SDHotspotBrowser;
  v2 = [(SDHotspotBrowser *)&v26 init];
  v3 = v2;
  if (v2)
  {
    v2->_IDHash = 0;
    altDSID = v2->_altDSID;
    v2->_altDSID = 0;

    timeString = v3->_timeString;
    v3->_timeString = 0;

    clientProxy = v3->_clientProxy;
    v3->_clientProxy = 0;

    targetIdentifier = v3->_targetIdentifier;
    v3->_targetIdentifier = 0;

    nextCrossoverPersistentTimer = v3->_nextCrossoverPersistentTimer;
    v3->_nextCrossoverPersistentTimer = 0;

    *(_DWORD *)&v3->_shouldBeConsumerScanning = 0;
    uint64_t v9 = objc_opt_new();
    handlers = v3->_handlers;
    v3->_handlers = (NSMutableDictionary *)v9;

    v3->_powerAssertionID = 0;
    uint64_t v11 = +[SDStatusMonitor sharedMonitor];
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v11;

    uint64_t v13 = objc_opt_new();
    discoveredDevices = v3->_discoveredDevices;
    v3->_discoveredDevices = (NSMutableDictionary *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.SDHotspotBrowser-work", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = objc_opt_new();
    retrieveTimers = v3->_retrieveTimers;
    v3->_retrieveTimers = (NSMutableDictionary *)v17;

    *(_DWORD *)&v3->_targetAdvertising = 0;
    browseStartTime = v3->_browseStartTime;
    v3->_browseStartTime = 0;

    uint64_t v20 = objc_opt_new();
    outstandingRequests = v3->_outstandingRequests;
    v3->_outstandingRequests = (NSMutableDictionary *)v20;

    v22 = +[SDStatusMonitor sharedMonitor];
    uint64_t v23 = [v22 modelCode];
    modelCode = v3->_modelCode;
    v3->_modelCode = (NSString *)v23;
  }
  return v3;
}

- (void)activate
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007C8A8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)invalidate
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007C9E0;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)setHotspotManager:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007CB58;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)setIdsService:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007CBFC;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)setProducerScanEnabled:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007CD08;
  v4[3] = &unk_1008CB9D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)setd2dEncryptionAvailable:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007CE74;
  v4[3] = &unk_1008CB9D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

- (BOOL)isTetheringInUse
{
  return [(SDHotspotManager *)self->_hotspotManager isTetheringInUse];
}

- (void)disableTethering
{
}

- (id)hotspotName
{
  return [(SDHotspotManager *)self->_hotspotManager hotspotName];
}

- (id)hotspotPassword
{
  return [(SDHotspotManager *)self->_hotspotManager hotspotPassword];
}

- (id)accountAltDSID
{
  if (self->_hasAppleID && !self->_altDSID)
  {
    v3 = +[SDStatusMonitor sharedMonitor];
    id v4 = [v3 myAltDSID];
    altDSID = self->_altDSID;
    self->_altDSID = v4;
  }
  id v6 = self->_altDSID;

  return v6;
}

- (void)clearAccountAltDSID
{
  altDSID = self->_altDSID;
  self->_altDSID = 0;
}

- (void)updateHasAppleID
{
  BOOL hasAppleID = self->_hasAppleID;
  id v4 = +[SDStatusMonitor sharedMonitor];
  self->_BOOL hasAppleID = [v4 signedIntoPrimaryiCloudAccount];

  if (hasAppleID != self->_hasAppleID)
  {
    BOOL v5 = tethering_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_hasAppleID) {
        CFStringRef v6 = @"YES";
      }
      else {
        CFStringRef v6 = @"NO";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updated has Apple ID = %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)updateIDHashAndRestart
{
  if ([(SDHotspotBrowser *)self updateIDHash])
  {
    if (self->_hasAppleID)
    {
      [(SDHotspotBrowser *)self restartAdvertisingTetheringRequest];
      [(SDHotspotBrowser *)self restartProducerScanning];
    }
    else
    {
      [(SDHotspotBrowser *)self stopAdvertisingResponse];
      [(SDHotspotBrowser *)self stopAdvertisingTetheringRequest];
      [(SDHotspotBrowser *)self stopConsumerScanning];
      [(SDHotspotBrowser *)self stopProducerScanning];
    }
  }
}

- (BOOL)updateIDHash
{
  p_unsigned int IDHash = &self->_IDHash;
  unsigned int IDHash = self->_IDHash;
  unsigned int v5 = [(SDHotspotBrowser *)self updateTimeString];
  CFStringRef v6 = self->_altDSID;
  int v7 = [(SDHotspotBrowser *)self accountAltDSID];
  if (self->_hasAppleID)
  {
    CFStringRef v8 = v6;
    uint64_t v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

      if (!v5) {
        goto LABEL_11;
      }
    }
    else
    {
      if ((v8 == 0) != (v9 != 0))
      {
        unsigned __int8 v11 = [(NSString *)v8 isEqual:v9];

        if (v11)
        {
          if (v5) {
            goto LABEL_18;
          }
LABEL_11:
          uint64_t v13 = tethering_log();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
LABEL_23:

            goto LABEL_24;
          }
          v14 = v8;
          dispatch_queue_t v15 = v10;
          if (v8 == v10)
          {
          }
          else
          {
            v16 = v15;
            if ((v14 == 0) == (v15 != 0))
            {

LABEL_30:
              CFStringRef v25 = @"YES";
              goto LABEL_31;
            }
            unsigned int v17 = [(NSString *)v14 isEqual:v15];

            if (!v17) {
              goto LABEL_30;
            }
          }
          CFStringRef v25 = @"NO";
LABEL_31:
          int v26 = 138412546;
          *(void *)v27 = @"NO";
          *(_WORD *)&v27[8] = 2112;
          *(void *)&v27[10] = v25;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not updating hash (time updated = %@, id updated = %@)", (uint8_t *)&v26, 0x16u);
          goto LABEL_23;
        }
      }
      else
      {
      }
      [(SDHotspotBrowser *)self generateNextDayTimeOffset];
    }
LABEL_18:
    uint64_t v13 = [(SDHotspotBrowser *)self HMACWithDSID:v10 timeString:self->_timeString];
    v18 = -[NSObject subdataWithRange:](v13, "subdataWithRange:", 0, 4);
    self->_unsigned int IDHash = 0;
    [v18 getBytes:p_IDHash length:4];
    [(SDHotspotBrowser *)self clearNextDayTimer];
    v19 = tethering_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = self->_IDHash;
      CFStringRef v21 = @"YES";
      if (!self->_hasAppleID) {
        CFStringRef v21 = @"NO";
      }
      int v26 = 67109378;
      *(_DWORD *)v27 = v20;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Set apple ID hash = %u, _BOOL hasAppleID = %@", (uint8_t *)&v26, 0x12u);
    }

    goto LABEL_23;
  }
  v12 = tethering_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No apple ID to update hash", (uint8_t *)&v26, 2u);
  }

  [(SDHotspotBrowser *)self clearNextDayTimer];
  self->_unsigned int IDHash = 0;
LABEL_24:
  v22 = [(SDHotspotBrowser *)self nextCrossoverPersistentTimer];

  if (!v22) {
    [(SDHotspotBrowser *)self updateCrossoverTimer];
  }
  BOOL v23 = IDHash != *p_IDHash;

  return v23;
}

- (BOOL)updateTimeString
{
  v3 = +[NSDate date];
  [v3 timeIntervalSinceReferenceDate];
  unint64_t v5 = ((int)v4 - self->_nextDayTimeOffset) / 0x15180;

  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", v5];
  timeString = self->_timeString;
  p_timeString = (id *)&self->_timeString;
  unsigned __int8 v9 = [v6 isEqualToString:timeString];
  if (v9)
  {
    v10 = tethering_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *p_timeString;
      *(_DWORD *)buf = 138412546;
      id v18 = v11;
      __int16 v19 = 2112;
      unsigned int v20 = v6;
      v12 = "Not updating time (old = %@, new = %@)";
      uint64_t v13 = v10;
      uint32_t v14 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    objc_storeStrong(p_timeString, v6);
    v10 = tethering_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = *p_timeString;
      *(_DWORD *)buf = 138412290;
      id v18 = v15;
      v12 = "Updated time string = %@";
      uint64_t v13 = v10;
      uint32_t v14 = 12;
      goto LABEL_6;
    }
  }

  return v9 ^ 1;
}

- (id)HMACWithDSID:(id)a3 timeString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = [v7 UTF8String];
  id v9 = [v7 length];

  id v10 = v6;
  id v11 = [v10 UTF8String];
  id v12 = [v10 length];

  CCHmac(2u, v8, (size_t)v9, v11, (size_t)v12, &v15);
  uint64_t v13 = +[NSData dataWithBytes:&v15 length:32];

  return v13;
}

- (id)appendHashToData:(id)a3 withType:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = tethering_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int IDHash = self->_IDHash;
    CFStringRef v8 = @"YES";
    if (!self->_hasAppleID) {
      CFStringRef v8 = @"NO";
    }
    *(_DWORD *)buf = 67109378;
    LODWORD(v15[0]) = IDHash;
    WORD2(v15[0]) = 2112;
    *(void *)((char *)v15 + 6) = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trying to append apple ID hash = %u, BOOL hasAppleID = %@", buf, 0x12u);
  }

  [(SDHotspotBrowser *)self updateIDHash];
  if (self->_hasAppleID && self->_IDHash)
  {
    id v9 = [objc_alloc((Class)NSMutableData) initWithData:v5];
    unsigned int v13 = bswap32(self->_IDHash);
    [v9 appendBytes:&v13 length:4];
    id v10 = tethering_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Created Blob Data = %@", buf, 0xCu);
    }
  }
  else
  {
    id v11 = tethering_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10008516C();
    }

    id v9 = 0;
  }

  return v9;
}

- (id)modelCodeForIdentifier:(id)a3
{
  v3 = [(SDHotspotBrowser *)self deviceForIdentifier:a3];
  double v4 = v3;
  if (v3)
  {
    id v5 = [v3 modelIdentifier];
  }
  else
  {
    id v5 = 0;
  }
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = @"Unknown";
  }
  id v7 = v6;

  return v7;
}

- (id)deviceForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(IDSService *)self->_tetheringService devices];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [v9 nsuuid];
          id v11 = [v10 UUIDString];
          unsigned int v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)pairedPeers
{
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(IDSService *)self->_tetheringService devices];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isDefaultPairedDevice] & 1) == 0
          && [(SDHotspotBrowser *)self pairedPeerIsValid:v9])
        {
          id v10 = [v9 nsuuid];
          if (v10) {
            [v3 addObject:v10];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)accountHasPairedPeers
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(IDSService *)self->_tetheringService devices];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v8 isDefaultPairedDevice] & 1) == 0)
        {
          if ([(SDHotspotBrowser *)self pairedPeerIsValid:v8])
          {
            id v9 = [v8 nsuuid];

            if (v9)
            {
              BOOL v10 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)pairedPeerIsValid:(id)a3
{
  id v4 = a3;
  id v5 = [v4 modelIdentifier];
  uint64_t v6 = [v5 lowercaseString];

  unsigned int v7 = [(SDHotspotBrowser *)self d2dEncryptionAvailable];
  if (([v6 containsString:@"appletv"] & 1) != 0
    || ([v6 containsString:@"audio"] & 1) != 0)
  {
    char v8 = 0;
    goto LABEL_4;
  }
  char v10 = v7 ^ 1;
  if ([v6 containsString:@"watch"])
  {
    if (v4)
    {
      [v4 operatingSystemVersion];
      if (v21 < 6) {
        int v11 = 1;
      }
      else {
        int v11 = v7;
      }
      if (v11 != 1)
      {
LABEL_22:
        char v8 = 1;
        goto LABEL_4;
      }
      unsigned int v12 = [v6 containsString:@"mac"];
      goto LABEL_13;
    }
    unsigned int v12 = [v6 containsString:@"mac"];
  }
  else
  {
    unsigned int v12 = [v6 containsString:@"mac"];
    if (v4)
    {
LABEL_13:
      [v4 operatingSystemVersion];
      if (v20 == 10)
      {
        [v4 operatingSystemVersion];
        int v13 = 0;
        if (v19 < 15) {
          char v14 = 1;
        }
        else {
          char v14 = v7 ^ 1;
        }
      }
      else
      {
        int v13 = 0;
        char v14 = v7 ^ 1;
      }
      goto LABEL_20;
    }
  }
  int v13 = 1;
  char v14 = v7 ^ 1;
LABEL_20:
  if (v12 && (v14 & 1) != 0) {
    goto LABEL_22;
  }
  if (([v6 containsString:@"iphone"] & 1) != 0
    || [v6 containsString:@"ipad"])
  {
    if (v13)
    {
      char v8 = 1;
      goto LABEL_4;
    }
    [v4 operatingSystemVersion];
    unsigned int v15 = v18 > 12 ? v7 : 0;
    if (v15 != 1) {
      goto LABEL_22;
    }
  }
  char v16 = [v6 containsString:@"realitydevice"];
  long long v17 = tethering_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_1000851A0(v16, v10, v17);
  }

  char v8 = v16 & v10;
LABEL_4:

  return v8;
}

- (BOOL)accountHasTetheringSources
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(IDSService *)self->_tetheringService devices];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v8 isDefaultPairedDevice] & 1) == 0)
        {
          id v9 = [v8 nsuuid];
          if ([v8 supportsTethering]) {
            BOOL v10 = v9 == 0;
          }
          else {
            BOOL v10 = 1;
          }
          if (!v10 && [(SDHotspotBrowser *)self tetheringSourceIsValid:v8])
          {

            BOOL v11 = 1;
            goto LABEL_17;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_17:

  return v11;
}

- (id)tetheringPeers
{
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(IDSService *)self->_tetheringService devices];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v9 isDefaultPairedDevice] & 1) == 0)
        {
          BOOL v10 = [v9 nsuuid];
          if ([v9 supportsTethering]) {
            BOOL v11 = v10 == 0;
          }
          else {
            BOOL v11 = 1;
          }
          if (!v11 && [(SDHotspotBrowser *)self tetheringSourceIsValid:v9]) {
            [v3 addObject:v10];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)tetheringSourceIsValid:(id)a3
{
  return 1;
}

- (BOOL)outstandingRequestsHasHotspotDeviceForID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (v4)
  {
    outstandingRequests = self->_outstandingRequests;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007E378;
    v9[3] = &unk_1008CBA00;
    id v10 = v4;
    BOOL v11 = &v12;
    [(NSMutableDictionary *)outstandingRequests enumerateKeysAndObjectsUsingBlock:v9];

    BOOL v7 = *((unsigned char *)v13 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)serviceHasDuplicateForBTUUID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(IDSService *)self->_tetheringService devices];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    id v9 = v7;
    int v10 = 0;
    uint64_t v11 = *(void *)v20;
    *(void *)&long long v8 = 138412290;
    long long v18 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v6);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isDefaultPairedDevice", v18) & 1) == 0)
        {
          uint64_t v14 = [v13 nsuuid];
          char v15 = [v14 UUIDString];

          if (v15)
          {
            if ([v5 containsObject:v15])
            {
              long long v16 = tethering_log();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v18;
                v24 = v15;
                _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Found duplicate entry for BTUUID = %@", buf, 0xCu);
              }

              v10 |= [v4 isEqualToString:v15];
            }
            [v5 addObject:v15];
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10 & 1;
}

- (void)credentialLog:(id)a3
{
  id v3 = a3;
  if (IsAppleInternalBuild() && sub_1000D9060(@"TetheringCredentialLog", 0))
  {
    id v4 = sub_1001B2470(v3);
    id v5 = tethering_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138477827;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Hashed credential = %{private}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)bluetoothAllowedForScreenState
{
  BOOL v3 = [(SDStatusMonitor *)self->_monitor screenOn];
  return [(SDStatusMonitor *)self->_monitor autoHotspotState] || v3;
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"debugInfoRequested:" name:@"com.apple.sharingd.DebugInfoRequested" object:0];
  [v3 addObserver:self selector:"appleIDChanged:" name:@"com.apple.sharingd.AppleIDChanged" object:0];
  [v3 addObserver:self selector:"altDSIDUpdated:" name:@"com.apple.sharingd.AltDSIDChanged" object:0];
  [v3 addObserver:self selector:"appleIDSignedIn:" name:@"com.apple.sharingd.AppleAccountSignIn" object:0];
  [v3 addObserver:self selector:"appleIDSignedOut:" name:@"com.apple.sharingd.AppleAccountSignOut" object:0];
  [v3 addObserver:self selector:"screenStateChanged:" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
  [v3 addObserver:self selector:"hotspotConnectionStateChanged:" name:@"SDHotspotManagerConnectionStateChanged" object:0];
  [v3 addObserver:self selector:"screenStateChanged:" name:@"com.apple.sharingd.HotspotAutoStateChanged" object:0];
  [v3 addObserver:self selector:"wifiPasswordSharingChanged:" name:SFWiFiPasswordSharingAdvertisingBegan object:0];
  [v3 addObserver:self selector:"wifiPasswordSharingChanged:" name:SFWiFiPasswordSharingAdvertisingEnded object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)altDSIDUpdated:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E9C8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)debugInfoRequested:(id)a3
{
  id v32 = (id)objc_opt_new();
  id v4 = +[NSString stringWithFormat:@"IDHash:%u", self->_IDHash];
  [v32 addObject:v4];

  if (self->_hasAppleID) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  int v6 = +[NSString stringWithFormat:@"Has Apple ID:%@", v5];
  [v32 addObject:v6];

  id v7 = +[NSString stringWithFormat:@"Persistent Timer:%@", self->_nextCrossoverPersistentTimer];
  [v32 addObject:v7];

  long long v8 = +[NSString stringWithFormat:@"Power Assertion ID:%u", self->_powerAssertionID];
  [v32 addObject:v8];

  if ([(SDHotspotManager *)self->_hotspotManager isTetheringSupported]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  int v10 = +[NSString stringWithFormat:@"Tethering available:%@", v9];
  [v32 addObject:v10];

  uint64_t v11 = +[SDStatusMonitor sharedMonitor];
  uint64_t v12 = SFHotspotNetworkTypeString([v11 networkType]);
  long long v13 = +[NSString stringWithFormat:@"Current Network Type:%@", v12];
  [v32 addObject:v13];

  if (self->_sourceAdvertising) {
    CFStringRef v14 = @"YES";
  }
  else {
    CFStringRef v14 = @"NO";
  }
  char v15 = +[NSString stringWithFormat:@"Source advertising for response:%@", v14];
  [v32 addObject:v15];

  if (self->_sourceScanning) {
    CFStringRef v16 = @"YES";
  }
  else {
    CFStringRef v16 = @"NO";
  }
  long long v17 = +[NSString stringWithFormat:@"Source scanning for requests:%@", v16];
  [v32 addObject:v17];

  if (self->_targetAdvertising) {
    CFStringRef v18 = @"YES";
  }
  else {
    CFStringRef v18 = @"NO";
  }
  long long v19 = +[NSString stringWithFormat:@"Target advertising request:%@", v18];
  [v32 addObject:v19];

  if (self->_targetScanning) {
    CFStringRef v20 = @"YES";
  }
  else {
    CFStringRef v20 = @"NO";
  }
  long long v21 = +[NSString stringWithFormat:@"Target scanning for responses:%@", v20];
  [v32 addObject:v21];

  long long v22 = [(SDHotspotBrowser *)self pairedPeers];
  BOOL v23 = [v22 valueForKeyPath:@"@unionOfObjects.UUIDString"];
  v24 = [v23 componentsJoinedByString:@", "];

  CFStringRef v25 = +[NSString stringWithFormat:@"Current cloud paired peers:%@", v24];
  [v32 addObject:v25];

  int v26 = [(SDHotspotBrowser *)self tetheringPeers];

  v27 = [v26 valueForKeyPath:@"@unionOfObjects.UUIDString"];
  v28 = [v27 componentsJoinedByString:@", "];

  v29 = +[NSString stringWithFormat:@"Current tethering source peers:%@", v28];
  [v32 addObject:v29];

  v30 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v30);
  sub_100047144(v31, (uint64_t)v32);
}

- (void)appleIDChanged:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007EE70;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)appleIDSignedIn:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007EF58;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)appleIDSignedOut:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F040;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)updateAccountState
{
  [(SDHotspotBrowser *)self updateHasAppleID];
  [(SDHotspotBrowser *)self clearAccountAltDSID];

  [(SDHotspotBrowser *)self updateIDHashAndRestart];
}

- (void)screenStateChanged:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F168;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)hotspotConnectionStateChanged:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F264;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)wifiPasswordSharingChanged:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007F380;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  CFStringRef v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)generateNextDayTimeOffset
{
  id v3 = [(SDHotspotBrowser *)self accountAltDSID];
  id v4 = v3;
  if (v3)
  {
    CFStringRef v5 = sub_1001B2470(v3);
    id v6 = [v5 subdataWithRange:0, 8];
    unint64_t v12 = 0;
    [v6 getBytes:&v12 length:8];
    self->_unint64_t nextDayTimeOffset = v12 % 0x15180;
    id v7 = tethering_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t nextDayTimeOffset = self->_nextDayTimeOffset;
      *(_DWORD *)buf = 134217984;
      unint64_t v14 = nextDayTimeOffset;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Generated Next Day Time Offset = %lld", buf, 0xCu);
    }

    unint64_t v9 = sub_1000D9248(@"TetheringIDRollOffset", 0);
    if (v9)
    {
      self->_unint64_t nextDayTimeOffset = v9;
      int v10 = tethering_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = self->_nextDayTimeOffset;
        *(_DWORD *)buf = 134217984;
        unint64_t v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Next Day Time Offset Overriden = %lld", buf, 0xCu);
      }
    }
  }
}

- (void)updateCrossoverTimer
{
  [(SDHotspotBrowser *)self clearNextDayTimer];
  unsigned int v3 = [(SDHotspotManager *)self->_hotspotManager isTetheringSupported];
  id v4 = [(SDHotspotBrowser *)self nextCrossoverPersistentTimer];
  if (v4 || (self->_hasAppleID ? (unsigned int v5 = v3) : (unsigned int v5 = 0), v5 != 1))
  {
  }
  else if ([(SDHotspotBrowser *)self accountHasPairedPeers])
  {
    id v6 = [(SDHotspotBrowser *)self nextDateForDayInterval:1];
    id v7 = +[NSDate date];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    if (v9 <= 0.0)
    {
      long long v13 = tethering_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100085230(v6);
      }
    }
    else
    {
      id v10 = [objc_alloc((Class)PCPersistentTimer) initWithFireDate:v6 serviceIdentifier:@"com.apple.sharingd" target:self selector:"nextDayTimerFired:" userInfo:0];
      [(SDHotspotBrowser *)self setNextCrossoverPersistentTimer:v10];

      unint64_t v11 = [(SDHotspotBrowser *)self nextCrossoverPersistentTimer];
      [v11 setMinimumEarlyFireProportion:1.0];

      unint64_t v12 = [(SDHotspotBrowser *)self nextCrossoverPersistentTimer];
      [v12 scheduleInQueue:self->_workQueue];

      long long v13 = tethering_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v14 = [(SDHotspotBrowser *)self nextCrossoverPersistentTimer];
        char v15 = +[NSDate date];
        [v6 timeIntervalSinceDate:v15];
        uint64_t v17 = (uint64_t)v16;
        CFStringRef v18 = [(SDHotspotBrowser *)self formattedDate:v6];
        int v23 = 138412802;
        v24 = v14;
        __int16 v25 = 2048;
        uint64_t v26 = v17;
        __int16 v27 = 2112;
        CFStringRef v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Timer created (timer = %@, next fire in seconds = %lld, %@)", (uint8_t *)&v23, 0x20u);
      }
    }

    goto LABEL_22;
  }
  id v6 = tethering_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [(SDHotspotBrowser *)self nextCrossoverPersistentTimer];
    if (self->_hasAppleID) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    if (v3) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    int v23 = 138413058;
    if ([(SDHotspotBrowser *)self accountHasPairedPeers]) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    v24 = v19;
    __int16 v25 = 2112;
    uint64_t v26 = (uint64_t)v20;
    __int16 v27 = 2112;
    CFStringRef v28 = v21;
    __int16 v29 = 2112;
    CFStringRef v30 = v22;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not creating persistent timer (timer = %@, has apple ID = %@, tethering supported = %@, has peers on account = %@)", (uint8_t *)&v23, 0x2Au);
  }
LABEL_22:
}

- (void)clearNextDayTimer
{
  unsigned int v3 = [(SDHotspotBrowser *)self nextCrossoverPersistentTimer];

  if (v3)
  {
    id v4 = [(SDHotspotBrowser *)self nextCrossoverPersistentTimer];
    [v4 invalidate];

    [(SDHotspotBrowser *)self setNextCrossoverPersistentTimer:0];
  }
}

- (void)nextDayTimerFired:(id)a3
{
  id v4 = a3;
  unsigned int v5 = tethering_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Persistent timer fired = %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = +[SDStatusMonitor sharedMonitor];
  unsigned int v7 = [v6 altDSIDNeedsFixing];

  if (v7)
  {
    double v8 = tethering_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AltDSID needs fixing", (uint8_t *)&v10, 2u);
    }

    double v9 = +[SDStatusMonitor sharedMonitor];
    [v9 fixAltDSIDIfNeeded];
  }
  [(SDHotspotBrowser *)self clearNextDayTimer];
  [(SDHotspotBrowser *)self updateAccountState];
}

- (id)nextDateForDayInterval:(int)a3
{
  unsigned int v5 = +[NSDate date];
  uint64_t v6 = 86400 * a3;
  [v5 timeIntervalSinceReferenceDate];
  int64_t v8 = self->_nextDayTimeOffset + (uint64_t)v7 / v6 * v6;
  [v5 timeIntervalSinceReferenceDate];
  double v10 = v9;
  id v11 = tethering_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 >= (double)v8)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calculated previous crossover, pushing to next", buf, 2u);
    }

    v8 += v6;
  }
  else
  {
    if (v12)
    {
      *(_WORD *)char v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calculated next crossover", v15, 2u);
    }
  }
  long long v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(v8 + 30)];

  return v13;
}

- (id)formattedDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setDateStyle:1];
  [v4 setTimeStyle:4];
  unsigned int v5 = +[NSTimeZone timeZoneWithName:@"GMT"];
  [v4 setTimeZone:v5];

  uint64_t v6 = [v4 stringFromDate:v3];
  double v7 = +[NSTimeZone localTimeZone];
  [v4 setTimeZone:v7];

  int64_t v8 = [v4 stringFromDate:v3];

  double v9 = +[NSString stringWithFormat:@"GMT Date = %@, Local Time Zone Date = %@", v6, v8];

  return v9;
}

- (void)tetheringSupportChanged
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007FE08;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (BOOL)sendMessage:(id)a3 toPeer:(id)a4 isRequest:(BOOL)a5 messageID:(id)a6 error:(id *)a7 identifier:(id *)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v39 = a6;
  if (!v15)
  {
    v34 = tethering_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000852D8();
    }

    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    CFStringRef v47 = @"Could not send IDS message";
    __int16 v25 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    NSErrorDomain v32 = NSPOSIXErrorDomain;
    uint64_t v33 = 50;
LABEL_22:
    id v28 = +[NSError errorWithDomain:v32 code:v33 userInfo:v25];
    id v30 = 0;
    id v24 = 0;
    uint64_t v26 = v39;
    goto LABEL_23;
  }
  v36 = a8;
  v37 = a7;
  id v38 = v14;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  double v16 = [(IDSService *)self->_tetheringService devices];
  id v17 = [v16 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (!v17)
  {
LABEL_10:

LABEL_16:
    v31 = tethering_log();
    a7 = v37;
    id v14 = v38;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10008530C(v15);
    }

    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    CFStringRef v49 = @"No device for identifier";
    __int16 v25 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    NSErrorDomain v32 = NSPOSIXErrorDomain;
    uint64_t v33 = 51;
    goto LABEL_22;
  }
  id v18 = v17;
  uint64_t v19 = *(void *)v43;
LABEL_4:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v43 != v19) {
      objc_enumerationMutation(v16);
    }
    CFStringRef v21 = *(void **)(*((void *)&v42 + 1) + 8 * v20);
    CFStringRef v22 = [v21 nsuuid];
    unsigned __int8 v23 = [v22 isEqual:v15];

    if (v23) {
      break;
    }
    if (v18 == (id)++v20)
    {
      id v18 = [v16 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v18) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v24 = v21;

  if (!v24) {
    goto LABEL_16;
  }
  __int16 v25 = (void *)IDSCopyForDevice();
  id v40 = 0;
  id v41 = 0;
  uint64_t v26 = v39;
  unsigned int v27 = [(SDHotspotBrowser *)self sendMessage:v38 toDeviceWithID:v25 isRequest:v11 messageID:v39 error:&v41 identifier:&v40];
  id v28 = v41;
  id v29 = v40;
  id v30 = v29;
  a7 = v37;
  if (v36 && v27)
  {
    id v30 = v29;
    id *v36 = v30;
  }
  id v14 = v38;
LABEL_23:

  if (a7) {
    *a7 = v28;
  }

  return v28 == 0;
}

- (BOOL)sendMessage:(id)a3 toDeviceWithID:(id)a4 isRequest:(BOOL)a5 messageID:(id)a6 error:(id *)a7 identifier:(id *)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  if (v15)
  {
    id v31 = v14;
    id v17 = +[NSSet setWithObject:v15];
    id v18 = +[NSMutableDictionary dictionary];
    [v18 setObject:&off_100902730 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    [v18 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    uint64_t v19 = +[SDStatusMonitor sharedMonitor];
    unsigned __int8 v20 = [v19 enableHotspotFallback];

    if ((v20 & 1) == 0) {
      [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
    }
    if (v16 || v11)
    {
      if (v16) {
        int v21 = v11;
      }
      else {
        int v21 = 1;
      }
      if (v21) {
        CFStringRef v22 = &__kCFBooleanTrue;
      }
      else {
        CFStringRef v22 = v16;
      }
      unsigned __int8 v23 = &IDSSendMessageOptionExpectsPeerResponseKey;
      if (!v21) {
        unsigned __int8 v23 = &IDSSendMessageOptionPeerResponseIdentifierKey;
      }
      [v18 setObject:v22 forKeyedSubscript:*v23];
    }
    tetheringService = self->_tetheringService;
    id v32 = 0;
    id v33 = 0;
    unsigned __int8 v25 = [(IDSService *)tetheringService sendMessage:v31 fromAccount:0 toDestinations:v17 priority:300 options:v18 identifier:&v33 error:&v32];
    uint64_t v26 = v33;
    id v27 = v32;
    id v28 = tethering_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v35 = v15;
      __int16 v36 = 2112;
      v37 = v26;
      __int16 v38 = 2112;
      id v39 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Sending from device ID to destination = %@, with identifier = %@, message = %@, ", buf, 0x20u);
    }

    if (a8) {
      *a8 = v26;
    }
    if (v25) {
      id v29 = 0;
    }
    else {
      id v29 = v27;
    }

    id v14 = v31;
  }
  else
  {
    uint64_t v26 = tethering_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100085390();
    }
    id v29 = 0;
    id v17 = 0;
  }

  if (a7) {
    *a7 = v29;
  }

  return v29 == 0;
}

- (void)startBrowsing
{
  if ([(SDStatusMonitor *)self->_monitor deviceSupportsContinuity])
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100080594;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)stopBrowsing
{
  if ([(SDStatusMonitor *)self->_monitor deviceSupportsContinuity])
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000806B8;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080820;
  block[3] = &unk_1008CAD48;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)addRetrieveTimer:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100080DAC;
  v4[3] = &unk_1008CA640;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)retrieveTimerFired:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080EE8;
  block[3] = &unk_1008CAF18;
  id v10 = v5;
  BOOL v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(workQueue, block);
}

- (void)invalidateTimerWithIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_retrieveTimers, "objectForKeyedSubscript:");
  id v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(NSMutableDictionary *)self->_retrieveTimers removeObjectForKey:v6];
  }
}

- (void)restartAdvertisingTetheringRequest
{
  if (!self->_shouldBeAdvertisingRequest
    || self->_pausedForWiFiPasswordSharing
    || [(IDSContinuity *)self->_tetheringManager state] != (id)3
    || ![(SDHotspotBrowser *)self bluetoothAllowedForScreenState])
  {
    id v4 = tethering_log();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    unsigned int v6 = [(IDSContinuity *)self->_tetheringManager state];
    if (self->_shouldBeAdvertisingRequest) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    if (self->_pausedForWiFiPasswordSharing) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    if ([(SDStatusMonitor *)self->_monitor screenOn]) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    int64_t v10 = [(SDStatusMonitor *)self->_monitor autoHotspotState];
    v15[0] = 67110146;
    if (v10) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    v15[1] = v6;
    __int16 v16 = 2112;
    CFStringRef v17 = v7;
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    __int16 v20 = 2112;
    CFStringRef v21 = v9;
    __int16 v22 = 2112;
    CFStringRef v23 = v11;
    id v12 = "Skipping advertisment request: state=%d, request=%@, paused=%@, screen=%@, auto hotspot=%@";
    long long v13 = v4;
    uint32_t v14 = 48;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)v15, v14);
    goto LABEL_24;
  }
  if (![(SDHotspotBrowser *)self accountHasTetheringSources])
  {
    id v4 = tethering_log();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    LOWORD(v15[0]) = 0;
    id v12 = "Not advertising request, no devices that support tethering";
    long long v13 = v4;
    uint32_t v14 = 2;
    goto LABEL_23;
  }
  id v3 = +[NSData data];
  id v4 = [(SDHotspotBrowser *)self appendHashToData:v3 withType:0];

  if (v4)
  {
    [(IDSContinuity *)self->_tetheringManager startAdvertisingOfType:1 withData:v4 withOptions:0];
    id v5 = tethering_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Started advertising tethering request", (uint8_t *)v15, 2u);
    }
  }
  else
  {
    id v5 = tethering_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000855CC();
    }
  }

LABEL_24:
}

- (void)stopAdvertisingTetheringRequest
{
  [(IDSContinuity *)self->_tetheringManager stopAdvertisingOfType:1];
  v2 = tethering_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stopping Advertising Request", v3, 2u);
  }
}

- (void)restartAdvertisingTetheringResponse
{
  if (!self->_sourceAdvertising
    && self->_shouldBeAdvertisingResponse
    && [(SDHotspotManager *)self->_hotspotManager isTetheringSupported]
    && ![(SDHotspotManager *)self->_hotspotManager maxConnectionsReached]
    && [(IDSContinuity *)self->_tetheringManager state] == (id)3)
  {
    LOWORD(v20) = 1;
    HIBYTE(v20) = 0;
    id v12 = +[SDStatusMonitor sharedMonitor];
    long long v13 = [v12 localPowerSource];
    [v13 chargeLevel];
    uint64_t v15 = (uint64_t)(v14 * 100.0);

    if (v15 < 0) {
      char v16 = -1;
    }
    else {
      char v16 = v15;
    }
    BYTE2(v20) = v16;
    HIBYTE(v21) = [(SDStatusMonitor *)self->_monitor signalStrength];
    LOBYTE(v21) = [(SDStatusMonitor *)self->_monitor networkType];
    if (self->_targetIdentifier
      && -[SDHotspotBrowser serviceHasDuplicateForBTUUID:](self, "serviceHasDuplicateForBTUUID:"))
    {
      BYTE1(v20) = 0x80;
    }
    CFStringRef v17 = tethering_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = SFHotspotResponseAdvertisementString(v20 | ((unint64_t)v21 << 32));
      *(_DWORD *)buf = 138412290;
      *(void *)CFStringRef v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Advertising response packet %@", buf, 0xCu);
    }
    id v3 = +[NSData dataWithBytes:&v20 length:6];
    if (v3)
    {
      [(IDSContinuity *)self->_tetheringManager startAdvertisingOfType:2 withData:v3 withOptions:0];
      self->_BOOL sourceAdvertising = 1;
      CFStringRef v19 = tethering_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Started advertising tethering response", buf, 2u);
      }
    }
    else
    {
      CFStringRef v19 = tethering_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100085600();
      }
    }
  }
  else
  {
    id v3 = tethering_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v4 = [(SDHotspotManager *)self->_hotspotManager isTetheringSupported];
      unsigned int v5 = [(IDSContinuity *)self->_tetheringManager state];
      if (self->_shouldBeAdvertisingRequest) {
        CFStringRef v6 = @"YES";
      }
      else {
        CFStringRef v6 = @"NO";
      }
      if (self->_shouldBeAdvertisingResponse) {
        CFStringRef v7 = @"YES";
      }
      else {
        CFStringRef v7 = @"NO";
      }
      unsigned int v8 = [(SDHotspotManager *)self->_hotspotManager maxConnectionsReached];
      BOOL sourceAdvertising = self->_sourceAdvertising;
      if (v8) {
        CFStringRef v10 = @"YES";
      }
      else {
        CFStringRef v10 = @"NO";
      }
      *(_DWORD *)buf = 67110402;
      if (sourceAdvertising) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      *(_DWORD *)CFStringRef v23 = v4;
      *(_WORD *)&v23[4] = 1024;
      *(_DWORD *)&v23[6] = v5;
      __int16 v24 = 2112;
      CFStringRef v25 = v6;
      __int16 v26 = 2112;
      CFStringRef v27 = v7;
      __int16 v28 = 2112;
      CFStringRef v29 = v10;
      __int16 v30 = 2112;
      CFStringRef v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Skipping advertisment response: supported=%d, state=%d, request=%@, response=%@, max connections=%@ already advertising=%@", buf, 0x36u);
    }
  }
}

- (void)stopAdvertisingResponse
{
  targetIdentifier = self->_targetIdentifier;
  self->_targetIdentifier = 0;

  [(IDSContinuity *)self->_tetheringManager stopAdvertisingOfType:2];
  self->_BOOL sourceAdvertising = 0;
  unsigned int v4 = tethering_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping response advertisement", v5, 2u);
  }
}

- (void)restartProducerScanning
{
  if (self->_producerScanEnabled
    && [(SDHotspotManager *)self->_hotspotManager isTetheringSupported]
    && [(SDHotspotBrowser *)self accountHasPairedPeers]
    && [(IDSContinuity *)self->_tetheringManager state] == (id)3)
  {
    id v3 = +[NSData data];
    unsigned int v4 = [(SDHotspotBrowser *)self appendHashToData:v3 withType:0];

    if (v4)
    {
      unsigned int v5 = [(SDHotspotBrowser *)self pairedPeers];
      CFStringRef v6 = [v5 valueForKeyPath:@"@unionOfObjects.UUIDString"];
      CFStringRef v7 = [v6 componentsJoinedByString:@", "];

      unsigned int v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        CFStringRef v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Restarted scanning for device requesting tethering [%@]", (uint8_t *)&v9, 0xCu);
      }

      [(IDSContinuity *)self->_tetheringManager startScanningForType:1 withData:v4 peers:v5 withOptions:0];
    }
    else
    {
      unsigned int v5 = tethering_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100085634();
      }
    }
  }
}

- (void)stopProducerScanning
{
  id v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping producer scanning", v4, 2u);
  }

  [(IDSContinuity *)self->_tetheringManager stopScanningForType:1];
}

- (void)restartConsumerScanning
{
  if (self->_shouldBeConsumerScanning
    && [(SDHotspotBrowser *)self accountHasTetheringSources]
    && [(IDSContinuity *)self->_tetheringManager state] == (id)3
    && [(SDHotspotBrowser *)self bluetoothAllowedForScreenState])
  {
    id v3 = [(SDHotspotBrowser *)self tetheringPeers];
    unsigned int v4 = [v3 valueForKeyPath:@"@unionOfObjects.UUIDString"];
    unsigned int v5 = [v4 componentsJoinedByString:@", "];

    CFStringRef v6 = tethering_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      *(void *)double v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarted scanning for available tethering devices [%@]", (uint8_t *)&v13, 0xCu);
    }

    [(IDSContinuity *)self->_tetheringManager startScanningForType:2 withData:0 peers:v3 withOptions:0];
  }
  else
  {
    id v3 = tethering_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(IDSContinuity *)self->_tetheringManager state];
      if (self->_shouldBeConsumerScanning) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      if ([(SDHotspotBrowser *)self accountHasTetheringSources]) {
        CFStringRef v9 = @"YES";
      }
      else {
        CFStringRef v9 = @"NO";
      }
      if ([(SDStatusMonitor *)self->_monitor screenOn]) {
        CFStringRef v10 = @"YES";
      }
      else {
        CFStringRef v10 = @"NO";
      }
      int64_t v11 = [(SDStatusMonitor *)self->_monitor autoHotspotState];
      int v13 = 67110146;
      if (v11) {
        CFStringRef v12 = @"YES";
      }
      else {
        CFStringRef v12 = @"NO";
      }
      *(_DWORD *)double v14 = v7;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = v8;
      __int16 v15 = 2112;
      CFStringRef v16 = v9;
      __int16 v17 = 2112;
      CFStringRef v18 = v10;
      __int16 v19 = 2112;
      CFStringRef v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Skipping scanning: state=%d, request=%@, peers=%@, screen=%@, auto hotspot=%@", (uint8_t *)&v13, 0x30u);
    }
  }
}

- (void)stopConsumerScanning
{
  id v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopped scanning for available tethering devices", v4, 2u);
  }

  [(IDSContinuity *)self->_tetheringManager stopScanningForType:2];
}

- (void)handleIncomingResponse:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 length] >= 6)
  {
    id v8 = v6;
    CFStringRef v9 = (unsigned int *)[v8 bytes];
    unint64_t v10 = *v9 | ((unint64_t)*((unsigned __int16 *)v9 + 2) << 32);
    int64_t v11 = tethering_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v12 = SFHotspotResponseAdvertisementString(v10 & 0xFFFFFFFFFFFFLL);
      *(_DWORD *)buf = 138412546;
      double v38 = *(double *)&v12;
      __int16 v39 = 2112;
      id v40 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Source advertisement %@ device ID: %@)", buf, 0x16u);
    }
    int v13 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v7];
    if (!v13)
    {
      double v14 = [(SDHotspotBrowser *)self browseStartTime];

      if (v14)
      {
        __int16 v15 = +[NSDate date];
        CFStringRef v16 = [(SDHotspotBrowser *)self browseStartTime];
        [v15 timeIntervalSinceDate:v16];
        double v18 = v17;

        __int16 v19 = [(SDHotspotBrowser *)self modelCodeForIdentifier:v7];
        sub_1000472A8(self->_modelCode, v19, &off_100902778, 1, v18);
        CFStringRef v20 = tethering_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v38 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Discovered new device in %f seconds", buf, 0xCu);
        }
      }
      else
      {
        __int16 v19 = tethering_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No browse start time", buf, 2u);
        }
      }
    }
    unsigned __int16 v21 = [(SDHotspotBrowser *)self deviceForIdentifier:v7];
    if (v21)
    {
      __int16 v22 = [v13 advertisementData];
      CFStringRef v23 = v22;
      if (!v13
        || ![v22 isEqualToData:v8]
        || ([v13 deviceName],
            __int16 v24 = objc_claimAutoreleasedReturnValue(),
            [v21 name],
            CFStringRef v25 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v26 = [v24 isEqualToString:v25],
            v25,
            v24,
            (v26 & 1) == 0))
      {
        id v27 = objc_alloc((Class)SFRemoteHotspotDevice);
        __int16 v28 = [v21 name];
        id v29 = [v27 initWithName:v28 identifier:v7 advertisement:v10 & 0xFFFFFFFFFFFFLL];

        [v29 setGroup:1];
        __int16 v30 = [v21 modelIdentifier];
        [v29 setModel:v30];

        [v21 operatingSystemVersion];
        [v29 setOsSupportsAutoHotspot:v36 > 12];
        if (v29) {
          [(NSMutableDictionary *)self->_discoveredDevices setObject:v29 forKeyedSubscript:v7];
        }
        CFStringRef v31 = [(SDHotspotBrowser *)self clientProxy];

        id v32 = tethering_log();
        id v33 = v32;
        if (v31)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v34 = [(NSMutableDictionary *)self->_discoveredDevices allValues];
            *(_DWORD *)buf = 138412290;
            double v38 = *(double *)&v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Updating client with devices list %@", buf, 0xCu);
          }
          id v33 = [(SDHotspotBrowser *)self clientProxy];
          id v35 = [(NSMutableDictionary *)self->_discoveredDevices allValues];
          [v33 updatedFoundDeviceList:v35];
        }
        else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          sub_10008569C();
        }

        goto LABEL_28;
      }
    }
    else
    {
      CFStringRef v23 = tethering_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100085668();
      }
    }
    id v29 = v13;
LABEL_28:
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  CFStringRef v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  double v17 = tethering_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v54 = v12;
    __int16 v55 = 2112;
    id v56 = v13;
    __int16 v57 = 2112;
    id v58 = v15;
    __int16 v59 = 2112;
    id v60 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "service = %@, account = %@, fromID = %@, message = %@", buf, 0x2Au);
  }

  double v18 = [v14 objectForKeyedSubscript:@"HotspotBrowserMessageType"];
  __int16 v19 = v18;
  if (!v18)
  {
    CFStringRef v23 = tethering_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000856D0();
    }
    goto LABEL_38;
  }
  id v20 = [v18 integerValue];
  if (v20 == (id)1)
  {
    __int16 v28 = tethering_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [v16 incomingResponseIdentifier];
      *(_DWORD *)buf = 138412290;
      v54 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Received response for ID = %@", buf, 0xCu);
    }
    __int16 v30 = [(IDSService *)self->_tetheringService deviceForFromID:v15];
    CFStringRef v31 = [v30 nsuuid];
    CFStringRef v23 = [v31 UUIDString];

    if (!v23)
    {
      CFStringRef v25 = tethering_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100085738();
      }
      goto LABEL_37;
    }
    id v32 = [objc_alloc((Class)NSUUID) initWithUUIDString:v23];
    CFStringRef v25 = v32;
    if (!v32)
    {
      id v40 = tethering_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_10008576C();
      }
      goto LABEL_36;
    }
    long long v45 = v32;
    uint64_t v33 = [v14 objectForKeyedSubscript:@"HotspotBroswerCredentialData"];
    long long v44 = v33;
    if (v33)
    {
      uint64_t v34 = v33;
      outstandingRequests = self->_outstandingRequests;
      long long v43 = [v16 incomingResponseIdentifier];
      uint64_t v36 = [(NSMutableDictionary *)outstandingRequests objectForKeyedSubscript:v43];
      [(SDHotspotBrowser *)self tetheringDidRetrieveCredentials:v45 credentials:v34 requestRecord:v36 error:0];

      v37 = [v16 incomingResponseIdentifier];

      if (!v37)
      {
        id v40 = v44;
        CFStringRef v25 = v45;
        goto LABEL_36;
      }
      double v38 = self->_outstandingRequests;
      __int16 v39 = [v16 incomingResponseIdentifier];
      [(NSMutableDictionary *)v38 removeObjectForKey:v39];
      CFStringRef v25 = v45;
    }
    else
    {
      NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
      CFStringRef v52 = @"Could not retrieve credentials";
      id v41 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      __int16 v39 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:94 userInfo:v41];

      long long v42 = tethering_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_1000857A0();
      }

      CFStringRef v25 = v45;
      [(SDHotspotBrowser *)self tetheringDidRetrieveCredentials:v45 credentials:0 requestRecord:0 error:v39];
    }

    id v40 = v44;
LABEL_36:

LABEL_37:
LABEL_38:

    goto LABEL_39;
  }
  if (!v20)
  {
    unsigned __int16 v21 = [(IDSService *)self->_tetheringService deviceForFromID:v15];
    __int16 v22 = [v21 nsuuid];
    CFStringRef v23 = [v22 UUIDString];

    __int16 v24 = tethering_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received request for credentials from peer with bluetooth ID = %@", buf, 0xCu);
    }

    if (v15 && v23)
    {
      CFStringRef v25 = [(SDHotspotBrowser *)self modelCodeForIdentifier:v23];
      if ([v25 isEqualToString:@"Unknown"])
      {
        unsigned __int8 v26 = tethering_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Can not retrieve modelID for peer with bluetooth ID = %@", buf, 0xCu);
        }

        uint64_t CanConnectOn5GHz = 0;
      }
      else
      {
        uint64_t CanConnectOn5GHz = SFRemoteDeviceCanConnectOn5GHz();
      }
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1000826F4;
      v46[3] = &unk_1008CBA28;
      CFStringRef v47 = v23;
      NSErrorUserInfoKey v48 = self;
      id v49 = v15;
      id v50 = v16;
      [(SDHotspotBrowser *)self credentialsWithCompletionHandler:v46 canConnectOn5GHz:CanConnectOn5GHz];
    }
    else
    {
      CFStringRef v25 = tethering_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100085704();
      }
    }
    goto LABEL_37;
  }
LABEL_39:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  CFStringRef v12 = tethering_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"NO";
    int v23 = 138412802;
    id v24 = v10;
    __int16 v25 = 2112;
    if (v8) {
      CFStringRef v13 = @"YES";
    }
    CFStringRef v26 = v13;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Message with identifier = %@ did send with success = %@, error = %@", (uint8_t *)&v23, 0x20u);
  }

  if (!v8)
  {
    id v14 = [(NSMutableDictionary *)self->_outstandingRequests objectForKeyedSubscript:v10];
    id v15 = [v14 remoteHotspotDevice];
    id v16 = [v15 deviceIdentifier];
    double v17 = [(SDHotspotBrowser *)self modelCodeForIdentifier:v16];

    double v18 = [v14 remoteHotspotDevice];
    unsigned int v19 = [v18 hasDuplicates];

    if (v19) {
      uint64_t v20 = 7;
    }
    else {
      uint64_t v20 = 4;
    }
    sub_100047454(self->_modelCode, v17, v11, v20, 0);
    [(NSMutableDictionary *)self->_outstandingRequests removeObjectForKey:v10];
    unsigned __int16 v21 = tethering_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v22 = @"NO";
      int v23 = 138412802;
      id v24 = v10;
      __int16 v25 = 2112;
      if (v19) {
        CFStringRef v22 = @"YES";
      }
      CFStringRef v26 = v22;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Request failed (id = %@, duplicates = %@, error = %@)", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  unsigned int v5 = tethering_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSService *)self->_tetheringService devices];
    int v7 = 138412290;
    BOOL v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "devicesChanged %@", (uint8_t *)&v7, 0xCu);
  }
  [(SDHotspotBrowser *)self restartConsumerScanning];
  [(SDHotspotBrowser *)self restartProducerScanning];
}

- (void)restartScanResetTimer
{
  id v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting scan reset timer", buf, 2u);
  }

  unsigned int v4 = [(SDHotspotBrowser *)self scanResetTimer];

  if (!v4)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100082D18;
    v10[3] = &unk_1008CA3B0;
    objc_copyWeak(&v11, (id *)buf);
    id v6 = sub_1001B1B10(0, workQueue, v10);
    [(SDHotspotBrowser *)self setScanResetTimer:v6];

    int v7 = [(SDHotspotBrowser *)self scanResetTimer];
    dispatch_resume(v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  BOOL v8 = [(SDHotspotBrowser *)self scanResetTimer];
  dispatch_time_t v9 = sub_1001B1AF8(15.0);
  sub_1001B1BC4(v8, v9);
}

- (void)invalidateScanResetTimer
{
  id v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating scan reset timer", v6, 2u);
  }

  unsigned int v4 = [(SDHotspotBrowser *)self scanResetTimer];

  if (v4)
  {
    unsigned int v5 = [(SDHotspotBrowser *)self scanResetTimer];
    dispatch_source_cancel(v5);

    [(SDHotspotBrowser *)self setScanResetTimer:0];
  }
}

- (void)handleScanResetTimerFired
{
  id v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scan reset timer fired", v4, 2u);
  }

  [(SDHotspotBrowser *)self invalidateScanResetTimer];
  [(SDHotspotBrowser *)self stopProducerScanning];
  [(SDHotspotBrowser *)self restartProducerScanning];
}

- (void)restartScanAssertionTimer
{
  id v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting scan assertion timer", buf, 2u);
  }

  unsigned int v4 = [(SDHotspotBrowser *)self scanAssertionTimer];

  if (!v4)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100083018;
    v10[3] = &unk_1008CA3B0;
    objc_copyWeak(&v11, (id *)buf);
    id v6 = sub_1001B1B10(0, workQueue, v10);
    [(SDHotspotBrowser *)self setScanAssertionTimer:v6];

    int v7 = [(SDHotspotBrowser *)self scanAssertionTimer];
    dispatch_resume(v7);

    [(SDHotspotBrowser *)self preventIdleSleepAssertion];
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  BOOL v8 = [(SDHotspotBrowser *)self scanAssertionTimer];
  dispatch_time_t v9 = sub_1001B1AF8(30.0);
  sub_1001B1BC4(v8, v9);
}

- (void)invalidateScanAssertionTimer
{
  id v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating scan assertion timer", v6, 2u);
  }

  unsigned int v4 = [(SDHotspotBrowser *)self scanAssertionTimer];

  if (v4)
  {
    unsigned int v5 = [(SDHotspotBrowser *)self scanAssertionTimer];
    dispatch_source_cancel(v5);

    [(SDHotspotBrowser *)self setScanAssertionTimer:0];
  }
}

- (void)handleScanAssertionTimerFired
{
  id v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scan assertion timer fired", v4, 2u);
  }

  self->_shouldBeAdvertisingResponse = 0;
  [(SDHotspotBrowser *)self stopAdvertisingResponse];
  [(SDHotspotBrowser *)self invalidateScanAssertionTimer];
  [(SDHotspotBrowser *)self releaseIdleSleepAssertion];
}

- (void)preventIdleSleepAssertion
{
  id v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  unsigned int powerAssertionID = self->_powerAssertionID;
  p_unsigned int powerAssertionID = &self->_powerAssertionID;
  if (!powerAssertionID)
  {
    int v7 = tethering_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Grabbing power assertion to allow source to advertise", v12, 2u);
    }

    v13[0] = @"FrameworkBundleID";
    v13[1] = @"AssertType";
    v14[0] = @"com.apple.Sharing";
    v14[1] = @"PreventUserIdleSystemSleep";
    v13[2] = @"AssertName";
    v14[2] = @"Tethering";
    CFDictionaryRef v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    IOReturn v9 = IOPMAssertionCreateWithProperties(v8, p_powerAssertionID);
    if (v9)
    {
      int v10 = v9;
      id v11 = tethering_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10008583C(v10, v11);
      }

      unsigned int *p_powerAssertionID = 0;
    }
  }
}

- (void)releaseIdleSleepAssertion
{
  if (self->_powerAssertionID)
  {
    id v3 = tethering_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing power assertion", v5, 2u);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_unsigned int powerAssertionID = 0;
  }
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  CFStringRef v13 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/didDiscoverType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  os_activity_scope_enter(v13, &v21);
  if (a4 == 2)
  {
    uint64_t v20 = [v12 UUIDString];
    [(SDHotspotBrowser *)self handleIncomingResponse:v11 identifier:v20];
  }
  else if (a4 == 1)
  {
    id v14 = tethering_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v12 UUIDString];
      *(_DWORD *)buf = 138412546;
      int v23 = v15;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received target advertisement (peer: %@, data: %@)", buf, 0x16u);
    }
    [(SDHotspotBrowser *)self restartScanResetTimer];
    [(SDHotspotBrowser *)self restartScanAssertionTimer];
    id v16 = +[SDStatusMonitor sharedMonitor];
    unsigned __int8 v17 = [v16 controlCenterVisible];

    if ((v17 & 1) == 0)
    {
      self->_shouldBeAdvertisingResponse = 1;
      double v18 = [v12 UUIDString];
      targetIdentifier = self->_targetIdentifier;
      self->_targetIdentifier = v18;

      [(SDHotspotBrowser *)self restartAdvertisingTetheringResponse];
    }
  }
  os_activity_scope_leave(&v21);
}

- (void)credentialsWithCompletionHandler:(id)a3 canConnectOn5GHz:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = tethering_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Turning on personal hotspot", buf, 2u);
  }

  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10008367C;
  CFStringRef v13 = &unk_1008CBA78;
  id v14 = self;
  id v15 = v6;
  id v8 = v6;
  IOReturn v9 = objc_retainBlock(&v10);
  -[SDHotspotManager startTetheringWithCompletionHandler:modelID:productVersion:canConnectOn5GHz:](self->_hotspotManager, "startTetheringWithCompletionHandler:modelID:productVersion:canConnectOn5GHz:", v9, 0, 0, v4, v10, v11, v12, v13, v14);
}

- (void)tetheringDidRetrieveCredentials:(id)a3 credentials:(id)a4 requestRecord:(id)a5 error:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = tethering_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = @"YES";
    *(_DWORD *)buf = 138412802;
    CFStringRef v64 = v10;
    __int16 v65 = 2112;
    if (!v11) {
      CFStringRef v15 = @"NO";
    }
    uint64_t v66 = (uint64_t)v15;
    __int16 v67 = 2112;
    id v68 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Tethering did retrieve credentials for identifier = %@, credentials = %@, with error = %@", buf, 0x20u);
  }

  id v16 = [(__CFString *)v10 UUIDString];
  [(SDHotspotBrowser *)self invalidateTimerWithIdentifier:v16];

  p_handlers = &self->_handlers;
  handlers = self->_handlers;
  unsigned int v19 = [(__CFString *)v10 UUIDString];
  uint64_t v20 = [(NSMutableDictionary *)handlers objectForKeyedSubscript:v19];
  os_activity_scope_state_s v21 = (void (**)(id, void, id))[v20 copy];

  if (v21)
  {
    if (v13)
    {
      CFStringRef v22 = tethering_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100085B00();
      }

      v21[2](v21, 0, v13);
    }
    else
    {
      v71[0] = objc_opt_class();
      v71[1] = objc_opt_class();
      v71[2] = objc_opt_class();
      v71[3] = objc_opt_class();
      __int16 v24 = +[NSArray arrayWithObjects:v71 count:4];
      id v25 = +[NSSet setWithArray:v24];

      id v58 = 0;
      CFStringRef v26 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v25 fromData:v11 error:&v58];
      id v13 = v58;
      id v56 = v12;
      if (v26)
      {
        v54 = v25;
        uint64_t v27 = [v26 objectForKeyedSubscript:@"HotspotCredentialName"];
        uint64_t v28 = [v26 objectForKeyedSubscript:@"HotspotCredentialPassword"];
        __int16 v55 = [v26 objectForKeyedSubscript:@"HotspotCredentialChannel"];
        __int16 v57 = (void *)v28;
        [(SDHotspotBrowser *)self credentialLog:v28];
        id v29 = tethering_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v30 = @"YES";
          *(_DWORD *)buf = 138413058;
          CFStringRef v64 = @"YES";
          __int16 v65 = 2112;
          if (!v57) {
            CFStringRef v30 = @"NO";
          }
          uint64_t v66 = v27;
          __int16 v67 = 2112;
          id v68 = v55;
          __int16 v69 = 2112;
          CFStringRef v70 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Receive credentials dictionary (dictionary = %@, name = %@, channel = %@, password = %@)", buf, 0x2Au);
        }

        CFStringRef v52 = v26;
        v53 = (void *)v27;
        if (v27 && v57 && (uint64_t)[v55 integerValue] >= 1)
        {
          CFStringRef v31 = tethering_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v32 = [v55 integerValue];
            *(_DWORD *)buf = 138412546;
            CFStringRef v64 = (const __CFString *)v27;
            __int16 v65 = 1024;
            LODWORD(v66) = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Received credentials for network = %@, channel = %d", buf, 0x12u);
          }

          id v33 = [objc_alloc((Class)SFRemoteHotspotInfo) initWithName:v27 password:v57 channel:v55];
          ((void (**)(id, id, id))v21)[2](v21, v33, 0);
          uint64_t v34 = [v12 remoteHotspotDevice];
          id v35 = [v34 deviceIdentifier];
          NSErrorUserInfoKey v51 = [(SDHotspotBrowser *)self modelCodeForIdentifier:v35];

          uint64_t v36 = +[NSDate date];
          v37 = [v12 startTime];
          [v36 timeIntervalSinceDate:v37];
          double v39 = v38;

          sub_1000472A8(self->_modelCode, v51, &off_100902790, 0, v39);
          id v40 = tethering_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            CFStringRef v64 = *(const __CFString **)&v39;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Credential transfer time = %f", buf, 0xCu);
          }
        }
        else
        {
          id v33 = [v26 objectForKeyedSubscript:@"HotspotCredentialError"];
          if (!v33)
          {
            NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
            CFStringRef v62 = @"Credentials failed to transfer";
            id v41 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
            id v33 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:94 userInfo:v41];
          }
          long long v42 = tethering_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_100085A98();
          }

          modelCode = self->_modelCode;
          long long v44 = [(__CFString *)v10 UUIDString];
          long long v45 = [(SDHotspotBrowser *)self modelCodeForIdentifier:v44];
          sub_100047454(modelCode, v45, v33, 6, 0);

          v21[2](v21, 0, v33);
        }
        NSErrorUserInfoKey v46 = v52;
        CFStringRef v47 = v57;

        NSErrorUserInfoKey v48 = v53;
        id v25 = v54;
      }
      else
      {
        NSErrorUserInfoKey v46 = 0;
        id v49 = tethering_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_100085A30();
        }

        NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
        CFStringRef v60 = @"Credentials failed to unarchive";
        NSErrorUserInfoKey v48 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        CFStringRef v47 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:94 userInfo:v48];
        v21[2](v21, 0, v47);
      }

      id v12 = v56;
    }
    id v50 = *p_handlers;
    int v23 = [(__CFString *)v10 UUIDString];
    [(NSMutableDictionary *)v50 removeObjectForKey:v23];
  }
  else
  {
    int v23 = tethering_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100085980(v10, (uint64_t)&self->_handlers, v23);
    }
  }
}

- (void)continuityDidUpdateState:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidUpdateState", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  switch((unint64_t)[(IDSContinuity *)self->_tetheringManager state])
  {
    case 0uLL:
      id v6 = tethering_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_WORD *)IOReturn v9 = 0;
      int v7 = "Tethering did receive IDSContinuityStateUnknown";
      break;
    case 1uLL:
      id v6 = tethering_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_WORD *)IOReturn v9 = 0;
      int v7 = "Tethering did receive IDSContinuityStateResetting";
      break;
    case 2uLL:
      id v6 = tethering_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_WORD *)IOReturn v9 = 0;
      int v7 = "Tethering did receive IDSContinuityStatePoweredOff";
      break;
    case 3uLL:
      id v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)IOReturn v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tethering did receive IDSContinuityStatePoweredOn", v9, 2u);
      }

      [(SDHotspotBrowser *)self restartAdvertisingTetheringRequest];
      [(SDHotspotBrowser *)self restartAdvertisingTetheringResponse];
      [(SDHotspotBrowser *)self restartProducerScanning];
      [(SDHotspotBrowser *)self restartConsumerScanning];
      goto LABEL_14;
    default:
      goto LABEL_13;
  }
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v9, 2u);
LABEL_12:

LABEL_13:
  self->_BOOL sourceAdvertising = 1;
  self->_shouldBeAdvertisingResponse = 0;
  [(SDHotspotBrowser *)self stopAdvertisingResponse];
LABEL_14:
  os_activity_scope_leave(&state);
}

- (void)continuity:(id)a3 didStartAdvertisingOfType:(int64_t)a4
{
  id v6 = a3;
  int v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidStartAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (a4 == 1)
  {
    if (self->_targetAdvertising)
    {
      id v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        IOReturn v9 = "Received a start target advertising callback even though we're already advertising";
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    self->_targetAdvertising = 1;
    id v10 = +[NSDate date];
    [(SDHotspotBrowser *)self setBrowseStartTime:v10];

    id v11 = tethering_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Target started advertising request", v12, 2u);
    }

    sub_1000472A8(self->_modelCode, @"Unknown", &off_100902748, 1, -1.0);
  }
  else if (a4 == 2)
  {
    if (self->_sourceAdvertising)
    {
      id v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        IOReturn v9 = "Received a start source advertising callback even though we're already advertising";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v12, 2u);
        goto LABEL_12;
      }
    }
    else
    {
      self->_BOOL sourceAdvertising = 1;
      id v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        IOReturn v9 = "Source started advertising response";
        goto LABEL_11;
      }
    }
    goto LABEL_12;
  }
LABEL_13:
  os_activity_scope_leave(&state);
}

- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidStopAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  if (a4 != 1)
  {
    if (a4 != 2) {
      goto LABEL_24;
    }
    self->_BOOL sourceAdvertising = 0;
    id v11 = tethering_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Source stopped advertising response", v20, 2u);
    }

    id v12 = [v9 domain];
    if ([v12 isEqualToString:WPErrorDomain])
    {
      id v13 = [v9 code];

      if (v13 == (id)28)
      {
        id v14 = tethering_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Response advertisement stopped for BLE address rotation", v20, 2u);
        }

        if (self->_shouldBeAdvertisingResponse)
        {
          CFStringRef v15 = tethering_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v20 = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Restarting response advertisement for rotation", v20, 2u);
          }

          [(SDHotspotBrowser *)self restartAdvertisingTetheringResponse];
        }
      }
      goto LABEL_24;
    }
LABEL_23:

    goto LABEL_24;
  }
  self->_targetAdvertising = 0;
  [(SDHotspotBrowser *)self setBrowseStartTime:0];
  id v16 = tethering_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Target stopped advertising request", v20, 2u);
  }

  id v12 = [v9 domain];
  if (![v12 isEqualToString:WPErrorDomain]) {
    goto LABEL_23;
  }
  id v17 = [v9 code];

  if (v17 == (id)28)
  {
    double v18 = tethering_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request advertisement stopped for BLE address rotation", v20, 2u);
    }

    if (self->_shouldBeAdvertisingRequest)
    {
      unsigned int v19 = tethering_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Restarting request advertisement for rotation", v20, 2u);
      }

      [(SDHotspotBrowser *)self restartAdvertisingTetheringRequest];
    }
  }
LABEL_24:
  os_activity_scope_leave(&state);
}

- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidFailToStartAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v10, &v14);
  if (a4 == 1)
  {
    self->_targetAdvertising = 0;
    id v13 = tethering_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100085BD0();
    }

    sub_100047454(self->_modelCode, @"Unknown", v9, 1, 1);
  }
  else if (a4 == 2)
  {
    self->_BOOL sourceAdvertising = 0;
    targetIdentifier = self->_targetIdentifier;
    self->_targetIdentifier = 0;

    [(SDHotspotBrowser *)self setBrowseStartTime:0];
    id v12 = tethering_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100085B68();
    }
  }
  os_activity_scope_leave(&v14);
}

- (void)continuity:(id)a3 didStartScanningForType:(int64_t)a4
{
  id v6 = a3;
  int v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidStartScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (a4 == 1)
  {
    if (self->_sourceScanning)
    {
      id v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        id v9 = "Received a start target scanning callback even though we're already scanning";
        goto LABEL_14;
      }
    }
    else
    {
      self->_sourceScanning = 1;
      id v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        id v9 = "Source started scanning for requests from targets";
        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  if (a4 == 2)
  {
    if (self->_targetScanning)
    {
      id v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        id v9 = "Received a start source scanning callback even though we're already scanning";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v11, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    self->_targetScanning = 1;
    id v10 = tethering_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Target started scanning for responses from sources", v11, 2u);
    }

    sub_1000472A8(self->_modelCode, @"Unknown", &off_1009027A8, 1, -1.0);
  }
LABEL_16:
  os_activity_scope_leave(&state);
}

- (void)continuity:(id)a3 didStopScanningForType:(int64_t)a4
{
  id v6 = a3;
  int v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidStopScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (a4 == 1)
  {
    self->_sourceScanning = 0;
    id v8 = tethering_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      id v9 = "Source stopped scanning for requests from targets";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (a4 == 2)
  {
    self->_targetScanning = 0;
    id v8 = tethering_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      id v9 = "Target stopped scanning for responses";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  os_activity_scope_leave(&state);
}

- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidFailToStartScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v10, &v13);
  if (a4 == 1)
  {
    self->_sourceScanning = 0;
    id v12 = tethering_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100085CA0();
    }
  }
  else if (a4 == 2)
  {
    self->_targetScanning = 0;
    id v11 = tethering_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100085C38();
    }

    sub_100047454(self->_modelCode, @"Unknown", v9, 2, 1);
  }
  os_activity_scope_leave(&v13);
}

- (SFRemoteHotspotClient)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (SDHotspotManager)hotspotManager
{
  return self->_hotspotManager;
}

- (BOOL)producerScanEnabled
{
  return self->_producerScanEnabled;
}

- (BOOL)d2dEncryptionAvailable
{
  return self->_d2dEncryptionAvailable;
}

- (void)setD2dEncryptionAvailable:(BOOL)a3
{
  self->_d2dEncryptionAvailable = a3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (SDStatusMonitor)monitor
{
  return (SDStatusMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMonitor:(id)a3
{
}

- (IDSContinuity)tetheringManager
{
  return (IDSContinuity *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTetheringManager:(id)a3
{
}

- (unsigned)IDHash
{
  return self->_IDHash;
}

- (void)setIDHash:(unsigned int)a3
{
  self->_unsigned int IDHash = a3;
}

- (BOOL)hasAppleID
{
  return self->_hasAppleID;
}

- (void)setHasAppleID:(BOOL)a3
{
  self->_BOOL hasAppleID = a3;
}

- (IDSService)tetheringService
{
  return (IDSService *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTetheringService:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)timeString
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTimeString:(id)a3
{
}

- (PCPersistentTimer)nextCrossoverPersistentTimer
{
  return (PCPersistentTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNextCrossoverPersistentTimer:(id)a3
{
}

- (unint64_t)nextDayTimeOffset
{
  return self->_nextDayTimeOffset;
}

- (void)setNextDayTimeOffset:(unint64_t)a3
{
  self->_unint64_t nextDayTimeOffset = a3;
}

- (BOOL)shouldBeConsumerScanning
{
  return self->_shouldBeConsumerScanning;
}

- (void)setShouldBeConsumerScanning:(BOOL)a3
{
  self->_shouldBeConsumerScanning = a3;
}

- (BOOL)shouldBeAdvertisingRequest
{
  return self->_shouldBeAdvertisingRequest;
}

- (void)setShouldBeAdvertisingRequest:(BOOL)a3
{
  self->_shouldBeAdvertisingRequest = a3;
}

- (BOOL)pausedForWiFiPasswordSharing
{
  return self->_pausedForWiFiPasswordSharing;
}

- (void)setPausedForWiFiPasswordSharing:(BOOL)a3
{
  self->_pausedForWiFiPasswordSharing = a3;
}

- (NSMutableDictionary)handlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableDictionary)retrieveTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRetrieveTimers:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTransaction:(id)a3
{
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_unsigned int powerAssertionID = a3;
}

- (BOOL)shouldBeAdvertisingResponse
{
  return self->_shouldBeAdvertisingResponse;
}

- (void)setShouldBeAdvertisingResponse:(BOOL)a3
{
  self->_shouldBeAdvertisingResponse = a3;
}

- (NSTimer)advertiseResponseTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAdvertiseResponseTimer:(id)a3
{
}

- (NSMutableDictionary)discoveredDevices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDiscoveredDevices:(id)a3
{
}

- (NSString)targetIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTargetIdentifier:(id)a3
{
}

- (OS_dispatch_source)scanResetTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 168, 1);
}

- (void)setScanResetTimer:(id)a3
{
}

- (OS_dispatch_source)scanAssertionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 176, 1);
}

- (void)setScanAssertionTimer:(id)a3
{
}

- (BOOL)targetAdvertising
{
  return self->_targetAdvertising;
}

- (void)setTargetAdvertising:(BOOL)a3
{
  self->_targetAdvertising = a3;
}

- (BOOL)targetScanning
{
  return self->_targetScanning;
}

- (void)setTargetScanning:(BOOL)a3
{
  self->_targetScanning = a3;
}

- (BOOL)sourceAdvertising
{
  return self->_sourceAdvertising;
}

- (void)setSourceAdvertising:(BOOL)a3
{
  self->_BOOL sourceAdvertising = a3;
}

- (BOOL)sourceScanning
{
  return self->_sourceScanning;
}

- (void)setSourceScanning:(BOOL)a3
{
  self->_sourceScanning = a3;
}

- (NSString)modelCode
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setModelCode:(id)a3
{
}

- (NSDate)browseStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBrowseStartTime:(id)a3
{
}

- (NSMutableDictionary)outstandingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setOutstandingRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_browseStartTime, 0);
  objc_storeStrong((id *)&self->_modelCode, 0);
  objc_storeStrong((id *)&self->_scanAssertionTimer, 0);
  objc_storeStrong((id *)&self->_scanResetTimer, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_advertiseResponseTimer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_retrieveTimers, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_nextCrossoverPersistentTimer, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_tetheringService, 0);
  objc_storeStrong((id *)&self->_tetheringManager, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_hotspotManager, 0);
  objc_storeStrong((id *)&self->_idsService, 0);

  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end