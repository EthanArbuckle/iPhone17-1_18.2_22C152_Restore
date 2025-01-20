@interface NPKThreadSafeObserverManager
- (BOOL)_hasObservers;
- (NPKThreadSafeObserverManager)init;
- (void)enumerateObserversUsingBlock:(id)a3;
- (void)registerObserver:(id)a3;
- (void)registerObserver:(id)a3 withRelativePriority:(unint64_t)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation NPKThreadSafeObserverManager

- (NPKThreadSafeObserverManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  result = [(NPKObserverManager *)&v3 init];
  if (result) {
    result->_internalLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__NPKThreadSafeObserverManager_registerObserver___block_invoke;
  v7[3] = &unk_2644D2E08;
  p_internalLock = &self->_internalLock;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  os_unfair_lock_lock(p_internalLock);
  __49__NPKThreadSafeObserverManager_registerObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_internalLock);
}

id __49__NPKThreadSafeObserverManager_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  return objc_msgSendSuper2(&v3, sel_registerObserver_, v1);
}

- (void)registerObserver:(id)a3 withRelativePriority:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__NPKThreadSafeObserverManager_registerObserver_withRelativePriority___block_invoke;
  v8[3] = &unk_2644D3288;
  v10 = self;
  unint64_t v11 = a4;
  id v9 = v6;
  id v7 = v6;
  os_unfair_lock_lock(&self->_internalLock);
  __70__NPKThreadSafeObserverManager_registerObserver_withRelativePriority___block_invoke((uint64_t)v8);
  os_unfair_lock_unlock(&self->_internalLock);
}

id __70__NPKThreadSafeObserverManager_registerObserver_withRelativePriority___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)NPKThreadSafeObserverManager;
  return objc_msgSendSuper2(&v4, sel_registerObserver_withRelativePriority_, v1, v2);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__NPKThreadSafeObserverManager_unregisterObserver___block_invoke;
  v7[3] = &unk_2644D2E08;
  p_internalLock = &self->_internalLock;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  os_unfair_lock_lock(p_internalLock);
  __51__NPKThreadSafeObserverManager_unregisterObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_internalLock);
}

id __51__NPKThreadSafeObserverManager_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  return objc_msgSendSuper2(&v3, sel_unregisterObserver_, v1);
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__NPKThreadSafeObserverManager_enumerateObserversUsingBlock___block_invoke;
  v7[3] = &unk_2644D3FF0;
  p_internalLock = &self->_internalLock;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_lock(p_internalLock);
  __61__NPKThreadSafeObserverManager_enumerateObserversUsingBlock___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_internalLock);
}

id __61__NPKThreadSafeObserverManager_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  return objc_msgSendSuper2(&v3, sel_enumerateObserversUsingBlock_, v1);
}

- (BOOL)_hasObservers
{
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_internalLock = &self->_internalLock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  id v6 = __45__NPKThreadSafeObserverManager__hasObservers__block_invoke;
  id v7 = &unk_2644D2960;
  id v8 = self;
  id v9 = &v10;
  objc_super v3 = v5;
  os_unfair_lock_lock(p_internalLock);
  v6((uint64_t)v3);

  os_unfair_lock_unlock(p_internalLock);
  LOBYTE(p_internalLock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_internalLock;
}

id __45__NPKThreadSafeObserverManager__hasObservers__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  id result = objc_msgSendSuper2(&v3, sel_hasObservers);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

@end