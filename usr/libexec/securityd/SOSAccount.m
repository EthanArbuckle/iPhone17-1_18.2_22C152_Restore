@interface SOSAccount
+ (id)accountFromDER:(const char *)a3 end:(const char *)a4 factory:(SOSDataSourceFactory *)a5 error:(id *)a6;
+ (id)accountFromData:(id)a3 factory:(SOSDataSourceFactory *)a4 error:(id *)a5;
+ (id)urlForSOSAccountSettings;
+ (unsigned)ghostBustGetRampSettings;
+ (void)performOnQuietAccountQueue:(id)a3;
- (BOOL)SOSMonitorModeSOSIsActive;
- (BOOL)_onQueueEnsureInBackupRings:(__CFString *)a3;
- (BOOL)accountInScriptBypassMode;
- (BOOL)accountIsChanging;
- (BOOL)accountKeyIsTrusted;
- (BOOL)circle_rings_retirements_need_attention;
- (BOOL)consolidateKeyInterest;
- (BOOL)engine_peer_state_needs_repair;
- (BOOL)ensureFactoryCircles;
- (BOOL)forceSyncForRecoveryRing;
- (BOOL)ghostBustCheckDate;
- (BOOL)hasPeerInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInCircle:(__CFError *)a3;
- (BOOL)isListeningForSync;
- (BOOL)key_interests_need_updating;
- (BOOL)need_backup_peers_created_after_backup_key_set;
- (BOOL)notifyBackupOnExit;
- (BOOL)notifyCircleChangeOnExit;
- (BOOL)notifyViewChangeOnExit;
- (BOOL)sosCompatibilityMode;
- (BOOL)sosEvaluateIfNeeded;
- (BOOL)sosTestmode;
- (BOOL)syncWaitAndFlush:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(__CFError *)a7;
- (CKKSNearFutureScheduler)performBackups;
- (CKKSNearFutureScheduler)performRingUpdates;
- (CKKSPBFileStorage)accountConfiguration;
- (CKKeyParameter)key_transport;
- (NSData)_password_tmp;
- (NSData)accountKeyDerivationParameters;
- (NSData)backup_key;
- (NSDictionary)gestalt;
- (NSString)deviceID;
- (NSString)peerID;
- (NSUserDefaults)settings;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)stateMachineQueue;
- (OS_dispatch_source)user_private_timer;
- (OctagonStateMachine)stateMachine;
- (SOSAccount)initWithGestalt:(__CFDictionary *)a3 factory:(SOSDataSourceFactory *)a4;
- (SOSAccountTrustClassic)trust;
- (SOSCKCircleStorage)ck_storage;
- (SOSDataSourceFactory)factory;
- (SOSKVSCircleStorageTransport)circle_transport;
- (SOSMessageKVS)kvs_message_transport;
- (__OpaqueSOSFullPeerInfo)fullPeerInfo;
- (__OpaqueSOSPeerInfo)peerInfo;
- (__SecKey)accountKey;
- (__SecKey)accountPrivateKey;
- (__SecKey)octagonEncryptionFullKeyRef;
- (__SecKey)octagonSigningFullKeyRef;
- (__SecKey)peerPublicKey;
- (__SecKey)previousAccountKey;
- (id)SOSMonitorModeSOSIsActiveDescription;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (id)accountStatusInternal;
- (id)encodedData:(id *)a3;
- (id)ghostBustGetDate;
- (id)performBackup;
- (id)performRingUpdate;
- (id)saveBlock;
- (int)getCircleStatus:(__CFError *)a3;
- (int)getPublicKeyStatusForKey:(int)a3 error:(id *)a4;
- (int)lock_notification_token;
- (void)SOSMonitorModeDisableSOS;
- (void)SOSMonitorModeEnableSOS;
- (void)SOSMonitorModeSOSIsActiveWithCallback:(id)a3;
- (void)_onQueueRecordRetiredPeersInCircle;
- (void)accountStatus:(id)a3;
- (void)addBackupFlag;
- (void)addRingUpdateFlag;
- (void)assertStashedAccountCredential:(id)a3;
- (void)circleHash:(id)a3;
- (void)circleJoiningBlob:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 applicant:(id)a7 complete:(id)a8;
- (void)dealloc;
- (void)ensureOctagonPeerKeys;
- (void)flattenToSaveBlock;
- (void)getWatchdogParameters:(id)a3;
- (void)ghostBust:(unsigned int)a3 complete:(id)a4;
- (void)ghostBustFollowup;
- (void)ghostBustInfo:(id)a3;
- (void)ghostBustPeriodic:(unsigned int)a3 complete:(id)a4;
- (void)ghostBustSchedule;
- (void)ghostBustTriggerTimed:(unsigned int)a3 complete:(id)a4;
- (void)iCloudIdentityStatus:(id)a3;
- (void)iCloudIdentityStatus_internal:(id)a3;
- (void)importInitialSyncCredentials:(id)a3 complete:(id)a4;
- (void)initialSyncCredentials:(unsigned int)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8;
- (void)joinCircleWithBlob:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 version:(int)a8 complete:(id)a9;
- (void)keyStatusFor:(int)a3 complete:(id)a4;
- (void)kvsPerformanceCounters:(id)a3;
- (void)myPeerInfo:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7;
- (void)performTransaction:(BOOL)a3 action:(id)a4;
- (void)performTransaction:(id)a3;
- (void)performTransaction_Locked:(BOOL)a3 action:(id)a4;
- (void)performTransaction_Locked:(id)a3;
- (void)rateLimitingPerformanceCounters:(id)a3;
- (void)removeV0Peers:(id)a3;
- (void)rpcTriggerBackup:(id)a3 complete:(id)a4;
- (void)rpcTriggerRingUpdate:(id)a3;
- (void)rpcTriggerSync:(id)a3 complete:(id)a4;
- (void)setAccountConfiguration:(id)a3;
- (void)setAccountInBypassMode:(BOOL)a3;
- (void)setAccountInScriptBypassMode:(BOOL)a3;
- (void)setAccountIsChanging:(BOOL)a3;
- (void)setAccountKey:(__SecKey *)a3;
- (void)setAccountKeyDerivationParameters:(id)a3;
- (void)setAccountKeyIsTrusted:(BOOL)a3;
- (void)setAccountPrivateKey:(__SecKey *)a3;
- (void)setBackup_key:(id)a3;
- (void)setBypass:(BOOL)a3 reply:(id)a4;
- (void)setCircle_rings_retirements_need_attention:(BOOL)a3;
- (void)setCircle_transport:(id)a3;
- (void)setCk_storage:(id)a3;
- (void)setConsolidateKeyInterest:(BOOL)a3;
- (void)setDeviceID:(id)a3;
- (void)setEngine_peer_state_needs_repair:(BOOL)a3;
- (void)setFactory:(SOSDataSourceFactory *)a3;
- (void)setForceSyncForRecoveryRing:(BOOL)a3;
- (void)setGestalt:(id)a3;
- (void)setIsListeningForSync:(BOOL)a3;
- (void)setKey_interests_need_updating:(BOOL)a3;
- (void)setKey_transport:(id)a3;
- (void)setKvs_message_transport:(id)a3;
- (void)setLock_notification_token:(int)a3;
- (void)setNeed_backup_peers_created_after_backup_key_set:(BOOL)a3;
- (void)setNotifyBackupOnExit:(BOOL)a3;
- (void)setNotifyCircleChangeOnExit:(BOOL)a3;
- (void)setNotifyViewChangeOnExit:(BOOL)a3;
- (void)setOctagonEncryptionFullKeyRef:(__SecKey *)a3;
- (void)setOctagonSigningFullKeyRef:(__SecKey *)a3;
- (void)setPeerPublicKey:(__SecKey *)a3;
- (void)setPerformBackups:(id)a3;
- (void)setPerformRingUpdates:(id)a3;
- (void)setPreviousAccountKey:(__SecKey *)a3;
- (void)setPublicKeyStatus:(int)a3 forKey:(int)a4;
- (void)setQueue:(id)a3;
- (void)setSaveBlock:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSosCompatibilityMode:(BOOL)a3;
- (void)setSosTestmode:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)setStateMachineQueue:(id)a3;
- (void)setTrust:(id)a3;
- (void)setUser_private_timer:(id)a3;
- (void)setWatchdogParmeters:(id)a3 complete:(id)a4;
- (void)set_password_tmp:(id)a3;
- (void)setupStateMachine;
- (void)sosEnableValidityCheck;
- (void)startStateMachine;
- (void)stashAccountCredential:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8;
- (void)stashedCredentialPublicKey:(id)a3;
- (void)triggerBackupForPeers:(id)a3;
- (void)triggerRingUpdate;
- (void)triggerRingUpdateNow:(id)a3;
- (void)userPublicKey:(id)a3;
- (void)validatedStashedAccountCredential:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7;
@end

@implementation SOSAccount

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performRingUpdates, 0);
  objc_storeStrong((id *)&self->_performBackups, 0);
  objc_storeStrong((id *)&self->_accountConfiguration, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_stateMachineQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong(&self->_saveBlock, 0);
  objc_storeStrong((id *)&self->_accountKeyDerivationParameters, 0);
  objc_storeStrong((id *)&self->_waitForInitialSync_blocks, 0);
  objc_storeStrong((id *)&self->_change_blocks, 0);
  objc_storeStrong((id *)&self->_ck_storage, 0);
  objc_storeStrong((id *)&self->_kvs_message_transport, 0);
  objc_storeStrong((id *)&self->_circle_transport, 0);
  objc_storeStrong((id *)&self->_key_transport, 0);
  objc_storeStrong((id *)&self->__password_tmp, 0);
  objc_storeStrong((id *)&self->_user_private_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trust, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_backup_key, 0);

  objc_storeStrong((id *)&self->_gestalt, 0);
}

- (void)setForceSyncForRecoveryRing:(BOOL)a3
{
  self->_forceSyncForRecoveryRing = a3;
}

- (BOOL)forceSyncForRecoveryRing
{
  return self->_forceSyncForRecoveryRing;
}

- (void)setPerformRingUpdates:(id)a3
{
}

- (CKKSNearFutureScheduler)performRingUpdates
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPerformBackups:(id)a3
{
}

- (CKKSNearFutureScheduler)performBackups
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAccountConfiguration:(id)a3
{
}

- (CKKSPBFileStorage)accountConfiguration
{
  return (CKKSPBFileStorage *)objc_getProperty(self, a2, 232, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 224, 1);
}

- (void)setStateMachineQueue:(id)a3
{
}

- (OS_dispatch_queue)stateMachineQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSosCompatibilityMode:(BOOL)a3
{
  self->_sosCompatibilityMode = a3;
}

- (BOOL)sosCompatibilityMode
{
  return self->_sosCompatibilityMode;
}

- (void)setAccountInScriptBypassMode:(BOOL)a3
{
  self->_accountInScriptBypassMode = a3;
}

- (BOOL)accountInScriptBypassMode
{
  return self->_accountInScriptBypassMode;
}

- (void)setConsolidateKeyInterest:(BOOL)a3
{
  self->_consolidateKeyInterest = a3;
}

- (BOOL)consolidateKeyInterest
{
  return self->_consolidateKeyInterest;
}

- (void)setSosTestmode:(BOOL)a3
{
  self->_sosTestmode = a3;
}

- (BOOL)sosTestmode
{
  return self->_sosTestmode;
}

- (void)setAccountIsChanging:(BOOL)a3
{
  self->_accountIsChanging = a3;
}

- (BOOL)accountIsChanging
{
  return self->_accountIsChanging;
}

- (void)setOctagonEncryptionFullKeyRef:(__SecKey *)a3
{
  self->_octagonEncryptionFullKeyRef = a3;
}

- (__SecKey)octagonEncryptionFullKeyRef
{
  return self->_octagonEncryptionFullKeyRef;
}

- (void)setOctagonSigningFullKeyRef:(__SecKey *)a3
{
  self->_octagonSigningFullKeyRef = a3;
}

