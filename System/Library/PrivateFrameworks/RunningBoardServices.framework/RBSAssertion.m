@interface RBSAssertion
- (BOOL)_clientInvalidateWithError:(uint64_t)a1;
- (BOOL)acquireWithError:(id *)a3;
- (BOOL)invalidateSyncWithError:(id *)a3;
- (BOOL)invalidateWithError:(id *)a3;
- (BOOL)isValid;
- (NSArray)attributes;
- (NSString)explanation;
- (RBSAssertion)init;
- (RBSAssertion)initWithExplanation:(id)a3 target:(id)a4 attributes:(id)a5;
- (RBSAssertionDescriptor)descriptor;
- (RBSAssertionIdentifier)identifier;
- (RBSTarget)target;
- (id)_initWithDescriptor:(id)a3 service:(id)a4;
- (id)_initWithServerValidatedDescriptor:(id)a3;
- (id)_initWithServerValidatedDescriptor:(id)a3 service:(id)a4;
- (id)debugDescription;
- (id)description;
- (unint64_t)state;
- (void)_serverDidChangeIdentifier:(uint64_t)a1;
- (void)_serverInvalidateWithError:(id)a3;
- (void)_serverWillInvalidate;
- (void)acquireWithInvalidationHandler:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setExpirationWarningHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation RBSAssertion

- (RBSAssertion)initWithExplanation:(id)a3 target:(id)a4 attributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"RBSAssertion.m", 63, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"RBSAssertion.m", 64, @"Invalid parameter not satisfying: %@", @"explanation" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = +[RBSAssertionDescriptor descriptorWithIdentifier:0 target:v10 explanation:v9 attributes:v11];
  v13 = +[RBSConnection sharedInstance];
  v14 = [(RBSAssertion *)self _initWithDescriptor:v12 service:v13];

  return v14;
}

- (id)_initWithDescriptor:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RBSAssertion;
  v8 = [(RBSAssertion *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    uint64_t v11 = [v6 copy];
    descriptor = v8->_descriptor;
    v8->_descriptor = (RBSAssertionDescriptor *)v11;

    v8->_state = 0;
    objc_storeStrong((id *)&v8->_service, a4);
    *(void *)&v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (RBSAssertionDescriptor)descriptor
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  v4 = (void *)[(RBSAssertionDescriptor *)self->_descriptor copy];
  os_unfair_lock_unlock(p_dataLock);
  return (RBSAssertionDescriptor *)v4;
}

- (BOOL)isValid
{
  return [(RBSAssertion *)self state] == 1;
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (BOOL)invalidateWithError:(id *)a3
{
  return 1;
}

- (void)invalidate
{
}

- (BOOL)_clientInvalidateWithError:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = *(void *)(a1 + 48);
    *(void *)(a1 + 48) = 2;
    v5 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    id v6 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    id v7 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    if (v4 == 1) {
      [*(id *)(a1 + 40) invalidateAssertion:a1 error:a2];
    }
  }
  return a1 != 0;
}

- (NSString)explanation
{
  v2 = [(RBSAssertion *)self descriptor];
  v3 = [v2 explanation];

  return (NSString *)v3;
}

- (RBSAssertionIdentifier)identifier
{
  v2 = [(RBSAssertion *)self descriptor];
  v3 = [v2 identifier];

  return (RBSAssertionIdentifier *)v3;
}

- (BOOL)acquireWithError:(id *)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  if (state == 2)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28588];
    v28 = @"Assertion has already been invalidated";
    observers = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v7 = [v16 errorWithDomain:@"RBSAssertionErrorDomain" code:1 userInfo:observers];
LABEL_13:

LABEL_14:
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id warningHandler = self->_warningHandler;
    self->_id warningHandler = 0;

    BOOL v13 = 0;
    observers = self->_observers;
    self->_observers = 0;
    goto LABEL_15;
  }
  id v7 = 0;
  if (state == 1)
  {
    BOOL v13 = 1;
    goto LABEL_16;
  }
  if (state) {
    goto LABEL_14;
  }
  observers = [(RBSAssertion *)self descriptor];
  uint64_t v9 = [observers target];

  if (!v9)
  {
    self->_unint64_t state = 2;
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28588];
    v32[0] = @"Missing assertion target";
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    v19 = (__CFString **)v32;
    v20 = &v31;
