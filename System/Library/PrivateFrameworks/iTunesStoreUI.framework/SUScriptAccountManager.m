@interface SUScriptAccountManager
+ (id)beginAccountManagerSessionForObject:(id)a3;
+ (void)endAccountManagerSessionForObject:(id)a3;
- (NSArray)accounts;
- (SUScriptAccountManager)init;
- (id)accountForDSID:(id)a3;
- (void)_accountsChangedNotification:(id)a3;
- (void)_dispatchEvent:(id)a3 forName:(id)a4;
- (void)_ntsReloadAccounts;
- (void)dealloc;
@end

@implementation SUScriptAccountManager

- (SUScriptAccountManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptAccountManager;
  v2 = [(SUScriptAccountManager *)&v5 init];
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [MEMORY[0x263F7B0E8] defaultStore];
    [v3 addObserver:v2 selector:sel__accountsChangedNotification_ name:*MEMORY[0x263F7B440] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F7B440] object:0];

  self->_accounts = 0;
  self->_lock = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAccountManager;
  [(SUScriptAccountManager *)&v4 dealloc];
}

+ (id)beginAccountManagerSessionForObject:(id)a3
{
  _os_nospin_lock_lock();
  id v5 = (id)__SessionObjects;
  if (!__SessionObjects)
  {
    id v5 = (id)[MEMORY[0x263F088B0] weakObjectsHashTable];
    __SessionObjects = (uint64_t)v5;
  }
  [v5 addObject:a3];
  id v6 = (id)__SharedInstance_1;
  if (!__SharedInstance_1)
  {
    id v6 = objc_alloc_init((Class)a1);
    __SharedInstance_1 = (uint64_t)v6;
  }
  id v7 = v6;
  _os_nospin_lock_unlock();
  return v7;
}

+ (void)endAccountManagerSessionForObject:(id)a3
{
  _os_nospin_lock_lock();
  if (__SessionObjects)
  {
    [(id)__SessionObjects removeObject:a3];
    if (![(id)__SessionObjects count])
    {

      __SharedInstance_1 = 0;
    }
  }

  _os_nospin_lock_unlock();
}

- (id)accountForDSID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v4 = [(SUScriptAccountManager *)self accounts];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "dsID"), "isEqual:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (NSArray)accounts
{
  [(NSLock *)self->_lock lock];
  [(SUScriptAccountManager *)self _ntsReloadAccounts];
  v3 = (NSArray *)(id)[(NSMutableArray *)self->_accounts copy];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (void)_accountsChangedNotification:(id)a3
{
}

- (void)_dispatchEvent:(id)a3 forName:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  _os_nospin_lock_lock();
  if (__SessionObjects)
  {
    uint64_t v7 = (void *)[(id)__SessionObjects allObjects];
    _os_nospin_lock_unlock();
    if (v7)
    {
      v17[0] = (uint64_t)a3;
      v17[1] = (uint64_t)a4;
      uint64_t v8 = self;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v7);
            }
            SUScriptObjectDispatchEventForName(*(void **)(*((void *)&v13 + 1) + 8 * i), v17);
          }
          uint64_t v10 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        }
        while (v10);
      }
    }
  }
  else
  {
    _os_nospin_lock_unlock();
  }
}

- (void)_ntsReloadAccounts
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  accounts = self->_accounts;
  uint64_t v6 = [(NSMutableArray *)accounts countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(accounts);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [v10 dsID];
        if (v11) {
          [v4 setObject:v10 forKey:v11];
        }
      }
      uint64_t v7 = [(NSMutableArray *)accounts countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }
  long long v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "accounts");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        uint64_t v18 = [v17 uniqueIdentifier];
        if (!v18 || (uint64_t v19 = (SUScriptAccount *)(id)[v4 objectForKey:v18]) == 0) {
          uint64_t v19 = objc_alloc_init(SUScriptAccount);
        }
        [(SUScriptAccount *)v19 setAccount:v17];
        [(NSMutableArray *)v3 addObject:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  self->_accounts = v3;
}

@end