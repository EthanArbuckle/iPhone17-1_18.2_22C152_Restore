@interface PCSLockManager
+ (BOOL)holdAssertion;
+ (id)manager;
+ (void)dropAssertion;
- (BOOL)holdAssertion:(id)a3;
- (NSHashTable)holders;
- (NSHashTable)observers;
- (OS_os_log)log;
- (id)initManager;
- (id)lockAssertion:(id)a3;
- (void)_onlockDropAssertion:(id)a3;
- (void)dropAssertion:(id)a3;
- (void)removeAssertion:(id)a3;
- (void)setHolders:(id)a3;
- (void)setLog:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation PCSLockManager

- (id)initManager
{
  v10.receiver = self;
  v10.super_class = (Class)PCSLockManager;
  v2 = [(PCSLockManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    holders = v2->_holders;
    v2->_holders = (NSHashTable *)v5;

    os_log_t v7 = os_log_create("com.apple.ProtectedCloudStorage", "lockassertion");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;
  }
  return v2;
}

+ (id)manager
{
  if (manager_onceToken != -1) {
    dispatch_once(&manager_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)manager_manager;
  return v2;
}

uint64_t __25__PCSLockManager_manager__block_invoke()
{
  manager_manager = [[PCSLockManager alloc] initManager];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)holdAssertion
{
  return aks_assert_hold(0, 0, 0x1EuLL) == 0;
}

+ (void)dropAssertion
{
}

- (id)lockAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [[PCSLockAssertion alloc] initAssertion:v4 manager:self];
  v6 = self;
  objc_sync_enter(v6);
  [(NSHashTable *)v6->_observers addObject:v5];
  objc_sync_exit(v6);

  return v5;
}

- (void)removeAssertion:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  [(PCSLockManager *)v4 _onlockDropAssertion:v5];
  objc_sync_exit(v4);
}

- (BOOL)holdAssertion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PCSLockManager *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    int v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1ACF98000, v5, OS_LOG_TYPE_DEFAULT, "assertion %{public}@ trying to hold lock assertion", (uint8_t *)&v13, 0xCu);
  }
  os_log_t v7 = self;
  objc_sync_enter(v7);
  if ([(NSHashTable *)v7->_holders count]
    && !+[PCSLockManager holdAssertion])
  {
    BOOL v11 = 0;
  }
  else
  {
    v8 = [(PCSLockManager *)v7 log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(NSHashTable *)v7->_holders count];
      objc_super v10 = " though piggyback";
      if (!v9) {
        objc_super v10 = "";
      }
      int v13 = 136315138;
      v14 = v10;
      _os_log_impl(&dword_1ACF98000, v8, OS_LOG_TYPE_DEFAULT, "Got lock assertion%s", (uint8_t *)&v13, 0xCu);
    }

    [(NSHashTable *)v7->_holders addObject:v4];
    BOOL v11 = 1;
  }
  objc_sync_exit(v7);

  return v11;
}

- (void)_onlockDropAssertion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PCSLockManager *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1ACF98000, v5, OS_LOG_TYPE_DEFAULT, "assertion %{public}@ dropping lock assertion", (uint8_t *)&v8, 0xCu);
  }
  [(NSHashTable *)self->_holders removeObject:v4];
  if (![(NSHashTable *)self->_holders count])
  {
    +[PCSLockManager dropAssertion];
    os_log_t v7 = [(PCSLockManager *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1ACF98000, v7, OS_LOG_TYPE_DEFAULT, "dropped lock assertion", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)dropAssertion:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(PCSLockManager *)v4 _onlockDropAssertion:v5];
  objc_sync_exit(v4);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)holders
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHolders:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_holders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end