@interface TCCDService
+ (id)allServices;
+ (id)defaultLocalizedResourcesBundlePath;
+ (id)localizationKeyName:(id)a3 forServiceName:(id)a4;
+ (id)localizationKeyNameWithFeatureFlagEnabled:(id)a3;
+ (id)reminderRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)reminderRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)reminderTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAdditionalTextAfterV2UpgradeLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAdditionalTextExtensionLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAdditionalTextForSubsequentRequestsKeyNameForServiceName:(id)a3;
+ (id)requestAdditionalTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestAlternateTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestDenyNotificationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestDenyNotificationTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestTitleTextAfterV2UpgradeLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestTitleTextForSubsequentRequestsLocalizationKeyNameForServiceName:(id)a3;
+ (id)requestTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)serviceAll;
+ (id)serviceDescriptionsForPlatformName:(id)a3;
+ (id)subsequentRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)subsequentRequestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)subsequentRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3;
+ (id)tccdPlatformNameForDYLDPlatformName:(id)a3;
+ (id)versionStringFromDYLDVersionNumber:(id)a3;
- (BOOL)allowPromptForPlatformBinaries;
- (BOOL)allowedForAvocadoWidget;
- (BOOL)applyDevelopmentAuthorizationPolicy;
- (BOOL)checkAllowEntitlementOnResponsibleProcess;
- (BOOL)doNotStoreDefaultAllowAccess;
- (BOOL)expireOnlyAllowedEntries;
- (BOOL)getUsesTwoStagePrompting;
- (BOOL)hasParanoidSecurityPolicy;
- (BOOL)ios_allowPromptFromAppClip;
- (BOOL)ios_allowRegionalPrompt;
- (BOOL)ios_useGenericSandboxExtension;
- (BOOL)isAccessAllowedByDefault;
- (BOOL)isAccessDeniedByDefault;
- (BOOL)isAuthorizationValue:(unint64_t)a3 equalToRight:(unint64_t)a4;
- (BOOL)isRevocable;
- (BOOL)macos_compositionPromoteChildAuthorizationToParent;
- (BOOL)macos_hasIndirectObject;
- (BOOL)macos_isPerSystem;
- (BOOL)macos_pardonMissingUsage;
- (BOOL)macos_shouldAllowSameTeam;
- (BOOL)mdm_allowStandardUserToSetSystemService;
- (BOOL)mdm_isAuthorizationDenyOnly;
- (BOOL)mdm_macos_allowedInPayloadDefition;
- (BOOL)pardonMissingUsage;
- (BOOL)saveExpiredEntries;
- (BOOL)shouldAllowUnrestrictedCheckAuditToken;
- (BOOL)shouldIssueSandboxExtension;
- (BOOL)shouldTreatAsDeprecated;
- (BOOL)shouldUseADefaultDescriptionString;
- (BOOL)supportsStagedPrompting;
- (BOOL)upgradeV1AuthorizationValue;
- (BOOL)usesTwoStagePrompting;
- (NSArray)defaultAllowedPlatformIdentifiersList;
- (NSArray)disallowedOnPlatformSubtypeNameList;
- (NSBundle)defaultLocalizedResourcesBundle;
- (NSBundle)localizedResourcesBundle;
- (NSDictionary)authSpecificNotificationExtensionBundleIdentifier;
- (NSDictionary)iOS_minimumSDKVersionNumberAuthSpecific;
- (NSDictionary)macos_minimumSDKVersionNumberAuthSpecific;
- (NSDictionary)platformAvailability;
- (NSDictionary)tvOS_minimumSDKVersionNumberAuthSpecific;
- (NSDictionary)vOS_minimumSDKVersionNumberAuthSpecific;
- (NSDictionary)watchOS_minimumSDKVersionNumberAuthSpecific;
- (NSNumber)expirySeconds;
- (NSNumber)iOS_minimumSDKVersionNumber;
- (NSNumber)ios_watchKitUserNotificationNumber;
- (NSNumber)macos_minimumSDKVersionNumber;
- (NSNumber)tvOS_minimumSDKVersionNumber;
- (NSNumber)vOS_minimumSDKVersionNumber;
- (NSNumber)watchOS_minimumSDKVersionNumber;
- (NSSet)validOnPlatformNames;
- (NSString)addAccessUsageDescriptionKeyName;
- (NSString)addModifyAddedAuthorizationButtonTitleLocalizationKey;
- (NSString)allowAuthorizationButtonTitleLocalizationKey;
- (NSString)alternatePromptTitleEntitlement;
- (NSString)cancelButtontitleLocalizationKey;
- (NSString)denyAuthorizationButtonTitleLocalizationKey;
- (NSString)externalName;
- (NSString)firstStagePromptHeaderAssetCatalogPath;
- (NSString)firstStagePromptHeaderAssetName;
- (NSString)fullAccessUsageDescriptionKeyName;
- (NSString)limitedAuthorizationButtonTitleLocalizationKey;
- (NSString)localizedResourcesBundlePath;
- (NSString)macos_hardenedRuntimeEntitlementName;
- (NSString)macos_helpAnchor;
- (NSString)moreAuthorizationOptionsButtonTitleLocalizationKey;
- (NSString)name;
- (NSString)notificationButtonTitleLocalizationKey;
- (NSString)notificationTitleTextLocalizationKey;
- (NSString)reminderAllowButtonTitleTextLocalizationKey;
- (NSString)reminderLimitedButtonTitleTextLocalizationKey;
- (NSString)reminderTitleTextLocalizationKey;
- (NSString)requestAddTitleTextLocalizationKey;
- (NSString)requestAdditionalTextAfterV2UpgradeLocalizationKey;
- (NSString)requestAdditionalTextForSubsequentRequestsLocalizationKey;
- (NSString)requestAdditionalTextLocalizationKey;
- (NSString)requestEntitlementTitleTextLocalizationKey;
- (NSString)requestFullTitleTextLocalizationKey;
- (NSString)requestLimitedTitleTextLocalizationKey;
- (NSString)requestNotificationExtensionTextLocalizationKey;
- (NSString)requestTitleTextAfterV2UpgradeLocalizationKey;
- (NSString)requestTitleTextForSubsequentRequestsKey;
- (NSString)requestTitleTextLocalizationKey;
- (NSString)requestUpgradeTitleTextLocalizationKey;
- (NSString)sandboxOperationForDelegation;
- (NSString)secondaryUsageDescriptionKeyName;
- (NSString)sessionPidAuthorizationButtonTitleLocalizationKey;
- (NSString)settingsRequestFullTitleTextLocalizationKey;
- (NSString)subsequentRequestAllowAuthorizationButtonTitleLocalizationKey;
- (NSString)subsequentRequestDenyAuthorizationButtonTitleLocalizationKey;
- (NSString)subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey;
- (NSString)usageDescriptionKeyName;
- (NSURL)notificationActionURL;
- (TCCDAlertManager)alertManager;
- (TCCDService)initWithName:(id)a3 availability:(id)a4;
- (TCCDService)macos_compositionChildService;
- (TCCDService)macos_compositionParentService;
- (TCCDService)subsequentRequestStringsRelatedService;
- (id)authorizationRightStateForValue:(unint64_t)a3 reason:(unint64_t)a4;
- (id)buttonTitleLocalizationKeyForAuthorization:(unint64_t)a3 desiredAuth:(unint64_t)a4;
- (id)descriptionDictionary;
- (id)descriptionForAuthorizationValue:(unint64_t)a3 reason:(unint64_t)a4;
- (id)localizationKeyForButtonAuth:(unint64_t)a3 desiredAuth:(unint64_t)a4;
- (id)localizedTextWithKey:(id)a3;
- (id)populateRecordMetricWithFields:(id)a3;
- (id)promptAuthorizationChoiceBlock;
- (id)promptButtonLocalizationKeyBlock;
- (id)recordAnalyticsPopulationBlock;
- (id)requestTitleTextLocalizationKeyForAuthorization:(unint64_t)a3;
- (id)syncAuthorizationTranslationBlock;
- (id)usageDescriptionKeyForAuthorization:(unint64_t)a3;
- (int)authorizationChoicesForCurrentAuth:(unint64_t)a3 desiredAuth:(unint64_t)a4 aButtonAuth:(unint64_t *)a5 bButtonAuth:(unint64_t *)a6 cButtonAuth:(unint64_t *)a7;
- (int64_t)alertStyle;
- (int64_t)compare:(id)a3;
- (int64_t)defaultDevelopmentAuthorizationValue;
- (int64_t)developmentAuthorizationValue;
- (int64_t)macos_AXControlComputerAccessType;
- (unint64_t)accessActionStatusForAuthorizationValue:(unint64_t)a3;
- (unint64_t)authorizationPromptRightsMask;
- (unint64_t)authorizationRightsMask;
- (unint64_t)authorizationValueType;
- (unint64_t)authorizationVersionNumber;
- (unint64_t)defaultDesiredAuth;
- (unint64_t)downgradeAuthRight;
- (unint64_t)translateAuth:(unint64_t)a3 versionUpgrade:(BOOL)a4;
- (void)setAddAccessUsageDescriptionKeyName:(id)a3;
- (void)setAddModifyAddedAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setAlertManager:(id)a3;
- (void)setAlertStyle:(int64_t)a3;
- (void)setAllowAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setAllowPromptForPlatformBinaries:(BOOL)a3;
- (void)setAllowedForAvocadoWidget:(BOOL)a3;
- (void)setAlternatePromptTitleEntitlement:(id)a3;
- (void)setApplyDevelopmentAuthorizationPolicy:(BOOL)a3;
- (void)setAuthSpecificNotificationExtensionBundleIdentifier:(id)a3;
- (void)setAuthorizationRightsMask:(unint64_t)a3;
- (void)setAuthorizationValueType:(unint64_t)a3;
- (void)setAuthorizationVersionNumber:(unint64_t)a3;
- (void)setCancelButtontitleLocalizationKey:(id)a3;
- (void)setCheckAllowEntitlementOnResponsibleProcess:(BOOL)a3;
- (void)setDefaultAllowedPlatformIdentifiersList:(id)a3;
- (void)setDefaultDesiredAuth:(unint64_t)a3;
- (void)setDefaultDevelopmentAuthorizationValue:(int64_t)a3;
- (void)setDefaultLocalizedResourcesBundle:(id)a3;
- (void)setDenyAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setDisallowedOnPlatformSubtypeNameList:(id)a3;
- (void)setDoNotStoreDefaultAllowAccess:(BOOL)a3;
- (void)setDowngradeAuthRight:(unint64_t)a3;
- (void)setExpireOnlyAllowedEntries:(BOOL)a3;
- (void)setExpirySeconds:(id)a3;
- (void)setExternalName:(id)a3;
- (void)setFirstStagePromptHeaderAssetCatalogPath:(id)a3;
- (void)setFirstStagePromptHeaderAssetName:(id)a3;
- (void)setFullAccessUsageDescriptionKeyName:(id)a3;
- (void)setHasParanoidSecurityPolicy:(BOOL)a3;
- (void)setIOS_minimumSDKVersionNumber:(id)a3;
- (void)setIOS_minimumSDKVersionNumberAuthSpecific:(id)a3;
- (void)setIos_allowPromptFromAppClip:(BOOL)a3;
- (void)setIos_allowRegionalPrompt:(BOOL)a3;
- (void)setIos_useGenericSandboxExtension:(BOOL)a3;
- (void)setIos_watchKitUserNotificationNumber:(id)a3;
- (void)setIsAccessAllowedByDefault:(BOOL)a3;
- (void)setIsAccessDeniedByDefault:(BOOL)a3;
- (void)setIsRevocable:(BOOL)a3;
- (void)setLimitedAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setLocalizedResourcesBundle:(id)a3;
- (void)setLocalizedResourcesBundlePath:(id)a3;
- (void)setMacos_AXControlComputerAccessType:(int64_t)a3;
- (void)setMacos_compositionChildService:(id)a3;
- (void)setMacos_compositionParentService:(id)a3;
- (void)setMacos_compositionPromoteChildAuthorizationToParent:(BOOL)a3;
- (void)setMacos_hardenedRuntimeEntitlementName:(id)a3;
- (void)setMacos_hasIndirectObject:(BOOL)a3;
- (void)setMacos_helpAnchor:(id)a3;
- (void)setMacos_isPerSystem:(BOOL)a3;
- (void)setMacos_minimumSDKVersionNumber:(id)a3;
- (void)setMacos_minimumSDKVersionNumberAuthSpecific:(id)a3;
- (void)setMacos_pardonMissingUsage:(BOOL)a3;
- (void)setMacos_shouldAllowSameTeam:(BOOL)a3;
- (void)setMdm_allowStandardUserToSetSystemService:(BOOL)a3;
- (void)setMdm_isAuthorizationDenyOnly:(BOOL)a3;
- (void)setMdm_macos_allowedInPayloadDefition:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNotificationActionURL:(id)a3;
- (void)setNotificationButtonTitleLocalizationKey:(id)a3;
- (void)setNotificationTitleTextLocalizationKey:(id)a3;
- (void)setPlatformAvailability:(id)a3;
- (void)setPromptAuthorizationChoiceBlock:(id)a3;
- (void)setPromptButtonLocalizationKeyBlock:(id)a3;
- (void)setRecordAnalyticsPopulationBlock:(id)a3;
- (void)setReminderAllowButtonTitleTextLocalizationKey:(id)a3;
- (void)setReminderLimitedButtonTitleTextLocalizationKey:(id)a3;
- (void)setReminderTitleTextLocalizationKey:(id)a3;
- (void)setRequestAddTitleTextLocalizationKey:(id)a3;
- (void)setRequestAdditionalTextAfterV2UpgradeLocalizationKey:(id)a3;
- (void)setRequestAdditionalTextForSubsequentRequestsLocalizationKey:(id)a3;
- (void)setRequestAdditionalTextLocalizationKey:(id)a3;
- (void)setRequestEntitlementTitleTextLocalizationKey:(id)a3;
- (void)setRequestFullTitleTextLocalizationKey:(id)a3;
- (void)setRequestLimitedTitleTextLocalizationKey:(id)a3;
- (void)setRequestNotificationExtensionTextLocalizationKey:(id)a3;
- (void)setRequestTitleTextAfterV2UpgradeLocalizationKey:(id)a3;
- (void)setRequestTitleTextForSubsequentRequestsKey:(id)a3;
- (void)setRequestTitleTextLocalizationKey:(id)a3;
- (void)setRequestUpgradeTitleTextLocalizationKey:(id)a3;
- (void)setSandboxOperationForDelegation:(id)a3;
- (void)setSaveExpiredEntries:(BOOL)a3;
- (void)setSecondaryUsageDescriptionKeyName:(id)a3;
- (void)setSessionPidAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setSettingsRequestFullTitleTextLocalizationKey:(id)a3;
- (void)setShouldAllowUnrestrictedCheckAuditToken:(BOOL)a3;
- (void)setShouldIssueSandboxExtension:(BOOL)a3;
- (void)setShouldTreatAsDeprecated:(BOOL)a3;
- (void)setShouldUseADefaultDescriptionString:(BOOL)a3;
- (void)setSubsequentRequestAllowAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setSubsequentRequestDenyAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setSubsequentRequestLimitedAuthorizationButtonTitleLocalizationKey:(id)a3;
- (void)setSubsequentRequestStringsRelatedService:(id)a3;
- (void)setSupportsStagedPrompting:(BOOL)a3;
- (void)setSyncAuthorizationTranslationBlock:(id)a3;
- (void)setTvOS_minimumSDKVersionNumber:(id)a3;
- (void)setTvOS_minimumSDKVersionNumberAuthSpecific:(id)a3;
- (void)setUpgradeV1AuthorizationValue:(BOOL)a3;
- (void)setUsageDescriptionKeyName:(id)a3;
- (void)setUsesTwoStagePrompting:(BOOL)a3;
- (void)setVOS_minimumSDKVersionNumber:(id)a3;
- (void)setVOS_minimumSDKVersionNumberAuthSpecific:(id)a3;
- (void)setValidOnPlatformNames:(id)a3;
- (void)setWatchOS_minimumSDKVersionNumber:(id)a3;
- (void)setWatchOS_minimumSDKVersionNumberAuthSpecific:(id)a3;
@end

