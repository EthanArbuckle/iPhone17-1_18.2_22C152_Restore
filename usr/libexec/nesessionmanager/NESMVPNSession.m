@interface NESMVPNSession
- (BOOL)establishIPCPending;
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)hasProviderWithBundleIdentifier:(id)a3;
- (BOOL)initializePlugins;
- (BOOL)interface:(id)a3 hasIPAddress:(id)a4 currentFlags:(unint64_t)a5;
- (BOOL)isSecondaryConnection;
- (BOOL)isSecondaryInterface;
- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4;
- (BOOL)prepareConfigurationForStart;
- (BOOL)proxyEnabled:(id)a3;
- (BOOL)reassertedByPlugin;
- (BOOL)resetPerAppPolicy;
- (BOOL)shouldSendIPCAttachForPlugin:(id)a3;
- (BOOL)sleepOnDisconnect;
- (BOOL)stopped;
- (BOOL)supportsDefaultDrop;
- (NEDNSSettingsNetworkAgent)dnsAgent;
- (NESMSession)parent;
- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7;
- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7 sessionQueue:(id)a8 messageQueue:(id)a9 tunnelKind:(int64_t)a10 parent:(id)a11;
- (NESMVPNSessionState)stateHandler;
- (NETunnelNetworkSettings)pluginConfigurationEntities;
- (NEUserNotification)notification;
- (NEVPNAuthenticationPlugin)authenticationPlugin;
- (NEVPNProtocol)protocol;
- (NEVPNTunnelPlugin)primaryTunnelPlugin;
- (NEVirtualInterface_s)virtualInterface;
- (NSMutableArray)setConfigurationCompletionHandlerArray;
- (NSMutableDictionary)cachedStateHandlers;
- (NSMutableDictionary)connectParameters;
- (NSString)authenticationPluginBundleIdentifier;
- (NSString)delegateInterfaceAddress;
- (NSString)description;
- (NSString)extensibleSSOProvider;
- (NSString)interfaceName;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (NSString)providerDesignatedRequirement;
- (NWNetworkAgentRegistration)dnsAgentRegistration;
- (OS_xpc_object)lastStartMessage;
- (id)copyExtendedStatus;
- (id)copyStatistics;
- (id)copyTunnelInterfaceName;
- (id)pluginCompletionHandler;
- (id)pluginPIDArray;
- (int)getVirtualInterfaceMTU:(id)a3;
- (int)sessionType;
- (int64_t)agentPluginClass;
- (int64_t)parentType;
- (int64_t)state;
- (int64_t)tunnelKind;
- (unsigned)isInterfaceIPAvailable:(const char *)a3;
- (void)addDefaultDropPolicyForPluginUUIDs:(id)a3;
- (void)checkPluginInstalledWithCompletionHandler:(id)a3;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)createConnectParametersWithStartMessage:(id)a3;
- (void)dealloc;
- (void)handleCaptiveNetworkPluginsChanged;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleChangeEventForRankedInterfaces;
- (void)handleEstablishIPCMessage:(id)a3;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInitializeState;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleNetworkPrepareResult:(id)a3;
- (void)handleSleepTime:(double)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogout;
- (void)handleUserSwitch;
- (void)handleWakeup;
- (void)install;
- (void)installPended;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)plugin:(id)a3 didAttachIPCWithEndpoint:(id)a4;
- (void)plugin:(id)a3 didFinishAuthenticationWithResults:(id)a4 status:(int)a5 andError:(id)a6;
- (void)plugin:(id)a3 didInitializeWithUUIDs:(id)a4;
- (void)plugin:(id)a3 didRequestVirtualInterfaceWithParameters:(id)a4 completionHandler:(id)a5;
- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5;
- (void)plugin:(id)a3 didSetStatus:(int)a4 andDisconnectError:(id)a5;
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)pluginDidAcknowledgeSleep:(id)a3;
- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4;
- (void)pluginDidDetachIPC:(id)a3;
- (void)pluginDidDispose:(id)a3;
- (void)prepareNetwork;
- (void)queueChangesToTunnelConfiguration:(id)a3 completionHandler:(id)a4;
- (void)registerSession:(id)a3 fromClient:(id)a4;
- (void)requestInstall;
- (void)requestUninstall;
- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3;
- (void)sendEstablishIPCReply;
- (void)setAuthenticationPlugin:(id)a3;
- (void)setCachedStateHandlers:(id)a3;
- (void)setConnectParameters:(id)a3;
- (void)setDelegateInterfaceAddress:(id)a3;
- (void)setDelegateInterfaceName:(id)a3;
- (void)setDnsAgent:(id)a3;
- (void)setDnsAgentRegistration:(id)a3;
- (void)setEndpointInEstablishIPCReply:(id)a3 forPlugin:(id)a4;
- (void)setInterfaceName:(id)a3;
- (void)setIsSecondaryConnection:(BOOL)a3;
- (void)setIsSecondaryInterface:(BOOL)a3;
- (void)setLastDisconnectError:(id)a3;
- (void)setLastStartMessage:(id)a3;
- (void)setLastStopReason:(int)a3;
- (void)setNotification:(id)a3;
- (void)setParent:(id)a3;
- (void)setParentType:(int64_t)a3;
- (void)setPluginCompletionHandler:(id)a3;
- (void)setPluginConfigurationEntities:(id)a3;
- (void)setPrimaryTunnelPlugin:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setProviderDesignatedRequirement:(id)a3;
- (void)setReassertedByPlugin:(BOOL)a3;
- (void)setSessionType:(int)a3;
- (void)setSetConfigurationCompletionHandlerArray:(id)a3;
- (void)setSleepOnDisconnect:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setStateHandler:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStopped:(BOOL)a3;
- (void)setTunnelKind:(int64_t)a3;
- (void)setVirtualInterface:(NEVirtualInterface_s *)a3;
- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4;
- (void)uninstall;
@end

@implementation NESMVPNSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStartMessage, 0);
  objc_storeStrong((id *)&self->_dnsAgentRegistration, 0);
  objc_storeStrong((id *)&self->_dnsAgent, 0);
  objc_storeStrong((id *)&self->_delegateInterfaceAddress, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong(&self->_pluginCompletionHandler, 0);
  objc_storeStrong((id *)&self->_setConfigurationCompletionHandlerArray, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_pluginConfigurationEntities, 0);
  objc_storeStrong((id *)&self->_cachedStateHandlers, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_primaryTunnelPlugin, 0);
  objc_storeStrong((id *)&self->_authenticationPlugin, 0);
  objc_storeStrong((id *)&self->_connectParameters, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_sliceStartError, 0);
  objc_storeStrong((id *)&self->_slicePendingStartPlugin, 0);
  objc_storeStrong((id *)&self->_sliceInterfaceName, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_lastSetPathOverrideData, 0);
  objc_storeStrong((id *)&self->_pathOverrideAgent, 0);
  objc_storeStrong(&self->_stopCompletionHandler, 0);
  objc_storeStrong((id *)&self->_retryCounter, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_IDSNexusDomain, 0);
  objc_storeStrong((id *)&self->_IDSNexusPathEvaluator, 0);
  objc_storeStrong((id *)&self->_pendingConfigurationChangeTimer, 0);
  objc_storeStrong(&self->_pendingConfigurationChangeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_establishIPCMessage, 0);
  objc_storeStrong((id *)&self->_establishIPCReply, 0);

  objc_storeStrong((id *)&self->_tunnelConfigQueue, 0);
}

- (void)setLastStartMessage:(id)a3
{
}

- (OS_xpc_object)lastStartMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 672, 1);
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setDnsAgentRegistration:(id)a3
{
}

- (NWNetworkAgentRegistration)dnsAgentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 664, 1);
}

- (void)setDnsAgent:(id)a3
{
}

- (NEDNSSettingsNetworkAgent)dnsAgent
{
  return (NEDNSSettingsNetworkAgent *)objc_getProperty(self, a2, 656, 1);
}

- (void)setDelegateInterfaceAddress:(id)a3
{
}

- (NSString)delegateInterfaceAddress
{
  return (NSString *)objc_getProperty(self, a2, 648, 1);
}

- (void)setNotification:(id)a3
{
}

- (NEUserNotification)notification
{
  return (NEUserNotification *)objc_getProperty(self, a2, 640, 1);
}

- (void)setReassertedByPlugin:(BOOL)a3
{
  self->_reassertedByPlugin = a3;
}

- (BOOL)reassertedByPlugin
{
  return self->_reassertedByPlugin;
}

- (void)setPluginCompletionHandler:(id)a3
{
}

- (id)pluginCompletionHandler
{
  return objc_getProperty(self, a2, 632, 1);
}

- (void)setSetConfigurationCompletionHandlerArray:(id)a3
{
}

- (NSMutableArray)setConfigurationCompletionHandlerArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 624, 1);
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 616, 1);
}

- (void)setTunnelKind:(int64_t)a3
{
  self->_tunnelKind = a3;
}

- (int64_t)tunnelKind
{
  return self->_tunnelKind;
}

- (void)setIsSecondaryInterface:(BOOL)a3
{
  self->_isSecondaryInterface = a3;
}

- (BOOL)isSecondaryInterface
{
  return self->_isSecondaryInterface;
}

- (void)setParent:(id)a3
{
}

- (NESMSession)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (NESMSession *)WeakRetained;
}

- (void)setParentType:(int64_t)a3
{
  self->_parentType = a3;
}

- (int64_t)parentType
{
  return self->_parentType;
}

- (void)setPluginConfigurationEntities:(id)a3
{
}

- (NETunnelNetworkSettings)pluginConfigurationEntities
{
  return (NETunnelNetworkSettings *)objc_getProperty(self, a2, 584, 1);
}

- (void)setCachedStateHandlers:(id)a3
{
}

- (NSMutableDictionary)cachedStateHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 576, 1);
}

- (void)setProtocol:(id)a3
{
}

- (NEVPNProtocol)protocol
{
  return (NEVPNProtocol *)objc_getProperty(self, a2, 568, 1);
}

- (void)setPrimaryTunnelPlugin:(id)a3
{
}

- (NEVPNTunnelPlugin)primaryTunnelPlugin
{
  return (NEVPNTunnelPlugin *)objc_getProperty(self, a2, 560, 1);
}

- (void)setAuthenticationPlugin:(id)a3
{
}

- (NEVPNAuthenticationPlugin)authenticationPlugin
{
  return (NEVPNAuthenticationPlugin *)objc_getProperty(self, a2, 552, 1);
}

- (void)setVirtualInterface:(NEVirtualInterface_s *)a3
{
  self->_virtualInterface = a3;
}

- (NEVirtualInterface_s)virtualInterface
{
  return self->_virtualInterface;
}

- (void)setSleepOnDisconnect:(BOOL)a3
{
  self->_sleepOnDisconnect = a3;
}

- (BOOL)sleepOnDisconnect
{
  return self->_sleepOnDisconnect;
}

- (void)setConnectParameters:(id)a3
{
}

- (NSMutableDictionary)connectParameters
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 536, 1);
}

- (void)setStateHandler:(id)a3
{
}

- (NESMVPNSessionState)stateHandler
{
  return (NESMVPNSessionState *)objc_getProperty(self, a2, 528, 1);
}

- (void)setSessionType:(int)a3
{
  self->_sessionType = a3;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (int64_t)state
{
  return self->_state;
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (!v9) {
    goto LABEL_20;
  }
  if (self)
  {
    int coreTelephonyConnType = self->_coreTelephonyConnType;
    if (coreTelephonyConnType == 36) {
      goto LABEL_20;
    }
  }
  else
  {
    int coreTelephonyConnType = 0;
  }
  if (coreTelephonyConnType != a4) {
    goto LABEL_20;
  }
  if ([v9 state] == 2)
  {
    v13 = [v10 interfaceName];

    if (v13)
    {
      if (self)
      {
        if (objc_getProperty(self, v12, 496, 1))
        {
          id v15 = objc_getProperty(self, v14, 496, 1);
          v16 = [v10 interfaceName];
          unsigned __int8 v17 = [v15 isEqual:v16];

          if ((v17 & 1) == 0)
          {
            v18 = ne_log_obj();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v63 = [(NESMSession *)self configuration];
              v61 = [v63 appVPN];
              v60 = [v61 protocol];
              v55 = [v60 sliceUUID];
              unsigned int v56 = [v10 state];
              id Property = objc_getProperty(self, v57, 496, 1);
              v59 = [v10 interfaceName];
              *(_DWORD *)buf = 138413570;
              v65 = self;
              __int16 v66 = 1024;
              int v67 = a4;
              __int16 v68 = 2112;
              v69 = v55;
              __int16 v70 = 1024;
              unsigned int v71 = v56;
              __int16 v72 = 2112;
              id v73 = Property;
              __int16 v74 = 2112;
              v75 = v59;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@: VPN Slice connectionStateChanged - Invalid transition <type %d> - sliceUUID %@ : <state %d: slice ifname %@ --> %@>", buf, 0x36u);
            }
LABEL_19:
            v30 = [(NESMVPNSession *)self stateHandler];
            [v30 handleStop];

            goto LABEL_20;
          }
          goto LABEL_20;
        }
        v31 = [v10 interfaceName];
        objc_setProperty_atomic(self, v32, v31, 496);
      }
      else
      {
        v31 = [v10 interfaceName];
      }

      v33 = ne_log_obj();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = [(NESMSession *)self configuration];
        v35 = [v34 appVPN];
        v36 = [v35 protocol];
        v37 = [v36 sliceUUID];
        unsigned int v39 = [v10 state];
        if (self) {
          id v40 = objc_getProperty(self, v38, 496, 1);
        }
        else {
          id v40 = 0;
        }
        *(_DWORD *)buf = 138413314;
        v65 = self;
        __int16 v66 = 1024;
        int v67 = a4;
        __int16 v68 = 2112;
        v69 = v37;
        __int16 v70 = 1024;
        unsigned int v71 = v39;
        __int16 v72 = 2112;
        id v73 = v40;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%@: VPN Slice connectionStateChanged <type %d> - sliceUUID %@ : <state %d: slice ifname nil --> %@>", buf, 0x2Cu);
      }
      if (self)
      {
        [(NESMVPNSession *)self setDelegateInterfaceName:objc_getProperty(self, v41, 496, 1)];
        id v43 = objc_getProperty(self, v42, 504, 1);
        if (v43)
        {
          int slicePendingStartPluginPid = self->_slicePendingStartPluginPid;

          if (slicePendingStartPluginPid)
          {
            id v46 = objc_getProperty(self, v45, 504, 1);
            uint64_t v47 = self->_slicePendingStartPluginPid;
            id v48 = v46;
            id v50 = objc_getProperty(self, v49, 512, 1);
            id v52 = objc_getProperty(self, v51, 496, 1);
            sub_1000199B0(self, v48, v47, v50, v52);

            objc_setProperty_atomic(self, v53, 0, 504);
            self->_int slicePendingStartPluginPid = 0;
            objc_setProperty_atomic(self, v54, 0, 512);
          }
        }
      }
      else
      {
        [0 setDelegateInterfaceName:0];
      }
      goto LABEL_20;
    }
  }
  if (self)
  {
    id v19 = objc_getProperty(self, v12, 496, 1);
    if (v19)
    {
      v21 = v19;
      id v22 = objc_getProperty(self, v20, 496, 1);
      id v23 = [v10 interfaceName];

      if (v22 == v23)
      {
        v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v62 = [(NESMSession *)self configuration];
          v25 = [v62 appVPN];
          v26 = [v25 protocol];
          v27 = [v26 sliceUUID];
          *(_DWORD *)buf = 138413314;
          v65 = self;
          __int16 v66 = 1024;
          int v67 = a4;
          __int16 v68 = 2112;
          v69 = v27;
          __int16 v70 = 1024;
          unsigned int v71 = [v10 state];
          __int16 v72 = 2112;
          id v73 = objc_getProperty(self, v28, 496, 1);
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@: VPN Slice connectionStateChanged <type %d> - sliceUUID %@ : <state %d: slice ifname %@ --> nil>", buf, 0x2Cu);
        }
        objc_setProperty_atomic(self, v29, 0, 496);
        goto LABEL_19;
      }
    }
  }
LABEL_20:
}

- (BOOL)supportsDefaultDrop
{
  if (![(NESMSession *)self defaultDropType] || [(NESMVPNSession *)self type] != 1) {
    return 0;
  }
  v3 = [(NESMSession *)self configuration];
  v4 = [v3 VPN];
  v5 = [v4 protocol];
  unsigned __int8 v6 = [v5 includeAllNetworks];

  return v6;
}

- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NESMVPNSession;
  [(NESMSession *)&v11 stopIfNecessaryWithReason:v4];
  stopCompletionHandler = (void (**)(void))self->_stopCompletionHandler;
  if (stopCompletionHandler)
  {
    stopCompletionHandler[2]();
    id v8 = self->_stopCompletionHandler;
    self->_stopCompletionHandler = 0;
  }
  id v9 = objc_retainBlock(v6);
  id v10 = self->_stopCompletionHandler;
  self->_stopCompletionHandler = v9;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  v41.receiver = self;
  v41.super_class = (Class)NESMVPNSession;
  [(NESMSession *)&v41 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  if (self) {
    id Property = objc_getProperty(self, v12, 424, 1);
  }
  else {
    id Property = 0;
  }
  id v14 = Property;
  if (v14 == v11)
  {
    unsigned int v15 = [v10 isEqualToString:@"path"];

    if (!v15) {
      goto LABEL_5;
    }
    v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v18 = objc_getProperty(self, v17, 424, 1);
      }
      else {
        id v18 = 0;
      }
      *(_DWORD *)buf = 134218240;
      unint64_t v43 = (unint64_t)v11;
      __int16 v44 = 2048;
      id v45 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "IDS Nexus: got EVENT %p %p", buf, 0x16u);
    }

    if (self) {
      id v20 = objc_getProperty(self, v19, 424, 1);
    }
    else {
      id v20 = 0;
    }
    id v14 = [v20 path];
    if ([v14 status] == (id)1)
    {
      if (self) {
        unint64_t IDSNexusIfIndex = self->_IDSNexusIfIndex;
      }
      else {
        unint64_t IDSNexusIfIndex = 0;
      }
      id v22 = [v14 interface];
      id v23 = [v22 interfaceIndex];

      if ((id)IDSNexusIfIndex == v23) {
        goto LABEL_4;
      }
      v24 = ne_log_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        if (self) {
          unint64_t v25 = self->_IDSNexusIfIndex;
        }
        else {
          unint64_t v25 = 0;
        }
        v26 = [v14 interface];
        id v27 = [v26 interfaceIndex];
        *(_DWORD *)buf = 134218240;
        unint64_t v43 = v25;
        __int16 v44 = 2048;
        id v45 = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "IDS Nexus interface changed %ld -> %ld", buf, 0x16u);
      }
      SEL v28 = [v14 interface];
      id v29 = [v28 interfaceIndex];
      if (self) {
        self->_unint64_t IDSNexusIfIndex = (unint64_t)v29;
      }

      v30 = [(NESMSession *)self policySession];
      v31 = [v14 interface];
      SEL v32 = [v31 interfaceName];
      char v33 = sub_100045A38((uint64_t)v30, v32);

      if (v33) {
        goto LABEL_4;
      }
      v34 = ne_log_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = [v14 interface];
        v36 = [v35 interfaceName];
        *(_DWORD *)buf = 138412290;
        unint64_t v43 = (unint64_t)v36;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to add IDS Nexus policy for %@", buf, 0xCu);
      }
    }
    else
    {
      v37 = ne_log_obj();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "IDS Nexus interface unusable", buf, 2u);
      }

      if (self) {
        self->_unint64_t IDSNexusIfIndex = 0;
      }
      v38 = [(NESMSession *)self policySession];
      char v40 = sub_100031FA0(v38, v39);

      if (v40) {
        goto LABEL_4;
      }
      v34 = ne_log_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to clear Nexus policy", buf, 2u);
      }
    }
  }
LABEL_4:

LABEL_5:
}

- (void)invalidate
{
  if (self)
  {
    [(CoreTelephonyClient *)self->_coreTelephonyClient setDelegate:0];
    objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  }
  else
  {
    [0 setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)NESMVPNSession;
  [(NESMSession *)&v4 invalidate];
  [(NESMVPNSessionState *)self->_stateHandler leave];
  stateHandler = self->_stateHandler;
  self->_stateHandler = 0;
}

- (void)handleInstalledAppsChanged
{
  v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A8A0;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)resetPerAppPolicy
{
  v2 = self;
  v3 = sub_10007ED10((uint64_t)self);
  if ([(NESMVPNSession *)v2 type] != 2 || ![(NESMVPNSession *)v2 virtualInterface]) {
    goto LABEL_45;
  }
  objc_super v4 = [(NESMSession *)v2 configuration];
  v5 = [v4 appVPN];
  id v6 = [v5 appRules];
  if (![v6 count] && !objc_msgSend(v3, "count"))
  {

    goto LABEL_45;
  }
  unsigned int v7 = [(NESMSession *)v2 isActive];

  if (!v7)
  {
LABEL_45:
    char v52 = 1;
    goto LABEL_46;
  }
  [(NESMVPNSession *)v2 virtualInterface];
  v76 = (void *)NEVirtualInterfaceCopyName();
  id v8 = [(NESMSession *)v2 policySession];
  id v9 = [(NESMSession *)v2 configuration];
  id v10 = [v9 appVPN];
  id v11 = [v10 appRules];
  v12 = [(NESMSession *)v2 uid];
  [v12 intValue];
  sub_10003E240((uint64_t)v8, v11);

  id v73 = v2;
  if (v2)
  {
    v13 = [(NESMSession *)v2 configuration];
    id v14 = [v13 appVPN];
    unsigned int v15 = [v14 appRules];

    if ([v15 count])
    {
      __int16 v74 = v3;
      id v16 = objc_alloc_init((Class)NSMutableDictionary);
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      unsigned int v71 = v15;
      id obj = v15;
      id v17 = [obj countByEnumeratingWithState:&v86 objects:buf count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v79 = *(void *)v87;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v87 != v79) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(void **)(*((void *)&v86 + 1) + 8 * i);
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            v21 = [v20 cachedMachOUUIDs];
            id v22 = [v21 countByEnumeratingWithState:&v82 objects:v90 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v83;
              do
              {
                for (j = 0; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v83 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v82 + 1) + 8 * (void)j);
                  id v27 = [v20 matchSigningIdentifier];
                  [v16 setObject:v27 forKeyedSubscript:v26];
                }
                id v23 = [v21 countByEnumeratingWithState:&v82 objects:v90 count:16];
              }
              while (v23);
            }
          }
          id v18 = [obj countByEnumeratingWithState:&v86 objects:buf count:16];
        }
        while (v18);
      }

      v2 = v73;
      v3 = v74;
      unsigned int v15 = v71;
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  SEL v28 = ne_log_obj();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = [v16 count];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v2;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: Setting the app UUID map with %lu entries", buf, 0x16u);
  }

  uint64_t v30 = [(NESMVPNSession *)v2 primaryTunnelPlugin];
  v31 = (void *)v30;
  if (v30)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000189D8;
    v92 = &unk_1000C6AE0;
    uint64_t v93 = v30;
    id v32 = v16;
    char v33 = [v31 remotePluginObjectWithErrorHandler:buf];
    [v33 setAppUUIDMap:v32];
  }
  if (!ne_session_disable_restrictions()) {
    goto LABEL_35;
  }
  v34 = [(NESMVPNSession *)v2 protocol];
  id v35 = [v34 type];
  BOOL v36 = v35 == (id)5;
  if (v35 == (id)5)
  {
    v37 = [(NESMVPNSession *)v2 protocol];
    v38 = [v37 serverAddress];
    unsigned int v39 = [v38 isEqualToString:@"0.0.0.0"];

    if (v39)
    {
      v34 = ne_log_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v2;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@: Not installing interface tunnel policies", buf, 0xCu);
      }
      goto LABEL_34;
    }
LABEL_35:
    char v67 = 0;
    goto LABEL_36;
  }
LABEL_34:
  char v67 = v36;

LABEL_36:
  v80 = [(NESMSession *)v2 policySession];
  char v40 = [(NESMSession *)v2 configuration];
  objc_super v41 = [v40 appVPN];
  id obja = [v41 appRules];
  v75 = [(NESMVPNSession *)v2 pluginPIDArray];
  SEL v42 = [(NESMVPNSession *)v2 pluginConfigurationEntities];
  uint64_t v43 = [v42 DNSSettings];
  __int16 v44 = [(NESMVPNSession *)v2 pluginConfigurationEntities];
  id v45 = [v44 proxySettings];
  unsigned __int8 v46 = [v45 enabled];
  __int16 v70 = v41;
  __int16 v72 = v40;
  v69 = v42;
  if (v46)
  {
    char v47 = 1;
  }
  else
  {
    __int16 v66 = [(NESMVPNSession *)v2 protocol];
    v65 = [v66 proxySettings];
    char v47 = [v65 enabled];
  }
  __int16 v68 = (void *)v43;
  char v48 = v43 != 0;
  SEL v49 = [(NESMSession *)v2 configuration];
  id v50 = [v49 appVPN];
  SEL v51 = [v50 excludedDomains];
  char v52 = sub_10003F7E8((uint64_t)v80, obja, v76, v75, v48, v47, v67, v3, v51);

  if ((v46 & 1) == 0)
  {
  }
  SEL v53 = [(NESMSession *)v73 configuration];
  SEL v54 = [v53 VPN];
  v55 = [v54 exceptionApps];

  if (v55)
  {
    unsigned int v56 = [(NESMSession *)v73 policySession];
    v81 = [(NESMSession *)v73 configuration];
    SEL v57 = [v81 VPN];
    v58 = [v57 exceptionApps];
    v59 = [(NESMSession *)v73 server];
    v60 = [v59 primaryPhysicalInterface];
    v61 = [v60 interfaceName];
    [(NESMSession *)v73 uid];
    v63 = v62 = v3;
    sub_10003E404((uint64_t)v56, v58, v61, (int)[v63 intValue]);

    v3 = v62;
  }

LABEL_46:
  return v52;
}

- (BOOL)prepareConfigurationForStart
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@: Default prepareConfigurationForStart", (uint8_t *)&v5, 0xCu);
  }

  return 1;
}

- (NSString)pluginType
{
  v3 = [(NESMVPNSession *)self protocol];
  id v4 = [v3 type];

  int v5 = [(NESMVPNSession *)self protocol];
  id v6 = v5;
  if (v4 == (id)4) {
    goto LABEL_4;
  }
  id v7 = [v5 type];

  if (v7 == (id)5)
  {
    id v6 = [(NESMVPNSession *)self protocol];
LABEL_4:
    id v8 = [v6 pluginType];

    goto LABEL_6;
  }
  id v8 = 0;
LABEL_6:

  return (NSString *)v8;
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    sub_10001B66C(self);
LABEL_16:
    BOOL v13 = 0;
    goto LABEL_36;
  }
  if ([(NESMVPNSession *)self type] == 2)
  {
    id v6 = [v5 appVPN];
  }
  else
  {
    if ([(NESMVPNSession *)self type] == 6) {
      [v5 dnsProxy];
    }
    else {
    id v6 = [v5 VPN];
    }
  }
  id v7 = v6;
  unsigned int v8 = [v6 isEnabled];

  id v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v3 = [(NESMSession *)self configuration];
    id v10 = [v3 name];
    *(_DWORD *)buf = 138412802;
    unsigned int v39 = self;
    __int16 v40 = 1024;
    unsigned int v41 = v8;
    __int16 v42 = 2112;
    uint64_t v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: NESMVPNSession - enabled = %d <%@>", buf, 0x1Cu);
  }
  v37.receiver = self;
  v37.super_class = (Class)NESMVPNSession;
  if (![(NESMSession *)&v37 handleUpdateConfiguration:v5]) {
    goto LABEL_16;
  }
  sub_10001B66C(self);
  if (![(NESMSession *)self disableOnDemand]) {
    goto LABEL_25;
  }
  id v11 = [(NESMSession *)self configuration];
  v12 = [v11 VPN];
  if (v12)
  {
    v3 = [v5 VPN];
    if (([v3 isOnDemandEnabled] & 1) == 0)
    {

LABEL_21:
      [(NESMSession *)self setDisableOnDemand:0];
      goto LABEL_25;
    }
  }
  id v14 = [(NESMSession *)self configuration];
  uint64_t v15 = [v14 appVPN];
  if (v15)
  {
    id v16 = (void *)v15;
    id v17 = [v5 appVPN];
    unsigned __int8 v18 = [v17 isOnDemandEnabled];

    if (v12)
    {
    }
    if ((v18 & 1) == 0) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v12)
    {
    }
  }
LABEL_25:
  if ([(NESMVPNSession *)self type] == 2)
  {
    id v19 = [(NESMSession *)self configuration];
    id v20 = [v19 appVPN];
    v21 = [v20 protocol];
    [(NESMVPNSession *)self setProtocol:v21];

    id v22 = [v5 appVPN];
  }
  else
  {
    unsigned int v23 = [(NESMVPNSession *)self type];
    uint64_t v24 = [(NESMSession *)self configuration];
    unint64_t v25 = v24;
    if (v23 != 6)
    {
      v34 = [v24 VPN];
      id v35 = [v34 protocol];
      [(NESMVPNSession *)self setProtocol:v35];

      BOOL v36 = [v5 VPN];
      LODWORD(v34) = [v36 isEnabled];

      if (!v34) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    uint64_t v26 = [v24 dnsProxy];
    id v27 = [v26 protocol];
    [(NESMVPNSession *)self setProtocol:v27];

    id v22 = [v5 dnsProxy];
  }
  SEL v28 = v22;
  unsigned __int8 v29 = [v22 isEnabled];

  if (v29)
  {
LABEL_30:
    uint64_t v30 = [(NESMVPNSession *)self stateHandler];
    [v30 handleUpdateConfiguration];
  }
LABEL_31:
  if (![(NESMVPNSession *)self resetPerAppPolicy])
  {
    v31 = ne_log_obj();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v39 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@: Failed to reset the per-app policy after a configuration update, disconnecting", buf, 0xCu);
    }

    id v32 = [(NESMVPNSession *)self stateHandler];
    [v32 handleStop];
  }
  BOOL v13 = 1;
LABEL_36:

  return v13;
}

- (void)prepareNetwork
{
  if ((id)[(NESMVPNSession *)self parentType] == (id)1)
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [(NESMVPNSession *)self interfaceName];
      *(_DWORD *)block = 138412802;
      *(void *)&block[4] = self;
      *(_WORD *)&block[12] = 2112;
      *(void *)&block[14] = v9;
      *(_WORD *)&block[22] = 2080;
      BOOL v13 = "-[NESMVPNSession prepareNetwork]";
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@[%@]:%s:: enter", block, 0x20u);
    }
    id v4 = [(NESMVPNSession *)self interfaceName];
    unsigned int v5 = -[NESMVPNSession isInterfaceIPAvailable:](self, "isInterfaceIPAvailable:", [v4 UTF8String]);

    if (v5)
    {
      id v6 = [(NESMVPNSession *)self interfaceName];
      [(NESMVPNSession *)self handleNetworkPrepareResult:v6];
    }
  }
  else if ((id)[(NESMVPNSession *)self tunnelKind] == (id)2 {
         && (id)[(NESMVPNSession *)self parentType] == (id)2)
  }
  {
    id v10 = [(NESMVPNSession *)self parent];
    id v7 = self;
    if (v10)
    {
      unsigned int v8 = [v10 queue];
      *(void *)block = _NSConcreteStackBlock;
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = sub_10008C2C8;
      BOOL v13 = (const char *)&unk_1000C6C38;
      id v14 = v7;
      id v15 = v10;
      dispatch_async(v8, block);
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)NESMVPNSession;
    [(NESMSession *)&v11 prepareNetwork];
  }
}

- (void)setLastDisconnectError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NESMVPNSession;
  [(NESMSession *)&v9 setLastDisconnectError:v4];
  if ((id)[(NESMVPNSession *)self parentType] == (id)2)
  {
    unsigned int v5 = [(NESMVPNSession *)self parent];
    id v6 = self;
    id v7 = v4;
    if (v5)
    {
      unsigned int v8 = [v5 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008CAE0;
      block[3] = &unk_1000C6958;
      block[4] = v5;
      objc_super v11 = v6;
      id v12 = v7;
      dispatch_async(v8, block);
    }
  }
}

- (void)setLastStopReason:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NESMVPNSession;
  -[NESMSession setLastStopReason:](&v8, "setLastStopReason:");
  if ((id)[(NESMVPNSession *)self parentType] == (id)2)
  {
    unsigned int v5 = [(NESMVPNSession *)self parent];
    id v6 = self;
    if (v5)
    {
      id v7 = [v5 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008C9C8;
      block[3] = &unk_1000C6E00;
      block[4] = v5;
      id v10 = v6;
      int v11 = a3;
      dispatch_async(v7, block);
    }
  }
}

- (void)setStatus:(int)a3
{
  v61.receiver = self;
  v61.super_class = (Class)NESMVPNSession;
  -[NESMSession setStatus:](&v61, "setStatus:");
  if ((id)[(NESMVPNSession *)self parentType] == (id)1)
  {
    uint64_t v5 = [(NESMVPNSession *)self parent];
    id v6 = self;
    id v7 = v6;
    if (!v5 || !v6) {
      goto LABEL_44;
    }
    objc_super v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v31 = [(NESMVPNSession *)v7 interfaceName];
      uint64_t v32 = ne_session_status_to_string();
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2080;
      v69 = "-[NESMAlwaysOnSession setStatusFromSession:andStatus:]";
      LOWORD(v70) = 2080;
      *(void *)((char *)&v70 + 2) = v32;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: VPN Status to Parent: %s", buf, 0x2Au);
    }
    objc_super v9 = [(id)v5 queue];
    block = _NSConcreteStackBlock;
    uint64_t v63 = 3221225472;
    v64 = sub_10000BE9C;
    v65 = &unk_1000C6DD8;
    uint64_t v66 = v5;
    LODWORD(v67) = a3;
    dispatch_async(v9, &block);

    if (a3 != 1)
    {
      if (a3 == 3) {
        sub_100008AFC((void *)v5, v7);
      }
      goto LABEL_44;
    }
    if ((*(unsigned char *)(v5 + 353) & 1) != 0
      || ([(NESMVPNSession *)v7 interfaceName],
          id v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = -[NESMVPNSession isInterfaceIPAvailable:](v7, "isInterfaceIPAvailable:", [v14 UTF8String]), v14, !v15))
    {
      id v16 = ne_log_obj();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
LABEL_43:

        goto LABEL_44;
      }
      uint64_t v30 = [(NESMVPNSession *)v7 interfaceName];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2080;
      v69 = "-[NESMAlwaysOnSession setStatusFromSession:andStatus:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: Session stopped or interface down, no retry", buf, 0x20u);
