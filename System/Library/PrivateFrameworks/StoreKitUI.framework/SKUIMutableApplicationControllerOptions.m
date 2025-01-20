@interface SKUIMutableApplicationControllerOptions
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBootstrapScriptFallbackEnabled:(BOOL)a3;
- (void)setBootstrapScriptFallbackMaximumAge:(double)a3;
- (void)setBootstrapScriptTimeoutInterval:(double)a3;
- (void)setPageRenderMetricsEnabled:(BOOL)a3;
- (void)setRequiresLocalBootstrapScript:(BOOL)a3;
- (void)setSupportsFullApplicationReload:(BOOL)a3;
- (void)setTabBarControllerStyle:(int64_t)a3;
- (void)setUseTransientStorageForTests:(BOOL)a3;
@end

@implementation SKUIMutableApplicationControllerOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(SKUIApplicationControllerOptions);
  *((unsigned char *)result + 8) = self->super._supportsFullApplicationReload;
  *((void *)result + 2) = self->super._tabBarControllerStyle;
  *((unsigned char *)result + 24) = self->super._pageRenderMetricsEnabled;
  *((unsigned char *)result + 25) = self->super._requiresLocalBootstrapScript;
  *((unsigned char *)result + 26) = self->super._bootstrapScriptFallbackEnabled;
  *((void *)result + 4) = *(void *)&self->super._bootstrapScriptFallbackMaximumAge;
  *((void *)result + 5) = *(void *)&self->super._bootstrapScriptTimeoutInterval;
  *((unsigned char *)result + 48) = self->super._useTransientStorageForTests;
  return result;
}

- (void)setSupportsFullApplicationReload:(BOOL)a3
{
  self->super._supportsFullApplicationReload = a3;
}

- (void)setTabBarControllerStyle:(int64_t)a3
{
  self->super._tabBarControllerStyle = a3;
}

- (void)setPageRenderMetricsEnabled:(BOOL)a3
{
  self->super._pageRenderMetricsEnabled = a3;
}

- (void)setRequiresLocalBootstrapScript:(BOOL)a3
{
  self->super._requiresLocalBootstrapScript = a3;
}

- (void)setBootstrapScriptFallbackEnabled:(BOOL)a3
{
  self->super._bootstrapScriptFallbackEnabled = a3;
}

- (void)setBootstrapScriptFallbackMaximumAge:(double)a3
{
  self->super._bootstrapScriptFallbackMaximumAge = a3;
}

- (void)setBootstrapScriptTimeoutInterval:(double)a3
{
  self->super._bootstrapScriptTimeoutInterval = a3;
}

- (void)setUseTransientStorageForTests:(BOOL)a3
{
  self->super._useTransientStorageForTests = a3;
}

@end