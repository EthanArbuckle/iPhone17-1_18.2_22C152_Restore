@interface OTCuttlefishContext
- (BOOL)accountAvailable:(id)a3 error:(id *)a4;
- (BOOL)accountNoLongerAvailable;
- (BOOL)canSendMetricsUsingAccountState:(int)a3;
- (BOOL)checkAllStateCleared;
- (BOOL)checkForPhonePeerPresence:(id)a3;
- (BOOL)fetchSendingMetricsPermitted:(id *)a3;
- (BOOL)idmsTrustLevelChanged:(id *)a3;
- (BOOL)initialBecomeUntrustedPosted;
- (BOOL)leaveTrust:(id *)a3;
- (BOOL)machineIDOnMemoizedList:(id)a3 error:(id *)a4;
- (BOOL)persistSendingMetricsPermitted:(BOOL)a3 error:(id *)a4;
- (BOOL)postConfirmPasscodeCFU:(id *)a3;
- (BOOL)postRepairCFU:(id *)a3;
- (BOOL)processMoveRequest:(id)a3 error:(id *)a4;
- (BOOL)recheckCKKSTrustStatus:(id *)a3;
- (BOOL)setCDPEnabled:(id *)a3;
- (BOOL)shouldPostConfirmPasscodeCFU:(id *)a3;
- (BOOL)waitForReady:(int64_t)a3;
- (CKAccountInfo)cloudKitAccountInfo;
- (CKKSCloudKitAccountStateTrackingProvider)accountStateTracker;
- (CKKSCondition)cloudKitAccountStateKnown;
- (CKKSCondition)pendingEscrowCacheWarmup;
- (CKKSKeychainView)ckks;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)apsRateLimiter;
- (CKKSNearFutureScheduler)checkMetricsTrigger;
- (CKKSNearFutureScheduler)fixupRetryScheduler;
- (CKKSNearFutureScheduler)requestPolicyCheckNotifier;
- (CKKSNearFutureScheduler)sosConsistencyRateLimiter;
- (CKKSNearFutureScheduler)suggestTLKUploadNotifier;
- (CKKSNearFutureScheduler)upgradeUserControllableViewsRateLimiter;
- (CKKSPeerProvider)octagonAdapter;
- (CKKSReachabilityTracker)reachabilityTracker;
- (Class)escrowRequestClass;
- (Class)notifierClass;
- (CuttlefishXPCWrapper)cuttlefishXPCWrapper;
- (NSOperationQueue)operationQueue;
- (NSString)containerName;
- (NSString)contextID;
- (NSString)description;
- (NSString)machineID;
- (NSString)pairingUUID;
- (NSString)recoveryKey;
- (OS_dispatch_queue)queue;
- (OTAccountSettings)accountSettings;
- (OTAccountsAdapter)accountsAdapter;
- (OTAuthKitAdapter)authKitAdapter;
- (OTCustodianRecoveryKey)custodianRecoveryKey;
- (OTCuttlefishAccountStateHolder)accountMetadataStore;
- (OTCuttlefishContext)initWithContainerName:(id)a3 contextID:(id)a4 activeAccount:(id)a5 cuttlefish:(id)a6 ckksAccountSync:(id)a7 sosAdapter:(id)a8 accountsAdapter:(id)a9 authKitAdapter:(id)a10 personaAdapter:(id)a11 tooManyPeersAdapter:(id)a12 tapToRadarAdapter:(id)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 accountStateTracker:(id)a16 deviceInformationAdapter:(id)a17 apsConnectionClass:(Class)a18 escrowRequestClass:(Class)a19 notifierClass:(Class)a20 cdpd:(id)a21;
- (OTDeviceInformationAdapter)deviceAdapter;
- (OTFollowup)followupHandler;
- (OTInheritanceKey)inheritanceKey;
- (OTMetricsSessionData)sessionMetrics;
- (OTPersonaAdapter)personaAdapter;
- (OTSOSAdapter)sosAdapter;
- (OTTapToRadarAdapter)tapToRadarAdapter;
- (OTTooManyPeersAdapter)tooManyPeersAdapter;
- (OctagonAPSReceiver)apsReceiver;
- (OctagonStateMachine)stateMachine;
- (SecLaunchSequence)launchSequence;
- (TPPolicyVersion)policyOverride;
- (TPSpecificUser)activeAccount;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (id)appleAccountSignOutOperation;
- (id)becomeInheritedOperation;
- (id)becomeReadyOperation;
- (id)becomeUntrustedOperation:(id)a3;
- (id)checkForAccountFixupsOperation:(id)a3;
- (id)ckksPeerStatus:(id)a3;
- (id)cloudKitAccountNewlyAvailableOperation:(id)a3;
- (id)currentMemoizedLastHealthCheck;
- (id)currentlyEnforcingIDMSTDL_testOnly:(id *)a3;
- (id)cuttlefishTrustEvaluation;
- (id)egoPeerStatus:(id *)a3;
- (id)errorIfNoCKAccount:(id)a3;
- (id)establishStatePathDictionary;
- (id)evaluateSecdOctagonTrust;
- (id)evaluateTPHOctagonTrust;
- (id)extractStringKey:(id)a3 fromDictionary:(id)a4;
- (id)initializingOperation;
- (id)joinStatePathDictionary;
- (id)mergedAccountSettings:(id)a3;
- (id)operationDependencies;
- (id)postRepairCFUAndBecomeUntrusted;
- (id)prepareInformation;
- (id)repairAccountIfTrustedByTPHWithIntendedState:(id)a3;
- (id)sosSelvesStatus;
- (id)sosTrustedPeersStatus;
- (int)currentMemoizedAccountState;
- (int)currentMemoizedTrustState;
- (int)shouldSendMetricsForOctagon;
- (int64_t)checkForCKAccount:(id)a3;
- (int64_t)getCDPStatus:(id *)a3;
- (void)accountStateUpdated:(id)a3 from:(id)a4;
- (void)areRecoveryKeysDistrusted:(id)a3;
- (void)checkOctagonHealth:(BOOL)a3 repair:(BOOL)a4 reply:(id)a5;
- (void)checkTrustStatusAndPostRepairCFUIfNecessary:(id)a3;
- (void)clearCKKS;
- (void)clearContextState;
- (void)clearPairingUUID;
- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4;
- (void)dealloc;
- (void)deviceNameUpdated;
- (void)fetchEscrowContents:(id)a3;
- (void)fetchTrustedDeviceNamesByPeerID:(id)a3;
- (void)getAccountMetadataWithReply:(id)a3;
- (void)handlePairingRestart:(id)a3;
- (void)handleTTRRequest:(id)a3;
- (void)joinWithBottle:(id)a3 entropy:(id)a4 bottleSalt:(id)a5 reply:(id)a6;
- (void)joinWithCustodianRecoveryKey:(id)a3 reply:(id)a4;
- (void)joinWithInheritanceKey:(id)a3 reply:(id)a4;
- (void)joinWithRecoveryKey:(id)a3 reply:(id)a4;
- (void)localReset:(id)a3;
- (void)moveToCheckTrustedState;
- (void)notificationOfMachineIDListChange;
- (void)notifyContainerChange:(id)a3;
- (void)notifyContainerChangeWithUserInfo:(id)a3;
- (void)notifyTrustChanged:(int)a3;
- (void)octagonPeerIDGivenBottleID:(id)a3 reply:(id)a4;
- (void)performCKServerUnreadableDataRemoval:(BOOL)a3 altDSID:(id)a4 reply:(id)a5;
- (void)popTooManyPeersDialogWithEgoPeerStatus:(id)a3 accountMeta:(id)a4;
- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 reply:(id)a4;
- (void)preflightJoinWithInheritanceKey:(id)a3 reply:(id)a4;
- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 reply:(id)a4;
- (void)requestTrustedDeviceListRefresh;
- (void)rerollWithReply:(id)a3;
- (void)resetCKKS:(id)a3;
- (void)rpcAccountWideSettingsWithForceFetch:(BOOL)a3 reply:(id)a4;
- (void)rpcCheckCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcCheckInheritanceKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcCreateCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 reply:(id)a6;
- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcEpoch:(id)a3;
- (void)rpcEstablish:(id)a3 reply:(id)a4;
- (void)rpcFetchAccountSettings:(id)a3;
- (void)rpcFetchAllViableBottlesFromSource:(int64_t)a3 reply:(id)a4;
- (void)rpcFetchAllViableEscrowRecordsFromSource:(int64_t)a3 reply:(id)a4;
- (void)rpcFetchEgoPeerID:(id)a3;
- (void)rpcFetchTotalCountOfTrustedPeers:(id)a3;
- (void)rpcFetchTrustedSecureElementIdentities:(id)a3;
- (void)rpcFetchUserControllableViewsSyncingStatus:(id)a3;
- (void)rpcGenerateInheritanceKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcInvalidateEscrowCache:(id)a3;
- (void)rpcIsRecoveryKeySet:(id)a3;
- (void)rpcJoin:(id)a3 vouchSig:(id)a4 reply:(id)a5;
- (void)rpcLeaveClique:(id)a3;
- (void)rpcPrepareIdentityAsApplicantWithConfiguration:(id)a3 epoch:(unint64_t)a4 reply:(id)a5;
- (void)rpcRecreateInheritanceKeyWithUUID:(id)a3 oldIK:(id)a4 reply:(id)a5;
- (void)rpcRefetchCKKSPolicy:(id)a3;
- (void)rpcRemoveCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcRemoveFriendsInClique:(id)a3 reply:(id)a4;
- (void)rpcRemoveInheritanceKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcRemoveLocalSecureElementIdentityPeerID:(id)a3 reply:(id)a4;
- (void)rpcRemoveRecoveryKey:(id)a3;
- (void)rpcReset:(int64_t)a3 isGuitarfish:(BOOL)a4 reply:(id)a5;
- (void)rpcResetAccountCDPContentsWithIdmsTargetContext:(id)a3 idmsCuttlefishPassword:(id)a4 notifyIdMS:(BOOL)a5 reply:(id)a6;
- (void)rpcResetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 isGuitarfish:(BOOL)a8 reply:(id)a9;
- (void)rpcResetAndEstablish:(int64_t)a3 isGuitarfish:(BOOL)a4 reply:(id)a5;
- (void)rpcSetAccountSetting:(id)a3 reply:(id)a4;
- (void)rpcSetLocalSecureElementIdentity:(id)a3 reply:(id)a4;
- (void)rpcSetRecoveryKey:(id)a3 reply:(id)a4;
- (void)rpcSetUserControllableViewsSyncingStatus:(BOOL)a3 reply:(id)a4;
- (void)rpcStatus:(id)a3;
- (void)rpcStoreInheritanceKeyWithIK:(id)a3 reply:(id)a4;
- (void)rpcTlkRecoverabilityForEscrowRecordData:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)rpcTrustStatus:(id)a3 reply:(id)a4;
- (void)rpcTrustStatusCachedStatus:(id)a3 reply:(id)a4;
- (void)rpcVoucherWithConfiguration:(id)a3 permanentInfo:(id)a4 permanentInfoSig:(id)a5 stableInfo:(id)a6 stableInfoSig:(id)a7 reply:(id)a8;
- (void)rpcWaitForPriorityViewKeychainDataRecovery:(id)a3;
- (void)setAccountMetadataStore:(id)a3;
- (void)setAccountSettings:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setApsRateLimiter:(id)a3;
- (void)setApsReceiver:(id)a3;
- (void)setCheckMetricsTrigger:(id)a3;
- (void)setCkks:(id)a3;
- (void)setCloudKitAccountInfo:(id)a3;
- (void)setCloudKitAccountStateKnown:(id)a3;
- (void)setCustodianRecoveryKey:(id)a3;
- (void)setFixupRetryScheduler:(id)a3;
- (void)setFollowupHandler:(id)a3;
- (void)setInheritanceKey:(id)a3;
- (void)setInitialBecomeUntrustedPosted:(BOOL)a3;
- (void)setLaunchSequence:(id)a3;
- (void)setMachineID:(id)a3;
- (void)setMachineIDOverride:(id)a3;
- (void)setMetricsStateToActive;
- (void)setMetricsStateToInactive;
- (void)setMetricsToState:(int)a3;
- (void)setOctagonAdapter:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPairingUUID:(id)a3;
- (void)setPendingEscrowCacheWarmup:(id)a3;
- (void)setPolicyOverride:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setRequestPolicyCheckNotifier:(id)a3;
- (void)setSessionMetrics:(id)a3;
- (void)setShouldSendMetricsForOctagon:(int)a3;
- (void)setSosConsistencyRateLimiter:(id)a3;
- (void)setSuggestTLKUploadNotifier:(id)a3;
- (void)setUpgradeUserControllableViewsRateLimiter:(id)a3;
- (void)startOctagonStateMachine;
- (void)tlkRecoverabilityInOctagon:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)trustedPeerSetChanged:(id)a3;
- (void)waitForOctagonUpgrade:(id)a3;
@end

@implementation OTCuttlefishContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSettings, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
  objc_storeStrong((id *)&self->_notifierClass, 0);
  objc_storeStrong((id *)&self->_escrowRequestClass, 0);
  objc_storeStrong((id *)&self->_octagonAdapter, 0);
  objc_storeStrong((id *)&self->_apsReceiver, 0);
  objc_storeStrong((id *)&self->_inheritanceKey, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryKey, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_fixupRetryScheduler, 0);
  objc_storeStrong((id *)&self->_upgradeUserControllableViewsRateLimiter, 0);
  objc_storeStrong((id *)&self->_requestPolicyCheckNotifier, 0);
  objc_storeStrong((id *)&self->_suggestTLKUploadNotifier, 0);
  objc_storeStrong((id *)&self->_cloudKitAccountStateKnown, 0);
  objc_storeStrong((id *)&self->_cloudKitAccountInfo, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_launchSequence, 0);
  objc_storeStrong((id *)&self->_policyOverride, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingEscrowCacheWarmup, 0);
  objc_storeStrong((id *)&self->_tapToRadarAdapter, 0);
  objc_storeStrong((id *)&self->_tooManyPeersAdapter, 0);
  objc_storeStrong((id *)&self->_sosAdapter, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_authKitAdapter, 0);
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
  objc_storeStrong((id *)&self->_deviceAdapter, 0);
  objc_storeStrong((id *)&self->_accountStateTracker, 0);
  objc_storeStrong((id *)&self->_ckks, 0);
  objc_storeStrong((id *)&self->_sessionMetrics, 0);
  objc_storeStrong((id *)&self->_checkMetricsTrigger, 0);
  objc_storeStrong((id *)&self->_sosConsistencyRateLimiter, 0);
  objc_storeStrong((id *)&self->_apsRateLimiter, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_accountMetadataStore, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_pairingUUID, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_followupHandler, 0);
  objc_storeStrong((id *)&self->_cuttlefishXPCWrapper, 0);
  objc_storeStrong((id *)&self->_healthCheckResults, 0);
  objc_storeStrong((id *)&self->_idmsCuttlefishPassword, 0);
  objc_storeStrong((id *)&self->_idmsTargetContext, 0);
  objc_storeStrong((id *)&self->_entropy, 0);
  objc_storeStrong((id *)&self->_bottleSalt, 0);

  objc_storeStrong((id *)&self->_bottleID, 0);
}

- (void)setAccountSettings:(id)a3
{
}

- (OTAccountSettings)accountSettings
{
  return (OTAccountSettings *)objc_getProperty(self, a2, 432, 1);
}

- (void)setMachineID:(id)a3
{
}

- (NSString)machineID
{
  return self->_machineID;
}

- (void)setInitialBecomeUntrustedPosted:(BOOL)a3
{
  self->_initialBecomeUntrustedPosted = a3;
}

- (BOOL)initialBecomeUntrustedPosted
{
  return self->_initialBecomeUntrustedPosted;
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 416, 1);
}

- (Class)escrowRequestClass
{
  return (Class)objc_getProperty(self, a2, 408, 1);
}

- (void)setOctagonAdapter:(id)a3
{
}

- (CKKSPeerProvider)octagonAdapter
{
  return (CKKSPeerProvider *)objc_getProperty(self, a2, 400, 1);
}

- (void)setApsReceiver:(id)a3
{
}

- (OctagonAPSReceiver)apsReceiver
{
  return (OctagonAPSReceiver *)objc_getProperty(self, a2, 392, 1);
}

- (void)setInheritanceKey:(id)a3
{
}

- (OTInheritanceKey)inheritanceKey
{
  return self->_inheritanceKey;
}

- (void)setCustodianRecoveryKey:(id)a3
{
}

- (OTCustodianRecoveryKey)custodianRecoveryKey
{
  return self->_custodianRecoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setReachabilityTracker:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 360, 1);
}

- (void)setFixupRetryScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)fixupRetryScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 352, 1);
}

- (void)setUpgradeUserControllableViewsRateLimiter:(id)a3
{
}

- (CKKSNearFutureScheduler)upgradeUserControllableViewsRateLimiter
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 344, 1);
}

- (void)setRequestPolicyCheckNotifier:(id)a3
{
}

- (CKKSNearFutureScheduler)requestPolicyCheckNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 336, 1);
}

- (void)setSuggestTLKUploadNotifier:(id)a3
{
}

- (CKKSNearFutureScheduler)suggestTLKUploadNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 328, 1);
}

- (void)setCloudKitAccountStateKnown:(id)a3
{
}

- (CKKSCondition)cloudKitAccountStateKnown
{
  return (CKKSCondition *)objc_getProperty(self, a2, 320, 1);
}

- (void)setCloudKitAccountInfo:(id)a3
{
}

- (CKAccountInfo)cloudKitAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 312, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLaunchSequence:(id)a3
{
}

- (SecLaunchSequence)launchSequence
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 296, 1);
}

- (void)setPolicyOverride:(id)a3
{
}

- (TPPolicyVersion)policyOverride
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 288, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 280, 1);
}

- (void)setPendingEscrowCacheWarmup:(id)a3
{
}

- (CKKSCondition)pendingEscrowCacheWarmup
{
  return (CKKSCondition *)objc_getProperty(self, a2, 272, 1);
}

- (OTTapToRadarAdapter)tapToRadarAdapter
{
  return (OTTapToRadarAdapter *)objc_getProperty(self, a2, 264, 1);
}

- (OTTooManyPeersAdapter)tooManyPeersAdapter
{
  return (OTTooManyPeersAdapter *)objc_getProperty(self, a2, 256, 1);
}

- (OTSOSAdapter)sosAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 248, 1);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 240, 1);
}

- (OTAuthKitAdapter)authKitAdapter
{
  return (OTAuthKitAdapter *)objc_getProperty(self, a2, 232, 1);
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 224, 1);
}

- (OTDeviceInformationAdapter)deviceAdapter
{
  return (OTDeviceInformationAdapter *)objc_getProperty(self, a2, 216, 1);
}

- (CKKSCloudKitAccountStateTrackingProvider)accountStateTracker
{
  return (CKKSCloudKitAccountStateTrackingProvider *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCkks:(id)a3
{
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_getProperty(self, a2, 200, 1);
}

- (void)setShouldSendMetricsForOctagon:(int)a3
{
  self->_shouldSendMetricsForOctagon = a3;
}

- (int)shouldSendMetricsForOctagon
{
  return self->_shouldSendMetricsForOctagon;
}

- (void)setSessionMetrics:(id)a3
{
}

- (OTMetricsSessionData)sessionMetrics
{
  return (OTMetricsSessionData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCheckMetricsTrigger:(id)a3
{
}

- (CKKSNearFutureScheduler)checkMetricsTrigger
{
  return self->_checkMetricsTrigger;
}

- (void)setSosConsistencyRateLimiter:(id)a3
{
}

- (CKKSNearFutureScheduler)sosConsistencyRateLimiter
{
  return self->_sosConsistencyRateLimiter;
}

- (void)setApsRateLimiter:(id)a3
{
}

- (CKKSNearFutureScheduler)apsRateLimiter
{
  return self->_apsRateLimiter;
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAccountMetadataStore:(id)a3
{
}

- (OTCuttlefishAccountStateHolder)accountMetadataStore
{
  return self->_accountMetadataStore;
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (void)setPairingUUID:(id)a3
{
}

- (NSString)pairingUUID
{
  return self->_pairingUUID;
}

- (void)setActiveAccount:(id)a3
{
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFollowupHandler:(id)a3
{
}

- (OTFollowup)followupHandler
{
  return (OTFollowup *)objc_getProperty(self, a2, 104, 1);
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)persistSendingMetricsPermitted:(BOOL)a3 error:(id *)a4
{
  if (a3) {
    [(OTCuttlefishContext *)self setMetricsStateToActive];
  }
  else {
    [(OTCuttlefishContext *)self setMetricsStateToInactive];
  }
  v6 = [(OTCuttlefishContext *)self accountMetadataStore];
  unsigned __int8 v7 = [v6 persistSendingMetricsPermitted:-[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon") error:a4];

  return v7;
}

- (BOOL)fetchSendingMetricsPermitted:(id *)a3
{
  v5 = [(OTCuttlefishContext *)self accountMetadataStore];
  LOBYTE(a3) = -[OTCuttlefishContext canSendMetricsUsingAccountState:](self, "canSendMetricsUsingAccountState:", [v5 fetchSendingMetricsPermitted:a3]);

  return (char)a3;
}

- (BOOL)checkAllStateCleared
{
  v3 = [(OTCuttlefishContext *)self inheritanceKey];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(OTCuttlefishContext *)self custodianRecoveryKey];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      v6 = [(OTCuttlefishContext *)self recoveryKey];
      if (v6
        || self->_bottleID
        || self->_bottleSalt
        || self->_entropy
        || self->_resetReason
        || self->_idmsTargetContext
        || self->_idmsCuttlefishPassword
        || self->_notifyIdMS)
      {
        BOOL v4 = 0;
      }
      else
      {
        v8 = [(OTCuttlefishContext *)self accountSettings];
        BOOL v4 = !v8
          && !self->_skipRateLimitingCheck
          && !self->_repair
          && !self->_reportRateLimitingError
          && self->_healthCheckResults == 0;

        v6 = 0;
      }
    }
  }

  return v4;
}

- (void)clearContextState
{
  bottleID = self->_bottleID;
  self->_bottleID = 0;

  bottleSalt = self->_bottleSalt;
  self->_bottleSalt = 0;

  entropy = self->_entropy;
  self->_entropy = 0;

  idmsTargetContext = self->_idmsTargetContext;
  self->_resetReason = 0;
  self->_idmsTargetContext = 0;

  idmsCuttlefishPassword = self->_idmsCuttlefishPassword;
  self->_idmsCuttlefishPassword = 0;

  self->_notifyIdMS = 0;
  [(OTCuttlefishContext *)self setAccountSettings:0];
  *(_WORD *)&self->_skipRateLimitingCheck = 0;
  self->_reportRateLimitingError = 0;
  [(OTCuttlefishContext *)self setRecoveryKey:0];
  [(OTCuttlefishContext *)self setInheritanceKey:0];
  [(OTCuttlefishContext *)self setCustodianRecoveryKey:0];
  healthCheckResults = self->_healthCheckResults;
  self->_healthCheckResults = 0;
}

- (void)getAccountMetadataWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  v5 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v9 = 0;
  v6 = [v5 loadOrCreateAccountMetadata:&v9];
  id v7 = v9;

  if (!v6 || v7)
  {
    v8 = sub_10000B070("octagon-account-metadata");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "error fetching account metadata: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v7);
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, v6, 0);
  }
}

- (void)rpcResetAccountCDPContentsWithIdmsTargetContext:(id)a3 idmsCuttlefishPassword:(id)a4 notifyIdMS:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v13)
  {
    v14 = sub_10000B070("octagon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v12[2](v12, v13);
  }
  else
  {
    v15 = [(OTCuttlefishContext *)self activeAccount];
    v16 = [v15 altDSID];

    if (v16)
    {
      v17 = [(OTCuttlefishContext *)self authKitAdapter];
      id v28 = 0;
      unsigned int v25 = [v17 accountIsDemoAccountByAltDSID:v16 error:&v28];
      id v18 = v28;

      if (v18)
      {
        v19 = sub_10000B070("SecError");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "octagon-authkit: failed to fetch demo account flag: %@", buf, 0xCu);
        }
      }
      uint64_t IsInternalRelease = SecIsInternalRelease();
      v21 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
      v22 = [(OTCuttlefishContext *)self activeAccount];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000DA964;
      v26[3] = &unk_1002FB1E8;
      v27 = v12;
      [v21 resetAccountCDPContentsWithSpecificUser:v22 idmsTargetContext:v10 idmsCuttlefishPassword:v11 notifyIdMS:v7 internalAccount:IsInternalRelease demoAccount:v25 reply:v26];
    }
    else
    {
      v23 = sub_10000B070("authkit");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(OTCuttlefishContext *)self activeAccount];
        *(_DWORD *)buf = 138412290;
        id v30 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
      }
      id v18 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
      v12[2](v12, v18);
    }
  }
}

- (id)egoPeerStatus:(id *)a3
{
  v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", (uint8_t *)&buf, 0xCu);
    }

    id v7 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x3032000000;
    v21 = sub_1000DAD14;
    v22 = sub_1000DAD24;
    id v23 = 0;
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = sub_1000DAD14;
    v17 = sub_1000DAD24;
    id v18 = 0;
    v8 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v9 = [(OTCuttlefishContext *)self activeAccount];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DAD2C;
    v12[3] = &unk_1002F9F40;
    v12[4] = &v13;
    v12[5] = &buf;
    [v8 trustStatusWithSpecificUser:v9 reply:v12];

    if (a3)
    {
      id v10 = (void *)v14[5];
      if (v10) {
        *a3 = v10;
      }
    }
    id v7 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&buf, 8);
  }

  return v7;
}

- (id)currentlyEnforcingIDMSTDL_testOnly:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_1000DAD14;
  uint64_t v15 = sub_1000DAD24;
  id v16 = 0;
  v5 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
  v6 = [(OTCuttlefishContext *)self activeAccount];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DAFCC;
  v10[3] = &unk_1002F9F18;
  v10[4] = &v11;
  v10[5] = &v17;
  [v5 honorIDMSListChangesForSpecificUser:v6 reply:v10];

  id v7 = (void *)v12[5];
  if (v7)
  {
    v8 = 0;
    if (a3) {
      *a3 = v7;
    }
  }
  else if (*((unsigned char *)v18 + 24))
  {
    v8 = &__kCFBooleanTrue;
  }
  else
  {
    v8 = &__kCFBooleanFalse;
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (BOOL)machineIDOnMemoizedList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v7)
  {
    v8 = sub_10000B070("octagon");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000;
    v24 = sub_1000DAD14;
    unsigned int v25 = sub_1000DAD24;
    id v26 = 0;
    id v10 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    uint64_t v11 = [(OTCuttlefishContext *)self activeAccount];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000DB344;
    v14[3] = &unk_1002F9EF0;
    p_long long buf = &buf;
    id v15 = v6;
    uint64_t v17 = &v18;
    [v10 fetchAllowedMachineIDsWithSpecificUser:v11 reply:v14];

    if (a4)
    {
      v12 = *(void **)(*((void *)&buf + 1) + 40);
      if (v12) {
        *a4 = v12;
      }
    }
    BOOL v9 = *((unsigned char *)v19 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v18, 8);
  }

  return v9;
}

