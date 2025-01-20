@interface QoSMarkingController
+ (id)sharedController;
- (BOOL)qosMarkingIsAppleAudioVideoCallsEnabled:(id)a3;
- (BOOL)qosMarkingIsEnabled:(id)a3;
- (BOOL)qosMarkingPolicyEnabled:(id)a3 forKey:(id)a4;
- (NSArray)interfaces;
- (NSMutableDictionary)enabled;
- (NSMutableDictionary)enabledAV;
- (NSMutableDictionary)policySessions;
- (NSMutableDictionary)requested;
- (QoSMarkingController)init;
- (id)createPolicySession;
- (id)qosMarkingAllowListAppIdentifiers:(id)a3;
- (void)addAllowListAppIdentifierPolicy:(id)a3 forApp:(id)a4 order:(unsigned int)a5;
- (void)addAllowListPathPolicy:(id)a3 forPath:(id)a4 order:(unsigned int)a5;
- (void)setEnabled:(id)a3;
- (void)setEnabledAV:(id)a3;
- (void)setInterfaces:(id)a3;
- (void)setPolicy:(id)a3 forInterface:(id)a4;
- (void)setPolicySessions:(id)a3;
- (void)setRequested:(id)a3;
- (void)updatePolicy:(id)a3 forInterface:(id)a4;
@end

@implementation QoSMarkingController

- (id)createPolicySession
{
  id v2 = objc_alloc_init((Class)NEPolicySession);

  return v2;
}

- (BOOL)qosMarkingPolicyEnabled:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  v6 = [a3 objectForKeyedSubscript:v5];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v7 = [v6 BOOLValue];
    }
    else
    {
      v8 = sub_100061028();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        memset(v12, 0, sizeof(v12));
        os_log_type_enabled(v8, v9);
        v10 = (_OWORD *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v10 != v12) {
          free(v10);
        }
      }

      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (BOOL)qosMarkingIsEnabled:(id)a3
{
  uint64_t v3 = kSCPropNetQoSMarkingEnabled;

  return [(QoSMarkingController *)self qosMarkingPolicyEnabled:a3 forKey:v3];
}

- (BOOL)qosMarkingIsAppleAudioVideoCallsEnabled:(id)a3
{
  uint64_t v3 = kSCPropNetQoSMarkingAppleAudioVideoCalls;

  return [(QoSMarkingController *)self qosMarkingPolicyEnabled:a3 forKey:v3];
}

- (id)qosMarkingAllowListAppIdentifiers:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:kSCPropNetQoSMarkingAllowListAppIdentifiers];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = sub_100061028();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v36 = 0u;
      long long v37 = 0u;
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
      os_log_type_enabled(v4, v14);
      v15 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v15 != &v22) {
        free(v15);
      }
    }
LABEL_21:

    v10 = 0;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          os_log_type_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (v9)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || ![v9 length])
            {
              v11 = sub_100061028();
              os_log_type_t v12 = _SC_syslog_os_log_mapping();
              if (__SC_log_enabled())
              {
                long long v36 = 0u;
                long long v37 = 0u;
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
                os_log_type_enabled(v11, v12);
                v13 = (long long *)_os_log_send_and_compose_impl();
                __SC_log_send2();
                if (v13 != &v22) {
                  free(v13);
                }
              }

              goto LABEL_21;
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    v10 = v4;
  }

  return v10;
}

