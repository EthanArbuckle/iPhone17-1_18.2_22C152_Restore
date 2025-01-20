@interface OTManager
+ (id)makeCKContainer:(id)a3;
+ (id)manager;
+ (id)resetManager:(BOOL)a3 to:(id)a4;
- (BOOL)allContextsPause:(unint64_t)a3;
- (BOOL)fetchSendingMetricsPermitted:(id)a3 error:(id *)a4;
- (BOOL)ghostbustByAgeEnabled;
- (BOOL)ghostbustByMidEnabled;
- (BOOL)ghostbustBySerialEnabled;
- (BOOL)isFullPeer;
- (BOOL)persistSendingMetricsPermitted:(id)a3 sendingMetricsPermitted:(BOOL)a4 error:(id *)a5;
- (BOOL)sosEnabledForPlatform;
- (BOOL)waitForReady:(id)a3 wait:(int64_t)a4;
- (CKContainer)cloudKitContainer;
- (CKKSAccountStateTracker)accountStateTracker;
- (CKKSCloudKitClassDependencies)cloudKitClassDependencies;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)savedTLKNotifier;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSViewManager)viewManager;
- (Class)apsConnectionClass;
- (Class)escrowRequestClass;
- (Class)loggerClass;
- (Class)notifierClass;
- (NSMutableDictionary)contexts;
- (NSXPCListener)listener;
- (NSXPCProxyCreating)cuttlefishXPCConnection;
- (OS_dispatch_queue)queue;
- (OTAccountsAdapter)accountsAdapter;
- (OTAuthKitAdapter)authKitAdapter;
- (OTDeviceInformationAdapter)deviceInformationAdapter;
- (OTManager)init;
- (OTManager)initWithSOSAdapter:(id)a3 accountsAdapter:(id)a4 authKitAdapter:(id)a5 tooManyPeersAdapter:(id)a6 tapToRadarAdapter:(id)a7 deviceInformationAdapter:(id)a8 personaAdapter:(id)a9 apsConnectionClass:(Class)a10 escrowRequestClass:(Class)a11 notifierClass:(Class)a12 loggerClass:(Class)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 cloudKitClassDependencies:(id)a16 cuttlefishXPCConnection:(id)a17 cdpd:(id)a18;
- (OTManager)initWithSOSAdapter:(id)a3 lockStateTracker:(id)a4 personaAdapter:(id)a5 cloudKitClassDependencies:(id)a6;
- (OTPersonaAdapter)personaAdapter;
- (OTRamp)gbAgeRamp;
- (OTRamp)gbmidRamp;
- (OTRamp)gbserialRamp;
- (OTSOSAdapter)sosAdapter;
- (OTTapToRadarAdapter)tapToRadarAdapter;
- (OTTooManyPeersAdapter)tooManyPeersAdapter;
- (OctagonFollowUpControllerProtocol)cdpd;
- (id)cdpContextTypes;
- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4 possibleAccount:(id)a5;
- (id)ckksForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6;
- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6;
- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5;
- (id)contextForClientRPC:(id)a3 error:(id *)a4;
- (id)contextForClientRPCWithActiveAccount:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6;
- (id)contextForContainerName:(id)a3 contextID:(id)a4;
- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5;
- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5 createIfMissing:(BOOL)a6 sosAdapter:(id)a7 accountsAdapter:(id)a8 authKitAdapter:(id)a9 tooManyPeersAdapter:(id)a10 tapToRadarAdapter:(id)a11 lockStateTracker:(id)a12 deviceInformationAdapter:(id)a13;
- (id)contextForContainerName:(id)a3 contextID:(id)a4 sosAdapter:(id)a5 accountsAdapter:(id)a6 authKitAdapter:(id)a7 tooManyPeersAdapter:(id)a8 tapToRadarAdapter:(id)a9 lockStateTracker:(id)a10 deviceInformationAdapter:(id)a11;
- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3;
- (id)restartOctagonContext:(id)a3;
- (void)allContextsDisablePendingFlags;
- (void)allContextsHalt;
- (void)appleAccountSignedIn:(id)a3 reply:(id)a4;
- (void)appleAccountSignedOut:(id)a3 reply:(id)a4;
- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4;
- (void)cancelPendingOperations;
- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)clearAllContexts;
- (void)clearCliqueFromAccount:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6;
- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7;
- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)dropAllActors;
- (void)ensureRampsInitialized;
- (void)establish:(id)a3 reply:(id)a4;
- (void)fetchAccountSettings:(id)a3 reply:(id)a4;
- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5;
- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)fetchEgoPeerID:(id)a3 reply:(id)a4;
- (void)fetchEscrowContents:(id)a3 reply:(id)a4;
- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4;
- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4;
- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)getAccountMetadata:(id)a3 reply:(id)a4;
- (void)getCDPStatus:(id)a3 reply:(id)a4;
- (void)haltAll;
- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6;
- (void)initializeOctagon;
- (void)invalidateEscrowCache:(id)a3 reply:(id)a4;
- (void)isRecoveryKeySet:(id)a3 reply:(id)a4;
- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)leaveClique:(id)a3 reply:(id)a4;
- (void)moveToCheckTrustedStateForArguments:(id)a3;
- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4;
- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4;
- (void)performCKServerUnreadableDataRemoval:(id)a3 isGuitarfish:(BOOL)a4 altDSID:(id)a5 reply:(id)a6;
- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7;
- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6;
- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4;
- (void)registerForCircleChangedNotifications;
- (void)removeContextForContainerName:(id)a3 contextID:(id)a4;
- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5;
- (void)removeRecoveryKey:(id)a3 reply:(id)a4;
- (void)reroll:(id)a3 reply:(id)a4;
- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7;
- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 isGuitarfish:(BOOL)a9 reply:(id)a10;
- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6;
- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6;
- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7;
- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11;
- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5;
- (void)setAccountStateTracker:(id)a3;
- (void)setCDPEnabled:(id)a3 reply:(id)a4;
- (void)setCdpd:(id)a3;
- (void)setContexts:(id)a3;
- (void)setCuttlefishXPCConnection:(id)a3;
- (void)setGbAgeRamp:(id)a3;
- (void)setGbmidRamp:(id)a3;
- (void)setGbserialRamp:(id)a3;
- (void)setListener:(id)a3;
- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5;
- (void)setLockStateTracker:(id)a3;
- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5;
- (void)setQueue:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setSOSEnabledForPlatformFlag:(BOOL)a3;
- (void)setSavedTLKNotifier:(id)a3;
- (void)setSosEnabledForPlatform:(BOOL)a3;
- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5;
- (void)setViewManager:(id)a3;
- (void)setupAnalytics;
- (void)simulateReceivePush:(id)a3 reply:(id)a4;
- (void)startOctagonStateMachine:(id)a3 reply:(id)a4;
- (void)status:(id)a3 reply:(id)a4;
- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5;
- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6;
- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6;
- (void)totalTrustedPeers:(id)a3 reply:(id)a4;
- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4;
- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4;
- (void)xpc24HrNotification;
@end

@implementation OTManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitClassDependencies, 0);
  objc_storeStrong((id *)&self->_savedTLKNotifier, 0);
  objc_storeStrong((id *)&self->_loggerClass, 0);
  objc_storeStrong((id *)&self->_notifierClass, 0);
  objc_storeStrong((id *)&self->_escrowRequestClass, 0);
  objc_storeStrong((id *)&self->_apsConnectionClass, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_tapToRadarAdapter, 0);
  objc_storeStrong((id *)&self->_tooManyPeersAdapter, 0);
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_cdpd, 0);
  objc_storeStrong((id *)&self->_gbAgeRamp, 0);
  objc_storeStrong((id *)&self->_gbserialRamp, 0);
  objc_storeStrong((id *)&self->_gbmidRamp, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_viewManager, 0);
  objc_storeStrong((id *)&self->_cloudKitContainer, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_accountStateTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_deviceInformationAdapter, 0);
  objc_storeStrong((id *)&self->_authKitAdapter, 0);
  objc_storeStrong((id *)&self->_sosAdapter, 0);

  objc_storeStrong((id *)&self->_cuttlefishXPCConnection, 0);
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSavedTLKNotifier:(id)a3
{
}

- (CKKSNearFutureScheduler)savedTLKNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSosEnabledForPlatform:(BOOL)a3
{
  self->_sosEnabledForPlatform = a3;
}

- (BOOL)sosEnabledForPlatform
{
  return self->_sosEnabledForPlatform;
}

- (Class)loggerClass
{
  return (Class)objc_getProperty(self, a2, 200, 1);
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 192, 1);
}

- (Class)escrowRequestClass
{
  return (Class)objc_getProperty(self, a2, 184, 1);
}

- (Class)apsConnectionClass
{
  return (Class)objc_getProperty(self, a2, 176, 1);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 168, 1);
}

- (OTTapToRadarAdapter)tapToRadarAdapter
{
  return (OTTapToRadarAdapter *)objc_getProperty(self, a2, 160, 1);
}

- (OTTooManyPeersAdapter)tooManyPeersAdapter
{
  return (OTTooManyPeersAdapter *)objc_getProperty(self, a2, 152, 1);
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 144, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 136, 1);
}

- (void)setContexts:(id)a3
{
}

- (NSMutableDictionary)contexts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCdpd:(id)a3
{
}

- (OctagonFollowUpControllerProtocol)cdpd
{
  return self->_cdpd;
}

- (void)setGbAgeRamp:(id)a3
{
}

- (OTRamp)gbAgeRamp
{
  return self->_gbAgeRamp;
}

- (void)setGbserialRamp:(id)a3
{
}

- (OTRamp)gbserialRamp
{
  return self->_gbserialRamp;
}

- (void)setGbmidRamp:(id)a3
{
}

- (OTRamp)gbmidRamp
{
  return self->_gbmidRamp;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 88, 1);
}

- (void)setViewManager:(id)a3
{
}

- (CKKSViewManager)viewManager
{
  return (CKKSViewManager *)objc_getProperty(self, a2, 80, 1);
}

- (CKContainer)cloudKitContainer
{
  return (CKContainer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setReachabilityTracker:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccountStateTracker:(id)a3
{
}

- (CKKSAccountStateTracker)accountStateTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (OTDeviceInformationAdapter)deviceInformationAdapter
{
  return (OTDeviceInformationAdapter *)objc_getProperty(self, a2, 40, 1);
}

- (OTAuthKitAdapter)authKitAdapter
{
  return (OTAuthKitAdapter *)objc_getProperty(self, a2, 32, 1);
}

- (OTSOSAdapter)sosAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 24, 1);
}

- (void)reroll:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v18 = 0;
  v8 = [(OTManager *)self contextForClientRPC:v6 error:&v18];
  id v9 = v18;
  v10 = sub_10000B070("octagon");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Rejecting a reroll RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v9);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "reroll invoked for arguments (%@)", buf, 0xCu);
    }

    v12 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    v13 = [v12 startLogSystemMetricsForActivityNamed:@"OctagonActivityReroll"];

    [v8 startOctagonStateMachine];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100052CE0;
    v15[3] = &unk_1002FA768;
    id v16 = v13;
    v17 = v7;
    id v14 = v13;
    [v8 rerollWithReply:v15];
  }
}

- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v12 = 0;
  v8 = [(OTManager *)self contextForClientRPC:v6 error:&v12];
  id v9 = v12;
  v10 = v9;
  if (!v8 || v9)
  {
    BOOL v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a areRecoveryKeysDistrusted RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    [v8 areRecoveryKeysDistrusted:v7];
  }
}

- (void)getAccountMetadata:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v12 = 0;
  v8 = [(OTManager *)self contextForClientRPC:v6 error:&v12];
  id v9 = v12;
  v10 = v9;
  if (!v8 || v9)
  {
    BOOL v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a getAccountMetadata RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    [v8 getAccountMetadataWithReply:v7];
  }
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  id v15 = 0;
  BOOL v11 = [(OTManager *)self contextForClientRPC:v8 error:&v15];
  id v12 = v15;
  v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a preflightRecoverOctagonUsingRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    [v11 preflightRecoverOctagonUsingRecoveryKey:v9 reply:v10];
  }
}

- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v16 = 0;
  v10 = (void (**)(id, void))a5;
  BOOL v11 = [(OTManager *)self contextForClientRPC:v8 error:&v16];
  id v12 = v16;
  v13 = v12;
  if (!v11 || v12)
  {
    id v15 = sub_10000B070("octagon");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a setMachineIDOverride RPC for arguments (%@): %@", buf, 0x16u);
    }

    id v14 = v13;
  }
  else
  {
    [v11 setMachineIDOverride:v9];
    id v14 = 0;
  }
  ((void (**)(id, void *))v10)[2](v10, v14);
}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v14 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v14];
  id v9 = v14;
  v10 = v9;
  if (!v8 || v9)
  {
    BOOL v11 = sub_10000B070("octagon-remove-recovery-key");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a removeRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100053418;
    v12[3] = &unk_1002FB288;
    v13 = v7;
    [v8 rpcRemoveRecoveryKey:v12];
  }
}

- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  id v17 = 0;
  BOOL v11 = [(OTManager *)self contextForClientRPC:v8 error:&v17];
  id v12 = v17;
  v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10000B070("octagon-recover-with-recovery-key");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a recoverWithRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000536E8;
    v15[3] = &unk_1002FB1E8;
    id v16 = v10;
    [v11 joinWithRecoveryKey:v9 reply:v15];
  }
}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v12 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v12];
  id v9 = v12;
  v10 = v9;
  if (!v8 || v9)
  {
    BOOL v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a isRecoveryKeySet RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    [v8 rpcIsRecoveryKeySet:v7];
  }
}

- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, void *))a6;
  id v17 = 0;
  v13 = [(OTManager *)self contextForClientRPC:v10 error:&v17];
  id v14 = v17;
  __int16 v15 = v14;
  if (!v13 || v14)
  {
    id v16 = sub_10000B070("octagon");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v10;
      __int16 v20 = 2112;
      __int16 v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a tlkRecoverabilityForEscrowRecordData RPC for arguments (%@): %@", buf, 0x16u);
    }

    v12[2](v12, 0, v15);
  }
  else
  {
    [v13 rpcTlkRecoverabilityForEscrowRecordData:v11 source:a5 reply:v12];
  }
}

- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v14 = 0;
  id v10 = [(OTManager *)self contextForClientRPC:v8 error:&v14];
  id v11 = v14;
  id v12 = v11;
  if (!v10 || v11)
  {
    v13 = sub_10000B070("octagon");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchAccountWideSettings RPC for arguments (%@): %@", buf, 0x16u);
    }

    v9[2](v9, 0, v12);
  }
  else
  {
    [v10 rpcAccountWideSettingsWithForceFetch:v6 reply:v9];
  }
}

- (void)fetchAccountSettings:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v12 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v12];
  id v9 = v12;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchAccountSettings RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    [v8 rpcFetchAccountSettings:v7];
  }
}

- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v15 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v15];
  id v12 = v15;
  v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a setAccountSetting RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    [v11 rpcSetAccountSetting:v9 reply:v10];
  }
}

- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v12 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v12];
  id v9 = v12;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchTrustedSecureElementIdentities RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    [v8 rpcFetchTrustedSecureElementIdentities:v7];
  }
}

- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v15 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v15];
  id v12 = v15;
  v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a removeLocalSecureElementIdentityPeerID RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    [v11 rpcRemoveLocalSecureElementIdentityPeerID:v9 reply:v10];
  }
}

- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v15 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v15];
  id v12 = v15;
  v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a setLocalSecureElementIdentity RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    [v11 rpcSetLocalSecureElementIdentity:v9 reply:v10];
  }
}

- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void *))a7;
  id v22 = 0;
  id v16 = [(OTManager *)self contextForClientRPC:v12 error:&v22];
  id v17 = v22;
  __int16 v18 = v17;
  if (!v16 || v17)
  {
    id v19 = sub_10000B070("octagon");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v12;
      __int16 v25 = 2112;
      v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rejecting a resetAccountCDPContents RPC for arguments (%@): %@", buf, 0x16u);
    }

    v15[2](v15, v18);
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100054460;
    v20[3] = &unk_1002FB1E8;
    __int16 v21 = v15;
    [v16 rpcResetAccountCDPContentsWithIdmsTargetContext:v13 idmsCuttlefishPassword:v14 notifyIdMS:v8 reply:v20];
  }
}

- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v14 = 0;
  BOOL v8 = [(OTManager *)self contextForClientRPC:v6 error:&v14];
  id v9 = v14;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchUserControllableViewsSyncStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100054730;
    v12[3] = &unk_1002FB288;
    id v13 = v7;
    [v8 rpcFetchUserControllableViewsSyncingStatus:v12];
  }
}

- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  id v16 = 0;
  id v10 = [(OTManager *)self contextForClientRPC:v8 error:&v16];
  id v11 = v16;
  id v12 = v11;
  if (!v10 || v11)
  {
    id v13 = sub_10000B070("octagon");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Rejecting a setUserControllableViewsSyncStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    v9[2](v9, 0, v12);
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100054A38;
    v14[3] = &unk_1002FB288;
    id v15 = v9;
    [v10 rpcSetUserControllableViewsSyncingStatus:v6 reply:v14];
  }
}

- (void)invalidateEscrowCache:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v15 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v15];
  id v9 = v15;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v12 = sub_10000B070("octagon");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      __int16 v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a invalidateEscrowCache RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    id v11 = sub_10000B070("octagon-remove-escrow-cache");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "beginning removing escrow cache!", buf, 2u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100054D80;
    v13[3] = &unk_1002FB1E8;
    id v14 = v7;
    [v8 rpcInvalidateEscrowCache:v13];
  }
}

- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  id v17 = 0;
  id v10 = [(OTManager *)self contextForClientRPC:v8 error:&v17];
  id v11 = v17;
  id v12 = v11;
  if (!v10 || v11)
  {
    id v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchEscrowRecords RPC for arguments (%@): %@", buf, 0x16u);
    }

    v9[2](v9, 0, v12);
  }
  else
  {
    id v13 = sub_10000B070("octagon-fetch-escrow-records");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "fetching records", buf, 2u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000550A4;
    v15[3] = &unk_1002FB260;
    id v16 = v9;
    [v10 rpcFetchAllViableEscrowRecordsFromSource:a4 reply:v15];
  }
}

- (void)setCDPEnabled:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v15 = 0;
  v7 = (void (**)(id, void *))a4;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v15];
  id v9 = v15;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v13 = sub_10000B070("octagon");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Rejecting a setCDPEnabled RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    id v11 = sub_10000B070("octagon-cdp");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "set-cdp-enabled", buf, 2u);
    }

    id v14 = 0;
    [v8 setCDPEnabled:&v14];
    id v12 = v14;
    v7[2](v7, v12);

    v7 = (void (**)(id, void *))v12;
  }
}

- (void)getCDPStatus:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v16 = 0;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v16];
  id v9 = v16;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a getCDPStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    id v11 = sub_10000B070("octagon-cdp");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "get-cdp-status", buf, 2u);
    }

    id v15 = 0;
    id v12 = [v8 getCDPStatus:&v15];
    id v13 = v15;
    ((void (**)(id, id, void *))v7)[2](v7, v12, v13);

    v7 = (void (**)(id, void, void *))v13;
  }
}

- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v15 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v15];
  id v9 = v15;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v12 = sub_10000B070("octagon");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      __int16 v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a refetchCKKSPolicy RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    id v11 = sub_10000B070("octagon-ckks");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "refetch-ckks-policy", buf, 2u);
    }

    [v8 startOctagonStateMachine];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100055758;
    v13[3] = &unk_1002FB1E8;
    id v14 = v7;
    [v8 rpcRefetchCKKSPolicy:v13];
  }
}

- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6
{
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)SecTapToRadar) initTapToRadar:v12 description:v11 radar:v10];

  [v13 trigger];
  v9[2](v9, 0);
}

- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7
{
  id v9 = (void (**)(id, void))a7;
  id v10 = a6;
  id v11 = a5;
  id v18 = +[NSString stringWithFormat:@"%@%@", @"OACDPStateRun", v11];
  id v12 = +[NSString stringWithFormat:@"%@%@Tries", @"OACDPStateRun", v11];

  id v13 = +[CKKSAnalytics logger];
  [v13 logResultForEvent:v18 hardFailure:0 result:v10];

  id v14 = +[CKKSAnalytics logger];
  id v15 = v14;
  if (v10)
  {
    id v16 = +[NSDate date];
    [v15 setDateProperty:v16 forKey:v18];

    id v17 = +[CKKSAnalytics logger];
    [v17 incrementIntegerPropertyForKey:v12];
  }
  else
  {
    [v14 setDateProperty:0 forKey:v18];

    id v17 = +[CKKSAnalytics logger];
    [v17 setNumberProperty:0 forKey:v12];
  }

  v9[2](v9, 0);
}

- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v15 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v15];
  id v9 = v15;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v12 = sub_10000B070("octagon");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      __int16 v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a waitForPriorityViewKeychainDataRecovery RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    id v11 = sub_10000B070("octagon-ckks");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting wait for priority view processing", buf, 2u);
    }

    [v8 startOctagonStateMachine];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100055C74;
    v13[3] = &unk_1002FB1E8;
    id v14 = v7;
    [v8 rpcWaitForPriorityViewKeychainDataRecovery:v13];
  }
}

- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v15 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v15];
  id v9 = v15;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v12 = sub_10000B070("octagon");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      __int16 v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a waitForOctagonUpgrade RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    id v11 = sub_10000B070("octagon-sos");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting wait for octagon upgrade", buf, 2u);
    }

    [v8 startOctagonStateMachine];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100055E6C;
    v13[3] = &unk_1002FB1E8;
    id v14 = v7;
    [v8 waitForOctagonUpgrade:v13];
  }
}

- (BOOL)allContextsPause:(unint64_t)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [(OTManager *)self contexts];
  v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [v10 stateMachine];
        id v12 = [v11 currentState];

        if (v12 != @"not_started")
        {
          id v13 = [v10 stateMachine];
          id v14 = [v13 paused];
          id v15 = [v14 wait:a3];

          if (v15) {
            goto LABEL_14;
          }
        }
        id v16 = [v10 pendingEscrowCacheWarmup];
        id v17 = v16;
        if (v16 && [v16 wait:a3])
        {

LABEL_14:
          BOOL v18 = 0;
          goto LABEL_15;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_15:

  return v18;
}

- (void)allContextsDisablePendingFlags
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(OTManager *)self contexts];
  v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) stateMachine];
        [v8 disablePendingFlags];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)allContextsHalt
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(OTManager *)self contexts];
  v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v9 = [v8 stateMachine];
        [v9 haltOperation];

        long long v10 = [v8 ckks];
        [v10 halt];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)setSOSEnabledForPlatformFlag:(BOOL)a3
{
}

- (void)simulateReceivePush:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v14 = 0;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(OTManager *)self contextForClientRPC:v6 error:&v14];
  id v9 = v14;
  long long v10 = v9;
  if (!v8 || v9)
  {
    long long v13 = sub_10000B070("octagon");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      BOOL v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Rejecting updateOctagon for arguments (%@): %@", buf, 0x16u);
    }

    long long v12 = v10;
  }
  else
  {
    long long v11 = sub_10000B070("octagon-push");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "notifying container of change (simulated)", buf, 2u);
    }

    [v8 notifyContainerChange:0];
    long long v12 = 0;
  }
  ((void (**)(id, void *))v7)[2](v7, v12);
}

- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v23 = 0;
  long long v11 = (void (**)(id, void, void *))a6;
  long long v12 = [(OTManager *)self contextForClientRPC:v10 error:&v23];
  id v13 = v23;
  id v14 = v13;
  if (!v12 || v13)
  {
    BOOL v18 = sub_10000B070("octagon");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v10;
      __int16 v26 = 2112;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rejecting a healthCheck RPC for arguments (%@): %@", buf, 0x16u);
    }

    v11[2](v11, 0, v14);
  }
  else
  {
    id v15 = [v10 flowID];

    if (v15)
    {
      id v15 = [v10 flowID];
    }
    id v16 = [v10 deviceSessionID];

    if (v16)
    {
      __int16 v17 = [v10 deviceSessionID];
    }
    else
    {
      __int16 v19 = [v10 altDSID];
      id v20 = +[AAFAnalyticsEventSecurity fetchDeviceSessionIDFromAuthKit:v19];

      __int16 v17 = 0;
    }
    long long v21 = [[OTMetricsSessionData alloc] initWithFlowID:v15 deviceSessionID:v17];
    [v12 setSessionMetrics:v21];

    long long v22 = sub_10000B070("octagon");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "notifying container of change", buf, 2u);
    }

    [v12 notifyContainerChange:0];
    [v12 checkOctagonHealth:v8 repair:v7 reply:v11];

    long long v11 = (void (**)(id, void, void *))v15;
  }
}

- (void)xpc24HrNotification
{
  v3 = sub_10000B070("octagon-health");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received 24hr xpc notification", v5, 2u);
  }

  id v4 = objc_alloc_init((Class)OTControlArguments);
  [(OTManager *)self healthCheck:v4 skipRateLimitingCheck:0 repair:0 reply:&stru_1002F8600];
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  id v30 = 0;
  __int16 v17 = [(OTManager *)self contextForClientRPC:v12 error:&v30];
  id v18 = v30;
  __int16 v19 = v18;
  if (!v17 || v18)
  {
    id v24 = sub_10000B070("octagon");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v12;
      __int16 v35 = 2112;
      v36 = v19;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Rejecting a createInheritanceKey (w/claimToken+wrappingKey) RPC for arguments (%@): %@", buf, 0x16u);
    }

    v16[2](v16, 0, v19);
  }
  else
  {
    id v20 = sub_10000B070("octagon-inheritance");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Creating Inheritance Key given claimToken+wrappingKey for arguments (%@)", buf, 0xCu);
    }

    long long v21 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    long long v22 = [v21 startLogSystemMetricsForActivityNamed:@"OctagonEventCreateInheritanceKeyWithClaimTokenAndWrappingKey"];

    if ([(OTManager *)self isFullPeer])
    {
      [v17 startOctagonStateMachine];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100056B98;
      v27[3] = &unk_1002F85C0;
      id v28 = v22;
      v29 = v16;
      [v17 rpcCreateInheritanceKeyWithUUID:v13 claimTokenData:v14 wrappingKeyData:v15 reply:v27];

      id v23 = v28;
    }
    else
    {
      id v25 = sub_10000B070("octagon-inheritance");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      CFStringRef v32 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      __int16 v26 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v23 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:35 userInfo:v26];

      [v22 stopWithEvent:@"OctagonActivityRecreateInheritanceKey" result:v23];
      v16[2](v16, 0, v23);
    }
  }
}

- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v27 = 0;
  id v14 = [(OTManager *)self contextForClientRPC:v10 error:&v27];
  id v15 = v27;
  id v16 = v15;
  if (!v14 || v15)
  {
    long long v21 = sub_10000B070("octagon");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v10;
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting a recreateInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v13[2](v13, 0, v16);
  }
  else
  {
    __int16 v17 = sub_10000B070("octagon-inheritance");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Recreating Inheritance Key for arguments (%@)", buf, 0xCu);
    }

    id v18 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    __int16 v19 = [v18 startLogSystemMetricsForActivityNamed:@"OctagonActivityRecreateInheritanceKey"];

    if ([(OTManager *)self isFullPeer])
    {
      [v14 startOctagonStateMachine];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100056F80;
      v24[3] = &unk_1002F85C0;
      id v25 = v19;
      __int16 v26 = v13;
      [v14 rpcRecreateInheritanceKeyWithUUID:v11 oldIK:v12 reply:v24];

      id v20 = v25;
    }
    else
    {
      long long v22 = sub_10000B070("octagon-inheritance");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v20 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:35 userInfo:v23];

      [v19 stopWithEvent:@"OctagonEventRecreateInheritanceKey" result:v20];
      v13[2](v13, 0, v20);
    }
  }
}

- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v24 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v24];
  id v12 = v24;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v20 = sub_10000B070("octagon");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      NSErrorUserInfoKey v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rejecting a checkInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    id v14 = sub_10000B070("octagon-custodian-recovery");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v8 containerName];
      id v16 = [v8 contextID];
      *(_DWORD *)buf = 138412802;
      id v26 = v9;
      __int16 v27 = 2112;
      NSErrorUserInfoKey v28 = v15;
      __int16 v29 = 2112;
      id v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Check Custodian Recovery Key %@ for container: %@, context: %@", buf, 0x20u);
    }
    __int16 v17 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v18 = [v17 startLogSystemMetricsForActivityNamed:@"OctagonActivityCheckInheritanceKey"];

    [v11 startOctagonStateMachine];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000572A8;
    v21[3] = &unk_1002F8598;
    id v22 = v18;
    id v23 = v10;
    id v19 = v18;
    [v11 rpcCheckInheritanceKeyWithUUID:v9 reply:v21];
  }
}

- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v27 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v27];
  id v12 = v27;
  id v13 = v12;
  if (!v11 || v12)
  {
    long long v21 = sub_10000B070("octagon");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting a removeInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    id v14 = sub_10000B070("octagon-inheritance");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v8 containerName];
      id v16 = [v8 contextID];
      *(_DWORD *)buf = 138412802;
      id v31 = v9;
      __int16 v32 = 2112;
      v33 = v15;
      __int16 v34 = 2112;
      __int16 v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remove Inheritance Key %@ for container: %@, context: %@", buf, 0x20u);
    }
    __int16 v17 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v18 = [v17 startLogSystemMetricsForActivityNamed:@"OctagonActivityRemoveInheritanceKey"];

    if ([(OTManager *)self isFullPeer])
    {
      if (_os_feature_enabled_impl())
      {
        id v19 = [objc_alloc((Class)SecTapToRadar) initTapToRadar:@"Inheritance key removal" description:@"Please TTR unless you were just removing a legacy contact" radar:@"114829039"];
        [v19 trigger];
      }
      [v11 startOctagonStateMachine];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000576F0;
      v24[3] = &unk_1002FA768;
      id v25 = v18;
      id v26 = v10;
      [v11 rpcRemoveInheritanceKeyWithUUID:v9 reply:v24];

      id v20 = v25;
    }
    else
    {
      id v22 = sub_10000B070("octagon-custodian-recovery");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot remove inheritance key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"Device is considered a limited peer, cannot remove inheritance key in Octagon";
      id v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v20 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:35 userInfo:v23];

      [v18 stopWithEvent:@"OctagonEventRemoveInheritanceKey" result:v20];
      v10[2](v10, v20);
    }
  }
}

- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v25 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v25];
  id v12 = v25;
  id v13 = v12;
  if (!v11 || v12)
  {
    long long v21 = sub_10000B070("octagon");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v8;
      __int16 v28 = 2112;
      CFStringRef v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting a preflightJoinWithInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    id v14 = sub_10000B070("octagon-inheritance");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v9 uuid];
      id v16 = [v8 containerName];
      __int16 v17 = [v8 contextID];
      *(_DWORD *)buf = 138412802;
      id v27 = v15;
      __int16 v28 = 2112;
      CFStringRef v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "preflight join with inheritance key %@ invoked for container: %@, context: %@", buf, 0x20u);
    }
    id v18 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v19 = [v18 startLogSystemMetricsForActivityNamed:@"OctagonActivityPreflightJoinWithInheritanceKey"];

    [v11 startOctagonStateMachine];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100057A0C;
    v22[3] = &unk_1002FA768;
    id v23 = v19;
    id v24 = v10;
    id v20 = v19;
    [v11 preflightJoinWithInheritanceKey:v9 reply:v22];
  }
}

- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v25 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v25];
  id v12 = v25;
  id v13 = v12;
  if (!v11 || v12)
  {
    long long v21 = sub_10000B070("octagon");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v8;
      __int16 v28 = 2112;
      CFStringRef v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting a joinWithInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    id v14 = sub_10000B070("octagon-inheritance");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v9 uuid];
      id v16 = [v8 containerName];
      __int16 v17 = [v8 contextID];
      *(_DWORD *)buf = 138412802;
      id v27 = v15;
      __int16 v28 = 2112;
      CFStringRef v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "join with inheritance key %@ invoked for container: %@, context: %@", buf, 0x20u);
    }
    id v18 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v19 = [v18 startLogSystemMetricsForActivityNamed:@"OctagonActivityJoinWithInheritanceKey"];

    [v11 startOctagonStateMachine];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100057DEC;
    v22[3] = &unk_1002FA768;
    id v23 = v19;
    id v24 = v10;
    id v20 = v19;
    [v11 joinWithInheritanceKey:v9 reply:v22];
  }
}

- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v24 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v24];
  id v12 = v24;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v18 = sub_10000B070("octagon");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      __int16 v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rejecting a storeInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    id v14 = sub_10000B070("octagon-inheritance");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Storing Inheritance Key for arguments (%@)", buf, 0xCu);
    }

    id v15 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v16 = [v15 startLogSystemMetricsForActivityNamed:@"OctagonActivityStoreInheritanceKey"];

    if ([(OTManager *)self isFullPeer])
    {
      [v11 startOctagonStateMachine];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100058258;
      v21[3] = &unk_1002FA768;
      id v22 = v16;
      id v23 = v10;
      [v11 rpcStoreInheritanceKeyWithIK:v9 reply:v21];

      __int16 v17 = v22;
    }
    else
    {
      id v19 = sub_10000B070("octagon-inheritance");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      __int16 v17 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:35 userInfo:v20];

      [v16 stopWithEvent:@"OctagonEventStoreInheritanceKey" result:v17];
      v10[2](v10, v17);
    }
  }
}

- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v24 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v24];
  id v12 = v24;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v18 = sub_10000B070("octagon");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      __int16 v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rejecting a generateInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    id v14 = sub_10000B070("octagon-inheritance");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Generating Inheritance Key for arguments (%@)", buf, 0xCu);
    }

    id v15 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v16 = [v15 startLogSystemMetricsForActivityNamed:@"OctagonActivityGenerateInheritanceKey"];

    if ([(OTManager *)self isFullPeer])
    {
      [v11 startOctagonStateMachine];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100058608;
      v21[3] = &unk_1002F85C0;
      id v22 = v16;
      id v23 = v10;
      [v11 rpcGenerateInheritanceKeyWithUUID:v9 reply:v21];

      __int16 v17 = v22;
    }
    else
    {
      id v19 = sub_10000B070("octagon-inheritance");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      __int16 v17 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:35 userInfo:v20];

      [v16 stopWithEvent:@"OctagonEventGenerateInheritanceKey" result:v17];
      v10[2](v10, 0, v17);
    }
  }
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v24 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v24];
  id v12 = v24;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v18 = sub_10000B070("octagon");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      __int16 v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rejecting a createInheritanceKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    id v14 = sub_10000B070("octagon-inheritance");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating Inheritance Key for arguments (%@)", buf, 0xCu);
    }

    id v15 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v16 = [v15 startLogSystemMetricsForActivityNamed:@"OctagonActivityCreateInheritanceKey"];

    if ([(OTManager *)self isFullPeer])
    {
      [v11 startOctagonStateMachine];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000589D4;
      v21[3] = &unk_1002F85C0;
      id v22 = v16;
      id v23 = v10;
      [v11 rpcCreateInheritanceKeyWithUUID:v9 reply:v21];

      __int16 v17 = v22;
    }
    else
    {
      id v19 = sub_10000B070("octagon-inheritance");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      __int16 v17 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:35 userInfo:v20];

      [v16 stopWithEvent:@"OctagonEventCreateInheritanceKey" result:v17];
      v10[2](v10, 0, v17);
    }
  }
}

- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v24 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v24];
  id v12 = v24;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v20 = sub_10000B070("octagon");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rejecting a checkCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    id v14 = sub_10000B070("octagon-custodian-recovery");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v8 containerName];
      id v16 = [v8 contextID];
      *(_DWORD *)buf = 138412802;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v15;
      __int16 v29 = 2112;
      __int16 v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Check Custodian Recovery Key %@ for container: %@, context: %@", buf, 0x20u);
    }
    __int16 v17 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v18 = [v17 startLogSystemMetricsForActivityNamed:@"OctagonActivityCheckCustodianRecoveryKey"];

    [v11 startOctagonStateMachine];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100058CFC;
    v21[3] = &unk_1002F8598;
    id v22 = v18;
    id v23 = v10;
    id v19 = v18;
    [v11 rpcCheckCustodianRecoveryKeyWithUUID:v9 reply:v21];
  }
}

- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v27 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v27];
  id v12 = v27;
  id v13 = v12;
  if (!v11 || v12)
  {
    long long v21 = sub_10000B070("octagon");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting a removeCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    id v14 = sub_10000B070("octagon-custodian-recovery");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v8 containerName];
      id v16 = [v8 contextID];
      *(_DWORD *)buf = 138412802;
      id v31 = v9;
      __int16 v32 = 2112;
      v33 = v15;
      __int16 v34 = 2112;
      __int16 v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remove Custodian Recovery Key %@ for container: %@, context: %@", buf, 0x20u);
    }
    __int16 v17 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v18 = [v17 startLogSystemMetricsForActivityNamed:@"OctagonActivityRemoveCustodianRecoveryKey"];

    if ([(OTManager *)self isFullPeer])
    {
      if (_os_feature_enabled_impl())
      {
        id v19 = [objc_alloc((Class)SecTapToRadar) initTapToRadar:@"Custodian key removal" description:@"Please TTR unless you were just removing a recovery contact" radar:@"114829039"];
        [v19 trigger];
      }
      [v11 startOctagonStateMachine];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100059144;
      v24[3] = &unk_1002FA768;
      id v25 = v18;
      id v26 = v10;
      [v11 rpcRemoveCustodianRecoveryKeyWithUUID:v9 reply:v24];

      id v20 = v25;
    }
    else
    {
      id v22 = sub_10000B070("octagon-custodian-recovery");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot remove recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"Device is considered a limited peer, cannot remove recovery key in Octagon";
      id v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v20 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:35 userInfo:v23];

      [v18 stopWithEvent:@"OctagonEventRemoveCustodianRecoveryKey" result:v20];
      v10[2](v10, v20);
    }
  }
}

- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v24 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v24];
  id v12 = v24;
  id v13 = sub_10000B070("octagon");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Rejecting a preflightJoinWithCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v12);
  }
  else
  {
    if (v14)
    {
      id v15 = [v9 uuid];
      id v16 = [v8 containerName];
      __int16 v17 = [v8 contextID];
      *(_DWORD *)buf = 138412802;
      id v26 = v15;
      __int16 v27 = 2112;
      id v28 = v16;
      __int16 v29 = 2112;
      __int16 v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "preflight join with custodian recovery key %@ invoked for container: %@, context: %@", buf, 0x20u);
    }
    id v18 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v19 = [v18 startLogSystemMetricsForActivityNamed:@"OctagonActivityPreflightJoinWithCustodianRecoveryKey"];

    [v11 startOctagonStateMachine];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100059444;
    v21[3] = &unk_1002FA768;
    id v22 = v19;
    id v23 = v10;
    id v20 = v19;
    [v11 preflightJoinWithCustodianRecoveryKey:v9 reply:v21];
  }
}

- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v24 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v24];
  id v12 = v24;
  id v13 = sub_10000B070("octagon");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Rejecting a joinWithCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v12);
  }
  else
  {
    if (v14)
    {
      id v15 = [v9 uuid];
      id v16 = [v8 containerName];
      __int16 v17 = [v8 contextID];
      *(_DWORD *)buf = 138412802;
      id v26 = v15;
      __int16 v27 = 2112;
      id v28 = v16;
      __int16 v29 = 2112;
      __int16 v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "join with custodian recovery key %@ invoked for container: %@, context: %@", buf, 0x20u);
    }
    id v18 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v19 = [v18 startLogSystemMetricsForActivityNamed:@"OctagonActivityJoinWithCustodianRecoveryKey"];

    [v11 startOctagonStateMachine];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100059808;
    v21[3] = &unk_1002FA768;
    id v22 = v19;
    id v23 = v10;
    id v20 = v19;
    [v11 joinWithCustodianRecoveryKey:v9 reply:v21];
  }
}

- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v24 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v24];
  id v12 = v24;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v18 = sub_10000B070("octagon");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      __int16 v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rejecting a createCustodianRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    BOOL v14 = sub_10000B070("octagon-custodian-recovery");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating Custodian Recovery Key for arguments (%@)", buf, 0xCu);
    }

    id v15 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v16 = [v15 startLogSystemMetricsForActivityNamed:@"OctagonActivityCreateCustodianRecoveryKey"];

    if ([(OTManager *)self isFullPeer])
    {
      [v11 startOctagonStateMachine];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100059C7C;
      v21[3] = &unk_1002F8570;
      id v22 = v16;
      id v23 = v10;
      [v11 rpcCreateCustodianRecoveryKeyWithUUID:v9 reply:v21];

      __int16 v17 = v22;
    }
    else
    {
      id v19 = sub_10000B070("octagon-custodian-recovery");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      __int16 v17 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:35 userInfo:v20];

      [v16 stopWithEvent:@"OctagonEventCreateCustodianRecoveryKey2" result:v17];
      v10[2](v10, 0, v17);
    }
  }
}

- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v27 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v27];
  id v12 = v27;
  id v13 = sub_10000B070("octagon");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v8;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Rejecting a joinWithRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v12);
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "join with recovery key invoked for arguments (%@)", buf, 0xCu);
    }

    id v15 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v16 = [v15 startLogSystemMetricsForActivityNamed:@"OctagonActivityJoinWithRecoveryKey"];

    CFStringRef v26 = 0;
    if (SecPasswordValidatePasswordFormat())
    {
      [v11 startOctagonStateMachine];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005A098;
      v20[3] = &unk_1002F8548;
      void v20[4] = self;
      id v21 = v16;
      NSErrorUserInfoKey v25 = v10;
      id v22 = v11;
      id v23 = v8;
      id v24 = v9;
      [v22 joinWithRecoveryKey:v24 reply:v20];
    }
    else
    {
      __int16 v17 = +[NSMutableDictionary dictionary];
      [v17 setObject:@"malformed recovery key" forKeyedSubscript:NSLocalizedDescriptionKey];
      id v18 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:41 userInfo:v17];
      id v19 = sub_10000B070("SecError");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v26;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "recovery failed validation with error:%@", buf, 0xCu);
      }

      [v16 stopWithEvent:@"OctagonEventJoinRecoveryKeyValidationFailed" result:v18];
      v10[2](v10, v18);
    }
  }
}

- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v27 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v27];
  id v12 = v27;
  id v13 = sub_10000B070("octagon");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Rejecting a createRecoveryKey RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v12);
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting recovery key for arguments (%@)", buf, 0xCu);
    }

    id v15 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v16 = [v15 startLogSystemMetricsForActivityNamed:@"OctagonActivitySetRecoveryKey"];

    if ([(OTManager *)self isFullPeer])
    {
      uint64_t v26 = 0;
      if (SecPasswordValidatePasswordFormat())
      {
        [v11 startOctagonStateMachine];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10005AAFC;
        v23[3] = &unk_1002FA768;
        id v24 = v16;
        NSErrorUserInfoKey v25 = v10;
        [v11 rpcSetRecoveryKey:v9 reply:v23];

        __int16 v17 = v24;
      }
      else
      {
        id v21 = +[NSMutableDictionary dictionary];
        [v21 setObject:@"malformed recovery key" forKeyedSubscript:NSLocalizedDescriptionKey];
        __int16 v17 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:41 userInfo:v21];
        id v22 = sub_10000B070("SecError");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v17;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "recovery failed validation with error:%@", buf, 0xCu);
        }

        [v16 stopWithEvent:@"OctagonEventSetRecoveryKeyValidationFailed" result:v17];
        v10[2](v10, v17);
      }
    }
    else
    {
      id v18 = sub_10000B070("octagon-recovery");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v19 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v20 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:35 userInfo:v19];

      [v16 stopWithEvent:@"OctagonEventRecoveryKey" result:v20];
      v10[2](v10, v20);
    }
  }
}

- (BOOL)isFullPeer
{
  v2 = [(OTManager *)self deviceInformationAdapter];
  v3 = [v2 modelID];
  BOOL v4 = +[OTDeviceInformation isFullPeer:v3];

  return v4;
}

- (id)cdpContextTypes
{
  if (qword_10035CD30 != -1) {
    dispatch_once(&qword_10035CD30, &stru_1002F8520);
  }
  v2 = (void *)qword_10035CD28;

  return v2;
}

- (void)setupAnalytics
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(objc_class *)[(OTManager *)self loggerClass] logger];
  double v4 = SFAnalyticsSamplerIntervalOncePerReport;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005AE90;
  v9[3] = &unk_1002FA690;
  objc_copyWeak(&v10, &location);
  id v5 = [v3 AddMultiSamplerForName:@"Octagon-healthSummary" withTimeInterval:v9 block:v4];

  id v6 = [(objc_class *)[(OTManager *)self loggerClass] logger];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005C134;
  v8[3] = &unk_1002F8500;
  v8[4] = self;
  id v7 = [v6 AddMultiSamplerForName:@"CFU-healthSummary" withTimeInterval:v8 block:v4];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)persistSendingMetricsPermitted:(id)a3 sendingMetricsPermitted:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v15 = 0;
  id v9 = [(OTManager *)self contextForClientRPC:v8 error:&v15];
  id v10 = v15;
  id v11 = v10;
  if (!v9 || v10)
  {
    id v13 = sub_10000B070("octagon");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchSendingMetricsPermitted for arguments (%@): %@", buf, 0x16u);
    }

    unsigned __int8 v12 = 0;
    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    unsigned __int8 v12 = [v9 persistSendingMetricsPermitted:v6 error:a5];
  }

  return v12;
}

- (BOOL)fetchSendingMetricsPermitted:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  id v7 = [(OTManager *)self contextForClientRPC:v6 error:&v13];
  id v8 = v13;
  id v9 = v8;
  if (!v7 || v8)
  {
    id v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchSendingMetricsPermitted for arguments (%@): %@", buf, 0x16u);
    }

    unsigned __int8 v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    unsigned __int8 v10 = [v7 fetchSendingMetricsPermitted:a4];
  }

  return v10;
}

- (BOOL)ghostbustByAgeEnabled
{
  [(OTManager *)self ensureRampsInitialized];
  v3 = [(OTManager *)self gbAgeRamp];
  unsigned __int8 v4 = [v3 checkRampStateWithError:0];

  return v4;
}

- (BOOL)ghostbustBySerialEnabled
{
  [(OTManager *)self ensureRampsInitialized];
  v3 = [(OTManager *)self gbserialRamp];
  unsigned __int8 v4 = [v3 checkRampStateWithError:0];

  return v4;
}

- (BOOL)ghostbustByMidEnabled
{
  [(OTManager *)self ensureRampsInitialized];
  v3 = [(OTManager *)self gbmidRamp];
  unsigned __int8 v4 = [v3 checkRampStateWithError:0];

  return v4;
}

- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  id v26 = 0;
  BOOL v14 = [(OTManager *)self contextForClientRPC:v10 error:&v26];
  id v15 = v26;
  __int16 v16 = v15;
  if (!v14 || v15)
  {
    id v22 = sub_10000B070("octagon");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v10;
      __int16 v29 = 2112;
      __int16 v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Rejecting a restoreFromBottle RPC for arguments (%@): %@", buf, 0x16u);
    }

    v13[2](v13, v16);
  }
  else
  {
    id v17 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    __int16 v18 = [v17 startLogSystemMetricsForActivityNamed:@"OctagonActivityBottledPeerRestore"];

    id v19 = sub_10000B070("octagon");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "restore via bottle invoked for arguments (%@)", buf, 0xCu);
    }

    [v14 startOctagonStateMachine];
    id v20 = [v10 altDSID];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10005C9F4;
    v23[3] = &unk_1002FA768;
    id v24 = v18;
    NSErrorUserInfoKey v25 = v13;
    id v21 = v18;
    [v14 joinWithBottle:v12 entropy:v11 bottleSalt:v20 reply:v23];
  }
}

- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11
{
  id v17 = a3;
  id v54 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v55 = a8;
  id v56 = a9;
  id v21 = a10;
  id v22 = a11;
  id v63 = 0;
  id v23 = [(OTManager *)self contextForClientRPC:v17 error:&v63];
  id v24 = v63;
  NSErrorUserInfoKey v25 = v24;
  if (v23 && !v24)
  {
    id v26 = objc_alloc_init((Class)TPECPublicKeyFactory);
    v53 = +[TPPeerPermanentInfo permanentInfoWithPeerID:v18 data:v19 sig:v20 keyFactory:v26];

    if (!v53)
    {
      v48 = sub_10000B070("SecError");
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "octagon-rpc-voucher: aborting pairing: unable to validate provided permanentInfo with peerID!", buf, 2u);
      }

      NSErrorUserInfoKey v25 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:74 description:@"Unable to validate peerID with provided permanentInfo"];
      (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0, 0, v25);
      goto LABEL_30;
    }
    if (!sub_10005D250()) {
      goto LABEL_21;
    }
    if (!v21)
    {
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2020000000;
      id v27 = (id *)qword_10035CD40;
      uint64_t v67 = qword_10035CD40;
      if (!qword_10035CD40)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_10005D320;
        v69 = &unk_100308068;
        v70 = &v64;
        id v28 = sub_10005D370();
        __int16 v29 = dlsym(v28, "KCPairingIntent_Capability_FullPeer");
        *(void *)(v70[1] + 24) = v29;
        qword_10035CD40 = *(void *)(v70[1] + 24);
        id v27 = (id *)v65[3];
      }
      _Block_object_dispose(&v64, 8);
      if (!v27)
      {
        v51 = +[NSAssertionHandler currentHandler];
        v52 = +[NSString stringWithUTF8String:"NSString *getKCPairingIntent_Capability_FullPeer(void)"];
        [v51 handleFailureInFunction:v52 file:@"OTManager.m" lineNumber:111 description:@"%s", dlerror()];

        goto LABEL_34;
      }
      id v21 = *v27;
    }
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x2020000000;
    __int16 v30 = (void *)qword_10035CD48;
    uint64_t v67 = qword_10035CD48;
    if (!qword_10035CD48)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10005D420;
      v69 = &unk_100308068;
      v70 = &v64;
      id v31 = sub_10005D370();
      __int16 v32 = dlsym(v31, "KCPairingIntent_Capability_LimitedPeer");
      *(void *)(v70[1] + 24) = v32;
      qword_10035CD48 = *(void *)(v70[1] + 24);
      __int16 v30 = (void *)v65[3];
    }
    _Block_object_dispose(&v64, 8);
    if (v30)
    {
      if ([v21 isEqualToString:*v30])
      {
        id v33 = [v53 modelID];
        unsigned int v34 = +[OTDeviceInformation isFullPeer:v33];

        if (v34)
        {
          __int16 v35 = sub_10000B070("SecError");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "octagon-rpc-voucher: aborting pairing: full peer is attempting to get a voucher on a limited capability pairing context!", buf, 2u);
          }

          NSErrorUserInfoKey v25 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:75 description:@"full peer attempting to join limited capability pairing context"];
          (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0, 0, v25);
LABEL_30:

          goto LABEL_31;
        }
      }
LABEL_21:
      [v23 startOctagonStateMachine];
      v37 = [OTMetricsSessionData alloc];
      v38 = [v17 flowID];
      v39 = [v17 deviceSessionID];
      v40 = [(OTMetricsSessionData *)v37 initWithFlowID:v38 deviceSessionID:v39];
      [v23 setSessionMetrics:v40];

      [v23 setShouldSendMetricsForOctagon:1];
      v41 = _OctagonSignpostLogSystem();
      os_signpost_id_t v42 = _OctagonSignpostCreate();
      uint64_t v44 = v43;

      v45 = _OctagonSignpostLogSystem();
      v46 = v45;
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_BEGIN, v42, "PairingChannelAcceptorVoucher", " enableTelemetry=YES ", buf, 2u);
      }

      v47 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v42;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorVoucher  enableTelemetry=YES ", buf, 0xCu);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v69) = 0;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_10005D470;
      v57[3] = &unk_1002F84D8;
      v60 = buf;
      id v58 = v23;
      os_signpost_id_t v61 = v42;
      uint64_t v62 = v44;
      id v59 = v22;
      [v58 rpcVoucherWithConfiguration:v18 permanentInfo:v19 permanentInfoSig:v20 stableInfo:v55 stableInfoSig:v56 reply:v57];

      _Block_object_dispose(buf, 8);
      NSErrorUserInfoKey v25 = 0;
      goto LABEL_30;
    }
    v49 = +[NSAssertionHandler currentHandler];
    v50 = +[NSString stringWithUTF8String:"NSString *getKCPairingIntent_Capability_LimitedPeer(void)"];
    [v49 handleFailureInFunction:v50 file:@"OTManager.m" lineNumber:112 description:@"%s", dlerror()];

LABEL_34:
    __break(1u);
  }
  v36 = sub_10000B070("octagon");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v25;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Rejecting a rpcVoucher RPC for arguments (%@): %@", buf, 0x16u);
  }

  (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0, 0, v25);
LABEL_31:
}

- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v32 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v32];
  id v12 = v32;
  id v13 = v12;
  if (!v11 || v12)
  {
    NSErrorUserInfoKey v25 = sub_10000B070("octagon");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Rejecting a rpcEpoch RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    [v11 startOctagonStateMachine];
    BOOL v14 = [OTMetricsSessionData alloc];
    id v15 = [v8 flowID];
    __int16 v16 = [v8 deviceSessionID];
    id v17 = [(OTMetricsSessionData *)v14 initWithFlowID:v15 deviceSessionID:v16];
    [v11 setSessionMetrics:v17];

    [v11 setShouldSendMetricsForOctagon:1];
    id v18 = _OctagonSignpostLogSystem();
    os_signpost_id_t v19 = _OctagonSignpostCreate();
    uint64_t v21 = v20;

    id v22 = _OctagonSignpostLogSystem();
    id v23 = v22;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PairingChannelAcceptorEpoch", " enableTelemetry=YES ", buf, 2u);
    }

    id v24 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorEpoch  enableTelemetry=YES ", buf, 0xCu);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v34 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10005DA0C;
    v26[3] = &unk_1002F84B0;
    __int16 v29 = buf;
    id v27 = v11;
    os_signpost_id_t v30 = v19;
    uint64_t v31 = v21;
    id v28 = v10;
    [v27 rpcEpoch:v26];

    _Block_object_dispose(buf, 8);
  }
}

- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void (**)(id, void *))a7;
  id v39 = 0;
  id v17 = [(OTManager *)self contextForClientRPC:v12 error:&v39];
  id v18 = v39;
  os_signpost_id_t v19 = v18;
  if (!v17 || v18)
  {
    uint64_t v31 = sub_10000B070("octagon");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Rejecting a rpcJoinWithArguments RPC for arguments (%@): %@", buf, 0x16u);
    }

    v16[2](v16, v19);
  }
  else
  {
    [v17 handlePairingRestart:v13];
    [v17 startOctagonStateMachine];
    uint64_t v20 = [OTMetricsSessionData alloc];
    uint64_t v21 = [v12 flowID];
    id v22 = [v12 deviceSessionID];
    id v23 = [(OTMetricsSessionData *)v20 initWithFlowID:v21 deviceSessionID:v22];
    [v17 setSessionMetrics:v23];

    [v17 setShouldSendMetricsForOctagon:1];
    id v24 = _OctagonSignpostLogSystem();
    uint64_t v25 = _OctagonSignpostCreate();
    uint64_t v32 = v26;
    os_signpost_id_t v27 = v25;

    id v28 = _OctagonSignpostLogSystem();
    __int16 v29 = v28;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "PairingChannelInitiatorJoinOctagon", " enableTelemetry=YES ", buf, 2u);
    }

    os_signpost_id_t v30 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorJoinOctagon  enableTelemetry=YES ", buf, 0xCu);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v41 = 0;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10005DF60;
    v33[3] = &unk_1002F8488;
    id v34 = v17;
    v36 = buf;
    os_signpost_id_t v37 = v27;
    uint64_t v38 = v32;
    __int16 v35 = v16;
    [v34 rpcJoin:v14 vouchSig:v15 reply:v33];

    _Block_object_dispose(buf, 8);
  }
}

- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v33 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v33];
  id v12 = v33;
  id v13 = v12;
  if (!v11 || v12)
  {
    uint64_t v26 = sub_10000B070("octagon");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Rejecting a rpcPrepareIdentityAsApplicant RPC for arguments (%@): %@", buf, 0x16u);
    }

    (*((void (**)(id, void, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, 0, v13);
  }
  else
  {
    [v11 handlePairingRestart:v9];
    [v11 startOctagonStateMachine];
    id v14 = _OctagonSignpostLogSystem();
    os_signpost_id_t v15 = _OctagonSignpostCreate();
    uint64_t v17 = v16;

    id v18 = _OctagonSignpostLogSystem();
    os_signpost_id_t v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PairingChannelInitiatorPrepare", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v20 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorPrepare  enableTelemetry=YES ", buf, 0xCu);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v35 = 0;
    uint64_t v21 = [OTMetricsSessionData alloc];
    id v22 = [v8 flowID];
    id v23 = [v8 deviceSessionID];
    id v24 = [(OTMetricsSessionData *)v21 initWithFlowID:v22 deviceSessionID:v23];
    [v11 setSessionMetrics:v24];

    [v11 setShouldSendMetricsForOctagon:1];
    id v25 = [v9 epoch];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10005E498;
    v27[3] = &unk_1002F8460;
    os_signpost_id_t v30 = buf;
    id v28 = v11;
    os_signpost_id_t v31 = v15;
    uint64_t v32 = v17;
    id v29 = v10;
    [v28 rpcPrepareIdentityAsApplicantWithConfiguration:v9 epoch:v25 reply:v27];

    _Block_object_dispose(buf, 8);
  }
}

- (void)totalTrustedPeers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v12 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v12];
  id v9 = v12;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a totalTrustedPeers RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    [v8 rpcFetchTotalCountOfTrustedPeers:v7];
  }
}

- (void)fetchEscrowContents:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v18];
  id v9 = v18;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchEscrowContents RPC for arguments (%@): %@", buf, 0x16u);
    }

    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v10);
  }
  else
  {
    id v11 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v12 = [v11 startLogSystemMetricsForActivityNamed:@"OctagonActivityFetchEscrowContents"];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10005E9E4;
    v15[3] = &unk_1002F8438;
    id v16 = v12;
    id v17 = v7;
    id v13 = v12;
    [v8 fetchEscrowContents:v15];
  }
}

- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v20 = 0;
  id v10 = [(OTManager *)self contextForClientRPC:v8 error:&v20];
  id v11 = v20;
  id v12 = v11;
  if (!v10 || v11)
  {
    id v16 = sub_10000B070("octagon");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchAllViableBottles RPC for arguments (%@): %@", buf, 0x16u);
    }

    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v12);
  }
  else
  {
    id v13 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v14 = [v13 startLogSystemMetricsForActivityNamed:@"OctagonActivityFetchAllViableBottles"];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005EC90;
    v17[3] = &unk_1002F8410;
    id v18 = v14;
    id v19 = v9;
    id v15 = v14;
    [v10 rpcFetchAllViableBottlesFromSource:a4 reply:v17];
  }
}

- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v12 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v12];
  id v9 = v12;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a peerDeviceNamesByPeerID RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    [v8 fetchTrustedDeviceNamesByPeerID:v7];
  }
}

- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v21 = 0;
  id v11 = [(OTManager *)self contextForClientRPC:v8 error:&v21];
  id v12 = v21;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v17 = sub_10000B070("octagon");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting a removeFriendsInClique RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, v13);
  }
  else
  {
    id v14 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    __int16 v15 = [v14 startLogSystemMetricsForActivityNamed:@"OctagonActivityRemoveFriendsInClique"];

    [v11 startOctagonStateMachine];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005F078;
    v18[3] = &unk_1002FA768;
    id v19 = v15;
    id v20 = v10;
    id v16 = v15;
    [v11 rpcRemoveFriendsInClique:v9 reply:v18];
  }
}

- (void)leaveClique:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v18 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v18];
  id v9 = v18;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a leaveClique RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    id v11 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v12 = [v11 startLogSystemMetricsForActivityNamed:@"OctagonActivityLeaveClique"];

    [v8 startOctagonStateMachine];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10005F2C8;
    v15[3] = &unk_1002FA768;
    id v16 = v12;
    id v17 = v7;
    id v13 = v12;
    [v8 rpcLeaveClique:v15];
  }
}

- (void)establish:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v19 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v19];
  id v9 = v19;
  id v10 = v9;
  if (!v8 || v9)
  {
    __int16 v15 = sub_10000B070("octagon");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a establish RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    id v11 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    id v12 = [v11 startLogSystemMetricsForActivityNamed:@"OctagonActivityEstablish"];

    [v8 startOctagonStateMachine];
    id v13 = [v6 altDSID];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005F530;
    v16[3] = &unk_1002FA768;
    id v17 = v12;
    id v18 = v7;
    id v14 = v12;
    [v8 rpcEstablish:v13 reply:v16];
  }
}

- (void)performCKServerUnreadableDataRemoval:(id)a3 isGuitarfish:(BOOL)a4 altDSID:(id)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  id v19 = 0;
  id v13 = [(OTManager *)self contextForClientRPC:v10 error:&v19];
  id v14 = v19;
  __int16 v15 = v14;
  if (!v13 || v14)
  {
    id v16 = sub_10000B070("octagon");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a performCKServerUnreadableDataRemoval RPC for arguments (%@): %@", buf, 0x16u);
    }

    v12[2](v12, v15);
  }
  else
  {
    [v13 startOctagonStateMachine];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005F758;
    v17[3] = &unk_1002FB1E8;
    id v18 = v12;
    [v13 performCKServerUnreadableDataRemoval:v8 altDSID:v11 reply:v17];
  }
}

- (void)clearCliqueFromAccount:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v16 = 0;
  id v11 = (void (**)(id, void *))a6;
  id v12 = [(OTManager *)self contextForClientRPC:v10 error:&v16];
  id v13 = v16;
  id v14 = v13;
  if (!v12 || v13)
  {
    __int16 v15 = sub_10000B070("octagon");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a resetAndEstablish RPC for arguments (%@): %@", buf, 0x16u);
    }

    v11[2](v11, v14);
  }
  else
  {
    [v12 startOctagonStateMachine];
    [v12 rpcReset:a4 isGuitarfish:v7 reply:v11];
  }
}

- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 isGuitarfish:(BOOL)a9 reply:(id)a10
{
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = (void (**)(id, void *))a10;
  id v35 = 0;
  id v21 = [(OTManager *)self contextForClientRPC:v16 error:&v35];
  id v22 = v35;
  id v23 = v22;
  if (!v21 || v22)
  {
    os_signpost_id_t v30 = sub_10000B070("octagon");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v16;
      __int16 v38 = 2112;
      id v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Rejecting a resetAndEstablish RPC for arguments (%@): %@", buf, 0x16u);
    }

    v20[2](v20, v23);
  }
  else
  {
    BOOL v31 = v11;
    __int16 v24 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    [v24 startLogSystemMetricsForActivityNamed:@"OctagonActivityResetAndEstablish"];
    id v25 = v18;
    v27 = int64_t v26 = a4;

    [v21 startOctagonStateMachine];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10005FB14;
    v32[3] = &unk_1002FA768;
    id v33 = v27;
    id v34 = v20;
    id v28 = v27;
    int64_t v29 = v26;
    id v18 = v25;
    [v21 rpcResetAndEstablish:v29 idmsTargetContext:v17 idmsCuttlefishPassword:v25 notifyIdMS:v31 accountSettings:v19 isGuitarfish:a9 reply:v32];
  }
}

- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6
{
  LOBYTE(v6) = a5;
  [(OTManager *)self resetAndEstablish:a3 resetReason:a4 idmsTargetContext:0 idmsCuttlefishPassword:0 notifyIdMS:0 accountSettings:0 isGuitarfish:v6 reply:a6];
}

- (void)startOctagonStateMachine:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v13 = 0;
  BOOL v7 = (void (**)(id, void))a4;
  BOOL v8 = [(OTManager *)self contextForClientRPC:v6 error:&v13];
  id v9 = v13;
  id v10 = sub_10000B070("octagon");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Rejecting a startOctagonStateMachine RPC for arguments (%@): %@", buf, 0x16u);
    }

    id v12 = v9;
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received a start-state-machine RPC for arguments (%@)", buf, 0xCu);
    }

    [v8 startOctagonStateMachine];
    id v12 = 0;
  }
  ((void (**)(id, id))v7)[2](v7, v12);
}

- (void)status:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v12 = 0;
  BOOL v7 = (void (**)(id, void, id))a4;
  BOOL v8 = [(OTManager *)self contextForClientRPC:v6 createIfMissing:0 error:&v12];
  id v9 = v12;
  id v10 = sub_10000B070("octagon");
  BOOL v11 = v10;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a status RPC for arguments(%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v9);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Received a status RPC for arguments (%@): %@", buf, 0x16u);
    }

    [v8 rpcStatus:v7];
  }
}

- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void *))a5;
  id v17 = 0;
  BOOL v11 = [(OTManager *)self contextForClientRPC:v8 createIfMissing:0 error:&v17];
  id v12 = v17;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchCliqueStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    v10[2](v10, -1, v13);
  }
  else
  {
    if (!v9) {
      id v9 = objc_alloc_init((Class)OTOperationConfiguration);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000600A0;
    v15[3] = &unk_1002F83E8;
    id v16 = v10;
    [v11 rpcTrustStatus:v9 reply:v15];
  }
}

- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v17 = 0;
  BOOL v11 = [(OTManager *)self contextForClientRPC:v8 error:&v17];
  id v12 = v17;
  id v13 = sub_10000B070("octagon");
  id v14 = v13;
  if (!v11 || v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchTrustStatus RPC for arguments (%@): %@", buf, 0x16u);
    }

    (*((void (**)(id, uint64_t, void, void, void, id))v10 + 2))(v10, -1, 0, 0, 0, v12);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Received a trust status for arguments (%@)", buf, 0xCu);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000602BC;
    v15[3] = &unk_1002F83E8;
    id v16 = v10;
    [v11 rpcTrustStatus:v9 reply:v15];
  }
}

- (void)fetchEgoPeerID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, id))a4;
  id v14 = 0;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v14];
  id v9 = v14;
  id v10 = sub_10000B070("octagon");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchEgoPeerID RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, 0, v9);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received a fetch peer ID for arguments (%@)", buf, 0xCu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100060614;
    v12[3] = &unk_1002FB210;
    id v13 = v7;
    [v8 rpcFetchEgoPeerID:v12];
  }
}

- (void)clearAllContexts
{
  v3 = [(OTManager *)self contexts];

  if (v3)
  {
    unsigned __int8 v4 = [(OTManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100060730;
    block[3] = &unk_100308558;
    block[4] = self;
    dispatch_sync(v4, block);
  }
}

- (id)ckksForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  BOOL v11 = [(OTManager *)self personaAdapter];
  id v12 = [v11 currentThreadPersonaUniqueString];

  id v13 = sub_10000B070("ckkspersona");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 138412290;
    id v23 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "ckksForClientRPC: thread persona is %@", (uint8_t *)&v22, 0xCu);
  }

  id v14 = [(OTManager *)self contextForClientRPC:v10 createIfMissing:v8 allowNonPrimaryAccounts:v7 error:a6];

  if (v14)
  {
    __int16 v15 = [v14 ckks];

    if (v15)
    {
      id v16 = [v14 ckks];
      goto LABEL_17;
    }
    if (a6)
    {
      CFStringRef v17 = @"ckks does not exist";
      uint64_t v18 = 61;
      goto LABEL_10;
    }
    id v19 = sub_10000B070("ckkspersona");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v12;
      __int16 v20 = "ckksForClientRPC: no CKKSKeychainView found for persona %@";
      goto LABEL_15;
    }
  }
  else
  {
    if (a6)
    {
      CFStringRef v17 = @"Context does not exist";
      uint64_t v18 = 31;
LABEL_10:
      +[NSError errorWithDomain:@"com.apple.security.octagon" code:v18 description:v17];
      id v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    id v19 = sub_10000B070("ckkspersona");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v12;
      __int16 v20 = "ckksForClientRPC: no OTCuttlefishContext found for persona %@";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v22, 0xCu);
    }
  }

  id v16 = 0;