- (void)waitForOctagonUpgrade:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  v5 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "waitForOctagonUpgrade", buf, 2u);
  }

  id v6 = [(OTCuttlefishContext *)self sosAdapter];
  unsigned __int8 v7 = [v6 sosEnabled];

  if (v7)
  {
    v8 = [(OTCuttlefishContext *)self sosAdapter];
    id v41 = 0;
    unsigned int v9 = [v8 circleStatus:&v41];
    id v10 = v41;

    uint64_t v11 = sub_10000B070("octagon-sos");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        uint64_t v13 = [(OTCuttlefishContext *)self sosAdapter];
        id v40 = v10;
        unsigned int v14 = [v13 circleStatus:&v40];
        id v15 = v40;

        *(_DWORD *)long long buf = 67109120;
        LODWORD(v52) = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SOS circle status: %d, cannot perform sos upgrade", buf, 8u);

        id v10 = v15;
      }

      if (v10)
      {
        id v16 = sub_10000B070("SecError");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v52 = v10;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "octagon-sos: error retrieving circle status: %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v25 = kSOSErrorDomain;
        NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
        CFStringRef v54 = @"Not in circle";
        id v16 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        id v10 = +[NSError errorWithDomain:v25 code:1037 userInfo:v16];
      }

      v4[2](v4, v10);
      goto LABEL_27;
    }
    if (v12)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "in sos circle!, attempting upgrade", buf, 2u);
    }

    uint64_t v18 = [(OTCuttlefishContext *)self stateMachine];
    unsigned int v19 = [v18 isPaused];

    uint64_t v20 = [(OTCuttlefishContext *)self stateMachine];
    char v21 = v20;
    if (v19)
    {
      v22 = [v20 currentState];
      unsigned int v23 = [v22 isEqualToString:@"Ready"];

      if (v23)
      {
        v24 = sub_10000B070("octagon-sos");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "waitForOctagonUpgrade: already ready, returning", buf, 2u);
        }

LABEL_26:
        v4[2](v4, 0);
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      id v26 = [v20 waitForState:@"Ready" wait:10000000000];
      unsigned int v27 = [v26 isEqualToString:@"Ready"];

      id v28 = sub_10000B070("octagon-sos");
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      if (v27)
      {
        if (v29)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "waitForOctagonUpgrade: in ready (after waiting), returning", buf, 2u);
        }

        goto LABEL_26;
      }
      if (v29)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "waitForOctagonUpgrade: fail to get to ready after timeout, attempting upgrade", buf, 2u);
      }
    }
    v50[0] = @"WaitForCDP";
    v50[1] = @"Untrusted";
    id v30 = +[NSArray arrayWithObjects:v50 count:2];
    v31 = +[NSSet setWithArray:v30];

    CFStringRef v48 = @"AttemptSOSUpgradeDetermineCDPState";
    CFStringRef v46 = @"AttemptSOSUpgrade";
    CFStringRef v44 = @"BecomeReady";
    CFStringRef v42 = @"Ready";
    v32 = +[OctagonStateTransitionPathStep success];
    v43 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v45 = v33;
    v34 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    v47 = v34;
    v35 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v49 = v35;
    v36 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    v37 = +[OctagonStateTransitionPath pathFromDictionary:v36];

    v38 = [(OTCuttlefishContext *)self stateMachine];
    id v39 = [v38 doWatchedStateMachineRPC:@"sos-upgrade-to-ready" sourceStates:v31 path:v37 reply:v4];

    goto LABEL_27;
  }
  uint64_t v17 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sos not enabled, nothing to do for waitForOctagonUpgrade", buf, 2u);
  }

  v4[2](v4, 0);
LABEL_28:
}

- (void)checkOctagonHealth:(BOOL)a3 repair:(BOOL)a4 reply:(id)a5
{
  v8 = (void (**)(id, void, void *))a5;
  unsigned int v9 = sub_10000B070("octagon-health");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Beginning checking overall Octagon Trust", buf, 2u);
  }

  id v10 = [(OTCuttlefishContext *)self stateMachine];
  unsigned int v11 = [v10 isPaused];

  if (!v11) {
    goto LABEL_12;
  }
  BOOL v12 = [(OTCuttlefishContext *)self stateMachine];
  uint64_t v13 = [v12 currentState];
  unsigned int v14 = [v13 isEqualToString:@"WaitForClassCUnlock"];

  if (v14)
  {
    id v15 = sub_10000B070("octagon-health");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "currently waiting for class C unlock", buf, 2u);
    }

    id v16 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:57 description:@"Not performing health check, waiting for Class C Unlock"];
    v8[2](v8, 0, v16);

    goto LABEL_16;
  }
  uint64_t v17 = [(OTCuttlefishContext *)self stateMachine];
  uint64_t v18 = [v17 currentState];
  unsigned int v19 = [v18 isEqualToString:@"NoAccount"];

  if (!v19)
  {
LABEL_12:
    self->_skipRateLimitingCheck = a3;
    self->_repair = a4;
    self->_reportRateLimitingError = 1;
    *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v22 = [(OTCuttlefishContext *)self stateMachine];
    unsigned int v23 = [v22 currentState];
    unsigned int v24 = [v23 isEqualToString:@"WaitForCDPCapableSecurityLevel"];

    [(OTCuttlefishContext *)self stateMachine];
    if (v24) {
      uint64_t v25 = {;
    }
      [v25 handleFlag:@"idms_level"];

      id v26 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:69 description:@"Unable to perform health check on this account type"];
      v8[2](v8, 0, v26);
    }
    else {
      v36 = {;
    }
      v37 = +[OTStates OctagonHealthSourceStates];
      CFStringRef v58 = @"CDPHealthCheck";
      v56[0] = @"SecurityTrustCheck";
      CFStringRef v54 = @"TPHTrustCheck";
      v52[0] = @"CuttlefishTrustCheck";
      v50[0] = @"BecomeReady";
      v48[0] = @"Ready";
      v43 = +[OctagonStateTransitionPathStep success];
      v48[1] = @"WaitForUnlock";
      v49[0] = v43;
      CFStringRef v42 = +[OctagonStateTransitionPathStep success];
      v49[1] = v42;
      id v41 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
      v51[0] = v41;
      v50[1] = @"HealthCheckReset";
      id v40 = +[OctagonStateTransitionPathStep success];
      v51[1] = v40;
      void v50[2] = @"HealthCheckLeaveClique";
      id v39 = +[OctagonStateTransitionPathStep success];
      v51[2] = v39;
      v38 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];
      v53[0] = v38;
      v52[1] = @"WaitForUnlock";
      unsigned int v27 = +[OctagonStateTransitionPathStep success];
      v53[1] = v27;
      v52[2] = @"Untrusted";
      id v28 = +[OctagonStateTransitionPathStep success];
      v53[2] = v28;
      BOOL v29 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];
      v55 = v29;
      id v30 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      v56[1] = @"WaitForCDP";
      v57[0] = v30;
      v31 = +[OctagonStateTransitionPathStep success];
      v57[1] = v31;
      v32 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
      v59 = v32;
      v33 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      v34 = +[OctagonStateTransitionPath pathFromDictionary:v33];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000DC17C;
      v44[3] = &unk_1002F9EC8;
      objc_copyWeak(&v46, (id *)buf);
      v45 = v8;
      id v35 = [v36 doWatchedStateMachineRPC:@"octagon-trust-health-check" sourceStates:v37 path:v34 reply:v44];

      objc_destroyWeak(&v46);
    }
    objc_destroyWeak((id *)buf);
    goto LABEL_16;
  }
  uint64_t v20 = sub_10000B070("octagon-health");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not performing health check, not currently signed in", buf, 2u);
  }

  char v21 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"Not performing health check, not currently signed in"];
  v8[2](v8, 0, v21);

LABEL_16:
}

- (BOOL)processMoveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v44 = 0;
  unsigned __int8 v7 = [(objc_class *)[(OTCuttlefishContext *)self escrowRequestClass] request:&v44];
  v8 = v44;
  unsigned int v9 = v8;
  if (v7 && !v8)
  {
    id v10 = [(OTCuttlefishContext *)self accountMetadataStore];
    id v43 = 0;
    unsigned int v11 = [v10 loadOrCreateAccountMetadata:&v43];
    BOOL v12 = v43;

    uint64_t v13 = [v11 altDSID];
    if (v13) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    BOOL v15 = v14;
    if (!v14)
    {
      char v21 = sub_10000B070("octagon-health");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v48 = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to get altDSID: %@", buf, 0xCu);
      }

      if (a4) {
        *a4 = v12;
      }
      goto LABEL_44;
    }
    id v16 = [v6 intendedFederation];
    unsigned int v17 = +[SecureBackup moveToFederationAllowed:v16 altDSID:v13 error:0];

    if (!v17)
    {
      id v40 = v11;
      uint64_t v18 = sub_10000B070("octagon-health");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Secure terms not accepted, posting followup", buf, 2u);
      }
      unsigned int v19 = &off_100304EC8;
LABEL_29:

      unsigned int v23 = +[CKKSAnalytics logger];
      [v23 logSuccessForEventNamed:*v19];

      unsigned int v24 = [(OTCuttlefishContext *)self followupHandler];
      uint64_t v25 = [(OTCuttlefishContext *)self activeAccount];
      id v41 = 0;
      unsigned int v26 = [v24 postFollowUp:4 activeAccount:v25 error:&v41];
      unsigned int v27 = v41;

      if (v26)
      {
        id v28 = sub_10000B070("octagon-health");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          BOOL v29 = "Posted secure terms followup";
          id v30 = v28;
          uint32_t v31 = 2;
LABEL_37:
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
        }
      }
      else
      {
        id v28 = sub_10000B070("SecError");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          CFStringRef v48 = v27;
          BOOL v29 = "octagon-health: Failed to post secure terms followup: %@";
          id v30 = v28;
          uint32_t v31 = 12;
          goto LABEL_37;
        }
      }
      unsigned int v11 = v40;
LABEL_43:

LABEL_44:
      goto LABEL_45;
    }
    if ((_os_feature_enabled_impl() & 1) == 0
      && [v7 escrowCompletedWithinLastSeconds:15552000.0])
    {
      id v40 = v11;
      uint64_t v18 = sub_10000B070("octagon-health");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Skipping escrow move request (rate limited), posting follow up", buf, 2u);
      }
      unsigned int v19 = &off_100304EC0;
      goto LABEL_29;
    }
    v32 = +[CKKSAnalytics logger];
    [v32 logSuccessForEventNamed:@"OctagonEventEscrowMoveTriggered"];

    uint64_t v45 = SecEscrowRequestOptionFederationMove;
    v33 = [v6 intendedFederation];
    id v46 = v33;
    unsigned int v27 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];

    id v42 = 0;
    unsigned int v34 = [v7 triggerEscrowUpdate:@"octagon-health" options:v27 error:&v42];
    id v28 = v42;
    if (v34)
    {
      id v35 = sub_10000B070("octagon-health");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        v36 = "Triggered escrow move";
        v37 = v35;
        uint32_t v38 = 2;
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
      }
    }
    else
    {
      id v35 = sub_10000B070("SecError");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v48 = v28;
        v36 = "octagon-health: Unable to trigger escrow move: %@";
        v37 = v35;
        uint32_t v38 = 12;
        goto LABEL_41;
      }
    }

    goto LABEL_43;
  }
  uint64_t v20 = sub_10000B070("octagon-health");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unable to acquire EscrowRequest object: %@", buf, 0xCu);
  }

  BOOL v15 = 0;
  if (a4) {
    *a4 = v9;
  }
LABEL_45:

  return v15;
}

- (BOOL)postConfirmPasscodeCFU:(id *)a3
{
  v5 = [(OTCuttlefishContext *)self followupHandler];
  id v6 = [(OTCuttlefishContext *)self activeAccount];
  id v11 = 0;
  unsigned __int8 v7 = [v5 postFollowUp:3 activeAccount:v6 error:&v11];
  id v8 = v11;

  if (v8)
  {
    unsigned int v9 = sub_10000B070("SecError");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "octagon-health: CoreCDP confirm existing secret failed: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v8;
    }
  }

  return v7;
}

- (BOOL)leaveTrust:(id *)a3
{
  if (-[OTSOSActualAdapter sosEnabled]_0() && ((id v8 = 0, !sub_100222128((CFTypeRef *)&v8)) || v8))
  {
    id v6 = sub_10000B070("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to leave SOS circle: %@", buf, 0xCu);
    }

    id v7 = v8;
    if (a3)
    {
      *a3 = v8;
    }
    else if (v8)
    {
      id v8 = 0;
      CFRelease(v7);
    }
    return 0;
  }
  else
  {
    BOOL v4 = sub_10000B070("octagon-health");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully left SOS", buf, 2u);
    }

    return 1;
  }
}

- (BOOL)recheckCKKSTrustStatus:(id *)a3
{
  v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  id v6 = sub_10000B070("octagon");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)long long buf = 138412290;
      BOOL v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    if (a3)
    {
      id v8 = v5;
LABEL_17:
      BOOL v21 = 0;
      *a3 = v8;
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (v7)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to re-check CKKS's trust status", buf, 2u);
  }

  unsigned int v9 = [(OTCuttlefishContext *)self stateMachine];
  id v10 = [v9 waitForState:@"Ready" wait:10000000000];
  unsigned int v11 = [v10 isEqualToString:@"Ready"];

  if (!v11)
  {
    uint64_t v20 = sub_10000B070("SecError");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "octagon-ckks: recheckCKKSTrustStatus: failed to get to ready after timeout", buf, 2u);
    }

    if (a3)
    {
      id v8 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:76 description:@"Octagon has not reached a ready state yet"];
      goto LABEL_17;
    }
LABEL_18:
    BOOL v21 = 0;
    goto LABEL_21;
  }
  BOOL v12 = sub_10000B070("octagon-ckks");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(OTCuttlefishContext *)self ckks];
    *(_DWORD *)long long buf = 138412290;
    BOOL v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resetting CKKS(%@) peer providers", buf, 0xCu);
  }
  BOOL v14 = [(OTCuttlefishContext *)self sosAdapter];
  unsigned int v15 = [v14 sosEnabled];

  uint64_t v16 = [(OTCuttlefishContext *)self octagonAdapter];
  unsigned int v17 = (void *)v16;
  if (v15)
  {
    v27[0] = v16;
    uint64_t v18 = [(OTCuttlefishContext *)self sosAdapter];
    v27[1] = v18;
    unsigned int v19 = +[NSArray arrayWithObjects:v27 count:2];
  }
  else
  {
    uint64_t v26 = v16;
    unsigned int v19 = +[NSArray arrayWithObjects:&v26 count:1];
  }

  v22 = [(OTCuttlefishContext *)self ckks];
  unsigned int v23 = [(OTCuttlefishContext *)self suggestTLKUploadNotifier];
  unsigned int v24 = [(OTCuttlefishContext *)self requestPolicyCheckNotifier];
  [v22 beginTrustedOperation:v19 suggestTLKUpload:v23 requestPolicyCheck:v24];

  BOOL v21 = 1;
LABEL_21:

  return v21;
}

- (BOOL)shouldPostConfirmPasscodeCFU:(id *)a3
{
  id v14 = 0;
  BOOL v4 = [(objc_class *)[(OTCuttlefishContext *)self escrowRequestClass] request:&v14];
  id v5 = v14;
  id v6 = v5;
  if (!v4 || v5)
  {
    id v8 = sub_10000B070("octagon-health");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)long long buf = 138412290;
    id v16 = v6;
    id v10 = "Unable to acquire a EscrowRequest object: %@";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
LABEL_9:

    if (a3)
    {
      id v6 = v6;
      *a3 = v6;
    }
LABEL_11:
    BOOL v11 = 1;
    goto LABEL_12;
  }
  id v13 = 0;
  unsigned int v7 = [v4 pendingEscrowUpload:&v13];
  id v6 = v13;
  id v8 = sub_10000B070("octagon-health");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v9) {
      goto LABEL_9;
    }
    *(_DWORD *)long long buf = 138412290;
    id v16 = v6;
    id v10 = "Failed to check escrow prerecord status: %@";
    goto LABEL_8;
  }
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "no pending prerecords, posting CFU", buf, 2u);
    }

    id v6 = 0;
    goto LABEL_11;
  }
  if (v9)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "prerecord is pending, NOT posting CFU", buf, 2u);
  }

  BOOL v11 = 0;
  id v6 = 0;
LABEL_12:

  return v11;
}

- (BOOL)postRepairCFU:(id *)a3
{
  id v5 = [(OTCuttlefishContext *)self followupHandler];
  id v6 = [(OTCuttlefishContext *)self activeAccount];
  id v11 = 0;
  [v5 postFollowUp:2 activeAccount:v6 error:&v11];
  id v7 = v11;

  if (v7)
  {
    id v8 = sub_10000B070("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "octagon-health: CoreCDP repair failed: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v7;
    }
  }
  else
  {
    BOOL v9 = sub_10000B070("octagon-health");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CoreCDP post repair success", buf, 2u);
    }
  }
  return v7 == 0;
}

- (void)rerollWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = objc_alloc_init((Class)OTOperationConfiguration);
  id v6 = [(OTCuttlefishContext *)self errorIfNoCKAccount:v5];
  if (v6)
  {
    id v7 = sub_10000B070("octagon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      unsigned int v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, v6);
  }
  else
  {
    CFStringRef v20 = @"OctagonStateStashAccountSettingsForReroll";
    CFStringRef v18 = @"OctagonStateCreateIdentityForReroll";
    id v8 = [(OTCuttlefishContext *)self joinStatePathDictionary];
    unsigned int v17 = v8;
    BOOL v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    unsigned int v19 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    BOOL v21 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    BOOL v12 = +[OctagonStateTransitionPath pathFromDictionary:v11];

    id v13 = [(OTCuttlefishContext *)self stateMachine];
    id v14 = +[OTStates OctagonReadyStates];
    id v15 = [v13 doWatchedStateMachineRPC:@"reroll" sourceStates:v14 path:v12 reply:v4];
  }
}

- (void)rpcFetchTotalCountOfTrustedPeers:(id)a3
{
  BOOL v4 = (void (**)(id, _UNKNOWN **, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      BOOL v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, &off_100325F30, v5);
  }
  else
  {
    id v7 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v8 = [(OTCuttlefishContext *)self activeAccount];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000DD4EC;
    v9[3] = &unk_1002F9EA0;
    id v10 = v4;
    [v7 fetchTrustedPeerCountWithSpecificUser:v8 reply:v9];
  }
}

- (void)rpcTlkRecoverabilityForEscrowRecordData:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1
    || ([(OTCuttlefishContext *)self errorIfNoCKAccount:0],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000DD67C;
    v13[3] = &unk_1002FB260;
    id v14 = v9;
    [(OTCuttlefishContext *)self tlkRecoverabilityInOctagon:v8 source:a4 reply:v13];
    id v11 = v14;
  }
  else
  {
    id v11 = (void *)v10;
    BOOL v12 = sub_10000B070("octagon-tlk-recoverability");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v11);
  }
}

- (void)tlkRecoverabilityInOctagon:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DD990;
  v11[3] = &unk_1002F9E78;
  id v13 = self;
  id v14 = a5;
  id v12 = v8;
  id v9 = v8;
  id v10 = v14;
  [(OTCuttlefishContext *)self rpcFetchAllViableBottlesFromSource:a4 reply:v11];
}

- (void)octagonPeerIDGivenBottleID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v8)
  {
    id v9 = sub_10000B070("octagon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, 0, v8);
  }
  else
  {
    id v10 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v11 = [(OTCuttlefishContext *)self activeAccount];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DDFA8;
    v12[3] = &unk_1002FB210;
    id v13 = v7;
    [v10 octagonPeerIDGivenBottleIDWithSpecificUser:v11 bottleID:v6 reply:v12];
  }
}

- (void)rpcWaitForPriorityViewKeychainDataRecovery:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      unsigned int v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, v5);
  }
  else
  {
    id v7 = sub_10000B070("octagon-ckks");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Beginning to wait for CKKS Priority view download", buf, 2u);
    }

    id v8 = [(OTCuttlefishContext *)self stateMachine];
    id v9 = [v8 waitForState:@"Ready" wait:120000000000];
    unsigned int v10 = [v9 isEqualToString:@"Ready"];

    if (v10)
    {
      id v11 = [(OTCuttlefishContext *)self ckks];
      id v12 = [v11 rpcWaitForPriorityViewProcessing];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000DE39C;
      v18[3] = &unk_1002F9E28;
      id v19 = v12;
      CFStringRef v20 = self;
      BOOL v21 = v4;
      id v13 = v12;
      id v14 = +[CKKSResultOperation named:@"wait-for-sync-reply" withBlockTakingSelf:v18];
      [v14 addDependency:v13];
      id v15 = [(OTCuttlefishContext *)self operationQueue];
      [v15 addOperation:v14];
    }
    else
    {
      uint64_t v16 = sub_10000B070("SecError");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "octagon-ckks: rpcWaitForPriorityViewKeychainDataRecovery: failed to get to ready after timeout", buf, 2u);
      }

      unsigned int v17 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:76 description:@"Octagon has not reached a ready state yet"];
      v4[2](v4, v17);
    }
  }
}

- (void)rpcAccountWideSettingsWithForceFetch:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v7)
  {
    id v8 = sub_10000B070("octagon");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      unsigned int v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, 0, v7);
  }
  else
  {
    id v9 = sub_10000B070("octagon-settings");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v17) = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Fetching account-wide settings with force: %{BOOL}d", buf, 8u);
    }

    unsigned int v10 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v11 = [(OTCuttlefishContext *)self activeAccount];
    id v12 = [(OTCuttlefishContext *)self containerName];
    id v13 = [(OTCuttlefishContext *)self contextID];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000DEAB0;
    v14[3] = &unk_1002F9E00;
    id v15 = v6;
    +[OTStashAccountSettingsOperation performWithAccountWide:1 forceFetch:v4 cuttlefishXPCWrapper:v10 activeAccount:v11 containerName:v12 contextID:v13 reply:v14];
  }
}

- (void)rpcFetchAccountSettings:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    id v7 = sub_10000B070("octagon-settings");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Fetching account settings", buf, 2u);
    }

    id v8 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v9 = [(OTCuttlefishContext *)self activeAccount];
    unsigned int v10 = [(OTCuttlefishContext *)self containerName];
    id v11 = [(OTCuttlefishContext *)self contextID];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DEE34;
    v12[3] = &unk_1002F9E00;
    id v13 = v4;
    +[OTStashAccountSettingsOperation performWithAccountWide:0 forceFetch:0 cuttlefishXPCWrapper:v8 activeAccount:v9 containerName:v10 contextID:v11 reply:v12];
  }
}

- (void)rpcFetchTrustedSecureElementIdentities:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    id v7 = [(OTCuttlefishContext *)self accountMetadataStore];
    id v21 = 0;
    id v8 = [v7 loadOrCreateAccountMetadata:&v21];
    id v9 = v21;

    if (!v8 || v9)
    {
      id v11 = sub_10000B070("octagon");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(OTCuttlefishContext *)self containerName];
        id v13 = [(OTCuttlefishContext *)self contextID];
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v23 = 2112;
        unsigned int v24 = v13;
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to load account metadata for (%@,%@): %@", buf, 0x20u);
      }
      unsigned int v10 = 0;
    }
    else
    {
      unsigned int v10 = [v8 parsedSecureElementIdentity];
    }

    *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id v14 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v15 = [(OTCuttlefishContext *)self activeAccount];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000DF270;
    v17[3] = &unk_1002F9DD8;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = v4;
    id v16 = v10;
    id v18 = v16;
    [v14 fetchTrustStateWithSpecificUser:v15 reply:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (void)rpcRemoveLocalSecureElementIdentityPeerID:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v11 = 0;
  [v6 persistAccountChanges:&stru_1002F9DB0 error:&v11];
  id v7 = v11;

  id v8 = sub_10000B070("octagon-se");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to persist removal of identity: %@", buf, 0xCu);
    }

    v5[2](v5, v7);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully persisted removal of SE identity", buf, 2u);
    }

    unsigned int v10 = [(OTCuttlefishContext *)self stateMachine];
    [v10 handleFlag:@"se_id_changed"];

    v5[2](v5, 0);
  }
}

- (void)rpcSetLocalSecureElementIdentity:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = [(OTCuttlefishContext *)self accountMetadataStore];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000DFA7C;
  v15[3] = &unk_100307118;
  id v9 = v6;
  id v16 = v9;
  id v14 = 0;
  [v8 persistAccountChanges:v15 error:&v14];
  id v10 = v14;

  id v11 = sub_10000B070("octagon-se");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to persist identity: %@", buf, 0xCu);
    }

    v7[2](v7, v10);
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully persisted new SE identity: %@", buf, 0xCu);
    }

    id v13 = [(OTCuttlefishContext *)self stateMachine];
    [v13 handleFlag:@"se_id_changed"];

    v7[2](v7, 0);
  }
}

- (void)rpcSetAccountSetting:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (!v8)
  {
    id v10 = [(OTCuttlefishContext *)self stateMachine];
    unsigned int v11 = [v10 isPaused];

    if (v11)
    {
      BOOL v12 = +[OTStates OctagonReadyStates];
      id v13 = [(OTCuttlefishContext *)self stateMachine];
      id v14 = [v13 currentState];
      id v15 = +[NSSet setWithObject:v14];
      unsigned __int8 v16 = [v12 intersectsSet:v15];

      if ((v16 & 1) == 0)
      {
        unsigned int v17 = sub_10000B070("octagon-settings");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          id v18 = "device is not in a ready state to set account settings, returning";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (![(OTCuttlefishContext *)self waitForReady:10000000000])
    {
      unsigned int v17 = sub_10000B070("octagon-settings");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        id v18 = "rpcSetAccountSetting: failed to reach Ready state";
        goto LABEL_15;
      }
LABEL_16:

      id v21 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:73 description:@"Device is not in Octagon yet to set account settings"];
      v7[2](v7, v21);
LABEL_17:

      goto LABEL_18;
    }
    id v19 = sub_10000B070("octagon-settings");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting account settings %@", buf, 0xCu);
    }

    id v20 = [(OTCuttlefishContext *)self mergedAccountSettings:v6];
    [(OTCuttlefishContext *)self setAccountSettings:v20];

    id v21 = [(OTCuttlefishContext *)self stateMachine];
    v22 = +[OTStates OctagonReadyStates];
    CFStringRef v33 = @"SetAccountSettings";
    CFStringRef v31 = @"BecomeReady";
    __int16 v23 = +[OctagonStateTransitionPathStep success];
    id v30 = v23;
    unsigned int v24 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v32 = v24;
    __int16 v25 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    unsigned int v34 = v25;
    id v26 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    unsigned int v27 = +[OctagonStateTransitionPath pathFromDictionary:v26];
    id v28 = [v21 doWatchedStateMachineRPC:@"octagon-set-account-settings" sourceStates:v22 path:v27 reply:v7];

    goto LABEL_17;
  }
  id v9 = sub_10000B070("octagon");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
  }

  v7[2](v7, v8);
