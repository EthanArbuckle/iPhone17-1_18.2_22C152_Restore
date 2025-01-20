@interface NSPPrivacyProxyPolicyHandler
+ (id)sharedHandler;
- (BOOL)addPoliciesForMPTCPConverterProxy:(id)a3;
- (BOOL)addPoliciesForProbing;
- (BOOL)set:(id)a3 flowDivertHandle:(id)a4 inProcessFlowDivert:(BOOL)a5 ingressProxyURL:(id)a6 ingressFallbackProxyURL:(id)a7 exceptionBundleIDs:(id)a8 exceptionProcessPaths:(id)a9;
- (NSPPrivacyProxyPolicyHandler)init;
- (id)currentPolicy;
- (void)addNetworkDiscoveryProxyAgent:(id)a3 with:(id)a4;
- (void)addObliviousProxyAgent:(id)a3 processes:(id)a4 hostname:(id)a5;
- (void)addPreferredProxy:(id)a3 agentUUID:(id)a4 withDomainFilter:(id)a5;
- (void)addProxiedContentAgent:(id)a3 maps:(id)a4;
- (void)cellularDisabled:(BOOL)a3;
- (void)handleAppInstallation:(id)a3;
- (void)handleAppUninstallation:(id)a3;
- (void)interface:(id)a3 disabled:(BOOL)a4;
- (void)remove:(BOOL)a3;
- (void)removeObliviousProxyAgent:(id)a3 forHostname:(id)a4 apply:(BOOL)a5;
- (void)removePoliciesForMPTCPConverterProxy:(BOOL)a3;
- (void)removePreferredProxy:(id)a3 apply:(BOOL)a4;
- (void)removeProxiedContentAgent:(id)a3 apply:(BOOL)a4;
- (void)replaceDisabledInterfaces:(id)a3;
- (void)setCaptivePortalExceptionHostname:(id)a3;
- (void)wifiDisabled:(BOOL)a3;
@end

@implementation NSPPrivacyProxyPolicyHandler

- (NSPPrivacyProxyPolicyHandler)init
{
  v21.receiver = self;
  v21.super_class = (Class)NSPPrivacyProxyPolicyHandler;
  v2 = [(NSPPrivacyProxyPolicyHandler *)&v21 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_policy, 0);
    objc_storeStrong((id *)&v3->_flowDivertHandle, 0);
    v3->_inProcessFlowDivert = 0;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_mainPolicyIDs, v4);

    id v5 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_interfacePolicyIDs, v5);

    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_domainFilterPolicyIDs, v6);

    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_domainFilterIDs, v7);

    v8 = sub_10009B228((uint64_t)v3, @"nsp_privacy_proxy_policy_session", 300);
    objc_storeStrong((id *)&v3->_session, v8);

    v9 = sub_10009B228((uint64_t)v3, @"nsp_privacy_proxy_policy_control_session", 100);
    objc_storeStrong((id *)&v3->_controlSession, v9);

    id v10 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_safariTechnologyPreviewPolicyIDs, v10);

    id v11 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_safariBundlePolicyIDs, v11);

    id v12 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_mailAppPolicyIDs, v12);

    id v13 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_probePolicyIDs, v13);

    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_obliviousAgentPolicyIDs, v14);

    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_proxiedContentPolicyIDs, v15);

    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_networkSpecificProxyPolicyIDs, v16);

    id v17 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_proxiedContentNotifyFlags, v17);

    id v18 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_mptcpProxyPolicyIDs, v18);

    id v19 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_networkToolProxyPolicyIDs, v19);
  }
  return v3;
}

+ (id)sharedHandler
{
  if (qword_1001232C0 != -1) {
    dispatch_once(&qword_1001232C0, &stru_100106B60);
  }
  v2 = (void *)qword_1001232B8;

  return v2;
}

- (BOOL)set:(id)a3 flowDivertHandle:(id)a4 inProcessFlowDivert:(BOOL)a5 ingressProxyURL:(id)a6 ingressFallbackProxyURL:(id)a7 exceptionBundleIDs:(id)a8 exceptionProcessPaths:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v48 = a6;
  id v49 = a7;
  id v50 = a8;
  id v51 = a9;
  id v17 = self;
  objc_sync_enter(v17);
  v46 = v15;
  sub_100042FC0((uint64_t)v17, v15);
  v47 = v16;
  sub_10001089C((uint64_t)v17, v16);
  if (v17)
  {
    v17->_int inProcessFlowDivert = a5;
    objc_storeStrong((id *)&v17->_ingressProxyURL, a6);
    objc_storeStrong((id *)&v17->_ingressFallbackProxyURL, a7);
    objc_storeStrong((id *)&v17->_exceptionBundleIDs, a8);
    objc_storeStrong((id *)&v17->_exceptionProcessPaths, a9);
  }
  sub_10009B758((id *)&v17->super.isa);
  sub_10009BE10((id *)&v17->super.isa);
  sub_10009BF40((id *)&v17->super.isa);
  sub_10009C070((uint64_t)v17);
  [(NSPPrivacyProxyPolicyHandler *)v17 removePoliciesForMPTCPConverterProxy:0];
  sub_10009C1A4((id *)&v17->super.isa);
  if (v17)
  {
    policy = v17->_policy;
    int inProcessFlowDivert = v17->_inProcessFlowDivert;
    flowDivertHandle = v17->_flowDivertHandle;
    ingressProxyURL = v17->_ingressProxyURL;
    ingressFallbackProxyURL = v17->_ingressFallbackProxyURL;
    exceptionProcessPaths = v17->_exceptionProcessPaths;
    v24 = v17->_exceptionBundleIDs;
    v25 = ingressFallbackProxyURL;
    v26 = ingressProxyURL;
    v27 = flowDivertHandle;
    v28 = policy;
    v52 = sub_100089DF8((uint64_t)NSPPrivacyProxyPolicySerialization, v28, v27, inProcessFlowDivert, v26, v25, v24, exceptionProcessPaths);

    if (v52 && [v52 count])
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v29 = v52;
      id v30 = [v29 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v54;
        while (2)
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v54 != v31) {
              objc_enumerationMutation(v29);
            }
            v33 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            v34 = nplog_obj();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v58 = v17;
              __int16 v59 = 2112;
              id v60 = v33;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%@ adding policy %@", buf, 0x16u);
            }

            id v35 = [(NEPolicySession *)v17->_session addPolicy:v33];
            v36 = nplog_obj();
            v37 = v36;
            if (!v35)
            {
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v58 = v17;
                _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@ failed to add policy", buf, 0xCu);
              }

              goto LABEL_28;
            }
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v58 = v17;
              __int16 v59 = 2048;
              id v60 = v35;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%@ added policy %lu", buf, 0x16u);
            }

            v38 = v17->_mainPolicyIDs;
            v39 = +[NSNumber numberWithUnsignedInteger:v35];
            [(NSMutableArray *)v38 addObject:v39];
          }
          id v30 = [v29 countByEnumeratingWithState:&v53 objects:v61 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }

      if (sub_10009C9E8((void **)&v17->super.isa))
      {
        if (sub_10009CC78((uint64_t)v17))
        {
          if (sub_10009CF20((void **)&v17->super.isa))
          {
            if (sub_10009D24C((void **)&v17->super.isa))
            {

LABEL_31:
              session = v17->_session;
              goto LABEL_32;
            }
            sub_10009C1A4((id *)&v17->super.isa);
          }
          else
          {
            sub_10009C070((uint64_t)v17);
          }
        }
        else
        {
          sub_10009BF40((id *)&v17->super.isa);
        }
      }
      else
      {
        sub_10009BE10((id *)&v17->super.isa);
      }
    }
    else
    {
      v29 = nplog_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v17;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@ there are no privacy proxy policies to add", buf, 0xCu);
      }
