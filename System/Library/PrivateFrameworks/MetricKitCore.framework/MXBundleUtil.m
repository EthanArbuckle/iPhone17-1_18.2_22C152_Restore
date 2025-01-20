@interface MXBundleUtil
- (BOOL)isAppExtensionFromBundleID:(id)a3;
- (BOOL)isAppInstalledForBundleID:(id)a3;
- (MXBundleUtil)init;
- (OS_os_log)logHandle;
- (id)_bundleIDFromURL:(id)a3;
- (id)bundleIDFromAuditToken:(id *)a3;
- (id)bundleIDFromPid:(int)a3;
- (id)mainAppBundleIDforExtension:(id)a3;
- (id)teamIDFromAuditToken:(id *)a3;
- (void)setLogHandle:(id)a3;
@end

@implementation MXBundleUtil

- (id)bundleIDFromAuditToken:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v4;
  v5 = SecTaskCreateWithAuditToken(0, &cf);
  if (v5)
  {
    v6 = v5;
    *(void *)cf.val = 0;
    v7 = (__CFString *)SecTaskCopySigningIdentifier(v5, (CFErrorRef *)&cf);
    if (*(void *)cf.val)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        -[MXBundleUtil bundleIDFromAuditToken:]((uint64_t *)&cf, logHandle);
      }
      CFRelease(*(CFTypeRef *)cf.val);
    }
    if (v7) {
      CFRelease(v7);
    }
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MXBundleUtil)init
{
  v6.receiver = self;
  v6.super_class = (Class)MXBundleUtil;
  v2 = [(MXBundleUtil *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.metrickit", "bundle.utility");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v3;

    if (!v2->_logHandle) {
      objc_storeStrong((id *)&v2->_logHandle, &_os_log_internal);
    }
  }
  return v2;
}

- (id)bundleIDFromPid:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v4 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", buffer, proc_pidpath(a3, buffer, 0x1000u), 4);
  v5 = [NSURL fileURLWithPath:v4];
  if (v5)
  {
    objc_super v6 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    v7 = [(MXBundleUtil *)self _bundleIDFromURL:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)teamIDFromAuditToken:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v4;
  SecTaskRef v5 = SecTaskCreateWithAuditToken(0, &cf);
  if (v5)
  {
    SecTaskRef v6 = v5;
    *(void *)cf.val = 0;
    v7 = (void *)SecTaskCopyTeamIdentifier();
    if (*(void *)cf.val)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        -[MXBundleUtil teamIDFromAuditToken:]((uint64_t *)&cf, logHandle);
      }
      CFRelease(*(CFTypeRef *)cf.val);
    }
    if (v7) {
      CFRelease(v7);
    }
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isAppExtensionFromBundleID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = 0;
    SecTaskRef v5 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v4 error:&v11];
    id v6 = v11;
    if (v6)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        [(MXBundleUtil *)(uint64_t)v4 isAppExtensionFromBundleID:v6];
      }
    }
    BOOL v8 = v5 != 0;
  }
  else
  {
    v9 = self->_logHandle;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MXBundleUtil isAppExtensionFromBundleID:](v9);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (id)mainAppBundleIDforExtension:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = 0;
    SecTaskRef v5 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v4 error:&v12];
    id v6 = v12;
    if (v6)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        [(MXBundleUtil *)(uint64_t)v4 isAppExtensionFromBundleID:v6];
      }
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v10 = [v5 containingBundleRecord];
      BOOL v8 = [v10 bundleIdentifier];
    }
  }
  else
  {
    v9 = self->_logHandle;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MXBundleUtil isAppExtensionFromBundleID:](v9);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isAppInstalledForBundleID:(id)a3
{
  os_log_t v3 = [MEMORY[0x263F01868] applicationProxyForIdentifier:a3];
  id v4 = [v3 appState];
  char v5 = [v4 isInstalled];

  return v5;
}

- (id)_bundleIDFromURL:(id)a3
{
  if (a3 && (Unique = (__CFBundle *)_CFBundleCreateUnique()) != 0)
  {
    id v4 = Unique;
    char v5 = CFBundleGetIdentifier(Unique);
    CFRelease(v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)bundleIDFromAuditToken:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_22BB49000, a2, OS_LOG_TYPE_ERROR, "Error getting signingIdentifier: %@", (uint8_t *)&v3, 0xCu);
}

- (void)teamIDFromAuditToken:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_22BB49000, a2, OS_LOG_TYPE_ERROR, "Error getting teamIdentifier: %@", (uint8_t *)&v3, 0xCu);
}

- (void)isAppExtensionFromBundleID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22BB49000, log, OS_LOG_TYPE_ERROR, "bundleID passed to isAppExtension function is nil", v1, 2u);
}

- (void)isAppExtensionFromBundleID:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 description];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8(&dword_22BB49000, v6, v7, "Failed to create bundle record for bundleID %@ and error %@", v8, v9, v10, v11, v12);
}

@end