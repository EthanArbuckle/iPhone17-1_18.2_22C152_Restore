@interface NESMSession
+ (BOOL)hasRequiredFrameworks;
+ (__CFDictionary)copyDefaultRouteCacheIsIPv6:(BOOL)a3;
+ (__CFDictionary)copyRouteCacheFromRoutes:(__CFArray *)a3 isIPv6:(BOOL)a4;
+ (id)sessionWithConfiguration:(id)a3 andType:(int)a4 andServer:(id)a5;
- (BOOL)canSleep;
- (BOOL)disableDefaultDropAfterBoot;
- (BOOL)disableOnDemand;
- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4;
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)hasProviderWithBundleIdentifier:(id)a3;
- (BOOL)isActive;
- (BOOL)isDeregisteredAppVPNSession;
- (BOOL)isDeregisteredEnterpriseVPNSession;
- (BOOL)isDropPersistent;
- (BOOL)isOnDemand;
- (BOOL)isStopAllowed:(id)a3;
- (BOOL)restartPending;
- (BOOL)shouldBeIdleForStatus:(int)a3;
- (BOOL)supportsDefaultDrop;
- (BOOL)waitForPerApp;
- (NEConfiguration)configuration;
- (NENetworkAgent)networkAgent;
- (NEOnDemandRule)matchedRule;
- (NEPolicySession)controlPolicySession;
- (NEPolicySession)highPolicySession;
- (NESMPolicySession)policySession;
- (NESMServer)server;
- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4 sessionQueue:(id)a5 messageQueue:(id)a6;
- (NSArray)configurationUserUUIDs;
- (NSArray)registeredNetworkAgentInterfaces;
- (NSData)configurationSignature;
- (NSDate)firstFailedConnectTime;
- (NSDate)lastStatusChangeTime;
- (NSError)lastDisconnectError;
- (NSMutableArray)networkAgentInterfaces;
- (NSMutableArray)onDemandDomainCache;
- (NSMutableArray)staleOnDemandDNSKeys;
- (NSNumber)gid;
- (NSNumber)uid;
- (NSString)auxiliaryDataKey;
- (NSString)lastPrimaryInterface;
- (NSString)pluginType;
- (NWMonitor)onDemandMonitor;
- (NWNetworkAgentRegistration)networkAgentRegistration;
- (NWResolver)dnsRedirectionDetector;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)onDemandPauseTimerSource;
- (OS_os_transaction)dnsRedirectionTransaction;
- (OS_xpc_object)startMessage;
- (id)copyExtendedStatus;
- (id)description;
- (id)getIDSNetworkAgentDomain;
- (int)SCNCStatus;
- (int)lastStopReason;
- (int)status;
- (int)type;
- (int64_t)connectCount;
- (int64_t)connectedCount;
- (int64_t)defaultDropType;
- (int64_t)disconnectedCount;
- (int64_t)failedConnectCountWithinInterval;
- (int64_t)onDemandPauseLevelInternal;
- (unint64_t)connectTime;
- (unint64_t)lastConnectedDuration;
- (unint64_t)maxConnectTime;
- (void)addClientConnection:(id)a3;
- (void)checkPluginInstalledWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleCommand:(id)a3 fromClient:(id)a4;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleGetStatusMessage:(id)a3;
- (void)handleNetworkPrepareResult:(id)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUpdateConfiguration:(id)a3 withCompletionHandler:(id)a4;
- (void)installPendedOnQueue;
- (void)installWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)notifyChangedExtendedStatus;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseOnDemand;
- (void)prepareNetwork;
- (void)registerSession:(id)a3 fromClient:(id)a4;
- (void)removeAllClients;
- (void)restartSession;
- (void)satisfyPathResult:(id)a3;
- (void)sendConfigurationChangeHandledNotification;
- (void)setAuxiliaryDataKey:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationSignature:(id)a3;
- (void)setConfigurationUserUUIDs:(id)a3;
- (void)setConnectCount:(int64_t)a3;
- (void)setConnectTime:(unint64_t)a3;
- (void)setConnectedCount:(int64_t)a3;
- (void)setControlPolicySession:(id)a3;
- (void)setDefaultDropType:(int64_t)a3;
- (void)setDisableOnDemand:(BOOL)a3;
- (void)setDisconnectedCount:(int64_t)a3;
- (void)setDnsRedirectionDetector:(id)a3;
- (void)setDnsRedirectionTransaction:(id)a3;
- (void)setFailedConnectCountWithinInterval:(int64_t)a3;
- (void)setFirstFailedConnectTime:(id)a3;
- (void)setGid:(id)a3;
- (void)setHighPolicySession:(id)a3;
- (void)setIsDeregisteredAppVPNSession:(BOOL)a3;
- (void)setIsDeregisteredEnterpriseVPNSession:(BOOL)a3;
- (void)setIsDropPersistent:(BOOL)a3;
- (void)setIsOnDemand:(BOOL)a3;
- (void)setLastConnectedDuration:(unint64_t)a3;
- (void)setLastDisconnectError:(id)a3;
- (void)setLastPrimaryInterface:(id)a3;
- (void)setLastStatusChangeTime:(id)a3;
- (void)setLastStopReason:(int)a3;
- (void)setMatchedRule:(id)a3;
- (void)setMaxConnectTime:(unint64_t)a3;
- (void)setNetworkAgent:(id)a3;
- (void)setNetworkAgentInterfaces:(id)a3;
- (void)setNetworkAgentRegistration:(id)a3;
- (void)setOnDemandDomainCache:(id)a3;
- (void)setOnDemandMonitor:(id)a3;
- (void)setOnDemandPauseLevelInternal:(int64_t)a3;
- (void)setOnDemandPauseTimerSource:(id)a3;
- (void)setPolicySession:(id)a3;
- (void)setRegisteredNetworkAgentInterfaces:(id)a3;
- (void)setRestartPending:(BOOL)a3;
- (void)setStaleOnDemandDNSKeys:(id)a3;
- (void)setStartMessage:(id)a3;
- (void)setStatus:(int)a3;
- (void)setUID:(id)a3;
- (void)setupFromAuxiliaryData;
- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4;
- (void)stopIfNecessaryWithReason:(int)a3;
- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4;
- (void)uninstallOnQueue;
- (void)unpauseOnDemand;
@end

@implementation NESMSession

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10007BA60;
  v20[4] = sub_10007BA70;
  id v21 = (id)os_transaction_create();
  v12 = [(NESMSession *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007BA78;
  v15[3] = &unk_1000C6768;
  id v16 = v10;
  v17 = self;
  id v18 = v9;
  v19 = v20;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v12, v15);

  _Block_object_dispose(v20, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startMessage, 0);
  objc_storeStrong((id *)&self->_onDemandDomainCache, 0);
  objc_storeStrong((id *)&self->_lastPrimaryInterface, 0);
  objc_storeStrong((id *)&self->_dnsRedirectionTransaction, 0);
  objc_storeStrong((id *)&self->_dnsRedirectionDetector, 0);
  objc_storeStrong((id *)&self->_staleOnDemandDNSKeys, 0);
  objc_storeStrong((id *)&self->_registeredNetworkAgentInterfaces, 0);
  objc_storeStrong((id *)&self->_networkAgentInterfaces, 0);
  objc_storeStrong((id *)&self->_matchedRule, 0);
  objc_storeStrong((id *)&self->_onDemandMonitor, 0);
  objc_storeStrong((id *)&self->_networkAgent, 0);
  objc_storeStrong((id *)&self->_networkAgentRegistration, 0);
  objc_storeStrong((id *)&self->_highPolicySession, 0);
  objc_storeStrong((id *)&self->_controlPolicySession, 0);
  objc_storeStrong((id *)&self->_auxiliaryDataKey, 0);
  objc_storeStrong((id *)&self->_lastStatusChangeTime, 0);
  objc_storeStrong((id *)&self->_firstFailedConnectTime, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_gid, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationUserUUIDs, 0);
  objc_storeStrong((id *)&self->_configurationSignature, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_lastDisconnectError, 0);

  objc_storeStrong((id *)&self->_description, 0);
}

