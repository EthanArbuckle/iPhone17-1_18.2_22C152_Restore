@interface NESMFlowDivertSession
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)resetPerAppPolicy;
- (NESMFlowDivertSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6;
- (id)pluginDidRequestFlowDivertControlSocket:(id)a3;
- (int64_t)agentPluginClass;
- (void)dealloc;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInstalledAppsChanged;
- (void)handleUserLogin;
- (void)install;
- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5;
- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4;
- (void)requestInstall;
- (void)setConfigurationWithCompletionHandler:(id)a3;
- (void)uninstall;
@end

@implementation NESMFlowDivertSession

- (void).cxx_destruct
{
}

- (void)handleUserLogin
{
  v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E04C;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleInstalledAppsChanged
{
  v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E164;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = [a3 copy];
  v5 = [v4 appVPN];
  v6 = [(NESMSession *)self uid];
  [v5 updateAppRulesForUID:[v6 unsignedIntValue]];

  v8.receiver = self;
  v8.super_class = (Class)NESMFlowDivertSession;
  LOBYTE(self) = [(NESMVPNSession *)&v8 handleUpdateConfiguration:v4];

  return (char)self;
}

- (BOOL)resetPerAppPolicy
{
  v3 = [(NESMSession *)self configuration];
  id v4 = [v3 appVPN];
  v5 = [v4 appRules];
  if (![v5 count] || !-[NESMSession isActive](self, "isActive"))
  {

    return 1;
  }
  if (self) {
    id Property = objc_getProperty(self, v6, 688, 1);
  }
  else {
    id Property = 0;
  }

  if (!Property) {
    return 1;
  }
  objc_super v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Re-setting app rule policy", (uint8_t *)&buf, 0xCu);
  }

  id v9 = objc_alloc_init((Class)NSMutableString);
  v10 = [(NESMSession *)self configuration];
  v11 = [v10 appVPN];
  v12 = [v11 appRules];
  [v9 appendPrettyObject:v12 withName:@"Current app rules" andIndent:0 options:0];

  v13 = ne_log_large_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&buf, 0xCu);
  }

  v14 = [(NESMSession *)self configuration];
  v16 = [v14 appVPN];
  if (self) {
    id v17 = objc_getProperty(self, v15, 688, 1);
  }
  else {
    id v17 = 0;
  }
  v18 = [v17 handle];
  unsigned __int8 v19 = [v16 installSigningIdentifiersWithFlowDivertControlSocket:[v18 fileDescriptor]];

  if (v19)
  {
    v20 = [(NESMSession *)self policySession];
    v21 = [(NESMSession *)self configuration];
    v22 = [v21 appVPN];
    v23 = [v22 appRules];
    v24 = [(NESMSession *)self uid];
    [v24 intValue];
    sub_10003E240((uint64_t)v20, v23);

    uint64_t v25 = [(NESMSession *)self policySession];
    v26 = [(NESMSession *)self configuration];
    v27 = [v26 appVPN];
    v29 = [v27 appRules];
    if (self) {
      id v30 = objc_getProperty(self, v28, 688, 1);
    }
    else {
      id v30 = 0;
    }
    v31 = [v30 controlUnit];
    unsigned int v51 = [v31 unsignedIntValue];
    v32 = [(NESMVPNSession *)self pluginConfigurationEntities];
    uint64_t v33 = [v32 DNSSettings];
    v54 = [(NESMVPNSession *)self pluginConfigurationEntities];
    v53 = [v54 proxySettings];
    unsigned __int8 v34 = [v53 enabled];
    v59 = v26;
    v60 = (_DWORD *)v25;
    v52 = v9;
    v57 = v31;
    v58 = v27;
    v56 = v32;
    if (v34)
    {
      unsigned __int8 v50 = 1;
    }
    else
    {
      v49 = [(NESMVPNSession *)self protocol];
      v48 = [v49 proxySettings];
      unsigned __int8 v50 = [v48 enabled];
    }
    v55 = (void *)v33;
    BOOL v37 = v33 != 0;
    v38 = [(NESMVPNSession *)self primaryTunnelPlugin];
    v40 = sub_100017808(v38, v39);
    v41 = [(NESMSession *)self configuration];
    v42 = [v41 appVPN];
    v43 = [v42 excludedDomains];
    id v44 = v29;
    id v45 = v40;
    id v46 = v43;
    char v47 = (char)v60;
    if (v60)
    {
      if (isa_nsarray() && v60[2] == 2)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v62 = sub_1000442A8;
        v63 = &unk_1000C5E90;
        v64 = v60;
        unsigned int v68 = v51;
        unsigned __int8 v69 = v50;
        BOOL v70 = v37;
        id v65 = v44;
        id v66 = v45;
        id v67 = v46;
        char v47 = sub_10002EC18((uint64_t)NESMPolicyMasterSession, &buf);
      }
      else
      {
        char v47 = 0;
      }
    }

    if ((v34 & 1) == 0)
    {
    }
    if (v47)
    {

      return 1;
    }
    v36 = ne_log_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@: failed to update the flow divert policies after installed applications changed", (uint8_t *)&buf, 0xCu);
    }
    id v9 = v52;
  }
  else
  {
    v36 = ne_log_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@: failed to install the signing identifiers in the kernel", (uint8_t *)&buf, 0xCu);
    }
  }

  return 0;
}

- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  [(NESMVPNSession *)self setPluginConfigurationEntities:v9];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000E9E8;
  v12[3] = &unk_1000C5680;
  id v11 = v10;
  id v13 = v11;
  objc_copyWeak(&v14, &location);
  [(NESMFlowDivertSession *)self setConfigurationWithCompletionHandler:v12];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (id)pluginDidRequestFlowDivertControlSocket:(id)a3
{
  id v4 = [(NESMSession *)self configuration];
  v5 = [v4 appVPN];

  v6 = [(NESMVPNSession *)self protocol];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(NESMVPNSession *)self protocol];
    uint64_t v10 = (uint64_t)[v9 order];
  }
  else
  {
    uint64_t v10 = 0x7FFFFFFFLL;
  }
  if (self) {
    id Property = objc_getProperty(self, v8, 688, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = objc_alloc((Class)NEFlowDivertFileHandle);
  if (Property)
  {
    id v13 = [v12 initFlowDivertDataSocket];
  }
  else
  {
    id v13 = [v12 initFlowDivertControlSocketWithParams:v5 == 0 order:v10];
    if (self) {
      objc_setProperty_atomic(self, v14, v13, 688);
    }
  }
  v15 = [v13 handle];

  return v15;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = v6;
  if (v4 == 4)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (self) {
      id Property = objc_getProperty(self, v8, 688, 1);
    }
    else {
      id Property = 0;
    }
    id v11 = [Property keyMaterial];

    if (v11)
    {
      if (self) {
        id v13 = objc_getProperty(self, v12, 688, 1);
      }
      else {
        id v13 = 0;
      }
      id v14 = [v13 keyMaterial];
      id v16 = [v14 bytes];
      if (self) {
        id v17 = objc_getProperty(self, v15, 688, 1);
      }
      else {
        id v17 = 0;
      }
      v18 = [v17 keyMaterial];
      xpc_object_t v19 = xpc_data_create(v16, (size_t)[v18 length]);

      v20 = xpc_dictionary_get_value(v7, "SessionOptions");
      v21 = v20;
      if (v20 && xpc_get_type(v20) == (xpc_type_t)&_xpc_type_dictionary)
      {
        v22 = xpc_dictionary_get_value(v21, "SessionFlowDivertTokenProperties");
        v23 = v22;
        if (v22 && xpc_get_type(v22) == (xpc_type_t)&_xpc_type_dictionary)
        {
          xpc_dictionary_get_uint64(v21, "SessionFlowDivertTokenControlUnit");
          xpc_dictionary_get_string(v21, "SessionFlowDivertTokenSigningIdentifier");
          v24 = (void *)ne_session_policy_copy_flow_divert_token_with_key();
          uint64_t v25 = v24;
          if (v24 && xpc_get_type(v24) == (xpc_type_t)&_xpc_type_data)
          {
            xpc_object_t v26 = xpc_dictionary_create(0, 0, 0);
            v27 = v26;
            if (v26 && xpc_get_type(v26) == (xpc_type_t)&_xpc_type_dictionary)
            {
              xpc_dictionary_set_value(v27, "SessionFlowDivertTokenKey", v25);
              xpc_dictionary_set_value(reply, "SessionInfo", v27);
            }
          }
        }
      }
    }
    xpc_dictionary_get_remote_connection(v7);
    v28 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v28, reply);
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)NESMFlowDivertSession;
    [(NESMVPNSession *)&v29 handleGetInfoMessage:v6 withType:v4];
  }
}

