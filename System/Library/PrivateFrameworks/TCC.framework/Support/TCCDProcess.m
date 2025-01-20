@interface TCCDProcess
+ (id)identifierForInvalidCode;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)BOOLValueForEntitlement:(id)a3;
- (BOOL)_initializeUsingResponsibleIdentity:(id)a3;
- (BOOL)_initializeUsingTaskForAuditToken:(id *)a3;
- (BOOL)hasEntitlement:(id)a3 containsService:(id)a4 options:(unint64_t)a5;
- (BOOL)hasEntitlement:(id)a3 containsServiceAllOrService:(id)a4 options:(unint64_t)a5;
- (BOOL)hasRuntimeValidationEnabled;
- (BOOL)isAppClip;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlatformBinary;
- (BOOL)isSystemPreferencesApp;
- (NSDictionary)entitlements;
- (NSString)binaryPath;
- (NSString)identifier;
- (NSString)responsiblePath;
- (TCCDProcess)initWithAuditToken:(id *)a3 responsibleIdentity:(id)a4;
- (au_tid)pidVersion;
- (id)arrayValueForEntitlement:(id)a3;
- (id)description;
- (id)dictionaryValueForEntitlement:(id)a3;
- (id)logHandle;
- (int)pid;
- (unint64_t)hash;
- (unsigned)auid;
- (unsigned)codesignStatus;
- (unsigned)euid;
- (void)dealloc;
- (void)setAuditToken:(id *)a3;
- (void)setAuid:(unsigned int)a3;
- (void)setBinaryPath:(id)a3;
- (void)setCodesignStatus:(unsigned int)a3;
- (void)setEntitlements:(id)a3;
- (void)setEuid:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setPid:(int)a3;
- (void)setPidVersion:(au_tid)a3;
- (void)tccd_crash_fd_limit;
@end

@implementation TCCDProcess

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TCCDProcess;
  [(TCCDProcess *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryPath, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_responsiblePath, 0);
}

- (NSString)responsiblePath
{
  responsiblePath = self->_responsiblePath;
  if (responsiblePath)
  {
    v3 = responsiblePath;
  }
  else
  {
    v3 = [(TCCDProcess *)self binaryPath];
  }
  return v3;
}

- (BOOL)hasEntitlement:(id)a3 containsServiceAllOrService:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  if ([(TCCDProcess *)self hasEntitlement:v8 containsService:a4 options:a5])
  {
    BOOL v9 = 1;
  }
  else
  {
    v10 = +[TCCDService serviceAll];
    BOOL v9 = [(TCCDProcess *)self hasEntitlement:v8 containsService:v10 options:a5];
  }
  return v9;
}

- (TCCDProcess)initWithAuditToken:(id *)a3 responsibleIdentity:(id)a4
{
  id v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)TCCDProcess;
  v7 = [(TCCDProcess *)&v25 init];
  p_isa = (id *)&v7->super.isa;
  if (v7)
  {
    long long v9 = *(_OWORD *)&a3->var0[4];
    v24[0] = *(_OWORD *)a3->var0;
    v24[1] = v9;
    [(TCCDProcess *)v7 setAuditToken:v24];
    *(void *)pidp = 0;
    uid_t euidp = 0;
    au_tid_t tidp = 0;
    [p_isa auditToken];
    audit_token_to_au32(&atoken, (uid_t *)pidp, &euidp, 0, 0, 0, &pidp[1], 0, &tidp);
    if (pidp[0] == -1) {
      pidp[0] = euidp;
    }
    [p_isa setPid:pidp[1]];
    [p_isa setAuid:pidp[0]];
    [p_isa setEuid:euidp];
    [p_isa setPidVersion:tidp];
    if (v6)
    {
      if (([p_isa _initializeUsingResponsibleIdentity:v6] & 1) == 0) {
        goto LABEL_18;
      }
    }
    else
    {
      long long v10 = *(_OWORD *)&a3->var0[4];
      buffer[0] = *(_OWORD *)a3->var0;
      buffer[1] = v10;
      if (![p_isa _initializeUsingTaskForAuditToken:buffer])
      {
LABEL_18:
        v16 = 0;
        goto LABEL_19;
      }
    }
    bzero(buffer, 0x400uLL);
    if (proc_pidpath_audittoken((audit_token_t *)a3, buffer, 0x400u) <= 0)
    {
      v17 = [p_isa logHandle];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100052E24(p_isa, v17);
      }

      goto LABEL_18;
    }
    v11 = +[NSString stringWithUTF8String:buffer];
    id v19 = 0;
    uint64_t v12 = [v11 stringByResolvingRealPathWithError:&v19];
    id v13 = v19;
    id v14 = p_isa[8];
    p_isa[8] = (id)v12;

    if (!p_isa[8])
    {
      v15 = [p_isa logHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100052EE8((uint64_t)buffer, (uint64_t)v13, v15);
      }

      objc_storeStrong(p_isa + 8, v11);
    }
  }
  v16 = p_isa;
