@interface PFPosterExtensionInstance
+ (id)extensionInstanceForIdentity:(id)a3 instanceIdentifier:(id)a4;
+ (id)extensionInstanceForPath:(id)a3 instanceIdentifier:(id)a4;
- (NSString)description;
- (NSUUID)instanceIdentifier;
- (PFPosterExtension)extension;
- (PFPosterExtensionInstance)initWithExtension:(id)a3;
- (PFPosterExtensionInstance)initWithExtension:(id)a3 instanceIdentifier:(id)a4;
- (RBSProcessIdentity)processIdentity;
- (_EXHostConfiguration)hostConfiguration;
- (id)bootupExtensionInstanceWithError:(id *)a3;
- (void)_didAcquireExtensionProcess:(id)a3 error:(id)a4;
- (void)_extensionProcessDidInterrupt;
- (void)_fireObserversRespondingToSelector:(SEL)a3 block:(id)a4;
- (void)addInstanceObserver:(id)a3;
- (void)bootupExtensionInstance:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeInstanceObserver:(id)a3;
@end

@implementation PFPosterExtensionInstance

+ (id)extensionInstanceForIdentity:(id)a3 instanceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [PFPosterExtensionInstance alloc];
  v8 = +[PFPosterExtension extensionWithIdentity:v6];

  v9 = [(PFPosterExtensionInstance *)v7 initWithExtension:v8 instanceIdentifier:v5];
  return v9;
}

+ (id)extensionInstanceForPath:(id)a3 instanceIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F04DF0];
  id v8 = objc_alloc(MEMORY[0x263F04DE8]);
  v9 = (void *)MEMORY[0x263F08A98];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__PFPosterExtensionInstance_extensionInstanceForPath_instanceIdentifier___block_invoke;
  v17[3] = &unk_26546EE70;
  id v10 = v5;
  id v18 = v10;
  v11 = [v9 predicateWithBlock:v17];
  v12 = (void *)[v8 initWithExtensionPointIdentifier:@"com.apple.posterkit.provider" predicate:v11];
  v13 = [v7 executeQuery:v12];

  if ([v13 count])
  {
    v14 = [v13 firstObject];
    v15 = +[PFPosterExtensionInstance extensionInstanceForIdentity:v14 instanceIdentifier:v6];
  }
  else
  {
    v14 = PFLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PFPosterExtensionInstance extensionInstanceForPath:instanceIdentifier:](v10, v14);
    }
    v15 = 0;
  }

  return v15;
}

uint64_t __73__PFPosterExtensionInstance_extensionInstanceForPath_instanceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleIdentifier];
  v4 = [*(id *)(a1 + 32) serverIdentity];
  id v5 = [v4 provider];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (PFPosterExtensionInstance)initWithExtension:(id)a3
{
  v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "pf_defaultInstanceIdentifier");
  v7 = [(PFPosterExtensionInstance *)self initWithExtension:v5 instanceIdentifier:v6];

  return v7;
}

- (PFPosterExtensionInstance)initWithExtension:(id)a3 instanceIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = v9;
    if (!v9)
    {
      id v10 = objc_msgSend(MEMORY[0x263F08C38], "pf_defaultInstanceIdentifier");
    }
    v32.receiver = self;
    v32.super_class = (Class)PFPosterExtensionInstance;
    v11 = [(PFPosterExtensionInstance *)&v32 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_extension, a3);
      uint64_t v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      observers = v12->_observers;
      v12->_observers = (NSHashTable *)v13;

      uint64_t v15 = [objc_alloc(MEMORY[0x263F29BD0]) initWithFlag:0];
      invalidationFlag = v12->_invalidationFlag;
      v12->_invalidationFlag = (BSAtomicFlag *)v15;

      uint64_t v17 = [v10 copy];
      instanceIdentifier = v12->_instanceIdentifier;
      v12->_instanceIdentifier = (NSUUID *)v17;

      v19 = (void *)[objc_alloc(MEMORY[0x263F04DC8]) initWithIdentifier:v10];
      id v20 = objc_alloc(MEMORY[0x263F04DD8]);
      v21 = [v8 identity];
      uint64_t v22 = [v20 initWithExtensionIdentity:v21 instanceIdentifier:v19];
      hostConfiguration = v12->_hostConfiguration;
      v12->_hostConfiguration = (_EXHostConfiguration *)v22;

      objc_initWeak(&location, v12);
      v24 = v12->_hostConfiguration;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __66__PFPosterExtensionInstance_initWithExtension_instanceIdentifier___block_invoke;
      v29[3] = &unk_26546EE98;
      objc_copyWeak(&v30, &location);
      [(_EXHostConfiguration *)v24 setInterruptionHandler:v29];
      uint64_t v25 = [(_EXHostConfiguration *)v12->_hostConfiguration rbsProcessIdentity];
      processIdentity = v12->_processIdentity;
      v12->_processIdentity = (RBSProcessIdentity *)v25;

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    return v12;
  }
  else
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extension"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterExtensionInstance initWithExtension:instanceIdentifier:](a2, (uint64_t)self, (uint64_t)v28);
    }
    [v28 UTF8String];
    result = (PFPosterExtensionInstance *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __66__PFPosterExtensionInstance_initWithExtension_instanceIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _extensionProcessDidInterrupt];
}