@implementation TCCDService

- (NSNumber)expirySeconds
{
  return self->_expirySeconds;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)ios_allowRegionalPrompt
{
  return self->_ios_allowRegionalPrompt;
}

- (TCCDService)macos_compositionParentService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_macos_compositionParentService);
  return (TCCDService *)WeakRetained;
}

- (BOOL)upgradeV1AuthorizationValue
{
  return self->_upgradeV1AuthorizationValue;
}

- (unint64_t)authorizationVersionNumber
{
  return self->_authorizationVersionNumber;
}

- (BOOL)usesTwoStagePrompting
{
  return self->_usesTwoStagePrompting;
}

- (NSString)requestNotificationExtensionTextLocalizationKey
{
  return self->_requestNotificationExtensionTextLocalizationKey;
}

- (id)localizedTextWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(TCCDService *)self localizedResourcesBundle];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedStringForKey:v4 value:&stru_100096EC0 table:0];
    if (!v7)
    {
      v8 = +[TCCDPlatform currentPlatform];
      v9 = [v8 server];
      v10 = [v9 logHandle];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10004A348((uint64_t)self, (uint64_t)v4, v10);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSBundle)localizedResourcesBundle
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedResourcesBundle)
  {
    uint64_t v3 = +[NSBundle bundleWithPath:v2->_localizedResourcesBundlePath];
    localizedResourcesBundle = v2->_localizedResourcesBundle;
    v2->_localizedResourcesBundle = (NSBundle *)v3;
  }
  objc_sync_exit(v2);

  v5 = v2->_localizedResourcesBundle;
  if (!v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000492FC;
    block[3] = &unk_100094E78;
    block[4] = v2;
    if (qword_1000AC6C0 != -1) {
      dispatch_once(&qword_1000AC6C0, block);
    }
    v5 = v2->_localizedResourcesBundle;
  }
  return v5;
}

