@interface EPPhoneMigrator
+ (BOOL)_hasMigrationConsent:(id)a3;
+ (id)newService:(id)a3;
- (AbstractTimer)keyTimer;
- (BOOL)checkIfMigrationIsPossible:(id)a3;
- (BOOL)getWatchMigrationCompletionStatusWithError:(id *)a3;
- (BOOL)isBusy;
- (BOOL)propertiesReceivedFlag;
- (BOOL)propertiesSentFlag;
- (BOOL)readyToPair;
- (BOOL)watchMigrationComplete;
- (EPKey)sharedKey;
- (EPKeymaster)keymaster;
- (EPNanoRegistryStatusCodeVote)migratingStatusCodeVote;
- (EPOOBKeyGenerator)oobKeyGenerator;
- (EPPhoneMigrator)initWithServiceRegistry:(id)a3;
- (EPScalablePipeManager)pipe;
- (EPScalablePipeManagerManager)pipeManager;
- (EPServiceRegistry)serviceRegistry;
- (EPUnlockAssertion)unlock;
- (NRPowerAssertionActivity)powerAssertion;
- (NSData)currentChallenge;
- (NSError)watchMigrationCompleteError;
- (NSMutableArray)idsAccountPlusDeviceBlocks;
- (NSMutableArray)migrationChallengeResponseBlocks;
- (NSMutableArray)migrationReadResponseBlocks;
- (NSString)lastMigrationRequestPhoneName;
- (NSString)passcode;
- (NSUUID)bluetoothUUIDReceivedWithAccountAndDevice;
- (NSUUID)expectedIncomingPairingUUID;
- (OS_dispatch_queue)queue;
- (id)createMigrationReporterWithPairingID:(id)a3;
- (id)factory;
- (id)migrationCompletionBlock;
- (id)registry;
- (void)beginMigrationToDevice:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)beginRTCMigrationMetricCollection:(id)a3;
- (void)clearPairingFlags;
- (void)confirmChallengeWrites;
- (void)createMigrationReporterWithoutPairingIDWithCompletion:(id)a3;
- (void)failChallengeWrites;
- (void)finishMigrationWithRoutingSlip:(id)a3;
- (void)getMigrationPairingCharacteristicReadDataWithCompletion:(id)a3;
- (void)getNonAltAccountMigratableDeviceIDsWithBlock:(id)a3;
- (void)idsAccountPlusDeviceReceivedWithBTID:(id)a3;
- (void)keyTimerTimeout;
- (void)migrationCompletionRequestReceivedWithStatus:(unint64_t)a3;
- (void)migrationMetricSessionIDReceivedWithID:(id)a3;
- (void)notifyWhenIDSPairsWithBlock:(id)a3;
- (void)pairingTransactionIsReadyToPair:(id)a3;
- (void)phoneMigrationCommitted;
- (void)propertiesReceived;
- (void)propertiesSent;
- (void)putMigrationChallengeCharacteristicWriteData:(id)a3 completion:(id)a4;
- (void)removeNotifyWhenIDSPairsWithBlock:(id)a3;
- (void)respondToChallengeWritesWithSuccess:(BOOL)a3;
- (void)setBluetoothUUIDReceivedWithAccountAndDevice:(id)a3;
- (void)setCurrentChallenge:(id)a3;
- (void)setExpectedIncomingPairingUUID:(id)a3;
- (void)setIdsAccountPlusDeviceBlocks:(id)a3;
- (void)setKeyTimer:(id)a3;
- (void)setMigratingStatusCodeVote:(id)a3;
- (void)setMigrationChallengeResponseBlocks:(id)a3;
- (void)setMigrationCompletionBlock:(id)a3;
- (void)setMigrationConsent:(BOOL)a3 forDeviceID:(id)a4 completion:(id)a5;
- (void)setMigrationReadResponseBlocks:(id)a3;
- (void)setOobKeyGenerator:(id)a3;
- (void)setPasscode:(id)a3;
- (void)setPipe:(id)a3;
- (void)setPipeManager:(id)a3;
- (void)setPowerAssertion:(id)a3;
- (void)setPropertiesReceivedFlag:(BOOL)a3;
- (void)setPropertiesSentFlag:(BOOL)a3;
- (void)setReadyToPair:(BOOL)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setSharedKey:(id)a3;
- (void)setUnlock:(id)a3;
- (void)setWatchMigrationComplete:(BOOL)a3;
- (void)setWatchMigrationCompleteError:(id)a3;
- (void)update;
- (void)wipeCharacteristicHandlers;
@end

