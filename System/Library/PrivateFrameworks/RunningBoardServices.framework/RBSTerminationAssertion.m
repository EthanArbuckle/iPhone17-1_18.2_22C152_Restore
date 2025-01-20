@interface RBSTerminationAssertion
- (BOOL)acquireWithError:(id *)a3;
- (BOOL)invalidateWithError:(id *)a3;
- (BOOL)isValid;
- (BOOL)processExists;
- (RBSTerminationAssertion)initWithPredicate:(id)a3 context:(id)a4;
- (RBSTerminationAssertion)initWithPredicate:(id)a3 context:(id)a4 allowLaunch:(id)a5;
- (RBSTerminationAssertion)initWithPredicate:(id)a3 context:(id)a4 allowLaunch:(id)a5 service:(id)a6;
- (RBSTerminationAssertion)initWithTarget:(id)a3 context:(id)a4;
- (uint64_t)setupMonitor;
- (void)_notifyObserversOfProcessExit;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
@end

@implementation RBSTerminationAssertion

- (RBSTerminationAssertion)initWithTarget:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 processIdentity];
  int v9 = [v8 isEmbeddedApplication];

  if (v9)
  {
    v10 = [v7 processIdentity];

    v11 = [v10 embeddedApplicationIdentifier];
    v12 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v11];
    v13 = [(RBSTerminationAssertion *)self initWithPredicate:v12 context:v6];

    v14 = v13;
  }
  else
  {
    v10 = +[RBSProcessPredicate predicateMatchingTarget:v7];

    v15 = [(RBSTerminationAssertion *)self initWithPredicate:v10 context:v6];
    v14 = v15;
  }

  return v14;
}

- (uint64_t)setupMonitor
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = -[RBSProcessMonitor _initWithService:]((id *)[RBSProcessMonitor alloc], *(void **)(result + 56));
    v3 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = v2;

    v4 = *(void **)(v1 + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__RBSTerminationAssertion_setupMonitor__block_invoke;
    v5[3] = &unk_1E57419E8;
    v5[4] = v1;
    return [v4 updateConfiguration:v5];
  }
  return result;
}

void __39__RBSTerminationAssertion_setupMonitor__block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[RBSProcessStateDescriptor descriptor];
  [v4 setValues:5];
  [v3 setStateDescriptor:v4];
  uint64_t v5 = *(void *)(a1 + 32);
  a1 += 32;
  v10[0] = *(void *)(v5 + 40);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v3 setPredicates:v6];

  objc_initWeak(&location, *(id *)a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__RBSTerminationAssertion_setupMonitor__block_invoke_2;
  v7[3] = &unk_1E57419C0;
  objc_copyWeak(&v8, &location);
  v7[4] = *(void *)a1;
  [v3 setUpdateHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __39__RBSTerminationAssertion_setupMonitor__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    if (*(void *)&v7[16]._os_unfair_lock_opaque == 1)
    {
      id v8 = [v5 previousState];
      unsigned int v9 = [v8 terminationResistance];
      if (v9 <= [*(id *)&v7[8]._os_unfair_lock_opaque maximumTerminationResistance])
      {
      }
      else
      {
        v10 = [v5 state];
        unsigned int v11 = [v10 terminationResistance];
        unsigned int v12 = [*(id *)&v7[8]._os_unfair_lock_opaque maximumTerminationResistance];

        if (v11 <= v12)
        {
          v13 = -[RBSTerminateRequest initWithPredicate:context:allowLaunch:service:]((id *)[RBSTerminateRequest alloc], *(void **)&v7[10]._os_unfair_lock_opaque, *(void **)&v7[8]._os_unfair_lock_opaque, *(void **)(*(void *)(a1 + 32) + 48), *(void **)&v7[14]._os_unfair_lock_opaque);
          uint64_t v14 = 0;
          [v13 execute:&v14];
        }
      }
    }
    os_unfair_lock_unlock(v7 + 2);
  }
}

- (RBSTerminationAssertion)initWithPredicate:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[RBSConnection sharedInstance];
  unsigned int v9 = [(RBSTerminationAssertion *)self initWithPredicate:v7 context:v6 allowLaunch:0 service:v8];

  return v9;
}

- (RBSTerminationAssertion)initWithPredicate:(id)a3 context:(id)a4 allowLaunch:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned int v11 = +[RBSConnection sharedInstance];
  unsigned int v12 = [(RBSTerminationAssertion *)self initWithPredicate:v10 context:v9 allowLaunch:v8 service:v11];

  return v12;
}