LABEL_17:

  return v16;
}

- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6
{
  BOOL v31 = a4;
  BOOL v32 = a5;
  id v7 = a3;
  BOOL v8 = [(OTManager *)self personaAdapter];
  unsigned int v9 = [v8 currentThreadIsForPrimaryiCloudAccount];

  id v10 = [(OTManager *)self accountsAdapter];
  BOOL v11 = [(OTManager *)self personaAdapter];
  id v12 = [v7 altDSID];
  id v13 = [v7 containerName];
  id v14 = v7;
  __int16 v15 = [v7 contextID];
  id v34 = 0;
  id v16 = [v10 findAccountForCurrentThread:v11 optionalAltDSID:v12 cloudkitContainerName:v13 octagonContextID:v15 error:&v34];
  id v17 = v34;

  if (v16 && !v17)
  {
    if (v32 || ([v16 isPrimaryAccount] & 1) != 0)
    {
      uint64_t v18 = [(OTManager *)self contextForClientRPCWithActiveAccount:v16 createIfMissing:v31 allowNonPrimaryAccounts:v32 error:a6];
      id v19 = v14;
      goto LABEL_26;
    }
    int64_t v26 = sub_10000B070("octagon-account");
    id v19 = v14;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Rejecting finding a OTCuttlefishContext for non-primary account (on primary persona)", buf, 2u);
    }

    if (a6)
    {
      +[NSError errorWithDomain:@"com.apple.security.octagon" code:29 description:@"Octagon APIs do not support non-primary accounts"];
      uint64_t v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  id v19 = v14;
  if (!v9)
  {
LABEL_14:
    if (a6)
    {
      if (v17)
      {
        *a6 = v17;
LABEL_22:
        id v28 = sub_10000B070("octagon-account");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = *a6;
          *(_DWORD *)buf = 138412546;
          v36 = v19;
          __int16 v37 = 2112;
          id v38 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Cannot find an account matching: %@ %@", buf, 0x16u);
        }

        goto LABEL_25;
      }
      id v27 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
      *a6 = v27;
      if (v27) {
        goto LABEL_22;
      }
    }
LABEL_25:
    uint64_t v18 = 0;
    goto LABEL_26;
  }
  __int16 v20 = [v14 altDSID];
  if (v20
    || ([v19 containerName],
        __int16 v20 = objc_claimAutoreleasedReturnValue(),
        ![v20 isEqualToString:@"com.apple.security.keychain"]))
  {

    goto LABEL_14;
  }
  id v21 = [v19 contextID];
  unsigned int v22 = [v21 isEqualToString:@"defaultContext"];

  if (!v22) {
    goto LABEL_14;
  }
  id v23 = sub_10000B070("octagon-account");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v19;
    __int16 v37 = 2112;
    id v38 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Cannot find an account matching primary persona/altDSID, allowing default context return: %@ %@", buf, 0x16u);
  }

  __int16 v24 = [v19 containerName];
  id v25 = [v19 contextID];
  uint64_t v18 = [(OTManager *)self contextForContainerName:v24 contextID:v25];

LABEL_26:

  return v18;
}

- (id)contextForClientRPCWithActiveAccount:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6
{
  BOOL v27 = a4;
  id v7 = a3;
  if (qword_10035D098 != -1) {
    dispatch_once(&qword_10035D098, &stru_100303AB8);
  }
  if (byte_10035D090 || ([v7 isPrimaryAccount] & 1) == 0)
  {
    BOOL v8 = sub_10000B070("octagon-account");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finding a context for user: %@", buf, 0xCu);
    }
  }
  int64_t v26 = [v7 cloudkitContainerName];
  [v7 octagonContextID];
  v10 = id v9 = v7;
  BOOL v11 = [(OTManager *)self sosAdapter];
  id v12 = [(OTManager *)self accountsAdapter];
  id v13 = [(OTManager *)self authKitAdapter];
  id v14 = [(OTManager *)self tooManyPeersAdapter];
  __int16 v15 = [(OTManager *)self tapToRadarAdapter];
  id v16 = [(OTManager *)self lockStateTracker];
  id v17 = [(OTManager *)self deviceInformationAdapter];
  id v29 = v9;
  uint64_t v18 = [(OTManager *)self contextForContainerName:v26 contextID:v10 possibleAccount:v9 createIfMissing:v27 sosAdapter:v11 accountsAdapter:v12 authKitAdapter:v13 tooManyPeersAdapter:v14 tapToRadarAdapter:v15 lockStateTracker:v16 deviceInformationAdapter:v17];

  if (a6 && !v18)
  {
    *a6 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:31 description:@"Context does not exist"];
  }
  uint64_t v19 = [v18 activeAccount];
  if (v19)
  {
    __int16 v20 = (void *)v19;
    id v21 = [v18 activeAccount];
    unsigned __int8 v22 = [v21 isEqual:v29];

    if ((v22 & 1) == 0)
    {
      id v23 = sub_10000B070("octagon-account");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = [v18 activeAccount];
        *(_DWORD *)buf = 138412546;
        id v31 = v29;
        __int16 v32 = 2112;
        id v33 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Context for user(%@) is for user(%@) instead", buf, 0x16u);
      }
    }
  }

  return v18;
}

- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(OTManager *)self personaAdapter];
  unsigned __int8 v10 = [v9 currentThreadIsForPrimaryiCloudAccount];

  if (qword_10035D098 != -1) {
    dispatch_once(&qword_10035D098, &stru_100303AB8);
  }
  int v11 = byte_10035D090;
  if (byte_10035D090)
  {
    id v12 = sub_10000B070("SecWarning");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "octagon-account: Supporting non-primary accounts on possibly-unsupported platform", buf, 2u);
    }

    goto LABEL_8;
  }
  if (v10)
  {
LABEL_8:
    id v13 = [(OTManager *)self contextForClientRPC:v8 createIfMissing:v6 allowNonPrimaryAccounts:v11 != 0 error:a5];
    goto LABEL_9;
  }
  __int16 v15 = sub_10000B070("octagon");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting client RPC for non-primary persona", v16, 2u);
  }

  if (a5)
  {
    +[NSError errorWithDomain:@"com.apple.security.octagon" code:29 description:@"Octagon APIs do not support non-primary users"];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
LABEL_9:

  return v13;
}

