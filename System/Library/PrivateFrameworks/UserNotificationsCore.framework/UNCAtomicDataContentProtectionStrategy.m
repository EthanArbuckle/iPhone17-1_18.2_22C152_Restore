@interface UNCAtomicDataContentProtectionStrategy
- (BOOL)dataIsAvailableAtPath:(id)a3;
- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 atPath:(id)a4 error:(id *)a5;
- (UNCAtomicDataContentProtectionStrategy)initWithFileProtectionType:(id)a3 excludeFromBackup:(BOOL)a4;
- (id)dataAtPath:(id)a3;
- (unint64_t)_dataWritingOptionForFileProtectionType:(id)a3;
- (void)migrateDataAtPath:(id)a3 toPath:(id)a4;
@end

@implementation UNCAtomicDataContentProtectionStrategy

- (id)dataAtPath:(id)a3
{
  return (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:a3];
}

- (UNCAtomicDataContentProtectionStrategy)initWithFileProtectionType:(id)a3 excludeFromBackup:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNCAtomicDataContentProtectionStrategy;
  v7 = [(UNCAtomicDataContentProtectionStrategy *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_excludeFromBackup = a4;
    v7->_dataWritingFileProtection = [(UNCAtomicDataContentProtectionStrategy *)v7 _dataWritingOptionForFileProtectionType:v6];
  }

  return v8;
}

- (BOOL)dataIsAvailableAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (BOOL)writeData:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8 = a4;
  int v9 = [a3 writeToFile:v8 options:self->_dataWritingFileProtection | 1 error:a5];
  if (v9 && self->_excludeFromBackup)
  {
    objc_super v10 = [NSURL fileURLWithPath:v8];
    uint64_t v11 = *MEMORY[0x263EFF6B0];
    id v16 = 0;
    char v12 = [v10 setResourceValue:MEMORY[0x263EFFA88] forKey:v11 error:&v16];
    id v13 = v16;
    if ((v12 & 1) == 0)
    {
      v14 = *MEMORY[0x263F1E030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
        -[UNCAtomicDataContentProtectionStrategy writeData:atPath:error:]((uint64_t)v8, (uint64_t)v13, v14);
      }
    }
  }
  return v9;
}

- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = [MEMORY[0x263F08850] defaultManager];
  if ([v6 fileExistsAtPath:v5]
    && ([v6 removeItemAtPath:v5 error:a4] & 1) == 0)
  {
    id v8 = *MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
      -[UNCAtomicDataContentProtectionStrategy removeItemAtPath:error:]((uint64_t)v5, a4, v8);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)migrateDataAtPath:(id)a3 toPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x263F08850] defaultManager];
  id v10 = 0;
  [v7 moveItemAtPath:v5 toPath:v6 error:&v10];
  id v8 = v10;
  if (v8)
  {
    int v9 = *MEMORY[0x263F1E048];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E048], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v12 = v5;
      __int16 v13 = 2114;
      id v14 = v6;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_error_impl(&dword_2608DB000, v9, OS_LOG_TYPE_ERROR, "Migrating repository from: %{public}@ to: %{public}@ failed %{public}@", buf, 0x20u);
    }
  }
}

- (unint64_t)_dataWritingOptionForFileProtectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F08080]])
  {
    unint64_t v4 = 0x20000000;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F08098]])
  {
    unint64_t v4 = 0x40000000;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F08088]])
  {
    unint64_t v4 = 805306368;
  }
  else
  {
    unint64_t v4 = 0x10000000;
  }

  return v4;
}

- (void)writeData:(uint64_t)a1 atPath:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, a2, a3, "Could not set 'exclude from backup' key on %{public}@; error: %{public}@",
    *(void *)v3,
    *(void *)&v3[8],
    *(void *)&v3[16],
    *MEMORY[0x263EF8340]);
}

- (void)removeItemAtPath:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, (uint64_t)a2, a3, "Could not delete %{public}@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end