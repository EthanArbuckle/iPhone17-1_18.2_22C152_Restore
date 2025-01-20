@interface NUNIClassicResourceManager
+ (NUNIClassicResourceManager)sharedInstance;
+ (void)_deallocInstance:(id)a3;
- (NUNIClassicResourceManager)init;
- (id)provideAtlasBacking:(id)a3;
- (id)resourceProviderKey;
- (id)textureGroupWithSuffix:(id)a3;
- (void)_asyncDeallocInstance;
- (void)addClient;
- (void)dealloc;
- (void)removeClient;
@end

@implementation NUNIClassicResourceManager

+ (NUNIClassicResourceManager)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!__sharedInstance)
  {
    v3 = objc_alloc_init(NUNIClassicResourceManager);
    v4 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)__sharedInstance;
  return (NUNIClassicResourceManager *)v5;
}

+ (void)_deallocInstance:(id)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  v3 = (void *)__sharedInstance;
  __sharedInstance = 0;

  objc_sync_exit(obj);
}

- (NUNIClassicResourceManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)NUNIClassicResourceManager;
  id v2 = [(NUNIClassicResourceManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    resourceProviderKey = v2->_resourceProviderKey;
    v2->_resourceProviderKey = (CLKUIResourceProviderKey *)v3;

    uint64_t v5 = [MEMORY[0x263F32148] sharedDevice];
    device = v2->_device;
    v2->_device = (MTLDevice *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    textureGroupHashTable = v2->_textureGroupHashTable;
    v2->_textureGroupHashTable = (NSMapTable *)v7;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NUNIClassicResourceManager;
  [(NUNIClassicResourceManager *)&v2 dealloc];
}

- (void)_asyncDeallocInstance
{
  int v2 = [MEMORY[0x263F08B88] isMainThread];
  uint64_t v3 = objc_opt_class();
  if (v2)
  {
    [v3 _deallocInstance:0];
  }
  else
  {
    [v3 performSelectorOnMainThread:sel__deallocInstance_ withObject:0 waitUntilDone:0];
  }
}

- (void)addClient
{
  id obj = self;
  objc_sync_enter(obj);
  ++obj->_clients;
  objc_sync_exit(obj);
}

- (void)removeClient
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_clients - 1;
  v2->_clients = v3;
  objc_sync_exit(v2);

  if (!v3)
  {
    [(NUNIClassicResourceManager *)v2 _asyncDeallocInstance];
  }
}

- (id)textureGroupWithSuffix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_textureGroupHashTable objectForKey:v4];
  if (!v5)
  {
    v6 = objc_opt_new();
    for (uint64_t i = 0; i != 14; ++i)
    {
      v8 = [(__CFString *)textureGroupWithSuffix__uuids[i] stringByAppendingFormat:@"-%@", v4];
      v9 = [MEMORY[0x263F32178] textureWithProviderDelegate:self uuid:v8];
      [v6 addObject:v9];
    }
    uint64_t v5 = [[NUNIClassicTextureGroup alloc] initWithTextures:v6];
    [(NSMapTable *)self->_textureGroupHashTable setObject:v5 forKey:v4];
  }
  return v5;
}

- (id)provideAtlasBacking:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = NUNIBundle();
  uint64_t v5 = [v4 pathForResource:v3 ofType:@"art"];

  v6 = NUNILoggingObjectForDomain(0);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_21E8AA000, v6, OS_LOG_TYPE_DEFAULT, "providing artwork for %@ at %@", (uint8_t *)&v10, 0x16u);
    }

    v8 = [MEMORY[0x263F32110] atlasBackingWithArt:v5 uuid:v3];
  }
  else
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_21E8AA000, v6, OS_LOG_TYPE_DEFAULT, "missing artwork for %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)resourceProviderKey
{
  return self->_resourceProviderKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureGroupHashTable, 0);
  objc_storeStrong((id *)&self->_resourceProviderKey, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end