- (id)contextForClientRPC:(id)a3 error:(id *)a4
{
  return [(OTManager *)self contextForClientRPC:a3 createIfMissing:1 error:a4];
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4
{
  return [(OTManager *)self contextForContainerName:a3 contextID:a4 possibleAccount:0];
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v19 = [(OTManager *)self sosAdapter];
  uint64_t v18 = [(OTManager *)self accountsAdapter];
  int v11 = [(OTManager *)self authKitAdapter];
  id v12 = [(OTManager *)self tooManyPeersAdapter];
  id v13 = [(OTManager *)self tapToRadarAdapter];
  id v14 = [(OTManager *)self lockStateTracker];
  __int16 v15 = [(OTManager *)self deviceInformationAdapter];
  id v16 = [(OTManager *)self contextForContainerName:v10 contextID:v9 possibleAccount:v8 createIfMissing:1 sosAdapter:v19 accountsAdapter:v18 authKitAdapter:v11 tooManyPeersAdapter:v12 tapToRadarAdapter:v13 lockStateTracker:v14 deviceInformationAdapter:v15];

  return v16;
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5 createIfMissing:(BOOL)a6 sosAdapter:(id)a7 accountsAdapter:(id)a8 authKitAdapter:(id)a9 tooManyPeersAdapter:(id)a10 tapToRadarAdapter:(id)a11 lockStateTracker:(id)a12 deviceInformationAdapter:(id)a13
{
  uint64_t v18 = (__CFString *)a3;
  id v41 = a4;
  id v40 = a5;
  id v39 = a7;
  id v19 = a8;
  id v36 = a9;
  id v34 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = sub_1000616E8;
  os_signpost_id_t v61 = sub_1000616F8;
  id v62 = 0;
  if (!v18)
  {
    uint64_t v18 = @"com.apple.security.keychain";
    id v23 = @"com.apple.security.keychain";
  }
  queue = [(OTManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061700;
  block[3] = &unk_1002F83C0;
  uint64_t v44 = v18;
  id v45 = v41;
  BOOL v56 = a6;
  v46 = self;
  id v47 = v40;
  id v48 = v19;
  id v49 = v39;
  id v50 = v36;
  id v51 = v34;
  id v52 = v20;
  id v53 = v21;
  id v54 = v22;
  id v55 = &v57;
  id v38 = v22;
  id v33 = v21;
  id v32 = v20;
  id v35 = v34;
  id v24 = v36;
  id v25 = v39;
  id v26 = v19;
  id v27 = v40;
  id v28 = v41;
  id v29 = v18;
  dispatch_sync(queue, block);

  id v30 = (id)v58[5];
  _Block_object_dispose(&v57, 8);

  return v30;
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4 sosAdapter:(id)a5 accountsAdapter:(id)a6 authKitAdapter:(id)a7 tooManyPeersAdapter:(id)a8 tapToRadarAdapter:(id)a9 lockStateTracker:(id)a10 deviceInformationAdapter:(id)a11
{
  return [(OTManager *)self contextForContainerName:a3 contextID:a4 possibleAccount:0 createIfMissing:1 sosAdapter:a5 accountsAdapter:a6 authKitAdapter:a7 tooManyPeersAdapter:a8 tapToRadarAdapter:a9 lockStateTracker:a10 deviceInformationAdapter:a11];
}

- (void)cancelPendingOperations
{
  id v2 = [(OTManager *)self savedTLKNotifier];
  [v2 cancel];
}

- (void)dropAllActors
{
}

- (void)haltAll
{
}

- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1000616E8;
  id v17 = sub_1000616F8;
  id v18 = 0;
  id v5 = [(OTManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061DB0;
  block[3] = &unk_100306E50;
  void block[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  dispatch_sync(v5, block);

  if (v14[5])
  {
    id v7 = -[OTManager restartOctagonContext:](self, "restartOctagonContext:");
    id v8 = [v7 ckks];
  }
  else
  {
    id v7 = sub_1000CD884(@"ckkstests", 0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not find a parent OTCuttlefishContext for view: %@", buf, 0xCu);
    }
    id v8 = 0;
  }

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)restartOctagonContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 ckks];
  id v20 = [v5 viewAllowList];
  id v6 = [v4 containerName];
  id v19 = [v4 contextID];

  id v21 = v5;
  id v7 = [v5 operationDependencies];
  id v8 = [v7 activeAccount];

  [(OTManager *)self removeContextForContainerName:v6 contextID:v19];
  id v9 = [(OTManager *)self sosAdapter];
  id v10 = [(OTManager *)self accountsAdapter];
  id v11 = [(OTManager *)self authKitAdapter];
  id v12 = [(OTManager *)self tooManyPeersAdapter];
  uint64_t v13 = [(OTManager *)self tapToRadarAdapter];
  id v14 = [(OTManager *)self lockStateTracker];
  uint64_t v15 = [(OTManager *)self deviceInformationAdapter];
  id v16 = [(OTManager *)self contextForContainerName:v6 contextID:v19 possibleAccount:v8 createIfMissing:1 sosAdapter:v9 accountsAdapter:v10 authKitAdapter:v11 tooManyPeersAdapter:v12 tapToRadarAdapter:v13 lockStateTracker:v14 deviceInformationAdapter:v15];

  if (v20)
  {
    id v17 = [v16 ckks];
    [v17 setSyncingViewsAllowList:v20];
  }

  return v16;
}

- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4 possibleAccount:(id)a5
{
  id v5 = [(OTManager *)self contextForContainerName:a3 contextID:a4 possibleAccount:a5];
  if (!v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No context for container/contextID", v9, 2u);
    }
  }
  id v7 = [v5 ckks];

  return v7;
}

- (void)removeContextForContainerName:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(OTManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062330;
  block[3] = &unk_100305720;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (NSXPCProxyCreating)cuttlefishXPCConnection
{
  cuttlefishXPCConnection = self->_cuttlefishXPCConnection;
  if (!cuttlefishXPCConnection)
  {
    id v18 = self;
    id v17 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.TrustedPeersHelper"];
    id v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TrustedPeersHelperProtocol];
    if (qword_10035D298 != -1) {
      dispatch_once(&qword_10035D298, &stru_100306DF8);
    }
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    id v5 = +[NSArray arrayWithObjects:v38 count:2];
    id v28 = +[NSSet setWithArray:v5];

    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:v37 count:2];
    id v7 = +[NSSet setWithArray:v6];

    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    id v8 = +[NSArray arrayWithObjects:v36 count:2];
    id v29 = +[NSSet setWithArray:v8];

    id v26 = +[NSSet setWithObject:objc_opt_class()];
    id v27 = +[NSSet setWithObject:objc_opt_class()];
    id v24 = +[NSSet setWithObject:objc_opt_class()];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    id v9 = +[NSArray arrayWithObjects:v35 count:2];
    id v23 = +[NSSet setWithArray:v9];

    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    v34[3] = objc_opt_class();
    id v10 = +[NSArray arrayWithObjects:v34 count:4];
    id v25 = +[NSSet setWithArray:v10];

    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    id v11 = +[NSArray arrayWithObjects:v33 count:2];
    id v22 = +[NSSet setWithArray:v11];

    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    id v12 = +[NSArray arrayWithObjects:v32 count:2];
    id v21 = +[NSSet setWithArray:v12];

    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    id v13 = +[NSArray arrayWithObjects:v31 count:2];
    id v20 = +[NSSet setWithArray:v13];

    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    id v14 = +[NSArray arrayWithObjects:v30 count:2];
    id v19 = +[NSSet setWithArray:v14];

    [v4 setClasses:qword_10035D290 forSelector:"honorIDMSListChangesForSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"dumpWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"octagonPeerIDGivenBottleIDWithSpecificUser:bottleID:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"trustedDeviceNamesByPeerIDWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"departByDistrustingSelfWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"distrustPeerIDsWithSpecificUser:peerIDs:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"dropPeerIDsWithSpecificUser:peerIDs:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"trustStatusWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"resetWithSpecificUser:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:isGuitarfish:accountType:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"localResetWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"setAllowedMachineIDsWithSpecificUser:allowedMachineIDs:userInitiatedRemovals:evictedRemovals:unknownReasonRemovals:honorIDMSListChanges:version:flowID:deviceSessionID:canSendMetrics:altDSID:trustedDeviceHash:deletedDeviceHash:trustedDevicesUpdateTimestamp:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"markTrustedDeviceListFetchFailed:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"fetchAllowedMachineIDsWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"fetchEgoEpochWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:reply:" argumentIndex:6 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:argumentIndex:ofReply:];
    [v4 setClasses:qword_10035D290 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:3 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:argumentIndex:ofReply:];
    [v4 setClasses:qword_10035D290 forSelector:"preflightVouchWithBottleWithSpecificUser:bottleID:reply:" argumentIndex:3 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:argumentIndex:ofReply:];
    [v4 setClasses:qword_10035D290 forSelector:"preflightVouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:reply:" argumentIndex:2 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:x0 argumentIndex:x1 ofReply:x2];
    [v4 setClasses:qword_10035D290 forSelector:argumentIndex:ofReply:];
    [v4 setClasses:qword_10035D290 forSelector:argumentIndex:ofReply:];
    [v4 setClasses:qword_10035D290 forSelector:argumentIndex:ofReply:];
    [v4 setClasses:qword_10035D290 forSelector:argumentIndex:ofReply:];
    [v4 setClasses:qword_10035D290 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:3 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"preflightPreapprovedJoinWithSpecificUser:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:3 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:x0 argumentIndex:x1 ofReply:x2];
    [v4 setClasses:qword_10035D290 forSelector:"setPreapprovedKeysWithSpecificUser:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:argumentIndex:ofReply:];
    [v4 setClasses:qword_10035D290 forSelector:"fetchViableBottlesWithSpecificUser:source:flowID:deviceSessionID:reply:" argumentIndex:2 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"fetchViableEscrowRecordsWithSpecificUser:source:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"fetchEscrowContentsWithSpecificUser:reply:" argumentIndex:3 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"fetchPolicyDocumentsWithSpecificUser:versions:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"fetchCurrentPolicyWithSpecificUser:modelIDOverride:isInheritedAccount:reply:" argumentIndex:2 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:x0 argumentIndex:x1 ofReply:x2];
    [v4 setClasses:qword_10035D290 forSelector:"setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:2 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"removeCustodianRecoveryKeyWithSpecificUser:uuid:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:argumentIndex:ofReply:];
    [v4 setClasses:qword_10035D290 forSelector:x0 argumentIndex:x1 ofReply:x2];
    [v4 setClasses:qword_10035D290 forSelector:"getSupportAppInfoWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"resetAccountCDPContentsWithSpecificUser:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"removeEscrowCacheWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"fetchAccountSettingsWithSpecificUser:forceFetch:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"isRecoveryKeySet:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:qword_10035D290 forSelector:"testSemaphoreWithSpecificUser:arg:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v25 forSelector:"fetchAccountSettingsWithSpecificUser:forceFetch:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v29 forSelector:"fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v28 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:0];
    [v4 setClasses:v7 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:2 ofReply:0];
    [v4 setClasses:v29 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:v28 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:3 ofReply:0];
    [v4 setClasses:v7 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:4 ofReply:0];
    [v4 setClasses:v29 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:v28 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:0];
    [v4 setClasses:v7 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:2 ofReply:0];
    [v4 setClasses:v29 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:v28 forSelector:"vouchWithSpecificUser:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:ckksKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:6 ofReply:0];
    [v4 setClasses:v7 forSelector:"vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:" argumentIndex:4 ofReply:0];
    [v4 setClasses:v7 forSelector:"vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:" argumentIndex:2 ofReply:1];
    [v4 setClasses:v28 forSelector:"setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:" argumentIndex:3 ofReply:0];
    [v4 setClasses:v29 forSelector:"setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v28 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:3 ofReply:0];
    [v4 setClasses:v29 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v7 forSelector:"vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:" argumentIndex:3 ofReply:0];
    [v4 setClasses:v7 forSelector:"vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:" argumentIndex:2 ofReply:1];
    [v4 setClasses:v7 forSelector:"vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:" argumentIndex:2 ofReply:0];
    [v4 setClasses:v7 forSelector:"vouchWithRerollWithSpecificUser:oldPeerID:tlkShares:reply:" argumentIndex:2 ofReply:0];
    [v4 setClasses:v29 forSelector:"prepareInheritancePeerWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:crk:reply:" argumentIndex:7 ofReply:1];
    [v4 setClasses:v7 forSelector:"vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:" argumentIndex:2 ofReply:1];
    [v4 setClasses:v7 forSelector:"recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:" argumentIndex:2 ofReply:0];
    [v4 setClasses:v7 forSelector:"recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v27 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:v27 forSelector:"preflightVouchWithCustodianRecoveryKeyWithSpecificUser:crk:reply:" argumentIndex:1 ofReply:0];
    [v4 setClasses:v27 forSelector:"vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:" argumentIndex:1 ofReply:0];
    [v4 setClasses:v27 forSelector:"findCustodianRecoveryKeyWithSpecificUser:uuid:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v24 forSelector:"requestHealthCheckWithSpecificUser:requiresEscrowCheck:repair:knownFederations:flowID:deviceSessionID:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v26 forSelector:"updateWithSpecificUser:forceRefetch:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v26 forSelector:"fetchTrustStateWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v23 forSelector:"fetchTrustStateWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:v28 forSelector:"updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:" argumentIndex:1 ofReply:0];
    [v4 setClasses:v7 forSelector:"updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:" argumentIndex:2 ofReply:0];
    [v4 setClasses:v29 forSelector:"updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v20 forSelector:"fetchCurrentItemWithSpecificUser:items:reply:" argumentIndex:1 ofReply:0];
    [v4 setClasses:v19 forSelector:"fetchCurrentItemWithSpecificUser:items:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v29 forSelector:"fetchCurrentItemWithSpecificUser:items:reply:" argumentIndex:1 ofReply:1];
    [v4 setClasses:v22 forSelector:"fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:" argumentIndex:1 ofReply:0];
    [v4 setClasses:v21 forSelector:"fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:" argumentIndex:0 ofReply:1];
    [v4 setClasses:v29 forSelector:"fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:" argumentIndex:1 ofReply:1];

    [v17 setRemoteObjectInterface:v4];
    [v17 resume];
    uint64_t v15 = v18->_cuttlefishXPCConnection;
    v18->_cuttlefishXPCConnection = (NSXPCProxyCreating *)v17;

    cuttlefishXPCConnection = v18->_cuttlefishXPCConnection;
  }

  return cuttlefishXPCConnection;
}

- (void)setCuttlefishXPCConnection:(id)a3
{
}

- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v14 = 0;
  id v7 = (void (**)(id, id))a4;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v14];
  id v9 = v14;
  id v10 = sub_10000B070("octagon");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Rejecting a IDMS trust level change RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v9);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received a notification of IDMS trust level change in %@", buf, 0xCu);
    }

    id v13 = 0;
    [v8 idmsTrustLevelChanged:&v13];
    id v12 = v13;
    v7[2](v7, v12);

    id v7 = (void (**)(id, id))v12;
  }
}

- (void)appleAccountSignedOut:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v26 = (void (**)(id, void))a4;
  id v28 = v5;
  id v6 = [v5 altDSID];

  if (v6)
  {
    id v7 = sub_10000B070("octagon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "signing out of octagon trust: %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x3032000000;
    id v39 = sub_1000616E8;
    id v40 = sub_1000616F8;
    id v41 = 0;
    id v8 = [(OTManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100063A28;
    block[3] = &unk_100307348;
    void block[4] = self;
    void block[5] = &buf;
    dispatch_sync(v8, block);

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = *(id *)(*((void *)&buf + 1) + 40);
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v10)
    {
      char v11 = 0;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v15 = [v28 altDSID];
          id v16 = [v14 activeAccount];
          __int16 v17 = [v16 altDSID];
          unsigned int v18 = [v15 isEqualToString:v17];

          if (v18)
          {
            id v19 = sub_10000B070("octagon");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v34 = 138412290;
              id v35 = v14;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "signing out of octagon trust for context: %@", v34, 0xCu);
            }

            id v20 = [(objc_class *)[(OTManager *)self loggerClass] logger];
            id v21 = [v20 startLogSystemMetricsForActivityNamed:@"OctagonActivityAccountNotAvailable"];

            [v14 accountNoLongerAvailable];
            [v21 stopWithEvent:@"OctagonEventSignOut" result:0];

            char v11 = 1;
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v10);

      if (v11)
      {
        v26[2](v26, 0);
LABEL_24:
        _Block_object_dispose(&buf, 8);

        goto LABEL_25;
      }
    }
    else
    {
    }
    id v24 = sub_10000B070("octagon");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to find a context to sign out.", v34, 2u);
    }

    id v25 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:31 description:@"Couldn't find a context with this altDSID"];
    ((void (**)(id, void *))v26)[2](v26, v25);

    goto LABEL_24;
  }
  id v22 = sub_10000B070("octagon-account");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "rejecting a signout RPC due to missing altDSID: %@", (uint8_t *)&buf, 0xCu);
  }

  id v23 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:29 description:@"Must provide an altDSID to sign out"];
  ((void (**)(id, void *))v26)[2](v26, v23);

LABEL_25:
}

- (void)appleAccountSignedIn:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v19 = 0;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(OTManager *)self contextForClientRPC:v6 error:&v19];
  id v9 = v19;
  id v10 = v9;
  if (!v8 || v9)
  {
    __int16 v17 = sub_10000B070("octagon");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting a signin RPC for arguments (%@): %@", buf, 0x16u);
    }

    v7[2](v7, v10);
  }
  else
  {
    char v11 = [(objc_class *)[(OTManager *)self loggerClass] logger];
    uint64_t v12 = [v11 startLogSystemMetricsForActivityNamed:@"OctagonActivityAccountAvailable"];

    id v13 = sub_10000B070("octagon");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v6 altDSID];
      *(_DWORD *)long long buf = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "signing in %@ for altDSID: %@", buf, 0x16u);
    }
    uint64_t v15 = [v6 altDSID];
    id v18 = 0;
    [v8 accountAvailable:v15 error:&v18];
    id v16 = v18;

    [v12 stopWithEvent:@"OctagonEventSignIn" result:v16];
    v7[2](v7, v16);

    id v7 = (void (**)(id, void *))v12;
  }
}

- (void)ensureRampsInitialized
{
  v3 = +[CKKSViewManager manager];
  id v18 = [v3 container];

  id v4 = [v18 privateCloudDatabase];
  id v5 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"metadata_zone" ownerName:CKCurrentUserDefaultName];
  id v6 = +[CKKSViewManager manager];
  id v7 = [v6 accountTracker];

  id v8 = +[CKKSViewManager manager];
  id v9 = [v8 reachabilityTracker];

  id v10 = +[CKKSViewManager manager];
  char v11 = [v10 lockStateTracker];

  uint64_t v12 = [(OTManager *)self gbmidRamp];

  if (!v12)
  {
    id v13 = [[OTRamp alloc] initWithRecordName:@"metadata_rampstate_ghostBustMID" localSettingName:@"ghostBustMID" container:v18 database:v4 zoneID:v5 accountTracker:v7 lockStateTracker:v11 reachabilityTracker:v9 fetchRecordRecordsOperationClass:objc_opt_class()];
    [(OTManager *)self setGbmidRamp:v13];
  }
  id v14 = [(OTManager *)self gbserialRamp];

  if (!v14)
  {
    uint64_t v15 = [[OTRamp alloc] initWithRecordName:@"metadata_rampstate_ghostBustSerial" localSettingName:@"ghostBustSerial" container:v18 database:v4 zoneID:v5 accountTracker:v7 lockStateTracker:v11 reachabilityTracker:v9 fetchRecordRecordsOperationClass:objc_opt_class()];
    [(OTManager *)self setGbserialRamp:v15];
  }
  id v16 = [(OTManager *)self gbAgeRamp];

  if (!v16)
  {
    __int16 v17 = [[OTRamp alloc] initWithRecordName:@"metadata_rampstate_ghostBustAge" localSettingName:@"ghostBustAge" container:v18 database:v4 zoneID:v5 accountTracker:v7 lockStateTracker:v11 reachabilityTracker:v9 fetchRecordRecordsOperationClass:objc_opt_class()];
    [(OTManager *)self setGbAgeRamp:v17];
  }
}