- (__SecKey)octagonSigningFullKeyRef
{
  return self->_octagonSigningFullKeyRef;
}

- (void)setSettings:(id)a3
{
}

- (NSUserDefaults)settings
{
  return self->_settings;
}

- (void)setNotifyBackupOnExit:(BOOL)a3
{
  self->_notifyBackupOnExit = a3;
}

- (BOOL)notifyBackupOnExit
{
  return self->_notifyBackupOnExit;
}

- (void)setNotifyViewChangeOnExit:(BOOL)a3
{
  self->_notifyViewChangeOnExit = a3;
}

- (BOOL)notifyViewChangeOnExit
{
  return self->_notifyViewChangeOnExit;
}

- (void)setNotifyCircleChangeOnExit:(BOOL)a3
{
  self->_notifyCircleChangeOnExit = a3;
}

- (BOOL)notifyCircleChangeOnExit
{
  return self->_notifyCircleChangeOnExit;
}

- (void)setSaveBlock:(id)a3
{
}

- (id)saveBlock
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setAccountKeyIsTrusted:(BOOL)a3
{
  self->_accountKeyIsTrusted = a3;
}

- (BOOL)accountKeyIsTrusted
{
  return self->_accountKeyIsTrusted;
}

- (void)setAccountKeyDerivationParameters:(id)a3
{
}

- (NSData)accountKeyDerivationParameters
{
  return self->_accountKeyDerivationParameters;
}

- (void)setNeed_backup_peers_created_after_backup_key_set:(BOOL)a3
{
  self->_need_backup_peers_created_after_backup_key_set = a3;
}

- (BOOL)need_backup_peers_created_after_backup_key_set
{
  return self->_need_backup_peers_created_after_backup_key_set;
}

- (void)setKey_interests_need_updating:(BOOL)a3
{
  self->_key_interests_need_updating = a3;
}

- (BOOL)key_interests_need_updating
{
  return self->_key_interests_need_updating;
}

- (void)setEngine_peer_state_needs_repair:(BOOL)a3
{
  self->_engine_peer_state_needs_repair = a3;
}

- (BOOL)engine_peer_state_needs_repair
{
  return self->_engine_peer_state_needs_repair;
}

- (void)setCircle_rings_retirements_need_attention:(BOOL)a3
{
  self->_circle_rings_retirements_need_attention = a3;
}

- (BOOL)circle_rings_retirements_need_attention
{
  return self->_circle_rings_retirements_need_attention;
}

- (void)setCk_storage:(id)a3
{
}

- (SOSCKCircleStorage)ck_storage
{
  return self->_ck_storage;
}

- (void)setKvs_message_transport:(id)a3
{
}

- (SOSMessageKVS)kvs_message_transport
{
  return self->_kvs_message_transport;
}

- (void)setCircle_transport:(id)a3
{
}

- (SOSKVSCircleStorageTransport)circle_transport
{
  return self->_circle_transport;
}

- (void)setKey_transport:(id)a3
{
}

- (CKKeyParameter)key_transport
{
  return self->_key_transport;
}

- (void)setLock_notification_token:(int)a3
{
  self->_lock_notification_token = a3;
}

- (int)lock_notification_token
{
  return self->_lock_notification_token;
}

- (void)setIsListeningForSync:(BOOL)a3
{
  self->_isListeningForSync = a3;
}

- (BOOL)isListeningForSync
{
  return self->_isListeningForSync;
}

- (void)set_password_tmp:(id)a3
{
}

- (NSData)_password_tmp
{
  return self->__password_tmp;
}

- (void)setFactory:(SOSDataSourceFactory *)a3
{
  self->_factory = a3;
}

- (SOSDataSourceFactory)factory
{
  return self->_factory;
}

- (void)setUser_private_timer:(id)a3
{
}