LABEL_12:
    v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    id v7 = [v17 errorWithDomain:@"RBSAssertionErrorDomain" code:2 userInfo:v21];

    goto LABEL_13;
  }
  id v10 = [observers explanation];

  if (!v10)
  {
    self->_unint64_t state = 2;
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28588];
    v30 = @"Missing assertion explanation";
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    v19 = &v30;
    v20 = &v29;
    goto LABEL_12;
  }
  service = self->_service;
  id v26 = 0;
  v12 = [(RBSServiceLocalProtocol *)service acquireAssertion:self error:&v26];
  id v7 = v26;
  if (!v12)
  {
    v25 = rbs_assertion_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[RBSAssertion acquireWithError:]((uint64_t)v7, v25);
    }

    self->_unint64_t state = 2;
    goto LABEL_13;
  }
  BOOL v13 = 1;
  self->_unint64_t state = 1;
  os_unfair_lock_lock(&self->_dataLock);
  objc_super v14 = (RBSAssertionDescriptor *)[observers copyWithIdentifier:v12];
  descriptor = self->_descriptor;
  self->_descriptor = v14;

  os_unfair_lock_unlock(&self->_dataLock);
LABEL_15:

LABEL_16:
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v7;
  }

  return v13;
}

- (void)acquireWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "Error acquiring assertion: <%{public}@>", (uint8_t *)&v2, 0xCu);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong(&self->_warningHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)dealloc
{
  if (self->_state == 1)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [(RBSAssertion *)self debugDescription];
    [v4 handleFailureInMethod:a2, self, @"RBSAssertion.m", 218, @"BUG IN CLIENT OF RUNNINGBOARD: Dealloc called before invalidate for assertion %@", v5 object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)RBSAssertion;
  [(RBSAssertion *)&v6 dealloc];
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"RBSAssertion.m", 182, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];
  }
  os_unfair_lock_lock_with_options();
  if (self->_state == 2)
  {
    if (objc_opt_respondsToSelector())
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __28__RBSAssertion_addObserver___block_invoke;
      v7[3] = &unk_1E57413D0;
      id v8 = v5;
      uint64_t v9 = self;
      +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v7);
    }
  }
  else
  {
    [(NSHashTable *)self->_observers addObject:v5];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"RBSAssertion.m", 198, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];
  }
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)self->_observers removeObject:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)_initWithServerValidatedDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = +[RBSConnection sharedInstance];
  id v6 = [(RBSAssertion *)self _initWithServerValidatedDescriptor:v4 service:v5];

  return v6;
}

- (id)_initWithServerValidatedDescriptor:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 identifier];

  if (!v9)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"RBSAssertion.m", 283, @"Invalid parameter not satisfying: %@", @"[descriptor identifier] != nil" object file lineNumber description];
  }
  id v10 = [(RBSAssertion *)self _initWithDescriptor:v7 service:v8];
  uint64_t v11 = v10;
  if (v10) {
    v10[6] = 1;
  }

  return v11;
}

- (void)setInvalidationHandler:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_state)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"RBSAssertion.m" lineNumber:208 description:@"can only call before acquisition"];
  }
  id v5 = (void *)[v8 copy];
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v5;

  os_unfair_lock_unlock(&self->_lock);
}

void __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock_with_options();
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  id v5 = *(void **)(a1 + 32);
  id v14 = 0;
  char v6 = [v5 acquireWithError:&v14];
  id v7 = v14;
  if ((v6 & 1) == 0)
  {
    id v8 = *(void **)(a1 + 40);
    if (v8)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke_2;
      v11[3] = &unk_1E5741380;
      id v9 = v8;
      uint64_t v10 = *(void *)(a1 + 32);
      id v13 = v9;
      v11[4] = v10;
      id v12 = v7;
      +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v11);
    }
  }
}

