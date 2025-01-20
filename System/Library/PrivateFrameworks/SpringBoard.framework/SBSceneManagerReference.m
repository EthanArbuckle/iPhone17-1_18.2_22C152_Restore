@interface SBSceneManagerReference
- (BOOL)isDefunct;
- (BOOL)isRetaining;
- (FBSDisplayIdentity)displayIdentity;
- (NSString)debugDescription;
- (SBSceneManagerReference)initWithDisplayIdentity:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)delegate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)manager;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_autoreleaseManager:(id)a3;
- (void)_updateRetainWithBlock:(id)a3;
- (void)invalidate;
- (void)releaseForScene:(id)a3;
- (void)retainForScene:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayIdentity:(id)a3;
- (void)setDisplayIsConnected:(BOOL)a3;
- (void)setManager:(id)a3;
@end

@implementation SBSceneManagerReference

- (id)manager
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"-[SBSceneManagerReference manager]"];
    [v6 handleFailureInFunction:v7 file:@"SBSceneManagerReference.m" lineNumber:143 description:@"this call must be made on the main thread"];
  }
  manager = self->_manager;
  if (manager) {
    WeakRetained = manager;
  }
  else {
    WeakRetained = (SBSceneManager *)objc_loadWeakRetained((id *)&self->_weak_manager);
  }
  return WeakRetained;
}

- (BOOL)isDefunct
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"-[SBSceneManagerReference isDefunct]"];
    [v6 handleFailureInFunction:v7 file:@"SBSceneManagerReference.m" lineNumber:168 description:@"this call must be made on the main thread"];
  }
  if (!self->_managerWasValid) {
    return 0;
  }
  v3 = [(SBSceneManagerReference *)self manager];
  BOOL v4 = v3 == 0;

  return v4;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (void)retainForScene:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!v4) {
      goto LABEL_5;
    }
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"-[SBSceneManagerReference retainForScene:]"];
    [v5 handleFailureInFunction:v6 file:@"SBSceneManagerReference.m" lineNumber:182 description:@"this call must be made on the main thread"];

    if (!v4) {
      goto LABEL_5;
    }
  }
  if (([(NSMutableSet *)self->_retainingScenes containsObject:v4] & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__SBSceneManagerReference_retainForScene___block_invoke;
    v7[3] = &unk_1E6AF5290;
    v7[4] = self;
    id v8 = v4;
    [(SBSceneManagerReference *)self _updateRetainWithBlock:v7];
  }
LABEL_5:
}

- (void)_updateRetainWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL v5 = [(SBSceneManagerReference *)self isRetaining];
  v4[2](v4);

  if ([(SBSceneManagerReference *)self isRetaining])
  {
    if (v5) {
      return;
    }
    WeakRetained = (SBSceneManager *)objc_loadWeakRetained((id *)&self->_weak_manager);
    manager = self->_manager;
    self->_manager = WeakRetained;
  }
  else
  {
    if (!v5) {
      return;
    }
    id v8 = [(SBSceneManagerReference *)self manager];
    [(SBSceneManagerReference *)self _autoreleaseManager:v8];

    manager = self->_manager;
    self->_manager = 0;
  }
}

- (BOOL)isRetaining
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v5 = [NSString stringWithUTF8String:"-[SBSceneManagerReference isRetaining]"];
    [v4 handleFailureInFunction:v5 file:@"SBSceneManagerReference.m" lineNumber:163 description:@"this call must be made on the main thread"];
  }
  if (self->_invalidated) {
    return 0;
  }
  if (self->_displayIsConnected) {
    return 1;
  }
  return [(NSMutableSet *)self->_retainingScenes count] != 0;
}

void __42__SBSceneManagerReference_retainForScene___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 addObject:v3];
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:a1 + 40 count:1];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v4;
  }
}

- (SBSceneManagerReference)initWithDisplayIdentity:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSceneManagerReference.m", 36, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBSceneManagerReference;
  v7 = [(SBSceneManagerReference *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_displayIdentity, a3);
  }

  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)[(SBSceneManagerReference *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBSceneManagerReference *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBSceneManagerReference *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SBSceneManagerReference_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  objc_super v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __65__SBSceneManagerReference_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) manager];
  id v2 = (id)[v1 appendObject:v3 withName:@"manager"];
}

- (id)succinctDescription
{
  id v2 = [(SBSceneManagerReference *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_displayIdentity withName:@"display"];
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBSceneManagerReference isRetaining](self, "isRetaining"), @"isRetaining");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBSceneManagerReference isDefunct](self, "isDefunct"), @"isDefunct");
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSceneManagerReference *)self descriptionBuilderWithMultilinePrefix:v4];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  objc_super v11 = __63__SBSceneManagerReference_debugDescriptionWithMultilinePrefix___block_invoke;
  v12 = &unk_1E6AF5290;
  v13 = self;
  id v14 = v5;
  id v6 = v5;
  [v6 appendBodySectionWithName:@"retaining reasons" multilinePrefix:v4 block:&v9];

  id v7 = objc_msgSend(v6, "build", v9, v10, v11, v12, v13);

  return v7;
}