- (void)addAllowListPathPolicy:(id)a3 forPath:(id)a4 order:(unsigned int)a5
{
  id v7 = a3;
  id v8 = a4;
  v45 = [(NSMutableDictionary *)self->_policySessions objectForKeyedSubscript:v7];
  if (v45)
  {
    os_log_type_t v9 = +[NEPolicyRouteRule routeRuleWithAction:3 forInterfaceName:v7];
    v57 = v9;
    v10 = +[NSArray arrayWithObjects:&v57 count:1];
    v44 = +[NEPolicyResult routeRules:v10];

    v11 = +[NEPolicyCondition allInterfaces];
    id v12 = +[NEProcessInfo copyUUIDsForExecutable:v8];
    v13 = v12;
    v42 = v11;
    if (v12 && [v12 count])
    {
      v38 = v9;
      id v40 = v8;
      id v41 = v7;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = v13;
      id v14 = [obj countByEnumeratingWithState:&v53 objects:v52 count:16];
      if (!v14) {
        goto LABEL_19;
      }
      id v15 = v14;
      uint64_t v43 = *(void *)v54;
      while (1)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v54 != v43) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          long long v18 = +[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v17, v36, v37);
          id v19 = objc_alloc((Class)NEPolicy);
          v51[0] = v18;
          v51[1] = v11;
          long long v20 = +[NSArray arrayWithObjects:v51 count:2];
          id v21 = [v19 initWithOrder:a5 result:v44 conditions:v20];

          id v22 = [v45 addPolicy:v21];
          long long v23 = sub_100061028();
          if (v22)
          {
            os_log_type_t v24 = _SC_syslog_os_log_mapping();
            if (!__SC_log_enabled()) {
              goto LABEL_17;
            }
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            os_log_type_enabled(v23, v24);
            long long v25 = v23;
            long long v26 = [v17 UUIDString];
            int v47 = 138413058;
            id v48 = v41;
            __int16 v49 = 1024;
            *(_DWORD *)v50 = a5;
            *(_WORD *)&v50[4] = 2112;
            *(void *)&v50[6] = v40;
            *(_WORD *)&v50[14] = 2112;
            *(void *)&v50[16] = v26;
            LODWORD(v37) = 38;
            long long v36 = &v47;
            long long v27 = (long long *)_os_log_send_and_compose_impl();
          }
          else
          {
            uint64_t v28 = _SC_syslog_os_log_mapping();
            if (!__SC_log_enabled()) {
              goto LABEL_17;
            }
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            os_log_type_enabled(v23, (os_log_type_t)v28);
            long long v29 = v23;
            long long v30 = [v17 UUIDString];
            int v47 = 138412802;
            id v48 = v41;
            __int16 v49 = 2112;
            *(void *)v50 = v40;
            *(_WORD *)&v50[8] = 2112;
            *(void *)&v50[10] = v30;
            LODWORD(v37) = 32;
            long long v36 = &v47;
            long long v27 = (long long *)_os_log_send_and_compose_impl();
          }
          __SC_log_send2();
          if (v27 != &v58) {
            free(v27);
          }
          v11 = v42;
LABEL_17:
        }
        id v15 = [obj countByEnumeratingWithState:&v53 objects:v52 count:16];
        if (!v15)
        {
LABEL_19:

          id v8 = v40;
          id v7 = v41;
          goto LABEL_27;
        }
      }
    }
    long long v31 = sub_100061028();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      os_log_type_enabled(v31, v32);
      int v47 = 138412546;
      id v48 = v7;
      __int16 v49 = 2112;
      *(void *)v50 = v8;
      long long v33 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v33 != &v58) {
        free(v33);
      }
    }
  }
  else
  {
    v11 = sub_100061028();
    os_log_type_t v34 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      os_log_type_enabled(v11, v34);
      int v47 = 138412290;
      id v48 = v7;
      long long v35 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v35 != &v58) {
        free(v35);
      }
    }
  }
LABEL_27:
}

