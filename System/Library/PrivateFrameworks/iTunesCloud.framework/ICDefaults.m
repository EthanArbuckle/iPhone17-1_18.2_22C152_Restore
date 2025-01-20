@interface ICDefaults
+ (ICDefaults)standardDefaults;
- (BOOL)_shouldSpoofIPadRequestProperties;
- (BOOL)_shouldSpoofIPhoneRequestProperties;
- (BOOL)allowLowAffinityRecommendations;
- (BOOL)automaticDownloadsEnabled;
- (BOOL)bypassBagSanityChecks;
- (BOOL)cachedU18MinorAccountStatus;
- (BOOL)enableMultipathTCP;
- (BOOL)ignoreExtendedCertificateValidation;
- (BOOL)isExplicitContentAllowedForCurrentYear;
- (BOOL)isExplicitContentAllowedForExpirationYear;
- (BOOL)isGrazingPathEnabled;
- (BOOL)isLegacyStoreCacheBusterEnabled;
- (BOOL)isPrivacyAcknowledgementDisabledForMusic;
- (BOOL)presetsFound;
- (BOOL)shouldBypassURLBagCache;
- (BOOL)shouldForceLibraryRecommendationAnalysis;
- (BOOL)shouldForcePrivacyAcknowledgementRequiredForMusic;
- (BOOL)shouldForceServerToUseDAAPDebugFeature;
- (BOOL)shouldForceServerToUseDAAPDebugFeatureAlwaysBackoff;
- (BOOL)shouldForceServerToUseDAAPDebugFeatureAlwaysPerformResetSync;
- (BOOL)shouldForceSilentAuthentications;
- (BOOL)shouldForceStreamingOnlyKeysForPlayback;
- (BOOL)shouldForceWatchInitialSyncCompletion;
- (BOOL)shouldForceiPhoneBehaviors;
- (BOOL)shouldReduceLibraryRecommendationsXPCInterval;
- (BOOL)shouldRunAgeVerification;
- (BOOL)shouldTreatFavoritingEntityRequestAsFailed;
- (BOOL)shouldTreatInitialSagaImportAsFailed;
- (BOOL)shouldTreatSagaAddComputerCallAsFailed;
- (BOOL)shouldTreatSubscriptionStatusAsExpired;
- (BOOL)shouldTreatSubscriptionStatusCheckAsIncomplete;
- (BOOL)socialProfileSupported;
- (ICAuthServiceClientTokenProviderDebugConfiguration)debugFetchConfiguration;
- (ICAuthServiceClientTokenProviderDebugConfiguration)debugRefreshConfiguration;
- (ICDefaults)init;
- (NSArray)prefetchKeyIdentifiers;
- (NSDate)ageVerificationExpirationDate;
- (NSDate)lastAllowedInteractiveAuthenticationTime;
- (NSDictionary)accountNotificationsNewMusicDictionary;
- (NSDictionary)accountNotificationsShowInLibraryDictionary;
- (NSDictionary)authServiceClientTokenCache;
- (NSDictionary)cachedHomeProperties;
- (NSDictionary)cachedMusicUserTokens;
- (NSDictionary)cachedSubscriptionStatus;
- (NSDictionary)lastCookieHeadersForRevokingMusicUserTokens;
- (NSDictionary)lastKnownLocalStoreAccountProperties;
- (NSDictionary)lastKnownSubscriptionStatusBaseCacheKey;
- (NSDictionary)lastKnownUserAgeVerificationState;
- (NSDictionary)mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates;
- (NSDictionary)pushNotificationState;
- (NSNumber)authServiceClientTokenTimeToLive;
- (NSNumber)batteryLevelOverride;
- (NSNumber)cachedSharedControlsCapability;
- (NSNumber)chargingStateOverride;
- (NSNumber)deviceClassOverride;
- (NSNumber)fairPlayDeviceTypeOverride;
- (NSNumber)lastActiveAccountDSID;
- (NSNumber)networkLinkQualityOverride;
- (NSNumber)networkTypeOverride;
- (NSNumber)requestTimeoutOverride;
- (NSNumber)secureKeyRenewalTimeOverride;
- (NSString)cloudMediaLibraryUID;
- (NSString)defaultStoreFront;
- (NSString)deviceModelOverride;
- (NSString)hardwarePlatformOverride;
- (NSString)lastKnownHouseholdID;
- (NSString)productPlatformOverride;
- (NSString)productVersionOverride;
- (NSUserDefaults)internalDefaults;
- (double)lastAuthenticationDialogResponseTime;
- (id)_musicUserDefaults;
- (void)_setOrRemoveInternalDefaultsObject:(id)a3 forKey:(id)a4;
- (void)_setOrRemoveObject:(id)a3 forKey:(id)a4;
- (void)addDebugConfiguration:(id)a3;
- (void)clearAllPresets;
- (void)clearShouldForceServerToUseDAAPDebugFeatures;
- (void)deleteAutomaticDownloadsKey;
- (void)setAccountNotificationsNewMusicDictionary:(id)a3;
- (void)setAccountNotificationsShowInLibraryDictionary:(id)a3;
- (void)setAgeVerificationExpirationDate:(id)a3;
- (void)setAuthServiceClientTokenCache:(id)a3;
- (void)setAutomaticDownloadsEnabled:(BOOL)a3;
- (void)setBatteryLevelOverride:(id)a3;
- (void)setCachedHomeProperties:(id)a3;
- (void)setCachedMusicUserTokens:(id)a3;
- (void)setCachedSharedControlsCapability:(id)a3;
- (void)setCachedSubscriptionStatus:(id)a3;
- (void)setCachedU18MinorAccountStatus:(BOOL)a3;
- (void)setChargingStateOverride:(id)a3;
- (void)setCloudMediaLibraryUID:(id)a3;
- (void)setDeviceClassOverride:(id)a3;
- (void)setDeviceModelOverride:(id)a3;
- (void)setExplicitContentAllowedForCurrentYear:(BOOL)a3;
- (void)setExplicitContentAllowedForExpirationYear:(BOOL)a3;
- (void)setFairPlayDeviceTypeOverride:(id)a3;
- (void)setGrazingPathEnabled:(BOOL)a3;
- (void)setHardwarePlatformOverride:(id)a3;
- (void)setIgnoreExtendedCertificateValidation:(BOOL)a3;
- (void)setLastActiveAccountDSID:(id)a3;
- (void)setLastAllowedInteractiveAuthenticationTime:(id)a3;
- (void)setLastAuthenticationDialogResponseTime:(double)a3;
- (void)setLastCookieHeadersForRevokingMusicUserTokens:(id)a3;
- (void)setLastKnownHouseholdID:(id)a3;
- (void)setLastKnownLocalStoreAccountProperties:(id)a3;
- (void)setLastKnownSubscriptionStatusBaseCacheKey:(id)a3;
- (void)setLastKnownUserAgeVerificationState:(id)a3;
- (void)setMediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates:(id)a3;
- (void)setNetworkLinkQualityOverride:(id)a3;
- (void)setNetworkTypeOverride:(id)a3;
- (void)setPrefetchKeyIdentifiers:(id)a3;
- (void)setProductPlatformOverride:(id)a3;
- (void)setProductVersionOverride:(id)a3;
- (void)setPushNotificationState:(id)a3;
- (void)setShouldForcePrivacyAcknowledgementRequiredForMusic:(BOOL)a3;
- (void)setShouldForceStreamingOnlyKeysForPlayback:(BOOL)a3;
- (void)setShouldRunAgeVerification:(BOOL)a3;
- (void)setSocialProfileSupported:(BOOL)a3;
- (void)synchronize;
@end

