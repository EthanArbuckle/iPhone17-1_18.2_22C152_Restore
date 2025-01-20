@interface AgentController
+ (id)sharedController;
- (AgentController)init;
- (BOOL)addPolicyToFloatingAgent:(id)a3 domain:(id)a4 agentUUIDToUse:(id)a5 policyType:(int64_t)a6 useControlPolicySession:(BOOL)a7;
- (BOOL)destroyFloatingAgent:(id)a3;
- (BOOL)getIntValue:(void *)a3 valuePtr:(int *)a4;
- (BOOL)initializeController;
- (BOOL)isControllerReady;
- (BOOL)isGlobalProxy:(__CFDictionary *)a3;
- (BOOL)isResolverMulticast:(id *)a3;
- (BOOL)isResolverOnion:(id *)a3;
- (BOOL)isResolverPrivate:(id *)a3;
- (BOOL)isTCPConverterProxyEnabled:(__CFDictionary *)a3;
- (BOOL)publishToAgent:(id)a3;
- (BOOL)registerAgent:(id)a3;
- (BOOL)spawnFloatingAgent:(Class)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 publishData:(id)a7;
- (BOOL)spawnMappedFloatingAgent:(id)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 updateData:(id)a7;
- (BOOL)unregisterAgent:(id)a3;
- (NEPolicySession)controlPolicySession;
- (NEPolicySession)policySession;
- (NSMutableDictionary)floatingDNSAgentList;
- (NSMutableDictionary)floatingProxyAgentList;
- (NSMutableDictionary)floatingProxyAgentList_TCPConverter;
- (NSMutableDictionary)policyDB;
- (OS_dispatch_queue)controllerQueue;
- (const)copyConfigAgentData:(id)a3 uuid:(unsigned __int8)a4[16] length:(unint64_t *)a5;
- (const)copyDNSAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4;
- (const)copyProxyAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4;
- (id)createPolicySession;
- (id)dataForProxyArray:(__CFArray *)a3;
- (id)dataForProxyDictionary:(__CFDictionary *)a3;
- (id)dataForResolver:(id *)a3;
- (id)dataLengthSanityCheck:(id)a3;
- (id)getAgentList:(id)a3 agentType:(unint64_t)a4 agentSubType:(unint64_t)a5;
- (id)getAgentWithSameDataAndSubType:(id)a3 data:(id)a4 subType:(unint64_t)a5;
- (id)getDNSDataFromCurrentConfig:(id *)a3 domain:(id)a4;
- (id)getProxyDataFromCurrentConfig:(__CFDictionary *)a3 domain:(id)a4;
- (id)sanitizeEntity:(id)a3;
- (id)sanitizeInterfaceName:(id)a3;
- (int)countProxyEntriesEnabled:(__CFDictionary *)a3;
- (int)entityInstanceNumber:(id)a3;
- (resolverList)copyResolverList:(id *)a3;
- (void)applyPolicies;
- (void)cleanConflictingAgentsFromList:(id)a3 new_list:(id)a4 agentDictionary:(id)a5;
- (void)deleteAgentList:(id)a3 list:(id)a4;
- (void)freeResolverList:(resolverList *)a3;
- (void)processDNSChanges;
- (void)processDNSResolvers:(id *)a3;
- (void)processDefaultProxyChanges:(__CFDictionary *)a3;
- (void)processOnionResolver:(id *)a3;
- (void)processProxyChanges;
- (void)processScopedDNSResolvers:(id *)a3;
- (void)processScopedProxyChanges:(__CFDictionary *)a3;
- (void)processServiceSpecificDNSResolvers:(id *)a3;
- (void)processServiceSpecificProxyChanges:(__CFDictionary *)a3;
- (void)processSupplementalDNSResolvers:(id *)a3;
- (void)processSupplementalProxyChanges:(__CFDictionary *)a3;
- (void)setControlPolicySession:(id)a3;
- (void)setControllerQueue:(id)a3;
- (void)setFloatingDNSAgentList:(id)a3;
- (void)setFloatingProxyAgentList:(id)a3;
- (void)setFloatingProxyAgentList_TCPConverter:(id)a3;
- (void)setPolicyDB:(id)a3;
- (void)setPolicySession:(id)a3;
@end

@implementation AgentController

+ (id)sharedController
{
  if (qword_10007DEA0 != -1) {
    dispatch_once(&qword_10007DEA0, &stru_100076FC8);
  }
  id v2 = (id)qword_10007DE98;
  objc_sync_enter(v2);
  if (([(id)qword_10007DE98 isControllerReady] & 1) != 0
    || ([(id)qword_10007DE98 initializeController] & 1) != 0)
  {
    objc_sync_exit(v2);

    id v3 = (id)qword_10007DE98;
  }
  else
  {
    objc_sync_exit(v2);

    id v3 = 0;
  }

  return v3;
}

- (AgentController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AgentController;
  id v2 = [(AgentController *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(AgentController *)v2 initializeController];
  }
  return v3;
}

- (BOOL)initializeController
{
  id v3 = [(AgentController *)self policySession];

  if (v3
    || ([(AgentController *)self createPolicySession],
        v4 = objc_claimAutoreleasedReturnValue(),
        [(AgentController *)self setPolicySession:v4],
        v4,
        [(AgentController *)self policySession],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(AgentController *)self floatingProxyAgentList];

    if (v6
      || (+[NSMutableDictionary dictionary],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(AgentController *)self setFloatingProxyAgentList:v7],
          v7,
          [(AgentController *)self floatingProxyAgentList],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      v9 = [(AgentController *)self floatingProxyAgentList_TCPConverter];

      if (v9
        || (+[NSMutableDictionary dictionary],
            v10 = objc_claimAutoreleasedReturnValue(),
            [(AgentController *)self setFloatingProxyAgentList_TCPConverter:v10], v10, [(AgentController *)self floatingProxyAgentList_TCPConverter], v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
      {
        v12 = [(AgentController *)self floatingDNSAgentList];

        if (v12
          || (+[NSMutableDictionary dictionary],
              v13 = objc_claimAutoreleasedReturnValue(),
              [(AgentController *)self setFloatingDNSAgentList:v13],
              v13,
              [(AgentController *)self floatingDNSAgentList],
              v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              v14))
        {
          v15 = [(AgentController *)self policyDB];

          if (v15
            || (+[NSMutableDictionary dictionary],
                v16 = objc_claimAutoreleasedReturnValue(),
                [(AgentController *)self setPolicyDB:v16],
                v16,
                [(AgentController *)self policyDB],
                v17 = objc_claimAutoreleasedReturnValue(),
                v17,
                v17))
          {
            v18 = [(AgentController *)self controllerQueue];

            if (v18) {
              return 1;
            }
            dispatch_queue_t v19 = dispatch_queue_create("IPMonitorAgentControllerQueue", 0);
            [(AgentController *)self setControllerQueue:v19];

            v20 = [(AgentController *)self controllerQueue];

            if (v20) {
              return 1;
            }
          }
        }
      }
    }
  }
  v22 = sub_10000620C();
  os_log_type_t v23 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    memset(v25, 0, sizeof(v25));
    os_log_type_enabled(v22, v23);
    v24 = (_OWORD *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v24 != v25) {
      free(v24);
    }
  }

  _SC_crash();
  return 0;
}

- (id)createPolicySession
{
  id v2 = objc_alloc_init((Class)NEPolicySession);

  return v2;
}

- (BOOL)isControllerReady
{
  id v3 = [(AgentController *)self policySession];
  if (v3)
  {
    v4 = [(AgentController *)self floatingProxyAgentList];
    if (v4)
    {
      objc_super v5 = [(AgentController *)self floatingProxyAgentList_TCPConverter];
      if (v5)
      {
        v6 = [(AgentController *)self floatingDNSAgentList];
        if (v6)
        {
          v7 = [(AgentController *)self policyDB];
          if (v7)
          {
            v8 = [(AgentController *)self controllerQueue];
            BOOL v9 = v8 != 0;
          }
          else
          {
            BOOL v9 = 0;
          }
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)dataForProxyArray:(__CFArray *)a3
{
  _SCSerialize();

  return 0;
}

- (id)dataForProxyDictionary:(__CFDictionary *)a3
{
  if (a3)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3);
    CFDictionaryRemoveValue(MutableCopy, kSCPropNetProxiesSupplementalMatchDomain);
    ProxyAgentData = (void *)SCNetworkProxiesCreateProxyAgentData();
    CFRelease(MutableCopy);
  }
  else
  {
    objc_super v5 = sub_10000620C();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v9, 0, sizeof(v9));
      os_log_type_enabled(v5, v6);
      v7 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v7 != v9) {
        free(v7);
      }
    }

    ProxyAgentData = 0;
  }

  return ProxyAgentData;
}

- (id)getProxyDataFromCurrentConfig:(__CFDictionary *)a3 domain:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (!a3 || !v6)
  {
    v16 = sub_10000620C();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v21, 0, sizeof(v21));
      os_log_type_enabled(v16, v17);
      v18 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v18 != v21) {
        free(v18);
      }
    }

    goto LABEL_14;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a3, kSCPropNetProxiesSupplemental);
  if (!Value || (CFArrayRef v9 = Value, Count = CFArrayGetCount(Value), Count < 1))
  {
LABEL_14:
    dispatch_queue_t v19 = 0;
    goto LABEL_15;
  }
  CFIndex v11 = Count;
  CFIndex v12 = 0;
  v13 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, v12);
    v15 = CFDictionaryGetValue(ValueAtIndex, v13);
    if (v15)
    {
      if (CFEqual(v15, v7)) {
        break;
      }
    }
    if (v11 == ++v12) {
      goto LABEL_14;
    }
  }
  dispatch_queue_t v19 = [(AgentController *)self dataForProxyDictionary:ValueAtIndex];
LABEL_15:

  return v19;
}

- (BOOL)getIntValue:(void *)a3 valuePtr:(int *)a4
{
  BOOL result = a3
        && (CFTypeID v6 = CFGetTypeID(a3), v6 == CFNumberGetTypeID())
        && CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, a4) != 0;
  return result;
}

- (int)countProxyEntriesEnabled:(__CFDictionary *)a3
{
  v13[0] = kSCPropNetProxiesHTTPEnable;
  v13[1] = kSCPropNetProxiesHTTPSEnable;
  v13[2] = kSCPropNetProxiesProxyAutoConfigEnable;
  v13[3] = kSCPropNetProxiesFTPEnable;
  v13[4] = kSCPropNetProxiesGopherEnable;
  v13[5] = kSCPropNetProxiesRTSPEnable;
  v13[6] = kSCPropNetProxiesSOCKSEnable;
  v13[7] = kSCPropNetProxiesTransportConverterEnable;
  v13[8] = kSCPropNetProxiesProxyAutoDiscoveryEnable;
  if (a3)
  {
    uint64_t v5 = 0;
    while (1)
    {
      LODWORD(v12[0]) = 0;
      unsigned int v6 = [(AgentController *)self getIntValue:CFDictionaryGetValue(a3, (const void *)v13[v5]) valuePtr:v12];
      int result = v12[0];
      if (v6 && SLODWORD(v12[0]) >= 1) {
        break;
      }
      if (++v5 == 9) {
        return 0;
      }
    }
  }
  else
  {
    CFArrayRef v9 = sub_10000620C();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v12, 0, sizeof(v12));
      os_log_type_enabled(v9, v10);
      CFIndex v11 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v11 != v12) {
        free(v11);
      }
    }

    return 0;
  }
  return result;
}

