@interface TPSController
- (NSMapTable)delegateToQueue;
- (TPSController)init;
- (os_unfair_lock_s)delegateLock;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)performAtomicDelegateBlock:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setDelegateLock:(os_unfair_lock_s)a3;
@end

@implementation TPSController

- (TPSController)init
{
  v7.receiver = self;
  v7.super_class = (Class)TPSController;
  v2 = [(TPSController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_delegateLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v3->_delegateToQueue;
    v3->_delegateToQueue = (NSMapTable *)v4;
  }
  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__TPSController_addDelegate_queue___block_invoke;
  v10[3] = &unk_1E6EB2180;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(TPSController *)self performAtomicDelegateBlock:v10];
}

void __35__TPSController_addDelegate_queue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v4 = v2;
  if (*(void *)(a1 + 40)) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F14428];
  }
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__TPSController_removeDelegate___block_invoke;
  v6[3] = &unk_1E6EB22C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSController *)self performAtomicDelegateBlock:v6];
}

void __32__TPSController_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)performAtomicDelegateBlock:(id)a3
{
  if (a3)
  {
    p_delegateLock = &self->_delegateLock;
    id v4 = (void (**)(void))a3;
    os_unfair_lock_lock_with_options();
    v4[2](v4);

    os_unfair_lock_unlock(p_delegateLock);
  }
}

- (os_unfair_lock_s)delegateLock
{
  return self->_delegateLock;
}

- (void)setDelegateLock:(os_unfair_lock_s)a3
{
  self->_delegateLock = a3;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void).cxx_destruct
{
}

@end