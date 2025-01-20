@interface SSKNullTransformerRegistry
- (SSKNullTransformerRegistry)init;
- (id)addTransformer:(id)a3 withIdentifier:(id)a4;
- (id)transformDisplayConfiguration:(id)a3;
@end

@implementation SSKNullTransformerRegistry

- (SSKNullTransformerRegistry)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSKNullTransformerRegistry;
  v2 = [(SSKNullTransformerRegistry *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    lock_identifierToTransformers = v3->_lock_identifierToTransformers;
    v3->_lock_identifierToTransformers = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (id)addTransformer:(id)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  p_lock = &self->_lock;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_lock_identifierToTransformers setObject:v8 forKey:v6];

  id v9 = objc_alloc(MEMORY[0x263F29CD8]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__SSKNullTransformerRegistry_addTransformer_withIdentifier___block_invoke;
  v13[3] = &unk_2654B17B8;
  v13[4] = self;
  id v14 = v6;
  id v10 = v6;
  v11 = (void *)[v9 initWithIdentifier:v10 forReason:@"testing" queue:MEMORY[0x263EF83A0] invalidationBlock:v13];
  os_unfair_lock_unlock(p_lock);

  return v11;
}

void __60__SSKNullTransformerRegistry_addTransformer_withIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v2);
}

- (id)transformDisplayConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_lock_identifierToTransformers;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[NSMutableDictionary objectForKey:](self->_lock_identifierToTransformers, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        v12 = [v11 transformDisplayConfiguration:v4];
        [v5 unionSet:v12];
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (void).cxx_destruct
{
}

@end