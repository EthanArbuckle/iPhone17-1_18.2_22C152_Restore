@interface SUUIApplicationControllerOptions
- (BOOL)isBootstrapScriptFallbackEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)pageRenderMetricsEnabled;
- (BOOL)requiresLocalBootstrapScript;
- (BOOL)supportsFullApplicationReload;
- (BOOL)useTransientStorageForTests;
- (SUUIApplicationControllerOptions)init;
- (double)bootstrapScriptFallbackMaximumAge;
- (double)bootstrapScriptTimeoutInterval;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)tabBarControllerStyle;
- (unint64_t)hash;
@end

@implementation SUUIApplicationControllerOptions

- (SUUIApplicationControllerOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIApplicationControllerOptions;
  result = [(SUUIApplicationControllerOptions *)&v3 init];
  if (result)
  {
    result->_supportsFullApplicationReload = 1;
    result->_tabBarControllerStyle = 0;
    *(_DWORD *)((char *)&result->_tabBarControllerStyle + 7) = 0;
    result->_bootstrapScriptFallbackMaximumAge = 604800.0;
    result->_bootstrapScriptTimeoutInterval = 30.0;
    result->_useTransientStorageForTests = 0;
  }
  return result;
}

- (int64_t)tabBarControllerStyle
{
  return self->_tabBarControllerStyle;
}

- (unint64_t)hash
{
  uint64_t v2 = 10;
  if (!self->_supportsFullApplicationReload) {
    uint64_t v2 = 0;
  }
  uint64_t v3 = v2 | self->_requiresLocalBootstrapScript;
  uint64_t v4 = 100;
  if (!self->_pageRenderMetricsEnabled) {
    uint64_t v4 = 0;
  }
  int64_t v5 = (v3 | v4) + 1000 * self->_tabBarControllerStyle;
  uint64_t v6 = 10000;
  if (!self->_bootstrapScriptFallbackEnabled) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v5
     + v6
     + 100000 * (unint64_t)self->_bootstrapScriptFallbackMaximumAge
     + 1000000 * (unint64_t)self->_bootstrapScriptTimeoutInterval;
  uint64_t v8 = 10000000;
  if (!self->_useTransientStorageForTests) {
    uint64_t v8 = 0;
  }
  return v7 + v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SUUIApplicationControllerOptions *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      BOOL v6 = self->_requiresLocalBootstrapScript == v5->_requiresLocalBootstrapScript
        && self->_supportsFullApplicationReload == v5->_supportsFullApplicationReload
        && self->_pageRenderMetricsEnabled == v5->_pageRenderMetricsEnabled
        && self->_tabBarControllerStyle == v5->_tabBarControllerStyle
        && self->_bootstrapScriptFallbackEnabled == v5->_bootstrapScriptFallbackEnabled
        && self->_bootstrapScriptFallbackMaximumAge == v5->_bootstrapScriptFallbackMaximumAge
        && self->_bootstrapScriptTimeoutInterval == v5->_bootstrapScriptTimeoutInterval
        && self->_useTransientStorageForTests == v5->_useTransientStorageForTests;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(SUUIMutableApplicationControllerOptions);
  [(SUUIMutableApplicationControllerOptions *)v4 setSupportsFullApplicationReload:self->_supportsFullApplicationReload];
  [(SUUIMutableApplicationControllerOptions *)v4 setTabBarControllerStyle:self->_tabBarControllerStyle];
  [(SUUIMutableApplicationControllerOptions *)v4 setPageRenderMetricsEnabled:self->_pageRenderMetricsEnabled];
  [(SUUIMutableApplicationControllerOptions *)v4 setRequiresLocalBootstrapScript:self->_requiresLocalBootstrapScript];
  [(SUUIMutableApplicationControllerOptions *)v4 setBootstrapScriptFallbackEnabled:self->_bootstrapScriptFallbackEnabled];
  [(SUUIMutableApplicationControllerOptions *)v4 setBootstrapScriptFallbackMaximumAge:self->_bootstrapScriptFallbackMaximumAge];
  [(SUUIMutableApplicationControllerOptions *)v4 setBootstrapScriptTimeoutInterval:self->_bootstrapScriptTimeoutInterval];
  [(SUUIMutableApplicationControllerOptions *)v4 setUseTransientStorageForTests:self->_useTransientStorageForTests];
  return v4;
}

- (BOOL)supportsFullApplicationReload
{
  return self->_supportsFullApplicationReload;
}

- (BOOL)pageRenderMetricsEnabled
{
  return self->_pageRenderMetricsEnabled;
}

- (BOOL)requiresLocalBootstrapScript
{
  return self->_requiresLocalBootstrapScript;
}

- (BOOL)isBootstrapScriptFallbackEnabled
{
  return self->_bootstrapScriptFallbackEnabled;
}

- (double)bootstrapScriptFallbackMaximumAge
{
  return self->_bootstrapScriptFallbackMaximumAge;
}

- (double)bootstrapScriptTimeoutInterval
{
  return self->_bootstrapScriptTimeoutInterval;
}

- (BOOL)useTransientStorageForTests
{
  return self->_useTransientStorageForTests;
}

@end