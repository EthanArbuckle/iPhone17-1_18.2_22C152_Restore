@interface UISApplicationSupportService
+ (id)sharedInstance;
- (BOOL)hasFinishedLaunching;
- (UISApplicationInitializationContext)defaultContext;
- (UISApplicationSupportService)init;
- (UISApplicationSupportService)initWithCalloutQueue:(id)a3;
- (id)_delegate;
- (id)_initWithDelegate:(id)a3 targetQueue:(id)a4;
- (void)_pendRequestUntilLaunch:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)dealloc;
- (void)destroyScenesPersistentIdentifiers:(id)a3 animationType:(id)a4 destroySessions:(id)a5 completion:(id)a6;
- (void)initializeClientWithParameters:(id)a3 completion:(id)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)requestPasscodeUnlockUIWithCompletion:(id)a3;
- (void)setDefaultContext:(id)a3;
- (void)start;
@end

@implementation UISApplicationSupportService

void __74__UISApplicationSupportService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F628B0];
  id v5 = a2;
  v4 = [v3 userInteractive];
  [v5 setServiceQuality:v4];

  [v5 setInterface:*(void *)(a1 + 32)];
  [v5 setInterfaceTarget:*(void *)(a1 + 40)];
  [v5 setTargetDispatchingQueue:*(void *)(*(void *)(a1 + 40) + 24)];
  [v5 setInterruptionHandler:&__block_literal_global_93];
  [v5 setInvalidationHandler:&__block_literal_global_95];
}

- (void)initializeClientWithParameters:(id)a3 completion:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_finishedLaunching = self->_lock_finishedLaunching;
  v9 = self->_lock_delegate;
  if (!v9)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_5;
  }
  char lock_delegateFlags = (char)self->_lock_delegateFlags;
  if ((lock_delegateFlags & 0x14) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_8;
  }
  os_unfair_lock_unlock(&self->_lock);
  if ((lock_delegateFlags & 0x28) == 0)
  {
LABEL_5:
    if (v7)
    {
      v11 = NSString;
      v12 = [MEMORY[0x1E4F28F80] processInfo];
      v13 = [v12 processName];
      v14 = [v11 stringWithFormat:@"%@ does not implement this service. Returning default context.", v13];

      v15 = [(UISApplicationSupportService *)self defaultContext];
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v71 = *MEMORY[0x1E4F28588];
      v72 = v14;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      v18 = [v16 errorWithDomain:@"UISApplicationSupportService" code:1 userInfo:v17];
      v7[2](v7, v15, v18);
    }
    goto LABEL_48;
  }
LABEL_8:
  BOOL v54 = lock_finishedLaunching;
  v59 = v9;
  v19 = (void *)MEMORY[0x1E4F627F8];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke;
  v69[3] = &unk_1E57357A8;
  v69[4] = self;
  v70 = v7;
  v20 = [v19 sentinelWithCompletion:v69];
  v21 = [MEMORY[0x1E4F62880] currentContext];
  v22 = [v21 remoteProcess];

  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke_112;
  v60[3] = &unk_1E57357F8;
  BOOL v66 = (lock_delegateFlags & 8) != 0;
  v23 = v9;
  v61 = v23;
  v62 = self;
  id v24 = v22;
  id v63 = v24;
  id v64 = v6;
  id v25 = v20;
  id v65 = v25;
  BOOL v67 = (lock_delegateFlags & 4) != 0;
  BOOL v68 = (lock_delegateFlags & 0x10) != 0;
  v26 = v24;
  v27 = (void (**)(void))MEMORY[0x192FE1660](v60);
  if ((lock_delegateFlags & 2) != 0
    && [(UISApplicationSupportServiceDelegate *)v23 service:self overrideClientInitialization:v24])
  {
    v27[2](v27);
  }
  else
  {
    v56 = v25;
    v28 = (void *)MEMORY[0x1E4F963E8];
    v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v24, "pid"));
    v30 = [v28 handleForIdentifier:v29 error:0];

    v31 = [v30 identity];
    v32 = [v31 hostIdentifier];

    if (v32)
    {
      while (1)
      {
        uint64_t v33 = [MEMORY[0x1E4F963E8] handleForIdentifier:v32 error:0];
        if (!v33) {
          break;
        }
        v34 = (void *)v33;

        v35 = [v34 identity];
        v32 = [v35 hostIdentifier];

        v30 = v34;
        if (!v32) {
          goto LABEL_17;
        }
      }
    }
    v34 = v30;