LABEL_28:

      goto LABEL_43;
    }
    id v16 = v7;
    if (!objc_getProperty((id)v5, v17, 408, 1)
      || ([v16 interfaceName],
          unsigned __int8 v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          !v18))
    {

LABEL_26:
      uint64_t v30 = ne_log_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        objc_super v37 = [v16 interfaceName];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v37;
        *(_WORD *)&buf[22] = 2080;
        v69 = "-[NESMAlwaysOnSession alwaysOnRetry:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: failed to get retry interval", buf, 0x20u);
      }
      goto LABEL_28;
    }
    id v20 = objc_getProperty((id)v5, v19, 408, 1);
    v21 = [v16 interfaceName];
    id v22 = [v20 objectForKeyedSubscript:v21];

    if (v22) {
      goto LABEL_19;
    }
    id v22 = objc_alloc_init(NESMAlwaysOnSessionRetryCounter);
    int v23 = 1;
    id v25 = objc_getProperty((id)v5, v24, 408, 1);
    uint64_t v26 = [v16 interfaceName];
    [v25 setObject:v22 forKeyedSubscript:v26];

    if (v22)
    {
LABEL_19:
      int64_t interval = v22->_interval;
      if (interval)
      {
        int64_t retryCount = v22->_retryCount;
        v22->_int64_t retryCount = retryCount + 1;
        if (retryCount < *(void *)(v5 + 440)) {
          goto LABEL_35;
        }
        interval *= *(void *)(v5 + 432);
        v22->_int64_t interval = interval;
        int64_t v29 = *(void *)(v5 + 424);
        if (interval > v29)
        {
          v22->_int64_t interval = v29;
          int64_t interval = v29;
        }
LABEL_34:
        v22->_int64_t retryCount = 0;
LABEL_35:

        if ((interval & 0x8000000000000000) == 0)
        {
          if (interval)
          {
            v34 = ne_log_obj();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              v38 = [v16 interfaceName];
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v5;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v38;
              *(_WORD *)&buf[22] = 2080;
              v69 = "-[NESMAlwaysOnSession alwaysOnRetry:]";
              LOWORD(v70) = 2048;
              *(void *)((char *)&v70 + 2) = interval;
              _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: Retrying in %ld Secs", buf, 0x2Au);
            }
            dispatch_time_t v35 = dispatch_time(0, 1000000000 * interval);
            BOOL v36 = [v16 queue];
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = sub_10000BCB4;
            v69 = (const char *)&unk_1000C6C38;
            *(void *)&long long v70 = v5;
            *((void *)&v70 + 1) = v16;
            dispatch_after(v35, v36, buf);

            goto LABEL_42;
          }
LABEL_41:
          __int16 v40 = [v16 queue];
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_10000BB8C;
          v69 = (const char *)&unk_1000C6C38;
          *(void *)&long long v70 = v5;
          *((void *)&v70 + 1) = v16;
          dispatch_async(v40, buf);

LABEL_42:
          goto LABEL_43;
        }
        goto LABEL_26;
      }
      int v23 = 0;
    }
    char v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v39 = [v16 interfaceName];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2080;
      v69 = "-[NESMAlwaysOnSession nextRetryIntervalForSession:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%@[%@]:%s: Retrying now", buf, 0x20u);
    }
    if (v23)
    {

      goto LABEL_41;
    }
    int64_t interval = 0;
    v22->_int64_t interval = *(void *)(v5 + 416);
    goto LABEL_34;
  }
  if ((id)[(NESMVPNSession *)self parentType] != (id)2) {
    goto LABEL_45;
  }
  uint64_t v5 = [(NESMVPNSession *)self parent];
  id v10 = self;
  id v7 = v10;
  if (v5 && v10)
  {
    int v11 = [(id)v5 queue];
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10008C69C;
    v69 = (const char *)&unk_1000C6E00;
    *(void *)&long long v70 = v5;
    id v12 = v7;
    *((void *)&v70 + 1) = v12;
    int v71 = a3;
    dispatch_async(v11, buf);

    BOOL v13 = [(id)v5 queue];
    block = _NSConcreteStackBlock;
    uint64_t v63 = 3221225472;
    v64 = sub_10008C924;
    v65 = &unk_1000C6C38;
    uint64_t v66 = v5;
    char v67 = v12;
    dispatch_async(v13, &block);
  }
LABEL_44:

LABEL_45:
  unsigned int v41 = [(NESMSession *)self configuration];
  __int16 v42 = [v41 VPN];
  uint64_t v43 = [v42 protocol];
  unsigned int v44 = [v43 includeAllNetworks];

  if (!v44)
  {
LABEL_52:
    SEL v49 = [(NESMSession *)self configuration];
    uint64_t v50 = [v49 appVPN];
    if (v50)
    {
      SEL v51 = (void *)v50;
      char v52 = [(NESMSession *)self configuration];
      SEL v53 = [v52 appVPN];
      SEL v54 = [v53 protocol];
      v55 = [v54 sliceUUID];

      if (a3 == 1 && v55)
      {
        if (self)
        {
          objc_setProperty_atomic(self, v56, 0, 496);
          self->_int coreTelephonyConnType = 36;
          objc_setProperty_atomic(self, v57, 0, 504);
          self->_int slicePendingStartPluginPid = 0;
          objc_setProperty_atomic(self, v58, 0, 512);
        }
      }
    }
    else
    {
    }
    return;
  }
  id v45 = [(NESMSession *)self configuration];
  unsigned __int8 v46 = [v45 VPN];
  unsigned __int8 v47 = [v46 isOnDemandEnabled];

  if (v47)
  {
    if (a3 == 1)
    {
      [(NESMVPNSession *)self setStopped:1];
      return;
    }
    goto LABEL_52;
  }
  if (a3 != 1)
  {
    if (a3 == 3)
    {
      sub_10001CF94(self, v48);
      return;
    }
    goto LABEL_52;
  }
  if ([(NESMVPNSession *)self stopped])
  {
    v60 = ne_log_obj();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NESMVPNSession setStatus:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%@:%s: Session stopped, no retry", buf, 0x16u);
    }
  }
  else
  {
    sub_10001D000(self, v59);
  }
}

- (unsigned)isInterfaceIPAvailable:(const char *)a3
{
  if (!nwi_state_copy())
  {
    objc_super v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = [(NESMVPNSession *)self interfaceName];
      int v17 = 138412802;
      unsigned __int8 v18 = self;
      __int16 v19 = 2112;
      uint64_t v20 = (uint64_t)v15;
      __int16 v21 = 2080;
      id v22 = "-[NESMVPNSession isInterfaceIPAvailable:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@[%@]:%s:: no state", (uint8_t *)&v17, 0x20u);
    }
    goto LABEL_16;
  }
  if (!nwi_state_get_ifstate())
  {
    objc_super v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v16 = [(NESMVPNSession *)self interfaceName];
      int v17 = 138412802;
      unsigned __int8 v18 = self;
      __int16 v19 = 2112;
      uint64_t v20 = (uint64_t)v16;
      __int16 v21 = 2080;
      id v22 = "-[NESMVPNSession isInterfaceIPAvailable:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@[%@]:%s:: no ifState", (uint8_t *)&v17, 0x20u);
    }
    nwi_state_release();
LABEL_16:
    LOBYTE(v6) = 0;
    return v6;
  }
  unint64_t flags = nwi_ifstate_get_flags();
  uint64_t v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v11 = [(NESMVPNSession *)self interfaceName];
    int v17 = 138413058;
    unsigned __int8 v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = (uint64_t)v11;
    __int16 v21 = 2080;
    id v22 = "-[NESMVPNSession isInterfaceIPAvailable:]";
    __int16 v23 = 1024;
    LODWORD(v24) = flags;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@[%@]:%s:: flags %X", (uint8_t *)&v17, 0x26u);
  }
  if ((flags & 3) != 0) {
    int v6 = (flags >> 2) & 1;
  }
  else {
    int v6 = 0;
  }
  nwi_state_release();
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [(NESMVPNSession *)self interfaceName];
    BOOL v13 = (void *)v12;
    id v14 = "DOWN";
    int v17 = 138413058;
    unsigned __int8 v18 = self;
    if (v6) {
      id v14 = "UP";
    }
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2080;
    id v22 = "-[NESMVPNSession isInterfaceIPAvailable:]";
    __int16 v23 = 2080;
    SEL v24 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@[%@]:%s:: %s", (uint8_t *)&v17, 0x2Au);
  }
  return v6;
}

- (void)setIsSecondaryConnection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_isSecondaryConnection != v3)
  {
    v4->_isSecondaryConnection = v3;
    if ((id)[(NESMVPNSession *)v4 parentType] == (id)1)
    {
      uint64_t v5 = [(NESMVPNSession *)v4 pluginConfigurationEntities];

      if (v5)
      {
        [(NESMVPNSession *)v4 requestInstall];
      }
      else
      {
        int v6 = ne_log_obj();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          int v7 = 138412290;
          objc_super v8 = v4;
          _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@: plugin configuration is not set yet", (uint8_t *)&v7, 0xCu);
        }
      }
    }
  }
  objc_sync_exit(v4);
}

- (BOOL)isSecondaryConnection
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NESMVPNSession *)v2 type] == 2 || v2->_isSecondaryConnection;
  objc_sync_exit(v2);

  return v3;
}

- (void)uninstall
{
  int64_t v3 = [(NESMVPNSession *)self parentType];
  if (v3 == 1)
  {
    id v4 = [(NESMVPNSession *)self parent];
    uint64_t v5 = self;
    int v6 = v5;
    if (v4 && v5 && [(NESMVPNSession *)v5 virtualInterface])
    {
      id v7 = [v6 virtualInterface];
      objc_super v8 = [v6 interfaceName];
      myCFRetain();
      objc_super v9 = [v4 queue];
      *(void *)block = _NSConcreteStackBlock;
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = sub_10000B854;
      v34 = (const char *)&unk_1000C6930;
      dispatch_time_t v35 = v4;
      id v36 = v8;
      id v37 = v7;
      id v10 = v8;
      dispatch_async(v9, block);
    }
    goto LABEL_6;
  }
  if (!self
    || ([(NESMSession *)self policySession],
        int v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = sub_100031AC8((uint64_t)v11),
        v11,
        (v12 & 1) == 0))
  {
    id v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v6 = [(NESMVPNSession *)self interfaceName];
    *(_DWORD *)block = 138412802;
    *(void *)&block[4] = self;
    *(_WORD *)&block[12] = 2112;
    *(void *)&block[14] = v6;
    *(_WORD *)&block[22] = 2080;
    v34 = "-[NESMVPNSession uninstall]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@[%@]:%s: removeTunnelDataPolicy failed", block, 0x20u);
LABEL_6:

LABEL_10:
  }
  if ([(NESMVPNSession *)self virtualInterface])
  {
    BOOL v13 = [(NESMSession *)self configuration];
    id v14 = [v13 VPN];
    unsigned int v15 = [v14 protocol];
    if ([v15 type] == (id)1)
    {
      BOOL v16 = 1;
    }
    else
    {
      id v22 = [(NESMSession *)self configuration];
      __int16 v23 = [v22 VPN];
      SEL v24 = [v23 protocol];
      if ([v24 type] == (id)2)
      {
        BOOL v16 = 1;
      }
      else
      {
        id v27 = [(NESMSession *)self configuration];
        [v27 VPN];
        v25 = int64_t v28 = v3;
        uint64_t v26 = [v25 protocol];
        BOOL v16 = [v26 type] == (id)3;

        int64_t v3 = v28;
      }
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10001DFAC;
    v31[3] = &unk_1000C59B8;
    v31[4] = self;
    BOOL v32 = v16;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001E0C4;
    v29[3] = &unk_1000C67D0;
    v29[4] = self;
    BOOL v30 = v3 == 1;
    [(NESMVPNSession *)self queueChangesToTunnelConfiguration:v31 completionHandler:v29];
  }
  else
  {
    if ((id)[(NESMVPNSession *)self parentType] == (id)2)
    {
      int v17 = [(NESMVPNSession *)self parent];
      sub_10008D3B8(v17, self);
    }
    unsigned __int8 v18 = [(NESMVPNSession *)self stateHandler];
    [v18 handleClearConfigurationResult:1];

    sub_10001E278(self);
    sub_100081474(self);
    if (v3 != 1)
    {
      __int16 v19 = [(NESMSession *)self policySession];
      sub_1000319BC((uint64_t)v19);

      uint64_t v20 = [(NESMSession *)self policySession];
      sub_10002E854((uint64_t)v20);

      if (![(NESMVPNSession *)self virtualInterface])
      {
        __int16 v21 = [(NESMSession *)self policySession];
        sub_10002EA70((uint64_t)v21);
      }
    }
    sub_10001E38C(self, 0);
  }
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  uint64_t v5 = [(NESMSession *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E780;
  v6[3] = &unk_1000C6B78;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)queueChangesToTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  if (self) {
    id Property = objc_getProperty(self, v8, 376, 1);
  }
  else {
    id Property = 0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001E9D0;
  v13[3] = &unk_1000C5990;
  id v10 = Property;
  objc_copyWeak(&v16, &location);
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (int)getVirtualInterfaceMTU:(id)a3
{
  int64_t v3 = [a3 MTU];
  int v4 = [v3 intValue];

  return v4;
}

- (id)copyTunnelInterfaceName
{
  [(NESMVPNSession *)self virtualInterface];

  return (id)NEVirtualInterfaceCopyName();
}

- (void)installPended
{
}

- (void)install
{
  kdebug_trace();
  if ([(NESMVPNSession *)self virtualInterface]
    && ([(NESMVPNSession *)self pluginConfigurationEntities],
        int64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    if (!self) {
      return;
    }
    int v4 = [(NESMVPNSession *)self pluginConfigurationEntities];
    uint64_t v5 = [v4 tunnelRemoteAddress];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(NESMVPNSession *)self pluginConfigurationEntities];
      objc_super v8 = [v7 tunnelRemoteAddress];
      int v9 = NEGetAddressFamilyFromString();

      if (v9)
      {
        id v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = self;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@: Starting to set the tunnel configuration", buf, 0xCu);
        }

        if ((id)[(NESMVPNSession *)self parentType] == (id)1)
        {
          id v11 = [(NESMVPNSession *)self parent];
          id v12 = self;
          BOOL v13 = v12;
          if (v11 && [(NESMVPNSession *)v12 virtualInterface])
          {
            id v14 = [v13 virtualInterface];
            myCFRetain();
            id v15 = [v11 queue];
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = sub_10000B364;
            uint64_t v43 = (const char *)&unk_1000C6930;
            unsigned int v44 = (NESMVPNSession *)v11;
            id v46 = v14;
            id v45 = v13;
            dispatch_async(v15, buf);
          }
        }
        else
        {
          __int16 v19 = [(NESMSession *)self configuration];
          uint64_t v20 = [v19 VPN];
          __int16 v21 = [v20 protocol];
          unsigned int v22 = [v21 includeAllNetworks];

          if (v22 && (sub_100020314(self) & 1) == 0)
          {
            __int16 v23 = ne_log_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              dispatch_time_t v35 = [(NESMVPNSession *)self interfaceName];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v35;
              *(_WORD *)&buf[22] = 2080;
              uint64_t v43 = "-[NESMVPNSession setConfiguration]";
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@[%@]:%s: applyTunnelDataPolicies failed", buf, 0x20u);
            }
          }
          if (sub_1000207EC(self)) {
            goto LABEL_30;
          }
          id v11 = ne_log_obj();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
LABEL_29:

LABEL_30:
            SEL v24 = [(NESMSession *)self configuration];
            id v25 = [v24 VPN];
            uint64_t v26 = [v25 protocol];
            if ([v26 type] == (id)1)
            {
              BOOL v27 = 1;
            }
            else
            {
              int64_t v28 = [(NESMSession *)self configuration];
              int64_t v29 = [v28 VPN];
              BOOL v30 = [v29 protocol];
              if ([v30 type] == (id)2)
              {
                BOOL v27 = 1;
              }
              else
              {
                id v36 = [(NESMSession *)self configuration];
                v31 = [v36 VPN];
                BOOL v32 = [v31 protocol];
                BOOL v27 = [v32 type] == (id)3;
              }
            }

            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = sub_10002099C;
            uint64_t v43 = (const char *)&unk_1000C59B8;
            unsigned int v44 = self;
            LOBYTE(v45) = v27;
            [(NESMVPNSession *)self queueChangesToTunnelConfiguration:buf completionHandler:&stru_1000C59F8];
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_100020D30;
            v40[3] = &unk_1000C59B8;
            v40[4] = self;
            BOOL v41 = v27;
            [(NESMVPNSession *)self queueChangesToTunnelConfiguration:v40 completionHandler:&stru_1000C5A18];
            v37[4] = self;
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_100021888;
            v38[3] = &unk_1000C59B8;
            v38[4] = self;
            BOOL v39 = v27;
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472;
            v37[2] = sub_100022700;
            v37[3] = &unk_1000C5920;
            [(NESMVPNSession *)self queueChangesToTunnelConfiguration:v38 completionHandler:v37];
            return;
          }
          BOOL v13 = [(NESMVPNSession *)self interfaceName];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          *(_WORD *)&buf[22] = 2080;
          uint64_t v43 = "-[NESMVPNSession setConfiguration]";
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@[%@]:%s: updateDNSSkipPolicies failed", buf, 0x20u);
        }

        goto LABEL_29;
      }
    }
    else
    {
    }
    int v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@: configuration has invalid tunnel remote address", buf, 0xCu);
    }

    unsigned __int8 v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      char v33 = [(NESMVPNSession *)self pluginConfigurationEntities];
      v34 = [v33 tunnelRemoteAddress];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v34;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@: configuration has invalid tunnel remote address (%@)", buf, 0x16u);
    }
    sub_10001F028(self, 0);
  }
  else
  {
    id v16 = [(NESMSession *)self policySession];
    sub_1000318B0((uint64_t)v16);

    sub_10001F028(self, 1);
  }
}

