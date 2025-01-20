@interface CBIDSManager
+ (id)sharedInstance;
- (BOOL)allDevicesStarSky;
- (BOOL)isLegacyDevice:(id)a3;
- (BOOL)isReady;
- (BOOL)processingIDSPush;
- (BOOL)shouldUpgradeToManatee;
- (BOOL)supportsVirtualAddress;
- (BOOL)validateKeys:(id)a3 requestedTypes:(id)a4 from:(id)a5;
- (BOOL)validateMessage:(id)a3 from:(id)a4;
- (BTStateWatcher)buddyStateWatcher;
- (BTStateWatcher)firstUnlockStateWatcher;
- (CBIDSManager)init;
- (IDSAccount)account;
- (IDSService)service;
- (NSArray)associatedDevices;
- (NSArray)requestedKeyTypes;
- (NSMutableArray)cloudDevices;
- (NSMutableDictionary)CPAddressMapping;
- (NSMutableDictionary)messageIdentifiersWaitingForAck;
- (NSMutableSet)unpairedIDSCloudIdentifiers;
- (NSString)cloudIdentifier;
- (NSString)localDeviceName;
- (NSString)localDeviceRandomAddress;
- (NSString)publicAddress;
- (OS_dispatch_queue)cloudPairingQueue;
- (id)_fetchArrayOfCloudDevicesForPeripheral:(id)a3;
- (id)_fetchCloudPairingIdentifierForPeripheral:(id)a3;
- (id)_statedumpAndRecordDailyMetric;
- (id)deviceForIDSDevice:(id)a3 createNew:(BOOL)a4;
- (id)filteredDevicesForIDSDevices:(id)a3;
- (id)publicAddressForIDSDevice:(id)a3;
- (id)statedumpAndRecordDailyMetric;
- (int64_t)totalCloudDeviceCount;
- (unint64_t)keyLength;
- (unint64_t)roleWithDevice:(id)a3;
- (void)_sendRePairRequest:(id)a3 forBundleID:(id)a4;
- (void)checkFirstUnlockForIDS;
- (void)cloudPairingCompletedWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6;
- (void)connectionUpdatedForBluetoothIdentifier:(id)a3 connected:(BOOL)a4;
- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 withCompletion:(id)a4;
- (void)fetchIDSDevicesWithCompletion:(id)a3;
- (void)fetchPublicAddressWithCompletion:(id)a3;
- (void)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5 withCompletion:(id)a6;
- (void)handleCloudPairingMessage:(id)a3 from:(id)a4;
- (void)handleInitiatorPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5;
- (void)handleKeyDistribution:(id)a3 from:(id)a4;
- (void)handlePairingFailure:(id)a3 from:(id)a4;
- (void)handlePairingRequest:(id)a3 from:(id)a4;
- (void)handlePairingResponse:(id)a3 from:(id)a4;
- (void)handleRepairRequest:(id)a3 from:(id)a4;
- (void)handleResponderPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5;
- (void)handleSecurityRequest:(id)a3 from:(id)a4;
- (void)handleUnpairCommand:(id)a3 from:(id)a4;
- (void)initializeIDS;
- (void)initiatePairing:(id)a3;
- (void)initiatePairingAgainIfNoAckReceived:(id)a3 attempt:(unint64_t)a4;
- (void)retryIDSSetup;
- (void)sendCloudPairingResponseMessage:(id)a3 toDevice:(id)a4 version:(id)a5;
- (void)sendErrorMessageToDevice:(id)a3 reason:(id)a4;
- (void)sendInitialPairingIDSMessage:(id)a3 forDevice:(id)a4 withRole:(unint64_t)a5;
- (void)sendRePairCloudPairingMessage:(id)a3 toDevice:(id)a4 bundleID:(id)a5;
- (void)sendRePairRequest:(id)a3 forBundleID:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setAccount:(id)a3;
- (void)setAssociatedDevices:(id)a3;
- (void)setBuddyStateWatcher:(id)a3;
- (void)setCPAddressMapping:(id)a3;
- (void)setCloudDevices:(id)a3;
- (void)setCloudIdentifier:(id)a3;
- (void)setCloudPairingQueue:(id)a3;
- (void)setFirstUnlockStateWatcher:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLocalDeviceName:(id)a3;
- (void)setLocalDeviceRandomAddress:(id)a3;
- (void)setMessageIdentifiersWaitingForAck:(id)a3;
- (void)setProcessingIDSPush:(BOOL)a3;
- (void)setPublicAddress:(id)a3;
- (void)setRequestedKeyTypes:(id)a3;
- (void)setService:(id)a3;
- (void)setSupportsVirtualAddress:(BOOL)a3;
- (void)setTotalCloudDeviceCount:(int64_t)a3;
- (void)setUnpairedIDSCloudIdentifiers:(id)a3;
- (void)storePublicAddressMapping:(id)a3 message:(id)a4;
- (void)updateActiveAccount:(id)a3;
- (void)updateCloudPairings:(id)a3 newDevices:(id)a4;
- (void)validateCloudPairing:(id)a3;
- (void)xpcUpdateCloudPairings:(id)a3;
@end

@implementation CBIDSManager

+ (id)sharedInstance
{
  if (qword_100263EB8 != -1) {
    dispatch_once(&qword_100263EB8, &stru_100234660);
  }
  v2 = (void *)qword_100263EB0;

  return v2;
}

- (CBIDSManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)CBIDSManager;
  v2 = [(CBIDSManager *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.bluetooth.cloudpairing", v3);
    [(CBIDSManager *)v2 setCloudPairingQueue:v4];

    LODWORD(v4) = +[BTSystemConfiguration isBuddyComplete];
    v5 = sub_10006CA04("CloudPairing");
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDS BYSetupAssistantNeedsToRun : false ", (uint8_t *)buf, 2u);
      }

      [(CBIDSManager *)v2 checkFirstUnlockForIDS];
    }
    else
    {
      if (v6)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDS BYSetupAssistantNeedsToRun : true ", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, v2);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10005C394;
      v9[3] = &unk_100234688;
      objc_copyWeak(&v10, buf);
      v7 = +[BTStateWatcher monitorBuddyStateWithAction:v9];
      [(CBIDSManager *)v2 setBuddyStateWatcher:v7];

      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }
  }
  return v2;
}

- (void)checkFirstUnlockForIDS
{
  v3 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = +[BTSystemConfiguration isFirstUnlocked];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "First Unlock Check: %i", (uint8_t *)&buf, 8u);
  }

  if (+[BTSystemConfiguration isFirstUnlocked])
  {
    dispatch_queue_t v4 = [(CBIDSManager *)self cloudPairingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005C66C;
    block[3] = &unk_100232710;
    block[4] = self;
    dispatch_async(v4, block);
  }
  else
  {
    objc_initWeak(&buf, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005C674;
    v6[3] = &unk_1002346B0;
    v6[4] = self;
    objc_copyWeak(&v7, &buf);
    v5 = +[BTStateWatcher monitorFirstUnlockWithAction:v6];
    [(CBIDSManager *)self setFirstUnlockStateWatcher:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&buf);
  }
}

- (void)initializeIDS
{
  v3 = [(CBIDSManager *)self service];

  if (v3)
  {
    dispatch_queue_t v4 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already initialized IDS", buf, 2u);
    }
  }
  else
  {
    [(CBIDSManager *)self setLocalDeviceRandomAddress:0];
    v5 = +[NSMutableSet set];
    [(CBIDSManager *)self setUnpairedIDSCloudIdentifiers:v5];

    BOOL v6 = +[CBPreferencesManager deviceName];
    [(CBIDSManager *)self setLocalDeviceName:v6];

    id v7 = [objc_alloc((Class)NSArray) initWithObjects:@"EncryptionKeys", @"IdentityKeys", nil];
    [(CBIDSManager *)self setRequestedKeyTypes:v7];

    v8 = (void *)IDSCopyLocalDeviceUniqueID();
    [(CBIDSManager *)self setCloudIdentifier:v8];

    v9 = +[NSMutableDictionary dictionary];
    [(CBIDSManager *)self setMessageIdentifiersWaitingForAck:v9];

    id v10 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(CBIDSManager *)self cloudIdentifier];
      objc_super v12 = [(CBIDSManager *)self localDeviceName];
      *(_DWORD *)id buf = 138412802;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = &off_1002448F8;
      __int16 v27 = 2112;
      v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "initializeIDS (%@) checkIn version: %@, local name: %@", buf, 0x20u);
    }
    uint64_t v13 = [(CBIDSManager *)self cloudIdentifier];
    if (v13
      && (v14 = (void *)v13,
          [(CBIDSManager *)self localDeviceName],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      v16 = +[CloudXPCService sharedInstance];
      v21[0] = @"kCheckInVersion";
      v21[1] = @"kIDSLocalDeviceUniqueID";
      v22[0] = &off_1002448F8;
      v17 = [(CBIDSManager *)self cloudIdentifier];
      v22[1] = v17;
      v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005CB54;
      v20[3] = &unk_1002346D8;
      v20[4] = self;
      [v16 sendCloudKitMsg:@"checkIn" args:v18 withReply:v20];
    }
    else
    {
      v19 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1001B5528();
      }

      [(CBIDSManager *)self retryIDSSetup];
    }
  }
}

- (void)retryIDSSetup
{
  dispatch_time_t v3 = dispatch_time(0, 30000000000);
  dispatch_queue_t v4 = [(CBIDSManager *)self cloudPairingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D31C;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (void)validateCloudPairing:(id)a3
{
  id v4 = a3;
  v50 = +[NSMutableArray array];
  v5 = [(CBIDSManager *)self associatedDevices];
  v51 = +[NSMutableArray arrayWithArray:v5];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v55 = self;
  id obj = [(CBIDSManager *)self associatedDevices];
  id v6 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
  if (v6)
  {
    id v7 = v6;
    v48 = v57;
    uint64_t v8 = *(void *)v61;
    uint64_t v53 = *(void *)v61;
    id v49 = v4;
    do
    {
      v9 = 0;
      id v52 = v7;
      do
      {
        if (*(void *)v61 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v9);
        v11 = [v10 idsDevice:v48];
        objc_super v12 = [v11 nsuuid];

        if (v12)
        {
          uint64_t v13 = [v10 idsDevice];
          v14 = [v13 nsuuid];
          v15 = [v14 UUIDString];
          v16 = [v4 objectForKey:v15];

          if ([v16 length]
            && ([v10 idsDevice],
                v17 = objc_claimAutoreleasedReturnValue(),
                [v17 uniqueID],
                v18 = objc_claimAutoreleasedReturnValue(),
                unsigned int v19 = [v16 isEqualToString:v18],
                v18,
                v17,
                v19))
          {
            v20 = sub_10006CA04("CloudPairing");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = [v10 idsDevice];
              v22 = [v21 nsuuid];
              *(_DWORD *)id buf = 138412546;
              v68 = v22;
              __int16 v69 = 2112;
              v70 = v16;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ is already cloud paired with IDS Device: %@", buf, 0x16u);
            }
            [v50 addObject:v16];
          }
          else
          {
            v23 = [v10 idsDevice];
            v24 = [v23 nsuuid];
            __int16 v25 = [(CBIDSManager *)v55 _fetchArrayOfCloudDevicesForPeripheral:v24];

            if (-[NSObject length](v16, "length") && (unint64_t)[v25 count] >= 2)
            {
              v56[0] = _NSConcreteStackBlock;
              v56[1] = 3221225472;
              v57[0] = sub_10005DA40;
              v57[1] = &unk_100234700;
              v57[2] = v10;
              v16 = v16;
              v58 = v16;
              id v59 = v51;
              [v25 enumerateObjectsUsingBlock:v56];
            }
            else
            {
              v28 = [v10 idsDevice];
              v29 = [v28 nsuuid];
              v30 = [(CBIDSManager *)v55 _fetchCloudPairingIdentifierForPeripheral:v29];

              if (v30)
              {
                v31 = sub_10006CA04("CloudPairing");
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  v32 = [v10 idsDevice];
                  v33 = [v32 nsuuid];
                  v34 = [v10 idsDevice];
                  v35 = [v34 uniqueID];
                  *(_DWORD *)id buf = 138412546;
                  v68 = v33;
                  __int16 v69 = 2112;
                  v70 = v35;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Removing stale LE Cloud Paired Device %@ is already cloud paired with IDS Device: %@", buf, 0x16u);
                }
                v36 = +[CloudXPCService sharedInstance];
                CFStringRef v65 = @"kCloudDeviceID";
                v37 = [v10 idsDevice];
                v38 = [v37 nsuuid];
                v39 = [v38 UUIDString];
                v66 = v39;
                v40 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
                [v36 sendCloudKitMsg:@"RemoveStaleLEPairedDevice" args:v40];

                v41 = [v10 idsDevice];
                [v41 setNSUUID:0];

                [v51 removeObject:v10];
                v42 = [v10 idsDevice];
                v43 = [v42 uniqueID];
                v64 = v43;
                v44 = +[NSArray arrayWithObjects:&v64 count:1];
                v45 = +[NSBundle mainBundle];
                v46 = [v45 bundleIdentifier];
                [(CBIDSManager *)v55 sendRePairRequest:v44 forBundleID:v46];

                id v4 = v49;
                uint64_t v8 = v53;
              }

              id v7 = v52;
            }
          }
        }
        else
        {
          v16 = sub_10006CA04("CloudPairing");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v26 = [v10 idsDevice];
            __int16 v27 = [v26 uniqueID];
            *(_DWORD *)id buf = 138412290;
            v68 = v27;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ is not cloud paired with IDS Device", buf, 0xCu);

            uint64_t v8 = v53;
          }
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
    }
    while (v7);
  }

  id v47 = [(CBIDSManager *)v55 _statedumpAndRecordDailyMetric];
  [(CBIDSManager *)v55 updateCloudPairings:v50 newDevices:v51];
}

- (void)fetchPublicAddressWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = [(CBIDSManager *)self publicAddress];

  id v6 = sub_10006CA04("CloudPairing");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = [(CBIDSManager *)self publicAddress];
      *(_DWORD *)id buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "have public address: %@", buf, 0xCu);
    }
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetch public address", buf, 2u);
    }

    v9 = +[CloudXPCService sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005DDAC;
    v10[3] = &unk_100234728;
    v10[4] = self;
    v11 = v4;
    [v9 sendCloudKitMsg:@"FetchPublicAddress" args:&__NSDictionary0__struct withReply:v10];
  }
}