- (void)processSupplementalProxyChanges:(__CFDictionary *)a3
{
  if (a3)
  {
    uint64_t v5 = [(AgentController *)self floatingProxyAgentList];
    unsigned int v6 = [(AgentController *)self getAgentList:v5 agentType:1 agentSubType:2];

    id v89 = [objc_alloc((Class)NSCountedSet) initWithCapacity:0];
    v7 = +[NSMutableArray array];
    v92 = +[NSMutableArray array];
    type = a3;
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a3, kSCPropNetProxiesSupplemental);
    CFArrayRef theArray = Value;
    if (Value) {
      CFIndex Count = CFArrayGetCount(Value);
    }
    else {
      CFIndex Count = 0;
    }
    +[NSMutableArray array];
    v94 = v7;
    id v95 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v91 = Count;
    if (Count >= 1)
    {
      CFIndex v18 = 0;
      dispatch_queue_t v19 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v18);
        v21 = (void *)CFDictionaryGetValue(ValueAtIndex, v19);
        if (v21)
        {
          v22 = v21;
          if ([(AgentController *)self countProxyEntriesEnabled:ValueAtIndex])
          {
            [v7 addObject:v22];
          }
          else
          {
            os_log_type_t v23 = sub_10000620C();
            os_log_type_t v24 = _SC_syslog_os_log_mapping();
            if (__SC_log_enabled())
            {
              long long v137 = 0u;
              long long v136 = 0u;
              long long v135 = 0u;
              long long v134 = 0u;
              long long v133 = 0u;
              long long v132 = 0u;
              long long v131 = 0u;
              long long v130 = 0u;
              long long v129 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              long long v125 = 0u;
              long long v126 = 0u;
              long long v124 = 0u;
              long long v122 = 0u;
              long long v123 = 0u;
              os_log_type_enabled(v23, v24);
              int v120 = 138412290;
              v121 = v22;
              LODWORD(v85) = 12;
              v83 = &v120;
              v25 = (long long *)_os_log_send_and_compose_impl();
              __SC_log_send2();
              if (v25 != &v122) {
                free(v25);
              }
              v7 = v94;
            }
          }
        }
        ++v18;
      }
      while (v91 != v18);
    }
    v26 = [(AgentController *)self floatingProxyAgentList];
    [(AgentController *)self cleanConflictingAgentsFromList:v6 new_list:v7 agentDictionary:v26];

    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v27 = v6;
    id v28 = [v27 countByEnumeratingWithState:&v116 objects:v115 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v117;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v117 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v116 + 1) + 8 * i);
          if (([v7 containsObject:v32] & 1) == 0)
          {
            v33 = [(AgentController *)self floatingProxyAgentList];
            v34 = [v33 objectForKey:v32];

            [(AgentController *)self destroyFloatingAgent:v34];
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v116 objects:v115 count:16];
      }
      while (v29);
    }

    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id obj = v27;
    id v35 = [obj countByEnumeratingWithState:&v111 objects:v110 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v112;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v112 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = *(void *)(*((void *)&v111 + 1) + 8 * (void)j);
          v40 = [(AgentController *)self floatingProxyAgentList];
          v41 = [v40 objectForKey:v39];

          if (v41)
          {
            v42 = [v41 getAgentMapping];
            v43 = v42;
            if (v42)
            {
              v44 = [v42 getAssociatedEntity];
              v45 = [(AgentController *)self getProxyDataFromCurrentConfig:type domain:v44];

              if (!v45
                || ([v41 getAgentData],
                    v46 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v47 = [v46 isEqual:v45],
                    v46,
                    (v47 & 1) == 0))
              {
                [v95 addObject:v41];

LABEL_42:
                goto LABEL_43;
              }
            }
            else
            {
              v48 = [v41 getAssociatedEntity];
              v45 = [(AgentController *)self getProxyDataFromCurrentConfig:type domain:v48];

              v49 = [v41 getAgentData];
              unsigned __int8 v50 = [v49 isEqual:v45];

              if ((v50 & 1) == 0)
              {
                [v41 updateAgentData:v45];
                [v92 addObject:v41];
              }
            }

            [v94 removeObject:v39];
            goto LABEL_42;
          }
LABEL_43:
        }
        id v36 = [obj countByEnumeratingWithState:&v111 objects:v110 count:16];
      }
      while (v36);
    }

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v17 = v95;
    id v51 = [v17 countByEnumeratingWithState:&v106 objects:v105 count:16];
    id v96 = v17;
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v107;
      do
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(void *)v107 != v53) {
            objc_enumerationMutation(v96);
          }
          v55 = *(void **)(*((void *)&v106 + 1) + 8 * (void)k);
          v56 = sub_10000620C();
          os_log_type_t v57 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v137 = 0u;
            long long v136 = 0u;
            long long v135 = 0u;
            long long v134 = 0u;
            long long v133 = 0u;
            long long v132 = 0u;
            long long v131 = 0u;
            long long v130 = 0u;
            long long v129 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v125 = 0u;
            long long v126 = 0u;
            long long v124 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            os_log_type_enabled(v56, v57);
            v58 = v56;
            v59 = [v55 getAgentName];
            int v120 = 138412290;
            v121 = v59;
            LODWORD(v86) = 12;
            v84 = &v120;
            v60 = (long long *)_os_log_send_and_compose_impl();

            __SC_log_send2();
            if (v60 != &v122) {
              free(v60);
            }
          }

          [(AgentController *)self destroyFloatingAgent:v55];
        }
        id v17 = v96;
        id v52 = [v96 countByEnumeratingWithState:&v106 objects:v105 count:16];
      }
      while (v52);
    }

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v13 = v92;
    id v61 = [v13 countByEnumeratingWithState:&v101 objects:v100 count:16];
    v15 = v94;
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v102;
      do
      {
        for (m = 0; m != v62; m = (char *)m + 1)
        {
          if (*(void *)v102 != v63) {
            objc_enumerationMutation(v13);
          }
          -[AgentController publishToAgent:](self, "publishToAgent:", *(void *)(*((void *)&v101 + 1) + 8 * (void)m), v84, v86);
        }
        id v62 = [v13 countByEnumeratingWithState:&v101 objects:v100 count:16];
      }
      while (v62);
    }

    if (v91 < 1)
    {
      v16 = v89;
      v14 = obj;
    }
    else
    {
      CFIndex v65 = 0;
      v66 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
      v16 = v89;
      v93 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
      do
      {
        CFDictionaryRef v67 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v65);
        v68 = CFDictionaryGetValue(v67, v66);
        if (v68)
        {
          v69 = v68;
          id v70 = [v15 indexOfObject:v68];
          if (v70 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v71 = v70;
            v72 = (char *)[v16 countForObject:v69];
            if (v72)
            {
              v73 = +[NSString stringWithFormat:@"%@ #%lu", v69, v72 + 1];
              v74 = [(AgentController *)self dataForProxyDictionary:v67];
              if ([(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v73 agentSubType:2 addPolicyOfType:6 publishData:v74])
              {
                v75 = [(AgentController *)self floatingProxyAgentList];
                v88 = v73;
                v76 = [v75 objectForKey:v73];

                v77 = sub_10000620C();
                os_log_type_t typea = _SC_syslog_os_log_mapping();
                if (__SC_log_enabled())
                {
                  long long v137 = 0u;
                  long long v136 = 0u;
                  long long v135 = 0u;
                  long long v134 = 0u;
                  long long v133 = 0u;
                  long long v132 = 0u;
                  long long v131 = 0u;
                  long long v130 = 0u;
                  long long v129 = 0u;
                  long long v127 = 0u;
                  long long v128 = 0u;
                  long long v125 = 0u;
                  long long v126 = 0u;
                  long long v124 = 0u;
                  long long v122 = 0u;
                  long long v123 = 0u;
                  os_log_type_enabled(v77, typea);
                  v87 = v77;
                  v78 = v77;
                  v79 = [v76 getAgentName];
                  int v120 = 138412290;
                  v121 = v79;
                  LODWORD(v86) = 12;
                  v84 = &v120;
                  v80 = (long long *)_os_log_send_and_compose_impl();

                  __SC_log_send2();
                  if (v80 != &v122) {
                    free(v80);
                  }
                  v66 = v93;
                  v15 = v94;
                  v77 = v87;
                }

                v73 = v88;
                v16 = v89;
              }
            }
            else
            {
              v74 = [(AgentController *)self dataForProxyDictionary:v67];
              v81 = [(AgentController *)self floatingProxyAgentList];
              v82 = [(AgentController *)self getAgentWithSameDataAndSubType:v81 data:v74 subType:2];

              if (v82)
              {
                [(AgentController *)self spawnMappedFloatingAgent:v82 entity:v69 agentSubType:2 addPolicyOfType:6 updateData:v74];
              }
              else
              {
                [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v69 agentSubType:2 addPolicyOfType:6 publishData:v74];
              }
              v16 = v89;
              v66 = v93;
            }
            [v15 removeObjectAtIndex:v71, v84, v86];
            [v16 addObject:v69];
          }
        }
        ++v65;
      }
      while (v91 != v65);
      id v17 = v96;
      v14 = obj;
    }
  }
  else
  {
    os_log_type_t v10 = sub_10000620C();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v137 = 0u;
      long long v136 = 0u;
      long long v135 = 0u;
      long long v134 = 0u;
      long long v133 = 0u;
      long long v132 = 0u;
      long long v131 = 0u;
      long long v130 = 0u;
      long long v129 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v122 = 0u;
      os_log_type_enabled(v10, v11);
      LOWORD(v120) = 0;
      CFIndex v12 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v12 != &v122) {
        free(v12);
      }
    }

    id v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    id v17 = 0;
  }
}

- (void)processScopedProxyChanges:(__CFDictionary *)a3
{
  uint64_t v5 = [(AgentController *)self floatingProxyAgentList];
  v26 = [(AgentController *)self getAgentList:v5 agentType:1 agentSubType:1];

  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a3, kSCPropNetProxiesScoped);
  if (Value)
  {
    CFDictionaryRef v7 = Value;
    CFIndex Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v9 = Count;
      os_log_type_t v10 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(v7, v10, 0);
      uint64_t v11 = 0;
      while (1)
      {
        id v12 = (id)v10[v11];
        id v13 = +[NSString stringWithFormat:@"%s%@", "@", v12];
        if ([(AgentController *)self countProxyEntriesEnabled:CFDictionaryGetValue(v7, v12)])
        {
          id v14 = [v26 indexOfObject:v13];
          uint64_t v15 = SCNetworkProxiesCopyMatching();
          if (v15)
          {
            v16 = (const void *)v15;
            id v17 = [(AgentController *)self dataForProxyArray:v15];
            CFRelease(v16);
          }
          else
          {
            id v17 = 0;
          }
          if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            [v26 removeObjectAtIndex:v14];
            v22 = [(AgentController *)self floatingProxyAgentList];
            v21 = [v22 objectForKey:v13];

            if (v21)
            {
              [v21 updateAgentData:v17];
              if ([v21 shouldUpdateAgent]) {
                [(AgentController *)self publishToAgent:v21];
              }
            }
            goto LABEL_15;
          }
          [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v13 agentSubType:1 addPolicyOfType:8 publishData:v17];
        }
        else
        {
          CFIndex v18 = sub_10000620C();
          os_log_type_t v19 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            memset(v29, 0, sizeof(v29));
            os_log_type_enabled(v18, v19);
            int v27 = 138412290;
            id v28 = v12;
            LODWORD(v25) = 12;
            os_log_type_t v24 = &v27;
            v20 = (_OWORD *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v20 != v29) {
              free(v20);
            }
          }

          id v17 = 0;
        }
        v21 = 0;