LABEL_17:
    v55 = v27;
    v57 = v7;
    id v58 = v6;
    v36 = [v34 identity];
    int v37 = [v34 pid];
    pid_t v38 = getpid();
    if ([v36 isApplication]) {
      char v39 = 1;
    }
    else {
      char v39 = [v36 isEmbeddedApplication];
    }
    if (v37 == v38 && (v39 & 1) != 0 || ![v36 isXPCService])
    {
      int v47 = 0;
    }
    else
    {
      v52 = v26;
      v40 = [v34 bundle];
      v41 = [v40 path];

      if (v41)
      {
        v51 = v36;
        uint64_t v53 = *MEMORY[0x1E4F44390];
        uint64_t v42 = *MEMORY[0x1E4F44320];
        while (1)
        {
          if ([v41 isEqualToString:@"/"])
          {
LABEL_29:
            int v47 = 0;
            goto LABEL_33;
          }
          v43 = [v41 pathExtension];
          if (v43)
          {
            v44 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v43 conformingToType:v53];
            int v45 = [v44 isEqual:v42];

            if (v45) {
              break;
            }
          }
          uint64_t v46 = [v41 stringByDeletingLastPathComponent];

          v41 = (void *)v46;
          if (!v46) {
            goto LABEL_29;
          }
        }

        int v47 = 1;
LABEL_33:
        v36 = v51;
      }
      else
      {
        int v47 = 0;
      }

      v26 = v52;
    }
    if (v37 == v38) {
      char v48 = 1;
    }
    else {
      char v48 = v39;
    }
    if ((v48 & 1) != 0 || v47)
    {
      v7 = v57;
      id v6 = v58;
      v27 = v55;
      if (v54)
      {
        v55[2](v55);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          if (v34) {
            v50 = v34;
          }
          else {
            v50 = v26;
          }
          *(_DWORD *)buf = 138543362;
          v74 = v50;
          _os_log_error_impl(&dword_191ABF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[UISApplicationSupportService] Client connected before we finished launching: %{public}@)", buf, 0xCu);
        }
        [(UISApplicationSupportService *)self _pendRequestUntilLaunch:v55];
      }
      id v25 = v56;
    }
    else
    {
      v49 = [(UISApplicationSupportService *)self defaultContext];
      id v25 = v56;
      [v56 signalWithContext:v49];

      v7 = v57;
      id v6 = v58;
      v27 = v55;
    }

    v9 = v59;
  }

LABEL_48:
}

void __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke_112(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = [*(id *)(a1 + 32) service:*(void *)(a1 + 40) initializeClient:*(void *)(a1 + 48) withParameters:*(void *)(a1 + 56)];
LABEL_5:
    id v3 = (id)v2;
    id v9 = (id)v2;
    v4 = *(void **)(a1 + 64);
    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 73))
  {
    uint64_t v2 = [*(id *)(a1 + 32) service:*(void *)(a1 + 40) initializeClient:*(void *)(a1 + 48)];
    goto LABEL_5;
  }
  id v5 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 74))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke_2;
    v11[3] = &unk_1E57357D0;
    id v12 = *(id *)(a1 + 64);
    [v5 service:v6 initializeClient:v7 withCompletion:v11];

    return;
  }
  v8 = [*(id *)(a1 + 48) auditToken];
  id v9 = [v5 applicationInitializationContextForClient:v8];

  v4 = *(void **)(a1 + 64);
  id v3 = v9;
