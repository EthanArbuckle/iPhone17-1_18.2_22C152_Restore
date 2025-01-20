@interface NSPConfigurationManager
- (BOOL)environmentUsesNonDefaultServer;
- (BOOL)getGeohashSharingPreference;
- (BOOL)getPrivateAccessTokensEnabled;
- (BOOL)policyIncludesUnlimited;
- (BOOL)setUserTier:(unint64_t)a3 resetDate:(id)a4 clearResetDate:(BOOL)a5 changeSource:(unint64_t)a6;
- (NSPConfigurationManager)initWithDelegate:(id)a3 configuration:(id)a4;
- (id)currentConfiguration;
- (id)diagnostics;
- (id)mergeProxyTrafficStateWithCurrentPolicy;
- (unint64_t)configurationSubscriberPoliciesCount;
- (unint64_t)effectiveUserTier;
- (unint64_t)getPrivacyProxyAccountType;
- (void)clearResetDate;
- (void)configurationEnabled:(BOOL)a3;
- (void)copyProxyInfo:(id)a3;
- (void)dealloc;
- (void)handlePathChange:(id)a3;
- (void)publishDailyConfigurationStats;
- (void)refreshConfigurationWithReason:(unint64_t)a3 completionHandler:(id)a4;
- (void)resetConfigurationManager;
- (void)setConfigurationTrialVersion:(int64_t)a3;
- (void)setGeohashOverride:(id)a3;
- (void)setGeohashSharingPreference:(BOOL)a3;
- (void)setInProcessFlowDivert:(BOOL)a3;
- (void)setPreferredPathRoutingEnabled:(BOOL)a3;
- (void)setPrivateAccessTokensAllowTools:(BOOL)a3;
- (void)setPrivateAccessTokensEnabled:(BOOL)a3;
- (void)setProxyAccountType:(unint64_t)a3 unlimited:(BOOL)a4;
- (void)setProxyTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4;
- (void)setResetDate:(id)a3;
- (void)setup;
- (void)updateConfiguration:(id)a3;
@end

@implementation NSPConfigurationManager

- (void)resetConfigurationManager
{
  v2 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  id v28 = [(NSPConfigurationManager *)self geohashSharingEnabledStatus];
  if (v2) {
    configuration = v2->_configuration;
  }
  else {
    configuration = 0;
  }
  v27 = [(NSPConfiguration *)configuration geohashOverride];
  if (v2) {
    v4 = v2->_configuration;
  }
  else {
    v4 = 0;
  }
  v26 = [(NSPConfiguration *)v4 preferredPathRoutingEnabledStatus];
  if (v2) {
    v5 = v2->_configuration;
  }
  else {
    v5 = 0;
  }
  v6 = [(NSPConfiguration *)v5 privateAccessTokensEnabledStatus];
  if (v2) {
    v7 = v2->_configuration;
  }
  else {
    v7 = 0;
  }
  v8 = [(NSPConfiguration *)v7 privateAccessTokensAllowTools];
  if (v2) {
    v9 = v2->_configuration;
  }
  else {
    v9 = 0;
  }
  v10 = [(NSPConfiguration *)v9 inProcessFlowDivert];
  if (v2) {
    v11 = v2->_configuration;
  }
  else {
    v11 = 0;
  }
  v12 = [(NSPConfiguration *)v11 proxyTrafficState];
  if (v2) {
    v13 = v2->_configuration;
  }
  else {
    v13 = 0;
  }
  v14 = [(NSPConfiguration *)v13 userTier];
  if (v2) {
    v15 = v2->_configuration;
  }
  else {
    v15 = 0;
  }
  v16 = [(NSPConfiguration *)v15 proxyAccountType];
  if (v2) {
    v17 = v2->_configuration;
  }
  else {
    v17 = 0;
  }
  v18 = [(NSPConfiguration *)v17 proxyAccountUnlimited];
  if (v2) {
    v19 = v2->_configuration;
  }
  else {
    v19 = 0;
  }
  v20 = [(NSPConfiguration *)v19 userPreferredTier];
  if (v2) {
    v21 = v2->_configuration;
  }
  else {
    v21 = 0;
  }
  v22 = [(NSPConfiguration *)v21 subscriberEnabledFromNonSettingsApp];
  if (v2) {
    v23 = v2->_configuration;
  }
  else {
    v23 = 0;
  }
  v25 = [(NSPConfiguration *)v23 lastPrivateCloudComputeEnvironment];
  sub_10008EF78((uint64_t)v2);
  if (v2)
  {
    [(NSPConfiguration *)v2->_configuration setGeohashSharingEnabledStatus:v28];
    [(NSPConfiguration *)v2->_configuration setGeohashOverride:v27];
    [(NSPConfiguration *)v2->_configuration setPreferredPathRoutingEnabledStatus:v26];
    [(NSPConfiguration *)v2->_configuration setPrivateAccessTokensEnabledStatus:v6];
    [(NSPConfiguration *)v2->_configuration setPrivateAccessTokensAllowTools:v8];
    [(NSPConfiguration *)v2->_configuration setInProcessFlowDivert:v10];
    [(NSPConfiguration *)v2->_configuration setProxyTrafficState:v12];
    [(NSPConfiguration *)v2->_configuration setUserTier:v14];
    [(NSPConfiguration *)v2->_configuration setProxyAccountType:v16];
    [(NSPConfiguration *)v2->_configuration setProxyAccountUnlimited:v18];
    [(NSPConfiguration *)v2->_configuration setUserPreferredTier:v20];
    [(NSPConfiguration *)v2->_configuration setSubscriberEnabledFromNonSettingsApp:v22];
    v24 = v2->_configuration;
  }
  else
  {
    [0 setGeohashSharingEnabledStatus:v28];
    [0 setGeohashOverride:v27];
    [0 setPreferredPathRoutingEnabledStatus:v26];
    [0 setPrivateAccessTokensEnabledStatus:v6];
    [0 setPrivateAccessTokensAllowTools:v8];
    [0 setInProcessFlowDivert:v10];
    [0 setProxyTrafficState:v12];
    [0 setUserTier:v14];
    [0 setProxyAccountType:v16];
    [0 setProxyAccountUnlimited:v18];
    [0 setUserPreferredTier:v20];
    [0 setSubscriberEnabledFromNonSettingsApp:v22];
    v24 = 0;
  }
  [(NSPConfiguration *)v24 setLastPrivateCloudComputeEnvironment:v25];
  sub_10008F360((uint64_t)v2);
}

- (BOOL)policyIncludesUnlimited
{
  v2 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  v3 = [(NSPConfigurationManager *)self proxyTrafficState];
  unsigned int v4 = [v3 unsignedLongLongValue];

  if ((v4 & 0x20000) == 0) {
    return 0;
  }
  v6 = sub_100090D38((id *)&v2->super.isa);
  id v7 = sub_100090B20(v2, v6);
  v8 = v7;
  if (v7 && [v7 containsObject:&off_10010F970])
  {
    if (v2) {
      configuration = v2->_configuration;
    }
    else {
      configuration = 0;
    }
    v10 = configuration;
    v11 = [(NSPConfiguration *)v10 proxyAccountUnlimited];
    if ([v11 BOOLValue])
    {
      char v5 = 1;
    }
    else
    {
      if (v2) {
        v12 = v2->_configuration;
      }
      else {
        v12 = 0;
      }
      v13 = v12;
      v14 = [(NSPConfiguration *)v13 cloudSubscriptionCheckEnabled];
      if (v14)
      {
        if (v2) {
          v15 = v2->_configuration;
        }
        else {
          v15 = 0;
        }
        v16 = [(NSPConfiguration *)v15 cloudSubscriptionCheckEnabled];
        unsigned __int8 v17 = [v16 BOOLValue];

        char v5 = v17 ^ 1;
      }
      else
      {
        char v5 = 0;
      }
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)mergeProxyTrafficStateWithCurrentPolicy
{
  v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Merging current policy with proxy traffic state", buf, 2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  char v5 = configuration;
  v6 = [(NSPConfiguration *)v5 proxyTrafficState];

  if (v6)
  {
    id v7 = sub_100090D38((id *)&self->super.isa);
    id v8 = sub_100090B20(self, v7);
    v9 = v8;
    if (!v8)
    {
      v14 = nplog_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = self;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ failed to find conditions in the current policy", buf, 0xCu);
      }
      v13 = 0;
      goto LABEL_125;
    }
    if (![v8 containsObject:&off_10010F970])
    {
LABEL_31:
      if (self) {
        v25 = self->_configuration;
      }
      else {
        v25 = 0;
      }
      v26 = v25;
      v27 = [(NSPConfiguration *)v26 proxyTrafficState];
      unsigned int v28 = [v27 unsignedLongLongValue];

      v29 = nplog_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        if (self) {
          v30 = self->_configuration;
        }
        else {
          v30 = 0;
        }
        v31 = v30;
        v32 = [(NSPConfiguration *)v31 proxyTrafficState];
        id v33 = +[NSPConfiguration proxyTrafficStateToString:v32];
        v34 = [v7 description];
        *(_DWORD *)buf = 138412802;
        v50 = self;
        __int16 v51 = 2112;
        id v52 = v33;
        __int16 v53 = 2112;
        v54 = v34;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@ merging proxy traffic state [%@] with current proxy policy [%@]", buf, 0x20u);
      }
      if ((v28 & 1) == 0 && [v9 containsObject:&off_10010F988]) {
        [v9 removeObject:&off_10010F988];
      }
      if ((v28 & 2) == 0 && [v9 containsObject:&off_10010F9A0]) {
        [v9 removeObject:&off_10010F9A0];
      }
      if ((v28 & 4) == 0 && [v9 containsObject:&off_10010F9B8]) {
        [v9 removeObject:&off_10010F9B8];
      }
      if ((v28 & 8) == 0 && [v9 containsObject:&off_10010F9D0]) {
        [v9 removeObject:&off_10010F9D0];
      }
      if ((v28 & 0x10) == 0 && [v9 containsObject:&off_10010F9E8]) {
        [v9 removeObject:&off_10010F9E8];
      }
      if ((v28 & 0x40000) == 0 && [v9 containsObject:&off_10010FA00]) {
        [v9 removeObject:&off_10010FA00];
      }
      if ((v28 & 0x80000) == 0 && [v9 containsObject:&off_10010FA18]) {
        [v9 removeObject:&off_10010FA18];
      }
      if ((v28 & 0x100000) == 0 && [v9 containsObject:&off_10010FA30]) {
        [v9 removeObject:&off_10010FA30];
      }
      if ((v28 & 0x200000) == 0 && [v9 containsObject:&off_10010FA48]) {
        [v9 removeObject:&off_10010FA48];
      }
      if ((v28 & 0x20) == 0 && [v9 containsObject:&off_10010FA60]) {
        [v9 removeObject:&off_10010FA60];
      }
      if ((v28 & 0x40) == 0 && [v9 containsObject:&off_10010FA78]) {
        [v9 removeObject:&off_10010FA78];
      }
      if ((v28 & 0x80) == 0 && [v9 containsObject:&off_10010FA90]) {
        [v9 removeObject:&off_10010FA90];
      }
      if ((v28 & 0x100) == 0 && [v9 containsObject:&off_10010FAA8]) {
        [v9 removeObject:&off_10010FAA8];
      }
      if ((v28 & 0x200) == 0 && [v9 containsObject:&off_10010FAC0]) {
        [v9 removeObject:&off_10010FAC0];
      }
      if ((v28 & 0x400) == 0 && [v9 containsObject:&off_10010FAD8]) {
        [v9 removeObject:&off_10010FAD8];
      }
      if ((v28 & 0x10000) == 0 && [v9 containsObject:&off_10010FAF0]) {
        [v9 removeObject:&off_10010FAF0];
      }
      if ((v28 & 0x800) == 0 && [v9 containsObject:&off_10010FB08]) {
        [v9 removeObject:&off_10010FB08];
      }
      if ((v28 & 0x1000) == 0 && [v9 containsObject:&off_10010FB20]) {
        [v9 removeObject:&off_10010FB20];
      }
      if ((v28 & 0x2000) == 0 && [v9 containsObject:&off_10010FB38]) {
        [v9 removeObject:&off_10010FB38];
      }
      if ((v28 & 0x4000) == 0 && [v9 containsObject:&off_10010FB50]) {
        [v9 removeObject:&off_10010FB50];
      }
      if ((v28 & 0x8000) == 0 && [v9 containsObject:&off_10010FB68]) {
        [v9 removeObject:&off_10010FB68];
      }
      if ((v28 & 0x20000) == 0 && [v9 containsObject:&off_10010F970]) {
        [v9 removeObject:&off_10010F970];
      }
      if ((v28 & 0x400000) == 0 && [v9 containsObject:&off_10010FB80]) {
        [v9 removeObject:&off_10010FB80];
      }
      if ((v28 & 0x800000) == 0 && [v9 containsObject:&off_10010FB98]) {
        [v9 removeObject:&off_10010FB98];
      }
      if ((v28 & 0x1000000) == 0 && [v9 containsObject:&off_10010FBB0]) {
        [v9 removeObject:&off_10010FBB0];
      }
      if ((v28 & 0x2000000) == 0 && [v9 containsObject:&off_10010FBC8]) {
        [v9 removeObject:&off_10010FBC8];
      }
      id v35 = objc_alloc_init((Class)NSPPrivacyProxyPolicy);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v36 = v9;
      id v37 = [v36 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v37)
      {
        id v38 = v37;
        uint64_t v39 = *(void *)v45;
        do
        {
          for (i = 0; i != v38; i = (char *)i + 1)
          {
            if (*(void *)v45 != v39) {
              objc_enumerationMutation(v36);
            }
            [v35 addConditions:[*(id *)(*((void *)&v44 + 1) + 8 * i) intValue:v44]];
          }
          id v38 = [v36 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v38);
      }

      v41 = nplog_obj();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = [v35 description];
        *(_DWORD *)buf = 138412546;
        v50 = self;
        __int16 v51 = 2112;
        id v52 = v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%@ merged privacy proxy policy: [%@]", buf, 0x16u);
      }
      v14 = v35;
      v13 = v14;
LABEL_125:

      goto LABEL_126;
    }
    if (self) {
      v10 = self->_configuration;
    }
    else {
      v10 = 0;
    }
    v11 = v10;
    v12 = [(NSPConfiguration *)v11 proxyAccountUnlimited];
    if ([v12 BOOLValue])
    {

LABEL_24:
      v23 = nplog_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Allowed to use app condition", buf, 2u);
      }

      goto LABEL_31;
    }
    if (self) {
      v15 = self->_configuration;
    }
    else {
      v15 = 0;
    }
    v16 = v15;
    uint64_t v17 = [(NSPConfiguration *)v16 cloudSubscriptionCheckEnabled];
    if (v17)
    {
      v18 = (void *)v17;
      if (self) {
        v19 = self->_configuration;
      }
      else {
        v19 = 0;
      }
      v20 = v19;
      v21 = [(NSPConfiguration *)v20 cloudSubscriptionCheckEnabled];
      unsigned __int8 v22 = [v21 BOOLValue];

      if ((v22 & 1) == 0) {
        goto LABEL_24;
      }
    }
    else
    {
    }
    v24 = nplog_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Not allowed to use app condition", buf, 2u);
    }

    [v9 removeObject:&off_10010F970];
    goto LABEL_31;
  }
  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v50 = self;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ proxy traffic state is nil", buf, 0xCu);
  }
  v13 = 0;