LABEL_28:
    }
  }
  sub_10009B758((id *)&v17->super.isa);
  if (v17) {
    goto LABEL_31;
  }
  session = 0;
LABEL_32:
  v41 = session;
  unsigned int v42 = [(NEPolicySession *)v41 apply];

  if (v42)
  {
    v43 = +[NEFileHandleMaintainer sharedMaintainer];
    [v43 commit];

    v44 = nplog_obj();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v61 = 138412290;
      v62 = v17;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%@ sucessfully applied all the policies", v61, 0xCu);
    }
  }
  objc_sync_exit(v17);

  return v42;
}

- (void)remove:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  sub_10009B758((id *)&obj->super.isa);
  sub_10009BE10((id *)&obj->super.isa);
  sub_10009BF40((id *)&obj->super.isa);
  sub_10009C070((uint64_t)obj);
  sub_10009C1A4((id *)&obj->super.isa);
  if (v3)
  {
    if (obj)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v4 = obj->_probePolicyIDs;
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v68 objects:v72 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v69;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v69 != v6) {
              objc_enumerationMutation(v4);
            }
            v8 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            v9 = obj->_session;
            -[NEPolicySession removePolicyWithID:](v9, "removePolicyWithID:", [v8 unsignedIntegerValue]);
          }
          id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v68 objects:v72 count:16];
        }
        while (v5);
      }

      [(NSMutableArray *)obj->_probePolicyIDs removeAllObjects];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v10 = [(NSMutableDictionary *)obj->_domainFilterPolicyIDs allValues];
      id v11 = [v10 countByEnumeratingWithState:&v60 objects:v72 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v61;
        do
        {
          for (j = 0; j != v11; j = (char *)j + 1)
          {
            if (*(void *)v61 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v15 = v14;
            id v16 = [v15 countByEnumeratingWithState:&v56 objects:&v68 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v57;
              do
              {
                for (k = 0; k != v16; k = (char *)k + 1)
                {
                  if (*(void *)v57 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  id v19 = *(void **)(*((void *)&v56 + 1) + 8 * (void)k);
                  v20 = obj->_session;
                  -[NEPolicySession removePolicyWithID:](v20, "removePolicyWithID:", [v19 unsignedIntegerValue]);
                }
                id v16 = [v15 countByEnumeratingWithState:&v56 objects:&v68 count:16];
              }
              while (v16);
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v60 objects:v72 count:16];
        }
        while (v11);
      }

      [(NSMutableDictionary *)obj->_domainFilterPolicyIDs removeAllObjects];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      objc_super v21 = [(NSMutableDictionary *)obj->_domainFilterIDs allValues];
      id v22 = [v21 countByEnumeratingWithState:&v52 objects:&v64 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v53;
        do
        {
          for (m = 0; m != v22; m = (char *)m + 1)
          {
            if (*(void *)v53 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v52 + 1) + 8 * (void)m);
            v26 = obj->_session;
            -[NEPolicySession removeDomainFilterWithID:](v26, "removeDomainFilterWithID:", [v25 unsignedIntegerValue]);
          }
          id v22 = [v21 countByEnumeratingWithState:&v52 objects:&v64 count:16];
        }
        while (v22);
      }

      [(NSMutableDictionary *)obj->_domainFilterIDs removeAllObjects];
      if ([(NSMutableDictionary *)obj->_obliviousAgentPolicyIDs count])
      {
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        v27 = obj->_obliviousAgentPolicyIDs;
        id v28 = [(NSMutableDictionary *)v27 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v65;
          do
          {
            for (n = 0; n != v28; n = (char *)n + 1)
            {
              if (*(void *)v65 != v29) {
                objc_enumerationMutation(v27);
              }
              uint64_t v31 = *(void *)(*((void *)&v64 + 1) + 8 * (void)n);
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              v32 = [(NSMutableDictionary *)obj->_obliviousAgentPolicyIDs objectForKeyedSubscript:v31];
              id v33 = [v32 countByEnumeratingWithState:&v60 objects:&v68 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v61;
                do
                {
                  for (ii = 0; ii != v33; ii = (char *)ii + 1)
                  {
                    if (*(void *)v61 != v34) {
                      objc_enumerationMutation(v32);
                    }
                    v36 = *(void **)(*((void *)&v60 + 1) + 8 * (void)ii);
                    v37 = obj->_controlSession;
                    -[NEPolicySession removePolicyWithID:](v37, "removePolicyWithID:", [v36 unsignedIntegerValue]);
                  }
                  id v33 = [v32 countByEnumeratingWithState:&v60 objects:&v68 count:16];
                }
                while (v33);
              }
            }
            id v28 = [(NSMutableDictionary *)v27 countByEnumeratingWithState:&v64 objects:v72 count:16];
          }
          while (v28);
        }

        [(NSMutableDictionary *)obj->_obliviousAgentPolicyIDs removeAllObjects];
      }
      if ([(NSMutableDictionary *)obj->_proxiedContentPolicyIDs count])
      {
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        v38 = obj->_proxiedContentPolicyIDs;
        id v39 = [(NSMutableDictionary *)v38 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v65;
          do
          {
            for (jj = 0; jj != v39; jj = (char *)jj + 1)
            {
              if (*(void *)v65 != v40) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = *(void *)(*((void *)&v64 + 1) + 8 * (void)jj);
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              v43 = [(NSMutableDictionary *)obj->_proxiedContentPolicyIDs objectForKeyedSubscript:v42];
              id v44 = [v43 countByEnumeratingWithState:&v60 objects:&v68 count:16];
              if (v44)
              {
                uint64_t v45 = *(void *)v61;
                do
                {
                  for (kk = 0; kk != v44; kk = (char *)kk + 1)
                  {
                    if (*(void *)v61 != v45) {
                      objc_enumerationMutation(v43);
                    }
                    v47 = *(void **)(*((void *)&v60 + 1) + 8 * (void)kk);
                    id v48 = obj->_session;
                    -[NEPolicySession removePolicyWithID:](v48, "removePolicyWithID:", [v47 unsignedIntegerValue]);
                  }
                  id v44 = [v43 countByEnumeratingWithState:&v60 objects:&v68 count:16];
                }
                while (v44);
              }
            }
            id v39 = [(NSMutableDictionary *)v38 countByEnumeratingWithState:&v64 objects:v72 count:16];
          }
          while (v39);
        }

        [(NSMutableDictionary *)obj->_proxiedContentPolicyIDs removeAllObjects];
        [(NSMutableDictionary *)obj->_proxiedContentNotifyFlags removeAllObjects];
        sub_10009EF8C((id *)&obj->super.isa);
      }
    }
    [(NSPPrivacyProxyPolicyHandler *)obj removePoliciesForMPTCPConverterProxy:0];
  }
  if (obj) {
    session = obj->_session;
  }
  else {
    session = 0;
  }
  id v50 = session;
  [(NEPolicySession *)v50 apply];

  sub_100042FC0((uint64_t)obj, 0);
  sub_10001089C((uint64_t)obj, 0);
  if (obj) {
    obj->_int inProcessFlowDivert = 0;
  }
  objc_sync_exit(obj);
}