@implementation ICDefaults

+ (ICDefaults)standardDefaults
{
  if (standardDefaults_sOnceToken != -1) {
    dispatch_once(&standardDefaults_sOnceToken, &__block_literal_global_27604);
  }
  v2 = (void *)standardDefaults_sSharedInstance;

  return (ICDefaults *)v2;
}

- (BOOL)shouldBypassURLBagCache
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICInternalDefaultsKeyShouldBypassURLBagCache"];

  return v3;
}

- (NSString)productPlatformOverride
{
  char v3 = [(ICDefaults *)self internalDefaults];
  v4 = [v3 objectForKey:@"ICDefaultsKeyProductPlatformOverride"];

  if (_NSIsNSString())
  {
    v5 = v4;
  }
  else
  {
    v5 = @"iOS";
    if (![(ICDefaults *)self _shouldSpoofIPhoneRequestProperties]
      && ![(ICDefaults *)self _shouldSpoofIPadRequestProperties])
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (BOOL)_shouldSpoofIPadRequestProperties
{
  char v3 = [(ICDefaults *)self internalDefaults];

  if (!v3) {
    return 0;
  }
  v4 = [(ICDefaults *)self internalDefaults];
  char v5 = [v4 BOOLForKey:@"ICDefaultsKeySpoofIPad"];

  return v5;
}

- (BOOL)_shouldSpoofIPhoneRequestProperties
{
  char v3 = [(ICDefaults *)self internalDefaults];

  if (!v3) {
    return 0;
  }
  v4 = [(ICDefaults *)self internalDefaults];
  char v5 = [v4 BOOLForKey:@"ICDefaultsKeySpoofIPhone"];

  return v5;
}

- (NSUserDefaults)internalDefaults
{
  return self->_internalDefaults;
}

- (void)clearShouldForceServerToUseDAAPDebugFeatures
{
  char v3 = [(ICDefaults *)self internalDefaults];
  [v3 removeObjectForKey:@"ICInternalDefaultsKeyForceResetSyncRequiredResponseFromCloudLibrary"];

  id v4 = [(ICDefaults *)self internalDefaults];
  [v4 removeObjectForKey:@"ICInternalDefaultsKeyForceBackoffResponseFromCloudLibrary"];
}

- (NSDictionary)lastKnownLocalStoreAccountProperties
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyLastKnownLocalStoreAccountProperties"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSString)cloudMediaLibraryUID
{
  return [(NSUserDefaults *)self->_userDefaults stringForKey:@"ICDefaultsCloudMediaLibraryUID"];
}

- (NSNumber)requestTimeoutOverride
{
  id v3 = [(ICDefaults *)self internalDefaults];
  if (v3)
  {
    id v4 = [(ICDefaults *)self internalDefaults];
    char v5 = [v4 objectForKey:@"ICInternalDefaultsKeyRequestTimeoutOverrideValue"];
  }
  else
  {
    char v5 = 0;
  }

  if (_NSIsNSNumber()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (BOOL)cachedU18MinorAccountStatus
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"ICDefaultsKeyCachedU18MinorAccountStatus"];
}

- (BOOL)isPrivacyAcknowledgementDisabledForMusic
{
  v2 = [(ICDefaults *)self _musicUserDefaults];
  char v3 = [v2 BOOLForKey:@"suppressPrivacyWelcomeScreen"];

  return v3;
}

- (id)_musicUserDefaults
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_musicUserDefaults)
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    char v5 = [v4 bundleIdentifier];
    int v6 = [v5 isEqualToString:@"com.apple.Music"];

    if (v6)
    {
      v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    }
    else
    {
      v7 = (NSUserDefaults *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Music"];
    }
    musicUserDefaults = self->_musicUserDefaults;
    self->_musicUserDefaults = v7;
  }
  os_unfair_lock_unlock(p_lock);
  v9 = self->_musicUserDefaults;

  return v9;
}