- (void)xpcUpdateCloudPairings:(id)a3
{
  id v4 = a3;
  v5 = [(CBIDSManager *)self cloudPairingQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005E0F8;
  v7[3] = &unk_100232A10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)connectionUpdatedForBluetoothIdentifier:(id)a3 connected:(BOOL)a4
{
  BOOL v18 = a4;
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(CBIDSManager *)self associatedDevices];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_super v12 = [v11 idsDevice];
        uint64_t v13 = [v12 nsuuid];
        v14 = [v13 UUIDString];
        unsigned int v15 = [v14 isEqualToString:v5];

        if (v15)
        {
          v16 = sub_10006CA04("CloudPairing");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = "no";
            if (v18) {
              v17 = "yes";
            }
            *(_DWORD *)id buf = 138412546;
            v24 = v11;
            __int16 v25 = 2080;
            v26 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Connection updated for device: %@, connected: %s", buf, 0x16u);
          }

          [v11 setIsConnected:v18];
          goto LABEL_15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (void)updateCloudPairings:(id)a3 newDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412546;
    *(void *)v139 = v6;
    *(_WORD *)&v139[8] = 2112;
    *(void *)v140 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MUC - updateCloudPairings, ids: %@, devices: %@", buf, 0x16u);
  }

  uint64_t v9 = [(CBIDSManager *)self publicAddress];

  if (v9)
  {
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v103 = v7;
    id obj = v7;
    id v106 = v6;
    v117 = self;
    id v112 = [obj countByEnumeratingWithState:&v130 objects:v141 count:16];
    if (!v112) {
      goto LABEL_38;
    }
    uint64_t v111 = *(void *)v131;
    while (1)
    {
      for (i = 0; i != v112; i = (char *)i + 1)
      {
        if (*(void *)v131 != v111) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v130 + 1) + 8 * i);
        objc_super v12 = [v11 idsDevice];
        uint64_t v13 = [v12 uniqueID];
        id v14 = [v6 indexOfObject:v13];

        unsigned int v15 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
        v129[0] = _NSConcreteStackBlock;
        v129[1] = 3221225472;
        v129[2] = sub_10005F3D4;
        v129[3] = &unk_100234750;
        v129[4] = v11;
        v129[5] = self;
        v16 = [v15 keysOfEntriesPassingTest:v129];

        if ([v16 count]) {
          BOOL v17 = (unint64_t)[v16 count] < 3;
        }
        else {
          BOOL v17 = 0;
        }
        BOOL v114 = v17;
        if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_20:
          __int16 v25 = [(CBIDSManager *)self service];
          unsigned int v26 = [v25 canSend];

          if (v26)
          {
            __int16 v27 = [(CBIDSManager *)self unpairedIDSCloudIdentifiers];
            v28 = [v11 idsDevice];
            v29 = [v28 uniqueID];
            [v27 addObject:v29];

            v30 = sub_10006CA04("CloudPairing");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v31 = v14 == (id)0x7FFFFFFFFFFFFFFFLL;
              if ([v16 count]) {
                v32 = "again ";
              }
              else {
                v32 = "";
              }
              v33 = [v11 idsDevice];
              v34 = [v33 nsuuid];
              id v35 = [v11 description];
              id v36 = [v35 UTF8String];
              *(_DWORD *)id buf = 136315907;
              *(void *)v139 = v32;
              *(_WORD *)&v139[8] = 1024;
              *(_DWORD *)v140 = v31;
              *(_WORD *)&v140[4] = 2112;
              *(void *)&v140[6] = v34;
              *(_WORD *)&v140[14] = 2081;
              *(void *)&v140[16] = v36;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Initiating pairing %swith unpaired IDS device [New: %i] (BT UUID: %@) %{private}s", buf, 0x26u);
            }
            self = v117;
            if (v114) {
              -[CBIDSManager initiatePairingAgainIfNoAckReceived:attempt:](v117, "initiatePairingAgainIfNoAckReceived:attempt:", v11, [v16 count]);
            }
            else {
              [(CBIDSManager *)v117 initiatePairing:v11];
            }
          }
          else
          {
            v37 = sub_10006CA04("CloudPairing");
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = [v11 idsDevice];
              v39 = [v38 nsuuid];
              id v40 = [v11 description];
              id v41 = [v40 UTF8String];
              *(_DWORD *)id buf = 138412547;
              *(void *)v139 = v39;
              *(_WORD *)&v139[8] = 2081;
              *(void *)v140 = v41;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "IDS not ready cannot initiate pairing with IDS device (BT UUID: %@) %{private}s", buf, 0x16u);

              self = v117;
            }
          }
          goto LABEL_36;
        }
        BOOL v18 = [v11 idsDevice];
        long long v19 = [v18 nsuuid];
        if (v19)
        {
          v110 = [v11 idsDevice];
          v109 = [v110 uniqueID];
          long long v20 = -[CBIDSManager publicAddressForIDSDevice:](self, "publicAddressForIDSDevice:");
          if (v20)
          {
            LOBYTE(v21) = 0;
            goto LABEL_19;
          }
          id v108 = 0;
        }
        long long v22 = [(CBIDSManager *)self unpairedIDSCloudIdentifiers];
        v23 = [v11 idsDevice];
        v24 = [v23 uniqueID];
        unsigned int v21 = [v22 containsObject:v24] ^ 1 | v17;

        if (v19)
        {
          id v6 = v106;
          self = v117;
          long long v20 = v108;
LABEL_19:
          id v108 = v20;

          if (v21) {
            goto LABEL_20;
          }
          goto LABEL_33;
        }

        id v6 = v106;
        self = v117;
        if (v21) {
          goto LABEL_20;
        }
LABEL_33:
        v42 = sub_10006CA04("CloudPairing");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          id v115 = [v11 idsDevice];
          v105 = [v115 uniqueID];
          BOOL v43 = [v6 indexOfObject:v105] != (id)0x7FFFFFFFFFFFFFFFLL;
          v104 = [(CBIDSManager *)self unpairedIDSCloudIdentifiers];
          v44 = [v11 idsDevice];
          v45 = [v44 uniqueID];
          unsigned int v46 = [v104 containsObject:v45];
          id v47 = [v11 idsDevice];
          v48 = [v47 nsuuid];
          id v49 = [v11 description];
          id v50 = [v49 UTF8String];
          *(_DWORD *)id buf = 67109891;
          *(_DWORD *)v139 = v43;
          *(_WORD *)&v139[4] = 1024;
          *(_DWORD *)&v139[6] = v46;
          *(_WORD *)v140 = 2112;
          *(void *)&v140[2] = v48;
          *(_WORD *)&v140[10] = 2081;
          *(void *)&v140[12] = v50;
          _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Device paired or deffered pairing for IDS device [Old: %i - Cached: %i] (BT UUID: %@) %{private}s", buf, 0x22u);

          id v6 = v106;
          self = v117;
        }
LABEL_36:
      }
      id v112 = [obj countByEnumeratingWithState:&v130 objects:v141 count:16];
      if (!v112)
      {
LABEL_38:

        if ([v6 count])
        {
          unint64_t v51 = 0;
          do
          {
            v126[0] = _NSConcreteStackBlock;
            v126[1] = 3221225472;
            v126[2] = sub_10005F4F0;
            v126[3] = &unk_100234778;
            id v52 = v6;
            id v127 = v52;
            unint64_t v128 = v51;
            if ([obj indexOfObjectPassingTest:v126] == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              long long v124 = 0u;
              long long v125 = 0u;
              long long v122 = 0u;
              long long v123 = 0u;
              uint64_t v53 = [(CBIDSManager *)v117 associatedDevices];
              id v54 = [v53 countByEnumeratingWithState:&v122 objects:v137 count:16];
              v55 = v52;
              v113 = v52;
              if (v54)
              {
                id v56 = v54;
                uint64_t v57 = *(void *)v123;
                while (2)
                {
                  for (j = 0; j != v56; j = (char *)j + 1)
                  {
                    if (*(void *)v123 != v57) {
                      objc_enumerationMutation(v53);
                    }
                    id v59 = *(void **)(*((void *)&v122 + 1) + 8 * (void)j);
                    uint64_t v60 = [v55 objectAtIndexedSubscript:v51];
                    if (v60)
                    {
                      long long v61 = (void *)v60;
                      long long v62 = [v55 objectAtIndexedSubscript:v51];
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0
                        && ([v59 isConnected] & 1) != 0)
                      {
                        long long v63 = [v59 idsDevice];
                        id v64 = [v63 deviceType];

                        if (v64 == (id)5)
                        {
                          v93 = sub_10006CA04("CloudPairing");
                          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                          {
                            v95 = [v55 objectAtIndexedSubscript:v51];
                            *(_DWORD *)id buf = 138412290;
                            *(void *)v139 = v95;
                            _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Skip telling btd to remove ATV that maybe in setup: %@", buf, 0xCu);
                          }
                          id v6 = v106;
                          goto LABEL_77;
                        }
                      }
                      else
                      {
                      }
                    }
                  }
                  id v56 = [v53 countByEnumeratingWithState:&v122 objects:v137 count:16];
                  if (v56) {
                    continue;
                  }
                  break;
                }
              }

              CFStringRef v65 = sub_10006CA04("CloudPairing");
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                v66 = [v55 objectAtIndexedSubscript:v51];
                *(_DWORD *)id buf = 138412290;
                *(void *)v139 = v66;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Unpairing IDS device \"%@\" as it is no longer signed into our iCloud account", buf, 0xCu);
              }
              long long v120 = 0u;
              long long v121 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              id v116 = [(CBIDSManager *)v117 associatedDevices];
              id v67 = [v116 countByEnumeratingWithState:&v118 objects:v136 count:16];
              if (v67)
              {
                id v68 = v67;
                uint64_t v69 = *(void *)v119;
                do
                {
                  for (k = 0; k != v68; k = (char *)k + 1)
                  {
                    if (*(void *)v119 != v69) {
                      objc_enumerationMutation(v116);
                    }
                    v71 = *(void **)(*((void *)&v118 + 1) + 8 * (void)k);
                    v72 = [v71 idsDevice];
                    v73 = [v72 uniqueID];
                    v74 = [v55 objectAtIndexedSubscript:v51];
                    unsigned int v75 = [v73 isEqualToIgnoringCase:v74];

                    if (v75)
                    {
                      [v71 setState:0];
                      v76 = [v71 idsDevice];
                      v77 = [v76 uniqueID];
                      v78 = [(CBIDSManager *)v117 publicAddressForIDSDevice:v77];

                      if (v78)
                      {
                        v79 = sub_10006CA04("CloudPairing");
                        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                        {
                          v80 = [v71 idsDevice];
                          v81 = [v80 uniqueID];
                          *(_DWORD *)id buf = 138412546;
                          *(void *)v139 = v78;
                          *(_WORD *)&v139[8] = 2112;
                          *(void *)v140 = v81;
                          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Removing address \"%@\" for IDS device \"%@\" as it is no longer signed into our iCloud account", buf, 0x16u);
                        }
                        v82 = [(CBIDSManager *)v117 CPAddressMapping];
                        v83 = [v71 idsDevice];
                        v84 = [v83 uniqueID];
                        [v82 removeObjectForKey:v84];

                        v85 = [(CBIDSManager *)v117 CPAddressMapping];
                        +[CBPreferencesManager setuserPreference:@"AddressMapping" value:v85 sync:1];

                        v55 = v113;
                      }
                    }
                  }
                  id v68 = [v116 countByEnumeratingWithState:&v118 objects:v136 count:16];
                }
                while (v68);
              }

              uint64_t v86 = [v55 objectAtIndexedSubscript:v51];
              id v6 = v106;
              id v52 = v55;
              if (v86)
              {
                v87 = (void *)v86;
                v88 = [v55 objectAtIndexedSubscript:v51];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  v90 = sub_10006CA04("CloudPairing");
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                  {
                    v91 = [v113 objectAtIndexedSubscript:v51];
                    *(_DWORD *)id buf = 138412290;
                    *(void *)v139 = v91;
                    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Tell btd to remove this device: %@", buf, 0xCu);
                  }
                  uint64_t v53 = +[CloudXPCService sharedInstance];
                  CFStringRef v134 = @"kCloudDeviceUniqueID";
                  v93 = [v113 objectAtIndexedSubscript:v51];
                  v135 = v93;
                  v92 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
                  [v53 sendCloudKitMsg:@"RemoveCloudPairedDevice" args:v92];

LABEL_77:
                  id v52 = v113;
                }
              }
            }

            ++v51;
          }
          while (v51 < (unint64_t)[v52 count]);
        }
        id v96 = [v6 count];
        id v7 = v103;
        if (v96 != [obj count])
        {
          uint64_t v97 = [(CBIDSManager *)v117 account];
          if (v97)
          {
            v98 = (void *)v97;
            v99 = [(CBIDSManager *)v117 account];
            unsigned int v100 = [v99 isActive];

            if (v100)
            {
              v101 = [(CBIDSManager *)v117 _statedumpAndRecordDailyMetric];
              if (IsAppleInternalBuild())
              {
                v102 = sub_10006CA04("CloudPairing");
                if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)id buf = 138412290;
                  *(void *)v139 = v101;
                  _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                }
              }
              goto LABEL_88;
            }
          }
        }
        goto LABEL_89;
      }
    }
  }
  v101 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
    sub_1001B575C();
  }
LABEL_88:

LABEL_89:
}

- (void)updateActiveAccount:(id)a3
{
  id v4 = a3;
  id v5 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 description];
    *(_DWORD *)id buf = 136315394;
    id v45 = [v6 UTF8String];
    __int16 v46 = 2048;
    id v47 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - updateActiveAccount - %s, count %lu", buf, 0x16u);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v36;
    v34 = &v40;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v13, "isActive", v34))
        {
          if ([v13 canSend])
          {
            id v14 = [v13 loginID];

            if (v14)
            {
              unsigned int v15 = [(CBIDSManager *)self account];

              if (v13 == v15)
              {
                BOOL v17 = sub_10006CA04("CloudPairing");
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  BOOL v18 = [(CBIDSManager *)self account];
                  id v19 = [v18 loginID];
                  id v20 = [v19 UTF8String];
                  *(_DWORD *)id buf = 136380675;
                  id v45 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Local device is still associated with iCloud account \"%{private}s\"", buf, 0xCu);
                }
                unsigned int v21 = v7;
                goto LABEL_32;
              }
              v16 = v10;
              id v10 = v13;
            }
            else
            {
              v16 = sub_10006CA04("CloudPairing");
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                sub_1001B5790((uint64_t)v39, (uint64_t)v13);
              }
            }
          }
          else
          {
            v16 = sub_10006CA04("CloudPairing");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              sub_1001B57F4((uint64_t)v41, (uint64_t)v13);
            }
          }
        }
        else
        {
          v16 = sub_10006CA04("CloudPairing");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_1001B5858((uint64_t)v42, (uint64_t)v13);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }

  [(CBIDSManager *)self setAccount:v10];
  long long v22 = [(CBIDSManager *)self account];

  unsigned int v21 = sub_10006CA04("CloudPairing");
  BOOL v23 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v23)
    {
      v24 = [(CBIDSManager *)self account];
      id v25 = [v24 loginID];
      id v26 = [v25 UTF8String];
      id v27 = [(CBIDSManager *)self cloudIdentifier];
      id v28 = [v27 UTF8String];
      *(_DWORD *)id buf = 136380931;
      id v45 = v26;
      __int16 v46 = 2080;
      id v47 = v28;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "MUC - Local device is now associated with iCloud account \"%{private}s\" and identifier %s", buf, 0x16u);
    }
  }
  else
  {
    if (v23)
    {
      id v29 = [(CBIDSManager *)self cloudIdentifier];
      id v30 = [v29 UTF8String];
      BOOL v31 = [(CBIDSManager *)self localDeviceRandomAddress];
      *(_DWORD *)id buf = 136315394;
      id v45 = v30;
      __int16 v46 = 2112;
      id v47 = v31;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "MUC - Local device %s is not associated with any iCloud accounts with RSA %@", buf, 0x16u);
    }
    [(CBIDSManager *)self setTotalCloudDeviceCount:0];
    v32 = [(CBIDSManager *)self unpairedIDSCloudIdentifiers];
    [v32 removeAllObjects];

    v33 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
    [v33 removeAllObjects];

    unsigned int v21 = +[NSNotificationCenter defaultCenter];
    [v21 postNotificationName:@"BTTotalIDSDeviceCountChanged" object:0 userInfo:&off_100244598];
  }
