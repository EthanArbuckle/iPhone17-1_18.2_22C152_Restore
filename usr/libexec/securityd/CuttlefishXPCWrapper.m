@interface CuttlefishXPCWrapper
+ (BOOL)retryable:(id)a3;
- (CuttlefishXPCWrapper)initWithCuttlefishXPCConnection:(id)a3;
- (NSXPCProxyCreating)cuttlefishXPCConnection;
- (void)attemptPreapprovedJoinWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7;
- (void)createCustodianRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 uuid:(id)a7 kind:(int)a8 reply:(id)a9;
- (void)departByDistrustingSelfWithSpecificUser:(id)a3 reply:(id)a4;
- (void)distrustPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)dropPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)dumpWithSpecificUser:(id)a3 reply:(id)a4;
- (void)establishWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7;
- (void)fetchAccountSettingsWithSpecificUser:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5;
- (void)fetchAllowedMachineIDsWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchCurrentItemWithSpecificUser:(id)a3 items:(id)a4 reply:(id)a5;
- (void)fetchCurrentPolicyWithSpecificUser:(id)a3 modelIDOverride:(id)a4 isInheritedAccount:(BOOL)a5 reply:(id)a6;
- (void)fetchEgoEpochWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchEscrowContentsWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchPCSIdentityByPublicKeyWithSpecificUser:(id)a3 pcsservices:(id)a4 reply:(id)a5;
- (void)fetchPolicyDocumentsWithSpecificUser:(id)a3 versions:(id)a4 reply:(id)a5;
- (void)fetchRecoverableTLKSharesWithSpecificUser:(id)a3 peerID:(id)a4 reply:(id)a5;
- (void)fetchTrustStateWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchTrustedPeerCountWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchViableBottlesWithSpecificUser:(id)a3 source:(int64_t)a4 flowID:(id)a5 deviceSessionID:(id)a6 reply:(id)a7;
- (void)fetchViableEscrowRecordsWithSpecificUser:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)findCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)getSupportAppInfoWithSpecificUser:(id)a3 reply:(id)a4;
- (void)handleEvictedMachineIDsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5;
- (void)handleRemovedMachineIDsDueToUnknownReasonsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5;
- (void)honorIDMSListChangesForSpecificUser:(id)a3 reply:(id)a4;
- (void)isRecoveryKeySet:(id)a3 reply:(id)a4;
- (void)joinWithSpecificUser:(id)a3 voucherData:(id)a4 voucherSig:(id)a5 ckksKeys:(id)a6 tlkShares:(id)a7 preapprovedKeys:(id)a8 flowID:(id)a9 deviceSessionID:(id)a10 canSendMetrics:(BOOL)a11 reply:(id)a12;
- (void)localResetWithSpecificUser:(id)a3 reply:(id)a4;
- (void)markTrustedDeviceListFetchFailed:(id)a3 reply:(id)a4;
- (void)octagonContainsDistrustedRecoveryKeysWithSpecificUser:(id)a3 reply:(id)a4;
- (void)octagonPeerIDGivenBottleIDWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)performATOPRVActionsWithSpecificUser:(id)a3 reply:(id)a4;
- (void)performCKServerUnreadableDataRemovalWithSpecificUser:(id)a3 isGuitarfish:(BOOL)a4 internalAccount:(BOOL)a5 demoAccount:(BOOL)a6 reply:(id)a7;
- (void)pingWithReply:(id)a3;
- (void)preflightPreapprovedJoinWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5;
- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6;
- (void)preflightVouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)preflightVouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 reply:(id)a5;
- (void)preflightVouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6;
- (void)prepareInheritancePeerWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 signingPrivKeyPersistentRef:(id)a16 encPrivKeyPersistentRef:(id)a17 crk:(id)a18 reply:(id)a19;
- (void)prepareWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 setting:(id)a16 signingPrivKeyPersistentRef:(id)a17 encPrivKeyPersistentRef:(id)a18 reply:(id)a19;
- (void)recoverTLKSharesForInheritorWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)removeCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeEscrowCacheWithSpecificUser:(id)a3 reply:(id)a4;
- (void)removeRecoveryKey:(id)a3 reply:(id)a4;
- (void)requestHealthCheckWithSpecificUser:(id)a3 requiresEscrowCheck:(BOOL)a4 repair:(BOOL)a5 knownFederations:(id)a6 flowID:(id)a7 deviceSessionID:(id)a8 reply:(id)a9;
- (void)resetAccountCDPContentsWithSpecificUser:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 internalAccount:(BOOL)a7 demoAccount:(BOOL)a8 reply:(id)a9;
- (void)resetWithSpecificUser:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 internalAccount:(BOOL)a8 demoAccount:(BOOL)a9 isGuitarfish:(BOOL)a10 accountType:(int64_t)a11 reply:(id)a12;
- (void)setAllowedMachineIDsWithSpecificUser:(id)a3 allowedMachineIDs:(id)a4 userInitiatedRemovals:(id)a5 evictedRemovals:(id)a6 unknownReasonRemovals:(id)a7 honorIDMSListChanges:(BOOL)a8 version:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 altDSID:(id)a13 trustedDeviceHash:(id)a14 deletedDeviceHash:(id)a15 trustedDevicesUpdateTimestamp:(id)a16 reply:(id)a17;
- (void)setPreapprovedKeysWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5;
- (void)setRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 reply:(id)a7;
- (void)testSemaphoreWithSpecificUser:(id)a3 arg:(id)a4 reply:(id)a5;
- (void)trustStatusWithSpecificUser:(id)a3 reply:(id)a4;
- (void)trustedDeviceNamesByPeerIDWithSpecificUser:(id)a3 reply:(id)a4;
- (void)updateTLKsWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)updateWithSpecificUser:(id)a3 forceRefetch:(BOOL)a4 deviceName:(id)a5 serialNumber:(id)a6 osVersion:(id)a7 policyVersion:(id)a8 policySecrets:(id)a9 syncUserControllableViews:(id)a10 secureElementIdentity:(id)a11 walrusSetting:(id)a12 webAccess:(id)a13 reply:(id)a14;
- (void)vouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 entropy:(id)a5 bottleSalt:(id)a6 tlkShares:(id)a7 reply:(id)a8;
- (void)vouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)vouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)vouchWithRerollWithSpecificUser:(id)a3 oldPeerID:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)vouchWithSpecificUser:(id)a3 peerID:(id)a4 permanentInfo:(id)a5 permanentInfoSig:(id)a6 stableInfo:(id)a7 stableInfoSig:(id)a8 ckksKeys:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 reply:(id)a13;
@end

