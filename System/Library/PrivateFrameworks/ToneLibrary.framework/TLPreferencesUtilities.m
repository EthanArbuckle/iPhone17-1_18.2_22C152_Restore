@interface TLPreferencesUtilities
+ (BOOL)_valueForEntitlement:(id)a3 task:(__SecTask *)a4;
+ (BOOL)canAccessNanoRegistry;
+ (__CFDictionary)_copyAllKeysAndValuesFromDomain:(__CFString *)a3 usingPreferencesScope:(int)a4;
+ (__CFString)copySharedResourcesPreferencesDomain;
+ (__CFString)copySharedResourcesPreferencesDomainForDomain:(__CFString *)a3;
+ (__CFString)preferencesDomain;
+ (id)_existingPerTopicPreferenceKeyPrefixesWithRegularPreferenceKeys:(const void *)a3 regularPreferenceKeysCount:(unint64_t)a4;
+ (id)perWatchPreferencesDomain;
+ (void)_enumerateKeysAndValuesWithEligibleKeyPrefixes:(id)a3 inDomain:(__CFString *)a4 usingPreferencesScope:(int)a5 withBlock:(id)a6;
+ (void)_setValue:(void *)a3 forKey:(__CFString *)a4 inDomain:(__CFString *)a5 usingPreferencesScope:(int)a6;
+ (void)_synchronizeDomain:(__CFString *)a3 usingPreferencesScope:(int)a4;
+ (void)migratePerTopicPreferencesInDomain:(__CFString *)a3 withRegularPreferenceKeys:(const void *)a4 regularPreferenceKeysCount:(unint64_t)a5 intoSinglePerTopicPreferenceWithSuffix:(id)a6 usingPreferencesScope:(int)a7;
@end

@implementation TLPreferencesUtilities

+ (__CFString)preferencesDomain
{
  return @"com.apple.springboard";
}

+ (__CFString)copySharedResourcesPreferencesDomain
{
  uint64_t v3 = [a1 preferencesDomain];

  return (__CFString *)[a1 copySharedResourcesPreferencesDomainForDomain:v3];
}

+ (__CFString)copySharedResourcesPreferencesDomainForDomain:(__CFString *)a3
{
  return (__CFString *)MEMORY[0x1F41092D8](a3, a2);
}

+ (id)perWatchPreferencesDomain
{
  return @"com.apple.ToneLibrary";
}

+ (void)migratePerTopicPreferencesInDomain:(__CFString *)a3 withRegularPreferenceKeys:(const void *)a4 regularPreferenceKeysCount:(unint64_t)a5 intoSinglePerTopicPreferenceWithSuffix:(id)a6 usingPreferencesScope:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a6;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v13 = [a1 _existingPerTopicPreferenceKeyPrefixesWithRegularPreferenceKeys:a4 regularPreferenceKeysCount:a5];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __175__TLPreferencesUtilities_migratePerTopicPreferencesInDomain_withRegularPreferenceKeys_regularPreferenceKeysCount_intoSinglePerTopicPreferenceWithSuffix_usingPreferencesScope___block_invoke;
  v26[3] = &unk_1E6C211B0;
  id v15 = v14;
  id v29 = a1;
  v30 = a3;
  int v31 = v7;
  id v27 = v15;
  v28 = &v32;
  [a1 _enumerateKeysAndValuesWithEligibleKeyPrefixes:v13 inDomain:a3 usingPreferencesScope:v7 withBlock:v26];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __175__TLPreferencesUtilities_migratePerTopicPreferencesInDomain_withRegularPreferenceKeys_regularPreferenceKeysCount_intoSinglePerTopicPreferenceWithSuffix_usingPreferencesScope___block_invoke_2;
  v20 = &unk_1E6C211D8;
  id v16 = v12;
  id v23 = a1;
  v24 = a3;
  int v25 = v7;
  id v21 = v16;
  v22 = &v32;
  [v15 enumerateKeysAndObjectsUsingBlock:&v17];
  if (*((unsigned char *)v33 + 24)) {
    objc_msgSend(a1, "_synchronizeDomain:usingPreferencesScope:", a3, v7, v17, v18, v19, v20);
  }

  _Block_object_dispose(&v32, 8);
}

