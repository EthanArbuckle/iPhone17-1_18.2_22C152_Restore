@interface TCCDAccessIdentity
+ (id)_createCacheKeyWithAccessorAuditToken:(id *)a3 responsibleAuditToken:(id *)a4 isSpecificIdentity:(BOOL)a5;
+ (id)cachedAccessIdentityForAccessorAuditToken:(id *)a3 responsibleAuditToken:(id *)a4 isSpecificIdentity:(BOOL)a5;
+ (void)_initIdentityCache;
+ (void)cacheAccessIdentity:(id)a3 forAccessorAuditToken:(id *)a4 responsibleAuditToken:(id *)a5 isSpecificIdentity:(BOOL)a6;
+ (void)clearCache;
- ($115C4C562B26FF47E01F9F4EA65B5887)accessorAuditToken;
- ($115C4C562B26FF47E01F9F4EA65B5887)responsibleAuditToken;
- (BOOL)_deriveIdentityFromAttributionChain:(id)a3 preferMostSpecificIdentifier:(BOOL)a4;
- (BOOL)getSDKVersion:(unsigned int *)a3 platformType:(unsigned int *)a4;
- (BOOL)isAvocadoWidget;
- (BOOL)isCaptureExtension;
- (BOOL)isEqualToCachedIdentity:(id)a3;
- (BOOL)isPlugInWithExtensionPointIdentifier:(id)a3;
- (BOOL)is_wk2_proxy;
- (BOOL)pluginTargetsSystemExtensionPoint;
- (NSNumber)policy_id;
- (NSString)attributionPath;
- (NSString)identifier;
- (NSString)path;
- (NSString)pluginBundleIdentifier;
- (NSURL)pluginBundleURL;
- (TCCDAccessIdentity)initWithAttributionChain:(id)a3 preferMostSpecificIdentifier:(BOOL)a4;
- (TCCDAccessIdentity)initWithBundleIdentifier:(id)a3 isWK2Proxy:(BOOL)a4;
- (TCCDAccessIdentity)initWithIdentifier:(id)a3 type:(int)a4 executableURL:(id)a5 SDKVersion:(unsigned int)a6 platformType:(unsigned int)a7;
- (TCCDAccessIdentity)initWithMessage:(id)a3;
- (TCCDBundle)bundle;
- (id)_initExplicitlyAssumedIdentityFromRequestContext:(id)a3;
- (id)_initImplicitlyAssumedIdentityFromRequestContext:(id)a3;
- (id)_initWithAccessIdentity:(id)a3;
- (id)description;
- (id)displayName;
- (id)initAssumedIdentityWithRequestContext:(id)a3;
- (int)client_type;
- (int)responsiblePID;
- (int)targetPID;
- (int64_t)appExtensionType;
- (int64_t)pluginPromptPolicy;
- (void)_makeDisplayNameBlockForURL:(id)a3;
- (void)_updateFromAccessIdentity:(id)a3;
@end

@implementation TCCDAccessIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginBundleURL, 0);
  objc_storeStrong((id *)&self->_pluginBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_policy_id, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->displayNameBlock, 0);
}