- (BOOL)isLegacyStoreCacheBusterEnabled
{
  v2 = +[ICDeviceInfo currentDeviceInfo];
  int v3 = [v2 isInternalBuild];

  return v3 && CFPreferencesGetAppBooleanValue(@"ISCacheBuster", @"com.apple.itunesstored", 0) != 0;
}

- (NSNumber)networkTypeOverride
{
  v2 = [(ICDefaults *)self internalDefaults];
  int v3 = [v2 objectForKey:@"ICDefaultsKeyNetworkTypeOverride"];

  if (_NSIsNSNumber()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSNumber)networkLinkQualityOverride
{
  v2 = [(ICDefaults *)self internalDefaults];
  int v3 = [v2 objectForKey:@"ICDefaultsKeyNetworkLinkQualityOverride"];

  if (_NSIsNSNumber()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSNumber)chargingStateOverride
{
  v2 = [(ICDefaults *)self internalDefaults];
  int v3 = [v2 objectForKey:@"ICDefaultsKeyChargingStateOverride"];

  if (_NSIsNSNumber()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSNumber)batteryLevelOverride
{
  v2 = [(ICDefaults *)self internalDefaults];
  int v3 = [v2 objectForKey:@"ICDefaultsKeyBatteryLevelOverride"];

  if (_NSIsNSNumber()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (BOOL)shouldForcePrivacyAcknowledgementRequiredForMusic
{
  int v3 = [(ICDefaults *)self internalDefaults];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICDefaults *)self internalDefaults];
  char v5 = [v4 BOOLForKey:@"ICInternalDefaultsKeyShouldForcePrivacyAcknowledgementRequiredForMusic"];

  return v5;
}

uint64_t __30__ICDefaults_standardDefaults__block_invoke()
{
  standardDefaults_sSharedInstance = objc_alloc_init(ICDefaults);

  return MEMORY[0x1F41817F8]();
}

- (ICDefaults)init
{
  v11.receiver = self;
  v11.super_class = (Class)ICDefaults;
  v2 = [(ICDefaults *)&v11 init];
  int v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.itunescloud"];
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = (NSUserDefaults *)v4;

    int v6 = +[ICDeviceInfo currentDeviceInfo];
    int v7 = [v6 isInternalBuild];

    if (v7)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.itunescloud.internal"];
      internalDefaults = v3->_internalDefaults;
      v3->_internalDefaults = (NSUserDefaults *)v8;
    }
    [(NSUserDefaults *)v3->_userDefaults removeObjectForKey:@"ICDefaultsCachedSubscriptionStatusIsValid"];
  }
  return v3;
}

- (NSString)lastKnownHouseholdID
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyLastKnownHouseholdID"];
  if (_NSIsNSString()) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  uint64_t v4 = v3;

  return v4;
}