LABEL_126:

  return v13;
}

- (id)currentConfiguration
{
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  return self;
}

- (void)updateConfiguration:(id)a3
{
  id v494 = a3;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  char v5 = configuration;
  id v497 = [(NSPConfiguration *)v5 copy];

  v6 = [(NSPConfigurationManager *)self effectiveUserTier];
  if (self)
  {
    id v7 = self->_configuration;
    [(NSPConfiguration *)v7 merge:v494];

    id v8 = self->_configuration;
  }
  else
  {
    [0 merge:v494];
    id v8 = 0;
  }
  v9 = v8;
  [(NSPConfiguration *)v9 evaluateEnableRatios];

  unint64_t v10 = sub_100096284((uint64_t)self);
  v499 = self;
  if (self)
  {
    self->_effectiveUserTier = v10;
    v11 = self->_configuration;
  }
  else
  {
    v11 = 0;
  }
  v498 = v11;
  v12 = [(NSPConfiguration *)v498 proxyConfigurationData];
  v13 = [v497 proxyConfigurationData];
  unint64_t v14 = v12;
  unint64_t v15 = v13;
  v16 = (void *)v15;
  if (!(v14 | v15) || (int v17 = 1, v14) && v15 && [(id)v14 isEqual:v15]) {
    int v17 = 0;
  }

  int v18 = v17;
  if (v17)
  {
    v19 = nplog_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "proxy configuration data changed", (uint8_t *)&buf, 2u);
    }
  }
  v20 = [(NSPConfiguration *)v498 enabled];
  v21 = [v497 enabled];
  unint64_t v22 = v20;
  unint64_t v23 = v21;
  v24 = (void *)v23;
  if (v22 | v23 && (!v22 || !v23 || ![(id)v22 isEqual:v23]))
  {

    v34 = nplog_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = [(NSPConfiguration *)v498 enabled];
      unsigned int v36 = [v35 BOOLValue];
      CFStringRef v37 = @"disabled";
      if (v36) {
        CFStringRef v37 = @"enabled";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v37;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "privacy proxy %@", (uint8_t *)&buf, 0xCu);
    }
    if (v499)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v652 = 0x3032000000;
      v653 = sub_100005DBC;
      v654 = sub_10008DB7C;
      v655 = (void ***)os_transaction_create();
      id v38 = v499->_configuration;
      uint64_t v39 = [(NSPConfiguration *)v38 enabled];
      unsigned int v40 = [v39 BOOLValue];

      if (v40)
      {
        v41 = v499->_configuration;
        [(NSPConfiguration *)v41 setConfigServerEnabled:&__kCFBooleanTrue];

        sub_10008F7C4((uint64_t)v499);
        sub_10008D7D0((uint64_t)v499);
        sub_10008EBE4((id *)&v499->super.isa);
        v42 = v499->_configuration;
        v43 = [(NSPConfiguration *)v42 configServerHost];
        v499->_useDefaultInterface = [v43 isEqualToString:@"mask-api.icloud.com"] ^ 1;

        long long v44 = NPGetInternalQueue();
        block = _NSConcreteStackBlock;
        uint64_t p_block = 3221225472;
        uint64_t v629 = (uint64_t)sub_10008F9B8;
      }
      else
      {
        sub_10008E870((uint64_t)v499);
        sub_10008E5A8((uint64_t)v499);
        sub_10008EF78((uint64_t)v499);
        long long v45 = v499->_configuration;
        [(NSPConfiguration *)v45 setEnabled:&__kCFBooleanFalse];

        sub_10008FA28((uint64_t)v499);
        +[NSPConfigurationSignatureInfo removeFromPreferences];
        v499->_effectiveUserTier = 1;
        long long v44 = NPGetInternalQueue();
        block = _NSConcreteStackBlock;
        uint64_t p_block = 3221225472;
        uint64_t v629 = (uint64_t)sub_10008FA78;
      }
      v630 = (uint64_t (*)(uint64_t, uint64_t))&unk_100105460;
      v631 = (void (*)(uint64_t))v499;
      p_long long buf = &buf;
      dispatch_async(v44, &block);

      _Block_object_dispose(&buf, 8);
    }
    goto LABEL_128;
  }

  v25 = [(NSPConfiguration *)v498 enabled];
  unsigned __int8 v26 = [v25 BOOLValue];

  if ((v26 & 1) == 0) {
    goto LABEL_127;
  }
  v27 = [(NSPConfiguration *)v498 configServerHost];
  unsigned int v28 = [v497 configServerHost];
  unsigned __int8 v29 = [v27 isEqualToString:v28];

  if ((v29 & 1) == 0)
  {
    v31 = nplog_obj();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      long long v46 = [(NSPConfiguration *)v498 configServerHost];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v46;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "configuration server host changed to %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_24;
  }
  unsigned int v30 = [(NSPConfiguration *)v498 ignoreInvalidCerts];
  if (v30 != [v497 ignoreInvalidCerts])
  {
    v31 = nplog_obj();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v32 = [(NSPConfiguration *)v498 ignoreInvalidCerts];
      id v33 = "no";
      if (v32) {
        id v33 = "yes";
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "ignore invalid certs changed to %s", (uint8_t *)&buf, 0xCu);
    }
LABEL_24:

    sub_10008F360((uint64_t)v499);