@implementation CuttlefishXPCWrapper

- (void).cxx_destruct
{
}

- (NSXPCProxyCreating)cuttlefishXPCConnection
{
  return (NSXPCProxyCreating *)objc_getProperty(self, a2, 8, 1);
}

- (void)performCKServerUnreadableDataRemovalWithSpecificUser:(id)a3 isGuitarfish:(BOOL)a4 internalAccount:(BOOL)a5 demoAccount:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  v12 = &v25;
  id v13 = a3;
  id v14 = a7;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  do
  {
    char *v12 = 0;
    v15 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002D3F8;
    v18[3] = &unk_1002F7D80;
    v20 = v26;
    v18[4] = self;
    v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v18];
    [v17 performCKServerUnreadableDataRemovalWithSpecificUser:v13 isGuitarfish:v10 internalAccount:v9 demoAccount:v8 reply:v16];

    v12 = (char *)(v23 + 3);
  }
  while (*((unsigned char *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)fetchPCSIdentityByPublicKeyWithSpecificUser:(id)a3 pcsservices:(id)a4 reply:(id)a5
{
  BOOL v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *BOOL v8 = 0;
    v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002D754;
    v15[3] = &unk_1002F7D80;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 fetchPCSIdentityByPublicKeyWithSpecificUser:v9 pcsservices:v10 reply:v13];

    BOOL v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)fetchCurrentItemWithSpecificUser:(id)a3 items:(id)a4 reply:(id)a5
{
  BOOL v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *BOOL v8 = 0;
    v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002DAB8;
    v15[3] = &unk_1002F7D80;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 fetchCurrentItemWithSpecificUser:v9 items:v10 reply:v13];

    BOOL v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)octagonContainsDistrustedRecoveryKeysWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002DE04;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 octagonContainsDistrustedRecoveryKeysWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchTrustedPeerCountWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002E14C;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 fetchTrustedPeerCountWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  do
  {
    *id v10 = 0;
    v15 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002E4C4;
    v18[3] = &unk_1002F7D80;
    v20 = v26;
    v18[4] = self;
    int v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v18];
    [v17 preflightRecoverOctagonUsingRecoveryKey:v11 recoveryKey:v12 salt:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }
  while (*((unsigned char *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)testSemaphoreWithSpecificUser:(id)a3 arg:(id)a4 reply:(id)a5
{
  v5 = (void (**)(id, void *))a5;
  v6 = sub_10000B070("SecError");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "octagon: testing TPH semaphore handling unsupported from within securityd", v8, 2u);
  }

  id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 userInfo:0];
  v5[2](v5, v7);
}

