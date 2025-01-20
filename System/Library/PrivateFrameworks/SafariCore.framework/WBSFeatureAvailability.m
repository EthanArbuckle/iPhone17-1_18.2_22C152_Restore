@interface WBSFeatureAvailability
+ (BOOL)_is2024StartPageDisabledOverride;
+ (BOOL)_isPasswordSharingAvailable;
+ (BOOL)_shouldShowChineseFeatures;
+ (BOOL)_shouldShowRussianFeatures;
+ (BOOL)defaultSearchEngineMatchesExperiment;
+ (BOOL)hasInternalContent;
+ (BOOL)is2024CloudTabsEnabled;
+ (BOOL)is2024FavoritesEnabled;
+ (BOOL)is2024PrivacyReportEnabled;
+ (BOOL)is2024ReadingListEnabled;
+ (BOOL)is2024StartPageSectionTitleEnabled;
+ (BOOL)is2024SuggestionsEnabled;
+ (BOOL)isAirDropPasswordsEnabled;
+ (BOOL)isAppleAccountBrandingEnabled;
+ (BOOL)isAutomaticPasskeyUpgradesEnabled;
+ (BOOL)isAutomaticStrongPasswordsEnabled;
+ (BOOL)isBrowsingAssistantEnabled;
+ (BOOL)isCredentialExchangeEnabled;
+ (BOOL)isCustomizationSyncEnabled;
+ (BOOL)isDTOMitigationEnabled;
+ (BOOL)isInternalInstall;
+ (BOOL)isLabelPreviousSearchesInCompletionListEnabled;
+ (BOOL)isLockedPrivateBrowsingEnabled;
+ (BOOL)isNewTabAndWindowSyncingEnabled;
+ (BOOL)isOnDeviceSummarizationEnabled;
+ (BOOL)isOngoingCredentialSharingEnabled;
+ (BOOL)isPasswordsAppInstalled;
+ (BOOL)isPerSiteSettingSyncEnabled;
+ (BOOL)isSMARTParsecResultsEnabled;
+ (BOOL)isSafariProfilesEnabled;
+ (BOOL)isScribbleEnabled;
+ (BOOL)isSearchEvaluationLoggingEnabled;
+ (BOOL)isSearchProviderEnabled:(unint64_t)a3;
+ (BOOL)isShowURLsInURLAutocompleteDebugChannelEnabled;
+ (BOOL)isSignInWithAppleCredentialSharingEnabled;
+ (BOOL)isSignInWithAppleInPasswordManagerEnabled;
+ (BOOL)isSiriReadThisEnabled;
+ (BOOL)isStartPageSettingSyncEnabled;
+ (BOOL)isStreamlinedCompletionListEnabled;
+ (BOOL)isWAPEnabled;
+ (BOOL)isWebKitTextExtractionEnabled;
+ (BOOL)scribbleRequiresVisualSimilarity;
+ (BOOL)shouldShowInternalUI;
+ (BOOL)supportsURLCredentialStorageAccessControlGroups;
+ (BOOL)wantsAggressiveKeychainCredentialCaching;
+ (void)setAutomaticStrongPasswordsEnabled:(BOOL)a3;
+ (void)setIsAutomaticPasskeyUpgradesEnabled:(BOOL)a3;
+ (void)toggleShowURLsInURLAutocompleteDebugChannel;
@end

@implementation WBSFeatureAvailability

+ (BOOL)isSafariProfilesEnabled
{
  return 1;
}

+ (BOOL)is2024SuggestionsEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSFeatureAvailability_is2024SuggestionsEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024SuggestionsEnabled_onceToken != -1) {
    dispatch_once(&is2024SuggestionsEnabled_onceToken, block);
  }
  return is2024SuggestionsEnabled_is2024SuggestionsEnabled;
}

void __50__WBSFeatureAvailability_is2024SuggestionsEnabled__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", @"WBSEnable2024Suggestions", 1)) {
    char v2 = [*(id *)(a1 + 32) _is2024StartPageDisabledOverride] ^ 1;
  }
  else {
    char v2 = 0;
  }
  is2024SuggestionsEnabled_is2024SuggestionsEnabled = v2;
}