LABEL_128:
    v147 = nplog_large_obj();
    if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
    {
      v153 = v499;
      if (v499) {
        v153 = v499->_configuration;
      }
      id v154 = v153;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v154;
      _os_log_debug_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEBUG, "Configuration state: %@", (uint8_t *)&buf, 0xCu);
    }
    if (v499) {
      v148 = v499->_configuration;
    }
    else {
      v148 = 0;
    }
    v149 = v148;
    unsigned __int8 v150 = [(NSPConfiguration *)v149 saveToPreferences];

    if (v150)
    {
      if (v499)
      {
        ++v499->_generation;
        +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", @"com.apple.networkserviceproxy.privacy-proxy-configuration-changed");
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v652 = 0x3032000000;
        v653 = sub_100005DBC;
        v654 = sub_10008DB7C;
        v655 = (void ***)os_transaction_create();
        v151 = NPGetInternalQueue();
        block = _NSConcreteStackBlock;
        uint64_t p_block = 3221225472;
        uint64_t v629 = (uint64_t)sub_10008FCAC;
        v630 = (uint64_t (*)(uint64_t, uint64_t))&unk_100105460;
        v631 = (void (*)(uint64_t))v499;
        p_long long buf = &buf;
        dispatch_async(v151, &block);

        _Block_object_dispose(&buf, 8);
      }
      else
      {
        +[NPUtilities postNotification:@"com.apple.networkserviceproxy.privacy-proxy-configuration-changed" value:0];
      }
    }
    else
    {
      v152 = nplog_obj();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_ERROR, "Failed to write configuration to file", (uint8_t *)&buf, 2u);
      }
    }
    goto LABEL_137;
  }
  long long v47 = [(NSPConfiguration *)v498 cloudSubscriptionCheckEnabled];
  v48 = [v497 cloudSubscriptionCheckEnabled];
  unint64_t v49 = v47;
  unint64_t v50 = v48;
  __int16 v51 = (void *)v50;
  if (!(v49 | v50) || v49 && v50 && [(id)v49 isEqual:v50])
  {
  }
  else
  {

    id v52 = nplog_obj();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v53 = [(NSPConfiguration *)v498 cloudSubscriptionCheckEnabled];
      unsigned int v54 = [v53 BOOLValue];
      v55 = "no";
      if (v54) {
        v55 = "yes";
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v55;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "cloud subscription check changed to %s", (uint8_t *)&buf, 0xCu);
    }
    if (v499)
    {
      v56 = [(NSPConfiguration *)v499->_configuration cloudSubscriptionCheckEnabled];
      unsigned __int8 v57 = [v56 BOOLValue];

      if ((v57 & 1) == 0)
      {
        [(NSPConfiguration *)v499->_configuration setProxyAccountType:0];
        [(NSPConfiguration *)v499->_configuration setProxyAccountUnlimited:0];
      }
      v58 = [(NSPConfiguration *)v499->_configuration cloudSubscriptionCheckEnabled];
      unsigned __int8 v59 = [v58 BOOLValue];

      block = 0;
      uint64_t p_block = (uint64_t)&block;
      uint64_t v629 = 0x3032000000;
      v630 = sub_100005DBC;
      v631 = sub_10008DB7C;
      p_long long buf = (long long *)os_transaction_create();
      v60 = NPGetInternalQueue();
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      uint64_t v652 = (uint64_t)sub_10008FB58;
      v653 = (uint64_t (*)(uint64_t, uint64_t))&unk_100105BC8;
      unsigned __int8 v656 = v59;
      v654 = (void (*)(uint64_t))v499;
      v655 = &block;
      dispatch_async(v60, &buf);

      _Block_object_dispose(&block, 8);
    }
    int v18 = 1;
  }
  v61 = [(NSPConfiguration *)v498 trialConfigVersion];
  v62 = [v497 trialConfigVersion];
  unint64_t v63 = v61;
  unint64_t v64 = v62;
  v65 = (void *)v64;
  if (!(v63 | v64) || v63 && v64 && [(id)v63 isEqual:v64])
  {
  }
  else
  {

    v66 = nplog_obj();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = [(NSPConfiguration *)v498 trialConfigVersion];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v67;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Trial configuration version changed to %@", (uint8_t *)&buf, 0xCu);
    }
    if (v499)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v652 = 0x3032000000;
      v653 = sub_100005DBC;
      v654 = sub_10008DB7C;
      v655 = (void ***)os_transaction_create();
      block = _NSConcreteStackBlock;
      uint64_t p_block = 3221225472;
      uint64_t v629 = (uint64_t)sub_100090A44;
      v630 = (uint64_t (*)(uint64_t, uint64_t))&unk_1001061A8;
      v631 = (void (*)(uint64_t))&buf;
      [(NSPConfigurationManager *)v499 refreshConfigurationWithReason:2 completionHandler:&block];
      _Block_object_dispose(&buf, 8);
    }
    int v18 = 1;
  }
  v68 = [(NSPConfiguration *)v498 resurrectionDate];
  v69 = [v497 resurrectionDate];
  unint64_t v70 = v68;
  unint64_t v71 = v69;
  v72 = (void *)v71;
  if (v70 | v71 && (!v70 || !v71 || ![(id)v70 isEqual:v71]))
  {

    v80 = [(NSPConfiguration *)v498 resurrectionDate];
    v81 = +[NSDateFormatter localizedStringFromDate:v80 dateStyle:1 timeStyle:2];

    v82 = nplog_obj();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v81;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "resurrection date changed to %@", (uint8_t *)&buf, 0xCu);
    }

    if (v499)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v652 = 0x3032000000;
      v653 = sub_100005DBC;
      v654 = sub_10008DB7C;
      v655 = (void ***)os_transaction_create();
      v83 = v499->_configuration;
      v84 = [(NSPConfiguration *)v83 resurrectionDate];
      BOOL v85 = v84 == 0;

      v86 = v499->_configuration;
      v87 = v86;
      if (v85)
      {
        [(NSPConfiguration *)v86 setConfigServerEnabled:&__kCFBooleanTrue];

        sub_10008D7D0((uint64_t)v499);
        sub_10008EBE4((id *)&v499->super.isa);
        v88 = NPGetInternalQueue();
        block = _NSConcreteStackBlock;
        uint64_t p_block = 3221225472;
        uint64_t v629 = (uint64_t)sub_10008FC3C;
        v630 = (uint64_t (*)(uint64_t, uint64_t))&unk_100105460;
        v631 = (void (*)(uint64_t))v499;
        p_long long buf = &buf;
        dispatch_async(v88, &block);
      }
      else
      {
        v88 = [(NSPConfiguration *)v86 resurrectionDate];

        sub_10008E870((uint64_t)v499);
        sub_10008E5A8((uint64_t)v499);
        sub_10008EF78((uint64_t)v499);
        v89 = v499->_configuration;
        [(NSPConfiguration *)v89 setResurrectionDate:v88];

        sub_10008DF90((id *)&v499->super.isa);
        v90 = NPGetInternalQueue();
        block = _NSConcreteStackBlock;
        uint64_t p_block = 3221225472;
        uint64_t v629 = (uint64_t)sub_10008FBCC;
        v630 = (uint64_t (*)(uint64_t, uint64_t))&unk_100105460;
        v631 = (void (*)(uint64_t))v499;
        p_long long buf = &buf;
        dispatch_async(v90, &block);
      }
      _Block_object_dispose(&buf, 8);
    }
    goto LABEL_128;
  }

  v73 = [(NSPConfiguration *)v498 userTier];
  unsigned int v74 = [v73 unsignedIntValue];
  v75 = [v497 userTier];
  LOBYTE(v74) = v74 == [v75 unsignedIntValue];

  if ((v74 & 1) == 0)
  {
    v76 = nplog_obj();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = [(NSPConfiguration *)v498 userTier];
      id v78 = [v77 unsignedIntValue];
      if (v78 >= 3)
      {
        v79 = +[NSString stringWithFormat:@"(unknown: %i)", v78];
      }
      else
      {
        v79 = *(&off_100106B48 + (int)v78);
      }
      id v91 = v79;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v91;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "user tier changed to %@", (uint8_t *)&buf, 0xCu);
    }
    if (v499)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v652 = 0x3032000000;
      v653 = sub_100005DBC;
      v654 = sub_10008DB7C;
      v655 = (void ***)os_transaction_create();
      v92 = NPGetInternalQueue();
      block = _NSConcreteStackBlock;
      uint64_t p_block = 3221225472;
      uint64_t v629 = (uint64_t)sub_1000900F4;
      v630 = (uint64_t (*)(uint64_t, uint64_t))&unk_100105460;
      v631 = (void (*)(uint64_t))v499;
      p_long long buf = &buf;
      dispatch_async(v92, &block);

      _Block_object_dispose(&buf, 8);
    }
    int v18 = 1;
  }
  v93 = [(NSPConfiguration *)v498 userPreferredTier];
  unsigned int v94 = [v93 unsignedIntValue];
  v95 = [v497 userPreferredTier];
  LOBYTE(v94) = v94 == [v95 unsignedIntValue];

  if ((v94 & 1) == 0)
  {
    v96 = nplog_obj();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      v97 = [(NSPConfiguration *)v498 userTier];
      id v98 = [v97 unsignedIntValue];
      if (v98 >= 3)
      {
        v99 = +[NSString stringWithFormat:@"(unknown: %i)", v98];
      }
      else
      {
        v99 = *(&off_100106B48 + (int)v98);
      }
      id v100 = v99;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v100;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "user preferred tier changed to %@", (uint8_t *)&buf, 0xCu);
    }
    if (v499)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v652 = 0x3032000000;
      v653 = sub_100005DBC;
      v654 = sub_10008DB7C;
      v655 = (void ***)os_transaction_create();
      v101 = NPGetInternalQueue();
      block = _NSConcreteStackBlock;
      uint64_t p_block = 3221225472;
      uint64_t v629 = (uint64_t)sub_100090164;
      v630 = (uint64_t (*)(uint64_t, uint64_t))&unk_100105460;
      v631 = (void (*)(uint64_t))v499;
      p_long long buf = &buf;
      dispatch_async(v101, &block);

      _Block_object_dispose(&buf, 8);
    }
    int v18 = 1;
  }
  if (v6 != (void *)[(NSPConfigurationManager *)v499 effectiveUserTier])
  {
    v102 = nplog_obj();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      id v103 = [(NSPConfigurationManager *)v499 effectiveUserTier];
      if (v103 >= 3)
      {
        v104 = +[NSString stringWithFormat:@"(unknown: %i)", v103];
      }
      else
      {
        v104 = *(&off_100106B48 + (int)v103);
      }
      id v105 = v104;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v105;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "effective user tier changed to %@", (uint8_t *)&buf, 0xCu);
    }
    if (v499)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v652 = 0x3032000000;
      v653 = sub_100005DBC;
      v654 = sub_10008DB7C;
      v655 = (void ***)os_transaction_create();
      v106 = NPGetInternalQueue();
      block = _NSConcreteStackBlock;
      uint64_t p_block = 3221225472;
      uint64_t v629 = (uint64_t)sub_100090228;
      v630 = (uint64_t (*)(uint64_t, uint64_t))&unk_100105460;
      v631 = (void (*)(uint64_t))v499;
      p_long long buf = &buf;
      dispatch_async(v106, &block);

      _Block_object_dispose(&buf, 8);
    }
    int v18 = 1;
  }
  v107 = [(NSPConfiguration *)v498 willResetSubscriberTierTomorrow];
  v108 = [v497 willResetSubscriberTierTomorrow];
  if (v107 == v108)
  {
    v110 = [(NSPConfiguration *)v498 resetTomorrowDate];
    v111 = [v497 resetTomorrowDate];
    BOOL v109 = v110 != v111;
  }
  else
  {
    BOOL v109 = 1;
  }

  v112 = [(NSPConfiguration *)v498 proxyConfiguration];
  unsigned int v113 = [v112 enabled];
  v114 = [v497 proxyConfiguration];
  unsigned int v115 = [v114 enabled];

  if (v113 != v115)
  {
    v116 = nplog_obj();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      v117 = [(NSPConfiguration *)v498 proxyConfiguration];
      unsigned int v118 = [v117 enabled];
      v119 = "disabled";
      if (v118) {
        v119 = "enabled";
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v119;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "proxy token fetch state changed to %s", (uint8_t *)&buf, 0xCu);
    }
    if (v499)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v652 = 0x3032000000;
      v653 = sub_100005DBC;
      v654 = sub_10008DB7C;
      v655 = (void ***)os_transaction_create();
      v120 = v499->_configuration;
      v121 = [(NSPConfiguration *)v120 proxyConfiguration];
      unsigned int v122 = [v121 enabled];

      v123 = NPGetInternalQueue();
      v124 = v123;
      block = _NSConcreteStackBlock;
      uint64_t p_block = 3221225472;
      if (v122) {
        v125 = sub_10008FE98;
      }
      else {
        v125 = sub_10008FF08;
      }
      uint64_t v629 = (uint64_t)v125;
      v630 = (uint64_t (*)(uint64_t, uint64_t))&unk_100105460;
      v631 = (void (*)(uint64_t))v499;
      p_long long buf = &buf;
      dispatch_async(v123, &block);

      _Block_object_dispose(&buf, 8);
    }
    goto LABEL_128;
  }
  v126 = [(NSPConfiguration *)v498 proxyConfiguration];
  unsigned int v127 = [v126 enabled];

  v18 |= v109;
  if (!v127)
  {
LABEL_127:
    if (!v18) {
      goto LABEL_137;
    }
    goto LABEL_128;
  }
  int v483 = v18;
  v128 = [(NSPConfiguration *)v498 proxyAccountType];
  v129 = [v497 proxyAccountType];
  int v130 = sub_100096318(v128, v129);

  if (v130)
  {
    v131 = nplog_obj();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      v132 = [(NSPConfiguration *)v498 proxyAccountType];
      id v133 = +[NSPConfiguration proxyAccountTypeToString:v132];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v133;
      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "proxy account type changed to %@", (uint8_t *)&buf, 0xCu);
    }
    int v483 = 1;
  }
  v134 = [(NSPConfiguration *)v498 proxyAccountUnlimited];
  v135 = [v497 proxyAccountUnlimited];
  int v136 = sub_100096318(v134, v135);

  if (v136)
  {
    v137 = nplog_obj();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      v138 = [(NSPConfiguration *)v498 proxyAccountUnlimited];
      unsigned int v139 = [v138 BOOLValue];
      v140 = "false";
      if (v139) {
        v140 = "true";
      }
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v140;
      _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "proxy account unlimited changed to %{public}s", (uint8_t *)&buf, 0xCu);
    }
    int v483 = 1;
  }
  v141 = [(NSPConfiguration *)v498 proxyConfiguration];
  v142 = [v141 authInfo];
  v143 = [v142 authURL];
  v144 = [v497 proxyConfiguration];
  v145 = [v144 authInfo];
  v146 = [v145 authURL];
  if (sub_100096318(v143, v146))
  {
  }
  else
  {
    id obj = [(NSPConfiguration *)v498 proxyConfiguration];
    id v536 = [obj authInfo];
    v517 = [v536 accessTokenURL];
    id v528 = [v497 proxyConfiguration];
    id v522 = [v528 authInfo];
    v512 = [v522 accessTokenURL];
    if (sub_100096318(v517, v512))
    {
      char v155 = 1;
    }
    else
    {
      v507 = [(NSPConfiguration *)v498 proxyConfiguration];
      v500 = [v507 authInfo];
      id v502 = [v497 proxyConfiguration];
      v156 = [v502 authInfo];
      if (sub_10009187C((uint64_t)v499, v500, v156))
      {
        id v495 = [(NSPConfiguration *)v498 proxyConfiguration];
        v492 = [v495 authInfo];
        v488 = [v492 accessTokenKnownOrigins];
        v490 = [v497 proxyConfiguration];
        v486 = [v490 authInfo];
        v157 = [v486 accessTokenKnownOrigins];
        if (sub_100096318(v488, v157))
        {
          char v155 = 1;
        }
        else
        {
          v481 = [(NSPConfiguration *)v498 proxyConfiguration];
          v484 = [v481 authInfo];
          v479 = [v484 accessTokenBlockedIssuers];
          v477 = [v497 proxyConfiguration];
          v473 = [v477 authInfo];
          v475 = [v473 accessTokenBlockedIssuers];
          if (sub_100096318(v479, v475))
          {
            char v155 = 1;
          }
          else
          {
            v471 = [(NSPConfiguration *)v498 proxyConfiguration];
            v469 = [v471 authInfo];
            unsigned int v158 = [v469 authType];
            v467 = [v497 proxyConfiguration];
            id v465 = [v467 authInfo];
            if (v158 == [v465 authType])
            {
              v464 = [(NSPConfiguration *)v498 proxyConfiguration];
              v463 = [v464 authInfo];
              v462 = [v463 nonDefaultAttesters];
              v461 = [v497 proxyConfiguration];
              v460 = [v461 authInfo];
              v159 = [v460 nonDefaultAttesters];
              char v155 = sub_100096318(v462, v159);
            }
            else
            {
              char v155 = 1;
            }
          }
        }
      }
      else
      {
        char v155 = 1;
      }
    }
    if ((v155 & 1) == 0) {
      goto LABEL_162;
    }
  }
  v160 = nplog_obj();
  if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
  {
    v161 = [(NSPConfiguration *)v498 proxyConfiguration];
    v162 = [v161 authInfo];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v162;
    _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "authentication info updated to %@", (uint8_t *)&buf, 0xCu);
  }
  sub_10008FF78((uint64_t)v499);
  int v483 = 1;
LABEL_162:
  v163 = [(NSPConfiguration *)v498 proxyConfiguration];
  v487 = [v163 proxies];

  v164 = [v497 proxyConfiguration];
  v485 = [v164 proxies];

  id v165 = [v487 count];
  if (v165 != [v485 count])
  {
    v244 = nplog_obj();
    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v487;
      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "proxy info updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_100090298((uint64_t)v499);
    goto LABEL_288;
  }
  if (![v487 count]) {
    goto LABEL_226;
  }
  long long v626 = 0u;
  long long v625 = 0u;
  long long v624 = 0u;
  long long v623 = 0u;
  id obja = v487;
  v537 = (char *)[obja countByEnumeratingWithState:&v623 objects:v650 count:16];
  if (!v537) {
    goto LABEL_225;
  }
  id v166 = *(id *)v624;
  id v523 = *(id *)v624;
  do
  {
    v167 = 0;
    do
    {
      if (*(id *)v624 != v166)
      {
        v168 = v167;
        objc_enumerationMutation(obja);
        v167 = v168;
      }
      v529 = v167;
      v169 = *(void **)(*((void *)&v623 + 1) + 8 * (void)v167);
      long long v619 = 0u;
      long long v620 = 0u;
      long long v621 = 0u;
      long long v622 = 0u;
      id v170 = v485;
      id v171 = [v170 countByEnumeratingWithState:&v619 objects:v649 count:16];
      if (!v171)
      {
LABEL_279:

        v245 = nplog_obj();
        if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = obja;
          _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_DEFAULT, "proxy info updated to %@", (uint8_t *)&buf, 0xCu);
        }

        sub_100090298((uint64_t)v499);
        goto LABEL_288;
      }
      uint64_t v172 = *(void *)v620;
