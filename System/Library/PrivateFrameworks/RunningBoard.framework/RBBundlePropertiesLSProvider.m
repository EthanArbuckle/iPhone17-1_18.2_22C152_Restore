@interface RBBundlePropertiesLSProvider
- (NSString)debugDescription;
- (RBBundlePropertiesLSProvider)init;
- (RBBundlePropertiesLSProviderDelegate)delegate;
- (id)propertiesForIdentity:(id)a3;
- (void)_removeCachedValuesForAppProxies:(uint64_t)a1;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation RBBundlePropertiesLSProvider

- (RBBundlePropertiesLSProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)RBBundlePropertiesLSProvider;
  v2 = [(RBBundlePropertiesLSProvider *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    propertiesByIdentity = v3->_propertiesByIdentity;
    v3->_propertiesByIdentity = v4;

    [(NSCache *)v3->_propertiesByIdentity setCountLimit:5];
    v6 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__RBBundlePropertiesLSProvider_init__block_invoke;
    block[3] = &unk_2647C7CC8;
    v9 = v3;
    dispatch_async(v6, block);
  }
  return v3;
}

void __36__RBBundlePropertiesLSProvider_init__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"test"];
  v2 = [MEMORY[0x263F01880] defaultWorkspace];
  [v2 addObserver:*(void *)(a1 + 32)];
}

- (RBBundlePropertiesLSProviderDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (RBBundlePropertiesLSProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)propertiesForIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [v4 embeddedApplicationIdentifier];
  if (v5)
  {
  }
  else
  {
    v6 = [v4 xpcServiceIdentifier];

    if (!v6) {
      goto LABEL_12;
    }
  }
  v6 = [(NSCache *)self->_propertiesByIdentity objectForKey:v4];
  if (!v6)
  {
    if ([v4 isEmbeddedApplication])
    {
      v7 = (void *)MEMORY[0x263F01868];
      v8 = [v4 embeddedApplicationIdentifier];
      v9 = [v7 applicationProxyForIdentifier:v8];

      uint64_t v10 = -[RBLSBundleProperties initWithApplicationProxy:]((uint64_t)[RBLSBundleProperties alloc], v9);
    }
    else
    {
      if (![v4 isXPCService])
      {
        v6 = objc_alloc_init(RBLSBundleProperties);
        goto LABEL_11;
      }
      v11 = (void *)MEMORY[0x263F01888];
      v12 = [v4 xpcServiceIdentifier];
      v9 = [v11 bundleProxyForIdentifier:v12];

      uint64_t v10 = -[RBLSBundleProperties initWithBundleProxy:]((uint64_t)[RBLSBundleProperties alloc], v9);
    }
    v6 = (RBLSBundleProperties *)v10;

LABEL_11:
    [(NSCache *)self->_propertiesByIdentity setObject:v6 forKey:v4];
  }
LABEL_12:
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RBBundlePropertiesLSProvider;
  [(RBBundlePropertiesLSProvider *)&v4 dealloc];
}

- (NSString)debugDescription
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = [(NSCache *)self->_propertiesByIdentity mapTableRepresentation];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKey:v9];
        v11 = [v9 description];
        [v3 appendFormat:@"%@=%@\n\t\t", v11, v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  os_unfair_lock_unlock(&self->_lock);
  id v12 = [NSString alloc];
  v13 = [(id)objc_opt_class() description];
  v14 = (void *)[v12 initWithFormat:@"<%@| propertiesByIdentity:{\n\t\t%@}>", v13, v3];

  return (NSString *)v14;
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)_removeCachedValuesForAppProxies:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    objc_super v4 = [MEMORY[0x263EFF9C0] set];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)MEMORY[0x263F64598];
          v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) bundleIdentifier];
          id v12 = [v10 identityForEmbeddedApplicationIdentifier:v11];

          [*(id *)(a1 + 8) removeObjectForKey:v12];
          [v4 addObject:v12];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    [WeakRetained bundlePropertiesProvider:a1 didChangePropertiesForProcessIdentities:v4];

    id v3 = v14;
  }
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_propertiesByIdentity, 0);
}

@end