- (OS_dispatch_source)user_private_timer
{
  return self->_user_private_timer;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setTrust:(id)a3
{
}

- (SOSAccountTrustClassic)trust
{
  return self->_trust;
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setBackup_key:(id)a3
{
}

- (NSData)backup_key
{
  return self->_backup_key;
}

- (void)setGestalt:(id)a3
{
}

- (NSDictionary)gestalt
{
  return self->_gestalt;
}

- (__SecKey)peerPublicKey
{
  return self->_peerPublicKey;
}

- (__SecKey)previousAccountKey
{
  return self->_previousAccountKey;
}

- (__SecKey)accountPrivateKey
{
  return self->_accountPrivateKey;
}

- (__SecKey)accountKey
{
  return self->_accountKey;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(SOSAccount *)self stateMachineQueue];
  dispatch_assert_queue_V2(v9);

  v10 = sub_10000B070("sos-sm");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Entering state: %@ [flags: %@]", (uint8_t *)&v16, 0x16u);
  }

  if ([v7 isEqualToString:@"ready"])
  {
    if ([v8 _onqueueContains:@"trigger_backup"])
    {
      [v8 _onqueueRemoveFlag:@"trigger_backup"];
      CFStringRef v11 = @"perform-backup-flag";
      CFStringRef v12 = @"perform_backup";
LABEL_11:
      uint64_t v13 = +[OctagonStateTransitionOperation named:v11 entering:v12];
      goto LABEL_12;
    }
    if ([v8 _onqueueContains:@"trigger_ring_update"])
    {
      [v8 _onqueueRemoveFlag:@"trigger_ring_update"];
      CFStringRef v11 = @"perform-ring-update-flag";
      CFStringRef v12 = @"perform_ring_update";
      goto LABEL_11;
    }
  }
  else if (([v7 isEqualToString:@"error"] & 1) == 0)
  {
    if ([v7 isEqualToString:@"perform_ring_update"])
    {
      uint64_t v13 = [(SOSAccount *)self performRingUpdate];
LABEL_12:
      v14 = (void *)v13;
      goto LABEL_16;
    }
    if ([v7 isEqualToString:@"perform_backup"])
    {
      uint64_t v13 = [(SOSAccount *)self performBackup];
      goto LABEL_12;
    }
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (id)performRingUpdate
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001DA808;
  v4[3] = &unk_1003077F0;
  objc_copyWeak(&v5, &location);
  v2 = +[OctagonStateTransitionOperation named:@"perform-ring-update" intending:@"ready" errorState:@"error" withBlockTakingSelf:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)performBackup
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001DB300;
  v4[3] = &unk_1003077F0;
  objc_copyWeak(&v5, &location);
  v2 = +[OctagonStateTransitionOperation named:@"perform-backup-state" intending:@"ready" errorState:@"error" withBlockTakingSelf:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (void)triggerRingUpdate
{
  if (![(SOSAccount *)self consolidateKeyInterest])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v3 = [(SOSAccount *)self stateMachineQueue];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1001DB5B4;
    v4[3] = &unk_1003077A0;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)triggerRingUpdateNow:(id)a3
{
  id v4 = a3;
  [(SOSAccount *)self setForceSyncForRecoveryRing:1];
  id v5 = [(SOSAccount *)self stateMachine];
  if ([v5 isPaused])
  {
    v6 = [(SOSAccount *)self stateMachine];
    id v7 = [v6 currentState];
    unsigned __int8 v8 = [v7 isEqualToString:@"ready"];

    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v9 = [(SOSAccount *)self stateMachine];
  id v10 = [v9 waitForState:@"ready" wait:10000000000];

LABEL_6:
  CFStringRef v22 = @"perform_ring_update";
  CFStringRef v20 = @"ready";
  CFStringRef v11 = +[OctagonStateTransitionPathStep success];
  v21 = v11;
  CFStringRef v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23 = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v14 = +[OctagonStateTransitionPath pathFromDictionary:v13];

  v15 = [(SOSAccount *)self stateMachine];
  CFStringRef v19 = @"ready";
  int v16 = +[NSArray arrayWithObjects:&v19 count:1];
  id v17 = +[NSSet setWithArray:v16];
  id v18 = [v15 doWatchedStateMachineRPC:@"rpc-perform-rings" sourceStates:v17 path:v14 reply:v4];
}

- (void)triggerBackupForPeers:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  v6 = v5;
  if (v4) {
    [v5 addObjectsFromArray:v4];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = [(SOSAccount *)self stateMachineQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001DBA60;
  v10[3] = &unk_1003077C8;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)addRingUpdateFlag
{
  id v4 = [[OctagonPendingFlag alloc] initWithFlag:@"trigger_ring_update" conditions:1];
  v3 = [(SOSAccount *)self stateMachine];
  [v3 handlePendingFlag:v4];
}

- (void)addBackupFlag
{
  id v4 = [[OctagonPendingFlag alloc] initWithFlag:@"trigger_backup" conditions:1];
  v3 = [(SOSAccount *)self stateMachine];
  [v3 handlePendingFlag:v4];
}

- (void)setupStateMachine
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v4 = [CKKSPBFileStorage alloc];
  id v5 = [(id)objc_opt_class() urlForSOSAccountSettings];
  v6 = [(CKKSPBFileStorage *)v4 initWithStoragePath:v5 storageClass:objc_opt_class()];
  [(SOSAccount *)self setAccountConfiguration:v6];

  id v7 = [(SOSAccount *)self stateMachine];

  if (v7)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SOSAccount.m" lineNumber:3372 description:@"can't bootstrap more than once"];
  }
  dispatch_queue_t v8 = dispatch_queue_create("SOS-statemachine", 0);
  [(SOSAccount *)self setStateMachineQueue:v8];

  id v9 = [OctagonStateMachine alloc];
  if (qword_10035D318 != -1) {
    dispatch_once(&qword_10035D318, &stru_100307988);
  }
  id v10 = (id)qword_10035D310;
  if (qword_10035D328 != -1) {
    dispatch_once(&qword_10035D328, &stru_1003079A8);
  }
  id v11 = (id)qword_10035D320;
  id v12 = [(SOSAccount *)self stateMachineQueue];
  id v13 = +[CKKSLockStateTracker globalTracker];
  v14 = [(OctagonStateMachine *)v9 initWithName:@"sosaccount" states:v10 flags:v11 initialState:@"ready" queue:v12 stateEngine:self unexpectedStateErrorDomain:@"com.apple.security.sosaccount.state" lockStateTracker:v13 reachabilityTracker:0];
  [(SOSAccount *)self setStateMachine:v14];

  v15 = [CKKSNearFutureScheduler alloc];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001DC130;
  v26[3] = &unk_1003077A0;
  objc_copyWeak(&v27, &location);
  int v16 = [(CKKSNearFutureScheduler *)v15 initWithName:@"performBackups" initialDelay:5000000000 exponentialBackoff:120000000000 maximumDelay:1 keepProcessAlive:0 dependencyDescriptionCode:v26 block:2.0];
  [(SOSAccount *)self setPerformBackups:v16];

  id v17 = [CKKSNearFutureScheduler alloc];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001DC170;
  v24[3] = &unk_1003077A0;
  objc_copyWeak(&v25, &location);
  id v18 = [(CKKSNearFutureScheduler *)v17 initWithName:@"performRingUpdates" initialDelay:1000000000 exponentialBackoff:10000000000 maximumDelay:1 keepProcessAlive:0 dependencyDescriptionCode:v24 block:2.0];
  [(SOSAccount *)self setPerformRingUpdates:v18];

  CFStringRef v19 = [(SOSAccount *)self accountConfiguration];
  CFStringRef v20 = [v19 storage];

  v21 = [v20 pendingBackupPeers];
  id v22 = [v21 count];

  if (v22) {
    [(SOSAccount *)self addBackupFlag];
  }
  if ([v20 ringUpdateFlag]) {
    [(SOSAccount *)self addRingUpdateFlag];
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)_onQueueRecordRetiredPeersInCircle
{
  v3 = [(SOSAccount *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(SOSAccount *)self isInCircle:0])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v4 = [(SOSAccount *)self trust];
    id v5 = [(SOSAccount *)self circle_transport];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001DC45C;
    v7[3] = &unk_100307658;
    id v6 = v4;
    id v8 = v6;
    id v9 = self;
    id v10 = &v11;
    [v6 modifyCircle:v5 err:0 action:v7];

    if (*((unsigned char *)v12 + 24)) {
      sub_1001EA1A8(self);
    }

    _Block_object_dispose(&v11, 8);
  }
}

- (void)keyStatusFor:(int)a3 complete:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = 0;
  id v6 = (void (**)(id, void, id))a4;
  uint64_t v7 = [(SOSAccount *)self getPublicKeyStatusForKey:v4 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (int)getPublicKeyStatusForKey:(int)a3 error:(id *)a4
{
  uint64_t valuePtr = -1;
  CFStringRef v5 = @"kSOSBackupKeyStatus";
  if (a3 != 1) {
    CFStringRef v5 = 0;
  }
  if (a3 == 2) {
    CFStringRef v6 = @"kSOSRecoveryKeyStatus";
  }
  else {
    CFStringRef v6 = v5;
  }
  if (v6)
  {
    CFNumberRef v9 = (const __CFNumber *)sub_1001DCC24(self, (uint64_t)v6);
    if (v9)
    {
      CFNumberGetValue(v9, kCFNumberCFIndexType, &valuePtr);
      if (a3 == 1)
      {
        [(SOSAccount *)self peerInfo];
        if ((SOSPeerInfoHasBackupKey() & 1) == 0) {
          return 0;
        }
      }
      else if (a3 == 2)
      {
        CFDataRef v10 = sub_1002024D8(kCFAllocatorDefault, self, 0);
        if (!v10) {
          return 0;
        }
LABEL_51:
        CFRelease(v10);
      }
      return valuePtr;
    }
    uint64_t valuePtr = 0;
    if (a3 != 1)
    {
      if (a3 != 2)
      {
        uint64_t valuePtr = -1;
        if (a4)
        {
          *a4 = +[NSError errorWithDomain:kSOSErrorDomain code:9 userInfo:0];
        }
        return valuePtr;
      }
      id v12 = self;
      CFTypeRef cf = 0;
      CFDataRef v13 = sub_1002024D8(kCFAllocatorDefault, v12, 0);
      if (!v13)
      {

        goto LABEL_49;
      }
      CFDataRef v14 = v13;
      CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@-tomb", kSOSViewiCloudIdentity);
      int v16 = [(SOSAccount *)v12 trust];
      id v17 = [v16 copyRing:v15 err:&cf];

      if (v15) {
        CFRelease(v15);
      }
      if (v17)
      {
        uint64_t v18 = sub_100202028(v17, (uint64_t)&cf);
        if (v18 && (uint64_t v19 = SOSBackupSliceKeyBagCreateFromData()) != 0)
        {
          CFStringRef v20 = (const void *)v19;
          int v21 = SOSBKSBPrefixedKeyIsInKeyBag();
          CFRelease(v20);
        }
        else
        {
          int v21 = 0;
        }
        CFRelease(v17);
      }
      else
      {
        int v21 = 0;
        uint64_t v18 = 0;
      }
      CFRelease(v14);
      if (cf)
      {
        id v22 = sub_10000B070("backup");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v38 = v18;
          __int16 v39 = 2112;
          uint64_t v40 = 0;
          __int16 v41 = 2112;
          CFTypeRef v42 = cf;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to find BKSB: %@, %@ (%@)", buf, 0x20u);
        }

        CFTypeRef v23 = cf;
        if (cf)
        {
          CFTypeRef cf = 0;
          CFRelease(v23);

          if (v21) {
            return 2;
          }
LABEL_49:
          CFDataRef v10 = sub_1002024D8(kCFAllocatorDefault, v12, 0);
          if (!v10) {
            return valuePtr;
          }
          uint64_t valuePtr = 1;
          goto LABEL_51;
        }
      }

      if (!v21) {
        goto LABEL_49;
      }
      return 2;
    }
    v24 = self;
    id v25 = v24;
    if (!v24
      || ((v26 = kSOSViewiCloudIdentity, id v27 = [(SOSAccount *)v24 peerInfo], v26)
        ? (BOOL v28 = v27 == 0)
        : (BOOL v28 = 1),
          v28))
    {
      sub_100012A40(-50, 0, @"NULL account/peerInfo or viewName parameter");

      goto LABEL_56;
    }
    CFStringRef v29 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@-tomb", v26);
    v30 = sub_1001F2A70(v25, v29);
    v31 = v30;
    if (v30)
    {
      v32 = (const void *)sub_1002022D8(v30);
      [(SOSAccount *)v25 peerInfo];
      int v33 = SOSBKSBPeerBackupKeyIsInKeyBag();
      if (!v29) {
        goto LABEL_41;
      }
    }
    else
    {
      v32 = 0;
      int v33 = 0;
      if (!v29)
      {
LABEL_41:
        if (v31) {
          CFRelease(v31);
        }
        if (v32)
        {
          CFRelease(v32);

          if (v33) {
            return 2;
          }
        }
        else
        {

          if (v33) {
            return 2;
          }
        }
LABEL_56:
        [(SOSAccount *)v25 peerInfo];
        if (!SOSPeerInfoHasBackupKey()) {
          return valuePtr;
        }
        return 1;
      }
    }
    CFRelease(v29);
    goto LABEL_41;
  }
  if (a4)
  {
    *a4 = +[NSError errorWithDomain:kSOSErrorDomain code:9 userInfo:0];
  }
  return -1;
}

- (void)setPublicKeyStatus:(int)a3 forKey:(int)a4
{
  uint64_t valuePtr = a3;
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
  CFStringRef v7 = @"kSOSBackupKeyStatus";
  if (a4 != 1) {
    CFStringRef v7 = 0;
  }
  if (a4 == 2) {
    CFStringRef v8 = @"kSOSRecoveryKeyStatus";
  }
  else {
    CFStringRef v8 = v7;
  }
  if (v8) {
    sub_1001FF4C0(self, (uint64_t)v8, (uint64_t)v6, 0);
  }
  if (v6) {
    CFRelease(v6);
  }
}

- (BOOL)_onQueueEnsureInBackupRings:(__CFString *)a3
{
  CFStringRef v5 = [(SOSAccount *)self queue];
  dispatch_assert_queue_V2(v5);

  CFNumberRef v6 = self;
  if (!v6 || !a3)
  {
    sub_100012A40(-50, 0, @"NULL account or viewName parameter");
    goto LABEL_27;
  }
  CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@-tomb", a3);
  if (!v7)
  {
LABEL_27:

    return 0;
  }
  CFStringRef v8 = v7;
  CFNumberRef v9 = sub_1001F2A70(v6, v7);
  if (!v9)
  {
    CFRelease(v8);
    goto LABEL_27;
  }
  CFDataRef v10 = v9;
  CFDataRef v11 = sub_1002024D8(kCFAllocatorDefault, v6, 0);
  id v12 = (const void *)sub_1002022D8(v10);
  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  MutableForSOSPeerInfosByID = (const void *)CFSetCreateMutableForSOSPeerInfosByID();
  CFStringRef v15 = [(SOSAccount *)v6 trust];
  [v15 trustedCircle];
  [(SOSAccount *)v6 accountKey];
  v21[6] = _NSConcreteStackBlock;
  v21[7] = 3221225472;
  v21[8] = sub_1001EA3E0;
  v21[9] = &unk_100308DD0;
  v21[10] = Mutable;
  v21[11] = MutableForSOSPeerInfosByID;
  SOSCircleForEachBackupCapablePeerForView();

  CFMutableSetRef v16 = sub_10022F964((uint64_t)v10);
  int v17 = CFEqual(Mutable, v16);
  if (v12 && SOSBSKBAllPeersBackupKeysAreInKeyBag()) {
    int v18 = SOSBSKBHasThisRecoveryKey() ^ 1;
  }
  else {
    int v18 = 1;
  }
  if (v17) {
    int v19 = 0;
  }
  else {
    int v19 = v18;
  }
  CFRelease(v8);
  CFRelease(v10);
  if (v16) {
    CFRelease(v16);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (MutableForSOSPeerInfosByID)
  {
    CFRelease(MutableForSOSPeerInfosByID);

    if ((v19 & 1) == 0) {
      return 0;
    }
LABEL_24:
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001DCFE0;
    v21[3] = &unk_100307A48;
    v21[4] = v6;
    v21[5] = a3;
    return sub_1001E95F0(v6, (uint64_t)a3, 0, v21);
  }

  if (v19) {
    goto LABEL_24;
  }
  return 0;
}

- (BOOL)isInCircle:(__CFError *)a3
{
  unsigned int v3 = -[SOSAccount getCircleStatus:](self, "getCircleStatus:");
  if (v3) {
    SOSErrorCreate();
  }
  return v3 == 0;
}

- (int)getCircleStatus:(__CFError *)a3
{
  CFStringRef v5 = [(SOSAccount *)self trust];
  int v6 = [v5 getCircleStatusOnly:a3];

  if (sub_1001EEC4C(self)) {
    return v6;
  }
  int result = -1;
  if (a3 && !v6)
  {
    CFStringRef v8 = *a3;
    if (*a3)
    {
      *a3 = 0;
      CFRelease(v8);
    }
    SOSCreateError();
    return -1;
  }
  return result;
}

- (void)flattenToSaveBlock
{
  unsigned int v3 = [(SOSAccount *)self saveBlock];

  if (v3)
  {
    id v7 = 0;
    uint64_t v4 = [(SOSAccount *)self encodedData:&v7];
    id v5 = v7;
    int v6 = [(SOSAccount *)self saveBlock];
    ((void (**)(void, void *, id))v6)[2](v6, v4, v5);
  }
}

- (BOOL)sosEvaluateIfNeeded
{
  if (qword_10035D0A8 != -1) {
    dispatch_once(&qword_10035D0A8, &stru_100303AD8);
  }
  int v3 = byte_10035D0A0;
  uint64_t v4 = sub_10000B070("SOSMonitorMode");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sosEvaluateIfNeeded - SOS Compatibility Mode enabled, checking mode", buf, 2u);
    }

    BOOL v6 = -[OTSOSActualAdapter sosEnabled]_0();
    id v7 = sub_10000B070("SOSMonitorMode");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)id v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sosEvaluateIfNeeded - Turning on SOS for Compatibility mode", v25, 2u);
      }

      [(SOSAccount *)self SOSMonitorModeEnableSOS];
    }
    else
    {
      if (v8)
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sosEvaluateIfNeeded - Turning off SOS for Compatibility mode", v24, 2u);
      }

      [(SOSAccount *)self SOSMonitorModeDisableSOS];
    }
    CFDataRef v13 = +[SOSAnalytics logger];
    CFDataRef v14 = v13;
    CFStringRef v15 = @"SOSCompatMode";
    goto LABEL_22;
  }
  if (v5)
  {
    *(_WORD *)CFTypeRef v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sosEvaluateIfNeeded - checking circle", v23, 2u);
  }

  if (![(SOSAccount *)self accountKeyIsTrusted])
  {
    if (![(SOSAccount *)self SOSMonitorModeSOSIsActive]) {
      return [(SOSAccount *)self SOSMonitorModeSOSIsActive];
    }
    int v17 = sub_10000B070("SOSMonitorMode");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    __int16 v22 = 0;
    int v18 = "SOS is in monitor mode since the account key isn't trusted";
    int v19 = (uint8_t *)&v22;
    goto LABEL_30;
  }
  CFNumberRef v9 = [(SOSAccount *)self trust];
  [v9 trustedCircle];
  [(SOSAccount *)self accountKey];
  int IsLegacy = SOSCircleIsLegacy();

  unsigned int v11 = [(SOSAccount *)self SOSMonitorModeSOSIsActive];
  if (!IsLegacy)
  {
    if (!v11) {
      return [(SOSAccount *)self SOSMonitorModeSOSIsActive];
    }
    int v17 = sub_10000B070("SOSMonitorMode");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    LOWORD(v20) = 0;
    int v18 = "Putting SOS into monitor mode due to circle change";
    int v19 = (uint8_t *)&v20;
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
LABEL_31:

    [(SOSAccount *)self SOSMonitorModeDisableSOS];
    CFDataRef v13 = +[SOSAnalytics logger];
    CFDataRef v14 = v13;
    CFStringRef v15 = @"SOSMonitorMode";
LABEL_22:
    [v13 logSuccessForEventNamed:v15, v20];

    return [(SOSAccount *)self SOSMonitorModeSOSIsActive];
  }
  if ((v11 & 1) == 0)
  {
    id v12 = sub_10000B070("SOSMonitorMode");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Putting SOS into active mode for circle change", v21, 2u);
    }

    [(SOSAccount *)self SOSMonitorModeEnableSOS];
    CFDataRef v13 = +[SOSAnalytics logger];
    CFDataRef v14 = v13;
    CFStringRef v15 = @"SOSLegacyMode";
    goto LABEL_22;
  }
  return [(SOSAccount *)self SOSMonitorModeSOSIsActive];
}