- (void)performATOPRVActionsWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002E8C8;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 performATOPRVActionsWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002EC0C;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 removeRecoveryKey:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002EF54;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 isRecoveryKeySet:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)recoverTLKSharesForInheritorWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  do
  {
    *id v10 = 0;
    v15 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002F2CC;
    v18[3] = &unk_1002F7D80;
    v20 = v26;
    v18[4] = self;
    int v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v18];
    [v17 recoverTLKSharesForInheritorWithSpecificUser:v11 crk:v12 tlkShares:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }
  while (*((unsigned char *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)prepareInheritancePeerWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 signingPrivKeyPersistentRef:(id)a16 encPrivKeyPersistentRef:(id)a17 crk:(id)a18 reply:(id)a19
{
  uint64_t v24 = &v52;
  id v44 = a3;
  id v43 = a5;
  id v42 = a6;
  id v41 = a7;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v37 = a11;
  id v36 = a12;
  id v35 = a13;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  int v54 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = -86;
  do
  {
    *uint64_t v24 = 0;
    v30 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10002F784;
    v45[3] = &unk_1002F7D80;
    v47 = v53;
    v45[4] = self;
    v48 = &v49;
    id v31 = v29;
    id v46 = v31;
    v32 = [v30 synchronousRemoteObjectProxyWithErrorHandler:v45];
    LODWORD(v33) = a14;
    objc_msgSend(v32, "prepareInheritancePeerWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:crk:reply:", v44, a4, v43, v42, v41, v40, v39, v38, v37, v36, v35, v33, v25, v26, v27,
      v28,
      v31);

    uint64_t v24 = (char *)(v50 + 3);
  }
  while (*((unsigned char *)v50 + 24));
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);
}

- (void)fetchAccountSettingsWithSpecificUser:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = &v21;
  id v9 = a3;
  id v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = -86;
  do
  {
    *id v8 = 0;
    id v11 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002FAF0;
    v14[3] = &unk_1002F7D80;
    id v16 = v22;
    v14[4] = self;
    v17 = &v18;
    id v12 = v10;
    id v15 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v14];
    [v13 fetchAccountSettingsWithSpecificUser:v9 forceFetch:v6 reply:v12];

    id v8 = (char *)(v19 + 3);
  }
  while (*((unsigned char *)v19 + 24));
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
}

- (void)fetchRecoverableTLKSharesWithSpecificUser:(id)a3 peerID:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002FE50;
    v15[3] = &unk_1002F7D80;
    v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 fetchRecoverableTLKSharesWithSpecificUser:v9 peerID:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)resetAccountCDPContentsWithSpecificUser:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 internalAccount:(BOOL)a7 demoAccount:(BOOL)a8 reply:(id)a9
{
  BOOL v21 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = &v30;
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  int v32 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = -86;
  do
  {
    *id v14 = 0;
    uint64_t v18 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000301E4;
    void v23[3] = &unk_1002F7D80;
    id v25 = v31;
    v23[4] = self;
    id v26 = &v27;
    id v19 = v17;
    id v24 = v19;
    uint64_t v20 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v23];
    [v20 resetAccountCDPContentsWithSpecificUser:v22 idmsTargetContext:v15 idmsCuttlefishPassword:v16 notifyIdMS:v10 internalAccount:v9 demoAccount:v21 reply:v19];

    id v14 = (char *)(v28 + 3);
  }
  while (*((unsigned char *)v28 + 24));
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);
}

