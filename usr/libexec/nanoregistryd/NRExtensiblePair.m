@interface NRExtensiblePair
+ (id)newService:(id)a3;
+ (unint64_t)_pairingStrategyFromAdvertisedName:(id)a3;
- (BOOL)IDSAccountAndDevicePresent;
- (BOOL)hasStartedPairing;
- (BOOL)haveFinishedCreatingPairingDevice;
- (BOOL)haveStartedCreatingPairingDevice;
- (BOOL)isBluetoothPairComplete;
- (BOOL)isInitialPropertiesReceived;
- (BOOL)isPairing;
- (BOOL)isReady;
- (BOOL)isTinkerPairing;
- (BOOL)postFailsafeObliteration;
- (EPAdvertiser)advertiser;
- (EPDiscoverer)discoverer;
- (EPFactory)factory;
- (EPMassUnpairer)unpairer;
- (EPOOBKeyGenerator)generator;
- (EPScalablePipeManager)pipe;
- (EPScalablePipeManagerManager)pipeManager;
- (EPServiceRegistry)serviceRegistry;
- (NRExtensiblePair)initWithServiceRegistry:(id)a3;
- (NRExtensiblePair)pairWithDevice:(id)a3;
- (NRExtensiblePairingDelegate)delegate;
- (NSData)oobKey;
- (NSMutableArray)pairers;
- (NSMutableArray)pairingDevices;
- (NSNumber)passcode;
- (NSString)advertisedName;
- (NSUUID)nrDeviceUUID;
- (id)_getPairingExtendedMetadata;
- (id)dataFromPairingStrategy:(unint64_t)a3 andStyle:(unint64_t)a4;
- (id)pairer:(id)a3 newEndpointWithDelegate:(id)a4;
- (unint64_t)pairingMode;
- (unint64_t)pairingStrategy;
- (unint64_t)pairingStrategyFromData:(id)a3 andStyle:(unint64_t *)a4;
- (unint64_t)pairingStyle;
- (void)_invalidateIDSChannel;
- (void)accountAndDeviceReady;
- (void)advertiseAndPairWithAdvertisedName:(id)a3 andPairingMode:(unint64_t)a4 withGetStartedBlock:(id)a5;
- (void)advertiser:(id)a3 receivedData:(id)a4;
- (void)advertiser:(id)a3 receivedPairingRequestForDevice:(id)a4;
- (void)bluetoothPaired:(id)a3;
- (void)discoverAndPairWithAdvertisedName:(id)a3 andDeviceID:(id)a4;
- (void)discoverAndPairWithAdvertisedName:(id)a3 andOOBKey:(id)a4;
- (void)discoverer:(id)a3 deviceDidBecomeDisplayable:(id)a4;
- (void)discovererBluetoothIsWorking:(id)a3;
- (void)discovererBluetoothMayHaveFailed:(id)a3;
- (void)pairer:(id)a3 completedWithError:(id)a4;
- (void)pairer:(id)a3 requestWithType:(int64_t)a4 passkey:(id)a5;
- (void)pairerDidBeginToPair:(id)a3;
- (void)propertiesReceived;
- (void)reset:(BOOL)a3;
- (void)respondWithPasscode:(id)a3;
- (void)sendBeginningToPairNotification;
- (void)setAdvertisedName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIDSAccountAndDevicePresent:(BOOL)a3;
- (void)setIsBluetoothPairComplete:(BOOL)a3;
- (void)setIsInitialPropertiesReceived:(BOOL)a3;
- (void)setIsTinkerPairing:(BOOL)a3;
- (void)setNrDeviceUUID:(id)a3;
- (void)setOobKey:(id)a3;
- (void)setPairingError;
- (void)setPairingMode:(unint64_t)a3;
- (void)setPairingStrategy:(unint64_t)a3 andStyle:(unint64_t)a4;
- (void)setPairingTimer;
- (void)setPasscode:(id)a3;
- (void)setPostFailsafeObliteration:(BOOL)a3;
- (void)timeout;
- (void)unpairer:(id)a3 didFinishUnpairingDevices:(id)a4;
- (void)update;
@end

@implementation NRExtensiblePair

+ (id)newService:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithServiceRegistry:v4];

  return v5;
}

- (EPFactory)factory
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (EPFactory *)[(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (NRExtensiblePair)initWithServiceRegistry:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_serviceRegistry, a3);
  v6 = [(NRExtensiblePair *)self init];
  if (v6)
  {
    uint64_t v7 = +[NSMutableArray array];
    pairers = v6->_pairers;
    v6->_pairers = (NSMutableArray *)v7;

    uint64_t v9 = +[NSMutableArray array];
    pairingDevices = v6->_pairingDevices;
    v6->_pairingDevices = (NSMutableArray *)v9;

    uint64_t v11 = +[NSMutableArray array];
    startupBlocks = v6->_startupBlocks;
    v6->_startupBlocks = (NSMutableArray *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
    didSetPairingStrategy = v6->_didSetPairingStrategy;
    v6->_didSetPairingStrategy = (NSMutableDictionary *)v13;

    v15 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B34D8;
    block[3] = &unk_1001655F8;
    v18 = v6;
    dispatch_async(v15, block);
  }
  return v6;
}

- (void)reset:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: reset", v9, 2u);
    }
  }
  if (v3) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 0;
  }
  [(NRExtensiblePair *)self setPairingMode:v8];
}

- (void)setPairingMode:(unint64_t)a3
{
  self->_nextPairingMode = a3;
  [(NRExtensiblePair *)self update];
}

- (void)setPairingStrategy:(unint64_t)a3 andStyle:(unint64_t)a4
{
  if (self->_pairingStrategy != a3)
  {
    uint64_t v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      uint64_t v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = sub_100052B50(a3);
        int v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Switching to pairing strategy %@", (uint8_t *)&v11, 0xCu);
      }
    }
    self->_pairingStrategy = a3;
  }
  self->_pairingStyle = a4;
  [(NRExtensiblePair *)self update];
}

