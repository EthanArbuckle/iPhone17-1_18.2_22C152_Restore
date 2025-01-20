@interface PALazyAuditTokenBasedClientIdentity
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isIdentityResolved;
- (NSString)description;
- (OS_tcc_identity)identity;
- (PALazyAuditTokenBasedClientIdentity)initWithAuditToken:(id *)a3;
@end

@implementation PALazyAuditTokenBasedClientIdentity

- (PALazyAuditTokenBasedClientIdentity)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PALazyAuditTokenBasedClientIdentity;
  result = [(PALazyAuditTokenBasedClientIdentity *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

- (OS_tcc_identity)identity
{
  if (!self->_identityResolved)
  {
    v3 = tcc_server_singleton_default();
    v4 = (void *)tcc_credential_create_for_process_with_audit_token();
    long long v5 = (void *)tcc_message_options_create();
    tcc_message_options_set_reply_handler_policy();
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    tcc_server_message_get_identity_for_credential();
    objc_super v6 = (OS_tcc_identity *)(id)v11[5];
    _Block_object_dispose(&v10, 8);

    identity = self->_identity;
    self->_identity = v6;

    self->_identityResolved = 1;
  }
  v8 = self->_identity;

  return v8;
}

- (NSString)description
{
  uint64_t v2 = MEMORY[0x1F4188790](self, a2);
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(id)v2 identity];
  if (v3)
  {
    v4 = (__CFString *)tcc_object_copy_description();
  }
  else
  {
    long long v5 = *(_OWORD *)(v2 + 40);
    *(_OWORD *)audittoken.val = *(_OWORD *)(v2 + 24);
    *(_OWORD *)&audittoken.val[4] = v5;
    bzero(buffer, 0x1000uLL);
    if (proc_pidpath_audittoken(&audittoken, buffer, 0x1000u) > 0
      && ([NSString stringWithUTF8String:buffer],
          (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)v6;
      v4 = [NSString stringWithFormat:@"<IDENTIFICATION_FAILED:%@>", v6, 0, *(void *)audittoken.val, *(void *)&audittoken.val[2], *(void *)&audittoken.val[4], *(void *)&audittoken.val[6]];
    }
    else
    {
      v4 = @"<IDENTITY_UNKNOWN>";
    }
  }

  return (NSString *)v4;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)isIdentityResolved
{
  return self->_identityResolved;
}

- (void).cxx_destruct
{
}

@end