@implementation EPPhoneMigrator

+ (id)newService:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithServiceRegistry:v4];

  return v5;
}

- (id)registry
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (EPKeymaster)keymaster
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return (EPKeymaster *)[(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)[(EPServiceRegistry *)self->_serviceRegistry queue];
}

- (EPPhoneMigrator)initWithServiceRegistry:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_serviceRegistry, a3);
  v6 = [(EPPhoneMigrator *)self init];
  if (v6)
  {
    [v5 addService:v6];
    id v7 = [v5 instantiateServiceByClass:objc_opt_class()];
    v8 = +[NSSet setWithObject:@"migrationSaga"];
    +[NRPowerAssertionActivity addActivityGroup:v8];

    v9 = +[NSMutableArray array];
    [(EPPhoneMigrator *)v6 setMigrationReadResponseBlocks:v9];

    v10 = +[NSMutableArray array];
    [(EPPhoneMigrator *)v6 setMigrationChallengeResponseBlocks:v10];

    v11 = +[NSMutableArray array];
    [(EPPhoneMigrator *)v6 setIdsAccountPlusDeviceBlocks:v11];
  }
  return v6;
}

- (void)getMigrationPairingCharacteristicReadDataWithCompletion:(id)a3
{
  migrationReadResponseBlocks = self->_migrationReadResponseBlocks;
  id v5 = [a3 copy];
  id v6 = objc_retainBlock(v5);
  [(NSMutableArray *)migrationReadResponseBlocks addObject:v6];

  [(EPPhoneMigrator *)self update];
}

- (void)keyTimerTimeout
{
  uint64_t v3 = [(EPPhoneMigrator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7C10;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)putMigrationChallengeCharacteristicWriteData:(id)a3 completion:(id)a4
{
}

+ (BOOL)_hasMigrationConsent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:NRDevicePropertyMigrationConsent];
  id v5 = [v4 value];

  if ([v3 isAltAccount] && objc_msgSend(v5, "BOOLValue"))
  {
    id v6 = [v3 objectForKeyedSubscript:NRDevicePropertyMigrationConsentDate];
    id v7 = [v6 value];

    if (v7)
    {
      [v7 timeIntervalSinceNow];
      BOOL v9 = v8 >= -86400.0 && v8 <= 0.0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)checkIfMigrationIsPossible:(id)a3
{
  return 1;
}

- (void)failChallengeWrites
{
}

- (void)confirmChallengeWrites
{
}

- (void)respondToChallengeWritesWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NSMutableArray *)self->_migrationChallengeResponseBlocks count]) {
    return;
  }
  id v5 = sub_1000A3CF0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    if (v6)
    {
      id v7 = sub_1000A3CF0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        double v8 = "Ready to pair, responding to Challenge write";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else if (v6)
  {
    id v7 = sub_1000A3CF0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v8 = "Migration timed out or was canceled. Responding negatively to challenge write requests.";
      goto LABEL_9;
    }
LABEL_10:
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v9 = self->_migrationChallengeResponseBlocks;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i));
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_migrationChallengeResponseBlocks removeAllObjects];
}

- (void)setMigrationConsent:(BOOL)a3 forDeviceID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D8010;
  v13[3] = &unk_1001698B8;
  BOOL v17 = a3;
  long long v15 = self;
  id v16 = v9;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [v10 grabRegistryWithWriteBlockAsync:v13];
}

- (void)pairingTransactionIsReadyToPair:(id)a3
{
  self->_readyToPair = 1;
  [(EPPhoneMigrator *)self confirmChallengeWrites];
}

- (void)clearPairingFlags
{
  BOOL v3 = sub_1000A3CF0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = sub_1000A3CF0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing Migration pairing flags", v7, 2u);
    }
  }
  bluetoothUUIDReceivedWithAccountAndDevice = self->_bluetoothUUIDReceivedWithAccountAndDevice;
  self->_bluetoothUUIDReceivedWithAccountAndDevice = 0;

  *(_WORD *)&self->_propertiesReceivedFlag = 0;
}