- (void)update
{
  unint64_t v3 = [(NRExtensiblePair *)self pairingMode];
  unint64_t nextPairingMode = self->_nextPairingMode;
  if (v3 != nextPairingMode)
  {
    self->_pairingMode = nextPairingMode;
    id v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      uint64_t v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = self->_nextPairingMode;
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: Pairing mode changed to %d", (uint8_t *)&buf, 8u);
      }
    }
    switch([(NRExtensiblePair *)self pairingMode])
    {
      case 0uLL:
      case 5uLL:
        if (self->_pairingMode != 5) {
          goto LABEL_16;
        }
        uint64_t v9 = [(NRExtensiblePair *)self nrDeviceUUID];
        if (v9 && [(NRExtensiblePair *)self isReady])
        {
          v10 = [(NRExtensiblePair *)self delegate];
          int v11 = [v10 pairingReport];
          unsigned __int8 v12 = [v11 isErrorSet];

          if ((v12 & 1) == 0)
          {
            uint64_t v13 = [(NRExtensiblePair *)self delegate];
            v14 = [(NRExtensiblePair *)self nrDeviceUUID];
            v120[0] = _NSConcreteStackBlock;
            v120[1] = 3221225472;
            v120[2] = sub_1000B4568;
            v120[3] = &unk_1001655F8;
            v120[4] = self;
            [v13 activateDevice:v14 withCompletion:v120];

            goto LABEL_16;
          }
        }
        else
        {
        }
        v17 = [(NRExtensiblePair *)self delegate];
        [v17 pairingCompleted];

LABEL_16:
        [(AbstractTimer *)self->_timer invalidate];
        timer = self->_timer;
        self->_timer = 0;

        [(NSMutableDictionary *)self->_didSetPairingStrategy removeAllObjects];
        advertiser = self->_advertiser;
        self->_advertiser = 0;

        pipe = self->_pipe;
        self->_pipe = 0;

        pipeManager = self->_pipeManager;
        self->_pipeManager = 0;

        discoverer = self->_discoverer;
        self->_discoverer = 0;

        unpairer = self->_unpairer;
        self->_unpairer = 0;

        generator = self->_generator;
        self->_generator = 0;

        *(_WORD *)&self->_pairingIsSetUp = 0;
        self->_BOOL failure = 0;
        pairedBTDeviceUUID = self->_pairedBTDeviceUUID;
        self->_pairedBTDeviceUUID = 0;

        self->_beginningToPairNotificationSent = 0;
        concurrentPipeFactory = self->_concurrentPipeFactory;
        self->_concurrentPipeFactory = 0;

        [(NRExtensiblePair *)self setIsBluetoothPairComplete:0];
        lastBluetoothPairingError = self->_lastBluetoothPairingError;
        self->_lastBluetoothPairingError = 0;

        *(_WORD *)&self->_haveStartedCreatingPairingDevice = 0;
        [(NSMutableArray *)self->_pairers removeAllObjects];
        [(NSMutableArray *)self->_pairingDevices removeAllObjects];
        if ([(NSMutableArray *)self->_startupBlocks count])
        {
          v28 = nr_daemon_log();
          BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

          if (v29)
          {
            v30 = nr_daemon_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: Entering Done/Inactive state calling pending blocks", (uint8_t *)&buf, 2u);
            }
          }
          id v31 = [(NSMutableArray *)self->_startupBlocks copy];
          [(NSMutableArray *)self->_startupBlocks removeAllObjects];
          v32 = +[EPFactory queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000B45AC;
          block[3] = &unk_1001655F8;
          id v119 = v31;
          id v15 = v31;
          dispatch_async(v32, block);

          v16 = v119;
          goto LABEL_22;
        }
LABEL_23:
        v33 = [(NRExtensiblePair *)self delegate];
        [v33 savePairingReport];

        break;
      case 1uLL:
      case 3uLL:
        id v15 = [(NRExtensiblePair *)self delegate];
        v16 = [v15 pairingReport];
        [v16 setPairingType:1];
        goto LABEL_22;
      case 2uLL:
      case 4uLL:
        id v15 = [(NRExtensiblePair *)self delegate];
        v16 = [v15 pairingReport];
        [v16 setPairingType:2];
LABEL_22:

        goto LABEL_23;
      default:
        goto LABEL_23;
    }
  }
  if ([(NRExtensiblePair *)self pairingMode])
  {
    if ((id)[(NRExtensiblePair *)self pairingMode] != (id)5)
    {
      v34 = [(NRExtensiblePair *)self advertisedName];
      BOOL v35 = v34 == 0;

      if (!v35)
      {
        if ([(NRExtensiblePair *)self hasStartedPairing]) {
          goto LABEL_28;
        }
        unint64_t v54 = [(NRExtensiblePair *)self pairingMode];
        if (v54 - 1 < 2)
        {
          v73 = self->_generator;
          self->_generator = 0;

          v74 = self->_unpairer;
          self->_unpairer = 0;

          v75 = self->_advertiser;
          self->_advertiser = 0;

          if (!self->_discoverer)
          {
            v76 = [(NRExtensiblePair *)self factory];
            [v76 setDiscovererDeviceUUIDs:0];

            v77 = [(NRExtensiblePair *)self factory];
            [v77 setDiscovererShouldScanForProximity:0];

            v78 = [(NRExtensiblePair *)self factory];
            v79 = (EPDiscoverer *)[v78 newDiscovererWithDelegate:self];
            v80 = self->_discoverer;
            self->_discoverer = v79;
          }
          if (self->_pipeManager) {
            goto LABEL_28;
          }
          v81 = +[EPScalablePipeManagerManagerFactory sharedPipeManagerManagerFactory];
          v82 = [v81 pipeManagerManagerWithName:@"com.apple.ep" type:1 priority:1];
          v83 = self->_pipeManager;
          self->_pipeManager = v82;

          v84 = [(EPScalablePipeManagerManager *)self->_pipeManager newManagerWithDelegate:self];
LABEL_102:
          v105 = self->_pipe;
          self->_pipe = v84;

LABEL_28:
          if (!self->_pairingIsSetUp && (self->_advertiser || self->_discoverer))
          {
            self->_pairingIsSetUp = 1;
            v36 = +[NRRepeatingAlertEngine sharedInstance];
            [v36 setEnabled:0 withName:@"WatchUnexpectedlyUnpaired"];

            v37 = +[NRRepeatingAlertEngine sharedInstance];
            [v37 setEnabled:0 withName:@"WatchUnexpectedlyUnpairedBridge"];

            v38 = [(NRExtensiblePair *)self delegate];
            [v38 deleteUnexpectedIDSPairedDevices];

            if (!self->_haveStartedCreatingPairingDevice)
            {
              self->_haveStartedCreatingPairingDevice = 1;
              v39 = [(NRExtensiblePair *)self delegate];
              v40 = [(NRExtensiblePair *)self advertisedName];
              v114[0] = _NSConcreteStackBlock;
              v114[1] = 3221225472;
              v114[2] = sub_1000B49A8;
              v114[3] = &unk_100168FE8;
              v114[4] = self;
              [v39 createDeviceFromPairingRequest:v40 discoveredBy:1 withBlock:v114];
            }
          }
          goto LABEL_33;
        }
        if (v54 - 3 > 1) {
          goto LABEL_28;
        }
        v55 = self->_discoverer;
        self->_discoverer = 0;

        if ((id)[(NRExtensiblePair *)self pairingMode] == (id)4
          || (id)[(NRExtensiblePair *)self pairingStyle] == (id)2)
        {
          v56 = self->_generator;
          self->_generator = 0;
        }
        else
        {
          if (self->_generator)
          {
LABEL_65:
            v57 = [(NRExtensiblePair *)self oobKey];
            v58 = [(EPOOBKeyGenerator *)self->_generator key];
            if (v57 == v58)
            {
              v63 = v57;
            }
            else
            {
              v59 = [(NRExtensiblePair *)self oobKey];
              v60 = [(EPOOBKeyGenerator *)self->_generator key];
              unsigned __int8 v61 = [v59 isEqual:v60];

              if (v61)
              {
LABEL_89:
                v85 = self->_unpairer;
                if (!v85)
                {
                  v86 = [[EPMassUnpairer alloc] initWithDelegate:self UUIDs:0];
                  v87 = self->_unpairer;
                  self->_unpairer = v86;

                  v85 = self->_unpairer;
                }
                if (![(EPMassUnpairer *)v85 finished]
                  || self->_pairingMode != 4
                  && (id)[(EPResource *)self->_generator availability] != (id)1)
                {
                  goto LABEL_28;
                }
                if (!self->_advertiser)
                {
                  v88 = [(NRExtensiblePair *)self advertisedName];
                  v89 = [(NRExtensiblePair *)self factory];
                  [v89 setAdvertisingName:v88];

                  v90 = [(NRExtensiblePair *)self factory];
                  v91 = +[CBUUID UUIDWithString:@"1F9636E6-CA97-4C30-BC5F-C477D6A6CF32"];
                  [v90 addAdvertisedCharacteristic:v91 encryptionRequired:0 withReadHandler:0 writeHandler:&stru_100168F98];

                  objc_initWeak(&buf, self);
                  v92 = [(NRExtensiblePair *)self factory];
                  v93 = +[CBUUID UUIDWithString:@"E168D473-8EFD-4485-A1FD-B25EDAD4DCE2"];
                  v116[0] = _NSConcreteStackBlock;
                  v116[1] = 3221225472;
                  v116[2] = sub_1000B4894;
                  v116[3] = &unk_100168FC0;
                  objc_copyWeak(&v117, &buf);
                  [v92 addAdvertisedCharacteristic:v93 encryptionRequired:0 withReadHandler:v116 writeHandler:0];

                  v94 = [(NRExtensiblePair *)self factory];
                  [v94 setAdvertisingRate:3];

                  v95 = sub_1000A3BC0();
                  LODWORD(v93) = os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT);

                  if (v93)
                  {
                    v96 = sub_1000A3BC0();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)v115 = 0;
                      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "NRExtensiblePair: Set not available to pair to NO", v115, 2u);
                    }
                  }
                  v97 = [(NRExtensiblePair *)self factory];
                  [v97 setAdvertiserNotAvailableToPair:0];

                  v98 = [(NRExtensiblePair *)self factory];
                  [v98 setDontAdvertiseWithServiceUUID:0];

                  v99 = [(NRExtensiblePair *)self factory];
                  v100 = (EPAdvertiser *)[v99 newAdvertiserWithDelegate:self];
                  v101 = self->_advertiser;
                  self->_advertiser = v100;

                  objc_destroyWeak(&v117);
                  objc_destroyWeak(&buf);
                }
                if (self->_pipeManager) {
                  goto LABEL_28;
                }
                v102 = +[EPScalablePipeManagerManagerFactory sharedPipeManagerManagerFactory];
                v103 = [v102 pipeManagerManagerWithName:@"com.apple.ep" type:0 priority:1];
                v104 = self->_pipeManager;
                self->_pipeManager = v103;

                v84 = [(EPScalablePipeManagerManager *)self->_pipeManager newManagerWithDelegate:self];
                goto LABEL_102;
              }
              v62 = [(EPOOBKeyGenerator *)self->_generator key];
              [(NRExtensiblePair *)self setOobKey:v62];

              v63 = [(NRExtensiblePair *)self delegate];
              v57 = [(NRExtensiblePair *)self oobKey];
              [v63 sendXPCOOBKeyChanged:v57];
            }

            goto LABEL_89;
          }
          v56 = [(NRExtensiblePair *)self factory];
          v106 = (EPOOBKeyGenerator *)[v56 newKeyGeneratorWithDelegate:self];
          v107 = self->_generator;
          self->_generator = v106;
        }
        goto LABEL_65;
      }
    }
  }
