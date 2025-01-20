@interface USEntitlements
+ (id)_setValueForEntitlement:(__CFString *)a3 expectedElementClass:(Class)a4;
+ (id)_valueForEntitlement:(__CFString *)a3 expectedClass:(Class)a4;
+ (id)_valueForEntitlement:(__CFString *)a3 secTask:(__SecTask *)a4;
+ (id)readCurrentBundleIdentifier;
+ (id)readCurrentServices;
@end

@implementation USEntitlements

+ (id)readCurrentServices
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 _setValueForEntitlement:@"com.apple.usersafety.service" expectedElementClass:v3];
}

+ (id)_setValueForEntitlement:(__CFString *)a3 expectedElementClass:(Class)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  SecTaskRef v6 = SecTaskCreateFromSelf(0);
  if (v6)
  {
    SecTaskRef v7 = v6;
    v8 = [a1 _valueForEntitlement:a3 secTask:v6];
    if (objc_opt_isKindOfClass())
    {
      v9 = [MEMORY[0x263EFFA08] setWithObject:v8];
    }
    else
    {
      v9 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [MEMORY[0x263EFF9C0] set];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v10, "addObject:", v16, (void)v19);
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }

      uint64_t v17 = [v10 copy];
      v9 = (void *)v17;
    }
    CFRelease(v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_valueForEntitlement:(__CFString *)a3 secTask:(__SecTask *)a4
{
  v4 = (void *)SecTaskCopyValueForEntitlement(a4, a3, 0);

  return v4;
}

+ (id)readCurrentBundleIdentifier
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 _valueForEntitlement:@"application-identifier" expectedClass:v3];
}

+ (id)_valueForEntitlement:(__CFString *)a3 expectedClass:(Class)a4
{
  SecTaskRef v6 = SecTaskCreateFromSelf(0);
  if (v6)
  {
    SecTaskRef v7 = v6;
    v8 = [a1 _valueForEntitlement:a3 secTask:v6];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end