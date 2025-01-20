@interface NSXPCConnection(WeatherDaemon)
- (id)wd_bundleIdentifier;
- (id)wd_codesigningIdentifier;
- (void)wd_codesigningIdentifier;
@end

@implementation NSXPCConnection(WeatherDaemon)

- (id)wd_bundleIdentifier
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  [a1 auditToken];
  memset(buf, 0, sizeof(buf));
  v2 = MSVBundleIDForAuditToken();
  if (!v2)
  {
    v3 = WDLogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = a1;
      _os_log_impl(&dword_1A9410000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to retrieve bundle identifier of the requesting application from the audit_token_t; instead, "
        "using bundle identifier.",
        buf,
        0xCu);
    }
  }
  id v24 = 0;
  *(_OWORD *)buf = v25;
  *(_OWORD *)&buf[16] = v26;
  v4 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:buf error:&v24];
  id v5 = v24;
  if (v5)
  {
    v6 = WDLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1A9410000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to retrieve bundle extension record with error: %{public}@.", buf, 0x16u);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    v6 = v4;
    v8 = [v6 containingBundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
    }
    else
    {
      v10 = WDLogForCategory(1uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138544386;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v12;
        __int16 v28 = 2114;
        v29 = v8;
        __int16 v30 = 2114;
        id v31 = v14;
        _os_log_impl(&dword_1A9410000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting application extension %{public}@ (%{public}@) has a containing bundle which is not an application: %{public}@ (%{public}@).", buf, 0x34u);
      }
      id v9 = 0;
    }
    v15 = [v9 bundleIdentifier];
    if (v15)
    {
      v16 = WDLogForCategory(1uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v17);
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v23;
        __int16 v28 = 2114;
        v29 = v15;
        __int16 v30 = 2114;
        id v31 = v9;
        __int16 v32 = 2114;
        v33 = v19;
        _os_log_impl(&dword_1A9410000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Client is an application extension: %{public}@ (%{public}@). Using bundle identifier \"%{public}@\" from containing application: %{public}@ (%{public}@).", buf, 0x3Eu);
      }
      id v20 = v15;

      v2 = v20;
    }
  }
LABEL_20:
  id v21 = v2;

  return v21;
}

- (id)wd_codesigningIdentifier
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  [a1 auditToken];
  v2 = SecTaskCreateWithAuditToken(v1, &token);
  if (v2)
  {
    v3 = v2;
    CFErrorRef error = 0;
    v4 = SecTaskCopySigningIdentifier(v2, &error);
    if (error)
    {
      id v5 = WDLogForCategory(1uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(NSXPCConnection(WeatherDaemon) *)(uint64_t *)&error wd_codesigningIdentifier];
      }

      CFRelease(error);
    }
    CFRelease(v3);
  }
  else
  {
    v6 = WDLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSXPCConnection(WeatherDaemon) wd_codesigningIdentifier](v6);
    }

    v4 = 0;
  }
  return v4;
}

- (void)wd_codesigningIdentifier
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A9410000, a2, OS_LOG_TYPE_ERROR, "could not copy code signing identifier: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end