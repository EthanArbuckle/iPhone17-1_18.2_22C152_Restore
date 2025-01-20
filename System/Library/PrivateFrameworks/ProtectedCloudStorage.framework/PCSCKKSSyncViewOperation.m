@interface PCSCKKSSyncViewOperation
- (BOOL)ensureControl;
- (CKKSControl)CKKSControl;
- (NSString)view;
- (PCSCKKSItemModifyContext)context;
- (PCSCKKSSyncViewOperation)initWithItemModifyContext:(id)a3;
- (void)checkTLKStatus;
- (void)setCKKSControl:(id)a3;
- (void)setView:(id)a3;
- (void)start;
- (void)syncView;
@end

@implementation PCSCKKSSyncViewOperation

- (PCSCKKSSyncViewOperation)initWithItemModifyContext:(id)a3
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
        v13.super_class = (Class)PCSCKKSSyncViewOperation,
        v7 = [(PCSCKKSSyncViewOperation *)&v13 init],
        (self = v7) == 0))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v7->_context, a3);
  v8 = NSString;
  v9 = [(PCSCKKSItemModifyContext *)self->_context service];
  v10 = [v8 stringWithFormat:@"SyncViewOperation service: %@", v9];
  [(PCSCKKSSyncViewOperation *)self setName:v10];

  self = self;
  v11 = self;
LABEL_9:

  return v11;
}

- (void)start
{
  v16[1] = *MEMORY[0x1E4F143B8];
  PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), @"Starting: %s", "-[PCSCKKSSyncViewOperation start]");
  if (![(PCSCKKSOperation *)self startOperation]) {
    return;
  }
  v3 = [(PCSCKKSSyncViewOperation *)self context];
  char v4 = PCSCurrentPersonaMatchesDSIDFromSet([v3 set]);

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    goto LABEL_14;
  }
  if ([(PCSCKKSItemModifyContext *)self->_context sync])
  {
    id v5 = [(PCSCKKSItemModifyContext *)self->_context service];
    [(PCSCKKSSyncViewOperation *)self setView:PCSServiceItemGetCKKSViewByName(v5)];

    v6 = [(PCSCKKSSyncViewOperation *)self view];

    if (v6)
    {
      [(PCSCKKSSyncViewOperation *)self checkTLKStatus];
      return;
    }
    v7 = (void *)MEMORY[0x1E4F28C58];
    v8 = kPCSErrorDomain;
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v9 = NSString;
    v10 = [(PCSCKKSItemModifyContext *)self->_context service];
    v11 = [v9 stringWithFormat:@"No view hint for %@", v10];
    v16[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_super v13 = [v7 errorWithDomain:v8 code:102 userInfo:v12];
    [(PCSCKKSOperation *)self setError:v13];

LABEL_14:
    [(PCSCKKSOperation *)self completeOperation];
    return;
  }
  [(PCSCKKSOperation *)self completeOperation];
}

- (BOOL)ensureControl
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PCSCKKSSyncViewOperation *)self context];
  char v4 = PCSCurrentPersonaMatchesDSIDFromSet([v3 set]);

  if (v4)
  {
    id v12 = 0;
    id v5 = [MEMORY[0x1E4F3B3F8] controlObject:&v12];
    id v6 = v12;
    [(PCSCKKSSyncViewOperation *)self setCKKSControl:v5];

    v7 = [(PCSCKKSSyncViewOperation *)self CKKSControl];
    BOOL v8 = v7 != 0;

    if (!v7)
    {
      if (v6)
      {
        uint64_t v14 = *MEMORY[0x1E4F28A50];
        v15[0] = v6;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      }
      else
      {
        v9 = 0;
      }
      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:kPCSErrorDomain code:109 userInfo:v9];
      [(PCSCKKSOperation *)self setError:v10];

      [(PCSCKKSOperation *)self completeOperation];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    [(PCSCKKSOperation *)self completeOperation];
    return 0;
  }
  return v8;
}

- (void)checkTLKStatus
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(PCSCKKSSyncViewOperation *)self ensureControl])
  {
    v3 = [(PCSCKKSSyncViewOperation *)self context];
    char v4 = PCSCurrentPersonaMatchesDSIDFromSet([v3 set]);

    if (v4)
    {
      id v5 = pcsLogObjForScope("ckks");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(PCSCKKSSyncViewOperation *)self view];
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v6;
        _os_log_impl(&dword_1ACF98000, v5, OS_LOG_TYPE_DEFAULT, "Checking if CKKS reports bad state: %@", buf, 0xCu);
      }
      v7 = [(PCSCKKSSyncViewOperation *)self view];
      BOOL v8 = [(PCSCKKSSyncViewOperation *)self CKKSControl];
      v9 = [(PCSCKKSSyncViewOperation *)self view];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42__PCSCKKSSyncViewOperation_checkTLKStatus__block_invoke;
      v11[3] = &unk_1E5E6E418;
      id v12 = v7;
      objc_super v13 = self;
      id v10 = v7;
      [v8 rpcKnownBadState:v9 reply:v11];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
      }
      [(PCSCKKSOperation *)self completeOperation];
    }
  }
}