- (void)notifyWhenIDSPairsWithBlock:(id)a3
{
  idsAccountPlusDeviceBlocks = self->_idsAccountPlusDeviceBlocks;
  id v5 = objc_retainBlock(a3);
  [(NSMutableArray *)idsAccountPlusDeviceBlocks addObject:v5];

  [(EPPhoneMigrator *)self update];
}

- (void)removeNotifyWhenIDSPairsWithBlock:(id)a3
{
  if (a3)
  {
    idsAccountPlusDeviceBlocks = self->_idsAccountPlusDeviceBlocks;
    id v4 = objc_retainBlock(a3);
    [(NSMutableArray *)idsAccountPlusDeviceBlocks removeObject:v4];
  }
}

- (void)idsAccountPlusDeviceReceivedWithBTID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothUUIDReceivedWithAccountAndDevice, a3);

  [(EPPhoneMigrator *)self update];
}

- (void)propertiesReceived
{
  self->_propertiesReceivedFlag = 1;
  [(EPPhoneMigrator *)self update];
}

- (void)propertiesSent
{
  self->_propertiesSentFlag = 1;
  [(EPPhoneMigrator *)self update];
}

- (id)factory
{
  return +[EPFactory sharedFactory];
}

- (void)update
{
  keyTimer = self->_keyTimer;
  sharedKey = self->_sharedKey;
  if (keyTimer)
  {
    if (!sharedKey)
    {
      id v5 = [(EPPhoneMigrator *)self keymaster];
      BOOL v6 = (EPKey *)[v5 newResourceWithDelegate:self];
      id v7 = self->_sharedKey;
      self->_sharedKey = v6;

      sharedKey = self->_sharedKey;
    }
    if ((id)[(EPResource *)sharedKey availability] == (id)1)
    {
      if (!self->_oobKeyGenerator)
      {
        id v8 = [(EPPhoneMigrator *)self factory];
        id v9 = (EPOOBKeyGenerator *)[v8 newKeyGeneratorWithDelegate:self];
        oobKeyGenerator = self->_oobKeyGenerator;
        self->_oobKeyGenerator = v9;

        [(EPServiceRegistry *)self->_serviceRegistry addService:self->_oobKeyGenerator];
      }
      id v11 = [(EPPhoneMigrator *)self oobKeyGenerator];
      id v12 = [v11 availability];

      if (v12 == (id)1)
      {
        v13 = [(EPPhoneMigrator *)self oobKeyGenerator];
        id v14 = [v13 key];

        if (v14)
        {
          long long v15 = objc_opt_new();
          if ([(EPPhoneMigrator *)self checkIfMigrationIsPossible:v15])
          {
            if (self->_currentChallenge) {
              goto LABEL_14;
            }
            id v16 = +[EPKey randomData:32];
            currentChallenge = self->_currentChallenge;
            self->_currentChallenge = v16;

            if ((id)[(NSData *)self->_currentChallenge length] != (id)32)
            {
              v18 = self->_currentChallenge;
              self->_currentChallenge = 0;
            }
            if (self->_currentChallenge)
            {
LABEL_14:
              sub_1000DEB60((uint64_t)v15, v14);
              v19 = [(EPPhoneMigrator *)self currentChallenge];
              sub_1000DEB78((uint64_t)v15, v19);
            }
          }
          v20 = self->_sharedKey;
          v21 = [v15 data];
          v22 = [(EPKey *)v20 encryptPayload:v21];

          if (v22)
          {
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            v23 = self->_migrationReadResponseBlocks;
            id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v46 objects:v50 count:16];
            if (v24)
            {
              id v25 = v24;
              uint64_t v26 = *(void *)v47;
              do
              {
                v27 = 0;
                do
                {
                  if (*(void *)v47 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  (*(void (**)(void))(*(void *)(*((void *)&v46 + 1) + 8 * (void)v27) + 16))();
                  v27 = (char *)v27 + 1;
                }
                while (v25 != v27);
                id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v46 objects:v50 count:16];
              }
              while (v25);
            }

            [(NSMutableArray *)self->_migrationReadResponseBlocks removeAllObjects];
          }
          else
          {
            v31 = sub_1000A3CF0();
            BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

            if (v32)
            {
              v33 = sub_1000A3CF0();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                sub_1000FBD9C(v33);
              }
            }
          }
        }
      }
      else
      {
        v30 = self->_currentChallenge;
        self->_currentChallenge = 0;
      }
    }
  }
  else
  {
    self->_sharedKey = 0;

    [(EPServiceRegistry *)self->_serviceRegistry removeService:self->_oobKeyGenerator];
    v28 = self->_oobKeyGenerator;
    self->_oobKeyGenerator = 0;

    v29 = self->_currentChallenge;
    self->_currentChallenge = 0;

    [(EPPhoneMigrator *)self wipeCharacteristicHandlers];
  }
  if ([(NSMutableArray *)self->_idsAccountPlusDeviceBlocks count]
    && self->_propertiesReceivedFlag
    && self->_propertiesSentFlag
    && self->_bluetoothUUIDReceivedWithAccountAndDevice)
  {
    v34 = sub_1000A3CF0();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

    if (v35)
    {
      v36 = sub_1000A3CF0();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Migration: Calling blocks to alert of end of pairing", buf, 2u);
      }
    }
    v37 = self->_bluetoothUUIDReceivedWithAccountAndDevice;
    id v38 = [(NSMutableArray *)self->_idsAccountPlusDeviceBlocks copy];
    [(NSMutableArray *)self->_idsAccountPlusDeviceBlocks removeAllObjects];
    v39 = [(EPPhoneMigrator *)self queue];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000D8B08;
    v42[3] = &unk_100165530;
    id v43 = v38;
    v44 = v37;
    v40 = v37;
    id v41 = v38;
    dispatch_async(v39, v42);
  }
}