LABEL_15:

        if (v9 == ++v11)
        {
          free(v10);
          break;
        }
      }
    }
  }
  os_log_type_t v23 = [(AgentController *)self floatingProxyAgentList];
  [(AgentController *)self deleteAgentList:v23 list:v26];
}

- (void)processServiceSpecificProxyChanges:(__CFDictionary *)a3
{
  uint64_t v5 = [(AgentController *)self floatingProxyAgentList];
  unsigned int v6 = [(AgentController *)self getAgentList:v5 agentType:1 agentSubType:6];

  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a3, kSCPropNetProxiesServices);
  if (Value)
  {
    CFDictionaryRef v8 = Value;
    CFIndex Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      uint64_t v11 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(v8, v11, 0);
      uint64_t v12 = 0;
      v26 = v6;
      while (1)
      {
        id v13 = (id)v11[v12];
        id v14 = +[NSString stringWithFormat:@"%s%@", "@", v13];
        if ([(AgentController *)self countProxyEntriesEnabled:CFDictionaryGetValue(v8, v13)])
        {
          uint64_t v15 = CFDictionaryGetValue(v8, v13);
          if (v15)
          {
            int v27 = v15;
            v16 = [(AgentController *)self dataForProxyArray:+[NSArray arrayWithObjects:&v27 count:1]];
          }
          else
          {
            v16 = 0;
          }
          id v20 = [v6 indexOfObject:v14];
          if (v20 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            [v6 removeObjectAtIndex:v20];
            v22 = [(AgentController *)self floatingProxyAgentList];
            v21 = [v22 objectForKey:v14];

            if (v21)
            {
              [v21 updateAgentData:v16];
              if ([v21 shouldUpdateAgent]) {
                [(AgentController *)self publishToAgent:v21];
              }
            }
            unsigned int v6 = v26;
            goto LABEL_20;
          }
          [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v14 agentSubType:6 addPolicyOfType:-1 publishData:v16];
        }
        else
        {
          id v17 = sub_10000620C();
          os_log_type_t v18 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            memset(v30, 0, sizeof(v30));
            os_log_type_enabled(v17, v18);
            int v28 = 138412290;
            id v29 = v13;
            LODWORD(v25) = 12;
            os_log_type_t v24 = &v28;
            os_log_type_t v19 = (_OWORD *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v19 != v30) {
              free(v19);
            }
            unsigned int v6 = v26;
          }

          v16 = 0;
        }
        v21 = 0;
LABEL_20:

        if (v10 == ++v12)
        {
          free(v11);
          break;
        }
      }
    }
  }
  os_log_type_t v23 = [(AgentController *)self floatingProxyAgentList];
  [(AgentController *)self deleteAgentList:v23 list:v6];
}

- (BOOL)isGlobalProxy:(__CFDictionary *)a3
{
  return CFDictionaryContainsKey(a3, kSCPropNetProxiesBypassAllowed) != 0;
}

- (BOOL)isTCPConverterProxyEnabled:(__CFDictionary *)a3
{
  int valuePtr = 0;
  value = 0;
  BOOL result = 0;
  if (CFDictionaryGetValueIfPresent(a3, kSCPropNetProxiesTransportConverterEnable, (const void **)&value))
  {
    id v3 = value;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (v3)
    {
      if (CFGetTypeID(v3) == TypeID && CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr) && valuePtr) {
        return 1;
      }
    }
  }
  return result;
}

- (void)processDefaultProxyChanges:(__CFDictionary *)a3
{
  values = CFDictionaryCreateMutableCopy(0, 0, a3);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)values, kSCPropNetProxiesScoped);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)values, kSCPropNetProxiesServices);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)values, kSCPropNetProxiesSupplemental);
  CFArrayRef v4 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  if (CFArrayGetCount(v4) >= 1)
  {
    if ([(AgentController *)self countProxyEntriesEnabled:values])
    {
      CFRelease(values);
      uint64_t v5 = [(AgentController *)self dataForProxyArray:v4];
      unsigned int v6 = [(AgentController *)self floatingProxyAgentList];
      CFDictionaryRef v7 = [v6 objectForKey:@"_defaultProxy"];

      if (v7)
      {
        CFDictionaryRef v8 = [v7 getAgentData];
        unsigned __int8 v9 = [v5 isEqual:v8];

        if (v9) {
          goto LABEL_23;
        }
        [(AgentController *)self destroyFloatingAgent:v7];
      }
      unsigned int v10 = [(AgentController *)self isGlobalProxy:values];
      if (v10)
      {
        uint64_t v11 = sub_10000620C();
        os_log_type_t v12 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v34 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v27 = 0u;
          os_log_type_enabled(v11, v12);
          __int16 v26 = 0;
          id v13 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v13 != &v27) {
            free(v13);
          }
        }

        uint64_t v14 = 7;
        uint64_t v15 = 7;
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v14 = 3;
      }
      if ((v10 & [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:@"_defaultProxy" agentSubType:v14 addPolicyOfType:v15 publishData:v5]) == 1&& [(AgentController *)self isTCPConverterProxyEnabled:values])
      {
        v21 = [(AgentController *)self floatingProxyAgentList];
        id v20 = [v21 objectForKey:@"_defaultProxy"];

        if (v20)
        {
          v22 = [v20 getAgentData];
          unsigned int v23 = [v5 isEqual:v22];

          if (v23)
          {
            os_log_type_t v24 = [(AgentController *)self floatingProxyAgentList_TCPConverter];
            [v24 setObject:v20 forKey:@"_defaultProxy"];

            sub_10004D708(1);
          }
        }
        goto LABEL_24;
      }
LABEL_23:
      id v20 = v7;
LABEL_24:

      goto LABEL_25;
    }
    v16 = sub_10000620C();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v27 = 0u;
      os_log_type_enabled(v16, v17);
      __int16 v26 = 0;
      os_log_type_t v18 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v18 != &v27) {
        free(v18);
      }
    }
  }
  CFRelease(values);
  os_log_type_t v19 = [(AgentController *)self floatingProxyAgentList];
  id v20 = [v19 objectForKey:@"_defaultProxy"];

  if (v20) {
    [(AgentController *)self destroyFloatingAgent:v20];
  }
LABEL_25:

  CFRelease(v4);
}

- (void)applyPolicies
{
  uint64_t v3 = [(AgentController *)self controlPolicySession];
  if (v3)
  {
    CFArrayRef v4 = (void *)v3;
    uint64_t v5 = [(AgentController *)self controlPolicySession];
    unsigned __int8 v6 = [v5 apply];

    if ((v6 & 1) == 0)
    {
      CFDictionaryRef v7 = sub_10000620C();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        os_log_type_enabled(v7, v8);
        __int16 v19 = 0;
        LODWORD(v18) = 2;
        os_log_type_t v17 = &v19;
        unsigned __int8 v9 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v9 != &v20) {
          free(v9);
        }
      }
    }
  }
  uint64_t v10 = [(AgentController *)self policySession];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    os_log_type_t v12 = [(AgentController *)self policySession];
    unsigned __int8 v13 = [v12 apply];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = sub_10000620C();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        os_log_type_enabled(v14, v15);
        __int16 v19 = 0;
        v16 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v16 != &v20) {
          free(v16);
        }
      }
    }
  }
}

- (void)processProxyChanges
{
  uint64_t v3 = SCDynamicStoreCopyProxiesWithOptions();
  if (v3)
  {
    CFArrayRef v4 = (const void *)v3;
    [(AgentController *)self processDefaultProxyChanges:v3];
    [(AgentController *)self processScopedProxyChanges:v4];
    [(AgentController *)self processSupplementalProxyChanges:v4];
    [(AgentController *)self processServiceSpecificProxyChanges:v4];
    [(AgentController *)self applyPolicies];
    CFRelease(v4);
  }
  else
  {
    uint64_t v5 = sub_10000620C();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v24, 0, sizeof(v24));
      os_log_type_enabled(v5, v6);
      __int16 v18 = 0;
      LODWORD(v17) = 2;
      v16 = &v18;
      CFDictionaryRef v7 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v7 != v24) {
        free(v7);
      }
    }

    os_log_type_t v8 = [(AgentController *)self floatingProxyAgentList];
    id v9 = [v8 copy];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          os_log_type_t v15 = [v10 objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * i), v16, v17];
          [(AgentController *)self destroyFloatingAgent:v15];
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
      }
      while (v12);

      [(AgentController *)self applyPolicies];
    }
    else
    {
    }
  }
}

- (void)freeResolverList:(resolverList *)a3
{
  if (a3)
  {
    if (a3->var0) {
      free(a3->var0);
    }
    var2 = a3->var2;
    if (var2) {
      free(var2);
    }
    var4 = a3->var4;
    if (var4) {
      free(var4);
    }
    free(a3);
  }
}

- (resolverList)copyResolverList:(id *)a3
{
  if (a3->var0 < 1 || !*(void *)(&a3->var0 + 1)) {
    return 0;
  }
  uint64_t v5 = (resolverList *)malloc_type_calloc(1uLL, 0x30uLL, 0x1080040C09FF9A2uLL);
  if (a3->var0 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(&a3->var0 + 1) + 8 * v6);
      unsigned __int8 v8 = [(AgentController *)self isResolverMulticast:v7];
      p_unsigned int var3 = &v5->var3;
      if ((v8 & 1) != 0
        || (unsigned __int8 v10 = [(AgentController *)self isResolverPrivate:v7],
            p_unsigned int var3 = &v5->var5,
            (v10 & 1) != 0)
        || !*(void *)v7 && (p_unsigned int var3 = &v5->var1, *(int *)(v7 + 8) >= 1))
      {
        ++*p_var3;
      }
      ++v6;
    }
    while (v6 < a3->var0);
  }
  id v11 = sub_10000620C();
  os_log_type_t v12 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    memset(v35, 0, sizeof(v35));
    os_log_type_enabled(v11, v12);
    unsigned int var1 = v5->var1;
    unsigned int var3 = v5->var3;
    unsigned int var5 = v5->var5;
    v30[0] = 67109632;
    v30[1] = var1;
    __int16 v31 = 1024;
    unsigned int v32 = var3;
    __int16 v33 = 1024;
    unsigned int v34 = var5;
    LODWORD(v29) = 20;
    long long v28 = v30;
    v16 = (_OWORD *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v16 != v35) {
      free(v16);
    }
  }

  size_t v17 = v5->var1;
  if (v17) {
    v5->var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_calloc(v17, 8uLL, 0x2004093837F09uLL);
  }
  size_t v18 = v5->var3;
  if (v18) {
    v5->var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_calloc(v18, 8uLL, 0x2004093837F09uLL);
  }
  size_t v19 = v5->var5;
  if (v19) {
    v5->var4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_calloc(v19, 8uLL, 0x2004093837F09uLL);
  }
  if (a3->var0 >= 1)
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0;
    unint64_t v22 = 0;
    unint64_t v23 = 0;
    do
    {
      uint64_t v24 = *(void *)(*(void *)(&a3->var0 + 1) + 8 * v20);
      if (-[AgentController isResolverMulticast:](self, "isResolverMulticast:", v24, v28, v29) && v21 < v5->var3)
      {
        unint64_t v25 = v21++;
        p_var2 = (resolverList *)&v5->var2;
      }
      else if ([(AgentController *)self isResolverPrivate:v24] && v22 < v5->var5)
      {
        unint64_t v25 = v22++;
        p_var2 = (resolverList *)&v5->var4;
      }
      else
      {
        if (*(void *)v24 || *(int *)(v24 + 8) < 1 || v23 >= v5->var1) {
          goto LABEL_36;
        }
        unint64_t v25 = v23++;
        p_var2 = v5;
      }
      p_var2->var0[v25] = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v24;
LABEL_36:
      ++v20;
    }
    while (v20 < a3->var0);
  }
  return v5;
}

