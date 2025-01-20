@interface NESMRelaySession
+ (BOOL)hasRequiredFrameworks;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)reportError:(int)a3 withOptions:(id)a4;
- (BOOL)shouldBeIdleForStatus:(int)a3;
- (NESMRelaySession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (id)copyExtendedStatus;
- (int)type;
- (void)dealloc;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)install;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)uninstall;
@end

@implementation NESMRelaySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayStats, 0);
  objc_storeStrong((id *)&self->_orderedSynthesizedHostnames, 0);
  objc_storeStrong((id *)&self->_synthesizedIPv6Addresses, 0);
  objc_storeStrong((id *)&self->_synthesizedIPv4Addresses, 0);
  objc_storeStrong((id *)&self->_dnsListener, 0);
  objc_storeStrong((id *)&self->_extraExceptionDomains, 0);
  objc_storeStrong((id *)&self->_relayOnDemandMonitor, 0);
  objc_storeStrong((id *)&self->_onDemandTransaction, 0);
  objc_storeStrong((id *)&self->_relayConfig, 0);
  objc_storeStrong((id *)&self->_dnsAgentRegistration, 0);
  objc_storeStrong((id *)&self->_dnsAgent, 0);
  objc_storeStrong((id *)&self->_fallbackAgentRegistration, 0);
  objc_storeStrong((id *)&self->_fallbackAgent, 0);
  objc_storeStrong((id *)&self->_fallbackProxyConfig, 0);

  objc_storeStrong((id *)&self->_proxyConfig, 0);
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if ((int)v4 <= 1103)
  {
    if ((v4 & 0x80000000) == 0)
    {
      if (!v4) {
        goto LABEL_21;
      }
      if (v4 != 60 && v4 != 1100) {
        goto LABEL_28;
      }
      goto LABEL_19;
    }
    if ((v4 + 65568) > 0x1E || ((1 << (v4 + 32)) & 0x4000C001) == 0) {
      goto LABEL_28;
    }
    uint64_t v4 = 17;
  }
  else
  {
    if ((int)v4 <= 1203)
    {
      if ((v4 - 1104) >= 2)
      {
        if (v4 != 1106)
        {
          if (v4 != 1200) {
            goto LABEL_28;
          }
LABEL_19:
          uint64_t v4 = 20;
          goto LABEL_21;
        }
        goto LABEL_20;
      }
LABEL_15:
      uint64_t v4 = 21;
      goto LABEL_21;
    }
    if ((v4 - 1204) < 2) {
      goto LABEL_15;
    }
    if (v4 == 1206)
    {
LABEL_20:
      uint64_t v4 = 28;
      goto LABEL_21;
    }
    if (v4 != 1302) {
      goto LABEL_28;
    }
    uint64_t v4 = 18;
  }
LABEL_21:
  if (!self)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    goto LABEL_24;
  }
  if (!objc_getProperty(self, v6, 472, 1))
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_setProperty_atomic(self, v9, v8, 472);
LABEL_24:
  }
  v11 = +[NSDate now];
  if (self) {
    id Property = objc_getProperty(self, v10, 472, 1);
  }
  else {
    id Property = 0;
  }
  id v13 = Property;
  v14 = +[NSNumber numberWithInt:v4];
  [v13 setObject:v11 forKeyedSubscript:v14];

LABEL_28:
  return 1;
}