LABEL_19:

  return v16;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setPidVersion:(au_tid)a3
{
  au_tid src = a3;
  objc_copyStruct(&self->_pidVersion, &src, 8, 1, 0);
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setEuid:(unsigned int)a3
{
  self->_euid = a3;
}

- (void)setAuid:(unsigned int)a3
{
  self->_auid = a3;
}

- (void)setAuditToken:(id *)a3
{
}

- (BOOL)_initializeUsingTaskForAuditToken:(id *)a3
{
  unsigned int v39 = 0;
  p_pid = &self->_pid;
  if (csops_audittoken())
  {
    id v6 = [(TCCDProcess *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000532E0((uint64_t)p_pid, v6, v7, v8, v9, v10, v11, v12);
    }

    unsigned int v13 = 0;
  }
  else
  {
    unsigned int v13 = v39;
  }
  self->_codesignStatus = v13;
  long long v14 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v14;
  v15 = SecTaskCreateWithAuditToken(0, &cf);
  if (v15)
  {
    *(void *)cf.val = 0;
    v16 = (NSDictionary *)SecTaskCopyValuesForEntitlements(v15, (CFArrayRef)+[TCCDPlatform allTCCEntitlements], (CFErrorRef *)&cf);
    if (!v16)
    {
      if (*(void *)cf.val)
      {
        v17 = [(TCCDProcess *)self logHandle];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100053200();
        }
      }
      v16 = (NSDictionary *)objc_opt_new();
    }
    entitlements = self->_entitlements;
    self->_entitlements = v16;

    *__error() = 0;
    id v19 = (NSString *)SecTaskCopySigningIdentifier(v15, (CFErrorRef *)&cf);
    if (!v19)
    {
      uint64_t v20 = *(void *)cf.val;
      v21 = [(TCCDProcess *)self logHandle];
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      if (v20)
      {
        if (v22) {
          sub_100053190();
        }
      }
      else if (v22)
      {
        sub_100053120((uint64_t)p_pid, v21, v23, v24, v25, v26, v27, v28);
      }

      id v19 = [(id)objc_opt_class() identifierForInvalidCode];
    }
    identifier = self->_identifier;
    self->_identifier = v19;

    CFRelease(v15);
    if (*(void *)cf.val) {
      CFRelease(*(CFTypeRef *)cf.val);
    }
  }
  else
  {
    v29 = [(TCCDProcess *)self logHandle];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100053270((uint64_t)p_pid, v29, v30, v31, v32, v33, v34, v35);
    }
  }
  return v15 != 0;
}

- (id)logHandle
{
  objc_super v2 = +[TCCDPlatform currentPlatform];
  v3 = [v2 server];
  v4 = [v3 logHandle];

  return v4;
}

- (BOOL)hasEntitlement:(id)a3 containsService:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(TCCDProcess *)self arrayValueForEntitlement:v8];
  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v11 = [v9 name];
  unsigned __int8 v12 = [v10 containsObject:v11];

  if ((v12 & 1) == 0)
  {
    if (v5)
    {
      uint64_t v20 = objc_msgSend(v9, "macos_compositionParentService");
      if (v20)
      {
        v21 = (void *)v20;
        while (1)
        {
          BOOL v22 = [v21 name];
          unsigned int v23 = [v10 containsObject:v22];

          if (v23) {
            break;
          }
          uint64_t v24 = objc_msgSend(v21, "macos_compositionParentService");

          v21 = (void *)v24;
          if (!v24) {
            goto LABEL_11;
          }
        }

        goto LABEL_3;
      }
    }
LABEL_11:
    BOOL v19 = 0;
    goto LABEL_12;
  }
LABEL_3:
  unsigned int v13 = [(TCCDProcess *)self logHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = objc_opt_class();
    v15 = [(TCCDProcess *)self identifier];
    unsigned int v16 = [(TCCDProcess *)self pid];
    v17 = [v9 name];
    v18 = [0 name];
    int v26 = 138544642;
    uint64_t v27 = v14;
    __int16 v28 = 2114;
    v29 = v15;
    __int16 v30 = 1024;
    unsigned int v31 = v16;
    __int16 v32 = 2114;
    id v33 = v8;
    __int16 v34 = 2114;
    uint64_t v35 = v17;
    __int16 v36 = 2114;
    v37 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "<%{public}@: identifier=%{public}@, pid=%d> has the %{public}@ entitlement for service %{public}@ (composed to parent: %{public}@)", (uint8_t *)&v26, 0x3Au);
  }
  BOOL v19 = 1;
LABEL_12:

  return v19;
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v4 = objc_opt_class();
  char v5 = [(TCCDProcess *)self identifier];
  [v3 appendFormat:@"%@: identifier=%@, pid=%d, auid=%d, euid=%d, ", v4, v5, -[TCCDProcess pid](self, "pid"), -[TCCDProcess auid](self, "auid"), -[TCCDProcess euid](self, "euid")];

  if (self->_responsiblePath) {
    [v3 appendFormat:@"responsible_path=%@, ", self->_responsiblePath];
  }
  id v6 = [(TCCDProcess *)self binaryPath];
  [v3 appendFormat:@"binary_path=%@", v6];

  return v3;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)binaryPath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)euid
{
  return self->_euid;
}