void __175__TLPreferencesUtilities_migratePerTopicPreferencesInDomain_withRegularPreferenceKeys_regularPreferenceKeysCount_intoSinglePerTopicPreferenceWithSuffix_usingPreferencesScope___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v8, "length"));
  id v10 = [*(id *)(a1 + 32) objectForKey:v8];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(a1 + 32) setObject:v10 forKey:v8];
  }
  [v10 setObject:v7 forKey:v9];
  [*(id *)(a1 + 48) _setValue:0 forKey:v11 inDomain:*(void *)(a1 + 56) usingPreferencesScope:*(unsigned int *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __175__TLPreferencesUtilities_migratePerTopicPreferencesInDomain_withRegularPreferenceKeys_regularPreferenceKeysCount_intoSinglePerTopicPreferenceWithSuffix_usingPreferencesScope___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [v8 stringByAppendingString:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) _setValue:v5 forKey:v7 inDomain:*(void *)(a1 + 56) usingPreferencesScope:*(unsigned int *)(a1 + 64)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

+ (BOOL)canAccessNanoRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__TLPreferencesUtilities_canAccessNanoRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistryOnceToken != -1) {
    dispatch_once(&canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistryOnceToken, block);
  }
  return canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistry;
}

void __47__TLPreferencesUtilities_canAccessNanoRegistry__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  SecTaskRef v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    SecTaskRef v3 = v2;
    char v4 = [*(id *)(a1 + 32) _valueForEntitlement:@"com.apple.nano.nanoregistry.generalaccess" task:v2];
    char v5 = [*(id *)(a1 + 32) _valueForEntitlement:@"com.apple.nano.nanoregistry" task:v3];
    CFRelease(v3);
    canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistry = v4 | v5;
    id v6 = TLLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistry;
      _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "Can access NanoRegistry: %{BOOL}u.", (uint8_t *)v7, 8u);
    }
  }
}

+ (BOOL)_valueForEntitlement:(id)a3 task:(__SecTask *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v5 = (__CFString *)a3;
  CFErrorRef error = 0;
  id v6 = (void *)SecTaskCopyValueForEntitlement(a4, v5, &error);
  id v7 = TLLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "Value of \"%{public}@\" entitlement for current process: %{public}@.", buf, 0x16u);
  }

  if (v6)
  {
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CFBooleanGetTypeID()) {
      char v9 = [v6 BOOLValue];
    }
    else {
      char v9 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    char v9 = 0;
  }
  if (error) {
    CFRelease(error);
  }

  return v9;
}

+ (id)_existingPerTopicPreferenceKeyPrefixesWithRegularPreferenceKeys:(const void *)a3 regularPreferenceKeysCount:(unint64_t)a4
{
  for (id i = objc_alloc_init(MEMORY[0x1E4F1CA48]); a4; --a4)
  {
    if (*a3)
    {
      id v7 = [(id)*a3 stringByAppendingString:@"-"];
      [i addObject:v7];
    }
    ++a3;
  }

  return i;
}

+ (void)_enumerateKeysAndValuesWithEligibleKeyPrefixes:(id)a3 inDomain:(__CFString *)a4 usingPreferencesScope:(int)a5 withBlock:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [a1 _copyAllKeysAndValuesFromDomain:a4 usingPreferencesScope:v7];
  if (v12)
  {
    v13 = (void *)v12;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __114__TLPreferencesUtilities__enumerateKeysAndValuesWithEligibleKeyPrefixes_inDomain_usingPreferencesScope_withBlock___block_invoke;
    v14[3] = &unk_1E6C21200;
    id v15 = v10;
    id v16 = v11;
    [v13 enumerateKeysAndObjectsUsingBlock:v14];
    CFRelease(v13);
  }
}

void __114__TLPreferencesUtilities__enumerateKeysAndValuesWithEligibleKeyPrefixes_inDomain_usingPreferencesScope_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
      id v8 = v6;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            if (objc_msgSend(v7, "hasPrefix:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
            {
              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
              goto LABEL_13;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }
}

+ (__CFDictionary)_copyAllKeysAndValuesFromDomain:(__CFString *)a3 usingPreferencesScope:(int)a4
{
  if (!a4)
  {
    char v4 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
    return CFPreferencesCopyMultiple(0, a3, (CFStringRef)*MEMORY[0x1E4F1D3F0], *v4);
  }
  if (a4 == 1)
  {
    char v4 = (CFStringRef *)MEMORY[0x1E4F1D3E0];
    return CFPreferencesCopyMultiple(0, a3, (CFStringRef)*MEMORY[0x1E4F1D3F0], *v4);
  }
  return 0;
}

+ (void)_setValue:(void *)a3 forKey:(__CFString *)a4 inDomain:(__CFString *)a5 usingPreferencesScope:(int)a6
{
  if (a6 == 1)
  {
    CFPreferencesSetValue(a4, a3, a5, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  }
  else if (!a6)
  {
    CFPreferencesSetAppValue(a4, a3, a5);
  }
}

+ (void)_synchronizeDomain:(__CFString *)a3 usingPreferencesScope:(int)a4
{
  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    char v4 = (CFStringRef *)MEMORY[0x1E4F1D3E0];
  }
  else
  {
    char v4 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
  }
  CFPreferencesSynchronize(a3, (CFStringRef)*MEMORY[0x1E4F1D3F0], *v4);
}

@end