- (void)acquireWithInvalidationHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke;
  v6[3] = &unk_1E57413A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[RBSWorkloop performBackgroundWork:v6];
}

- (RBSAssertion)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSAssertion.m" lineNumber:56 description:@"-init is not allowed on RBSAssertion"];

  return 0;
}

uint64_t __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)invalidateSyncWithError:(id *)a3
{
  id v6 = 0;
  -[RBSAssertion _clientInvalidateWithError:]((uint64_t)self, (uint64_t)&v6);
  id v4 = v6;
  if (a3) {
    *a3 = v6;
  }
  return v4 == 0;
}

- (RBSTarget)target
{
  uint64_t v2 = [(RBSAssertion *)self descriptor];
  uint64_t v3 = [v2 target];

  return (RBSTarget *)v3;
}

- (NSArray)attributes
{
  uint64_t v2 = [(RBSAssertion *)self descriptor];
  uint64_t v3 = [v2 attributes];

  return (NSArray *)v3;
}

uint64_t __28__RBSAssertion_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) assertion:*(void *)(a1 + 40) didInvalidateWithError:0];
}

- (void)setExpirationWarningHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(RBSAssertion *)self attributes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 warningDuration];
          if (v11 > 0.0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (self->_state)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"RBSAssertion.m" lineNumber:254 description:@"can only call before acquisition"];
  }
  if ((v7 & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"RBSAssertion.m" lineNumber:255 description:@"this assertion does not contain an applicable RBSDurationAttribute"];
  }
  id v12 = (void *)[v5 copy];
  id warningHandler = self->_warningHandler;
  self->_id warningHandler = v12;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)description
{
  id v2 = [NSString alloc];
  uint64_t v3 = [(id)objc_opt_class() description];
  id v4 = (void *)[v2 initWithFormat:@"<%@>", v3];

  return v4;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  unint64_t state = self->_state;
  if (state > 2) {
    id v6 = @"(invalid assertion state)";
  }
  else {
    id v6 = off_1E5741418[state];
  }
  uint64_t v7 = [(RBSAssertion *)self descriptor];
  uint64_t v8 = (void *)[v3 initWithFormat:@"<%@:%p| state:%@ descriptor:<%@>", v4, self, v6, v7];

  return v8;
}

- (void)_serverInvalidateWithError:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  self->_unint64_t state = 2;
  os_unfair_lock_unlock(&self->_lock);
  if (state != 2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__RBSAssertion__serverInvalidateWithError___block_invoke;
    v6[3] = &unk_1E57413D0;
    v6[4] = self;
    id v7 = v4;
    +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v6);
  }
}

void __43__RBSAssertion__serverInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  id v2 = (void (**)(void, void, void))MEMORY[0x192FEC490](*(void *)(*(void *)(a1 + 32) + 16));
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v15, "assertion:didInvalidateWithError:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v16);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  if (v2) {
    v2[2](v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)_serverWillInvalidate
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __37__RBSAssertion__serverWillInvalidate__block_invoke;
    v1[3] = &unk_1E57413F8;
    v1[4] = a1;
    +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v1);
  }
}

void __37__RBSAssertion__serverWillInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48) == 1)
  {
    id v3 = [*(id *)(v2 + 8) allObjects];
    uint64_t v4 = (void (**)(void, void))MEMORY[0x192FEC490](*(void *)(*(void *)(a1 + 32) + 24));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    id v3 = 0;
    uint64_t v4 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 56));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "assertionWillInvalidate:", *(void *)(a1 + 32), (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if (v4) {
    v4[2](v4, *(void *)(a1 + 32));
  }
}

- (void)_serverDidChangeIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    if (!v3)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel__serverDidChangeIdentifier_, a1, @"RBSAssertion.m", 381, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
    }
    os_unfair_lock_lock_with_options();
    if (*(void *)(a1 + 48) == 1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
      uint64_t v4 = [*(id *)(a1 + 32) copyWithIdentifier:v7];
      uint64_t v5 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v4;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
      [*(id *)(a1 + 40) invalidateAssertionWithIdentifier:v7 error:0];
    }
    id v3 = v7;
  }
}

@end