- (void)wipeCharacteristicHandlers
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_migrationReadResponseBlocks;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_migrationReadResponseBlocks removeAllObjects];
}

- (void)phoneMigrationCommitted
{
  v2 = nr_daemon_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = nr_daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "EPPhoneMigrator: phoneMigrationCommitted called, setting status code to NRPairedDeviceRegistryStatusCodeMigrating", v5, 2u);
    }
  }
}

- (void)beginMigrationToDevice:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = (void (**)(void, void))v10;
  if (!self->_powerAssertion)
  {
    self->_watchMigrationComplete = 0;
    watchMigrationCompleteError = self->_watchMigrationCompleteError;
    self->_watchMigrationCompleteError = 0;

    v13 = +[NRDataCollector sharedInstance];
    id v15 = [v13 incrementCounterForKey:@"migrationAttemptCounter"];
    id v16 = +[NRPowerAssertionActivity activityWithName:@"migrationSaga"];
    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = v16;

    if (!self->_unlock)
    {
      v18 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
      v19 = (EPUnlockAssertion *)[v18 newUnlockAssertionWithDelegate:self];
      unlock = self->_unlock;
      self->_unlock = v19;
    }
    pipeManager = self->_pipeManager;
    if (!pipeManager)
    {
      v22 = +[EPScalablePipeManagerManagerFactory sharedPipeManagerManagerFactory];
      v23 = [v22 pipeManagerManagerWithName:@"com.apple.ep" type:1 priority:1];
      id v24 = self->_pipeManager;
      self->_pipeManager = v23;

      pipeManager = self->_pipeManager;
    }
    id v25 = [(EPScalablePipeManagerManager *)pipeManager newManagerWithDelegate:self];
    pipe = self->_pipe;
    self->_pipe = v25;

    id v27 = objc_retainBlock(v11);
    id migrationCompletionBlock = self->_migrationCompletionBlock;
    self->_id migrationCompletionBlock = v27;

    [(EPPhoneMigrator *)self beginRTCMigrationMetricCollection:v8];
    v29 = [EPRoutingSlipEntry alloc];
    uint64_t v30 = objc_opt_class();
    CFStringRef v39 = @"nrDeviceIdentifier";
    v31 = [[EPSagaOperandUUID alloc] initWithUUID:v8];
    v40 = v31;
    BOOL v32 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v33 = [(EPRoutingSlipEntry *)v29 initWithName:@"phoneMigration" transactionClass:v30 operands:v32];

    v34 = objc_opt_new();
    [v34 setRunningStatusCode:4];
    [v34 setOperationType:@"migration"];
    [v34 setTargetPairingID:v8];
    [v34 setEntry:v33];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000D9144;
    v36[3] = &unk_1001698E0;
    v36[4] = self;
    [v34 setDidEnd:v36];
    BOOL v35 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    [v35 addTransaction:v34];

    goto LABEL_9;
  }
  if (v10)
  {
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    CFStringRef v38 = @"Migration attempt while migration already running.";
    id v12 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v13 = +[NSError errorWithDomain:@"com.apple.nanoregistry.EPMigrationAutoTrigger" code:0 userInfo:v12];

    ((void (**)(void, void *))v11)[2](v11, v13);
LABEL_9:
  }
}

- (void)beginRTCMigrationMetricCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D9218;
  v7[3] = &unk_100167DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 grabHistoryWithReadBlock:v7];
}

- (void)finishMigrationWithRoutingSlip:(id)a3
{
  id v4 = a3;
  id v5 = [v4 getLastFirstError];
  id v6 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  id v7 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000D941C;
  v18[3] = &unk_100169908;
  id v8 = v5;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  id v10 = v4;
  id v21 = v10;
  [v6 grabHistoryWithReadBlock:v18];
  id migrationCompletionBlock = (void (**)(id, id))self->_migrationCompletionBlock;
  if (migrationCompletionBlock)
  {
    migrationCompletionBlock[2](migrationCompletionBlock, v8);
    id v12 = self->_migrationCompletionBlock;
    self->_id migrationCompletionBlock = 0;
  }
  pipe = self->_pipe;
  self->_pipe = 0;

  pipeManager = self->_pipeManager;
  self->_pipeManager = 0;

  powerAssertion = self->_powerAssertion;
  self->_powerAssertion = 0;

  unlock = self->_unlock;
  self->_unlock = 0;

  sharedKey = self->_sharedKey;
  self->_sharedKey = 0;
}

- (void)migrationCompletionRequestReceivedWithStatus:(unint64_t)a3
{
  if (!self->_watchMigrationComplete)
  {
    self->_watchMigrationComplete = 1;
    if (a3)
    {
      NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
      CFStringRef v10 = @"Watch migration failed on watch side";
      id v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      id v5 = +[NSError errorWithDomain:@"com.apple.nanoregistry.saga.EPSagaTransactionWaitForWatchCompletionErrorDomain" code:1 userInfo:v4];
      watchMigrationCompleteError = self->_watchMigrationCompleteError;
      self->_watchMigrationCompleteError = v5;
    }
    else
    {
      id v7 = self->_watchMigrationCompleteError;
      self->_watchMigrationCompleteError = 0;
    }
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"EPSagaTransactionMigrationCompletionRequestNotification" object:0];
  }
}

- (void)migrationMetricSessionIDReceivedWithID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_watchMigrationComplete)
  {
    if (v4)
    {
      id v6 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
      [v6 setSessionIDFromRemoteDevice:v5];
    }
    else
    {
      id v7 = nr_daemon_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (!v8) {
        goto LABEL_5;
      }
      id v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)NSErrorUserInfoKey v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "nil session id received from watch", v9, 2u);
      }
    }
  }
LABEL_5:
}

- (BOOL)getWatchMigrationCompletionStatusWithError:(id *)a3
{
  if (a3) {
    *a3 = self->_watchMigrationCompleteError;
  }
  return self->_watchMigrationComplete;
}

- (BOOL)isBusy
{
  return self->_powerAssertion != 0;
}

- (void)createMigrationReporterWithoutPairingIDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D97A0;
  v7[3] = &unk_1001668B0;
  id v8 = v4;
  id v6 = v4;
  [v5 grabRegistryWithReadBlock:v7];
}

- (id)createMigrationReporterWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  if (!v5)
  {
    id v5 = [[NRRTCMigrationReporter alloc] initWithServiceRegistry:self->_serviceRegistry];
    [(EPServiceRegistry *)self->_serviceRegistry addService:v5];
  }
  [(NRRTCMigrationReporter *)v5 setCurrentMigrationID:v4];

  return v5;
}

- (void)getNonAltAccountMigratableDeviceIDsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D9964;
  v7[3] = &unk_100166860;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 grabRegistryWithReadBlock:v7];
}