- (id)currentPolicy
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && (policy = v2->_policy) != 0)
  {
    id v4 = policy;
    id v5 = [(NSPPrivacyProxyPolicy *)v4 dictionaryRepresentation];
  }
  else
  {
    id v5 = 0;
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)addPreferredProxy:(id)a3 agentUUID:(id)a4 withDomainFilter:(id)a5
{
  id v8 = a3;
  id v35 = a4;
  id v36 = a5;
  v37 = v8;
  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    [(NSPPrivacyProxyPolicyHandler *)v9 removePreferredProxy:v8 apply:0];
    if (v9) {
      session = v9->_session;
    }
    else {
      session = 0;
    }
    id v11 = session;
    id v12 = [(NEPolicySession *)v11 addDomainFilterWithData:v36];

    if (v12)
    {
      id v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v45 = (const char *)v9;
        __int16 v46 = 1024;
        *(_DWORD *)v47 = v12;
        *(_WORD *)&v47[4] = 2112;
        *(void *)&v47[6] = v37;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ added domain filter %u for %@", buf, 0x1Cu);
      }

      id v14 = +[NSNumber numberWithUnsignedInteger:v12];
      if (v9) {
        domainFilterIDs = v9->_domainFilterIDs;
      }
      else {
        domainFilterIDs = 0;
      }
      id v16 = domainFilterIDs;
      [(NSMutableDictionary *)v16 setObject:v14 forKeyedSubscript:v37];

      uint64_t v17 = +[NSMutableArray array];
      sub_100089F00((uint64_t)NSPPrivacyProxyPolicySerialization, v35, (uint64_t)v12);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v18 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v40;
        do
        {
          v20 = 0;
          do
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v20);
            id v22 = nplog_obj();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v45 = (const char *)v9;
              __int16 v46 = 2112;
              *(void *)v47 = v21;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@ adding domain filter policy %@", buf, 0x16u);
            }

            if (v9) {
              uint64_t v23 = v9->_session;
            }
            else {
              uint64_t v23 = 0;
            }
            v24 = v23;
            id v25 = [(NEPolicySession *)v24 addPolicy:v21];

            if (v25)
            {
              v26 = nplog_obj();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v45 = (const char *)v9;
                __int16 v46 = 1024;
                *(_DWORD *)v47 = v25;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@ added domain filter policy %u", buf, 0x12u);
              }

              v27 = +[NSNumber numberWithUnsignedInteger:v25];
              [(NEPolicySession *)v17 addObject:v27];
            }
            else
            {
              v27 = nplog_obj();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v45 = (const char *)v9;
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@ failed to add domain filter policy", buf, 0xCu);
              }
            }

            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v28 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
          id v18 = v28;
        }
        while (v28);
      }

      if (v9) {
        domainFilterPolicyIDs = v9->_domainFilterPolicyIDs;
      }
      else {
        domainFilterPolicyIDs = 0;
      }
      id v30 = domainFilterPolicyIDs;
      [(NSMutableDictionary *)v30 setObject:v17 forKeyedSubscript:v37];

      if (v9) {
        uint64_t v31 = v9->_session;
      }
      else {
        uint64_t v31 = 0;
      }
      v32 = v31;
      [(NEPolicySession *)v32 apply];
    }
    else
    {
      id v33 = nplog_obj();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = (const char *)v9;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@ failed to add domain filter", buf, 0xCu);
      }

      if (v9) {
        uint64_t v34 = v9->_session;
      }
      else {
        uint64_t v34 = 0;
      }
      uint64_t v17 = v34;
      [(NEPolicySession *)v17 apply];
    }

    objc_sync_exit(v9);
  }
  else
  {
    nplog_obj();
    v9 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v45 = "-[NSPPrivacyProxyPolicyHandler addPreferredProxy:agentUUID:withDomainFilter:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v9->super, OS_LOG_TYPE_FAULT, "%s called with null proxyName", buf, 0xCu);
    }
  }
}