LABEL_18:
}

- (void)rpcSetUserControllableViewsSyncingStatus:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v7)
  {
    id v8 = sub_10000B070("octagon");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, 0, v7);
  }
  else
  {
    id v9 = [(OTCuttlefishContext *)self accountMetadataStore];
    id v31 = 0;
    id v10 = [v9 loadOrCreateAccountMetadata:&v31];
    unsigned int v11 = (__CFString *)v31;

    if (v11)
    {
      BOOL v12 = sub_10000B070("octagon-ckks");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v39 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error fetching acount state: %@", buf, 0xCu);
      }
    }
    if ([v10 isInheritedAccount])
    {
      id v13 = sub_10000B070("octagon-ckks");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Account is inherited, user controllable views cannot be set", buf, 2u);
      }

      id v14 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:55 description:@"Cannot set user controllable views"];
      v6[2](v6, 0, v14);
    }
    else
    {
      id v26 = v11;
      unsigned int v27 = v10;
      id v15 = @"DisableUserControllableViews";
      if (v4) {
        id v15 = @"EnableUserControllableViews";
      }
      id v14 = v15;
      unsigned __int8 v16 = sub_10000B070("octagon-ckks");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v17 = @"disabled";
        if (v4) {
          CFStringRef v17 = @"enabled";
        }
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v39 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Settting user-controllable sync status as '%@'", buf, 0xCu);
      }

      __int16 v25 = [(OTCuttlefishContext *)self stateMachine];
      unsigned int v24 = +[OTStates OctagonReadyStates];
      id v36 = v14;
      CFStringRef v34 = @"BecomeReady";
      CFStringRef v32 = @"Ready";
      id v18 = +[OctagonStateTransitionPathStep success];
      CFStringRef v33 = v18;
      id v19 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      id v35 = v19;
      id v20 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      v37 = v20;
      id v21 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      v22 = +[OctagonStateTransitionPath pathFromDictionary:v21];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000E0330;
      v28[3] = &unk_1002F9D90;
      BOOL v30 = v4;
      v28[4] = self;
      uint64_t v29 = v6;
      id v23 = [v25 doWatchedStateMachineRPC:@"octagon-set-policy" sourceStates:v24 path:v22 reply:v28];

      unsigned int v11 = v26;
      id v10 = v27;
    }
  }
}

- (void)rpcFetchUserControllableViewsSyncingStatus:(id)a3
{
  BOOL v4 = a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (!v5)
  {
    id v7 = [(OTCuttlefishContext *)self stateMachine];
    unsigned int v8 = [v7 isPaused];

    if (v8)
    {
      id v9 = +[OTStates OctagonNotInCliqueStates];
      id v10 = [(OTCuttlefishContext *)self stateMachine];
      unsigned int v11 = [v10 currentState];
      BOOL v12 = +[NSSet setWithObject:v11];
      unsigned int v13 = [v9 intersectsSet:v12];

      if (v13)
      {
        id v14 = sub_10000B070("octagon-ckks");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          id v15 = "device is not in clique, returning not syncing";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
      unsigned __int8 v16 = [(OTCuttlefishContext *)self stateMachine];
      CFStringRef v17 = [v16 currentState];
      unsigned int v18 = [v17 isEqualToString:@"Error"];

      if (v18)
      {
        id v14 = sub_10000B070("octagon-ckks");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          id v15 = "state machine in the error state, cannot service request";
          goto LABEL_12;
        }
LABEL_13:

        id v19 = (void (*)(void *, id, void))v4[2];
        id v20 = v4;
        id v21 = 0;
        goto LABEL_25;
      }
    }
    v22 = [(OTCuttlefishContext *)self ckks];
    id v23 = [v22 syncingPolicy];

    if (!v23)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000E09E8;
      v33[3] = &unk_1002FA768;
      v33[4] = self;
      CFStringRef v34 = v4;
      [(OTCuttlefishContext *)self rpcRefetchCKKSPolicy:v33];

      goto LABEL_26;
    }
    unsigned int v24 = [(OTCuttlefishContext *)self ckks];
    __int16 v25 = [v24 syncingPolicy];
    id v26 = [v25 syncUserControllableViewsAsBoolean];

    unsigned int v27 = sub_10000B070("octagon-ckks");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      if (v26) {
        CFStringRef v28 = @"enabled";
      }
      else {
        CFStringRef v28 = @"disabled";
      }
      uint64_t v29 = [(OTCuttlefishContext *)self ckks];
      BOOL v30 = [v29 syncingPolicy];
      id v31 = [v30 syncUserControllableViews];
      if (v31 >= 4)
      {
        CFStringRef v32 = +[NSString stringWithFormat:@"(unknown: %i)", v31];
      }
      else
      {
        CFStringRef v32 = off_1002F9F78[v31];
      }
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v36 = v28;
      __int16 v37 = 2112;
      uint32_t v38 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Returning user-controllable status as %@ (%@)", buf, 0x16u);
    }
    id v19 = (void (*)(void *, id, void))v4[2];
    id v20 = v4;
    id v21 = v26;
LABEL_25:
    v19(v20, v21, 0);
    goto LABEL_26;
  }
  id v6 = sub_10000B070("octagon");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v36 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
  }

  ((void (*)(void *, void, __CFString *))v4[2])(v4, 0, v5);
LABEL_26:
}

- (void)rpcRefetchCKKSPolicy:(id)a3
{
  id v4 = a3;
  id v5 = [(OTCuttlefishContext *)self stateMachine];
  id v6 = +[OTStates OctagonReadyStates];
  CFStringRef v17 = @"RefetchCKKSPolicy";
  CFStringRef v15 = @"BecomeReady";
  CFStringRef v13 = @"Ready";
  id v7 = +[OctagonStateTransitionPathStep success];
  id v14 = v7;
  unsigned int v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  unsigned __int8 v16 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  unsigned int v18 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  unsigned int v11 = +[OctagonStateTransitionPath pathFromDictionary:v10];
  id v12 = [v5 doWatchedStateMachineRPC:@"octagon-refetch-ckks-policy" sourceStates:v6 path:v11 reply:v4];
}

- (void)fetchEscrowContents:(id)a3
{
  id v4 = a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v5);
  }
  else
  {
    id v7 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    unsigned int v8 = [(OTCuttlefishContext *)self activeAccount];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000E0FDC;
    v9[3] = &unk_1002F9D68;
    id v10 = v4;
    [v7 fetchEscrowContentsWithSpecificUser:v8 reply:v9];
  }
}

- (void)rpcInvalidateEscrowCache:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, v5);
  }
  else
  {
    id v7 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    unsigned int v8 = [(OTCuttlefishContext *)self activeAccount];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000E12F0;
    v9[3] = &unk_1002FB1E8;
    id v10 = v4;
    [v7 removeEscrowCacheWithSpecificUser:v8 reply:v9];
  }
}

- (void)rpcFetchAllViableEscrowRecordsFromSource:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  if (a3 == 1
    || ([(OTCuttlefishContext *)self errorIfNoCKAccount:0],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v10 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    unsigned int v11 = [(OTCuttlefishContext *)self activeAccount];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E15B8;
    v12[3] = &unk_1002FB260;
    id v13 = v6;
    [v10 fetchViableEscrowRecordsWithSpecificUser:v11 source:a3 reply:v12];

    unsigned int v8 = v13;
  }
  else
  {
    unsigned int v8 = (void *)v7;
    id v9 = sub_10000B070("octagon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v8);
  }
}

- (void)rpcFetchAllViableBottlesFromSource:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  if (a3 == 1
    || ([(OTCuttlefishContext *)self errorIfNoCKAccount:0],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unsigned int v8 = [(OTCuttlefishContext *)self sessionMetrics];
    id v10 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    unsigned int v11 = [(OTCuttlefishContext *)self activeAccount];
    id v12 = [v8 flowID];
    id v13 = [v8 deviceSessionID];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000E18FC;
    v14[3] = &unk_1002F9D40;
    id v15 = v6;
    [v10 fetchViableBottlesWithSpecificUser:v11 source:a3 flowID:v12 deviceSessionID:v13 reply:v14];
  }
  else
  {
    unsigned int v8 = (void *)v7;
    id v9 = sub_10000B070("octagon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v8);
  }
}

- (void)rpcTrustStatus:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v52 = 0;
  NSErrorUserInfoKey v53 = (id *)&v52;
  uint64_t v54 = 0x3032000000;
  v55 = sub_1000DAD14;
  v56 = sub_1000DAD24;
  id v57 = 0;
  unsigned int v8 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v9 = v53;
  id v51 = v53[5];
  id v10 = [v8 loadOrCreateAccountMetadata:&v51];
  objc_storeStrong(v9 + 5, v51);

  if (v53[5])
  {
    unsigned int v11 = [(OTCuttlefishContext *)self lockStateTracker];
    unsigned int v12 = [v11 isLockedError:v53[5]];

    if (v12)
    {
      id v13 = sub_10000B070("octagon");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Device is locked! pending initialization on unlock", (uint8_t *)&buf, 2u);
      }

      id v14 = v53[5];
      uint64_t v15 = -1;
LABEL_10:
      (*((void (**)(id, uint64_t, void, void, void, void, id))v7 + 2))(v7, v15, 0, 0, 0, 0, v14);
      goto LABEL_31;
    }
  }
  if ([v10 icloudAccountState] == 1)
  {
    unsigned __int8 v16 = sub_10000B070("octagon");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "no account! returning clique status 'no account'", (uint8_t *)&buf, 2u);
    }

    id v14 = 0;
    uint64_t v15 = 4;
    goto LABEL_10;
  }
  if ([v6 useCachedAccountStatus])
  {
    [(OTCuttlefishContext *)self rpcTrustStatusCachedStatus:v10 reply:v7];
    goto LABEL_31;
  }
  int64_t v17 = [(OTCuttlefishContext *)self checkForCKAccount:v6];
  if (!v17)
  {
    id v19 = sub_10000B070("octagon");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      id v20 = "Unknown cloudkit account status, returning cached trust value";
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&buf, 2u);
    }
LABEL_24:

    [(OTCuttlefishContext *)self rpcTrustStatusCachedStatus:v10 reply:v7];
    goto LABEL_31;
  }
  if (v17 == 3)
  {
    unsigned int v18 = sub_10000B070("octagon");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No cloudkit account present", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, uint64_t, void, void, void, void, void))v7 + 2))(v7, 4, 0, 0, 0, 0, 0);
    goto LABEL_31;
  }
  if ([v10 isInheritedAccount])
  {
    id v19 = sub_10000B070("octagon");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      id v20 = "Inherited account -- should circuit to cached trust value";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  id v21 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v21)
  {
    v22 = sub_10000B070("octagon");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, uint64_t, void, void, void, void, void *))v7 + 2))(v7, 4, 0, 0, 0, 0, v21);
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v59 = 0x3032000000;
    v60 = sub_1000DAD14;
    v61 = sub_1000DAD24;
    id v62 = 0;
    uint64_t v45 = 0;
    id v46 = &v45;
    uint64_t v47 = 0x3032000000;
    CFStringRef v48 = sub_1000DAD14;
    v49 = sub_1000DAD24;
    id v50 = 0;
    uint64_t v41 = 0;
    id v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    uint64_t v37 = 0;
    uint32_t v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = -1;
    uint64_t v33 = 0;
    CFStringRef v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    id v23 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    unsigned int v24 = [(OTCuttlefishContext *)self activeAccount];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000E2150;
    v25[3] = &unk_1002F9D18;
    CFStringRef v28 = &v41;
    uint64_t v29 = &v45;
    BOOL v30 = &v33;
    id v31 = &v52;
    p_long long buf = &buf;
    v25[4] = self;
    id v26 = v10;
    CFStringRef v32 = &v37;
    [v23 trustStatusWithSpecificUser:v24 reply:v25];

    (*((void (**)(id, uint64_t, void, uint64_t, void, void, id))v7 + 2))(v7, v38[3], *(void *)(*((void *)&buf + 1) + 40), v46[5], *((unsigned __int8 *)v42 + 24), *((unsigned __int8 *)v34 + 24), v53[5]);
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(&buf, 8);
  }

LABEL_31:
  _Block_object_dispose(&v52, 8);
}

- (void)rpcTrustStatusCachedStatus:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isInheritedAccount] & 1) != 0
    || [v5 trustState] == 2)
  {
    uint64_t v7 = 0;
  }
  else if ([v5 trustState] == 1)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 3;
  }
  unsigned int v8 = sub_10000B070("octagon");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = OTCliqueStatusToString();
    int v11 = 138412290;
    unsigned int v12 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "returning cached clique status: %@", (uint8_t *)&v11, 0xCu);
  }
  id v9 = [v5 peerID];
  (*((void (**)(id, uint64_t, void *, void, void, void, void))v6 + 2))(v6, v7, v9, 0, 0, 0, 0);
}

- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v14)
  {
    uint64_t v15 = sub_10000B070("octagon");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      BOOL v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v13[2](v13, 0, v14);
  }
  else
  {
    unsigned __int8 v16 = [OTCreateInheritanceKeyWithClaimTokenAndWrappingKey alloc];
    int64_t v17 = [(OTCuttlefishContext *)self operationDependencies];
    unsigned int v18 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)v16 initWithUUID:v10 claimTokenData:v11 wrappingKeyData:v12 dependencies:v17];

    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    __int16 v25 = sub_1000E2868;
    id v26 = &unk_100307280;
    unsigned int v27 = v18;
    CFStringRef v28 = v13;
    id v19 = v18;
    id v20 = +[CKKSResultOperation named:@"createInheritanceKeyWithClaimTokenAndWrappingKey-callback" withBlock:&v23];
    [v20 addDependency:v19, v23, v24, v25, v26];
    id v21 = [(OTCuttlefishContext *)self operationQueue];
    [v21 addOperation:v20];

    v22 = [(OTCuttlefishContext *)self operationQueue];
    [v22 addOperation:v19];
  }
}

- (void)rpcRecreateInheritanceKeyWithUUID:(id)a3 oldIK:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v11)
  {
    id v12 = sub_10000B070("octagon");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      unsigned int v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v10[2](v10, 0, v11);
  }
  else
  {
    id v13 = [OTRecreateInheritanceKeyOperation alloc];
    id v14 = [(OTCuttlefishContext *)self operationDependencies];
    uint64_t v15 = [(OTRecreateInheritanceKeyOperation *)v13 initWithUUID:v8 oldIK:v9 dependencies:v14];

    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_1000E2BA8;
    id v23 = &unk_100307280;
    uint64_t v24 = v15;
    __int16 v25 = v10;
    unsigned __int8 v16 = v15;
    int64_t v17 = +[CKKSResultOperation named:@"recreateInheritanceKey-callback" withBlock:&v20];
    [v17 addDependency:v16, v20, v21, v22, v23];
    unsigned int v18 = [(OTCuttlefishContext *)self operationQueue];
    [v18 addOperation:v17];

    id v19 = [(OTCuttlefishContext *)self operationQueue];
    [v19 addOperation:v16];
  }
}

- (void)rpcCheckInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [OTFindCustodianRecoveryKeyOperation alloc];
  id v9 = [(OTCuttlefishContext *)self operationDependencies];
  id v10 = [(OTFindCustodianRecoveryKeyOperation *)v8 initWithUUID:v7 dependencies:v9];

  unsigned __int8 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unsigned int v18 = sub_1000E2E14;
  id v19 = &unk_100307280;
  id v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = +[CKKSResultOperation named:@"checkInheritanceKey-callback" withBlock:&v16];
  [v13 addDependency:v12, v16, v17, v18, v19];
  id v14 = [(OTCuttlefishContext *)self operationQueue];
  [v14 addOperation:v13];

  uint64_t v15 = [(OTCuttlefishContext *)self operationQueue];
  [v15 addOperation:v12];
}

- (void)rpcRemoveInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [OTRemoveCustodianRecoveryKeyOperation alloc];
  id v9 = [(OTCuttlefishContext *)self operationDependencies];
  id v10 = [(OTRemoveCustodianRecoveryKeyOperation *)v8 initWithUUID:v7 dependencies:v9];

  unsigned __int8 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unsigned int v18 = sub_1000E30D8;
  id v19 = &unk_100307280;
  id v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = +[CKKSResultOperation named:@"removeInheritanceKey-callback" withBlock:&v16];
  [v13 addDependency:v12, v16, v17, v18, v19];
  id v14 = [(OTCuttlefishContext *)self operationQueue];
  [v14 addOperation:v13];

  uint64_t v15 = [(OTCuttlefishContext *)self operationQueue];
  [v15 addOperation:v12];
}

- (void)rpcStoreInheritanceKeyWithIK:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [OTStoreInheritanceKeyOperation alloc];
  id v9 = [(OTCuttlefishContext *)self operationDependencies];
  id v10 = [(OTStoreInheritanceKeyOperation *)v8 initWithIK:v7 dependencies:v9];

  unsigned __int8 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unsigned int v18 = sub_1000E332C;
  id v19 = &unk_100307280;
  id v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = +[CKKSResultOperation named:@"storeInheritanceKey-callback" withBlock:&v16];
  [v13 addDependency:v12, v16, v17, v18, v19];
  id v14 = [(OTCuttlefishContext *)self operationQueue];
  [v14 addOperation:v13];

  uint64_t v15 = [(OTCuttlefishContext *)self operationQueue];
  [v15 addOperation:v12];
}

- (void)rpcGenerateInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, void))a4;
  if (!v5) {
    id v5 = objc_alloc_init((Class)NSUUID);
  }
  id v10 = 0;
  id v7 = [objc_alloc((Class)OTInheritanceKey) initWithUUID:v5 error:&v10];
  id v8 = v10;
  if (v7)
  {
    v6[2](v6, v7, 0);
  }
  else
  {
    id v9 = sub_10000B070("SecError");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "octagon: failed to generate inheritance key: %@", buf, 0xCu);
    }

    ((void (**)(id, id, id))v6)[2](v6, 0, v8);
  }
}

- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [OTCreateInheritanceKeyOperation alloc];
  id v9 = [(OTCuttlefishContext *)self operationDependencies];
  id v10 = [(OTCreateInheritanceKeyOperation *)v8 initWithUUID:v7 dependencies:v9];

  unsigned __int8 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unsigned int v18 = sub_1000E36D0;
  id v19 = &unk_100307280;
  id v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = +[CKKSResultOperation named:@"createInheritanceKey-callback" withBlock:&v16];
  [v13 addDependency:v12, v16, v17, v18, v19];
  id v14 = [(OTCuttlefishContext *)self operationQueue];
  [v14 addOperation:v13];

  uint64_t v15 = [(OTCuttlefishContext *)self operationQueue];
  [v15 addOperation:v12];
}

- (void)rpcCheckCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [OTFindCustodianRecoveryKeyOperation alloc];
  id v9 = [(OTCuttlefishContext *)self operationDependencies];
  id v10 = [(OTFindCustodianRecoveryKeyOperation *)v8 initWithUUID:v7 dependencies:v9];

  unsigned __int8 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unsigned int v18 = sub_1000E393C;
  id v19 = &unk_100307280;
  id v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = +[CKKSResultOperation named:@"checkCustodianRecoveryKey-callback" withBlock:&v16];
  [v13 addDependency:v12, v16, v17, v18, v19];
  id v14 = [(OTCuttlefishContext *)self operationQueue];
  [v14 addOperation:v13];

  uint64_t v15 = [(OTCuttlefishContext *)self operationQueue];
  [v15 addOperation:v12];
}

- (void)rpcRemoveCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [OTRemoveCustodianRecoveryKeyOperation alloc];
  id v9 = [(OTCuttlefishContext *)self operationDependencies];
  id v10 = [(OTRemoveCustodianRecoveryKeyOperation *)v8 initWithUUID:v7 dependencies:v9];

  unsigned __int8 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unsigned int v18 = sub_1000E3C00;
  id v19 = &unk_100307280;
  id v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = +[CKKSResultOperation named:@"removeCustodianRecoveryKey-callback" withBlock:&v16];
  [v13 addDependency:v12, v16, v17, v18, v19];
  id v14 = [(OTCuttlefishContext *)self operationQueue];
  [v14 addOperation:v13];

  uint64_t v15 = [(OTCuttlefishContext *)self operationQueue];
  [v15 addOperation:v12];
}

- (void)rpcCreateCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [OTCreateCustodianRecoveryKeyOperation alloc];
  id v9 = [(OTCuttlefishContext *)self operationDependencies];
  id v10 = [(OTCreateCustodianRecoveryKeyOperation *)v8 initWithUUID:v7 dependencies:v9];

  unsigned __int8 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unsigned int v18 = sub_1000E3E54;
  id v19 = &unk_100307280;
  id v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = +[CKKSResultOperation named:@"createCustodianRecoveryKey-callback" withBlock:&v16];
  [v13 addDependency:v12, v16, v17, v18, v19];
  id v14 = [(OTCuttlefishContext *)self operationQueue];
  [v14 addOperation:v13];

  uint64_t v15 = [(OTCuttlefishContext *)self operationQueue];
  [v15 addOperation:v12];
}

- (void)areRecoveryKeysDistrusted:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    id v7 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v8 = [(OTCuttlefishContext *)self activeAccount];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000E40E0;
    v9[3] = &unk_1002FB288;
    id v10 = v4;
    [v7 octagonContainsDistrustedRecoveryKeysWithSpecificUser:v8 reply:v9];
  }
}

- (void)rpcRemoveRecoveryKey:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    id v7 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v8 = [(OTCuttlefishContext *)self activeAccount];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000E4274;
    v9[3] = &unk_1002FB288;
    id v10 = v4;
    [v7 removeRecoveryKey:v8 reply:v9];
  }
}

- (void)rpcIsRecoveryKeySet:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    id v7 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v8 = [(OTCuttlefishContext *)self activeAccount];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000E4408;
    v9[3] = &unk_1002FB288;
    id v10 = v4;
    [v7 isRecoveryKeySet:v8 reply:v9];
  }
}

- (void)rpcSetRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(OTCuttlefishContext *)self lockStateTracker];

  if (v8)
  {
    id v9 = [(OTCuttlefishContext *)self lockStateTracker];
    [v9 recheck];
  }
  id v10 = [OTSetRecoveryKeyOperation alloc];
  id v11 = [(OTCuttlefishContext *)self operationDependencies];
  id v12 = [(OTSetRecoveryKeyOperation *)v10 initWithDependencies:v11 recoveryKey:v7];

  unsigned int v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_1000E45A8;
  id v21 = &unk_100307280;
  v22 = v12;
  id v23 = v6;
  id v13 = v6;
  id v14 = v12;
  uint64_t v15 = +[CKKSResultOperation named:@"setRecoveryKey-callback" withBlock:&v18];
  [v15 addDependency:v14, v18, v19, v20, v21];
  unsigned __int8 v16 = [(OTCuttlefishContext *)self operationQueue];
  [v16 addOperation:v15];

  uint64_t v17 = [(OTCuttlefishContext *)self operationQueue];
  [v17 addOperation:v14];
}

- (void)fetchTrustedDeviceNamesByPeerID:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v5)
  {
    id v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    id v7 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v8 = [(OTCuttlefishContext *)self activeAccount];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000E481C;
    v9[3] = &unk_100307410;
    id v10 = v4;
    [v7 trustedDeviceNamesByPeerIDWithSpecificUser:v8 reply:v9];
  }
}

- (void)rpcFetchEgoPeerID:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v11 = 0;
  id v6 = [v5 getEgoPeerID:&v11];
  id v7 = v11;

  id v8 = sub_10000B070("octagon");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v6;
      id v10 = "Returning peer ID: %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }
  else if (v9)
  {
    *(_DWORD *)long long buf = 138412290;
    id v13 = v7;
    id v10 = "Unable to fetch peer ID: %@";
    goto LABEL_6;
  }

  v4[2](v4, v6, v7);
}

