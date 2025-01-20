@interface SLGLog
+ (id)sharedInstance;
- (BOOL)allowUnspecifiedDomains;
- (BOOL)isEnabled;
- (NSSet)whitelistedDomains;
- (SLGLog)init;
- (SLGLog)initWithClient:(id)a3 whitelist:(id)a4 enabled:(BOOL)a5;
- (id)_serializeObjectAsLogEntry:(id)a3 domain:(id)a4 tags:(id)a5 error:(id *)a6;
- (id)_wrapObjectWithEntryMetadata:(id)a3 domain:(id)a4 tags:(id)a5;
- (void)_fetchProcessInfo;
- (void)_setClient:(id)a3;
- (void)addDomainToWhitelist:(id)a3;
- (void)addObserver:(id)a3;
- (void)beginSession;
- (void)beginSessionWithCompletion:(id)a3;
- (void)client:(id)a3 didReceiveInitialLogMessageFromDomain:(id)a4;
- (void)clientDidReceiveServerReset:(id)a3;
- (void)endSession;
- (void)endSessionAndRenameFileTo:(id)a3 withCompletion:(id)a4;
- (void)endSessionWithCompletion:(id)a3;
- (void)log:(id)a3;
- (void)log:(id)a3 completion:(id)a4;
- (void)log:(id)a3 domain:(id)a4;
- (void)log:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)log:(id)a3 domain:(id)a4 tags:(id)a5;
- (void)log:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6;
- (void)log:(id)a3 tags:(id)a4;
- (void)log:(id)a3 tags:(id)a4 completion:(id)a5;
- (void)logBlock:(id)a3;
- (void)logBlock:(id)a3 completion:(id)a4;
- (void)logBlock:(id)a3 domain:(id)a4;
- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5;
- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6;
- (void)logBlock:(id)a3 tags:(id)a4;
- (void)logBlock:(id)a3 tags:(id)a4 completion:(id)a5;
- (void)removeDomainFromWhitelist:(id)a3;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)reset:(unint64_t)a3 completion:(id)a4;
- (void)resetWithCompletion:(id)a3;
- (void)setAllowUnspecifiedDomains:(BOOL)a3;
@end

@implementation SLGLog

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_shared;

  return v2;
}

void __24__SLGLog_sharedInstance__block_invoke()
{
  if (SLGLogIsEnabled())
  {
    v3 = objc_alloc_init(SLGLogXPCClient);
    v0 = objc_alloc_init(SLGDomainWhitelist);
    v1 = [[SLGLog alloc] initWithClient:v3 whitelist:v0 enabled:1];
    v2 = (void *)sharedInstance_shared;
    sharedInstance_shared = (uint64_t)v1;
  }
}

- (SLGLog)initWithClient:(id)a3 whitelist:(id)a4 enabled:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SLGLog;
  v10 = [(SLGLog *)&v19 init];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v12 = dispatch_queue_create("SLGLogObserverLock", v11);
    observerLockQueue = v10->_observerLockQueue;
    v10->_observerLockQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("SLGLogObserverCallout", v11);
    observerCalloutQueue = v10->_observerCalloutQueue;
    v10->_observerCalloutQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v10->_whitelist, a4);
    [(SLGLog *)v10 _setClient:v8];
    [(SLGLog *)v10 _fetchProcessInfo];
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v16;

    v10->_isEnabled = a5;
  }

  return v10;
}

- (SLGLog)init
{
  uint64_t IsEnabled = SLGLogIsEnabled();

  return [(SLGLog *)self initWithClient:0 whitelist:0 enabled:IsEnabled];
}

- (void)beginSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_isEnabled)
  {
    v6 = SLGCreateSessionStartMetadata();
    client = self->_client;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_2;
    v11[3] = &unk_1E6870220;
    id v12 = v6;
    id v13 = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_5;
    v9[3] = &unk_1E68701F8;
    id v10 = v13;
    id v8 = v6;
    [(SLGLogClientProtocol *)client queryServer:v11 errorHandler:v9];

LABEL_5:
    goto LABEL_6;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke;
    block[3] = &unk_1E68701A8;
    id v15 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v8 = v15;
    goto LABEL_5;
  }
LABEL_6:
}

void __37__SLGLog_beginSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __37__SLGLog_beginSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_3;
  v4[3] = &unk_1E68701F8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 beginSessionWithJSONMetadata:v3 completion:v4];
}