+ (id)serviceAll
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047F5C;
  block[3] = &unk_1000961D0;
  block[4] = a1;
  if (qword_1000AC6B8 != -1) {
    dispatch_once(&qword_1000AC6B8, block);
  }
  v2 = (void *)qword_1000AC6B0;
  return v2;
}

- (BOOL)shouldIssueSandboxExtension
{
  return self->_shouldIssueSandboxExtension;
}

- (BOOL)supportsStagedPrompting
{
  return self->_supportsStagedPrompting;
}

- (BOOL)ios_useGenericSandboxExtension
{
  return self->_ios_useGenericSandboxExtension;
}

- (int64_t)alertStyle
{
  return self->_alertStyle;
}

- (BOOL)shouldAllowUnrestrictedCheckAuditToken
{
  return self->_shouldAllowUnrestrictedCheckAuditToken;
}

- (BOOL)isAccessAllowedByDefault
{
  return self->_isAccessAllowedByDefault;
}

- (BOOL)hasParanoidSecurityPolicy
{
  return self->_hasParanoidSecurityPolicy;
}

- (NSArray)disallowedOnPlatformSubtypeNameList
{
  return self->_disallowedOnPlatformSubtypeNameList;
}

- (id)authorizationRightStateForValue:(unint64_t)a3 reason:(unint64_t)a4
{
  if ((id)[(TCCDService *)self authorizationValueType] == (id)1)
  {
    v6 = objc_alloc_init(TCCDAuthorizationRightState);
    [(TCCDAuthorizationRightState *)v6 setRight:a3];
    [(TCCDAuthorizationRightState *)v6 setReason:a4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)authorizationValueType
{
  return self->_authorizationValueType;
}

- (BOOL)isAccessDeniedByDefault
{
  return self->_isAccessDeniedByDefault;
}

- (BOOL)applyDevelopmentAuthorizationPolicy
{
  return self->_applyDevelopmentAuthorizationPolicy;
}

- (unint64_t)accessActionStatusForAuthorizationValue:(unint64_t)a3
{
  unint64_t v4 = [(TCCDService *)self authorizationValueType];
  unint64_t result = 0;
  if (v4 == 1 && a3 <= 5) {
    return qword_100076338[a3];
  }
  return result;
}

+ (id)allServices
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044884;
  block[3] = &unk_1000961D0;
  block[4] = a1;
  if (qword_1000AC6A8 != -1) {
    dispatch_once(&qword_1000AC6A8, block);
  }
  v2 = (void *)qword_1000AC6A0;
  return v2;
}

+ (id)serviceDescriptionsForPlatformName:(id)a3
{
  id v4 = a3;
  v20 = [a1 allServices];
  v5 = [v20 allObjects];
  v6 = [v5 sortedArrayUsingSelector:"compare:"];

  v21 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v13 = [v12 validOnPlatformNames];
        unsigned __int8 v14 = [v13 containsObject:v4];

        if ((v14 & 1) != 0 || [v4 isEqualToString:@"all"])
        {
          uint64_t v15 = [a1 serviceAll];
          if (v12 != (void *)v15)
          {
            v16 = (void *)v15;
            unsigned __int8 v17 = [v12 shouldTreatAsDeprecated];

            if (v17) {
              continue;
            }
            v12 = [v12 descriptionDictionary];
            [v21 addObject:v12];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  id v18 = [v21 copy];
  return v18;
}

+ (id)tccdPlatformNameForDYLDPlatformName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"macos"])
  {
    id v4 = &TCCDPlatformNameMacOS;
LABEL_9:
    v5 = *v4;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"ios"])
  {
    id v4 = &TCCDPlatformNameIOS;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"watchos"])
  {
    id v4 = &TCCDPlatformNameWatchOS;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"tvos"])
  {
    id v4 = &TCCDPlatformNameTVOS;
    goto LABEL_9;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

+ (id)versionStringFromDYLDVersionNumber:(id)a3
{
  id v3 = [a3 unsignedIntValue];
  if ((_BYTE)v3) {
    +[NSString stringWithFormat:@"%u.%u.%u", BYTE2(v3), BYTE1(v3), v3];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"%u.%u", BYTE2(v3), BYTE1(v3), v6];
  }
  return v4;
}

+ (id)localizationKeyName:(id)a3 forServiceName:(id)a4
{
  return +[NSString stringWithFormat:@"%@_%@", a3, a4];
}

+ (id)localizationKeyNameWithFeatureFlagEnabled:(id)a3
{
  return +[NSString stringWithFormat:@"%@_%@", a3, @"FEATURE_FLAG_ENABLED"];
}

+ (id)reminderTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REMINDER_ACCESS_SERVICE" forServiceName:a3];
}

+ (id)requestTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SERVICE" forServiceName:a3];
}

+ (id)requestTitleTextAfterV2UpgradeLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_V2_UPGRADE_SERVICE" forServiceName:a3];
}

+ (id)requestTitleTextForSubsequentRequestsLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SUBSEQUENT_SERVICE" forServiceName:a3];
}

+ (id)requestAdditionalTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_INFO_SERVICE" forServiceName:a3];
}

+ (id)requestAdditionalTextAfterV2UpgradeLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_INFO_V2_UPGRADE_SERVICE" forServiceName:a3];
}

+ (id)requestAdditionalTextForSubsequentRequestsKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_INFO_SUBSEQUENT_SERVICE" forServiceName:a3];
}

+ (id)requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_ALLOW" forServiceName:a3];
}

+ (id)reminderRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REMINDER_REQUEST_ACCESS_ALLOW" forServiceName:a3];
}

+ (id)requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_DENY" forServiceName:a3];
}

+ (id)requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_LIMITED" forServiceName:a3];
}

+ (id)reminderRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REMINDER_REQUEST_ACCESS_LIMITED" forServiceName:a3];
}

+ (id)subsequentRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SUBSEQUENT_ALLOW" forServiceName:a3];
}

+ (id)subsequentRequestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SUBSEQUENT_DENY" forServiceName:a3];
}

+ (id)subsequentRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SUBSEQUENT_LIMITED" forServiceName:a3];
}

+ (id)requestDenyNotificationTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"NOTIFY_SERVICE" forServiceName:a3];
}

+ (id)requestDenyNotificationButtonTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"NOTIFY_BUTTON" forServiceName:a3];
}

+ (id)requestAdditionalTextExtensionLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_INFO_EXTENSION_SERVICE" forServiceName:a3];
}

+ (id)requestAlternateTitleTextLocalizationKeyNameForServiceName:(id)a3
{
  return [a1 localizationKeyName:@"REQUEST_ACCESS_SERVICE_ENTITLEMENT" forServiceName:a3];
}