- (void)rpcStatus:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_1000DAD14;
  v66 = sub_1000DAD24;
  id v67 = (id)0xAAAAAAAAAAAAAAAALL;
  id v67 = +[NSMutableDictionary dictionary];
  id v5 = [(OTCuttlefishContext *)self containerName];
  [(id)v63[5] setObject:v5 forKeyedSubscript:@"containerName"];

  id v6 = [(OTCuttlefishContext *)self contextID];
  [(id)v63[5] setObject:v6 forKeyedSubscript:@"contextID"];

  id v7 = [(OTCuttlefishContext *)self activeAccount];
  id v8 = [v7 description];
  [(id)v63[5] setObject:v8 forKeyedSubscript:@"activeAccount"];

  id v9 = objc_alloc_init((Class)OTOperationConfiguration);
  [v9 setTimeoutWaitForCKAccount:2000000000];
  id v10 = [(OTCuttlefishContext *)self errorIfNoCKAccount:v9];
  if (v10)
  {
    id v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v69 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v10);
  }
  else
  {
    id v12 = [(OTCuttlefishContext *)self stateMachine];
    id v13 = [v12 paused];
    BOOL v14 = [v13 wait:3000000000] == 0;

    if (!v14)
    {
      uint64_t v15 = sub_10000B070("octagon");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v16 = [(OTCuttlefishContext *)self containerName];
        uint64_t v17 = [(OTCuttlefishContext *)self contextID];
        *(_DWORD *)long long buf = 138412546;
        v69 = v16;
        __int16 v70 = 2112;
        v71 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Returning status of unpaused state machine for container (%@) and context (%@)", buf, 0x16u);
      }
      [(id)v63[5] setObject:&off_100325F18 forKeyedSubscript:@"stateUnpaused"];
    }
    unsigned int v18 = [(OTCuttlefishContext *)self stateMachine];
    uint64_t v19 = [v18 currentState];
    [(id)v63[5] setObject:v19 forKeyedSubscript:@"state"];

    id v20 = [(OTCuttlefishContext *)self stateMachine];
    id v21 = [v20 dumpPendingFlags];
    [(id)v63[5] setObject:v21 forKeyedSubscript:@"statePendingFlags"];

    v22 = [(OTCuttlefishContext *)self stateMachine];
    id v23 = [v22 flags];
    uint64_t v24 = [v23 dumpFlags];
    [(id)v63[5] setObject:v24 forKeyedSubscript:@"stateFlags"];

    __int16 v25 = [(OTCuttlefishContext *)self accountMetadataStore];
    id v61 = 0;
    id v26 = [v25 loadOrCreateAccountMetadata:&v61];
    id v54 = v61;

    if (v54)
    {
      unsigned int v27 = sub_10000B070("octagon");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v28 = [(OTCuttlefishContext *)self containerName];
        uint64_t v29 = [(OTCuttlefishContext *)self contextID];
        *(_DWORD *)long long buf = 138412802;
        v69 = v28;
        __int16 v70 = 2112;
        v71 = v29;
        __int16 v72 = 2112;
        id v73 = v54;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to load account metaada for container (%@) and context (%@): %@", buf, 0x20u);
      }
    }
    BOOL v30 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v26 trustState:v54]);
    [(id)v63[5] setObject:v30 forKeyedSubscript:@"memoizedTrustState"];

    id v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v26 icloudAccountState]);
    [(id)v63[5] setObject:v31 forKeyedSubscript:@"memoizedAccountState"];

    CFStringRef v32 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v26 cdpState]);
    [(id)v63[5] setObject:v32 forKeyedSubscript:@"memoizedCDPStatus"];

    uint64_t v33 = [(OTCuttlefishContext *)self launchSequence];
    CFStringRef v34 = [v33 eventsByTime];
    [(id)v63[5] setObject:v34 forKeyedSubscript:@"octagonLaunchSeqence"];

    uint64_t v35 = [(OTCuttlefishContext *)self currentMemoizedLastHealthCheck];
    char v36 = (void *)v35;
    if (v35) {
      CFStringRef v37 = (const __CFString *)v35;
    }
    else {
      CFStringRef v37 = @"Never checked";
    }
    [(id)v63[5] setObject:v37 forKeyedSubscript:@"memoizedlastHealthCheck"];
    uint32_t v38 = [(OTCuttlefishContext *)self sosAdapter];
    unsigned int v39 = [v38 sosEnabled];

    if (v39)
    {
      uint64_t v40 = [(OTCuttlefishContext *)self sosTrustedPeersStatus];
      [(id)v63[5] setObject:v40 forKeyedSubscript:@"sosTrustedPeersStatus"];

      uint64_t v41 = [(OTCuttlefishContext *)self sosSelvesStatus];
      [(id)v63[5] setObject:v41 forKeyedSubscript:@"sosSelvesStatus"];
    }
    id v60 = 0;
    id v42 = [(objc_class *)[(OTCuttlefishContext *)self escrowRequestClass] request:&v60];
    id v43 = v60;
    id v59 = v43;
    char v44 = [v42 fetchStatuses:&v59];
    id v45 = v59;

    [(id)v63[5] setObject:v44 forKeyedSubscript:@"escrowRequest"];
    id v46 = [(OTCuttlefishContext *)self followupHandler];
    uint64_t v47 = [v46 sysdiagnoseStatus];
    [(id)v63[5] setObject:v47 forKeyedSubscript:@"CoreFollowUp"];

    CFStringRef v48 = +[CKKSAnalytics logger];
    v49 = [v48 datePropertyForKey:@"lastOctagonPush"];
    [(id)v63[5] setObject:v49 forKeyedSubscript:@"lastOctagonPush"];

    id v50 = [(OTCuttlefishContext *)self apsReceiver];
    id v51 = [v50 registeredPushEnvironments];
    [(id)v63[5] setObject:v51 forKeyedSubscript:@"pushEnvironments"];

    uint64_t v52 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    NSErrorUserInfoKey v53 = [(OTCuttlefishContext *)self activeAccount];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    void v56[2] = sub_1000E52B8;
    v56[3] = &unk_1002F9CF0;
    CFStringRef v58 = &v62;
    id v57 = v4;
    [v52 dumpWithSpecificUser:v53 reply:v56];
  }
  _Block_object_dispose(&v62, 8);
}

- (id)sosSelvesStatus
{
  v3 = [(OTCuttlefishContext *)self sosAdapter];
  id v23 = 0;
  id v4 = [v3 fetchSelfPeers:&v23];
  id v5 = v23;

  if (!v4 || v5)
  {
    id v10 = sub_10000B070("octagon");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No SOS selves present: %@, skipping in status", buf, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = +[NSMutableDictionary dictionary];
    id v7 = [v4 currentSelf];
    id v8 = [(OTCuttlefishContext *)self ckksPeerStatus:v7];
    [v6 setObject:v8 forKeyedSubscript:@"currentSelf"];

    id v9 = [v4 allSelves];
    id v10 = [v9 mutableCopy];

    id v11 = [v4 currentSelf];
    [v10 removeObject:v11];

    if ([v10 count])
    {
      id v12 = +[NSMutableArray array];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v10;
      id v13 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v10);
            }
            uint64_t v17 = -[OTCuttlefishContext ckksPeerStatus:](self, "ckksPeerStatus:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
            if (v17) {
              [v12 addObject:v17];
            }
          }
          id v14 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v14);
      }

      [v6 setObject:v12 forKeyedSubscript:@"pastSelves"];
    }
  }

  return v6;
}

- (id)sosTrustedPeersStatus
{
  v3 = [(OTCuttlefishContext *)self sosAdapter];
  id v18 = 0;
  id v4 = [v3 fetchTrustedPeers:&v18];
  id v5 = v18;

  if (!v4 || v5)
  {
    id v7 = sub_10000B070("octagon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No SOS peers present: %@, skipping in status", buf, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = +[NSMutableArray array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = -[OTCuttlefishContext ckksPeerStatus:](self, "ckksPeerStatus:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (v12) {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
  }

  return v6;
}

- (id)ckksPeerStatus:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [v3 peerID];

  if (v5)
  {
    id v6 = [v3 peerID];
    [v4 setObject:v6 forKeyedSubscript:@"peerID"];
  }
  id v7 = [v3 publicSigningKey];
  id v8 = [v7 encodeSubjectPublicKeyInfo];

  if (v8)
  {
    id v9 = [v8 base64EncodedStringWithOptions:0];
    [v4 setObject:v9 forKeyedSubscript:@"signingSPKI"];

    uint64_t v10 = +[TPHashBuilder hashWithAlgo:1 ofData:v8];
    [v4 setObject:v10 forKeyedSubscript:@"signingSPKIHash"];
  }

  return v4;
}

- (void)rpcJoin:(id)a3 vouchSig:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  id v11 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v11)
  {
    id v12 = sub_10000B070("octagon");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v10[2](v10, v11);
  }
  else
  {
    id v13 = [(OTCuttlefishContext *)self accountMetadataStore];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000E5C8C;
    v24[3] = &unk_1002FAEE8;
    id v25 = v8;
    id v26 = v9;
    id v23 = 0;
    [v13 persistAccountChanges:v24 error:&v23];
    id v14 = v23;

    if (v14)
    {
      long long v15 = sub_10000B070("octagon");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to save voucher for joining: %@", buf, 0xCu);
      }

      v10[2](v10, v14);
    }
    else
    {
      long long v16 = +[NSSet setWithObjects:@"InitiatorAwaitingVoucher", @"Untrusted", 0];
      long long v17 = [(OTCuttlefishContext *)self joinStatePathDictionary];
      id v18 = +[OctagonStateTransitionPath pathFromDictionary:v17];

      long long v19 = [(OTCuttlefishContext *)self stateMachine];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000E5CDC;
      v21[3] = &unk_1002FA768;
      v21[4] = self;
      long long v22 = v10;
      id v20 = [v19 doWatchedStateMachineRPC:@"rpc-join" sourceStates:v16 path:v18 reply:v21];
    }
  }
}

- (id)joinStatePathDictionary
{
  CFStringRef v59 = @"InitiatorSetCDPBit";
  CFStringRef v57 = @"InitiatorUpdateDeviceList";
  CFStringRef v55 = @"InitiatorJoin";
  v53[0] = @"BottlePreloadOctagonKeysInSOS";
  v51[0] = @"JoinSOSAfterCKKSFetch";
  CFStringRef v49 = @"SetAccountSettings";
  CFStringRef v47 = @"BecomeReady";
  CFStringRef v45 = @"Ready";
  uint64_t v24 = +[OctagonStateTransitionPathStep success];
  id v46 = v24;
  id v23 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  CFStringRef v48 = v23;
  long long v22 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  id v50 = v22;
  id v21 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  v51[1] = @"SetAccountSettings";
  v52[0] = v21;
  CFStringRef v43 = @"BecomeReady";
  CFStringRef v41 = @"Ready";
  id v20 = +[OctagonStateTransitionPathStep success];
  id v42 = v20;
  long long v19 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  char v44 = v19;
  id v18 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v52[1] = v18;
  long long v17 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
  v53[1] = @"InitiatorJoinCKKSReset";
  v54[0] = v17;
  CFStringRef v39 = @"InitiatorJoinAfterCKKSReset";
  CFStringRef v37 = @"BottlePreloadOctagonKeysInSOS";
  v35[0] = @"JoinSOSAfterCKKSFetch";
  CFStringRef v33 = @"SetAccountSettings";
  CFStringRef v31 = @"BecomeReady";
  CFStringRef v29 = @"Ready";
  long long v16 = +[OctagonStateTransitionPathStep success];
  BOOL v30 = v16;
  long long v15 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  CFStringRef v32 = v15;
  id v14 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  CFStringRef v34 = v14;
  id v13 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v35[1] = @"SetAccountSettings";
  v36[0] = v13;
  CFStringRef v27 = @"BecomeReady";
  CFStringRef v25 = @"Ready";
  v2 = +[OctagonStateTransitionPathStep success];
  id v26 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v28 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v36[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  uint32_t v38 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  uint64_t v40 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  v54[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
  v56 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  CFStringRef v58 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  id v60 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];

  return v11;
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v8)
  {
    id v9 = sub_10000B070("octagon-preflight-rk");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, 0, v8);
  }
  else
  {
    uint64_t v10 = [(OTCuttlefishContext *)self activeAccount];
    id v11 = [v10 altDSID];

    if (v11)
    {
      id v12 = v11;
      id v13 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
      id v14 = [(OTCuttlefishContext *)self activeAccount];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000E64A0;
      v18[3] = &unk_1002FB288;
      long long v19 = v7;
      [v13 preflightRecoverOctagonUsingRecoveryKey:v14 recoveryKey:v6 salt:v12 reply:v18];

      long long v15 = v19;
    }
    else
    {
      long long v16 = sub_10000B070("octagon-preflight-rk");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = [(OTCuttlefishContext *)self activeAccount];
        *(_DWORD *)long long buf = 138412290;
        id v21 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
      }
      long long v15 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
      v7[2](v7, 0, v15);
    }
  }
}

- (void)preflightJoinWithInheritanceKey:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = objc_alloc_init((Class)OTOperationConfiguration);
  id v9 = [(OTCuttlefishContext *)self errorIfNoCKAccount:v8];
  if (v9)
  {
    uint64_t v10 = sub_10000B070("octagon");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
  else
  {
    id v11 = objc_alloc((Class)OTCustodianRecoveryKey);
    id v12 = [v6 uuid];
    id v13 = [v6 recoveryKeyData];
    id v14 = [v13 base64EncodedStringWithOptions:0];
    id v29 = 0;
    id v15 = [v11 initWithUUID:v12 recoveryString:v14 error:&v29];
    id v16 = v29;

    if (v15)
    {
      long long v17 = [TrustedPeersHelperCustodianRecoveryKey alloc];
      id v18 = [v15 uuid];
      long long v19 = [v18 UUIDString];
      [v15 recoveryString];
      v20 = id v28 = v16;
      id v21 = [(TrustedPeersHelperCustodianRecoveryKey *)v17 initWithUUID:v19 encryptionKey:0 signingKey:0 recoveryString:v20 salt:&stru_10030AA90 kind:2];

      long long v22 = [OTPreflightVouchWithCustodianRecoveryKeyOperation alloc];
      id v23 = [(OTCuttlefishContext *)self operationDependencies];
      uint64_t v24 = [(OTPreflightVouchWithCustodianRecoveryKeyOperation *)v22 initWithDependencies:v23 intendedState:@"BecomeReady" errorState:@"BecomeReady" tphcrk:v21];

      CFStringRef v25 = +[OTStates OctagonReadyStates];
      id v26 = [(OTCuttlefishContext *)self stateMachine];
      [v26 doSimpleStateMachineRPC:@"preflight-inheritance-recovery-key" op:v24 sourceStates:v25 reply:v7];

      id v16 = v28;
    }
    else
    {
      CFStringRef v27 = sub_10000B070("SecError");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "octagon-inheritance: failed to create CRK: %@", buf, 0xCu);
      }

      v7[2](v7, v16);
    }
  }
}

- (void)joinWithInheritanceKey:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  [(OTCuttlefishContext *)self setInheritanceKey:a3];
  id v7 = objc_alloc_init((Class)OTOperationConfiguration);
  id v8 = [(OTCuttlefishContext *)self errorIfNoCKAccount:v7];
  if (v8)
  {
    id v9 = sub_10000B070("octagon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, v8);
  }
  else
  {
    CFStringRef v22 = @"PrepareAndRecoverTLKSharesForInheritancePeer";
    CFStringRef v20 = @"BecomeInherited";
    uint64_t v10 = +[OctagonStateTransitionPathStep success];
    long long v19 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v21 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v23 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v14 = +[OctagonStateTransitionPath pathFromDictionary:v13];

    id v15 = [(OTCuttlefishContext *)self stateMachine];
    id v16 = +[OTStates OctagonInAccountStates];
    id v17 = [v15 doWatchedStateMachineRPC:@"rpc-join-with-inheritance-key" sourceStates:v16 path:v14 reply:v6];
  }
}

- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = objc_alloc_init((Class)OTOperationConfiguration);
  id v9 = [(OTCuttlefishContext *)self errorIfNoCKAccount:v8];
  if (v9)
  {
    uint64_t v10 = sub_10000B070("octagon");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
  else
  {
    id v11 = [(OTCuttlefishContext *)self activeAccount];
    id v12 = [v11 altDSID];

    if (v12)
    {
      id v13 = v12;
      id v14 = [TrustedPeersHelperCustodianRecoveryKey alloc];
      id v15 = [v6 uuid];
      id v16 = [v15 UUIDString];
      [v6 recoveryString];
      id v17 = v27 = v12;
      uint64_t v18 = [(TrustedPeersHelperCustodianRecoveryKey *)v14 initWithUUID:v16 encryptionKey:0 signingKey:0 recoveryString:v17 salt:v13 kind:1];

      long long v19 = [OTPreflightVouchWithCustodianRecoveryKeyOperation alloc];
      CFStringRef v20 = [(OTCuttlefishContext *)self operationDependencies];
      id v21 = [(OTPreflightVouchWithCustodianRecoveryKeyOperation *)v19 initWithDependencies:v20 intendedState:@"BecomeReady" errorState:@"BecomeReady" tphcrk:v18];

      CFStringRef v22 = +[OTStates OctagonReadyStates];
      id v23 = [(OTCuttlefishContext *)self stateMachine];
      [v23 doSimpleStateMachineRPC:@"preflight-custodian-recovery-key" op:v21 sourceStates:v22 reply:v7];

      id v12 = v27;
    }
    else
    {
      uint64_t v24 = sub_10000B070("authkit");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v25 = [(OTCuttlefishContext *)self activeAccount];
        *(_DWORD *)long long buf = 138412290;
        id v29 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
      }
      id v26 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
      v7[2](v7, v26);
    }
  }
}

- (void)joinWithCustodianRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  [(OTCuttlefishContext *)self setCustodianRecoveryKey:a3];
  id v7 = objc_alloc_init((Class)OTOperationConfiguration);
  id v8 = [(OTCuttlefishContext *)self errorIfNoCKAccount:v7];
  if (v8)
  {
    id v9 = sub_10000B070("octagon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, v8);
  }
  else
  {
    CFStringRef v19 = @"CreateIdentityForCustodianRecoveryKey";
    uint64_t v10 = [(OTCuttlefishContext *)self joinStatePathDictionary];
    uint64_t v18 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    CFStringRef v20 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v13 = +[OctagonStateTransitionPath pathFromDictionary:v12];

    id v14 = [(OTCuttlefishContext *)self stateMachine];
    id v15 = +[OTStates OctagonInAccountStates];
    id v16 = [v14 doWatchedStateMachineRPC:@"rpc-join-with-custodian-recovery-key" sourceStates:v15 path:v13 reply:v6];
  }
}

- (void)joinWithRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  [(OTCuttlefishContext *)self setRecoveryKey:a3];
  id v7 = objc_alloc_init((Class)OTOperationConfiguration);
  id v8 = [(OTCuttlefishContext *)self errorIfNoCKAccount:v7];
  if (v8)
  {
    id v9 = sub_10000B070("octagon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, v8);
  }
  else
  {
    CFStringRef v22 = @"OctagonStateStashAccountSettingsForRecoveryKey";
    CFStringRef v20 = @"CreateIdentityForRecoveryKey";
    uint64_t v10 = [(OTCuttlefishContext *)self joinStatePathDictionary];
    CFStringRef v19 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v21 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v23 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v14 = +[OctagonStateTransitionPath pathFromDictionary:v13];

    id v15 = [(OTCuttlefishContext *)self stateMachine];
    id v16 = +[OTStates OctagonInAccountStates];
    id v17 = [v15 doWatchedStateMachineRPC:@"rpc-join-with-recovery-key" sourceStates:v16 path:v14 reply:v6];
  }
}

- (void)joinWithBottle:(id)a3 entropy:(id)a4 bottleSalt:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a6;
  objc_storeStrong((id *)&self->_bottleID, a3);
  objc_storeStrong((id *)&self->_entropy, a4);
  objc_storeStrong((id *)&self->_bottleSalt, a5);
  id v15 = objc_alloc_init((Class)OTOperationConfiguration);
  id v16 = [(OTCuttlefishContext *)self errorIfNoCKAccount:v15];
  if (v16)
  {
    id v17 = sub_10000B070("octagon");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v14[2](v14, v16);
  }
  else
  {
    CFStringRef v30 = @"BottleJoinCreateIdentity";
    CFStringRef v28 = @"BottleJoinVouchWithBottle";
    uint64_t v18 = [(OTCuttlefishContext *)self joinStatePathDictionary];
    id v29 = v18;
    id v25 = v11;
    CFStringRef v19 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v31 = v19;
    CFStringRef v20 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v21 = +[OctagonStateTransitionPath pathFromDictionary:v20];

    CFStringRef v22 = [(OTCuttlefishContext *)self stateMachine];
    id v23 = +[OTStates OctagonInAccountStates];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000E75B0;
    v26[3] = &unk_1002FA768;
    void v26[4] = self;
    CFStringRef v27 = v14;
    id v24 = [v22 doWatchedStateMachineRPC:@"rpc-join-with-bottle" sourceStates:v23 path:v21 reply:v26];

    id v11 = v25;
  }
}

- (void)rpcPrepareIdentityAsApplicantWithConfiguration:(id)a3 epoch:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v10)
  {
    id v11 = sub_10000B070("octagon");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, 0, 0, v10);
  }
  else
  {
    id v12 = sub_10000B070("otrpc");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Preparing identity as applicant", buf, 2u);
    }

    id v13 = [(OTCuttlefishContext *)self lockStateTracker];

    if (v13)
    {
      id v14 = [(OTCuttlefishContext *)self lockStateTracker];
      [v14 recheck];
    }
    id v15 = [OTPrepareOperation alloc];
    id v16 = [(OTCuttlefishContext *)self operationDependencies];
    id v17 = [(OTCuttlefishContext *)self prepareInformation];
    uint64_t v18 = [(OTCuttlefishContext *)self policyOverride];
    CFStringRef v19 = [(OTCuttlefishContext *)self accountSettings];
    CFStringRef v20 = [(OTPrepareOperation *)v15 initWithDependencies:v16 intendedState:@"InitiatorAwaitingVoucher" errorState:@"BecomeUntrusted" deviceInfo:v17 policyOverride:v18 accountSettings:v19 epoch:a4];

    id v21 = [(OTCuttlefishContext *)self deviceAdapter];
    if ([v21 isWatch])
    {
      unsigned int v22 = 1;
    }
    else
    {
      id v23 = [(OTCuttlefishContext *)self deviceAdapter];
      if ([v23 isAppleTV])
      {
        unsigned int v22 = 1;
      }
      else
      {
        id v24 = [(OTCuttlefishContext *)self deviceAdapter];
        unsigned int v22 = [v24 isHomePod];
      }
    }

    if ([v8 timeout])
    {
      uint64_t v25 = (uint64_t)[v8 timeout];
    }
    else if (v22)
    {
      uint64_t v25 = 240000000000;
    }
    else
    {
      uint64_t v25 = 120000000000;
    }
    id v26 = [OctagonStateTransitionRequest alloc];
    v38[0] = @"Untrusted";
    v38[1] = @"WaitForCDP";
    v38[2] = @"WaitingForCloudKitAccount";
    v38[3] = @"DetermineiCloudAccountState";
    v38[4] = @"NoAccount";
    v38[5] = @"not_started";
    CFStringRef v27 = +[NSArray arrayWithObjects:v38 count:6];
    CFStringRef v28 = +[NSSet setWithArray:v27];
    id v29 = [(OTCuttlefishContext *)self queue];
    id v30 = [(OctagonStateTransitionRequest *)v26 init:@"prepareForApplicant" sourceStates:v28 serialQueue:v29 transitionOp:v20];

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    void v35[2] = sub_1000E7AA4;
    v35[3] = &unk_100307280;
    char v36 = v20;
    id v37 = v9;
    id v31 = v20;
    CFStringRef v32 = +[CKKSResultOperation named:@"rpcPrepare-callback" withBlock:v35];
    [v32 addDependency:v31];
    CFStringRef v33 = [(OTCuttlefishContext *)self operationQueue];
    [v33 addOperation:v32];

    CFStringRef v34 = [(OTCuttlefishContext *)self stateMachine];
    [v34 handleExternalRequest:v30 startTimeout:v25];
  }
}

- (void)rpcVoucherWithConfiguration:(id)a3 permanentInfo:(id)a4 permanentInfoSig:(id)a5 stableInfo:(id)a6 stableInfoSig:(id)a7 reply:(id)a8
{
  id v44 = a3;
  id v45 = a4;
  id v46 = a5;
  id v47 = a6;
  id v48 = a7;
  id v14 = a8;
  id v15 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  id v16 = sub_10000B070("rpc-vouch");
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0, 0, v15);
  }
  else
  {
    if (v17)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating voucher", buf, 2u);
    }

    uint64_t v18 = [(OTCuttlefishContext *)self lockStateTracker];

    if (v18)
    {
      CFStringRef v19 = [(OTCuttlefishContext *)self lockStateTracker];
      [v19 recheck];
    }
    CFStringRef v20 = [OTUpdateTrustedDeviceListOperation alloc];
    id v21 = [(OTCuttlefishContext *)self operationDependencies];
    CFStringRef v43 = [(OTUpdateTrustedDeviceListOperation *)v20 initWithDependencies:v21 intendedState:@"BecomeReady" listUpdatesState:@"BecomeReady" errorState:@"BecomeReady" retryFlag:0];

    unsigned int v22 = [OctagonStateTransitionRequest alloc];
    id v23 = +[OTStates OctagonReadyStates];
    id v24 = [(OTCuttlefishContext *)self queue];
    id v42 = [(OctagonStateTransitionRequest *)v22 init:@"updateTDL" sourceStates:v23 serialQueue:v24 transitionOp:v43];

    uint64_t v25 = [OTPairingVoucherOperation alloc];
    id v26 = [(OTCuttlefishContext *)self operationDependencies];
    CFStringRef v27 = [(OTCuttlefishContext *)self prepareInformation];
    CFStringRef v28 = [(OTPairingVoucherOperation *)v25 initWithDependencies:v26 intendedState:@"BecomeReady" errorState:@"BecomeReady" deviceInfo:v27 peerID:v44 permanentInfo:v45 permanentInfoSig:v46 stableInfo:v47 stableInfoSig:v48];

    id v29 = [OctagonStateTransitionRequest alloc];
    id v30 = +[OTStates OctagonReadyStates];
    id v31 = [(OTCuttlefishContext *)self queue];
    id v32 = [(OctagonStateTransitionRequest *)v29 init:@"rpcVoucher" sourceStates:v30 serialQueue:v31 transitionOp:v28];

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000E819C;
    v55[3] = &unk_100307280;
    CFStringRef v33 = v28;
    v56 = v33;
    id v34 = v14;
    id v57 = v34;
    uint64_t v35 = +[CKKSResultOperation named:@"rpcVoucher-callback" withBlock:v55];
    *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    void v49[2] = sub_1000E8300;
    v49[3] = &unk_1002F9CC8;
    objc_copyWeak(&v54, (id *)buf);
    char v36 = v43;
    id v50 = v36;
    id v53 = v34;
    id v37 = v35;
    id v51 = v37;
    id v38 = v32;
    id v52 = v38;
    CFStringRef v39 = +[CKKSResultOperation named:@"updateTDL-callback" withBlock:v49];
    [v39 addDependency:v36];
    uint64_t v40 = [(OTCuttlefishContext *)self operationQueue];
    [v40 addOperation:v39];

    [(CKKSGroupOperation *)v33 addDependency:v39];
    [v37 addDependency:v33];
    CFStringRef v41 = [(OTCuttlefishContext *)self stateMachine];
    [v41 handleExternalRequest:v42 startTimeout:120000000000];

    objc_destroyWeak(&v54);
    objc_destroyWeak((id *)buf);
  }
}

- (void)rpcEpoch:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  id v6 = sub_10000B070("rpc-epoch");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v5);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching epoch", buf, 2u);
    }

    id v8 = [(OTCuttlefishContext *)self lockStateTracker];

    if (v8)
    {
      id v9 = [(OTCuttlefishContext *)self lockStateTracker];
      [v9 recheck];
    }
    uint64_t v10 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    id v11 = [(OTCuttlefishContext *)self activeAccount];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E864C;
    v12[3] = &unk_1002F9CA0;
    id v13 = v4;
    [v10 fetchEgoEpochWithSpecificUser:v11 reply:v12];
  }
}