LABEL_6:
  objc_msgSend(v4, "signalWithContext:", v3, v9);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F62858] interfaceWithIdentifier:0x1EE28E690];
  id v12 = [MEMORY[0x1E4F62868] protocolForProtocol:&unk_1EE29C230];
  [v11 setServer:v12];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__UISApplicationSupportService_listener_didReceiveConnection_withContext___block_invoke;
  v19[3] = &unk_1E5735080;
  id v13 = v11;
  id v20 = v13;
  v21 = self;
  [v9 configureConnection:v19];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v14 = (void *)qword_1EB288938;
  uint64_t v26 = qword_1EB288938;
  if (!qword_1EB288938)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __getFBProcessManagerClass_block_invoke;
    v22[3] = &unk_1E5735260;
    v22[4] = &v23;
    __getFBProcessManagerClass_block_invoke((uint64_t)v22);
    v14 = (void *)v24[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v23, 8);
  v16 = [v15 sharedInstance];
  v17 = [v9 remoteProcess];
  id v18 = (id)[v16 registerProcessForHandle:v17];

  [v9 activate];
}

uint64_t __74__UISApplicationSupportService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) signalWithContext:a2];
}

void __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 context];
  if (NSClassFromString(&cfstr_Uisapplication_25.isa))
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (!v4 || v6)
  {

    if (v7) {
      goto LABEL_13;
    }
  }
  else
  {
    id v8 = BSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "[signal context]";
      __int16 v23 = 2082;
      id v24 = "UISApplicationInitializationContext";
      _os_log_impl(&dword_191ABF000, v8, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\"", buf, 0x16u);
    }
  }
  uint64_t v7 = [*(id *)(a1 + 32) defaultContext];
LABEL_13:
  if ([v3 isFailed])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v17 = [MEMORY[0x1E4F28F80] processInfo];
      id v18 = [v17 processName];
      *(_DWORD *)buf = 138543362;
      v22 = v18;
      _os_log_fault_impl(&dword_191ABF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%{public}@ dropped the initialize-client request on the floor.", buf, 0xCu);
    }
    id v9 = NSString;
    id v10 = [MEMORY[0x1E4F28F80] processInfo];
    v11 = [v10 processName];
    id v12 = [v9 stringWithFormat:@"%@ dropped the initialize-client request on the floor.", v11];

    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28588];
    id v20 = v12;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v15 = [v13 errorWithDomain:@"UISApplicationSupportService" code:1 userInfo:v14];
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v7, v15);
  }
}

+ (id)sharedInstance
{
  if (qword_1EB288930 != -1) {
    dispatch_once(&qword_1EB288930, &__block_literal_global_11);
  }
  uint64_t v2 = (void *)_MergedGlobals_17;
  return v2;
}

uint64_t __46__UISApplicationSupportService_sharedInstance__block_invoke()
{
  _MergedGlobals_17 = [[UISApplicationSupportService alloc] _initWithDelegate:0 targetQueue:0];
  return MEMORY[0x1F41817F8]();
}

- (UISApplicationSupportService)init
{
  id v3 = +[UISApplicationSupportService sharedInstance];
  [(UISApplicationSupportService *)v3 start];

  return v3;
}

- (UISApplicationSupportService)initWithCalloutQueue:(id)a3
{
  v4 = (FBSSerialQueue *)a3;
  id v5 = +[UISApplicationSupportService sharedInstance];
  targetQueue = v5->_targetQueue;
  v5->_targetQueue = v4;

  [(UISApplicationSupportService *)v5 start];
  return v5;
}

- (id)_initWithDelegate:(id)a3 targetQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)UISApplicationSupportService;
  id v9 = [(UISApplicationSupportService *)&v24 init];
  id v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_targetQueue, a4);
    uint64_t v11 = +[UISApplicationInitializationContext defaultContext];
    lock_defaultContext = v10->_lock_defaultContext;
    v10->_lock_defaultContext = (UISApplicationInitializationContext *)v11;

    id v13 = (void *)MEMORY[0x1E4F628A0];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __62__UISApplicationSupportService__initWithDelegate_targetQueue___block_invoke;
    v21 = &unk_1E57352C0;
    SEL v23 = a2;
    v14 = v10;
    v22 = v14;
    uint64_t v15 = [v13 listenerWithConfigurator:&v18];
    listener = v14->_listener;
    v14->_listener = (BSServiceConnectionListener *)v15;

    if (v7) {
      -[UISApplicationSupportService _setDelegate:](v14, "_setDelegate:", v7, v18, v19, v20, v21);
    }
  }
  return v10;
}