- (void)removePreferredProxy:(id)a3 apply:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    if (v7) {
      domainFilterPolicyIDs = v7->_domainFilterPolicyIDs;
    }
    else {
      domainFilterPolicyIDs = 0;
    }
    v9 = domainFilterPolicyIDs;
    id v10 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v6];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v11);
          }
          if (v7) {
            session = v7->_session;
          }
          else {
            session = 0;
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v14);
          uint64_t v17 = session;
          -[NEPolicySession removePolicyWithID:](v17, "removePolicyWithID:", [v16 unsignedIntegerValue]);

          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v18 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
        id v12 = v18;
      }
      while (v18);
    }

    if (v7) {
      uint64_t v19 = v7->_domainFilterPolicyIDs;
    }
    else {
      uint64_t v19 = 0;
    }
    v20 = v19;
    [(NSMutableDictionary *)v20 setObject:0 forKeyedSubscript:v6];

    if (v7) {
      domainFilterIDs = v7->_domainFilterIDs;
    }
    else {
      domainFilterIDs = 0;
    }
    id v22 = domainFilterIDs;
    uint64_t v23 = [(NSMutableDictionary *)v22 objectForKeyedSubscript:v6];

    if (v23)
    {
      if (v7) {
        v24 = v7->_session;
      }
      else {
        v24 = 0;
      }
      id v25 = v24;
      -[NEPolicySession removeDomainFilterWithID:](v25, "removeDomainFilterWithID:", [v23 unsignedIntegerValue]);

      if (v7) {
        v26 = v7->_domainFilterIDs;
      }
      else {
        v26 = 0;
      }
      v27 = v26;
      [(NSMutableDictionary *)v27 setObject:0 forKeyedSubscript:v6];
    }
    if (objc_msgSend(v11, "count", (void)v30) && v4)
    {
      if (v7) {
        id v28 = v7->_session;
      }
      else {
        id v28 = 0;
      }
      uint64_t v29 = v28;
      [(NEPolicySession *)v29 apply];
    }
    objc_sync_exit(v7);
  }
  else
  {
    nplog_obj();
    id v7 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v36 = "-[NSPPrivacyProxyPolicyHandler removePreferredProxy:apply:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_FAULT, "%s called with null proxyName", buf, 0xCu);
    }
  }
}

- (void)wifiDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj)
  {
    if (obj->_wifiDisabled == v3) {
      goto LABEL_5;
    }
    obj->_wifiDisabled = v3;
    goto LABEL_4;
  }
  if (v3) {
LABEL_4:
  }
    sub_10009DE64(obj);
LABEL_5:
  objc_sync_exit(obj);
}

- (void)cellularDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj)
  {
    if (obj->_cellularDisabled == v3) {
      goto LABEL_5;
    }
    obj->_cellularDisabled = v3;
    goto LABEL_4;
  }
  if (v3) {
LABEL_4:
  }
    sub_10009DE64(obj);
LABEL_5:
  objc_sync_exit(obj);
}

- (void)interface:(id)a3 disabled:(BOOL)a4
{
  id v16 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  if (a4)
  {
    if (v6 && v6->_disabledInterfaces
      || (id v7 = objc_alloc_init((Class)NSMutableSet), sub_1000273A4((uint64_t)v6, v7), v7, v6))
    {
      char v8 = 0;
      disabledInterfaces = v6->_disabledInterfaces;
    }
    else
    {
      disabledInterfaces = 0;
      char v8 = 1;
    }
    id v10 = disabledInterfaces;
    unsigned __int8 v11 = [(NSMutableSet *)v10 containsObject:v16];

    if ((v11 & 1) == 0)
    {
      if (v8) {
        id v12 = 0;
      }
      else {
        id v12 = v6->_disabledInterfaces;
      }
      uint64_t v13 = v12;
      [(NSMutableSet *)v13 addObject:v16];
      goto LABEL_14;
    }
  }
  else if (v6)
  {
    if (v6->_disabledInterfaces)
    {
      id v14 = v6->_disabledInterfaces;
      unsigned int v15 = [(NSMutableSet *)v14 containsObject:v16];

      if (v15)
      {
        uint64_t v13 = v6->_disabledInterfaces;
        [(NSMutableSet *)v13 removeObject:v16];
LABEL_14:

        sub_10009DE64(v6);
      }
    }
  }
  objc_sync_exit(v6);
}

- (void)replaceDisabledInterfaces:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([v4 count])
  {
    id v6 = objc_alloc_init((Class)NSMutableSet);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          [v6 addObject:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10), (void)v14];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    if (v5) {
      disabledInterfaces = v5->_disabledInterfaces;
    }
    else {
      disabledInterfaces = 0;
    }
  }
  else
  {
    id v6 = 0;
    if (!v5) {
      goto LABEL_15;
    }
    disabledInterfaces = v5->_disabledInterfaces;
    if (!disabledInterfaces) {
      goto LABEL_15;
    }
  }
  id v12 = disabledInterfaces;
  unsigned __int8 v13 = [(NSMutableSet *)v12 isEqualToSet:v6];

  if ((v13 & 1) == 0)
  {
    sub_1000273A4((uint64_t)v5, v6);
    sub_10009DE64(v5);
  }
LABEL_15:

  objc_sync_exit(v5);
}

- (void)setCaptivePortalExceptionHostname:(id)a3
{
  unsigned __int8 v11 = (NSString *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5)
  {
    id v6 = v5->_captiveNetworkExceptionHostname;
    id v7 = v11;
    if (v6 != v11)
    {
      captiveNetworkExceptionHostname = v5->_captiveNetworkExceptionHostname;
      goto LABEL_4;
    }
LABEL_10:

    goto LABEL_11;
  }
  id v7 = v11;
  if (!v11) {
    goto LABEL_10;
  }
  id v6 = 0;
  captiveNetworkExceptionHostname = 0;
LABEL_4:
  uint64_t v9 = captiveNetworkExceptionHostname;
  unsigned __int8 v10 = [(NSString *)v9 isEqualToString:v11];

  if ((v10 & 1) == 0)
  {
    if (v5) {
      objc_storeStrong((id *)&v5->_captiveNetworkExceptionHostname, a3);
    }
    sub_10009DE64(v5);
  }
LABEL_11:
  objc_sync_exit(v5);
}