- (id)dataForResolver:(id *)a3
{
  if (!a3)
  {
    unsigned __int8 v8 = sub_10000620C();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      os_log_type_enabled(v8, v9);
      unsigned __int8 v10 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v10 != &v15) {
        free(v10);
      }
    }

    goto LABEL_23;
  }
  if (*(int *)&a3->var3 < 1)
  {
    p_unsigned int var1 = &a3->var1;
    if (a3->var1 <= 0) {
      goto LABEL_23;
    }
    goto LABEL_14;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v5 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (*(int *)&a3->var3 >= 1)
  {
    uint64_t v6 = 0;
    do
      CFArrayAppendValue(v5, +[NSString stringWithUTF8String:*(void *)(*(void *)&a3->var4 + 8 * v6++)]);
    while (v6 < *(int *)&a3->var3);
  }
  CFDictionaryAddValue(Mutable, @"SearchDomains", v5);
  CFRelease(v5);
  p_unsigned int var1 = &a3->var1;
  if (a3->var1 > 0)
  {
    if (Mutable)
    {
LABEL_15:
      id v11 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      if (*p_var1 >= 1)
      {
        uint64_t v12 = 0;
        do
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          _SC_sockaddr_to_string();
          if ((_BYTE)v15) {
            CFArrayAppendValue(v11, +[NSString stringWithUTF8String:&v15]);
          }
          ++v12;
        }
        while (v12 < *p_var1);
      }
      CFDictionaryAddValue(Mutable, @"NameServers", v11);
      CFRelease(v11);
      goto LABEL_21;
    }
LABEL_14:
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    goto LABEL_15;
  }
LABEL_21:
  if (Mutable)
  {
    uint64_t v13 = +[NSPropertyListSerialization dataWithPropertyList:Mutable format:200 options:0 error:0];
    CFRelease(Mutable);
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v13 = 0;
LABEL_24:

  return v13;
}

- (id)getDNSDataFromCurrentConfig:(id *)a3 domain:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (!a3 || !v6)
  {
    id v11 = sub_10000620C();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v16, 0, sizeof(v16));
      os_log_type_enabled(v11, v12);
      uint64_t v13 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v13 != v16) {
        free(v13);
      }
    }

    goto LABEL_16;
  }
  if (a3->var0 < 1 || !*(void *)(&a3->var0 + 1))
  {
LABEL_16:
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = 0;
  while (1)
  {
    os_log_type_t v9 = *(void **)(*(void *)(&a3->var0 + 1) + 8 * v8);
    if (!*v9
      || [(AgentController *)self isResolverMulticast:*(void *)(*(void *)(&a3->var0 + 1) + 8 * v8)])
    {
      goto LABEL_10;
    }
    unsigned __int8 v10 = +[NSString stringWithUTF8String:*v9];
    if ([v10 isEqualToString:v7]) {
      break;
    }

LABEL_10:
    if (++v8 >= a3->var0) {
      goto LABEL_16;
    }
  }
  uint64_t v14 = [(AgentController *)self dataForResolver:v9];

LABEL_17:

  return v14;
}

- (BOOL)isResolverMulticast:(id *)a3
{
  var0 = (char *)a3->var7.var0;
  if (var0) {
    LOBYTE(var0) = strstr(var0, "mdns") != 0;
  }
  return (char)var0;
}

- (BOOL)isResolverPrivate:(id *)a3
{
  var0 = (char *)a3->var7.var0;
  if (var0) {
    LOBYTE(var0) = strstr(var0, "pdns") != 0;
  }
  return (char)var0;
}

- (void)processSupplementalDNSResolvers:(id *)a3
{
  type = +[NSMutableArray array];
  id v74 = [objc_alloc((Class)NSCountedSet) initWithCapacity:0];
  uint64_t v5 = +[NSMutableArray array];
  v75 = +[NSMutableArray array];
  id v6 = [(AgentController *)self floatingDNSAgentList];
  uint64_t v7 = [(AgentController *)self getAgentList:v6 agentType:2 agentSubType:2];

  if (*(void *)(&a3->var0 + 1))
  {
    if (a3->var0 >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        os_log_type_t v9 = *(void **)(*(void *)(&a3->var0 + 1) + 8 * v8);
        if (*v9
          && ![(AgentController *)self isResolverPrivate:*(void *)(*(void *)(&a3->var0 + 1) + 8 * v8)]&& ![(AgentController *)self isResolverMulticast:v9])
        {
          unsigned __int8 v10 = +[NSString stringWithCString:*v9 encoding:1];
          [v5 addObject:v10];
        }
        ++v8;
      }
      while (v8 < a3->var0);
    }
  }
  else
  {
    a3->var0 = 0;
  }
  id v11 = [(AgentController *)self floatingDNSAgentList];
  [(AgentController *)self cleanConflictingAgentsFromList:v7 new_list:v5 agentDictionary:v11];

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v116 objects:v115 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v117;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v117 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v116 + 1) + 8 * i);
        if (([v5 containsObject:v17] & 1) == 0)
        {
          long long v18 = [(AgentController *)self floatingDNSAgentList];
          long long v19 = [v18 objectForKey:v17];

          [(AgentController *)self destroyFloatingAgent:v19];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v116 objects:v115 count:16];
    }
    while (v14);
  }
  v76 = v5;
  v81 = a3;

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id obj = v12;
  id v20 = [obj countByEnumeratingWithState:&v111 objects:v110 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v112;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v112 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v111 + 1) + 8 * (void)j);
        long long v25 = [(AgentController *)self floatingDNSAgentList];
        long long v26 = [v25 objectForKey:v24];

        if (v26)
        {
          long long v27 = [v26 getAgentMapping];
          long long v28 = v27;
          if (v27)
          {
            long long v29 = [v27 getAssociatedEntity];
            long long v30 = [(AgentController *)self getDNSDataFromCurrentConfig:v81 domain:v29];

            if (!v30
              || ([v26 getAgentData],
                  __int16 v31 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v32 = [v31 isEqual:v30],
                  v31,
                  (v32 & 1) == 0))
            {
              [type addObject:v26];

LABEL_33:
              goto LABEL_34;
            }
          }
          else
          {
            __int16 v33 = [v26 getAssociatedEntity];
            long long v30 = [(AgentController *)self getDNSDataFromCurrentConfig:v81 domain:v33];

            unsigned int v34 = [v26 getAgentData];
            unsigned __int8 v35 = [v34 isEqual:v30];

            if ((v35 & 1) == 0)
            {
              [v26 updateAgentData:v30];
              [v75 addObject:v26];
            }
          }

          [v76 removeObject:v24];
          goto LABEL_33;
        }
LABEL_34:
      }
      id v21 = [obj countByEnumeratingWithState:&v111 objects:v110 count:16];
    }
    while (v21);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v77 = type;
  id v36 = [v77 countByEnumeratingWithState:&v106 objects:v105 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v107;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v107 != v38) {
          objc_enumerationMutation(v77);
        }
        long long v40 = *(void **)(*((void *)&v106 + 1) + 8 * (void)k);
        long long v41 = sub_10000620C();
        os_log_type_t v42 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          os_log_type_enabled(v41, v42);
          v43 = v41;
          v44 = [v40 getAgentName];
          int v87 = 138412290;
          v88 = v44;
          LODWORD(v71) = 12;
          id v70 = &v87;
          v45 = (long long *)_os_log_send_and_compose_impl();

          __SC_log_send2();
          if (v45 != &v89) {
            free(v45);
          }
        }

        [(AgentController *)self destroyFloatingAgent:v40];
      }
      id v37 = [v77 countByEnumeratingWithState:&v106 objects:v105 count:16];
    }
    while (v37);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v46 = v75;
  id v47 = [v46 countByEnumeratingWithState:&v83 objects:v82 count:16];
  v48 = v81;
  v49 = v76;
  if (v47)
  {
    id v50 = v47;
    uint64_t v51 = *(void *)v84;
    do
    {
      for (m = 0; m != v50; m = (char *)m + 1)
      {
        if (*(void *)v84 != v51) {
          objc_enumerationMutation(v46);
        }
        -[AgentController publishToAgent:](self, "publishToAgent:", *(void *)(*((void *)&v83 + 1) + 8 * (void)m), v70, v71);
      }
      id v50 = [v46 countByEnumeratingWithState:&v83 objects:v82 count:16];
    }
    while (v50);
  }

  uint64_t v53 = v74;
  if (v81->var0 >= 1)
  {
    uint64_t v54 = 0;
    do
    {
      v55 = *(void **)(*(void *)(&v48->var0 + 1) + 8 * v54);
      if (*v55
        && ![(AgentController *)self isResolverPrivate:*(void *)(*(void *)(&v48->var0 + 1) + 8 * v54)]&& ![(AgentController *)self isResolverMulticast:v55])
      {
        v56 = +[NSString stringWithUTF8String:*v55];
        id v57 = [v49 indexOfObject:v56];
        if (v57 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v58 = v57;
          v59 = (char *)[v53 countForObject:v56];
          if (v59)
          {
            v60 = v59 + 1;
            uint64_t v61 = [(AgentController *)self dataForResolver:v55];
            id v62 = +[NSString stringWithFormat:@"%@ #%lu", v56, v60];
            if ([(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v62 agentSubType:2 addPolicyOfType:6 publishData:v61])
            {
              uint64_t v63 = [(AgentController *)self floatingDNSAgentList];
              v64 = [v63 objectForKey:v62];

              CFIndex v65 = sub_10000620C();
              os_log_type_t typea = _SC_syslog_os_log_mapping();
              if (__SC_log_enabled())
              {
                long long v103 = 0u;
                long long v104 = 0u;
                long long v101 = 0u;
                long long v102 = 0u;
                long long v99 = 0u;
                long long v100 = 0u;
                long long v97 = 0u;
                long long v98 = 0u;
                long long v95 = 0u;
                long long v96 = 0u;
                long long v93 = 0u;
                long long v94 = 0u;
                long long v91 = 0u;
                long long v92 = 0u;
                long long v89 = 0u;
                long long v90 = 0u;
                os_log_type_enabled(v65, typea);
                v73 = v65;
                v66 = v65;
                v72 = [v64 getAgentName];
                int v87 = 138412290;
                v88 = v72;
                LODWORD(v71) = 12;
                id v70 = &v87;
                CFDictionaryRef v67 = (long long *)_os_log_send_and_compose_impl();

                __SC_log_send2();
                if (v67 != &v89) {
                  free(v67);
                }
                uint64_t v53 = v74;
                CFIndex v65 = v73;
              }
            }
          }
          else
          {
            uint64_t v61 = [(AgentController *)self dataForResolver:v55];
            v68 = [(AgentController *)self floatingDNSAgentList];
            v69 = [(AgentController *)self getAgentWithSameDataAndSubType:v68 data:v61 subType:2];

            if (v69)
            {
              [(AgentController *)self spawnMappedFloatingAgent:v69 entity:v56 agentSubType:2 addPolicyOfType:6 updateData:v61];
            }
            else
            {
              [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v56 agentSubType:2 addPolicyOfType:6 publishData:v61];
            }
          }
          [v76 removeObjectAtIndex:v58, v70, v71];
          [v53 addObject:v56];

          v56 = (void *)v61;
          v48 = v81;
        }

        v49 = v76;
      }
      ++v54;
    }
    while (v54 < v48->var0);
  }
}