- (void)registerForCircleChangedNotifications
{
  if (-[OTSOSActualAdapter sosEnabled]_0())
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    int out_token = -1;
    v3 = (const char *)kSOSCCCircleChangedNotification;
    id v4 = dispatch_get_global_queue(17, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100064070;
    handler[3] = &unk_100306F38;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &out_token, v4, handler);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)moveToCheckTrustedStateForArguments:(id)a3
{
  id v6 = 0;
  v3 = [(OTManager *)self contextForClientRPC:a3 createIfMissing:0 error:&v6];
  id v4 = v6;
  if (v4)
  {
    id v5 = sub_10000B070("octagon");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cannot move to check trusted state: %@", buf, 0xCu);
    }
  }
  [v3 startOctagonStateMachine];
  [v3 moveToCheckTrustedState];
}

- (BOOL)waitForReady:(id)a3 wait:(int64_t)a4
{
  id v10 = 0;
  id v5 = [(OTManager *)self contextForClientRPC:a3 createIfMissing:0 error:&v10];
  id v6 = v10;
  if (v5)
  {
    unsigned __int8 v7 = [v5 waitForReady:a4];
  }
  else
  {
    id v8 = sub_10000B070("octagon");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cannot wait for ready: %@", buf, 0xCu);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)initializeOctagon
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing Octagon...", buf, 2u);
  }

  id v4 = sub_10000B070("octagon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "starting default state machine...", buf, 2u);
  }

  if (qword_10035D098 != -1) {
    dispatch_once(&qword_10035D098, &stru_100303AB8);
  }
  if (byte_10035D090)
  {
    id v5 = [(OTManager *)self accountsAdapter];
    id v6 = [v5 inflateAllTPSpecificUsers:@"com.apple.security.keychain" octagonContextID:@"defaultContext"];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v23;
      *(void *)&long long v9 = 138412290;
      long long v20 = v9;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v21 = 0;
          id v14 = -[OTManager contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:](self, "contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:", v13, 1, 1, &v21, v20);
          id v15 = v21;
          id v16 = sub_10000B070("octagon");
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          if (v14) {
            BOOL v18 = v15 == 0;
          }
          else {
            BOOL v18 = 0;
          }
          if (v18)
          {
            if (v17)
            {
              *(_DWORD *)long long buf = v20;
              uint64_t v27 = v13;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "kicking off state machine for active account: %@", buf, 0xCu);
            }

            [v14 startOctagonStateMachine];
          }
          else
          {
            if (v17)
            {
              *(_DWORD *)long long buf = 138412546;
              uint64_t v27 = v13;
              __int16 v28 = 2112;
              id v29 = v15;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "failed to get context for active account: %@, error:%@", buf, 0x16u);
            }
          }
        }
        id v10 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v10);
    }
  }
  id v19 = [(OTManager *)self contextForContainerName:@"com.apple.security.keychain" contextID:@"defaultContext"];
  [v19 startOctagonStateMachine];
  [(OTManager *)self registerForCircleChangedNotifications];
}

- (OTManager)initWithSOSAdapter:(id)a3 lockStateTracker:(id)a4 personaAdapter:(id)a5 cloudKitClassDependencies:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v45.receiver = self;
  v45.super_class = (Class)OTManager;
  id v15 = [(OTManager *)&v45 init];
  id v16 = v15;
  if (v15)
  {
    id v41 = v13;
    objc_storeStrong((id *)&v15->_sosAdapter, a3);
    objc_storeStrong((id *)&v16->_lockStateTracker, a4);
    objc_storeStrong((id *)&v16->_personaAdapter, a5);
    objc_storeStrong((id *)&v16->_cloudKitClassDependencies, a6);
    uint64_t v17 = +[NSMutableDictionary dictionary];
    contexts = v16->_contexts;
    v16->_contexts = (NSMutableDictionary *)v17;

    uint64_t v19 = +[OTManager makeCKContainer:@"com.apple.security.keychain"];
    cloudKitContainer = v16->_cloudKitContainer;
    v16->_cloudKitContainer = (CKContainer *)v19;

    id v21 = -[CKKSAccountStateTracker init:nsnotificationCenterClass:]([CKKSAccountStateTracker alloc], "init:nsnotificationCenterClass:", v16->_cloudKitContainer, [v14 nsnotificationCenterClass]);
    accountStateTracker = v16->_accountStateTracker;
    v16->_accountStateTracker = v21;

    long long v23 = objc_alloc_init(CKKSReachabilityTracker);
    reachabilityTracker = v16->_reachabilityTracker;
    v16->_reachabilityTracker = v23;

    uint64_t v25 = [v14 notifierClass];
    Class notifierClass = v16->_notifierClass;
    v16->_Class notifierClass = (Class)v25;

    uint64_t v27 = [CKKSViewManager alloc];
    id v29 = v16->_reachabilityTracker;
    __int16 v28 = v16->_cloudKitContainer;
    long long v30 = v16->_accountStateTracker;
    personaAdapter = v16->_personaAdapter;
    long long v32 = [(OTManager *)v16 accountsAdapter];
    id v33 = [(CKKSViewManager *)v27 initWithContainer:v28 sosAdapter:v11 accountStateTracker:v30 lockStateTracker:v12 reachabilityTracker:v29 personaAdapter:personaAdapter cloudKitClassDependencies:v14 accountsAdapter:v32];
    viewManager = v16->_viewManager;
    v16->_viewManager = v33;

    dispatch_queue_t v35 = dispatch_queue_create("otmanager", 0);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v35;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v16);
    __int16 v37 = [CKKSNearFutureScheduler alloc];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10006491C;
    v42[3] = &unk_1003077A0;
    objc_copyWeak(&v43, &location);
    uint64_t v38 = [(CKKSNearFutureScheduler *)v37 initWithName:@"newtlks" delay:5000000000 keepProcessAlive:1 dependencyDescriptionCode:0 block:v42];
    savedTLKNotifier = v16->_savedTLKNotifier;
    v16->_savedTLKNotifier = v38;

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
    id v13 = v41;
  }

  return v16;
}

- (OTManager)initWithSOSAdapter:(id)a3 accountsAdapter:(id)a4 authKitAdapter:(id)a5 tooManyPeersAdapter:(id)a6 tapToRadarAdapter:(id)a7 deviceInformationAdapter:(id)a8 personaAdapter:(id)a9 apsConnectionClass:(Class)a10 escrowRequestClass:(Class)a11 notifierClass:(Class)a12 loggerClass:(Class)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 cloudKitClassDependencies:(id)a16 cuttlefishXPCConnection:(id)a17 cdpd:(id)a18
{
  id v55 = a3;
  id v54 = a4;
  id v43 = a5;
  id v51 = a5;
  id v50 = a6;
  id v49 = a7;
  id v48 = a8;
  id v47 = a9;
  id v53 = a14;
  id v46 = a15;
  id v23 = a16;
  id v45 = a17;
  id v44 = a18;
  v60.receiver = self;
  v60.super_class = (Class)OTManager;
  long long v24 = [(OTManager *)&v60 init];
  uint64_t v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_sosAdapter, a3);
    objc_storeStrong((id *)&v25->_accountsAdapter, a4);
    objc_storeStrong((id *)&v25->_authKitAdapter, v43);
    objc_storeStrong((id *)&v25->_tooManyPeersAdapter, a6);
    objc_storeStrong((id *)&v25->_tapToRadarAdapter, a7);
    objc_storeStrong((id *)&v25->_deviceInformationAdapter, a8);
    objc_storeStrong((id *)&v25->_personaAdapter, a9);
    objc_storeStrong((id *)&v25->_loggerClass, a13);
    objc_storeStrong((id *)&v25->_lockStateTracker, a14);
    objc_storeStrong((id *)&v25->_reachabilityTracker, a15);
    objc_storeStrong((id *)&v25->_cuttlefishXPCConnection, a17);
    uint64_t v26 = +[OTManager makeCKContainer:@"com.apple.security.keychain"];
    cloudKitContainer = v25->_cloudKitContainer;
    v25->_cloudKitContainer = (CKContainer *)v26;

    __int16 v28 = -[CKKSAccountStateTracker init:nsnotificationCenterClass:]([CKKSAccountStateTracker alloc], "init:nsnotificationCenterClass:", v25->_cloudKitContainer, [v23 nsnotificationCenterClass]);
    accountStateTracker = v25->_accountStateTracker;
    v25->_accountStateTracker = v28;

    objc_storeStrong((id *)&v25->_cloudKitClassDependencies, a16);
    uint64_t v30 = +[NSMutableDictionary dictionary];
    contexts = v25->_contexts;
    v25->_contexts = (NSMutableDictionary *)v30;

    dispatch_queue_t v32 = dispatch_queue_create("otmanager", 0);
    queue = v25->_queue;
    v25->_queue = (OS_dispatch_queue *)v32;

    objc_storeStrong((id *)&v25->_apsConnectionClass, a10);
    objc_storeStrong((id *)&v25->_escrowRequestClass, a11);
    objc_storeStrong((id *)&v25->_notifierClass, a12);
    objc_storeStrong((id *)&v25->_cdpd, a18);
    id v34 = [[CKKSViewManager alloc] initWithContainer:v25->_cloudKitContainer sosAdapter:v55 accountStateTracker:v25->_accountStateTracker lockStateTracker:v53 reachabilityTracker:v25->_reachabilityTracker personaAdapter:v25->_personaAdapter cloudKitClassDependencies:v23 accountsAdapter:v54];
    viewManager = v25->_viewManager;
    v25->_viewManager = v34;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v25);
    id v36 = [CKKSNearFutureScheduler alloc];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100064DE0;
    v57[3] = &unk_1003077A0;
    objc_copyWeak(&v58, &location);
    __int16 v37 = [(CKKSNearFutureScheduler *)v36 initWithName:@"newtlks" delay:5000000000 keepProcessAlive:1 dependencyDescriptionCode:0 block:v57];
    savedTLKNotifier = v25->_savedTLKNotifier;
    v25->_savedTLKNotifier = v37;

    id v39 = [(OTManager *)v25 contextForContainerName:@"com.apple.security.keychain" contextID:@"defaultContext"];
    id v40 = sub_10000B070("octagon");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "otmanager init", buf, 2u);
    }

    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);
  }

  return v25;
}

- (OTManager)init
{
  if (qword_10035D088 != -1) {
    dispatch_once(&qword_10035D088, &stru_100303A98);
  }
  if (byte_10035BC68) {
    id v2 = [[OTSOSActualAdapter alloc] initAsEssential:0];
  }
  else {
    id v2 = objc_alloc_init(OTSOSMissingAdapter);
  }
  long long v20 = v2;
  id v14 = objc_alloc_init(OTAccountsActualAdapter);
  v3 = objc_alloc_init(OTAuthKitActualAdapter);
  uint64_t v17 = objc_alloc_init(OTTooManyPeersActualAdapter);
  id v16 = objc_alloc_init(OTTapToRadarActualAdapter);
  id v15 = objc_alloc_init(OTDeviceInformationActualAdapter);
  id v4 = objc_alloc_init(OTPersonaActualAdapter);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v13 = +[CKKSLockStateTracker globalTracker];
  long long v9 = objc_alloc_init(CKKSReachabilityTracker);
  id v10 = +[CKKSCloudKitClassDependencies forLiveCloudKit];
  id v11 = objc_alloc_init((Class)CDPFollowUpController);
  uint64_t v19 = -[OTManager initWithSOSAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:deviceInformationAdapter:personaAdapter:apsConnectionClass:escrowRequestClass:notifierClass:loggerClass:lockStateTracker:reachabilityTracker:cloudKitClassDependencies:cuttlefishXPCConnection:cdpd:](self, "initWithSOSAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:deviceInformationAdapter:personaAdapter:apsConnectionClass:escrowRequestClass:notifierClass:loggerClass:lockStateTracker:reachabilityTracker:cloudKitClassDependencies:cuttlefishXPCConnection:cdpd:", v20, v14, v3, v17, v16, v15, v4, v5, v6, v7, v8, v13, v9, v10, 0,
          v11);

  return v19;
}

+ (id)makeCKContainer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CKContainerOptions);
  [v4 setBypassPCSEncryption:1];
  uint64_t v5 = +[CKContainer containerIDForContainerIdentifier:v3];

  id v6 = [objc_alloc((Class)CKContainer) initWithContainerID:v5 options:v4];

  return v6;
}

+ (id)resetManager:(BOOL)a3 to:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v5 || ((id v6 = (void *)qword_10035CD20) != 0 ? (v7 = !v4) : (v7 = 0), !v7))
  {
    uint64_t v8 = objc_opt_class();
    objc_sync_enter(v8);
    if (v5)
    {
      long long v9 = (OTManager *)v5;
    }
    else
    {
      id v10 = (void *)qword_10035CD20;
      if (v4)
      {
        long long v9 = 0;
        goto LABEL_11;
      }
      if (qword_10035CD20) {
        goto LABEL_12;
      }
      long long v9 = objc_alloc_init(OTManager);
    }
    id v10 = (void *)qword_10035CD20;
LABEL_11:
    qword_10035CD20 = (uint64_t)v9;

LABEL_12:
    objc_sync_exit(v8);

    id v6 = (void *)qword_10035CD20;
  }
  id v11 = v6;

  return v11;
}

+ (id)manager
{
  if (objc_opt_class())
  {
    id v3 = [a1 resetManager:0 to:0];
  }
  else
  {
    BOOL v4 = sub_10000B070("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Octagon: CloudKit.framework appears to not be linked. Cannot create an Octagon manager (on pain of crash).", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

@end