- (void)requestUninstall
{
  sub_100023218(self);
  if ((id)[(NESMVPNSession *)self parentType] == (id)2)
  {
    id v5 = [(NESMVPNSession *)self parent];
    int64_t v3 = self;
    if (v5)
    {
      int v4 = [v5 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008D0BC;
      block[3] = &unk_1000C6C38;
      block[4] = v5;
      id v7 = v3;
      dispatch_async(v4, block);
    }
  }
  else
  {
    id v5 = [(NESMSession *)self server];
    [v5 requestUninstallForSession:self];
  }
}

- (void)requestInstall
{
  int64_t v3 = [(NESMVPNSession *)self pluginConfigurationEntities];
  int v4 = [v3 IPv4Settings];
  id v5 = [v4 hasDefaultRoute];

  sub_100023218(self);
  id v6 = [(NESMVPNSession *)self parent];
  if ((id)[(NESMVPNSession *)self parentType] == (id)1)
  {
    if (!v6) {
      goto LABEL_13;
    }
    id v7 = [(NESMSession *)self server];
    objc_super v8 = v7;
    int v9 = self;
    id v10 = v6;
    goto LABEL_9;
  }
  if ((id)[(NESMVPNSession *)self parentType] != (id)2)
  {
    id v7 = [(NESMSession *)self server];
    objc_super v8 = v7;
    int v9 = self;
    id v10 = 0;
LABEL_9:
    unsigned __int8 v13 = [v7 requestInstallForSession:v9 withParentSession:v10 exclusive:v5];

    if ((v13 & 1) == 0)
    {
      id v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v16 = [(NESMVPNSession *)self interfaceName];
        *(_DWORD *)int v17 = 138412546;
        *(void *)&v17[4] = self;
        *(_WORD *)&v17[12] = 2112;
        *(void *)&v17[14] = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@: config request: failed to request install [%@]", v17, 0x16u);
      }
      id v15 = +[NSError errorWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
      sub_10001E38C(self, v15);
    }
    goto LABEL_13;
  }
  id v11 = self;
  if (v6)
  {
    id v12 = [v6 queue];
    *(void *)int v17 = _NSConcreteStackBlock;
    *(void *)&v17[8] = 3221225472;
    *(void *)&v17[16] = sub_10008CBF8;
    unsigned __int8 v18 = &unk_1000C69A8;
    char v21 = (char)v5;
    __int16 v19 = v6;
    uint64_t v20 = v11;
    dispatch_async(v12, v17);
  }
LABEL_13:
}

- (void)setEndpointInEstablishIPCReply:(id)a3 forPlugin:(id)a4
{
  xpc_object_t value = a3;
  id v7 = a4;
  if (self)
  {
    if (!objc_getProperty(self, v6, 384, 1))
    {
      id Property = objc_getProperty(self, v8, 392, 1);
      xpc_object_t reply = xpc_dictionary_create_reply(Property);
      objc_setProperty_atomic(self, v11, reply, 384);
    }
    id v12 = objc_getProperty(self, v8, 384, 1);
  }
  else
  {

    id v12 = 0;
  }
  xpc_dictionary_set_value(v12, "SessionPrimaryPluginEndpoint", value);
  [(NESMVPNSession *)self sendEstablishIPCReply];
}

- (BOOL)shouldSendIPCAttachForPlugin:(id)a3
{
  int v4 = (unsigned int *)a3;
  if (![(NESMVPNSession *)self establishIPCPending]) {
    goto LABEL_7;
  }
  if (self)
  {
    if (!objc_getProperty(self, v5, 384, 1))
    {
      id Property = objc_getProperty(self, v6, 392, 1);
      xpc_object_t reply = xpc_dictionary_create_reply(Property);
      objc_setProperty_atomic(self, v9, reply, 384);
    }
    id v10 = objc_getProperty(self, v6, 384, 1);
  }
  else
  {

    id v10 = 0;
  }
  if (!xpc_dictionary_get_int64(v10, "SessionPrimaryPluginPID"))
  {
    if (self) {
      id v14 = objc_getProperty(self, v11, 384, 1);
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
    signed int v16 = sub_100018330(v4);
    xpc_dictionary_set_int64(v15, "SessionPrimaryPluginPID", v16);

    BOOL v12 = 1;
  }
  else
  {
LABEL_7:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)establishIPCPending
{
  if (self) {
    self = (NESMVPNSession *)objc_getProperty(self, a2, 392, 1);
  }
  return self != 0;
}

- (void)sendEstablishIPCReply
{
  if (self)
  {
    if (!objc_getProperty(self, a2, 384, 1))
    {
      id Property = objc_getProperty(self, v3, 392, 1);
      xpc_object_t reply = xpc_dictionary_create_reply(Property);
      objc_setProperty_atomic(self, v6, reply, 384);
    }
    id v7 = objc_getProperty(self, v3, 392, 1);
  }
  else
  {

    id v7 = 0;
  }
  xpc_dictionary_get_remote_connection(v7);
  objc_super v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  id v10 = v8;
  if (self)
  {
    id v11 = objc_getProperty(self, v9, 384, 1);
    xpc_connection_send_message(v10, v11);

    objc_setProperty_atomic(self, v12, 0, 384);
    objc_setProperty_atomic(self, v13, 0, 392);
  }
  else
  {
    xpc_connection_send_message(v8, 0);
  }
  xpc_object_t original = [(NESMVPNSession *)self stateHandler];
  [original handleEstablishIPCReplySent];
}

- (void)plugin:(id)a3 didAttachIPCWithEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NESMVPNSession *)self stateHandler];
  [v8 handlePlugin:v7 didAttachIPCWithEndpoint:v6];
}

- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NESMVPNSession *)self virtualInterface])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[NESMVPNSession plugin:didSetConfiguration:completionHandler:]", "NESMVPNSession.m", 1938, "[configuration isKindOfClass:[NEPacketTunnelNetworkSettings class]]");
    }
    [(NESMVPNSession *)self setPluginConfigurationEntities:v9];
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      SEL v12 = [(NESMVPNSession *)self interfaceName];
      id v13 = objc_retainBlock(v10);
      int v20 = 138412802;
      char v21 = self;
      __int16 v22 = 2112;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Handling set config request: session interface %@ - completionHandler %@", (uint8_t *)&v20, 0x20u);
    }
    [(NESMVPNSession *)self setPluginCompletionHandler:v10];
    id v14 = [(NESMVPNSession *)self stateHandler];
    unsigned int v15 = [v14 handleSetConfiguration];

    if (v15)
    {
      int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
      int v17 = ne_log_large_obj();
      unsigned __int8 v18 = v17;
      if (is_debug_logging_enabled)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 138412546;
          char v21 = self;
          __int16 v22 = 2112;
          id v23 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@: plugin set tunnel network settings: %@", (uint8_t *)&v20, 0x16u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = [v9 descriptionWithIndent:0 options:2];
        int v20 = 138412546;
        char v21 = self;
        __int16 v22 = 2112;
        id v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@: plugin set tunnel network settings: %@", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_13;
    }
    [(NESMVPNSession *)self setPluginConfigurationEntities:0];
    if (v10)
    {
      unsigned __int8 v18 = +[NSError errorWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
      (*((void (**)(id, NSObject *))v10 + 2))(v10, v18);
      [(NESMVPNSession *)self setPluginCompletionHandler:0];
LABEL_13:
    }
  }
}

- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4
{
  return 1;
}

- (void)setDelegateInterfaceName:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: manager set delegate interface name to %@", buf, 0x16u);
  }

  if ([(NESMVPNSession *)self virtualInterface])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100023E74;
    v7[3] = &unk_1000C58F8;
    v7[4] = self;
    id v8 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100024060;
    v6[3] = &unk_1000C5920;
    v6[4] = self;
    [(NESMVPNSession *)self queueChangesToTunnelConfiguration:v7 completionHandler:v6];
  }
}

- (void)plugin:(id)a3 didInitializeWithUUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Plugin %@ initialized with Mach-O UUIDs %@", (uint8_t *)&v9, 0x20u);
  }

  [(NESMVPNSession *)self addDefaultDropPolicyForPluginUUIDs:v7];
}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v50 = a3;
  id v8 = a5;
  if ((id)[(NESMVPNSession *)self parentType] == (id)1)
  {
    int v9 = [(NESMVPNSession *)self parent];
    id v10 = v50;
    __int16 v11 = self;
    id v12 = v8;
    if (v9 && v11)
    {
      if (v6)
      {
        __int16 v13 = [(NESMSession *)v9 queue];
        *(void *)block = _NSConcreteStackBlock;
        *(void *)&block[8] = 3221225472;
        *(void *)&block[16] = sub_10000B1E8;
        SEL v53 = &unk_1000C54F8;
        SEL v54 = v9;
        int v58 = v6;
        id v55 = v10;
        unsigned int v56 = v11;
        id v57 = v12;
        dispatch_async(v13, block);
      }
      else
      {
        unsigned int v44 = ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)block = 138412546;
          *(void *)&block[4] = v9;
          *(_WORD *)&block[12] = 2080;
          *(void *)&block[14] = "-[NESMAlwaysOnSession didStartWithPIDForSession:andVPNSession:andPID:error:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%@:%s: Got 0 pid, proceed with clean up", block, 0x16u);
        }

        id v45 = [(NESMVPNSession *)v11 stateHandler];
        [v45 handlePlugin:v10 didStartWithPID:0 error:v12];
      }
    }

    goto LABEL_27;
  }
  int64_t v14 = [(NESMVPNSession *)self tunnelKind];
  unsigned int v15 = [(NESMSession *)self server];
  int v9 = v15;
  if (v14 == 2)
  {
    signed int v16 = [(NESMVPNSession *)v15 primaryCellularInterface];
LABEL_26:
    id v10 = v16;
    id v46 = [v16 interfaceName];
    sub_1000199B0(self, v50, v6, v8, v46);

LABEL_27:
    goto LABEL_28;
  }
  int v17 = [(NESMVPNSession *)v15 primaryPhysicalInterface];
  if ([v17 type] == (id)1 || !self) {
    goto LABEL_24;
  }
  unsigned __int8 v18 = [(NESMSession *)self configuration];
  uint64_t v19 = [v18 appVPN];
  if (!v19)
  {

    goto LABEL_24;
  }
  int v20 = (void *)v19;
  char v21 = [(NESMSession *)self configuration];
  [v21 appVPN];
  __int16 v22 = v49 = v17;
  id v23 = [v22 protocol];
  __int16 v24 = [v23 sliceUUID];

  int v17 = v49;
  if (!v24)
  {
LABEL_24:

LABEL_25:
    int v9 = [(NESMSession *)self server];
    signed int v16 = [(NESMVPNSession *)v9 primaryPhysicalInterface];
    goto LABEL_26;
  }
  id v25 = v50;
  id v48 = v8;
  uint64_t v26 = [(NESMSession *)self configuration];
  uint64_t v27 = [v26 appVPN];
  if (!v27)
  {

    id v32 = 0;
LABEL_33:
    char v51 = 0;
    __int16 v42 = v48;
    uint64_t v43 = v49;
    goto LABEL_34;
  }
  int64_t v28 = (void *)v27;
  unsigned __int8 v47 = v25;
  int64_t v29 = [(NESMSession *)self configuration];
  BOOL v30 = [v29 appVPN];
  v31 = [v30 protocol];
  id v32 = [v31 sliceUUID];

  if (!v32) {
    goto LABEL_32;
  }
  if (!self->_coreTelephonyClient)
  {
    id v33 = objc_alloc((Class)CoreTelephonyClient);
    v34 = [(NESMSession *)self queue];
    dispatch_time_t v35 = (CoreTelephonyClient *)[v33 initWithQueue:v34];
    coreTelephonyClient = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v35;

    [(CoreTelephonyClient *)self->_coreTelephonyClient setDelegate:self];
    if (!self->_coreTelephonyClient)
    {
LABEL_32:
      id v25 = v47;
      goto LABEL_33;
    }
  }
  id v37 = ne_log_obj();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = [(NESMSession *)self server];
    BOOL v39 = [v38 primaryPhysicalInterface];
    __int16 v40 = [v39 interfaceName];
    *(_DWORD *)block = 138412802;
    *(void *)&block[4] = self;
    *(_WORD *)&block[12] = 2112;
    *(void *)&block[14] = v32;
    *(_WORD *)&block[22] = 2112;
    SEL v53 = v40;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%@: VPN Slice request in progress - sliceUUID %@ : primary-ifname %@ ", block, 0x20u);
  }
  BOOL v41 = self->_coreTelephonyClient;
  *(void *)block = _NSConcreteStackBlock;
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = sub_1000247AC;
  SEL v53 = &unk_1000C5A40;
  SEL v54 = self;
  id v32 = v32;
  id v55 = v32;
  id v25 = v47;
  unsigned int v56 = v47;
  int v58 = v6;
  __int16 v42 = v48;
  id v57 = v48;
  [(CoreTelephonyClient *)v41 requestSliceByUUID:v32 completion:block];
  char v51 = 1;

  uint64_t v43 = v49;
LABEL_34:

  if ((v51 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_28:
}

- (void)plugin:(id)a3 didRequestVirtualInterfaceWithParameters:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (char *)[v8 type];
  kdebug_trace();
  __int16 v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Creating a virtual interface with type %ld", buf, 0xCu);
  }

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100025380;
  v54[3] = &unk_1000C6C60;
  v54[4] = self;
  id v12 = objc_retainBlock(v54);
  if ((unint64_t)(v10 - 1) > 1)
  {
    if (v10 == (char *)3)
    {
      uint64_t v16 = [v8 ethernetAddress];
      if (v16)
      {
        int v17 = (void *)v16;
        unsigned __int8 v18 = [v8 mtu];

        if (v18)
        {
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          id v48 = sub_10002557C;
          SEL v49 = &unk_1000C58D0;
          id v50 = self;
          id v19 = v8;
          id v51 = v19;
          char v52 = v12;
          id v53 = v9;
          int v20 = v47;
          if (v19)
          {
            if ([v19 type] == (id)3)
            {
              uint64_t v21 = [v19 ethernetAddress];
              if (v21)
              {
                __int16 v22 = (void *)v21;
                id v23 = [v19 mtu];

                if (v23)
                {
                  v58[0] = @"Product Name";
                  v58[1] = kIOUserEthernetInterfaceRole;
                  *(void *)buf = @"TAP network interface";
                  *(void *)&buf[8] = @"TAP";
                  v58[2] = @"HiddenInterface";
                  v58[3] = @"IsEphemeral";
                  *(void *)&buf[16] = &__kCFBooleanTrue;
                  v60 = &__kCFBooleanTrue;
                  __int16 v24 = +[NSDictionary dictionaryWithObjects:buf forKeys:v58 count:4];
                  v56[0] = kIOEthernetHardwareAddress;
                  id v25 = [v19 ethernetAddress];
                  v57[0] = v25;
                  v56[1] = @"MaxTransferUnit";
                  uint64_t v26 = [v19 mtu];
                  v57[1] = v26;
                  v57[2] = @"utap";
                  v56[2] = @"NamePrefix";
                  v56[3] = kIOUserEthernetInterfaceMergeProperties;
                  v57[3] = v24;
                  uint64_t v27 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:4];

                  uint64_t v28 = IOEthernetControllerCreate();
                  if (v28)
                  {
                    int64_t v29 = (const void *)v28;
                    BOOL v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    dispatch_queue_t v31 = dispatch_queue_create("User Ethernet Controller queue", v30);

                    IOEthernetControllerSetDispatchQueue();
                    id v32 = objc_alloc_init(_NECompletion);
                    p_isa = (id *)&v32->super.isa;
                    if (v32)
                    {
                      objc_setProperty_nonatomic_copy(v32, v33, v20, 16);
                      objc_storeStrong(p_isa + 1, a4);
                    }
                    dispatch_time_t v35 = p_isa;
                    IOEthernetControllerRegisterBSDAttachCallback();
                    if (IOEthernetControllerSetLinkStatus())
                    {
                      id v36 = ne_log_obj();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)id v55 = 0;
                        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to bring up the user ethernet link", v55, 2u);
                      }

                      IOEthernetControllerSetDispatchQueue();
                      CFRelease(v29);
                      sub_100084264(0, v35);
                    }
                  }
                  else
                  {
                    uint64_t v43 = ne_log_obj();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)id v55 = 0;
                      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to create a ethernet controller", v55, 2u);
                    }

                    v48((uint64_t)v20, 0);
                  }

                  goto LABEL_40;
                }
              }
              BOOL v39 = ne_log_obj();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                unsigned int v44 = [v19 ethernetAddress];
                id v45 = [v19 mtu];
                *(_DWORD *)buf = 134218240;
                *(void *)&uint8_t buf[4] = v44;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v45;
                _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Cannot create a user ethernet interface without an ethernet address (%p) or an MTU (%p)", buf, 0x16u);
              }
            }
            else
            {
              BOOL v39 = ne_log_obj();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                id v40 = [v19 type];
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = v40;
                _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Wrong type for creating a user ethernet interface: %ld", buf, 0xCu);
              }
            }

            v48((uint64_t)v20, 0);
          }
LABEL_40:

          goto LABEL_34;
        }
      }
      v38 = ne_log_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        BOOL v41 = [v8 ethernetAddress];
        __int16 v42 = [v8 mtu];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v42;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Cannot create a user ethernet interface without a ethernet address (%p) or an MTU (%p)", buf, 0x16u);
      }
    }
    else
    {
      v38 = ne_log_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Cannot create a virtual interface with unknown type %ld", buf, 0xCu);
      }
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
    goto LABEL_34;
  }
  if (v10 == (char *)1 && [(NESMVPNSession *)self type] == 2)
  {
    __int16 v13 = [(NESMVPNSession *)self primaryTunnelPlugin];
    unsigned int v15 = v13;
    if (v13) {
      objc_getProperty(v13, v14, 24, 1);
    }
  }
  id v37 = [(NESMSession *)self queue];
  LODWORD(v46) = 0;
  -[NESMVPNSession setVirtualInterface:](self, "setVirtualInterface:", NEVirtualInterfaceCreateNexusExtended(), 0, v46, 0);

  if ([(NESMVPNSession *)self virtualInterface])
  {
    [(NESMVPNSession *)self virtualInterface];
    NEVirtualInterfaceEnableFlowswitch();
    if (v10 == (char *)1)
    {
      [(NESMVPNSession *)self virtualInterface];
      NEVirtualInterfaceSetMaxPendingPackets();
    }
    ((void (*)(void *))v12[2])(v12);
  }
  (*((void (**)(id, NEVirtualInterface_s *))v9 + 2))(v9, [(NESMVPNSession *)self virtualInterface]);
