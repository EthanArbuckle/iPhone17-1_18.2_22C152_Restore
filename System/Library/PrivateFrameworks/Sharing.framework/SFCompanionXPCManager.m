@interface SFCompanionXPCManager
+ (id)hotspotClientInterface;
+ (id)hotspotInterface;
+ (id)serviceManagerClientInterface;
+ (id)serviceManagerInterface;
+ (id)sharedManager;
+ (id)unlockInterface;
+ (id)xpcManagerInterface;
+ (void)initialize;
- (BOOL)interrupted;
- (BOOL)isInvalid;
- (NSMutableArray)observers;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)xpcSetupQueue;
- (SFCompanionXPCManager)init;
- (int)listenerResumedToken;
- (void)appleAccountSignedIn;
- (void)appleAccountSignedOut;
- (void)dealloc;
- (void)notifyOfInterruption;
- (void)notifyOfInvalidation;
- (void)notifyOfResume;
- (void)onQueue_setupConnection;
- (void)registerObserver:(id)a3;
- (void)remoteHotspotSessionForClient:(id)a3 withCompletionHandler:(id)a4;
- (void)serviceManagerProxyForIdentifier:(id)a3 client:(id)a4 withCompletionHandler:(id)a5;
- (void)setConnection:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setListenerResumedToken:(int)a3;
- (void)setObservers:(id)a3;
- (void)setXpcSetupQueue:(id)a3;
- (void)setupConnection;
- (void)streamsForMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)unlockManagerWithCompletionHandler:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 completion:(id)a5;
@end

@implementation SFCompanionXPCManager

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_16);
  }
}