void __62__UISApplicationSupportService__initWithDelegate_targetQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F628B8];
  id v4 = a2;
  id v9 = [v3 bootstrapConfiguration];
  id v5 = [v9 domainsContainingServiceIdentifier:0x1EE28E690];
  if ([v5 count] != 1)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"UISApplicationSupportService.m", 92, @"must have one and only one domain specify %@ : domains=%@", 0x1EE28E690, v5 object file lineNumber description];
  }
  id v6 = [v5 anyObject];
  id v7 = [v6 identifier];
  [v4 setDomain:v7];

  [v4 setService:0x1EE28E690];
  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UISApplicationSupportService;
  [(UISApplicationSupportService *)&v3 dealloc];
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_started)
  {
    self->_lock_started = 1;
    if (!self->_targetQueue)
    {
      id v4 = [MEMORY[0x1E4F62820] serial];
      id v5 = [v4 serviceClass:33];
      id v6 = (void *)BSDispatchQueueCreate();

      id v7 = [MEMORY[0x1E4F62AC8] queueWithDispatchQueue:v6];
      targetQueue = self->_targetQueue;
      self->_targetQueue = v7;
    }
    [(BSServiceConnectionListener *)self->_listener activate];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__UISApplicationSupportService_start__block_invoke;
    block[3] = &unk_1E5734F98;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  os_unfair_lock_unlock(p_lock);
}

void __37__UISApplicationSupportService_start__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (v2)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__UISApplicationSupportService_start__block_invoke_2;
    v6[3] = &unk_1E5734F98;
    id v7 = v2;
    [v5 performAsync:v6];
  }
}

void __37__UISApplicationSupportService_start__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (UISApplicationInitializationContext)defaultContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_defaultContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDefaultContext:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    uint64_t v4 = (UISApplicationInitializationContext *)[v6 copy];
  }
  else
  {
    uint64_t v4 = +[UISApplicationInitializationContext defaultContext];
  }
  lock_defaultContext = self->_lock_defaultContext;
  self->_lock_defaultContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)hasFinishedLaunching
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_finishedLaunching;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setDelegate:(id)a3
{
  v14 = (UISApplicationSupportServiceDelegate *)a3;
  if (!v14)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UISApplicationSupportService.m", 186, @"Invalid parameter not satisfying: %@", @"delegate != nil" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_delegate != v14)
  {
    objc_storeStrong((id *)&self->_lock_delegate, a3);
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_char lock_delegateFlags = *(unsigned char *)&self->_lock_delegateFlags & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_char lock_delegateFlags = *(unsigned char *)&self->_lock_delegateFlags & 0xFB | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_char lock_delegateFlags = *(unsigned char *)&self->_lock_delegateFlags & 0xF7 | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 16;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_char lock_delegateFlags = *(unsigned char *)&self->_lock_delegateFlags & 0xEF | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 32;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_char lock_delegateFlags = *(unsigned char *)&self->_lock_delegateFlags & 0xDF | v10;
    if (objc_opt_respondsToSelector()) {
      char v11 = 64;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)&self->_char lock_delegateFlags = *(unsigned char *)&self->_lock_delegateFlags & 0xBF | v11;
    if (objc_opt_respondsToSelector()) {
      char v12 = 0x80;
    }
    else {
      char v12 = 0;
    }
    *(unsigned char *)&self->_char lock_delegateFlags = v12 & 0x80 | *(unsigned char *)&self->_lock_delegateFlags & 0x7F;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_pendRequestUntilLaunch:(id)a3
{
  char v10 = (void (**)(void))a3;
  [(FBSSerialQueue *)self->_targetQueue assertOnQueue];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_finishedLaunching)
  {
    os_unfair_lock_unlock(&self->_lock);
    v10[2]();
  }
  else
  {
    lock_launchPendedRequests = self->_lock_launchPendedRequests;
    if (!lock_launchPendedRequests)
    {
      char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      char v7 = self->_lock_launchPendedRequests;
      self->_lock_launchPendedRequests = v6;

      lock_launchPendedRequests = self->_lock_launchPendedRequests;
    }
    char v8 = (void *)[v10 copy];
    char v9 = (void *)MEMORY[0x192FE1660]();
    [(NSMutableArray *)lock_launchPendedRequests addObject:v9];

    os_unfair_lock_unlock(p_lock);
  }
}

uint64_t __74__UISApplicationSupportService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 activate];
}