LABEL_34:
}

- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  uint64_t v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [(NESMVPNSession *)self interfaceName];
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    int64_t v14 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@: Handling clear config request: session interface %@", (uint8_t *)&v11, 0x16u);
  }
  [(NESMVPNSession *)self setPluginCompletionHandler:v5];
  id v7 = [(NESMVPNSession *)self stateHandler];
  unsigned int v8 = [v7 handleClearConfiguration];

  if (v8)
  {
    [(NESMVPNSession *)self setPluginConfigurationEntities:0];
  }
  else if (v5)
  {
    id v9 = +[NSError errorWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
    v5[2](v5, v9);
    [(NESMVPNSession *)self setPluginCompletionHandler:0];
  }
}

- (void)plugin:(id)a3 didSetStatus:(int)a4 andDisconnectError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 != 6 && a4)
  {
    uint64_t v13 = 0;
    goto LABEL_35;
  }
  if (!v9)
  {
    uint64_t v13 = 3;
    goto LABEL_35;
  }
  int v11 = [v9 domain];
  unsigned int v12 = [v11 isEqualToString:@"NEAgentErrorDomain"];

  if (v12)
  {
    if ([v10 code] == (id)2)
    {
      uint64_t v13 = 6;
    }
    else if ([v10 code] == (id)1)
    {
      uint64_t v13 = 7;
    }
    else
    {
      uint64_t v13 = 3;
    }
    goto LABEL_34;
  }
  int64_t v14 = [v10 domain];
  unsigned int v15 = [v14 isEqualToString:kCFErrorDomainVPNTunnel];

  if (v15)
  {
    uint64_t v16 = (uint64_t)[v10 code];
    if (v16 <= 199)
    {
      switch(v16)
      {
        case 'd':
          uint64_t v13 = 10;
          break;
        case 'e':
          uint64_t v13 = 15;
          break;
        case 'f':
          uint64_t v13 = 16;
          break;
        case 'g':
          uint64_t v13 = 17;
          break;
        case 'h':
          uint64_t v13 = 18;
          break;
        case 'i':
          uint64_t v13 = 19;
          break;
        case 'j':
          uint64_t v13 = 20;
          break;
        case 'k':
          uint64_t v13 = 21;
          break;
        case 'l':
          uint64_t v13 = 22;
          break;
        default:
          if (v16 == 1)
          {
            uint64_t v13 = 7;
          }
          else
          {
            if (v16 != 2) {
              goto LABEL_33;
            }
            uint64_t v13 = 14;
          }
          break;
      }
      goto LABEL_34;
    }
    if (v16 > 399)
    {
      if (v16 <= 499)
      {
        switch(v16)
        {
          case 400:
            uint64_t v13 = 24;
            break;
          case 401:
            uint64_t v13 = 25;
            break;
          case 402:
            uint64_t v13 = 26;
            break;
          case 403:
            uint64_t v13 = 27;
            break;
          default:
            goto LABEL_33;
        }
        goto LABEL_34;
      }
      switch(v16)
      {
        case 500:
          uint64_t v13 = 28;
          goto LABEL_34;
        case 501:
          uint64_t v13 = 29;
          goto LABEL_34;
        case 502:
          uint64_t v13 = 30;
          goto LABEL_34;
      }
LABEL_33:
      uint64_t v13 = 3;
      goto LABEL_34;
    }
    if (v16 == 200)
    {
      uint64_t v13 = 4;
      goto LABEL_34;
    }
    if (v16 == 201)
    {
      uint64_t v13 = 5;
      goto LABEL_34;
    }
    if (v16 != 300) {
      goto LABEL_33;
    }
    uint64_t v13 = 23;
  }
  else
  {
    int v17 = [v10 domain];
    unsigned int v18 = [v17 isEqualToString:@"IKEv2ProviderDisconnectionErrorDomain"];

    if (!v18) {
      goto LABEL_33;
    }
    uint64_t v13 = (uint64_t)[v10 code];
  }
LABEL_34:
  [(NESMVPNSession *)self setLastDisconnectError:v10];
LABEL_35:
  id v36 = v8;
  if (self)
  {
    id v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = self;
      __int16 v39 = 1024;
      LODWORD(v40) = a4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: didSetStatus - %d", buf, 0x12u);
    }

    switch(a4)
    {
      case 0:
        int v20 = [(NESMVPNSession *)self stateHandler];
        [v20 handlePlugin:v36 statusDidChangeToDisconnectedWithReason:v13];

        uint64_t v21 = [(NESMSession *)self configuration];
        uint64_t v22 = [(CoreTelephonyClient *)v21 appVPN];
        if (!v22)
        {
          uint64_t v27 = 0;
LABEL_54:

          goto LABEL_55;
        }
        id v23 = (void *)v22;
        __int16 v24 = [(NESMSession *)self configuration];
        id v25 = [v24 appVPN];
        uint64_t v26 = [v25 protocol];
        uint64_t v27 = [v26 sliceUUID];

        if (v27)
        {
          uint64_t v28 = self->_coreTelephonyClient;
          if (v28)
          {
            BOOL v30 = v28;
            id Property = objc_getProperty(self, v29, 496, 1);

            if (Property)
            {
              id v32 = ne_log_obj();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                id v34 = objc_getProperty(self, v33, 496, 1);
                *(_DWORD *)buf = 138412802;
                v38 = self;
                __int16 v39 = 2112;
                id v40 = v27;
                __int16 v41 = 2112;
                id v42 = v34;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%@: VPN Slice deactivate - sliceUUID %@ : sliceInterfaceName %@ ", buf, 0x20u);
              }

              uint64_t v21 = self->_coreTelephonyClient;
              [(CoreTelephonyClient *)v21 requestSliceDeactivation:objc_getProperty(self, v35, 496, 1)];
              goto LABEL_54;
            }
          }
        }
LABEL_55:

        break;
      case 1:
        uint64_t v27 = [(NESMVPNSession *)self stateHandler];
        [v27 handlePluginStatusDidChangeToContacting:v36];
        goto LABEL_55;
      case 2:
        uint64_t v27 = [(NESMVPNSession *)self stateHandler];
        [v27 handlePluginStatusDidChangeToAuthenticating:v36];
        goto LABEL_55;
      case 3:
        uint64_t v27 = [(NESMVPNSession *)self stateHandler];
        [v27 handlePluginStatusDidChangeToNegotiating:v36];
        goto LABEL_55;
      case 4:
        uint64_t v27 = [(NESMVPNSession *)self stateHandler];
        [v27 handlePluginStatusDidChangeToConnected:v36];
        goto LABEL_55;
      case 5:
        uint64_t v27 = [(NESMVPNSession *)self stateHandler];
        [v27 handlePluginStatusDidChangeToReasserting:v36];
        goto LABEL_55;
      case 6:
        uint64_t v27 = [(NESMVPNSession *)self stateHandler];
        [v27 handlePlugin:v36 statusDidChangeToDisconnectingWithReason:v13];
        goto LABEL_55;
      case 7:
        uint64_t v27 = [(NESMVPNSession *)self stateHandler];
        [v27 handlePluginStatusDidChangeToUpdating:v36];
        goto LABEL_55;
      default:
        break;
    }
  }
}

- (void)pluginDidDetachIPC:(id)a3
{
  id v4 = a3;
  id v5 = [(NESMVPNSession *)self stateHandler];
  [v5 handlePluginDidDetachIPC:v4];
}

- (void)pluginDidAcknowledgeSleep:(id)a3
{
  if ((id)[(NESMVPNSession *)self parentType] == (id)2)
  {
    id v5 = [(NESMVPNSession *)self parent];
    sub_10008C1B8(v5);
  }
  else
  {
    id v5 = [(NESMSession *)self server];
    sub_1000556BC(v5, v4);
  }
}

- (void)plugin:(id)a3 didFinishAuthenticationWithResults:(id)a4 status:(int)a5 andError:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NESMVPNSession *)self stateHandler];
  [v13 handlePlugin:v12 authenticationCompleteWithResults:v11 status:v6 andError:v10];
}

- (void)pluginDidDispose:(id)a3
{
  id v4 = a3;
  id v5 = [(NESMVPNSession *)self stateHandler];
  [v5 handlePluginDisposeComplete:v4];

  if ((id)[(NESMVPNSession *)self parentType] == (id)1)
  {
    id v9 = [(NESMVPNSession *)self parent];
    uint64_t v6 = self;
    if (v9 && v6)
    {
      id v7 = [v9 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000BAE4;
      block[3] = &unk_1000C6C38;
      block[4] = v9;
      id v12 = v6;
      dispatch_async(v7, block);
    }
  }
  else
  {
    id v8 = [(NESMSession *)self queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002614C;
    v10[3] = &unk_1000C6C60;
    v10[4] = self;
    dispatch_async(v8, v10);
  }
}

- (void)handleChangeEventForRankedInterfaces
{
  int64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(NESMVPNSession *)self stopped];
    [(NESMSession *)self status];
    uint64_t v5 = ne_session_status_to_string();
    uint64_t v6 = [(NESMSession *)self configuration];
    id v7 = [v6 VPN];
    id v8 = [v7 protocol];
    int v15 = 138413058;
    uint64_t v16 = self;
    __int16 v17 = 1024;
    *(_DWORD *)unsigned int v18 = v4;
    *(_WORD *)&v18[4] = 2080;
    *(void *)&v18[6] = v5;
    *(_WORD *)&v18[14] = 1024;
    *(_DWORD *)&v18[16] = [v8 includeAllNetworks];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: handleChangeEventForRankedInterfaces - stopped %d status %s includeAllNetworks %d", (uint8_t *)&v15, 0x22u);
  }
  if (![(NESMVPNSession *)self stopped] && [(NESMSession *)self status] == 3)
  {
    id v9 = [(NESMSession *)self configuration];
    id v10 = [v9 VPN];
    id v11 = [v10 protocol];
    unsigned int v12 = [v11 includeAllNetworks];

    if (v12)
    {
      if ((sub_100020314(self) & 1) == 0)
      {
        id v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int64_t v14 = [(NESMVPNSession *)self interfaceName];
          int v15 = 138412802;
          uint64_t v16 = self;
          __int16 v17 = 2112;
          *(void *)unsigned int v18 = v14;
          *(_WORD *)&v18[8] = 2080;
          *(void *)&v18[10] = "-[NESMVPNSession handleChangeEventForRankedInterfaces]";
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@[%@]:%s: applyTunnelDataPolicies failed", (uint8_t *)&v15, 0x20u);
        }
      }
    }
  }
}

- (void)handleCaptiveNetworkPluginsChanged
{
  int64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: handleCaptiveNetworkPluginsChanged", (uint8_t *)&v4, 0xCu);
  }

  sub_10001B66C(self);
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 <= 1)
  {
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    id v7 = [(NESMSession *)self queue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100026514;
    v8[3] = &unk_1000C6DD8;
    v8[4] = self;
    int v9 = a3;
    dispatch_async(v7, v8);
  }
}

- (void)handleNetworkPrepareResult:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSession;
  id v4 = a3;
  [(NESMSession *)&v6 handleNetworkPrepareResult:v4];
  uint64_t v5 = [(NESMVPNSession *)self stateHandler];
  [v5 handleNetworkPrepareResult:v4];
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NESMVPNSession;
  [(NESMSession *)&v14 handleChangeEventForInterface:v8 newFlags:a4 previousFlags:a5];
  int v9 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026758;
  block[3] = &unk_1000C6930;
  block[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (BOOL)proxyEnabled:(id)a3
{
  id v3 = a3;
  if (SCDynamicStoreCopyProxiesWithOptions())
  {
    CFArrayRef v4 = (const __CFArray *)SCNetworkProxiesCopyMatching();
    CFArrayRef ValueAtIndex = v4;
    if (v4)
    {
      if (CFArrayGetCount(v4) < 1) {
        goto LABEL_15;
      }
      CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
      if (ValueAtIndex)
      {
        if (NEGetIntFromDictionary()
          || NEGetIntFromDictionary()
          || NEGetIntFromDictionary()
          || NEGetIntFromDictionary()
          || NEGetIntFromDictionary()
          || NEGetIntFromDictionary()
          || NEGetIntFromDictionary()
          || NEGetIntFromDictionary())
        {
          LOBYTE(ValueAtIndex) = 1;
          goto LABEL_16;
        }
LABEL_15:
        LOBYTE(ValueAtIndex) = 0;
      }
    }
LABEL_16:
    myCFRelease();
    myCFRelease();
    goto LABEL_17;
  }
  LOBYTE(ValueAtIndex) = 0;
LABEL_17:

  return (char)ValueAtIndex;
}

- (id)pluginPIDArray
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = [(NESMVPNSession *)self primaryTunnelPlugin];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    objc_super v6 = [(NESMVPNSession *)self primaryTunnelPlugin];
    unsigned int v7 = sub_100018330(v6);

    if (v7)
    {
      id v8 = [(NESMVPNSession *)self primaryTunnelPlugin];
      int v9 = +[NSNumber numberWithInt:sub_100018330(v8)];
      [v3 addObject:v9];
    }
  }
  uint64_t v10 = [(NESMVPNSession *)self authenticationPlugin];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = [(NESMVPNSession *)self authenticationPlugin];
    unsigned int v13 = sub_100018330(v12);

    if (v13)
    {
      objc_super v14 = [(NESMVPNSession *)self authenticationPlugin];
      int v15 = +[NSNumber numberWithInt:sub_100018330(v14)];
      [v3 addObject:v15];
    }
  }

  return v3;
}

- (BOOL)interface:(id)a3 hasIPAddress:(id)a4 currentFlags:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = NEGetAddressFamilyFromString();
  int v11 = v10;
  if ((v5 & 1) == 0 && v10 == 2)
  {
LABEL_3:
    unsigned __int8 v12 = 0;
    goto LABEL_4;
  }
  unsigned __int8 v12 = 0;
  BOOL v15 = (v5 & 2) == 0 && v10 == 30;
  if (v10 && !v15)
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    BYTE1(v29) = v10;
    strncpy(__dst, (const char *)[v8 UTF8String], 0xFuLL);
    int v16 = socket(v11, 2, 0);
    int v17 = ioctl(v16, 0xC0206921uLL, __dst);
    close(v16);
    if (v17 < 0)
    {
      int v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = __error();
        uint64_t v22 = strerror(*v21);
        *(_DWORD *)buf = 138412546;
        __int16 v24 = self;
        __int16 v25 = 2080;
        uint64_t v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@: ioctl(SIOCGIFADDR) failed: %s", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v18 = NECreateAddressString();
      if (v18)
      {
        id v19 = (const void *)v18;
        unsigned __int8 v12 = [v9 isEqualToString:v18];
        CFRelease(v19);
        goto LABEL_4;
      }
    }
    goto LABEL_3;
  }
LABEL_4:

  return v12;
}

