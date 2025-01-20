@interface NESMDNSSettingsSession
+ (BOOL)hasRequiredFrameworks;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)shouldBeIdleForStatus:(int)a3;
- (NESMDNSSettingsSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (int)type;
- (void)dealloc;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)install;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)uninstall;
@end

@implementation NESMDNSSettingsSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_dnsOnDemandMonitor, 0);
  objc_storeStrong((id *)&self->_exceptionDomains, 0);
  objc_storeStrong((id *)&self->_onDemandRules, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)dealloc
{
  int MCNotifyToken = self->_MCNotifyToken;
  if ((MCNotifyToken & 0x80000000) == 0)
  {
    notify_cancel(MCNotifyToken);
    self->_int MCNotifyToken = -1;
  }
  sub_10008208C(self, a2);
  [(NESMDNSSettingsSession *)self uninstall];
  v4.receiver = self;
  v4.super_class = (Class)NESMDNSSettingsSession;
  [(NESMSession *)&v4 dealloc];
}

- (void)uninstall
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ uninstalling DNS settings session", (uint8_t *)&v9, 0xCu);
  }

  objc_super v4 = [(NESMSession *)self policySession];
  sub_10002E854((uint64_t)v4);

  v5 = [(NESMSession *)self configuration];
  v6 = [v5 dnsSettings];
  unsigned __int8 v7 = [v6 isEnabled];

  if ((v7 & 1) == 0) {
    sub_10008208C(self, v8);
  }
  [(NESMSession *)self setStatus:1];
}

- (void)install
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    unsigned __int8 v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ installing DNS settings session", (uint8_t *)&v6, 0xCu);
  }

  sub_1000823E0(self, 1);
  if (self && objc_getProperty(self, v4, 360, 1))
  {
    [(NESMSession *)self setStatus:3];
  }
  else
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      unsigned __int8 v7 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ settings is not, not moving to connected", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 == 1)
  {
    block[7] = v3;
    block[8] = v4;
    int v6 = [(NESMSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100082834;
    block[3] = &unk_1000C6C60;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v15.receiver = self,
        v15.super_class = (Class)NESMDNSSettingsSession,
        [(NESMSession *)&v15 handleUpdateConfiguration:v4]))
  {
    if (self) {
      self->_configurationUpdatePending = 1;
    }
    v5 = [v4 dnsSettings];
    unsigned __int8 v7 = [v5 settings];
    if (self) {
      objc_setProperty_atomic(self, v6, v7, 360);
    }

    v8 = [v4 dnsSettings];
    int v9 = [v8 onDemandRules];
    v11 = v9;
    if (self)
    {
      objc_setProperty_atomic(self, v10, v9, 368);

      sub_100082A5C((int *)self, v4);
      sub_10008326C(self, v12);
    }
    else
    {

      sub_100082A5C(0, v4);
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    int v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ handling stop for DNS settings session", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)NESMDNSSettingsSession;
  [(NESMSession *)&v7 handleStopMessageWithReason:v3];
  int v6 = [(NESMSession *)self server];
  [v6 requestUninstallForSession:self];
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    int v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ handling start for DNS settings session", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)NESMDNSSettingsSession;
  [(NESMSession *)&v7 handleStartMessage:v4];

  sub_10008326C(self, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 384, 1);
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
      id v18 = objc_getProperty(self, v16, 384, 1);
    }
    else {
      id v18 = 0;
    }
    v20 = [v18 bestAvailableNetworkDescription];
    if (v20)
    {
      if (self) {
        id v21 = objc_getProperty(self, v19, 384, 1);
      }
      else {
        id v21 = 0;
      }
      v22 = [v21 networkDescriptionArray];
      id v23 = [v22 indexOfObject:v20];

      if (self) {
        id v25 = objc_getProperty(self, v24, 368, 1);
      }
      else {
        id v25 = 0;
      }
      if ([v25 count] > v23)
      {
        if (self) {
          id v27 = objc_getProperty(self, v26, 368, 1);
        }
        else {
          id v27 = 0;
        }
        uint64_t v28 = [v27 objectAtIndex:v23];

        id v17 = (id)v28;
      }
      v29 = ne_log_obj();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        if ([v17 action] == (id)3)
        {
          v52 = v20;
          id v34 = objc_alloc_init((Class)NSMutableArray);
          id v53 = v17;
          v35 = [v17 connectionRules];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v36 = [v35 countByEnumeratingWithState:&v54 objects:v58 count:16];
          if (v36)
          {
            id v38 = v36;
            uint64_t v39 = *(void *)v55;
            do
            {
              for (i = 0; i != v38; i = (char *)i + 1)
              {
                if (*(void *)v55 != v39) {
                  objc_enumerationMutation(v35);
                }
                v41 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                if (objc_msgSend(v41, "action", v52) == (id)2)
                {
                  v42 = [v41 matchDomains];
                  [v34 addObjectsFromArray:v42];
                }
              }
              id v38 = [v35 countByEnumeratingWithState:&v54 objects:v58 count:16];
            }
            while (v38);
          }
          if (self) {
            id v43 = objc_getProperty(self, v37, 376, 1);
          }
          else {
            id v43 = 0;
          }
          v20 = v52;
          id v17 = v53;
          unsigned int v44 = [v34 isEqual:v43 v52];
          int v46 = v44 ^ 1;
          if (self && (v44 & 1) == 0) {
            objc_setProperty_atomic(self, v45, v34, 376);
          }
        }
        else if (self)
        {
          int v46 = objc_getProperty(self, v33, 376, 1) != 0;
          objc_setProperty_atomic(self, v47, 0, 376);
        }
        else
        {
          int v46 = 0;
        }
        if ([(NESMSession *)self status] != 1
          && ([v17 action] == (id)2 || objc_msgSend(v17, "action") == (id)4))
        {
          v48 = [(NESMSession *)self server];
          [v48 requestUninstallForSession:self];
        }
        else
        {
          if ([(NESMSession *)self status] == 3
            || [v17 action] != (id)1 && objc_msgSend(v17, "action") != (id)3)
          {
            if ([(NESMSession *)self status] == 3) {
              int v49 = v46;
            }
            else {
              int v49 = 0;
            }
            if (v49 == 1)
            {
              v50 = self;
              char v51 = 0;
            }
            else
            {
              if (!self || !self->_configurationUpdatePending) {
                goto LABEL_58;
              }
              self->_configurationUpdatePending = 0;
              v50 = self;
              char v51 = 1;
            }
            sub_1000823E0(v50, v51);
LABEL_58:

            goto LABEL_59;
          }
          v48 = [(NESMSession *)self server];
          [v48 requestInstallForSession:self withParentSession:0 exclusive:0];
        }

        goto LABEL_58;
      }
      *(_DWORD *)buf = 138412546;
      v60 = self;
      __int16 v61 = 2112;
      id v62 = v17;
      v30 = "%@ Matched DNS On Demand rule %@";
      v31 = v29;
      uint32_t v32 = 22;
    }
    else
    {
      v29 = ne_log_obj();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      v60 = self;
      v30 = "%@ Matched no DNS On Demand rule";
      v31 = v29;
      uint32_t v32 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_22;
  }

LABEL_59:
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  return !a3 || (a3 & 0xFFFFFFFD) == 1;
}