- (unsigned)auid
{
  return self->_auid;
}

- (BOOL)BOOLValueForEntitlement:(id)a3
{
  id v4 = a3;
  char v5 = [(TCCDProcess *)self entitlements];

  if (!v5) {
    goto LABEL_9;
  }
  id v6 = [(TCCDProcess *)self entitlements];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
LABEL_8:

LABEL_9:
    unsigned __int8 v8 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [(TCCDProcess *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100052F70(self);
    }

    goto LABEL_8;
  }
  unsigned __int8 v8 = [v7 BOOLValue];

LABEL_10:
  return v8;
}

- (id)arrayValueForEntitlement:(id)a3
{
  id v4 = a3;
  char v5 = [(TCCDProcess *)self entitlements];

  if (v5
    && ([(TCCDProcess *)self entitlements],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKeyedSubscript:v4],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
    }
    else
    {
      id v9 = [(TCCDProcess *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100053000(self);
      }

      id v8 = 0;
    }
  }
  else
  {
    id v8 = (id)objc_opt_new();
  }

  return v8;
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isAppClip
{
  return [(TCCDProcess *)self BOOLValueForEntitlement:@"com.apple.developer.on-demand-install-capable"];
}

+ (id)identifierForInvalidCode
{
  return @"<ID of InvalidCode>";
}

- (void)tccd_crash_fd_limit
{
  log_open_file_descriptors();
  if (os_variant_allows_internal_security_policies())
  {
    _os_crash();
    __break(1u);
  }
  v3 = [(TCCDProcess *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Too many open files", v4, 2u);
  }

  exit(1);
}

- (id)dictionaryValueForEntitlement:(id)a3
{
  id v4 = a3;
  char v5 = [(TCCDProcess *)self entitlements];

  if (v5)
  {
    id v6 = [(TCCDProcess *)self entitlements];
    char v5 = [v6 objectForKeyedSubscript:v4];

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_8;
      }
      uint64_t v7 = tcc_access_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100053090(self);
      }
    }
    char v5 = 0;
  }
LABEL_8:

  return v5;
}

- (BOOL)hasRuntimeValidationEnabled
{
  return (~[(TCCDProcess *)self codesignStatus] & 0x1200) == 0;
}

- (BOOL)isPlatformBinary
{
  return (~[(TCCDProcess *)self codesignStatus] & 0x4000001) == 0;
}

- (BOOL)isSystemPreferencesApp
{
  BOOL v3 = [(TCCDProcess *)self isPlatformBinary];
  if (v3)
  {
    id v4 = [(TCCDProcess *)self identifier];
    unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.Preferences"];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_initializeUsingResponsibleIdentity:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  int8x16_t v2 = veorq_s8(*(int8x16_t *)self->_auditToken.val, *(int8x16_t *)&self->_auditToken.val[4]);
  int16x8_t v3 = vmovl_high_s8(v2);
  int8x16_t v4 = (int8x16_t)vmovl_s16(*(int16x4_t *)v3.i8);
  int16x8_t v5 = vmovl_s8(*(int8x8_t *)v2.i8);
  int8x16_t v6 = (int8x16_t)vmovl_s16(*(int16x4_t *)v5.i8);
  int8x16_t v7 = (int8x16_t)vmovl_high_s16(v3);
  int8x16_t v8 = (int8x16_t)vmovl_high_s16(v5);
  *(int8x8_t *)v8.i8 = veor_s8(veor_s8(veor_s8(*(int8x8_t *)v6.i8, *(int8x8_t *)v4.i8), veor_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v7.i8)), veor_s8(veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)), veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))));
  v9.i64[0] = v8.i32[0];
  v9.i64[1] = v8.i32[1];
  return (unint64_t)veor_s8((int8x8_t)v8.i32[0], (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
}

- (BOOL)isEqual:(id)a3
{
  int8x16_t v4 = (TCCDProcess *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int16x8_t v5 = v4;
      [(TCCDProcess *)self auditToken];
      if (v5)
      {
        [(TCCDProcess *)v5 auditToken];
      }
      else
      {
        long long v12 = 0u;
        long long v13 = 0u;
      }
      if (v14 == (void)v12 && v15 == *((void *)&v12 + 1) && v16 == (void)v13 && v17 == *((void *)&v13 + 1))
      {
        unsigned int v10 = [(TCCDProcess *)self pid];
        BOOL v6 = v10 == [(TCCDProcess *)v5 pid];
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (au_tid)pidVersion
{
  objc_copyStruct(&dest, &self->_pidVersion, 8, 1, 0);
  return dest;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setEntitlements:(id)a3
{
}

- (unsigned)codesignStatus
{
  return self->_codesignStatus;
}

- (void)setCodesignStatus:(unsigned int)a3
{
  self->_codesignStatus = a3;
}

- (void)setBinaryPath:(id)a3
{
}

@end