- (void)handleUserSwitch
{
  id v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027154;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleUserLogout
{
  id v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002723C;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleWakeup
{
  id v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027320;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleSleepTime:(double)a3
{
  char v5 = [(NESMSession *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027414;
  v6[3] = &unk_1000C6B78;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  dispatch_async(v5, v6);
}

- (BOOL)handleSleep
{
  id v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027560;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);

  return 1;
}

- (id)copyExtendedStatus
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  v77.receiver = self;
  v77.super_class = (Class)NESMVPNSession;
  id v4 = [(NESMSession *)&v77 copyExtendedStatus];
  id v5 = [v3 initWithDictionary:v4];

  id v75 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  if ([(NESMVPNSession *)self virtualInterface])
  {
    [(NESMVPNSession *)self virtualInterface];
    uint64_t v71 = NEVirtualInterfaceCopyVPNServerAddress();
    unsigned int v7 = [(NESMSession *)self configuration];
    id v8 = [v7 VPN];
    id v9 = [v8 protocol];
    if ([v9 type] != (id)1)
    {
      int v16 = [(NESMSession *)self configuration];
      int v17 = [v16 VPN];
      uint64_t v18 = [v17 protocol];
      if ([v18 type] != (id)2)
      {
        v69 = [(NESMSession *)self configuration];
        [v69 VPN];
        id v19 = v66 = v6;
        [v19 protocol];
        v20 = __int16 v74 = v16;
        [v20 type];

        int v16 = v74;
        id v6 = v66;
      }
    }

    [(NESMVPNSession *)self virtualInterface];
    id v73 = (void *)NEVirtualInterfaceCopyIPStateDictionary();
    [(NESMVPNSession *)self virtualInterface];
    int v11 = (void *)NEVirtualInterfaceCopyIPStateDictionary();
    [(NESMVPNSession *)self virtualInterface];
    unsigned __int8 v12 = (void *)NEVirtualInterfaceCopyDNSDomain();
    [(NESMVPNSession *)self virtualInterface];
    unsigned int v13 = (void *)NEVirtualInterfaceCopyDNSServers();
    [(NESMVPNSession *)self virtualInterface];
    objc_super v14 = (void *)NEVirtualInterfaceCopyDNSSearchDomains();
    [(NESMVPNSession *)self virtualInterface];
    matched = (void *)NEVirtualInterfaceCopyDNSSupplementalMatchDomains();
    uint64_t v10 = v71;
    if (v71) {
      [v75 setObject:v71 forKeyedSubscript:@"RemoteAddress"];
    }
  }
  else
  {
    uint64_t v10 = 0;
    id v73 = 0;
    int v11 = 0;
    unsigned __int8 v12 = 0;
    unsigned int v13 = 0;
    objc_super v14 = 0;
    matched = 0;
  }
  __int16 v72 = (void *)v10;
  if ([(NESMSession *)self status] == 3)
  {
    uint64_t v21 = +[NSNumber numberWithUnsignedLongLong:[(NESMSession *)self connectTime]];
    CFStringRef v22 = @"ConnectTime";
  }
  else
  {
    if ([(NESMSession *)self status] == 2) {
      goto LABEL_15;
    }
    uint64_t v21 = +[NSNumber numberWithInt:[(NESMSession *)self lastStopReason]];
    CFStringRef v22 = @"LastCause";
  }
  [v75 setObject:v21 forKeyedSubscript:v22];

LABEL_15:
  long long v70 = matched;
  if ((sub_10007C09C(self) & 1) != 0 || sub_10007C1A4(self))
  {
    id v23 = [(NESMSession *)self matchedRule];

    if (v23)
    {
      [(NESMSession *)self matchedRule];
      __int16 v24 = v14;
      __int16 v25 = v13;
      uint64_t v26 = v12;
      uint64_t v28 = v27 = v6;
      uint64_t v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 action]);
      [v75 setObject:v29 forKeyedSubscript:@"OnDemandAction"];

      id v6 = v27;
      unsigned __int8 v12 = v26;
      unsigned int v13 = v25;
      objc_super v14 = v24;
      matched = v70;
    }
  }
  [v5 setObject:v75 forKeyedSubscript:@"VPN"];
  uint64_t v30 = +[NSNumber numberWithInteger:[(NESMVPNSession *)self state]];
  [v5 setObject:v30 forKeyedSubscript:@"SessionState"];

  dispatch_queue_t v31 = +[NSNumber numberWithInt:[(NESMSession *)self status]];
  [v5 setObject:v31 forKeyedSubscript:@"NEStatus"];

  id v32 = +[NSNumber numberWithInt:[(NESMSession *)self SCNCStatus]];
  [v5 setObject:v32 forKeyedSubscript:@"Status"];

  if (v73)
  {
    id v33 = [v73 objectForKeyedSubscript:@"IsNULL"];
    id v34 = v33;
    if (!v33 || ([v33 BOOLValue] & 1) == 0) {
      [v5 setObject:v73 forKeyedSubscript:@"IPv4"];
    }
  }
  if (v11)
  {
    SEL v35 = [v11 objectForKeyedSubscript:@"IsNULL"];
    id v36 = v35;
    if (!v35 || ([v35 BOOLValue] & 1) == 0) {
      [v5 setObject:v11 forKeyedSubscript:@"IPv6"];
    }
  }
  __int16 v68 = v11;
  id v37 = +[NSNumber numberWithInteger:[(NESMSession *)self connectCount]];
  [v6 setObject:v37 forKeyedSubscript:@"ConnectCount"];

  v38 = +[NSNumber numberWithInteger:[(NESMSession *)self connectedCount]];
  [v6 setObject:v38 forKeyedSubscript:@"ConnectedCount"];

  __int16 v39 = +[NSNumber numberWithInteger:[(NESMSession *)self disconnectedCount]];
  [v6 setObject:v39 forKeyedSubscript:@"DisconnectedCount"];

  id v40 = +[NSNumber numberWithUnsignedLongLong:[(NESMSession *)self maxConnectTime]];
  [v6 setObject:v40 forKeyedSubscript:@"MaxConnectTime"];

  __int16 v41 = v72;
  if ((id)[(NESMVPNSession *)self parentType] == (id)1)
  {
    v64 = v12;
    id v42 = [(NESMVPNSession *)self parent];
    unsigned int v44 = self;
    if (v42)
    {
      id Property = objc_getProperty(v42, v43, 408, 1);
      uint64_t v46 = -1;
      if (v44 && Property)
      {
        id v67 = v6;
        unsigned __int8 v47 = [(NESMVPNSession *)v44 interfaceName];

        if (v47)
        {
          id v49 = objc_getProperty(v42, v48, 408, 1);
          id v50 = [(NESMVPNSession *)v44 interfaceName];
          id v51 = [v49 objectForKeyedSubscript:v50];

          if (v51)
          {
            uint64_t v46 = v51[1];
          }
          else
          {
            uint64_t v46 = -1;
          }
        }
        id v6 = v67;
      }
    }
    else
    {
      uint64_t v46 = 0;
    }

    char v52 = +[NSNumber numberWithInteger:v46];
    [v6 setObject:v52 forKeyedSubscript:@"RetryInterval"];

    matched = v70;
    __int16 v41 = v72;
    unsigned __int8 v12 = v64;
  }
  [v5 setObject:v6 forKeyedSubscript:@"ConnectionStatistics"];
  id v53 = [(NESMSession *)self lastDisconnectError];
  if (v53)
  {
    v65 = v13;
    SEL v54 = v12;
    id v55 = v41;
    id v76 = 0;
    unsigned int v56 = +[NSKeyedArchiver archivedDataWithRootObject:v53 requiringSecureCoding:1 error:&v76];
    id v57 = v76;
    if (v56)
    {
      [v5 setObject:v56 forKeyedSubscript:@"LastDisconnectError"];
    }
    else
    {
      int v58 = ne_log_obj();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v79 = v57;
        _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to serialize the last disconnect error: %@", buf, 0xCu);
      }
    }
    __int16 v41 = v55;
    unsigned __int8 v12 = v54;
    unsigned int v13 = v65;
    matched = v70;
  }
  v59 = v41;
  v60 = [(NESMSession *)self lastStatusChangeTime];

  if (v60)
  {
    objc_super v61 = [(NESMSession *)self lastStatusChangeTime];
    [v5 setObject:v61 forKeyedSubscript:@"LastStatusChangeTime"];
  }
  if (v13) {
    [v5 setObject:v13 forKeyedSubscript:@"DNSServers"];
  }
  if (v12) {
    [v5 setObject:v12 forKeyedSubscript:@"DNSDomain"];
  }
  if (v14) {
    [v5 setObject:v14 forKeyedSubscript:@"DNSSearchDomains"];
  }
  if (matched) {
    [v5 setObject:matched forKeyedSubscript:@"DNSSupplementalMatchDomains"];
  }
  [(NESMVPNSession *)self virtualInterface];
  v62 = +[NSNumber numberWithUnsignedChar:NEVirtualInterfaceIsPrimary()];
  [v5 setObject:v62 forKeyedSubscript:@"IsPrimaryInterface"];

  return v5;
}

- (id)copyStatistics
{
  if (![(NESMVPNSession *)self virtualInterface]) {
    return 0;
  }
  [(NESMVPNSession *)self virtualInterface];
  uint64_t v3 = NEVirtualInterfaceCopyStatistics();
  id v4 = (void *)v3;
  if (v3)
  {
    CFStringRef v7 = @"VPN";
    uint64_t v8 = v3;
    id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    id v7 = [(NESMVPNSession *)self copyExtendedStatus];
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_7;
    }
    id v7 = [(NESMVPNSession *)self copyStatistics];
  }
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(reply, "SessionInfo", v9);
  }
LABEL_7:
  xpc_dictionary_get_remote_connection(xdict);
  uint64_t v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v10, reply);
}

- (void)handleEstablishIPCMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(NESMVPNSession *)self protocol];
  unsigned int v6 = [(NESMSession *)self status];
  xpc_dictionary_get_remote_connection(v4);
  id v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    xpc_connection_send_message(v7, reply);

    goto LABEL_20;
  }
  uint64_t v8 = (void *)xpc_connection_copy_entitlement_value();

  if (!v8 || xpc_get_type(v8) != (xpc_type_t)&_xpc_type_array || (NEGetEntitlement() & 3) == 0) {
    goto LABEL_10;
  }
  id v9 = xpc_dictionary_get_remote_connection(v4);
  uint64_t v10 = (void *)xpc_connection_copy_entitlement_value();

  if (!v10 || xpc_get_type(v10) != (xpc_type_t)&_xpc_type_string)
  {
    int v11 = xpc_dictionary_get_remote_connection(v4);
    uint64_t v12 = xpc_connection_copy_entitlement_value();

    uint64_t v10 = (void *)v12;
    if (!v12) {
      goto LABEL_9;
    }
  }
  if (xpc_get_type(v10) != (xpc_type_t)&_xpc_type_string
    || (+[NSString stringWithUTF8String:xpc_string_get_string_ptr(v10)], v27 = objc_claimAutoreleasedReturnValue(), NEGetBundleIdentifierFromAppID(), uint64_t v28 = objc_claimAutoreleasedReturnValue(), v27, !v28))
  {
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v29 = [v5 pluginType];
  if (!v29)
  {

    goto LABEL_9;
  }
  uint64_t v30 = (void *)v29;
  dispatch_queue_t v31 = [v5 pluginType];
  unsigned __int8 v32 = [v28 hasPrefix:v31];

  if (v32) {
    goto LABEL_23;
  }
LABEL_10:
  unsigned int v13 = xpc_dictionary_get_remote_connection(v4);
  objc_super v14 = (void *)xpc_connection_copy_entitlement_value();

  if (v14 && xpc_get_type(v14) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v14))
  {
    uint64_t v8 = v14;
    goto LABEL_23;
  }
  BOOL v15 = xpc_dictionary_get_remote_connection(v4);
  uint64_t v8 = (void *)xpc_connection_copy_entitlement_value();

  if (v8)
  {
    if (xpc_get_type(v8) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v8);
      if (string_ptr)
      {
        if (!strcmp(string_ptr, "super"))
        {
LABEL_23:
          if (![(NESMVPNSession *)self establishIPCPending])
          {
            xpc_dictionary_get_remote_connection(v4);
            CFStringRef v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
            id v23 = +[NSNumber numberWithUnsignedInt:xpc_connection_get_euid(v22)];
            [(NESMSession *)self setUID:v23];

            if (self) {
              objc_setProperty_atomic(self, v24, v4, 392);
            }
            int v17 = [(NESMVPNSession *)self stateHandler];
            [v17 handleEstablishIPC];
            goto LABEL_18;
          }
          int v16 = ne_log_obj();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            xpc_dictionary_get_remote_connection(v4);
            uint64_t v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
            int v33 = 138412546;
            id v34 = self;
            __int16 v35 = 1024;
            pid_t pid = xpc_connection_get_pid(v21);
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: cannot establish IPC with %d because IPC is already in the process of being established", (uint8_t *)&v33, 0x12u);
LABEL_30:

            goto LABEL_17;
          }
          goto LABEL_17;
        }
      }
    }
  }
  int v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    xpc_dictionary_get_remote_connection(v4);
    uint64_t v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    pid_t v25 = xpc_connection_get_pid(v21);
    uint64_t v26 = [v5 pluginType];
    int v33 = 138412802;
    id v34 = self;
    __int16 v35 = 1024;
    pid_t pid = v25;
    __int16 v37 = 2112;
    v38 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: process %d is not entitled to establish IPC with plugins of type %@", (uint8_t *)&v33, 0x1Cu);

    goto LABEL_30;
  }
LABEL_17:

  int v17 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t v18 = xpc_dictionary_create_reply(v4);
  xpc_connection_send_message((xpc_connection_t)v17, v18);

LABEL_18:
LABEL_20:
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(NESMVPNSession *)self setStopped:1];
  [(NESMVPNSession *)self setLastStartMessage:0];
  v9.receiver = self;
  v9.super_class = (Class)NESMVPNSession;
  [(NESMSession *)&v9 handleStopMessageWithReason:v3];
  if ([(NESMSession *)self status] && [(NESMSession *)self status] != 1)
  {
    unsigned int v6 = [(NESMVPNSession *)self stateHandler];
    [v6 handleStop];
  }
  else
  {
    id v5 = sub_100052AE8();
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000285DC;
    v7[3] = &unk_1000C6DD8;
    int v8 = v3;
    v7[4] = self;
    sub_100056C0C((uint64_t)v5, self, v7);
  }
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  [(NESMVPNSession *)self setLastStartMessage:v4];
  [(NESMVPNSession *)self setStopped:0];
  id v5 = [(NESMSession *)self configuration];
  uint64_t v6 = [v5 externalIdentifier];
  if (!v6)
  {

LABEL_7:
    if ((id)[(NESMVPNSession *)self parentType] != (id)1) {
      sub_10001B66C(self);
    }
    if ((id)[(NESMVPNSession *)self state] != (id)9)
    {
      v24.receiver = self;
      v24.super_class = (Class)NESMVPNSession;
      [(NESMSession *)&v24 handleStartMessage:v4];
    }
    uint64_t v10 = xpc_dictionary_get_value(v4, "SessionOptions");
    int v11 = [(NESMVPNSession *)self primaryTunnelPlugin];
    if (v11) {
      goto LABEL_12;
    }
    if (!v10 || xpc_get_type(v10) != (xpc_type_t)&_xpc_type_dictionary || !xpc_dictionary_get_BOOL(v10, "test-agent")) {
      goto LABEL_13;
    }
    int v11 = xpc_dictionary_get_remote_connection(v4);
    if (v11)
    {
      uint64_t v12 = (void *)xpc_connection_copy_entitlement_value();
      unsigned int v13 = v12;
      if (v12 && xpc_get_type(v12) == (xpc_type_t)&_xpc_type_BOOL)
      {
        BOOL value = xpc_BOOL_get_value(v13);

        if (value)
        {
          int v17 = [NETestAgent alloc];
          xpc_object_t v18 = [(NESMSession *)self configuration];
          id v19 = [v18 pluginType];
          int v20 = sub_100068368((id *)&v17->super.super.isa, v19, [(NESMVPNSession *)self agentPluginClass], v4);

          if (v20)
          {
            uint64_t v21 = [NEVPNTunnelPlugin alloc];
            CFStringRef v22 = [(NESMSession *)self queue];
            id v23 = [(NEVPNTunnelPlugin *)v21 initWithAgent:v20 delegateQueue:v22 andDelegate:self];
            [(NESMVPNSession *)self setPrimaryTunnelPlugin:v23];
          }
          else
          {
            CFStringRef v22 = ne_log_obj();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to create a test agent", buf, 2u);
            }
          }

LABEL_12:
LABEL_13:
          int v11 = [(NESMVPNSession *)self stateHandler];
          [v11 handleStartMessage:v4];
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    objc_super v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v26 = (NESMVPNSession *)"com.apple.private.networkextension.test-control";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Test provider does not have the %s entitlement", buf, 0xCu);
    }

    BOOL v15 = [(NESMVPNSession *)self stateHandler];
    [v15 handleStartMessage:v4];

    goto LABEL_14;
  }
  id v7 = (void *)v6;
  unsigned int v8 = [(NESMSession *)self waitForPerApp];

  if (!v8) {
    goto LABEL_7;
  }
  objc_super v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Ignore start for perApp session - no appRule or app not installed", buf, 0xCu);
  }

  uint64_t v10 = [(NESMVPNSession *)self stateHandler];
  [v10 handleStop];
LABEL_15:
}

- (void)registerSession:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)[(NESMVPNSession *)self parentType] == (id)2)
  {
    unsigned int v8 = [(NESMVPNSession *)self parent];
    id v9 = v6;
    id v10 = v7;
    int v11 = self;
    if (v8)
    {
      if ([(NESMSession *)v8 status] == 1)
      {
        uint64_t v12 = [(NESMSession *)v8 messageQueue];
        dispatch_suspend(v12);

        unsigned int v13 = [(NESMSession *)v8 server];
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        id v19 = sub_10008CDE4;
        int v20 = &unk_1000C69F8;
        uint64_t v21 = v8;
        CFStringRef v22 = (NESMVPNSession *)v10;
        id v23 = v11;
        id v24 = v9;
        [v13 registerSession:v8 withCompletionHandler:&buf];

        objc_super v14 = v22;
      }
      else
      {
        BOOL v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Already registered", (uint8_t *)&buf, 0xCu);
        }

        int v16 = [(NESMSession *)v11 queue];
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        id v19 = sub_10008CEC0;
        int v20 = &unk_1000C6C38;
        uint64_t v21 = v11;
        CFStringRef v22 = (NESMVPNSession *)v9;
        dispatch_async(v16, &buf);

        objc_super v14 = v21;
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NESMVPNSession;
    [(NESMSession *)&v17 registerSession:v6 fromClient:v7];
  }
}

- (void)createConnectParametersWithStartMessage:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = xpc_dictionary_get_value(xdict, "SessionOptions");
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [(NESMVPNSession *)self setConnectParameters:v5];

  id v6 = [(NESMVPNSession *)self protocol];
  id v7 = [v6 serverAddress];

  if (v7)
  {
    unsigned int v8 = [(NESMVPNSession *)self protocol];
    id v9 = [v8 serverAddress];
    id v10 = [(NESMVPNSession *)self connectParameters];
    [v10 setObject:v9 forKeyedSubscript:@"ServerAddress"];
  }
  int v11 = [(NESMVPNSession *)self protocol];
  uint64_t v12 = [v11 username];

  if (v12)
  {
    unsigned int v13 = [(NESMVPNSession *)self protocol];
    objc_super v14 = [v13 username];
    BOOL v15 = [(NESMVPNSession *)self connectParameters];
    [v15 setObject:v14 forKeyedSubscript:@"AccountName"];
  }
  id v16 = [(NESMVPNSession *)self protocol];
  uint64_t v17 = [v16 passwordKeychainItem];
  if (v17)
  {
    xpc_object_t v18 = (void *)v17;
    id v19 = [(NESMVPNSession *)self protocol];
    int v20 = [v19 passwordKeychainItem];
    id v21 = [v20 domain];

    if (v21) {
      goto LABEL_10;
    }
    CFStringRef v22 = [(NESMVPNSession *)self protocol];
    id v23 = [v22 passwordKeychainItem];
    id v16 = [v23 copyPassword];

    if (v16)
    {
      id v24 = [(NESMVPNSession *)self connectParameters];
      [v24 setObject:v16 forKeyedSubscript:@"Password"];
    }
  }

