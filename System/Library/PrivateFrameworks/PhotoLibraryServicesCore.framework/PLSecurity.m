@interface PLSecurity
+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4;
+ (BOOL)connection:(id)a3 hasEntitlement:(id)a4;
+ (BOOL)connectionIsEntitledForPhotoKit:(id)a3;
+ (BOOL)containsPhotoKitEntitlement:(id)a3;
+ (BOOL)hasXPCStoreEntitlementOptInForToken:(id *)a3;
+ (BOOL)isEntitledForPhotoKit;
+ (BOOL)isEntitledForPhotoKitOrPrivatePhotosTCCForToken:(id *)a3;
+ (BOOL)secTask:(__SecTask *)a3 hasEntitlement:(id)a4;
+ (id)_secTask:(__SecTask *)a3 grantedEntitlements:(id)a4;
+ (id)connection:(id)a3 grantedEntitlements:(id)a4;
+ (id)connection:(id)a3 valueForEntitlement:(id)a4;
+ (id)connection:(id)a3 valuesForEntitlements:(id)a4;
@end

@implementation PLSecurity

+ (BOOL)secTask:(__SecTask *)a3 hasEntitlement:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = objc_opt_class();
  v10[0] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  v8 = [v6 _secTask:a3 grantedEntitlements:v7];

  LOBYTE(a3) = [v8 count] != 0;
  return (char)a3;
}

+ (id)_secTask:(__SecTask *)a3 grantedEntitlements:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  if (a3)
  {
    CFDictionaryRef v7 = SecTaskCopyValuesForEntitlements(a3, (CFArrayRef)v5, 0);
    if (v7)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            v14 = -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v13, (void)v17);
            int v15 = [v14 BOOLValue];

            if (v15) {
              [v6 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }
    }
  }

  return v6;
}

+ (BOOL)isEntitledForPhotoKitOrPrivatePhotosTCCForToken:(id *)a3
{
  [@"com.apple.photos.bourgeoisie" UTF8String];
  long long v12 = 0uLL;
  long long v13 = 0uLL;
  v3 = (void *)xpc_copy_entitlement_for_token();
  v4 = v3;
  if (v3 && xpc_BOOL_get_value(v3))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)*MEMORY[0x1E4FA9AE0], 0x8000100u);
    CFDictionaryRef v7 = (void *)xpc_copy_entitlement_for_token();
    id v8 = v7;
    if (v7) {
      BOOL v9 = CStringPtr == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __62__PLSecurity_isEntitledForPhotoKitOrPrivatePhotosTCCForToken___block_invoke;
      applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
      applier[4] = CStringPtr;
      BOOL v5 = !xpc_array_apply(v7, applier);
    }
  }
  return v5;
}

+ (BOOL)hasXPCStoreEntitlementOptInForToken:(id *)a3
{
  objc_msgSend(@"com.apple.private.photos.XPCStoreOptIn", "UTF8String", 0, 0, 0, 0);
  v3 = (void *)xpc_copy_entitlement_for_token();
  v4 = v3;
  if (v3) {
    BOOL value = xpc_BOOL_get_value(v3);
  }
  else {
    BOOL value = 0;
  }

  return value;
}

+ (BOOL)connection:(id)a3 hasEntitlement:(id)a4
{
  id v6 = a4;
  if (a3
    && (long long v12 = 0u,
        long long v13 = 0u,
        xpc_connection_get_audit_token(),
        memset(&v11, 0, sizeof(v11)),
        (SecTaskRef v7 = SecTaskCreateWithAuditToken(0, &v11)) != 0))
  {
    SecTaskRef v8 = v7;
    char v9 = [a1 secTask:v7 hasEntitlement:v6];
    CFRelease(v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)containsPhotoKitEntitlement:(id)a3
{
  return [a3 containsObject:@"com.apple.photos.bourgeoisie"];
}

+ (id)connection:(id)a3 grantedEntitlements:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  SecTaskRef v7 = [MEMORY[0x1E4F1CAD0] set];
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    xpc_connection_get_audit_token();
    memset(&v12, 0, sizeof(v12));
    SecTaskRef v8 = SecTaskCreateWithAuditToken(0, &v12);
    if (v8)
    {
      SecTaskRef v9 = v8;
      uint64_t v10 = [(id)objc_opt_class() _secTask:v8 grantedEntitlements:v6];

      CFRelease(v9);
      SecTaskRef v7 = (void *)v10;
    }
  }

  return v7;
}

+ (BOOL)connectionIsEntitledForPhotoKit:(id)a3
{
  return [a1 connection:a3 hasEntitlement:@"com.apple.photos.bourgeoisie"];
}

BOOL __62__PLSecurity_isEntitledForPhotoKitOrPrivatePhotosTCCForToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  BOOL v6 = 1;
  if (object_getClass(v4) == (Class)MEMORY[0x1E4F145F0])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (!strcmp(string_ptr, *(const char **)(a1 + 32))) {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)isEntitledForPhotoKit
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__PLSecurity_isEntitledForPhotoKit__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  pl_dispatch_once(&isEntitledForPhotoKit_onceToken, v3);
  return isEntitledForPhotoKit_selfEntitled;
}

void __35__PLSecurity_isEntitledForPhotoKit__block_invoke(uint64_t a1)
{
  SecTaskRef v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    SecTaskRef v3 = v2;
    isEntitledForPhotoKit_selfEntitled = [*(id *)(a1 + 32) secTask:v2 hasEntitlement:@"com.apple.photos.bourgeoisie"];
    CFRelease(v3);
  }
}

+ (id)connection:(id)a3 valueForEntitlement:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  BOOL v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  SecTaskRef v9 = [v6 arrayWithObjects:&v14 count:1];

  uint64_t v10 = objc_msgSend(a1, "connection:valuesForEntitlements:", v8, v9, v14, v15);

  audit_token_t v11 = [v10 allValues];
  audit_token_t v12 = [v11 firstObject];

  return v12;
}

+ (id)connection:(id)a3 valuesForEntitlements:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFArrayRef v6 = (const __CFArray *)a4;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    xpc_connection_get_audit_token();
    memset(&token, 0, sizeof(token));
    id v8 = SecTaskCreateWithAuditToken(0, &token);
    if (v8)
    {
      SecTaskRef v9 = v8;
      CFDictionaryRef v10 = SecTaskCopyValuesForEntitlements(v8, v6, 0);
      if (v10)
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        CFArrayRef v19 = v6;
        CFArrayRef v11 = v6;
        uint64_t v12 = [(__CFArray *)v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              long long v17 = [(__CFDictionary *)v10 objectForKey:v16];
              if (v17) {
                [v7 setObject:v17 forKey:v16];
              }
            }
            uint64_t v13 = [(__CFArray *)v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
          }
          while (v13);
        }

        CFArrayRef v6 = v19;
      }
      CFRelease(v9);
    }
  }

  return v7;
}

+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4
{
  id v5 = a4;
  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v11.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v11.val[4] = v6;
  SecTaskRef v7 = SecTaskCreateWithAuditToken(0, &v11);
  if (v7)
  {
    SecTaskRef v8 = v7;
    BOOL v9 = +[PLSecurity secTask:v7 hasEntitlement:v5];
    CFRelease(v8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end