LABEL_33:
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v41 = [(EPDiscoverer *)self->_discoverer devices];
  v42 = [v41 allValues];

  id v43 = [v42 countByEnumeratingWithState:&v110 objects:v121 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v111;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v111 != v44) {
          objc_enumerationMutation(v42);
        }
        [*(id *)(*((void *)&v110 + 1) + 8 * i) setEnableOOBPairing:([NRExtensiblePair pairingMode](self, "pairingMode") == (id)1)];
      }
      id v43 = [v42 countByEnumeratingWithState:&v110 objects:v121 count:16];
    }
    while (v43);
  }

  v46 = [(NRExtensiblePair *)self advertisedName];
  v47 = [(NRExtensiblePair *)self factory];
  [v47 setAdvertisingName:v46];

  if (((id)[(NRExtensiblePair *)self pairingMode] != (id)3 || !self->_haveFinishedCreatingPairingDevice)
    && (id)[(NRExtensiblePair *)self pairingMode] != (id)1)
  {
    int v49 = 0;
    goto LABEL_48;
  }
  v48 = [(NRExtensiblePair *)self oobKey];
  v46 = v48;
  if (!v48 || !self->_haveFinishedCreatingPairingDevice)
  {
    int v49 = 1;
LABEL_48:
    unint64_t v50 = [(NRExtensiblePair *)self pairingMode];
    if (v50 == 2)
    {
      v51 = [(NRExtensiblePair *)self discoverer];
      if (v51)
      {
        BOOL failure = 1;
        goto LABEL_56;
      }
    }
    if ((id)[(NRExtensiblePair *)self pairingMode] == (id)4)
    {
      v53 = [(NRExtensiblePair *)self advertiser];
      if (v53) {
        BOOL failure = 1;
      }
      else {
        BOOL failure = self->_failure;
      }

      if (v50 != 2)
      {
LABEL_70:
        if (v49)
        {
LABEL_57:

          if (!failure) {
            return;
          }
          goto LABEL_72;
        }
LABEL_71:
        if (!failure) {
          return;
        }
        goto LABEL_72;
      }
    }
    else
    {
      BOOL failure = self->_failure;
      if (v50 != 2) {
        goto LABEL_70;
      }
    }
    v51 = 0;
LABEL_56:

    if (v49) {
      goto LABEL_57;
    }
    goto LABEL_71;
  }