- (id)SOSMonitorModeSOSIsActiveDescription
{
  if ([(SOSAccount *)self SOSMonitorModeSOSIsActive]) {
    v2 = @"[SOS is active]";
  }
  else {
    v2 = @"[SOS is monitoring]";
  }

  return v2;
}

- (BOOL)SOSMonitorModeSOSIsActive
{
  [(SOSAccount *)self sosEnableValidityCheck];
  int v3 = [(SOSAccount *)self settings];
  unsigned __int8 v4 = [v3 BOOLForKey:@"SOSEnabled"];

  return v4;
}

- (void)SOSMonitorModeSOSIsActiveWithCallback:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, [(SOSAccount *)self SOSMonitorModeSOSIsActive]);
}

- (void)SOSMonitorModeEnableSOS
{
  int v3 = sub_10000B070("SOSMonitorMode");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting SOS to active", v5, 2u);
  }

  unsigned __int8 v4 = [(SOSAccount *)self settings];
  [v4 setBool:1 forKey:@"SOSEnabled"];
}

- (void)SOSMonitorModeDisableSOS
{
  int v3 = sub_10000B070("SOSMonitorMode");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disabling SOS from monitor mode", v5, 2u);
  }

  unsigned __int8 v4 = [(SOSAccount *)self settings];
  [v4 setBool:0 forKey:@"SOSEnabled"];
}

- (void)sosEnableValidityCheck
{
  int v3 = [(SOSAccount *)self settings];
  unsigned __int8 v4 = [v3 objectForKey:@"SOSEnabled"];

  if (!v4)
  {
    id v5 = +[SOSAnalytics logger];
    [v5 logSuccessForEventNamed:@"SOSInitialized"];

    BOOL v6 = sub_10000B070("SOSMonitorMode");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No value found for SOSMonitorMode initializing to Active", v7, 2u);
    }

    [(SOSAccount *)self SOSMonitorModeEnableSOS];
  }
}

- (void)removeV0Peers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001DD8FC;
  v5[3] = &unk_1003097A0;
  id v6 = a3;
  id v4 = v6;
  [(SOSAccount *)self performTransaction:v5];
}

- (void)setWatchdogParmeters:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  Class v7 = NSClassFromString(@"SecdWatchdog");
  if (v7)
  {
    BOOL v8 = [(objc_class *)v7 watchdog];
    id v11 = 0;
    [v8 setWatchdogParameters:v5 error:&v11];
    id v9 = v11;

    v6[2](v6, v9);
  }
  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"failed to lookup SecdWatchdog class from ObjC runtime";
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v9 = +[NSError errorWithDomain:@"com.apple.securityd.watchdog" code:1 userInfo:v10];
    v6[2](v6, v9);

    id v6 = (void (**)(id, id))v10;
  }
}

- (void)getWatchdogParameters:(id)a3
{
  int v3 = (void (**)(id, id, void))a3;
  Class v4 = NSClassFromString(@"SecdWatchdog");
  if (v4)
  {
    id v5 = [(objc_class *)v4 watchdog];
    id v8 = [v5 watchdogParameters];

    v3[2](v3, v8, 0);
  }
  else
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"failed to lookup SecdWatchdog class from ObjC runtime";
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    Class v7 = +[NSError errorWithDomain:@"com.apple.securityd.watchdog" code:1 userInfo:v6];
    ((void (**)(id, id, void *))v3)[2](v3, 0, v7);
  }
}

- (void)rpcTriggerRingUpdate:(id)a3
{
  Class v4 = (void (**)(id, void))a3;
  [(SOSAccount *)self triggerRingUpdate];
  v4[2](v4, 0);
}

- (void)rpcTriggerBackup:(id)a3 complete:(id)a4
{
  id v6 = a3;
  Class v7 = (void (**)(id, void))a4;
  if (![v6 count])
  {
    id v8 = [(SOSAccount *)self kvs_message_transport];
    id v9 = [v8 SOSTransportMessageGetEngine];

    uint64_t v10 = sub_1001052A4((uint64_t)v9);
    id v6 = (id)v10;
  }
  [(SOSAccount *)self triggerBackupForPeers:v6];
  v7[2](v7, 0);
}

- (void)rpcTriggerSync:(id)a3 complete:(id)a4
{
  id v6 = a3;
  Class v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v8 = sub_10000B070("sync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "trigger a forced sync for %@", buf, 0xCu);
  }

  id v9 = (CFTypeRef *)(v21 + 3);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001DDFEC;
  v12[3] = &unk_100307528;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  CFDataRef v14 = &v20;
  CFStringRef v15 = &v16;
  sub_10002AF90(0, v9, (uint64_t)v12);
  v7[2](v7, *((unsigned __int8 *)v17 + 24), v21[3]);
  id v11 = (const void *)v21[3];
  if (v11)
  {
    v21[3] = 0;
    CFRelease(v11);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

- (void)importInitialSyncCredentials:(id)a3 complete:(id)a4
{
  CFTypeRef cf = 0;
  id v5 = (void (**)(id, uint64_t, CFTypeRef))a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000;
  v9[2] = sub_10014BF74;
  v9[3] = &unk_1003043F8;
  v9[4] = &cf;
  v9[5] = a3;
  uint64_t v6 = sub_10000CBA4(1, 1, 0, (uint64_t)&cf, (uint64_t)v9);
  v5[2](v5, v6, cf);

  CFTypeRef v7 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v7);
  }
}

- (void)initialSyncCredentials:(unsigned int)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  char v12 = a3;
  CFTypeRef cf = 0;
  id v13 = (void (**)(id, const __CFArray *, CFTypeRef))a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v18 = kSecurityRTCEventNameAcceptorFetchesInitialSyncData;
  sub_1001DE7E0();
  LOBYTE(v38) = a7;
  id v20 = [v17 initWithKeychainCircleMetrics:0 altDSID:v16 flowID:v15 deviceSessionID:v14 eventName:v18 testsAreEnabled:v19 canSendMetrics:v38 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];

  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFIndex Count = 0;
  if (v12)
  {
    uint64_t v23 = sub_10000C75C(@"inet", &qword_10035D020, (uint64_t)&unk_10035D018);
    if ((sub_10014BAC8((uint64_t)Mutable, 0, (const __CFBoolean *)@"com.apple.security.ckks", 0, v23, (__CFString **)&cf) & 1) == 0)
    {
      v36 = sub_10000B070("SecError");
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412290;
      CFTypeRef v43 = cf;
      v37 = "failed to collect CKKS-inet keys: %@";
      goto LABEL_30;
    }
    CFIndex Count = CFArrayGetCount(Mutable);
  }
  if ((v12 & 2) != 0)
  {
    uint64_t v25 = sub_10000C75C(@"genp", &qword_10035D010, (uint64_t)&unk_10035D008);
    if (sub_10014BAC8((uint64_t)Mutable, 0, (const __CFBoolean *)@"com.apple.ProtectedCloudStorage", 0, v25, (__CFString **)&cf))
    {
      uint64_t v26 = sub_10000C75C(@"inet", &qword_10035D020, (uint64_t)&unk_10035D018);
      if (sub_10014BAC8((uint64_t)Mutable, (v12 & 4) == 0, (const __CFBoolean *)@"com.apple.ProtectedCloudStorage", 0, v26, (__CFString **)&cf))
      {
        CFIndex v24 = CFArrayGetCount(Mutable) - Count;
        if ((v12 & 8) != 0) {
          goto LABEL_11;
        }
LABEL_10:
        CFIndex v27 = 0;
        goto LABEL_15;
      }
      v36 = sub_10000B070("SecError");
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412290;
      CFTypeRef v43 = cf;
      v37 = "failed to collect PCS-inet keys: %@";
    }
    else
    {
      v36 = sub_10000B070("SecError");
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412290;
      CFTypeRef v43 = cf;
      v37 = "failed to collect PCS-genp keys: %@";
    }
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 0xCu);
    goto LABEL_31;
  }
  CFIndex v24 = 0;
  if ((v12 & 8) == 0) {
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v28 = sub_10000C75C(@"genp", &qword_10035D010, (uint64_t)&unk_10035D008);
  if ((sub_10014BAC8((uint64_t)Mutable, 0, (const __CFBoolean *)@"com.apple.nanoregistry.migration", 0, v28, (__CFString **)&cf) & 1) == 0)
  {
    v36 = sub_10000B070("SecError");
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    CFTypeRef v43 = cf;
    v37 = "failed to collect com.apple.nanoregistry.migration-genp item: %@";
    goto LABEL_30;
  }
  uint64_t v29 = sub_10000C75C(@"genp", &qword_10035D010, (uint64_t)&unk_10035D008);
  if ((sub_10014BAC8((uint64_t)Mutable, 0, (const __CFBoolean *)@"com.apple.nanoregistry.migration2", 0, v29, (__CFString **)&cf) & 1) == 0)
  {
    v36 = sub_10000B070("SecError");
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    CFTypeRef v43 = cf;
    v37 = "failed to collect com.apple.nanoregistry.migration2-genp item: %@";
    goto LABEL_30;
  }
  uint64_t v30 = sub_10000C75C(@"genp", &qword_10035D010, (uint64_t)&unk_10035D008);
  if ((sub_10014BAC8((uint64_t)Mutable, 0, (const __CFBoolean *)@"com.apple.bluetooth", (const __CFBoolean *)@"BluetoothLESync", v30, (__CFString **)&cf) & 1) == 0)
  {
    v36 = sub_10000B070("SecError");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v43 = cf;
      v37 = "failed to collect com.apple.bluetooth-genp item: %@";
      goto LABEL_30;
    }
LABEL_31:
    CFIndex Count = 0;
    CFIndex v24 = 0;
    goto LABEL_10;
  }
  CFIndex v27 = CFArrayGetCount(Mutable) - (v24 + Count);
LABEL_15:
  v40[0] = kSecurityRTCFieldNumberOfTLKsFetched;
  v31 = +[NSNumber numberWithUnsignedLongLong:Count];
  v41[0] = v31;
  v40[1] = kSecurityRTCFieldNumberOfPCSItemsFetched;
  v32 = +[NSNumber numberWithUnsignedLongLong:v24];
  v41[1] = v32;
  v40[2] = kSecurityRTCFieldNumberOfBluetoothMigrationItemsFetched;
  int v33 = +[NSNumber numberWithUnsignedLongLong:v27];
  v41[2] = v33;
  v34 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];

  [v20 addMetrics:v34];
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v20, cf == 0);
  v13[2](v13, Mutable, cf);

  CFTypeRef v35 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v35);
  }
}