- (void)addAllowListAppIdentifierPolicy:(id)a3 forApp:(id)a4 order:(unsigned int)a5
{
  id v7 = a3;
  id v40 = a4;
  if ([v40 hasPrefix:@"/"])
  {
    if (qword_10007E030 != -1) {
      dispatch_once(&qword_10007E030, &stru_1000772F8);
    }
    if (byte_10007E028) {
      [(QoSMarkingController *)self addAllowListPathPolicy:v7 forPath:v40 order:a5];
    }
    goto LABEL_32;
  }
  v44 = [(NSMutableDictionary *)self->_policySessions objectForKeyedSubscript:v7];
  if (v44)
  {
    id v8 = +[NEPolicyRouteRule routeRuleWithAction:3 forInterfaceName:v7];
    long long v56 = v8;
    os_log_type_t v9 = +[NSArray arrayWithObjects:&v56 count:1];
    uint64_t v43 = +[NEPolicyResult routeRules:v9];

    v42 = +[NEPolicyCondition allInterfaces];
    id v10 = +[NEProcessInfo copyUUIDsForBundleID:v40 uid:0];
    v11 = v10;
    if (v10 && [v10 count])
    {
      uint64_t v37 = v8;
      id v39 = v7;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obj = v11;
      id v12 = [obj countByEnumeratingWithState:&v52 objects:v51 count:16];
      if (!v12) {
        goto LABEL_23;
      }
      id v13 = v12;
      uint64_t v41 = *(void *)v53;
      while (1)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v53 != v41) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v16 = +[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v15, v35, v36);
          id v17 = objc_alloc((Class)NEPolicy);
          v50[0] = v16;
          v50[1] = v42;
          long long v18 = +[NSArray arrayWithObjects:v50 count:2];
          id v19 = [v17 initWithOrder:a5 result:v43 conditions:v18];

          id v20 = [v44 addPolicy:v19];
          id v21 = sub_100061028();
          if (v20)
          {
            os_log_type_t v22 = _SC_syslog_os_log_mapping();
            if (!__SC_log_enabled()) {
              goto LABEL_21;
            }
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            os_log_type_enabled(v21, v22);
            long long v23 = v21;
            os_log_type_t v24 = [v15 UUIDString];
            int v46 = 138413058;
            id v47 = v39;
            __int16 v48 = 1024;
            *(_DWORD *)__int16 v49 = a5;
            *(_WORD *)&v49[4] = 2112;
            *(void *)&v49[6] = v40;
            *(_WORD *)&v49[14] = 2112;
            *(void *)&v49[16] = v24;
            LODWORD(v36) = 38;
            long long v35 = &v46;
            long long v25 = (long long *)_os_log_send_and_compose_impl();
          }
          else
          {
            uint64_t v26 = _SC_syslog_os_log_mapping();
            if (!__SC_log_enabled()) {
              goto LABEL_21;
            }
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            os_log_type_enabled(v21, (os_log_type_t)v26);
            long long v27 = v21;
            uint64_t v28 = [v15 UUIDString];
            int v46 = 138412802;
            id v47 = v39;
            __int16 v48 = 2112;
            *(void *)__int16 v49 = v40;
            *(_WORD *)&v49[8] = 2112;
            *(void *)&v49[10] = v28;
            LODWORD(v36) = 32;
            long long v35 = &v46;
            long long v25 = (long long *)_os_log_send_and_compose_impl();
          }
          __SC_log_send2();
          if (v25 != &v57) {
            free(v25);
          }
LABEL_21:
        }
        id v13 = [obj countByEnumeratingWithState:&v52 objects:v51 count:16];
        if (!v13)
        {
LABEL_23:

          id v7 = v39;
          goto LABEL_32;
        }
      }
    }
    long long v29 = sub_100061028();
    os_log_type_t v30 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      os_log_type_enabled(v29, v30);
      int v46 = 138412546;
      id v47 = v7;
      __int16 v48 = 2112;
      *(void *)__int16 v49 = v40;
      long long v31 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v31 != &v57) {
        free(v31);
      }
    }
  }
  else
  {
    os_log_type_t v32 = sub_100061028();
    os_log_type_t v33 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      os_log_type_enabled(v32, v33);
      int v46 = 138412290;
      id v47 = v7;
      os_log_type_t v34 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v34 != &v57) {
        free(v34);
      }
    }
  }
LABEL_32:
}

- (QoSMarkingController)init
{
  v14.receiver = self;
  v14.super_class = (Class)QoSMarkingController;
  id v2 = [(QoSMarkingController *)&v14 init];
  uint64_t v3 = v2;
  if (v2)
  {
    interfaces = v2->_interfaces;
    v2->_interfaces = 0;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    policySessions = v3->_policySessions;
    v3->_policySessions = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    requested = v3->_requested;
    v3->_requested = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    enabled = v3->_enabled;
    v3->_enabled = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    enabledAV = v3->_enabledAV;
    v3->_enabledAV = (NSMutableDictionary *)v11;
  }
  return v3;
}