void __35__SFCompanionXPCManager_initialize__block_invoke()
{
  v41[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39140];
  v1 = (void *)sXPCManagerInterface;
  sXPCManagerInterface = v0;

  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA194D0];
  v3 = (void *)sServiceManagerClientInterface;
  sServiceManagerClientInterface = v2;

  uint64_t v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA391A0];
  v5 = (void *)sServiceManagerInterface;
  sServiceManagerInterface = v4;

  uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA13020];
  v7 = (void *)sUnlockClientInterface;
  sUnlockClientInterface = v6;

  uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39200];
  v9 = (void *)sUnlockInterface;
  sUnlockInterface = v8;

  uint64_t v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA1AA10];
  v11 = (void *)sAutheticationStateChangeObserverInterface;
  sAutheticationStateChangeObserverInterface = v10;

  uint64_t v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA14810];
  v13 = (void *)sHotspotClientInterface;
  sHotspotClientInterface = v12;

  uint64_t v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39260];
  v15 = (void *)sHotspotInterface;
  sHotspotInterface = v14;

  [(id)sXPCManagerInterface setInterface:sServiceManagerClientInterface forSelector:sel_createCompanionServiceManagerWithIdentifier_clientProxy_reply_ argumentIndex:1 ofReply:0];
  [(id)sXPCManagerInterface setInterface:sServiceManagerInterface forSelector:sel_createCompanionServiceManagerWithIdentifier_clientProxy_reply_ argumentIndex:0 ofReply:1];
  [(id)sXPCManagerInterface setInterface:sUnlockInterface forSelector:sel_createUnlockManagerWithReply_ argumentIndex:0 ofReply:1];
  [(id)sXPCManagerInterface setInterface:sHotspotClientInterface forSelector:sel_createHotspotSessionForClientProxy_reply_ argumentIndex:0 ofReply:0];
  [(id)sXPCManagerInterface setInterface:sHotspotInterface forSelector:sel_createHotspotSessionForClientProxy_reply_ argumentIndex:0 ofReply:1];
  v16 = (void *)sXPCManagerInterface;
  v17 = (void *)MEMORY[0x1E4F1CAD0];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  v41[2] = objc_opt_class();
  v41[3] = objc_opt_class();
  v41[4] = objc_opt_class();
  v41[5] = objc_opt_class();
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:6];
  v19 = [v17 setWithArray:v18];
  [v16 setClasses:v19 forSelector:sel_createStreamsForMessage_reply_ argumentIndex:0 ofReply:0];

  [(id)sXPCManagerInterface setClass:objc_opt_class() forSelector:sel_createStreamsForMessage_reply_ argumentIndex:0 ofReply:1];
  [(id)sServiceManagerInterface setClass:objc_opt_class() forSelector:sel_enableService_ argumentIndex:0 ofReply:0];
  [(id)sServiceManagerInterface setClass:objc_opt_class() forSelector:sel_disableService_ argumentIndex:0 ofReply:0];
  [(id)sServiceManagerClientInterface setClass:objc_opt_class() forSelector:sel_streamToService_withFileHandle_acceptReply_ argumentIndex:0 ofReply:0];
  [(id)sServiceManagerClientInterface setClass:objc_opt_class() forSelector:sel_streamToService_withFileHandle_acceptReply_ argumentIndex:1 ofReply:0];
  v20 = (void *)sHotspotInterface;
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v40 = objc_opt_class();
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v23 = [v21 setWithArray:v22];
  [v20 setClasses:v23 forSelector:sel_enableHotspotForDevice_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v24 = (void *)sHotspotClientInterface;
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v27 = [v25 setWithArray:v26];
  [v24 setClasses:v27 forSelector:sel_updatedFoundDeviceList_ argumentIndex:0 ofReply:0];

  v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:6];
  v30 = objc_msgSend(v28, "setWithArray:", v29, v33, v34, v35, v36, v37);

  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_unlockStateForDevice_completionHandler_ argumentIndex:0 ofReply:1];
  v31 = (void *)sUnlockInterface;
  v32 = [v30 setByAddingObject:objc_opt_class()];
  [v31 setClasses:v32 forSelector:sel_eligibleAutoUnlockDevicesWithCompletionHandler_ argumentIndex:0 ofReply:1];

  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_enableAutoUnlockWithDevice_passcode_clientProxy_ argumentIndex:2 ofReply:0];
  [(id)sUnlockInterface setClasses:v30 forSelector:sel_enableAutoUnlockWithDevice_passcode_clientProxy_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClasses:v30 forSelector:sel_cancelEnablingAutoUnlockForDevice_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClasses:v30 forSelector:sel_disableAutoUnlockForDevice_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClasses:v30 forSelector:sel_listEligibleDevicesForAuthenticationType_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_attemptAutoUnlockWithClientProxy_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_attemptAutoUnlockWithoutNotifyingWatchWithClientProxy_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_attemptAutoUnlockForSiriWithClientProxy_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_enableUsingClientProxy_authenticationType_device_passcode_sessionID_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_enableUsingClientProxy_authenticationType_device_passcode_sessionID_ argumentIndex:2 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_enableUsingClientProxy_authenticationType_device_passcode_sessionID_ argumentIndex:3 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_enableUsingClientProxy_authenticationType_device_passcode_sessionID_ argumentIndex:4 ofReply:0];
  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_requestEnablementUsingClientProxy_authenticationType_device_sessionID_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_requestEnablementUsingClientProxy_authenticationType_device_sessionID_ argumentIndex:2 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_requestEnablementUsingClientProxy_authenticationType_device_sessionID_ argumentIndex:3 ofReply:0];
  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_disableUsingClientProxy_authenticationType_device_sessionID_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_disableUsingClientProxy_authenticationType_device_sessionID_ argumentIndex:2 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_disableUsingClientProxy_authenticationType_device_sessionID_ argumentIndex:3 ofReply:0];
  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_canAuthenticateUsingClientProxy_authenticationType_device_sessionID_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_canAuthenticateUsingClientProxy_authenticationType_device_sessionID_ argumentIndex:2 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_canAuthenticateUsingClientProxy_authenticationType_device_sessionID_ argumentIndex:3 ofReply:0];
  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_authenticateUsingClientProxy_type_sessionID_options_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_authenticateUsingClientProxy_type_sessionID_options_ argumentIndex:2 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_authenticateUsingClientProxy_type_sessionID_options_ argumentIndex:3 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_cancelAuthenticationSessionWithID_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setInterface:sUnlockClientInterface forSelector:sel_registerForApprovalRequestsUsingClientProxy_forType_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_reportUserApprovalWithACMToken_error_sessionID_ argumentIndex:0 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_reportUserApprovalWithACMToken_error_sessionID_ argumentIndex:1 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_reportUserApprovalWithACMToken_error_sessionID_ argumentIndex:2 ofReply:0];
  [(id)sUnlockInterface setClass:objc_opt_class() forSelector:sel_authPromptInfoWithCompletionHandler_ argumentIndex:0 ofReply:1];
  [(id)sUnlockInterface setInterface:sAutheticationStateChangeObserverInterface forSelector:sel_startObservingAuthentationStateChangesWithObserver_forIdentifier_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClasses:v30 forSelector:sel_beganAttemptWithDevice_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClasses:v30 forSelector:sel_completedUnlockWithDevice_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClasses:v30 forSelector:sel_keyDeviceLocked_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClasses:v30 forSelector:sel_enabledDevice_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClasses:v30 forSelector:sel_failedToEnableDevice_error_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClass:objc_opt_class() forSelector:sel_enabledAuthenticationSessionWithID_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClass:objc_opt_class() forSelector:sel_failedToEnableDeviceForSessionID_error_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClass:objc_opt_class() forSelector:sel_failedToEnableDeviceForSessionID_error_ argumentIndex:1 ofReply:0];
  [(id)sUnlockClientInterface setClass:objc_opt_class() forSelector:sel_startedAuthenticationSessionWithID_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClass:objc_opt_class() forSelector:sel_completedAuthenticationSessionWithID_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClass:objc_opt_class() forSelector:sel_failedAuthenticationSessionWithID_error_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClass:objc_opt_class() forSelector:sel_failedAuthenticationSessionWithID_error_ argumentIndex:1 ofReply:0];
  [(id)sUnlockClientInterface setClass:objc_opt_class() forSelector:sel_receivedApproveRequestForSessionID_info_ argumentIndex:0 ofReply:0];
  [(id)sUnlockClientInterface setClass:objc_opt_class() forSelector:sel_receivedApproveRequestForSessionID_info_ argumentIndex:1 ofReply:0];
}

