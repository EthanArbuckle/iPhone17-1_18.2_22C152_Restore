@interface SOSClient
- (BOOL)SOSMonitorModeSOSIsActive;
- (BOOL)checkEntitlement:(id)a3;
- (SOSAccount)account;
- (id)SOSMonitorModeSOSIsActiveDescription;
- (id)initSOSClientWithAccount:(id)a3;
- (void)SOSMonitorModeDisableSOS;
- (void)SOSMonitorModeEnableSOS;
- (void)SOSMonitorModeSOSIsActiveWithCallback:(id)a3;
- (void)accountStatus:(id)a3;
- (void)assertStashedAccountCredential:(id)a3;
- (void)circleHash:(id)a3;
- (void)circleJoiningBlob:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 applicant:(id)a7 complete:(id)a8;
- (void)getWatchdogParameters:(id)a3;
- (void)ghostBust:(unsigned int)a3 complete:(id)a4;
- (void)ghostBustInfo:(id)a3;
- (void)ghostBustPeriodic:(unsigned int)a3 complete:(id)a4;
- (void)ghostBustTriggerTimed:(unsigned int)a3 complete:(id)a4;
- (void)iCloudIdentityStatus:(id)a3;
- (void)iCloudIdentityStatus_internal:(id)a3;
- (void)importInitialSyncCredentials:(id)a3 complete:(id)a4;
- (void)initialSyncCredentials:(unsigned int)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8;
- (void)joinCircleWithBlob:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 version:(int)a8 complete:(id)a9;
- (void)keyStatusFor:(int)a3 complete:(id)a4;
- (void)kvsPerformanceCounters:(id)a3;
- (void)myPeerInfo:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7;
- (void)rateLimitingPerformanceCounters:(id)a3;
- (void)removeV0Peers:(id)a3;
- (void)rpcTriggerBackup:(id)a3 complete:(id)a4;
- (void)rpcTriggerRingUpdate:(id)a3;
- (void)rpcTriggerSync:(id)a3 complete:(id)a4;
- (void)setAccount:(id)a3;
- (void)setBypass:(BOOL)a3 reply:(id)a4;
- (void)setWatchdogParmeters:(id)a3 complete:(id)a4;
- (void)stashAccountCredential:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8;
- (void)stashedCredentialPublicKey:(id)a3;
- (void)userPublicKey:(id)a3;
- (void)validatedStashedAccountCredential:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7;
@end

@implementation SOSClient

- (void).cxx_destruct
{
}

- (void)setAccount:(id)a3
{
}

- (SOSAccount)account
{
  return (SOSAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBypass:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SOSClient *)self account];
  [v7 setBypass:v4 reply:v6];
}

- (id)SOSMonitorModeSOSIsActiveDescription
{
  v2 = [(SOSClient *)self account];
  v3 = [v2 SOSMonitorModeSOSIsActiveDescription];

  return v3;
}

- (BOOL)SOSMonitorModeSOSIsActive
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100230AB0;
  v5[3] = &unk_100309BA0;
  id v7 = &v8;
  v3 = dispatch_semaphore_create(0);
  id v6 = v3;
  [(SOSClient *)self SOSMonitorModeSOSIsActiveWithCallback:v5];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (void)SOSMonitorModeSOSIsActiveWithCallback:(id)a3
{
  id v4 = a3;
  v5 = [(SOSClient *)self account];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100230B78;
  v7[3] = &unk_100309B78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performTransaction:v7];
}

- (void)SOSMonitorModeEnableSOS
{
  v3 = [(SOSClient *)self account];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100230CB0;
  v4[3] = &unk_100309B28;
  v4[4] = self;
  [v3 performTransaction:v4];
}

- (void)SOSMonitorModeDisableSOS
{
  v3 = [(SOSClient *)self account];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100230D7C;
  v4[3] = &unk_100309B28;
  v4[4] = self;
  [v3 performTransaction:v4];
}

- (void)removeV0Peers:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 removeV0Peers:v4];
}

- (void)iCloudIdentityStatus_internal:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 iCloudIdentityStatus_internal:v4];
}

- (void)rpcTriggerRingUpdate:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(SOSClient *)self SOSMonitorModeSOSIsActive])
  {
    id v6 = [(SOSClient *)self account];
    [v6 rpcTriggerRingUpdate:v4];
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:kSOSErrorDomain code:10 userInfo:&__NSDictionary0__struct];
    v4[2](v4);
  }
}