- (BOOL)_deriveIdentityFromAttributionChain:(id)a3 preferMostSpecificIdentifier:(BOOL)a4
{
  id v5 = a3;
  v6 = [v5 responsibleProcess];
  v7 = [v6 responsiblePath];

  v8 = +[TCCDPlatform currentPlatform];
  v9 = [v8 server];
  v10 = [v9 logHandle];

  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10003097C(v5, v10);
    }

    long long v11 = *(_OWORD *)&self->_responsibleAuditToken.val[4];
    *(_OWORD *)atoken = *(_OWORD *)self->_responsibleAuditToken.val;
    *(_OWORD *)&atoken[16] = v11;
    v12 = +[LSBundleRecord bundleRecordForAuditToken:atoken error:0];
    objc_opt_class();
    id v13 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_40;
    }
    id v13 = v12;
    v14 = [v13 URL];
    pluginBundleURL = self->_pluginBundleURL;
    self->_pluginBundleURL = v14;

    v16 = [v13 bundleIdentifier];
    pluginBundleIdentifier = self->_pluginBundleIdentifier;
    self->_pluginBundleIdentifier = v16;

    self->_pluginTargetsSystemExtensionPoint = 1;
    self->_int64_t pluginPromptPolicy = 1;
    v18 = [v13 extensionPointRecord];
    v19 = v18;
    if (v18)
    {
      v20 = [v18 SDKDictionary];
      v21 = [v20 objectForKey:@"EXRequiresLegacyInfrastructure" ofClass:objc_opt_class()];
      unsigned int v22 = [v21 BOOLValue];
      char v23 = v22;
      int64_t v24 = v22 ? 1 : 2;

      self->_int64_t appExtensionType = v24;
      if ((v23 & 1) == 0)
      {
        self->_pluginTargetsSystemExtensionPoint = [v19 extensionPointType] < 2;
        unsigned int v25 = [v19 TCCPolicy];
        int v26 = v25;
        if (v25 >= 3)
        {
          v36 = tcc_access_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_100030904(v26, v36);
          }

          int64_t v27 = 1;
        }
        else
        {
          int64_t v27 = v25;
        }
        self->_int64_t pluginPromptPolicy = v27;
      }
    }
    v37 = tcc_access_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      int responsiblePID = self->_responsiblePID;
      v73 = [v19 name];
      int64_t pluginPromptPolicy = self->_pluginPromptPolicy;
      int64_t appExtensionType = self->_appExtensionType;
      *(_DWORD *)atoken = 67110146;
      *(_DWORD *)&atoken[4] = responsiblePID;
      *(_WORD *)&atoken[8] = 2114;
      *(void *)&atoken[10] = v13;
      *(_WORD *)&atoken[18] = 2114;
      *(void *)&atoken[20] = v73;
      *(_WORD *)&atoken[28] = 2048;
      *(void *)&atoken[30] = appExtensionType;
      __int16 v110 = 2048;
      int64_t v111 = pluginPromptPolicy;
      _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "IDENTITY_ATTRIBUTION: Responsible process (pid=%u) is App Extension: %{public}@, extension point %{public}@, extension type %ld, prompt policy %ld", atoken, 0x30u);
    }
    if (!v13) {
      goto LABEL_40;
    }
    int64_t v38 = self->_pluginPromptPolicy;
    if (!v38) {
      goto LABEL_40;
    }
    if (v38 != 2)
    {
      if (v38 == 1)
      {
        v39 = [v13 containingBundleRecord];
        v40 = v39;
        BOOL v44 = 1;
        if (v39)
        {
          uint64_t v41 = [v39 bundleIdentifier];
          if (v41)
          {
            v42 = (void *)v41;
            v43 = [v40 URL];

            if (v43) {
              BOOL v44 = 0;
            }
          }
        }
        v59 = [v40 bundleIdentifier];
        identifier = self->_identifier;
        self->_identifier = v59;

        p_super = [v40 URL];

        if (v44)
        {

LABEL_40:
          id v99 = 0;
          v61 = (TCCDBundle *)[v5 attributedBundleUsingOutermostBundle:0 computedStaticCodeRef:0 computedNonIdentifiableBundleURL:&v99];
          v10 = v99;
          p_super = &self->_bundle->super;
          self->_bundle = v61;
LABEL_41:

          bundle = self->_bundle;
          if (bundle)
          {
            v63 = [(TCCDBundle *)bundle bundleIdentifier];

            if (v63)
            {
              if (!self->displayNameBlock)
              {
                self->_client_type = 0;
                v64 = [(TCCDBundle *)self->_bundle bundleIdentifier];
                v65 = self->_identifier;
                self->_identifier = v64;

                v66 = [(TCCDBundle *)self->_bundle bundleURL];
                [(TCCDAccessIdentity *)self _makeDisplayNameBlockForURL:v66];
              }
              v67 = +[TCCDPlatform currentPlatform];
              v68 = [v67 server];
              p_super = [v68 logHandle];

              if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
                sub_1000305D4((uint64_t)self, p_super);
              }
              BOOL v35 = 1;
              goto LABEL_51;
            }
          }
          v69 = +[TCCDPlatform currentPlatform];
          v70 = [v69 server];
          p_super = [v70 logHandle];

          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
            sub_100030538(v5);
          }
LABEL_50:
          BOOL v35 = 0;
LABEL_51:

          goto LABEL_52;
        }
      }
      else
      {
        p_super = 0;
      }
      goto LABEL_69;
    }
    long long v45 = *(_OWORD *)&self->_responsibleAuditToken.val[4];
    long long v107 = *(_OWORD *)self->_responsibleAuditToken.val;
    long long v108 = v45;
    long long v46 = *(_OWORD *)&self->_responsibleAuditToken.val[4];
    *(_OWORD *)atoken = *(_OWORD *)self->_responsibleAuditToken.val;
    *(_OWORD *)&atoken[16] = v46;
    v47 = +[NSNumber numberWithInt:audit_token_to_pid((audit_token_t *)atoken)];
    id v106 = 0;
    v48 = +[RBSProcessHandle handleForIdentifier:v47 error:&v106];
    id v49 = v106;

    if (v48)
    {
      v97 = v49;
      v98 = v48;
      [v48 auditToken];
      *(_OWORD *)atoken = v107;
      *(_OWORD *)&atoken[16] = v108;
      pid_t v50 = audit_token_to_pid((audit_token_t *)atoken);
      *(_OWORD *)atoken = v104;
      *(_OWORD *)&atoken[16] = v105;
      pid_t v51 = audit_token_to_pid((audit_token_t *)atoken);
      *(_OWORD *)atoken = v107;
      *(_OWORD *)&atoken[16] = v108;
      int v52 = audit_token_to_pidversion((audit_token_t *)atoken);
      *(_OWORD *)atoken = v104;
      *(_OWORD *)&atoken[16] = v105;
      int v53 = audit_token_to_pidversion((audit_token_t *)atoken);
      if (v50 != v51 || v52 != v53)
      {
        v55 = tcc_access_log();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v48 = v98;
          [v98 auditToken];
          v95 = sub_100030338(v103);
          *(_OWORD *)atoken = v107;
          *(_OWORD *)&atoken[16] = v108;
          v96 = sub_100030338(atoken);
          *(_DWORD *)atoken = 138543874;
          *(void *)&atoken[4] = v98;
          *(_WORD *)&atoken[12] = 2114;
          *(void *)&atoken[14] = v95;
          *(_WORD *)&atoken[22] = 2114;
          *(void *)&atoken[24] = v96;
          _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Rejecting RBSProcessHandle %{public}@ for App Extension because process handle's audit token %{public}@ doesn't match original %{public}@", atoken, 0x20u);

          p_super = 0;
          id v49 = v97;
        }
        else
        {
          p_super = 0;
          id v49 = v97;
          v48 = v98;
        }
        goto LABEL_65;
      }
      v48 = v98;
      v54 = [v98 hostProcess];
      if (v54)
      {
        v55 = v54;
        id v49 = v97;
        if ([v54 isApplication])
        {
          memset(atoken, 0, 32);
          [v55 auditToken];
          id v102 = v97;
          v103[0] = *(_OWORD *)atoken;
          v103[1] = *(_OWORD *)&atoken[16];
          p_super = +[LSBundleRecord bundleRecordForAuditToken:v103 error:&v102];
          id v57 = v102;

          if (p_super)
          {
            v58 = p_super;
          }
          else
          {
            v94 = tcc_access_log();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
              sub_100030834();
            }
          }
          id v49 = v57;
          goto LABEL_65;
        }
        v77 = tcc_access_log();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          sub_10003089C();
        }
      }
      else
      {
        v76 = tcc_access_log();
        id v49 = v97;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
          sub_1000307CC();
        }

        v55 = 0;
      }
    }
    else
    {
      v55 = tcc_access_log();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_100030764();
      }
    }
    p_super = 0;
