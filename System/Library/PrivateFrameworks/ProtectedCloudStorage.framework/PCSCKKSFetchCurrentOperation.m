@interface PCSCKKSFetchCurrentOperation
- (PCSCKKSFetchCurrentOperation)initWithItemModifyContext:(id)a3;
- (PCSCKKSItemModifyContext)context;
- (void)fetchComplete:(id)a3 point:(id)a4 error:(id)a5;
- (void)fetchCurrentItem:(id)a3 viewhint:(id)a4 complete:(id)a5;
- (void)fetchPersistentRef:(id)a3;
- (void)setContext:(id)a3;
- (void)start;
@end

@implementation PCSCKKSFetchCurrentOperation

- (PCSCKKSFetchCurrentOperation)initWithItemModifyContext:(id)a3
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
        v13.super_class = (Class)PCSCKKSFetchCurrentOperation,
        v7 = [(PCSCKKSFetchCurrentOperation *)&v13 init],
        (self = v7) == 0))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v7->_context, a3);
  v8 = NSString;
  v9 = [(PCSCKKSItemModifyContext *)self->_context service];
  v10 = [v8 stringWithFormat:@"FetchCurrentOperation service: %@", v9];
  [(PCSCKKSFetchCurrentOperation *)self setName:v10];

  self = self;
  v11 = self;
LABEL_9:

  return v11;
}

- (void)start
{
  PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), @"Starting: %s", "-[PCSCKKSFetchCurrentOperation start]");
  if ([(PCSCKKSOperation *)self startOperation])
  {
    v3 = [(PCSCKKSFetchCurrentOperation *)self context];
    char v4 = PCSCurrentPersonaMatchesDSIDFromSet([v3 set]);

    if (v4)
    {
      id v5 = [(PCSCKKSFetchCurrentOperation *)self context];
      v6 = [v5 mtt];
      v7 = [v6 measurePoint:@"CKKSFetchCurrent"];

      v8 = [(PCSCKKSItemModifyContext *)self->_context service];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __37__PCSCKKSFetchCurrentOperation_start__block_invoke;
      v10[3] = &unk_1E5E6F518;
      v10[4] = self;
      id v11 = v7;
      id v9 = v7;
      [(PCSCKKSFetchCurrentOperation *)self fetchCurrentItem:v8 viewhint:0 complete:v10];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
  }
}

uint64_t __37__PCSCKKSFetchCurrentOperation_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) fetchComplete:a2 point:*(void *)(a1 + 40) error:a3];
}

- (void)fetchComplete:(id)a3 point:(id)a4 error:(id)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PCSCKKSFetchCurrentOperation *)self context];
  char v12 = PCSCurrentPersonaMatchesDSIDFromSet([v11 set]);

  if (v12)
  {
    objc_super v13 = [v8 persistentRef];

    if (v10 || !v13)
    {
      v14 = pcsLogObjForScope("ckks");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(PCSCKKSFetchCurrentOperation *)self context];
        v16 = [v15 service];
        *(_DWORD *)buf = 138412546;
        v34 = v16;
        __int16 v35 = 2112;
        id v36 = v10;
        _os_log_impl(&dword_1ACF98000, v14, OS_LOG_TYPE_DEFAULT, "Failed to get CKKS current service %@: %@", buf, 0x16u);
      }
    }
    v17 = [v8 persistentRef];

    if (v17)
    {
      v18 = [v8 persistentRef];
      [(PCSCKKSFetchCurrentOperation *)self fetchPersistentRef:v18];
    }
    else if ([v10 code] != -25300)
    {
      if (v10)
      {
        [(PCSCKKSOperation *)self setError:v10];
      }
      else
      {
        v24 = (void *)MEMORY[0x1E4F28C58];
        v25 = kPCSErrorDomain;
        uint64_t v31 = *MEMORY[0x1E4F28568];
        v26 = NSString;
        v27 = [(PCSCKKSItemModifyContext *)self->_context service];
        v28 = [v26 stringWithFormat:@"Fetch current identity failed for service %@", v27];
        v32 = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        v30 = [v24 errorWithDomain:v25 code:104 userInfo:v29];
        [(PCSCKKSOperation *)self setError:v30];
      }
      uint64_t v23 = 0;
      goto LABEL_14;
    }
    uint64_t v23 = 1;
