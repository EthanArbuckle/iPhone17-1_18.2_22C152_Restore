@interface VIEntitlementManager
+ (BOOL)BOOLForEntitlement:(id)a3;
+ (id)arrayForEntitlement:(id)a3;
+ (id)valueForEntitlement:(id)a3;
@end

@implementation VIEntitlementManager

+ (id)valueForEntitlement:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length] && (v4 = SecTaskCreateFromSelf(0)) != 0)
  {
    v5 = v4;
    CFErrorRef error = 0;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (error)
    {
      if (+[VILogger shouldLogMessage])
      {
        v7 = +[VILogger log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v11 = v3;
          __int16 v12 = 2114;
          CFErrorRef v13 = error;
          _os_log_impl(&dword_1DCCF9000, v7, OS_LOG_TYPE_ERROR, "Error reading entitlement %{public}@: %{public}@", buf, 0x16u);
        }
      }
      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)BOOLForEntitlement:(id)a3
{
  id v3 = a3;
  v4 = +[VIEntitlementManager valueForEntitlement:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[VIEntitlementManager valueForEntitlement:v3];
  }
  else
  {
    v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (id)arrayForEntitlement:(id)a3
{
  id v3 = a3;
  v4 = +[VIEntitlementManager valueForEntitlement:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[VIEntitlementManager valueForEntitlement:v3];
  }
  else
  {
    v5 = 0;
  }

  char v6 = (void *)[v5 copy];
  return v6;
}

@end