- (id)copyExtendedStatus
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  v52.receiver = self;
  v52.super_class = (Class)NESMRelaySession;
  id v4 = [(NESMSession *)&v52 copyExtendedStatus];
  id v41 = [v3 initWithDictionary:v4];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v5, 472, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  id v8 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v49;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8 * (void)v12);
        if (self) {
          id v14 = objc_getProperty(self, v9, 472, 1);
        }
        else {
          id v14 = 0;
        }
        v15 = [v14 objectForKeyedSubscript:v13, v41];
        [v15 timeIntervalSinceNow];
        double v17 = v16;

        if (v17 > 86400.0)
        {
          if (self) {
            id v18 = objc_getProperty(self, v9, 472, 1);
          }
          else {
            id v18 = 0;
          }
          [v18 removeObjectForKey:v13];
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v19 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
      id v10 = v19;
    }
    while (v19);
  }

  if (self) {
    id v21 = objc_getProperty(self, v20, 472, 1);
  }
  else {
    id v21 = 0;
  }
  v22 = [v21 keysSortedByValueUsingComparator:&stru_1000C6600, v41];
  id v23 = objc_alloc_init((Class)NSMutableArray);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v22;
  id v24 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v45;
    do
    {
      v27 = 0;
      do
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v27);
        id v29 = objc_alloc_init((Class)NSMutableDictionary);
        [v29 setObject:v28 forKeyedSubscript:@"LastCause"];
        if (self)
        {
          v31 = [objc_getProperty(self, v30, 472, 1) objectForKeyedSubscript:v28];
          [v31 timeIntervalSince1970];
          v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v29 setObject:v32 forKeyedSubscript:@"TimeEpoch"];

          id v34 = objc_getProperty(self, v33, 472, 1);
        }
        else
        {
          v37 = [0 objectForKeyedSubscript:v28];
          [v37 timeIntervalSince1970];
          v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v29 setObject:v38 forKeyedSubscript:@"TimeEpoch"];

          id v34 = 0;
        }
        v35 = [v34 objectForKeyedSubscript:v28];
        v36 = [v35 description];
        [v29 setObject:v36 forKeyedSubscript:@"TimeString"];

        [v23 addObject:v29];
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v39 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
      id v25 = v39;
    }
    while (v39);
  }

  [v42 setObject:v23 forKeyedSubscript:@"SortedRelayErrors"];
  return v42;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    id v7 = [(NESMRelaySession *)self copyExtendedStatus];
    if (v7)
    {
      id v8 = v7;
      SEL v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(reply, "SessionInfo", v9);
    }
  }
  xpc_dictionary_get_remote_connection(xdict);
  id v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v10, reply);
}

- (void)dealloc
{
  sub_10007737C(self, a2);
  [(NESMRelaySession *)self uninstall];
  v3.receiver = self;
  v3.super_class = (Class)NESMRelaySession;
  [(NESMSession *)&v3 dealloc];
}

- (void)uninstall
{
  objc_super v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    double v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ uninstalling relay session", (uint8_t *)&v15, 0xCu);
  }

  id v4 = [(NESMSession *)self policySession];
  sub_10002E854((uint64_t)v4);

  sub_100077618(self, v5);
  sub_100077734(self, v6);
  if (self)
  {
    id Property = objc_getProperty(self, v7, 440, 1);
    if (Property)
    {
      SEL v9 = Property;
      objc_setProperty_atomic(self, v10, 0, 440);
      self->_dnsListenerPort = 0;
      nw_connection_group_cancel(v9);
    }
  }
  uint64_t v11 = [(NESMSession *)self configuration];
  v12 = [v11 relay];
  unsigned __int8 v13 = [v12 isEnabled];

  if ((v13 & 1) == 0) {
    sub_10007737C(self, v14);
  }
  if (self) {
    objc_setProperty_atomic(self, v14, 0, 472);
  }
  [(NESMSession *)self setStatus:1];
}

