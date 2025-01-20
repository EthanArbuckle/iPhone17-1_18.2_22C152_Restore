@interface BuddyFeatureFlags
+ (id)currentFlags;
- (BOOL)isIntelligenceEnabled;
- (BOOL)isLanguageAgnosticQuickStartEnabled;
- (BOOL)isStolenDeviceProtectionEnabled;
- (BOOL)isUseCDPContextSecretInsteadOfSBDSecretEnabled;
- (BOOL)isUtahEnabled;
- (void)isUseCDPContextSecretInsteadOfSBDSecretEnabled;
@end

@implementation BuddyFeatureFlags

+ (id)currentFlags
{
  if (currentFlags_onceToken != -1) {
    dispatch_once(&currentFlags_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)currentFlags_featureFlags;
  return v2;
}

uint64_t __33__BuddyFeatureFlags_currentFlags__block_invoke()
{
  currentFlags_featureFlags = objc_alloc_init(BuddyFeatureFlags);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)isLanguageAgnosticQuickStartEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isUseCDPContextSecretInsteadOfSBDSecretEnabled
{
  char v2 = _os_feature_enabled_impl();
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(BuddyFeatureFlags *)v2 isUseCDPContextSecretInsteadOfSBDSecretEnabled];
  }

  return v2;
}

- (BOOL)isStolenDeviceProtectionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isIntelligenceEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isUtahEnabled
{
  return _os_feature_enabled_impl();
}

- (void)isUseCDPContextSecretInsteadOfSBDSecretEnabled
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_DEBUG, "UseCDPContextSecretInsteadOfSBDSecret = %{BOOL}d", (uint8_t *)v2, 8u);
}

@end