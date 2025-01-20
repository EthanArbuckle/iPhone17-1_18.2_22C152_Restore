@interface SRTCCStorePassThrough
+ (void)initialize;
- (BOOL)checkAccessForService:(id)a3 auditToken:(id *)a4;
- (BOOL)isOverriddenForService:(id)a3;
- (BOOL)resetService:(id)a3;
- (BOOL)resetService:(id)a3 forBundleId:(id)a4;
- (BOOL)setOverride:(BOOL)a3 forService:(id)a4;
- (BOOL)setValue:(BOOL)a3 forService:(id)a4 bundleId:(id)a5;
- (id)bundleIdentifiersDisabledForService:(id)a3;
- (id)bundleIdentifiersForService:(id)a3;
- (id)informationForBundleId:(id)a3;
- (int64_t)preflightAuthorizationStatusForService:(id)a3;
- (void)requestAccessForService:(id)a3 completion:(id)a4;
@end

@implementation SRTCCStorePassThrough

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogTCCStore = (uint64_t)os_log_create("com.apple.SensorKit", "TCCStore");
  }
}

- (id)bundleIdentifiersForService:(id)a3
{
  v3 = (void *)TCCAccessCopyBundleIdentifiersForService();

  return v3;
}

- (id)bundleIdentifiersDisabledForService:(id)a3
{
  v3 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();

  return v3;
}

- (BOOL)isOverriddenForService:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!TCCAccessGetOverride())
  {
    v4 = SRLogTCCStore;
    if (os_log_type_enabled((os_log_t)SRLogTCCStore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v7 = a3;
      _os_log_error_impl(&dword_25C11B000, v4, OS_LOG_TYPE_ERROR, "Could not retrieve authorization override information for TCC service %{public}@", buf, 0xCu);
    }
  }
  return 0;
}

- (id)informationForBundleId:(id)a3
{
  v3 = (void *)TCCAccessCopyInformationForBundleId();

  return v3;
}

- (BOOL)setOverride:(BOOL)a3 forService:(id)a4
{
  return TCCAccessSetOverride() != 0;
}

- (BOOL)resetService:(id)a3 forBundleId:(id)a4
{
  return TCCAccessResetForBundleId() != 0;
}

- (BOOL)resetService:(id)a3
{
  return TCCAccessReset() != 0;
}

- (BOOL)setValue:(BOOL)a3 forService:(id)a4 bundleId:(id)a5
{
  return TCCAccessSetForBundleId() != 0;
}

- (int64_t)preflightAuthorizationStatusForService:(id)a3
{
  int v3 = TCCAccessPreflight();
  if (v3 == 1) {
    return 2;
  }
  else {
    return v3 == 0;
  }
}

- (void)requestAccessForService:(id)a3 completion:(id)a4
{
}

- (BOOL)checkAccessForService:(id)a3 auditToken:(id *)a4
{
  return TCCAccessCheckAuditToken() != 0;
}

@end