LABEL_65:

    if (!p_super
      || ([p_super bundleIdentifier], (uint64_t v78 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v79 = (void *)v78,
          [p_super URL],
          v80 = objc_claimAutoreleasedReturnValue(),
          v80,
          v79,
          !v80))
    {
      v89 = tcc_access_log();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
        sub_1000306FC();
      }
      goto LABEL_79;
    }
    v81 = [p_super bundleIdentifier];
    v82 = self->_identifier;
    self->_identifier = v81;

    uint64_t v83 = [p_super URL];

    p_super = v83;
LABEL_69:
    v84 = +[TCCDBundle bundleWithURL:p_super];
    v85 = self->_bundle;
    self->_bundle = v84;

    v86 = self->_bundle;
    v87 = +[TCCDPlatform currentPlatform];
    v88 = [v87 server];
    v89 = [v88 logHandle];

    if (v86)
    {
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        v90 = self->_pluginBundleURL;
        v91 = self->_bundle;
        *(_DWORD *)atoken = 138543618;
        *(void *)&atoken[4] = v90;
        *(_WORD *)&atoken[12] = 2114;
        *(void *)&atoken[14] = v91;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "IDENTITY_ATTRIBUTION: Attributing App Extension %{public}@ to %{public}@", atoken, 0x16u);
      }

      *(void *)atoken = 0;
      if (TCCDServerHasPolicyOverride(self->_pluginBundleIdentifier, (id *)&self->_policy_id, (void **)&self->_identifier, (id *)atoken))
      {
        self->_client_type = 2;
        v100[0] = _NSConcreteStackBlock;
        v100[1] = 3221225472;
        v100[2] = sub_10002E998;
        v100[3] = &unk_100095C30;
        id v101 = *(id *)atoken;
        v92 = objc_retainBlock(v100);
        id displayNameBlock = self->displayNameBlock;
        self->id displayNameBlock = v92;
      }
      v10 = 0;
      goto LABEL_41;
    }
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
      sub_100030660(v5);
    }
LABEL_79:

    v10 = 0;
    goto LABEL_50;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100030500(v10, v28, v29, v30, v31, v32, v33, v34);
  }
  BOOL v35 = 0;
LABEL_52:

  return v35;
}

