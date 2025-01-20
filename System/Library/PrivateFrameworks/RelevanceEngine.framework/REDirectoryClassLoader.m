@interface REDirectoryClassLoader
- (BOOL)isEqual:(id)a3;
- (REDirectoryClassLoader)initWithDirectories:(id)a3 dataSourceKey:(id)a4 configuration:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_enumerateBundleConfigurations:(id)a3;
- (void)_enumerateBundles:(id)a3;
- (void)_enumerateClassesWithBlock:(id)a3;
@end

@implementation REDirectoryClassLoader

- (BOOL)isEqual:(id)a3
{
  v4 = (REDirectoryClassLoader *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      urls = self->_urls;
      v7 = (NSArray *)v5[5];
      if (urls == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = urls;
        int v10 = [(NSArray *)v9 isEqual:v8];

        if (!v10)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      key = self->_key;
      v13 = (NSString *)v5[5];
      v14 = key;
      v15 = v14;
      if (v14 == v13) {
        char v11 = 1;
      }
      else {
        char v11 = [(NSString *)v14 isEqual:v13];
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (REDirectoryClassLoader)initWithDirectories:(id)a3 dataSourceKey:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)REDirectoryClassLoader;
  int v10 = [(REClassLoader *)&v16 initWithConfiguration:a5];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    urls = v10->_urls;
    v10->_urls = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    key = v10->_key;
    v10->_key = (NSString *)v13;
  }
  return v10;
}

- (void)_enumerateBundles:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  urls = self->_urls;
  if (urls)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obj = urls;
    uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(obj);
          }
          v7 = (void *)MEMORY[0x263F086E0];
          id v8 = [*(id *)(*((void *)&v26 + 1) + 8 * v6) path];
          id v9 = [v7 bundleWithPath:v8];

          v21 = v9;
          int v10 = [v9 pathsForResourcesOfType:@"bundle" inDirectory:@"."];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v23;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
                objc_super v16 = +[REBundleCache sharedInstance];
                v17 = [v16 bundleAtPath:v15];

                if (v17) {
                  v4[2](v4, v17);
                }

                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v12);
          }

          ++v6;
        }
        while (v6 != v20);
        uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v20);
    }
  }
}

- (void)_enumerateClassesWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(REClassLoader *)self configuration];
  uint64_t v6 = [v5 desiredClassForLoader];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke;
  v9[3] = &unk_2644BD480;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  uint64_t v13 = v6;
  id v7 = v4;
  id v8 = v5;
  [(REDirectoryClassLoader *)self _enumerateBundles:v9];
}

void __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 principalClass];
  if (v4)
  {
    v5 = v4;
    if ([v4 isSubclassOfClass:*(void *)(a1 + 56)])
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || [*(id *)(a1 + 32) shouldLoadBundleClass:v5 forKey:*(void *)(*(void *)(a1 + 40) + 48)])
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      id v7 = REBundleConfiguraitonFromBundle(v3);
      if (v7)
      {
        id v8 = [*(id *)(a1 + 40) configuration];
        uint64_t v9 = [v8 desiredClassFromBundle:v7 forKey:*(void *)(*(void *)(a1 + 40) + 48)];

        if (v9) {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
    }
  }
  else
  {
    uint64_t v6 = RELogForDomain(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke_cold_1((uint64_t)v3, v6);
    }
  }
}

- (void)_enumerateBundleConfigurations:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__REDirectoryClassLoader__enumerateBundleConfigurations___block_invoke;
  v6[3] = &unk_2644BD4A8;
  id v7 = v4;
  id v5 = v4;
  [(REDirectoryClassLoader *)self _enumerateBundles:v6];
}

uint64_t __57__REDirectoryClassLoader__enumerateBundleConfigurations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = REBundleConfiguraitonFromBundle(a2);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(REClassLoader *)self configuration];
  uint64_t v6 = (id *)[v4 initWithConfiguration:v5];

  objc_storeStrong(v6 + 5, self->_urls);
  objc_storeStrong(v6 + 6, self->_key);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

void __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "No principal class provided for bundle: %@", (uint8_t *)&v2, 0xCu);
}

@end