LABEL_10:
  pid_t v25 = [(NESMVPNSession *)self protocol];
  unsigned int v26 = [v25 disconnectOnIdle];

  if (v26)
  {
    id v27 = [(NESMVPNSession *)self protocol];
    uint64_t v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v27 disconnectOnIdleTimeout]);
    uint64_t v29 = [(NESMVPNSession *)self connectParameters];
    [v29 setObject:v28 forKeyedSubscript:@"IdleTimer"];
  }
  uint64_t v30 = [(NESMVPNSession *)self protocol];
  id v31 = [v30 type];

  unsigned __int8 v32 = [(NESMVPNSession *)self protocol];
  int v33 = v32;
  if (v31 == (id)4)
  {
    if (![v32 authenticationMethod])
    {
      id v34 = [(NESMVPNSession *)self connectParameters];
      [v34 setObject:@"Password" forKeyedSubscript:@"AuthMethod"];
    }
    if ([v33 authenticationMethod] == (id)1)
    {
      __int16 v35 = [(NESMVPNSession *)self connectParameters];
      [v35 setObject:@"Certificate" forKeyedSubscript:@"AuthMethod"];

      id v36 = [(NESMVPNSession *)self protocol];
      __int16 v37 = [v36 identityReferenceInternal];

      if (v37)
      {
        v38 = [(NESMVPNSession *)self protocol];
        __int16 v39 = [v38 identityReferenceInternal];
        id v40 = [(NESMVPNSession *)self connectParameters];
        [v40 setObject:v39 forKeyedSubscript:@"CertificateRef"];
      }
    }
    __int16 v41 = [v33 providerConfiguration];

    if (v41)
    {
      id v42 = [v33 providerConfiguration];
      uint64_t v43 = [(NESMVPNSession *)self connectParameters];
      [v43 setObject:v42 forKeyedSubscript:@"VendorData"];
    }
    if (!v4)
    {
      v80 = [(NESMVPNSession *)self pluginType];
      unsigned __int8 v81 = +[NETunnelProviderProtocol isLegacyPluginType:v80];

      if (v81)
      {
LABEL_57:

        goto LABEL_58;
      }
      id v44 = objc_alloc_init((Class)NSMutableDictionary);
      [(NESMVPNSession *)self setConnectParameters:v44];
      goto LABEL_56;
    }
    id v44 = (id)_CFXPCCreateCFObjectFromXPCObject();
    id v45 = [(NESMVPNSession *)self pluginType];
    unsigned int v46 = +[NETunnelProviderProtocol isLegacyPluginType:v45];

    if (!v46)
    {
      long long v82 = [(NESMVPNSession *)self connectParameters];
      [v82 addEntriesFromDictionary:v44];
LABEL_55:

      goto LABEL_56;
    }
    uint64_t v47 = kSCEntNetVPN;
    id v48 = [v44 objectForKeyedSubscript:kSCEntNetVPN];
    int v49 = isa_nsdictionary();

    if (!v49)
    {
LABEL_53:
      v95 = [v33 pluginType];
      v96 = [v44 objectForKeyedSubscript:v95];
      int v97 = isa_nsdictionary();

      if (v97)
      {
        long long v82 = [v33 pluginType];
        v98 = [v44 objectForKeyedSubscript:v82];
        v99 = [(NESMVPNSession *)self connectParameters];
        [v99 setObject:v98 forKeyedSubscript:@"VendorData"];

        goto LABEL_55;
      }
LABEL_56:

      goto LABEL_57;
    }
    id v50 = [v44 objectForKeyedSubscript:v47];
    uint64_t v51 = kSCPropNetVPNRemoteAddress;
    char v52 = [v50 objectForKeyedSubscript:kSCPropNetVPNRemoteAddress];
    int v53 = isa_nsstring();

    if (v53)
    {
      SEL v54 = [v50 objectForKeyedSubscript:v51];
      id v55 = [(NESMVPNSession *)self connectParameters];
      [v55 setObject:v54 forKeyedSubscript:@"ServerAddress"];
    }
    uint64_t v56 = kSCPropNetVPNAuthName;
    id v57 = [v50 objectForKeyedSubscript:kSCPropNetVPNAuthName];
    int v58 = isa_nsstring();

    if (v58)
    {
      v59 = [v50 objectForKeyedSubscript:v56];
      v60 = [(NESMVPNSession *)self connectParameters];
      [v60 setObject:v59 forKeyedSubscript:@"AccountName"];
    }
    uint64_t v61 = kSCPropNetVPNAuthPassword;
    v62 = [v50 objectForKeyedSubscript:kSCPropNetVPNAuthPassword];
    int v63 = isa_nsstring();

    if (v63)
    {
      v64 = [v50 objectForKeyedSubscript:v61];
      v65 = [(NESMVPNSession *)self connectParameters];
      [v65 setObject:v64 forKeyedSubscript:@"Password"];
    }
    uint64_t v66 = kSCPropNetVPNAuthenticationMethod;
    id v67 = [v50 objectForKeyedSubscript:kSCPropNetVPNAuthenticationMethod];
    int v68 = isa_nsstring();

    if (!v68)
    {
LABEL_47:
      uint64_t v88 = kSCPropNetVPNDisconnectOnIdle;
      long long v89 = [v50 objectForKeyedSubscript:kSCPropNetVPNDisconnectOnIdle];
      if (isa_nsnumber())
      {
        uint64_t v90 = kSCPropNetVPNDisconnectOnIdleTimer;
        v91 = [v50 objectForKeyedSubscript:kSCPropNetVPNDisconnectOnIdleTimer];
        int v92 = isa_nsnumber();

        if (!v92)
        {
LABEL_52:

          goto LABEL_53;
        }
        long long v89 = [v50 objectForKeyedSubscript:v88];
        if ([v89 BOOLValue])
        {
          uint64_t v93 = [v50 objectForKeyedSubscript:v90];
          v94 = [(NESMVPNSession *)self connectParameters];
          [v94 setObject:v93 forKeyedSubscript:@"IdleTimer"];
        }
      }

      goto LABEL_52;
    }
    v69 = [v50 objectForKeyedSubscript:v66];
    if ([v69 isEqualToString:kSCValNetVPNAuthenticationMethodPassword])
    {
      long long v70 = [(NESMVPNSession *)self connectParameters];
      [v70 setObject:@"Password" forKeyedSubscript:@"AuthMethod"];
    }
    else
    {
      if (![v69 isEqualToString:kSCValNetVPNAuthenticationMethodCertificate]) {
        goto LABEL_46;
      }
      long long v83 = [(NESMVPNSession *)self connectParameters];
      [v83 setObject:@"Certificate" forKeyedSubscript:@"AuthMethod"];

      uint64_t v84 = kSCPropNetVPNLocalCertificate;
      long long v85 = [v50 objectForKeyedSubscript:kSCPropNetVPNLocalCertificate];
      int v86 = isa_nsdata();

      if (!v86) {
        goto LABEL_46;
      }
      long long v70 = [v50 objectForKeyedSubscript:v84];
      long long v87 = [(NESMVPNSession *)self connectParameters];
      [v87 setObject:v70 forKeyedSubscript:@"CertificateRef"];
    }
LABEL_46:

    goto LABEL_47;
  }
  id v71 = [v32 type];

  if (v71 == (id)5 && v4)
  {
    int v33 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    __int16 v72 = [v33 objectForKeyedSubscript:NEVPNConnectionStartOptionUsername];
    int v73 = isa_nsstring();

    if (v73)
    {
      __int16 v74 = [v33 objectForKeyedSubscript:NEVPNConnectionStartOptionUsername];
      id v75 = [(NESMVPNSession *)self connectParameters];
      [v75 setObject:v74 forKeyedSubscript:@"AccountName"];
    }
    id v76 = [v33 objectForKeyedSubscript:NEVPNConnectionStartOptionPassword];
    int v77 = isa_nsstring();

    if (v77)
    {
      v78 = [v33 objectForKeyedSubscript:NEVPNConnectionStartOptionPassword];
      id v79 = [(NESMVPNSession *)self connectParameters];
      [v79 setObject:v78 forKeyedSubscript:@"Password"];
    }
    id v44 = [(NESMVPNSession *)self connectParameters];
    [v44 addEntriesFromDictionary:v33];
    goto LABEL_56;
  }
LABEL_58:
  if ([(NESMSession *)self isOnDemand])
  {
    v100 = [(NESMVPNSession *)self pluginType];
    unsigned int v101 = +[NETunnelProviderProtocol isLegacyPluginType:v100];

    if (v101)
    {
      v102 = [(NESMVPNSession *)self connectParameters];
      v103 = [v102 objectForKeyedSubscript:@"IdleTimer"];

      if (!v103)
      {
        v104 = [(NESMVPNSession *)self connectParameters];
        [v104 setObject:&off_1000C9828 forKeyedSubscript:@"IdleTimer"];
      }
      if (v4)
      {
        string = xpc_dictionary_get_string(v4, "match-domain");
        v106 = xpc_dictionary_get_string(v4, "match-hostname");
        if (string)
        {
          v107 = +[NSString stringWithUTF8String:string];
          v108 = [(NESMVPNSession *)self connectParameters];
          [v108 setObject:v107 forKeyedSubscript:@"OnDemandMatchDomain"];
        }
        if (v106)
        {
          v109 = +[NSString stringWithUTF8String:v106];
          v110 = [(NESMVPNSession *)self connectParameters];
          [v110 setObject:v109 forKeyedSubscript:@"OnDemandHostName"];
        }
      }
      v111 = [(NESMSession *)self configuration];
      v112 = [v111 appVPN];

      if (v112)
      {
        if ((int)xpc_dictionary_get_int64(xdict, "SessionPID") >= 1)
        {
          uint64_t v113 = NECopySigningIdentifierForPID();
          if (v113)
          {
            v114 = (const void *)v113;
            v115 = [(NESMSession *)self configuration];
            v116 = [v115 appVPN];
            id v117 = [v116 copyAppRuleBySigningIdentifier:v114];

            if (v117)
            {
              v118 = [v117 matchSigningIdentifier];
              v119 = [(NESMVPNSession *)self connectParameters];
              [v119 setObject:v118 forKeyedSubscript:@"AppRuleID"];
            }
            CFRelease(v114);
          }
        }
      }
    }
  }
}

- (void)handleInitializeState
{
  v2 = self;
  objc_sync_enter(v2);
  if ((id)[(NESMVPNSession *)v2 parentType] == (id)1
    && ([(NESMVPNSession *)v2 interfaceName],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(NESMSession *)v2 configuration];
    id v5 = [(__CFString *)v4 identifier];
    id v6 = [v5 UUIDString];
    id v7 = [(NESMVPNSession *)v2 interfaceName];
    unsigned int v8 = +[NSString stringWithFormat:@"%@:%@:%d", v6, v7, [(NESMVPNSession *)v2 type]];
    [(NESMSession *)v2 setAuxiliaryDataKey:v8];
  }
  else
  {
    id v9 = [(NESMVPNSession *)v2 tunnelKind];
    id v10 = @"Fallback Tunnel";
    if (v9 == (id)1) {
      id v10 = @"Primary Tunnel";
    }
    id v4 = v10;
    id v5 = [(NESMSession *)v2 configuration];
    id v6 = [v5 identifier];
    id v7 = [v6 UUIDString];
    unsigned int v8 = +[NSString stringWithFormat:@"%@:%@:%d", v7, v4, [(NESMVPNSession *)v2 type]];
    [(NESMSession *)v2 setAuxiliaryDataKey:v8];
  }

  [(NESMSession *)v2 setupFromAuxiliaryData];
  objc_sync_exit(v2);

  [(NESMVPNSession *)v2 setState:1];
}

- (void)checkPluginInstalledWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(NESMSession *)self configuration];
  id v6 = [v5 pluginType];

  id v7 = [(NESMVPNSession *)self providerBundleIdentifier];
  if (!v6)
  {
LABEL_12:
    v4[2](v4, 1);
    goto LABEL_13;
  }
  if (+[NETunnelProviderProtocol isLegacyPluginType:v6])
  {
    v4[2](v4, (uint64_t)[v6 hasPrefix:@"com.apple."]);
    goto LABEL_13;
  }
  if ((id)[(NESMVPNSession *)self state] == (id)9)
  {
    unsigned int v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Plugin is being updated", (uint8_t *)&v15, 0xCu);
    }

    v4[2](v4, 0);
    goto LABEL_13;
  }
  id v9 = sub_10000C120();
  int v10 = sub_10000D8B4((uint64_t)v9, v7, [(NESMVPNSession *)self agentPluginClass]);

  if (v10)
  {
    int v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Plugin is registered with provider manager", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_12;
  }
  uint64_t v12 = [(NESMVPNSession *)self providerBundleIdentifier];
  unsigned int v13 = +[NELaunchServices pluginProxyWithIdentifier:v12 type:v6 pluginClass:[(NESMVPNSession *)self agentPluginClass] extensionPoint:0];

  if (!v13)
  {
    objc_super v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Plugin is not available in launch services", (uint8_t *)&v15, 0xCu);
    }
  }
  v4[2](v4, v13 != 0);

LABEL_13:
}

- (BOOL)initializePlugins
{
  uint64_t v3 = [(NESMVPNSession *)self primaryTunnelPlugin];

  if (!v3)
  {
    id v5 = [(NESMSession *)self configuration];
    id v6 = [v5 pluginType];

    if (!v6)
    {
      BOOL v4 = 1;
LABEL_68:

      return v4;
    }
    if (!self) {
      goto LABEL_33;
    }
    id v7 = [(NESMSession *)self configuration];
    unsigned int v8 = [v7 pluginType];

    id v9 = [(NESMVPNSession *)self providerBundleIdentifier];
    int v10 = [(NESMVPNSession *)self providerDesignatedRequirement];
    p_vtable = &OBJC_METACLASS___NEAppPushPlugin.vtable;
    uint64_t v12 = (objc_class *)objc_opt_class();
    if (v9)
    {
      unsigned int v13 = sub_10000C120();
      int v14 = sub_10000D8B4((uint64_t)v13, v9, [(NESMVPNSession *)self agentPluginClass]);

      if (v14)
      {
        uint64_t v15 = objc_opt_class();
        if (!v10)
        {
          id v16 = ne_log_obj();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            v98 = self;
            __int16 v99 = 2112;
            id v100 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: Cannot create agent for plugin type %@, missing designated requirement", buf, 0x16u);
          }
          id v21 = 0;
LABEL_19:

          if (v21)
          {
            [(NESMVPNSession *)self agentPluginClass];
            id v22 = objc_alloc((Class)objc_opt_class());
            id v23 = [(NESMSession *)self queue];
            id v24 = [v22 initWithAgent:v21 delegateQueue:v23 andDelegate:self];
            [(NESMVPNSession *)self setPrimaryTunnelPlugin:v24];

            pid_t v25 = [(NESMVPNSession *)self authenticationPluginBundleIdentifier];
            if (!v25)
            {
LABEL_60:
              id v55 = [(NESMVPNSession *)self extensibleSSOProvider];

              if (v55)
              {
                CFStringRef v92 = @"plugin-path";
                uint64_t v56 = [(NESMVPNSession *)self extensibleSSOProvider];
                uint64_t v93 = v56;
                id v57 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];

                id v58 = objc_alloc((Class)(p_vtable + 327));
                v59 = [(NESMVPNSession *)self pluginType];
                v60 = [(NESMSession *)self uid];
                id v61 = [v58 initWithPluginType:v59 pluginVersion:0 pluginClass:8 pluginInfo:v57 userID:v60];

                v62 = [NEVPNAuthenticationPlugin alloc];
                int v63 = [(NESMSession *)self queue];
                v64 = [(NEPlugin *)v62 initWithAgent:v61 delegateQueue:v63 andDelegate:self];
                [(NESMVPNSession *)self setAuthenticationPlugin:v64];
              }
              v65 = [(NESMVPNSession *)self primaryTunnelPlugin];
              BOOL v4 = v65 != 0;

              id v27 = v25;
              goto LABEL_67;
            }
            unsigned int v26 = v6;
            id v27 = v25;
            uint64_t v28 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"VPN-%@.plist", v26];
            uint64_t v29 = SCPreferencesCreate(0, @"NEPluginPreferences", v28);
            if (!v29)
            {
              id v44 = ne_log_obj();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                int v68 = SCError();
                v69 = SCErrorString(v68);
                *(_DWORD *)long long buf = 138412546;
                v98 = v26;
                __int16 v99 = 2080;
                id v100 = (id)v69;
                _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to create preferences for %@: %s", buf, 0x16u);
              }

              id v42 = 0;
              goto LABEL_58;
            }
            uint64_t v30 = v29;
            CFPropertyListRef Value = SCPreferencesGetValue(v29, @"ApplicationURL");
            CFTypeID TypeID = CFDataGetTypeID();
            if (!Value || CFGetTypeID(Value) != TypeID)
            {
              uint64_t v43 = ne_log_obj();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                v98 = (NESMVPNSession *)v28;
                _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "No ApplicationURL available in %@", buf, 0xCu);
              }

              CFRelease(v30);
              id v42 = 0;
              p_vtable = (void **)(&OBJC_METACLASS___NEAppPushPlugin + 24);
              goto LABEL_58;
            }
            v96[0] = 0;
            int v33 = +[NSURL URLByResolvingBookmarkData:Value options:0 relativeToURL:0 bookmarkDataIsStale:0 error:v96];
            id v87 = v96[0];
            CFRelease(v30);
            if (!v33)
            {
              id v45 = ne_log_obj();
              p_vtable = (void **)(&OBJC_METACLASS___NEAppPushPlugin + 24);
              int v86 = v45;
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412546;
                v98 = v26;
                __int16 v99 = 2112;
                id v100 = v87;
                _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to resolve app bookmark from data for %@: %@", buf, 0x16u);
              }
              id v42 = 0;
              goto LABEL_57;
            }
            id v34 = [objc_alloc((Class)NSBundle) initWithURL:v33];
            p_vtable = &OBJC_METACLASS___NEAppPushPlugin.vtable;
            int v86 = v34;
            if (!v34)
            {
              log = ne_log_obj();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                v98 = v33;
                _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create a bundle from %@", buf, 0xCu);
              }
              id v42 = 0;
              goto LABEL_56;
            }
            unsigned __int8 v81 = v28;
            long long v82 = v26;
            [v34 builtInPlugInsURL];
            log = unsigned __int8 v91 = 0;
            if (log)
            {
              v80 = v33;
              __int16 v35 = +[NSFileManager defaultManager];
              id v36 = [log path];
              if ([v35 fileExistsAtPath:v36 isDirectory:&v91])
              {
                int v37 = v91;

                int v33 = v80;
                if (v37)
                {
                  v38 = +[NSFileManager defaultManager];
                  __int16 v39 = [log path];
                  id v90 = 0;
                  id v40 = [v38 contentsOfDirectoryAtPath:v39 error:&v90];
                  __int16 v41 = v90;

                  long long v83 = v41;
                  id v79 = v40;
                  if (v41)
                  {
                    id obj = ne_log_obj();
                    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
                    {
                      v78 = [log path];
                      *(_DWORD *)long long buf = 138412546;
                      v98 = v78;
                      __int16 v99 = 2112;
                      id v100 = v41;
                      _os_log_error_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_ERROR, "Failed to get the contents of %@: %@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    long long v103 = 0u;
                    long long v104 = 0u;
                    long long v101 = 0u;
                    long long v102 = 0u;
                    id obj = v40;
                    id v88 = [obj countByEnumeratingWithState:&v101 objects:buf count:16];
                    if (v88)
                    {
                      uint64_t v70 = *(void *)v102;
                      id v71 = NSCharacterSet_ptr;
                      uint64_t v84 = *(void *)v102;
                      while (2)
                      {
                        for (i = 0; i != v88; i = (char *)i + 1)
                        {
                          if (*(void *)v102 != v70) {
                            objc_enumerationMutation(obj);
                          }
                          int v73 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                          if ([v73 hasSuffix:@".vpnplugin"])
                          {
                            id v74 = [objc_alloc((Class)v71[21]) initWithString:v73 relativeToURL:log];
                            if (v74)
                            {
                              id v75 = [objc_alloc((Class)NSBundle) initWithURL:v74];
                              id v42 = v75;
                              if (v75)
                              {
                                id v76 = [v75 bundleIdentifier];
                                unsigned __int8 v77 = [v76 isEqualToString:v27];

                                id v71 = NSCharacterSet_ptr;
                                if (v77)
                                {

                                  p_vtable = (void **)(&OBJC_METACLASS___NEAppPushPlugin + 24);
                                  goto LABEL_85;
                                }
                              }

                              uint64_t v70 = v84;
                            }

                            p_vtable = (void **)(&OBJC_METACLASS___NEAppPushPlugin + 24);
                          }
                        }
                        id v88 = [obj countByEnumeratingWithState:&v101 objects:buf count:16];
                        if (v88) {
                          continue;
                        }
                        break;
                      }
                    }
                  }
                  id v42 = 0;
LABEL_85:
                  uint64_t v28 = v81;
                  unsigned int v26 = v82;
                  int v33 = v80;

                  goto LABEL_55;
                }
              }
              else
              {

                int v33 = v80;
              }
            }
            unsigned int v46 = ne_log_obj();
            long long v83 = v46;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              v98 = (NESMVPNSession *)log;
              _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Invalid plugins URL: %@", buf, 0xCu);
            }
            id v42 = 0;
            uint64_t v28 = v81;
            unsigned int v26 = v82;
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
            if (v42)
            {
              CFStringRef v94 = @"plugin-path";
              uint64_t v47 = [v42 bundlePath];
              v95 = v47;
              id v48 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];

              id v49 = objc_alloc((Class)(p_vtable + 327));
              id v50 = [(NESMSession *)self uid];
              id v51 = [v49 initWithPluginType:v27 pluginVersion:0 pluginClass:1 pluginInfo:v48 userID:v50];

              char v52 = [NEVPNAuthenticationPlugin alloc];
              int v53 = [(NESMSession *)self queue];
              SEL v54 = [(NEPlugin *)v52 initWithAgent:v51 delegateQueue:v53 andDelegate:self];
              [(NESMVPNSession *)self setAuthenticationPlugin:v54];

              goto LABEL_60;
            }
            uint64_t v66 = ne_log_obj();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              v98 = self;
              __int16 v99 = 2112;
              id v100 = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%@: Failed to obtain the bundle for %@", buf, 0x16u);
            }

            [(NESMVPNSession *)self setPrimaryTunnelPlugin:0];
