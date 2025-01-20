@interface HDSPAssertionManager
+ (Class)assertionClassForType:(unint64_t)a3;
- (HDSPAssertionManager)init;
- (NSMutableDictionary)assertions;
- (id)_assertionsOfType:(unint64_t)a3;
- (id)activeAssertionIdentifiersOfType:(unint64_t)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diagnosticDescription;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (os_unfair_lock_s)assertionsLock;
- (void)_withLock:(id)a3;
- (void)releaseAssertionWithIdentifier:(id)a3;
- (void)setAssertions:(id)a3;
- (void)takeAssertion:(id)a3;
- (void)takeAssertionWithIdentifier:(id)a3 type:(unint64_t)a4;
- (void)takeAssertionWithIdentifier:(id)a3 type:(unint64_t)a4 timeout:(double)a5;
- (void)takeIndefiniteAssertionWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation HDSPAssertionManager

- (HDSPAssertionManager)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HDSPAssertionManager;
  v2 = [(HDSPAssertionManager *)&v10 init];
  if (v2)
  {
    v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v12 = v4;
      __int16 v13 = 2048;
      v14 = v2;
      id v5 = v4;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assertions = v2->_assertions;
    v2->_assertions = v6;

    v2->_assertionsLock._os_unfair_lock_opaque = 0;
    v8 = v2;
  }

  return v2;
}

- (void)_withLock:(id)a3
{
  p_assertionsLock = &self->_assertionsLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_assertionsLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_assertionsLock);
}

- (void)takeAssertionWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "assertionClassForType:", a4), "assertionWithIdentifier:", v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(HDSPAssertionManager *)self takeAssertion:v7];
}

- (void)takeAssertionWithIdentifier:(id)a3 type:(unint64_t)a4 timeout:(double)a5
{
  id v8 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "assertionClassForType:", a4), "assertionWithIdentifier:timeout:", v8, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(HDSPAssertionManager *)self takeAssertion:v9];
}

- (void)takeIndefiniteAssertionWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  id v8 = [v6 distantFuture];
  [v8 timeIntervalSinceNow];
  double v10 = v9;

  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "assertionClassForType:", a4), "assertionWithIdentifier:timeout:", v7, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [(HDSPAssertionManager *)self takeAssertion:v11];
}

- (void)takeAssertion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    __int16 v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Taking assertion with identifier %{public}@", buf, 0x16u);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__HDSPAssertionManager_takeAssertion___block_invoke;
  v10[3] = &unk_2645D9288;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(HDSPAssertionManager *)self _withLock:v10];
}

void __38__HDSPAssertionManager_takeAssertion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = [v1 identifier];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

+ (Class)assertionClassForType:(unint64_t)a3
{
  if (a3 == 1 || a3 == 2)
  {
    objc_opt_class();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)a1;
}

- (void)releaseAssertionWithIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v4;
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Releasing assertion with identifier %{public}@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__HDSPAssertionManager_releaseAssertionWithIdentifier___block_invoke;
  v8[3] = &unk_2645D9288;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HDSPAssertionManager *)self _withLock:v8];
}

void __55__HDSPAssertionManager_releaseAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2) {
    [v2 releaseAssertion];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)activeAssertionIdentifiersOfType:(unint64_t)a3
{
  uint64_t v3 = [(HDSPAssertionManager *)self _assertionsOfType:a3];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_19);

  return v4;
}

uint64_t __57__HDSPAssertionManager_activeAssertionIdentifiersOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)_assertionsOfType:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__16;
  double v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__HDSPAssertionManager__assertionsOfType___block_invoke;
  v5[3] = &unk_2645DA0F0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  [(HDSPAssertionManager *)self _withLock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__HDSPAssertionManager__assertionsOfType___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 16) allValues];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HDSPAssertionManager__assertionsOfType___block_invoke_2;
  v7[3] = &unk_2645DA990;
  uint64_t v3 = a1[6];
  v7[4] = a1[4];
  v7[5] = v3;
  uint64_t v4 = objc_msgSend(v2, "na_filter:", v7);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __42__HDSPAssertionManager__assertionsOfType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [(id)objc_opt_class() assertionClassForType:*(void *)(a1 + 40)];
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (id)succinctDescription
{
  id v2 = [(HDSPAssertionManager *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(HDSPAssertionManager *)self _assertionsOfType:1];
  [v3 appendArraySection:v4 withName:@"transactions" multilinePrefix:&stru_26D3FAEE0 skipIfEmpty:1];

  uint64_t v5 = [(HDSPAssertionManager *)self _assertionsOfType:2];
  [v3 appendArraySection:v5 withName:@"assertions" multilinePrefix:&stru_26D3FAEE0 skipIfEmpty:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(HDSPAssertionManager *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)diagnosticDescription
{
  id v3 = NSString;
  uint64_t v4 = [(HDSPAssertionManager *)self activeAssertionIdentifiersOfType:2];
  uint64_t v5 = [(HDSPAssertionManager *)self activeAssertionIdentifiersOfType:1];
  uint64_t v6 = [v3 stringWithFormat:@"Assertions: %@\nTransactions: %@", v4, v5];

  return v6;
}

- (os_unfair_lock_s)assertionsLock
{
  return self->_assertionsLock;
}

- (NSMutableDictionary)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end