+ (id)xpcManagerInterface
{
  return (id)sXPCManagerInterface;
}

+ (id)serviceManagerClientInterface
{
  return (id)sServiceManagerClientInterface;
}

+ (id)serviceManagerInterface
{
  return (id)sServiceManagerInterface;
}

+ (id)unlockInterface
{
  return (id)sUnlockInterface;
}

+ (id)hotspotClientInterface
{
  return (id)sHotspotClientInterface;
}

+ (id)hotspotInterface
{
  return (id)sHotspotInterface;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_337);
  }
  uint64_t v2 = (void *)sharedManager_manager_0;

  return v2;
}

void __38__SFCompanionXPCManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_alloc_init(SFCompanionXPCManager);
  v1 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = (uint64_t)v0;
}

- (SFCompanionXPCManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)SFCompanionXPCManager;
  uint64_t v2 = [(SFCompanionXPCManager *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.sharing.xpc", 0);
    xpcSetupQueue = v2->_xpcSetupQueue;
    v2->_xpcSetupQueue = (OS_dispatch_queue *)v3;

    *(_WORD *)&v2->_invalid = 0;
    connection = v2->_connection;
    v2->_connection = 0;

    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v2->_observers;
    v2->_observers = v6;

    [(SFCompanionXPCManager *)v2 setupConnection];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __29__SFCompanionXPCManager_init__block_invoke;
    handler[3] = &unk_1E5BBE120;
    uint64_t v10 = v2;
    notify_register_dispatch("com.apple.sharingd.daemon.started", &v2->_listenerResumedToken, MEMORY[0x1E4F14428], handler);
  }
  return v2;
}

uint64_t __29__SFCompanionXPCManager_init__block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 16))
  {
    uint64_t v1 = result;
    uint64_t v2 = streams_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v3 = 0;
      _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "Reconnecting to sharingd", v3, 2u);
    }

    return [*(id *)(v1 + 32) setupConnection];
  }
  return result;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFCompanionXPCManager;
  [(SFCompanionXPCManager *)&v3 dealloc];
}

- (void)setupConnection
{
  xpcSetupQueue = self->_xpcSetupQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SFCompanionXPCManager_setupConnection__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_sync(xpcSetupQueue, block);
}

uint64_t __40__SFCompanionXPCManager_setupConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onQueue_setupConnection");
}

- (void)onQueue_setupConnection
{
  objc_super v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.sharingd.nsxpc" options:0];
  connection = self->_connection;
  self->_connection = v3;

  [(NSXPCConnection *)self->_connection _setQueue:self->_xpcSetupQueue];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:sXPCManagerInterface];
  v5 = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__SFCompanionXPCManager_onQueue_setupConnection__block_invoke;
  v14[3] = &unk_1E5BBC870;
  uint64_t v6 = v5;
  v15 = v6;
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v14];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  objc_super v11 = __48__SFCompanionXPCManager_onQueue_setupConnection__block_invoke_351;
  uint64_t v12 = &unk_1E5BBC870;
  v13 = v6;
  v7 = self->_connection;
  uint64_t v8 = v6;
  [(NSXPCConnection *)v7 setInvalidationHandler:&v9];
  [(NSXPCConnection *)self->_connection resume];
  [(SFCompanionXPCManager *)v8 setInvalid:0];
  [(SFCompanionXPCManager *)v8 notifyOfResume];
}