- (void)setIsDeregisteredAppVPNSession:(BOOL)a3
{
  self->_isDeregisteredAppVPNSession = a3;
}

- (BOOL)isDeregisteredAppVPNSession
{
  return self->_isDeregisteredAppVPNSession;
}

- (void)setIsDeregisteredEnterpriseVPNSession:(BOOL)a3
{
  self->_isDeregisteredEnterpriseVPNSession = a3;
}

- (BOOL)isDeregisteredEnterpriseVPNSession
{
  return self->_isDeregisteredEnterpriseVPNSession;
}

- (void)setIsDropPersistent:(BOOL)a3
{
  self->_isDropPersistent = a3;
}

- (BOOL)isDropPersistent
{
  return self->_isDropPersistent;
}

- (void)setDefaultDropType:(int64_t)a3
{
  self->_defaultDropType = a3;
}

- (int64_t)defaultDropType
{
  return self->_defaultDropType;
}

- (void)setDisableOnDemand:(BOOL)a3
{
  self->_disableOnDemand = a3;
}

- (BOOL)disableOnDemand
{
  return self->_disableOnDemand;
}

- (void)setStartMessage:(id)a3
{
}

- (OS_xpc_object)startMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 336, 1);
}

- (void)setRestartPending:(BOOL)a3
{
  self->_restartPending = a3;
}

- (BOOL)restartPending
{
  return self->_restartPending;
}

- (void)setOnDemandDomainCache:(id)a3
{
}

- (NSMutableArray)onDemandDomainCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 328, 1);
}

- (void)setLastPrimaryInterface:(id)a3
{
}

- (NSString)lastPrimaryInterface
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDnsRedirectionTransaction:(id)a3
{
}

- (OS_os_transaction)dnsRedirectionTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 312, 1);
}

- (void)setDnsRedirectionDetector:(id)a3
{
}

- (NWResolver)dnsRedirectionDetector
{
  return (NWResolver *)objc_getProperty(self, a2, 304, 1);
}

- (void)setStaleOnDemandDNSKeys:(id)a3
{
}

- (NSMutableArray)staleOnDemandDNSKeys
{
  return (NSMutableArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setOnDemandPauseTimerSource:(id)a3
{
  self->_onDemandPauseTimerSource = (OS_dispatch_source *)a3;
}

- (OS_dispatch_source)onDemandPauseTimerSource
{
  return self->_onDemandPauseTimerSource;
}

- (void)setOnDemandPauseLevelInternal:(int64_t)a3
{
  self->_onDemandPauseLevelInternal = a3;
}

- (int64_t)onDemandPauseLevelInternal
{
  return self->_onDemandPauseLevelInternal;
}

- (void)setRegisteredNetworkAgentInterfaces:(id)a3
{
}

- (NSArray)registeredNetworkAgentInterfaces
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setNetworkAgentInterfaces:(id)a3
{
}

- (NSMutableArray)networkAgentInterfaces
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setMatchedRule:(id)a3
{
}

- (NEOnDemandRule)matchedRule
{
  return (NEOnDemandRule *)objc_getProperty(self, a2, 256, 1);
}

- (void)setOnDemandMonitor:(id)a3
{
}

- (NWMonitor)onDemandMonitor
{
  return (NWMonitor *)objc_getProperty(self, a2, 248, 1);
}

- (void)setNetworkAgent:(id)a3
{
}

- (NENetworkAgent)networkAgent
{
  return (NENetworkAgent *)objc_getProperty(self, a2, 240, 1);
}

- (void)setNetworkAgentRegistration:(id)a3
{
}

- (NWNetworkAgentRegistration)networkAgentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 232, 1);
}

- (void)setHighPolicySession:(id)a3
{
}

- (NEPolicySession)highPolicySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 224, 1);
}

- (void)setControlPolicySession:(id)a3
{
}

- (NEPolicySession)controlPolicySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAuxiliaryDataKey:(id)a3
{
}

- (NSString)auxiliaryDataKey
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastStatusChangeTime:(id)a3
{
}

- (NSDate)lastStatusChangeTime
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFirstFailedConnectTime:(id)a3
{
}

- (NSDate)firstFailedConnectTime
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFailedConnectCountWithinInterval:(int64_t)a3
{
  self->_failedConnectCountWithinInterval = a3;
}

- (int64_t)failedConnectCountWithinInterval
{
  return self->_failedConnectCountWithinInterval;
}

- (void)setPolicySession:(id)a3
{
}

- (NESMPolicySession)policySession
{
  return (NESMPolicySession *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMaxConnectTime:(unint64_t)a3
{
  self->_maxConnectTime = a3;
}

- (unint64_t)maxConnectTime
{
  return self->_maxConnectTime;
}

- (void)setDisconnectedCount:(int64_t)a3
{
  self->_disconnectedCount = a3;
}

- (int64_t)disconnectedCount
{
  return self->_disconnectedCount;
}

- (void)setConnectedCount:(int64_t)a3
{
  self->_connectedCount = a3;
}

- (int64_t)connectedCount
{
  return self->_connectedCount;
}

- (void)setConnectCount:(int64_t)a3
{
  self->_connectCount = a3;
}

- (int64_t)connectCount
{
  return self->_connectCount;
}

- (void)setLastConnectedDuration:(unint64_t)a3
{
  self->_lastConnectedDuration = a3;
}

- (unint64_t)lastConnectedDuration
{
  return self->_lastConnectedDuration;
}

- (void)setConnectTime:(unint64_t)a3
{
  self->_connectTime = a3;
}

- (unint64_t)connectTime
{
  return self->_connectTime;
}

- (void)setIsOnDemand:(BOOL)a3
{
  self->_isOnDemand = a3;
}

- (BOOL)isOnDemand
{
  return self->_isOnDemand;
}

- (void)setGid:(id)a3
{
}

- (NSNumber)gid
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (NSNumber)uid
{
  return self->_uid;
}

- (OS_dispatch_queue)messageQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConfigurationUserUUIDs:(id)a3
{
}

- (NSArray)configurationUserUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfigurationSignature:(id)a3
{
}

- (NSData)configurationSignature
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NEConfiguration)configuration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 72, 1);
}

- (NESMServer)server
{
  return (NESMServer *)objc_getProperty(self, a2, 64, 1);
}

- (int)type
{
  return self->_type;
}

- (int)status
{
  return self->_status;
}

- (BOOL)isStopAllowed:(id)a3
{
  return 1;
}

- (void)unpauseOnDemand
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: unpause VPN OnDemand", (uint8_t *)&v4, 0xCu);
  }

  sub_100081564(self, 0);
}

- (void)pauseOnDemand
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: pause VPN OnDemand", (uint8_t *)&v4, 0xCu);
  }

  sub_100081564(self, (id)3);
}

- (void)sendConfigurationChangeHandledNotification
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "SessionNotificationType", 3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v4, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (v12) {
          id v12 = objc_getProperty(v12, v8, 16, 1);
        }
        xpc_connection_send_message((xpc_connection_t)v12, v3);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)waitForPerApp
{
  return 0;
}

- (BOOL)supportsDefaultDrop
{
  return 0;
}

- (BOOL)disableDefaultDropAfterBoot
{
  return 0;
}

- (id)getIDSNetworkAgentDomain
{
  uint64_t v2 = NEGetConsoleUserUID();
  if (v2) {
    xpc_object_t v3 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"ids%d", v2];
  }
  else {
    xpc_object_t v3 = @"ids501";
  }

  return v3;
}