void __63__SBSceneManagerReference_debugDescriptionWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 41))
  {
    [*(id *)(a1 + 40) appendString:@"display-connected" withName:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(v2 + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "description", (void)v10);
        [v8 appendString:v9 withName:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_autoreleaseManager:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[SBSceneManagerReference _autoreleaseManager:]((uint64_t)v3);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SBSceneManagerReference__autoreleaseManager___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __47__SBSceneManagerReference__autoreleaseManager___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __47__SBSceneManagerReference__autoreleaseManager___block_invoke_cold_1(a1);
  }
}

- (id)delegate
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[SBSceneManagerReference delegate]"];
    [v5 handleFailureInFunction:v6 file:@"SBSceneManagerReference.m" lineNumber:133 description:@"this call must be made on the main thread"];
  }
  delegate = self->_delegate;
  return delegate;
}

- (void)setDelegate:(id)a3
{
  uint64_t v4 = (SBSceneManagerReferenceDelegate *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[SBSceneManagerReference setDelegate:]"];
    [v6 handleFailureInFunction:v7 file:@"SBSceneManagerReference.m" lineNumber:138 description:@"this call must be made on the main thread"];
  }
  delegate = self->_delegate;
  self->_delegate = v4;
}

- (void)setManager:(id)a3
{
  id obj = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SBSceneManagerReference setManager:]"];
    [v8 handleFailureInFunction:v9 file:@"SBSceneManagerReference.m" lineNumber:148 description:@"this call must be made on the main thread"];
  }
  id v5 = [(SBSceneManagerReference *)self manager];
  if (v5 != obj)
  {
    if (obj && self->_invalidated)
    {
      long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"SBSceneManagerReference.m", 151, @"you can't set the manager if the reference has been invalidated : manager=%@", obj object file lineNumber description];
    }
    [(SBSceneManagerReference *)self _autoreleaseManager:v5];
    [(SBSceneManagerReference *)self _autoreleaseManager:obj];
    objc_storeWeak((id *)&self->_weak_manager, obj);
    if ([(SBSceneManagerReference *)self isRetaining])
    {
      WeakRetained = (SBSceneManager *)objc_loadWeakRetained((id *)&self->_weak_manager);
      manager = self->_manager;
      self->_manager = WeakRetained;
    }
    self->_managerWasValid = obj != 0;
  }
}

- (void)setDisplayIsConnected:(BOOL)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[SBSceneManagerReference setDisplayIsConnected:]"];
    [v5 handleFailureInFunction:v6 file:@"SBSceneManagerReference.m" lineNumber:173 description:@"this call must be made on the main thread"];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBSceneManagerReference_setDisplayIsConnected___block_invoke;
  v7[3] = &unk_1E6AF5D38;
  v7[4] = self;
  BOOL v8 = a3;
  [(SBSceneManagerReference *)self _updateRetainWithBlock:v7];
}

uint64_t __49__SBSceneManagerReference_setDisplayIsConnected___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 41) = *(unsigned char *)(result + 40);
  return result;
}

- (void)releaseForScene:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[SBSceneManagerReference releaseForScene:]"];
    [v5 handleFailureInFunction:v6 file:@"SBSceneManagerReference.m" lineNumber:195 description:@"this call must be made on the main thread"];

    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__SBSceneManagerReference_releaseForScene___block_invoke;
    v7[3] = &unk_1E6AF5290;
    v7[4] = self;
    id v8 = v4;
    [(SBSceneManagerReference *)self _updateRetainWithBlock:v7];
  }
LABEL_4:
}

uint64_t __43__SBSceneManagerReference_releaseForScene___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v11 = [NSString stringWithUTF8String:"-[SBSceneManagerReference invalidate]"];
    [v10 handleFailureInFunction:v11 file:@"SBSceneManagerReference.m" lineNumber:204 description:@"this call must be made on the main thread"];
  }
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_manager)
    {
      WeakRetained = (SBSceneManager *)objc_loadWeakRetained((id *)&self->_weak_manager);
      manager = self->_manager;

      if (WeakRetained != manager)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        [v6 handleFailureInMethod:a2, self, @"SBSceneManagerReference.m", 207, @"we were trying to retain manager but it went away anyway : manager=%@", self->_manager object file lineNumber description];
      }
    }
    uint64_t v7 = [(SBSceneManagerReference *)self manager];
    [(SBSceneManagerReference *)self _autoreleaseManager:v7];

    id v8 = self->_manager;
    self->_manager = 0;

    delegate = self->_delegate;
    [(SBSceneManagerReferenceDelegate *)delegate sceneManagerDidInvalidateForReference:self];
  }
}

- (void)setDisplayIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainingScenes, 0);
  objc_destroyWeak((id *)&self->_weak_manager);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

- (void)_autoreleaseManager:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "delaying release of %@", (uint8_t *)&v1, 0xCu);
}

void __47__SBSceneManagerReference__autoreleaseManager___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "performing delayed release of %@", (uint8_t *)&v2, 0xCu);
}

@end