- (void)processDNSResolvers:(id *)a3
{
  CFArrayRef v4 = [(AgentController *)self copyResolverList:a3];
  if (v4)
  {
    uint64_t v5 = [(AgentController *)self floatingDNSAgentList];
    unsigned __int8 v32 = [(AgentController *)self getAgentList:v5 agentType:2 agentSubType:3];

    if (v4->var1 && v4->var0)
    {
      uint64_t v6 = 0;
      while (1)
      {
        uint64_t v7 = [(AgentController *)self dataForResolver:v4->var0[v6]];
        if (v6)
        {
          uint64_t v8 = +[NSString stringWithFormat:@"_defaultDNS #%u", v6 + 1];
        }
        else
        {
          uint64_t v8 = @"_defaultDNS";
        }
        os_log_type_t v9 = [(AgentController *)self floatingDNSAgentList];
        unsigned __int8 v10 = [v9 objectForKey:v8];

        if (!v10) {
          goto LABEL_11;
        }
        [v32 removeObject:v8];
        id v11 = [v10 getAgentData];
        unsigned __int8 v12 = [v7 isEqual:v11];

        if ((v12 & 1) == 0) {
          break;
        }
LABEL_12:

        if (++v6 >= (unint64_t)v4->var1) {
          goto LABEL_13;
        }
      }
      [(AgentController *)self destroyFloatingAgent:v10];
LABEL_11:
      [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v8 agentSubType:3 addPolicyOfType:0 publishData:v7];
      goto LABEL_12;
    }
LABEL_13:
    id v13 = [(AgentController *)self floatingDNSAgentList];
    [(AgentController *)self deleteAgentList:v13 list:v32];

    id v14 = [(AgentController *)self floatingDNSAgentList];
    uint64_t v15 = [(AgentController *)self getAgentList:v14 agentType:2 agentSubType:4];

    if (v4->var3 && v4->var2)
    {
      unint64_t v16 = 0;
      do
      {
        uint64_t v17 = v4->var2[v16];
        if (v17)
        {
          if (*(void *)v17)
          {
            uint64_t v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
            if (v18)
            {
              long long v19 = (void *)v18;
              id v20 = [(AgentController *)self floatingDNSAgentList];
              uint64_t v21 = [v20 objectForKey:v19];

              if (v21)
              {
                [v15 removeObject:v19];

                long long v19 = (void *)v21;
              }
              else
              {
                [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v19 agentSubType:4 addPolicyOfType:6 publishData:0];
              }
            }
          }
        }
        ++v16;
      }
      while (v16 < v4->var3);
    }
    uint64_t v22 = [(AgentController *)self floatingDNSAgentList];
    [(AgentController *)self deleteAgentList:v22 list:v15];

    long long v23 = [(AgentController *)self floatingDNSAgentList];
    uint64_t v24 = [(AgentController *)self getAgentList:v23 agentType:2 agentSubType:5];

    if (v4->var5 && v4->var4)
    {
      unint64_t v25 = 0;
      do
      {
        long long v26 = v4->var4[v25];
        if (v26)
        {
          if (*(void *)v26)
          {
            uint64_t v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
            if (v27)
            {
              long long v28 = (void *)v27;
              long long v29 = [(AgentController *)self floatingDNSAgentList];
              uint64_t v30 = [v29 objectForKey:v28];

              if (v30)
              {
                [v24 removeObject:v28];

                long long v28 = (void *)v30;
              }
              else
              {
                [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v28 agentSubType:5 addPolicyOfType:6 publishData:0];
              }
            }
          }
        }
        ++v25;
      }
      while (v25 < v4->var5);
    }
    __int16 v31 = [(AgentController *)self floatingDNSAgentList];
    [(AgentController *)self deleteAgentList:v31 list:v24];
  }

  [(AgentController *)self freeResolverList:v4];
}

- (void)processScopedDNSResolvers:(id *)a3
{
  uint64_t v5 = [(AgentController *)self floatingDNSAgentList];
  uint64_t v6 = [(AgentController *)self getAgentList:v5 agentType:2 agentSubType:1];

  if (SHIDWORD(a3->var1.var1) >= 1 && *(void *)&a3->var2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &socket_ptr;
    os_log_type_t v9 = "@";
    do
    {
      uint64_t v10 = *(void *)(*(void *)&a3->var2 + 8 * v7);
      uint64_t v11 = sub_10002B5F8(*(_DWORD *)(v10 + 64), (uint64_t)v20);
      if (v11)
      {
        unsigned __int8 v12 = [v8[84] stringWithUTF8String:v11];
        id v13 = [v8[84] stringWithFormat:@"%s%@", v9, v12];
        id v14 = [(AgentController *)self dataForResolver:v10];
        id v15 = [v6 indexOfObject:v13];
        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v13 agentSubType:1 addPolicyOfType:8 publishData:v14];
          unint64_t v16 = 0;
        }
        else
        {
          uint64_t v17 = v9;
          [v6 removeObjectAtIndex:v15];
          uint64_t v18 = [(AgentController *)self floatingDNSAgentList];
          unint64_t v16 = [v18 objectForKey:v13];

          if (v16)
          {
            [v16 updateAgentData:v14];
            if ([v16 shouldUpdateAgent]) {
              [(AgentController *)self publishToAgent:v16];
            }
          }
          os_log_type_t v9 = v17;
          uint64_t v8 = &socket_ptr;
        }
      }
      else
      {
        id v14 = 0;
        unint64_t v16 = 0;
        unsigned __int8 v12 = 0;
        id v13 = 0;
      }

      ++v7;
    }
    while (v7 < SHIDWORD(a3->var1.var1));
  }
  long long v19 = [(AgentController *)self floatingDNSAgentList];
  [(AgentController *)self deleteAgentList:v19 list:v6];
}

- (void)processServiceSpecificDNSResolvers:(id *)a3
{
  uint64_t v5 = [(AgentController *)self floatingDNSAgentList];
  id v19 = [(AgentController *)self getAgentList:v5 agentType:2 agentSubType:6];

  if (SLODWORD(a3->var4) >= 1 && *(unint64_t *)((char *)&a3->var4 + 4))
  {
    uint64_t v6 = 0;
    uint64_t v7 = &socket_ptr;
    uint64_t v8 = "@";
    do
    {
      uint64_t v9 = *(void *)(*(unint64_t *)((char *)&a3->var4 + 4) + 8 * v6);
      uint64_t v10 = *(unsigned int *)(v9 + 76);
      if (v10)
      {
        uint64_t v11 = [v7[84] stringWithFormat:@"%s%u", v8, v10];
        unsigned __int8 v12 = [(AgentController *)self dataForResolver:v9];
        id v13 = [v19 indexOfObject:v11];
        if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          [(AgentController *)self spawnFloatingAgent:objc_opt_class() entity:v11 agentSubType:6 addPolicyOfType:-1 publishData:v12];
          id v14 = 0;
        }
        else
        {
          id v15 = v8;
          unint64_t v16 = v7;
          [v19 removeObjectAtIndex:v13];
          uint64_t v17 = [(AgentController *)self floatingDNSAgentList];
          id v14 = [v17 objectForKey:v11];

          if (v14)
          {
            [v14 updateAgentData:v12];
            if ([v14 shouldUpdateAgent]) {
              [(AgentController *)self publishToAgent:v14];
            }
          }
          uint64_t v7 = v16;
          uint64_t v8 = v15;
        }
      }
      else
      {
        unsigned __int8 v12 = 0;
        id v14 = 0;
        uint64_t v11 = 0;
      }

      ++v6;
    }
    while (v6 < SLODWORD(a3->var4));
  }
  uint64_t v18 = [(AgentController *)self floatingDNSAgentList];
  [(AgentController *)self deleteAgentList:v18 list:v19];
}

- (BOOL)isResolverOnion:(id *)a3
{
  return a3->var0.var1 && !strcmp(a3->var0.var0, "onion");
}

- (void)processOnionResolver:(id *)a3
{
  if (!a3) {
    goto LABEL_11;
  }
  if (a3->var0 < 1)
  {
LABEL_6:
    if (qword_10007DEA8) {
      return;
    }
    id v6 = objc_alloc((Class)NEPolicy);
    uint64_t v7 = +[NEPolicyResult drop];
    uint64_t v8 = +[NEPolicyCondition domain:@"onion"];
    id v37 = v8;
    uint64_t v9 = +[NSArray arrayWithObjects:&v37 count:1];
    uint64_t v10 = [v6 initWithOrder:500 result:v7 conditions:v9];

    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v11 = [(AgentController *)self policySession];
    qword_10007DEA8 = (uint64_t)[(id)v11 addPolicy:v10];

    unsigned __int8 v12 = [(AgentController *)self policySession];
    LOBYTE(v11) = [v12 apply];

    if (v11)
    {
      id v13 = sub_10000620C();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
LABEL_19:
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        os_log_type_enabled(v13, v14);
        id v20 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v20 != &v21) {
          free(v20);
        }
      }
    }
    else
    {
      qword_10007DEA8 = 0;
      id v13 = sub_10000620C();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled()) {
        goto LABEL_19;
      }
    }

    goto LABEL_22;
  }
  uint64_t v5 = 0;
  while (![(AgentController *)self isResolverOnion:*(void *)(*(void *)(&a3->var0 + 1) + 8 * v5)])
  {
    if (++v5 >= a3->var0) {
      goto LABEL_6;
    }
  }