- (BOOL)hasProviderWithBundleIdentifier:(id)a3
{
  return 0;
}

- (void)checkPluginInstalledWithCompletionHandler:(id)a3
{
}

- (void)restartSession
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    xpc_dictionary_set_BOOL(v4, "restart", 1);
  }
  else
  {
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "xpc_dictionary_create failed", v7, 2u);
    }
  }
  xpc_dictionary_set_value(v3, "SessionOptions", v5);
  [(NESMSession *)self startWithCommand:v3 isOnDemand:0];
}

- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4
{
  id v6 = a3;
  xpc_object_t v7 = v6;
  if (!v6) {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  }
  xpc_dictionary_set_int64(v7, "SessionCommandType", 2);
  int int64 = xpc_dictionary_get_int64(v7, "SessionPID");
  if (!int64) {
    int int64 = getpid();
  }
  id v9 = [(NESMSession *)self messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095344;
  block[3] = &unk_1000C6E28;
  BOOL v14 = a4;
  block[4] = self;
  id v12 = v7;
  int v13 = int64;
  id v10 = v7;
  dispatch_async(v9, block);
}

- (void)invalidate
{
  self->_status = 0;
  self->_server = 0;
  _objc_release_x1();
}

- (BOOL)isActive
{
  return [(NESMSession *)self status] == 3
      || [(NESMSession *)self status] == 2
      || [(NESMSession *)self status] == 4;
}

- (NSString)pluginType
{
  return 0;
}

- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4
{
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    xpc_object_t v7 = self;
    __int16 v8 = 2080;
    id v9 = "-[NESMSession stopIfNecessaryWithReason:withCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: %s not supported", (uint8_t *)&v6, 0x16u);
  }
}

- (void)stopIfNecessaryWithReason:(int)a3
{
  v5 = [(NESMSession *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100095710;
  v6[3] = &unk_1000C6DD8;
  int v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)uninstallOnQueue
{
  xpc_object_t v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095A7C;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)installPendedOnQueue
{
  xpc_object_t v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095B10;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)installWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(NESMSession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100095BD0;
  v7[3] = &unk_1000C6DB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 generateSignature];
    int v7 = [(NESMSession *)self configurationSignature];
    unsigned __int8 v8 = [v7 isEqualToData:v6];

    if (v8)
    {
LABEL_25:
      char v12 = v8 ^ 1;

      goto LABEL_26;
    }
    int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
    id v10 = ne_log_large_obj();
    id v11 = v10;
    if (is_debug_logging_enabled)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v31 = self;
        __int16 v32 = 2112;
        v33 = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@: handling configuration changed: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = [v5 descriptionWithOptions:2];
      *(_DWORD *)buf = 138412546;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: handling configuration changed: %@", buf, 0x16u);
    }
    id v14 = v5;
    if (self)
    {
      p_vtable = &OBJC_METACLASS___NEAppPushPlugin.vtable;
      if (self->_policySession) {
        uint64_t v16 = sub_10002EC18((uint64_t)NESMPolicyMasterSession, &stru_1000C5B58);
      }
      else {
        uint64_t v16 = 0;
      }
      v17 = [(NESMSession *)self configuration];
      uint64_t v18 = [v17 appVPN];
      if (v18)
      {
        v19 = (void *)v18;
        v20 = [v14 appVPN];

        if (v20)
        {
          uint64_t v28 = v16;
          buf[0] = 0;
          v29 = [(NESMSession *)self configuration];
          id v21 = [v29 appVPN];
          v22 = [v21 appRules];
          v23 = [v14 appVPN];
          v24 = [v23 appRules];
          unsigned int v25 = +[NEVPNApp compareAppRules:v22 newAppRules:v24 noExistingDomain:buf];

          p_vtable = (void **)(&OBJC_METACLASS___NEAppPushPlugin + 24);
          if (buf[0]) {
            int v26 = 1;
          }
          else {
            int v26 = v25;
          }
          if (v26 != 1 || !v28) {
            goto LABEL_24;
          }
          goto LABEL_22;
        }
      }
      else
      {
      }
      if (v16)
      {
LABEL_22:
        if (self->_policySession) {
          sub_10002EC18((uint64_t)(p_vtable + 47), &stru_1000C5B38);
        }
      }
    }
LABEL_24:

    [(NESMSession *)self setConfiguration:v14];
    [(NESMSession *)self setConfigurationSignature:v6];
    sub_10008088C((uint64_t)self, 1);
    goto LABEL_25;
  }
  char v12 = 0;
LABEL_26:

  return v12;
}

- (void)handleUpdateConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095FFC;
  block[3] = &unk_1000C6D88;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (int)SCNCStatus
{
  uint64_t v2 = [(NESMSession *)self status];

  return _SCNetworkConnectionGetStatusFromNEStatus(v2);
}

- (void)setupFromAuxiliaryData
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  xpc_object_t v3 = +[NEFileHandleMaintainer sharedMaintainer];
  id v4 = [(NESMSession *)v2 auxiliaryDataKey];
  id v5 = [v3 copyAuxiliaryDataForKey:v4];

  if (isa_nsdata() && [v5 length])
  {
    id v8 = 0;
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v8];
    id v7 = v8;
    if (v6) {
      objc_storeStrong((id *)&v2->_lastDisconnectError, v6);
    }
  }
  objc_sync_exit(v2);
}

- (void)setLastDisconnectError:(id)a3
{
  id v5 = (NSError *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_lastDisconnectError = &v6->_lastDisconnectError;
  lastDisconnectError = v6->_lastDisconnectError;
  if (lastDisconnectError != v5 && ([(NSError *)lastDisconnectError isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&v6->_lastDisconnectError, a3);
    id v9 = [(NESMSession *)v6 auxiliaryDataKey];

    if (v9)
    {
      id v10 = *p_lastDisconnectError;
      if (*p_lastDisconnectError)
      {
        id v19 = 0;
        id v11 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v19];
        id v12 = v19;
        int v13 = v12;
        if (v11)
        {

LABEL_11:
          long long v15 = +[NEFileHandleMaintainer sharedMaintainer];
          uint64_t v16 = [(NESMSession *)v6 auxiliaryDataKey];
          [v15 setAuxiliaryData:v11 forKey:v16];

          v17 = +[NEFileHandleMaintainer sharedMaintainer];
          [v17 commit];

          goto LABEL_12;
        }
        id v14 = ne_log_obj();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *p_lastDisconnectError;
          *(_DWORD *)buf = 138412546;
          id v21 = v18;
          __int16 v22 = 2112;
          v23 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to serialize the last disconnect error (%@): %@", buf, 0x16u);
        }
      }
      id v11 = objc_alloc_init((Class)NSData);
      goto LABEL_11;
    }
  }
LABEL_12:
  objc_sync_exit(v6);
}

- (NSError)lastDisconnectError
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  xpc_object_t v3 = v2->_lastDisconnectError;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLastStopReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ((v3 & 0xFFFFFFDF) == 0 || !v4->_lastStopReason)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting last stop reason to %d", (uint8_t *)v7, 8u);
    }

    v4->_lastStopReason = v3;
    if (v3 != 3)
    {
      id v6 = +[NEVPNConnection createDisconnectErrorWithDomain:@"NEVPNConnectionErrorDomainPlugin" code:v3];
      [(NESMSession *)v4 setLastDisconnectError:v6];
    }
  }
  objc_sync_exit(v4);
}

- (int)lastStopReason
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int lastStopReason = v2->_lastStopReason;
  objc_sync_exit(v2);

  return lastStopReason;
}

- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4
{
  return 0;
}