void __37__SLGLog_beginSessionWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_4;
    block[3] = &unk_1E68701D0;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __37__SLGLog_beginSessionWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __37__SLGLog_beginSessionWithCompletion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_6;
    block[3] = &unk_1E68701D0;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __37__SLGLog_beginSessionWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)endSessionAndRenameFileTo:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_isEnabled)
  {
    char v9 = SLGCreateSessionEndMetadata();
    client = self->_client;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_2;
    v14[3] = &unk_1E6870248;
    id v15 = v6;
    id v16 = v9;
    id v17 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_5;
    v12[3] = &unk_1E68701F8;
    id v13 = v17;
    id v11 = v9;
    [(SLGLogClientProtocol *)client queryServer:v14 errorHandler:v12];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke;
    block[3] = &unk_1E68701A8;
    id v19 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v11 = v19;
    goto LABEL_5;
  }
LABEL_6:
}

void __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_3;
  v5[3] = &unk_1E68701F8;
  id v6 = *(id *)(a1 + 48);
  [a2 endSessionAndRenameFileTo:v3 withJSONMetadata:v4 completion:v5];
}

void __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_4;
    block[3] = &unk_1E68701D0;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_6;
    block[3] = &unk_1E68701D0;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)endSessionWithCompletion:(id)a3
{
}

- (void)resetWithCompletion:(id)a3
{
}

- (void)reset:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_isEnabled)
  {
    client = self->_client;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __27__SLGLog_reset_completion___block_invoke_2;
    v12[3] = &unk_1E6870270;
    v13[1] = (id)a3;
    char v9 = v13;
    v13[0] = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__SLGLog_reset_completion___block_invoke_5;
    v10[3] = &unk_1E68701F8;
    id v11 = v13[0];
    [(SLGLogClientProtocol *)client queryServer:v12 errorHandler:v10];

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__SLGLog_reset_completion___block_invoke;
    block[3] = &unk_1E68701A8;
    char v9 = &v15;
    id v15 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_5;
  }
LABEL_6:
}

void __27__SLGLog_reset_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __27__SLGLog_reset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__SLGLog_reset_completion___block_invoke_3;
  v4[3] = &unk_1E68701F8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  [a2 reset:v3 completion:v4];
}

void __27__SLGLog_reset_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__SLGLog_reset_completion___block_invoke_4;
    block[3] = &unk_1E68701D0;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __27__SLGLog_reset_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __27__SLGLog_reset_completion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__SLGLog_reset_completion___block_invoke_6;
    block[3] = &unk_1E68701D0;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __27__SLGLog_reset_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)log:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_queue_t v14 = v13;
  if (self->_isEnabled)
  {
    whitelist = self->_whitelist;
    if (!whitelist || ([(SLGDomainWhitelisting *)whitelist isDomainWhitelisted:v11] & 1) != 0)
    {
      id v30 = 0;
      id v16 = [(SLGLog *)self _serializeObjectAsLogEntry:v10 domain:v11 tags:v12 error:&v30];
      id v17 = v30;
      if (v17)
      {
        if (!v14)
        {
LABEL_13:

          goto LABEL_14;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_3;
        block[3] = &unk_1E6870298;
        v18 = &v29;
        id v29 = v14;
        id v19 = &v28;
        id v28 = v17;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else
      {
        client = self->_client;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_4;
        v23[3] = &unk_1E6870248;
        v18 = &v24;
        id v24 = v16;
        id v19 = &v25;
        id v25 = v11;
        id v26 = v14;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_7;
        v21[3] = &unk_1E68701F8;
        id v22 = v26;
        [(SLGLogClientProtocol *)client queryServer:v23 errorHandler:v21];
      }
      goto LABEL_13;
    }
    if (v14)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_2;
      v31[3] = &unk_1E6870298;
      id v33 = v14;
      id v32 = v11;
      dispatch_async(MEMORY[0x1E4F14428], v31);

      id v17 = v33;
      goto LABEL_14;
    }
  }
  else if (v13)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __37__SLGLog_log_domain_tags_completion___block_invoke;
    v34[3] = &unk_1E68701A8;
    id v35 = v13;
    dispatch_async(MEMORY[0x1E4F14428], v34);
    id v17 = v35;
LABEL_14:
  }
}