- (void)removeEscrowCacheWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    BOOL v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100030528;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 removeEscrowCacheWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchViableEscrowRecordsWithSpecificUser:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = &v21;
  id v9 = a3;
  id v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = -86;
  do
  {
    *id v8 = 0;
    id v11 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100030878;
    v14[3] = &unk_1002F7D80;
    uint64_t v16 = v22;
    v14[4] = self;
    id v17 = &v18;
    id v12 = v10;
    id v15 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v14];
    [v13 fetchViableEscrowRecordsWithSpecificUser:v9 source:a4 reply:v12];

    id v8 = (char *)(v19 + 3);
  }
  while (*((unsigned char *)v19 + 24));
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
}

- (void)getSupportAppInfoWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100030BC0;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 getSupportAppInfoWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)requestHealthCheckWithSpecificUser:(id)a3 requiresEscrowCheck:(BOOL)a4 repair:(BOOL)a5 knownFederations:(id)a6 flowID:(id)a7 deviceSessionID:(id)a8 reply:(id)a9
{
  BOOL v12 = a5;
  BOOL v13 = a4;
  id v15 = &v31;
  id v23 = a3;
  id v22 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  int v33 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = -86;
  do
  {
    char *v15 = 0;
    char v19 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100030F60;
    v24[3] = &unk_1002F7D80;
    id v26 = v32;
    v24[4] = self;
    uint64_t v27 = &v28;
    id v20 = v18;
    id v25 = v20;
    int v21 = [v19 synchronousRemoteObjectProxyWithErrorHandler:v24];
    [v21 requestHealthCheckWithSpecificUser:v23 requiresEscrowCheck:v13 repair:v12 knownFederations:v22 flowID:v16 deviceSessionID:v17 reply:v20];

    id v15 = (char *)(v29 + 3);
  }
  while (*((unsigned char *)v29 + 24));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
}

- (void)findCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    BOOL v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000312C0;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 findCustodianRecoveryKeyWithSpecificUser:v9 uuid:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)removeCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    BOOL v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100031620;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 removeCustodianRecoveryKeyWithSpecificUser:v9 uuid:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)createCustodianRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 uuid:(id)a7 kind:(int)a8 reply:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  id v15 = &v32;
  id v24 = a3;
  id v23 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  int v34 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = -86;
  do
  {
    char *v15 = 0;
    id v20 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000319C8;
    v25[3] = &unk_1002F7D80;
    uint64_t v27 = v33;
    v25[4] = self;
    uint64_t v28 = &v29;
    id v21 = v19;
    id v26 = v21;
    char v22 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v25];
    [v22 createCustodianRecoveryKeyWithSpecificUser:v24 recoveryKey:v23 salt:v16 ckksKeys:v17 uuid:v18 kind:v9 reply:v21];

    id v15 = (char *)(v30 + 3);
  }
  while (*((unsigned char *)v30 + 24));
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);
}

- (void)setRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 reply:(id)a7
{
  BOOL v12 = &v28;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = -86;
  do
  {
    char *v12 = 0;
    id v18 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100031D58;
    v21[3] = &unk_1002F7D80;
    id v23 = v29;
    v21[4] = self;
    id v24 = &v25;
    id v19 = v17;
    id v22 = v19;
    id v20 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v21];
    [v20 setRecoveryKeyWithSpecificUser:v13 recoveryKey:v14 salt:v15 ckksKeys:v16 reply:v19];

    BOOL v12 = (char *)(v26 + 3);
  }
  while (*((unsigned char *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)fetchTrustStateWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    uint64_t v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000320A0;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 fetchTrustStateWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchCurrentPolicyWithSpecificUser:(id)a3 modelIDOverride:(id)a4 isInheritedAccount:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = &v24;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = -86;
  do
  {
    *id v10 = 0;
    id v14 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100032410;
    v17[3] = &unk_1002F7D80;
    char v19 = v25;
    v17[4] = self;
    id v20 = &v21;
    id v15 = v13;
    id v18 = v15;
    uint64_t v16 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v17];
    [v16 fetchCurrentPolicyWithSpecificUser:v11 modelIDOverride:v12 isInheritedAccount:v7 reply:v15];

    id v10 = (char *)(v22 + 3);
  }
  while (*((unsigned char *)v22 + 24));
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);
}