LABEL_32:
}

- (unint64_t)keyLength
{
  return 16;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a4;
  id v7 = [a3 iCloudAccount];
  unsigned int v8 = [v7 registrationStatus];

  id v9 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 description];
    id v11 = [v10 UTF8String];
    id v12 = [v6 count];
    uint64_t v13 = _IDSStringFromIDSRegistrationStatus();
    int v14 = 136315906;
    id v15 = v11;
    __int16 v16 = 2048;
    id v17 = v12;
    __int16 v18 = 1024;
    unsigned int v19 = v8;
    __int16 v20 = 2112;
    unsigned int v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MUC - Active service accounts changed - %s, accounts %lu, R: %d, %@", (uint8_t *)&v14, 0x26u);
  }
  [(CBIDSManager *)self updateActiveAccount:v6];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 iCloudAccount];
  int v9 = [v8 registrationStatus];

  id v10 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = _IDSStringFromIDSRegistrationStatus();
    *(_DWORD *)id buf = 134218498;
    v44 = (void *)v9;
    __int16 v45 = 2112;
    __int16 v46 = v11;
    __int16 v47 = 2112;
    id v48 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MUC - devicesChanged, R: %ld, %@ - %@", buf, 0x20u);
  }
  if ([(CBIDSManager *)self totalCloudDeviceCount] >= 1
    && ![v7 count]
    && (v9 > 1 || v9 == -1))
  {
    unsigned int v21 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1001B58BC(self, v9, v21);
    }
  }
  else
  {
    id v12 = [(CBIDSManager *)self cloudIdentifier];

    if (v12
      || (uint64_t v13 = (void *)IDSCopyLocalDeviceUniqueID(),
          [(CBIDSManager *)self setCloudIdentifier:v13],
          v13,
          [(CBIDSManager *)self cloudIdentifier],
          int v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      id v15 = [(CBIDSManager *)self account];
      if (!v15)
      {
        __int16 v16 = [v6 accounts];
        id v17 = [v16 count];

        if (!v17)
        {
LABEL_15:
          id v35 = v6;
          __int16 v20 = +[CloudXPCService sharedInstance];
          [v20 beginTransaction:@"IDSdevicesChanged"];

          unsigned int v21 = [(CBIDSManager *)self filteredDevicesForIDSDevices:v7];
          long long v22 = +[NSMutableArray array];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          BOOL v23 = [(CBIDSManager *)self associatedDevices];
          id v24 = [v23 countByEnumeratingWithState:&v36 objects:v42 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v37;
            do
            {
              id v27 = 0;
              do
              {
                if (*(void *)v37 != v26) {
                  objc_enumerationMutation(v23);
                }
                id v28 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)v27) idsDevice];
                id v29 = [v28 uniqueID];
                [v22 addObject:v29];

                id v27 = (char *)v27 + 1;
              }
              while (v25 != v27);
              id v25 = [v23 countByEnumeratingWithState:&v36 objects:v42 count:16];
            }
            while (v25);
          }

          [(CBIDSManager *)self updateCloudPairings:v22 newDevices:v21];
          [(CBIDSManager *)self setAssociatedDevices:v21];
          id v30 = +[CloudXPCService sharedInstance];
          [v30 endTransaction:@"IDSdevicesChanged"];

          -[CBIDSManager setTotalCloudDeviceCount:](self, "setTotalCloudDeviceCount:", (char *)[v7 count] + 1);
          BOOL v31 = +[NSNotificationCenter defaultCenter];
          if (v7) {
            v32 = v7;
          }
          else {
            v32 = &__NSArray0__struct;
          }
          v40[0] = @"IDSDevices";
          v40[1] = @"TotalIDSDevices";
          v41[0] = v32;
          v33 = +[NSNumber numberWithInteger:[(CBIDSManager *)self totalCloudDeviceCount]];
          v41[1] = v33;
          v34 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
          [v31 postNotificationName:@"BTTotalIDSDeviceCountChanged" object:0 userInfo:v34];

          id v6 = v35;
          goto LABEL_26;
        }
        __int16 v18 = sub_10006CA04("CloudPairing");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v19 = [v6 accounts];
          *(_DWORD *)id buf = 138412290;
          v44 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No account but got devicesChanged, update account status - %@", buf, 0xCu);
        }
        id v15 = [v6 accounts];
        [(CBIDSManager *)self service:v6 activeAccountsChanged:v15];
      }

      goto LABEL_15;
    }
    unsigned int v21 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1001B5988();
    }
  }
LABEL_26:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  id v12 = sub_10006CA04("CloudPairing");
  uint64_t v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      id v19 = [v10 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Message %s sent successfully", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001B59BC();
    }

    int v14 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
    uint64_t v13 = [v14 objectForKey:v10];

    id v15 = [v13 idsDevice];
    __int16 v16 = [(CBIDSManager *)self deviceForIDSDevice:v15 createNew:0];

    [v16 setState:0];
    id v17 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
    [v17 removeObjectForKey:v10];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = +[CloudXPCService sharedInstance];
  [v10 beginTransaction:@"IDSincomingMessage"];

  id v11 = [(CBIDSManager *)self service];
  id v12 = [v11 deviceForFromID:v9];

  if (v12)
  {
    uint64_t v13 = [(CBIDSManager *)self deviceForIDSDevice:v12 createNew:0];
    int v14 = sub_10006CA04("CloudPairing");
    id v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138478083;
        unsigned int v21 = v13;
        __int16 v22 = 2113;
        id v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received message from IDS device %{private}@: %{private}@", (uint8_t *)&v20, 0x16u);
      }

      __int16 v16 = [v8 objectForKeyedSubscript:@"MessageType"];
      unsigned int v17 = [@"CloudPairing" isEqualToString:v16];

      if (v17)
      {
        [(CBIDSManager *)self handleCloudPairingMessage:v8 from:v13];
      }
      else
      {
        id v19 = sub_10006CA04("CloudPairing");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1001B5AF4(v8);
        }
      }
      id v15 = +[CloudXPCService sharedInstance];
      [v15 endTransaction:@"IDSincomingMessage"];
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      sub_1001B5A68(v8);
    }
    goto LABEL_15;
  }
  uint64_t v13 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = [v9 UTF8String];
    id v15 = [v8 description];
    int v20 = 136315394;
    unsigned int v21 = v18;
    __int16 v22 = 2080;
    id v23 = [v15 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to retrieve IDS device from destination \"%s\" - ignoring message %s", (uint8_t *)&v20, 0x16u);
LABEL_15:
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  id v11 = [(CBIDSManager *)self service];
  id v12 = [v11 deviceForFromID:v10];

  uint64_t v13 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
  int v14 = [v13 objectForKey:v9];

  id v15 = [v14 idsDevice];
  __int16 v16 = [(CBIDSManager *)self deviceForIDSDevice:v15 createNew:0];

  unsigned int v17 = [v16 idsDevice];
  int v18 = [v17 uniqueID];
  id v19 = +[NSString stringWithFormat:@"%@-RePairingRequest-%@", v9, v18];

  if ([v16 state] == (id)2)
  {
    [v16 setState:3];
    int v20 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v9 UTF8String];
      id v22 = [v12 uniqueID];
      *(_DWORD *)id buf = 136315394;
      id v31 = v21;
      __int16 v32 = 2080;
      id v33 = [v22 UTF8String];
      id v23 = "Pairing Request Message %s has been delivered to: %s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
    }
  }
  else if ([v16 state] == (id)4)
  {
    [v16 setState:5];
    int v20 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v9 UTF8String];
      id v22 = [v12 uniqueID];
      *(_DWORD *)id buf = 136315394;
      id v31 = v24;
      __int16 v32 = 2080;
      id v33 = [v22 UTF8String];
      id v23 = "Pairing Response Message %s has been delivered to: %s";
      goto LABEL_12;
    }
  }
  else
  {
    int v20 = sub_10006CA04("CloudPairing");
    BOOL v25 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v25)
      {
        id v26 = [v9 UTF8String];
        id v22 = [v12 uniqueID];
        *(_DWORD *)id buf = 136315394;
        id v31 = v26;
        __int16 v32 = 2080;
        id v33 = [v22 UTF8String];
        id v23 = "RePairing Message %s has been delivered to: %s";
        goto LABEL_12;
      }
    }
    else if (v25)
    {
      id v27 = [v9 UTF8String];
      id v22 = [v12 uniqueID];
      *(_DWORD *)id buf = 136315394;
      id v31 = v27;
      __int16 v32 = 2080;
      id v33 = [v22 UTF8String];
      id v23 = "Message %s has been delivered to: %s";
      goto LABEL_12;
    }
  }

  id v28 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
  [v28 removeObjectForKey:v9];

  id v29 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
  [v29 removeObjectForKey:v19];
}

- (id)filteredDevicesForIDSDevices:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(CBIDSManager *)self account];
    id v8 = [v7 loginID];
    id v9 = [v8 UTF8String];
    id v10 = [(CBIDSManager *)self cloudIdentifier];
    *(_DWORD *)id buf = 136380931;
    id v27 = v9;
    __int16 v28 = 2080;
    *(void *)id v29 = [v10 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Local device is associated with iCloud account \"%{private}s\" and identifier %s", buf, 0x16u);
  }
  id v12 = (void *)MGCopyAnswer();
  unsigned int v13 = [v12 isEqualToString:@"iPhone"];
  unsigned int v14 = [v12 isEqualToString:@"Watch"];
  id v15 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412802;
    id v27 = v12;
    __int16 v28 = 1024;
    *(_DWORD *)id v29 = v13;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Local device is %@ isLocalDevicePhone=%d isLocalDeviceWatch=%d", buf, 0x18u);
  }

  __int16 v16 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = [(CBIDSManager *)self CPAddressMapping];
    *(_DWORD *)id buf = 138412290;
    id v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PublicAddressForIDSDevice: current mapping :%@", buf, 0xCu);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  void v22[2] = sub_100060B84;
  v22[3] = &unk_1002347A0;
  v22[4] = self;
  char v24 = v14;
  char v25 = v13;
  id v18 = v5;
  id v23 = v18;
  [v4 enumerateObjectsUsingBlock:v22];
  id v19 = v23;
  id v20 = v18;

  return v20;
}

- (id)deviceForIDSDevice:(id)a3 createNew:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CBIDSManager *)self associatedDevices];

  if (!v7) {
    goto LABEL_3;
  }
  id v8 = [(CBIDSManager *)self associatedDevices];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100061624;
  v18[3] = &unk_1002347C8;
  id v19 = v6;
  id v9 = [v8 indexOfObjectPassingTest:v18];

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v14 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CloudPaired Device found, returning it", v17, 2u);
    }

    id v15 = [(CBIDSManager *)self associatedDevices];
    unsigned int v13 = [v15 objectAtIndexedSubscript:v9];
  }
  else
  {
LABEL_3:
    id v10 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CloudPaired Device not found", v17, 2u);
    }

    id v11 = sub_10006CA04("CloudPairing");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v12)
      {
        *(_WORD *)unsigned int v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New CloudPaired Device created and returned", v17, 2u);
      }

      unsigned int v13 = +[CloudDevice deviceWithIDSDevice:v6];
    }
    else
    {
      if (v12)
      {
        *(_WORD *)unsigned int v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New CloudPaired Device will not be created", v17, 2u);
      }

      unsigned int v13 = 0;
    }
  }

  return v13;
}

- (void)handleCloudPairingMessage:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"Version 3"];

  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:@"Version 3"];
    id v10 = [v9 objectForKeyedSubscript:@"MessageType"];
    if ([@"InitiatorPairingKeys" isEqualToString:v10])
    {
      CFStringRef v11 = @"Version 3";
LABEL_7:
      [(CBIDSManager *)self handleInitiatorPairingKeys:v9 from:v7 forProtocolID:v11];
LABEL_16:

      goto LABEL_17;
    }
    if (![@"ResponderPairingKeys" isEqualToString:v10]) {
      goto LABEL_16;
    }
    CFStringRef v13 = @"Version 3";
    goto LABEL_15;
  }
  BOOL v12 = [v6 objectForKey:@"Version 2"];

  if (v12)
  {
    id v9 = [v6 objectForKeyedSubscript:@"Version 2"];
    id v10 = [v9 objectForKeyedSubscript:@"MessageType"];
    if ([@"InitiatorPairingKeys" isEqualToString:v10])
    {
      CFStringRef v11 = @"Version 2";
      goto LABEL_7;
    }
    if (![@"ResponderPairingKeys" isEqualToString:v10]) {
      goto LABEL_16;
    }
    CFStringRef v13 = @"Version 2";
LABEL_15:
    [(CBIDSManager *)self handleResponderPairingKeys:v9 from:v7 forProtocolID:v13];
    goto LABEL_16;
  }
  unsigned int v14 = [v6 objectForKey:@"Version 1"];

  if (v14)
  {
    id v9 = [v6 objectForKeyedSubscript:@"Version 1"];
    id v10 = [v9 objectForKeyedSubscript:@"MessageType"];
    if ([@"SecurityRequest" isEqualToString:v10])
    {
      [(CBIDSManager *)self handleSecurityRequest:v9 from:v7];
    }
    else if ([@"RepairRequest" isEqualToString:v10])
    {
      [(CBIDSManager *)self handleRepairRequest:v9 from:v7];
    }
    else if ([@"PairingRequest" isEqualToString:v10])
    {
      [(CBIDSManager *)self handlePairingRequest:v9 from:v7];
    }
    else if ([@"PairingResponse" isEqualToString:v10])
    {
      [(CBIDSManager *)self handlePairingResponse:v9 from:v7];
    }
    else if ([@"KeyDistribution" isEqualToString:v10])
    {
      [(CBIDSManager *)self handleKeyDistribution:v9 from:v7];
    }
    else if ([@"PairingFailure" isEqualToString:v10])
    {
      [(CBIDSManager *)self handlePairingFailure:v9 from:v7];
    }
    else if ([@"UnpairCommand" isEqualToString:v10])
    {
      [(CBIDSManager *)self handleUnpairCommand:v9 from:v7];
    }
    else if ([@"CloudKitFetch" isEqualToString:v10])
    {
      dispatch_time_t v16 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100061AD0;
      block[3] = &unk_100232710;
      block[4] = self;
      dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      unsigned int v17 = [@"ManateeKeysUpdated" isEqualToString:v10];
      id v18 = sub_10006CA04("CloudPairing");
      id v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "IDS: Manatee keys updated", v20, 2u);
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        sub_1001B5C0C();
      }
    }
    goto LABEL_16;
  }
  id v15 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1001B5B80(v7);
  }

LABEL_17:
}