void __37__SLGLog_log_domain_tags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __37__SLGLog_log_domain_tags_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [NSString stringWithFormat:@"Domain %@ is not whitelisted", *(void *)(a1 + 32)];
  id v2 = SLGCreateError(10, v3);
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v2);
}

uint64_t __37__SLGLog_log_domain_tags_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __37__SLGLog_log_domain_tags_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_5;
  v5[3] = &unk_1E68701F8;
  id v6 = *(id *)(a1 + 48);
  [a2 logJSONData:v3 domain:v4 completion:v5];
}

void __37__SLGLog_log_domain_tags_completion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_6;
    block[3] = &unk_1E68701D0;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __37__SLGLog_log_domain_tags_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __37__SLGLog_log_domain_tags_completion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_8;
    block[3] = &unk_1E68701D0;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __37__SLGLog_log_domain_tags_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)log:(id)a3 completion:(id)a4
{
}

- (void)log:(id)a3 domain:(id)a4 completion:(id)a5
{
}

- (void)log:(id)a3 tags:(id)a4 completion:(id)a5
{
}

- (void)log:(id)a3 tags:(id)a4
{
}

- (void)log:(id)a3 domain:(id)a4 tags:(id)a5
{
}

- (void)log:(id)a3
{
}

- (void)log:(id)a3 domain:(id)a4
{
}

- (void)logBlock:(id)a3
{
}

- (void)logBlock:(id)a3 domain:(id)a4
{
}

- (void)logBlock:(id)a3 tags:(id)a4
{
}

- (void)logBlock:(id)a3 tags:(id)a4 completion:(id)a5
{
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5
{
}

- (void)logBlock:(id)a3 completion:(id)a4
{
}

- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5
{
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  id v10 = (void (**)(void))a3;
  id v11 = a4;
  id v12 = (void (**)(void))a5;
  id v13 = a6;
  dispatch_queue_t v14 = v13;
  if (!self->_isEnabled)
  {
    if (!v13) {
      goto LABEL_13;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__SLGLog_logBlock_domain_tags_completion___block_invoke;
    block[3] = &unk_1E68701A8;
    id v23 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v17 = v23;
LABEL_10:

    goto LABEL_13;
  }
  whitelist = self->_whitelist;
  if (whitelist && ([(SLGDomainWhitelisting *)whitelist isDomainWhitelisted:v11] & 1) == 0)
  {
    if (!v14) {
      goto LABEL_13;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__SLGLog_logBlock_domain_tags_completion___block_invoke_2;
    v19[3] = &unk_1E6870298;
    id v21 = v14;
    id v20 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v19);

    id v17 = v21;
    goto LABEL_10;
  }
  if (v12)
  {
    id v16 = v12[2](v12);
  }
  else
  {
    id v16 = 0;
  }
  v18 = v10[2](v10);
  [(SLGLog *)self log:v18 domain:v11 tags:v16 completion:v14];

LABEL_13:
}

void __42__SLGLog_logBlock_domain_tags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __42__SLGLog_logBlock_domain_tags_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [NSString stringWithFormat:@"Domain %@ is not whitelisted", *(void *)(a1 + 32)];
  id v2 = SLGCreateError(10, v3);
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v2);
}

- (void)beginSession
{
}

- (void)endSession
{
}

- (void)reset
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerLockQueue = self->_observerLockQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__SLGLog_addObserver___block_invoke;
  v7[3] = &unk_1E6870110;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerLockQueue, v7);
}

uint64_t __22__SLGLog_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerLockQueue = self->_observerLockQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__SLGLog_removeObserver___block_invoke;
  v7[3] = &unk_1E6870110;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerLockQueue, v7);
}

uint64_t __25__SLGLog_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)allowUnspecifiedDomains
{
  return [(SLGDomainWhitelisting *)self->_whitelist allowUnspecifiedDomains];
}

- (void)setAllowUnspecifiedDomains:(BOOL)a3
{
}

- (NSSet)whitelistedDomains
{
  return (NSSet *)[(SLGDomainWhitelisting *)self->_whitelist whitelist];
}

- (void)addDomainToWhitelist:(id)a3
{
}

- (void)removeDomainFromWhitelist:(id)a3
{
}