- (void)updatePolicy:(id)a3 forInterface:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  id v8 = [(NSMutableDictionary *)self->_enabled objectForKeyedSubscript:v7];
  if (v8)
  {
    unsigned int v9 = [(QoSMarkingController *)self qosMarkingIsEnabled:v8];
    int v10 = v9 ^ 1;
    unsigned int v11 = [(QoSMarkingController *)self qosMarkingIsAppleAudioVideoCallsEnabled:v8];
    if (v6)
    {
LABEL_3:
      LODWORD(v12) = [(QoSMarkingController *)self qosMarkingIsEnabled:v6];
      int v13 = v12 ^ 1;
      unsigned int v89 = [(QoSMarkingController *)self qosMarkingIsAppleAudioVideoCallsEnabled:v6];
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v11 = 0;
    unsigned int v9 = 0;
    int v10 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  unsigned int v89 = 0;
  LODWORD(v12) = 0;
  int v13 = 0;
LABEL_6:
  if (v6) {
    int v14 = 1;
  }
  else {
    int v14 = v9;
  }
  int v91 = v12;
  if (v14 == 1
    && ((v9 ^ v12) & 1) == 0
    && ((v10 ^ v13) & 1) == 0
    && ((v9 & v12) != 1 || ([v8 isEqual:v6] & 1) != 0))
  {
    int v15 = 0;
    if (!v12) {
      goto LABEL_112;
    }
LABEL_48:
    id v40 = -[QoSMarkingController qosMarkingAllowListAppIdentifiers:](self, "qosMarkingAllowListAppIdentifiers:", v8, v77, v79);
    uint64_t v12 = [(QoSMarkingController *)self qosMarkingAllowListAppIdentifiers:v6];
    if ([v40 isEqual:v12] && v11 == v89) {
      goto LABEL_111;
    }
    if (![(NSMutableDictionary *)self->_enabled count]) {
      sub_100064AD0("net.qos.policy.restricted", 1);
    }
    [(NSMutableDictionary *)self->_enabled setObject:v6 forKeyedSubscript:v7];
    uint64_t v41 = sub_100061028();
    os_log_type_t v42 = _SC_syslog_os_log_mapping();
    v88 = v40;
    if (__SC_log_enabled())
    {
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      os_log_type_enabled(v41, v42);
      uint64_t v43 = "update";
      if (!v9) {
        uint64_t v43 = "add";
      }
      LODWORD(v127[0]) = 138412546;
      *(void *)((char *)v127 + 4) = v7;
      WORD6(v127[0]) = 2080;
      *(void *)((char *)v127 + 14) = v43;
      LODWORD(v79) = 22;
      v77 = (int *)v127;
      v44 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v44 != &v111) {
        free(v44);
      }
    }

    v45 = [(NSMutableDictionary *)self->_policySessions objectForKeyedSubscript:v7];
    if (!v45)
    {
      if ([(id)v12 count]) {
        int v55 = 1;
      }
      else {
        int v55 = v89;
      }
      if (v55 != 1)
      {
        v45 = 0;
        LOBYTE(v51) = 1;
        goto LABEL_82;
      }
      uint64_t v56 = [(QoSMarkingController *)self createPolicySession];
      if (!v56)
      {
        v50 = sub_100061028();
        os_log_type_t v75 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          long long v125 = 0u;
          long long v126 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          os_log_type_enabled(v50, v75);
          LODWORD(v127[0]) = 138412290;
          *(void *)((char *)v127 + 4) = v7;
          LODWORD(v79) = 12;
          v77 = (int *)v127;
          v76 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v76 != &v111) {
            free(v76);
          }
          v45 = 0;
          LOBYTE(v51) = 1;
        }
        else
        {
          v45 = 0;
          LOBYTE(v51) = 1;
        }
        goto LABEL_73;
      }
      v45 = (void *)v56;
      [(NSMutableDictionary *)self->_policySessions setObject:v56 forKeyedSubscript:v7];
    }
    if ((objc_msgSend(v45, "removeAllPolicies", v77, v79) & 1) == 0)
    {
      int v46 = sub_100061028();
      os_log_type_t v47 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        v83 = v45;
        int v48 = v15;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        os_log_type_enabled(v46, v47);
        LODWORD(v127[0]) = 138412290;
        *(void *)((char *)v127 + 4) = v7;
        LODWORD(v80) = 12;
        v78 = v127;
        __int16 v49 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v49 != &v111) {
          free(v49);
        }
        int v15 = v48;
        v45 = v83;
      }
    }
    if (objc_msgSend((id)v12, "count", v78, v80))
    {
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      v50 = (id)v12;
      id v51 = [v50 countByEnumeratingWithState:&v103 objects:v102 count:16];
      if (v51)
      {
        v84 = v45;
        int v81 = v15;
        uint64_t v52 = *(void *)v104;
        uint64_t v53 = 2000;
        do
        {
          for (i = 0; i != v51; i = (char *)i + 1)
          {
            if (*(void *)v104 != v52) {
              objc_enumerationMutation(v50);
            }
            [(QoSMarkingController *)self addAllowListAppIdentifierPolicy:v7 forApp:*(void *)(*((void *)&v103 + 1) + 8 * i) order:(char *)i + v53];
          }
          id v51 = [v50 countByEnumeratingWithState:&v103 objects:v102 count:16];
          uint64_t v53 = (v53 + i);
        }
        while (v51);
        int v15 = v81;
        v45 = v84;
        id v40 = v88;
      }
LABEL_73:

      goto LABEL_82;
    }
    LOBYTE(v51) = 0;