- (TCCDAccessIdentity)initWithAttributionChain:(id)a3 preferMostSpecificIdentifier:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(TCCDAccessIdentity *)self init];
  if (!v7) {
    goto LABEL_14;
  }
  v8 = [v6 requestingProcess];
  v7->_targetPID = [v8 pid];

  v9 = [v6 responsibleProcess];
  v7->_int responsiblePID = [v9 pid];

  long long v31 = 0u;
  long long v32 = 0u;
  v10 = [v6 accessingProcess];
  long long v11 = v10;
  if (v10)
  {
    [v10 auditToken];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }

  *(_OWORD *)v7->_accessorAuditToken.val = v31;
  *(_OWORD *)&v7->_accessorAuditToken.val[4] = v32;
  v12 = [v6 responsibleProcess];
  id v13 = v12;
  if (v12)
  {
    [v12 auditToken];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }

  *(_OWORD *)v7->_responsibleAuditToken.val = v29;
  *(_OWORD *)&v7->_responsibleAuditToken.val[4] = v30;
  v14 = [v6 responsibleProcess];
  uint64_t v15 = [v14 responsiblePath];
  path = v7->_path;
  v7->_path = (NSString *)v15;

  if (!v7->_path)
  {
    v18 = +[TCCDPlatform currentPlatform];
    v19 = [v18 server];
    v20 = [v19 logHandle];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100030A28(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    goto LABEL_14;
  }
  if (![(TCCDAccessIdentity *)v7 _deriveIdentityFromAttributionChain:v6 preferMostSpecificIdentifier:v4])
  {
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  v17 = v7;
LABEL_15:

  return v17;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isPlugInWithExtensionPointIdentifier:(id)a3
{
  id v4 = a3;
  pluginBundleURL = self->_pluginBundleURL;
  p_pluginBundleURL = &self->_pluginBundleURL;
  if (pluginBundleURL)
  {
    v7 = +[TCCDBundle bundleWithURL:](TCCDBundle, "bundleWithURL:");
    v8 = v7;
    if (v7)
    {
      v9 = [v7 extensionPointIdentifier];
      unsigned __int8 v10 = [v9 isEqualToString:v4];
    }
    else
    {
      long long v11 = tcc_access_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100030F08((uint64_t)p_pluginBundleURL, v11, v12, v13, v14, v15, v16, v17);
      }

      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)isAvocadoWidget
{
  return [(TCCDAccessIdentity *)self isPlugInWithExtensionPointIdentifier:@"com.apple.widgetkit-extension"];
}

- (NSString)pluginBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isCaptureExtension
{
  return [(TCCDAccessIdentity *)self isPlugInWithExtensionPointIdentifier:@"com.apple.securecapture"];
}

- (void)_makeDisplayNameBlockForURL:(id)a3
{
  if ([(TCCDAccessIdentity *)self client_type])
  {
    [(TCCDAccessIdentity *)self client_type];
  }
  else
  {
    id v4 = self->_identifier;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002E938;
    v8[3] = &unk_100095C30;
    v9 = v4;
    id v5 = v4;
    id v6 = objc_retainBlock(v8);
    id displayNameBlock = self->displayNameBlock;
    self->id displayNameBlock = v6;
  }
}

- (int)client_type
{
  return self->_client_type;
}

+ (void)_initIdentityCache
{
  if (qword_1000AC5C0 != -1) {
    dispatch_once(&qword_1000AC5C0, &stru_100095C08);
  }
}

+ (id)_createCacheKeyWithAccessorAuditToken:(id *)a3 responsibleAuditToken:(id *)a4 isSpecificIdentity:(BOOL)a5
{
  BOOL v17 = a5;
  id v7 = [objc_alloc((Class)NSMutableData) initWithBytes:a3 length:32];
  v8 = v7;
  if (a4)
  {
    BOOL v9 = *(void *)a3->var0 == *(void *)a4->var0 && *(void *)&a3->var0[2] == *(void *)&a4->var0[2];
    BOOL v10 = v9 && *(void *)&a3->var0[4] == *(void *)&a4->var0[4];
    if (!v10 || *(void *)&a3->var0[6] != *(void *)&a4->var0[6])
    {
      BOOL v12 = *(void *)a3->var0 == qword_1000AC5C8 && *(void *)&a3->var0[2] == unk_1000AC5D0;
      BOOL v13 = v12 && *(void *)&a3->var0[4] == qword_1000AC5D8;
      if (!v13 || *(void *)&a3->var0[6] != unk_1000AC5E0) {
        [v7 appendBytes:a4 length:32];
      }
    }
  }
  [v8 appendBytes:&v17 length:1];
  id v15 = [v8 copy];

  return v15;
}

- (BOOL)isEqualToCachedIdentity:(id)a3
{
  id v5 = (TCCDAccessIdentity *)a3;
  p_isa = (id *)&v5->super.isa;
  if (v5 == self)
  {
    BOOL v23 = 1;
    goto LABEL_31;
  }
  if (!v5)
  {
    BOOL v23 = 0;
    goto LABEL_31;
  }
  int client_type = self->_client_type;
  unsigned int v8 = [(TCCDAccessIdentity *)v5 client_type];
  unsigned int v9 = client_type == v8;
  identifier = self->_identifier;
  long long v11 = identifier;
  if (!identifier)
  {
    v3 = [p_isa identifier];
    if (!v3)
    {
LABEL_10:

      goto LABEL_11;
    }
    long long v11 = self->_identifier;
  }
  BOOL v12 = [p_isa identifier];
  unsigned int v13 = [(NSString *)v11 isEqualToString:v12];
  if (client_type == v8) {
    unsigned int v9 = v13;
  }
  else {
    unsigned int v9 = 0;
  }

  if (!identifier) {
    goto LABEL_10;
  }
LABEL_11:
  policy_id = self->_policy_id;
  id v15 = policy_id;
  if (policy_id) {
    goto LABEL_14;
  }
  v3 = objc_msgSend(p_isa, "policy_id");
  if (v3)
  {
    id v15 = self->_policy_id;
LABEL_14:
    uint64_t v16 = objc_msgSend(p_isa, "policy_id");
    v9 &= [(NSNumber *)v15 isEqualToNumber:v16];

    if (policy_id) {
      goto LABEL_16;
    }
  }

LABEL_16:
  path = self->_path;
  v18 = path;
  if (path) {
    goto LABEL_19;
  }
  v3 = [p_isa path];
  if (v3)
  {
    v18 = self->_path;
LABEL_19:
    v19 = [p_isa path];
    v9 &= [(NSString *)v18 isEqualToString:v19];

    if (path) {
      goto LABEL_21;
    }
  }

LABEL_21:
  bundle = self->_bundle;
  uint64_t v21 = bundle;
  if (bundle) {
    goto LABEL_24;
  }
  v3 = [p_isa bundle];
  if (v3)
  {
    uint64_t v21 = self->_bundle;
LABEL_24:
    uint64_t v22 = [p_isa bundle];
    v9 &= [(TCCDBundle *)v21 isEqual:v22];

    if (bundle) {
      goto LABEL_26;
    }
  }

LABEL_26:
  if (self->displayNameBlock == p_isa[1]) {
    BOOL v23 = v9;
  }
  else {
    BOOL v23 = 0;
  }
LABEL_31:

  return v23;
}

+ (void)clearCache
{
  id v2 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:40];
  v3 = (void *)qword_1000AC5B0;
  qword_1000AC5B0 = (uint64_t)v2;

  qword_1000AC5B8 = (uint64_t)[objc_alloc((Class)NSMutableArray) initWithCapacity:40];
  _objc_release_x1();
}

+ (id)cachedAccessIdentityForAccessorAuditToken:(id *)a3 responsibleAuditToken:(id *)a4 isSpecificIdentity:(BOOL)a5
{
  BOOL v5 = a5;
  [a1 _initIdentityCache];
  unsigned int v9 = [a1 _createCacheKeyWithAccessorAuditToken:a3 responsibleAuditToken:a4 isSpecificIdentity:v5];
  id v10 = (id)qword_1000AC5B0;
  objc_sync_enter(v10);
  long long v11 = [(id)qword_1000AC5B0 objectForKeyedSubscript:v9];
  objc_sync_exit(v10);

  return v11;
}

+ (void)cacheAccessIdentity:(id)a3 forAccessorAuditToken:(id *)a4 responsibleAuditToken:(id *)a5 isSpecificIdentity:(BOOL)a6
{
  BOOL v6 = a6;
  id v39 = a3;
  [a1 _initIdentityCache];
  id v10 = [a1 _createCacheKeyWithAccessorAuditToken:a4 responsibleAuditToken:a5 isSpecificIdentity:v6];
  id v11 = (id)qword_1000AC5B0;
  objc_sync_enter(v11);
  if ((unint64_t)[(id)qword_1000AC5B0 count] >= 0x28)
  {
    BOOL v12 = [(id)qword_1000AC5B8 objectAtIndexedSubscript:0];
    unsigned int v13 = [(id)qword_1000AC5B0 objectForKeyedSubscript:v12];
    uint64_t v14 = +[TCCDPlatform currentPlatform];
    id v15 = [v14 server];
    uint64_t v16 = [v15 logHandle];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      BOOL v17 = [v13 identifier];
      sub_1000304A8(v17, buf, v16);
    }

    [(id)qword_1000AC5B0 removeObjectForKey:v12];
    [(id)qword_1000AC5B8 removeObjectAtIndex:0];
  }
  id v18 = [[TCCDAccessIdentity alloc] _initWithAccessIdentity:v39];
  [(id)qword_1000AC5B0 setObject:v18 forKeyedSubscript:v10];
  [(id)qword_1000AC5B8 addObject:v10];
  v19 = +[TCCDPlatform currentPlatform];
  v20 = [v19 server];
  uint64_t v21 = [v20 logHandle];
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

  if (v22)
  {
    long long v23 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&atoken.val[4] = v23;
    uint64_t v24 = audit_token_to_pid(&atoken);
    long long v25 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&atoken.val[4] = v25;
    uint64_t v26 = audit_token_to_pidversion(&atoken);
    long long v27 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&atoken.val[4] = v27;
    uint64_t v28 = +[NSMutableString stringWithFormat:@"accessor: ([%d.%d], %d)", v24, v26, audit_token_to_asid(&atoken)];
    if (a5)
    {
      long long v29 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a5->var0;
      *(_OWORD *)&atoken.val[4] = v29;
      uint64_t v30 = audit_token_to_pid(&atoken);
      long long v31 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a5->var0;
      *(_OWORD *)&atoken.val[4] = v31;
      uint64_t v32 = audit_token_to_pidversion(&atoken);
      long long v33 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a5->var0;
      *(_OWORD *)&atoken.val[4] = v33;
      [v28 appendFormat:@", responsible: ([%d.%d], %d)", v30, v32, audit_token_to_asid(&atoken)];
    }
    uint64_t v34 = +[TCCDPlatform currentPlatform];
    BOOL v35 = [v34 server];
    v36 = [v35 logHandle];

    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = [v18 identifier];
      int64_t v38 = (char *)[(id)qword_1000AC5B8 count];
      atoken.val[0] = 138543874;
      *(void *)&atoken.val[1] = v37;
      LOWORD(atoken.val[3]) = 2114;
      *(void *)((char *)&atoken.val[3] + 2) = v28;
      HIWORD(atoken.val[5]) = 2048;
      *(void *)&atoken.val[6] = v38 - 1;
      _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "identityCache: adding: %{public}@ for %{public}@, idx: %lu", (uint8_t *)&atoken, 0x20u);
    }
  }

  objc_sync_exit(v11);
}