- (void)install
{
  selfa = self;
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v138 = selfa;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%@ installing relay session", buf, 0xCu);
  }

  sub_100077618(selfa, v3);
  sub_100077734(selfa, v4);
  if (!selfa)
  {
    sub_100078CA8(0, 1);
    goto LABEL_80;
  }
  id v6 = objc_getProperty(selfa, v5, 408, 1);
  if (!v6) {
    goto LABEL_18;
  }
  id v8 = v6;
  if ((objc_msgSend(objc_getProperty(selfa, v7, 408, 1), "isEnabled") & 1) == 0)
  {

    goto LABEL_18;
  }
  SEL v10 = objc_msgSend(objc_getProperty(selfa, v9, 408, 1), "relays");
  BOOL v11 = [v10 count] == 0;

  if (v11)
  {
LABEL_18:
    objc_setProperty_atomic(selfa, v7, 0, 360);
    objc_setProperty_atomic(selfa, v24, 0, 368);
    goto LABEL_19;
  }
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v12 = [objc_getProperty(selfa, v7, 408, 1) relays];
  id v13 = [v12 countByEnumeratingWithState:&v131 objects:buf count:16];
  if (!v13)
  {

    v126 = (void *)nw_array_create();
    int v23 = 0;
    goto LABEL_23;
  }
  uint64_t v14 = *(void *)v132;
  int v15 = 1;
  int v16 = 1;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v132 != v14) {
        objc_enumerationMutation(v12);
      }
      id v18 = *(void **)(*((void *)&v131 + 1) + 8 * i);
      id v19 = [v18 HTTP3RelayURL:selfa];
      BOOL v20 = v19 != 0;

      id v21 = [v18 HTTP2RelayURL];
      LODWORD(v18) = v21 != 0;

      v16 &= v20;
      v15 &= v18;
    }
    id v13 = [v12 countByEnumeratingWithState:&v131 objects:buf count:16];
  }
  while (v13);

  if ((v16 | v15))
  {
    v126 = (void *)nw_array_create();
    int v23 = v15 & ~v16;
    if ((v16 & v15) == 0)
    {
      v124 = 0;
      int v125 = 0;
      goto LABEL_24;
    }
LABEL_23:
    v124 = (void *)nw_array_create();
    int v125 = 1;
LABEL_24:
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    v30 = [objc_getProperty(selfa, v22, 408, 1) relays];
    id v31 = [v30 countByEnumeratingWithState:&v127 objects:v136 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v128;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v128 != v32) {
            objc_enumerationMutation(v30);
          }
          id v34 = *(void **)(*((void *)&v127 + 1) + 8 * (void)j);
          if (v23) {
            [*(id *)(*((void *)&v127 + 1) + 8 * (void)j) HTTP2RelayURL];
          }
          else {
          v35 = [*(id *)(*((void *)&v127 + 1) + 8 * (void)j) HTTP3RelayURL];
          }
          v36 = [v35 absoluteString];

          if (v36)
          {
            v37 = sub_10007913C(v36, v34);
            nw_array_append();
            if (v125)
            {
              v38 = [v34 HTTP2RelayURL];
              id v39 = [v38 absoluteString];

              if (v39)
              {
                v40 = sub_10007913C(v39, v34);
                nw_array_append();
              }
            }
            else
            {
              id v39 = 0;
            }
          }
        }
        id v31 = [v30 countByEnumeratingWithState:&v127 objects:v136 count:16];
      }
      while (v31);
    }

    if (!v125)
    {
      sub_100077618(selfa, v41);
      goto LABEL_68;
    }
    fallback_privacy_proxy = (void *)nw_proxy_config_create_fallback_privacy_proxy();
    objc_setProperty_atomic(selfa, v43, fallback_privacy_proxy, 368);

    objc_getProperty(selfa, v44, 368, 1);
    nw_proxy_config_set_ignore_privacy_stance();
    objc_getProperty(selfa, v45, 368, 1);
    nw_proxy_config_set_use_over_privacy_proxy();
    id v46 = objc_alloc((Class)NERelayNetworkAgent);
    long long v47 = [(NESMSession *)selfa configuration];
    long long v48 = [v47 identifier];
    id v49 = [v46 initWithConfigUUID:v48 sessionType:-[NESMRelaySession type](selfa, "type") name:@"h2-fallback"];
    objc_setProperty_atomic(selfa, v50, v49, 376);

    [objc_getProperty(selfa, v51, 376, 1) setActive:1];
    objc_super v52 = [(NESMSession *)selfa configuration];
    v53 = [v52 name];
    [objc_getProperty(selfa, v54, 376, 1) setConfigurationName:v53];

    id v55 = objc_alloc((Class)NWNetworkAgentRegistration);
    objc_getProperty(selfa, v56, 376, 1);
    id v57 = [v55 initWithNetworkAgentClass:objc_opt_class()];
    objc_setProperty_atomic(selfa, v58, v57, 384);

    id v60 = objc_getProperty(selfa, v59, 368, 1);
    v62 = [objc_getProperty(selfa, v61, 376, 1) proxyConfig];
    char is_equal = nw_proxy_config_is_equal();

    if ((is_equal & 1) == 0) {
      [objc_getProperty(selfa, v64, 376, 1) setProxyConfig:v60];
    }
    *(void *)&long long v145 = 0;
    *((void *)&v145 + 1) = &v145;
    uint64_t v146 = 0x3032000000;
    v147 = sub_100078DC8;
    v148 = sub_100078DD8;
    id v149 = 0;
    v65 = +[NEFileHandleMaintainer sharedMaintainer];
    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472;
    v135[2] = sub_10007A860;
    v135[3] = &unk_1000C66A0;
    v135[4] = selfa;
    v135[5] = &v145;
    [v65 iterateFileHandlesWithBlock:v135];

    v66 = *(void **)(*((void *)&v145 + 1) + 40);
    if (v66) {
      [v66 agentUUID];
    }
    else {
    v67 = +[NSUUID UUID];
    }
    id v69 = objc_getProperty(selfa, v68, 376, 1);
    [v69 setAgentUUID:v67];

    v73 = *(void **)(*((void *)&v145 + 1) + 40);
    if (v73)
    {
      v74 = [v73 handle];
      uint64_t v75 = dup((int)[v74 fileDescriptor]);

      id v77 = objc_getProperty(selfa, v76, 384, 1);
      id v79 = objc_getProperty(selfa, v78, 376, 1);
      unsigned __int8 v80 = [v77 setRegisteredNetworkAgent:v79 fileDescriptor:v75];

      v82 = selfa;
      if ((v80 & 1) == 0)
      {
        close(v75);
        sub_10007DB9C(selfa);
      }
    }
    else
    {
      v82 = selfa;
      sub_10007DB9C(selfa);
    }
    id v83 = objc_getProperty(v82, v81, 384, 1);
    unsigned __int8 v84 = [v83 isRegistered];

    if (v84)
    {
      v86 = selfa;
      if (is_equal)
      {
LABEL_67:
        sub_100077B80(v86);
        _Block_object_dispose(&v145, 8);

LABEL_68:
        if (v23) {
          default_privacy_proxy = (void *)nw_proxy_config_create_fallback_privacy_proxy();
        }
        else {
          default_privacy_proxy = (void *)nw_proxy_config_create_default_privacy_proxy();
        }
        v108 = default_privacy_proxy;
        objc_setProperty_atomic(selfa, v107, default_privacy_proxy, 360);

        objc_getProperty(selfa, v109, 360, 1);
        nw_proxy_config_set_ignore_privacy_stance();
        objc_getProperty(selfa, v110, 360, 1);
        nw_proxy_config_set_use_over_privacy_proxy();
        if (v125)
        {
          v112 = [objc_getProperty(selfa, v111, 376, 1) agentUUID];
          BOOL v113 = v112 == 0;

          if (!v113)
          {
            long long v145 = 0uLL;
            v114 = [objc_getProperty(selfa, v111, 376, 1) agentUUID];
            [v114 getUUIDBytes:&v145];

            objc_getProperty(selfa, v115, 360, 1);
            nw_proxy_config_set_fallback_proxy_agent();
          }
        }
        v116 = [objc_getProperty(selfa, v111, 408, 1) relays];
        v117 = [v116 lastObject];

        v118 = [v117 dnsOverHTTPSURL];
        if (v118)
        {
        }
        else if (!sub_10007945C(selfa, v119))
        {
LABEL_78:

          goto LABEL_19;
        }
        sub_1000794F4((unsigned __int16 *)selfa, (const char *)1);
        goto LABEL_78;
      }
      id v87 = objc_getProperty(selfa, v85, 384, 1);
      id v89 = objc_getProperty(selfa, v88, 376, 1);
      unsigned int v90 = [v87 updateNetworkAgent:v89];

      if (v90)
      {
        v91 = ne_log_obj();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          id v93 = objc_getProperty(selfa, v92, 376, 1);
          v94 = [v93 agentUUID];
          *(_DWORD *)v139 = 138412802;
          v140 = selfa;
          __int16 v141 = 1042;
          int v142 = 16;
          __int16 v143 = 2098;
          v144 = v94;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%@: Updated fallback relay network agent %{public,uuid_t}.16P", v139, 0x1Cu);
        }
      }
      else
      {
        v91 = ne_log_obj();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          id v120 = objc_getProperty(selfa, v105, 376, 1);
          v121 = [v120 agentUUID];
          *(_DWORD *)v139 = 138412802;
          v140 = selfa;
          __int16 v141 = 1042;
          int v142 = 16;
          __int16 v143 = 2098;
          v144 = v121;
          _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%@: Update failed for fallback relay network agent %{public,uuid_t}.16P", v139, 0x1Cu);
        }
      }
    }
    else
    {
      id v95 = objc_getProperty(selfa, v85, 384, 1);
      id v97 = objc_getProperty(selfa, v96, 376, 1);
      unsigned int v98 = [v95 registerNetworkAgent:v97];

      if (v98)
      {
        v91 = ne_log_obj();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          id v100 = objc_getProperty(selfa, v99, 376, 1);
          v101 = [v100 agentUUID];
          *(_DWORD *)v139 = 138412802;
          v140 = selfa;
          __int16 v141 = 1042;
          int v142 = 16;
          __int16 v143 = 2098;
          v144 = v101;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%@: Registered fallback relay network agent %{public,uuid_t}.16P", v139, 0x1Cu);
        }
      }
      else
      {
        v91 = ne_log_obj();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          id v103 = objc_getProperty(selfa, v102, 376, 1);
          v104 = [v103 agentUUID];
          *(_DWORD *)v139 = 138412802;
          v140 = selfa;
          __int16 v141 = 1042;
          int v142 = 16;
          __int16 v143 = 2098;
          v144 = v104;
          _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%@: Registration failed for fallback relay network agent %{public,uuid_t}.16P", v139, 0x1Cu);
        }
      }
    }

    v86 = selfa;
    goto LABEL_67;
  }
  v70 = ne_log_obj();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v145) = 138412290;
    *(void *)((char *)&v145 + 4) = selfa;
    _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%@ Invalid proxy hops, no consistent HTTP version supported", (uint8_t *)&v145, 0xCu);
  }

  objc_setProperty_atomic(selfa, v71, 0, 360);
  objc_setProperty_atomic(selfa, v72, 0, 368);