LABEL_171:
      uint64_t v173 = 0;
      while (1)
      {
        if (*(void *)v620 != v172) {
          objc_enumerationMutation(v170);
        }
        v174 = *(void **)(*((void *)&v619 + 1) + 8 * v173);
        unsigned int v175 = [v169 proxyHop];
        if (v175 != [v174 proxyHop]) {
          goto LABEL_220;
        }
        v176 = [v169 proxyURL];
        v177 = [v174 proxyURL];
        unint64_t v178 = v176;
        unint64_t v179 = v177;
        v180 = (void *)v179;
        if (!(v178 | v179) || v178 && v179 && [(id)v178 isEqual:v179])
        {

          v181 = [v169 tcpProxyFqdn];
          v182 = [v174 tcpProxyFqdn];
          unint64_t v178 = v181;
          unint64_t v183 = v182;
          v180 = (void *)v183;
          if (!(v178 | v183) || v178 && v183 && [(id)v178 isEqual:v183])
          {

            v184 = [v169 proxyKeyInfos];
            v185 = [v174 proxyKeyInfos];
            unint64_t v178 = v184;
            unint64_t v186 = v185;
            v180 = (void *)v186;
            if (!(v178 | v186) || v178 && v186 && [(id)v178 isEqual:v186])
            {

              v187 = [v169 tokenKeyInfo];
              v188 = [v174 tokenKeyInfo];
              unint64_t v178 = v187;
              unint64_t v189 = v188;
              v180 = (void *)v189;
              if (!(v178 | v189) || v178 && v189 && [(id)v178 isEqual:v189])
              {

                v190 = [v169 preferredPathConfigUri];
                v191 = [v174 preferredPathConfigUri];
                unint64_t v178 = v190;
                unint64_t v192 = v191;
                v180 = (void *)v192;
                if (!(v178 | v192) || v178 && v192 && [(id)v178 isEqual:v192])
                {

                  v193 = [v169 tokenChallenge];
                  v194 = [v174 tokenChallenge];
                  unint64_t v178 = v193;
                  unint64_t v195 = v194;
                  v180 = (void *)v195;
                  if (!(v178 | v195) || v178 && v195 && [(id)v178 isEqual:v195])
                  {

                    v196 = [v169 bootstrapAddresses];
                    v197 = [v174 bootstrapAddresses];
                    unint64_t v178 = v196;
                    unint64_t v198 = v197;
                    v180 = (void *)v198;
                    if (!(v178 | v198) || v178 && v198 && [(id)v178 isEqual:v198])
                    {

                      v199 = [v169 allowedNextHops];
                      v200 = [v174 allowedNextHops];
                      unint64_t v178 = v199;
                      unint64_t v201 = v200;
                      v180 = (void *)v201;
                      if (!(v178 | v201) || v178 && v201 && [(id)v178 isEqual:v201]) {
                        break;
                      }
                    }
                  }
                }
              }
            }
          }
        }

LABEL_220:
        if (v171 == (id)++v173)
        {
          id v171 = [v170 countByEnumeratingWithState:&v619 objects:v649 count:16];
          if (!v171) {
            goto LABEL_279;
          }
          goto LABEL_171;
        }
      }

      v202 = [v169 preferredPathPatterns];
      v203 = [v174 preferredPathPatterns];
      char v204 = sub_100096318(v202, v203);

      if (v204) {
        goto LABEL_220;
      }
      v205 = [v169 proxyVersion];
      v206 = [v174 proxyVersion];
      char v207 = sub_100096318(v205, v206);

      if (v207) {
        goto LABEL_220;
      }
      unsigned int v208 = [v169 fallbackSupportsUDPProxying];
      if (v208 != [v174 fallbackSupportsUDPProxying]) {
        goto LABEL_220;
      }
      unsigned int v209 = [v169 algorithm];
      if (v209 != [v174 algorithm]) {
        goto LABEL_220;
      }

      v167 = v529 + 1;
      id v166 = v523;
    }
    while (v529 + 1 != v537);
    v537 = (char *)[obja countByEnumeratingWithState:&v623 objects:v650 count:16];
    id v166 = v523;
  }
  while (v537);
LABEL_225:

LABEL_226:
  v210 = [(NSPConfiguration *)v498 proxyConfiguration];
  v508 = [v210 pathWeights];

  v211 = [v497 proxyConfiguration];
  id v524 = [v211 pathWeights];

  id v212 = [v508 count];
  if (v212 != [v524 count])
  {
    v246 = nplog_obj();
    if (os_log_type_enabled(v246, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v508;
      _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_DEFAULT, "proxy path list updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_100090298((uint64_t)v499);
LABEL_288:
    int v483 = 1;
    goto LABEL_289;
  }
  if (![v508 count]) {
    goto LABEL_251;
  }
  long long v618 = 0u;
  long long v617 = 0u;
  long long v616 = 0u;
  long long v615 = 0u;
  id v503 = v508;
  v518 = (char *)[v503 countByEnumeratingWithState:&v615 objects:v648 count:16];
  if (!v518) {
    goto LABEL_250;
  }
  uint64_t v513 = *(void *)v616;
  while (2)
  {
    v213 = 0;
    while (2)
    {
      if (*(void *)v616 != v513)
      {
        v214 = v213;
        objc_enumerationMutation(v503);
        v213 = v214;
      }
      v530 = v213;
      v215 = *(void **)(*((void *)&v615 + 1) + 8 * (void)v213);
      long long v611 = 0u;
      long long v612 = 0u;
      long long v613 = 0u;
      long long v614 = 0u;
      id v538 = v524;
      id v216 = [v538 countByEnumeratingWithState:&v611 objects:v647 count:16];
      if (!v216)
      {
LABEL_285:

        v247 = nplog_obj();
        if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v503;
          _os_log_impl((void *)&_mh_execute_header, v247, OS_LOG_TYPE_DEFAULT, "proxy path updated to %@", (uint8_t *)&buf, 0xCu);
        }

        sub_100090298((uint64_t)v499);
        goto LABEL_288;
      }
      id objb = *(id *)v612;
      while (2)
      {
        uint64_t v217 = 0;
LABEL_236:
        if (*(id *)v612 != objb) {
          objc_enumerationMutation(v538);
        }
        v218 = *(void **)(*((void *)&v611 + 1) + 8 * v217);
        unsigned int v219 = [v215 weight];
        if (v219 != [v218 weight]
          || (id v220 = [v215 proxiesCount], v220 != objc_msgSend(v218, "proxiesCount")))
        {
LABEL_245:
          if ((id)++v217 == v216)
          {
            id v216 = [v538 countByEnumeratingWithState:&v611 objects:v647 count:16];
            if (!v216) {
              goto LABEL_285;
            }
            continue;
          }
          goto LABEL_236;
        }
        break;
      }
      if ([v215 proxiesCount])
      {
        uint64_t v221 = 0;
        do
        {
          v222 = [v487 objectAtIndex:*((unsigned int *)[v215 proxies] + v221)];
          v223 = [v485 objectAtIndex:*((unsigned int *)[v218 proxies] + v221)];
          v224 = [v222 proxyURL];
          v225 = [v223 proxyURL];
          unsigned __int8 v226 = [v224 isEqualToString:v225];

          if ((v226 & 1) == 0) {
            goto LABEL_245;
          }
        }
        while (++v221 < (unint64_t)[v215 proxiesCount]);
      }

      v213 = v530 + 1;
      if (v530 + 1 != v518) {
        continue;
      }
      break;
    }
    v518 = (char *)[v503 countByEnumeratingWithState:&v615 objects:v648 count:16];
    if (v518) {
      continue;
    }
    break;
  }
LABEL_250:

LABEL_251:
  v227 = [(NSPConfiguration *)v498 proxyConfiguration];
  v509 = [v227 fallbackPathWeights];

  v228 = [v497 proxyConfiguration];
  id v525 = [v228 fallbackPathWeights];

  id v229 = [v509 count];
  if (v229 == [v525 count])
  {
    if (![v509 count]) {
      goto LABEL_588;
    }
    long long v610 = 0u;
    long long v609 = 0u;
    long long v608 = 0u;
    long long v607 = 0u;
    id v504 = v509;
    v519 = (char *)[v504 countByEnumeratingWithState:&v607 objects:v646 count:16];
    if (!v519) {
      goto LABEL_587;
    }
    uint64_t v514 = *(void *)v608;
    while (1)
    {
      v230 = 0;
LABEL_256:
      if (*(void *)v608 != v514)
      {
        v231 = v230;
        objc_enumerationMutation(v504);
        v230 = v231;
      }
      v531 = v230;
      v232 = *(void **)(*((void *)&v607 + 1) + 8 * (void)v230);
      long long v603 = 0u;
      long long v604 = 0u;
      long long v605 = 0u;
      long long v606 = 0u;
      id v539 = v525;
      id v233 = [v539 countByEnumeratingWithState:&v603 objects:v645 count:16];
      if (!v233)
      {
LABEL_584:

        v459 = nplog_obj();
        if (os_log_type_enabled(v459, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v504;
          _os_log_impl((void *)&_mh_execute_header, v459, OS_LOG_TYPE_DEFAULT, "fallback proxy path updated to %@", (uint8_t *)&buf, 0xCu);
        }

        sub_100090298((uint64_t)v499);
        int v483 = 1;
        goto LABEL_587;
      }
      id objc = *(id *)v604;
LABEL_260:
      uint64_t v234 = 0;
      while (1)
      {
        if (*(id *)v604 != objc) {
          objc_enumerationMutation(v539);
        }
        v235 = *(void **)(*((void *)&v603 + 1) + 8 * v234);
        unsigned int v236 = [v232 weight];
        if (v236 == [v235 weight])
        {
          id v237 = [v232 proxiesCount];
          if (v237 == [v235 proxiesCount]) {
            break;
          }
        }
LABEL_270:
        if ((id)++v234 == v233)
        {
          id v233 = [v539 countByEnumeratingWithState:&v603 objects:v645 count:16];
          if (v233) {
            goto LABEL_260;
          }
          goto LABEL_584;
        }
      }
      if ([v232 proxiesCount]) {
        break;
      }
LABEL_273:

      v230 = v531 + 1;
      if (v531 + 1 != v519) {
        goto LABEL_256;
      }
      v519 = (char *)[v504 countByEnumeratingWithState:&v607 objects:v646 count:16];
      if (!v519)
      {
LABEL_587:

        goto LABEL_588;
      }
    }
    uint64_t v238 = 0;
    while (1)
    {
      v239 = [v487 objectAtIndex:*((unsigned int *)[v232 proxies] + v238)];
      v240 = [v485 objectAtIndex:*((unsigned int *)[v235 proxies] + v238)];
      v241 = [v239 proxyURL];
      v242 = [v240 proxyURL];
      unsigned __int8 v243 = [v241 isEqualToString:v242];

      if ((v243 & 1) == 0) {
        goto LABEL_270;
      }
      if (++v238 >= (unint64_t)[v232 proxiesCount]) {
        goto LABEL_273;
      }
    }
  }
  v348 = nplog_obj();
  if (os_log_type_enabled(v348, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v509;
    _os_log_impl((void *)&_mh_execute_header, v348, OS_LOG_TYPE_DEFAULT, "fallback proxy path list updated to %@", (uint8_t *)&buf, 0xCu);
  }

  sub_100090298((uint64_t)v499);
  int v483 = 1;
LABEL_588:

LABEL_289:
  v248 = [(NSPConfiguration *)v498 proxyConfiguration];
  v478 = [v248 resolvers];

  v249 = [v497 proxyConfiguration];
  v480 = [v249 resolvers];

  id v250 = [v478 count];
  if (v250 == [v480 count])
  {
    if ([v478 count])
    {
      long long v602 = 0u;
      long long v600 = 0u;
      long long v601 = 0u;
      long long v599 = 0u;
      id v532 = v478;
      id objd = [v532 countByEnumeratingWithState:&v599 objects:v644 count:16];
      if (objd)
      {
        id v540 = *(id *)v600;
        while (2)
        {
          for (i = 0; i != objd; i = (char *)i + 1)
          {
            if (*(id *)v600 != v540) {
              objc_enumerationMutation(v532);
            }
            v252 = *(void **)(*((void *)&v599 + 1) + 8 * i);
            long long v595 = 0u;
            long long v596 = 0u;
            long long v597 = 0u;
            long long v598 = 0u;
            id v253 = v480;
            id v254 = [v253 countByEnumeratingWithState:&v595 objects:v643 count:16];
            if (!v254)
            {

LABEL_359:
              v291 = nplog_obj();
              if (os_log_type_enabled(v291, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v532;
                _os_log_impl((void *)&_mh_execute_header, v291, OS_LOG_TYPE_DEFAULT, "resolver info updated to %@", (uint8_t *)&buf, 0xCu);
              }

              sub_100090414(v499, 1);
              goto LABEL_362;
            }
            char v255 = 0;
            uint64_t v256 = *(void *)v596;
            do
            {
              for (j = 0; j != v254; j = (char *)j + 1)
              {
                if (*(void *)v596 != v256) {
                  objc_enumerationMutation(v253);
                }
                v258 = *(void **)(*((void *)&v595 + 1) + 8 * (void)j);
                v259 = [v252 dohURL];
                v260 = [v258 dohURL];
                unint64_t v261 = v259;
                unint64_t v262 = v260;
                v263 = (void *)v262;
                if (v261 | v262 && (!v261 || !v262 || ![(id)v261 isEqual:v262])) {
                  goto LABEL_311;
                }

                v264 = [v252 obliviousDoHConfig];
                v265 = [v258 obliviousDoHConfig];
                unint64_t v261 = v264;
                unint64_t v266 = v265;
                v263 = (void *)v266;
                if (!(v261 | v266) || v261 && v266 && [(id)v261 isEqual:v266])
                {

                  unsigned int v267 = [v252 weight];
                  v255 |= v267 == [v258 weight];
                }
                else
                {
LABEL_311:
                }
              }
              id v254 = [v253 countByEnumeratingWithState:&v595 objects:v643 count:16];
            }
            while (v254);

            if ((v255 & 1) == 0) {
              goto LABEL_359;
            }
          }
          id objd = [v532 countByEnumeratingWithState:&v599 objects:v644 count:16];
          if (objd) {
            continue;
          }
          break;
        }
      }
    }
    long long v593 = 0u;
    long long v594 = 0u;
    long long v591 = 0u;
    long long v592 = 0u;
    v268 = [(NSPConfiguration *)v498 proxyConfiguration];
    id obje = [v268 policyTierMaps];

    id v541 = [obje countByEnumeratingWithState:&v591 objects:v642 count:16];
    if (v541)
    {
      v269 = 0;
      v270 = 0;
      id v533 = *(id *)v592;
      while (1)
      {
        for (k = 0; k != v541; k = (char *)k + 1)
        {
          if (*(id *)v592 != v533) {
            objc_enumerationMutation(obje);
          }
          v272 = *(void **)(*((void *)&v591 + 1) + 8 * (void)k);
          long long v587 = 0u;
          long long v588 = 0u;
          long long v589 = 0u;
          long long v590 = 0u;
          v273 = [v497 proxyConfiguration];
          v274 = [v273 policyTierMaps];

          id v275 = [v274 countByEnumeratingWithState:&v587 objects:v641 count:16];
          if (!v275) {
            goto LABEL_343;
          }
          uint64_t v276 = *(void *)v588;
          while (2)
          {
            for (m = 0; m != v275; m = (char *)m + 1)
            {
              if (*(void *)v588 != v276) {
                objc_enumerationMutation(v274);
              }
              v278 = *(void **)(*((void *)&v587 + 1) + 8 * (void)m);
              unsigned int v279 = [v272 tier];
              if (v279 == [v278 tier])
              {
                v280 = [v272 policy];

                v281 = [v278 policy];

                id v282 = [v280 conditionsCount];
                if (v282 == [v281 conditionsCount])
                {
                  if (![v280 conditionsCount] || !objc_msgSend(v280, "conditionsCount"))
                  {
LABEL_342:
                    v270 = v281;
                    v269 = v280;
                    goto LABEL_343;
                  }
                  uint64_t v283 = 0;
                  while (1)
                  {
                    int v284 = *((_DWORD *)[v280 conditions] + v283);
                    if (![v281 conditionsCount]) {
                      break;
                    }
                    uint64_t v285 = 0;
                    while (*((_DWORD *)[v281 conditions] + v285) != v284)
                    {
                      if (++v285 >= (unint64_t)[v281 conditionsCount]) {
                        goto LABEL_349;
                      }
                    }
                    if (++v283 >= (unint64_t)[v280 conditionsCount]) {
                      goto LABEL_342;
                    }
                  }
LABEL_349:
                  v287 = nplog_obj();
                  if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf) = 138412290;
                    *(void *)((char *)&buf + 4) = v280;
                    goto LABEL_351;
                  }
                }
                else
                {
                  v287 = nplog_obj();
                  if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf) = 138412290;
                    *(void *)((char *)&buf + 4) = v280;
LABEL_351:
                    _os_log_impl((void *)&_mh_execute_header, v287, OS_LOG_TYPE_DEFAULT, "policy information updated to %@", (uint8_t *)&buf, 0xCu);
                  }
                }

                sub_100090414(v499, 0);
                int v483 = 1;
                goto LABEL_357;
              }
            }
            id v275 = [v274 countByEnumeratingWithState:&v587 objects:v641 count:16];
            if (v275) {
              continue;
            }
            break;
          }
LABEL_343:
        }
        id v541 = [obje countByEnumeratingWithState:&v591 objects:v642 count:16];
        if (!v541) {
          goto LABEL_354;
        }
      }
    }
    v269 = 0;
    v270 = 0;
LABEL_354:

    v288 = [(NSPConfiguration *)v498 proxyTrafficState];
    v289 = [v497 proxyTrafficState];
    int v290 = sub_100096318(v288, v289);

    if (v290)
    {
      sub_100090414(v499, 0);
      int v483 = 1;
    }
    v281 = v270;
    v280 = v269;
LABEL_357:
  }
  else
  {
    v286 = nplog_obj();
    if (os_log_type_enabled(v286, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v478;
      _os_log_impl((void *)&_mh_execute_header, v286, OS_LOG_TYPE_DEFAULT, "resolver info updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_100090414(v499, 1);
LABEL_362:
    int v483 = 1;
  }
  v292 = [(NSPConfiguration *)v498 proxyConfiguration];
  v476 = [v292 obliviousConfigs];

  v293 = [v497 proxyConfiguration];
  v474 = [v293 obliviousConfigs];

  id v294 = [v476 count];
  if (v294 == [v474 count])
  {
    if ([v476 count])
    {
      long long v585 = 0u;
      long long v586 = 0u;
      long long v583 = 0u;
      long long v584 = 0u;
      id v466 = v476;
      id v470 = [v466 countByEnumeratingWithState:&v583 objects:v640 count:16];
      if (!v470) {
        goto LABEL_454;
      }
      uint64_t v468 = *(void *)v584;
LABEL_367:
      uint64_t v295 = 0;
LABEL_368:
      if (*(void *)v584 != v468)
      {
        uint64_t v296 = v295;
        objc_enumerationMutation(v466);
        uint64_t v295 = v296;
      }
      uint64_t v472 = v295;
      v515 = *(void **)(*((void *)&v583 + 1) + 8 * v295);
      long long v579 = 0u;
      long long v580 = 0u;
      long long v581 = 0u;
      long long v582 = 0u;
      id v496 = v474;
      id v505 = [v496 countByEnumeratingWithState:&v579 objects:v639 count:16];
      if (v505)
      {
        char v482 = 0;
        uint64_t v501 = *(void *)v580;
        while (1)
        {
          uint64_t v297 = 0;
          do
          {
            if (*(void *)v580 != v501)
            {
              uint64_t v298 = v297;
              objc_enumerationMutation(v496);
              uint64_t v297 = v298;
            }
            uint64_t v510 = v297;
            v520 = *(void **)(*((void *)&v579 + 1) + 8 * v297);
            v299 = [v515 obliviousHTTPConfig];
            v300 = [v520 obliviousHTTPConfig];
            unint64_t v301 = v299;
            unint64_t v302 = v300;
            v303 = (void *)v302;
            id v526 = (id)v301;
            id v534 = (id)v302;
            if (v301 | v302)
            {
              v307 = (void *)v302;
              if (!v301) {
                goto LABEL_435;
              }
              v307 = (void *)v302;
              if (!v302) {
                goto LABEL_435;
              }
              unsigned int v346 = [(id)v301 isEqual:v302];
              v303 = v534;
              v307 = v534;
              if (!v346) {
                goto LABEL_435;
              }
            }

            v304 = [v515 transparencyKeyBundle];
            v305 = [v520 transparencyKeyBundle];
            unint64_t v301 = v304;
            unint64_t v306 = v305;
            v307 = (void *)v306;
            if (v301 | v306)
            {
              v312 = (void *)v306;
              unint64_t v310 = v301;
              if (!v301) {
                goto LABEL_434;
              }
              v312 = (void *)v306;
              unint64_t v310 = v301;
              if (!v306) {
                goto LABEL_434;
              }
              v312 = (void *)v306;
              unint64_t v310 = v301;
              if (![(id)v301 isEqual:v306]) {
                goto LABEL_434;
              }
            }

            v308 = [v515 transparencyProof];
            v309 = [v520 transparencyProof];
            unint64_t v310 = v308;
            unint64_t v311 = v309;
            v312 = (void *)v311;
            if (v310 | v311)
            {
              v317 = (void *)v311;
              unint64_t v315 = v310;
              if (!v310) {
                goto LABEL_433;
              }
              v317 = (void *)v311;
              unint64_t v315 = v310;
              if (!v311) {
                goto LABEL_433;
              }
              v317 = (void *)v311;
              unint64_t v315 = v310;
              if (![(id)v310 isEqual:v311]) {
                goto LABEL_433;
              }
            }

            v313 = [v515 transparencyInternalProof];
            v314 = [v520 transparencyInternalProof];
            unint64_t v315 = v313;
            unint64_t v316 = v314;
            v317 = (void *)v316;
            if (v315 | v316 && (!v315 || !v316 || ![(id)v315 isEqual:v316]))
            {

LABEL_433:
LABEL_434:

LABEL_435:
LABEL_436:

              goto LABEL_437;
            }

            unsigned int v318 = [v515 obliviousHTTPType];
            if (v318 != [v520 obliviousHTTPType]) {
              goto LABEL_433;
            }
            v319 = [v515 obliviousTargets];
            id v320 = [v319 count];
            v321 = [v520 obliviousTargets];
            BOOL v322 = v320 == [v321 count];

            if (!v322) {
              goto LABEL_438;
            }
            long long v577 = 0u;
            long long v578 = 0u;
            long long v575 = 0u;
            long long v576 = 0u;
            id v526 = [v515 obliviousTargets];
            id v491 = [v526 countByEnumeratingWithState:&v575 objects:v638 count:16];
            if (!v491) {
              goto LABEL_416;
            }
            uint64_t v489 = *(void *)v576;
            while (2)
            {
              uint64_t v323 = 0;
              while (2)
              {
                if (*(void *)v576 != v489)
                {
                  uint64_t v324 = v323;
                  objc_enumerationMutation(v526);
                  uint64_t v323 = v324;
                }
                uint64_t v493 = v323;
                v325 = *(void **)(*((void *)&v575 + 1) + 8 * v323);
                long long v571 = 0u;
                long long v572 = 0u;
                long long v573 = 0u;
                long long v574 = 0u;
                id v534 = [v520 obliviousTargets];
                id objf = [v534 countByEnumeratingWithState:&v571 objects:v637 count:16];
                if (!objf) {
                  goto LABEL_436;
                }
                id v542 = *(id *)v572;
LABEL_388:
                uint64_t v326 = 0;
                while (1)
                {
                  if (*(id *)v572 != v542) {
                    objc_enumerationMutation(v534);
                  }
                  v327 = *(void **)(*((void *)&v571 + 1) + 8 * v326);
                  v328 = [v325 targetHost];
                  v329 = [v327 targetHost];
                  unint64_t v330 = v328;
                  unint64_t v331 = v329;
                  v332 = (void *)v331;
                  if (v330 | v331)
                  {
                    v337 = (void *)v331;
                    unint64_t v335 = v330;
                    if (!v330) {
                      goto LABEL_410;
                    }
                    v337 = (void *)v331;
                    unint64_t v335 = v330;
                    if (!v331) {
                      goto LABEL_410;
                    }
                    v337 = (void *)v331;
                    unint64_t v335 = v330;
                    if (![(id)v330 isEqual:v331]) {
                      goto LABEL_410;
                    }
                  }

                  v333 = [v325 proxyURLPath];
                  v334 = [v327 proxyURLPath];
                  unint64_t v335 = v333;
                  unint64_t v336 = v334;
                  v337 = (void *)v336;
                  if (v335 | v336)
                  {
                    v342 = (void *)v336;
                    unint64_t v340 = v335;
                    if (!v335) {
                      goto LABEL_409;
                    }
                    v342 = (void *)v336;
                    unint64_t v340 = v335;
                    if (!v336) {
                      goto LABEL_409;
                    }
                    v342 = (void *)v336;
                    unint64_t v340 = v335;
                    if (![(id)v335 isEqual:v336]) {
                      goto LABEL_409;
                    }
                  }

                  v338 = [v325 processes];
                  v339 = [v327 processes];
                  unint64_t v340 = v338;
                  unint64_t v341 = v339;
                  v342 = (void *)v341;
                  if (v340 | v341
                    && (!v340 || !v341 || ([(id)v340 isEqual:v341] & 1) == 0))
                  {

LABEL_409:
LABEL_410:

                    goto LABEL_411;
                  }

                  unsigned int v343 = [v325 proxyIndex];
                  if (v343 != [v327 proxyIndex]) {
                    goto LABEL_409;
                  }
                  unsigned int v344 = [v325 weight];
                  BOOL v345 = v344 == [v327 weight];

                  if (v345) {
                    break;
                  }
LABEL_411:
                  if (objf == (id)++v326)
                  {
                    id objf = [v534 countByEnumeratingWithState:&v571 objects:v637 count:16];
                    if (objf) {
                      goto LABEL_388;
                    }
                    goto LABEL_436;
                  }
                }

                uint64_t v323 = v493 + 1;
                if ((id)(v493 + 1) != v491) {
                  continue;
                }
                break;
              }
              id v491 = [v526 countByEnumeratingWithState:&v575 objects:v638 count:16];
              if (v491) {
                continue;
              }
              break;
            }
LABEL_416:
            char v482 = 1;
LABEL_437:

LABEL_438:
            uint64_t v297 = v510 + 1;
          }
          while ((id)(v510 + 1) != v505);
          id v505 = [v496 countByEnumeratingWithState:&v579 objects:v639 count:16];
          if (!v505)
          {

            if ((v482 & 1) == 0) {
              goto LABEL_451;
            }
            uint64_t v295 = v472 + 1;
            if ((id)(v472 + 1) == v470)
            {
              id v470 = [v466 countByEnumeratingWithState:&v583 objects:v640 count:16];
              if (!v470) {
                goto LABEL_454;
              }
              goto LABEL_367;
            }
            goto LABEL_368;
          }
        }
      }

LABEL_451:
      v349 = nplog_obj();
      if (os_log_type_enabled(v349, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v466;
        _os_log_impl((void *)&_mh_execute_header, v349, OS_LOG_TYPE_DEFAULT, "oblivious configs updated to %@", (uint8_t *)&buf, 0xCu);
      }

      sub_100090298((uint64_t)v499);
      int v483 = 1;
LABEL_454:
    }
  }
  else
  {
    v347 = nplog_obj();
    if (os_log_type_enabled(v347, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v476;
      _os_log_impl((void *)&_mh_execute_header, v347, OS_LOG_TYPE_DEFAULT, "oblivious configs updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_100090298((uint64_t)v499);
    int v483 = 1;
  }
  v350 = [(NSPConfiguration *)v498 proxyConfiguration];
  unsigned int v351 = [v350 hasPreferredPathEnabledPercentage];
  v352 = [v497 proxyConfiguration];
  if (v351 == [v352 hasPreferredPathEnabledPercentage])
  {
    v353 = [(NSPConfiguration *)v498 proxyConfiguration];
    unsigned int v354 = [v353 preferredPathEnabledPercentage];
    v355 = [v497 proxyConfiguration];
    LOBYTE(v354) = v354 == [v355 preferredPathEnabledPercentage];

    if (v354) {
      goto LABEL_461;
    }
  }
  else
  {
  }
  v356 = nplog_obj();
  if (os_log_type_enabled(v356, OS_LOG_TYPE_DEFAULT))
  {
    v357 = [v497 proxyConfiguration];
    unsigned int v358 = [v357 hasPreferredPathEnabledPercentage];
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v358;
    _os_log_impl((void *)&_mh_execute_header, v356, OS_LOG_TYPE_DEFAULT, "preferred path enabled percentage changed to %u", (uint8_t *)&buf, 8u);
  }
  int v483 = 1;
LABEL_461:
  v359 = [(NSPConfiguration *)v498 proxyConfiguration];
  v521 = [v359 proxiedContentMaps];

  v360 = [v497 proxyConfiguration];
  id v535 = [v360 proxiedContentMaps];

  id v361 = [v521 count];
  if (v361 == [v535 count])
  {
    if ([v521 count])
    {
      long long v569 = 0u;
      long long v570 = 0u;
      long long v567 = 0u;
      long long v568 = 0u;
      id v506 = v521;
      v516 = (char *)[v506 countByEnumeratingWithState:&v567 objects:v636 count:16];
      if (!v516) {
        goto LABEL_519;
      }
      uint64_t v511 = *(void *)v568;
LABEL_465:
      v362 = 0;
LABEL_466:
      if (*(void *)v568 != v511)
      {
        v363 = v362;
        objc_enumerationMutation(v506);
        v362 = v363;
      }
      v527 = v362;
      v364 = *(void **)(*((void *)&v567 + 1) + 8 * (void)v362);
      long long v563 = 0u;
      long long v564 = 0u;
      long long v565 = 0u;
      long long v566 = 0u;
      id objg = v535;
      id v365 = [objg countByEnumeratingWithState:&v563 objects:v635 count:16];
      if (v365)
      {
        uint64_t v366 = 0;
        uint64_t v367 = *(void *)v564;
        while (1)
        {
          v368 = 0;
          do
          {
            uint64_t v369 = v366;
            if (*(void *)v564 != v367) {
              objc_enumerationMutation(objg);
            }
            v370 = *(void **)(*((void *)&v563 + 1) + 8 * (void)v368);
            v371 = [v364 identifier];
            v372 = [v370 identifier];
            unint64_t v373 = v371;
            unint64_t v374 = v372;
            v375 = (void *)v374;
            if (v373 | v374 && (!v373 || !v374 || ![(id)v373 isEqual:v374]))
            {
              v387 = v375;
              unint64_t v385 = v373;
LABEL_494:

LABEL_495:
              uint64_t v366 = v369;
              goto LABEL_496;
            }

            unsigned int v376 = [v364 enabled];
            if (v376 != [v370 enabled]) {
              goto LABEL_495;
            }
            unsigned int v377 = [v364 systemProcessOnly];
            if (v377 != [v370 systemProcessOnly]) {
              goto LABEL_495;
            }
            unsigned int v378 = [v364 matchExactHostnames];
            if (v378 != [v370 matchExactHostnames]) {
              goto LABEL_495;
            }
            unsigned int v379 = [v364 isPrivacyProxy];
            if (v379 != [v370 isPrivacyProxy]) {
              goto LABEL_495;
            }
            id v380 = [v364 proxiesCount];
            if (v380 != [v370 proxiesCount]) {
              goto LABEL_495;
            }
            unsigned int v381 = [v364 hasResolver];
            if (v381 != [v370 hasResolver]) {
              goto LABEL_495;
            }
            unsigned int v382 = [v364 resolver];
            if (v382 != [v370 resolver]) {
              goto LABEL_495;
            }
            v383 = [v364 hostnames];
            v384 = [v370 hostnames];
            unint64_t v385 = v383;
            unint64_t v386 = v384;
            v387 = (void *)v386;
            if (v385 | v386 && (!v385 || !v386 || ![(id)v385 isEqual:v386]))
            {
              v375 = v387;
              unint64_t v373 = v385;
              goto LABEL_494;
            }

            v388 = [v364 processes];
            v389 = [v370 processes];
            unint64_t v373 = v388;
            unint64_t v390 = v389;
            v375 = (void *)v390;
            if (v373 | v390 && (!v373 || !v390 || ([(id)v373 isEqual:v390] & 1) == 0))
            {

              goto LABEL_494;
            }

            unsigned int v543 = [v364 hasPercentEnabled];
            if (v543 != [v370 hasPercentEnabled]) {
              goto LABEL_494;
            }
            unsigned int v544 = [v364 percentEnabled];
            BOOL v545 = v544 == [v370 percentEnabled];

            if (!v545) {
              goto LABEL_495;
            }
            if ([v364 proxiesCount])
            {
              unint64_t v391 = 0;
              while (1)
              {
                int v392 = *((_DWORD *)[v364 proxies] + v391);
                if (v392 != *((_DWORD *)[v370 proxies] + v391)) {
                  goto LABEL_495;
                }
                ++v391;
                uint64_t v366 = 1;
                if (v391 >= (unint64_t)[v364 proxiesCount]) {
                  goto LABEL_496;
                }
              }
            }
            uint64_t v366 = 1;
LABEL_496:
            v368 = (char *)v368 + 1;
          }
          while (v368 != v365);
          id v393 = [objg countByEnumeratingWithState:&v563 objects:v635 count:16];
          id v365 = v393;
          if (!v393)
          {

            if ((v366 & 1) == 0) {
              goto LABEL_516;
            }
            v362 = v527 + 1;
            if (v527 + 1 == v516)
            {
              v516 = (char *)[v506 countByEnumeratingWithState:&v567 objects:v636 count:16];
              if (!v516) {
                goto LABEL_519;
              }
              goto LABEL_465;
            }
            goto LABEL_466;
          }
        }
      }

LABEL_516:
      v395 = nplog_obj();
      if (os_log_type_enabled(v395, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v506;
        _os_log_impl((void *)&_mh_execute_header, v395, OS_LOG_TYPE_DEFAULT, "proxied content maps updated to %@", (uint8_t *)&buf, 0xCu);
      }

      sub_100090298((uint64_t)v499);
      int v483 = 1;
LABEL_519:
    }
  }
  else
  {
    v394 = nplog_obj();
    if (os_log_type_enabled(v394, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v521;
      _os_log_impl((void *)&_mh_execute_header, v394, OS_LOG_TYPE_DEFAULT, "proxied content maps updated to %@", (uint8_t *)&buf, 0xCu);
    }

    sub_100090298((uint64_t)v499);
    int v483 = 1;
  }
  v396 = [(NSPConfiguration *)v498 geohashSharingEnabledStatus];
  v397 = [v497 geohashSharingEnabledStatus];
  int v398 = sub_100096318(v396, v397);

  if (v398)
  {
    v399 = nplog_obj();
    if (os_log_type_enabled(v399, OS_LOG_TYPE_DEFAULT))
    {
      v400 = [(NSPConfiguration *)v498 geohashSharingEnabledStatus];
      unsigned int v401 = [v400 BOOLValue];
      v402 = "disabled";
      if (v401) {
        v402 = "enabled";
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v402;
      _os_log_impl((void *)&_mh_execute_header, v399, OS_LOG_TYPE_DEFAULT, "Geohash sharing preference changed to %s", (uint8_t *)&buf, 0xCu);
    }
    sub_1000905D0((uint64_t)v499);
    int v483 = 1;
  }
  v403 = [(NSPConfiguration *)v498 geohashOverride];
  v404 = [v497 geohashOverride];
  if (v403 == v404)
  {
  }
  else
  {
    v405 = [(NSPConfiguration *)v498 geohashOverride];
    v406 = [v497 geohashOverride];
    unsigned __int8 v407 = [v405 isEqualToString:v406];

    if ((v407 & 1) == 0)
    {
      v408 = nplog_obj();
      if (os_log_type_enabled(v408, OS_LOG_TYPE_DEFAULT))
      {
        v409 = [(NSPConfiguration *)v498 geohashOverride];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v409;
        _os_log_impl((void *)&_mh_execute_header, v408, OS_LOG_TYPE_DEFAULT, "Geohash override changed to %@", (uint8_t *)&buf, 0xCu);
      }
      sub_1000905D0((uint64_t)v499);
      int v483 = 1;
    }
  }
  v410 = [(NSPConfiguration *)v498 epoch];
  v411 = [v497 epoch];
  int v412 = sub_100096318(v410, v411);

  if (v412)
  {
    v413 = nplog_obj();
    if (os_log_type_enabled(v413, OS_LOG_TYPE_DEFAULT))
    {
      v414 = [(NSPConfiguration *)v498 epoch];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v414;
      _os_log_impl((void *)&_mh_execute_header, v413, OS_LOG_TYPE_DEFAULT, "Configuration epoch changed to %@", (uint8_t *)&buf, 0xCu);
    }
    sub_10009074C((uint64_t)v499);
    int v483 = 1;
  }
  v415 = [(NSPConfiguration *)v498 preferredPathRoutingEnabledStatus];
  v416 = [v497 preferredPathRoutingEnabledStatus];
  int v417 = sub_100096318(v415, v416);

  if (v417)
  {
    v418 = nplog_obj();
    if (os_log_type_enabled(v418, OS_LOG_TYPE_DEFAULT))
    {
      v419 = [(NSPConfiguration *)v498 preferredPathRoutingEnabledStatus];
      unsigned int v420 = [v419 BOOLValue];
      v421 = "disabled";
      if (v420) {
        v421 = "enabled";
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v421;
      _os_log_impl((void *)&_mh_execute_header, v418, OS_LOG_TYPE_DEFAULT, "Preferred path routing enabled changed to %s", (uint8_t *)&buf, 0xCu);
    }
    int v483 = 1;
  }
  v422 = [(NSPConfiguration *)v498 privateAccessTokensEnabledStatus];
  v423 = [v497 privateAccessTokensEnabledStatus];
  int v424 = sub_100096318(v422, v423);

  if (v424)
  {
    v425 = nplog_obj();
    if (os_log_type_enabled(v425, OS_LOG_TYPE_DEFAULT))
    {
      v426 = [(NSPConfiguration *)v498 privateAccessTokensEnabledStatus];
      unsigned int v427 = [v426 BOOLValue];
      v428 = "disabled";
      if (v427) {
        v428 = "enabled";
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v428;
      _os_log_impl((void *)&_mh_execute_header, v425, OS_LOG_TYPE_DEFAULT, "Private access tokens preference changed to %s", (uint8_t *)&buf, 0xCu);
    }
    sub_1000908C8((uint64_t)v499);
    int v483 = 1;
  }
  v429 = [(NSPConfiguration *)v498 privateAccessTokensAllowTools];
  v430 = [v497 privateAccessTokensAllowTools];
  int v431 = sub_100096318(v429, v430);

  if (v431)
  {
    v432 = nplog_obj();
    if (os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT))
    {
      v433 = [(NSPConfiguration *)v498 privateAccessTokensAllowTools];
      unsigned int v434 = [v433 BOOLValue];
      v435 = "disallowed";
      if (v434) {
        v435 = "allowed";
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v435;
      _os_log_impl((void *)&_mh_execute_header, v432, OS_LOG_TYPE_DEFAULT, "Private access tokens allow tools changed to %s", (uint8_t *)&buf, 0xCu);
    }
    int v483 = 1;
  }
  v436 = [(NSPConfiguration *)v498 inProcessFlowDivert];
  v437 = [v497 inProcessFlowDivert];
  int v438 = sub_100096318(v436, v437);

  if (v438)
  {
    v439 = nplog_obj();
    if (os_log_type_enabled(v439, OS_LOG_TYPE_DEFAULT))
    {
      v440 = [(NSPConfiguration *)v498 inProcessFlowDivert];
      unsigned int v441 = [v440 BOOLValue];
      v442 = "disabled";
      if (v441) {
        v442 = "enabled";
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v442;
      _os_log_impl((void *)&_mh_execute_header, v439, OS_LOG_TYPE_DEFAULT, "In-process flow divert support changed to %s", (uint8_t *)&buf, 0xCu);
    }
    int v483 = 1;
  }
  v443 = [(NSPConfiguration *)v498 proxyConfiguration];
  id objh = [v443 trustedNetworkDiscoveredProxies];

  v444 = [v497 proxyConfiguration];
  v445 = [v444 trustedNetworkDiscoveredProxies];

  id v446 = [objh count];
  if (v446 == [v445 count])
  {
    if ([objh count])
    {
      long long v561 = 0u;
      long long v562 = 0u;
      long long v559 = 0u;
      long long v560 = 0u;
      id v447 = objh;
      id v448 = [v447 countByEnumeratingWithState:&v559 objects:v634 count:16];
      if (v448)
      {
        uint64_t v449 = *(void *)v560;
        while (1)
        {
          uint64_t v450 = 0;
LABEL_565:
          if (*(void *)v560 != v449) {
            objc_enumerationMutation(v447);
          }
          v451 = *(void **)(*((void *)&v559 + 1) + 8 * v450);
          long long v555 = 0u;
          long long v556 = 0u;
          long long v557 = 0u;
          long long v558 = 0u;
          id v452 = v445;
          id v453 = [v452 countByEnumeratingWithState:&v555 objects:v633 count:16];
          if (!v453) {
            break;
          }
          uint64_t v454 = *(void *)v556;
LABEL_569:
          uint64_t v455 = 0;
          while (1)
          {
            if (*(void *)v556 != v454) {
              objc_enumerationMutation(v452);
            }
            if ([v451 isEqualToString:*(void *)(*((void *)&v555 + 1) + 8 * v455)]) {
              break;
            }
            if (v453 == (id)++v455)
            {
              id v453 = [v452 countByEnumeratingWithState:&v555 objects:v633 count:16];
              if (v453) {
                goto LABEL_569;
              }
              goto LABEL_580;
            }
          }

          if ((id)++v450 != v448) {
            goto LABEL_565;
          }
          id v448 = [v447 countByEnumeratingWithState:&v559 objects:v634 count:16];
          if (!v448) {
            goto LABEL_581;
          }
        }
LABEL_580:

        sub_100090298((uint64_t)v499);
        int v483 = 1;
      }
LABEL_581:
    }
  }
  else
  {
    sub_100090298((uint64_t)v499);
    int v483 = 1;
  }
  v456 = [(NSPConfiguration *)v498 lastPrivateCloudComputeEnvironment];
  v457 = [v497 lastPrivateCloudComputeEnvironment];
  int v458 = sub_100096318(v456, v457);

  if ((v458 | v483)) {
    goto LABEL_128;
  }
LABEL_137:
}

- (void)setConfigurationTrialVersion:(int64_t)a3
{
  unsigned int v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  char v5 = [(NSPConfigurationManager *)self trialConfigVersion];
  id v6 = [v5 longValue];

  if (v6 != (id)a3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0;
    }
    id v9 = [(NSPConfiguration *)configuration copy];
    id v8 = +[NSNumber numberWithLong:a3];
    [v9 setTrialConfigVersion:v8];

    [(NSPConfigurationManager *)v4 updateConfiguration:v9];
  }
}

- (void)configurationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  char v5 = [(NSPConfigurationManager *)self enabled];
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0;
    }
    id v9 = [(NSPConfiguration *)configuration copy];
    id v8 = +[NSNumber numberWithBool:v3];
    [v9 setEnabled:v8];

    [(NSPConfigurationManager *)v4 updateConfiguration:v9];
  }
}

- (void)setResetDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self) {
      configuration = self->_configuration;
    }
    else {
      configuration = 0;
    }
    id v6 = [(NSPConfiguration *)configuration copy];
    id v7 = [v6 willResetSubscriberTierTomorrow];

    if (!v7) {
      [v6 setWillResetSubscriberTierTomorrow:&off_10010FBE0];
    }
    [v6 setResetTomorrowDate:v4];
    [(NSPConfigurationManager *)self updateConfiguration:v6];
  }
  else
  {
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      unint64_t v10 = "-[NSPConfigurationManager setResetDate:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null resetDate", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)clearResetDate
{
  v2 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  id v3 = [(NSPConfigurationManager *)self copy];
  [v3 setWillResetSubscriberTierTomorrow:&off_10010FBE0];
  [v3 setResetTomorrowDate:0];
  [(NSPConfigurationManager *)v2 updateConfiguration:v3];
}

- (BOOL)setUserTier:(unint64_t)a3 resetDate:(id)a4 clearResetDate:(BOOL)a5 changeSource:(unint64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  v12 = [(NSPConfiguration *)configuration userTier];
  id v13 = [v12 unsignedIntegerValue];

  if (v13 != (id)a3)
  {
    if (self) {
      v19 = self->_configuration;
    }
    else {
      v19 = 0;
    }
    v20 = v19;
    uint64_t v21 = [(NSPConfiguration *)v20 cloudSubscriptionCheckEnabled];
    if (v21)
    {
      unint64_t v22 = (void *)v21;
      if (self) {
        unint64_t v23 = self->_configuration;
      }
      else {
        unint64_t v23 = 0;
      }
      v24 = [(NSPConfiguration *)v23 cloudSubscriptionCheckEnabled];
      unsigned int v25 = [v24 BOOLValue];

      if (!v25)
      {
LABEL_37:
        if (self) {
          id v38 = self->_configuration;
        }
        else {
          id v38 = 0;
        }
        id v39 = [(NSPConfiguration *)v38 copy];
        unsigned int v40 = +[NSNumber numberWithUnsignedInteger:a3];
        [v39 setUserTier:v40];

        v41 = +[NSNumber numberWithUnsignedInteger:a3];
        [v39 setUserPreferredTier:v41];

        if (a3 == 2)
        {
          if (a6 == 1)
          {
            v42 = &off_10010FBE0;
            goto LABEL_49;
          }
          if (a6 == 3)
          {
            v42 = &off_10010FBF8;
LABEL_49:
            [v39 setSubscriberEnabledFromNonSettingsApp:v42];
          }
        }
        else if (a3 == 1 && v10)
        {
          [v39 setWillResetSubscriberTierTomorrow:&off_10010FBF8];
          v43 = v39;
          id v44 = v10;
          goto LABEL_52;
        }
        [v39 setWillResetSubscriberTierTomorrow:&off_10010FBE0];
        if (!v7)
        {
LABEL_53:
          [(NSPConfigurationManager *)self updateConfiguration:v39];

LABEL_54:
          BOOL v29 = 1;
          goto LABEL_55;
        }
        v43 = v39;
        id v44 = 0;
LABEL_52:
        [v43 setResetTomorrowDate:v44];
        goto LABEL_53;
      }
    }
    else
    {
    }
    if (self) {
      unsigned int v32 = self->_configuration;
    }
    else {
      unsigned int v32 = 0;
    }
    id v33 = [(NSPConfiguration *)v32 proxyAccountType];

    if (v33)
    {
      if (self) {
        v34 = self->_configuration;
      }
      else {
        v34 = 0;
      }
      id v35 = [(NSPConfiguration *)v34 proxyAccountType];
      id v36 = [v35 unsignedIntegerValue];

      if (a3 != 2 || v36 != (id)1) {
        goto LABEL_37;
      }
      CFStringRef v37 = nplog_obj();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "invalid to set subscriber tier for free account type", buf, 2u);
      }
    }
    else
    {
      CFStringRef v37 = nplog_obj();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        if (a3 >= 3)
        {
          long long v46 = +[NSString stringWithFormat:@"(unknown: %i)", a3];
        }
        else
        {
          long long v46 = *(&off_100106B48 + (int)a3);
        }
        *(_DWORD *)long long buf = 138412290;
        v48 = v46;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "invalid to set %@ tier until proxy account type is available", buf, 0xCu);
      }
    }

    BOOL v29 = 0;
    goto LABEL_55;
  }
  if (self) {
    unint64_t v14 = self->_configuration;
  }
  else {
    unint64_t v14 = 0;
  }
  unint64_t v15 = [(NSPConfiguration *)v14 willResetSubscriberTierTomorrow];
  unsigned int v16 = [v15 BOOLValue];

  if (!v10 && v16)
  {
    if (self) {
      int v17 = self->_configuration;
    }
    else {
      int v17 = 0;
    }
    id v18 = [(NSPConfiguration *)v17 copy];
    [v18 setWillResetSubscriberTierTomorrow:&off_10010FBE0];
    if (v7) {
      [v18 setResetTomorrowDate:0];
    }
    [(NSPConfigurationManager *)self updateConfiguration:v18];

    goto LABEL_54;
  }
  if (self) {
    unsigned __int8 v26 = self->_configuration;
  }
  else {
    unsigned __int8 v26 = 0;
  }
  v27 = [(NSPConfiguration *)v26 willResetSubscriberTierTomorrow];
  unsigned __int8 v28 = [v27 BOOLValue];

  BOOL v29 = 1;
  if (v10 && (v28 & 1) == 0)
  {
    if (self) {
      unsigned int v30 = self->_configuration;
    }
    else {
      unsigned int v30 = 0;
    }
    id v31 = [(NSPConfiguration *)v30 copy];
    [v31 setWillResetSubscriberTierTomorrow:&off_10010FBF8];
    [v31 setResetTomorrowDate:v10];
    [(NSPConfigurationManager *)self updateConfiguration:v31];

    goto LABEL_54;
  }
LABEL_55:

  return v29;
}

- (void)setProxyAccountType:(unint64_t)a3 unlimited:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    if (self) {
      configuration = self->_configuration;
    }
    else {
      configuration = 0;
    }
    id v8 = configuration;
    int v9 = [(NSPConfiguration *)v8 proxyAccountType];
    if ([v9 unsignedIntegerValue] == (id)a3)
    {
      if (self) {
        id v10 = self->_configuration;
      }
      else {
        id v10 = 0;
      }
      v11 = [(NSPConfiguration *)v10 proxyAccountUnlimited];
      unsigned int v12 = [v11 BOOLValue];

      if (v12 == v4) {
        return;
      }
    }
    else
    {
    }
    if (self) {
      id v13 = self->_configuration;
    }
    else {
      id v13 = 0;
    }
    id v20 = [(NSPConfiguration *)v13 copy];
    unint64_t v14 = +[NSNumber numberWithUnsignedInteger:a3];
    [v20 setProxyAccountType:v14];

    unint64_t v15 = +[NSNumber numberWithBool:v4];
    [v20 setProxyAccountUnlimited:v15];

    if (a3 == 2)
    {
      if (self) {
        int v17 = self->_configuration;
      }
      else {
        int v17 = 0;
      }
      uint64_t v16 = [(NSPConfiguration *)v17 userPreferredTier];
    }
    else
    {
      if (a3 != 1)
      {
LABEL_19:
        [(NSPConfigurationManager *)self updateConfiguration:v20];

        return;
      }
      uint64_t v16 = +[NSNumber numberWithUnsignedInteger:1];
    }
    id v18 = (void *)v16;
    [v20 setUserTier:v16];

    goto LABEL_19;
  }
  v19 = nplog_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    unint64_t v22 = "-[NSPConfigurationManager setProxyAccountType:unlimited:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "%s called with null proxyAccountType", buf, 0xCu);
  }
}