LABEL_11:
  if (!qword_10007DEA8) {
    return;
  }
  id v15 = [(AgentController *)self policySession];
  [v15 removePolicyWithID:qword_10007DEA8];

  unint64_t v16 = [(AgentController *)self policySession];
  unsigned __int8 v17 = [v16 apply];

  if (v17)
  {
    qword_10007DEA8 = 0;
    uint64_t v10 = sub_10000620C();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_16:
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      os_log_type_enabled(v10, v18);
      id v19 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v19 != &v21) {
        free(v19);
      }
    }
  }
  else
  {
    uint64_t v10 = sub_10000620C();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled()) {
      goto LABEL_16;
    }
  }
LABEL_22:
}

- (void)processDNSChanges
{
  uint64_t v3 = dns_configuration_copy();
  if (v3)
  {
    [(AgentController *)self processDNSResolvers:v3];
    [(AgentController *)self processScopedDNSResolvers:v3];
    [(AgentController *)self processSupplementalDNSResolvers:v3];
    [(AgentController *)self processServiceSpecificDNSResolvers:v3];
  }
  else
  {
    CFArrayRef v4 = sub_10000620C();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v23, 0, sizeof(v23));
      os_log_type_enabled(v4, v5);
      __int16 v17 = 0;
      LODWORD(v16) = 2;
      id v15 = &v17;
      id v6 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v6 != v23) {
        free(v6);
      }
    }

    uint64_t v7 = [(AgentController *)self floatingDNSAgentList];
    id v8 = [v7 copy];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          os_log_type_t v14 = [v9 objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * i) v15, v16];
          [(AgentController *)self destroyFloatingAgent:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v18 count:16];
      }
      while (v11);
    }
  }
  -[AgentController processOnionResolver:](self, "processOnionResolver:", v3, v15, v16);
  [(AgentController *)self applyPolicies];
  if (v3) {
    dns_configuration_free();
  }
}

- (const)copyConfigAgentData:(id)a3 uuid:(unsigned __int8)a4[16] length:(unint64_t *)a5
{
  id v7 = a3;
  id v8 = v7;
  if (!a5)
  {
    long long v20 = sub_10000620C();
    os_log_type_t v22 = _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled())
    {
LABEL_20:

      id v16 = 0;
      os_log_type_t v14 = 0;
      goto LABEL_21;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    *(_OWORD *)uu1 = 0u;
    long long v32 = 0u;
    os_log_type_enabled(v20, v22);
    *(_WORD *)out = 0;
LABEL_18:
    long long v23 = (unsigned __int8 *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v23 != uu1) {
      free(v23);
    }
    goto LABEL_20;
  }
  *a5 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (!v10)
  {
LABEL_10:

LABEL_14:
    memset(out, 0, 37);
    uuid_unparse(a4, out);
    long long v20 = sub_10000620C();
    os_log_type_t v21 = _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled()) {
      goto LABEL_20;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    *(_OWORD *)uu1 = 0u;
    long long v32 = 0u;
    os_log_type_enabled(v20, v21);
    goto LABEL_18;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v28;
LABEL_4:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v28 != v12) {
      objc_enumerationMutation(v9);
    }
    os_log_type_t v14 = [v9 objectForKey:*(void *)(*((void *)&v27 + 1) + 8 * v13)];
    memset(uu1, 0, sizeof(uu1));
    id v15 = [v14 getAgentUUID];
    [v15 getUUIDBytes:uu1];

    if (!uuid_compare(uu1, a4)) {
      break;
    }

    if (v11 == (id)++v13)
    {
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (v11) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  if (!v14) {
    goto LABEL_14;
  }
  id v16 = [v14 getAgentData];
  id v17 = [v16 length];
  if (v17)
  {
    size_t v18 = (size_t)v17;
    *a5 = (unint64_t)v17;
    long long v19 = malloc_type_malloc((size_t)v17, 0xE3123B4CuLL);
    id v16 = v16;
    memcpy(v19, [v16 bytes], v18);
    goto LABEL_22;
  }
LABEL_21:
  long long v19 = 0;
LABEL_22:

  return v19;
}

- (const)copyProxyAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4
{
  id v7 = [(AgentController *)self floatingProxyAgentList];
  id v8 = [(AgentController *)self copyConfigAgentData:v7 uuid:a3 length:a4];

  return v8;
}

- (const)copyDNSAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4
{
  id v7 = [(AgentController *)self floatingDNSAgentList];
  id v8 = [(AgentController *)self copyConfigAgentData:v7 uuid:a3 length:a4];

  return v8;
}

- (id)dataLengthSanityCheck:(id)a3
{
  id v3 = a3;
  CFArrayRef v4 = [v3 getAgentData];
  if ((unint64_t)[v4 length] < 0x401)
  {
    id v8 = 0;
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    os_log_type_t v5 = +[NSMutableDictionary dictionary];
    id v6 = [v3 getAgentUUID];
    [v6 getUUIDBytes:v10];
    id v7 = [objc_alloc((Class)NSData) initWithBytes:v10 length:16];
    [v5 setValue:v7 forKey:@"OutOfBandDataUUID"];
    id v8 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:0];
  }

  return v8;
}

- (id)sanitizeEntity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@" #"];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 substringToIndex:v4];
  }
  id v6 = v5;

  return v6;
}

- (id)sanitizeInterfaceName:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 rangeOfString:@"@"];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 substringFromIndex:v4 + 1];
  }
  id v6 = v5;

  return v6;
}

- (int)entityInstanceNumber:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 rangeOfString:@" #"];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    int v5 = 0;
  }
  else
  {
    id v6 = [v3 substringFromIndex:v4 + 2];
    int v5 = [v6 intValue];
  }
  return v5;
}

- (void)cleanConflictingAgentsFromList:(id)a3 new_list:(id)a4 agentDictionary:(id)a5
{
  id v8 = a3;
  id v32 = a4;
  id obj = v8;
  id v35 = a5;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v62 objects:v61 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v63;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v63 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        os_log_type_t v14 = -[AgentController sanitizeEntity:](self, "sanitizeEntity:", v13, v30, v31);
        if (([v14 isEqualToString:v13] & 1) == 0)
        {
          id v15 = [v35 objectForKey:v14];
          [(AgentController *)self destroyFloatingAgent:v15];
          id v16 = [v35 objectForKey:v13];

          [(AgentController *)self destroyFloatingAgent:v16];
          id v17 = sub_10000620C();
          os_log_type_t v18 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            os_log_type_enabled(v17, v18);
            int v41 = 138412546;
            long long v42 = v14;
            __int16 v43 = 2112;
            uint64_t v44 = v13;
            LODWORD(v31) = 22;
            long long v30 = &v41;
            long long v19 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v19 != &v45) {
              free(v19);
            }
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v62 objects:v61 count:16];
    }
    while (v10);
  }
  id v20 = [objc_alloc((Class)NSCountedSet) initWithArray:v32];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obja = obj;
  id v21 = [obja countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obja);
        }
        long long v25 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        if ((unint64_t)objc_msgSend(v20, "countForObject:", v25, v30, v31) >= 2)
        {
          long long v26 = [v35 objectForKey:v25];
          [(AgentController *)self destroyFloatingAgent:v26];
          long long v27 = sub_10000620C();
          os_log_type_t v28 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            os_log_type_enabled(v27, v28);
            int v41 = 138412290;
            long long v42 = v25;
            LODWORD(v31) = 12;
            long long v30 = &v41;
            long long v29 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v29 != &v45) {
              free(v29);
            }
          }
        }
      }
      id v22 = [obja countByEnumeratingWithState:&v37 objects:v36 count:16];
    }
    while (v22);
  }
}

- (id)getAgentList:(id)a3 agentType:(unint64_t)a4 agentSubType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  id v9 = [v7 allValues];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        os_log_type_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v14 getAgentType] == (id)a4 && objc_msgSend(v14, "getAgentSubType") == (id)a5)
        {
          id v15 = [v14 getAssociatedEntity];
          [v8 addObject:v15];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)deleteAgentList:(id)a3 list:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [v6 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)];
        [(AgentController *)self destroyFloatingAgent:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v9);
  }
}

- (id)getAgentWithSameDataAndSubType:(id)a3 data:(id)a4 subType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = [v9 objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * v13)];
      long long v15 = [v14 getAgentData];
      unsigned int v16 = [v15 isEqual:v8];

      if (v16)
      {
        if ([v14 getAgentSubType] == (id)a5)
        {
          long long v17 = [v14 getRegistrationObject];

          if (v17) {
            break;
          }
        }
      }

      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    long long v14 = 0;
  }

  return v14;
}