uint64_t __42__PCSCKKSSyncViewOperation_checkTLKStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 0:
      char v4 = pcsLogObjForScope("ckks");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v15 = 138412290;
        uint64_t v16 = v5;
        _os_log_impl(&dword_1ACF98000, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%@): Likely good", (uint8_t *)&v15, 0xCu);
      }

      return [*(id *)(a1 + 40) syncView];
    case 1:
      v7 = pcsLogObjForScope("ckks");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v10;
        _os_log_impl(&dword_1ACF98000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%{public}@): TLKs missing", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v9 = 108;
      goto LABEL_20;
    case 2:
      v7 = pcsLogObjForScope("ckks");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1ACF98000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%{public}@): Needs unlock", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v9 = 132;
      goto LABEL_20;
    case 3:
      v7 = pcsLogObjForScope("ckks");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v12;
        _os_log_impl(&dword_1ACF98000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%{public}@): wait for Octagon", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v9 = 156;
      goto LABEL_20;
    case 4:
      v7 = pcsLogObjForScope("ckks");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v13;
        _os_log_impl(&dword_1ACF98000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%{public}@): no CloudKit account", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v9 = 157;
      goto LABEL_20;
    default:
      v7 = pcsLogObjForScope("ckks");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v15 = 138412546;
        uint64_t v16 = v8;
        __int16 v17 = 1024;
        int v18 = v2;
        _os_log_impl(&dword_1ACF98000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%@): unknown but likely fatal error: %d", (uint8_t *)&v15, 0x12u);
      }
      uint64_t v9 = 133;
LABEL_20:

      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:kPCSErrorDomain code:v9 userInfo:0];
      [*(id *)(a1 + 40) setError:v14];

      return [*(id *)(a1 + 40) completeOperation];
  }
}

- (void)syncView
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(PCSCKKSSyncViewOperation *)self ensureControl])
  {
    v3 = [(PCSCKKSSyncViewOperation *)self context];
    char v4 = PCSCurrentPersonaMatchesDSIDFromSet([v3 set]);

    if (v4)
    {
      uint64_t v5 = pcsLogObjForScope("ckks");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(PCSCKKSSyncViewOperation *)self view];
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl(&dword_1ACF98000, v5, OS_LOG_TYPE_DEFAULT, "Syncing ckks view: %@", buf, 0xCu);
      }
      v7 = [(PCSCKKSSyncViewOperation *)self context];
      uint64_t v8 = [v7 mtt];
      uint64_t v9 = [v8 measurePoint:@"CKKSSyncView"];

      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      int v18 = __36__PCSCKKSSyncViewOperation_syncView__block_invoke;
      uint64_t v19 = &unk_1E5E6E440;
      v20 = self;
      id v21 = v9;
      id v10 = v9;
      uint64_t v11 = (void *)MEMORY[0x1AD11D080](&v16);
      uint64_t v12 = [(PCSCKKSSyncViewOperation *)self context];
      int v13 = [v12 forceSync];

      uint64_t v14 = [(PCSCKKSSyncViewOperation *)self CKKSControl];
      int v15 = [(PCSCKKSSyncViewOperation *)self view];
      if (v13) {
        [v14 rpcFetchAndProcessChanges:v15 reply:v11];
      }
      else {
        [v14 rpcFetchAndProcessChangesIfNoRecentFetch:v15 reply:v11];
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
      }
      [(PCSCKKSOperation *)self completeOperation];
    }
  }
}

void __36__PCSCKKSSyncViewOperation_syncView__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [*(id *)(a1 + 32) context];
  uint64_t v4 = [v3 log];
  uint64_t v5 = [*(id *)(a1 + 32) view];
  if (v6)
  {
    PCSMigrationLog(v4, @"Syncing CKKS view %@ failed with: %@", v5, v6);

    [*(id *)(a1 + 32) setError:v6];
  }
  else
  {
    PCSMigrationLog(v4, @"Syncing CKKS view %@ successful", v5);
  }
  [*(id *)(a1 + 40) complete:v6 == 0];
  [*(id *)(a1 + 32) completeOperation];
}

- (PCSCKKSItemModifyContext)context
{
  return (PCSCKKSItemModifyContext *)objc_getProperty(self, a2, 272, 1);
}

- (CKKSControl)CKKSControl
{
  return (CKKSControl *)objc_getProperty(self, a2, 280, 1);
}

- (void)setCKKSControl:(id)a3
{
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_CKKSControl, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end