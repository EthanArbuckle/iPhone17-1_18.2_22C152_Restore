@interface RBSAuditToken
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)tokenFromAuditToken:(id *)a3;
+ (id)tokenFromAuditTokenRef:(id *)a3;
+ (id)tokenFromXPCConnection:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)realToken;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RBSAuditToken)initWithAuditToken:(id *)a3;
- (RBSAuditToken)initWithCoder:(id)a3;
- (RBSAuditToken)initWithRBSXPCCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pid;
- (int)pidversion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSAuditToken

- (int)pid
{
  return self->_auditToken.val[5];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSAuditToken *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    if (v4) {
      [(RBSAuditToken *)v4 realToken];
    }
    if (LODWORD(v12[0]) == self->_auditToken.val[0])
    {
      unint64_t v6 = 0;
      do
      {
        unint64_t v7 = v6;
        if (v6 == 7) {
          break;
        }
        int v8 = *((_DWORD *)v12 + v6 + 1);
        unsigned int v9 = self->_auditToken.val[++v6];
      }
      while (v8 == v9);
      BOOL v10 = v7 > 6;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)realToken
{
  long long v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

+ (id)tokenFromAuditToken:(id *)a3
{
  id v4 = objc_alloc((Class)a1);
  long long v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  unint64_t v6 = (void *)[v4 initWithAuditToken:v8];
  return v6;
}

- (RBSAuditToken)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RBSAuditToken;
  result = [(RBSAuditToken *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

- (int)pidversion
{
  long long v2 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pidversion(&v4);
}

+ (id)tokenFromAuditTokenRef:(id *)a3
{
  if (!a3)
  {
    unsigned int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"RBSSecurityUtilities.m", 41, @"Invalid parameter not satisfying: %@", @"auditToken" object file lineNumber description];
  }
  long long v5 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v5;
  objc_super v6 = [a1 tokenFromAuditToken:v10];
  return v6;
}

+ (id)tokenFromXPCConnection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unsigned int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"RBSSecurityUtilities.m", 47, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  *(void *)&long long v6 = -1;
  *((void *)&v6 + 1) = -1;
  *(_OWORD *)v10.val = v6;
  *(_OWORD *)&v10.val[4] = v6;
  xpc_connection_get_audit_token();
  audit_token_t atoken = v10;
  if (audit_token_to_pid(&atoken) == -1)
  {
    unint64_t v7 = 0;
  }
  else
  {
    audit_token_t atoken = v10;
    unint64_t v7 = [a1 tokenFromAuditToken:&atoken];
  }

  return v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v5 = a3;
  xpc_object_t v4 = xpc_data_create(&self->_auditToken, 0x20uLL);
  if (v4) {
    [v5 encodeXPCObject:v4 forKey:@"_auditToken"];
  }
}

- (RBSAuditToken)initWithRBSXPCCoder:(id)a3
{
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  long long buffer = v4;
  long long v11 = v4;
  id v5 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F14580] forKey:@"_auditToken"];
  long long v6 = v5;
  if (v5 && xpc_data_get_bytes(v5, &buffer, 0, 0x20uLL) == 32)
  {
    v9[0] = buffer;
    v9[1] = v11;
    self = [(RBSAuditToken *)self initWithAuditToken:v9];
    unint64_t v7 = self;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBSAuditToken)initWithCoder:(id)a3
{
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  long long v7 = v4;
  long long v8 = v4;
  [a3 decodeValueOfObjCType:"{?=[8I]}" at:&v7 size:32];
  v6[0] = v7;
  v6[1] = v8;
  return [(RBSAuditToken *)self initWithAuditToken:v6];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeValueOfObjCType:"{?=[8I]}" at:&self->_auditToken];
}

- (unint64_t)hash
{
  long long v2 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pid(&v4);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  audit_token_t v4 = [(id)objc_opt_class() description];
  long long v5 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v5;
  uint64_t v6 = audit_token_to_auid(&atoken);
  long long v7 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v7;
  uint64_t v8 = audit_token_to_euid(&atoken);
  long long v9 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v9;
  uint64_t v10 = audit_token_to_egid(&atoken);
  long long v11 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v11;
  uint64_t v12 = audit_token_to_ruid(&atoken);
  long long v13 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v13;
  uint64_t v14 = audit_token_to_rgid(&atoken);
  long long v15 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v15;
  uint64_t v16 = audit_token_to_pid(&atoken);
  long long v17 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v17;
  v18 = (void *)[v3 initWithFormat:@"<%@| AUID:%d EUID:%d EGID:%d RUID:%d RGID:%d PID:%d ASID:%d>", v4, v6, v8, v10, v12, v14, v16, audit_token_to_asid(&atoken)];

  return (NSString *)v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  audit_token_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  long long v5 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v5;
  return (id)[v4 initWithAuditToken:v7];
}

@end