- (void)setUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {

    id v5 = (NSNumber *)&off_1000C99D8;
  }
  else
  {
    id v5 = 0;
  }
  uid = self->_uid;
  self->_uid = v5;
}

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int status = self->_status;
  unsigned int v6 = [(NESMSession *)self shouldBeIdleForStatus:status];
  unsigned int v7 = [(NESMSession *)self shouldBeIdleForStatus:v3];
  int v8 = self->_status;
  self->_unsigned int status = v3;
  if (status != v3)
  {
    unsigned int v9 = v7;
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    objc_opt_class();
    BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0 && [(NESMSession *)self parentType] == (id)2;
    if (((v6 ^ 1 | v9) & 1) == 0 && !v11)
    {
      id v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ is no longer idle, beginning transaction", buf, 0xCu);
      }

      id v13 = objc_alloc((Class)NSString);
      id v14 = [(NESMSession *)self configuration];
      long long v15 = [v14 identifier];
      id v16 = [v13 initWithFormat:@"com.apple.nesessionmanager.activeSession.%@", v15];

      [v16 UTF8String];
      v17 = (void *)os_transaction_create();
      objc_setProperty_atomic(self, v18, v17, 56);

      id v19 = [(NESMSession *)self server];
      sub_100055830(v19, 1);
    }
    if (((v6 | v9 ^ 1 | v11) & 1) == 0)
    {
      v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ is now idle, ending transaction", buf, 0xCu);
      }

      objc_setProperty_atomic(self, v21, 0, 56);
      __int16 v22 = [(NESMSession *)self server];
      sub_100055830(v22, -1);
    }
    if ([(NESMSession *)self type] == 2 && (v3 - 5) <= 0xFFFFFFFD && v8 == 2)
    {
      v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@ Per-app VPN failed to connect, pausing VPN On Demand", buf, 0xCu);
      }

      sub_100081564(self, (id)2);
    }
    if (v3 != 1)
    {
      if (v3 == 3)
      {
        kdebug_trace();
        [(NESMSession *)self setConnectedCount:(char *)[(NESMSession *)self connectedCount] + 1];
        [(NESMSession *)self setFailedConnectCountWithinInterval:0];
        [(NESMSession *)self setFirstFailedConnectTime:0];
      }
      else if (v3 == 2)
      {
        [(NESMSession *)self setConnectCount:(char *)[(NESMSession *)self connectCount] + 1];
      }
LABEL_32:
      if (qword_1000D7CB0 != -1) {
        dispatch_once(&qword_1000D7CB0, &stru_1000C6D10);
      }
      unsigned int v32 = self->_status;
      if (v32 == 1)
      {
        [(NESMSession *)self setLastConnectedDuration:0];
        if ([(NESMSession *)self connectTime])
        {
          unint64_t v33 = (unint64_t)(*(double *)&qword_1000D7CA8 * (double)mach_absolute_time());
          unint64_t v34 = v33 - [(NESMSession *)self connectTime];
          if ([(NESMSession *)self maxConnectTime] < v34) {
            [(NESMSession *)self setMaxConnectTime:v34];
          }
          [(NESMSession *)self setLastConnectedDuration:v34];
        }
        [(NESMSession *)self setConnectTime:0];
        BOOL v35 = [(NESMSession *)self lastStopReason] == 32;
        v36 = [(NESMSession *)self server];
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472;
        v70[2] = sub_100097698;
        v70[3] = &unk_1000C6D38;
        BOOL v71 = v35;
        v70[4] = self;
        sub_100056C0C((uint64_t)v36, self, v70);
      }
      else
      {
        if (v32 != 3) {
          goto LABEL_43;
        }
        [(NESMSession *)self setConnectTime:(unint64_t)(*(double *)&qword_1000D7CA8 * (double)mach_absolute_time())];
        [(NESMSession *)self setLastStopReason:0];
      }
      unsigned int v32 = self->_status;
LABEL_43:
      v37 = ne_log_obj();
      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v32 > 1)
      {
        if (!v38) {
          goto LABEL_49;
        }
        uint64_t v44 = ne_session_status_to_string();
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v44;
        v41 = "%@: status changed to %s";
        v42 = v37;
        uint32_t v43 = 22;
      }
      else
      {
        if (!v38) {
          goto LABEL_49;
        }
        uint64_t v39 = ne_session_status_to_string();
        [(NESMSession *)self lastStopReason];
        uint64_t v40 = ne_session_stop_reason_to_string();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2080;
        v74 = (void *)v40;
        v41 = "%@: status changed to %s, last stop reason %s";
        v42 = v37;
        uint32_t v43 = 32;
      }
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
LABEL_49:

      id v45 = objc_alloc_init((Class)NSDate);
      [(NESMSession *)self setLastStatusChangeTime:v45];

      xpc_dictionary_set_int64(v10, "SessionNotificationType", 1);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v47 = objc_getProperty(self, v46, 48, 1);
      id v48 = [v47 countByEnumeratingWithState:&v66 objects:v72 count:16];
      if (v48)
      {
        id v50 = v48;
        uint64_t v51 = *(void *)v67;
        do
        {
          for (i = 0; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v67 != v51) {
              objc_enumerationMutation(v47);
            }
            id Property = *(id *)(*((void *)&v66 + 1) + 8 * i);
            if (Property) {
              id Property = objc_getProperty(Property, v49, 16, 1);
            }
            xpc_connection_send_message((xpc_connection_t)Property, v10);
          }
          id v50 = [v47 countByEnumeratingWithState:&v66 objects:v72 count:16];
        }
        while (v50);

        if (!self) {
          goto LABEL_78;
        }
      }
      else
      {
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v54 = self;
        if (([(NESMSession *)v54 type] == 1
           || [(NESMSession *)v54 type] == 2
           || [(NESMSession *)v54 type] == 3)
          && [(NESMSession *)v54 status])
        {
          if (qword_1000D7CA0 != -1) {
            dispatch_once(&qword_1000D7CA0, &stru_1000C6CF0);
          }
          id v55 = objc_alloc_init((Class)NSMutableDictionary);
          v56 = [(NESMSession *)v54 configuration];
          v57 = [v56 identifier];
          [v55 setObject:v57 forKeyedSubscript:@"identifier"];

          v58 = +[NSNumber numberWithInt:[(NESMSession *)v54 status]];
          [v55 setObject:v58 forKeyedSubscript:@"status"];

          [v55 setObject:&stru_1000C7428 forKeyedSubscript:@"tunnel-intf"];
          [v55 setObject:&stru_1000C7428 forKeyedSubscript:@"delegate-intf"];
          [v55 setObject:&stru_1000C7428 forKeyedSubscript:@"delegate-intf-type"];
          [v55 setObject:&off_1000C99D8 forKeyedSubscript:@"duration"];
          id v59 = [(NESMSession *)v54 copyTunnelInterfaceName];
          if (v59)
          {
            [v55 setObject:v59 forKeyedSubscript:@"tunnel-intf"];
            [(NESMSession *)v54 virtualInterface];
            v60 = (void *)NEVirtualInterfaceCopyDelegateInterfaceName();
            if (v60)
            {
              [v55 setObject:v60 forKeyedSubscript:@"delegate-intf"];
              [(NESMSession *)v54 virtualInterface];
              v61 = +[NSNumber numberWithUnsignedInt:NEVirtualInterfaceGetDelegateInterfaceFunctionalType()];
              [v55 setObject:v61 forKeyedSubscript:@"delegate-intf-type"];
            }
          }
          if ([(NESMSession *)v54 status] == 1)
          {
            v62 = +[NSNumber numberWithUnsignedLongLong:[(NESMSession *)v54 lastConnectedDuration]];
            [v55 setObject:v62 forKeyedSubscript:@"duration"];
          }
          v63 = ne_log_obj();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v77 = 138412546;
            v78 = v54;
            __int16 v79 = 2112;
            id v80 = v55;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "%@: submitting event dictionary to powerlog %@", v77, 0x16u);
          }

          v64 = qword_1000D7C98;
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1000976AC;
          v74 = &unk_1000C6C38;
          v75 = @"VPN status change";
          id v76 = v55;
          id v65 = v55;
          dispatch_async(v64, buf);
        }
      }
