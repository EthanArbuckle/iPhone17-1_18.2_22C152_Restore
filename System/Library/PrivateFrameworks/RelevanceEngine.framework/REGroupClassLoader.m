@interface REGroupClassLoader
- (BOOL)isEqual:(id)a3;
- (REGroupClassLoader)initWithLoaders:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_enumerateBundleConfigurations:(id)a3;
- (void)_enumerateClassesWithBlock:(id)a3;
- (void)enumerateObjectsWithBlock:(id)a3;
@end

@implementation REGroupClassLoader

- (void)_enumerateClassesWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_loaders;
  uint64_t v6 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "enumerateClassesWithBlock:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_enumerateBundleConfigurations:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_loaders;
  uint64_t v6 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "enumerateBundleConfigurations:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)enumerateObjectsWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_loaders;
  uint64_t v6 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "enumerateObjectsWithBlock:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (REGroupClassLoader)initWithLoaders:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REGroupClassLoader;
  v5 = [(REClassLoader *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    loaders = v5->_loaders;
    v5->_loaders = (NSOrderedSet *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSOrderedSet *)self->_loaders copyWithZone:a3];
  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REGroupClassLoader *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      loaders = self->_loaders;
      uint64_t v6 = v4->_loaders;
      uint64_t v7 = loaders;
      uint64_t v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSOrderedSet *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end