- (TCCDAccessIdentity)initWithMessage:(id)a3
{
  id v4 = a3;
  size_t length = 0;
  if (!xpc_dictionary_get_data(v4, "target_token", &length) || length != 32)
  {
    self = [(TCCDAccessIdentity *)self init];
    if (self)
    {
      string = xpc_dictionary_get_string(v4, "client_type");
      unsigned int v8 = xpc_dictionary_get_string(v4, "client");
      unsigned int v9 = xpc_dictionary_get_string(v4, "bundle_url");
      if (!string || !v8) {
        goto LABEL_24;
      }
      id v10 = v9;
      id v11 = +[NSString stringWithUTF8String:v8];
      identifier = self->_identifier;
      self->_identifier = v11;

      if (v11)
      {
        if (!strcmp(string, "bundle"))
        {
          self->_int client_type = 0;
          if (v10)
          {
            unsigned int v13 = +[NSString stringWithUTF8String:v10];
            uint64_t v14 = +[NSURL URLWithString:v13];

            id v15 = +[TCCDBundle bundleWithURL:v14];
            bundle = self->_bundle;
            self->_bundle = v15;
          }
          else
          {
            v19 = +[TCCDBundle bundleWithIdentifier:self->_identifier];
            uint64_t v14 = self->_bundle;
            self->_bundle = v19;
          }

          v20 = [(TCCDBundle *)self->_bundle executablePath];
          path = self->_path;
          self->_path = v20;

          BOOL v22 = self->_bundle;
          long long v23 = +[TCCDPlatform currentPlatform];
          uint64_t v24 = [v23 server];
          id v18 = [v24 logHandle];

          if (v22)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              long long v25 = self->_bundle;
              uint64_t v26 = self->_identifier;
              *(_DWORD *)buf = 136446978;
              uint64_t v32 = "-[TCCDAccessIdentity initWithMessage:]";
              __int16 v33 = 2114;
              uint64_t v34 = v25;
              __int16 v35 = 2114;
              v36 = (TCCDBundle *)v26;
              __int16 v37 = 2082;
              int64_t v38 = (NSString *)v10;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}s: bundle:%{public}@; for: %{public}@ with url: %{public}s",
                buf,
                0x2Au);
            }
          }
          else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = self->_bundle;
            long long v29 = self->_identifier;
            *(_DWORD *)buf = 136447234;
            uint64_t v32 = "-[TCCDAccessIdentity initWithMessage:]";
            __int16 v33 = 2048;
            uint64_t v34 = v28;
            __int16 v35 = 2114;
            v36 = v28;
            __int16 v37 = 2114;
            int64_t v38 = v29;
            __int16 v39 = 2082;
            v40 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s: self.bundle=%p, bundle:%{public}@; for: %{public}@ with url: %{public}s",
              buf,
              0x34u);
          }
        }
        else
        {
          if (strcmp(string, "path")) {
            goto LABEL_11;
          }
          self->_int client_type = 1;
          BOOL v17 = self->_identifier;
          id v18 = self->_path;
          self->_path = v17;
        }

LABEL_24:
        self = self;
        BOOL v6 = self;
        goto LABEL_25;
      }
    }
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_25;
  }
  BOOL v5 = [[TCCDAttributionChain alloc] initWithMessage:v4];
  if (v5)
  {
    self = [(TCCDAccessIdentity *)self initWithAttributionChain:v5 preferMostSpecificIdentifier:1];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

LABEL_25:
  return v6;
}