- (void)handleInitiatorPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5
{
  id v69 = a3;
  id v8 = a4;
  id v68 = a5;
  v70 = v8;
  LOBYTE(a5) = (id)[(CBIDSManager *)self roleWithDevice:v8] == (id)2;
  id v9 = sub_10006CA04("CloudPairing");
  id v10 = v9;
  if (a5)
  {
    CFStringRef v11 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v70 description];
      LODWORD(buf) = 136380675;
      *(void *)((char *)&buf + 4) = [v12 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MUC - Received 'InitiatorPairingKeys' message from IDS device %{private}s", (uint8_t *)&buf, 0xCu);

      CFStringRef v11 = v10;
    }

    CFStringRef v13 = [v70 idsDevice];
    id v67 = [v13 uniqueID];

    unsigned int v14 = +[NSMutableString stringWithCapacity:[v67 length]];
    id v15 = [v67 length];
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_1000627D8;
    v87[3] = &unk_1002347F0;
    id v16 = v14;
    id v88 = v16;
    -[NSObject enumerateSubstringsInRange:options:usingBlock:](v67, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 258, v87);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    unsigned int v17 = [(CBIDSManager *)self cloudDevices];
    id v18 = [v17 countByEnumeratingWithState:&v83 objects:v97 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v84;
      double v20 = 0.0;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v84 != v19) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          id v23 = [v22 objectForKey:v16];

          if (v23)
          {
            char v24 = [v22 objectForKey:v16];
            [v24 floatValue];
            float v26 = v25;

            double v20 = v26;
          }
        }
        id v18 = [v17 countByEnumeratingWithState:&v83 objects:v97 count:16];
      }
      while (v18);

      if (v20 == 0.0)
      {
LABEL_22:
        unsigned int v17 = +[NSMutableDictionary dictionary];
        CFStringRef v65 = +[NSString stringWithFormat:@"%llu", mach_absolute_time()];
        id v33 = [v70 idsDevice];
        v66 = [v33 uniqueID];

        v34 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", [v66 length]);
        id v35 = [v66 length];
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = sub_1000627E4;
        v81[3] = &unk_1002347F0;
        id v36 = v34;
        id v82 = v36;
        [v66 enumerateSubstringsInRange:0 options:v35 usingBlock:v81];
        [v17 setObject:v65 forKey:v36];
        long long v37 = [(CBIDSManager *)self cloudDevices];
        long long v38 = +[NSArray arrayWithArray:v37];

        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v39 = v38;
        id v40 = [v39 countByEnumeratingWithState:&v77 objects:v96 count:16];
        if (v40)
        {
          uint64_t v41 = *(void *)v78;
          do
          {
            for (j = 0; j != v40; j = (char *)j + 1)
            {
              if (*(void *)v78 != v41) {
                objc_enumerationMutation(v39);
              }
              BOOL v43 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
              v44 = [v43 objectForKey:v36];

              if (v44)
              {
                __int16 v45 = [(CBIDSManager *)self cloudDevices];
                [v45 removeObject:v43];
              }
            }
            id v40 = [v39 countByEnumeratingWithState:&v77 objects:v96 count:16];
          }
          while (v40);
        }

        __int16 v46 = [(CBIDSManager *)self cloudDevices];
        [v46 addObject:v17];

        __int16 v47 = [(CBIDSManager *)self cloudDevices];
        +[CBPreferencesManager setuserPreference:@"CloudDevice" value:v47 sync:1];

        id v64 = [objc_alloc((Class)NSArray) initWithObjects:@"PublicKeys", @"IdentityKeys", 0];
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v92 = 0x3032000000;
        v93 = sub_1000627F0;
        v94 = sub_100062800;
        v90[0] = @"ResponderPairingKeys";
        v89[0] = @"MessageType";
        v89[1] = @"DeviceName";
        id v48 = [(CBIDSManager *)self localDeviceName];
        v90[1] = v48;
        v89[2] = @"PublicAddress";
        id v49 = [(CBIDSManager *)self publicAddress];
        v90[2] = v49;
        v89[3] = @"TimeStamp";
        v89[4] = @"EncryptionType";
        v90[3] = v65;
        v90[4] = @"ECDH";
        v89[5] = @"RequestedKeyLength";
        id v50 = +[NSNumber numberWithUnsignedInteger:[(CBIDSManager *)self keyLength]];
        v90[5] = v50;
        v89[6] = @"RequestedKeyType";
        v90[6] = v64;
        unint64_t v51 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:7];
        id v95 = +[NSMutableDictionary dictionaryWithDictionary:v51];

        id v52 = [v69 mutableCopy];
        uint64_t v53 = [(CBIDSManager *)self localDeviceRandomAddress];

        if (v53)
        {
          id v54 = [(CBIDSManager *)self localDeviceRandomAddress];
          [v52 setObject:v54 forKey:@"IDSLocalRandomAddress"];
        }
        if ([v68 isEqualToString:@"Version 3"])
        {
          v55 = [(CBIDSManager *)self localDeviceRandomAddress];

          if (!v55)
          {
            unint64_t v63 = [(CBIDSManager *)self keyLength];
            v72[0] = _NSConcreteStackBlock;
            v72[1] = 3221225472;
            v72[2] = sub_100062990;
            v72[3] = &unk_100234840;
            v75[1] = &buf;
            v72[4] = self;
            id v73 = v70;
            id v74 = v69;
            v75[0] = v68;
            [(CBIDSManager *)self generateKeyDictForTypes:v64 keyLength:v63 forAddress:0 withCompletion:v72];
            uint64_t v60 = &v73;
            long long v61 = &v74;
            long long v62 = (id *)v75;
            goto LABEL_38;
          }
          unint64_t v56 = [(CBIDSManager *)self keyLength];
          uint64_t v57 = [(CBIDSManager *)self localDeviceRandomAddress];
          v58 = (id *)v76;
          v76[0] = _NSConcreteStackBlock;
          v76[1] = 3221225472;
          v76[2] = sub_100062808;
          v76[3] = &unk_100234818;
          v76[9] = &buf;
          v76[4] = self;
          v76[5] = v70;
          v76[6] = v69;
          v76[7] = v52;
          v76[8] = v68;
          [(CBIDSManager *)self generateKeyDictForTypes:v64 keyLength:v56 forAddress:v57 withCompletion:v76];
        }
        else
        {
          unint64_t v59 = [(CBIDSManager *)self keyLength];
          v58 = (id *)v71;
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472;
          v71[2] = sub_100062AE8;
          v71[3] = &unk_100234818;
          v71[9] = &buf;
          v71[4] = self;
          v71[5] = v70;
          v71[6] = v69;
          v71[7] = v52;
          v71[8] = v68;
          [(CBIDSManager *)self generateKeyDictForTypes:v64 keyLength:v59 forAddress:0 withCompletion:v71];
        }
        uint64_t v60 = v58 + 5;
        long long v61 = v58 + 6;
        long long v62 = v58 + 7;

LABEL_38:
        _Block_object_dispose(&buf, 8);

LABEL_39:
        id v31 = v67;
        goto LABEL_40;
      }
      BOOL v27 = (double)[(CBIDSManager *)self timeStamp] - v20 < 0.0;
      unsigned int v17 = sub_10006CA04("CloudPairing");
      BOOL v28 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v27)
      {
        if (v28)
        {
          id v29 = [v70 description];
          id v30 = [v29 UTF8String];
          LODWORD(buf) = 136380675;
          *(void *)((char *)&buf + 4) = v30;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received 'InitiatorPairingKeys' local Timestamp saved is newer than received message: %{private}s", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_39;
      }
      if (v28)
      {
        unint64_t v32 = [(CBIDSManager *)self timeStamp];
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = (double)v32 - v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received 'InitiatorPairingKeys' Time to receive message: %f", (uint8_t *)&buf, 0xCu);
      }
    }

    goto LABEL_22;
  }
  id v31 = v9;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_1001B5CAC(v70, self);
    id v31 = v10;
  }
LABEL_40:
}

- (void)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  CFStringRef v13 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MUC - generateKeyDictForTypes: %@ for local address: %@", buf, 0x16u);
  }

  unsigned int v14 = +[NSNumber numberWithUnsignedInteger:a4];
  id v15 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v10, @"kCloudPairingKeyTypes", v14, @"kCloudPairingKeyLength", 0];

  if (v11) {
    [v15 setObject:v11 forKeyedSubscript:@"kLocalRandomAddress"];
  }
  id v16 = +[CloudXPCService sharedInstance];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100062E34;
  v18[3] = &unk_100234868;
  void v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 sendCloudKitMsg:@"GenerateCloudPairingKeys" args:v15 withReply:v18];
}

- (void)cloudPairingCompletedWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6
{
  id v9 = a5;
  if (a4) {
    id v10 = a4;
  }
  else {
    id v10 = &__NSDictionary0__struct;
  }
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  unsigned int v14 = [v9 idsDevice];
  uint64_t v15 = [v14 uniqueID];
  id v16 = (void *)v15;
  if (v15) {
    id v17 = (void *)v15;
  }
  else {
    id v17 = &__NSDictionary0__struct;
  }
  id v18 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v13, @"kCloudPairingCompleteResponse", v10, @"kCloudPairingLocalKeys", v17, @"kCloudDeviceUniqueID", v11, @"kCloudPairingProtocolID", 0];

  id v19 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138477827;
    float v26 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending args for cloudPairingCompletedWithResponse: %{private}@", buf, 0xCu);
  }

  double v20 = +[CloudXPCService sharedInstance];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100063268;
  v23[3] = &unk_100234890;
  v23[4] = self;
  id v24 = v9;
  id v21 = v9;
  [v20 sendCloudKitMsg:@"CloudPairingComplete" args:v18 withReply:v23];
}

- (unint64_t)roleWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(CBIDSManager *)self cloudIdentifier];

  if (!v5)
  {
    id v12 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001B5EE0(v4);
    }
    goto LABEL_11;
  }
  id v6 = [v4 idsDevice];
  id v7 = [v6 uniqueID];

  if (!v7)
  {
    id v12 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001B5F6C(v4);
    }
LABEL_11:

    unint64_t v11 = 0;
    goto LABEL_12;
  }
  id v8 = [(CBIDSManager *)self cloudIdentifier];
  id v9 = [v4 idsDevice];
  id v10 = [v9 uniqueID];
  if ([v8 compare:v10] == (id)1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = 2;
  }

LABEL_12:
  return v11;
}

- (void)handleResponderPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(CBIDSManager *)self roleWithDevice:v9];
  id v12 = sub_10006CA04("CloudPairing");
  id v13 = v12;
  if (v11 == 1)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v9 description];
      int v18 = 136380675;
      id v19 = [v14 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received 'ResponderPairingKeys' message from IDS device %{private}s", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v15 = [v9 idsDevice];
    [(CBIDSManager *)self storePublicAddressMapping:v15 message:v8];

    id v16 = [(CBIDSManager *)self localDeviceRandomAddress];

    if (!v16)
    {
      [(CBIDSManager *)self cloudPairingCompletedWithResponse:v8 localKeys:0 from:v9 forProtocolID:v10];
      goto LABEL_9;
    }
    id v13 = [v8 mutableCopy];
    id v17 = [(CBIDSManager *)self localDeviceRandomAddress];
    [v13 setObject:v17 forKey:@"IDSLocalRandomAddress"];

    [(CBIDSManager *)self cloudPairingCompletedWithResponse:v13 localKeys:0 from:v9 forProtocolID:v10];
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_1001B5FF8();
  }

LABEL_9:
}

- (void)handleSecurityRequest:(id)a3 from:(id)a4
{
  id v5 = a4;
  if ((id)[(CBIDSManager *)self roleWithDevice:v5] == (id)1)
  {
    if ([v5 state] && objc_msgSend(v5, "state") != (id)6)
    {
      unint64_t v11 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v5 description];
        id v13 = [v12 UTF8String];
        id v14 = [v5 stateString];
        int v15 = 136380931;
        id v16 = v13;
        __int16 v17 = 2080;
        id v18 = [v14 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dropping 'security request' message from IDS device %{private}s as our state is '%s'", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      id v6 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v5 description];
        id v8 = [v7 UTF8String];
        id v9 = [v5 stateString];
        int v15 = 136380931;
        id v16 = v8;
        __int16 v17 = 2080;
        id v18 = [v9 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received 'security request' message from IDS device %{private}s with current state is '%s'", (uint8_t *)&v15, 0x16u);
      }
      [(CBIDSManager *)self initiatePairing:v5];
    }
  }
  else
  {
    id v10 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001B60A8();
    }
  }
}

- (void)handleRepairRequest:(id)a3 from:(id)a4
{
  id v5 = a4;
  id v6 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 description];
    int v8 = 136380675;
    id v9 = [v7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received 'Repair request' message from IDS device %{private}s", (uint8_t *)&v8, 0xCu);
  }
  [(CBIDSManager *)self initiatePairing:v5];
}

- (void)handlePairingRequest:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CBIDSManager *)self validateMessage:v6 from:v7])
  {
    if ((id)[(CBIDSManager *)self roleWithDevice:v7] == (id)2)
    {
      if ([v7 state] && objc_msgSend(v7, "state") != (id)1)
      {
        id v14 = sub_10006CA04("CloudPairing");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v7 description];
          id v16 = [v15 UTF8String];
          id v17 = [v7 stateString];
          *(_DWORD *)long long buf = 136380931;
          id v22 = v16;
          __int16 v23 = 2080;
          id v24 = [v17 UTF8String];
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Dropping 'pairing request' message from IDS device %{private}s as our state is '%s'", buf, 0x16u);
        }
      }
      else
      {
        int v8 = sub_10006CA04("CloudPairing");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [v7 description];
          *(_DWORD *)long long buf = 136380675;
          id v22 = [v9 UTF8String];
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received 'pairing request' message from IDS device %{private}s", buf, 0xCu);
        }
        id v10 = [v6 objectForKeyedSubscript:@"RequestedKeyType"];
        unint64_t v11 = [v6 objectForKeyedSubscript:@"RequestedKeyLength"];
        id v12 = [v11 unsignedIntegerValue];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10006414C;
        v18[3] = &unk_1002348B8;
        void v18[4] = self;
        id v19 = v6;
        id v20 = v7;
        [(CBIDSManager *)self generateKeyDictForTypes:v10 keyLength:v12 forAddress:0 withCompletion:v18];
      }
    }
    else
    {
      id v13 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001B6158();
      }
    }
  }
}

- (void)handlePairingResponse:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CBIDSManager *)self validateMessage:v6 from:v7])
  {
    if ((id)[(CBIDSManager *)self roleWithDevice:v7] == (id)1)
    {
      if ([v7 state] == (id)2 && objc_msgSend(v7, "state") == (id)3)
      {
        int v8 = sub_10006CA04("CloudPairing");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [v7 description];
          *(_DWORD *)long long buf = 136380675;
          id v23 = [v9 UTF8String];
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received 'pairing response' message from IDS device %{private}s", buf, 0xCu);
        }
        id v10 = [v6 objectForKeyedSubscript:@"RequestedKeys"];
        unint64_t v11 = [v6 objectForKeyedSubscript:@"RequestedKeyType"];
        id v12 = [v6 objectForKeyedSubscript:@"RequestedKeyLength"];
        id v13 = [v12 unsignedIntegerValue];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000645F8;
        v18[3] = &unk_1002348E0;
        void v18[4] = self;
        id v19 = v6;
        id v20 = v10;
        id v21 = v7;
        id v14 = v10;
        [(CBIDSManager *)self generateKeyDictForTypes:v11 keyLength:v13 forAddress:0 withCompletion:v18];
      }
      else
      {
        id v14 = sub_10006CA04("CloudPairing");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v7 description];
          id v16 = [v15 UTF8String];
          id v17 = [v7 stateString];
          *(_DWORD *)long long buf = 136380931;
          id v23 = v16;
          __int16 v24 = 2080;
          id v25 = [v17 UTF8String];
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Dropping 'pairing response' message from IDS device %{private}s as our state is '%s'", buf, 0x16u);
        }
      }
    }
    else
    {
      id v14 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001B6208();
      }
    }
  }
}