- (void)setGeohashSharingPreference:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  char v5 = [(NSPConfigurationManager *)self geohashSharingEnabledStatus];
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0;
    }
    id v9 = [(NSPConfiguration *)configuration copy];
    id v8 = +[NSNumber numberWithBool:v3];
    [v9 setGeohashSharingEnabledStatus:v8];

    [(NSPConfigurationManager *)v4 updateConfiguration:v9];
  }
}

- (BOOL)getGeohashSharingPreference
{
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  v2 = [(NSPConfigurationManager *)self geohashSharingEnabledStatus];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setGeohashOverride:(id)a3
{
  id v11 = a3;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  char v5 = configuration;
  id v6 = [(NSPConfiguration *)v5 geohashOverride];
  if (v6 == v11)
  {
  }
  else
  {
    if (self) {
      BOOL v7 = self->_configuration;
    }
    else {
      BOOL v7 = 0;
    }
    id v8 = [(NSPConfiguration *)v7 geohashOverride];
    unsigned __int8 v9 = [v8 isEqualToString:v11];

    if (v9) {
      goto LABEL_12;
    }
    if (self) {
      id v10 = self->_configuration;
    }
    else {
      id v10 = 0;
    }
    char v5 = (NSPConfiguration *)[(NSPConfiguration *)v10 copy];
    [(NSPConfiguration *)v5 setGeohashOverride:v11];
    [(NSPConfigurationManager *)self updateConfiguration:v5];
  }

LABEL_12:
}

- (void)setPreferredPathRoutingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  char v5 = [(NSPConfigurationManager *)self preferredPathRoutingEnabledStatus];
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0;
    }
    id v9 = [(NSPConfiguration *)configuration copy];
    id v8 = +[NSNumber numberWithBool:v3];
    [v9 setPreferredPathRoutingEnabledStatus:v8];

    [(NSPConfigurationManager *)v4 updateConfiguration:v9];
  }
}

