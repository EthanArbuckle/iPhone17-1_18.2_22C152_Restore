@interface REBlockClassLoader
- (BOOL)isEqual:(id)a3;
- (REBlockClassLoader)initWithBlock:(id)a3 configuration:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_enumerateBundleConfigurations:(id)a3;
- (void)_enumerateClassesWithBlock:(id)a3;
@end

@implementation REBlockClassLoader

- (void)_enumerateClassesWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  if (self->_block)
  {
    v5 = [(REClassLoader *)self configuration];
    uint64_t v6 = [v5 desiredClassForLoader];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = (*((void (**)(void))self->_block + 2))();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v12 isSubclassOfClass:v6]) {
            v4[2](v4, v12);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__REBlockClassLoader__enumerateClassesWithBlock___block_invoke;
    v13[3] = &unk_2644BD458;
    v13[4] = self;
    uint64_t v15 = v6;
    v14 = v4;
    [(REBlockClassLoader *)self _enumerateBundleConfigurations:v13];
  }
}

- (void)_enumerateBundleConfigurations:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  block = (void (**)(id))self->_block;
  if (block)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = block[2](block);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * v10) isSubclassOfClass:objc_opt_class()])
          {
            v11 = objc_opt_new();
            v4[2](v4, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (REBlockClassLoader)initWithBlock:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REBlockClassLoader;
  uint64_t v7 = [(REClassLoader *)&v11 initWithConfiguration:a4];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x223C31700](v6);
    id block = v7->_block;
    v7->_id block = (id)v8;
  }
  return v7;
}

void __49__REBlockClassLoader__enumerateClassesWithBlock___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  v5 = [v3 configuration];
  id v6 = (void *)[v5 desiredClassFromBundle:v4 forKey:0];

  if (v6 && [v6 isSubclassOfClass:a1[6]])
  {
    uint64_t v7 = *(void (**)(void))(a1[5] + 16);
    v7();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id block = self->_block;
  id v6 = [(REClassLoader *)self configuration];
  uint64_t v7 = (void *)[v4 initWithBlock:block configuration:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REBlockClassLoader *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = (void *)MEMORY[0x223C31700](self->_block);
      uint64_t v7 = (void *)MEMORY[0x223C31700](v5->_block);
      if (v6 == v7) {
        char v8 = 1;
      }
      else {
        char v8 = [v6 isEqual:v7];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end