- (TCCDService)initWithName:(id)a3 availability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)TCCDService;
  id v8 = [(TCCDService *)&v32 init];
  if (v8)
  {
    id v9 = [v6 copy];
    [(TCCDService *)v8 setName:v9];

    uint64_t v10 = [(TCCDService *)v8 name];
    v11 = [v10 substringFromIndex:objc_msgSend(@"kTCCService", "length")];
    [(TCCDService *)v8 setExternalName:v11];

    [(TCCDService *)v8 setMdm_macos_allowedInPayloadDefition:1];
    v12 = objc_opt_new();
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_10004886C;
    v29 = &unk_100096468;
    v13 = v8;
    v30 = v13;
    id v14 = v12;
    id v31 = v14;
    [v7 enumerateKeysAndObjectsUsingBlock:&v26];
    -[TCCDService setValidOnPlatformNames:](v13, "setValidOnPlatformNames:", v14, v26, v27, v28, v29);
    [(TCCDService *)v13 setUsesTwoStagePrompting:0];
    [(TCCDService *)v13 setPlatformAvailability:v7];
    [(TCCDService *)v13 setAuthorizationValueType:1];
    [(TCCDService *)v13 setAuthorizationRightsMask:7];
    [(TCCDService *)v13 setAuthorizationVersionNumber:1];
    [(TCCDService *)v13 setAllowedForAvocadoWidget:1];
    uint64_t v15 = +[TCCDService defaultLocalizedResourcesBundlePath];
    [(TCCDService *)v13 setLocalizedResourcesBundlePath:v15];

    [(TCCDService *)v13 setAllowAuthorizationButtonTitleLocalizationKey:@"REQUEST_ACCESS_ALLOW"];
    [(TCCDService *)v13 setDenyAuthorizationButtonTitleLocalizationKey:@"REQUEST_ACCESS_DENY"];
    v16 = [(TCCDService *)v13 name];
    unsigned __int8 v17 = +[TCCDService requestTitleTextLocalizationKeyNameForServiceName:v16];
    [(TCCDService *)v13 setRequestTitleTextLocalizationKey:v17];

    id v18 = [(TCCDService *)v13 requestTitleTextLocalizationKey];

    if (!v18) {
      sub_10004A1E0();
    }
    v19 = [(TCCDService *)v13 name];
    v20 = +[TCCDService requestDenyNotificationTitleTextLocalizationKeyNameForServiceName:v19];
    [(TCCDService *)v13 setNotificationTitleTextLocalizationKey:v20];

    v21 = [(TCCDService *)v13 notificationTitleTextLocalizationKey];

    if (!v21) {
      sub_10004A1E0();
    }
    long long v22 = [(TCCDService *)v13 name];
    long long v23 = +[TCCDService requestDenyNotificationButtonTitleTextLocalizationKeyNameForServiceName:v22];
    [(TCCDService *)v13 setNotificationButtonTitleLocalizationKey:v23];

    long long v24 = [(TCCDService *)v13 notificationButtonTitleLocalizationKey];

    if (!v24) {
      sub_10004A1E0();
    }
    [(TCCDService *)v13 setLimitedAuthorizationButtonTitleLocalizationKey:0];
    [(TCCDService *)v13 setRequestTitleTextAfterV2UpgradeLocalizationKey:0];
    [(TCCDService *)v13 setRequestAdditionalTextLocalizationKey:0];
    [(TCCDService *)v13 setRequestAdditionalTextAfterV2UpgradeLocalizationKey:0];
    [(TCCDService *)v13 setRequestTitleTextForSubsequentRequestsKey:0];
    [(TCCDService *)v13 setRequestAdditionalTextForSubsequentRequestsLocalizationKey:0];
    [(TCCDService *)v13 setRequestNotificationExtensionTextLocalizationKey:0];
    [(TCCDService *)v13 setReminderTitleTextLocalizationKey:0];
    [(TCCDService *)v13 setReminderAllowButtonTitleTextLocalizationKey:0];
    [(TCCDService *)v13 setReminderLimitedButtonTitleTextLocalizationKey:0];
    [(TCCDService *)v13 setCancelButtontitleLocalizationKey:@"REQUEST_ACCESS_CANCEL"];
    [(TCCDService *)v13 setAlternatePromptTitleEntitlement:0];
    [(TCCDService *)v13 setRequestEntitlementTitleTextLocalizationKey:0];
    [(TCCDService *)v13 setPromptAuthorizationChoiceBlock:&stru_100096488];
    [(TCCDService *)v13 setPromptButtonLocalizationKeyBlock:&stru_1000964A8];
    [(TCCDService *)v13 setDefaultDesiredAuth:2];
    [(TCCDService *)v13 setSyncAuthorizationTranslationBlock:&stru_1000964C8];
    [(TCCDService *)v13 setRecordAnalyticsPopulationBlock:&stru_100096508];
  }
  return v8;
}