- (NSDictionary)lastKnownSubscriptionStatusBaseCacheKey
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyLastKnownSubscriptionStatusBaseCacheKey"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSArray)prefetchKeyIdentifiers
{
  return (NSArray *)[(NSUserDefaults *)self->_userDefaults valueForKey:@"ICDefaultsKeyPrefetchKeyIdentifiers"];
}

- (void)setLastKnownUserAgeVerificationState:(id)a3
{
}

- (NSDictionary)lastKnownUserAgeVerificationState
{
  return (NSDictionary *)[(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyLastKnownUserAgeVerificationState"];
}

- (void)_setOrRemoveObject:(id)a3 forKey:(id)a4
{
  userDefaults = self->_userDefaults;
  if (a3) {
    [(NSUserDefaults *)userDefaults setObject:a3 forKey:a4];
  }
  else {
    [(NSUserDefaults *)userDefaults removeObjectForKey:a4];
  }
}

- (void)synchronize
{
  [(NSUserDefaults *)self->_userDefaults synchronize];
  id v3 = [(ICDefaults *)self internalDefaults];
  [v3 synchronize];
}

- (NSString)deviceModelOverride
{
  id v3 = [(ICDefaults *)self internalDefaults];
  uint64_t v4 = [v3 objectForKey:@"ICDefaultsKeyDeviceModelOverride"];

  if (_NSIsNSString())
  {
    id v5 = v4;
LABEL_8:
    uint64_t v8 = v5;
    goto LABEL_9;
  }
  if ([(ICDefaults *)self _shouldSpoofIPhoneRequestProperties])
  {
    int v6 = @"iPhone";
    int v7 = @"12,3";
LABEL_7:
    id v5 = [(__CFString *)v6 stringByAppendingString:v7];
    goto LABEL_8;
  }
  if ([(ICDefaults *)self _shouldSpoofIPadRequestProperties])
  {
    int v6 = @"iPad";
    int v7 = @"8,12";
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_9:

  return (NSString *)v8;
}

- (NSString)productVersionOverride
{
  id v3 = [(ICDefaults *)self internalDefaults];
  uint64_t v4 = [v3 objectForKey:@"ICDefaultsKeyProductVersionOverride"];

  if (_NSIsNSString())
  {
    id v5 = v4;
LABEL_6:
    int v6 = v5;
    goto LABEL_7;
  }
  if ([(ICDefaults *)self _shouldSpoofIPhoneRequestProperties]
    || [(ICDefaults *)self _shouldSpoofIPadRequestProperties])
  {
    id v5 = [MEMORY[0x1E4F4DC48] productVersion];
    goto LABEL_6;
  }
  int v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (NSString)hardwarePlatformOverride
{
  id v3 = [(ICDefaults *)self internalDefaults];
  uint64_t v4 = [v3 objectForKey:@"ICDefaultsKeyHardwarePlatformOverride"];

  if (_NSIsNSString())
  {
    id v5 = v4;
  }
  else if ([(ICDefaults *)self _shouldSpoofIPhoneRequestProperties])
  {
    id v5 = @"t8030";
  }
  else if ([(ICDefaults *)self _shouldSpoofIPadRequestProperties])
  {
    id v5 = @"t8027";
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (NSNumber)fairPlayDeviceTypeOverride
{
  v2 = [(ICDefaults *)self internalDefaults];
  id v3 = [v2 objectForKey:@"ICDefaultsKeyFairPlayDeviceTypeOverride"];

  if (_NSIsNSNumber()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSNumber)deviceClassOverride
{
  id v3 = [(ICDefaults *)self internalDefaults];
  id v4 = [v3 objectForKey:@"ICDefaultsKeyDeviceClassOverride"];

  if (_NSIsNSNumber())
  {
    id v5 = v4;
  }
  else if ([(ICDefaults *)self _shouldSpoofIPhoneRequestProperties])
  {
    id v5 = &unk_1EF640A38;
  }
  else if ([(ICDefaults *)self _shouldSpoofIPadRequestProperties])
  {
    id v5 = &unk_1EF640A50;
  }
  else
  {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (BOOL)enableMultipathTCP
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICEnableMultipathTCP"];

  return v3;
}

- (BOOL)ignoreExtendedCertificateValidation
{
  return CFPreferencesGetAppBooleanValue(@"ISIgnoreExtendedValidation", @"com.apple.itunesstored", 0) != 0;
}

- (void)setShouldForcePrivacyAcknowledgementRequiredForMusic:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICDefaults *)self internalDefaults];
  [v4 setBool:v3 forKey:@"ICInternalDefaultsKeyShouldForcePrivacyAcknowledgementRequiredForMusic"];
}

- (NSDictionary)cachedSubscriptionStatus
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsCachedSubscriptionStatus"];
  if (_NSIsNSDictionary()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaults, 0);
  objc_storeStrong((id *)&self->_musicUserDefaults, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)clearAllPresets
{
  [(NSUserDefaults *)self->_internalDefaults removeObjectForKey:@"ICDefaultsKeyDebugFetchConfiguration"];
  [(NSUserDefaults *)self->_internalDefaults removeObjectForKey:@"ICDefaultsKeyDebugRefreshConfiguration"];
  internalDefaults = self->_internalDefaults;

  [(NSUserDefaults *)internalDefaults synchronize];
}

- (void)addDebugConfiguration:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28DB0];
  id v9 = 0;
  id v5 = a3;
  int v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v9];
  id v7 = v9;
  [v5 commandOption];
  [(NSUserDefaults *)self->_internalDefaults setObject:v6 forKey:@"ICDefaultsKeyDebugFetchConfiguration"];
  char v8 = [v5 commandOption];

  if ((v8 & 2) != 0) {
    [(NSUserDefaults *)self->_internalDefaults setObject:v6 forKey:@"ICDefaultsKeyDebugRefreshConfiguration"];
  }
  [(NSUserDefaults *)self->_internalDefaults synchronize];
}

- (BOOL)presetsFound
{
  v2 = self;
  uint64_t v3 = [(NSUserDefaults *)self->_internalDefaults objectForKey:@"ICDefaultsKeyDebugFetchConfiguration"];
  uint64_t v4 = [(NSUserDefaults *)v2->_internalDefaults objectForKey:@"ICDefaultsKeyDebugRefreshConfiguration"];
  LOBYTE(v2) = (v3 | v4) != 0;

  return (char)v2;
}

- (ICAuthServiceClientTokenProviderDebugConfiguration)debugRefreshConfiguration
{
  v2 = [(NSUserDefaults *)self->_internalDefaults objectForKey:@"ICDefaultsKeyDebugRefreshConfiguration"];
  uint64_t v5 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v5];

  return (ICAuthServiceClientTokenProviderDebugConfiguration *)v3;
}

- (ICAuthServiceClientTokenProviderDebugConfiguration)debugFetchConfiguration
{
  v2 = [(NSUserDefaults *)self->_internalDefaults objectForKey:@"ICDefaultsKeyDebugFetchConfiguration"];
  uint64_t v5 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v5];

  return (ICAuthServiceClientTokenProviderDebugConfiguration *)v3;
}