uint64_t __48__SFCompanionXPCManager_onQueue_setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = streams_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "XPC Manager Connection Interrupted", v6, 2u);
  }

  [*(id *)(a1 + 32) setInterrupted:1];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "onQueue_setupConnection");
  return [*(id *)(a1 + 32) notifyOfInterruption];
}

uint64_t __48__SFCompanionXPCManager_onQueue_setupConnection__block_invoke_351(uint64_t a1)
{
  uint64_t v2 = streams_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "XPC Manager Connection Invalidated", v8, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  char v5 = [*(id *)(a1 + 32) interrupted];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5) {
    return [v6 setInterrupted:0];
  }
  [v6 setInvalid:1];
  return [*(id *)(a1 + 32) notifyOfInvalidation];
}

- (void)notifyOfInterruption
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableArray *)v2->_observers copy];
  objc_sync_exit(v2);

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "xpcManagerConnectionInterrupted", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)notifyOfResume
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableArray *)v2->_observers copy];
  objc_sync_exit(v2);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "xpcManagerDidResumeConnection:", v2, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)notifyOfInvalidation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableArray *)v2->_observers copy];
  objc_sync_exit(v2);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "xpcManagerDidInvalidate:", v2, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (([(NSMutableArray *)v4->_observers containsObject:v5] & 1) == 0) {
    [(NSMutableArray *)v4->_observers addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)serviceManagerProxyForIdentifier:(id)a3 client:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_connection)
  {
    long long v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFCompanionXPC/createCompanionServiceManagerWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    connection = self->_connection;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E5BBCD68;
    id v13 = v10;
    id v18 = v13;
    uint64_t v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke_357;
    v15[3] = &unk_1E5BBE148;
    id v16 = v13;
    [v14 createCompanionServiceManagerWithIdentifier:v8 clientProxy:v9 reply:v15];

    os_activity_scope_leave(&state);
  }
}

void __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = streams_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke_357(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)streamsForMessage:(id)a3 withCompletionHandler:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_connection)
  {
    id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFCompanionXPC/createStreamsForMessage", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    connection = self->_connection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke;
    v16[3] = &unk_1E5BBCD68;
    id v10 = v7;
    id v17 = v10;
    long long v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_359;
    v14[3] = &unk_1E5BBE170;
    id v15 = v10;
    [v11 createStreamsForMessage:v6 reply:v14];

    os_activity_scope_leave(&state);
  }
  else
  {
    long long v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"XPC Connection Down";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v8 = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:64 userInfo:v13];

    (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v8);
  }
}

void __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = streams_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_359(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unlockManagerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(SFCompanionXPCManager *)self isInvalid])
  {
    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.opaque[0]) = 0;
      _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Re-establishing connection", (uint8_t *)&buf, 2u);
    }

    [(SFCompanionXPCManager *)self setupConnection];
  }
  if (self->_connection)
  {
    id v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFCompanionXPC/createUnlockManagerWithReply", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    buf.opaque[0] = 0;
    buf.opaque[1] = 0;
    os_activity_scope_enter(v6, &buf);
    connection = self->_connection;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__SFCompanionXPCManager_unlockManagerWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E5BBCD68;
    id v8 = v4;
    id v13 = v8;
    id v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__SFCompanionXPCManager_unlockManagerWithCompletionHandler___block_invoke_364;
    v10[3] = &unk_1E5BBE198;
    id v11 = v8;
    [v9 createUnlockManagerWithReply:v10];

    os_activity_scope_leave(&buf);
  }
}

void __60__SFCompanionXPCManager_unlockManagerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__SFCompanionXPCManager_unlockManagerWithCompletionHandler___block_invoke_364(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remoteHotspotSessionForClient:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_connection)
  {
    id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFCompanionXPC/createHotspotSessionForClientProxy", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    connection = self->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__SFCompanionXPCManager_remoteHotspotSessionForClient_withCompletionHandler___block_invoke;
    v14[3] = &unk_1E5BBCD68;
    id v10 = v7;
    id v15 = v10;
    id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__SFCompanionXPCManager_remoteHotspotSessionForClient_withCompletionHandler___block_invoke_366;
    v12[3] = &unk_1E5BBE1C0;
    id v13 = v10;
    [v11 createHotspotSessionForClientProxy:v6 reply:v12];

    os_activity_scope_leave(&state);
  }
}