void __48__WBSFeatureAvailability_is2024CloudTabsEnabled__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", @"WBSEnable2024CloudTabs", 1)) {
    char v2 = [*(id *)(a1 + 32) _is2024StartPageDisabledOverride] ^ 1;
  }
  else {
    char v2 = 0;
  }
  is2024CloudTabsEnabled_is2024CloudTabsEnabled = v2;
}

void __50__WBSFeatureAvailability_is2024ReadingListEnabled__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", @"WBSEnable2024ReadingList", 1)) {
    char v2 = [*(id *)(a1 + 32) _is2024StartPageDisabledOverride] ^ 1;
  }
  else {
    char v2 = 0;
  }
  is2024ReadingListEnabled_is2024ReadingListEnabled = v2;
}

+ (BOOL)_is2024StartPageDisabledOverride
{
  if (_is2024StartPageDisabledOverride_onceToken != -1) {
    dispatch_once(&_is2024StartPageDisabledOverride_onceToken, &__block_literal_global_74);
  }
  return _is2024StartPageDisabledOverride_is2024StartPageDisabledOverride;
}

void __55__WBSFeatureAvailability_isWebKitTextExtractionEnabled__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isWebKitTextExtractionEnabled_isWebKitTextExtractionEnabled = [v0 BOOLForKey:@"DebugDisableWebKitTextExtraction"] ^ 1;
}

+ (BOOL)is2024FavoritesEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSFeatureAvailability_is2024FavoritesEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024FavoritesEnabled_onceToken != -1) {
    dispatch_once(&is2024FavoritesEnabled_onceToken, block);
  }
  return is2024FavoritesEnabled_is2024FavoritesEnabled;
}

+ (BOOL)isLockedPrivateBrowsingEnabled
{
  return 1;
}

+ (BOOL)is2024PrivacyReportEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__WBSFeatureAvailability_is2024PrivacyReportEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024PrivacyReportEnabled_onceToken != -1) {
    dispatch_once(&is2024PrivacyReportEnabled_onceToken, block);
  }
  return is2024PrivacyReportEnabled_is2024PrivacyReportEnabled;
}

+ (BOOL)is2024ReadingListEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSFeatureAvailability_is2024ReadingListEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024ReadingListEnabled_onceToken != -1) {
    dispatch_once(&is2024ReadingListEnabled_onceToken, block);
  }
  return is2024ReadingListEnabled_is2024ReadingListEnabled;
}

+ (BOOL)isSearchProviderEnabled:(unint64_t)a3
{
  if (a3 < 3) {
    return [a1 _shouldShowChineseFeatures];
  }
  if (a3 == 3) {
    return [a1 _shouldShowRussianFeatures];
  }
  return 0;
}

+ (BOOL)is2024CloudTabsEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSFeatureAvailability_is2024CloudTabsEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024CloudTabsEnabled_onceToken != -1) {
    dispatch_once(&is2024CloudTabsEnabled_onceToken, block);
  }
  return is2024CloudTabsEnabled_is2024CloudTabsEnabled;
}

+ (BOOL)hasInternalContent
{
  if (hasInternalContent_onceToken != -1) {
    dispatch_once(&hasInternalContent_onceToken, &__block_literal_global_69);
  }
  return hasInternalContent_hasInternalContent;
}

uint64_t __43__WBSFeatureAvailability_isInternalInstall__block_invoke()
{
  uint64_t result = os_variant_allows_internal_security_policies();
  isInternalInstall_isInternalInstall = result;
  return result;
}