LABEL_78:

      goto LABEL_79;
    }
    [(NESMSession *)self setDisconnectedCount:(char *)[(NESMSession *)self disconnectedCount] + 1];
    if (!sub_10007C09C(self)) {
      goto LABEL_32;
    }
    if ([(NESMSession *)self failedConnectCountWithinInterval])
    {
      uint64_t v24 = [(NESMSession *)self firstFailedConnectTime];
      if (!v24) {
        goto LABEL_32;
      }
      unsigned int v25 = (void *)v24;
      int v26 = [(NESMSession *)self firstFailedConnectTime];
      [v26 timeIntervalSinceNow];
      double v28 = v27 + 1.0;

      if (v28 < 0.0) {
        goto LABEL_32;
      }
      uint64_t v29 = [(NESMSession *)self failedConnectCountWithinInterval] + 1;
      v30 = self;
    }
    else
    {
      v31 = +[NSDate date];
      [(NESMSession *)self setFirstFailedConnectTime:v31];

      v30 = self;
      uint64_t v29 = 1;
    }
    [(NESMSession *)v30 setFailedConnectCountWithinInterval:v29];
    goto LABEL_32;
  }
LABEL_79:
  sub_10007DB9C(self);
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  return a3 < 2;
}

- (void)notifyChangedExtendedStatus
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "SessionNotificationType", 2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v4, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v14;
    do
    {
      BOOL v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (v12) {
          id v12 = objc_getProperty(v12, v8, 16, 1);
        }
        xpc_connection_send_message((xpc_connection_t)v12, v3);
        BOOL v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)prepareNetwork
{
  xpc_object_t v3 = [(NESMSession *)self server];
  if (v3) {
    uint64_t v4 = v3[6];
  }
  else {
    uint64_t v4 = 0;
  }

  id v5 = [(NESMSession *)self server];
  id v6 = [v5 primaryPhysicalInterface];
  id v7 = [v6 interfaceName];

  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 1 || !v7)
  {
    id v9 = [(NESMSession *)self queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100097A94;
    v12[3] = &unk_1000C6C60;
    v12[4] = self;
    dispatch_async(v9, v12);
LABEL_10:

    goto LABEL_11;
  }
  if (v4 == 3)
  {
    id v9 = [(NESMSession *)self server];
    [v9 satisfyPathForSession:self];
    goto LABEL_10;
  }
  if (v4 == 1)
  {
    int v8 = [(NESMSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100097AA0;
    block[3] = &unk_1000C6C38;
    void block[4] = self;
    id v11 = v7;
    dispatch_async(v8, block);
  }
LABEL_11:
}

- (void)satisfyPathResult:(id)a3
{
  id v4 = a3;
  id v5 = [(NESMSession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_100097B60;
  v7[3] = &unk_1000C6C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleNetworkPrepareResult:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: Network available via interface %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@: No network available", (uint8_t *)&v7, 0xCu);
  }
}

- (id)copyExtendedStatus
{
  xpc_object_t v3 = [(NESMSession *)self startMessage];

  if (!v3) {
    return 0;
  }
  id v4 = [(NESMSession *)self startMessage];
  xpc_object_t v5 = xpc_copy(v4);

  xpc_dictionary_set_value(v5, "SessionBootstrapPort", 0);
  xpc_dictionary_set_value(v5, "SessionAuditSessionPort", 0);
  id v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  int v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];

  if ((isa_nsdictionary() & 1) == 0)
  {

    return 0;
  }
  id v8 = [v7 objectForKeyedSubscript:@"SessionOptions"];
  int v9 = isa_nsdictionary();

  if (v9)
  {
    id v10 = [v7 objectForKeyedSubscript:@"SessionOptions"];
    id v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];

    uint64_t v12 = kSCEntNetVPN;
    long long v13 = [v11 objectForKeyedSubscript:kSCEntNetVPN];
    int v14 = isa_nsdictionary();

    if (v14)
    {
      long long v15 = [v11 objectForKeyedSubscript:v12];
      long long v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

      if (isa_nsdictionary())
      {
        uint64_t v17 = kSCPropNetVPNAuthPassword;
        SEL v18 = [v16 objectForKeyedSubscript:kSCPropNetVPNAuthPassword];

        if (v18)
        {
          [v16 setObject:@"****" forKeyedSubscript:v17];
          [v11 setObject:v16 forKeyedSubscript:v12];
          [v7 setObject:v11 forKeyedSubscript:@"SessionOptions"];
        }
      }
    }
  }
  CFStringRef v21 = @"StartMessage";
  __int16 v22 = v7;
  id v19 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  return v19;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  id v4 = a3;
  xpc_object_t message = xpc_dictionary_create_reply(v4);
  xpc_dictionary_get_remote_connection(v4);
  xpc_object_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v5, message);
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v6 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100097FF8;
  block[3] = &unk_1000C6C60;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (BOOL)handleSleep
{
  return 0;
}

- (BOOL)canSleep
{
  return 1;
}

- (void)handleStopMessageWithReason:(int)a3
{
  -[NESMSession setLastStopReason:](self, "setLastStopReason:");
  if (a3 != 36)
  {
    if (a3 == 1 && [(NESMSession *)self type] == 1) {
      sub_100081564(self, (id)1);
    }
    [(NESMSession *)self setRestartPending:0];
    [(NESMSession *)self setStartMessage:0];
  }
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  xpc_object_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  id v6 = xpc_dictionary_get_value(v4, "SessionOptions");
  int64_t int64 = xpc_dictionary_get_int64(v4, "SessionGroupID");
  int64_t euid = xpc_dictionary_get_int64(v4, "SessionUserID");
  int v9 = xpc_dictionary_get_int64(v4, "SessionPID");

  if (v5)
  {
    if (int64)
    {
      if (euid) {
        goto LABEL_4;
      }
LABEL_8:
      int64_t euid = xpc_connection_get_euid(v5);
      if (!v6) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    int64_t int64 = xpc_connection_get_egid(v5);
    if (!euid) {
      goto LABEL_8;
    }
  }
LABEL_4:
  if (!v6)
  {
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_11;
  }
LABEL_5:
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_6;
  }
  BOOL v10 = xpc_dictionary_get_BOOL(v6, "is-on-demand");
LABEL_11:
  [(NESMSession *)self setIsOnDemand:v10];
  id v11 = +[NSNumber numberWithUnsignedInt:euid];
  [(NESMSession *)self setUID:v11];

  uint64_t v12 = +[NSNumber numberWithUnsignedInt:int64];
  [(NESMSession *)self setGid:v12];

  self->_int lastStopReason = 0;
  if ([(NESMSession *)self type] == 1) {
    sub_100081564(self, 0);
  }
  if ([(NESMSession *)self isOnDemand])
  {
    string = xpc_dictionary_get_string(v6, "match-hostname");
    if (proc_name(v9, &buffer, 0x100u) <= 0)
    {
      int v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v23 = __error();
        uint64_t v24 = strerror(*v23);
        int v25 = 138412546;
        int v26 = self;
        __int16 v27 = 2080;
        p_int buffer = (int *)v24;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ failed to obtain the triggering process' name: %s", (uint8_t *)&v25, 0x16u);
      }

      strncpy((char *)&buffer, "<unknown>", 0x100uLL);
    }
    long long v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = "<none>";
      int v25 = 138413058;
      if (string) {
        long long v16 = string;
      }
      int v26 = self;
      __int16 v27 = 2080;
      p_int buffer = &buffer;
      __int16 v29 = 1024;
      int v30 = v9;
      __int16 v31 = 2080;
      unsigned int v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ starting on demand from process %s (%d) matching hostname %s", (uint8_t *)&v25, 0x26u);
    }
  }
  int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
  SEL v18 = ne_log_large_obj();
  id v19 = v18;
  if (is_debug_logging_enabled)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = [(NESMSession *)self configuration];
      int buffer = 138412546;
      unint64_t v34 = self;
      __int16 v35 = 2112;
      v36 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@ starting with configuration: %@", (uint8_t *)&buffer, 0x16u);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    CFStringRef v21 = [(NESMSession *)self configuration];
    __int16 v22 = [v21 descriptionWithOptions:2];
    int buffer = 138412546;
    unint64_t v34 = self;
    __int16 v35 = 2112;
    v36 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ starting with configuration: %@", (uint8_t *)&buffer, 0x16u);
  }
  [(NESMSession *)self setStatus:2];
}

