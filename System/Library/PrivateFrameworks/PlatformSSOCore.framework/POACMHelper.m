@interface POACMHelper
+ (id)platformSSOSystemKey;
+ (void)clearSmartCardPIN;
+ (void)createPlatformSSOSystemKey:(id)a3;
+ (void)platformSSOSystemKey;
@end

@implementation POACMHelper

+ (id)platformSSOSystemKey
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__POACMHelper_platformSSOSystemKey__block_invoke;
  v9[3] = &unk_265463F78;
  v9[4] = &v10;
  int v2 = ACMGetEnvironmentVariable(52, (uint64_t)v9);
  switch(v2)
  {
    case -14:
      goto LABEL_4;
    case 0:
      id v4 = (id)v11[5];
      goto LABEL_10;
    case -1:
LABEL_4:
      v3 = PO_LOG_POACMHelper();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        +[POACMHelper platformSSOSystemKey](v3);
      }

      break;
    default:
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __35__POACMHelper_platformSSOSystemKey__block_invoke_1;
      v7[3] = &__block_descriptor_36_e14___NSError_8__0l;
      int v8 = v2;
      id v5 = __35__POACMHelper_platformSSOSystemKey__block_invoke_1((uint64_t)v7);
      break;
  }
  id v4 = 0;
LABEL_10:
  _Block_object_dispose(&v10, 8);

  return v4;
}

uint64_t __35__POACMHelper_platformSSOSystemKey__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a2 length:a3];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

id __35__POACMHelper_platformSSOSystemKey__block_invoke_1(uint64_t a1)
{
  int v2 = +[POError errorWithCode:-1001 description:@"Failed to retrieve system key"];
  v3 = PO_LOG_POACMHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35__POACMHelper_platformSSOSystemKey__block_invoke_1_cold_1((uint64_t)v2, a1, v3);
  }

  return v2;
}

+ (void)createPlatformSSOSystemKey:(id)a3
{
  id v3 = a3;
  uint64_t v6 = [v3 bytes];
  size_t v4 = [v3 length];

  if (ACMSetEnvironmentVariable(52, &v6, v4)) {
    id v5 = __42__POACMHelper_createPlatformSSOSystemKey___block_invoke();
  }
}

id __42__POACMHelper_createPlatformSSOSystemKey___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to set system key"];
  v1 = PO_LOG_POACMHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v0, v1);
  }

  return v0;
}

+ (void)clearSmartCardPIN
{
  if (ACMSetEnvironmentVariable(20, 0, 0)) {
    id v2 = __32__POACMHelper_clearSmartCardPIN__block_invoke();
  }
}

id __32__POACMHelper_clearSmartCardPIN__block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to clear PIN"];
  v1 = PO_LOG_POACMHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v0, v1);
  }

  return v0;
}

+ (void)platformSSOSystemKey
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_259DFE000, log, OS_LOG_TYPE_DEBUG, "ACM not available", v1, 2u);
}

void __35__POACMHelper_platformSSOSystemKey__block_invoke_1_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(a2 + 32)];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_259DFE000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);
}

@end