@interface PLClientApplicationIdentification
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (NSString)trustedCallerBundleID;
- (PLClientApplicationIdentification)initWithConnection:(id)a3;
- (int)clientProcessIdentifier;
@end

@implementation PLClientApplicationIdentification

- (void).cxx_destruct
{
}

- (NSString)trustedCallerBundleID
{
  return self->_trustedCallerBundleID;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (PLClientApplicationIdentification)initWithConnection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLXPCUtilities.m", 1129, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PLClientApplicationIdentification;
  v6 = [(PLClientApplicationIdentification *)&v15 init];
  v7 = v6;
  if (v6)
  {
    p_clientAuditToken = &v6->_clientAuditToken;
    if (v5)
    {
      [v5 auditToken];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
    }
    *(_OWORD *)p_clientAuditToken->val = v13;
    *(_OWORD *)&v7->_clientAuditToken.val[4] = v14;
    v7->_clientProcessIdentifier = [v5 processIdentifier];
    uint64_t v9 = PLClientApplicationIdentifierFromXPCConnection(v5);
    trustedCallerBundleID = v7->_trustedCallerBundleID;
    v7->_trustedCallerBundleID = (NSString *)v9;
  }
  return v7;
}

@end