- (void)uninstall
{
  v3 = [(NESMSession *)self policySession];
  sub_1000319BC((uint64_t)v3);

  uint64_t v4 = [(NESMSession *)self policySession];
  sub_10002E854((uint64_t)v4);

  sub_100081474(self);
  if (self)
  {
    if (self->_scstore)
    {
      id v6 = [(NESMSession *)self configuration];
      v7 = [v6 identifier];
      NetworkServiceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, (CFStringRef)[v7 UUIDString], kSCEntNetProxies);

      id v9 = [(NESMSession *)self configuration];
      uint64_t v10 = [v9 identifier];
      id v11 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, (CFStringRef)[v10 UUIDString], kSCEntNetDNS);

      v14[0] = NetworkServiceEntity;
      v14[1] = v11;
      CFArrayRef v12 = +[NSArray arrayWithObjects:v14 count:2];
      SCDynamicStoreSetMultiple(self->_scstore, 0, v12, 0);
    }
    objc_setProperty_atomic(self, v5, 0, 688);
  }
  id v13 = [(NESMVPNSession *)self stateHandler];
  [v13 handleClearConfigurationResult:1];
}

- (void)install
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F0D4;
  v3[3] = &unk_1000C5658;
  objc_copyWeak(&v4, &location);
  [(NESMFlowDivertSession *)self setConfigurationWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)requestInstall
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id)[(NESMVPNSession *)self parentType] == (id)1)
  {
    id v4 = [(NESMVPNSession *)self parent];
    v3 = [(NESMSession *)self server];
    [v3 requestInstallForSession:self withParentSession:v4 exclusive:0];
  }
  else
  {
    id v4 = [(NESMSession *)self server];
    [v4 requestInstallForSession:self withParentSession:0 exclusive:0];
  }
}

- (void)setConfigurationWithCompletionHandler:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F294;
  v3[3] = &unk_1000C5630;
  void v3[4] = self;
  [(NESMVPNSession *)self queueChangesToTunnelConfiguration:v3 completionHandler:a3];
}

- (int64_t)agentPluginClass
{
  return 2;
}

- (void)dealloc
{
  if (self)
  {
    scstore = self->_scstore;
    if (scstore) {
      CFRelease(scstore);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NESMFlowDivertSession;
  [(NESMVPNSession *)&v4 dealloc];
}

- (NESMFlowDivertSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 copy];
  id v14 = [v13 appVPN];
  v15 = [(NESMSession *)self uid];
  [v14 updateAppRulesForUID:[v15 unsignedIntValue]];

  v18.receiver = self;
  v18.super_class = (Class)NESMFlowDivertSession;
  id v16 = [(NESMVPNSession *)&v18 initWithConfiguration:v13 andServer:v12 andProtocol:v11 andPluginType:v10 andSessionType:2];

  return v16;
}

@end