LABEL_82:
    enabledAV = self->_enabledAV;
    if (v89)
    {
      if (![(NSMutableDictionary *)enabledAV count]) {
        sub_100064AD0("net.qos.policy.restrict_avapps", 0);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_enabledAV, "setObject:forKeyedSubscript:", v6, v7, v77, v79);
      if (v51) {
        goto LABEL_110;
      }
      char v90 = (char)v51;
      v85 = v45;
      int v82 = v15;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v58 = (id)qword_10007DFF8;
      id v59 = [v58 countByEnumeratingWithState:&v98 objects:v97 count:16];
      if (v59)
      {
        id v60 = v59;
        uint64_t v61 = *(void *)v99;
        uint64_t v62 = 1000;
        do
        {
          for (j = 0; j != v60; j = (char *)j + 1)
          {
            if (*(void *)v99 != v61) {
              objc_enumerationMutation(v58);
            }
            [(QoSMarkingController *)self addAllowListAppIdentifierPolicy:v7 forApp:*(void *)(*((void *)&v98 + 1) + 8 * (void)j) order:(char *)j + v62];
          }
          id v60 = [v58 countByEnumeratingWithState:&v98 objects:v97 count:16];
          uint64_t v62 = (v62 + j);
        }
        while (v60);
      }

      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v51 = (id)qword_10007E000;
      id v64 = [v51 countByEnumeratingWithState:&v93 objects:v92 count:16];
      if (v64)
      {
        id v65 = v64;
        uint64_t v66 = *(void *)v94;
        uint64_t v67 = 1500;
        do
        {
          for (k = 0; k != v65; k = (char *)k + 1)
          {
            if (*(void *)v94 != v66) {
              objc_enumerationMutation(v51);
            }
            [(QoSMarkingController *)self addAllowListPathPolicy:v7 forPath:*(void *)(*((void *)&v93 + 1) + 8 * (void)k) order:(char *)k + v67];
          }
          id v65 = [v51 countByEnumeratingWithState:&v93 objects:v92 count:16];
          uint64_t v67 = (v67 + k);
        }
        while (v65);
      }

      int v15 = v82;
      v45 = v85;
      id v40 = v88;
      LOBYTE(v51) = v90;
    }
    else
    {
      [(NSMutableDictionary *)enabledAV removeObjectForKey:v7];
      if (![(NSMutableDictionary *)self->_enabledAV count]) {
        sub_100064AD0("net.qos.policy.restrict_avapps", 1);
      }
    }
    if ((v51 & 1) == 0 && ([v45 apply] & 1) == 0)
    {
      long long v69 = sub_100061028();
      os_log_type_t v70 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        v86 = v45;
        int v71 = v15;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        os_log_type_enabled(v69, v70);
        LODWORD(v127[0]) = 138412290;
        *(void *)((char *)v127 + 4) = v7;
        LODWORD(v79) = 12;
        v77 = (int *)v127;
        long long v72 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v72 != &v111) {
          free(v72);
        }
        int v15 = v71;
        v45 = v86;
        id v40 = v88;
      }
    }
LABEL_110:

