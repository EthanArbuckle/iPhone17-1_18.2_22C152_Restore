@interface STStorageSharedContainer
- (NSArray)owners;
- (NSString)path;
- (STStorageApp)appRep;
- (STStorageSharedContainer)initWithPath:(id)a3 owners:(id)a4;
- (void)setAppRep:(id)a3;
- (void)setOwners:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation STStorageSharedContainer

- (STStorageSharedContainer)initWithPath:(id)a3 owners:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STStorageSharedContainer;
  v9 = [(STStorageSharedContainer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    [(STStorageSharedContainer *)v10 setOwners:v8];
  }

  return v10;
}

- (void)setOwners:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v30 = a3;
  v3 = (void *)[v30 mutableCopy];
  if ([v3 count])
  {
    int v4 = 0;
    id obj = 0;
    v5 = v3;
    do
    {
      v6 = [v5 firstObject];
      [v5 removeObjectAtIndex:0];
      id v7 = [v6 vendorName];
      if ([v7 length])
      {
        v32 = v6;
        int v33 = v4;
        v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v8 = v5;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v35;
          int v12 = 1;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v35 != v11) {
                objc_enumerationMutation(v8);
              }
              v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              v15 = [v14 vendorName];
              int v16 = [v15 isEqualToString:v7];

              if (v16) {
                ++v12;
              }
              else {
                [v3 addObject:v14];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v10);
        }
        else
        {
          int v12 = 1;
        }

        BOOL v17 = v12 <= v33;
        int v4 = v33;
        if (v17)
        {
          v6 = v32;
        }
        else
        {
          int v4 = v33 + 1;
          v6 = v32;
          id v18 = v32;

          id obj = v18;
        }

        v5 = v3;
      }
      else
      {
        v3 = v5;
      }
    }
    while ([v3 count]);
  }
  else
  {
    id obj = 0;
  }
  p_owners = &self->_owners;
  objc_storeStrong((id *)&self->_owners, a3);
  v20 = obj;
  if (!obj)
  {
    v20 = [(NSArray *)*p_owners firstObject];
  }
  p_appRep = &self->_appRep;
  objc_storeStrong((id *)&self->_appRep, v20);
  if (!obj) {

  }
  v22 = [(STStorageApp *)*p_appRep appIdentifier];
  [(STStorageApp *)self setAppIdentifier:v22];

  v23 = [(STStorageApp *)*p_appRep bundleIdentifier];
  [(STStorageApp *)self setBundleIdentifier:v23];

  [(STStorageApp *)self setAppKind:2];
  if (*p_appRep) {
    [(STStorageApp *)*p_appRep vendorName];
  }
  else {
  v24 = STStorageDataLocStr(@"SHARED_DATA");
  }
  [(STStorageApp *)self setName:v24];

  v25 = NSString;
  v26 = STStorageDataLocStr(@"SHARED_FMT %ld");
  v27 = objc_msgSend(v25, "localizedStringWithFormat:", v26, -[NSArray count](*p_owners, "count"));
  [(STStorageApp *)self setVendorName:v27];
}

- (NSArray)owners
{
  return self->_owners;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPath:(id)a3
{
}

- (STStorageApp)appRep
{
  return (STStorageApp *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAppRep:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_appRep, 0);

  objc_storeStrong((id *)&self->_owners, 0);
}

@end