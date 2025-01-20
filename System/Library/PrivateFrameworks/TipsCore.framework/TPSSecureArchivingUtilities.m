@interface TPSSecureArchivingUtilities
+ (id)syncQueue;
+ (id)unarchivedObjectOfClass:(Class)a3 forKey:(id)a4;
+ (id)unarchivedObjectOfClass:(Class)a3 forKey:(id)a4 userDefaults:(id)a5;
+ (id)unarchivedObjectOfClasses:(id)a3 forKey:(id)a4;
+ (id)unarchivedObjectOfClasses:(id)a3 forKey:(id)a4 userDefaults:(id)a5;
+ (void)archivedDataWithRootObject:(id)a3 forKey:(id)a4;
+ (void)archivedDataWithRootObject:(id)a3 forKey:(id)a4 userDefaults:(id)a5;
@end

@implementation TPSSecureArchivingUtilities

+ (void)archivedDataWithRootObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() archivedDataWithRootObject:v6 forKey:v5 userDefaults:0];
}

+ (void)archivedDataWithRootObject:(id)a3 forKey:(id)a4 userDefaults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__4;
  v18[4] = __Block_byref_object_dispose__4;
  id v10 = a5;
  id v19 = v10;
  v11 = [a1 syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__TPSSecureArchivingUtilities_archivedDataWithRootObject_forKey_userDefaults___block_invoke;
  block[3] = &unk_1E59073F8;
  id v16 = v9;
  v17 = v18;
  id v15 = v8;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(v11, block);

  _Block_object_dispose(v18, 8);
}

+ (id)unarchivedObjectOfClasses:(id)a3 forKey:(id)a4 userDefaults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__4;
  v21[4] = __Block_byref_object_dispose__4;
  id v10 = a5;
  id v22 = v10;
  v11 = [a1 syncQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke;
  v16[3] = &unk_1E5907D10;
  id v19 = v21;
  v20 = &v23;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  dispatch_sync(v11, v16);

  id v14 = (id)v24[5];
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

+ (id)syncQueue
{
  if (syncQueue_onceToken != -1) {
    dispatch_once(&syncQueue_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)syncQueue_syncQueue;
  return v2;
}

+ (id)unarchivedObjectOfClass:(Class)a3 forKey:(id)a4 userDefaults:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 setWithObject:a3];
  id v12 = [a1 unarchivedObjectOfClasses:v11 forKey:v10 userDefaults:v9];

  return v12;
}

void __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke(void *a1)
{
  v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  id v6 = [v2 objectForKey:a1[4]];
  if (v6)
  {
    uint64_t v7 = a1[5];
    id v15 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v7 fromData:v6 error:&v15];
    id v9 = v15;
    uint64_t v10 = *(void *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v8;

    if (v9)
    {
      id v12 = +[TPSLogger data];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke_cold_1();
      }

      uint64_t v13 = *(void *)(a1[7] + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
}

uint64_t __78__TPSSecureArchivingUtilities_archivedDataWithRootObject_forKey_userDefaults___block_invoke(void *a1)
{
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v3 = *(void *)(a1[6] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t v5 = a1[4];
  if (v5)
  {
    id v11 = 0;
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v11];
    id v7 = v11;
    uint64_t v8 = v7;
    if (v6)
    {
      [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v6 forKey:a1[5]];
    }
    else if (v7)
    {
      id v9 = +[TPSLogger data];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __78__TPSSecureArchivingUtilities_archivedDataWithRootObject_forKey_userDefaults___block_invoke_cold_1();
      }
    }
  }
  else
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) removeObjectForKey:a1[5]];
  }
  return [*(id *)(*(void *)(a1[6] + 8) + 40) synchronize];
}

+ (id)unarchivedObjectOfClass:(Class)a3 forKey:(id)a4
{
  return (id)[a1 unarchivedObjectOfClass:a3 forKey:a4 userDefaults:0];
}

void __40__TPSSecureArchivingUtilities_syncQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create(0, v2);
  v1 = (void *)syncQueue_syncQueue;
  syncQueue_syncQueue = (uint64_t)v0;
}

+ (id)unarchivedObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() unarchivedObjectOfClasses:v6 forKey:v5 userDefaults:0];

  return v7;
}

void __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19C8DC000, v0, v1, "Error secureUnarchiving key %@, error: %@");
}

void __77__TPSSecureArchivingUtilities_unarchivedObjectOfClasses_forKey_userDefaults___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19C8DC000, v0, v1, "Error secureUnarchiving key %@, exception: %@");
}

void __78__TPSSecureArchivingUtilities_archivedDataWithRootObject_forKey_userDefaults___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19C8DC000, v0, v1, "Error secureArchiving key %@, error: %@");
}

@end