- (void)addObliviousProxyAgent:(id)a3 processes:(id)a4 hostname:(id)a5
{
  id v8 = a3;
  id v33 = a4;
  id v9 = a5;
  long long v31 = v8;
  long long v32 = v9;
  if (!v8)
  {
    nplog_obj();
    unsigned __int8 v11 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v11->super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    long long v39 = "-[NSPPrivacyProxyPolicyHandler addObliviousProxyAgent:processes:hostname:]";
    long long v30 = "%s called with null agentUUID";
LABEL_32:
    _os_log_fault_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_FAULT, v30, buf, 0xCu);
    goto LABEL_27;
  }
  unsigned __int8 v10 = v9;
  if (!v9)
  {
    nplog_obj();
    unsigned __int8 v11 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v11->super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    long long v39 = "-[NSPPrivacyProxyPolicyHandler addObliviousProxyAgent:processes:hostname:]";
    long long v30 = "%s called with null hostname";
    goto LABEL_32;
  }
  unsigned __int8 v11 = self;
  objc_sync_enter(v11);
  [(NSPPrivacyProxyPolicyHandler *)v11 removeObliviousProxyAgent:v8 forHostname:v10 apply:0];
  id v12 = +[NSMutableArray array];
  sub_10008AE0C((uint64_t)NSPPrivacyProxyPolicySerialization, v10, v33, v8);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v16);
        id v18 = nplog_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          long long v39 = (const char *)v11;
          __int16 v40 = 2112;
          uint64_t v41 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ adding oblivious agent policy %@", buf, 0x16u);
        }

        if (v11) {
          controlSession = v11->_controlSession;
        }
        else {
          controlSession = 0;
        }
        v20 = controlSession;
        id v21 = [(NEPolicySession *)v20 addPolicy:v17];

        if (v21)
        {
          id v22 = nplog_obj();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            long long v39 = (const char *)v11;
            __int16 v40 = 1024;
            LODWORD(v41) = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@ added oblivious agent policy %u", buf, 0x12u);
          }

          uint64_t v23 = +[NSNumber numberWithUnsignedInteger:v21];
          [v12 addObject:v23];
        }
        else
        {
          uint64_t v23 = nplog_obj();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v39 = (const char *)v11;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@ failed to add oblivious agent policy", buf, 0xCu);
          }
        }

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v24 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
      id v14 = v24;
    }
    while (v24);
  }

  id v25 = +[NSString stringWithFormat:@"%@-%@", v32, v31];
  if (v11) {
    obliviousAgentPolicyIDs = v11->_obliviousAgentPolicyIDs;
  }
  else {
    obliviousAgentPolicyIDs = 0;
  }
  v27 = obliviousAgentPolicyIDs;
  [(NSMutableDictionary *)v27 setObject:v12 forKeyedSubscript:v25];

  if (v11) {
    id v28 = v11->_controlSession;
  }
  else {
    id v28 = 0;
  }
  uint64_t v29 = v28;
  [(NEPolicySession *)v29 apply];

  objc_sync_exit(v11);
LABEL_27:
}

- (void)removeObliviousProxyAgent:(id)a3 forHostname:(id)a4 apply:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    unsigned __int8 v10 = self;
    objc_sync_enter(v10);
    unsigned __int8 v11 = +[NSString stringWithFormat:@"%@-%@", v9, v8];
    BOOL v28 = v5;
    if (v10) {
      obliviousAgentPolicyIDs = v10->_obliviousAgentPolicyIDs;
    }
    else {
      obliviousAgentPolicyIDs = 0;
    }
    id v13 = obliviousAgentPolicyIDs;
    id v14 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v11];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v30;
      do
      {
        id v18 = 0;
        do
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v15);
          }
          if (v10) {
            controlSession = v10->_controlSession;
          }
          else {
            controlSession = 0;
          }
          v20 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v18);
          id v21 = controlSession;
          -[NEPolicySession removePolicyWithID:](v21, "removePolicyWithID:", [v20 unsignedIntegerValue]);

          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v22 = [v15 countByEnumeratingWithState:&v29 objects:v39 count:16];
        id v16 = v22;
      }
      while (v22);
    }

    if (v10) {
      uint64_t v23 = v10->_obliviousAgentPolicyIDs;
    }
    else {
      uint64_t v23 = 0;
    }
    id v24 = v23;
    [(NSMutableDictionary *)v24 setObject:0 forKeyedSubscript:v11];

    if ([v15 count] && v28)
    {
      if (v10) {
        id v25 = v10->_controlSession;
      }
      else {
        id v25 = 0;
      }
      v26 = v25;
      [(NEPolicySession *)v26 apply];
    }
    v27 = nplog_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      long long v34 = (const char *)v10;
      __int16 v35 = 2112;
      id v36 = v9;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ removed oblivious agent policies for %@ (%@)", buf, 0x20u);
    }

    objc_sync_exit(v10);
  }
  else
  {
    nplog_obj();
    unsigned __int8 v10 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v34 = "-[NSPPrivacyProxyPolicyHandler removeObliviousProxyAgent:forHostname:apply:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v10->super, OS_LOG_TYPE_FAULT, "%s called with null hostname", buf, 0xCu);
    }
  }
}

- (void)addNetworkDiscoveryProxyAgent:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  __int16 v37 = v6;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    if (v7 && [(NSMutableDictionary *)v7->_networkSpecificProxyPolicyIDs count])
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v7->_networkSpecificProxyPolicyIDs;
      id v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v47 objects:buf count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v48;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v48 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v12 = [(NSMutableDictionary *)v7->_networkSpecificProxyPolicyIDs objectForKeyedSubscript:v11];
            id v13 = [v12 countByEnumeratingWithState:&v43 objects:v52 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v44;
              do
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(void *)v44 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  id v16 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
                  uint64_t v17 = v7->_session;
                  -[NEPolicySession removePolicyWithID:](v17, "removePolicyWithID:", [v16 unsignedIntegerValue]);
                }
                id v13 = [v12 countByEnumeratingWithState:&v43 objects:v52 count:16];
              }
              while (v13);
            }
          }
          id v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v47 objects:buf count:16];
        }
        while (v8);
      }

      [(NSMutableDictionary *)v7->_networkSpecificProxyPolicyIDs removeAllObjects];
    }
    id v18 = +[NSMutableArray array];
    sub_10008A158((uint64_t)NSPPrivacyProxyPolicySerialization, v37, v36);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = [v19 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v40;
      do
      {
        id v22 = 0;
        do
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v22);
          id v24 = nplog_obj();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            long long v54 = (const char *)v7;
            __int16 v55 = 2112;
            uint64_t v56 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@ adding network based proxy policy %@", buf, 0x16u);
          }

          if (v7) {
            session = v7->_session;
          }
          else {
            session = 0;
          }
          v26 = session;
          id v27 = [(NEPolicySession *)v26 addPolicy:v23];

          if (v27)
          {
            BOOL v28 = nplog_obj();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v54 = (const char *)v7;
              __int16 v55 = 1024;
              LODWORD(v56) = v27;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ added network based proxy policy %u", buf, 0x12u);
            }

            long long v29 = +[NSNumber numberWithUnsignedInteger:v27];
            [v18 addObject:v29];
          }
          else
          {
            long long v29 = nplog_obj();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v54 = (const char *)v7;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@ failed to add network based proxy policy", buf, 0xCu);
            }
          }

          id v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v30 = [v19 countByEnumeratingWithState:&v39 objects:v51 count:16];
        id v20 = v30;
      }
      while (v30);
    }

    long long v31 = [v37 UUIDString];
    if (v7) {
      networkSpecificProxyPolicyIDs = v7->_networkSpecificProxyPolicyIDs;
    }
    else {
      networkSpecificProxyPolicyIDs = 0;
    }
    id v33 = networkSpecificProxyPolicyIDs;
    [(NSMutableDictionary *)v33 setObject:v18 forKeyedSubscript:v31];

    if (v7) {
      long long v34 = v7->_session;
    }
    else {
      long long v34 = 0;
    }
    __int16 v35 = v34;
    [(NEPolicySession *)v35 apply];

    objc_sync_exit(v7);
  }
  else
  {
    nplog_obj();
    id v7 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v54 = "-[NSPPrivacyProxyPolicyHandler addNetworkDiscoveryProxyAgent:with:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_FAULT, "%s called with null agentUUID", buf, 0xCu);
    }
  }
}