- (void)fetchPolicyDocumentsWithSpecificUser:(id)a3 versions:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100032774;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 fetchPolicyDocumentsWithSpecificUser:v9 versions:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)fetchEscrowContentsWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100032ABC;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 fetchEscrowContentsWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchViableBottlesWithSpecificUser:(id)a3 source:(int64_t)a4 flowID:(id)a5 deviceSessionID:(id)a6 reply:(id)a7
{
  id v12 = &v27;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  int v29 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = -86;
  do
  {
    char *v12 = 0;
    id v17 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100032E44;
    void v20[3] = &unk_1002F7D80;
    char v22 = v28;
    v20[4] = self;
    uint64_t v23 = &v24;
    id v18 = v16;
    id v21 = v18;
    char v19 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v20];
    [v19 fetchViableBottlesWithSpecificUser:v13 source:a4 flowID:v14 deviceSessionID:v15 reply:v18];

    id v12 = (char *)(v25 + 3);
  }
  while (*((unsigned char *)v25 + 24));
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v28, 8);
}

- (void)updateTLKsWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  do
  {
    *id v10 = 0;
    id v15 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000331C0;
    v18[3] = &unk_1002F7D80;
    id v20 = v26;
    v18[4] = self;
    id v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v18];
    [v17 updateTLKsWithSpecificUser:v11 ckksKeys:v12 tlkShares:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }
  while (*((unsigned char *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)setPreapprovedKeysWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100033520;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 setPreapprovedKeysWithSpecificUser:v9 preapprovedKeys:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)updateWithSpecificUser:(id)a3 forceRefetch:(BOOL)a4 deviceName:(id)a5 serialNumber:(id)a6 osVersion:(id)a7 policyVersion:(id)a8 policySecrets:(id)a9 syncUserControllableViews:(id)a10 secureElementIdentity:(id)a11 walrusSetting:(id)a12 webAccess:(id)a13 reply:(id)a14
{
  BOOL v28 = a4;
  uint64_t v19 = &v42;
  id v34 = a3;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  int v44 = 0;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = -86;
  do
  {
    *uint64_t v19 = 0;
    char v25 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10003393C;
    v35[3] = &unk_1002F7D80;
    id v37 = v43;
    v35[4] = self;
    id v38 = &v39;
    id v26 = v24;
    id v36 = v26;
    int v27 = [v25 synchronousRemoteObjectProxyWithErrorHandler:v35];
    [v27 updateWithSpecificUser:v34 forceRefetch:v28 deviceName:v33 serialNumber:v32 osVersion:v31 policyVersion:v30 policySecrets:v29 syncUserControllableViews:v20 secureElementIdentity:v21 walrusSetting:v22 webAccess:v23 reply:v26];

    uint64_t v19 = (char *)(v40 + 3);
  }
  while (*((unsigned char *)v40 + 24));
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v43, 8);
}

- (void)attemptPreapprovedJoinWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
  id v12 = &v28;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = -86;
  do
  {
    char *v12 = 0;
    id v18 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100033CCC;
    v21[3] = &unk_1002F7D80;
    id v23 = v29;
    v21[4] = self;
    id v24 = &v25;
    id v19 = v17;
    id v22 = v19;
    id v20 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v21];
    [v20 attemptPreapprovedJoinWithSpecificUser:v13 ckksKeys:v14 tlkShares:v15 preapprovedKeys:v16 reply:v19];

    id v12 = (char *)(v26 + 3);
  }
  while (*((unsigned char *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)preflightPreapprovedJoinWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100034034;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 preflightPreapprovedJoinWithSpecificUser:v9 preapprovedKeys:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)joinWithSpecificUser:(id)a3 voucherData:(id)a4 voucherSig:(id)a5 ckksKeys:(id)a6 tlkShares:(id)a7 preapprovedKeys:(id)a8 flowID:(id)a9 deviceSessionID:(id)a10 canSendMetrics:(BOOL)a11 reply:(id)a12
{
  id v18 = &v39;
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a12;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  int v41 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = -86;
  do
  {
    char *v18 = 0;
    int v24 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100034424;
    void v32[3] = &unk_1002F7D80;
    id v34 = v40;
    v32[4] = self;
    id v35 = &v36;
    id v25 = v23;
    id v33 = v25;
    id v26 = [v24 synchronousRemoteObjectProxyWithErrorHandler:v32];
    LOBYTE(v27) = a11;
    [v26 joinWithSpecificUser:v31 voucherData:v30 voucherSig:v29 ckksKeys:v28 tlkShares:v19 preapprovedKeys:v20 flowID:v21 deviceSessionID:v22 canSendMetrics:v27 reply:v25];

    id v18 = (char *)(v37 + 3);
  }
  while (*((unsigned char *)v37 + 24));
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);
}