+ (BOOL)isOngoingCredentialSharingEnabled
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  char v4 = objc_msgSend(v3, "safari_isPasswordManagerTestMode");

  if (v4) {
    return 0;
  }
  v5 = +[WBSKeychainSyncingMonitor sharedMonitor];
  uint64_t v6 = [v5 keychainSyncSettingValue];

  if (v6 == 1)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v12) {
      return result;
    }
    __int16 v21 = 0;
    v10 = "Ongoing credential sharing is disabled because iCloud Keychain is disabled";
    v11 = (uint8_t *)&v21;
    goto LABEL_18;
  }
  if (!v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    __int16 v22 = 0;
    v10 = "Ongoing credential sharing is disabled because iCloud Keychain state is unknown";
    v11 = (uint8_t *)&v22;
    goto LABEL_18;
  }
  v13 = +[WBSPrimaryAppleAccountObserver sharedObserver];
  int v14 = [v13 isCurrentAppleIDManaged];

  if (v14)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    BOOL v15 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v15) {
      return result;
    }
    __int16 v20 = 0;
    v10 = "Ongoing credential sharing is disabled for Managed Apple IDs";
    v11 = (uint8_t *)&v20;
    goto LABEL_18;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    BOOL v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v16) {
      return result;
    }
    __int16 v19 = 0;
    v10 = "Ongoing credential sharing is disabled because the runtime feature flag is disabled";
    v11 = (uint8_t *)&v19;
    goto LABEL_18;
  }
  if ([a1 _isPasswordSharingAvailable]) {
    return 1;
  }
  v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
  BOOL v17 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v17)
  {
    __int16 v18 = 0;
    v10 = "Ongoing credential sharing is disabled because profile that disables Password Sharing is installed to device.";
    v11 = (uint8_t *)&v18;
LABEL_18:
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    return 0;
  }
  return result;
}

+ (BOOL)isSignInWithAppleInPasswordManagerEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_66);
  }
  return isInternalInstall_isInternalInstall;
}

+ (BOOL)isWAPEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    os_eligibility_get_domain_answer();
    LOBYTE(v2) = 0;
  }
  return v2;
}

+ (BOOL)defaultSearchEngineMatchesExperiment
{
  int v2 = +[WBSSearchEnginePreferenceObserver sharedObserver];
  char v3 = [v2 defaultSearchEngineMatchesExperiment];

  return v3;
}

uint64_t __44__WBSFeatureAvailability_hasInternalContent__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  hasInternalContent_hasInternalContent = result;
  return result;
}

+ (BOOL)isCustomizationSyncEnabled
{
  if ([a1 isPerSiteSettingSyncEnabled]) {
    return 1;
  }
  return [a1 isStartPageSettingSyncEnabled];
}

+ (BOOL)isPerSiteSettingSyncEnabled
{
  int v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", @"WBSEnablePerSiteSettingsSync", 1);

  return v3;
}

+ (BOOL)isWebKitTextExtractionEnabled
{
  if (isWebKitTextExtractionEnabled_onceToken != -1) {
    dispatch_once(&isWebKitTextExtractionEnabled_onceToken, &__block_literal_global_110);
  }
  return isWebKitTextExtractionEnabled_isWebKitTextExtractionEnabled;
}

void __58__WBSFeatureAvailability__is2024StartPageDisabledOverride__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _is2024StartPageDisabledOverride_is2024StartPageDisabledOverride = objc_msgSend(v0, "safari_BOOLForKey:defaultValue:", @"WBSDisable2024StartPageOverride", 0);
}

void __52__WBSFeatureAvailability_is2024PrivacyReportEnabled__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", @"WBSEnable2024PrivacyReport", 1)) {
    char v2 = [*(id *)(a1 + 32) _is2024StartPageDisabledOverride] ^ 1;
  }
  else {
    char v2 = 0;
  }
  is2024PrivacyReportEnabled_is2024PrivacyReportEnabled = v2;
}

void __48__WBSFeatureAvailability_is2024FavoritesEnabled__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", @"WBSEnable2024Favorites", 1)) {
    char v2 = [*(id *)(a1 + 32) _is2024StartPageDisabledOverride] ^ 1;
  }
  else {
    char v2 = 0;
  }
  is2024FavoritesEnabled_is2024FavoritesEnabled = v2;
}

+ (BOOL)_shouldShowChineseFeatures
{
  return 0;
}

+ (BOOL)_shouldShowRussianFeatures
{
  return 0;
}