LABEL_72:
  v64 = nr_daemon_log();
  BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);

  if (v65)
  {
    v66 = nr_daemon_log();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: Init complete", (uint8_t *)&buf, 2u);
    }
  }
  if ([(NSMutableArray *)self->_startupBlocks count])
  {
    v67 = nr_daemon_log();
    BOOL v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);

    if (v68)
    {
      v69 = nr_daemon_log();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: Init complete calling pending blocks", (uint8_t *)&buf, 2u);
      }
    }
    id v70 = [(NSMutableArray *)self->_startupBlocks copy];
    [(NSMutableArray *)self->_startupBlocks removeAllObjects];
    v71 = +[EPFactory queue];
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472;
    v108[2] = sub_1000B4BE0;
    v108[3] = &unk_1001655F8;
    id v109 = v70;
    id v72 = v70;
    dispatch_async(v71, v108);
  }
}

- (id)_getPairingExtendedMetadata
{
  unint64_t v3 = objc_opt_new();
  id v4 = (void *)MGCopyAnswer();
  sub_100087C20((uint64_t)v3, v4);
  id v5 = (void *)MGCopyAnswer();
  sub_100087174((uint64_t)v3, (int)[v5 integerValue]);
  sub_10008719C((uint64_t)v3, self->_postFailsafeObliteration);
  BOOL v6 = +[NRPairingCompatibilityVersionInfo systemVersions];
  sub_1000871C4((uint64_t)v3, (uint64_t)[v6 maxPairingCompatibilityVersion]);

  sub_1000871EC((uint64_t)v3, 1);
  char v7 = MGGetBoolAnswer();
  sub_100087214((uint64_t)v3, v7);
  unint64_t v8 = (void *)MGCopyAnswer();
  int v9 = NRWatchOSVersion();
  sub_10008723C((uint64_t)v3, v9);

  v10 = [v3 data];

  return v10;
}

- (void)timeout
{
  unint64_t v3 = +[EPFactory queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B4E9C;
  block[3] = &unk_1001655F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)setPairingError
{
  unint64_t v3 = [(NRExtensiblePair *)self delegate];
  id v4 = [v3 pairingReport];
  unsigned __int8 v5 = [v4 isErrorSet];

  if (v5) {
    return;
  }
  if ([(NRExtensiblePair *)self isBluetoothPairComplete])
  {
    if ([(NRExtensiblePair *)self IDSAccountAndDevicePresent]
      && [(NRExtensiblePair *)self isInitialPropertiesReceived])
    {
      return;
    }
  }
  else
  {
    if (self->_timer) {
      return;
    }
    if (self->_lastBluetoothPairingError)
    {
      unint64_t v8 = nrGetPairingError();
      int v9 = [v8 userInfo];
      id v6 = [v9 mutableCopy];

      v10 = [(NSError *)self->_lastBluetoothPairingError description];
      [v6 setObject:v10 forKeyedSubscript:@"underlyingBluetoothError"];

      int v11 = [v8 domain];
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, [v8 code], v6);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      char v7 = [(NRExtensiblePair *)self delegate];
      unsigned __int8 v12 = [v7 pairingReport];
      [v12 setOriginalError:v13];

      goto LABEL_11;
    }
    if (!self->_discoverer) {
      return;
    }
  }
  nrGetPairingError();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(NRExtensiblePair *)self delegate];
  char v7 = [v6 pairingReport];
  [v7 setOriginalError:v13];
LABEL_11:
}

- (BOOL)isPairing
{
  return [(NSMutableArray *)self->_pairers count] != 0;
}

- (void)accountAndDeviceReady
{
  if (![(NRExtensiblePair *)self IDSAccountAndDevicePresent])
  {
    [(NRExtensiblePair *)self setIDSAccountAndDevicePresent:1];
    unsigned int v3 = [(NRExtensiblePair *)self isReady];
    id v4 = sub_1000A3CF0();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      if (v5)
      {
        id v6 = sub_1000A3CF0();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: accountAndDeviceReady- ready, finalizing BT/IDS pairing", buf, 2u);
        }
      }
      [(NRExtensiblePair *)self setPairingMode:5];
    }
    else if (v5)
    {
      char v7 = sub_1000A3CF0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: accountAndDeviceReady- not ready yet", v8, 2u);
      }
    }
  }
}

- (void)propertiesReceived
{
  if (![(NRExtensiblePair *)self isInitialPropertiesReceived])
  {
    [(NRExtensiblePair *)self setIsInitialPropertiesReceived:1];
    unsigned int v3 = [(NRExtensiblePair *)self isReady];
    id v4 = sub_1000A3CF0();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      if (v5)
      {
        id v6 = sub_1000A3CF0();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: propertiesReceived- ready, finalizing BT/IDS pairing", buf, 2u);
        }
      }
      [(NRExtensiblePair *)self setPairingMode:5];
    }
    else if (v5)
    {
      char v7 = sub_1000A3CF0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: propertiesReceived- not ready yet", v8, 2u);
      }
    }
  }
}

- (void)bluetoothPaired:(id)a3
{
  id v5 = a3;
  if (![(NRExtensiblePair *)self isBluetoothPairComplete])
  {
    [(NRExtensiblePair *)self setIsBluetoothPairComplete:1];
    objc_storeStrong((id *)&self->_pairedBTDeviceUUID, a3);
    discoverer = self->_discoverer;
    if (discoverer)
    {
      self->_discoverer = 0;

      pairedBTDeviceUUID = self->_pairedBTDeviceUUID;
      char v7 = +[NSArray arrayWithObjects:&pairedBTDeviceUUID count:1];
      unint64_t v8 = +[EPFactory sharedFactory];
      [v8 setDiscovererDeviceUUIDs:v7];
    }
    unsigned int v9 = [(NRExtensiblePair *)self isReady];
    v10 = sub_1000A3CF0();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      if (v11)
      {
        unsigned __int8 v12 = sub_1000A3CF0();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: propertiesReceived- ready, finalizing BT/IDS pairing", v14, 2u);
        }
      }
      [(NRExtensiblePair *)self setPairingMode:5];
    }
    else if (v11)
    {
      id v13 = sub_1000A3CF0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: propertiesReceived- not ready yet", v14, 2u);
      }
    }
  }
}

- (void)respondWithPasscode:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_pairers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = CBPairingAgentPairingDataPasskeyKey;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
        uint64_t v17 = v9;
        id v18 = v4;
        unsigned __int8 v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1, (void)v13);
        [v11 respondWithType:2 accept:1 data:v12];

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

- (BOOL)isReady
{
  unsigned int v3 = sub_1000A3CF0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = sub_1000A3CF0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if ([(NRExtensiblePair *)self isBluetoothPairComplete]) {
        CFStringRef v6 = @"YES";
      }
      else {
        CFStringRef v6 = @"NO";
      }
      if ([(NRExtensiblePair *)self IDSAccountAndDevicePresent]) {
        CFStringRef v7 = @"YES";
      }
      else {
        CFStringRef v7 = @"NO";
      }
      *(_DWORD *)BOOL v11 = 138412802;
      if ([(NRExtensiblePair *)self isInitialPropertiesReceived]) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      *(void *)&v11[4] = v6;
      __int16 v12 = 2112;
      CFStringRef v13 = v7;
      __int16 v14 = 2112;
      CFStringRef v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: BT:%@ IDS:%@ IPE:%@", v11, 0x20u);
    }
  }
  BOOL v9 = [(NRExtensiblePair *)self IDSAccountAndDevicePresent];
  if (v9)
  {
    BOOL v9 = [(NRExtensiblePair *)self isBluetoothPairComplete];
    if (v9) {
      LOBYTE(v9) = [(NRExtensiblePair *)self isInitialPropertiesReceived];
    }
  }
  return v9;
}