- (void)vouchWithRerollWithSpecificUser:(id)a3 oldPeerID:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  do
  {
    *id v10 = 0;
    id v15 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000347A4;
    v18[3] = &unk_1002F7D80;
    id v20 = v26;
    v18[4] = self;
    id v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v18];
    [v17 vouchWithRerollWithSpecificUser:v11 oldPeerID:v12 tlkShares:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }
  while (*((unsigned char *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)vouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  do
  {
    *id v10 = 0;
    id v15 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100034B28;
    v18[3] = &unk_1002F7D80;
    id v20 = v26;
    v18[4] = self;
    id v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v18];
    [v17 vouchWithCustodianRecoveryKeyWithSpecificUser:v11 crk:v12 tlkShares:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }
  while (*((unsigned char *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)vouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12 = &v28;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = -86;
  do
  {
    char *v12 = 0;
    id v18 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100034EC0;
    v21[3] = &unk_1002F7D80;
    id v23 = v29;
    v21[4] = self;
    uint64_t v24 = &v25;
    id v19 = v17;
    id v22 = v19;
    id v20 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v21];
    [v20 vouchWithRecoveryKeyWithSpecificUser:v13 recoveryKey:v14 salt:v15 tlkShares:v16 reply:v19];

    id v12 = (char *)(v26 + 3);
  }
  while (*((unsigned char *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)preflightVouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003522C;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 preflightVouchWithCustodianRecoveryKeyWithSpecificUser:v9 crk:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)preflightVouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  do
  {
    *id v10 = 0;
    id v15 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000355A8;
    v18[3] = &unk_1002F7D80;
    id v20 = v26;
    v18[4] = self;
    uint64_t v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v18];
    [v17 preflightVouchWithRecoveryKeyWithSpecificUser:v11 recoveryKey:v12 salt:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }
  while (*((unsigned char *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)vouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 entropy:(id)a5 bottleSalt:(id)a6 tlkShares:(id)a7 reply:(id)a8
{
  id v14 = &v31;
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  int v33 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = -86;
  do
  {
    *id v14 = 0;
    id v20 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100035950;
    v24[3] = &unk_1002F7D80;
    id v26 = v32;
    v24[4] = self;
    int v27 = &v28;
    id v21 = v19;
    id v25 = v21;
    uint64_t v22 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v24];
    [v22 vouchWithBottleWithSpecificUser:v23 bottleID:v15 entropy:v16 bottleSalt:v17 tlkShares:v18 reply:v21];

    id v14 = (char *)(v29 + 3);
  }
  while (*((unsigned char *)v29 + 24));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
}

- (void)preflightVouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100035CBC;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 preflightVouchWithBottleWithSpecificUser:v9 bottleID:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)vouchWithSpecificUser:(id)a3 peerID:(id)a4 permanentInfo:(id)a5 permanentInfoSig:(id)a6 stableInfo:(id)a7 stableInfoSig:(id)a8 ckksKeys:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 reply:(id)a13
{
  uint64_t v19 = &v41;
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a13;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  int v43 = 0;
  uint64_t v38 = 0;
  char v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = -86;
  do
  {
    *uint64_t v19 = 0;
    id v25 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000360D4;
    v34[3] = &unk_1002F7D80;
    uint64_t v36 = v42;
    v34[4] = self;
    id v37 = &v38;
    id v26 = v24;
    id v35 = v26;
    int v27 = [v25 synchronousRemoteObjectProxyWithErrorHandler:v34];
    LOBYTE(v28) = a12;
    [v27 vouchWithSpecificUser:v33 peerID:v32 permanentInfo:v31 permanentInfoSig:v30 stableInfo:v29 stableInfoSig:v20 ckksKeys:v21 flowID:v22 deviceSessionID:v23 canSendMetrics:v28 reply:v26];

    uint64_t v19 = (char *)(v39 + 3);
  }
  while (*((unsigned char *)v39 + 24));
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);
}

- (void)establishWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
  id v12 = &v28;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = -86;
  do
  {
    char *v12 = 0;
    id v18 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100036464;
    v21[3] = &unk_1002F7D80;
    id v23 = v29;
    v21[4] = self;
    id v24 = &v25;
    id v19 = v17;
    id v22 = v19;
    id v20 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v21];
    [v20 establishWithSpecificUser:v13 ckksKeys:v14 tlkShares:v15 preapprovedKeys:v16 reply:v19];

    id v12 = (char *)(v26 + 3);
  }
  while (*((unsigned char *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)prepareWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 setting:(id)a16 signingPrivKeyPersistentRef:(id)a17 encPrivKeyPersistentRef:(id)a18 reply:(id)a19
{
  id v24 = &v52;
  id v44 = a3;
  id v43 = a5;
  id v42 = a6;
  id v41 = a7;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v37 = a11;
  id v36 = a12;
  id v35 = a13;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  int v54 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = -86;
  do
  {
    *id v24 = 0;
    int v30 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100036920;
    v45[3] = &unk_1002F7D80;
    v47 = v53;
    v45[4] = self;
    v48 = &v49;
    id v31 = v29;
    id v46 = v31;
    id v32 = [v30 synchronousRemoteObjectProxyWithErrorHandler:v45];
    LODWORD(v33) = a14;
    objc_msgSend(v32, "prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:reply:", v44, a4, v43, v42, v41, v40, v39, v38, v37, v36, v35, v33, v25, v26, v27,
      v28,
      v31);

    id v24 = (char *)(v50 + 3);
  }
  while (*((unsigned char *)v50 + 24));
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);
}

- (void)fetchEgoEpochWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100036C7C;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 fetchEgoEpochWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchAllowedMachineIDsWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100036FC4;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 fetchAllowedMachineIDsWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)handleRemovedMachineIDsDueToUnknownReasonsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100037324;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 handleRemovedMachineIDsDueToUnknownReasonsWithSpecificUser:v9 machineIDs:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)handleEvictedMachineIDsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100037680;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 handleEvictedMachineIDsWithSpecificUser:v9 machineIDs:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)markTrustedDeviceListFetchFailed:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000379C4;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 markTrustedDeviceListFetchFailed:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)setAllowedMachineIDsWithSpecificUser:(id)a3 allowedMachineIDs:(id)a4 userInitiatedRemovals:(id)a5 evictedRemovals:(id)a6 unknownReasonRemovals:(id)a7 honorIDMSListChanges:(BOOL)a8 version:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 altDSID:(id)a13 trustedDeviceHash:(id)a14 deletedDeviceHash:(id)a15 trustedDevicesUpdateTimestamp:(id)a16 reply:(id)a17
{
  BOOL v32 = a8;
  char v22 = &v48;
  id v40 = a3;
  id v39 = a4;
  id v38 = a5;
  id v37 = a6;
  id v36 = a7;
  id v35 = a9;
  id v34 = a10;
  id v33 = a11;
  id v23 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  int v50 = 0;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = -86;
  do
  {
    *char v22 = 0;
    id v28 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100037E34;
    v41[3] = &unk_1002F7D80;
    id v43 = v49;
    v41[4] = self;
    id v44 = &v45;
    id v29 = v27;
    id v42 = v29;
    int v30 = [v28 synchronousRemoteObjectProxyWithErrorHandler:v41];
    LOBYTE(v31) = a12;
    [v30 setAllowedMachineIDsWithSpecificUser:v40 allowedMachineIDs:v39 userInitiatedRemovals:v38 evictedRemovals:v37 unknownReasonRemovals:v36 honorIDMSListChanges:v32 version:v35 flowID:v34 deviceSessionID:v33 canSendMetrics:v31 altDSID:v23 trustedDeviceHash:v24 deletedDeviceHash:v25 trustedDevicesUpdateTimestamp:v26 reply:v29];

    char v22 = (char *)(v46 + 3);
  }
  while (*((unsigned char *)v46 + 24));
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);
}