- (void)setPrivateAccessTokensEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  char v5 = [(NSPConfigurationManager *)self privateAccessTokensEnabledStatus];
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0;
    }
    id v9 = [(NSPConfiguration *)configuration copy];
    id v8 = +[NSNumber numberWithBool:v3];
    [v9 setPrivateAccessTokensEnabledStatus:v8];

    [(NSPConfigurationManager *)v4 updateConfiguration:v9];
  }
}

- (BOOL)getPrivateAccessTokensEnabled
{
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  v2 = [(NSPConfigurationManager *)self privateAccessTokensEnabledStatus];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPrivateAccessTokensAllowTools:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  char v5 = [(NSPConfigurationManager *)self privateAccessTokensAllowTools];
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0;
    }
    id v9 = [(NSPConfiguration *)configuration copy];
    id v8 = +[NSNumber numberWithBool:v3];
    [v9 setPrivateAccessTokensAllowTools:v8];

    [(NSPConfigurationManager *)v4 updateConfiguration:v9];
  }
}

- (void)setInProcessFlowDivert:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  char v5 = [(NSPConfigurationManager *)self inProcessFlowDivert];
  unsigned int v6 = [v5 BOOLValue];

  if (v6 != v3)
  {
    if (v4) {
      configuration = v4->_configuration;
    }
    else {
      configuration = 0;
    }
    id v9 = [(NSPConfiguration *)configuration copy];
    id v8 = +[NSNumber numberWithBool:v3];
    [v9 setInProcessFlowDivert:v8];

    [(NSPConfigurationManager *)v4 updateConfiguration:v9];
  }
}

- (unint64_t)getPrivacyProxyAccountType
{
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  v2 = [(NSPConfigurationManager *)self proxyAccountType];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setProxyTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4
{
  unsigned int v6 = self;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  BOOL v7 = [(NSPConfigurationManager *)self proxyTrafficState];
  unint64_t v8 = (unint64_t)[v7 unsignedLongLongValue];

  unint64_t v9 = v8 & ~a3 | a4 & a3;
  if (v6) {
    configuration = v6->_configuration;
  }
  else {
    configuration = 0;
  }
  id v11 = [(NSPConfiguration *)configuration proxyTrafficState];
  id v12 = [v11 unsignedLongLongValue];

  if (v12 != (id)v9)
  {
    if (v6) {
      id v13 = v6->_configuration;
    }
    else {
      id v13 = 0;
    }
    id v19 = [(NSPConfiguration *)v13 copy];
    if ((v9 & 0x20000) != 0)
    {
      unint64_t v14 = v6 ? v6->_configuration : 0;
      unint64_t v15 = [(NSPConfiguration *)v14 proxyTrafficState];
      unsigned int v16 = [v15 unsignedLongLongValue];

      if ((v16 & 0x20000) == 0)
      {
        int v17 = +[NSDate now];
        [v19 setAnyAppEnabledDate:v17];
      }
    }
    id v18 = +[NSNumber numberWithUnsignedLongLong:v9];
    [v19 setProxyTrafficState:v18];

    [(NSPConfigurationManager *)v6 updateConfiguration:v19];
  }
}

- (void)refreshConfigurationWithReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  unint64_t v8 = configuration;
  unint64_t v9 = [(NSPConfiguration *)v8 enabled];
  if (([v9 BOOLValue] & 1) == 0) {
    goto LABEL_15;
  }
  if (self) {
    id v10 = self->_configuration;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  id v12 = [(NSPConfiguration *)v11 configServerEnabled];
  if (![v12 BOOLValue])
  {

LABEL_15:
    goto LABEL_16;
  }
  if (self) {
    id v13 = self->_configuration;
  }
  else {
    id v13 = 0;
  }
  unint64_t v14 = v13;
  uint64_t v15 = [(NSPConfiguration *)v14 resurrectionDate];
  if (v15)
  {
    unsigned int v16 = (void *)v15;
    if (self) {
      int v17 = self->_configuration;
    }
    else {
      int v17 = 0;
    }
    id v18 = [(NSPConfiguration *)v17 resurrectionDate];
    [v18 timeIntervalSinceNow];
    double v20 = v19;

    if (v20 >= 0.0) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v21 = nplog_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Refresh configuration", buf, 2u);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100097688;
  v22[3] = &unk_1001068E0;
  id v23 = v6;
  sub_10008DB98((uint64_t)self, (void *)a3, v22);

LABEL_16:
}

- (unint64_t)configurationSubscriberPoliciesCount
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (self) {
    self = (NSPConfigurationManager *)self->_configuration;
  }
  v2 = [(NSPConfigurationManager *)self proxyConfiguration];
  id v3 = [v2 policyTierMaps];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 tier] == 2)
        {
          unint64_t v8 = [v7 policy];
          id v4 = [v8 conditionsCount];

          goto LABEL_13;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (unint64_t)v4;
}