- (void)handleKeyDistribution:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CBIDSManager *)self validateMessage:v6 from:v7])
  {
    if ([v7 state] != (id)4 || objc_msgSend(v7, "state") != (id)5)
    {
      id v19 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v7 description];
        id v21 = [v20 UTF8String];
        id v22 = [v7 stateString];
        *(_DWORD *)long long buf = 136380931;
        id v27 = v21;
        __int16 v28 = 2080;
        id v29 = [v22 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Dropping 'key distribution' message from IDS device %{private}s as our state is '%s'", buf, 0x16u);
      }
      goto LABEL_14;
    }
    int v8 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 description];
      *(_DWORD *)long long buf = 136380675;
      id v27 = [v9 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received 'key distribution' message from IDS device %{private}s", buf, 0xCu);
    }
    id v10 = [v6 objectForKeyedSubscript:@"LocalKeys"];
    unint64_t v11 = [v10 objectForKeyedSubscript:@"LTKLength"];
    id v12 = [v11 unsignedIntegerValue];
    unint64_t v13 = [(CBIDSManager *)self keyLength];

    if (v12 == (id)v13)
    {
      id v14 = [v6 objectForKeyedSubscript:@"RequestedKeys"];
      id v15 = [v14 objectForKeyedSubscript:@"LTKLength"];
      id v16 = [v15 unsignedIntegerValue];
      unint64_t v17 = [(CBIDSManager *)self keyLength];

      if (v16 == (id)v17)
      {
        id v18 = [v6 objectForKeyedSubscript:@"LocalKeys"];
        [(CBIDSManager *)self cloudPairingCompletedWithResponse:v6 localKeys:v18 from:v7 forProtocolID:@"Version 1"];

        id v19 = [v7 idsDevice];
        [(CBIDSManager *)self storePublicAddressMapping:v19 message:v6];
LABEL_14:

        goto LABEL_15;
      }
      id v19 = [v7 idsDevice];
      id v23 = [v6 objectForKeyedSubscript:@"RequestedKeys"];
      __int16 v24 = [v23 objectForKeyedSubscript:@"LTKLength"];
      +[NSString stringWithFormat:@"Invalid requested key length (%@)", v24];
    }
    else
    {
      id v19 = [v7 idsDevice];
      id v23 = [v6 objectForKeyedSubscript:@"LocalKeys"];
      __int16 v24 = [v23 objectForKeyedSubscript:@"LTKLength"];
      +[NSString stringWithFormat:@"Invalid local key length (%@)", v24];
    id v25 = };
    [(CBIDSManager *)self sendErrorMessageToDevice:v19 reason:v25];

    goto LABEL_14;
  }
LABEL_15:
}

- (void)handlePairingFailure:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001B62B8();
  }
}

- (void)initiatePairingAgainIfNoAckReceived:(id)a3 attempt:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(CBIDSManager *)self roleWithDevice:v6];
  if (v7)
  {
    unint64_t v8 = v7;
    id v9 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
    id v10 = [v6 idsDevice];
    unint64_t v11 = [v10 uniqueID];
    id v12 = [v9 objectForKey:v11];

    unint64_t v13 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
    id v14 = [v6 idsDevice];
    id v15 = [v14 uniqueID];
    [v13 setObject:v6 forKey:v15];

    if (v12)
    {
      id v22 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v23 = a4 - 1;
        if (v8 == 1) {
          __int16 v24 = "pairing";
        }
        else {
          __int16 v24 = "security";
        }
        id v25 = [v6 description];
        *(_DWORD *)long long buf = 134218499;
        unint64_t v33 = v23;
        __int16 v34 = 2080;
        unint64_t v35 = (unint64_t)v24;
        __int16 v36 = 2081;
        long long v37 = (const char *)[v25 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "MUC - Dropping delay sending again attempt (%lu) '%s request' message to IDS device %{private}s", buf, 0x20u);
      }
    }
    else
    {
      double v16 = (double)arc4random_uniform(0xB4u) + 60.0;
      unint64_t v17 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (v8 == 1) {
          id v18 = "pairing";
        }
        else {
          id v18 = "security";
        }
        id v19 = [v6 description];
        *(_DWORD *)long long buf = 134218755;
        unint64_t v33 = (unint64_t)v16;
        __int16 v34 = 2048;
        unint64_t v35 = a4;
        __int16 v36 = 2080;
        long long v37 = v18;
        __int16 v38 = 2081;
        id v39 = [v19 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MUC - Delaying (%lu) seconds to send (%lu) attempt '%s request' message to IDS device %{private}s", buf, 0x2Au);
      }
      dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v16 * (double)a4 * 1000000000.0));
      id v21 = [(CBIDSManager *)self cloudPairingQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100064F90;
      block[3] = &unk_100234930;
      double v29 = v16;
      unint64_t v30 = a4;
      unint64_t v31 = v8;
      id v27 = v6;
      __int16 v28 = self;
      dispatch_after(v20, v21, block);

      id v22 = v27;
    }
  }
  else
  {
    id v12 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001B6374(v6);
    }
  }
}

- (void)initiatePairing:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CBIDSManager *)self roleWithDevice:v4];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v43 = +[NSString stringWithFormat:@"%llu", mach_absolute_time()];
    unint64_t v7 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6 == 1) {
        unint64_t v8 = "pairing";
      }
      else {
        unint64_t v8 = "security";
      }
      id v9 = [v4 description];
      *(_DWORD *)long long buf = 136315395;
      id v64 = v8;
      __int16 v65 = 2081;
      id v66 = [v9 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MUC - Sending '%s request' message to IDS device %{private}s", buf, 0x16u);
    }
    __int16 v45 = +[NSMutableDictionary dictionary];
    CFStringRef v10 = @"SecurityRequest";
    if (v6 == 1) {
      CFStringRef v10 = @"PairingRequest";
    }
    v62[0] = v10;
    v61[0] = @"MessageType";
    v61[1] = @"DeviceName";
    unint64_t v11 = [(CBIDSManager *)self localDeviceName];
    v62[1] = v11;
    v61[2] = @"PublicAddress";
    id v12 = [(CBIDSManager *)self publicAddress];
    v62[2] = v12;
    v62[3] = @"Basic";
    v61[3] = @"EncryptionType";
    v61[4] = @"RequestedKeyType";
    unint64_t v13 = [(CBIDSManager *)self requestedKeyTypes];
    v62[4] = v13;
    v61[5] = @"RequestedKeyLength";
    id v14 = +[NSNumber numberWithUnsignedInteger:[(CBIDSManager *)self keyLength]];
    v62[5] = v14;
    v42 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:6];

    [v45 setObject:v42 forKey:@"Version 1"];
    v44 = +[NSMutableDictionary dictionary];
    id v15 = [v4 idsDevice];
    double v16 = [v15 uniqueID];

    [v44 setObject:v43 forKey:v16];
    id v17 = objc_alloc((Class)NSMutableArray);
    id v18 = [(CBIDSManager *)self cloudDevices];
    id v19 = [v17 initWithArray:v18];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v55;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v55 != v22) {
            objc_enumerationMutation(v20);
          }
          __int16 v24 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          id v25 = [v24 objectForKey:v16];

          if (v25)
          {
            float v26 = [(CBIDSManager *)self cloudDevices];
            [v26 removeObject:v24];
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v21);
    }

    id v27 = [(CBIDSManager *)self cloudDevices];
    [v27 addObject:v44];

    __int16 v28 = [(CBIDSManager *)self cloudDevices];
    +[CBPreferencesManager setuserPreference:@"CloudDevice" value:v28 sync:1];

    if (v6 == 1)
    {
      double v29 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "CloudPairingRoleInitator starting", buf, 2u);
      }

      id v30 = [objc_alloc((Class)NSArray) initWithObjects:@"PublicKeys", @"IdentityKeys", nil];
      v59[0] = @"InitiatorPairingKeys";
      v58[0] = @"MessageType";
      v58[1] = @"DeviceName";
      unint64_t v31 = [(CBIDSManager *)self localDeviceName];
      v59[1] = v31;
      v58[2] = @"PublicAddress";
      unint64_t v32 = [(CBIDSManager *)self publicAddress];
      v59[2] = v32;
      v58[3] = @"TimeStamp";
      v58[4] = @"EncryptionType";
      v59[3] = v43;
      v59[4] = @"ECDH";
      v59[5] = v30;
      v58[5] = @"RequestedKeyType";
      v58[6] = @"RequestedKeyLength";
      unint64_t v33 = +[NSNumber numberWithUnsignedInteger:[(CBIDSManager *)self keyLength]];
      v59[6] = v33;
      __int16 v34 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:7];

      objc_initWeak((id *)buf, self);
      unint64_t v35 = [(CBIDSManager *)self localDeviceRandomAddress];

      unint64_t v36 = [(CBIDSManager *)self keyLength];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100065B0C;
      v46[3] = &unk_100234980;
      objc_copyWeak(v52, (id *)buf);
      id v37 = v34;
      id v47 = v37;
      id v38 = v45;
      BOOL v53 = v35 != 0;
      id v48 = v38;
      id v49 = self;
      id v50 = v4;
      v52[1] = (id)1;
      id v39 = v30;
      id v51 = v39;
      [(CBIDSManager *)self generateKeyDictForTypes:v39 keyLength:v36 forAddress:0 withCompletion:v46];

      objc_destroyWeak(v52);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [v45 setObject:@"CloudPairing" forKey:@"MessageType"];
      [(CBIDSManager *)self sendInitialPairingIDSMessage:v45 forDevice:v4 withRole:v6];
    }

    uint64_t v41 = (void *)v43;
  }
  else
  {
    id v40 = sub_10006CA04("CloudPairing");
    uint64_t v41 = v40;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      sub_1001B6400(v4);
      uint64_t v41 = v40;
    }
  }
}

- (void)sendInitialPairingIDSMessage:(id)a3 forDevice:(id)a4 withRole:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v11 = [v9 idsDevice];
  id v12 = (void *)IDSCopyForDevice();

  unint64_t v13 = sub_10006CA04("CloudPairing");
  id v14 = v13;
  if (v12)
  {
    unint64_t v29 = a5;
    id v30 = v10;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 141558787;
      uint64_t v37 = 1752392040;
      __int16 v38 = 2113;
      id v39 = v9;
      __int16 v40 = 2160;
      uint64_t v41 = 1752392040;
      __int16 v42 = 2113;
      id v43 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Attempting to send message to %{private, mask.hash}@ : %{private, mask.hash}@", buf, 0x2Au);
    }

    id v15 = [v8 objectForKeyedSubscript:@"MessageType"];
    uint64_t v16 = [v9 idsDevice];
    id v17 = [(id)v16 uniqueID];
    id v18 = +[NSString stringWithFormat:@"Initial-%@-%@", v15, v17];

    id v19 = [(CBIDSManager *)self service];
    id v20 = +[NSMutableSet setWithObject:v12];
    v34[0] = IDSSendMessageOptionTimeoutKey;
    v34[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
    v35[0] = &off_100244928;
    v35[1] = &__kCFBooleanTrue;
    v34[2] = IDSSendMessageOptionQueueOneIdentifierKey;
    v35[2] = v18;
    id v21 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
    id v32 = 0;
    id v33 = 0;
    LOBYTE(v16) = [v19 sendMessage:v8 fromAccount:0 toDestinations:v20 priority:300 options:v21 identifier:&v33 error:&v32];
    id v14 = v33;
    id v31 = v32;

    uint64_t v22 = sub_10006CA04("CloudPairing");
    unint64_t v23 = v22;
    if (v16)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v14 UTF8String];
        *(_DWORD *)long long buf = 136315138;
        uint64_t v37 = (uint64_t)v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Successfully sent message %s", buf, 0xCu);
      }

      if (v29 == 1) {
        uint64_t v25 = 2;
      }
      else {
        uint64_t v25 = 1;
      }
      [v9 setState:v25];
      unint64_t v23 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
      [v23 setObject:v9 forKey:v14];
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      sub_1001B6578(v31);
    }
    CFStringRef v10 = v30;

    float v26 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
    id v27 = [v9 idsDevice];
    __int16 v28 = [v27 uniqueID];
    [v26 removeObjectForKey:v28];
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_1001B6490(v9, v8, v14);
  }
}

- (void)sendRePairRequest:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CBIDSManager *)self cloudPairingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066464;
  block[3] = &unk_100232B98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_sendRePairRequest:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v42 = a4;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v7 = v6;
  id v38 = [v7 countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v38)
  {
    uint64_t v8 = *(void *)v55;
    __int16 v40 = v7;
    uint64_t v37 = *(void *)v55;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v39 = v9;
        uint64_t v10 = *(void *)(*((void *)&v54 + 1) + 8 * v9);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        unint64_t v11 = [(CBIDSManager *)self service];
        id v12 = [v11 devices];

        id obj = v12;
        id v13 = [v12 countByEnumeratingWithState:&v50 objects:v64 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v51;
          while (2)
          {
            uint64_t v16 = 0;
            id v41 = v14;
            do
            {
              if (*(void *)v51 != v15) {
                objc_enumerationMutation(obj);
              }
              id v17 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v16);
              id v18 = sub_10006CA04("CloudPairing");
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = [v17 nsuuid];
                *(_DWORD *)long long buf = 138412546;
                unint64_t v61 = (unint64_t)v19;
                __int16 v62 = 2112;
                uint64_t v63 = v10;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "cloudpaird: sendRePairRequest: BTUUID: %@ peerUUID %@", buf, 0x16u);
              }
              id v20 = [v17 uniqueID];
              unsigned int v21 = [v20 isEqualToString:v10];

              if (v21)
              {
                uint64_t v22 = sub_10006CA04("CloudPairing");
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  unint64_t v23 = [v17 uniqueID];
                  *(_DWORD *)long long buf = 138412290;
                  unint64_t v61 = (unint64_t)v23;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "cloudpaird: sendRePairRequest: IDS to repair is a valid device %@", buf, 0xCu);
                }
                id v24 = [(CBIDSManager *)self deviceForIDSDevice:v17 createNew:0];
                uint64_t v25 = v24;
                if (v24)
                {
                  [v24 setState:0];
                }
                else
                {
                  float v26 = sub_10006CA04("CloudPairing");
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                    sub_1001B6604(&v48, v49, v26);
                  }
                }
                id v27 = +[NSString stringWithFormat:@"RePairingRequest-%@", v10];
                __int16 v28 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
                v47[0] = _NSConcreteStackBlock;
                v47[1] = 3221225472;
                v47[2] = sub_100066A78;
                v47[3] = &unk_1002349A8;
                v47[4] = v27;
                unint64_t v29 = [v28 keysOfEntriesPassingTest:v47];

                id v30 = [v29 count];
                if (v30)
                {
                  double v31 = (double)arc4random_uniform(0xB4u) + 60.0;
                  id v32 = sub_10006CA04("CloudPairing");
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 134218242;
                    unint64_t v61 = (unint64_t)v31;
                    __int16 v62 = 2112;
                    uint64_t v63 = v10;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Deferring (%lu) seconds sendRePairRequest: %@ as we already sent one", buf, 0x16u);
                  }

                  dispatch_time_t v33 = dispatch_time(0, (uint64_t)(v31 * 1000000000.0));
                  __int16 v34 = [(CBIDSManager *)self cloudPairingQueue];
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472;
                  block[2] = sub_100066A84;
                  block[3] = &unk_1002349D0;
                  void block[4] = self;
                  void block[5] = v27;
                  block[6] = v10;
                  id v45 = v25;
                  id v46 = v42;
                  dispatch_after(v33, v34, block);
                }
                else
                {
                  v58[0] = @"MessageType";
                  v58[1] = @"DeviceName";
                  v59[0] = @"RepairRequest";
                  unint64_t v35 = [(CBIDSManager *)self localDeviceName];
                  v59[1] = v35;
                  unint64_t v36 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
                  [(CBIDSManager *)self sendRePairCloudPairingMessage:v36 toDevice:v25 bundleID:v42];
                }
                id v14 = v41;
                if (v30)
                {

                  id v7 = v40;
                  goto LABEL_33;
                }
              }
              uint64_t v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v14 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v39 + 1;
        id v7 = v40;
        uint64_t v8 = v37;
      }
      while ((id)(v39 + 1) != v38);
      id v38 = [v40 countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v38);
  }