- (BOOL)hasStartedPairing
{
  if ([(NRExtensiblePair *)self IDSAccountAndDevicePresent]
    || [(NRExtensiblePair *)self isBluetoothPairComplete])
  {
    return 1;
  }

  return [(NRExtensiblePair *)self isInitialPropertiesReceived];
}

- (id)dataFromPairingStrategy:(unint64_t)a3 andStyle:(unint64_t)a4
{
  int v6 = 1330528590;
  char v7 = a3;
  char v8 = a4;
  BOOL v4 = +[NSData dataWithBytes:&v6 length:6];

  return v4;
}

- (unint64_t)pairingStrategyFromData:(id)a3 andStyle:(unint64_t *)a4
{
  id v5 = a3;
  if ([v5 length] == (id)6
    && (int v6 = [v5 bytes], *v6 == 78)
    && v6[1] == 65
    && v6[2] == 78
    && v6[3] == 79)
  {
    char v7 = v6[4];
    if (a4)
    {
      char v8 = v6[5];
      if (((v8 - 1) & 0xFE) != 0) {
        char v8 = 0;
      }
      *a4 = v8;
    }
    if ((v7 - 4) < 0xFDu) {
      char v7 = 0;
    }
    unint64_t v9 = v7;
  }
  else
  {
    unint64_t v9 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v9;
}

- (void)setPairingTimer
{
  if (!self->_timer)
  {
    unsigned int v3 = +[EPFactory queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B5A78;
    v6[3] = &unk_1001655F8;
    v6[4] = self;
    BOOL v4 = +[TimerFactory timerWithIdentifier:@"com.apple.NanoRegistry.ExtensiblePair" delay:1 gracePeriod:v3 waking:v6 handlerQueue:90.0 handlerBlock:0.0];
    timer = self->_timer;
    self->_timer = v4;
  }
}

- (void)discoverAndPairWithAdvertisedName:(id)a3 andOOBKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(NSMutableArray *)self->_pairers count])
  {
    [(NRExtensiblePair *)self _invalidateIDSChannel];
    [(NRExtensiblePair *)self setPairingTimer];
    [(NRExtensiblePair *)self setPairingStrategy:+[NRExtensiblePair _pairingStrategyFromAdvertisedName:v8] andStyle:1];
    [(NRExtensiblePair *)self setAdvertisedName:v8];
    [(NRExtensiblePair *)self setPairingMode:1];
    [(NRExtensiblePair *)self setOobKey:v6];
    char v7 = [(NRExtensiblePair *)self delegate];
    [v7 sendXPCOOBKeyChanged:v6];
  }
  [(NRExtensiblePair *)self update];
}

- (void)discoverAndPairWithAdvertisedName:(id)a3 andDeviceID:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (![(NSMutableArray *)self->_pairers count])
  {
    [(NRExtensiblePair *)self _invalidateIDSChannel];
    [(NRExtensiblePair *)self setPairingTimer];
    [(NRExtensiblePair *)self setPairingStrategy:+[NRExtensiblePair _pairingStrategyFromAdvertisedName:v7] andStyle:2];
    [(NRExtensiblePair *)self setAdvertisedName:v7];
    [(NRExtensiblePair *)self setPairingMode:2];
    [(NRExtensiblePair *)self setNrDeviceUUID:v6];
  }
  [(NRExtensiblePair *)self update];
}

- (void)_invalidateIDSChannel
{
  if (![(NRExtensiblePair *)self IDSAccountAndDevicePresent])
  {
    unsigned int v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v6);
        id v8 = [(NRExtensiblePair *)self delegate];
        unint64_t v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        int v12 = 138412546;
        CFStringRef v13 = v7;
        __int16 v14 = 2112;
        CFStringRef v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Asking %@ to invalidate IDS channels.", (uint8_t *)&v12, 0x16u);
      }
    }
    BOOL v11 = [(NRExtensiblePair *)self delegate];
    [v11 invalidateIDSChannels];
  }
}

+ (unint64_t)_pairingStrategyFromAdvertisedName:(id)a3
{
  unsigned int v3 = sub_10001381C(a3);
  BOOL v4 = [v3 objectForKeyedSubscript:@"v"];
  id v5 = [v4 integerValue];

  unint64_t v6 = sub_100052B40((unint64_t)v5);
  return v6;
}

- (void)setNrDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nrDeviceUUID, a3);
  id v5 = a3;
  id v6 = [(NRExtensiblePair *)self delegate];
  [v6 setPairingID:v5];
}

- (void)advertiseAndPairWithAdvertisedName:(id)a3 andPairingMode:(unint64_t)a4 withGetStartedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    startupBlocks = self->_startupBlocks;
    id v12 = [v9 copy];
    id v13 = objc_retainBlock(v12);
    [(NSMutableArray *)startupBlocks addObject:v13];
  }
  if (![(NSMutableArray *)self->_pairers count])
  {
    if (![(NRExtensiblePair *)self IDSAccountAndDevicePresent])
    {
      __int16 v14 = nr_daemon_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (v15)
      {
        long long v16 = nr_daemon_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000FAF94(v16);
        }
      }
      uint64_t v17 = [(NRExtensiblePair *)self delegate];
      [v17 invalidateIDSChannels];
    }
    if (a4 == 3) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 2;
    }
    [(NRExtensiblePair *)self setPairingStrategy:1 andStyle:v18];
    [(NRExtensiblePair *)self setAdvertisedName:v8];
    [(NRExtensiblePair *)self setPairingMode:a4];
  }
  [(NRExtensiblePair *)self update];
}

