@interface PCSPairedSyncDelegate
+ (id)sharedSyncDelegate;
- (BOOL)syncingIsRestrictedForPairingID:(id)a3;
- (PCSPairedSyncDelegate)init;
- (PSYInitialSyncStateObserver)stateObserver;
- (PSYSyncCoordinator)coordinator;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
@end

@implementation PCSPairedSyncDelegate

+ (id)sharedSyncDelegate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000115E0;
  block[3] = &unk_100039060;
  block[4] = a1;
  if (qword_100040E50 != -1) {
    dispatch_once(&qword_100040E50, block);
  }
  v2 = (void *)qword_100040E48;
  return v2;
}

- (PCSPairedSyncDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)PCSPairedSyncDelegate;
  v2 = [(PCSPairedSyncDelegate *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.protectedcloudkeysyncing"];
    coordinator = v2->_coordinator;
    v2->_coordinator = (PSYSyncCoordinator *)v3;

    [(PSYSyncCoordinator *)v2->_coordinator setDelegate:v2];
    v5 = (PSYInitialSyncStateObserver *)[objc_alloc((Class)PSYInitialSyncStateObserver) initWithDelegate:v2];
    stateObserver = v2->_stateObserver;
    v2->_stateObserver = v5;
  }
  return v2;
}

- (BOOL)syncingIsRestrictedForPairingID:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = [(PCSPairedSyncDelegate *)self stateObserver];
  if (!v6) {
    __assert_rtn("-[PCSPairedSyncDelegate syncingIsRestrictedForPairingID:]", "PCSPairedSyncDelegate.m", 64, "self.stateObserver");
  }

  v7 = [(PCSPairedSyncDelegate *)self stateObserver];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011844;
  v11[3] = &unk_100039088;
  id v8 = v4;
  id v12 = v8;
  v14 = &v15;
  v9 = v5;
  v13 = v9;
  [v7 requestSyncStateForPairingIdentifier:v8 completion:v11];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v7) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v7;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    [v6 syncSessionType];
    v9 = NSStringfromPSYSyncSessionType();
    int v22 = 138412290;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Beginning %@ sync session", (uint8_t *)&v22, 0xCu);
  }
  v10 = +[PCSDeviceManager sharedManager];
  v11 = [v6 pairingID];
  id v12 = [v10 deviceForPairingID:v11];

  if ([v12 supportsPCSKeySync])
  {
    v13 = +[PCSKeySyncing defaultSyncingManager];
    v14 = [v12 idsDeviceIdentifier];
    uint64_t v15 = [v13 getClientWithIdentifier:v14];

    v16 = (void *)qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v16;
      unsigned int v18 = [v15 isNewWatch];
      int v22 = 138412546;
      v23 = v15;
      __int16 v24 = 1024;
      unsigned int v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found watch: %@ new: %d", (uint8_t *)&v22, 0x12u);
    }
    if ([v12 supportsNewProtocol])
    {
      v19 = +[PCSKeySyncing defaultSyncingManager];
      [v19 updateProtocolVersionIfNeeded:v15];
    }
    v20 = +[PCSSyncing defaultPCSSyncing];
    v21 = [v12 idsDeviceIdentifier];
    [v20 checkSyncingForPeer:v21 force:1];
  }
  [v6 syncDidComplete];
}

- (PSYSyncCoordinator)coordinator
{
  return (PSYSyncCoordinator *)objc_getProperty(self, a2, 8, 1);
}

- (PSYInitialSyncStateObserver)stateObserver
{
  return (PSYInitialSyncStateObserver *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateObserver, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end