- (void)requestPasscodeUnlockUIWithCompletion:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_finishedLaunching = self->_lock_finishedLaunching;
  char v7 = self->_lock_delegate;
  if (!v7)
  {
    os_unfair_lock_unlock(&self->_lock);
    if (!v4) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  char lock_delegateFlags = (char)self->_lock_delegateFlags;
  os_unfair_lock_unlock(p_lock);
  if (lock_finishedLaunching && (lock_delegateFlags & 0x40) != 0)
  {
    char v9 = (void *)MEMORY[0x1E4F627F8];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__UISApplicationSupportService_requestPasscodeUnlockUIWithCompletion___block_invoke;
    v25[3] = &unk_1E5735820;
    id v26 = v4;
    char v10 = [v9 sentinelWithCompletion:v25];
    char v11 = [MEMORY[0x1E4F62880] currentContext];
    char v12 = [v11 remoteProcess];
    id v13 = [v12 auditToken];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__UISApplicationSupportService_requestPasscodeUnlockUIWithCompletion___block_invoke_2;
    v23[3] = &unk_1E5735848;
    id v24 = v10;
    id v14 = v10;
    [(UISApplicationSupportServiceDelegate *)v7 requestPasscodeUnlockUIForClient:v13 withCompletion:v23];

    uint64_t v15 = v26;
LABEL_12:

    goto LABEL_13;
  }
  if (v4)
  {
    if ((lock_delegateFlags & 0x40) != 0)
    {
      uint64_t v19 = NSString;
      v17 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v18 = [v17 processName];
      [v19 stringWithFormat:@"%@ has not yet finished launching.", v18];
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v16 = NSString;
    v17 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v18 = [v17 processName];
    [v16 stringWithFormat:@"%@ does not implement this service.", v18];
    uint64_t v15 = LABEL_11:;

    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28588];
    v28[0] = v15;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v22 = [v20 errorWithDomain:@"UISApplicationSupportService" code:1 userInfo:v21];
    (*((void (**)(id, void, void *))v4 + 2))(v4, MEMORY[0x1E4F1CC28], v22);

    goto LABEL_12;
  }
LABEL_13:
}

void __70__UISApplicationSupportService_requestPasscodeUnlockUIWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 context];
  id v5 = (id)v3;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CC28];
  }
  (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v4, 0);
}

void __70__UISApplicationSupportService_requestPasscodeUnlockUIWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
  [v2 signalWithContext:v3];
}

