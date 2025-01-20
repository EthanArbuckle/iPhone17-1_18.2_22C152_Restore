@interface UNCHybridContentProtectionStrategy
- (BOOL)_mergeIsSupported;
- (BOOL)dataIsAvailableAtPath:(id)a3;
- (BOOL)isProtectedDataAvailable;
- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 atPath:(id)a4 error:(id *)a5;
- (UNCHybridContentProtectionStrategy)initWithFileProtectionType:(id)a3 excludeFromBackup:(BOOL)a4 delegate:(id)a5;
- (id)_strategyForProtectionState;
- (id)dataAtPath:(id)a3;
- (void)importDataWithImportHandler:(id)a3;
- (void)migrateDataAtPath:(id)a3 toPath:(id)a4;
@end

@implementation UNCHybridContentProtectionStrategy

- (UNCHybridContentProtectionStrategy)initWithFileProtectionType:(id)a3 excludeFromBackup:(BOOL)a4 delegate:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNCHybridContentProtectionStrategy;
  v11 = [(UNCHybridContentProtectionStrategy *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_minimumProtection, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13 = [[UNCAtomicDataContentProtectionStrategy alloc] initWithFileProtectionType:v12->_minimumProtection excludeFromBackup:v6];
    protectedContentAvailableStrategy = v12->_protectedContentAvailableStrategy;
    v12->_protectedContentAvailableStrategy = v13;

    v15 = [UNCFileHandleContentProtectionStrategy alloc];
    uint64_t v16 = [(UNCFileHandleContentProtectionStrategy *)v15 initWithFileProtectionType:*MEMORY[0x263F08088] excludeFromBackup:v6];
    protectedContentUnavailableStrategy = v12->_protectedContentUnavailableStrategy;
    v12->_protectedContentUnavailableStrategy = (UNCFileHandleContentProtectionStrategy *)v16;
  }
  return v12;
}

- (BOOL)isProtectedDataAvailable
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained isProtectedDataAvailable];

  if (v5) {
    return 1;
  }
  minimumProtection = self->_minimumProtection;
  if (minimumProtection == (NSString *)*MEMORY[0x263F08098])
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    char v9 = [v8 deviceUnlockedSinceBoot];

    if (v9) {
      return 1;
    }
    minimumProtection = self->_minimumProtection;
  }
  return minimumProtection == (NSString *)*MEMORY[0x263EFF658];
}

- (BOOL)dataIsAvailableAtPath:(id)a3
{
  id v4 = a3;
  char v5 = [(UNCHybridContentProtectionStrategy *)self _strategyForProtectionState];
  char v6 = [v5 dataIsAvailableAtPath:v4];

  return v6;
}

- (id)dataAtPath:(id)a3
{
  id v4 = a3;
  char v5 = [(UNCHybridContentProtectionStrategy *)self _strategyForProtectionState];
  char v6 = [v5 dataAtPath:v4];

  return v6;
}

- (BOOL)writeData:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(UNCHybridContentProtectionStrategy *)self _strategyForProtectionState];
  self->_needsMerge = v10 == self->_protectedContentUnavailableStrategy;
  LOBYTE(a5) = [(UNCFileHandleContentProtectionStrategy *)v10 writeData:v9 atPath:v8 error:a5];

  return (char)a5;
}

- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(UNCHybridContentProtectionStrategy *)self _strategyForProtectionState];
  LOBYTE(a4) = [v7 removeItemAtPath:v6 error:a4];

  return (char)a4;
}

- (void)migrateDataAtPath:(id)a3 toPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UNCHybridContentProtectionStrategy *)self _strategyForProtectionState];
  [v8 migrateDataAtPath:v7 toPath:v6];
}

- (void)importDataWithImportHandler:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  if ([(UNCHybridContentProtectionStrategy *)self isProtectedDataAvailable]
    && self->_needsMerge)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [(UNCFileHandleContentProtectionStrategy *)self->_protectedContentUnavailableStrategy allPaths];
    uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v22)
    {
      uint64_t v20 = *(void *)v31;
      v21 = self;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v7 = [(UNCFileHandleContentProtectionStrategy *)self->_protectedContentUnavailableStrategy allDataAtPath:v6];
          id v8 = [(UNCAtomicDataContentProtectionStrategy *)self->_protectedContentAvailableStrategy dataAtPath:v6];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v9 = v7;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
          v23 = v8;
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v27;
            do
            {
              uint64_t v13 = 0;
              v14 = v8;
              do
              {
                if (*(void *)v27 != v12) {
                  objc_enumerationMutation(v9);
                }
                v4[2](v4, *(void *)(*((void *)&v26 + 1) + 8 * v13), v14);
                id v8 = (id)objc_claimAutoreleasedReturnValue();

                ++v13;
                v14 = v8;
              }
              while (v11 != v13);
              uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v11);
          }

          id v25 = 0;
          self = v21;
          [(UNCHybridContentProtectionStrategy *)v21 writeData:v8 atPath:v6 error:&v25];
          id v15 = v25;
          protectedContentUnavailableStrategy = v21->_protectedContentUnavailableStrategy;
          id v24 = v15;
          [(UNCFileHandleContentProtectionStrategy *)protectedContentUnavailableStrategy removeAllDataAtPath:v6 error:&v24];
          id v17 = v24;
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v22);
    }

    v18 = self->_protectedContentUnavailableStrategy;
    self->_protectedContentUnavailableStrategy = 0;

    self->_needsMerge = 0;
  }
}

- (id)_strategyForProtectionState
{
  BOOL v3 = [(UNCHybridContentProtectionStrategy *)self isProtectedDataAvailable];
  uint64_t v4 = 40;
  if (v3) {
    uint64_t v4 = 32;
  }
  char v5 = *(Class *)((char *)&self->super.isa + v4);

  return v5;
}

- (BOOL)_mergeIsSupported
{
  return !self->_needsMerge || self->_minimumProtection != (NSString *)*MEMORY[0x263F080B0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedContentUnavailableStrategy, 0);
  objc_storeStrong((id *)&self->_protectedContentAvailableStrategy, 0);
  objc_storeStrong((id *)&self->_minimumProtection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end