- (id)errorIfNoCKAccount:(id)a3
{
  int64_t v3 = [(OTCuttlefishContext *)self checkForCKAccount:a3];
  if (v3 == 3)
  {
    CFStringRef v4 = @"User is not signed into iCloud.";
    uint64_t v5 = 25;
    goto LABEL_5;
  }
  if (!v3)
  {
    CFStringRef v4 = @"Cannot determine iCloud Account state; try again later";
    uint64_t v5 = 56;
LABEL_5:
    id v6 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:v5 description:v4];
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (int64_t)checkForCKAccount:(id)a3
{
  id v4 = a3;
  if ([v4 timeoutWaitForCKAccount])
  {
    unint64_t v5 = (unint64_t)[v4 timeoutWaitForCKAccount];
    if (v5 < 2)
    {
      uint64_t v6 = 0;
      goto LABEL_10;
    }
    uint64_t v6 = v5 >> 1;
  }
  else
  {
    uint64_t v6 = 5000000000;
  }
  BOOL v7 = [(OTCuttlefishContext *)self cloudKitAccountStateKnown];
  id v8 = [v7 wait:v6];

  if (v8)
  {
    id v9 = sub_10000B070("octagon-ck");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to determine CloudKit account state?", buf, 2u);
    }
  }
LABEL_10:
  *(void *)long long buf = 0;
  id v31 = buf;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  CFStringRef v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v10 = [(OTCuttlefishContext *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E8C10;
  block[3] = &unk_1003070F0;
  block[4] = self;
  block[5] = &v26;
  block[6] = buf;
  dispatch_sync(v10, block);

  if (!*((unsigned char *)v27 + 24) || (int v11 = v31[24]) == 0)
  {
    id v12 = sub_10000B070("octagon-ck");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(OTCuttlefishContext *)self contextID];
      *(_DWORD *)id v34 = 138412290;
      uint64_t v35 = (uint64_t)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No CK account present(%@). Attempting to refetch CK account status...", v34, 0xCu);
    }
    id v14 = [(OTCuttlefishContext *)self accountStateTracker];
    unsigned __int8 v15 = [v14 notifyCKAccountStatusChangeAndWait:v6];

    if ((v15 & 1) == 0)
    {
      id v16 = sub_10000B070("octagon-ck");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Fetching new CK account status did not complete in time", v34, 2u);
      }
    }
    BOOL v17 = [(OTCuttlefishContext *)self queue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000E8CC0;
    v24[3] = &unk_1003070F0;
    void v24[4] = self;
    v24[5] = &v26;
    v24[6] = buf;
    dispatch_sync(v17, v24);

    uint64_t v18 = sub_10000B070("octagon-ck");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [(OTCuttlefishContext *)self contextID];
      CFStringRef v20 = (void *)v19;
      if (v31[24]) {
        CFStringRef v21 = @"present";
      }
      else {
        CFStringRef v21 = @"missing";
      }
      *(_DWORD *)id v34 = 138412546;
      uint64_t v35 = v19;
      __int16 v36 = 2112;
      CFStringRef v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "After refetch, CK account status(%@) is %@", v34, 0x16u);
    }
    if (!*((unsigned char *)v27 + 24))
    {
      int64_t v22 = 0;
      goto LABEL_29;
    }
    int v11 = v31[24];
  }
  if (v11) {
    int64_t v22 = 1;
  }
  else {
    int64_t v22 = 3;
  }
LABEL_29:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

  return v22;
}

- (void)trustedPeerSetChanged:(id)a3
{
  id v4 = a3;
  unint64_t v5 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received an update of an SOS trust set change", buf, 2u);
  }

  uint64_t v6 = [(OTCuttlefishContext *)self sosAdapter];
  unsigned __int8 v7 = [v6 sosEnabled];

  if ((v7 & 1) == 0)
  {
    id v8 = sub_10000B070("octagon-sos");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "This platform doesn't support SOS. This is probably a bug?", buf, 2u);
    }
  }
  id v9 = [(OTCuttlefishContext *)self sosConsistencyRateLimiter];

  if (!v9)
  {
    uint64_t v10 = sub_10000B070("octagon");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "creating SOS consistency rate limiter", buf, 2u);
    }

    if (qword_10035CE18 != -1) {
      dispatch_once(&qword_10035CE18, &stru_1002F8ED0);
    }
    int v11 = byte_10035CE20;
    int v12 = byte_10035CE20;
    *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000E9034;
    v19[3] = &unk_1003077A0;
    objc_copyWeak(&v20, (id *)buf);
    id v13 = objc_retainBlock(v19);
    id v14 = [CKKSNearFutureScheduler alloc];
    if (v12) {
      uint64_t v15 = 10000000000;
    }
    else {
      uint64_t v15 = 30000000000;
    }
    if (v11) {
      uint64_t v16 = 200000000;
    }
    else {
      uint64_t v16 = 2000000000;
    }
    BOOL v17 = [(CKKSNearFutureScheduler *)v14 initWithName:@"sos-consistency-ratelimiter" initialDelay:v16 exponentialBackoff:v15 maximumDelay:0 keepProcessAlive:1000 dependencyDescriptionCode:v13 block:2.0];
    [(OTCuttlefishContext *)self setSosConsistencyRateLimiter:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  uint64_t v18 = [(OTCuttlefishContext *)self sosConsistencyRateLimiter];
  [v18 trigger];
}

- (void)deviceNameUpdated
{
  int64_t v3 = sub_10000B070("octagon-devicename");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(OTCuttlefishContext *)self contextID];
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "device name updated: %@", (uint8_t *)&v7, 0xCu);
  }
  unint64_t v5 = [[OctagonPendingFlag alloc] initWithFlag:@"recd_push" conditions:1];
  uint64_t v6 = [(OTCuttlefishContext *)self stateMachine];
  [v6 handlePendingFlag:v5];
}

- (void)requestTrustedDeviceListRefresh
{
  id v2 = [(OTCuttlefishContext *)self stateMachine];
  [v2 handleFlag:@"attempt_machine_id_list"];
}

- (id)currentMemoizedLastHealthCheck
{
  id v2 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v8 = 0;
  int64_t v3 = [v2 loadOrCreateAccountMetadata:&v8];
  id v4 = v8;

  if (v3)
  {
    if ([v3 lastHealthCheckup])
    {
      id v5 = [objc_alloc((Class)NSDate) initWithTimeIntervalSince1970:((double)(unint64_t)[v3 lastHealthCheckup]) / 1000.0];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to fetch account metadata: %@", buf, 0xCu);
    }
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

- (int)currentMemoizedAccountState
{
  id v2 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v8 = 0;
  int64_t v3 = [v2 loadOrCreateAccountMetadata:&v8];
  id v4 = v8;

  if (v3)
  {
    int v5 = [v3 icloudAccountState];
  }
  else
  {
    uint64_t v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to fetch account metadata: %@", buf, 0xCu);
    }

    int v5 = 0;
  }

  return v5;
}

- (int)currentMemoizedTrustState
{
  id v2 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v8 = 0;
  int64_t v3 = [v2 loadOrCreateAccountMetadata:&v8];
  id v4 = v8;

  if (v3)
  {
    int v5 = [v3 trustState];
  }
  else
  {
    uint64_t v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to fetch account metadata: %@", buf, 0xCu);
    }

    int v5 = 0;
  }

  return v5;
}

- (void)setMachineIDOverride:(id)a3
{
  id v4 = a3;
  id v5 = [(OTCuttlefishContext *)self deviceAdapter];
  [v5 setOverriddenMachineID:v4];
}

- (void)popTooManyPeersDialogWithEgoPeerStatus:(id)a3 accountMeta:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(OTCuttlefishContext *)self tooManyPeersAdapter];
  unsigned int v9 = [v8 shouldPopDialog];

  if (v9)
  {
    if ([v7 warnedTooManyPeers])
    {
      id v10 = sub_10000B070("octagon");
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:

        goto LABEL_29;
      }
      int v11 = [v7 altDSID];
      *(_DWORD *)long long buf = 138412290;
      id v38 = v11;
      int v12 = "popdialog: Already checked this altDSID: %@";
      id v13 = v10;
      uint32_t v14 = 12;
      goto LABEL_25;
    }
    uint64_t v15 = [(OTCuttlefishContext *)self accountMetadataStore];
    id v35 = 0;
    [v15 persistAccountChanges:&stru_1002F9C78 error:&v35];
    id v10 = v35;

    if (v10)
    {
      uint64_t v16 = sub_10000B070("SecError");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v17 = [v7 altDSID];
        *(_DWORD *)long long buf = 138412546;
        id v38 = v17;
        __int16 v39 = 2112;
        uint64_t v40 = v10;
        uint64_t v18 = "octagon: popdialog: Failed to persist warned-too-many-peers state for %@: %@";
        uint64_t v19 = v16;
        uint32_t v20 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      uint64_t v16 = sub_10000B070("octagon");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v17 = [v7 altDSID];
        *(_DWORD *)long long buf = 138412290;
        id v38 = v17;
        uint64_t v18 = "popdialog: Successfully persisted warned-too-many-peers state for %@";
        uint64_t v19 = v16;
        uint32_t v20 = 12;
        goto LABEL_10;
      }
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    CFStringRef v21 = [v6 peerCountsByMachineID];
    int64_t v22 = [v21 allValues];

    id v23 = [v22 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v23)
    {
      id v24 = v23;
      unint64_t v25 = 0;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v22);
          }
          v25 += (unint64_t)[*(id *)(*((void *)&v31 + 1) + 8 * i) longValue];
        }
        id v24 = [v22 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v24);
    }
    else
    {
      unint64_t v25 = 0;
    }

    uint64_t v28 = sub_10000B070("octagon");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      id v38 = v25;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "popdialog: ego peer status says peer count is: %lu", buf, 0xCu);
    }

    char v29 = [(OTCuttlefishContext *)self tooManyPeersAdapter];
    id v30 = [v29 getLimit];

    if (v25 >= (unint64_t)v30)
    {
      int v11 = [(OTCuttlefishContext *)self tooManyPeersAdapter];
      [v11 popDialogWithCount:v25 limit:v30];
      goto LABEL_27;
    }
    int v11 = sub_10000B070("octagon");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_27:

      goto LABEL_28;
    }
    *(_DWORD *)long long buf = 134218240;
    id v38 = v25;
    __int16 v39 = 2048;
    uint64_t v40 = v30;
    int v12 = "popdialog: not popping dialog, number of peers ok: %lu < %lu";
    id v13 = v11;
    uint32_t v14 = 22;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    goto LABEL_27;
  }
LABEL_29:
}

- (BOOL)waitForReady:(int64_t)a3
{
  id v4 = [(OTCuttlefishContext *)self stateMachine];
  id v5 = [v4 waitForState:@"Ready" wait:a3];

  LOBYTE(v4) = [v5 isEqualToString:@"Ready"];
  return (char)v4;
}

- (void)notifyContainerChangeWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000B070("octagonpush");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(OTCuttlefishContext *)self containerName];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received a cuttlefish push notification (%@): %@", buf, 0x16u);
  }
  id v7 = [v4 objectForKeyedSubscript:@"cf"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(OTCuttlefishContext *)self extractStringKey:@"k" fromDictionary:v7], v8 = objc_claimAutoreleasedReturnValue(), (unsigned int v9 = v8) != 0))
  {
    if ([v8 isEqualToString:@"r"])
    {
      [(OTCuttlefishContext *)self handleTTRRequest:v7];
    }
    else
    {
      uint64_t v18 = sub_10000B070("SecError");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "octagon: unknown command: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v10 = [(OTCuttlefishContext *)self apsRateLimiter];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      int v12 = [(OTCuttlefishContext *)self deviceAdapter];
      id v13 = [v12 modelID];
      unsigned __int8 v14 = +[OTDeviceInformation isFullPeer:v13];

      uint64_t v15 = 2000000000;
      uint64_t v16 = 2000000000;
      if ((v14 & 1) == 0)
      {
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        uint64_t v40 = sub_1000DAD14;
        CFStringRef v41 = sub_1000DAD24;
        id v42 = 0;
        uint64_t v31 = 0;
        long long v32 = &v31;
        uint64_t v33 = 0x3032000000;
        long long v34 = sub_1000DAD14;
        id v35 = sub_1000DAD24;
        id v36 = 0;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000E9FD0;
        v30[3] = &unk_1002F9C58;
        v30[4] = buf;
        v30[5] = &v31;
        [(OTCuttlefishContext *)self rpcFetchTotalCountOfTrustedPeers:v30];
        if (*(void *)(*(void *)&buf[8] + 40) || (uint64_t v19 = (void *)v32[5]) == 0) {
          unsigned int v17 = 300;
        }
        else {
          unsigned int v17 = 3 * [v19 unsignedIntValue];
        }
        uint32_t v20 = sub_10000B070("octagon");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CFStringRef v37 = 67109120;
          unsigned int v38 = v17;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "max splay window seconds for limiter %d", v37, 8u);
        }

        uint32_t v21 = arc4random_uniform(1000 * v17);
        _Block_object_dispose(&v31, 8);

        _Block_object_dispose(buf, 8);
        uint64_t v16 = 1000000 * v21 + 2000000000;
      }
      int64_t v22 = sub_10000B070("octagon");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "creating aps rate limiter with min initial delay of %llu", buf, 0xCu);
      }

      if (qword_10035CE18 != -1) {
        dispatch_once(&qword_10035CE18, &stru_1002F8ED0);
      }
      int v23 = byte_10035CE20;
      int v24 = byte_10035CE20;
      *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      unint64_t v25 = [CKKSNearFutureScheduler alloc];
      if (!v24) {
        uint64_t v15 = 30000000000;
      }
      if (v23) {
        uint64_t v26 = 200000000;
      }
      else {
        uint64_t v26 = v16;
      }
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000EA10C;
      v28[3] = &unk_1003077A0;
      objc_copyWeak(&v29, (id *)buf);
      CFStringRef v27 = [(CKKSNearFutureScheduler *)v25 initWithName:@"aps-push-ratelimiter" initialDelay:v26 continuingDelay:v15 keepProcessAlive:1 dependencyDescriptionCode:0 block:v28];
      [(OTCuttlefishContext *)self setApsRateLimiter:v27];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    unsigned int v9 = [(OTCuttlefishContext *)self apsRateLimiter];
    [v9 trigger];
  }
}

- (void)notifyContainerChange:(id)a3
{
  id v4 = [a3 userInfo];
  [(OTCuttlefishContext *)self notifyContainerChangeWithUserInfo:v4];
}

- (void)handleTTRRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(OTCuttlefishContext *)self extractStringKey:@"s" fromDictionary:v4];
  id v6 = [(OTCuttlefishContext *)self extractStringKey:@"D" fromDictionary:v4];
  id v7 = [(OTCuttlefishContext *)self extractStringKey:@"a" fromDictionary:v4];
  id v8 = [(OTCuttlefishContext *)self extractStringKey:@"d" fromDictionary:v4];
  unsigned int v9 = [(OTCuttlefishContext *)self extractStringKey:@"R" fromDictionary:v4];
  id v10 = [(OTCuttlefishContext *)self extractStringKey:@"n" fromDictionary:v4];
  BOOL v11 = [(OTCuttlefishContext *)self extractStringKey:@"v" fromDictionary:v4];
  uint64_t v30 = [(OTCuttlefishContext *)self extractStringKey:@"I" fromDictionary:v4];
  if (v5)
  {
    [(OTCuttlefishContext *)self deviceAdapter];
    v12 = uint64_t v28 = v11;
    [v12 serialNumber];
    id v29 = v4;
    id v13 = v10;
    unsigned __int8 v14 = v9;
    uint64_t v15 = v8;
    uint64_t v16 = v7;
    uint64_t v18 = v17 = v6;
    unsigned __int8 v19 = [v18 isEqualToString:v5];

    id v6 = v17;
    id v7 = v16;
    id v8 = v15;
    unsigned int v9 = v14;
    id v10 = v13;
    id v4 = v29;

    BOOL v11 = v28;
    if ((v19 & 1) == 0)
    {
      unint64_t v25 = sub_10000B070("octagon");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "TTR request not for me (sn)", buf, 2u);
      }

      goto LABEL_21;
    }
  }
  if (!v6) {
    goto LABEL_7;
  }
  uint32_t v20 = [(OTCuttlefishContext *)self accountStateTracker];
  uint32_t v21 = [v20 ckdeviceID];

  if (!v5 || ([v21 isEqualToString:v5] & 1) == 0)
  {
    uint64_t v26 = v11;
    CFStringRef v27 = sub_10000B070("octagon");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "TTR request not for me (deviceId)", buf, 2u);
    }

    BOOL v11 = v26;
LABEL_21:
    int v24 = (void *)v30;
    goto LABEL_25;
  }

LABEL_7:
  if (v7 && v8 && v9)
  {
    int64_t v22 = [objc_alloc((Class)SecTapToRadar) initTapToRadar:v7 description:v8 radar:v9];
    int v23 = v22;
    int v24 = (void *)v30;
    if (v10 && v11 && v30)
    {
      [v22 setComponentName:v10];
      [v23 setComponentVersion:v11];
      [v23 setComponentID:v30];
    }
    [v23 trigger];
  }
  else
  {
    int v23 = sub_10000B070("SecError");
    int v24 = (void *)v30;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon: invalid type of TTR requeat: %@", buf, 0xCu);
    }
  }

LABEL_25:
}

- (id)extractStringKey:(id)a3 fromDictionary:(id)a4
{
  id v4 = [a4 objectForKeyedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)becomeReadyOperation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EA790;
  v4[3] = &unk_1003077F0;
  objc_copyWeak(&v5, &location);
  id v2 = +[OctagonStateTransitionOperation named:@"octagon-ready" intending:@"Ready" errorState:@"Error" withBlockTakingSelf:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)becomeInheritedOperation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EB280;
  v4[3] = &unk_1003077F0;
  objc_copyWeak(&v5, &location);
  id v2 = +[OctagonStateTransitionOperation named:@"octagon-inherited" intending:@"Inherited" errorState:@"Error" withBlockTakingSelf:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)becomeUntrustedOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EBB24;
  v7[3] = &unk_1003077F0;
  objc_copyWeak(&v8, &location);
  id v5 = +[OctagonStateTransitionOperation named:@"octagon-become-untrusted" intending:v4 errorState:@"Error" withBlockTakingSelf:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (void)checkTrustStatusAndPostRepairCFUIfNecessary:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)OTOperationConfiguration);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EC280;
  v7[3] = &unk_1002F9BE8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(OTCuttlefishContext *)self rpcTrustStatus:v5 reply:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)checkForPhonePeerPresence:(id)a3
{
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned __int8 v10 = [v9 hasPrefix:@"iPhone"];
        unsigned int v11 = [v9 hasPrefix:@"iPad"];
        if ((v10 & 1) != 0 || v11)
        {
          int v12 = [v3 objectForKeyedSubscript:v9];
          int v13 = [v12 intValue];

          if (v13 >= 1)
          {
            uint64_t v15 = sub_10000B070("octagon");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 67109378;
              int v22 = v13;
              __int16 v23 = 2112;
              int v24 = v9;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Have %d peers with model %@", buf, 0x12u);
            }

            BOOL v14 = 1;
            goto LABEL_15;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (id)repairAccountIfTrustedByTPHWithIntendedState:(id)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = sub_1000DAD14;
  long long v18 = sub_1000DAD24;
  id v4 = a3;
  id v19 = v4;
  id v5 = sub_10000B070("octagon-health");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "repairAccountIfTrustedByTPHWithIntendedState: calling into TPH for trust status", buf, 2u);
  }

  id v6 = objc_alloc_init((Class)OTOperationConfiguration);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000ECCD8;
  v10[3] = &unk_1002F9BC0;
  int v12 = &v14;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [(OTCuttlefishContext *)self rpcTrustStatus:v6 reply:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

- (id)cloudKitAccountNewlyAvailableOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ED264;
  v7[3] = &unk_1003077F0;
  objc_copyWeak(&v8, &location);
  id v5 = +[OctagonStateTransitionOperation named:@"octagon-icloud-account-available" intending:v4 errorState:@"Error" withBlockTakingSelf:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)postRepairCFUAndBecomeUntrusted
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EDC10;
  v4[3] = &unk_1002F9AD8;
  void v4[4] = self;
  id v2 = +[OctagonStateTransitionOperation named:@"octagon-health-post-repair-cfu" intending:@"Untrusted" errorState:@"Error" withBlockTakingSelf:v4];

  return v2;
}

- (id)cuttlefishTrustEvaluation
{
  id v3 = [OTCheckHealthOperation alloc];
  id v4 = [(OTCuttlefishContext *)self operationDependencies];
  id v5 = [(OTCuttlefishContext *)self prepareInformation];
  LOBYTE(v12) = self->_repair;
  id v6 = [(OTCheckHealthOperation *)v3 initWithDependencies:v4 intendedState:@"BecomeReady" errorState:@"BecomeReady" deviceInfo:v5 skipRateLimitedCheck:self->_skipRateLimitingCheck reportRateLimitingError:self->_reportRateLimitingError repair:v12];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000EE00C;
  v13[3] = &unk_100306AD0;
  objc_copyWeak(&v15, &location);
  id v7 = v6;
  uint64_t v14 = v7;
  id v8 = +[CKKSResultOperation named:@"rpcHealthCheck" withBlock:v13];
  [v8 addDependency:v7];
  id v9 = [(OTCuttlefishContext *)self operationQueue];
  [v9 addOperation:v8];

  unsigned __int8 v10 = v7;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

- (id)evaluateTPHOctagonTrust
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EE934;
  v4[3] = &unk_1002F9AD8;
  void v4[4] = self;
  id v2 = +[OctagonStateTransitionOperation named:@"octagon-health-tph-trust-check" intending:@"CuttlefishTrustCheck" errorState:@"PostRepairCFU" withBlockTakingSelf:v4];

  return v2;
}

- (id)evaluateSecdOctagonTrust
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EECC0;
  v4[3] = &unk_1002F9AD8;
  void v4[4] = self;
  id v2 = +[OctagonStateTransitionOperation named:@"octagon-health-securityd-trust-check" intending:@"TPHTrustCheck" errorState:@"PostRepairCFU" withBlockTakingSelf:v4];

  return v2;
}

- (id)checkForAccountFixupsOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000EEFE0;
  v8[3] = &unk_100305698;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = +[OctagonStateTransitionOperation named:@"octagon-fixup_check" intending:v5 errorState:@"Error" withBlockTakingSelf:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)appleAccountSignOutOperation
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EF230;
  v4[3] = &unk_1002F9AD8;
  void v4[4] = self;
  id v2 = +[OctagonStateTransitionOperation named:@"octagon-account-gone" intending:@"NoAccountDoReset" errorState:@"NoAccountDoReset" withBlockTakingSelf:v4];

  return v2;
}

- (id)initializingOperation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EF5AC;
  v4[3] = &unk_1003077F0;
  objc_copyWeak(&v5, &location);
  id v2 = +[OctagonStateTransitionOperation named:@"octagon-initializing" intending:@"NoAccount" errorState:@"Error" withBlockTakingSelf:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (void)setMetricsToState:(int)a3
{
  if (a3 == 2) {
    [(OTCuttlefishContext *)self setMetricsStateToInactive];
  }
  else {
    [(OTCuttlefishContext *)self setMetricsStateToActive];
  }
}

- (void)setMetricsStateToInactive
{
  id v3 = sub_10000B070("octagon-metrics");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Metrics now switching to OFF", v8, 2u);
  }

  id v4 = [(OTCuttlefishContext *)self ckks];
  id v5 = [v4 operationDependencies];
  [v5 setSendMetric:0];

  id v6 = [(OTCuttlefishContext *)self ckks];
  id v7 = [v6 zoneChangeFetcher];
  [v7 setSendMetric:0];

  [(OTCuttlefishContext *)self setShouldSendMetricsForOctagon:2];
}