- (void)dealloc
{
  [(PFPosterExtensionInstance *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PFPosterExtensionInstance;
  [(PFPosterExtensionInstance *)&v3 dealloc];
}

- (void)bootupExtensionInstance:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    objc_initWeak(&location, self);
    uint64_t v6 = self;
    objc_sync_enter(v6);
    if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
    {
      if (v4)
      {
        v7 = objc_msgSend(MEMORY[0x263F087E8], "pf_errorWithCode:", 2);
        v4[2](v4, 0, v7);
      }
      goto LABEL_17;
    }
    extensionProcess = v6->_extensionProcess;
    if (extensionProcess && [(_EXExtensionProcess *)extensionProcess isValid])
    {
      ((void (**)(id, _EXExtensionProcess *, void *))v4)[2](v4, v6->_extensionProcess, 0);
LABEL_17:
      objc_sync_exit(v6);

      objc_destroyWeak(&location);
      goto LABEL_18;
    }
    bootExtensionInstanceCompletionBlocks = v6->_bootExtensionInstanceCompletionBlocks;
    if (bootExtensionInstanceCompletionBlocks)
    {
      if (!v4) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v10 = objc_opt_new();
      v11 = v6->_bootExtensionInstanceCompletionBlocks;
      v6->_bootExtensionInstanceCompletionBlocks = (NSMutableArray *)v10;

      if (!v4)
      {
LABEL_12:
        if (bootExtensionInstanceCompletionBlocks) {
          goto LABEL_17;
        }
LABEL_16:
        v14 = v6->_extensionProcess;
        v6->_extensionProcess = 0;

        uint64_t v15 = (void *)MEMORY[0x263F04DD0];
        hostConfiguration = v6->_hostConfiguration;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __53__PFPosterExtensionInstance_bootupExtensionInstance___block_invoke;
        v17[3] = &unk_26546EEC0;
        objc_copyWeak(&v18, &location);
        [v15 extensionProcessWithConfiguration:hostConfiguration completionHandler:v17];
        objc_destroyWeak(&v18);
        goto LABEL_17;
      }
    }
    v12 = v6->_bootExtensionInstanceCompletionBlocks;
    uint64_t v13 = (void *)[v4 copy];
    [(NSMutableArray *)v12 addObject:v13];

    if (bootExtensionInstanceCompletionBlocks) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "pf_errorWithCode:", 2);
    v4[2](v4, 0, v5);
  }
LABEL_18:
}

void __53__PFPosterExtensionInstance_bootupExtensionInstance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _didAcquireExtensionProcess:v6 error:v5];
}

- (id)bootupExtensionInstanceWithError:(id *)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v6 = self;
    objc_sync_enter(v6);
    extensionProcess = v6->_extensionProcess;
    if (!extensionProcess || ![(_EXExtensionProcess *)extensionProcess isValid])
    {
      if (v6->_bootExtensionInstanceCompletionBlocks)
      {
        if (a3)
        {
          id v8 = (void *)MEMORY[0x263F087E8];
          uint64_t v13 = *MEMORY[0x263F08338];
          v14[0] = @"Extension process was already bootstrapped; need to wait until that finishes";
          id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
          objc_msgSend(v8, "pf_errorWithCode:userInfo:", 0, v9);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v5 = 0;
        goto LABEL_13;
      }
      uint64_t v10 = [MEMORY[0x263F04DD0] extensionProcessWithConfiguration:v6->_hostConfiguration error:a3];
      v11 = v6->_extensionProcess;
      v6->_extensionProcess = (_EXExtensionProcess *)v10;
    }
    id v5 = v6->_extensionProcess;
LABEL_13:
    objc_sync_exit(v6);

    goto LABEL_14;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "pf_errorWithCode:", 2);
    id v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
LABEL_14:
  return v5;
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(PFPosterExtension *)self->_extension posterExtensionBundleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"extension"];

  id v6 = [v3 build];

  return (NSString *)v6;
}

