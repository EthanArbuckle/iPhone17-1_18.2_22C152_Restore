@interface PKPasscodeLockManager
+ (id)sharedManager;
- (BOOL)isPasscodeSet;
- (PKPasscodeLockManager)init;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)profileConnectionDidReceivePasscodeChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation PKPasscodeLockManager

+ (id)sharedManager
{
  if (_MergedGlobals_263 != -1) {
    dispatch_once(&_MergedGlobals_263, &__block_literal_global_170);
  }
  v2 = (void *)qword_1EB403338;
  return v2;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

void __38__PKPasscodeLockManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(PKPasscodeLockManager);
  v1 = (void *)qword_1EB403338;
  qword_1EB403338 = (uint64_t)v0;
}

- (PKPasscodeLockManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKPasscodeLockManager;
  v2 = [(PKPasscodeLockManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v3;

    [(MCProfileConnection *)v2->_profileConnection registerObserver:v2];
    v2->_isPasscodeSet = [(MCProfileConnection *)v2->_profileConnection isPasscodeSet];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.passkit.passcodelockmanager.replyQueue", v7);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (void)dealloc
{
  [(MCProfileConnection *)self->_profileConnection unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPasscodeLockManager;
  [(PKPasscodeLockManager *)&v3 dealloc];
}

- (BOOL)isPasscodeSet
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isPasscodeSet;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)profileConnectionDidReceivePasscodeChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 isPasscodeSet];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isPasscodeSet = v8;
  if ([(NSHashTable *)self->_observers count])
  {
    v10 = (void *)MEMORY[0x192FDC630]();
    objc_super v11 = [(NSHashTable *)self->_observers allObjects];
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__PKPasscodeLockManager_profileConnectionDidReceivePasscodeChangedNotification_userInfo___block_invoke;
    block[3] = &unk_1E56DD128;
    id v15 = v11;
    v16 = self;
    char v17 = v8;
    id v13 = v11;
    dispatch_async(replyQueue, block);
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __89__PKPasscodeLockManager_profileConnectionDidReceivePasscodeChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__PKPasscodeLockManager_profileConnectionDidReceivePasscodeChangedNotification_userInfo___block_invoke_2;
  v3[3] = &unk_1E56F04D8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  return [v1 enumerateObjectsUsingBlock:v3];
}

uint64_t __89__PKPasscodeLockManager_profileConnectionDidReceivePasscodeChangedNotification_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 passcodeLockManager:*(void *)(a1 + 32) didReceivePasscodeSet:*(unsigned __int8 *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
}

@end