- (TCCDAccessIdentity)initWithBundleIdentifier:(id)a3 isWK2Proxy:(BOOL)a4
{
  id v7 = a3;
  unsigned int v8 = [(TCCDAccessIdentity *)self init];
  unsigned int v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_int client_type = 0;
    v9->_is_wk2_proxy = a4;
    uint64_t v10 = +[TCCDBundle bundleWithIdentifier:v7];
    bundle = v9->_bundle;
    v9->_bundle = (TCCDBundle *)v10;

    BOOL v12 = v9->_bundle;
    if (v12)
    {
      uint64_t v13 = [(TCCDBundle *)v12 executablePath];
      path = v9->_path;
      v9->_path = (NSString *)v13;
    }
    id v15 = v9->_identifier;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002EE58;
    v21[3] = &unk_100095C30;
    BOOL v22 = v15;
    uint64_t v16 = v15;
    BOOL v17 = objc_retainBlock(v21);
    id displayNameBlock = v9->displayNameBlock;
    v9->id displayNameBlock = v17;

    v19 = v9;
  }

  return v9;
}

- (TCCDAccessIdentity)initWithIdentifier:(id)a3 type:(int)a4 executableURL:(id)a5 SDKVersion:(unsigned int)a6 platformType:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = [(TCCDAccessIdentity *)self init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    v16->_int client_type = a4;
    if (a4 == 1)
    {
      objc_storeStrong((id *)&v16->_path, v16->_identifier);
      if (v16->_path)
      {
        BOOL v22 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
        if (!v22) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      __int16 v33 = +[TCCDPlatform currentPlatform];
      uint64_t v34 = [v33 server];
      BOOL v22 = [v34 logHandle];

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100030B2C(v22, v35, v36, v37, v38, v39, v40, v41);
      }
LABEL_22:
      uint64_t v21 = 0;
      goto LABEL_23;
    }
    if (!a4)
    {
      if (v14)
      {
        BOOL v17 = +[TCCDPlatform currentPlatform];
        id v18 = [v17 appBundleURLContainingExecutableURL:v14];

        if (v18)
        {
          uint64_t v19 = +[TCCDBundle bundleWithURL:v18];
          bundle = v16->_bundle;
          v16->_bundle = (TCCDBundle *)v19;
        }
      }
      else
      {
        uint64_t v23 = +[TCCDBundle bundleWithIdentifier:v13];
        id v18 = v16->_bundle;
        v16->_bundle = (TCCDBundle *)v23;
      }

      uint64_t v24 = v16->_bundle;
      if (v24)
      {
        uint64_t v25 = [(TCCDBundle *)v24 executablePath];
        path = v16->_path;
        v16->_path = (NSString *)v25;

        BOOL v22 = [(TCCDBundle *)v16->_bundle bundleURL];
        long long v27 = +[TCCDPlatform currentPlatform];
        uint64_t v28 = [v27 server];
        long long v29 = [v28 logHandle];

        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = [(TCCDAccessIdentity *)v16 bundle];
          long long v31 = v16->_bundle;
          identifier = v16->_identifier;
          int v45 = 136447490;
          long long v46 = "-[TCCDAccessIdentity initWithIdentifier:type:executableURL:SDKVersion:platformType:]";
          __int16 v47 = 2048;
          v48 = v30;
          __int16 v49 = 2114;
          pid_t v50 = v31;
          __int16 v51 = 2114;
          int v52 = identifier;
          __int16 v53 = 2114;
          id v54 = v14;
          __int16 v55 = 2082;
          id v56 = [v14 fileSystemRepresentation];
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%{public}s: self.bundle=%p, bundle:%{public}@; for: %{public}@, URL: %{public}@, %{public}s",
            (uint8_t *)&v45,
            0x3Eu);
        }
        if (!v22) {
          goto LABEL_17;
        }
LABEL_16:
        [(TCCDAccessIdentity *)v16 _makeDisplayNameBlockForURL:v22];
LABEL_17:
        v16->_sdkVersion = a6;
        v16->_platformType = a7;
        uint64_t v21 = v16;
LABEL_23:

        goto LABEL_24;
      }
      v42 = +[TCCDPlatform currentPlatform];
      v43 = [v42 server];
      BOOL v22 = [v43 logHandle];

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100030A60((uint64_t *)&v16->_identifier, v14, v22);
      }
      goto LABEL_22;
    }
  }
  uint64_t v21 = 0;
LABEL_24:

  return v21;
}

- (id)_initWithAccessIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TCCDAccessIdentity *)self init];
  BOOL v6 = v5;
  if (v5)
  {
    [(TCCDAccessIdentity *)v5 _updateFromAccessIdentity:v4];
    id v7 = v6;
  }

  return v6;
}

- (void)_updateFromAccessIdentity:(id)a3
{
  id v4 = a3;
  self->_int client_type = objc_msgSend(v4, "client_type");
  BOOL v5 = [v4 identifier];
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "policy_id");
  id v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  policy_id = self->_policy_id;
  self->_policy_id = v7;

  unsigned int v9 = [v4 path];
  path = self->_path;
  self->_path = v9;

  id v11 = [v4 bundle];
  bundle = self->_bundle;
  self->_bundle = v11;

  id v13 = (void *)v4[1];
  self->id displayNameBlock = objc_retainBlock(v13);
  _objc_release_x1();
}