- (id)descriptionDictionary
{
  id v3 = objc_opt_new();
  id v4 = [(TCCDService *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  v5 = [(TCCDService *)self externalName];
  [v3 setObject:v5 forKeyedSubscript:@"externalName"];

  id v6 = [(TCCDService *)self usageDescriptionKeyName];
  [v3 setObject:v6 forKeyedSubscript:@"usageDescriptionKeyName"];

  id v7 = [(TCCDService *)self validOnPlatformNames];
  id v8 = [v7 allObjects];
  [v3 setObject:v8 forKeyedSubscript:@"platforms"];

  id v9 = [(TCCDService *)self platformAvailability];
  [v3 setObject:v9 forKeyedSubscript:@"platformAvailibilityVersionNumbers"];

  uint64_t v10 = [(TCCDService *)self fullAccessUsageDescriptionKeyName];

  if (v10)
  {
    v11 = [(TCCDService *)self fullAccessUsageDescriptionKeyName];
    [v3 setObject:v11 forKeyedSubscript:@"fullAccessUsageDescriptionKeyName"];
  }
  v12 = [(TCCDService *)self addAccessUsageDescriptionKeyName];

  if (v12)
  {
    v13 = [(TCCDService *)self addAccessUsageDescriptionKeyName];
    [v3 setObject:v13 forKeyedSubscript:@"addAccessUsageDescriptionKeyName"];
  }
  if ([(TCCDService *)self supportsStagedPrompting])
  {
    id v14 = +[NSNumber numberWithBool:[(TCCDService *)self supportsStagedPrompting]];
    [v3 setObject:v14 forKeyedSubscript:@"supportsStagedPrompting"];
  }
  uint64_t v15 = objc_opt_new();
  v16 = [(TCCDService *)self platformAvailability];
  v48 = _NSConcreteStackBlock;
  uint64_t v49 = 3221225472;
  v50 = sub_100048FA8;
  v51 = &unk_100096468;
  id v17 = v15;
  id v52 = v17;
  v53 = self;
  [v16 enumerateKeysAndObjectsUsingBlock:&v48];

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, @"platformAvailibilityVersionStrings", v48, v49, v50, v51);
  if ([(TCCDService *)self mdm_isAuthorizationDenyOnly])
  {
    id v18 = +[NSNumber numberWithBool:[(TCCDService *)self mdm_isAuthorizationDenyOnly]];
    [v3 setObject:v18 forKeyedSubscript:@"mdm_isAuthorizationDenyOnly"];
  }
  v19 = +[NSNumber numberWithBool:[(TCCDService *)self mdm_macos_allowedInPayloadDefition]];
  [v3 setObject:v19 forKeyedSubscript:@"mdm_macos_allowedInPayloadDefition"];

  if ([(TCCDService *)self mdm_allowStandardUserToSetSystemService])
  {
    v20 = +[NSNumber numberWithBool:[(TCCDService *)self mdm_allowStandardUserToSetSystemService]];
    [v3 setObject:v20 forKeyedSubscript:@"mdm_allowStandardUserToSetSystemService"];
  }
  if ([(TCCDService *)self macos_hasIndirectObject])
  {
    v21 = +[NSNumber numberWithBool:[(TCCDService *)self macos_hasIndirectObject]];
    [v3 setObject:v21 forKeyedSubscript:@"macos_hasIndirectObject"];
  }
  if ([(TCCDService *)self macos_isPerSystem])
  {
    long long v22 = +[NSNumber numberWithBool:[(TCCDService *)self macos_isPerSystem]];
    [v3 setObject:v22 forKeyedSubscript:@"macos_isPerSystem"];
  }
  long long v23 = [(TCCDService *)self macos_hardenedRuntimeEntitlementName];

  if (v23)
  {
    long long v24 = [(TCCDService *)self macos_hardenedRuntimeEntitlementName];
    [v3 setObject:v24 forKeyedSubscript:@"macos_hardenedRuntimeEntitlementName"];
  }
  long long v25 = [(TCCDService *)self macos_minimumSDKVersionNumber];

  if (v25)
  {
    v26 = [(TCCDService *)self macos_minimumSDKVersionNumber];
    [v3 setObject:v26 forKeyedSubscript:@"macos_minimumSDKVersionNumber"];

    uint64_t v27 = objc_opt_class();
    v28 = [(TCCDService *)self macos_minimumSDKVersionNumber];
    v29 = [v27 versionStringFromDYLDVersionNumber:v28];
    [v3 setObject:v29 forKeyedSubscript:@"macos_minimumSDKVersionString"];
  }
  v30 = [(TCCDService *)self macos_helpAnchor];

  if (v30)
  {
    id v31 = [(TCCDService *)self macos_helpAnchor];
    [v3 setObject:v31 forKeyedSubscript:@"macos_helpAnchor"];
  }
  objc_super v32 = [(TCCDService *)self tvOS_minimumSDKVersionNumber];

  if (v32)
  {
    v33 = [(TCCDService *)self tvOS_minimumSDKVersionNumber];
    [v3 setObject:v33 forKeyedSubscript:@"tvOS_minimumSDKVersionNumber"];

    v34 = objc_opt_class();
    v35 = [(TCCDService *)self tvOS_minimumSDKVersionNumber];
    v36 = [v34 versionStringFromDYLDVersionNumber:v35];
    [v3 setObject:v36 forKeyedSubscript:@"tvOS_minimumSDKVersionString"];
  }
  v37 = [(TCCDService *)self watchOS_minimumSDKVersionNumber];

  if (v37)
  {
    v38 = [(TCCDService *)self watchOS_minimumSDKVersionNumber];
    [v3 setObject:v38 forKeyedSubscript:@"watchOS_minimumSDKVersionNumber"];

    v39 = objc_opt_class();
    v40 = [(TCCDService *)self watchOS_minimumSDKVersionNumber];
    v41 = [v39 versionStringFromDYLDVersionNumber:v40];
    [v3 setObject:v41 forKeyedSubscript:@"watchOS_minimumSDKVersionString"];
  }
  v42 = [(TCCDService *)self iOS_minimumSDKVersionNumber];

  if (v42)
  {
    v43 = [(TCCDService *)self iOS_minimumSDKVersionNumber];
    [v3 setObject:v43 forKeyedSubscript:@"iOS_minimumSDKVersionNumber"];

    v44 = objc_opt_class();
    v45 = [(TCCDService *)self iOS_minimumSDKVersionNumber];
    v46 = [v44 versionStringFromDYLDVersionNumber:v45];
    [v3 setObject:v46 forKeyedSubscript:@"iOS_minimumSDKVersionString"];
  }
  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(TCCDService *)self name];
  id v6 = [v4 name];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (BOOL)isAuthorizationValue:(unint64_t)a3 equalToRight:(unint64_t)a4
{
  unint64_t v6 = [(TCCDService *)self authorizationValueType];
  return a3 == a4 && v6 == 1;
}

- (id)descriptionForAuthorizationValue:(unint64_t)a3 reason:(unint64_t)a4
{
  if ((id)[(TCCDService *)self authorizationValueType] == (id)1)
  {
    id v7 = [(TCCDService *)self authorizationRightStateForValue:a3 reason:a4];
    id v8 = [v7 description];
  }
  else
  {
    id v8 = +[NSString stringWithFormat:@"0x%llx", a3];
  }
  return v8;
}

- (BOOL)pardonMissingUsage
{
  return 0;
}

- (unint64_t)authorizationPromptRightsMask
{
  return [(TCCDService *)self authorizationRightsMask] & 0xFFFFFFFFFFFFFFFDLL;
}

- (int64_t)developmentAuthorizationValue
{
  if (![(TCCDService *)self applyDevelopmentAuthorizationPolicy]) {
    return 0;
  }
  id v3 = [(TCCDService *)self name];
  id v4 = +[NSString stringWithFormat:@"DevelopmentAuthorizationPolicy.%@", v3];

  CFPropertyListRef v5 = CFPreferencesCopyValue(v4, @"com.apple.tccd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v5 && (v6 = (void *)v5, CFTypeID v7 = CFGetTypeID(v5), v7 == CFStringGetTypeID()))
  {
    if ([v6 caseInsensitiveCompare:@"allow"])
    {
      if ([v6 caseInsensitiveCompare:@"deny"])
      {
        [v6 caseInsensitiveCompare:@"none"];
        int64_t v8 = 0;
      }
      else
      {
        int64_t v8 = 2;
      }
    }
    else
    {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = [(TCCDService *)self defaultDevelopmentAuthorizationValue];
  }

  return v8;
}

- (void)setLocalizedResourcesBundlePath:(id)a3
{
  self->_localizedResourcesBundlePath = (NSString *)[a3 copy];
  _objc_release_x1();
}

+ (id)defaultLocalizedResourcesBundlePath
{
  return @"/System/Library/PrivateFrameworks/TCC.framework";
}

- (NSBundle)defaultLocalizedResourcesBundle
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_defaultLocalizedResourcesBundle)
  {
    id v3 = +[TCCDService defaultLocalizedResourcesBundlePath];
    uint64_t v4 = +[NSBundle bundleWithPath:v3];
    defaultLocalizedResourcesBundle = v2->_defaultLocalizedResourcesBundle;
    v2->_defaultLocalizedResourcesBundle = (NSBundle *)v4;
  }
  objc_sync_exit(v2);

  unint64_t v6 = v2->_defaultLocalizedResourcesBundle;
  if (!v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000494AC;
    block[3] = &unk_100094E78;
    block[4] = v2;
    if (qword_1000AC6C8 != -1) {
      dispatch_once(&qword_1000AC6C8, block);
    }
    unint64_t v6 = v2->_defaultLocalizedResourcesBundle;
  }
  return v6;
}

- (id)requestTitleTextLocalizationKeyForAuthorization:(unint64_t)a3
{
  switch(a3)
  {
    case 4uLL:
      id v3 = [(TCCDService *)self requestAddTitleTextLocalizationKey];
      break;
    case 3uLL:
      id v3 = [(TCCDService *)self requestLimitedTitleTextLocalizationKey];
      break;
    case 2uLL:
      id v3 = [(TCCDService *)self requestFullTitleTextLocalizationKey];
      break;
    default:
      id v3 = 0;
      break;
  }
  return v3;
}

- (id)buttonTitleLocalizationKeyForAuthorization:(unint64_t)a3 desiredAuth:(unint64_t)a4
{
  unint64_t v6 = [(TCCDService *)self localizationKeyForButtonAuth:a3 desiredAuth:a4];
  if (!v6)
  {
    switch(a3)
    {
      case 0uLL:
        unint64_t v6 = [(TCCDService *)self denyAuthorizationButtonTitleLocalizationKey];
        break;
      case 2uLL:
        unint64_t v6 = [(TCCDService *)self allowAuthorizationButtonTitleLocalizationKey];
        break;
      case 3uLL:
        unint64_t v6 = [(TCCDService *)self limitedAuthorizationButtonTitleLocalizationKey];
        break;
      case 4uLL:
        unint64_t v6 = [(TCCDService *)self addModifyAddedAuthorizationButtonTitleLocalizationKey];
        break;
      case 5uLL:
        unint64_t v6 = [(TCCDService *)self sessionPidAuthorizationButtonTitleLocalizationKey];
        break;
      case 6uLL:
        unint64_t v6 = [(TCCDService *)self moreAuthorizationOptionsButtonTitleLocalizationKey];
        break;
      default:
        break;
    }
  }
  return v6;
}

- (id)usageDescriptionKeyForAuthorization:(unint64_t)a3
{
  if (a3 == 4)
  {
    id v3 = [(TCCDService *)self addAccessUsageDescriptionKeyName];
  }
  else if (a3 == 2)
  {
    id v3 = [(TCCDService *)self fullAccessUsageDescriptionKeyName];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (int)authorizationChoicesForCurrentAuth:(unint64_t)a3 desiredAuth:(unint64_t)a4 aButtonAuth:(unint64_t *)a5 bButtonAuth:(unint64_t *)a6 cButtonAuth:(unint64_t *)a7
{
  return (*((uint64_t (**)(void))self->_promptAuthorizationChoiceBlock + 2))();
}

- (id)localizationKeyForButtonAuth:(unint64_t)a3 desiredAuth:(unint64_t)a4
{
  return (id)(*((uint64_t (**)(void))self->_promptButtonLocalizationKeyBlock + 2))();
}

- (unint64_t)translateAuth:(unint64_t)a3 versionUpgrade:(BOOL)a4
{
  return (*((uint64_t (**)(void))self->_syncAuthorizationTranslationBlock + 2))();
}

- (id)populateRecordMetricWithFields:(id)a3
{
  return (id)(*((uint64_t (**)(void))self->_recordAnalyticsPopulationBlock + 2))();
}

- (BOOL)getUsesTwoStagePrompting
{
  return self->_usesTwoStagePrompting;
}

- (void)setUsesTwoStagePrompting:(BOOL)a3
{
  self->_usesTwoStagePrompting = a3;
}

- (NSDictionary)platformAvailability
{
  return self->_platformAvailability;
}

- (void)setPlatformAvailability:(id)a3
{
}

- (NSSet)validOnPlatformNames
{
  return self->_validOnPlatformNames;
}

- (void)setValidOnPlatformNames:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSString)externalName
{
  return self->_externalName;
}

- (void)setExternalName:(id)a3
{
}

- (BOOL)shouldTreatAsDeprecated
{
  return self->_shouldTreatAsDeprecated;
}

- (void)setShouldTreatAsDeprecated:(BOOL)a3
{
  self->_shouldTreatAsDeprecated = a3;
}

- (BOOL)mdm_isAuthorizationDenyOnly
{
  return self->_mdm_isAuthorizationDenyOnly;
}

- (void)setMdm_isAuthorizationDenyOnly:(BOOL)a3
{
  self->_mdm_isAuthorizationDenyOnly = a3;
}

- (BOOL)mdm_macos_allowedInPayloadDefition
{
  return self->_mdm_macos_allowedInPayloadDefition;
}

- (void)setMdm_macos_allowedInPayloadDefition:(BOOL)a3
{
  self->_mdm_macos_allowedInPayloadDefition = a3;
}

- (BOOL)mdm_allowStandardUserToSetSystemService
{
  return self->_mdm_allowStandardUserToSetSystemService;
}

- (void)setMdm_allowStandardUserToSetSystemService:(BOOL)a3
{
  self->_mdm_allowStandardUserToSetSystemService = a3;
}

- (NSString)usageDescriptionKeyName
{
  return self->_usageDescriptionKeyName;
}

- (void)setUsageDescriptionKeyName:(id)a3
{
}

- (NSString)secondaryUsageDescriptionKeyName
{
  return self->_secondaryUsageDescriptionKeyName;
}

- (void)setSecondaryUsageDescriptionKeyName:(id)a3
{
}

- (NSString)fullAccessUsageDescriptionKeyName
{
  return self->_fullAccessUsageDescriptionKeyName;
}

- (void)setFullAccessUsageDescriptionKeyName:(id)a3
{
}

- (NSString)addAccessUsageDescriptionKeyName
{
  return self->_addAccessUsageDescriptionKeyName;
}

- (void)setAddAccessUsageDescriptionKeyName:(id)a3
{
}

- (BOOL)shouldUseADefaultDescriptionString
{
  return self->_shouldUseADefaultDescriptionString;
}

- (void)setShouldUseADefaultDescriptionString:(BOOL)a3
{
  self->_shouldUseADefaultDescriptionString = a3;
}

- (void)setDisallowedOnPlatformSubtypeNameList:(id)a3
{
}

- (void)setShouldIssueSandboxExtension:(BOOL)a3
{
  self->_shouldIssueSandboxExtension = a3;
}

- (void)setIos_useGenericSandboxExtension:(BOOL)a3
{
  self->_ios_useGenericSandboxExtension = a3;
}

- (BOOL)isRevocable
{
  return self->_isRevocable;
}

- (void)setIsRevocable:(BOOL)a3
{
  self->_isRevocable = a3;
}

- (void)setAlertStyle:(int64_t)a3
{
  self->_alertStyle = a3;
}

- (void)setIsAccessAllowedByDefault:(BOOL)a3
{
  self->_isAccessAllowedByDefault = a3;
}

- (void)setIsAccessDeniedByDefault:(BOOL)a3
{
  self->_isAccessDeniedByDefault = a3;
}

- (BOOL)allowPromptForPlatformBinaries
{
  return self->_allowPromptForPlatformBinaries;
}

- (void)setAllowPromptForPlatformBinaries:(BOOL)a3
{
  self->_allowPromptForPlatformBinaries = a3;
}

- (void)setShouldAllowUnrestrictedCheckAuditToken:(BOOL)a3
{
  self->_shouldAllowUnrestrictedCheckAuditToken = a3;
}

- (void)setHasParanoidSecurityPolicy:(BOOL)a3
{
  self->_hasParanoidSecurityPolicy = a3;
}

- (NSURL)notificationActionURL
{
  return self->_notificationActionURL;
}

- (void)setNotificationActionURL:(id)a3
{
}

- (NSString)sandboxOperationForDelegation
{
  return self->_sandboxOperationForDelegation;
}

- (void)setSandboxOperationForDelegation:(id)a3
{
}

- (NSArray)defaultAllowedPlatformIdentifiersList
{
  return self->_defaultAllowedPlatformIdentifiersList;
}

- (void)setDefaultAllowedPlatformIdentifiersList:(id)a3
{
}

- (BOOL)doNotStoreDefaultAllowAccess
{
  return self->_doNotStoreDefaultAllowAccess;
}

- (void)setDoNotStoreDefaultAllowAccess:(BOOL)a3
{
  self->_doNotStoreDefaultAllowAccess = a3;
}

- (void)setExpirySeconds:(id)a3
{
}

- (BOOL)expireOnlyAllowedEntries
{
  return self->_expireOnlyAllowedEntries;
}

- (void)setExpireOnlyAllowedEntries:(BOOL)a3
{
  self->_expireOnlyAllowedEntries = a3;
}

- (BOOL)saveExpiredEntries
{
  return self->_saveExpiredEntries;
}

- (void)setSaveExpiredEntries:(BOOL)a3
{
  self->_saveExpiredEntries = a3;
}

- (NSString)firstStagePromptHeaderAssetCatalogPath
{
  return self->_firstStagePromptHeaderAssetCatalogPath;
}

- (void)setFirstStagePromptHeaderAssetCatalogPath:(id)a3
{
}

- (NSString)firstStagePromptHeaderAssetName
{
  return self->_firstStagePromptHeaderAssetName;
}

- (void)setFirstStagePromptHeaderAssetName:(id)a3
{
}

- (void)setApplyDevelopmentAuthorizationPolicy:(BOOL)a3
{
  self->_applyDevelopmentAuthorizationPolicy = a3;
}

- (int64_t)defaultDevelopmentAuthorizationValue
{
  return self->_defaultDevelopmentAuthorizationValue;
}

- (void)setDefaultDevelopmentAuthorizationValue:(int64_t)a3
{
  self->_defaultDevelopmentAuthorizationValue = a3;
}

- (BOOL)checkAllowEntitlementOnResponsibleProcess
{
  return self->_checkAllowEntitlementOnResponsibleProcess;
}

- (void)setCheckAllowEntitlementOnResponsibleProcess:(BOOL)a3
{
  self->_checkAllowEntitlementOnResponsibleProcess = a3;
}

- (TCCDAlertManager)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
}

- (void)setAuthorizationValueType:(unint64_t)a3
{
  self->_authorizationValueType = a3;
}

- (unint64_t)authorizationRightsMask
{
  return self->_authorizationRightsMask;
}

- (void)setAuthorizationRightsMask:(unint64_t)a3
{
  self->_authorizationRightsMask = a3;
}

- (void)setUpgradeV1AuthorizationValue:(BOOL)a3
{
  self->_upgradeV1AuthorizationValue = a3;
}

- (void)setAuthorizationVersionNumber:(unint64_t)a3
{
  self->_authorizationVersionNumber = a3;
}

- (NSString)localizedResourcesBundlePath
{
  return self->_localizedResourcesBundlePath;
}

- (void)setLocalizedResourcesBundle:(id)a3
{
}

- (void)setDefaultLocalizedResourcesBundle:(id)a3
{
}

- (NSString)allowAuthorizationButtonTitleLocalizationKey
{
  return self->_allowAuthorizationButtonTitleLocalizationKey;
}

- (void)setAllowAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)denyAuthorizationButtonTitleLocalizationKey
{
  return self->_denyAuthorizationButtonTitleLocalizationKey;
}