- (void)setMetricsStateToActive
{
  id v3 = sub_10000B070("octagon-metrics");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Metrics now switching to ON", v8, 2u);
  }

  id v4 = [(OTCuttlefishContext *)self ckks];
  id v5 = [v4 operationDependencies];
  [v5 setSendMetric:1];

  id v6 = [(OTCuttlefishContext *)self ckks];
  id v7 = [v6 zoneChangeFetcher];
  [v7 setSendMetric:1];

  [(OTCuttlefishContext *)self setShouldSendMetricsForOctagon:1];
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(OTCuttlefishContext *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = [(OTCuttlefishContext *)self launchSequence];
  [v12 addEvent:v8];

  if ([v9 _onqueueContains:@"apple_account_signed_out"])
  {
    [v9 _onqueueRemoveFlag:@"apple_account_signed_out"];
    int v13 = sub_10000B070("octagon");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "handling apple account signed out flag", buf, 2u);
    }

    uint64_t v14 = [(OTCuttlefishContext *)self appleAccountSignOutOperation];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"Initializing"])
  {
    uint64_t v14 = [(OTCuttlefishContext *)self initializingOperation];
LABEL_7:
    id v15 = (OTPrepareOperation *)v14;
    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"WaitForCDPCapableSecurityLevel"])
  {
    if ([v9 _onqueueContains:@"idms_level"])
    {
      [v9 _onqueueRemoveFlag:@"idms_level"];
      uint64_t v14 = +[OctagonStateTransitionOperation named:@"cdp-capable-check" entering:@"DetermineiCloudAccountState"];
      goto LABEL_7;
    }
    uint32_t v21 = sub_10000B070("octagon");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Waiting for an CDP Capable account", buf, 2u);
    }

    goto LABEL_33;
  }
  if ([v8 isEqualToString:@"WaitingForCloudKitAccount"])
  {
    long long v17 = [(OTCuttlefishContext *)self cloudKitAccountInfo];
    if (v17)
    {
      long long v18 = [(OTCuttlefishContext *)self cloudKitAccountInfo];
      id v19 = [v18 accountStatus];

      if (v19 == (id)1)
      {
        long long v20 = sub_10000B070("octagon");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CloudKit reports an account is available!", buf, 2u);
        }

        uint64_t v14 = +[OctagonStateTransitionOperation named:@"ck-available" entering:@"CloudKitNewlyAvailable"];
        goto LABEL_7;
      }
    }
    int v22 = sub_10000B070("octagon");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [(OTCuttlefishContext *)self cloudKitAccountInfo];
      int v24 = (void *)v23;
      CFStringRef v25 = @"uninitialized";
      if (v23) {
        CFStringRef v25 = (const __CFString *)v23;
      }
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Waiting for a CloudKit account; current state is %@",
        buf,
        0xCu);
    }
    uint64_t v26 = [(OTCuttlefishContext *)self cloudKitAccountInfo];
    BOOL v27 = v26 == 0;

    if (v27)
    {
      uint64_t v28 = sub_10000B070("octagon");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Asking for a real CK account state", buf, 2u);
      }

      id v29 = [(OTCuttlefishContext *)self accountStateTracker];
      [v29 recheckCKAccountStatus];
    }
    goto LABEL_33;
  }
  if ([v8 isEqualToString:@"CloudKitNewlyAvailable"])
  {
    uint64_t v14 = [(OTCuttlefishContext *)self cloudKitAccountNewlyAvailableOperation:@"DetermineCDPState"];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"DetermineCDPState"])
  {
    uint64_t v30 = [OTDetermineCDPBitStatusOperation alloc];
    uint64_t v31 = [(OTCuttlefishContext *)self operationDependencies];
    CFStringRef v32 = @"CheckForAccountFixups";
LABEL_36:
    CFStringRef v33 = @"WaitForCDP";
LABEL_37:
    long long v34 = v30;
    id v35 = v31;
LABEL_38:
    id v36 = (OTUpdateTPHOperation *)[v34 initWithDependencies:v35 intendedState:v32 errorState:v33];
LABEL_39:
    id v15 = (OTPrepareOperation *)v36;
LABEL_40:

    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"WaitForCDP"])
  {
    if ([v9 _onqueueContains:@"cdp_enabled"])
    {
      [v9 _onqueueRemoveFlag:@"cdp_enabled"];
      CFStringRef v37 = sub_10000B070("octagon");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "CDP is newly available!", buf, 2u);
      }

      uint64_t v14 = +[OctagonStateTransitionOperation named:@"cdp_enabled" entering:@"DetermineiCloudAccountState"];
      goto LABEL_7;
    }
    if ([v9 _onqueueContains:@"recd_push"])
    {
      [v9 _onqueueRemoveFlag:@"recd_push"];
      uint64_t v14 = +[OctagonStateTransitionOperation named:@"cdp_enabled_push_received" entering:@"WaitForCDPUpdated"];
      goto LABEL_7;
    }
    if ([v9 _onqueueContains:@"pending_network_availablility"])
    {
      [v9 _onqueueRemoveFlag:@"pending_network_availablility"];
      uint64_t v14 = +[OctagonStateTransitionOperation named:@"check_cdp_status_upon_network_availability" entering:@"WaitForCDPUpdated"];
      goto LABEL_7;
    }
    goto LABEL_33;
  }
  if ([v8 isEqualToString:@"WaitForCDPUpdated"])
  {
    unsigned int v38 = [OTUpdateTPHOperation alloc];
    uint64_t v31 = [(OTCuttlefishContext *)self operationDependencies];
    id v36 = [(OTUpdateTPHOperation *)v38 initWithDependencies:v31 intendedState:@"DetermineCDPState" peerUnknownState:0 determineCDPState:@"DetermineCDPState" errorState:@"DetermineCDPState" forceRefetch:0 retryFlag:@"recd_push"];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"CheckForAccountFixups"])
  {
    uint64_t v14 = [(OTCuttlefishContext *)self checkForAccountFixupsOperation:@"PerformAccountFixups"];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"PerformAccountFixups"])
  {
    uint64_t v14 = +[OctagonStateTransitionOperation named:@"fixups-complete" entering:@"CheckTrustState"];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"CheckTrustState"])
  {
    __int16 v39 = [OctagonCheckTrustStateOperation alloc];
    uint64_t v31 = [(OTCuttlefishContext *)self operationDependencies];
    CFStringRef v32 = @"BecomeUntrusted";
    long long v34 = v39;
    id v35 = v31;
    CFStringRef v33 = @"BecomeUntrusted";
    goto LABEL_38;
  }
  if ([v8 isEqualToString:@"CDPHealthCheck"])
  {
    uint64_t v30 = [OTDetermineCDPBitStatusOperation alloc];
    uint64_t v31 = [(OTCuttlefishContext *)self operationDependencies];
    CFStringRef v32 = @"SecurityTrustCheck";
    goto LABEL_36;
  }
  if ([v8 isEqualToString:@"SecurityTrustCheck"])
  {
    uint64_t v14 = [(OTCuttlefishContext *)self evaluateSecdOctagonTrust];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"TPHTrustCheck"])
  {
    uint64_t v14 = [(OTCuttlefishContext *)self evaluateTPHOctagonTrust];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"CuttlefishTrustCheck"])
  {
    uint64_t v14 = [(OTCuttlefishContext *)self cuttlefishTrustEvaluation];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"PostRepairCFU"])
  {
    uint64_t v14 = [(OTCuttlefishContext *)self postRepairCFUAndBecomeUntrusted];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"HealthCheckReset"])
  {
    self->_int64_t resetReason = 2;
    uint64_t v14 = +[OctagonStateTransitionOperation named:@"begin-reset" entering:@"ResetBecomeUntrusted"];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"BecomeUntrusted"])
  {
    uint64_t v14 = [(OTCuttlefishContext *)self becomeUntrustedOperation:@"Untrusted"];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"BecomeReady"])
  {
    uint64_t v14 = [(OTCuttlefishContext *)self becomeReadyOperation];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"RefetchCKKSPolicy"])
  {
    uint64_t v30 = [OTFetchViewsOperation alloc];
    uint64_t v31 = [(OTCuttlefishContext *)self operationDependencies];
    CFStringRef v32 = @"BecomeReady";
    CFStringRef v33 = @"Error";
    goto LABEL_37;
  }
  if ([v8 isEqualToString:@"EnableUserControllableViews"])
  {
    uint64_t v40 = [OTModifyUserControllableViewStatusOperation alloc];
    uint64_t v31 = [(OTCuttlefishContext *)self operationDependencies];
    CFStringRef v41 = v40;
    id v42 = v31;
    uint64_t v43 = 2;
LABEL_82:
    id v36 = [(OTModifyUserControllableViewStatusOperation *)v41 initWithDependencies:v42 intendedViewStatus:v43 intendedState:@"BecomeReady" peerMissingState:@"ReadyUpdated" errorState:@"BecomeReady"];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"DisableUserControllableViews"])
  {
    id v44 = [OTModifyUserControllableViewStatusOperation alloc];
    uint64_t v31 = [(OTCuttlefishContext *)self operationDependencies];
    CFStringRef v41 = v44;
    id v42 = v31;
    uint64_t v43 = 1;
    goto LABEL_82;
  }
  if ([v8 isEqualToString:@"SetUserControllableViewsToPeerConsensus"])
  {
    id v45 = [OTModifyUserControllableViewStatusOperation alloc];
    uint64_t v31 = [(OTCuttlefishContext *)self operationDependencies];
    CFStringRef v41 = v45;
    id v42 = v31;
    uint64_t v43 = 3;
    goto LABEL_82;
  }
  if ([v8 isEqualToString:@"SetAccountSettings"])
  {
    id v46 = [OTSetAccountSettingsOperation alloc];
    uint64_t v31 = [(OTCuttlefishContext *)self operationDependencies];
    id v47 = [(OTCuttlefishContext *)self accountSettings];
    id v15 = [(OTSetAccountSettingsOperation *)v46 initWithDependencies:v31 intendedState:@"BecomeReady" errorState:@"CheckTrustState" settings:v47];

    goto LABEL_40;
  }
  if ([v8 isEqualToString:@"NoAccount"]
    && [v9 _onqueueContains:@"account_available"])
  {
    [v9 _onqueueRemoveFlag:@"account_available"];
    id v48 = sub_10000B070("octagon");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Account is available!  Attempting initializing op!", buf, 2u);
    }

    uint64_t v14 = +[OctagonStateTransitionOperation named:@"account-probably-present" entering:@"Initializing"];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"Untrusted"])
  {
    if ([v9 _onqueueContains:@"preapproved"])
    {
      [v9 _onqueueRemoveFlag:@"preapproved"];
      CFStringRef v49 = [(OTCuttlefishContext *)self sosAdapter];
      unsigned int v50 = [v49 sosEnabled];

      id v51 = sub_10000B070("octagon");
      BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
      if (v50)
      {
        if (v52)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Preapproved flag is high. Attempt SOS upgrade again!", buf, 2u);
        }

        uint64_t v14 = +[OctagonStateTransitionOperation named:@"ck-available" entering:@"AttemptSOSUpgrade"];
        goto LABEL_7;
      }
      if (v52)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "We are untrusted, but it seems someone preapproves us now. Unfortunately, this platform doesn't support SOS.", buf, 2u);
      }
    }
    if ([v9 _onqueueContains:@"attempt_sos_upgrade"])
    {
      [v9 _onqueueRemoveFlag:@"attempt_sos_upgrade"];
      id v53 = [(OTCuttlefishContext *)self sosAdapter];
      unsigned int v54 = [v53 sosEnabled];

      CFStringRef v55 = sub_10000B070("octagon");
      BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
      if (v54)
      {
        if (v56)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Attempt SOS upgrade again!", buf, 2u);
        }
LABEL_103:

        uint64_t v14 = +[OctagonStateTransitionOperation named:@"attempt-sos-upgrade" entering:@"AttemptSOSUpgrade"];
        goto LABEL_7;
      }
      if (v56)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "We are untrusted, but this platform doesn't support SOS.", buf, 2u);
      }
    }
    if ([v9 _onqueueContains:@"attempt_sos_consistency"])
    {
      [v9 _onqueueRemoveFlag:@"attempt_sos_consistency"];
      id v57 = [(OTCuttlefishContext *)self sosAdapter];
      unsigned int v58 = [v57 sosEnabled];

      CFStringRef v55 = sub_10000B070("octagon");
      BOOL v59 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
      if (v58)
      {
        if (v59)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Attempting SOS upgrade again (due to a consistency notification)", buf, 2u);
        }
        goto LABEL_103;
      }
      if (v59)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Someone would like us to check SOS consistency, but this platform doesn't support SOS.", buf, 2u);
      }
    }
    if ([v9 _onqueueContains:@"recd_push"])
    {
      [v9 _onqueueRemoveFlag:@"recd_push"];
      id v60 = sub_10000B070("octagon");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Updating TPH (while untrusted) due to push", buf, 2u);
      }

      uint64_t v14 = +[OctagonStateTransitionOperation named:@"untrusted-update" entering:@"UntrustedUpdated"];
      goto LABEL_7;
    }
    if ([v9 _onqueueContains:@"idms_level"]) {
      [v9 _onqueueRemoveFlag:@"idms_level"];
    }
    if ([v9 _onqueueContains:@"cdp_enabled"])
    {
      id v61 = sub_10000B070("octagon");
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Removing 'CDP enabled' flag", buf, 2u);
      }

      [v9 _onqueueRemoveFlag:@"cdp_enabled"];
    }
    if ([v9 _onqueueContains:@"check_trust_state"])
    {
      uint64_t v62 = sub_10000B070("octagon");
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Checking trust state", buf, 2u);
      }

      [v9 _onqueueRemoveFlag:@"check_trust_state"];
      uint64_t v14 = +[OctagonStateTransitionOperation named:@"check-trust-state" entering:@"CheckTrustState"];
      goto LABEL_7;
    }
  }
  if ([v8 isEqualToString:@"UntrustedUpdated"])
  {
    v63 = [OTUpdateTPHOperation alloc];
    uint64_t v64 = [(OTCuttlefishContext *)self operationDependencies];
    id v15 = [(OTUpdateTPHOperation *)v63 initWithDependencies:v64 intendedState:@"Untrusted" peerUnknownState:@"PeerMissingFromServer" determineCDPState:0 errorState:@"Untrusted" forceRefetch:0 retryFlag:@"recd_push"];

    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"DetermineiCloudAccountState"])
  {
    v65 = sub_10000B070("octagon");
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Determine iCloud account status", buf, 2u);
    }

    v66 = [OTDetermineCDPCapableAccountStatusOperation alloc];
    id v67 = [(OTCuttlefishContext *)self operationDependencies];
    id v15 = [(OTDetermineCDPCapableAccountStatusOperation *)v66 initWithDependencies:v67 stateIfCDPCapable:@"Initializing" stateIfNotCDPCapable:@"WaitForCDPCapableSecurityLevel" stateIfNoAccount:@"NoAccount" errorState:@"Error"];

    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"CuttlefishReset"])
  {
    v68 = sub_10000B070("octagon");
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Resetting cuttlefish", buf, 2u);
    }

    v236 = [OTResetOperation alloc];
    v238 = [(OTCuttlefishContext *)self containerName];
    v69 = [(OTCuttlefishContext *)self contextID];
    int64_t resetReason = self->_resetReason;
    BOOL isGuitarfish = self->_isGuitarfish;
    int64_t accountType = self->_accountType;
    id v73 = [(OTCuttlefishContext *)self operationDependencies];
    v74 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
    LOBYTE(v232) = isGuitarfish;
    id v15 = [(OTResetOperation *)v236 init:v238 contextID:v69 reason:resetReason idmsTargetContext:0 idmsCuttlefishPassword:0 notifyIdMS:0 isGuitarfish:v232 accountType:accountType intendedState:@"CKKSResetAfterOctagonReset" dependencies:v73 errorState:@"Error" cuttlefishXPCWrapper:v74];

    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"CKKSResetAfterOctagonReset"])
  {
    v75 = [OTLocalCKKSResetOperation alloc];
    v76 = [(OTCuttlefishContext *)self operationDependencies];
    id v15 = [(OTLocalCKKSResetOperation *)v75 initWithDependencies:v76 intendedState:@"LocalReset" errorState:@"BecomeUntrusted"];

    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"LocalReset"])
  {
    v77 = sub_10000B070("octagon");
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Attempting local-reset", buf, 2u);
    }

    v78 = [OTLocalResetOperation alloc];
    v79 = [(OTCuttlefishContext *)self operationDependencies];
    id v15 = [(OTLocalResetOperation *)v78 initWithDependencies:v79 intendedState:@"LocalResetClearLocalContextState" errorState:@"Initializing"];

    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"LocalResetClearLocalContextState"])
  {
    [(OTCuttlefishContext *)self clearContextState];
    uint64_t v14 = +[OctagonStateTransitionOperation named:@"move-to-initializing" entering:@"Initializing"];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"NoAccountDoReset"])
  {
    v80 = sub_10000B070("octagon");
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Attempting local-reset as part of signout", buf, 2u);
    }

    [(OTCuttlefishContext *)self clearContextState];
    v81 = [OTLocalResetOperation alloc];
    v82 = [(OTCuttlefishContext *)self operationDependencies];
    id v15 = [(OTLocalResetOperation *)v81 initWithDependencies:v82 intendedState:@"NoAccount" errorState:@"NoAccount"];

    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"PeerMissingFromServer"])
  {
    [(OTCuttlefishContext *)self clearContextState];
    v83 = [OTLocalResetOperation alloc];
    v84 = [(OTCuttlefishContext *)self operationDependencies];
    id v15 = [(OTLocalResetOperation *)v83 initWithDependencies:v84 intendedState:@"BecomeUntrusted" errorState:@"BecomeUntrusted"];

    goto LABEL_8;
  }
  if (![v8 isEqualToString:@"EnsureConsistency"])
  {
    if ([v8 isEqualToString:@"BottlePreloadOctagonKeysInSOS"])
    {
      v90 = sub_10000B070("octagon");
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Preloading Octagon Keys on the SOS Account", buf, 2u);
      }

      v91 = [(OTCuttlefishContext *)self sosAdapter];
      unsigned int v92 = [v91 sosEnabled];

      if (!v92)
      {
        uint64_t v14 = +[OctagonStateTransitionOperation named:@"no-preload-octagon-key" entering:@"SetAccountSettings"];
        goto LABEL_7;
      }
      v93 = [(OTCuttlefishContext *)self custodianRecoveryKey];
      if (v93)
      {
        v94 = @"JoinSOSAfterCKKSFetch";
        v95 = @"JoinSOSAfterCKKSFetch";
      }
      else
      {
        v106 = [(OTCuttlefishContext *)self recoveryKey];
        v107 = @"JoinSOSAfterCKKSFetch";
        if (!v106) {
          v107 = @"SetAccountSettings";
        }
        v94 = v107;
      }
      v108 = [OTPreloadOctagonKeysOperation alloc];
      v109 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTPreloadOctagonKeysOperation *)v108 initWithDependencies:v109 intendedState:v94 errorState:v94];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"EnsureUpdatePreapprovals"])
    {
      v96 = sub_10000B070("octagon");
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "SOS is enabled; ensuring preapprovals are correct",
          buf,
          2u);
      }

      v97 = [OTSOSUpdatePreapprovalsOperation alloc];
      v98 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTSOSUpdatePreapprovalsOperation *)v97 initWithDependencies:v98 intendedState:@"BecomeReady" sosNotPresentState:@"BecomeReady" errorState:@"BecomeReady"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"AttemptSOSUpgradeDetermineCDPState"])
    {
      v99 = [OTDetermineCDPBitStatusOperation alloc];
      v100 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTDetermineCDPBitStatusOperation *)v99 initWithDependencies:v100 intendedState:@"AttemptSOSUpgrade" errorState:@"WaitForCDP"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"AttemptSOSUpgrade"])
    {
      v101 = sub_10000B070("octagon");
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Investigating SOS status", buf, 2u);
      }

      v102 = [OTSOSUpgradeOperation alloc];
      v103 = [(OTCuttlefishContext *)self operationDependencies];
      v104 = [(OTCuttlefishContext *)self prepareInformation];
      v105 = [(OTCuttlefishContext *)self policyOverride];
      id v15 = [(OTSOSUpgradeOperation *)v102 initWithDependencies:v103 intendedState:@"BecomeReady" ckksConflictState:@"SOSUpgradeCKKSReset" errorState:@"BecomeUntrusted" deviceInfo:v104 policyOverride:v105];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"SOSUpgradeCKKSReset"])
    {
      v110 = [OTLocalCKKSResetOperation alloc];
      v111 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTLocalCKKSResetOperation *)v110 initWithDependencies:v111 intendedState:@"SOSUpgradeAfterCKKSReset" errorState:@"BecomeUntrusted"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"SOSUpgradeAfterCKKSReset"])
    {
      v112 = [OTSOSUpgradeOperation alloc];
      v113 = [(OTCuttlefishContext *)self operationDependencies];
      v114 = [(OTCuttlefishContext *)self prepareInformation];
      v115 = [(OTCuttlefishContext *)self policyOverride];
      id v15 = [(OTSOSUpgradeOperation *)v112 initWithDependencies:v113 intendedState:@"BecomeReady" ckksConflictState:@"BecomeUntrusted" errorState:@"BecomeUntrusted" deviceInfo:v114 policyOverride:v115];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"OctagonStateStashAccountSettingsForRecoveryKey"])
    {
      v116 = [OTStashAccountSettingsOperation alloc];
      v117 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTStashAccountSettingsOperation *)v116 initWithDependencies:v117 intendedState:@"CreateIdentityForRecoveryKey" errorState:@"CreateIdentityForRecoveryKey" accountSettings:self accountWide:1 forceFetch:1];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"CreateIdentityForRecoveryKey"])
    {
      v118 = [OTPrepareOperation alloc];
      v119 = [(OTCuttlefishContext *)self operationDependencies];
      v120 = [(OTCuttlefishContext *)self prepareInformation];
      v121 = [(OTCuttlefishContext *)self policyOverride];
      v122 = [(OTCuttlefishContext *)self accountSettings];
      id v15 = [(OTPrepareOperation *)v118 initWithDependencies:v119 intendedState:@"VouchWithRecoveryKey" errorState:@"BecomeUntrusted" deviceInfo:v120 policyOverride:v121 accountSettings:v122 epoch:1];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"CreateIdentityForCustodianRecoveryKey"])
    {
      v123 = [OTPrepareOperation alloc];
      v124 = [(OTCuttlefishContext *)self operationDependencies];
      v125 = [(OTCuttlefishContext *)self prepareInformation];
      v126 = [(OTCuttlefishContext *)self policyOverride];
      v127 = [(OTCuttlefishContext *)self accountSettings];
      id v15 = [(OTPrepareOperation *)v123 initWithDependencies:v124 intendedState:@"VouchWithCustodianRecoveryKey" errorState:@"BecomeUntrusted" deviceInfo:v125 policyOverride:v126 accountSettings:v127 epoch:1];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"BottleJoinCreateIdentity"])
    {
      v128 = [OTPrepareOperation alloc];
      v129 = [(OTCuttlefishContext *)self operationDependencies];
      v130 = [(OTCuttlefishContext *)self prepareInformation];
      v131 = [(OTCuttlefishContext *)self policyOverride];
      v132 = [(OTCuttlefishContext *)self accountSettings];
      id v15 = [(OTPrepareOperation *)v128 initWithDependencies:v129 intendedState:@"BottleJoinVouchWithBottle" errorState:@"BecomeUntrusted" deviceInfo:v130 policyOverride:v131 accountSettings:v132 epoch:1];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"BottleJoinVouchWithBottle"])
    {
      v133 = [OTVouchWithBottleOperation alloc];
      v134 = [(OTCuttlefishContext *)self operationDependencies];
      LOBYTE(v232) = 1;
      id v15 = [(OTVouchWithBottleOperation *)v133 initWithDependencies:v134 intendedState:@"InitiatorSetCDPBit" errorState:@"BecomeUntrusted" bottleID:self->_bottleID entropy:self->_entropy bottleSalt:self->_bottleSalt saveVoucher:v232];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"VouchWithRecoveryKey"])
    {
      v135 = [OTVouchWithRecoveryKeyOperation alloc];
      v136 = [(OTCuttlefishContext *)self operationDependencies];
      v137 = [(OTCuttlefishContext *)self recoveryKey];
      id v15 = [(OTVouchWithRecoveryKeyOperation *)v135 initWithDependencies:v136 intendedState:@"InitiatorSetCDPBit" errorState:@"BecomeUntrusted" recoveryKey:v137 saveVoucher:1];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"VouchWithCustodianRecoveryKey"])
    {
      v138 = [OTVouchWithCustodianRecoveryKeyOperation alloc];
      v139 = [(OTCuttlefishContext *)self operationDependencies];
      v140 = [(OTCuttlefishContext *)self custodianRecoveryKey];
      id v15 = [(OTVouchWithCustodianRecoveryKeyOperation *)v138 initWithDependencies:v139 intendedState:@"InitiatorSetCDPBit" errorState:@"BecomeUntrusted" custodianRecoveryKey:v140 saveVoucher:1];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"PrepareAndRecoverTLKSharesForInheritancePeer"])
    {
      v141 = [OTPrepareAndRecoverTLKSharesForInheritancePeerOperation alloc];
      v142 = [(OTCuttlefishContext *)self operationDependencies];
      v143 = [(OTCuttlefishContext *)self inheritanceKey];
      v144 = [(OTCuttlefishContext *)self prepareInformation];
      v145 = [(OTCuttlefishContext *)self policyOverride];
      LOBYTE(v232) = 1;
      id v15 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)v141 initWithDependencies:v142 intendedState:@"BecomeInherited" errorState:@"Error" ik:v143 deviceInfo:v144 policyOverride:v145 isInheritedAccount:v232 epoch:1];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"JoinSOSAfterCKKSFetch"])
    {
      v146 = [OTJoinSOSAfterCKKSFetchOperation alloc];
      v147 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTJoinSOSAfterCKKSFetchOperation *)v146 initWithDependencies:v147 intendedState:@"SetAccountSettings" errorState:@"SetAccountSettings"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"InitiatorSetCDPBit"])
    {
      v148 = [OTSetCDPBitOperation alloc];
      v149 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTSetCDPBitOperation *)v148 initWithDependencies:v149 intendedState:@"InitiatorUpdateDeviceList" errorState:@"DetermineCDPState"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"InitiatorUpdateDeviceList"])
    {
      v150 = [OTUpdateTrustedDeviceListOperation alloc];
      v151 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTUpdateTrustedDeviceListOperation *)v150 initWithDependencies:v151 intendedState:@"InitiatorJoin" listUpdatesState:@"InitiatorJoin" errorState:@"BecomeUntrusted" retryFlag:0];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"InitiatorJoin"])
    {
      v152 = [OTJoinWithVoucherOperation alloc];
      v153 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTJoinWithVoucherOperation *)v152 initWithDependencies:v153 intendedState:@"BottlePreloadOctagonKeysInSOS" ckksConflictState:@"InitiatorJoinCKKSReset" errorState:@"BecomeUntrusted"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"InitiatorJoinCKKSReset"])
    {
      v154 = [OTLocalCKKSResetOperation alloc];
      v155 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTLocalCKKSResetOperation *)v154 initWithDependencies:v155 intendedState:@"InitiatorJoinAfterCKKSReset" errorState:@"BecomeUntrusted"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"InitiatorJoinAfterCKKSReset"])
    {
      v156 = [OTJoinWithVoucherOperation alloc];
      v157 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTJoinWithVoucherOperation *)v156 initWithDependencies:v157 intendedState:@"BottlePreloadOctagonKeysInSOS" ckksConflictState:@"BecomeUntrusted" errorState:@"BecomeUntrusted"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"ResetBecomeUntrusted"])
    {
      uint64_t v14 = [(OTCuttlefishContext *)self becomeUntrustedOperation:@"ResetAnyMissingTLKCKKSViews"];
      goto LABEL_7;
    }
    if ([v8 isEqualToString:@"ResetAndEstablish"])
    {
      v237 = [OTResetOperation alloc];
      v239 = [(OTCuttlefishContext *)self containerName];
      v158 = [(OTCuttlefishContext *)self contextID];
      idmsTargetContext = self->_idmsTargetContext;
      int64_t v235 = self->_resetReason;
      idmsCuttlefishPassword = self->_idmsCuttlefishPassword;
      BOOL notifyIdMS = self->_notifyIdMS;
      BOOL v160 = self->_isGuitarfish;
      int64_t v161 = self->_accountType;
      v162 = [(OTCuttlefishContext *)self operationDependencies];
      v163 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
      LOBYTE(v232) = v160;
      id v15 = [(OTResetOperation *)v237 init:v239 contextID:v158 reason:v235 idmsTargetContext:idmsTargetContext idmsCuttlefishPassword:idmsCuttlefishPassword notifyIdMS:notifyIdMS isGuitarfish:v232 accountType:v161 intendedState:@"EstablishEnableCDPBit" dependencies:v162 errorState:@"Error" cuttlefishXPCWrapper:v163];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"ResetAnyMissingTLKCKKSViews"])
    {
      v164 = [OTResetCKKSZonesLackingTLKsOperation alloc];
      v165 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTResetCKKSZonesLackingTLKsOperation *)v164 initWithDependencies:v165 intendedState:@"ResetAndEstablish" errorState:@"Error"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"EstablishEnableCDPBit"])
    {
      v166 = [OTSetCDPBitOperation alloc];
      v167 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTSetCDPBitOperation *)v166 initWithDependencies:v167 intendedState:@"ReEnactDeviceList" errorState:@"Error"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"ReEnactDeviceList"])
    {
      v168 = [OTUpdateTrustedDeviceListOperation alloc];
      v169 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTUpdateTrustedDeviceListOperation *)v168 initWithDependencies:v169 intendedState:@"ReEnactPrepare" listUpdatesState:@"ReEnactPrepare" errorState:@"BecomeUntrusted" retryFlag:0];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"ReEnactPrepare"])
    {
      v170 = [OTPrepareOperation alloc];
      v171 = [(OTCuttlefishContext *)self operationDependencies];
      v172 = [(OTCuttlefishContext *)self prepareInformation];
      v173 = [(OTCuttlefishContext *)self policyOverride];
      v174 = [(OTCuttlefishContext *)self accountSettings];
      id v15 = [(OTPrepareOperation *)v170 initWithDependencies:v171 intendedState:@"ResetAndEstablishClearLocalContextState" errorState:@"Error" deviceInfo:v172 policyOverride:v173 accountSettings:v174 epoch:0];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"ResetAndEstablishClearLocalContextState"])
    {
      v175 = sub_10000B070("octagon");
      if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v175, OS_LOG_TYPE_DEFAULT, "clear cuttlefish context state", buf, 2u);
      }

      [(OTCuttlefishContext *)self clearContextState];
      uint64_t v14 = +[OctagonStateTransitionOperation named:@"moving-to-re-enact-ready-to-establish" entering:@"ReEnactReadyToEstablish"];
      goto LABEL_7;
    }
    if ([v8 isEqualToString:@"ReEnactReadyToEstablish"])
    {
      v176 = [OTEstablishOperation alloc];
      v177 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTEstablishOperation *)v176 initWithDependencies:v177 intendedState:@"EscrowTriggerUpdate" ckksConflictState:@"EstablishCKKSReset" errorState:@"BecomeUntrusted"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"EstablishCKKSReset"])
    {
      v178 = [OTLocalCKKSResetOperation alloc];
      v179 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTLocalCKKSResetOperation *)v178 initWithDependencies:v179 intendedState:@"EstablishAfterCKKSReset" errorState:@"BecomeUntrusted"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"EstablishAfterCKKSReset"])
    {
      v180 = [OTEstablishOperation alloc];
      v181 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTEstablishOperation *)v180 initWithDependencies:v181 intendedState:@"EscrowTriggerUpdate" ckksConflictState:@"BecomeUntrusted" errorState:@"BecomeUntrusted"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"EscrowTriggerUpdate"])
    {
      v182 = [OTTriggerEscrowUpdateOperation alloc];
      v183 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTTriggerEscrowUpdateOperation *)v182 initWithDependencies:v183 intendedState:@"BecomeReady" errorState:@"Error"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"HealthCheckLeaveClique"])
    {
      v184 = [OTLeaveCliqueOperation alloc];
      v185 = [(OTCuttlefishContext *)self operationDependencies];
      id v15 = [(OTLeaveCliqueOperation *)v184 initWithDependencies:v185 intendedState:@"BecomeUntrusted" errorState:@"BecomeUntrusted"];

      goto LABEL_8;
    }
    if ([v8 isEqualToString:@"WaitForClassCUnlock"])
    {
      if ([v9 _onqueueContains:@"unlocked"])
      {
        [v9 _onqueueRemoveFlag:@"unlocked"];
        v186 = +[NSString stringWithFormat:@"%@", @"initializing-after-initial-unlock"];
        id v15 = +[OctagonStateTransitionOperation named:v186 entering:@"Initializing"];

        goto LABEL_8;
      }
    }
    else
    {
      if (![v8 isEqualToString:@"WaitForUnlock"])
      {
        if ([v8 isEqualToString:@"UpdateSOSPreapprovals"])
        {
          v189 = sub_10000B070("octagon");
          if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_DEFAULT, "Updating SOS preapprovals", buf, 2u);
          }

          v190 = [OTSOSUpdatePreapprovalsOperation alloc];
          v191 = [(OTCuttlefishContext *)self operationDependencies];
          id v15 = [(OTSOSUpdatePreapprovalsOperation *)v190 initWithDependencies:v191 intendedState:@"Ready" sosNotPresentState:@"Ready" errorState:@"Ready"];

          goto LABEL_8;
        }
        if ([v8 isEqualToString:@"AssistCKKSTLKUpload"])
        {
          v192 = [OTUploadNewCKKSTLKsOperation alloc];
          v193 = [(OTCuttlefishContext *)self operationDependencies];
          id v15 = [(OTUploadNewCKKSTLKsOperation *)v192 initWithDependencies:v193 intendedState:@"Ready" ckksConflictState:@"AssistCKKSTLKUploadCKKSReset" peerMissingState:@"ReadyUpdated" errorState:@"Ready"];

          goto LABEL_8;
        }
        if ([v8 isEqualToString:@"AssistCKKSTLKUploadCKKSReset"])
        {
          v194 = [OTLocalCKKSResetOperation alloc];
          v195 = [(OTCuttlefishContext *)self operationDependencies];
          id v15 = [(OTLocalCKKSResetOperation *)v194 initWithDependencies:v195 intendedState:@"AssistCKKSTLKUploadAfterCKKSReset" errorState:@"BecomeReady"];

          goto LABEL_8;
        }
        if ([v8 isEqualToString:@"AssistCKKSTLKUploadAfterCKKSReset"])
        {
          v196 = [OTUploadNewCKKSTLKsOperation alloc];
          v197 = [(OTCuttlefishContext *)self operationDependencies];
          id v15 = [(OTUploadNewCKKSTLKsOperation *)v196 initWithDependencies:v197 intendedState:@"Ready" ckksConflictState:@"Ready" peerMissingState:@"ReadyUpdated" errorState:@"Ready"];

          goto LABEL_8;
        }
        if ([v8 isEqualToString:@"OctagonStateStashAccountSettingsForReroll"])
        {
          v198 = [OTStashAccountSettingsOperation alloc];
          v199 = [(OTCuttlefishContext *)self operationDependencies];
          id v15 = [(OTStashAccountSettingsOperation *)v198 initWithDependencies:v199 intendedState:@"OctagonStateCreateIdentityForReroll" errorState:@"OctagonStateCreateIdentityForReroll" accountSettings:self accountWide:1 forceFetch:1];

          goto LABEL_8;
        }
        if ([v8 isEqualToString:@"OctagonStateCreateIdentityForReroll"])
        {
          v200 = [OTPrepareOperation alloc];
          v201 = [(OTCuttlefishContext *)self operationDependencies];
          v202 = [(OTCuttlefishContext *)self prepareInformation];
          v203 = [(OTCuttlefishContext *)self policyOverride];
          v204 = [(OTCuttlefishContext *)self accountSettings];
          id v15 = [(OTPrepareOperation *)v200 initWithDependencies:v201 intendedState:@"OctagonStateVouchWithReroll" errorState:@"BecomeUntrusted" deviceInfo:v202 policyOverride:v203 accountSettings:v204 epoch:1];

          goto LABEL_8;
        }
        if ([v8 isEqualToString:@"OctagonStateVouchWithReroll"])
        {
          v205 = [OTVouchWithRerollOperation alloc];
          v206 = [(OTCuttlefishContext *)self operationDependencies];
          id v15 = [(OTVouchWithRerollOperation *)v205 initWithDependencies:v206 intendedState:@"InitiatorSetCDPBit" errorState:@"BecomeUntrusted" saveVoucher:1];

          goto LABEL_8;
        }
        if ([v8 isEqualToString:@"BecomeInherited"])
        {
          uint64_t v14 = [(OTCuttlefishContext *)self becomeInheritedOperation];
          goto LABEL_7;
        }
        if (![v8 isEqualToString:@"Inherited"])
        {
          if (![v8 isEqualToString:@"Ready"])
          {
            if ([v8 isEqualToString:@"ReadyUpdated"])
            {
              v213 = [OTUpdateTPHOperation alloc];
              v214 = [(OTCuttlefishContext *)self operationDependencies];
              id v15 = [(OTUpdateTPHOperation *)v213 initWithDependencies:v214 intendedState:@"Ready" peerUnknownState:@"PeerMissingFromServer" determineCDPState:0 errorState:@"Ready" forceRefetch:0 retryFlag:@"recd_push"];

              goto LABEL_8;
            }
            [v8 isEqualToString:@"Error"];
LABEL_33:
            id v15 = 0;
            goto LABEL_8;
          }
          if ([v9 _onqueueContains:@"recd_push"])
          {
            [v9 _onqueueRemoveFlag:@"recd_push"];
            v212 = sub_10000B070("octagon");
            if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v212, OS_LOG_TYPE_DEFAULT, "Updating TPH (while ready) due to push", buf, 2u);
            }

            uint64_t v14 = +[OctagonStateTransitionOperation named:@"octagon-update" entering:@"ReadyUpdated"];
            goto LABEL_7;
          }
          if ([v9 _onqueueContains:@"tlk_upload_needed"])
          {
            [v9 _onqueueRemoveFlag:@"tlk_upload_needed"];
            uint64_t v14 = +[OctagonStateTransitionOperation named:@"ckks-assist" entering:@"AssistCKKSTLKUpload"];
            goto LABEL_7;
          }
          if ([v9 _onqueueContains:@"attempt_machine_id_list"])
          {
            [v9 _onqueueRemoveFlag:@"attempt_machine_id_list"];
            v215 = sub_10000B070("octagon");
            if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v215, OS_LOG_TYPE_DEFAULT, "Received an suggestion to update the machine ID list (while ready); updating trusted device list",
                buf,
                2u);
            }

            v216 = [OTUpdateTrustedDeviceListOperation alloc];
            v217 = [(OTCuttlefishContext *)self operationDependencies];
            id v15 = [(OTUpdateTrustedDeviceListOperation *)v216 initWithDependencies:v217 intendedState:@"Ready" listUpdatesState:@"ReadyUpdated" errorState:@"Ready" retryFlag:@"attempt_machine_id_list"];

            goto LABEL_8;
          }
          if ([v9 _onqueueContains:@"attempt_sos_update_preapprovals"])
          {
            [v9 _onqueueRemoveFlag:@"attempt_sos_update_preapprovals"];
            v218 = [(OTCuttlefishContext *)self sosAdapter];
            unsigned int v219 = [v218 sosEnabled];

            v220 = sub_10000B070("octagon");
            BOOL v221 = os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT);
            if (v219)
            {
              if (v221)
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_DEFAULT, "Attempt SOS Update preapprovals again!", buf, 2u);
              }

              uint64_t v14 = +[OctagonStateTransitionOperation named:@"attempt-sos-update-preapproval" entering:@"UpdateSOSPreapprovals"];
              goto LABEL_7;
            }
            if (v221)
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_DEFAULT, "We are untrusted, but this platform doesn't support SOS.", buf, 2u);
            }
          }
          if ([v9 _onqueueContains:@"attempt_sos_consistency"])
          {
            [v9 _onqueueRemoveFlag:@"attempt_sos_consistency"];
            v222 = [(OTCuttlefishContext *)self sosAdapter];
            unsigned int v223 = [v222 sosEnabled];

            v224 = sub_10000B070("octagon");
            BOOL v225 = os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT);
            if (v223)
            {
              if (v225)
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_DEFAULT, "Attempting SOS consistency checks", buf, 2u);
              }

              uint64_t v14 = +[OctagonStateTransitionOperation named:@"attempt-sos-update-preapproval" entering:@"EnsureConsistency"];
              goto LABEL_7;
            }
            if (v225)
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_DEFAULT, "Someone would like us to check SOS consistency, but this platform doesn't support SOS.", buf, 2u);
            }
          }
          if ([v9 _onqueueContains:@"attempt_ucv_upgrade"])
          {
            [v9 _onqueueRemoveFlag:@"attempt_ucv_upgrade"];
            v226 = sub_10000B070("octagon");
            if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v226, OS_LOG_TYPE_DEFAULT, "Attempting user-view control upgrade", buf, 2u);
            }

            uint64_t v14 = +[OctagonStateTransitionOperation named:@"attempt-user-view-upgrade" entering:@"SetUserControllableViewsToPeerConsensus"];
            goto LABEL_7;
          }
          if ([v9 _onqueueContains:@"policy_check_needed"])
          {
            [v9 _onqueueRemoveFlag:@"policy_check_needed"];
            v227 = sub_10000B070("octagon");
            if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_DEFAULT, "Updating CKKS policy", buf, 2u);
            }

            uint64_t v14 = +[OctagonStateTransitionOperation named:@"ckks-policy-update" entering:@"ReadyUpdated"];
            goto LABEL_7;
          }
          if ([v9 _onqueueContains:@"ckks_views_changed"])
          {
            [v9 _onqueueRemoveFlag:@"ckks_views_changed"];
            uint64_t v14 = +[OctagonStateTransitionOperation named:@"ckks-update-trust" entering:@"BecomeReady"];
            goto LABEL_7;
          }
          if ([v9 _onqueueContains:@"se_id_changed"])
          {
            [v9 _onqueueRemoveFlag:@"se_id_changed"];
            uint64_t v14 = +[OctagonStateTransitionOperation named:@"octagon-set-secureelement" entering:@"ReadyUpdated"];
            goto LABEL_7;
          }
          if ([v9 _onqueueContains:@"account_available"])
          {
            v228 = sub_10000B070("octagon");
            if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_DEFAULT, "Removing 'account is available' flag", buf, 2u);
            }

            [v9 _onqueueRemoveFlag:@"account_available"];
          }
          if ([v9 _onqueueContains:@"idms_level"])
          {
            v229 = sub_10000B070("octagon");
            if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v229, OS_LOG_TYPE_DEFAULT, "Removing 'IDMS level changed' flag", buf, 2u);
            }

            [v9 _onqueueRemoveFlag:@"idms_level"];
          }
          if ([v9 _onqueueContains:@"cdp_enabled"])
          {
            v230 = sub_10000B070("octagon");
            if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v230, OS_LOG_TYPE_DEFAULT, "Removing 'CDP enabled' flag", buf, 2u);
            }

            [v9 _onqueueRemoveFlag:@"cdp_enabled"];
          }
          if ([v9 _onqueueContains:@"check_on_rtc_metrics"])
          {
            v231 = sub_10000B070("octagon-metrics");
            if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_DEFAULT, "Checking metrics", buf, 2u);
            }

            [v9 _onqueueRemoveFlag:@"check_on_rtc_metrics"];
            *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
            objc_initWeak((id *)buf, self);
            v240[0] = _NSConcreteStackBlock;
            v240[1] = 3221225472;
            v240[2] = sub_1000F33E8;
            v240[3] = &unk_1003077F0;
            objc_copyWeak(&v241, (id *)buf);
            id v15 = +[OctagonStateTransitionOperation named:@"check-on-metrics" intending:@"Ready" errorState:@"Ready" withBlockTakingSelf:v240];
            objc_destroyWeak(&v241);
            objc_destroyWeak((id *)buf);
            goto LABEL_8;
          }
        }
        v207 = +[CKKSAnalytics logger];
        v208 = +[NSDate date];
        [v207 setDateProperty:v208 forKey:@"OALastKSR"];

        v209 = [(OTCuttlefishContext *)self launchSequence];
        [v209 launch];

        v210 = +[CKKSAnalytics logger];
        v211 = [(OTCuttlefishContext *)self launchSequence];
        [v210 noteLaunchSequence:v211];

        goto LABEL_33;
      }
      if ([v9 _onqueueContains:@"unlocked"])
      {
        [v9 _onqueueRemoveFlag:@"unlocked"];
        v187 = +[NSString stringWithFormat:@"%@", @"initializing-after-unlock"];
        id v15 = +[OctagonStateTransitionOperation named:v187 entering:@"Initializing"];

        goto LABEL_8;
      }
    }
    v188 = [[OctagonPendingFlag alloc] initWithFlag:@"unlocked" conditions:1];
    [v10 _onqueueHandlePendingFlagLater:v188];

    goto LABEL_33;
  }
  v85 = sub_10000B070("octagon");
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Ensuring consistency of things that might've changed", buf, 2u);
  }

  v86 = [(OTCuttlefishContext *)self sosAdapter];
  unsigned int v87 = [v86 sosEnabled];

  if (!v87)
  {
    uint64_t v14 = +[OctagonStateTransitionOperation named:@"no-consistency-checks" entering:@"BecomeReady"];
    goto LABEL_7;
  }
  v88 = [OTEnsureOctagonKeyConsistency alloc];
  v89 = [(OTCuttlefishContext *)self operationDependencies];
  id v15 = [(OTEnsureOctagonKeyConsistency *)v88 initWithDependencies:v89 intendedState:@"EnsureUpdatePreapprovals" errorState:@"BecomeReady"];

