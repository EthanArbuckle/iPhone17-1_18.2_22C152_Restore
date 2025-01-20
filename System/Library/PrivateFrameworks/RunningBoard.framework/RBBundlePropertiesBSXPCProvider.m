@interface RBBundlePropertiesBSXPCProvider
- (RBBundlePropertiesBSXPCProvider)init;
- (id)debugDescription;
- (id)propertiesForIdentifier:(id)a3;
- (void)removePropertiesForIdentifier:(id)a3;
@end

@implementation RBBundlePropertiesBSXPCProvider

- (id)propertiesForIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMapTable *)self->_propertiesByIdentifier objectForKey:v4];
  if (!v5)
  {
    v5 = -[RBXPCBundleProperties initWithPID:]([RBXPCBundleProperties alloc], "initWithPID:", [v4 pid]);
    [(NSMapTable *)self->_propertiesByIdentifier setObject:v5 forKey:v4];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)removePropertiesForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMapTable *)self->_propertiesByIdentifier removeObjectForKey:v5];

  os_unfair_lock_unlock(p_lock);
}

- (RBBundlePropertiesBSXPCProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)RBBundlePropertiesBSXPCProvider;
  v2 = [(RBBundlePropertiesBSXPCProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    propertiesByIdentifier = v3->_propertiesByIdentifier;
    v3->_propertiesByIdentifier = (NSMapTable *)v4;
  }
  return v3;
}

- (id)debugDescription
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_propertiesByIdentifier;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        v10 = [(NSMapTable *)self->_propertiesByIdentifier objectForKey:v9];
        if (v10)
        {
          v11 = [v9 description];
          [v3 appendFormat:@"%@=%@\n\t\t", v11, v10, (void)v16];
        }
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  id v12 = [NSString alloc];
  v13 = [(id)objc_opt_class() description];
  v14 = (void *)[v12 initWithFormat:@"<%@| propertiesByIdentifier:{\n\t\t%@}>", v13, v3];

  return v14;
}

- (void).cxx_destruct
{
}

@end