LABEL_33:
}

- (void)sendRePairCloudPairingMessage:(id)a3 toDevice:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a5;
  unint64_t v11 = [(CBIDSManager *)self service];
  id v12 = [v11 accounts];
  id v13 = [v12 count];

  if (v13)
  {
    id v14 = [v9 idsDevice];
    uint64_t v15 = IDSCopyIDForDevice();

    if (!v15)
    {
      uint64_t v25 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1001B6678();
      }
      goto LABEL_17;
    }
    CFStringRef v38 = v10;
    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    [v16 setObject:@"CloudPairing" forKey:@"MessageType"];
    id v37 = v8;
    [v16 setObject:v8 forKey:@"Version 1"];
    id v17 = +[NSNumber numberWithDouble:2592000.0];
    id v18 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v17, IDSSendMessageOptionTimeoutKey, 0);

    id v19 = [v9 idsDevice];
    id v20 = [v19 uniqueID];
    unsigned int v21 = +[NSString stringWithFormat:@"RePairingRequest-%@", v20];

    [v18 setObject:v21 forKey:IDSSendMessageOptionQueueOneIdentifierKey];
    [v18 setObject:&__kCFBooleanTrue forKey:IDSSendMessageOptionWantsClientAcknowledgementKey];
    uint64_t v22 = [(CBIDSManager *)self service];
    unint64_t v23 = +[NSMutableSet setWithObject:v15];
    id v39 = 0;
    id v40 = 0;
    unsigned __int8 v24 = [v22 sendMessage:v16 fromAccount:0 toDestinations:v23 priority:300 options:v18 identifier:&v40 error:&v39];
    uint64_t v25 = v40;
    unint64_t v36 = v39;

    if (v24)
    {
      id v8 = v37;
      if (!v25)
      {
LABEL_16:

        uint64_t v10 = (__CFString *)v38;
LABEL_17:

        goto LABEL_18;
      }
      float v26 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v9 idsDevice];
        __int16 v28 = [v27 name];
        *(_DWORD *)long long buf = 138413058;
        id v44 = v16;
        __int16 v45 = 2112;
        id v46 = v28;
        __int16 v47 = 2112;
        uint8_t v48 = v15;
        __int16 v49 = 2112;
        long long v50 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "cloudpaird: sendRePairCloudPairingMessage: Sending message :%@ to device %@ of account :%@ with GUID :%@", buf, 0x2Au);

        id v8 = v37;
      }

      unint64_t v29 = +[NSString stringWithFormat:@"%@-%@", v25, v21];
      id v30 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
      [v30 setObject:v9 forKey:v29];

      v41[0] = @"MessageType";
      double v31 = [v8 objectForKeyedSubscript:];
      v41[1] = @"BundleID";
      v42[0] = v31;
      CFStringRef v32 = @"Unknown";
      if (v38) {
        CFStringRef v32 = v38;
      }
      v42[1] = v32;
      dispatch_time_t v33 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
      CUMetricsLog();
    }
    else
    {
      unint64_t v29 = sub_10006CA04("CloudPairing");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = [v9 idsDevice];
        unint64_t v35 = [v34 name];
        *(_DWORD *)long long buf = 138413058;
        id v44 = v16;
        __int16 v45 = 2112;
        id v46 = v35;
        __int16 v47 = 2112;
        uint8_t v48 = v15;
        __int16 v49 = 2112;
        long long v50 = v36;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "cloudpaird: sendRePairCloudPairingMessage: Sending message failed  :%@ to device %@ of account :%@ with error %@", buf, 0x2Au);
      }
      id v8 = v37;
    }

    goto LABEL_16;
  }
  uint64_t v15 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1001B6644();
  }
LABEL_18:
}

- (void)sendCloudPairingResponseMessage:(id)a3 toDevice:(id)a4 version:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v11 = (void *)IDSCopyForDevice();
  id v12 = sub_10006CA04("CloudPairing");
  id v13 = v12;
  if (v11)
  {
    id v43 = v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 cpDescription];
      id v15 = [v14 UTF8String];
      id v16 = [v7 description];
      *(_DWORD *)long long buf = 136380931;
      id v57 = v15;
      __int16 v58 = 2080;
      id v59 = [v16 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sending message to IDS device %{private}s: %s", buf, 0x16u);
    }
    id v44 = v9;
    if ([v9 isEqualToString:@"Version 1"])
    {
      v54[0] = @"MessageType";
      v54[1] = @"Version 1";
      v55[0] = @"CloudPairing";
      v55[1] = v7;
      id v17 = v55;
      id v18 = v54;
    }
    else if ([v9 isEqualToString:@"Version 2"])
    {
      v52[0] = @"MessageType";
      v52[1] = @"Version 2";
      v53[0] = @"CloudPairing";
      v53[1] = v7;
      id v17 = v53;
      id v18 = v52;
    }
    else
    {
      if (![v9 isEqualToString:@"Version 3"])
      {
        uint64_t v19 = 0;
LABEL_13:
        id v20 = [v7 objectForKeyedSubscript:@"MessageType"];
        unsigned int v21 = [v8 uniqueID];
        uint64_t v22 = +[NSString stringWithFormat:@"%@-%@", v20, v21];

        unint64_t v23 = [(CBIDSManager *)self service];
        unsigned __int8 v24 = +[NSMutableSet setWithObject:v11];
        v48[0] = IDSSendMessageOptionTimeoutKey;
        v48[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
        v49[0] = &off_100244928;
        v49[1] = &__kCFBooleanTrue;
        v48[2] = IDSSendMessageOptionQueueOneIdentifierKey;
        id v41 = (void *)v22;
        v49[2] = v22;
        uint64_t v25 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
        id v46 = 0;
        id v47 = 0;
        id v42 = (void *)v19;
        unsigned __int8 v26 = [v23 sendMessage:v19 fromAccount:0 toDestinations:v24 priority:300 options:v25 identifier:&v47 error:&v46];
        id v13 = v47;
        id v27 = v46;

        __int16 v28 = sub_10006CA04("CloudPairing");
        unint64_t v29 = v28;
        if ((v26 & 1) == 0)
        {
          dispatch_time_t v33 = v27;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_1001B6578(v27);
          }
          goto LABEL_24;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = [v13 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          id v57 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Successfully sent message %s", buf, 0xCu);
        }

        unint64_t v29 = [(CBIDSManager *)self deviceForIDSDevice:v8 createNew:0];
        double v31 = [v7 objectForKeyedSubscript:@"MessageType"];
        if (([@"ResponderPairingKeys" isEqualToString:v31] & 1) == 0)
        {
          CFStringRef v32 = [v7 objectForKeyedSubscript:@"MessageType"];
          if (![@"PairingResponse" isEqualToString:v32])
          {
            dispatch_time_t v33 = v27;
            id v39 = [v7 objectForKeyedSubscript:@"MessageType"];
            unsigned __int8 v40 = [@"KeyDistribution" isEqualToString:v39];

            if ((v40 & 1) == 0)
            {
LABEL_24:
              uint64_t v10 = v43;
              id v9 = v44;

              goto LABEL_25;
            }
LABEL_20:
            __int16 v34 = [v29 idsDevice];
            unint64_t v35 = [v34 uniqueID];
            unint64_t v36 = [v8 uniqueID];
            unsigned int v37 = [v35 isEqualToString:v36];

            if (v37)
            {
              [v29 setState:4];
              CFStringRef v38 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
              [v38 setObject:v29 forKey:v13];
            }
            goto LABEL_24;
          }
        }
        dispatch_time_t v33 = v27;

        goto LABEL_20;
      }
      v50[0] = @"MessageType";
      v50[1] = @"Version 3";
      v51[0] = @"CloudPairing";
      v51[1] = v7;
      id v17 = v51;
      id v18 = v50;
    }
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v18 count:2];
    goto LABEL_13;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1001B66AC();
  }
LABEL_25:
}

- (void)sendErrorMessageToDevice:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 cpDescription];
    *(_DWORD *)long long buf = 136380931;
    id v14 = [v9 UTF8String];
    __int16 v15 = 2080;
    id v16 = [v7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rejecting pairing attempt from IDS device %{private}s - %s", buf, 0x16u);
  }
  v11[0] = @"MessageType";
  v11[1] = @"FailureReason";
  v12[0] = @"PairingFailure";
  v12[1] = v7;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [(CBIDSManager *)self sendCloudPairingResponseMessage:v10 toDevice:v6 version:@"Version 1"];
}

- (void)handleUnpairCommand:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unpair Cloud Device: %@", buf, 0xCu);
  }

  id v9 = [v6 objectForKeyedSubscript:@"DeviceName"];
  if (![v9 length])
  {
    id v18 = [v7 idsDevice];
    [(CBIDSManager *)self sendErrorMessageToDevice:v18 reason:@"No friendly name specified"];
LABEL_9:

    goto LABEL_13;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"PublicAddress"];
  unint64_t v11 = +[NSString stringWithFormat:@"Public %@", v10];
  unint64_t v12 = sub_10005BF80(v11);

  id v13 = [v6 objectForKeyedSubscript:@"RandomAddress"];
  id v14 = +[NSString stringWithFormat:@"Random %@", v13];
  unint64_t v15 = sub_10005BF80(v14);

  if (!(v12 | v15))
  {
    id v16 = [v6 objectForKeyedSubscript:@"PublicAddress"];
    id v17 = [v6 objectForKeyedSubscript:@"RandomAddress"];
    id v18 = +[NSString stringWithFormat:@"Invalid public address \"%@\" and Invalid random address \"%@\"", v16, v17];

    uint64_t v19 = sub_10006CA04("CloudPairing");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1001B675C();
    }

    id v20 = [v7 idsDevice];
    [(CBIDSManager *)self sendErrorMessageToDevice:v20 reason:v18];

    goto LABEL_9;
  }
  unsigned int v21 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [v7 description];
    id v23 = [v22 UTF8String];
    *(_DWORD *)long long buf = 136380675;
    id v29 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received 'unpair command' message from IDS device %{private}s", buf, 0xCu);
  }
  unsigned __int8 v24 = +[CloudXPCService sharedInstance];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100067BBC;
  v25[3] = &unk_1002348B8;
  v25[4] = self;
  id v26 = v7;
  id v27 = v9;
  [v24 sendCloudKitMsg:@"UnpairCloudDevice" args:v6 withReply:v25];

LABEL_13:
}

- (BOOL)validateMessage:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"MessageType"];
  id v9 = [v6 objectForKeyedSubscript:@"DeviceName"];
  if (![v9 length])
  {
    id v16 = [v7 idsDevice];
    [(CBIDSManager *)self sendErrorMessageToDevice:v16 reason:@"No friendly name specified"];
LABEL_18:

    LOBYTE(v24) = 0;
    goto LABEL_19;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"PublicAddress"];
  unint64_t v11 = +[NSString stringWithFormat:@"Public %@", v10];
  unint64_t v12 = sub_10005BF80(v11);

  if (!v12)
  {
    id v16 = [v7 idsDevice];
    id v17 = [v6 objectForKeyedSubscript:@"PublicAddress"];
    +[NSString stringWithFormat:@"Invalid public address (%@)", v17];
    uint64_t v25 = LABEL_17:;
    [(CBIDSManager *)self sendErrorMessageToDevice:v16 reason:v25];

    goto LABEL_18;
  }
  id v13 = [v6 objectForKeyedSubscript:@"EncryptionType"];
  unsigned __int8 v14 = [v13 isEqualToString:@"Basic"];

  if ((v14 & 1) == 0)
  {
    id v16 = [v7 idsDevice];
    id v17 = [v6 objectForKeyedSubscript:@"EncryptionType"];
    +[NSString stringWithFormat:@"Invalid encryption type (%@)", v17];
    goto LABEL_17;
  }
  unint64_t v15 = [v6 objectForKeyedSubscript:@"RequestedKeyType"];
  if ([v15 containsObject:@"EncryptionKeys"])
  {
  }
  else
  {
    id v18 = [v6 objectForKeyedSubscript:@"RequestedKeyType"];
    unsigned __int8 v19 = [v18 containsObject:@"IdentityKeys"];

    if ((v19 & 1) == 0)
    {
      id v16 = [v7 idsDevice];
      id v17 = [v6 objectForKeyedSubscript:@"RequestedKeyType"];
      +[NSString stringWithFormat:@"Invalid requested keys (%@)", v17];
      goto LABEL_17;
    }
  }
  id v20 = [v6 objectForKeyedSubscript:@"RequestedKeyLength"];
  id v21 = [v20 integerValue];
  unint64_t v22 = [(CBIDSManager *)self keyLength];

  if (v21 != (id)v22)
  {
    id v16 = [v7 idsDevice];
    id v17 = [v6 objectForKeyedSubscript:@"RequestedKeyLength"];
    +[NSString stringWithFormat:@"Invalid requested key length (%@)", v17];
    goto LABEL_17;
  }
  if (([@"PairingResponse" isEqualToString:v8] & 1) == 0
    && ![@"KeyDistribution" isEqualToString:v8]
    || ([(CBIDSManager *)self requestedKeyTypes],
        id v23 = objc_claimAutoreleasedReturnValue(),
        BOOL v24 = [(CBIDSManager *)self validateKeys:v6 requestedTypes:v23 from:v7],
        v23,
        v24))
  {
    LOBYTE(v24) = 1;
  }
LABEL_19:

  return v24;
}

