@interface UAAuditToken
- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenValue;
- (BOOL)isSandboxed;
- (UAAuditToken)initWithAuditToken:(id *)a3;
- (const)objCType;
- (id)debugDescription;
- (id)description;
- (int)asid;
- (int)pid;
- (int)pidVersion;
- (unsigned)egid;
- (unsigned)euid;
- (unsigned)rgid;
- (unsigned)ruid;
- (void)getValue:(void *)a3;
@end

@implementation UAAuditToken

- (int)asid
{
  [(UAAuditToken *)self auditTokenValue];
  au_asid_t asidp = 0;
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, 0, &asidp, 0);
  return asidp;
}

- (id)description
{
  uint64_t v3 = [(UAAuditToken *)self pid];
  uint64_t v4 = [(UAAuditToken *)self pidVersion];
  uint64_t v5 = [(UAAuditToken *)self euid];
  uint64_t v6 = [(UAAuditToken *)self ruid];
  uint64_t v7 = [(UAAuditToken *)self egid];
  uint64_t v8 = [(UAAuditToken *)self rgid];
  uint64_t v9 = [(UAAuditToken *)self asid];
  unsigned int v10 = [(UAAuditToken *)self isSandboxed];
  CFStringRef v11 = @"NO";
  if (v10) {
    CFStringRef v11 = @"YES";
  }
  return +[NSString stringWithFormat:@"[pid=%d/%d uid=%d/%d gid=%d/%d asid=%d sb=%@]", v3, v4, v5, v6, v7, v8, v9, v11];
}

- (unsigned)ruid
{
  [(UAAuditToken *)self auditTokenValue];
  uid_t ruidp = 0;
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0, 0, 0, &ruidp, 0, 0, 0, 0);
  return ruidp;
}

- (unsigned)rgid
{
  [(UAAuditToken *)self auditTokenValue];
  gid_t rgidp = 0;
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, &rgidp, 0, 0, 0);
  return rgidp;
}

- (int)pidVersion
{
  [(UAAuditToken *)self auditTokenValue];
  au_tid_t tidp = 0;
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, 0, 0, &tidp);
  return tidp.port;
}

- (BOOL)isSandboxed
{
  BOOL v4 = 0;
  [(UAAuditToken *)self auditTokenValue];
  sub_10000EF4C((uint64_t)&v3, &v4);
  return v4;
}

- (int)pid
{
  [(UAAuditToken *)self auditTokenValue];
  pid_t pidp = 0;
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  return pidp;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenValue
{
  objc_copyStruct(retstr, &self->_auditTokenValue, 32, 1, 0);
  return result;
}

- (unsigned)euid
{
  [(UAAuditToken *)self auditTokenValue];
  uid_t ruidp = 0;
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0, 0, 0, &ruidp, 0, 0, 0, 0);
  return ruidp;
}

- (unsigned)egid
{
  [(UAAuditToken *)self auditTokenValue];
  gid_t egidp = 0;
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0, 0, &egidp, 0, 0, 0, 0, 0);
  return egidp;
}

- (UAAuditToken)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UAAuditToken;
  result = [(UAAuditToken *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditTokenValue.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditTokenValue.val[4] = v5;
  }
  return result;
}

- (void)getValue:(void *)a3
{
  long long v3 = *(_OWORD *)&self->_auditTokenValue.val[4];
  *(_OWORD *)a3 = *(_OWORD *)self->_auditTokenValue.val;
  *((_OWORD *)a3 + 1) = v3;
}

- (const)objCType
{
  return "{?=[8I]}";
}

- (id)debugDescription
{
  long long v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  long long v5 = [(UAAuditToken *)self description];
  objc_super v6 = +[NSString stringWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

@end