- (void)joinCircleWithBlob:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 version:(int)a8 complete:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = (void (**)(id, void, uint64_t))a9;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  __int16 v41 = _NSConcreteStackBlock;
  uint64_t v42 = 3221225472;
  CFTypeRef v43 = sub_1001DEF54;
  v44 = &unk_1003074D8;
  id v40 = v16;
  id v45 = v40;
  id v20 = v17;
  id v46 = v20;
  id v21 = v18;
  BOOL v52 = a7;
  id v47 = v21;
  v49 = &v53;
  id v22 = v15;
  int v51 = a8;
  id v48 = v22;
  v50 = &v57;
  [(SOSAccount *)self performTransaction:&v41];
  uint64_t v23 = [(SOSAccount *)self trust];
  unsigned int v24 = [v23 isInCircleOnly:0];

  if (v58[3])
  {
    uint64_t v25 = [(id)objc_opt_class() logger];
    uint64_t v26 = v58[3];
    v61[0] = @"SOSEnabled";
    BOOL v27 = -[OTSOSActualAdapter sosEnabled]_0();
    CFStringRef v28 = @"compat_disabled";
    if (v27) {
      CFStringRef v28 = @"compat_enabled";
    }
    v62[0] = v28;
    v62[1] = @"Pairing";
    v61[1] = @"SOSJoinMethod";
    v61[2] = @"JoiningSOSResult";
    CFStringRef v29 = @"not_in_circle";
    if (v24) {
      CFStringRef v29 = @"in_circle";
    }
    v62[2] = v29;
    v61[3] = @"CircleContainsLegacy";
    uint64_t v30 = [(SOSAccount *)self trust];
    [v30 trustedCircle];
    [(SOSAccount *)self accountKey];
    int IsLegacy = SOSCircleIsLegacy();
    CFStringRef v32 = @"does_not_contain_legacy";
    if (IsLegacy) {
      CFStringRef v32 = @"contains_legacy";
    }
    v62[3] = v32;
    int v33 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:4];
    [v25 logResultForEvent:@"SOSDeferralEventPairing" hardFailure:0 result:v26 withAttributes:v33];
  }
  else
  {
    if (-[OTSOSActualAdapter sosEnabled]_0()) {
      CFStringRef v34 = @"compat_enabled";
    }
    else {
      CFStringRef v34 = @"compat_disabled";
    }
    if (v24) {
      CFStringRef v35 = @"in_circle";
    }
    else {
      CFStringRef v35 = @"not_in_circle";
    }
    v36 = [(SOSAccount *)self trust];
    [v36 trustedCircle];
    [(SOSAccount *)self accountKey];
    int v37 = SOSCircleIsLegacy();
    CFStringRef v38 = @"does_not_contain_legacy";
    if (v37) {
      CFStringRef v38 = @"contains_legacy";
    }
    uint64_t v25 = +[NSString stringWithFormat:@"%@-%@-%@-%@", v34, @"Pairing", v35, v38, v40, v41, v42, v43, v44, v45, v46, v47];

    uint64_t v30 = [(id)objc_opt_class() logger];
    [v30 logSuccessForEventNamed:v25];
  }

  v19[2](v19, *((unsigned __int8 *)v54 + 24), v58[3]);
  __int16 v39 = (const void *)v58[3];
  if (v39)
  {
    v58[3] = 0;
    CFRelease(v39);
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
}

- (void)circleJoiningBlob:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 applicant:(id)a7 complete:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = (void (**)(id, uint64_t, uint64_t))a8;
  id v19 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v20 = kSecurityRTCEventNameCreateSOSCircleBlob;
  sub_1001DE7E0();
  LOBYTE(v26) = a6;
  id v22 = [v19 initWithKeychainCircleMetrics:0 altDSID:v14 flowID:v15 deviceSessionID:v16 eventName:v20 testsAreEnabled:v21 canSendMetrics:v26 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  CFStringRef v38 = sub_1001DF9B8;
  __int16 v39 = sub_1001DF9C8;
  id v40 = 0;
  uint64_t v23 = (const void *)SOSPeerInfoCreateFromData();
  if (v23)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1001DF9D0;
    v27[3] = &unk_1003074B0;
    v27[4] = self;
    v31 = &v35;
    id v28 = v14;
    id v29 = v15;
    BOOL v34 = a6;
    id v30 = v16;
    CFStringRef v32 = &v41;
    int v33 = v23;
    sub_10002B000(0, (uint64_t)v27);
    CFRelease(v23);
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v22 success:v36[5] != 0 error:v42[3]];
    v18[2](v18, v36[5], v42[3]);
    unsigned int v24 = (const void *)v42[3];
    if (v24)
    {
      v42[3] = 0;
      CFRelease(v24);
    }
  }
  else
  {
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v22 success:0 error:v42[3]];
    v18[2](v18, 0, v42[3]);
    uint64_t v25 = (const void *)v42[3];
    if (v25)
    {
      v42[3] = 0;
      CFRelease(v25);
    }
  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
}

- (void)accountStatus:(id)a3
{
  Class v4 = (void (**)(id, void *, id))a3;
  id v5 = [(SOSAccount *)self accountStatusInternal];
  id v10 = 0;
  uint64_t v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:3 error:&v10];
  id v7 = v10;
  if (!v6)
  {
    id v8 = sub_10000B070("accountLogState");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 localizedDescription];
      *(_DWORD *)buf = 138412290;
      char v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error during accountStatus JSONification: %@", buf, 0xCu);
    }
  }
  v4[2](v4, v6, v7);
}

- (id)accountStatusInternal
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  Class v4 = (__CFString *)sub_1001E0490(self);
  [v3 setObject:v4 forKeyedSubscript:@"AccountHeader"];

  id v5 = [(SOSAccount *)self trust];
  id v6 = [v5 trustedCircle];

  [(SOSAccount *)self peerID];
  if (v6)
  {
    [(SOSAccount *)self accountKey];
    id v7 = (void *)SOSCircleCopyStateString();
    [v3 setObject:v7 forKeyedSubscript:@"CircleHeader"];

    id v18 = objc_alloc_init((Class)NSMutableArray);
    id v8 = v18;
    SOSCircleForEachPeer();
    [v3 setObject:v8 forKeyedSubscript:@"CirclePeers"];
    id v17 = objc_alloc_init((Class)NSMutableArray);
    id v9 = v17;
    SOSCircleForEachRetiredPeer();
    [v3 setObject:v9 forKeyedSubscript:@"CircleRetiredPeers"];
    id v16 = objc_alloc_init((Class)NSMutableArray);
    id v10 = v16;
    SOSCircleForEachiCloudIdentityPeer();
    [v3 setObject:v10 forKeyedSubscript:@"iCloudIdentityPeers"];
    id v15 = objc_alloc_init((Class)NSMutableArray);
    id v11 = v15;
    SOSCircleForEachApplicant();
    [v3 setObject:v11 forKeyedSubscript:@"CircleApplicants"];
    id v14 = objc_alloc_init((Class)NSMutableArray);
    id v12 = v14;
    SOSCircleForEachRejectedApplicant();
    [v3 setObject:v12 forKeyedSubscript:@"CircleRejections"];
  }

  return v3;
}

- (void)iCloudIdentityStatus:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E0920;
  v5[3] = &unk_100307410;
  id v6 = a3;
  id v4 = v6;
  [(SOSAccount *)self iCloudIdentityStatus_internal:v5];
}

- (void)iCloudIdentityStatus_internal:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v37 = 0;
  id v5 = objc_opt_new();
  if ([(SOSAccount *)self isInCircle:&v37])
  {
    id v6 = objc_alloc_init((Class)NSMutableSet);
    id v7 = [(SOSAccount *)self trust];
    [v7 trustedCircle];
    CFStringRef v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    BOOL v34 = sub_1001E0F90;
    uint64_t v35 = &unk_100308348;
    id v8 = v6;
    id v36 = v8;
    SOSCircleForEachiCloudIdentityPeer();

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001E1004;
    v30[3] = &unk_1003073E8;
    id v9 = objc_alloc_init((Class)NSMutableSet);
    id v31 = v9;
    id v10 = v30;
    CFTypeRef result = 0;
    CFDictionaryRef v16 = sub_100139704(kCFAllocatorDefault, (int)kSecReturnAttributes, (int)kCFBooleanTrue, v11, v12, v13, v14, v15, (uint64_t)kSecMatchLimit, (uint64_t)kSecMatchLimitAll);
    if (!SecItemCopyMatching(v16, &result)
      && (CFArrayRef v25 = (const __CFArray *)result) != 0
      && (CFTypeID v26 = CFGetTypeID(result), v26 == CFArrayGetTypeID()))
    {
      BOOL v27 = sub_10000B070("iCloudIdentity");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        CFIndex Count = CFArrayGetCount(v25);
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = Count;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Screening %ld icloud private key candidates", (uint8_t *)&buf, 0xCu);
      }

      if (v16) {
        CFRelease(v16);
      }
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      id v40 = sub_1001F08D8;
      uint64_t v41 = &unk_100307BD0;
      uint64_t v42 = v10;
      v43.length = CFArrayGetCount(v25);
      v43.id location = 0;
      CFArrayApplyFunction(v25, v43, (CFArrayApplierFunction)sub_1001F0B34, &buf);
      CFTypeRef v29 = result;
      if (result)
      {
        CFTypeRef result = 0;
        CFRelease(v29);
      }
    }
    else
    {
      id v17 = sub_10000B070("iCloudIdentity");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Can't get iCloud Identity private key candidates", (uint8_t *)&buf, 2u);
      }

      if (v16) {
        CFRelease(v16);
      }
      CFTypeRef v18 = result;
      if (result)
      {
        CFTypeRef result = 0;
        CFRelease(v18);
      }
    }

    id v19 = [v8 mutableCopy];
    if ([v8 count] && objc_msgSend(v9, "count"))
    {
      [v19 intersectSet:v9];
    }
    else
    {

      id v19 = 0;
    }
    id v20 = [v9 mutableCopy];
    if ([v8 count] && objc_msgSend(v20, "count")) {
      [v20 minusSet:v8];
    }
    id v21 = [v8 mutableCopy];
    if ([v21 count] && objc_msgSend(v9, "count")) {
      [v21 minusSet:v9];
    }
    id v22 = [v19 allObjects];
    [v5 setObject:v22 forKeyedSubscript:@"completeIdentity"];

    uint64_t v23 = [v20 allObjects];
    [v5 setObject:v23 forKeyedSubscript:@"keyOnly"];

    unsigned int v24 = [v21 allObjects];
    [v5 setObject:v24 forKeyedSubscript:@"peerOnly"];

    v4[2](v4, v5, 0);
  }
  else
  {
    v4[2](v4, v5, v37);
  }
}

- (void)ghostBustInfo:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = objc_opt_new();
  unsigned __int8 v6 = +[SOSAccount ghostBustGetRampSettings];
  id v7 = [(SOSAccount *)self ghostBustGetDate];
  id v8 = [v7 description];

  if (v6) {
    CFStringRef v9 = @"ON";
  }
  else {
    CFStringRef v9 = @"OFF";
  }
  [v5 setObject:v9 forKeyedSubscript:@"SOSGhostBustBySerialNumber"];
  if ((v6 & 2) != 0) {
    CFStringRef v10 = @"ON";
  }
  else {
    CFStringRef v10 = @"OFF";
  }
  [v5 setObject:v10 forKeyedSubscript:@"SOSGhostBustByMID"];
  if ((v6 & 4) != 0) {
    CFStringRef v11 = @"ON";
  }
  else {
    CFStringRef v11 = @"OFF";
  }
  [v5 setObject:v11 forKeyedSubscript:@"SOSGhostBustSerialByAge"];
  [v5 setObject:v8 forKeyedSubscript:@"SOSAccountGhostBustDate"];
  id v16 = 0;
  int v12 = +[NSJSONSerialization dataWithJSONObject:v5 options:3 error:&v16];
  id v13 = v16;
  if (!v12)
  {
    int v14 = sub_10000B070("ghostbust");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v13 localizedDescription];
      *(_DWORD *)long long buf = 138412290;
      CFTypeRef v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error during ghostBustInfo JSONification: %@", buf, 0xCu);
    }
  }
  v4[2](v4, v12, v13);
}

