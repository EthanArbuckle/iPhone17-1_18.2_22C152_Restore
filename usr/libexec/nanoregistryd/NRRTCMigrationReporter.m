@interface NRRTCMigrationReporter
- (BOOL)setCurrentMigrationID:(id)a3;
- (BRRTCMigrationReportManager)migrationReportManager;
- (EPServiceRegistry)serviceRegistry;
- (NRRTCMigrationReporter)initWithServiceRegistry:(id)a3;
- (NSMutableArray)transactionErrors;
- (NSUUID)currentMigrationPairingID;
- (OS_dispatch_queue)queue;
- (id)_deviceDetailsFromCollectionHistory:(id)a3;
- (id)_migrationMetricKeyFromTransactionName:(id)a3;
- (id)mostRecentError;
- (void)_checkInWithCompletedMigrationTransaction:(id)a3 withSuccess:(BOOL)a4;
- (void)_clearMigrationData;
- (void)_submitRTCMetric;
- (void)addTransactionError:(id)a3;
- (void)checkInWithCompletedMigrationTransaction:(id)a3 routingSlipEntry:(id)a4 forPairingID:(id)a5;
- (void)checkInWithMigrationTransactionRollback:(id)a3 routingSlipEntry:(id)a4 forPairingID:(id)a5;
- (void)fileEarlyMigrationFailure:(unint64_t)a3 withDeviceHistory:(id)a4 forPairingID:(id)a5;
- (void)finishMigrationMetricWithDeviceHistory:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)migrationWillBeginOnCompanionForPairingID:(id)a3;
- (void)migrationWillBeginOnCompanionForPairingID:(id)a3 withDeviceHistory:(id)a4;
- (void)setCurrentMigrationPairingID:(id)a3;
- (void)setMigrationReportManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionIDFromRemoteDevice:(id)a3;
- (void)setTransactionErrors:(id)a3;
@end

@implementation NRRTCMigrationReporter

- (NRRTCMigrationReporter)initWithServiceRegistry:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NRRTCMigrationReporter;
  v6 = [(NRRTCMigrationReporter *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.NRMigrationReport", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_serviceRegistry, a3);
    uint64_t v9 = objc_opt_new();
    transactionErrors = v6->_transactionErrors;
    v6->_transactionErrors = (NSMutableArray *)v9;
  }
  return v6;
}

- (void)migrationWillBeginOnCompanionForPairingID:(id)a3
{
  if (!self->_migrationReportManager)
  {
    id v4 = a3;
    id v5 = (BRRTCMigrationReportManager *)[objc_alloc((Class)BRRTCMigrationReportManager) initWithPairingID:v4];

    migrationReportManager = self->_migrationReportManager;
    self->_migrationReportManager = v5;
  }
  id v7 = [(NRRTCMigrationReporter *)self migrationReportManager];
  [v7 setMigrationBegan:1];
}

- (void)migrationWillBeginOnCompanionForPairingID:(id)a3 withDeviceHistory:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (!self->_migrationReportManager)
  {
    id v7 = (BRRTCMigrationReportManager *)[objc_alloc((Class)BRRTCMigrationReportManager) initWithPairingID:v15];
    migrationReportManager = self->_migrationReportManager;
    self->_migrationReportManager = v7;
  }
  uint64_t v9 = [v6 deviceCollection];
  v10 = [v9 objectForKeyedSubscript:v15];

  v11 = [v10 objectForKeyedSubscript:NRDevicePropertyLastActiveDate];
  objc_super v12 = [v11 value];

  v13 = [(NRRTCMigrationReporter *)self migrationReportManager];
  [v13 setLastActiveDate:v12];

  v14 = [(NRRTCMigrationReporter *)self migrationReportManager];
  [v14 setMigrationBegan:1];
}

- (void)finishMigrationMetricWithDeviceHistory:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100080274;
  v13[3] = &unk_100165C98;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)checkInWithCompletedMigrationTransaction:(id)a3 routingSlipEntry:(id)a4 forPairingID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([(NRRTCMigrationReporter *)self setCurrentMigrationID:v9])
  {
    id v11 = sub_1000A3CF0();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = sub_1000A3CF0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "migration device id unexpectedly changed to %@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  id v14 = NSStringFromClass((Class)[v8 transactionClass]);
  id v15 = [(NRRTCMigrationReporter *)self _migrationMetricKeyFromTransactionName:v14];

  BOOL v16 = [v10 getLastFirstError];

  if (v16)
  {
    v17 = [(NRRTCMigrationReporter *)self mostRecentError];
    uint64_t v18 = (uint64_t)[v16 isEqual:v17];

    if ((v18 & 1) == 0) {
      [(NRRTCMigrationReporter *)self addTransactionError:v16];
    }
  }
  else
  {
    uint64_t v18 = 1;
  }
  [(NRRTCMigrationReporter *)self _checkInWithCompletedMigrationTransaction:v15 withSuccess:v18];
}

- (void)checkInWithMigrationTransactionRollback:(id)a3 routingSlipEntry:(id)a4 forPairingID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(NRRTCMigrationReporter *)self setCurrentMigrationID:v8])
  {
    id v9 = sub_1000A3CF0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = sub_1000A3CF0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "migration device id changed to %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  BOOL v12 = NSStringFromClass((Class)[v7 transactionClass]);
  v13 = [(NRRTCMigrationReporter *)self _migrationMetricKeyFromTransactionName:v12];

  [(NRRTCMigrationReporter *)self _checkInWithCompletedMigrationTransaction:v13 withSuccess:0];
}