- (void)setDenyAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)moreAuthorizationOptionsButtonTitleLocalizationKey
{
  return self->_moreAuthorizationOptionsButtonTitleLocalizationKey;
}

- (NSString)limitedAuthorizationButtonTitleLocalizationKey
{
  return self->_limitedAuthorizationButtonTitleLocalizationKey;
}

- (void)setLimitedAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)addModifyAddedAuthorizationButtonTitleLocalizationKey
{
  return self->_addModifyAddedAuthorizationButtonTitleLocalizationKey;
}

- (void)setAddModifyAddedAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)sessionPidAuthorizationButtonTitleLocalizationKey
{
  return self->_sessionPidAuthorizationButtonTitleLocalizationKey;
}

- (void)setSessionPidAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)cancelButtontitleLocalizationKey
{
  return self->_cancelButtontitleLocalizationKey;
}

- (void)setCancelButtontitleLocalizationKey:(id)a3
{
}

- (NSString)subsequentRequestAllowAuthorizationButtonTitleLocalizationKey
{
  return self->_subsequentRequestAllowAuthorizationButtonTitleLocalizationKey;
}

- (void)setSubsequentRequestAllowAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)subsequentRequestDenyAuthorizationButtonTitleLocalizationKey
{
  return self->_subsequentRequestDenyAuthorizationButtonTitleLocalizationKey;
}

- (void)setSubsequentRequestDenyAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey
{
  return self->_subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey;
}

- (void)setSubsequentRequestLimitedAuthorizationButtonTitleLocalizationKey:(id)a3
{
}

- (NSString)requestTitleTextLocalizationKey
{
  return self->_requestTitleTextLocalizationKey;
}

- (void)setRequestTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestTitleTextAfterV2UpgradeLocalizationKey
{
  return self->_requestTitleTextAfterV2UpgradeLocalizationKey;
}

- (void)setRequestTitleTextAfterV2UpgradeLocalizationKey:(id)a3
{
}

- (NSString)requestTitleTextForSubsequentRequestsKey
{
  return self->_requestTitleTextForSubsequentRequestsKey;
}

- (void)setRequestTitleTextForSubsequentRequestsKey:(id)a3
{
}

- (NSString)requestFullTitleTextLocalizationKey
{
  return self->_requestFullTitleTextLocalizationKey;
}

- (void)setRequestFullTitleTextLocalizationKey:(id)a3
{
}

- (NSString)settingsRequestFullTitleTextLocalizationKey
{
  return self->_settingsRequestFullTitleTextLocalizationKey;
}

- (void)setSettingsRequestFullTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestAddTitleTextLocalizationKey
{
  return self->_requestAddTitleTextLocalizationKey;
}

- (void)setRequestAddTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestLimitedTitleTextLocalizationKey
{
  return self->_requestLimitedTitleTextLocalizationKey;
}

- (void)setRequestLimitedTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestEntitlementTitleTextLocalizationKey
{
  return self->_requestEntitlementTitleTextLocalizationKey;
}

- (void)setRequestEntitlementTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestUpgradeTitleTextLocalizationKey
{
  return self->_requestUpgradeTitleTextLocalizationKey;
}

- (void)setRequestUpgradeTitleTextLocalizationKey:(id)a3
{
}

- (NSString)reminderTitleTextLocalizationKey
{
  return self->_reminderTitleTextLocalizationKey;
}

- (void)setReminderTitleTextLocalizationKey:(id)a3
{
}

- (NSString)reminderAllowButtonTitleTextLocalizationKey
{
  return self->_reminderAllowButtonTitleTextLocalizationKey;
}

- (void)setReminderAllowButtonTitleTextLocalizationKey:(id)a3
{
}

- (NSString)reminderLimitedButtonTitleTextLocalizationKey
{
  return self->_reminderLimitedButtonTitleTextLocalizationKey;
}

- (void)setReminderLimitedButtonTitleTextLocalizationKey:(id)a3
{
}

- (NSString)requestAdditionalTextLocalizationKey
{
  return self->_requestAdditionalTextLocalizationKey;
}

- (void)setRequestAdditionalTextLocalizationKey:(id)a3
{
}

- (NSString)requestAdditionalTextAfterV2UpgradeLocalizationKey
{
  return self->_requestAdditionalTextAfterV2UpgradeLocalizationKey;
}

- (void)setRequestAdditionalTextAfterV2UpgradeLocalizationKey:(id)a3
{
}

- (NSString)requestAdditionalTextForSubsequentRequestsLocalizationKey
{
  return self->_requestAdditionalTextForSubsequentRequestsLocalizationKey;
}

- (void)setRequestAdditionalTextForSubsequentRequestsLocalizationKey:(id)a3
{
}

- (void)setRequestNotificationExtensionTextLocalizationKey:(id)a3
{
}

- (TCCDService)subsequentRequestStringsRelatedService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subsequentRequestStringsRelatedService);
  return (TCCDService *)WeakRetained;
}

- (void)setSubsequentRequestStringsRelatedService:(id)a3
{
}

- (NSString)notificationTitleTextLocalizationKey
{
  return self->_notificationTitleTextLocalizationKey;
}

- (void)setNotificationTitleTextLocalizationKey:(id)a3
{
}

- (NSString)notificationButtonTitleLocalizationKey
{
  return self->_notificationButtonTitleLocalizationKey;
}

- (void)setNotificationButtonTitleLocalizationKey:(id)a3
{
}

- (NSNumber)ios_watchKitUserNotificationNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setIos_watchKitUserNotificationNumber:(id)a3
{
}

- (NSNumber)iOS_minimumSDKVersionNumber
{
  return self->_iOS_minimumSDKVersionNumber;
}

- (void)setIOS_minimumSDKVersionNumber:(id)a3
{
}

- (NSNumber)watchOS_minimumSDKVersionNumber
{
  return self->_watchOS_minimumSDKVersionNumber;
}

- (void)setWatchOS_minimumSDKVersionNumber:(id)a3
{
}

- (NSNumber)tvOS_minimumSDKVersionNumber
{
  return self->_tvOS_minimumSDKVersionNumber;
}

- (void)setTvOS_minimumSDKVersionNumber:(id)a3
{
}

- (NSNumber)vOS_minimumSDKVersionNumber
{
  return self->_vOS_minimumSDKVersionNumber;
}

- (void)setVOS_minimumSDKVersionNumber:(id)a3
{
}

- (NSDictionary)iOS_minimumSDKVersionNumberAuthSpecific
{
  return self->_iOS_minimumSDKVersionNumberAuthSpecific;
}

- (void)setIOS_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (NSDictionary)watchOS_minimumSDKVersionNumberAuthSpecific
{
  return self->_watchOS_minimumSDKVersionNumberAuthSpecific;
}

- (void)setWatchOS_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (NSDictionary)tvOS_minimumSDKVersionNumberAuthSpecific
{
  return self->_tvOS_minimumSDKVersionNumberAuthSpecific;
}

- (void)setTvOS_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (NSDictionary)vOS_minimumSDKVersionNumberAuthSpecific
{
  return self->_vOS_minimumSDKVersionNumberAuthSpecific;
}

- (void)setVOS_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (unint64_t)defaultDesiredAuth
{
  return self->_defaultDesiredAuth;
}

- (void)setDefaultDesiredAuth:(unint64_t)a3
{
  self->_defaultDesiredAuth = a3;
}

- (BOOL)ios_allowPromptFromAppClip
{
  return self->_ios_allowPromptFromAppClip;
}

- (void)setIos_allowPromptFromAppClip:(BOOL)a3
{
  self->_ios_allowPromptFromAppClip = a3;
}

- (void)setIos_allowRegionalPrompt:(BOOL)a3
{
  self->_ios_allowRegionalPrompt = a3;
}

- (BOOL)allowedForAvocadoWidget
{
  return self->_allowedForAvocadoWidget;
}

- (void)setAllowedForAvocadoWidget:(BOOL)a3
{
  self->_allowedForAvocadoWidget = a3;
}

- (void)setSupportsStagedPrompting:(BOOL)a3
{
  self->_supportsStagedPrompting = a3;
}

- (unint64_t)downgradeAuthRight
{
  return self->_downgradeAuthRight;
}