- (NRExtensiblePair)pairWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "pairWithDevice:", buf, 2u);
    }
  }
  if (![(NRExtensiblePair *)self hasStartedPairing])
  {
    [v4 setEnableOOBPairing:self->_pairingMode == 1];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000B6304;
    v26[3] = &unk_100165530;
    v26[4] = self;
    id v8 = v4;
    id v27 = v8;
    id v9 = objc_retainBlock(v26);
    v10 = nr_daemon_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      id v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = sub_100052B50([(NRExtensiblePair *)self pairingStrategy]);
        *(_DWORD *)id buf = 138412290;
        BOOL v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Beginning pairing strategy %@", buf, 0xCu);
      }
    }
    if ((id)[(NRExtensiblePair *)self pairingStrategy] == (id)1)
    {
      ((void (*)(void *))v9[2])(v9);
    }
    else
    {
      __int16 v14 = [v8 uuid];
      BOOL v15 = +[NSNumber numberWithUnsignedInteger:[(NRExtensiblePair *)self pairingStrategy]];
      long long v16 = [(NSMutableDictionary *)self->_didSetPairingStrategy objectForKeyedSubscript:v14];
      unsigned __int8 v17 = [v15 isEqual:v16];

      if (v17)
      {
        ((void (*)(void *))v9[2])(v9);
      }
      else
      {
        uint64_t v18 = [(NRExtensiblePair *)self dataFromPairingStrategy:[(NRExtensiblePair *)self pairingStrategy] andStyle:[(NRExtensiblePair *)self pairingStyle]];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000B6414;
        v25[3] = &unk_1001655F8;
        v25[4] = self;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000B6464;
        v20[3] = &unk_100169010;
        id v21 = v8;
        v22 = self;
        id v23 = v14;
        v24 = v9;
        [v21 writeData:v18 begin:v25 completion:v20];
      }
    }
  }
  return result;
}

- (void)unpairer:(id)a3 didFinishUnpairingDevices:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  self->_BOOL failure = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v12 = sub_1000A3CF0();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

        if (v13)
        {
          __int16 v14 = sub_1000A3CF0();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v15 = [v11 UUIDString];
            *(_DWORD *)id buf = 138412290;
            id v43 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NRExtensiblePair: Unpaired %@", buf, 0xCu);
          }
        }
        id v16 = [v11 UUIDString];
        printf("NRExtensiblePair: Unpaired %s\n", (const char *)[v16 UTF8String]);

        unsigned __int8 v17 = [(EPDiscoverer *)self->_discoverer devices];
        uint64_t v18 = [v17 objectForKeyedSubscript:v11];
        [v18 reset];
      }
      id v8 = [v6 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v8);
  }
  if (self->_discoverer)
  {
    v19 = [v32 requestedUUIDs];
    v20 = +[NSMutableSet setWithSet:v19];

    [v20 minusSet:v6];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = v20;
    id v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
          id v27 = [(EPDiscoverer *)self->_discoverer devices];
          v28 = [v27 objectForKeyedSubscript:v26];

          if (v28) {
            [(NRExtensiblePair *)self pairWithDevice:v28];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v23);
    }

    [v21 removeAllObjects];
  }
  BOOL v29 = sub_1000A3CF0();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    id v31 = sub_1000A3CF0();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "NRExtensiblePair: Unpair complete", buf, 2u);
    }
  }
  puts("NRExtensiblePair: Unpair complete");
  [(NRExtensiblePair *)self update];
}

- (void)discoverer:(id)a3 deviceDidBecomeDisplayable:(id)a4
{
  id v5 = a4;
  if (![(NRExtensiblePair *)self hasStartedPairing])
  {
    id v6 = [(NRExtensiblePair *)self nrDeviceUUID];

    if (v6)
    {
      id v7 = [v5 name];
      id v8 = [(NRExtensiblePair *)self advertisedName];
      unsigned int v9 = [v7 isEqual:v8];

      if (v9)
      {
        if ([v5 isPeripheral])
        {
          v10 = sub_1000A3CF0();
          BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

          if (v11)
          {
            id v12 = sub_1000A3CF0();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v13 = [v5 description];
              *(_DWORD *)id buf = 136315138;
              id v20 = [v13 UTF8String];
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NRExtensiblePair: Discovered device %s, unpairing", buf, 0xCu);
            }
          }
          id v14 = [v5 description];
          printf("NRExtensiblePair: Discovered device %s, unpairing\n", (const char *)[v14 UTF8String]);

          BOOL v15 = [EPMassUnpairer alloc];
          id v16 = [v5 uuid];
          unsigned __int8 v17 = +[NSSet setWithObject:v16];
          uint64_t v18 = [(EPMassUnpairer *)v15 initWithDelegate:self UUIDs:v17];
        }
      }
    }
  }
}

- (void)discovererBluetoothMayHaveFailed:(id)a3
{
  if (![(NRExtensiblePair *)self hasStartedPairing])
  {
    self->_BOOL failure = 1;
    [(NRExtensiblePair *)self update];
  }
}

- (void)discovererBluetoothIsWorking:(id)a3
{
  self->_BOOL failure = 0;
}

- (void)advertiser:(id)a3 receivedPairingRequestForDevice:(id)a4
{
  id v5 = a4;
  if (![(NRExtensiblePair *)self hasStartedPairing])
  {
    id v6 = nr_daemon_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v9 = sub_100052B50([(NRExtensiblePair *)self pairingStrategy]);
        int v11 = 138412290;
        id v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NRExtensiblePair: Beginning pairing strategy %@", (uint8_t *)&v11, 0xCu);
      }
    }
    id v10 = [v5 newPairerWithDelegate:self];
    if (v10)
    {
      [(NSMutableArray *)self->_pairers addObject:v10];
      [(NSMutableArray *)self->_pairingDevices addObject:v5];
      [(NRExtensiblePair *)self update];
    }
  }
}

- (void)advertiser:(id)a3 receivedData:(id)a4
{
  id v5 = a4;
  id v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received pairing switch modes data via Bluetooth characteristic: %@", buf, 0xCu);
    }
  }
  if (![(NSMutableArray *)self->_pairers count])
  {
    *(void *)id buf = 0;
    unint64_t v9 = [(NRExtensiblePair *)self pairingStrategyFromData:v5 andStyle:buf];
    if (*(void *)buf != 2) {
      [(NRExtensiblePair *)self sendBeginningToPairNotification];
    }
    id v10 = nr_daemon_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      id v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13[0] = 67109120;
        v13[1] = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting pairing strategy to %d", (uint8_t *)v13, 8u);
      }
    }
    [(NRExtensiblePair *)self setPairingStrategy:v9 andStyle:*(void *)buf];
  }
}

- (void)pairerDidBeginToPair:(id)a3
{
  if ((id)[(NRExtensiblePair *)self pairingStyle] != (id)2)
  {
    [(NRExtensiblePair *)self sendBeginningToPairNotification];
  }
}