- (void)_checkInWithCompletedMigrationTransaction:(id)a3 withSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(NRRTCMigrationReporter *)self migrationReportManager];
  id v7 = [(NRRTCMigrationReporter *)self currentMigrationPairingID];
  [v8 addTransactionPhase:v6 withSuccess:v4 withPairingID:v7];
}

- (void)fileEarlyMigrationFailure:(unint64_t)a3 withDeviceHistory:(id)a4 forPairingID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000808D8;
  v13[3] = &unk_1001683A8;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  unint64_t v16 = a3;
  id v11 = v8;
  id v12 = v9;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)addTransactionError:(id)a3
{
  id v4 = a3;
  id v5 = [(NRRTCMigrationReporter *)self transactionErrors];
  [v5 addObject:v4];
}

- (id)mostRecentError
{
  v2 = [(NRRTCMigrationReporter *)self transactionErrors];
  v3 = [v2 lastObject];

  return v3;
}

- (BOOL)setCurrentMigrationID:(id)a3
{
  id v4 = a3;
  id v5 = [(NRRTCMigrationReporter *)self currentMigrationPairingID];
  if (v5)
  {

LABEL_5:
    [(NRRTCMigrationReporter *)self setCurrentMigrationPairingID:v4];
    BOOL v8 = 1;
    goto LABEL_6;
  }
  id v6 = [(NRRTCMigrationReporter *)self currentMigrationPairingID];
  unsigned __int8 v7 = [v6 isEqual:v4];

  if ((v7 & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (id)_deviceDetailsFromCollectionHistory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 deviceCollection];
  id v5 = [v4 activeDevice];

  id v6 = objc_opt_new();
  unsigned __int8 v7 = [v5 objectForKeyedSubscript:NRDevicePropertyAdvertisedName];
  BOOL v8 = [v7 value];

  id v9 = [v5 pairingID];
  BOOL v10 = [v9 UUIDString];
  id v11 = +[NSString stringWithFormat:@"%@%@", v10, v8];
  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 hash]);

  if (v5)
  {
    v13 = [v5 objectForKeyedSubscript:NRDevicePropertySystemBuildVersion];
    id v14 = [v13 value];
    [v6 setGizmoBuild:v14];

    id v15 = [v5 objectForKeyedSubscript:NRDevicePropertyHWModelString];
    unint64_t v16 = [v15 value];
    [v6 setGizmoHardware:v16];

    v17 = [v3 deviceCollection];
    uint64_t v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 count]);
    [v6 setPairedDeviceCount:v18];

    int v19 = [v5 objectForKeyedSubscript:NRDevicePropertyMaxPairingCompatibilityVersion];
    id v20 = [v19 value];
    [v6 setGizmoMaxPairingVersion:v20];

    v21 = [v5 objectForKeyedSubscript:NRDevicePropertyBuildType];
    v22 = [v21 value];
    [v6 setGizmoBuildType:v22];

    v23 = [v5 objectForKeyedSubscript:NRDevicePropertyEnclosureMaterial];
    v24 = [v23 value];
    [v6 setGizmoEnclosureMaterial:v24];

    if (([v5 isAltAccount] & 1) == 0) {
      [v6 setMigratingDeviceId:v12];
    }
  }
  if (v3)
  {
    v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 switchIndex]);
    [v6 setSwitchCounter:v25];
  }

  return v6;
}

- (void)setSessionIDFromRemoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = nr_framework_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    unsigned __int8 v7 = nr_framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "session id received from remote device", v8, 2u);
    }
  }
  [(NRRTCMigrationReporter *)self setSessionID:v4];
}

- (void)setSessionID:(id)a3
{
  id v4 = a3;
  if (_NRIsInternalInstall())
  {
    id v5 = nr_framework_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      unsigned __int8 v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setting migration metric session id to %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  BOOL v8 = [(NRRTCMigrationReporter *)self migrationReportManager];
  [v8 setSessionID:v4];
}

- (void)_submitRTCMetric
{
  id v3 = [(NRRTCMigrationReporter *)self migrationReportManager];
  [v3 submitMetic];

  [(NRRTCMigrationReporter *)self _clearMigrationData];
}

- (void)_clearMigrationData
{
  self->_migrationReportManager = 0;
  _objc_release_x1();
}

- (id)_migrationMetricKeyFromTransactionName:(id)a3
{
  id v3 = a3;
  id v4 = [v3 substringFromIndex:[@"EPSagaTransaction" length]];

  id v5 = +[NSString stringWithFormat:@"%@%@", @"MigrationPhonePhase", v4];

  return v5;
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (BRRTCMigrationReportManager)migrationReportManager
{
  return self->_migrationReportManager;
}

- (void)setMigrationReportManager:(id)a3
{
}

- (NSMutableArray)transactionErrors
{
  return self->_transactionErrors;
}

- (void)setTransactionErrors:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSUUID)currentMigrationPairingID
{
  return self->_currentMigrationPairingID;
}

- (void)setCurrentMigrationPairingID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMigrationPairingID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transactionErrors, 0);
  objc_storeStrong((id *)&self->_migrationReportManager, 0);

  objc_storeStrong((id *)&self->_serviceRegistry, 0);
}

@end