LABEL_111:
    LOBYTE(v12) = v91;
    goto LABEL_112;
  }
  unsigned int v87 = v11;
  if (v12)
  {

    id v8 = 0;
  }
  else
  {
    if (!v6 && v8)
    {
      v16 = sub_100061028();
      os_log_type_t v17 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        os_log_type_enabled(v16, v17);
        LODWORD(v127[0]) = 138412290;
        *(void *)((char *)v127 + 4) = v7;
        LODWORD(v79) = 12;
        v77 = (int *)v127;
        long long v18 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v18 != &v111) {
          free(v18);
        }
        LODWORD(v12) = v91;
      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->_policySessions, "removeObjectForKey:", v7, v77, v79);
    [(NSMutableDictionary *)self->_enabled removeObjectForKey:v7];
    [(NSMutableDictionary *)self->_enabledAV removeObjectForKey:v7];
  }
  int v19 = socket(2, 2, 0);
  if (v19 == -1)
  {
    os_log_type_t v34 = sub_100061028();
    os_log_type_t v35 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      os_log_type_enabled(v34, v35);
      uint64_t v36 = v34;
      uint64_t v37 = __error();
      v38 = strerror(*v37);
      LODWORD(v127[0]) = 136315138;
      *(void *)((char *)v127 + 4) = v38;
      LODWORD(v79) = 12;
      v77 = (int *)v127;
      id v39 = (long long *)_os_log_send_and_compose_impl();

      __SC_log_send2();
      if (v39 != &v111) {
        free(v39);
      }
      LODWORD(v12) = v91;
      unsigned int v11 = v87;
    }

    int v15 = 1;
    if (v12) {
      goto LABEL_48;
    }
  }
  else
  {
    int v20 = v19;
    int v21 = v12 | (v6 == 0);
    os_log_type_t v22 = sub_100061028();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      os_log_type_enabled(v22, v23);
      if (v21) {
        os_log_type_t v24 = "enable";
      }
      else {
        os_log_type_t v24 = "disable";
      }
      long long v25 = " (default)";
      LODWORD(v127[0]) = 138412802;
      *(void *)((char *)v127 + 4) = v7;
      *(void *)((char *)v127 + 14) = v24;
      WORD6(v127[0]) = 2080;
      if (v6) {
        long long v25 = "";
      }
      WORD3(v127[1]) = 2080;
      *((void *)&v127[1] + 1) = v25;
      LODWORD(v79) = 32;
      uint64_t v26 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v26 != &v111) {
        free(v26);
      }
      unsigned int v11 = v87;
    }

    id v27 = [(__CFString *)v7 UTF8String];
    memset(v127, 0, sizeof(v127));
    __strlcpy_chk();
    LODWORD(v127[1]) = v21;
    if (ioctl(v20, 0xC02069B5uLL, v127) == -1)
    {
      uint64_t v28 = sub_100061028();
      os_log_type_t v29 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        os_log_type_enabled(v28, v29);
        os_log_type_t v30 = v28;
        long long v31 = __error();
        os_log_type_t v32 = strerror(*v31);
        int v107 = 136315394;
        id v108 = v27;
        __int16 v109 = 2080;
        v110 = v32;
        LODWORD(v79) = 22;
        v77 = &v107;
        os_log_type_t v33 = (long long *)_os_log_send_and_compose_impl();

        __SC_log_send2();
        if (v33 != &v111) {
          free(v33);
        }
      }

      unsigned int v11 = v87;
    }
    close(v20);
    int v15 = 1;
    LOBYTE(v12) = v91;
    if (v91) {
      goto LABEL_48;
    }
  }
LABEL_112:
  if ([(NSMutableDictionary *)self->_enabled count])
  {
    if (!v15) {
      goto LABEL_122;
    }
  }
  else
  {
    sub_100064AD0("net.qos.policy.restrict_avapps", 0);
    sub_100064AD0("net.qos.policy.restricted", 0);
    if (!v15) {
      goto LABEL_122;
    }
  }
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, v7, kSCEntNetQoSMarkingPolicy);
  char v74 = v12 ^ 1;
  if (!v6) {
    char v74 = 1;
  }
  if (v74) {
    SCDynamicStoreRemoveValue(0, NetworkInterfaceEntity);
  }
  else {
    SCDynamicStoreSetValue(0, NetworkInterfaceEntity, v6);
  }
  CFRelease(NetworkInterfaceEntity);