- (BOOL)validateKeys:(id)a3 requestedTypes:(id)a4 from:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a3 objectForKeyedSubscript:@"RequestedKeys"];
  if (![v8 containsObject:@"EncryptionKeys"]) {
    goto LABEL_16;
  }
  CFStringRef v11 = @"LTK";
  uint64_t v12 = [v10 objectForKeyedSubscript:@"LTK"];
  if (!v12) {
    goto LABEL_22;
  }
  id v13 = (void *)v12;
  unsigned __int8 v14 = [v10 objectForKeyedSubscript:@"LTK"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_21:

    goto LABEL_22;
  }
  unint64_t v15 = [v10 objectForKeyedSubscript:@"LTK"];
  id v16 = [v15 length];

  if (v16 != (id)16)
  {
LABEL_22:
    CFStringRef v38 = [v9 idsDevice];
    id v39 = [v10 objectForKeyedSubscript:v11];
    CFStringRef v45 = v11;
    id v46 = v39;
    CFStringRef v40 = @"%@ not specified or invalid (%@)";
LABEL_23:
    id v41 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v45, v46);
    [(CBIDSManager *)self sendErrorMessageToDevice:v38 reason:v41];

    BOOL v37 = 0;
    goto LABEL_24;
  }
  uint64_t v17 = [v10 objectForKeyedSubscript:@"LTKType"];
  if (!v17
    || (id v18 = (void *)v17,
        [v10 objectForKeyedSubscript:@"LTKType"],
        unsigned __int8 v19 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v19,
        v18,
        (isKindOfClass & 1) == 0))
  {
    CFStringRef v38 = [v9 idsDevice];
    uint64_t v43 = [v10 objectForKeyedSubscript:@"LTKType"];
    id v39 = (__CFString *)v43;
    CFStringRef v44 = @"LTK type";
LABEL_27:
    CFStringRef v45 = v44;
    id v46 = (void *)v43;
    CFStringRef v40 = @"%@ not specified or invalid (%@)";
    goto LABEL_23;
  }
  uint64_t v21 = [v10 objectForKeyedSubscript:@"LTKLength"];
  if (!v21
    || (unint64_t v22 = (void *)v21,
        [v10 objectForKeyedSubscript:@"LTKLength"],
        id v23 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v24 = objc_opt_isKindOfClass(),
        v23,
        v22,
        (v24 & 1) == 0))
  {
    CFStringRef v38 = [v9 idsDevice];
    uint64_t v43 = [v10 objectForKeyedSubscript:@"LTKLength"];
    id v39 = (__CFString *)v43;
    CFStringRef v44 = @"LTK length";
    goto LABEL_27;
  }
  uint64_t v25 = [v10 objectForKeyedSubscript:@"LTKLength"];
  id v26 = [v25 unsignedIntegerValue];
  unint64_t v27 = [(CBIDSManager *)self keyLength];

  if (v26 != (id)v27)
  {
    CFStringRef v38 = [v9 idsDevice];
    id v39 = [v10 objectForKeyedSubscript:@"LTKLength"];
    CFStringRef v45 = v39;
    CFStringRef v40 = @"Invalid LTK key length (%@)";
    goto LABEL_23;
  }
  CFStringRef v11 = @"EDIV";
  uint64_t v28 = [v10 objectForKeyedSubscript:@"EDIV"];
  if (!v28) {
    goto LABEL_22;
  }
  id v13 = (void *)v28;
  unsigned __int8 v14 = [v10 objectForKeyedSubscript:@"EDIV"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  id v29 = [v10 objectForKeyedSubscript:@"EDIV"];
  id v30 = [v29 length];

  if (v30 != (id)2) {
    goto LABEL_22;
  }
  CFStringRef v11 = @"RAND";
  uint64_t v31 = [v10 objectForKeyedSubscript:@"RAND"];
  if (!v31) {
    goto LABEL_22;
  }
  id v13 = (void *)v31;
  unsigned __int8 v14 = [v10 objectForKeyedSubscript:@"RAND"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  CFStringRef v32 = [v10 objectForKeyedSubscript:@"RAND"];
  id v33 = [v32 length];

  if (v33 != (id)8) {
    goto LABEL_22;
  }
LABEL_16:
  if ([v8 containsObject:@"IdentityKeys"])
  {
    CFStringRef v11 = @"IRK";
    uint64_t v34 = [v10 objectForKeyedSubscript:@"IRK"];
    if (v34)
    {
      id v13 = (void *)v34;
      unsigned __int8 v14 = [v10 objectForKeyedSubscript:@"IRK"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v35 = [v10 objectForKeyedSubscript:@"IRK"];
        id v36 = [v35 length];

        if (v36 == (id)16) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    goto LABEL_22;
  }
LABEL_20:
  BOOL v37 = 1;
LABEL_24:

  return v37;
}

- (id)statedumpAndRecordDailyMetric
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000627F0;
  CFStringRef v11 = sub_100062800;
  uint64_t v12 = &stru_10023D730;
  dispatch_time_t v3 = [(CBIDSManager *)self cloudPairingQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000687AC;
  v6[3] = &unk_100232B20;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_statedumpAndRecordDailyMetric
{
  uint64_t v123 = 0;
  long long v124 = &v123;
  uint64_t v125 = 0x3032000000;
  v126 = sub_1000627F0;
  id v127 = sub_100062800;
  id v128 = 0;
  id obj = 0;
  NSAppendPrintF_safe();
  objc_storeStrong(&v128, 0);
  id v4 = (id *)(v124 + 5);
  id v121 = (id)v124[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v4, v121);
  id v85 = +[CBPreferencesManager deviceName];
  if (IsAppleInternalBuild())
  {
    unint64_t v5 = (id *)(v124 + 5);
    id v120 = (id)v124[5];
    if (v85) {
      id v6 = (const char *)[v85 UTF8String];
    }
    else {
      id v6 = "none";
    }
    v71 = v6;
    NSAppendPrintF_safe();
    objc_storeStrong(v5, v120);
  }
  uint64_t v7 = (id *)(v124 + 5);
  id v119 = (id)v124[5];
  id v8 = [(CBIDSManager *)self account];
  if (v8)
  {
    if (IsAppleInternalBuild())
    {
      id v2 = [(CBIDSManager *)self account];
      id v3 = [v2 loginID];
      uint64_t v9 = (const char *)[v3 UTF8String];
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
      uint64_t v9 = "<redacted>";
    }
  }
  else
  {
    int v10 = 0;
    uint64_t v9 = "none";
  }
  v72 = v9;
  NSAppendPrintF_safe();
  objc_storeStrong(v7, v119);
  if (v10)
  {
  }
  CFStringRef v11 = (id *)(v124 + 5);
  id v118 = (id)v124[5];
  uint64_t v12 = [(CBIDSManager *)self cloudIdentifier];
  if (v12)
  {
    id v2 = [(CBIDSManager *)self cloudIdentifier];
    id v13 = (const char *)[v2 UTF8String];
  }
  else
  {
    id v13 = "none";
  }
  id v73 = v13;
  NSAppendPrintF_safe();
  objc_storeStrong(v11, v118);
  if (v12) {

  }
  unsigned __int8 v14 = (id *)(v124 + 5);
  id v117 = (id)v124[5];
  unsigned int v15 = [(CBIDSManager *)self supportsVirtualAddress];
  id v16 = "NO";
  if (v15) {
    id v16 = "YES";
  }
  id v74 = v16;
  NSAppendPrintF_safe();
  objc_storeStrong(v14, v117);
  uint64_t v17 = (id *)(v124 + 5);
  id v116 = (id)v124[5];
  id v18 = [(CBIDSManager *)self localDeviceRandomAddress];
  if (v18)
  {
    id v2 = [(CBIDSManager *)self localDeviceRandomAddress];
    unsigned __int8 v19 = (const char *)[v2 UTF8String];
  }
  else
  {
    unsigned __int8 v19 = "none";
  }
  unsigned int v75 = v19;
  NSAppendPrintF_safe();
  objc_storeStrong(v17, v116);
  if (v18) {

  }
  uint64_t v92 = +[NSMutableDictionary dictionary];
  v91 = +[NSMutableDictionary dictionary];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v20 = [(CBIDSManager *)self associatedDevices];
  id v86 = [v20 sortedArrayUsingComparator:&stru_100234A10];

  id v89 = [v86 countByEnumeratingWithState:&v112 objects:v131 count:16];
  if (v89)
  {
    uint64_t v87 = *(void *)v113;
    do
    {
      for (i = 0; i != v89; i = (char *)i + 1)
      {
        if (*(void *)v113 != v87) {
          objc_enumerationMutation(v86);
        }
        uint64_t v21 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        unint64_t v22 = [(CBIDSManager *)self roleWithDevice:v21];
        id v23 = [v21 idsDevice];
        char v24 = [v23 productName];
        v94 = [v92 objectForKeyedSubscript:v24];

        if (!v94)
        {
          v94 = +[NSMutableDictionary dictionary];
        }
        uint64_t v25 = [v23 deviceTypeToString];
        uint64_t v26 = [v94 objectForKeyedSubscript:v25];

        if (v26) {
          unint64_t v27 = (_UNKNOWN **)v26;
        }
        else {
          unint64_t v27 = &off_100244910;
        }
        v90 = v27;
        uint64_t v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v27 intValue] + 1);
        id v29 = [v23 deviceTypeToString];
        [v94 setObject:v28 forKeyedSubscript:v29];

        id v30 = [v23 productName];
        [v92 setObject:v94 forKeyedSubscript:v30];

        uint64_t v31 = [v23 productName];
        CFStringRef v32 = [v91 objectForKeyedSubscript:v31];

        if (!v32)
        {
          CFStringRef v32 = +[NSMutableDictionary dictionary];
        }
        id v33 = [v23 deviceTypeToString];
        uint64_t v34 = [v32 objectForKeyedSubscript:v33];

        uint64_t v111 = v34;
        NSAppendPrintF_safe();
        id v35 = v34;

        id v110 = v35;
        id v36 = [v23 name];
        id v76 = [v36 UTF8String];
        NSAppendPrintF_safe();
        id v37 = v35;

        id v109 = v37;
        [v23 uniqueID:v76];
        id v38 = objc_claimAutoreleasedReturnValue();
        id v77 = [v38 UTF8String];
        NSAppendPrintF_safe();
        id v39 = v37;

        id v108 = v39;
        CFStringRef v40 = [v23 nsuuid:v77];
        long long v78 = [v40 UUIDString];
        NSAppendPrintF_safe();
        id v41 = v39;

        id v107 = v41;
        [v21 isConnected:v78];
        NSAppendPrintF_safe();
        id v42 = v41;

        id v106 = v42;
        uint64_t v43 = "Unknown";
        if (v22 == 2) {
          uint64_t v43 = "Responder";
        }
        if (v22 == 1) {
          uint64_t v43 = "Initiator";
        }
        long long v79 = v43;
        NSAppendPrintF_safe();
        id v44 = v106;

        id v105 = v44;
        CFStringRef v45 = [v21 stateString:v79];
        id v46 = [v45 capitalizedString];
        id v80 = [v46 UTF8String];
        NSAppendPrintF_safe();
        id v47 = v44;

        id v104 = v47;
        [v23 deviceTypeToString:v80];
        id v48 = objc_claimAutoreleasedReturnValue();
        id v49 = [v48 UTF8String];
        id v50 = [v23 productName];
        id v51 = [v50 UTF8String];
        id v52 = [v23 productVersion];
        id v53 = [v52 UTF8String];
        id v54 = [v23 productBuildVersion];
        id v84 = [v54 UTF8String];
        id v81 = v49;
        NSAppendPrintF_safe();
        id v55 = v47;

        long long v56 = [v23 deviceTypeToString:v81, v51, v53, v84];
        [v32 setObject:v55 forKeyedSubscript:v56];

        id v57 = [v23 productName];
        [v91 setObject:v32 forKeyedSubscript:v57];
      }
      id v89 = [v86 countByEnumeratingWithState:&v112 objects:v131 count:16];
    }
    while (v89);
  }

  __int16 v58 = (id *)(v124 + 5);
  id v103 = (id)v124[5];
  id v59 = [(CBIDSManager *)self associatedDevices];
  id v82 = [v59 count];
  NSAppendPrintF_safe();
  objc_storeStrong(v58, v103);

  uint64_t v60 = (id *)(v124 + 5);
  id v102 = (id)v124[5];
  unint64_t v61 = [(CBIDSManager *)self associatedDevices];
  __int16 v62 = [v61 cuFilteredArrayUsingBlock:&stru_100234A50];
  id v83 = [v62 count];
  NSAppendPrintF_safe();
  objc_storeStrong(v60, v102);

  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_100069500;
  v99[3] = &unk_100234AA0;
  id v63 = v91;
  id v100 = v63;
  v101 = &v123;
  [v92 enumerateKeysAndObjectsUsingBlock:v99, v83];
  id v64 = (id *)(v124 + 5);
  id v98 = (id)v124[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v64, v98);
  __int16 v65 = [(CBIDSManager *)self CPAddressMapping];
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_1000697F4;
  v97[3] = &unk_100234AC8;
  v97[4] = &v123;
  [v65 enumerateKeysAndObjectsUsingBlock:v97];

  if (IsAppleInternalBuild())
  {
    id v66 = (id *)(v124 + 5);
    id v96 = (id)v124[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v66, v96);
    id v67 = [(CBIDSManager *)self messageIdentifiersWaitingForAck];
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_100069848;
    v95[3] = &unk_100234AF0;
    v95[4] = &v123;
    [v67 enumerateKeysAndObjectsUsingBlock:v95];
  }
  CFStringRef v129 = @"Stats";
  long long v130 = v92;
  id v68 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
  CUMetricsLog();

  id v69 = (id)v124[5];
  _Block_object_dispose(&v123, 8);

  return v69;
}

- (BOOL)shouldUpgradeToManatee
{
  id v3 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Manatee available, Check for allDevicesJazzKon", buf, 2u);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v4 = [(CBIDSManager *)self service];
  unint64_t v5 = [v4 devices];

  id v6 = [v5 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v6)
  {
    id v8 = v6;
    char v9 = 0;
    uint64_t v10 = *(void *)v45;
    *(void *)&long long v7 = 134218496;
    long long v34 = v7;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v12, "isHSATrusted", v34))
        {
          id v13 = [v12 productName];
          unsigned int v14 = [v13 isEqualToString:@"Apple TVOS"];

          if (v14)
          {
            uint64_t v31 = sub_10006CA04("MagicPairing");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              CFStringRef v32 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has AppleTV";
              goto LABEL_50;
            }
            goto LABEL_51;
          }
          unsigned int v15 = [v12 productName];
          unsigned int v16 = [v15 isEqualToString:@"iPhone OS"];

          if (v16)
          {
            uint64_t v17 = sub_10006CA04("MagicPairing");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              if (v12)
              {
                [v12 operatingSystemVersion];
                id v18 = v43;
                [v12 operatingSystemVersion];
                unsigned __int8 v19 = v42;
                [v12 operatingSystemVersion];
                uint64_t v20 = v41;
              }
              else
              {
                uint64_t v20 = 0;
                unsigned __int8 v19 = 0;
                id v18 = 0;
                uint64_t v43 = 0;
                id v42 = 0;
                uint64_t v41 = 0;
              }
              *(_DWORD *)long long buf = v34;
              id v49 = v18;
              __int16 v50 = 2048;
              id v51 = v19;
              __int16 v52 = 2048;
              uint64_t v53 = v20;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "allDevicesJazzKon: checkManateeZoneUpgrade: account has iOS, majorVersion %ld, minorVersion %ld, patchVersion %ld", buf, 0x20u);
            }

            if (!v12 || ([v12 operatingSystemVersion], v40 <= 12))
            {
              uint64_t v31 = sub_10006CA04("MagicPairing");
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                CFStringRef v32 = "allDevicesJazzKon: iOS checkManateeZoneUpgrade: account not eligible";
                goto LABEL_50;
              }
              goto LABEL_51;
            }
          }
          else
          {
            uint64_t v21 = [v12 modelIdentifier];
            unsigned int v22 = [v21 containsString:@"Mac"];

            if (v22)
            {
              id v23 = sub_10006CA04("MagicPairing");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                if (v12)
                {
                  [v12 operatingSystemVersion];
                  char v24 = v39;
                  [v12 operatingSystemVersion];
                  uint64_t v25 = v38;
                  [v12 operatingSystemVersion];
                  uint64_t v26 = v37;
                }
                else
                {
                  uint64_t v26 = 0;
                  uint64_t v25 = 0;
                  char v24 = 0;
                  id v39 = 0;
                  id v38 = 0;
                  uint64_t v37 = 0;
                }
                *(_DWORD *)long long buf = v34;
                id v49 = v24;
                __int16 v50 = 2048;
                id v51 = v25;
                __int16 v52 = 2048;
                uint64_t v53 = v26;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "allDevicesJazzKon: checkManateeZoneUpgrade: account has macOS, majorVersion %ld, minorVersion %ld, patchVersion %ld", buf, 0x20u);
              }

              if (!v12
                || ([v12 operatingSystemVersion], v36 < 11)
                && ([v12 operatingSystemVersion], v35 <= 14))
              {
                uint64_t v31 = sub_10006CA04("MagicPairing");
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  CFStringRef v32 = "allDevicesJazzKon: macOS checkManateeZoneUpgrade: account not eligible";
LABEL_50:
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
                }