+ (BOOL)supportsURLCredentialStorageAccessControlGroups
{
  if (supportsURLCredentialStorageAccessControlGroups_onceToken != -1) {
    dispatch_once(&supportsURLCredentialStorageAccessControlGroups_onceToken, &__block_literal_global_10);
  }
  return supportsURLCredentialStorageAccessControlGroups_supportsURLCredentialStorageAccessControlGroups;
}

uint64_t __73__WBSFeatureAvailability_supportsURLCredentialStorageAccessControlGroups__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F18D90] instancesRespondToSelector:NSSelectorFromString(&cfstr_Allcredentials.isa)];
  supportsURLCredentialStorageAccessControlGroups_supportsURLCredentialStorageAccessControlGroups = result;
  return result;
}

+ (BOOL)wantsAggressiveKeychainCredentialCaching
{
  return 0;
}

+ (BOOL)shouldShowInternalUI
{
  if (shouldShowInternalUI_onceToken != -1) {
    dispatch_once(&shouldShowInternalUI_onceToken, &__block_literal_global_71);
  }
  if (shouldShowInternalUI_hasInternalUI)
  {
    char v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v3 = [v2 BOOLForKey:@"hideInternalUI"] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

uint64_t __46__WBSFeatureAvailability_shouldShowInternalUI__block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  shouldShowInternalUI_hasInternalUI = result;
  return result;
}

+ (BOOL)is2024StartPageSectionTitleEnabled
{
  if (+[WBSFeatureAvailability is2024FavoritesEnabled]
    || +[WBSFeatureAvailability is2024CloudTabsEnabled]
    || +[WBSFeatureAvailability is2024SuggestionsEnabled](WBSFeatureAvailability, "is2024SuggestionsEnabled")|| +[WBSFeatureAvailability is2024PrivacyReportEnabled])
  {
    return 1;
  }
  return +[WBSFeatureAvailability is2024ReadingListEnabled];
}

+ (BOOL)isStartPageSettingSyncEnabled
{
  char v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", @"WBSEnableCloudSettingsSync", 1);

  return v3;
}

+ (BOOL)isSiriReadThisEnabled
{
  if (isSiriReadThisEnabled_onceToken != -1) {
    dispatch_once(&isSiriReadThisEnabled_onceToken, &__block_literal_global_77);
  }
  return isSiriReadThisEnabled_isSiriReadThisEnabled;
}

void __47__WBSFeatureAvailability_isSiriReadThisEnabled__block_invoke()
{
  if (_os_feature_enabled_impl())
  {
    isSiriReadThisEnabled_isSiriReadThisEnabled = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    isSiriReadThisEnabled_isSiriReadThisEnabled = [v0 BOOLForKey:@"EnableSiriReadThis"];
  }
}

+ (BOOL)isAirDropPasswordsEnabled
{
  char v3 = +[WBSPrimaryAppleAccountObserver sharedObserver];
  char v4 = [v3 isUsingICloud];

  if ((v4 & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v12) {
      return result;
    }
    __int16 v16 = 0;
    v10 = "AirDrop password sharing is disabled because user don't have iCloud";
    v11 = (uint8_t *)&v16;
    goto LABEL_11;
  }
  v5 = +[WBSPrimaryAppleAccountObserver sharedObserver];
  int v6 = [v5 isCurrentAppleIDManaged];

  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    __int16 v15 = 0;
    v10 = "AirDrop password sharing is disabled for Managed Apple IDs";
    v11 = (uint8_t *)&v15;
    goto LABEL_11;
  }
  if ([a1 _isPasswordSharingAvailable]) {
    return 1;
  }
  v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
  BOOL v13 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v13)
  {
    __int16 v14 = 0;
    v10 = "AirDrop password sharing is disabled because profile that disables Password Sharing is installed to device.";
    v11 = (uint8_t *)&v14;
LABEL_11:
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    return 0;
  }
  return result;
}

+ (BOOL)_isPasswordSharingAvailable
{
  char v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isPasswordSharingAllowed];

  return v3;
}