- (BOOL)addPolicyToFloatingAgent:(id)a3 domain:(id)a4 agentUUIDToUse:(id)a5 policyType:(int64_t)a6 useControlPolicySession:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  id v14 = a4;
  long long v109 = v12;
  id v15 = [v12 getAgentType];
  id v16 = v15;
  if (v15 == (id)2) {
    int v17 = 0;
  }
  else {
    int v17 = 5000;
  }
  if (v15 == (id)2) {
    int v18 = 5000;
  }
  else {
    int v18 = 0;
  }
  unsigned int v19 = [(AgentController *)self entityInstanceNumber:v14];
  v110 = [(AgentController *)self sanitizeEntity:v14];

  switch(a6)
  {
    case 0:
      unsigned int v101 = v18;
      uint64_t v20 = 0;
      int v21 = v17 + 1000;
      goto LABEL_14;
    case 6:
      unsigned int v101 = v18;
      int v21 = v17 + 500;
      uint64_t v20 = +[NEPolicyCondition domain:v110];
      int v26 = 750;
      goto LABEL_16;
    case 7:
      unsigned int v101 = v18;
      int v21 = v17 + 1000;
      uint64_t v20 = +[NEPolicyCondition allInterfaces];
LABEL_14:
      int v26 = 1250;
      goto LABEL_16;
    case 8:
      unsigned int v101 = v18;
      int v21 = v17 | 0x64;
      uint64_t v27 = [(AgentController *)self sanitizeInterfaceName:v110];

      uint64_t v20 = +[NEPolicyCondition scopedInterface:v27];
      int v26 = 250;
      v110 = (void *)v27;
LABEL_16:
      uint64_t v28 = v21 + v19;
      id v108 = v13;
      uint64_t v29 = +[NEPolicyResult netAgentUUID:v13];
      id v30 = objc_alloc((Class)NEPolicy);
      uint64_t v31 = v30;
      v105 = (void *)v29;
      long long v107 = v20;
      if (v20)
      {
        uint64_t v115 = v20;
        id v32 = +[NSArray arrayWithObjects:&v115 count:1];
        id v33 = [v31 initWithOrder:v28 result:v29 conditions:v32];

        if (v33) {
          goto LABEL_18;
        }
LABEL_24:
        long long v39 = sub_10000620C();
        os_log_type_t v40 = _SC_syslog_os_log_mapping();
        id v13 = v108;
        long long v25 = v109;
        if (__SC_log_enabled())
        {
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          os_log_type_enabled(v39, v40);
          int v41 = v39;
          [v109 getAgentName];
          int v113 = 138412290;
          id v114 = (id)objc_claimAutoreleasedReturnValue();
          long long v42 = (long long *)_os_log_send_and_compose_impl();

          __SC_log_send2();
          if (v42 != &v116) {
            free(v42);
          }
        }

        BOOL v43 = 0;
        long long v22 = v107;
        goto LABEL_78;
      }
      id v33 = [v30 initWithOrder:v28 result:v29 conditions:0];
      if (!v33) {
        goto LABEL_24;
      }
LABEL_18:
      if (v7)
      {
        long long v34 = [(AgentController *)self controlPolicySession];

        if (!v34)
        {
          id v35 = [(AgentController *)self createPolicySession];
          [(AgentController *)self setControlPolicySession:v35];

          long long v36 = [(AgentController *)self controlPolicySession];

          if (!v36)
          {
            v79 = sub_10000620C();
            os_log_type_t v80 = _SC_syslog_os_log_mapping();
            long long v25 = v109;
            if (__SC_log_enabled())
            {
              long long v130 = 0u;
              long long v131 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              long long v126 = 0u;
              long long v127 = 0u;
              long long v124 = 0u;
              long long v125 = 0u;
              long long v122 = 0u;
              long long v123 = 0u;
              long long v120 = 0u;
              long long v121 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              os_log_type_enabled(v79, v80);
              v81 = v79;
              [v109 getAgentName];
              int v113 = 138412290;
              id v114 = (id)objc_claimAutoreleasedReturnValue();
              v82 = (long long *)_os_log_send_and_compose_impl();

              __SC_log_send2();
              if (v82 != &v116) {
                free(v82);
              }
            }

            goto LABEL_36;
          }
          long long v37 = [(AgentController *)self controlPolicySession];
          [v37 setPriority:100];
        }
        uint64_t v38 = [(AgentController *)self controlPolicySession];
      }
      else
      {
        uint64_t v38 = [(AgentController *)self policySession];
      }
      uint64_t v44 = (void *)v38;
      [v109 setPreferredPolicySession:v38];

      long long v45 = [v109 preferredPolicySession];
      id v46 = [v45 addPolicy:v33];
      if (!v46)
      {
        long long v54 = sub_10000620C();
        os_log_type_t v55 = _SC_syslog_os_log_mapping();
        long long v25 = v109;
        if (__SC_log_enabled())
        {
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          os_log_type_enabled(v54, v55);
          long long v56 = v54;
          [v109 getAgentName];
          int v113 = 138412290;
          id v114 = (id)objc_claimAutoreleasedReturnValue();
          long long v57 = (long long *)_os_log_send_and_compose_impl();

          __SC_log_send2();
          if (v57 != &v116) {
            free(v57);
          }
        }

LABEL_36:
        BOOL v43 = 0;
        long long v22 = v107;
        id v13 = v108;
        goto LABEL_78;
      }
      id v100 = v46;
      uint64_t v47 = (v17 + v26);
      uint64_t v48 = +[NEPolicyResult skipWithOrder:v101];

      id v49 = objc_alloc((Class)NEPolicy);
      long long v50 = v49;
      long long v22 = v107;
      if (v107)
      {
        long long v112 = v107;
        +[NSArray arrayWithObjects:&v112 count:1];
        v52 = long long v51 = v45;
        id v53 = [v50 initWithOrder:v47 result:v48 conditions:v52];

        id v33 = (id)v52;
        long long v45 = v51;
      }
      else
      {
        id v53 = [v49 initWithOrder:v47 result:v48 conditions:0];
      }
      long long v58 = (void *)v48;

      if (v53)
      {
        id v59 = [v45 addPolicy:v53];
        id v13 = v108;
        if (v59)
        {
          id v60 = v59;
          long long v102 = (void *)v48;
          if (v16 != (id)1)
          {
            long long v106 = v45;
            id v78 = 0;
LABEL_65:
            long long v85 = [(AgentController *)self policyDB];
            long long v25 = v109;
            long long v86 = [v109 getAgentName];
            int v87 = [v85 objectForKey:v86];

            if (!v87)
            {
              int v87 = +[NSMutableArray array];
            }
            v88 = +[NSNumber numberWithUnsignedInteger:v100];
            [v87 addObject:v88];

            long long v89 = +[NSNumber numberWithUnsignedInteger:v60];
            [v87 addObject:v89];

            if (v78)
            {
              long long v90 = +[NSNumber numberWithUnsignedInteger:v78];
              [v87 addObject:v90];
            }
            long long v91 = [(AgentController *)self policyDB];
            long long v92 = [v109 getAgentName];
            [v91 setObject:v87 forKey:v92];

            BOOL v43 = 1;
            goto LABEL_77;
          }
          id v61 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&ne_privacy_proxy_netagent_id];
          uint64_t v62 = +[NEPolicyResult removeNetworkAgentUUID:v61];
          id v63 = objc_alloc((Class)NEPolicy);
          long long v64 = v63;
          long long v99 = (void *)v62;
          if (v107)
          {
            long long v111 = v107;
            +[NSArray arrayWithObjects:&v111 count:1];
            v66 = long long v65 = v45;
            id v67 = [v64 initWithOrder:v28 result:v62 conditions:v66];

            id v53 = (id)v66;
            long long v45 = v65;
          }
          else
          {
            id v67 = [v63 initWithOrder:v28 result:v62 conditions:0];
          }

          long long v83 = v102;
          if (v67)
          {
            id v84 = [v45 addPolicy:v67];
            if (v84)
            {
              id v78 = v84;
              long long v106 = v45;

              id v53 = v67;
              goto LABEL_65;
            }
            long long v93 = v61;
            long long v94 = sub_10000620C();
            os_log_type_t v95 = _SC_syslog_os_log_mapping();
            if (__SC_log_enabled()) {
              goto LABEL_73;
            }
          }
          else
          {
            long long v93 = v61;
            long long v94 = sub_10000620C();
            os_log_type_t v95 = _SC_syslog_os_log_mapping();
            if (__SC_log_enabled())
            {
LABEL_73:
              long long v130 = 0u;
              long long v131 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              long long v126 = 0u;
              long long v127 = 0u;
              long long v124 = 0u;
              long long v125 = 0u;
              long long v122 = 0u;
              long long v123 = 0u;
              long long v120 = 0u;
              long long v121 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              os_log_type_enabled(v94, v95);
              long long v94 = v94;
              long long v96 = [v109 getAgentName];
              int v113 = 138412290;
              id v114 = v96;
              long long v97 = (long long *)_os_log_send_and_compose_impl();

              __SC_log_send2();
              if (v97 != &v116) {
                free(v97);
              }
              long long v22 = v107;
              long long v83 = v102;
            }
          }

          BOOL v43 = 0;
          long long v25 = v109;
LABEL_77:
          id v13 = v108;
          goto LABEL_78;
        }
        v73 = sub_10000620C();
        os_log_type_t v74 = _SC_syslog_os_log_mapping();
        long long v25 = v109;
        if (__SC_log_enabled())
        {
          long long v104 = v58;
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          os_log_type_enabled(v73, v74);
          v75 = v73;
          v76 = [v109 getAgentName];
          int v113 = 138412290;
          id v114 = v76;
          id v77 = (long long *)_os_log_send_and_compose_impl();

          __SC_log_send2();
          if (v77 != &v116) {
            free(v77);
          }
          long long v22 = v107;
          long long v58 = v104;
        }
      }
      else
      {
        v68 = sub_10000620C();
        uint64_t v69 = _SC_syslog_os_log_mapping();
        id v13 = v108;
        long long v25 = v109;
        if (__SC_log_enabled())
        {
          long long v103 = v58;
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          os_log_type_enabled(v68, (os_log_type_t)v69);
          id v70 = v68;
          uint64_t v71 = [v109 getAgentName];
          int v113 = 138412290;
          id v114 = v71;
          v72 = (long long *)_os_log_send_and_compose_impl();

          __SC_log_send2();
          if (v72 != &v116) {
            free(v72);
          }
          long long v58 = v103;
        }
      }
LABEL_55:
      BOOL v43 = 0;
LABEL_78:

      return v43;
    default:
      long long v22 = sub_10000620C();
      os_log_type_t v23 = _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
      {
        BOOL v43 = 0;
        long long v25 = v109;
        goto LABEL_78;
      }
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      os_log_type_enabled(v22, v23);
      LOWORD(v113) = 0;
      long long v24 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      long long v25 = v109;
      if (v24 != &v116) {
        free(v24);
      }
      goto LABEL_55;
  }
}

- (BOOL)spawnFloatingAgent:(Class)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 publishData:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = +[NSMutableDictionary dictionary];
  [v14 setValue:v12 forKey:@"EntityName"];
  id v15 = +[NSNumber numberWithUnsignedInteger:a5];
  [v14 setValue:v15 forKey:@"AgentSubType"];

  id v16 = [[a3 alloc] initWithParameters:v14];
  if (![(AgentController *)self registerAgent:v16]) {
    goto LABEL_14;
  }
  if (v13)
  {
    [v16 updateAgentData:v13];
    [(AgentController *)self publishToAgent:v16];
  }
  if ((a6 & 0x8000000000000000) == 0)
  {
    int v17 = [v16 agentUUID];
    unsigned __int8 v18 = [(AgentController *)self addPolicyToFloatingAgent:v16 domain:v12 agentUUIDToUse:v17 policyType:a6 useControlPolicySession:a5 == 7];

    if ((v18 & 1) == 0)
    {
      [(AgentController *)self unregisterAgent:v16];
LABEL_14:
      BOOL v23 = 0;
      goto LABEL_15;
    }
  }
  unsigned int v19 = sub_10000620C();
  os_log_type_t v20 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    memset(v29, 0, sizeof(v29));
    os_log_type_enabled(v19, v20);
    int v27 = 138412290;
    id v28 = v12;
    LODWORD(v26) = 12;
    long long v25 = &v27;
    int v21 = (_OWORD *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v21 != v29) {
      free(v21);
    }
  }

  if ([v16 getAgentType] == (id)1) {
    [(AgentController *)self floatingProxyAgentList];
  }
  else {
  long long v22 = [(AgentController *)self floatingDNSAgentList];
  }
  [v22 setObject:v16 forKey:v12];

  BOOL v23 = 1;
LABEL_15:

  return v23;
}

- (BOOL)spawnMappedFloatingAgent:(id)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 updateData:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = +[NSMutableDictionary dictionary];
  [v15 setValue:v13 forKey:@"EntityName"];
  id v16 = +[NSNumber numberWithUnsignedInteger:a5];
  [v15 setValue:v16 forKey:@"AgentSubType"];

  id v17 = [objc_alloc((Class)objc_opt_class()) initWithParameters:v15];
  unsigned __int8 v18 = v17;
  if (v14) {
    [v17 updateAgentData:v14];
  }
  unsigned int v19 = [v12 agentUUID];
  BOOL v20 = [(AgentController *)self addPolicyToFloatingAgent:v18 domain:v13 agentUUIDToUse:v19 policyType:a6 useControlPolicySession:a5 == 7];

  if (v20)
  {
    if ([v12 getAgentType] == (id)1) {
      [(AgentController *)self floatingProxyAgentList];
    }
    else {
    int v21 = [(AgentController *)self floatingDNSAgentList];
    }
    [v21 setObject:v18 forKey:v13];

    [v18 setAgentMapping:v12];
    long long v22 = sub_10000620C();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      id v28 = v14;
      memset(v30, 0, sizeof(v30));
      os_log_type_enabled(v22, v23);
      long long v24 = v22;
      long long v25 = [v18 getAgentName];
      uint64_t v29 = [v12 getAgentName];
      uint64_t v26 = (_OWORD *)_os_log_send_and_compose_impl();

      __SC_log_send2();
      if (v26 != v30) {
        free(v26);
      }
      id v14 = v28;
    }
  }
  return v20;
}