LABEL_66:
            BOOL v4 = 0;
LABEL_67:

            goto LABEL_68;
          }
LABEL_33:
          id v27 = ne_log_obj();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v98 = self;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@: Failed to create an NEAgent", buf, 0xCu);
          }
          id v21 = 0;
          goto LABEL_66;
        }
        uint64_t v12 = (objc_class *)v15;
        v96[0] = @"plugin-requirement";
        v96[1] = @"extension-identifier";
        *(void *)&long long v101 = v10;
        *((void *)&v101 + 1) = v9;
        id v16 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:v96 count:2];
LABEL_18:
        id v18 = [v12 alloc];
        int64_t v19 = [(NESMVPNSession *)self agentPluginClass];
        int v20 = [(NESMSession *)self uid];
        id v21 = [v18 initWithPluginType:v8 pluginVersion:1 pluginClass:v19 pluginInfo:v16 userID:v20];

        goto LABEL_19;
      }
      id v17 = objc_alloc_init((Class)NSMutableDictionary);
      [v17 setObject:v9 forKeyedSubscript:@"extension-identifier"];
      if (!v10)
      {
LABEL_12:
        if ([v17 count]) {
          id v16 = [objc_alloc((Class)NSDictionary) initWithDictionary:v17];
        }
        else {
          id v16 = 0;
        }

        goto LABEL_18;
      }
    }
    else
    {
      id v17 = objc_alloc_init((Class)NSMutableDictionary);
      if (!v10) {
        goto LABEL_12;
      }
    }
    [v17 setObject:v10 forKeyedSubscript:@"plugin-requirement"];
    goto LABEL_12;
  }
  return 1;
}

- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3
{
  id v8 = a3;
  if ([(NESMVPNSession *)self sessionType] == 1)
  {
    BOOL v4 = [v8 VPN];
LABEL_5:
    id v5 = v4;
    id v6 = [v4 protocol];

    goto LABEL_7;
  }
  if ([(NESMVPNSession *)self sessionType] == 2)
  {
    BOOL v4 = [v8 appVPN];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(NESMVPNSession *)self providerDesignatedRequirement];
    [v6 setDesignatedRequirement:v7];
  }
}

- (NSString)extensibleSSOProvider
{
  v2 = [(NESMVPNSession *)self protocol];
  uint64_t v3 = [v2 extensibleSSOProvider];

  return (NSString *)v3;
}

- (void)setProviderDesignatedRequirement:(id)a3
{
  id v4 = a3;
  id v5 = [(NESMVPNSession *)self protocol];
  [v5 setDesignatedRequirement:v4];
}

- (NSString)providerDesignatedRequirement
{
  v2 = [(NESMVPNSession *)self protocol];
  uint64_t v3 = [v2 designatedRequirement];

  return (NSString *)v3;
}

- (NSString)authenticationPluginBundleIdentifier
{
  v2 = [(NESMVPNSession *)self protocol];
  uint64_t v3 = [v2 authenticationPluginType];

  return (NSString *)v3;
}

- (NSString)providerBundleIdentifier
{
  v2 = [(NESMVPNSession *)self protocol];
  uint64_t v3 = [v2 providerBundleIdentifier];

  return (NSString *)v3;
}

- (BOOL)hasProviderWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NESMVPNSession *)self providerBundleIdentifier];
  if (v5) {
    unsigned __int8 v6 = [v4 isEqualToString:v5];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (int64_t)agentPluginClass
{
  return 5;
}

- (void)addDefaultDropPolicyForPluginUUIDs:(id)a3
{
  id v4 = a3;
  if ((id)[(NESMVPNSession *)self parentType] == (id)1)
  {
    id v5 = [(NESMVPNSession *)self parent];
    unsigned __int8 v6 = self;
    id v7 = v4;
    if (v5 && v6)
    {
      id v8 = [v5 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000B9DC;
      block[3] = &unk_1000C6958;
      block[4] = v5;
      unsigned int v13 = v6;
      id v14 = v7;
      dispatch_async(v8, block);
    }
  }
  else
  {
    id v9 = [(NESMSession *)self queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002ACD4;
    v10[3] = &unk_1000C6C38;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v9, v10);
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state == a3) {
    return;
  }
  id v5 = [(NESMVPNSession *)self cachedStateHandlers];

  if (!v5) {
    goto LABEL_4;
  }
  unsigned __int8 v6 = [(NESMVPNSession *)self cachedStateHandlers];
  id v7 = +[NSNumber numberWithInteger:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
LABEL_4:
    uint64_t v9 = +[NESMVPNSessionState stateWithType:a3];
    if (!v9) {
      __assert_rtn("-[NESMVPNSession setState:]", "NESMVPNSession.m", 466, "0");
    }
    id v8 = (void *)v9;
    int v10 = [(NESMVPNSession *)self cachedStateHandlers];

    if (!v10)
    {
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
      [(NESMVPNSession *)self setCachedStateHandlers:v11];
    }
    uint64_t v12 = [(NESMVPNSession *)self cachedStateHandlers];
    unsigned int v13 = +[NSNumber numberWithInteger:a3];
    [v12 setObject:v8 forKeyedSubscript:v13];
  }
  int64_t state = self->_state;
  [(NESMVPNSessionState *)self->_stateHandler leave];
  self->_int64_t state = a3;
  objc_storeStrong((id *)&self->_stateHandler, v8);
  [(NESMVPNSessionState *)self->_stateHandler enterWithSession:self];
  if (state)
  {
    if (state == 10)
    {
      int64_t v15 = self->_state;
      if (v15 == 1) {
        goto LABEL_24;
      }
    }
    else
    {
      int64_t v15 = self->_state;
    }
    uint64_t v16 = 2;
    switch(v15)
    {
      case 0:
      case 1:
      case 9:
      case 10:
        if ((id)[(NESMVPNSession *)self parentType] != (id)1) {
          sub_10001BDD4(self);
        }
        goto LABEL_16;
      case 2:
      case 3:
      case 7:
        goto LABEL_23;
      case 4:
        uint64_t v16 = 3;
        goto LABEL_23;
      case 5:
      case 8:
        uint64_t v16 = 5;
        goto LABEL_23;
      case 6:
        uint64_t v16 = 4;
        goto LABEL_23;
      default:
LABEL_16:
        id v17 = [(NESMSession *)self configuration];
        id v18 = [v17 VPN];
        int64_t v19 = [v18 protocol];
        unsigned int v20 = [v19 includeAllNetworks];

        if (v20)
        {
          dispatch_time_t v22 = dispatch_time(0, 1000000000);
          id v23 = [(NESMSession *)self queue];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10002B258;
          v27[3] = &unk_1000C6DD8;
          v27[4] = self;
          int v28 = 1;
          dispatch_after(v22, v23, v27);

          goto LABEL_25;
        }
        uint64_t v16 = 1;
        if (objc_getProperty(self, v21, 464, 1))
        {
          id Property = (void (**)(void))objc_getProperty(self, v24, 464, 1);
          Property[2]();
          objc_setProperty_atomic_copy(self, v26, 0, 464);
        }
LABEL_23:
        [(NESMVPNSession *)self setStatus:v16];
        break;
    }
  }
LABEL_24:
  [(NESMVPNSession *)self applyNWPathOverridesIfNeeded];
LABEL_25:
}

- (void)dealloc
{
  uint64_t v3 = [(NESMVPNSession *)self notification];

  if (v3)
  {
    id v4 = [(NESMVPNSession *)self notification];
    [v4 cancel];
  }
  if ([(NESMVPNSession *)self virtualInterface]) {
    CFRelease([(NESMVPNSession *)self virtualInterface]);
  }
  if (self && objc_getProperty(self, v5, 448, 1))
  {
    id Property = objc_getProperty(self, v5, 448, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(self, v7, 0, 448);
  }
  sub_10001C00C(self, v5);
  v8.receiver = self;
  v8.super_class = (Class)NESMVPNSession;
  [(NESMSession *)&v8 dealloc];
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int64_t v5 = [(NESMVPNSession *)self parentType];
  if (self)
  {
    int64_t v6 = [(NESMVPNSession *)self tunnelKind];
    SEL v7 = @"Fallback Tunnel";
    if (v6 != 2) {
      SEL v7 = &stru_1000C7428;
    }
    if (v6 == 1) {
      SEL v7 = @"Primary Tunnel";
    }
  }
  else
  {
    SEL v7 = 0;
  }
  if (v5) {
    CFStringRef v8 = @"Child:";
  }
  else {
    CFStringRef v8 = &stru_1000C7428;
  }
  uint64_t v9 = v7;
  int v10 = [(NESMSession *)self configuration];
  id v11 = [v10 name];
  uint64_t v12 = [(NESMSession *)self configuration];
  unsigned int v13 = [v12 identifier];
  id v14 = [v13 UUIDString];
  int64_t v15 = [(NESMVPNSession *)self interfaceName];
  uint64_t v16 = +[NSString stringWithFormat:@"%@[%@%@:%@:%@:%@]", v4, v8, v9, v11, v14, v15];

  return (NSString *)v16;
}

- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7
{
  return [(NESMVPNSession *)self initWithConfiguration:a3 andServer:a4 andProtocol:a5 andPluginType:a6 andSessionType:*(void *)&a7 sessionQueue:0 messageQueue:0 tunnelKind:1 parent:0];
}

- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7 sessionQueue:(id)a8 messageQueue:(id)a9 tunnelKind:(int64_t)a10 parent:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v57 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  v59.receiver = self;
  v59.super_class = (Class)NESMVPNSession;
  id v23 = [(NESMSession *)&v59 initWithConfiguration:v17 andServer:v18 sessionQueue:v20 messageQueue:v21];
  id v24 = v23;
  if (!v23) {
    goto LABEL_19;
  }
  id v56 = v18;
  v23->_sessionType = a7;
  v23->_int64_t state = 0;
  objc_storeStrong((id *)&v23->_protocol, a5);
  establishIPCReply = v24->_establishIPCReply;
  v24->_establishIPCReply = 0;

  establishIPCMessage = v24->_establishIPCMessage;
  v24->_establishIPCMessage = 0;

  id v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v28 = dispatch_queue_create("tunnel changes queue", v27);
  tunnelConfigQueue = v24->_tunnelConfigQueue;
  v24->_tunnelConfigQueue = (OS_dispatch_queue *)v28;

  NEInitCFTypes();
  uint64_t v30 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  setConfigurationCompletionHandlerArray = v24->_setConfigurationCompletionHandlerArray;
  v24->_setConfigurationCompletionHandlerArray = v30;

  id pluginCompletionHandler = v24->_pluginCompletionHandler;
  v24->_id pluginCompletionHandler = 0;

  v24->_tunnelKind = a10;
  v24->_stopped = 1;
  if (v22)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v33 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        abort();
      }
      uint64_t v33 = 2;
    }
    v24->_parentType = v33;
    objc_storeWeak((id *)&v24->_parent, v22);
  }
  if (a7 <= 6 && ((1 << a7) & 0x46) != 0)
  {
    id v34 = [v17 VPN];

    if (v34)
    {
      __int16 v35 = [v17 VPN];
    }
    else
    {
      id v36 = [v17 appVPN];

      if (!v36)
      {
        uint64_t v38 = 1;
        goto LABEL_15;
      }
      __int16 v35 = [v17 appVPN];
    }
    int v37 = v35;
    uint64_t v38 = (uint64_t)[v35 tunnelType];

LABEL_15:
    __int16 v39 = [NESMPolicySession alloc];
    id v40 = [v17 identifier];
    __int16 v41 = sub_100031564((id *)&v39->super.isa, v40, a7, [v17 grade], (void *)v38, (void *)a10);
    [(NESMSession *)v24 setPolicySession:v41];

    sub_10007FEB0(v24);
  }
  id v42 = [objc_alloc((Class)NEPolicySession) initWithSessionName:@"VPN control"];
  [(NESMSession *)v24 setControlPolicySession:v42];

  uint64_t v43 = [(NESMSession *)v24 controlPolicySession];

  if (!v43)
  {
    int v53 = ne_log_obj();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      char v52 = 0;
      id v18 = v56;
      goto LABEL_24;
    }
    *(_WORD *)long long buf = 0;
    SEL v54 = "Failed to create VPN control policy session";
LABEL_27:
    _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, v54, buf, 2u);
    goto LABEL_23;
  }
  id v44 = [(NESMSession *)v24 controlPolicySession];
  [v44 setPriority:100];

  id v45 = [(NESMSession *)v24 controlPolicySession];
  [v45 lockSessionToCurrentProcess];

  id v46 = [objc_alloc((Class)NEPolicySession) initWithSessionName:@"VPN high"];
  [(NESMSession *)v24 setHighPolicySession:v46];

  uint64_t v47 = [(NESMSession *)v24 highPolicySession];

  if (!v47)
  {
    int v53 = ne_log_obj();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)long long buf = 0;
    SEL v54 = "Failed to create VPN high policy session";
    goto LABEL_27;
  }
  id v48 = [(NESMSession *)v24 highPolicySession];
  [v48 setPriority:400];

  id v49 = [(NESMSession *)v24 highPolicySession];
  [v49 lockSessionToCurrentProcess];

  id v50 = objc_alloc_init(NESMVPNSessionRetryCounter);
  objc_setProperty_atomic(v24, v51, v50, 456);

  id v18 = v56;
LABEL_19:
  char v52 = v24;
LABEL_24:

  return v52;
}

@end