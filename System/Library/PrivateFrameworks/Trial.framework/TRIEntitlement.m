@interface TRIEntitlement
+ (BOOL)_isValidFormatForTeamId:(id)a3;
+ (BOOL)isEntitledToApplicationGroup:(id)a3 withAuditToken:(id *)a4;
+ (id)_teamIdFromSecTaskWithAuditToken:(id *)a3;
+ (id)applicationBundleIdentifierFromSelf;
+ (id)applicationBundleIdentifierWithAuditToken:(id *)a3;
+ (id)codeSignIdentifierWithAuditToken:(id *)a3;
+ (id)entitlementKeyForApplicationBundleIdentifier;
+ (id)objectForCurrentProcessEntitlement:(id)a3;
+ (id)objectForEntitlement:(id)a3 withAuditToken:(id *)a4;
+ (id)stringForCurrentProcessEntitlement:(id)a3;
+ (id)stringForEntitlement:(id)a3 fromSecTask:(__SecTask *)a4;
+ (id)stringForEntitlement:(id)a3 withAuditToken:(id *)a4;
+ (id)teamIdWithAuditToken:(id *)a3;
+ (id)valueForEntitlement:(id)a3 fromSecTask:(__SecTask *)a4 ofType:(unint64_t *)a5;
@end

@implementation TRIEntitlement

+ (id)applicationBundleIdentifierFromSelf
{
  v2 = [a1 entitlementKeyForApplicationBundleIdentifier];
  v3 = +[TRIEntitlement stringForCurrentProcessEntitlement:v2];

  return v3;
}

+ (id)stringForCurrentProcessEntitlement:(id)a3
{
  id v4 = a3;
  SecTaskRef v5 = SecTaskCreateFromSelf(0);
  if (v5)
  {
    SecTaskRef v6 = v5;
    v7 = [a1 stringForEntitlement:v4 fromSecTask:v5];
    CFRelease(v6);
  }
  else
  {
    v8 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "SecTaskCreateFromSelf() failed.", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)entitlementKeyForApplicationBundleIdentifier
{
  return @"application-identifier";
}

+ (id)objectForCurrentProcessEntitlement:(id)a3
{
  id v4 = a3;
  SecTaskRef v5 = SecTaskCreateFromSelf(0);
  if (v5)
  {
    SecTaskRef v6 = v5;
    v7 = [a1 valueForEntitlement:v4 fromSecTask:v5 ofType:0];
    CFRelease(v6);
  }
  else
  {
    v8 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)stringForEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  id v5 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  SecTaskRef v6 = [(id)objc_opt_class() valueForEntitlement:v5 fromSecTask:a4 ofType:&TypeID];

  return v6;
}

+ (id)valueForEntitlement:(id)a3 fromSecTask:(__SecTask *)a4 ofType:(unint64_t *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v9 = (__CFString *)a3;
  CFErrorRef error = 0;
  if (a5)
  {
    unint64_t v10 = *a5;
    if (v10 == CFStringGetTypeID() || v10 == CFArrayGetTypeID() || v10 == CFNumberGetTypeID())
    {
      v11 = (objc_class *)objc_opt_class();
      goto LABEL_8;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIEntitlement.m", 180, @"cannot validate entitlement with unsupported typeId %ld", *a5);
  }
  v11 = 0;
LABEL_8:
  v13 = SecTaskCopyValueForEntitlement(a4, v9, &error);
  if (!v13)
  {
    CFErrorRef v16 = error;
    v17 = TRILogCategory_ClientFramework();
    v15 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v9;
        __int16 v24 = 2112;
        CFErrorRef v25 = error;
        _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "SecTaskCopyValueForEntitlement failed for \"%@\", error: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_19D909000, v15, OS_LOG_TYPE_INFO, "Entitlement \"%@\" is not present.", buf, 0xCu);
    }
    goto LABEL_21;
  }
  v14 = v13;
  if (v11 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(v11);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v20;
      __int16 v24 = 2112;
      CFErrorRef v25 = (CFErrorRef)v9;
      _os_log_error_impl(&dword_19D909000, v18, OS_LOG_TYPE_ERROR, "Unexpected entitlement class %@ for entitlement \"%@\"", buf, 0x16u);
    }
    v15 = v14;
LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  v15 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    __int16 v24 = 2112;
    CFErrorRef v25 = (CFErrorRef)v14;
    _os_log_impl(&dword_19D909000, v15, OS_LOG_TYPE_INFO, "Found entitlement: \"%@\" --> %@", buf, 0x16u);
  }
LABEL_22:

  if (error) {
    CFRelease(error);
  }

  return v14;
}

+ (BOOL)isEntitledToApplicationGroup:(id)a3 withAuditToken:(id *)a4
{
  return 1;
}

+ (id)applicationBundleIdentifierWithAuditToken:(id *)a3
{
  id v4 = [a1 entitlementKeyForApplicationBundleIdentifier];
  long long v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  SecTaskRef v6 = +[TRIEntitlement stringForEntitlement:v4 withAuditToken:v8];

  return v6;
}