- (void)_setOrRemoveInternalDefaultsObject:(id)a3 forKey:(id)a4
{
  internalDefaults = self->_internalDefaults;
  if (a3) {
    [(NSUserDefaults *)internalDefaults setObject:a3 forKey:a4];
  }
  else {
    [(NSUserDefaults *)internalDefaults removeObjectForKey:a4];
  }
}

- (BOOL)shouldForceSilentAuthentications
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICDefaultsKeyForceSilentAuthentications"];

  return v3;
}

- (BOOL)shouldForceWatchInitialSyncCompletion
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICInternalDefaultsKeyForceWatchInitialSyncCompletion"];

  return v3;
}

- (void)setPrefetchKeyIdentifiers:(id)a3
{
  id v5 = a3;
  if (_NSIsNSArray()) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  [(NSUserDefaults *)self->_userDefaults setValue:v4 forKey:@"ICDefaultsKeyPrefetchKeyIdentifiers"];
}

- (void)setSocialProfileSupported:(BOOL)a3
{
  userDefaults = self->_userDefaults;
  id v4 = [NSNumber numberWithBool:a3];
  [(NSUserDefaults *)userDefaults setValue:v4 forKey:@"ICDefaultsKeySocialProfileSupported"];
}

- (BOOL)socialProfileSupported
{
  v2 = [(NSUserDefaults *)self->_userDefaults valueForKey:@"ICDefaultsKeySocialProfileSupported"];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setCachedSharedControlsCapability:(id)a3
{
}

- (NSNumber)cachedSharedControlsCapability
{
  return (NSNumber *)[(NSUserDefaults *)self->_userDefaults valueForKey:@"ICDefaultsKeySharedControlsCapability"];
}

- (NSNumber)secureKeyRenewalTimeOverride
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 objectForKey:@"ICInternalDefaultsKeySecureKeyRenewalTimeOverride"];

  return (NSNumber *)v3;
}

