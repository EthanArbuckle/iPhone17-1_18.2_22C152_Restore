@interface WBSHostTabProviderManager
+ (WBSHostTabProviderManager)sharedManager;
- (WBSHostTabProviderManager)init;
- (id)_hostTabForContentUUID:(id)a3;
- (id)providerForContentUUID:(id)a3;
- (void)registerHostTab:(id)a3;
- (void)unregisterHostTab:(id)a3;
@end

@implementation WBSHostTabProviderManager

+ (WBSHostTabProviderManager)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_73);
  }
  v2 = (void *)sharedManager_sharedManager_0;
  return (WBSHostTabProviderManager *)v2;
}

void __42__WBSHostTabProviderManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSHostTabProviderManager);
  v1 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v0;
}

- (WBSHostTabProviderManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSHostTabProviderManager;
  v2 = [(WBSHostTabProviderManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    providerMapTable = v2->_providerMapTable;
    v2->_providerMapTable = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    hostTabMapTable = v2->_hostTabMapTable;
    v2->_hostTabMapTable = (NSMapTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)providerForContentUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_providerMapTable objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = objc_alloc_init(WBSHostTabProvider);
    v6 = [(WBSHostTabProviderManager *)self _hostTabForContentUUID:v4];
    [(WBSHostTabProvider *)v5 _setHostTab:v6];

    [(NSMapTable *)self->_providerMapTable setObject:v5 forKey:v4];
  }
  v7 = v5;

  return v7;
}

- (void)registerHostTab:(id)a3
{
  id v4 = a3;
  id v6 = [v4 contentUUID];
  [(NSMapTable *)self->_hostTabMapTable setObject:v4 forKey:v6];
  uint64_t v5 = [(WBSHostTabProviderManager *)self providerForContentUUID:v6];
  [v5 _setHostTab:v4];
}

- (void)unregisterHostTab:(id)a3
{
  id v4 = [a3 contentUUID];
  [(NSMapTable *)self->_hostTabMapTable removeObjectForKey:v4];
}

- (id)_hostTabForContentUUID:(id)a3
{
  return [(NSMapTable *)self->_hostTabMapTable objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostTabMapTable, 0);
  objc_storeStrong((id *)&self->_providerMapTable, 0);
}

@end