- (void)pairer:(id)a3 requestWithType:(int64_t)a4 passkey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = nr_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = nr_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pairer:requestWithType:passkey:", buf, 2u);
    }
  }
  if (![(NRExtensiblePair *)self hasStartedPairing])
  {
    id v13 = [(NRExtensiblePair *)self nrDeviceUUID];

    if (v13)
    {
      v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      id v21 = sub_1000B70C8;
      id v22 = &unk_100165530;
      id v23 = self;
      id v14 = v8;
      id v24 = v14;
      BOOL v15 = objc_retainBlock(&v19);
      if (a4 == 1 || a4 == 2)
      {
        [(NRExtensiblePair *)self setPairingStrategy:[(NRExtensiblePair *)self pairingStrategy] andStyle:2];
        ((void (*)(void ***))v15[2])(v15);
        unsigned __int8 v17 = [(NRExtensiblePair *)self delegate];
        uint64_t v18 = [(NRExtensiblePair *)self nrDeviceUUID];
        [v17 sendXPCDeviceNeedsPasscodeMessage:v18 passcode:v9];
      }
      else
      {
        if (a4 != 5) {
          goto LABEL_15;
        }
        id v16 = [(NRExtensiblePair *)self oobKey];

        if (!v16) {
          goto LABEL_15;
        }
        [(NRExtensiblePair *)self setPairingStrategy:[(NRExtensiblePair *)self pairingStrategy] andStyle:1];
        ((void (*)(void ***))v15[2])(v15);
        uint64_t v26 = CBPairingAgentPairingDataOOBTKKey;
        unsigned __int8 v17 = [(NRExtensiblePair *)self oobKey];
        id v27 = v17;
        uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        [v14 respondWithType:5 accept:1 data:v18];
      }

LABEL_15:
      goto LABEL_16;
    }
  }
  [v8 respondWithType:a4 accept:0 data:0];
LABEL_16:
}

- (void)pairer:(id)a3 completedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRExtensiblePair *)self isBluetoothPairComplete])
  {
    [(NSMutableArray *)self->_pairers removeObject:v6];
    pairingDevices = self->_pairingDevices;
    id v9 = [v6 device];
    [(NSMutableArray *)pairingDevices removeObject:v9];
LABEL_3:

    goto LABEL_30;
  }
  if (!v7)
  {
    if ([(NRExtensiblePair *)self hasStartedPairing]) {
      goto LABEL_30;
    }
    id v27 = [v6 device];
    v28 = [v27 uuid];
    [(NRExtensiblePair *)self bluetoothPaired:v28];

    [(NRExtensiblePair *)self sendBeginningToPairNotification];
    BOOL v29 = sub_1000A3CF0();
    LODWORD(v28) = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v28)
    {
      BOOL v30 = sub_1000A3CF0();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [(NSUUID *)self->_pairedBTDeviceUUID UUIDString];
        *(_DWORD *)id buf = 138412290;
        v75 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: Paired to BT device %@", buf, 0xCu);
      }
    }
    [(AbstractTimer *)self->_timer invalidate];
    id v32 = +[EPFactory queue];
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_1000B7BC4;
    v70[3] = &unk_1001655F8;
    v70[4] = self;
    long long v33 = +[TimerFactory timerWithIdentifier:@"com.apple.NanoRegistry.ExtensiblePair" delay:1 gracePeriod:v32 waking:v70 handlerQueue:120.0 handlerBlock:0.0];
    timer = self->_timer;
    self->_timer = v33;

    [(NSMutableArray *)self->_pairers removeAllObjects];
    [(NSMutableArray *)self->_pairers addObject:v6];
    [(NSMutableArray *)self->_pairingDevices removeAllObjects];
    long long v35 = self->_pairingDevices;
    long long v36 = [v6 device];
    [(NSMutableArray *)v35 addObject:v36];

    unpairer = self->_unpairer;
    self->_unpairer = 0;

    discoverer = self->_discoverer;
    self->_discoverer = 0;

    id v9 = [(EPAdvertiser *)self->_advertiser manager];
    advertiser = self->_advertiser;
    self->_advertiser = 0;

    long long v40 = [(NRExtensiblePair *)self factory];
    [v40 setAdvertisingRate:1];

    v41 = sub_1000A3BC0();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);

    if (v42)
    {
      id v43 = sub_1000A3BC0();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "NRExtensiblePair: Set not available to pair to YES", buf, 2u);
      }
    }
    uint64_t v44 = [(NRExtensiblePair *)self factory];
    [v44 setAdvertiserNotAvailableToPair:1];

    [v9 setName:0];
    v45 = [(NRExtensiblePair *)self delegate];
    v46 = [(NRExtensiblePair *)self nrDeviceUUID];
    [v45 activateDevice:v46 withCompletion:0];

    [(NRExtensiblePair *)self update];
    v47 = [(NRExtensiblePair *)self delegate];
    v48 = [v6 device];
    int v49 = [(NRExtensiblePair *)self nrDeviceUUID];
    [v47 updateNRMutableDeviceFromEPDevice:v48 withNRUUID:v49 withBlock:0];

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000B7BCC;
    v69[3] = &unk_100165980;
    v69[4] = self;
    unint64_t v50 = objc_retainBlock(v69);
    if ((id)[(NRExtensiblePair *)self pairingStrategy] == (id)1)
    {
      ((void (*)(void *, void))v50[2])(v50, 0);
    }
    else
    {
      v51 = self->_pairedBTDeviceUUID;
      v52 = [(NRExtensiblePair *)self oobKey];
      v53 = v52;
      v62 = v9;
      if (v52) {
        id v54 = v52;
      }
      else {
        id v54 = (id)objc_opt_new();
      }
      v55 = v54;
      id v56 = [objc_alloc((Class)IDSLocalPairingAddPairedDeviceInfo) initWithCBUUID:v51 pairingProtocolVersion:0 BTOutOfBandKey:v54];
      [v56 setPairingType:self->_isTinkerPairing];
      [v56 setShouldPairDirectlyOverIPsec:([self pairingStrategy] == 3)];
      v57 = [(NRExtensiblePair *)self delegate];
      v58 = [(NRExtensiblePair *)self nrDeviceUUID];
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_1000B7F98;
      v63[3] = &unk_100169060;
      v64 = v51;
      id v65 = v53;
      id v66 = v56;
      v67 = self;
      BOOL v68 = v50;
      id v59 = v56;
      id v60 = v53;
      unsigned __int8 v61 = v51;
      [v57 createLocalPairingStore:v58 andNotifyPairingBeginning:1 withBlock:v63];

      id v9 = v62;
    }

    goto LABEL_3;
  }
  objc_storeStrong((id *)&self->_lastBluetoothPairingError, a4);
  [(NSMutableArray *)self->_pairers removeObject:v6];
  id v10 = self->_pairingDevices;
  BOOL v11 = [v6 device];
  [(NSMutableArray *)v10 removeObject:v11];

  [(EPDiscoverer *)self->_discoverer clear];
  id v12 = [v7 domain];
  if ([v12 isEqualToString:CBInternalErrorDomain])
  {
    id v13 = [v7 code];

    if (v13 == (id)1)
    {
      id v14 = [v6 device];
      BOOL v15 = [v14 uuid];

      id v16 = [v7 userInfo];
      unsigned __int8 v17 = [v16 objectForKeyedSubscript:CBOriginalPeerIdentifierErrorKey];

      uint64_t v18 = sub_1000A3CF0();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        uint64_t v20 = sub_1000A3CF0();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [v15 UUIDString];
          id v22 = [v17 UUIDString];
          *(_DWORD *)id buf = 138412546;
          v75 = v21;
          __int16 v76 = 2112;
          v77 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ExtensiblePair: BT returned already paired error for device %@. Ghost device UUID is: %@", buf, 0x16u);
        }
      }
      if (v17)
      {
        id v23 = [EPMassUnpairer alloc];
        id v24 = +[NSSet setWithObject:v17];
        v25 = [(EPMassUnpairer *)v23 initWithDelegate:self UUIDs:v24];

        uint64_t v26 = [(NRExtensiblePair *)self delegate];
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_1000B7A9C;
        v71[3] = &unk_100169038;
        id v72 = v17;
        v73 = self;
        [v26 getPairedPairingIDForBluetoothID:v72 completion:v71];
      }
      id v6 = 0;
    }
  }
  else
  {
  }
  if (self->_pairingMode == 2)
  {
    [(NSMutableArray *)self->_pairers removeAllObjects];
    [(NRExtensiblePair *)self timeout];
  }
  else if (!self->_timer)
  {
    [(NRExtensiblePair *)self setPairingError];
    [(NRExtensiblePair *)self setPairingMode:5];
  }