- (void)handleGetStatusMessage:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create_reply(v4);
  xpc_dictionary_set_int64(xdict, "SessionStatus", [(NESMSession *)self status]);
  xpc_dictionary_get_remote_connection(v4);
  xpc_object_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v5, xdict);
}

- (void)handleCommand:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  int v7 = a4;
  int64_t int64 = xpc_dictionary_get_int64(v6, "SessionCommandType");
  int64_t v9 = int64;
  if (!v7 || (v7[3] & 1) == 0 || (int64 == 6 || int64 == 1) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    switch(v9)
    {
      case 1:
        BOOL v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v39 = 138412546;
          *(void *)&v39[4] = self;
          *(_WORD *)&v39[12] = 2112;
          *(void *)&v39[14] = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@: Received a status query from %@", v39, 0x16u);
        }

        kdebug_trace();
        [(NESMSession *)self handleGetStatusMessage:v6];
        break;
      case 2:
        kdebug_trace();
        id v11 = xpc_dictionary_get_value(v6, "SessionOptions");
        uint64_t v12 = v11;
        if (v11 && xpc_get_type(v11) == (xpc_type_t)&_xpc_type_dictionary)
        {
          BOOL v14 = xpc_dictionary_get_BOOL(v12, "stop-current-session");
          BOOL v13 = xpc_dictionary_get_BOOL(v12, "restart");
        }
        else
        {
          BOOL v13 = 0;
          BOOL v14 = 0;
        }
        __int16 v27 = ne_log_obj();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v39 = 138412802;
          *(void *)&v39[4] = self;
          if (v14 || v13) {
            double v28 = "re";
          }
          else {
            double v28 = "";
          }
          *(_WORD *)&v39[12] = 2080;
          *(void *)&v39[14] = v28;
          __int16 v40 = 2112;
          v41 = v7;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@: Received a %sstart command from %@", v39, 0x20u);
        }

        if ([(NESMSession *)self status] != 1 && [(NESMSession *)self status] && (v14 || v13))
        {
          if ([(NESMSession *)self restartPending])
          {
            __int16 v29 = ne_log_obj();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v39 = 138412546;
              *(void *)&v39[4] = self;
              *(_WORD *)&v39[12] = 2112;
              *(void *)&v39[14] = v7;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: Ignore restart command from %@, a pending start command already exists", v39, 0x16u);
            }

LABEL_72:
            sub_10009903C(v7, v30);
            goto LABEL_74;
          }
          [(NESMSession *)self setRestartPending:1];
          xpc_object_t v37 = xpc_copy(v6);
          [(NESMSession *)self setStartMessage:v37];

          if (v14)
          {
            BOOL v38 = ne_log_obj();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v39 = 138412546;
              *(void *)&v39[4] = self;
              *(_WORD *)&v39[12] = 2112;
              *(void *)&v39[14] = v7;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@: Stop current session as requested by an overriding restart command from %@", v39, 0x16u);
            }

            [(NESMSession *)self handleStopMessageWithReason:36];
          }
        }
        else
        {
          if ([(NESMSession *)self failedConnectCountWithinInterval] >= 4
            && [(NESMSession *)self status] == 1
            && sub_1000990D8((uint64_t)self, v6)
            && (!self || (id)[(NESMSession *)self onDemandPauseLevelInternal] != (id)2))
          {
            __int16 v31 = ne_log_obj();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v39 = 138412290;
              *(void *)&v39[4] = self;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: Damping VOD request: too many consecutive VPN connection attempts failed.", v39, 0xCu);
            }

            sub_100081564(self, (id)2);
          }
          if ([(NESMSession *)self status] != 1
            || (BOOL v32 = sub_1000990D8((uint64_t)self, v6), self)
            && v32
            && (id)[(NESMSession *)self onDemandPauseLevelInternal] == (id)2)
          {
            unint64_t v33 = ne_log_obj();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              if (v14 || v13) {
                unint64_t v34 = "re";
              }
              else {
                unint64_t v34 = "";
              }
              [(NESMSession *)self status];
              uint64_t v35 = ne_session_status_to_string();
              *(_DWORD *)uint64_t v39 = 138413058;
              *(void *)&v39[4] = self;
              *(_WORD *)&v39[12] = 2080;
              *(void *)&v39[14] = v34;
              __int16 v40 = 2112;
              v41 = v7;
              __int16 v42 = 2080;
              uint64_t v43 = v35;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@: Skip a %sstart command from %@: session in state %s", v39, 0x2Au);
            }

            goto LABEL_72;
          }
          xpc_object_t v36 = xpc_copy(v6);
          [(NESMSession *)self setStartMessage:v36];

          [(NESMSession *)self registerSession:v6 fromClient:v7];
        }
LABEL_74:

        break;
      case 3:
        int64_t v15 = xpc_dictionary_get_int64(v6, "SessionStopReason");
        long long v16 = ne_log_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v39 = 138412802;
          *(void *)&v39[4] = self;
          *(_WORD *)&v39[12] = 2112;
          *(void *)&v39[14] = v7;
          __int16 v40 = 1024;
          LODWORD(v41) = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: Received a stop command from %@ with reason %d", v39, 0x1Cu);
        }

        kdebug_trace();
        if ([(NESMSession *)self isStopAllowed:v6])
        {
          if (![(NESMSession *)self status] || [(NESMSession *)self status] == 1) {
            sub_10009903C(v7, v17);
          }
          [(NESMSession *)self handleStopMessageWithReason:v15];
          break;
        }
        uint64_t v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v39 = 138412546;
          *(void *)&v39[4] = self;
          *(_WORD *)&v39[12] = 2112;
          *(void *)&v39[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: %@ is not allowed to stop this session", v39, 0x16u);
        }
        goto LABEL_74;
      case 4:
        SEL v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v39 = 138412546;
          *(void *)&v39[4] = self;
          *(_WORD *)&v39[12] = 2112;
          *(void *)&v39[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Received an IPC establish request from %@", v39, 0x16u);
        }

        kdebug_trace();
        [(NESMSession *)self handleEstablishIPCMessage:v6];
        break;
      case 5:
        id v19 = ne_log_obj();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v39 = 138412546;
          *(void *)&v39[4] = self;
          *(_WORD *)&v39[12] = 2112;
          *(void *)&v39[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: Received a security session info request from %@", v39, 0x16u);
        }

        kdebug_trace();
        [(NESMSession *)self handleSecuritySessionInfoRequest:v6];
        break;
      case 6:
        int64_t v20 = xpc_dictionary_get_int64(v6, "SessionInfoType");
        CFStringRef v21 = ne_log_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v39 = 138412802;
          *(void *)&v39[4] = self;
          *(_WORD *)&v39[12] = 2080;
          *(void *)&v39[14] = ne_session_info_type_to_string();
          __int16 v40 = 2112;
          v41 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@: Received a info fetch request with type \"%s\" from %@", v39, 0x20u);
        }

        kdebug_trace();
        if (!v7) {
          goto LABEL_34;
        }
        uint64_t v22 = v7[3];
        if ((v22 & 1) != 0 && v20 != 4) {
          goto LABEL_35;
        }
        if ((v22 & 2) != 0) {
          goto LABEL_81;
        }