- (id)_initImplicitlyAssumedIdentityFromRequestContext:(id)a3
{
  id v4 = [a3 attributionChain];
  BOOL v5 = [v4 accessingProcess];

  BOOL v6 = [v5 dictionaryValueForEntitlement:@"com.apple.private.attribution.implicitly-assumed-identity"];
  id v7 = v6;
  if (v6)
  {
    id v13 = 0;
    unsigned int v8 = sub_10002F474(v6, &v13);
    id v9 = v13;
    if (v8)
    {
      uint64_t v10 = +[NSString stringWithUTF8String:tcc_identity_get_identifier()];
      self = [(TCCDAccessIdentity *)self initWithIdentifier:v10 type:tcc_identity_get_type() executableURL:0 SDKVersion:0 platformType:0];
      id v11 = self;
    }
    else
    {
      uint64_t v10 = tcc_access_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_100030B64();
      }
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_initExplicitlyAssumedIdentityFromRequestContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 explicitlyAssumedIdentity];
  BOOL v6 = [v4 attributionChain];
  id v7 = [v6 accessingProcess];

  unsigned int v8 = [v7 arrayValueForEntitlement:@"com.apple.private.attribution.explicitly-assumed-identities"];
  id v9 = v8;
  if (v8)
  {
    uint64_t v24 = self;
    id v25 = v4;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = 0;
            uint64_t v16 = sub_10002F474(v15, &v26);
            BOOL v17 = v26;
            if (v16)
            {
              if (tcc_identity_type_and_identifiers_are_equal())
              {

                uint64_t v21 = +[NSString stringWithUTF8String:tcc_identity_get_identifier()];
                self = [(TCCDAccessIdentity *)v24 initWithIdentifier:v21 type:tcc_identity_get_type() executableURL:0 SDKVersion:0 platformType:0];
                BOOL v22 = self;
                id v4 = v25;
                goto LABEL_23;
              }
            }
            else
            {
              uint64_t v19 = tcc_access_log();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v32 = (uint64_t)v17;
                _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Invalid explicitly assumed identity entitlement: %{public}@", buf, 0xCu);
              }
            }
          }
          else
          {
            BOOL v17 = tcc_access_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              uint64_t v32 = v18;
              __int16 v33 = 2114;
              uint64_t v34 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid explicitly assumed identity entitlement: identities should be dictionaries, found %{public}@: %{public}@", buf, 0x16u);
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v12);
    }

    uint64_t v21 = (void *)tcc_object_copy_description();
    v20 = tcc_access_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_100030C40();
    }

    BOOL v22 = 0;
    self = v24;
    id v4 = v25;
LABEL_23:
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (id)initAssumedIdentityWithRequestContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 explicitlyAssumedIdentity];

  if (v5) {
    id v6 = [(TCCDAccessIdentity *)self _initExplicitlyAssumedIdentityFromRequestContext:v4];
  }
  else {
    id v6 = [(TCCDAccessIdentity *)self _initImplicitlyAssumedIdentityFromRequestContext:v4];
  }
  id v7 = v6;

  id v8 = v7;
  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: identifier=%@, client_type=%u>", objc_opt_class(), self->_identifier, self->_client_type];
}

- (id)displayName
{
  return (id)(*((uint64_t (**)(void))self->displayNameBlock + 2))();
}

- (NSString)attributionPath
{
  if (self->_client_type == 1 || !self->_bundle)
  {
    id v2 = self->_path;
  }
  else
  {
    id v2 = [(TCCDBundle *)self->_bundle bundlePath];
  }
  return v2;
}

- (BOOL)getSDKVersion:(unsigned int *)a3 platformType:(unsigned int *)a4
{
  unsigned int sdkVersion = self->_sdkVersion;
  if (sdkVersion)
  {
    *a3 = sdkVersion;
    *a4 = self->_platformType;
    return 1;
  }
  id v9 = self;
  objc_sync_enter(v9);
  unsigned int v10 = self->_sdkVersion;
  if (v10) {
    goto LABEL_4;
  }
  id v11 = [(TCCDAccessIdentity *)v9 path];
  id v12 = (const char *)[v11 fileSystemRepresentation];

  if (!v12)
  {
    id v25 = +[TCCDPlatform currentPlatform];
    id v26 = [v25 server];
    long long v27 = [v26 logHandle];

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = [(TCCDAccessIdentity *)v9 path];
      sub_100030CB8(v28, buf, v27);
    }

    goto LABEL_55;
  }
  *__error() = 0;
  int v13 = [(TCCDAccessIdentity *)v9 targetPID];
  if (v13 >= 1 && csops())
  {
    id v14 = +[TCCDPlatform currentPlatform];
    id v15 = [v14 server];
    uint64_t v16 = [v15 logHandle];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v45 = *__error();
      long long v46 = __error();
      __int16 v47 = strerror(*v46);
      *(_DWORD *)buf = 136446978;
      v66 = v12;
      __int16 v67 = 1024;
      *(_DWORD *)v68 = v13;
      *(_WORD *)&v68[4] = 1024;
      *(_DWORD *)&v68[6] = v45;
      *(_WORD *)&v68[10] = 2082;
      *(void *)&v68[12] = v47;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to get text offset for %{public}s[%d]: (#%d) %{public}s", buf, 0x22u);
    }

    goto LABEL_55;
  }
  BOOL v17 = +[TCCDPlatform currentPlatform];
  uint64_t v18 = [v17 server];
  uint64_t v19 = [v18 logHandle];

  int v20 = open(v12, 0);
  int v21 = v20;
  if (v20 == -1)
  {
    long long v29 = v19;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int v48 = *__error();
      __int16 v49 = __error();
      pid_t v50 = strerror(*v49);
      *(_DWORD *)buf = 136446722;
      v66 = v12;
      __int16 v67 = 1024;
      *(_DWORD *)v68 = v48;
      *(_WORD *)&v68[4] = 2082;
      *(void *)&v68[6] = v50;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "failed to open \"%{public}s\": (#%d): %{public}s", buf, 0x1Cu);
    }

    goto LABEL_55;
  }
  __buf[0] = 0;
  __buf[1] = 0;
  int v64 = 0;
  size_t size = 0;
  ssize_t v22 = pread(v20, __buf, 0x1CuLL, 0);
  if (v22 != 28)
  {
    long long v30 = v19;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      if (v22 == -1)
      {
        __int16 v51 = __error();
        int v52 = strerror(*v51);
      }
      else
      {
        int v52 = "truncated";
      }
      *(_DWORD *)buf = 136447234;
      v66 = v12;
      __int16 v67 = 2082;
      *(void *)v68 = v52;
      *(_WORD *)&v68[8] = 2048;
      *(void *)&v68[10] = 0;
      *(_WORD *)&v68[18] = 2048;
      uint64_t v69 = 28;
      __int16 v70 = 2048;
      ssize_t v71 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "failed to read header from %{public}s: %{public}s;  (textoff: %llu, expected size: %lu, got: %zd)",
        buf,
        0x34u);
    }
    goto LABEL_52;
  }
  int v23 = __buf[0];
  if (LODWORD(__buf[0]) == -17958193)
  {
    off_t v24 = 32;
  }
  else
  {
    if (LODWORD(__buf[0]) != -17958194)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v66 = v12;
        __int16 v67 = 1024;
        *(_DWORD *)v68 = v23;
        *(_WORD *)&v68[4] = 2048;
        *(void *)&v68[6] = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "spooky magic for %{public}s (0x%x) at text offset: %lld", buf, 0x1Cu);
      }
      goto LABEL_53;
    }
    off_t v24 = 28;
  }
  long long v31 = (int *)malloc_type_malloc(HIDWORD(size), 0x82C628A1uLL);
  if (!v31)
  {
    long long v30 = v19;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int v59 = *__error();
      v60 = __error();
      v61 = strerror(*v60);
      *(_DWORD *)buf = 136446722;
      v66 = v12;
      __int16 v67 = 1024;
      *(_DWORD *)v68 = v59;
      *(_WORD *)&v68[4] = 2082;
      *(void *)&v68[6] = v61;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "can't allocate buffer for %{public}s: (#%d) %{public}s", buf, 0x1Cu);
    }