- (void)localResetWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003817C;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 localResetWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)resetWithSpecificUser:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 internalAccount:(BOOL)a8 demoAccount:(BOOL)a9 isGuitarfish:(BOOL)a10 accountType:(int64_t)a11 reply:(id)a12
{
  BOOL v24 = a7;
  BOOL v25 = a8;
  id v15 = &v34;
  id v26 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a12;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  int v36 = 0;
  uint64_t v31 = 0;
  BOOL v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = -86;
  do
  {
    char *v15 = 0;
    char v19 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10003851C;
    v27[3] = &unk_1002F7D80;
    id v29 = v35;
    v27[4] = self;
    int v30 = &v31;
    id v20 = v18;
    id v28 = v20;
    int v21 = [v19 synchronousRemoteObjectProxyWithErrorHandler:v27];
    LOWORD(v22) = __PAIR16__(a10, a9);
    [v21 resetWithSpecificUser:v26 resetReason:a4 idmsTargetContext:v16 idmsCuttlefishPassword:v17 notifyIdMS:v24 internalAccount:v22 demoAccount:a11 isGuitarfish:v20 accountType:v25 reply:a10];

    id v15 = (char *)(v32 + 3);
  }
  while (*((unsigned char *)v32 + 24));
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);
}

- (void)trustStatusWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100038860;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 trustStatusWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)dropPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  v5 = (void (**)(id, void *))a5;
  BOOL v6 = sub_10000B070("SecError");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "octagon: drop unsupported from within securityd", v8, 2u);
  }

  id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 userInfo:0];
  v5[2](v5, v7);
}

- (void)distrustPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100038C7C;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 distrustPeerIDsWithSpecificUser:v9 peerIDs:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)departByDistrustingSelfWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100038FC0;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 departByDistrustingSelfWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)trustedDeviceNamesByPeerIDWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100039304;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 trustedDeviceNamesByPeerIDWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)octagonPeerIDGivenBottleIDWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100039664;
    v15[3] = &unk_1002F7D80;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v14 octagonPeerIDGivenBottleIDWithSpecificUser:v9 bottleID:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }
  while (*((unsigned char *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)honorIDMSListChangesForSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000399AC;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 honorIDMSListChangesForSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)dumpWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100039CF4;
    v12[3] = &unk_1002F7D80;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v11 dumpWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)pingWithReply:(id)a3
{
  v4 = &v12;
  id v5 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = -86;
  do
  {
    char *v4 = 0;
    BOOL v6 = [(CuttlefishXPCWrapper *)self cuttlefishXPCConnection];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003A008;
    v8[3] = &unk_1002F9830;
    v8[4] = self;
    v8[5] = v13;
    v8[6] = &v9;
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v8];
    [v7 pingWithReply:v5];

    v4 = (char *)(v10 + 3);
  }
  while (*((unsigned char *)v10 + 24));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
}

- (CuttlefishXPCWrapper)initWithCuttlefishXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuttlefishXPCWrapper;
  BOOL v6 = [(CuttlefishXPCWrapper *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cuttlefishXPCConnection, a3);
  }

  return v7;
}

+ (BOOL)retryable:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  BOOL v5 = v4 == NSCocoaErrorDomain && [v3 code] == (id)4097;

  return v5;
}

@end