- (void)rpcTriggerBackup:(id)a3 complete:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, id))a4;
  if ([(SOSClient *)self SOSMonitorModeSOSIsActive])
  {
    id v7 = [(SOSClient *)self account];
    [v7 rpcTriggerBackup:v9 complete:v6];
  }
  else
  {
    id v8 = objc_alloc((Class)NSError);
    id v7 = [v8 initWithDomain:kSOSErrorDomain code:10 userInfo:&__NSDictionary0__struct];
    v6[2](v6, v7);
  }
}

- (void)keyStatusFor:(int)a3 complete:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(SOSClient *)self account];
  [v7 keyStatusFor:v4 complete:v6];
}

- (void)accountStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 accountStatus:v4];
}

- (void)iCloudIdentityStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 iCloudIdentityStatus:v4];
}

- (void)ghostBustInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 ghostBustInfo:v4];
}

- (void)ghostBustPeriodic:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(SOSClient *)self account];
  [v7 ghostBustPeriodic:v4 complete:v6];
}

- (void)ghostBustTriggerTimed:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(SOSClient *)self account];
  [v7 ghostBustTriggerTimed:v4 complete:v6];
}

- (void)ghostBust:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(SOSClient *)self account];
  [v7 ghostBust:v4 complete:v6];
}

- (void)setWatchdogParmeters:(id)a3 complete:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SOSClient *)self account];
  [v8 setWatchdogParmeters:v7 complete:v6];
}

- (void)getWatchdogParameters:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 getWatchdogParameters:v4];
}

- (void)rpcTriggerSync:(id)a3 complete:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  if ([(SOSClient *)self SOSMonitorModeSOSIsActive])
  {
    id v7 = [(SOSClient *)self account];
    [v7 rpcTriggerSync:v8 complete:v6];
  }
  else
  {
    v6[2](v6, 1, 0);
  }
}

- (void)importInitialSyncCredentials:(id)a3 complete:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if ([(SOSClient *)self checkEntitlement:@"com.apple.private.security.initial-sync"])
  {
    id v7 = [(SOSClient *)self account];
    [v7 importInitialSyncCredentials:v8 complete:v6];
  }
  else
  {
    id v7 = +[NSError errorWithDomain:kSOSErrorDomain code:7 userInfo:0];
    v6[2](v6, 0, v7);
  }
}

- (void)initialSyncCredentials:(unsigned int)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  BOOL v9 = a7;
  uint64_t v12 = *(void *)&a3;
  id v18 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void *, void *))a8;
  if ([(SOSClient *)self checkEntitlement:@"com.apple.private.security.initial-sync"])
  {
    v17 = [(SOSClient *)self account];
    [v17 initialSyncCredentials:v12 altDSID:v18 flowID:v14 deviceSessionID:v15 canSendMetrics:v9 complete:v16];
  }
  else
  {
    v17 = +[NSError errorWithDomain:kSOSErrorDomain code:7 userInfo:0];
    v16[2](v16, &__NSArray0__struct, v17);
  }
}

- (void)joinCircleWithBlob:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 version:(int)a8 complete:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  BOOL v10 = a7;
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [(SOSClient *)self account];
  [v21 joinCircleWithBlob:v20 altDSID:v19 flowID:v18 deviceSessionID:v17 canSendMetrics:v10 version:v9 complete:v16];
}

- (void)circleJoiningBlob:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 applicant:(id)a7 complete:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(SOSClient *)self account];
  [v19 circleJoiningBlob:v18 flowID:v17 deviceSessionID:v16 canSendMetrics:v9 applicant:v15 complete:v14];
}

- (void)circleHash:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 circleHash:v4];
}

- (void)myPeerInfo:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(SOSClient *)self account];
  [v16 myPeerInfo:v15 flowID:v14 deviceSessionID:v13 canSendMetrics:v7 complete:v12];
}

- (void)stashAccountCredential:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(SOSClient *)self account];
  [v19 stashAccountCredential:v18 altDSID:v17 flowID:v16 deviceSessionID:v15 canSendMetrics:v8 complete:v14];
}

- (void)validatedStashedAccountCredential:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(SOSClient *)self account];
  [v16 validatedStashedAccountCredential:v15 flowID:v14 deviceSessionID:v13 canSendMetrics:v7 complete:v12];
}

- (void)assertStashedAccountCredential:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 assertStashedAccountCredential:v4];
}

- (void)stashedCredentialPublicKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 stashedCredentialPublicKey:v4];
}

- (void)rateLimitingPerformanceCounters:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 rateLimitingPerformanceCounters:v4];
}

- (void)kvsPerformanceCounters:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 kvsPerformanceCounters:v4];
}

- (void)userPublicKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSClient *)self account];
  [v5 userPublicKey:v4];
}

- (BOOL)checkEntitlement:(id)a3
{
  return 1;
}

- (id)initSOSClientWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOSClient;
  id v6 = [(SOSClient *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

@end