- (void)addProxiedContentAgent:(id)a3 maps:(id)a4
{
  id v6 = a3;
  id v38 = a4;
  long long v39 = v6;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    [(NSPPrivacyProxyPolicyHandler *)v7 removeProxiedContentAgent:v6 apply:0];
    long long v42 = +[NSMutableArray array];
    sub_10008B6D8((uint64_t)NSPPrivacyProxyPolicySerialization, v6, v38);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v53;
      do
      {
        unsigned __int8 v10 = 0;
        do
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v52 + 1) + 8 * (void)v10);
          id v12 = nplog_obj();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            long long v59 = (const char *)v7;
            __int16 v60 = 2112;
            uint64_t v61 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ adding proxied content policy %@", buf, 0x16u);
          }

          if (v7) {
            session = v7->_session;
          }
          else {
            session = 0;
          }
          uint64_t v14 = session;
          id v15 = [(NEPolicySession *)v14 addPolicy:v11];

          if (v15)
          {
            id v16 = nplog_obj();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              long long v59 = (const char *)v7;
              __int16 v60 = 1024;
              LODWORD(v61) = v15;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@ added proxied content policy %u", buf, 0x12u);
            }

            uint64_t v17 = +[NSNumber numberWithUnsignedInteger:v15];
            [v42 addObject:v17];
          }
          else
          {
            uint64_t v17 = nplog_obj();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v59 = (const char *)v7;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ failed to add proxied content policy", buf, 0xCu);
            }
          }

          unsigned __int8 v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v18 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
        id v8 = v18;
      }
      while (v18);
    }

    __int16 v37 = [v39 UUIDString];
    if (v7) {
      proxiedContentPolicyIDs = v7->_proxiedContentPolicyIDs;
    }
    else {
      proxiedContentPolicyIDs = 0;
    }
    id v20 = proxiedContentPolicyIDs;
    [(NSMutableDictionary *)v20 setObject:v42 forKeyedSubscript:v37];

    if (v7) {
      uint64_t v21 = v7->_session;
    }
    else {
      uint64_t v21 = 0;
    }
    id v22 = v21;
    [(NEPolicySession *)v22 apply];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v40 = v38;
    id v23 = [v40 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v23)
    {
      uint64_t v24 = 0;
      uint64_t v43 = *(void *)v49;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v49 != v43) {
            objc_enumerationMutation(v40);
          }
          v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if ([v26 supportsReverseProxying])
          {
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v27 = [v26 processes];
            id v28 = [v27 countByEnumeratingWithState:&v44 objects:v56 count:16];
            if (v28)
            {
              uint64_t v29 = *(void *)v45;
              do
              {
                for (j = 0; j != v28; j = (char *)j + 1)
                {
                  if (*(void *)v45 != v29) {
                    objc_enumerationMutation(v27);
                  }
                  long long v31 = [&off_10010FDD0 objectForKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * (void)j)];
                  long long v32 = v31;
                  if (v31) {
                    v24 |= (unint64_t)[v31 unsignedLongLongValue];
                  }
                }
                id v28 = [v27 countByEnumeratingWithState:&v44 objects:v56 count:16];
              }
              while (v28);
            }
          }
        }
        id v23 = [v40 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v23);

      if (v24)
      {
        id v33 = +[NSNumber numberWithUnsignedLongLong:v24];
        if (v7) {
          proxiedContentNotifyFlags = v7->_proxiedContentNotifyFlags;
        }
        else {
          proxiedContentNotifyFlags = 0;
        }
        __int16 v35 = proxiedContentNotifyFlags;
        [(NSMutableDictionary *)v35 setObject:v33 forKeyedSubscript:v37];

LABEL_51:
        sub_10009EF8C((id *)&v7->super.isa);

        objc_sync_exit(v7);
        goto LABEL_52;
      }
    }
    else
    {
    }
    if (v7) {
      id v36 = v7->_proxiedContentNotifyFlags;
    }
    else {
      id v36 = 0;
    }
    id v33 = v36;
    [(NSMutableDictionary *)v33 setObject:0 forKeyedSubscript:v37];
    goto LABEL_51;
  }
  nplog_obj();
  id v7 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v59 = "-[NSPPrivacyProxyPolicyHandler addProxiedContentAgent:maps:]";
    _os_log_fault_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_FAULT, "%s called with null agentUUID", buf, 0xCu);
  }
LABEL_52:
}