- (BOOL)publishToAgent:(id)a3
{
  id v4 = a3;
  int v5 = [(AgentController *)self dataLengthSanityCheck:v4];
  if (v5)
  {
    id v6 = [v4 getAgentData];
    id v7 = [v6 copy];

    [v4 updateAgentData:v5];
    id v8 = sub_10000620C();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      os_log_type_enabled(v8, v9);
      id v10 = v8;
      id v11 = [v4 getAgentName];
      int v30 = 138412546;
      uint64_t v31 = v11;
      __int16 v32 = 2048;
      id v33 = [v7 length];
      LODWORD(v27) = 22;
      long long v25 = &v30;
      id v12 = (long long *)_os_log_send_and_compose_impl();

      __SC_log_send2();
      if (v12 != &v34) {
        free(v12);
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  id v13 = [v4 valueForKey:@"registrationObject" v25, v27];
  id v14 = sub_10000620C();
  os_log_type_t v15 = _SC_syslog_os_log_mapping();
  int v16 = __SC_log_enabled();
  if (!v13)
  {
    if (!v16) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v16)
  {
    uint64_t v29 = v5;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    os_log_type_enabled(v14, v15);
    id v17 = v14;
    unsigned __int8 v18 = [v4 getAgentName];
    unsigned int v19 = [v4 getAgentData];
    id v20 = [v19 length];
    int v30 = 138412546;
    uint64_t v31 = v18;
    __int16 v32 = 2048;
    id v33 = v20;
    LODWORD(v28) = 22;
    uint64_t v26 = &v30;
    int v21 = (long long *)_os_log_send_and_compose_impl();

    __SC_log_send2();
    if (v21 != &v34) {
      free(v21);
    }
    int v5 = v29;
  }

  if ([v13 updateNetworkAgent:v4])
  {
    BOOL v22 = 1;
    if (!v7) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  id v14 = sub_10000620C();
  os_log_type_t v15 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
LABEL_18:
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    os_log_type_enabled(v14, v15);
    LOWORD(v30) = 0;
    LODWORD(v28) = 2;
    uint64_t v26 = &v30;
    os_log_type_t v23 = (long long *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v23 != &v34) {
      free(v23);
    }
  }
LABEL_20:

  BOOL v22 = 0;
  if (v7) {
LABEL_21:
  }
    [v4 updateAgentData:v7, v26, v28];
LABEL_22:

  return v22;
}

- (BOOL)destroyFloatingAgent:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 getAssociatedEntity];
    id v7 = [(AgentController *)self policyDB];
    id v8 = [v5 getAgentName];
    os_log_type_t v9 = [v7 objectForKey:v8];

    if (v9)
    {
      long long v57 = self;
      id v59 = v6;
      id v10 = [v5 preferredPolicySession];
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v58 = v9;
      id obj = v9;
      id v11 = [obj countByEnumeratingWithState:&v86 objects:v85 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v87;
        uint64_t v61 = *(void *)v87;
        do
        {
          id v14 = 0;
          id v62 = v12;
          do
          {
            if (*(void *)v87 != v13) {
              objc_enumerationMutation(obj);
            }
            id v15 = [*(id *)(*((void *)&v86 + 1) + 8 * (void)v14) unsignedIntegerValue:v53, v55];
            if (([v10 removePolicyWithID:v15] & 1) == 0)
            {
              int v16 = sub_10000620C();
              os_log_type_t v17 = _SC_syslog_os_log_mapping();
              if (__SC_log_enabled())
              {
                long long v83 = 0u;
                long long v84 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                long long v75 = 0u;
                long long v76 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                long long v71 = 0u;
                long long v72 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                os_log_type_enabled(v16, v17);
                unsigned __int8 v18 = v16;
                unsigned int v19 = v10;
                id v20 = [v10 policyWithID:v15];
                int v21 = v5;
                BOOL v22 = [v5 getAgentName];
                int v65 = 138412546;
                uint64_t v66 = v20;
                __int16 v67 = 2112;
                v68 = v22;
                LODWORD(v55) = 22;
                id v53 = &v65;
                os_log_type_t v23 = (long long *)_os_log_send_and_compose_impl();

                __SC_log_send2();
                if (v23 != &v69) {
                  free(v23);
                }
                int v5 = v21;
                id v10 = v19;
                uint64_t v13 = v61;
                id v12 = v62;
              }
            }
            id v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [obj countByEnumeratingWithState:&v86 objects:v85 count:16];
        }
        while (v12);
      }

      self = v57;
      long long v24 = [(AgentController *)v57 policyDB];
      long long v25 = [v5 getAgentName];
      [v24 removeObjectForKey:v25];

      os_log_type_t v9 = v58;
      id v6 = v59;
    }
    uint64_t v26 = sub_10000620C();
    os_log_type_t v27 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      os_log_type_enabled(v26, v27);
      int v65 = 138412290;
      uint64_t v66 = v6;
      LODWORD(v55) = 12;
      id v53 = &v65;
      uint64_t v28 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v28 != &v69) {
        free(v28);
      }
    }

    if ([v5 getAgentType] == (id)1)
    {
      uint64_t v29 = [(AgentController *)self floatingProxyAgentList];
      [v29 removeObjectForKey:v6];

      int v30 = [(AgentController *)self floatingProxyAgentList_TCPConverter];
      [v30 removeObjectForKey:v6];

      uint64_t v31 = [(AgentController *)self floatingProxyAgentList_TCPConverter];
      id v32 = [v31 count];

      if (!v32) {
        sub_10004D708(0);
      }
    }
    else
    {
      id v33 = [(AgentController *)self floatingDNSAgentList];
      long long v34 = [v5 getAssociatedEntity];
      [v33 removeObjectForKey:v34];
    }
    long long v35 = [v5 getRegistrationObject:v53, v55];

    if (v35) {
      [(AgentController *)self unregisterAgent:v5];
    }
    long long v36 = [(AgentController *)self controlPolicySession];

    if (v36)
    {
      long long v37 = [(AgentController *)self floatingProxyAgentList];
      long long v38 = [(AgentController *)self getAgentList:v37 agentType:1 agentSubType:7];

      long long v39 = [(AgentController *)self floatingDNSAgentList];
      long long v40 = self;
      long long v41 = [(AgentController *)self getAgentList:v39 agentType:2 agentSubType:7];

      if (![v38 count] && !objc_msgSend(v41, "count"))
      {
        long long v42 = [(AgentController *)v40 controlPolicySession];
        unsigned __int8 v43 = [v42 removeAllPolicies];

        if ((v43 & 1) == 0)
        {
          id v60 = v6;
          long long v44 = sub_10000620C();
          os_log_type_t v45 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            os_log_type_enabled(v44, v45);
            long long v46 = v44;
            id obja = v5;
            long long v47 = [v5 getAgentName];
            int v65 = 138412290;
            uint64_t v66 = v47;
            LODWORD(v56) = 12;
            long long v54 = &v65;
            long long v48 = (long long *)_os_log_send_and_compose_impl();

            __SC_log_send2();
            if (v48 != &v69) {
              free(v48);
            }
            int v5 = obja;
          }

          id v6 = v60;
        }
        -[AgentController setControlPolicySession:](v40, "setControlPolicySession:", 0, v54, v56);
        long long v49 = sub_10000620C();
        os_log_type_t v50 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          os_log_type_enabled(v49, v50);
          LOWORD(v65) = 0;
          long long v51 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v51 != &v69) {
            free(v51);
          }
        }
      }
    }
  }
  return v5 != 0;
}

- (BOOL)registerAgent:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NWNetworkAgentRegistration) initWithNetworkAgentClass:objc_opt_class()];
  unsigned __int8 v5 = [v4 registerNetworkAgent:v3];
  if (v5)
  {
    [v3 addAgentRegistrationObject:v4];
  }
  else
  {
    id v6 = sub_10000620C();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v10, 0, sizeof(v10));
      os_log_type_enabled(v6, v7);
      id v8 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v8 != v10) {
        free(v8);
      }
    }
  }
  return v5;
}

- (BOOL)unregisterAgent:(id)a3
{
  id v3 = [a3 valueForKey:@"registrationObject"];
  id v4 = v3;
  if (!v3)
  {
    id v6 = sub_10000620C();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_7:
      memset(v10, 0, sizeof(v10));
      os_log_type_enabled(v6, v7);
      id v8 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v8 != v10) {
        free(v8);
      }
    }
LABEL_9:

    BOOL v5 = 0;
    goto LABEL_10;
  }
  if (([v3 unregisterNetworkAgent] & 1) == 0)
  {
    id v6 = sub_10000620C();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled()) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  BOOL v5 = 1;
LABEL_10:

  return v5;
}

- (OS_dispatch_queue)controllerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setControllerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)floatingProxyAgentList
{
  return self->_floatingProxyAgentList;
}

- (void)setFloatingProxyAgentList:(id)a3
{
  p_floatingProxyAgentList = &self->_floatingProxyAgentList;

  objc_storeStrong((id *)p_floatingProxyAgentList, a3);
}

- (NSMutableDictionary)floatingProxyAgentList_TCPConverter
{
  return self->_floatingProxyAgentList_TCPConverter;
}

- (void)setFloatingProxyAgentList_TCPConverter:(id)a3
{
  p_floatingProxyAgentList_TCPConverter = &self->_floatingProxyAgentList_TCPConverter;

  objc_storeStrong((id *)p_floatingProxyAgentList_TCPConverter, a3);
}

- (NSMutableDictionary)floatingDNSAgentList
{
  return self->_floatingDNSAgentList;
}

- (void)setFloatingDNSAgentList:(id)a3
{
  p_floatingDNSAgentList = &self->_floatingDNSAgentList;

  objc_storeStrong((id *)p_floatingDNSAgentList, a3);
}

- (NSMutableDictionary)policyDB
{
  return self->_policyDB;
}

- (void)setPolicyDB:(id)a3
{
  p_policyDB = &self->_policyDB;

  objc_storeStrong((id *)p_policyDB, a3);
}

- (NEPolicySession)policySession
{
  return self->_policySession;
}

- (void)setPolicySession:(id)a3
{
  p_policySession = &self->_policySession;

  objc_storeStrong((id *)p_policySession, a3);
}

- (NEPolicySession)controlPolicySession
{
  return self->_controlPolicySession;
}

- (void)setControlPolicySession:(id)a3
{
  p_controlPolicySession = &self->_controlPolicySession;

  objc_storeStrong((id *)p_controlPolicySession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPolicySession, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_policyDB, 0);
  objc_storeStrong((id *)&self->_floatingDNSAgentList, 0);
  objc_storeStrong((id *)&self->_floatingProxyAgentList_TCPConverter, 0);
  objc_storeStrong((id *)&self->_floatingProxyAgentList, 0);

  objc_storeStrong((id *)&self->_controllerQueue, 0);
}

@end