- (void)destroyScenesPersistentIdentifiers:(id)a3 animationType:(id)a4 destroySessions:(id)a5 completion:(id)a6
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  if (![v10 count])
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28588];
    v42[0] = @"No persistent scene identifiers specified.";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    id v26 = [v27 errorWithDomain:@"UISApplicationSupportService" code:2 userInfo:v16];
    v13[2](v13, MEMORY[0x1E4F1CC28], v26);
    goto LABEL_13;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_finishedLaunching = self->_lock_finishedLaunching;
  uint64_t v16 = self->_lock_delegate;
  if (v16)
  {
    $6158441AD3FF881409B5EA1F780CD1B3 lock_delegateFlags = self->_lock_delegateFlags;
    os_unfair_lock_unlock(p_lock);
    if (lock_finishedLaunching && (*(_DWORD *)&lock_delegateFlags & 0x80000000) != 0)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F627F8];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __108__UISApplicationSupportService_destroyScenesPersistentIdentifiers_animationType_destroySessions_completion___block_invoke;
      v37[3] = &unk_1E5735820;
      pid_t v38 = v13;
      uint64_t v19 = [v18 sentinelWithCompletion:v37];
      id v20 = [MEMORY[0x1E4F62880] currentContext];
      v21 = [v20 remoteProcess];
      v22 = [v21 auditToken];

      uint64_t v23 = [v11 unsignedIntegerValue];
      uint64_t v24 = [v12 BOOLValue];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __108__UISApplicationSupportService_destroyScenesPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_140;
      v35[3] = &unk_1E5735870;
      id v36 = v19;
      id v25 = v19;
      [(UISApplicationSupportServiceDelegate *)v16 destroyScenesWithPersistentIdentifiers:v10 animationType:v23 destroySessions:v24 forClient:v22 completion:v35];

      id v26 = v38;
LABEL_13:

      goto LABEL_14;
    }
    if (v13)
    {
      if ((*(_DWORD *)&lock_delegateFlags & 0x80000000) != 0)
      {
        v34 = NSString;
        v29 = [MEMORY[0x1E4F28F80] processInfo];
        v30 = [v29 processName];
        [v34 stringWithFormat:@"%@ has not yet finished launching.", v30];
        goto LABEL_12;
      }
LABEL_11:
      v28 = NSString;
      v29 = [MEMORY[0x1E4F28F80] processInfo];
      v30 = [v29 processName];
      [v28 stringWithFormat:@"%@ does not implement this service.", v30];
      id v26 = LABEL_12:;

      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28588];
      v40 = v26;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v33 = [v31 errorWithDomain:@"UISApplicationSupportService" code:1 userInfo:v32];
      v13[2](v13, MEMORY[0x1E4F1CC28], v33);

      goto LABEL_13;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    if (v13) {
      goto LABEL_11;
    }
    uint64_t v16 = 0;
  }
LABEL_14:
}

void __108__UISApplicationSupportService_destroyScenesPersistentIdentifiers_animationType_destroySessions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 context];
  if (NSClassFromString(&cfstr_Nserror.isa))
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;
  char v7 = v6;
  if (v4 && !v6)
  {
    char v8 = BSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "[signal context]";
      __int16 v23 = 2082;
      uint64_t v24 = "NSError";
      _os_log_impl(&dword_191ABF000, v8, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\"", buf, 0x16u);
    }
  }
  int v9 = [v3 isFailed];

  if (v9)
  {
    id v10 = NSString;
    id v11 = [MEMORY[0x1E4F28F80] processInfo];
    id v12 = [v11 processName];
    id v13 = [v10 stringWithFormat:@"%@ dropped the request on the floor.", v12];

    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28588];
    id v20 = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v16 = [v14 errorWithDomain:@"UISApplicationSupportService" code:1 userInfo:v15];

    char v7 = (void *)v16;
  }
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithInt:v7 == 0];
  (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v7);
}

void __108__UISApplicationSupportService_destroyScenesPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_140(uint64_t a1, int a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {

    id v6 = 0;
  }
  else if (!v5)
  {
    char v7 = NSString;
    char v8 = [MEMORY[0x1E4F28F80] processInfo];
    int v9 = [v8 processName];
    id v10 = [v7 stringWithFormat:@"%@ rejected the request, but neglected to provide an error.", v9];

    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28588];
    v14[0] = v10;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v6 = [v11 errorWithDomain:@"UISApplicationSupportService" code:1 userInfo:v12];
  }
  [*(id *)(a1 + 32) signalWithContext:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_launchPendedRequests, 0);
  objc_storeStrong((id *)&self->_lock_defaultContext, 0);
  objc_storeStrong((id *)&self->_lock_delegate, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end