- (BOOL)allowLowAffinityRecommendations
{
  v2 = [(ICDefaults *)self _musicUserDefaults];
  char v3 = [v2 BOOLForKey:@"allowLowAffinityRecommendations"];

  return v3;
}

- (void)deleteAutomaticDownloadsKey
{
  char v3 = [(ICDefaults *)self _musicUserDefaults];
  char v4 = [v3 valueForKey:@"DownloadOnAddToLibrary"];

  if (v4)
  {
    id v5 = [(ICDefaults *)self _musicUserDefaults];
    [v5 removeObjectForKey:@"DownloadOnAddToLibrary"];

    id v6 = [(ICDefaults *)self _musicUserDefaults];
    [v6 synchronize];
  }
}

- (void)setAutomaticDownloadsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICDefaults *)self _musicUserDefaults];
  [v5 setBool:v3 forKey:@"DownloadOnAddToLibrary"];

  [(ICDefaults *)self synchronize];
}

- (BOOL)automaticDownloadsEnabled
{
  v2 = [(ICDefaults *)self _musicUserDefaults];
  char v3 = [v2 BOOLForKey:@"DownloadOnAddToLibrary"];

  return v3;
}

- (BOOL)shouldTreatInitialSagaImportAsFailed
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICInternalDefaultsKeyTreatInitialSagaImportAsFailed"];

  return v3;
}

- (BOOL)shouldTreatSagaAddComputerCallAsFailed
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICInternalDefaultsKeyTreatSagaAddComputerCallAsFailed"];

  return v3;
}

- (BOOL)shouldForceServerToUseDAAPDebugFeatureAlwaysBackoff
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICInternalDefaultsKeyForceBackoffResponseFromCloudLibrary"];

  return v3;
}

- (BOOL)shouldForceServerToUseDAAPDebugFeatureAlwaysPerformResetSync
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICInternalDefaultsKeyForceResetSyncRequiredResponseFromCloudLibrary"];

  return v3;
}

- (BOOL)shouldForceServerToUseDAAPDebugFeature
{
  char v3 = [(ICDefaults *)self internalDefaults];
  if ([v3 BOOLForKey:@"ICInternalDefaultsKeyForceResetSyncRequiredResponseFromCloudLibrary"])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(ICDefaults *)self internalDefaults];
    char v4 = [v5 BOOLForKey:@"ICInternalDefaultsKeyForceBackoffResponseFromCloudLibrary"];
  }
  return v4;
}

- (BOOL)shouldTreatFavoritingEntityRequestAsFailed
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICInternalDefaultsKeyTreatFavoriteEntityRequestAsFailed"];

  return v3;
}

- (BOOL)shouldTreatSubscriptionStatusCheckAsIncomplete
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICInternalDefaultsKeyTreatSubscriptionStatusAsIncomplete"];

  return v3;
}

- (BOOL)shouldTreatSubscriptionStatusAsExpired
{
  v2 = [(ICDefaults *)self internalDefaults];
  char v3 = [v2 BOOLForKey:@"ICInternalDefaultsKeyTreatSubscriptionStatusAsExpired"];

  return v3;
}

- (BOOL)shouldReduceLibraryRecommendationsXPCInterval
{
  v2 = [(ICDefaults *)self _musicUserDefaults];
  char v3 = [v2 BOOLForKey:@"reduceLibraryRecommendationsXPCInterval"];

  return v3;
}

- (BOOL)shouldForceLibraryRecommendationAnalysis
{
  v2 = [(ICDefaults *)self _musicUserDefaults];
  char v3 = [v2 BOOLForKey:@"forceLibraryRecommendations"];

  return v3;
}

- (void)setGrazingPathEnabled:(BOOL)a3
{
}

- (BOOL)isGrazingPathEnabled
{
  char v3 = [(NSUserDefaults *)self->_userDefaults valueForKey:@"ICDefaultsKeyGrazingPathEnabled"];

  if (!v3) {
    return 1;
  }
  userDefaults = self->_userDefaults;

  return [(NSUserDefaults *)userDefaults BOOLForKey:@"ICDefaultsKeyGrazingPathEnabled"];
}

- (void)setExplicitContentAllowedForExpirationYear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICDefaults *)self internalDefaults];
  [v4 setBool:v3 forKey:@"ICDefaultsKeyExplicitContentAllowedForExpirationYear"];
}