- (RBSTerminationAssertion)initWithPredicate:(id)a3 context:(id)a4 allowLaunch:(id)a5 service:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)RBSTerminationAssertion;
  v15 = [(RBSTerminationAssertion *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_predicate, a3);
    objc_storeStrong((id *)&v16->_allow, a5);
    v16->_processExists = 1;
    v16->_state = 0;
    uint64_t v17 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v17;

    objc_storeStrong((id *)&v16->_terminateContext, a4);
    objc_storeStrong((id *)&v16->_service, a6);
  }

  return v16;
}

- (BOOL)isValid
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(RBSAssertion *)v2->_assertion isValid];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)processExists
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_processExists;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)acquireWithError:(id *)a3
{
  v50[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_observersHaveBeenNotified = 0;
  if (!self->_state)
  {
    id v11 = -[RBSTerminateRequest initWithPredicate:context:allowLaunch:service:]((id *)[RBSTerminateRequest alloc], self->_predicate, self->_terminateContext, self->_allow, self->_service);
    -[RBSTerminationAssertion setupMonitor]((uint64_t)self);
    id v44 = 0;
    id v45 = 0;
    char v12 = [v11 execute:&v45 error:&v44];
    id v13 = v45;
    id v14 = v45;
    id v8 = v44;
    p_assertion = (id *)&self->_assertion;
    objc_storeStrong((id *)&self->_assertion, v13);
    BOOL v10 = 1;
    self->_state = 1;
    if (v12)
    {
      int v35 = 0;
      goto LABEL_16;
    }
    if (*p_assertion)
    {
      if ([v8 code] == 4)
      {

        id v8 = 0;
        int v35 = 0;
LABEL_13:
        BOOL v10 = 1;
        goto LABEL_16;
      }
      if ([v8 code] == 3)
      {

        monitor = self->_monitor;
        self->_processExists = 0;
        [(RBSProcessMonitor *)monitor invalidate];
        uint64_t v17 = self->_monitor;
        self->_monitor = 0;

        id v8 = 0;
        int v35 = 1;
        goto LABEL_13;
      }
      [(RBSAssertion *)self->_assertion invalidate];
      assertion = self->_assertion;
      self->_assertion = 0;

      [(RBSProcessMonitor *)self->_monitor invalidate];
      v19 = self->_monitor;
      self->_monitor = 0;
    }
    else
    {
      [(RBSProcessMonitor *)self->_monitor invalidate];
      v15 = self->_monitor;
      self->_monitor = 0;
    }
    int v35 = 0;
    BOOL v10 = 0;
    self->_state = 2;
LABEL_16:

    if (!*p_assertion) {
      goto LABEL_36;
    }
    goto LABEL_17;
  }
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v49 = *MEMORY[0x1E4F28588];
  v50[0] = @"Assertion is in wrong state to be acquired";
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  id v8 = [v6 errorWithDomain:@"RBSAssertionErrorDomain" code:2 userInfo:v7];

  p_assertion = (id *)&self->_assertion;
  if (!self->_assertion)
  {
    os_unfair_lock_unlock(p_lock);
    BOOL v10 = 0;
    goto LABEL_40;
  }
  BOOL v10 = 0;
  int v35 = 0;
LABEL_17:
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  objc_super v20 = self->_observers;
  uint64_t v21 = [(NSHashTable *)v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v20);
        }
        [*p_assertion addObserver:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      uint64_t v21 = [(NSHashTable *)v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v21);
  }

  if (!*p_assertion || !self->_monitor || v8)
  {
    os_unfair_lock_unlock(p_lock);
    if (!v35) {
      goto LABEL_40;
    }
LABEL_39:
    -[RBSTerminationAssertion _notifyObserversOfProcessExit]((uint64_t)self);
    goto LABEL_40;
  }
  predicate = self->_predicate;
  v25 = +[RBSProcessStateDescriptor descriptor];
  service = self->_service;
  id v39 = 0;
  v27 = +[RBSProcessState statesForPredicate:predicate withDescriptor:v25 service:service error:&v39];
  id v28 = v39;

  if (v28)
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28588];
    v47 = @"Could not get list of running apps";
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    id v8 = [v29 errorWithDomain:@"RBSAssertionErrorDomain" code:2 userInfo:v30];

    v31 = rbs_assertion_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[RBSTerminationAssertion acquireWithError:]((uint64_t)self, v31);
    }
  }
  else
  {
    id v8 = 0;
  }
  v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  runningHandles = self->_runningHandles;
  self->_runningHandles = v32;

  self->_deathMonitorsSetUp = 0;
  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __44__RBSTerminationAssertion_acquireWithError___block_invoke;
  v36[3] = &unk_1E5741A38;
  v36[4] = self;
  objc_copyWeak(&v37, &location);
  [v27 enumerateObjectsUsingBlock:v36];
  self->_deathMonitorsSetUp = 1;
  if (![(NSMutableSet *)self->_runningHandles count])
  {
    self->_processExists = 0;
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

    os_unfair_lock_unlock(p_lock);
    goto LABEL_39;
  }
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