LABEL_34:
        if (v20 == 4) {
          goto LABEL_35;
        }
LABEL_81:
        [(NESMSession *)self handleGetInfoMessage:v6 withType:v20];
        break;
      case 7:
        int64_t v25 = xpc_dictionary_get_int64(v6, "SessionInfoType");
        int v26 = ne_log_obj();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v39 = 138412802;
          *(void *)&v39[4] = self;
          *(_WORD *)&v39[12] = 2080;
          *(void *)&v39[14] = ne_session_info_type_to_string();
          __int16 v40 = 2112;
          v41 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%@: Received a send info request with type \"%s\" from %@", v39, 0x20u);
        }

        kdebug_trace();
        [(NESMSession *)self handleSendInfoMessage:v6 withType:v25];
        break;
      default:
        break;
    }
  }
  else if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
LABEL_35:
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    xpc_dictionary_get_remote_connection(v6);
    uint64_t v24 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v24, reply);
  }
}

- (void)registerSession:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NESMSession *)self messageQueue];
  dispatch_suspend(v8);

  server = self->_server;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100099240;
  v12[3] = &unk_1000C6CB0;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [(NESMServer *)server registerSession:self withCompletionHandler:v12];
}

- (void)removeAllClients
{
  xpc_object_t v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000994F8;
  block[3] = &unk_1000C6C60;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)addClientConnection:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = [(NESMSession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_100099764;
  v7[3] = &unk_1000C6C38;
  id v8 = v4;
  int64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)description
{
  return self->_description;
}

- (void)dealloc
{
  xpc_object_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: deallocating", buf, 0xCu);
  }

  sub_100081100(self);
  sub_10007DB1C(self);
  sub_1000811F4(self);
  id v4 = [(NESMSession *)self onDemandPauseTimerSource];

  if (v4)
  {
    xpc_object_t v5 = [(NESMSession *)self onDemandPauseTimerSource];
    dispatch_source_cancel(v5);

    [(NESMSession *)self setOnDemandPauseTimerSource:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)NESMSession;
  [(NESMSession *)&v6 dealloc];
}

- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  return [(NESMSession *)self initWithConfiguration:a3 andServer:a4 sessionQueue:0 messageQueue:0];
}

- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4 sessionQueue:(id)a5 messageQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v37.receiver = self;
  v37.super_class = (Class)NESMSession;
  int64_t v15 = [(NESMSession *)&v37 init];
  long long v16 = v15;
  if (v15)
  {
    firstFailedConnectTime = v15->_firstFailedConnectTime;
    v15->_failedConnectCountWithinInterval = 0;
    v15->_firstFailedConnectTime = 0;
    v15->_connectedCount = 0;
    v15->_disconnectedCount = 0;
    v15->_connectCount = 0;

    v16->_unsigned int status = 1;
    SEL v18 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    clients = v16->_clients;
    v16->_clients = v18;

    objc_storeStrong((id *)&v16->_configuration, a3);
    objc_storeStrong((id *)&v16->_server, a4);
    int64_t v20 = (objc_class *)objc_opt_class();
    CFStringRef v21 = NSStringFromClass(v20);
    uint64_t v22 = [(NEConfiguration *)v16->_configuration name];
    v23 = [(NEConfiguration *)v16->_configuration identifier];
    uint64_t v24 = [v23 UUIDString];
    uint64_t v25 = +[NSString stringWithFormat:@"%@[%@:%@]", v21, v22, v24];
    description = v16->_description;
    v16->_description = (NSString *)v25;

    policySession = v16->_policySession;
    v16->_policySession = 0;

    if (v13)
    {
      double v28 = (OS_dispatch_queue *)v13;
      queue = v16->_queue;
      v16->_queue = v28;
    }
    else
    {
      queue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v30 = dispatch_queue_create("NetworkExtension session queue", queue);
      __int16 v31 = v16->_queue;
      v16->_queue = (OS_dispatch_queue *)v30;
    }
    if (v14)
    {
      BOOL v32 = (OS_dispatch_queue *)v14;
      messageQueue = v16->_messageQueue;
      v16->_messageQueue = v32;
    }
    else
    {
      messageQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v34 = dispatch_queue_create("NetworkExtension session message queue", messageQueue);
      uint64_t v35 = v16->_messageQueue;
      v16->_messageQueue = (OS_dispatch_queue *)v34;
    }
  }

  return v16;
}

+ (__CFDictionary)copyDefaultRouteCacheIsIPv6:(BOOL)a3
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  xpc_object_t v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  id v13 = v5;
  objc_super v6 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  id v12 = v6;
  if (a3)
  {
    *(void *)bytes = 0;
    uint64_t v11 = 0;
    *(void *)int64_t v9 = CFDataCreate(kCFAllocatorDefault, bytes, 16);
    CFArrayAppendValue(v5, *(const void **)v9);
    CFArrayAppendValue(v6, *(const void **)v9);
  }
  else
  {
    *(_DWORD *)int64_t v9 = 0;
    CFDataRef v7 = CFDataCreate(kCFAllocatorDefault, v9, 4);
    *(void *)bytes = v7;
    CFArrayAppendValue(v5, v7);
    CFArrayAppendValue(v6, v7);
  }
  myCFRelease();
  CFDictionarySetValue(Mutable, @"subnet-addresses", v5);
  CFDictionarySetValue(Mutable, @"subnet-masks", v6);
  myCFRelease();
  myCFRelease();
  return Mutable;
}

+ (__CFDictionary)copyRouteCacheFromRoutes:(__CFArray *)a3 isIPv6:(BOOL)a4
{
  return (__CFDictionary *)_NEVirtualInterfaceCopyRouteCacheFromRoutes(a3, a4);
}

+ (BOOL)hasRequiredFrameworks
{
  return 1;
}