LABEL_14:
    [v9 complete:v23];
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
  }
  v19 = (void *)MEMORY[0x1E4F28C58];
  v20 = kPCSErrorDomain;
  uint64_t v37 = *MEMORY[0x1E4F28568];
  v38[0] = @"dsid does not match current persona's account dsid";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  v22 = [v19 errorWithDomain:v20 code:146 userInfo:v21];
  [(PCSCKKSOperation *)self setError:v22];

LABEL_15:
  [(PCSCKKSOperation *)self completeOperation];
}

- (void)fetchCurrentItem:(id)a3 viewhint:(id)a4 complete:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [(PCSCKKSFetchCurrentOperation *)self context];
  char v12 = PCSCurrentPersonaMatchesDSIDFromSet([v11 set]);

  if (v12)
  {
    if (v9
      || ([(PCSCKKSItemModifyContext *)self->_context service],
          objc_super v13 = objc_claimAutoreleasedReturnValue(),
          PCSServiceItemGetCKKSViewByName(v13),
          id v9 = (id)objc_claimAutoreleasedReturnValue(),
          v13,
          v9))
    {
      PCSMigrationLog((uint64_t)[(PCSCKKSItemModifyContext *)self->_context log], @"Server fetching service %@ from view %@", v8, v9);
      v14 = off_1EB3B39F0;
      v15 = [(PCSCKKSItemModifyContext *)self->_context service];
      AccessGroupByName = PCSServiceItemGetAccessGroupByName(v15);
      ((void (*)(__CFString *, id, id, void, void (**)(id, void, void *)))v14)(AccessGroupByName, v8, v9, 0, v10);
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      v21 = kPCSErrorDomain;
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v22 = NSString;
      id v9 = [(PCSCKKSItemModifyContext *)self->_context service];
      v15 = [v22 stringWithFormat:@"No view hint for %@", v9];
      v27 = v15;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      v24 = [v20 errorWithDomain:v21 code:102 userInfo:v23];
      v10[2](v10, 0, v24);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    v18 = kPCSErrorDomain;
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"dsid does not match current persona's account dsid";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v15 = [v17 errorWithDomain:v18 code:146 userInfo:v19];

    v10[2](v10, 0, v15);
  }
}

- (void)fetchPersistentRef:(id)a3
{
  id v4 = a3;
  id v5 = [(PCSCKKSFetchCurrentOperation *)self context];
  char v6 = PCSCurrentPersonaMatchesDSIDFromSet([v5 set]);

  if (v6)
  {
    [(PCSCKKSItemModifyContext *)self->_context setExistingItemReference:0];
    [(PCSCKKSItemModifyContext *)self->_context setExistingItemSHA1:0];
    [(PCSCKKSItemModifyContext *)self->_context setCurrentIdentity:0 persistentReference:0];
    v7 = [(PCSCKKSFetchCurrentOperation *)self context];
    id v8 = [v7 dsid];
    id v13 = 0;
    SHA1 = (const void *)PCSIdentityCreateFromPersistentReferenceAndGetSHA1(v4, v8, &v13);
    id v10 = v13;

    [(PCSCKKSItemModifyContext *)self->_context setExistingItemReference:v4];
    [(PCSCKKSItemModifyContext *)self->_context setExistingItemSHA1:v10];
    context = self->_context;
    if (SHA1)
    {
      [(PCSCKKSItemModifyContext *)context setCurrentIdentity:SHA1 persistentReference:v4];

      CFRelease(SHA1);
    }
    else
    {
      uint64_t v12 = [(PCSCKKSItemModifyContext *)context log];

      PCSMigrationLog(v12, @"Failed to create identity from persistent ref: %@", v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
  }
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