- (NSString)lastMigrationRequestPhoneName
{
  return self->_lastMigrationRequestPhoneName;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (id)migrationCompletionBlock
{
  return self->_migrationCompletionBlock;
}

- (void)setMigrationCompletionBlock:(id)a3
{
}

- (AbstractTimer)keyTimer
{
  return self->_keyTimer;
}

- (void)setKeyTimer:(id)a3
{
}

- (EPOOBKeyGenerator)oobKeyGenerator
{
  return self->_oobKeyGenerator;
}

- (void)setOobKeyGenerator:(id)a3
{
}

- (NSData)currentChallenge
{
  return self->_currentChallenge;
}

- (void)setCurrentChallenge:(id)a3
{
}

- (NSMutableArray)migrationReadResponseBlocks
{
  return self->_migrationReadResponseBlocks;
}

- (void)setMigrationReadResponseBlocks:(id)a3
{
}

- (NSUUID)expectedIncomingPairingUUID
{
  return self->_expectedIncomingPairingUUID;
}

- (void)setExpectedIncomingPairingUUID:(id)a3
{
}

- (EPKey)sharedKey
{
  return self->_sharedKey;
}

- (void)setSharedKey:(id)a3
{
}

- (NSMutableArray)migrationChallengeResponseBlocks
{
  return self->_migrationChallengeResponseBlocks;
}

- (void)setMigrationChallengeResponseBlocks:(id)a3
{
}

- (NSMutableArray)idsAccountPlusDeviceBlocks
{
  return self->_idsAccountPlusDeviceBlocks;
}

- (void)setIdsAccountPlusDeviceBlocks:(id)a3
{
}

- (NSUUID)bluetoothUUIDReceivedWithAccountAndDevice
{
  return self->_bluetoothUUIDReceivedWithAccountAndDevice;
}

- (void)setBluetoothUUIDReceivedWithAccountAndDevice:(id)a3
{
}

- (BOOL)propertiesReceivedFlag
{
  return self->_propertiesReceivedFlag;
}

- (void)setPropertiesReceivedFlag:(BOOL)a3
{
  self->_propertiesReceivedFlag = a3;
}

- (BOOL)propertiesSentFlag
{
  return self->_propertiesSentFlag;
}

- (void)setPropertiesSentFlag:(BOOL)a3
{
  self->_propertiesSentFlag = a3;
}

- (NRPowerAssertionActivity)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(id)a3
{
}

- (EPNanoRegistryStatusCodeVote)migratingStatusCodeVote
{
  return self->_migratingStatusCodeVote;
}

- (void)setMigratingStatusCodeVote:(id)a3
{
}

- (EPScalablePipeManagerManager)pipeManager
{
  return self->_pipeManager;
}

- (void)setPipeManager:(id)a3
{
}

- (EPScalablePipeManager)pipe
{
  return self->_pipe;
}

- (void)setPipe:(id)a3
{
}

- (EPUnlockAssertion)unlock
{
  return self->_unlock;
}

- (void)setUnlock:(id)a3
{
}

- (BOOL)readyToPair
{
  return self->_readyToPair;
}

- (void)setReadyToPair:(BOOL)a3
{
  self->_readyToPair = a3;
}

- (BOOL)watchMigrationComplete
{
  return self->_watchMigrationComplete;
}

- (void)setWatchMigrationComplete:(BOOL)a3
{
  self->_watchMigrationComplete = a3;
}

- (NSError)watchMigrationCompleteError
{
  return self->_watchMigrationCompleteError;
}

- (void)setWatchMigrationCompleteError:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_watchMigrationCompleteError, 0);
  objc_storeStrong((id *)&self->_unlock, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_migratingStatusCodeVote, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_bluetoothUUIDReceivedWithAccountAndDevice, 0);
  objc_storeStrong((id *)&self->_idsAccountPlusDeviceBlocks, 0);
  objc_storeStrong((id *)&self->_migrationChallengeResponseBlocks, 0);
  objc_storeStrong((id *)&self->_sharedKey, 0);
  objc_storeStrong((id *)&self->_expectedIncomingPairingUUID, 0);
  objc_storeStrong((id *)&self->_migrationReadResponseBlocks, 0);
  objc_storeStrong((id *)&self->_currentChallenge, 0);
  objc_storeStrong((id *)&self->_oobKeyGenerator, 0);
  objc_storeStrong((id *)&self->_keyTimer, 0);
  objc_storeStrong(&self->_migrationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_passcode, 0);

  objc_storeStrong((id *)&self->_lastMigrationRequestPhoneName, 0);
}

@end