- (void)ghostBustTriggerTimed:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v8 = v6;
  if (!v4)
  {
    uint64_t v7 = +[SOSAccount ghostBustGetRampSettings];
    id v6 = v8;
    uint64_t v4 = v7;
  }
  [(SOSAccount *)self ghostBust:v4 complete:v6];
}

- (void)ghostBustPeriodic:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  id v6 = [(SOSAccount *)self ghostBustGetDate];
  [v6 timeIntervalSinceNow];
  if (v7 <= 0.0)
  {
    if (v4) {
      [(SOSAccount *)self ghostBust:v4 complete:v8];
    }
    else {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
}

- (void)ghostBust:(unsigned int)a3 complete:(id)a4
{
  id v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  if (+[SOSAuthKitHelpers accountIsCDPCapable])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001E1540;
    v7[3] = &unk_1003073C0;
    CFStringRef v9 = v12;
    void v7[4] = self;
    CFStringRef v10 = v13;
    unsigned int v11 = a3;
    id v8 = v6;
    +[SOSAuthKitHelpers activeMIDs:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);
}

- (void)ghostBustSchedule
{
  id v3 = [(SOSAccount *)self ghostBustGetDate];
  if (!v3)
  {
    [(SOSAccount *)self ghostBustFollowup];
    id v3 = 0;
  }
}

- (void)ghostBustFollowup
{
  id v3 = [(SOSAccount *)self settings];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.security.sosaccount"];
    [(SOSAccount *)self setSettings:v4];
  }
  SOSCreateRandomDateBetweenNowPlus();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(SOSAccount *)self settings];
  [v5 setValue:v6 forKey:@"ghostbustdate"];
}

- (BOOL)ghostBustCheckDate
{
  v2 = [(SOSAccount *)self ghostBustGetDate];
  id v3 = v2;
  BOOL v5 = 0;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    if (v4 <= 0.0) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (id)ghostBustGetDate
{
  id v3 = [(SOSAccount *)self settings];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.security.sosaccount"];
    [(SOSAccount *)self setSettings:v4];
  }
  BOOL v5 = [(SOSAccount *)self settings];
  id v6 = [v5 valueForKey:@"ghostbustdate"];

  return v6;
}

- (void)circleHash:(id)a3
{
  id v4 = (void (**)(id, void, CFTypeRef))a3;
  CFTypeRef v13 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CFStringRef v10 = sub_1001DF9B8;
  unsigned int v11 = sub_1001DF9C8;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001E1F50;
  v6[3] = &unk_100307348;
  v6[4] = self;
  v6[5] = &v7;
  sub_10002AF90(0, &v13, (uint64_t)v6);
  v4[2](v4, v8[5], v13);
  CFTypeRef v5 = v13;
  if (v13)
  {
    CFTypeRef v13 = 0;
    CFRelease(v5);
  }
  _Block_object_dispose(&v7, 8);
}

- (void)myPeerInfo:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  int v15 = (void (**)(id, uint64_t, uint64_t))a7;
  id v16 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v17 = kSecurityRTCEventNameCreatesSOSApplication;
  sub_1001DE7E0();
  LOBYTE(v21) = a6;
  id v19 = [v16 initWithKeychainCircleMetrics:0 altDSID:v12 flowID:v13 deviceSessionID:v14 eventName:v17 testsAreEnabled:v18 canSendMetrics:v21 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  CFTypeID v26 = sub_1001DF9B8;
  BOOL v27 = sub_1001DF9C8;
  id v28 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001E2264;
  v22[3] = &unk_100309250;
  v22[4] = &v29;
  v22[5] = &v23;
  [(SOSAccount *)self performTransaction:v22];
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v19 success:v24[5] != 0 error:v30[3]];
  v15[2](v15, v24[5], v30[3]);
  id v20 = (const void *)v30[3];
  if (v20)
  {
    v30[3] = 0;
    CFRelease(v20);
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

- (void)stashAccountCredential:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = v13;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  id v21 = v12;
  SOSDoWithCredentialsWhileUnlocked();
}

- (void)validatedStashedAccountCredential:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v25 = 0;
  if ([(SOSAccount *)self syncWaitAndFlush:v12 flowID:v13 deviceSessionID:v14 canSendMetrics:v8 error:&v25])
  {
    id v16 = [(SOSAccount *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E2F5C;
    block[3] = &unk_1003072D0;
    id v19 = v12;
    id v20 = v13;
    BOOL v24 = v8;
    id v21 = v14;
    id v22 = self;
    id v23 = v15;
    dispatch_async(v16, block);
  }
  else
  {
    (*((void (**)(id, void, const void *))v15 + 2))(v15, 0, v25);
    id v17 = v25;
    if (v25)
    {
      uint64_t v25 = 0;
      CFRelease(v17);
    }
  }
}

- (BOOL)syncWaitAndFlush:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(__CFError *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = sub_10000B070("pairing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sync and wait starting", (uint8_t *)&buf, 2u);
  }

  id v15 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  sub_1001DE7E0();
  uint64_t v16 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  LOBYTE(v33) = a6;
  id v18 = [v15 initWithKeychainCircleMetrics:0 altDSID:v11 flowID:v12 deviceSessionID:v13 eventName:kSecurityRTCEventNameKVSSyncAndWait testsAreEnabled:v17 canSendMetrics:v33 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  id v20 = sub_10000B070("fresh");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "EFP calling SOSCloudKeychainSynchronizeAndWait", (uint8_t *)&buf, 2u);
  }

  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  id v40 = sub_1001E3660;
  uint64_t v41 = &unk_1003097F0;
  CFRange v43 = &v35;
  uint64_t v44 = a7;
  dispatch_semaphore_t v42 = v19;
  id v21 = v19;
  _os_activity_initiate((void *)&_mh_execute_header, "CloudCircle EFRESH", OS_ACTIVITY_FLAG_DEFAULT, &buf);

  int v22 = *((unsigned __int8 *)v36 + 24);
  _Block_object_dispose(&v35, 8);
  if (v22)
  {
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v18 success:1 error:0];
    id v23 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    sub_1001DE7E0();
    LOBYTE(v34) = a6;
    id v25 = [v23 initWithKeychainCircleMetrics:0 altDSID:v11 flowID:v12 deviceSessionID:v13 eventName:kSecurityRTCEventNameFlush testsAreEnabled:v24 canSendMetrics:v34 category:v16];
    BOOL v26 = sub_1001E2B4C();
    if (v26)
    {
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v25 success:1 error:0];
      BOOL v27 = sub_10000B070("pairing");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "finished sync and wait", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      id v30 = sub_10000B070("pairing");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        if (a7) {
          uint64_t v31 = *a7;
        }
        else {
          uint64_t v31 = 0;
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "failed flush: %@", (uint8_t *)&buf, 0xCu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v25 success:0 error:*a7];
    }
  }
  else
  {
    id v28 = sub_10000B070("pairing");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      if (a7) {
        uint64_t v29 = *a7;
      }
      else {
        uint64_t v29 = 0;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "failed sync and wait: %@", (uint8_t *)&buf, 0xCu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v18 success:0 error:*a7];
    BOOL v26 = 0;
  }

  return v26;
}

- (void)assertStashedAccountCredential:(id)a3
{
  id v4 = a3;
  CFTypeRef v5 = [(SOSAccount *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E3998;
  v7[3] = &unk_100307280;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)stashedCredentialPublicKey:(id)a3
{
  id v4 = a3;
  CFTypeRef v5 = [(SOSAccount *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E3AAC;
  v7[3] = &unk_100307280;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)rateLimitingPerformanceCounters:(id)a3
{
  CFTypeRef v5 = (void (**)(void))a3;
  if (sub_1001DCC24(self, @"RateLimitCounters"))
  {
    v5[2]();
  }
  else
  {
    id v4 = +[NSDictionary dictionary];
    ((void (*)(void (**)(void), void *))v5[2])(v5, v4);
  }
}

- (void)setBypass:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SOSAccount *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E3CA0;
  block[3] = &unk_100307E80;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)kvsPerformanceCounters:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(-2, 0);
  id v6 = v3;
  id v5 = v3;
  SOSCloudKeychainRequestPerfCounters();
}

- (void)userPublicKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSAccount *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E3E60;
  v7[3] = &unk_100307280;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setAccountInBypassMode:(BOOL)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SOSAccount *)self gestalt];
    uint64_t v7 = [v5 gestalt];
    if (![v6 isEqual:v7])
    {
      BOOL v19 = 0;
LABEL_19:

      goto LABEL_20;
    }
    id v8 = [(SOSAccount *)self trust];
    id v9 = [v8 trustedCircle];
    id v10 = [v5 trust];
    id v11 = [v10 trustedCircle];
    if (v9 && v11)
    {
      if (CFEqual(v9, v11))
      {
LABEL_6:
        id v12 = [(SOSAccount *)self trust];
        id v13 = [v12 expansion];
        int v22 = [v5 trust];
        id v14 = [v22 expansion];
        id v23 = v13;
        if ([v13 isEqual:v14])
        {
          id v21 = v12;
          id v15 = [(SOSAccount *)self trust];
          id v16 = [v15 fullPeerInfo];
          uint64_t v17 = [v5 trust];
          id v18 = [v17 fullPeerInfo];
          if (v16 && v18) {
            BOOL v19 = CFEqual(v16, v18) != 0;
          }
          else {
            BOOL v19 = v16 == v18;
          }

          id v12 = v21;
        }
        else
        {
          BOOL v19 = 0;
        }

        goto LABEL_18;
      }
    }
    else if (v9 == v11)
    {
      goto LABEL_6;
    }
    BOOL v19 = 0;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v19 = 0;
LABEL_20:

  return v19;
}

- (void)startStateMachine
{
  id v2 = [(SOSAccount *)self stateMachine];
  [v2 startOperation];
}

- (SOSAccount)initWithGestalt:(__CFDictionary *)a3 factory:(SOSDataSourceFactory *)a4
{
  v35.receiver = self;
  v35.super_class = (Class)SOSAccount;
  id v6 = [(SOSAccount *)&v35 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("Account Queue", 0);
    id v8 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v7;

    id v9 = [objc_alloc((Class)NSDictionary) initWithDictionary:a3];
    id v10 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v9;

    id v11 = [SOSAccountTrustClassic alloc];
    id v12 = +[NSMutableSet set];
    id v13 = +[NSMutableDictionary dictionary];
    id v14 = [(SOSAccountTrustClassic *)v11 initWithRetirees:v12 fpi:0 circle:0 departureCode:0 peerExpansion:v13];

    id v15 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v14;
    id v16 = v14;

    v6[8] = 0;
    *((void *)v6 + 5) = 0;
    uint64_t v17 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 14) = a4;
    *((void *)v6 + 15) = 0;

    id v18 = (void *)*((void *)v6 + 13);
    *((void *)v6 + 13) = 0;

    *((_DWORD *)v6 + 6) = -1;
    uint64_t v19 = +[NSMutableArray array];
    id v20 = (void *)*((void *)v6 + 20);
    *((void *)v6 + 20) = v19;

    id v21 = (void *)*((void *)v6 + 16);
    *((void *)v6 + 16) = 0;

    int v22 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = 0;

    id v23 = (void *)*((void *)v6 + 19);
    *((void *)v6 + 19) = 0;

    uint64_t v24 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = 0;

    *(_DWORD *)(v6 + 9) = 0;
    id v25 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = 0;

    BOOL v26 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = 0;

    uint64_t v27 = +[NSMutableDictionary dictionary];
    id v28 = (void *)*((void *)v6 + 21);
    *((void *)v6 + 21) = v27;

    v6[13] = 0;
    uint64_t v29 = (void *)*((void *)v6 + 22);
    *((void *)v6 + 22) = 0;

    *((void *)v6 + 4) = 0;
    *((void *)v6 + 6) = 0;
    *((void *)v6 + 7) = 0;
    id v30 = (void *)*((void *)v6 + 23);
    *((void *)v6 + 23) = 0;

    id v31 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.security.sosaccount"];
    uint64_t v32 = (void *)*((void *)v6 + 24);
    *((void *)v6 + 24) = v31;

    [v6 SOSMonitorModeSOSIsActive];
    [v6 ensureFactoryCircles];
    CFStringRef v33 = sub_1001FF568(v6);
    if (v33) {
      CFRelease(v33);
    }
    v6[21] = 0;
    *(_DWORD *)(v6 + 17) = 0;
    [v6 setupStateMachine];
  }
  return (SOSAccount *)v6;
}