+ (BOOL)isNewTabAndWindowSyncingEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__WBSFeatureAvailability_isNewTabAndWindowSyncingEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isNewTabAndWindowSyncingEnabled_onceToken != -1) {
    dispatch_once(&isNewTabAndWindowSyncingEnabled_onceToken, block);
  }
  return isNewTabAndWindowSyncingEnabled_isNewTabAndWindowSyncingEnabled;
}

void __57__WBSFeatureAvailability_isNewTabAndWindowSyncingEnabled__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSafariProfilesEnabled])
  {
    objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    isNewTabAndWindowSyncingEnabled_isNewTabAndWindowSyncingEnabled = objc_msgSend(v1, "safari_BOOLForKey:defaultValue:", @"EnableSafariProfileNewTabAndWindowBehaviorSyncing", 1);
  }
  else
  {
    isNewTabAndWindowSyncingEnabled_isNewTabAndWindowSyncingEnabled = 0;
  }
}

+ (BOOL)isShowURLsInURLAutocompleteDebugChannelEnabled
{
  return _WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled;
}

+ (void)toggleShowURLsInURLAutocompleteDebugChannel
{
  if (_WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled == 1)
  {
    _WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled = 0;
  }
  else
  {
    _WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled = 1;
    dispatch_time_t v2 = dispatch_time(0, 600000000000);
    char v3 = MEMORY[0x1E4F14428];
    dispatch_after(v2, v3, &__block_literal_global_87);
  }
}

void __69__WBSFeatureAvailability_toggleShowURLsInURLAutocompleteDebugChannel__block_invoke()
{
  _WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled = 0;
}

+ (BOOL)isStreamlinedCompletionListEnabled
{
  if (isStreamlinedCompletionListEnabled_onceToken != -1) {
    dispatch_once(&isStreamlinedCompletionListEnabled_onceToken, &__block_literal_global_89);
  }
  return isStreamlinedCompletionListEnabled_usesStreamlinedCompletionList;
}

void __60__WBSFeatureAvailability_isStreamlinedCompletionListEnabled__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isStreamlinedCompletionListEnabled_usesStreamlinedCompletionList = [v0 BOOLForKey:@"DebugStreamlinedCompletionList"];
}

+ (BOOL)isLabelPreviousSearchesInCompletionListEnabled
{
  if (isLabelPreviousSearchesInCompletionListEnabled_onceToken != -1) {
    dispatch_once(&isLabelPreviousSearchesInCompletionListEnabled_onceToken, &__block_literal_global_91);
  }
  return isLabelPreviousSearchesInCompletionListEnabled_usesLabelPreviousSearchesInCompletionList;
}

void __72__WBSFeatureAvailability_isLabelPreviousSearchesInCompletionListEnabled__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isLabelPreviousSearchesInCompletionListEnabled_usesLabelPreviousSearchesInCompletionList = [v0 BOOLForKey:@"DebugLabelPreviousSearchesInCompletionList"];
}

+ (BOOL)isSearchEvaluationLoggingEnabled
{
  if (isSearchEvaluationLoggingEnabled_onceToken != -1) {
    dispatch_once(&isSearchEvaluationLoggingEnabled_onceToken, &__block_literal_global_94);
  }
  return isSearchEvaluationLoggingEnabled_isSearchEvaluationLoggingEnabled;
}

void __58__WBSFeatureAvailability_isSearchEvaluationLoggingEnabled__block_invoke()
{
  id v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  isSearchEvaluationLoggingEnabled_isSearchEvaluationLoggingEnabled = [v0 BOOLForKey:@"WBSDebugSearchEvaluationLogging"];

  if (isSearchEvaluationLoggingEnabled_isSearchEvaluationLoggingEnabled)
  {
    id v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v1 removeObjectForKey:@"WBSDebugSearchEvaluationLogging"];

    dispatch_time_t v2 = dispatch_time(0, 900000000000);
    char v3 = MEMORY[0x1E4F14428];
    dispatch_after(v2, v3, &__block_literal_global_96);
  }
}