LABEL_36:
  os_unfair_lock_unlock(p_lock);
  if (v35) {
    goto LABEL_39;
  }
LABEL_40:
  if (a3) {
    *a3 = v8;
  }

  return v10;
}

void __44__RBSTerminationAssertion_acquireWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isRunning])
  {
    v4 = [v3 process];
    [*(id *)(*(void *)(a1 + 32) + 80) addObject:v4];
    id v5 = rbs_assertion_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_191FE8000, v5, OS_LOG_TYPE_DEFAULT, "Setting up death monitor for %@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__RBSTerminationAssertion_acquireWithError___block_invoke_16;
    v6[3] = &unk_1E5741A10;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    [v4 monitorForDeath:v6];
    objc_destroyWeak(&v7);
  }
}

void __44__RBSTerminationAssertion_acquireWithError___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    [*(id *)(v5 + 80) removeObject:v3];
    id v6 = rbs_assertion_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_191FE8000, v6, OS_LOG_TYPE_DEFAULT, "Death monitor triggered for %@", (uint8_t *)&v8, 0xCu);
    }

    if (*(unsigned char *)(v5 + 88))
    {
      uint64_t v7 = [*(id *)(v5 + 80) count];
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
      if (!v7)
      {
        *(unsigned char *)(v5 + 72) = 0;
        -[RBSTerminationAssertion _notifyObserversOfProcessExit](v5);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
    }
  }
}

- (void)_notifyObserversOfProcessExit
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v3 = (void *)[*(id *)(a1 + 96) copy];
    int v4 = *(unsigned __int8 *)(a1 + 89);
    *(unsigned char *)(a1 + 89) = 1;
    os_unfair_lock_unlock(v2);
    if (!v4)
    {
      uint64_t v5 = rbs_assertion_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191FE8000, v5, OS_LOG_TYPE_DEFAULT, "Notify termination observers of process exit", buf, 2u);
      }

      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __56__RBSTerminationAssertion__notifyObserversOfProcessExit__block_invoke;
      v6[3] = &unk_1E57413D0;
      id v7 = v3;
      uint64_t v8 = a1;
      +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v6);
    }
  }
}

- (BOOL)invalidateWithError:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 1)
  {
    BOOL v6 = [(RBSAssertion *)self->_assertion invalidateWithError:a3];
  }
  else
  {
    if (a3)
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28588];
      v13[0] = @"Assertion is in wrong state to be invalidated";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a3 = [v7 errorWithDomain:@"RBSAssertionErrorDomain" code:2 userInfo:v8];
    }
    id v9 = rbs_assertion_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSTerminationAssertion invalidateWithError:](v9);
    }

    BOOL v6 = 0;
  }
  [(RBSProcessMonitor *)self->_monitor invalidate];
  monitor = self->_monitor;
  self->_monitor = 0;

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(RBSAssertion *)self->_assertion invalidate];
  [(RBSProcessMonitor *)self->_monitor invalidate];
  monitor = self->_monitor;
  self->_monitor = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_observers addObject:v5];
  [(RBSAssertion *)self->_assertion addObserver:v5];
  BOOL processExists = self->_processExists;
  os_unfair_lock_unlock(&self->_lock);
  if (!processExists) {
    [v5 assertionTargetProcessDidExit:self];
  }
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];
  [(RBSAssertion *)self->_assertion removeObserver:v5];

  os_unfair_lock_unlock(p_lock);
}

void __56__RBSTerminationAssertion__notifyObserversOfProcessExit__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "assertionTargetProcessDidExit:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_runningHandles, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_allow, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_terminateContext, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

- (void)acquireWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "Could not get list of running states for %@", (uint8_t *)&v2, 0xCu);
}

- (void)invalidateWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "Attempt to invalidate an invalid assertion", v1, 2u);
}

@end