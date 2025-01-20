@interface BYDaemonGeneralClientConnection
+ (id)daemonProtocolInterface;
- (BYDaemonGeneralClientConnection)initWithConnection:(id)a3 flowSkipController:(id)a4;
- (BYFlowSkipController)flowSkipController;
- (__MKBAssertion)deviceLockAssertion;
- (void)attemptSettingsUploadForAttempt:(unint64_t)a3 maxNumberOfAttempts:(unint64_t)a4 queue:(id)a5 completion:(id)a6;
- (void)backupMetadata:(id)a3;
- (void)cancelDataMigratorDeferredExit:(id)a3;
- (void)deferDataMigratorExit:(id)a3;
- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5 completion:(id)a6;
- (void)ensureShortLivedTokenUpgrade:(id)a3;
- (void)ensureSilentLoginUpgrade:(id)a3;
- (void)fetchAuthenticationContextForApplePay:(id)a3;
- (void)fetchAuthenticationContextForBiometric:(id)a3;
- (void)migrateWithStoredMigratorVersion:(unsigned int)a3 userDataDisposition:(unsigned int)a4;
- (void)observeFinishSetupTriggers:(id)a3;
- (void)performSilentICDPUpgrade:(id)a3;
- (void)setDeviceLockAssertion:(__MKBAssertion *)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setupAssistantNeedsToRun:(id)a3;
- (void)startExpressSettingsUpload;
- (void)storeAuthenticationContextforApplyPay:(id)a3 completion:(id)a4;
- (void)storeAuthenticationContextforBiometric:(id)a3 completion:(id)a4;
@end

@implementation BYDaemonGeneralClientConnection

- (BYDaemonGeneralClientConnection)initWithConnection:(id)a3 flowSkipController:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYDaemonGeneralClientConnection;
  v8 = [(BYDaemonClientConnection *)&v11 initWithConnection:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_flowSkipController, a4);
    if (qword_100024D20 != -1) {
      dispatch_once(&qword_100024D20, &stru_10001C870);
    }
  }

  return v9;
}

+ (id)daemonProtocolInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BYDaemonGeneralProtocol];
}

- (void)setDeviceLockAssertion:(__MKBAssertion *)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000071AC;
  block[3] = &unk_10001C598;
  block[4] = a3;
  dispatch_sync((dispatch_queue_t)qword_100024D28, block);
}

- (__MKBAssertion)deviceLockAssertion
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007268;
  block[3] = &unk_10001C560;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100024D28, block);
  v2 = (__MKBAssertion *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setupAssistantNeedsToRun:(id)a3
{
  id v5 = a3;
  uint64_t v3 = Daemon_BYSetupAssistantNeedsToRun();
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, v3);
    v4 = v5;
  }
}

- (void)ensureSilentLoginUpgrade:(id)a3
{
  id v5 = a3;
  uint64_t v3 = +[BYSilentLoginUpgradeGuarantor sharedInstance];
  [v3 blockUntilSilentLoginUpgradeCompletes];

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (void)ensureShortLivedTokenUpgrade:(id)a3
{
  id v5 = a3;
  uint64_t v3 = +[BYSilentLoginUpgradeGuarantor sharedInstance];
  [v3 blockUntilShortLivedTokenUpgradeCompletes];

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (void)backupMetadata:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007460;
    block[3] = &unk_10001C898;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

- (void)observeFinishSetupTriggers:(id)a3
{
  v4 = (void (**)(void))a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1000075EC;
  v7[4] = sub_1000075FC;
  id v8 = (id)os_transaction_create();
  if (v4) {
    v4[2](v4);
  }
  id v5 = dispatch_get_global_queue(21, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007604;
  v6[3] = &unk_10001C8C0;
  v6[4] = self;
  v6[5] = v7;
  dispatch_async(v5, v6);

  _Block_object_dispose(v7, 8);
}

- (void)performSilentICDPUpgrade:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007708;
  block[3] = &unk_10001C898;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)deferDataMigratorExit:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(21, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007828;
  v7[3] = &unk_10001C8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)cancelDataMigratorDeferredExit:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(21, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007C60;
  v7[3] = &unk_10001C8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5 completion:(id)a6
{
  id v14 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = +[BYDaemonBetaReEnrollmentManager sharedInstance];
  [v12 enrollInSeedProgramNamed:v11 withAssetAudience:v10 programID:v9];

  v13 = v14;
  if (v14)
  {
    (*((void (**)(id))v14 + 2))(v14);
    v13 = v14;
  }
}

- (void)storeAuthenticationContextforApplyPay:(id)a3 completion:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(BYDaemonClientConnection *)self context];
  [v7 setApplePayAuthenticationContext:v6];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

- (void)fetchAuthenticationContextForApplePay:(id)a3
{
  id v5 = a3;
  id v7 = [(BYDaemonClientConnection *)self context];
  id v6 = [v7 applePayAuthenticationContext];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)storeAuthenticationContextforBiometric:(id)a3 completion:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(BYDaemonClientConnection *)self context];
  [v7 setBiometricAuthenticationContext:v6];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

- (void)fetchAuthenticationContextForBiometric:(id)a3
{
  id v5 = a3;
  id v7 = [(BYDaemonClientConnection *)self context];
  id v6 = [v7 biometricAuthenticationContext];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)startExpressSettingsUpload
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1000075EC;
  v7[4] = sub_1000075FC;
  id v8 = (id)os_transaction_create();
  dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000082D4;
  block[3] = &unk_10001C728;
  void block[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v7;
  id v3 = v5;
  dispatch_async(v3, block);

  _Block_object_dispose(v7, 8);
}

- (void)migrateWithStoredMigratorVersion:(unsigned int)a3 userDataDisposition:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_alloc_init(BYDaemonDataMigrator);
  [(BYDaemonDataMigrator *)v6 migrateWithStoredMigratorVersion:v5 userDataDisposition:v4];
}

- (void)attemptSettingsUploadForAttempt:(unint64_t)a3 maxNumberOfAttempts:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  dispatch_assert_queue_V2(v10);
  id v12 = objc_alloc_init((Class)SASExpressCloudSettings);
  v13 = +[BYExpressCloudSettings createExpressSettingsWithQueue:v10];
  id v14 = _BYLoggingFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating express settings...", buf, 2u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000085BC;
  v17[3] = &unk_10001C960;
  id v20 = v11;
  unint64_t v21 = a3;
  unint64_t v22 = a4;
  v18 = v10;
  v19 = self;
  v15 = v10;
  id v16 = v11;
  [v12 updateSettings:v13 withCompletion:v17];
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end