- (BOOL)isExplicitContentAllowedForExpirationYear
{
  uint64_t v3 = [(ICDefaults *)self internalDefaults];
  if (!v3) {
    return 1;
  }
  id v4 = (void *)v3;
  id v5 = [(ICDefaults *)self internalDefaults];
  id v6 = [v5 valueForKey:@"ICDefaultsKeyExplicitContentAllowedForExpirationYear"];

  if (!v6) {
    return 1;
  }
  id v7 = [(ICDefaults *)self internalDefaults];
  char v8 = [v7 BOOLForKey:@"ICDefaultsKeyExplicitContentAllowedForExpirationYear"];

  return v8;
}

- (void)setExplicitContentAllowedForCurrentYear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICDefaults *)self internalDefaults];
  [v4 setBool:v3 forKey:@"ICDefaultsKeyExplicitContentAllowedForCurrentYear"];
}

- (BOOL)isExplicitContentAllowedForCurrentYear
{
  uint64_t v3 = [(ICDefaults *)self internalDefaults];
  if (!v3) {
    return 1;
  }
  id v4 = (void *)v3;
  id v5 = [(ICDefaults *)self internalDefaults];
  id v6 = [v5 valueForKey:@"ICDefaultsKeyExplicitContentAllowedForCurrentYear"];

  if (!v6) {
    return 1;
  }
  id v7 = [(ICDefaults *)self internalDefaults];
  char v8 = [v7 BOOLForKey:@"ICDefaultsKeyExplicitContentAllowedForCurrentYear"];

  return v8;
}

- (void)setAgeVerificationExpirationDate:(id)a3
{
  id v6 = a3;
  id v4 = [(ICDefaults *)self internalDefaults];
  id v5 = v4;
  if (v6) {
    [v4 setObject:v6 forKey:@"ICDefaultsKeyAgeVerificationExpirationDate"];
  }
  else {
    [v4 removeObjectForKey:@"ICDefaultsKeyAgeVerificationExpirationDate"];
  }
}

- (NSDate)ageVerificationExpirationDate
{
  id v3 = [(ICDefaults *)self internalDefaults];

  if (v3)
  {
    id v4 = [(ICDefaults *)self internalDefaults];
    id v5 = [v4 objectForKey:@"ICDefaultsKeyAgeVerificationExpirationDate"];

    if (_NSIsNSDate()) {
      id v3 = v5;
    }
    else {
      id v3 = 0;
    }
  }

  return (NSDate *)v3;
}

- (void)setShouldRunAgeVerification:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICDefaults *)self internalDefaults];
  [v4 setBool:v3 forKey:@"ICDefaultsKeyShouldRunAgeVerification"];
}

- (BOOL)shouldRunAgeVerification
{
  BOOL v3 = [(ICDefaults *)self internalDefaults];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICDefaults *)self internalDefaults];
  char v5 = [v4 BOOLForKey:@"ICDefaultsKeyShouldRunAgeVerification"];

  return v5;
}

- (BOOL)shouldForceiPhoneBehaviors
{
  if ([(ICDefaults *)self _shouldSpoofIPhoneRequestProperties]) {
    return 1;
  }

  return [(ICDefaults *)self _shouldSpoofIPadRequestProperties];
}

- (void)setBatteryLevelOverride:(id)a3
{
}

- (void)setChargingStateOverride:(id)a3
{
}

- (void)setNetworkLinkQualityOverride:(id)a3
{
}

- (void)setNetworkTypeOverride:(id)a3
{
}

- (void)setProductPlatformOverride:(id)a3
{
}

- (void)setProductVersionOverride:(id)a3
{
}

- (void)setHardwarePlatformOverride:(id)a3
{
}

- (void)setFairPlayDeviceTypeOverride:(id)a3
{
}

- (void)setDeviceModelOverride:(id)a3
{
}

- (void)setDeviceClassOverride:(id)a3
{
}

- (BOOL)bypassBagSanityChecks
{
  BOOL v3 = [(ICDefaults *)self internalDefaults];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICDefaults *)self internalDefaults];
  char v5 = [v4 BOOLForKey:@"ICDefaultsKeyBypassBagSanityChecks"];

  return v5;
}

- (void)setIgnoreExtendedCertificateValidation:(BOOL)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithBool:a3];

  CFPreferencesSetAppValue(@"ISIgnoreExtendedValidation", v3, @"com.apple.itunesstored");
}

- (void)setCachedHomeProperties:(id)a3
{
}

