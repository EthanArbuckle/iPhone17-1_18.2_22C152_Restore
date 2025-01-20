@interface RBClientInheritanceManager
- (RBClientInheritanceManager)init;
- (RBClientInheritanceManager)initWithInheritances:(id)a3 delegate:(id)a4;
- (RBClientInheritanceManagerDelegate)delegate;
- (id)description;
- (void)_lock_sendQueuedInheritancesAndUnlock;
- (void)setInheritances:(id)a3;
@end

@implementation RBClientInheritanceManager

uint64_t __67__RBClientInheritanceManager__lock_sendQueuedInheritancesAndUnlock__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 36));
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3 = [*(id *)(a1 + 40) gainedInheritances];
  [v2 unionSet:v3];

  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v5 = [*(id *)(a1 + 40) lostInheritances];
  [v4 minusSet:v5];

  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  return -[RBClientInheritanceManager _lock_sendQueuedInheritancesAndUnlock](v6);
}

- (void)_lock_sendQueuedInheritancesAndUnlock
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  v2 = (os_unfair_lock_s *)(a1 + 36);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 36));
  if (*(unsigned char *)(a1 + 32)) {
    goto LABEL_3;
  }
  [*(id *)(a1 + 16) minusSet:*(void *)(a1 + 8)];
  [*(id *)(a1 + 24) intersectSet:*(void *)(a1 + 8)];
  if (![*(id *)(a1 + 16) count] && !objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v9 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    v10 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

LABEL_3:
    os_unfair_lock_unlock(v2);
    return;
  }
  *(unsigned char *)(a1 + 32) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)[objc_alloc(MEMORY[0x263F644C8]) initWithGainedInheritances:*(void *)(a1 + 16) lostInheritances:*(void *)(a1 + 24)];
  if (v4)
  {
    v5 = rbs_connection_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      _os_log_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEFAULT, "Inheritance changeset: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;

  v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;

  os_unfair_lock_unlock(v2);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__RBClientInheritanceManager__lock_sendQueuedInheritancesAndUnlock__block_invoke;
  v11[3] = &unk_2647C7B98;
  v11[4] = a1;
  id v12 = v4;
  id v8 = v4;
  [WeakRetained inheritanceManager:a1 didChangeInheritances:v8 completion:v11];
}

- (void)setInheritances:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (NSMutableSet *)[v5 mutableCopy];
  queuedGainedInheritances = self->_queuedGainedInheritances;
  self->_queuedGainedInheritances = v6;

  id v8 = (NSMutableSet *)[(NSMutableSet *)self->_inheritances mutableCopy];
  queuedLostInheritances = self->_queuedLostInheritances;
  self->_queuedLostInheritances = v8;

  [(NSMutableSet *)self->_queuedGainedInheritances minusSet:self->_inheritances];
  [(NSMutableSet *)self->_queuedLostInheritances minusSet:v5];

  -[RBClientInheritanceManager _lock_sendQueuedInheritancesAndUnlock]((uint64_t)self);
}

- (RBClientInheritanceManager)initWithInheritances:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RBClientInheritanceManager;
  id v8 = [(RBClientInheritanceManager *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_awaitingAck = 0;
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    inheritances = v9->_inheritances;
    v9->_inheritances = (NSMutableSet *)v10;

    if (v6) {
      [(RBClientInheritanceManager *)v9 setInheritances:v6];
    }
  }

  return v9;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = [(NSMutableSet *)self->_inheritances allObjects];
  uint64_t v4 = [v3 count];

  id v5 = [(NSMutableSet *)self->_queuedGainedInheritances allObjects];
  uint64_t v6 = [v5 count];

  id v7 = [(NSMutableSet *)self->_queuedLostInheritances allObjects];
  uint64_t v8 = [v7 count];

  id v23 = [NSString alloc];
  v9 = [(id)objc_opt_class() description];
  uint64_t v10 = @" inheritances:[\n\t";
  if (!v4) {
    uint64_t v10 = &stru_26DA9D688;
  }
  v22 = v10;
  uint64_t v24 = v4;
  if (v4)
  {
    v21 = [(NSMutableSet *)self->_inheritances allObjects];
    v11 = [v21 componentsJoinedByString:@",\n\t"];
    id v12 = @"\n\t]";
  }
  else
  {
    id v12 = &stru_26DA9D688;
    v11 = &stru_26DA9D688;
  }
  if (v6) {
    objc_super v13 = @" queuedGainedInheritances:[\n\t";
  }
  else {
    objc_super v13 = &stru_26DA9D688;
  }
  if (v6)
  {
    v20 = [(NSMutableSet *)self->_queuedGainedInheritances allObjects];
    v14 = [v20 componentsJoinedByString:@",\n\t"];
    uint64_t v15 = @"\n\t]";
    if (v8) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v15 = &stru_26DA9D688;
    v14 = &stru_26DA9D688;
    if (v8)
    {
LABEL_11:
      v16 = [(NSMutableSet *)self->_queuedLostInheritances allObjects];
      v17 = [v16 componentsJoinedByString:@",\n\t"];
      v18 = (void *)[v23 initWithFormat:@"<%@| %@%@%@%@%@%@%@%@%@>", v9, v22, v11, v12, v13, v14, v15, @" queuedLostInheritances:[\n\t", v17, @"\n\t]"];

      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  v18 = (void *)[v23 initWithFormat:@"<%@| %@%@%@%@%@%@%@%@%@>", v9, v22, v11, v12, v13, v14, v15, &stru_26DA9D688, &stru_26DA9D688, &stru_26DA9D688];
  if (v6)
  {
LABEL_12:
  }
LABEL_13:
  if (v24)
  {
  }
  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedLostInheritances, 0);
  objc_storeStrong((id *)&self->_queuedGainedInheritances, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
}

- (RBClientInheritanceManager)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBClientInheritanceManager.m" lineNumber:46 description:@"wrong initializer"];

  return 0;
}

- (RBClientInheritanceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RBClientInheritanceManagerDelegate *)WeakRetained;
}

@end