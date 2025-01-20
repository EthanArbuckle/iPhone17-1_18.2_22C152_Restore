@interface WCDPairedSyncManager
- (BOOL)handlePotentialPairedSyncForComplicationsFailedWithIdentifier:(id)a3 error:(id)a4;
- (NSMutableDictionary)identifiersToSyncSessions;
- (NSString)state;
- (OS_os_transaction)syncTransaction;
- (PSYSyncCoordinator)coordinator;
- (WCDPairedSyncManager)init;
- (void)handlePairedSyncForComplicationsAckWithIdentifier:(id)a3 success:(BOOL)a4;
- (void)setCoordinator:(id)a3;
- (void)setIdentifiersToSyncSessions:(id)a3;
- (void)setSyncTransaction:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
@end

@implementation WCDPairedSyncManager

- (WCDPairedSyncManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WCDPairedSyncManager;
  v2 = [(WCDPairedSyncManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    identifiersToSyncSessions = v2->_identifiersToSyncSessions;
    v2->_identifiersToSyncSessions = (NSMutableDictionary *)v3;

    uint64_t v5 = [(objc_class *)off_1000513F8() syncCoordinatorWithServiceName:@"com.apple.pairedsync.watchconnectivity.complications"];
    coordinator = v2->_coordinator;
    v2->_coordinator = (PSYSyncCoordinator *)v5;

    [(PSYSyncCoordinator *)v2->_coordinator setDelegate:v2];
  }
  return v2;
}

- (NSString)state
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  NSAppendPrintF();
  id v5 = v4;

  v10 = [(WCDPairedSyncManager *)self coordinator];
  NSAppendPrintF();
  id v6 = v5;

  v11 = [(WCDPairedSyncManager *)self identifiersToSyncSessions];
  NSAppendPrintF();
  id v7 = v6;

  return (NSString *)v7;
}

- (void)handlePairedSyncForComplicationsAckWithIdentifier:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(WCDPairedSyncManager *)self identifiersToSyncSessions];
  objc_super v8 = [v7 objectForKeyedSubscript:v6];

  v9 = wc_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v4)
    {
      if (v10)
      {
        int v11 = 138543362;
        id v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ sync completed", (uint8_t *)&v11, 0xCu);
      }

      [v8 syncDidComplete];
    }
    else
    {
      if (v10)
      {
        int v11 = 138543362;
        id v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ sync failed or got cancelled", (uint8_t *)&v11, 0xCu);
      }

      [v8 syncDidFailWithError:0];
    }
    v9 = [(WCDPairedSyncManager *)self identifiersToSyncSessions];
    [v9 removeObjectForKey:v6];
  }
  else if (v10)
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "unknown sync session identifier %{public}@", (uint8_t *)&v11, 0xCu);
  }
}

- (BOOL)handlePotentialPairedSyncForComplicationsFailedWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(WCDPairedSyncManager *)self identifiersToSyncSessions];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    BOOL v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sync failed or got cancelled", (uint8_t *)&v12, 0xCu);
    }

    [v9 syncDidFailWithError:v7];
  }

  return v9 != 0;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  id v6 = [v5 sessionIdentifier];
  id v7 = [v6 UUIDString];

  objc_super v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  v9 = [(WCDPairedSyncManager *)self identifiersToSyncSessions];
  [v9 setObject:v5 forKeyedSubscript:v7];

  id v10 = [@"com.apple.pairedsync.watchconnectivity.complications" stringByAppendingFormat:@"-%@", v7];
  [v10 UTF8String];
  int v11 = (void *)os_transaction_create();
  [(WCDPairedSyncManager *)self setSyncTransaction:v11];

  int v12 = +[WatchConnectivityDaemon sharedDaemon];
  [v12 sendPairedSyncForComplicationsStartedWithIdentifier:v7];
}

- (OS_os_transaction)syncTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSyncTransaction:(id)a3
{
}

- (PSYSyncCoordinator)coordinator
{
  return (PSYSyncCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (NSMutableDictionary)identifiersToSyncSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifiersToSyncSessions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToSyncSessions, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_syncTransaction, 0);
}

@end