- (int)type
{
  return 7;
}

- (NESMDNSSettingsSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NESMDNSSettingsSession;
  objc_super v7 = [(NESMSession *)&v23 initWithConfiguration:v6 andServer:a4];
  if (!v7)
  {
LABEL_6:
    v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ initialized DNS settings session", buf, 0xCu);
    }

    v20 = v7;
    goto LABEL_12;
  }
  v8 = [v6 dnsSettings];
  id v9 = [v8 settings];

  if (v9)
  {
    id v10 = [v6 dnsSettings];
    uint64_t v11 = [v10 settings];
    settings = v7->_settings;
    v7->_settings = (NEDNSSettings *)v11;

    BOOL v13 = [v6 dnsSettings];
    uint64_t v14 = [v13 onDemandRules];
    onDemandRules = v7->_onDemandRules;
    v7->_onDemandRules = (NSArray *)v14;

    v7->_int MCNotifyToken = -1;
    sub_100082A5C((int *)v7, v6);
    v16 = [NESMPolicySession alloc];
    id v17 = [v6 identifier];
    id v18 = [v6 grade];
    if (v16) {
      v16 = (NESMPolicySession *)sub_100031564((id *)&v16->super.isa, v17, 7, v18, (void *)1, (void *)1);
    }
    [(NESMSession *)v7 setPolicySession:v16];

    sub_10007FEB0(v7);
    goto LABEL_6;
  }
  id v21 = ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@ settings is nil", buf, 0xCu);
  }

  v20 = 0;
LABEL_12:

  return v20;
}

+ (BOOL)hasRequiredFrameworks
{
  return objc_opt_class() != 0;
}

@end