LABEL_122:
}

+ (id)sharedController
{
  if (qword_10007E018 != -1) {
    dispatch_once(&qword_10007E018, &stru_1000772D8);
  }
  id v2 = (void *)qword_10007E010;

  return v2;
}

- (void)setInterfaces:(id)a3
{
  id v5 = a3;
  int v6 = socket(2, 2, 0);
  if (v6 == -1)
  {
    sub_100061028();
    id v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
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
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      os_log_type_enabled(&v8->super, v23);
      id v8 = v8;
      os_log_type_t v24 = __error();
      long long v25 = strerror(*v24);
      LODWORD(v55) = 136315138;
      *(void *)((char *)&v55 + 4) = v25;
      uint64_t v26 = (long long *)_os_log_send_and_compose_impl();

      __SC_log_send2();
      if (v26 != &v39) {
        free(v26);
      }
    }
  }
  else
  {
    int v7 = v6;
    uint64_t v28 = self;
    id v8 = self->_interfaces;
    objc_storeStrong((id *)&self->_interfaces, a3);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v27 = v5;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(id *)(*((void *)&v31 + 1) + 8 * i);
          id v14 = [v13 UTF8String];
          long long v55 = 0u;
          long long v56 = 0u;
          __strlcpy_chk();
          if (ioctl(v7, 0xC020699FuLL, &v55) == -1)
          {
            v16 = sub_100061028();
            os_log_type_t v17 = _SC_syslog_os_log_mapping();
            if (__SC_log_enabled())
            {
              long long v18 = v8;
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
              long long v43 = 0u;
              long long v44 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              os_log_type_enabled(v16, v17);
              int v19 = v16;
              int v20 = __error();
              int v21 = strerror(*v20);
              int v35 = 136315394;
              id v36 = v14;
              __int16 v37 = 2080;
              v38 = v21;
              os_log_type_t v22 = (long long *)_os_log_send_and_compose_impl();

              __SC_log_send2();
              if (v22 != &v39) {
                free(v22);
              }
              id v8 = v18;
            }
          }
          else if (*(void *)((char *)&v56 + 4) == 0x300000002 {
                 && ![(NSArray *)v8 containsObject:v13])
          }
          {
            int v15 = [(NSMutableDictionary *)v28->_requested objectForKeyedSubscript:v13];
            [(NSMutableDictionary *)v28->_requested removeObjectForKey:v13];
            [(QoSMarkingController *)v28 setPolicy:v15 forInterface:v13];
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v31 objects:v30 count:16];
      }
      while (v10);
    }

    close(v7);
    id v5 = v27;
  }
}

- (void)setPolicy:(id)a3 forInterface:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    if ([(NSArray *)self->_interfaces containsObject:v6]) {
      [(QoSMarkingController *)self updatePolicy:v7 forInterface:v6];
    }
    -[NSMutableDictionary setObject:forKey:](self->_requested, "setObject:forKey:", v7, v6, v7);
  }
  else
  {
    [(QoSMarkingController *)self updatePolicy:0 forInterface:v6];
    [(NSMutableDictionary *)self->_requested removeObjectForKey:v6];
  }
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (NSMutableDictionary)policySessions
{
  return self->_policySessions;
}

- (void)setPolicySessions:(id)a3
{
  p_policySessions = &self->_policySessions;

  objc_storeStrong((id *)p_policySessions, a3);
}

- (NSMutableDictionary)requested
{
  return self->_requested;
}

- (void)setRequested:(id)a3
{
  p_requested = &self->_requested;

  objc_storeStrong((id *)p_requested, a3);
}

- (NSMutableDictionary)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
  p_enabled = &self->_enabled;

  objc_storeStrong((id *)p_enabled, a3);
}

- (NSMutableDictionary)enabledAV
{
  return self->_enabledAV;
}

- (void)setEnabledAV:(id)a3
{
  p_enabledAV = &self->_enabledAV;

  objc_storeStrong((id *)p_enabledAV, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledAV, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_requested, 0);
  objc_storeStrong((id *)&self->_policySessions, 0);

  objc_storeStrong((id *)&self->_interfaces, 0);
}

@end