LABEL_51:

                LOBYTE(v31) = 0;
                goto LABEL_52;
              }
            }
          }
          char v9 = 1;
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v44 objects:v54 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v9 = 0;
  }

  unint64_t v27 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      uint64_t v28 = "yes";
    }
    else {
      uint64_t v28 = "no";
    }
    id v29 = +[CloudXPCService sharedInstance];
    if ([v29 manateeZoneUpgraded]) {
      id v30 = "yes";
    }
    else {
      id v30 = "no";
    }
    *(_DWORD *)long long buf = 136315394;
    id v49 = v28;
    __int16 v50 = 2080;
    id v51 = v30;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "allDevicesJazzKon? - %s, current manatee state - %s", buf, 0x16u);
  }
  if (v9)
  {
    unint64_t v5 = +[CloudXPCService sharedInstance];
    LODWORD(v31) = [v5 manateeZoneUpgraded] ^ 1;
LABEL_52:
  }
  else
  {
    LOBYTE(v31) = 0;
  }
  return (char)v31;
}

- (BOOL)isLegacyDevice:(id)a3
{
  id v4 = a3;
  if (v4 && ![(CBIDSManager *)self allDevicesStarSky])
  {
    id v6 = [(CBIDSManager *)self service];
    long long v7 = [v6 devices];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v13 isHSATrusted])
          {
            unsigned int v14 = [v13 name];
            unsigned int v15 = [v14 isEqualToString:v4];

            if (v15)
            {
              unsigned int v16 = [v13 modelIdentifier];
              if ([v16 containsString:@"Mac"])
              {
                uint64_t v17 = &v22;
                if (!v13) {
                  goto LABEL_24;
                }
                [v13 operatingSystemVersion];
                uint64_t v18 = v22;

                if (v18 < 12) {
                  goto LABEL_25;
                }
              }
              else
              {
              }
              unsigned int v16 = [v13 productName];
              if ([v16 isEqualToString:@"iPhone OS"])
              {
                uint64_t v17 = &v21;
                if (!v13)
                {
LABEL_24:
                  uint64_t *v17 = 0;
                  v17[1] = 0;
                  v17[2] = 0;

LABEL_25:
                  BOOL v5 = 1;
                  goto LABEL_26;
                }
                [v13 operatingSystemVersion];
                uint64_t v19 = v21;

                if (v19 < 14) {
                  goto LABEL_25;
                }
              }
              else
              {
              }
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 0;
LABEL_26:
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)allDevicesStarSky
{
  id v2 = [(CBIDSManager *)self service];
  id v3 = [v2 devices];

  id v4 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    id v43 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Check for allDevicesStarSky, count: %lu", buf, 0xCu);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  BOOL v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v39 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
      if (![v10 isHSATrusted]) {
        break;
      }
      uint64_t v11 = [v10 modelIdentifier];
      if ([v11 hasPrefix:@"AppleTV"])
      {
        if (!v10)
        {

LABEL_32:
          uint64_t v18 = sub_10006CA04("CloudPairing");
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_49;
          }
          *(_WORD *)long long buf = 0;
          uint64_t v19 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has AppleTV";
LABEL_34:
          uint64_t v20 = v18;
          uint32_t v21 = 2;
          goto LABEL_48;
        }
        [v10 operatingSystemVersion];

        if (v37 <= 14) {
          goto LABEL_32;
        }
      }
      else
      {
      }
      uint64_t v12 = [v10 modelIdentifier];
      if ([v12 hasPrefix:@"iPhone"])
      {
        if (!v10)
        {

LABEL_36:
          uint64_t v18 = sub_10006CA04("CloudPairing");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            if (v10)
            {
              [v10 operatingSystemVersion];
              uint64_t v22 = v35;
              [v10 operatingSystemVersion];
              uint64_t v23 = v34;
              [v10 operatingSystemVersion];
              uint64_t v24 = v33;
            }
            else
            {
              uint64_t v24 = 0;
              uint64_t v23 = 0;
              uint64_t v22 = 0;
            }
            *(_DWORD *)long long buf = 134218496;
            id v43 = v22;
            __int16 v44 = 2048;
            uint64_t v45 = v23;
            __int16 v46 = 2048;
            uint64_t v47 = v24;
            uint64_t v19 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has iOS, majorVersion %ld, minorVersion %ld, patchVersion %ld";
            goto LABEL_47;
          }
          goto LABEL_49;
        }
        [v10 operatingSystemVersion];

        if (v36 <= 14) {
          goto LABEL_36;
        }
      }
      else
      {
      }
      id v13 = [v10 modelIdentifier];
      if ([v13 containsString:@"Mac"])
      {
        if (!v10)
        {

LABEL_40:
          uint64_t v18 = sub_10006CA04("CloudPairing");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            if (v10)
            {
              [v10 operatingSystemVersion];
              long long v25 = v31;
              [v10 operatingSystemVersion];
              uint64_t v26 = v30;
              [v10 operatingSystemVersion];
              uint64_t v27 = v29;
            }
            else
            {
              uint64_t v27 = 0;
              uint64_t v26 = 0;
              long long v25 = 0;
            }
            *(_DWORD *)long long buf = 134218496;
            id v43 = v25;
            __int16 v44 = 2048;
            uint64_t v45 = v26;
            __int16 v46 = 2048;
            uint64_t v47 = v27;
            uint64_t v19 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has macOS, majorVersion %ld, minorVersion %ld, patchVersion %ld";
LABEL_47:
            uint64_t v20 = v18;
            uint32_t v21 = 32;
LABEL_48:
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
          }
LABEL_49:

          BOOL v17 = 0;
          unsigned int v14 = v5;
          goto LABEL_50;
        }
        [v10 operatingSystemVersion];

        if (v32 <= 11) {
          goto LABEL_40;
        }
      }
      else
      {
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_26;
      }
    }
    uint64_t v18 = sub_10006CA04("MagicPairing");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v19 = "allDevicesStarSky, but not HSA trusted";
    goto LABEL_34;
  }
LABEL_26:

  unsigned int v14 = sub_10006CA04("MagicPairing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = +[MPCloudKit_Manatee sharedInstance];
    unsigned int v16 = [v15 manateeZoneUpgraded];
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v43) = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "allDevicesStarSky, current manatee state - %d", buf, 8u);
  }
  BOOL v17 = 1;
LABEL_50:

  return v17;
}

- (void)storePublicAddressMapping:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = [a4 objectForKey:@"PublicAddress"];
  if (!v7)
  {
    unsigned int v16 = sub_10006CA04("CloudPairing");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v18) = 0;
    BOOL v17 = "cloudpaird: storePublicAddressMapping: Ignoring unpair becasue the address passed in is nil";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 2u);
    goto LABEL_16;
  }
  if (!v6)
  {
    unsigned int v16 = sub_10006CA04("CloudPairing");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v18) = 0;
    BOOL v17 = "cloudpaird: storePublicAddressMapping: Ignoring request becasue the device is nil";
    goto LABEL_15;
  }
  uint64_t v8 = [v6 uniqueID];

  if (!v8)
  {
    unsigned int v16 = sub_10006CA04("CloudPairing");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v18) = 0;
    BOOL v17 = "cloudpaird: storePublicAddressMapping: Device uniqueID is nil so throw this request out";
    goto LABEL_15;
  }
  uint64_t v9 = [(CBIDSManager *)self CPAddressMapping];
  id v10 = [v6 uniqueID];
  uint64_t v11 = [v9 objectForKey:v10];

  uint64_t v12 = [(CBIDSManager *)self CPAddressMapping];
  id v13 = [v6 uniqueID];
  if (v11)
  {
    [v12 removeObjectForKey:v13];

    uint64_t v12 = [(CBIDSManager *)self CPAddressMapping];
    id v13 = [v6 uniqueID];
  }
  [v12 setObject:v7 forKey:v13];

  unsigned int v14 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = [(CBIDSManager *)self CPAddressMapping];
    int v18 = 138412290;
    uint64_t v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "cloudpaird: storePublicAddressMapping: current mapping :%@", (uint8_t *)&v18, 0xCu);
  }
  +[CBPreferencesManager removeuserPreference:@"AddressMapping" sync:1];
  unsigned int v16 = [(CBIDSManager *)self CPAddressMapping];
  +[CBPreferencesManager setuserPreference:@"AddressMapping" value:v16 sync:1];
LABEL_16:
}

- (id)publicAddressForIDSDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001B68E4();
  }

  id v6 = [(CBIDSManager *)self CPAddressMapping];
  id v7 = [v6 count];

  if (!v7)
  {
    uint64_t v8 = +[CBPreferencesManager readUserPreference:@"AddressMapping"];

    if (v8)
    {
      uint64_t v9 = +[CBPreferencesManager readUserPreference:@"AddressMapping"];
      id v10 = [v9 mutableCopy];
      [(CBIDSManager *)self setCPAddressMapping:v10];
    }
  }
  uint64_t v11 = [(CBIDSManager *)self CPAddressMapping];
  uint64_t v12 = [v11 objectForKey:v4];

  if (v12)
  {
    id v13 = [(CBIDSManager *)self CPAddressMapping];
    unsigned int v14 = [v13 objectForKey:v4];
  }
  else
  {
    unsigned int v14 = 0;
  }

  return v14;
}

- (id)_fetchArrayOfCloudDevicesForPeripheral:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CBIDSManager *)self cloudPairingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSMutableArray arrayWithCapacity:2];
  id v7 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Find cloud pairing identifier for peripheral: %@", buf, 0xCu);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [(CBIDSManager *)self associatedDevices];
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v26;
    *(void *)&long long v10 = 138412546;
    long long v24 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        unsigned int v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unsigned int v15 = [v14 idsDevice:v24];
        unsigned int v16 = [v15 nsuuid];
        unsigned int v17 = [v16 isEqual:v4];

        if (v17)
        {
          int v18 = sub_10006CA04("CloudPairing");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [v14 idsDevice];
            uint64_t v20 = [v19 uniqueID];
            *(_DWORD *)long long buf = v24;
            id v30 = v4;
            __int16 v31 = 2112;
            uint64_t v32 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found cloud pairing identifier for peripheral: %@ as %@", buf, 0x16u);
          }
          [v6 addObject:v14];
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v11);
  }

  uint32_t v21 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v30 = v4;
    __int16 v31 = 2112;
    uint64_t v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Cloud Devices for peripheral: %@ - %@", buf, 0x16u);
  }

  id v22 = [v6 copy];

  return v22;
}

- (id)_fetchCloudPairingIdentifierForPeripheral:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CBIDSManager *)self cloudPairingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Find cloud pairing identifier for peripheral: %@", buf, 0xCu);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(CBIDSManager *)self associatedDevices];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 idsDevice];
        unsigned int v14 = [v13 nsuuid];
        unsigned int v15 = [v14 isEqual:v4];

        if (v15)
        {
          unsigned int v17 = sub_10006CA04("CloudPairing");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = [v12 idsDevice];
            uint64_t v19 = [v18 uniqueID];
            *(_DWORD *)long long buf = 138412546;
            id v27 = v4;
            __int16 v28 = 2112;
            uint64_t v29 = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found cloud pairing identifier for peripheral: %@ as %@", buf, 0x16u);
          }
          uint64_t v20 = [v12 idsDevice];
          unsigned int v16 = [v20 uniqueID];

          goto LABEL_17;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v7 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloud pairing identifier FOUND for peripheral: %@", buf, 0xCu);
  }
  unsigned int v16 = 0;
LABEL_17:

  return v16;
}

- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10006CA04("CloudPairing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Find cloud pairing identifier for peripheral: %@", buf, 0xCu);
  }

  id v9 = [(CBIDSManager *)self cloudPairingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B120;
  block[3] = &unk_1002328D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)fetchIDSDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CBIDSManager *)self cloudPairingQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006B238;
  v7[3] = &unk_100232670;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (int64_t)totalCloudDeviceCount
{
  return self->_totalCloudDeviceCount;
}

- (void)setTotalCloudDeviceCount:(int64_t)a3
{
  self->_totalCloudDeviceCount = a3;
}

- (NSMutableDictionary)CPAddressMapping
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCPAddressMapping:(id)a3
{
}

- (BTStateWatcher)buddyStateWatcher
{
  return self->_buddyStateWatcher;
}

- (void)setBuddyStateWatcher:(id)a3
{
}

- (BTStateWatcher)firstUnlockStateWatcher
{
  return self->_firstUnlockStateWatcher;
}

- (void)setFirstUnlockStateWatcher:(id)a3
{
}

- (IDSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (void)setCloudIdentifier:(id)a3
{
}

- (NSString)publicAddress
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPublicAddress:(id)a3
{
}

- (NSString)localDeviceName
{
  return self->_localDeviceName;
}

- (void)setLocalDeviceName:(id)a3
{
}

- (NSArray)requestedKeyTypes
{
  return self->_requestedKeyTypes;
}

- (void)setRequestedKeyTypes:(id)a3
{
}

- (NSMutableArray)cloudDevices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCloudDevices:(id)a3
{
}

- (NSArray)associatedDevices
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAssociatedDevices:(id)a3
{
}

- (NSMutableSet)unpairedIDSCloudIdentifiers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUnpairedIDSCloudIdentifiers:(id)a3
{
}

- (BOOL)processingIDSPush
{
  return self->_processingIDSPush;
}

- (void)setProcessingIDSPush:(BOOL)a3
{
  self->_processingIDSPush = a3;
}

- (OS_dispatch_queue)cloudPairingQueue
{
  return self->_cloudPairingQueue;
}

- (void)setCloudPairingQueue:(id)a3
{
}

- (NSString)localDeviceRandomAddress
{
  return self->_localDeviceRandomAddress;
}

- (void)setLocalDeviceRandomAddress:(id)a3
{
}

- (BOOL)supportsVirtualAddress
{
  return self->_supportsVirtualAddress;
}

- (void)setSupportsVirtualAddress:(BOOL)a3
{
  self->_supportsVirtualAddress = a3;
}

- (NSMutableDictionary)messageIdentifiersWaitingForAck
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMessageIdentifiersWaitingForAck:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifiersWaitingForAck, 0);
  objc_storeStrong((id *)&self->_localDeviceRandomAddress, 0);
  objc_storeStrong((id *)&self->_cloudPairingQueue, 0);
  objc_storeStrong((id *)&self->_unpairedIDSCloudIdentifiers, 0);
  objc_storeStrong((id *)&self->_associatedDevices, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_requestedKeyTypes, 0);
  objc_storeStrong((id *)&self->_localDeviceName, 0);
  objc_storeStrong((id *)&self->_publicAddress, 0);
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_firstUnlockStateWatcher, 0);
  objc_storeStrong((id *)&self->_buddyStateWatcher, 0);

  objc_storeStrong((id *)&self->_CPAddressMapping, 0);
}

@end