- (void)client:(id)a3 didReceiveInitialLogMessageFromDomain:(id)a4
{
  id v5 = a4;
  observerLockQueue = self->_observerLockQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke;
  v8[3] = &unk_1E6870110;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(observerLockQueue, v8);
}

void __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke_2;
  block[3] = &unk_1E68702E8;
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v5 = v2;
  dispatch_async(v4, block);
}

void __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke_2(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke_3;
  v3[3] = &unk_1E68702C0;
  uint64_t v1 = (void *)a1[4];
  id v2 = (void *)a1[6];
  v3[4] = a1[5];
  id v4 = v2;
  [v1 enumerateObjectsUsingBlock:v3];
}

uint64_t __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 log:*(void *)(a1 + 32) didReceiveInitialLogMessageFromDomain:*(void *)(a1 + 40)];
}

- (void)clientDidReceiveServerReset:(id)a3
{
  observerLockQueue = self->_observerLockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SLGLog_clientDidReceiveServerReset___block_invoke;
  block[3] = &unk_1E6870138;
  void block[4] = self;
  dispatch_async(observerLockQueue, block);
}

void __38__SLGLog_clientDidReceiveServerReset___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SLGLog_clientDidReceiveServerReset___block_invoke_2;
  v6[3] = &unk_1E6870110;
  id v7 = v2;
  uint64_t v8 = v3;
  id v5 = v2;
  dispatch_async(v4, v6);
}

uint64_t __38__SLGLog_clientDidReceiveServerReset___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__SLGLog_clientDidReceiveServerReset___block_invoke_3;
  v3[3] = &unk_1E6870310;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

uint64_t __38__SLGLog_clientDidReceiveServerReset___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 logDidReceiveResetFromServer:*(void *)(a1 + 32)];
}

- (void)_fetchProcessInfo
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = getpid();
  id v4 = [NSNumber numberWithInt:v3];
  pid = self->_pid;
  self->_pid = v4;

  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  memset(v8, 0, sizeof(v8));
  proc_pidinfo(v3, 3, 0, v8, 136);
  id v6 = [NSString stringWithCString:v9 encoding:4];
  processName = self->_processName;
  self->_processName = v6;
}

- (void)_setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
  id v5 = a3;
  [(SLGLogClientProtocol *)self->_client setDelegate:self];
}

- (id)_serializeObjectAsLogEntry:(id)a3 domain:(id)a4 tags:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(SLGLog *)self _wrapObjectWithEntryMetadata:v10 domain:v11 tags:v12];
  id v19 = 0;
  dispatch_queue_t v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v19];
  id v15 = v19;
  if (v15)
  {
    id v16 = slg_general_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SLGLog _serializeObjectAsLogEntry:domain:tags:error:]((uint64_t)v10, v16);
    }

    if (a6)
    {
      SLGCreateError(3, @"Error serializing object to JSON");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v17 = v14;

  return v17;
}

- (id)_wrapObjectWithEntryMetadata:(id)a3 domain:(id)a4 tags:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = mach_absolute_time();
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  dispatch_queue_t v14 = [NSNumber numberWithUnsignedLongLong:v11];
  [v13 setObject:v14 forKeyedSubscript:@"timestamp"];

  id v15 = NSNumber;
  [v12 timeIntervalSince1970];
  id v16 = objc_msgSend(v15, "numberWithDouble:");
  [v13 setObject:v16 forKeyedSubscript:@"date"];

  [v13 setObject:self->_pid forKeyedSubscript:@"pid"];
  [v13 setObject:self->_processName forKeyedSubscript:@"processName"];
  id v17 = [MEMORY[0x1E4F29128] UUID];
  v18 = [v17 UUIDString];
  [v13 setObject:v18 forKeyedSubscript:@"uuid"];

  [v13 setObject:v10 forKeyedSubscript:@"data"];
  if (v8) {
    [v13 setObject:v8 forKeyedSubscript:@"domain"];
  }
  if (v9 && [v9 count]) {
    [v13 setObject:v9 forKeyedSubscript:@"tags"];
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerCalloutQueue, 0);
  objc_storeStrong((id *)&self->_observerLockQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)_serializeObjectAsLogEntry:(uint64_t)a1 domain:(NSObject *)a2 tags:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFDD9000, a2, OS_LOG_TYPE_ERROR, "Error serializing object to JSON: %@", (uint8_t *)&v2, 0xCu);
}

@end