+ (id)codeSignIdentifierWithAuditToken:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFErrorRef error = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v4;
  long long v5 = SecTaskCreateWithAuditToken(v3, &token);
  if (v5)
  {
    SecTaskRef v6 = v5;
    v7 = (__CFString *)SecTaskCopySigningIdentifier(v5, &error);
    if (error)
    {
      v8 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = error;
        _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "SecTaskCopySigningIdentifier failed, error: %@", (uint8_t *)&token, 0xCu);
      }

      if (error) {
        CFRelease(error);
      }
    }
    CFRelease(v6);
  }
  else
  {
    v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", (uint8_t *)&token, 2u);
    }

    v7 = 0;
  }
  unint64_t v10 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    token.val[0] = 138412290;
    *(void *)&token.val[1] = v7;
    _os_log_impl(&dword_19D909000, v10, OS_LOG_TYPE_INFO, "code sign identifier from signature --> %@", (uint8_t *)&token, 0xCu);
  }

  return v7;
}

+ (id)teamIdWithAuditToken:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&a3->var0[4];
  long long v15 = *(_OWORD *)a3->var0;
  long long v16 = v4;
  long long v5 = +[TRIEntitlement _teamIdFromSecTaskWithAuditToken:&v15];
  SecTaskRef v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    long long v8 = *(_OWORD *)&a3->var0[4];
    long long v15 = *(_OWORD *)a3->var0;
    long long v16 = v8;
    id v7 = +[TRIEntitlement stringForEntitlement:@"com.apple.developer.team-identifier" withAuditToken:&v15];
  }
  v9 = v7;

  BOOL v10 = +[TRIEntitlement _isValidFormatForTeamId:v9];
  v11 = TRILogCategory_ClientFramework();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(v15) = 138412290;
      *(void *)((char *)&v15 + 4) = v9;
      _os_log_impl(&dword_19D909000, v12, OS_LOG_TYPE_INFO, "valid team id: %@", (uint8_t *)&v15, 0xCu);
    }

    id v13 = v9;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v15) = 138412290;
      *(void *)((char *)&v15 + 4) = v9;
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "invalid teamId: %@", (uint8_t *)&v15, 0xCu);
    }

    id v13 = 0;
  }

  return v13;
}

+ (id)_teamIdFromSecTaskWithAuditToken:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v4;
  SecTaskRef v5 = SecTaskCreateWithAuditToken(v3, &token);
  if (v5)
  {
    SecTaskRef v6 = v5;
    id v7 = (void *)SecTaskCopyTeamIdentifier();
    CFRelease(v6);
  }
  else
  {
    long long v8 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", (uint8_t *)&token, 2u);
    }

    id v7 = 0;
  }
  v9 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    token.val[0] = 138412290;
    *(void *)&token.val[1] = v7;
    _os_log_impl(&dword_19D909000, v9, OS_LOG_TYPE_INFO, "team id from signature --> %@", (uint8_t *)&token, 0xCu);
  }

  return v7;
}

+ (id)stringForEntitlement:(id)a3 withAuditToken:(id *)a4
{
  id v6 = a3;
  long long v7 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v13.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v13.val[4] = v7;
  SecTaskRef v8 = SecTaskCreateWithAuditToken(0, &v13);
  if (v8)
  {
    SecTaskRef v9 = v8;
    BOOL v10 = [a1 stringForEntitlement:v6 fromSecTask:v8];
    CFRelease(v9);
  }
  else
  {
    v11 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13.val[0]) = 0;
      _os_log_error_impl(&dword_19D909000, v11, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", (uint8_t *)&v13, 2u);
    }

    BOOL v10 = 0;
  }

  return v10;
}

+ (id)objectForEntitlement:(id)a3 withAuditToken:(id *)a4
{
  id v6 = a3;
  long long v7 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v13.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v13.val[4] = v7;
  SecTaskRef v8 = SecTaskCreateWithAuditToken(0, &v13);
  if (v8)
  {
    SecTaskRef v9 = v8;
    BOOL v10 = [a1 valueForEntitlement:v6 fromSecTask:v8 ofType:0];
    CFRelease(v9);
  }
  else
  {
    v11 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13.val[0]) = 0;
      _os_log_error_impl(&dword_19D909000, v11, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", (uint8_t *)&v13, 2u);
    }

    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_isValidFormatForTeamId:(id)a3
{
  id v3 = a3;
  if ([v3 length] != 10) {
    goto LABEL_13;
  }
  unint64_t v4 = 0;
  do
  {
    int v5 = [v3 characterAtIndex:v4];
    BOOL v7 = (v5 - 65) < 0x1A || (v5 - 48) < 0xA;
    if (v4 > 8) {
      break;
    }
    ++v4;
  }
  while (v7);
  if (v7) {
    BOOL v8 = 1;
  }
  else {
LABEL_13:
  }
    BOOL v8 = 0;

  return v8;
}

@end