LABEL_52:

LABEL_53:
    close(v21);
LABEL_54:

LABEL_55:
    BOOL v8 = 0;
    goto LABEL_56;
  }
  ssize_t v32 = pread(v21, v31, HIDWORD(size), v24);
  ssize_t v33 = v32;
  if (v32 == -1 || v32 != HIDWORD(size))
  {
    v43 = v19;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      if (v33 == -1)
      {
        __int16 v53 = __error();
        BOOL v44 = strerror(*v53);
      }
      else
      {
        BOOL v44 = "truncated";
      }
      sub_100030D10((uint64_t)v44, buf, (uint64_t)v12, v43);
    }

    close(v21);
LABEL_66:
    free(v31);
    goto LABEL_54;
  }
  close(v21);
  *(void *)&self->_unsigned int sdkVersion = 0;
  int v34 = size;
  if (!size) {
    goto LABEL_84;
  }
  unint64_t v35 = (unint64_t)v31 + HIDWORD(size);
  uint64_t v36 = v31;
  while (1)
  {
    if ((unint64_t)(v36 + 2) > v35)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100030D68();
      }
      goto LABEL_66;
    }
    uint64_t v37 = v36[1];
    uint64_t v38 = (int *)((char *)v36 + v37);
    if (v37 < 8 || (unint64_t)v38 > v35 || v38 < v31)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100030DD0();
      }
      goto LABEL_66;
    }
    int v41 = *v36;
    if (*v36 > 46) {
      break;
    }
    if (v41 == 36)
    {
      int v55 = 1;
      goto LABEL_79;
    }
    if (v41 == 37)
    {
      int v55 = 2;
LABEL_79:
      v9->_unsigned int platformType = v55;
      if ((unint64_t)(v36 + 4) > v35)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100030E38();
        }
        goto LABEL_66;
      }
      unsigned int v56 = v36[3];
      self->_unsigned int sdkVersion = v56;
      if (*v36 != 48) {
        goto LABEL_84;
      }
LABEL_83:
      self->_unsigned int sdkVersion = v56 + 458752;
      goto LABEL_84;
    }
LABEL_46:
    uint64_t v36 = v38;
    if (!--v34) {
      goto LABEL_84;
    }
  }
  if (v41 != 50)
  {
    if (v41 == 48)
    {
      int v55 = 4;
      goto LABEL_79;
    }
    if (v41 == 47)
    {
      int v55 = 3;
      goto LABEL_79;
    }
    goto LABEL_46;
  }
  if ((unint64_t)(v36 + 6) > v35)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100030EA0();
    }
    goto LABEL_66;
  }
  unsigned int v56 = v36[4];
  self->_unsigned int sdkVersion = v56;
  v9->_unsigned int platformType = v36[2];
  if (v36[2] == 4) {
    goto LABEL_83;
  }
LABEL_84:
  free(v31);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    unsigned int v57 = self->_sdkVersion;
    unsigned int platformType = v9->_platformType;
    *(_DWORD *)buf = 136446978;
    v66 = v12;
    __int16 v67 = 2048;
    *(void *)v68 = 0;
    *(_WORD *)&v68[8] = 1024;
    *(_DWORD *)&v68[10] = v57;
    *(_WORD *)&v68[14] = 1024;
    *(_DWORD *)&v68[16] = platformType;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}s (offset %lld) linked against SDK version 0x%x, platform: %u", buf, 0x22u);
  }

  unsigned int v10 = self->_sdkVersion;
LABEL_4:
  *a3 = v10;
  *a4 = v9->_platformType;
  BOOL v8 = 1;
LABEL_56:
  objc_sync_exit(v9);

  return v8;
}

- (NSNumber)policy_id
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)is_wk2_proxy
{
  return self->_is_wk2_proxy;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (TCCDBundle)bundle
{
  return (TCCDBundle *)objc_getProperty(self, a2, 64, 1);
}

- (int)targetPID
{
  return self->_targetPID;
}

- (int)responsiblePID
{
  return self->_responsiblePID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)accessorAuditToken
{
  objc_copyStruct(retstr, &self->_accessorAuditToken, 32, 1, 0);
  return result;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)responsibleAuditToken
{
  objc_copyStruct(retstr, &self->_responsibleAuditToken, 32, 1, 0);
  return result;
}

- (NSURL)pluginBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)pluginTargetsSystemExtensionPoint
{
  return self->_pluginTargetsSystemExtensionPoint;
}

- (int64_t)pluginPromptPolicy
{
  return self->_pluginPromptPolicy;
}

- (int64_t)appExtensionType
{
  return self->_appExtensionType;
}

@end