- (void)_didAcquireExtensionProcess:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    [v7 invalidate];
  }
  else
  {
    id v9 = self;
    objc_sync_enter(v9);
    if (v7) {
      objc_storeStrong((id *)&v9->_extensionProcess, a3);
    }
    uint64_t v10 = (void *)[(NSMutableArray *)v9->_bootExtensionInstanceCompletionBlocks copy];
    [(NSMutableArray *)v9->_bootExtensionInstanceCompletionBlocks removeAllObjects];
    bootExtensionInstanceCompletionBlocks = v9->_bootExtensionInstanceCompletionBlocks;
    v9->_bootExtensionInstanceCompletionBlocks = 0;

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__PFPosterExtensionInstance__didAcquireExtensionProcess_error___block_invoke;
    v12[3] = &unk_26546EEE8;
    id v13 = v7;
    id v14 = v8;
    [v10 enumerateObjectsUsingBlock:v12];

    objc_sync_exit(v9);
  }
}

void __63__PFPosterExtensionInstance__didAcquireExtensionProcess_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)MEMORY[0x25A2F49C0](a2);
  (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_extensionProcessDidInterrupt
{
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    id v3 = self;
    objc_sync_enter(v3);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__PFPosterExtensionInstance__extensionProcessDidInterrupt__block_invoke;
    v5[3] = &unk_26546EF10;
    v5[4] = v3;
    [(PFPosterExtensionInstance *)v3 _fireObserversRespondingToSelector:sel_extensionInstanceProcessDidInterrupt_ block:v5];
    extensionProcess = v3->_extensionProcess;
    v3->_extensionProcess = 0;

    objc_sync_exit(v3);
  }
}

uint64_t __58__PFPosterExtensionInstance__extensionProcessDidInterrupt__block_invoke(uint64_t a1, void *a2)
{
  return [a2 extensionInstanceProcessDidInterrupt:*(void *)(a1 + 32)];
}

- (void)addInstanceObserver:(id)a3
{
  id v5 = a3;
  if (v5 && ([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    [(NSHashTable *)v4->_observers addObject:v5];
    objc_sync_exit(v4);
  }
}

- (void)removeInstanceObserver:(id)a3
{
  id v5 = a3;
  if (v5 && ([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    [(NSHashTable *)v4->_observers removeObject:v5];
    objc_sync_exit(v4);
  }
}

- (void)_fireObserversRespondingToSelector:(SEL)a3 block:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void))a4;
  id v6 = self;
  objc_sync_enter(v6);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6->_observers;
  id v8 = 0;
  uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          if (!v8) {
            id v8 = objc_opt_new();
          }
          [v8 addObject:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v6);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        v5[2](v5, *(void *)(*((void *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__PFPosterExtensionInstance_invalidate__block_invoke;
    v8[3] = &unk_26546EF10;
    v8[4] = self;
    [(PFPosterExtensionInstance *)self _fireObserversRespondingToSelector:sel_extensionInstanceWillInvalidate_ block:v8];
    id v3 = self;
    objc_sync_enter(v3);
    v4 = (void *)[(NSMutableArray *)v3->_bootExtensionInstanceCompletionBlocks copy];
    [(NSMutableArray *)v3->_bootExtensionInstanceCompletionBlocks removeAllObjects];
    objc_sync_exit(v3);

    [v4 enumerateObjectsUsingBlock:&__block_literal_global_8];
    [(_EXExtensionProcess *)v3->_extensionProcess invalidate];
    extensionProcess = v3->_extensionProcess;
    v3->_extensionProcess = 0;

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__PFPosterExtensionInstance_invalidate__block_invoke_3;
    v7[3] = &unk_26546EF10;
    v7[4] = v3;
    [(PFPosterExtensionInstance *)v3 _fireObserversRespondingToSelector:sel_extensionInstanceDidInvalidate_ block:v7];
    id v6 = v3;
    objc_sync_enter(v6);
    [v6[5] removeAllObjects];
    objc_sync_exit(v6);
  }
}

uint64_t __39__PFPosterExtensionInstance_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 extensionInstanceWillInvalidate:*(void *)(a1 + 32)];
}

void __39__PFPosterExtensionInstance_invalidate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = (void (**)(id, void, void *))MEMORY[0x25A2F49C0](a2);
  v2 = objc_msgSend(MEMORY[0x263F087E8], "pf_errorWithCode:", 2);
  v3[2](v3, 0, v2);
}

uint64_t __39__PFPosterExtensionInstance_invalidate__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 extensionInstanceDidInvalidate:*(void *)(a1 + 32)];
}

- (PFPosterExtension)extension
{
  return self->_extension;
}

- (_EXHostConfiguration)hostConfiguration
{
  return self->_hostConfiguration;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (NSUUID)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bootExtensionInstanceCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_acquireAssertions, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

+ (void)extensionInstanceForPath:(void *)a1 instanceIdentifier:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = [a1 serverIdentity];
  v4 = [v3 provider];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_25A085000, a2, OS_LOG_TYPE_ERROR, "No poster providers were found for \"%{public}@\"", (uint8_t *)&v5, 0xCu);
}

- (void)initWithExtension:(uint64_t)a3 instanceIdentifier:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  uint64_t v12 = @"PFPosterExtension.m";
  __int16 v13 = 1024;
  int v14 = 182;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

@end