- (void)setDowngradeAuthRight:(unint64_t)a3
{
  self->_downgradeAuthRight = a3;
}

- (NSDictionary)authSpecificNotificationExtensionBundleIdentifier
{
  return self->_authSpecificNotificationExtensionBundleIdentifier;
}

- (void)setAuthSpecificNotificationExtensionBundleIdentifier:(id)a3
{
}

- (NSString)alternatePromptTitleEntitlement
{
  return self->_alternatePromptTitleEntitlement;
}

- (void)setAlternatePromptTitleEntitlement:(id)a3
{
}

- (NSNumber)macos_minimumSDKVersionNumber
{
  return self->_macos_minimumSDKVersionNumber;
}

- (void)setMacos_minimumSDKVersionNumber:(id)a3
{
}

- (NSDictionary)macos_minimumSDKVersionNumberAuthSpecific
{
  return self->_macos_minimumSDKVersionNumberAuthSpecific;
}

- (void)setMacos_minimumSDKVersionNumberAuthSpecific:(id)a3
{
}

- (BOOL)macos_pardonMissingUsage
{
  return self->_macos_pardonMissingUsage;
}

- (void)setMacos_pardonMissingUsage:(BOOL)a3
{
  self->_macos_pardonMissingUsage = a3;
}

- (NSString)macos_helpAnchor
{
  return self->_macos_helpAnchor;
}

- (void)setMacos_helpAnchor:(id)a3
{
}

- (BOOL)macos_isPerSystem
{
  return self->_macos_isPerSystem;
}

- (void)setMacos_isPerSystem:(BOOL)a3
{
  self->_macos_isPerSystem = a3;
}

- (TCCDService)macos_compositionChildService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_macos_compositionChildService);
  return (TCCDService *)WeakRetained;
}

- (void)setMacos_compositionChildService:(id)a3
{
}

- (BOOL)macos_compositionPromoteChildAuthorizationToParent
{
  return self->_macos_compositionPromoteChildAuthorizationToParent;
}

- (void)setMacos_compositionPromoteChildAuthorizationToParent:(BOOL)a3
{
  self->_macos_compositionPromoteChildAuthorizationToParent = a3;
}

- (void)setMacos_compositionParentService:(id)a3
{
}

- (BOOL)macos_hasIndirectObject
{
  return self->_macos_hasIndirectObject;
}

- (void)setMacos_hasIndirectObject:(BOOL)a3
{
  self->_macos_hasIndirectObject = a3;
}

- (BOOL)macos_shouldAllowSameTeam
{
  return self->_macos_shouldAllowSameTeam;
}

- (void)setMacos_shouldAllowSameTeam:(BOOL)a3
{
  self->_macos_shouldAllowSameTeam = a3;
}

- (NSString)macos_hardenedRuntimeEntitlementName
{
  return self->_macos_hardenedRuntimeEntitlementName;
}

- (void)setMacos_hardenedRuntimeEntitlementName:(id)a3
{
}

- (int64_t)macos_AXControlComputerAccessType
{
  return self->_macos_AXControlComputerAccessType;
}

- (void)setMacos_AXControlComputerAccessType:(int64_t)a3
{
  self->_macos_AXControlComputerAccessType = a3;
}

- (id)promptAuthorizationChoiceBlock
{
  return objc_getProperty(self, a2, 624, 1);
}

- (void)setPromptAuthorizationChoiceBlock:(id)a3
{
}

- (id)promptButtonLocalizationKeyBlock
{
  return objc_getProperty(self, a2, 632, 1);
}

- (void)setPromptButtonLocalizationKeyBlock:(id)a3
{
}

- (id)syncAuthorizationTranslationBlock
{
  return objc_getProperty(self, a2, 640, 1);
}

- (void)setSyncAuthorizationTranslationBlock:(id)a3
{
}

- (id)recordAnalyticsPopulationBlock
{
  return objc_getProperty(self, a2, 648, 1);
}

- (void)setRecordAnalyticsPopulationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recordAnalyticsPopulationBlock, 0);
  objc_storeStrong(&self->_syncAuthorizationTranslationBlock, 0);
  objc_storeStrong(&self->_promptButtonLocalizationKeyBlock, 0);
  objc_storeStrong(&self->_promptAuthorizationChoiceBlock, 0);
  objc_storeStrong((id *)&self->_macos_hardenedRuntimeEntitlementName, 0);
  objc_destroyWeak((id *)&self->_macos_compositionParentService);
  objc_destroyWeak((id *)&self->_macos_compositionChildService);
  objc_storeStrong((id *)&self->_macos_helpAnchor, 0);
  objc_storeStrong((id *)&self->_macos_minimumSDKVersionNumberAuthSpecific, 0);
  objc_storeStrong((id *)&self->_macos_minimumSDKVersionNumber, 0);
  objc_storeStrong((id *)&self->_alternatePromptTitleEntitlement, 0);
  objc_storeStrong((id *)&self->_authSpecificNotificationExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_vOS_minimumSDKVersionNumberAuthSpecific, 0);
  objc_storeStrong((id *)&self->_tvOS_minimumSDKVersionNumberAuthSpecific, 0);
  objc_storeStrong((id *)&self->_watchOS_minimumSDKVersionNumberAuthSpecific, 0);
  objc_storeStrong((id *)&self->_iOS_minimumSDKVersionNumberAuthSpecific, 0);
  objc_storeStrong((id *)&self->_vOS_minimumSDKVersionNumber, 0);
  objc_storeStrong((id *)&self->_tvOS_minimumSDKVersionNumber, 0);
  objc_storeStrong((id *)&self->_watchOS_minimumSDKVersionNumber, 0);
  objc_storeStrong((id *)&self->_iOS_minimumSDKVersionNumber, 0);
  objc_storeStrong((id *)&self->_ios_watchKitUserNotificationNumber, 0);
  objc_storeStrong((id *)&self->_notificationButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_notificationTitleTextLocalizationKey, 0);
  objc_destroyWeak((id *)&self->_subsequentRequestStringsRelatedService);
  objc_storeStrong((id *)&self->_requestNotificationExtensionTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestAdditionalTextForSubsequentRequestsLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestAdditionalTextAfterV2UpgradeLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestAdditionalTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_reminderLimitedButtonTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_reminderAllowButtonTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_reminderTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestUpgradeTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestEntitlementTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestLimitedTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestAddTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_settingsRequestFullTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestFullTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestTitleTextForSubsequentRequestsKey, 0);
  objc_storeStrong((id *)&self->_requestTitleTextAfterV2UpgradeLocalizationKey, 0);
  objc_storeStrong((id *)&self->_requestTitleTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subsequentRequestDenyAuthorizationButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subsequentRequestAllowAuthorizationButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_cancelButtontitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_sessionPidAuthorizationButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_addModifyAddedAuthorizationButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_limitedAuthorizationButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_moreAuthorizationOptionsButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_denyAuthorizationButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_allowAuthorizationButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_defaultLocalizedResourcesBundle, 0);
  objc_storeStrong((id *)&self->_localizedResourcesBundle, 0);
  objc_storeStrong((id *)&self->_localizedResourcesBundlePath, 0);
  objc_storeStrong((id *)&self->_alertManager, 0);
  objc_storeStrong((id *)&self->_firstStagePromptHeaderAssetName, 0);
  objc_storeStrong((id *)&self->_firstStagePromptHeaderAssetCatalogPath, 0);
  objc_storeStrong((id *)&self->_expirySeconds, 0);
  objc_storeStrong((id *)&self->_defaultAllowedPlatformIdentifiersList, 0);
  objc_storeStrong((id *)&self->_sandboxOperationForDelegation, 0);
  objc_storeStrong((id *)&self->_notificationActionURL, 0);
  objc_storeStrong((id *)&self->_disallowedOnPlatformSubtypeNameList, 0);
  objc_storeStrong((id *)&self->_addAccessUsageDescriptionKeyName, 0);
  objc_storeStrong((id *)&self->_fullAccessUsageDescriptionKeyName, 0);
  objc_storeStrong((id *)&self->_secondaryUsageDescriptionKeyName, 0);
  objc_storeStrong((id *)&self->_usageDescriptionKeyName, 0);
  objc_storeStrong((id *)&self->_externalName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_validOnPlatformNames, 0);
  objc_storeStrong((id *)&self->_platformAvailability, 0);
}

@end