void __58__WBSFeatureAvailability_isSearchEvaluationLoggingEnabled__block_invoke_2()
{
  isSearchEvaluationLoggingEnabled_isSearchEvaluationLoggingEnabled = 0;
}

+ (BOOL)isDTOMitigationEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    char v3 = [MEMORY[0x1E4F30B78] sharedInstance];
    char v4 = [v3 isFeatureEnabled];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isBrowsingAssistantEnabled
{
  return 1;
}

+ (BOOL)isOnDeviceSummarizationEnabled
{
  if (isOnDeviceSummarizationEnabled_onceToken != -1) {
    dispatch_once(&isOnDeviceSummarizationEnabled_onceToken, &__block_literal_global_101);
  }
  return isOnDeviceSummarizationEnabled_onDeviceSummarizationEnabled;
}

void __56__WBSFeatureAvailability_isOnDeviceSummarizationEnabled__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isOnDeviceSummarizationEnabled_onDeviceSummarizationEnabled = objc_msgSend(v0, "safari_BOOLForKey:defaultValue:", @"EnableOnDeviceSummarization", 1);
}

+ (BOOL)isPasswordsAppInstalled
{
  uint64_t v6 = 0;
  int v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.Passwords" allowPlaceholder:1 error:&v6];
  char v3 = v2;
  if (v2)
  {
    if ([v2 isPlaceholder]) {
      BOOL v4 = (unint64_t)([v3 installType] - 7) < 3;
    }
    else {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (void)setAutomaticStrongPasswordsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBool:v3 forKey:@"EnableAutomaticStrongPasswords"];
}

+ (BOOL)isAutomaticStrongPasswordsEnabled
{
  int v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", @"EnableAutomaticStrongPasswords", 1);

  return v3;
}

+ (BOOL)isAutomaticPasskeyUpgradesEnabled
{
  int v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", @"AllowAutomaticPasskeyUpgrades", 1);

  return v3;
}

+ (void)setIsAutomaticPasskeyUpgradesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBool:v3 forKey:@"AllowAutomaticPasskeyUpgrades"];
}

+ (BOOL)isSignInWithAppleCredentialSharingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAppleAccountBrandingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSMARTParsecResultsEnabled
{
  if (isSMARTParsecResultsEnabled_onceToken != -1) {
    dispatch_once(&isSMARTParsecResultsEnabled_onceToken, &__block_literal_global_117);
  }
  return isSMARTParsecResultsEnabled_isSMARTParsecResultsEnabled;
}

uint64_t __53__WBSFeatureAvailability_isSMARTParsecResultsEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  isSMARTParsecResultsEnabled_isSMARTParsecResultsEnabled = result;
  return result;
}

+ (BOOL)isScribbleEnabled
{
  if (isScribbleEnabled_onceToken != -1) {
    dispatch_once(&isScribbleEnabled_onceToken, &__block_literal_global_121);
  }
  return isScribbleEnabled_isWEVFeatureFlagEnabled;
}

void __43__WBSFeatureAvailability_isScribbleEnabled__block_invoke()
{
  if (_os_feature_enabled_impl())
  {
    isScribbleEnabled_isWEVFeatureFlagEnabled = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    isScribbleEnabled_isWEVFeatureFlagEnabled = [v0 BOOLForKey:@"DebugEnableScribble"];
  }
}

+ (BOOL)scribbleRequiresVisualSimilarity
{
  if (scribbleRequiresVisualSimilarity_onceToken != -1) {
    dispatch_once(&scribbleRequiresVisualSimilarity_onceToken, &__block_literal_global_127);
  }
  return scribbleRequiresVisualSimilarity_requiresVisualSimilarity;
}

void __58__WBSFeatureAvailability_scribbleRequiresVisualSimilarity__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  scribbleRequiresVisualSimilarity_requiresVisualSimilarity = objc_msgSend(v0, "safari_BOOLForKey:defaultValue:", @"DebugScribbleRequiresVisualSimilarity", 1);
}

+ (BOOL)isCredentialExchangeEnabled
{
  int v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "as_developerDefaults");
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", @"CredentialExchangeEnabled", 0);

  return v3;
}

@end