- (void)removeProxiedContentAgent:(id)a3 apply:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    id v8 = [v6 UUIDString];
    if (v7) {
      proxiedContentPolicyIDs = v7->_proxiedContentPolicyIDs;
    }
    else {
      proxiedContentPolicyIDs = 0;
    }
    unsigned __int8 v10 = proxiedContentPolicyIDs;
    uint64_t v11 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v8];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v12);
          }
          if (v7) {
            session = v7->_session;
          }
          else {
            session = 0;
          }
          uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v15);
          id v18 = session;
          [v18 removePolicyWithID:[v17 unsignedIntegerValue]];

          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v19 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
        id v13 = v19;
      }
      while (v19);
    }

    if (v7) {
      id v20 = v7->_proxiedContentPolicyIDs;
    }
    else {
      id v20 = 0;
    }
    uint64_t v21 = v20;
    [(NSMutableDictionary *)v21 setObject:0 forKeyedSubscript:v8];

    if (v7) {
      proxiedContentNotifyFlags = v7->_proxiedContentNotifyFlags;
    }
    else {
      proxiedContentNotifyFlags = 0;
    }
    id v23 = proxiedContentNotifyFlags;
    [(NSMutableDictionary *)v23 setObject:0 forKeyedSubscript:v8];

    if ([v12 count] && v4)
    {
      if (v7) {
        uint64_t v24 = v7->_session;
      }
      else {
        uint64_t v24 = 0;
      }
      id v25 = v24;
      [(NEPolicySession *)v25 apply];
    }
    sub_10009EF8C((id *)&v7->super.isa);

    objc_sync_exit(v7);
  }
  else
  {
    nplog_obj();
    id v7 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v32 = "-[NSPPrivacyProxyPolicyHandler removeProxiedContentAgent:apply:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_FAULT, "%s called with null agentUUID", buf, 0xCu);
    }
  }
}

- (BOOL)addPoliciesForProbing
{
  sub_10008CF08();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v23;
    *(void *)&long long v5 = 138412546;
    long long v21 = v5;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v8);
        unsigned __int8 v10 = nplog_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v21;
          long long v27 = self;
          __int16 v28 = 2112;
          id v29 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ adding probe policy %@", buf, 0x16u);
        }

        if (self) {
          session = self->_session;
        }
        else {
          session = 0;
        }
        id v12 = -[NEPolicySession addPolicy:](session, "addPolicy:", v9, v21, (void)v22);
        id v13 = nplog_obj();
        uint64_t v14 = v13;
        if (!v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v27 = self;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ failed to add probe policy", buf, 0xCu);
          }

          BOOL v19 = 0;
          goto LABEL_24;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v21;
          long long v27 = self;
          __int16 v28 = 2048;
          id v29 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ added probe policy %lu", buf, 0x16u);
        }

        if (self) {
          probePolicyIDs = self->_probePolicyIDs;
        }
        else {
          probePolicyIDs = 0;
        }
        id v16 = probePolicyIDs;
        uint64_t v17 = +[NSNumber numberWithUnsignedInteger:v12];
        [(NSMutableArray *)v16 addObject:v17];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v18 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
      id v6 = v18;
      if (v18) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_24:

  return v19;
}

- (void)handleAppInstallation:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  objc_sync_enter(v5);
  if (![v4 containsObject:@"com.apple.SafariTechnologyPreview"]) {
    goto LABEL_14;
  }
  if (v5) {
    safariTechnologyPreviewPolicyIDs = v5->_safariTechnologyPreviewPolicyIDs;
  }
  else {
    safariTechnologyPreviewPolicyIDs = 0;
  }
  uint64_t v7 = safariTechnologyPreviewPolicyIDs;
  id v8 = [(NSMutableArray *)v7 count];

  if (!v8)
  {
    uint64_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412546;
      long long v24 = v5;
      __int16 v25 = 2112;
      CFStringRef v26 = @"com.apple.SafariTechnologyPreview";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ adding policies for '%@'", (uint8_t *)&v23, 0x16u);
    }

    if (sub_10009C9E8((void **)&v5->super.isa))
    {
      unsigned __int8 v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412546;
        long long v24 = v5;
        __int16 v25 = 2112;
        CFStringRef v26 = @"com.apple.SafariTechnologyPreview";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ successfully added policies for '%@'", (uint8_t *)&v23, 0x16u);
      }

      int v11 = 1;
LABEL_15:
      if ([v4 containsObject:@"com.apple.mobilesafari"])
      {
        sub_10009BF40((id *)&v5->super.isa);
        id v13 = nplog_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v23 = 138412290;
          long long v24 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ adding policies for Safari Bundles", (uint8_t *)&v23, 0xCu);
        }

        if (sub_10009CC78((uint64_t)v5))
        {
          uint64_t v14 = nplog_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v23 = 138412290;
            long long v24 = v5;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ successfully added policies for Safari Bundles", (uint8_t *)&v23, 0xCu);
          }

          int v11 = 1;
        }
        else
        {
          id v15 = nplog_obj();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v23 = 138412290;
            long long v24 = v5;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ failed to add policies for Safari Bundles", (uint8_t *)&v23, 0xCu);
          }

          sub_10009BF40((id *)&v5->super.isa);
        }
      }
      if ([v4 containsObject:@"com.apple.mobilemail"])
      {
        id v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412546;
          long long v24 = v5;
          __int16 v25 = 2112;
          CFStringRef v26 = @"com.apple.mobilemail";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ '%@' was installed", (uint8_t *)&v23, 0x16u);
        }

        int v17 = sub_10009C070((uint64_t)v5);
        id v18 = nplog_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412290;
          long long v24 = v5;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ adding policies for Mail App", (uint8_t *)&v23, 0xCu);
        }

        if (sub_10009CF20((void **)&v5->super.isa))
        {
          BOOL v19 = nplog_obj();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = 138412290;
            long long v24 = v5;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ successfully added policies for Mail App", (uint8_t *)&v23, 0xCu);
          }

LABEL_38:
          if (v5) {
            session = v5->_session;
          }
          else {
            session = 0;
          }
          long long v22 = session;
          [(NEPolicySession *)v22 apply];

          goto LABEL_41;
        }
        id v20 = nplog_obj();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v23 = 138412290;
          long long v24 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@ failed to add policies for Mail App", (uint8_t *)&v23, 0xCu);
        }

        sub_10009C070((uint64_t)v5);
        v11 |= v17;
      }
      if (!v11) {
        goto LABEL_41;
      }
      goto LABEL_38;
    }
    id v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412546;
      long long v24 = v5;
      __int16 v25 = 2112;
      CFStringRef v26 = @"com.apple.SafariTechnologyPreview";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ failed to add policies for '%@'", (uint8_t *)&v23, 0x16u);
    }

    sub_10009BE10((id *)&v5->super.isa);
LABEL_14:
    int v11 = 0;
    goto LABEL_15;
  }