+ (id)sessionWithConfiguration:(id)a3 andType:(int)a4 andServer:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int64_t v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = ne_session_type_to_string();
    uint64_t v11 = [v7 identifier];
    id v12 = [v7 name];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    __int16 v68 = 2112;
    long long v69 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating session with type %s, id %@ (%@)", buf, 0x20u);
  }
  switch(a4)
  {
    case 1:
      id v13 = [v7 VPN];

      if (v13)
      {
        id v14 = [v7 VPN];
        int64_t v15 = [v14 protocol];
        long long v16 = (char *)[v15 type];

        if ((unint64_t)(v16 - 1) < 2)
        {
          SEL v46 = [NESMLegacySession alloc];
          v23 = [v7 VPN];
          uint64_t v24 = [v23 protocol];
          dispatch_queue_t v30 = v46;
          __int16 v31 = v7;
          BOOL v32 = v8;
          unint64_t v33 = v24;
          int v34 = 1;
          goto LABEL_49;
        }
        if (v16 == (char *)4)
        {
          v54 = [v7 VPN];
          v23 = [v54 protocol];

          id v55 = [v7 VPN];
          id v56 = [v55 tunnelType];

          if (v56 == (id)1) {
            v57 = NESMVPNSession;
          }
          else {
            v57 = NESMTransparentProxySession;
          }
          id v65 = (NESMVPNSession *)[v57 alloc];
          uint64_t v24 = [v23 pluginType];
          id v59 = v65;
          id v60 = v7;
          id v61 = v8;
          v62 = v23;
          v63 = v24;
          uint64_t v64 = 1;
          goto LABEL_65;
        }
        if (v16 != (char *)5) {
          goto LABEL_47;
        }
        uint64_t v17 = [v7 VPN];
        SEL v18 = [v17 protocol];
        if ([v18 enableFallback])
        {
          id v19 = [v7 VPN];
          int64_t v20 = [v19 protocol];
          unsigned __int8 v21 = [v20 includeAllNetworks];

          if ((v21 & 1) == 0)
          {
            uint64_t v22 = [NESMIKEv2VPNFallbackSession alloc];
            v23 = [v7 VPN];
            uint64_t v24 = [v23 protocol];
            uint64_t v25 = (NESMFlowDivertSession *)sub_10008BD58(v22, v7, v8, v24);
            goto LABEL_66;
          }
        }
        else
        {
        }
        id v13 = [NESMIKEv2VPNSession alloc];
        v23 = [v7 VPN];
        uint64_t v24 = [v23 protocol];
        if (v13)
        {
          *(void *)buf = v13;
          *(void *)&buf[8] = NESMIKEv2VPNSession;
          uint64_t v25 = (NESMFlowDivertSession *)[[[NESMFlowDivertSession alloc] initWithConfiguration:v7 andServer:v8 andProtocol:v24 andPluginType:@"com.apple.NetworkExtension.IKEv2Provider" andSessionType:1 sessionQueue:0 messageQueue:0 tunnelKind:1 parent:0];
          goto LABEL_66;
        }
        goto LABEL_67;
      }
      goto LABEL_68;
    case 2:
      id v13 = [v7 appVPN];

      if (v13)
      {
        int v26 = [v7 appVPN];
        __int16 v27 = [v26 protocol];
        id v28 = [v27 type];

        if (v28 == (id)5)
        {
          id v13 = [NESMIKEv2VPNSession alloc];
          v23 = [v7 appVPN];
          uint64_t v24 = [v23 protocol];
          if (!v13) {
            goto LABEL_67;
          }
          *(void *)buf = v13;
          *(void *)&buf[8] = NESMIKEv2VPNSession;
          uint64_t v25 = (NESMFlowDivertSession *)[[(objc_super *)buf initWithConfiguration:v7 andServer:v8 andProtocol:v24 andPluginType:@"com.apple.NetworkExtension.IKEv2Provider" andSessionType:2 sessionQueue:0 messageQueue:0 tunnelKind:1 parent:0];
        }
        else if (v28 == (id)4)
        {
          id v47 = [v7 appVPN];
          v23 = [v47 protocol];

          id v48 = [v7 appVPN];
          id v49 = [v48 tunnelType];

          if (v49 == (id)2)
          {
            id v50 = [NESMFlowDivertSession alloc];
            uint64_t v24 = [v23 pluginType];
            uint64_t v25 = [(NESMFlowDivertSession *)v50 initWithConfiguration:v7 andServer:v8 andProtocol:v23 andPluginType:v24];
          }
          else
          {
            v58 = [NESMVPNSession alloc];
            uint64_t v24 = [v23 pluginType];
            id v59 = v58;
            id v60 = v7;
            id v61 = v8;
            v62 = v23;
            v63 = v24;
            uint64_t v64 = 2;
LABEL_65:
            uint64_t v25 = [(NESMVPNSession *)v59 initWithConfiguration:v60 andServer:v61 andProtocol:v62 andPluginType:v63 andSessionType:v64];
          }
        }
        else
        {
          if (v28 != (id)1) {
            goto LABEL_47;
          }
          __int16 v29 = [NESMLegacySession alloc];
          v23 = [v7 appVPN];
          uint64_t v24 = [v23 protocol];
          dispatch_queue_t v30 = v29;
          __int16 v31 = v7;
          BOOL v32 = v8;
          unint64_t v33 = v24;
          int v34 = 2;
LABEL_49:
          uint64_t v25 = (NESMFlowDivertSession *)sub_100067E34(v30, v31, v32, v33, v34);
        }
LABEL_66:
        id v13 = (NESMIKEv2VPNSession *)v25;
        goto LABEL_67;
      }
      goto LABEL_68;
    case 3:
      if (!+[NESMAlwaysOnSession hasRequiredFrameworks])
      {
        uint64_t v44 = ne_log_obj();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
          goto LABEL_46;
        }
        *(_WORD *)buf = 0;
        id v45 = "Cannot create an Always On VPN session, some required frameworks are missing";
        goto LABEL_72;
      }
      id v13 = [v7 alwaysOnVPN];

      if (v13)
      {
        uint64_t v35 = NESMAlwaysOnSession;
        goto LABEL_38;
      }
      goto LABEL_68;
    case 4:
      id v13 = [v7 contentFilter];
      if (!v13) {
        goto LABEL_68;
      }
      xpc_object_t v36 = [v7 contentFilter];
      objc_super v37 = [v36 provider];
      if ([v37 filterBrowsers]) {
        goto LABEL_23;
      }
      BOOL v38 = [v7 contentFilter];
      uint64_t v39 = [v38 provider];
      if ([v39 filterSockets])
      {

LABEL_23:
LABEL_24:
        uint64_t v35 = NESMFilterSession;
        goto LABEL_38;
      }
      uint64_t v51 = [v7 contentFilter];
      v52 = [v51 provider];
      unsigned __int8 v53 = [v52 filterPackets];

      if (v53) {
        goto LABEL_24;
      }
LABEL_47:
      id v13 = 0;
LABEL_68:
      [(NESMVPNSession *)v13 handleInitializeState];

      return v13;
    case 5:
      id v13 = [v7 pathController];

      if (!v13) {
        goto LABEL_68;
      }
      uint64_t v35 = NESMPathControllerSession;
      goto LABEL_38;
    case 6:
      id v13 = [v7 dnsProxy];

      if (v13)
      {
        __int16 v40 = [NESMDNSProxySession alloc];
        v23 = [v7 dnsProxy];
        uint64_t v24 = [v23 protocol];
        v41 = [v7 dnsProxy];
        __int16 v42 = [v41 protocol];
        uint64_t v43 = [v42 pluginType];
        id v13 = [(NESMDNSProxySession *)v40 initWithConfiguration:v7 andServer:v8 andProtocol:v24 andPluginType:v43];

LABEL_67:
      }
      goto LABEL_68;
    case 7:
      if (+[NESMDNSSettingsSession hasRequiredFrameworks])
      {
        id v13 = [v7 dnsSettings];

        if (!v13) {
          goto LABEL_68;
        }
        uint64_t v35 = NESMDNSSettingsSession;
        goto LABEL_38;
      }
      uint64_t v44 = ne_log_obj();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        goto LABEL_46;
      }
      *(_WORD *)buf = 0;
      id v45 = "Cannot create a DNS Settings session, some required frameworks are missing";
      goto LABEL_72;
    case 8:
      if (+[NESMAppPushSession hasRequiredFrameworks])
      {
        id v13 = [v7 appPush];

        if (!v13) {
          goto LABEL_68;
        }
        uint64_t v35 = NESMAppPushSession;
        goto LABEL_38;
      }
      uint64_t v44 = ne_log_obj();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        goto LABEL_46;
      }
      *(_WORD *)buf = 0;
      id v45 = "Cannot create an App Push session, some required frameworks are missing";
      goto LABEL_72;
    case 9:
      if (+[NESMRelaySession hasRequiredFrameworks])
      {
        id v13 = [v7 relay];

        if (v13)
        {
          uint64_t v35 = NESMRelaySession;
LABEL_38:
          id v13 = (NESMIKEv2VPNSession *)[[v35 alloc] initWithConfiguration:v7 andServer:v8];
        }
        goto LABEL_68;
      }
      uint64_t v44 = ne_log_obj();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        id v45 = "Cannot create an Relay session, some required frameworks are missing";
LABEL_72:
        _os_log_fault_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, v45, buf, 2u);
      }
LABEL_46:

      goto LABEL_47;
    default:
      goto LABEL_47;
  }
}

@end