- (void)handlePathChange:(id)a3
{
  id v5 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_path, a3);
    path = self->_path;
  }
  else
  {
    path = 0;
  }
  id v7 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:path];
  unint64_t v8 = [v7 objectForKeyedSubscript:@"Signature"];
  if (self) {
    networkCharacteristics = self->_networkCharacteristics;
  }
  else {
    networkCharacteristics = 0;
  }
  long long v10 = [(NSDictionary *)networkCharacteristics objectForKeyedSubscript:@"Signature"];
  unint64_t v11 = v8;
  unint64_t v12 = v10;
  long long v13 = (void *)v12;
  if (v11 | v12 && (v11 ? (BOOL v14 = v12 == 0) : (BOOL v14 = 1), v14 || ![(id)v11 isEqual:v12]))
  {

    uint64_t v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "config manager: network signature changed", buf, 2u);
    }

    if (self)
    {
      objc_storeStrong((id *)&self->_networkCharacteristics, v7);
      if ([v5 status] == (id)1 && self->_configFetchOnNetworkChange)
      {
        unsigned int v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Retry fetching configuration", buf, 2u);
        }

        unint64_t configFetchRetryAttempt = self->_configFetchRetryAttempt;
        sub_10008E5A8((uint64_t)self);
        self->_unint64_t configFetchRetryAttempt = configFetchRetryAttempt;
        *(void *)long long buf = 0;
        double v20 = buf;
        uint64_t v21 = 0x3032000000;
        unint64_t v22 = sub_100005DBC;
        id v23 = sub_10008DB7C;
        id v24 = (id)os_transaction_create();
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100097478;
        v18[3] = &unk_1001061A8;
        v18[4] = buf;
        sub_10008DB98((uint64_t)self, (void *)0xA, v18);
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      [v5 status];
    }
  }
  else
  {
  }
}

- (void)setup
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  long long v13 = sub_1000980C4;
  BOOL v14 = &unk_100105758;
  uint64_t v15 = self;
  id v3 = v12;
  if (self)
  {
    if (os_variant_has_internal_content())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v5 = [WeakRetained getSavedPrivateCloudComputeEnvironment];

      if (!v5)
      {
        uint64_t v16 = 0;
        int v17 = &v16;
        uint64_t v18 = 0x2050000000;
        id v7 = (void *)qword_1001232A8;
        uint64_t v19 = qword_1001232A8;
        if (!qword_1001232A8)
        {
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          uint64_t v21 = sub_10009AE08;
          unint64_t v22 = &unk_1001058E8;
          id v23 = (NSPConfigurationManager *)&v16;
          sub_10009AE08((uint64_t)&buf);
          id v7 = (void *)v17[3];
        }
        unint64_t v8 = v7;
        _Block_object_dispose(&v16, 8);
        id v9 = objc_alloc_init(v8);
        if (v9)
        {
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          uint64_t v21 = sub_100097AD4;
          unint64_t v22 = &unk_100106958;
          long long v10 = v3;
          id v23 = self;
          id v24 = v10;
          [v9 selectedEnvironmentNameWithCompletionHandler:&buf];

          goto LABEL_8;
        }
        unint64_t v11 = nplog_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create PCCServerEnvironment", (uint8_t *)&buf, 2u);
        }
      }
      id v6 = nplog_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Has saved private cloud compute environment \"%@\"", (uint8_t *)&buf, 0xCu);
      }
    }
    v13((uint64_t)v3, 0);
  }
LABEL_8:
}

- (void)dealloc
{
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v6 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Dealloc: \nConfiguration: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NSPConfigurationManager;
  [(NSPConfigurationManager *)&v4 dealloc];
}

- (NSPConfigurationManager)initWithDelegate:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = v7;
  if (!v6)
  {
    int v17 = nplog_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
LABEL_12:

      BOOL v14 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v21 = "-[NSPConfigurationManager initWithDelegate:configuration:]";
    uint64_t v18 = "%s called with null delegate";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    goto LABEL_12;
  }
  if (!v7)
  {
    int v17 = nplog_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v21 = "-[NSPConfigurationManager initWithDelegate:configuration:]";
    uint64_t v18 = "%s called with null configuration";
    goto LABEL_14;
  }
  v19.receiver = self;
  v19.super_class = (Class)NSPConfigurationManager;
  id v9 = [(NSPConfigurationManager *)&v19 init];
  uint64_t v10 = (uint64_t)v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v6);
    objc_storeStrong((id *)(v10 + 32), a4);
    *(void *)(v10 + 16) = sub_100096284(v10);
    ++*(void *)(v10 + 56);
    sub_10008F7C4(v10);
    id v11 = +[NPUtilities copyTrueClientIPAddressFromPreferences];
    unint64_t v12 = *(void **)(v10 + 120);
    *(void *)(v10 + 120) = v11;

    long long v13 = nplog_large_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(const char **)(v10 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Configuration state: %@", buf, 0xCu);
    }
  }
  self = (NSPConfigurationManager *)(id)v10;
  BOOL v14 = self;
LABEL_8:

  return v14;
}

- (BOOL)environmentUsesNonDefaultServer
{
  return os_variant_has_internal_content() && sub_10009A208((uint64_t)self) > 2;
}

- (void)publishDailyConfigurationStats
{
  uint64_t v15 = objc_alloc_init(NSPConfigurationStats);
  if (self)
  {
    id v3 = [(NSPConfiguration *)self->_configuration proxyConfiguration];
    -[NSPConfigurationStats setConfigurationVersion:](v15, "setConfigurationVersion:", [v3 version]);

    configuration = self->_configuration;
  }
  else
  {
    BOOL v14 = [0 proxyConfiguration];
    -[NSPConfigurationStats setConfigurationVersion:](v15, "setConfigurationVersion:", [v14 version]);

    configuration = 0;
  }
  id v5 = [(NSPConfiguration *)configuration enabled];
  -[NSPConfigurationStats setConfigurationEnabled:](v15, "setConfigurationEnabled:", [v5 BOOLValue]);

  if (self) {
    id v6 = self->_configuration;
  }
  else {
    id v6 = 0;
  }
  id v7 = [(NSPConfiguration *)v6 proxyConfiguration];
  -[NSPConfigurationStats setTokenFetchEnabled:](v15, "setTokenFetchEnabled:", [v7 enabled]);

  unint64_t v8 = [(NSPConfigurationManager *)self effectiveUserTier];
  if (v8 >= 3)
  {
    id v9 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
  }
  else
  {
    id v9 = *(&off_100106B48 + (int)v8);
  }
  [(NSPConfigurationStats *)v15 setTierType:v9];

  if (self) {
    uint64_t v10 = self->_configuration;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = [(NSPConfiguration *)v10 proxyTrafficState];
  unsigned int v12 = [v11 unsignedLongLongValue];

  if (v12) {
    [(NSPConfigurationStats *)v15 setSafariUnencryptedEnabled:1];
  }
  long long v13 = v15;
  if ((v12 & 2) != 0)
  {
    [(NSPConfigurationStats *)v15 setSafariDNSEnabled:1];
    long long v13 = v15;
    if ((v12 & 4) == 0)
    {
LABEL_14:
      if ((v12 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_43;
    }
  }
  else if ((v12 & 4) == 0)
  {
    goto LABEL_14;
  }
  [(NSPConfigurationStats *)v15 setSafariTrackersEnabled:1];
  long long v13 = v15;
  if ((v12 & 8) == 0)
  {
LABEL_15:
    if ((v12 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  [(NSPConfigurationStats *)v15 setSafariAllEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x10) == 0)
  {
LABEL_16:
    if ((v12 & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  [(NSPConfigurationStats *)v15 setSafariHTTPEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x40000) == 0)
  {
LABEL_17:
    if ((v12 & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  [(NSPConfigurationStats *)v15 setSafariPrivateUnencryptedEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x80000) == 0)
  {
LABEL_18:
    if ((v12 & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  [(NSPConfigurationStats *)v15 setSafariPrivateDNSEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x100000) == 0)
  {
LABEL_19:
    if ((v12 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  [(NSPConfigurationStats *)v15 setSafariPrivateAllEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x200000) == 0)
  {
LABEL_20:
    if ((v12 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  [(NSPConfigurationStats *)v15 setSafariMetricsEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x20) == 0)
  {
LABEL_21:
    if ((v12 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  [(NSPConfigurationStats *)v15 setMailTrackersEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x40) == 0)
  {
LABEL_22:
    if ((v12 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  [(NSPConfigurationStats *)v15 setUnencryptedEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x80) == 0)
  {
LABEL_23:
    if ((v12 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  [(NSPConfigurationStats *)v15 setDnsEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x100) == 0)
  {
LABEL_24:
    if ((v12 & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  [(NSPConfigurationStats *)v15 setKnownTrackersEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x200) == 0)
  {
LABEL_25:
    if ((v12 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_54;
  }
LABEL_53:
  [(NSPConfigurationStats *)v15 setAppTrackersEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x400) == 0)
  {
LABEL_26:
    if ((v12 & 0x10000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_54:
  [(NSPConfigurationStats *)v15 setNewsURLResolutionEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x10000) == 0)
  {
LABEL_27:
    if ((v12 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_56;
  }
LABEL_55:
  [(NSPConfigurationStats *)v15 setNewsEmbeddedContentEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x800) == 0)
  {
LABEL_28:
    if ((v12 & 0x1000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_57;
  }
LABEL_56:
  [(NSPConfigurationStats *)v15 setExposureNotificationsEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x1000) == 0)
  {
LABEL_29:
    if ((v12 & 0x2000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_58;
  }
LABEL_57:
  [(NSPConfigurationStats *)v15 setAppleCertificatesEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x2000) == 0)
  {
LABEL_30:
    if ((v12 & 0x4000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_59;
  }
LABEL_58:
  [(NSPConfigurationStats *)v15 setNetworkToolsEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x4000) == 0)
  {
LABEL_31:
    if ((v12 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_60;
  }
LABEL_59:
  [(NSPConfigurationStats *)v15 setMetricsUploadEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x8000) == 0)
  {
LABEL_32:
    if ((v12 & 0x20000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_61;
  }
LABEL_60:
  [(NSPConfigurationStats *)v15 setBrandedCallingEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x20000) == 0)
  {
LABEL_33:
    if ((v12 & 0x400000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_62;
  }
LABEL_61:
  [(NSPConfigurationStats *)v15 setAppMetricsEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x400000) == 0)
  {
LABEL_34:
    if ((v12 & 0x800000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_63;
  }
LABEL_62:
  [(NSPConfigurationStats *)v15 setPromotedContentEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x800000) == 0)
  {
LABEL_35:
    if ((v12 & 0x1000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_64;
  }
LABEL_63:
  [(NSPConfigurationStats *)v15 setPostbackFetchEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x1000000) == 0)
  {
LABEL_36:
    if ((v12 & 0x2000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_64:
  [(NSPConfigurationStats *)v15 setPasswordManagerIconFetchEnabled:1];
  long long v13 = v15;
  if ((v12 & 0x2000000) != 0)
  {
LABEL_37:
    [(NSPConfigurationStats *)v15 setLaunchWarningDetailsEnabled:1];
    long long v13 = v15;
  }
LABEL_38:
  [(NSPProxyAnalytics *)v13 sendAnalytics];
}

- (void)copyProxyInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self)
    {
      [v4 setConfigFetchedSuccessCount:self->_configFetchSuccessCount];
      unint64_t configFetchFailedCount = self->_configFetchFailedCount;
    }
    else
    {
      [v4 setConfigFetchedSuccessCount:0];
      unint64_t configFetchFailedCount = 0;
    }
    [v5 setConfigFetchedFailedCount:configFetchFailedCount];
  }
  else
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      id v9 = "-[NSPConfigurationManager copyProxyInfo:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null proxyInfo", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)diagnostics
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unint64_t v4 = [(NSPConfigurationManager *)self effectiveUserTier];
  if (v4 >= 3)
  {
    id v5 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
  }
  else
  {
    id v5 = *(&off_100106B48 + (int)v4);
  }
  [v3 setObject:v5 forKeyedSubscript:@"EffectiveUserTier"];

  return v3;
}

- (unint64_t)effectiveUserTier
{
  return self->_effectiveUserTier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkCharacteristics, 0);
  objc_storeStrong((id *)&self->_trueClientIPAddress, 0);
  objc_storeStrong((id *)&self->_configFetchRetryDate, 0);
  objc_storeStrong((id *)&self->_configFetchSession, 0);
  objc_storeStrong((id *)&self->_configFetchRetryTimer, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_enableCheckTimer, 0);
  objc_storeStrong((id *)&self->_resurrectionTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end