void __77__SFCompanionXPCManager_remoteHotspotSessionForClient_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = tethering_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__SFCompanionXPCManager_remoteHotspotSessionForClient_withCompletionHandler___block_invoke_366(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (self->_connection)
  {
    if (!v6)
    {
      id v10 = "Sharing/SFRemoteHotspotSession/removeLowLatencyFilter";
LABEL_7:
      id v11 = _os_activity_create(&dword_1A5389000, v10, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v11, &state);
      os_activity_scope_leave(&state);

      connection = self->_connection;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __71__SFCompanionXPCManager_updateLowLatencyFilter_isAddFilter_completion___block_invoke;
      v22 = &unk_1E5BBCD68;
      id v13 = v9;
      id v23 = v13;
      uint64_t v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&v19];
      objc_msgSend(v14, "updateLowLatencyFilter:isAddFilter:completion:", v8, v6, v13, v19, v20, v21, v22);

      id v15 = v23;
LABEL_9:

      goto LABEL_10;
    }
LABEL_6:
    id v10 = "Sharing/SFRemoteHotspotSession/addLowLatencyFilter";
    goto LABEL_7;
  }
  if (!v6)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28798];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"XPC Connection Down";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v15 = [v16 errorWithDomain:v17 code:64 userInfo:v18];

    (*((void (**)(id, void *))v9 + 2))(v9, v15);
    goto LABEL_9;
  }
  [(SFCompanionXPCManager *)self setupConnection];
  if (self->_connection) {
    goto LABEL_6;
  }
LABEL_10:
}

void __71__SFCompanionXPCManager_updateLowLatencyFilter_isAddFilter_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = tethering_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__SFCompanionXPCManager_updateLowLatencyFilter_isAddFilter_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appleAccountSignedIn
{
  if (self->_connection || ([(SFCompanionXPCManager *)self setupConnection], self->_connection))
  {
    id v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFCompanionXPC/appleAccountSignedIn", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(v3, &v5);
    id v4 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_369];
    [v4 appleAccountSignedIn];

    os_activity_scope_leave(&v5);
  }
}

void __45__SFCompanionXPCManager_appleAccountSignedIn__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__SFCompanionXPCManager_appleAccountSignedIn__block_invoke_cold_1(v2);
  }
}

- (void)appleAccountSignedOut
{
  if (self->_connection || ([(SFCompanionXPCManager *)self setupConnection], self->_connection))
  {
    id v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFCompanionXPC/appleAccountSignedOut", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(v3, &v5);
    id v4 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_371];
    [v4 appleAccountSignedOut];

    os_activity_scope_leave(&v5);
  }
}

void __46__SFCompanionXPCManager_appleAccountSignedOut__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __46__SFCompanionXPCManager_appleAccountSignedOut__block_invoke_cold_1(v2);
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (OS_dispatch_queue)xpcSetupQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcSetupQueue:(id)a3
{
}

- (int)listenerResumedToken
{
  return self->_listenerResumedToken;
}

- (void)setListenerResumedToken:(int)a3
{
  self->_listenerResumedToken = a3;
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (NSMutableArray)observers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_xpcSetupQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __87__SFCompanionXPCManager_serviceManagerProxyForIdentifier_client_withCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = (void *)[a1 copy];
  id v2 = [v1 description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v3, v4, "Service Manager: Error occured on XPC Manager when getting remote object %@", v5, v6, v7, v8, v9);
}

void __65__SFCompanionXPCManager_streamsForMessage_withCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = (void *)[a1 copy];
  id v2 = [v1 description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v3, v4, "Error occured on XPC Manager when getting remote object %@", v5, v6, v7, v8, v9);
}

void __71__SFCompanionXPCManager_updateLowLatencyFilter_isAddFilter_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A5389000, v0, OS_LOG_TYPE_ERROR, "Error occured on XPC Manager when getting remote object %@", v1, 0xCu);
}

void __45__SFCompanionXPCManager_appleAccountSignedIn__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = (void *)[a1 copy];
  uint64_t v2 = [v1 description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v3, v4, "appleAccountSignedIn: Error occured on XPC Manager when getting remote object %@", v5, v6, v7, v8, v9);
}

void __46__SFCompanionXPCManager_appleAccountSignedOut__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = (void *)[a1 copy];
  uint64_t v2 = [v1 description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v3, v4, "appleAccountSignedOut: Error occured on XPC Manager when getting remote object %@", v5, v6, v7, v8, v9);
}

@end