@interface _PASEntitlement
+ (BOOL)_trueBooleanEntitlementCheckWithSecTask:(__SecTask *)a3 entitlement:(id)a4 logHandle:(id)a5;
+ (BOOL)hasTrueBooleanEntitlement:(id)a3 logHandle:(id)a4;
+ (BOOL)taskWithAuditToken:(id *)a3 hasTrueBooleanEntitlement:(id)a4 logHandle:(id)a5;
@end

@implementation _PASEntitlement

+ (BOOL)hasTrueBooleanEntitlement:(id)a3 logHandle:(id)a4
{
  id v5 = a3;
  id v6 = (id)MEMORY[0x1E4F14500];
  if (a4) {
    id v6 = a4;
  }
  v7 = v6;
  SecTaskRef v8 = SecTaskCreateFromSelf(0);
  if (v8)
  {
    SecTaskRef v9 = v8;
    char v10 = [(id)objc_opt_class() _trueBooleanEntitlementCheckWithSecTask:v8 entitlement:v5 logHandle:v7];
    CFRelease(v9);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1A32C4000, v7, OS_LOG_TYPE_ERROR, "_PASEntitlement: SecTaskCreateFromSelf() failed.", v12, 2u);
    }
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)taskWithAuditToken:(id *)a3 hasTrueBooleanEntitlement:(id)a4 logHandle:(id)a5
{
  id v7 = a4;
  id v8 = (id)MEMORY[0x1E4F14500];
  if (a5) {
    id v8 = a5;
  }
  SecTaskRef v9 = v8;
  long long v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v15.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v15.val[4] = v10;
  SecTaskRef v11 = SecTaskCreateWithAuditToken(0, &v15);
  if (v11)
  {
    SecTaskRef v12 = v11;
    char v13 = [(id)objc_opt_class() _trueBooleanEntitlementCheckWithSecTask:v11 entitlement:v7 logHandle:v9];
    CFRelease(v12);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15.val[0]) = 0;
      _os_log_error_impl(&dword_1A32C4000, v9, OS_LOG_TYPE_ERROR, "_PASEntitlement: SecTaskCreateWithAuditToken() failed.", (uint8_t *)&v15, 2u);
    }
    char v13 = 0;
  }

  return v13;
}

+ (BOOL)_trueBooleanEntitlementCheckWithSecTask:(__SecTask *)a3 entitlement:(id)a4 logHandle:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  SecTaskRef v9 = (__CFString *)a4;
  id v10 = a5;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"_PASEntitlement.m", 70, @"Invalid parameter not satisfying: %@", @"entitlementName" object file lineNumber description];
  }
  SecTaskRef v11 = (void *)MEMORY[0x1E4F14500];
  if (v10) {
    SecTaskRef v11 = v10;
  }
  SecTaskRef v12 = v11;

  CFErrorRef error = 0;
  CFBooleanRef v13 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(a3, v9, &error);
  if (v13)
  {
    CFBooleanRef v14 = v13;
    CFTypeID v15 = CFGetTypeID(v13);
    if (v15 == CFBooleanGetTypeID())
    {
      int Value = CFBooleanGetValue(v14);
      BOOL v17 = Value != 0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v18 = "NO";
        if (Value) {
          v18 = "YES";
        }
        *(_DWORD *)buf = 138412546;
        v24 = v9;
        __int16 v25 = 2080;
        v26 = (void *)v18;
        _os_log_impl(&dword_1A32C4000, v12, OS_LOG_TYPE_INFO, "_PASEntitlement: Found BOOLean entitlement: \"%@\" --> %s", buf, 0x16u);
      }
    }
    else
    {
      BOOL v17 = 0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl(&dword_1A32C4000, v12, OS_LOG_TYPE_DEFAULT, "_PASEntitlement: Found entitlement \"%@\" but it is not BOOLean.", buf, 0xCu);
        BOOL v17 = 0;
      }
    }
    CFRelease(v14);
  }
  else
  {
    CFErrorRef v19 = error;
    if (error)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v17 = 0;
LABEL_18:
        CFRelease(v19);
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412546;
      v24 = v9;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_error_impl(&dword_1A32C4000, v12, OS_LOG_TYPE_ERROR, "_PASEntitlement: SecTaskCopyValueForEntitlement failed for \"%@\", error: %@", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        BOOL v17 = 0;
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1A32C4000, v12, OS_LOG_TYPE_INFO, "_PASEntitlement: Entitlement \"%@\" is not present.", buf, 0xCu);
    }
    BOOL v17 = 0;
  }
  CFErrorRef v19 = error;
  if (error) {
    goto LABEL_18;
  }
LABEL_19:

  return v17;
}

@end