- (NSDictionary)cachedHomeProperties
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyCachedHomeProperties"];
  if (_NSIsNSDictionary()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setCachedU18MinorAccountStatus:(BOOL)a3
{
}

- (void)setShouldForceStreamingOnlyKeysForPlayback:(BOOL)a3
{
}

- (BOOL)shouldForceStreamingOnlyKeysForPlayback
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"ICDefaultsKeyShouldForceStreamingOnlyKeysForPlayback"];
}

- (void)setLastKnownHouseholdID:(id)a3
{
}

- (NSDictionary)accountNotificationsNewMusicDictionary
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyAccountNotificationsNewMusicSwitch"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (void)setAccountNotificationsNewMusicDictionary:(id)a3
{
}

- (NSDictionary)accountNotificationsShowInLibraryDictionary
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyAccountNotificationsShowInLibrarySwitch"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (void)setAccountNotificationsShowInLibraryDictionary:(id)a3
{
}

- (void)setLastKnownSubscriptionStatusBaseCacheKey:(id)a3
{
}

- (void)setLastKnownLocalStoreAccountProperties:(id)a3
{
}

- (void)setLastAuthenticationDialogResponseTime:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(ICDefaults *)self _setOrRemoveObject:v4 forKey:@"ICDefaultsKeyLastAuthenticationDialogResponseTime"];
}

- (double)lastAuthenticationDialogResponseTime
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyLastAuthenticationDialogResponseTime"];
  double v3 = 0.0;
  if (_NSIsNSNumber())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (void)setAuthServiceClientTokenCache:(id)a3
{
}

- (NSDictionary)authServiceClientTokenCache
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyAuthServiceClientTokenCache"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSNumber)authServiceClientTokenTimeToLive
{
  v2 = [(NSUserDefaults *)self->_internalDefaults objectForKey:@"ICDefaultsKeyAuthServiceClientTokenTimeToLive"];
  if ([v2 isNSNumber]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setLastAllowedInteractiveAuthenticationTime:(id)a3
{
}

- (NSDate)lastAllowedInteractiveAuthenticationTime
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyLastAllowedInteractiveAuthenticationTime"];
  if (_NSIsNSDate()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)setLastCookieHeadersForRevokingMusicUserTokens:(id)a3
{
}

- (NSDictionary)lastCookieHeadersForRevokingMusicUserTokens
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__27567;
  objc_super v11 = __Block_byref_object_dispose__27568;
  id v12 = 0;
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyLastCookieHeadersForRevokingMusicUserTokens"];
  if (_NSIsNSDictionary())
  {
    id v3 = v2;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__ICDefaults_lastCookieHeadersForRevokingMusicUserTokens__block_invoke;
    v6[3] = &unk_1E5ACA6E0;
    v6[4] = &v7;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
  }
  double v4 = (void *)[(id)v8[5] copy];

  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __57__ICDefaults_lastCookieHeadersForRevokingMusicUserTokens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (_NSIsNSString() && _NSIsNSString())
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    char v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKey:v9];
}

- (void)setLastActiveAccountDSID:(id)a3
{
}

- (NSNumber)lastActiveAccountDSID
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyLastActiveAccountDSID"];
  if (_NSIsNSNumber()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  double v4 = v3;

  return v4;
}

- (void)setMediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates:(id)a3
{
}

- (NSDictionary)mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__27567;
  objc_super v11 = __Block_byref_object_dispose__27568;
  id v12 = 0;
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsKeyMediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates"];
  if (_NSIsNSDictionary())
  {
    id v3 = v2;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__ICDefaults_mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates__block_invoke;
    v6[3] = &unk_1E5ACA6E0;
    v6[4] = &v7;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
  }
  double v4 = (void *)[(id)v8[5] copy];

  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __76__ICDefaults_mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (_NSIsNSString() && _NSIsNSDate())
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v6 setObject:v5 forKey:v10];
  }
}

- (void)setPushNotificationState:(id)a3
{
}

- (NSDictionary)pushNotificationState
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsRegisteredPushNotificationState"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  double v4 = v3;

  return v4;
}

- (void)setCachedMusicUserTokens:(id)a3
{
}

- (NSDictionary)cachedMusicUserTokens
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ICDefaultsCachedMusicUserTokens"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  double v4 = v3;

  return v4;
}

- (void)setCachedSubscriptionStatus:(id)a3
{
}

- (NSString)defaultStoreFront
{
  v2 = +[ICUserIdentityStore defaultIdentityStore];
  id v3 = [v2 localStoreAccountProperties];
  double v4 = [v3 storefrontIdentifier];

  return (NSString *)v4;
}

- (void)setCloudMediaLibraryUID:(id)a3
{
}

@end