LABEL_19:
  sub_100078CA8(selfa, 1);
  id v26 = objc_getProperty(selfa, v25, 408, 1);
  if (v26)
  {
    uint64_t v28 = v26;
    BOOL v29 = objc_getProperty(selfa, v27, 360, 1) == 0;

    if (!v29)
    {
      [(NESMSession *)selfa setStatus:3];
      return;
    }
  }
LABEL_80:
  v122 = ne_log_obj();
  if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v138 = selfa;
    _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%@ relay is not ready, not moving to connected", buf, 0xCu);
  }
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 == 1)
  {
    block[7] = v3;
    block[8] = v4;
    id v6 = [(NESMSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007A998;
    block[3] = &unk_1000C6C60;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v11.receiver = self,
        v11.super_class = (Class)NESMRelaySession,
        [(NESMSession *)&v11 handleUpdateConfiguration:v4]))
  {
    v5 = [v4 relay];
    id v7 = v5;
    if (self)
    {
      objc_setProperty_atomic(self, v6, v5, 408);

      sub_10007AAC4(self, v8);
    }
    else
    {
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    SEL v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ handling stop for relay session", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)NESMRelaySession;
  [(NESMSession *)&v8 handleStopMessageWithReason:v3];
  id v6 = [(NESMSession *)self server];
  [v6 requestUninstallForSession:self];

  if (self) {
    objc_setProperty_atomic(self, v7, 0, 472);
  }
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ handling start for relay session", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)NESMRelaySession;
  [(NESMSession *)&v7 handleStartMessage:v4];

  sub_10007AAC4(self, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 424, 1);
  }
  else {
    id Property = 0;
  }
  id v14 = Property;
  if (v14 == v10)
  {
    unsigned int v15 = [v9 isEqualToString:@"bestAvailableNetworkDescription"];

    if (!v15) {
      goto LABEL_59;
    }
    id v17 = objc_alloc_init((Class)NEOnDemandRuleConnect);
    if (self) {
      id v18 = objc_getProperty(self, v16, 424, 1);
    }
    else {
      id v18 = 0;
    }
    id v55 = [v18 bestAvailableNetworkDescription];
    if (v55)
    {
      if (self) {
        id v20 = objc_getProperty(self, v19, 424, 1);
      }
      else {
        id v20 = 0;
      }
      id v21 = [v20 networkDescriptionArray];
      id v22 = [v21 indexOfObject:v55];

      if (self) {
        id v24 = objc_getProperty(self, v23, 408, 1);
      }
      else {
        id v24 = 0;
      }
      SEL v25 = [v24 onDemandRules];
      id v26 = [v25 count];

      if (v26 > v22)
      {
        if (self) {
          id v28 = objc_getProperty(self, v27, 408, 1);
        }
        else {
          id v28 = 0;
        }
        BOOL v29 = [v28 onDemandRules];
        uint64_t v30 = [v29 objectAtIndex:v22];

        id v17 = (id)v30;
      }
      id v31 = ne_log_obj();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        if ([v17 action] == (id)3)
        {
          id v36 = objc_alloc_init((Class)NSMutableArray);
          id v54 = v17;
          v37 = [v17 connectionRules];
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v38 = [v37 countByEnumeratingWithState:&v56 objects:v60 count:16];
          if (v38)
          {
            id v40 = v38;
            uint64_t v41 = *(void *)v57;
            do
            {
              for (i = 0; i != v40; i = (char *)i + 1)
              {
                if (*(void *)v57 != v41) {
                  objc_enumerationMutation(v37);
                }
                SEL v43 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                if ([v43 action] == (id)2)
                {
                  SEL v44 = [v43 matchDomains];
                  [v36 addObjectsFromArray:v44];
                }
              }
              id v40 = [v37 countByEnumeratingWithState:&v56 objects:v60 count:16];
            }
            while (v40);
          }
          if (self) {
            id v45 = objc_getProperty(self, v39, 432, 1);
          }
          else {
            id v45 = 0;
          }
          unsigned int v46 = [v36 isEqual:v45];
          int v48 = v46 ^ 1;
          if (self && (v46 & 1) == 0) {
            objc_setProperty_atomic(self, v47, v36, 432);
          }

          id v17 = v54;
        }
        else if (self)
        {
          int v48 = objc_getProperty(self, v35, 432, 1) != 0;
          objc_setProperty_atomic(self, v49, 0, 432);
        }
        else
        {
          int v48 = 0;
        }
        if ([(NESMSession *)self status] != 1
          && ([v17 action] == (id)2 || objc_msgSend(v17, "action") == (id)4))
        {
          SEL v50 = [(NESMSession *)self server];
          [v50 requestUninstallForSession:self];
        }
        else
        {
          if ([(NESMSession *)self status] == 3
            || [v17 action] != (id)1 && objc_msgSend(v17, "action") != (id)3)
          {
            if ([(NESMSession *)self status] == 3) {
              int v51 = v48;
            }
            else {
              int v51 = 0;
            }
            if (v51 == 1)
            {
              objc_super v52 = self;
              char v53 = 0;
            }
            else
            {
              if (!self || !self->_configurationUpdatePending) {
                goto LABEL_58;
              }
              self->_configurationUpdatePending = 0;
              objc_super v52 = self;
              char v53 = 1;
            }
            sub_100078CA8(v52, v53);
LABEL_58:

            goto LABEL_59;
          }
          SEL v50 = [(NESMSession *)self server];
          [v50 requestInstallForSession:self withParentSession:0 exclusive:0];
        }

        goto LABEL_58;
      }
      *(_DWORD *)buf = 138412546;
      v62 = self;
      __int16 v63 = 2112;
      id v64 = v17;
      uint64_t v32 = "%@ Matched Relay On Demand rule %@";
      SEL v33 = v31;
      uint32_t v34 = 22;
    }
    else
    {
      id v31 = ne_log_obj();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      v62 = self;
      uint64_t v32 = "%@ Matched no Relay On Demand rule";
      SEL v33 = v31;
      uint32_t v34 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
    goto LABEL_22;
  }

LABEL_59:
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  if (a3 == 3) {
    return !sub_10007945C(self, a2);
  }
  else {
    return a3 < 2;
  }
}

- (int)type
{
  return 9;
}

- (NESMRelaySession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NESMRelaySession;
  objc_super v7 = [(NESMSession *)&v18 initWithConfiguration:v6 andServer:a4];
  if (!v7)
  {
LABEL_6:
    id v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ initialized relay session", buf, 0xCu);
    }

    unsigned int v15 = v7;
    goto LABEL_12;
  }
  objc_super v8 = [v6 relay];

  if (v8)
  {
    uint64_t v9 = [v6 relay];
    relayConfig = v7->_relayConfig;
    v7->_relayConfig = (NERelayConfiguration *)v9;

    objc_super v11 = [NESMPolicySession alloc];
    id v12 = [v6 identifier];
    id v13 = [v6 grade];
    if (v11) {
      objc_super v11 = (NESMPolicySession *)sub_100031564((id *)&v11->super.isa, v12, 9, v13, (void *)2, (void *)1);
    }
    [(NESMSession *)v7 setPolicySession:v11];

    sub_10007FEB0(v7);
    goto LABEL_6;
  }
  int v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ relay configuration is nil", buf, 0xCu);
  }

  unsigned int v15 = 0;
LABEL_12:

  return v15;
}

+ (BOOL)hasRequiredFrameworks
{
  return 1;
}

@end