LABEL_8:

  return v15;
}

- (void)clearPairingUUID
{
}

- (void)handlePairingRestart:(id)a3
{
  id v4 = a3;
  id v5 = [(OTCuttlefishContext *)self pairingUUID];

  if (!v5)
  {
    id v6 = sub_10000B070("octagon-pairing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 pairingUUID];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received new pairing UUID (%@)", buf, 0xCu);
    }
    id v8 = [v4 pairingUUID];
    [(OTCuttlefishContext *)self setPairingUUID:v8];
  }
  id v9 = [(OTCuttlefishContext *)self pairingUUID];
  id v10 = [v4 pairingUUID];
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = sub_10000B070("octagon-pairing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(OTCuttlefishContext *)self pairingUUID];
      uint64_t v14 = [v4 pairingUUID];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      CFStringRef v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "current pairing UUID (%@) does not match config UUID (%@)", buf, 0x16u);
    }
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000F392C;
    v19[3] = &unk_1002F9A68;
    void v19[4] = self;
    id v20 = v4;
    uint64_t v16 = v15;
    uint32_t v21 = v16;
    [(OTCuttlefishContext *)self localReset:v19];
    dispatch_time_t v17 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      long long v18 = sub_10000B070("SecError");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "octagon: Timed out waiting for local reset to complete", buf, 2u);
      }
    }
  }
}

- (void)startOctagonStateMachine
{
  id v2 = [(OTCuttlefishContext *)self stateMachine];
  [v2 startOperation];
}

- (id)operationDependencies
{
  id v3 = [(OTCuttlefishContext *)self sessionMetrics];
  int v22 = [OTOperationDependencies alloc];
  BOOL v27 = [(OTCuttlefishContext *)self containerName];
  uint64_t v26 = [(OTCuttlefishContext *)self contextID];
  CFStringRef v25 = [(OTCuttlefishContext *)self activeAccount];
  id v20 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v19 = [(OTCuttlefishContext *)self stateMachine];
  long long v18 = [(OTCuttlefishContext *)self sosAdapter];
  __int16 v24 = [(OTCuttlefishContext *)self octagonAdapter];
  uint64_t v14 = [(OTCuttlefishContext *)self accountsAdapter];
  int v13 = [(OTCuttlefishContext *)self authKitAdapter];
  dispatch_time_t v17 = [(OTCuttlefishContext *)self personaAdapter];
  uint64_t v12 = [(OTCuttlefishContext *)self deviceAdapter];
  uint64_t v16 = [(OTCuttlefishContext *)self ckks];
  dispatch_semaphore_t v15 = [(OTCuttlefishContext *)self lockStateTracker];
  id v4 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
  id v5 = [(OTCuttlefishContext *)self escrowRequestClass];
  id v6 = [(OTCuttlefishContext *)self notifierClass];
  uint32_t v21 = v3;
  id v7 = [v3 flowID];
  id v8 = [v3 deviceSessionID];
  LOBYTE(v3) = [(OTCuttlefishContext *)self canSendMetricsUsingAccountState:[(OTCuttlefishContext *)self shouldSendMetricsForOctagon]];
  id v9 = [(OTCuttlefishContext *)self reachabilityTracker];
  LOBYTE(v11) = (_BYTE)v3;
  id v23 = -[OTOperationDependencies initForContainer:contextID:activeAccount:stateHolder:flagHandler:sosAdapter:octagonAdapter:accountsAdapter:authKitAdapter:personaAdapter:deviceInfoAdapter:ckksAccountSync:lockStateTracker:cuttlefishXPCWrapper:escrowRequestClass:notifierClass:flowID:deviceSessionID:permittedToSendMetrics:reachabilityTracker:](v22, "initForContainer:contextID:activeAccount:stateHolder:flagHandler:sosAdapter:octagonAdapter:accountsAdapter:authKitAdapter:personaAdapter:deviceInfoAdapter:ckksAccountSync:lockStateTracker:cuttlefishXPCWrapper:escrowRequestClass:notifierClass:flowID:deviceSessionID:permittedToSendMetrics:reachabilityTracker:", v27, v26, v25, v20, v19, v18, v24, v14, v13, v17, v12, v16, v15, v4, v5,
          v6,
          v7,
          v8,
          v11,
          v9);

  return v23;
}

- (id)prepareInformation
{
  id v3 = [(OTCuttlefishContext *)self deviceAdapter];
  unsigned int v4 = [v3 isMachineIDOverridden];

  if (v4)
  {
    id v5 = [(OTCuttlefishContext *)self deviceAdapter];
    uint64_t v6 = [v5 getOverriddenMachineID];

    id v7 = 0;
  }
  else
  {
    id v8 = [(OTCuttlefishContext *)self sessionMetrics];
    id v9 = [(OTCuttlefishContext *)self authKitAdapter];
    id v10 = [(OTCuttlefishContext *)self activeAccount];
    uint64_t v11 = [v10 altDSID];
    uint64_t v12 = [v8 flowID];
    int v13 = [v8 deviceSessionID];
    id v30 = 0;
    uint64_t v6 = [v9 machineID:v11 flowID:v12 deviceSessionID:v13 canSendMetrics:-[OTCuttlefishContext canSendMetricsUsingAccountState:](self, "canSendMetricsUsingAccountState:", -[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon")) error:&v30];
    id v7 = v30;
  }
  id v29 = (void *)v6;
  if (!v6 || v7)
  {
    uint64_t v14 = sub_10000B070("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "octagon: Unable to fetch machine ID; expect signin to fail: %@",
        buf,
        0xCu);
    }
  }
  CFStringRef v25 = [OTDeviceInformation alloc];
  dispatch_semaphore_t v15 = [(OTCuttlefishContext *)self containerName];
  uint64_t v16 = [(OTCuttlefishContext *)self contextID];
  uint64_t v28 = [(OTCuttlefishContext *)self deviceAdapter];
  dispatch_time_t v17 = [v28 modelID];
  long long v18 = [(OTCuttlefishContext *)self deviceAdapter];
  id v19 = [v18 deviceName];
  [(OTCuttlefishContext *)self deviceAdapter];
  id v20 = v27 = v7;
  uint32_t v21 = [v20 serialNumber];
  int v22 = [(OTCuttlefishContext *)self deviceAdapter];
  id v23 = [v22 osVersion];
  id v26 = [(OTDeviceInformation *)v25 initForContainerName:v15 contextID:v16 epoch:0 machineID:v29 modelID:v17 deviceName:v19 serialNumber:v21 osVersion:v23];

  return v26;
}

- (void)rpcRemoveFriendsInClique:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [OTRemovePeersOperation alloc];
  id v9 = [(OTCuttlefishContext *)self operationDependencies];
  uint64_t v12 = [(OTRemovePeersOperation *)v8 initWithDependencies:v9 intendedState:@"BecomeReady" errorState:@"BecomeReady" peerIDs:v7];

  id v10 = +[OTStates OctagonReadyStates];
  uint64_t v11 = [(OTCuttlefishContext *)self stateMachine];
  [v11 doSimpleStateMachineRPC:@"remove-friends" op:v12 sourceStates:v10 reply:v6];
}

- (void)rpcLeaveClique:(id)a3
{
  unsigned int v4 = (void (**)(id, void))a3;
  id v5 = [(OTCuttlefishContext *)self stateMachine];
  unsigned int v6 = [v5 isPaused];

  if (!v6) {
    goto LABEL_6;
  }
  id v7 = +[OTStates OctagonNotInCliqueStates];
  id v8 = [(OTCuttlefishContext *)self stateMachine];
  id v9 = [v8 currentState];
  id v10 = +[NSSet setWithObject:v9];
  unsigned int v11 = [v7 intersectsSet:v10];

  if (v11)
  {
    uint64_t v12 = sub_10000B070("octagon-leave-clique");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "device is not in clique to begin with - returning", v18, 2u);
    }

    v4[2](v4, 0);
  }
  else
  {
LABEL_6:
    int v13 = [OTLeaveCliqueOperation alloc];
    uint64_t v14 = [(OTCuttlefishContext *)self operationDependencies];
    dispatch_semaphore_t v15 = [(OTLeaveCliqueOperation *)v13 initWithDependencies:v14 intendedState:@"BecomeUntrusted" errorState:@"CheckTrustState"];

    uint64_t v16 = [(OTCuttlefishContext *)self stateMachine];
    dispatch_time_t v17 = +[OTStates OctagonInAccountStates];
    [v16 doSimpleStateMachineRPC:@"leave-clique" op:v15 sourceStates:v17 reply:v4];
  }
}

- (void)rpcResetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 isGuitarfish:(BOOL)a8 reply:(id)a9
{
  dispatch_semaphore_t v15 = (NSString *)a4;
  uint64_t v16 = (NSString *)a5;
  id v17 = a9;
  idmsTargetContext = self->_idmsTargetContext;
  self->_int64_t resetReason = a3;
  self->_idmsTargetContext = v15;
  id v19 = v15;
  id v20 = a7;

  idmsCuttlefishPassword = self->_idmsCuttlefishPassword;
  self->_idmsCuttlefishPassword = v16;
  int v22 = v16;

  self->_BOOL notifyIdMS = a6;
  self->_BOOL isGuitarfish = a8;
  self->_int64_t accountType = 2;
  id v23 = [(OTCuttlefishContext *)self mergedAccountSettings:v20];

  [(OTCuttlefishContext *)self setAccountSettings:v23];
  CFStringRef v36 = @"ResetBecomeUntrusted";
  CFStringRef v34 = @"ResetAnyMissingTLKCKKSViews";
  CFStringRef v32 = @"ResetAndEstablish";
  __int16 v24 = [(OTCuttlefishContext *)self establishStatePathDictionary];
  CFStringRef v33 = v24;
  CFStringRef v25 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  id v35 = v25;
  id v26 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  CFStringRef v37 = v26;
  BOOL v27 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  uint64_t v28 = +[OctagonStateTransitionPath pathFromDictionary:v27];

  id v29 = [(OTCuttlefishContext *)self stateMachine];
  id v30 = +[OTStates OctagonInAccountStates];

  id v31 = [v29 doWatchedStateMachineRPC:@"rpc-reset-and-establish" sourceStates:v30 path:v28 reply:v17];
}

- (id)mergedAccountSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(OTCuttlefishContext *)self accountSettings];
  id v6 = objc_alloc_init((Class)OTAccountSettings);
  if ([v4 hasWalrus]) {
    id v7 = v4;
  }
  else {
    id v7 = v5;
  }
  id v8 = [v7 walrus];
  [v6 setWalrus:v8];

  if ([v4 hasWebAccess]) {
    id v9 = v4;
  }
  else {
    id v9 = v5;
  }
  id v10 = [v9 webAccess];
  [v6 setWebAccess:v10];

  return v6;
}

- (void)rpcResetAndEstablish:(int64_t)a3 isGuitarfish:(BOOL)a4 reply:(id)a5
{
}

- (void)performCKServerUnreadableDataRemoval:(BOOL)a3 altDSID:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  self->_int64_t accountType = 2;
  id v10 = [(OTCuttlefishContext *)self errorIfNoCKAccount:0];
  if (v10)
  {
    unsigned int v11 = sub_10000B070("octagon-perform-ckserver-unreadable-data-removal");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v9[2](v9, v10);
    goto LABEL_12;
  }
  if (v8) {
    goto LABEL_7;
  }
  id v19 = +[AKAccountManager sharedInstance];
  if (v19)
  {
    id v8 = v19;
    id v20 = [v19 primaryAuthKitAccount];
    if (v20)
    {
      uint32_t v21 = v20;
      uint64_t v22 = [v20 aa_altDSID];

      id v8 = (id)v22;
LABEL_7:
      uint64_t v12 = [(OTCuttlefishContext *)self authKitAdapter];
      id v28 = 0;
      id v13 = [v12 accountIsDemoAccountByAltDSID:v8 error:&v28];
      id v14 = v28;

      if (v14)
      {
        dispatch_semaphore_t v15 = sub_10000B070("SecError");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v30 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "octagon-perform-ckserver-unreadable-data-removal: failed to fetch demo account flag: %@", buf, 0xCu);
        }
      }
      uint64_t IsInternalRelease = SecIsInternalRelease();
      id v17 = [(OTCuttlefishContext *)self cuttlefishXPCWrapper];
      long long v18 = [(OTCuttlefishContext *)self activeAccount];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000F49C4;
      v26[3] = &unk_1002FB1E8;
      BOOL v27 = v9;
      [v17 performCKServerUnreadableDataRemovalWithSpecificUser:v18 isGuitarfish:v6 internalAccount:IsInternalRelease demoAccount:v13 reply:v26];

      goto LABEL_12;
    }
    __int16 v24 = sub_10000B070("SecError");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "octagon-perform-ckserver-unreadable-data-removal, Primary Authkit Account is nil", buf, 2u);
    }

    CFStringRef v25 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:44 description:@"Primary Authkit Account is nil"];
    v9[2](v9, v25);
  }
  else
  {
    id v23 = sub_10000B070("SecError");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon-perform-ckserver-unreadable-data-removal, AuthKit Account Manager is nil", buf, 2u);
    }

    id v8 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:77 description:@"AuthKit Account Manager is nil"];
    v9[2](v9, v8);
  }