- (void)ensureOctagonPeerKeys
{
  id v3 = +[CKKSLockStateTracker globalTracker];
  if (v3 && ([v3 isLocked] & 1) == 0)
  {
    id v4 = [(SOSAccount *)self trust];
    id v5 = [(SOSAccount *)self circle_transport];
    [v4 ensureOctagonPeerKeys:v5];
  }

  _objc_release_x1();
}

- (BOOL)ensureFactoryCircles
{
  if ([(SOSAccount *)self factory])
  {
    id v3 = (void *)(*(uint64_t (**)(void))[(SOSAccount *)self factory])();
    if (!v3)
    {
      LOBYTE(v8) = 0;
LABEL_19:

      return (char)v8;
    }
    id v4 = self;
    id v5 = [(SOSAccount *)v4 trust];
    id v6 = [v5 trustedCircle];
    if (v6)
    {
      dispatch_queue_t v7 = v6;
      CFRetain(v6);
    }
    else
    {
      dispatch_queue_t v7 = (const void *)SOSCircleCreate();
      [(SOSAccount *)v4 setKey_interests_need_updating:1];
      [v5 setTrustedCircle:v7];
      [(SOSAccount *)v4 sosEvaluateIfNeeded];

      if (!v7)
      {
LABEL_9:
        id v9 = v4;
        id v10 = [(SOSAccount *)v9 key_transport];

        if (v10)
        {
          id v11 = [(SOSAccount *)v9 key_transport];
          sub_10020CA18(v11);
        }
        id v12 = [(SOSAccount *)v9 circle_transport];

        if (v12)
        {
          id v13 = [(SOSAccount *)v9 circle_transport];
          sub_10020C97C(v13);
        }
        id v14 = [(SOSAccount *)v9 kvs_message_transport];

        if (v14)
        {
          id v15 = [(SOSAccount *)v9 kvs_message_transport];
          sub_10020C89C(v15);
        }
        id v16 = [[CKKeyParameter alloc] initWithAccount:v9];
        [(SOSAccount *)v9 setKey_transport:v16];

        uint64_t v17 = [[SOSKVSCircleStorageTransport alloc] initWithAccount:v9 andCircleName:v3];
        [(SOSAccount *)v9 setCircle_transport:v17];

        id v8 = [(SOSAccount *)v9 key_transport];

        if (v8)
        {
          id v8 = [(SOSAccount *)v9 circle_transport];

          if (v8)
          {
            id v8 = [[SOSMessageKVS alloc] initWithAccount:v9 andName:v3];
            [(SOSAccount *)v9 setKvs_message_transport:v8];

            id v18 = [(SOSAccount *)v9 kvs_message_transport];
            LOBYTE(v8) = v18 != 0;
          }
        }

        goto LABEL_19;
      }
    }
    CFRelease(v7);
    goto LABEL_9;
  }
  LOBYTE(v8) = 0;
  return (char)v8;
}

- (NSString)peerID
{
  id v2 = [(SOSAccount *)self trust];
  id v3 = [v2 peerID];

  return (NSString *)v3;
}

- (__OpaqueSOSFullPeerInfo)fullPeerInfo
{
  id v2 = [(SOSAccount *)self trust];
  id v3 = (__OpaqueSOSFullPeerInfo *)[v2 fullPeerInfo];

  return v3;
}

- (__OpaqueSOSPeerInfo)peerInfo
{
  id v2 = [(SOSAccount *)self trust];
  id v3 = (__OpaqueSOSPeerInfo *)[v2 peerInfo];

  return v3;
}

- (BOOL)hasPeerInfo
{
  return [(SOSAccount *)self fullPeerInfo] != 0;
}

- (void)setPeerPublicKey:(__SecKey *)a3
{
  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey != a3)
  {
    if (!a3 || (CFRetain(a3), (peerPublicKey = self->_peerPublicKey) != 0)) {
      CFRelease(peerPublicKey);
    }
    self->_peerPublicKey = a3;
  }
}

- (void)setPreviousAccountKey:(__SecKey *)a3
{
  previousAccountKey = self->_previousAccountKey;
  if (previousAccountKey != a3)
  {
    if (!a3 || (CFRetain(a3), (previousAccountKey = self->_previousAccountKey) != 0)) {
      CFRelease(previousAccountKey);
    }
    self->_previousAccountKey = a3;
  }
}

- (void)setAccountPrivateKey:(__SecKey *)a3
{
  accountPrivateKey = self->_accountPrivateKey;
  if (accountPrivateKey != a3)
  {
    if (!a3 || (CFRetain(a3), (accountPrivateKey = self->_accountPrivateKey) != 0)) {
      CFRelease(accountPrivateKey);
    }
    self->_accountPrivateKey = a3;
  }
}

- (void)setAccountKey:(__SecKey *)a3
{
  accountKey = self->_accountKey;
  if (accountKey != a3)
  {
    if (!a3 || (CFRetain(a3), (accountKey = self->_accountKey) != 0)) {
      CFRelease(accountKey);
    }
    self->_accountKey = a3;
  }
}

- (void)dealloc
{
  if (self)
  {
    accountKey = self->_accountKey;
    if (accountKey)
    {
      self->_accountKey = 0;
      CFRelease(accountKey);
    }
    accountPrivateKey = self->_accountPrivateKey;
    if (accountPrivateKey)
    {
      self->_accountPrivateKey = 0;
      CFRelease(accountPrivateKey);
    }
    previousAccountKey = self->_previousAccountKey;
    if (previousAccountKey)
    {
      self->_previousAccountKey = 0;
      CFRelease(previousAccountKey);
    }
    peerPublicKey = self->_peerPublicKey;
    if (peerPublicKey)
    {
      self->_peerPublicKey = 0;
      CFRelease(peerPublicKey);
    }
    octagonSigningFullKeyRef = self->_octagonSigningFullKeyRef;
    if (octagonSigningFullKeyRef)
    {
      self->_octagonSigningFullKeyRef = 0;
      CFRelease(octagonSigningFullKeyRef);
    }
    octagonEncryptionFullKeyRef = self->_octagonEncryptionFullKeyRef;
    if (octagonEncryptionFullKeyRef)
    {
      self->_octagonEncryptionFullKeyRef = 0;
      CFRelease(octagonEncryptionFullKeyRef);
    }
    id v9 = [(SOSAccount *)self performBackups];
    [v9 cancel];

    id v10 = [(SOSAccount *)self performRingUpdates];
    [v10 cancel];

    id v11 = [(SOSAccount *)self stateMachine];
    [v11 haltOperation];
  }
  v12.receiver = self;
  v12.super_class = (Class)SOSAccount;
  [(SOSAccount *)&v12 dealloc];
}

+ (id)urlForSOSAccountSettings
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v2 = sub_10002B9E8(1, @"SOSAccountSettings.pb");

  return v2;
}

+ (unsigned)ghostBustGetRampSettings
{
  CFURLRef v2 = +[OTManager manager];
  if ([v2 ghostbustByMidEnabled]) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = v3 | [v2 ghostbustBySerialEnabled];
  if ([v2 ghostbustByAgeEnabled]) {
    int v5 = 4;
  }
  else {
    int v5 = 0;
  }
  unsigned int v6 = v4 | v5;

  return v6;
}

- (id)encodedData:(id *)a3
{
  int v5 = [(SOSAccount *)self trust];
  id v6 = [v5 getDEREncodedSize:self err:a3];

  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001F19D4;
    v9[3] = &unk_100307DA8;
    v9[4] = self;
    v9[5] = a3;
    dispatch_queue_t v7 = +[NSMutableData dataWithSpace:v6 DEREncode:v9];
  }
  else
  {
    dispatch_queue_t v7 = 0;
  }

  return v7;
}

+ (id)accountFromData:(id)a3 factory:(SOSDataSourceFactory *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (char *)[v8 length];
  id v10 = v8;
  id v11 = [v10 bytes];

  id v14 = v11;
  objc_super v12 = [a1 accountFromDER:&v14 end:&v9[(void)v11] factory:a4 error:a5];

  return v12;
}