LABEL_41:
  objc_sync_exit(v5);
}

- (void)handleAppUninstallation:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = [v4 containsObject:@"com.apple.SafariTechnologyPreview"];
  if (v6)
  {
    uint64_t v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      CFStringRef v17 = @"com.apple.SafariTechnologyPreview";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ removing policies for '%@'", (uint8_t *)&v14, 0x16u);
    }

    sub_10009BE10((id *)&v5->super.isa);
  }
  if ([v4 containsObject:@"com.apple.mobilesafari"])
  {
    sub_10009BF40((id *)&v5->super.isa);
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ adding policies for Safari Bundles", (uint8_t *)&v14, 0xCu);
    }

    if (sub_10009CC78((uint64_t)v5))
    {
      uint64_t v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ successfully added policies for Safari Bundles", (uint8_t *)&v14, 0xCu);
      }

      unsigned int v6 = 1;
    }
    else
    {
      unsigned __int8 v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ failed to add policies for Safari Bundles", (uint8_t *)&v14, 0xCu);
      }

      sub_10009BF40((id *)&v5->super.isa);
    }
  }
  if (![v4 containsObject:@"com.apple.mobilemail"])
  {
    if (!v6) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  int v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    CFStringRef v17 = @"com.apple.mobilemail";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ '%@' was uninstalled", (uint8_t *)&v14, 0x16u);
  }

  if ((sub_10009C070((uint64_t)v5) | v6))
  {
LABEL_21:
    if (v5) {
      session = v5->_session;
    }
    else {
      session = 0;
    }
    id v13 = session;
    [(NEPolicySession *)v13 apply];
  }
LABEL_24:
  objc_sync_exit(v5);
}

- (BOOL)addPoliciesForMPTCPConverterProxy:(id)a3
{
  id v4 = a3;
  if (self) {
    mptcpProxyPolicyIDs = self->_mptcpProxyPolicyIDs;
  }
  else {
    mptcpProxyPolicyIDs = 0;
  }
  if ([(NSMutableArray *)mptcpProxyPolicyIDs count])
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    id v24 = v4;
    sub_10008D1C0((uint64_t)NSPPrivacyProxyPolicySerialization, v4);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      while (2)
      {
        int v11 = 0;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v11);
          id v13 = nplog_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v30 = self;
            __int16 v31 = 2112;
            id v32 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ adding MPTCP converter proxy policy %@", buf, 0x16u);
          }

          if (self) {
            session = self->_session;
          }
          else {
            session = 0;
          }
          id v15 = [(NEPolicySession *)session addPolicy:v12];
          __int16 v16 = nplog_obj();
          CFStringRef v17 = v16;
          if (!v15)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v30 = self;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ failed to add MPTCP converter proxy policy", buf, 0xCu);
            }

            unsigned __int8 v6 = 0;
            goto LABEL_30;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v30 = self;
            __int16 v31 = 2048;
            id v32 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ added MPTCP converter proxy policy %lu", buf, 0x16u);
          }

          if (self) {
            id v18 = self->_mptcpProxyPolicyIDs;
          }
          else {
            id v18 = 0;
          }
          BOOL v19 = v18;
          id v20 = +[NSNumber numberWithUnsignedInteger:v15];
          [(NSMutableArray *)v19 addObject:v20];

          int v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v21 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        id v9 = v21;
        if (v21) {
          continue;
        }
        break;
      }
    }

    if (self) {
      long long v22 = self->_session;
    }
    else {
      long long v22 = 0;
    }
    unsigned __int8 v6 = [(NEPolicySession *)v22 apply];
LABEL_30:
    id v4 = v24;
  }
  return v6;
}

- (void)removePoliciesForMPTCPConverterProxy:(BOOL)a3
{
  BOOL v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (self) {
    mptcpProxyPolicyIDs = self->_mptcpProxyPolicyIDs;
  }
  else {
    mptcpProxyPolicyIDs = 0;
  }
  unsigned __int8 v6 = mptcpProxyPolicyIDs;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v10);
        if (self) {
          session = self->_session;
        }
        else {
          session = 0;
        }
        id v13 = session;
        -[NEPolicySession removePolicyWithID:](v13, "removePolicyWithID:", [v11 unsignedIntegerValue]);

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v14 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v8 = v14;
    }
    while (v14);
  }

  if (v3)
  {
    if (self) {
      id v15 = self->_session;
    }
    else {
      id v15 = 0;
    }
    [(NEPolicySession *)v15 apply];
  }
  if (self) {
    __int16 v16 = self->_mptcpProxyPolicyIDs;
  }
  else {
    __int16 v16 = 0;
  }
  [(NSMutableArray *)v16 removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkToolProxyPolicyIDs, 0);
  objc_storeStrong((id *)&self->_mptcpProxyPolicyIDs, 0);
  objc_storeStrong((id *)&self->_proxiedContentNotifyFlags, 0);
  objc_storeStrong((id *)&self->_networkSpecificProxyPolicyIDs, 0);
  objc_storeStrong((id *)&self->_proxiedContentPolicyIDs, 0);
  objc_storeStrong((id *)&self->_obliviousAgentPolicyIDs, 0);
  objc_storeStrong((id *)&self->_domainFilterIDs, 0);
  objc_storeStrong((id *)&self->_domainFilterPolicyIDs, 0);
  objc_storeStrong((id *)&self->_probePolicyIDs, 0);
  objc_storeStrong((id *)&self->_mailAppPolicyIDs, 0);
  objc_storeStrong((id *)&self->_safariBundlePolicyIDs, 0);
  objc_storeStrong((id *)&self->_safariTechnologyPreviewPolicyIDs, 0);
  objc_storeStrong((id *)&self->_interfacePolicyIDs, 0);
  objc_storeStrong((id *)&self->_captiveNetworkExceptionHostname, 0);
  objc_storeStrong((id *)&self->_disabledInterfaces, 0);
  objc_storeStrong((id *)&self->_mainPolicyIDs, 0);
  objc_storeStrong((id *)&self->_exceptionProcessPaths, 0);
  objc_storeStrong((id *)&self->_exceptionBundleIDs, 0);
  objc_storeStrong((id *)&self->_ingressFallbackProxyURL, 0);
  objc_storeStrong((id *)&self->_ingressProxyURL, 0);
  objc_storeStrong((id *)&self->_flowDivertHandle, 0);
  objc_storeStrong((id *)&self->_controlSession, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_policy, 0);
}

@end