LABEL_30:
}

- (void)sendBeginningToPairNotification
{
  if (!self->_beginningToPairNotificationSent)
  {
    self->_beginningToPairNotificationSent = 1;
    v2 = sub_1000A3CF0();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = sub_1000A3CF0();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending com.apple.nanoregistry.isbeginningtopair darwin notification", v5, 2u);
      }
    }
    notify_post("com.apple.nanoregistry.isbeginningtopair");
  }
}

- (id)pairer:(id)a3 newEndpointWithDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRExtensiblePair *)self isBluetoothPairComplete]) {
    goto LABEL_2;
  }
  unint64_t v20 = [(NRExtensiblePair *)self pairingStrategy];
  if (v20 - 2 < 2)
  {
    pairingPipeFactory = self->_pairingPipeFactory;
    if (!pairingPipeFactory)
    {
      id v22 = [EPNullResourceManager alloc];
      id v23 = +[EPFactory queue];
      id v24 = [(EPResourceManager *)v22 initWithQueue:v23];
      v25 = self->_pairingPipeFactory;
      self->_pairingPipeFactory = v24;

      pairingPipeFactory = self->_pairingPipeFactory;
    }
    id v18 = [(EPResourceManagerProtocol *)pairingPipeFactory newResourceWithDelegate:v7];
LABEL_14:
    if (v18) {
      goto LABEL_7;
    }
    goto LABEL_2;
  }
  if (v20 != 1)
  {
    long long v36 = sub_1000A3CF0();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

    if (v37)
    {
      long long v38 = sub_1000A3CF0();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_1000FB114(v38, v39, v40, v41, v42, v43, v44, v45);
      }
    }
    goto LABEL_2;
  }
  if (!self->_concurrentPipeFactory)
  {
    uint64_t v26 = [NRConcurrentPipeManager alloc];
    id v27 = +[EPFactory queue];
    v28 = [(EPResourceManager *)v26 initWithQueue:v27];
    concurrentPipeFactory = self->_concurrentPipeFactory;
    self->_concurrentPipeFactory = v28;

    BOOL v30 = self->_concurrentPipeFactory;
    id v31 = [v6 device];
    id v32 = [v31 uuid];
    long long v33 = [(NRExtensiblePair *)self nrDeviceUUID];
    long long v34 = [(NRExtensiblePair *)self oobKey];
    long long v35 = [(NRExtensiblePair *)self delegate];
    id v18 = [(NRConcurrentPipeManager *)v30 newIDSPairingToUUID:v32 pairingUUID:v33 oobKey:v34 withExtensiblePairingDelegate:v35 withDelegate:v7];

    goto LABEL_14;
  }
LABEL_2:
  id v8 = sub_1000A3CF0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

  if (v9)
  {
    id v10 = sub_1000A3CF0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000FB0DC(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  id v18 = 0;
LABEL_7:

  return v18;
}

- (NRExtensiblePairingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NRExtensiblePairingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)advertisedName
{
  return self->_advertisedName;
}

- (void)setAdvertisedName:(id)a3
{
}

- (NSData)oobKey
{
  return self->_oobKey;
}

- (void)setOobKey:(id)a3
{
}

- (unint64_t)pairingMode
{
  return self->_pairingMode;
}

- (NSNumber)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (BOOL)postFailsafeObliteration
{
  return self->_postFailsafeObliteration;
}

- (void)setPostFailsafeObliteration:(BOOL)a3
{
  self->_postFailsafeObliteration = a3;
}

- (BOOL)isTinkerPairing
{
  return self->_isTinkerPairing;
}

- (void)setIsTinkerPairing:(BOOL)a3
{
  self->_isTinkerPairing = a3;
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (EPDiscoverer)discoverer
{
  return self->_discoverer;
}

- (EPAdvertiser)advertiser
{
  return self->_advertiser;
}

- (EPScalablePipeManagerManager)pipeManager
{
  return self->_pipeManager;
}

- (EPScalablePipeManager)pipe
{
  return self->_pipe;
}

- (EPOOBKeyGenerator)generator
{
  return self->_generator;
}

- (EPMassUnpairer)unpairer
{
  return self->_unpairer;
}

- (NSMutableArray)pairers
{
  return self->_pairers;
}

- (NSMutableArray)pairingDevices
{
  return self->_pairingDevices;
}

- (NSUUID)nrDeviceUUID
{
  return self->_nrDeviceUUID;
}

- (unint64_t)pairingStrategy
{
  return self->_pairingStrategy;
}

- (unint64_t)pairingStyle
{
  return self->_pairingStyle;
}

- (BOOL)haveStartedCreatingPairingDevice
{
  return self->_haveStartedCreatingPairingDevice;
}

- (BOOL)haveFinishedCreatingPairingDevice
{
  return self->_haveFinishedCreatingPairingDevice;
}

- (BOOL)isBluetoothPairComplete
{
  return self->_isBluetoothPairComplete;
}

- (void)setIsBluetoothPairComplete:(BOOL)a3
{
  self->_isBluetoothPairComplete = a3;
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
  objc_storeStrong((id *)&self->_nrDeviceUUID, 0);
  objc_storeStrong((id *)&self->_pairingDevices, 0);
  objc_storeStrong((id *)&self->_pairers, 0);
  objc_storeStrong((id *)&self->_unpairer, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_discoverer, 0);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_oobKey, 0);
  objc_storeStrong((id *)&self->_advertisedName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastBluetoothPairingError, 0);
  objc_storeStrong((id *)&self->_didSetPairingStrategy, 0);
  objc_storeStrong((id *)&self->_concurrentPipeFactory, 0);
  objc_storeStrong((id *)&self->_pairingPipeFactory, 0);
  objc_storeStrong((id *)&self->_startupBlocks, 0);
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_pairedBTDeviceUUID, 0);
}

@end