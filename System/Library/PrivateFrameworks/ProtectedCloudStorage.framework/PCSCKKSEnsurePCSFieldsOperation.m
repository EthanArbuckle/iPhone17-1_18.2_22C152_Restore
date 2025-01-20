@interface PCSCKKSEnsurePCSFieldsOperation
- (BOOL)haveCKKSPlaintextEntitlements;
- (PCSCKKSEnsurePCSFieldsOperation)initWithItemModifyContext:(id)a3;
- (PCSCKKSItemModifyContext)context;
- (int)updateKeychain:(id)a3 withAttributes:(id)a4;
- (void)setContext:(id)a3;
- (void)start;
@end

@implementation PCSCKKSEnsurePCSFieldsOperation

- (PCSCKKSEnsurePCSFieldsOperation)initWithItemModifyContext:(id)a3
{
  id v5 = a3;
  if ((PCSCurrentPersonaMatchesDSIDFromSet([v5 set]) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    goto LABEL_8;
  }
  if (!v5
    || ([v5 service], v6 = objc_claimAutoreleasedReturnValue(), v6, !v6)
    || (v13.receiver = self,
        v13.super_class = (Class)PCSCKKSEnsurePCSFieldsOperation,
        v7 = [(PCSCKKSEnsurePCSFieldsOperation *)&v13 init],
        (self = v7) == 0))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v7->_context, a3);
  v8 = NSString;
  v9 = [(PCSCKKSItemModifyContext *)self->_context service];
  v10 = [v8 stringWithFormat:@"EnsurePCSFields service: %@", v9];
  [(PCSCKKSEnsurePCSFieldsOperation *)self setName:v10];

  self = self;
  v11 = self;
LABEL_9:

  return v11;
}

- (BOOL)haveCKKSPlaintextEntitlements
{
  v2 = [(PCSCKKSEnsurePCSFieldsOperation *)self context];
  char v3 = PCSCurrentPersonaMatchesDSIDFromSet([v2 set]);

  if (v3)
  {
    if (haveCKKSPlaintextEntitlements_once != -1) {
      dispatch_once(&haveCKKSPlaintextEntitlements_once, &__block_literal_global_6);
    }
    return haveCKKSPlaintextEntitlements_haveEntitlements != 0;
  }
  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", v6, 2u);
      return 0;
    }
  }
  return result;
}

void __64__PCSCKKSEnsurePCSFieldsOperation_haveCKKSPlaintextEntitlements__block_invoke()
{
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    v2 = (void *)SecTaskCopyValueForEntitlement(v0, @"com.apple.private.ckks.plaintextfields", 0);
    CFRelease(v1);

    BOOL v3 = v2 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  haveCKKSPlaintextEntitlements_haveEntitlements = v3;
}

- (void)start
{
  v17[1] = *MEMORY[0x1E4F143B8];
  PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), @"Starting: %s", "-[PCSCKKSEnsurePCSFieldsOperation start]");
  if ([(PCSCKKSOperation *)self startOperation])
  {
    BOOL v3 = [(PCSCKKSEnsurePCSFieldsOperation *)self context];
    char v4 = PCSCurrentPersonaMatchesDSIDFromSet([v3 set]);

    if (v4)
    {
      if ([(PCSCKKSItemModifyContext *)self->_context currentIdentity])
      {
        uint64_t v5 = [(PCSCKKSItemModifyContext *)self->_context currentItemReference];
        if (v5)
        {
          v6 = (void *)v5;
          BOOL v7 = [(PCSCKKSEnsurePCSFieldsOperation *)self haveCKKSPlaintextEntitlements];

          if (v7)
          {
            v8 = [(PCSCKKSEnsurePCSFieldsOperation *)self context];
            v9 = [v8 mtt];
            v10 = [v9 measurePoint:@"EnsurePCSAttributes"];

            if ((_PCSIdentityHavePCSCKKSAttributes((uint64_t)[(PCSCKKSItemModifyContext *)self->_context currentIdentity]) & 1) == 0)
            {
              v11 = [MEMORY[0x1E4F1CA60] dictionary];
              uint64_t v16 = *MEMORY[0x1E4F3BD40];
              v12 = [(PCSCKKSItemModifyContext *)self->_context currentItemReference];
              v17[0] = v12;
              objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

              if (_PCSKeychainAmendCKKSEntry((uint64_t)[(PCSCKKSItemModifyContext *)self->_context currentIdentity], (__CFDictionary *)v11))
              {
                uint64_t v14 = [(PCSCKKSEnsurePCSFieldsOperation *)self updateKeychain:v13 withAttributes:v11];
                PCSMigrationLog((uint64_t)[(PCSCKKSItemModifyContext *)self->_context log], @"Updated identity %@ with CKKS attributes: status: %d", [(PCSCKKSItemModifyContext *)self->_context currentIdentity], v14);
                if (!v14) {
                  _PCSIdentityCheckPCSAttributes((uint64_t)[(PCSCKKSItemModifyContext *)self->_context currentIdentity], v11);
                }
              }
              else
              {
                PCSMigrationLog((uint64_t)[(PCSCKKSItemModifyContext *)self->_context log], @"Could not build CKKS attributes for %@", [(PCSCKKSItemModifyContext *)self->_context currentIdentity]);
              }
              [v10 complete:1];
            }
          }
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    [(PCSCKKSOperation *)self completeOperation];
  }
}

- (int)updateKeychain:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PCSCKKSEnsurePCSFieldsOperation *)self context];
  char v9 = PCSCurrentPersonaMatchesDSIDFromSet([v8 set]);

  if (v9)
  {
    int v10 = qword_1EB3B39C0(v6, v7);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", v12, 2u);
    }
    int v10 = -25291;
  }

  return v10;
}

- (PCSCKKSItemModifyContext)context
{
  return (PCSCKKSItemModifyContext *)objc_getProperty(self, a2, 272, 1);
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end