LABEL_12:
}

- (void)rpcReset:(int64_t)a3 isGuitarfish:(BOOL)a4 reply:(id)a5
{
  id v8 = a5;
  self->_BOOL isGuitarfish = a4;
  self->_int64_t accountType = 1;
  self->_int64_t resetReason = a3;
  CFStringRef v27 = @"CuttlefishReset";
  CFStringRef v25 = @"CKKSResetAfterOctagonReset";
  CFStringRef v23 = @"LocalReset";
  CFStringRef v21 = @"LocalResetClearLocalContextState";
  CFStringRef v19 = @"Initializing";
  id v9 = +[OctagonStateTransitionPathStep success];
  id v20 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  uint64_t v22 = v10;
  unsigned int v11 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  __int16 v24 = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v26 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v28 = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  dispatch_semaphore_t v15 = +[OctagonStateTransitionPath pathFromDictionary:v14];

  uint64_t v16 = [(OTCuttlefishContext *)self stateMachine];
  id v17 = +[OTStates OctagonInAccountStates];
  id v18 = [v16 doWatchedStateMachineRPC:@"rpc-reset" sourceStates:v17 path:v15 reply:v8];
}

- (void)rpcEstablish:(id)a3 reply:(id)a4
{
  id v10 = a4;
  id v5 = [(OTCuttlefishContext *)self establishStatePathDictionary];
  BOOL v6 = +[OctagonStateTransitionPath pathFromDictionary:v5];

  id v7 = [(OTCuttlefishContext *)self stateMachine];
  id v8 = +[OTStates OctagonInAccountStates];
  id v9 = [v7 doWatchedStateMachineRPC:@"establish" sourceStates:v8 path:v6 reply:v10];
}

- (id)establishStatePathDictionary
{
  CFStringRef v39 = @"EstablishEnableCDPBit";
  CFStringRef v37 = @"ReEnactDeviceList";
  CFStringRef v35 = @"ReEnactPrepare";
  CFStringRef v33 = @"ResetAndEstablishClearLocalContextState";
  CFStringRef v31 = @"ReEnactReadyToEstablish";
  v29[0] = @"EscrowTriggerUpdate";
  CFStringRef v27 = @"BecomeReady";
  CFStringRef v25 = @"Ready";
  uint64_t v16 = +[OctagonStateTransitionPathStep success];
  id v26 = v16;
  dispatch_semaphore_t v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v28 = v15;
  id v14 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v29[1] = @"EstablishCKKSReset";
  v30[0] = v14;
  CFStringRef v23 = @"EstablishAfterCKKSReset";
  CFStringRef v21 = @"EscrowTriggerUpdate";
  CFStringRef v19 = @"BecomeReady";
  CFStringRef v17 = @"Ready";
  id v13 = +[OctagonStateTransitionPathStep success];
  id v18 = v13;
  id v2 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v20 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  uint64_t v22 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  __int16 v24 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v30[1] = v5;
  BOOL v6 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  CFStringRef v32 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  CFStringRef v34 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  CFStringRef v36 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  unsigned int v38 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  uint64_t v40 = v10;
  unsigned int v11 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

  return v11;
}

- (void)localReset:(id)a3
{
  id v4 = a3;
  CFStringRef v17 = @"LocalReset";
  CFStringRef v15 = @"LocalResetClearLocalContextState";
  CFStringRef v13 = @"Initializing";
  id v5 = +[OctagonStateTransitionPathStep success];
  id v14 = v5;
  BOOL v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v16 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v18 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v9 = +[OctagonStateTransitionPath pathFromDictionary:v8];

  id v10 = +[OTStates OctagonAllStates];
  unsigned int v11 = [(OTCuttlefishContext *)self stateMachine];
  id v12 = [v11 doWatchedStateMachineRPC:@"local-reset-watcher" sourceStates:v10 path:v9 reply:v4];
}

- (BOOL)setCDPEnabled:(id *)a3
{
  id v5 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v11 = 0;
  [v5 persistAccountChanges:&stru_1002F9A40 error:&v11];
  id v6 = v11;

  id v7 = [(OTCuttlefishContext *)self stateMachine];
  [v7 handleFlag:@"cdp_enabled"];

  if (v6)
  {
    id v8 = sub_10000B070("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "octagon-cdp-status: unable to persist CDP enablement: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    id v9 = sub_10000B070("octagon-cdp-status");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully set CDP status bit to 'enabled''", buf, 2u);
    }
  }
  return v6 == 0;
}

- (int64_t)getCDPStatus:(id *)a3
{
  id v4 = [(OTCuttlefishContext *)self accountMetadataStore];
  id v13 = 0;
  id v5 = [v4 loadOrCreateAccountMetadata:&v13];
  id v6 = v13;

  if (v6)
  {
    id v7 = sub_10000B070("octagon-cdp-status");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "error fetching account metadata: %@", buf, 0xCu);
    }

    int64_t v8 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    unsigned int v9 = [v5 cdpState];
    if (v9 == 2) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = v9 == 1;
    }
    id v10 = sub_10000B070("octagon-cdp-status");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = OTCDPStatusToString();
      *(_DWORD *)long long buf = 138412290;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "current cdp status is: %@", buf, 0xCu);
    }
  }

  return v8;
}

- (BOOL)accountNoLongerAvailable
{
  id v3 = [(OTCuttlefishContext *)self lockStateTracker];

  if (v3)
  {
    id v4 = [(OTCuttlefishContext *)self lockStateTracker];
    [v4 recheck];
  }
  id v5 = [(OTCuttlefishContext *)self stateMachine];
  [v5 handleFlag:@"apple_account_signed_out"];

  return 1;
}

- (BOOL)idmsTrustLevelChanged:(id *)a3
{
  id v3 = [(OTCuttlefishContext *)self stateMachine];
  [v3 handleFlag:@"idms_level"];

  return 1;
}

- (void)moveToCheckTrustedState
{
  id v3 = [(OTCuttlefishContext *)self lockStateTracker];

  if (v3)
  {
    id v4 = [(OTCuttlefishContext *)self lockStateTracker];
    [v4 recheck];
  }
  id v5 = [(OTCuttlefishContext *)self stateMachine];
  [v5 handleFlag:@"check_trust_state"];
}

- (BOOL)accountAvailable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = sub_10000B070("octagon");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v53 = v6;
    __int16 v54 = 2112;
    CFStringRef v55 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Account available with altDSID: %@ %@", buf, 0x16u);
  }

  int64_t v8 = [(OTCuttlefishContext *)self launchSequence];
  [v8 setFirstLaunch:1];

  unsigned int v9 = [(OTCuttlefishContext *)self accountsAdapter];
  id v10 = [(OTCuttlefishContext *)self personaAdapter];
  id v11 = [(OTCuttlefishContext *)self containerName];
  id v12 = [(OTCuttlefishContext *)self contextID];
  id v51 = 0;
  id v13 = [v9 findAccountForCurrentThread:v10 optionalAltDSID:v6 cloudkitContainerName:v11 octagonContextID:v12 error:&v51];
  id v14 = (OTCuttlefishContext *)v51;
  [(OTCuttlefishContext *)self setActiveAccount:v13];

  id v15 = [(OTCuttlefishContext *)self activeAccount];

  id v47 = v14;
  if (!v15 || v14)
  {
    CFStringRef v21 = sub_10000B070("SecError");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v38 = [(OTCuttlefishContext *)self contextID];
      *(_DWORD *)long long buf = 138412546;
      id v53 = v38;
      __int16 v54 = 2112;
      CFStringRef v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "octagon-account: unable to determine active account for context(%@). Issues ahead: %@", buf, 0x16u);
    }
  }
  else
  {
    id v46 = v6;
    uint64_t v16 = sub_10000B070("octagon-account");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v17 = [(OTCuttlefishContext *)self contextID];
      id v18 = [(OTCuttlefishContext *)self activeAccount];
      *(_DWORD *)long long buf = 138412546;
      id v53 = v17;
      __int16 v54 = 2112;
      CFStringRef v55 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found a new account (%@): %@", buf, 0x16u);
    }
    CFStringRef v19 = [(OTCuttlefishContext *)self accountMetadataStore];
    id v20 = [(OTCuttlefishContext *)self activeAccount];
    [v19 changeActiveAccount:v20];

    CFStringRef v21 = [(OTCuttlefishContext *)self ckks];
    uint64_t v22 = [v21 operationDependencies];
    uint64_t v23 = [v22 activeAccount];
    if (v23)
    {
      __int16 v24 = (void *)v23;
      CFStringRef v25 = [(OTCuttlefishContext *)self ckks];
      id v26 = [v25 operationDependencies];
      [v26 activeAccount];
      id v28 = v27 = a4;
      id v29 = [(OTCuttlefishContext *)self activeAccount];
      unsigned __int8 v30 = [v28 isEqual:v29];

      a4 = v27;
      id v6 = v46;
      if (v30) {
        goto LABEL_16;
      }
      CFStringRef v31 = sub_10000B070("ckks-account");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v32 = [(OTCuttlefishContext *)self activeAccount];
        CFStringRef v33 = [(OTCuttlefishContext *)self ckks];
        CFStringRef v34 = [v33 operationDependencies];
        CFStringRef v35 = [v34 activeAccount];
        *(_DWORD *)long long buf = 138412546;
        id v53 = v32;
        __int16 v54 = 2112;
        CFStringRef v55 = v35;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Updating CKKS's idea of account to %@; old: %@",
          buf,
          0x16u);
      }
      CFStringRef v21 = [(OTCuttlefishContext *)self activeAccount];
      CFStringRef v36 = [(OTCuttlefishContext *)self ckks];
      CFStringRef v37 = [v36 operationDependencies];
      [v37 setActiveAccount:v21];
    }
    else
    {
    }
  }

LABEL_16:
  CFStringRef v39 = [(OTCuttlefishContext *)self accountMetadataStore];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  void v49[2] = sub_1000F5CBC;
  v49[3] = &unk_100307118;
  id v40 = v6;
  id v50 = v40;
  id v48 = 0;
  [v39 persistAccountChanges:v49 error:&v48];
  id v41 = v48;

  if (v41)
  {
    id v42 = sub_10000B070("SecError");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v53 = v41;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "octagon: unable to persist new account availability: %@", buf, 0xCu);
    }

    uint64_t v43 = [(OTCuttlefishContext *)self stateMachine];
    [v43 handleFlag:@"account_available"];

    if (a4) {
      *a4 = v41;
    }
  }
  else
  {
    id v44 = [(OTCuttlefishContext *)self stateMachine];
    [v44 handleFlag:@"account_available"];
  }
  return v41 == 0;
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = [(OTCuttlefishContext *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F5FF4;
  block[3] = &unk_100305930;
  id v7 = v5;
  id v25 = v7;
  id v26 = self;
  dispatch_sync(v6, block);

  if ([v7 accountStatus] != (id)1)
  {
    int64_t v8 = sub_10000B070("octagon");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Informed that the CK account is now unavailable: %@", buf, 0xCu);
    }

    unsigned int v9 = [(OTCuttlefishContext *)self sessionMetrics];
    id v10 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    id v11 = [(OTCuttlefishContext *)self activeAccount];
    id v12 = [v11 altDSID];
    id v13 = [v9 flowID];
    id v14 = [v9 deviceSessionID];
    uint64_t v15 = kSecurityRTCEventNameCloudKitAccountAvailability;
    LOBYTE(v21) = [(OTCuttlefishContext *)self canSendMetricsUsingAccountState:[(OTCuttlefishContext *)self shouldSendMetricsForOctagon]];
    id v16 = [v10 initWithKeychainCircleMetrics:0 altDSID:v12 flowID:v13 deviceSessionID:v14 eventName:v15 testsAreEnabled:0 canSendMetrics:v21 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];

    CFStringRef v17 = [(OTCuttlefishContext *)self stateMachine];
    id v18 = +[OctagonStateTransitionOperation named:@"cloudkit-account-gone" entering:@"WaitingForCloudKitAccount"];
    CFStringRef v19 = +[OTStates OctagonInAccountStates];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000F6458;
    v22[3] = &unk_1002F9A20;
    id v23 = v16;
    id v20 = v16;
    [v17 doSimpleStateMachineRPC:@"cloudkit-account-gone" op:v18 sourceStates:v19 reply:v22];
  }
}

- (BOOL)canSendMetricsUsingAccountState:(int)a3
{
  return a3 != 2;
}

- (void)notificationOfMachineIDListChange
{
  id v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "machine ID list notification -- refreshing device list", v4, 2u);
  }

  [(OTCuttlefishContext *)self requestTrustedDeviceListRefresh];
}

- (NSString)description
{
  id v3 = [(OTCuttlefishContext *)self containerName];
  id v4 = [(OTCuttlefishContext *)self contextID];
  id v5 = +[NSString stringWithFormat:@"<OTCuttlefishContext: %@, %@>", v3, v4];

  return (NSString *)v5;
}

- (void)accountStateUpdated:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 icloudAccountState] == 2
    && [v7 icloudAccountState] != 2)
  {
    int64_t v8 = [(OTCuttlefishContext *)self launchSequence];
    [v8 addEvent:@"iCloudAccount"];
  }
  if ([v6 trustState] == 2 && objc_msgSend(v7, "trustState") != 2)
  {
    unsigned int v9 = [(OTCuttlefishContext *)self launchSequence];
    [v9 addEvent:@"Trusted"];

    -[OTCuttlefishContext notifyTrustChanged:](self, "notifyTrustChanged:", [v6 trustState]);
  }
  if ([v6 trustState] != 2 && objc_msgSend(v7, "trustState") == 2)
  {
    id v10 = [(OTCuttlefishContext *)self launchSequence];
    [v10 addEvent:@"Untrusted"];

    -[OTCuttlefishContext notifyTrustChanged:](self, "notifyTrustChanged:", [v6 trustState]);
    id v11 = [(OTCuttlefishContext *)self operationDependencies];
    id v12 = [v11 deviceInformationAdapter];
    unsigned int v13 = [v12 isHomePod];

    id v14 = sub_10000B070("octagon");
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Trust transition from TRUSTED to some other state, posting TTR", buf, 2u);
      }

      id v16 = +[NSMutableDictionary dictionaryWithCapacity:5];
      CFStringRef v17 = [(OTCuttlefishContext *)self operationDependencies];
      id v18 = [v17 deviceInformationAdapter];
      CFStringRef v19 = [v18 serialNumber];
      [v16 setObject:v19 forKeyedSubscript:@"serial"];

      id v20 = [(OTCuttlefishContext *)self operationDependencies];
      uint64_t v21 = [v20 deviceInformationAdapter];
      uint64_t v22 = [v21 deviceName];
      [v16 setObject:v22 forKeyedSubscript:@"name"];

      id v23 = [(OTCuttlefishContext *)self operationDependencies];
      __int16 v24 = [v23 deviceInformationAdapter];
      id v25 = [v24 osVersion];
      [v16 setObject:v25 forKeyedSubscript:@"os_version"];

      id v26 = [(OTCuttlefishContext *)self operationDependencies];
      CFStringRef v27 = [v26 deviceInformationAdapter];
      id v28 = [v27 modelID];
      [v16 setObject:v28 forKeyedSubscript:@"model_id"];

      id v29 = [v6 peerID];
      [v16 setObject:v29 forKeyedSubscript:@"peer_id"];

      id v44 = 0;
      unsigned __int8 v30 = +[NSJSONSerialization dataWithJSONObject:v16 options:2 error:&v44];
      id v14 = v44;
      if (v30)
      {
        id v31 = [objc_alloc((Class)NSString) initWithData:v30 encoding:4];
      }
      else
      {
        id v31 = +[NSString stringWithFormat:@"Error while serializing identifiers: %@", v14];
      }
      CFStringRef v32 = v31;
      CFStringRef v33 = [(OTCuttlefishContext *)self tapToRadarAdapter];
      [v33 postHomePodLostTrustTTR:v32];
    }
    else if (v15)
    {
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Trust transition from TRUSTED to UNTRUSTED on a non-homepod", v43, 2u);
    }
  }
  CFStringRef v34 = [v6 syncingPolicy];
  CFStringRef v35 = [v7 syncingPolicy];
  unsigned __int8 v36 = [v34 isEqualToData:v35];

  if ((v36 & 1) == 0)
  {
    CFStringRef v37 = [v6 getTPSyncingPolicy];
    unsigned int v38 = [v7 getTPSyncingPolicy];
    unsigned int v39 = [v37 syncUserControllableViews];
    if (v39 != [v38 syncUserControllableViews])
    {
      id v40 = sub_10000B070("octagon-ucv");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "User controllable view state changed; posting notification",
          v42,
          2u);
      }

      id v41 = [(OTCuttlefishContext *)self notifierClass];
      [(objc_class *)v41 post:OTUserControllableViewStatusChanged];
    }
  }
}

- (void)notifyTrustChanged:(int)a3
{
  id v5 = sub_10000B070("octagon");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"Untrusted";
    if (a3 == 2) {
      CFStringRef v6 = @"Trusted";
    }
    int v11 = 138412290;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Changing trust status to: %@", (uint8_t *)&v11, 0xCu);
  }

  if (!-[OTSOSActualAdapter sosEnabled]_0())
  {
    id v7 = [(OTCuttlefishContext *)self notifierClass];
    int64_t v8 = +[NSString stringWithUTF8String:kSOSCCCircleChangedNotification];
    [(objc_class *)v7 post:v8];
  }
  unsigned int v9 = [(OTCuttlefishContext *)self notifierClass];
  id v10 = +[NSString stringWithUTF8String:"com.apple.security.octagon.trust-status-change"];
  [(objc_class *)v9 post:v10];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)OTCuttlefishContext;
  [(OTCuttlefishContext *)&v2 dealloc];
}

- (void)resetCKKS:(id)a3
{
}

- (void)clearCKKS
{
}

- (OTCuttlefishContext)initWithContainerName:(id)a3 contextID:(id)a4 activeAccount:(id)a5 cuttlefish:(id)a6 ckksAccountSync:(id)a7 sosAdapter:(id)a8 accountsAdapter:(id)a9 authKitAdapter:(id)a10 personaAdapter:(id)a11 tooManyPeersAdapter:(id)a12 tapToRadarAdapter:(id)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 accountStateTracker:(id)a16 deviceInformationAdapter:(id)a17 apsConnectionClass:(Class)a18 escrowRequestClass:(Class)a19 notifierClass:(Class)a20 cdpd:(id)a21
{
  id v80 = a3;
  id v81 = a4;
  id v88 = a5;
  id v26 = a6;
  id v79 = a7;
  id v71 = a8;
  id v78 = a8;
  id v77 = a9;
  id v76 = a10;
  id v87 = a11;
  id v75 = a12;
  id v74 = a13;
  id v86 = a14;
  id v85 = a15;
  id v84 = a16;
  id v73 = a17;
  id v27 = a21;
  v98.receiver = self;
  v98.super_class = (Class)OTCuttlefishContext;
  id v28 = [(OTCuttlefishContext *)&v98 init];
  if (v28)
  {
    id v82 = v27;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v28);
    objc_storeStrong((id *)&v28->_containerName, a3);
    objc_storeStrong((id *)&v28->_contextID, a4);
    objc_storeStrong((id *)&v28->_activeAccount, a5);
    objc_storeStrong((id *)&v28->_reachabilityTracker, a15);
    uint64_t v29 = +[OctagonAPSReceiver receiverForNamedDelegatePort:@"com.apple.securityd.aps" apsConnectionClass:a18];
    apsReceiver = v28->_apsReceiver;
    v28->_apsReceiver = (OctagonAPSReceiver *)v29;

    id v31 = v28->_apsReceiver;
    CFStringRef v32 = [(OTCuttlefishContext *)v28 containerName];
    id v33 = [(OctagonAPSReceiver *)v31 registerCuttlefishReceiver:v28 forContainerName:v32 contextID:v81];

    objc_storeStrong((id *)&v28->_ckks, a7);
    v28->_initialBecomeUntrustedPosted = 0;
    objc_storeStrong((id *)&v28->_tooManyPeersAdapter, a12);
    objc_storeStrong((id *)&v28->_tapToRadarAdapter, a13);
    CFStringRef v34 = (SecLaunchSequence *)[objc_alloc((Class)SecLaunchSequence) initWithRocketName:@"com.apple.octagon.launch"];
    launchSequence = v28->_launchSequence;
    v28->_launchSequence = v34;

    dispatch_queue_t v36 = dispatch_queue_create("com.apple.security.otcuttlefishcontext", 0);
    queue = v28->_queue;
    v28->_queue = (OS_dispatch_queue *)v36;

    unsigned int v38 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v28->_operationQueue;
    v28->_operationQueue = v38;

    id v40 = objc_alloc_init(CKKSCondition);
    cloudKitAccountStateKnown = v28->_cloudKitAccountStateKnown;
    v28->_cloudKitAccountStateKnown = v40;

    id v42 = [[OTCuttlefishAccountStateHolder alloc] initWithQueue:v28->_queue container:v28->_containerName context:v28->_contextID personaAdapter:v87 activeAccount:v88];
    accountMetadataStore = v28->_accountMetadataStore;
    v28->_accountMetadataStore = v42;

    [(OTCuttlefishAccountStateHolder *)v28->_accountMetadataStore registerNotification:v28];
    id v44 = [OctagonStateMachine alloc];
    unsigned __int8 v45 = [v81 isEqualToString:@"defaultContext"];
    if (v45)
    {
      id v46 = @"octagon";
    }
    else
    {
      id v46 = +[NSString stringWithFormat:@"octagon-%@", v81];
    }
    id v47 = +[OTStates OctagonStateMap];
    id v48 = +[OTStates AllOctagonFlags];
    CFStringRef v49 = [(OctagonStateMachine *)v44 initWithName:v46 states:v47 flags:v48 initialState:@"Initializing" queue:v28->_queue stateEngine:v28 unexpectedStateErrorDomain:@"com.apple.security.octagon.state" lockStateTracker:v86 reachabilityTracker:v85];
    stateMachine = v28->_stateMachine;
    v28->_stateMachine = v49;

    if ((v45 & 1) == 0) {
    objc_storeStrong((id *)&v28->_sosAdapter, v71);
    }
    [(OTSOSAdapter *)v28->_sosAdapter registerForPeerChangeUpdates:v28];
    objc_storeStrong((id *)&v28->_accountsAdapter, a9);
    objc_storeStrong((id *)&v28->_authKitAdapter, a10);
    objc_storeStrong((id *)&v28->_personaAdapter, a11);
    objc_storeStrong((id *)&v28->_deviceAdapter, a17);
    [(OTDeviceInformationAdapter *)v28->_deviceAdapter registerForDeviceNameUpdates:v28];
    id v51 = [[CuttlefishXPCWrapper alloc] initWithCuttlefishXPCConnection:v26];
    cuttlefishXPCWrapper = v28->_cuttlefishXPCWrapper;
    v28->_cuttlefishXPCWrapper = v51;

    objc_storeStrong((id *)&v28->_lockStateTracker, a14);
    objc_storeStrong((id *)&v28->_accountStateTracker, a16);
    id v53 = [[OTFollowup alloc] initWithFollowupController:v82];
    followupHandler = v28->_followupHandler;
    v28->_followupHandler = v53;

    id v55 = [v84 registerForNotificationsOfCloudKitAccountStatusChange:v28];
    [(OTAuthKitAdapter *)v28->_authKitAdapter registerNotification:v28];
    objc_storeStrong((id *)&v28->_notifierClass, a20);
    objc_storeStrong((id *)&v28->_escrowRequestClass, a19);
    BOOL v56 = [CKKSNearFutureScheduler alloc];
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_1000F7400;
    v95[3] = &unk_1003077A0;
    objc_copyWeak(&v96, &location);
    id v57 = [(CKKSNearFutureScheduler *)v56 initWithName:@"octagon-tlk-request" delay:500000000 keepProcessAlive:0 dependencyDescriptionCode:0 block:v95];
    suggestTLKUploadNotifier = v28->_suggestTLKUploadNotifier;
    v28->_suggestTLKUploadNotifier = v57;

    BOOL v59 = [CKKSNearFutureScheduler alloc];
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_1000F74A0;
    v93[3] = &unk_1003077A0;
    objc_copyWeak(&v94, &location);
    id v60 = [(CKKSNearFutureScheduler *)v59 initWithName:@"octagon-policy-check" delay:500000000 keepProcessAlive:0 dependencyDescriptionCode:0 block:v93];
    requestPolicyCheckNotifier = v28->_requestPolicyCheckNotifier;
    v28->_requestPolicyCheckNotifier = v60;

    uint64_t v62 = [CKKSNearFutureScheduler alloc];
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_1000F7540;
    v91[3] = &unk_1003077A0;
    objc_copyWeak(&v92, &location);
    v63 = [(CKKSNearFutureScheduler *)v62 initWithName:@"octagon-upgrade-ucv" initialDelay:0 continuingDelay:10000000000 keepProcessAlive:0 dependencyDescriptionCode:0 block:v91];
    upgradeUserControllableViewsRateLimiter = v28->_upgradeUserControllableViewsRateLimiter;
    v28->_upgradeUserControllableViewsRateLimiter = v63;

    v65 = [[CKKSNearFutureScheduler alloc] initWithName:@"octagon-retry-fixup" initialDelay:10000000000 exponentialBackoff:600000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:&stru_1002F99F8 block:2.0];
    fixupRetryScheduler = v28->_fixupRetryScheduler;
    v28->_fixupRetryScheduler = v65;

    v28->_shouldSendMetricsForOctagon = 0;
    id v67 = [CKKSNearFutureScheduler alloc];
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_1000F75C4;
    v89[3] = &unk_1003077A0;
    objc_copyWeak(&v90, &location);
    v68 = [(CKKSNearFutureScheduler *)v67 initWithName:@"ensure-metrics-off" initialDelay:3600000000000 continuingDelay:0 keepProcessAlive:1 dependencyDescriptionCode:0 block:v89];
    checkMetricsTrigger = v28->_checkMetricsTrigger;
    v28->_checkMetricsTrigger = v68;

    v28->_int64_t accountType = 0;
    objc_destroyWeak(&v90);
    objc_destroyWeak(&v92);
    objc_destroyWeak(&v94);
    objc_destroyWeak(&v96);
    objc_destroyWeak(&location);
    id v27 = v82;
  }

  return v28;
}

@end