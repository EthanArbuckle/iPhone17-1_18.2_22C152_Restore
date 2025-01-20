@interface REObjectClassLoader
- (BOOL)isEqual:(id)a3;
- (REObjectClassLoader)initWithObjects:(id)a3 configuration:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_enumerateClassesWithBlock:(id)a3;
- (void)enumerateObjectsWithBlock:(id)a3;
@end

@implementation REObjectClassLoader

- (void)enumerateObjectsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    v5 = [(REClassLoader *)self configuration];
    [v5 desiredClassForLoader];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = self->_objects;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_isKindOfClass()) {
            v4[2](v4, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __50__REObjectClassLoader__enumerateClassesWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = objc_opt_class();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REObjectClassLoader *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objects = self->_objects;
      v6 = v4->_objects;
      uint64_t v7 = objects;
      uint64_t v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSArray *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (REObjectClassLoader)initWithObjects:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REObjectClassLoader;
  uint64_t v8 = [(REClassLoader *)&v11 initWithConfiguration:a4];
  char v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_objects, a3);
  }

  return v9;
}

- (void)_enumerateClassesWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__REObjectClassLoader__enumerateClassesWithBlock___block_invoke;
    v6[3] = &unk_2644BD4D0;
    id v7 = v4;
    [(REObjectClassLoader *)self enumerateObjectsWithBlock:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  objects = self->_objects;
  v6 = [(REClassLoader *)self configuration];
  id v7 = (void *)[v4 initWithObjects:objects configuration:v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end