+ (id)accountFromDER:(const char *)a3 end:(const char *)a4 factory:(SOSDataSourceFactory *)a5 error:(id *)a6
{
  CFTypeRef v73 = 0;
  v76 = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v77 = 0;
  *a3 = (const char *)ccder_decode_constructed_tl();
  id v9 = (const char *)ccder_decode_uint64();
  *a3 = v9;
  if (!v9)
  {
    SOSCreateError();
    if (!a6) {
      goto LABEL_30;
    }
    goto LABEL_95;
  }
  if (v77 == 6)
  {
    uint64_t v32 = v76;
    *(void *)long long buf = 0;
    *(void *)v88 = 0;
    uint64_t v33 = ((uint64_t (*)(SOSDataSourceFactory *))a5->var0)(a5);
    uint64_t v87 = 0;
    uint64_t v34 = (const char *)sub_10000EEF8(kCFAllocatorDefault, &v87, &v73, (uint64_t)*a3, (uint64_t)v76);
    *a3 = v34;
    if (!v34) {
      goto LABEL_94;
    }
    objc_super v35 = (const void *)v87;
    id v36 = sub_1001E5360(v87, (uint64_t)a5);
    if (v35) {
      CFRelease(v35);
    }
    uint64_t v37 = [v36 trust];
    *a3 = (const char *)sub_100029AC0(kCFAllocatorDefault, (CFMutableArrayRef *)buf, &v73, (uint64_t)*a3, (uint64_t)v32);
    uint64_t v87 = 5;
    *a3 = (const char *)ccder_decode_uint64();
    [v37 setDepartureCode:v87];
    unsigned __int8 v86 = -86;
    *a3 = (const char *)sub_1000295D4((uint64_t)&v86, (uint64_t)*a3);
    [v36 setAccountKeyIsTrusted:v86];
    v84 = 0;
    v85 = 0;
    *a3 = (const char *)sub_1001ED6A4();
    *a3 = (const char *)sub_1001ED6A4();
    [v36 setAccountKey:v85];
    [v36 setPreviousAccountKey:v84];
    char v38 = v85;
    if (v85)
    {
      v85 = 0;
      CFRelease(v38);
    }
    __int16 v39 = v84;
    if (v84)
    {
      v84 = 0;
      CFRelease(v39);
    }
    v83 = 0;
    *a3 = (const char *)der_decode_data_or_null();
    id v40 = v83;
    [v36 setAccountKeyDerivationParameters:v83];

    uint64_t v41 = (const char *)sub_10000EEF8(kCFAllocatorDefault, v88, &v73, (uint64_t)*a3, (uint64_t)v32);
    *a3 = v41;
    if (v41 == v32)
    {
      CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
      context[0] = _NSConcreteStackBlock;
      context[1] = (CFTypeRef)3221225472;
      context[2] = sub_1001F278C;
      context[3] = &unk_100308F10;
      context[4] = Mutable;
      CFDictionaryApplyFunction(*(CFDictionaryRef *)v88, (CFDictionaryApplierFunction)sub_1001F2A54, context);
      [v37 setRetirees:Mutable];
      if (Mutable) {
        CFRelease(Mutable);
      }
      CFArrayRef v42 = *(const __CFArray **)buf;
      if (*(void *)buf)
      {
        if (*a3)
        {
          cf[0] = _NSConcreteStackBlock;
          cf[1] = (CFTypeRef)3221225472;
          cf[2] = sub_1001F2824;
          cf[3] = &unk_100309CA8;
          v80 = &v73;
          uint64_t v81 = v33;
          id v79 = v37;
          v91.length = CFArrayGetCount(v42);
          v91.id location = 0;
          CFArrayApplyFunction(v42, v91, (CFArrayApplierFunction)sub_1001F2A3C, cf);
          *(void *)long long buf = 0;
          CFRelease(v42);
          if ([v36 ensureFactoryCircles])
          {
            id v59 = v36;
          }
          else
          {
            SOSCreateError();
            id v59 = 0;
          }
          CFArrayRef v42 = (const __CFArray *)v59;
        }
        else
        {
          CFArrayRef v42 = 0;
        }
      }
    }
    else
    {
      CFArrayRef v42 = 0;
      *a3 = 0;
    }

    if (!v42)
    {
LABEL_94:
      if (a6) {
        goto LABEL_95;
      }
      goto LABEL_30;
    }
    goto LABEL_92;
  }
  if (v77 != 7)
  {
    if (v77 == 8)
    {
      id v10 = v76;
      cf[0] = 0;
      id v11 = (const char *)sub_10000EEF8(kCFAllocatorDefault, cf, &v73, (uint64_t)v9, (uint64_t)v76);
      *a3 = v11;
      CFTypeRef v12 = cf[0];
      if (v11)
      {
        id v13 = sub_1001E5360((uint64_t)cf[0], (uint64_t)a5);
        if (v12) {
          CFRelease(v12);
        }
        id v14 = [v13 trust];
        id v15 = (const void *)SOSCircleCreateFromDER();
        [v14 setTrustedCircle:v15];
        if (v15) {
          CFRelease(v15);
        }
        cf[0] = 0;
        *a3 = (const char *)sub_1001ED508((uint64_t *)cf, (uint64_t)&v73, (uint64_t)*a3);
        [v14 setFullPeerInfo:cf[0]];
        CFTypeRef v16 = cf[0];
        if (cf[0])
        {
          cf[0] = 0;
          CFRelease(v16);
        }
        cf[0] = (CFTypeRef)5;
        *a3 = (const char *)ccder_decode_uint64();
        [v14 setDepartureCode:LODWORD(cf[0])];
        LOBYTE(v87) = -86;
        *a3 = (const char *)sub_1000295D4((uint64_t)&v87, (uint64_t)*a3);
        [v13 setAccountKeyIsTrusted:v87];
        context[0] = 0;
        *a3 = (const char *)sub_1001ED6A4();
        [v13 setAccountKey:context[0]];
        CFTypeRef v17 = context[0];
        if (context[0])
        {
          context[0] = 0;
          CFRelease(v17);
        }
        context[0] = 0;
        *a3 = (const char *)sub_1001ED6A4();
        [v13 setPreviousAccountKey:context[0]];
        CFTypeRef v18 = context[0];
        if (context[0])
        {
          context[0] = 0;
          CFRelease(v18);
        }
        context[0] = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
        *a3 = (const char *)der_decode_data_or_null();
        uint64_t v19 = (void *)context[0];
        [v13 setAccountKeyDerivationParameters:context[0]];

        id v20 = (const void *)SOSPeerInfoSetCreateFromArrayDER();
        [v14 setRetirees:v20];
        if (v20) {
          CFRelease(v20);
        }
        context[0] = 0;
        id v21 = *a3;
        int v22 = sub_100010258(kCFAllocatorDefault, (CFDataRef *)context, 0, (uint64_t)*a3, (uint64_t)v10);
        if (v22) {
          id v23 = (const char *)v22;
        }
        else {
          id v23 = v21;
        }
        *a3 = v23;
        if (v23 != v10)
        {
          *(void *)long long buf = 0;
          uint64_t v24 = (const char *)sub_10000EEF8(kCFAllocatorDefault, buf, &v73, (uint64_t)v23, (uint64_t)v10);
          *a3 = v24;
          if (!v24)
          {
            uint64_t v60 = sub_10000B070("persistence");
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v88 = 0;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Error Processing expansion dictionary der - dropping account object", v88, 2u);
            }

            CFTypeRef v61 = context[0];
            if (context[0])
            {
              context[0] = 0;
              CFRelease(v61);
            }
            if (*(void *)buf) {
              CFRelease(*(CFTypeRef *)buf);
            }
            goto LABEL_89;
          }
          CFArrayRef v25 = *(const __CFArray **)buf;
          if (*(void *)buf)
          {
            [v14 setExpansion:*(void *)buf];
            CFRelease(v25);
          }
        }
        CFTypeRef v26 = context[0];
        uint64_t v27 = sub_10000B070("backupKey");
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v28)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Setting backup key from metadata", buf, 2u);
          }

          id v29 = [objc_alloc((Class)NSData) initWithData:v26];
          [v13 setBackup_key:v29];

          CFRelease(v26);
        }
        else
        {
          if (v28)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to set backup key from metadata - no key found", buf, 2u);
          }
        }
        if (*a3 && *a3 == v10)
        {
          CFArrayRef v42 = v13;
LABEL_90:

          goto LABEL_91;
        }
        SOSCreateError();
LABEL_89:
        CFArrayRef v42 = 0;
        goto LABEL_90;
      }
      if (!cf[0]) {
        goto LABEL_94;
      }
      CFRelease(cf[0]);
      if (!a6) {
        goto LABEL_30;
      }
    }
    else
    {
      SOSCreateErrorWithFormat();
      if (!a6) {
        goto LABEL_30;
      }
    }
LABEL_95:
    CFArrayRef v30 = 0;
    *a6 = (id)(id)v73;
    goto LABEL_96;
  }
  CFRange v43 = v76;
  cf[0] = 0;
  uint64_t v44 = (const char *)sub_10000EEF8(kCFAllocatorDefault, cf, &v73, (uint64_t)v9, (uint64_t)v76);
  *a3 = v44;
  if (!v44) {
    goto LABEL_94;
  }
  CFTypeRef v45 = cf[0];
  id v13 = sub_1001E5360((uint64_t)cf[0], (uint64_t)a5);
  if (v45) {
    CFRelease(v45);
  }
  id v46 = [v13 trust];
  id v47 = (const void *)SOSCircleCreateFromDER();
  [v46 setTrustedCircle:v47];
  if (v47) {
    CFRelease(v47);
  }
  cf[0] = 0;
  *a3 = (const char *)sub_1001ED508((uint64_t *)cf, (uint64_t)&v73, (uint64_t)*a3);
  [v46 setFullPeerInfo:cf[0]];
  CFTypeRef v48 = cf[0];
  if (cf[0])
  {
    cf[0] = 0;
    CFRelease(v48);
  }
  cf[0] = (CFTypeRef)5;
  v49 = (const char *)ccder_decode_uint64();
  *a3 = v49;
  buf[0] = -86;
  *a3 = (const char *)sub_1000295D4((uint64_t)buf, (uint64_t)v49);
  [v13 setAccountKeyIsTrusted:buf[0]];
  context[0] = 0;
  *a3 = (const char *)sub_1001ED6A4();
  [v13 setAccountKey:context[0]];
  CFTypeRef v50 = context[0];
  if (context[0])
  {
    context[0] = 0;
    CFRelease(v50);
  }
  context[0] = 0;
  *a3 = (const char *)sub_1001ED6A4();
  [v13 setPreviousAccountKey:context[0]];
  CFTypeRef v51 = context[0];
  if (context[0])
  {
    context[0] = 0;
    CFRelease(v51);
  }
  context[0] = 0;
  *a3 = (const char *)der_decode_data_or_null();
  BOOL v52 = (void *)context[0];
  [v13 setAccountKeyDerivationParameters:context[0]];

  [v46 setRetirees:SOSPeerInfoSetCreateFromArrayDER()];
  context[0] = 0;
  uint64_t v53 = *a3;
  v54 = sub_100010258(kCFAllocatorDefault, (CFDataRef *)context, 0, (uint64_t)*a3, (uint64_t)v43);
  if (v54) {
    uint64_t v55 = (const char *)v54;
  }
  else {
    uint64_t v55 = v53;
  }
  *a3 = v55;
  char v56 = (void *)context[0];
  if (context[0])
  {
    [v13 setBackup_key:context[0]];
  }
  [v46 setDepartureCode:LODWORD(cf[0])];
  if (*a3 && *a3 == v43)
  {
    id v57 = v13;
  }
  else
  {
    SOSCreateError();
    id v57 = 0;
  }
  CFArrayRef v42 = (const __CFArray *)v57;

LABEL_91:
  if (!v42) {
    goto LABEL_94;
  }
LABEL_92:
  if (*a3 != v76)
  {
LABEL_93:
    SOSCreateError();

    goto LABEL_94;
  }
  if (![(__CFArray *)v42 fullPeerInfo])
  {
LABEL_103:
    if ([(__CFArray *)v42 ensureFactoryCircles])
    {
      id v64 = [(__CFArray *)v42 peerInfo];
      if (v64)
      {
        v65 = v64;
        CFRetain(v64);
        if (([(__CFArray *)v42 isInCircle:0] & 1) == 0) {
          sub_1001F8090(v42);
        }
        CFRelease(v65);
      }
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_1001F29B4;
      v74[3] = &unk_100309B28;
      CFArrayRef v66 = v42;
      CFArrayRef v75 = v66;
      [(__CFArray *)v66 performTransaction:v74];
      CFStringRef v67 = sub_1001FF568(v66);
      if (v67) {
        CFRelease(v67);
      }
      [(__CFArray *)v66 sosEvaluateIfNeeded];
      CFArrayRef v68 = v75;
      CFArrayRef v30 = v66;

      goto LABEL_31;
    }
    goto LABEL_93;
  }
  if (SOSFullPeerInfoPrivKeyExists())
  {
    v63 = (const void *)SOSFullPeerInfoCopyPubKey();
    [(__CFArray *)v42 setPeerPublicKey:v63];
    if (v63) {
      CFRelease(v63);
    }
    goto LABEL_103;
  }
  v69 = [(__CFArray *)v42 key_transport];
  sub_10020CA18(v69);

  v70 = [(__CFArray *)v42 circle_transport];
  sub_10020C97C(v70);

  v71 = [(__CFArray *)v42 kvs_message_transport];
  sub_10020C89C(v71);

  v72 = sub_10000B070("account");
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(cf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "No private key associated with my_identity, resetting", (uint8_t *)cf, 2u);
  }

  if (a6) {
    goto LABEL_95;
  }
LABEL_30:
  CFArrayRef v30 = 0;
LABEL_31:
  CFTypeRef v31 = v73;
  if (v73)
  {
    CFTypeRef v73 = 0;
    CFRelease(v31);
  }
LABEL_96:

  return v30;
}

- (void)performTransaction:(BOOL)a3 action:(id)a4
{
  id v6 = a4;
  off_10035CAA8();
  if (*v7)
  {
    [(SOSAccount *)self performTransaction_Locked:1 action:v6];
  }
  else
  {
    id v8 = [(SOSAccount *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001F5244;
    block[3] = &unk_100307E80;
    void block[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    dispatch_sync(v8, block);
  }
}

- (void)performTransaction:(id)a3
{
}

- (void)performTransaction_Locked:(BOOL)a3 action:(id)a4
{
  BOOL v4 = a3;
  id v8 = (void (**)(id, SOSAccountTransaction *))a4;
  dispatch_queue_t v7 = [[SOSAccountTransaction alloc] initWithAccount:self quiet:v4];
  v8[2](v8, v7);
  [(SOSAccountTransaction *)v7 finish];
}

- (void)performTransaction_Locked:(id)a3
{
}

+ (void)performOnQuietAccountQueue:(id)a3
{
  int v3 = (void (**)(void))a3;
  BOOL v4 = sub_10021A4D0(1);
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001F5494;
    v6[3] = &unk_1003097A0;
    dispatch_queue_t v7 = v3;
    [v4 performTransaction:1 action:v6];
  }
  else
  {
    int v5 = sub_10000B070("acct-txn");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      uid_t v9 = getuid();
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "UID: %d - No account; running block on local thread",
        buf,
        8u);
    }

    v3[2](v3);
  }
}

@end